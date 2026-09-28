# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília).

## Trilha de entrega

O fluxo funcional Pedido → Sugestões reais → Comparação → Confirmação está implementado. Estamos fechando acessibilidade essencial, verificações de build/testes e documentação da entrega. As 20 fases permanecem como plano de engenharia; não são uma lista obrigatória antes da entrega.

## Fase atual

FASE 02 — Arquitetura mínima

## Tarefa atual

SUB-P02-001 — Escrever ADR de MVVM-C

## Status

READY — próxima task após a auditoria P0 da Fase 14; será documentada a arquitetura que já existe e corrigidos limites de dependência reais, sem reorganização cosmética.

## Objetivo

Registrar decisão MVVM-C, estrutura de pastas e responsabilidades existentes para que a arquitetura seja legível e defensável.

## Modelo visual da arquitetura existente

```text
SceneDelegate (composition root)
  ├── monta URLSessionAPIClient + repositories
  └── inicia AppCoordinator
        ├── controla UINavigationController
        ├── constrói ViewControllers + ViewModels
        └── apresenta Comparison/Confirmation com UIHostingController

Presentation → Application/UseCases → Domain/Repository protocols
                                      ↑
                         Data/Repository implementations
```

As pastas atuais refletem estas responsabilidades: `App/Coordinators`, `Application/UseCases`, `Domain`, `Data`, `Presentation` e `DesignSystem`. Evitar mover arquivos sem evidência de uma fronteira incorreta; documentar e corrigir violações reais de dependência quando encontradas.

## Por que agora

A Fase 14 P0 tem critérios e resultados automatizados/estáticos registrados em REVIEW. A próxima prioridade P0 é explicar/documentar a arquitetura real. O exame encontrou uma dependência concreta do Coordinator em `InventoryFixtures`; a próxima mudança vai removê-la por meio do contrato de inventário já existente, sem criar protocolo novo.

## Evidência de validação

- Suíte completa no iPhone 16 Pro Simulator, iOS 18.6, x86_64: 27 testes unitários e 7 testes UI/launch passaram.
- Teste adicional `testOrderScreenPassesAccessibilityAudit`: passou no iOS 18.6.
- `performAccessibilityAudit` exige iOS 17+; o teste pula explicitamente em runtimes anteriores. Deployment target do app permanece iOS 16.
- O auditor verifica a tela que está visível; não valida por si só VoiceOver manual nem o restante da navegação.
- Aviso de build conhecido: extração de metadados de App Intents é ignorada porque o app não usa `AppIntents`; nenhum warning Swift novo foi observado na compilação validada.

## Tasks em revisão

- SUB-P14-001 — critérios observáveis de acessibilidade (aguarda revisão de Gabriel).
- SUB-P14-002–006 — auditoria de tela inicial, revisão estática e correção do alvo de toque (aguarda revisão de Gabriel).
- SUB-P13-007 — retorno à tela de sugestões.
- SUB-P13-009 — confirmação da substituição.
- Outras tasks marcadas `REVIEW` nas fases anteriores permanecem aguardando revisão/aprendizado, conforme os arquivos de fase.

## Bloqueios e limites conhecidos

- Teste manual com VoiceOver e Accessibility Inspector ainda não foi realizado nesta etapa.
- A UI Test auditada automaticamente até agora é apenas Pedido. Sugestões/Comparação/Confirmação ainda precisam ser auditadas por navegação ou inspeção manual.
- A API Open Food Facts fornece informações públicas de produtos; pedido, estoque e substituição permanecem dados demonstrativos em memória, sem persistência ou integração com inventário real.
- A configuração local de Development Team em `Substi.xcodeproj/project.pbxproj` é uma alteração da máquina e não faz parte desta branch.

## Próxima task

SUB-P02-001 — Escrever ADR de MVVM-C; alinhar `docs/architecture.md` ao código real, revisar responsabilidades e limites antes de mover pastas.

## Último marco

A suíte completa passou após iniciar o Simulator explicitamente e desabilitar execução paralela. A auditoria automatizada da tela Pedido também passou. A primeira tentativa da suíte completa ficou travada no serviço do Simulator e foi cancelada; o resultado cancelado não foi tratado como falha do código.
