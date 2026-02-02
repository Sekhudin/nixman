{
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.within.pass;
in
{
  options.within.pass.enable = mkEnableOption "Enables Within's pass config";

  config = mkIf cfg.enable {
    home.packages = [ pkgs.gnupg ];

    programs.password-store.enable = cfg.enable;
    programs.password-store.package = pkgs.pass.withExtensions (p: [
      p.pass-otp
      p.pass-checkup
      p.pass-audit
      p.pass-update
    ]);

    programs.browserpass.enable = cfg.enable;
    programs.browserpass.browsers = [ "firefox" ];
  };
}
