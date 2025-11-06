local M = {}

function M.fmt_autocmd()
  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = 0,
    callback = function()
      vim.lsp.buf.format({ async = false })
    end,
  })
}

return M
