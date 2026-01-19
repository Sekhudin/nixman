{
  lib,
  pkgs,
  color,
  config,
  ...
}:

let
  cfg = config.programs.terminal;
  useOpengl = config.programs.opengl.use != "default";
  opengl = config.programs.opengl.use;
in
{
  options = {
    programs.terminal = {
      use = lib.mkOption {
        default = "none";
        type = lib.types.enum [
          "none"
          "alacritty"
          "ghostty"
        ];
        description = "Select terminal to use `alacritty` or `ghostty`";
      };
    };
  };

  config =
    let
      isGhostty = cfg.use == "ghostty";
      isAlacritty = cfg.use == "alacritty";
    in
    lib.mkMerge [
      ##################################
      # auto-install
      ##################################
      {
        home.packages = [
          pkgs.nerd-fonts.jetbrains-mono
          pkgs.nerd-fonts.fira-code
          pkgs.nerd-fonts.symbols-only
        ]
        ++ lib.optionals isGhostty [ pkgs.ghostty ]
        ++ lib.optionals isAlacritty [ pkgs.alacritty ];
      }

      ##################################
      # ghostty config
      ##################################
      (lib.mkIf isGhostty {
        xdg.configFile."ghostty/config".source =
          let
            formatter = pkgs.formats.keyValue {
              listsAsDuplicateKeys = true;
            };
          in
          formatter.generate "config" {
            background-opacity = 0.9;
            bakground = color.scheme.base00;
            bold-is-bright = true;
            confirm-close-surface = false;
            cursor-click-to-move = false;
            cursor-color = color.scheme.base06;
            cursor-style = "underline";
            cursor-style-blink = true;
            cursor-text = color.scheme.base07;
            custom-shader-animation = true;
            desktop-notifications = true;
            font-family = "JetBrainsMono Nerd Font Mono";
            font-feature = "liga,calt,dlig";
            font-thicken = true;
            foreground = color.scheme.base07;
            macos-window-shadow = false;
            macos-titlebar-style = "transparent";
            palette = color.listKV;
            selection-background = color.scheme.base08;
            selection-foreground = color.scheme.base0F;
            shell-integration = "fish";
            window-decoration = false;
            window-padding-x = 5;
            window-padding-y = 0;
            window-padding-balance = true;
            window-padding-color = "extend";
          };

        xdg.desktopEntries = lib.mkIf useOpengl {
          "com.mitchellh.ghostty" = {
            name = "Ghostty";
            type = "Application";
            icon = "com.mitchellh.ghostty";
            exec = "${opengl} ghostty";
            comment = "A terminal emulator";
            terminal = false;
            startupNotify = true;
            actions.new-window.name = "New Window";
            actions.new-window.exec = "${opengl} ghostty";
            settings.Keywords = "terminal;tty;pty";
            settings.StartupWMClass = "com.mitchellh.ghostty";
            settings.X-GNOME-UsesNotifications = "true";
            settings.X-TerminalArgExec = "-e";
            settings.X-TerminalArgTitle = "--title=";
            settings.X-TerminalArgAppId = "--class=";
            settings.X-TerminalArgDir = "--working-directory=";
            settings.X-TerminalArgHold = "--wait-after-command";
            categories = [
              "System"
              "TerminalEmulator"
            ];
          };
        };
      })

      ##################################

      # alacritty config
      ##################################
      (lib.mkIf isAlacritty {
        programs.alacritty.enable = true;
        programs.alacritty.package = pkgs.alacritty;
        programs.alacritty.settings = {
          window = {
            dimensions = {
              columns = 0;
              lines = 0;
            };
            padding = {
              x = 0;
              y = 0;
            };
            opacity = 0.9;
            startup_mode = "Windowed";
          };
        };

        xdg.desktopEntries = lib.mkIf useOpengl {
          Alacritty = {
            name = "Alacritty";
            genericName = "Terminal";
            type = "Application";
            icon = "Alacritty";
            exec = "${opengl} alacritty";
            comment = "A fast, cross-platform, OpenGL terminal emulator";
            startupNotify = true;
            terminal = false;
            actions.new.name = "New Terminal";
            actions.new.exec = "${opengl} alacritty";
            settings.StartupWMClass = "Alacritty";
            categories = [
              "System"
              "TerminalEmulator"
            ];
          };
        };
      })
    ];
}
