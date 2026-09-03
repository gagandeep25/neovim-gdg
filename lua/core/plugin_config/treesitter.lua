-- nvim-treesitter is pinned to the `main` branch (see lazy-lock.json), whose API
-- differs from the old `master` branch: setup() only configures the install dir,
-- parsers are installed via require('nvim-treesitter').install(), and highlighting
-- is enabled per-buffer with vim.treesitter.start() rather than a `highlight` opt.
local ts = require("nvim-treesitter")

ts.setup()

local ensure_installed = {
  "c", "lua", "rust", "ruby", "vim", "vimdoc", "html", "python", "systemverilog",
  "markdown", "markdown_inline",
}

-- Install any parsers not already present (async; no-op when all are installed).
ts.install(ensure_installed)

-- Enable Treesitter highlighting + indentation for the languages we care about.
vim.api.nvim_create_autocmd("FileType", {
  pattern = ensure_installed,
  callback = function()
    pcall(vim.treesitter.start)
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
