set -gx XDG_CONFIG_HOME $HOME/.config
set -gx EDITOR nvim

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# disable greeting
set -g fish_greeting

# edit $PATH for homebrew
if test -x /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
else if test -x /home/linuxbrew/.linuxbrew/bin/brew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

# add ~/bin to $PATH
set -x PATH $HOME/bin $PATH

# setup vim mode
function fish_user_key_bindings
  # These are needed to not override other other key bindings
  # like fish autocomplete
  fish_default_key_bindings -M insert
  fish_vi_key_bindings --no-erase insert
end

# load alias file
if test -f ~/.config/fish/aliases.fish
  source ~/.config/fish/aliases.fish
end

# set ctrl-o to open a vim in $EDITOR from fzf
set fzf_dir_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"

# starship prompt init
if type -q starship
    set -x STARSHIP_CONFIG $HOME/.config/starship/starship.toml
    starship init fish | source
end

# zoxide ('z') command init
if type -q zoxide
    zoxide init fish | source
end
