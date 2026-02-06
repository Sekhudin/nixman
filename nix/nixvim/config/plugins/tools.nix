{ icons, ... }:

{
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
  plugins.nvim-autopairs.settings = { };

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

  plugins.trouble.enable = true;
  plugins.trouble.lazyLoad.settings.cmd = [ "Trouble" ];
  plugins.trouble.settings = { };

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
  ];
}
