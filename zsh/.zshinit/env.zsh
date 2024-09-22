# other environment variables

# CUDA environment variable for pytorch
[[ -d /opt/cuda ]] && export XLA_FLAGS=--xla_gpu_cuda_data_dir=/opt/cuda

