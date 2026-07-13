return {
  -- fuzzy finder
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = true,

  -- all keys that should trigger lazy-loading of telescope. Descriptions are
  -- given here (not just in the vim.keymap.set calls below) so which-key
  -- shows them correctly even before telescope has loaded for the first time -
  -- otherwise which-key only sees lazy.nvim's undescribed placeholder mapping.
  keys = {
    { '<leader>ff', desc = 'Find: Files' },
    { '<leader>fb', desc = 'Find: Buffers' },
    { '<leader>fg', desc = 'Find: Grep' },
    { '<C-p>', desc = 'Find: Files' },
  },

  config = function()
    require('telescope').setup()

    local builtin = require('telescope.builtin')
    -- find_files already uses fd/ripgrep when present, both of which respect
    -- .gitignore by default - no separate git_files picker needed
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find: Files' })
    vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Find: Files' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find: Buffers' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find: Grep' })
  end,
}
