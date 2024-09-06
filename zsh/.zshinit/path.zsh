# set rust executable path
[[ ! -d $HOME/.cargo/bin ]] || export PATH="$PATH:$HOME/.cargo/bin"
# set haskell executable path
[[ ! -d $HOME/.ghcup/bin ]] || export PATH="$PATH:$HOME/.ghcup/bin"
# set R local package installation location
[[ ! -d $HOME/.rpackages ]] || export R_LIBS_USER="$HOME/.rpackages"

