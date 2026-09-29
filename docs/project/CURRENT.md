# Trabalho atual

## Trilha de entrega

A jornada Pedido → Sugestões → Comparação → Confirmação → Pedido atualizado está implementada. No uso normal, o app consulta a API Open Food Facts; pedido, estoque e confirmação são demonstrativos em memória. As 20 fases são uma visão de evolução, não uma obrigação para apresentar este recorte.

## Atividade técnica atual

`SUB-P02-011` — Separar navegação da composição de telas

## Status

REVIEW. O Coordinator mantém as transições de rota; a AppScreenFactory monta as telas e injeta dependências. Os ViewModels consultam o contrato InventoryRepository para os dados locais simples. Use Cases permanecem nas operações com comportamento de aplicação próprio. A execução dos testes aguarda o Xcode, indisponível no ambiente de linha de comando atual.

## Revisões de entrega preservadas

- `SUB-P19-014` — Exibir imagens reais do catálogo com fallback: REVIEW.
- `SUB-P19-013` — Fechar revisão técnica da entrega: REVIEW.

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

Gabriel revisa `SUB-P02-011`, executa os testes no Xcode e explica a divisão de responsabilidades antes de mover a tarefa para DONE. As tarefas `SUB-P19-013` e `SUB-P19-014` continuam em REVIEW.
