---
name: prd
description: Create a PRD and implementation plan through codebase exploration and module design.
Use when user wants to write a Product Requirements Document (PRD) to begin development.
Typically follows a /randd strategy session — read SCOPE.md, DOMAIN_JARGON.md, and DESIGN.md
from the project root before starting.
---

Default output location is <project-root>/docs/PRD.md.

## Inputs

Before writing the PRD, read the following strategy artifacts if they exist in the project root:
- `SCOPE.md` — problem statement, solution boundary, constraints, out-of-scope
- `DOMAIN_JARGON.md` — agreed domain vocabulary (use these terms consistently in the PRD)
- `DESIGN.md` — system design diagram, component flowcharts, and architectural choices and tradeoffs produced by `/randd`

The PRD is the technological implementation of `SCOPE.md`. It should not re-explain the problem — it translates the agreed scope and design into user stories, acceptance criteria, and an implementation plan.

## PRD Template

```markdown
## Problem Statement

[The problem from the user's perspective - what pain exists today]

## Solution

[The solution from the user's perspective - what will be different]

## User Stories

[Numbered list covering all aspects of the feature]

1. As a <actor>, I want <capability>, so that <benefit>
   - Acceptance: <how we know this story is complete>

Example:
1. As a mobile bank customer, I want to see my account balance, so that I can make informed spending decisions
   - Acceptance: Balance displays within 2 seconds, updates on pull-to-refresh

## Implementation Decisions

[Architectural choices, module boundaries, interfaces, schema changes, API contracts]

Do NOT include specific file paths or code snippets - they become outdated quickly.

## Implementation Plan

Write a step-by-step implementation plan that another developer (or Claude) can follow to build the product.

## Testing Strategy

- What makes a good test for this feature (test behavior, not implementation)
- Use the [TDD skill](~/.claude/skills/tdd/SKILL.md) philosophy
- Which modules need tests and what kind (unit, integration, e2e)
- Similar tests in the codebase to use as reference, if available

## Out of Scope

[Explicit list of what this PRD does NOT cover]

## Open Questions

[Unresolved items that need follow-up]

## Priority & Sequencing

[Suggested order of implementation, dependencies between stories]
```
