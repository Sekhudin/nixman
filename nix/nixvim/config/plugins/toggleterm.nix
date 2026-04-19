{ color, icons, ... }:

{
  plugins.toggleterm.enable = true;
  plugins.toggleterm.lazyLoad.settings.cmd = [
    "ToggleTermToggleAll"
    "ToggleTerm"
    "TermNew"
    "TermExec"
  ];
  plugins.toggleterm.settings = {
    open_mapping = "[[<c-\\>]]";
    direction = "horizontal";
    size = 15;
    start_in_insert = false;
    insert_mappings = true;
    terminal_mappings = true;
    shade_terminals = true;
    persist_size = true;
    close_on_exit = true;
    auto_scroll = true;
    hide_numbers = true;
    highlights = {
      Normal = {
        guibg = color.scheme.base00;
      };
      FloatBorder = {
        guibg = color.scheme.base00;
        guifg = color.scheme.base08;
      };
    };
    float_opts = {
      border = "curved";
    };
  };

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<c-\\>";
      __unkeyed-2 = "<cmd>ToggleTerm<cr>";
      desc = "toggle terminal";
      icon = icons.terminal_dev;
    }
    {
      __unkeyed-1 = "<leader>tt";
      __unkeyed-2 = "<cmd>ToggleTermToggleAll<cr>";
      desc = "toggle terminals";
      icon = icons.terminal_dev;
    }
    {
      __unkeyed-1 = "<leader>tn";
      __unkeyed-2 = "<cmd>TermNew<cr>";
      desc = "new horizontal-term";
      icon = icons.terminal_dev;
    }
    {
      __unkeyed-1 = "<leader>td";
      __unkeyed-2 = "<cmd>lua require('mini.bufremove').wipeout()<cr>";
      desc = "terminal delete";
      icon = icons.terminal_dev;
    }
    {
      __unkeyed-1 = "<leader>tp";
      __unkeyed-2 = "<cmd>TermSelect<cr>";
      desc = "terminal pick";
      icon = icons.terminal_dev;
    }
    {
      __unkeyed-1 = "<leader>tsl";
      __unkeyed-2 = "<cmd>ToggleTermSendCurrentLine<cr>";
      desc = "terminal send line";
      icon = icons.terminal_dev;
    }
    {
      __unkeyed-1 = "<leader>tsv";
      __unkeyed-2 = "<cmd>ToggleTermSendVisualSelection<cr>";
      desc = "terminal send selection";
      icon = icons.terminal_dev;
    }
    {
      __unkeyed-1 = "<leader>tf";
      __unkeyed-2 = "<cmd>TermNew direction=float<cr>";
      desc = "new float-term";
      icon = icons.terminal_dev;
    }
    {
      __unkeyed-1 = "<leader>tv";
      __unkeyed-2 = "<cmd>TermNew direction=vertical size=45<cr>";
      desc = "new vertical-term";
      icon = icons.terminal_dev;
    }
    {
      __unkeyed-1 = "<leader>tb";
      __unkeyed-2 = "<cmd>TermNew direction=tab<cr>";
      desc = "new tab-term";
      icon = icons.terminal_dev;
    }
  ];
}
