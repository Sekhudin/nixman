{ inputs, ... }:

{
  perSystem =
    { ... }:

    {
      process-compose.ai = {
        imports = [ inputs.services-flake.processComposeModules.default ];

        services.ollama.ai_ollama.enable = true;
        services.ollama.ai_ollama = {
          models = [ "deepseek-coder:1.3b" ];
          environment = {
            OLLAMA_HOST = "http://127.0.0.1:11434";
            OLLAMA_DEBUG = "0";
          };
        };

        services.open-webui.ai_webui.enable = true;
        services.open-webui.ai_webui = {
          environment = {
            OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
            WEBUI_AUTH = "False";
          };
        };

        settings.processes = {
          ai_webui = {
            depends_on.ai_ollama-models.condition = "process_completed_successfully";
          };
        };
      };
    };
}
