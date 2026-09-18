#!/usr/bin/env bash
# Blocks mutating git commands. Exit 2 blocks the tool call and shows stderr to Claude.
input=$(cat)
if printf '%s' "$input" | grep -Eq 'git( +-C +[^ ]+)? +(add|commit|push|pull|checkout|switch|restore|reset|rebase|merge|stash|cherry-pick|revert|tag|clean|rm|mv|init|branch +-[dDmM])( |\\|"|$)'; then
  echo "Blocked: mutating git command. Philip manages git." >&2
  exit 2
fi
exit 0
