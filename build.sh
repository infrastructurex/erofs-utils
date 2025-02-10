#!/usr/bin/env sh

VERSION=1.8.4
SOURCE=https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot/erofs-utils-$VERSION.tar.gz

echo Downloading erofs-utils "$VERSION" ...
cd /build || exit
wget "$SOURCE"

echo Extracting erofs-utils "$VERSION" ...
tar -xf erofs-utils-$VERSION.tar.gz
mv erofs-utils-$VERSION erofs-utils

echo Building erofs-utils ...
cd /build/erofs-utils || exit

autoreconf -fiv
./configure # --enable-multithreading not yet compatible with dedupe
make "-j$(nproc)" || exit
