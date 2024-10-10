vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- vimbegood
  use 'ThePrimeagen/vim-be-good'

  -- bufferline
  use 'akinsho/bufferline.nvim'
  require("bufferline").setup{options={indicator={icon='>'}}}

  -- modeline
  use 'echasnovski/mini.statusline'
  require("mini.statusline").setup()

  -- Hex colots
  vim.opt.termguicolors = true
  use 'norcalli/nvim-colorizer.lua'
  require("colorizer").setup()

  -- Transparent bg
  use 'xiyaowong/transparent.nvim'

  -- colorscheme
  use 'folke/tokyonight.nvim'
  use 'tiagovla/tokyodark.nvim'
  vim.cmd[[colorscheme tokyodark]]

  -- telessope
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- treesitter
  use {
		  'nvim-treesitter/nvim-treesitter',
		  run = ':TSUpdate'
  }

  -- autocomplete
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'

  -- autoclose
  use {
		  "windwp/nvim-autopairs",
		  event = "InsertEnter",
		  config = function()
				  require("nvim-autopairs").setup {}
		  end
  }
 
  -- tree
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons',
      },
  }
  require("nvim-tree").setup()

end)


