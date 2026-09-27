# Trabalho atual

## Prazo

Segunda-feira, 28 de setembro de 2026, às 11h, em `America/Sao_Paulo` (horário de Brasília). Consulte o roadmap para marcos e corte de escopo.

## Fase atual

FASE 09 — Laboratório de GCD

## Tarefa atual

SUB-P09-001 — Estudar DispatchQueue serial e concorrente

## Tasks em revisão

- SUB-P09-001–009 — Laboratório GCD e comparação com Swift Concurrency

## Estado

REVIEW

## Objetivo

Revisar um laboratório de estudo executável que demonstra filas, QoS, `sync`/`async`, `DispatchGroup`, barreiras, proteção de estado e comparação com `TaskGroup`, sem adicionar GCD ao app.

## Por que agora

Gabriel pediu para seguir para a Fase 09 e voltar à Fase 08 depois. O laboratório é uma trilha isolada P2; não altera a arquitetura principal nem depende da conclusão das tasks de UI.

## Bloqueios

A Fase 08 continua pendente para retomada. O laboratório GCD foi compilado com Swift 6.1.2 e `-warnings-as-errors`, e executado localmente; os resultados observados estão registrados em `StudyLabs/GCD/README.md` e na task da fase.

## Próxima task

Gabriel revisa e explica as tasks `SUB-P09-001`–`SUB-P09-009`. Depois, retomamos a Fase 08; não considerar a Fase 08 concluída por termos estudado GCD.

## Trilha de entrega

Problema → bootstrap → MVVM-C mínimo → domínio/ranking → API limitada e inventário local → Design Discovery/foundations → fluxo UIKit → comparação SwiftUI → testes e acessibilidade essenciais → Logger → README e validação final. Itens P1/P2 não bloqueiam esta trilha.

## Último marco

O executável independente `StudyLabs/GCD/GCDStudyLab.swift` compila em Swift 6.1 e termina com todas as demonstrações. A saída observada confirma contador protegido igual a 1000, barreira entre leituras e resultado estável de `TaskGroup`.

> A Fase 08 e as tasks de Repository continuam aguardando a revisão de Gabriel; as tasks desta fase estão em `REVIEW`, nunca `DONE` automaticamente.
