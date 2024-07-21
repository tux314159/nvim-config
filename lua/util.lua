local M = {}

-- really simple ft autocmd constructor
function M.ft_autocmd(ft, options)
	return "autocmd FileType " .. ft .. " setlocal " .. options
end

function M.ft_autocmd_(ft, options)
	vim.cmd(M.ft_autocmd(ft, options))
end

-- convenience function to construct indentation-setting autocmd fragment
function M.au_indent(lvl)
    local s = ""
	for i, v in ipairs({ "tabstop", "shiftwidth", "softtabstop" }) do
		s = s .. v .. "=" .. lvl .. " "
	end
	return s
end

return M
