FROM alpine:3.20.5 AS build

ARG ARCH
ENV ARCH=$ARCH
ARG TAG
ENV TAG=$TAG

RUN apk add wget bash gcc musl-dev linux-headers make automake autoconf zstd libtool lz4-dev util-linux-dev zlib-dev zstd-dev upx
ADD build.sh /build/build.sh
RUN /build/build.sh


FROM alpine:3.21.2 AS export
RUN apk add libuuid lz4-libs zlib zstd-libs
COPY --from=build /build/erofs-utils/mkfs/mkfs.erofs /usr/bin
ENTRYPOINT ["/usr/bin/mkfs.erofs"]
