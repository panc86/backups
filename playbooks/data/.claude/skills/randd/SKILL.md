---
name: randd
description: >
  Strategy orchestrator for non-trivial feature design. Enforces a logical sequence:
  scope (brainstorm + jargon) → design concept (diagrams + decision log). Use when
  designing a new feature, whether in a greenfield repo or an existing codebase.
  For bugs and existing-code problems, use /triage-issue instead.
---

# === PHASE 1: SCOPE ===

**Goal:** Reach mutual understanding of what to build and why, with zero ambiguity.

## Setup

1. Check for an existing `DOMAIN_JARGON.md` in the project root. If found, load its terms silently to prime the session.
2. Ask the user for a description of the feature or idea to design.

## Brainstorm

Delegate to the brainstorm skill: challenge every aspect of the idea relentlessly, walk each branch of the decision tree, and resolve dependencies one-by-one. For each Q&A, provide tradeoffs, counter-arguments, and clearly optimal alternatives.

**Jargon capture rules (active throughout brainstorm):**
- When a new domain term is introduced or agreed upon, immediately append it to `DOMAIN_JARGON.md`.
- When user language conflicts with an existing entry, flag it immediately and resolve before continuing.
- When a fuzzy or overloaded concept appears, propose a precise canonical term.
- Test terms with concrete scenarios to confirm precision.
- Only domain-meaningful terms — no implementation details (class names, file paths, method signatures).
- Entries are created lazily — only when genuinely agreed, never speculatively.

## Jargon Confirmation Pass

After brainstorm concludes, review `DOMAIN_JARGON.md` together:
- Confirm each term is accurate and complete.
- Deprecate or refine any terms that shifted meaning during the session.

## Scope Document

Produce `SCOPE.md` in the project root:

```markdown
## Problem Statement
[The problem from the user's perspective — what pain or gap exists today]

## Proposed Solution
[What will be different — the solution boundary, not implementation details]

## Key Constraints
[Non-negotiable requirements, limitations, or assumptions]

## Out of Scope
[Explicit list of what this effort does NOT cover]
```

**Exit criteria:** You can describe the solution without saying "it depends" or "we could do X or Y."

> Confirm with the user that mutual understanding is reached before advancing.
> **Type `next` or confirm to advance to Phase 2.**

---

# === PHASE 2: DESIGN CONCEPT ===

**Goal:** Produce a technology-agnostic architectural blueprint with traceable decisions.

Produce `DESIGN.md` in the project root with the following sections:

## System Design Diagram

Sketch the major system components and their relationships. Use ASCII art and/or Mermaid syntax. Components must be technology-agnostic — describe *what* they do, not *what tool* implements them.

Example format (Mermaid):
```
graph TD
  A[Component A] --> B[Component B]
  B --> C[Component C]
```

## Component Flowcharts

For each non-trivial component, sketch a flowchart of its internal logic or workflow. Skip trivial pass-through components. Use ASCII art or Mermaid flowchart syntax.

## Architectural Choices and Tradeoffs

Track every major architectural decision made during this phase:

```markdown
## Architectural Choices and Tradeoffs

| Decision | Alternatives Considered | Rationale |
|---|---|---|
| [What was decided] | [What else was considered] | [Why this choice] |
```

A decision belongs here when it is: hard to reverse, non-obvious to a future reader, or the result of genuine tradeoffs.

**Exit criteria:** System diagram covers all major components. Every non-trivial component has a flowchart. Every significant architectural choice is in the Architectural Choices and Tradeoffs table.

> Confirm with the user that the design concept is complete before closing.
> **Type `next` or confirm to advance.**

---

# === STRATEGY COMPLETE ===

**Artifacts produced:**
- `SCOPE.md` — what and why
- `DOMAIN_JARGON.md` — shared vocabulary
- `DESIGN.md` — system design diagram, component flowcharts, and architectural choices and tradeoffs

**Next step:** Start a fresh session and run `/prd` when ready to develop.
The `/prd` session should read `SCOPE.md`, `DOMAIN_JARGON.md`, the design diagrams, and the decision log as its primary inputs.

---

# Artifact Templates

## DOMAIN_JARGON.md

```markdown
# Domain Jargon

| Term | Definition | Agreed On |
|---|---|---|
| [term] | [precise, implementation-free definition] | [YYYY-MM-DD] |
```

**Rules:**
- Definitions must be implementation-free — describe domain concepts, not code constructs.
- A term is added only when explicitly agreed upon, not when first mentioned.
- When a term's meaning shifts during a session, update its definition and note the date.
- Deprecated terms stay in the table with a ~~strikethrough~~ and a replacement pointer.
```
