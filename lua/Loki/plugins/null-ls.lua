local augroup = vim.api.nvim_create_augroup("LspFormatting", {})



return {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.clang_format,
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({
                        group = augroup,
                        buffer = bufnr,
                    })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({bufnr = bufnr})
                        end,
                    })
                end
            end,
        })
    end
}
