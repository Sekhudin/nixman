{
  lib,
  pkgs,
  config,
  ...
}:

let
  useOpengl = config.programs.opengl.use != "default";
  opengl = config.programs.opengl.use;
in
{
  home.packages = with pkgs; [
    claude-code
    dbeaver-bin
    slack
    telegram-desktop
    wpsoffice
    (discord.override {
      withVencord = true;
      withOpenASAR = true;
    })
  ];

  ####################################################################
  # fix(launchers): enable nixgl and or --no-sandbox options.
  ####################################################################
  xdg.desktopEntries = lib.mkIf useOpengl {
    dbeaver = {
      name = "DBeaver";
      type = "Application";
      icon = "dbeaver";
      exec = "${opengl} dbeaver";
      comment = "Universal Database Manager and SQL Client";
      terminal = false;
      settings.StartupWMClass = "DBeaver";
      settings.Keywords = "Database;SQL;IDE;JDBC;ODBC;MySQL;PostgreSQL;Oracle;DB2;MariaDB;";
      settings.StartupNotify = "true";
      mimeType = [
        "application/sql"
      ];
      categories = [
        "IDE"
        "Development"
      ];
    };

    slack = {
      name = "Slack";
      type = "Application";
      icon = "slack";
      exec = "${opengl} ${pkgs.slack}/bin/slack --no-sandbox -s %u";
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

    "org.telegram.desktop" = {
      name = "Telegram";
      type = "Application";
      icon = "org.telegram.desktop";
      exec = "${opengl} telegram-desktop %u";
      comment = "New era of messaging";
      terminal = false;
      actions.quit.name = "Quit Telegram";
      actions.quit.exec = "${opengl} telegram-desktop -quit";
      actions.quit.icon = "application-exit";
      settings.SingleMainWindow = "true";
      settings.StartupWMClass = "TelegramDesktop";
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

    discord = {
      name = "Discord";
      type = "Application";
      icon = "discord";
      exec = "${opengl} discord --no-sandbox";
      comment = "All-in-one cross-platform voice and text chat for gamers";
      mimeType = [ "x-scheme-handler/discord" ];
      settings.StartupWMClass = "discord";
      categories = [
        "Network"
        "InstantMessaging"
      ];
    };
  };
}
