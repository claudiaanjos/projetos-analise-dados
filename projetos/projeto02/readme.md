<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto02/images/image00.png" width="80%"/>

&nbsp;

>Como parte do meu desenvolvimento profissional, estou me dedicando em realizar projetos de análise de dados. Esta iniciativa tem como objetivo não apenas adquirir conhecimentos teóricos, mas também aplicá-los de forma prática. Cada projeto é uma oportunidade para aplicar e solidificar o aprendizado, permitindo-me crescer e colocar em prática o que tenho estudado.

## Cenário

Como analista de dados de uma organização de saúde, sua responsabilidade é identificar pacientes diabéticos com alto risco de readmissão por meio da estratificação de risco com base nos registros hospitalares eletrônicos. Esse processo envolverá a análise de dados eletrônicos, como resultados de exames, medicamentos, diagnósticos de outras condições médicas, entre outros.

Esse trabalho desempenha um papel importante na melhoria do tratamento do diabetes e na redução dos custos associados às readmissões hospitalares.

## Tópicos importantes

Antes de começar a análise vamos trazer alguns pontos importantes dos tópicos que iremos trabalhar no projeto.

### Readmissão hospitalar

A readmissão hospitalar é um fenômeno de grande importância na área da saúde, com implicações tanto clínicas quanto financeiras. Ela ocorre quando um paciente, após receber alta hospitalar, é novamente internado em um curto período. Essa situação destaca a necessidade de identificar precocemente pacientes com alto risco de readmissão.

Essa prática desempenha um papel crucial, permitindo que os profissionais de saúde realizem avaliações detalhadas e adotem medidas preventivas para reduzir a probabilidade de futuras internações. Isso não apenas melhora a qualidade do atendimento ao paciente, mas também ajuda a conter os custos hospitalares associados às readmissões, que podem ser substanciais.

### Diabetes

A diabetes é uma das principais causas de mortalidade em todo o mundo, exercendo um impacto significativo na saúde global. Apenas nos Estados Unidos, cerca de 23,6 milhões de indivíduos são afetados por esta condição, com milhões recebendo o diagnóstico de diabetes a cada ano, em todo o mundo. De acordo com a Associação Americana de Diabetes, os custos associados ao atendimento de pacientes diabéticos e pré-diabéticos nos Estados Unidos são os mais elevados em escala global. Esta epidemia global afeta mais de 350 milhões de pessoas, resultando em aproximadamente 3 milhões de vidas perdidas anualmente devido a complicações relacionadas ao diabetes, com ênfase particular em complicações de natureza cardiovascular ou renal.

### Readmissão de pacientes diabéticos

No contexto do tratamento do diabetes, a readmissão hospitalar emerge como uma das preocupações mais urgentes, desempenhando um papel significativo nos custos hospitalares. A necessidade de readmissão sugere que a assistência inicial prestada ao paciente durante sua primeira internação pode ter sido insuficiente ou não abordou completamente as complexidades da gestão do diabetes.

A taxa de readmissão evoluiu para se tornar uma métrica de extrema importância na avaliação da qualidade global de um hospital. Ela não apenas reflete a eficácia do tratamento, mas também a eficiência na transição do paciente para o cuidado pós-alta e a prevenção de complicações agudas ou crônicas relacionadas ao diabetes.

Além dos custos financeiros envolvidos, a readmissão hospitalar exerce um impacto substancial na experiência e na qualidade de vida do paciente. Ela pode estar associada a complicações relacionadas ao diabetes que poderiam ter sido evitadas com um cuidado contínuo eficaz. Portanto, a prevenção da readmissão não é apenas uma questão econômica, mas também uma questão de saúde e bem-estar para aqueles que vivem com o diabetes.

## Dados

O conjunto de dados, disponível no UCI Machine Learning Repository, foi criado por John Clore, Krzysztof Cios, Jon DeShazo e Beata Strack. Você pode acessar o conjunto de dados [aqui](https://archive.ics.uci.edu/dataset/296/diabetes+130-us+hospitals+for+years+1999-2008).

Ele está sob a licença internacional de Atribuição 4.0 (CC BY 4.0). Isso significa que você pode usar, compartilhar e adaptar a obra, desde que atribua o devido crédito aos autores originais e não adicione restrições adicionais para outros que desejem usar a obra. 

Os dados se referem a registros de dez anos (1999-2008) de pacientes hospitalizados diagnosticados com diabetes em 130 hospitais dos EUA. Temos informações como número do paciente, etnia, gênero, idade, tipo de admissão, duração da estadia no hospital, especialidade médica do médico responsável pela admissão, quantidade de exames laboratoriais realizados, resultado do teste de HbA1c, diagnóstico, quantidade de medicamentos, medicamentos específicos para diabetes, número de consultas ambulatoriais, internações e visitas de emergência no ano que antecedeu a hospitalização, entre outros.

Mais informações sobre os dados e o dicionário de dados estão disponíveis no notebook.

## Preparação dos dados

Para facilitar nosso processo de análise dividimos em dois notebooks, a parte 1 com a preparação dos dados e a parte 2 com as análises.

Inicialmente, o conjunto de dados consistia em 101766 registros e 50 variáveis. Após uma avaliação dos dados, identificamos algumas questões importantes e implementamos medidas antes de prosseguir com a análise. Ao final da preparação dos dados, conseguimos refinar o conjunto para 68629 registros e 24 variáveis.

As questões levantadas e medidas implementadas foram:

* A coluna *weight*, que representa o peso do paciente, apresentou 96,86% (98569 registros) de valores ausentes. Devido à fraca interpretabilidade desses valores, optamos por ignorar a variável e removê-la;
* As colunas *payer_code* (código do pagador) e *medical_specialty* (especialidade médica) apresentaram, respectivamente, 39,56% (40256 registros) e 49,08% (49949 registros) de valores ausentes. Dado que o percentual é superior a 30%, eliminamos as colunas;
* As colunas *race* (etnia), *diag_1* (diagnóstico primário), *diag_2* (diagnóstico secundário) e *diag_3* (diagnóstico secundário adicional), apresentaram, respectivamente, 2,23% (2273 registros), 0,02% (21 registros), 0,35% (358 registros) e 1,40% (1423 registros) de valores ausentes. Dado o baixo percentual de valores ausentes, optamos por remover os registros;
* Os valores únicos da coluna *gender* (sexo) eram “male”, “female” e “unknown/invalid”. Como tínhamos apenas 0,003% (3 registros) com o valor “unknown/invalid”, optamos por remover os registros. Além disso, transformamos os valores em categorias binárias. Valor 1 para “male” e valor 0 para “female”;
* As colunas *examide*, *citoglipton* e *metformin-rosiglitazone*, que representam medicamentos, apresentaram apenas um valor único. Dado que não adicionam informações à análise, optamos por remover as colunas;
* A coluna *age* (idade) é representada com categorias nas faixas de 10 anos e a maioria dos pacientes está na faixa entre 50 e 90 anos. Para que a população seja distribuída de maneira mais uniforme, realizamos a recategorização da variável com um número menor de faixas. A faixa de 0-50 para pacientes de até 50 anos, a faixa de 80-100 para pacientes acima de 80 anos e as outras faixas são mantidas;

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto02/images/image01.png" width="60%"/>

&nbsp;

* Temos três colunas que têm valores com significado semelhante, por isso realizamos a recategorização das mesmas. A *admission_type_id* com 8 valores foi reduzida para dois: Emergência e Outro. A *discharge_disposition_id* com 26 valores foi reduzida para dois: Casa e Outro. A *admission_source_id* com 17 valores foi reduzida para três: Sala_Emergencia, Recomendacao e Outro;
* A coluna *readmitted*, que representa os dias para readmissão do paciente internado, possuía os seguintes valores: < 30 (se o paciente foi readmitido em menos de 30 dias), > 30 (se o paciente foi readmitido em mais de 30 dias) e No (nenhum registro de readmissão). Como essa é nossa variável alvo e queremos saber se um paciente será readmitido no hospital ou não, realizamos uma classificação binária. Atribuímos o valor 1 para pacientes readmitidos (se a readmissão foi antes ou após 30 dias) e o valor 0 para nenhuma readmissão;
* As colunas *A1Cresult* (resultado do teste A1C) e *max_glu_serum* (resultado do teste sérico de glicose) foram reduzidas em categorias de Normal, Anormal e Não Testado, com valores 1, 0 e -99, respectivamente;
* Os valores das colunas *change* (se houve alteração nos medicamentos para diabéticos) e *diabetesMed* (se houve algum medicamento diabético prescrito) foram convertidos para binários. Valor 1 para “Ch”/“Yes” e valor 0 para “No”;
* No conjunto de dados temos até três diagnósticos para um determinado paciente: *diag_1*, *diag_2* e *diag_3* (primário, secundário e adicional). No entanto, cada um deles tem códigos CID-9 exclusivos e é difícil incluí-los no modelo e interpretar de forma significativa. Portanto, reduzimos esses códigos de diagnóstico para 4 categorias conforme as comorbidades em: 0, 1, 2 e 3. Valor 0: diabetes e problemas circulatórios não foram detectados de forma simultânea no paciente. Valor 1: Pelo menos um diagnóstico de diabetes e problemas circulatórios foram detectados de forma simultânea no paciente. Valor 2: Diabetes e pelo menos um diagnóstico de problemas circulatórios foram detectados de forma simultânea no paciente. Valor 3: Pelo menos um diagnóstico de diabetes e pelo menos um diagnóstico de problemas circulatórios foram detectados de forma simultânea no paciente;

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto02/images/image02.png" width="60%"/>

&nbsp;

* Temos 23 recursos para 23 medicamentos que indicam, para cada um deles, se uma alteração no medicamento foi feita ou não durante a atual internação do paciente. Verificamos quantas alterações foram feitas no total para cada paciente e criamos um novo atributo. Isso pode ajudar a descobrir uma relação com o número de alterações, independentemente de qual medicamento foi alterado. Além disso, criamos um novo atributo indicando o total de medicamentos que cada paciente consumiu durante a internação. Depois de criar essas duas colunas, removemos as colunas dos medicamentos;
* Alguns pacientes no conjunto de dados tiveram mais de um encontro com o pesquisador. Não podemos contá-los como encontros independentes, porque isso influencia os resultados para aqueles pacientes que tiveram vários encontros. Assim, tentamos várias técnicas para recolher e consolidar vários encontros para o mesmo paciente e concluímos que o ideal é deixar apenas um registro de encontro para cada paciente e optamos por manter o primeiro.


## Análise

* A faixa etária de pacientes entre 70-80 anos é a que mais consome medicamentos.

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto02/images/image03.png" width="60%"/>

&nbsp;

* Pacientes do sexo feminino tem número maior de readmissões.

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto02/images/image04.png" width="60%"/>

&nbsp;

* A faixa etária de pacientes entre 70-80 anos é a que tem o maior número de readmissões.
* A faixa etária de pacientes entre 70-80 anos tem o maior percentual de readmissões, enquanto a faixa etária de 0-50 anos tem o menor percentual.

&nbsp;

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto02/images/image05.png" width="60%"/>

&nbsp;

* Mulheres na faixa etária de 70-80 anos tem um número maior de readmissões por emergência.

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto02/images/image06.png" width="60%"/>

* Mulheres Caucasianas são a maioria entre as mulheres readmitidas.

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto02/images/image07.png" width="60%"/>

* Pacientes com comorbidade tem o maior número de visitas. 
* Quanto mais visitas o paciente recebeu antes da alta, maior foi o volume de readmissões. Ou seja, quanto mais visitas o paciente recebe, maiores as chances de readmissão.

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto02/images/image08.png" width="60%"/>

Durante nossa análise com Python e Power BI (veja os dashboards abaixo), identificamos padrões interessantes. Por exemplo, observamos que mulheres caucasianas, com idades entre 70 e 80 anos e que possuíam mais de uma comorbidade, apresentaram uma probabilidade maior de readmissão hospitalar. Por outro lado, notamos que homens asiáticos, com idades entre 50 e 60 anos e até uma comorbidade, parecem ter uma probabilidade menor de readmissão dentro desse grupo específico de pacientes diabéticos.

&nbsp;

&nbsp;

## Dashboards Power BI

### Dashboard Geral

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto02/images/image09.png" />

&nbsp;

### Dashboard dos Principais Influcenciadores para Readmissão Hospitalar

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto02/images/image10.png" />











 









