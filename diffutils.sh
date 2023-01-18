#!/bin/sh
set -e
set -x

pkgname=diffutils-2.7

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc

. common-start.inc

PATH=/usr/local/bin:$PATH ./configure
make

. $pkgscripts/common-end.inc
