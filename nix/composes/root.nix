{ inputs, ... }:

let
  inherit (inputs.services-flake.lib) multiService;
  superuser = (builtins.getEnv "USER");
  username = "root";
  password = "root";
in
{
  perSystem =
    { pkgs, ... }:

    {
      process-compose.root = {
        imports = [
          inputs.services-flake.processComposeModules.default
          (multiService ./services/mailpit.nix)
        ];

        services.postgres.pg-root.enable = true;
        services.postgres.pg-root = {
          port = 5432;
          listen_addresses = "127.0.0.1";
          superuser = "${superuser}";
          createDatabase = false;
          initialScript = {
            before = ''
              SET password_encryption = 'scram-sha-256';

              CREATE USER ${username} WITH
                  LOGIN 
                  CREATEDB 
                  CREATEROLE 
                  REPLICATION
                  PASSWORD '${password}';
            '';
          };
          settings.hba_file = (
            "${pkgs.writeText "pg_hba.conf" ''
              # TYPE  DATABASE         USER            ADDRESS                 METHOD

              # active
              local   all              ${superuser}                                 trust
              host    all              ${superuser}         127.0.0.1/32            trust
              host    all              ${superuser}         ::1/128                 trust
              local   replication      ${superuser}                                 trust
              host    replication      ${superuser}         127.0.0.1/32            trust
              host    replication      ${superuser}         ::1/128                 trust

              # current-user
              local   all              ${username}                                 scram-sha-256
              host    all              ${username}         127.0.0.1/32            scram-sha-256
              host    all              ${username}         ::1/128                 scram-sha-256
              local   replication      ${username}                                 scram-sha-256 
              host    replication      ${username}         127.0.0.1/32            scram-sha-256 
              host    replication      ${username}         ::1/128                 scram-sha-256 
            ''}"
          );
        };

        services.mailpit.mp-root.enable = true;
        services.mailpit.mp-root.settings.env = {
          MP_UI_AUTH = "${username}:${password}";
          MP_SMTP_AUTH = "${username}:${password}";
          MP_SMTP_AUTH_ALLOW_INSECURE = "true";
        };
      };
    };
}
