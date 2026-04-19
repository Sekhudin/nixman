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
      desc = "noice toggle";
    }
    {
      __unkeyed-1 = "<leader>nh";
      __unkeyed-2 = "<cmd>NoiceHistory<cr>";
      desc = "noice history";
    }
    {
      __unkeyed-1 = "<leader>nf";
      __unkeyed-2 = "<cmd>NoicePick<cr>";
      desc = "noice find";
    }
    {
      __unkeyed-1 = "<leader>nd";
      __unkeyed-2 = "<cmd>NoiceDismiss<cr>";
      desc = "noice dismiss";
    }
    {
      __unkeyed-1 = "<leader>ne";
      __unkeyed-2 = "<cmd>NoiceErrors<cr>";
      desc = "noice errors";
    }
  ];
}
