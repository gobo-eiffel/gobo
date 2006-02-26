/*
	description:

		"C functions used to implement class FILE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_FILE_C
#define EIF_FILE_C

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h>
#include <sys/utime.h>
#include <sys/stat.h>
#ifdef EIF_WINDOWS
#include <io.h> /* for access, chmod */
#else
#include <unistd.h>
#endif

#ifndef NAME_MAX
#define NAME_MAX 10 /* Maximum length for user/group name */
#endif

#ifndef S_IRUSR
#define S_IRUSR 0000400
#endif
#ifndef S_IWUSR
#define S_IWUSR 0000200
#endif
#ifndef S_IXUSR
#define S_IXUSR 0000100
#endif
#ifndef S_IRGRP
#define S_IRGRP 0000040
#endif
#ifndef S_IWGRP
#define S_IWGRP 0000020
#endif
#ifndef S_IXGRP
#define S_IXGRP 0000010
#endif
#ifndef S_IROTH
#define S_IROTH 0000004
#endif
#ifndef S_IWOTH
#define S_IWOTH 0000002
#endif
#ifndef S_IXOTH
#define S_IXOTH 0000001
#endif
#ifndef S_IFDIR
#define S_IFDIR 0040000
#endif
#ifndef S_IFCHR
#define S_IFCHR 0020000
#endif
#ifndef S_IFBLK
#define S_IFBLK 0060000
#endif
#ifndef S_IFREG
#define S_IFREG 0100000
#endif
#ifndef S_IFIFO
#define S_IFIFO 0010000
#endif
#ifndef S_IFLNK
#define S_IFLNK 0120000
#endif
#ifndef S_IFSOCK
#define S_IFSOCK 0140000
#endif

/* The following access constants seems to be universally accepeted. And
 * anyway, it's only after BSD 4.1 that the symbolic constants appeared.
 */
#ifndef R_OK
#define R_OK 4
#define W_OK 2
#define X_OK 1
#define F_OK 0
#endif

/* Keep only permission mode */
#define ST_MODE 0x0fff

void file_mkdir(char* dirname) {
#ifdef WIN32
	mkdir(dirname);
#else
	mkdir(dirname, 0777);
#endif
}

void file_rename(char* old, char* new) {
#ifdef WIN32
	struct stat buf;

	if (stat(new, &buf) != -1) {
		remove (new);
	}
#endif
	rename(old, new);
}

void file_link(char *from, char *to) {
		/* Link file `from' into `to' */
#ifdef HAS_LINK
	link(from, to);
#endif
}

void file_unlink(char *name) {
		/* Delete file or directory `name' */
	struct stat buf;

	if (stat(name, &buf) != -1) {
		if (buf.st_mode & S_IFDIR) {
			rmdir(name);
		} else {
			remove(name);
		}
	}
}

static char* file_open_mode(int how) {
	switch (how) {
	case 0: 
		return "r";
	case 1:
		return "w";
	case 2:
		return "a";
	case 3:
		return "r+";
	case 4:
		return "w+";
	case 5:
		return "a+";
	case 10: 
		return "rb";
	case 11:
		return "wb";
	case 12:
		return "ab";
	case 13:
		return "rb+";
	case 14:
		return "wb+";
	case 15:
		return "ab+";
	default:
		return "r";
	}
}

EIF_POINTER file_open(char *name, int how) {
	/* TODO: raise an exception if could not open file */
	return (EIF_POINTER)fopen(name, file_open_mode(how));
}

EIF_POINTER file_dopen(int fd, int how) {
	/* TODO: raise an exception if could not open file */
	return (EIF_POINTER)fdopen(fd, file_open_mode(how));
}

EIF_POINTER file_reopen(char *name, int how, FILE *old) {
	/* TODO: raise an exception if could not open file */
	return (EIF_POINTER)freopen(name, file_open_mode(how), old);
}

void file_close(FILE *fp) {
	fclose(fp);
}

void file_flush(FILE *fp) {
	fflush(fp);
}

EIF_INTEGER file_fd(FILE *f) {
	return (EIF_INTEGER)fileno(f);
}

EIF_CHARACTER file_gc(FILE *f) {
	return (EIF_CHARACTER)getc(f);
}

EIF_INTEGER file_gs(FILE *f, char *s, EIF_INTEGER bound, EIF_INTEGER start) {
	EIF_INTEGER amount;
	int c = '\0';
	EIF_INTEGER read;

	amount = bound - start;
	s += start;
	read = 0;
	while (amount-- > 0) {
		if ((c = getc(f)) == '\n' || c == EOF)
			break;
		*s++ = c;
		read++;
	}
	if (c == EOF || c == '\n')
#ifdef EIF_WINDOWS
		if ((read > 0) && (*(s-1) == '\r'))
			return read - 1;
		else
			return read;
#else
		return read;
#endif
	if (amount == -1)
		return (read + 1);
	return bound - start + 1;
}

EIF_INTEGER file_gss(FILE* f, char* s, EIF_INTEGER bound) {
	return (EIF_INTEGER)fread((void*)s, (size_t)1, (size_t)bound, f);
}

EIF_INTEGER file_gw(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start) {
	EIF_INTEGER amount;
	int c = 0;

	amount = bound - start;
	s += start;
	if (start == 0) {
		while ((c = getc(f)) != EOF)
			if (!isspace(c))
				break;
		if (c == EOF)
			return (EIF_INTEGER) 0;
		else
			ungetc(c, f);
	}
	while (amount-- > 0) {
		c = getc(f);
		if (c == EOF)
			break;
		if (isspace(c)) {
			ungetc(c, f);
			break;
		}
		*s++ = c;
	}
	if (c == EOF || isspace(c))
		return bound - start - amount - 1;
	return bound - start + 1;
}

EIF_CHARACTER file_lh(FILE *f) {
	int c;

	c = getc(f);
	if (c != EOF)
		ungetc(c, f);
	return (EIF_CHARACTER)(c == EOF ? (char)0 : (char)c);
}

EIF_INTEGER eif_file_size(FILE *fp) {
	struct stat buf;

	fflush (fp);
	if (fstat(fileno(fp), &buf) == -1)
		return (EIF_INTEGER)0;
	else
		return (EIF_INTEGER)(buf.st_size);
}

void file_tnil(FILE *f) {
	int c;

	while ((c = getc(f)) != '\n' && c != EOF)
		;
}

EIF_INTEGER file_tell(FILE *f) {
	return (EIF_INTEGER)ftell(f);
}

void file_touch(char *name) {
	file_utime(name, time((time_t *) 0), 2);
}

void file_utime(char *name, time_t stamp, int how) {
	struct utimbuf tp;
	struct stat buf;

	if (how < 2) {
		file_stat(name, &buf);
		switch (how) {
		case 0: /* Change only access time */
			tp.actime = stamp;
			tp.modtime = buf.st_mtime;
			break;
		case 1: /* Change only modification time */
			tp.actime = buf.st_atime;
			tp.modtime = stamp;
			break;
		}
	} else {
		tp.actime = tp.modtime = stamp; /* Change both access and modification times */
	}
	utime(name, &tp);
}

void file_stat(char *path, struct stat *buf) {
	stat(path, buf);
}

void file_perm(char *name, char *who, char *what, int flag) {
	int fmode;
	struct stat buf;

	file_stat(name, &buf);
	fmode = (int)buf.st_mode;
	switch (*who) {
	case 'u':
		while (*what)
			switch (*what++) {
#ifdef EIF_WINDOWS
			case 's':
				break;
			case 'r':
				break;
			case 'w':
				break;
			case 'x':
				break;
#else
			case 's':
				if (flag)
					fmode |= S_ISUID;
				else
					fmode &= ~S_ISUID;
				break;
			case 'r':
				if (flag)
					fmode |= S_IRUSR;
				else
					fmode &= ~S_IRUSR;
				break;
			case 'w':
				if (flag)
					fmode |= S_IWUSR;
				else
					fmode &= ~S_IWUSR;
				break;
			case 'x':
				if (flag)
					fmode |= S_IXUSR;
				else
					fmode &= ~S_IXUSR;
				break;
#endif
			default:
				break;
			}
		break;
	case 'g':
		while (*what)
			switch (*what++) {
			case 's':
#ifdef EIF_WINDOWS
#else
				if (flag)
					fmode |= S_ISGID;
				else
					fmode &= ~S_ISGID;
#endif
				break;
			case 'r':
				if (flag)
					fmode |= S_IRGRP;
				else
					fmode &= ~S_IRGRP;
				break;
			case 'w':
				if (flag)
					fmode |= S_IWGRP;
				else
					fmode &= ~S_IWGRP;
				break;
			case 'x':
				if (flag)
					fmode |= S_IXGRP;
				else
					fmode &= ~S_IXGRP;
				break;
			default:
				break;
			}
		break;
	case 'o':
		while (*what)
			switch (*what++) {
			case 't':
#ifdef EIF_WINDOWS
#else
				if (flag)
					fmode |= S_ISVTX;
				else
					fmode &= ~S_ISVTX;
#endif
				break;
			case 'r':
				if (flag)
					fmode |= S_IROTH;
				else
					fmode &= ~S_IROTH;
				break;
			case 'w':
				if (flag)
					fmode |= S_IWOTH;
				else
					fmode &= ~S_IWOTH;
				break;
			case 'x':
				if (flag)
					fmode |= S_IXOTH;
				else
					fmode &= ~S_IXOTH;
				break;
			default:
				break;
			}
		break;
	default:
		break;
	}
    file_chmod(name, fmode);
}

void file_chmod(char *path, int mode) {
	chmod(path, mode);
}

void file_chown(char *name, int uid) {
#ifdef HAS_CHOWN
	int gid;
	struct stat buf;
	
	file_stat(name, &buf);
	gid = buf.st_gid;
	chown(name, uid, gid);
#endif
}

void file_chgrp(char *name, int gid) {
#ifdef HAS_CHOWN
	int uid;
	struct stat buf;
	
	file_stat(name, &buf);
	uid = buf.st_uid;
	chown(name, uid, gid);
#endif
}

void file_tnwl(FILE *f) {
	putc('\n', f);
}

void file_append(FILE *f, FILE *other, EIF_INTEGER l) {
	size_t amount;
	char buffer[512];
	int bufsize = 512;

	fseek(other, 0, SEEK_SET);
	fseek(f, 0, SEEK_END);
	while (l > 0) {
		amount = l;
		if (l < bufsize)
			amount = l;
		else
			amount = bufsize;
		if (amount != fread(buffer, sizeof(char), amount, other))
			break;
		l -= amount;
		if (amount != fwrite(buffer, sizeof(char), amount, f))
			break;
	}
}

void file_ps(FILE *f, char *str, EIF_INTEGER len) {
	fwrite(str, sizeof(char) * len, 1, f);
}

void file_pc(FILE *f, char c) {
	putc(c, f);
}

void file_go(FILE *f, EIF_INTEGER pos) {
	fseek(f, pos, SEEK_SET);
	clearerr(f);
}

void file_recede(FILE *f, EIF_INTEGER pos) {
	fseek(f, -pos, SEEK_END);
	clearerr(f);
}

void file_move(FILE *f, EIF_INTEGER pos) {
	fseek(f, pos, SEEK_CUR);
	clearerr(f);
}

EIF_BOOLEAN file_feof(FILE *fp) {
	return (EIF_BOOLEAN)(feof(fp) != 0);
}

EIF_BOOLEAN file_exists(char *name) {
	struct stat buf;

	return ((stat(name, &buf) == -1) ? EIF_FALSE : EIF_TRUE);
}

EIF_BOOLEAN file_path_exists(char *name) {
	struct stat buf;

	return ((stat(name, &buf) == -1) ? EIF_FALSE : EIF_TRUE);
}

EIF_BOOLEAN file_access(char *name, EIF_INTEGER op) {
	switch (op) {
	case 0: /* Does file exist? */
		return (EIF_BOOLEAN) ((access(name, F_OK) != -1) ? EIF_TRUE : EIF_FALSE);
	case 1: /* Test for search permission */
		return (EIF_BOOLEAN) ((access(name, X_OK) != -1) ? EIF_TRUE : EIF_FALSE);
	case 2: /* Test for write permission */
		return (EIF_BOOLEAN) ((access(name, W_OK) != -1) ? EIF_TRUE : EIF_FALSE);
	case 3: /* Test for read permission */
		return (EIF_BOOLEAN) ((access(name, R_OK) != -1) ? EIF_TRUE : EIF_FALSE);
	default:
		return EIF_FALSE;
	}
}

EIF_BOOLEAN file_creatable(char *path, EIF_INTEGER length) {
	struct stat buf;
	char *temp = NULL;
	char *ptr;

	temp = (char *)malloc(length + 1);
	strcpy(temp, path);
#ifdef EIF_WINDOWS
	ptr = strrchr(temp, '\\');
#else
	ptr = strrchr(temp, '/');
#endif
	if (ptr != (char *) 0) {
		*ptr = '\0';
#ifdef EIF_WINDOWS
		if ((ptr == temp) || (*(ptr -1) == ':'))
				/* path is of the form a:\bbb or \bbb, parent is a:\ or \ */
			strcat(ptr, "\\");
#endif
		}
	else
		strcpy(temp, ".");

		/* Does the parent exist? */
	if (!file_exists(temp)) {
		free(temp);
		return EIF_FALSE;
	}

	file_stat(temp, &buf);
	free(temp);

	if (buf.st_mode & S_IFDIR)	/* Is parent a directory? */
		if (file_eaccess(&buf, 1)) {	/* Check for write permissions */
				/* Check if a non writable file `path' exists */
			if (file_exists(path)) {
				file_stat(path, &buf);
				if (buf.st_mode & S_IFDIR)
					return EIF_FALSE;	/* is a directory */
				return (file_eaccess(&buf, 1)); /* Check for write permissions to re create it */
			}

			return EIF_TRUE;
		}

	return EIF_FALSE;
}

static void swallow_nl(FILE *f) {
		/* Swallow next character if it is a new line */
	if (f != stdin) {
		fscanf (f, "\n");
	} else {
		int c;
		c = getc(f);
		if (c != '\n')
			ungetc(c, f);
	}
}

EIF_INTEGER file_gi(FILE *f) {
	EIF_INTEGER i;     

	fscanf(f, "%d", &i);
	swallow_nl(f);
	return i;
}

EIF_REAL_32 file_gr(FILE *f) {
	EIF_REAL_32 r;     

	fscanf(f, "%f", &r);
	swallow_nl(f);
	return r;
}

EIF_REAL_64 file_gd(FILE *f) {
	EIF_REAL_64 d;     

	fscanf(f, "%lf", &d);
	swallow_nl(f);
	return d;
}

void file_pi(FILE *f, EIF_INTEGER number) {
	fprintf(f, "%d", number);
}

void file_pr(FILE *f, EIF_REAL_32 number) {
    fprintf (f, "%g", number);
}

void file_pd(FILE *f, EIF_REAL_64 val) {
	fprintf(f, "%.17g", val);
}

EIF_INTEGER stat_size(void) {
	return (EIF_INTEGER)sizeof(struct stat);
}

EIF_BOOLEAN file_eaccess(struct stat *buf, int op) {
	int mode = buf->st_mode & ST_MODE;	/* Current mode */
#if defined HAS_GETEUID || defined HAS_GETUID
	int uid = buf->st_uid;				/* File owner */
	int gid = buf->st_gid;				/* File group */
#endif
#ifdef HAS_GETEUID
	int euid, egid;						/* Effective user and group */
#endif

    switch (op) {
	case 0: /* Is file readable */
#ifdef WIN32
	return ((mode && S_IREAD) ? EIF_TRUE : EIF_FALSE);
#elif defined HAS_GETEUID
		euid = geteuid();
		egid = getegid();

		if (euid == 0)
			return EIF_TRUE;
		else if (uid == euid)
			return ((mode & S_IRUSR) ? EIF_TRUE : EIF_FALSE);
		else if (gid == egid)
			return ((mode & S_IRGRP) ? EIF_TRUE : EIF_FALSE);
		else
#endif
			return ((mode & S_IROTH) ? EIF_TRUE : EIF_FALSE);
	case 1: /* Is file writable */
#ifdef WIN32
	return ((mode & S_IWRITE) ? EIF_TRUE : EIF_FALSE);
#elif defined HAS_GETEUID
		euid = geteuid();
		egid = getegid();

		if (euid == 0)
			return EIF_TRUE;
		else if (uid == euid)
			return ((mode & S_IWUSR) ? EIF_TRUE : EIF_FALSE);
		else if (gid == egid)
			return ((mode & S_IWGRP) ? EIF_TRUE : EIF_FALSE);
		else
#endif
			return ((mode & S_IWOTH) ? EIF_TRUE : EIF_FALSE);
	case 2: /* Is file executable */
#ifdef WIN32
	return EIF_TRUE;
#elif defined HAS_GETEUID
		euid = geteuid();
		egid = getegid();

		if (euid == 0)
			return EIF_TRUE;
		else if (uid == euid)
			return ((mode & S_IXUSR) ? EIF_TRUE : EIF_FALSE);
		else if (gid == egid)
			return ((mode & S_IXGRP) ? EIF_TRUE : EIF_FALSE);
		else
#endif
			return ((mode & S_IXOTH) ? EIF_TRUE : EIF_FALSE);
	case 3: /* Is file setuid */
#ifdef WIN32
		return EIF_FALSE;
#else
		return ((mode & S_ISUID) ? EIF_TRUE : EIF_FALSE);
#endif
	case 4: /* Is file setgid */
#ifdef WIN32
		return EIF_FALSE;
#else
		return ((mode & S_ISGID) ? EIF_TRUE : EIF_FALSE);
#endif
	case 5: /* Is file sticky */
#ifdef WIN32
		return EIF_FALSE;
#else
		return ((mode & S_ISVTX) ? EIF_TRUE : EIF_FALSE);
#endif
	case 6: /* Is file owned by effective UID */
#ifdef HAS_GETEUID
		return ((uid == geteuid()) ? EIF_TRUE : EIF_FALSE);
#else
		return EIF_TRUE;
#endif
	case 7: /* Is file owned by real UID */
#ifdef HAS_GETEUID
		return ((uid == getuid()) ? EIF_TRUE : EIF_FALSE);
#else
		return EIF_TRUE;
#endif
	default:
		break;
	}
	return EIF_FALSE;
}

EIF_INTEGER file_info(struct stat *buf, int op) {
	switch (op) {
	case 0:	/* File permission mode */
		return (EIF_INTEGER)(buf->st_mode & ST_MODE);
	case 1:	/* Inode number */
		return (EIF_INTEGER)buf->st_ino;
	case 2:	/* Device inode resides on */
		return (EIF_INTEGER)buf->st_dev;
	case 3:	/* Device type */
		return (EIF_INTEGER)buf->st_rdev;
	case 4:	/* UID of file */
		return (EIF_INTEGER)buf->st_uid;
	case 5:	/* GID of file */
		return (EIF_INTEGER)buf->st_gid;
	case 6:	/* Size of file, in bytes */
		return (EIF_INTEGER)buf->st_size;
	case 7:	/* Last modification time on file */
		return (EIF_INTEGER)buf->st_mtime;
	case 8:	/* Last access made on file */
		return (EIF_INTEGER)buf->st_atime;
	case 9:	/* Last status change */
		return (EIF_INTEGER)buf->st_ctime;
	case 10: /* Number of links */
		return (EIF_INTEGER)buf->st_nlink;
	case 11: /* File type */
		return (EIF_INTEGER)(buf->st_mode & ~ST_MODE);
	case 12: /* Is file a directory */
		return (EIF_INTEGER)(buf->st_mode & S_IFDIR);
	case 13: /* Is file a regular (plain) one */
		if (buf->st_mode & S_IFREG || 0 == (buf->st_mode & ~ST_MODE))
			return (EIF_INTEGER)S_IFREG;
		return (EIF_INTEGER)0;
	case 14: /* Is file a device */
		if (buf->st_mode & S_IFCHR)
			return (EIF_INTEGER)S_IFCHR;
		if (buf->st_mode & S_IFBLK)
			return (EIF_INTEGER)S_IFBLK;
		return (EIF_INTEGER)0;
	case 15: /* Is file a character device */
		return (EIF_INTEGER)(buf->st_mode & S_IFCHR);
	case 16: /* Is file a block device */
		return (EIF_INTEGER)(buf->st_mode & S_IFBLK);
	case 17: /* Is file a FIFO */
		return (EIF_INTEGER)(buf->st_mode & S_IFIFO);
	case 18: /* Is file a symbolic link */
		return (EIF_INTEGER)((buf->st_mode & S_IFLNK) == S_IFLNK);
	case 19: /* Is file a socket */
		return (EIF_INTEGER)(buf->st_mode & S_IFSOCK);
	default:
		break;
    }
	return (EIF_INTEGER)0;
}

EIF_REFERENCE file_owner(int uid) {
	char str[NAME_MAX];
#ifdef HAS_GETPWUID
	struct passwd *pp;

	pp = getpwuid(uid);
	if (pp == (struct passwd *)0)
		sprintf(str, "%d", uid);
	else
		strcpy(str, pp->pw_name);
#else
	sprintf(str, "%d", uid);
#endif
	return gems(str, strlen(str));
}

EIF_REFERENCE file_group(int gid) {
	char str[NAME_MAX];
#ifdef HAS_GETGRGID
	struct group *gp;

	gp = getgrgid(gid);
	if (gp == (struct group *)0)
		sprintf(str, "%d", gid);
	else
		strcpy(str, gp->gr_name);
#else
	sprintf(str, "%d", gid);
#endif
	return gems(str, strlen(str));
}

EIF_INTEGER file_gib(FILE* f) {
	EIF_INTEGER i;     

	fread (&i, sizeof(EIF_INTEGER), 1, f);
	return i;
}

EIF_REAL_32 file_grb(FILE* f) {
	EIF_REAL_32 r;     

	fread (&r, sizeof(EIF_REAL_32), 1, f);
	return r;
}

EIF_REAL_64 file_gdb(FILE* f) {
	EIF_REAL_64 d;     

	fread (&d, sizeof(EIF_REAL_64), 1, f);
	return d;
}

EIF_POINTER file_binary_open(char* name, int how) {
	/* TODO: raise an exception if could not open file */
	if (how < 10)
		return (EIF_POINTER)fopen(name, file_open_mode(how + 10));
	else
		return (EIF_POINTER)fopen(name, file_open_mode(how));
}

EIF_POINTER file_binary_dopen(int fd, int how) {
	/* TODO: raise an exception if could not open file */
	if (how < 10)
		return (EIF_POINTER)fdopen(fd, file_open_mode(how + 10));
	else
		return (EIF_POINTER)fdopen(fd, file_open_mode(how));
}

EIF_POINTER file_binary_reopen(char* name, int how, FILE* old) {
	/* TODO: raise an exception if could not open file */
	if (how < 10)
		return (EIF_POINTER)freopen(name, file_open_mode(how + 10), old);
	else
		return (EIF_POINTER)freopen(name, file_open_mode(how), old);
}

void file_pib(FILE* f, EIF_INTEGER number) {
	fwrite(&number, sizeof(EIF_INTEGER), 1, f);
}

void file_prb(FILE* f, EIF_REAL_32 number) {
    fwrite(&number, sizeof(EIF_REAL_32), 1, f);
}

void file_pdb(FILE* f, EIF_REAL_64 val) {
	fwrite (&val, sizeof(EIF_REAL_64), 1, f);
}

#endif
