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
  use {
    "ms-jpq/coq_nvim",
    branch = "coq",
    requires = { "ms-jpq/coq.artifacts" },
    run = { ":COQdeps" },
  }
  use "neovimhaskell/haskell-vim"
  use "neovim/nvim-lspconfig"
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  --use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  --use "nvim-treesitter/nvim-treesitter-context"
  use "p00f/nvim-ts-rainbow"
  use "pbrisbin/vim-syntax-shakespeare"
  use "sainnhe/everforest"
  use "tpope/vim-eunuch"
  use "tpope/vim-obsession"
  use "tpope/vim-scriptease"
  use "voldikss/vim-floaterm"
  use "wbthomason/packer.nvim"
  use "soli/prolog-vim"
end)
