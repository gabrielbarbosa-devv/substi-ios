# Direção arquitetural

O projeto prevê MVVM-C como arquitetura principal. Esta é uma decisão planejada, a ser detalhada e revista nas tasks da Fase 02; não significa que já exista código ou que cada camada precise ser criada antecipadamente.

```text
View → ViewModel → Use Case → contrato de Repository
    → implementação de Repository → Data Source → APIClient

Coordinator → navegação entre fluxos e telas
```

## Limites previstos

- A View exibe estado e encaminha ações; não faz networking.
- A ViewModel coordena estado de apresentação; não conhece `URLSession`.
- Domain não importa UIKit ou SwiftUI.
- Dados externos passam por DTO e Mapper antes de chegar ao domínio.
- Coordinator controla navegação. A comparação SwiftUI poderá ser apresentada pelo fluxo UIKit usando `UIHostingController`.
- Dependências são compostas em um ponto explícito; não usar Service Locator ou globals.

```text
Feature → DesignSystem
DesignSystem ─X→ Feature, Domain, Repository ou Networking
```

Repository é uma fronteira para separar necessidades de domínio das fontes de dados quando isso for útil ao fluxo e aos testes. Não crie protocolo para cada tipo nem camada sem responsabilidade real. Cada microtask deve mostrar a decisão, alternativa e trade-off correspondente.

Consulte [AGENTS.md](../AGENTS.md) para as regras de dependência e `docs/project/phases/PHASE-02-architecture.md` para o plano de estudo.
