# Substi iOS

**Substituição inteligente de produtos de mercado.** O Substi explora como ajudar uma pessoa a escolher uma alternativa quando um produto do pedido fica indisponível durante a separação.

**Status:** Em andamento (*Work in Progress*)
**Prazo da entrega:** 28 de setembro de 2026, às 11h, horário de Brasília (`America/Sao_Paulo`).

## O problema que identifiquei

Durante uma compra de mercado, a pessoa já escolheu os produtos e segue com o pedido. Se um item fica indisponível durante a separação, ela precisa tomar outra decisão em um momento inesperado. Comparar categoria, quantidade, marca e outras informações pode exigir esforço adicional.

Minha pesquisa inicial sobre compras por aplicativos e experiências de grocery/e-commerce apontou esse cenário como uma oportunidade de produto: apresentar alternativas de forma clara e explicar quais características são semelhantes. Esta é uma hipótese a explorar, não uma alegação de pesquisa quantitativa com usuários. O projeto também não afirma que o iFood não oferece substituições nem descreve a funcionalidade atual do iFood.

```text
Pedido em andamento
        ↓
Produto escolhido indisponível
        ↓
Nova decisão para a pessoa
        ↓
Alternativas comparáveis
        ↓
Escolha consciente
```

## O que a aplicação demonstra

O fluxo permite abrir um pedido demonstrativo, escolher o produto indisponível, carregar opções do catálogo público Open Food Facts, comparar o original com uma alternativa, confirmar a troca e voltar ao pedido atualizado.

```text
Pedido [UIKit]
   ↓
Sugestões reais do catálogo [UIKit]
   ↓
Comparação [SwiftUI]
   ↓
Confirmação [SwiftUI]
   ↓
Pedido atualizado em memória [UIKit]
```

## Arquitetura implementada

O app usa uma composição pequena de **MVVM-C**, dimensionada para esse fluxo. O `SceneDelegate` monta as dependências, o `AppCoordinator` controla navegação, as ViewModels preparam estado de apresentação e os contratos de repositório isolam as fontes de dados.

```text
SceneDelegate (composition root)
  ├── URLSessionAPIClient
  ├── OpenFoodFactsProductRepository
  ├── DemoInventoryRepository
  └── AppCoordinator
        ├── telas UIKit + ViewModels
        └── SwiftUI em UIHostingController

Presentation → Application → contratos do Domain
Data ──────────────────────> implementa contratos do Domain
```

```text
Substi/
├── App/                    # ciclo de vida, composição e Coordinator
├── Application/UseCases    # operações da aplicação
├── Domain/                 # modelos, contratos e regras de domínio
├── Data/                   # API, DTOs, mappers, repositórios e fixtures
├── Presentation/           # Order, Suggestions, Comparison, Confirmation
└── DesignSystem/           # foundations e componentes UIKit compartilhados
```

As pastas separam responsabilidades dentro de um único target Xcode; elas ainda não são módulos Swift Package. A decisão e seus trade-offs estão em [`docs/architecture.md`](docs/architecture.md) e [`ADR-001`](docs/project/adr/ADR-001-mvvm-c.md).

## Tecnologias e decisões atuais

| Área | Estado no código |
| --- | --- |
| Plataforma | iOS 16 como deployment target; Mac Intel e Xcode 16.4 no ambiente do projeto. |
| Swift | Compilador Swift 6.1 disponível; projeto ainda está em **Swift 5 Language Mode**. Ativar Swift 6 é a próxima task. |
| Interface | UIKit com View Code, Auto Layout, `UIScrollView` e `UIStackView`; comparação e confirmação em SwiftUI, hospedadas por UIKit com `UIHostingController`. |
| Arquitetura | MVVM-C com `AppCoordinator`, `SceneDelegate` como composition root e ViewModels por fluxo. |
| Rede | `URLSession` com `async/await`, APIClient, Endpoint, DTO, Mapper e tratamento de erros para o catálogo Open Food Facts. |
| Dados do pedido | Pedido, estoque demonstrativo e confirmação são locais e em memória; não vêm de um backend de loja. |
| Design | Tokens semânticos de cor, tipografia, espaçamento e raio; componentes UIKit reutilizados; System Font, Dynamic Type e SF Symbols quando adequados. |
| Concorrência | Requisições de sugestões são sequenciais e canceláveis. `MainActor` protege estado de UI. Não há `TaskGroup` no fluxo do app. |
| Testes | Swift Testing para unidade/integração e XCTest/XCUIAutomation para UI, lançamento, desempenho de abertura e auditoria automática de acessibilidade da tela Pedido. |
| Dependências | Não há dependências externas, CocoaPods, Swift Packages ou gerenciador de terceiros. |

### API e limitações dos dados

O app consulta o catálogo público por códigos de barras definidos nas fixtures demonstrativas. A resposta fornece nome, código, categoria, marca e quantidade quando disponíveis. A API pública não informa o estoque do pedido; o projeto não se conecta ao inventário ou ao backend de uma loja.

O conjunto de candidatos é configurado localmente. O `ProductSubstitutionRanker` calcula atualmente apenas um ponto por categoria igual; ele ainda não ordena o conjunto por uma regra completa. Categoria e quantidade aparecem como informações de comparação, não como uma pontuação de compatibilidade validada. Preço e imagem do substituto não são fornecidos pelo fluxo atual.

## Testes e validação

A suíte completa passou no simulador: **27 testes unitários e 7 execuções de testes de UI/launch**, incluindo teste do mapper/rede com `URLProtocol`, ViewModels, navegação, ranking e auditoria automática da tela Pedido. Os testes de rede usam respostas controladas; não dependem de a API estar disponível durante a execução.

A auditoria automatizada usa uma API de XCTest disponível em iOS 17 ou posterior, embora o deployment target permaneça iOS 16. A tela Pedido passou nessa auditoria. VoiceOver e Dynamic Type ainda precisam de revisão manual nas quatro telas.

## O que ainda falta

- Ativar Swift 6 Language Mode e corrigir os diagnósticos reais do compilador.
- Definir uma regra de ranking explicável, cobrindo categoria, quantidade e atributos disponíveis; ordenar candidatos por essa regra e testar casos de borda.
- Fazer uma jornada automatizada de UI que atravesse sugestões, comparação, confirmação e retorno ao pedido.
- Revisar VoiceOver, Dynamic Type, contraste e alvos de toque manualmente em todas as telas.
- Melhorar a apresentação de indisponibilidade de rede, ausência de campos e tentativas de recarga sem depender de conexão ao vivo nos testes.
- Adicionar observabilidade mínima com `Logger` e registrar warnings de build relevantes.
- Atualizar screenshots e validar visualmente a versão que será enviada.

SwiftLint, CI/CD, Fastlane, snapshots, persistência, backend de pedidos/estoque, imagens/preços confiáveis, analytics, crash reporting, remote config, ML e Objective-C não estão implementados. São opções de evolução, não capacidades atuais do app.

## Como o trabalho é organizado

O repositório mantém tarefas pequenas em [`docs/project/BACKLOG.md`](docs/project/BACKLOG.md), o próximo passo em [`docs/project/CURRENT.md`](docs/project/CURRENT.md) e a trilha de entrega em [`docs/project/ROADMAP.md`](docs/project/ROADMAP.md). O objetivo é permitir que uma pessoa avaliadora veja o problema, o que foi construído, as decisões, os testes e os limites sem confundir um estudo futuro com uma funcionalidade entregue.

`main` é a branch principal. Mudanças são desenvolvidas em branches focadas, registradas em commits Conventional Commits e integradas por pull request. As regras estão em [`docs/project/GIT-WORKFLOW.md`](docs/project/GIT-WORKFLOW.md).
