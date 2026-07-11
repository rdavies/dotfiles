return {
  -- fuzzy finder
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = true,

  -- all keys that should trigger lazy-loading of telescope
  keys = { '<leader>ff', '<leader>fp', '<leader>fb', '<leader>fs', '<C-p>' },

  config = function()
    require('telescope').setup()

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find: Files' })
    vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Find: Files' })
    vim.keymap.set('n', '<leader>fp', builtin.git_files, { desc = 'Find: Git files' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find: Buffers' })
    vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Find: String (grep)' })
  end,
}
