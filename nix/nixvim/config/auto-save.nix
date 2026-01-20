{ lib, ... }:

let
  autosave.enable = true;
in
lib.mkIf autosave.enable {
  opts.updatetime = 800;
  autoCmd = [
    {
      event = [
        "InsertLeave"
        "CursorHoldI"
        "TextChanged"
      ];
      pattern = "*";
      command = "silent! update";
    }
  ];
}
