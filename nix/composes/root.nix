{ inputs, ... }:

let
  inherit (inputs.services-flake.lib) multiService;
  user = "root";
  pass = "root";
in
{
  perSystem =
    { ... }:
    {
      process-compose.root = {
        imports = [
          inputs.services-flake.processComposeModules.default
          (multiService ./services/mailpit.nix)
        ];

        services.postgres.pg_root.enable = true;
        services.postgres.pg_root = {
          initialScript.before = ''
            CREATE USER root WITH SUPERUSER PASSWORD 'root';
          '';
        };

        services.mailpit.mp_root.enable = true;
        services.mailpit.mp_root.settings.env = {
          MP_UI_AUTH = "${user}:${pass}";
          MP_SMTP_AUTH = "${user}:${pass}";
          MP_SMTP_AUTH_ALLOW_INSECURE = "true";
        };
      };
    };
}
