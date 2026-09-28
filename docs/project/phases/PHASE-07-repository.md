# FASE 07 — Repository

## Objetivo
Separar acesso ao inventário local e a produtos remotos por fronteiras justificadas.

## Resultado esperado
Composição mínima de fontes de dados que atenda ao fluxo e aos testes.

## Dependências
Resultados pertinentes da FASE 06.

## Prioridade
Consulte as prioridades das tasks. Trabalho P1/P2 não pode comprometer a entrega essencial P0.

## Estado
REVIEW

## SUB-P07-001 — Definir ProductRepository

Estado: REVIEW

Prioridade: P0

Depende de:
- Nenhuma

### Contexto
O fluxo precisa de um limite no domínio para solicitar produtos externos sem fazer Domain depender de URLSession, DTOs ou Open Food Facts.

### Objetivo
Definir o contrato mínimo que permite buscar um Product por código de barras.

### Requisitos
- Declarar `ProductRepository` em Domain, recebendo um código de barras e retornando `Product` de forma assíncrona.
- Propagar falhas com `throws`; o contrato não conhece tipos específicos da Open Food Facts.
- Não criar implementação, cache, camada de datasource ou generic repository nesta tarefa.

### Critérios de aceite
- [x] O contrato está em Domain e expressa busca assíncrona por código de barras.
- [x] Domain retorna `Product` e não depende de transporte ou DTO externo.
- [x] Implementação e cache ficaram para tasks próprias.

### Conceitos de engenharia
Repository, data sources, fixtures, cache, dependency inversion.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir ProductRepository” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Verificar compilação do contrato junto ao target; a implementação será testada em SUB-P07-005. Nenhuma chamada de rede nesta task.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
- `Substi/Domain/Repositories/ProductRepository.swift`
- `docs/project/phases/PHASE-07-repository.md`
- `docs/project/BACKLOG.md`
- `docs/project/CURRENT.md`

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P07-002 — Definir InventoryRepository

Estado: REVIEW

Prioridade: P0

Depende de:
SUB-P07-001

### Contexto
O pedido e as alternativas do protótipo são dados locais de demonstração; precisam de um limite de leitura distinto do catálogo remoto.

### Objetivo
Definir o contrato mínimo para ler o pedido atual e as alternativas associadas ao produto indisponível.

### Requisitos
- Declarar `InventoryRepository` em Domain, retornando `Order` e candidatos por `ProductID`.
- Manter o contrato independente da fonte local concreta e da API pública.
- Não adicionar persistência, estoque real ou operação de confirmação/alteração do pedido.

### Critérios de aceite
- [x] O contrato separa leitura do pedido e candidatos da consulta de catálogo remoto.
- [x] A consulta de candidatos usa o identificador do produto original.
- [x] O contrato não sugere que dados de demonstração representem estoque de loja.

### Conceitos de engenharia
Repository, data sources, fixtures, cache, dependency inversion.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir InventoryRepository” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
O contrato é validado junto ao target; fixtures que o alimentarão são verificadas em SUB-P07-003. Sem rede.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
- `Substi/Domain/Repositories/InventoryRepository.swift`
- `docs/project/phases/PHASE-07-repository.md`
- `docs/project/BACKLOG.md`
- `docs/project/CURRENT.md`

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P07-003 — Criar fixtures de inventário

Estado: REVIEW

Prioridade: P0

Depende de:
SUB-P07-002

### Contexto
O fluxo demonstrável precisa de um pedido previsível e alternativas com dados comparáveis. A API de catálogo não fornece disponibilidade de loja.

### Objetivo
Criar dados locais mínimos de demonstração para um leite indisponível e duas opções substitutas.

### Requisitos
- Manter as fixtures fora dos modelos Domain e nomeá-las como dados de demonstração.
- Incluir pedido original e candidatos com categoria e quantidade comparáveis e marcas distintas.
- Não representar estoque real, preço, disponibilidade remota ou ranking novo.

### Critérios de aceite
- [x] Fixture local contém um item original e duas alternativas comparáveis.
- [x] Testes confirmam categoria, quantidade e marcas distintas sem rede externa.
- [x] Produto desconhecido não possui lista de candidatos na fixture.

### Conceitos de engenharia
Repository, data sources, fixtures, cache, dependency inversion.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Criar fixtures de inventário” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Typecheck e execução isolada da fixture passaram com Swift 6.1.2; os testes do target foram escritos, mas `xcodebuild test` não iniciou porque o developer directory aponta para Command Line Tools sem `xcodebuild`/Simulator. Executar `SubstiTests` no iPhone 16 Simulator quando Xcode estiver selecionado.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
- `Substi/Data/Fixtures/InventoryFixtures.swift`
- `SubstiTests/InventoryFixturesTests.swift`
- `docs/project/phases/PHASE-07-repository.md`
- `docs/project/BACKLOG.md`
- `docs/project/CURRENT.md`

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P07-004 — Definir fontes locais/remotas

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P07-003

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Definir fontes locais/remotas.

### Objetivo
Concluir Definir fontes locais/remotas dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Repository, data sources, fixtures, cache, dependency inversion.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir fontes locais/remotas” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar fixtures para testar cache e respostas remotas sem depender da API ao vivo.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
Somente arquivos pertinentes à fase; confirmar os caminhos exatos antes de implementar. Esta tarefa de planejamento não cria arquivos de implementação.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P07-005 — Implementar composição do Repository

Estado: REVIEW

Prioridade: P0

Depende de:
Nenhuma

### Contexto
Os contratos de domínio já existem, assim como o cliente HTTP, o DTO, o Mapper e as fixtures locais. Falta conectar essas peças sem permitir que Domain dependa da API ou da implementação local.

### Objetivo
Implementar um repositório remoto de produtos Open Food Facts e um repositório local de inventário de demonstração, cada um na camada Data.

### Requisitos
- `OpenFoodFactsProductRepository` recebe `APIClient`, solicita o endpoint existente pelo código de barras, decodifica o DTO e usa o Mapper para retornar `Product`.
- `DemoInventoryRepository` lê o pedido e candidatos de `InventoryFixtures`; produto desconhecido retorna uma lista vazia.
- Domain continua dependendo somente dos contratos e modelos próprios; implementações concretas ficam em `Data/Repositories`.
- Não adicionar cache, persistência, ranking, estoque real, acesso a `URLSession` dentro de Domain nem um container genérico de dependências.

### Critérios de aceite
- [x] O repositório remoto transforma a resposta da API no `Product` de domínio usando DTO e Mapper existentes.
- [x] O repositório local retorna o pedido e os candidatos das fixtures, sem sugerir disponibilidade de loja.
- [x] Os dois repositórios podem ser usados por meio dos protocolos de Domain, sem acoplamento entre as fontes.
- [x] Testes usam dados locais/`URLProtocol`, sem chamar a API ao vivo.

### Conceitos de engenharia
Repository, data sources, fixtures, cache, dependency inversion.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Implementar composição do Repository” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Typecheck dos tipos de produção em Swift 6 Language Mode passou; parse dos arquivos Swift de teste passou; verificação executável isolada confirmou mapeamento e fixtures. Os testes do target ainda não foram executados: `xcode-select` aponta para Command Line Tools sem `xcodebuild`, Simulator ou módulo `Testing`. Nenhuma chamada à API ao vivo.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
- `Substi/Data/Repositories/OpenFoodFactsProductRepository.swift`
- `Substi/Data/Repositories/DemoInventoryRepository.swift`
- `SubstiTests/ProductRepositoryTests.swift`
- `SubstiTests/InventoryFixturesTests.swift`
- `SubstiTests/NetworkingPrimitivesTests.swift`
- `docs/project/phases/PHASE-07-repository.md`
- `docs/project/BACKLOG.md`
- `docs/project/CURRENT.md`

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P07-006 — Escolher cache em memória

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P07-005

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Escolher cache em memória.

### Objetivo
Concluir Escolher cache em memória dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Repository, data sources, fixtures, cache, dependency inversion.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Escolher cache em memória” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar fixtures para testar cache e respostas remotas sem depender da API ao vivo.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
Somente arquivos pertinentes à fase; confirmar os caminhos exatos antes de implementar. Esta tarefa de planejamento não cria arquivos de implementação.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P07-007 — Testar acerto e falha de cache

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P07-006

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Testar acerto e falha de cache.

### Objetivo
Concluir Testar acerto e falha de cache dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Repository, data sources, fixtures, cache, dependency inversion.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Testar acerto e falha de cache” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar fixtures para testar cache e respostas remotas sem depender da API ao vivo.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
Somente arquivos pertinentes à fase; confirmar os caminhos exatos antes de implementar. Esta tarefa de planejamento não cria arquivos de implementação.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P07-008 — Testar resultados remotos

Estado: REVIEW

Prioridade: P0

Depende de:
- SUB-P07-005

### Contexto
O caminho remoto precisa ser verificado de ponta a ponta sem depender da disponibilidade, do rate limit ou do conteúdo mutável da API pública.

### Objetivo
Testar que uma resposta HTTP simulada percorre APIClient, DTO, Mapper e ProductRepository até produzir um produto de domínio.

### Requisitos
- Usar `URLProtocol` local para verificar caminho e método da requisição e fornecer resposta JSON controlada.
- Verificar o produto de domínio produzido e os erros relevantes para status HTTP e dados obrigatórios ausentes/malformados.
- Não fazer chamadas à API ao vivo, adicionar retry ou testar estoque de loja.

### Critérios de aceite
- [x] O teste de integração confirma o caminho HTTP → DTO → Mapper → ProductRepository.
- [x] Falhas HTTP e de parsing/mapeamento são cobertas com respostas controladas.
- [x] A suíte não depende de rede externa nem de dados variáveis da API pública.

### Conceitos de engenharia
Repository, data sources, fixtures, cache, dependency inversion.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Testar resultados remotos” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Os casos foram adicionados/ajustados, e a sintaxe dos testes foi validada. A execução do target SubstiTests aguarda ambiente com Xcode, pois este ambiente não possui `xcodebuild`, Simulator ou módulo `Testing` selecionado.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
Somente arquivos pertinentes à fase; confirmar os caminhos exatos antes de implementar. Esta tarefa de planejamento não cria arquivos de implementação.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P07-009 — Revisar inversão de dependências

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P07-008

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Revisar inversão de dependências.

### Objetivo
Concluir Revisar inversão de dependências dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Repository, data sources, fixtures, cache, dependency inversion.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Revisar inversão de dependências” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar fixtures para testar cache e respostas remotas sem depender da API ao vivo.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
A IA pode pesquisar, organizar alternativas, redigir uma mudança pequena e apontar perguntas. Gabriel decide, valida e explica o resultado.

### Arquivos esperados
Somente arquivos pertinentes à fase; confirmar os caminhos exatos antes de implementar. Esta tarefa de planejamento não cria arquivos de implementação.

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P07-010 — Atualizar pedido demonstrativo após confirmação

Estado: REVIEW

Prioridade: P0

Depende de:
- SUB-P07-002
- SUB-P07-003

### Contexto
O fluxo precisa refletir a escolha confirmada ao retornar ao pedido. Até aqui o contrato do repositório oferecia somente leitura, então a tela não podia afirmar que uma substituição foi concluída.

### Objetivo
Permitir que o repositório local de demonstração substitua um item pelo candidato escolhido e mantenha a alteração durante a sessão atual.

### Requisitos
- Adicionar ao contrato de inventário uma operação explícita de confirmação.
- Aceitar somente candidatos associados ao produto original na fixture.
- Preservar a referência ao produto original no `OrderItem` atualizado e não inventar preço para o candidato.
- Manter a atualização somente em memória; não introduzir persistência nem representar uma alteração de pedido de loja real.

### Critérios de aceite
- [x] O pedido local passa a conter o candidato confirmado e a referência ao produto substituído.
- [x] Candidato inválido ou item original ausente não altera o pedido e retorna falha representável.
- [x] O preço ausente do candidato continua ausente.
- [x] A atualização é declaradamente limitada à sessão atual e às fixtures.
- [x] Build do app passa no Xcode 16.4 para iOS Simulator.

### Conceitos de engenharia
Repository boundary, estado mutável encapsulado, valor de retorno opcional e value semantics.

### Estudar antes da implementação
Revisar por que uma operação de escrita pertence à fronteira do inventário, quem mantém o estado em memória e como a validação protege a fixture.

### Perguntas que preciso saber responder
- Por que o contrato do repositório precisou de uma operação de confirmação?
- Por que o armazenamento é uma classe com estado interno nesta fixture?
- Como sabemos que a opção confirmada pertence ao item original?
- O que se perde quando o processo é encerrado?

### Validação
Compilar o app. A operação é síncrona e usa somente dados locais; não requer API ao vivo.

### Observabilidade
Not applicable for this task.

### Considerações de memória
O Coordinator mantém o repositório durante a sessão; ele deixa de ser mantido junto com o grafo principal do app. Não há ciclo de referência criado pela operação.

### Considerações de concorrência
A operação é síncrona e chamada pelo Coordinator no fluxo principal. Nenhum trabalho concorrente é introduzido.

### Acessibilidade
Not applicable for this task.

### Uso de IA
A IA organizou a operação mínima e apontou o limite entre dados demonstrativos e estoque real; Gabriel revisa a mutação e o ciclo de vida do estado.

### Arquivos esperados
- `Substi/Domain/Models/OrderItem.swift`
- `Substi/Domain/Repositories/InventoryRepository.swift`
- `Substi/Data/Repositories/DemoInventoryRepository.swift`
- `docs/project/phases/PHASE-07-repository.md`
- `docs/project/BACKLOG.md`
- `docs/project/CURRENT.md`

### Critérios para conclusão
- [ ] Critérios de aceite atendidos e evidências revisadas por Gabriel.
- [ ] Verificações aplicáveis passam; o que não se aplica está justificado.
- [ ] Documentação e estado atualizados; Gabriel explica o resultado e os trade-offs.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar por que a alteração local não comprova estoque nem confirma uma operação em serviço de mercado.
