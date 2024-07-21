local config_mod_names = {"plugins", "ide", "appearance", "mappings", "options"}
local config_mods = {}
for _, mod_name in pairs(config_mod_names) do
  local mod = require(mod_name)
  if mod.options then
    if mod.o then
      for k, v in mod.o do
        vim.o[k] = v
      end
    end
    if mod.g then
      for k, v in mod.g do
        vim.g[k] = v
      end
    end
  end
end

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
