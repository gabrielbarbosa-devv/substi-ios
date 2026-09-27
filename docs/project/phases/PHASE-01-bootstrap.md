# FASE 01 — Preparação inicial (Bootstrap)

## Objetivo
Criar e validar a base mínima de um app iOS nativo e o primeiro marco Git revisado.

## Resultado esperado
Projeto Xcode configurado e compilável, targets necessários e processo Git estabelecido.

## Dependências
Resultados pertinentes da FASE 00.

## Prioridade
Consulte as prioridades das tasks. Trabalho P1/P2 não pode comprometer a entrega essencial P0.

## Estado
IN_PROGRESS

## SUB-P01-001 — Criar projeto Xcode

Estado: DONE

Prioridade: P0

Depende de:
- Nenhuma

### Contexto
O projeto Xcode inicial já existia na pasta de trabalho, mas fora do clone Git. Sem colocá-lo no repositório, o app e seus arquivos não poderiam ser revisados nem enviados ao GitHub junto com o planejamento.

### Objetivo
Colocar o projeto iOS inicial na raiz versionada do repositório e confirmar que o target do app compila com a toolchain planejada.

### Requisitos
- Manter `Substi.xcodeproj` e os arquivos iniciais do app dentro do clone Git.
- Preservar o target iOS e a estrutura criada pelo Xcode; não adicionar funcionalidades do produto nesta task.
- Validar que o scheme `Substi` aparece no Xcode e que o target do app compila.
- Deixar deployment target e Swift 6 Language Mode para `SUB-P01-002` e `SUB-P01-003`.
- Não versionar estado de interface nem configurações pessoais do Xcode.

### Critérios de aceite
- [x] Projeto Xcode, app, assets e targets estão dentro do repositório.
- [x] O Xcode 16.4 reconhece o scheme `Substi`.
- [x] O target do app compila para um simulador iOS.
- [x] Nenhuma funcionalidade do produto foi adicionada nesta task.
- [x] Gabriel revisou e integrou o projeto inicial pelo PR #5.

### Conceitos de engenharia
Projeto Xcode, project/workspace, scheme, target, arquivos sincronizados, build e versionamento Git.

### Estudar antes da implementação
Entender como o `.xcodeproj` descreve o projeto, como o scheme escolhe targets e ações de build, e por que arquivos de usuário do Xcode não devem ser compartilhados.

### Perguntas que preciso saber responder
- Qual é a diferença entre project, target e scheme no Xcode?
- Por que os arquivos do app precisam estar dentro do clone Git para serem revisáveis?
- O que este build confirma e quais configurações ainda serão feitas nas tasks seguintes?

### Validação
Xcode 16.4 lista o scheme `Substi`; `xcodebuild` compila o target do app no simulador iPhone 16 / iOS 18.6; `git diff --check` e revisão do estado Git confirmam que somente arquivos do projeto e documentação de acompanhamento estão incluídos. Não executar testes nesta task.

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
`Substi.xcodeproj/`, `Substi/`, `SubstiTests/` e `SubstiUITests/`, na raiz do repositório. Nenhuma funcionalidade Swift do produto.

### Critérios para conclusão
- [x] Projeto está dentro do clone Git e o target do app compila com Xcode 16.4.
- [x] Arquivos pessoais/gerados de estado do Xcode não foram incluídos.
- [x] README, backlog, task e painel atual refletem o bootstrap em revisão.
- [x] PR #5 foi integrado por Gabriel; task aceita como concluída.

### Notas para entrevista
Explicar que o projeto Xcode é a definição de build do app, que schemes agrupam ações/targets e que as configurações específicas de deployment e linguagem serão revisadas nas tasks seguintes.

## SUB-P01-002 — Configurar Bundle ID e deployment target

Estado: REVIEW

Prioridade: P0

Depende de:
SUB-P01-001

### Contexto
O projeto recém-integrado ainda usa o Bundle ID genérico do template e deployment target iOS 18.5. O plano define suporte a iOS 16; estes identificadores e a versão mínima precisam corresponder à identidade e ao alcance planejados do Substi.

### Objetivo
Configurar identificadores Bundle ID consistentes e deployment target iOS 16 no app e nos targets de teste.

### Requisitos
- Usar `com.gabrielbarbosa.substi` para o app, com sufixos `.tests` e `.uitests` para os bundles de teste.
- Aplicar iOS 16.0 como deployment target do app e dos targets de teste, em Debug e Release.
- Manter Swift 6 Language Mode para `SUB-P01-003`.
- Não alterar funcionalidades Swift nem adicionar dependências.

### Critérios de aceite
- [x] Bundle IDs do app, testes unitários e testes de UI usam o namespace definido.
- [x] Build settings de Debug e Release permitem deployment a partir do iOS 16.
- [x] Build do app continua passando com Xcode 16.4.
- [ ] Gabriel revisa a convenção de Bundle ID e explica deployment target.

### Conceitos de engenharia
Bundle identifier, identificadores distintos por produto, build configurations e iOS deployment target.

### Estudar antes da implementação
Entender que o Bundle ID identifica cada app/bundle no ecossistema Apple e que deployment target é a versão mínima do sistema operacional suportada, diferente do SDK usado para compilar.

### Perguntas que preciso saber responder
- Por que o Bundle ID do app precisa diferir dos identificadores dos bundles de teste?
- O que iOS 16.0 como deployment target garante — e o que não garante — sobre APIs usadas no código?
- Qual namespace foi escolhido e onde confirmar disponibilidade antes de distribuir o app?

### Validação
Inspecionar os build settings efetivos dos targets, confirmar os Bundle IDs em Debug e Release e compilar o app no simulador com Xcode 16.4. Não executar testes nesta task.

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
`Substi.xcodeproj/project.pbxproj` e atualização de estado em `README.md`, `docs/project/CURRENT.md`, `docs/project/BACKLOG.md` e este arquivo.

### Critérios para conclusão
- [x] Identificadores e deployment target configurados nos targets pertinentes.
- [x] Build do app validado; testes não executados conforme o escopo desta task.
- [x] README, backlog, task e painel atual sincronizados.
- [ ] Gabriel revisa e explica a convenção e o deployment target; somente então mover para `DONE`.

### Notas para entrevista
Explicar a função do Bundle ID, a separação entre app/test bundles e como o deployment target delimita a compatibilidade mínima do app.

## SUB-P01-003 — Ativar Swift 6 Language Mode

Estado: TODO

Prioridade: P0

Depende de:
SUB-P01-002

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Ativar Swift 6 Language Mode.

### Objetivo
Concluir Ativar Swift 6 Language Mode dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Xcode, configurações de build, Swift 6 Language Mode, Git e targets.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Ativar Swift 6 Language Mode” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar as verificações pertinentes de build/targets no Xcode, validar o estado do Git e commitar somente com autorização.

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

## SUB-P01-004 — Inspecionar estrutura do Xcode

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P01-003

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Inspecionar estrutura do Xcode.

### Objetivo
Concluir Inspecionar estrutura do Xcode dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Xcode, configurações de build, Swift 6 Language Mode, Git e targets.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Inspecionar estrutura do Xcode” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar as verificações pertinentes de build/targets no Xcode, validar o estado do Git e commitar somente com autorização.

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

## SUB-P01-005 — Adicionar target de testes unitários

Estado: TODO

Prioridade: P0

Depende de:
Nenhuma

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Adicionar target de testes unitários.

### Objetivo
Concluir Adicionar target de testes unitários dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Xcode, configurações de build, Swift 6 Language Mode, Git e targets.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Adicionar target de testes unitários” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar as verificações pertinentes de build/targets no Xcode, validar o estado do Git e commitar somente com autorização.

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

## SUB-P01-006 — Adicionar target de testes de UI

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P01-005

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Adicionar target de testes de UI.

### Objetivo
Concluir Adicionar target de testes de UI dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Xcode, configurações de build, Swift 6 Language Mode, Git e targets.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Adicionar target de testes de UI” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar as verificações pertinentes de build/targets no Xcode, validar o estado do Git e commitar somente com autorização.

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

## SUB-P01-007 — Configurar configurações de build

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P01-006

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Configurar configurações de build.

### Objetivo
Concluir Configurar configurações de build dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Xcode, configurações de build, Swift 6 Language Mode, Git e targets.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Configurar configurações de build” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar as verificações pertinentes de build/targets no Xcode, validar o estado do Git e commitar somente com autorização.

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

## SUB-P01-008 — Validar build do app vazio

Estado: TODO

Prioridade: P0

Depende de:
Nenhuma

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Validar build do app vazio.

### Objetivo
Concluir Validar build do app vazio dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Xcode, configurações de build, Swift 6 Language Mode, Git e targets.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Validar build do app vazio” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar as verificações pertinentes de build/targets no Xcode, validar o estado do Git e commitar somente com autorização.

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

## SUB-P01-009 — Inicializar Git e arquivos ignorados

Estado: TODO

Prioridade: P0

Depende de:
SUB-P01-008

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Inicializar Git e arquivos ignorados.

### Objetivo
Concluir Inicializar Git e arquivos ignorados dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Xcode, configurações de build, Swift 6 Language Mode, Git e targets.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Inicializar Git e arquivos ignorados” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar as verificações pertinentes de build/targets no Xcode, validar o estado do Git e commitar somente com autorização.

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

## SUB-P01-010 — Preparar README e primeiro commit

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P01-009

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Preparar README e primeiro commit.

### Objetivo
Concluir Preparar README e primeiro commit dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
Xcode, configurações de build, Swift 6 Language Mode, Git e targets.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Preparar README e primeiro commit” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar as verificações pertinentes de build/targets no Xcode, validar o estado do Git e commitar somente com autorização.

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

## SUB-P01-011 — Substituir template SwiftUI por entrada UIKit

Estado: REVIEW

Prioridade: P0

Depende de:
- SUB-P01-001

### Contexto
O projeto foi criado pelo template SwiftUI do Xcode. `ContentView` ainda mostra “Hello, world!” e `SubstiApp` o instancia como tela inicial, embora UIKit seja a tecnologia principal planejada para o fluxo do Substi.

### Objetivo
Remover a tela de exemplo e iniciar o aplicativo com o ciclo de vida UIKit, deixando uma raiz vazia pronta para receber o fluxo real em uma task posterior.

### Requisitos
- Criar `AppDelegate` como ponto de entrada UIKit.
- Criar `SceneDelegate` para configurar uma `UIWindow` com um `UIViewController` raiz vazio.
- Remover `Substi/ContentView.swift` e a entrada SwiftUI gerada em `Substi/SubstiApp.swift`.
- Não adicionar Coordinator, ViewController de feature ou tela de produto nesta task.
- Manter SwiftUI disponível para integração incremental futura por `UIHostingController`.
- Atualizar o estado desta task em `CURRENT.md`, `BACKLOG.md`, `ROADMAP.md` e neste arquivo.

### Critérios de aceite
- [x] O app inicia por `AppDelegate` e configura a janela por `SceneDelegate`.
- [x] A raiz UIKit é um `UIViewController` vazio, sem conteúdo de demonstração.
- [x] `ContentView.swift` e `SubstiApp.swift` foram removidos do projeto.
- [x] O build do app passa no simulador iOS.
- [x] Não foi adicionada tela, Coordinator ou funcionalidade de produto.
- [ ] Gabriel consegue explicar o caminho `UIApplication → AppDelegate → SceneDelegate → UIWindow → UIViewController`.

### Conceitos de engenharia
Ciclo de vida do app UIKit, scenes, janela, controlador raiz e entrada `@main`.

### Estudar antes da implementação
Revisar o papel de `UIApplicationDelegate` e `UIWindowSceneDelegate`, e distinguir o ciclo de vida de UIKit do protocolo `App` do SwiftUI.

### Perguntas que preciso saber responder
- Quem inicia o app quando `AppDelegate` é marcado `@main`?
- Por que `SceneDelegate` configura a janela para uma `UIWindowScene`?
- O que mantém o `UIWindow` vivo durante a sessão?
- Como SwiftUI ainda poderá aparecer dentro do fluxo UIKit?
- Por que a raiz está vazia e onde entra a futura navegação/coordinator?

### Validação
Compilar o scheme `Substi` para o simulador com Xcode 16.4 e iniciar o app em iPhone 16 Simulator. Não executar testes: esta task altera somente a inicialização do app, sem comportamento de produto.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
`SceneDelegate` mantém uma referência forte à `UIWindow` enquanto a cena estiver ativa; o sistema controla o ciclo de vida da cena e do delegate. Não adicionar referências ou closures próprias.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa; ainda não há interface de produto.

### Uso de IA
A IA pode converter o bootstrap SwiftUI em UIKit e explicar callbacks e ownership; Gabriel decide se o ponto de entrada e a separação de responsabilidades fazem sentido.

### Arquivos esperados
- `Substi/App/AppDelegate.swift`
- `Substi/App/SceneDelegate.swift`
- Remoção de `Substi/ContentView.swift`
- Remoção de `Substi/SubstiApp.swift`
- `docs/project/phases/PHASE-01-bootstrap.md`
- `docs/project/phases/PHASE-04-domain-modeling.md`
- `docs/project/BACKLOG.md`
- `docs/project/ROADMAP.md`
- `docs/project/CURRENT.md`

### Critérios para conclusão
- [x] Ciclo de vida UIKit, build e inicialização no simulador validados.
- [x] Template SwiftUI removido sem remover a capacidade de integrar SwiftUI mais tarde.
- [x] Documentação e estados atualizados.
- [x] Mover para `REVIEW`; Gabriel marcará `DONE` após compreender o fluxo, salvo a autorização explícita para integração automatizada.

### Notas para entrevista
Explicar por que UIKit controla a janela e a navegação principal, e como `UIHostingController` permite introduzir SwiftUI em uma parte do app sem substituir todo o ciclo de vida.
