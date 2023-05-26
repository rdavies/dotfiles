return {
  -- undo tree
  'mbbill/undotree',
  -- keep these keys in sync with the remaps below
  keys = { '<leader>u' },
  config = function()
    -- require('undotree').setup() -- is this needed?
    -- toggle undo tree with <leader> u
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
  end
}
