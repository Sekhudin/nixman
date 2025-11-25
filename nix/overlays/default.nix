{
  inputs,
  config,
}:

{
  default = final: prev: {
    inherit (inputs.nixpkgs-stable.legacyPackages.${prev.stdenv.hostPlatform.system}) nixd nixf nixt;

    nixfmt = prev.nixfmt-rfc-style;

    lib = prev.lib.extend (import ./channels.nix);

    branches = final.lib.channels {
      inherit inputs;
      nixpkgsArgs = {
        inherit (prev.stdenv.hostPlatform) system;
        inherit config;
      };
    };

    vimPlugins = prev.vimPlugins.extend (
      import ./vim-plugins.nix {
        inherit (prev) lib;
        inherit inputs;
      }
    );

    tree-sitter-grammars = prev.tree-sitter-grammars // {

    };

    fishPlugins = prev.fishPlugins // {
      nix-env = {
        name = "nix-env";
        src = inputs.nix-env;
      };
    };
  };
}
