# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Trilha de entrega

Estamos construindo o fluxo vertical de substituição. O laboratório GCD é P2 e não bloqueia a interface.

## Fase atual

FASE 13 — Integração com SwiftUI

## Tarefa atual

SUB-P13-009 — Criar confirmação da substituição

## Status

REVIEW — confirmação, atualização demonstrativa do pedido e documentação prontas para Gabriel revisar; nenhuma task foi marcada DONE.

## Objetivo

Permitir revisar o original e o candidato, cancelar sem efeito ou confirmar a troca no pedido mantido em memória durante a sessão.

## Modelo visual

```text
Pedido UIKit
   ↓ Coordinator
Sugestões UIKit → Comparação SwiftUI
                         ↓ escolher candidato
                  folha SwiftUI nativa
                   ↙              ↘
             cancelar            confirmar
             sem efeito       Repository local
                                    ↓
                          Pedido com status substituído
```

## Por que agora

A referência da nova imagem é a quarta tela, Confirmação. A cópia “Tela 1 — Meu pedido” junto dela está desatualizada; o contrato visual da imagem foi registrado como confirmação. Agora a ação da comparação tem um destino e a troca só acontece após confirmação explícita.

## Revisões pendentes

- SUB-P11-015, SUB-P11-016, SUB-P11-021 — princípios, foundations e tokens
- SUB-P11-005–007 — DSButton, DSProductCardView e DSStatusBadgeView
- SUB-P11-025 — banners UIKit de pedido e informação
- SUB-P12-002–005 — tela Pedido, dados e primeira tela de sugestões
- SUB-P12-010–011 — Coordinator e estados aplicáveis
- SUB-P09-001–009 — laboratório GCD, aguardando revisão de aprendizado

## Bloqueios e limites

- Preços e imagens individuais dos candidatos não estão nos dados locais; a confirmação não os inventa.
- A troca é mantida somente em memória durante a sessão e volta à fixture original após encerrar o processo. Não altera serviço externo nem representa estoque real.
- A referência visual usa preço, imagem e percentual ilustrativos que não existem na fixture; esses dados não foram simulados.
- O build do app passou no Xcode 16.4 para iOS Simulator. A inspeção visual em execução e a revisão de Gabriel permanecem pendentes.
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

SUB-P13-006 — Validar UIKit para SwiftUI. Revisar esta fatia antes de iniciar outra task.

## Último marco

SUB-P07-010 e SUB-P13-009 foram implementadas na branch `feature/sub-p07-010-confirm-substitution`. O build passou no Xcode 16.4 para iOS Simulator; a confirmação mantém o estado no repository local durante a sessão e devolve a tela Pedido atualizada. A inspeção visual e a revisão de Gabriel permanecem pendentes; tarefas ficam em REVIEW até ele validar.
