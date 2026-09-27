# PHASE 08 — Swift Concurrency

## Objective
Introduce structured concurrency incrementally and handle cancellation and isolation.

## Expected Outcome
A reviewed and documented outcome for this phase within its scope.

## Dependencies
Relevant outcomes from PHASE 07.

## Priority
See task priorities. P1/P2 work must not displace core P0 delivery.

## Status
TODO

## SUB-P08-001 — Load one product async

Status: TODO

Priority: P0

Depends on:
- None

### Context
This task turns the swift concurrency plan into one bounded, reviewable outcome: load one product async.

### Objective
Load one product async, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
async/await, Task, async let, TaskGroup, cancellation, actors, MainActor, Sendable.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Load one product async” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Test cancellation, partial failures and isolation; Thread Sanitizer where relevant.

### Observability
Not applicable for this task.

### Memory Considerations
Not applicable for this task.

### Concurrency Considerations
Not applicable for this task.

### Accessibility
Not applicable for this task.

### AI Assistance
AI may research, outline alternatives, draft a small change and identify questions. Gabriel decides, validates and explains the result.

### Expected Files
Only files relevant to this phase; confirm exact paths before implementation. No implementation files are created by this planning task.

### Definition of Done
- [ ] Acceptance criteria met and evidence reviewed by Gabriel.
- [ ] Applicable checks pass or their non-applicability is explained.
- [ ] Documentation/status updated; Gabriel explains result and trade-offs.
- [ ] Move to REVIEW before Gabriel's review; move to DONE only after explicit review and understanding.

### Interview Notes
Explain purpose, alternatives, trade-offs, validation, and how the decision changes at larger scale.

## SUB-P08-002 — Implement sequential baseline

Status: TODO

Priority: P1

Depends on:
- SUB-P08-001

### Context
This task turns the swift concurrency plan into one bounded, reviewable outcome: implement sequential baseline.

### Objective
Implement sequential baseline, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
async/await, Task, async let, TaskGroup, cancellation, actors, MainActor, Sendable.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Implement sequential baseline” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Test cancellation, partial failures and isolation; Thread Sanitizer where relevant.

### Observability
Not applicable for this task.

### Memory Considerations
Not applicable for this task.

### Concurrency Considerations
Not applicable for this task.

### Accessibility
Not applicable for this task.

### AI Assistance
AI may research, outline alternatives, draft a small change and identify questions. Gabriel decides, validates and explains the result.

### Expected Files
Only files relevant to this phase; confirm exact paths before implementation. No implementation files are created by this planning task.

### Definition of Done
- [ ] Acceptance criteria met and evidence reviewed by Gabriel.
- [ ] Applicable checks pass or their non-applicability is explained.
- [ ] Documentation/status updated; Gabriel explains result and trade-offs.
- [ ] Move to REVIEW before Gabriel's review; move to DONE only after explicit review and understanding.

### Interview Notes
Explain purpose, alternatives, trade-offs, validation, and how the decision changes at larger scale.

## SUB-P08-003 — Understand sequential cost

Status: TODO

Priority: P1

Depends on:
- SUB-P08-002

### Context
This task turns the swift concurrency plan into one bounded, reviewable outcome: understand sequential cost.

### Objective
Understand sequential cost, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
async/await, Task, async let, TaskGroup, cancellation, actors, MainActor, Sendable.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Understand sequential cost” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Test cancellation, partial failures and isolation; Thread Sanitizer where relevant.

### Observability
Not applicable for this task.

### Memory Considerations
Not applicable for this task.

### Concurrency Considerations
Not applicable for this task.

### Accessibility
Not applicable for this task.

### AI Assistance
AI may research, outline alternatives, draft a small change and identify questions. Gabriel decides, validates and explains the result.

### Expected Files
Only files relevant to this phase; confirm exact paths before implementation. No implementation files are created by this planning task.

### Definition of Done
- [ ] Acceptance criteria met and evidence reviewed by Gabriel.
- [ ] Applicable checks pass or their non-applicability is explained.
- [ ] Documentation/status updated; Gabriel explains result and trade-offs.
- [ ] Move to REVIEW before Gabriel's review; move to DONE only after explicit review and understanding.

### Interview Notes
Explain purpose, alternatives, trade-offs, validation, and how the decision changes at larger scale.

## SUB-P08-004 — Compare async let

Status: TODO

Priority: P1

Depends on:
- SUB-P08-003

### Context
This task turns the swift concurrency plan into one bounded, reviewable outcome: compare async let.

### Objective
Compare async let, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
async/await, Task, async let, TaskGroup, cancellation, actors, MainActor, Sendable.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Compare async let” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Test cancellation, partial failures and isolation; Thread Sanitizer where relevant.

### Observability
Not applicable for this task.

### Memory Considerations
Not applicable for this task.

### Concurrency Considerations
Not applicable for this task.

### Accessibility
Not applicable for this task.

### AI Assistance
AI may research, outline alternatives, draft a small change and identify questions. Gabriel decides, validates and explains the result.

### Expected Files
Only files relevant to this phase; confirm exact paths before implementation. No implementation files are created by this planning task.

### Definition of Done
- [ ] Acceptance criteria met and evidence reviewed by Gabriel.
- [ ] Applicable checks pass or their non-applicability is explained.
- [ ] Documentation/status updated; Gabriel explains result and trade-offs.
- [ ] Move to REVIEW before Gabriel's review; move to DONE only after explicit review and understanding.

### Interview Notes
Explain purpose, alternatives, trade-offs, validation, and how the decision changes at larger scale.

## SUB-P08-005 — Load bounded candidates with TaskGroup

Status: TODO

Priority: P1

Depends on:
- SUB-P08-004

### Context
This task turns the swift concurrency plan into one bounded, reviewable outcome: load bounded candidates with taskgroup.

### Objective
Load bounded candidates with TaskGroup, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
async/await, Task, async let, TaskGroup, cancellation, actors, MainActor, Sendable.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Load bounded candidates with TaskGroup” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Test cancellation, partial failures and isolation; Thread Sanitizer where relevant.

### Observability
Not applicable for this task.

### Memory Considerations
Not applicable for this task.

### Concurrency Considerations
Not applicable for this task.

### Accessibility
Not applicable for this task.

### AI Assistance
AI may research, outline alternatives, draft a small change and identify questions. Gabriel decides, validates and explains the result.

### Expected Files
Only files relevant to this phase; confirm exact paths before implementation. No implementation files are created by this planning task.

### Definition of Done
- [ ] Acceptance criteria met and evidence reviewed by Gabriel.
- [ ] Applicable checks pass or their non-applicability is explained.
- [ ] Documentation/status updated; Gabriel explains result and trade-offs.
- [ ] Move to REVIEW before Gabriel's review; move to DONE only after explicit review and understanding.

### Interview Notes
Explain purpose, alternatives, trade-offs, validation, and how the decision changes at larger scale.

## SUB-P08-006 — Handle cancellation

Status: TODO

Priority: P1

Depends on:
- SUB-P08-005

### Context
This task turns the swift concurrency plan into one bounded, reviewable outcome: handle cancellation.

### Objective
Handle cancellation, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
async/await, Task, async let, TaskGroup, cancellation, actors, MainActor, Sendable.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Handle cancellation” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Test cancellation, partial failures and isolation; Thread Sanitizer where relevant.

### Observability
Not applicable for this task.

### Memory Considerations
Not applicable for this task.

### Concurrency Considerations
Not applicable for this task.

### Accessibility
Not applicable for this task.

### AI Assistance
AI may research, outline alternatives, draft a small change and identify questions. Gabriel decides, validates and explains the result.

### Expected Files
Only files relevant to this phase; confirm exact paths before implementation. No implementation files are created by this planning task.

### Definition of Done
- [ ] Acceptance criteria met and evidence reviewed by Gabriel.
- [ ] Applicable checks pass or their non-applicability is explained.
- [ ] Documentation/status updated; Gabriel explains result and trade-offs.
- [ ] Move to REVIEW before Gabriel's review; move to DONE only after explicit review and understanding.

### Interview Notes
Explain purpose, alternatives, trade-offs, validation, and how the decision changes at larger scale.

## SUB-P08-007 — Isolate presentation with MainActor

Status: TODO

Priority: P0

Depends on:
None

### Context
This task turns the swift concurrency plan into one bounded, reviewable outcome: isolate presentation with mainactor.

### Objective
Isolate presentation with MainActor, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
async/await, Task, async let, TaskGroup, cancellation, actors, MainActor, Sendable.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Isolate presentation with MainActor” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Test cancellation, partial failures and isolation; Thread Sanitizer where relevant.

### Observability
Not applicable for this task.

### Memory Considerations
Not applicable for this task.

### Concurrency Considerations
Not applicable for this task.

### Accessibility
Not applicable for this task.

### AI Assistance
AI may research, outline alternatives, draft a small change and identify questions. Gabriel decides, validates and explains the result.

### Expected Files
Only files relevant to this phase; confirm exact paths before implementation. No implementation files are created by this planning task.

### Definition of Done
- [ ] Acceptance criteria met and evidence reviewed by Gabriel.
- [ ] Applicable checks pass or their non-applicability is explained.
- [ ] Documentation/status updated; Gabriel explains result and trade-offs.
- [ ] Move to REVIEW before Gabriel's review; move to DONE only after explicit review and understanding.

### Interview Notes
Explain purpose, alternatives, trade-offs, validation, and how the decision changes at larger scale.

## SUB-P08-008 — Protect cache with actor

Status: TODO

Priority: P1

Depends on:
- SUB-P08-007

### Context
This task turns the swift concurrency plan into one bounded, reviewable outcome: protect cache with actor.

### Objective
Protect cache with actor, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
async/await, Task, async let, TaskGroup, cancellation, actors, MainActor, Sendable.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Protect cache with actor” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Test cancellation, partial failures and isolation; Thread Sanitizer where relevant.

### Observability
Not applicable for this task.

### Memory Considerations
Not applicable for this task.

### Concurrency Considerations
Not applicable for this task.

### Accessibility
Not applicable for this task.

### AI Assistance
AI may research, outline alternatives, draft a small change and identify questions. Gabriel decides, validates and explains the result.

### Expected Files
Only files relevant to this phase; confirm exact paths before implementation. No implementation files are created by this planning task.

### Definition of Done
- [ ] Acceptance criteria met and evidence reviewed by Gabriel.
- [ ] Applicable checks pass or their non-applicability is explained.
- [ ] Documentation/status updated; Gabriel explains result and trade-offs.
- [ ] Move to REVIEW before Gabriel's review; move to DONE only after explicit review and understanding.

### Interview Notes
Explain purpose, alternatives, trade-offs, validation, and how the decision changes at larger scale.

## SUB-P08-009 — Review Sendable

Status: TODO

Priority: P1

Depends on:
- SUB-P08-008

### Context
This task turns the swift concurrency plan into one bounded, reviewable outcome: review sendable.

### Objective
Review Sendable, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
async/await, Task, async let, TaskGroup, cancellation, actors, MainActor, Sendable.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Review Sendable” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Test cancellation, partial failures and isolation; Thread Sanitizer where relevant.

### Observability
Not applicable for this task.

### Memory Considerations
Not applicable for this task.

### Concurrency Considerations
Not applicable for this task.

### Accessibility
Not applicable for this task.

### AI Assistance
AI may research, outline alternatives, draft a small change and identify questions. Gabriel decides, validates and explains the result.

### Expected Files
Only files relevant to this phase; confirm exact paths before implementation. No implementation files are created by this planning task.

### Definition of Done
- [ ] Acceptance criteria met and evidence reviewed by Gabriel.
- [ ] Applicable checks pass or their non-applicability is explained.
- [ ] Documentation/status updated; Gabriel explains result and trade-offs.
- [ ] Move to REVIEW before Gabriel's review; move to DONE only after explicit review and understanding.

### Interview Notes
Explain purpose, alternatives, trade-offs, validation, and how the decision changes at larger scale.

## SUB-P08-010 — Define partial failure

Status: TODO

Priority: P1

Depends on:
- SUB-P08-009

### Context
This task turns the swift concurrency plan into one bounded, reviewable outcome: define partial failure.

### Objective
Define partial failure, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
async/await, Task, async let, TaskGroup, cancellation, actors, MainActor, Sendable.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Define partial failure” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Test cancellation, partial failures and isolation; Thread Sanitizer where relevant.

### Observability
Not applicable for this task.

### Memory Considerations
Not applicable for this task.

### Concurrency Considerations
Not applicable for this task.

### Accessibility
Not applicable for this task.

### AI Assistance
AI may research, outline alternatives, draft a small change and identify questions. Gabriel decides, validates and explains the result.

### Expected Files
Only files relevant to this phase; confirm exact paths before implementation. No implementation files are created by this planning task.

### Definition of Done
- [ ] Acceptance criteria met and evidence reviewed by Gabriel.
- [ ] Applicable checks pass or their non-applicability is explained.
- [ ] Documentation/status updated; Gabriel explains result and trade-offs.
- [ ] Move to REVIEW before Gabriel's review; move to DONE only after explicit review and understanding.

### Interview Notes
Explain purpose, alternatives, trade-offs, validation, and how the decision changes at larger scale.

## SUB-P08-011 — Run Thread Sanitizer

Status: TODO

Priority: P1

Depends on:
- SUB-P08-010

### Context
This task turns the swift concurrency plan into one bounded, reviewable outcome: run thread sanitizer.

### Objective
Run Thread Sanitizer, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
async/await, Task, async let, TaskGroup, cancellation, actors, MainActor, Sendable.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Run Thread Sanitizer” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Test cancellation, partial failures and isolation; Thread Sanitizer where relevant.

### Observability
Not applicable for this task.

### Memory Considerations
Not applicable for this task.

### Concurrency Considerations
Not applicable for this task.

### Accessibility
Not applicable for this task.

### AI Assistance
AI may research, outline alternatives, draft a small change and identify questions. Gabriel decides, validates and explains the result.

### Expected Files
Only files relevant to this phase; confirm exact paths before implementation. No implementation files are created by this planning task.

### Definition of Done
- [ ] Acceptance criteria met and evidence reviewed by Gabriel.
- [ ] Applicable checks pass or their non-applicability is explained.
- [ ] Documentation/status updated; Gabriel explains result and trade-offs.
- [ ] Move to REVIEW before Gabriel's review; move to DONE only after explicit review and understanding.

### Interview Notes
Explain purpose, alternatives, trade-offs, validation, and how the decision changes at larger scale.

## SUB-P08-012 — Document concurrency

Status: TODO

Priority: P1

Depends on:
- SUB-P08-011

### Context
This task turns the swift concurrency plan into one bounded, reviewable outcome: document concurrency.

### Objective
Document concurrency, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
async/await, Task, async let, TaskGroup, cancellation, actors, MainActor, Sendable.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Document concurrency” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Test cancellation, partial failures and isolation; Thread Sanitizer where relevant.

### Observability
Not applicable for this task.

### Memory Considerations
Not applicable for this task.

### Concurrency Considerations
Not applicable for this task.

### Accessibility
Not applicable for this task.

### AI Assistance
AI may research, outline alternatives, draft a small change and identify questions. Gabriel decides, validates and explains the result.

### Expected Files
Only files relevant to this phase; confirm exact paths before implementation. No implementation files are created by this planning task.

### Definition of Done
- [ ] Acceptance criteria met and evidence reviewed by Gabriel.
- [ ] Applicable checks pass or their non-applicability is explained.
- [ ] Documentation/status updated; Gabriel explains result and trade-offs.
- [ ] Move to REVIEW before Gabriel's review; move to DONE only after explicit review and understanding.

### Interview Notes
Explain purpose, alternatives, trade-offs, validation, and how the decision changes at larger scale.
