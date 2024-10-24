# other environment variables

# set secrets
[[ -d $HOME/.env ]] && source $HOME/.env

# CUDA environment variable for pytorch
[[ -d /opt/cuda ]] && export XLA_FLAGS=--xla_gpu_cuda_data_dir=/opt/cuda

