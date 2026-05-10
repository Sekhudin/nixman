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
      options.desc = "find files";
    };
    "<leader>fw" = {
      action = "live_grep";
      options.desc = "find word";
    };
    "<leader>fW" = {
      action = "grep_string";
      options.desc = "find word under cursor";
    };
    "<leader>fb" = {
      action = "buffers";
      options.desc = "find buffers";
    };
    "<leader>fB" = {
      action = "current_buffer_fuzzy_find";
      options.desc = "fuzzy find in buffer";
    };
    "<leader>fh" = {
      action = "help_tags";
      options.desc = "find help";
    };
    "<leader>fH" = {
      action = "highlights";
      options.desc = "find highlights";
    };
    "<leader>fc" = {
      action = "colorscheme";
      options.desc = "find colorscheme";
    };
    "<leader>fgc" = {
      action = "git_commits";
      options.desc = "git commits";
    };

    "<leader>fgC" = {
      action = "git_bcommits";
      options.desc = "buffer git commits";
    };

    "<leader>fgr" = {
      action = "git_bcommits_range";
      options.desc = "buffer git commits (range)";
    };

    "<leader>fgb" = {
      action = "git_branches";
      options.desc = "git branches";
    };

    "<leader>fgs" = {
      action = "git_status";
      options.desc = "git status";
    };

    "<leader>fgS" = {
      action = "git_stash";
      options.desc = "git stash";
    };

    "<leader>fGi" = {
      action = "gh issues";
      options.desc = "github issues";
    };

    "<leader>fGp" = {
      action = "gh pull_requests";
      options.desc = "github PRs";
    };

    "<leader>fGr" = {
      action = "gh run";
      options.desc = "github actions (run)";
    };

    "<leader>fGg" = {
      action = "gh gist";
      options.desc = "github gist";
    };
  };

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>ft";
      __unkeyed-2 = "<cmd>Telescope<cr>";
      desc = "open telescope";
      icon = icons.telescope;
    }
    {
      __unkeyed-1 = "<leader>flr";
      __unkeyed-2 = "<cmd>lua require('telescope.builtin').lsp_references()<cr>";
      desc = "[LSP] find references";
    }
    {
      __unkeyed-1 = "<leader>fld";
      __unkeyed-2 = "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>";
      desc = "[LSP] find definitions";
    }
    {
      __unkeyed-1 = "<leader>fli";
      __unkeyed-2 = "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>";
      desc = "[LSP] find implementations";
    }
    {
      __unkeyed-1 = "<leader>flt";
      __unkeyed-2 = "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>";
      desc = "[LSP] find type Definitions";
    }
    {
      __unkeyed-1 = "<leader>fls";
      __unkeyed-2 = "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>";
      desc = "[LSP] find document Symbols";
    }
    {
      __unkeyed-1 = "<leader>flw";
      __unkeyed-2 = "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>";
      desc = "[LSP] find workspace Symbols";
    }
    {
      __unkeyed-1 = "<leader>flD";
      __unkeyed-2 = "<cmd>lua require('telescope.builtin').diagnostics()<cr>";
      desc = "[LSP] find diagnostics";
    }
  ];
}
