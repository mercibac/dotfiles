local vim = vim
local enable_providers = {
  "python3_provider",
  "node_provider",
  -- and so on
}
for _, plugin in pairs(enable_providers) do
  vim.g["loaded_" .. plugin] = nil
  vim.cmd("runtime " .. plugin)
end

vim.opt.title = true
vim.opt.relativenumber = true                   -- set relative numbered lines
vim.g.python3_host_prog = 'D:/VE/Nvim/Scripts/python' --'~/Python/Python39/python'
vim.opt.wrap = false
vim.opt.termguicolors = true 
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
-- vim.o.shell = 'cmd'

-- Set nushell as my default terminal
vim.api.nvim_set_option('shell', 'nu')
vim.api.nvim_set_option('shellcmdflag', '-c')
vim.api.nvim_set_option('shellquote', '')
vim.api.nvim_set_option('shellxquote', '')


-- UFO folding
-- vim.o.foldcolumn = "1" -- '0' is not bad
-- vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- vim.o.foldlevelstart = 99
-- vim.o.foldenable = true
-- -- vim.o.foldclose = true
-- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
