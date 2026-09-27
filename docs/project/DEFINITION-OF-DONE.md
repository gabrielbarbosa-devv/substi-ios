# Definition of Done

Implementation completion alone does not make a task DONE. Move it to REVIEW; Gabriel reviews behavior, evidence, explanation, and trade-offs before DONE.

For implementation tasks, apply what is relevant:
- [ ] Required behavior implemented within scope.
- [ ] Build passes and warnings are understood.
- [ ] Relevant tests pass; tests never depend on live API.
- [ ] SwiftLint passes when configured and applicable.
- [ ] Ownership, ARC, and closure captures reviewed.
- [ ] Concurrency, isolation, cancellation, and data-race risks reviewed.
- [ ] Accessibility reviewed for user-facing UI.
- [ ] Observability and privacy considered.
- [ ] Relevant docs, ADR, and AI Development Log updated.
- [ ] Gabriel explains solution, alternatives, and trade-offs.
- [ ] Review findings resolved; set DONE only after review.

For discovery, study, or documentation tasks, implementation-only checks are not applicable; provide reviewed evidence for the task acceptance criteria.
