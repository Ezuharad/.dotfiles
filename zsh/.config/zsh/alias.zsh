# comamnd aliases for zsh
which bat > /dev/null && alias bat='bat --style=plain --color=auto'
which bat > /dev/null && alias cat='bat --style=plain --color=auto'

alias more='less'

which nvim > /dev/null && alias vi='nvim'
which nvim > /dev/null && alias vim='nvim'

alias ls='ls --color=auto'
alias grep='grep --colo=auto'

which wezterm > /dev/null && alias imgcat='wezterm imgcat'
alias help='man zsh'

alias ll='ls -la'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

