local config = {
  plugins = {
    {
      "nvim-telescope/telescope.nvim",
      requires = { {"nvim-lua/plenary.nvim"} },
    },
  },

  keymaps = {
    { "n", "<leader>ff", function() require("telescope.builtin").find_files() end },
  }
}

return config
