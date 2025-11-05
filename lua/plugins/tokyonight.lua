return {
  'https://github.com/folke/tokyonight.nvim',
  lazy = false,
  priority = 9999,
  config = function() vim.cmd[[colorscheme tokyonight-night]] end
}
