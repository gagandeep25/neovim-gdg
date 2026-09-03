# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A personal Neovim configuration (Lua-based, lazy.nvim). There is no build or test
suite. "Running" it means launching `nvim` and reloading; verification is done by
`:checkhealth`, `:Lazy`, and `:Mason`.

## Load order and structure

`init.lua` requires three modules **in this exact order** — order matters because
later modules assume plugins are on the runtimepath and earlier settings are applied:

1. `lua/core/keymaps.lua` — sets `mapleader` (`<Space>`) and core editor options. Must run first so `vim.g.mapleader` is set before any plugin maps leader keys.
2. `lua/core/plugins.lua` — bootstraps lazy.nvim and declares the full plugin list in one `require("lazy").setup({...})` call.
3. `lua/core/plugin_config/init.lua` — requires each per-plugin config file in `lua/core/plugin_config/` one by one.

Per-plugin setup lives in `lua/core/plugin_config/<name>.lua`. When adding a plugin:
add it to `plugins.lua`, create `plugin_config/<name>.lua`, and add a `require` line
to `plugin_config/init.lua`. Nothing is auto-discovered.

Cross-file coupling to be aware of:
- `completions.lua` must be required before `autopairs.lua` and `lsp_config.lua` — both call `require("cmp")` / `require("cmp_nvim_lsp")` and `autopairs.lua` hooks `cmp.event`.
- `lsp_config.lua` pulls completion capabilities from `cmp_nvim_lsp` and uses `telescope.builtin` for the `gr` (references) mapping.

## LSP (Neovim 0.11+ API)

`lsp_config.lua` uses the modern `vim.lsp.config()` + `vim.lsp.enable()` API (not the
old `lspconfig.<server>.setup{}`). Servers are installed via `mason-lspconfig`'s
`ensure_installed` and must **also** be listed in the local `servers` table in the
same file for `vim.lsp.enable` to be called. Keep both lists in sync.

Keymaps are bound in an `LspAttach` autocmd (buffer-local), not globally.

Special-cased servers in the config loop: `pyright` (filetypes forced to `python`),
`verible` (custom `cmd` with rule overrides for Verilog).

## Formatting & linting

- `conform.nvim` (`formatting.lua`) formats on save (`format_on_save`, 500ms timeout, `lsp_fallback = true`). Per-filetype formatters are in `formatters_by_ft` — these external tools (stylua, black, isort, clang-format, prettier) must be installed separately (via Mason or system).
- `nvim-lint` runs on `BufWritePost` via an autocmd; currently only `pylint` for Python.

## Plugin versions

`lazy-lock.json` pins every plugin commit — commit changes to it when running
`:Lazy update`. Telescope is additionally tag-pinned to `0.1.4` in `plugins.lua`.

## Diagnostics UX

`ui.lua` configures inline virtual text (`●` prefix) and a `CursorHold` autocmd that
opens a floating diagnostic window automatically (driven by `updatetime = 300` in
keymaps.lua). Trouble panel: `<leader>xx` / `<leader>xX`.

## Keybindings reference

`CHEATSHEET.md` is the human-facing summary of all keymaps — update it when changing
or adding mappings.

## Treesitter (`main` branch API)

`nvim-treesitter` is pinned to the **`main`** branch in `lazy-lock.json`, not the
legacy `master`. The two branches have incompatible APIs. On `main`:
`require("nvim-treesitter").setup()` only configures the install dir; parsers are
installed with `require("nvim-treesitter").install({...})`; highlighting is enabled
per-buffer via `vim.treesitter.start()`. `treesitter.lua` does this in a `FileType`
autocmd keyed off the `ensure_installed` list — add new languages there.
`:TSInstall <lang>` works (uses the system C compiler); the `tree-sitter-cli`
warning in `health_check_v2.txt` only matters for `:TSInstallFromGrammar`.

## Markdown rendering

`render-markdown.nvim` (`render-markdown.lua`) renders markdown inline in the buffer;
raw text shows in Insert mode. Toggle with `<leader>md`. Requires the `markdown` and
`markdown_inline` treesitter parsers (in the `ensure_installed` list).

## Stray files

`test.vim` and `plugin/` (empty) are not wired into the config and can be ignored.
