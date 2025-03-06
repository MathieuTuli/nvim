vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.g.alabaster_dim_comments = true

vim.opt.scrolloff = 0
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.laststatus = 3
vim.opt.splitkeep = "screen"

vim.opt.termguicolors = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.conceallevel = 0
-- vim.opt.statusline=[[%f #%{bufnr('%')} %l:%c]]
vim.opt.statusline = [[%f%m %r%=#%{bufnr('%')} %l:%c (%p%%)]]
