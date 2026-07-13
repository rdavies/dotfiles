return {
  -- Visualise and navigate the full undo history as a tree.
  -- undotree is a VimL plugin with no Lua setup function.
  'mbbill/undotree',
  -- desc given here so which-key shows it before undotree has loaded
  keys = { { '<leader>u', desc = 'Toggle undo tree' } },
  config = function()
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle undo tree' })
  end,
}
