{ pkgs, ... }:

{
  imports = [
    ./bufferline.nix
    ./dashboard.nix
    ./git.nix
    ./lualine.nix
    ./mini-icons.nix
    ./neo-tree.nix
    ./noice.nix
    ./telescope.nix
    ./toggleterm.nix
    ./treesitter.nix
    ./which-key.nix
  ];

  plugins.lz-n.enable = true;
  extraPackages = with pkgs; [ gh ];
  extraPlugins = [
    pkgs.vimPlugins.telescope-github-nvim
  ];
}
