# FASE 12 — UIKit

## Objetivo
Construir as telas principais de pedido e sugestões com UIKit e View Code.

## Resultado esperado
Fluxo utilizável com estados loading/content/error e navegação coordenada.

## Dependências
Resultados pertinentes da FASE 11.

## Prioridade
Consulte as prioridades das tasks. Trabalho P1/P2 não pode comprometer a entrega essencial P0.

## Estado
IN_PROGRESS

## SUB-P12-001 — Estudar ciclo de vida de UIViewController

Estado: TODO

Prioridade: P1

Depende de:
- Nenhuma

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Estudar ciclo de vida de UIViewController.

### Objetivo
Concluir Estudar ciclo de vida de UIViewController dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
UIViewController, Auto Layout, collection views, reuse, diffable data.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Estudar ciclo de vida de UIViewController” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Validar estados e navegação com verificações determinísticas do fluxo de UI quando viável.

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

## SUB-P12-002 — Criar tela de pedido com View Code

Estado: REVIEW

Prioridade: P0

Depende de:
Nenhuma

### Contexto
Exibir apenas o leite indisponível não explica o estado geral do pedido nem permite comparar a urgência do item com os produtos disponíveis. A referência visual de Gabriel define status do pedido, três itens, preços, banner de ação e CTA.

### Objetivo
Atualizar a tela UIKit de pedido para comunicar “Em preparação”, mostrar todos os itens e seus preços demonstrativos, destacar suavemente o indisponível e orientar a ação de substituição.

### Requisitos
- Usar a hierarquia e os dados definidos em `docs/project/screens/order-and-suggestions.md` e a imagem de referência versionada em `docs/assets/order-screen-reference.png`.
- Mostrar status “Em preparação”, produtos disponíveis e indisponíveis, preços formatados para pt-BR, banner informativo e CTA.
- Reutilizar `DSProductCardView`; destacar item indisponível com `surfaceError`, rótulo textual e affordance visual sem comunicar erro catastrófico.
- Manter preços nos itens do pedido, sem atribuí-los ao cadastro público do produto.
- Componentes visuais recebem dados e renderizam; navegação permanece no `AppCoordinator`.
- Considerar Dynamic Type, VoiceOver e uma ordem de leitura coerente.
- Não inventar resultado de substituição: o estado “substituído” será aplicado somente após confirmação em uma task futura.

### Critérios de aceite
- [ ] A tela apresenta status do pedido, os três itens e os preços demonstrativos conforme o contrato.
- [ ] O leite indisponível tem destaque suave, badge textual e CTA leva ao fluxo de sugestões.
- [ ] Os itens disponíveis e seus preços continuam visíveis; VoiceOver recebe conteúdo compreensível.
- [ ] A documentação registra que preços e disponibilidade são fixtures, sem relação com estoque real.
- [ ] Build do app passa; alterações e limites são explicados para Gabriel.
- [ ] Estado permanece REVIEW até Gabriel revisar; não marcar DONE automaticamente.

### Conceitos de engenharia
UIViewController, Auto Layout, collection views, reuse, diffable data.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Criar tela de pedido com View Code” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Validar estados e navegação com verificações determinísticas do fluxo de UI quando viável.

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

## SUB-P12-003 — Adicionar estado do pedido

Estado: REVIEW

Prioridade: P0

Depende de:
SUB-P12-002

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Adicionar estado do pedido.

### Objetivo
Concluir Adicionar estado do pedido dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
UIViewController, Auto Layout, collection views, reuse, diffable data.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Adicionar estado do pedido” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Validar estados e navegação com verificações determinísticas do fluxo de UI quando viável.

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

## SUB-P12-004 — Criar tela de sugestões

Estado: REVIEW

Prioridade: P0

Depende de:
Nenhuma

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Criar tela de sugestões.

### Objetivo
Concluir Criar tela de sugestões dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
UIViewController, Auto Layout, collection views, reuse, diffable data.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Criar tela de sugestões” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Validar estados e navegação com verificações determinísticas do fluxo de UI quando viável.

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

## SUB-P12-005 — Adicionar estados de sugestões

Estado: REVIEW

Prioridade: P0

Depende de:
SUB-P12-004

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Adicionar estados de sugestões.

### Objetivo
Concluir Adicionar estados de sugestões dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
UIViewController, Auto Layout, collection views, reuse, diffable data.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Adicionar estados de sugestões” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Validar estados e navegação com verificações determinísticas do fluxo de UI quando viável.

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

## SUB-P12-006 — Configurar reuso de UICollectionView

Estado: TODO

Prioridade: P0

Depende de:
SUB-P12-005

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Configurar reuso de UICollectionView.

### Objetivo
Concluir Configurar reuso de UICollectionView dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
UIViewController, Auto Layout, collection views, reuse, diffable data.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Configurar reuso de UICollectionView” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Validar estados e navegação com verificações determinísticas do fluxo de UI quando viável.

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

## SUB-P12-007 — Definir CompositionalLayout

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P12-006

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Definir CompositionalLayout.

### Objetivo
Concluir Definir CompositionalLayout dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
UIViewController, Auto Layout, collection views, reuse, diffable data.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir CompositionalLayout” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Validar estados e navegação com verificações determinísticas do fluxo de UI quando viável.

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

## SUB-P12-008 — Definir DiffableDataSource

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P12-007

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Definir DiffableDataSource.

### Objetivo
Concluir Definir DiffableDataSource dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
UIViewController, Auto Layout, collection views, reuse, diffable data.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir DiffableDataSource” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Validar estados e navegação com verificações determinísticas do fluxo de UI quando viável.

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

## SUB-P12-009 — Revisar dimensionamento com Auto Layout

Estado: TODO

Prioridade: P0

Depende de:
Nenhuma

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Revisar dimensionamento com Auto Layout.

### Objetivo
Concluir Revisar dimensionamento com Auto Layout dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
UIViewController, Auto Layout, collection views, reuse, diffable data.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Revisar dimensionamento com Auto Layout” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Validar estados e navegação com verificações determinísticas do fluxo de UI quando viável.

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

## SUB-P12-010 — Conectar Coordinator

Estado: REVIEW

Prioridade: P0

Depende de:
Nenhuma

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Conectar Coordinator.

### Objetivo
Concluir Conectar Coordinator dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
UIViewController, Auto Layout, collection views, reuse, diffable data.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Conectar Coordinator” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Validar estados e navegação com verificações determinísticas do fluxo de UI quando viável.

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

## SUB-P12-011 — Tratar estados de interface

Estado: REVIEW

Prioridade: P0

Depende de:
SUB-P12-010

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Tratar estados de interface.

### Objetivo
Concluir Tratar estados de interface dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
UIViewController, Auto Layout, collection views, reuse, diffable data.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Tratar estados de interface” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Validar estados e navegação com verificações determinísticas do fluxo de UI quando viável.

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

## SUB-P12-012 — Revisar desempenho de renderização

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P12-011

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Revisar desempenho de renderização.

### Objetivo
Concluir Revisar desempenho de renderização dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
UIViewController, Auto Layout, collection views, reuse, diffable data.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Revisar desempenho de renderização” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Validar estados e navegação com verificações determinísticas do fluxo de UI quando viável.

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

## SUB-P12-013 — Implementar tela de sugestões conforme referência visual

Estado: IN_PROGRESS

Prioridade: P0

Depende de:
- SUB-P12-004
- SUB-P12-005
- SUB-P11-006

### Contexto
A tela de sugestões existente já lista candidatos, mas ainda não apresenta claramente o produto original, a seleção de uma única alternativa ou uma ação persistente. A referência de Gabriel define essa segunda etapa da jornada.

### Objetivo
Organizar a tela UIKit para mostrar o produto original, opções demonstrativas comparáveis e a seleção local de uma alternativa.

### Requisitos
- Seguir a referência versionada em `docs/assets/suggestions-screen-reference.png` e os tokens/componentes existentes.
- Mostrar preço somente para o item original quando fornecido pelo `OrderItem`; não inventar preço dos candidatos.
- Não exibir percentual, selo de “mais compatível” ou disponibilidade que o ranking e os dados atuais não sustentem.
- Não selecionar candidato automaticamente. A pessoa escolhe uma opção explicitamente.
- Manter CTA no rodapé e preparar callback para comparação; deixá-lo desabilitado até a tela seguinte ser implementada e conectada.
- Preservar estado vazio, Dynamic Type, VoiceOver e dependências UIKit/MVVM-C existentes.
- Atualizar o contrato da tela e este planejamento; não implementar Comparison SwiftUI nesta task.

### Critérios de aceite
- [ ] O produto original aparece separado das alternativas, com seus dados e preço local quando disponível.
- [ ] Cada alternativa mostra nome, marca, quantidade e apenas evidências de categoria/quantidade que os dados permitem.
- [ ] A seleção é única, começa vazia e é anunciada visualmente e pelo VoiceOver.
- [ ] A tela é rolável e o CTA permanece no rodapé; a ação não sugere que a comparação já existe.
- [ ] Estado vazio continua compreensível e não mostra CTA acionável.
- [ ] Build do app passa; limites dos dados e da navegação estão documentados.
- [ ] Estado permanece REVIEW até Gabriel revisar; não marcar DONE automaticamente.

### Conceitos de engenharia
Composição de `UIView`, seleção exclusiva, callback entre View e Coordinator, apresentação de moeda localizada e estado de acessibilidade.

### Estudar antes da implementação
Como a ViewController reflete seleção sem assumir regra de domínio; ciclo de ownership das closures; traits e valores acessíveis; papel de cada dado no modelo de produto ou de pedido.

### Perguntas que preciso saber responder
- Por que o produto original e as alternativas precisam estar visualmente separados?
- Por que nenhuma alternativa começa selecionada?
- Quais dados sustentam a indicação de categoria e quantidade, e por que não exibimos preço/percentual nos candidatos?
- Como a View comunica a seleção sem calcular ranking nem controlar navegação?
- Por que o CTA fica desabilitado nesta etapa e quem deverá conectá-lo?

### Validação
Compilar para o Simulator e revisar hierarquia, seleção, estado vazio, Dynamic Type e leitura VoiceOver. Testes automatizados só serão executados quando solicitados ou previstos no escopo de validação aprovado.

### Observabilidade
Not applicable for this task.

### Considerações de memória
Callbacks dos cards capturam a ViewController fracamente para evitar ciclo `ViewController → stack → card → closure → ViewController`.

### Considerações de concorrência
Not applicable for this task. Os dados de demonstração são síncronos.

### Acessibilidade
Cards selecionáveis expõem trait de botão, estado selecionado e dica; o estado não depende apenas da cor. Textos usam Dynamic Type.

### Uso de IA
A IA implementa a referência e descreve limites; Gabriel confere se os dados e a hierarquia visual não induzem uma decisão que o modelo não justifica.

### Arquivos esperados
- `Substi/Presentation/Suggestions/SuggestionsViewController.swift`
- `Substi/DesignSystem/UIKit/DSProductCardView.swift`
- `Substi/App/Coordinators/AppCoordinator.swift`
- `Substi/Data/Fixtures/InventoryFixtures.swift`
- `docs/project/screens/order-and-suggestions.md`
- `docs/assets/suggestions-screen-reference.png`
- `docs/project/CURRENT.md`, `docs/project/BACKLOG.md` e este arquivo

### Critérios para conclusão
- [ ] Build e inspeção aplicável concluídos; limitações registradas.
- [ ] Critérios de aceite e diff explicados para Gabriel.
- [ ] Mover para REVIEW antes da análise; somente Gabriel marca DONE após revisão e compreensão.

### Notas para entrevista
Explicar como a seleção explícita preserva a decisão da pessoa, por que a UI não mostra dados inexistentes e como a fronteira de callback prepara a navegação para a tela de comparação.
