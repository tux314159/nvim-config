set = require'set'
set'local' 'shiftwidth' (2)
set'local' 'expandtab' (true)

ftp = require'ftplib'

vim.api.nvim_create_autocmd('BufWritePre', {
  buffer = 0,
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
