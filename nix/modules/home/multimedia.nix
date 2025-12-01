{ pkgs, ... }:

{
  home.packages = with pkgs; [
    easyeffects
    obs-studio
  ];

  ####################################################################
  # fix(launchers): enable nixgl and or --no-sandbox options.
  ####################################################################
  xdg.desktopEntries."com.github.wwmm.easyeffects" = {
    name = "Easy Effects";
    type = "Application";
    icon = "com.github.wwmm.easyeffects";
    exec = "nixGLMesa easyeffects";
    comment = "Audio Effects for PipeWire Applications";
    terminal = false;
    settings.StartupNotify = "true";
    settings.DBusActivatable = "true";
    settings.X-GNOME-UsesNotifications = "true";
    settings.Keywords = "limiter;compressor;reverberation;equalizer;autovolume;";
    categories = [
      "GTK"
      "AudioVideo"
      "Audio"
    ];
  };

  xdg.desktopEntries."com.obsproject.Studio" = {
    name = "OBS Studio";
    type = "Application";
    icon = "com.obsproject.Studio";
    exec = "nixGLMesa obs";
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
}
