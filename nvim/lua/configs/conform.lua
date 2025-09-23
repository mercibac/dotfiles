local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = {
      "ruff_fix", -- To fix lint errors. (ruff with argument --fix)
      "ruff_format", -- To run the formatter. (ruff with argument format)
    },
    javascript = { "prettierd", "prettier", stop_after_first = true },
  },
}

require("conform").setup(options)

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format { bufnr = args.buf }
  end,
})
