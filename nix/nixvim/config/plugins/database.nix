{ ... }:

{
  globals = {
    db_ui_execute_on_save = 0;
    db_ui_use_nerd_fonts = 1;
    db_ui_show_database_icon = 1;
    db_ui_show_help = 0;
  };

  plugins.vim-dadbod.enable = true;
  plugins.vim-dadbod-ui.enable = true;
  plugins.vim-dadbod-completion.enable = true;

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>dt";
      __unkeyed-2 = "<cmd>DBUIToggle<cr>";
      desc = "DB toggle";
    }
    {
      __unkeyed-1 = "<leader>da";
      __unkeyed-2 = "<cmd>DBUIAddConnection<cr>";
      desc = "Add connection";
    }
    {
      __unkeyed-1 = "<leader>di";
      __unkeyed-2 = "<cmd>DBUILastQueryInfo<cr>";
      desc = "Lat query info";
    }
    {
      __unkeyed-1 = "<leader>ds";
      __unkeyed-2 = "<Plug>(DBUI_SaveQuery)";
      desc = "Save query";
    }
    {
      __unkeyed-1 = "<leader>de";
      __unkeyed-2 = "<Plug>(DBUI_ExecuteQuery)";
      desc = "Execute query";
      mode = [
        "n"
        "v"
      ];
    }
  ];
}
