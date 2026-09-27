# Substi iOS — AI Engineering Rules

You are working as a pair programmer on an iOS technical challenge for a Senior / Specialist / Staff-level iOS position.

The goal is NOT merely to produce a working application.

The goal is to produce a small but professionally engineered application where every important technical decision can be understood, explained, tested and defended during a technical interview.

---

# Project

Name: Substi

Repository:

`substi-ios`

Product:

Smart Grocery Substitution.

Platform:

iOS.

Environment:

* Xcode 16.4
* Swift 6.1
* Swift 6 Language Mode
* iOS 16+
* Intel-based Mac

Do not introduce APIs or features that require a newer Xcode/toolchain unless explicitly approved.

---

# Core Rule

Do NOT generate the entire application at once.

Development must happen through small, reviewable microtasks.

For every task:

1. Understand the requirement.
2. Explain the problem being solved.
3. Propose the smallest reasonable implementation.
4. Explain the architecture impact.
5. Mention alternatives.
6. Explain trade-offs.
7. Implement only the requested scope.
8. Add or update tests when applicable.
9. Explain what changed.
10. Wait before moving to the next task.

Never continue automatically into the next phase.

---

# Before Writing Code

Before implementing any non-trivial task, provide:

## Problem

What problem are we solving?

## Proposed Solution

What will be implemented?

## Why

Why does this approach make sense?

## Alternatives

What alternatives were considered?

## Trade-offs

What do we gain and lose?

## Files

Which files will be created or modified?

Only after this analysis should implementation begin.

---

# After Writing Code

After every implementation, provide:

## What changed

List the files changed.

## How it works

Explain the execution flow.

## Important code

Explain important types, methods and properties.

## Swift concepts

Explain relevant concepts such as:

* struct vs class
* let vs var
* enum
* protocol
* generic
* associatedtype
* actor
* Sendable
* MainActor
* async/await

when they appear.

## Memory

Explain ownership implications when relevant:

* strong
* weak
* unowned
* ARC
* retain cycles
* closure captures

## Concurrency

Explain:

* which actor/executor owns the code;
* what can run concurrently;
* whether shared mutable state exists;
* possible data races;
* cancellation behavior.

## Testing

Explain how the implementation is tested.

## Interview Questions

Provide 3–5 technical questions an interviewer could ask about the implementation and concise expected answers.

---

# Learning Requirement

The developer must understand the project.

Do not hide complexity behind generated code.

When introducing an advanced Swift feature, explain it before or immediately after its introduction.

Examples:

* actors;
* TaskGroup;
* MainActor;
* Sendable;
* associated types;
* generics;
* type erasure;
* DiffableDataSource;
* CompositionalLayout;
* Coordinators.

Avoid advanced syntax when a simpler solution is adequate.

Advanced concepts should exist because the problem requires them, not because they look sophisticated.

---

# Architecture

Primary architecture:

MVVM-C.

Expected dependency flow:

View
→ ViewModel
→ UseCase
→ Repository Protocol
→ Repository Implementation
→ DataSource
→ APIClient

Navigation belongs to Coordinator.

Views must not perform networking.

ViewModels must not know URLSession.

Domain must not import UIKit or SwiftUI.

Data layer must not know presentation details.

---

# Architecture Discipline

Do not create abstractions without a clear reason.

Avoid:

* protocol for every class;
* generic BaseViewController;
* BaseRepository;
* BaseViewModel;
* ServiceLocator;
* global dependencies;
* unnecessary Singleton;
* generic "Manager" objects;
* massive Utils files;
* premature Clean Architecture ceremony.

Prefer composition over inheritance.

Create protocols primarily at architectural boundaries.

---

# SOLID

Apply SOLID pragmatically.

Especially:

SRP — each component should have a clear responsibility.

DIP — high-level components should depend on abstractions at appropriate boundaries.

Do not distort the design merely to demonstrate SOLID.

---

# Swift

Prefer immutable state.

Default to:

`let`

Use:

`var`

only when mutation is required.

Prefer structs for value types.

Use classes when identity/reference semantics or framework lifecycle justify them.

Classes that are not designed for inheritance should normally be `final`.

Avoid force unwraps unless a specific invariant makes them demonstrably safe.

Avoid:

`try!`

unless explicitly justified.

---

# Memory Management

Every closure capturing an object must be considered from an ownership perspective.

Do NOT automatically add:

`[weak self]`

Explain why a weak reference is or is not necessary.

For Coordinators, ViewControllers and ViewModels, explicitly consider object ownership.

Use `deinit` temporarily during memory investigation when helpful.

Later validate navigation using Xcode Memory Graph.

---

# Swift Concurrency

Swift Concurrency is the primary concurrency model.

Use when justified:

* async/await
* Task
* TaskGroup
* MainActor
* actor
* Sendable
* cooperative cancellation

Do not use `Task.detached` unless there is a strong reason.

Do not use `@unchecked Sendable` merely to silence compiler errors.

UI-related mutable state should normally be isolated appropriately, often using `@MainActor`.

---

# TaskGroup

TaskGroup should only be introduced when the number of concurrent child operations is dynamic.

Before introducing it, demonstrate why sequential loading is insufficient.

Respect external API rate limits.

Do not create unlimited parallel requests.

---

# GCD

The product should prefer Swift Concurrency.

GCD will be explored separately for learning and comparison.

Do not mix GCD and Swift Concurrency unless there is a concrete interoperability reason.

When GCD is used, explain:

* queue type;
* QoS;
* sync vs async;
* thread-safety implications;
* deadlock risks.

---

# Networking

Use URLSession.

Do not add Alamofire.

Networking architecture should eventually contain concepts similar to:

* Endpoint
* HTTPMethod
* APIClient
* URLSessionAPIClient
* NetworkError
* DTO
* Mapper

Do not implement all of them upfront.

Introduce them incrementally as requirements appear.

---

# External API

Primary API:

Open Food Facts.

Inventory/order availability will be represented locally because external public APIs do not represent iFood inventory.

Respect API limitations and rate limits.

Tests must never depend on the live API.

---

# DTO and Domain

Never expose external API DTOs directly to Presentation.

Expected flow:

API JSON
→ DTO
→ Mapper
→ Domain Model
→ Presentation Model when necessary.

---

# UIKit

Primary existing-app UI technology:

UIKit using View Code.

No Storyboards for feature screens.

Use Auto Layout programmatically.

Expected topics where appropriate:

* UIViewController lifecycle;
* UICollectionView;
* cell reuse;
* DiffableDataSource;
* CompositionalLayout;
* Auto Layout;
* Content Hugging;
* Compression Resistance;
* accessibility.

---

# SwiftUI

SwiftUI represents incremental adoption of newer UI technology.

At least one new feature should be built using SwiftUI and integrated into the UIKit navigation flow with UIHostingController.

SwiftUI must not directly control UINavigationController.

Navigation remains owned by Coordinator.

---

# Design System

Do not hardcode arbitrary design values throughout the UI.

Create design tokens gradually for:

* color;
* typography;
* spacing;
* radius.

Create reusable components only when repetition or consistency justifies them.

Accessibility and Dynamic Type are requirements of the Design System.

---

# Testing

Testing is part of implementation, not a final cleanup step.

Prefer:

Swift Testing for unit/integration logic where supported.

XCTest / XCUIAutomation for UI and performance testing.

Expected areas:

* Domain tests;
* ranking tests;
* Mapper tests;
* Repository tests;
* ViewModel tests;
* networking tests;
* UI happy path;
* selected snapshot tests.

Live internet must not be required for automated tests.

---

# TDD

Use TDD selectively.

The substitution ranking engine is the primary candidate.

Process:

RED
→ GREEN
→ REFACTOR

Record this evolution clearly in commits.

---

# Flaky Tests

Never solve asynchronous UI tests using arbitrary sleeps.

Avoid:

`sleep()`

Prefer deterministic fixtures, injected dependencies, expectations and launch arguments.

---

# Observability

Prefer Apple's native tools for the challenge.

Eventually introduce:

* Logger / OSLog;
* signposts;
* analytics abstraction;
* crash reporting abstraction.

Do not use `print()` as production logging.

Never log sensitive information.

---

# Performance

Do not claim performance optimizations without measurements.

Eventually profile using:

* Time Profiler;
* Allocations;
* Leaks;
* Network;
* Memory Graph;
* Thread Sanitizer;
* Main Thread Checker.

When an optimization is introduced, record:

1. baseline/problem;
2. measurement;
3. change;
4. result.

---

# Objective-C

Do not add Objective-C simply to satisfy a checklist.

Objective-C interoperability should be documented and studied.

A tiny legacy interoperability example may be introduced later only if the core project is already finished.

---

# Dependencies

Use Swift Package Manager.

Do not introduce third-party dependencies without explaining:

* why native solutions are insufficient;
* maintenance implications;
* binary/build impact;
* testing implications.

Any dependency must be explicitly approved before adding it.

---

# CocoaPods

Do not add CocoaPods to this greenfield project.

Be prepared to explain when CocoaPods might still exist in mature/legacy codebases.

---

# Bazel / Buck

Do not introduce Bazel or Buck into this small project.

Study and document their usefulness for large build graphs, monorepos, caching and reproducible builds.

---

# Static Analysis

Use SwiftLint.

Keep rules intentional and understandable.

Do not adopt an enormous configuration copied from another repository.

---

# CI/CD

CI will eventually validate:

* build;
* SwiftLint;
* unit tests;
* snapshot tests;
* UI tests where practical.

Fastlane may encapsulate build/test commands later.

Do not configure production deployment or App Store signing unless explicitly requested.

---

# Git Discipline

`main` is the principal integration branch. Create a separate branch for every task or tightly related development change, based on the latest `main`. Do not develop directly on `main` or force-push it. Propose changes back to `main` through a pull request for developer review.

Use the branch prefixes documented in `docs/project/GIT-WORKFLOW.md`: `feature/` for new product capabilities, `bugfix/` for corrections to existing behavior, and `docs/`, `refactor/`, `test/`, or `chore/` for those types of work. Include the task ID when available and keep the branch focused on that task.

Use Conventional Commit messages in the form `<type>(<optional-scope>): <short imperative summary>`. Each commit should represent one understandable engineering decision. Suggest a commit message and explain its scope before committing. Do not commit unless the developer has authorized it.

Changes should be small and logically grouped. A task branch should not accumulate unrelated task changes.

Avoid commits like:

`create whole application`

Prefer:

`chore: bootstrap iOS project`

`feat: add product domain model`

`test: define substitution ranking behavior`

`feat: implement substitution ranking`

`feat: add product API client`

Each commit should represent one understandable engineering decision.

Do not commit without suggesting a commit message first.

---

# Documentation

Maintain:

`README.md`

`docs/product-requirements.md`

`docs/architecture.md`

`docs/ai-development.md`

`docs/concurrency.md`

`docs/memory-management.md`

`docs/adr/`

Important architectural decisions should generate an ADR containing:

* Context
* Decision
* Alternatives
* Consequences
* Trade-offs

---

# AI Development Log

For important features, record how AI participated.

Example:

Problem:
Load an unknown number of substitution candidates.

Alternatives:
Sequential await.
async let.
TaskGroup.
DispatchGroup.

Decision:
TaskGroup.

Why:
The amount of work is dynamic and structured concurrency provides lifecycle and cancellation semantics.

Human validation:
Tests, cancellation behavior, Sendable checking and rate-limit strategy.

---

# Interview Readiness

Whenever a meaningful feature is completed, update the developer's interview knowledge.

We need to be able to answer questions such as:

* Why MVVM-C?
* Why not VIPER?
* Why Repository?
* Why UseCase?
* Why this protocol?
* Why this type is a struct?
* Why this type is a class?
* Who owns this object?
* Can this create a retain cycle?
* Why MainActor?
* Why TaskGroup?
* Why actor?
* What happens if one request fails?
* How is cancellation handled?
* How would this architecture change at iFood scale?
* How is this feature observed in production?
* What metric determines product success?

---

# Definition of Done for a Microtask

A microtask is complete only when:

* required behavior works;
* code is understandable;
* relevant tests pass;
* compiler warnings are understood;
* concurrency implications were considered;
* ownership implications were considered;
* accessibility was considered where relevant;
* observability was considered where relevant;
* developer received an explanation;
* alternatives/trade-offs were discussed.

---

# Most Important Rule

Never optimize for the appearance of sophistication.

Optimize for:

* clarity;
* correctness;
* maintainability;
* testability;
* observability;
* proportional architecture;
* ability to explain every decision.

The developer must own the code intellectually even when AI writes it.

# Developer Learning Style

The developer learns best through visual reasoning and association.

When explaining architecture or complex technical concepts, prefer:

- ASCII diagrams;
- execution-flow diagrams;
- dependency trees;
- before/after comparisons;
- timelines;
- side-by-side comparisons;
- concrete analogies;
- small code excerpts connected to diagrams.

Avoid large theoretical explanations before establishing a visual mental model.

Preferred teaching sequence:

VISUAL MODEL
→ ANALOGY
→ CONCEPT
→ CODE
→ EXECUTION FLOW
→ DEBUG/OBSERVE
→ INTERVIEW QUESTION

When explaining where a new type belongs, show its position in the architecture.

When explaining concurrency, show a timeline.

When explaining memory management, show the ownership/reference graph.

When explaining navigation, show the screen/Coordinator graph.

When explaining modularization, show the dependency graph.

When explaining networking, show the request/data transformation pipeline.

Keep explanations divided into small learning units.
