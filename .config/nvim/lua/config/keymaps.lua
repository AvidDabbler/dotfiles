-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- exit insrrt mode with jk
vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "<ESC>" })
-- option + a to select all text in a file
vim.keymap.set("n", "<M-a>", "ggVG", { noremap = true, silent = true, desc = "Select all" })

-- GOLANG
-- Define a function to insert 'if err != nil { return err }' when triggered
local function insertGoErrorCheck()
	-- Check if current buffer is a Go file
	if vim.bo.filetype == "go" then
		-- Insert the desired text
		vim.api.nvim_put({ "if err != nil {\n\treturn err\n\t}" }, "l", true, true)
		-- Move the cursor inside the if statement
		vim.cmd("normal! k$hi")
	else
		-- If not a Go file, do nothing
		print("Not a Go file!")
	end
end

-- Map the function to a key combination
vim.keymap.set("n", "<leader>te", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

insertGoErrorCheck()
