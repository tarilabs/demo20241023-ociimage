podman build -f Containerfile -t quay.io/mmortari/demo20241023-ociimage:latest .
podman push quay.io/mmortari/demo20241023-ociimage:latest
skopeo inspect --raw docker://quay.io/mmortari/demo20241023-ociimage:latest | jq

buildah build -f Containerfile --layers --layer-label matteo=matteo --format oci -t quay.io/mmortari/demo20241023-ociimage:v1 .
buildah push quay.io/mmortari/demo20241023-ociimage:v1

podman build --no-cache -f Containerfile --layers --layer-label matteo=matteo --annotation xyz=xyz --label abc=abc --format oci -t quay.io/mmortari/demo20241023-ociimage:v1 .
podman push quay.io/mmortari/demo20241023-ociimage:v1

skopeo inspect docker://quay.io/mmortari/demo20241023-ociimage:v1 | jq
