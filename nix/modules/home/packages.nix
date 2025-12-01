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

  home.packages =
    with pkgs;
    [
      ##################################
      # common
      ##################################
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
      asciinema-agg
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
      nixfmt-rfc-style
    ]
    ++ lib.optionals stdenv.isLinux [
      ##################################
      # linux-only
      ##################################
      xsel
      (writeScriptBin "copy" "xsel -ib")
      (writeScriptBin "paste" "xsel -ob")
      libcanberra-gtk3
    ]
    ++ lib.optionals stdenv.isDarwin [
      ##################################
      # darwin-only
      ##################################
    ];
}
