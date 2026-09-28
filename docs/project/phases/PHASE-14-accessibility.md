# FASE 14 — Acessibilidade

## Objetivo
Validar uma interação acessível ao longo de toda a jornada principal.

## Resultado esperado
Verificações de VoiceOver, Dynamic Type, contraste e alvos de toque nas telas da entrega.

## Dependências
Resultados pertinentes da FASE 13.

## Prioridade
Consulte as prioridades das tasks. Trabalho P1/P2 não pode comprometer a entrega essencial P0.

## Estado
REVIEW — tasks P0 com evidência automatizada/estática; revisão manual de Gabriel e itens P1 continuam pendentes.

## SUB-P14-001 — Definir critérios de aceite

Estado: REVIEW

Prioridade: P0

Depende de:
- Nenhuma

### Contexto
As quatro telas principais já existem. A acessibilidade precisa ser verificada na jornada completa, para que a pessoa consiga entender a indisponibilidade, escolher e comparar uma alternativa e confirmar ou cancelar sem depender apenas de cor ou imagem.

### Objetivo
Definir critérios observáveis para revisar as telas Pedido, Sugestões, Comparação e Confirmação antes da validação manual.

### Requisitos
- Avaliar nomes e contexto anunciados pelo VoiceOver para conteúdo e controles interativos.
- Verificar se a ordem de leitura corresponde à hierarquia visual e à sequência da tarefa.
- Verificar se conteúdo continua legível e utilizável com Dynamic Type ampliado.
- Verificar contraste de textos e estados sem usar cor como único indicador.
- Verificar alvos de toque, inclusive botões dentro de barras de ação.
- Registrar separadamente limitações que exigem inspeção visual/manual no Simulator.

### Critérios de aceite
- [x] Os critérios cobrem as quatro telas da jornada da entrega.
- [x] VoiceOver comunica o propósito de cada ação e o estado do produto sem depender apenas de cor ou ícone.
- [x] A ordem de foco é previsível, não omite ações essenciais e não entra em conteúdo decorativo.
- [x] Dynamic Type permite ler e acionar os controles sem truncamento que esconda informação ou ação essencial.
- [x] Contraste e estados são compreensíveis em cores semânticas; texto e/ou acessibilidade comunicam o estado.
- [x] Controles principais têm alvo de toque de pelo menos 44 × 44 pt, ou exceção nativa justificada.
- [x] Critérios ficam registrados nesta fase e a validação distingue checagem estática de inspeção manual.

### Conceitos de engenharia
VoiceOver, labels, traits, contraste e alvos de toque.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Definir critérios de aceite” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisão do checklist abaixo contra o código atual; VoiceOver, Dynamic Type e Accessibility Inspector exigem inspeção manual no Simulator e serão registrados nas tasks de validação correspondentes.

#### Checklist de aceite da jornada

| Tela | Verificação observável |
| --- | --- |
| Pedido (UIKit) | VoiceOver identifica o status do pedido, cada produto e disponibilidade; a ação para escolher substituto tem nome claro e só aparece quando necessária. |
| Sugestões (UIKit) | Loading, vazio, erro e resultados são anunciados; candidato selecionado é distinguível sem depender apenas da cor; comparação/retry é acionável. |
| Comparação (SwiftUI) | Original e substituto são identificados; cada linha anuncia atributo e os dois valores; confirmar e voltar a opções têm nomes e dicas compreensíveis. |
| Confirmação (SwiftUI) | Resumo anuncia produto original e substituto; confirmar, cancelar e fechar são ações distintas e distinguíveis. |
| Jornada completa | Foco acompanha a navegação e retorna a contexto útil; conteúdo decorativo não adiciona ruído; nenhum estado essencial depende exclusivamente de cor ou símbolo. |
| Dynamic Type | Textos podem crescer sem clipping/truncamento de informação essencial; conteúdo rolável continua alcançável; controles continuam acionáveis. |
| Contraste | Texto, controles e estados têm contraste suficiente; indisponível/compatível/substituído possuem rótulo textual além da cor. |
| Alvos de toque | CTA, seleção de candidato, retry, voltar opções, confirmar, cancelar e fechar têm área de interação de pelo menos 44 × 44 pt. |

O checklist é critério de revisão, não evidência de que a validação manual já foi executada.

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
- [x] Critérios observáveis foram definidos para as quatro telas e registrados nesta fase.
- [x] A documentação distingue critérios de aceite de validação manual executada.
- [x] CURRENT e status da task refletem que o resultado aguarda revisão.
- [ ] Gabriel revisa o resultado e explica os conceitos e trade-offs.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P14-002 — Revisar labels do VoiceOver

Estado: REVIEW

Prioridade: P0

Depende de:
SUB-P14-001

### Contexto
Os controles e cartões da jornada já definem labels, traits e hints em pontos diferentes. Uma checagem de acessibilidade automatizada na tela Pedido ajuda a encontrar nomes ausentes ou problemas comuns sem afirmar que substitui o teste manual com VoiceOver.

### Objetivo
Verificar se a tela Pedido e seus controles expõem descrições acessíveis úteis e automatizar uma auditoria de acessibilidade disponível no Xcode 16.4.

### Requisitos
- Preservar iOS 16 como deployment target; APIs de auditoria restritas ao iOS 17+ precisam de proteção de disponibilidade nos testes.
- Não depender de dados ou rede ao vivo para executar a auditoria da tela inicial.
- Manter rótulos textuais para estado do produto; símbolos e cores são apoio visual.
- Registrar que a auditoria automatizada examina a tela atual e não substitui VoiceOver manual nem cobre automaticamente a jornada completa.

### Critérios de aceite
- [x] A tela Pedido é aberta no teste de UI sem depender de conexão de rede.
- [x] A auditoria automatizada de acessibilidade passa no Simulator compatível.
- [x] Em iOS anterior a 17, o teste não chama a API indisponível e registra skip explicativo.
- [x] O status do pedido e dos produtos permanece compreensível por texto, sem depender só de cor/ícone.
- [x] Limitações da auditoria automatizada e necessidade de inspeção manual ficam documentadas.

### Conceitos de engenharia
VoiceOver, labels, traits, contraste e alvos de toque.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Revisar labels do VoiceOver” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Executar teste de UI com `XCUIApplication.performAccessibilityAudit()` em iOS 17+ e revisar as labels/traits/hints da tela Pedido. VoiceOver manual continua necessário para validar a experiência anunciada.

### Resultado observado
`testOrderScreenPassesAccessibilityAudit` passou no iPhone 16 Pro Simulator com iOS 18.6. O teste usa a auditoria do XCTest na tela que está visível e pula explicitamente em versões abaixo do iOS 17. A revisão de código confirma rótulos textuais para os estados disponível, indisponível e substituído; a auditoria não substitui VoiceOver manual nem valida telas não abertas.

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
- [x] Auditoria automatizada da tela Pedido passou no Simulator iOS 18.6.
- [x] Estados de produto têm texto acessível e o teste protege a API de auditoria com disponibilidade iOS 17+.
- [x] Alcance e limitação de testar uma única tela estão documentados.
- [ ] Gabriel revisa o resultado e explica a diferença entre auditoria automática e VoiceOver manual.
- [ ] Mover para REVIEW antes da análise de Gabriel; usar DONE somente após revisão e compreensão explícitas.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P14-003 — Revisar traits e ordem de leitura

Estado: REVIEW

Prioridade: P0

Depende de:
SUB-P14-002

### Contexto
Depois dos nomes acessíveis, precisamos garantir que controles acionáveis sejam anunciados como controles e que a leitura siga a sequência lógica de cada tela.

### Objetivo
Revisar traits e ordem de foco nas quatro telas sem incluir ícones decorativos na navegação assistiva.

### Requisitos
- Confirmar sequência de conteúdo e ações na hierarquia UIKit e SwiftUI.
- Confirmar que seleção de candidato anuncia estado selecionado e continua acionável pelo VoiceOver.
- Confirmar que imagens puramente ilustrativas ficam fora da árvore acessível.
- Registrar pontos que dependem da revisão manual com VoiceOver.

### Critérios de aceite
- [x] A ordem de composição UIKit/SwiftUI segue a sequência visível da tarefa nas quatro telas.
- [x] Cartão de candidato comunica label, valor selecionado, trait de botão e ativação por acessibilidade.
- [x] Imagens decorativas são removidas da árvore acessível nos componentes analisados.
- [x] Ações de comparação, confirmar, cancelar e fechar são botões com nomes visíveis ou labels explícitas.
- [x] Limites da inspeção estática e necessidade de teste manual com VoiceOver ficam registrados.

### Conceitos de engenharia
VoiceOver, labels, traits, contraste e alvos de toque.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Revisar traits e ordem de leitura” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Revisar a hierarquia dos elementos e configurações de traits nos componentes. Confirmar manualmente com VoiceOver antes da conclusão final.

### Resultado observado
Revisão estática das quatro telas: Pedido compõe status → itens → explicação → CTA; Sugestões compõe original → lista/estado → ações, e o cartão selecionável expõe `.button`, `.selected` e `accessibilityValue`; Comparação compõe cartões → atributos → ações; Confirmação compõe fechar → resumo → produto original → substituto → confirmar/cancelar. Imagens ilustrativas estão ocultas para acessibilidade nos componentes SwiftUI e UIKit revisados. A ordem real de foco ainda precisa ser confirmada com VoiceOver.

### Critérios para conclusão
- [x] Sequência e traits foram revisados nas quatro implementações.
- [x] O cartão selecionável tem caminho de ativação acessível e anuncia seleção.
- [x] Elementos ilustrativos estão ocultos onde não comunicam informação necessária.
- [ ] Gabriel revisa o resultado e confirma a sequência com VoiceOver no Simulator.

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
- [x] Sequência e traits foram revisados nas quatro implementações.
- [x] O cartão selecionável tem caminho de ativação acessível e anuncia seleção.
- [x] Elementos ilustrativos estão ocultos onde não comunicam informação necessária.
- [ ] Gabriel revisa o resultado e confirma a sequência com VoiceOver no Simulator.

### Notas para entrevista
Explicar propósito, alternativas, trade-offs, validação e como a decisão poderia mudar em escala maior.

## SUB-P14-004 — Validar Dynamic Type

Estado: REVIEW

Prioridade: P0

Depende de:
Nenhuma

### Contexto
Os textos UIKit usam estilos escaláveis e `adjustsFontForContentSizeCategory`; SwiftUI usa estilos semânticos. Ainda é preciso verificar clipping e conteúdo essencial na tela que pode rolar.

### Objetivo
Verificar que o sistema de fontes adotado escala corretamente e que a tela Pedido permanece legível com categorias de texto maiores.

### Requisitos
- Preservar fontes semânticas do sistema e fontes UIKit compatíveis com Dynamic Type.
- Conferir que a tela não depende de altura fixa para o conteúdo textual e que a rolagem continua disponível.
- Executar auditoria Dynamic Type da tela Pedido no Simulator.
- Não afirmar validação visual das outras telas sem abri-las com categorias ampliadas.

### Critérios de aceite
- [x] Textos da tela Pedido usam fontes escaláveis e layout adaptável.
- [x] Auditoria Dynamic Type não detecta texto cortado na tela Pedido.
- [x] Conteúdo permanece em scroll view e o botão é visível no estado inicial auditado.
- [x] Outras telas ainda não abertas em categoria ampliada ficam registradas como limite.

### Conceitos de engenharia
VoiceOver, labels, traits, contraste e alvos de toque.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Validar Dynamic Type” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Executar `testOrderScreenPassesAccessibilityAudit` no Simulator; `performAccessibilityAudit()` inclui checagem Dynamic Type na tela visível. Revisar fontes/containers das outras telas estaticamente e reservar a confirmação visual completa para inspeção manual.

### Resultado observado
Na tela Pedido, UIKit usa fontes do Design System baseadas em `UIFontMetrics`/fontes preferidas com `adjustsFontForContentSizeCategory`, os textos aceitam múltiplas linhas e o conteúdo vive em `UIScrollView`. O auditor `.all` passou, incluindo o tipo de auditoria Dynamic Type. A tela inicial não mostrou clipping. Sugestões, Comparação e Confirmação foram revisadas estaticamente, mas não foram executadas nessa categoria de tamanho.

### Critérios para conclusão
- [x] Auditoria Dynamic Type da tela Pedido passou no iOS 18.6 Simulator.
- [x] Fontes e rolagem da tela inicial foram revisadas.
- [x] Escopo ainda não validado nas outras telas ficou registrado.
- [ ] Gabriel revisa em tamanho de texto maior no Simulator.

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

## SUB-P14-005 — Revisar contraste

Estado: REVIEW

Prioridade: P0

Depende de:
SUB-P14-004

### Contexto
O estado do produto usa cores semânticas. A auditoria do sistema pode detectar contrastes insuficientes na tela visível, enquanto uma revisão estática verifica se indisponível/compatível/substituído também usam texto.

### Objetivo
Validar contraste na tela Pedido e confirmar que estados da jornada são compreensíveis sem depender exclusivamente de cor.

### Requisitos
- Usar a auditoria `contrast` do XCTest na tela Pedido.
- Revisar cores semânticas aplicadas pela tela e componentes reutilizados.
- Manter rótulos textuais para estados de disponibilidade.
- Registrar que telas não abertas não têm validação automática nesta execução.

### Critérios de aceite
- [x] A auditoria automatizada padrão (que inclui contraste) passou na tela Pedido.
- [x] Estados disponível, indisponível, compatível e substituído têm comunicação textual nos componentes analisados.
- [x] Cores são consumidas por tokens semânticos; não foram adicionados hex codes na View.
- [x] Limite de cobertura das telas não abertas está documentado.

### Conceitos de engenharia
VoiceOver, labels, traits, contraste e alvos de toque.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Revisar contraste” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Executar `testOrderScreenPassesAccessibilityAudit` e revisar `DSColor`, badges e labels de estado. Accessibility Inspector manual ainda é recomendado para uma inspeção visual completa.

### Resultado observado
O auditor `.all` passou na tela Pedido, incluindo contraste. A tela usa `DSColor` semântico; estados dos cartões e badges incluem texto acessível. As cores em Comparação/Confirmação foram revisadas estaticamente, mas essas telas não foram abertas no auditor nesta tarefa.

### Critérios para conclusão
- [x] Auditoria de contraste da tela Pedido aprovada no iOS 18.6 Simulator.
- [x] Estados de produto não dependem exclusivamente da cor.
- [x] Limitação de cobertura foi registrada.
- [ ] Gabriel revisa cores e estados nas telas restantes.

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

## SUB-P14-006 — Revisar alvos de toque

Estado: REVIEW

Prioridade: P0

Depende de:
SUB-P14-005

### Contexto
CTAs e seleção de candidatos devem continuar fáceis de ativar, inclusive com precisão motora reduzida. UIKit e SwiftUI têm controles nativos e alvos diferentes a revisar.

### Objetivo
Revisar alvos interativos da jornada quanto ao mínimo de 44 × 44 pt e automatizar a checagem da tela Pedido.

### Requisitos
- Executar auditoria de hit region na tela Pedido.
- Revisar dimensões dos botões e a área clicável dos cartões selecionáveis nas outras telas.
- Registrar limites de validação para controles que não foram exercitados no Simulator.

### Critérios de aceite
- [x] A auditoria automatizada não aponta alvos insuficientes na tela Pedido.
- [x] Botões de confirmação, cancelar, fechar e voltar a opções têm pelo menos 44 pt de dimensão acionável no código.
- [x] Cartão selecionável recebe o gesto na área inteira do cartão e tem dimensão superior a 44 × 44 pt pelo conteúdo/constraints.
- [x] Limitações de controles não exercitados e necessidade de validação manual ficam documentadas.

### Conceitos de engenharia
VoiceOver, labels, traits, contraste e alvos de toque.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Revisar alvos de toque” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Executar `testOrderScreenPassesAccessibilityAudit` (inclui hit region na tela visível) e revisar dimensões/constraints de controles SwiftUI e UIKit no código. Confirmar os alvos no Accessibility Inspector antes da conclusão final.

### Resultado observado
A auditoria de acessibilidade completa passou na tela Pedido, incluindo hit region. A inspeção de código encontrou que `makeRetryButton()` não impunha altura mínima; o botão agora tem constraint mínima de 44 pt. Os CTAs SwiftUI usam alturas/paddings mínimos de 44 pt ou maiores, o botão de fechar tem 44 × 44 pt, e o cartão selecionável recebe gesto na área do cartão. O alvo do retry e os controles fora da tela Pedido ainda precisam de inspeção visual/manual.

### Critérios para conclusão
- [x] A auditoria de hit region passou na tela Pedido.
- [x] O botão UIKit de retry possui altura mínima de 44 pt.
- [x] A inspeção estática verificou os alvos das demais ações e documentou limites.
- [ ] Gabriel confere áreas reais dos controles no Accessibility Inspector/Simulator.

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

## SUB-P14-007 — Usar Accessibility Inspector

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P14-006

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Usar Accessibility Inspector.

### Objetivo
Concluir Usar Accessibility Inspector dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
VoiceOver, labels, traits, contraste e alvos de toque.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Usar Accessibility Inspector” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar VoiceOver e Accessibility Inspector manualmente.

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

## SUB-P14-008 — Corrigir problemas

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P14-007

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Corrigir problemas.

### Objetivo
Concluir Corrigir problemas dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
VoiceOver, labels, traits, contraste e alvos de toque.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Corrigir problemas” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar VoiceOver e Accessibility Inspector manualmente.

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

## SUB-P14-009 — Registrar validação

Estado: TODO

Prioridade: P1

Depende de:
- SUB-P14-008

### Contexto
Esta tarefa transforma o plano da fase em um resultado pequeno e revisável: Registrar validation.

### Objetivo
Concluir Registrar validation dentro do escopo definido e deixar o resultado pronto para revisão.

### Requisitos
- Seguir as orientações de AGENTS.md e os documentos de produto e engenharia pertinentes.
- Discutir abordagem e trade-offs com Gabriel antes da implementação; não ampliar o escopo.
- Atualizar planejamento e documentação quando a tarefa for concluída.

### Critérios de aceite
- [ ] O resultado foi produzido dentro do escopo combinado.
- [ ] Decisões e trade-offs foram explicados e registrados.
- [ ] Gabriel revisa o resultado e consegue explicar os conceitos principais.

### Conceitos de engenharia
VoiceOver, labels, traits, contraste e alvos de toque.

### Estudar antes da implementação
Revisar as orientações pertinentes em AGENTS.md e nas fontes do projeto. Gabriel explica o objetivo e as alternativas prováveis antes da implementação.

### Perguntas que preciso saber responder
- Que problema “Registrar validation” resolve e por que esta abordagem é adequada?
- Que alternativa foi considerada e qual trade-off esta escolha envolve?
- Como o resultado será validado e mantido?

### Validação
Usar VoiceOver e Accessibility Inspector manualmente.

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
