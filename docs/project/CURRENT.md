# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Trilha de entrega

Estamos construindo o fluxo vertical de substituição. O laboratório GCD é P2 e não bloqueia a interface.

## Fase atual

FASE 12 — UIKit

## Tarefa atual

SUB-P12-013 — Implementar tela de sugestões conforme referência visual

## Status

IN_PROGRESS — existe somente esta task em andamento.

## Objetivo

Na segunda tela, mostrar o produto original, alternativas demonstrativas e permitir que a pessoa selecione uma opção explicitamente. O CTA de comparação fica preparado, mas desabilitado até existir a tela SwiftUI seguinte.

## Modelo visual

```text
Pedido
  ↓ Coordinator
Escolher substituto
  ├── Item original (preço do pedido, quando disponível)
  ├── Opções locais (categoria/quantidade; sem preço inventado)
  └── Seleção explícita → Ver comparação (próxima etapa, ainda não conectada)
```

## Por que agora

A tela Pedido já encaminha para Sugestões. Esta tela torna a escolha seguinte compreensível sem alegar compatibilidade percentual, estoque real ou preço de candidatos que os dados atuais não fornecem.

## Revisões pendentes

- SUB-P11-015, SUB-P11-016, SUB-P11-021 — princípios, foundations e tokens
- SUB-P11-005–007 — DSButton, DSProductCardView e DSStatusBadgeView
- SUB-P11-025 — banners UIKit de pedido e informação
- SUB-P12-002–005 — tela Pedido, dados e primeira tela de sugestões
- SUB-P12-010–011 — Coordinator e estados aplicáveis
- SUB-P09-001–009 — laboratório GCD, aguardando revisão de aprendizado

## Bloqueios e limites

- Preços e imagens individuais dos candidatos não estão nos dados locais; a tela não os inventa.
- A comparação SwiftUI e a confirmação ainda não foram implementadas. O botão fica desabilitado até a tela de comparação existir e ser conectada pelo Coordinator.
- A inspeção visual da Tela Pedido no Simulator ficou pendente porque `simctl install` não terminou na sessão anterior.
- SUB-P08-001 e SUB-P09-001–009 continuam em REVIEW até Gabriel revisar e explicar o aprendizado.

## Próxima task

Após Gabriel revisar SUB-P12-013, definir o modelo e implementar a comparação SwiftUI pelas tasks SUB-P13 correspondentes. Não avançar automaticamente.

## Último marco

A Tela Pedido foi integrada à `main` pelo PR #22 e está em REVIEW. A tela de sugestões existente agora será atualizada com a nova referência visual nesta branch.
