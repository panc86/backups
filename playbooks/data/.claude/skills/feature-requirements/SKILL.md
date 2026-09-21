---
name: feature-requirements
description: Extract the critical requirements and define glossary terms from a new feature request, and record the result in a feature document in the repo.
disable-model-invocation: true
---

# Scope
Your job is to extract requirements and define glossary terms from a new feature request, not to build it.

Read before acting:
- `@docs/DOMAIN_JARGON.md` Project domain glossary
- `@docs/system_architecture.md` System Architecture
- `@docs/architecture_reviews/` Architecture Decision Records (ADR)

If I do NOT give you a `docs/features/<feature-name>.md` feature document, create it using this template.
```markdown
# <Feature>
## Problem Statement
## Requirements
## Definition of Done
## Feature Design
## Glossary
## Out of Scope
```
Then, ask me for an extensive description of the new feature from which the problem it solves, the requirements it serves, and the definition of done can be extracted and written to the feature document.

# Rules
- Requirements must be clear, complete, and testable.
- If exploring the codebase can answer a question, do that instead of asking.
- If a requirement is a solution in disguise, restate it as the need behind it.
- If a new domain concept surfaces, add it to the `DOMAIN_JARGON.md` using the format specified in `~/.claude/skills/architecture-review/DOMAIN-JARGON-FORMAT.md`, and to the feature document.

# Refinement
Challenge the requirements one at a time to ensure they are necessary. The failure to avoid is designing a feature based on a requirement that should have been deleted.

For each requirement, ask:
- What problem does it solve? If the answer is none or weak, delete it.
- What breaks if we drop it? If nothing does, delete it.

When all requirements are refined, open the feature document so I can review them, and wait for my confirmation.

If confirmed, then, suggest /feature-design as the next step. Otherwise, suggest another iteration of /requirements.