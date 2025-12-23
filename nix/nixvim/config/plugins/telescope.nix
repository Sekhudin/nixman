{
  icons,
  ...
}:

{
  plugins.telescope.enable = true;
  plugins.telescope.keymaps = {
    ff = {
      action = "find_files";
      options.desc = "Find by files";
    };
    fF = {
      action = "live_grep";
      options.desc = "Find by word";
    };
    "ff'" = {
      action = "grep_string";
      options.desc = "Find by string";
    };
    fb = {
      action = "buffers";
      options.desc = "Find by current buffers";
    };
    fB = {
      action = "current_buffer_fuzzy_find";
      options.desc = "Find Fuzzy by current buffers";
    };
    fh = {
      action = "help_tags";
      options.desc = "Find by help tags";
    };
    fc = {
      action = "colorscheme";
      options.desc = "Find by Colorscheme";
    };
    fC = {
      action = "highlights";
      options.desc = "Find by highlights";
    };
  };

  plugins.which-key.settings.triggers = [
    {
      __unkeyed-1 = "f";
      mode = "n";
    }
  ];

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "ft";
      __unkeyed-2 = "<cmd>Telescope<cr>";
      desc = "Open Telescope";
      icon = icons.telescope;
    }
  ];
}
