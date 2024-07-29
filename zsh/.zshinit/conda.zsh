# conda initialization
if [ -f "/opt/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/opt/mambaforge/etc/profile.d/mamba.sh"
    [ -f /opt/mambaforge/etc/profile.d/conda.sh ] && source /opt/mambaforge/etc/profile.d/conda.sh
elif [ -f "~/.miniconda/bin/conda" ]; then
  __conda_setup="$($HOME'/.miniconda/bin/conda' shell.bash hook 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  elif [ -f $HOME"/.miniconda/etc/profile.d/conda.sh" ]; then
      . $HOME"/.miniconda/etc/profile.d/conda.sh"
      CONDA_CHANGEPS1=false conda activate base
  else
      export PATH=$PATH:$HOME"/.miniconda/bin"
  fi
  unset __conda_setup
fi
