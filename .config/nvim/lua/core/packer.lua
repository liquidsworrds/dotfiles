vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use{'wbthomason/packer.nvim'}

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        requires = {
            {'nvim-lua/plenary.nvim'}
        },
    }

    use{
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require("rose-pine").setup()
        end
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            {'williamboman/mason-lspconfig.nvim'},
            {'williamboman/mason.nvim'},
            {'neovim/nvim-lspconfig'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'saadparwaiz1/cmp_luasnip'},
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
            {'onsails/lspkind.nvim'},
        }
    }

  -- use {
  --     "nvim-neorg/neorg",
  --     rocks = { "lua-utils.nvim", "nvim-nio", "nui.nvim", "plenary.nvim", "pathlib.nvim" },
  --     tag = "*", -- Pin Neorg to the latest stable release
  --     config = function()
  --         require('neorg').setup {
  --             load = {
  --                 ["core.defaults"] = {}, -- Loads default behaviour
  --                 ["core.autocommands"] = {},
  --                 ["core.integrations.treesitter"] = {},
  --                 ["core.concealer"] = {
  --                   config = {
  --                     icon_preset = "diamond",
  --                     folds = false,
  --                   },
  --                 }, -- Adds pretty icons to your documents
  --                 ["core.dirman"] = { -- Manages Neorg workspaces
  --                     config = {
  --                         workspaces = {
  --                             notes = "~/notes",
  --                         },
  --                         default_workspace = "notes",
  --                     },
  --                 },
  --             },
  --         }
  --     end,
  --     run = ":Neorg sync-parsers",
  --     requires = "nvim-lua/plenary.nvim",
  -- }

  -- use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  -- use('nvim-treesitter/playground')
    use{'tpope/vim-fugitive'}
    use{'ellisonleao/gruvbox.nvim'}
    use{'rebelot/kanagawa.nvim'}
    use{'brenoprata10/nvim-highlight-colors'}

    use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
    }

    use{
        'iamcco/markdown-preview.nvim',
        run = function()
          vim.fn["mkdp#util#install"]()
        end,
    }

    use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
          require("nvim-autopairs").setup {}
      end
    }

    use({
      "aurum77/live-server.nvim",
      run = function()
        require"live_server.util".install()
      end,
      cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
    })

    use{'catppuccin/nvim'}
    use{'nvim-tree/nvim-tree.lua'}
    use{'nvim-tree/nvim-web-devicons'}
    use{'mbbill/undotree'}
    use{'lervag/vimtex'}
    use{'vim-airline/vim-airline'}
    use{'vim-airline/vim-airline-themes'}
    use{'christoomey/vim-tmux-navigator'}
end)
