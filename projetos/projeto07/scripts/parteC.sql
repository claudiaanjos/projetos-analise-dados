/* ---------------
   C - Pagamentos
   ---------------*/

-- Nova tabela de pagamentos (*payments*) para o ano de 2020

CREATE TABLE `projetosql-401620.foodie.payments` AS
WITH payment_data AS (
  SELECT
    s.customer_id,
    s.plan_id,
    p.plan_name,
    CASE
      WHEN p.plan_name LIKE '%monthly' 
      THEN s.start_date
      WHEN p.plan_name LIKE '%annual' AND s.plan_id = 3 
      THEN DATE_ADD(DATE_TRUNC(DATE_ADD(s.start_date, INTERVAL 1 MONTH), MONTH), INTERVAL -1 DAY)
      ELSE DATE_ADD(DATE_TRUNC(DATE_ADD(s.start_date, INTERVAL 1 MONTH), MONTH), INTERVAL -1 DAY)
    END AS payment_date,
    p.price AS amount,
    RANK() OVER (PARTITION BY s.customer_id, s.plan_id ORDER BY s.start_date) AS payment_order
  FROM `projetosql-401620.foodie.subscriptions` s
  LEFT JOIN `projetosql-401620.foodie.plans`    p 
  ON s.plan_id = p.plan_id)
SELECT
  customer_id,
  plan_id,
  plan_name,
  payment_date,
  amount,
  payment_order
FROM payment_data
WHERE EXTRACT(YEAR FROM payment_date) = 2020
ORDER BY customer_id, plan_id, payment_order;