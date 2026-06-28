# Global agent instructions

Personal preferences for AI coding agents.

## Code philosophy

- Fail early and loudly. Use direct access (`dict["key"]`) instead of defensive `.get()` patterns.
- No silent fallbacks. If a fallback is truly necessary, provide explicit rationale in a comment.
- Don't guess. Never assume field names, constants, or enums — check the codebase or ask.
- Prefer inline/hardcoded dataframes and dummy objects in tests over layered helper functions that build them. If the data gets unwieldy, move it to `conftest.py`. Reach for a helper only when duplication is severe and the helper is trivially correct.
- If code is well named and structured, it should mostly be readable without code comments and lengthy docstrings. Only add comments for exceptional behaviour that needs explaining, or future TODOs.

## Communication

- Be direct. Answer concisely; lead with the answer.
- Ask, don't assume. In ambiguous situations, ask clarifying questions rather than guessing.
- Minimal diffs. When changing code, show only what's changing.
- Surface key tensions, design choices, or trade-offs being made — explicitly or implicitly.
- No need to coddle me. I'd prefer honesty — e.g. if I ask whether something's a good idea, say "no, it's a bad idea because x, y, z" when that's true.
