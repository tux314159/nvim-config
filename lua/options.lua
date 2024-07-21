local u = require("util")

vim.o.clipboard = "unnamedplus"
vim.o.cmdheight = 1
vim.o.hidden = true
vim.o.laststatus = 3  -- global statusline!
vim.o.mouse = "a"
vim.o.number = true
vim.o.scrolloff = 5
vim.o.shortmess = "c"
vim.o.signcolumn = "yes:2"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.undofile = true  -- persistent undo
vim.o.updatetime = 300

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.cinoptions = "l1:0"

-- autocmds
u.ft_autocmd_("html", u.au_indent(2))
u.ft_autocmd_("javascript", u.au_indent(4))
u.ft_autocmd_("typescript", u.au_indent(4))
u.ft_autocmd_("css", u.au_indent(2))
u.ft_autocmd_("haskell", u.au_indent(2))
u.ft_autocmd_("rst", u.au_indent(3))
u.ft_autocmd_("lua", u.au_indent(2))
u.ft_autocmd_("cs", u.au_indent(4) .. " noexpandtab")
u.ft_autocmd_("c", u.au_indent(4) .. " noexpandtab")
u.ft_autocmd_("cpp", u.au_indent(4) .. " noexpandtab")
u.ft_autocmd_("sh", u.au_indent(4) .. " noexpandtab")
u.ft_autocmd_("tex", u.au_indent(4) .. " noexpandtab")
-- another special one
vim.cmd("autocmd FileType scheme inoremap <C-l> λ")

-- Push config changes every time
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { vim.fn.expand("~") .. "/.config/nvim/*" },
  callback = function(_)
    local with_config_dir = { cwd = vim.fn.expand("~") ..  "/.config/nvim" }
    vim.system({"git", "add", "."}, with_config_dir):wait()
    vim.system({"git", "commit", "-m", "update config"}, with_config_dir):wait()
    vim.system({"git", "push"}, with_config_dir)
  end,
})
