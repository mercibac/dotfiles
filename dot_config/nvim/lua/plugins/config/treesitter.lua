require 'nvim-treesitter.install'.compilers = { 'clang' }

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  ensure_installed = { "bash", "c", 'lua', "javascript", "json", "python", "typescript", "css", "markdown",
    "markdown_inline" }, -- one of "all" or a list of languages
  ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "css", "lua" }, -- list of language that will be disabled
  },
  autotag = {
    enable = true,
    filetypes = { "html" , "xml" },
  },
  indent = { enable = true, disable = {"python"} },
})
