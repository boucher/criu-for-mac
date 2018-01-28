# criu-for-mac
Add CRIU support to docker-for-mac.

## Usage

```
docker run --rm -it --privileged --pid=host -e CRIU_VERSION=3.7 boucher/criu-for-mac
```

## Details

Running this image will install CRIU (currently version 3.7) into the virtual machine that powers the underlying docker-for-mac daemon. If you turn on `experimental` features in the Docker preferences, this will enable checkpoint & restore to work for containers running under docker-for-mac.

For more on using checkpoint/restore in Docker, see: https://criu.org/Docker
