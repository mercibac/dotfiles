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
  ts_ls = {},
  biome = {},
  docker_language_server = {},
  docker_compose_language_service = {},
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end
