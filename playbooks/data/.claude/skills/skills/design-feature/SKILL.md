---
name: design-feature
description: Design new complex features. Invoke with /design-feature.
---

**Goal:** Reach mutual understanding of what to build and why, with zero ambiguity.

# Context

Read the project's domain glossary in `@docs/DOMAIN_JARGON.md` and the architecture's diagrams in `@docs/architecture/diagrams` first.
Then use the Agent tool with `subagent_type=Explore` to walk the codebase.

# Scope

Ask the user for a extensive description of the feature to design and start the /brainstorm.

# Artifact

`@docs/components/<feature_name>.md` in the project root.

```markdown
# Problem Statement
[The problem from the user's perspective — what pain or gap exists today]

# Proposed Solution
[What will be different — the solution boundary, not implementation details]

# System Design Diagram
[Sketch the major technology-agnostic system components and their relationships]

# Flowchart Diagram
[For each non-trivial component, sketch a flowchart of its internal logic or workflow]

# Key Constraints
[Non-negotiable requirements, limitations, or assumptions]

# Out of Scope
[Explicit list of what this effort does NOT cover]
```

**Rules:**
- Use Mermaid syntax to build design diagrams and flowcharts.
- Focus on *what* each component does, not *how* it is implemented.

Mermaid Example:
```
graph TD
  A[Component A] --> B[Component B]
  B --> C[Component C]
```
