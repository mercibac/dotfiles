local opts = {
  enabled = function()
    local disabled_filetypes = { "TelescopePrompt", "DressingInput" }
    return not vim.tbl_contains(disabled_filetypes, vim.bo.filetype)
  end,
  keymap = {
    preset = "default",
    ["<CR>"] = { "accept", "fallback" },
    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
  },
  appearance = { nerd_font_variant = "normal", use_nvim_cmp_as_default = true },
  snippets = { preset = "luasnip" },
  cmdline = { enabled = false },
  signature = { enabled = false },
  fuzzy = {
    implementation = "lua",
    max_typos = function(keyword)
      return math.floor(#keyword / 4)
    end,
    use_proximity = true,
    sorts = {
      "exact",
    },
  },
  sources = {
    default = { "lsp", "snippets", "path" },
  },
  completion = {
    list = {
      selection = {
        preselect = false,
      },
    },
  },
}

return opts
