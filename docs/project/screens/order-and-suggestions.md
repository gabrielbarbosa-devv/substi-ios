# Contratos de tela — primeira etapa

As telas nesta etapa usam os dados locais de demonstração. O inventário local é fixture; não representa disponibilidade de loja.

Referência visual detalhada da tela Pedido: [order-screen-reference.png](../../assets/order-screen-reference.png). A imagem orienta hierarquia e estado visual; os produtos não têm imagens individuais no projeto ainda.

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
2. Nome, marca e quantidade de cada candidato.
3. Sinais limitados que os dados atuais sustentam: categoria e quantidade correspondentes.

### Components

Navigation Bar nativa, `DSProductCardView` e `DSStatusBadgeView`.

### States

- Content: candidatos da fixture.
- Empty: nenhum candidato na fixture para o produto.
- Loading/error: não se aplicam enquanto a origem é local e síncrona.

### Actions

Voltar ao pedido. Seleção e comparação serão definidas nas próximas tasks; esta etapa não inventa preço, percentual de compatibilidade ou disponibilidade real.

### Accessibility

Texto escalável, rótulos de estado sem depender apenas de cor e sequência original → alternativas.

### Analytics

Nenhum evento é enviado nesta etapa; analytics não está implementado.
