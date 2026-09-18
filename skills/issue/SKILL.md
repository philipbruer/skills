---
name: issue
description: Turn a description into a short plain-text prompt for the issue tracker's agent and put it on the clipboard. Usage /issue <description>
disable-model-invocation: true
argument-hint: <description>
---

# Issue

Everything after `/issue` is what Philip wants the issue tracker's agent to do. Turn it into a prompt and put it on the clipboard. The terminal wraps lines and adds spacing when copied, so the clipboard is the deliverable.

## Prompt style

- Plain text. A few sentences or one short paragraph. As long as the ask needs, no longer.
- Rewrite his words into a clear, complete request. Add just enough for the agent to understand: the real app or package name, what the thing is. Nothing more.
- Never add the product name. The workspace implies it.
- Stay inside his ask. No extra steps, implementation details, suggestions or related work.
- No bullets, lists, headings, Markdown, filler, or line breaks inside the paragraph.

Example: `/issue describe hosting platform on railway` becomes `Create an issue for hosting the platform app (apps/platform) on Railway.`

## Process

1. Write the prompt to `<scratchpad>/issue-<short-kebab-slug>.txt`, in the session scratchpad directory from the system prompt.
2. Copy it, then print the clipboard length. It must be non-zero. If it fails, say so.
   - Windows: `powershell -NoProfile -Command "Get-Content -Raw -Encoding UTF8 '<windows path>' | Set-Clipboard"; powershell -NoProfile -Command "(Get-Clipboard -Raw).Length"`
   - Mac: `pbcopy < '<path>'; pbpaste | wc -c`
3. Reply with one line: the prompt text, and that it's on the clipboard.
