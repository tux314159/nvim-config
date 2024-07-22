local config_mod_names = {
	"config_editor",
	"config_mappings",
	"config_appearance",
	"config_telescope",
	"config_ide",
}

-- Set up packer
local packer = require("packer")
local function packer_setup()
	vim.tbl_islist = vim.islist  -- deprecated
	packer.reset()
	packer.util = require("packer.util")
	packer.init()
	packer.use("wbthomason/packer.nvim")  -- manage itself
end
packer_setup()

-- Load config modules

local function load_config_modules(modules)
	for _, mod_name in pairs(modules) do
		package.loaded[mod_name] = nil  -- unload module first
		local mod = require(mod_name)

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
		packer_setup()
		load_config_modules(config_mod_names)  -- reload config
		local with_config_dir = { cwd = vim.fn.expand("~") ..  "/.config/nvim" }
		vim.system({"git", "add", "."}, with_config_dir):wait()
		vim.system({"git", "commit", "-m", "update config"}, with_config_dir):wait()
		vim.system({"git", "push"}, with_config_dir)
	end,
})
