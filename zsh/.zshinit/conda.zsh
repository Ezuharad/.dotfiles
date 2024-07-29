# conda initialization
if [ -f "/opt/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/opt/mambaforge/etc/profile.d/mamba.sh"
    [ -f /opt/mambaforge/etc/profile.d/conda.sh ] && source /opt/mambaforge/etc/profile.d/conda.sh
elif [ -f "~/.miniconda/bin" ]; then
  __conda_setup="$($HOME'/.miniconda/bin/conda' shell.bash hook 2> /dev/null)"
  if [ $? -eq 0 ]; then
      \eval "$__conda_setup"
  else
      if [ -f $HOME"/.miniconda/etc/profile.d/conda.sh" ]; then
          . $HOME"/.miniconda/etc/profile.d/conda.sh"
          CONDA_CHANGEPS1=false conda activate base
      else
          \export PATH=$HOME"/.miniconda/bin:$PATH"
      fi
  fi
  unset __conda_setupfi
fi
