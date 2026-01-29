{ pkgs, ... }:

{
  imports = [
    ./ai.nix
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

  extraPackages = with pkgs; [
    gh
    postgresql
  ];

  extraPlugins = with pkgs.vimPlugins; [
    neorepl-nvim
    nvim-sops
    telescope-github-nvim
  ];

  extraConfigLuaPost = "require('nvim_sops').setup()";

  plugins.lz-n.enable = true;
  plugins.lz-n.plugins = [
    {
      __unkeyed-1 = pkgs.vimPlugins.neorepl-nvim.name;
      cmd = [ "Repl" ];
    }
    {
      __unkeyed-1 = "nvim-sops";
      cmd = [
        "SopsDecrypt"
        "SopsEncrypt"
      ];
    }
  ];
}
