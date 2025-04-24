-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- don't bend your fingers
vim.keymap.set({ "i" }, "jj", "<ESC>", { silent = true })
-- -- [[ German keyboard makes it harder to jump around in help ]]
vim.keymap.set({ "n" }, "ö", "<C-]>", { noremap = true })
vim.keymap.set({ "n" }, "Ö", "<C-t>", { noremap = true })
