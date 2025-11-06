local M = {}

function M.buflocal_autofmt(cmd)
  if not cmd then
    fmt = function()
      vim.lsp.buf.format({ async = false })
    end
  end

  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = 0,
    callback = fmt
  })
end

return M
