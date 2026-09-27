# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Fase atual

FASE 04 — Modelagem de domínio (execução pela Delivery Track)

## Task atual

SUB-P04-002 — Definir Product

## Estado

REVIEW

## Objetivo

Revisar o primeiro modelo de domínio do produto: seus dados essenciais e a escolha por representá-lo como um valor imutável.

## Por que agora

O projeto Xcode já existe e a Delivery Track prioriza iniciar o domínio do produto. `Product` fornece a base para as tarefas posteriores de substituição, ranking e dados. A task não depende das configurações de P1 que ficaram pendentes no bootstrap.

## Bloqueios

Nenhum bloqueio conhecido para esta task. `SUB-P01-003` (Swift 6 Language Mode) e outras tasks de bootstrap continuam pendentes e devem ser retomadas conforme a validação da Delivery Track.

## Próxima tarefa

SUB-P04-001 — Definir ProductID (`TODO`; avaliar identificação estável antes de modelar itens e candidatos).

## Trilha de entrega

Problema → bootstrap → MVVM-C mínimo → domínio/ranking → API limitada e inventário local → Design Discovery/foundations → fluxo UIKit → comparação SwiftUI → testes e acessibilidade essenciais → Logger → README e validação final. Itens P1/P2 não bloqueiam esta trilha.

## Último marco concluído

SUB-P01-001 — Criar projeto Xcode; PR #5 integrado em `main`.

> Mantenha no máximo uma tarefa em `IN_PROGRESS` e somente a próxima em `READY`. Uma implementação pronta vai para `REVIEW`; Gabriel marca `DONE` após revisar e conseguir explicar o resultado.
