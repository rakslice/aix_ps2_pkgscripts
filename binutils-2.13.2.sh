#!/bin/sh
set -e
set -x

pkgname=binutils-2.13.2
tarball=$pkgname.tar.bz2
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc

PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

/usr/local/bin/patch -p4 -i $patches/$pkgname.patch

ENV= SHELL=/archive/bash2 /archive/bash2 ./configure

# The ranlib stuff is copied from the gdb build, as a workaround for 
# RANLIB evaluating to @: in some of the subdirectory makefiles
# for some reason
$make RANLIB_FOR_TARGET=ranlib RANLIB_FOR_BUILD=ranlib RANLIB=ranlib

make_install_args="RANLIB=ranlib"

prefixvar=DESTDIR

. $pkgscripts/common-end.inc
