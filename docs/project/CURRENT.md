# Trabalho atual

## Trilha de entrega

A jornada Pedido → Sugestões → Comparação → Confirmação → Pedido atualizado está implementada. No uso normal, o app consulta a API Open Food Facts; pedido, estoque e confirmação são demonstrativos em memória. As 20 fases são uma visão de evolução, não uma obrigação para apresentar este recorte.

## Fase atual

PHASE 19 — Entrega e entrevista

## Tarefa atual

`SUB-P19-014` — Exibir imagens reais do catálogo com fallback

## Status

REVIEW. Imagens opcionais da Open Food Facts aparecem nas telas quando disponíveis; fallback, validação de URL e testes offline estão implementados.

## Estado da tarefa anterior

`SUB-P19-013` — Fechar revisão técnica da entrega: REVIEW. A implementação e evidências anteriores continuam aguardando revisão de Gabriel.

## Verificações anteriores

- Build e suíte completa passaram em Xcode 16.4 / iPhone 16 Pro Simulator (iOS 18.6): 49 testes passaram, incluindo auditorias de acessibilidade.
- A jornada automatizada Pedido → Sugestões → Comparação → Confirmação → Pedido atualizado passou com catálogo determinístico. Os testes de rede usam `URLProtocol`, sem depender da Internet.
- Executei o app normal no simulador, sem `--uitest-demo-catalog`: o log registrou `Candidates loaded: 3, failed: 0`, e a tela apresentou metadados reais da API.
- Consultei diretamente os três códigos de barras configurados; todos retornaram nome, marca, categoria e quantidade. A API pode devolver categorias amplas/inconsistentes e `1 L`/`1l`; o ranking compara texto normalizado e não é uma recomendação validada.
- Logs cobrem status HTTP, transporte, decodificação, mapeamento e falhas parciais sem expor detalhes privados. Testes cobrem falha parcial/total, lista vazia, nova tentativa e cancelamento.
- Dynamic Type ampliado permite alcançar o aviso e a ação após rolagem; auditorias XCTest passaram. VoiceOver ainda precisa de inspeção manual.
- A resposta da Open Food Facts forneceu URLs de imagem para os produtos de demonstração; as três URLs consultadas responderam HTTP 200 com `image/jpeg`. A exibição é opcional e tem fallback de SF Symbols.
- O teste de acessibilidade passou após reduzir o fallback simbólico no modo escuro.
- Prazos vencidos foram removidos de `AGENTS.md`, `CURRENT.md`, `ROADMAP.md` e da introdução da Phase 11. `DEVELOPMENT_TEAM` permanece configuração local e não deve ser publicado.

## Próximo passo

Gabriel revisa `SUB-P19-014`, explica as decisões e o fluxo visual; somente então decide se move a tarefa para DONE.
