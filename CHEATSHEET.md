# Neovim Configuration Cheatsheet

## General / Core Basics
- **Leader Key:** `<Space>`
- **Save File:** `<C-s>` (Control + s)
- **Clear Search Highlights:** `<leader>h`
- **File Explorer (Nvim-Tree):** `<C-n>` to toggle/find current file

## Window Navigation (Tmux-Integrated)
- **Move Left:** `<C-h>`
- **Move Down:** `<C-j>`
- **Move Up:** `<C-k>`
- **Move Right:** `<C-l>`

## Search and Finding (Telescope)
- **Find Files:** `<C-p>`
- **Recent Files:** `<Space><Space>`
- **Live Grep (Search in text):** `<leader>fg`
- **Help Tags:** `<leader>fh`

## Git Integration
- **Open Neogit:** `<leader>gs`
- **Gitsigns:** Hunks will visually appear in the sign column. 
  - (Use `:Gitsigns next_hunk` / `:Gitsigns prev_hunk` etc.)

## LSP & Code Intelligence
- **Hover / Documentation:** `K`
- **Go to Definition:** `gd`
- **Go to Implementation:** `gi`
- **Find References:** `gr` (Opens in Telescope)
- **Rename Symbol:** `<leader>rn`
- **Code Actions:** `<leader>ca`
- **Diagnostics:**
  - **Inline:** Messages now appear at the end of the line (Virtual Text).
  - **Hover:** Just pause your cursor on a line to see the error in a floating window.
  - **Trouble Panel:** `<leader>xx` for workspace-wide errors.

## Formatting & Code Quality
- **Formatting:** Handled automatically on save by `conform.nvim`.
- **Linting:** Runs automatically on save (`nvim-lint`).
- **Workspace Diagnostics (Trouble):** `<leader>xx`
- **Document Diagnostics (Trouble):** `<leader>xX`

## Workflow Enhancements
- **Code Outline (Aerial):** `<leader>a` (Toggle structural view of file)
  - Jump to prev/next symbol: `{` and `}` (when outline is active)
- **Commenting (Comment.nvim):**
  - Toggle Line Comment: `gcc` (Normal mode)
  - Toggle Block Comment: `gc` (Visual mode)
- **Which-Key:** Just press `<Space>` and wait 1 second to see a menu of all available leader shortcuts!
- **Sessions:** `auto-session` automatically saves and restores your workflow for each directory you visit.

## Markdown
- **Rendered view:** `render-markdown.nvim` renders headings, tables, code blocks, checkboxes, and callouts inline in the buffer automatically for `.md` files.
- **Toggle rendering:** `<leader>md`
- Raw text is shown while in Insert mode so editing stays clean.
