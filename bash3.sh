#!/bin/sh
set -e
set -x

pkgname=bash-3.2.57
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc

PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

/usr/local/bin/patch -p2 -i $patches/bash-3.2.57.old.patch

cp $pkgscripts/codefragments/alttio.h .

ENV= CONFIG_SHELL=/archive/bash2 /archive/bash2 ./configure --with-bash-malloc --disable-nls

#make CFLAGS=
$make

. $pkgscripts/common-end.inc
