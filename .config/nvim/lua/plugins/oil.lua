return {
  -- file system explorer using a vim buffer
  'stevearc/oil.nvim',
  -- optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    local module = require('oil')
    module.setup()
    -- open Explore [view] (netrw)
    vim.keymap.set("n", "<leader>ev", module.open, { desc = 'Explore parent directory' })
    vim.keymap.set("n", "-", module.open, { desc = 'Explore parent directory' })
  end
}
