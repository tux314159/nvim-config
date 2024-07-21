local config = {
  plugins = {
    {
      "tokyonight", setup = function (tokyonight)
        tokyonight.setup({
          style = "moon",
          transparent = true,
          terminal_colors = true,
        })
      end
    }
  },

  options = {
    o = {
      termguicolors = true,
      background = "dark",
      winblend = 20,
    },
  },

  require("tokyonight").setup({
    style = "moon",
    transparent = true,
    terminal_colors = true,
  }),

  vim.cmd.colorscheme("tokyonight"),

  require("toggleterm").setup({
    shade_terminals = true,
    direction = "float",
    float_opts = {
      border = "none",
      winblend = 20,
      title_pos = "center",
    },
  })
}

return config
