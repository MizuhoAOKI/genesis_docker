# The base image is provided by nvidia. It is based on ubuntu 22.04 and it supports GPU computation.
FROM nvcr.io/nvidia/cuda:12.1.0-cudnn8-devel-ubuntu22.04

# Environment variables
## To enable NVIDIA GPU support
ENV __NV_PRIME_RENDER_OFFLOAD=1
ENV __GLX_VENDOR_LIBRARY_NAME=nvidia
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=all
## For smooth installation
ENV DEBCONF_NOWARNINGS=yes
## For avoiding error (Ref: https://github.com/Genesis-Embodied-AI/Genesis/issues/37)
ENV PYOPENGL_PLATFORM=mesa

# Install essential packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl lsb-release bash-completion python3-pip \
    x11-utils libglib2.0-dev libosmesa6-dev libgl1-mesa-glx libglu1-mesa mesa-utils

# Install pytorch (required for genesis)
RUN pip3 install torch==2.4.0 torchvision==0.19.0 torchaudio==2.4.0 --index-url https://download.pytorch.org/whl/cu121

# Install genesis (physics engine)
RUN pip3 install genesis-world

# Remove cache to reduce the image size
RUN apt-get clean -y
RUN apt-get autoremove -y
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get autoremove -y
RUN apt-get autoclean -y
RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

# Set default command
CMD ["/bin/bash"]
