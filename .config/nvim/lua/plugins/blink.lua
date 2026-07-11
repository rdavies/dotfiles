-- blink.cmp: fast, modern autocompletion
--
-- blink.cmp is a completion engine written in Rust with a Lua config layer.
-- It replaces the older nvim-cmp ecosystem and integrates natively with:
--   - LSP (language server completions)
--   - Path completion (file paths in strings)
--   - Snippets (built-in, no LuaSnip required)
--   - Buffer words (words from open buffers)
--
-- Default keymaps (from preset = 'default'):
--   <C-Space>   — trigger completion menu manually
--   <C-e>       — close the completion menu
--   <C-n>/<C-p> — navigate items down/up
--   <Tab>/<S-Tab> — navigate items (and expand snippets)
--   <CR>        — confirm selected item
--   <C-b>/<C-f> — scroll documentation up/down

return {
  'saghen/blink.cmp',

  -- Pin to tagged releases rather than HEAD — blink moves fast and tagged
  -- releases are tested. The '*' glob means "any release tag".
  version = '*',

  -- blink.cmp ships a Rust binary for its fuzzy matching algorithm.
  -- lazy.nvim will compile it after install (requires Rust + cargo).
  -- If Rust isn't available, blink falls back to a pure-Lua implementation.
  build = 'cargo build --release',

  config = function()
    require('blink.cmp').setup({
      -- ── Keymap preset ──────────────────────────────────────────────
      -- 'default' gives you standard nvim-cmp-like bindings.
      -- See :help blink-cmp-config-keymap for alternatives ('super-tab', etc.)
      keymap = {
        preset = 'default',
        -- With auto_insert = false, the default <CR> binding doesn't
        -- reliably confirm the highlighted item. select_and_accept
        -- explicitly selects then inserts, working correctly in both modes.
        ['<CR>'] = { 'select_and_accept', 'fallback' },
      },

      -- ── Completion sources ─────────────────────────────────────────
      -- Order matters: earlier sources take priority in the menu.
      sources = {
        default = {
          'lsp', -- Language server completions (main source)
          'path', -- File system path completion (useful in strings)
          'snippets', -- Built-in snippet expansion
          'buffer', -- Words from currently open buffers (fallback)
        },
      },

      -- ── Appearance ─────────────────────────────────────────────────
      appearance = {
        -- Use nvim-cmp-style highlight groups for compatibility with
        -- colorschemes that don't yet define blink-specific groups
        use_nvim_cmp_as_default = true,
        -- Use nerdfont icons in the completion menu (requires nvim-web-devicons
        -- or a patched font)
        nerd_font_variant = 'mono',
      },

      -- ── Completion menu ────────────────────────────────────────────
      completion = {
        list = {
          selection = {
            preselect = true,
            -- Don't insert text into the buffer as you scroll through the
            -- menu — only insert when you explicitly confirm with <CR> or
            -- <Tab>. Without this, the text is written live as you navigate,
            -- so <CR> has nothing to confirm and falls through to a newline.
            auto_insert = false,
          },
        },
        -- Show documentation popup alongside the completion menu
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200, -- small delay so it doesn't flicker
        },
      },

      -- Signature help lives at the top level (not under completion) in
      -- current blink.cmp versions — shows function argument hints when
      -- you're inside a function call
      signature = { enabled = true },
    })
  end,
}
