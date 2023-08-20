local M = {}

M.general = {
  -- i = {
  --   ['jj'] = {"<ESC>", "Escape Insert Mode"}
  -- },
  v = {
    ['<'] = {"<gv"},
    ['>'] = {">gv"},
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
