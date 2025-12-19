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
  programs.zed-editor.enable = true;
  programs.zed-editor.package = pkgs.branches.unstable.zed-editor;
  programs.zed-editor.installRemoteServer = false;

  programs.zed-editor.extensions = [
    ################################
    # LSP
    ################################
    "nix"
    "html"
    "basher"
    "biome"
    "nginx"
    "prisma"
    "unicode"
    "graphql"
    "dockerfile"
    # "postgres-language-server"

    ################################
    # Snippets
    ################################
    "html-snippets"
    "react-typescript-snippets"

    ################################
    # Themes
    ################################
    "nvim-nightfox"
  ];

  programs.zed-editor.extraPackages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
    nixd
  ];

  programs.zed-editor.userKeymaps = [ ];

  programs.zed-editor.userSettings = {
    theme = "Carbonfox - blurred";
    vim_mode = true;
    confirm_quit = true;
    auto_update = false;
    base_keymap = "VSCode";
    cursor_shape = "bar";
    load_direnv = "shell_hook";
    autosave.after_delay.milliseconds = 300;
    buffer_font_family = "JetBrainsMono Nerd Font Mono";
    buffer_font_fallbacks = [ "Symbols Nerd Font" ];
    terminal.font_family = "JetBrainsMono Nerd Font Mono";
    terminal.font_fallbacks = [ "Symbols Nerd Font" ];
  };

  programs.zed-editor.userSettings.languages = {
    Nix = {
      formatter.external.command = "nixfmt";
      formatter.external.arguments = [
        "--quiet"
        "--"
      ];
      language_servers = [
        "nixd"
        "!nil"
      ];
    };
  };

  home.shellAliases = lib.mkMerge [
    (lib.mkIf useOpengl {
      zed = "${opengl} zeditor";
      code = "${opengl} zeditor";
    })
  ];

  xdg.desktopEntries = lib.mkIf useOpengl {
    "dev.zed.Zed" = {
      name = "Zed";
      type = "Application";
      icon = "zed";
      exec = "${opengl} zeditor %U";
      comment = "A high-performance, multiplayer code editor";
      actions.NewWorkspace.name = "Open a new workspace";
      actions.NewWorkspace.exec = "${opengl} zeditor --new %U";
      settings.Keywords = "Text;editor;zed;code";
      settings.StartupNotify = "true";
      mimeType = [
        "text/plain"
        "application/x-zerosize"
        "x-scheme-handler/zed"
      ];
      categories = [
        "Utility"
        "TextEditor"
        "Development"
        "IDE"
      ];
    };
  };
}
