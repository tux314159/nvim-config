-- Treesitter

local config = {
  plugins = {
    {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require'nvim-treesitter.configs'.setup({
          ensure_installed = "all",

          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },

          --indent = {
            --enable = true,
          --},

          rainbow = {
            enable = true,
            -- disable = { "jsx", "cpp" },
            extended_mode = true,
            max_file_lines = nil,
          },
        }),
      end
    },

    {
      "neovim/nvim-lspconfig",
      config = function ()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        local nvim_lsp = require("lspconfig")
        local servers = {
          "clangd",
          "pyright",
          "tsserver",
          "bashls",
          "hls",
          "csharp_ls",
          "lua_ls"
        }
        for _, v in pairs(servers) do
          nvim_lsp[v].setup({capabilities = capabilities})
        end

        nvim_lsp.lua_ls.setup {
          on_init = function(client)
            local path = client.workspace_folders[1].name
            if vim.loop.fs_stat(path.."/.luarc.json") or
              vim.loop.fs_stat(path.."/.luarc.jsonc") then
              return
            end

            client.config.settings.Lua = vim.tbl_deep_extend(
              'force',
              client.config.settings.Lua,
              {
                runtime = { version = "LuaJIT" },
                workspace = {
                  checkThirdParty = false,
                  library = vim.api.nvim_get_runtime_file("", true)
                }
              })
          end,
          settings = {
            Lua = {}
          }
        }

        vim.cmd("autocmd CursorHold * lua vim.diagnostic.open_float { focusable = false }")
        vim.cmd("autocmd CursorHoldI * lua vim.diagnostic.open_float { focusable = false }")
      end
    },

    {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
      },
      config = function ()
        local cmp = require("cmp")

        local cmp_window = {
          border = "none",
          winblend = 20,
          zindex = 1001,
          scrolloff = 0,
        }

        cmp.setup({
          snippet = {
            expand = function(args)
              vim.fn["vsnip#anonymous"](args.body)
            end,
          },
          window = {
            completion = cmp_window,
            documentation = cmp_window,
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
      end
    },
  },

  options = {
    o = {
      foldmethod = "marker",
      --foldexpr = "v:lua.vim.treesitter.foldexpr()",
      --foldtext = "v:lua.vim.treesitter.foldtext()",
    },
  },

  -- Completion
}

return config
