{
  lib,
  ezModules,
  vars,
  ...
}:

{
  home = {
    inherit (vars.users.syaikhu) username homeDirectory;
    stateVersion = "25.05";
  };

  within.gpg.enable = true;
  within.pass.enable = true;

  programs.opengl.use = "nixGLMesa";
  programs.terminal.use = "ghostty";

  imports = lib.attrValues ezModules;
}
