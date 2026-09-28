# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo`.

## Trilha de entrega

A jornada Pedido → Sugestões → Comparação → Confirmação → Pedido atualizado está implementada. A execução normal consulta a Open Food Facts para dados de produtos; pedido e disponibilidade permanecem demonstrativos em memória. As 20 fases são a visão completa de engenharia, não uma promessa de implementação integral para o desafio.

## Fase atual

Fechamento da DELIVERY TRACK — build, suíte de testes, documentação e revisão final.

## Tarefa atual

Revisão de entrega das tasks agrupadas `SUB-P01-003`, `SUB-P03-001`–`003`, `SUB-P05-004`, `SUB-P05-006`, `SUB-P15-001`–`003` e `SUB-P16-008`.

## Status

REVIEW. Nenhuma task está `IN_PROGRESS` ou `READY`. Os itens implementados aguardam leitura e compreensão de Gabriel antes de `DONE`, conforme `AGENTS.md`.

## Resultado nesta rodada

- Swift 6 Language Mode habilitado nos targets do app e de testes.
- `SubstiDomain` extraído para um Swift Package local; demais camadas continuam separadas por responsabilidade no target principal.
- Ranking determinístico: categoria, depois quantidade textual, depois ordem original; linguagem da UI evita prometer “melhores” opções sem validação.
- Jornada automatizada de quatro telas com catálogo controlado apenas no lançamento de UI test.
- Logger nativo com categorias de rede e sugestões, sem dados pessoais/produtos nos eventos.
- Revisões de contraste, Dynamic Type e rodapé de ação nas telas.

## Evidência e limites

Em 28/09, o test plan completo terminou como `Passed`, sem falhas ou testes ignorados, com Xcode 16.4 (16F6) no iPhone 16 Pro / iOS 18.6 Simulator. A execução serial (`-parallel-testing-enabled NO`) passou pelos testes unitários, pela jornada Pedido → Sugestões → Comparação → Confirmação → Pedido atualizado e pelas auditorias de acessibilidade/lançamento.

O app normal consulta a Open Food Facts; os testes de UI usam o catálogo determinístico. A API foi conferida por requisições diretas aos códigos de barras da demonstração, mas falta uma validação manual documentada do fluxo completo usando a API ao vivo. A auditoria automática cobre as quatro telas; o teste de Pedido exclui o aviso `.textClipped` de um cartão parcialmente visível na borda da rolagem. Dynamic Type ampliado e VoiceOver ainda precisam de inspeção manual completa.

O Simulator foi inicializado com o Xcode 16.4. `xcode-select -p` ainda aponta para Command Line Tools; o Terminal deve selecionar Xcode 16.4 em **Xcode → Settings → Locations → Command Line Tools** ou definir `DEVELOPER_DIR` para essa execução.

A configuração local de `DEVELOPMENT_TEAM` no projeto Xcode pertence à máquina e não deve ser publicada.

## Próximo passo

Gabriel revisa o fluxo e estuda as decisões de modularização, ranking e dados demonstrativos. Só então as tasks em `REVIEW` passam a `DONE`. Possíveis evoluções estão no README, sem ampliar a entrega atual.
