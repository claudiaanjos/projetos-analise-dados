/* -----------------------
   B - Análise dos Dados
   -----------------------*/

-- Quantos clientes o Foodie-Fi já teve?

SELECT 
   count(DISTINCT customer_id) 
   AS quantidade_clientes
FROM `projetosql-401620.foodie.subscriptions`;


-- Qual é a distribuição mensal dos valores de *start_date* para o plano de teste (*trial*) 
-- em nosso conjunto de dados - utilize o início do mês como valor de agrupamento.

SELECT 
   EXTRACT(MONTH FROM start_date) AS numero_mes,
   FORMAT_DATE('%B', start_date)  AS nome_mes,
   count(p.plan_id)               AS total_planos
FROM `projetosql-401620.foodie.subscriptions` s 
JOIN `projetosql-401620.foodie.plans`         p
ON s.plan_id = p.plan_id
WHERE p.plan_id = 0
GROUP BY numero_mes, nome_mes
ORDER BY numero_mes;


-- Quais valores de *start_date* do plano ocorrem após o ano de 2020 para nosso conjunto de dados? 
-- Mostre a contagem de eventos para cada *plan_name*.

SELECT 
   p.plan_name      AS tipo_plano,
   count(s.plan_id) AS quantidade
FROM `projetosql-401620.foodie.subscriptions` s 
JOIN `projetosql-401620.foodie.plans`         p
ON s.plan_id = p.plan_id
WHERE s.start_date >= '2021-01-01'
GROUP BY tipo_plano
ORDER BY quantidade;


-- Qual é a contagem de clientes e a porcentagem de clientes que cancelaram, 
-- arredondada para uma casa decimal?

SELECT 
   count(distinct customer_id) AS total_churn,
   round((count(distinct customer_id)*100)/
   (SELECT count(distinct customer_id) 
   FROM `projetosql-401620.foodie.subscriptions`), 1) 
   AS porcentagem
FROM `projetosql-401620.foodie.subscriptions`
WHERE plan_id = 4;


-- Quantos clientes cancelaram imediatamente após o teste gratuito inicial 
-- qual é a porcentagem disso, arredondada para o número inteiro mais próximo?

WITH churn_cte AS (
   SELECT *,
      LAG(plan_id, 1) 
      OVER(PARTITION BY customer_id ORDER BY plan_id) 
      AS plano_anterior
  FROM `projetosql-401620.foodie.subscriptions`)

SELECT 
   count(plano_anterior) AS total_churn, 
   round(Count(*) * 100 / 
   (SELECT count(DISTINCT customer_id) 
   FROM `projetosql-401620.foodie.subscriptions`)) 
   AS porcentagem
FROM churn_cte
WHERE plan_id = 4 AND plano_anterior = 0;


-- Qual é o número e a porcentagem de planos dos clientes após o teste gratuito inicial?

WITH churn_cte AS (
  SELECT *,
  LAG(plan_id, 1) 
  OVER(PARTITION BY customer_id ORDER BY plan_id) 
  AS plano_anterior
  FROM `projetosql-401620.foodie.subscriptions`)

SELECT 
  p.plan_name           AS plano,
  count(plano_anterior) AS total, 
  round(count(*) * 100 / 
  (SELECT count(DISTINCT customer_id) 
  FROM `projetosql-401620.foodie.subscriptions`)) 
  AS porcentagem
FROM churn_cte c
JOIN `projetosql-401620.foodie.plans` p
ON c.plan_id = p.plan_id
WHERE plano_anterior = 0
GROUP BY plano
ORDER BY porcentagem DESC;


-- Qual é a quantidade de clientes e a porcentagem de cada um dos 5 
-- tipos de planos em 31 de dezembro de 2020?

WITH cte AS (
   SELECT 
   s.customer_id AS cliente,
   p.plan_name   AS plano,
   LEAD(p.plan_name,1) 
   OVER (PARTITION BY s.customer_id ORDER BY s.start_date) 
   AS proximo_plano 
FROM `projetosql-401620.foodie.subscriptions` s
JOIN `projetosql-401620.foodie.plans` p
ON s.plan_id = p.plan_id
WHERE start_date <= '2020-12-31')

SELECT 
   plano, 
   count(DISTINCT cliente) AS total_clientes,
   round(100 * count(DISTINCT cliente)) /
   (SELECT count(DISTINCT customer_id) 
   FROM `projetosql-401620.foodie.subscriptions`) 
   AS porcentagem
FROM cte
WHERE proximo_plano IS NULL 
GROUP BY plano
ORDER BY porcentagem;


-- Quantos clientes fizeram upgrade para um plano anual em 2020?

SELECT 
   count(distinct customer_id) AS quantidade
FROM `projetosql-401620.foodie.subscriptions` 
WHERE plan_id = 3
AND start_date <= '2020-12-31';


-- Quantos dias, em média, um cliente leva para fazer upgrade para um plano anual desde o dia em 
-- que se inscreve no Foodie-Fi?

WITH cte AS (
   SELECT 
   customer_id AS cliente,
   start_date  AS data_plano
FROM `projetosql-401620.foodie.subscriptions`
WHERE plan_id = 3)

SELECT 
   round(avg(DATE_DIFF(c.data_plano, s.start_date, DAY))) 
   AS media_dias
FROM `projetosql-401620.foodie.subscriptions` s
JOIN cte c
ON s.customer_id = c.cliente
WHERE s.plan_id = 0;


-- É possível dividir ainda mais esse valor médio em períodos de 30 dias 
-- (por exemplo, 0-30 dias, 31-60 dias, etc.)?

WITH plano_teste AS 
(
   SELECT 
   customer_id AS cliente, 
   start_date  AS data_teste
   FROM `projetosql-401620.foodie.subscriptions`
   WHERE plan_id = 0
),

plano_anual AS (
   SELECT 
   customer_id AS cliente, 
   start_date  AS data_anual
   FROM `projetosql-401620.foodie.subscriptions`
   WHERE plan_id = 3
)

SELECT
   CONCAT(
      CAST(FLOOR(DATE_DIFF(data_anual, data_teste, DAY) / 30) * 30 AS STRING),
      '-',
      CAST((FLOOR(DATE_DIFF(data_anual, data_teste, DAY) / 30) * 30 + 30) AS STRING),
      ' dias') AS periodo,
   count(*) AS total_clientes,
   round(avg(DATE_DIFF(data_anual, data_teste, DAY)), 0) AS media_dias
FROM plano_teste pt
JOIN plano_anual pa 
ON pt.cliente = pa.cliente
WHERE data_anual IS NOT NULL
GROUP BY periodo
ORDER BY media_dias;


-- Quantos clientes fizeram downgrade de um plano mensal premium para um plano mensal básico em 2020?

WITH cte AS (
    SELECT 
    customer_id AS cliente,
    start_date  AS data_plano,
    plan_id     AS plano, 
    LEAD(plan_id,1) 
    OVER(PARTITION BY customer_id ORDER BY start_date) 
    AS proximo_plano
FROM `projetosql-401620.foodie.subscriptions`
WHERE start_date <= '2020-12-31')

SELECT 
    count(cliente) AS total_clientes
FROM cte
WHERE plano = 2 AND proximo_plano = 1;