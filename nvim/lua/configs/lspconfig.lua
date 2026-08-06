require("nvchad.configs.lspconfig").defaults()

local twcgf = {
  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
      experimental = {
        classRegex = {
          'tw([^"])',
          'tw="([^"])',
          'tw={"([^"}])',
          'tw\\.\\w+([^"])',
          'tw\\(.?\\)([^"])',
        },
      },
    },
  },
}

local servers = {
  lua_ls = {},
  html = {},
  cssls = {},
  tailwindcss = twcgf,
  svelte = {},
  ty = {},
  -- REPLACEMENT: vtsls configuration
  -- pyrefly = {
  --   on_init = function(client)
  --     -- Strip features so they don't compete with ty
  --     client.server_capabilities.completionProvider = false
  --     client.server_capabilities.documentHighlightProvider = false
  --     client.server_capabilities.hoverProvider = false
  --   end,
  -- },
  vtsls = {
    -- Explicitly ensure it attaches to React files
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx"
    },
    settings = {
      complete_function_calls = true,
      vtsls = {
        enableMoveToFileCodeAction = true,
        autoUseWorkspaceTsdk = true,
        experimental = {
          completion = {
            enableServerSideFuzzyMatch = true,
          },
        },
      },
      typescript = {
        updateImportsOnFileMove = { enabled = "always" },
        suggest = {
          completeFunctionCalls = true,
        },
        inlayHints = {
          parameterNames = { enabled = "literals" },
          parameterTypes = { enabled = true },
          variableTypes = { enabled = false },
          propertyDeclarationTypes = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          enumMemberValues = { enabled = true },
        },
      },
    },
  },
  biome = {},
  docker_language_server = {},
  docker_compose_language_service = {},
  slint_lsp = {},
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end
