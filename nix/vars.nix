{ lib }:

{
  nixpkgs = {
    config = {
      allowUnfree = false;
      allowBroken = false;
      allowUnfreePredicate =
        pkg:
        builtins.elem (lib.getName pkg) [
          "claude-code"
          "discord"
          "slack"
          "wpsoffice"
        ];
    };
  };
}
