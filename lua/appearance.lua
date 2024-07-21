vim.o.termguicolors = true

require("tokyonight").setup({
  style = "day",
  transparent = false,
})

vim.cmd[[colorscheme tokyonight]]
