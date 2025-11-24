-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.textwidth = 80
vim.opt.formatoptions:append("t")
vim.opt.breakindent = true -- indent wrapped lines
vim.opt.showbreak = "↳ " -- visual cue for wrapped lines (optional, pick a glyph or space)

require("tokyonight").setup({
  style = "storm", -- or "night" / "moon" / "day"
  on_highlights = function(hl, colors)
    hl.Comment = { fg = "#7aa2f7", italic = true } -- bright blue comments
    hl.LineNr = { fg = "#3b4261" } -- dull for absolute line numbers
    hl.LineNrAbove = { fg = "#545c7e" }
    hl.LineNrBelow = { fg = "#545c7e" }
    hl.CursorLineNr = { fg = "#e0af68", bold = true } -- gold highlight for current line
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = ".dart",
  callback = function()
    vim.cmd("FlutterReload")
  end,
})

vim.cmd([[colorscheme tokyonight]])
