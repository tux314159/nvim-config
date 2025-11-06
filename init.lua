set = require'set'

set 'hidden' (true)
set 'number' (true)
set 'signcolumn' 'yes'
set 'winborder' 'single'
set 'splitbelow' (true)
set 'splitright' (true)


vim.g.netrw_liststyle = 3

vim.api.nvim_create_autocmd('CursorMoved', {
  callback = function(_)
    vim.diagnostic.open_float({ scope = 'cursor' })
  end,
})

-- Push config changes on file change
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("push_config_on_save", {}),
  pattern = { vim.fn.expand("~") .. "/.config/nvim/*" },
  callback = function(ev)
    local with_config_dir = { cwd = vim.fn.expand("~") ..  "/.config/nvim" }
    vim.system({"git", "add", "."}, with_config_dir):wait()
    vim.system({"git", "commit", "-m", "update config"}, with_config_dir):wait()
    vim.system({"git", "push"}, with_config_dir)
  end,
})

require("config.lazy")
