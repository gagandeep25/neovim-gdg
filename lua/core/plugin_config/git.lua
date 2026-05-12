require('gitsigns').setup()
require('neogit').setup()

vim.keymap.set('n', '<leader>gs', ':Neogit<CR>', { desc = "Open Neogit" })