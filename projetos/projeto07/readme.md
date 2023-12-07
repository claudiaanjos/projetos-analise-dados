<div align='center'>
<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto07/images/image00.png" width="100%"/>
</div>

&nbsp;

Esse projeto faz parte do [8 Week SQL Challenge](https://8weeksqlchallenge.com/) disponibilizado pelo [Data With Danny](https://www.datawithdanny.com/).

O objetivo do Desafio SQL de 8 Semanas é incentivar profissionais da área de dados a desenvolver projetos com SQL.
Em cada projeto teremos um estudo de caso com apresentação do cenário, os problemas e os dados.
Iremos trabalhar no terceiro estudo de caso: 🥑 [Foodie-Fi](https://8weeksqlchallenge.com/case-study-3/).

## Introdução

Empresas baseadas em assinaturas são extremamente populares e Danny percebeu que havia uma grande lacuna no mercado - ele queria criar um novo serviço de streaming que tivesse apenas conteúdo relacionado a alimentos, algo como a Netflix, mas apenas com programas de culinária!

Danny encontrou alguns amigos inteligentes para lançar sua nova startup, Foodie-Fi, em 2020, e começou a vender assinaturas mensais e anuais, proporcionando aos clientes acesso ilimitado sob demanda a vídeos exclusivos de culinária de todo o mundo!

Danny criou a Foodie-Fi com uma mentalidade orientada por dados e queria garantir que todas as decisões de investimento futuro e novos recursos fossem tomadas com base em dados. Este estudo de caso se concentra no uso de dados digitais no estilo de assinatura para responder a questões importantes de negócios.

## Conjunto de dados

A condução da análise foi realizada com o [BigQuery](https://cloud.google.com/bigquery) do Google Cloud Platform.

Os scripts de criação e inserção de dados estão no arquivo [tabelas.sql]().

Danny compartilhou o design de dados para o Foodie-Fi, incluindo breves descrições de cada uma das tabelas do banco de dados. Nosso estudo de caso se concentra em apenas 2 tabelas.


### Dicionário das variáveis

**Tabela 1: plans**

Os clientes podem escolher quais planos aderir ao Foodie-Fi quando se inscrevem pela primeira vez.

Os clientes do plano Básico têm acesso limitado e podem apenas transmitir seus vídeos, disponível apenas mensalmente por $9,90.

Os clientes do plano Pro não têm limites de tempo de visualização e podem baixar vídeos para visualização offline. Os planos Pro começam em $19,90 por mês ou $199 para uma assinatura anual.

Os clientes podem se inscrever para um teste gratuito inicial de 7 dias, que continuará automaticamente com o plano de assinatura mensal Pro, a menos que cancelem, reduzam para o plano básico ou façam upgrade para um plano Pro anual a qualquer momento durante o teste.

Quando os clientes cancelam o serviço Foodie-Fi, eles terão um registro de plano de desistência (*churn*) com um preço nulo (*null*), mas o plano continuará até o final do período de faturamento.

* **plan_id**: identificador numérico do tipo de plano.
* **plan_name**: nome do tipo de plano.
* **price**: valor do plano.

&nbsp;

| plan_id |   plan_name    | price |
|:-------:|:--------------:|:-----:|
|    0    |     trial      |   0   |
|    1    | basic monthly  | 9.90  |
|    2    |  pro monthly   | 19.90 |
|    3    |   pro annual   |  199  |
|    4    |     churn      |  null |

&nbsp;

**Tabela 2: subscriptions**

As assinaturas dos clientes mostram a data exata em que o plano específico, identificado pelo *plan_id*, é iniciado.

Se os clientes reduzirem o plano de um plano Pro ou cancelarem sua assinatura, o plano superior permanecerá ativo até o final do período, e a data de início (*start_date*) na tabela de assinaturas refletirá a data em que a mudança efetiva de plano ocorreu.

Quando os clientes atualizam sua conta de um plano básico para um plano Pro ou Pro anual, o plano superior entra em vigor imediatamente.

Ao cancelarem o serviço (churn), os clientes manterão o acesso até o final do período de faturamento atual, mas a data de início (*start_date*) técnica será o dia em que decidiram cancelar o serviço.

* **customer_id**: identificador numérico do cliente.
* **plan_id**: identificador numérico do tipo de plano adquirido pelo cliente.
* **start_date**: data em que o plano entrou em vigor.

&nbsp;

| customer_id | plan_id | start_date |
|:-----------:|:-------:|:----------:|
|      1      |    0    | 2020-08-01 |
|      1      |    1    | 2020-08-08 |
|      2      |    0    | 2020-09-20 |
|      2      |    3    | 2020-09-27 |
|     11      |    0    | 2020-11-19 |
|     11      |    4    | 2020-11-26 |
|     13      |    0    | 2020-12-15 |
|     13      |    1    | 2020-12-22 |
|     13      |    2    | 2021-03-29 |
|     15      |    0    | 2020-03-17 |
|     15      |    2    | 2020-03-24 |
|     15      |    4    | 2020-04-29 |
|     16      |    0    | 2020-05-31 |
|     16      |    1    | 2020-06-07 |
|     16      |    3    | 2020-10-21 |
|     18      |    0    | 2020-07-06 |
|     18      |    2    | 2020-07-13 |
|     19      |    0    | 2020-06-22 |
|     19      |    2    | 2020-06-29 |
|     19      |    3    | 2020-08-29 |

&nbsp;

### Diagrama de Relacionamento de Entidades

&nbsp;

<div align='center'>
<img src="https://8weeksqlchallenge.com/images/case-study-3-erd.png" width="40%"/>
</div>

&nbsp;

## Análises

Este estudo de caso foi dividido por áreas de foco:

* A: [Jornada do Cliente](https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto07/parteA.md)
* B: [Análise dos Dados](https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto07/parteB.md)
* C: [Pagamentos](https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto07/parteC.md)
* D: [Questões de Negócio](https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto07/parteD.md)

Ao clicar em cada parte você será direcionado para a respectiva análise.

No diretório [scripts](https://github.com/claudiaanjos/projetos-analise-dados/tree/main/projetos/projeto07/scripts) também encontrará essa divisão em partes.

## Relatório

### Jornada do Cliente

Com base na amostra dos 8 clientes na tabela *subscriptions*, descreva brevemente a jornada de integração de cada cliente. Tente manter as descrições o mais concisas possível.

Com as informações das amostras temos o seguinte:

* Todos os clientes da amostra começaram com uma inscrição para o teste gratuito (*trial*) de 7 dias.
* Os clientes 11 e 15 foram os únicos que não prosseguiram com a assinatura. O cliente 11 desistiu após o período de teste, enquanto o cliente 15 cancelou após 36 dias utilizando o plano mensal premium (*pro monthly*). 
* O plano anual premium (*pro annual*) foi adquirido apenas pelos clientes 2, 16 e 19  com permanências de 7, 136 e 61 dias, respectivamente.
* O cliente 16 é o que está utilizando o foodie-fi há mais tempo. Ele adquiriu o plano mensal básico (*basic monthly*) e, após 7 dias, migrou para o plano anual premium.
* Todos os clientes assinam algum plano premium (mensal ou anual), exceto o cliente 1, que assina o plano mensal básico, e o cliente 11, que não continuou na plataforma.

### Análise dos Dados

Durante o período de dezembro de 2020 a dezembro de 2021, o Foodie-Fi atraiu um total de 1000 clientes. O mês de março se destacou com o maior número de assinaturas gratuitas, alcançando 94, enquanto fevereiro registrou o menor número, com 68 adesões.

Observou-se uma mudança significativa no comportamento dos clientes a partir de 2021. O teste gratuito não atraiu mais assinantes, mas notou-se a desistência de 71 clientes. No total, 307 clientes optaram por cancelar suas assinaturas, representando 30.7% do total de usuários. Após o período de teste gratuito, 92 clientes decidiram não continuar, equivalendo a 9% do total de usuários.

A maioria dos clientes, após o teste gratuito, escolhe a transição para o plano mensal básico, representando 55% do total. Em contraste, apenas 4% dos clientes optam pelo plano anual premium.

Em dezembro de 2020, a distribuição dos clientes nos diferentes planos é a seguinte: 32.6% escolhem o plano mensal premium, 22.4% o plano mensal básico, 19.5% aderem ao plano anual premium, 1.9% permanecem no período de teste e 23.6% cancelam a assinatura.

No mesmo ano, 195 clientes realizaram o upgrade para um plano anual. A média de dias que um cliente leva para fazer esse upgrade desde o dia da inscrição no Foodie-Fi é de 105 dias.

Observa-se que nos primeiros 30 dias, a maioria dos clientes decide assinar um plano anual. Entretanto, após 210 dias, a decisão diminui, e após 270 dias, há pouca atividade em termos de aquisição de um plano anual.

**Recomendações**

Com base na análise acima, recomenda-se as seguintes medidas para o Foodie-Fi melhorar a sua taxa de retenção de clientes:

* Melhorar a oferta de planos pagos para atender às diferentes necessidades dos clientes.
* Aumentar a conscientização sobre os benefícios dos planos pagos.
* Oferecer descontos ou promoções para incentivar mais clientes a assinarem o plano anual premium.

Seria interessante realizar pesquisas com clientes para entender melhor as suas necessidades e expectativas. Essa informação pode ser usada para melhorar a plataforma e oferecer uma experiência melhor aos clientes.


### Pagamentos

A equipe do Foodie-Fi solicitou uma nova tabela de pagamentos para o ano de 2020, com os valores pagos por cada cliente pelos planos. A tabela foi criada seguindo os requisitos abaixo:

* As cobranças mensais são processadas sempre no mesmo dia do mês da data de início original de qualquer plano sujeito a pagamento mensal.
* Quando um cliente realiza um upgrade de um plano básico para um plano mensal ou premium, o custo desse upgrade é descontado proporcionalmente do valor já pago pelo cliente no mesmo mês do plano básico. Além disso, o novo plano passa a ser efetivo imediatamente, sem a necessidade de aguardar até o próximo ciclo de faturamento.
* No caso de upgrades de planos mensais premium para anuais premium, o pagamento é realizado no final do ciclo de faturamento atual e a vigência do novo plano também se inicia no final desse mesmo período mensal.*.
* Quando um cliente opta pelo cancelamento, ele não realizará mais pagamentos.


### Questões de Negócio

**Avaliação do desempenho e retenção de clientes da Foodie-Fi**

A Foodie-Fi é uma plataforma de streaming de conteúdo gastronômico que deve monitorar as seguintes métricas para avaliar seu desempenho: receita, custos, lucro, satisfação do cliente e retenção de clientes.

A retenção de clientes é uma métrica importante para a Foodie-Fi, pois mede a satisfação dos clientes com o serviço. Para melhorar a retenção de clientes, a empresa pode considerar as seguintes alavancas de negócios:

* Melhoria do conteúdo: investir na produção de conteúdo mais diversificado, exclusivo e atrativo.
* Programas de fidelidade e recompensas: introduzir programas que recompensam a longevidade da assinatura com benefícios exclusivos.
* Melhor suporte ao cliente: aprimorar os canais de suporte ao cliente para resolver rapidamente problemas e fornecer assistência proativa.
* Opções de cancelamento flexíveis: oferecer opções como pausar a assinatura temporariamente em vez de cancelar completamente.
* Pesquisas de satisfação periódicas: realizar pesquisas regulares para identificar áreas de melhoria contínua.
* Ofertas e descontos personalizados: enviar ofertas ou descontos personalizados para clientes em risco de cancelamento.

A gestão da Foodie-Fi deve escolher as alavancas de negócios mais adequadas para seu negócio e sua base de clientes. É importante monitorar a eficácia dessas iniciativas para identificar o que está funcionando e o que não está.

**Observações adicionais**

A gestão da Foodie-Fi deve acompanhar a taxa de churn e coletar feedback dos clientes para identificar as principais razões pelas quais eles estão cancelando suas assinaturas.
A Foodie-Fi deve implementar as alavancas de negócios escolhidas de forma consistente e com foco na satisfação dos clientes.