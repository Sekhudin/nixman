{ pkgs, lib, ... }:

let
  indent = 2;
in
{
  imports = [
    ./auto-cmd.nix
    ./plugins
    ./auto-save.nix
    ./color-schemes.nix
    ./keymaps.nix
    ./user-commands.nix
  ];

  clipboard = lib.mkIf pkgs.stdenv.isLinux {
    register = "unnamedplus";
    providers.xsel.enable = true;
  };

  globals = {
    mapleader = " ";
    laststatus = 3;
  };

  opts = {
    background = "dark";
    backspace = [
      "indent"
      "eol"
      "start"
    ];
    cmdheight = 0;
    compatible = false;
    conceallevel = 3;
    concealcursor = "n";
    cursorline = false;
    encoding = "utf8";
    expandtab = true;
    foldenable = false;
    foldlevel = 99;
    foldlevelstart = 99;
    laststatus = 3;
    mouse = "";
    number = true;
    relativenumber = true;
    shiftwidth = indent;
    smarttab = true;
    tabstop = indent;
    termguicolors = true;
    wrap = false;
  };
}
