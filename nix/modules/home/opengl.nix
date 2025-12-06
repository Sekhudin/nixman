{
  lib,
  pkgs,
  config,
  ...
}:

let
  cfg = config.programs.opengl;
in
{
  options.programs.opengl = {
    use = lib.mkOption {
      default = "default";
      type = lib.types.enum [
        "default"
        "nixGLMesa"
        "nixGLIntel"
      ];
      description = "Select opengl provider.";
    };
  };

  config = lib.mkIf (cfg.use != "default") {
    home.packages = [ pkgs.nixgl.${cfg.use} ];
  };
}
