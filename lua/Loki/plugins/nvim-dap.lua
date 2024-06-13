
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
-- Run all the unit tests
vim.cmd.DapRunUnitTests = function() vim.cmd.DapRunUnitTestCode({})     end
-- Run the unit test that the cursor is over.
vim.cmd.DapRunOneTests  = function()
    local lineNo = vim.fn.search('TEST(', 'bn')
    if (lineNo == 0) then
        return
    end
    local text = vim.fn.getline(lineNo)
    vim.print(text)

    local res = { string.match(text, "(%w+)%((%w+), (%w+)%)") }
    if (#res == 3 and res[1] == 'TEST') then
        require('dap').set_breakpoint()
        print("Running: >" .. res[2] .. '.' .. res[3])
        vim.cmd.DapRunUnitTestCode({'---gtest_filter=' .. res[2] .. '.' .. res[3]})
    end
end
vim.cmd.DapRunUnitTestCode = function(args)

    local handle = assert(io.popen('make neovimruntime', 'r'))
    local output = handle:read('*a')
    io.close(handle)
    vim.print(output)

    -- 1: Install luarocks form brew: brew install luarocks.
    -- 2: Install Posix module:       sudo luarocks --lua-version 5.1 install luaposix
    -- 3: Use the plugin 'vhyrro/luarocks.nvim' see: plugin/luarocks.nvim to lazy load the module.
    require('posix').setenv('DYLD_LIBRARY_PATH', output)

    local config = {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = 'test/coverage/unittest.prog',
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = args,
    }

    require('dap').run(config)
end



return {
    "mfussenegger/nvim-dap",
    config = function(_, _)

        if (vim.loop.os_uname().sysname == "Darwin") then
            local handle = io.popen("brew --prefix")
            local output = handle:read("*a")
            local install = string.gsub(output .. "/opt/llvm/bin/lldb-dap", "\n", "")
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
