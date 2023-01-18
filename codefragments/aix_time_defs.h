#ifndef _AIX_TIME_DEFS_
#define _AIX_TIME_DEFS_

#include <sys/time.h>
int gettimeofday(struct timeval *tp, struct timezone *tzp);
int select (int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds, \
        struct timeval *timeout);

#endif
