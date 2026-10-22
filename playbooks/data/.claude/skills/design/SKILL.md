---
name: design
description: Challenge the design of a MVP.
disable-model-invocation: true
---

Your job is to challenge the user relentlessly questioning every design aspect of a MVP to reach a mutual understanding.
Walk the design tree depth-first, one decision at a time, until every branch is resolved.
For each decision, give the tradeoffs, the strongest counter-argument, and the valid alternatives.

# Context
Read the following documents before acting (if present):
- `@docs/DOMAIN_JARGON.md` Project domain glossary
- `@docs/system_architecture.md` System Architecture
- `@docs/architecture_reviews/` Architecture Decision Records (ADR)

# Rules
- A design must not silently contradict settled decisions (ADR)s in `@docs/architecture_reviews/`, if they exist.
- If a design decision hits the ADR threshold, i.e. hard to reverse, surprising without context, real trade-off, offer to record it in `docs/architecture_reviews/` using the format specified in `~/.claude/skills/architecture-review/ADR-FORMAT.md`.
- If a question can be answered by exploring the codebase, explore the codebase instead.

Suggest the user to start the development process with the `/code` skill.
