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
-- vim.g.vscode_snippets_path = 'C:/Users/Merci_Bacman/.config/nvim/lua/custom/snippets/'
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
-- vim.o.shell = 'cmd'

-- Set nushell as my default terminal
-- vim.api.nvim_set_option('shell', 'nu')
-- vim.api.nvim_set_option('shellcmdflag', 'k')
-- vim.api.nvim_set_option('shellquote', '')
-- vim.api.nvim_set_option('shellxquote', '')

-- Define a function to set the file type and syntax highlighting for NASM files
vim.cmd([[
 augroup filetypedetect
   autocmd BufNewFile,BufRead *.asm set filetype=nasm
 augroup END
]])

local lpath = "C:/Users/Merci_Bacman/.config/nvim/lua/custom/my_snippets"
vim.g.vscode_snippets_path = lpath
-- vim.g.snipmate_snippets_path = lpath


-- Global variable for custom configs to allow for custom luasnip snippets.
vim.g.luasnippets_path = lpath -- "./my-snippets/"

-- For asyncrun plugin
vim.g.asyncrun_open = 6
-- vim.g.asynctask_template = 'C:/Users/Merci_Bacman/.config/nvim/task_template.ini'
vim.g.asynctasks_template = '~/.config/nvim/task_template.ini'
vim.g.asynctasks_term_pos = 'toggleterm2'
vim.g.asynctasks_term_close = 1
-- vim.g.asynctasks_term_pos = 'TAB'
