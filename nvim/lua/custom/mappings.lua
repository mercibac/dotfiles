local M = {}

M.general = {
  v = {
    ['<'] = {"<gv"},
    ['>'] = {">gv"},
    ["<A-j>"] = {":m '>+1<CR>gv=gv"}, -- move line up(v)
    ["<A-k>"] = {":m '<-2<CR>gv=gv"}, -- move line down(v)
    ["qq"] = {":norm! @q<CR>"},
  },

  n = {
    ['<C-a>'] = {'gg<S-v>G'},
    ['<leader><space>'] = {'<cmd>wqa<cr>'},
    ['<leader><cr>'] = {'<cmd>qa!<cr>'},
    ['<leader>0'] = {'<cmd>LspStop<cr>'},
    ["<A-j>"] = {":m .+1<CR>=="}, -- move line up(n)
    ["<A-k>"] = {":m .-2<CR>=="}, -- move line down(n)
  }
}

M.telescope = {
  n = {
    ["<leader>gg"] = {"<Cmd>Telescope frecency<CR>"},
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <cr>"},

  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function ()
        require("dap-python").test_method()
      end
    }

  }
}

return M
