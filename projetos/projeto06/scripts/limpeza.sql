/* ---------------------------------
   Limpeza e Transformação dos Dados
   ---------------------------------*/

/*
Para a tabela **runner_orders** realizamos as seguintes ações:

* Criamos uma tabela temporária **temp_runners_orders** e realizamos as modificações na mesma para não alterar a original;
* Na maioria das colunas, substituimos as strings 'null' por valores NULL, pois para conversão precisamos que sejam realmente nulos;
* Na coluna *cancellation*, substituimos tanto as strings 'null' quantos os valores NULL por string vazia;
* Na coluna *distance*, removemos o "km" dos valores e alteramos o tipo para DECIMAL;
* Na coluna *duration*, removemos os "mins", "minute" e "minutes" dos valores e alteramos o tipo para INT;
* Na coluna *pickup_time*, alteramos o tipo para DATETIME. */

DROP   TEMPORARY TABLE IF EXISTS temp_runner_orders;
CREATE TEMPORARY TABLE temp_runner_orders AS
SELECT 
    order_id,
    runner_id,
    CASE
        WHEN pickup_time = 'null' THEN NULL
        ELSE pickup_time
    END AS pickup_time,
    CASE
        WHEN distance LIKE '%km%'  THEN TRIM('km' FROM distance)
        WHEN distance = 'null'     THEN NULL
        ELSE distance
    END AS distance,
    CASE 
        WHEN duration = 'null'        THEN NULL
        WHEN duration LIKE '%mins'    THEN TRIM('mins'    FROM duration) 
        WHEN duration LIKE '%minute'  THEN TRIM('minute'  FROM duration)        
        WHEN duration LIKE '%minutes' THEN TRIM('minutes' FROM duration)
        ELSE duration
    END AS duration,
    CASE
        WHEN cancellation = 'null' OR cancellation IS NULL THEN ''
        ELSE cancellation
    END AS cancellation
FROM runner_orders;

-- Conferindo a nova tabela temporária
SELECT * FROM temp_runner_orders;

-- Conferindo os tipos das variáveis
DESCRIBE temp_runner_orders;

-- Modificando o tipo das variáveis
ALTER TABLE temp_runner_orders
MODIFY COLUMN pickup_time DATETIME,
MODIFY COLUMN distance DECIMAL(10,2),
MODIFY COLUMN duration INT;


/*Para a tabela **customer_orders** realizamos as seguintes ações:

* Criamos uma tabela temporária **temp_customer_orders** e realizamos as modificações na mesma para não alterar a original;
* Nas colunas *exclusions* e *extras*, que são do tipo varchar, substituimos tanto as strings 'null' quantos os valores NULL por strings vazias;*/

DROP   TEMPORARY TABLE IF EXISTS temp_customer_orders;
CREATE TEMPORARY TABLE temp_customer_orders AS
SELECT 
    order_id,
    customer_id,
    pizza_id,
    CASE
        WHEN exclusions = 'null' OR exclusions IS NULL THEN ''
        ELSE exclusions
    END AS exclusions,
    CASE
        WHEN extras = 'null' OR extras IS NULL THEN ''
        ELSE extras
    END AS extras,
    order_date
FROM customer_orders;

-- Conferindo a nova tabela temporária
SELECT * FROM temp_customer_orders;