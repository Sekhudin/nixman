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
      __unkeyed-1 = "<leader>ee";
      __unkeyed-2 = "<cmd>SopsEncrypt<cr>";
      desc = "Sops Encrypt";
    }
    {
      __unkeyed-1 = "<leader>ed";
      __unkeyed-2 = "<cmd>SopsDecrypt<cr>";
      desc = "Sops Decrypt";
    }
  ];
}
