

#define _ALT_IOR(x,y,t)     ((IOC_OUT<<28)|((sizeof(t)&IOCSIZMASK)<<16)|(x<<8)|(y))
#define _ALT_IOW(x,y,t)     ((IOC_IN<<28)|((sizeof(t)&IOCSIZMASK)<<16)|(x<<8)|(y))
#define _ALT_ION(x,y)       ((IOC_NONE<<28)|(x<<8)|(y))



#define ALT_TIOCGETC   _ALT_IOR('t', 18, struct tchars) /* get special chars */
#define ALT_TIOCGETD   _ALT_IOR('t', 0, int)         /* get line discipline */
#define ALT_TIOCGETP   _ALT_IOR('t', 8, struct sgttyb) /* get params -- gtty */
#define ALT_TIOCGLTC   _ALT_IOR('t', 116, struct ltchars) /* get bsd special chars */
#define ALT_TIOCGWINSZ      _ALT_IOR('t', 104, struct winsize)    /* get window size */
#define ALT_TIOCLGET   _ALT_IOR('t', 124, int)       /* get local modes */
#define ALT_TIOCLSET   _ALT_IOW('t', 125, int)       /* set entire local mode word */
#define ALT_TIOCNOTTY  _ALT_ION('t', 113)            /* void tty association */
#define ALT_TIOCSETC   _ALT_IOW('t', 17, struct tchars) /* set special chars */
#define ALT_TIOCSETD   _ALT_IOW('t', 1, int)         /* set line discipline */
#define ALT_TIOCSETN   _ALT_IOW('t', 10, struct sgttyb) /* set, but no flushtty */
#define ALT_TIOCSETP   _ALT_IOW('t', 9, struct sgttyb) /* set params -- stty */
#define ALT_TIOCSLTC   _ALT_IOW('t', 117, struct ltchars) /* set bsd special chars */
#define ALT_TIOCSPGRP  _ALT_IOW('t', 118, long)      /* set pgrp of tty */
#define ALT_TIOCSTART  _ALT_ION('t', 110)            /* 4.2: start output, */

#define ALT_TIOCSWINSZ      _ALT_IOW('t', 103, struct winsize)    /* set window size */
#define ALT_TIOCSTOP   _ALT_ION('t', 111)            /* 4.2: stop output, */
