set -gx XDG_CONFIG_HOME $HOME/.config
set -gx EDITOR vim

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# disable greeting
set -g fish_greeting

# edit $PATH for homebrew
eval (/opt/homebrew/bin/brew shellenv)

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
if test ~/.config/fish/aliases.fish
  source ~/.config/fish/aliases.fish
end

# set ctrl-o to open a vim in $EDITOR from fzf
set fzf_dir_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"

# starship prompt init
starship init fish | source

# zoxide ('z') command init
zoxide init fish | source
