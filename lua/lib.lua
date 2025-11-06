local M = {}

function M.buflocal_autofmt(cmd)
  fmt = function()
    vim.lsp.buf.format({ async = false })
  end
  if cmd then
    fmt = function()
      vim.cmd('%!' .. cmd)
    end
  end

  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = 0,
    callback = fmt
  })
end

return M
