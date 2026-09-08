-- todo-comments.nvim is already a LazyVim default (lazyvim.plugins.editor)
-- with identical ]t/[t keymaps plus Trouble/picker integration
-- (<leader>xt/xT, <leader>st/sT). This only disables the sign column icons.
return {
  { "folke/todo-comments.nvim", opts = { signs = false } },
}
