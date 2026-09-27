# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Fase atual

FASE 01 — Preparação inicial (Bootstrap)

## Task atual

SUB-P01-001 — Criar projeto Xcode

## Estado

REVIEW

## Objetivo

Revisar o projeto Xcode inicial que agora está versionado no repositório e compila com Xcode 16.4.

## Por que agora

O projeto existia fora do clone Git; colocá-lo no repositório inicia o trabalho de app que pode ser compilado, revisado e compartilhado. Por orientação de Gabriel, o bootstrap começa agora enquanto a definição `SUB-P00-007` aguarda revisão em sua branch documental.

## Bloqueios

O target ainda usa os padrões gerados pelo Xcode. `SUB-P01-002` define Bundle ID e iOS deployment target; `SUB-P01-003` ativa Swift 6 Language Mode. O app-base compila com a instalação Xcode 16.4 encontrada em `/Users/user/Downloads/Xcode.app`.

## Próxima tarefa

SUB-P01-002 — Configurar Bundle ID e deployment target (`TODO`; iniciar após revisão e aprovação de `SUB-P01-001`).

## Trilha de entrega

Problema → bootstrap → MVVM-C mínimo → domínio/ranking → API limitada e inventário local → Design Discovery/foundations → fluxo UIKit → comparação SwiftUI → testes e acessibilidade essenciais → Logger → README e validação final. Itens P1/P2 não bloqueiam esta trilha.

## Último marco concluído

SUB-P00-004 — Definir pessoa usuária; perfil de referência e limites aprovados por Gabriel.

> Mantenha no máximo uma tarefa em `IN_PROGRESS` e somente a próxima em `READY`. Uma implementação pronta vai para `REVIEW`; Gabriel marca `DONE` após revisar e conseguir explicar o resultado.
