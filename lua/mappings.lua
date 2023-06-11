local nest = require("nest")

vim.g.mapleader = " "
nest.applyKeymaps {
	{ "<Left>", "<C-w>h" },
	{ "<Down>", "<C-w>j" },
	{ "<Up>", "<C-w>k" },
	{ "<Right>", "<C-w>l" },
	{ "<S-Left>", "<C-w>v<C-w>h" },
	{ "<S-Down>", "<C-w>s" },
	{ "<S-Up>", "<C-w>s<C-w>k" },
	{ "<S-Right>", "<C-w>v" },
	{ "<C-m>", "<C-o>zz", mode="i"},

	{ "<C-t>", "<Cmd>FloatermToggle<CR>", mode="tn" },
	{ "<Esc>", "<C-\\><C-n>", mode="t" },

}
