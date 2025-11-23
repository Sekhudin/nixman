{
  helpers,
  icons,
  pkgs,
  ...
}:

let
  mkLuaFun = lua: ''
    function()
      ${lua}
    end
  '';
in
{
  colorscheme = "edge";

  highlight."@neorg.tags.ranged_verbatim.code_block".link = "Fg";

  opts.list = true;
  opts.listchars = "eol:${icons.eol},nbsp:+,tab:${icons.tab} ,trail:-";
  opts.foldmethod = "expr";
  opts.foldexpr = "v:lua.vim.treesitter.foldexpr()";
  opts.foldcolumn = "0";
  opts.foldtext = "";
  opts.foldlevel = 99;
  opts.foldlevelstart = 1;
  opts.foldnestmax = 4;

  globals.elite_mode = 1;
  globals.loaded_netrw = 1;
  globals.loaded_netrwPlugin = 1;
  globals.edge_style = "neon";
  globals.edge_diagnostic_text_highlight = 1;
  globals.edge_diagnostic_line_highlight = 1;
  globals.edge_diagnostic_virtual_text = "grey";
  globals.edge_dim_foreground = 1;
  globals.edge_dim_inactive_windows = 1;
  globals.edge_float_style = "bright";

  extraConfigLuaPre = ''
    if vim.fn.has('termguicolors') == 1 then
      vim.opt.termguicolors = true
    end
  '';

  autoCmd = [
    {
      event = [ "User" ];
      pattern = "LspProgressStatusUpdated";
      callback.__raw = mkLuaFun ''
        require('lualine').refresh()
      '';
    }
  ];

  extraPlugins = with pkgs.vimPlugins; [
    # theme
    edge
    lackluster-nvim
    midnight-nvim

    # extra
    unicode-vim
    lsp-progress-nvim
    pkgs.branches.master.vimPlugins.nvzone-typr
  ];

  userCommands.StatusLine.desc = "Toggle Status Line";
  userCommands.StatusLine.command.__raw = mkLuaFun ''
    local toggle = function()
      if vim.g.unhide_lualine == nil then
        vim.g.unhide_lualine = true
      end  
      vim.g.unhide_lualine = not vim.g.unhide_lualine
      return vim.g.unhide_lualine
    end
    require('lualine').hide({ unhide = toggle() })
  '';

  ##################################
  # plugins
  ##################################
  plugins.cursorline.enable = true;

  plugins.rainbow-delimiters.enable = true;

  plugins.wakatime.enable = true;
  plugins.wakatime.autoLoad = false;

  plugins.image.enable = true;
  plugins.image.settings = {
    integrations.neorg.enabled = true;
    editor_only_render_when_focused = true;
    tmux_show_only_in_active_window = true;
  };

  plugins.presence.enable = true;
  plugins.presence.settings = {
    enableLineNumber = true;
    autoUpdate = true;
  };

  plugins.colorizer.enable = true;
  plugins.colorizer.lazyLoad.settings.cmd = [ "ColorizerToggle" ];
  plugins.colorizer.settings = {
    user_default_options = {
      mode = "virtualtext";
      virtualtext = " ■";
      RRGGBBAA = true;
      RRGGBB = true;
      AARRGGBB = true;
    };
  };

  plugins.nvim-tree.enable = true;
  plugins.nvim-tree.settings = {
    view.side = "left";
    view.width = 25;
    git.enable = true;
    filters.dotfiles = true;
  };

  plugins.indent-blankline.enable = true;
  plugins.indent-blankline.settings.indent.char = "";
  plugins.indent-blankline.settings.scope.enabled = true;
  plugins.indent-blankline.settings.scope.char = icons.indent;
  plugins.indent-blankline.settings.whitespace.highlight = [ "Whitespace" ];
  plugins.indent-blankline.settings.exclude.buftypes = [
    "nofile"
    "terminal"
    "neorg"
  ];
  plugins.indent-blankline.settings.exclude.filetypes = [
    "norg"
    "NvimTree"
    "sagaoutline"
    "help"
    "terminal"
    "dashboard"
    "lspinfo"
    "TelescopePrompt"
    "TelescopeResults"
  ];

  plugins.smear-cursor.enable = true;
  plugins.smear-cursor.lazyLoad.enable = true;
  plugins.smear-cursor.lazyLoad.settings.event = "InsertEnter";
  plugins.smear-cursor.lazyLoad.settings.cmd = "SmearCursorToggle";
  plugins.smear-cursor.lazyLoad.settings.keys = [
    {
      __unkeyed-1 = "tsc";
      __unkeyed-2 = "<cmd>SmearCursorToggle<cr>";
      desc = "Toggle Animation Cursor";
    }
  ];

  plugins.web-devicons.enable = true;
  plugins.web-devicons.customIcons = {
    norg = {
      icon = icons.language.org;
      color = "#389EDD";
      cterm_color = "65";
      name = "Norg";
    };
    re = {
      icon = icons.language.reason;
      color = "#DE4B39";
      cterm_color = "65";
      name = "ReasonML";
    };
    dune = {
      icon = icons.language.reason;
      color = "#F5DF36";
      cterm_color = "65";
      name = "Dune";
    };
    dune-project = {
      icon = icons.language.reason;
      color = "#F5DF36";
      cterm_color = "65";
      name = "Dune";
    };
  };

  plugins.lz-n.enable = true;
  plugins.lz-n.plugins = [
    {
      __unkeyed-1 = "unicode.vim";
      cmd = [
        "Digraphs"
        "DigraphsNew"
        "UnicodeNew"
        "UnicodeSearch"
        "UnicodeTable"
        "UnicodeCache"
      ];
    }
    {
      __unkeyed-1 = "nvim-tree.lua";
      cmd = [
        "NvimTreeToggle"
        "NvimTreeOpen"
        "NvimTreeClose"
        "NvimTreeRefresh"
        "NvimTreeFindFile"
      ];
    }
    {
      __unkeyed-1 = "typr";
      cmd = [
        "Typr"
        "TyprStats"
      ];
    }
  ];

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<c-n>";
      __unkeyed-2 = "<cmd>NvimTreeToggle<CR>";
      desc = "Open Tree in left side";
    }

    {
      __unkeyed-1 = "ts";
      __unkeyed-2 = "<cmd>StatusLine<cr>";
      desc = "Toggle Status Line";
    }

    {
      __unkeyed-1 = "ti";
      __unkeyed-2 = "<cmd>IBLToggle<cr>";
      desc = "Toggle Indent Blankline";
    }

    {
      __unkeyed-1 = "tc";
      __unkeyed-2 = "<cmd>ColorizerToggle<cr>";
      desc = "Toggle Colorizer";
    }
  ];

  plugins.nvim-ufo.enable = true;
  plugins.nvim-ufo.lazyLoad.settings.event = "BufEnter";
  plugins.nvim-ufo.settings.provider_selector = ''
    function(bufnr, filetype, buftype)
      local ftMap = {
        vim = "indent",
        python = {"indent"},
        git = "",
        dashboard = "",
        Avante = "",
        AvanteSelectedFiles = "",
        AvanteInput = "",
      }
     return ftMap[filetype]
    end
  '';
  plugins.nvim-ufo.settings.fold_virt_text_handler = ''
    function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = ('  %d '):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, {chunkText, hlGroup})
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, {suffix, 'MoreMsg'})
      return newVirtText
    end
  '';

  plugins.lualine.enable = true;
  plugins.lualine.lazyLoad.settings.event = "BufEnter";
  plugins.lualine.lazyLoad.settings.cmd = [ "StatusLine" ];
  plugins.lualine.lazyLoad.settings.before.__raw = ''
    require('lsp-progress').setup()
  '';
  plugins.lualine.settings.theme = "edge";
  plugins.lualine.settings.options.disabled_filetypes.__unkeyed-1 = "NvimTree";
  plugins.lualine.settings.options.disabled_filetypes.statusline = [
    "sagaoutline"
    "Trouble"
  ];
  plugins.lualine.settings.options.component_separators.left = "";
  plugins.lualine.settings.options.component_separators.right = "";
  plugins.lualine.settings.options.section_separators.left = icons.circleRight;
  plugins.lualine.settings.options.section_separators.right = icons.circleLeft;
  plugins.lualine.settings.sections.lualine_a = [
    {
      __unkeyed-1 = "mode";
      separator.right = icons.circleRight;
      padding.left = 1;
    }
  ];
  plugins.lualine.settings.sections.lualine_b = [
    {
      __unkeyed-1 = "branch";
      color.fg = "BlueSign";
    }
    "diff"
  ];
  plugins.lualine.settings.sections.lualine_c = [
    "diagnostics"
  ];
  plugins.lualine.settings.sections.lualine_x = [
    "searchcount"
    "selectioncount"
  ];
  plugins.lualine.settings.sections.lualine_y = [
    {
      __unkeyed-1.__raw = ''
        (function()
          local ft = require('lualine.components.filetype'):extend()
          local lsp_progress = require('lsp-progress')

          function ft:update_status()
            local data = ft.super.update_status(self)
            return lsp_progress.progress({
              max_size = 50,
              format = function(messages)
                  if #messages > 0 then
                      return table.concat(messages, " ")
                  end
                  return data
              end,
            })
          end

          return ft
        end)()
      '';
    }
    "progress"
  ];
  plugins.lualine.settings.sections.lualine_z = [
    {
      __unkeyed-1 = "location";
      separator.left = icons.circleLeft;
      padding.right = 1;
    }
  ];
  plugins.lualine.settings.winbar = { };
  plugins.lualine.settings.tabline = { };
  plugins.lualine.settings.extensions = [ ];

  plugins.treesitter.enable = true;
  plugins.treesitter.lazyLoad.enable = true;
  plugins.treesitter.lazyLoad.settings.event = "BufRead";
  plugins.treesitter.folding = true;
  plugins.treesitter.settings.indent.enable = true;
  plugins.treesitter.settings.highlight.enable = true;
  plugins.treesitter.grammarPackages =
    builtins.map
      (
        x:
        pkgs.vimPlugins.nvim-treesitter.builtGrammars.${x} or pkgs.tree-sitter-grammars."tree-sitter-${x}"
      )
      [
        "asm"
        "bash"
        "c"
        "cmake"
        "comment"
        "css"
        "dhall"
        "diff"
        "dockerfile"
        "dot"
        "fish"
        "git_config"
        "git_rebase"
        "gitattributes"
        "gitcommit"
        "gitignore"
        "go"
        "gomod"
        "gosum"
        "gotmpl"
        "gpg"
        "graphql"
        "hcl"
        "helm"
        "html"
        "http"
        "javascript"
        "jq"
        "jsdoc"
        "json"
        "latex"
        "lua"
        "luadoc"
        "luap"
        "luau"
        "make"
        "markdown"
        "markdown_inline"
        "mermaid"
        "nix"
        "norg"
        "norg-meta"
        "passwd"
        "po"
        "proto"
        "pymanifest"
        "python"
        "query"
        "regex"
        "rust"
        "sql"
        "ssh_config"
        "templ"
        "terraform"
        "textproto"
        "tmux"
        "todotxt"
        "toml"
        "tsx"
        "typescript"
        "vhs"
        "vim"
        "vimdoc"
        "xml"
        "yaml"
      ];
}
