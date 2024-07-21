local modules = {"plugins", "ide", "appearance", "mappings", "options",}






require("plugins")
require("ide")
require("appearance")
require("mappings")
require("options")

-- Push config changes on file change, and reload changed files
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { vim.fn.expand("~") .. "/.config/nvim/*" },
  callback = function(ev)
    local changed = ev.match

    local with_config_dir = { cwd = vim.fn.expand("~") ..  "/.config/nvim" }
    vim.system({"git", "add", "."}, with_config_dir):wait()
    vim.system({"git", "commit", "-m", "update config"}, with_config_dir):wait()
    vim.system({"git", "push"}, with_config_dir)
  end,
})
