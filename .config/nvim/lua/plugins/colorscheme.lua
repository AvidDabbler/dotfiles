return {
	-- add gruvbox
	{ "AvidDabbler/quantum.vim" },
	-- { "kjssad/quantum.vim" },

	-- Configure LazyVim to load gruvbox
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "quantum",
		},
	},
}
