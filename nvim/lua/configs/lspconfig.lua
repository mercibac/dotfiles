-- custom.plugins.lspconfig
local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = {"pyright","tailwindcss", "html", "lua_ls", "cssls"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = on_init, 
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.svelte.setup { filetypes = { "svelte" } }

lspconfig.tsserver.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  }
}


lspconfig.asm_lsp.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"asm-lsp"},
  filetypes = { "asm", "nasm", "masm", "vmasm", "s", "S" },
}