# FASE 11 — Descoberta de design e Design System

## Objetivo
Descobrir uma identidade visual própria antes de implementar foundations e componentes, em escala adequada às telas do Substi.

## Resultado esperado
Princípios, foundations, contratos low-fi, revisão de acessibilidade e apenas tokens/componentes efetivamente usados.

## Dependências
A descoberta de design usa as decisões pertinentes de produto e pode ocorrer em paralelo com domínio e rede. A implementação depende dos materiais aprovados, não da conclusão cronológica de todo o plano de engenharia.

## Prioridade
P0: HIG focado, princípios, foundations, estrutura low-fi, inventário, acessibilidade e componentes usados. P1: pesquisa de referências do iFood e grocery, direção high-fi e snapshots. Prazo final: 28/09/2026 às 11h, em `America/Sao_Paulo`.

## Estado
TODO

## Descoberta de design — antes do SwiftUI

Ordem: problema do produto → requisitos de experiência → princípios de design → foundations visuais → componentes → telas → implementação Swift. Figma é ferramenta auxiliar, com tempo limitado.

## SUB-P11-012 — Pesquisar princípios do Design System do iFood

Estado: TODO

Prioridade: P1

Depende de:
- Nenhuma

### Contexto
Registrar em notas breves como um sistema de grande escala separa linguagem visual, tokens, componentes e plataformas. É pesquisa conceitual, não requisito de entrega.

### Objetivo
Pesquisar princípios do Design System do iFood e registrar notas curtas, revisadas dentro do escopo da entrega.

### Requisitos
- Notas curtas descrevem essas camadas e o que é proporcional ao Substi; não reproduzem nomes, assets, tokens ou componentes proprietários do iFood.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de features, domínio, Repository ou networking.
- Discutir alternativas com Gabriel antes da implementação; não expandir o escopo.

### Critérios de aceite
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
Arquitetura de Design System, tokens e componentes por plataforma.

### Estudar antes da implementação
Limitar a pesquisa a 20 minutos e usar referências públicas.

### Perguntas que preciso saber responder
- Como a separação ajuda várias plataformas? O que é proporcional? O que não devemos copiar?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
P1: não bloquear implementação; notas breves e fontes.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Considerações de concorrência
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Acessibilidade
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Somente documentação e materiais de design nesta etapa; a implementação futura usa arquivos aprovados pela tarefa.

### Critérios para conclusão
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-013 — Revisar HIG da Apple para o Substi

Estado: TODO

Prioridade: P0

Depende de:
- Nenhuma

### Contexto
Usar padrões nativos do iOS adequados ao fluxo sem clonar outra aplicação.

### Objetivo
Revisar os Human Interface Guidelines da Apple nos tópicos relevantes ao Substi e registrar critérios práticos para a interface.

### Requisitos
- As notas cobrem navegação, botões, listas/cards, tipografia, cor, acessibilidade, feedback e estados de carregamento/erro; transformar orientações aplicáveis em critérios para as telas.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Critérios de aceite
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
Apple HIG, navegação, componentes nativos, acessibilidade.

### Estudar antes da implementação
Estudar apenas os tópicos indicados.

### Perguntas que preciso saber responder
- Quais padrões nativos resolvem o caso? Onde customizar? Como validar accessibility?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
Revisar fontes oficiais e screen criteria; sem código.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Considerações de concorrência
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Acessibilidade
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela tarefa.

### Critérios para conclusão
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-014 — Pesquisar referências de UX de mercado

Estado: TODO

Prioridade: P1

Depende de:
- Nenhuma

### Contexto
Observar padrões grocery, substituição, delivery, cards e comparação.

### Objetivo
Pesquisar referências de UX de grocery e registrar até três referências, dentro do limite de tempo.

### Requisitos
- No máximo três referências; pesquisa limitada a 20 minutos; registrar padrões e separar observação de suposição.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Critérios de aceite
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
Grocery/e-commerce UX, comparação, substituição.

### Estudar antes da implementação
Timebox de 20 minutos; não fazer auditoria ampla.

### Perguntas que preciso saber responder
- Quais padrões reduzem esforço e aumentam confiança?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
P1: parar após 20 minutos; pode ser pulada.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Considerações de concorrência
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Acessibilidade
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela tarefa.

### Critérios para conclusão
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-015 — Definir princípios de design do Substi

Estado: TODO

Prioridade: P0

Depende de:
SUB-P00-001
- SUB-P11-013

### Contexto
Traduzir o problema em critérios para uma identidade visual própria.

### Objetivo
Definir e registrar os princípios de design do Substi.

### Requisitos
- Registrar CLEAR, COMPARABLE, CONSISTENT e ACCESSIBLE com consequência observável nas telas; declarar que a identidade é própria e não copia iFood.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Critérios de aceite
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
Design language, princípios e hierarquia.

### Estudar antes da implementação
Revisar contra problema e hipótese antes de implementação.

### Perguntas que preciso saber responder
- Como cada princípio reduz esforço ou melhora comparação? Como verificar consistência UIKit/SwiftUI?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
Revisão de princípios contra problema/fluxo.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Considerações de concorrência
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Acessibilidade
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela tarefa.

### Critérios para conclusão
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-016 — Definir foundations de design

Estado: TODO

Prioridade: P0

Depende de:
SUB-P11-015

### Contexto
Especificar foundations antes da implementação.

### Objetivo
Definir as foundations visuais sem valores arbitrários.

### Requisitos
- Registrar cores semânticas: brandPrimary; backgroundPrimary/backgroundSecondary; surfacePrimary/surfaceSecondary; textPrimary/textSecondary/textInverse; borderDefault; statusSuccess/statusWarning/statusError; interactivePrimary/interactiveDisabled. Registrar estilos de System Font + Dynamic Type: largeTitle, title, headline, body, bodyEmphasized, caption, button e price. Registrar escala de espaçamento 4/8/12/16/24/32 e raios small/medium/large sem valores concretos; usar SF Symbols como padrão; adotar nomes semânticos e considerar modo claro/escuro. Não definir códigos hexadecimais.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Critérios de aceite
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
Tokens semânticos, Dynamic Type, spacing/radius, SF Symbols.

### Estudar antes da implementação
Distinguir decisão semântica de valor concreto.

### Perguntas que preciso saber responder
- Por que nomes semânticos? Quando asset próprio em vez de SF Symbols?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
Revisar consistência, contraste e cobertura clara/escura; sem código.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Considerações de concorrência
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Acessibilidade
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela tarefa.

### Critérios para conclusão
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-017 — Criar estrutura low-fi das telas

Estado: TODO

Prioridade: P0

Depende de:
SUB-P00-009
- SUB-P11-016

### Contexto
Definir quatro telas sem polish antes de criar views.

### Objetivo
Definir a estrutura low-fi das telas de pedido, sugestões, comparação e confirmação.

### Requisitos
- Pedido, sugestões, comparação e confirmação. Cada contrato de tela inclui propósito, objetivo da pessoa usuária, hierarquia de informação, componentes, estados, ações, acessibilidade e analytics. Avaliar loading/content/empty/error/disabled quando aplicável; não exige desenho high-fi.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Critérios de aceite
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
Fluxo, wireframes low-fi, contratos de tela e estados.

### Estudar antes da implementação
Percorrer fluxo e explicar hierarquia de informação.

### Perguntas que preciso saber responder
- Qual objetivo, informação prioritária, estados, ações e comportamento accessibility?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
Revisar walkthrough e consistência com MVP; sem Swift ou implementação.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Considerações de concorrência
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Acessibilidade
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela tarefa.

### Critérios para conclusão
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-018 — Definir inventário de componentes

Estado: TODO

Prioridade: P0

Depende de:
SUB-P11-017

### Contexto
Derivar inventário mínimo das telas sem antecipar uma biblioteca.

### Objetivo
Identificar componentes necessários observando as telas, antes de implementar componentes.

### Requisitos
- Mapear componentes usados ou repetidos em UIKit e SwiftUI e compará-los com controles nativos. DSProductCard recebe imagem, nome do produto, marca, quantidade, metadados opcionais, compatibilidade/estado e seleção como dados de apresentação; não calcula ranking, não faz networking e não conhece Repository. Registrar componentes dispensáveis. Estrutura conceitual proporcional: Foundations (Color, Typography, Spacing, Radius); UIKit (DSButton, DSProductCardView, DSStatusBadgeView, DSLoadingView, DSErrorView); SwiftUI (DSButtonStyle, DSProductCard, DSStatusBadge). Não implementar componentes sem uso real nesta tarefa.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Critérios de aceite
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
Component boundaries, composição, apresentação versus domínio.

### Estudar antes da implementação
Justificar cada componente pelo uso.

### Perguntas que preciso saber responder
- Pode controle nativo resolver? Existe regra de negócio indevida?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
Revisar inventário contra contratos de tela e dependency direction.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Considerações de concorrência
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Acessibilidade
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela tarefa.

### Critérios para conclusão
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-019 — Criar direção high-fi

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P11-016
- SUB-P11-018

### Contexto
Definir direção visual mínima, sem biblioteca extensa de Figma.

### Objetivo
Definir uma direção visual high-fi mínima, sem exigir uma biblioteca completa no Figma.

### Requisitos
- Uma direção visual simples comunica hierarquia, espaçamento, tipografia, cores semânticas, componentes e estados das telas; a identidade é própria.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Critérios de aceite
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
Visual hierarchy, foundations, component states.

### Estudar antes da implementação
Timebox para quick direction; não bloquear por Figma polido.

### Perguntas que preciso saber responder
- O que chama atenção primeiro? As plataformas parecem uma app?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
Walkthrough; P1 pode ser notas se o tempo apertar.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Considerações de concorrência
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Acessibilidade
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela tarefa.

### Critérios para conclusão
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-020 — Validar acessibilidade no design

Estado: TODO

Prioridade: P0

Depende de:
SUB-P11-016
- SUB-P11-017

### Contexto
Detectar problemas antes de implementar views.

### Objetivo
Revisar acessibilidade do design antes da implementação Swift.

### Requisitos
- Revisar contraste, tamanho/hierarquia, touch targets, leitura lógica, labels/semantics e Dynamic Type; registrar ajustes nos contratos de tela.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Critérios de aceite
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
Accessibility-first design, contraste, alvos e leitura.

### Estudar antes da implementação
Revisar exemplos ampliados e fluxo VoiceOver conceitual.

### Perguntas que preciso saber responder
- O que será anunciado? Texto ampliado quebra hierarquia? Cor é o único sinal?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
Checklist por tela; sem implementação.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Considerações de concorrência
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Acessibilidade
Critério central; revisar Dynamic Type, contraste, touch targets e leitura lógica.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela tarefa.

### Critérios para conclusão
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## Implementação do Design System

Implementar foundations e componentes somente após o discovery. Preferir controles iOS nativos quando adequados. Não criar a biblioteca inteira só para completar uma lista.

## SUB-P11-021 — Implementar tokens de design

Estado: TODO

Prioridade: P0

Depende de:
SUB-P11-016
- SUB-P11-020

### Contexto
Implementar foundations aprovadas para UIKit e SwiftUI.

### Objetivo
Concluir Implementar tokens de design dentro do escopo da entrega e registrar o resultado para revisão.

### Requisitos
- Cores semânticas, tipografia, espaçamento e raios compartilhados conceitualmente; assets semânticos quando aplicável; System Font, Dynamic Type e SF Symbols; sem códigos hexadecimais arbitrários ou valores espalhados.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Critérios de aceite
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
Token API, assets, UIKit/SwiftUI, Dynamic Type.

### Estudar antes da implementação
Implementar foundations mínimas e justificar ownership.

### Perguntas que preciso saber responder
- Como compartilhar linguagem sem acoplar implementações?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
Compilar e inspecionar os modos claro/escuro e Dynamic Type.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Considerações de concorrência
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Acessibilidade
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela tarefa.

### Critérios para conclusão
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-022 — Implementar componentes UIKit necessários

Estado: TODO

Prioridade: P0

Depende de:
SUB-P11-018
- SUB-P11-021

### Contexto
Entregar somente os componentes UIKit necessários às telas; tarefas específicas existentes detalham o trabalho.

### Objetivo
Concluir Implementar componentes UIKit necessários dentro do escopo da entrega e registrar o resultado para revisão.

### Requisitos
- Apenas componentes aprovados no inventário; integrar DSButton, DSProductCardView e estados quando usados; apresentação sem regra de negócio; não criar variantes não usadas.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Critérios de aceite
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
UIKit composition, tokens, presentation data, boundary.

### Estudar antes da implementação
Usar tasks 005,006,008 como implementação granular.

### Perguntas que preciso saber responder
- Que repetição justifica componente? Quem possui regras e dados?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
Build, estados usados, Dynamic Type e accessibility.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Considerações de concorrência
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Acessibilidade
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela tarefa.

### Critérios para conclusão
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-023 — Implementar componentes SwiftUI necessários

Estado: TODO

Prioridade: P0

Depende de:
SUB-P11-018
- SUB-P11-021

### Contexto
Aplicar os mesmos princípios e tokens na comparação SwiftUI sem equivalentes desnecessários.

### Objetivo
Concluir Implementar componentes SwiftUI necessários dentro do escopo da entrega e registrar o resultado para revisão.

### Requisitos
- Apenas styles/components usados; consumir foundations; não controlar UINavigationController; preferir controles nativos.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Critérios de aceite
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
SwiftUI composition, styles, tokens, UIKit interoperability.

### Estudar antes da implementação
DSButtonStyle/DSStatusBadge só se os contratos de tela mostrarem necessidade.

### Perguntas que preciso saber responder
- Por que compartilhar tokens? Quem controla navegação?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
Build/preview e estado/semântica; omitir componentes sem uso e justificar.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Considerações de concorrência
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Acessibilidade
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela tarefa.

### Critérios para conclusão
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-024 — Criar snapshots de componentes críticos

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P11-022
- SUB-P11-023

### Contexto
Proteger estados visuais críticos depois de estabilizados.

### Objetivo
Concluir Criar snapshots de componentes críticos dentro do escopo da entrega e registrar o resultado para revisão.

### Requisitos
- Selecionar ProductCard, ErrorState e Comparison se implementados; fixtures determinísticas; não cobrir biblioteca inteira.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Critérios de aceite
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
Snapshot tests, fixtures, manutenção de baselines.

### Estudar antes da implementação
Usar ferramenta aprovada/disponível e justificar manutenção.

### Perguntas que preciso saber responder
- Que regressão visual útil detecta? Quando atualizar baseline?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
Snapshots determinísticos; reduzir escopo se custo ameaçar entrega.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Considerações de concorrência
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Acessibilidade
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Somente documentação/design artifacts nesta etapa; implementação futura usa arquivos aprovados pela tarefa.

### Critérios para conclusão
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## Existing Stable IDs

Os IDs anteriores permanecem imutáveis. Duplicatas de planning foram preservadas como BLOCKED e referenciam a nova tarefa; tasks de componente ainda úteis permanecem com o escopo mínimo.

## SUB-P11-001 — Definir princípios (substituída)

Estado: BLOCKED

Prioridade: P1

Depende de:
- Nenhuma

### Contexto
Entrada histórica substituída por SUB-P11-015 para não duplicar Design Discovery.

### Objetivo
Princípios de design: tarefa anterior substituída pela etapa de Design Discovery.

### Requisitos
- Permanece BLOCKED; executar P11-015. Não reutilizar ID.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Não executar trabalho duplicado.

### Critérios de aceite
- [ ] A substituta está identificada e este registro permanece BLOCKED.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
Design language.

### Estudar antes da implementação
Ler substituta.

### Perguntas que preciso saber responder
- Por que ID foi preservado?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
Não aplicável for esta tarefa.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Nenhum arquivo novo; manter o registro histórico e apontar para a substituta.

### Critérios para conclusão
- [ ] Manter status BLOCKED e usar a substituta indicada.
- [ ] Não reutilizar o ID.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-002 — Definir tokens de cor (substituída)

Estado: BLOCKED

Prioridade: P1

Depende de:
- Nenhuma

### Contexto
Definição consolidada em SUB-P11-016.

### Objetivo
Tokens de cor: tarefa anterior substituída pela definição de foundations semânticas.

### Requisitos
- Permanece BLOCKED; implementação em P11-021.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Não executar trabalho duplicado.

### Critérios de aceite
- [ ] A substituta está identificada e este registro permanece BLOCKED.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
Cores semânticas.

### Estudar antes da implementação
Ler substituta.

### Perguntas que preciso saber responder
- Qual a diferença entre especificar e implementar tokens?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
Não aplicável for esta tarefa.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Nenhum arquivo novo; manter o registro histórico e apontar para a substituta.

### Critérios para conclusão
- [ ] Manter status BLOCKED e usar a substituta indicada.
- [ ] Não reutilizar o ID.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-003 — Definir tipografia e Dynamic Type (substituída)

Estado: BLOCKED

Prioridade: P1

Depende de:
- Nenhuma

### Contexto
Definição consolidada em SUB-P11-016.

### Objetivo
Tipografia e Dynamic Type: tarefa anterior substituída pela definição de foundations.

### Requisitos
- Permanece BLOCKED; preservar ID.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Não executar trabalho duplicado.

### Critérios de aceite
- [ ] A substituta está identificada e este registro permanece BLOCKED.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
Typography, Dynamic Type.

### Estudar antes da implementação
Ler substituta.

### Perguntas que preciso saber responder
- Qual a diferença entre especificar e implementar foundations?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
Não aplicável for esta tarefa.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Nenhum arquivo novo; manter o registro histórico e apontar para a substituta.

### Critérios para conclusão
- [ ] Manter status BLOCKED e usar a substituta indicada.
- [ ] Não reutilizar o ID.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-004 — Definir espaçamento e raios (substituída)

Estado: BLOCKED

Prioridade: P1

Depende de:
- Nenhuma

### Contexto
Definição consolidada em SUB-P11-016.

### Objetivo
Spacing e radius: tarefa anterior substituída pela definição de foundations.

### Requisitos
- Permanece BLOCKED; preservar ID.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Não executar trabalho duplicado.

### Critérios de aceite
- [ ] A substituta está identificada e este registro permanece BLOCKED.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
Spacing, radius.

### Estudar antes da implementação
Ler substituta.

### Perguntas que preciso saber responder
- Quando escolher valores concretos?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
Não aplicável for esta tarefa.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Nenhum arquivo novo; manter o registro histórico e apontar para a substituta.

### Critérios para conclusão
- [ ] Manter status BLOCKED e usar a substituta indicada.
- [ ] Não reutilizar o ID.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-005 — Implementar DSButton

Estado: TODO

Prioridade: P0

Depende de:
SUB-P11-021

### Contexto
Implementar variante UIKit necessária se controle nativo não resolver.

### Objetivo
Concluir Implementar DSButton dentro do escopo da entrega e registrar o resultado para revisão.

### Requisitos
- Considerar primary/secondary/destructive e normal/highlighted/disabled/loading, mas implementar somente variants/states usados; foundations compartilhadas; sem lógica de negócio.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Critérios de aceite
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
UIKit, tokens, action state.

### Estudar antes da implementação
Revisar UIButton e necessidade real de wrapper.

### Perguntas que preciso saber responder
- Que estado é usado? Por que customizar?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
Compilar e inspecionar estados e acessibilidade.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Considerações de concorrência
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Acessibilidade
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Somente arquivos de token/component aprovados; nenhum arquivo é criado nesta atualização do planejamento.

### Critérios para conclusão
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-006 — Implementar DSProductCard

Estado: TODO

Prioridade: P0

Depende de:
SUB-P11-021
- SUB-P11-018

### Contexto
Apresentar produtos consistentemente onde inventário justificar reuse.

### Objetivo
Concluir Implementar DSProductCard dentro do escopo da entrega e registrar o resultado para revisão.

### Requisitos
- Nome, marca, quantidade, metadata, compatibilidade/status e seleção conforme necessidade; recebe presentation data, não calcula ranking nem conhece rede/repository.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Critérios de aceite
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
Presentation data, UI composition, boundary.

### Estudar antes da implementação
Revisar hierarquia e labels.

### Perguntas que preciso saber responder
- Como evitar regras de negócio no componente?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
Validar dados, estados e Dynamic Type.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Considerações de concorrência
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Acessibilidade
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Somente arquivos de token/component aprovados; nenhum arquivo é criado nesta atualização do planejamento.

### Critérios para conclusão
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-007 — Implementar DSStatusBadge

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P11-018
- SUB-P11-021

### Contexto
Criar badge apenas se status não ficar claro com texto/controle nativo.

### Objetivo
Concluir Implementar DSStatusBadge dentro do escopo da entrega e registrar o resultado para revisão.

### Requisitos
- Se inventário não justificar, documentar não implementação.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Critérios de aceite
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
Status semântico e acessibilidade.

### Estudar antes da implementação
Considerar texto e SF Symbols; não depender só de cor.

### Perguntas que preciso saber responder
- O que comunica? Como VoiceOver anuncia?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
Inspecionar se implementado.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Considerações de concorrência
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Acessibilidade
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Somente arquivos de token/component aprovados; nenhum arquivo é criado nesta atualização do planejamento.

### Critérios para conclusão
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-008 — Implementar estados de carregamento/erro/vazio

Estado: TODO

Prioridade: P0

Depende de:
SUB-P11-021
- SUB-P11-017

### Contexto
Comunicar progresso, falha e ausência de candidatos.

### Objetivo
Concluir Implementar estados de carregamento/erro/vazio dentro do escopo da entrega e registrar o resultado para revisão.

### Requisitos
- Estados relevantes; erro recuperável; controles e feedback nativos quando adequados.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Critérios de aceite
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
UI states, feedback.

### Estudar antes da implementação
Definir mensagem e ação antes de view.

### Perguntas que preciso saber responder
- O que pode usuário fazer em cada estado?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
Validar estados determinísticos e accessibility.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Considerações de concorrência
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Acessibilidade
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Somente arquivos de token/component aprovados; nenhum arquivo é criado nesta atualização do planejamento.

### Critérios para conclusão
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-009 — Validar Dark Mode

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P11-021

### Contexto
Verificar direção visual em aparência clara e escura.

### Objetivo
Validar o modo claro/escuro.

### Requisitos
- Usar cores semânticas; registrar problemas; reduzir escopo se o prazo apertar.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Critérios de aceite
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
Cores semânticas e contraste.

### Estudar antes da implementação
Revisar cores semânticas nativas.

### Perguntas que preciso saber responder
- O contraste continua adequado?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
Inspeção manual dos fluxos.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Considerações de concorrência
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Acessibilidade
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Somente arquivos de token/component aprovados; nenhum arquivo é criado nesta atualização do planejamento.

### Critérios para conclusão
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-010 — Definir tokens UIKit/SwiftUI

Estado: TODO

Prioridade: P0

Depende de:
SUB-P11-021

### Contexto
Validar que ambas as APIs expressam uma linguagem coerente.

### Objetivo
Definir tokens compartilhados entre UIKit e SwiftUI.

### Requisitos
- Nenhuma plataforma depende da implementação visual da outra; tokens não conhecem feature.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Discutir alternativas com Gabriel antes de implementação; não expandir escopo.

### Critérios de aceite
- [ ] Resultado atende os critérios do discovery ou inventário aprovado.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
Design boundary, API surface.

### Estudar antes da implementação
Evitar abstração excessiva.

### Perguntas que preciso saber responder
- Como compartilhar intenção sem compartilhar tipos de UI?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
Build/preview e dependency review.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Avaliar ownership quando a implementação de componente ocorrer; esta decisão de design não cria ciclo de referências.

### Considerações de concorrência
Sem estado mutável compartilhado nesta decisão; revisar isolamento se implementação introduzir concorrência.

### Acessibilidade
Aplicar semântica, labels, Dynamic Type e ordem lógica quando houver UI.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Somente arquivos de token/component aprovados; nenhum arquivo é criado nesta atualização do planejamento.

### Critérios para conclusão
- [ ] Critérios atendidos e revisados por Gabriel.
- [ ] Verificações aplicáveis passam ou não aplicabilidade é justificada.
- [ ] Atualizar documentação; Gabriel explica decisões/trade-offs.
- [ ] Passar por REVIEW; DONE só depois de revisão explícita.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.

## SUB-P11-011 — Adicionar snapshots selecionados (substituída)

Estado: BLOCKED

Prioridade: P1

Depende de:
- Nenhuma

### Contexto
Cobertura selecionada consolidada em SUB-P11-024.

### Objetivo
Snapshots selecionados: tarefa anterior substituída; os snapshots necessários são definidos após o inventário de componentes.

### Requisitos
- BLOCKED para evitar duplicação; usar P11-024.
- Respeitar a direção Feature → DesignSystem; DesignSystem não depende de feature, domain, repository ou networking.
- Não executar trabalho duplicado.

### Critérios de aceite
- [ ] A substituta está identificada e este registro permanece BLOCKED.
- [ ] Decisões, limites e trade-offs ficam registrados.
- [ ] Gabriel revisa e consegue explicar o resultado.

### Conceitos de engenharia
Snapshots.

### Estudar antes da implementação
Ler substituta.

### Perguntas que preciso saber responder
- Qual cobertura justifica manutenção?
- Qual alternativa foi considerada e por que o escopo é proporcional ao prazo?

### Validação
Não aplicável for esta tarefa.

### Observabilidade
Não se aplica a esta tarefa.

### Considerações de memória
Não se aplica a esta tarefa.

### Considerações de concorrência
Não se aplica a esta tarefa.

### Acessibilidade
Não se aplica a esta tarefa.

### Uso de IA
IA pode resumir referências e propor alternativas; Gabriel verifica fontes, escolhe a direção e explica a decisão. IA não escolhe identidade visual nem adiciona componentes sem justificativa.

### Arquivos esperados
Nenhum arquivo novo; manter o registro histórico e apontar para a substituta.

### Critérios para conclusão
- [ ] Manter status BLOCKED e usar a substituta indicada.
- [ ] Não reutilizar o ID.

### Notas para entrevista
Explicar propósito, limites do Design System, uso de APIs nativas, trade-offs e razão para não implementar componentes sem uso.
