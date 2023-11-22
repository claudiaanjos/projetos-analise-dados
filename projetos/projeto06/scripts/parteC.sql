/* -------------------------------
   C - Otimização de ingredientes
   -------------------------------*/


/* Antes de iniciar as análises, optamos por criar três tabelas temporárias para melhorar a organização dos dados. 
Temos as seguintes tabelas temporárias:
- temp_pizza_recipes: separamos as coberturas (toppings) associadas a cada tipo de pizza. 
- temp_customer_orders_extras*: separamos os ingredientes adicionados de cada pedido.
- temp_customer_orders_exclusions*: separamos os ingredientes excluídos de cada pedido.*/


-- Tabela auxiliar com uma sequência de números para divivir valores em outras operações
DROP   TEMPORARY TABLE IF EXISTS Numbers;
CREATE TEMPORARY TABLE Numbers (n INT);
INSERT INTO Numbers VALUES (1), (2), (3), (4), (5), (6), (7), (8); 


-- Tabela temp_pizza_recipes
DROP   TEMPORARY TABLE IF EXISTS temp_pizza_recipes;
CREATE TEMPORARY TABLE temp_pizza_recipes AS
SELECT 
   pizza_id,
   TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(toppings, ',', Numbers.n), ',', -1)) AS topping
FROM pizza_recipes
JOIN Numbers 
ON CHAR_LENGTH(toppings) - CHAR_LENGTH(REPLACE(toppings, ',', '')) >= Numbers.n - 1;


-- Tabela temp_customer_orders_extras
DROP   TEMPORARY TABLE IF EXISTS temp_customer_orders_extras;
CREATE TEMPORARY TABLE temp_customer_orders_extras AS
SELECT 
   order_id,
   customer_id,
   pizza_id,
   order_date,
   TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(extras, ',', Numbers.n), ',', -1)) AS extras
FROM temp_customer_orders
JOIN Numbers 
ON CHAR_LENGTH(extras) - CHAR_LENGTH(REPLACE(extras, ',', '')) >= Numbers.n - 1;


-- Tabela temp_customer_orders_exclusions
DROP   TEMPORARY TABLE IF EXISTS temp_customer_orders_exclusions;
CREATE TEMPORARY TABLE temp_customer_orders_exclusions AS
SELECT 
   order_id,
   customer_id,
   pizza_id,
   order_date,
   TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(exclusions, ',', Numbers.n), ',', -1)) AS exclusions
FROM temp_customer_orders
JOIN Numbers 
ON CHAR_LENGTH(exclusions) - CHAR_LENGTH(REPLACE(exclusions, ',', '')) >= Numbers.n - 1;


-- Quais são os ingredientes padrão para cada pizza?

--Opção em linhas individuais
SELECT 
   pn.pizza_name        AS pizza,
   pt.topping_name      AS ingrediente
FROM temp_pizza_recipes AS tpr
JOIN pizza_names        AS pn
ON tpr.pizza_id = pn.pizza_id
JOIN pizza_toppings     AS pt
ON tpr.topping = pt.topping_id
ORDER BY pizza;

--Opção na mesma linha
SELECT 
   pn.pizza_name AS pizza,
   GROUP_CONCAT(pt.topping_name ORDER BY pt.topping_id ASC) AS ingredientes
FROM temp_pizza_recipes AS tpr
JOIN pizza_names        AS pn 
ON tpr.pizza_id = pn.pizza_id
JOIN pizza_toppings     AS pt 
ON tpr.topping = pt.topping_id
GROUP BY pn.pizza_name
ORDER BY pizza;


-- Qual foi o extra mais adicionado?

SELECT 
   pt.topping_name     AS ingrediente,
   count(tcoe.extras)  AS quantidade
FROM temp_customer_orders_extras AS tcoe
JOIN pizza_toppings              AS pt  
ON tcoe.extras = pt.topping_id
GROUP BY ingrediente
ORDER BY quantidade DESC;


-- Qual foi a exclusão mais comum?

SELECT 
   pt.topping_name          AS ingrediente,
   count(tcoe.exclusions)   AS quantidade
FROM temp_customer_orders_exclusions AS tcoe
JOIN pizza_toppings                  AS pt  
ON tcoe.exclusions = pt.topping_id
GROUP BY ingrediente
ORDER BY quantidade DESC;


-- Gere um item de pedido para cada registro na tabela customers_orders

SELECT
   tco.order_id   AS pedido,
   pn.pizza_name  AS pizza,
   CASE
      WHEN tco.pizza_id = 1 AND exclusions = '4'    AND extras = ''     THEN 'Exclude Cheese'
      WHEN tco.pizza_id = 1 AND exclusions = '4'    AND extras = '1, 5' THEN 'Exclude Cheese - Extra Bacon, Chicken'
      WHEN tco.pizza_id = 1 AND exclusions = '2, 6' AND extras = '1, 4' THEN 'Exclude BBQ Sauce, Mushroons - Extra Bacon, Cheese'
      WHEN tco.pizza_id = 1 AND exclusions = ''     AND extras = '1'    THEN 'Extra Bacon'
   ELSE ''
   END AS observacao_meat_lovers
FROM temp_customer_orders AS tco
JOIN pizza_names          AS pn 
ON tco.pizza_id = pn.pizza_id;