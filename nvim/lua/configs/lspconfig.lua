local configs = require "nvchad.configs.lspconfig"

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local prcfg = {
  settings = {
    pyright = {
      disableOrganizeImports = true, -- Using Ruff
    },
    python = {
      analysis = {
        ignore = { "*" }, -- Using Ruff
        typeCheckingMode = "off", -- Using Ruff
      },
    },
  },
}

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
  { "lua_ls" },
  { "html" },
  { "cssls" },
  { "tailwindcss", twcgf },
  { "svelte" },
  { "pyright", prcfg },
  { "ty" },
  { "ts_ls" },
  { "biome" },
  { "asm_lsp" },
}

for _, lsp in pairs(servers) do
  local name, config = lsp[1], lsp[2]
  if config then
    vim.lsp.config(name, config)
  end
  vim.lsp.config("*", { capabilities = capabilities, on_init = on_init })
  vim.lsp.enable(name)
end
