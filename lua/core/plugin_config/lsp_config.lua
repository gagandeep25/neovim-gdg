require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "clangd", "pyright", "verible", "texlab", "matlab_ls", "bashls" }
})

-- Modern way: Use LspAttach autocmd for keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', require("telescope.builtin").lsp_references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  end,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = { "lua_ls", "clangd", "pyright", "verible", "texlab", "matlab_ls", "bashls" }

for _, lsp in ipairs(servers) do
  local config = {
    capabilities = capabilities,
  }

  if lsp == "pyright" then
    config.filetypes = { "python" }
  elseif lsp == "verible" then
    config.cmd = { 'verible-verilog-ls', '--rules=-no-tabs,-explicit-parameter-storage-type,' }
  end

  -- Modern Neovim 0.11+ API
  vim.lsp.config(lsp, config)
  vim.lsp.enable(lsp)
end
