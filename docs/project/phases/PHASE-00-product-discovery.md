# FASE 00 — Descoberta do produto

## Objetivo
Definir o problema, as evidências, a hipótese, o MVP, as restrições e o escopo do prazo antes de escrever Swift.

## Resultado esperado
Decisões de produto documentadas e revisadas; nenhuma implementação Swift nesta fase.

## Dependências
Nenhuma

## Prioridade
Consulte as prioridades das tasks. Trabalho P1/P2 não pode comprometer a entrega essencial P0.

## Estado
IN_PROGRESS

## SUB-P00-001 — Definir problema do produto

Estado: DONE

Prioridade: P0

Depende de:
- Nenhuma

### Contexto
O material de produto aponta substituições em compras de mercado como um problema a explorar. O projeto precisa de uma formulação concisa e defensável antes de definir hipóteses ou soluções.

### Objetivo
Documentar o problema, o momento da jornada, o esforço para a pessoa usuária, a oportunidade, a direção de produto, o valor esperado, a hipótese de valor de negócio, as hipóteses e as afirmações que não fazemos. Incluir um fluxo visual simples. Não definir arquitetura ou implementação.

### Requisitos
- Usar o briefing de produto fornecido e a formulação de Gabriel como fonte conceitual.
- Não afirmar que o iFood não oferece substituições nem sugerir que o projeto já validou o problema com pesquisa de usuários.
- Separar valor plausível para usuário/negócio de resultados medidos; não inventar números.
- Manter a direção proposta no nível de produto; não descrever arquitetura, implementação ou código.
- Incluir o diagrama simples solicitado em `docs/product-requirements.md`.

### Critérios de aceite
- [x] Problema, contexto, esforço do usuário, oportunidade, direção proposta e valor esperado estão documentados.
- [x] A hipótese de valor para o negócio é condicional e não contém métricas inventadas.
- [x] Hipóteses e limites das afirmações estão explícitos; não se afirma nada sobre a funcionalidade atual do iFood.
- [x] Um diagrama simples mostra compra → produto indisponível → nova decisão → alternativas → comparação → escolha.
- [x] Arquitetura e implementação não foram definidas.

### Conceitos de engenharia
Formulação do problema, jornada da pessoa usuária, hipóteses, limites das afirmações e hipótese de valor de produto.

### Estudar antes da implementação
Não se aplica a esta tarefa somente documental. Ler o briefing fornecido e distinguir afirmações de produto de hipóteses antes de escrever.

### Perguntas que preciso saber responder
- Qual é o problema e em que momento da jornada ele acontece?
- Quais partes são hipóteses, e não evidências validadas com usuários?
- Que valor para usuário e negócio a oportunidade poderia influenciar, e o que não estamos afirmando?

### Validação
Revisão editorial em relação ao briefing fornecido e aos critérios de aceite desta tarefa. Verificar que o texto não contém afirmações sem suporte, métricas inventadas nem detalhes de arquitetura ou implementação.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
`docs/product-requirements.md`, `docs/project/CURRENT.md`, `docs/project/BACKLOG.md` e este arquivo para registrar estado e aceite. Nenhum código ou arquivo de implementação do produto.

### Critérios para conclusão
- [x] Gabriel revisou e aprovou a formulação do problema, o momento da jornada e o valor esperado.
- [x] A diferença entre contexto, evidência e hipótese foi discutida; pesquisa com usuários e medidas de impacto continuam pendentes.
- [x] A tarefa foi aprovada por Gabriel e movida de `REVIEW` para `DONE`.

### Notas para entrevista
Explicar o problema de substituição de produtos sem alegar que um produto concorrente não possui determinada funcionalidade; distinguir valor esperado de impacto medido.

## SUB-P00-002 — Registrar evidências e hipóteses

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P00-001

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Registrar evidências e hipóteses.

### Objetivo
Concluir Registrar evidências e hipóteses dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Descoberta do produto, evidências, hipótese, jornada, métricas, MVP e escopo.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Registrar evidências e hipóteses” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisar cada material em relação às fontes de produto fornecidas; identificar hipóteses e incógnitas.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
Somente arquivos pertinentes à fase; confirmar os caminhos exatos antes de implementar. Esta tarefa de planejamento não cria arquivos de implementação.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P00-003 — Escrever hipótese do produto

Estado: DONE

Prioridade: P0

Depende de:
Nenhuma

### Contexto
O problema e a direção do produto estão documentados, mas ainda precisamos explicitar qual mudança esperamos observar para saber se a proposta ajuda. Sem uma hipótese clara, o protótipo pode virar apenas uma demonstração visual sem uma pergunta de produto que possa ser avaliada.

### Objetivo
Registrar uma hipótese central para o valor ao consumidor, sinais qualitativos ou observáveis que poderiam apoiá-la e os limites do que o protótipo permite concluir. Não definir arquitetura, implementação nem metas numéricas sem evidência.

### Requisitos
- Usar o problema e a direção já documentados em `docs/product-requirements.md`.
- Distinguir hipótese de produto, sinais de validação futura e resultados observados; não apresentar sinais como evidência existente.
- Registrar uma hipótese de negócio como possibilidade, sem prometer impacto nem inventar métricas.
- Declarar as limitações do protótipo e a necessidade de validação com pessoas usuárias e dados operacionais para avaliar impacto.
- Não introduzir decisões de arquitetura ou implementação.

### Critérios de aceite
- [x] Uma hipótese central liga situação, proposta e valor esperado para a pessoa usuária.
- [x] Há sinais possíveis de validação, claramente identificados como trabalho futuro e sem metas numéricas inventadas.
- [x] O possível valor para o negócio está formulado condicionalmente, com os limites de medição do protótipo explícitos.
- [x] Não foram adicionadas decisões de arquitetura, implementação ou código.

### Conceitos de engenharia
Descoberta do produto, hipótese falsificável, sinais de validação, evidência observada, valor esperado e limites de inferência.

### Estudar antes da implementação
Não se aplica a esta tarefa somente documental. Revisar a diferença entre uma hipótese e um resultado validado; nenhum código será escrito.

### Perguntas que preciso saber responder
- Qual mudança observável esperamos para a pessoa usuária?
- Quais sinais poderiam apoiar ou enfraquecer a hipótese, e por que ainda não são evidência?
- Que dados seriam necessários para avaliar uma possível consequência para o negócio?

### Validação
Revisão editorial contra `docs/product-requirements.md`; verificar que a hipótese não é descrita como resultado, que os sinais não são apresentados como dados existentes e que não há números ou decisões técnicas inventados.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
`docs/product-requirements.md`, `docs/project/CURRENT.md`, `docs/project/BACKLOG.md` e este arquivo para registrar o resultado e o estado. Nenhum arquivo de implementação.

### Critérios para conclusão
- [x] Critérios documentais atendidos e sinais futuros separados de evidências atuais.
- [x] Verificação de consistência e links aplicáveis concluída; nenhuma validação com usuários foi alegada.
- [x] Gabriel revisou a hipótese, discutiu seus limites e aprovou o resultado.
- [x] Documentação e estado atualizados; a tarefa foi movida para `DONE` após aprovação.

### Notas para entrevista
Explicar como a hipótese se distingue de evidência, como a proposta poderia ser avaliada e por que um protótipo não comprova impacto de negócio.

## SUB-P00-004 — Definir pessoa usuária

Estado: DONE

Prioridade: P1

Depende de:
- SUB-P00-003

### Contexto
O problema já descreve uma pessoa comprando mercado por aplicativo que enfrenta a indisponibilidade de um item escolhido. Precisamos explicitar para quem o protótipo é pensado e quais necessidades imediatas essa pessoa tem, sem apresentar suposições demográficas como pesquisa validada.

### Objetivo
Descrever a pessoa usuária principal em termos de contexto e necessidades relacionadas à decisão de substituição. Identificar características desconhecidas e manter o perfil como hipótese de trabalho até haver validação.

### Requisitos
- Basear o perfil somente no problema e na hipótese documentados em `docs/product-requirements.md`.
- Descrever contexto e necessidades observáveis durante a decisão de substituição.
- Não inventar idade, renda, região, frequência de compra, composição familiar ou comportamento validado.
- Distinguir a pessoa usuária principal do protótipo de papéis operacionais de loja não incluídos no escopo atual.
- Registrar as incógnitas que pesquisa futura precisará validar; não definir arquitetura ou implementação.

### Critérios de aceite
- [x] A pessoa usuária principal está descrita por contexto de uso e necessidade, sem dados demográficos inventados.
- [x] Necessidades relacionadas a identificar, comparar e decidir sobre alternativas estão explícitas.
- [x] O perfil está identificado como hipótese de trabalho, não como persona ou pesquisa validada.
- [x] Características desconhecidas e papéis fora do perfil do protótipo estão delimitados.

### Conceitos de engenharia
Segmento de usuário, contexto de uso, necessidades, hipótese de persona, incógnitas e escopo de produto.

### Estudar antes da implementação
Não se aplica a esta tarefa somente documental. Distinguir um perfil de trabalho de uma persona validada por pesquisa.

### Perguntas que preciso saber responder
- Quem é a pessoa usuária considerada no protótipo e em que situação ela precisa decidir?
- Quais necessidades vêm diretamente do problema descrito e quais dados continuam desconhecidos?
- Por que não atribuímos características demográficas sem pesquisa?

### Validação
Revisão editorial contra o problema e a hipótese do produto; verificar que necessidades estão ligadas à tarefa de substituição e que dados não pesquisados estão explicitamente marcados como desconhecidos.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
`docs/product-requirements.md`, `docs/project/CURRENT.md`, `docs/project/BACKLOG.md` e este arquivo para registrar resultado e estado. Nenhum arquivo de implementação.

### Critérios para conclusão
- [x] Critérios documentais atendidos sem apresentar suposições como dados observados.
- [x] Verificações de consistência e links locais passam.
- [x] Documentação e estado atualizados; incógnitas e limites do perfil estão explícitos.
- [x] Gabriel aprovou o perfil de referência e seus limites como hipótese não validada.
- [x] Tarefa movida de `REVIEW` para `DONE` após aprovação.

### Notas para entrevista
Explicar por que o perfil descreve contexto e necessidades, quais detalhes ainda exigem pesquisa e como isso evita construir para uma persona inventada.

## SUB-P00-005 — Mapear jornada da pessoa usuária

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P00-004

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Mapear jornada da pessoa usuária.

### Objetivo
Concluir Mapear jornada da pessoa usuária dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Descoberta do produto, evidências, hipótese, jornada, métricas, MVP e escopo.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Mapear jornada da pessoa usuária” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisar cada material em relação às fontes de produto fornecidas; identificar hipóteses e incógnitas.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
Somente arquivos pertinentes à fase; confirmar os caminhos exatos antes de implementar. Esta tarefa de planejamento não cria arquivos de implementação.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P00-006 — Definir métricas de sucesso

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P00-005

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Definir métricas de sucesso.

### Objetivo
Concluir Definir métricas de sucesso dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Descoberta do produto, evidências, hipótese, jornada, métricas, MVP e escopo.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir métricas de sucesso” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisar cada material em relação às fontes de produto fornecidas; identificar hipóteses e incógnitas.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
Somente arquivos pertinentes à fase; confirmar os caminhos exatos antes de implementar. Esta tarefa de planejamento não cria arquivos de implementação.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P00-007 — Definir MVP

Estado: READY

Prioridade: P0

Depende de:
Nenhuma

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Definir MVP.

### Objetivo
Concluir Definir MVP dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Descoberta do produto, evidências, hipótese, jornada, métricas, MVP e escopo.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir MVP” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisar cada material em relação às fontes de produto fornecidas; identificar hipóteses e incógnitas.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
Somente arquivos pertinentes à fase; confirmar os caminhos exatos antes de implementar. Esta tarefa de planejamento não cria arquivos de implementação.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P00-008 — Definir itens fora do escopo

Estado: TODO

Prioridade: P0

Depende de:
SUB-P00-007

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Definir itens fora do escopo.

### Objetivo
Concluir Definir itens fora do escopo dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Descoberta do produto, evidências, hipótese, jornada, métricas, MVP e escopo.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir itens fora do escopo” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisar cada material em relação às fontes de produto fornecidas; identificar hipóteses e incógnitas.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
Somente arquivos pertinentes à fase; confirmar os caminhos exatos antes de implementar. Esta tarefa de planejamento não cria arquivos de implementação.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P00-009 — Especificar fluxo de quatro telas

Estado: TODO

Prioridade: P0

Depende de:
Nenhuma

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Especificar fluxo de quatro telas.

### Objetivo
Concluir Especificar fluxo de quatro telas dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Descoberta do produto, evidências, hipótese, jornada, métricas, MVP e escopo.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Especificar fluxo de quatro telas” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisar cada material em relação às fontes de produto fornecidas; identificar hipóteses e incógnitas.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
Somente arquivos pertinentes à fase; confirmar os caminhos exatos antes de implementar. Esta tarefa de planejamento não cria arquivos de implementação.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P00-010 — Validar API Open Food Facts

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P00-009

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Validar API Open Food Facts.

### Objetivo
Concluir Validar API Open Food Facts dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Descoberta do produto, evidências, hipótese, jornada, métricas, MVP e escopo.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Validar API Open Food Facts” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisar cada material em relação às fontes de produto fornecidas; identificar hipóteses e incógnitas.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
Somente arquivos pertinentes à fase; confirmar os caminhos exatos antes de implementar. Esta tarefa de planejamento não cria arquivos de implementação.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P00-011 — Documentar limitações da API

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P00-010

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Documentar limitações da API.

### Objetivo
Concluir Documentar limitações da API dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Descoberta do produto, evidências, hipótese, jornada, métricas, MVP e escopo.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Documentar limitações da API” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisar cada material em relação às fontes de produto fornecidas; identificar hipóteses e incógnitas.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
Somente arquivos pertinentes à fase; confirmar os caminhos exatos antes de implementar. Esta tarefa de planejamento não cria arquivos de implementação.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P00-012 — Validar escopo de entrega e prazo

Estado: TODO

Prioridade: P0

Depende de:
Nenhuma

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Validar escopo de entrega e prazo.

### Objetivo
Concluir Validar escopo de entrega e prazo dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Descoberta do produto, evidências, hipótese, jornada, métricas, MVP e escopo.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Validar escopo de entrega e prazo” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisar cada material em relação às fontes de produto fornecidas; identificar hipóteses e incógnitas.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
Somente arquivos pertinentes à fase; confirmar os caminhos exatos antes de implementar. Esta tarefa de planejamento não cria arquivos de implementação.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P00-013 — Revisar descoberta com Gabriel

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P00-012

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Revisar discovery com Gabriel.

### Objetivo
Concluir Revisar discovery com Gabriel dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Descoberta do produto, evidências, hipótese, jornada, métricas, MVP e escopo.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Revisar discovery com Gabriel” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisar cada material em relação às fontes de produto fornecidas; identificar hipóteses e incógnitas.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
Somente arquivos pertinentes à fase; confirmar os caminhos exatos antes de implementar. Esta tarefa de planejamento não cria arquivos de implementação.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.
