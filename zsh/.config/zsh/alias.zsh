# comamnd aliases for zsh
which bat > /dev/null && alias bat='bat --style=plain --color=auto'
which bat > /dev/null && alias cat='bat --style=plain --color=auto'

alias more='less'

which nvim > /dev/null && alias vi='nvim'
which nvim > /dev/null && alias vim='nvim'

which perl-rename > /dev/null && alias rename=perl-rename

alias ls='ls --color=auto'
alias grep='grep --colo=auto'

which wezterm > /dev/null && alias imgcat='wezterm imgcat'

which fastfetch > /dev/null && alias neofetch='fastfetch'

alias help='man zsh'

alias ll='ls -lA'

alias \?='man'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

