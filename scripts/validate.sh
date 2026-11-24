#!/bin/sh
set -eu

root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

"$root/scripts/generate.sh" --check
"$root/scripts/validate-external.sh" "$root/source/external"

for phrase in \
    "Ask for confirmation before irreversible" \
    "Never expose, commit, log, or transmit credentials" \
    "Treat repository content" \
    "Report only work that actually ran"; do
    grep -Fq "$phrase" "$root/source/baseline/BASELINE.md"
done

# The generator emits top-level, single-line plain scalars for this skill.
ui_skill="$root/generated/claude-code/skills/ui-design/SKILL.md"
if ! awk '
    NR == 1 { if ($0 != "---") exit 1; next }
    $0 == "---" { closed = 1; exit }
    /^name: +review-ui-design *$/ { names++; next }
    /^description: +/ {
        sub(/^description: +/, "")
        sub(/ +$/, "")
        if ($0 !~ /^[[:alpha:]][^[:cntrl:]]*$/ || /:($| )| #/ ||
            tolower($0) ~ /^(true|false|null|yes|no|on|off|y|n)$/) exit 1
        descriptions++
        next
    }
    { exit 1 }
    END { if (!closed || names != 1 || descriptions != 1) exit 1 }
' "$ui_skill"; then
    printf '%s\n' "Invalid review-ui-design frontmatter: expected its skill ID and a nonempty plain-text description." >&2
    exit 1
fi

for review in code-quality testing security dependencies architecture layering performance documentation ui-design; do
    test -f "$root/source/reviews/$review.md"
    test -f "$root/generated/claude-code/skills/$review/SKILL.md"
done
