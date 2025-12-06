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
  programs.zed-editor.package = pkgs.zed-editor;
  programs.zed-editor.installRemoteServer = false;

  programs.zed-editor.extensions = [ ];

  programs.zed-editor.extraPackages = [ ];

  programs.zed-editor.themes = { };

  programs.zed-editor.userKeymaps = [ ];

  programs.zed-editor.userSettings = { };

  home.shellAliases = lib.mkMerge [
    (lib.mkIf useOpengl {
      zed = "${opengl} zeditor";
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
      settings.Keywords = "zed";
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
