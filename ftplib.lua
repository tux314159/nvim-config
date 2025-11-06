local M = {}

function M.fmt_autocmd(fmt)
  if not fmt then
    fmt = function()
      vim.lsp.buf.format({ async = false })
    end
  end
  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = 0,
    callback = function()
      vim.lsp.buf.format({ async = false })
    end,
  })
end

return M
