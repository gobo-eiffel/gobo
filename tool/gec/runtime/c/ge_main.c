/*
	description:

		"C functions used to implement the program initialization"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_MAIN_C
#define GE_MAIN_C

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS

/*
	Main entry point when compiling a Windows application.
	See:
		http://en.wikipedia.org/wiki/WinMain
		http://msdn2.microsoft.com/en-us/library/ms633559.aspx
*/
extern int main(void);
extern void GE_get_argcargv(EIF_NATIVE_CHAR* cmd, int* argc, EIF_NATIVE_CHAR*** argvp);
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
{
	return main();
}

int main(void)
{
	int code;
	int argc;
	EIF_NATIVE_CHAR** argv;
	EIF_NATIVE_CHAR* cmd;
	cmd = GE_nstrdup(GetCommandLineW());
	GE_get_argcargv(cmd, &argc, &argv);
	code = GE_main(argc, argv);
	free(cmd);
	free(argv);
	return code;
}

/*
	Break the shell command held in 'cmd', putting each shell word
	in a separate array entry, hence building an argument
	suitable for the 'main'. Note that 'cmd' will be altered
	and 'argvp' will point to some chunks of it.
*/
void GE_get_argcargv(EIF_NATIVE_CHAR* cmd, int* argc, EIF_NATIVE_CHAR*** argvp)
{
	int quoted = 0; /* parsing inside a quoted string? */
	int nbs; /* number of backspaces */
	int i;
	EIF_NATIVE_CHAR *p = NULL, *pe = NULL; /* pointers in `cmd' */
	EIF_NATIVE_CHAR *qb = NULL, *q = NULL; /* pointers in arguments */

	*argc = 0;
	/* Remove leading and trailing white spaces */
	for (p = cmd; *p == L' ' || *p == L'\t'; p++)
		; /* empty */
	for (pe = p + GE_nstrlen(p) - 1; pe >= p && (*pe == L' ' || *pe == L'\t'); pe--)
		; /* empty */
	if (p <= pe) {
		*argc = *argc + 1; /* at least one argument */
		qb = q = malloc((pe - p + 2) * sizeof(EIF_NATIVE_CHAR));
		if (!qb) {
			return;
		}
		do {
			switch(*p) {
				case L' ':
				case L'\t':
					if (quoted) {
						do {
							*q++ = *p++;
						} while(*p == L' ' || *p == L'\t');
					} else {
						do {
							p++;
						} while(*p == L' ' || *p == L'\t');
						*q++ = L'\0';
						*argc = *argc + 1;
					}
					break;
				case L'\"':
					quoted = ! quoted;
					p++;
					break;
				case L'\\':
					for (nbs = 0; *p == L'\\'; nbs++)
						*q++ = *p++;
					if (*p == L'\"') {
						if (nbs % 2) { /* odd number of backslashes */
							q -= (nbs + 1) / 2;
							*q++ = *p++;
						} else { /* even number of backslashes */
							quoted = ! quoted;
							q -= nbs / 2;
							p++;
						}
					}
					break;
				default:
					*q++ = *p++;
			}
		} while (p <= pe);
		*q++ = L'\0';
	}

	if (!argvp) {
		free(qb);
		return;
	}

	*argvp = (EIF_NATIVE_CHAR**)malloc((*argc+1)*sizeof(EIF_NATIVE_CHAR*));
	if (!(*argvp)) {
		free(qb);
		return;
	}

	for (i = 0; i < *argc; i++) {
		(*argvp)[i] = qb;
		qb += GE_nstrlen(qb) + 1;
	}
	(*argvp)[i] = (EIF_NATIVE_CHAR *)0;
}

#else

int main (int argc, char ** argv)
{
	return GE_main (argc, argv);
}

#endif

#ifdef __cplusplus
}
#endif

#endif
