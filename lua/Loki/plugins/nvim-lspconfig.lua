local opts = {
    plugin = true,

    -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

    n = {
        ["gD"] = {
            function()
                vim.lsp.buf.declaration()
            end,
            "LSP declaration",
        },

        ["gd"] = {
            function()
                vim.lsp.buf.definition()
            end,
            "LSP definition",
        },

        ["K"] = {
            function()
                vim.lsp.buf.hover()
            end,
            "LSP hover",
        },

        ["gi"] = {
            function()
                vim.lsp.buf.implementation()
            end,
            "LSP implementation",
        },

        ["<leader>ls"] = {
            function()
                vim.lsp.buf.signature_help()
            end,
            "LSP signature help",
        },

        ["<leader>D"] = {
            function()
                vim.lsp.buf.type_definition()
            end,
            "LSP definition type",
        },

        ["<leader>ra"] = {
            function()
                require("nvchad.renamer").open()
            end,
            "LSP rename",
        },

        ["<leader>ca"] = {
            function()
                vim.lsp.buf.code_action()
            end,
            "LSP code action",
        },

        ["gr"] = {
            function()
                vim.lsp.buf.references()
            end,
            "LSP references",
        },

        ["<leader>lf"] = {
            function()
                vim.diagnostic.open_float { border = "rounded" }
            end,
            "Floating diagnostic",
        },

        ["[d"] = {
            function()
                vim.diagnostic.goto_prev { float = { border = "rounded" } }
            end,
            "Goto prev",
        },

        ["]d"] = {
            function()
                vim.diagnostic.goto_next { float = { border = "rounded" } }
            end,
            "Goto next",
        },

        ["<leader>q"] = {
            function()
                vim.diagnostic.setloclist()
            end,
            "Diagnostic setloclist",
        },

        ["<leader>wa"] = {
            function()
                vim.lsp.buf.add_workspace_folder()
            end,
            "Add workspace folder",
        },

        ["<leader>wr"] = {
            function()
                vim.lsp.buf.remove_workspace_folder()
            end,
            "Remove workspace folder",
        },

        ["<leader>wl"] = {
            function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end,
            "List workspace folders",
        },
    },

    v = {
        ["<leader>ca"] = {
            function()
                vim.lsp.buf.code_action()
            end,
            "LSP code action",
        },
    },
}
---

local capabilities = {}

capabilities.Lua = vim.lsp.protocol.make_client_capabilities()
capabilities.Lua.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}
capabilities.clangd = vim.lsp.protocol.make_client_capabilities()
capabilities.clangd.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}


return {
    "neovim/nvim-lspconfig",
    -- event = "User FilePost",
    dependencies = {
        'williamboman/mason.nvim'
    },

    config = function()
        require("lspconfig").lua_ls.setup {
            capabilities = capabilities.Lua,

            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                            [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
                            [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
                        },
                        maxPreload = 100000,
                        preloadFileSize = 10000,
                    },
                },
            },
        }

        local handle = assert(io.popen('make neovimflags', 'r'))
        local output = handle:read('*a')
        io.close(handle)

        local flags = {}
        for word in output:gmatch("%S+") do
            table.insert(flags, word)
        end

        require("lspconfig").clangd.setup {
            capabilities = capabilities.clangd,
            cmd = {'/Library/Developer/CommandLineTools/usr/bin/clangd',},
            filetypes = {'c', 'cpp', 'cc', 'mpp', 'ixx', 'tpp'},
            init_options = {
                -- @see https://clangd.llvm.org/extensions#compilation-commands
                -- Controls the flags used when no specific compile command is found.
                -- The compile command will be approximately clang $FILE $fallbackFlags in this case.
                fallbackFlags = flags,
            },
        }
    end,
}
