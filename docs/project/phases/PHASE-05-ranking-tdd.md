# FASE 05 — Ranking e TDD

## Objetivo
Especificar um ranking determinístico e implementá-lo pelo ciclo RED–GREEN–REFACTOR.

## Resultado esperado
Regra pequena, explicável e testada, sem complexidade de pontuação artificial.

## Dependências
Resultados pertinentes da FASE 04.

## Prioridade
Consulte as prioridades das tasks. Trabalho P1/P2 não pode comprometer a entrega essencial P0.

## Estado
IN_PROGRESS

## SUB-P05-001 — Especificar regras de ranking

Estado: DONE

Prioridade: P0

Depende de:
- Nenhuma

### Contexto
O fluxo precisa distinguir alternativas com alguma semelhança ao produto indisponível. Categoria é um sinal descrito nos requisitos do produto; esta primeira regra deve ser simples e não prometer compatibilidade completa.

### Objetivo
Especificar a primeira regra observável: pontuação de compatibilidade pela categoria disponível no modelo `Product`.

### Requisitos
- Categorias iguais sem diferenciar maiúsculas e minúsculas recebem 1 ponto.
- Categorias diferentes ou ausentes recebem 0 ponto.
- Não inferir sinônimos, hierarquia de categorias ou compatibilidade total.
- Esta regra calcula pontuação; não ordena candidatos nem resolve empates.
- Registrar o limite da regra e atualizar `CURRENT.md`, `BACKLOG.md` e esta fase.

### Critérios de aceite
- [x] A regra de pontuação 1/0 está documentada para categoria igual, diferente ou ausente.
- [x] Está explícito que o score de categoria não representa sozinho uma substituição adequada.
- [x] Não há ordenação, sinônimos ou pesos adicionais nesta regra.

### Conceitos de engenharia
Regra de domínio determinística, pontuação simples, limite entre correspondência literal e compatibilidade semântica.

### Estudar antes da implementação
Revisar os atributos do `Product` e entender por que uma regra explícita facilita teste e explicação.

### Perguntas que preciso saber responder
- O que significa um score de categoria igual a 1 ou 0?
- Por que a categoria sozinha não prova que dois produtos são substitutos adequados?
- Por que comparação sem diferenciar maiúsculas é aceitável, mas sinônimos ficam fora?
- Por que esta task não ordena os candidatos?

### Validação
Revisão da regra documentada; o comportamento será exercitado pelo teste da `SUB-P05-002`.

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
- `docs/project/phases/PHASE-05-ranking-tdd.md`
- `docs/project/BACKLOG.md`
- `docs/project/CURRENT.md`

### Critérios para conclusão
- [x] Regra e limite documentados; estado atualizado.
- [x] Gabriel autorizou agrupar e concluir o bloco antes de seguir para o próximo.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P05-002 — Escrever teste que falha (RED)

Estado: IN_PROGRESS

Prioridade: P0

Depende de:
SUB-P05-001

### Contexto
Sem teste, a regra de pontuação poderia ficar ambígua ou regredir sem aviso.

### Objetivo
Criar testes determinísticos que expressem a regra de categoria antes da implementação de produção.

### Requisitos
- Cobrir categorias iguais, iguais com diferenças de caixa, categorias diferentes e categoria ausente em cada lado.
- Usar Swift Testing e dados construídos localmente; não acessar rede.
- Os testes devem falhar antes da implementação da `SUB-P05-003` por ausência do comportamento esperado.
- Atualizar o estado desta task e manter a etapa RED visível no histórico Git.

### Critérios de aceite
- [ ] Os casos da regra de categoria estão cobertos por testes determinísticos.
- [ ] A execução falha pelo motivo esperado antes do código GREEN.
- [ ] Os testes não dependem de rede nem de ordem externa.

### Conceitos de engenharia
TDD, Swift Testing, fixtures determinísticas e teste unitário de função pura.

### Estudar antes da implementação
Revisar `@Test`, `#expect` e por que primeiro expressamos o comportamento desejado no teste.

### Perguntas que preciso saber responder
- O que o estado RED demonstra neste ciclo?
- Como os casos ausentes evitam tratar falta de dados como correspondência?
- Por que os testes criam produtos em memória em vez de chamar uma API?

### Validação
Executar somente a suite `SubstiTests` e registrar a falha esperada antes da implementação.

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
- `SubstiTests/ProductSubstitutionRankerTests.swift`
- Remoção do teste de exemplo `SubstiTests/SubstiTests.swift`
- `docs/project/phases/PHASE-05-ranking-tdd.md`
- `docs/project/BACKLOG.md`
- `docs/project/CURRENT.md`

### Critérios para conclusão
- [ ] Testes RED falham pela falta do comportamento solicitado.
- [ ] Estado e escopo RED documentados antes de seguir para GREEN.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P05-003 — Implementar pontuação por categoria (GREEN)

Estado: TODO

Prioridade: P0

Depende de:
SUB-P05-002

### Contexto
Os testes da `SUB-P05-002` descrevem o comportamento esperado e precisam passar com a implementação mínima.

### Objetivo
Implementar uma função pura que calcula a pontuação de categoria para uma alternativa.

### Requisitos
- Criar `ProductSubstitutionRanker` como tipo pequeno de domínio, sem dependências externas ou estado mutável.
- Comparar `original.category` e `candidate.product.category` ignorando caixa.
- Retornar 1 quando ambas existirem e forem iguais; caso contrário, retornar 0.
- Não ordenar, desempatar, atribuir pesos, buscar dados ou alterar os modelos existentes.
- Atualizar o estado das três tasks agrupadas e deixar a implementação em `REVIEW` após a validação.

### Critérios de aceite
- [ ] Todos os testes da `SUB-P05-002` passam.
- [ ] A regra é pura e determinística, sem dependência de UIKit, SwiftUI ou rede.
- [ ] Categoria ausente ou diferente retorna 0.
- [ ] A pontuação não é apresentada como veredito de compatibilidade nem como ordenação.

### Conceitos de engenharia
Função pura, semântica de valor, determinismo, score discreto e GREEN em TDD.

### Estudar antes da implementação
Revisar comparação de strings, optionals com `guard` e por que uma função sem efeitos colaterais é simples de testar.

### Perguntas que preciso saber responder
- Por que o ranker recebe um candidato e o produto original?
- O que torna o resultado determinístico?
- Por que score 1/0 é uma regra proporcional para esta primeira etapa?
- Por que a categoria ausente resulta em 0?

### Validação
Executar a suite `SubstiTests`, compilar o app para o simulador e confirmar que o arquivo pertence ao target.

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
- `Substi/Domain/Services/ProductSubstitutionRanker.swift`
- `SubstiTests/ProductSubstitutionRankerTests.swift`
- `docs/project/phases/PHASE-05-ranking-tdd.md`
- `docs/project/BACKLOG.md`
- `docs/project/CURRENT.md`

### Critérios para conclusão
- [ ] Suite de testes e build do app passam.
- [ ] Regra e limites estão documentados; estado final fica em `REVIEW`.
- [ ] Gabriel explica o papel do score antes de marcar o conjunto como `DONE`.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P05-004 — Implementar pontuação por quantidade

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P05-003

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Implementar pontuação por quantidade.

### Objetivo
Concluir Implementar pontuação por quantidade dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
TDD, deterministic ranking, scoring, tie-breaking.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Implementar pontuação por quantidade” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Executar testes de ranking pelo ciclo RED/GREEN/REFACTOR, com ordenação estável e casos de borda.

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

## SUB-P05-005 — Implementar pontuação por atributos

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P05-004

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Implementar pontuação por atributos.

### Objetivo
Concluir Implementar pontuação por atributos dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
TDD, deterministic ranking, scoring, tie-breaking.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Implementar pontuação por atributos” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Executar testes de ranking pelo ciclo RED/GREEN/REFACTOR, com ordenação estável e casos de borda.

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

## SUB-P05-006 — Definir desempate

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P05-005

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Definir desempate.

### Objetivo
Concluir Definir desempate dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
TDD, deterministic ranking, scoring, tie-breaking.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir desempate” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Executar testes de ranking pelo ciclo RED/GREEN/REFACTOR, com ordenação estável e casos de borda.

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

## SUB-P05-007 — Cobrir casos de borda

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P05-006

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Cobrir casos de borda.

### Objetivo
Concluir Cobrir casos de borda dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
TDD, deterministic ranking, scoring, tie-breaking.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Cobrir casos de borda” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Executar testes de ranking pelo ciclo RED/GREEN/REFACTOR, com ordenação estável e casos de borda.

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

## SUB-P05-008 — Refatorar ranking

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P05-007

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Refatorar ranking.

### Objetivo
Concluir Refatorar ranking dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
TDD, deterministic ranking, scoring, tie-breaking.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Refatorar ranking” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Executar testes de ranking pelo ciclo RED/GREEN/REFACTOR, com ordenação estável e casos de borda.

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

## SUB-P05-009 — Documentar pesos e limitações

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P05-008

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Documentar pesos e limitações.

### Objetivo
Concluir Documentar pesos e limitações dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
TDD, deterministic ranking, scoring, tie-breaking.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Documentar pesos e limitações” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Executar testes de ranking pelo ciclo RED/GREEN/REFACTOR, com ordenação estável e casos de borda.

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

## SUB-P05-010 — Revisar TDD

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P05-009

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Revisar TDD.

### Objetivo
Concluir Revisar TDD dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
TDD, deterministic ranking, scoring, tie-breaking.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Revisar TDD” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Executar testes de ranking pelo ciclo RED/GREEN/REFACTOR, com ordenação estável e casos de borda.

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
