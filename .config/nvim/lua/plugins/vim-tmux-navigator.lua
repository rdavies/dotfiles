-- vim-tmux-navigator: seamless Ctrl-hjkl movement across tmux panes and
-- Neovim splits with a single keystroke, instead of tmux's prefix+hjkl and
-- Neovim's bare Ctrl+hjkl being two separate motions at the tmux/nvim
-- boundary. Requires the matching tmux plugin (see .config/tmux/tmux.conf).
--
-- Default mappings (no config needed): <C-h/j/k/l> to move, <C-\> for the
-- previously focused pane/split.

return {
  'christoomey/vim-tmux-navigator',
  lazy = false,
}
