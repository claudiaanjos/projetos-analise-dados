<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/e16522c4be14aea439d63e964d4e75b6eeb939da/projetos/projeto01/images/image0.png" width="80%"/>
</div>

&nbsp;

Como parte do meu aprimoramento na área de Análise de Dados, estou embarcando em uma jornada de aprendizado que envolve o desenvolvimento de estudos de caso. Esta iniciativa tem como objetivo não apenas adquirir conhecimentos teóricos, mas também aplicá-los de forma prática.

Para proporcionar um contexto a essa exploração, apresento um cenário fictício que servirá como pano de fundo para o estudo.

## Cenário

Banco Alcobaça é uma instituição bancária fictícia que atua em Portugal. Embora seja uma empresa de pequeno porte, tem grandes ambições de se destacar no cenário bancário português e tem investido em diversos produtos. Para conquistar mais clientes decidiram lançar um produto: o Depósito Bancário.

O Depósito Bancário é uma forma de investimento de baixo risco em que você deposita uma quantia de dinheiro em uma instituição financeira por um período de tempo específico, conhecido como "prazo". Durante esse período, o dinheiro não pode ser retirado sem penalidades.

Após incluir o Depósito Bancário na lista de produtos, decidiram questionar nas campanhas de marketing direto, através de ligações telefônicas, se o produto foi ou não adquirido pelo cliente.

Sua equipe foi selecionada para analisar o perfil do cliente que estaria mais propenso a adquirir esse novo produto. Seu trabalho é fornecer insights que ajudarão a aprimorar as estratégias de campanhas de marketing e, assim, aumentar a taxa de conversão.

## Dados

O conjunto de dados, obtido do UCI Machine Learning Repository, foi criado por S. Moro, P. Rita e P. Cortez e está sob a licença internacional de Atribuição 4.0 (CC BY 4.0). Isso significa que você pode usar, compartilhar e adaptar a obra, desde que atribua o devido crédito aos autores originais e não adicione restrições adicionais para outros que desejem usar essa obra. Você pode acessar o conjunto de dados [aqui](https://archive.ics.uci.edu/dataset/222/bank+marketing).

Os dados se relacionam a campanhas de marketing direto conduzidas por uma instituição bancária em Portugal por meio de ligações telefônicas. Algumas modificações foram feitas no conjunto de dados para focar na limpeza e análise. 

Mais informações sobre os dados e o dicionário de dados estão disponíveis no notebook.


## Preparação dos dados

Após avaliação do conjunto de dados, identificamos e solucionamos algumas questões antes de prosseguirmos com a análise dos dados. São elas:

- A coluna “jobedu”, que corresponde ao tipo de trabalho e escolaridade, foi dividida em duas (job e education);

- A coluna “age”, que corresponde a idade em anos, apresentou 0,04% (20 registros) de valores ausentes. Optamos por imputar os valores com a moda (32 anos), que representa o valor mais frequente. A média não era adequada devido à assimetria na distribuição dos dados e à presença de outliers;

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/e16522c4be14aea439d63e964d4e75b6eeb939da/projetos/projeto01/images/image13.png" width="40%"/>
</div>

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/e16522c4be14aea439d63e964d4e75b6eeb939da/projetos/projeto01/images/image1.png" width="60%"/>
</div>

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/e16522c4be14aea439d63e964d4e75b6eeb939da/projetos/projeto01/images/image2.png" width="60%"/>
</div>

&nbsp;

- A coluna “month”, que corresponde ao último mês de contato do ano, apresentou 0,11% (50 registros) de valores ausentes. Optamos por imputar com o valor da moda (may, 2017);

- A coluna “salary”, que corresponde ao salário anual em euros do cliente, apresentou 0,06% (26 registros) de valores ausentes e 288 registros com o valor igual a zero. Optamos por imputar com o valor da mediana (60000 euros), uma vez que os dados parecem apresentar assimetria. A média não é apropriada neste caso, e a moda também não, pois o valor mais frequente está consideravelmente abaixo da média e da mediana;

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/e16522c4be14aea439d63e964d4e75b6eeb939da/projetos/projeto01/images/image3.png" width="60%"/>
</div>

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/e16522c4be14aea439d63e964d4e75b6eeb939da/projetos/projeto01/images/image4.png" width="60%"/>
</div>

&nbsp;

- A coluna “response”, com a informação se o cliente assinou ou não o depósito a prazo, apresentou 0,07% (30 registros) de valores ausentes. Como essa é uma variável alvo/resposta não devemos aplicar imputação, então deletamos esses registros;

- A coluna “pdays”, que corresponde ao número de dias que se passaram desde o último contato do cliente em uma campanha anterior, apresentou 81,7% de valores ausentes. Dado que o percentual é superior a 30%, eliminamos a coluna.

## Análises
 
- Temos que 88,3% dos clientes não adquiriram o produto;

- A idade máxima é de 95 anos e mínima de 18 anos. A média é de 41 anos e a mediana de 39 anos;

- A idade mais frequente é de 32 anos. Percebe-se que grande parte dos clientes que adquiriram o produto estão na faixa dos 30 a 35 anos;

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/e16522c4be14aea439d63e964d4e75b6eeb939da/projetos/projeto01/images/image5.png" width="60%"/>
</div>

&nbsp;

- No total temos que 60,2% dos clientes são casados. Analisando apenas os que adquiriram o produto essa proporção é de 52,1% de casados;

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/e16522c4be14aea439d63e964d4e75b6eeb939da/projetos/projeto01/images/image6.png" width="60%"/>
</div>

&nbsp;

- Dentre as ocupações dos clientes, as funções 'blue-collar' se destacam como as mais comuns, representando 21,5% do total. Essas ocupações são caracterizadas por atividades físicas e manuais (como construção, montagem, manutenção, produção industrial, entre outros). No entanto, quando examinamos os clientes que adquiriram o produto, notamos uma predominância de cargos de 'management'. Essas posições envolvem liderança e gestão, com os indivíduos desempenhando papéis-chave na tomada de decisões e na coordenação das operações de suas respectivas organizações;

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/e16522c4be14aea439d63e964d4e75b6eeb939da/projetos/projeto01/images/image7.png" width="60%"/>
</div>

&nbsp;

- Analisando todos os clientes, bem como aqueles que adquiriram o produto, a maioria possui educação equivalente ao ensino médio, conhecido como 'secondary'. O termo 'secondary' se refere, em geral, ao nível de educação secundária, que é a etapa da educação formal que segue a educação primária e antecede o ensino superior;

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/e16522c4be14aea439d63e964d4e75b6eeb939da/projetos/projeto01/images/image8.png" width="50%"/>
</div>

&nbsp;

- A média salarial anual dos clientes que não adquiriram o produto era de 57.157 euros, enquanto os que adquiriram tinham uma média de 59.157 euros. A mediana permaneceu constante em 60.000 euros. O boxplot revela que os clientes que não adquiriram o produto tendem a ter salários abaixo da mediana, enquanto os compradores têm salários acima da mediana. Observamos também uma tendência de aumento salarial com níveis educacionais mais altos;

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/e16522c4be14aea439d63e964d4e75b6eeb939da/projetos/projeto01/images/image10.png" width="60%"/>
</div>

&nbsp;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/e16522c4be14aea439d63e964d4e75b6eeb939da/projetos/projeto01/images/image11.png" width="60%"/>
</div>

&nbsp;

- Ao examinar os dados relacionando o saldo bancário com o salário, não fica evidente uma relação clara e linear. No entanto, quando observamos a relação entre o saldo bancário e a idade, notamos uma tendência. À medida que a idade aumenta, há um leve aumento no saldo bancário;

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/e16522c4be14aea439d63e964d4e75b6eeb939da/projetos/projeto01/images/image9.png" width="60%"/>
</div>

- Identificamos padrões interessantes no mapa de correlação. Por exemplo, notamos que clientes solteiros com ensino superior (terciary) apresentaram uma maior probabilidade de compra do produto. Em contrapartida, clientes casados com educação fundamental (primary) parecem ter uma probabilidade menor de compra dentro desse grupo específico.

<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/e16522c4be14aea439d63e964d4e75b6eeb939da/projetos/projeto01/images/image12.png" width="60%"/>
</div>

&nbsp;

&nbsp;

## Dashboards Power BI

### Dashboard Geral

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/bb573e6051737608ea38effa44e924bd8b4f1c67/projetos/projeto01/images/image14.png"/>

&nbsp;

### Dashboard dos Compradores do Produto

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/bb573e6051737608ea38effa44e924bd8b4f1c67/projetos/projeto01/images/image15.png"/>

&nbsp;

### Dashboard dos Principais Influcenciadores para Aquisição do Produtos

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/bb573e6051737608ea38effa44e924bd8b4f1c67/projetos/projeto01/images/image16.png"/>




