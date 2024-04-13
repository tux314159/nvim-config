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

	{ "<C-t>", "<Cmd>FloatermToggle<CR>", mode="tn" },
	{ "<Esc>", "<C-\\><C-n>", mode="t" },

	-- special lsp, not inside leader
	{ "K", "<cmd>lua vim.lsp.buf.hover()<CR>" },
	{ "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>" },

	{ "<leader>", {
		{ "l", {  -- lsp
			{ "D", "<cmd>lua vim.lsp.buf.declaration()<CR>" },
			{ "d", "<cmd>lua vim.lsp.buf.definition()<CR>" },
			{ "r", "<cmd>lua vim.lsp.buf.rename()<CR>" },
			{ "a", "<cmd>lua vim.lsp.buf.code_action()<CR>" },
		}},

		{ "f", { -- telescope
			{ "f", "<cmd>lua require('telescope.builtin').find_files()<cr>" },
			{ "g", "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
			{ "b", "<cmd>lua require('telescope.builtin').buffers()<cr>" },
			{ "h", "<cmd>lua require('telescope.builtin').help_tags()<cr>" },
		}},
    
    { "cc", "<cmd>!make<cr><esc>" }
	}}
}

vim.cmd("nnoremap <expr> j v:count ? 'j' : 'gj'")
vim.cmd("nnoremap <expr> k v:count ? 'k' : 'gk'")
