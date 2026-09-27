# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Fase atual

FASE 04 — Modelagem de domínio (execução pela Delivery Track)

## Task atual

SUB-P04-001 — Definir ProductID

## Estado

REVIEW

## Objetivo

Dar ao produto uma identidade tipada que não dependa do nome exibido nem de um formato externo ainda não validado.

## Por que agora

`Product` já está modelado; pedidos, candidatos e dados precisarão distinguir produtos com atributos ou nomes iguais. Esta task cria essa identidade antes de ampliar os modelos do domínio.

## Bloqueios

Nenhum bloqueio conhecido para esta task. `SUB-P01-003` (Swift 6 Language Mode) e outras tasks de bootstrap continuam pendentes e devem ser retomadas conforme a validação da Delivery Track.

## Próxima tarefa

SUB-P04-003 — Definir Order e OrderItem (`TODO`; iniciar após revisar `ProductID` e `Product`).

## Trilha de entrega

Problema → bootstrap → MVVM-C mínimo → domínio/ranking → API limitada e inventário local → Design Discovery/foundations → fluxo UIKit → comparação SwiftUI → testes e acessibilidade essenciais → Logger → README e validação final. Itens P1/P2 não bloqueiam esta trilha.

## Último marco concluído

SUB-P04-002 — Definir Product; implementação revisada e aprovada por Gabriel.

> Mantenha no máximo uma tarefa em `IN_PROGRESS` e somente a próxima em `READY`. Uma implementação pronta vai para `REVIEW`; Gabriel marca `DONE` após revisar e conseguir explicar o resultado.
