{ icons, ... }:

{
  plugins.colorizer.enable = true;
  plugins.colorizer.lazyLoad.settings.event = [ "BufReadPre" ];
  plugins.colorizer.settings = {
    user_default_options = {
      mode = "virtualtext";
      virtualtext = " ■";
      RRGGBBAA = true;
      RRGGBB = true;
      AARRGGBB = true;
    };
  };

  plugins.cursorline.enable = true;
  plugins.cursorline.lazyLoad.settings.event = [ "BufRead" ];
  plugins.cursorline.settings = {
    cursorline = {
      enable = true;
      number = true;
      timeout = 0;
    };
    cursorword = {
      enable = true;
      hl.underline = false;
    };
  };

  plugins.indent-blankline.enable = true;
  plugins.indent-blankline.settings = {
    indent.char = icons.vertical;
    whitespace.highlight = [ "Whitespace" ];
    scope.enabled = false;
    scope.char = icons.indent;
    exclude.buftypes = [
      "nofile"
      "terminal"
      "neorg"
    ];
    exclude.filetypes = [
      "norg"
      "NeoTree"
      "sagaoutline"
      "help"
      "terminal"
      "dashboard"
      "lspinfo"
      "TelescopePrompt"
      "TelescopeResults"
    ];
  };

  plugins.lualine.enable = true;
  plugins.lualine.settings = {
    options = {
      theme = "auto";
      icon_enabled = true;
      component_separators = {
        left = "";
        right = "";
      };
      section_separators = {
        left = icons.circle_right;
        right = icons.circle_left;
      };
      disabled_filetypes = {
        statusline = [ ];
      };
    };
    sections = {
      lualine_a = [ "mode" ];
      lualine_b = [
        "branch"
        "diff"
      ];
      lualine_c = [ "diagnostics" ];
      lualine_x = [
        "searchcount"
        "selectcount"
      ];
      lualine_y = [ "lsp_status" ];
      lualine_z = [ "location" ];
    };
  };

  plugins.mini-icons.enable = true;
  plugins.mini-icons.mockDevIcons = true;
  plugins.mini-icons.settings = {
    style = "glyph";
    default = { };
    directory = { };
    extension = { };
    file = { };
    filetype = { };
    lsp = { };
    os = { };
  };

  plugins.rainbow-delimiters.enable = true;
  plugins.rainbow-delimiters.settings = { };

  plugins.smear-cursor.enable = true;
  plugins.smear-cursor.lazyLoad.settings.event = [ "InsertEnter" ];
  plugins.smear-cursor.lazyLoad.settings.cmd = [ "SmearCursorToggle" ];
  plugins.smear-cursor.settings = {
    hide_target_hack = true;
    never_draw_over_target = true;
  };
}
