# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Fase atual

FASE 06 — Networking (execução pela Delivery Track)

## Tasks atuais

- SUB-P06-006 — Definir APIClient
- SUB-P06-007 — Implementar requisição com URLSession
- SUB-P06-008 — Definir NetworkError

## Estado

REVIEW

## Objetivo

Criar uma fronteira mínima e testável para executar requisições HTTP com URLSession, validar respostas e representar falhas sem acoplar as camadas superiores ao transporte.

## Por que agora

O endpoint e o método HTTP já estão explícitos. Esse bloco entrega o transporte necessário antes de modelar os dados da API em DTO e fazer o mapeamento para o domínio.

## Bloqueios

Nenhum conhecido. A API pública não fornece disponibilidade de uma loja; a lista de opções continuará local nesta etapa.

## Próxima task

SUB-P06-009 — Definir DTO (`TODO`, P0; depende de SUB-P06-008). Aguardará a revisão deste bloco.

## Trilha de entrega

Problema → bootstrap → MVVM-C mínimo → domínio/ranking → API limitada e inventário local → Design Discovery/foundations → fluxo UIKit → comparação SwiftUI → testes e acessibilidade essenciais → Logger → README e validação final. Itens P1/P2 não bloqueiam esta trilha.

## Último marco

SUB-P06-001, SUB-P06-003 e SUB-P06-004 — API investigada; endpoint v3 e método `GET` representados e cobertos por testes locais.

> Este bloco de três tasks foi implementado em uma branch relacionada e aguarda revisão de Gabriel. Somente ele muda tasks para DONE após revisar e conseguir explicar o resultado.
