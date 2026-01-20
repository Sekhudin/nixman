{
  lib,
  icons,
  vars,
  ...
}:

let
  theme = "hyper";
  isDoom = theme == "doom";
  isHyper = theme == "hyper";
in
lib.mkMerge [
  {
    plugins.dashboard.enable = true;
    plugins.dashboard.settings.hide = {
      tabline = true;
      statusline = true;
      winbar = true;
    };

    plugins.dashboard.settings.theme = "${theme}";
    plugins.dashboard.settings.config.disable_move = true;
    plugins.dashboard.settings.config.week_header.enable = false;
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
      "                                                               "
      "                                                               "
      "${icons.language.nix} ${icons.pipe} Declarative all the things."
    ];
  }

  (lib.mkIf isHyper {
    plugins.dashboard.settings.config.project = {
      enable = true;
      limit = 3;
    };

    plugins.dashboard.settings.config.mru = {
      enable = true;
      limit = 5;
      cwd_only = true;
    };

    plugins.dashboard.settings.config.packages = {
      enable = false;
    };

    plugins.dashboard.settings.config.shortcut = [
      {
        key = "fn";
        icon = "${icons.plus_1} ";
        desc = "New File ";
        group = "Label";
        action = "new";
      }
      {
        key = "ff";
        icon = "${icons.file} ";
        desc = "Find File ";
        group = "@property";
        action = "Telescope find_files";
      }
      {
        key = "cn";
        icon = "${icons.language.nix} ";
        desc = "Nix Config ";
        group = "DiagnosticHint";
        action = "Neotree dir=${vars.dir.nixConfig}";
      }
    ];
  })

  (lib.mkIf isDoom {
    plugins.dashboard.settings.config.vertical_center = true;
    plugins.dashboard.settings.config.center = [
      {
        key = "fn";
        icon = "${icons.plus_1} ";
        desc = "New File ";
        action = "new";
      }
      {
        key = "ff";
        icon = "${icons.file} ";
        desc = "Find File ";
        action = "Telescope find_files";
      }
      {
        key = "cn";
        icon = "${icons.language.nix} ";
        desc = "Nix Config ";
        action = "Neotree dir=${vars.dir.nixConfig}";
      }
    ];
  })
]
