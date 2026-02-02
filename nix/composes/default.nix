{ inputs, ... }:

{
  imports = [
    inputs.process-compose-flake.flakeModule
    ./ai.nix
    ./postgres.nix
    ./mailpit.nix
    ./root.nix
  ];
}
