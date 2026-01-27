{
  inputs,
  lib,
  pkgs,
  ezModules,
  ...
}:

{
  home = rec {
    username = "syaikhu";
    stateVersion = "25.05";
    homeDirectory = "/home/${username}";
  };

  within.gpg.enable = true;
  within.pass.enable = true;

  programs.opengl.use = "nixGLMesa";
  programs.terminal.use = "ghostty";

  imports = lib.attrValues ezModules ++ [
    inputs.sops-nix.homeManagerModules.sops
    {
      home.packages = [ pkgs.sops ];

      programs.git.extraConfig.diff.sopsdiffer.textconv = "sops -d --config /dev/null";

      sops.gnupg.home = "~/.gnupg";
      sops.gnupg.sshKeyPaths = [ ];
      sops.defaultSopsFile = "${inputs.self}/secrets/secret.sops.yaml";
    }
  ];
}
