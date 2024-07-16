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
		{ "l", { -- lsp
			{ "D", "<cmd>lua vim.lsp.buf.declaration()<CR>" },
			{ "d", "<cmd>lua vim.lsp.buf.definition()<CR>" },
			{ "r", "<cmd>lua vim.lsp.buf.rename()<CR>" },
			{ "a", "<cmd>lua vim.lsp.buf.code_action()<CR>" },
		}},

		{ "f", { -- telescope
			{ "f", "<cmd>lua require('telescope.builtin').find_files()<CR>" },
			{ "g", "<cmd>lua require('telescope.builtin').live_grep()<CR>" },
			{ "b", "<cmd>lua require('telescope.builtin').buffers()<CR>" },
			{ "h", "<cmd>lua require('telescope.builtin').help_tags()<CR>" },
		}},

    { "d", { -- degugger
      { "s", "<cmd>require('dapui').toggle('sidebar')<CR>" },
      { "t", "<cmd>require('dapui').toggle('tray')<CR>" },
    }},

		{ "cc", "<cmd>!make<cr><esc>" }
	}},
}

-- weird snippet stuff
vim.cmd("imap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'")
vim.cmd("smap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'")
vim.cmd("imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'")
vim.cmd("smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'")
