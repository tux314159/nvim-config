--local config_mod_names = {"plugins", "appearance", "ide", "mappings", "options"}
local config_mod_names = {"config-appearance", "config-mappings", "config-ide"}

-- Set up packer
vim.tbl_islist = vim.islist  -- deprecated
local packer = require('packer')
packer.util = require('packer.util')
packer.reset()
packer.init()
packer.use("wbthomason/packer.nvim")

require("options")

-- Load config modules
local config_mods = {}
for _, mod_name in pairs(config_mod_names) do
  local mod = require(mod_name)
  config_mods[mod_name] = mod

  -- Load options
  if mod.options then
    if mod.options.o then
      for k, v in pairs(mod.options.o) do
        vim.o[k] = v
      end
    end
    if mod.options.g then
      for k, v in pairs(mod.options.g) do
        vim.g[k] = v
      end
    end
  end

  -- Load plugins
  if mod.plugins then
    for _, plugin in ipairs(mod.plugins) do
      packer.use(plugin)
    end
  end
end
packer.compile()

-- Push config changes on file change, and reload changed files
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { vim.fn.expand("~") .. "/.config/nvim/*" },
  callback = function(ev)
    local with_config_dir = { cwd = vim.fn.expand("~") ..  "/.config/nvim" }
    vim.system({"git", "add", "."}, with_config_dir):wait()
    vim.system({"git", "commit", "-m", "update config"}, with_config_dir):wait()
    vim.system({"git", "push"}, with_config_dir)
  end,
})
