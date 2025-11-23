{
  lib,
  pkgs,
  color,
  config,
  ...
}:

let
  cfg = config.programs.terminal;
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
      optionalGhostty = lib.optionals isGhostty [ pkgs.ghostty ];
      optionalAlacritty = lib.optionals isAlacritty [ pkgs.alacritty ];
      homePackages = optionalGhostty ++ optionalAlacritty;
    in
    lib.mkMerge [
      ##################################
      # auto-install
      ##################################
      {
        home.packages = homePackages ++ [
          pkgs.nixgl.nixGLMesa
          pkgs.nerd-fonts.fira-code
          pkgs.nerd-fonts.jetbrains-mono
        ];
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
            window-padding-x = 8;
            window-padding-y = 5;
            window-padding-color = "background";
            bold-is-bright = true;
            background-opacity = 1;
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
            font-feature = "JetBrainsMono Nerd Font Mono";
            font-family = "FiraCode Nerd Font Mono";
            font-thicken = true;
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
            background_opacity = 0.95;
            startup_mode = "Windowed";
          };
        };
      })
    ];
}
