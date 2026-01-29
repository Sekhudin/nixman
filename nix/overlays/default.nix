{
  inputs,
  lib,
  ...
}:

let
  vars = import ../vars.nix { inherit lib; };
in
{
  flake.overlays.default = final: prev: {
    inherit (inputs.nixpkgs-stable.legacyPackages.${prev.stdenv.hostPlatform.system}) nixd nixf nixt;

    ##############################
    # Lib
    ##############################
    lib = prev.lib.extend (
      _final: _prev: {
        mkChannels = _prev.pipe inputs [
          (_prev.filterAttrs (name: _channel: _prev.strings.hasPrefix "nixpkgs-" name))
          (_prev.mapAttrs' (
            name: channel:
            _prev.nameValuePair (_prev.strings.removePrefix "nixpkgs-" name) (
              import channel {
                inherit (prev.stdenv.hostPlatform) system;
                inherit (vars.nixpkgs) config;
              }
            )
          ))
        ];
      }
    );

    ##############################
    # Fish plugins
    ##############################
    fishPlugins = prev.fishPlugins // {
      nix-env = {
        name = "nix-env";
        src = inputs.nix-env;
      };
    };

    ##############################
    # Vim plugins
    ##############################
    vimPlugins = final.branches.unstable.vimPlugins.extend (
      _: __: {

      }
    );

    ##############################
    # Tree-sitter grammars
    ##############################
    tree-sitter-grammars = prev.tree-sitter-grammars // {

    };

    ##############################
    # Branches
    ##############################
    branches = final.lib.mkChannels;

    ##############################
    # Packages
    ##############################
    nixfmt = prev.nixfmt-rfc-style;
    claude-code = final.branches.unstable.claude-code;
  };
}
