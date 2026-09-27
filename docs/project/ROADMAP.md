# Roadmap

## Engineering Master Plan

The 20 phases remain the full engineering learning and evolution map. They are not the execution order for the imminent submission. Priority and dependency fields distinguish the time-critical vertical slice from future engineering depth.

## Delivery Track — deadline tomorrow 11:00

**Hard deadline:** Monday, 2026-09-28 at 11:00 America/Sao_Paulo (BRT). At this update, about 22 hours and 35 minutes remain. Freeze feature work by 09:30 tomorrow; reserve 09:30–11:00 for build, core tests, README, and final review.

The delivery order is a vertical slice, not a march through all master-plan phases:

```text
PRODUCT → BOOTSTRAP → MINIMAL ARCHITECTURE → DOMAIN → NETWORK
                                                      ↓
                         DESIGN DISCOVERY → FOUNDATIONS
                                                      ↓
                    UIKit flow → SwiftUI comparison → core tests
                                                      ↓
                       basic logging → README → final validation
```

The work in phases 6–8 and Design Discovery can overlap when independent. Do not wait to finish optional phases 03, 09, 10, or 18 before reaching the UI flow. Screen contracts from SUB-P11-017 must be reviewed before implementing each screen. A single task may be IN_PROGRESS; only the immediate next task should be READY. Completing code moves a task to REVIEW; Gabriel moves it to DONE after review and can explain the decision.

### P0 Delivery Tasks

These are the minimum tasks selected for the delivery path. P0 is intentionally limited to tasks that materially enable the end-to-end substitution flow and its explanation:

| Track stage | Required task IDs |
| --- | --- |
| 1. Product | SUB-P00-001, SUB-P00-003, SUB-P00-007, SUB-P00-008, SUB-P00-009, SUB-P00-012 |
| 2. Bootstrap | SUB-P01-001, SUB-P01-002, SUB-P01-003, SUB-P01-005, SUB-P01-008, SUB-P01-009 |
| 3. Minimal architecture | SUB-P02-001, SUB-P02-002, SUB-P02-005, SUB-P02-006, SUB-P02-007 |
| 4. Domain and ranking | SUB-P04-002, SUB-P04-003, SUB-P04-004; SUB-P05-001, SUB-P05-002, SUB-P05-003 |
| 5. Networking and repository | SUB-P06-001, SUB-P06-003, SUB-P06-004, SUB-P06-006–011; SUB-P07-001–003, SUB-P07-005 |
| 6. Minimum concurrency | SUB-P08-001, SUB-P08-007; use TaskGroup only if dynamic bounded loading is justified. |
| 7. Design Discovery → foundations | SUB-P11-013, SUB-P11-015–018, SUB-P11-020, then SUB-P11-021. Design tokens are semantic; no arbitrary hex values. |
| 8. UIKit flow | SUB-P11-005, SUB-P11-006, SUB-P11-008, SUB-P11-010, SUB-P11-022; SUB-P12-002–006, SUB-P12-009–011. |
| 9. SwiftUI comparison | SUB-P11-023; SUB-P13-001–002, SUB-P13-004–007. P11-022 coordinates only components justified by inventory. |
| 10. Core quality/accessibility | SUB-P14-001–006; SUB-P16-001, SUB-P16-003–004. |
| 11. Basic observability and handoff | SUB-P15-001–002; SUB-P19-001, SUB-P19-004, SUB-P19-006. |

### P1 — deliver if time remains

- Research iFood design-system principles and up to three grocery UX references (hard cap: 20 minutes each where stated); high-fidelity polish and critical snapshots.
- Full comparisons of MVC/MVVM/VIP/VIPER, generic endpoint study, TaskGroup/actor/cache depth, and extra memory/performance investigation.
- Extra UI tests, broad SwiftLint configuration, CI/UI automation, performance optimization and screenshots.
- Optional badges or component variants only when screen contracts demonstrate a need.

### P2 — future engineering evolution

- Full GCD lab, Objective-C sample, MetricKit implementation, Crashlytics/Firebase/Remote Config, Fastlane/CD, Bazel/Buck, Core ML, sophisticated disk cache, and broad snapshot/component suites.
- These stay documented for later study/interview discussion; none may delay the P0 app.

### Delivery checkpoints and cut line

- **Today, first block:** finish product problem/MVP/screen flow; create the buildable project and minimum architecture.
- **Today, middle block:** establish the ranking rule, remote product lookup, local inventory fixture and repository path. Limit candidate lookups (about 3–4) and keep a deterministic fixture path for API gaps/rate limits.
- **Today, late block:** complete Design Discovery foundations/low-fi contracts, then build the UIKit order → suggestions flow and SwiftUI comparison.
- **Tomorrow before 07:00:** reach a coherent end-to-end path; resolve loading/error/empty states and essential accessibility.
- **Tomorrow 07:00–09:30:** core tests, logger, warning/ownership review and README. Drop P1 polish if the vertical slice is not stable.
- **Tomorrow 09:30–11:00:** feature freeze; clean build, run critical tests, confirm README and known limitations. No new feature starts.

### Deadline risks

- The scope still combines Xcode setup, real API behavior, UIKit and SwiftUI in about 22 hours; integration time is the main risk.
- Open Food Facts completeness and rate limits may prevent predictable multi-candidate responses. Use bounded requests and honest empty/partial states; do not make automated tests depend on live API.
- The observed shell previously could not find configured Apple Command Line Tools. Verify Xcode command-line selection before the build/Git tasks; if unavailable, setup/build verification is immediately blocked.
- Figma polish, extra modules, TaskGroup when unnecessary, and optional components are cut before the working flow or core tests.

## Engineering Master Plan — 20 phases

The list below remains the complete future map. Dependencies are real prerequisites only; a phase label does not gate the Delivery Track.

```text
PHASE 00 — Product Discovery
        ↓
PHASE 01 — Bootstrap
        ↓
PHASE 02 — Architecture
        ↓
PHASE 03 — Modularization
        ↓
PHASE 04 — Domain Modeling
        ↓
PHASE 05 — Ranking TDD
        ↓
PHASE 06 — Networking
        ↓
PHASE 07 — Repository
        ↓
PHASE 08 — Swift Concurrency
        ↓
PHASE 09 — GCD Study Lab
        ↓
PHASE 10 — Memory Management
        ↓
PHASE 11 — Design Discovery & System
        ↓
PHASE 12 — UIKit
        ↓
PHASE 13 — SwiftUI Integration
        ↓
PHASE 14 — Accessibility
        ↓
PHASE 15 — Observability
        ↓
PHASE 16 — Testing
        ↓
PHASE 17 — Debugging & Performance
        ↓
PHASE 18 — Engineering Automation
        ↓
PHASE 19 — Delivery & Interview
```

## PHASE 00 — Product Discovery

- **Objective:** Define product facts, MVP, flow and deadline scope before code.
- **Expected result:** Relevant product evidence and decisions; no Swift.
- **Dependencies:** None
- **Priority:** P0/P1
- **Status:** IN_PROGRESS

## PHASE 01 — Bootstrap

- **Objective:** Create and validate a minimal native iOS project foundation.
- **Expected result:** Buildable Xcode project with required language/deployment settings.
- **Dependencies:** PHASE 00 decisions
- **Priority:** P0/P1
- **Status:** TODO

## PHASE 02 — Architecture

- **Objective:** Define minimum MVVM-C boundaries needed by the flow.
- **Expected result:** Small, defensible Coordinator/dependency composition and architecture rationale.
- **Dependencies:** Bootstrap
- **Priority:** P0/P1
- **Status:** TODO

## PHASE 03 — Modularization

- **Objective:** Plan mature module structure and evaluate package boundaries.
- **Expected result:** Documented modularization decision; full package split is not a deadline gate.
- **Dependencies:** Architecture
- **Priority:** P1/P2
- **Status:** TODO

## PHASE 04 — Domain Modeling

- **Objective:** Model only core order/product/candidate concepts.
- **Expected result:** Minimal value models for the chosen substitution flow.
- **Dependencies:** Product scope
- **Priority:** P0/P1
- **Status:** TODO

## PHASE 05 — Ranking TDD

- **Objective:** Define and test a simple deterministic ranking rule.
- **Expected result:** Small tested ranking behavior; no artificial scoring complexity.
- **Dependencies:** Domain candidate model
- **Priority:** P0/P1
- **Status:** TODO

## PHASE 06 — Networking

- **Objective:** Access Open Food Facts through bounded URLSession code.
- **Expected result:** One testable product lookup and DTO mapping, respecting rate limits.
- **Dependencies:** Product/barcode scope
- **Priority:** P0/P1
- **Status:** TODO

## PHASE 07 — Repository

- **Objective:** Compose local inventory fixture and remote product data.
- **Expected result:** Minimal justified repository boundaries for the flow.
- **Dependencies:** Domain + API client
- **Priority:** P0/P1
- **Status:** TODO

## PHASE 08 — Swift Concurrency

- **Objective:** Use async/await and UI isolation where needed.
- **Expected result:** Simple async loading and MainActor UI state; TaskGroup only if final flow warrants it.
- **Dependencies:** Networking/UI flow
- **Priority:** P0/P1
- **Status:** TODO

## PHASE 09 — GCD Study Lab

- **Objective:** Study GCD independently for interview learning.
- **Expected result:** Future lab notes only; no delivery dependency.
- **Dependencies:** None
- **Priority:** P2
- **Status:** TODO

## PHASE 10 — Memory Management

- **Objective:** Review ownership and lifecycle of implemented flow.
- **Expected result:** Ownership review for actual objects; advanced profiling studies remain future work.
- **Dependencies:** UIKit flow
- **Priority:** P1/P2
- **Status:** TODO

## PHASE 11 — Design Discovery & System

- **Objective:** Define visual principles/foundations/screens before minimal implementation.
- **Expected result:** Own Substi language, low-fi screen contracts, accessibility review and used tokens/components.
- **Dependencies:** Product flow; parallel with domain/API where practical
- **Priority:** P0/P1
- **Status:** TODO

## PHASE 12 — UIKit

- **Objective:** Implement the primary order/suggestions path with View Code.
- **Expected result:** Usable UIKit flow with loading/content/error states and Coordinator navigation.
- **Dependencies:** Bootstrap + screen contracts
- **Priority:** P0/P1
- **Status:** TODO

## PHASE 13 — SwiftUI Integration

- **Objective:** Add a product comparison integrated into UIKit navigation.
- **Expected result:** One coherent SwiftUI screen; Coordinator retains navigation ownership.
- **Dependencies:** UIKit flow + screen contract
- **Priority:** P0/P1
- **Status:** TODO

## PHASE 14 — Accessibility

- **Objective:** Validate high-impact accessibility needs on delivered flow.
- **Expected result:** VoiceOver, Dynamic Type, contrast and touch target checks for core path.
- **Dependencies:** Screen contracts + views
- **Priority:** P0/P1
- **Status:** TODO

## PHASE 15 — Observability

- **Objective:** Add basic native logging and privacy guidance.
- **Expected result:** Logger with useful categories; advanced SDK integrations are deferred.
- **Dependencies:** Running data/UI path
- **Priority:** P0/P1/P2
- **Status:** TODO

## PHASE 16 — Testing

- **Objective:** Test highest-risk logic and boundaries first.
- **Expected result:** Ranking, mapper/network and essential view state tests; one UI happy path only if time allows.
- **Dependencies:** Domain/data/UI path
- **Priority:** P0/P1/P2
- **Status:** TODO

## PHASE 17 — Debugging & Performance

- **Objective:** Run only targeted debugging checks and one useful measurement if time permits.
- **Expected result:** Explain warnings and measured findings; no optimization claims without evidence.
- **Dependencies:** Working app
- **Priority:** P1
- **Status:** TODO

## PHASE 18 — Engineering Automation

- **Objective:** Add small quality automation only if it is low-risk and quick.
- **Expected result:** Optional lint/CI foundations; no signing/CD work on critical path.
- **Dependencies:** Build/test commands
- **Priority:** P1/P2
- **Status:** TODO

## PHASE 19 — Delivery & Interview

- **Objective:** Package the story and validate the submission.
- **Expected result:** README, known limitations, final checks and decision walkthrough.
- **Dependencies:** Working vertical slice
- **Priority:** P0/P1/P2
- **Status:** TODO
