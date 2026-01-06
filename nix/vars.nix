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
  };
in
vars // { }
