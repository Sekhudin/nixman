{ ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      # $ nix develop github:sekhudin/nixman#bun
      devShells.bun = pkgs.mkShell {
        buildInputs = [ pkgs.bun ];
      };
    };
}
