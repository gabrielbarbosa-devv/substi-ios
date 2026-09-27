# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Fase atual

FASE 07 — Repository (execução pela Delivery Track)

## Tasks em revisão

- SUB-P07-001 — Definir ProductRepository
- SUB-P07-002 — Definir InventoryRepository
- SUB-P07-003 — Criar fixtures de inventário
- SUB-P07-005 — Implementar composição do Repository
- SUB-P07-008 — Testar resultados remotos

## Estado

REVIEW

## Objetivo

Conectar os contratos Domain às fontes remota e local, mantendo as implementações isoladas em Data e cobrindo a integração remota com testes sem rede ao vivo.

## Por que agora

Os contratos e o pipeline HTTP/DTO/Mapper já existem. Os dados agora chegam ao domínio por implementações concretas, sem misturar API com inventário local. A arquitetura de apresentação permanece MVVM-C conforme `AGENTS.md`; nenhuma tela começa até Gabriel enviar as referências visuais.

## Bloqueios

Os testes do target ainda precisam ser executados em um ambiente com Xcode selecionado. Aqui, `xcode-select` aponta para Command Line Tools sem `xcodebuild`, Simulator ou módulo `Testing`. Typecheck Swift 6, parse de testes e verificação executável isolada passaram. A API pública fornece catálogo de produtos, não estoque de loja.

## Próxima task

Próximo bloco: revisar as tasks em REVIEW e executar SubstiTests com Xcode; depois, receber as telas de Gabriel para iniciar Design Discovery/contratos de tela antes da UI.

## Trilha de entrega

Problema → bootstrap → MVVM-C mínimo → domínio/ranking → API limitada e inventário local → Design Discovery/foundations → fluxo UIKit → comparação SwiftUI → testes e acessibilidade essenciais → Logger → README e validação final. Itens P1/P2 não bloqueiam esta trilha.

## Último marco

SUB-P07-005 e SUB-P07-008 — adaptadores de repositório e cobertura do pipeline remoto preparados para revisão. P07-004 e P07-006–007 permanecem P1; cache não entra no fluxo sem necessidade demonstrada.

> SUB-P06-006–011 também permanecem em `REVIEW`; Gabriel é quem decide quando os aprova e os move para `DONE`.
