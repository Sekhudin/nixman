{
  lib,
  inputs,
  ...
}:

let
  colors = import ./colors.nix { inherit lib; };
  icons = import ./icons.nix;
  vars = import ./vars.nix { inherit lib; };

  color = colors.mkColor colors.lists.carbon;
  user = (vars.resolveUser vars.users.syaikhu);

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
      color
      colors
      icons
      user
      vars
      ;
  };

  ezConfigs.home = {
    modulesDirectory = ./modules/home;
    configurationsDirectory = ./configurations/home;
    users.${vars.users.syaikhu.username} = {
      standalone.enable = true;
      standalone.pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
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
          color
          colors
          icons
          user
          vars
          ;
      };

      _module.args.extraModuleArgs = {
        inherit inputs;
        inherit
          color
          colors
          icons
          user
          vars
          ;
      };

      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        inherit (vars.nixpkgs) config;
        inherit overlays;
      };

    };
}
