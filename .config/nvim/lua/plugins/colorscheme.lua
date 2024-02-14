return {
	-- add gruvbox
	{ "kjssad/quantum.vim" },

	-- Configure LazyVim to load gruvbox
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "quantum",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			vim.cmd([[highlight LineNr guifg=#aeb7ae]])
			vim.cmd([[highlight CursorLine guibg=#044c02]])
			vim.cmd([[highlight CursorLineNr guifg=#df83cb]])
			vim.cmd([[highlight Visual guibg=#586857]])
		end,
	},
}
