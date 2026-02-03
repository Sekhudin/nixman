{ inputs, ... }:

{
  perSystem =
    { user, ... }:

    {
      process-compose.postgres = {
        imports = [ inputs.services-flake.processComposeModules.default ];

        services.postgres.postgres.enable = true;
        services.postgres.postgres = {
          dataDir = "${user.processComposeDirectory}/postgres";
          port = 5432;
          listen_addresses = "127.0.0.1";
          superuser = "${user.username}";
          createDatabase = false;
        };
      };
    };
}
