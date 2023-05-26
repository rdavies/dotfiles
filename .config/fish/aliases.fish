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
if type -q exa
  alias ls="exa"
  alias la="exa -a"
  alias ll="exa -a --long --no-permissions --header --no-user --binary"
end

# replace car with bat if installed
if type -q bat
  alias cat="bat"
end
