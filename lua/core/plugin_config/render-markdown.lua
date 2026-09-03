require("render-markdown").setup({
  -- Render in normal/command mode; show raw text while inserting so editing stays easy.
  render_modes = { "n", "c", "t" },
  completions = { lsp = { enabled = true } },
})

vim.keymap.set("n", "<leader>md", "<cmd>RenderMarkdown toggle<cr>", { desc = "Toggle Markdown rendering" })
