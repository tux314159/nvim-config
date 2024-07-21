vim.o.termguicolors = true

require("tokyonight").setup({
  style = "day",
  transparent = true,
})

vim.cmd[[colorscheme tokyonight]]
