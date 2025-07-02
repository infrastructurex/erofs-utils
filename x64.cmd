docker image rm erofs-utils:dev
docker buildx build --platform=linux/amd64 --progress=plain --load -t erofs-utils:dev .
docker run --rm --privileged erofs-utils:dev --help
