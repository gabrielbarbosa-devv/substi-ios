# FASE 09 — Laboratório de GCD

## Objetivo
Estudar GCD em um laboratório isolado, sem torná-lo a arquitetura principal do app.

## Resultado esperado
Exercícios e notas de estudo; nenhuma dependência para a trilha de entrega.

## Dependências
Resultados pertinentes da FASE 08.

## Prioridade
Consulte as prioridades das tasks. Trabalho P1/P2 não pode comprometer a entrega essencial P0.

## Estado
REVIEW

## Validação executada

- Xcode 16.4 forneceu Swift 6.1.2 para `x86_64-apple-macosx15.0`.
- O laboratório compilou com `-swift-version 6 -warnings-as-errors`.
- O executável concluiu todas as seções; o contador sincronizado terminou em
  `1000`, o grupo concluiu e a barreira separou a escrita das leituras.
- O arquivo permanece fora do target iOS e não altera o fluxo do aplicativo.

## SUB-P09-001 — Estudar DispatchQueue serial e concorrente

Estado: REVIEW

Prioridade: P2

Depende de:
- Nenhuma

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Estudar DispatchQueue serial e concorrente.

### Objetivo
Concluir Estudar DispatchQueue serial e concorrente dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [x] Resultado e evidência: Exercício serial/concurrent em `StudyLabs/GCD/GCDStudyLab.swift`; a fila serial preserva FIFO e a fila concurrent não promete ordem de conclusão.
- [x] Exercício/explicação executado ou validado com a ferramenta especificada.
- [ ] Gabriel revisa e explica o conceito antes de mover para DONE.

### Conceitos de engenharia
DispatchQueue, QoS, DispatchGroup, barriers, races, deadlocks.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Estudar DispatchQueue serial e concorrente” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar exemplos de laboratório determinísticos e limitados; não usar pausas arbitrárias.

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
- `StudyLabs/GCD/GCDStudyLab.swift`
- `StudyLabs/GCD/README.md`
- Este arquivo, `docs/project/BACKLOG.md` e `docs/project/CURRENT.md` para estado e evidências.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P09-002 — Estudar QoS

Estado: REVIEW

Prioridade: P2

Depende de:
- SUB-P09-001

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Estudar QoS.

### Objetivo
Concluir Estudar QoS dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [x] Resultado e evidência: Exercício com filas `.userInitiated` e `.utility`; a saída documenta que QoS indica prioridade relativa, não ordem garantida.
- [x] Exercício/explicação executado ou validado com a ferramenta especificada.
- [ ] Gabriel revisa e explica o conceito antes de mover para DONE.

### Conceitos de engenharia
DispatchQueue, QoS, DispatchGroup, barriers, races, deadlocks.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Estudar QoS” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar exemplos de laboratório determinísticos e limitados; não usar pausas arbitrárias.

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
- `StudyLabs/GCD/GCDStudyLab.swift`
- `StudyLabs/GCD/README.md`
- Este arquivo, `docs/project/BACKLOG.md` e `docs/project/CURRENT.md` para estado e evidências.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P09-003 — Estudar sync e async

Estado: REVIEW

Prioridade: P2

Depende de:
- SUB-P09-002

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Estudar sync e async.

### Objetivo
Concluir Estudar sync e async dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [x] Resultado e evidência: Exercício demonstra `async` seguido de `sync` na mesma fila serial e registra bloqueio do chamador e ordem FIFO.
- [x] Exercício/explicação executado ou validado com a ferramenta especificada.
- [ ] Gabriel revisa e explica o conceito antes de mover para DONE.

### Conceitos de engenharia
DispatchQueue, QoS, DispatchGroup, barriers, races, deadlocks.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Estudar sync e async” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar exemplos de laboratório determinísticos e limitados; não usar pausas arbitrárias.

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
- `StudyLabs/GCD/GCDStudyLab.swift`
- `StudyLabs/GCD/README.md`
- Este arquivo, `docs/project/BACKLOG.md` e `docs/project/CURRENT.md` para estado e evidências.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P09-004 — Criar exercício com DispatchGroup

Estado: REVIEW

Prioridade: P2

Depende de:
- SUB-P09-003

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Criar exercício com DispatchGroup.

### Objetivo
Concluir Criar exercício com DispatchGroup dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [x] Resultado e evidência: Exercício usa `DispatchGroup.enter/leave` e timeout de segurança; não usa `sleep()` para coordenar operações.
- [x] Exercício/explicação executado ou validado com a ferramenta especificada.
- [ ] Gabriel revisa e explica o conceito antes de mover para DONE.

### Conceitos de engenharia
DispatchQueue, QoS, DispatchGroup, barriers, races, deadlocks.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Criar exercício com DispatchGroup” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar exemplos de laboratório determinísticos e limitados; não usar pausas arbitrárias.

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
- `StudyLabs/GCD/GCDStudyLab.swift`
- `StudyLabs/GCD/README.md`
- Este arquivo, `docs/project/BACKLOG.md` e `docs/project/CURRENT.md` para estado e evidências.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P09-005 — Estudar barreiras

Estado: REVIEW

Prioridade: P2

Depende de:
- SUB-P09-004

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Estudar barreiras.

### Objetivo
Concluir Estudar barreiras dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [x] Resultado e evidência: Exercício agenda leituras, uma barrier e uma leitura posterior em fila concurrent privada; o grupo confirma o fim do conjunto.
- [x] Exercício/explicação executado ou validado com a ferramenta especificada.
- [ ] Gabriel revisa e explica o conceito antes de mover para DONE.

### Conceitos de engenharia
DispatchQueue, QoS, DispatchGroup, barriers, races, deadlocks.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Estudar barreiras” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar exemplos de laboratório determinísticos e limitados; não usar pausas arbitrárias.

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
- `StudyLabs/GCD/GCDStudyLab.swift`
- `StudyLabs/GCD/README.md`
- Este arquivo, `docs/project/BACKLOG.md` e `docs/project/CURRENT.md` para estado e evidências.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P09-006 — Diagnosticar race condition

Estado: REVIEW

Prioridade: P2

Depende de:
- SUB-P09-005

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Diagnosticar race condition.

### Objetivo
Concluir Diagnosticar race condition dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [x] Resultado e evidência: O README descreve a race de um contador sem sincronização e o executável valida uma versão protegida por `NSLock`.
- [x] Exercício/explicação executado ou validado com a ferramenta especificada.
- [ ] Gabriel revisa e explica o conceito antes de mover para DONE.

### Conceitos de engenharia
DispatchQueue, QoS, DispatchGroup, barriers, races, deadlocks.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Diagnosticar race condition” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar exemplos de laboratório determinísticos e limitados; não usar pausas arbitrárias.

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
- `StudyLabs/GCD/GCDStudyLab.swift`
- `StudyLabs/GCD/README.md`
- Este arquivo, `docs/project/BACKLOG.md` e `docs/project/CURRENT.md` para estado e evidências.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P09-007 — Estudar deadlock

Estado: REVIEW

Prioridade: P2

Depende de:
- SUB-P09-006

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Estudar deadlock.

### Objetivo
Concluir Estudar deadlock dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [x] Resultado e evidência: O README ilustra o deadlock de `sync` reentrante em fila serial, mas não executa o exemplo para não travar o laboratório.
- [x] Exercício/explicação executado ou validado com a ferramenta especificada.
- [ ] Gabriel revisa e explica o conceito antes de mover para DONE.

### Conceitos de engenharia
DispatchQueue, QoS, DispatchGroup, barriers, races, deadlocks.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Estudar deadlock” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar exemplos de laboratório determinísticos e limitados; não usar pausas arbitrárias.

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
- `StudyLabs/GCD/GCDStudyLab.swift`
- `StudyLabs/GCD/README.md`
- Este arquivo, `docs/project/BACKLOG.md` e `docs/project/CURRENT.md` para estado e evidências.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P09-008 — Comparar DispatchGroup e TaskGroup

Estado: REVIEW

Prioridade: P2

Depende de:
- SUB-P09-007

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Comparar DispatchGroup e TaskGroup.

### Objetivo
Concluir Comparar DispatchGroup e TaskGroup dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [x] Resultado e evidência: O executável calcula valores com `TaskGroup`; o README compara concorrência estruturada e `DispatchGroup` sem misturá-los no app.
- [x] Exercício/explicação executado ou validado com a ferramenta especificada.
- [ ] Gabriel revisa e explica o conceito antes de mover para DONE.

### Conceitos de engenharia
DispatchQueue, QoS, DispatchGroup, barriers, races, deadlocks.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Comparar DispatchGroup e TaskGroup” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar exemplos de laboratório determinísticos e limitados; não usar pausas arbitrárias.

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
- `StudyLabs/GCD/GCDStudyLab.swift`
- `StudyLabs/GCD/README.md`
- Este arquivo, `docs/project/BACKLOG.md` e `docs/project/CURRENT.md` para estado e evidências.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P09-009 — Documentar interoperabilidade

Estado: REVIEW

Prioridade: P2

Depende de:
- SUB-P09-008

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Documentar interoperabilidade.

### Objetivo
Concluir Documentar interoperabilidade dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [x] Resultado e evidência: O README registra limites de interoperabilidade, cancelamento/erros e mantém GCD fora do fluxo principal do Substi.
- [x] Exercício/explicação executado ou validado com a ferramenta especificada.
- [ ] Gabriel revisa e explica o conceito antes de mover para DONE.

### Conceitos de engenharia
DispatchQueue, QoS, DispatchGroup, barriers, races, deadlocks.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Documentar interoperabilidade” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar exemplos de laboratório determinísticos e limitados; não usar pausas arbitrárias.

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
- `StudyLabs/GCD/GCDStudyLab.swift`
- `StudyLabs/GCD/README.md`
- Este arquivo, `docs/project/BACKLOG.md` e `docs/project/CURRENT.md` para estado e evidências.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.
