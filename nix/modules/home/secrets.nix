{ inputs, pkgs, ... }:

{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  home.packages = with pkgs; [ sops ];

  programs.git.extraConfig.diff.sopsdiffer.textconv = "sops -d --config /dev/null";

  sops.gnupg.home = "~/.gnupg";
  sops.gnupg.sshKeyPaths = [ ];
  sops.defaultSopsFile = "${inputs.self}/secrets/secret.sops.yaml";
}
