# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Fase atual

FASE 05 — Ranking e TDD (execução pela Delivery Track)

## Task atual

SUB-P05-001 — Especificar regra de pontuação por categoria

## Estado

IN_PROGRESS

## Objetivo

Definir e implementar a primeira regra determinística de compatibilidade por categoria, com teste antes do código de produção.

## Por que agora

Os modelos de produto e candidato já existem. A pontuação por categoria fornece o primeiro sinal simples para comparar alternativas sem alegar que a categoria, sozinha, prova compatibilidade total.

## Bloqueios

Nenhum bloqueio conhecido. Esta branch agrupa as três tasks P0 de especificação, teste RED e pontuação GREEN. Marca, quantidade, ordenação e justificativa ficam para tasks próprias.

## Próxima tarefa

SUB-P05-002 — Escrever teste que falha (RED), após concluir a regra da SUB-P05-001.

## Trilha de entrega

Problema → bootstrap → MVVM-C mínimo → domínio/ranking → API limitada e inventário local → Design Discovery/foundations → fluxo UIKit → comparação SwiftUI → testes e acessibilidade essenciais → Logger → README e validação final. Itens P1/P2 não bloqueiam esta trilha.

## Último marco concluído

SUB-P04-004 — Definir SubstitutionCandidate; PR #11 integrado e task concluída por autorização de Gabriel.

> Mantenha no máximo uma tarefa em `IN_PROGRESS` e somente a próxima em `READY`. Uma implementação pronta vai para `REVIEW`; Gabriel marca `DONE` após revisar e conseguir explicar o resultado.
