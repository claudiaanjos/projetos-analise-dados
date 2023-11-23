# C. Otimização de Ingredientes

O relatório final encontra-se na [página principal](https://github.com/claudiaanjos/projetos-analise-dados/tree/main/projetos/projeto06).

&nbsp;

Antes de iniciar as análises, optamos por criar três tabelas temporárias para melhorar a organização dos dados. O objetivo é separar as informações nas colunas toppings, extras, e exclusions das tabelas originais, expandindo essas informações quando houver múltiplos valores separados por vírgula em linhas separadas. Temos as seguintes tabelas temporárias:

- *temp_pizza_recipes*: separamos as coberturas (toppings) associadas a cada tipo de pizza. 
- *temp_customer_orders_extras*: separamos os ingredientes adicionados de cada pedido.
- *temp_customer_orders_exclusions*: separamos os ingredientes excluídos de cada pedido.

&nbsp;

* Quais são os ingredientes padrão para cada pizza?

>Os ingredientes padrão da pizza Meatlovers são bacon, molho barbecue, bife, queijo, frango, cogumelos, peperoni e salame. Os da Vegetariana são queijo, cogumelos, cebola, pimenta, tomates e molho de tomate. Os ingredientes em comum são queijo e cogumelos.

&nbsp;


&nbsp;

<div align='center'>
<img src="" width="80%"/>
</div>

image21

* Qual foi o extra mais adicionado?

>O ingrediente mais adicionado foi o Bacon.

&nbsp;


&nbsp;

<div align='center'>
<img src="" width="80%"/>
</div>

image22

* Qual foi a exclusão mais comum?

>O item mais removido foi o Queijo.

&nbsp;


&nbsp;

<div align='center'>
<img src="" width="80%"/>
</div>

image23


* Gere um item de pedido para cada registro na tabela customers_orders no formato de um dos seguintes:
    - Meat Lovers
    - Meat Lovers - Exclude Beef
    - Meat Lovers - Extra Bacon
    - Meat Lovers - Exclude Cheese, Bacon - Extra Mushroom, Peppers

>Criamos uma coluna de obervação apenas para o tipo de pizza Meat Lovers.

&nbsp;


&nbsp;

<div align='center'>
<img src="" width="80%"/>
</div>

image24