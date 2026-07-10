---
name: design-feature
description: Design new complex features. Invoke with /design-feature.
---

**Goal:** Reach mutual understanding of what to build and why, with zero ambiguity.

# Context

Read these first:
- Project domain glossary: `@docs/DOMAIN_JARGON.md`
- Architecture diagrams: `@docs/architecture/diagrams`
- Existing ADRs: `@docs/architecture/decisions/` — designs must not silently contradict settled decisions

Use @~/.claude/skills/architecture-review/LANGUAGE.md terms (module, interface, seam, depth, leverage, locality) in system design diagrams and component descriptions. Use `DOMAIN_JARGON.md` vocabulary for domain concepts.

Then use the Agent tool with `subagent_type=Explore` to walk the codebase.

# Scope

Ask the user for a extensive description of the feature to design and start the /brainstorm.

# Side effects during brainstorm

- **New domain concept surfaces?** Add it to `DOMAIN_JARGON.md` — see @~/.claude/skills/architecture-review/DOMAIN-JARGON-FORMAT.md.
- **Design decision hits the ADR threshold?** (hard to reverse, surprising without context, real trade-off) Offer to record it in `docs/architecture/decisions/` — see @~/.claude/skills/architecture-review/ADR-FORMAT.md.

# Artifact

`@docs/components/<feature_name>.md` in the project root.

**Rules:**
- Focus on *what* each component does, not *how* it is implemented.
- Use Mermaid syntax to build the system design and flowchart diagrams.
- System  design diagram is required if the feature involves multiple components or services.
- Sketch diagrams in a way that is understandable to non-technical stakeholders, while still being useful to engineers.

Mermaid Example:
```
graph TD
  A[Component A] --> B[Component B]
  B --> C[Component C]
```

```markdown
# Problem Statement
[The problem from the user's perspective — what pain or gap exists today]

# Proposed Solution
[What will be different — the solution boundary, not implementation details]

# System Design Diagram
[When required, sketch the major technology-agnostic system components and their relationships]

# Flowchart Diagram
[For each non-trivial component, sketch a flowchart of its internal logic or workflow]

# Key Constraints
[Non-negotiable requirements, limitations, or assumptions]

# Out of Scope
[Explicit list of what this effort does NOT cover]
```