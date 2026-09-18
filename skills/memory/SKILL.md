---
name: memory
description: Route something worth remembering to the file that owns it. Usage /pb:memory <what to remember>
disable-model-invocation: true
argument-hint: <what to remember>
---

# Memory

`$ARGUMENTS` is what Philip wants kept. Put it in the file that owns it, in git, so every machine gets it.

1. Classify what is being remembered. Call the Skill tool with `structure` if unsure where it goes.

| It is | Goes to |
|---|---|
| How Claude writes | `rules/replies.md` in the skills repo |
| What Claude does, a preference, a correction | `rules/behavior.md` in the skills repo |
| Code style, any project | `rules/code.md` in the skills repo |
| A procedure | A skill: skills repo if generic, project if not |
| A fact about the project | The project's `CLAUDE.md`, a rule in `.claude/rules/`, or `docs/` |
| A task or idea | The issue tracker |
| State that changes, such as what was done today | Nowhere. Git and the tracker hold it. |

2. Write one line, in the style of the file it joins. A correction becomes the rule it implies, without the story behind it.
3. Write it, and reply with the file and the line.
