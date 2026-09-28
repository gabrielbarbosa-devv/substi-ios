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

O build de Debug para iOS Simulator passou em Swift 6. As suites unitárias passaram em execução anterior; o teste end-to-end e as auditorias focadas passaram individualmente. A execução final combinada parou com `Mach error -308` quando o serviço do simulador encerrou o canal com o runner; isso é uma falha do ambiente de teste, então a suíte completa não tem resultado verde nesta rodada. As verificações de API ao vivo foram feitas em requisições diretas aos três códigos de barras; a jornada automatizada usa dados controlados. A auditoria automática de acessibilidade cobre as quatro telas. O teste da tela Pedido exclui o alerta de texto cortado causado por um cartão parcialmente visível na borda da rolagem; os demais alertas permanecem ativos. Dynamic Type ampliado e VoiceOver ainda exigem inspeção manual completa.

A configuração local de `DEVELOPMENT_TEAM` no projeto Xcode pertence à máquina e não deve ser publicada.

## Próximo passo

Gabriel revisa o fluxo e estuda as decisões de modularização, ranking e dados demonstrativos. Só então as tasks em `REVIEW` passam a `DONE`. Possíveis evoluções estão no README, sem ampliar a entrega atual.
