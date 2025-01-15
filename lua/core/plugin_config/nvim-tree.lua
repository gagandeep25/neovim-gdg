vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  view = {
    width = 40,
  },
})

vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<CR>')
