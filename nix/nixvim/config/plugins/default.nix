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
    ./secrets.nix
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

  extraPlugins = with pkgs.vimPlugins; [
    codi-vim
    neorepl-nvim
    telescope-github-nvim
    nvim-sops
  ];
}
