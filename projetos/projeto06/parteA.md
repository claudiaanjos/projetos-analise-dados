# A. Métricas dos pedidos de pizza

O estudo foi dividido por áreas de foco:

* A - Métricas dos pedidos de pizza
* B - Experiência do runner e cliente
* C - Otimização de ingredientes
* D - Preços e classificações

Ao clicar em cada parte você será direcionado para a respectiva análise. 

No diretório [scripts](https://github.com/claudiaanjos/projetos-analise-dados/tree/main/projetos/projeto06/scripts) também encontrará essa divisão em partes.

O relatório final encontra-se na [página principa](https://github.com/claudiaanjos/projetos-analise-dados/tree/main/projetos/projeto06).

## Questões

* Quantas pizzas foram pedidas?

>Foram solicitadas 14 pizzas.

* Quantos pedidos de clientes exclusivos foram feitos?

>Foram realizados 10 pedidos de clientes exclusivos.

* Quantos pedidos bem-sucedidos foram entregues por cada runner?

>O Runner 1 concluiu com êxito a entrega de 4 pedidos, enquanto o Runner 2 de 3 pedidos e o Runner 3 de 1 pedido.

| runner | total_pedidos_entregues |
|:--------:|:--------------------------:|
|   1    |            4             |
|   2    |            3             |
|   3    |            1             |


&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/image09.png" width="40%"/>
</div>

&nbsp;

* Quantas pizzas de cada tipo foram entregues?

>Foram entregues 9 pizzas do tipo "Meat Lovers" e 3 pizzas do tipo "Vegetarian".

| tipo_pizza   | total_entregue |
|:--------------:|:----------------:|
| Meat Lovers  | 9              |
| Vegetarian   | 3              |


&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/image10.png" width="35%"/>
</div>

&nbsp;

* Quantos Vegetarianos e Meatlovers foram encomendados por cada cliente?

>Os clientes 103 e 104 destacaram-se ao encomendar o maior número de pizzas do tipo "Meat Lovers", totalizando 3 pedidos cada. Todos os clientes solicitaram pizzas do tipo "Vegetarian", exceto o cliente 104, que optou por não incluir esse tipo em seus pedidos.

| cliente | tipo_pizza   | total_encomendado |
|:---------:|:--------------:|:-------------------:|
|   101   | Meat Lovers  |        2          |
|   101   | Vegetarian   |        1          |
|   102   | Meat Lovers  |        2          |
|   102   | Vegetarian   |        1          |
|   103   | Meat Lovers  |        3          |
|   103   | Vegetarian   |        1          |
|   104   | Meat Lovers  |        3          |
|   105   | Vegetarian   |        1          |


&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/image11.png" width="40%"/>
</div>

&nbsp;

* Qual foi o número máximo de pizzas entregues em um único pedido?

>O maior número de pizzas entregues em um único pedido foi de 3 unidades.

* Para cada cliente, quantas pizzas entregues tiveram pelo menos uma alteração e quantas não tiveram nenhuma alteração?

>Os clientes 101 e 102 mantiveram seus pedidos inalterados. Os clientes 103 e 105 realizaram modificações em todos os seus pedidos. Quanto ao cliente 104, dois dos seus pedidos foram alterados, enquanto um permaneceu sem modificações.

| cliente | total_com_alteracao | total_sem_alteracao |
|:---------:|:----------------------:|:----------------------:|
|   101   |          0           |          2           |
|   102   |          0           |          3           |
|   103   |          3           |          0           |
|   104   |          2           |          1           |
|   105   |          1           |          0           |


&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/image12.png" width="50%"/>
</div>

&nbsp;

* Quantas pizzas foram entregues com exclusões e extras?

>Tivemos um pedido que foi entregue com remoção e adição de ingredientes.

* Qual foi o total de pizzas encomendadas para cada hora do dia?

>Nos horários de pico, às 18:00, 23:00, 13:00 e 21:00, foram encomendadas 3 pizzas em cada um desses momentos. Em contraste, às 19:00 e 11:00, tivemos uma demanda menor, com apenas 1 encomenda em cada uma dessas horas. Nas demais horas, não houve registros de pedidos de pizzas.

| hora | total_pizza |
|:------:|:-------------:|
|  11  |      1      |
|  13  |      3      |
|  18  |      3      |
|  19  |      1      |
|  21  |      3      |
|  23  |      3      |


&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/image13.png" width="30%"/>
</div>

&nbsp;

* Qual foi o total de pedidos para cada dia da semana?

>Quarta e sábado tiveram o maior número de pedidos, totalizando 5 cada. Na quinta, foram 3 pedidos, e na sexta, apenas 1. Os demais dias não tiveram registros de pedidos.

|   semana    | total_runner |
|:------------:|:------------:|
| 2021-01-01  |       2      |
| 2021-01-08  |       1      |
| 2021-01-15  |       1      |


&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto06/images/image27.png" width="30%"/>
</div>