{ pkgs, ... }:

{
  imports = [
    ./bufferline.nix
    ./dashboard.nix
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
  extraPackages = with pkgs; [ gh ];
  extraPlugins = [
    pkgs.vimPlugins.telescope-github-nvim
  ];
}
