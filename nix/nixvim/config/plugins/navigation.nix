{ icons, ... }:

{
  plugins.bufferline.enable = true;
  plugins.bufferline.lazyLoad.settings.event = [
    "BufReadPost"
    "BufEnter"
  ];
  plugins.bufferline.settings.options = {
    mode = "buffers";
    always_show_bufferline = true;
    show_buffer_close_icons = false;
    show_close_icon = false;
    color_icons = true;
    separator_style = "slope";
    custom_filter = ''
      function(buf_number, buf_numbers)
        return not vim.tbl_contains({
          "help",
        }, vim.bo[buf_number].filetype)
      end
    '';
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
  plugins.hop.lazyLoad.settings.cmd = [ "HopLineStart" ];
  plugins.hop.lazyLoad.settings.event = [
    "BufReadPost"
    "BufNewFile"
  ];
  plugins.hop.settings = { };

  plugins.mini-bufremove.enable = true;
  plugins.mini-bufremove.lazyLoad.settings.event = [ "BufReadPost" ];
  plugins.mini-bufremove.settings.silent = false;

  ###############################
  # which-key
  ###############################
  plugins.which-key.settings.replace.desc = [
    [
      "<C-h>"
      "Ctrl+h"
    ]
    [
      "<C-l>"
      "Ctrl+l"
    ]
    [
      "<C-j>"
      "Ctrl+j"
    ]
    [
      "<C-k>"
      "Ctrl+k"
    ]
  ];

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<Esc><Esc>";
      __unkeyed-2 = "<C-\\><C-n>";
      desc = "normal mode";
      mode = [ "t" ];
    }
    {
      __unkeyed-1 = "<leader><Esc>";
      __unkeyed-2 = "<cmd>nohlsearch<cr>";
      desc = "clear Search Highlight";
      mode = [ "n" ];
    }

    ###############################
    # window moving
    ###############################
    {
      __unkeyed-1 = "<C-h>";
      __unkeyed-2 = "<cmd>wincmd h<cr>";
      desc = "move to left window";
      mode = [
        "n"
        "t"
      ];
    }
    {
      __unkeyed-1 = "<C-l>";
      __unkeyed-2 = "<cmd>wincmd l<cr>";
      desc = "move to right window";
      mode = [
        "n"
        "t"
      ];
    }
    {
      __unkeyed-1 = "<C-j>";
      __unkeyed-2 = "<cmd>wincmd j<cr>";
      desc = "move to bellow window";
      mode = [
        "n"
        "t"
      ];
    }
    {
      __unkeyed-1 = "<C-k>";
      __unkeyed-2 = "<cmd>wincmd k<cr>";
      desc = "move to upper window";
      mode = [
        "n"
        "t"
      ];
    }

    ###############################
    # line moving
    ###############################
    {
      __unkeyed-1 = "<A-j>";
      __unkeyed-2 = "<cmd>m .+1<cr>==";
      desc = "move line down";
      mode = "n";
    }
    {
      __unkeyed-1 = "<A-k>";
      __unkeyed-2 = "<cmd>m .-2<cr>==";
      desc = "move line up";
      mode = "n";
    }
    {
      __unkeyed-1 = "<A-j>";
      __unkeyed-2 = ":m '>+1<cr>gv=gv";
      desc = "move selection down";
      mode = "v";
    }
    {
      __unkeyed-1 = "<A-k>";
      __unkeyed-2 = ":m '<-2<cr>gv=gv";
      desc = "move selection up";
      mode = "v";
    }

    ###############################
    # buffer tab
    ###############################
    {
      __unkeyed-1 = "<Tab>";
      __unkeyed-2 = "<cmd>BufferLineCycleNext<cr>";
      group = "buffer";
      desc = "first buffer";
    }
    {
      __unkeyed-1 = "<S-Tab>";
      __unkeyed-2 = "<cmd>BufferLineCyclePrev<cr>";
      group = "buffer";
      desc = "prev buffer";
    }
    {
      __unkeyed-1 = "<leader>bf";
      __unkeyed-2 = "<cmd>BufferLineGoToBuffer 1<cr>";
      desc = "first buffer";
    }
    {
      __unkeyed-1 = "<leader>bl";
      __unkeyed-2 = "<cmd>BufferLineGoToBuffer -1<cr>";
      desc = "last buffer";
    }
    {
      __unkeyed-1 = "<leader>w";
      __unkeyed-2 = "gt";
      desc = "next workspace";
    }
    {
      __unkeyed-1 = "<leader>W";
      __unkeyed-2 = "gT";
      desc = "prev workspace";
    }
    {
      __unkeyed-1 = "<leader>bd";
      __unkeyed-2 = "<cmd>lua require('mini.bufremove').wipeout()<cr>";
      desc = "close buffer";
    }
    {
      __unkeyed-1 = "<leader>bo";
      __unkeyed-2 = "<cmd>BufferLineCloseOthers<cr>";
      desc = "close other buffers";
    }

    ###############################
    # seek
    ###############################
    {
      __unkeyed-1 = "<leader>h";
      __unkeyed-2 = "<cmd>HopLineStart<cr>";
      desc = "seek line";
    }
    {
      __unkeyed-1 = "sc";
      __unkeyed-2 = "<cmd>HopChar2<cr>";
      desc = "seek char";
      mode = [
        "n"
        "v"
      ];
    }
    {
      __unkeyed-1 = "sl";
      __unkeyed-2 = "<cmd>HopLineStart<cr>";
      desc = "seek line";
      mode = [
        "n"
        "v"
      ];
    }
    {
      __unkeyed-1 = "sw";
      __unkeyed-2 = "<cmd>HopWord<cr>";
      desc = "seek word";
      mode = [
        "n"
        "v"
      ];
    }
  ];
}
