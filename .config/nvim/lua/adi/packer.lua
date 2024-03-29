-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

-- use({
--     'rose-pine/neovim',
--     as = 'rose-pine',
--     config = function()
--   	  require("rose-pine").setup()
--  	  vim.cmd('colorscheme rose-pine')
--     end
-- })

  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},             -- Required
          {'williamboman/mason.nvim'},           -- Optional
          {'williamboman/mason-lspconfig.nvim'}, -- Optional

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},         -- Required
          {'hrsh7th/cmp-nvim-lsp'},     -- Required
          {'hrsh7th/cmp-buffer'},       -- Optional
          {'hrsh7th/cmp-path'},         -- Optional
          {'saadparwaiz1/cmp_luasnip'}, -- Optional
          {'hrsh7th/cmp-nvim-lua'},     -- Optional

          -- Snippets
          {'L3MON4D3/LuaSnip'},             -- Required
          {'rafamadriz/friendly-snippets'}, -- Optional
      }
  }

  use {
      "nvim-neorg/neorg",
      config = function()
          require('neorg').setup {
              load = {
                  ["core.defaults"] = {}, -- Loads default behaviour
                  ["core.autocommands"] = {},
                  ["core.integrations.treesitter"] = {},
                  ["core.concealer"] = {
                    config = {
                      icon_preset = "diamond",
                      folds = false,
                    },
                  }, -- Adds pretty icons to your documents
                  ["core.dirman"] = { -- Manages Neorg workspaces
                      config = {
                          workspaces = {
                              notes = "~/notes",
                          },
                          default_workspace = "notes",
                      },
                  },
              },
          }
      end,
      run = ":Neorg sync-parsers",
      requires = "nvim-lua/plenary.nvim",
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('brenoprata10/nvim-highlight-colors')
  use('preservim/nerdtree')
  use('ryanoasis/vim-devicons')
  use('vim-airline/vim-airline')
  use('vim-airline/vim-airline-themes')
  use('rebelot/kanagawa.nvim')

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
 -- use({'ellisonleao/gruvbox.nvim',
 --   as = 'gruvbox',
 --   config = function() 
 --       require("gruvbox").setup()
 --       vim.cmd('colorscheme gruvbox')
 --       end
 -- })
end)
