{
  lib,
  pkgs,
  inputs,
  ezModules,
  ...
}:

{
  home = rec {
    username = "syaikhu";
    stateVersion = "25.05";
    homeDirectory = "/home/${username}";
    packages = [
      inputs.self.packages.${pkgs.stdenv.system}.nvim
    ];
  };

  within.gpg.enable = true;
  within.pass.enable = true;

  programs.opengl.use = "nixGLMesa";
  programs.terminal.use = "ghostty";

  imports = lib.attrValues ezModules ++ [ ];
}
