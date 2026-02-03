{ inputs, ... }:

{
  perSystem =
    { user, ... }:

    {
      process-compose.ai = {
        imports = [ inputs.services-flake.processComposeModules.default ];

        services.ollama.ai-ollama.enable = true;
        services.ollama.ai-ollama = {
          host = "127.0.0.1";
          port = 11434;
          models = [ "deepseek-coder:1.3b" ];
          dataDir = "${user.processComposeDirectory}/ai-ollama";
          environment = {
            OLLAMA_DEBUG = "1";
          };
        };
      };
    };
}
