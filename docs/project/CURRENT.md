# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Trilha de entrega

Estamos priorizando uma jornada que possa ser aberta e percorrida. O trabalho de GCD permanece laboratório P2 isolado; não é pré-requisito para o app.

## Fase atual

FASE 12 — UIKit

## Tarefa atual

SUB-P12-002 — Criar tela de pedido com View Code

## Tasks em revisão

- SUB-P11-015, SUB-P11-016, SUB-P11-021 — princípios, foundations e tokens
- SUB-P11-005–007 — DSButton, DSProductCardView e DSStatusBadgeView
- SUB-P12-002–005 — pedido, estado do pedido, sugestões e estado vazio
- SUB-P12-010–011 — navegação pelo Coordinator e estados aplicáveis
- SUB-P09-001–009 — laboratório GCD, aguardando revisão de aprendizado

## Estado

REVIEW — a implementação da primeira fatia UIKit está pronta para revisão; as tasks listadas acima não foram marcadas DONE.

## Objetivo

Salvar o Design System fornecido e deixar o app abrir em uma tela de pedido com item indisponível. O botão abre sugestões locais usando UIKit, Auto Layout, tokens semânticos, cards reutilizados e navegação coordenada.

## Por que agora

O app já tinha domínio, ranking, rede, repositories e testes, mas a tela inicial ainda era vazia. A primeira fatia liga os dados de demonstração a uma experiência visível sem adicionar rede ou regra de negócio à View.

## O que a implementação mostra

```text
SceneDelegate → AppCoordinator → UINavigationController
                                  ├── Pedido → itens indisponíveis
                                  └── Sugestões → candidatos locais

Feature → Design System → UIKit tokens e componentes
```

O cartão usa nome, marca e quantidade disponíveis no modelo. O ranking atual só sustenta uma indicação de categoria; não exibimos preço ou percentual de compatibilidade. As fixtures são dados locais de demonstração, não representam estoque real.

## Bloqueios e limites

- As telas de comparação SwiftUI e confirmação ainda não foram implementadas.
- Seleção e gravação de uma decisão de substituição ainda não existem.
- Os dados atuais não fornecem preço nem fotografia do produto; a UI usa SF Symbol como placeholder.
- SUB-P08-001 e SUB-P09-001–009 continuam em REVIEW até Gabriel revisar e explicar o aprendizado.

## Próxima task

SUB-P13-001 — Definir modelo de apresentação da comparação. Depois, criar `ProductComparisonView` e integrar pelo Coordinator.

## Último marco

`xcodebuild` com Xcode 16.4 compilou o target `Substi` para iPhone 16 Pro Simulator (iOS 18.6), deployment target iOS 16. O executável do simulador ainda não foi inspecionado visualmente nesta etapa.
