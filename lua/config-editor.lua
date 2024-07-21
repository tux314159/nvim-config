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
  { "html", set_buf_indent_cb(2) },
  { "javascript", set_buf_indent_cb(4) },
  { "typescript", set_buf_indent_cb(4) },
  { "css", set_buf_indent_cb(2) },
  { "haskell", set_buf_indent_cb(2) },
  { "rst", set_buf_indent_cb(3) },
  { "cs", set_buf_indent_cb(4, { et = false }) },
  { "c", set_buf_indent_cb(4, { et = false }) },
  { "cpp", set_buf_indent_cb(4, { et = false }) },
  { "sh", set_buf_indent_cb(4, { et = false }) },
  { "tex", set_buf_indent_cb(4, { et = false }) },
}

local config = {
  options = {
    o = {
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

  autocmds = {
    autocmd_simple("FileType", "lua", set_buf_indent_cb(2)),
  },
}

return config
