# D. Preços e classificações

O relatório final encontra-se na [página principal](https://github.com/claudiaanjos/projetos-analise-dados/tree/main/projetos/projeto06).

&nbsp;

* Se uma pizza Meat Lovers custa $ 12 e Vegetariana custa $ 10 e não houve cobrança por alterações - quanto dinheiro o Pizza Runner ganhou até agora se não houver taxas de entrega?

>Levando em consideração que a pizza Meat Lovers tem o custo de $12, a pizza Vegetariana tem o custo de $10 e que não houve cobrança por alterações ou entrega, o Pizza Runner obteve uma receita total de $138.

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/script27.png" width="40%"/>

&nbsp;

* E se houvesse uma cobrança adicional de US$ 1 por quaisquer extras de pizza? Adicionar queijo custa $ 1 extra

>Considerando que a pizza Meat Lovers tem o custo de $12, a pizza Vegetariana tem o custo de $10 e que há uma taxa adicional de $1 para cada ingrediente extra, o Pizza Runner gerou uma receita total de $142.

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/script28.png" width="40%"/>

&nbsp;

* A equipe do Pizza Runner deseja adicionar um sistema adicional de avaliações que permita aos clientes avaliarem o runner. Como você projetaria uma tabela adicional para este novo conjunto de dados? Gere um esquema para esta nova tabela e insira seus próprios dados de avaliação para cada pedido bem-sucedido do cliente, atribuindo notas de 1 a 5.

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/script29.png" width="40%"/>

&nbsp;

| pedido | avaliacao |
|:------:|:---------:|
|   1    |     3     |
|   2    |     5     |
|   3    |     4     |
|   4    |     2     |
|   5    |     3     |
|   7    |     3     |
|   8    |     4     |
|   10   |     5     |


&nbsp;

* Usando a tabela recém-criada, você pode unir todas as informações para formar uma tabela que contenha os seguintes detalhes para entregas bem-sucedidas? Informações: customer_id, order_id, runner_id, rating, order_time, pickup_time, Time between order and pickup, Delivery duration, Average speed, Total number of pizzas.

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/script30.png" width="40%"/>

&nbsp;

| cliente | pedido | runner | avaliacao_runner | retirada_pedido         | preparo_min | duracao_entrega | vel_media | total_pizzas |
|:-------:|:------:|:------:|:-----------------:|:-----------------------:|:-----------:|:---------------:|:---------:|:------------:|
|   101   |   1    |   1    |         3         | 2020-01-01 18:15:34    |      10     |        32       |   37.50   |       1      |
|   101   |   2    |   1    |         5         | 2020-01-01 19:10:54    |      10     |        27       |   44.44   |       1      |
|   102   |   3    |   1    |         4         | 2020-01-03 00:12:37    |      21     |        20       |   40.20   |       2      |
|   102   |   8    |   2    |         4         | 2020-01-10 00:15:02    |      20     |        15       |   93.60   |       1      |
|   103   |   4    |   2    |         2         | 2020-01-04 13:53:03    |      29     |        40       |   35.10   |       3      |
|   104   |   5    |   3    |         3         | 2020-01-08 21:10:57    |      10     |        15       |   40.00   |       1      |
|   104   |   10   |   1    |         5         | 2020-01-11 18:50:20    |      15     |        10       |   60.00   |       2      |
|   105   |   7    |   2    |         3         | 2020-01-08 21:30:45    |      10     |        25       |   60.00   |       1      |


&nbsp;


* Se uma pizza Meat Lovers custasse $ 12 e uma vegetariana $ 10, preços fixos sem custo para extras e cada runner recebesse $ 0,30 por quilômetro percorrido - quanto dinheiro o Pizza Runner sobrou após essas entregas?

>Considerando que a pizza Meat Lovers tem o custo de $12, a pizza Vegetariana tem o custo de $10, sem cobrança por alterações nas pizzas e cada runner recebeu $0,30 por quilômetro percorrido, o Pizza Runner registrou um faturamento total de $94,44.

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/script31.png" width="40%"/>