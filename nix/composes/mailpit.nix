{ inputs, ... }:

let
  inherit (inputs.services-flake.lib) multiService;
in
{
  perSystem =
    { ... }:
    {
      process-compose.mailpit = {
        imports = [ (multiService ./services/mailpit.nix) ];

        services.mailpit.me.enable = true;
        services.mailpit.me.settings = {
          smtp_port = 1024;
          web_ui_port = 8024;
          env = {
            MP_UI_AUTH = "mp_me:mp_me";
            MP_SMTP_AUTH = "smptp_me:smptp_me";
            MP_SMTP_AUTH_ALLOW_INSECURE = "true";
          };
        };
      };
    };
}
