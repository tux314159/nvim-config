local function set_buf_indent(n)
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
        callback = function(_)
          vim.opt_local.tabstop = 2
          vim.opt_local.shiftwidth = 2
          vim.opt_local.softtabstop = 2
        end,
      },
    },
  },
}

return config
