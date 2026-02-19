{
  pkgs,
  icons,
  helper,
  ...
}:

{
  globals = {
    db_ui_debug = 0;
    db_ui_show_help = 0;
    db_ui_use_nerd_fonts = 1;
    db_ui_execute_on_save = 0;
    db_ui_show_database_icon = 0;
    db_ui_use_nvim_notify = 1;
    db_ui_win_position = "right";
    db_ui_disable_mappings = 0;
    db_ui_disable_mappings_dbui = 0;
    db_ui_disable_mappings_dbout = 1;
    db_ui_disable_mappings_sql = 1;
    db_ui_disable_mappings_javascript = 1;
    db_ui_disable_info_notifications = 1;
    db_ui_icons = {
      saved_query = icons.file_code;
      tables = icons.table_multiple;
      collapsed = {
        db = icons.withCollapsedIcon "database";
        buffers = icons.withCollapsedIcon "folder_close";
        saved_queries = icons.withCollapsedIcon "folder_close";
        schemas = icons.withCollapsedIcon "list_group";
        schema = icons.withCollapsedIcon "file_tree";
        tables = icons.withCollapsedIcon "table_multiple";
        table = icons.withCollapsedIcon "table";
      };
      expanded = {
        db = icons.withExpandedIcon "database";
        buffers = icons.withExpandedIcon "folder_open";
        saved_queries = icons.withExpandedIcon "folder_open";
        schemas = icons.withExpandedIcon "list_group";
        schema = icons.withExpandedIcon "file_tree";
        tables = icons.withExpandedIcon "table_multiple";
        table = icons.withExpandedIcon "table";
      };
    };
  };

  extraPackages = with pkgs; [
    postgresql
  ];

  plugins.vim-dadbod.enable = true;
  plugins.vim-dadbod-ui.enable = true;
  plugins.vim-dadbod-completion.enable = true;

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>du";
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
      __unkeyed-1 = "<leader>dr";
      __unkeyed-2 = "<Plug>(DBUI_ToggleResultLayout)";
      desc = "Toggle result";
    }
    {
      __unkeyed-1 = "<leader>de";
      __unkeyed-2 = "<Plug>(DBUI_ExecuteQuery)";
      desc = "Execute query";
      mode = [ "v" ];
      cond = helper.filetypeMatches [ "sql" ];
    }
    {
      __unkeyed-1 = "<M-x>";
      __unkeyed-2 = "<Plug>(DBUI_ExecuteQuery)";
      desc = "Execute query";
      mode = [ "v" ];
      cond = helper.filetypeMatches [ "sql" ];
    }
  ];
}
