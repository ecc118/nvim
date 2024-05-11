return require'packer'.startup(function()
  use 'wbthomason/packer.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'nvim-treesitter/nvim-treesitter'

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use {
    "jose-elias-alvarez/null-ls.nvim",
      requires = { "nvim-lua/plenary.nvim" },
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'
  use 'feline-nvim/feline.nvim'
  use 'zefei/cake16'
  use 'folke/tokyonight.nvim'
  use 'xiyaowong/transparent.nvim'
  use 'olivercederborg/poimandres.nvim'
  use {"shortcuts/no-neck-pain.nvim", tag = "*" }
end)
