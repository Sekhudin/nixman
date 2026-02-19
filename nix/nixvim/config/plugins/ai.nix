{
  pkgs,
  icons,
  helper,
  ...
}:

{
  ##########################
  # Claude Code
  ##########################
  extraPlugins = with pkgs.vimPlugins; [
    claudecode-nvim
  ];

  plugins.lz-n.plugins = [
    {
      __unkeyed-1 = pkgs.vimPlugins.claudecode-nvim.name;
      cmd = [
        "ClaudeCode"
        "ClaudeCodeFocus"
        "ClaudeCodeDiffDeny"
        "ClaudeCodeDiffAccept"
      ];
      after.__raw = helper.mkLuaFun ''
        require("claudecode").setup({
          terminal = {
            split_side = "right",
            split_width_percentage = 0.30,
            provider = "native",
            auto_close = true,
            snacks_win_opts = { },
          },
        })
      '';
    }
  ];

  ##########################
  # Avante
  ##########################
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
  plugins.avante.settings = {
    provider = "deepseek_local";
    diff = {
      autojump = true;
      debug = false;
      list_opener = "copen";
    };
    highlights = {
      diff = {
        current = "GitConflictAncestor";
        incoming = "GitConflictIncoming";
      };
    };
    hints = {
      enabled = true;
    };
    windows = {
      position = "right";
      wrap = false;
      input = {
        prefix = "${icons.chevron_right}";
      };
    };
  };
  plugins.avante.settings.providers = rec {
    claude = {
      api_key_name = "cmd:pass show syaikhu/claude.api.key";
      endpoint = "https://api.anthropic.com";
      model = "claude-3-7-sonnet-20250219";
      timeout = 30000;
      extra_request_body = {
        temperature = 0.7;
        max_tokens = 20000;
      };
    };
    qwen_local = {
      __inherited_from = "ollama";
      api_key_name = "";
      endpoint = "http://127.0.0.1:11434";
      model = "qwen2.5-coder";
      timeout = 30000;
    };
    deepseek_local = qwen_local // {
      __inherited_from = "ollama";
      model = "deepseek-coder:1.3b";
    };
  };

  ###########################
  # which-key spec
  ###########################
  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>cc";
      __unkeyed-2 = "<cmd>ClaudeCode<cr>";
      desc = "Claude toggle";
    }
    {
      __unkeyed-1 = "<leader>cf";
      __unkeyed-2 = "<cmd>ClaudeCodeFocus<cr>";
      desc = "Claude focus";
    }
    {
      __unkeyed-1 = "<leader>ca";
      __unkeyed-2 = "<cmd>ClaudeCodeDiffAccept<cr>";
      desc = "Claude diff accept";
    }
    {
      __unkeyed-1 = "<leader>cd";
      __unkeyed-2 = "<cmd>ClaudeCodeDiffDeny<cr>";
      desc = "Claude diff deny";
    }
    ###########################
    # Avante
    ###########################
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
      __unkeyed-1 = "<leader>ac";
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
