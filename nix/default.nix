{
  lib,
  inputs,
  ...
}:

let
  icons = import ./icons.nix;
  colors = import ./colors.nix { inherit lib; };
  color = colors.mkColor colors.lists.edge;

  config = {
    allowUnfree = true;
    allowBroken = false;
  };

  overlays = (lib.attrValues (import ./overlays { inherit inputs config; })) ++ [
    inputs.nixgl.overlay
  ];
in
{
  imports = [
    inputs.ez-configs.flakeModule

    ./nvim.nix
    ./dev-shells
    ./composes
  ];

  flake.overlays = {
    default = overlays;
  };

  ezConfigs.root = ./.;
  ezConfigs.globalArgs = {
    inherit inputs;
    inherit icons colors color;
  };

  ezConfigs.home = {
    modulesDirectory = ./modules/home;
    configurationsDirectory = ./configurations/home;
    users.syaikhu = {
      standalone.enable = true;
      standalone.pkgs = import inputs.nixpkgs {
        system = "x86_64-linux"; # <<--- 'system' ini bisa tanpa harcode ga, bang?
        inherit config overlays;
      };
    };
  };

  perSystem =
    { system, inputs', ... }:
    {
      formatter = inputs'.nixpkgs.legacyPackages.nixfmt-rfc-style;

      _module.args = {
        inherit inputs;
        inherit icons colors color;
      };

      _module.args.extraModuleArgs = {
        inherit inputs;
        inherit icons colors color;
      };

      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        inherit config overlays;
      };

    };
}
