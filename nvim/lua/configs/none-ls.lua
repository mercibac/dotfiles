-- require('null-ls').register(require('null-ls-bean-check'))
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require('null-ls')

local lint = null_ls.builtins.diagnostics

local sources = {
  lint.ruff.with { filetypes = { "python" }, extra_args = { "--max-line-length=120" } },
  require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
}

null_ls.setup {
  debug = true,
  sources = sources,
}
