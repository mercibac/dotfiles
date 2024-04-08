require "nvchad.mappings"

local map = vim.keymap.set


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
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <cr>")
map("n", "<leader>dr", "<cmd> DapContinue <cr>")

map("n", "<leader>dpr", function ()
    require("dap-python").test_method()
end)

-- UI improvement plugins
map("n", "<leader>ss", ":SearchBoxIncSearch<CR>")
map("n", "<leader>sr", ":SearchBoxReplace<CR>")
map("n", "<leader>sc", ":SearchBoxReplace confirm=menu<CR>")
