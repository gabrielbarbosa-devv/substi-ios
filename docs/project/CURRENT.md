# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Trilha de entrega

Estamos construindo o fluxo vertical de substituição. O laboratório GCD é P2 e não bloqueia a interface.

## Fase atual

FASE 13 — Integração com SwiftUI

## Tarefa atual

SUB-P13-007 — Validar fluxo de retorno

## Status

REVIEW — teste de integração passou no iPhone 16 Pro Simulator; aguarda Gabriel revisar e explicar antes de DONE.

## Objetivo

Confirmar que “Ver outras opções” retorna à mesma instância de Sugestões e não confirma nem altera o pedido.

## Modelo visual

```text
Pedido → Sugestões (UIKit)
               ↓ seleção
        AppCoordinator
               ↓ push
 UIHostingController<ProductComparisonView>
               ↓
       Comparação (SwiftUI)
```

## Por que agora

A tela de comparação já está integrada à navegação UIKit. O retorno deve preservar a lista de alternativas e manter a confirmação como ação explícita separada.

## Revisões pendentes

- SUB-P11-015, SUB-P11-016, SUB-P11-021 — princípios, foundations e tokens
- SUB-P11-005–007 — DSButton, DSProductCardView e DSStatusBadgeView
- SUB-P11-025 — banners UIKit de pedido e informação
- SUB-P12-002–005 — tela Pedido, dados e primeira tela de sugestões
- SUB-P12-010–011 — Coordinator e estados aplicáveis
- SUB-P09-001–009 — laboratório GCD, aguardando revisão de aprendizado

## Bloqueios e limites

- A validação anterior de UIKit/SwiftUI registrou 29 testes passando (26 unitários e 3 de UI/launch), sem falhas, no iPhone 16 Pro Simulator (iOS 18.6, x86_64). Os testes de UI existentes cobrem launch, não ações/navegação.
- O teste de retorno valida a closure da ação e a pilha UIKit, mas não automatiza o toque físico nem a inspeção visual da tela.
- O target padrão usa arquitetura x86_64 porque o ambiente é Mac Intel; validar em dispositivo físico não faz parte desta task.
- Os barcodes `7898215151708` (Piracanjuba), `7898080640611` (Italac) e `7896051111016` (Itambé) responderam ao endpoint v3 com nome, marca, categoria e quantidade em 27/09/2026. O conteúdo pode mudar ou ficar indisponível.
- Preços e imagens individuais dos candidatos não estão nos dados locais; a confirmação não os inventa.
- A troca é mantida somente em memória durante a sessão e volta à fixture original após encerrar o processo. Não altera serviço externo nem representa estoque real.
- A referência visual usa preço, imagem e percentual ilustrativos que não existem na fixture; esses dados não foram simulados.
- Na SUB-P13-010, a tela Comparação foi observada com um candidato real (Italac). A tela de falha de rede não foi forçada manualmente no Simulator; a falha e os resultados parciais são cobertos por testes determinísticos do ViewModel.
- Xcode reportou somente que a extração de metadados de App Intents foi ignorada porque o app não usa `AppIntents`; não é warning do código Swift alterado.
- SUB-P08-001 e SUB-P09-001–009 continuam em REVIEW até Gabriel revisar e explicar o aprendizado.

## Tasks em revisão

- SUB-P07-010 — Atualizar pedido demonstrativo após confirmação
- SUB-P13-001 — Definir modelo de apresentação da comparação
- SUB-P13-002 — Criar ProductComparisonView
- SUB-P13-004 — Apresentar com UIHostingController
- SUB-P13-005 — Manter navegação no Coordinator
- SUB-P13-009 — Criar confirmação da substituição

## Próxima task

SUB-P13-008 — Documentar migração incremental (P1), após a revisão de SUB-P13-007. SUB-P13-006 também permanece em REVIEW aguardando a revisão de aprendizado de Gabriel.

## Último marco

SUB-P13-010 foi aprovada por Gabriel; PR #27 está na `main`. SUB-P13-006 validou a comparação SwiftUI hospedada pela navegação UIKit; build e 29 testes passaram e a task continua em REVIEW na branch `feature/sub-p13-006-validate-uikit-swiftui`. SUB-P13-007 validou retorno à mesma instância de Sugestões com teste determinístico aprovado; está em REVIEW na branch `feature/sub-p13-007-validate-return-flow`. O workspace mantém uma alteração local em `Substi.xcodeproj/project.pbxproj` (Development Team) fora desta mudança.
