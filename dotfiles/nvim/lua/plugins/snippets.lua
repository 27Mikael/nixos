return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      -- require("luasnip.loaders.from_lua").load({ paths = "~/config/nvim/snippets"})
      require("luasnip.loaders.from_vscode").lazy_load()
      require'luasnip'.filetype_extend("dart", {"flutter"})
    end,
  },
}
