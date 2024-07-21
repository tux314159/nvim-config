vim.o.termguicolors = true
vim.o.background = "dark"

require("tokyonight").setup({
  style = "moon",
  transparent = true,
  terminal_colors = false,
})

vim.cmd[[colorscheme tokyonight]]
