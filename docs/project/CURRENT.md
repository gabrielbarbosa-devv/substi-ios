# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Fase atual

FASE 04 — Modelagem de domínio (execução pela Delivery Track)

## Task atual

SUB-P04-004 — Definir SubstitutionCandidate

## Estado

REVIEW

## Objetivo

Representar um produto do catálogo que foi apresentado como possível substituto, sem duplicar os dados de `Product` nem antecipar a regra de ranking.

## Por que agora

`Product`, `OrderItem` e `Order` já estão definidos. Um tipo de candidato dá nome ao papel do produto alternativo antes que a fase de ranking defina como comparar e ordenar alternativas.

## Bloqueios

Nenhum bloqueio conhecido. Pontuação e justificativa da compatibilidade permanecem para as tasks de ranking; não serão inferidas nesta task.

## Próxima tarefa

SUB-P04-005 — Definir SubstitutionDecision (`TODO`; somente após a revisão de SUB-P04-004).

## Trilha de entrega

Problema → bootstrap → MVVM-C mínimo → domínio/ranking → API limitada e inventário local → Design Discovery/foundations → fluxo UIKit → comparação SwiftUI → testes e acessibilidade essenciais → Logger → README e validação final. Itens P1/P2 não bloqueiam esta trilha.

## Último marco concluído

SUB-P04-003 — Definir Order e OrderItem; PR #9 integrado por Gabriel. A limpeza do template UIKit está integrada no PR #10 e aguarda revisão conceitual (`REVIEW`).

> Mantenha no máximo uma tarefa em `IN_PROGRESS` e somente a próxima em `READY`. Uma implementação pronta vai para `REVIEW`; Gabriel marca `DONE` após revisar e conseguir explicar o resultado.
