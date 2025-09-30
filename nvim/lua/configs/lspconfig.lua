require("nvchad.configs.lspconfig").defaults()

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
  lua_ls = {},
  html = {},
  cssls = {},
  tailwindcss = twcgf,
  svelte = {},
  pyright = prcfg,
  ty = {},
  ts_ls = {},
  biome = {},
  asm_lsp = {},
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end
