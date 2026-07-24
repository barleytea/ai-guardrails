# ai-guardrails

Personal, declarative guardrails and evidence-based review skills for Claude Code,
Codex, GitHub Copilot, Cursor, and Gemini.

The repository is the canonical source. Its Home Manager module installs the checked-in
adapters; `make` only generates and validates repository content.

## Install from dotfiles

After publishing this repository, add it as a flake input, import
`homeManagerModules.default`, then enable:

```nix
programs.ai-guardrails.enable = true;
```

For a private GitHub repository, the dotfiles CI must have read access to this input
(for example, through a dedicated read-only deploy key or token). Commit the input lock
update together with the dotfiles integration. Do not use a machine-local absolute path
in a committed dotfiles flake.

See `docs/dotfiles-integration.md` for the migration sequence and `nix/home-manager.nix`
for the managed paths and collision behavior.

## Development

```sh
make generate
make validate
make test
```

No command in this repository writes to a user configuration directory. Home Manager
activation is the only installation path.
