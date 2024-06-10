return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        -- require('lazy').addWhich(require('which-key'))
    end,
    opts = {
        -- https://github.com/folke/which-key.nvim
    }
}
