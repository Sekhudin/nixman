{ ... }:

{
  imports = [
    ./bufferline.nix
    ./dashboard.nix
    ./lualine.nix
    ./mini-icons.nix
    ./neo-tree.nix
    ./noice.nix
    ./telescope.nix
    ./treesitter.nix
    ./web-devicons.nix
    ./which-key.nix
  ];

  plugins.auto-save = {
    enable = true;
    settings.debounce_delay = 100;
  };
}
