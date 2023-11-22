/* -----------------------------------
   B - Experiência do runner e cliente
   -----------------------------------*/


-- Quantos runners se cadastraram por semana? (a semana começa 2021-01-01)

WITH runner_cadastro AS (
	SELECT
		runner_id,
		registration_date,
		registration_date - ((registration_date - DATE('2021-01-01')) % 7) 
		AS semana
	FROM runners)

SELECT 
	DATE(semana)      AS semana,
	count(runner_id)  AS total_runner
FROM runner_cadastro
GROUP BY semana
ORDER BY semana;


-- Qual foi o tempo médio em minutos que cada corredor levou para chegar ao QG da Pizza Runner para retirar o pedido?

WITH tempo_por_pedido AS (
SELECT 
	tro.order_id  AS pedido,
	tro.runner_id AS runner,
	MINUTE(TIMEDIFF(tco.order_date, tro.pickup_time)) 
	AS minutos
FROM temp_runner_orders   AS tro
JOIN temp_customer_orders AS tco
ON tro.order_id = tco.order_id
WHERE tro.duration IS NOT NULL
GROUP BY runner, pedido)

SELECT 
	runner,
	round(avg(minutos), 0) AS media_minutos
FROM tempo_por_pedido
GROUP BY runner;


-- Existe alguma relação entre a quantidade de pizzas e o tempo de preparo do pedido?

WITH total_pizza_tempo_preparo AS (
SELECT 
	tro.order_id     AS pedido,
	count(pizza_id)  AS total_pizza,
	MINUTE(TIMEDIFF(tco.order_date, tro.pickup_time)) 
	AS minutos
FROM temp_runner_orders    AS tro
JOIN temp_customer_orders  AS tco
ON tro.order_id = tco.order_id
WHERE tro.distance IS NOT NULL
GROUP BY pedido
ORDER BY total_pizza)

SELECT 
	total_pizza            AS quantidade_pizza,
	round(avg(minutos), 0) AS media_minutos_preparo
FROM total_pizza_tempo_preparo
GROUP BY total_pizza;


-- Qual foi a distância média percorrida para cada cliente?

SELECT
	tco.customer_id           AS cliente,
	round(avg(tro.distance))  AS media_distancia_km
FROM temp_customer_orders     AS tco
JOIN temp_runner_orders       AS tro
ON tro.order_id = tco.order_id
WHERE tro.distance IS NOT NULL 
GROUP BY cliente
ORDER BY media_distancia_km;


-- Qual foi a diferença entre os prazos de entrega mais longos e mais curtos para todos os pedidos?

SELECT
	MAX(duration) - MIN(duration) 
	AS difrenca_tempo_entrega
FROM temp_runner_orders;


-- Qual foi a velocidade média de cada runner para cada entrega e você percebe alguma tendência nesses valores?

-- velocidade para cada pedido
SELECT
	runner_id AS runner,
	order_id  AS pedido,
	round((distance/duration)*60, 2) AS velocidade_km_hora
FROM temp_runner_orders
WHERE distance IS NOT NULL
GROUP BY runner, pedido
ORDER BY runner;

-- quantidade de pedidos, velocidade média, máxima, mínima e desvio padrão de cada runner
WITH velocidade_runner_pedido AS (
SELECT
	runner_id AS runner,
	order_id  AS pedido,
	round((distance/duration)*60, 2) AS vel
FROM temp_runner_orders
WHERE distance IS NOT NULL
GROUP BY runner, pedido
ORDER BY runner)

SELECT
	runner,
	count(pedido)       AS pedidos,
	round(avg(vel), 2)  AS vel_media,
	CASE
		WHEN STDDEV_SAMP(vel) IS NULL THEN 0
		ELSE round(STDDEV_SAMP(vel), 2)
	END AS desvio_padrao,
	MAX(vel) AS vel_max,
	MIN(vel) AS vel_min
FROM velocidade_runner_pedido
GROUP BY runner
ORDER BY runner;


-- Qual é a porcentagem de entrega bem-sucedida para cada runner?

WITH total_entregas AS (
SELECT
	runner_id       AS runner,
	count(order_id) AS entrega,
	sum(CASE 
			WHEN distance IS NOT NULL THEN 1 
			ELSE 0 
		END) AS sucesso
FROM temp_runner_orders
GROUP BY runner
ORDER BY runner)

SELECT
	runner,
	round((sucesso*100)/entrega) AS '%_sucesso'
FROM total_entregas
GROUP BY runner
ORDER BY runner;