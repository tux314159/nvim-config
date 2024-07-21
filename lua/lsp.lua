-- Autocomplete
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig
local capabilities = require('cmp_nvim_lsp').default_capabilities()
nvim_lsp = require("lspconfig")
local servers = { "clangd", "pyright", "tsserver", "bashls", "hls", "csharp_ls" }
for k, v in pairs(servers) do
	nvim_lsp[v].setup({capabilities = capabilities})
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
  }
})
vim.cmd("autocmd CursorHold * lua vim.diagnostic.open_float { focusable = false }")
vim.cmd("autocmd CursorHoldI * lua vim.diagnostic.open_float { focusable = false }")


-- LSP UI
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
