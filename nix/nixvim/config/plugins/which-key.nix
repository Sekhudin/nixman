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
      __unkeyed-1 = "<c-w>";
      mode = "n";
    }
  ];

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>nn";
      __unkeyed-2 = "<cmd>new<cr>";
      desc = "New Buffer Horizotal";
      icon = icons.plus;
    }
    {
      __unkeyed-1 = "<leader>ns";
      __unkeyed-2 = "<cmd>vnew<cr>";
      desc = "New Buffer Vertical";
      icon = icons.plus;
    }
  ];
}
