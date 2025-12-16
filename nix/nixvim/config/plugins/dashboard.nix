{ icons, ... }:

{
  plugins.dashboard.enable = true;
  plugins.dashboard.settings.theme = "doom";
  plugins.dashboard.settings.hide.tabline = true;
  plugins.dashboard.settings.hide.statusline = true;
  plugins.dashboard.settings.config.disable_move = false;
  plugins.dashboard.settings.config.vertical_center = true;
  plugins.dashboard.settings.config.week_header.enable = false;

  plugins.dashboard.settings.config.center = [
    {
      icon = "";
      icon_hl = "group";
      desc = "description";
      desc_hl = "group";
      key = "f";
      key_hl = "group";
      key_format = " [%s]";
      action = "Telescope find_files";
    }
  ];

  plugins.dashboard.settings.config.shortcut = [ ];

  plugins.dashboard.settings.config.header = [
    "                                            "
    "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
    "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
    "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
    "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
    "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
    "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
    "                                            "
    "                                            "
  ];
  plugins.dashboard.settings.config.footer = [
    "${icons.language.nix} ${icons.pipe} Declarative all the things."
  ];
}
