local M = {}

 M.plugins = 'custom.plugins'

 M.ui = {
  theme_toggle = { 'catppuccin', 'nightfox', 'tokyonight', 'onedark' },
  theme = 'catppuccin',
  
 }

 M.mappings = require 'custom.mappings'

return M
