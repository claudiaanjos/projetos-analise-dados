/* ----------------------------------
   A - Métricas dos pedidos de pizza
   ----------------------------------*/


-- Quantas pizzas foram pedidas?

SELECT 
	count(order_id)    AS total_pizzas
FROM temp_customer_orders;


-- Quantos pedidos de clientes exclusivos foram feitos?

SELECT 
	count(DISTINCT order_id) AS total_pedidos_exclusivos
FROM temp_customer_orders;


-- Quantos pedidos bem-sucedidos foram entregues por cada runner?

SELECT 
	runner_id          AS runner,
	count(runner_id)   AS total_pedidos_entregues
FROM temp_runner_orders
WHERE distance IS NOT NULL
GROUP BY runner
ORDER BY total_pedidos_entregues DESC;


-- Quantas pizzas de cada tipo foram entregues?

SELECT 
	pn.pizza_name         AS tipo_pizza,
	count(pn.pizza_id)    AS total_entregue
FROM temp_customer_orders AS tco
JOIN pizza_names          AS pn
ON tco.pizza_id = pn.pizza_id
JOIN temp_runner_orders   AS tro
ON tco.order_id = tro.order_id
WHERE tro.distance IS NOT NULL
GROUP BY tipo_pizza;


-- Quantos Vegetarianos e Meatlovers foram encomendados por cada cliente?

SELECT 
	tco.customer_id        AS cliente,
	pn.pizza_name          AS tipo_pizza,
	count(pn.pizza_id)     AS total_encomendado
FROM temp_customer_orders  AS tco
JOIN pizza_names           AS pn
ON tco.pizza_id = pn.pizza_id
GROUP BY tipo_pizza, cliente
ORDER BY cliente ASC;


-- Qual foi o número máximo de pizzas entregues em um único pedido?

WITH cte_quantidade_pizza AS (
SELECT 
	tco.order_id          AS pedido,
	count(tco.order_id)   AS total_pizza
FROM temp_customer_orders AS tco
JOIN temp_runner_orders   AS tro
ON tco.order_id = tro.order_id
WHERE tro.distance IS NOT NULL
GROUP BY pedido
ORDER BY total_pizza DESC)

SELECT 
	max(total_pizza) AS num_max_pizza_entregue
FROM cte_quantidade_pizza;


-- Para cada cliente, quantas pizzas entregues tiveram pelo menos uma alteração e quantas não tiveram nenhuma alteração?

SELECT
	tco.customer_id AS cliente,
	count(
		CASE
			WHEN exclusions != '' OR extras != '' THEN 1
		END) AS total_com_alteracao,
	count(
		CASE
			WHEN exclusions = '' AND extras = '' THEN 1
		END) AS total_sem_alteracao
FROM temp_customer_orders AS tco
JOIN temp_runner_orders   AS tro
ON tco.order_id = tro.order_id
WHERE tro.distance IS NOT NULL
GROUP BY cliente;


-- Quantas pizzas foram entregues com exclusões e extras?

SELECT
	count(
		CASE
			WHEN extras != '' AND exclusions != '' THEN 1
		END) AS total_com_extras_exclusoes
FROM temp_customer_orders AS tco
JOIN temp_runner_orders   AS tro
ON tco.order_id = tro.order_id
WHERE tro.distance IS NOT NULL;


-- Qual foi o total de pizzas encomendadas para cada hora do dia?

SELECT
	HOUR(order_date) AS hora,
	count(order_id)  AS total_pizza
FROM temp_customer_orders
GROUP BY hora
ORDER BY hora;


-- Qual foi o total de pedidos para cada dia da semana?

SET lc_time_names = 'pt_BR';
SELECT
	DAYNAME(order_date) AS dia_semana,
	count(order_id)     AS total_pizza
FROM temp_customer_orders
GROUP BY dia_semana
ORDER BY total_pizza DESC;