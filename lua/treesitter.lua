require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  --indent = {
    --enable = true,
  --},

  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" },
    extended_mode = true,
    max_file_lines = nil,
  }
}

-- Folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
