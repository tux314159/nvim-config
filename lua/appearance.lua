vim.o.termguicolors = true

require("tokyonight").setup({
  style = "night",
  transparent = true,
})

vim.cmd[[colorscheme tokyonight]]
