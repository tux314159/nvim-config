local function set_buf_indent_cb(n)
  return function ()
      vim.opt_local.tabstop = n
      vim.opt_local.shiftwidth = n
      vim.opt_local.softtabstop = n
  end
end

local function autocmd_simple(cond, pattern, callback)
  return { cond, { pattern = pattern, callback = callback } }
end

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
