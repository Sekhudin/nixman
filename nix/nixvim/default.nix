{ self, inputs, ... }:

{
  perSystem =
    {
      icons,
      pkgs,
      system,
      ...
    }:
    let
      nixvimModule = {
        inherit pkgs;
        module = import ./config;
        extraSpecialArgs = {
          inherit self inputs;
          inherit system icons;
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
