{ ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      # $ nix develop github:sekhudin/nixman#go
      devShells.go = pkgs.mkShell {
        description = "Go Development Environment";
        nativeBuildInputs = [ pkgs.go ];
        shellHook = ''
          export GOPATH="$(${pkgs.go}/bin/go env GOPATH)"
          export PATH="$PATH:$GOPATH/bin"
        '';
      };
    };
}
