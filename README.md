## Experiment Using buildah

```
podman run --privileged -v ~/.docker/config.json:/root/.docker/config.json:ro -v $(pwd):/test -w /test -it quay.io/buildah/stable
```

then inside:

```sh
buildah build -f Containerfile -t quay.io/mmortari/demo20241023-ociimage:latest .
buildah push quay.io/mmortari/demo20241023-ociimage:latest
```

```
skopeo copy docker://docker.io/library/busybox oci:temp --multi-arch index-only
```

## Old experiments with labels

podman build -f Containerfile -t quay.io/mmortari/demo20241023-ociimage:latest .
podman push quay.io/mmortari/demo20241023-ociimage:latest
skopeo inspect --raw docker://quay.io/mmortari/demo20241023-ociimage:latest | jq

buildah build -f Containerfile --layers --layer-label matteo=matteo --format oci -t quay.io/mmortari/demo20241023-ociimage:v1 .
buildah push quay.io/mmortari/demo20241023-ociimage:v1

podman build --no-cache -f Containerfile --layers --layer-label matteo=matteo --annotation xyz=xyz --label abc=abc --format oci -t quay.io/mmortari/demo20241023-ociimage:v1 .
podman push quay.io/mmortari/demo20241023-ociimage:v1

skopeo inspect docker://quay.io/mmortari/demo20241023-ociimage:v1 | jq
