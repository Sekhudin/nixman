{ pkgs, ... }:

{
  config.globals = { };

  config.opts = { };

  config.extraPackages = with pkgs; [ nerd-fonts.jetbrains-mono ];
}
