# comamnd aliases for zsh
alias help='man zsh'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias more='less'

[[ ! -d /usr/bin/bat ]] || alias bat='bat --color=auto'
[[ ! -d /usr/bin/bat ]] || alias cat='bat --style=plain'
alias ls='ls --color=auto'
alias grep='grep --colo=auto'

alias egrep='grep -e --color=auto'
alias fgrep='grep -f --color=auto'

alias ll='ls -la'

alias vi='nvim'
alias vim='nvim'

