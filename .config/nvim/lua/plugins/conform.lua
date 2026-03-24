-- conform.nvim: lightweight, async code formatting
--
-- conform runs external formatters (black, stylua, prettier, etc.) and
-- feeds the result back to the buffer via LSP text edits — so your cursor
-- position and undo history are preserved.
--
-- Formatters are NOT installed automatically. Install them with:
--   pip install black            # Python
--   cargo install stylua         # Lua (or: brew install stylua)
--   npm install -g prettier      # JS/TS/JSON/YAML/Markdown
--   brew install shfmt           # Bash/Shell
--
-- Or let mason handle it:
--   :MasonInstall black stylua prettier shfmt
--
-- Keymaps:
--   <leader>cf  — manually format the current buffer (or visual selection)
--
-- Auto-format on save is controlled by vim.g.autoformat (set below).
-- Toggle it during a session with:  :lua vim.g.autoformat = not vim.g.autoformat

return {
  {
    'stevearc/conform.nvim',
    -- Load conform lazily — only when a buffer is saved or the keymap fires
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },

    config = function()
      -- Auto-format on save is ON by default.
      -- Flip this to false in a specific project by adding:
      --   vim.g.autoformat = false
      -- to a project-local .nvim.lua file (with exrc enabled).
      vim.g.autoformat = true

      require('conform').setup({
        -- ── Per-filetype formatter list ───────────────────────────────
        -- conform tries each formatter in order; the first one that's
        -- available on PATH wins. Use { 'a', 'b' } to chain formatters
        -- (both run sequentially on the same buffer).
        formatters_by_ft = {
          -- Python: prefer ruff (faster, also lints) — falls back to black
          python     = { 'ruff_format', 'black' },
          -- Lua: stylua respects your .editorconfig / stylua.toml settings
          lua        = { 'stylua' },
          -- Shell / Bash
          sh         = { 'shfmt' },
          bash       = { 'shfmt' },
          -- JS / TS — prettier handles all these
          javascript = { 'prettier' },
          typescript = { 'prettier' },
          javascriptreact = { 'prettier' },
          typescriptreact = { 'prettier' },
          -- Data / config formats
          json       = { 'prettier' },
          yaml       = { 'prettier' },
          markdown   = { 'prettier' },
          -- Fallback: if no filetype-specific formatter matched, try prettier
          -- (comment this out if it causes unexpected formatting in other files)
          -- ['*'] = { 'prettier' },
        },

        -- ── Format on save ────────────────────────────────────────────
        format_on_save = function(bufnr)
          -- Respect the global toggle
          if not vim.g.autoformat then
            return nil
          end

          -- Skip formatting for files in certain directories
          -- (e.g. vendored code you don't want to reformat)
          local path = vim.api.nvim_buf_get_name(bufnr)
          if path:match('/node_modules/') or path:match('/vendor/') then
            return nil
          end

          return {
            timeout_ms = 1500, -- bail out if formatter takes longer than this
            lsp_fallback = true, -- fall back to LSP formatting if no formatter found
          }
        end,
      })

      -- ── Manual format keymap ──────────────────────────────────────────
      -- Works in normal mode (whole buffer) and visual mode (selection only)
      vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
        require('conform').format({
          async = true,
          lsp_fallback = true,
        })
      end, { desc = 'Code: Format buffer' })
    end,
  },
}
