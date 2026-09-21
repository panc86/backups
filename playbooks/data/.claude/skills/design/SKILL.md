---
name: design
description: Jargon and architectural aware, zero ambiguity, feature design.
disable-model-invocation: true
---

# Context

First read:
- Project domain glossary: `@docs/DOMAIN_JARGON.md`
- System Architecture: `@docs/system_architecture.md`
- Existing ADRs: `@docs/architecture_reviews/` — designs must not silently contradict settled decisions

Use @~/.claude/skills/architecture-review/LANGUAGE.md terms (module, interface, seam, depth, leverage, locality) in system design diagrams and component descriptions. Use `DOMAIN_JARGON.md` vocabulary for domain concepts. Then use the Agent tool with `subagent_type=Explore` to walk the codebase.

# Scope

Ask me an extensive description of the feature to design. Then invoke the /spec skill to challenge it and help me reasoning about it.

# Side effects during spec

- **New domain concept surfaces?** Add it to `DOMAIN_JARGON.md` — see @~/.claude/skills/architecture-review/DOMAIN-JARGON-FORMAT.md.
- **Design decision hits the ADR threshold?** (hard to reverse, surprising without context, real trade-off) Offer to record it in `docs/architecture_reviews/` — see @~/.claude/skills/architecture-review/ADR-FORMAT.md.
- **Design starts carrying a fix for existing behaviour?** Stop and ask: address it now, or note it and defer. Either way it never becomes part of this component — *now* means its own `docs/components/` design that this one names as a dependency, *defer* means a line in *Out of Scope*. Keep each component about its feature, so it stays focused and independent of defects that are to be fixed anyway.

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

# Definition of Done
[When the development of a feature is considered done]

# System Design Diagram
[For non-trivial features, sketch the major technology-agnostic system components and their relationships]

# Flowchart Diagram
[For non-trivial features, sketch a flowchart of its internal logic or workflow]

# Key Constraints
[Non-negotiable requirements, limitations, or assumptions]

# Out of Scope
[Explicit list of what this effort does NOT cover]
```
