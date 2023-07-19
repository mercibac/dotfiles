local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
   
  formatting.black.with { filetypes = { "python" } },
  formatting.prettier,
  lint.ruff.with { filetypes = { "python" }, extra_args = { "--max-line-length=120" } },
}

-- Avoiding LSP formatting conflicts
-- local lsp_formatting = function(bufnr)
--     vim.lsp.buf.format({
--         filter = function(client)
--             -- apply whatever logic you want (in this example, we'll only use null-ls)
--             return client.name == "null-ls"
--         end,
--         bufnr = bufnr,
--     })
-- end


-- Set sources and format on save

null_ls.setup {
  debug = true,
  sources = sources,
}
