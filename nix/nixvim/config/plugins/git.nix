{ pkgs, ... }:

{
  extraPackages = with pkgs; [
    postgresql
  ];

  plugins.git-conflict.enable = true;
  plugins.git-conflict.settings = { };

  plugins.lazygit.enable = true;
  plugins.lazygit.settings = { };

  plugins.gitsigns.enable = true;
  plugins.gitsigns.lazyLoad.settings.event = [ "BufReadPost" ];
  plugins.gitsigns.settings = {
    numhl = true;
    linehl = false;
    current_line_blame = false;
    watch_gitdir.follow_files = true;
    current_line_blame_opts = {
      virt_text = true;
      delay = 500;
      ignore_whitespace = false;
    };
  };

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>gg";
      __unkeyed-2 = "<cmd>LazyGit<cr>";
      desc = "lazygit";
    }
    {
      __unkeyed-1 = "<leader>gtg";
      __unkeyed-2 = "<cmd>Gitsigns toggle_signs<cr>";
      desc = "toggle signs";
    }
    {
      __unkeyed-1 = "<leader>gtn";
      __unkeyed-2 = "<cmd>Gitsigns toggle_numhl<cr>";
      desc = "toggle num highlights";
    }
    {
      __unkeyed-1 = "<leader>gtl";
      __unkeyed-2 = "<cmd>Gitsigns toggle_linehl<cr>";
      desc = "toggle line highlights";
    }
    {
      __unkeyed-1 = "<leader>gtw";
      __unkeyed-2 = "<cmd>Gitsigns toggle_word_diff<cr>";
      desc = "toggle word diff";
    }
    {
      __unkeyed-1 = "<leader>gtd";
      __unkeyed-2 = "<cmd>Gitsigns toggle_deleted<cr>";
      desc = "toggle deleted";
    }
    {
      __unkeyed-1 = "<leader>gtb";
      __unkeyed-2 = "<cmd>Gitsigns toggle_current_line_blame<cr>";
      desc = "toggle current line blame";
    }
  ];
}
