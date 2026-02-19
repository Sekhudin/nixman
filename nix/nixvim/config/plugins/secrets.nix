{ pkgs, ... }:

{
  extraConfigLuaPost = "require('nvim_sops').setup()";
  extraPlugins = with pkgs.vimPlugins; [
    nvim-sops
  ];

  plugins.lz-n.plugins = [
    {
      __unkeyed-1 = "nvim-sops";
      cmd = [
        "SopsDecrypt"
        "SopsEncrypt"
      ];
    }
  ];

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>se";
      __unkeyed-2 = "<cmd>SopsEncrypt<cr>";
      desc = "[S]ops [E]ncrypt";
    }
    {
      __unkeyed-1 = "<leader>sd";
      __unkeyed-2 = "<cmd>SopsDecrypt<cr>";
      desc = "[S]ops [D]ecrypt";
    }
  ];
}
