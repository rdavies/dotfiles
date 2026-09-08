-- bufferline.nvim is already a LazyVim default (lazyvim.plugins.ui), with
-- its own keymaps (<S-h>/<S-l>, [b/]b, <leader>bp/bP/br/bl/bj) and opts
-- (Snacks-based close, diagnostics, neo-tree offset, etc). This only adds
-- the catppuccin theme integration, a couple of display tweaks, and
-- jump-to-buffer-by-number -- everything else is inherited.
return {
  {
    "akinsho/bufferline.nvim",
    dependencies = { "catppuccin/nvim" },
    opts = function(_, opts)
      opts.highlights = require("catppuccin.special.bufferline").get_theme()
      opts.options.numbers = "ordinal"
      opts.options.show_buffer_close_icons = false
      opts.options.show_close_icon = false
    end,
    keys = {
      { "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Go to buffer 1" },
      { "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Go to buffer 2" },
      { "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Go to buffer 3" },
      { "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Go to buffer 4" },
      { "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Go to buffer 5" },
      { "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Go to buffer 6" },
      { "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Go to buffer 7" },
      { "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "Go to buffer 8" },
      { "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", desc = "Go to buffer 9" },
      { "<leader>$", "<cmd>BufferLineGoToBuffer -1<cr>", desc = "Go to last buffer" },
    },
  },
}
