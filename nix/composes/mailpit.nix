{ inputs, ... }:

let
  inherit (inputs.services-flake.lib) multiService;
in
{
  perSystem =
    { user, ... }:

    {
      process-compose.mailpit = {
        imports = [ (multiService ./services/mailpit.nix) ];

        services.mailpit.mailpit.enable = true;
        services.mailpit.mailpit.settings = {
          smtp_port = 1024;
          web_ui_port = 8024;
          env = {
            MP_UI_AUTH = "${user.username}:root";
            MP_SMTP_AUTH = "${user.username}:root";
            MP_SMTP_AUTH_ALLOW_INSECURE = "true";
          };
        };
      };
    };
}
