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
      ];
      command = "silent update";
      pattern = [
        "*.go"
        "*.js"
        "*.jsx"
        "*.java"
        "*.md"
        "*.mdx"
        "*.nix"
        "*.py"
        "*.sql"
        "*.ts"
        "*.tsx"
      ];
    }
  ];
}
