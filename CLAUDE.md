# Project context

`source/` is canonical. Do not edit `generated/` manually; run `make generate`.
Machine installation is exclusively through the exported Home Manager module in
`nix/home-manager.nix`. This repository never manages secrets, packages, or host runtime
configuration.

