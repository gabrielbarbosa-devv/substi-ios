# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Trilha de entrega

Estamos construindo o fluxo vertical de substituição. O laboratório GCD é P2 e não bloqueia a interface.

## Fase atual

FASE 13 — Integração com SwiftUI

## Tarefa atual

SUB-P13-002 — Criar ProductComparisonView

## Status

REVIEW — comparação e integração prontas para Gabriel revisar; nenhuma task foi marcada DONE.

## Objetivo

Comparar produto original e substituto escolhido com os dados conhecidos, usando SwiftUI dentro do fluxo UIKit. A confirmação ainda não faz parte desta etapa.

## Modelo visual

```text
Pedido → Sugestões → seleção explícita
  ↓ Coordinator
UIHostingController
  ↓
Comparação SwiftUI
  ├── nome, marca, categoria e quantidade
  ├── preço do original; substituto sem preço informado
  └── voltar às opções (navegação controlada pelo Coordinator)
```

## Por que agora

A tela de Sugestões já permite selecionar um candidato. A comparação mostra lado a lado os atributos disponíveis sem inventar preço, imagem, nutrição ou percentual de compatibilidade. `UIHostingController` integra SwiftUI ao `UINavigationController`; o Coordinator continua dono da navegação.

## Revisões pendentes

- SUB-P11-015, SUB-P11-016, SUB-P11-021 — princípios, foundations e tokens
- SUB-P11-005–007 — DSButton, DSProductCardView e DSStatusBadgeView
- SUB-P11-025 — banners UIKit de pedido e informação
- SUB-P12-002–005 — tela Pedido, dados e primeira tela de sugestões
- SUB-P12-010–011 — Coordinator e estados aplicáveis
- SUB-P09-001–009 — laboratório GCD, aguardando revisão de aprendizado

## Bloqueios e limites

- Preços e imagens individuais dos candidatos não estão nos dados locais; a tela não os inventa.
- A confirmação ainda não foi implementada. “Escolher este substituto” permanece desabilitado até existir a etapa correspondente.
- A referência visual usa preço, imagem, dados nutricionais e percentual ilustrativos que não existem na fixture; esses dados não foram simulados.
- O app compilou, instalou e abriu no iPhone 16 Pro Simulator; o screenshot confirmou a tela Pedido inicial.
- A tela Comparação e o retorno entre Sugestões/Comparação ainda aguardam inspeção visual em execução.
- SUB-P08-001 e SUB-P09-001–009 continuam em REVIEW até Gabriel revisar e explicar o aprendizado.

## Tasks em revisão

- SUB-P13-001 — Definir modelo de apresentação da comparação
- SUB-P13-002 — Criar ProductComparisonView
- SUB-P13-004 — Apresentar com UIHostingController
- SUB-P13-005 — Manter navegação no Coordinator

## Próxima task

SUB-P13-006 — Validar UIKit para SwiftUI. Não avançar até Gabriel revisar o resultado atual.

## Último marco

SUB-P13-001, SUB-P13-002, SUB-P13-004 e SUB-P13-005 foram implementadas na branch `feature/sub-p13-001-product-comparison`. O build passou e o app abriu no Simulator; a tela Comparação e a revisão de Gabriel ainda estão pendentes.
