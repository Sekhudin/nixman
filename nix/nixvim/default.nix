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
      color,
      icons,
      user,
      vars,
      ...
    }:
    let
      helper = import ./helper.nix { inherit inputs; };
      nixvimModule = {
        module = import ./config;
        pkgs = pkgs.branches.unstable;
        extraSpecialArgs = {
          inherit self inputs system;
          inherit
            color
            helper
            icons
            user
            vars
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
