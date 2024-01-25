<div align='center'>
    <img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto09/images/image12.png" width="100%"/>
</div>

<br>

**Esse projeto deriva da formação do Google Advanced Data Analytics Professional Certificate.**

<br>

## Contexto

O aplicativo de navegação gratuito do Waze simplifica as viagens para motoristas em todo o mundo, contando com a colaboração de uma comunidade diversificada, incluindo editores de mapas, testadores beta, tradutores, parceiros e usuários. O Waze estabelece parcerias com cidades, autoridades de transporte, emissoras, empresas e socorristas para otimizar a eficiência e a segurança nas viagens.

A liderança do Waze solicitou à equipe de dados o desenvolvimento de um modelo de aprendizado de máquina para prever a rotatividade de usuários. Nesse contexto, como novo integrante da equipe de dados, minha contribuição será essencial para analisar e interpretar dados, gerar insights valiosos e auxiliar na tomada de decisões estratégicas.

Este projeto integra os esforços do Waze para impulsionar o crescimento, visando à prevenção da rotatividade e ao aumento da retenção de usuários. A implementação de um modelo de previsão de rotatividade é importante para otimizar os negócios do Waze.

**Membros da equipe do Waze**

Como nova analista de dados, irei colaborar estreitamente com uma equipe talentosa de profissionais experientes em análise de dados. Além disso, estarei envolvida em colaborações com outros profissionais do Waze conforme necessário para o projeto.

*Equipe de dados:*

- Diretora de Análise de Dados: Harriet Hadzic
- Gerente de Análise de Dados: May Santner
- Analista de Dados Sênior: Chidi Ga
- Gerente de Projeto Sênior: Sylvester Esperanza

*Outras equipes:*

- Líder do Departamento de Finanças e Administração: Emrick Larson
- Gerente de Operações: Ursula Sayo

<br>

>**Nota: A história, personagens e eventos são fictícios e não possuem qualquer ligação com indivíduos ou dados reais do Waze.**

<br>

## Estrutura do Projeto

O projeto foi desenvolvido em etapas distintas. Após cada interação com a equipe de dados e em atendimento às demandas da liderança, foram submetidos entregáveis específicos. Cada etapa inclui observações de reuniões e trocas de e-mails entre a equipe de dados, além do notebook e resumo executivo, proporcionando insights e respostas essenciais para a liderança.

É importante destacar que utilizamos o framework PACE para estruturar os notebooks. Para mais informações acesse o artigo [Framework PACE](https://medium.com/@ndosanjosc/framework-pace-a5f1d0010dde).

As etapas foram as seguintes:

- Etapa_01: Planejamento do Projeto
- Etapa_02: Análise Preliminar dos Dados
- Etapa_03: Análise Exploratória dos Dados
- Etapa_04: Teste de Hipótese
- Etapa_05: Regressão Logística
- Etapa_06: Modelos de Machine Learning

<br>

<div align='center'>
    <img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto09/images/image01.png" width="70%"/>
</div>

<br>

## Desenvolvimento do Projeto

Durante a primeira etapa, iniciamos o planejamento do projeto. Assim que os dados foram disponibilizados juntamente com o [dicionário de dados](), realizamos uma análise preliminar, resultando nos seguintes insights:

- Observamos que 82% dos usuários foram retidos, enquanto 18% deixaram de usar o aplicativo.
- O conjunto de dados consiste em 13 variáveis, sendo que 700 registros (cerca de 5%) estão ausentes na variável rótulo.
- Em relação aos dispositivos utilizados, aproximadamente 64% dos usuários utilizam iPhone, enquanto cerca de 36% usam Android.
- Os usuários que deixaram de usar o aplicativo apresentaram, em média, aproximadamente 3 viagens a mais no último mês, além de mais viagens em menos dias, e suas viagens foram mais longas em distância e duração.
- Por outro lado, os usuários retidos utilizaram o aplicativo em mais do que o dobro dos dias em comparação com os usuários que deixaram de usar no mesmo período.

Avançando para a terceira etapa, conforme planejado, realizamos a Análise Exploratória dos Dados e identificamos o seguinte:

- Quanto mais os usuários utilizaram o aplicativo, menor foi a probabilidade de abandono. Enquanto 40% dos não usuários no último mês abandonaram, nenhum usuário que utilizou o aplicativo por 30 dias o abandonou.
- A distância diária percorrida correlacionou-se positivamente com o abandono, indicando que usuários que dirigiram maiores distâncias eram mais propensos a abandonar.
- O número de dias de direção teve uma correlação negativa com o abandono, sugerindo que usuários que dirigiram mais dias no último mês eram menos propensos a abandonar.
- Algumas variáveis apresentaram valores atípicos altamente improváveis ou mesmo impossíveis, como: quilômetros dirigidos, dias de atividade e dias de direção.
- A taxa de abandono é mais alta para pessoas que não utilizaram muito o Waze durante o último mês.
- A proporção de usuários que abandonaram em relação aos usuários retidos é consistente entre os tipos de dispositivos.

<br>

<div align='center'>
    <img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto09/images/image08.png" width="80%"/>
</div>

<br>

Apesar de não planejado inicialmente, realizamos um teste de hipótese de duas amostras para analisar se existe uma diferença estatisticamente significativa entre a média de viagens conforme o tipo de dispositivo – Android vs. iPhone.

Com base nos cálculos, observamos que motoristas que utilizam iPhone têm, em média, um número superior de viagens. Entretanto, o teste t concluiu que não há diferença estatisticamente significativa na média de viagens entre usuários de iPhone e Android, apesar do desempenho médio superior para os usuários de iPhone.

<br>

<div align='center'>
    <img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto09/images/image09.png" width="30%"/>
</div>

<br>

Seria interessante conduzir mais testes em diferentes variáveis para entender melhor o comportamento do usuário, com base nos resultados deste teste de hipótese. Mudanças temporárias em marketing ou na interface do usuário, devido à experiência semelhante, podem oferecer dados valiosos para entender o comportamento de rotatividade do usuário.

A equipe desenvolveu um modelo de regressão logística binomial para prever a rotatividade de usuários. A eficácia do modelo foi avaliada por meio dos escores de acurácia, precisão e recall, sendo este último de particular importância por indicar a proporção de usuários cancelados corretamente identificados pelo modelo. 

- O modelo demonstrou uma precisão mediana, onde aproximadamente 53% das previsões positivas estão corretas. No entanto, o recall apresentou um desempenho muito baixo, identificando apenas 9% dos usuários cancelados. Isso sugere que o modelo está gerando muitos falsos negativos, falhando em capturar usuários que estão propensos a cancelar.
- A variável "activity_days" se destacou como a característica mais influente no modelo, exibindo uma correlação negativa significativa com o cancelamento do usuário. 
- Contrariando a tendência observada na Análise Exploratória de Dados (EDA) anterior, onde a taxa de cancelamento do usuário aumentava com o aumento dos valores em "km_per_driving_day", esta variável foi identificada como a segunda menos importante no modelo.

<br>

<div align='center'>
    <img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto09/images/image10.png" width="40%"/>
</div>

<br>

Recomendamos utilizar as principais descobertas do modelo para orientar futuras explorações no projeto. Embora o modelo não seja adequado para decisões de negócios críticas, destaca a necessidade de mais dados relacionados ao cancelamento de usuários. Sugerimos também aprimorar o perfil de usuário para impulsionar o crescimento global e evitar cancelamentos mensais no aplicativo.

A última etapa do projeto consistiu em desenvolver um modelo de aprendizado de máquina (ML) para prever a rotatividade de usuários. Para obter um modelo com o maior poder preditivo, a equipe de dados do Waze desenvolveu dois modelos diferentes para comparar resultados: Random Forest e XGBoost. 

Os dados foram divididos em conjuntos de treinamento, validação e teste. Embora a divisão em três conjuntos reduza a quantidade de dados para treinar, permite selecionar o melhor modelo usando um conjunto de validação separado, resultando em uma melhor estimativa do desempenho futuro em comparação com uma divisão em dois conjuntos.

Destacamos os seguintes pontos-chave:

- As variáveis criadas representaram seis das dez principais: km_per_hour, percent_sessions_in_last_month, total_sessions_per_day, percent_of_drives_to_favorite, km_per_drive, km_per_driving_day.

<br>

<div align='center'>
    <img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto09/images/image11.png" width="60%"/>
</div>

<br>

- O modelo XGBoost se ajustou melhor aos dados do que o modelo de Random Forest. Além disso, é importante destacar que a pontuação de recall (17%) é quase o dobro da pontuação do modelo de regressão logística anterior construído na Etapa 5, mantendo uma precisão e acurácia semelhantes. 
- Os conjuntos de modelos baseados em árvores nesta etapa do projeto superam um único modelo de regressão logística em termos de desempenho, exigindo menos pré-processamento de dados, embora a interpretação de suas previsões seja mais complexa.

Os modelos de aprendizado de máquina desenvolvidos demonstram uma necessidade de dados adicionais para prever com mais precisão a perda de usuários.

Os modelos de aprendizado de máquina desenvolvidos destacam a necessidade de dados adicionais para prever com mais precisão a perda de usuários. O esforço de modelagem ressalta que os dados atuais são insuficientes para prever consistentemente a rotatividade de usuários. Sugerimos obter informações de viagem detalhadas e dados mais granulares sobre a interação dos usuários com o aplicativo. Recomendamos uma segunda iteração do Projeto de Retenção de Usuários.

<br>

>Observação: Em cada etapa do projeto, temos à disposição detalhes adicionais, como descrição específica das atividades realizadas, registros das reuniões com as equipes, e-mails enviados, além de um notebook contendo análises completas e um resumo executivo da respectiva etapa. Esses recursos adicionais são fundamentais para proporcionar uma compreensão mais detalhada do processo de análise de dados, bem como das decisões tomadas ao longo do projeto. Eles fornecem um contexto valioso para interpretar os resultados e conclusões apresentados, permitindo uma avaliação mais abrangente e precisa do trabalho realizado.