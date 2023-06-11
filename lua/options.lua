u = require("util")

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
-- this special one
vim.cmd("autocmd BufWritePost ~/.config/nvim/* :silent exec '! (cd ~/.config/nvim/; git add .; git commit -m \"$(date)\"; git push)'")
-- another special one
vim.cmd("autocmd FileType scheme inoremap <C-l> λ")
-- prolog filetype
vim.g.filetype_pl = "prolog"

-- wrap only at words for text files, long-line handling...
--local wrapmapstr = ":nnoremap j gj| :nnoremap k gk| :nnoremap 0 g0| :nnoremap $ g$| :nnoremap ^ g^| :nnoremap A g$a| :vnoremap j gj| :vnoremap k gk| :vnoremap 0 g0| :vnoremap $ g$| :vnoremap ^ g^"
--vim.cmd("autocmd BufEnter * if empty(&filetype) | :set linebreak | endif")
--vim.cmd("autocmd BufEnter * if empty(&filetype) | " .. wrapmapstr .. "| endif")
--vim.cmd("autocmd FileType text,html,tex :set linebreak")
--vim.cmd("autocmd FileType text,html,tex " .. wrapmapstr)
