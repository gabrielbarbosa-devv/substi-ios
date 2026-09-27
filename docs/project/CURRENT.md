# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Fase atual

FASE 04 — Modelagem de domínio (execução pela Delivery Track)

## Task atual

SUB-P04-003 — Definir Order e OrderItem

## Estado

REVIEW

## Objetivo

Representar um pedido como uma coleção de itens, mantendo os dados do produto separados da sua presença no pedido.

## Por que agora

`ProductID` e `Product` foram revisados. O domínio agora precisa representar os produtos escolhidos em um pedido para apoiar o fluxo futuro de substituição.

## Bloqueios

Nenhum bloqueio conhecido. Quantidade pedida, preço e estado de disponibilidade não estão definidos nesta task; não serão inferidos.

## Próxima tarefa

SUB-P04-004 — Definir SubstitutionCandidate (`TODO`; iniciar após revisar `Order` e `OrderItem`).

## Trilha de entrega

Problema → bootstrap → MVVM-C mínimo → domínio/ranking → API limitada e inventário local → Design Discovery/foundations → fluxo UIKit → comparação SwiftUI → testes e acessibilidade essenciais → Logger → README e validação final. Itens P1/P2 não bloqueiam esta trilha.

## Último marco concluído

SUB-P04-001 — Definir ProductID; implementação revisada e aprovada por Gabriel.

> Mantenha no máximo uma tarefa em `IN_PROGRESS` e somente a próxima em `READY`. Uma implementação pronta vai para `REVIEW`; Gabriel marca `DONE` após revisar e conseguir explicar o resultado.
