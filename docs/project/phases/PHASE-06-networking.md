# FASE 06 — Networking

## Objetivo
Criar um cliente URLSession limitado e respeitar as restrições da API externa.

## Resultado esperado
Uma consulta testável a produtos, DTO e mapeamento, com rate limits considerados.

## Dependências
Resultados pertinentes da FASE 05.

## Prioridade
Consulte as prioridades das tasks. Trabalho P1/P2 não pode comprometer a entrega essencial P0.

## Estado
IN_PROGRESS

## SUB-P06-001 — Estudar API Open Food Facts

Estado: DONE

Prioridade: P0

Depende de:
- Nenhuma

### Contexto
Antes de definir a requisição, precisamos escolher a superfície da API compatível com o protótipo e registrar limites que afetam o fluxo de alternativas.

### Objetivo
Registrar a documentação oficial consultada, a operação adequada ao primeiro protótipo e as limitações relevantes para produto e entrega.

### Requisitos
- API v3 é a versão atual recomendada pela documentação oficial para integrações novas; v2 permanece disponível, mas está depreciada.
- A leitura de um produto por código de barras usa `GET /api/v3/product/{code}`.
- Busca textual não está disponível na API v3; busca estruturada continua na v2. Não escolher um mecanismo de busca nesta task.
- A documentação limita leituras de produto a 15 requisições por minuto por IP; para chamadas diretas de aplicativo móvel, o limite aplica-se por usuário.
- As requisições devem identificar o aplicativo com um `User-Agent` próprio.
- Dados enviados pela comunidade podem estar incompletos ou incorretos e não representam estoque nem disponibilidade de uma loja.
- As opções de substituição do protótipo precisam vir de um inventário local controlado; a API pública não fornece o estoque da loja.
- Não chamar a API ao vivo em testes automatizados.

### Critérios de aceite
- [x] A versão e o endpoint consultados estão registrados com links oficiais.
- [x] Limites de busca, rate limit, identificação e qualidade dos dados estão explícitos.
- [x] Está registrado que a API não é fonte de disponibilidade local.

### Conceitos de engenharia
HTTP, URLSession, DTO, mapping, generics, associated types, rate limits.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Estudar API Open Food Facts” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisão da documentação oficial vinculada abaixo; nenhuma chamada de rede é necessária nesta tarefa.

### Referências consultadas
- [Introdução à API Open Food Facts](https://openfoodfacts.github.io/documentation/docs/Product-Opener/api/) — versões, rate limits, identificação e avisos sobre os dados.
- [Leitura de produto pela API v3](https://openfoodfacts.github.io/documentation/docs/Product-Opener/v3/products/get-api-v3-product-code/) — `GET /api/v3/product/{code}` e parâmetros.
- [Cheatsheet oficial](https://openfoodfacts.github.io/openfoodfacts-server/api/ref-cheatsheet/) — busca estruturada disponível em v2 e limites atuais de busca.

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
- [x] Fontes primárias consultadas e limites documentados para orientar o próximo código de rede.
- [x] Nenhuma suposição sobre estoque ou busca de alternativas foi apresentada como capacidade da API.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P06-002 — Inspecionar JSON de código de barras

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P06-001

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Inspecionar JSON de código de barras.

### Objetivo
Concluir Inspecionar JSON de código de barras dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
HTTP, URLSession, DTO, mapping, generics, associated types, rate limits.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Inspecionar JSON de código de barras” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar fixtures de URLProtocol para sucesso/erro HTTP, dados malformados, falhas de transporte e rate limits. Não testar contra a API ao vivo.

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

## SUB-P06-003 — Definir Endpoint

Estado: DONE

Prioridade: P0

Depende de:
- SUB-P06-001

### Contexto
O cliente futuro precisa receber a URL correta de cada chamada sem espalhar composição de caminhos e parâmetros por outras camadas.

### Objetivo
Representar os componentes necessários para formar uma URL de requisição e fornecer o endpoint de leitura de produto por código de barras.

### Requisitos
- Criar `Endpoint` na camada de dados/rede, com caminho e parâmetros de consulta, recebendo a URL base na hora de compor a URL.
- Definir o endpoint Open Food Facts v3 para leitura por código de barras conforme a documentação oficial.
- Construir a URL com `URLComponents`, preservando codificação correta dos parâmetros.
- Não criar `URLSession`, `APIClient`, DTO, Mapper ou comportamento de retry nesta task.

### Critérios de aceite
- [x] Endpoint constrói URL de produto a partir de uma base URL e código de barras.
- [x] Parâmetros de consulta são codificados pela API Foundation, sem concatenação manual de query string.
- [x] Os três testes de rede local passam sem acessar a rede.

### Conceitos de engenharia
HTTP, URLSession, DTO, mapping, generics, associated types, rate limits.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir Endpoint” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Testes unitários determinísticos para caminho e codificação de parâmetros. Não executar requisições HTTP.

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
- `Substi/Data/Networking/Endpoint.swift`
- `SubstiTests/NetworkingPrimitivesTests.swift`
- `docs/project/phases/PHASE-06-networking.md`
- `docs/project/BACKLOG.md`
- `docs/project/CURRENT.md`

### Critérios para conclusão
- [x] URL formada e coberta por teste local.
- [x] Nenhuma requisição, sessão ou regra de negócio foi introduzida.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P06-004 — Definir HTTPMethod

Estado: DONE

Prioridade: P0

Depende de:
SUB-P06-003

### Contexto
O endpoint declara a intenção HTTP para que a camada que executará a requisição não precise inferir o verbo a partir do caminho.

### Objetivo
Representar explicitamente o método HTTP de leitura usado pelo fluxo atual.

### Requisitos
- Criar `HTTPMethod` como enum RawRepresentable por `String`.
- Incluir somente `GET`, pois o protótipo consulta dados e não altera registros na API.
- Associar o endpoint de produto ao método `GET`.
- Não adicionar verbos sem uso atual ou implementação de APIClient.

### Critérios de aceite
- [x] `HTTPMethod.get` fornece o valor wire `GET`.
- [x] O endpoint de leitura declara `GET` explicitamente.
- [x] O tipo não inclui operações de escrita sem necessidade do produto.

### Conceitos de engenharia
HTTP, URLSession, DTO, mapping, generics, associated types, rate limits.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir HTTPMethod” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Teste unitário determinístico para o valor raw e o método presente no endpoint.

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
- `Substi/Data/Networking/HTTPMethod.swift`
- `Substi/Data/Networking/Endpoint.swift`
- `SubstiTests/NetworkingPrimitivesTests.swift`
- `docs/project/phases/PHASE-06-networking.md`
- `docs/project/BACKLOG.md`
- `docs/project/CURRENT.md`

### Critérios para conclusão
- [x] Método explícito e usado pelo endpoint de leitura.
- [x] O método `GET` raw value e a associação ao endpoint passam nos testes locais.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P06-005 — Estudar associated types e generics

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P06-004

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Estudar associated types e generics.

### Objetivo
Concluir Estudar associated types e generics dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
HTTP, URLSession, DTO, mapping, generics, associated types, rate limits.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Estudar associated types e generics” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar fixtures de URLProtocol para sucesso/erro HTTP, dados malformados, falhas de transporte e rate limits. Não testar contra a API ao vivo.

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

## SUB-P06-006 — Definir APIClient

Estado: REVIEW

Prioridade: P0

Depende de:
SUB-P06-004

### Contexto
A camada de aplicação precisa pedir dados HTTP sem conhecer URLSession. Um contrato pequeno deixa o transporte substituível em testes e define um limite real entre chamada e execução de rede.

### Objetivo
Definir APIClient como contrato assíncrono que recebe Endpoint e devolve os bytes da resposta.

### Requisitos
- Declarar `APIClient` como protocolo `Sendable` com `data(for:) async throws -> Data`.
- Não incluir serialização JSON, DTO, retry ou regra de produto.
- Manter a implementação concreta separada do contrato.

### Critérios de aceite
- [x] O contrato recebe um `Endpoint` e expõe dados ou erro por `async throws`.
- [x] O protocolo não importa conceitos de tela, domínio ou implementação concreta.
- [x] A implementação concreta pode ser substituída por uma fixture de teste.

### Conceitos de engenharia
HTTP, URLSession, DTO, mapping, generics, associated types, rate limits.

### Estudar antes da implementação
Revisar protocolo como fronteira de dependência, `async throws` e por que APIClient retorna bytes nesta etapa, sem prometer um desenho genérico de decodificação.

### Perguntas que preciso saber responder
- Por que a camada de aplicação depende de APIClient em vez de URLSession diretamente?
- O que `async throws -> Data` promete e o que deixa para outra camada?
- Por que um protocolo é útil nesta fronteira e onde seria abstração prematura?

### Validação
Compilação do app e teste do cliente concreto por sessão URLProtocol local. Nenhuma chamada à API pública.

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
- `Substi/Data/Networking/APIClient.swift`
- `Substi/Data/Networking/URLSessionAPIClient.swift`
- `SubstiTests/NetworkingPrimitivesTests.swift`
- `docs/project/phases/PHASE-06-networking.md`
- `docs/project/BACKLOG.md`
- `docs/project/CURRENT.md`

### Critérios para conclusão
- [x] O contrato contém somente a operação de dados necessária ao fluxo atual.
- [x] O cliente concreto conforma ao contrato e é coberto por testes locais.
- [x] Documentação e estado atualizados; a implementação está em `REVIEW` para Gabriel.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P06-007 — Implementar requisição com URLSession

Estado: REVIEW

Prioridade: P0

Depende de:
SUB-P06-006

### Contexto
O endpoint e o contrato estão definidos. Falta transformar esses dados numa URLRequest e executar a chamada com o cliente de rede nativo do iOS.

### Objetivo
Executar uma requisição HTTP com URLSession e retornar bytes apenas para respostas HTTP 2xx.

### Requisitos
- Implementar `URLSessionAPIClient` conforme `APIClient`.
- Receber base URL, `User-Agent` e URLSession por inicialização; usar `.shared` como padrão de sessão.
- Compor URL pelo `Endpoint`, definir método HTTP e cabeçalho `User-Agent`.
- Rejeitar respostas não HTTP e status fora de 200..<300.
- Não adicionar retry, cache, decodificação ou chamada à API ao vivo.

### Critérios de aceite
- [x] A URLRequest usa caminho e método declarados pelo Endpoint.
- [x] A requisição envia o User-Agent configurado.
- [x] Resposta 2xx retorna os bytes; status fora de 2xx vira erro tipado.
- [x] Testes usam URLProtocol local e não dependem de Internet.

### Conceitos de engenharia
HTTP, URLSession, DTO, mapping, generics, associated types, rate limits.

### Estudar antes da implementação
Revisar URLRequest, URLSession.data(for:), status HTTP e injeção de dependência. Distinguir erro de transporte, resposta HTTP e conteúdo da resposta.

### Perguntas que preciso saber responder
- Quem constrói URLRequest e quem executa o transporte?
- Por que conferir HTTPURLResponse e o intervalo de status?
- O que é injetado, quem mantém a referência à sessão e qual é o ciclo de vida?
- Por que configurar User-Agent e como o teste evita rede real?

### Validação
Testes determinísticos com URLProtocol para sucesso HTTP e HTTP 429; executar toda a suíte de testes unitários.

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
- `Substi/Data/Networking/URLSessionAPIClient.swift`
- `SubstiTests/NetworkingPrimitivesTests.swift`
- `docs/project/phases/PHASE-06-networking.md`
- `docs/project/BACKLOG.md`
- `docs/project/CURRENT.md`

### Critérios para conclusão
- [x] Sucesso e status 429 são verificados com transporte local.
- [x] Não há retry, parsing JSON ou dependência da disponibilidade externa.
- [x] Documentação atualizada e mudança pronta para revisão.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P06-008 — Definir NetworkError

Estado: REVIEW

Prioridade: P0

Depende de:
SUB-P06-007

### Contexto
O chamador precisa diferenciar URL inválida, resposta incompatível, rejeição HTTP e falha de transporte para apresentar ou tratar cada caso conscientemente.

### Objetivo
Representar as falhas mínimas do transporte em `NetworkError` e lançá-las pelo APIClient.

### Requisitos
- Definir casos para URL inválida, resposta não HTTP, status HTTP não 2xx e URLError de transporte.
- Preservar o código HTTP ou o URLError original.
- Não incluir erros de decodificação ou domínio antes de existir esse fluxo.

### Critérios de aceite
- [x] Falhas de transporte são representadas por erro tipado.
- [x] Status HTTP é preservado no erro.
- [x] O cliente distingue resposta não HTTP, falha HTTP e falha URLSession.

### Conceitos de engenharia
HTTP, URLSession, DTO, mapping, generics, associated types, rate limits.

### Estudar antes da implementação
Revisar enum de erros, erros lançados por URLSession e a diferença entre status HTTP e falha de transporte.

### Perguntas que preciso saber responder
- Por que 429 é uma resposta HTTP e não um erro de conexão?
- Que informação preservamos em cada caso?
- Onde erros de parsing e de domínio serão adicionados quando houver DTO e Mapper?

### Validação
Validar status 429 com URLProtocol; inspecionar os caminhos de erro e compilar a aplicação.

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
- `Substi/Data/Networking/NetworkError.swift`
- `Substi/Data/Networking/URLSessionAPIClient.swift`
- `SubstiTests/NetworkingPrimitivesTests.swift`
- `docs/project/phases/PHASE-06-networking.md`
- `docs/project/BACKLOG.md`
- `docs/project/CURRENT.md`

### Critérios para conclusão
- [x] Os quatro casos de erro do transporte estão tipados e usados onde aplicável.
- [x] O status HTTP fica acessível ao chamador.
- [x] Escopo não inclui erros de JSON/domínio; estado atualizado para `REVIEW`.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P06-009 — Definir DTO

Estado: TODO

Prioridade: P0

Depende de:
SUB-P06-008

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Definir DTO.

### Objetivo
Concluir Definir DTO dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
HTTP, URLSession, DTO, mapping, generics, associated types, rate limits.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir DTO” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar fixtures de URLProtocol para sucesso/erro HTTP, dados malformados, falhas de transporte e rate limits. Não testar contra a API ao vivo.

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

## SUB-P06-010 — Mapear DTO para Product

Estado: TODO

Prioridade: P0

Depende de:
SUB-P06-009

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Mapear DTO para Product.

### Objetivo
Concluir Mapear DTO para Product dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
HTTP, URLSession, DTO, mapping, generics, associated types, rate limits.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Mapear DTO para Product” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar fixtures de URLProtocol para sucesso/erro HTTP, dados malformados, falhas de transporte e rate limits. Não testar contra a API ao vivo.

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

## SUB-P06-011 — Testar com URLProtocol

Estado: TODO

Prioridade: P0

Depende de:
SUB-P06-010

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Testar com URLProtocol.

### Objetivo
Concluir Testar com URLProtocol dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
HTTP, URLSession, DTO, mapping, generics, associated types, rate limits.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Testar com URLProtocol” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar fixtures de URLProtocol para sucesso/erro HTTP, dados malformados, falhas de transporte e rate limits. Não testar contra a API ao vivo.

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

## SUB-P06-012 — Definir limite de candidatos e rate limits

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P06-011

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Definir limite de candidatos e rate limits.

### Objetivo
Concluir Definir limite de candidatos e rate limits dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
HTTP, URLSession, DTO, mapping, generics, associated types, rate limits.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir limite de candidatos e rate limits” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar fixtures de URLProtocol para sucesso/erro HTTP, dados malformados, falhas de transporte e rate limits. Não testar contra a API ao vivo.

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
