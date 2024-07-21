--local config_mod_names = {"plugins", "appearance", "ide", "mappings", "options"}
local config_mod_names = {
  "config-editor",
  "config-mappings",
  "config-appearance",
  "config-telescope",
  "config-ide",
}

-- Set up packer
vim.tbl_islist = vim.islist  -- deprecated
local packer = require('packer')
packer.util = require('packer.util')
packer.reset()
packer.init()
packer.use("wbthomason/packer.nvim")  -- manage itself

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

  -- Load keymaps
  if mod.keymaps then
    for _, km in ipairs(mod.keymaps) do
      vim.keymap.set(unpack(km))
    end
  end

  -- Load autocmds
  if mod.keymaps then
    for _, km in ipairs(mod.autocmds) do
      vim.api.nvim_create_autocmd(unpack(km))
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
  group = vim.api.nvim_create_augroup("push_config_on_save", {}),
  pattern = { vim.fn.expand("~") .. "/.config/nvim/*" },
  callback = function(ev)
    local with_config_dir = { cwd = vim.fn.expand("~") ..  "/.config/nvim" }
    vim.system({"git", "add", "."}, with_config_dir):wait()
    vim.system({"git", "commit", "-m", "update config"}, with_config_dir):wait()
    vim.system({"git", "push"}, with_config_dir)
  end,
})
