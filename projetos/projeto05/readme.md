<div align='center'>
    <img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto05/images/image00.png" width="80%"/>
</div>

&nbsp;

Esse projeto faz parte do [8 Week SQL Challenge](https://8weeksqlchallenge.com/) disponibilizado pelo [Data With Danny](https://www.datawithdanny.com/).

O objetivo do Desafio SQL de 8 Semanas é apoiar os profissionais da área de dados a desenvolver projetos com SQL.
Em cada projeto teremos um estudo de caso com apresentação do cenário, os problemas e os dados.
Iremos trabalhar no primeiro estudo de caso: [Danny's Diner](https://8weeksqlchallenge.com/case-study-1/).

## Introdução

Danny adora comida japonesa e, no início de 2021, decidiu embarcar em uma empreitada arriscada e abrir um restaurante que vende seus 3 pratos favoritos: sushi, curry e ramen.

O Danny's Diner precisa da sua ajuda para manter o restaurante funcionando. Ele coletou alguns dados básicos nos primeiros meses de operação, mas não tem ideia de como usar esses dados para administrar o negócio.

## Problema

Danny quer usar os dados para responder algumas perguntas simples sobre seus clientes, especialmente sobre seus padrões de visita, quanto dinheiro eles gastaram e quais itens do cardápio são os favoritos. Ter essa conexão mais profunda com seus clientes o ajudará a oferecer uma experiência melhor e mais personalizada para seus clientes leais.

Ele planeja usar essas informações para decidir se deve expandir o programa de fidelidade existente para os clientes. Além disso, ele precisa de ajuda para gerar alguns conjuntos de dados básicos para que sua equipe possa inspecionar os dados facilmente sem precisar usar SQL.

Danny forneceu uma amostra dos dados gerais de seus clientes devido a questões de privacidade, mas espera que esses exemplos sejam suficientes para você escrever consultas SQL totalmente funcionais para ajudá-lo a responder suas perguntas.

Danny compartilhou três conjuntos de dados-chave para este estudo de caso: **sales**, **menu** e **members**.

## Conjunto de dados

A condução da análise foi realizada com [PostgreSQL](https://www.postgresql.org/) utilizando o [DB Fiddle](https://www.db-fiddle.com/).

Os scripts de criação e inserção de dados estão no arquivo [tabelas.sql](https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto05/tabelas.sql).

### Dicionário das variáveis

**Tabela 1: sales**

* **customer_id**: Identificador do cliente.
* **order_date**: Data em que a compra foi feita.
* **product_id**: Identificador do produto pedido.

**Tabela 2: menu**

* **product_id**: Identificador do produto.
* **product_name**: Nome real do produto.
* **price**: Preço do produto.

**Tabela 3: members**

* **customer_id**: Identificador do cliente.
* **join_date**: Data de adesão ao programa de fidelidade do Danny's Diner.

### Diagrama de Relacionamento de Entidades

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto05/images/image01.png" width="50%"/>
</div>

&nbsp;

## Análises

Os scripts das análises encontram-se no arquivo [analise.sql](https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto05/analise.sql).

* **Qual é o valor total gasto por cada cliente no restaurante?**

>O cliente A teve a maior despesa, totalizando $76, seguido pelo cliente B, que gastou $74, e o cliente C, cujo total foi de $36.

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto05/images/image14.png" width="50%"/>
</div>

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto05/images/image02.png" width="70%"/>
</div>

&nbsp;

* Quantos dias cada cliente visitou o restaurante?

>Apesar de o cliente A ter registrado o maior gasto, o cliente B foi quem mais frequentou o restaurante, realizando um total de 6 visitas. O cliente A compareceu em 4 ocasiões, enquanto o cliente C esteve presente em 2 dias distintos. 

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto05/images/script03.png" width="60%"/>
</div>


<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto05/images/image03.png" width="60%"/>
</div>

&nbsp;

* Qual foi o primeiro item do cardápio comprado por cada cliente?

>Na primeira compra, o cliente A escolheu curry e sushi, enquanto o cliente B optou por curry e o cliente C selecionou ramen.

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto05/images/image04.png" width="60%"/>
</div>

&nbsp;

* Qual é o item mais comprado no cardápio e quantas vezes foi pedido por todos os clientes?

>O ramen se destaca como o item mais solicitado, totalizando 8 pedidos entre todos os clientes.

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto05/images/image05.png" width="60%"/>
</div>

&nbsp;

* Qual item foi mais popular para cada cliente?

>Tanto para os clientes A quanto C, o destaque vai para o ramen, adquirido em três ocasiões por cada um. No entanto, o cliente B não apresentou um item mais popular, pois distribuiu suas escolhas de maneira equitativa, comprando todos os produtos duas vezes cada. 

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto05/images/image06.png" width="60%"/>
</div>

&nbsp;

* Qual foi o primeiro item adquirido por cada cliente após tornar-se membro?

>Após tornar-se membro do restaurante, o cliente A fez seu primeiro pedido escolhendo o ramen, enquanto o cliente B optou por sushi. Vale ressaltar que o cliente C não faz parte do programa de membros.

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto05/images/image07.png" width="60%"/>
</div>

&nbsp;

* Qual item foi adquirido antes de o cliente se tornar um membro?

>Antes de tornar-se membro, o cliente A fez um pedido que incluía sushi e curry, enquanto o cliente B optou por sushi.

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto05/images/image08.png" width="60%"/>
</div>

&nbsp;

* Qual é o total de itens e valor gasto por cada membro antes de se tornarem membros?

>Antes de se tornar membro, o cliente A adquiriu dois itens, totalizando um gasto de $25, enquanto o cliente B fez três pedidos, somando um valor de $40.

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto05/images/image09.png" width="60%"/>
</div>

&nbsp;

* Se cada $1 gasto equivale a 10 pontos e o sushi tem um multiplicador de pontos de 2x, quantos pontos cada cliente teria?

>A pontuação de cada cliente seria a seguinte: o cliente A acumularia 860 pontos, o cliente B atingiria 940 pontos, e o cliente C alcançaria 360 pontos. Nota-se que o cliente B possui a pontuação mais alta, ao passo que o cliente C registra a menor pontuação.

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto05/images/image10.png" width="60%"/>
</div>

&nbsp;

* Durante a primeira semana após a adesão de um cliente ao programa (incluindo a data de inscrição), eles recebem pontos em dobro em todos os itens, não se limitando ao sushi. Ao considerar essa promoção, quantos pontos os clientes A e B acumulariam no final de janeiro?

>Dadas essas condições, ao final de janeiro, o cliente A teria acumulado 1370 pontos, enquanto o cliente B atingiria 820 pontos. Isso reflete não apenas o gasto em produtos, mas também o benefício adicional da promoção da primeira semana para ambos os clientes.

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto05/images/image11.png" width="60%"/>
</div>

&nbsp;


### Extras

As questões a seguir estão relacionadas à criação de tabelas de dados que Danny e sua equipe podem usar para obter insights rapidamente sem a necessidade de unir as tabelas subjacentes usando SQL.

* Organização das Informações

Para consolidar todas as informações de maneira clara, vamos criar uma tabela que inclua dados essenciais sobre cada transação. A tabela deve conter as seguintes colunas: Identificação do Cliente, Data do Pedido, Produto Adquirido, Valor da Compra e Indicação de Participação no Programa de Membros.

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto05/images/image12.png" width="50%"/>
</div>

&nbsp;

* Classificação dos Produtos

Para aprimorar a análise, Danny precisa de mais informações sobre a classificação dos produtos pelos clientes. No entanto, ele especificamente dispensa a classificação para compras de não membros, e, portanto, espera valores de classificação nulos nos registros quando os clientes ainda não fazem parte do programa de fidelidade.

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto05/images/image13.png" width="50%"/>
</div>

&nbsp;

## Relatório

Ao analisar os padrões de consumo dos clientes no restaurante, podemos destacar os pontos a seguir.

* **Despesas e Frequência de Visitas**:

    - Cliente A lidera em despesas com $76.
    - Cliente B, gastando $74, supera em frequência com seis visitas.
    - Cliente C, com gasto total de $36, participa menos ativamente.

* **Preferências de Compra**:

    - Ramen é o item mais requisitado, totalizando 8 pedidos.
    - Clientes A e C têm preferência pelo ramen, escolhendo-o três vezes cada.
    - Cliente B destaca-se pela diversificação, escolhendo igualmente todos os produtos.

* **Adesão ao Programa de Membros**:

    - Cliente A inicia a jornada de pontos escolhendo o ramen após adesão.
    - Cliente B, ao aderir, escolhe sushi como primeiro pedido.
    - Cliente C ainda não participa do programa de membros.

* **Gastos Pré-adesão ao Programa**:

    - Cliente A investe $25 em dois itens distintos.
    - Cliente B gasta $40 em três pedidos antes da adesão.

Esses insights, ao serem considerados de forma integrada, oferecem uma visão abrangente das dinâmicas no restaurante, proporcionando orientação valiosa para estratégias futuras e aprimoramento da experiência do cliente.