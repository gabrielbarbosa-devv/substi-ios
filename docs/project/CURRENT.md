# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Fase atual

FASE 05 — Ranking e TDD (execução pela Delivery Track)

## Task atual

SUB-P05-003 — Implementar pontuação por categoria (GREEN)

## Estado

DONE

## Objetivo

O score de categoria está implementado e os cinco casos determinísticos passam no simulador.

## Por que agora

O ranker mantém a regra isolada e pura. O score é apenas um sinal de categoria: não ordena a lista nem afirma que o candidato é substituto adequado em todos os aspectos.

## Bloqueios

Nenhum bloqueio conhecido para este conjunto. O simulador precisou iniciar manualmente e os testes foram executados sem o alvo de UI.

## Próxima tarefa

SUB-P06-001 — Estudar a API Open Food Facts (`TODO`, P0; início da próxima fatia de integração de dados).

## Trilha de entrega

Problema → bootstrap → MVVM-C mínimo → domínio/ranking → API limitada e inventário local → Design Discovery/foundations → fluxo UIKit → comparação SwiftUI → testes e acessibilidade essenciais → Logger → README e validação final. Itens P1/P2 não bloqueiam esta trilha.

## Último marco concluído

SUB-P05-003 — Implementar pontuação por categoria; 5 testes passaram no iPhone 16 Simulator.

> Mantenha no máximo uma tarefa em `IN_PROGRESS` e somente a próxima em `READY`. Uma implementação pronta vai para `REVIEW`; Gabriel marca `DONE` após revisar e conseguir explicar o resultado.
