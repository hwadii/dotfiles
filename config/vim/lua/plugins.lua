vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}

  use 'AndrewRadev/splitjoin.vim'
  use 'airblade/vim-rooter'
  use 'jiangmiao/auto-pairs'
  use 'lambdalisue/gina.vim'
  use 'ledger/vim-ledger'
  use 'neovim/nvim-lspconfig'
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup({}, { names = false }) end,
  }
  use 'hrsh7th/nvim-compe'
  use 'norcalli/snippets.nvim'
  use 'lewis6991/github_dark.nvim'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function() require('gitsigns').setup() end,
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzy-native.nvim'}
    }
  }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/nvim-treesitter-angular'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'plasticboy/vim-markdown'
  use 'tpope/vim-abolish'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-vinegar'
end)
