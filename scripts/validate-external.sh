#!/bin/sh
set -eu

external_dir=$1

[ -d "$external_dir" ] || exit 0

for skill_dir in "$external_dir"/*; do
    [ -d "$skill_dir" ] || continue
    name=$(basename "$skill_dir")

    case "$name" in
        *[!a-z0-9-]* | "") exit 1 ;;
    esac

    test -f "$skill_dir/METADATA.md"
    test -f "$skill_dir/CONTENT.md"
    test "$(find "$skill_dir" -type f | wc -l | tr -d ' ')" -eq 2

    grep -Eq '^Upstream: https://github\.com/[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+$' \
        "$skill_dir/METADATA.md"
    grep -Eq '^Commit: [0-9a-f]{40,64}$' "$skill_dir/METADATA.md"
    grep -Eq '^License: (MIT|BSD-2-Clause|BSD-3-Clause|Apache-2\.0|ISC)$' \
        "$skill_dir/METADATA.md"
    grep -Eq '^Imported-from: .+$' "$skill_dir/METADATA.md"
    grep -Eq '^Reviewed-on: [0-9]{4}-[0-9]{2}-[0-9]{2}$' "$skill_dir/METADATA.md"

    if grep -Ein \
        '!\`|^allowed-tools:|\.claude-plugin|\.codex-plugin|\.cursor-plugin|gemini-extension\.json|mcpServers|(^|[^[:alnum:]_])hooks?([^[:alnum:]_]|$)' \
        "$skill_dir/CONTENT.md" "$skill_dir/METADATA.md"; then
        exit 1
    fi
done
