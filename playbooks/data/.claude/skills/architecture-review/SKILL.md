---
name: architecture-review
description: Surface architectural friction in a codebase and propose deepening opportunities — refactors that turn shallow modules into deep ones, improving testability and navigability. Use when the user invokes /architecture-review directly, wants to improve architecture, find refactoring openings, consolidate tightly-coupled modules, or make a codebase more testable.
---

# Architecture Review

Surface architectural friction and propose **deepening opportunities** — refactors that turn shallow modules into deep ones. The aim is testability and AI-navigability.

## Glossary

Use these terms exactly in every suggestion. Consistent language is the point — don't drift into "component," "service," "API," or "boundary." Full definitions in [LANGUAGE.md](LANGUAGE.md).

- **Module** — anything with an interface and an implementation (function, class, package, slice).
- **Interface** — everything a caller must know to use the module: types, invariants, error modes, ordering, config. Not just the type signature.
- **Implementation** — the code inside.
- **Depth** — leverage at the interface: a lot of behaviour behind a small interface. **Deep** = high leverage. **Shallow** = interface nearly as complex as the implementation.
- **Seam** — where an interface lives; a place behaviour can be altered without editing in place. (Use this, not "boundary.")
- **Adapter** — a concrete thing satisfying an interface at a seam.
- **Leverage** — what callers get from depth.
- **Locality** — what maintainers get from depth: change, bugs, knowledge concentrated in one place.

Key principles (see [LANGUAGE.md](LANGUAGE.md) for the full list):

- **Deletion test**: imagine deleting the module. If complexity vanishes, it was a pass-through. If complexity reappears across N callers, it was earning its keep.
- **The interface is the test surface.**
- **One adapter = hypothetical seam. Two adapters = real seam.**

This skill is _informed_ by the project's domain model. The domain language gives names to good seams; ADRs record decisions the skill should not re-litigate.

## Process

### 1. Explore Code

Read the project's domain glossary (`DOMAIN_JARGON.md`) and any ADRs in `docs/architecture/decisions/` first.

Then use the Agent tool with `subagent_type=Explore` to walk the codebase. Don't follow rigid heuristics — explore organically and note where you experience friction:

- Where does understanding one concept require bouncing between many small modules?
- Where are modules **shallow** — interface nearly as complex as the implementation?
- Where have pure functions been extracted just for testability, but the real bugs hide in how they're called (no **locality**)?
- Where do tightly-coupled modules leak across their seams?
- Which parts of the codebase are untested, or hard to test through their current interface?

Apply the **deletion test** to anything you suspect is shallow: would deleting it concentrate complexity, or just move it? A "yes, concentrates" is the signal you want.

### 2. Present Candidates

Present a numbered list of deepening opportunities. For each candidate:

- **Files** — which files/modules are involved
- **Problem** — why the current architecture is causing friction
- **Solution** — plain English description of what would change
- **Benefits** — explained in terms of locality and leverage, and also in how tests would improve

**Use `DOMAIN_JARGON.md` vocabulary for the domain, and [LANGUAGE.md](LANGUAGE.md) vocabulary for the architecture.** If `DOMAIN_JARGON.md` defines "Order," talk about "the Order intake module" — not "the FooBarHandler," and not "the Order service."

**ADR conflicts**: if a candidate contradicts an existing ADR in `docs/architecture/decisions/`, only surface it when the friction is real enough to warrant revisiting the ADR. Mark it clearly (e.g. _"contradicts ADR-0007 — but worth reopening because…"_). Don't list every theoretical refactor an ADR forbids.

Do NOT propose interfaces yet. Ask the user: "Which of these would you like to explore?"

### 3. Start Review

Once the user picks a candidate, invoke `/brainstorm` with the selected candidate as full context: the files involved, the problem, the proposed solution, and any constraints or dependencies you identified during exploration.

Side effects happen inline as decisions crystallize:

- **Naming a deepened module after a concept not in `DOMAIN_JARGON.md`?** Add the term to `DOMAIN_JARGON.md` — see [DOMAIN-JARGON-FORMAT.md](DOMAIN-JARGON-FORMAT.md). Create the file lazily if it doesn't exist.
- **Sharpening a fuzzy term during the conversation?** Update `DOMAIN_JARGON.md` right there.
- **User rejects the candidate with a load-bearing reason?** Offer an ADR in `docs/architecture/decisions/`, framed as: _"Want me to record this as an ADR so future architecture reviews don't re-suggest it?"_ Only offer when the reason would actually be needed by a future explorer to avoid re-suggesting the same thing — skip ephemeral reasons ("not worth it right now") and self-evident ones. See [ADR-FORMAT.md](ADR-FORMAT.md).
- **Want to explore alternative interfaces for the deepened module?** See [INTERFACE-DESIGN.md](INTERFACE-DESIGN.md).

### 4. Write Implementation Brief

After all chosen candidates are resolved, write an implementation brief to `docs/architecture/reviews/YYYYMMDD-review.md` (use the actual date). This document is the handoff to a fresh Claude session that will apply the changes.

The brief must be self-contained and include:

- **Purpose and context** — project path, stack, domain docs to read first, candidates skipped and why
- **Implementation order** — which candidates must be applied before others (dependency order)
- **Per-candidate section** — for each resolved candidate:
  - Exact method signatures with parameter names and types
  - Full replacement code for new files
  - Explicit list of methods/files to delete
  - Schema or config changes with before/after where helpful
- **Files changed summary** — a table of every file: Modify / Create / Delete / No change
- **Verification checklist** — concrete observable behaviours to check after applying each candidate

Do not summarise decisions at a high level — write code. The reader of this document is implementing, not deciding.
