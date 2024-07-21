vim.o.termguicolors = true

vim.cmd[[colorscheme tokyonight]]

local spec = require('nightfox.spec').load("duskfox")
vim.cmd("hi FloatermBorder guibg=" .. spec.palette.bg1)
vim.cmd("hi NormalFloat guibg=" .. spec.palette.bg1)

vim.cmd("hi TreesitterContext guibg=" .. spec.palette.bg2)
