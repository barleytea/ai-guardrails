# External content lifecycle

## Scope

Only reviewed, adapted text content may be vendored: skills, rules, and instructions.
Plugins, MCP servers, hooks, commands, executables, package installers, and upstream
`SKILL.md` files are not accepted.

The source of truth is `source/external/<name>/`. Home Manager only links generated files
from this repository; it never downloads or executes third-party installation code.

## Add a skill

1. Review the upstream GitHub source and choose one immutable full commit SHA.
2. Confirm the upstream license is MIT, BSD-2-Clause, BSD-3-Clause, Apache-2.0, or ISC.
3. Create `source/external/<name>/`, where `<name>` uses lowercase letters, digits, and
   hyphens only.
4. Create `METADATA.md` with exactly these fields:

   ```text
   Upstream: https://github.com/owner/repository
   Commit: 0123456789abcdef0123456789abcdef01234567
   License: MIT
   Imported-from: skills/example/SKILL.md
   Reviewed-on: 2026-07-24
   ```

5. Copy only the reviewed and adapted prose into `CONTENT.md`. Do not copy YAML
   frontmatter, dynamic command expansion, permission declarations, scripts, plugin
   definitions, MCP configuration, or hook definitions.
6. Run `make generate` and `make test`. Review the resulting `generated/external-skills/`
   diff before committing.

Generated skills are exposed to Claude Code and the shared `~/.agents/skills/` directory
used by Codex and compatible Copilot clients. Cursor and Gemini do not receive external
skills in this release because their safe, global skill format requires a tool-specific
extension bundle.

## Update a skill

1. Let Renovate create an update proposal for the tracked upstream repository, or create
   one manually.
2. Review the exact upstream diff from the recorded commit to the proposed full commit SHA.
3. Re-evaluate provenance, license, prompt-injection content, requested tool use, secret or
   network guidance, and whether the adapted prose is still appropriate.
4. Update `Commit`, `Reviewed-on`, and the adapted `CONTENT.md` only after that review.
5. Run `make generate` and `make test`, then review every generated diff.

Never merge an external-content update automatically. If upstream adds executable content,
do not vendor it.

## Remove a skill

Delete `source/external/<name>/`, run `make generate`, run `make test`, and commit the
generated removal. Home Manager removes the managed links on the next activation.
