{
  description = "NIXMAN - Flake for everyone!";

  outputs =
    inputs@{ flake-parts, ... }:
    (flake-parts.lib.mkFlake { inherit inputs; }) {
      systems = [
        "aarch64-linux"
        "x86_64-linux"
      ];

      imports = [ ./nix ];
    };

  inputs = {
    # flake utilities
    flake-parts.url = "github:hercules-ci/flake-parts";
    ez-configs.url = "github:ehllie/ez-configs";
    ez-configs.inputs.nixpkgs.follows = "nixpkgs";
    ez-configs.inputs.flake-parts.follows = "flake-parts";

    # nixpkgs - channels
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    nixpkgs-stable.url = "github:nixos/nixpkgs/release-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs.follows = "nixpkgs-stable";

    # --- home-manager
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixgl.url = "github:nix-community/nixGL";
    nixgl.inputs.nixpkgs.follows = "nixpkgs";

    # ---- nixvim
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs-unstable";
    nixvim.inputs.flake-parts.follows = "flake-parts";

    # --- tools
    process-compose-flake.url = "github:Platonic-Systems/process-compose-flake";
    services-flake.url = "github:juspay/services-flake";

    # utilities
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    pre-commit-hooks.inputs.nixpkgs.follows = "nixpkgs";

    # --- others
    nix-env.url = "github:lilyball/nix-env.fish";
    nix-env.flake = false;
  };
}
