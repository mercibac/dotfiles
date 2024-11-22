require "nvchad.mappings"

local map = vim.keymap.set
local harpoon = require("harpoon")
local ufo = require("ufo")


map("v", "<", "<gv")
map("v", ">", ">gv")
map("v",  "<A-j>",":m '>+1<CR>gv=gv")-- move line up(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)
map("v", "qq", ":norm! @q<CR>")

map("n", "<C-a>", "gg<S-v>G")
map("n", "<leader><space>", "<cmd>wqa<cr>")
map("n", "<leader><cr>", "<cmd>qa!<cr>")
map("n", "<leader>a", "<cmd>NvimTreeClose<cr>")
map("n", "<leader>0", "<cmd>LspStop<cr>")
map("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
map("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)

-- Telescope plugin
map("n", "<leader>gg", "<Cmd>Telescope frecency<CR>")

-- DAP plugin
map("n", "<leader>db", "<cmd>DapToggleBreakpoint <cr>")
map("n", "<leader>dr", "<cmd>DapContinue <cr>")

map("n", "<leader>dpr", function ()
    require("dap-python").test_method()
end)

-- Neotest
-- map("n", "<leader>tt", "<Cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>")
map("n", "<leader>tt", "<Cmd>lua require('neotest').run.run()<CR>")  --run all test in the file
map("n", "<leader>ts", "<Cmd>lua require('neotest').run.stop()<CR>")  --run all test in the file
map("n", "<leader>tv", "<Cmd>lua require('neotest').summary.toggle()<CR>")  --run all test in the file


-- UI improvement plugins
map("n", "<leader>ss", ":SearchBoxIncSearch<CR>")
map("n", "<leader>sr", ":SearchBoxReplace<CR>")
map("n", "<leader>sc", ":SearchBoxReplace confirm=menu<CR>")

-- Harpoon

map("n", "<leader>Ha", function() harpoon:list():add() end)
map("n", "<leader>He", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

--  nvim-ufo plugin
map("n", "z1", function() ufo.closeFoldsWith(1) end, {desc = "󱃄 Close L1 Folds"} )
map("n", "z2", function() ufo.closeFoldsWith(2) end, {desc = "󱃄 Close L2 Folds"} )
map("n", "z3", function() ufo.closeFoldsWith(3) end, {desc = "󱃄 Close L3 Folds"} )
map("n", "z4", function() ufo.closeFoldsWith(3) end, {desc = "󱃄 Close L4 Folds"} )


--got-to-preview
map("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>")
map("n", "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>")
map("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
map("n", "gpD", "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>")
map("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>")
map("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>")
