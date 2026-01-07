{ ... }:

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
      __unkeyed-1 = "<leader>g";
      group = "lazygit";
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
      __unkeyed-1 = "[";
      group = "jump to";
    }
    {
      __unkeyed-1 = "]";
      group = "jump to";
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
      __unkeyed-1 = "z";
      group = "treesitter";
    }
  ];
}
