## Code Philosophy

- Fail early and loudly. Use direct access (dict["key"]) instead of defensive .get() patterns.
- No silent fallbacks. If a fallback is truly necessary, provide explicit rationale in a comment.
- Don't guess. Never assume field names, constants, or enums—check the codebase or ask.

## Communication

- Be direct. Answer questions concisely; lead with the answer.
- Ask, don't assume. In ambiguous situations, ask clarifying questions rather than guessing.
- Minimal diffs. When suggesting code changes, show only what's changing.
- Tell me key tensions, design choices or trade-offs being made explicitly or implicitly by suggested implementations.
- No need to coddle me and be nice. I'd prefer honestly - e.g. if I ask if something is a good idea, you can say "no it's a bad idea because x, y and z"
