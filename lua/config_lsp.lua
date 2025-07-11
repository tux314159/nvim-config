-- Treesitter

local config = {
	plugins = {
		{
			"lewis6991/gitsigns.nvim",
			config = function() require("gitsigns").setup() end
		},
		{
			"neovimhaskell/haskell-vim",
		},
		{
			"akinsho/git-conflict.nvim",
			config = function()
				require("git-conflict").setup({})
				vim.cmd("GitConflictRefresh")
			end,
			refresh
		},
    {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require'nvim-treesitter.configs'.setup({
          ensure_installed = "all",
          sync_install = false,
          auto_install = true,
          ignore_install = { },

          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },

          indent = {
            enable = false,
          },

          modules = {},

        })
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
          "bashls",
          "hls",
          "csharp_ls",
          "lua_ls",
					"gdscript",
					"rust_analyzer"
        }
				local handlers =  {
					["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "single"}),
					["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single" }),
				}
        for _, v in pairs(servers) do
          nvim_lsp[v].setup({capabilities = capabilities, handlers = handlers})
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
          },
					capabilities = capabilities,
					handlers = handlers,
        }
				vim.diagnostic.config({
					virtual_text = false,
				})

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
          scrolloff = 1,
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
            ['<CR>'] = cmp.mapping.confirm({ select = false }),
          }),
          sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
          }, {
              { name = 'buffer' },
            })
        })

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
    },
  },
}

return config
