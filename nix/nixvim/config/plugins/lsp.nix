{ ... }:

{
  plugins.crates.enable = false;
  plugins.crates.lazyLoad.settings.ft = [ "rust" ];

  plugins.rustaceanvim.enable = false;
  plugins.rustaceanvim.lazyLoad.settings.ft = [ "rust" ];

  plugins.typescript-tools.enable = false;
  plugins.typescript-tools.settings = {
    code_lens = "references_only";
    complete_function_calls = true;
    expose_as_code_action = "all";
  };
}
