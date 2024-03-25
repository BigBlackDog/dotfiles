return {
  'ThePrimeagen/harpoon',
  lazy = false,
  branch = 'harpoon2',
  init = function()
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():append()
    end)
    vim.keymap.set('n', '<leader>hh', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set('n', '<leader>hf', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<leader>hd', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<leader>hs', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():select(4)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<C-j>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<C-k>', function()
      harpoon:list():next()
    end)
  end,
  dependencies = { 'nvim-lua/plenary.nvim' },
}
