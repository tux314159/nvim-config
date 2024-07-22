local config_mod_names = {
	"config_editor",
	"config_mappings",
	"config_appearance",
	"config_telescope",
	"config_ide",
}

-- Set up packer
vim.tbl_islist = vim.islist  -- deprecated
local packer = require("packer")
packer.util = require("packer.util")
packer.reset()
packer.init()
packer.use("wbthomason/packer.nvim")  -- manage itself

-- Load config modules

local function load_config_modules(modules)
	for _, mod_name in pairs(modules) do
		package.loaded[mod_name] = nil  -- unload module first
		local mod = require(mod_name)

		-- Load options
		if mod.options then
			if mod.options.o then
				for k, v in pairs(mod.options.o) do
					print(k)
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
		if mod.autocmds then
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
end

load_config_modules(config_mod_names)

-- Push config changes on file change, and reload changed files
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("push_config_on_save", {}),
	pattern = { vim.fn.expand("~") .. "/.config/nvim/*" },
	callback = function(ev)
		load_config_modules(config_mod_names)  -- reload config
		local with_config_dir = { cwd = vim.fn.expand("~") ..  "/.config/nvim" }
		vim.system({"git", "add", "."}, with_config_dir):wait()
		vim.system({"git", "commit", "-m", "update config"}, with_config_dir):wait()
		vim.system({"git", "push"}, with_config_dir)
	end,
})
