return
  {
    {'ThePrimeagen/harpoon', branch = "harpoon2", dependencies = "nvim-lua/plenary.nvim", lazy = true},
    {'elixir-editors/vim-elixir', lazy = true},
    {'kyazdani42/nvim-web-devicons'},
    {'shushcat/vim-minimd'},
    {'tjdevries/cyclist.vim'},
    {'rafamadriz/friendly-snippets', config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end},
    {'christoomey/vim-tmux-navigator', lazy = false},
  }
