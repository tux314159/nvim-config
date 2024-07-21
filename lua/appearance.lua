vim.o.termguicolors = true

require("tokyonight").setup({
  style = "moon",
  transparent = false,
})

vim.cmd[[colorscheme tokyonight]]
