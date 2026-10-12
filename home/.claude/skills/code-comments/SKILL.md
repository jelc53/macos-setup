---
name: code-comments
description: Marty's rules for code comments. Covers when to write one, when not to, what to say, how to say it, where to put it, and how to handle existing comments Claude encounters. Apply whenever Claude is writing or modifying source code in any language. Default posture is rare and load-bearing. Silence is fine. Verbose is not.
---

# Code comments

Apply when writing, modifying, or reviewing code.

## Default posture

Silence. Most functions get zero comments. A comment must earn its place. If removing it wouldn't confuse a future reader, don't write it. If code is unclear, rewrite it — don't explain it.

## What earns a comment

1. **Why this code exists.** Business/motivation context not visible from the code.
2. **Why this implementation over an obvious alternative.** Only when the contrast is one a fresh reader would plausibly reach for on their own — not a hypothesis rejected mid-chat.
3. **Pre-conditions, restrictions, hidden invariants.** When NOT to call this, workarounds for specific bugs.
4. **Teacher comment.** Domain knowledge a reader is unlikely to have (protocol quirks, crypto constraints, obscure library behaviour).
5. **Checklist comment.** Coordinated change required elsewhere. `// If you add an event type here, also update event_dispatch.py.`
6. **Guide comment.** Short section divider in a long function. Use sparingly; if needed, the function is probably too long.

## Bad comments — never write

- Restates the code. `// increment counter` above `counter++`.
- Explains awkward code. Rewrite the code instead.
- Verbose paragraphs. If the comment is longer than the code, something is wrong.
- Too many comments in one block. Clutter kills signal.
- Contradicts the code. Update or remove.
- References the task, PR, ticket, reviewer, or "added for X". Belongs in commit messages.
- Fabricated context. Don't invent a "why" you don't know.
- Conversation-derived contrastives. `// Not using useMemo because it caused a re-render loop` — only meaningful to someone in the chat. Delete it.
- Session-flavoured narration. "As discussed", "per the earlier decision", "reverting to the original approach". Delete it.
- Placeholder narrations. `// TODO: add error handling later`. Either finish it or file a ticket.
- Restates the function signature in a docstring.

## Style

- Match the file's existing convention first.
- Default for new files: full sentences, capitalised, ending with a period.
- Placement: above-the-line preferred over trailing, unless file convention differs. Never mix.
- Length: one line is almost always enough.
- No emoji. No em-dashes. No hedges unless uncertainty is real. No filler like "Note that".

## Docstrings

- Skip when the name and signature say it all.
- One sentence when there's one non-obvious thing a caller needs.
- Full `@param`/`@returns` only when the file already uses that convention throughout.
- If trivially easy to write, it's probably redundant. Delete it.

## TODOs

Never write one unless explicitly asked. Finish the work or file a ticket.

## Existing comments in code you're editing

- Prune obviously redundant comments adjacent to your change.
- Stay adjacent — don't roam the file.
- When in doubt, leave it alone.
- Update rather than delete when a comment was true before your edit and is now false.

## What NOT to do

- Comment because code looks "important" or "complex". Complexity alone is not a reason.
- Paraphrase the function name in a docstring.
- Comment to explain a variable name. Rename it.
- Add "removed old logic" or `// was: ...` comments. Git has it.
- Add TL;DR summaries at the top of files.
