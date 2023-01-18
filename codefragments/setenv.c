
int
setenv (name, value, replace)
     const char *name;
     const char *value;
     int replace;
{
	const char * ch;
	char * buf;
	int namelen;
	int valuelen;

	if ((name == NULL) || (value == NULL)) {
		errno = EINVAL;
		return -1;
	}
	for (ch = name; *ch != '0'; ++ch) {
		if (*ch == '=') {
			errno = ENIVAL;
			return -1;
		}
	}
	
	if ((!replace) && (getenv(name) != NULL)) {
		/** we have an existing value but no overwrite */
		return 0;
	}

	namelen = strlen(name);
	valuelen = strlen(value);

	buf = malloc(namelen + 1 + valuelen + 1);
	if (buf == NULL) {
		errno = ENOMEM;
		return -1;
	}
	bcopy(name, buf, namelen);
	buf[namelen] = '=';
	bcopy(value, buf + namelen + 1, valuelen);
	buf[namelen + 1 + valuelen] = '0';
	return putenv(buf);
}
