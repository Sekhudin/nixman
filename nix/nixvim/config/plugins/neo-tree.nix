{ ... }:

{
  plugins.neo-tree.enable = true;
  plugins.neo-tree.settings.close_if_last_window = true;
  plugins.neo-tree.settings.filesystem = {
    follow_current_file.enabled = true;
    follow_current_file.leave_dirs_open = true;
  };
}
