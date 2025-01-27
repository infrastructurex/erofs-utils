docker buildx build --platform=linux/arm64 --progress=plain --load -t erofs-utils:dev .
docker run --rm --privileged erofs-utils:dev --help
