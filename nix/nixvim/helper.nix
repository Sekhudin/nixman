{ inputs }:

inputs.nixvim.lib.nixvim
// {
  mkLuaFun = lua: ''
    function()
      ${lua}
    end
  '';

  mkLuaNamedFun = name: lua: ''
    function ${name}()
      ${lua}
    end
  '';

  buftypeMatches = bufs: ''
    function()
      for _, v in ipairs({${builtins.concatStringsSep ", " (builtins.map (b: "\"${b}\"") bufs)}}) do
        if vim.bo.buftype == v then
          return true
        end
      end
      return false
    end
  '';

  filetypeMatches = files: ''
    function()
      for _, v in ipairs({${builtins.concatStringsSep ", " (builtins.map (b: "\"${b}\"") files)}}) do
        if vim.bo.filetype == v then
          return true
        end
      end
      return false
    end
  '';
}
