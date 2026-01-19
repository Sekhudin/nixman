{ ... }:

{
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
      desc = "Lazygit";
    }
    {
      __unkeyed-1 = "<leader>gtg";
      __unkeyed-2 = "<cmd>Gitsigns toggle_signs<cr>";
      desc = "Toggle signs";
    }
    {
      __unkeyed-1 = "<leader>gtn";
      __unkeyed-2 = "<cmd>Gitsigns toggle_numhl<cr>";
      desc = "Toggle num highlights";
    }
    {
      __unkeyed-1 = "<leader>gtl";
      __unkeyed-2 = "<cmd>Gitsigns toggle_linehl<cr>";
      desc = "Toggle line highlights";
    }
    {
      __unkeyed-1 = "<leader>gtw";
      __unkeyed-2 = "<cmd>Gitsigns toggle_word_diff<cr>";
      desc = "Toggle word diff";
    }
    {
      __unkeyed-1 = "<leader>gtd";
      __unkeyed-2 = "<cmd>Gitsigns toggle_deleted<cr>";
      desc = "Toggle deleted";
    }
    {
      __unkeyed-1 = "<leader>gtb";
      __unkeyed-2 = "<cmd>Gitsigns toggle_current_line_blame<cr>";
      desc = "Toggle current line blame";
    }
  ];
}
