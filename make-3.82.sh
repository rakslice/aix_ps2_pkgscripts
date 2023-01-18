#!/bin/sh
set -e
set -x

pkgname=make-3.82

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc

. common-start.inc

#/usr/local/bin/bash 
SHELL=/usr/local/bin/bash ./configure --build=i386-ibm-aix
make CFLAGS=

. $pkgscripts/common-end.inc
