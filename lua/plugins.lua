return require('packer').startup(function()
  use "EdenEast/nightfox.nvim"
  use {
    "feline-nvim/feline.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function() require("feline").setup() end
  }
  use "LionC/nest.nvim"
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
  use "p00f/nvim-ts-rainbow"
  use "pbrisbin/vim-syntax-shakespeare"
  use "sainnhe/everforest"
  use "sersorrel/vim-lilypond"
  use "tpope/vim-eunuch"
  use "tpope/vim-obsession"
  use "tpope/vim-scriptease"
  use "voldikss/vim-floaterm"
  use "wbthomason/packer.nvim"
end)
