# FASE 13 — Integração com SwiftUI

## Objetivo
Integrar a comparação em SwiftUI sem transferir a navegação para a View.

## Resultado esperado
Uma tela SwiftUI coerente apresentada no fluxo UIKit; Coordinator mantém ownership da navegação.

## Dependências
Resultados pertinentes da FASE 12.

## Prioridade
Consulte as prioridades das tasks. Trabalho P1/P2 não pode comprometer a entrega essencial P0.

## Estado
REVIEW — modelo e comparação implementados, aguardando revisão do desenvolvedor.

## SUB-P13-001 — Definir modelo de apresentação da comparação

Estado: REVIEW

Prioridade: P0

Depende de:
- Nenhuma

### Contexto
Domínio e fixtures não oferecem todos os campos usados no mock visual. A tela precisa transformar os dados existentes em textos comparáveis sem alterar o domínio nem fabricar informação.

### Objetivo
Criar um modelo de apresentação imutável para o produto original e o substituto, com valores formatados para exibição.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [x] Modelo imutável representa os dados conhecidos do original e do substituto.
- [x] O modelo não calcula ranking, compatibilidade nem preenche valores ausentes.
- [ ] Gabriel revisa o resultado e explica as alternativas e os trade-offs.

### Conceitos de engenharia
Value semantics, separação domínio/apresentação, formatação de moeda e valores ausentes.

### Estudar antes da implementação
Revisar por que uma View deve receber dados prontos para apresentação e quando um modelo local reduz dependência do domínio.

### Perguntas que preciso saber responder
- Que problema “Definir modelo de apresentação da comparação” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Validar apresentação, navegação de retorno e estado do SwiftUI.

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
- `Substi/Presentation/Comparison/ProductComparisonViewModel.swift`
- `docs/project/screens/order-and-suggestions.md`

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P13-002 — Criar ProductComparisonView

Estado: REVIEW

Prioridade: P0

Depende de:
SUB-P13-001

### Contexto
Uma comparação lado a lado torna claras as diferenças que podem afetar a escolha do substituto.

### Objetivo
Renderizar o original e o candidato selecionado com hierarquia próxima à referência, respeitando os dados e foundations disponíveis.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [x] `ProductComparisonView` compara nome, marca, categoria, quantidade e preço quando fornecido.
- [x] Valores ausentes são explícitos; não há percentual nem atributo inventado.
- [x] A tela usa foundations semânticas e fontes escaláveis.
- [ ] Gabriel revisa a tela e explica as decisões.

### Conceitos de engenharia
SwiftUI View, composição declarativa, Dynamic Type, acessibilidade e reutilização proporcional.

### Estudar antes da implementação
Revisar estado imutável em SwiftUI, fontes semânticas e diferenças entre descrição acessível de um grupo e seus elementos.

### Perguntas que preciso saber responder
- Que problema “Criar ProductComparisonView” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Validar apresentação, navegação de retorno e estado do SwiftUI.

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
- `Substi/Presentation/Comparison/ProductComparisonView.swift`
- `docs/assets/comparison-screen-reference.png`
- `docs/project/screens/order-and-suggestions.md`

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P13-003 — Adicionar previews

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P13-002

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Adicionar previews.

### Objetivo
Concluir Adicionar previews dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
SwiftUI state, UIHostingController, Coordinator.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Adicionar previews” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Validar apresentação, navegação de retorno e estado do SwiftUI.

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
- `Substi/App/Coordinators/AppCoordinator.swift`
- `docs/project/screens/order-and-suggestions.md`

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P13-004 — Apresentar com UIHostingController

Estado: REVIEW

Prioridade: P0

Depende de:
Nenhuma

### Contexto
O fluxo principal é UIKit. A tela SwiftUI precisa aparecer dentro do mesmo `UINavigationController` sem criar uma navegação paralela.

### Objetivo
Hospedar `ProductComparisonView` com `UIHostingController` e manter a barra e o retorno nativos.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [x] A View SwiftUI é apresentada por `UIHostingController` no `UINavigationController` existente.
- [x] O título e o retorno usam a navigation bar UIKit nativa.
- [ ] Gabriel revisa a integração e explica o ownership do hosting controller.

### Conceitos de engenharia
SwiftUI state, UIHostingController, Coordinator.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Apresentar com UIHostingController” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Validar apresentação, navegação de retorno e estado do SwiftUI.

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
- `Substi/App/Coordinators/AppCoordinator.swift`
- `docs/project/screens/order-and-suggestions.md`

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P13-005 — Manter navegação no Coordinator

Estado: REVIEW

Prioridade: P0

Depende de:
SUB-P13-004

### Contexto
As Views não devem decidir rotas nem depender do `UINavigationController`.

### Objetivo
Manter a abertura da comparação e a volta para Sugestões sob responsabilidade do `AppCoordinator`.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [x] O Coordinator cria a comparação e conecta “Ver outras opções” ao retorno para Sugestões.
- [x] A View não conhece `UINavigationController` nem decide navegação.
- [ ] Gabriel revisa o fluxo e explica por que a navegação pertence ao Coordinator.

### Conceitos de engenharia
SwiftUI state, UIHostingController, Coordinator.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Manter navigation em Coordinator” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Validar apresentação, navegação de retorno e estado do SwiftUI.

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
- `Substi/App/Coordinators/AppCoordinator.swift`
- `docs/project/screens/order-and-suggestions.md`

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P13-006 — Validar UIKit para SwiftUI

Estado: TODO

Prioridade: P0

Depende de:
SUB-P13-005

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Validar UIKit para SwiftUI.

### Objetivo
Concluir Validar UIKit para SwiftUI dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
SwiftUI state, UIHostingController, Coordinator.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Validar UIKit para SwiftUI” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Validar apresentação, navegação de retorno e estado do SwiftUI.

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

## SUB-P13-007 — Validar fluxo de retorno

Estado: TODO

Prioridade: P0

Depende de:
Nenhuma

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Validar fluxo de retorno.

### Objetivo
Concluir Validar fluxo de retorno dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
SwiftUI state, UIHostingController, Coordinator.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Validar fluxo de retorno” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Validar apresentação, navegação de retorno e estado do SwiftUI.

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

## SUB-P13-008 — Documentar migração incremental

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P13-007

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Documentar migração incremental.

### Objetivo
Concluir Documentar migração incremental dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
SwiftUI state, UIHostingController, Coordinator.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Documentar migração incremental” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Validar apresentação, navegação de retorno e estado do SwiftUI.

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

## SUB-P13-009 — Criar confirmação da substituição

Estado: REVIEW

Prioridade: P0

Depende de:
- SUB-P07-010
- SUB-P13-001
- SUB-P13-002
- SUB-P13-004

### Contexto
A comparação mostra as diferenças; a pessoa precisa revisar o item original e o candidato uma última vez antes de confirmar a troca.

### Objetivo
Apresentar a confirmação em uma folha SwiftUI hospedada no fluxo UIKit e atualizar o pedido demonstrativo somente após ação explícita.

### Requisitos
- Seguir a referência `docs/assets/confirmation-screen-reference.png` e o contrato em `docs/project/screens/order-and-suggestions.md`.
- Exibir produto original, candidato, quantidade, marca e preço apenas quando fornecido.
- Oferecer ações explícitas para confirmar e cancelar; manter navegação e atualização do pedido no `AppCoordinator`/repositório.
- Após confirmar, retornar ao pedido com o candidato marcado como substituído; cancelar preserva o pedido original.
- Usar a apresentação de folha nativa e considerar Dynamic Type e VoiceOver.
- Não simular foto individual, preço do candidato nem percentual de compatibilidade ausentes nas fixtures.

### Critérios de aceite
- [x] A comparação abre uma confirmação resumindo original e candidato.
- [x] Cancelar fecha a folha sem alterar o pedido.
- [x] Confirmar atualiza o pedido somente na fixture em memória e retorna à tela Pedido com estado “Substituído”.
- [x] Informações ausentes permanecem explícitas; nenhum valor demonstrativo da imagem é inventado.
- [x] Build do app passa no Xcode 16.4 para iOS Simulator; estado e limites estão documentados.
- [ ] Gabriel revisa a tela, o caminho de confirmação e explica os limites da atualização em memória.

### Conceitos de engenharia
SwiftUI hospedado em UIKit, Coordinator, callbacks, estado de sessão e apresentação de formulário de confirmação.

### Estudar antes da implementação
Revisar a diferença entre confirmar uma decisão local e alterar um pedido real; seguir callback da View até Coordinator e Repository.

### Perguntas que preciso saber responder
- Por que a confirmação é uma folha modal e quem controla sua apresentação?
- O que muda no pedido ao confirmar e o que acontece ao cancelar?
- Onde o estado vive e por quanto tempo?
- Por que não exibimos os 92%, o preço e as imagens da referência?
- O que seria necessário para confirmar a substituição em um serviço real?

### Validação
Compilar o app e revisar os fluxos confirmar/cancelar em execução. Testes automatizados não fazem parte desta alteração.

### Observabilidade
Not applicable for this task.

### Considerações de memória
Callbacks capturam o Coordinator fracamente; o Coordinator mantém o repository e os controllers enquanto necessários. A folha hospedada é liberada após dismiss.

### Considerações de concorrência
A fixture é síncrona e chamada pelo Coordinator no fluxo principal; não se introduzem Tasks ou filas.

### Acessibilidade
Textos semânticos, hierarquia de leitura, Dynamic Type, ícones decorativos ocultos e alvos nativos de botão.

### Uso de IA
A IA pode implementar a tela com dados existentes e explicitar lacunas; Gabriel valida a referência, os dados e o fluxo de decisão.

### Arquivos esperados
- `Substi/Presentation/Confirmation/ConfirmationView.swift`
- `Substi/Presentation/Comparison/ProductComparisonView.swift`
- `Substi/Presentation/Order/OrderViewController.swift`
- `Substi/Presentation/Order/OrderViewModel.swift`
- `Substi/App/Coordinators/AppCoordinator.swift`
- `docs/assets/confirmation-screen-reference.png`
- `docs/project/screens/order-and-suggestions.md`
- `docs/project/phases/PHASE-13-swiftui-integration.md`
- `docs/project/BACKLOG.md`
- `docs/project/CURRENT.md`

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar a fronteira entre estado local de demonstração e uma confirmação real de negócio, além do ownership da navegação.
