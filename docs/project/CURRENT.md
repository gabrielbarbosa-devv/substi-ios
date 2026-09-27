# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Fase atual

FASE 06 — Networking (execução pela Delivery Track)

## Tasks em revisão

- SUB-P06-006 — Definir APIClient
- SUB-P06-007 — Implementar requisição com URLSession
- SUB-P06-008 — Definir NetworkError
- SUB-P06-009 — Definir DTO
- SUB-P06-010 — Mapear DTO para Product
- SUB-P06-011 — Testar com URLProtocol

## Estado

REVIEW

## Objetivo

Concluir o pipeline mínimo de consulta: executar endpoint HTTP, decodificar a resposta externa e convertê-la em Product por uma fronteira testada sem rede ao vivo.

## Por que agora

As tasks anteriores estabeleceram o transporte. Este bloco valida o formato externo da Open Food Facts, isola-o em DTO e traduz os campos úteis para o domínio antes da criação de Repository.

## Bloqueios

Nenhum conhecido. A API pública não fornece disponibilidade de uma loja; o inventário do protótipo permanece local. Categoria vinda da API é o primeiro taxonomy tag, não um rótulo localizado para interface.

## Próxima task

SUB-P07-001 — Definir ProductRepository (P0). Será retomada após revisão dos itens de Networking em `REVIEW`.

## Trilha de entrega

Problema → bootstrap → MVVM-C mínimo → domínio/ranking → API limitada e inventário local → Design Discovery/foundations → fluxo UIKit → comparação SwiftUI → testes e acessibilidade essenciais → Logger → README e validação final. Itens P1/P2 não bloqueiam esta trilha.

## Último marco

SUB-P06-001, SUB-P06-003 e SUB-P06-004 — API investigada; endpoint v3 e método `GET` representados e cobertos por testes locais.

> Os blocos SUB-P06-006–008 e SUB-P06-009–011 foram implementados em branches focadas e integrados à `main`; permanecem em `REVIEW`. Somente Gabriel os muda para DONE após revisar e conseguir explicar o resultado.
