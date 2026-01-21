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
  programs.mpv.enable = true;
  programs.mpv.scripts = with pkgs.mpvScripts; [
    mpris
    thumbfast
    modernz
  ];

  programs.mpv.bindings = {
    "q" = "quit";
    "WHEEL_UP" = "add volume 2";
    "WHEEL_DOWN" = "add volume -2";
    "MBTN_LEFT" = "cycle pause";
    "MBTN_RIGHT" = "script-binding modernz-settings";
    "ALT+j" = "add geometry -5";
    "ALT+k" = "add geometry +5";
  };

  programs.mpv.config = {
    ao = "pipewire";
    audio-buffer = "0.5";
    autofit = "35%";
    border = "no";
    cache = "yes";
    demuxer-max-back-bytes = "100M";
    demuxer-max-bytes = "500M";
    geometry = "30%x30%+100%+100%";
    gpu-api = "vulkan";
    gpu-context = "auto";
    hwdec = "auto";
    keep-open = "yes";
    keepaspect-window = false;
    ontop = "yes";
    osc = "no";
    osd-bar = "no";
    profile = "fast";
    spirv-compiler = "auto";
    title = "mpv - \${filename}";
    video-sync = "display-resample";
    vo = "gpu-next";
    ytdl-format = "bestvideo[height<=1080][vcodec^=vp9]+bestaudio/best";
  };

  home.shellAliases = {
    play = "${opengl} mpv";
  };

  xdg.desktopEntries = lib.mkIf useOpengl {
    mpv = {
      name = "MPV player";
      type = "Application";
      icon = "mpv";
      exec = "${opengl} mpv --player-operation-mode=pseudo-gui -- %U";
      comment = "Play movies and songs";
      terminal = false;
      settings.Keywords = "limiter;compressor;reverberation;equalizer;autovolume;";
      categories = [
        "AudioVideo"
        "Audio"
      ];
    };
  };
}
