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

  plugins.toggleterm.lazyLoad.settings = {
    cmd = [
      "ToggleTerm"
      "TermNew"
      "TermExec"
    ];
  };

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
    {
      __unkeyed-1 = "<leader>tg";
      __unkeyed-2 = "<cmd>TermExec direction=float cmd=lazygit<cr>";
      desc = "LazyGit Terminal";
      icon = icons.git;
    }
  ];
}
