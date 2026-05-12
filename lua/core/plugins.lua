local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'EdenEast/nightfox.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  { 'nvim-treesitter/nvim-treesitter', version = 'v0.9.3' },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',
  'christoomey/vim-tmux-navigator',
  "windwp/nvim-autopairs",
  'lervag/vimtex',

  -- New Git Integrations
  'lewis6991/gitsigns.nvim',
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },

  -- Formatting and Linting
  'stevearc/conform.nvim',
  'mfussenegger/nvim-lint',

  -- Workflow and Quality of Life
  'folke/which-key.nvim',
  'numToStr/Comment.nvim',

  -- UI and Aesthetics
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  'goolord/alpha-nvim',
  'stevearc/dressing.nvim',

  -- Diagnostics and Code Navigation
  'folke/trouble.nvim',
  'stevearc/aerial.nvim',

  -- Session Management
  'rmagatti/auto-session',
})
