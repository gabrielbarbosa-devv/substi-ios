# Gerenciamento de memória

Ownership e ciclo de vida serão revisados em cada tarefa que introduzir objetos com referências, closures ou trabalho assíncrono.

```text
Coordinator ─strong→ ViewController ─strong→ ViewModel
                         │                       │
                         └── closures/delegates ─┘
```

O desenho acima é um exemplo para discussão, não um ownership graph já implementado. Para cada tipo, identifique quem o instancia, quem mantém referências fortes, quando deve liberar e se alguma `Task` pode sobreviver à tela.

Não acrescente `[weak self]` automaticamente. Analise retenção, ARC, semântica de valor e referência, closures, `strong`, `weak`, `unowned`, retain cycles, `deinit`, stack/heap e Copy-on-Write conforme aplicável. Use Memory Graph, Allocations e Leaks quando houver uma pergunta concreta que essas ferramentas possam responder.

Consulte [AGENTS.md](../AGENTS.md) e a [Fase 10 — Gerenciamento de memória](project/phases/PHASE-10-memory-management.md).
