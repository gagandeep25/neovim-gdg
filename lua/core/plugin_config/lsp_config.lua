require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "clangd", "pyright", "verible", "texlab", "matlab_ls", "bashls" }
})

local on_attach = function (_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require("telescope.builtin").lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require("lspconfig")

local servers = { "lua_ls", "clangd", "pyright", "verible", "texlab", "matlab_ls", "bashls" }

for _, lsp in ipairs(servers) do
  local config = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if lsp == "pyright" then
    config.filetypes = { "python" }
  elseif lsp == "verible" then
    config.cmd = { 'verible-verilog-ls', '--rules=-no-tabs,-explicit-parameter-storage-type,' }
  end

  lspconfig[lsp].setup(config)
end
