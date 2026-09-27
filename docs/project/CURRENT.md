# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Fase atual

FASE 05 — Ranking e TDD (execução pela Delivery Track)

## Task atual

SUB-P05-003 — Implementar pontuação por categoria (GREEN)

## Estado

IN_PROGRESS

## Objetivo

Implementar a pontuação definida e fazer os cinco casos determinísticos passarem.

## Por que agora

O teste RED falhou pelo motivo esperado: `ProductSubstitutionRanker` ainda não existe. Agora vamos adicionar a implementação mínima que satisfaz os casos.

## Bloqueios

Nenhum bloqueio conhecido. O novo tipo deve permanecer puro, local e sem regra de ordenação.

## Próxima tarefa

Após esta branch: SUB-P05-004 — Implementar pontuação por quantidade (`TODO`, P1; só se ainda contribuir para a entrega).

## Trilha de entrega

Problema → bootstrap → MVVM-C mínimo → domínio/ranking → API limitada e inventário local → Design Discovery/foundations → fluxo UIKit → comparação SwiftUI → testes e acessibilidade essenciais → Logger → README e validação final. Itens P1/P2 não bloqueiam esta trilha.

## Último marco concluído

SUB-P04-004 — Definir SubstitutionCandidate; PR #11 integrado e task concluída por autorização de Gabriel.

> Mantenha no máximo uma tarefa em `IN_PROGRESS` e somente a próxima em `READY`. Uma implementação pronta vai para `REVIEW`; Gabriel marca `DONE` após revisar e conseguir explicar o resultado.
