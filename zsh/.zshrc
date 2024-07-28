# Automatically start tmux
if [ -z "$TMUX" ]; then
  exec tmux new-session -A -s tmux
fi

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
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# syntax highlighting
source ~/.zshinit/plugin/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Autocompletion menu
zstyle ':completion:*' menu select

# powerline-daemon -q
# . /usr/share/powerline/bindings/zsh/powerline.zsh

source ~/.zshinit/plugin/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# set rust executable path
[[ ! -f ~/.cargo/bin ]] || export PATH="$PATH:$HOME/.cargo/bin"

# set haskell executable path
[[ ! -f ~/.ghcup/bin ]] || export PATH="$PATH:$HOME/ghcup/bin"

# set local executable path
[[ ! -f ~/.local/bin ]] || export PATH="$PATH:$HOME/local/bin"

# set R local package installation location
[[ ! -f ~/.rpackages ]] || export R_LIBS_USER=~/.rpackages

# set XLA flags
export XLA_FLAGS=--xla_gpu_cuda_data_dir=/opt/cuda

source ~/.zshinit/conda.zsh
source ~/.zshinit/fzf.zsh
source ~/.zshinit/alias.zsh

# source custom functions
FPATH=~/.zshinit/function:$FPATH
autoload -Uz update-all

