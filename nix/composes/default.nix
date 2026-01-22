{ inputs, ... }:

{
  imports = [
    inputs.process-compose-flake.flakeModule
    ./postgres.nix
    ./mailpit.nix
    ./root.nix
  ];
}
