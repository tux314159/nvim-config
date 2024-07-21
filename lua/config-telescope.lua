local config = {
  plugins = {
    {
      "nvim-telescope/telescope.nvim",
      requires = { {"nvim-lua/plenary.nvim"} },
    },
  },

  keymaps = {

    { "<leader>", {
      { "f", { -- telescope
        { "f", "<cmd>lua require('telescope.builtin').find_files()<cr>" },
        { "g", "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
        { "b", "<cmd>lua require('telescope.builtin').buffers()<cr>" },
        { "h", "<cmd>lua require('telescope.builtin').help_tags()<cr>" },
      }},
    }},
  }
}

return config
