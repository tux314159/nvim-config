local config = {
  plugins = {
    {
      "nvim-telescope/telescope.nvim",
      requires = { {"nvim-lua/plenary.nvim"} },
    },
  },

  keymaps = {
    { "n", "<leader>ff", function() require("telescope.builtin").find_files() end },
    { "n", "<leader>fg", function() require("telescope.builtin").live_grep() end },
    { "n", "<leader>fb", function() require("telescope.builtin").buffers() end },
    { "n", "<leader>fh", function() require("telescope.builtin").help_tags() end },
  }
}

return config
