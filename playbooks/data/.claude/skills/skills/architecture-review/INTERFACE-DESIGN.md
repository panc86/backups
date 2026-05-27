# Interface Design

When a candidate warrants deeper interface exploration, use this process to generate and compare alternative designs. Draws on "Design It Twice" principles.

## Phase 1: Problem Framing

Before spawning agents, document the problem space:

- State the constraints (what the module must and must not do)
- Map dependencies by category (callers, collaborators, external systems)
- Provide a rough code sketch of the current state

Share this framing with the user while agents work in parallel.

## Phase 2: Parallel Sub-Agent Design

Spawn 3+ agents via the Agent tool, each constrained by a distinct design priority:

**Agent 1 — Minimal interface**
Brief: "Minimize the interface — aim for 1–3 entry points max. Maximise leverage per entry point."

**Agent 2 — Flexible interface**
Brief: "Maximise flexibility across all foreseeable use cases. Prefer configurability over convenience."

**Agent 3 — Optimised for the common caller**
Brief: "Design for the most frequent caller. Make their path effortless; let edge cases pay more."

**Agent 4 (optional) — Ports and adapters**
Brief: "Design around ports and adapters. Every cross-seam dependency becomes an interface the module owns."

Each agent must produce:
- Interface specification (types, entry points, error modes)
- Usage example from the common caller's perspective
- Implementation hiding strategy (what stays behind the seam)
- Dependency approach (what it owns vs. receives)
- Trade-off analysis using [LANGUAGE.md](LANGUAGE.md) vocabulary

Use `DOMAIN_JARGON.md` for domain naming throughout.

## Phase 3: Comparison and Recommendation

Present each design sequentially, then contrast them across three dimensions:

- **Depth** — how much behaviour per unit of interface?
- **Locality** — where do changes, bugs, and knowledge concentrate?
- **Seam placement** — where does behaviour variation enter the module?

Offer an opinionated recommendation. If no single design wins, propose a hybrid and explain the specific borrowings.
