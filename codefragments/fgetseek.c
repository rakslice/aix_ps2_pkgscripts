int fgetpos(FILE *stream, fpos_t * pos) {
        if (pos == NULL) return 1;
        *pos = ftell(stream);
        return 0;
}

int fsetpos(FILE *stream, fpos_t *pos) {
        if (pos == NULL) return 1;
        return fseek(stream, *pos, 0);
}

