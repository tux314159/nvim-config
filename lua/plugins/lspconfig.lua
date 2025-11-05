return {
  'https://github.com/neovim/nvim-lspconfig',
  lazy = false,
  branch = 'master',
  keys = {
    { '<F2>', vim.lsp.buf.rename },
    { '<C-.>', vim.lsp.buf.code_action },
  },
  config = function ()
    vim.lsp.config('hls', {
      settings = {
        haskell = {
          plugin = {
            rename = { config = { crossModule = true }}
          }
        }
      }
    })
    vim.lsp.enable'hls'
    vim.lsp.enable'clangd'
  end,
}
