# FASE 02 — Arquitetura

## Objetivo
Escolher limites arquiteturais proporcionais e definir a direção das dependências antes do código de feature.

## Resultado esperado
MVVM-C mínimo documentado, Coordinator/composição justificados e alternativas avaliadas.

## Dependências
Resultados pertinentes da FASE 01.

## Prioridade
Consulte as prioridades das tasks. Trabalho P1/P2 não pode comprometer a entrega essencial P0.

## Estado
IN_PROGRESS

## SUB-P02-001 — Escrever ADR de MVVM-C

Estado: DONE

Prioridade: P0

Depende de:
- Nenhuma

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Escrever ADR de MVVM-C.

### Objetivo
Concluir Escrever ADR de MVVM-C dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [x] O resultado foi produzido dentro do escopo combinado.
- [x] Decisões e trade-offs foram explicados e registrados.
- [x] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
MVVM-C, MVC, MVVM, VIP, VIPER, DI, dependency direction, SOLID.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Escrever ADR de MVVM-C” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisar ADR/diagrama quanto à direção das dependências, ownership e alternativas.

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
- [x] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [x] Verificações aplicáveis passam; o que não se aplica está justificado.
- [x] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [x] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P02-002 — Definir camadas e direção das dependências

Estado: DONE

Prioridade: P0

Depende de:
SUB-P02-001

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Definir camadas e direção das dependências.

### Objetivo
Concluir Definir camadas e direção das dependências dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [x] O resultado foi produzido dentro do escopo combinado.
- [x] Decisões e trade-offs foram explicados e registrados.
- [x] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
MVVM-C, MVC, MVVM, VIP, VIPER, DI, dependency direction, SOLID.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir camadas e direção das dependências” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisar ADR/diagrama quanto à direção das dependências, ownership e alternativas.

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
- [x] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [x] Verificações aplicáveis passam; o que não se aplica está justificado.
- [x] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [x] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

### Registro de encerramento
Gabriel solicitou explicitamente o encerramento desta task como `DONE` em 2026-09-27, após a apresentação da decisão, da implementação e da validação.
## SUB-P02-003 — Comparar MVC e MVVM

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P02-002

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Comparar MVC e MVVM.

### Objetivo
Concluir Comparar MVC e MVVM dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
MVVM-C, MVC, MVVM, VIP, VIPER, DI, dependency direction, SOLID.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Comparar MVC e MVVM” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisar ADR/diagrama quanto à direção das dependências, ownership e alternativas.

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

## SUB-P02-004 — Comparar VIP e VIPER

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P02-003

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Comparar VIP e VIPER.

### Objetivo
Concluir Comparar VIP e VIPER dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
MVVM-C, MVC, MVVM, VIP, VIPER, DI, dependency direction, SOLID.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Comparar VIP e VIPER” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisar ADR/diagrama quanto à direção das dependências, ownership e alternativas.

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

## SUB-P02-005 — Definir ownership do Coordinator

Estado: DONE

Prioridade: P0

Depende de:
Nenhuma

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Definir ownership do Coordinator.

### Objetivo
Concluir Definir ownership do Coordinator dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [x] O resultado foi produzido dentro do escopo combinado.
- [x] Decisões e trade-offs foram explicados e registrados.
- [x] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
MVVM-C, MVC, MVVM, VIP, VIPER, DI, dependency direction, SOLID.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir ownership do Coordinator” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisar ADR/diagrama quanto à direção das dependências, ownership e alternativas.

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
- [x] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [x] Verificações aplicáveis passam; o que não se aplica está justificado.
- [x] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [x] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

### Registro de encerramento
Gabriel solicitou explicitamente o encerramento desta task como `DONE` em 2026-09-27, após a apresentação da decisão, da implementação e da validação.
## SUB-P02-006 — Definir Composition Root

Estado: DONE

Prioridade: P0

Depende de:
SUB-P02-005

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Definir Composition Root.

### Objetivo
Concluir Definir Composition Root dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [x] O resultado foi produzido dentro do escopo combinado.
- [x] Decisões e trade-offs foram explicados e registrados.
- [x] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
MVVM-C, MVC, MVVM, VIP, VIPER, DI, dependency direction, SOLID.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir Composition Root” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisar ADR/diagrama quanto à direção das dependências, ownership e alternativas.

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
- [x] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [x] Verificações aplicáveis passam; o que não se aplica está justificado.
- [x] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [x] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

### Registro de encerramento
Gabriel solicitou explicitamente o encerramento desta task como `DONE` em 2026-09-27, após a apresentação da decisão, da implementação e da validação.
## SUB-P02-007 — Definir injeção de dependências

Estado: DONE

Prioridade: P0

Depende de:
Nenhuma

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Definir injeção de dependências.

### Objetivo
Concluir Definir injeção de dependências dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [x] O resultado foi produzido dentro do escopo combinado.
- [x] Decisões e trade-offs foram explicados e registrados.
- [x] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
MVVM-C, MVC, MVVM, VIP, VIPER, DI, dependency direction, SOLID.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir injeção de dependências” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisar ADR/diagrama quanto à direção das dependências, ownership e alternativas.

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
- [x] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [x] Verificações aplicáveis passam; o que não se aplica está justificado.
- [x] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [x] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

### Registro de encerramento
Gabriel solicitou explicitamente o encerramento desta task como `DONE` em 2026-09-27, após a apresentação da decisão, da implementação e da validação.
## SUB-P02-008 — Definir fronteiras de protocolos

Estado: DONE

Prioridade: P1

Depende de:
- SUB-P02-007

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Definir fronteiras de protocolos.

### Objetivo
Concluir Definir fronteiras de protocolos dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [x] O resultado foi produzido dentro do escopo combinado.
- [x] Decisões e trade-offs foram explicados e registrados.
- [x] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
MVVM-C, MVC, MVVM, VIP, VIPER, DI, dependency direction, SOLID.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir fronteiras de protocolos” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisar ADR/diagrama quanto à direção das dependências, ownership e alternativas.

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
- [x] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [x] Verificações aplicáveis passam; o que não se aplica está justificado.
- [x] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [x] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

### Registro de encerramento
Gabriel solicitou explicitamente o encerramento desta task como `DONE` em 2026-09-27, após a apresentação da decisão, da implementação e da validação.
## SUB-P02-009 — Revisar trade-offs de SOLID

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P02-008

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Revisar trade-offs de SOLID.

### Objetivo
Concluir Revisar trade-offs de SOLID dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
MVVM-C, MVC, MVVM, VIP, VIPER, DI, dependency direction, SOLID.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Revisar trade-offs de SOLID” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisar ADR/diagrama quanto à direção das dependências, ownership e alternativas.

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

## SUB-P02-010 — Revisar arquitetura

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P02-009

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Revisar architecture.

### Objetivo
Concluir Revisar architecture dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
MVVM-C, MVC, MVVM, VIP, VIPER, DI, dependency direction, SOLID.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Revisar architecture” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisar ADR/diagrama quanto à direção das dependências, ownership e alternativas.

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

## SUB-P02-011 — Separar navegação da composição de telas

Estado: REVIEW

Prioridade: P1

Depende de:
- SUB-P02-002
- SUB-P02-005

### Contexto
O `AppCoordinator` coordena rotas, mas também constrói ViewModels, UIKit controllers e telas SwiftUI. Isso faz a navegação conhecer detalhes de composição e dependências de apresentação.

### Objetivo
Manter o Coordinator focado em transições; mover a montagem das telas para uma Factory específica. Leituras locais simples continuam no Repository e são solicitadas pelos ViewModels. Extrair Use Cases somente quando houver comportamento de aplicação próprio.

### Requisitos
- Não colocar navegação nem tipos UIKit/SwiftUI nos Use Cases.
- Não alterar a regra de confirmação nem o comportamento das telas.
- Usar os contratos existentes de `InventoryRepository`.
- Não criar Use Cases que apenas repassem leituras do Repository.
- Manter a implementação pequena e coberta por testes determinísticos.

### Critérios de aceite
- [x] `AppCoordinator` contém decisões e transições de navegação, sem construir Views/ViewControllers/ViewModels.
- [x] Uma Factory específica monta as telas e injeta dependências.
- [x] ViewModels obtêm os dados de tela locais por meio do contrato `InventoryRepository`.
- [x] Não foram adicionados Use Cases de encaminhamento para consultas simples.
- [x] A jornada de navegação existente permanece coberta por teste.
- [x] O papel de cada camada e os trade-offs estão documentados.

### Conceitos de engenharia
SRP, Separation of Concerns, MVVM-C, Use Case, Repository, composição de telas e testes determinísticos.

### Validação
`git diff --check` passou. A suíte de ViewModel e navegação não pôde ser executada neste ambiente: `xcodebuild` está instalado, mas o active developer directory aponta para Command Line Tools, sem Xcode selecionado. Revisar o grafo de dependências concluído por inspeção.

### Arquivos esperados
`AppScreenFactory.swift`, `AppCoordinator.swift`, `SceneDelegate.swift`, ViewModels afetados, testes, `ADR-001-mvvm-c.md`, `BACKLOG.md` e `CURRENT.md`.

### Critérios para conclusão
- [x] Verificações aplicáveis passam ou a limitação do ambiente é registrada.
- [x] Documentação e estado atualizados.
- [x] Mover para REVIEW; Gabriel revisa e explica antes de marcar DONE.

### Registro de encerramento
Gabriel solicitou explicitamente o encerramento desta task como `DONE` em 2026-09-27, após a apresentação da decisão, da implementação e da validação.
