{ icons, ... }:

{
  plugins.bufferline.enable = true;
  plugins.bufferline.lazyLoad.settings.event = [ "BufReadPre" ];
  plugins.bufferline.settings.options = {
    mode = "buffers";
    always_show_bufferline = true;
    show_buffer_close_icons = false;
    show_close_icon = false;
    color_icons = true;
    separator_style = "slope";
    offsets = [
      {
        filetype = "neo-tree";
        text.__raw = ''
          function()
            local icon = "${icons.withSpace.right "folder_root_open"}"
            local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            return icon .. cwd
          end
        '';
        text_align = "center";
        highlight = "NeoTreeRootName";
        padding = 2;
        separator = false;
      }
    ];
  };

  plugins.hop.enable = true;
  plugins.hop.lazyLoad.settings.event = [ "BufReadPost" ];
  plugins.hop.settings = { };

  plugins.mini-bufremove.enable = true;
  plugins.mini-bufremove.lazyLoad.settings.event = [ "BufReadPost" ];
  plugins.mini-bufremove.settings.silent = false;
  
  
  ###############################
  # which-key spec
  ###############################
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
    {
      __unkeyed-1 = "sc";
      __unkeyed-2 = "<cmd>HopChar1<cr>";
      mode = [
        "n"
        "v"
        "o"
      ];
      desc = "Seek char";
    }
    {
      __unkeyed-1 = "sl";
      __unkeyed-2 = "<cmd>HopLineStart<cr>";
      mode = [
        "n"
        "v"
        "o"
      ];
      desc = "Seek line";
    }
    {
      __unkeyed-1 = "sp";
      __unkeyed-2 = "<cmd>HopPattern<cr>";
      mode = [
        "n"
        "v"
        "o"
      ];
      desc = "Seek pattern";
    }
    {
      __unkeyed-1 = "sw";
      __unkeyed-2 = "<cmd>HopWord<cr>";
      mode = [
        "n"
        "v"
        "o"
      ];
      desc = "Seek word";
    }
  ];
}
