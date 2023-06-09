-- move visual blocks around
vim.keymap.set({ 'v' }, 'J', ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set({ 'v' }, 'K', ":m '<-2<CR>gv=gv", { noremap = true })

-- move windows between splits
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>H', { noremap = true })
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>J', { noremap = true })
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>K', { noremap = true })
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>L', { noremap = true })

-- [[ harpooning ]]
vim.keymap.set({ 'n' }, '<leader>ha', require('harpoon.mark').add_file, { desc = '[H]arpoon [A]dd_file' })
vim.keymap.set({ 'n' }, '<leader>hh', require('harpoon.ui').toggle_quick_menu, { desc = '[H]arpoon s[H]ow_menu' })
vim.keymap.set({ 'n' }, '<leader>hf', function() return require('harpoon.ui').nav_file(1) end, { desc = '[H]arpoon navigate to first file[F]' })
vim.keymap.set({ 'n' }, '<leader>hd', function() return require('harpoon.ui').nav_file(2) end, { desc = '[H]arpoon navigate to second file[D]' })
vim.keymap.set({ 'n' }, '<leader>hs', function() return require('harpoon.ui').nav_file(3) end, { desc = '[H]arpoon navigate to third file[S]' })
vim.keymap.set({ 'n' }, '<leader>hu', require('harpoon.ui').nav_next, { desc = '[H]arpoon navigate next [U]' })
vim.keymap.set({ 'n' }, '<leader>hr', require('harpoon.ui').nav_prev, { desc = '[H]arpoon navigate prev [R]' })

-- [[ Buffer handling - old habits die hard ]]
vim.keymap.set({ 'n' }, '<Leader>bd', ':bd<CR>', {})
vim.keymap.set({ 'n' }, '<Leader>bD', ':bd!<CR>', {})
vim.keymap.set({ 'n' }, '<Leader>bl', ':bl<CR>', {})
vim.keymap.set({ 'n' }, '<Leader>bn', ':bn<CR>', {})
vim.keymap.set({ 'n' }, '<Leader>bp', ':bp<CR>', {})

-- [[ German keyboard makes it harder to jump around in help ]]
vim.keymap.set({ 'n' }, 'ö', '<C-]>', { noremap = true })
vim.keymap.set({ 'n' }, 'Ö', '<C-t>', { noremap = true })
