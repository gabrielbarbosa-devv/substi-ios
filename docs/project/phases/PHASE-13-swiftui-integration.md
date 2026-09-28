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

Estado: REVIEW

Prioridade: P0

Depende de:
SUB-P13-005

### Contexto
O fluxo principal usa UIKit e apresenta a comparação em SwiftUI dentro da navegação já controlada pelo `AppCoordinator`. A integração precisa funcionar como uma única jornada, sem dar à View SwiftUI controle do `UINavigationController`.

### Objetivo
Validar que o Coordinator apresenta a comparação SwiftUI a partir das sugestões UIKit e que a ação de retorno leva à lista de sugestões existente.

### Requisitos
- Executar o app no iOS Simulator e percorrer Pedido → Sugestões → Comparação.
- Confirmar que a comparação recebe os produtos escolhidos e é apresentada no `UINavigationController` por `UIHostingController`.
- Confirmar que o conteúdo da comparação reflete o candidato selecionado e exibe valores indisponíveis sem inventá-los.
- Confirmar que a barra de navegação permanece UIKit e que a tela SwiftUI se ajusta às safe areas do iOS.
- Registrar build, testes aplicáveis e limitações observadas; corrigir somente defeitos que impeçam este fluxo.
- Não adicionar componentes, navegação SwiftUI paralela ou dados artificiais para facilitar a validação.

### Critérios de aceite
- [x] A comparação SwiftUI abre a partir da navegação UIKit existente.
- [x] A tela mantém a navegação UIKit e apresenta os dados do candidato escolhido.
- [x] Dados ausentes aparecem como “Não informado”, sem valores simulados.
- [x] Build e verificações aplicáveis passam; evidências e limitações ficam registradas.
- [ ] Gabriel revisa a ponte UIKit/SwiftUI e consegue explicar o papel do Coordinator e do `UIHostingController`.

### Conceitos de engenharia
SwiftUI state, UIHostingController, Coordinator.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Validar UIKit para SwiftUI” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Build completo e 29 testes passaram no iPhone 16 Pro Simulator (iOS 18.6, arquitetura x86_64); 26 unitários e 3 de UI/launch, sem falhas. A execução anterior do fluxo real mostrou um candidato da Open Food Facts na comparação SwiftUI. Os testes de UI existentes verificam launch, não automatizam taps pelo fluxo.

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
- [x] Critérios de aceite atendidos e evidências documentadas para revisão de Gabriel.
- [x] Verificações aplicáveis passam; testes de UI existentes são smoke tests de launch e não cobrem taps/navegação.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [x] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P13-007 — Validar fluxo de retorno

Estado: REVIEW

Prioridade: P0

Depende de:
Nenhuma

### Contexto
Na Comparação, a ação “Ver outras opções” deve voltar à lista UIKit já carregada. Confirmar a substituição é uma ação separada e não pode ocorrer ao voltar.

### Objetivo
Validar que o Coordinator remove a Comparação SwiftUI do topo da navegação UIKit, preservando a mesma tela de Sugestões e sem alterar o pedido.

### Requisitos
- Exercitar o caminho de retorno do Coordinator em teste determinístico, sem rede ao vivo.
- Confirmar que a instância de Sugestões permanece no stack após fechar a Comparação.
- Confirmar que retornar não confirma nem altera a substituição no pedido.
- Atualizar planejamento e documentação com a validação e seus limites.

### Critérios de aceite
- [x] “Ver outras opções” remove Comparação do topo e revela a mesma instância de Sugestões.
- [x] Retornar não confirma a substituição nem altera o pedido.
- [x] O teste usa dados locais determinísticos e não depende da API Open Food Facts.
- [x] Build e teste relevante passam; limitações e trade-offs são registrados.
- [x] Estado atualizado para REVIEW após a validação.
- [ ] Gabriel revisa e explica a decisão antes de DONE.

### Conceitos de engenharia
UINavigationController stack, Coordinator, UIHostingController, identidade e ciclo de vida de UIViewController.

### Estudar antes da implementação
Revisar como `pushViewController` e `popViewController` alteram a pilha e como o Coordinator liga a ação SwiftUI ao fluxo UIKit.

### Perguntas que preciso saber responder
- Por que o Coordinator faz `popViewController` em “Ver outras opções”?
- Como sabemos que a lista de Sugestões continua sendo a mesma instância?
- Por que retornar não deve chamar `confirmSubstitution`?
- Como o teste evita depender da API ao vivo?

### Validação
`xcodebuild -project Substi.xcodeproj -scheme Substi -destination 'platform=iOS Simulator,name=iPhone 16 Pro,OS=18.6' -only-testing:SubstiTests/AppCoordinatorNavigationTests test` — passou no iPhone 16 Pro Simulator (iOS 18.6, x86_64). O teste usa `DemoInventoryRepository` e um `ProductRepository` de fixture; não acessa a API ao vivo. Ele invoca a closure conectada ao botão SwiftUI e verifica o stack, a identidade do controller de Sugestões e o pedido inalterado. A automação não simula um toque físico nem avalia o layout visual.

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
- `SubstiTests/AppCoordinatorNavigationTests.swift`
- `docs/project/phases/PHASE-13-swiftui-integration.md`
- `docs/project/BACKLOG.md`
- `docs/project/CURRENT.md`

### Resultado da validação
O Coordinator mantém Sugestões no stack quando empurra Comparação; a ação SwiftUI “Ver outras opções” executa `popViewController`, então a mesma instância reaparece com seu estado associado. A confirmação permanece em outra closure e não é chamada pelo retorno. Essa separação preserva a decisão explícita da pessoa usuária.

O teste não verifica o desenho visual ou o gesto/tap físico. Ele cobre a ação e o estado de navegação em UIKit com dados locais determinísticos, suficiente para a regra de retorno sem transformar a API pública em dependência de teste.

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

## SUB-P13-010 — Carregar sugestões reais da Open Food Facts

Estado: DONE

Prioridade: P0

Depende de:
- SUB-P06-006
- SUB-P06-007
- SUB-P06-009
- SUB-P06-010
- SUB-P07-001
- SUB-P07-005
- SUB-P08-001
- SUB-P12-004

### Contexto
A tela Sugestões ainda recebe candidatos artificiais de uma fixture. A infraestrutura de rede, o `ProductRepository` e o `LoadProductUseCase` já existem, mas a composição do app não os conecta à jornada. A indisponibilidade e os preços do pedido continuam sendo demonstração local; Open Food Facts fornece catálogo de produtos, não estoque nem preço da loja.

### Objetivo
Carregar, pelo barcode, até três produtos reais do catálogo Open Food Facts ao abrir Sugestões e apresentar dados reais com estados claros de carregamento, conteúdo, vazio e erro.

### Requisitos
- Compor `URLSessionAPIClient` e `OpenFoodFactsProductRepository` na entrada do app e injetar a dependência via Coordinator/Use Case.
- Manter barcodes candidatos em fixture local e validar seus registros na API antes de conectá-los.
- Fazer as requisições sequencialmente; esta lista fixa e pequena não justifica `TaskGroup`.
- Restringir os campos da resposta a código, nome, categorias, marca e quantidade.
- Manter DTO e formato Open Food Facts dentro de Data; a apresentação recebe `Product`/`SubstitutionCandidate`.
- Mostrar produtos parciais quando algumas consultas falharem e oferecer nova tentativa; mostrar erro recuperável quando todas falharem.
- Distinguir lista configurada vazia de erro de transporte ou de barcode sem produto.
- Permitir seleção e seguir para Comparação/Confirmação existentes, sem inventar preço ou compatibilidade percentual.
- Não converter o pedido, a disponibilidade ou a confirmação em dados remotos nesta task.
- Manter testes determinísticos offline; validar a chamada real manualmente no app/Simulator.

### Critérios de aceite
- [x] O fluxo consulta produtos por `URLSession`; três barcodes foram validados na API e a tela de comparação do Simulator exibiu dados de catálogo (Italac), distintos da fixture.
- [x] Carga, conteúdo, vazio, falha total, falha parcial e nova tentativa têm comportamento explícito; estados de carga e falhas parciais/totais são cobertos offline.
- [x] Uma resposta de barcode sem produto é tratada pelo Mapper e tem teste determinístico.
- [x] O produto recebido pode ser selecionado e seguir para Comparação/Confirmação existentes.
- [x] Preço de candidato permanece “Não informado”; estoque e preço do pedido permanecem locais.
- [x] Os 26 testes unitários passaram sem rede; o build do app para iOS Simulator passou.
- [x] Gabriel revisou o fluxo no app e autorizou seguir o desenvolvimento.

### Conceitos de engenharia
Composição na entrada do app, Dependency Inversion em fronteiras existentes, DTO/Mapper, async/await, `MainActor`, cancelamento de `Task`, estados de UI e falha parcial.

### Estudar antes da implementação
Seguir visualmente a cadeia `SceneDelegate → Coordinator → ViewModel → Use Case → ProductRepository → APIClient → DTO → Mapper → Product` e distinguir catálogo público de inventário de loja.

### Perguntas que preciso saber responder
- Onde a chamada HTTP começa e por que a View não conhece `URLSession`?
- Que papel têm `ProductRepository`, `LoadProductUseCase`, DTO e Mapper?
- Por que as consultas são sequenciais? O que o cancelamento interrompe?
- Como a tela distingue vazio de falha e o que acontece se só parte dos barcodes carregar?
- Quais dados vêm da API e quais continuam sendo fixture local?

### Validação
Build e testes offline com respostas de sucesso, ausência de produto, erro e falha parcial. Executar a aplicação no Simulator com rede para confirmar produtos reais, retry e abertura da comparação; repetir com rede indisponível ou resposta inválida quando viável.

### Observabilidade
Mensagens de estado visíveis são suficientes nesta fatia. Logger estruturado e métricas permanecem no escopo da fase de Observabilidade.

### Considerações de memória
O ViewController mantém a Task de carregamento e cancela ao ser liberado. O callback do ViewModel captura o controller fracamente; o ViewModel não mantém Task própria.

### Considerações de concorrência
A tela e o estado do ViewModel ficam isolados em `MainActor`. As consultas são sequenciais e a Task é cancelada quando o controller sai do fluxo. Não usar GCD, `TaskGroup` ou `Task.detached`.

### Acessibilidade
Anunciar carregamento e erro com texto, permitir retry como botão acessível e preservar rótulos/seleção dos cards.

### Uso de IA
A IA pode consultar a API, implementar a composição e sugerir testes offline. Gabriel confirma os dados reais, o que permanece demonstrativo e o motivo das dependências.

### Arquivos esperados
- `Substi/App/SceneDelegate.swift`
- `Substi/App/Coordinators/AppCoordinator.swift`
- `Substi/Data/Fixtures/InventoryFixtures.swift`
- `Substi/Data/Networking/Endpoint.swift`
- `Substi/Data/Networking/OpenFoodFactsProductResponseDTO.swift`
- `Substi/Data/Mappers/OpenFoodFactsProductMapper.swift`
- `Substi/Data/Repositories/DemoInventoryRepository.swift`
- `Substi/Domain/Repositories/InventoryRepository.swift`
- `Substi/Presentation/Suggestions/SuggestionsViewController.swift`
- `Substi/Presentation/Suggestions/SuggestionsViewModel.swift`
- `SubstiTests/`
- `docs/project/screens/order-and-suggestions.md`
- `docs/project/phases/PHASE-13-swiftui-integration.md`
- `docs/project/BACKLOG.md`
- `docs/project/CURRENT.md`
- `docs/project/ROADMAP.md`

### Critérios para conclusão
- [x] Critérios de aceite atendidos e verificações locais documentadas.
- [x] Build e testes relevantes passam sem depender da API ao vivo.
- [x] Dados e limitações da API foram explicados e revisados por Gabriel.
- [x] A task passou por REVIEW antes da aprovação de Gabriel.

### Notas para entrevista
Explicar por que catálogo e estoque são fontes diferentes, a sequência de transformação dos dados e as escolhas de concorrência, resiliência e testabilidade.
