---
name: feature-glossary
description: Validate a feature document's Glossary against how its terms are used in the document and in the code. Reports undefined, drifting, duplicate and unused terms, and proposes fixes.
disable-model-invocation: true
---

Your job is to validate the terms, not to change the code.

Work in the feature document at `docs/features/<feature-name>.md`: the one I give, or the one already in use in this conversation.
Otherwise, ask me. Read it before acting. If I have edited it by hand, my edits win.

Check the Glossary against the rest of the document first, then against the code, if there is any:
- Undefined: a domain term is used but not defined.
- Drift: a term is used with a meaning other than its definition.
- Synonyms: two words are used for one concept.
- Overloaded: one word is used for two concepts.
- Unclear: a definition could be read two ways, or is circular.
- Unused: a term is defined but never used.
In code, check the names of types, functions, events and tables that carry Glossary concepts.

Report each finding with where it occurs and a proposed fix, giving the trade-off and at least one alternative. If there are no findings, say so.

Apply fixes only after my confirmation:
- Never change a definition yourself.
- You may add missing terms, delete unused ones, and reword usages to match their definitions.
- For code, list the renames without making them.

When done, suggest /requirements if a meaning must change.
