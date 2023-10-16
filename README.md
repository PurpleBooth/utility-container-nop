# utility-container-nop

To generate a secret resource using the Kubernetes secret csi, you need
to mount it. As this happens all the time we need a really tiny
container to mount it within.

## Usage


```shell
docker run ghcr.io/purplebooth/utility-container-nop:latest
```

All the docker container contains is a single binary `/nop`.

Build for:
* arm64
* amd64
