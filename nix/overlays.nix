{ inputs, ... }:

{
  flake.overlays.default =
    final: prev:
    let
      system = prev.stdenv.hostPlatform.system;
    in
    {
      inherit (inputs.nixpkgs-stable.legacyPackages.${system}) nixd nixf nixt;

      nixfmt = prev.nixfmt-rfc-style;

      lib = prev.lib.extend (
        _: lib': {
          mkChannels =
            {
              inputs,
              nixpkgsArgs,
              prefix ? "nixpkgs-",
            }:
            lib'.pipe inputs [
              (lib'.filterAttrs (name: _channel: lib'.strings.hasPrefix prefix name))
              (lib'.mapAttrs' (
                name: channel:
                lib'.nameValuePair (lib'.strings.removePrefix prefix name) (import channel nixpkgsArgs)
              ))
            ];
        }
      );

      branches = final.lib.mkChannels {
        inherit inputs;
        nixpkgsArgs = {
          inherit system;
          inherit (inputs.self.nixpkgs) config;
        };
      };

      fishPlugins = prev.fishPlugins // {
        nix-env = {
          name = "nix-env";
          src = inputs.nix-env;
        };
      };

      tree-sitter-grammars = prev.tree-sitter-grammars // {

      };

      vimPlugins = prev.vimPlugins.extend (
        _: __:
        let
          prefixName = "vimPlugins_";
          builder =
            src:
            prev.vimUtils.buildVimPlugin rec {
              inherit src;
              pname = src.name;
              version = src.lastModifiedDate;
            };

          hasPrefix = k: builtins.substring 0 11 k == prefixName;
          removePrefix = k: prev.lib.removePrefix prefixName k;
          removePrefixAttr = prev.lib.attrsets.mapAttrs' (
            k: v: prev.lib.attrsets.nameValuePair (removePrefix k) v
          );
          filterWithPrefix = prev.lib.attrsets.filterAttrs (k: _: hasPrefix k);
          addNameWithPrefix = prev.lib.attrsets.mapAttrs (k: v: v // { name = removePrefix k; });
          builders = prev.lib.attrsets.mapAttrs (_: v: (builder v));
          compose = [
            filterWithPrefix
            addNameWithPrefix
            builders
            removePrefixAttr
          ];
          apply = x: f: f x;
          flakeVimPlugins = builtins.foldl' apply inputs compose;
        in
        flakeVimPlugins
        // {

        }
      );
    };
}
