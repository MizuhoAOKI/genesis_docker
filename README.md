# genesis_docker

This repository provides a GPU enabled docker environment for [Genesis](https://genesis-world.readthedocs.io/en/latest/user_guide/overview/what_is_genesis.html), a universal physics engine for various simulations.

## Docker Environment
- OS: Ubuntu 22.04
    - base image: `nvcr.io/nvidia/cuda:12.1.0-cudnn8-devel-ubuntu22.04`
- CUDA: 12.1.0
- Python: 3.10.12
- Pytorch: 2.4.0

## Setup

1. Prerequisites
    - [docker](https://docs.docker.com/engine/install/ubuntu/)
        - For ubuntu users:
            ```
            curl -fsSL https://get.docker.com -o get-docker.sh
            sudo sh get-docker.sh
            ```
    - [rocker](https://github.com/osrf/rocker)
        - For ubuntu users:
            ```
            sudo apt-get install python3-rocker
            ```
    - [nvidia driver](https://www.nvidia.com/en-us/drivers/)
        - Required to access GPU on the host machine.
    - [nvidia-container-toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)
        - Required to use the GPU in a docker container.

1. Clone the project repository.
    ```
    cd <path to your workspace>
    git clone https://github.com/MizuhoAOKI/genesis_docker
    ```

1. Run for the first time setup to build the docker image.
    ```
    cd <path to your workspace>/genesis_docker
    make setup_docker
    ```

1. Launch the docker container and get into the bash inside.
    ```
    cd <path to your workspace>/genesis_docker
    make run_docker
    ```

## Test Environment

I tested the setup works properly on the following environment.
- OS: Ubuntu 20.04
- CPU: 13th Gen Intel(R) Core(TM) i7-13700KF
- GPU: NVIDIA GeForce RTX 4070 Ti
- Nvidia Driver Version: 535.183.01

## Try Genesis on Docker

### [Ex.1] Hello, Genesis
Run the following commands in the docker container.
```bash
cd ~/genesis_docker
python3 example/cpu/genesis_hello.py
```

### [Ex.2] Control a Robot
Run the following commands in the docker container.
```bash
cd ~/genesis_docker
python3 example/gpu/control_robot.py
```

### [Ex.3] Parralel Simulation
Run the following commands in the docker container.
```bash
cd ~/genesis_docker
python3 example/gpu/parrallel_simulation.py
```
