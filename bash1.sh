#!/bin/sh
set -e
set -x

basedir=/u/root/src

pkgname=bash-1.14.7

# pre-bash

# requirements
# - gzip

. common-start.inc

makefile=cpp-Makefile

mv "$makefile" "$makefile.orig"
sed 's/^CFLAGS = -O -g/CFLAGS = -O/' "$makefile.orig" > "$makefile"

make

. $pkgscripts/common-end.inc

if [ ! -d /archive ]; then
	mkdir /archive
fi
cp /usr/local/bin/bash /archive/
