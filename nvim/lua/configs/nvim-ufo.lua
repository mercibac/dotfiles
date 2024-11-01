vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- Disable ufo for some buffers
vim.api.nvim_create_autocmd("FileType", {
  pattern = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason', 'terminal' },
  callback = function()
    require("ufo").detach()
    vim.opt_local.foldenable = false
  end,
})

-- Define a new augroup
vim.api.nvim_create_augroup("remember_folds", { clear = true })

-- Create autocmd for saving folds when leaving a buffer
vim.api.nvim_create_autocmd("BufWinLeave", {
  group = "remember_folds",
  pattern = "?*",
  callback = function()
    if vim.bo.buftype ~= "terminal" then
      vim.cmd("mkview")
    end
  end,
})

-- Create autocmd for loading folds when entering a buffer
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = "remember_folds",
  pattern = "?*",
  callback = function()
    if vim.bo.buftype ~= "terminal" then
      vim.cmd("silent! loadview")
    end
  end,
})

local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = (" 󰁂 %d "):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0

  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, "MoreMsg" })
  return newVirtText
end

local ftMap = {
  vim = "indent",
  python = { "lsp" },
  -- python = "",
  git = "",
  lua = "lsp",
}


require("ufo").setup {
  open_fold_hl_timeout = 100,
  -- Avoid autofolding on InsertEnter
  hooks = {
---@diagnostic disable-next-line: unused-local
      diff_buf_read = function(bufnr)
          vim.opt_local.foldlevel = 99
          vim.opt_local.foldenable = false
      end,
---@diagnostic disable-next-line: unused-local
      diff_buf_win_enter = function(bufnr)
          vim.opt_local.foldlevel = 99
          vim.opt_local.foldenable = false
      end
  },
  provider_selector = function(filetype)
    return ftMap[filetype] or { "lsp", "indent"}
  end,
  close_fold_kinds_for_ft = {
    default = { "imports", "comment" },
  },
  fold_virt_text_handler = handler,
  enable_get_fold_virt_text = true,
}
