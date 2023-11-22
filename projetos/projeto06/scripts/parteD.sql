/* ---------------------------
   D - Preços e classificações
   ---------------------------*/


-- Se uma pizza Meat Lovers custa $ 12 e Vegetariana custa $ 10 e não houve cobrança por alterações 
-- quanto dinheiro o Pizza Runner ganhou até agora se não houver taxas de entrega?

SELECT 
   sum(
      CASE
         WHEN tco.pizza_id = 1 THEN 12
         ELSE 10
      END) AS total
FROM temp_runner_orders   AS tro
JOIN temp_customer_orders AS tco 
ON tco.order_id = tro.order_id
WHERE tro.distance IS NOT NULL;


-- E se houvesse uma cobrança adicional de US$ 1 por quaisquer extras de pizza? Adicionar queijo custa $ 1 extra

-- Tabela temporária para o total sem taxas
CREATE TEMPORARY TABLE temp_faturamento_sem_taxas AS
SELECT 
   sum(
      CASE
         WHEN tco.pizza_id = 1 THEN 12
         ELSE 10
      END) AS total
FROM temp_runner_orders   AS tro
JOIN temp_customer_orders AS tco 
ON tco.order_id = tro.order_id
WHERE tro.distance IS NOT NULL;

-- Tabela temporária para o total de extras
CREATE TEMPORARY TABLE temp_faturamento_extras AS
SELECT 
   count(tcoe.extras) AS total_extras
FROM temp_runner_orders          AS tro
JOIN temp_customer_orders_extras AS tcoe 
ON tcoe.order_id = tro.order_id
WHERE tro.distance IS NOT NULL AND tcoe.extras != '';

-- Combinação dos resultados das tabelas temporárias
SELECT 
   (SELECT total FROM temp_faturamento_sem_taxas) + 
   (SELECT total_extras FROM emp_faturamento_extras) 
   AS total_geral;

-- Limpeza das tabelas temporárias
DROP TEMPORARY TABLE IF EXISTS temp_faturamento_sem_taxas;
DROP TEMPORARY TABLE IF EXISTS temp_faturamento_extras;


-- Crie uma nova tabela e insira dados de avaliação para cada pedido bem-sucedido do cliente, atribuindo notas de 1 a 5 ao runner.

DROP TABLE IF EXISTS runner_ratings;
CREATE TABLE ratings (order_id int, rating int);

INSERT INTO runner_ratings VALUES 
(1, 3), (2, 5), (3, 4), (4, 2), (5,3), (7, 3), (8, 4), (10, 5);

SELECT
   order_id AS pedido,
   rating   AS avaliacao
FROM runner_ratings;


/*Nova tabela que contenha as seguintes informações para entregas bem-sucedidas: 
customer_id, order_id, runner_id, rating, order_time, pickup_time, Time between order and pickup, 
Delivery duration, Average speed, Total number of pizzas*/

SELECT
   tco.customer_id                                   AS cliente,
   tro.order_id                                      AS pedido,
   tro.runner_id                                     AS runner,
   rr.rating                                         AS avaliacao_runner,
   tro.pickup_time                                   AS retirada_pedido,
   MINUTE(TIMEDIFF(tco.order_date, tro.pickup_time)) AS preparo_min,
   tro.duration                                      AS duracao_entrega,
   round(avg((distance/duration)*60), 2)             AS vel_media,
   count(tco.pizza_id)                               AS total_pizzas
FROM temp_customer_orders AS tco
JOIN temp_runner_orders   AS tro
ON tco.order_id = tro.order_id
JOIN runner_ratings       AS rr
ON tco.order_id = rr.order_id
WHERE tro.distance IS NOT NULL
GROUP BY pedido
ORDER BY cliente;


-- Se uma pizza Meat Lovers custasse $ 12 e uma vegetariana $ 10, preços fixos sem custo para extras e 
-- cada runner recebesse $ 0,30 por quilômetro percorrido - quanto dinheiro o Pizza Runner sobrou após essas entregas?

SET @total_price_pizza = 138;
SELECT
   round(@total_price_pizza - (sum(distance))*0.30 ,2) 
   AS faturamento
FROM temp_runner_orders;