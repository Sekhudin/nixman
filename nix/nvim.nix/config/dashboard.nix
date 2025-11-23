{ icons, ... }:
{
  plugins.dashboard.enable = true;
  plugins.dashboard.settings.theme = "hyper";
  plugins.dashboard.settings.hide.tabline = true;
  plugins.dashboard.settings.config.mru.limit = 20;
  plugins.dashboard.settings.hide.statusline = true;
  plugins.dashboard.settings.config.project.enable = true;
  plugins.dashboard.settings.config.week_header.enable = false;
  plugins.dashboard.settings.config.shortcut = [
    {
      key = "<S> o h";
      icon = "${icons.notes} ";
      desc = "Taking Notes ";
      action.__raw = "function(p) vim.cmd('NeorgStart') vim.cmd('Neorg index') end";
    }
    {
      key = "<S> f f";
      icon = "${icons.file} ";
      desc = "Find File ";
      action = "Telescope find_files";
    }
    {
      key = "<S> f o";
      icon = "${icons.recent} ";
      desc = "Recents ";
      action = "Telescope oldfiles";
    }
    {
      key = "<S> f F";
      icon = "${icons.word} ";
      desc = "Find Word ";
      action = "Telescope live_grep";
    }
    {
      key = "<S> f n";
      icon = "${icons.plus1} ";
      desc = "New File ";
      action = "new";
    }
    {
      key = "<S> b m";
      icon = "${icons.bookmark} ";
      desc = "Bookmarks ";
      action = "Telescope marks";
    }
  ];

  plugins.dashboard.settings.config.header = [
    "                                                              "
    "                     ░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░                    "
    "                 ░░▒▓█▓▒▒▒▒▒▒▓▓██▓▓▓▒▒▒▒▓▓▒░                  "
    "               ░▒▓█▓▒▒▓█▓▓▓▓░░░▒███████▓▓▒▒█▓▒                "
    "             ░▓██▓▒▒█████████▒░░░█████████▓▒▒██▓              "
    "           ░▓███▓▒████████████░░░▒██████████▓░▓██▓            "
    "          ▒████▒▓█████████████▓░░░▓███████████░▓███▒          "
    "         ▒████▓▒███████████████░░░░████████████░████▒         "
    "        ▒█████░███████████████▓░░░░▒███████████▒▒████▒        "
    "       ░█████▓▒███████████████▒▓▓░░░▒██████████▓░█████░       "
    "      ░██████▓▒██████████████▒▓███░░░▓██████████░██████░      "
    "      ░██████▓░█████████████░▓████▓░░░▓████████▓░██████░      "
    "      ▒███████░▓███████████░▓██████▒░░░████████▒▓██████▒      "
    "      ▒███████▒▒█████████▓░▒████████░░░░██████▓▒███████▓      "
    "      ▒███████▒▒▒███████▓░▒██████████░░░░████▓░████████▒      "
    "      ░███████▓░▒▓█████▓░░███████████▓░░░░██▒░█████████░      "
    "      ░▓██████▓▒░░▒▒▓█▓░░█████████████▒░░▒▒░▒▓█████████░      "
    "       ░███████▒▒░░░░░▒▓███████████████▒░░░▒▒█████████░       "
    "       ░▒██████▒▒░░░▒▒▒▒▒▒▒▒▒▓█▓▓▓▓▓▓▒▒▒░░░▓▒████████▒        "
    "        ░▒██████████████████▓░░░░███████████████████▒         "
    "          ░████████▓▓▓▓░░░░░░▒░░░░░░░░░░▓▓▓████████░          "
    "           ░▒████████▓▓▒░░░░░█▒▓░░░░░░░▒▓▓███████▒            "
    "             ░▒█████████▓▒▒░░▓▒▓░░░▒▓██████████▒              "
    "                ░▓███████▒▓▒▒░░░░░▒▓████████▓▒                "
    "                   ░▒▓████▓▓▒▒▓░▓▒▒█████▓▒░                   "
    "                           ▒▒▒▓▓▓▒▒                           "
    "                                                              "
  ];
}
