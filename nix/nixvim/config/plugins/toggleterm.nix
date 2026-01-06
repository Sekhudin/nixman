{ icons, ... }:

{
  plugins.toggleterm.enable = true;
  plugins.toggleterm.settings = {
    open_mapping = "[[<c-\\>]]";
    direction = "horizontal";
    size = 15;
    start_in_insert = true;
    insert_mappings = true;
    terminal_mappings = true;
    shade_terminals = true;
    persist_size = true;
    close_on_exit = true;
    auto_scroll = true;
    hide_numbers = true;
    float_opts = {
      border = "curved";
    };
  };

  plugins.which-key.settings.triggers = [
    {
      __unkeyed-1 = "<leader>t";
      mode = "n";
    }
  ];

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>tt";
      __unkeyed-2 = "<cmd>ToggleTerm<cr>";
      desc = "Toggle Terminal";
      icon = icons.terminal_dev;
    }
    {
      __unkeyed-1 = "<leader>tn";
      __unkeyed-2 = "<cmd>TermNew<cr>";
      desc = "Terminal New";
      icon = icons.terminal_dev;
    }
    {
      __unkeyed-1 = "<leader>tf";
      __unkeyed-2 = "<cmd>TermNew direction=float<cr>";
      desc = "Floating Terminal";
      icon = icons.terminal_dev;
    }
  ];
}
