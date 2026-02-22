# basics
alias la="ls -a"
alias grep="grep -in --color"
alias gr="grep -rin --color"
alias python="python3"

# alias nvim if installed
if type -q nvim
  alias vim="nvim -O"
end

# replace ls with exa if installed
if type -q eza
  alias ls="eza"
  alias la="eza -a"
  alias ll="eza -a --long --no-permissions --header --no-user --binary"
end

# replace cat with bat if installed
if type -q bat
  alias cat="bat"
end
