# B. Experiência do cliente e runner

O relatório final encontra-se na [página principal](https://github.com/claudiaanjos/projetos-analise-dados/tree/main/projetos/projeto06).

&nbsp;

* Quantos runners se cadastraram por semana? (a semana começa em 2021-01-01)

>Na semana inicial de operação, dois corredores se cadastraram. Nas duas semanas seguintes, houve o cadastro de apenas um corredor em cada semana.

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/script10.png" width="40%"/>

&nbsp;

|   semana    | total_runner |
|:------------:|:------------:|
| 2021-01-01  |       2      |
| 2021-01-08  |       1      |
| 2021-01-15  |       1      |

&nbsp;

* Qual foi o tempo médio em minutos que cada runner levou para chegar ao QG da Pizza Runner para retirar o pedido?

>O runner 3 teve o menor tempo de retirada do pedido, com média de 10 minutos. O runner 2 foi quem levou mais tempo, com média de 20 minutos.

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/script10.png" width="40%"/>

&nbsp;

| runner | media_minutos |
|:------:|:-------------:|
|   1    |      14       |
|   2    |      20       |
|   3    |      10       |

&nbsp;

* Existe alguma relação entre a quantidade de pizzas e o tempo de preparo do pedido?

>Há uma tendência de que, à medida que o número de pizzas aumenta, o tempo de preparo dos pedidos também aumenta.

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/script10.png" width="40%"/>

&nbsp;

| quantidade_pizza | media_minutos_preparo |
|:-----------------:|:----------------------:|
|         1         |           12           |
|         2         |           18           |
|         3         |           29           |


&nbsp;

* Qual foi a distância média percorrida para cada cliente?

>O Cliente 104 está mais próximo da sede da Pizza Runner, a uma distância média de 10 km, enquanto o Cliente 105 está mais distante, a uma distância média de 25 km.

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/script10.png" width="40%"/>

&nbsp;

| cliente | media_distancia_km |
|:-------:|:-------------------:|
|   104   |         10          |
|   102   |         17          |
|   101   |         20          |
|   103   |         23          |
|   105   |         25          |


&nbsp;

* Qual foi a diferença entre os prazos de entrega mais longos e mais curtos para todos os pedidos?

>A diferença entre os prazos de entrega mais longos e mais curtos para todos os pedidos foi de 30 minutos.

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/script10.png" width="40%"/>

&nbsp;

* Qual foi a velocidade média de cada runner para cada entrega e você percebe alguma tendência nesses valores?

>O runner 1 concluiu a entrega de 4 pedidos, alcançando uma velocidade média de 45.54 km/h (desvio padrão ≈ 10.06). O runner 2 entregou 3 pedidos, mantendo uma velocidade média de 62.90 km/h (desvio padrão ≈ 29.36), apresentando uma variabilidade significativamente maior em comparação com o runner 1 e atingindo uma velocidade máxima de 93.60 km/h. O runner 3 realizou apenas uma entrega a uma velocidade de 40 km/h, próxima à média do runner 1.

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/script10.png" width="40%"/>

&nbsp;

| runner | pedido | velocidade_km_hora |
|:------:|:------:|:-------------------:|
|   1    |   1    |        37.50        |
|   1    |   2    |        44.44        |
|   1    |   3    |        40.20        |
|   1    |   10   |        60.00        |
|   2    |   4    |        35.10        |
|   2    |   7    |        60.00        |
|   2    |   8    |        93.60        |
|   3    |   5    |        40.00        |


&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/script10.png" width="40%"/>

&nbsp;

| runner | pedidos | vel_media | desvio_padrao | vel_max | vel_min |
|:------:|:-------:|:---------:|:-------------:|:-------:|:-------:|
|   1    |    4    |   15.54   |     10.06     |  60.00  |  37.50  |
|   2    |    3    |   62.90   |     29.36     |  93.60  |  35.10  |
|   3    |    1    |   40.00   |      0.00     |  40.00  |  40.00  |


&nbsp;

* Qual é a porcentagem de entrega bem-sucedida para cada runner?

>A taxa de entregas bem-sucedidas para o runner 1 foi de 100%, para o runner 2 foi de 75%, e para o runner 3 foi de 50%. É importante ressaltar que as taxas são influenciadas por fatores além do controle dos runners, como cancelamentos de pedidos.

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/script10.png" width="40%"/>

&nbsp;

| runner | %_sucesso |
|:------:|:---------:|
|   1    |   100     |
|   2    |   75      |
|   3    |   50      |
