{ ... }:

{
  imports = [
    ./ai.nix
    ./cmp-snippets.nix
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

  extraPlugins = [ ];

  plugins.lz-n.enable = true;
  plugins.lz-n.plugins = [ ];
}
