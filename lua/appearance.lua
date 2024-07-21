vim.o.termguicolors = true
vim.o.background = "dark"

require("tokyonight").setup({
  style = "moon",
  transparent = true,
  terminal_colors = true,
})

vim.cmd[[colorscheme tokyonight]]
