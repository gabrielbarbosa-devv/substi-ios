# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Fase atual

FASE 05 — Ranking e TDD (execução pela Delivery Track)

## Task atual

SUB-P05-002 — Escrever teste de pontuação por categoria (RED)

## Estado

IN_PROGRESS

## Objetivo

Expressar a regra de categoria em testes locais e determinísticos antes de implementar o ranker.

## Por que agora

`SUB-P05-001` definiu a regra: categorias iguais ignorando caixa marcam 1; diferentes ou ausentes marcam 0. Agora registramos esse contrato no teste antes do código de produção.

## Bloqueios

Nenhum bloqueio conhecido. Os testes devem falhar antes da implementação GREEN, usando apenas dados construídos em memória.

## Próxima tarefa

SUB-P05-003 — Implementar pontuação por categoria (GREEN), após registrar e observar o RED.

## Trilha de entrega

Problema → bootstrap → MVVM-C mínimo → domínio/ranking → API limitada e inventário local → Design Discovery/foundations → fluxo UIKit → comparação SwiftUI → testes e acessibilidade essenciais → Logger → README e validação final. Itens P1/P2 não bloqueiam esta trilha.

## Último marco concluído

SUB-P04-004 — Definir SubstitutionCandidate; PR #11 integrado e task concluída por autorização de Gabriel.

> Mantenha no máximo uma tarefa em `IN_PROGRESS` e somente a próxima em `READY`. Uma implementação pronta vai para `REVIEW`; Gabriel marca `DONE` após revisar e conseguir explicar o resultado.
