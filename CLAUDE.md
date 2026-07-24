# Project context

`source/` is canonical. Do not edit `generated/` manually; run `make generate`.
Machine installation is exclusively through the exported Home Manager module in
`nix/home-manager.nix`. This repository never manages secrets, packages, or host runtime
configuration.

External content is allowed only under `source/external/<name>/` as reviewed
`METADATA.md` and adapted `CONTENT.md`. Never import upstream `SKILL.md`, plugins, MCP
servers, hooks, scripts, or installers. Follow `docs/external-content.md`.
