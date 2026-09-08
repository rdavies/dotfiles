-- Seamless Ctrl-hjkl across tmux panes and Neovim splits; pairs with the
-- tmux plugin in .config/tmux/tmux.conf. The actual <C-h/j/k/l> bindings
-- live in lua/config/keymaps.lua, which loads after LazyVim's own window-nav
-- keymaps (which also claim <C-h/j/k/l>) and so is what makes this win.
return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
}
