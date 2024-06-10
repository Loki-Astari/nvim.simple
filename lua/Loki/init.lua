print "Loki"
require("Loki.options")
require("Loki.remap")
require("Loki.lazy")

local dap = require('dap')
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/local/Cellar/llvm/18.1.6/bin/lldb-dap',
    name = 'lldb'
}


dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    },
}

