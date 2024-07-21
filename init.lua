
local config_mods = {"plugins", "ide", "appearance", "mappings", "options"}
local config_mods_loaded = {}
for _, mod in pairs(config_mods) do
  config_mods_loaded[vim.fn.stdpath("config") .. "/" .. mod .. ".lua"] = require(mod)
end

-- Push config changes on file change, and reload changed files
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { vim.fn.expand("~") .. "/.config/nvim/*" },
  callback = function(ev)
    config_mods_loaded[ev.match].loaded = false
    config_mods_loaded[ev.match] = require(ev.match)

    local with_config_dir = { cwd = vim.fn.expand("~") ..  "/.config/nvim" }
    vim.system({"git", "add", "."}, with_config_dir):wait()
    vim.system({"git", "commit", "-m", "update config"}, with_config_dir):wait()
    vim.system({"git", "push"}, with_config_dir)
  end,
})
