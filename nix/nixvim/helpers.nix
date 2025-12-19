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
}
