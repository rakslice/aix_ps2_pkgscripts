#!/bin/sh

set -e 
set -x


sh make.sh
sh bash1.sh
sh patch.sh
sh bzip2.sh

# new things that maybe have order problems
sh diffutils.sh
sh gawk.sh
sh gdb.sh

sh grep.sh
sh grep-2.5.4.sh

sh perl.sh

sh makedepend.sh
sh openssl.sh
sh pcre.sh

sh zlib.sh

sh openssh.sh
sh prngd.sh

sh sed.sh

sh bash2.sh

sh make-3.82.sh
