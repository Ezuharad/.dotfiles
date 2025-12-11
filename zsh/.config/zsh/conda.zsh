#!/usr/bin/env zsh

# conda initialization

{
  which conda > /dev/null
} || {
if [ -f $HOME"/.miniconda3/bin/conda" ]; then
  __conda_setup="$($HOME'/.miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  elif [ -f $HOME"/.miniconda3/etc/profile.d/conda.sh" ]; then
      . $HOME"/.miniconda3/etc/profile.d/conda.sh"
      CONDA_CHANGEPS1=false conda activate base
  else
      export PATH=$PATH:$HOME"/.miniconda3/bin"
  fi
  unset __conda_setup
fi
}
