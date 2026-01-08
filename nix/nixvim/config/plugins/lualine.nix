{ icons, ... }:

{
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
  };

  plugins.lualine.settings.sections = {
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
}
