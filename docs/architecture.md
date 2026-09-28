# Arquitetura implementada

O Substi usa uma composição pequena de **MVVM-C**: ViewControllers UIKit e views SwiftUI exibem o estado preparado pelas ViewModels; o `AppCoordinator` conduz navegação e monta as telas; os contratos de repositório ficam no domínio e as implementações concretas na camada de dados.

```text
SceneDelegate — composition root
  ├── URLSessionAPIClient
  ├── URLSessionProductImageRepository ──implements──> ProductImageRepository
  ├── OpenFoodFactsProductRepository ──implements──> ProductRepository
  ├── DemoInventoryRepository ─────────implements──> InventoryRepository
  ├── LoadSubstitutionCandidatesUseCase
  ├── LoadProductImageUseCase → ProductImageLoader (cache de apresentação)
  ├── ConfirmSubstitutionUseCase
  └── AppCoordinator
        ├── cria OrderViewModel → OrderViewController (UIKit)
        ├── cria SuggestionsViewModel → SuggestionsViewController (UIKit)
        └── cria ProductComparisonViewModel → UIHostingController (SwiftUI)

Presentation → Application/UseCases → Domain contracts
     ▲                                      ▲
AppCoordinator ── navega                  Data implementations
```

Imagens de catálogo seguem uma fronteira própria, pois bytes de imagem e metadados de produto têm validações e ciclos de carregamento diferentes:

```text
JSON.selected_images.front → Mapper → Product.imageURL
                                         ↓
UIKit / SwiftUI → ProductImageLoader → LoadProductImageUseCase
                                          ↓
                                ProductImageRepository
                                          ↓
                                  URLSession + cache HTTP
```

## Pastas e responsabilidades

| Pasta | Responsabilidade atual |
| --- | --- |
| `Substi/App` | Ciclo de vida da aplicação, composição inicial e navegação. |
| `Substi/Application/UseCases` | Operações da aplicação: buscar e ordenar candidatos, confirmar uma substituição. |
| `Packages/SubstiDomain/Sources/SubstiDomain/Models` | Tipos centrais do produto e do pedido, sem dependência de UIKit/SwiftUI. |
| `Packages/SubstiDomain/Sources/SubstiDomain/Repositories` | Contratos que a aplicação/domínio precisam para obter ou atualizar dados. |
| `Packages/SubstiDomain/Sources/SubstiDomain/Services` | Regras de domínio, como ranking de candidatos. |
| `Substi/Data/Networking` | Transporte HTTP, endpoints, erros e DTOs da API externa. |
| `Substi/Data/Mappers` | Conversão de DTO externo para o modelo de domínio. |
| `Substi/Data/Repositories` | Implementações dos contratos de dados locais e remotos. |
| `Substi/Data/Fixtures` | Dados estáticos usados pelo inventário demonstrativo. |
| `Substi/Presentation/<Feature>` | View, ViewModel e estado de apresentação de cada fluxo. |
| `Substi/DesignSystem` | Foundations e componentes compartilhados de interface. |

O domínio agora é o pacote local `SubstiDomain` (Swift tools 6, iOS 16), importado pelo app e pelos testes. Ele depende apenas de Foundation. App, Application, Data, Presentation e DesignSystem continuam como pastas do target principal; extrair todas essas camadas aumentaria configuração e superfície pública sem necessidade no fluxo atual.

## Responsabilidades e fluxo

- `SceneDelegate` é o ponto de composição: cria cliente HTTP, repositórios e casos de uso, injeta suas dependências e mantém o Coordinator durante a cena.
- `AppCoordinator` mantém o `UINavigationController`, decide as transições e constrói ViewModels/Views para os fluxos. Pode consultar o contrato do inventário para montar o fluxo, mas não executa a mutação do pedido nem faz requisições HTTP.
- ViewControllers UIKit e views SwiftUI renderizam dados de apresentação e encaminham ações. Não fazem chamadas de rede.
- ViewModels transformam modelos em conteúdo próprio da tela. O `OrderViewModel` recebe os IDs indisponíveis por parâmetro e não conhece `InventoryFixtures`.
- `LoadSubstitutionCandidatesUseCase` coordena as consultas configuradas, preserva resultados parciais, aplica o ranking e interrompe o trabalho quando cancelado.
- `ConfirmSubstitutionUseCase` valida a opção configurada, produz o pedido atualizado e pede ao repositório que o persista.
- `ProductRepository` e `InventoryRepository` são fronteiras necessárias entre quem solicita os dados e suas fontes concretas. `OpenFoodFactsProductRepository` usa `APIClient`; `DemoInventoryRepository` encapsula o inventário de demonstração.
- Respostas Open Food Facts passam por `DTO → Mapper → Product`; o domínio e a apresentação não recebem o DTO externo.
- A URL frontal opcional é mapeada para `Product.imageURL`; `ProductImageRepository` busca os bytes, e `ProductImageLoader` compartilha cache de imagens decodificadas entre UIKit e SwiftUI. As Views não fazem chamadas HTTP.

## Direção das dependências

```text
App / Presentation ──> Application ──> Domain
Data ─────────────────────────────────> Domain (implementa contratos)
Presentation ──> DesignSystem
DesignSystem ──X──> Feature, Domain, Data ou Networking
```

Em termos de SOLID, a aplicação usa **SRP** ao separar navegação, estado de tela, coordenação de operações, regra de domínio, transporte e mapeamento. Usa **DIP** nas fronteiras de repositório: casos de uso recebem contratos; Data fornece implementações. Isso não exige um protocolo para cada tipo.

## Ownership do fluxo

```text
SceneDelegate ──strong──> AppCoordinator ──strong──> UINavigationController
                                  │                          │
                                  └──> repositories          └──> ViewControllers
                                       e UseCase                    └──> ViewModels
```

O `SceneDelegate` mantém o Coordinator em uma propriedade enquanto a cena existe. O Coordinator mantém o navigation controller, o contrato de leitura do inventário e os casos de uso. Closures de retorno das telas capturam o Coordinator com `[weak self]`, evitando que uma tela mantida pela navegação forme um ciclo com o Coordinator. SwiftUI é apresentado pelo UIKit com `UIHostingController`; o Coordinator permanece responsável pelo fluxo.

## Decisão e limites

MVVM-C foi mantido porque o produto tem um fluxo de navegação entre telas UIKit e uma tela SwiftUI hospedada no mesmo fluxo. O Coordinator deixa a navegação fora das Views, e a ViewModel deixa a transformação de apresentação fora do ViewController. Para quatro telas, o projeto mantém um Coordinator e poucos limites concretos; não cria hierarquia de Coordinators ou protocolos para cada ViewModel. O único módulo extraído é o domínio, pois a fronteira impede dependências de UIKit/SwiftUI e mantém a regra de ranking testável.

O inventário e a confirmação continuam demonstrativos em memória. Open Food Facts informa dados públicos de produtos, não disponibilidade real de loja. Consulte [Product Requirements](product-requirements.md) para limites do produto e [ADR-001](project/adr/ADR-001-mvvm-c.md) para alternativas e trade-offs.
