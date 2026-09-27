# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Fase atual

FASE 01 — Preparação inicial (Bootstrap)

## Task atual

SUB-P01-011 — Substituir template SwiftUI por entrada UIKit

## Estado

REVIEW

## Objetivo

Remover a tela de exemplo do template Xcode e iniciar o app pelo ciclo de vida UIKit planejado para o fluxo principal.

## Por que agora

O projeto deve usar UIKit como base do fluxo principal. A tela SwiftUI `ContentView` ainda é instanciada pelo ponto de entrada gerado pelo Xcode; substituímos ambos por um ciclo de vida UIKit mínimo antes de criar as telas do produto.

## Bloqueios

Nenhum bloqueio conhecido. O controlador raiz ficará vazio até a task de tela correspondente; não adicionaremos Coordinator nem telas nesta task.

## Próxima tarefa

SUB-P04-004 — Definir SubstitutionCandidate (`TODO`; próxima task de domínio após a preparação do ponto de entrada UIKit).

## Trilha de entrega

Problema → bootstrap → MVVM-C mínimo → domínio/ranking → API limitada e inventário local → Design Discovery/foundations → fluxo UIKit → comparação SwiftUI → testes e acessibilidade essenciais → Logger → README e validação final. Itens P1/P2 não bloqueiam esta trilha.

## Último marco concluído

SUB-P04-003 — Definir Order e OrderItem; PR #9 integrado por Gabriel.

> Mantenha no máximo uma tarefa em `IN_PROGRESS` e somente a próxima em `READY`. Uma implementação pronta vai para `REVIEW`; Gabriel marca `DONE` após revisar e conseguir explicar o resultado.
