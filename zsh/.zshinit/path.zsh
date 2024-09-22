# set local install path
[[ -d $HOME/.local/bin ]] && export PATH="$PATH:$HOME/.local/bin"
# set rust executable path
[[ -d $HOME/.cargo/bin ]] && export PATH="$PATH:$HOME/.cargo/bin"
# set haskell executable path
[[ -d $HOME/.ghcup/bin ]] && export PATH="$PATH:$HOME/.ghcup/bin"
# set R local package installation location
[[ -d $HOME/.rpackages ]] && export R_LIBS_USER="$HOME/.rpackages"

# set Go path
export GOPATH="$HOME/.go"

# set zsh function path
FPATH=$HOME/.zshinit/function:$FPATH
