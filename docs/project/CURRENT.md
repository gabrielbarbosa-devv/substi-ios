# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Fase atual

FASE 06 — Networking (execução pela Delivery Track)

## Task atual

SUB-P06-006 — Definir APIClient

## Estado

READY

## Objetivo

Definir o menor contrato que permita solicitar dados HTTP sem acoplar as features diretamente a `URLSession`.

## Por que agora

O endpoint e o método HTTP já estão explícitos e testados. Agora podemos definir a fronteira entre o restante do app e o transporte, antes de implementar a execução com `URLSession`.

## Bloqueios

Nenhum conhecido. A API pública não fornece disponibilidade de uma loja; a lista de opções continuará local nesta etapa.

## Próxima tarefa

SUB-P06-007 — Implementar requisição com URLSession (`TODO`, P0; depende do contrato de APIClient).

## Trilha de entrega

Problema → bootstrap → MVVM-C mínimo → domínio/ranking → API limitada e inventário local → Design Discovery/foundations → fluxo UIKit → comparação SwiftUI → testes e acessibilidade essenciais → Logger → README e validação final. Itens P1/P2 não bloqueiam esta trilha.

## Último marco concluído

SUB-P06-001, SUB-P06-003 e SUB-P06-004 — API investigada; endpoint v3 e método `GET` representados e cobertos por testes locais.

> Mantenha no máximo uma tarefa em `IN_PROGRESS` e somente a próxima em `READY`. Uma implementação pronta vai para `REVIEW`; Gabriel marca `DONE` após revisar e conseguir explicar o resultado.
