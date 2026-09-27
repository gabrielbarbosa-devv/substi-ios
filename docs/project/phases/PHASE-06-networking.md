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

Estado: READY

Prioridade: P0

Depende de:
SUB-P06-004

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Definir APIClient.

### Objetivo
Concluir Definir APIClient dentro do escopo definido e deixar o resultado pronto para revisão.

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
- Que problema “Definir APIClient” resolve e por que esta abordagem é adequada?
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

## SUB-P06-007 — Implementar requisição com URLSession

Estado: TODO

Prioridade: P0

Depende de:
SUB-P06-006

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Implementar requisição com URLSession.

### Objetivo
Concluir Implementar requisição com URLSession dentro do escopo definido e deixar o resultado pronto para revisão.

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
- Que problema “Implementar requisição com URLSession” resolve e por que esta abordagem é adequada?
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

## SUB-P06-008 — Definir NetworkError

Estado: TODO

Prioridade: P0

Depende de:
SUB-P06-007

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Definir NetworkError.

### Objetivo
Concluir Definir NetworkError dentro do escopo definido e deixar o resultado pronto para revisão.

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
- Que problema “Definir NetworkError” resolve e por que esta abordagem é adequada?
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
