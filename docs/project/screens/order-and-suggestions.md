# Contratos de tela — primeira etapa

As telas nesta etapa usam os dados locais de demonstração. O inventário local é fixture; não representa disponibilidade de loja.

Referência visual detalhada da tela Pedido: [order-screen-reference.png](../../assets/order-screen-reference.png). A imagem orienta hierarquia e estado visual; os produtos não têm imagens individuais no projeto ainda.

Referência visual da tela Escolher substituto: [suggestions-screen-reference.png](../../assets/suggestions-screen-reference.png). Ela orienta a composição; informações que as fixtures e o domínio não fornecem, como preço dos candidatos ou percentual de compatibilidade, não serão inventadas.

Referência visual da tela Comparação: [comparison-screen-reference.png](../../assets/comparison-screen-reference.png). A imagem orienta a comparação lado a lado; preço do substituto, nutrição, fotos individuais e percentual de compatibilidade não estão nos dados atuais e não serão simulados.

## Pedido

### Purpose

Mostrar o pedido e tornar visível qual item precisa de uma nova decisão.

### User Goal

Reconhecer o produto indisponível e abrir as alternativas.

### Information Hierarchy

1. Estado geral do pedido: “Em preparação”.
2. Produto indisponível com superfície de erro suave, estado textual e affordance de navegação.
3. Aviso de que uma decisão é necessária e CTA “Escolher substituto”.
4. Outros produtos disponíveis, com quantidade, preço da linha e confirmação visual.

### Components

Navigation Bar nativa, `DSStatusBannerView`, `DSProductCardView`, `DSStatusBadgeView`, `DSInfoBannerView` e `DSButton`.

### States

- Content: pedido com um ou mais itens indisponíveis.
- Empty: pedido sem item indisponível; CTA oculto.
- Loading/error: não se aplicam enquanto a origem é uma fixture local síncrona.
- Product: `available` e `unavailable` nesta fatia; `substituted` permanece reservado para depois da confirmação.

### Actions

Abrir a tela de sugestões para um item indisponível. A navegação pertence ao Coordinator.

### Accessibility

Texto escalável, estado anunciado também em texto, ordem de leitura natural, cartões agrupados para VoiceOver e ação com alvo nativo de botão. O placeholder de imagem é decorativo e ignorado pelo VoiceOver.

### Dados demonstrativos

A fixture contém banana nanica (R$ 4,99), leite integral Marca A (R$ 7,99) e ovos brancos (R$ 12,90). Os preços pertencem a `OrderItem` e são dados locais de demonstração; não são retornados pela Open Food Facts nem representam preço de uma loja real.

### Analytics

Nenhum evento é enviado nesta etapa; analytics não está implementado.

## Sugestões

### Purpose

Mostrar o produto original e alternativas locais com informação comparável.

### User Goal

Inspecionar diferenças relevantes antes de escolher uma alternativa.

### Information Hierarchy

1. Produto que precisa ser substituído.
2. Convite para comparar opções.
3. Nome, marca e quantidade de cada candidato.
4. Sinais limitados que os dados atuais sustentam: categoria e quantidade correspondentes.

### Components

Navigation Bar nativa, `DSProductCardView`, `DSStatusBadgeView`, `DSInfoBannerView` para estado vazio e `DSButton` fixado no rodapé.

### States

- Content: produto original e candidatos da fixture; nenhuma opção começa selecionada. A seleção única fica visível no card.
- Empty: nenhum candidato na fixture para o produto.
- Loading/error: não se aplicam enquanto a origem é local e síncrona.
- CTA: “Ver comparação” é habilitado depois que a pessoa seleciona um candidato e o Coordinator fornece o destino.

### Actions

Selecionar uma opção para comparar. O Coordinator abre Comparação por `UIHostingController`. Não inventar preço, percentual de compatibilidade ou disponibilidade real.

### Accessibility

Texto escalável, estado de seleção anunciado pelo VoiceOver, rótulos sem depender apenas de cor e sequência original → alternativas.

### Analytics

Nenhum evento é enviado nesta etapa; analytics não está implementado.

### Limites dos dados demonstrativos

As opções locais servem para demonstrar a tela. O modelo atual não contém preço nem imagem para candidatos; cartões usam o placeholder do Design System. A correspondência de categoria e quantidade é evidência apresentada, não um percentual ou garantia de adequação. O botão abre a comparação do candidato selecionado.

## Comparação

### Purpose

Permitir que a pessoa compare o item original com o candidato selecionado.

### User Goal

Entender o que permanece igual e o que muda antes de confirmar uma substituição.

### Information Hierarchy

1. Identificação do original e do substituto.
2. Categoria, quantidade, marca e preço em linhas comparáveis.
3. Indicação explícita quando um dado não está disponível.
4. Ação para voltar às opções.

### Components

Navigation Bar UIKit nativa, cartões e linhas SwiftUI locais à feature. A tela reutiliza `DSColor`, `DSSpacing` e `DSRadius`, com fontes semânticas SwiftUI para Dynamic Type. Não foi criado componente genérico SwiftUI adicional.

### States

- Content: recebe original e candidato selecionado.
- Loading/empty/error: não se aplicam enquanto os dados são passados sincronamente pelo Coordinator.
- Preço ausente do candidato: “Não informado”.
- Confirmação: botão visível e desabilitado; a etapa de confirmação ainda não foi implementada.

### Actions

Voltar para Sugestões pela ação entregue pelo Coordinator. A View não controla `UINavigationController`. A confirmação fica para uma task futura.

### Accessibility

Cards e linhas agrupam conteúdo em ordem lógica e anunciam papel e valores dos produtos. Fontes semânticas respondem a Dynamic Type. “Ver outras opções” tem alvo mínimo de 44 pontos; o sistema anuncia o CTA desabilitado.

### Analytics

Nenhum evento é enviado; analytics não está implementado.

### Limites dos dados demonstrativos

O preço do item original vem de `OrderItem`; `SubstitutionCandidate` não contém preço. A API e as fixtures também não fornecem foto individual, nutrição nem percentual de compatibilidade. A comparação apresenta nome, marca, categoria, quantidade e preço quando disponível. Categorias conhecidas da fixture recebem rótulos em português.
