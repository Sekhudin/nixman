{ pkgs, ... }:

{
  plugins.avante.enable = true;
  plugins.avante.lazyLoad.settings.cmd = [
    "AvanteAsk"
    "AvanteBuild"
    "AvanteChat"
    "AvanteEdit"
    "AvanteFocus"
    "AvanteRefresh"
    "AvanteSwitchProvider"
    "AvanteShowRepoMap"
    "AvanteToggle"
  ];
  plugins.avante.settings = { };

  plugins.claude-code.enable = true;
  plugins.claude-code.lazyLoad.settings.cmd = [
    "ClaudeCode"
    "ClaudeCodeContinue"
    "ClaudeCodeResume"
    "ClaudeCodeVerbose"
  ];
  plugins.claude-code.settings = {
    command = "claude";
    window = {
      split_ratio = 0.3;
      position = "botright";
      enter_insert = true;
      hide_numbers = true;
      hide_signcolumn = true;
      float = {
        width = "80%";
        height = "80%";
        row = "center";
        col = "center";
        relative = "editor";
        border = "rounded";
      };
    };
    keymaps = {
      toggle = {
        normal = "<C-?>";
        terminal = "<C-?>";
        variants = {
          continue = "<leader>cC";
          verbose = "<leader>cV";
        };
      };
      window_navigation = true;
      scrolling = true;
    };
  };

  ###########################
  # which-key spec
  ###########################
  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>at";
      __unkeyed-2 = "<cmd>AvanteToggle<cr>";
      desc = "Avante Toggle";
    }
    {
      __unkeyed-1 = "<leader>aa";
      __unkeyed-2 = "<cmd>AvanteAsk<cr>";
      desc = "Open AI ask";
    }

    {
      __unkeyed-1 = "<leader>cc";
      __unkeyed-2 = "<cmd>AvanteChat<cr>";
      desc = "Open AI chat";
    }

    {
      __unkeyed-1 = "<leader>ae";
      __unkeyed-2 = "<cmd>AvanteEdit<cr>";
      desc = "Edit with instruction";
    }
  ];
}
