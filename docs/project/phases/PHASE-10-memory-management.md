# PHASE 10 — Memory Management

## Objective
Understand ownership and investigate lifecycle/leak risks with Xcode tools.

## Expected Outcome
A reviewed and documented outcome for this phase within its scope.

## Dependencies
Relevant outcomes from PHASE 09.

## Priority
See task priorities. P1/P2 work must not displace core P0 delivery.

## Status
TODO

## SUB-P10-001 — Review ARC and ownership graph

Status: TODO

Priority: P1

Depends on:
- None

### Context
This task turns the memory management plan into one bounded, reviewable outcome: review arc and ownership graph.

### Objective
Review ARC and ownership graph, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
ARC, ownership, closures, lifecycle and memory tools.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Review ARC and ownership graph” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Use lifecycle repetition, deinit observation, Memory Graph/Allocations/Leaks as relevant.

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

## SUB-P10-002 — Map Coordinator ownership

Status: TODO

Priority: P1

Depends on:
- SUB-P10-001

### Context
This task turns the memory management plan into one bounded, reviewable outcome: map coordinator ownership.

### Objective
Map Coordinator ownership, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
ARC, ownership, closures, lifecycle and memory tools.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Map Coordinator ownership” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Use lifecycle repetition, deinit observation, Memory Graph/Allocations/Leaks as relevant.

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

## SUB-P10-003 — Review strong references

Status: TODO

Priority: P1

Depends on:
- SUB-P10-002

### Context
This task turns the memory management plan into one bounded, reviewable outcome: review strong references.

### Objective
Review strong references, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
ARC, ownership, closures, lifecycle and memory tools.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Review strong references” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Use lifecycle repetition, deinit observation, Memory Graph/Allocations/Leaks as relevant.

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

## SUB-P10-004 — Study weak/unowned

Status: TODO

Priority: P1

Depends on:
- SUB-P10-003

### Context
This task turns the memory management plan into one bounded, reviewable outcome: study weak/unowned.

### Objective
Study weak/unowned, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
ARC, ownership, closures, lifecycle and memory tools.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Study weak/unowned” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Use lifecycle repetition, deinit observation, Memory Graph/Allocations/Leaks as relevant.

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

## SUB-P10-005 — Audit closure captures

Status: TODO

Priority: P1

Depends on:
- SUB-P10-004

### Context
This task turns the memory management plan into one bounded, reviewable outcome: audit closure captures.

### Objective
Audit closure captures, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
ARC, ownership, closures, lifecycle and memory tools.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Audit closure captures” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Use lifecycle repetition, deinit observation, Memory Graph/Allocations/Leaks as relevant.

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

## SUB-P10-006 — Study value/reference and stack/heap

Status: TODO

Priority: P1

Depends on:
- SUB-P10-005

### Context
This task turns the memory management plan into one bounded, reviewable outcome: study value/reference and stack/heap.

### Objective
Study value/reference and stack/heap, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
ARC, ownership, closures, lifecycle and memory tools.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Study value/reference and stack/heap” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Use lifecycle repetition, deinit observation, Memory Graph/Allocations/Leaks as relevant.

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

## SUB-P10-007 — Study Copy-on-Write

Status: TODO

Priority: P2

Depends on:
- SUB-P10-006

### Context
This task turns the memory management plan into one bounded, reviewable outcome: study copy-on-write.

### Objective
Study Copy-on-Write, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
ARC, ownership, closures, lifecycle and memory tools.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Study Copy-on-Write” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Use lifecycle repetition, deinit observation, Memory Graph/Allocations/Leaks as relevant.

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

## SUB-P10-008 — Use deinit for lifecycle study

Status: TODO

Priority: P1

Depends on:
- SUB-P10-007

### Context
This task turns the memory management plan into one bounded, reviewable outcome: use deinit for lifecycle study.

### Objective
Use deinit for lifecycle study, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
ARC, ownership, closures, lifecycle and memory tools.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Use deinit for lifecycle study” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Use lifecycle repetition, deinit observation, Memory Graph/Allocations/Leaks as relevant.

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

## SUB-P10-009 — Inspect Memory Graph

Status: TODO

Priority: P1

Depends on:
- SUB-P10-008

### Context
This task turns the memory management plan into one bounded, reviewable outcome: inspect memory graph.

### Objective
Inspect Memory Graph, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
ARC, ownership, closures, lifecycle and memory tools.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Inspect Memory Graph” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Use lifecycle repetition, deinit observation, Memory Graph/Allocations/Leaks as relevant.

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

## SUB-P10-010 — Review Allocations and Leaks

Status: TODO

Priority: P1

Depends on:
- SUB-P10-009

### Context
This task turns the memory management plan into one bounded, reviewable outcome: review allocations and leaks.

### Objective
Review Allocations and Leaks, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
ARC, ownership, closures, lifecycle and memory tools.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Review Allocations and Leaks” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Use lifecycle repetition, deinit observation, Memory Graph/Allocations/Leaks as relevant.

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
