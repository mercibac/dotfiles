local plugins = {
  {
  -- In order to modify the `lspconfig` configuration:
    "neovim/nvim-lspconfig",

     dependencies = {
       "jose-elias-alvarez/null-ls.nvim",
       config = function()
         require "configs.null-ls"
       end,
     },

    config = function()
        require("nvchad.configs.lspconfig").defaults()
        require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "basedpyright",
        "ruff",
        "black",
        "mypy",
        "debugpy",
        "lua-language-server",
        "typescript-language-server",
        "js-debug-adapter",
        "prettier",
        "svelte-language-server",
        "tailwindcss-language-server",
        "eslint-lsp",
      },
    },
  },

  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension "frecency"
    end,
  },

  -- {
  --   "rcarriga/nvim-dap-ui",
  --   dependencies = "mfussenegger/nvim-dap",
  --   config = function ()
  --     local dap = require("dap")
  --     local dapui = require("dapui")
  --     dapui.setup()
  --     dap.listeners.after.event_initialized["dapui_config"] = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.event_terminated["dapui_config"] = function()
  --       dapui.close()
  --     end
  --     dap.listeners.before.event_exited["dapui_config"] = function()
  --       dapui.close()
  --     end
  --   end
  --
  -- },

  -- {
  --   "mfussenegger/nvim-dap",
  --   config = function (_)
  --     require("core.utils").load_mappings("dap")
  --     require "nvchad.configs.dap"
  --   end,
  -- },
  --
  -- {
  --   "mfussenegger/nvim-dap-python",
  --   ft = {"python", "javascript"},
  --   dependencies = {
  --     "mfussenegger/nvim-dap",
  --     "rcarriga/nvim-dap-ui",
  --     "nvim-neotest/nvim-nio",
  --   },
  --   config = function (_)
  --     local path = "D:/VE/debugpy/Scripts/python"
  --     require("dap-python").setup(path)
  --     require("core.utils").load_mappings("dap_python")
  --   end,
  -- },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults and tools 
        "lua",
        "sql",

        -- software development
        "rust",
        "pascal",

        -- web dev 
        "python",
        "html",
        "css",
        "javascript",
        "json",

        --frameworks
        "svelte",

      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    -- event = "VeryLazy",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require "configs.nvim-treesitter-textobjects" -- Load our custom configuration for lspconfig
    end
  },

  {
    'skywind3000/asynctasks.vim',
    dependencies = 'skywind3000/asyncrun.vim',
    cmd = 'AsyncTaskEdit',
    keys = {
      { "<F4>", "<cmd>AsyncTask project-clean<cr>", silent=true, desc = "Clean Project" },
      { "<F5>", "<cmd>execute 'silent w' | AsyncTask file-run<cr>", silent=true, desc = "Run File" },
      { "<F6>", "<cmd>AsyncTask file-build<cr>", silent=true, desc = "Build File" },
      { "<F7>", "<cmd>AsyncTask file-test<cr>", silent=true, desc = "Test File" },
      { "<F8>", "<cmd>AsyncTask project-test<cr>", silent=true, desc = "Project File" },
      { "<F9>", "<cmd>AsyncTask project-run<cr>", silent=true, desc = "Run Project" },
      { "<F10>", "<cmd>AsyncTask project-build<cr>", silent=true, desc = "Build Project" },
    }
  },

  {
    "max397574/better-escape.nvim",
      event = "InsertEnter",
      config = function()
        require("better_escape").setup()
      end
  },

  {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
  },

  {
      "mg979/vim-visual-multi",
      event = "VeryLazy",
      -- config = function()
      --   require("vim-visual-multi").setup()
      -- end
  },

  {
    'LhKipp/nvim-nu',
    config = function() require'nu'.setup{}
    end
  },

  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },

    keys = {
      { "<leader>dm", '<cmd>lua require("dbee").open()<cr>', desc = "Open MySQL Database" },
    },

    config = function()
      require("dbee").setup {
        sources = {
          require("dbee.sources").MemorySource:new({
            {
              name = "MySQL",
              type = "mysql",
              -- Update the root password to null
              url = "root:@tcp(localhost:3306)/mysql",
            },
          }),
      },
    }
    end
  },

  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      direction = 'horizontal',
    }
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>i", "<cmd>Trouble<cr>", desc = "trouble" },
    },
  },

  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end
  },

  {
    "Pocco81/true-zen.nvim",
    -- lazy = false,
    keys = {
      { "<leader>zf", "<cmd>TZFocus<cr>", desc = "focus" },
      { "<leader>zm", "<cmd>TZMinimalist<cr>", desc = "minimalist" },
      { "<leader>za", "<cmd>TZAtaraxis<cr>", desc = "ataraxis" },
    },
    -- ft = "nu",
    config = function () require("true-zen")
    end
  },
}

return plugins
