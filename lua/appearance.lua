vim.o.termguicolors = true

require("tokyonight").setup({
  style = "moon",
  transparent = true,
})

vim.cmd[[colorscheme tokyonight]]
