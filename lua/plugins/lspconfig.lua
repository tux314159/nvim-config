return {
  'https://github.com/neovim/nvim-lspconfig',
  lazy = false,
  branch = 'master',
  keys = {
    { '<F2>', vim.lsp.buf.rename },
    { '<C-.>', vim.lsp.buf.code_action },
  },
  config = function ()
    vim.lsp.config('hie', {
      settings = {
        hie = {
          plugin = {
            rename = { config = { crossModule = true }}
          }
        }
      }
    })
    vim.lsp.enable'clangd'
    vim.lsp.enable'csharp_ls'
    vim.lsp.enable'hie'
    vim.lsp.enable'pyright'
    vim.lsp.enable'ruff'
    vim.lsp.enable'rust_analyzer'
  end,
}
