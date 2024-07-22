return require('packer').startup(function(use)
  use "folke/tokyonight.nvim"

  use {
    "feline-nvim/feline.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function() require("feline").setup() end
  }
  use {
    "lewis6991/gitsigns.nvim",
    config = function() require("gitsigns").setup() end
  }
  use "neovimhaskell/haskell-vim"
  use "neovim/nvim-lspconfig"
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "pbrisbin/vim-syntax-shakespeare"
  use "sainnhe/everforest"
  use "sersorrel/vim-lilypond"
  use "tpope/vim-eunuch"
  use "tpope/vim-obsession"
  use "tpope/vim-scriptease"
  use "akinsho/toggleterm.nvim"
  use "wbthomason/packer.nvim"
  use "LionC/nest.nvim"

  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-vsnip"
  use "hrsh7th/vim-vsnip"
end)
