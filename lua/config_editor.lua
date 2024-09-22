local config = {}

config.options = {
	o = {
		mouse = "a",
		splitbelow = true,
		splitright = true,
		undofile = true,  -- persistent undo
		updatetime = 300,

		--shiftwidth = 4,
		--tabstop = 4,
		--expandtab = true,
		autoindent = true,
		cinoptions = "l1:0",
		clipboard = "unnamedplus"
	},
}

local function set_buf_indent_cb(n, opts)
	return function ()
		vim.opt_local.tabstop = n
		vim.opt_local.shiftwidth = n
		vim.opt_local.softtabstop = n
		if opts and opts.et then
			vim.opt_local.expandtab = true
		else
			vim.opt_local.expandtab = false
		end
	end
end

local function autocmd_simple(cond, pattern, callback)
	return { cond, { pattern = pattern, callback = callback } }
end

local filetype_indents = {
	{ "lua", { 2 }},
	{ "html", { 2 }},
	{ "javascript", { 4 }},
	{ "typescript", { 4 }},
	{ "css", { 2 }},
	{ "haskell", { 2, { et = true }}},
	{ "rst", { 3 }},
	{ "cs", { 4, { et = false } }},
	{ "c", { 4, { et = false } }},
	{ "cpp", { 4, { et = false } }},
	{ "sh", { 4, { et = false } }},
	{ "tex", { 4, { et = false } }},
}

config.autocmds = {}
for _, rule in ipairs(filetype_indents) do
	config.autocmds[#config.autocmds+1] = autocmd_simple(
		"FileType", rule[1], set_buf_indent_cb(unpack(rule[2]))
	)
end

config.plugins = {
	"tpope/vim-obsession",
}

return config
