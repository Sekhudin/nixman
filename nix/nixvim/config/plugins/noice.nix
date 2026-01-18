{ ... }:

{
  plugins.noice.enable = true;
  plugins.noice.lazyLoad.settings.event = [ "VimEnter" ];
  plugins.noice.settings = { };

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>ns";
      __unkeyed-2 = "<cmd>Noice<cr>";
      desc = "Noice toggle";
    }
    {
      __unkeyed-1 = "<leader>nd";
      __unkeyed-2 = "<cmd>Noice dismiss<cr>";
      desc = "Noice dismiss";
    }
    {
      __unkeyed-1 = "<leader>ne";
      __unkeyed-2 = "<cmd>Noice errors<cr>";
      desc = "Noice errors";
    }
  ];
}
