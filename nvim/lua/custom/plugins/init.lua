local plugins = {
  {
  -- In order to modify the `lspconfig` configuration:
    "neovim/nvim-lspconfig",

     dependencies = {
       "jose-elias-alvarez/null-ls.nvim",
       config = function()
         require "custom.plugins.configs.null-ls"
       end,
     },

     config = function()
        require "plugins.configs.lspconfig" -- Load default NvChad lspconfig configuration
        require "custom.plugins.configs.lspconfig" -- Load our custom configuration for lspconfig
     end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "ruff",
        "black",
        "mypy",
        "debugpy",
        "typescript-language-server",
        "prettier",
        "svelte-language-server",
        "tailwindcss-language-server",
        "gopls",
      },
    },
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
     
  },

  {
    "mfussenegger/nvim-dap",
    config = function (_, opts)
      require("core.utils").load_mappings("dap")
    end,
  },
  
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function (_, opts)
      local path = "D:/VE/debugpy/Scripts/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },

  { "CRAG666/code_runner.nvim",
    keys = {
      {
        "<leader>a",
        function()
          require("code_runner").run_code()
        end,
        desc = "Execute Code",
        },
      },
     config = function()
        require "custom.plugins.configs.coderunner" -- Load our custom configuration for lspconfig
     end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults and tools 
        "lua",
        "sql",

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
    "xiyaowong/transparent.nvim",

    keys = {
      { "<leader>tt", "<cmd>TransparentEnable<cr>", desc = "Transparent" },
    },
    cmd = "TransparentEnable",

    config = function () require "custom.plugins.configs.transparent"
    end
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
              url = "root:@tcp(localhost:3306)/idexdb",
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
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    },
    keys = {
      { "<leader>i", "<cmd>Trouble<cr>", desc = "touble" },
    },
  },

  {
    "Pocco81/true-zen.nvim",
    -- lazy = false,
    keys = {
      { "<leader>zf", "<cmd>tzfocus<cr>", desc = "focus" },
      { "<leader>zm", "<cmd>tzminimalist<cr>", desc = "minimalist" },
      { "<leader>za", "<cmd>tzataraxis<cr>", desc = "ataraxis" },
    },
    -- ft = "nu",
    config = function () require("true-zen")
    end
  }
}

return plugins
