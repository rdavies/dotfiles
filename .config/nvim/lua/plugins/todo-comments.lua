return {
  -- highlight & search TODO-like comments
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local module = require('todo-comments').setup()

    vim.keymap.set('n', ']t', function()
      require("todo-comments").jump_next()
    end, { desc = 'Next todo comment' })
    vim.keymap.set('n', '[t', function()
      require("todo-comments").jump_prev()
    end, { desc = 'Previous todo comment' })
  end
}
