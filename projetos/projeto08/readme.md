<div align='center'>
    <img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto08/images/image00.png" width="100%"/>
</div>

&nbsp;

Você pode acessar o notebook [aqui](https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto08/projeto08.ipynb).

## Contexto

No contexto competitivo do varejo, as empresas que entendem as necessidades e preferências de seus clientes têm uma vantagem significativa. Isso permite que as empresas ofereçam produtos e serviços mais personalizados e relevantes.

Este projeto procura identificar padrões de comportamento dos clientes de um supermercado. Para isso, foram utilizados dados que abrangem desde as preferências de compra até as respostas a campanhas promocionais e adotada a estratégia de segmentação de clientes.

### Segmentação de Clientes

A **segmentação de clientes** é o processo de categorizar e agrupar clientes com características e comportamentos similares, permitindo estratégias de marketing mais direcionadas e personalizadas. No nosso contexto de um supermercado que atua em diferentes canais (loja física, catálogo e online), a segmentação oferece inúmeras vantagens estratégicas, como personalização de estratégias de marketing, otimização de ofertas e promoções e melhoria na experiência do cliente.

### Objetivo

O objetivo deste projeto foi realizar a segmentação dos clientes de um supermercado multicanal. Após a segmentação, cada grupo foi analisado para identificar suas características e comportamentos. As análises são essenciais, pois embasarão decisões estratégicas na área de negócios do supermercado.

As principais etapas incluem análise exploratória, engenharia de atributos, normalização, aplicação do método de Elbow e implementação do algoritmo K-Means.

## Dados

O conjunto de dados foi disponibilizado no [Kaggle](https://www.kaggle.com/datasets/imakash3011/customer-personality-analysis/data) por Akash Patel.

Os dados abrangem informações demográficas, comportamentais e de compra de clientes. 

O conjunto de dados tem 2.240 linhas e 29 colunas.

As variáveis foram distribuidas em quatro categorias para termos um melhor detalhamento e análise dos dados:

* Pessoas (People): Informações demográficas e de inscrição do cliente.
* Produtos (Products): Detalhes sobre os gastos do cliente em categorias específicas de produtos.
* Promoção (Promotion): Informações sobre a participação dos clientes em campanhas de marketing, como o número de compras feitas com desconto e a aceitação de ofertas.
* Local (Place): Reflete a preferência do cliente em termos de canais de compra, seja online, através de catálogo ou em lojas físicas.

Mais informações sobre os dados e o dicionário das variáveis estão disponíveis no [notebook](https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto08/projeto08.ipynb).

## Limpeza e transformação dos dados

Para cada categoria foi criado um novo DataFrame, mantendo a coluna *ID* para todos, utilizada para fazer a junção dos dados.

**People**

* Foram removidos os valores nulos da variável *Income*, que representavam 1,07% dos dados. Além disso, identificamos a presença de alguns outliers, notadamente um cliente com uma renda anual superior a $600.000. Dada a discrepância desse valor, optamos por remover os clientes cuja renda anual ultrapassa $200.000.
* Identificamos a presença de três outliers relacionados a datas de nascimento anteriores a 1920. Esses valores parecem ser incorretos ou inconsistentes com o contexto. Portanto, optamos por removê-los.

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto08/images/image01.png" width="60%"/>
</div>

&nbsp;

* A variável *Education* era categórica e ordinal, portanto convertemos os níveis educacionais em valores numéricos. A ordem estabelecida foi a seguinte: 0 (Basic): educação primária, 1 (2n Cycle): ensino médio, 2 (Graduation): graduação, 3 (Master): pós-graduação (mestrado) e 4 (PhD): pós-graduação (doutorado).

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto08/images/image02.png" width="60%"/>
</div>

&nbsp;

* Para variável correspondente ao Estado Civil, removemos o valor *Absurd*, pois pode ter sido erro na coleta de dados. Além disso, havia valores redundantes para esse atributo, então consideramos o seguinte: *Single*, se a pessoa respondeu *Alone* (mora sozinha) e *YOLO* (sem compromissos); *Together*, se a pessoa respondeu *Married*. 

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto08/images/image03.png" width="60%"/>
</div>

&nbsp;

* A variável *Marital_Status* era categórica nominal, portanto convertemos em variável dummy.
* Tanto *Kidhome* quanto *TeenHome* indicam quantas crianças/adolescentes têm na residência. Então, fizemos uma generalização e unificamos essas informações em uma coluna denominada *ChildrenHome*.
* Criaremos a nova coluna *LifeTime*, representando o tempo de vida estimado dos usuários em meses, e removemos a coluna correspondente a data de inscrição do cliente *Dt_Customer*.
* A porcentagem de clientes que não fizeram reclamações nos últimos 2 anos foi de 0.90%, por isso removemos a variável *Complain*.

**Products**

* Criamos uma nova coluna com o valor total gasto nos produtos (*TotalAmountSpent*).
* Alteramos as colunas para proporções (0 a 1) para cada categoria.

**Promotion**

* Criamos a coluna *AcceptedCmp* para o total de campanhas que foram aceitas.
* Conforme as campanhas avançam o número de clientes que as aceitam reduz, por isso removemos essas colunas.

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto08/images/image04.png" width="60%"/>
</div>

**Place**

* Criamos uma coluna com o total de compras, independente do canal.
* Removemos os poucos registros de pessoas que não fizeram compras.
* Alteramos as colunas para proporções (0 a 1).
* Os outliers de *NumWebVisitsMonth* não foram removidos, pois é possível o site ter sido acessado 20 vezes. Podemos até considerar que seja um cliente de alto valor.

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto08/images/image05.png" width="60%"/>
</div>

&nbsp;

### Normalização

Realizamos a junção das categorias em um único DataFrame com 2.203 linhas e 25 colunas.

Dado que as variáveis apresentam magnitudes diversas, com valores tanto maiores quanto menores, optamos por normalizá-las para o intervalo entre zero e um. Essa preparação é importante para garantir que o algoritmo K-means funcione de maneira adequada, já que ele é sensível à escala das variáveis. Utilizamos a função MinMax do scikit-learn para realizar essa normalização.

## Análise Descritiva

Os principais pontos da análise descritiva são os seguintes:

* Predominância de clientes com nível educacional correspondente à graduação
* A maioria dos clientes é casada e tem uma criança em casa;
* A faixa etária varia amplamente, desde clientes nascidos em 1940 até os mais jovens de 1996.
* A renda anual média familiar dos clientes é aproximadamente $51.940.
* No que diz respeito aos gastos, a média é de $605, com um valor máximo de $2.525.
* Os produtos mais consumidos pertencem à categoria de vinhos, enquanto as frutas têm a menor demanda.
* Quanto às campanhas de marketing, os clientes aceitam até 5 ofertas.
* A frequência média de compras é de 12 vezes, considerando todos os canais disponíveis.
* A loja física, dentre os canais disponíveis, é o local de preferência dos clientes.
* O acesso médio ao site da empresa por cliente foi de cinco vezes no último mês, no entanto, identificamos um caso em que um cliente acessou o site 20 vezes no mesmo período
* Apesar de atingir o máximo de 28 compras, o catálogo é o canal menos utilizado entre as opções disponíveis.

## Modelo

### Método Elbow

O método Elbow é uma estratégia para determinar o número ideal de clusters (denotado por k). Esse procedimento implica testar distintos valores de k e identificar o ponto em que a diminuição da variação dentro dos clusters desacelera, assemelhando-se a um "cotovelo" em um gráfico. Este ponto é comumente selecionado como o número ótimo de clusters para o algoritmo K-means. No caso do projeto, o número ideal de clusters identificado é 4.

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto08/images/image06.png" width="60%"/>
</div>

&nbsp;

### Alocação de Pesos

A alocação de pesos atribui importâncias diferenciadas às variáveis, considerando sua influência relativa na formação de clusters. Normalmente, discute-se com a área de negócio para entender como será essa alocação. Realizamos a seguinte alocação:

* *TotalAmountSpent* (8) e *TotalPurchases* (6) os fatores mais significativos, destacando gastos e volume de compras.
* *Recency* (4) e *NumWebVisitsMonth* (4) são relevantes, mas menos determinantes.
* *Income* (4) e *LifeTime* (4) refletem o poder aquisitivo e a fidelidade ao longo do tempo.
* *Year_Birth* (2), *ChildrenHome* (2) e *Education* (2) têm menor peso, sugerindo relevância, mas não tão crítica.

### K-means

O algoritmo K-Means é uma técnica de clustering amplamente utilizada para segmentar dados em grupos distintos. Sua operação inicia-se com a seleção aleatória de centros para os clusters, seguida pela atribuição de cada ponto ao cluster mais próximo. Os centróides são recalculados, e esse processo se repete até a convergência. Em nosso projeto, adotando o método Elbow, o modelo foi configurado com 4 clusters e ajustado aos dados normalizados. Esse procedimento proporciona a cada ponto uma atribuição específica a um cluster, possibilitando uma análise eficaz e uma segmentação coerente do conjunto de dados.

O modelo foi salvo e pode ser encontrado no arquivo *modelo_finalizado.sav*.


### Visualizações por cluster

* *TotalAmountSpent*: valor total despendido em todos os produtos pelos clientes

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto08/images/image07.png" width="60%"/>
</div>

&nbsp;

* *TotalPurchases*: número total te compras realizadas utilizando todos os canais.

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto08/images/image08.png" width="60%"/>
</div>

&nbsp;

* *Income*: Renda familiar anual do cliente.

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto08/images/image09.png" width="60%"/>
</div>

&nbsp;

No [notebook](https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto08/projeto08.ipynb) você encontrará mais visualizações.


## Análise dos Clusters

### Cluster 0: Clientes Dinâmicos

O grupo 0 representa clientes mais jovens, com menor poder aquisitivo, porém, são os mais ativos dentro da empresa. Caracterizados por um cadastro mais recente, esses consumidores têm preferência por compras em promoções, tanto na loja física quanto online. Mostram interesse em explorar ofertas no site, indicando uma atenção especial às promoções. Similar ao grupo 2, eles também têm uma preferência por produtos da categoria 'gold' e, notavelmente, por vinhos.

### Cluster 1: Clientes Premium

O grupo 1 destaca-se como o grupo de maior valor, caracterizado por uma menor base de clientes. Este segmento é composto por indivíduos de alta renda e elevado nível educacional, demonstrando uma preferência marcante por compras presenciais, seja diretamente na loja física ou por catálogo. Apesar de não serem frequentes nas compras online ou em promoções, esses clientes são notáveis por apresentarem o maior ticket médio entre todos os grupos. As categorias de carne e vinhos são suas preferidas, especialmente no caso da carne, onde consomem mais do que outros grupos. A maioria não possui filhos em casa e mantém uma longa fidelidade ao cadastro, sendo participativos em campanhas de marketing.

### Cluster 2: Clientes em Crescimento

O grupo 2 representa um grupo mais jovem, caracterizado pelo menor poder aquisitivo e nível educacional inferior em comparação com os outros grupos. Apesar de ser o menos ativo, é importante para a empresa atentar-se a este segmento, pois está demonstrando sinais de churn. Com maior presença de crianças em casa, este grupo é receptivo a campanhas direcionadas ao público infantil. Embora prefiram compras presenciais, são os que mais utilizam promoções. Este grupo é mais propenso a visitar o site e demonstra preferência por produtos 'gold'.

### Cluster 3: Clientes Consistentes

O grupo 3, embora apresente o menor ticket médio, é significativo para a empresa devido ao seu volume considerável de compras, resultando em uma receita substancial. Composto por clientes mais velhos, com salário anual elevado e geralmente com um filho em casa, este grupo é mais propenso a escolher a loja física, mas ainda utiliza o site para compras. Apresentam um alto nível educacional e têm uma apreciação marcante pela categoria de vinhos. Apesar de não se destacarem nas compras com desconto, contribuem consistentemente para a receita da empresa.