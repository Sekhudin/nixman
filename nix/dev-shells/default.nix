{ self, inputs, ... }:

{
  imports = [
    inputs.pre-commit-hooks.flakeModule
    ./bun.nix
    ./go.nix
  ];

  perSystem =
    { pkgs, config, ... }:

    let
      helper = import ./helper.nix { inherit pkgs; };
    in
    {
      pre-commit.check.enable = true;
      pre-commit.devShell = self.devShells.default;
      pre-commit.settings.hooks = {
        actionlint.enable = true;
        shellcheck.enable = true;
        stylua.enable = true;
        luacheck.enable = false;
        deadnix.enable = true;
        nixfmt-rfc-style.enable = true;
      };

      devShells =
        # $ nix develop github:sekhudin/nixman#nodejs_<VERSION>
        helper.mkShells "nodejs_"

        # $ nix develop github:sekhudin/nixman#go_<VERSION>
        // helper.mkShells "go_"
        // {
          default = pkgs.mkShell {
            shellHook = ''
              ${config.pre-commit.installationScript}
            '';
          };
        };
    };
}
