vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
--vim.opt.undodit = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true


vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn ="80"

vim.cmd("set clipboard+=unnamedplus")

vim.cmd("iab <expr> r80= repeat('=', 80)")
vim.cmd("iab <expr> r80- repeat('-', 80)")

vim.cmd("iab <expr> r90= repeat('=', 90)")
vim.cmd("iab <expr> r90- repeat('-', 90)")

vim.cmd("iab <expr> zbang+ repeat('#!/usr/bin/zsh', 1)")
vim.cmd("iab <expr> shebang+ repeat('#!/usr/bin/bash', 1)")
