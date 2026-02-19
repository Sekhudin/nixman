{ ... }:

{
  plugins.luasnip.luaConfig.pre = ''
    -- import basic nodes
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local c = ls.choice_node
    local f = ls.function_node
    local d = ls.dynamic_node

    -- ================================
    -- TypescriptReact
    -- ================================
    ls.add_snippets("typescriptreact", {

      -- className snippet
      s("className", {
        t("className={\""),
        i(1),
        t("\"}")
      }),

      -- style snippet
      s("style", {
        t("style={{"),
        i(1),
        t("}}")
      }),

      -- onClick snippet
      s("onClick", {
        t("onClick={() => {"),
        i(1),
        t("}}")
      }),

      -- simple console.log snippet
      s("clg", {
        t("console.log("),
        i(1),
        t(");")
      }),

      -- function snippet
      s("fun", {
        t("function "),
        i(1, "name"),
        t("("),
        i(2),
        t(") {"),
        t({ "", "\t" }),
        i(0),
        t({ "", "}" })
      }),
    })

    -- ================================
    -- JavascriptReact
    -- ================================
    ls.add_snippets("javascriptreact", ls.get_snippets("typescriptreact"))

    -- ================================
    -- Typescript
    -- ================================
    ls.add_snippets("typescript", ls.get_snippets("typescriptreact"))

    -- ================================
    -- Javascript
    -- ================================
    ls.add_snippets("javascript", ls.get_snippets("typescriptreact"))
  '';
}
