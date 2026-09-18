---
name: structure
description: Where every instruction for Claude lives. Use before adding, moving or rewording any rule, skill, hook, memory, doc or CLAUDE.md line, and when asked where something goes.
---

# Structure

Every instruction lives in git, in one place. Three sources, one job each:

- This repo: personal, every project. Replies, writing, behavior, code style, hooks, own skills, third-party skills.
- The project repo: facts and procedures for that project.
- The claude.ai account: what syncs to every device on its own. This repo is added there as a marketplace, and Anthropic's own skills and plugins live there too.

## This repo

| Layer | File | Loads | Mechanism |
|---|---|---|---|
| Replies | `rules/replies.md` | Every chat, every subagent | `SessionStart`, `SubagentStart` hooks |
| Behavior | `rules/behavior.md` | Same | Same |
| Code style | `rules/code.md` | Same | Same |
| Prose in files | `rules/writing.md` | Same | Same |
| Writing rules | `.agents/skills/unslop/SKILL.md`, third-party | Same | Same |
| Hard rules | `hooks/` | Every matching action | Hook that blocks, or reports after the fact |
| Own skills | `skills/<name>/SKILL.md` | On demand | `/pb:<name>`, or description match |
| Third-party skills | `.agents/skills/<name>/`, installed by the skills CLI, listed in `skills-lock.json` | On demand | Same |

## Project repo

| Kind | File | Loads |
|---|---|---|
| Short fact for all work | `CLAUDE.md`, under 200 lines | Every chat |
| Rule for one code area | `.claude/rules/<topic>.md` with `paths:` | On reading a matching file |
| The why behind a rule, a decision with rejected alternatives | `docs/` or `docs/concepts/<topic>.md`, one-line pointer from `CLAUDE.md` or the rule | When opened |
| Product overview, ops notes | `docs/` | When opened |
| Which library does which job | `.claude/rules/libraries.md` with `paths: "**/package.json"` | On reading a `package.json` |
| Procedure for this project | `.claude/skills/<name>/SKILL.md` | On demand |
| Rule for work outside repo files | Inside the skill that does the work | When the skill runs |
| Audit report | `audit/<topic>-<date>.md`, written by an audit skill, one file per run, committed | When opened |
| Task, todo, idea | The issue tracker. Never a file. | |

`docs/` never holds an instruction. An instruction found there moves to a rule or a skill.

A project with its own `structure` skill: that one decides for that repo.

## Where a rule goes

1. Describes replies in the conversation: `rules/replies.md`. Prose in files: `rules/writing.md`.
2. Describes what Claude does: `rules/behavior.md`.
3. Describes code Claude writes, any project: `rules/code.md`.
4. Must never break: a blocking hook. Text is followed, not enforced.
5. Procedure with steps: a skill. Here if generic, in the project if not.
6. Fact about one project: that project, per the table above.

One rule can split. "Never commit" is a line in `behavior.md` and a hook.

Memory: Claude's automatic memory stays on. `/pb:memory <what>` puts something into the file that owns it, so every machine gets it.

## Never

- `~/.claude/CLAUDE.md`, `~/.claude/skills/`, `~/.claude/rules/`. One machine only.
- A second copy. Already stated somewhere: edit that place.
- Replies, writing, behavior or code style in a project `CLAUDE.md`.
- Editing a third-party skill. They are installed with `npx skills add <repo> --skill <name> -a universal --copy -y` and updated with `npx skills update`. An edit is lost at the next update. Need a change: write an own skill.
- Dates, versions, vendors in a rule unless the rule depends on them.
- Library facts a current model knows or a version will change: an API, a deprecation, a migration. A correction that came from a model's stale knowledge is not a rule. The linter, the types and the docs enforce those.

## Skills

- Model-invoked: no flag. Description lists triggers.
- User-invoked: `disable-model-invocation: true`. Description is for a human. No other skill can call it.
- A skill that needs another says: call the Skill tool with `<name>`.
- Own `SKILL.md` under 500 lines. A hook reports a breach. Bulk goes in `references/`. A third-party skill is exempt, and never edited to fit.
- References sit one level deep. No reference links to another reference.
- `SKILL.md` says when to read each reference: "Read `references/x.md` before writing a hook", not "see references".
- A reference belongs to its skill. Other files reach it by calling the Skill tool with that skill, never by path.

## Reach

| Surface | Setup |
|---|---|
| Every device, every surface | Add this repo as a marketplace on claude.ai with sync on, install `pb` there. Once, for the account. |
| One machine without the account route | `claude plugin marketplace add https://github.com/philipbruer/skills.git`, then `claude plugin install pb@philipbruer-skills`. |

## Change

Edit, push. claude.ai re-syncs the marketplace, and every device gets it at its next session start. Third-party skills: `npx skills update` in the repo, commit, push.
