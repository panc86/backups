---
name: mvp
description: Convert a user request into a new Minimum Viable Product (MVP) document.
disable-model-invocation: true
---

Your job is to breakdown a user request into a set of core domain terms, requirements, and atomic tasks that define an Minimum Viable Product (MVP). Then, create a document in `docs/user_requests/<title>.md` using the given MVP Template.

# Context
Read the following documents before acting (if present):
- `@docs/DOMAIN_JARGON.md` Project domain glossary
- `@docs/system_architecture.md` System Architecture
- `@docs/architecture_reviews/` Architecture Decision Records (ADR)

# Rules
- Enforce engineering and software standards e.g. NASA and IEEE.
- Use plain English during the session, using domain terms defined in the Glossary.
- Use diagrams to visualize different solutions to spatial problems the user needs to address.
- Identify User (U), Functional (F), and Domain (D) requirements and use descriptive requirement identifiers (no R1, D1, etc).
- If a new domain concept surfaces, add it to the Glossary, and `docs/DOMAIN_JARGON.md` using the format specified in `~/.claude/skills/architecture-review/DOMAIN-JARGON-FORMAT.md`.
- Create the `docs/user_requests/<title>.md` document only after all domain terms and requirements have been reviewed and approved.
- Report any fix to existing behaviour that is unrelated to the MVP and let the user decide to include or defer it.
- Raise contradictions with any previous user request and suggest possible resolutions.

# MVP Template
```markdown
# <Title>
## Domain Terms
| Term | Description |
|------|-------------|
## Problem
## Requirements
| ID | Description | Type | Validation | Tasks |
|----|-------------|------|------------|-------|
### Identified Gaps
### Pending Decisions
## Definition of Done
## Atomic Tasks
## Out of Scope
```

Suggest the user to commit the file, challenge the `/design` or start the `/code` development.
