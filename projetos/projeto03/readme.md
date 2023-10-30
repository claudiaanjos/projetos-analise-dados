<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto03/images/image01.png" width="80%"/>
</div>

&nbsp;

>Como parte do meu desenvolvimento profissional, estou me dedicando em realizar projetos de análise de dados. Esta iniciativa tem como objetivo não apenas adquirir conhecimentos teóricos, mas também aplicá-los de forma prática. Cada projeto é uma oportunidade para aplicar e solidificar o aprendizado, permitindo-me crescer e colocar em prática o que tenho estudado.

## Cenário

O [Instacart](https://www.instacart.com/), um aplicativo estadunidense para pedidos e entrega de produtos de supermercado, tem como objetivo facilitar o abastecimento da geladeira e despensa com os produtos preferidos e itens essenciais dos seus clientes. Depois de selecionar os produtos pelo aplicativo, compradores do Instacart (que são contratados independentes) revisam o pedido, fazem as compras na loja e realizam a entrega.

A equipe de ciência de dados do Instacart desempenha um papel fundamental para proporcionar essa experiência de compra. Eles utilizam dados transacionais para desenvolver modelos que preveem quais produtos um usuário comprará novamente, experimentará pela primeira vez ou adicionará ao carrinho durante uma sessão de compras. Em 2017, o Instacart disponibilizou esses dados de forma aberta - confira o post deles no blog: [3 Million Instacart Orders, Open Sourced](https://tech.instacart.com/3-million-instacart-orders-open-sourced-d40d29ead6f2).

Como analista de dados seu objetivo é identificar associações entre produtos que os clientes frequentemente compram juntos, ou seja, aplicar a Análise de Cesta de Compras (Market Basket Analysis).

### Análise de Cestas de Compras

A Análise de Cesta de Compras, ou Market Basket Analysis (MBA) é uma técnica de análise de dados que faz uso de regras de associação para identificar os hábitos de compra dos clientes, fornecendo uma visão da combinação de produtos dentro das cestas de compras dos clientes analisados. Conhecer o perfil de compra do público-alvo é muito importante para aumentar o pontencial de recomendação, ajudando a melhorar as vendas.

Apesar de a nomenclatura Análise de Cesta de Compras evocar uma imagem de carrinhos de compras e supermercados, cabe mencionar que existem outras áreas em que essa abordagem pode ser empregada como, por exemplo, análise de comprar em cartão de crédito, análise de padrões em chamadas telefônicas, análise de compra de serviço telefônico, dentre outras aplicações.

## Dados

### Conjunto de Dados

O conjunto de dados foi disponibilizado em 2017 para uma competição promovida pelo Instacart na comunidade do Kaggle. Ele foi compartilhado por Jeremy Stanley, Meg Risdal, Sharath Rao e Will Cukierski.

Você pode acessar o conjunto de dados "The Instacart Online Grocery Shopping Dataset 2017" [aqui](https://kaggle.com/competitions/instacart-market-basket-analysis).

### Acessibilidade e privacidade dos dados

De acordo com o [Termos e Condições de Uso do Dataset](https://gist.github.com/jeremystan/582eba13d6ee27ed465c43dc78934700) do Instacart, só podemos utilizar o conjunto de dados apenas para fins não comerciais.

A equipe do Instacart tomou medidas para preservar a privacidade dos usuários e parceiros de varejo, assegurando que os dados permaneçam completamente anônimos.

É importante destacar que este conjunto de dados inclui pedidos de diversos varejistas e representa apenas um subconjunto altamente enviesado dos dados de produção do Instacart. Portanto, não pode ser considerado uma amostra representativa dos produtos, dos usuários ou de seus comportamentos de compra.

### Informações sobre o conjunto de dados

O conjunto de dados consiste em um conjunto de arquivos relacionais que descrevem os pedidos dos clientes ao longo do tempo. Ele é anonimizado e contém uma amostra de mais de 3 milhões de pedidos de supermercado de mais de 200.000 usuários do Instacart. Para cada usuário, forneceram entre 4 e 100 pedidos, com a sequência de produtos comprados em cada pedido. Também disponibilizaram a semana e a hora do dia em que o pedido foi feito, bem como uma medida relativa de tempo entre os pedidos.

Cada entidade (cliente, produto, pedido, corredor, etc.) possui um identificador (ID) exclusivo associado. A maioria dos nomes de arquivos e variáveis são autoexplicativas.

### Dicionário das variáveis

O dicionário tem informações do [Data Description](https://gist.github.com/jeremystan/c3b39d947d9b88b3ccff3147dbcf6c6b) e [Kaggle](https://www.kaggle.com/competitions/instacart-market-basket-analysis/data).

Mais informações sobre os dados e o dicionário das variáveis estão disponíveis no notebook.

## Preparação dos dados

* Durante essa fase foram analisadas todas as tabelas e realizado uma combinação (merge) entre elas. 

    1 - Merge da tabela *order_product_prior* com *order*, *product*, *aisle* e *department*. 

    2 - Merge da tabela *order_product_train* com *order*, *product*, *aisle* e *department*.

* A variável *days_since_prior_order* representa os dias desde o último pedido, limitado a 30 (com NAs para 1 pedido). Ela apresentou um percentual de 6,4% de dados ausentes. Iremos mantê-la no conjunto, dado esse baixo percentual e porque não a usaremos com o algoritmo MBA.
* Realizamos o agrupamento dos dados para aplicar o algoritmo Apriori e prepararamos o dataset com todas as transações. Para cada id do pedido atribuimos uma lista com os ids dos produtos do mesmo. Tivemos o seguinte resultado do novo dataframe:

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto03/images/image11.png" width="40%"/>
</div>

## Análise

* Qual o Número de Pedidos Mais Frequente Entre os Usuários?

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto03/images/image02.png" width="80%"/>
</div>

> A maioria dos clientes fez quatro pedidos. A menor frequência está entre 70 e 99 pedidos.

* Qual Dia da Semana Tem o Maior Número de Pedidos?

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto03/images/image03.png" width="60%"/>
</div>

> Os dias com maior número de pedidos são domigo e segunda-feira.

* Qual Hora do Dia Tem o Maior Número de Pedidos?

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto03/images/image04.png" width="80%"/>
</div>

> O pico do dia com maior número de pedidos é entre 10 horas e 16 horas. E poucas pessoas fazem pedidos entre 2 horas e 4 horas.

* Qual Departamento Tem o Maior Número de Pedidos?

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto03/images/image05.png" width="80%"/>
</div>

> O departamento que tem o maior número de pedidos é *produce*. Produce é um departmento com produtos frescos, ou seja, frutas e legumes/vegetais.

* Quais os 20 Principais Corredores Por Frequência de Pedidos?

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto03/images/image06.png" width="80%"/>
</div>

> Os corredores com maior número de pedidos são os de frutas e vegetais. Perceba que esses dois corredores são do departamento de *produce*, como visto anteriormente.

* Quais os 20 Principais Produtos Por Frequência de Pedidos?

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto03/images/image07.png" width="80%"/>
</div>

> O produto com maior frequência de pedido é banana.

* Análise de Novos Pedidos Semelhantes a Pedidos Anteriores (reorder)

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto03/images/image08.png" width="80%"/>

> No gráfico de barras empilhadas, podemos observar que temos uma proporção semelhante das barras, ou seja, os clientes compram novamente o mesmo produto. 

* Análise de Reorder Por Departamento ao Longo do Tempo

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto03/images/image09.png" width="60%"/>

> Alguns departamentos tiveram poucos itens comprados novamente como *personal care*, e outros, como o *daily eggs*, teve vários pedidos refeitos.

* Análise de Reorder Por Corredor

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto03/images/image10.png" width="60%"/>

> O corredor *baking supplies decor* recebeu menos novos pedidos, enquanto o corredor *bread* tem uma quantidade grande de novos pedidos.

* Adição de produtos no carrinho vs novos pedidos

Verificamos também a relação entre como a ordem de adição do produto ao carrinho afeta a proporção de novos pedidos.

Quando um produto foi adicionado na primeira posição no carrinho (o primeiro produto), levou a gerar um novo pedido 68% das vezes. Quando o cliente teve 2 produtos no carrinho, 67% das vezes fez um novo pedido.

A medida que aumenta o número de produtos, reduz a média de novos pedidos.


* Implementação do Algoritmo Apriori

O [algoritmo Apriori](https://pypi.org/project/efficient-apriori/) revela estruturas ocultas em dados categóricos. O exemplo clássico é um banco de dados contendo compras de um supermercado. Cada compra está associada a vários itens. Gostaríamos de descobrir regras de associação, como {pão, ovos} -> {bacon}, a partir dos dados. Esse é o objetivo do aprendizado de regras de associação, e o algoritmo Apriori é provavelmente o algoritmo mais famoso para esse problema.

Executamos Algoritmo Apriori duas vezes alterando o *Support*:
-  *Support = 0.01  e Confidence = 0.2*  
-  *Support = 0.005 e Confidence = 0.2*

> Mesmo mudando a métrica identificamos que quem compra Maçã Fuji Orgânica também compra Banana.

No notebook você pode encontrar mais associações.

Realizamos uma análise de MBA gerando como resultado as regras de associação entre os produtos com diferentes métricas. Podemos agora levar nossas conclusões aos tomadores de decisão. 