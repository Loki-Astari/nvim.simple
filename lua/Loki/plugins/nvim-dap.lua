
vim.cmd.DapStepOver     = function() require('dap').step_over()         end
vim.cmd.DapStepInto     = function() require('dap').step_into()         end
vim.cmd.DapStepOut      = function() require('dap').step_out()          end
vim.cmd.DapRestart      = function() require('dap').restart()           end
vim.cmd.DapTerminate    = function() require('dap').terminate()         end
vim.cmd.DapListBreak    = function() require('dap').list_breakpoints()  end
vim.cmd.DapClearBreak   = function() require('dap').clear_breakpoints() end
vim.cmd.DapPauseThread  = function() require('dap').pause()             end
vim.cmd.DapUp           = function() require('dap').up()                end
vim.cmd.DapDown         = function() require('dap').down()              end
vim.cmd.DapRunToCursor  = function() require('dap').run_to_cursor()     end
vim.cmd.DapSetBreakpoint= function() require('dap').set_breakpoint()    end



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
