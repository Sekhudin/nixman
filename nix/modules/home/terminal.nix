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
            desktop-notifications = true;
            confirm-close-surface = false;
            shell-integration = "fish";
            custom-shader-animation = true;
            window-decoration = false;
            window-padding-x = 5;
            window-padding-y = 0;
            window-padding-balance = true;
            window-padding-color = "extend";
            bold-is-bright = true;
            background-opacity = 0.9;
            background = color.scheme.base00;
            foreground = color.scheme.base07;
            selection-background = color.scheme.base08;
            selection-foreground = color.scheme.base0F;
            cursor-color = color.scheme.base06;
            cursor-text = color.scheme.base07;
            cursor-style = "underline";
            cursor-style-blink = true;
            palette = color.listKV;
            cursor-click-to-move = false;
            macos-window-shadow = false;
            macos-titlebar-style = "transparent";
            font-family = "JetBrainsMono Nerd Font Mono";
            font-feature = "liga,calt,dlig";
            font-thicken = true;
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
