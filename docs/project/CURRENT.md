# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Fase atual

FASE 08 — Concorrência em Swift (trilha de entrega)

## Tarefa atual

SUB-P08-001 — Carregar um produto com async

## Estado

REVIEW

## Objetivo

Conectar a aplicação ao contrato `ProductRepository` por meio de um Use Case pequeno, mantendo a busca assíncrona isolada de UI e networking.

## Por que agora

APIClient, DTO, Mapper e Repository já realizam a busca assíncrona. O Use Case cria o ponto de entrada da aplicação sem criar outro protocolo ou antecipar uma ViewModel sem tela associada.

## Bloqueios

- `xcodebuild build-for-testing` compilou o app, `SubstiTests` e `SubstiUITests` com Xcode 16.4 (16F6). Duas tentativas de teste iniciaram o Simulator, mas o runner XCTest ficou aguardando `workers to materialize`; ambas foram interrompidas com exit code 75. Nenhum teste de runtime foi declarado aprovado.
- `SUB-P08-007` aguarda uma ViewModel real da feature para que `MainActor` seja aplicado a estado de apresentação usado pelo produto.
- A API pública fornece catálogo de produtos, não estoque de loja; candidatos de demonstração continuam locais.

## Próxima task

A pedido de Gabriel, seguir para `SUB-P09-001 — Estudar DispatchQueue serial e concorrente` como laboratório isolado, sem incorporar GCD ao app. Isso não marca a Fase 08 como concluída.

## Trilha de entrega

Problema → bootstrap → MVVM-C mínimo → domínio/ranking → API limitada e inventário local → Design Discovery/foundations → fluxo UIKit → comparação SwiftUI → testes e acessibilidade essenciais → Logger → README e validação final. Itens P1/P2 não bloqueiam esta trilha.

## Último marco

`LoadProductUseCase` conecta a aplicação ao protocolo `ProductRepository`; testes determinísticos cobrem sucesso, código de barras e erro. Build dos targets passou; execução XCTest permanece sem resultado devido ao runner do Simulator.

> SUB-P06-006–011 e SUB-P07-001–008 também têm tasks em `REVIEW`; Gabriel é quem decide quando as aprova e as move para `DONE`.
