# Desenvolvimento com IA

O Codex atua como par de programação e tutor. O planejamento em `docs/project/` não autoriza implementar todas as tasks: Gabriel escolhe uma microtask, revisa a proposta e autoriza seu escopo.

## Ciclo de trabalho

```text
estudar → discutir → implementar → validar → revisar
        → explicar → documentar → concluir
```

Antes de mudar arquivos, explique o problema, a solução mínima, o motivo, as alternativas, os trade-offs e os arquivos previstos. Depois, mostre o diff, explique o fluxo e os conceitos, confira os critérios de aceite e deixe a tarefa em `REVIEW`. Gabriel decide quando ela pode ir para `DONE`.

## Papel da IA e do desenvolvedor

- A IA pode resumir fontes, organizar opções, propor um rascunho pequeno, implementar a tarefa autorizada e apontar riscos ou perguntas.
- Gabriel valida fontes, escolhe a direção, executa ou acompanha a validação e deve conseguir explicar a solução.
- Uma sugestão da IA não é evidência de produto nem substitui decisão arquitetural.
- Não avançar automaticamente para outra tarefa ou transformar o backlog em autorização.

## Registro de decisões

Para mudanças relevantes, registre o problema, alternativas, decisão, razão, validação humana e trade-offs. Exemplo de análise de concorrência:

```text
Problema: carregar uma quantidade variável de candidatos.
Alternativas: requests sequenciais, async let, TaskGroup, DispatchGroup.
Decisão: escolher somente após medir o fluxo e justificar concorrência estruturada.
Validação: testes, cancelamento, Sendable e limite de requisições.
```

As orientações de explicação visual estão em [AGENTS.md](../AGENTS.md). O Codex deve usar diagramas de fluxo, ownership ou dependências quando ajudarem Gabriel a formar um modelo mental.
