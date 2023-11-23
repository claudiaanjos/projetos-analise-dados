# C. Otimização de ingredientes

O relatório final encontra-se na [página principal](https://github.com/claudiaanjos/projetos-analise-dados/tree/main/projetos/projeto06).

&nbsp;

Antes de iniciar as análises, optamos por criar três tabelas temporárias para melhorar a organização dos dados. O objetivo é separar as informações nas colunas toppings, extras, e exclusions das tabelas originais, expandindo essas informações quando houver múltiplos valores separados por vírgula em linhas separadas. Temos as seguintes tabelas temporárias:

- *temp_pizza_recipes*: separamos as coberturas (toppings) associadas a cada tipo de pizza. 
- *temp_customer_orders_extras*: separamos os ingredientes adicionados de cada pedido.
- *temp_customer_orders_exclusions*: separamos os ingredientes excluídos de cada pedido.

&nbsp;

**Tabela auxiliar com uma sequência de números para divivir valores em outras operações**

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/script19.png" width="50%"/>

&nbsp;

**Tabela temp_pizza_recipes**

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/script20.png" width="50%"/>

&nbsp;

**Tabela temp_customer_orders_extras**

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/script21.png" width="50%"/>

&nbsp;

**Tabela temp_customer_orders_exclusions**

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/script22.png" width="50%"/>

&nbsp;

* Quais são os ingredientes padrão para cada pizza?

>Os ingredientes padrão da pizza Meatlovers são bacon, molho barbecue, bife, queijo, frango, cogumelos, peperoni e salame. Os da Vegetariana são queijo, cogumelos, cebola, pimenta, tomates e molho de tomate. Os ingredientes em comum são queijo e cogumelos.

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/script23.png" width="40%"/>

&nbsp;

|   pizza    | ingrediente  |
|:----------:|:-------------:|
| Meat Lover  |     Bacon     |
| Meat Lover  |   BBQ Sauce   |
| Meat Lover  |     Beef      |
| Meat Lover  |    Cheese     |
| Meat Lover  |    Chicken    |
| Meat Lover  |   Mushrooms   |
| Meat Lover  |   Pepperoni   |
| Meat Lover  |    Salami     |
| Vegetarian  |    Cheese     |
| Vegetarian  |   Mushrooms   |
| Vegetarian  |    Onions     |
| Vegetarian  |   Peppers     |
| Vegetarian  |   Tomatoes    |
| Vegetarian  | Tomato Sauce  |


&nbsp;

* Qual foi o extra mais adicionado?

>O ingrediente mais adicionado foi o Bacon.

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/script24.png" width="40%"/>

&nbsp;

| ingrediente | quantidade |
|:-----------:|:----------:|
|    Bacon    |      4     |
|    Cheese   |      1     |
|   Chicken   |      1     |


&nbsp;

* Qual foi a exclusão mais comum?

>O item mais removido foi o Queijo.

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/script25.png" width="40%"/>

&nbsp;

| ingrediente | quantidade |
|:-----------:|:----------:|
|    Cheese   |      4     |
|  Mushrooms  |      1     |
|  BBQ Sauce   |      1     |


&nbsp;


* Gere um item de pedido para cada registro na tabela customers_orders no formato de um dos seguintes:
    - Meat Lovers
    - Meat Lovers - Exclude Beef
    - Meat Lovers - Extra Bacon
    - Meat Lovers - Exclude Cheese, Bacon - Extra Mushroom, Peppers

>Criamos uma coluna de obervação apenas para o tipo de pizza Meat Lovers.

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/script26.png" width="50%"/>

&nbsp;

| pedido |   pizza    | observacao_meat_lovers                        |
|:------:|:----------:|:-----------------------------------------------------:|
|   1    | Meat Lovers |                                                       |
|   2    | Meat Lovers |                                                       |
|   3    | Meat Lovers |                                                       |
|   3    | Vegetarian  |                                                       |
|   4    | Meat Lovers |                                     Exclude Cheese                                    |
|   4    | Meat Lovers |                                     Exclude Cheese                                    |
|   4    | Vegetarian  |                                                       |
|   5    | Meat Lovers |                                      Extra Bacon                                      |
|   6    | Vegetarian  |                                                       |
|   7    | Vegetarian  |                                                       |
|   8    | Meat Lovers |                                                       |
|   9    | Meat Lovers | Exclude Cheese - Extra Bacon, Chicken                   |
|   10   | Meat Lovers |                                                       |
|   10   | Meat Lovers | Exclude BBQ Sauce, Mushrooms - Extra Bacon, Cheese      |