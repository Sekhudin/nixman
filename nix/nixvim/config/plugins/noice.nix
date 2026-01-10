{ ... }:

{
  plugins.noice.enable = true;
  plugins.noice.lazyLoad.settings.event = [ "VimEnter" ];
  plugins.noice.lazyLoad.settings.cmd = [ "Noice" ];
  plugins.noice.settings = { };

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>n0";
      __unkeyed-2 = "<cmd>Noice disable<cr>";
      desc = "Noice off";
    }
    {
      __unkeyed-1 = "<leader>n1";
      __unkeyed-2 = "<cmd>Noice enable<cr>";
      desc = "Noice on";
    }
    {
      __unkeyed-1 = "<leader>nd";
      __unkeyed-2 = "<cmd>Noice dismiss<cr>";
      desc = "Noice Dismis";
    }
    {
      __unkeyed-1 = "<leader>ne";
      __unkeyed-2 = "<cmd>Noice errors<cr>";
      desc = "Noice errors";
    }
    {
      __unkeyed-1 = "<leader>nh";
      __unkeyed-2 = "<cmd>Noice<cr>";
      desc = "Noice history";
    }
    {
      __unkeyed-1 = "<leader>nl";
      __unkeyed-2 = "<cmd>Noice last<cr>";
      desc = "Noice last";
    }
    {
      __unkeyed-1 = "<leader>ns";
      __unkeyed-2 = "<cmd>Noice<cr>";
      desc = "Noice stats";
    }
    {
      __unkeyed-1 = "<leader>nt";
      __unkeyed-2 = "<cmd>Noice telescope<cr>";
      desc = "";
    }
  ];
}
