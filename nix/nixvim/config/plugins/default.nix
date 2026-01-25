{ pkgs, ... }:

{
  imports = [
    ./cmp.nix
    ./dashboard.nix
    ./database.nix
    ./git.nix
    ./lsp.nix
    ./navigation.nix
    ./neo-tree.nix
    ./noice.nix
    ./telescope.nix
    ./toggleterm.nix
    ./tools.nix
    ./treesitter.nix
    ./ui.nix
    ./which-key.nix
  ];

  plugins.lz-n.enable = true;
  extraPackages = with pkgs; [
    gh
    postgresql
  ];
  extraPlugins = [
    pkgs.vimPlugins.telescope-github-nvim
    pkgs.vimPlugins.codi-vim
    pkgs.vimPlugins.neorepl-nvim
  ];
}
