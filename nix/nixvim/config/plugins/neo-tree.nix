{ icons, ... }:

{
  plugins.neo-tree.enable = true;
  plugins.neo-tree.settings = {
    hide_root_node = true;
    close_if_last_window = false;
    default_component_configs = {
      indent = {
        indent_size = 2;
        padding = 1;
        with_markers = true;
        indent_marker = icons.box_drawing_up;
        last_indent_marker = icons.box_drawing_up_right;
        highlight = "NeoTreeIndentMarker";
        with_expanders = true;
        expander_collapsed = icons.chevron_right;
        expander_expanded = icons.chevron_down;
        expander_highlight = "NeoTreeExpander";
      };
      icon = {
        default = icons.file_text;
        folder_empty = icons.folder_empty;
      };
      file_size = {
        enabled = true;
        width = 12;
        required_width = 40;
      };
    };
    window = {
      position = "left";
      width = 35;
      auto_expand_width = false;
      mapping_options = {
        noremap = true;
        nowait = true;
      };
      mappings = {
        "<space>" = {
          command = "toggle_node";
          config.nowait = false;
        };
        "<C-space>" = {
          command = "toggle_node";
          config.nowait = true;
        };
        "<C-u>" = {
          command = "scroll_preview";
          config.direction = 10;
        };
        "<C-d>" = {
          command = "scroll_preview";
          config.direction = -10;
        };
        "a" = {
          command = "add";
          config.show_path = "relative";
        };
        "A" = {
          command = "add_directory";
          config.show_path = "relative";
        };
      };
    };
    filesystem = {
      follow_current_file = {
        enabled = false;
        leave_dirs_open = false;
      };
      filtered_items = {
        hide_dotfiles = true;
        hide_gitignored = true;
        hide_by_name = [
          ".DS_Store"
          ".cache"
          ".gradle"
          ".idea"
          ".next"
          ".turbo"
          ".vscode"
          "build"
          "dist"
          "node_modules"
          "target"
        ];
        hide_by_pattern = [
          "*.lock"
          "*.log"
          "*.tmp"
        ];
        always_show_by_pattern = [
          ".env*"
        ];
      };
    };
    git_status = {
      window = {
        mappings = {
          "A" = {
            command = "git_add_all";
          };
        };
      };
    };
  };

  plugins.neo-tree.settings.nesting_rules = {
    ####################
    # Basic
    ####################
    "docker" = {
      pattern = "^dockerfile$";
      ignore_case = true;
      files = [
        ".dockerignore"
        "docker-compose.*"
        "dockerfile.*"
      ];
    };
    "node" = {
      pattern = "^package%.json$";
      files = [
        "package-lock.json"
        "yarn.lock"
        "pnpm-lock.yaml"
        "bun.lockb"
        "bun.lock"
      ];
    };

    ####################
    # Javascript
    ####################
    "js-declarations" = {
      priority = 100;
      pattern = "(.+)%.js$";
      files = [
        "%1.d.ts"
        "%1.js.map"
      ];
    };
    "js-base-test" = {
      priority = 100;
      pattern = "(.+)%.js$";
      files = [
        "%1.spec.js"
        "%1.test.js"
        "%1.e2e-spec.js"
        "%1.e2e-test.js"
      ];
    };
    "js-react-test" = {
      priority = 100;
      pattern = "(.+)%.jsx$";
      files = [
        "%1.spec.jsx"
        "%1.test.jsx"
        "%1.e2e-spec.jsx"
        "%1.e2e-test.jsx"
        "%1.stories.jsx"
      ];
    };
    "js-orpc" = {
      priority = 100;
      pattern = "^orpc.js$";
      files = [
        "api.client.js"
        "api.handler.js"
        "api.contract.json"
        "orpc.client.js"
        "orpc.handler.js"
      ];
    };
    "js-router" = {
      priority = 100;
      pattern = "(.+)%.router%.js$";
      files = [ "%1.contract.js" ];
    };
    "js-schema" = {
      priority = 100;
      pattern = "^schema.js$";
      files = [ "*.schema.js" ];
    };
    "js-generator" = {
      priority = 100;
      pattern = "^generator.js$";
      files = [ "*.generator.js" ];
    };

    ####################
    # Typescript
    ####################
    "ts-declarations" = {
      priority = 100;
      pattern = "(.+)%.ts$";
      files = [
        "%1.d.ts"
        "%1.type.ts"
        "%1.interface.ts"
      ];
    };
    "ts-base-test" = {
      priority = 100;
      pattern = "(.+)%.ts$";
      files = [
        "%1.spec.ts"
        "%1.test.ts"
        "%1.e2e-spec.ts"
        "%1.e2e-test.ts"
      ];
    };
    "ts-react-test" = {
      priority = 100;
      pattern = "(.+)%.tsx$";
      files = [
        "%1.spec.tsx"
        "%1.test.tsx"
        "%1.e2e-spec.tsx"
        "%1.e2e-test.tsx"
        "%1.stories.tsx"
      ];
    };
    "ts-orpc" = {
      priority = 100;
      pattern = "^orpc.ts$";
      files = [
        "api.client.ts"
        "api.handler.ts"
        "api.contract.json"
        "orpc.client.ts"
        "orpc.handler.ts"
      ];
    };
    "ts-router" = {
      priority = 100;
      pattern = "(.+)%.router%.ts$";
      files = [ "%1.contract.ts" ];
    };
    "ts-schema" = {
      priority = 100;
      pattern = "^schema.ts$";
      files = [ "*.schema.ts" ];
    };
    "ts-generator" = {
      priority = 100;
      pattern = "^generator.ts$";
      files = [ "*.generator.ts" ];
    };

    ####################
    # Golang
    ####################
    "go-base-test" = {
      priority = 100;
      pattern = "(.+)%.go$";
      files = [ "%1_test.go" ];
    };
    "go-extended-test" = {
      priority = 100;
      pattern = "(.+)%.go$";
      files = [
        "%1_benchmark_test.go"
        "%1_fuzz_test.go"
      ];
    };
    "go-base-mock" = {
      priority = 100;
      pattern = "(.+)%.go$";
      files = [ "%1_mock.go" ];
    };

    ####################
    # Java
    ####################
    "java-base-test" = {
      priority = 100;
      pattern = "(.+)%.java$";
      files = [
        "%1Test.java"
        "%1IT.java"
      ];
    };

    #####################
    # Python
    #####################
    "python-base-test" = {
      priority = 100;
      pattern = "(.+)%.py$";
      files = [
        "test_%1.py"
        "%1_test.py"
      ];
    };

    #####################
    # Rust
    #####################
    "rust-base-test" = {
      priority = 100;
      pattern = "(.+)%.rs$";
      files = [
        "%1_test.rs"
      ];
    };
  };

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>v";
      __unkeyed-2 = "<cmd>Neotree toggle<cr>";
      desc = "Neotree toggle";
      icon = icons.toggle;
    }
  ];
}
