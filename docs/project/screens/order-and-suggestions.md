# Contratos de tela — primeira etapa

As telas nesta etapa usam os dados locais de demonstração. O inventário local é fixture; não representa disponibilidade de loja.

## Pedido

### Purpose

Mostrar o pedido e tornar visível qual item precisa de uma nova decisão.

### User Goal

Reconhecer o produto indisponível e abrir as alternativas.

### Information Hierarchy

1. Estado de indisponibilidade e o que aconteceu.
2. Nome, marca e quantidade do produto.
3. Ação “Escolher substituto”.

### Components

Navigation Bar nativa, `DSProductCardView`, `DSStatusBadgeView` e `DSButton`.

### States

- Content: pedido com um ou mais itens indisponíveis.
- Empty: pedido sem item indisponível; CTA oculto.
- Loading/error: não se aplicam enquanto a origem é uma fixture local síncrona.

### Actions

Abrir a tela de sugestões para um item indisponível. A navegação pertence ao Coordinator.

### Accessibility

Texto escalável, label de estado, ordem de leitura natural e ação com alvo nativo de botão. Placeholder de imagem decorativo é ignorado pelo VoiceOver.

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
