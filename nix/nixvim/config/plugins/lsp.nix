{
  lib,
  pkgs,
  icons,
  inputs,
  ...
}:

{
  extraPackages = with pkgs; [
    biome
    prettierd
    nodePackages.prettier

    shfmt
    stylua
    nixfmt
    ruff
    rustfmt
    sqruff
  ];

  plugins.crates.enable = false;
  plugins.crates.lazyLoad.settings.ft = [ "rust" ];

  plugins.conform-nvim.enable = true;
  plugins.conform-nvim.settings = {
    default_format_opts = {
      stop_after_first = true;
      lsp_format = "fallback";
    };
    formatters_by_ft = {
      sh = [ "shfmt" ];
      lua = [ "stylua" ];
      css = [ "prettierd" ];
      html = [ "prettierd" ];
      python = [ "ruff_format" ];
      rust = [ "rustfmt" ];
      sql = [ "sqruff" ];
      yaml = [ "prettierd" ];
      markdown = [ "prettierd" ];
      javascript = [
        "biome"
        "prettierd"
      ];
      typescript = [
        "biome"
        "prettierd"
      ];
      javascriptreact = [
        "biome"
        "prettierd"
      ];
      typescriptreact = [
        "biome"
        "prettierd"
      ];
      json = [
        "biome"
      ];
    };
  };

  plugins.lspsaga.enable = true;
  plugins.lspsaga.settings = {
    lightbulb.sign = false;
    lightbulb.virtualText = true;
    lightbulb.debounce = 40;
    ui.codeAction = icons.gear_sm;
  };

  plugins.rustaceanvim.enable = false;
  plugins.rustaceanvim.lazyLoad.settings.ft = [ "rust" ];

  plugins.lsp.enable = true;
  plugins.lsp.servers = {
    #########################
    # Bash
    #########################
    bashls.enable = true;
    bashls.autostart = true;

    #########################
    # CSS
    #########################
    tailwindcss.enable = true;
    tailwindcss.autostart = true;
    tailwindcss.filetypes = [
      "html"
      "css"
      "javascript"
      "typescript"
      "javascriptreact"
      "typescriptreact"
    ];
    tailwindcss.settings = {
      tailwindCSS.classFunctions = [
        "tw"
        "clsx"
        "tw\\.[a-z-]+"
      ];
      tailwindCSS.experimental.classRegex = [
        "cn\\(([^)]*)\\)"
        "clsx\\(([^)]*)\\)"
        "cva\\(([^)]*)\\)"
      ];
    };

    #########################
    # Clang
    #########################
    ccls.enable = true;
    ccls.autostart = true;

    #########################
    # Docker
    #########################
    dockerls.enable = true;
    dockerls.autostart = true;

    #########################
    # Go
    #########################
    gopls.enable = true;
    gopls.autostart = true;
    gopls.extraOptions.settings.gopls.hints = {
      assignVariableTypes = true;
      compositeLiteralFields = true;
      compositeLiteralTypes = true;
      constantValues = true;
      functionTypeParameters = true;
      parameterNames = true;
      rangeVariableTypes = true;
    };

    #########################
    # Java
    #########################
    jdtls.enable = false;
    jdtls.autostart = true;

    #########################
    # Javascript & Typescript
    #########################
    biome.enable = true;
    biome.autostart = true;
    tsgo.enable = false;
    tsgo.autostart = true;
    ts_ls.enable = true;
    ts_ls.autostart = true;
    ts_ls.extraOptions.root_dir = ''
      require("lspconfig.util").root_pattern(
        "tsconfig.json",
        "package.json",
        ".git"
      )
    '';

    #########################
    # Lua
    #########################
    lua_ls.enable = true;
    lua_ls.autostart = true;

    #########################
    # Nix
    #########################
    nixd.enable = true;
    nixd.autostart = true;
    nixd.settings = {
      nixpkgs.expr = ''import "${inputs.nixpkgs.outPath}" { }'';
      formatting.command = [ "${lib.getExe pkgs.nixfmt}" ];
      diagnostic.suppress = [ "sema-escaping-with" ];
    };

    #########################
    # Python
    #########################
    pyright.enable = true;
    pyright.autostart = true;

    #########################
    # Rust
    #########################
    rust_analyzer.enable = true;
    rust_analyzer.autostart = true;
    rust_analyzer.installCargo = false;
    rust_analyzer.installRustc = false;

    #########################
    # Other
    #########################
    emmet_ls.enable = true;
    emmet_ls.autostart = true;
    # htmx.enable = true;
    # htmx.autostart = true;
    marksman.enable = true;
    marksman.autostart = true;
    yamlls.enable = true;
    yamlls.autostart = true;
    jsonls.enable = true;
    jsonls.autostart = true;
    jsonls.extraOptions.settings.json.validate.enable = true;
    jsonls.extraOptions.settings.json.schemas = [
      {
        url = "https://turbo.build/schema.json";
        description = "Turbo.build configuration file";
        fileMatch = [ "turbo.json" ];
      }
      {
        url = "https://json.schemastore.org/tsconfig.json";
        description = "Typescript compiler configuration file";
        fileMatch = [
          "tsconfig.json"
          "tsconfig.*.json"
        ];
      }
      {
        url = "https://raw.githubusercontent.com/nix-community/nixd/main/nixd/docs/nixd-schema.json";
        description = "nixd schema";
        fileMatch = [
          ".nixd.json"
          "nixd.json"
        ];
      }
    ];
  };

  plugins.which-key.settings.spec = [
    #########################################
    # LSP navigation
    #########################################
    {
      __unkeyed-1 = "K";
      __unkeyed-2 = "<cmd>Lspsaga hover_doc<cr>";
      desc = "Hover Documentation";
    }
    {
      __unkeyed-1 = "gd";
      __unkeyed-2 = "<cmd>Lspsaga peek_definition<cr>";
      desc = "Peek Definition";
    }
    {
      __unkeyed-1 = "gD";
      __unkeyed-2 = "<cmd>Lspsaga goto_definition<cr>";
      desc = "Go to Definition";
    }
    {
      __unkeyed-1 = "ga";
      __unkeyed-2 = "<cmd>Lspsaga code_action<cr>";
      desc = "Code Action";
    }
    {
      __unkeyed-1 = "gr";
      __unkeyed-2 = "<cmd>Lspsaga rename<cr>";
      desc = "Rename Symbol";
    }
    {
      __unkeyed-1 = "gF";
      __unkeyed-2 = "<cmd>Lspsaga finder<cr>";
      desc = "LSP Finder";
    }
    #########################################
    # LSP actions & toggles
    #########################################
    {
      __unkeyed-1 = "<leader>lf";
      __unkeyed-2 = "<cmd>lua require('conform').format({ async = false }); vim.cmd('update')<cr>";
      desc = "[LSP] Format Buffer";
    }
    {
      __unkeyed-1 = "<leader>li";
      __unkeyed-2 = "<cmd>LspInlay<cr>";
      desc = "[LSP] Toggle Inlay Hints";
    }
    {
      __unkeyed-1 = "<leader>lo";
      __unkeyed-2 = "<cmd>Lspsaga outline<cr>";
      desc = "[LSP] Outline";
    }
    {
      __unkeyed-1 = "<leader>lI";
      __unkeyed-2 = "<cmd>LspInfo<cr>";
      desc = "[LSP] Info";
    }
    {
      __unkeyed-1 = "<leader>lc";
      __unkeyed-2 = "<cmd>Lspsaga incoming_calls<cr>";
      desc = "[LSP] Incoming Calls";
    }
    {
      __unkeyed-1 = "<leader>lC";
      __unkeyed-2 = "<cmd>Lspsaga outgoing_calls<cr>";
      desc = "[LSP] Outgoing Calls";
    }
  ];
}
