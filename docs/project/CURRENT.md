# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Trilha de entrega

Estamos construindo o fluxo vertical de substituição. O laboratório GCD é P2 e não bloqueia a interface.

## Fase atual

FASE 13 — Integração com SwiftUI

## Tarefa atual

SUB-P13-010 — Carregar sugestões reais da Open Food Facts

## Status

REVIEW — código, build e testes prontos; aguarda Gabriel revisar e explicar antes de qualquer task seguinte. Não marcar DONE automaticamente.

## Objetivo

Buscar por barcode até três produtos reais na Open Food Facts ao abrir Sugestões, exibir estados recuperáveis e manter seleção/comparação/confirmação existentes.

## Modelo visual

```text
Pedido e indisponibilidade local
           ↓
AppCoordinator → SuggestionsViewModel
                       ↓
                  LoadProductUseCase
                       ↓
ProductRepository → URLSession → Open Food Facts
                       ↓
                DTO → Mapper → Product
                       ↓
         loading / opções / vazio / erro + retry
                       ↓
            Comparação SwiftUI → Confirmação
```

## Por que agora

A tela de comparação e confirmação já existe, mas as sugestões eram somente dados artificiais. Esta tarefa conecta ao app a infraestrutura de rede construída nas fases 06–08. Catálogo real não representa disponibilidade nem preço de uma loja.

## Revisões pendentes

- SUB-P11-015, SUB-P11-016, SUB-P11-021 — princípios, foundations e tokens
- SUB-P11-005–007 — DSButton, DSProductCardView e DSStatusBadgeView
- SUB-P11-025 — banners UIKit de pedido e informação
- SUB-P12-002–005 — tela Pedido, dados e primeira tela de sugestões
- SUB-P12-010–011 — Coordinator e estados aplicáveis
- SUB-P09-001–009 — laboratório GCD, aguardando revisão de aprendizado

## Bloqueios e limites

- Os barcodes `7898215151708` (Piracanjuba), `7898080640611` (Italac) e `7896051111016` (Itambé) responderam ao endpoint v3 com nome, marca, categoria e quantidade em 27/09/2026. O conteúdo pode mudar ou ficar indisponível.
- Preços e imagens individuais dos candidatos não estão nos dados locais; a confirmação não os inventa.
- A troca é mantida somente em memória durante a sessão e volta à fixture original após encerrar o processo. Não altera serviço externo nem representa estoque real.
- A referência visual usa preço, imagem e percentual ilustrativos que não existem na fixture; esses dados não foram simulados.
- Build para iOS Simulator passou no Xcode 16.4; 26 testes unitários passaram no iPhone 16 Pro Simulator (iOS 18.6). A tela Comparação foi observada com um candidato real (Italac); revisão de Gabriel permanece pendente. A tela de falha de rede não foi forçada manualmente no Simulator; a falha é coberta por testes determinísticos do ViewModel.
- Xcode reportou somente que a extração de metadados de App Intents foi ignorada porque o app não usa `AppIntents`; não é warning do código Swift alterado.
- SUB-P08-001 e SUB-P09-001–009 continuam em REVIEW até Gabriel revisar e explicar o aprendizado.

## Tasks em revisão

- SUB-P07-010 — Atualizar pedido demonstrativo após confirmação
- SUB-P13-001 — Definir modelo de apresentação da comparação
- SUB-P13-002 — Criar ProductComparisonView
- SUB-P13-004 — Apresentar com UIHostingController
- SUB-P13-005 — Manter navegação no Coordinator
- SUB-P13-009 — Criar confirmação da substituição
- SUB-P13-010 — Carregar sugestões reais da Open Food Facts

## Próxima task

Após a revisão de SUB-P13-010, retomar SUB-P13-006 — Validar UIKit para SwiftUI. Nenhuma outra task está IN_PROGRESS.

## Último marco

SUB-P07-010 e SUB-P13-009 foram implementadas na branch `feature/sub-p07-010-confirm-substitution`. SUB-P13-010 foi implementada na branch `feature/sub-p13-010-live-product-suggestions` e movida para REVIEW. Build e 26 testes unitários passaram; candidatos reais foram consultados no endpoint v3. O workspace já continha uma alteração local em `Substi.xcodeproj/project.pbxproj`; ela pertence à configuração do desenvolvedor e não faz parte desta mudança.
