# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo`.

## Trilha de entrega

A jornada Pedido → Sugestões → Comparação → Confirmação → Pedido atualizado está implementada. A execução normal consulta a Open Food Facts para dados de produtos; pedido e disponibilidade permanecem demonstrativos em memória. As 20 fases são a visão completa de engenharia, não uma promessa de implementação integral para o desafio.

## Fase atual

PHASE 12 — UIKit (acabamento da abertura do app)

## Tarefa atual

`SUB-P12-014` — Criar abertura de marca acessível

## Status

REVIEW. Não há task em `IN_PROGRESS`; `SUB-P12-014` aguarda revisão de Gabriel. As tasks de entrega anteriores continuam em REVIEW até Gabriel estudar e aprovar os resultados.

## Resultado nesta rodada

- Swift 6 Language Mode habilitado nos targets do app e de testes.
- `SubstiDomain` extraído para um Swift Package local; demais camadas continuam separadas por responsabilidade no target principal.
- Ranking determinístico: categoria, depois quantidade textual, depois ordem original; linguagem da UI evita prometer “melhores” opções sem validação.
- Jornada automatizada de quatro telas com catálogo controlado apenas no lançamento de UI test.
- Logger nativo com categorias de rede e sugestões, sem dados pessoais/produtos nos eventos.
- Revisões de contraste, Dynamic Type e rodapé de ação nas telas.
- Launch Screen estática alinhada ao fundo semântico e abertura UIKit animada com marca vetorial; a transição respeita Reduce Motion e revela o Pedido sem fingir carregamento de rede.

## Evidência e limites

Em 28/09, o test plan completo terminou como `Passed`, sem falhas ou testes ignorados, com Xcode 16.4 (16F6) no iPhone 16 Pro / iOS 18.6 Simulator. A execução serial (`-parallel-testing-enabled NO`) passou pelos testes unitários, pela jornada Pedido → Sugestões → Comparação → Confirmação → Pedido atualizado e pelas auditorias de acessibilidade/lançamento.

O app normal consulta a Open Food Facts; os testes de UI usam o catálogo determinístico. A API foi conferida por requisições diretas aos códigos de barras da demonstração, mas falta uma validação manual documentada do fluxo completo usando a API ao vivo. A auditoria automática cobre as quatro telas; o teste de Pedido exclui o aviso `.textClipped` de um cartão parcialmente visível na borda da rolagem. Dynamic Type ampliado e VoiceOver ainda precisam de inspeção manual completa.

O Simulator foi inicializado com o Xcode 16.4. `xcode-select -p` ainda aponta para Command Line Tools; o Terminal deve selecionar Xcode 16.4 em **Xcode → Settings → Locations → Command Line Tools** ou definir `DEVELOPER_DIR` para essa execução.

Após a nova abertura, o build e o test plan completo passaram novamente: zero falhas e zero testes ignorados. O teste de navegação conclui a animação via callback determinístico antes de verificar o Coordinator.

A configuração local de `DEVELOPMENT_TEAM` no projeto Xcode pertence à máquina e não deve ser publicada.

## Próximo passo

Revisar a abertura do app e os limites registrados nesta task. Após a revisão de Gabriel, retornar ao fechamento da DELIVERY TRACK e às verificações manuais de API ao vivo, VoiceOver, Dynamic Type e Reduce Motion.
