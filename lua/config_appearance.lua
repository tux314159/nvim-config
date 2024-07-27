local config = {
	plugins = {
		{
			"rebelot/kanagawa.nvim", config = function ()
				require"kanagawa".setup({
					dimInactive = "true",
					transparent = false,
					background = {
						light = "lotus",
						dark = "wave",
					},
				})
				vim.cmd.colorscheme("kanagawa")
			end
		},
		{
			"akinsho/toggleterm.nvim", config = function()
				require"toggleterm".setup({
					shade_terminals = true,
					direction = "float",
					float_opts = {
						border = "round",
						winblend = 20,
						title_pos = "center",
					},
				})
			end
		},
		{
			"feline-nvim/feline.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function() require("feline").setup() end
		}
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
		},
	},
}

return config
