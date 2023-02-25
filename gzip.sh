#!/bin/sh
set -e
set -x

pkgname=gzip-1.2.4
tarball="$pkgname.tar"

. common-start.inc

# stock toolchain can't handle a totally empty module
echo "void placeholder() {  }" >> crypt.c

./configure
make

. $pkgscripts/common-end.inc
