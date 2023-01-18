#!/bin/sh
set -e
set -x

pkgname=gdb-5.2.1
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc
PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

/usr/local/bin/patch -p2 -i ../gdb-5.2.1.patch

#/usr/local/bin/bash 
#./configure
/u/root/bin/superconf
# --build=i386-ibm-aix
$make RANLIB_FOR_TARGET=ranlib RANLIB_FOR_BUILD=ranlib

. $pkgscripts/common-end.inc
