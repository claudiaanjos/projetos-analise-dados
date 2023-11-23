<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/image00.png" width="100%"/>
</div>

&nbsp;

# Análise Operacional de um Serviço de Delivery

Esse projeto faz parte do [8 Week SQL Challenge](https://8weeksqlchallenge.com/) disponibilizado pelo [Data With Danny](https://www.datawithdanny.com/).

O objetivo do Desafio SQL de 8 Semanas é incentivar profissionais da área de dados a desenvolver projetos com SQL.
Em cada projeto teremos um estudo de caso com apresentação do cenário, os problemas e os dados.
Iremos trabalhar no segundo estudo de caso: [Pizza Runner](https://8weeksqlchallenge.com/case-study-2/).

## Introdução

Danny estava rolando seu feed do Instagram quando algo realmente chamou sua atenção - "Estilo Retrô dos Anos 80 e Pizza é o Futuro!"

Danny comprou a ideia, mas sabia que apenas a pizza não seria suficiente para conseguir financiamento inicial e expandir seu novo Império da Pizza. Então, ele teve mais uma ideia genial para combinar com isso - ele ia "Uberizar" - e assim nasceu o 🍕 Pizza Runner 🍕!

Danny começou recrutando entregadores (*runners*) para entregar pizzas frescas da sede do Pizza Runner (também conhecida como casa do Danny) e também esgotou seu cartão de crédito para pagar desenvolvedores freelancers para construir um aplicativo móvel que aceitasse pedidos dos clientes.

## Problema

Como Danny tinha alguns anos de experiência como cientista de dados, ele estava bem ciente de que a coleta de dados seria crítica para o crescimento de seu negócio.

Ele preparou para nós um diagrama de entidade-relacionamento de seu projeto de banco de dados, mas precisa de mais assistência para limpar seus dados e aplicar alguns cálculos básicos para que possa direcionar melhor seus runners e otimizar as operações do Pizza Runner.

## Conjunto de dados

A condução da análise foi realizada com [MySQL](https://www.mysql.com/) utilizando o [MySQL Workbench](https://www.mysql.com/products/workbench/).

Os scripts de criação e inserção de dados estão no arquivo [tabelas.sql](https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/scripts/tabelas.sql).

### Dicionário das variáveis

**Tabela 1: runners**

* **runner_id**: identificador do runner
* **registration_date**: data de registro do runner

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/image02.png" width="60%"/>
</div>

&nbsp;

**Tabela 2: customer_orders**

Os pedidos de pizza dos clientes são registrados na tabela **customer_orders** com 1 linha para cada pizza individual que faz parte do pedido.

* **order_id**: identificador do pedido
* **customer_id**: identificador do cliente
* **pizza_id**: identificador do tipo de pizza que foi pedido
* **exclusions**: valores do *ingredient_id* que devem ser removidos da pizza
* **extras**: valores do *ingredient_id* que precisam ser adicionados à pizza
* **order_time**: data e horário que o pedido foi realizado

Observe que os clientes podem fazer vários pedidos de pizza em um único pedido com valores variados de **exclusions** e **extras**, mesmo que a pizza seja do mesmo tipo. 

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/image03.png" width="60%"/>
</div>

&nbsp;

**Tabela 3: runner_orders**

Após cada pedido ser recebido pelo sistema, ele é atribuído a um runner. No entanto, nem todos os pedidos são totalmente concluídos e podem ser cancelados pelo restaurante ou pelo cliente.

* **order_id**: identificador do pedido
* **runner_id**: identificador do runner
* **pickup_time**: data e horário em que o runner chega à sede do Pizza Runner para retirar as pizzas
* **distance**: distância que o runner percorreu para entregar o pedido em Km
* **duration**: tempo que o runner gastou para entregar o pedido em minutos
* **cancellation**: quem cancelou o pedido (Cliente ou Restautante)

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/image04.png" width="60%"/>
</div>

&nbsp;

**Tabela 4: pizza_names**

Atualmente, o Pizza Runner tem apenas 2 pizzas disponíveis: Meat Lovers ou Vegetariana.

* **pizza_id**: identificador do tipo de pizza
* **pizza_name**: tipo da pizza

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/image05.png" width="60%"/>
</div>

&nbsp;

**Tabela 5: pizza_recipes**

Cada pizza tem um conjunto padrão de coberturas que são usadas como parte da receita da pizza.

* **pizza_id**: identificador do tipo de pizza
* **toppings**: identificadores dos tipos de coberturas utilizadas para cada tipo de pizza

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/image06.png" width="60%"/>
</div>

&nbsp;

**Tabela 6: pizza_toppings**

* **topping_id**: identificador do tipo de cobertura
* **topping_name**: nome da cobertura 

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/image07.png" width="60%"/>
</div>

&nbsp;

### Diagrama de Relacionamento de Entidades

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/image01.png" width="60%"/>
</div>

&nbsp;

## Limpeza e Transformação dos Dados

Antes de começar com as análises, realizamos uma investigação e identificamos a necessidade de limpeza e transformação dos dados.

Os scripts podem ser conferidos no arquivo [limpeza.sql](https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/scripts/limpeza.sql).

Para a tabela **runner_orders** realizamos as seguintes ações:

* Criamos uma tabela temporária **temp_runners_orders** e realizamos as modificações na mesma para não alterar a original;
* Na maioria das colunas, substituimos as strings 'null' por valores NULL, pois para conversão precisamos que sejam realmente nulos;
* Na coluna *cancellation*, substituimos tanto as strings 'null' quantos os valores NULL por string vazia;
* Na coluna *distance*, removemos o "km" dos valores e alteramos o tipo para DECIMAL;
* Na coluna *duration*, removemos os "mins", "minute" e "minutes" dos valores e alteramos o tipo para INT;
* Na coluna *pickup_time*, alteramos o tipo para DATETIME.

Para a tabela **customer_orders** realizamos as seguintes ações:

* Criamos uma tabela temporária **temp_customer_orders** e realizamos as modificações na mesma para não alterar a original;
* Nas colunas *exclusions* e *extras*, que são do tipo varchar, substituimos tanto as strings 'null' quantos os valores NULL por strings vazias;


## Análises

Este estudo de caso foi dividido por áreas de foco:

* A - [Métricas dos pedidos de pizza](https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/parteA.md)
* B - [Experiência do runner e cliente](https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/parteB.md)
* C - [Otimização de ingredientes](https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/parteC.md)
* D - [Preços e classificações](https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/parteD.md)

Ao clicar em cada parte você será direcionado para a respectiva análise.

No diretório [scripts](https://github.com/claudiaanjos/projetos-analise-dados/tree/main/projetos/projeto06/scripts) também encontrará essa divisão em partes.


## Relatório

### A - Métricas dos Pedidos de Pizza

**Quantidade e Tipos de Pedidos:**

* No período analisado, houve um total de 14 pedidos de pizzas, dos quais 10 foram de clientes exclusivos.
* Foram entregues 9 pizzas do tipo "Meat Lovers" e 3 pizzas do tipo "Vegetarian".
* Runner 1, 2, e 3 realizaram 4, 3, e 1 entregas com sucesso, respectivamente.

**Preferências dos Clientes:**

* Os clientes 103 e 104 encomendaram o maior número de pizzas do tipo "Meat Lovers", totalizando 3 pedidos cada. 
* Todos os clientes solicitaram pizzas do tipo "Vegetarian", exceto o cliente 104.
* Modificações nos pedidos foram mais comuns para os clientes 103 e 105.

**Variações nos Pedidos:**

* Apenas um pedido foi entregue com remoção e adição de ingredientes.
* O máximo de pizzas entregues em um único pedido foi de 3 unidades.
* Horários de pico para pedidos foram às 18:00, 23:00, 13:00 e 21:00, com menor demanda às 19:00 e 11:00.
* Dias com mais pedidos foram quarta e sábado com 5 cada, seguidos por quinta com 3, enquanto sexta teve apenas 1.

### B - Experiência do Runner e Cliente

**Cadastro de Runners:**

* Dois runners se cadastraram na primeira semana, enquanto nas semanas seguintes, apenas um novo runner foi cadastrado por semana.

**Eficiência Operacional:**

* O Runner 3 teve o menor tempo de retirada, levando em média 10 minutos, enquanto o Runner 2 foi o mais demorado, com uma média de 20 minutos.
* Notou-se uma tendência de aumento no tempo de preparo conforme o número de pizzas aumentava.

**Distância e Velocidade Média:**

* A análise de distância revelou que o cliente 104 está mais próximo da sede do Pizza Runner, a uma distância média de 10 km. O cliente 105 está mais distante, com uma média de 25 km.
* As velocidades médias dos runners foram: Runner 1 (45.54 km/h), Runner 2 (62.90 km/h), e Runner 3 (40 km/h).
* Runner 2 alcançou uma velocidade máxima de 93.60 km/h.

**Taxas de Entrega Com Sucesso:**

* A taxa de entregas com sucesso foi de 100% para o Runner 1, 75% para o Runner 2 e 50% para o Runner 3.
* É importante destacar que as taxas foram influenciadas por fatores externos, como cancelamentos de pedidos pelo cliente ou restaurante.

### C - Otimização de Ingredientes

**Ingredientes Padrão e Modificações:**

* Os ingredientes da pizza "Meat Lovers" são bacon, molho barbecue, bife, queijo, frango, cogumelos, peperoni e salame.
* Os ingredientes da pizza Vegetariana são queijo, cogumelos, cebola, pimenta, tomates e molho de tomate.
* Queijo e cogumelos são os itens comuns nos dois tipos de pizza.
* Bacon foi o ingrediente mais adicionado, enquanto queijo foi o item mais removido.

### D - Preços e Classificações

**Receita e Faturamento:**

* Considerando o custo fixo de $12 para "Meat Lovers" e $10 para "Vegetarian", a receita total foi de $138.
* Incluindo uma taxa adicional de $1 por cada ingrediente extra, a receita total foi de $142.
* Levando em conta apenas o custo fixo e adicionando uma taxa de $0,30 por quilômetro percorrido pelos runners, o faturamento total foi de $94.44.