return {
  -- Visualise and navigate the full undo history as a tree.
  -- undotree is a VimL plugin with no Lua setup function.
  'mbbill/undotree',
  keys = { '<leader>u' },
  config = function()
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle undo tree' })
  end,
}
