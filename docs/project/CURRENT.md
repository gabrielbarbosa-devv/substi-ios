# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Fase atual

FASE 07 — Repository (execução pela Delivery Track)

## Tasks em revisão

- SUB-P07-001 — Definir ProductRepository
- SUB-P07-002 — Definir InventoryRepository
- SUB-P07-003 — Criar fixtures de inventário

## Estado

REVIEW

## Objetivo

Declarar fronteiras pequenas entre Domain e dados remotos/locais e fornecer um cenário reproduzível de pedido com alternativas de demonstração.

## Por que agora

O pipeline de networking já transforma uma resposta Open Food Facts em `Product`. Os contratos de Repository mantêm o domínio isolado das fontes concretas; as fixtures locais permitem desenvolver e testar o fluxo sem afirmar disponibilidade de uma loja.

## Bloqueios

Os testes do target ainda precisam ser executados em um ambiente com Xcode selecionado. Aqui, `xcode-select` aponta para Command Line Tools sem `xcodebuild`, Simulator ou módulo `Testing`; o typecheck dos modelos/contratos/fixtures e uma verificação executável isolada da fixture passaram com Swift 6.1.2. A API pública continua sem representar estoque de loja.

## Próxima task

SUB-P07-005 — Implementar composição do Repository (P0), após revisão deste bloco.

## Trilha de entrega

Problema → bootstrap → MVVM-C mínimo → domínio/ranking → API limitada e inventário local → Design Discovery/foundations → fluxo UIKit → comparação SwiftUI → testes e acessibilidade essenciais → Logger → README e validação final. Itens P1/P2 não bloqueiam esta trilha.

## Último marco

SUB-P07-001–003 — Contratos de Product/Inventory Repository e fixtures locais de demonstração criados em branch focada; aguardam revisão de Gabriel.

> SUB-P06-006–011 também permanecem em `REVIEW`; Gabriel é quem decide quando os aprova e os move para `DONE`.
