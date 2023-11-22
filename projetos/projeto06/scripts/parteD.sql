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

WITH total_sem_taxas AS (
SELECT 
   sum(
      CASE
         WHEN tcoe.pizza_id = 1 THEN 12
         ELSE 10
      END)          AS total,
      tcoe.extras   AS extras,
      tcoe.order_id AS pedido
FROM temp_runner_orders          AS tro
JOIN temp_customer_orders_extras AS tcoe 
ON tcoe.order_id = tro.order_id
WHERE tro.distance IS NOT NULL)

SELECT 
   sum(
      CASE 
         WHEN extras != '' THEN 1 
         ELSE 0 
      END) + SUM(total) AS valor_total
FROM total_sem_taxas;


-- A equipe do Pizza Runner agora deseja adicionar um sistema de classificação adicional que permita aos clientes avaliar seu corredor. Como você projetaria uma tabela adicional para esse novo conjunto de dados - gere um esquema para essa nova tabela e insira seus próprios dados para classificações de cada cliente bem-sucedido ordem entre 1 e 5.



-- Usando sua tabela recém-gerada - você pode unir todas as informações para formar uma tabela que contenha as seguintes informações para entregas bem-sucedidas? Informações: customer_id, order_id, runner_id, rating, order_time, pickup_time, Time between order and pickup, Delivery duration, Average speed, Total number of pizzas



-- Se uma pizza Meat Lovers custasse $ 12 e uma vegetariana $ 10, preços fixos sem custo para extras e cada corredor recebesse $ 0,30 por quilômetro percorrido - quanto dinheiro o Pizza Runner sobrou após essas entregas?



-- Extra

/*Se Danny quiser expandir sua variedade de pizzas, como isso afetaria o design de dados existente? 
Escreva uma declaração INSERT para demonstrar o que aconteceria se uma nova Supremepizza com todos 
os ingredientes fosse adicionada ao menu do Pizza Runner.*/



