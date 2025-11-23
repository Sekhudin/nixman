{
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.within.gpg;
in
{
  options.within.gpg.enable = mkEnableOption "Enables Within's gpg config";

  config = mkIf cfg.enable {
    home.packages = [ pkgs.gnupg ];

    programs.gpg.enable = cfg.enable;
    programs.gpg.settings = {
      use-agent = true;
    };

    home.file = mkMerge [
      (mkIf pkgs.stdenv.isDarwin {
        ".gnupg/gpg-agent.conf".source = pkgs.writeTextFile {
          name = "home-gpg-agent.conf";
          text = ''
            pinentry-program ${pkgs.pinentry_mac}/Applications/pinentry-mac.app/Contents/MacOS/pinentry-mac
          '';
        };
      })

      (mkIf pkgs.stdenv.isLinux {
        ".gnupg/gpg-agent.conf".text = ''
          pinentry-program ${pkgs.pinentry-gnome3}/bin/pinentry
          default-cache-ttl 3600
          max-cache-ttl 999999
        '';
      })
    ];
  };
}
