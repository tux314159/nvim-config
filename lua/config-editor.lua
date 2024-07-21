local function set_buf_indent(n)
  vim.opt_local.tabstop = n
  vim.opt_local.shiftwidth = n
  vim.opt_local.softtabstop = n
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
    {
      "FileType",
      {
        pattern = "lua",
        callback = set_buf_indent(2)
      },
    },
  },
}

return config
