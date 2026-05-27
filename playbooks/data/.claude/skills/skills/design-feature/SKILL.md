---
name: design-feature
description: >
  Strategy orchestrator for non-trivial feature design. Use when user invokes /design-feature.
---

This skill guides the user through a structured, multi-phase design process for complex features or systems.

1. **Scope Phase**
- Load @docs/DOMAIN_JARGON.md if available, and capture domain jargon throughout the session to establish a shared vocabulary.
- Define the problem, proposed solution, key constraints, and out-of-scope items.
2. **Design Concept Phase**
- Load @docs/architecture/DESIGN.md if available, and create/update:
  - Technology-agnostic system design and component flowchart diagrams.
  - A log of architectural choices and tradeoffs.


# Artifacts
- `docs/DOMAIN_JARGON.md` — shared vocabulary
- `docs/architecture/DESIGN.md`:
  - system design and component flowchart diagrams
  - architectural decisions with tradeoffs
- `docs/architecture/components/<feature-name>.md` — what and why



# 1. Scope Phase

**Goal:** Reach mutual understanding of what to build and why, with zero ambiguity.

## DOMAIN_JARGON.md

Create/update `docs/DOMAIN_JARGON.md` in the project root:

```markdown
# Domain Jargon

| Term | Definition | Agreed On |
|---|---|---|
| [term] | [precise, implementation-free definition] | [YYYY-MM-DD] |
```

**Rules:**
- Definitions must be implementation-free — describe domain concepts, not code constructs.
- A term is added only when explicitly agreed upon, not when first mentioned.
- When a term's meaning shifts is agreed during a session, update its definition and note the date.
- Deprecated terms stay in the table with a ~~strikethrough~~ and a replacement pointer.
- After brainstorm concludes, review `docs/DOMAIN_JARGON.md` together:
  - Confirm each term is accurate and complete.
  - Deprecate or refine any terms that shifted meaning during the session.

## Brainstorm Session (/brainstorm skill):

1. Ask the user for the description of the feature or idea to design.
2. Suggest a concise clear feature name to be accepted/updated by the user.
3. Challenge every aspect of the idea relentlessly, walk each branch of the decision tree and resolve dependencies one-by-one.
4. For each Q&A, provide tradeoffs, counter-arguments, and clearly optimal alternatives.

**Jargon capture rules (active throughout Brainstorm Session):**
- When a new domain term is introduced or agreed upon, immediately append it to `DOMAIN_JARGON.md`.
- When user language conflicts with an existing entry, flag it immediately and resolve before continuing.
- When a fuzzy or overloaded concept appears, propose a precise canonical term.
- Test terms with concrete scenarios to confirm precision.
- Only domain-meaningful terms — no implementation details (class names, file paths, method signatures).
- Entries are created lazily — only when genuinely agreed, never speculatively.

## <feature-name>.md

Create `docs/architecture/components/<feature-name>.md` in the project root:

```markdown
# Problem Statement
[The problem from the user's perspective — what pain or gap exists today]

# Proposed Solution
[What will be different — the solution boundary, not implementation details]

# Key Constraints
[Non-negotiable requirements, limitations, or assumptions]

# Out of Scope
[Explicit list of what this effort does NOT cover]
```

**Exit criteria:** You can describe the solution without saying "it depends" or "we could do X or Y."

> Confirm with the user that mutual understanding is reached before advancing.
> **Type `next` or confirm to advance to Phase 2.**



# 2. Design Concept Phase

**Goal:** Maintain a technology-agnostic architectural blueprint with traceable decisions.

**Rules:**
- A decision is recorded if is:
  - hard to reverse,
  - the result of genuine tradeoffs, or
  - non-obvious to a future reader.
- Use Mermaid syntax to build design diagrams and flowcharts.
- Focus on *what* each component does, not *how* it is implemented.

Mermaid Example:
```
graph TD
  A[Component A] --> B[Component B]
  B --> C[Component C]
```

## DESIGN.md

Create/update `docs/architecture/DESIGN.md` in the project root with the following sections:

```markdown
# System Design Diagram

[Sketch the major technology-agnostic system components and their relationships]

# Component Flowcharts

[For each non-trivial component, sketch a flowchart of its internal logic or workflow]

# Architectural Choices and Tradeoffs
[Track every major architectural decision made during this phase]

```
| Decision | Alternatives Considered | Rationale |
|---|---|---|
| [What was decided] | [What else was considered] | [Why this choice] |
```
```

**Exit criteria:** System diagram covers all major components. Every non-trivial component has a flowchart. Every significant architectural choice is in the Architectural Choices and Tradeoffs table.

> Confirm with the user that the design concept is complete before closing.
> **Type `next` or confirm to advance.**


# Next Steps

Suggest the user the following next steps to continue the development process:
1. `/clear` this session and start `/tdd`.
2. `/clear` this session and create a Product Requirements Document with `/prd` using `docs/DOMAIN_JARGON.md`, `docs/architecture/DESIGN.md` and `docs/architecture/components/<feature-name>.md` inputs.
3. Touch some grass.
