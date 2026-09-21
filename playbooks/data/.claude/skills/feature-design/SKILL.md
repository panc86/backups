---
name: feature-design
description: End-to-end feature development process, creating a feature document in the repo.
disable-model-invocation: true
---

# Scope
Your job is to design a new feature from requirements until it is ready for implementation, not to build it.

Work in the feature document at `docs/features/<feature-name>.md`: the one I give, or the one already in use in this conversation.
Read it before acting. Otherwise, ask the user to run /feature-requirements, first.

# Rules
- Run the steps in order, and wait for confirmation to go to the next step.
- Focus on *what* each step does, not *how* it is implemented.
- A design must not silently contradict settled decisions (ADR)s in `@docs/architecture_reviews/`, if they exist.
- If a design decision hits the ADR threshold, i.e. hard to reverse, surprising without context, real trade-off, offer to record it in `docs/architecture_reviews/` using the format specified in `~/.claude/skills/architecture-review/ADR-FORMAT.md`.
- For each decision, give the tradeoffs, the strongest counter-argument, and the valid alternatives.
- If a question can be answered by exploring the codebase, explore the codebase instead.
- If a requirement or a glossary term changes or a new one is introduced, tell me and suggest to run /feature-requirements again.
- If the design starts carrying a fix for existing behaviour, note it Out of Scope. It never becomes part of this feature.
- Develop only steps that are lean and stable. The failure to avoid is developing a step that should have been deleted.
- Use Mermaid to visualize the steps of the feature design.

## Steps

### 1. Draft
Draft a feature design including (1) the process runtime flow first, and (2) the implementation plan, each as numbered steps and write it to Feature Design.

### 2. Delete
For every step, apply a delete test: Does it make things worse if this is gone? If nothing does, delete the step.
Write the surviving steps to Feature Design, tagging the requirements they serve, and logging each deletion with its reason.

### 3. Deepen
Challenge me relentlessly questioning every aspect of the surviving steps in the proposed feature until we reach a mutual understanding. Walk the design tree depth-first, one decision at a time, until every branch is resolved.
Write each resolved decision under the step it concerns.

When a feature design has been deepened, suggest /code to implement it.