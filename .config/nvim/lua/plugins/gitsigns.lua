-- gitsigns.nvim: inline git status in the editor
--
-- Adds signs to the gutter (sign column) showing lines that have been:
--   +  added since the last commit
--   ~  modified since the last commit
--   _  deleted since the last commit (shown below the deleted line)
--
-- Also provides hunk-level staging, resetting, and navigation — so you
-- can stage individual hunks without leaving Neovim.
--
-- Keymaps (defined below):
--   ]h          next git hunk
--   [h          previous git hunk
--   <leader>hs  stage hunk under cursor
--   <leader>hr  reset (unstage) hunk under cursor
--   <leader>hp  preview hunk diff in floating window
--   <leader>hb  toggle per-line git blame (shows commit message inline)
--   <leader>hd  diff current file against HEAD

return {
  {
    'lewis6991/gitsigns.nvim',
    -- Only load when we're inside a git repository
    event = { 'BufReadPre', 'BufNewFile' },

    config = function()
      require('gitsigns').setup({
        -- ── Gutter signs ───────────────────────────────────────────────
        signs = {
          add          = { text = '┃' }, -- added line
          change       = { text = '┃' }, -- modified line
          delete       = { text = '_' }, -- deleted line (below cursor)
          topdelete    = { text = '‾' }, -- first line of a deleted block
          changedelete = { text = '~' }, -- line changed then deleted
          untracked    = { text = '┆' }, -- line in an untracked file
        },

        -- ── Behaviour ──────────────────────────────────────────────────
        -- Watch the .git directory for external changes (e.g. git pull in terminal)
        watch_gitdir = { follow_files = true },

        -- Attach to untracked files so new files show + signs immediately
        attach_to_untracked = true,

        -- Update signs as you type, not just on save
        update_debounce = 100,  -- ms to wait after last keypress before updating

        -- ── Inline blame ───────────────────────────────────────────────
        -- Shows "Who changed this line and when" as virtual text at end of line.
        -- Off by default — toggle with <leader>hb
        current_line_blame = false,
        current_line_blame_opts = {
          delay = 800,            -- wait 800ms after cursor stops moving
          virt_text_pos = 'eol',  -- show at end of line
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> • <summary>',

        -- ── Keymaps ───────────────────────────────────────────────────
        on_attach = function(bufnr)
          local gs = require('gitsigns')
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end

          -- Navigate between hunks
          -- These mirror the [d/]d diagnostic navigation pattern from LSP
          map('n', ']h', function()
            if vim.wo.diff then
              vim.cmd.normal({ ']c', bang = true })  -- use built-in diff nav in diff mode
            else
              gs.nav_hunk('next')
            end
          end, 'Git: Next hunk')

          map('n', '[h', function()
            if vim.wo.diff then
              vim.cmd.normal({ '[c', bang = true })
            else
              gs.nav_hunk('prev')
            end
          end, 'Git: Previous hunk')

          -- Stage / reset hunks
          -- Stage = tell git to include this change in the next commit
          -- Reset = discard local changes (restore from HEAD)
          map('n', '<leader>hs', gs.stage_hunk,        'Git: Stage hunk')
          map('n', '<leader>hr', gs.reset_hunk,        'Git: Reset hunk')
          -- Visual mode: stage/reset only the selected lines within a hunk
          map('v', '<leader>hs', function()
            gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
          end, 'Git: Stage selected lines')
          map('v', '<leader>hr', function()
            gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
          end, 'Git: Reset selected lines')

          -- Stage / reset the whole buffer
          map('n', '<leader>hS', gs.stage_buffer,      'Git: Stage buffer')
          map('n', '<leader>hR', gs.reset_buffer,      'Git: Reset buffer')

          -- Preview the diff for the hunk under cursor in a floating window
          map('n', '<leader>hp', gs.preview_hunk,      'Git: Preview hunk')

          -- Toggle inline blame virtual text
          map('n', '<leader>hb', gs.toggle_current_line_blame, 'Git: Toggle blame')

          -- Diff current file against HEAD in a split
          map('n', '<leader>hd', gs.diffthis,          'Git: Diff against HEAD')
        end,
      })
    end,
  },
}
