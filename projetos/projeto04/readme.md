<div align='center'>
    <img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto04/images/image01.png" width="80%"/>
</div>

>Como parte do meu desenvolvimento profissional, estou me dedicando em realizar projetos de análise de dados. Esta iniciativa tem como objetivo não apenas adquirir conhecimentos teóricos, mas também aplicá-los de forma prática. Cada projeto é uma oportunidade para aplicar e solidificar o aprendizado, permitindo-me crescer e colocar em prática o que tenho estudado.

## Cenário

A GoBigData, uma consultoria fictícia especializada em Big Data e Data Science, está buscando contratar cientistas de dados entre os participantes aprovados em seus cursos. Diante do grande número de inscritos para o treinamento avançado, a empresa enfrenta o desafio de distinguir quem realmente está interessado em trabalhar para ela após o treinamento.

Nosso papel como analistas de dados é importante neste cenário. Precisamos realizar uma análise abrangente dos dados fornecidos, compreendendo sua estrutura, realizando limpeza e transformação conforme necessário, identificando padrões relevantes e fazendo diagnósticos significativos. O objetivo é oferecer à empresa insights valiosos que ajudem na seleção dos profissionais adequados.

Além disso, nossa análise será essencial para melhorar a qualidade do treinamento, planejamento dos cursos e categorização dos candidatos, visando reduzir custos e tempo de contratação.

Neste projeto, conduziremos uma análise dos dados de Recursos Humanos (RH), envolvendo análises descritivas, diagnósticas e estatísticas. Ao final, apresentaremos um parecer informativo, destacando os principais pontos descobertos durante nossa análise.

## Dados

O conjunto de dados foi disponibilizado no [Kaggle](https://www.kaggle.com/datasets/arashnic/hr-analytics-job-change-of-data-scientists/data) por Möbius.

Os dados abrangem informações demográficas e outros detalhes dos participantes dos treinamentos oferecidos por uma empresa de Data Science. Inclui variáveis como: gênero, experiência relevante, nível educacional, experiência profissional, horas de treinamento e outras.

Mais informações sobre os dados e o dicionário das variáveis estão disponíveis no notebook.

## Análise Exploratória de Dados

* O conjunto de dados consiste em 19.158 registros e 14 variáveis.

* Sobre as variáveis numéricas:
    - **city_development_index** tem média de 0.828, mediana de 0.903 e desvio-padrão de 0.123. A maioria dos candidatos é de cidades bem desenvolvidas.
    - **training_hours**, que representa as horas de treinamento concluídas, tem média de 65.367, mediana de 47 e valor máximo de 336. Temos mais candidatos com poucas horas de treinamento, mas alguns candidatos gastam muito tempo para fazer o treinamento.

>O City Development Index (CDI) é uma métrica que avalia o desenvolvimento de uma cidade com base em várias dimensões. Essa métrica é usada para medir o progresso e a qualidade de vida em áreas urbanas. Os valores do CDI podem variar em uma escala de 0 a 1, onde 0 representa o desenvolvimento mínimo ou nenhum desenvolvimento, e 1 representa o desenvolvimento máximo.

* Sobre as variáveis categóricas:
    - Predominância do sexo masculino entre os candidatos.
    - A maioria possui experiência relevante. É razoável assumir que pessoas buscando treinamento avançado tenham alguma experiência prévia.
    - A maioria não está atualmente matriculada em cursos de graduação, sugerindo que já tenham concluído a graduação e estão em busca de especializações.
    - Observa-se que a maior parte dos candidatos possui nível educacional correspondente a graduação completa.
    - A área de estudo mais comum entre os candidatos é STEM, abrangendo cursos nas áreas de exatas e tecnologia.
    - A experiência profissional é um ponto forte do grupo, já que a maioria possui mais de vinte anos de experiência.
    - Quanto ao tamanho das empresas em que trabalham, a maioria dos candidatos está empregada em empresas com uma equipe de 50 a 99 funcionários.
    - Por fim, é importante destacar que os profissionais geralmente têm períodos curtos de desemprego.

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto04/images/image02.png"/>

* As variáveis **city_development_index** e **training_hours** não apresentam uma distribuição normal. Os boxplots são inversos. A maioria dos registros de CDI está abaixo da mediana. A maioria dos registros de horas de treinamentos está acima da mediana. Temos outliers em ambas variáveis.

* Quanto aos dados de **training_hours**, observamos uma concentração principalmente no lado esquerdo do histograma. Esse padrão é esperado, uma vez que as pessoas costumam iniciar os treinamentos com entusiasmo, mas nem todos que começam conseguem concluir a jornada.

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto04/images/image03.png" width="80%"/>

* Mapa de Correlação:

    - Para o mapa de correlação realizamos uma conversão numérica temporária das variáveis **experience** e **last_new_job**.

    - Cidades mais desenvolvidas têm candidatos com mais experiência, mas não há causalidade direta.

    - Candidatos experientes tendem a permanecer em empregos por mais tempo.

    - Candidatos em cidades altamente desenvolvidas buscam menos ativamente novos empregos.

    - A relação entre horas de treinamento e outras variáveis é praticamente nula.

<img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto04/images/image04.png" width="60%"/>

* Este conjunto de dados contém mais dados com tipo categórico do que numérico. Usamos recursos categóricos nominais para WOE e IV no intuito de ajudar a identificar a importância preditiva das variáveis em relação à variável alvo.

>O "Weight of Evidence" (WOE) e o "Information Value" (IV) são medidas usadas para avaliar o poder discriminatório das variáveis em modelos estatísticos. O WOE mede a relação entre uma variável independente e um evento, com valores mais altos indicando uma relação mais forte. O IV resume o poder discriminatório de uma variável, sendo maior quando a variável é mais informativa para prever um evento binário.

* O gráfico nos mostra a ordenação dos recursos com base em sua capacidade preditiva em relação à variável alvo. Considerando o IV, identificamos que **enrolled_university** é um preditor de média importância, enquanto **relevent_experience** e **education_level** são preditores fracos. Os demais apresentam baixa utilidade para a previsão.

image05
<img src="" width="60%"/>

* Não temos valores duplicados, porém temos valores ausentes que apresentam um padrão aleatório (confome mapa abaixo).

image06
<img src="" width="60%"/>


* Os valores ausentes foram tratados da seguinte forma para cada variável:

    - **major_discipline**: representa a área de estudo do candidato e está realacionado à graduação e pós-graduação. Por isso, os registros ausentes que correspondiam ao *High School* (Ensino Médio), *Primary School* (Ensino Básico/Fundamental) e **NaN** na variável **education_level** (nível educacional) foram substituidos por *Non Degree*. Para o restante imputamos o valor *Other*.
    - **enrolled_university**: candidatos com **Primary School** como **education_level** não estão qualificados para ingressar na universidade. Portanto, preenchemos valores **NaN** em **education_level** para **Primary Grad**. Para o restante imputamos o valor *Other*.
    - **company_type**: imputamos o valor *Other*.
    - **education_level**: imputamos o valor *Other*. 
    - **experience**: temos 0.32% de valores ausentes, portanto deletamos os NaN. 


## Relatório Final

Com base em nossa análise, identificamos as variáveis mais relevantes para a identificação de um candidato promissor:

* Índice de Desenvolvimento da cidade de residência do candidato.
* Tempo de experiência profissional.
* Participação em cursos universitários.
* Experiência relevante na área.
* Nível educacional.
* Tipo de empresa que o candidato trabalhou ou trabalha.
* Área de estudo na graduação (quando aplicável).

Por outro lado, as seguintes variáveis não demonstraram relevância significativa para nossa análise:

* Identificação única do candidato.
* Código da cidade de residência do candidato.
* Gênero.
* Tempo decorrido desde o último emprego.
* Tamanho da empresa (quando aplicável).
* Total de horas de treinamento.

Recomendações:

Recomendamos que o departamento de Recursos Humanos (RH) implemente um método de coleta de dados que permita a aquisição de informações adicionais, aprimorando, assim, a qualidade dos dados e a precisão da análise.

O RH pode focar na busca por candidatos que provenham de cidades com baixo Índice de Desenvolvimento, que não possuam experiência relevante, que tenham alcançado níveis de educação mais elevados e que tenham menos tempo de experiência profissional, aumentando assim as chances de encontrar candidatos ativamente procurando emprego.

Considerando que muitas pessoas completam o treinamento em um curto período, o RH pode otimizar a duração do treinamento, tornando-o mais eficiente e condizente com as necessidades dos candidatos.

Esperamos que estas recomendações sejam úteis para aprimorar o processo de seleção e treinamento de candidatos.












