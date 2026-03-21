local M = {}

function M.buflocal_autofmt(cmd)
  if vim.g.no_autofmt then
      return
  end
  fmt = function()
    vim.lsp.buf.format({ async = false })
  end
  if cmd then
    fmt = function()
      vim.cmd 'mkview'
      vim.cmd('%!' .. cmd)
      if vim.v.shell_error ~= 0 then
        vim.cmd 'undo'
      end
      vim.cmd 'loadview'
    end
  end
  local fmtgrp = vim.api.nvim_create_augroup('autoformat', { clear = true })
  vim.api.nvim_create_autocmd('BufWritePre', {
    buffer = 0,
    callback = fmt,
    group = fmtgrp
  })
end

return M
