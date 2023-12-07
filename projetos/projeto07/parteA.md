# Jornada do Cliente

Com base na amostra dos 8 clientes na tabela *subscriptions*, descreva brevemente a jornada de integração de cada cliente. Tente manter as descrições o mais concisas possível.


A amostra dos 8 clientes encontra-se no tópico *Tabela 2: subscriptions* em Conjunto de Dados da [parte principal](). Os *custotmer_id* são: 1, 2, 11, 13, 15, 16, 18, 19. 

Realizamos as seguintes ações:

* Selecionamos as variáveis correspondentes ao identificador do cliente, plano, valor do plano e data de adesão ao plano das tabelas *subscription* e *plans*.
* Criamos uma nova variável com a diferença em dias entre a data de início da assinatura atual e a data de início da assinatura anterior para o mesmo cliente.
* Ordenamos a consulta pelo identificador do cliente.

Para criação da nova variável que calcula diferença em dias da troca de um plano para outro de cada cliente foram realizados os seguintes passos descritos abaixo para cada trecho de código.

```  
COALESCE(DATE_DIFF(s.start_date, LAG(s.start_date, 1) OVER(PARTITION BY s.customer_id ORDER BY s.start_date), DAY), 0) AS dias_troca_plano
```

**LAG(start_date, 1)**: retorna a data de início da assinatura da linha anterior para o mesmo cliente, quando ordenado pela data de início (start_date).

**OVER(PARTITION BY customer_id ORDER BY start_date)**: define uma janela (partição) para a função LAG, onde as linhas são agrupadas pelo customer_id e ordenadas pela data de início.

**DATE_DIFF(start_date, LAG(start_date, 1), DAY)**: calcula a diferença em dias entre a data de início da assinatura atual (start_date) e a data de início da assinatura anterior para o mesmo cliente. A unidade é especificada como 'DAY'.

**COALESCE(DATE_DIFF(...), 0)**: envolve a expressão anterior com COALESCE, que retorna o primeiro valor não nulo na lista de argumentos. Se a diferença em dias for nula (porque é a primeira linha para um cliente), ela será substituída por zero.

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto07/images/image01.png" width="60%"/>
</div>

&nbsp;

| cliente |   plano          | valor | data_plano | dias_entre_assinaturas |
|:-------:|:----------------:|:-----:|:----------:|:----------------------:|
|    1    |      trial       |  0.0  | 2020-08-01 |           0            |
|    1    | basic monthly    |  9.9  | 2020-08-08 |           7            |
|    2    |      trial       |  0.0  | 2020-09-20 |           0            |
|    2    |   pro annual      | 199.0 | 2020-09-27 |           7            |
|   11    |      trial       |  0.0  | 2020-11-19 |           0            |
|   11    |      churn       |   -   | 2020-11-26 |           7            |
|   13    |      trial       |  0.0  | 2020-12-15 |           0            |
|   13    | basic monthly    |  9.9  | 2020-12-22 |           7            |
|   13    |   pro monthly    | 19.9  | 2021-03-29 |          97            |
|   15    |      trial       |  0.0  | 2020-03-17 |           0            |
|   15    |   pro monthly    | 19.9  | 2020-03-24 |           7            |
|   15    |      churn       |   -   | 2020-04-29 |          36            |
|   16    |      trial       |  0.0  | 2020-05-31 |           0            |
|   16    | basic monthly    |  9.9  | 2020-06-07 |           7            |
|   16    |   pro annual      | 199.0 | 2020-10-21 |         136            |
|   18    |      trial       |  0.0  | 2020-07-06 |           0            |
|   18    |   pro monthly    | 19.9  | 2020-07-13 |           7            |
|   19    |      trial       |  0.0  | 2020-06-22 |           0            |
|   19    |   pro monthly    | 19.9  | 2020-06-29 |           7            |
|   19    |   pro annual      | 199.0 | 2020-08-29 |          61            |


&nbsp;

Com base nas informações das amostras temos o seguinte:

* Todos os clientes da amostra começaram com uma inscrição para o teste gratuito (*trial*) de 7 dias.
* Os clientes 11 e 15 foram os únicos que não prosseguiram com a assinatura. O cliente 11 desistiu após o período de teste, enquanto o cliente 15 cancelou após 36 dias utilizando o plano mensal premium (*pro monthly*). 
* O plano anual premium (*pro annual*) foi adquirido apenas pelos clientes 2, 16 e 19  com permanências de 7, 136 e 61 dias, respectivamente.
* O cliente 16 é o que está utilizando o foodie-fi há mais tempo. Ele adquiriu o plano mensal básico (*basic monthly*) e, após 7 dias, migrou para o plano anual premium.
* Todos os clientes assinam algum plano premium (mensal ou anual), exceto o cliente 1, que assina o plano mensal básico, e o cliente 11, que não continuou na plataforma. 