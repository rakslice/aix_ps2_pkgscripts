#!/bin/sh
set -e
set -x

pkgname=expat-2.2.5
tarball=$pkgname.tar.bz2

make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc
PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

/usr/local/bin/patch -p4 -i $patches/$pkgname.patch

cp $pkgscripts/codefragments/stdint.h lib/ 

ENV= CONFIG_SHELL=/archive/bash2 SHELL=/archive/bash2 /archive/bash2 ./configure

$make

. $pkgscripts/common-end.inc
