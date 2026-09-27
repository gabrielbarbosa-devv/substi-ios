# PHASE 11 — Design Discovery & System

## Objective
Discover uma identidade visual própria antes de implementar foundations e componentes. Entregar uma camada pequena compartilhada por UIKit e SwiftUI, proporcional às telas do Substi.

## Expected Outcome
Screen contracts low-fi, princípios e foundations aprovados, revisão de acessibilidade e somente os tokens/componentes efetivamente usados. A referência ao iFood é conceitual; não copiar seu Design System proprietário.

## Dependencies
Discovery usa as decisões pertinentes de produto e pode ocorrer em paralelo com domain/networking. Implementação depende dos artifacts aprovados, não da conclusão cronológica de todo o Master Plan.

## Priority
P0: HIG focado, princípios, foundations, low-fi, inventário, acessibilidade e componentes usados. P1: pesquisa iFood/grocery, direção high-fi e snapshots. Hard deadline: 2026-09-28 11:00 America/Sao_Paulo (BRT).

## Status
TODO

## Design Discovery — before Swift UI

Order: product problem → UX requirements → design principles → design foundations → components → screens → Swift implementation. Figma é auxiliar e time-boxed.

## SUB-P11-012 — Research iFood Design System Principles

Status: TODO

Priority: P1

Depends on:
- None

### Context
Entender em notas breves a separação entre Design Language, Design Tokens, Components e Platforms em um sistema de grande escala. Pesquisa conceitual, não requisito de entrega.

### Objective
Research iFood Design System Principles, concluída e revisada dentro do escopo da entrega.

### Requirements
- Notas curtas descrevem essas camadas e o que é proporcional ao Substi; não reproduzem nomes, assets, tokens ou componentes proprietários do iFood.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Acceptance Criteria
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
Design system architecture, tokens, platform components.

### Study Before Implementation
Limitar a pesquisa a 20 minutos e usar referências públicas.

### Questions I Must Be Able to Answer
- Como a separação ajuda várias plataformas? O que é proporcional? O que não devemos copiar?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
P1: não bloquear implementação; notas breves e fontes.

### Observability
Not applicable for this task.

### Memory Considerations
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Concurrency Considerations
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Accessibility
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela task.

### Definition of Done
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-013 — Review Apple HIG for Substi

Status: TODO

Priority: P0

Depends on:
- None

### Context
Usar padrões nativos de iOS adequados ao fluxo sem clonar outra aplicação.

### Objective
Review Apple HIG for Substi, concluída e revisada dentro do escopo da entrega.

### Requirements
- Notas cobrem navigation, buttons, lists/cards, typography, color, accessibility, feedback, loading e error states; transformar orientação aplicável em critérios para telas.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Acceptance Criteria
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
Apple HIG, navegação, componentes nativos, acessibilidade.

### Study Before Implementation
Estudar apenas os tópicos indicados.

### Questions I Must Be Able to Answer
- Quais padrões nativos resolvem o caso? Onde customizar? Como validar accessibility?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
Revisar fontes oficiais e screen criteria; sem código.

### Observability
Not applicable for this task.

### Memory Considerations
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Concurrency Considerations
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Accessibility
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela task.

### Definition of Done
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-014 — Research Grocery UX References

Status: TODO

Priority: P1

Depends on:
- None

### Context
Observar padrões grocery, substituição, delivery, cards e comparação.

### Objective
Research Grocery UX References, concluída e revisada dentro do escopo da entrega.

### Requirements
- No máximo três referências; pesquisa limitada a 20 minutos; registrar padrões e separar observação de suposição.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Acceptance Criteria
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
Grocery/e-commerce UX, comparação, substituição.

### Study Before Implementation
Timebox de 20 minutos; não fazer auditoria ampla.

### Questions I Must Be Able to Answer
- Quais padrões reduzem esforço e aumentam confiança?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
P1: parar após 20 minutos; pode ser pulada.

### Observability
Not applicable for this task.

### Memory Considerations
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Concurrency Considerations
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Accessibility
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela task.

### Definition of Done
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-015 — Define Substi Design Principles

Status: TODO

Priority: P0

Depends on:
SUB-P00-001
- SUB-P11-013

### Context
Traduzir o problema em critérios para uma identidade visual própria.

### Objective
Define Substi Design Principles, concluída e revisada dentro do escopo da entrega.

### Requirements
- Registrar CLEAR, COMPARABLE, CONSISTENT e ACCESSIBLE com consequência observável nas telas; declarar que a identidade é própria e não copia iFood.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Acceptance Criteria
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
Design language, princípios e hierarquia.

### Study Before Implementation
Revisar contra problema e hipótese antes de implementação.

### Questions I Must Be Able to Answer
- Como cada princípio reduz esforço ou melhora comparação? Como verificar consistência UIKit/SwiftUI?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
Revisão de princípios contra problema/fluxo.

### Observability
Not applicable for this task.

### Memory Considerations
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Concurrency Considerations
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Accessibility
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela task.

### Definition of Done
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-016 — Define Design Foundations

Status: TODO

Priority: P0

Depends on:
SUB-P11-015

### Context
Especificar foundations antes da implementação.

### Objective
Define Design Foundations, concluída e revisada dentro do escopo da entrega.

### Requirements
- Registrar semantic colors: brandPrimary; backgroundPrimary/backgroundSecondary; surfacePrimary/surfaceSecondary; textPrimary/textSecondary/textInverse; borderDefault; statusSuccess/statusWarning/statusError; interactivePrimary/interactiveDisabled. Registrar System Font + Dynamic Type styles: largeTitle, title, headline, body, bodyEmphasized, caption, button e price. Registrar spacing 4/8/12/16/24/32 e radius small/medium/large sem valores concretos; SF Symbols como padrão; semantic naming e light/dark. Não definir hex codes.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Acceptance Criteria
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
Tokens semânticos, Dynamic Type, spacing/radius, SF Symbols.

### Study Before Implementation
Distinguir decisão semântica de valor concreto.

### Questions I Must Be Able to Answer
- Por que nomes semânticos? Quando asset próprio em vez de SF Symbols?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
Revisar consistência, contraste e cobertura clara/escura; sem código.

### Observability
Not applicable for this task.

### Memory Considerations
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Concurrency Considerations
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Accessibility
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela task.

### Definition of Done
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-017 — Create Low-Fidelity Screen Structure

Status: TODO

Priority: P0

Depends on:
SUB-P00-009
- SUB-P11-016

### Context
Definir quatro telas sem polish antes de criar views.

### Objective
Create Low-Fidelity Screen Structure, concluída e revisada dentro do escopo da entrega.

### Requirements
- Order, Suggestions, Comparison e Confirmation; cada screen contract inclui Purpose, User Goal, Information Hierarchy, Components, States, Actions, Accessibility e Analytics; avaliar loading/content/empty/error/disabled; sem high fidelity.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Acceptance Criteria
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
Fluxo, wireframes low-fi, screen contracts e estados.

### Study Before Implementation
Percorrer fluxo e explicar hierarquia de informação.

### Questions I Must Be Able to Answer
- Qual objetivo, informação prioritária, estados, ações e comportamento accessibility?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
Revisar walkthrough e consistência com MVP; sem Swift ou implementação.

### Observability
Not applicable for this task.

### Memory Considerations
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Concurrency Considerations
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Accessibility
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela task.

### Definition of Done
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-018 — Define Component Inventory

Status: TODO

Priority: P0

Depends on:
SUB-P11-017

### Context
Derivar inventário mínimo das telas sem antecipar uma biblioteca.

### Objective
Define Component Inventory, concluída e revisada dentro do escopo da entrega.

### Requirements
- Mapear componentes usados/repetidos em UIKit e SwiftUI; comparar com controles nativos; DSProductCard recebe image, product name, brand, quantity, optional metadata, compatibility/status e selection state como presentation data, sem calcular ranking, fazer networking ou conhecer Repository; documentar itens dispensáveis. Registrar estrutura proporcional: Foundations (Color, Typography, Spacing, Radius); UIKit (DSButton, DSProductCardView, DSStatusBadgeView, DSLoadingView, DSErrorView); SwiftUI (DSButtonStyle, DSProductCard, DSStatusBadge). Itens sem uso real ficam de fora e nenhuma implementação é feita nesta task.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Acceptance Criteria
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
Component boundaries, composição, apresentação versus domínio.

### Study Before Implementation
Justificar cada componente pelo uso.

### Questions I Must Be Able to Answer
- Pode controle nativo resolver? Existe regra de negócio indevida?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
Revisar inventário contra screen contracts e dependency direction.

### Observability
Not applicable for this task.

### Memory Considerations
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Concurrency Considerations
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Accessibility
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela task.

### Definition of Done
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-019 — Create High-Fidelity Direction

Status: TODO

Priority: P1

Depends on:
- SUB-P11-016
- SUB-P11-018

### Context
Definir direção visual mínima, sem biblioteca extensa de Figma.

### Objective
Create High-Fidelity Direction, concluída e revisada dentro do escopo da entrega.

### Requirements
- Direção leve comunica hierarquia, spacing, typography, semantic colors, components e states nas telas; identidade própria.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Acceptance Criteria
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
Visual hierarchy, foundations, component states.

### Study Before Implementation
Timebox para quick direction; não bloquear por Figma polido.

### Questions I Must Be Able to Answer
- O que chama atenção primeiro? As plataformas parecem uma app?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
Walkthrough; P1 pode ser notas se o tempo apertar.

### Observability
Not applicable for this task.

### Memory Considerations
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Concurrency Considerations
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Accessibility
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela task.

### Definition of Done
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-020 — Validate Accessibility in Design

Status: TODO

Priority: P0

Depends on:
SUB-P11-016
- SUB-P11-017

### Context
Detectar problemas antes de implementar views.

### Objective
Validate Accessibility in Design, concluída e revisada dentro do escopo da entrega.

### Requirements
- Revisar contraste, tamanho/hierarquia, touch targets, leitura lógica, labels/semantics e Dynamic Type; registrar ajustes nos screen contracts.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Acceptance Criteria
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
Accessibility-first design, contraste, alvos e leitura.

### Study Before Implementation
Revisar exemplos ampliados e fluxo VoiceOver conceitual.

### Questions I Must Be Able to Answer
- O que será anunciado? Texto ampliado quebra hierarquia? Cor é o único sinal?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
Checklist por tela; sem implementação.

### Observability
Not applicable for this task.

### Memory Considerations
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Concurrency Considerations
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Accessibility
Critério central; revisar Dynamic Type, contraste, touch targets e leitura lógica.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela task.

### Definition of Done
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## Design Implementation

Implementar foundations e componentes somente após o discovery. Preferir controles iOS nativos quando adequados. Não criar a biblioteca inteira só para completar uma lista.

## SUB-P11-021 — Implement Design Tokens

Status: TODO

Priority: P0

Depends on:
SUB-P11-016
- SUB-P11-020

### Context
Implementar foundations aprovadas para UIKit e SwiftUI.

### Objective
Implement Design Tokens, concluída e revisada dentro do escopo da entrega.

### Requirements
- Semantic colors, typography, spacing, radius partilhados conceitualmente; semantic assets onde aplicável; System Font, Dynamic Type, SF Symbols; sem hex arbitrário nem valores espalhados.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Acceptance Criteria
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
Token API, assets, UIKit/SwiftUI, Dynamic Type.

### Study Before Implementation
Implementar foundations mínimas e justificar ownership.

### Questions I Must Be Able to Answer
- Como compartilhar linguagem sem acoplar implementações?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
Build e inspeção light/dark e Dynamic Type.

### Observability
Not applicable for this task.

### Memory Considerations
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Concurrency Considerations
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Accessibility
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela task.

### Definition of Done
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-022 — Implement Required UIKit Components

Status: TODO

Priority: P0

Depends on:
SUB-P11-018
- SUB-P11-021

### Context
Entregar somente os componentes UIKit necessários às telas; tarefas específicas existentes detalham o trabalho.

### Objective
Implement Required UIKit Components, concluída e revisada dentro do escopo da entrega.

### Requirements
- Apenas componentes aprovados no inventário; integrar DSButton, DSProductCardView e estados quando usados; apresentação sem regra de negócio; não criar variantes não usadas.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Acceptance Criteria
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
UIKit composition, tokens, presentation data, boundary.

### Study Before Implementation
Usar tasks 005,006,008 como implementação granular.

### Questions I Must Be Able to Answer
- Que repetição justifica componente? Quem possui regras e dados?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
Build, estados usados, Dynamic Type e accessibility.

### Observability
Not applicable for this task.

### Memory Considerations
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Concurrency Considerations
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Accessibility
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela task.

### Definition of Done
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-023 — Implement Required SwiftUI Components

Status: TODO

Priority: P0

Depends on:
SUB-P11-018
- SUB-P11-021

### Context
Aplicar os mesmos princípios e tokens na comparação SwiftUI sem equivalentes desnecessários.

### Objective
Implement Required SwiftUI Components, concluída e revisada dentro do escopo da entrega.

### Requirements
- Apenas styles/components usados; consumir foundations; não controlar UINavigationController; preferir controles nativos.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Acceptance Criteria
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
SwiftUI composition, styles, tokens, UIKit interoperability.

### Study Before Implementation
DSButtonStyle/DSStatusBadge só se os screen contracts mostrarem necessidade.

### Questions I Must Be Able to Answer
- Por que compartilhar tokens? Quem controla navegação?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
Build/preview e estado/semântica; omitir componentes sem uso e justificar.

### Observability
Not applicable for this task.

### Memory Considerations
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Concurrency Considerations
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Accessibility
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela task.

### Definition of Done
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-024 — Snapshot Critical Components

Status: TODO

Priority: P1

Depends on:
- SUB-P11-022
- SUB-P11-023

### Context
Proteger estados visuais críticos depois de estabilizados.

### Objective
Snapshot Critical Components, concluída e revisada dentro do escopo da entrega.

### Requirements
- Selecionar ProductCard, ErrorState e Comparison se implementados; fixtures determinísticas; não cobrir biblioteca inteira.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Acceptance Criteria
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
Snapshot tests, fixtures, manutenção de baselines.

### Study Before Implementation
Usar ferramenta aprovada/disponível e justificar manutenção.

### Questions I Must Be Able to Answer
- Que regressão visual útil detecta? Quando atualizar baseline?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
Snapshots determinísticos; reduzir escopo se custo ameaçar entrega.

### Observability
Not applicable for this task.

### Memory Considerations
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Concurrency Considerations
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Accessibility
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela task.

### Definition of Done
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## Existing Stable IDs

Os IDs anteriores permanecem imutáveis. Duplicatas de planning foram preservadas como BLOCKED e referenciam a nova tarefa; tasks de componente ainda úteis permanecem com o escopo mínimo.

## SUB-P11-001 — Define principles (superseded)

Status: BLOCKED

Priority: P1

Depends on:
- None

### Context
Entrada histórica substituída por SUB-P11-015 para não duplicar Design Discovery.

### Objective
Define principles (superseded), concluída e revisada dentro do escopo da entrega.

### Requirements
- Permanece BLOCKED; executar P11-015. Não reutilizar ID.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Não executar trabalho duplicado.

### Acceptance Criteria
- [ ] A substituta está identificada e este registro permanece BLOCKED.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
Design language.

### Study Before Implementation
Ler substituta.

### Questions I Must Be Able to Answer
- Por que ID foi preservado?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
Não aplicável for this task.

### Observability
Not applicable for this task.

### Memory Considerations
Not applicable for this task.

### Concurrency Considerations
Not applicable for this task.

### Accessibility
Not applicable for this task.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Nenhum arquivo novo; manter o registro histórico e apontar para a substituta.

### Definition of Done
- [ ] Manter status BLOCKED e usar a substituta indicada.
- [ ] Não reutilizar o ID.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-002 — Define color tokens (superseded)

Status: BLOCKED

Priority: P1

Depends on:
- None

### Context
Definição consolidada em SUB-P11-016.

### Objective
Define color tokens (superseded), concluída e revisada dentro do escopo da entrega.

### Requirements
- Permanece BLOCKED; implementação em P11-021.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Não executar trabalho duplicado.

### Acceptance Criteria
- [ ] A substituta está identificada e este registro permanece BLOCKED.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
Semantic colors.

### Study Before Implementation
Ler substituta.

### Questions I Must Be Able to Answer
- Qual a diferença entre especificar e implementar tokens?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
Não aplicável for this task.

### Observability
Not applicable for this task.

### Memory Considerations
Not applicable for this task.

### Concurrency Considerations
Not applicable for this task.

### Accessibility
Not applicable for this task.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Nenhum arquivo novo; manter o registro histórico e apontar para a substituta.

### Definition of Done
- [ ] Manter status BLOCKED e usar a substituta indicada.
- [ ] Não reutilizar o ID.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-003 — Define typography and Dynamic Type (superseded)

Status: BLOCKED

Priority: P1

Depends on:
- None

### Context
Definição consolidada em SUB-P11-016.

### Objective
Define typography and Dynamic Type (superseded), concluída e revisada dentro do escopo da entrega.

### Requirements
- Permanece BLOCKED; preservar ID.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Não executar trabalho duplicado.

### Acceptance Criteria
- [ ] A substituta está identificada e este registro permanece BLOCKED.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
Typography, Dynamic Type.

### Study Before Implementation
Ler substituta.

### Questions I Must Be Able to Answer
- Qual a diferença entre especificar e implementar foundations?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
Não aplicável for this task.

### Observability
Not applicable for this task.

### Memory Considerations
Not applicable for this task.

### Concurrency Considerations
Not applicable for this task.

### Accessibility
Not applicable for this task.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Nenhum arquivo novo; manter o registro histórico e apontar para a substituta.

### Definition of Done
- [ ] Manter status BLOCKED e usar a substituta indicada.
- [ ] Não reutilizar o ID.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-004 — Define spacing/radius (superseded)

Status: BLOCKED

Priority: P1

Depends on:
- None

### Context
Definição consolidada em SUB-P11-016.

### Objective
Define spacing/radius (superseded), concluída e revisada dentro do escopo da entrega.

### Requirements
- Permanece BLOCKED; preservar ID.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Não executar trabalho duplicado.

### Acceptance Criteria
- [ ] A substituta está identificada e este registro permanece BLOCKED.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
Spacing, radius.

### Study Before Implementation
Ler substituta.

### Questions I Must Be Able to Answer
- Quando escolher valores concretos?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
Não aplicável for this task.

### Observability
Not applicable for this task.

### Memory Considerations
Not applicable for this task.

### Concurrency Considerations
Not applicable for this task.

### Accessibility
Not applicable for this task.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Nenhum arquivo novo; manter o registro histórico e apontar para a substituta.

### Definition of Done
- [ ] Manter status BLOCKED e usar a substituta indicada.
- [ ] Não reutilizar o ID.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-005 — Implement DSButton

Status: TODO

Priority: P0

Depends on:
SUB-P11-021

### Context
Implementar variante UIKit necessária se controle nativo não resolver.

### Objective
Implement DSButton, concluída e revisada dentro do escopo da entrega.

### Requirements
- Considerar primary/secondary/destructive e normal/highlighted/disabled/loading, mas implementar somente variants/states usados; foundations compartilhadas; sem lógica de negócio.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Acceptance Criteria
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
UIKit, tokens, action state.

### Study Before Implementation
Revisar UIButton e necessidade real de wrapper.

### Questions I Must Be Able to Answer
- Que estado é usado? Por que customizar?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
Build e inspecionar states/accessibility.

### Observability
Not applicable for this task.

### Memory Considerations
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Concurrency Considerations
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Accessibility
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Somente arquivos de token/component aprovados; nenhum arquivo é criado nesta atualização do planejamento.

### Definition of Done
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-006 — Implement DSProductCard

Status: TODO

Priority: P0

Depends on:
SUB-P11-021
- SUB-P11-018

### Context
Apresentar produtos consistentemente onde inventário justificar reuse.

### Objective
Implement DSProductCard, concluída e revisada dentro do escopo da entrega.

### Requirements
- Nome, marca, quantidade, metadata, compatibilidade/status e seleção conforme necessidade; recebe presentation data, não calcula ranking nem conhece rede/repository.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Acceptance Criteria
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
Presentation data, UI composition, boundary.

### Study Before Implementation
Revisar hierarquia e labels.

### Questions I Must Be Able to Answer
- Como evitar regras de negócio no componente?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
Validar dados, estados e Dynamic Type.

### Observability
Not applicable for this task.

### Memory Considerations
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Concurrency Considerations
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Accessibility
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Somente arquivos de token/component aprovados; nenhum arquivo é criado nesta atualização do planejamento.

### Definition of Done
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-007 — Implement DSStatusBadge (only if used)

Status: TODO

Priority: P1

Depends on:
- SUB-P11-018
- SUB-P11-021

### Context
Criar badge apenas se status não ficar claro com texto/controle nativo.

### Objective
Implement DSStatusBadge (only if used), concluída e revisada dentro do escopo da entrega.

### Requirements
- Se inventário não justificar, documentar não implementação.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Acceptance Criteria
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
Status semântico, accessibility.

### Study Before Implementation
Considerar texto e SF Symbols; não depender só de cor.

### Questions I Must Be Able to Answer
- O que comunica? Como VoiceOver anuncia?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
Inspecionar se implementado.

### Observability
Not applicable for this task.

### Memory Considerations
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Concurrency Considerations
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Accessibility
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Somente arquivos de token/component aprovados; nenhum arquivo é criado nesta atualização do planejamento.

### Definition of Done
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-008 — Implement loading/error/empty states

Status: TODO

Priority: P0

Depends on:
SUB-P11-021
- SUB-P11-017

### Context
Comunicar progresso, falha e ausência de candidatos.

### Objective
Implement loading/error/empty states, concluída e revisada dentro do escopo da entrega.

### Requirements
- Estados relevantes; erro recuperável; controles e feedback nativos quando adequados.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Acceptance Criteria
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
UI states, feedback.

### Study Before Implementation
Definir mensagem e ação antes de view.

### Questions I Must Be Able to Answer
- O que pode usuário fazer em cada estado?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
Validar estados determinísticos e accessibility.

### Observability
Not applicable for this task.

### Memory Considerations
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Concurrency Considerations
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Accessibility
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Somente arquivos de token/component aprovados; nenhum arquivo é criado nesta atualização do planejamento.

### Definition of Done
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-009 — Validate Dark Mode

Status: TODO

Priority: P1

Depends on:
- SUB-P11-021

### Context
Verificar direção visual em aparência clara e escura.

### Objective
Validate Dark Mode, concluída e revisada dentro do escopo da entrega.

### Requirements
- Usar semantic colors; registrar problemas; reduzir escopo se deadline apertar.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Acceptance Criteria
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
Semantic colors, contrast.

### Study Before Implementation
Revisar cores semânticas nativas.

### Questions I Must Be Able to Answer
- O contraste continua adequado?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
Inspeção manual dos fluxos.

### Observability
Not applicable for this task.

### Memory Considerations
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Concurrency Considerations
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Accessibility
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Somente arquivos de token/component aprovados; nenhum arquivo é criado nesta atualização do planejamento.

### Definition of Done
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-010 — Define UIKit/SwiftUI token interoperability

Status: TODO

Priority: P0

Depends on:
SUB-P11-021

### Context
Validar que ambas as APIs expressam uma linguagem coerente.

### Objective
Define UIKit/SwiftUI token interoperability, concluída e revisada dentro do escopo da entrega.

### Requirements
- Nenhuma plataforma depende da implementação visual da outra; tokens não conhecem feature.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Acceptance Criteria
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
Design boundary, API surface.

### Study Before Implementation
Evitar abstração excessiva.

### Questions I Must Be Able to Answer
- Como compartilhar intenção sem compartilhar tipos de UI?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
Build/preview e dependency review.

### Observability
Not applicable for this task.

### Memory Considerations
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Concurrency Considerations
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Accessibility
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Somente arquivos de token/component aprovados; nenhum arquivo é criado nesta atualização do planejamento.

### Definition of Done
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-011 — Add selected snapshots (superseded)

Status: BLOCKED

Priority: P1

Depends on:
- None

### Context
Cobertura selecionada consolidada em SUB-P11-024.

### Objective
Add selected snapshots (superseded), concluída e revisada dentro do escopo da entrega.

### Requirements
- BLOCKED para evitar duplicação; usar P11-024.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Não executar trabalho duplicado.

### Acceptance Criteria
- [ ] A substituta está identificada e este registro permanece BLOCKED.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Engineering Concepts
Snapshots.

### Study Before Implementation
Ler substituta.

### Questions I Must Be Able to Answer
- Qual cobertura justifica manutenção?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Testing
Não aplicável for this task.

### Observability
Not applicable for this task.

### Memory Considerations
Not applicable for this task.

### Concurrency Considerations
Not applicable for this task.

### Accessibility
Not applicable for this task.

### AI Assistance
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Expected Files
Nenhum arquivo novo; manter o registro histórico e apontar para a substituta.

### Definition of Done
- [ ] Manter status BLOCKED e usar a substituta indicada.
- [ ] Não reutilizar o ID.

### Interview Notes
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.
