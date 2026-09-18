#!/usr/bin/env bash
# Prints the given files (paths relative to the plugin root) as SubagentStart additionalContext.
root="${CLAUDE_PLUGIN_ROOT}"
files=()
for f in "$@"; do files+=("$root/$f"); done
text=$(cat "${files[@]}" | tr -d '\r')
escaped=$(printf '%s' "$text" | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' | awk '{printf "%s\\n", $0}')
printf '{"hookSpecificOutput":{"hookEventName":"SubagentStart","additionalContext":"%s"}}' "$escaped"
