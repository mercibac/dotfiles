-- require('null-ls').register(require('null-ls-bean-check'))
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics


local sources = {

  formatting.black.with { filetypes = { "python" } },
  formatting.prettier,
  lint.ruff.with { filetypes = { "python" }, extra_args = { "--max-line-length=120" } },
  -- lint.eslint,
  lint.eslint.with({

  diagnostics_format = "[eslint] #{m}\n(#{c})",

  -- only enable eslint if root has .eslintrc.js

  condition = function(utils)

  return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else

  end,

  })
}

-- formatting on file save

local on_attach = function (client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({
      group = augroup,
      buffer = bufnr,
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function ()
        vim.lsp.buf.format({ bufnr = bufnr })
      end
    })
  end
end

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,
}
