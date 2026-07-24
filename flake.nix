{
  description = "Personal AI coding guardrails";

  outputs = {self}: {
    homeManagerModules.default = import ./nix/home-manager.nix;
  };
}

