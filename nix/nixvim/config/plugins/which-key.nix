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
      __unkeyed-1 = "<C-w>";
      mode = "n";
    }
    {
      __unkeyed-1 = "[";
      mode = "n";
    }
    {
      __unkeyed-1 = "]";
      mode = "n";
    }
    {
      __unkeyed-1 = "g";
      mode = "n";
    }
    {
      __unkeyed-1 = "f";
      mode = "n";
    }
    {
      __unkeyed-1 = "z";
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
      group = "telescope";
      proxy = "f";
    }
    {
      __unkeyed-1 = "<leader>fg";
      group = "git";
      proxy = "fg";
    }
    {
      __unkeyed-1 = "<leader>fG";
      group = "github";
      proxy = "fG";
    }
    {
      __unkeyed-1 = "<leader>g";
      group = "git";
    }
    {
      __unkeyed-1 = "<leader>gt";
      group = "toggle";
    }
    {
      __unkeyed-1 = "<leader>n";
      group = "noice";
    }
    {
      __unkeyed-1 = "<leader>q";
      group = "quit";
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
      __unkeyed-1 = "f";
      group = "telescope";
    }
    {
      __unkeyed-1 = "fg";
      group = "git";
    }
    {
      __unkeyed-1 = "fG";
      group = "github";
    }
    {
      __unkeyed-1 = "z";
      group = "treesitter";
    }
  ];
}
