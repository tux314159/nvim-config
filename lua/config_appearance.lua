local config = {
	plugins = {
		{
			"rebelot/kanagawa.nvim", config = function ()
				package.loaded.kanagawa = nil
				require"kanagawa".setup({
					transparent = true,
					theme = "wave",
				})
				vim.cmd.colorscheme("koehler")
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
		},
	},
}

return config
