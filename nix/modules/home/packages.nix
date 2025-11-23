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

  ####################################################################
  # fix(launchers): enable nixgl and or --no-sandbox options.
  ####################################################################
  xdg.desktopEntries."org.telegram.desktop" = {
    name = "Telegram";
    type = "Application";
    icon = "org.telegram.desktop";
    exec = "nixGLMesa telegram-desktop";
    comment = "New era of messaging";
    terminal = false;
    actions.quit.name = "Quit Telegram";
    actions.quit.exec = "telegram-desktop -quit";
    actions.quit.icon = "application-exit";
    settings.SingleMainWindow = "true";
    settings.StartupWMClass = "TelegramDesktop";
    settings.DBusActivatable = "true";
    settings.X-GNOME-UsesNotifications = "true";
    settings.X-GNOME-SingleWindow = "true";
    settings.Keywords = "tg;chat;im;messaging;messenger;sms;tdesktop;";
    mimeType = [
      "x-scheme-handler/tg"
      "x-scheme-handler/tonsite"
    ];
    categories = [
      "Chat"
      "Network"
      "InstantMessaging"
      "Qt"
    ];
  };

  xdg.desktopEntries.discord = {
    name = "Discord";
    type = "Application";
    icon = "discord";
    exec = "nixGLMesa discord --no-sandbox";
    comment = "All-in-one cross-platform voice and text chat for gamers";
    mimeType = [ "x-scheme-handler/discord" ];
    settings.StartupWMClass = "discord";
    categories = [
      "Network"
      "InstantMessaging"
    ];
  };

  xdg.desktopEntries.slack = {
    name = "Slack";
    type = "Application";
    icon = "slack";
    exec = "nixGLMesa slack --no-sandbox";
    comment = "Slack Desktop";
    mimeType = [ "x-scheme-handler/slack" ];
    settings.StartupWMClass = "Slack";
    categories = [
      "GNOME"
      "GTK"
      "Network"
      "InstantMessaging"
    ];
  };
}
