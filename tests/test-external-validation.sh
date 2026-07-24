#!/bin/sh
set -eu

root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
work_dir=$(mktemp -d)
trap 'rm -rf "$work_dir"' EXIT HUP INT TERM

skill_dir="$work_dir/example-skill"
mkdir -p "$skill_dir"

cat > "$skill_dir/METADATA.md" <<'EOF'
Upstream: https://github.com/example/example-skill
Commit: 0123456789abcdef0123456789abcdef01234567
License: MIT
Imported-from: skills/example/SKILL.md
Reviewed-on: 2026-07-24
EOF
printf '%s\n' '# Reviewed content' > "$skill_dir/CONTENT.md"
"$root/scripts/validate-external.sh" "$work_dir"

printf '%s\n' 'allowed-tools: Bash' >> "$skill_dir/CONTENT.md"
if "$root/scripts/validate-external.sh" "$work_dir" >/dev/null 2>&1; then
    exit 1
fi
