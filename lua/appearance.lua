vim.o.termguicolors = true
vim.o.background = "dark"

require("tokyonight").setup({
  style = "moon",
  transparent = true,
})

vim.cmd[[colorscheme tokyonight]]
