{
  self,
  inputs,
  ...
}:

{
  perSystem =
    {
      system,
      pkgs,
      icons,
      color,
      vars,
      ...
    }:
    let
      helpers = import ./helpers.nix { inherit inputs; };
      nixvimModule = {
        module = import ./config;
        pkgs = pkgs.branches.unstable;
        extraSpecialArgs = {
          inherit self inputs system;
          inherit
            icons
            color
            vars
            helpers
            ;
        };
      };
    in
    {
      packages.nvim = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule nixvimModule;
      checks.nvim = inputs.nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule (
        nixvimModule
        // {
          module.plugins.image.enable = false;
        }
      );
    };
}
