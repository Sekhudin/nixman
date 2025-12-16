{ pkgs, ... }:

{
  imports = [
    ./plugins
    ./color-schemes.nix
  ];

  config.globals = { };

  config.opts = { };

  config.extraPackages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
  ];
}
