local config = {
  plugins = {
    {
      "folke/tokyonight", config = function ()
        require"tokyonight".setup({
          style = "moon",
          transparent = true,
          terminal_colors = true,
        })
        vim.cmd.colorscheme("tokyonight")
      end
    },
    {
      "akinsho/toggleterm", config = function()
        require"toggleterm".setup({
          shade_terminals = true,
          direction = "float",
          float_opts = {
            border = "none",
            winblend = 20,
            title_pos = "center",
          },
        })
      end
    },
  },

  options = {
    o = {
      termguicolors = true,
      background = "dark",
      winblend = 20,
    },
  },
}

return config
