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
    easyeffects
    obs-studio
    qpwgraph
    mpv
  ];

  ####################################################################
  # fix(launchers): enable nixgl and or --no-sandbox options.
  ####################################################################
  xdg.desktopEntries = lib.mkIf useOpengl {
    "com.github.wwmm.easyeffects" = {
      name = "Easy Effects";
      type = "Application";
      icon = "com.github.wwmm.easyeffects";
      exec = "${opengl} ${pkgs.easyeffects}/bin/easyeffects";
      comment = "Audio Effects for PipeWire Applications";
      terminal = false;
      settings.StartupNotify = "true";
      settings.X-GNOME-UsesNotifications = "true";
      settings.Keywords = "limiter;compressor;reverberation;equalizer;autovolume;";
      categories = [
        "GTK"
        "AudioVideo"
        "Audio"
      ];
    };

    "com.obsproject.Studio" = {
      name = "OBS Studio";
      type = "Application";
      icon = "com.obsproject.Studio";
      exec = "${opengl} obs";
      comment = "Free and Open Source Streaming/Recording Software";
      terminal = false;
      settings.StartupNotify = "true";
      settings.StartupWMClass = "obs";
      settings.Keywords = "limiter;compressor;reverberation;equalizer;autovolume;";
      categories = [
        "AudioVideo"
        "Recorder"
      ];
    };
  };
}
