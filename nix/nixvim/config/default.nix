{ pkgs, ... }:

let
  indent = 2;
in
{
  imports = [
    ./plugins
    ./auto-save.nix
    ./color-schemes.nix
    ./keymaps.nix
  ];

  globals = {
    mapleader = " ";
    laststatus = 3;
  };

  opts = {
    cmdheight = 0;
    laststatus = 3;
    number = true;
    relativenumber = true;
    mouse = "";
    encoding = "utf8";
    termguicolors = true;
    backspace = [
      "indent"
      "eol"
      "start"
    ];
    cursorline = false;
    wrap = false;
    background = "dark";
    tabstop = indent;
    shiftwidth = indent;
    smarttab = true;
    expandtab = true;
    compatible = false;
    conceallevel = 3;
    concealcursor = "n";
  };

  extraPackages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];
}
