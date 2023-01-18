
#ifndef _AIXDEFS_H_
#define _AIXDEFS_H_

long strtol(char *, char **, int);
int close (int fildes);
int write(int d, char *buf, unsigned int nbytes);
int read(int d, char *buf, unsigned int nbyte);
void bzero (char *string, int length);

pid_t getpid(void);
int setpgid(pid_t pid, pid_t pgid);

char * getlogin(void);

int nice(int incr);
pid_t fork(void);

unsigned int sleep(unsigned int seconds);

int strcasecmp(const char *s1, const char *s2);

int chmod (char *path, int mode);
int fchmod (int fd, int mode);

int pipe (int fildes[2]);
int dup (int fildes);
int dup2 (int oldfd, int newfd);

int rmdir (char *path);
char *getcwd(char *buf, int size);

int unlink (char * path);

int access (char * path, int amode);

int execl (char *path, ...); /* ends with arg == 0 */
int execlp(char *file, ...); /* ends with arg == 0 */
int execvp(char *file, char *argv[]);

char *memset (char *s, int c, size_t n);

int getopt(int argc, char ** argv, char * optstring);

int putenv( char *str );

/* XXXX FIXME we don't have these afaik */
int mkstemp (char *template);
char * strdup(const char *str1);

#endif
