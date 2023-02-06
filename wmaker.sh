#!/bin/sh
set -e
set -x

pkgname=WindowMaker-0.70.0
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc

PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

/usr/local/bin/patch -p4 -i $patches/$pkgname.patch

#cp $pkgscripts/codefragments/alttio.h .
cp $pkgscripts/codefragments/aixdefs.h .
cp $pkgscripts/codefragments/aix_time_defs.h .
cp $pkgscripts/codefragments/aix_uio_defs.h .
cp $pkgscripts/codefragments/aix_socket_defs.h .
cp $pkgscripts/codefragments/aix_file_defs.h .
cp $pkgscripts/codefragments/memmove.h .
cp $pkgscripts/codefragments/snprintf.h .
cp $pkgscripts/codefragments/strtoul.c WINGs

ENV= CONFIG_SHELL=/archive/bash2 SHELL=/archive/bash2 /archive/bash2 ./configure --disable-locale --disable-shm

#make CFLAGS=
$make 2>&1 | grep -v "has no section"

. $pkgscripts/common-end.inc
