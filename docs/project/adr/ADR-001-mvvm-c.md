# ADR-001 — MVVM-C mínimo para o fluxo do Substi

- **Estado:** Aprovada por Gabriel para a arquitetura atual em 2026-09-27.
- **Data:** 2026-09-27.
- **Tasks relacionadas:** SUB-P02-001, SUB-P02-002, SUB-P02-005, SUB-P02-006, SUB-P02-007, SUB-P02-008.

## Contexto

O fluxo precisa mostrar o pedido em UIKit, carregar candidatos de produto por um contrato de repositório, comparar com uma view SwiftUI e confirmar a seleção. A navegação e a construção das telas não devem ficar misturadas às regras de apresentação ou ao transporte HTTP.

## Decisão

Manter MVVM-C proporcional ao app:

- `SceneDelegate` atua como composition root e cria implementações concretas;
- `AppCoordinator` coordena navegação e composição das telas do fluxo;
- Views UIKit/SwiftUI renderizam e encaminham ações;
- ViewModels preparam os dados para as telas;
- Use Case representa uma operação da aplicação quando há um objetivo claro;
- protocolos `ProductRepository` e `InventoryRepository` ficam no domínio; implementações ficam em `Data`;
- `APIClient` isola o transporte HTTP dentro de `Data/Networking`.

```text
Cena → Coordinator → View/ViewModel → Use Case → Repository protocol
  └── cria implementações Data ───────────────────────────────┘
UIKit navigation → UIHostingController → SwiftUI comparison
```

O Coordinator não acessa fixtures. A disponibilidade demonstrativa é fornecida pelo contrato de `InventoryRepository`, implementado por `DemoInventoryRepository`.

## Alternativas consideradas

- **MVC:** mais simples no começo, mas o ViewController tenderia a acumular navegação, transformação de dados e estado de tela. A escolha seria razoável para uma tela pequena sem fluxo entre UIKit e SwiftUI.
- **MVVM sem Coordinator:** separaria apresentação, mas deixaria navegação e construção de telas dentro de controllers/views ou de um objeto sem responsabilidade explícita.
- **VIP/VIPER:** oferecem mais papéis e fronteiras, mas adicionariam arquivos e encaminhamentos sem necessidade demonstrada neste fluxo curto.

## Consequências

- Navegação e apresentação podem ser lidas e discutidas separadamente.
- Repositórios concretos podem ser trocados no ponto de composição sem fazer ViewModel ou Coordinator conhecer `URLSession`/DTOs.
- Testes podem fornecer implementações de repositório determinísticas.
- O Coordinator ainda constrói objetos de apresentação; para o tamanho atual, isso é intencional e evita um container/Factory genérico.
- `DemoInventoryRepository` mantém estado apenas em memória e não representa estoque real.
- O projeto ainda está em um único target Xcode; pastas organizam responsabilidades, mas não são módulos com isolamento do compilador.

## Trade-offs e revisão

A decisão prioriza um fluxo explicável com poucas abstrações. Se o número de fluxos/coordinators crescer, ou se composição e navegação ficarem difíceis de manter, revisar a composição por feature e o ciclo de vida dos Coordinators. Não introduzir essas estruturas preventivamente.

Validação desta etapa: suíte de testes do app e revisão do grafo de dependências. Gabriel aprovou o encerramento das tasks relacionadas em 2026-09-27.

## Registro da implementação

- `AppCoordinator` solicita `unavailableProductIDs` pelo contrato `InventoryRepository` e não importa/conhece `InventoryFixtures`.
- `DemoInventoryRepository` fornece os IDs configurados na fixture de demonstração.
- Teste do repositório verifica a disponibilidade exposta pelo contrato.
- Suíte completa: 27 testes unitários e 7 testes de UI/launch aprovados; `git diff --check` aprovado.
- Tasks relacionadas estão em `DONE` por solicitação explícita de Gabriel após a revisão da proposta e dos resultados.
