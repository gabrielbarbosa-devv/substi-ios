# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Fase atual

FASE 01 — Preparação inicial (Bootstrap)

## Task atual

SUB-P01-002 — Configurar Bundle ID e deployment target

## Estado

REVIEW

## Objetivo

Revisar `com.gabrielbarbosa.substi` e o deployment target iOS 16 nos targets do projeto.

## Por que agora

O PR #5 foi integrado; o projeto agora está versionado e compilável. Esta configuração ajusta o alcance do app ao iOS 16 definido e estabelece Bundle IDs próprios antes de habilitar Swift 6 Language Mode.

## Bloqueios

Nenhum bloqueio para compilar no simulador. Antes de assinar ou distribuir, confirmar a disponibilidade do Bundle ID na equipe Apple Developer. Swift 6 Language Mode permanece para `SUB-P01-003`.

## Próxima tarefa

SUB-P01-003 — Ativar Swift 6 Language Mode (`TODO`; iniciar após a revisão e aprovação de `SUB-P01-002`).

## Trilha de entrega

Problema → bootstrap → MVVM-C mínimo → domínio/ranking → API limitada e inventário local → Design Discovery/foundations → fluxo UIKit → comparação SwiftUI → testes e acessibilidade essenciais → Logger → README e validação final. Itens P1/P2 não bloqueiam esta trilha.

## Último marco concluído

SUB-P01-001 — Criar projeto Xcode; PR #5 integrado em `main`.

> Mantenha no máximo uma tarefa em `IN_PROGRESS` e somente a próxima em `READY`. Uma implementação pronta vai para `REVIEW`; Gabriel marca `DONE` após revisar e conseguir explicar o resultado.
