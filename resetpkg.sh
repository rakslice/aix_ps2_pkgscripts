#!/bin/sh
set -e
set -x

[ $# -eq 1 ] || exit 1

srcname="$1"

[ -d "/u/root/src/$srcname" ]

rm -rf "/u/root/src/$srcname"

if [ -d "/u/root/pkg/$srcname" ]; then
  rm -rf "/u/root/pkg/$srcname"
fi

if [ -f "/u/root/pkg/$srcname.pkg" ]; then
  rm "/u/root/pkg/$srcname.pkg"
fi
