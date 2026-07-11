return {
  -- fuzzy finder
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = true,

  -- all keys that should trigger lazy-loading of telescope
  keys = { '<leader>f', '<leader>s', '<leader>bb', '<C-p>' },

  config = function()
    require('telescope').setup()

    local builtin = require('telescope.builtin')
    -- find_files already uses fd/ripgrep when present, both of which respect
    -- .gitignore by default - no separate git_files picker needed
    vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Find files' })
    vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Find files' })
    vim.keymap.set('n', '<leader>bb', builtin.buffers, { desc = 'Find buffers' })
    vim.keymap.set('n', '<leader>s', builtin.live_grep, { desc = 'Search (grep)' })
  end,
}
