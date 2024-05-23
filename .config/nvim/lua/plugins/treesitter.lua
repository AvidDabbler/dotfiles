vim.filetype.add({ extension = { templ = "templ" } })
vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.templ" }, callback = vim.lsp.buf.format })
return {
	"nvim-treesitter/nvim-treesitter",
	opts = function(_, opts)
		-- Ensure specific languages are installed
		table.insert(opts.ensure_installed, {
			"prisma",
			"astro",
			"graphql",
		})
		vim.list_extend(opts.ensure_installed, {
			"go",
			"gomod",
			"gowork",
			"gosum",
		})
		-- Configure treesitter settings
		opts.highlight = {
			enable = true, -- Enable syntax highlighting
		}

		-- Disable auto-pairs (auto-closing) for specific filetypes
		opts.autopairs = {
			enable = true, -- Set to false to disable auto-pairs
		}
		-- ---@class treesitter_parser_config
		-- local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		--
		-- treesitter_parser_config.templ = {
		-- 	install_info = {
		-- 		url = "https://github.com/vrischmann/tree-sitter-templ.git",
		-- 		files = { "src/parser.c", "src/scanner.c" },
		-- 		branch = "master",
		-- 	},
		-- }
		-- vim.treesitter.language.register("templ", "templ")
	end,
}
