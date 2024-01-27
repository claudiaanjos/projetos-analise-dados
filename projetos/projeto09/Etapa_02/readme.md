# Etapa 02: Análise Preliminar dos Dados

<br>

Sua equipe encontra-se nos estágios iniciais do projeto, focado no desenvolvimento de um modelo de aprendizado de máquina para prever a rotatividade de usuários. Após a aprovação da proposta de projeto pela supervisora, May Santner, foi comunicado que a equipe agora possui acesso aos dados do usuário do Waze. É importante realizar uma inspeção nos dados, organizá-los de forma eficiente e prepará-los para análise, visando obter insights claros. A etapa de preparação dos dados é crucial para garantir a eficácia do modelo e possibilitar previsões precisas de rotatividade de usuários no projeto em andamento.

Você encontra dois novos e-mails em sua caixa de entrada: um de May Santner e outro de sua colega de equipe, Chidi Ga. No e-mail, May pede sua ajuda para revisar os dados e preencher fazer um notebook, e Chidi compartilha os detalhes para o notebook.  

<br>

### Email de May Santner, gerente de análise de dados

Assunto: Ajuda com notebook?

De: “May Santner”, May@waze

Cc: “Chidi Ga,” Chidi@waze

Bom dia!

Tenho algumas atualizações sobre o projeto de retenção de usuários. Em primeiro lugar, a proposta de projeto que você concluiu foi aprovada. Obrigado por todo o seu excelente trabalho até agora. Em segundo lugar, acabei de receber um e-mail do nosso gerente de projetos sênior, Sylvester Esperanza, informando que nossa equipe recebeu acesso aos dados do usuário do Waze.

Antes de iniciarmos o processo de análise exploratória de dados (EDA), precisaríamos da sua ajuda com a codificação e preparação dos dados. Durante sua entrevista, você mencionou que trabalhou com Python em seu programa de certificação do Google. Você pode aproveitar suas habilidades em Python para esta tarefa.

Chidi Ga (com cópia acima) iniciou um notebook com o conjunto de dados relevante (importado). No momento, Chidi está ocupada finalizando um projeto anterior. Tenho certeza de que sua ajuda seria útil para concluir a codificação e configurar o notebook para o projeto de rotatividade de usuários.

Chidi, você se importa em compartilhar os detalhes? 

Abraços, 

May Santner

Gerente de Análise de Dados

Waze

<br>


### Email de Chidi Ga, analista de dados sênior

Assunto: RE: Ajuda com notebook?

De: “Chidi Ga,” Chidi@waze

Cc: “May Santner,” May@waze

Prazer em conhecê-la (virtualmente)! 

Esperamos que você tenha gostado das primeiras semanas no Waze! 

A proposta de projeto que você ajudou a preparar cobriu os principais pontos deste projeto, então irei direto ao modo como você pode ajudar a equipe. No momento, vários de nós estamos ocupados fazendo ajustes no modelo de aprendizado de máquina para outro projeto, então sua ajuda será muito apreciada!

Até terminarmos nosso projeto anterior, não há necessidade de fazer um EDA completo em nossos novos dados de usuários. Chegaremos a isso em breve. Enquanto isso, você se importa em revisar os dados importados da equipe? Seria fantástico se você pudesse incluir um resumo dos tipos de dados para cada variável, onde existem valores ausentes nos dados, estatísticas descritivas importantes e qualquer outra coisa relacionada ao código que você acha que vale a pena compartilhar no notebook. Não tive a chance de explorar os dados, então agradeço muito por você ter começado isso desde o início. 


Obrigada,

Chidi Ga

Analista de Dados Sênior

Waze

<br>

## Dicionário de dados

Este projeto usa um conjunto de dados chamado [waze_dataset.csv](). Contém dados sintéticos criados para este projeto em parceria com o Waze. 

O conjunto de dados contém: 14.999 linhas (cada linha representa um usuário único) e 13 colunas.

| Nome da Coluna              | Tipo           | Descrição                                                                                               |
|-----------------------------|----------------|---------------------------------------------------------------------------------------------------------|
| ID                          | int            | Um índice sequencial numerado                                                                           |
| label                       | obj            | Variável binária de destino ("retained" vs "churned") que indica se um usuário cancelou a assinatura em algum momento durante o mês |
| sessions                    | int            | O número de ocorrências de um usuário abrindo o aplicativo durante o mês                                |
| drives                      | int            | Uma ocorrência de dirigir pelo menos 1 km durante o mês                                                 |
| device                      | obj            | O tipo de dispositivo com o qual um usuário inicia uma sessão                                           |
| total_sessions              | float          | Uma estimativa do modelo do número total de sessões desde que um usuário começou a usar o aplicativo   |
| n_days_after_onboarding     | int            | O número de dias desde que um usuário se cadastrou no aplicativo                                        |
| total_navigations_fav1      | int            | Navegações totais desde o cadastro até o lugar favorito 1 do usuário                                    |
| total_navigations_fav2      | int            | Navegações totais desde o cadastro até o lugar favorito 2 do usuário                                    |
| driven_km_drives            | float          | Quilômetros totais dirigidos durante o mês                                                              |
| duration_minutes_drives     | float          | Duração total dirigida em minutos durante o mês                                                        |
| activity_days               | int            | Número de dias que o usuário abre o aplicativo durante o mês                                           |
| driving_days                | int            | Número de dias que o usuário dirige (pelo menos 1 km) durante o mês                                     |

<br>

## Entregavéis

- [Notebook]()
- [Resumo Executivo]()

<br>

<div align='center'>
    <img src="https://github.com/claudiaanjos/projetos-analise-dados/blob/main/projetos/projeto09/images/image03.png" width="60%"/>
</div>