return {
    "mfussenegger/nvim-dap",
    config = function(_, _)

        if (vim.loop.os_uname().sysname == "Darwin") then
            local handle = io.popen("brew --prefix")
            local output = handle:read("*a")
            local install = string.gsub(output .. "/opt/llvm/bin/lldb-dap", "\n", "")
            vim.print("lldb: " .. install)
            local exists=io.open(install,"r")
            if exists==nil then
                vim.print("Could not find lldb-dap. Use brew install llvm to install")
            else
                io.close(exists)

                local dap = require('dap')

                dap.adapters.lldb = {
                    type = 'executable',
                    command = install,
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
            end
        end
    end,
}
