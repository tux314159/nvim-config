vim.o.termguicolors = true
vim.o.background = "light"

require("tokyonight").setup({
  style = "moon",
  transparent = true,
})

vim.cmd[[colorscheme tokyonight]]
