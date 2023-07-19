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
        "typescript-language-server",
        "prettier",
        "svelte-language-server",
        "tailwindcss-language-server",
        "gopls",
      },
    },
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
      { "<leader>d", '<cmd>lua require("dbee").open()<cr>', desc = "open" },
    },
    
    config = function()
      require("dbee").setup {
        sources = {
          require("dbee.sources").MemorySource:new({
            {
              name = "MySQL",
              type = "mysql",
              url = "root:Victoria2023!@tcp(localhost:3306)/idexdb",
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
  -- UFO folding
  -- {
  --   "kevinhwang91/nvim-ufo",
  --   dependencies = {
  --     "kevinhwang91/promise-async",
  --     {
  --       "luukvbaal/statuscol.nvim",
  --       config = function()
  --         local builtin = require("statuscol.builtin")
  --         require("statuscol").setup({
  --           relculright = true,
  --           segments = {
  --             { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
  --             { text = { "%s" }, click = "v:lua.ScSa" },
  --             { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
  --           },
  --         })
  --       end,
  --     },
  --   },
  --   event = "BufReadPost",
  --   opts = {
  --     provider_selector = function()
  --       return { "treesitter", "indent" }
  --     end,
  --   },
  --
  --   init = function()
  --     vim.keymap.set("n", "zR", function()
  --       require("ufo").openAllFolds()
  --     end)
  --     vim.keymap.set("n", "zM", function()
  --       require("ufo").closeAllFolds()
  --     end)
  --   end,
  -- },
  --   -- Folding preview, by default h and l keys are used.
  --   -- On first press of h key, when cursor is on a closed fold, the preview will be shown.
  --   -- On second press the preview will be closed and fold will be opened.
  --   -- When preview is opened, the l key will close it and open fold. In all other cases these keys will work as usual.
  -- { "anuvyklack/fold-preview.nvim",
  --   dependencies = "anuvyklack/keymap-amend.nvim",
  --   config = true 
  -- },

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
