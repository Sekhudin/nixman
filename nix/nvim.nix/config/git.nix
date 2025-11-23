{
  lib,
  pkgs,
  icons,
  ...
}:

{
  extraPackages = [ pkgs.gh ];

  extraPlugins = [ pkgs.vimPlugins.telescope-github-nvim ];

  plugins.neogit.enable = true;
  plugins.neogit.lazyLoad.settings.cmd = "Neogit";

  plugins.git-conflict.enable = true;

  plugins.gitsigns.enable = true;
  plugins.gitsigns.settings.numhl = true;
  plugins.gitsigns.settings.linehl = false;
  plugins.gitsigns.settings.current_line_blame_opts = {
    virt_text = true;
    virt_text_pos = "eol";
    ignore_whitespace = false;
  };
  plugins.gitsigns.settings.signs = {
    add.text = icons.vertical;
    change.text = icons.pipe;
    delete.text = icons.minus2;
    topdelete.text = "‾";
    changedelete.text = "~";
  };

  plugins.telescope = rec {
    enabledExtensions = [ "gh" ];
    lazyLoad.settings.keys = lib.attrNames keymaps;
    keymaps = {
      fgc = {
        action = "git_commits";
        options.desc = "Lists git commits.";
      };
      fgf = {
        action = "git_bcommits";
        options.desc = "Lists buffer's git commits.";
      };
      fgr = {
        action = "git_bcommits_range";
        options.desc = "Lists buffer's git commits in a range of lines.";
      };
      fgb = {
        action = "git_branches";
        options.desc = "Lists git branches with log preview.";
      };
      fgs = {
        action = "git_status";
        options.desc = "Lists current changes git per file with diff preview and add action.";
      };
      fgw = {
        action = "git_stash";
        options.desc = "Lists git stash items";
      };
      fGi = {
        action = "gh issues";
        options.desc = "Find by Github Issues";
      };
      fGo = {
        action = "gh pull_requests";
        options.desc = "Find by Github Pull Requests";
      };
      fGr = {
        action = "gh run";
        options.desc = "Find by Github Actions (run)";
      };
      fGs = {
        action = "gh gist";
        options.desc = "Find by Github Gist";
      };
    };
  };

  plugins.which-key.settings.spec =
    let
      gs.toggle_signs = "require'gitsigns'.toggle_signs";
      gs.toggle_numhl = "require'gitsigns'.toggle_numhl";
      gs.toggle_linehl = "require'gitsigns'.toggle_linehl";
      gs.toggle_word_diff = "require'gitsigns'.toggle_word_diff";
      gs.toggle_deleted = "require'gitsigns'.toggle_deleted";
      gs.toggle_current_line_blame = "require'gitsigns'.toggle_current_line_blame";
    in
    [

      {
        __unkeyed-1 = "<leader>g";
        __unkeyed-2 = "<cmd>Neogit<CR>";
        icon = icons.git;
        desc = "Open Neogit";
      }

      {
        __unkeyed-1 = "tgs";
        __unkeyed-2.__raw = gs.toggle_signs;
        desc = "Toggle Sign Column";
      }

      {
        __unkeyed-1 = "tgn";
        __unkeyed-2.__raw = gs.toggle_numhl;
        desc = "Toggle Num Hightlight";
      }

      {
        __unkeyed-1 = "tgl";
        __unkeyed-2.__raw = gs.toggle_linehl;
        desc = "Toggle Line Hightlight";
      }

      {
        __unkeyed-1 = "tgw";
        __unkeyed-2.__raw = gs.toggle_word_diff;
        desc = "Toggle Word Diff";
      }

      {
        __unkeyed-1 = "tgd";
        __unkeyed-2.__raw = gs.toggle_deleted;
        desc = "Toggle Deleted";
      }

      {
        __unkeyed-1 = "tgb";
        __unkeyed-2.__raw = gs.toggle_current_line_blame;
        desc = "Toggle Current line blame";
      }

    ];
}
