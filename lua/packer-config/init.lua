return require'packer'.startup(function()
  use 'wbthomason/packer.nvim'
  use 'EdenEast/nightfox.nvim'
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("treesitter")
    end,
  }

  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
  }

  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use {
    "nvimtools/none-ls.nvim",
      requires = { "nvim-lua/plenary.nvim" },
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '*',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'
  use 'feline-nvim/feline.nvim'
  use 'zefei/cake16'
  use 'folke/tokyonight.nvim'
  use 'xiyaowong/transparent.nvim'
  use 'olivercederborg/poimandres.nvim'
  use 'navarasu/onedark.nvim'
  use 'oskarnurm/koda.nvim'
  use {"shortcuts/no-neck-pain.nvim", tag = "*" }
end)
