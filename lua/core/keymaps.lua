vim.g.mapleader = ' '
vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.cmd("set clipboard+=unnamedplus")

vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 300

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<C-s>', ':w<CR>')
