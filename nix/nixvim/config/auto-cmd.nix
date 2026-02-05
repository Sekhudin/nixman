{ helper, ... }:

{
  autoCmd = [
    {
      event = [ "LspAttach" ];
      callback.__raw = helper.mkLuaFun ''
        local bufnr = vim.api.nvim_get_current_buf()
        local clients = vim.lsp.get_clients({ bufnr = bufnr })

        local biome_active = false
        for _, client in ipairs(clients) do
          if client.name == "biome" then
            biome_active = true
            break
          end
        end

        if not biome_active then
          return
        end

        for _, client in ipairs(clients) do
          if client.name == "typescript-tools" or client.name == "jsonls" then
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          elseif client.name == "eslint" then
            client.stop()
          end
        end
      '';
    }
  ];
}
