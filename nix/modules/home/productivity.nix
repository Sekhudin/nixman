{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dbeaver-bin
    slack
    telegram-desktop
    wpsoffice
    (pkgs.branches.stable.discord.override {
      withVencord = true;
      withOpenASAR = true;
    })
  ];

  ####################################################################
  # fix(launchers): enable nixgl and or --no-sandbox options.
  ####################################################################
  xdg.desktopEntries.dbeaver = {
    name = "DBeaver";
    type = "Application";
    icon = "dbeaver";
    exec = "nixGLMesa dbeaver";
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

  xdg.desktopEntries.slack = {
    name = "Slack";
    type = "Application";
    icon = "slack";
    exec = "nixGLMesa ${pkgs.slack}/bin/slack --no-sandbox -s %u";
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

  xdg.desktopEntries."org.telegram.desktop" = {
    name = "Telegram";
    type = "Application";
    icon = "org.telegram.desktop";
    exec = "nixGLMesa telegram-desktop %u";
    comment = "New era of messaging";
    terminal = false;
    actions.quit.name = "Quit Telegram";
    actions.quit.exec = "nixGLMesa telegram-desktop -quit";
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
}
