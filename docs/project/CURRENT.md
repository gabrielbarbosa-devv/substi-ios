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
- SUB-P11-025 — banners UIKit de pedido e informação
- SUB-P12-003–005 — estado do pedido, sugestões e estado vazio
- SUB-P12-010–011 — navegação pelo Coordinator e estados aplicáveis
- SUB-P09-001–009 — laboratório GCD, aguardando revisão de aprendizado

## Estado

REVIEW — a tela Pedido e os banners definidos para ela estão prontos para Gabriel revisar. Nenhuma task foi marcada DONE.

## Objetivo

Apresentar o estado “Em preparação”, os três itens do pedido, preços demonstrativos, o item indisponível com destaque suave, a necessidade de substituição e o CTA, conforme a referência visual de Gabriel.

## Por que agora

A primeira tela deve explicar o que aconteceu e o que a pessoa pode fazer, sem confundir catálogo público com preço ou estoque de loja. Preços e disponibilidade são dados da linha do pedido demonstrativo.

## O que a implementação mostra

```text
SceneDelegate → AppCoordinator → UINavigationController
                                  ├── Pedido → status + 3 produtos + CTA
                                  └── Sugestões → candidatos locais

Feature → Design System → UIKit tokens e componentes
```

O `OrderItem` mantém o preço da linha; o `OrderViewModel` o formata para pt-BR; o card só apresenta os dados. As fixtures não representam estoque ou preços de uma loja real.

## Bloqueios e limites

- As telas de comparação SwiftUI e confirmação ainda não foram implementadas.
- Seleção e gravação de uma decisão de substituição ainda não existem.
- Ainda não há fotografias individuais dos produtos; o card usa SF Symbol decorativo até adicionarmos assets adequados.
- O fluxo de confirmação ainda não existe; o estado visual `substituído` não é aplicado nesta task.
- SUB-P08-001 e SUB-P09-001–009 continuam em REVIEW até Gabriel revisar e explicar o aprendizado.

## Próxima task

Após Gabriel revisar esta tela, continuar a jornada de Sugestões → Comparação SwiftUI → Confirmação, pelas tasks correspondentes. Não avançar antes da revisão do SUB-P12-002.

## Último marco

`xcodebuild` com Xcode 16.4 compilou a Tela Pedido para iOS Simulator (iOS 18.5 SDK; deployment target iOS 16). A inspeção visual do app no Simulator continua pendente: o dispositivo iniciou, mas `simctl install` não terminou nesta sessão.
