return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = 'nvim-lua/plenary.nvim',
    lazy = true,
    config = function()
      local harpoon = require 'harpoon'
      harpoon.setup()
      vim.keymap.set({ 'n' }, '<leader>ha', function()
        harpoon:list():append()
      end, { desc = '[H]arpoon [A]dd_file' })
      vim.keymap.set({ 'n' }, '<leader>hh', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = '[H]arpoon s[H]ow_menu' })
      vim.keymap.set({ 'n' }, '<leader>hf', function()
        harpoon:list():select(1)
      end, { desc = '[H]arpoon navigate to first file[F]' })
      vim.keymap.set({ 'n' }, '<leader>hd', function()
        harpoon:list():select(2)
      end, { desc = '[H]arpoon navigate to second file[D]' })
      vim.keymap.set({ 'n' }, '<leader>hs', function()
        harpoon:list():select(3)
      end, { desc = '[H]arpoon navigate to third file[S]' })
      vim.keymap.set({ 'n' }, '<C-j>', function()
        harpoon:list():next()
      end, { desc = '[H]arpoon navigate next [U]' })
      vim.keymap.set({ 'n' }, '<C-k>', function()
        harpoon:list():prev()
      end, { desc = '[H]arpoon navigate prev [R]' })
    end,
  },
  --    {'elixir-editors/vim-elixir', lazy = true},
  --    {'kyazdani42/nvim-web-devicons'},
  { 'shushcat/vim-minimd' },
  --    {'tjdevries/cyclist.vim'},
  --    {'rafamadriz/friendly-snippets', config = function()
  --      require("luasnip.loaders.from_vscode").lazy_load()
  --    end},
  --    {'christoomey/vim-tmux-navigator', lazy = false},
}
