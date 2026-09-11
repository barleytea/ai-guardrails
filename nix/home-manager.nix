{config, lib, ...}: let
  cfg = config.programs.ai-guardrails;
  generated = ../generated;
  externalSkillsDir = generated + "/external-skills";
  externalSkillNames =
    if builtins.pathExists externalSkillsDir
    then builtins.attrNames (builtins.readDir externalSkillsDir)
    else [];
  externalSkillFiles = builtins.listToAttrs (lib.concatMap (name: [
    {
      name = ".agents/skills/external-${name}";
      value.source = externalSkillsDir + "/${name}";
    }
    {
      name = ".claude/skills/external-${name}";
      value.source = externalSkillsDir + "/${name}";
    }
  ]) externalSkillNames);
in {
  options.programs.ai-guardrails = {
    enable = lib.mkEnableOption "declarative AI coding guardrails";

    installInstructionFiles = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Install the generated instruction files (~/.claude/CLAUDE.md, ~/.codex/AGENTS.md, ~/.cursor/rules/ai-guardrails.mdc, ~/.config/vscode/instructions/ai-guardrails.instructions.md, ~/.gemini/GEMINI.md). Set to false when the consuming dotfiles already manage richer instruction files at those paths and only want the review-* and external skills.";
    };
  };

  config = lib.mkIf cfg.enable {
    home.file = {
      ".claude/skills/review-architecture".source = generated + "/claude-code/skills/architecture";
      ".claude/skills/review-code-quality".source = generated + "/claude-code/skills/code-quality";
      ".claude/skills/review-dependencies".source = generated + "/claude-code/skills/dependencies";
      ".claude/skills/review-documentation".source = generated + "/claude-code/skills/documentation";
      ".claude/skills/review-layering".source = generated + "/claude-code/skills/layering";
      ".claude/skills/review-performance".source = generated + "/claude-code/skills/performance";
      ".claude/skills/review-security".source = generated + "/claude-code/skills/security";
      ".claude/skills/review-testing".source = generated + "/claude-code/skills/testing";
    } // externalSkillFiles // lib.optionalAttrs cfg.installInstructionFiles {
      ".claude/CLAUDE.md".source = generated + "/claude-code/CLAUDE.md";
      ".codex/AGENTS.md".source = generated + "/codex/AGENTS.md";
      ".config/vscode/instructions/ai-guardrails.instructions.md".source =
        generated + "/github-copilot/ai-guardrails.instructions.md";
      ".cursor/rules/ai-guardrails.mdc".source = generated + "/cursor/ai-guardrails.mdc";
      ".gemini/GEMINI.md".source = generated + "/gemini/GEMINI.md";
    };
  };
}
