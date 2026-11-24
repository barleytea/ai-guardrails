# Project context

`source/` is canonical. Do not edit `generated/` manually; run `make generate`.
Machine installation is exclusively through the exported Home Manager module in
`nix/home-manager.nix`. This repository never manages secrets, packages, or host runtime
configuration.

`review-ui-design` uses the generated review skill for both Claude Code and Codex.
Keep its conditional routing in the baseline and its review procedure in
`source/reviews/ui-design.md`. Its Home Manager paths work with instruction files disabled.

External content is allowed only under `source/external/<name>/` as reviewed
`METADATA.md` and adapted `CONTENT.md`. Never import upstream `SKILL.md`, plugins, MCP
servers, hooks, scripts, or installers. Follow `docs/external-content.md`.
