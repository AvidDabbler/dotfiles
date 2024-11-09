local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
	spec = {
		-- add LazyVim and import its plugins
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ import = "lazyvim.plugins.extras.lang.typescript" },
		{ import = "lazyvim.plugins.extras.lang.json" },
		{ import = "lazyvim.plugins.extras.lang.tailwind" },
		{ import = "lazyvim.plugins.extras.lang.go" },
		{ import = "lazyvim.plugins.extras.dap.core" },
		{ import = "lazyvim.plugins.extras.linting.eslint" },
		{ import = "lazyvim.plugins.extras.test.core" },
		-- { import = "lazyvim.plugins.extras.coding.native_snippets" },
		{
			"barrett-ruth/live-server.nvim",
			build = "pnpm add -g live-server",
			cmd = { "LiveServerStart", "LiveServerStop" },
			config = true,
		},
		{
			"nomnivore/ollama.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},

			-- All the user commands added by the plugin
			cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

			keys = {
				-- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
				{
					"<leader>oo",
					":<c-u>lua require('ollama').prompt()<cr>",
					desc = "ollama prompt",
					mode = { "n", "v" },
				},

				-- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
				{
					"<leader>oG",
					":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
					desc = "ollama Generate Code",
					mode = { "n", "v" },
				},
			},

			---@type Ollama.Config
			opts = {
				-- your configuration overrides
			},
		},
		{
			"chrisgrieser/nvim-recorder",
			dependencies = "rcarriga/nvim-notify", -- optional
			opts = {}, -- required even with default settings, since it calls `setup()`
		},
		{ "windwp/nvim-autopairs" },
		{ import = "plugins" },
	},
	defaults = {
		-- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
		-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
		lazy = false,
		-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
		-- have outdated releases, which may break your Neovim install.
		version = false, -- always use the latest git commit
		-- version = "*", -- try installing the latest stable version for plugins that support semver
	},
	install = { colorscheme = { "tokyonight", "habamax" } },
	checker = { enabled = true }, -- automatically check for plugin updates
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
