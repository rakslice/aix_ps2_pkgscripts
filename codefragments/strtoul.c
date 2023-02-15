unsigned long strtoul(const char * str, char **ptr, int base) {
        return (unsigned long) strtol(str, ptr, base);
}

