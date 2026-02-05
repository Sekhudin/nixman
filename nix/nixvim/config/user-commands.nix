{ helper, ... }:

{
  userCommands = {
    LspInlay = {
      desc = "Toggle inlay hints";
      command.__raw = helper.mkLuaFun ''
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      '';
    };
  };
}
