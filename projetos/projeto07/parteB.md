# Análise dos Dados

&nbsp;

* Quantos clientes o Foodie-Fi já teve?

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto07/images/image02.png" width="60%"/>

&nbsp;

>O Foodie-Fi já teve 1000 clientes.

* Qual é a distribuição mensal dos valores de *start_date* para o plano de teste (*trial*) em nosso conjunto de dados - utilize o início do mês como valor de agrupamento.

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto07/images/image03.png" width="60%"/>

&nbsp;

| numero_mes | nome_mes   | total_planos |
|------------:|:-----------|:-------------|
|           1 |  January   |           88 |
|           2 |  February  |           68 |
|           3 |  March     |           94 |
|           4 |  April     |           81 |
|           5 |  May       |           88 |
|           6 |  June      |           79 |
|           7 |  July      |           89 |
|           8 |  August    |           88 |
|           9 |  September |           87 |
|          10 |  October   |           79 |
|          11 |  November  |           75 |
|          12 |  December  |           84 |

&nbsp;

>O mês que teve mais assinaturas do plano gratuito foi Março, totalizando 94. O mês com o menor número foi Fevereiro, totalizando 68 assinaturas.

&nbsp;

* Quais valores de *start_date* do plano ocorrem após o ano de 2020 para nosso conjunto de dados? Mostre a contagem de eventos para cada *plan_name*.

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto07/images/image04.png" width="60%"/>

&nbsp;

| tipo_plano   | quantidade |
|:-------------:|:-----------:|
| basic monthly |      8      |
| pro monthly   |     60      |
| pro annual    |     63      |
| churn         |     71      |

&nbsp;

>A partir de 2021 não tivemos mais assinantes do teste gratuito, porém observa-se a desistência de 71 clientes.

&nbsp;


* Qual é a contagem de clientes e a porcentagem de clientes que cancelaram, arredondada para uma casa decimal?

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto07/images/image05.png" width="60%"/>

&nbsp;

| total_churn | porcentagem |
|:-----------:|:-----------:|
|     307     |    30.7     |

&nbsp;

>Temos que 307 clientes desistiram de continuar na plataforma, o que corresponde a 30.7% dos usuários.

&nbsp;

* Quantos clientes cancelaram imediatamente após o teste gratuito inicial - qual é a porcentagem disso, arredondada para o número inteiro mais próximo?

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto07/images/image06.png" width="60%"/>

&nbsp;

| total_churn | porcentagem |
|:-----------:|:-----------:|
|      92     |     9       |

&nbsp;

>Após o teste gratuito tivemos a desistência de 92 clientes, o que corresponde a 9% do total de usuários.

&nbsp;


* Qual é o número e a porcentagem de planos dos clientes após o teste gratuito inicial?

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto07/images/image07.png" width="60%"/>

&nbsp;

| plano        | total | porcentagem |
|:------------:|:-----:|:-----------:|
| basic monthly|  546  |    55.0     |
| pro monthly  |  325  |    33.0     |
| churn        |   92  |     9.0     |
| pro annual   |   37  |     4.0     |

&nbsp;

>Após o período de teste gratuito, a maioria dos clientes opta pela transição para o plano mensal básico, compreendendo 55% do total de clientes. A adesão ao plano anual premium, por outro lado, é realizada por apenas 4% dos clientes.

&nbsp;


* Qual é a quantidade de clientes e a porcentagem de cada um dos 5 tipos de planos em 31 de dezembro de 2020?

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto07/images/image08.png" width="60%"/>

&nbsp;

| plano         | total_clientes | porcentagem |
|:-------------:|:--------------:|:-----------:|
| trial         |       19       |     1.9     |
| pro annual    |      195       |    19.5     |
| basic monthly |      224       |    22.4     |
| churn         |      236       |    23.6     |
| pro monthly   |      326       |    32.6     |


&nbsp;

>Em 31 de dezembro de 2020, a distribuição dos clientes nos diferentes planos é a seguinte: 32.6% optam pelo plano mensal premium, 22.4% escolhem o plano mensal básico, 19.5% aderem ao plano anual premium, 1.9% permanecem no período de teste e 23.6% optam por cancelar a assinatura.

&nbsp;


* Quantos clientes fizeram upgrade para um plano anual em 2020?

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto07/images/image09.png" width="60%"/>

&nbsp;

>Temos que 195 clientes fizeram upgrade para um plano anual em 2020.

&nbsp;


* Quantos dias, em média, um cliente leva para fazer upgrade para um plano anual desde o dia em que se inscreve no Foodie-Fi?

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto07/images/image10.png" width="60%"/>

&nbsp;

>A média, em dias, que um cliente leva para fazer upgrade para um plano anual desde o dia em que se inscreve no Foodie-Fi é de 105.

&nbsp;


* É possível dividir ainda mais esse valor médio em períodos de 30 dias (por exemplo, 0-30 dias, 31-60 dias, etc.)?

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto07/images/image11.png" width="60%"/>

&nbsp;

|   periodo     | total_clientes | media_dias |
|:-------------:|:--------------:|:----------:|
|   0-30 dias   |       48       |    10.0    |
|  30-60 dias   |       25       |    42.0    |
|  60-90 dias   |       33       |    71.0    |
| 90-120 dias   |       35       |   100.0    |
|120-150 dias   |       43       |   133.0    |
|150-180 dias   |       35       |   162.0    |
|180-210 dias   |       27       |   190.0    |
|210-240 dias   |        4       |   224.0    |
|240-270 dias   |        5       |   257.0    |
|270-300 dias   |        1       |   285.0    |
|300-330 dias   |        1       |   327.0    |
|330-360 dias   |        1       |   346.0    |

&nbsp;

>Nos primeiros 30 dias, a maioria dos clientes opta por assinar ou atualizar para um plano anual. Após 210 dias, o número de clientes que tomam essa decisão diminui, e após 270 dias, quase não há atividade do cliente em termos de aquisição de um plano anual.

* Quantos clientes fizeram downgrade de um plano mensal premium para um plano mensal básico em 2020?

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto07/images/image12.png" width="60%"/>

&nbsp;

>Nenhum cliente fez downgrade de um plano mensal premium para um plano mensal básico em 2020.