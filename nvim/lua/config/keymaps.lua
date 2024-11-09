-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- exit insrrt mode with jk
vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "<ESC>" })
-- option + a to select all text in a file
vim.keymap.set("n", "<M-a>", "ggVG", { noremap = true, silent = true, desc = "Select all" })

-- Map the function to a key combination
vim.keymap.set("n", "<leader>te", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

-- REMAP BUFFER DESTROY
-- Remap <Leader>x to close the current buffer
vim.api.nvim_set_keymap("n", "<Leader>x", ":bd<CR>", { noremap = true, silent = true })

-- LSPRESTART
-- Unmap the current mapping for <Leader>l if it exists
vim.api.nvim_del_keymap("n", "<Leader>l")

-- Function to restart LSP
vim.api.nvim_set_keymap("n", "<leader>L", ":LspRestart<CR>", { noremap = true, silent = true })

-- -- Remap <Leader>l to restart LSP
-- vim.api.nvim_set_keymap("n", "<Leader>l", "<cmd>lua restart_lsp()<CR>", { noremap = true, silent = true })

-- Remap leader+f to leader+F
-- vim.api.nvim_set_keymap("n", "<leader><leader>", "<leader>fF", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ff", "<leader>fF", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>ft", "<leader>fT", { noremap = true, silent = true })
