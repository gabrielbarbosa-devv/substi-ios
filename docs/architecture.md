# Arquitetura implementada

O Substi usa uma composição pequena de **MVVM-C**: ViewControllers UIKit e views SwiftUI exibem o estado preparado pelas ViewModels; o `AppCoordinator` conduz navegação e monta as telas; os contratos de repositório ficam no domínio e as implementações concretas na camada de dados.

```text
SceneDelegate — composition root
  ├── URLSessionAPIClient
  ├── OpenFoodFactsProductRepository ──implements──> ProductRepository
  ├── DemoInventoryRepository ─────────implements──> InventoryRepository
  └── AppCoordinator
        ├── cria OrderViewModel → OrderViewController (UIKit)
        ├── cria SuggestionsViewModel → SuggestionsViewController (UIKit)
        └── cria ProductComparisonViewModel → UIHostingController (SwiftUI)

Presentation → Application/UseCases → Domain contracts
                                         ▲
Data implementations ───────────────────┘
```

## Pastas e responsabilidades

| Pasta | Responsabilidade atual |
| --- | --- |
| `Substi/App` | Ciclo de vida da aplicação, composição inicial e navegação. |
| `Substi/Application/UseCases` | Operações de aplicação que coordenam um objetivo, como carregar um produto. |
| `Substi/Domain/Models` | Tipos centrais do produto e do pedido, sem dependência de UIKit/SwiftUI. |
| `Substi/Domain/Repositories` | Contratos que a aplicação/domínio precisam para obter ou atualizar dados. |
| `Substi/Domain/Services` | Regras de domínio, como ranking de candidatos. |
| `Substi/Data/Networking` | Transporte HTTP, endpoints, erros e DTOs da API externa. |
| `Substi/Data/Mappers` | Conversão de DTO externo para o modelo de domínio. |
| `Substi/Data/Repositories` | Implementações dos contratos de dados locais e remotos. |
| `Substi/Data/Fixtures` | Dados estáticos usados pelo inventário demonstrativo. |
| `Substi/Presentation/<Feature>` | View, ViewModel e estado de apresentação de cada fluxo. |
| `Substi/DesignSystem` | Foundations e componentes compartilhados de interface. |

As pastas já existentes correspondem a responsabilidades distintas; esta etapa não move arquivos nem cria módulos Swift Package. A separação é por diretórios no target atual do Xcode.

## Responsabilidades e fluxo

- `SceneDelegate` é o ponto de composição: cria cliente HTTP e repositórios concretos, injeta os contratos no `AppCoordinator` e mantém o Coordinator durante a cena.
- `AppCoordinator` mantém o `UINavigationController`, decide as transições e constrói ViewModels/Views para os fluxos. Não deve ler fixtures nem fazer requisições diretamente.
- ViewControllers UIKit e views SwiftUI renderizam dados de apresentação e encaminham ações. Não fazem chamadas de rede.
- ViewModels transformam modelos em conteúdo próprio da tela. O `OrderViewModel` recebe os IDs indisponíveis por parâmetro e não conhece `InventoryFixtures`.
- `LoadProductUseCase` expressa o objetivo de carregar um produto usando o contrato `ProductRepository`.
- `ProductRepository` e `InventoryRepository` são fronteiras necessárias entre quem solicita os dados e suas fontes concretas. `OpenFoodFactsProductRepository` usa `APIClient`; `DemoInventoryRepository` encapsula o inventário de demonstração.
- Respostas Open Food Facts passam por `DTO → Mapper → Product`; o domínio e a apresentação não recebem o DTO externo.

## Direção das dependências

```text
App / Presentation ──> Application ──> Domain
Data ─────────────────────────────────> Domain (implementa contratos)
Presentation ──> DesignSystem
DesignSystem ──X──> Feature, Domain, Data ou Networking
```

Em termos de SOLID, a aplicação usa **SRP** ao separar navegação, estado de tela, regra de domínio, transporte e mapeamento. Usa **DIP** nas fronteiras de repositório: Coordinator/Use Case recebem contratos; Data fornece implementações. Isso não exige um protocolo para cada tipo. Por exemplo, `LoadProductUseCase` é um valor concreto porque não há necessidade atual de substituí-lo isoladamente.

## Ownership do fluxo

```text
SceneDelegate ──strong──> AppCoordinator ──strong──> UINavigationController
                                  │                          │
                                  └──> repositories          └──> ViewControllers
                                       e UseCase                    └──> ViewModels
```

O `SceneDelegate` mantém o Coordinator em uma propriedade enquanto a cena existe. O Coordinator mantém o navigation controller e os repositórios. Closures de retorno das telas capturam o Coordinator com `[weak self]`, evitando que uma tela mantida pela navegação forme um ciclo com o Coordinator. SwiftUI é apresentado pelo UIKit com `UIHostingController`; o Coordinator permanece responsável pelo fluxo.

## Decisão e limites

MVVM-C foi mantido porque o produto tem um fluxo de navegação entre telas UIKit e uma tela SwiftUI hospedada no mesmo fluxo. O Coordinator deixa a navegação fora das Views, e a ViewModel deixa a transformação de apresentação fora do ViewController. Para quatro telas, o projeto mantém um Coordinator e poucos limites concretos; não cria hierarquia de Coordinators, módulos separados ou protocolos para cada ViewModel.

O inventário e a confirmação continuam demonstrativos em memória. Open Food Facts informa dados públicos de produtos, não disponibilidade real de loja. Consulte [Product Requirements](product-requirements.md) para limites do produto e [ADR-001](project/adr/ADR-001-mvvm-c.md) para alternativas e trade-offs.
