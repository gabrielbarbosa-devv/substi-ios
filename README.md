# Substi iOS

**Smart Grocery Substitution** — a small iOS product exploring how to help a shopper evaluate alternatives when a grocery item becomes unavailable.

**Status:** Work in Progress. The repository currently contains product and engineering planning documentation; the iOS application has not been implemented yet.

## Product problem

An unavailable grocery item reopens a decision the shopper had already made. Comparing category, quantity, brand, and other relevant attributes may take effort and leave the shopper uncertain about which alternative fits. Substi explores presenting compatible alternatives and explaining why each may be a suitable replacement.

This project does not claim that iFood lacks substitution functionality. See the [product problem and assumptions](docs/product-requirements.md).

## Project goals

The goal is to deliver a small, working product slice and make its engineering decisions understandable and reviewable. The project is also a learning and interview preparation exercise: the developer should be able to explain the reasoning, alternatives, trade-offs, ownership, concurrency, and tests behind each meaningful change.

Quality and clarity take priority over the number of technologies used. Concepts that do not fit the delivery scope can remain documented as future engineering evolution.

## Delivery approach

The [Delivery Track](docs/project/ROADMAP.md#delivery-track--deadline-tomorrow-1100) is a deadline-focused vertical slice through product discovery, bootstrap, minimal architecture, domain and ranking, networking, a small design foundation, UIKit, one SwiftUI integration, critical tests, basic observability, and final documentation. It is separate from the 20-phase [Engineering Master Plan](docs/project/ROADMAP.md), which documents possible future evolution and is not a requirement to implement every technology before delivery.

Work is tracked as small tasks in [`docs/project/BACKLOG.md`](docs/project/BACKLOG.md). [`docs/project/CURRENT.md`](docs/project/CURRENT.md) identifies the only active task. A task is implemented and explained before the next one begins; implementation moves it to `REVIEW`, and the developer marks it `DONE` after review and being able to explain the result.

## Planned technical direction

These are project decisions and plans, not claims about code already present:

- **Platform and toolchain:** iOS 16+, Xcode 16.4, Swift 6.1, and Swift 6 Language Mode; development target is an Intel-based Mac.
- **Architecture:** MVVM-C, with navigation owned by a Coordinator and dependencies flowing through clear boundaries. Abstractions should be added only where they solve a real problem.
- **UI:** UIKit with programmatic Auto Layout as the primary flow, plus one SwiftUI comparison feature integrated through `UIHostingController`. The design should remain Apple-first and accessible.
- **Product data:** URLSession and Open Food Facts for product information. Order inventory and availability are local challenge data; the public product API does not represent store inventory.
- **Dependencies:** Swift Package Manager if a package is needed. No third-party package is currently required or approved.
- **Quality:** focused tests for ranking, mapping/network behavior, and ViewModels; accessibility and ownership review; and basic native logging. The roadmap records what is essential for the submission and what remains future work.

## Why these choices

The planned UIKit and SwiftUI combination demonstrates incremental adoption while keeping navigation under one Coordinator and visual foundations shared. MVVM-C is the selected project architecture because it separates presentation state from navigation without requiring a large framework. URLSession and the public product data source keep the initial integration close to platform APIs. These choices will be introduced in small tasks and revisited if evidence shows they do not fit.

## Repository guide

| Path | Purpose |
| --- | --- |
| [`AGENTS.md`](AGENTS.md) | Pair-programming, architecture, learning, and engineering rules |
| [`docs/product-requirements.md`](docs/product-requirements.md) | Product problem, assumptions, expected user and business value |
| [`docs/architecture.md`](docs/architecture.md) | Planned architecture and dependency direction |
| [`docs/ai-development.md`](docs/ai-development.md) | AI collaboration and human validation approach |
| [`docs/concurrency.md`](docs/concurrency.md) | Concurrency principles and learning plan |
| [`docs/memory-management.md`](docs/memory-management.md) | Ownership and memory learning plan |
| [`docs/project/ROADMAP.md`](docs/project/ROADMAP.md) | Delivery Track and 20-phase engineering plan |
| [`docs/project/BACKLOG.md`](docs/project/BACKLOG.md) | Task index and priorities |
| [`docs/project/CURRENT.md`](docs/project/CURRENT.md) | Current phase, task, status, and next task |
| [`docs/project/GIT-WORKFLOW.md`](docs/project/GIT-WORKFLOW.md) | Branch, commit, and review conventions |
| [`docs/project/DEFINITION-OF-DONE.md`](docs/project/DEFINITION-OF-DONE.md) | Completion and review criteria |

## Working with the project

Before starting a task, read its description, `AGENTS.md`, and relevant product or architecture documents. Work only on the selected task, describe the problem and proposed change, and keep the diff small enough to review. After implementation, explain how it works and its trade-offs, validate the task's acceptance criteria, and wait for the developer's review before proceeding.

See [`docs/project/GIT-WORKFLOW.md`](docs/project/GIT-WORKFLOW.md) for branch names, Conventional Commit messages, and the path from a task branch to `main`.
