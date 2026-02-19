{ icons, ... }:

{
  plugins.luasnip.enable = true;
  plugins.luasnip.lazyLoad.settings.event = [ "InsertEnter" ];
  plugins.luasnip.settings = {
    enable_autosnippets = true;
    exit_roots = false;
    keep_roots = true;
    link_roots = true;
    update_events = [
      "TextChanged"
      "TextChangedI"
    ];
  };

  plugins.lspkind.enable = true;
  plugins.lspkind.settings = {
    symbolMap = {
      Codeium = icons.code;
      Copilot = icons.robot_face;
      Suggestion = icons.wand;
      TabNine = icons.face;
      Supermaven = icons.star;
      Error = icons.cross_4;
      Hint = icons.hint;
      Info = icons.info_2;
      Warn = icons.warning_2;
      DiagnosticSignError = icons.cross_4;
      DiagnosticSignHint = icons.hint;
      DiagnosticSignInfo = icons.info_2;
      DiagnosticSignWarn = icons.warning_2;
    };
    cmp = {
      enable = true;
      maxWidth = 24;
      after = ''
        function(entry, vim_item, kind)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "   ⌈" .. (strings[2] or "") .. "⌋"
          return kind
        end
      '';
    };
  };

  plugins.cmp.enable = true;
  plugins.cmp.autoEnableSources = true;
  plugins.cmp.cmdline = {
    "/" = {
      mapping.__raw = "cmp.mapping.preset.cmdline()";
      sources = [ { name = "buffer"; } ];
    };
    "?" = {
      mapping.__raw = "cmp.mapping.preset.cmdline()";
      sources = [ { name = "buffer"; } ];
    };
    ":" = {
      mapping.__raw = "cmp.mapping.preset.cmdline()";
      sources = [
        {
          name = "cmdline";
          option.ignore_cmds = [
            "Man"
            "!"
          ];
        }
        { name = "async_path"; }
      ];
    };
  };
  plugins.cmp.settings = {
    experimental.ghost_text = false;
    window = {
      documentation.border = "rounded";
      completion.border = "rounded";
      completion.winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None";
      completion.col_offset = -3;
      completion.side_padding = 0;
    };
    perfomance = {
      debounce = 60;
      fetching_timeout = 200;
      max_view_entries = 30;
    };
    snippet = {
      expand = ''
        function(args)
          require("luasnip").lsp_expand(args.body)
        end
      '';
    };
    formatting = {
      expandable_indicator = true;
      fields = [
        "kind"
        "abbr"
        "menu"
      ];
    };
    mapping = {
      "<C-Space>" = "cmp.mapping.complete()";
      "<C-e>" = "cmp.mapping.abort()";
      "<CR>" = "cmp.mapping.confirm({ select = false })";
      "<C-f>" = "cmp.mapping.scroll_docs(4)";
      "<C-b>" = "cmp.mapping.scroll_docs(-4)";
      "<Tab>" = "cmp.mapping.select_next_item()";
      "<S-Tab>" = "cmp.mapping.select_prev_item()";
    };
    sources = [
      {
        name = "nvim_lsp";
        group_index = 1;
      }
      {
        name = "nvim_lsp_signature_help";
        group_index = 1;
      }
      {
        name = "luasnip";
        group_index = 1;
      }
      {
        name = "vim-dadbod-completion";
        group_index = 1;
      }
      {
        name = "nvim_lsp_document_symbol";
        group_index = 2;
      }
      {
        name = "buffer";
        group_index = 2;
      }

      {
        name = "async_path";
        group_index = 3;
      }

      {
        name = "npm";
        keyword_length = 4;
        group_index = 4;
      }
      {
        name = "emoji";
        trigger_characters = [ ":" ];
        group_index = 4;
      }
      {
        name = "calc";
        group_index = 4;
      }
      {
        name = "yanky";
        group_index = 4;
      }
    ];
  };

  plugins.which-key.settings.spec = [ ];
}
