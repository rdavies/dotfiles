-- Extends LazyVim's `editor.mini-files` extra (enabled in lua/config/lazy.lua)
-- with a `-` binding: open mini.files scoped to the current buffer's
-- directory. The extra's own keys (<leader>fm/<leader>fM) stay available too.
return {
  {
    "nvim-mini/mini.files",
    keys = {
      {
        "-",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (current buffer dir)",
      },
    },
  },
}
