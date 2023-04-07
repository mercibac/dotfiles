require 'core.base'
require 'core.highlights'
require 'core.maps'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.g.map = ' '
vim.g.maplocal = ' '

require("lazy").setup("plugins", {
 -- defaults = { lazy = true }, -- I will configure it later
 install = { colorscheme = { "nightfox" } },
 performance = {
  rtp = {
   disabled_plugins = {
    "gzip",
    "matchit",
    "matchparen",
    "netrwPlugin",
    "tarPlugin",
    "tohtml",
    "tutor",
    "zipPlugin",
   },
  },
 },
 -- debug = true,
})
