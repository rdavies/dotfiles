# dotfiles

I maintain consistency across machines using [yadm](https://yadm.io/)
```bash
brew install yadm
yadm clone https://github.com/rdavies/dotfiles.git
```

## New machine setup

These aren't tracked by this repo and need a one-time manual install for
things to look/work the same as everywhere else:

```bash
# packages + apps
brew install neovim ripgrep fd bat tmux fzf starship eza zoxide fish
brew tap epk/epk
brew install --cask alacritty font-sf-mono-nerd-font

# catppuccin theme for Alacritty (imported by alacritty.toml)
git clone https://github.com/catppuccin/alacritty.git ~/.config/alacritty/catppuccin

# tmux plugin manager — required before `<prefix>I` will install anything
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
# then, inside tmux: <prefix> + I

# fisher (fish plugin manager) + plugins used by config.fish/aliases.fish
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
fish -c "fisher install patrickf1/fzf.fish catppuccin/fish"

# make fish the default shell
chsh -s "$(which fish)"
```
