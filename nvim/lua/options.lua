require "nvchad.options"

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

vim.g.mapleader = " "
vim.opt.clipboard = ""
vim.g.python3_host_prog = "D:\\VE\\nvim\\Scripts\\python.exe"
vim.o.shell = "cmd.exe"
vim.o.termguicolors = true
vim.opt.fileencoding = "utf-8"
vim.opt.relativenumber = true
vim.opt.smartindent = true

-- For asyncrun plugin
vim.g.asyncrun_open = 6
vim.g.asynctasks_template = "~/.config/nvim/task_template.ini"
vim.g.asynctasks_term_pos = "toggleterm2"
vim.g.asynctasks_term_close = 1

local lpath = "C:/Users/Merci_Bacman/.config/nvim/lua/custom/my_snippets"
vim.g.luasnippets_path = lpath

vim.cmd [[
 augroup filetypedetect
   autocmd BufNewFile,BufRead *.asm set filetype=nasm
 augroup END
]]

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.env.PATH .. (is_windows and ";" or ":") .. vim.fn.stdpath "data" .. "/mason/bin"
