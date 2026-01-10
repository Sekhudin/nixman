{ ... }:

{
  plugins.hop.enable = true;
  plugins.hop.lazyLoad.settings.event = [ "VimEnter" ];
  plugins.hop.settings = { };

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "sc";
      __unkeyed-2 = "<cmd>HopChar1<cr>";
      mode = ["n" "v" "o"];
      desc = "Seek char";
    }
    {
      __unkeyed-1 = "sl";
      __unkeyed-2 = "<cmd>HopLineStart<cr>";
      mode = ["n" "v" "o"];
      desc = "Seek line";
    }
    {
      __unkeyed-1 = "sp";
      __unkeyed-2 = "<cmd>HopPattern<cr>";
      mode = ["n" "v" "o"];
      desc = "Seek pattern";
    }
    {
      __unkeyed-1 = "sw";
      __unkeyed-2 = "<cmd>HopWord<cr>";
      mode = ["n" "v" "o"];
      desc = "Seek word";
    }
  ];
}
