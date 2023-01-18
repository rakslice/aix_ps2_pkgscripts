#!/bin/sh
set -e
set -x

pkgname=bzip2-1.0.6
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
. binutils-2.9.1.inc

. common-start.inc

mv Makefile Makefile.orig
sed 's/ln -s -f/ln -s/
s/mkdir -p/mkdir/' Makefile.orig > Makefile

$make

prefixvar=PREFIX
. $pkgscripts/common-end.inc
