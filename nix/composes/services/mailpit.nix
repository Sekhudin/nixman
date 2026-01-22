{
  lib,
  pkgs,
  config,
  name,
  ...
}:

{
  options = {
    package = lib.mkPackageOption pkgs "mailpit" { };
    settings = lib.mkOption {
      type = lib.types.submodule {
        options = {
          smtp_port = lib.mkOption {
            type = lib.types.port;
            description = "SMTP port for mailpit instance";
            default = 1025;
          };
          web_ui_port = lib.mkOption {
            type = lib.types.port;
            description = "Web UI port for mailpit instance";
            default = 8025;
          };
          env = lib.mkOption {
            type = lib.types.attrsOf lib.types.str;
            description = "Environment for runtime options";
            example = {
              MP_MAX_MESSAGES = "500";
            };
            default = { };
          };
        };
      };
      default = { };
    };
  };

  config = {
    outputs.settings = {
      processes.${name} = {
        command = "${lib.getExe config.package} --listen 0.0.0.0:${toString config.settings.web_ui_port} --smtp 0.0.0.0:${toString config.settings.smtp_port}";
        environment = config.settings.env;
        availability.restart = "on_failure";
      };
    };
  };
}
