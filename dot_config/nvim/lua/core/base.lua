vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'                  -- the enconding writting to a file

vim.wo.number = true                            -- set number line

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true                      -- make indent smart again
vim.opt.backup = false
-- vim.opt.clipboard = 'unnamedplus'
vim.opt.hlsearch = true                         -- highlight all match on previous case
vim.opt.showcmd = true
vim.opt.cmdheight = 1                           -- More space in neovim command line for displaying messages 
vim.opt.laststatus = 2
vim.opt.expandtab = true                        -- Convert tabs to spaces                    
vim.opt.scrolloff = 10
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true                       -- Case insenitive searching UNLESS /C capital in search
vim.opt.smarttab = true
vim.opt.tabstop = 4
vim.opt.relativenumber = true                   -- set relative numbered lines
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.opt.wrap = false                            -- No wrap lines
vim.opt.breakindent = true
vim.opt.backspace = {'start', 'eol', 'indent'}
vim.opt.showmode = false

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

vim.g.python3_host_prog = '~/Python/Python39/python'

local opts = { noremap = true, silent = true }
-- Normal-mode commands
vim.keymap.set('n', '<A-j>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
vim.keymap.set('n', '<A-l>', ':MoveHChar(1)<CR>', opts)

-- Visual-mode commands
vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)


-- Keymap - ToggleTerm for Python Projects (Exercism workflow)
vim.keymap.set("n", "<A-o>", ':2TermExec cmd="python %"<CR>' , opts)
vim.keymap.set("n", "<A-t>", ':2TermExec cmd="pytest -o mark=tasks %:r_test.py"<CR>' , opts)
