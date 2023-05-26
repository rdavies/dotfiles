return {
  -- fuzzy finder
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = true,

  -- keep these keys in sync with the remaps below
  keys = { '<leader>ff', '<C-p>', '<leader>fs' },
  config = function()
    require('telescope').setup()

    local builtin = require('telescope.builtin')
    -- find files
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    -- file (project) files
    vim.keymap.set('n', '<leader>fp', builtin.git_files, {})
    -- find buffer
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    -- find string (currently no rg smart case support)
    vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})

  end
}
