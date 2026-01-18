{ self, inputs, ... }:

{
  perSystem =
    {
      system,
      icons,
      vars,
      ...
    }:
    let
      helpers = import ./helpers.nix { inherit inputs; };
      nixvimModule = {
        module = import ./config;
        extraSpecialArgs = {
          inherit self inputs system;
          inherit icons vars helpers;
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
