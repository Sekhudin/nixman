let
  vars = {
    dir = {
      nixConfig = "~/.config/nixman";
    };
    nixpkgs = {
      config = {
        allowUnfree = true;
        allowBroken = false;
      };
    };
    nixvim = {
      leader = " ";
      leaderName = "SPACE";
    };
  };
in
vars // { }
