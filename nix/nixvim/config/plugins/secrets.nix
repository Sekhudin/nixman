{ ... }:

{
  extraConfigLuaPost = "require('nvim_sops').setup()";
  plugins.lz-n.plugins = [
    {
      __unkeyed-1 = "nvim-sops";
      cmd = [
        "SopsDecrypt"
        "SopsEncrypt"
      ];
    }
  ];

  autoCmd = [
    {
      event = [
        "InsertLeave"
      ];
      command = "silent update";
      pattern = [
        "*.sops.env"
        "*.sops.json"
        "*.sops.norg"
        "*.sops.yaml"
        ".env"
        ".env*"
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
