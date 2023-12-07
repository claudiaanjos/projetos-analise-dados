# Pagamentos

A equipe do Foodie-Fi deseja que você crie uma nova tabela de pagamentos (*payments*) para o ano de 2020, incluindo os valores pagos por cada cliente na tabela *subscriptions* com os seguintes requisitos:

* Pagamentos mensais sempre ocorrem no mesmo dia do mês que a data de início original de qualquer plano pago mensalmente.
* Upgrades de planos básicos para mensais ou premium são reduzidos pelo valor atualmente pago naquele mês e começam imediatamente.
* Upgrades de planos mensais premium para anuais premium são pagos no final do período de faturamento atual e também começam no final do período do mês.
* Uma vez que um cliente cancela, eles não farão mais pagamentos.

&nbsp;

Foram realizados os passos descritos abaixo.

* Criação da Tabela: 

Foi criada uma nova tabela chamada payments no dataset foodie do projeto projetosql-401620.

* Common Table Expression (CTE):

Uma CTE chamada payment_data foi definida para organizar a lógica da consulta principal e melhorar a legibilidade.

* Seleção de Dados:

A CTE payment_data foi construída a partir das tabelas *subscriptions* e *plans* usando um LEFT JOIN para garantir que todas as inscrições sejam consideradas.

O CASE foi utilizado para determinar a data de pagamento com base no tipo de plano (mensal ou anual).

O RANK() foi aplicado para atribuir uma ordem de pagamento com base na data de início.

* Seleção Final:

A consulta final seleciona os resultados da CTE payment_data.

A seleção foi filtrada para incluir apenas pagamentos do ano de 2020.

Os resultados foram ordenados por customer_id, plan_id, e payment_order.

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto07/images/image13.png" width="60%"/>

&nbsp;

| customer_id | plan_id | plan_name     | payment_date | amount | payment_order |
|-------------|---------|---------------|--------------|--------|---------------|
|      1      |    1    | basic monthly | 2020-08-08   |  9.90  |       1       |
|      1      |    1    | basic monthly | 2020-09-08   |  9.90  |       2       |
|      1      |    1    | basic monthly | 2020-10-08   |  9.90  |       3       |
|      1      |    1    | basic monthly | 2020-11-08   |  9.90  |       4       |
|      1      |    1    | basic monthly | 2020-12-08   |  9.90  |       5       |
|      2      |    3    | pro annual     | 2020-09-27   | 199.00 |       1       |
|     13      |    1    | basic monthly | 2020-12-22   |  9.90  |       1       |
|     15      |    2    | pro monthly   | 2020-03-24   | 19.90 |       1       |
|     15      |    2    | pro monthly   | 2020-04-24   | 19.90 |       2       |
|     16      |    1    | basic monthly | 2020-06-07   |  9.90  |       1       |
|     16      |    1    | basic monthly | 2020-07-07   |  9.90  |       2       |
|     16      |    1    | basic monthly | 2020-08-07   |  9.90  |       3       |
|     16      |    1    | basic monthly | 2020-09-07   |  9.90  |       4       |
|     16      |    1    | basic monthly | 2020-10-07   |  9.90  |       5       |
|     16      |    3    | pro annual     | 2020-10-21   | 189.10 |       6       |
|     18      |    2    | pro monthly   | 2020-07-13   | 19.90 |       1       |
|     18      |    2    | pro monthly   | 2020-08-13   | 19.90 |       2       |
|     18      |    2    | pro monthly   | 2020-09-13   | 19.90 |       3       |
|     18      |    2    | pro monthly   | 2020-10-13   | 19.90 |       4       |
|     18      |    2    | pro monthly   | 2020-11-13   | 19.90 |       5       |
|     18      |    2    | pro monthly   | 2020-12-13   | 19.90 |       6       |
|     19      |    2    | pro monthly   | 2020-06-29   | 19.90 |       1       |
|     19      |    2    | pro monthly   | 2020-07-29   | 19.90 |       2       |
|     19      |    3    | pro annual     | 2020-08-29   | 199.00 |       3       |