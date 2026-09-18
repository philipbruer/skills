# How I work with Claude Code

The global layer of my Claude Code setup: the rules, hooks and skills that apply in every project. Anything specific to one project lives in that project's own repo, next to the code it describes.

One install on my claude.ai account puts this layer on every machine.

## How it works

1. A session starts. A hook prints the rule files into the agent's context, so it follows them from the first message. Subagents get the same rules.
2. The agent tries `git commit`. A second hook blocks the command, because I manage git myself.
3. A task matches a skill's description. Only then does that skill's text load, so an unused skill costs one line of context.
4. I push a change. claude.ai re-syncs the repo, and every device has it at its next session.

## What is in it

| Path | Purpose |
|---|---|
| `rules/` | How the agent replies, writes, behaves and codes. Start with `rules/replies.md`. |
| `hooks/` | Loads the rules, blocks mutating git commands, reports oversized skill files. |
| `skills/` | My own skills. `structure` says where every instruction belongs. |
| `.agents/skills/` | Third-party skills, installed by the [skills CLI](https://skills.sh). `skills-lock.json` lists each one and its source. Never edited by hand. |

## Install

The rules are written for me. To try the setup, fork the repo, edit `rules/`, and use your fork's name in the steps below.

On claude.ai, once per account. Every device signed in to the account then gets the plugin by itself, cloud sessions included:

1. Customize → Plugins → Add → Add marketplace → Add from a repository: `philipbruer/skills`.
2. Menu on the marketplace → Sync automatically: on.
3. Discover → install `pb`.

Or on one machine, from a terminal:

```
claude plugin marketplace add https://github.com/philipbruer/skills.git
claude plugin install pb@philipbruer-skills
```

Skills run as `/pb:<name>`. A machine installed from the terminal pulls a push with `claude plugin marketplace update philipbruer-skills`. Third-party skills update with `npx skills update` in this folder, then a commit.
