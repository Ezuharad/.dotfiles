# Automatically start tmux
if [[ -z "$TMUX" && -f /usr/bin/tmux ]]; then
  exec tmux new-session -A -s tmux
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# set local install path
[[ ! -d $HOME/.local/bin ]] || export PATH="$PATH:$HOME/.local/bin"

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/nord.toml)"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10
bindkey -e

zstyle :compinstall filename '~/.zshrc'

# completions
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

FPATH=~/.zshinit/function:$FPATH
autoload -Uz update-all

# syntax highlighting
source ~/.zshinit/plugin/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

export EDITOR=nvim
autoload -U edit-command-line
zle -N edit-command-line
bindkey "^x^e" edit-command-line

source .zshinit/path.zsh
export GOPATH="$HOME/.go"

source $HOME/.zshinit/conda.zsh
source $HOME/.zshinit/fzf.zsh
source $HOME/.zshinit/alias.zsh

[[ ! -d /opt/cuda ]] || export XLA_FLAGS=--xla_gpu_cuda_data_dir=/opt/cuda

