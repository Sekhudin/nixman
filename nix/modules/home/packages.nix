{ pkgs, ... }:

{
  programs.home-manager.enable = true;

  programs.direnv.enable = true;
  programs.direnv.silent = true;
  programs.direnv.nix-direnv.enable = true;

  programs.bat.enable = true;
  programs.bat.config = {
    style = "plain";
    theme = "TwoDark";
  };

  programs.btop.enable = true;
  programs.btop.settings = {
    vim_keys = true;
    show_battery = false;
  };

  home.packages = with pkgs; [
    ##################################
    # common
    ##################################
    xsel
    (writeScriptBin "copy" "xsel -ib")
    (writeScriptBin "paste" "xsel -ob")
    coreutils
    gnused
    gawk

    curl
    wget
    tree
    ack
    fswatch

    ##################################
    # multi-media
    ##################################
    asciinema
    ffmpeg
    imagemagick

    ##################################
    # productivity
    ##################################
    fzf
    fzy
    du-dust
    fd
    jq
    iamb
    ripgrep
    docker
    starship
    slack
    telegram-desktop
    (pkgs.branches.stable.discord.override {
      withVencord = true;
      withOpenASAR = true;
    })
    nixfmt-rfc-style
  ];
}
