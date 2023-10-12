local M = {}

 M.plugins = 'custom.plugins'

 M.ui = {
  theme_toggle = { 'catppuccin', 'nightfox', 'tokyonight', 'onedark' },
  theme = 'catppuccin',
  transparency = true,
  
 }

 M.mappings = require 'custom.mappings'
 
--  require("luasnip.loaders.from_vscode").lazy_load({paths = "~/.config/nvim/lua/custom/snippets"})

return M
