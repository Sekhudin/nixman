{ lib, pkgs, ... }:

let
  me = {
    name = "Sekhudin";
    email = "sekhudinuap@gmail.com";
    signingKey = "6000F3E62D7D6AB8";
  };
in
{

  home.packages = [ pkgs.git-filter-repo ];
  home.shellAliases.ghd = "gh-dash";

  programs.gh-dash.enable = true;

  programs.jujutsu.enable = true;
  programs.jujutsu.settings = {
    user = lib.removeAttrs me [ "signingKey" ];
  };

  programs.gh.enable = true;
  programs.gh.settings.git_protocol = "ssh";
  programs.gh.settings.aliases = {
    co = "pr checkout";
    pv = "pr view";
  };

  programs.git.enable = true;
  programs.git.extraConfig.init.defaultBranch = "main";
  programs.git.extraConfig.gpg.program = "gpg";
  programs.git.extraConfig.rerere.enable = true;
  programs.git.extraConfig.commit.gpgSign = true;
  programs.git.extraConfig.pull.ff = "only";
  programs.git.extraConfig.diff.tool = "vimdiff";
  programs.git.extraConfig.difftool.prompt = false;
  programs.git.extraConfig.merge.tool = "vimdiff";
  programs.git.extraConfig.url = {
    "git@gitlab.com:" = {
      insteadOf = "https://gitlab.com/";
    };
    "git@bitbucket.org:" = {
      insteadOf = "https://bitbucket.org/";
    };
  };
  programs.git.aliases = {
    a = "add";
    c = "clone";
    cfd = "clean -fd";
    ca = "commit --amend";
    can = "commit --amend --no-edit";
    r = "rebase";
    ro = "rebase origin/master";
    rc = "rebase --continue";
    ra = "rebase --abort";
    ri = "rebase -i";
    # need to install vim-conflicted
    res = "!nvim +Conflicted";
    # use for resolve conflicted
    # accept-ours
    aco = "!f() { git checkout --ours -- \"\${@:-.}\"; git add -u \"\${@:-.}\"; }; f";
    # accept-theirs
    ace = "!f() { git checkout --theirs -- \"\${@:-.}\"; git add -u \"\${@:-.}\"; }; f";
    branches = "branch --sort=-committerdate --format='%(HEAD)%(color:yellow) %(refname:short) | %(color:bold red)%(committername) | %(color:bold green)%(committerdate:relative) | %(color:blue)%(subject)%(color:reset)' --color=always";
    bs = "branches";
    fa = "fetch --all";
  };
  programs.git.includes = [
    {
      condition = "gitdir:~/.local/share/";
      contents.user = me;
    }

    {
      condition = "gitdir:~/.config/nixman/";
      contents.user = me;
    }

    {
      condition = "gitdir:~/projects/";
      contents.user = me;
    }

    {
      condition = "gitdir:~/";
      contents.user = me;
    }
  ];
}
