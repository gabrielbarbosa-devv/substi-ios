# Concorrência

Swift Concurrency é o modelo principal planejado para operações assíncronas. O uso de `async/await`, `Task`, `TaskGroup`, `actor`, `MainActor`, `Sendable` e cancelamento será introduzido em microtarefas conforme o fluxo exigir.

```text
interação do usuário
        ↓
Task assíncrona → acesso a dados → resultado ou erro
        ↓                         ↘ cancelamento
estado da interface isolado em MainActor
```

Comece por uma sequência assíncrona simples. Use `TaskGroup` somente quando houver um conjunto dinâmico de operações concorrentes e benefício demonstrável. Limite chamadas à API, respeite rate limits e considere falhas parciais e cancelamento. Não use `Task.detached` ou `@unchecked Sendable` para contornar o modelo sem justificativa.

GCD será estudado em um laboratório separado, principalmente para entender filas, QoS, `sync`/`async`, barreiras, race conditions e deadlocks. Não misture GCD com Swift Concurrency sem uma necessidade concreta.

Para cada escolha, explique quem executa o código, que estado é compartilhado e protegido, o que pode concorrer e como a operação termina ou é cancelada. Consulte [AGENTS.md](../AGENTS.md) e as Fases 08 e 09.
