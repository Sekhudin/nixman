top@{ lib, ... }:

let
  dirOptionType = lib.types.submodule {
    options.src = lib.mkOption {
      type = lib.types.path;
      description = "Directory to recursively import Nix modules from.";
    };
  };

  inherit (top.config) generate;

  isEnabled = lib.isAttrs generate;

  # =============================
  # Recursive directory reader
  # =============================
  readModules =
    src:
    let
      entries = builtins.readDir src;
      path = name: "${src}/${name}";
    in
    lib.concatMapAttrs (
      name: type:
      let
        p = path name;
      in
      if type == "regular" && lib.strings.hasSuffix ".nix" name then
        { ${lib.removeSuffix ".nix" name} = p; }

      else if type == "directory" then
        let
          default = "${p}/default.nix";
        in
        if builtins.pathExists default then
          { ${name} = default; }
        else
          let
            sub = readModules p;
          in
          if sub == { } then { } else { ${name} = sub; }

      else
        { }
    ) entries;

  attrsToModules = name: value: lib.attrsets.nameValuePair "${name}" (readModules value.src);

in
{
  options.generate = lib.mkOption {
    type = lib.types.attrsOf dirOptionType;
    default = null;
    description = "Automatically generate modules recursively from directory.";
  };

  config = lib.mkIf isEnabled {
    flake = lib.mapAttrs' attrsToModules generate;
  };
}
