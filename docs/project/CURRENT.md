# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília).

## Trilha de entrega

O fluxo Pedido → Sugestões reais → Comparação → Confirmação está implementado. Estamos fechando qualidade de entrega; as 20 fases continuam como plano completo, sem serem uma lista obrigatória antes da entrega.

## Fase atual

FASE 01 — Bootstrap (trilha de entrega)

## Tarefa atual

SUB-P01-003 — Ativar Swift 6 Language Mode

## Status

READY — tasks P0 de arquitetura MVVM-C foram encerradas e integradas à `main`. A próxima alteração de código deve habilitar Swift 6 Language Mode e tratar os diagnósticos resultantes.

## Objetivo

Validar o código atual no modo de linguagem Swift 6 e corrigir problemas de concorrência/isolamento identificados pelo compilador, sem silenciar diagnósticos indevidamente.

## Por que agora

O toolchain planejado é Swift 6.1 e a documentação estabelece Swift 6 Language Mode como objetivo. Validar isso antes de ampliar o código reduz risco de acumular violações de concorrência perto da entrega.

## Arquitetura atual concluída para a trilha de entrega

```text
SceneDelegate (composition root)
  ├── cria URLSessionAPIClient + repositories concretos
  └── mantém AppCoordinator
        ├── coordena UINavigationController
        ├── conecta ViewControllers e ViewModels UIKit
        └── apresenta comparação SwiftUI via UIHostingController

Presentation → Application/UseCases → Domain contracts
Data implementations ───────────────> Domain contracts
```

As pastas atuais já estão separadas por responsabilidade. A etapa não criou módulos nem moveu arquivos sem necessidade. A dependência do Coordinator em `InventoryFixtures` foi removida: indisponibilidade agora é fornecida pelo contrato existente de `InventoryRepository`. As tasks P0 de arquitetura foram marcadas `DONE` a pedido de Gabriel.

## Tasks aguardando revisão de Gabriel

- SUB-P14-001–006 — auditoria e critérios essenciais de acessibilidade.
- SUB-P13-007 — retorno à tela de sugestões.
- SUB-P13-009 — confirmação da substituição.

Nenhuma task está `IN_PROGRESS`; apenas SUB-P01-003 está `READY`.

## Evidência de validação

- Suíte completa no iPhone 16 Pro Simulator, iOS 18.6, x86_64: 27 testes unitários e 7 testes UI/launch passaram na revisão de acessibilidade.
- Suíte completa após a alteração do contrato `InventoryRepository`: 27 testes unitários e 7 testes de UI/launch passaram (`TEST SUCCEEDED`).
- `git diff --check`: passou.
- Warning conhecido: processamento de metadados App Intents é ignorado porque o app não usa `AppIntents`.

## Limites conhecidos

- Open Food Facts fornece dados públicos de produtos. Pedido, estoque e substituição permanecem dados demonstrativos em memória.
- Auditoria automatizada cobre a tela Pedido; revisão manual de VoiceOver/Dynamic Type e demais telas ainda é necessária.
- A configuração local de Development Team em `Substi.xcodeproj/project.pbxproj` é da máquina e não pertence a esta alteração.

## Próxima task

SUB-P01-003 — Ativar Swift 6 Language Mode. Fazer em uma branch própria, preservar as configurações locais de assinatura e executar a suíte completa.

## Último marco

PR #30 foi mergeado na `main` para a etapa P0 de acessibilidade. PR #31 concluiu as tasks de arquitetura e corrigiu o acesso do Coordinator às fixtures. A suíte completa passou após as alterações: 27 testes unitários e 7 testes de UI/launch.
