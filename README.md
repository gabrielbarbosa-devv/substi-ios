# Substi iOS

**Substituição inteligente de produtos de mercado.** O Substi é um projeto de iOS que explora como ajudar uma pessoa a escolher uma alternativa quando um produto do pedido fica indisponível.

**Status:** Em andamento (*Work in Progress*)<br>
**Prazo da entrega:** 28 de setembro de 2026, às 11h, horário de Brasília (`America/Sao_Paulo`).

## O problema que identifiquei

Durante uma compra de mercado, a pessoa escolhe os produtos e segue com o pedido. Se, durante a separação, um item fica indisponível, uma decisão que parecia encerrada precisa ser feita de novo. A pessoa então precisa avaliar alternativas — por exemplo, comparar categoria, quantidade, marca e outras informações — em um momento inesperado.

Minha pesquisa inicial sobre compras de mercado por aplicativos e experiências de grocery/e-commerce me levou a esse ponto da jornada: um produto escolhido pode ficar indisponível durante a separação, obrigando a pessoa a decidir de novo. Identifiquei uma oportunidade de tornar essa escolha mais clara: mostrar opções lado a lado e explicar por que cada uma pode ser compatível com o produto original. O protótipo será pequeno, mas mostrará esse cenário concreto de ponta a ponta.

```text
Pedido em andamento
        ↓
Produto escolhido indisponível
        ↓
Pessoa precisa decidir novamente
        ↓
Alternativas explicadas e comparáveis
        ↓
Escolha consciente
```

Esta é uma hipótese de produto, não uma alegação de que o problema já foi validado por pesquisa com usuários. O projeto também não afirma que o iFood não oferece substituições nem descreve a funcionalidade atual do iFood. Consulte [problema, contexto e hipóteses do produto](docs/product-requirements.md).

## O que queremos demonstrar

Uma jornada curta, mas realista: abrir um pedido com um item indisponível, consultar alternativas, entender as diferenças, comparar uma opção com o original e confirmar uma escolha. Mesmo com poucas etapas, a experiência deve explicar o motivo de cada sugestão e deixar claro o resultado da decisão.

O escopo prioriza uma solução pequena que possa ser explicada e revisada em profundidade. O objetivo não é acumular tecnologias: decisões proporcionais, fluxo funcional, estados de interface claros, acessibilidade, testes relevantes e limitações documentadas demonstram mais maturidade do que uma arquitetura grande ou incompleta. Quero que uma pessoa avaliadora consiga entender não só o que foi construído, mas qual problema motivou o projeto, por que cada decisão cabe no escopo, quais riscos foram considerados e o que ainda precisaria ser validado com usuários e dados reais.

## Como pretendemos construir

- **Plataforma:** iOS 16 ou posterior, Xcode 16.4 e Swift 6.1, com Swift 6 Language Mode, em um Mac Intel.
- **Interface:** UIKit com View Code e Auto Layout para o fluxo principal; uma etapa de comparação em SwiftUI para demonstrar interoperabilidade nativa.
- **Arquitetura planejada:** MVVM-C, navegação coordenada e limites simples entre interface, domínio, repositório e acesso a dados. Abstrações só entram quando resolverem um problema concreto.
- **Dados:** URLSession e Open Food Facts para informações públicas de produtos. O estoque e a disponibilidade do pedido serão dados locais de demonstração; a API pública não representa o inventário de uma loja.
- **Design:** uma linguagem visual própria e enxuta, orientada por princípios claros, Human Interface Guidelines da Apple, acessibilidade e padrões adequados ao problema. UIKit e SwiftUI devem compartilhar as mesmas foundations.
- **Qualidade:** testes focados em ranking, mapeamento/rede e ViewModels, além de revisão de ownership, concorrência, acessibilidade e avisos importantes.

Essas escolhas são direção planejada; não significam que a aplicação já esteja implementada. A entrega seguirá uma trilha vertical curta, do problema à validação final. Os demais tópicos ficam registrados como evolução futura quando não contribuírem diretamente para a entrega.

## Como vamos trabalhar

O trabalho está organizado em microtarefas versionadas no repositório. Cada tarefa é estudada, discutida, implementada, validada, revisada e explicada antes da próxima. A tarefa ativa e seu estado ficam em [`docs/project/CURRENT.md`](docs/project/CURRENT.md); o [backlog](docs/project/BACKLOG.md) e o [roadmap](docs/project/ROADMAP.md) separam a trilha de entrega do plano completo de engenharia.

O Git também faz parte da rastreabilidade: `main` é a branch principal; cada mudança de desenvolvimento usa uma branch própria, commits seguem Conventional Commits e a integração é proposta por pull request. Veja [fluxo de Git](docs/project/GIT-WORKFLOW.md).

O Codex ajuda a pesquisar, estruturar alternativas, implementar a microtask autorizada e explicar o resultado. As decisões técnicas continuam sendo revisadas pelo desenvolvedor, que precisa compreender e defender as escolhas. Veja [desenvolvimento com IA](docs/ai-development.md) e as [regras de colaboração](AGENTS.md).

## Mapa do repositório

| Documento | Conteúdo |
| --- | --- |
| [`AGENTS.md`](AGENTS.md) | Regras de colaboração, aprendizado, arquitetura e engenharia |
| [`docs/product-requirements.md`](docs/product-requirements.md) | Problema, jornada, oportunidade, hipóteses e limites das afirmações |
| [`docs/architecture.md`](docs/architecture.md) | Direção arquitetural planejada |
| [`docs/ai-development.md`](docs/ai-development.md) | Como usar IA sem delegar decisões ou aprendizado |
| [`docs/concurrency.md`](docs/concurrency.md) | Princípios e plano de estudo de concorrência |
| [`docs/memory-management.md`](docs/memory-management.md) | Ownership, ciclo de vida e gerenciamento de memória |
| [`docs/project/ROADMAP.md`](docs/project/ROADMAP.md) | Trilha de entrega e plano de engenharia com 20 fases |
| [`docs/project/BACKLOG.md`](docs/project/BACKLOG.md) | Índice das microtarefas e prioridades |
| [`docs/project/CURRENT.md`](docs/project/CURRENT.md) | Fase, tarefa atual, estado e próximos passos |
| [`docs/project/GIT-WORKFLOW.md`](docs/project/GIT-WORKFLOW.md) | Branches, commits e revisão por pull request |
| [`docs/project/DEFINITION-OF-DONE.md`](docs/project/DEFINITION-OF-DONE.md) | Critérios de conclusão e revisão |
| [`docs/project/INTERVIEW-CHECKLIST.md`](docs/project/INTERVIEW-CHECKLIST.md) | Tópicos que o desenvolvedor estuda e explica |

## Estado atual

O repositório está na fase de descoberta do produto. A tarefa [`SUB-P00-001 — Definir o problema do produto`](docs/project/phases/PHASE-00-product-discovery.md) está em `REVIEW`; a próxima tarefa não começa até que o desenvolvedor revise e compreenda o resultado.

Ainda não há aplicação Swift. A proposta desta primeira etapa é estabelecer o problema, as decisões, o processo de trabalho e os critérios de qualidade antes de iniciar a implementação.
