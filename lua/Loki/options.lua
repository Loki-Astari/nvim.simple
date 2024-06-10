
--
-- Original Options:
vim.opt.colorcolumn = '100'
vim.opt.scrolloff = 15
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.spell = true
vim.opt.paste = true
vim.opt.list = true
vim.opt.listchars = 'tab:▸ ,trail:␣'
vim.opt.ruler = true
-- vim.opt.cindent = true
-- vim.opt.smartindent = true
-- vim.opt.autoindent = true

-- Some new Options:
vim.opt.clipboard = 'unnamedplus'
vim.opt.cmdheight = 2
vim.opt.fileencoding = 'utf-8'
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.cursorline = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = 'yes'
vim.opt.wrap = false
vim.opt.sidescrolloff = 8
vim.opt.guifont = 'monospace:h17'

-- Change from Defaults
vim.opt.ignorecase = false
vim.opt.cmdheight = 15

-- Adds "-" as part of the word.
vim.cmd [[set iskeyword+=-]]

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

