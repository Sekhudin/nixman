{
  lib,
  inputs,
  ...
}:

let
  icons = import ./icons.nix;
  vars = import ./vars.nix;
  colors = import ./colors.nix { inherit lib; };
  color = colors.mkColor colors.lists.carbon;
  overlays = (lib.attrValues inputs.self.overlays) ++ [
    inputs.nixgl.overlay
  ];
in
{
  imports = [
    inputs.ez-configs.flakeModule

    ./composes
    ./dev-shells
    ./nixvim
    ./overlays
  ];

  ezConfigs.root = ./.;
  ezConfigs.globalArgs = {
    inherit inputs;
    inherit
      icons
      vars
      colors
      color
      ;
  };

  ezConfigs.home = {
    modulesDirectory = ./modules/home;
    configurationsDirectory = ./configurations/home;
    users.syaikhu = {
      standalone.enable = true;
      standalone.pkgs = import inputs.nixpkgs {
        system = "x86_64-linux"; # <<--- must hardcode
        inherit (vars.nixpkgs) config;
        inherit overlays;
      };
    };
  };

  perSystem =
    { system, inputs', ... }:
    {
      formatter = inputs'.nixpkgs.legacyPackages.nixfmt-rfc-style;

      _module.args = {
        inherit inputs;
        inherit
          icons
          vars
          colors
          color
          ;
      };

      _module.args.extraModuleArgs = {
        inherit inputs;
        inherit
          icons
          vars
          colors
          color
          ;
      };

      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        inherit (vars.nixpkgs) config;
        inherit overlays;
      };

    };
}
