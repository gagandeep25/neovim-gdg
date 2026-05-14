require("dressing").setup()

require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
})

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗███████╗███╗   ███╗",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██╔════╝████╗ ████║",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║█████╗  ██╔████╔██║",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██╔══╝  ██║╚██╔╝██║",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ███████╗██║ ╚═╝ ██║",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚══════╝╚═╝     ╚═╝",
    "                                                     ",
}
alpha.setup(dashboard.opts)

require("trouble").setup()
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })

-- Diagnostic Configuration
vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- Could be '■', '▎', 'x'
  },
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always', -- Show source (e.g., Pyright, Pylint)
  },
})

-- Show diagnostics in a floating window on hover
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})