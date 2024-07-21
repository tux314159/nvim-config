vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.winblend = 20

require("tokyonight").setup({
  style = "moon",
  transparent = true,
  terminal_colors = true,
})

vim.cmd[[colorscheme tokyonight]]

require("toggleterm").setup({
  direction = "right",
  winblend = "20",
})
