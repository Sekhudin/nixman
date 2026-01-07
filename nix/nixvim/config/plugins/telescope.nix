{
  icons,
  ...
}:

{
  plugins.telescope.enable = true;
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
      options.desc = "Find by highlights";
    };
    fc = {
      action = "colorscheme";
      options.desc = "Find colorscheme";
    };
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
