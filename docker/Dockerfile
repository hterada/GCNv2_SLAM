# FROM nvidia/cuda:11.4.1-cudnn8-devel-ubuntu18.04
FROM  nvidia/cuda:10.2-cudnn7-devel-ubuntu18.04
LABEL maintainer "Hideo TERADA <h.tee2006@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y git
RUN apt-get install -y python3
RUN apt-get install -y python3-pip

RUN apt-get install -y tzdata
RUN apt-get install -y cmake
RUN apt-get install -y python-yaml
RUN apt-get install -y software-properties-common

RUN apt-get install -y wget
RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
RUN python get-pip.py
RUN pip install typing

# nccl
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
RUN add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/ /"
RUN apt update
RUN apt install -y --allow-change-held-packages libnccl2 libnccl-dev

RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
RUN mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
RUN add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/ /"
RUN apt-get update  -y

# gloo
WORKDIR /
RUN git clone --recursive https://github.com/facebookincubator/gloo.git
WORKDIR /gloo/build
RUN cmake ..
RUN make
RUN make install

# Pytorch
# WORKDIR /
# RUN git clone --recursive -b v1.0.1 https://github.com/pytorch/pytorch
# WORKDIR /pytorch/build
# RUN python ../tools/build_libtorch.py



# RUN apt-get install -y software-properties-common

# # nccl
# RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
# RUN add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/ /"
# RUN apt update
# RUN apt install -y --allow-change-held-packages libnccl2 libnccl-dev

# # Catch2 (for Pangolin)
# WORKDIR /
# RUN git clone --recursive https://github.com/catchorg/Catch2.git
# RUN mkdir /Catch2/build
# WORKDIR /Catch2/build
# RUN cmake .. && make . install

# # Pangolin
# WORKDIR /
# RUN git clone --recursive -b build_on_dlbox1 https://github.com/hterada/Pangolin.git
# WORKDIR /Pangolin
# RUN ./scripts/install_prerequisites.sh recommended
# RUN mkdir build
# WORKDIR /Pangolin/build
# RUN cmake ..
# RUN cmake --build .
# RUN cmake --build . --target install
# RUN cmake --build . --target clean

# # Intel Performance Library
# WORKDIR /ipp
# RUN wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB
# RUN apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB
# RUN wget https://apt.repos.intel.com/setup/intelproducts.list -O /etc/apt/sources.list.d/intelproducts.list
# RUN sh -c 'echo deb https://apt.repos.intel.com/mkl all main > /etc/apt/sources.list.d/intel-mkl.list'
# RUN sh -c 'echo deb https://apt.repos.intel.com/ipp all main > /etc/apt/sources.list.d/intel-ipp.list'
# RUN sh -c 'echo deb https://apt.repos.intel.com/tbb all main > /etc/apt/sources.list.d/intel-tbb.list'
# RUN sh -c 'echo deb https://apt.repos.intel.com/daal all main > /etc/apt/sources.list.d/intel-daal.list'
# RUN sh -c 'echo deb https://apt.repos.intel.com/mpi all main > /etc/apt/sources.list.d/intel-mpi.list'
# RUN sh -c 'echo deb https://apt.repos.intel.com/intelpython binary/ > /etc/apt/sources.list.d/intelpython.list'
# RUN apt-get update

# # OpenCV
# WORKDIR /
# RUN apt-get install -y libopencv-dev python-opencv

# END ####
WORKDIR /
