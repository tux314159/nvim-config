local config = {
  plugins = {
    {
      "nvim-telescope/telescope.nvim",
      requires = { {"nvim-lua/plenary.nvim"} },
    },
  },

  keymaps = {
    { "n", "<leader>ff", function() print("real lua function") end },
  }
}

return config
