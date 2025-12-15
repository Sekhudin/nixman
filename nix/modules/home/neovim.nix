{
  lib,
  pkgs,
  config,
  inputs,
  ...
}:

let
  useOpengl = config.programs.opengl.use != "default";
  opengl = config.programs.opengl.use;
  terminal = config.programs.terminal.use;
  selfPkgs = inputs.self.packages.${pkgs.stdenv.system} or { };
in
lib.mkIf (selfPkgs ? nvim) {
  home.packages = [ inputs.self.packages.${pkgs.stdenv.system}.nvim ];
  xdg.desktopEntries.nvim = lib.mkIf useOpengl {
    name = "Neovim";
    type = "Application";
    icon = "nvim";
    exec = "${opengl} ${terminal} -e nvim";
    comment = "The best text editor";
    terminal = false;
    startupNotify = false;
    settings.Keywords = "Text;editor";
    categories = [
      "Utility"
      "TextEditor"
    ];
  };
}
