local home_dir = os.getenv('XDG_CONFIG_HOME')
package.path = home_dir .. "/nvim/lua/plugins/?.lua;" .. package.path

return {

  -- Colorschemes
  {'EdenEast/nightfox.nvim', config = 'vim.cmd("colorscheme nightfox")',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nightfox]])
    end,
  },
  {
  'folke/tokyonight.nvim'
  },
  -- UI enhancements
  -- 'nvim-lualine/lualine.nvim', -- Statusline
  
  { -- Files icons - required by bufferline
    'kyazdani42/nvim-web-devicons',
    config = function() require('nvim-web-devicons').setup {
        -- your personnal icons can go here (to override)
        -- DevIcon will be appended to `name`
        override = {
        },
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true
      }
      end
  },
  
  { -- Tabline
    'akinsho/nvim-bufferline.lua',
    config = function() require('config/bufferline') end
  },

  { -- Statusline
    'nvim-lualine/lualine.nvim', 
    config = function() require('config/lualine') end,
    event = "VimEnter" 
  },

  -- Completions, formatting, linting

  {  -- Completion
    'hrsh7th/nvim-cmp',
    
    event = "InsertEnter",

    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = { 
      'hrsh7th/cmp-buffer', -- nvim-cmp source for buffer words
      'hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for neovim',s built-il LSP
      'saadparwaiz1/cmp_luasnip',    -- bridge between cmp and luasnip
    },

    config = function() require('config/cmp') end
  },
  
  { -- a snippet engine
    'l3mon4d3/luasnip',
    event = 'BufReadPre'
  },
    'rafamadriz/friendly-snippets', -- a snippet bank
    event = "BufReadPre",
  {
      'neovim/nvim-lspconfig',
      event = "BufReadPre",
      config = function() require('config/lspconfig') end,
      dependencies = {
        {'glepnir/lspsaga.nvim',
          config = function() require('config/lspsaga') end
        }, -- LSP UIs
        {'williamboman/mason.nvim',
          config = function() require('mason').setup({}) 
          end
        },
        {'williamboman/mason-lspconfig.nvim',
         config = function() require('mason-lspconfig').setup({automatic_installation = true}) end
        },
        { -- vscode-like pictograms  
        'onsails/lspkind-nvim',
            config = function() require('config/lspkind') end
        }, 
      }

  },

  {
    'nvim-treesitter/nvim-treesitter',
    config = function() require('config/treesitter') end,
    build = function() require('nvim-treesiter.install').update({ with_sync = true }) end
  },

  { 
	'nvim-telescope/telescope.nvim', branch = '0.1.x',
	dependencies = {
		{'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-file-browser.nvim'}
	},
	cmd = { "Telescope", "Tel" }, -- lazy loads on these c
	keys = { "<leader>f" }, -- lazy loads on this pattern
    config = function() require('config/telescope') end
  },

  -- Utilities
  {
    'windwp/nvim-autopairs',
      event='InsertEnter',
      config = function() 
        require('nvim-autopairs').setup({
        disable_filetype = { "TelescopePrompt" , "vim" },
        })
      end
  },
  
  {'windwp/nvim-ts-autotag',
    ft = {'html', 'xml'}
  },
  
  { 'numToStr/Comment.nvim',
    event = 'BufReadPre',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    },
    config = function() require('Comment').setup() end
  },
  
  'fedepujol/move.nvim',
  {
    "kylechui/nvim-surround",
    -- tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
      end
  },

  {'folke/zen-mode.nvim', 
      event = 'VeryLazy',
      config = function() require('zen-mode').setup({
          vim.keymap.set('n', '<C-w>o', '<cmd>ZenMode<cr>', { silent = true })
      })
      end
  },
  {'akinsho/toggleterm.nvim', 
      -- event = 'VeryLazy',
      config = function() require('config/toggleterm') end
  
  },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
     vim.g.startuptime_tries = 10
    end,
  }, 
 }
