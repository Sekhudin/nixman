{ lib, ... }:

let
  autosave.enable = true;
in
lib.mkIf autosave.enable {
  opts.updatetime = 800;
  autoCmd = [
    {
      event = "InsertLeave";
      pattern = "*";
      command = "silent! update";
    }
    {
      event = "CursorHoldI";
      pattern = "*";
      command = "silent! update";
    }
    {
      event = "TextChanged";
      pattern = "*";
      command = "silent! update";
    }
  ];
}
