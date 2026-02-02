{ ... }:

{
  plugins.noice.enable = true;
  plugins.noice.lazyLoad.settings.event = [ "VimEnter" ];
  plugins.noice.settings = {
    history.view = "popup";
  };

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>nt";
      __unkeyed-2 = "<cmd>Noice<cr>";
      desc = "Noice toggle";
    }
    {
      __unkeyed-1 = "<leader>nh";
      __unkeyed-2 = "<cmd>NoiceHistory<cr>";
      desc = "Noice history";
    }
    {
      __unkeyed-1 = "<leader>nf";
      __unkeyed-2 = "<cmd>NoicePick<cr>";
      desc = "Noice find";
    }
    {
      __unkeyed-1 = "<leader>nd";
      __unkeyed-2 = "<cmd>NoiceDismiss<cr>";
      desc = "Noice dismiss";
    }
    {
      __unkeyed-1 = "<leader>ne";
      __unkeyed-2 = "<cmd>NoiceErrors<cr>";
      desc = "Noice errors";
    }
  ];
}
