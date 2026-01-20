let
  vars = {
    nixpkgs = {
      config = {
        allowUnfree = true;
        allowBroken = false;
      };
    };
  };
in
vars // { }
