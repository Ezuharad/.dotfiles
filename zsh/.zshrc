# automatically start tmux
if [[ -z "$TMUX" && -f /usr/bin/tmux ]]; then
  exec tmux new-session -A -s tmux
fi

# set PATH, FPATH variables
source $HOME/.zshinit/path.zsh

zstyle :compinstall filename '~/.zshrc'

# syntax highlighting
source $HOME/.zshinit/plugin/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# completions
autoload -Uz compinit; compinit
zstyle ':completion:*' menu no
source $HOME/.zshinit/plugin/fzf-tab/fzf-tab.plugin.zsh
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

bindkey '^g' clear-screen

# custom commands
autoload -Uz update-all

source $HOME/.zshinit/alias.zsh
source $HOME/.zshinit/conda.zsh
source $HOME/.zshinit/env.zsh
source $HOME/.zshinit/fzf.zsh
source $HOME/.zshinit/history.zsh
source $HOME/.zshinit/vibind.zsh

# set prompt style
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/default.toml)"

