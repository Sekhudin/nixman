{ inputs, ... }:

let
  inherit (inputs.services-flake.lib) multiService;
  user = "root";
  pass = "root";
in
{
  perSystem =
    { pkgs, ... }:

    let
      sudo = (builtins.getEnv "USER");
    in
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
          superuser = "${sudo}";
          createDatabase = false;
          initialScript = {
            before = ''
              SET password_encryption = 'scram-sha-256';

              CREATE USER ${user} WITH
                  LOGIN 
                  CREATEDB 
                  CREATEROLE 
                  REPLICATION
                  PASSWORD '${pass}';
            '';
          };
          settings.hba_file = (
            "${pkgs.writeText "pg_hba.conf" ''
              # TYPE  DATABASE         USER            ADDRESS                 METHOD

              # active
              local   all              ${sudo}                                 trust
              host    all              ${sudo}         127.0.0.1/32            trust
              host    all              ${sudo}         ::1/128                 trust
              local   replication      ${sudo}                                 trust
              host    replication      ${sudo}         127.0.0.1/32            trust
              host    replication      ${sudo}         ::1/128                 trust

              # current-user
              local   all              ${user}                                 scram-sha-256
              host    all              ${user}         127.0.0.1/32            scram-sha-256
              host    all              ${user}         ::1/128                 scram-sha-256
              local   replication      ${user}                                 scram-sha-256 
              host    replication      ${user}         127.0.0.1/32            scram-sha-256 
              host    replication      ${user}         ::1/128                 scram-sha-256 
            ''}"
          );
        };

        services.mailpit.mp-root.enable = true;
        services.mailpit.mp-root.settings.env = {
          MP_UI_AUTH = "${user}:${pass}";
          MP_SMTP_AUTH = "${user}:${pass}";
          MP_SMTP_AUTH_ALLOW_INSECURE = "true";
        };
      };
    };
}
