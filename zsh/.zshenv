which nvim > /dev/null && export EDITOR="nvim"
which nvim > /dev/null && export VISUAL="nvim"

export HISTFILE=$HOME/.histfile
export HISTSIZE=1000
export SAVEHIST=1000

# local installs
[[ -d $HOME/.local/bin ]] && export PATH="$PATH:$HOME/.local/bin"
# rust
[[ -d $HOME/.cargo/bin ]] && export PATH="$PATH:$HOME/.cargo/bin"
# haskell
[[ -d $HOME/.ghcup/bin ]] && export PATH="$PATH:$HOME/.ghcup/bin"
# R
[[ -d $HOME/.rpackages ]] && export R_LIBS_USER="$HOME/.rpackages"
# nvm
[[ -f $HOME/.nvm/nvm.sh ]] && export "NVM_DIR=$HOME/.nvm" && . "$NVM_DIR/nvm.sh"

# CUDA environment variable for pytorch
[[ -d /opt/cuda ]] && export XLA_FLAGS=--xla_gpu_cuda_data_dir=/opt/cuda

export GOPATH="$HOME/.go"
export FPATH=$HOME/.config/zsh/function:$FPATH

. "$HOME/.cargo/env"
