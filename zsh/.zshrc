# set PATH, FPATH variables
zstyle :compinstall filename '~/.zshrc'

# syntax highlighting
source $HOME/.config/zsh/plugin/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# completions
autoload -Uz compinit; compinit -d $HOME/.cache/zsh/.zcompdump
zstyle ':completion:*' menu no
source $HOME/.config/zsh/plugin/fzf-tab/fzf-tab.plugin.zsh
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

zle -N zle_ls; bindkey "^F" zle_ls
zle -N zle_fg; bindkey "^Z" zle_fg

# other modules
source $HOME/.config/zsh/alias.zsh
source $HOME/.config/zsh/conda.zsh
source $HOME/.config/zsh/command.zsh
source $HOME/.config/zsh/env.zsh
source $HOME/.config/zsh/fzf.zsh
source $HOME/.config/zsh/history.zsh
source $HOME/.config/zsh/nvm.zsh
source $HOME/.config/zsh/vibind.zsh
source $HOME/.config/zsh/less.zsh

# set prompt style
# which oh-my-posh > /dev/null && eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/default.toml)"
which starship > /dev/null && eval "$(starship init zsh)"

# use direnv
which direnv > /dev/null && eval "$(direnv hook zsh)"

# set secret variables
[ -f $HOME/.env ] && source $HOME/.env

