# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Fase atual

FASE 08 — Concorrência em Swift (execução pela Delivery Track)

## Tasks em revisão

- SUB-P08-001 — Carregar um produto com async
- SUB-P07-001 — Definir ProductRepository
- SUB-P07-002 — Definir InventoryRepository
- SUB-P07-003 — Criar fixtures de inventário
- SUB-P07-005 — Implementar composição do Repository
- SUB-P07-008 — Testar resultados remotos

## Estado

REVIEW

## Objetivo

Conectar a aplicação ao contrato `ProductRepository` por meio de um Use Case pequeno, mantendo a busca assíncrona isolada de UI e networking.

## Por que agora

APIClient, DTO, Mapper e Repository já realizam a busca assíncrona. Este Use Case cria o ponto de entrada da aplicação previsto no fluxo de dependências, sem antecipar telas ou uma ViewModel antes de Gabriel enviar as referências visuais.

## Bloqueios

Os testes do target ainda precisam ser executados com Xcode selecionado. `xcodebuild -version` informa que o diretório ativo é Command Line Tools (`/Library/Developer/CommandLineTools`), então não foi possível executar o target `SubstiTests`. A API pública fornece catálogo de produtos, não estoque de loja.

## Próxima task

Gabriel revisa `SUB-P08-001` e executa/acompanha `SubstiTests` em Xcode. A próxima implementação de UI depende das referências de tela de Gabriel e do Design Discovery/Screen Contract.

## Trilha de entrega

Problema → bootstrap → MVVM-C mínimo → domínio/ranking → API limitada e inventário local → Design Discovery/foundations → fluxo UIKit → comparação SwiftUI → testes e acessibilidade essenciais → Logger → README e validação final. Itens P1/P2 não bloqueiam esta trilha.

## Último marco

SUB-P08-001 — `LoadProductUseCase` conecta a aplicação ao protocolo `ProductRepository`; testes determinísticos cobrem sucesso, código de barras e erro. Sem criar protocolo adicional, GCD ou UI.

> SUB-P06-006–011 também permanecem em `REVIEW`; Gabriel é quem decide quando os aprova e os move para `DONE`.
