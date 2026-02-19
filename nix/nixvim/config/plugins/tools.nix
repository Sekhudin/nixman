{ pkgs, icons, ... }:

{
  extraPlugins = with pkgs.vimPlugins; [
    neorepl-nvim
  ];

  plugins.lz-n.plugins = [
    {
      __unkeyed-1 = pkgs.vimPlugins.neorepl-nvim.name;
      cmd = [ "Repl" ];
    }
  ];

  plugins.comment.enable = true;
  plugins.comment.lazyLoad.settings.event = [
    "BufReadPost"
    "BufNewFile"
  ];
  plugins.comment.settings = { };

  plugins.image.enable = true;
  plugins.image.settings = { };

  plugins.markdown-preview.enable = true;
  plugins.markdown-preview.settings = {
    auto_start = 0;
    theme = "dark";
    port = "8686";
  };

  plugins.nvim-autopairs.enable = true;
  plugins.nvim-autopairs.lazyLoad.settings.event = [ "InsertEnter" ];
  plugins.nvim-autopairs.settings = {
    fast_wrap.map = "<M-e>";
    disable_filetype = [
      "alpha"
      "dashboard"
      "dbui"
      "dbout"
      "help"
      "lazy"
      "mason"
      "neo-tree"
      "neo-tree-popup"
      "noice"
      "notify"
      "spectre_panel"
      "sql"
      "qf"
      "toggleterm"
      "Outline"
      "TelescopePrompt"
      "TelescopeResults"
      "Trouble"
    ];
  };

  plugins.nvim-ufo.enable = true;
  plugins.nvim-ufo.lazyLoad.settings.event = [ "BufEnter" ];
  plugins.nvim-ufo.settings.provider_selector = ''
    function(bufnr, filetype, buftype)
      if buftype == "nofile" or buftype == "prompt" then
        return ""
      end

      local exclude = {
        "alpha",
        "dashboard",
        "dbui",
        "dbout",
        "help",
        "lazy",
        "mason",
        "neo-tree",
        "neo-tree-popup",
        "noice",
        "notify",
        "spectre_panel",
        "sql",
        "qf",
        "toggleterm",
        "Outline",
        "TelescopePrompt",
        "TelescopeResults",
        "Trouble",
      }
      if vim.tbl_contains(exclude, filetype) then
        return ""
      end
      return { "treesitter", "indent" }
    end
  '';

  plugins.spectre.enable = true;
  plugins.spectre.lazyLoad.settings.cmd = [ "Spectre" ];
  plugins.spectre.settings = {
    live_update = true;
    mapping = {
      "tab" = {
        map = "<Tab>";
        cmd = "<cmd>lua require('spectre').tab()<cr>";
        desc = "next query";
      };
      "shift-tab" = {
        map = "<S-Tab>";
        cmd = "<cmd>lua require('spectre').tab_shift()<cr>";
        desc = "previous query";
      };
      enter_file = {
        map = "<cr>";
        cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>";
        desc = "open file";
      };
      show_option_menu = {
        map = "<leader>so";
        cmd = "<cmd>lua require('spectre').show_options()<CR>";
        desc = "show options";
      };
      resume_last_search = {
        map = "<leader>sl";
        cmd = "<cmd>lua require('spectre').resume_last_search()<CR>";
        desc = "repeat last search";
      };
      run_current_replace = {
        map = "<leader>sr";
        cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>";
        desc = "replace current line";
      };
      run_replace = {
        map = "<leader>sR";
        cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>";
        desc = "replace all";
      };
      replace_cmd = {
        map = "<leader>sc";
        cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>";
        desc = "input replace command";
      };
      send_to_qf = {
        map = "<leader>sq";
        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>";
        desc = "send all items to quickfix";
      };
      change_view_mode = {
        map = "<leader>sv";
        cmd = "<cmd>lua require('spectre').change_view()<CR>";
        desc = "change result view mode";
      };
      toggle_line = {
        map = "<leader>sp";
        cmd = "<cmd>lua require('spectre').toggle_line()<CR>";
        desc = "toggle item";
      };
      toggle_live_update = {
        map = "<leader>su";
        cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>";
        desc = "update when vim writes to file";
      };
      toggle_ignore_case = {
        map = "<leader>si";
        cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>";
        desc = "toggle ignore case";
      };
      toggle_ignore_hidden = {
        map = "<leader>sh";
        cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>";
        desc = "toggle search hidden";
      };
    };
  };

  plugins.trouble.enable = true;
  plugins.trouble.lazyLoad.settings.cmd = [ "Trouble" ];
  plugins.trouble.settings = { };

  plugins.ts-autotag.enable = true;
  plugins.ts-autotag.lazyLoad.settings.event = [ "InsertEnter" ];
  plugins.ts-autotag.settings = {
    opts = {
      enable_close = true;
      enable_close_on_slash = true;
      enable_rename = true;
    };
    aliases = {
      astro = "html";
      blade = "html";
      eruby = "html";
      handlebars = "glimmer";
      hbs = "glimmer";
      htmldjango = "html";
      javascript = "typescriptreact";
      "javascript.jsx" = "typescriptreact";
      javascriptreact = "typescriptreact";
      markdown = "html";
      php = "html";
      rescript = "typescriptreact";
      rust = "rust";
      twig = "html";
      typescript = "typescriptreact";
      "typescript.tsx" = "typescriptreact";
      vue = "html";
    };
  };

  plugins.wtf.enable = true;
  plugins.wtf.settings = { };

  plugins.zen-mode.enable = true;
  plugins.zen-mode.lazyLoad.settings.cmd = [ "ZenMode" ];
  plugins.zen-mode.settings = { };

  ###############################
  # which-key spec
  ###############################
  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>xx";
      __unkeyed-2 = "<cmd>Trouble<cr>";
      desc = "Diagnostics";
    }
    {
      __unkeyed-1 = "<leader>xt";
      __unkeyed-2 = "<cmd>Trouble diagnostics toggle<cr>";
      desc = "Diagnostics toggle";
    }
    {
      __unkeyed-1 = "<leader>xw";
      __unkeyed-2 = "<cmd>Trouble workspace_diagnostics toggle<cr>";
      desc = "Workspace Diagnostics";
    }
    {
      __unkeyed-1 = "<leader>xs";
      __unkeyed-2 = ''<cmd>lua require("wtf").search()<cr>'';
      desc = "Search Diagnostic (web)";
    }
    {
      __unkeyed-1 = "[e";
      __unkeyed-2 = "<cmd>Lspsaga diagnostic_jump_prev<cr>";
      desc = "Previous Diagnostic";
    }
    {
      __unkeyed-1 = "]e";
      __unkeyed-2 = "<cmd>Lspsaga diagnostic_jump_next<cr>";
      desc = "Next Diagnostic";
    }
    {
      __unkeyed-1 = "<leader>mr";
      __unkeyed-2 = "<cmd>Repl<cr>";
      desc = "Open REPL";
    }
    {
      __unkeyed-1 = "<leader>mm";
      __unkeyed-2 = "<cmd>MarkdownPreviewToggle<cr>";
      icon = icons.markdown;
      desc = "Markdown preview";
    }
    {
      __unkeyed-1 = "<leader>mz";
      __unkeyed-2 = "<cmd>ZenMode<cr>";
      icon = icons.philosopher;
      desc = "Cultivation mode";
    }
    {
      __unkeyed-1 = "<leader>st";
      __unkeyed-2 = "<cmd>Spectre<cr>";
      desc = "Spectre";
    }
  ];
}
