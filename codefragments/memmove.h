
#define memmove(dst, src, n) bcopy(src, dst, n)

void bcopy(const char * src, char * dst, int n);

