# FASE 04 — Modelagem de domínio

## Objetivo
Modelar o domínio de substituição com semântica de valor explícita e testes.

## Resultado esperado
Tipos mínimos de pedido, produto, item e candidato para o fluxo escolhido.

## Dependências
Resultados pertinentes da FASE 03.

## Prioridade
Consulte as prioridades das tasks. Trabalho P1/P2 não pode comprometer a entrega essencial P0.

## Estado
IN_PROGRESS

## SUB-P04-001 — Definir ProductID

Estado: DONE

Prioridade: P1

Depende de:
- Nenhuma

### Contexto
Dois produtos podem ter o mesmo nome e atributos descritivos. O domínio precisa de uma identidade estável para distingui-los sem usar o nome que aparece na interface.

### Objetivo
Criar um tipo de valor `ProductID` e usá-lo como identidade obrigatória em `Product`.

### Requisitos
- Criar `Substi/Domain/Models/ProductID.swift` como wrapper tipado de `String`.
- Tornar `ProductID` `Hashable`, permitindo igualdade e uso como chave de coleções.
- Adicionar `id: ProductID` obrigatório ao modelo `Product`.
- Não assumir que o identificador é um código de barras nem validar formato antes de definir a integração com a fonte de dados.
- Atualizar os estados desta task em `CURRENT.md`, `BACKLOG.md` e neste arquivo.

### Critérios de aceite
- [x] `ProductID` encapsula uma `String` e é `Hashable`.
- [x] `Product` exige um `ProductID` em sua inicialização.
- [x] O build do app passa.
- [x] Gabriel revisa e explica a diferença entre identidade e nome de apresentação.

### Conceitos de engenharia
Value semantics, `struct`, identidade de domínio, `Hashable` e igualdade.

### Estudar antes da implementação
Revisar wrappers de tipo em Swift, síntese de conformidade `Hashable` e a diferença entre identidade e atributos de apresentação.

### Perguntas que preciso saber responder
- Por que não usar `String` diretamente em todos os lugares?
- O que `Hashable` permite fazer e como se relaciona com `Equatable`?
- Por que o nome do produto não serve como identidade?
- Por que ainda não validamos se o ID é um código de barras?

### Validação
Build do app para validar os tipos e sua inclusão no target. Testes de domínio serão organizados em `SUB-P04-010`; este wrapper não contém validação ou comportamento próprio.

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
- `Substi/Domain/Models/ProductID.swift`
- `Substi/Domain/Models/Product.swift`
- `docs/project/phases/PHASE-04-domain-modeling.md`
- `docs/project/BACKLOG.md`
- `docs/project/CURRENT.md`

### Critérios para conclusão
- [x] Implementação e build validados.
- [x] Limites e decisões documentados.
- [x] Gabriel revisa e explica a solução; task aprovada por Gabriel.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P04-002 — Definir Product

Estado: DONE

Prioridade: P0

Depende de:
Nenhuma

### Contexto
O fluxo de substituição precisa representar o produto escolhido e permitir comparar informações disponíveis sobre ele. Esta é a primeira tarefa de código do produto na Delivery Track.

### Objetivo
Criar um modelo de domínio Swift pequeno para representar nome e atributos descritivos de um produto.

### Requisitos
- Criar `Substi/Domain/Models/Product.swift`.
- Usar `struct` e propriedades imutáveis para representar o valor do produto.
- Incluir nome obrigatório e categoria, marca e quantidade como metadados opcionais, coerentes com os requisitos do produto.
- Manter o tipo independente de UIKit, SwiftUI e fontes de dados.
- Não adicionar identificador nesta task; a abstração `ProductID` permanece na `SUB-P04-001`.
- Não incluir preço no modelo de catálogo: preço pode variar por oferta/loja e será tratado quando o modelo de pedido/inventário exigir essa informação.
- Não adicionar regras de ranking, conversão numérica de quantidade ou comportamento de interface.
- Atualizar o estado desta task em `CURRENT.md` e `BACKLOG.md`.

### Critérios de aceite
- [x] `Product` existe em `Substi/Domain/Models/Product.swift` como `struct`.
- [x] Nome é obrigatório; categoria, marca e quantidade podem estar ausentes.
- [x] O tipo não depende de frameworks de UI ou networking.
- [x] O build do app passa.
- [x] Gabriel aprova a implementação e autoriza seguir para a próxima task.

### Conceitos de engenharia
Value semantics, `struct`, `let`, optionals e modelagem de domínio.

### Estudar antes da implementação
Revisar value types, propriedades imutáveis e optionals. Entender por que os dados de produto pertencem ao domínio e por que metadados podem estar ausentes.

### Perguntas que preciso saber responder
- Por que `Product` é um `struct` neste primeiro modelo?
- Por que as propriedades são `let`?
- Por que categoria, marca e quantidade são opcionais?
- Por que preço e identificador ficaram fora desta task?
- O que falta para comparar quantidades numericamente?

### Validação
Build do app para verificar que o novo arquivo participa do target. Testes unitários ficam para `SUB-P04-010`, pois este tipo ainda não contém comportamento próprio.

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
- `Substi/Domain/Models/Product.swift`
- `docs/project/phases/PHASE-04-domain-modeling.md`
- `docs/project/BACKLOG.md`
- `docs/project/CURRENT.md`

### Critérios para conclusão
- [x] Critérios de aceite de implementação atendidos e build validado.
- [x] Decisões e itens fora do escopo registrados.
- [x] Gabriel revisa a mudança e autoriza a continuidade do desenvolvimento.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P04-003 — Definir Order e OrderItem

Estado: REVIEW

Prioridade: P0

Depende de:
- SUB-P04-001
- SUB-P04-002

### Contexto
`Product` descreve um produto de catálogo, enquanto a compra precisa registrar quais produtos foram escolhidos. Uma linha de pedido separa esses papéis e permite ampliar os dados da linha somente quando o fluxo exigir.

### Objetivo
Representar um pedido como uma coleção de linhas, cada uma referenciando um produto do domínio.

### Requisitos
- Criar `OrderItem` como `struct` imutável que referencia um `Product`.
- Criar `Order` como `struct` imutável que contém uma coleção de `OrderItem`.
- Manter os tipos independentes de UIKit, SwiftUI, networking e regras de apresentação.
- Não adicionar quantidade pedida, preço, disponibilidade, estado, nem identificadores próprios de pedido/linha: esses campos não foram definidos pelas fontes do projeto.
- Atualizar o estado desta task em `CURRENT.md` e `BACKLOG.md`.

### Critérios de aceite
- [x] `OrderItem` referencia um `Product` sem copiar dados de catálogo para campos novos.
- [x] `Order` contém zero ou mais `OrderItem` e ambos são structs com propriedades imutáveis.
- [x] Os modelos não importam frameworks de UI ou networking.
- [x] O build do app passa.
- [ ] Gabriel revisa o resultado e explica a diferença entre `Product`, `OrderItem` e `Order`.

### Conceitos de engenharia
Semântica de valor, `struct`, composição, coleções e imutabilidade.

### Estudar antes da implementação
Revisar composição de tipos de valor e a diferença entre um produto de catálogo e uma linha de pedido. Entender por que não inferimos quantidade ou disponibilidade nesta etapa.

### Perguntas que preciso saber responder
- Por que `OrderItem` referencia `Product` em vez de guardar novamente nome e marca?
- Qual é a diferença entre o produto de catálogo, uma linha de pedido e o pedido completo?
- Por que ainda não modelamos quantidade pedida, preço ou disponibilidade?
- Que casos poderiam justificar um identificador próprio para `Order` ou `OrderItem`?
- Por que estes modelos são structs com propriedades `let`?

### Validação
Build do app para validar tipos e inclusão no target. Estes modelos são apenas composição de dados; testes determinísticos de domínio ficam em `SUB-P04-010`, onde poderão validar comportamento real dos modelos e das regras associadas.

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
- `Substi/Domain/Models/Order.swift`
- `Substi/Domain/Models/OrderItem.swift`
- `docs/project/phases/PHASE-04-domain-modeling.md`
- `docs/project/BACKLOG.md`
- `docs/project/CURRENT.md`

### Critérios para conclusão
- [x] Critérios de aceite de implementação atendidos e build validado.
- [x] Campos adiados e ausência de testes comportamentais nesta task estão justificados.
- [ ] Documentação e estado atualizados; Gabriel revisa e explica o resultado e os trade-offs.
- [x] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P04-004 — Definir SubstitutionCandidate

Estado: TODO

Prioridade: P0

Depende de:
SUB-P04-003

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Definir SubstitutionCandidate.

### Objetivo
Concluir Definir SubstitutionCandidate dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Value/reference semantics, structs, enums, immutability, Sendable.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir SubstitutionCandidate” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar testes determinísticos de domínio, incluindo casos de borda de valores e erros.

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

## SUB-P04-005 — Definir SubstitutionDecision

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P04-004

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Definir SubstitutionDecision.

### Objetivo
Concluir Definir SubstitutionDecision dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Value/reference semantics, structs, enums, immutability, Sendable.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir SubstitutionDecision” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar testes determinísticos de domínio, incluindo casos de borda de valores e erros.

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

## SUB-P04-006 — Definir erros de domínio

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P04-005

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Definir erros de domínio.

### Objetivo
Concluir Definir erros de domínio dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Value/reference semantics, structs, enums, immutability, Sendable.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir erros de domínio” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar testes determinísticos de domínio, incluindo casos de borda de valores e erros.

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

## SUB-P04-007 — Revisar semântica de valor

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P04-006

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Revisar semântica de valor.

### Objetivo
Concluir Revisar semântica de valor dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Value/reference semantics, structs, enums, immutability, Sendable.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Revisar semântica de valor” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar testes determinísticos de domínio, incluindo casos de borda de valores e erros.

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

## SUB-P04-008 — Revisar enum e let/var

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P04-007

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Revisar enum e let/var.

### Objetivo
Concluir Revisar enum e let/var dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Value/reference semantics, structs, enums, immutability, Sendable.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Revisar enum e let/var” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar testes determinísticos de domínio, incluindo casos de borda de valores e erros.

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

## SUB-P04-009 — Avaliar Sendable

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P04-008

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Avaliar Sendable.

### Objetivo
Concluir Avaliar Sendable dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Value/reference semantics, structs, enums, immutability, Sendable.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Avaliar Sendable” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar testes determinísticos de domínio, incluindo casos de borda de valores e erros.

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

## SUB-P04-010 — Adicionar testes de domínio

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P04-009

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Adicionar testes de domínio.

### Objetivo
Concluir Adicionar testes de domínio dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Value/reference semantics, structs, enums, immutability, Sendable.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Adicionar testes de domínio” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar testes determinísticos de domínio, incluindo casos de borda de valores e erros.

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
