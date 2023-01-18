#!/bin/sh

set -e 
set -x


sh make.sh
sh bash1.sh
sh patch.sh
sh bzip2.sh
