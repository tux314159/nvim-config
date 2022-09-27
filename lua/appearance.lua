vim.o.termguicolors = true

require('nightfox').setup({
  options = {
    transparent = false,
    styles = {
      comments = "italic",
      keywords = "bold",
      types = "italic,bold",
    },
    inverse = {
      match_paren = false,
      visual = false,
      search = false,
    },
  },
  palettes = {
    duskfox = {
      -- bg1 = "#272822"
    }
  }
})
vim.cmd("colorscheme duskfox")

local spec = require('nightfox.spec').load("duskfox")
vim.cmd("hi FloatermBorder guibg=" .. spec.palette.bg1)
vim.cmd("hi NormalFloat guibg=" .. spec.palette.bg1)
vim.cmd("hi link TreesitterContext guibg=" .. spec.palette.bg1)
