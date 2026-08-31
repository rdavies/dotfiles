set -gx XDG_CONFIG_HOME $HOME/.config
set -gx EDITOR nvim

if status is-interactive
    # load alias file
    if test -f ~/.config/fish/aliases.fish
        source ~/.config/fish/aliases.fish
    end

    # Catppuccin Mocha, matching Alacritty/tmux/Neovim. `choose` (not `save`)
    # re-applies live instead of persisting into fish_variables.
    fish_config theme choose "Catppuccin Mocha"
end

# disable greeting
set -g fish_greeting

# edit $PATH for homebrew
if test -x /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
else if test -x /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

# attach to or create a tmux session called "main"
if status is-interactive && type -q tmux && test -z "$TMUX"
  tmux new-session -A -s main
end

# add ~/bin, ~/.local/bin, /usr/local/bin, and ~/.cargo/bin (rustup) to $PATH
fish_add_path $HOME/bin $HOME/.local/bin /usr/local/bin $HOME/.cargo/bin

# setup vim mode
function fish_user_key_bindings
  # These are needed to not override other other key bindings
  # like fish autocomplete
  fish_default_key_bindings -M insert
  fish_vi_key_bindings --no-erase insert
end

# set ctrl-o to open a vim in $EDITOR from fzf's directory search (Ctrl+Alt+F)
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"

# starship prompt init
if type -q starship
    set -x STARSHIP_CONFIG $HOME/.config/starship/starship.toml
    starship init fish | source
end

# zoxide ('z') command init
if type -q zoxide
    zoxide init fish | source
end
