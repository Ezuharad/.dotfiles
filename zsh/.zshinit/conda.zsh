# conda initialization
if [ -f "/opt/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/opt/mambaforge/etc/profile.d/mamba.sh"
    [ -f /opt/mambaforge/etc/profile.d/conda.sh ] && source /opt/mambaforge/etc/profile.d/conda.sh
else [ -f "$HOME/.miniconda/bin"]; then
  __conda_setup="$('$(HOME)/.miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  else
    if [ -f "$HOME/.miniconda/etc/profile.d/conda.sh" ] then
      . "$HOME/.miniconda/etc/profile.d/conda.sh"
    else
      export PATH="$PATH:$HOME/.miniconda/bin"
    fi
  fi
  unset __conda_setup
fi

