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
zstyle :compinstall filename '/home/ezuharad/.zshrc'

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

# set R local package installation location
export R_LIBS_USER=~/.rpackages

source ~/.zshinit/conda.zsh
# set haskell executable path
if [ -f ~/.ghcup/bin ]; then
  export PATH="$PATH:/home/ezuharad/.ghcup/bin"
fi

# set local executable path
if [ -f ~/.local/bin ]; then
  export PATH="$PATH:/home/ezuharad/.local/bin"
fi

# set XLA flags
export XLA_FLAGS=--xla_gpu_cuda_data_dir=/opt/cuda

source ~/.zshinit/fzf.zsh
source ~/.zshinit/alias.zsh
source ~/.zshinit/update-all.zsh

