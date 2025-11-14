function enable_ts(langs)
  require'nvim-treesitter'.install(langs)
  for _, l in pairs(langs) do
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { l },
      callback = function()
        vim.treesitter.start()
	vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
	--vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end
end

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function() enable_ts({'haskell', 'c', 'lua', 'markdown'}) end
}
