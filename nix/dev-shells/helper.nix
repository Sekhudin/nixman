{ pkgs }:

let
  lib = pkgs.lib;

  mutFirstChar =
    f: s:
    let
      firstChar = f (lib.substring 0 1 s);
      rest = lib.substring 1 (-1) s;
    in
    firstChar + rest;

  toCamelCase_ =
    sep: s:
    mutFirstChar lib.toLower (lib.concatMapStrings (mutFirstChar lib.toUpper) (lib.splitString sep s));

  toCamelCase =
    s:
    builtins.foldl' (s: sep: toCamelCase_ sep s) s [
      "-"
      "_"
      "."
    ];

  mkNodeShell =
    name:
    pkgs.mkShell {
      description = "pkgs.${name} Development Environment";
      buildInputs = [
        pkgs.${name}
      ];
    };

  mkGoShell =
    name:
    pkgs.mkShell {
      description = "pkgs.${name} Development Environment";
      buildInputs = [ pkgs.${name} ];
      shellHook = ''
        export GOPATH="$(${pkgs.${name}}/bin/go env GOPATH)"
        export PATH="$PATH:$GOPATH/bin"
      '';
    };

  mkShell =
    pkgName: name:
    if lib.strings.hasPrefix "nodejs_" pkgName then
      mkNodeShell name
    else if lib.strings.hasPrefix "go_" pkgName then
      mkGoShell name
    else
      builtins.throw "Unknown package ${pkgName} for making shell environment";

  excludedPkgs = [
    "nodejs_18"
    "go_1_22"
  ];
in
{
  inherit excludedPkgs;

  mkShells =
    pkgName:
    builtins.foldl' (acc: name: acc // { "${toCamelCase name}" = (mkShell pkgName) name; }) { } (
      builtins.filter (name: lib.strings.hasPrefix pkgName name && !(builtins.elem name excludedPkgs)) (
        builtins.attrNames pkgs
      )
    );
}
