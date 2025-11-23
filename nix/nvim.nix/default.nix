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
          inherit
            self
            inputs
            system
            icons
            ;
        };
      };
    in
    {
      checks = {
        # nvim = inputs.nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule nixvimModule;
        nvim = inputs.nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule (
          nixvimModule
          // {
            module.plugins.image.enable = false;
          }
        );
      };

      packages = {
        nvim = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule nixvimModule;
      };
    };
}
