{ lib }:

let
  mkUser = username: rec {
    inherit username;
    homeDirectory = "/home/${username}";
    configDirectory = "${homeDirectory}/.config";
    processComposeDirectory = "${homeDirectory}/.process-compose/data";
  };

  resolveUser =
    defaultUser:
    let
      username = builtins.getEnv "USER";
    in
    if username != "" then mkUser username else defaultUser;
in
{
  inherit mkUser resolveUser;

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

  users = {
    jack = mkUser "jack";
    syaikhu = mkUser "syaikhu";
  };
}
