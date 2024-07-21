vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.winblend = 40

require("tokyonight").setup({
  style = "moon",
  transparent = true,
  terminal_colors = true,
})

vim.cmd[[colorscheme tokyonight]]

require("toggleterm").setup(direction = "float")
