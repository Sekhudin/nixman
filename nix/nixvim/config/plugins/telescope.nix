{
  lib,
  config,
  helpers,
  ...
}:

let
  inherit (helpers) mkLuaFun;
  resize.up = mkLuaFun "vim.cmd [[ resize +1 ]] ";
in
lib.mkMerge [
  {
    # plugins.telescope.enable = true;
    # plugins.telescope.settings.defaults = { };
    # plugins.telescope.keymaps = {
    #   ff = {

    #   };
    # };
  }

  (lib.mkIf config.plugins.which-key.enable {
    plugins.which-key.settings.triggers = [
      {
        __unkeyed-1 = "f";
        mode = "n";
      }
    ];

    plugins.which-key.settings.spec = [
      {
        __unkeyed-1 = "fop";
        __unkeyed-2.__raw = resize.up;
        desc = "resize window up";
      }
    ];
  })
]
