local plugins = {
  {
  -- In order ts modify the `lspconfig` configuration:
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
        "pyright",
        "ruff",
        "black",
        "mypy",
        "debugpy",
        "lua-language-server",
        "stylelua",
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

  {
    "mfussenegger/nvim-dap",
    config = function (_)
      require "configs.dap"
    end,
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
    "mfussenegger/nvim-dap-python",
    ft = {"python", "javascript"},
    dependencies = {
      "mfussenegger/nvim-dap",
       "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function (_)
      local path = "D:/VE/Nvim/Scripts/pythonw.exe"
      require("dap-python").setup(path)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults and tools 
        "lua",
        "sql",
        "nu",
        "bash",
        "vim",
        "vimdoc",
        "luadoc",
        "yaml",
        "toml",
        "xml",
        "diff",
        "gitignore",
        "gitcommit",
        "git_config",
        "git_rebase",
        "gitattributes",

        -- software development and DevOps
        "rust",
        "pascal",
        "dockerfile",

        -- web dev and markup 
        "python",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "latex",
        "markdown_inline",

        --frameworks
        "svelte",

      },
    },
    dependencies = {
        -- NOTE: additional parser
        { "nushell/tree-sitter-nu" },
    },
    build = ":TSUpdate",
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require "configs.nvim-treesitter-textobjects" -- Load our custom configuration for lspconfig
    end
  },

  {
    'kevinhwang91/nvim-ufo',
    -- event = { "BufReadPre", "BufNewFile" }, - Will get an ufo.end error
    event = "UIEnter", -- needed for folds to load in time and comments being closed
    dependencies = { 'kevinhwang91/promise-async' },
    opts = {
      filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
    },

    config = function()
      require "configs.nvim-ufo" -- Load our custom configuration for lspconfig
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
    "nvim-neotest/neotest",
    ft = { "go", "javascript", "typescript", "javascriptreact", "typescriptreact", "python" },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-neotest/neotest-python",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter"
    },
    config = function()
      require "configs.neotest"
    end,
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
  },

  {
    'LhKipp/nvim-nu',
    ft = "nu",
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
    cmd = "Trouble",
    keys = {
      { "<leader>i", "<cmd>Trouble<cr>", desc = "trouble" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
  },

  {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim" },
      event = { "BufReadPost", "BufNewFile" },
      config = function()
        require("harpoon").setup()
      end,
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
      'MeanderingProgrammer/render-markdown.nvim',
      ft = "markdown",
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
      ---@module 'render-markdown'
---@diagnostic disable-next-line: undefined-doc-name
      ---@type render.md.UserConfig
      keys = {
        {
          "<leader>oc",
          function() require("render-markdown").toggle() end,
          ft = "markdown",
          desc = " Markdown Render",
        },
      },
      opts = {
        render_modes = { "n", "c", "i", "v", "V" },
        bullet = {
          icons = { "▪️", "▫️", "•", "◦" },
        },
        heading = {
          icons = {}, -- disables icons
        },
        code = {
          border = "thick",
          position = "left",
        },
        sign = { enabled = false },
        win_options = {
          -- toggling this plugin should also toggle conceallevel
          conceallevel = { default = 0, rendered = 3 },
        },
      },
  },

  {
    "VonHeikemen/searchbox.nvim",
    event = "VimEnter",
    init = function() end,
    dependencies = "MunifTanjim/nui.nvim",
  },

  {
    "FeiyouG/commander.nvim",
    event = "UIEnter",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    commander = {
      {
        desc = "Open Commander",
        cmd = function() require("commander").show() end,
        keys = {
          { "n", "<leader>fc" },
        },
      }
    },
    opts = {
      components = {
        "DESC",
        "KEYS",
        "CAT",
      },
      sort_by = {
        "DESC",
        "KEYS",
        "CAT",
        "CMD"
      },

      integration = {
        telescope = {
          enable = true,
        },
        lazy = {
          enable = true,
          set_plugin_name_as_cat = true
        }
      }
    }
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    config = function()
      require("lsp_signature").setup()
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },

  {
    "luckasRanarison/clear-action.nvim",
    config = function()
      require("clear-action").setup({})
    end
  },

  {
    "Pocco81/true-zen.nvim",
    keys = {
      { "<leader>zf", "<cmd>TZFocus<cr>", desc = "focus" },
      { "<leader>zm", "<cmd>TZMinimalist<cr>", desc = "minimalist" },
      { "<leader>za", "<cmd>TZAtaraxis<cr>", desc = "ataraxis" },
    },
    config = function () require("true-zen")
    end
  },
}

return plugins
