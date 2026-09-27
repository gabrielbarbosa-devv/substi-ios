# Fluxo de trabalho com Git

O histórico do Git deve ajudar quem avalia o projeto a entender o que mudou, por que mudou e como foi validado. Use branches pequenas e commits Conventional Commits, cada qual com um propósito compreensível.

## Branches

`main` é a branch principal de integração e deve conter um estado coerente e revisável. Faça desenvolvimento em uma branch separada criada a partir da `main` atualizada e proponha a mudança por pull request. Não desenvolva diretamente em `main` nem faça force-push.

Uma branch representa uma tarefa ou uma mudança estreitamente relacionada. Inclua o ID da tarefa quando existir, seguido de uma descrição curta, minúscula e separada por hífens.

| Tipo de mudança | Padrão da branch | Exemplo |
| --- | --- | --- |
| Nova capacidade do produto | `feature/<tarefa-id>-<resumo>` | `feature/sub-p04-001-product-model` |
| Correção de comportamento existente | `bugfix/<tarefa-id>-<resumo>` | `bugfix/sub-p06-008-handle-empty-response` |
| Documentação | `docs/<tarefa-id>-<resumo>` | `docs/sub-p00-001-product-problem` |
| Refatoração | `refactor/<tarefa-id>-<resumo>` | `refactor/sub-p05-006-ranking-rules` |
| Testes | `test/<tarefa-id>-<resumo>` | `test/sub-p05-002-ranking-red-test` |
| Manutenção de build ou repositório | `chore/<resumo>` | `chore/git-workflow-readme` |

Use `feature/` para uma capacidade nova visível à pessoa usuária. Use `bugfix/` ao corrigir comportamento que não atende a um requisito existente. Uma nova necessidade é feature, ainda que o comportamento anterior fosse inconveniente. Se ainda não há ID, registre ou selecione a tarefa antes de ampliar o escopo da branch.

## Mensagens de commit

Formato Conventional Commits:

```text
<tipo>(<escopo-opcional>): <resumo imperativo curto>
```

Mantenha cada commit focado em uma mudança compreensível. Escolha o tipo que descreve a alteração:

| Tipo | Uso |
| --- | --- |
| `feat` | Nova capacidade visível no produto |
| `fix` | Correção de defeito existente |
| `docs` | Documentação criada ou alterada |
| `test` | Testes alterados sem mudar o comportamento do produto |
| `refactor` | Reestruturação sem mudar o comportamento |
| `chore` | Manutenção do repositório ou ambiente de desenvolvimento |
| `build` | Configuração de build ou dependências |
| `ci` | Integração contínua |
| `perf` | Melhoria de desempenho baseada em medição |

Exemplos:

```text
docs: definir problema de substituição de produtos
feat(domain): adicionar tipo de valor Product
test(ranking): definir comportamento da categoria
fix(networking): tratar resposta vazia de produtos
```

Não use mensagens vagas, como `update project` ou `finish app`. Sugira a mensagem e explique seu escopo antes de commitar; o desenvolvedor decide quando autorizar o commit, salvo quando já o tiver autorizado explicitamente.

## Fluxo da tarefa até a integração

```text
CURRENT.md aponta uma tarefa
             ↓
atualizar main local a partir de origin/main
             ↓
criar branch da tarefa
             ↓
alterar somente o escopo autorizado
             ↓
revisar diff e critérios de aceite
             ↓
commitar com Conventional Commits
             ↓
enviar branch e abrir pull request para main
             ↓
Gabriel revisa, compreende e aprova
             ↓
integrar na main e sincronizar a cópia local
```

Antes de abrir um PR, resuma problema, decisão, alternativas, trade-offs, arquivos alterados e validação. Inclua o ID da tarefa no título ou na descrição. A tarefa vai para `REVIEW` quando estiver pronta para revisão; só Gabriel a muda para `DONE` depois de aprovar e explicar o resultado. Não comece outra tarefa automaticamente.

## Configuração inicial deste repositório

A branch `main` já existente no GitHub é a origem do histórico. Preserve `origin/main` e publique o trabalho em uma branch de desenvolvimento. Nunca substitua o histórico remoto com force-push.
