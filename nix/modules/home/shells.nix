{
  config,
  lib,
  pkgs,
  ...
}:

let
  nixConfigDirectory = "~/.config/nixman";
  commandFoldl' = lib.strings.concatMapStrings (x: "${x} && ");
  shellAliases =
    with pkgs;
    let
      verify =
        writeScriptBin "verify" # bash
          ''
            [[ -z "$1" ]] && echo "No argument provided" && exit 0

            [[ $1 == ^-?[0-9]+(\.[0-9]+)?$ ]] && echo "The first argument is not a number: $1" && exit 0
          '';
      cmd =
        a: b: x: # bash
        ''
          set -e 
          ${verify}/bin/verify $1 || exit 0
          ${git}/bin/git for-each-ref --sort=${a} --format '%(refname:short) %(${a}:format:%s)' "${b}" | while read tag tagdate; do
            threshold_date=$(date -d "$1 days ago" --utc '+%s')
            if [ -n "$tagdate" ]; then
              if [ "$tagdate" -lt "$threshold_date" ]; then
                echo "==> $tag is older than $1 days"
                echo "==> $tag  will be deleted"
                TAGS="$TAGS $tag"
              fi
            fi
          done
          ${x} $TAGS
        '';
      scripts = {
        gdb = writeScriptBin "gdb" (cmd "committerdate" "refs/heads" "git branch -D");
        gdbr = writeScriptBin "gdbr" (cmd "committerdate" "origin/refs/heads" "git push origin -d");
        gdt = writeScriptBin "gdt" (cmd "taggerdate" "refs/tags/*" "git tag -d");
        gdtr = writeScriptBin "gdtr" (cmd "taggerdate" "origin/refs/tags/*" "git push origin -d");
      };
    in
    {
      gdb = ''${scripts.gdb}/bin/gdb'';
      gdbr = ''${scripts.gdbr}/bin/gdbr'';
      gdt = ''${scripts.gdt}/bin/gdt'';
      gdtr = ''${scripts.gdtr}/bin/gdtr'';

      tg = "tree --gitignore";
      # Nix related
      nclean = commandFoldl' [
        "nix profile wipe-history"
        "nix-collect-garbage"
        "nix-collect-garbage -d"
        "nix-collect-garbage --delete-old"
        "nix store gc"
        "nix store optimise"
        "nix-store --verify --repair --check-contents"
      ];
      da = "direnv allow";
      dr = "direnv reload";
      drb = "darwin-rebuild build --flake ${nixConfigDirectory}";
      drs = "darwin-rebuild switch --flake ${nixConfigDirectory}";
      psc0 = "nix build ${nixConfigDirectory}#darwinConfigurations.RG.system --json | jq -r '.[].outputs | to_entries[].value' | cachix push r17";
      psc1 = "nix build ${nixConfigDirectory}#darwinConfigurations.eR17.system --json | jq -r '.[].outputs | to_entries[].value' | cachix push r17";

      # secret gpg export
      gpbs = "gpg --export-options backup --export-secret-keys";
      # public gpg export
      gpbp = "gpg --export-options backup --export";
      # secret or public gpg import
      gprs = "gpg --export-options restore --import";
      # gpg trust data
      gpbt = "gpg --export-ownertrust";
      gprt = "gpg --import-ownertrust";

      # Nix
      lenv = "nix-env --list-generations";
      senv = "nix-env --switch-generation";
      denv = "nix-env --delete-generations";
      doenv = "denv old";
      renv = "nix-env --rollback";
      # is equivalent to: nix build --recreate-lock-file
      flakeup-all = "nix flake update ${nixConfigDirectory}";
      # example:
      # $ flakeup home-manager
      flakeup = "nix flake lock ${nixConfigDirectory} --update-input";
      nb = "nix build";
      ndp = "nix develop";
      nf = "nix flake";
      nr = "nix run";
      ns = "nix-shell";
      nq = "nix search";
      # Cryptography
      age = "${pkgs.rage}/bin/rage";

      # Shell related
      e = "nvim";
      grep = "${pkgs.ripgrep}/bin/rg";
      c = "z";
      cc = "zi";
      # Others
      rm = "rm -i";
      p = "ping";
      l = "ls -l";
      la = "ls -a";
      lla = "ls -la";
      lt = "ls --tree";
      cat = "${pkgs.bat}/bin/bat";
      du = "${pkgs.du-dust}/bin/dust";

      # Home-manager
      hm = "home-manager";
      hmp = "home-manager packages";
      hmg = "home-manager generations";

      # Git
      g = "git";
      pullhead = "git pull origin (git rev-parse --abbrev-ref HEAD)";
      beda = "gd";
      ingfo = "git status";
      tarek = "pullhead";
      pushhead = "git push origin (git rev-parse --abbrev-ref HEAD)";
      gas = "pushhead";
      gasin = "pushhead --force";
      gtmp = "git commit -m \"temp\" --no-verify";
      gf = "git flow";
      gl = "git log --graph --oneline --all";
      gll = "git log --oneline --decorate --all --graph --stat";
      gld = "git log --oneline --all --pretty=format:\"%h%x09%an%x09%ad%x09%s\"";
      gls = "gl --show-signature";
      gfa = "git fetch --all";
      grc = "git rebase --continue";
      gri = "git rebase --interactive";

      # Documentation
      todo = "nvim ${nixConfigDirectory}/notes/todo.norg";
      todox = "nvim ${nixConfigDirectory}/secrets/todo.norg";
      diary = "nvim ${nixConfigDirectory}/notes/diary.norg";
    };
in
{
  home = {
    inherit shellAliases;
    sessionPath = [ "$HOME/.yarn/bin" ];
    packages = [
      pkgs.babelfish
      pkgs.fishPlugins.colored-man-pages
      pkgs.fishPlugins.done
      pkgs.fishPlugins.foreign-env
      pkgs.fishPlugins.forgit
      pkgs.fishPlugins.pisces
      pkgs.fishPlugins.puffer
      pkgs.fishPlugins.fifc
      pkgs.fishPlugins.bass
    ];
  };

  programs.atuin.enable = true;
  programs.atuin.enableFishIntegration = config.programs.fish.enable;
  programs.atuin.enableBashIntegration = config.programs.bash.enable;
  programs.atuin.flags = [ ];
  programs.atuin.settings = { };

  programs.nix-index.enable = true;
  programs.nix-index.enableFishIntegration = config.programs.fish.enable;
  programs.nix-index.enableBashIntegration = config.programs.bash.enable;

  programs.zoxide.enable = true;
  programs.zoxide.enableFishIntegration = config.programs.fish.enable;

  programs.dircolors.enable = true;
  programs.dircolors.enableFishIntegration = config.programs.fish.enable;

  programs.bash.enable = true;
  programs.bash.enableCompletion = true;

  programs.fish.enable = true;
  programs.fish.plugins = with pkgs.fishPlugins; [ nix-env ];
  programs.fish.interactiveShellInit = ''
    # Fish color
    set -U fish_color_command 6CB6EB --bold
    set -U fish_color_redirection DEB974
    set -U fish_color_operator DEB974
    set -U fish_color_end C071D8 --bold
    set -U fish_color_error EC7279 --bold
    set -U fish_color_param 6CB6EB
    set fish_greeting
  '';
  programs.fish.functions = {
    ghds = ''
      for repo in $argv
        gh repo delete $r --yes
      end
    '';
    gitignore = "curl -sL https://www.gitignore.io/api/$argv";
    nd = "nix develop ${nixConfigDirectory}#$argv[1] -c $SHELL";
    rpkgjson = ''
      ${pkgs.nodejs}/bin/node -e "console.log(Object.entries(require('./package.json').$argv[1]).map(([k,v]) => k.concat(\"@\").concat(v)).join(\"\n\") )"
    '';
  };

  programs.starship.enable = true;
  programs.starship.enableFishIntegration = config.programs.fish.enable;
  programs.starship.enableBashIntegration = config.programs.bash.enable;
  programs.starship.enableTransience = config.programs.fish.enable;
  programs.starship.settings =
    let
      withStartLineBreak = s: " ${s}";
      withEndLineBreak = s: "${s} ";
      defaultProgramFormat = withEndLineBreak "[$symbol($version)]($style)";
    in
    {
      add_newline = true;
      command_timeout = 1000;

      cmd_duration = {
        format = withStartLineBreak "[$duration]($style)";
        style = "bold #EC7279";
        show_notifications = true;
      };

      battery = {
        full_symbol = "🔋 ";
        charging_symbol = "⚡️ ";
        discharging_symbol = "💀 ";
      };

      bun.format = defaultProgramFormat;
      git_branch.format = withEndLineBreak "[$symbol$branch]($style)";
      git_status.format = withEndLineBreak "([$all_status$ahead_behind]($style))";
      gcloud.format = withEndLineBreak "[$symbol$active]($style)";
      golang.format = defaultProgramFormat;
      nix_shell.symbol = "❄️";
      nix_shell.format = withEndLineBreak "[$symbol$state]($style)";
      nix_shell.impure_msg = "󰊰";
      nix_shell.pure_msg = "󱨧";
      nodejs.format = defaultProgramFormat;
      ocaml.format = withEndLineBreak "[$symbol($version)(\($switch_indicator$switch_name\))]($style)";
      package.format = withEndLineBreak "[$symbol$version]($style)";
      rust.format = defaultProgramFormat;
      zig.format = defaultProgramFormat;
    };
}
