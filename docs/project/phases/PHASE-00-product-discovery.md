# PHASE 00 — Product Discovery

## Objective
Establish evidence-based problem, user, hypothesis, MVP, constraints, and five-day scope before Swift code.

## Expected Outcome
A reviewed and documented outcome for this phase within its scope.

## Dependencies
None

## Priority
See task priorities. P1/P2 work must not displace core P0 delivery.

## Status
IN_PROGRESS

## SUB-P00-001 — Define product problem

Status: REVIEW

Priority: P0

Depends on:
- None

### Context
The product source describes grocery substitutions as a problem area, but this project needs a concise, defensible problem statement before shaping hypotheses or solutions.

### Objective
Document the problem, journey context, user pain, opportunity, product-level direction, expected value, business hypothesis, assumptions and non-claims. Add a simple visual flow. Do not define architecture or implementation.

### Requirements
- Use the supplied product brief and Gabriel's wording as the conceptual source.
- Do not claim that iFood lacks a substitution feature or imply this project has validated user research.
- Separate plausible user/business value from measured outcomes; invent no numbers.
- Keep Proposed Direction at product level; do not describe architecture, implementation, or code.
- Include the requested simple journey diagram in docs/product-requirements.md.

### Acceptance Criteria
- [x] Problem, Context, User Pain, Product Opportunity, Proposed Direction and Expected User Value are documented.
- [x] Business Value Hypothesis is conditional and contains no invented metrics.
- [x] Assumptions and Non-Claims are explicit, including no claim about iFood's current functionality.
- [x] A simple diagram shows purchase → unavailable product → new decision → alternatives → comparison → choice.
- [x] No architecture or implementation is defined.

### Engineering Concepts
Problem framing, user journey, assumptions, non-claims, product value hypothesis.

### Study Before Implementation
Not applicable for this documentation-only task. Read the supplied product brief and distinguish its statements from hypotheses before writing.

### Questions I Must Be Able to Answer
- What is the problem and when does it occur in the journey?
- Which parts are assumptions rather than validated user evidence?
- What user and business value could the opportunity influence, and what do we not claim?

### Testing
Editorial review against the supplied product brief and this task's acceptance criteria. Check that no unsupported claims, invented metrics, architecture, or implementation detail entered the document.

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
docs/product-requirements.md, docs/project/CURRENT.md, docs/project/BACKLOG.md and this phase file for task status and acceptance record. No code or product implementation files.

### Definition of Done
- [ ] Gabriel reviews the product problem and can explain the distinction between evidence and assumptions.
- [ ] Only after that review, change the task from REVIEW to DONE.

### Interview Notes
Explain the grocery substitution problem without claiming that a particular product lacks a feature; distinguish expected value from measured impact.

## SUB-P00-002 — Record evidence and assumptions

Status: TODO

Priority: P1

Depends on:
- SUB-P00-001

### Context
This task turns the product discovery plan into one bounded, reviewable outcome: record evidence and assumptions.

### Objective
Record evidence and assumptions, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
Product discovery, evidence, hypothesis, journey, metrics, MVP, scope.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Record evidence and assumptions” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Review each artifact against supplied product source; label assumptions and unknowns.

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

## SUB-P00-003 — Write product hypothesis

Status: TODO

Priority: P0

Depends on:
None

### Context
This task turns the product discovery plan into one bounded, reviewable outcome: write product hypothesis.

### Objective
Write product hypothesis, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
Product discovery, evidence, hypothesis, journey, metrics, MVP, scope.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Write product hypothesis” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Review each artifact against supplied product source; label assumptions and unknowns.

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

## SUB-P00-004 — Define target user

Status: TODO

Priority: P1

Depends on:
- SUB-P00-003

### Context
This task turns the product discovery plan into one bounded, reviewable outcome: define target user.

### Objective
Define target user, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
Product discovery, evidence, hypothesis, journey, metrics, MVP, scope.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Define target user” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Review each artifact against supplied product source; label assumptions and unknowns.

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

## SUB-P00-005 — Map user journey

Status: TODO

Priority: P1

Depends on:
- SUB-P00-004

### Context
This task turns the product discovery plan into one bounded, reviewable outcome: map user journey.

### Objective
Map user journey, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
Product discovery, evidence, hypothesis, journey, metrics, MVP, scope.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Map user journey” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Review each artifact against supplied product source; label assumptions and unknowns.

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

## SUB-P00-006 — Define success metrics

Status: TODO

Priority: P1

Depends on:
- SUB-P00-005

### Context
This task turns the product discovery plan into one bounded, reviewable outcome: define success metrics.

### Objective
Define success metrics, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
Product discovery, evidence, hypothesis, journey, metrics, MVP, scope.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Define success metrics” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Review each artifact against supplied product source; label assumptions and unknowns.

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

## SUB-P00-007 — Define MVP

Status: TODO

Priority: P0

Depends on:
None

### Context
This task turns the product discovery plan into one bounded, reviewable outcome: define mvp.

### Objective
Define MVP, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
Product discovery, evidence, hypothesis, journey, metrics, MVP, scope.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Define MVP” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Review each artifact against supplied product source; label assumptions and unknowns.

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

## SUB-P00-008 — Define non-goals

Status: TODO

Priority: P0

Depends on:
SUB-P00-007

### Context
This task turns the product discovery plan into one bounded, reviewable outcome: define non-goals.

### Objective
Define non-goals, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
Product discovery, evidence, hypothesis, journey, metrics, MVP, scope.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Define non-goals” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Review each artifact against supplied product source; label assumptions and unknowns.

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

## SUB-P00-009 — Specify four-screen experience

Status: TODO

Priority: P0

Depends on:
None

### Context
This task turns the product discovery plan into one bounded, reviewable outcome: specify four-screen experience.

### Objective
Specify four-screen experience, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
Product discovery, evidence, hypothesis, journey, metrics, MVP, scope.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Specify four-screen experience” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Review each artifact against supplied product source; label assumptions and unknowns.

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

## SUB-P00-010 — Validate Open Food Facts API

Status: TODO

Priority: P1

Depends on:
- SUB-P00-009

### Context
This task turns the product discovery plan into one bounded, reviewable outcome: validate open food facts api.

### Objective
Validate Open Food Facts API, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
Product discovery, evidence, hypothesis, journey, metrics, MVP, scope.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Validate Open Food Facts API” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Review each artifact against supplied product source; label assumptions and unknowns.

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

## SUB-P00-011 — Document API limitations

Status: TODO

Priority: P1

Depends on:
- SUB-P00-010

### Context
This task turns the product discovery plan into one bounded, reviewable outcome: document api limitations.

### Objective
Document API limitations, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
Product discovery, evidence, hypothesis, journey, metrics, MVP, scope.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Document API limitations” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Review each artifact against supplied product source; label assumptions and unknowns.

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

## SUB-P00-012 — Validate deadline delivery scope

Status: TODO

Priority: P0

Depends on:
None

### Context
This task turns the product discovery plan into one bounded, reviewable outcome: validate five-day scope.

### Objective
Validate deadline delivery scope, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
Product discovery, evidence, hypothesis, journey, metrics, MVP, scope.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Validate deadline delivery scope” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Review each artifact against supplied product source; label assumptions and unknowns.

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

## SUB-P00-013 — Review discovery with Gabriel

Status: TODO

Priority: P1

Depends on:
- SUB-P00-012

### Context
This task turns the product discovery plan into one bounded, reviewable outcome: review discovery with gabriel.

### Objective
Review discovery with Gabriel, completed and reviewed within the stated scope.

### Requirements
- Follow [AGENTS.md](../../AGENTS.md) and applicable project source documents.
- Discuss the approach and trade-offs with Gabriel before implementation; do not expand scope.
- Update planning and documentation when the task is complete.

### Acceptance Criteria
- [ ] The task outcome is produced within agreed scope.
- [ ] Decisions and trade-offs are explained and recorded.
- [ ] Gabriel reviews the result and can explain key concepts.

### Engineering Concepts
Product discovery, evidence, hypothesis, journey, metrics, MVP, scope.

### Study Before Implementation
Review applicable guidance in AGENTS.md and source documents. Gabriel explains the goal and likely alternatives before implementation.

### Questions I Must Be Able to Answer
- What problem does “Review discovery with Gabriel” address, and why is the approach appropriate?
- What alternative was considered and what trade-off does the choice make?
- How is the result validated and maintained?

### Testing
Review each artifact against supplied product source; label assumptions and unknowns.

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
