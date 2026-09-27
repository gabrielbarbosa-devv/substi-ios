# Git Workflow

This repository uses small, reviewable branches and Conventional Commits so a reviewer can follow what changed, why it changed, and how it was validated.

## Branch model

`main` is the principal integration branch. It should contain a coherent, reviewable project state. Development work happens on a separate branch created from the latest `main`, and is proposed back to `main` through a pull request. Do not develop directly on `main` or force-push it.

Use one branch for one task or one tightly related change. Include the task ID when there is one, followed by a short, lowercase, hyphen-separated description.

| Change | Branch pattern | Example |
| --- | --- | --- |
| Product capability | `feature/<task-id>-<summary>` | `feature/sub-p04-001-product-model` |
| Bug correction | `bugfix/<task-id>-<summary>` | `bugfix/sub-p06-008-handle-empty-response` |
| Documentation | `docs/<task-id>-<summary>` | `docs/sub-p00-001-product-problem` |
| Refactoring | `refactor/<task-id>-<summary>` | `refactor/sub-p05-006-ranking-rules` |
| Tests | `test/<task-id>-<summary>` | `test/sub-p05-002-ranking-red-test` |
| Build or repository maintenance | `chore/<summary>` | `chore/git-workflow-readme` |

Use `feature/` for a new user-visible capability. Use `bugfix/` when correcting behavior that does not meet an existing requirement. A new requirement should be a feature, even if the old behavior was inconvenient. If the work has no task ID yet, record or select its task before expanding the branch scope.

## Commit messages

Use this Conventional Commit shape:

```text
<type>(<optional-scope>): <short imperative summary>
```

Keep a commit focused on one understandable change. Use the type that describes the change:

| Type | Use |
| --- | --- |
| `feat` | Add a user-visible capability |
| `fix` | Correct a defect in existing behavior |
| `docs` | Add or change documentation |
| `test` | Add or change tests without changing product behavior |
| `refactor` | Restructure code without changing behavior |
| `chore` | Repository or development maintenance |
| `build` | Change build configuration or dependencies |
| `ci` | Change continuous integration configuration |
| `perf` | Make a measured performance improvement |

Examples:

```text
docs: define grocery substitution problem
feat(domain): add product value type
test(ranking): define category score behavior
fix(networking): handle empty product response
```

Do not use a commit message that hides several unrelated tasks, such as `update project` or `finish app`. Suggest the commit message and explain the change before committing; the developer decides when to commit unless they explicitly authorized a commit.

## Task-to-merge flow

```text
CURRENT.md identifies one task
             ↓
update local main from origin/main
             ↓
create a task branch
             ↓
make only that task's change
             ↓
review diff and acceptance criteria
             ↓
commit with a Conventional Commit message
             ↓
push branch and open a pull request to main
             ↓
developer reviews, understands, and approves
             ↓
merge to main; sync local main
```

Before opening the pull request, summarize the problem, decision, alternatives, trade-offs, changed files, and validation. Link the task ID in the pull request title or description. A task enters `REVIEW` when implementation is ready for developer review; it becomes `DONE` only after the developer approves it and can explain the change. Do not begin another task automatically.

## Initial repository setup

The GitHub repository's existing `main` branch is the source of the initial history. Keep it as `origin/main`; publish project work from a branch and integrate it through review. Never replace the remote history with a force push.
