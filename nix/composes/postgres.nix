{ inputs, ... }:

{
  imports = [ inputs.process-compose-flake.flakeModule ];

  perSystem =
    { pkgs, ... }:
    {
      process-compose.postgres = {
        imports = [ inputs.services-flake.processComposeModules.default ];

        services.postgres.me = {
          enable = true;
          initialScript.before = ''
            CREATE USER postgres WITH password 'postgres';
            CREATE DATABASE example_db;
          '';
        };

        services.pgadmin.adme = {
          enable = true;
          initialEmail = "email@gmail.com";
          initialPassword = "password";
        };
      };
    };
}
