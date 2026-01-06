{ ... }:

{
  keymaps = [
    {
      mode = "t";
      key = "<Esc>";
      action = "<C-\\><C-n>";
      options.desc = "Exit terminal to normal mode";
    }
  ];
}
