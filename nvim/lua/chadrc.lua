local M = {}

 M.plugins = 'plugins'

 M.ui = {
  -- theme_toggle = { 'catppuccin', 'tokyonight', 'onedark', 'kanagawa' },
  theme_toggle = { 'catppuccin', 'tokyonight', 'onedark', 'kanagawa' },
  theme = 'catppuccin',
  transparency = true,

 }

 M.mappings = require 'mappings'

--  require("luasnip.loaders.from_vscode").lazy_load({paths = "~/.config/nvim/lua/custom/snippets"})

return M
