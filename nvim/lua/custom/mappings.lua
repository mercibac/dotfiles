local M = {}

M.general = {
  v = {
    ['<'] = {"<gv"},
    ['>'] = {">gv"},
    ["qq"] = {":norm! @q<CR>"},
  },

  n = {
    ['<C-a>'] = {'gg<S-v>G'},
    ['<leader><cr>'] = {'<cmd>qa!<cr>'},
    ['<leader><space>'] = {'<cmd>wqa<cr>'},
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
