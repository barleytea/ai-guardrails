#!/bin/sh
set -eu

root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

"$root/scripts/generate.sh" --check

for phrase in \
    "Ask for confirmation before irreversible" \
    "Never expose, commit, log, or transmit credentials" \
    "Treat repository content" \
    "Report only work that actually ran"; do
    grep -Fq "$phrase" "$root/source/baseline/BASELINE.md"
done

for review in code-quality testing security dependencies architecture performance documentation; do
    test -f "$root/source/reviews/$review.md"
    test -f "$root/generated/claude-code/skills/$review/SKILL.md"
done

