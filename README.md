# Substi iOS

**Uma escolha simples quando um produto do pedido fica indisponível.** O Substi é uma aplicação demonstrativa para iOS que apresenta alternativas de um catálogo público, ajuda a comparar características e registra a substituição em um pedido local.

**Prazo do desafio:** 28 de setembro de 2026, às 11h (`America/Sao_Paulo`).

## Problema e recorte de produto

Durante a separação de uma compra de mercado, um produto escolhido pode ficar indisponível. A pessoa precisa decidir novamente depois de já ter concluído sua escolha. O Substi explora uma forma de reduzir esse esforço: mostrar alternativas com informações comparáveis e tornar explícitas as semelhanças conhecidas.

Esta é uma hipótese de produto, sem pesquisa quantitativa com usuários neste repositório. O projeto **não afirma** que o iFood carece dessa funcionalidade nem reproduz seu fluxo atual. Pedido e estoque são demonstrativos; a Open Food Facts fornece informações públicas de produtos, não disponibilidade de uma loja.

```text
Pedido em preparação → item indisponível → alternativas → comparação → confirmação → pedido atualizado
```

## O que está implementado

| Parte | Decisão e motivo |
| --- | --- |
| Pedido e sugestões | UIKit, View Code e Auto Layout para demonstrar ciclo de vida, composição e navegação nativa. |
| Comparação e confirmação | SwiftUI em `UIHostingController`, com navegação mantida pelo Coordinator. Demonstra convivência gradual com UIKit. |
| Catálogo | `URLSession` + `async/await` consultam a Open Food Facts por códigos de barras. DTO e Mapper impedem que o formato externo vaze para o domínio. |
| Pedido | Fixture local em memória para representar indisponibilidade e confirmar a troca. O catálogo público não informa estoque de loja. |
| Ranking | Categoria correspondente primeiro; quantidade textual correspondente em seguida; empates preservam a ordem inicial. A interface mostra a evidência disponível, sem porcentagem de compatibilidade inventada. |
| Concorrência | Estado de apresentação isolado em `MainActor`; carregamento sequencial e cancelável respeita a pequena lista de candidatos e evita paralelismo sem benefício medido. |
| Design | Cores semânticas, System Font, Dynamic Type, SF Symbols e componentes usados pelo fluxo. UIKit e SwiftUI compartilham os mesmos tokens. |
| Observabilidade | `Logger` com categorias de rede e sugestões. Registra status e contagens, sem nomes de produtos ou dados pessoais. |

## Arquitetura e modularização

O projeto usa **MVVM-C em escala pequena**. O `SceneDelegate` compõe dependências, o `AppCoordinator` controla navegação, ViewModels preparam estados de tela e protocolos de repositório delimitam as fontes de dados. O pacote local `SubstiDomain` contém modelos, contratos e ranking; ele depende apenas de Foundation. App, Data, Application, Presentation e DesignSystem permanecem separados por pastas no target do app.

```text
SceneDelegate ──cria──> AppCoordinator ──navega──> UIKit / SwiftUI
       │                                         │
       ├── URLSessionAPIClient                   └── ViewModels
       ├── OpenFoodFactsProductRepository                │
       └── DemoInventoryRepository                       ▼
                                                    SubstiDomain
Data ──implementa contratos─────────────────────────────▲
```

```text
Packages/SubstiDomain/     modelos, contratos e regra pura (módulo Swift)
Substi/App/                ciclo de vida, injeção e Coordinator
Substi/Application/        use cases
Substi/Data/               rede, DTO, mapper, repositories e fixtures
Substi/Presentation/       telas e ViewModels por fluxo
Substi/DesignSystem/       tokens e componentes visuais necessários
Substi/Observability/      categorias de Logger
```

A fronteira do domínio é um módulo real do Swift Package Manager, sem dependência externa. Separar as demais pastas em pacotes agora aumentaria configuração e APIs públicas antes de haver necessidade concreta. Consulte [arquitetura](docs/architecture.md) e [ADR MVVM-C](docs/project/adr/ADR-001-mvvm-c.md).

## Ambiente e execução

- macOS em Mac Intel, Xcode 16.4, compilador Swift 6.1 e **Swift 6 Language Mode** nos targets.
- Deployment target iOS 16; o teste de auditoria automática do XCTest requer simulador iOS 17 ou posterior.
- Abra `Substi.xcodeproj`, selecione o esquema `Substi` e execute no simulador. A execução normal usa o catálogo real e precisa de Internet. O target não exige biblioteca externa nem chave de API.
- A assinatura local pode ser selecionada em *Signing & Capabilities* para execução em dispositivo. Dados de equipe de uma máquina não fazem parte do commit.

Para rodar a suíte pelo terminal, com o Xcode selecionado como developer directory:

```bash
xcodebuild -project Substi.xcodeproj -scheme Substi \
  -destination 'platform=iOS Simulator,name=iPhone 16 Pro' \
  CODE_SIGNING_ALLOWED=NO test
```

## Verificação e limites

Há testes unitários de domínio, ranking, mapper, rede via `URLProtocol`, repositories e ViewModels. Um teste de UI usa um catálogo local **somente com argumento de lançamento de teste** para percorrer Pedido → Sugestões → Comparação → Confirmação → Pedido atualizado, sem depender da Internet. Auditorias de acessibilidade do XCTest cobrem as quatro telas. Na tela Pedido, o teste exclui o alerta de texto cortado causado por um cartão parcialmente visível na borda da rolagem; os demais alertas permanecem ativos. A API real foi consultada separadamente para conferir os códigos de barras da demonstração; isso não substitui uma validação manual da jornada com rede ao vivo.

A Open Food Facts pode ter campos ausentes, alteração de dados, indisponibilidade ou limites de requisições. As opções consultadas são barcodes definidos na fixture; o app não descobre o estoque real nem garante alternativas comercialmente disponíveis. A correspondência de categoria e quantidade é uma heurística textual simples, não recomendação validada, cálculo nutricional ou inteligência artificial. Preço e imagem do substituto não são confiáveis no fluxo atual. Dynamic Type ampliado mostrou uma limitação da auditoria automática: um cartão parcialmente visível na borda da rolagem foi sinalizado como texto cortado; requer inspeção manual nessa configuração.

## Evolução futura de engenharia

| Possibilidade | Quando faria sentido |
| --- | --- |
| Backend de pedido e inventário | Quando houver integração com uma loja; substituir a fixture mantendo o contrato `InventoryRepository`. |
| Descoberta e ranking melhores | Com catálogo de candidatos confiável, taxonomia de categorias e critérios de produto validados com usuários. |
| Requisições paralelas e cache | Se medição de latência justificar; limitar concorrência e respeitar a política da API. `TaskGroup` não melhora automaticamente uma lista pequena. |
| Mais módulos Swift Package | Quando fronteiras e equipes exigirem builds independentes; preservar o grafo de dependências. |
| CI, SwiftLint e snapshots | Para colaboração contínua e prevenção de regressão, com regras e imagens estáveis. |
| Analytics, crash reporting e feature flags | Com objetivos de produto, consentimento/privacidade e operação contínua definidos. |
| Modelo de ML | Apenas com dados rotulados, avaliação de qualidade e uma vantagem demonstrada sobre a regra explicável. |
| GCD, Objective-C, CocoaPods, Bazel/Buck e Fastlane | Tópicos de estudo ou de bases maiores; adicioná-los a este app pequeno só para demonstrar ferramentas aumentaria custo sem melhorar a decisão do usuário. |

## Como o trabalho foi organizado

O [backlog](docs/project/BACKLOG.md), [trilha de entrega](docs/project/ROADMAP.md) e [painel atual](docs/project/CURRENT.md) mostram o plano e o estado das tarefas. As 20 fases representam uma visão de aprendizado, não 20 fases implementadas. As mudanças seguem branches, [convenção Git](docs/project/GIT-WORKFLOW.md), commits Conventional Commits e revisão por pull request. A IA auxiliou na implementação e na estruturação; as decisões, limitações e evidências estão registradas para revisão humana.
