{ inputs, ... }:

let
  inherit (inputs.services-flake.lib) multiService;
  username = "root";
  password = "root";
in
{
  perSystem =
    { pkgs, user, ... }:

    {
      process-compose.root = {
        imports = [
          inputs.services-flake.processComposeModules.default
          (multiService ./services/mailpit.nix)
        ];

        services.postgres.root-postgres.enable = true;
        services.postgres.root-postgres = {
          port = 5432;
          listen_addresses = "127.0.0.1";
          superuser = "${user.username}";
          dataDir = "${user.processComposeDirectory}/root-postgres";
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
          settings.hba_file = "${pkgs.writeText "pg_hba.conf" ''
            # TYPE  DATABASE         USER            ADDRESS                 METHOD

            # active
            local   all              ${user.username}                                 trust
            host    all              ${user.username}         127.0.0.1/32            trust
            host    all              ${user.username}         ::1/128                 trust
            local   replication      ${user.username}                                 trust
            host    replication      ${user.username}         127.0.0.1/32            trust
            host    replication      ${user.username}         ::1/128                 trust

            # current-user
            local   all              ${username}                                 scram-sha-256
            host    all              ${username}         127.0.0.1/32            scram-sha-256
            host    all              ${username}         ::1/128                 scram-sha-256
            local   replication      ${username}                                 scram-sha-256 
            host    replication      ${username}         127.0.0.1/32            scram-sha-256 
            host    replication      ${username}         ::1/128                 scram-sha-256 
          ''}";
        };

        services.mailpit.root-mailpit.enable = true;
        services.mailpit.root-mailpit.settings.env = {
          MP_UI_AUTH = "${username}:${password}";
          MP_SMTP_AUTH = "${username}:${password}";
          MP_SMTP_AUTH_ALLOW_INSECURE = "true";
        };
      };
    };
}
