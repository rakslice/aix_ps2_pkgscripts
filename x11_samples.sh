#!/bin/sh
set -e
set -x

# this is a script to build the existing samples on the system
pkgscripts=`pwd`
patches=$pkgscripts/patches

[ -d $patches ] || exit 1

patch=/usr/local/bin/patch

[ -f $patch ] || exit 1


# 0. patch the sources
cd /usr/lpp/X11/samples
ls -l
$patch -p1 -i $patches/x11_samples.patch


# 1. build imake
cd /usr/lpp/X11/samples/config
make

# 2. create makefiles

cd /usr/lpp/X11/samples/lib/Xaw
make Makefile
cd /usr/lpp/X11/samples/clients
make Makefiles
cd /usr/lpp/X11/samples/demos
make Makefiles

# 3. Xaw (athena widgets)
cd /usr/lpp/X11/samples/lib/Xaw
make

# 4. samples

cd /usr/lpp/X11/samples/clients
for client in *
do

# other files in the dir that aren't buildables
if [ "$client" = "Imakefile" ]; then continue; fi
if [ "$client" = "Makefile" ]; then continue; fi

# things we don't want to build
if [ "$client" = "showrgb" ]; then continue; fi

cd /usr/lpp/X11/samples/clients/$client
make
make install
done


# install xdm config

mkdir /usr/lib/X11/xdm

cp -r /usr/lpp/X11/samples/clients/xdm/config/* /usr/lib/X11/xdm/

