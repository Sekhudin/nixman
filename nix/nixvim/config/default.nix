{ pkgs, vars, ... }:

{
  imports = [
    ./plugins
    ./color-schemes.nix
  ];

  config.globals.mapleader = vars.nixvim.leader;

  config.opts = { };

  config.extraPackages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];
}
