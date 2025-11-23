{
  self,
  lib,
  inputs,
  ...
}:

let
  icons = import ./icons.nix;
  colors = import ./colors.nix { inherit lib; };
  color = colors.mkColor colors.lists.edge;
in
{
  imports = [
    inputs.ez-configs.flakeModule

    ./dev-shells.nix
    ./overlays.nix
    ./nvim.nix
  ];

  ezConfigs.root = ./.;
  ezConfigs.globalArgs = {
    inherit self;
    inherit inputs;
    inherit icons colors color;
  };

  ezConfigs.home = {
    modulesDirectory = ./modules/home;
    configurationsDirectory = ./configurations/home;
    users.syaikhu = {
      standalone.enable = true;
      standalone.pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
        inherit (self.nixpkgs) config overlays;
      };
    };
  };

  flake = {
    nixpkgs.config = {
      allowUnfree = true;
      allowBroken = false;
    };

    nixpkgs.overlays = lib.attrValues self.overlays ++ [
      inputs.nixgl.overlay
    ];

    inherit icons colors color;
  };

  perSystem =
    { system, inputs', ... }:
    {
      formatter = inputs'.nixpkgs.legacyPackages.nixfmt-rfc-style;

      _module.args = {
        inherit icons colors color;

        extraModuleArgs = {
          inherit icons colors color;
        };

        pkgs = import inputs.nixpkgs {
          inherit system;
          inherit (self.nixpkgs) config overlays;
        };
      };
    };
}
