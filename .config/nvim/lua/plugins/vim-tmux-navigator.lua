-- Seamless Ctrl-hjkl across tmux panes and Neovim splits; pairs with the
-- tmux plugin in .config/tmux/tmux.conf. Default mappings: <C-h/j/k/l> to
-- move, <C-\> for the previous pane/split.

return {
  'christoomey/vim-tmux-navigator',
  lazy = false,
}
