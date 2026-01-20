{ color, icons, ... }:

{
  plugins.toggleterm.enable = true;
  plugins.toggleterm.lazyLoad.settings.cmd = [
    "ToggleTerm"
    "TermNew"
    "TermExec"
  ];
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
      __unkeyed-1 = "<leader>tt";
      __unkeyed-2 = "<cmd>ToggleTerm<cr>";
      desc = "Toggle terminal";
      icon = icons.terminal_dev;
    }
    {
      __unkeyed-1 = "<leader>tn";
      __unkeyed-2 = "<cmd>TermNew<cr>";
      desc = "Terminal new";
      icon = icons.terminal_dev;
    }
    {
      __unkeyed-1 = "<leader>ts";
      __unkeyed-2 = "<cmd>TermSelect<cr>";
      desc = "Terminal select";
      icon = icons.terminal_dev;
    }
    {
      __unkeyed-1 = "<leader>tf";
      __unkeyed-2 = "<cmd>TermNew direction=float<cr>";
      desc = "Floating terminal";
      icon = icons.terminal_dev;
    }
  ];
}
