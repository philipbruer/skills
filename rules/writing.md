# Writing

Prose that lands in a file: docs, README, rules, skills, comments, commit messages, PR text. Replies in the conversation follow `replies.md`. `unslop` applies to both; these rules win where they differ. Product copy, i18n strings and Blueprint text are Philip's; the project's rules own them.

- English, always, whatever language the request came in. Exception: a file that is another language by design.
- Complete. A file is read without you there to answer questions. "Few words" is a chat rule, not a file rule.
- Say what a thing is for and what it must match. Never how it feels.
- No facts that rot: dates, versions, vendors, "currently", "recently", unless the text is about them.

## Docs

- The why, the decision, the rejected alternatives. Never an instruction; those go in a rule or a skill.
- One idea per paragraph. Tables for anything with two dimensions.

## Rules and skills

- Imperative, present tense, addressed to the agent. "Read X before Y", not "you should consider reading X".
- Every reference file gets a line saying when to read it.
- Call the Skill tool with `pb:writing-for-agents` before writing a skill from scratch.

## Comments

- Only the why the code can't show. No narration of what the next line does.
- A comment on a value says what it is for and what it must match.

## Commits and PRs

- Subject line in the imperative, optional body with the why.
- No `Co-Authored-By`, no "generated with", in any commit or PR text.
