return {
  -- buffer line UI
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    -- load bufferline after setting up colorscheme
    'catppuccin/nvim',
  },
  config = function()
    require('bufferline').setup({
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
      options = {
        -- show buffer index numbers
        numbers = 'ordinal',
        -- remove the 'X' icon to close buffers
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    })

    -- buffer movement shortcuts
    vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Prev buffer' })
    vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
    vim.keymap.set('n', '[b', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Prev buffer' })
    vim.keymap.set('n', ']b', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })

    vim.keymap.set('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<CR>', { desc = 'Go to buffer 1' })
    vim.keymap.set('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<CR>', { desc = 'Go to buffer 2' })
    vim.keymap.set('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<CR>', { desc = 'Go to buffer 3' })
    vim.keymap.set('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<CR>', { desc = 'Go to buffer 4' })
    vim.keymap.set('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<CR>', { desc = 'Go to buffer 5' })
    vim.keymap.set('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<CR>', { desc = 'Go to buffer 6' })
    vim.keymap.set('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<CR>', { desc = 'Go to buffer 7' })
    vim.keymap.set('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<CR>', { desc = 'Go to buffer 8' })
    vim.keymap.set('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<CR>', { desc = 'Go to buffer 9' })
    vim.keymap.set('n', '<leader>$', '<cmd>BufferLineGoToBuffer -1<CR>', { desc = 'Go to buffer -1' })
  end
}
