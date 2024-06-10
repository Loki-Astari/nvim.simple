vim.cmd.GitNextHunk     = function()    require('gitsigns').next_hunk()         end
vim.cmd.GitPrevHunk     = function()    require('gitsigns').prev_hunk()         end
vim.cmd.GitDiff         = function()    require('gitsigns').diffthis()          end
vim.cmd.GitBlame        = function()    require('gitsigns').blame_line()        end
vim.cmd.GitResetHunk    = function()    require('gitsigns').reset_hunk()        end
vim.cmd.GitResetVisHunk = function()
    local selectB = vim.fn.getpos("v")[2]
    local selectE = vim.fn.getpos(".")[2]
    require('gitsigns').reset_hunk({selectB, selectE})
end

return {
    "lewis6991/gitsigns.nvim",
    -- event = "User FilePost",
    opts = {
        signs = {
            add = { text = "+" },
            change = { text = "~" },
            delete = { text = "󰍵" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
            untracked = { text = "?" },
        },
    }
}
