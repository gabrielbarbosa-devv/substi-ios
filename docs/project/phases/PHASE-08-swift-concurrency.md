# FASE 08 — Concorrência em Swift

## Objetivo
Introduzir concorrência estruturada aos poucos e tratar cancelamento e isolamento.

## Resultado esperado
Carregamento assíncrono simples; TaskGroup somente se o fluxo final justificar.

## Dependências
Resultados pertinentes da FASE 07.

## Prioridade
Consulte as prioridades das tasks. Trabalho P1/P2 não pode comprometer a entrega essencial P0.

## Estado
IN_PROGRESS

## Estado da trilha de entrega

`SUB-P08-001` e `SUB-P08-007` estão em `REVIEW`. A trilha de entrega usa
`async/await`, cancelamento cooperativo e `MainActor` na `SuggestionsViewModel`.
Os estudos P1/P2 abaixo (TaskGroup, cache actor, GCD e profiling de concorrência)
não bloqueiam a entrega e podem permanecer como evolução técnica.

## SUB-P08-001 — Carregar um produto com async

Estado: REVIEW

Prioridade: P0

Depende de:
- Nenhuma

### Contexto
O transporte e o Repository já expõem uma operação assíncrona. A aplicação precisa de uma ação que use esse contrato sem conhecer a implementação de rede.

### Objetivo
Disponibilizar `LoadProductUseCase`, que recebe um código de barras, carrega o produto por `ProductRepository` e devolve o resultado ou propaga o erro.

### Requisitos
- Injetar o protocolo existente `ProductRepository` no Use Case.
- Expor uma operação `async throws` que delega a busca e retorna `Product`.
- Não importar UIKit, SwiftUI, URLSession ou tipos de networking neste Use Case.
- Cobrir sucesso, encaminhamento do código de barras e propagação de erro com um repositório falso.
- Não criar protocolo para o Use Case sem necessidade de uma segunda implementação ou fronteira de teste real.

### Critérios de aceite
- [x] O Use Case depende do contrato `ProductRepository`, não da implementação Open Food Facts.
- [x] A operação assíncrona retorna o produto e propaga os erros do repositório.
- [x] Testes determinísticos cobrem retorno, código de barras e propagação de erro.
- [x] A implementação não conhece detalhes de interface ou transporte HTTP.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
`async/await`, `async throws`, injeção de dependência, protocolo como fronteira e Dependency Inversion Principle.

### Estudar antes da implementação
Revisar propagação de valores e erros com `async throws`, e como o protocolo `ProductRepository` desacopla a aplicação da fonte de dados.

### Perguntas que preciso saber responder
- Por que `LoadProductUseCase` recebe `ProductRepository` em vez de `OpenFoodFactsProductRepository`?
- O que `async throws` comunica ao chamador?
- Por que não foi criado um protocolo para `LoadProductUseCase`?
- Onde um erro do Repository é tratado neste fluxo?

### Validação
Testes unitários determinísticos do Use Case estão implementados. As tentativas
de execução mais recentes e seus limites estão registradas em
[`CURRENT.md`](../CURRENT.md). Não há rede ao vivo, concorrência paralela ou
estado compartilhado nesta operação.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
A operação suspende durante a chamada assíncrona do Repository e propaga seu resultado/erro. O Use Case não cria `Task`, não compartilha estado mutável e não introduz GCD. Cancelamento dedicado fica fora desta task.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
- `Substi/Application/UseCases/LoadProductUseCase.swift`
- `SubstiTests/LoadProductUseCaseTests.swift`
- Este arquivo, `docs/project/BACKLOG.md` e `docs/project/CURRENT.md` para registrar o estado da task.

### Critérios para conclusão
- [x] Implementação e testes preparados; typecheck/parse disponíveis executados.
- [ ] Testes do target executados com Xcode e resultado revisado por Gabriel.
- [ ] Gabriel explica a fronteira do protocolo, a propagação assíncrona e o motivo de não criar outro protocolo.
- [x] Estado movido para `REVIEW`; somente Gabriel poderá aprovar e mover para `DONE`.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P08-002 — Implementar baseline sequencial

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P08-001

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Implementar baseline sequencial.

### Objetivo
Concluir Implementar baseline sequencial dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
async/await, Task, async let, TaskGroup, cancellation, actors, MainActor, Sendable.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Implementar baseline sequencial” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Testar cancelamento, falhas parciais e isolamento; usar Thread Sanitizer quando pertinente.

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

## SUB-P08-003 — Compreender custo da execução sequencial

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P08-002

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Compreender custo da execução sequencial.

### Objetivo
Concluir Compreender custo da execução sequencial dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
async/await, Task, async let, TaskGroup, cancellation, actors, MainActor, Sendable.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Compreender custo da execução sequencial” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Testar cancelamento, falhas parciais e isolamento; usar Thread Sanitizer quando pertinente.

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

## SUB-P08-004 — Comparar async let

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P08-003

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Comparar async let.

### Objetivo
Concluir Comparar async let dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
async/await, Task, async let, TaskGroup, cancellation, actors, MainActor, Sendable.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Comparar async let” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Testar cancelamento, falhas parciais e isolamento; usar Thread Sanitizer quando pertinente.

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

## SUB-P08-005 — Carregar candidatos limitados com TaskGroup

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P08-004

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Carregar candidatos limitados com TaskGroup.

### Objetivo
Concluir Carregar candidatos limitados com TaskGroup dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
async/await, Task, async let, TaskGroup, cancellation, actors, MainActor, Sendable.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Carregar candidatos limitados com TaskGroup” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Testar cancelamento, falhas parciais e isolamento; usar Thread Sanitizer quando pertinente.

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

## SUB-P08-006 — Tratar cancelamento

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P08-005

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Tratar cancelamento.

### Objetivo
Concluir Tratar cancelamento dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
async/await, Task, async let, TaskGroup, cancellation, actors, MainActor, Sendable.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Tratar cancelamento” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Testar cancelamento, falhas parciais e isolamento; usar Thread Sanitizer quando pertinente.

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

## SUB-P08-007 — Isolar apresentação com MainActor

Estado: REVIEW

Prioridade: P0

Depende de:
- Nenhuma

### Contexto
O estado da tela de sugestões é consumido e alterado pela interface UIKit. A
ViewModel dessa tela precisa declarar claramente o isolamento do estado de
apresentação.

### Objetivo
Isolar `SuggestionsViewModel` e suas mudanças de estado em `MainActor`.

### Requisitos
- Anotar a ViewModel com `@MainActor` porque seu estado é consumido pela UI.
- Manter requisições assíncronas suspensíveis sem bloquear o Main Thread.
- Não adicionar GCD, `TaskGroup` ou actor sem necessidade observada no fluxo.

### Critérios de aceite
- [x] A `SuggestionsViewModel` está isolada por `@MainActor`.
- [x] A carga de candidatos usa `async/await` e verifica cancelamento.
- [x] Os testes cobrem conteúdo, falha parcial, erro total e lista vazia.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.
- [ ] A validação de execução mais recente é revisada por Gabriel.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
`MainActor`, isolamento de estado de UI, `async/await`, `Task` e cancelamento cooperativo.

### Estudar antes da implementação
Revisar isolamento global de atores, suspensão em `await`, cancelamento cooperativo
e por que uma ViewModel ligada ao estado de UI usa `MainActor`.

### Perguntas que preciso saber responder
- Que estado da tela precisa ser protegido por `MainActor`?
- `await` bloqueia a thread principal? O que acontece enquanto a chamada de rede está suspensa?
- Onde a `Task` é mantida e cancelada no ciclo de vida da tela?
- Por que o fluxo sequencial é suficiente para a lista atual?

### Validação
Testes de ViewModel e o fluxo de UI determinístico; executar novamente quando o
Simulator/XCTest estiver disponível. Não introduzir Thread Sanitizer sem uma
questão de concorrência concreta a investigar.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
O estado observado pela tela é isolado por `MainActor`. As requisições usam
`async/await` sequencial e verificam cancelamento entre candidatos.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
- `Substi/Presentation/Suggestions/SuggestionsViewModel.swift`
- `SubstiTests/SuggestionsViewModelTests.swift`
- `SubstiUITests/SubstiUITests.swift`

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P08-008 — Proteger cache com actor

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P08-007

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Proteger cache com actor.

### Objetivo
Concluir Proteger cache com actor dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
async/await, Task, async let, TaskGroup, cancellation, actors, MainActor, Sendable.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Proteger cache com actor” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Testar cancelamento, falhas parciais e isolamento; usar Thread Sanitizer quando pertinente.

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

## SUB-P08-009 — Revisar Sendable

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P08-008

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Revisar Sendable.

### Objetivo
Concluir Revisar Sendable dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
async/await, Task, async let, TaskGroup, cancellation, actors, MainActor, Sendable.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Revisar Sendable” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Testar cancelamento, falhas parciais e isolamento; usar Thread Sanitizer quando pertinente.

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

## SUB-P08-010 — Definir falha parcial

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P08-009

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Definir falha parcial.

### Objetivo
Concluir Definir falha parcial dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
async/await, Task, async let, TaskGroup, cancellation, actors, MainActor, Sendable.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir falha parcial” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Testar cancelamento, falhas parciais e isolamento; usar Thread Sanitizer quando pertinente.

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

## SUB-P08-011 — Executar Thread Sanitizer

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P08-010

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Executar Thread Sanitizer.

### Objetivo
Concluir Executar Thread Sanitizer dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
async/await, Task, async let, TaskGroup, cancellation, actors, MainActor, Sendable.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Executar Thread Sanitizer” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Testar cancelamento, falhas parciais e isolamento; usar Thread Sanitizer quando pertinente.

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

## SUB-P08-012 — Documentar concorrência

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P08-011

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Documentar concorrência.

### Objetivo
Concluir Documentar concorrência dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
async/await, Task, async let, TaskGroup, cancellation, actors, MainActor, Sendable.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Documentar concorrência” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Testar cancelamento, falhas parciais e isolamento; usar Thread Sanitizer quando pertinente.

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
