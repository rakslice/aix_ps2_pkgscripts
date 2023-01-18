
#ifndef _AIX_SOCKET_DEFS_H_
#define _AIX_SOCKET_DEFS_H_

int getsockopt (int s, int level, int optname, char *optval, int *optlen);
int setsockopt (int s, int level, int optname, char *optval, int optlen);
int socket (int domain, int type, int protocol);
int bind (int s, struct sockaddr *name, int namelen);
int listen (int s, int backlog);
int getsockname(int s, struct sockaddr *name, int *namelen);
int connect(int s, struct sockaddr *name, int namelen);
int accept(int s, struct sockaddr *addr, int *addrlen);
int shutdown(int s, int how);
int gethostname(char *name, int namelen);

#endif
