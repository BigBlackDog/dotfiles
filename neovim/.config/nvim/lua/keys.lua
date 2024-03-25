-- don't bend your fingers
vim.keymap.set({ 'i' }, 'jj', '<ESC>', { silent = true })
--
-- -- move visual blocks around
vim.keymap.set({ 'v' }, '<C-j>', ":m '>+1<cr>gv=gv", { noremap = true })
vim.keymap.set({ 'v' }, '<C-k>', ":m '<-2<cr>gv=gv", { noremap = true })
--
-- -- move windows between splits
-- vim.keymap.set({ 'n' }, '<A-h>', '<C-w>H', { noremap = true })
-- vim.keymap.set({ 'n' }, '<A-j>', '<C-w>J', { noremap = true })
-- vim.keymap.set({ 'n' }, '<A-k>', '<C-w>K', { noremap = true })
-- vim.keymap.set({ 'n' }, '<A-l>', '<C-w>L', { noremap = true })
--
-- [[ harpooning ]]
-- local harpoon = require 'harpoon'
-- harpoon.setup()
-- vim.keymap.set({ 'n' }, '<leader>ha', function()
--   harpoon:list():append()
-- end, { desc = '[H]arpoon [A]dd_file' })
-- vim.keymap.set({ 'n' }, '<leader>hh', function()
--   harpoon.ui:toggle_quick_menu(harpoon:list())
-- end, { desc = '[H]arpoon s[H]ow_menu' })
-- vim.keymap.set({ 'n' }, '<leader>hf', function()
--   harpoon:list():select(1)
-- end, { desc = '[H]arpoon navigate to first file[F]' })
-- vim.keymap.set({ 'n' }, '<leader>hd', function()
--   harpoon:list():select(2)
-- end, { desc = '[H]arpoon navigate to second file[D]' })
-- vim.keymap.set({ 'n' }, '<leader>hs', function()
--   harpoon:list():select(3)
-- end, { desc = '[H]arpoon navigate to third file[S]' })
-- vim.keymap.set({ 'n' }, '<C-j>', function()
--   harpoon:list():next()
-- end, { desc = '[H]arpoon navigate next [U]' })
-- vim.keymap.set({ 'n' }, '<C-k>', function()
--   harpoon:list():prev()
-- end, { desc = '[H]arpoon navigate prev [R]' })
-- }
--
-- -- [[ Buffer handling - old habits die hard ]]
-- vim.keymap.set({ 'n' }, '<Leader>bd', ':bd<CR>', {})
-- vim.keymap.set({ 'n' }, '<Leader>bD', ':bd!<CR>', {})
-- vim.keymap.set({ 'n' }, '<Leader>bl', ':bl<CR>', {})
-- vim.keymap.set({ 'n' }, '<Leader>bn', ':bn<CR>', {})
-- vim.keymap.set({ 'n' }, '<Leader>bp', ':bp<CR>', {})
--
-- -- [[ German keyboard makes it harder to jump around in help ]]
vim.keymap.set({ 'n' }, 'ö', '<C-]>', { noremap = true })
vim.keymap.set({ 'n' }, 'Ö', '<C-t>', { noremap = true })
