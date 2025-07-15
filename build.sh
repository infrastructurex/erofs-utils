#!/usr/bin/env sh

VERSION=1.8.10
SOURCE=https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot/erofs-utils-$VERSION.tar.gz

echo Downloading erofs-utils "$VERSION" ...
cd /build || exit
wget "$SOURCE"

echo Extracting erofs-utils "$VERSION" ...
tar -xf erofs-utils-$VERSION.tar.gz
mv erofs-utils-$VERSION erofs-utils

echo Building erofs-utils ...
cd /build/erofs-utils || exit

#patch -p1 < /build/erofs.patch || exit 1

autoreconf -fiv
./configure CFLAGS="-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" --enable-multithreading
make "-j$(nproc)" || exit
