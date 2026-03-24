-- which-key.nvim: keybinding popup / cheatsheet
--
-- When you press a key prefix (like <leader> or g or [) and pause,
-- which-key pops up a floating window listing all the available
-- continuations — so you don't have to memorise every binding.
--
-- This file also serves as a living reference for all keymaps in
-- this config. Groups are named here; individual mappings are defined
-- in their respective plugin files (or keymaps.lua for core bindings).
--
-- Usage:
--   Press <leader> and wait ~500ms   → see all leader bindings
--   Press g and wait                 → see all g-prefixed bindings
--   Press [ or ] and wait            → see all bracket nav bindings
--   :WhichKey                        → open the full cheatsheet manually

return {
  {
    'folke/which-key.nvim',
    -- Load eagerly so the popup works from the very first keypress
    event = 'VeryLazy',

    config = function()
      local wk = require('which-key')

      wk.setup({
        -- ── Popup timing ──────────────────────────────────────────────
        -- How long to wait after a key press before showing the popup.
        -- Lower = more responsive; higher = less intrusive.
        delay = 500,

        -- ── Icons ─────────────────────────────────────────────────────
        -- Uses nerdfont icons if available; falls back to text otherwise.
        icons = {
          mappings = true,   -- show icons next to mappings
          keys = {},         -- custom key icons (leave empty for defaults)
        },

        -- ── Window appearance ─────────────────────────────────────────
        win = {
          border = 'rounded',   -- rounded border on the popup window
          padding = { 1, 2 },   -- top/bottom, left/right padding
        },
      })

      -- ── Register keymap groups ─────────────────────────────────────────
      -- These labels show up as section headers in the which-key popup.
      -- The actual keymaps are defined elsewhere — this is purely cosmetic.
      --
      -- Format: { "<prefix>", group = "Label" }
      wk.add({

        -- ── Existing keymaps (from keymaps.lua and plugin files) ────────

        -- Buffer management (<leader>b...)
        --   <leader>bn  new buffer
        --   <leader>bd  delete buffer
        --   <leader>bq  quit buffer (same as bd)
        --   <leader>bx  force-close buffer
        --   <leader>1-9 jump to buffer by number (via bufferline)
        { '<leader>b', group = 'Buffer' },

        -- Window splits (<leader>w...)
        --   <leader>w-  horizontal split
        --   <leader>w|  vertical split
        { '<leader>w', group = 'Window' },

        -- File / fuzzy finding (<leader>f...) — Telescope
        --   <leader>ff  find files
        --   <leader>fp  find git files (project files)
        --   <leader>fb  find open buffers
        --   <leader>fs  live grep (search string in project)
        { '<leader>f', group = 'Find' },

        -- File explorer (<leader>e...) — oil.nvim
        --   <leader>ev  open file explorer
        { '<leader>e', group = 'Explorer' },

        -- ── New keymaps added in this config revamp ─────────────────────

        -- Git hunk navigation / staging (<leader>h...) — gitsigns.nvim
        --   <leader>hs  stage hunk under cursor
        --   <leader>hr  reset (unstage) hunk under cursor
        --   <leader>hp  preview hunk diff in floating window
        --   <leader>hb  toggle inline git blame for current line
        { '<leader>h', group = 'Git Hunks' },

        -- LSP actions (<leader>l...) — nvim-lspconfig
        --   <leader>lf  format buffer via LSP
        --   <leader>ld  show diagnostic for current line
        { '<leader>l', group = 'LSP' },

        -- Code actions / formatting (<leader>c...) — lspconfig + conform
        --   <leader>ca  code action (e.g. auto-import, fix, refactor)
        --   <leader>cf  format with conform (honours per-filetype formatter)
        { '<leader>c', group = 'Code' },

        -- Refactoring (<leader>r...) — lspconfig
        --   <leader>rn  rename symbol under cursor (updates all references)
        { '<leader>r', group = 'Refactor' },

        -- ── Bracket navigation groups ───────────────────────────────────
        -- Labels for [ and ] prefix sequences

        -- [b / ]b  — previous / next buffer (keymaps.lua)
        -- [d / ]d  — previous / next LSP diagnostic (lsp.lua)
        -- [h / ]h  — previous / next git hunk (gitsigns.lua)
        -- [t / ]t  — previous / next TODO comment (todo-comments)
        { '[', group = 'Previous...' },
        { ']', group = 'Next...' },

        -- g-prefix navigation (standard vim + LSP additions)
        --   gd  — go to definition
        --   gD  — go to declaration
        --   gr  — list all references
        --   gi  — go to implementation
        { 'g', group = 'Go to...' },
      })
    end,
  },
}
