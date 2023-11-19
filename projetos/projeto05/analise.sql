/* ----------------------------
   Perguntas do estudo de caso
   ----------------------------*/

-- Qual é o valor total gasto por cada cliente no restaurante?

SELECT
  	sales.customer_id AS cliente_id,
    sum(price)        AS total_gasto 
FROM       dannys_diner.sales  sales
INNER JOIN dannys_diner.menu   menu
ON sales.product_id = menu.product_id
GROUP BY cliente_id;


-- Quantos dias cada cliente visitou o restaurante?

SELECT 
  	customer_id                 AS cliente_id,
    count(DISTINCT order_date)  AS total_visitas 
FROM dannys_diner.sales sales
GROUP BY cliente_id;


-- Qual foi o primeiro item do cardápio comprado por cada cliente?

WITH primeiro_ranking AS (
	SELECT 
		sales.customer_id, 
  		sales.order_date, 
  		menu.product_name,
		dense_rank() OVER (PARTITION BY sales.customer_id ORDER BY sales.order_date) AS dr
	FROM       dannys_diner.sales  sales
	INNER JOIN dannys_diner.menu   menu 
	ON sales.product_id = menu.product_id);

SELECT 
  	customer_id  AS cliente_id,
    product_name AS primeiro_produto_adquirido 
FROM primeiro_ranking
WHERE dr = 1
GROUP BY cliente_id, primeiro_produto_adquirido;


-- Qual é o item mais comprado no cardápio e quantas vezes foi pedido por todos os clientes?

SELECT 
	menu.product_name       AS "item mais comprado", 
	count(sales.product_id) AS "quantidade de compras"
FROM       dannys_diner.sales  sales
INNER JOIN dannys_diner.menu   menu
ON sales.product_id = menu.product_id
GROUP BY menu.product_name
ORDER BY count(sales.product_id) DESC
LIMIT 1;


-- Qual item foi mais popular para cada cliente?

WITH popular AS (
	SELECT 
  		sales.customer_id        AS cliente_id, 
  		menu.product_name        AS produto, 
  		count(sales.product_id)  AS quantidade_comprada,
		dense_rank() OVER (PARTITION BY sales.customer_id ORDER BY count(sales.product_id) DESC) AS dr
	FROM       dannys_diner.sales  sales
	INNER JOIN dannys_diner.menu   menu 
	ON sales.product_id = menu.product_id
	GROUP BY sales.customer_id, menu.product_name);
	
SELECT 
	cliente_id, 
	produto, 
	quantidade_comprada
FROM popular
WHERE dr = 1;


-- Qual foi o primeiro item adquirido por cada cliente após tornar-se membro?

WITH primeira_compra AS (
	SELECT 
  		sales.customer_id, 
  		sales.product_id,
		row_number() OVER (PARTITION BY sales.customer_id ORDER BY sales.order_date) AS rn
	FROM       dannys_diner.sales     sales
	INNER JOIN dannys_diner.members   members  
	ON sales.customer_id = members.customer_id AND
	sales.order_date > members.join_date
);

SELECT 
	customer_id  AS cliente_id, 
    product_name AS produto
FROM primeira_compra 
INNER JOIN dannys_diner.menu   menu 
ON primeira_compra.product_id = menu.product_id
WHERE rn = 1
ORDER BY cliente_id ASC;


-- Qual item foi adquirido antes de o cliente se tornar um membro?

WITH comprado AS (
	SELECT 
  		sales.customer_id, 
  		menu.product_name,
		dense_rank() OVER (PARTITION BY sales.customer_id ORDER BY sales.order_date DESC) AS dr
	FROM       dannys_diner.sales  sales
	INNER JOIN dannys_diner.menu   menu 
	ON sales.product_id = menu.product_id
	INNER JOIN dannys_diner.members members 
	ON sales.customer_id = members.customer_id
	WHERE sales.order_date < members.join_date);

SELECT 
	customer_id  AS cliente_id, 
    product_name AS produto_comprado_antes_ser_membro
FROM comprado
WHERE dr = 1;


-- Qual é o total de itens e valor gasto por cada membro antes de se tornarem membros?

SELECT 
	sales.customer_id        AS cliente_id,
	count(menu.product_name) AS total_itens,
	sum(menu.price)          AS valor_gasto
FROM       dannys_diner.sales  sales
INNER JOIN dannys_diner.menu   menu 
ON sales.product_id = menu.product_id
INNER JOIN dannys_diner.members members
ON sales.customer_id = members.customer_id
WHERE sales.order_date < members.join_date
GROUP BY cliente_id
ORDER BY cliente_id ASC;

/* 
Se cada $1 gasto equivale a 10 pontos e o sushi tem um multiplicador de pontos de 2x, 
quantos pontos cada cliente teria?
*/

SELECT 
	sales.customer_id AS cliente_id,
	sum(
		CASE
			WHEN menu.product_name = 'sushi' 
      		THEN menu.price * 10 * 2
			ELSE menu.price * 10
		END) AS pontos
FROM       dannys_diner.sales  sales
INNER JOIN dannys_diner.menu   menu  
ON sales.product_id = menu.product_id
GROUP BY cliente_id
ORDER BY cliente_id ASC;

/*
Durante a primeira semana após a adesão de um cliente ao programa (incluindo a data de inscrição), 
eles recebem pontos em dobro em todos os itens, não se limitando ao sushi. 
Ao considerar essa promoção, quantos pontos os clientes A e B acumulariam no final de janeiro?
*/

WITH pontuacao AS (
	SELECT 
    	sales.customer_id   AS cliente_id, 
    	menu.product_name   AS produto, 
    	menu.price          AS valor, 
    	sales.order_date    AS data_pedido, 
    	members.join_date   AS adesao, 
    	join_date +6        AS uma_semana
  	FROM dannys_diner.sales AS sales
  	JOIN dannys_diner.menu  AS menu
    ON sales.product_id = menu.product_id
   	JOIN dannys_diner.members AS members
    ON sales.customer_id = members.customer_id);

SELECT
  sum(CASE
    	WHEN data_pedido >= adesao AND data_pedido <= uma_semana 
		THEN valor * 20
    	WHEN produto = 'sushi' 
		THEN valor * 20
    	ELSE valor * 10
  	END) AS pontos,
  cliente_id
FROM pontuacao
WHERE data_pedido < '2021-02-01'
GROUP BY cliente_id;


-- Organização das Informações

CREATE VIEW status_membro AS
SELECT 
    sales.customer_id  AS cliente_id, 
    sales.order_date   AS data_pedido, 
    menu.product_name  AS produto, 
    menu.price         AS valor,
    CASE 
		WHEN members.join_date > sales.order_date 
		THEN 'Não'
        WHEN members.join_date <= sales.order_date 
		THEN 'Sim'
        ELSE 'Não' 
	END AS membro
FROM      dannys_diner.sales sales
LEFT JOIN dannys_diner.menu  menu 
ON sales.product_id = menu.product_id
LEFT JOIN dannys_diner.members members
ON sales.customer_id = members.customer_id
ORDER BY cliente_id, data_pedido;

SELECT * FROM status_membro;


-- Precisamos de mais informações sobre a classificação dos produtos do cliente, com exceção de não membros. 
-- Portanto, esperamos valores de classificação nulos para os registros quando os clientes ainda não fazem parte do programa de fidelidade.

SELECT 
	*,
	CASE 
		WHEN membro = 'Não' 
		THEN NULL
    	ELSE dense_rank() OVER (PARTITION BY cliente_id, membro ORDER BY data_pedido) 
	END AS ranking
FROM status_membro;