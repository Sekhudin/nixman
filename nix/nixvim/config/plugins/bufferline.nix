{ ... }:

{
  plugins.bufferline.enable = true;
  plugins.bufferline.settings.options = {
    always_show_bufferline = true;
    show_buffer_close_icons = false;
    show_close_icon = false;
    offsets = [
      {
        filetype = "neo-tree";
        highlight = "Directory";
        text = "File Explorer";
        text_align = "center";
      }
    ];
  };

  plugins.mini-bufremove.enable = true;
  plugins.mini-bufremove.settings = {
    silent = false;
  };

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>bf";
      __unkeyed-2 = "<cmd>BufferLineGoToBuffer 1<cr>";
      desc = "First buffer";
    }
    {
      __unkeyed-1 = "<leader>bl";
      __unkeyed-2 = "<cmd>BufferLineGoToBuffer -1<cr>";
      desc = "Last buffer";
    }
    {
      __unkeyed-1 = "<leader>bp";
      __unkeyed-2 = "<cmd>BufferLineCyclePrev<cr>";
      desc = "Next buffer";
    }
    {
      __unkeyed-1 = "<leader>bn";
      __unkeyed-2 = "<cmd>BufferLineCycleNext<cr>";
      desc = "Prev buffer";
    }
    {
      __unkeyed-1 = "<leader>bd";
      __unkeyed-2 = "<cmd>lua require('mini.bufremove').wipeout()<cr>";
      desc = "Close buffer";
    }
    {
      __unkeyed-1 = "<leader>bo";
      __unkeyed-2 = "<cmd>BufferLineCloseOthers<cr>";
      desc = "Close other buffers";
    }
  ];
}
