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
    "FileType lua",
    callback = function(ev)
      vim.o.tabstop = 2
      vim.o.shiftwidth = 2
      vim.o.softtabstop = 2
    end,
    buflocal = true,

  },
}

return config
