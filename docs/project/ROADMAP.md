# Roadmap do Substi

## Plano completo de engenharia

As 20 fases preservam a visão de aprendizado e evolução de engenharia do projeto. Elas não determinam a ordem de execução da entrega atual. A trilha de entrega é uma sequência vertical independente; prioridade e dependências indicam o que realmente precisa ser feito.

**Estado da entrega:** a jornada de quatro telas, a consulta ao catálogo público, o domínio em pacote local e os testes essenciais foram implementados. A revisão técnica final está em REVIEW, aguardando Gabriel, conforme [CURRENT.md](CURRENT.md); as demais fases continuam como opções de evolução. Veja também as limitações no [README](../../README.md).

## DELIVERY TRACK

A trilha de entrega descreve a sequência mínima para validar e apresentar o recorte funcional. Não é necessário concluir as 20 fases para entregar uma amostra técnica.

A ordem de entrega percorre uma fatia funcional de ponta a ponta; não é necessário concluir as 20 fases em sequência:

```text
PROBLEMA → BOOTSTRAP → ARQUITETURA MÍNIMA → DOMÍNIO → API
                                                   ↓
                           DESIGN DISCOVERY → FOUNDATIONS
                                                   ↓
                    FLUXO UIKit → COMPARAÇÃO SwiftUI → TESTES
                                                   ↓
                       LOGGING → README → VALIDAÇÃO FINAL
```

Fases independentes de networking, concorrência mínima e Design Discovery podem avançar em paralelo quando isso não fragmentar o trabalho. Não espere módulos opcionais, laboratório GCD, estudo avançado de memória ou automação completa para iniciar o fluxo de interface. Antes de implementar cada tela, revisar o contrato de tela da tarefa `SUB-P11-017`. No máximo uma tarefa pode estar `IN_PROGRESS`; deixe apenas a próxima em `READY`. Uma implementação pronta vai para `REVIEW`; Gabriel só a marca `DONE` depois de revisar e explicar a solução.

### P0 — necessário para a entrega

| Etapa | Tasks essenciais |
| --- | --- |
| 1. Produto | `SUB-P00-001`, `SUB-P00-003`, `SUB-P00-007`, `SUB-P00-008`, `SUB-P00-009`, `SUB-P00-012` |
| 2. Bootstrap | `SUB-P01-001`, `SUB-P01-002`, `SUB-P01-003`, `SUB-P01-005`, `SUB-P01-008`, `SUB-P01-009`, `SUB-P01-011` |
| 3. Arquitetura mínima | `SUB-P02-001`, `SUB-P02-002`, `SUB-P02-005`, `SUB-P02-006`, `SUB-P02-007` |
| 4. Domínio e ranking | `SUB-P04-002`–`SUB-P04-004`; `SUB-P05-001`–`SUB-P05-003` |
| 5. Rede e Repository | `SUB-P06-001`, `SUB-P06-003`, `SUB-P06-004`, `SUB-P06-006`–`SUB-P06-011`; `SUB-P07-001`–`SUB-P07-003`, `SUB-P07-005`, `SUB-P07-010`; conectar sugestões reais em `SUB-P13-010` |
| 6. Concorrência mínima | `SUB-P08-001`, `SUB-P08-007`. Usar TaskGroup só se o fluxo final justificar. |
| 7. Design Discovery e foundations | `SUB-P11-013`, `SUB-P11-015`–`SUB-P11-018`, `SUB-P11-020`, depois `SUB-P11-021`. Tokens semânticos; não escolher hex codes arbitrários. |
| 8. Fluxo UIKit | `SUB-P11-005`, `SUB-P11-006`, `SUB-P11-008`, `SUB-P11-010`, `SUB-P11-022`; `SUB-P12-002`–`SUB-P12-006`, `SUB-P12-009`–`SUB-P12-011`. |
| 9. Comparação SwiftUI e catálogo real | `SUB-P11-023`; `SUB-P13-001`, `SUB-P13-002`, `SUB-P13-004`–`SUB-P13-007`, `SUB-P13-009`–`SUB-P13-010`. Só implementar componentes justificados pelo inventário. |
| 10. Qualidade e acessibilidade | `SUB-P14-001`–`SUB-P14-006`; `SUB-P16-001`, `SUB-P16-003`, `SUB-P16-004`. |
| 11. Observabilidade e entrega | `SUB-P15-001`, `SUB-P15-002`; `SUB-P19-001`, `SUB-P19-004`, `SUB-P19-006`. |

P0 representa o mínimo que habilita a jornada completa e sua defesa técnica. Simplifique soluções quando necessário e mantenha um caminho determinístico; não aumente a arquitetura para marcar mais tecnologias como concluídas.

### P1 — fazer se houver tempo

- Pesquisar princípios de Design System do iFood e até três referências de grocery, limitando cada pesquisa ao tempo definido na tarefa; direcionamento visual high fidelity e snapshots críticos.
- Comparações extensas de MVC, MVVM, VIP e VIPER; estudo de endpoints genéricos, TaskGroup, actors/cache e investigação extra de memória/desempenho.
- Testes extras de UI, configuração ampla de SwiftLint, CI/UI automation, otimização medida e screenshots.
- Variantes opcionais de componentes, somente quando os contratos de tela mostrarem necessidade.

### P2 — evolução futura de engenharia

Laboratório GCD completo, exemplo Objective-C, implementação de MetricKit, Crashlytics/Firebase/Remote Config, Fastlane/CD, Bazel/Buck, Core ML, cache em disco sofisticado e suíte extensa de snapshots/componentes. Permanecem documentados para estudo e entrevista; não podem atrasar o fluxo P0.

### Marcos de qualidade

- Registrar problema, MVP e fluxo antes de ampliar a implementação.
- Preservar uma integração reproduzível: API ao vivo no app e fixtures controladas nos testes.
- Validar estados loading/content/empty/error, acessibilidade essencial e conclusão da jornada.
- Antes de compartilhar, confirmar build e testes, revisar screenshots, README, limitações e estado do GitHub.

### Riscos da entrega

- O fluxo depende de API pública de terceiros; cobertura incompleta, indisponibilidade e rate limits podem reduzir o número de alternativas exibidas.
- Cobertura incompleta ou rate limits do Open Food Facts podem impedir várias alternativas previsíveis. Limitar consultas, representar resultados vazios/parciais com clareza e não depender da API ao vivo nos testes.
- Manter pedido, inventário e preço do substituto explicitamente demonstrativos; não sugerir que o catálogo público valida disponibilidade comercial.
- Evitar módulos, paralelismo, componentes e integrações de produção sem uma necessidade demonstrada.

## Plano completo — 20 fases

```text
FASE 00 — Descoberta do produto
        ↓
FASE 01 — Bootstrap
        ↓
FASE 02 — Arquitetura
        ↓
FASE 03 — Modularização
        ↓
FASE 04 — Modelagem de domínio
        ↓
FASE 05 — Ranking e TDD
        ↓
FASE 06 — Networking
        ↓
FASE 07 — Repository
        ↓
FASE 08 — Concorrência em Swift
        ↓
FASE 09 — Laboratório GCD
        ↓
FASE 10 — Gerenciamento de memória
        ↓
FASE 11 — Design Discovery e Design System
        ↓
FASE 12 — UIKit
        ↓
FASE 13 — Integração SwiftUI
        ↓
FASE 14 — Acessibilidade
        ↓
FASE 15 — Observabilidade
        ↓
FASE 16 — Testes
        ↓
FASE 17 — Debugging e desempenho
        ↓
FASE 18 — Automação de engenharia
        ↓
FASE 19 — Entrega e entrevista
```

As dependências abaixo são pré-requisitos reais; o número da fase, por si só, não bloqueia a trilha de entrega.

| Fase | Objetivo e resultado esperado | Dependências | Prioridade | Estado |
| --- | --- | --- | --- | --- |
| 00 — Descoberta do produto | Definir problema, evidências, MVP, jornada e escopo antes de Swift. Resultado: decisões de produto registradas. | Nenhuma | P0/P1 | IN_PROGRESS |
| 01 — Bootstrap | Criar e validar a base mínima de um app iOS nativo com configuração de linguagem, deployment e ponto de entrada UIKit. | Decisões da fase 00 | P0/P1 | IN_PROGRESS |
| 02 — Arquitetura | Definir limites mínimos MVVM-C necessários para o fluxo. Resultado: Coordinator, composição e direção das dependências explicáveis. | Bootstrap | P0/P1 | TODO |
| 03 — Modularização | Planejar módulos e avaliar limites de pacotes. Resultado: decisão documentada; dividir todo o projeto em pacotes não é necessário neste recorte. | Arquitetura | P1/P2 | TODO |
| 04 — Modelagem de domínio | Modelar somente pedido, produto e candidato essenciais. | Escopo do produto | P0/P1 | TODO |
| 05 — Ranking e TDD | Definir e testar uma regra de ranking simples e determinística. Não inventar complexidade de pontuação. | Modelo de domínio | P0/P1 | TODO |
| 06 — Networking | Acessar Open Food Facts com URLSession e limites claros. Resultado: uma consulta testável e DTO mapeado, respeitando rate limits. | Produto/código de barras | P0/P1 | IN_PROGRESS |
| 07 — Repository | Compor fixture de inventário local e informações remotas de produto. | Domínio e APIClient | P0/P1 | TODO |
| 08 — Concorrência em Swift | Usar async/await e isolamento da UI quando necessário. TaskGroup só se o fluxo justificar. | Rede e fluxo de UI | P0/P1 | IN_PROGRESS |
| 09 — Laboratório GCD | Estudar GCD separadamente para aprendizado e entrevista. Nenhuma dependência de entrega. | Nenhuma | P2 | TODO |
| 10 — Gerenciamento de memória | Revisar ownership e ciclo de vida dos objetos realmente implementados. Estudos avançados de profiling são futuros. | Fluxo UIKit | P1/P2 | TODO |
| 11 — Design Discovery e Design System | Definir princípios, foundations e contratos de tela antes da implementação mínima. Resultado: linguagem própria do Substi, revisão de acessibilidade e tokens/componentes usados. | Fluxo de produto; pode ocorrer em paralelo ao domínio/API | P0/P1 | TODO |
| 12 — UIKit | Implementar caminho principal de pedido e sugestões com View Code. Resultado: estados de UI e navegação via Coordinator. | Bootstrap e contratos de tela | P0/P1 | TODO |
| 13 — Integração SwiftUI | Integrar comparação à navegação UIKit e carregar candidatos reais da Open Food Facts, mantendo o inventário local de demonstração. | Fluxo UIKit, catálogo por barcode e contrato de tela | P0 | IN_PROGRESS |
| 14 — Acessibilidade | Verificar necessidades essenciais no fluxo entregue: VoiceOver, Dynamic Type, contraste e alvos de toque. | Contratos e telas | P0/P1 | TODO |
| 15 — Observabilidade | Adicionar logging nativo básico e orientação de privacidade; integrações avançadas ficam para depois. | Fluxo de dados/UI | P0/P1/P2 | TODO |
| 16 — Testes | Testar primeiro a lógica e as fronteiras de maior risco. Resultado: ranking, mapper/rede, estados essenciais e, se houver tempo, um happy path de UI. | Caminhos de domínio/dados/UI | P0/P1/P2 | TODO |
| 17 — Debugging e desempenho | Executar verificações direcionadas e uma medição útil se houver tempo; não alegar otimização sem evidência. | App funcional | P1 | TODO |
| 18 — Automação de engenharia | Adicionar automação pequena e de baixo risco. Nenhuma assinatura ou CD no caminho crítico. | Comandos de build/teste | P1/P2 | TODO |
| 19 — Entrega e entrevista | Apresentar a história do projeto e validar entrega. Resultado: README, limitações, verificações e defesa das decisões. | Fluxo vertical funcional | P0/P1/P2 | TODO |
