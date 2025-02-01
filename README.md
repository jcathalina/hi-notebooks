# Hybrid Intelligence Notebooks

## Quickstart
### Building the Notebook running container
```bash
$ docker build -t notebooks -f Dockerfile.notebooks .
```

### Running the jupyter server through Podman
```bash
$ docker run --gpus=all --rm -it -p 8888:8888 -v $(pwd)/docs/notebooks:/app/docs/notebooks notebooks
```
or without GPU support:
```bash
$ docker run --gpus=all --rm -it -p 8888:8888 -v $(pwd)/docs/notebooks:/app/docs/notebooks notebooks
```

### Running the jupyter server using Podman
/!\ NOTE: On some Linux distros, the official repositories only have older versions of Podman.
Included in this repo is a script that installs the latest alvistack for Linux Mint (based on Ubuntu 22.04), and
Ubuntu 22.04. For other distros or versions, you will have to figure it out yourself for now. Apologies for the inconvenience.

/!\ NOTE: It is advised to handle CUDA support for podman using `nvidia-ctk` CDI.
```bash
$ podman run --rm -it -p 8888:8888 --device nvidia.com/gpu=all -v $(pwd)/docs/notebooks:/app/docs/notebooks notebooks
```
Remove the device flag if GPU support is not desired


