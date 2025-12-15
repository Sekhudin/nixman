{
  lib,
  inputs,
  ...
}:

let
  nixpkgs.prefix = "nixpkgs-";
  nixpkgs.overlays = (lib.attrValues inputs.self.overlays) ++ [
    inputs.nixgl.overlay
  ];
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = false;
  };
in
{
  flake.nixpkgs = { inherit (nixpkgs) config overlays; };

  flake.overlays.default = final: prev: {
    inherit (inputs.nixpkgs-stable.legacyPackages.${prev.stdenv.hostPlatform.system}) nixd nixf nixt;
    nixfmt = prev.nixfmt-rfc-style;
    branches = final.lib.mkChannels;
    vimPlugins = prev.vimPlugins;
    tree-sitter-grammars = prev.tree-sitter-grammars;
    fishPlugins = prev.fishPlugins // {
      nix-env = {
        name = "nix-env";
        src = inputs.nix-env;
      };
    };

    lib = prev.lib.extend (
      _final: _prev: {
        mkChannels = _prev.pipe inputs [
          (_prev.filterAttrs (name: _channel: _prev.strings.hasPrefix nixpkgs.prefix name))
          (_prev.mapAttrs' (
            name: channel:
            _prev.nameValuePair (_prev.strings.removePrefix nixpkgs.prefix name) (
              import channel {
                inherit (prev.stdenv.hostPlatform) system;
                inherit (nixpkgs) config;
              }
            )
          ))
        ];
      }
    );
  };
}
