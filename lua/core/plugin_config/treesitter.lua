require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "ruby", "vim", "html", "python", "verilog", "systemverilog", "latex" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = {'latex'},
  },
  indent = {
    enable = true,
  },
}
