vim.keymap.set("n", "<C-N>", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


-- Debugging
local wk = require('which-key');
vim.print(wk)
wk.register({
    ["<leader>"] = {
        d = {
            name = "Debug", -- optional group name
            t = { vim.cmd.DapTerminate,         "Terminate" },
            r = { vim.cmd.DapContinue,          "Run/Continue: <C-r>" },
            e = { vim.cmd.DapRestart,           "Restart" },
            p = { vim.cmd.DapPauseThread,       "Pause threads" },

            s = { vim.cmd.DapStepOver,          "Step-Over: <C-s>" },
            d = { vim.cmd.DapStepInto,          "Step-Into: <C-d>" },
            f = { vim.cmd.DapStepOut,           "Step-Out:  <C-f>" },

            b = { vim.cmd.DapToggleBreakpoint,  "Toggle Break-Point" },
            B = { vim.cmd.DapSetBreakpoint,     "Set Break-Point" },
            c = { vim.cmd.DapClearBreak,        "Clear all Break-Points" },

            k = { vim.cmd.DapUp,                "Move up call stack" },
            j = { vim.cmd.DapDown,              "Move down call stack" },
            R = { vim.cmd.DapRunToCursor,       "Run to Cursor: <C-R>" },

            U = { vim.cmd.DapUIToggle,          "DAP UI: <C-1>"},
            h = { vim.cmd.DapUIHover,           "Show variable under cursor"},
            v = { vim.cmd.DapUIPreview,         "Preview?"},
        },
        g = {
            name = "Git",
            n = { vim.cmd.GitNextHunk,          "Jump to next hunk: ]g" },
            p = { vim.cmd.GitPrevHunk,          "Jump to prev hunk: [g" },
            d = { vim.cmd.GitDiff,              "Git Diff"},
            b = { vim.cmd.GitBlame,             "Blame"},
            r = { vim.cmd.GitResetHunk,         "Reset hunk"},
        },
        f = {
            name = "Telescope",
            f = { vim.cmd.TelFindFile,          "Find files" },
            a = { vim.cmd.TelFindAll,           "Find all" },
            w = { vim.cmd.TelGrep,              "Live grep" },
            b = { vim.cmd.TelFindBuffer,        "Find buffers" },
            h = { vim.cmd.TelFindHelp,          "Help page" },
            o = { vim.cmd.TelFindOldFiles,      "Find oldfiles" },
            z = { vim.cmd.TelFuzzyFind,         "Find in current buffer" },
            m = { vim.cmd.TelFindTags,          "Find Marks" }, -- marks
            t = { vim.cmd.TelFindTags,          "Find Tags" }, -- tags
            g = { vim.cmd.TelFindGitCommits,    "Find Git Commits" }, -- git_commits
            s = { vim.cmd.TelFindGitStatus,     "Find Git Status" }, -- git_status
            B = { vim.cmd.TelFindBuiltins,      "Find Telescope Builtins" }, -- builtin
            Q = { vim.cmd.TelFindQuickFix,      "Find Content of Quick Fix" }, -- quickfix
            V = { vim.cmd.TelFindVimOptions,    "Find Vim Options" }, -- vim_options
            C = { vim.cmd.TelFindColourScheme,  "Find olour schems" }, -- colorscheme
            K = { vim.cmd.TelFindKeyMaps,       "Find Key Bindings" }, -- keymaps
            R = { vim.cmd.TelFindRegisters,     "Find Register Content" }, -- registers
            D = { vim.cmd.TelFindDiagnostics,   "Find Diagnostics" }, -- diagnostics
 
    -- pick a hidden term
            --["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },
    -- theme switcher
            --["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },
            --["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
        },
    },
})
wk.register({
    ["]R"] = { vim.cmd.GitResetVisHunk,         "Reset Selected Range"}
},
{ mode = "v"}
)
wk.register({
    -- DAP Controls
    ["<C-1>"] = { vim.cmd.DapUIToggle,          "DAP UI" },
    ["<C-r>"] = { vim.cmd.DapContinue,          "DAP Continue" },
    ["<C-s>"] = { vim.cmd.DapStepOver,          "DAP Step Over" },
    ["<C-d>"] = { vim.cmd.DapStepInto,          "DAP Step Into" },
    ["<C-f>"] = { vim.cmd.DapStepOut,           "DAP Step Out" },
    -- Git Controls
    ["]g"] = {vim.cmd.GitNextHunk,              "Jump to next hunk", opts = { expr = true }},
    ["[g"] = {vim.cmd.GitPrevHunk,              "Jump to prev hunk", opts = { expr = true }},
})

