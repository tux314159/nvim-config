ftp = require'ftplib'
set = require'set'
set'local' 'shiftwidth' (2)
set'local' 'expandtab' (true)

vim.api.nvim_create_autocmd('BufWritePre', {
  buffer = 0,
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
