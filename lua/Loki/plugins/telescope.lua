vim.cmd.TelFindFile         = function()    require('telescope.builtin').find_files()                                           end
vim.cmd.TelFindAll          = function()    require('telescope.builtin').find_files({follow=true, no_ignore=true, hidden=true}) end
vim.cmd.TelGrep             = function()    require('telescope.builtin').live_grep()                                            end
vim.cmd.TelFindBuffer       = function()    require('telescope.builtin').buffers()                                              end
vim.cmd.TelFindHelp         = function()    require('telescope.builtin').help_tags()                                            end
vim.cmd.TelFindOldFiles     = function()    require('telescope.builtin').oldfiles()                                             end
vim.cmd.TelFuzzyFind        = function()    require('telescope.builtin').current_buffer_fuzzy_find()                            end
vim.cmd.TelFindTags         = function()    require('telescope.builtin').marks()                                                end
vim.cmd.TelFindTags         = function()    require('telescope.builtin').tags()                                                 end
vim.cmd.TelFindGitCommits   = function()    require('telescope.builtin').git_commits()                                          end
vim.cmd.TelFindGitStatus    = function()    require('telescope.builtin').git_status()                                           end
vim.cmd.TelFindBuiltins     = function()    require('telescope.builtin').builtin()                                              end
vim.cmd.TelFindQuickFix     = function()    require('telescope.builtin').quickfix()                                             end
vim.cmd.TelFindVimOptions   = function()    require('telescope.builtin').vim_options()                                          end
vim.cmd.TelFindColourScheme = function()    require('telescope.builtin').colorscheme()                                          end
vim.cmd.TelFindKeyMaps      = function()    require('telescope.builtin').keymaps()                                              end
vim.cmd.TelFindRegisters    = function()    require('telescope.builtin').registers()                                            end
vim.cmd.TelFindDiagnostics  = function()    require('telescope.builtin').diagnostics()                                          end

return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
        'sharkdp/fd',
    },
    config = function(opt)
        opt.extnesions = {
            theme = "ivy",
            hijack_netrw = true,
            -- mappings = {}
        }
        require('telescope').setup(opt)
        require('telescope').load_extension('file_browser')
    end
}
