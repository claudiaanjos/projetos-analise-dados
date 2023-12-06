/* -----------------------
   A - Jornada do Cliente
   -----------------------*/

SELECT 
   s.customer_id AS cliente, 
   p.plan_name   AS plano, 
   p.price       AS valor,
   s.start_date  AS data_plano,
   COALESCE(DATE_DIFF(s.start_date, LAG(s.start_date, 1) 
   OVER(PARTITION BY s.customer_id ORDER BY s.start_date), DAY), 0) 
   AS dias_entre_assinaturas
FROM `projetosql-401620.foodie.subscriptions` AS s
JOIN `projetosql-401620.foodie.plans`         AS p
ON s.plan_id = p.plan_id
WHERE s.customer_id IN (1,2,11,13,15,16,18,19)
ORDER BY 1;