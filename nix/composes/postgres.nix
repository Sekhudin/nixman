{ inputs, ... }:

{
  imports = [ inputs.process-compose-flake.flakeModule ];

  perSystem =
    { ... }:
    {
      process-compose.postgres = {
        imports = [ inputs.services-flake.processComposeModules.default ];

        services.postgres.me = {
          enable = true;
          initialScript.before = ''
            CREATE USER me WITH password 'postgres';
          '';
        };
      };
    };
}
