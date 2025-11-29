local plugins = {
  { import = "nvchad.blink.lazyspec" },

  {
    "saghen/blink.cmp",
    -- event = "InsertEnter",
    -- dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
    version = "1.*",
    opts = function()
      return require "configs.blink"
    end,
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      explorer = { enabled = false },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = false },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },

  {
    -- In order ts modify the `lspconfig` configuration:
    "neovim/nvim-lspconfig",

    dependencies = {
      "jay-babu/mason-null-ls.nvim",
      "nvimtools/none-ls.nvim",
      "nvimtools/none-ls-extras.nvim",
      "gbprod/none-ls-shellcheck.nvim",
      config = function()
        require "configs.none-ls"
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
        "lua-language-server",
        "dockerfile-language-server",
        "eslint-lsp",
        "pyright",
        "debugpy",
        "typescript-language-server",
        "svelte-language-server",
        "tailwindcss-language-server",
        "js-debug-adapter",
        "stylelua",
        "ruff",
        "ty",
        "biome",
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "jvgrootveld/telescope-zoxide", "nvim-lua/popup.nvim" },

    opts = {
      extensions_list = { "themes", "terms", "zoxide" },
      extensions = {
        zoxide = {
          prompt_title = "[ Walking on the shoulders of TJ ]",
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {},
    config = function(_)
      require "configs.conform"
    end,
  },

  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension "frecency"
    end,
  },

  {
    "mfussenegger/nvim-dap",
    config = function(_)
      require "configs.dap"
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      ---@diagnostic disable-next-line: different-requires
      local dap = require "dap"
      local dapui = require "dapui"
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
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    cmd = { "DapToggleBreakpoint", "DapContinue", "DapToggleRepl", "DapTerminate" },
    config = function(_)
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
        "bash",
        "vim",
        "vimdoc",
        "luadoc",
        -- "nu",
        "regex",
        "latex",
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
        "beancount",
      },
    },
    build = ":TSUpdate",
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require "configs.nvim-treesitter-textobjects" -- Load our custom configuration for lspconfig
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    -- event = { "BufReadPre", "BufNewFile" }, - Will get an ufo.end error
    event = "UIEnter", -- needed for folds to load in time and comments being closed
    dependencies = { "kevinhwang91/promise-async" },
    opts = {
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
    },

    config = function()
      require "configs.nvim-ufo" -- Load our custom configuration for lspconfig
    end,
  },

  {
    "skywind3000/asynctasks.vim",
    dependencies = "skywind3000/asyncrun.vim",
    cmd = "AsyncTaskEdit",
    keys = {
      { "<F4>", "<cmd>AsyncTask project-clean<cr>", silent = true, desc = "Clean Project" },
      { "<F5>", "<cmd>execute 'silent w' | AsyncTask file-run<cr>", silent = true, desc = "Run File" },
      { "<F6>", "<cmd>AsyncTask file-build<cr>", silent = true, desc = "Build File" },
      { "<F7>", "<cmd>AsyncTask file-test<cr>", silent = true, desc = "Test File" },
      { "<F8>", "<cmd>AsyncTask project-test<cr>", silent = true, desc = "Project File" },
      { "<F9>", "<cmd>AsyncTask project-run<cr>", silent = true, desc = "Run Project" },
      { "<F10>", "<cmd>AsyncTask project-build<cr>", silent = true, desc = "Build Project" },
    },
  },

  {
    "nvim-neotest/neotest",
    ft = { "go", "javascript", "typescript", "javascriptreact", "typescriptreact", "python" },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-neotest/neotest-python",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
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
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
  },

  {
    "LhKipp/nvim-nu",
    ft = "nu",
    config = function()
      require("nu").setup {}
    end,
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
          require("dbee.sources").MemorySource:new {
            {
              name = "MySQL",
              type = "mysql",
              -- Update the root password to null
              url = "root:@tcp(localhost:3306)/mysql",
            },
          },
        },
      }
    end,
  },

  -- {
  --   "iamcco/markdown-preview.nvim",
  --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --   build = "cd app && npm install",
  --   init = function()
  --     vim.g.mkdp_filetypes = { "markdown" }
  --   end,
  --   ft = { "markdown" },
  -- },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = "ToggleTerm",
    config = function()
      require("toggleterm").setup {
        direction = "horizontal",
        shell = "nu.exe",
      }
    end,
  },

  {
    "folke/trouble.nvim",
    event = "BufEnter",
    cmd = "Trouble",
    config = function()
      require("trouble").setup {}
    end,
    keys = {
      { "<leader>i", "<cmd>Trouble diagnostics toggle<cr>", desc = "trouble" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons", { "nvim-mini/mini.nvim", version = "*" } },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ---@module 'render-markdown'
    ---@diagnostic disable-next-line: undefined-doc-name
    ---@type render.md.UserConfig
    keys = {
      {
        "<leader>oc",
        function()
          require("render-markdown").toggle()
        end,
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
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  {
    "rmagatti/goto-preview",
    dependencies = { "rmagatti/logger.nvim" },
    event = "BufEnter",
    config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
  },

  {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      -- your options here
    },
  },

  {
    "piersolenski/import.nvim",
    dependencies = {
      -- One of the following pickers is required:
      -- "nvim-telescope/telescope.nvim",
      "folke/snacks.nvim",
      -- 'ibhagwan/fzf-lua',
    },
    opts = {
      picker = "snacks",
    },
    keys = {
      {
        "<leader>li",
        function()
          require("import").pick()
        end,
        desc = "Import",
      },
    },
  },
  {
    "Pocco81/true-zen.nvim",
    keys = {
      { "<leader>zf", "<cmd>TZFocus<cr>", desc = "focus" },
      { "<leader>zm", "<cmd>TZMinimalist<cr>", desc = "minimalist" },
      { "<leader>za", "<cmd>TZAtaraxis<cr>", desc = "ataraxis" },
    },
    config = function()
      require "true-zen"
    end,
  },

  {
    "dundalek/bloat.nvim",
    cmd = "Bloat",
  },

  {
    "karb94/neoscroll.nvim",
    event = "BufReadPre",
    opts = {},
    config = function()
      require "configs.neoscroll"
    end,
  },

  {
    "soulis-1256/eagle.nvim",
    event = "BufReadPre",
    opts = {
      --override the default values found in config.lua
      mouse_mode = false,
      keyboard_mode = true,
    },
  },

  {
    "chipsenkbeil/distant.nvim",
    branch = "v0.3",
    cmd = { "DistantConnect", "DistantOpen", "DistantShell" },
    config = function()
      require("distant"):setup()
    end,
  },

  {
    "benomahony/uv.nvim",
    ft = { "python" },
    dependencies = {
      "folke/snacks.nvim",
    },
    opts = {
      picker_integration = true,
      keymaps = {
        prefix = "<leader>u",
        -- Disable specific keymaps
        init = false,
      },
    },
  },

  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },

  -- AI capabilities
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
    },
    cmd = {
      "CodeCompanion",
      "CodeCompanionChat",
      "CodeCompanionToggle",
      "CodeCompanionActions",
    },
    config = function()
      require "configs.codecompanion" -- Load our custom configuration for lspconfig
    end,
  },
}

return plugins
