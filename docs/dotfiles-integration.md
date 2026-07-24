# Dotfiles integration

`ai-guardrails` is an independent flake that exports:

```nix
homeManagerModules.default
```

After the repository is available from a CI-readable Git URL, add it to both the Darwin
and NixOS dotfiles flakes:

```nix
ai-guardrails.url = "github:barleytea/ai-guardrails";
```

Import and enable it from each Home Manager entry point:

```nix
imports = [
  inputs.ai-guardrails.homeManagerModules.default
];

programs.ai-guardrails.enable = true;
```

Commit the matching `flake.lock` update. If the repository remains private, configure the
dotfiles CI with read-only access before enabling the input.

The module owns these paths:

- `~/.claude/CLAUDE.md` and `~/.claude/skills/review-*`
- `~/.codex/AGENTS.md`
- `~/.config/vscode/instructions/ai-guardrails.instructions.md`
- `~/.cursor/rules/ai-guardrails.mdc`
- `~/.gemini/GEMINI.md`

Before enabling it, remove the legacy activation links for Claude and Gemini from
`dotfiles/modules/home/claude/default.nix` and
`dotfiles/modules/home/gemini/default.nix` in the same commit. Keep runtime settings,
secret setup, hooks, status lines, packages, and editor settings in `dotfiles`.

Home Manager refuses unmanaged-file collisions by default. Resolve or back up any existing
managed target intentionally; the module never silently overwrites it.
