{ icons, ... }:

{
  plugins.neo-tree.enable = true;
  plugins.neo-tree.settings = {
    close_if_last_window = true;
    default_component_configs = {
      indent = {
        indent_size = 2;
        padding = 1;
        with_markers = true;
        indent_marker = icons.box_drawing_up;
        last_indent_marker = icons.box_drawing_up_right;
        highlight = "NeoTreeIndentMarker";
        with_expanders = true;
        expander_collapsed = icons.chevron_right;
        expander_expanded = icons.chevron_down;
        expander_highlight = "NeoTreeExpander";
      };
      icon = {
        default = icons.file_text;
        folder_empty = icons.folder_empty;
      };
      file_size = {
        enabled = true;
        width = 12;
        required_width = 40;
      };
    };
    window = {
      position = "left";
      width = 35;
      auto_expand_width = false;
      mapping_options = {
        noremap = true;
        nowait = true;
      };
      mappings = {
        "<space>" = {
          command = "toggle_node";
          nowait = true;
        };
      };
    };
  };

  plugins.neo-tree.settings.filesystem = {
    use_libuv_file_watcher = false;
    follow_current_file = {
      enabled = false;
      leave_dirs_open = false;
    };
    filtered_items = {
      hide_dotfiles = true;
      hide_gitignored = false;
      always_show_by_pattern = [
        ".env*"
      ];
    };
    window.mappings = {
      f = {
        command = "fuzzy_finder";
      };
    };
  };

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>e";
      __unkeyed-2 = "<cmd>Neotree toggle<cr>";
      desc = "Neotree toggle";
      icon = icons.toggle;
    }
  ];
}
