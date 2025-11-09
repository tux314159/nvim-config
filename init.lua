set = require'set'

set 'hidden' (true)
set 'number' (true)
set 'signcolumn' 'yes'
set 'winborder' 'single'
set 'splitbelow' (true)
set 'splitright' (true)
set 'undofile' (true)
set 'updatetime' (300)

-- Cmdline completion
set 'wildmode' 'full:longest'

-- Omnicomplete
set 'completeopt' 'longest,menuone'

function set_omni_keymap(k, expr)
  vim.keymap.set('i', k,
    function() return vim.fn.pumvisible() == 1 and expr or k end,
    { expr = true, silent = true }
  )
end
set_omni_keymap('<CR>', '<C-y>')
set_omni_keymap('<Esc>', '<C-e>')

vim.keymap.set('i', '<C-Space>', '<C-x><C-o>')

-- File tree
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = -40
vim.g.netrw_preview = 1
vim.keymap.set('n', '<C-S-E>', '<Cmd>Lexplore<CR>')

vim.api.nvim_create_autocmd('ICursorHold', {
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
