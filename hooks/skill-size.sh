#!/usr/bin/env bash
# After a Write or Edit: a SKILL.md over 500 lines is reported to Claude. Exit 2 shows stderr to Claude.
input=$(cat)
file=$(printf '%s' "$input" | grep -o '"file_path" *: *"[^"]*"' | head -1 | sed -e 's/^"file_path" *: *"//' -e 's/"$//' -e 's/\\\\/\//g')
case "$file" in
  *SKILL.md) ;;
  *) exit 0 ;;
esac
[ -f "$file" ] || exit 0
lines=$(wc -l < "$file")
if [ "$lines" -gt 500 ]; then
  echo "$file has $lines lines. SKILL.md limit is 500. Move bulk into references/, one level deep, and say in SKILL.md when to read each file." >&2
  exit 2
fi
exit 0
