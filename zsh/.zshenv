which vim > /dev/null && export EDITOR="vim";
which vim > /dev/null && export VISUAL="vim";
which nvim > /dev/null && export EDITOR="nvim";
which nvim > /dev/null && export VISUAL="nvim";

export HISTFILE=$HOME/.histfile;
export HISTSIZE=1000;
export SAVEHIST=1000;

export EDITOR=nvim
export VISUAL=nvim

# local packages
[[ -d "$HOME/.local/bin" ]] && export PATH="$PATH:$HOME/.local/bin";
# haskell
[[ -d "$HOME/.ghcup/bin" ]] && export PATH="$PATH:$HOME/.ghcup/bin";
# R
[[ -d "$HOME/.rpackages" ]] && export R_LIBS_USER="$HOME/.rpackages";
# nvm
[[ -f "$HOME/.nvm/nvm.sh" ]] && export "NVM_DIR=$HOME/.nvm" && . "$NVM_DIR/nvm.sh";

# CUDA environment variable for pytorch
[[ -d /opt/cuda ]] && export XLA_FLAGS=--xla_gpu_cuda_data_dir=/opt/cuda;

# rc files
which python3 > /dev/null && [[ -f "$HOME/.startup.py" ]] && export PYTHONSTARTUP="$HOME/.startup.py";
which lua > /dev/null && [[ -f "$HOME/.startup.lua" ]] && export LUA_INIT="@$HOME/.startup.lua";

export GOPATH="$HOME/.go";
export FPATH="$HOME/.config/zsh/functions:$FPATH";

export ANTHROPIC_MODEL="claude-sonnet-4-6"

[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env";
