nvim_lsp = require("lspconfig")
local servers = { "clangd", "pyright", "tsserver", "bashls", "hls", "csharp_ls" }
for k, v in pairs(servers) do
	nvim_lsp[v].setup({})
end

nvim_lsp.rls.setup {
  settings = {
    rust = {
      unstable_features = true,
      build_on_save = false,
      all_features = true,
    },
  },
}

vim.diagnostic.config({
  virtual_text = false,
  float = {
    scope = "cursor",
    border = "rounded"
  }
})
vim.cmd("autocmd CursorHold * lua vim.diagnostic.open_float { focusable = false }")
vim.cmd("autocmd CursorHoldI * lua vim.diagnostic.open_float { focusable = false }")

-- LSP UI
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
