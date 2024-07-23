# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ezuharad/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Autocompletion menu
zstyle ':completion:*' menu select

# powerline-daemon -q
# . /usr/share/powerline/bindings/zsh/powerline.zsh

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/mambaforge/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/mambaforge/etc/profile.d/conda.sh" ]; then
#         . "/opt/mambaforge/etc/profile.d/conda.sh"
#     else
#         export PATH="$PATH:/opt/mambaforge/bin"
#     fi
# fi
# unset __conda_setup

if [ -f "/opt/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/opt/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<
[ -f /opt/mambaforge/etc/profile.d/conda.sh ] && source /opt/mambaforge/etc/profile.d/conda.sh


# syntax highlighting
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# set R local package installation location
export R_LIBS_USER=~/.rpackages

# set haskell executable path
export PATH="$PATH:/home/ezuharad/.ghcup/bin"

# set local executable path
export PATH="$PATH:/home/ezuharad/.local/bin"

# set XLA flags
export XLA_FLAGS=--xla_gpu_cuda_data_dir=/opt/cuda

# set fzf keybinds
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_OPTS='--no-height --no-reverse'

# alias help
alias help='man zsh'

# alias colors
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias bat='bat --color=auto'
alias ll='ls -a'

# alias nvim
alias vi='nvim'
alias vim='nvim'

alias icat="kitten icat"

source ~/.script/update-all.zsh

fpath=(~/.script/ $fpath)
autoload -U compinit
compinit

