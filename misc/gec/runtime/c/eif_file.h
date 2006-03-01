/*
	description:

		"C functions used to implement class FILE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_FILE_H
#define EIF_FILE_H

#include <time.h>
#include <sys/stat.h>

extern void file_mkdir(char* dirname);
extern void file_rename(char* old, char* new);
extern void file_link(char *from, char *to);
extern void file_unlink(char *name);
extern EIF_POINTER file_open(char *name, int how);
extern EIF_POINTER file_dopen(int fd, int how);
extern EIF_POINTER file_reopen(char *name, int how, FILE *old);
extern void file_close(FILE *fp);
extern void file_flush(FILE *fp);
extern EIF_INTEGER file_fd(FILE *f);
extern EIF_CHARACTER file_gc(FILE *f);
extern EIF_INTEGER file_gs(FILE *f, char *s, EIF_INTEGER bound, EIF_INTEGER start);
extern EIF_INTEGER file_gss(FILE *f, char *s, EIF_INTEGER bound);
extern EIF_INTEGER file_gw(FILE *f, char *s, EIF_INTEGER bound, EIF_INTEGER start);
extern EIF_CHARACTER file_lh(FILE *f);
extern EIF_INTEGER eif_file_size(FILE *fp);
extern void file_tnil(FILE *f);
extern EIF_INTEGER file_tell(FILE *f);
extern void file_touch(char *name);
extern void file_utime(char *name, time_t stamp, int how);
extern void file_stat(char *path, struct stat *buf);
extern void file_perm(char *name, char *who, char *what, int flag);
extern void file_chmod(char *path, int mode);
extern void file_chown(char *name, int uid);
extern void file_chgrp(char *name, int gid);
extern void file_tnwl(FILE *f);
extern void file_append(FILE *f, FILE *other, EIF_INTEGER l);
extern void file_ps(FILE *f, char *str, EIF_INTEGER len);
extern void file_pc(FILE *f, char c);
extern void file_go(FILE *f, EIF_INTEGER pos);
extern void file_recede(FILE *f, EIF_INTEGER pos);
extern void file_move(FILE *f, EIF_INTEGER pos);
extern EIF_BOOLEAN file_feof(FILE *fp);
extern EIF_BOOLEAN file_exists(char *name);
extern EIF_BOOLEAN file_path_exists(char *name);
extern EIF_BOOLEAN file_access(char *name, EIF_INTEGER op);
extern EIF_BOOLEAN file_creatable(char *path, EIF_INTEGER length);
extern EIF_INTEGER file_gi(FILE *f);
extern EIF_REAL_32 file_gr(FILE *f);
extern EIF_REAL_64 file_gd(FILE *f);
extern void file_pi(FILE *f, EIF_INTEGER number);
extern void file_pr(FILE *f, EIF_REAL_32 number);
extern void file_pd(FILE *f, EIF_REAL_64 val);
extern EIF_INTEGER stat_size(void);
extern EIF_BOOLEAN file_eaccess(struct stat *buf, int op);
extern EIF_INTEGER file_info(struct stat *buf, int op);
extern EIF_REFERENCE file_owner(int uid);
extern EIF_REFERENCE file_group(int gid);
extern EIF_INTEGER file_gib(FILE* f);
extern EIF_REAL_32 file_grb(FILE* f);
extern EIF_REAL_64 file_gdb(FILE* f);
extern EIF_POINTER file_binary_open(char* name, int how);
extern EIF_POINTER file_binary_dopen(int fd, int how);
extern EIF_POINTER file_binary_reopen(char* name, int how, FILE* old);
extern void file_pib(FILE* f, EIF_INTEGER number);
extern void file_prb(FILE* f, EIF_REAL_32 number);
extern void file_pdb(FILE* f, EIF_REAL_64 val);

#endif
