{ icons, ... }:

{
  plugins.neo-tree.enable = true;
  plugins.neo-tree.settings = {
    close_if_last_window = true;
    filesystem = {
      follow_current_file = {
        enabled = false;
        leave_dirs_open = false;
      };
      filtered_items = {
        hide_dotfiles = true;
        hide_gitignored = true;
        always_show_by_pattern = [
          ".env*"
        ];
      };
    };
    window = {
      width = 30;
      auto_expand_width = false;
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
