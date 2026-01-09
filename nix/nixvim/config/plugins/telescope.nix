{
  lib,
  config,
  icons,
  ...
}:

{
  plugins.telescope.enable = true;
  plugins.telescope.enabledExtensions = [ "gh" ];
  plugins.telescope.keymaps = {
    ff = {
      action = "find_files";
      options.desc = "Find files";
    };
    fw = {
      action = "live_grep";
      options.desc = "Find word";
    };
    fW = {
      action = "grep_string";
      options.desc = "Find word under cursor";
    };
    fb = {
      action = "buffers";
      options.desc = "Find buffers";
    };
    fB = {
      action = "current_buffer_fuzzy_find";
      options.desc = "Fuzzy find in buffer";
    };
    fh = {
      action = "help_tags";
      options.desc = "Find help";
    };
    fH = {
      action = "highlights";
      options.desc = "Find highlights";
    };
    fc = {
      action = "colorscheme";
      options.desc = "Find colorscheme";
    };
    fgc = {
      action = "git_commits";
      options.desc = "Git commits";
    };

    fgC = {
      action = "git_bcommits";
      options.desc = "Buffer git commits";
    };

    fgr = {
      action = "git_bcommits_range";
      options.desc = "Buffer git commits (range)";
    };

    fgb = {
      action = "git_branches";
      options.desc = "Git branches";
    };

    fgs = {
      action = "git_status";
      options.desc = "Git status";
    };

    fgS = {
      action = "git_stash";
      options.desc = "Git stash";
    };

    fGi = {
      action = "gh issues";
      options.desc = "Github issues";
    };

    fGp = {
      action = "gh pull_requests";
      options.desc = "Github PRs";
    };

    fGr = {
      action = "gh run";
      options.desc = "Github Actions (run)";
    };

    fGg = {
      action = "gh gist";
      options.desc = "Github Gist";
    };
  };

  plugins.telescope.lazyLoad.settings = {
    cmd = [ "Telescope" ];
    keys = lib.attrNames config.plugins.telescope.keymaps;
  };

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "ft";
      __unkeyed-2 = "<cmd>Telescope<cr>";
      desc = "Open Telescope";
      icon = icons.telescope;
    }
  ];
}
