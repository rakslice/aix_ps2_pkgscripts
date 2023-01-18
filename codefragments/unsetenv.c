int unsetenv(const char * varname) {
        char * buf;
        int varnamelen = strlen(buf);
        buf = malloc(varnamelen + 2);
        if (buf == 0) {
                errno = ENOMEM;
                return -1;
        }
        bcopy(varname, buf, varnamelen);
        buf[varnamelen] = '=';
        buf[varnamelen+1] = '\0';

        /* the alloced mem is abandoned as
        local man putenv suggests this is required */
        return putenv(varname);
}


