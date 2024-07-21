local config = {
  plugins = {
    {
      "folke/tokyonight.nvim", config = function ()
        require"tokyonight".setup({
          style = "moon",
          transparent = true,
          terminal_colors = true,
        })
        vim.cmd.colorscheme("tokyonight")
      end
    },
    {
      "akinsho/toggleterm.nvim", config = function()
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
      cmdheight = 1,
      number = true,
      shortmess = "c",
      signcolumn = "yes:2",
      scrolloff = 5,
mouse = "a",
splitbelow = true,
splitright = true,
undofile = true,  -- persistent undo
updatetime = 300,

shiftwidth = 4,
tabstop = 4,
expandtab = true,
autoindent = true,
cinoptions = "l1:0",

    },
  },
}

return config