vim.o.termguicolors = true
vim.o.background = "ligth"

require("tokyonight").setup({
  style = "moon",
  transparent = true,
})

vim.cmd[[colorscheme tokyonight]]
