{ icons, ... }:

{
  plugins.which-key.enable = true;
  plugins.which-key.settings.delay = 0;
  plugins.which-key.settings.expand = 1;
  plugins.which-key.settings.notify = false;
  plugins.which-key.settings.preset = true;
  plugins.which-key.settings.win = {
    border = "single";
  };

  plugins.which-key.settings.triggers = [
    {
      __unkeyed-1 = "<leader>";
      mode = "n";
    }
    {
      __unkeyed-1 = "g";
      mode = "n";
    }
  ];

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>b";
      group = "buffer";
    }
    {
      __unkeyed-1 = "<leader>f";
      group = "find";
    }
    {
      __unkeyed-1 = "<leader>fg";
      group = "git";
    }
    {
      __unkeyed-1 = "<leader>fG";
      group = "github";
    }
    {
      __unkeyed-1 = "<leader>fl";
      group = "LSP";
    }
    {
      __unkeyed-1 = "<leader>g";
      group = "git";
    }
    {
      __unkeyed-1 = "<leader>gt";
      group = "gitsign";
    }
    {
      __unkeyed-1 = "<leader>l";
      group = "lsp";
    }
    {
      __unkeyed-1 = "<leader>n";
      group = "ui";
    }
    {
      __unkeyed-1 = "<leader>q";
      group = "quit";
      icon = icons.cross;
    }
    {
      __unkeyed-1 = "<leader>qq";
      __unkeyed-2 = "<cmd>qa!<cr>";
      desc = "Quit all";
      icon = icons.cross;
    }
    {
      __unkeyed-1 = "<leader>qw";
      __unkeyed-2 = "<cmd>wqa<cr>";
      desc = "Save & quit all";
      icon = icons.cross;
    }
    {
      __unkeyed-1 = "<leader>t";
      group = "terminal";
    }
    {
      __unkeyed-1 = "<leader>w";
      group = "window";
      proxy = "<c-w>";
    }
    {
      __unkeyed-1 = "<leader>x";
      group = "diagnotics";
    }
    {
      __unkeyed-1 = "[";
      group = "backward";
    }
    {
      __unkeyed-1 = "]";
      group = "forward";
    }
    {
      __unkeyed-1 = "g";
      group = "goto";
    }
    {
      __unkeyed-1 = "s";
      group = "seek";
    }
    {
      __unkeyed-1 = "z";
      group = "fold";
    }
  ];
}
