{
  pkgs,
  lib,
  config,
  icons,
  ...
}:

{
  extraPlugins = with pkgs.vimPlugins; [
    telescope-github-nvim
  ];

  plugins.telescope.enable = true;
  plugins.telescope.lazyLoad.settings.cmd = [ "Telescope" ];
  plugins.telescope.lazyLoad.settings.keys = lib.attrNames config.plugins.telescope.keymaps;
  plugins.telescope.enabledExtensions = [ "gh" ];
  plugins.telescope.settings.default = {
    file_ignore_patterns = [
      "%.ipynb"
      "%.lock"
      "%.log"
      "^.cache/"
      "^.devenv/"
      "^.direnv/"
      "^.git/"
      "^.mypy_cache/"
      "^.next/"
      "^.nuxt/"
      "^.pytest_cache/"
      "^.ruff_cache/"
      "^.svelte-kit/"
      "^.venv/"
      "^__pycache__/"
      "^build/"
      "^data/"
      "^dist/"
      "^node_modules/"
      "^out/"
      "^output/"
      "^result/"
      "^target/"
      "^vendor/"
      "^venv/"
    ];

  };
  plugins.telescope.keymaps = {
    "<leader>ff" = {
      action = "find_files";
      options.desc = "Find files";
    };
    "<leader>fw" = {
      action = "live_grep";
      options.desc = "Find word";
    };
    "<leader>fW" = {
      action = "grep_string";
      options.desc = "Find word under cursor";
    };
    "<leader>fb" = {
      action = "buffers";
      options.desc = "Find buffers";
    };
    "<leader>fB" = {
      action = "current_buffer_fuzzy_find";
      options.desc = "Fuzzy find in buffer";
    };
    "<leader>fh" = {
      action = "help_tags";
      options.desc = "Find help";
    };
    "<leader>fH" = {
      action = "highlights";
      options.desc = "Find highlights";
    };
    "<leader>fc" = {
      action = "colorscheme";
      options.desc = "Find colorscheme";
    };
    "<leader>fgc" = {
      action = "git_commits";
      options.desc = "Git commits";
    };

    "<leader>fgC" = {
      action = "git_bcommits";
      options.desc = "Buffer git commits";
    };

    "<leader>fgr" = {
      action = "git_bcommits_range";
      options.desc = "Buffer git commits (range)";
    };

    "<leader>fgb" = {
      action = "git_branches";
      options.desc = "Git branches";
    };

    "<leader>fgs" = {
      action = "git_status";
      options.desc = "Git status";
    };

    "<leader>fgS" = {
      action = "git_stash";
      options.desc = "Git stash";
    };

    "<leader>fGi" = {
      action = "gh issues";
      options.desc = "Github issues";
    };

    "<leader>fGp" = {
      action = "gh pull_requests";
      options.desc = "Github PRs";
    };

    "<leader>fGr" = {
      action = "gh run";
      options.desc = "Github actions (run)";
    };

    "<leader>fGg" = {
      action = "gh gist";
      options.desc = "Github gist";
    };
  };

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>ft";
      __unkeyed-2 = "<cmd>Telescope<cr>";
      desc = "Open telescope";
      icon = icons.telescope;
    }
    {
      __unkeyed-1 = "<leader>flr";
      __unkeyed-2 = "<cmd>lua require('telescope.builtin').lsp_references()<cr>";
      desc = "[Find][LSP] References";
    }
    {
      __unkeyed-1 = "<leader>fld";
      __unkeyed-2 = "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>";
      desc = "[Find][LSP] Definitions";
    }
    {
      __unkeyed-1 = "<leader>fli";
      __unkeyed-2 = "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>";
      desc = "[Find][LSP] Implementations";
    }
    {
      __unkeyed-1 = "<leader>flt";
      __unkeyed-2 = "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>";
      desc = "[Find][LSP] Type Definitions";
    }
    {
      __unkeyed-1 = "<leader>fls";
      __unkeyed-2 = "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>";
      desc = "[Find][LSP] Document Symbols";
    }
    {
      __unkeyed-1 = "<leader>flw";
      __unkeyed-2 = "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>";
      desc = "[Find][LSP] Workspace Symbols";
    }
    {
      __unkeyed-1 = "<leader>flD";
      __unkeyed-2 = "<cmd>lua require('telescope.builtin').diagnostics()<cr>";
      desc = "[Find][LSP] Diagnostics";
    }
  ];
}
