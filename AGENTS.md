# Substi iOS — Regras de engenharia com IA

Estas regras orientam a colaboração no desafio técnico de iOS para uma posição sênior, especialista ou staff. O objetivo é construir uma aplicação pequena, profissional e defensável: cada decisão importante deve poder ser compreendida, explicada, testada e discutida em entrevista.

## Projeto e ambiente

- **Produto:** Substi — substituição inteligente de produtos de mercado.
- **Plataforma:** iOS 16 ou posterior; UIKit e SwiftUI.
- **Ambiente:** Mac Intel, Xcode 16.4, Swift 6.1 e Swift 6 Language Mode.
- Não introduza APIs que exijam uma versão mais recente de Xcode ou iOS sem autorização explícita.
- A proposta não afirma que o iFood não oferece substituições. Consulte `docs/product-requirements.md` para problema, hipóteses e limites das afirmações.

## Regra central: microtarefas

Não gere a aplicação inteira de uma vez. Trabalhe em microtarefas pequenas e revisáveis, identificadas em `docs/project/`.

Para cada tarefa:

1. Leia a tarefa, `CURRENT.md`, este arquivo e a documentação relacionada.
2. Explique o problema e apresente a menor solução razoável.
3. Mostre impacto na arquitetura, alternativas e trade-offs.
4. Liste os arquivos que pretende criar ou alterar.
5. Trabalhe exclusivamente no escopo autorizado; não avance para a próxima tarefa.
6. Teste quando aplicável e explique as mudanças, o fluxo e os conceitos envolvidos.
7. Verifique os critérios de aceite e mova o estado para `REVIEW` quando a implementação estiver pronta.
8. Aguarde a revisão do desenvolvedor. Só ele marca a tarefa como `DONE` após entender e aprovar o resultado.

Estados válidos: `TODO`, `READY`, `IN_PROGRESS`, `BLOCKED`, `REVIEW` e `DONE`. Mantenha no máximo uma tarefa em `IN_PROGRESS` e, quando necessário, apenas a próxima em `READY`. Um plano no backlog não autoriza sua implementação.

## Antes de uma implementação relevante

Apresente, de forma visual e em unidades curtas:

### Problema
Que necessidade esta mudança atende?

### Solução proposta
Qual é a menor mudança que resolve a necessidade?

### Por que
Por que essa abordagem faz sentido para o Substi?

### Alternativas e trade-offs
Que opções foram consideradas e o que cada escolha ganha ou perde?

### Arquivos
Quais arquivos serão criados ou alterados?

Implemente somente depois dessa explicação, quando a tarefa e a autorização estiverem claras.

## Depois da implementação

Explique:

- o que mudou e em quais arquivos;
- o fluxo de execução e a posição dos novos tipos na arquitetura;
- os conceitos Swift usados, quando aparecerem (`struct`/`class`, `let`/`var`, `enum`, `protocol`, generics, `associatedtype`, type erasure, `actor`, `Sendable`, `MainActor`, `async/await`);
- ownership e memória quando relevantes (`strong`, `weak`, `unowned`, ARC, retain cycles e captura de closures);
- executor/actor, concorrência, estado mutável compartilhado, risco de data race e cancelamento quando relevantes;
- como a mudança foi validada, incluindo testes e limitações;
- três a cinco perguntas de entrevista com respostas concisas, quando uma funcionalidade técnica for concluída.

Não use “funcionou” como explicação. O desenvolvedor precisa entender o comportamento, as decisões e como observar ou depurar o resultado.

## Estilo de aprendizagem visual

Gabriel aprende melhor por raciocínio visual e associação. Ao explicar arquitetura ou conceitos complexos, comece por:

- diagramas ASCII do fluxo de execução;
- árvores de dependências;
- comparações antes/depois ou lado a lado;
- linhas do tempo;
- analogias concretas;
- pequenos trechos de código conectados ao diagrama.

Use esta sequência quando fizer sentido:

```text
MODELO VISUAL → ANALOGIA → CONCEITO → CÓDIGO
              → FLUXO DE EXECUÇÃO → DEBUG/OBSERVAÇÃO → PERGUNTA DE ENTREVISTA
```

Para concorrência, desenhe uma linha do tempo. Para memória, mostre o grafo de ownership/referências. Para navegação, mostre telas e Coordinator. Para modularização, mostre o grafo de dependências. Para rede, mostre a transformação da requisição aos dados de domínio. Divida a explicação em unidades curtas; evite teoria longa antes de estabelecer o modelo visual.

## Direção de produto e entrega

O prazo documentado é 28 de setembro de 2026, às 11h, em `America/Sao_Paulo`. Consulte `docs/project/ROADMAP.md` e `CURRENT.md` para a trilha de entrega atualizada.

Priorize uma pequena jornada realista de substituição, clara e funcional, e decisões proporcionais ao prazo. Não tente implementar todas as 20 fases antes da entrega. Estudos sem benefício direto ficam como evolução futura. Não copie o iFood: pesquise princípios de design, padrões iOS e grocery/e-commerce, e defina uma identidade simples para o Substi.

## Arquitetura

Direção planejada: MVVM-C. O fluxo esperado de dependências é:

```text
View → ViewModel → Use Case → contrato de Repository
    → implementação do Repository → Data Source → APIClient

Coordinator → fluxo de navegação
```

- Views não fazem networking; ViewModels não conhecem `URLSession`.
- Domain não importa UIKit ou SwiftUI; Data não conhece detalhes de apresentação.
- O produto deve usar abstrações somente em limites que resolvam uma necessidade real.
- Não crie um protocolo para cada classe, `BaseViewController`, `BaseRepository`, `BaseViewModel`, Service Locator, dependências globais, Singleton desnecessário, objetos genéricos “Manager”, arquivos Utils gigantes ou cerimônia prematura de Clean Architecture.
- Prefira composição à herança. Use protocolos principalmente em fronteiras arquiteturais.
- Aplique SOLID de modo pragmático: responsabilidade clara (SRP), dependência de abstrações em limites adequados (DIP); não distorça o desenho para demonstrar princípios.
- Compare MVC, MVVM, MVVM-C, VIP e VIPER quando a tarefa pedir; registre trade-offs sem implementar padrões só para completar uma lista.

## Swift

- Prefira estado imutável e use `let` por padrão; use `var` quando mutação for necessária.
- Prefira `struct` para tipos de valor. Use `class` quando identidade, semântica de referência ou ciclo de vida de framework justificarem.
- Classes sem suporte intencional a herança normalmente devem ser `final`.
- Evite force unwrap e `try!`, salvo quando uma invariante específica e demonstrável tornar a operação segura.
- Não esconda complexidade em código gerado. Explique recursos avançados antes ou logo depois de introduzi-los.

## Memória e ownership

Considere quem cria, mantém e libera cada objeto importante. Analise o ciclo de vida de Coordinators, ViewControllers e ViewModels. Considere ARC, referências `strong`/`weak`/`unowned`, closures, captura de `self` e retain cycles.

Não adicione `[weak self]` automaticamente: explique por que uma referência fraca é necessária ou por que não é. Use `deinit` temporariamente durante investigação de memória quando ajudar; valide navegação com Memory Graph quando a implementação permitir.

## Concorrência

Swift Concurrency é o modelo principal. Use `async/await`, `Task`, `TaskGroup`, `MainActor`, `actor`, `Sendable` e cancelamento cooperativo somente quando a necessidade justificar.

- Não use `Task.detached` sem motivo forte.
- Não use `@unchecked Sendable` apenas para silenciar o compilador.
- Estado mutável da interface normalmente deve ser isolado apropriadamente, muitas vezes com `@MainActor`.
- Só introduza `TaskGroup` quando o conjunto de operações filhas for dinâmico e concorrência trouxer benefício demonstrável. Compare com execução sequencial, limite requisições e respeite rate limits.
- GCD é um laboratório de estudo separado, não o modelo principal do produto. Não misture GCD e Swift Concurrency sem necessidade concreta. Ao usar GCD, explique fila, QoS, sync/async, segurança entre threads e deadlock.

## Rede e dados

Use `URLSession`; não adicione Alamofire. O plano prevê integração com Open Food Facts. Estoque e disponibilidade do pedido são dados locais de demonstração: APIs públicas de produto não representam o inventário do iFood ou de uma loja. Respeite limites/rate limits e nunca faça testes automatizados dependerem da API ao vivo.

Introduza conceitos de rede gradualmente, conforme a tarefa pedir: `Endpoint`, `HTTPMethod`, `APIClient`, `URLSessionAPIClient`, `NetworkError`, DTO e Mapper. Nunca exponha DTO externo diretamente à apresentação:

```text
JSON da API → DTO → Mapper → modelo de domínio → modelo de apresentação (se necessário)
```

## Interface e design

- UIKit com View Code e Auto Layout é a direção do fluxo principal; não use Storyboards para telas de feature.
- SwiftUI demonstra adoção incremental e deve integrar ao fluxo UIKit por `UIHostingController`. SwiftUI não controla diretamente `UINavigationController`; Coordinator mantém a navegação.
- Consulte princípios, foundations e contratos de tela antes de implementar cada tela. Defina estados, ações e acessibilidade primeiro.
- Prefira soluções iOS nativas adequadas, System Font, Dynamic Type, SF Symbols, safe areas, semântica e gestos nativos.
- Compartilhe a linguagem visual entre UIKit e SwiftUI. Não espalhe valores arbitrários; adicione tokens e componentes somente quando uso e consistência justificarem.
- Acessibilidade e Dynamic Type pertencem à definição do componente, não a um acabamento posterior.

## Testes e TDD

Testar faz parte da implementação. Prefira Swift Testing para lógica unitária/integração quando suportado e XCTest/XCUIAutomation para interface e desempenho.

Áreas esperadas conforme o escopo: domínio, ranking, mapper, repository, ViewModel, rede, happy path da interface e snapshots selecionados. Testes automatizados não devem exigir Internet ao vivo.

Use TDD seletivamente; o mecanismo simples e determinístico de ranking é o candidato principal. Registre a evolução `RED → GREEN → REFACTOR` em commits focados. Não resolva testes assíncronos com pausas arbitrárias (`sleep()`); prefira fixtures determinísticas, dependências injetadas, expectations e argumentos de lançamento.

## Observabilidade e desempenho

- Prefira ferramentas Apple; introduza `Logger`/OSLog, signposts e abstrações de analytics/crash reporting somente conforme necessidade.
- Não use `print()` como logging de produção e nunca registre dados sensíveis.
- Não alegue otimização sem medição. Quando otimizar, registre baseline/problema, medição, alteração e resultado.
- Ferramentas de estudo possíveis: Time Profiler, Allocations, Leaks, Network, Memory Graph, Thread Sanitizer e Main Thread Checker.

## Dependências, automação e evolução

- Use Swift Package Manager quando um pacote for necessário; não adicione dependências externas sem explicar por que APIs nativas não bastam e sem autorização explícita.
- Não adicione CocoaPods a este projeto novo. Documente quando ainda aparece em bases maduras/legadas.
- Não introduza Bazel ou Buck. Estude seu valor para grafos de build grandes, monorepos, cache e builds reproduzíveis.
- SwiftLint deve ter regras intencionais e compreensíveis, não uma configuração enorme copiada.
- CI poderá validar build, lint e testes; Fastlane pode encapsular comandos mais tarde. Não configure distribuição de produção ou assinatura da App Store sem pedido explícito.
- Objective-C, MetricKit, Firebase, Crashlytics, Remote Config, CD, Core ML, cache sofisticado e laboratórios extensos são evolução futura, salvo se o escopo da entrega justificar.

## Git e commits

`main` é a branch principal de integração. Crie uma branch para cada tarefa ou mudança estreitamente relacionada, a partir da `main` atualizada; não desenvolva diretamente em `main` nem faça force-push. Proponha mudanças à `main` por pull request para revisão.

Use os prefixos de `docs/project/GIT-WORKFLOW.md`: `feature/` para capacidade nova, `bugfix/` para corrigir comportamento existente e `docs/`, `refactor/`, `test/` ou `chore/` conforme o tipo de alteração. Inclua o ID da tarefa quando existir e mantenha a branch focada.

Commits seguem Conventional Commits: `<tipo>(<escopo-opcional>): <resumo imperativo curto>`. Cada commit representa uma decisão compreensível. Apresente a sugestão de commit e seu escopo antes de commitar; não faça commit sem autorização explícita do desenvolvedor. Não acumule mudanças de tasks sem relação.

## Documentação e decisões

Mantenha README, requisitos do produto, arquitetura, desenvolvimento com IA, concorrência, memória e `docs/project/` coerentes com o estado real. Decisões arquiteturais importantes devem gerar ADR com Contexto, Decisão, Alternativas, Consequências e Trade-offs.

Para funcionalidades relevantes, registre como a IA ajudou, as alternativas consideradas e como o desenvolvedor validou a escolha. A IA pode pesquisar, organizar opções, rascunhar uma mudança pequena e apontar perguntas; Gabriel verifica fontes, decide, valida e explica.

## Pronto para revisão

Uma microtask só está pronta para revisão quando, conforme aplicável:

- o comportamento exigido foi implementado e é compreensível;
- testes relevantes passam e avisos do compilador foram compreendidos;
- ownership, concorrência, acessibilidade e observabilidade foram considerados;
- documentação e critérios de aceite foram atualizados;
- alternativas e trade-offs foram explicados;
- o desenvolvedor recebeu uma explicação e consegue defender a solução.

Considere um item não aplicável quando o impacto não existir; não invente complexidade. Use `REVIEW` para aguardar Gabriel. Só ele conclui a tarefa como `DONE`.

## Princípio final

Não otimize para parecer sofisticado. Otimize para clareza, correção, manutenção, teste, observabilidade, arquitetura proporcional e capacidade de explicar cada decisão. O desenvolvedor deve ser dono intelectual do código, mesmo quando a IA o escreve.
