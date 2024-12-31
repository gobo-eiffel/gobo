/*
	description:

		"Part of ISE Eiffel runtime. Needed to compile the C code of the EiffelNet library."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef EIF_CONFIG_H
#define EIF_CONFIG_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif

#if defined(GE_WINDOWS)

/* ABORTSIG:
 *	This symbol holds the signal number (symbol) used by the abort() call. To
 *	actually define the signal symbol, <signal.h> should be included.
 */
#define ABORTSIG SIGABRT		/* NC */

/* MEM_ALIGNBYTES:
 *	This symbol contains the number of bytes required to align a
 *	double. Usual values are 2, 4 and 8.
 */
#define MEM_ALIGNBYTES 8	/* NC */

/* BYTEORDER:
 *	This symbol hold the hexadecimal constant defined in byteorder,
 *	i.e. 0x1234 or 0x4321, etc...
 */
#define BYTEORDER 0x1234	/* large digits for MSB */

/* CAT2:
 *	This macro catenates 2 tokens together.
 */
#if 42 == 1
#define CAT2(a,b)a/* NC */b
#define CAT3(a,b,c)a/* NC */b/* NC */c
#elif 42 == 42
#define CAT2(a,b)a ## b
#define CAT3(a,b,c)a ## b ## c
#endif

#ifndef CAT2
#include "Warning: How does this C preprocessor catenate tokens?"
#endif

/* VAL_NOFILE:
 *	This symbol contains the number of file descriptors available to the
 *	process, as determined at configuration time. Unless a static constant
 *	is needed, you should rely on getdtablesize() to obtain that number.
 */
#define VAL_NOFILE 60	/* Number of file descriptors */

/* USE_BSDJMP:
 *	This symbol, if defined, indicates that the BSD _setjmp and _longjmp
 *	routines are available to do non-local gotos wihtout saving or restoring
 *	the signal mask flag.
 */
/*#define  USE_BSDJMP		 */ /* NC */

/* HAS_CHOWN:
 *	This symbol, if defined, indicates that the chown routine is
 *	available.
 */
/*#define  HAS_CHOWN		 */ /* NC */

/* HAS_DUP2:
 *	This symbol, if defined, indicates that the dup2 routine is
 *	available to duplicate file descriptors.
 */
#define HAS_DUP2	/* NC */

/* EOFPIPE:
 *	This symbol, if defined, indicates that EOF condition will be detected
 *	by the reader of the pipe when it is closed by the writing process.
 *	That is, a select() call on that file descriptor will not block when
 *	only an EOF remains (typical behaviour for BSD systems).
 */
/*#define  EOFPIPE		 */ /* NC */

/* HAS_FCNTL:
 *	This symbol, if defined, indicates to the C program that
 *	the fcntl() function exists.
 */
#define HAS_FCNTL		/* NC */

/* HAS_FTIME:
 *	This symbol, if defined, indicates that the ftime() routine exists.
 *	It is basically a sub-second accuracy clock, but is less accurate
 *	than gettimeofday(2) anyway. The type "Timeval" should be used to
 *	refer to "struct timeb".
 */
#define HAS_FTIME		/* NC */
#ifdef HAS_FTIME
#define Timeval struct timeb		/* Structure used by ftime() */
#endif

/* HAS_GETTIMEOFDAY:
 *	This symbol, if defined, indicates that the gettimeofday() system
 *	call is available for a sub-second accuracy clock. Usually, the file
 *	<sys/resource.h> needs to be included (see I_SYS_RESOURCE).
 *	The type "Timeval" should be used to refer to "struct timeval".
 */
/*#define  HAS_GETTIMEOFDAY	 */ /* NC */
#ifdef HAS_GETTIMEOFDAY
#define Timeval struct timeval	/* Structure used by gettimeofday() */
#endif

/* HAS_GETGROUPS:
 *	This symbol, if defined, indicates that the getgroups() routine is
 *	available to get the list of process groups.  If unavailable, multiple
 *	groups are probably not supported.
 */
/*#define  HAS_GETGROUPS		 */ /* NC */

/* Groups_t:
 *	This symbol holds the type used for the second argument to
 *	getgroups().  Usually, this is the same of gidtype, but
 *	sometimes it isn't.  It can be int, ushort, uid_t, etc...
 *	It may be necessary to include <sys/types.h> to get any
 *	typedef'ed information.  This is only required if you have
 *	getgroups().
 */
#ifdef HAS_GETGROUPS
#define Groups_t 	/* Type for 2nd arg to getgroups() */
#endif

/* PAGESIZE_VALUE:
 *	This symbol holds the size in bytes of a system page (obtained via
 *	the getpagesize() system call at configuration time or asked to the
 *	user if the system call is not available).
 */
#define PAGESIZE_VALUE 4096	/* System page size, in bytes */

/* SIGNALS_KEPT:
 *	This symbol is defined if signal handlers needn't be reinstated after
 *	receipt of a signal.
 */
/*#define  SIGNALS_KEPT	 */ /* NC */

/* HAS_LINK:
 *	This symbol, if defined, indicates that the link routine is
 *	available to create hard links.
 */
/*#define  HAS_LINK	 */ /* NC */

/* HAS_LSTAT:
 *	This symbol, if defined, indicates that the lstat routine is
 *	available to do file stats on symbolic links.
 */
/*#define  HAS_LSTAT		 */ /* NC */

/* HAS_MKDIR:
 *	This symbol, if defined, indicates that the mkdir routine is available
 *	to create directories.  Otherwise you should fork off a new process to
 *	exec /bin/mkdir.
 */
#define HAS_MKDIR		/* NC */

/* PIDCHECK:
 *	This symbol, if defined, means that the kill(pid, 0) will
 *	check for an active pid (i.e. the kernel will run all the
 *	necessary pid checks, but no signal is actually sent).
 */
/*#define  PIDCHECK		 */ /* NC */

/* HAS_READDIR:
 *	This symbol, if defined, indicates that the readdir routine is
 *	available to read directory entries. You may have to include
 *	<dirent.h>. See I_DIRENT.
 */
#define HAS_READDIR		/* NC */

/* HAS_REWINDDIR:
 *	This symbol, if defined, indicates that the rewinddir routine is
 *	available. You may have to include <dirent.h>. See I_DIRENT.
 */
/*#define  HAS_REWINDDIR		 */ /* NC */

/* HAS_RENAME:
 *	This symbol, if defined, indicates that the rename routine is available
 *	to rename files.  Otherwise you should do the unlink(), link(), unlink()
 *	trick.
 */
#define HAS_RENAME	/* NC */

/* HAS_RMDIR:
 *	This symbol, if defined, indicates that the rmdir routine is
 *	available to remove directories. Otherwise you should fork off a
 *	new process to exec /bin/rmdir.
 */
#define HAS_RMDIR		/* NC */

/* HAS_GETRUSAGE:
 *	This symbol, if defined, indicates that the getrusage() routine is
 *	available to get process statistics with a sub-second accuracy.
 *	Inclusion of <sys/resource.h> and <sys/time.h> may be necessary.
 */
/*#define  HAS_GETRUSAGE		 */ /* NC */

/* HAS_SBRK:
 *	This symbol, if defined, indicates that the sbrk system call is
 *	available to add/relase core. Always true on Unix.
 */
/*#define  HAS_SBRK	 */ /* NC */

/* HAS_SIGACTION:
 *	This symbol, if defined, indicates that the sigaction() routine is
 *	available as a better alternative to the signal call.
 */
/*#define  HAS_SIGACTION		 */ /* NC */

/* HAS_SIGALTSTACK:
 *	This symbol, if defined, indicates that the sigaltstack() routine is
 *	available to set an alternative call stack. Otherwise it means that
 *  a stack overflow will not be correctly handled.
 */
/*#define  HAS_SIGALTSTACK		 */ /* NC */

/* HAS_SYS_SIGLIST:
 *	This symbol, if defined, indicates that the sys_siglist array is
 *	available to translate signal numbers to strings.
 */
/*#define  HAS_SYS_SIGLIST		 */ /* NC */

/* HAS_SIGSETMASK:
 *	This symbol, if defined, indicates that the sigsetmask() routine is
 *	available to set current signal mask. Otherwise, you should probably
 *	emulate this by using signal(), but fear race conditions...
 */
/*#define  HAS_SIGSETMASK		 */ /* NC */

/* HAS_SIGVEC:
 *	This symbol, if defined, indicates that BSD reliable signals are
 *	supported.
 */
/*#define  HAS_SIGVEC	 */ /* NC */

/* HAS_SIGVECTOR:
 *	This symbol, if defined, indicates that the sigvec() routine is called
 *	sigvector() instead, and that sigspace() is provided instead of
 *	sigstack().  This is probably only true for HP-UX.
 */
/*#define  HAS_SIGVECTOR	 */ /* NC */

/* HAS_STRERROR:
 *	This symbol, if defined, indicates that the strerror routine is
 *	available to translate error numbers to strings. See the writeup
 *	of Strerror() in this file before you try to define your own.
 */
#define HAS_STRERROR		/* NC */

/* HAS_SYS_ERRLIST:
 *	This symbol, if defined, indicates that the sys_errlist array is
 *	available to translate error numbers to strings. The extern int
 *	sys_nerr gives the size of that table.
 */
#define HAS_SYS_ERRLIST	/* NC */

/* HAS_SYS_ERRNOLIST:
 *	This symbol, if defined, indicates that the sys_errnolist array is
 *	available to translate an errno code into its symbolic name (e.g.
 * ENOENT). The extern int sys_nerrno gives the size of that table.
 */
/*#define  HAS_SYS_ERRNOLIST	 */ /* NC */

/* Strerror:
 *	This preprocessor symbol is defined as a macro if strerror() is
 *	not available to translate error numbers to strings but sys_errlist[]
 *	array is there.
 */
#define Strerror(e) strerror(e)

/* HAS_TIME:
 *	This symbol, if defined, indicates that the time() routine exists.
 */
#define HAS_TIME		/* NC */

/* Time_t:
 *	This symbol holds the type returned by time(). It can be long,
 *	or time_t on BSD sites (in which case <sys/types.h> should be
 *	included).
 */
#define Time_t time_t		/* Time type */

/* HAS_TIMES:
 *	This symbol, if defined, indicates that the times() routine exists.
 *	Note that this became obsolete on some systems (SUNOS), which now
 * use getrusage(). It may be necessary to include <sys/times.h>.
 */
/*#define  HAS_TIMES		 */ /* NC */

/* HAS_USLEEP:
 *	This symbol, if defined, indicates that the usleep routine is
 *	available to let the process sleep on a sub-second accuracy.
 */
/*#define  HAS_USLEEP		 */ /* NC */

/* HAS_NANOSLEEP:
 *	This symbol, if defined, indicates that the nanosleep routine is
 *	available to let the process sleep on a sub-second accuracy.
 */
/*#define  HAS_NANOSLEEP		 */ /* NC */

/* Signal_t:
 *	This symbol's value is either "void" or "int", corresponding to the
 *	appropriate return type of a signal handler.  Thus, you can declare
 *	a signal handler using "Signal_t (*handler)()", and define the
 *	handler using "Signal_t handler(sig)".
 */
#define Signal_t void	/* Signal handler's return type */

/* I_DIRENT:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <dirent.h>. Using this symbol also triggers the definition
 *	of the Direntry_t define which ends up being 'struct dirent' or
 *	'struct direct' depending on the availability of <dirent.h>.
 */
/*#define  I_DIRENT		 */ /* NC */

/* DIRNAMLEN:
 *	This symbol, if defined, indicates to the C program that the length
 *	of directory entry names is provided by a d_namlen field.  Otherwise
 *	you need to do strlen() on the d_name field.
 */
/*#define  DIRNAMLEN	 */ /* NC */

/* I_FCNTL:
 *	This manifest constant tells the C program to include <fcntl.h>.
 */
#define I_FCNTL	/* NC */

/* I_GRP:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <grp.h>.
 */
/*#define  I_GRP		 */ /* NC */

/* I_LIMITS:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <limits.h> to get definition of symbols like WORD_BIT or
 *	LONG_MAX, i.e. machine dependant limitations.
 */
#define I_LIMITS		/* NC */

/* I_NETINET_IN:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <netinet/in.h>. Otherwise, you may try <sys/in.h>.
 */
/*#define  I_NETINET_IN	 */ /* NC */

/* I_SYS_IN:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/in.h> instead of <netinet/in.h>.
 */
/*#define  I_SYS_IN		 */ /* NC */

/* I_PWD:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <pwd.h>.
 */
/*#define  I_PWD		 */ /* NC */

/* I_SYS_DIR:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/dir.h>.
 */
/*#define  I_SYS_DIR		 */ /* NC */

/* I_SYS_FILE:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/file.h> to get definition of R_OK and friends.
 */
/*#define  I_SYS_FILE		 */ /* NC */

/* I_SYS_NDIR:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/ndir.h>.
 */
/*#define  I_SYS_NDIR	 */ /* NC */

/* I_SYS_RESOURCE:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/resource.h>.
 */
/*#define  I_SYS_RESOURCE		 */ /* NC */

/* I_SYS_SOCKET:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/socket.h> before performing socket calls.
 */
/*#define  I_SYS_SOCKET		 */ /* NC */

/* I_SYS_TIMEB:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/timeb.h>, in order to define struct timeb (some systems
 *	define this in <sys/time.h>). This is useful when using ftime().
 *	You should include <sys/time.h> if I_SYS_TIMEB is not defined,
 *	nor is I_SYS_TIME.
 */
#define I_SYS_TIMEB		/* NC */

/* I_SYS_TIMES:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/times.h>.
 */
/*#define 	I_SYS_TIMES		 */ /* NC */

/* I_SYS_UN:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/un.h> to get UNIX domain socket definitions.
 */
/*#define  I_SYS_UN		 */ /* NC */

/* I_TIME:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <time.h>.
 */
#define I_TIME		/* NC */

/* I_SYS_TIME:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/time.h>.
 */
/*#define  I_SYS_TIME		 */ /* NC */

/* I_SYS_TIME_KERNEL:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/time.h> with KERNEL defined.
 */
/*#define  I_SYS_TIME_KERNEL		 */ /* NC */

/* I_UTIME:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <utime.h>.
 */
/*#define  I_UTIME		 */ /* NC */

/* I_SYSUTIME:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/utime.h>.
 */
#define I_SYSUTIME		/* NC */

/* I_STDARG:
 *	This symbol, if defined, indicates that <stdarg.h> exists and should
 *	be included.
 */
#define I_STDARG		/* NC */

/* I_VARARGS:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <varargs.h>.
 */
#define I_VARARGS	/* NC */

/* INTSIZE:
 *	This symbol contains the size of an int, so that the C preprocessor
 *	can make decisions based on it.
 */
#define INTSIZE 4		/* NC */

/* Malloc_t:
 *	This symbol is the type of pointer returned by malloc and realloc.
 */
#define Malloc_t void *			/* NC */

/* Pid_t:
 *	This symbol holds the type used to declare process ids in the kernel.
 *	It can be int, uint, pid_t, etc... It may be necessary to include
 *	<sys/types.h> to get any typedef'ed information.
 */
#define Pid_t pid_t		/* PID type */

/* CAN_PROTOTYPE:
 *	If defined, this macro indicates that the C compiler can handle
 *	function prototypes.
 */
#define	CAN_PROTOTYPE	/* NC */

/* _:
 *	This macro is used to declare function parameters for folks who want
 *	to make declarations with prototypes using a different style than
 *	the above macros.  Use double parentheses.  For example:
 *
 *		int main _((int argc, char *argv[]));
 */
#ifdef CAN_PROTOTYPE
#define	_(args) args
#else
#define	_(args) ()
#endif

/* HAS_SMART_SBRK:
 *	This symbol is defined when the sbrk() system call may be used with
 *	a negative argument to lower the break value, therefore releasing
 *	core to the system. If not, you'd probably be better off using the
 *	mmap() system call.
 */
/*#define  HAS_SMART_SBRK  */ /* NC */

/* Select_fd_set_t:
 *	This symbol holds the type used for the 2nd, 3rd, and 4th
 *	arguments to select.  Usually, this is 'fd_set *', if HAS_FD_SET
 *	is defined, and 'int *' otherwise.  This is only useful if you
 *	have select(), of course.
 */
#define Select_fd_set_t 	fd_set *	/* NC */

/* CAN_KEEPALIVE:
 *	This symbol if defined indicates to the C program that the SO_KEEPALIVE
 *	option of setsockopt() will work as advertised in the manual.
 */
/*#define  CAN_KEEPALIVE		 */ /* NC */

/* Uid_t:
 *	This symbol holds the type used to declare user ids in the kernel.
 *	It can be int, ushort, uid_t, etc... It may be necessary to include
 *	<sys/types.h> to get any typedef'ed information.
 */
#define Uid_t uid_t		/* UID type */

/* VOIDFLAGS:
 *	This symbol indicates how much support of the void type is given by this
 *	compiler.  What various bits mean:
 *
 *	    1 = supports declaration of void
 *	    2 = supports arrays of pointers to functions returning void
 *	    4 = supports comparisons between pointers to void functions and
 *		    addresses of void functions
 *	    8 = suports declaration of generic void pointers
 *
 *	The package designer should define VOIDUSED to indicate the requirements
 *	of the package.  This can be done either by #defining VOIDUSED before
 *	including eif_config.h, or by defining defvoidused in Myinit.U.  If the
 *	latter approach is taken, only those flags will be tested.  If the
 *	level of void support necessary is not present, defines void to int.
 */
#ifndef VOIDUSED
#define VOIDUSED 15
#endif
#define VOIDFLAGS 15
#if (VOIDFLAGS & VOIDUSED) != VOIDUSED
#define void int		/* is void to be avoided? */
#define M_VOID			/* Xenix strikes again */
#endif

/* USE_ADD_LOG:
 *	This symbol is defined if the run time logging is enabled, mainly for
 *	debugging purposes (although the logging level may be set to a low level
 *	to leave only critical error messages). This will never be defined by
 *	default.
 */
/*#define  USE_ADD_LOG		 */ /* Allow logging */
#define LOGGING_LEVEL	9	/* Logging level */

/* HAS_SMART_MMAP:
 *	This symbol, if defined, indicates to the C program that it can
 *	use mmap and munmap for shared memory.
 */
/*#define  HAS_SMART_MMAP	 */ /* NC */

/* HAS_GETPWUID:
 *	This symbol, if defined, indicates that the getpwuid system call is
 *	available
 */
/*#define  HAS_GETPWUID	 */ /* NC */

/* HAS_GETGRGID:
 *	This symbol, if defined, indicates that the getgrgid system call is
 *	available
 */
/*#define  HAS_GETGRGID	 */ /* NC */

/* HAS_GETEUID:
 *	This symbol, if defined, indicates that the geteuid system call is
 *	available
 */
/*#define  HAS_GETEUID	 */ /* NC */

/* HAS_UNLINK:
 *	This symbol, if defined, indicates that the unlink routine is
 *	available.
 */
#define HAS_UNLINK	/* NC */

/* HAS_UTIME:
 *	This symbol, if defined, indicates that the utime routine is
 *	available.
 */
#define HAS_UTIME	/* NC */

/* I_FD_SET_SYS_SELECT:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/select.h> in order to get definition of struct fd_set.
 */
/*#define  I_FD_SET_SYS_SELECT	 */ /* NC */

/* I_TMVAL_SYS_SELECT:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/select.h> in order to get definition of struct timeval.
 *.I_SYS_SELECT is not set correctly in the dist3.0 p22
 * This unit overrides the default one. It checks the content of
 * the include file <sys/select.h> to find the definition of timeval
 */
/*#define  I_TMVAL_SYS_SELECT	 */ /* NC */

/* MAY_PANIC:
 *	This symbol is defined if the run-time is to be compiled with extra
 *	consistency checks. Those checks make sure some "impossible" conditions
 *	never occur, and they raise a panic if they do. Typical checks include
 *	free-list consistency check, stack overflow or underflow, etc...
 */
/*#define  MAY_PANIC	 */ /* Extra run-time consistency checks */

/* USE_BSD_SIGNALS:
 * On some Unix, we need to define _BSD_SIGNALS (e.g IRIX*)
 */

/*#define  USE_BSD_SIGNALS	 */ /* NC */

/* USE_TLS:
 *	This symbol, if defined, indicates that thread-local storage specifier
 *	can be used to access thread-local variables.
 */
/*#define  USE_TLS	 */ /* NC */

/* INTEGER_64 display format:
 * 	This symbol is used in printf and others to display 64 bits signed
 *	integers.
 */

#define EIF_INTEGER_64_DISPLAY "I64d"
#define EIF_NATURAL_64_DISPLAY "I64u"
/* GOBO #define EIF_POINTER_DISPLAY "llX" */

/* Does current platform support conversion from uin64 to floating point? */
#define	HAS_BUILTIN_CONVERSION_FROM_UINT64_TO_FLOATING_POINT	/* NC */

/* INTEGER_64 constant definition: */
#ifndef RTI64C
#define RTI64C(x)	CAT2(x,i64)
#endif
#ifndef RTU64C
#define RTU64C(x)	CAT2(x,ui64)
#endif

/* Define EIF_OS Constants */

#define EIF_OS_WINNT 	1
#define EIF_OS_LINUX 	2
#define EIF_OS_SUNOS	3
#define EIF_OS_DARWIN 	4
#define EIF_OS_ALPHA 	5
#define EIF_OS_FREEBSD 	6
#define EIF_OS_HPUX 	7
#define EIF_OS_IRIX 	8
#define EIF_OS_OPENBSD 	9
#define EIF_OS_UNICOS 	10
#define EIF_OS_VXWORKS	11
#define EIF_OS_VMS  	12
#define EIF_OS_HAIKU	13
#define EIF_OS_IPHONE	14

/* Define EIF_OS value */
#define EIF_OS EIF_OS_WINNT

/* Define EIF_ARCH Constants */

#define EIF_ARCH_X86 		1
#define EIF_ARCH_X86_64 	2
#define EIF_ARCH_SPARC 		3
#define EIF_ARCH_SPARC_64 	4
#define EIF_ARCH_PPC		5
#define EIF_ARCH_PPC_64		6
#define EIF_ARCH_C90		7
#define EIF_ARCH_T3D		8
#define EIF_ARCH_HPPA		9
#define EIF_ARCH_MIPS		10
#define EIF_ARCH_MIPS_64	11
#define EIF_ARCH_ARM6		12
#define EIF_ARCH_VAX		13
#define EIF_ARCH_ALPHA		14
#define EIF_ARCH_IA64		15

/* Define EIF_ARCH value */
#define EIF_ARCH EIF_ARCH_X86_64

/* Is 64 bits platform? */
#define	EIF_64_BITS		/* NC */

#elif defined(GE_MACOS)

/* ABORTSIG:
 *	This symbol holds the signal number (symbol) used by the abort() call. To
 *	actually define the signal symbol, <signal.h> should be included.
 */
#define ABORTSIG SIGABRT		/* NC */

/* MEM_ALIGNBYTES:
 *	This symbol contains the number of bytes required to align a
 *	double. Usual values are 2, 4 and 8.
 */
#define MEM_ALIGNBYTES 8	/* NC */

/* BYTEORDER:
 *	This symbol hold the hexadecimal constant defined in byteorder,
 *	i.e. 0x1234 or 0x4321, etc...
 */
#define BYTEORDER 0x1234	/* large digits for MSB */

/* CAT2:
 *	This macro catenates 2 tokens together.
 */
#if 42 == 1
#define CAT2(a,b)a/* NC */b
#define CAT3(a,b,c)a/* NC */b/* NC */c
#elif 42 == 42
#define CAT2(a,b)a ## b
#define CAT3(a,b,c)a ## b ## c
#endif

#ifndef CAT2
#include "Warning: How does this C preprocessor catenate tokens?"
#endif

/* VAL_NOFILE:
 *	This symbol contains the number of file descriptors available to the
 *	process, as determined at configuration time. Unless a static constant
 *	is needed, you should rely on getdtablesize() to obtain that number.
 */
#define VAL_NOFILE 1024	/* Number of file descriptors */

/* USE_BSDJMP:
 *	This symbol, if defined, indicates that the BSD _setjmp and _longjmp
 *	routines are available to do non-local gotos wihtout saving or restoring
 *	the signal mask flag.
 */
#define USE_BSDJMP		/* NC */

/* HAS_CHOWN:
 *	This symbol, if defined, indicates that the chown routine is
 *	available.
 */
#define HAS_CHOWN		/* NC */

/* HAS_DUP2:
 *	This symbol, if defined, indicates that the dup2 routine is
 *	available to duplicate file descriptors.
 */
#define HAS_DUP2	/* NC */

/* EOFPIPE:
 *	This symbol, if defined, indicates that EOF condition will be detected
 *	by the reader of the pipe when it is closed by the writing process.
 *	That is, a select() call on that file descriptor will not block when
 *	only an EOF remains (typical behaviour for BSD systems).
 */
#define EOFPIPE		/* NC */

/* HAS_FCNTL:
 *	This symbol, if defined, indicates to the C program that
 *	the fcntl() function exists.
 */
#define HAS_FCNTL		/* NC */

/* HAS_FTIME:
 *	This symbol, if defined, indicates that the ftime() routine exists.
 *	It is basically a sub-second accuracy clock, but is less accurate
 *	than gettimeofday(2) anyway. The type "Timeval" should be used to
 *	refer to "struct timeb".
 */
/*#define  HAS_FTIME		 */ /* NC */
#ifdef HAS_FTIME
#define Timeval struct timeb		/* Structure used by ftime() */
#endif

/* HAS_GETTIMEOFDAY:
 *	This symbol, if defined, indicates that the gettimeofday() system
 *	call is available for a sub-second accuracy clock. Usually, the file
 *	<sys/resource.h> needs to be included (see I_SYS_RESOURCE).
 *	The type "Timeval" should be used to refer to "struct timeval".
 */
#define HAS_GETTIMEOFDAY	/* NC */
#ifdef HAS_GETTIMEOFDAY
#define Timeval struct timeval	/* Structure used by gettimeofday() */
#endif

/* HAS_GETGROUPS:
 *	This symbol, if defined, indicates that the getgroups() routine is
 *	available to get the list of process groups.  If unavailable, multiple
 *	groups are probably not supported.
 */
#define HAS_GETGROUPS		/* NC */

/* Groups_t:
 *	This symbol holds the type used for the second argument to
 *	getgroups().  Usually, this is the same of gidtype, but
 *	sometimes it isn't.  It can be int, ushort, uid_t, etc...
 *	It may be necessary to include <sys/types.h> to get any
 *	typedef'ed information.  This is only required if you have
 *	getgroups().
 */
#ifdef HAS_GETGROUPS
#define Groups_t gid_t	/* Type for 2nd arg to getgroups() */
#endif

/* PAGESIZE_VALUE:
 *	This symbol holds the size in bytes of a system page (obtained via
 *	the getpagesize() system call at configuration time or asked to the
 *	user if the system call is not available).
 */
#define PAGESIZE_VALUE 4096	/* System page size, in bytes */

/* SIGNALS_KEPT:
 *	This symbol is defined if signal handlers needn't be reinstated after
 *	receipt of a signal.
 */
#define SIGNALS_KEPT	/* NC */

/* HAS_LINK:
 *	This symbol, if defined, indicates that the link routine is
 *	available to create hard links.
 */
#define HAS_LINK	/* NC */

/* HAS_LSTAT:
 *	This symbol, if defined, indicates that the lstat routine is
 *	available to do file stats on symbolic links.
 */
#define HAS_LSTAT		/* NC */

/* HAS_MKDIR:
 *	This symbol, if defined, indicates that the mkdir routine is available
 *	to create directories.  Otherwise you should fork off a new process to
 *	exec /bin/mkdir.
 */
#define HAS_MKDIR		/* NC */

/* PIDCHECK:
 *	This symbol, if defined, means that the kill(pid, 0) will
 *	check for an active pid (i.e. the kernel will run all the
 *	necessary pid checks, but no signal is actually sent).
 */
#define PIDCHECK		/* NC */

/* HAS_READDIR:
 *	This symbol, if defined, indicates that the readdir routine is
 *	available to read directory entries. You may have to include
 *	<dirent.h>. See I_DIRENT.
 */
#define HAS_READDIR		/* NC */

/* HAS_REWINDDIR:
 *	This symbol, if defined, indicates that the rewinddir routine is
 *	available. You may have to include <dirent.h>. See I_DIRENT.
 */
#define HAS_REWINDDIR		/* NC */

/* HAS_RENAME:
 *	This symbol, if defined, indicates that the rename routine is available
 *	to rename files.  Otherwise you should do the unlink(), link(), unlink()
 *	trick.
 */
#define HAS_RENAME	/* NC */

/* HAS_RMDIR:
 *	This symbol, if defined, indicates that the rmdir routine is
 *	available to remove directories. Otherwise you should fork off a
 *	new process to exec /bin/rmdir.
 */
#define HAS_RMDIR		/* NC */

/* HAS_GETRUSAGE:
 *	This symbol, if defined, indicates that the getrusage() routine is
 *	available to get process statistics with a sub-second accuracy.
 *	Inclusion of <sys/resource.h> and <sys/time.h> may be necessary.
 */
#define HAS_GETRUSAGE		/* NC */

/* HAS_SBRK:
 *	This symbol, if defined, indicates that the sbrk system call is
 *	available to add/relase core. Always true on Unix.
 */
#define HAS_SBRK	/* NC */

/* HAS_SIGACTION:
 *	This symbol, if defined, indicates that the sigaction() routine is
 *	available as a better alternative to the signal call.
 */
#define HAS_SIGACTION		/* NC */

/* HAS_SIGALTSTACK:
 *	This symbol, if defined, indicates that the sigaltstack() routine is
 *	available to set an alternative call stack. Otherwise it means that
 *  a stack overflow will not be correctly handled.
 */
#define HAS_SIGALTSTACK		/* NC */

/* HAS_SYS_SIGLIST:
 *	This symbol, if defined, indicates that the sys_siglist array is
 *	available to translate signal numbers to strings.
 */
#define HAS_SYS_SIGLIST		/* NC */

/* HAS_SIGSETMASK:
 *	This symbol, if defined, indicates that the sigsetmask() routine is
 *	available to set current signal mask. Otherwise, you should probably
 *	emulate this by using signal(), but fear race conditions...
 */
#define HAS_SIGSETMASK		/* NC */

/* HAS_SIGVEC:
 *	This symbol, if defined, indicates that BSD reliable signals are
 *	supported.
 */
#define HAS_SIGVEC	/* NC */

/* HAS_SIGVECTOR:
 *	This symbol, if defined, indicates that the sigvec() routine is called
 *	sigvector() instead, and that sigspace() is provided instead of
 *	sigstack().  This is probably only true for HP-UX.
 */
/*#define  HAS_SIGVECTOR	 */ /* NC */

/* HAS_STRERROR:
 *	This symbol, if defined, indicates that the strerror routine is
 *	available to translate error numbers to strings. See the writeup
 *	of Strerror() in this file before you try to define your own.
 */
#define HAS_STRERROR		/* NC */

/* HAS_SYS_ERRLIST:
 *	This symbol, if defined, indicates that the sys_errlist array is
 *	available to translate error numbers to strings. The extern int
 *	sys_nerr gives the size of that table.
 */
#define HAS_SYS_ERRLIST	/* NC */

/* HAS_SYS_ERRNOLIST:
 *	This symbol, if defined, indicates that the sys_errnolist array is
 *	available to translate an errno code into its symbolic name (e.g.
 * ENOENT). The extern int sys_nerrno gives the size of that table.
 */
/*#define  HAS_SYS_ERRNOLIST	 */ /* NC */

/* Strerror:
 *	This preprocessor symbol is defined as a macro if strerror() is
 *	not available to translate error numbers to strings but sys_errlist[]
 *	array is there.
 */
#define Strerror(e) strerror(e)

/* HAS_TIME:
 *	This symbol, if defined, indicates that the time() routine exists.
 */
#define HAS_TIME		/* NC */

/* Time_t:
 *	This symbol holds the type returned by time(). It can be long,
 *	or time_t on BSD sites (in which case <sys/types.h> should be
 *	included).
 */
#define Time_t time_t		/* Time type */

/* HAS_TIMES:
 *	This symbol, if defined, indicates that the times() routine exists.
 *	Note that this became obsolete on some systems (SUNOS), which now
 * use getrusage(). It may be necessary to include <sys/times.h>.
 */
#define HAS_TIMES		/* NC */

/* HAS_USLEEP:
 *	This symbol, if defined, indicates that the usleep routine is
 *	available to let the process sleep on a sub-second accuracy.
 */
#define HAS_USLEEP		/* NC */

/* HAS_NANOSLEEP:
 *	This symbol, if defined, indicates that the nanosleep routine is
 *	available to let the process sleep on a sub-second accuracy.
 */
#define HAS_NANOSLEEP		/* NC */

/* Signal_t:
 *	This symbol's value is either "void" or "int", corresponding to the
 *	appropriate return type of a signal handler.  Thus, you can declare
 *	a signal handler using "Signal_t (*handler)()", and define the
 *	handler using "Signal_t handler(sig)".
 */
#define Signal_t void	/* Signal handler's return type */

/* I_DIRENT:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <dirent.h>. Using this symbol also triggers the definition
 *	of the Direntry_t define which ends up being 'struct dirent' or
 *	'struct direct' depending on the availability of <dirent.h>.
 */
#define I_DIRENT		/* NC */

/* DIRNAMLEN:
 *	This symbol, if defined, indicates to the C program that the length
 *	of directory entry names is provided by a d_namlen field.  Otherwise
 *	you need to do strlen() on the d_name field.
 */
#define DIRNAMLEN	/* NC */

/* I_FCNTL:
 *	This manifest constant tells the C program to include <fcntl.h>.
 */
/*#define  I_FCNTL	 */ /* NC */

/* I_GRP:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <grp.h>.
 */
#define I_GRP		/* NC */

/* I_LIMITS:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <limits.h> to get definition of symbols like WORD_BIT or
 *	LONG_MAX, i.e. machine dependant limitations.
 */
#define I_LIMITS		/* NC */

/* I_NETINET_IN:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <netinet/in.h>. Otherwise, you may try <sys/in.h>.
 */
#define I_NETINET_IN	/* NC */

/* I_SYS_IN:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/in.h> instead of <netinet/in.h>.
 */
/*#define  I_SYS_IN		 */ /* NC */

/* I_PWD:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <pwd.h>.
 */
#define I_PWD		/* NC */

/* I_SYS_DIR:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/dir.h>.
 */
#define I_SYS_DIR		/* NC */

/* I_SYS_FILE:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/file.h> to get definition of R_OK and friends.
 */
#define I_SYS_FILE		/* NC */

/* I_SYS_NDIR:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/ndir.h>.
 */
/*#define  I_SYS_NDIR	 */ /* NC */

/* I_SYS_RESOURCE:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/resource.h>.
 */
#define I_SYS_RESOURCE		/* NC */

/* I_SYS_SOCKET:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/socket.h> before performing socket calls.
 */
#define I_SYS_SOCKET		/* NC */

/* I_SYS_TIMEB:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/timeb.h>, in order to define struct timeb (some systems
 *	define this in <sys/time.h>). This is useful when using ftime().
 *	You should include <sys/time.h> if I_SYS_TIMEB is not defined,
 *	nor is I_SYS_TIME.
 */
#define I_SYS_TIMEB		/* NC */

/* I_SYS_TIMES:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/times.h>.
 */
#define	I_SYS_TIMES		/* NC */

/* I_SYS_UN:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/un.h> to get UNIX domain socket definitions.
 */
#define I_SYS_UN		/* NC */

/* I_TIME:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <time.h>.
 */
/*#define  I_TIME		 */ /* NC */

/* I_SYS_TIME:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/time.h>.
 */
#define I_SYS_TIME		/* NC */

/* I_SYS_TIME_KERNEL:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/time.h> with KERNEL defined.
 */
/*#define  I_SYS_TIME_KERNEL		 */ /* NC */

/* I_UTIME:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <utime.h>.
 */
#define I_UTIME		/* NC */

/* I_SYSUTIME:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/utime.h>.
 */
/*#define  I_SYSUTIME		 */ /* NC */

/* I_STDARG:
 *	This symbol, if defined, indicates that <stdarg.h> exists and should
 *	be included.
 */
#define I_STDARG		/* NC */

/* I_VARARGS:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <varargs.h>.
 */
/*#define  I_VARARGS	 */ /* NC */

/* INTSIZE:
 *	This symbol contains the size of an int, so that the C preprocessor
 *	can make decisions based on it.
 */
#define INTSIZE 4		/* NC */

/* Malloc_t:
 *	This symbol is the type of pointer returned by malloc and realloc.
 */
#define Malloc_t void *			/* NC */

/* Pid_t:
 *	This symbol holds the type used to declare process ids in the kernel.
 *	It can be int, uint, pid_t, etc... It may be necessary to include
 *	<sys/types.h> to get any typedef'ed information.
 */
#define Pid_t pid_t		/* PID type */

/* CAN_PROTOTYPE:
 *	If defined, this macro indicates that the C compiler can handle
 *	function prototypes.
 */
#define	CAN_PROTOTYPE	/* NC */

/* _:
 *	This macro is used to declare function parameters for folks who want
 *	to make declarations with prototypes using a different style than
 *	the above macros.  Use double parentheses.  For example:
 *
 *		int main _((int argc, char *argv[]));
 */
#ifdef CAN_PROTOTYPE
#define	_(args) args
#else
#define	_(args) ()
#endif

/* HAS_SMART_SBRK:
 *	This symbol is defined when the sbrk() system call may be used with
 *	a negative argument to lower the break value, therefore releasing
 *	core to the system. If not, you'd probably be better off using the
 *	mmap() system call.
 */
/*#define  HAS_SMART_SBRK  */ /* NC */

/* Select_fd_set_t:
 *	This symbol holds the type used for the 2nd, 3rd, and 4th
 *	arguments to select.  Usually, this is 'fd_set *', if HAS_FD_SET
 *	is defined, and 'int *' otherwise.  This is only useful if you
 *	have select(), of course.
 */
#define Select_fd_set_t 	fd_set *	/* NC */

/* CAN_KEEPALIVE:
 *	This symbol if defined indicates to the C program that the SO_KEEPALIVE
 *	option of setsockopt() will work as advertised in the manual.
 */
/*#define  CAN_KEEPALIVE		 */ /* NC */

/* Uid_t:
 *	This symbol holds the type used to declare user ids in the kernel.
 *	It can be int, ushort, uid_t, etc... It may be necessary to include
 *	<sys/types.h> to get any typedef'ed information.
 */
#define Uid_t uid_t		/* UID type */

/* VOIDFLAGS:
 *	This symbol indicates how much support of the void type is given by this
 *	compiler.  What various bits mean:
 *
 *	    1 = supports declaration of void
 *	    2 = supports arrays of pointers to functions returning void
 *	    4 = supports comparisons between pointers to void functions and
 *		    addresses of void functions
 *	    8 = suports declaration of generic void pointers
 *
 *	The package designer should define VOIDUSED to indicate the requirements
 *	of the package.  This can be done either by #defining VOIDUSED before
 *	including eif_config.h, or by defining defvoidused in Myinit.U.  If the
 *	latter approach is taken, only those flags will be tested.  If the
 *	level of void support necessary is not present, defines void to int.
 */
#ifndef VOIDUSED
#define VOIDUSED 15
#endif
#define VOIDFLAGS 15
#if (VOIDFLAGS & VOIDUSED) != VOIDUSED
#define void int		/* is void to be avoided? */
#define M_VOID			/* Xenix strikes again */
#endif

/* USE_ADD_LOG:
 *	This symbol is defined if the run time logging is enabled, mainly for
 *	debugging purposes (although the logging level may be set to a low level
 *	to leave only critical error messages). This will never be defined by
 *	default.
 */
/*#define  USE_ADD_LOG		 */ /* Allow logging */
#define LOGGING_LEVEL	9	/* Logging level */

/* HAS_SMART_MMAP:
 *	This symbol, if defined, indicates to the C program that it can
 *	use mmap and munmap for shared memory.
 */
/*#define  HAS_SMART_MMAP	 */ /* NC */

/* HAS_GETPWUID:
 *	This symbol, if defined, indicates that the getpwuid system call is
 *	available
 */
#define HAS_GETPWUID	/* NC */

/* HAS_GETGRGID:
 *	This symbol, if defined, indicates that the getgrgid system call is
 *	available
 */
#define HAS_GETGRGID	/* NC */

/* HAS_GETEUID:
 *	This symbol, if defined, indicates that the geteuid system call is
 *	available
 */
#define HAS_GETEUID	/* NC */

/* HAS_UNLINK:
 *	This symbol, if defined, indicates that the unlink routine is
 *	available.
 */
#define HAS_UNLINK	/* NC */

/* HAS_UTIME:
 *	This symbol, if defined, indicates that the utime routine is
 *	available.
 */
#define HAS_UTIME	/* NC */

/* I_FD_SET_SYS_SELECT:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/select.h> in order to get definition of struct fd_set.
 */
/*#define  I_FD_SET_SYS_SELECT	 */ /* NC */

/* I_TMVAL_SYS_SELECT:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/select.h> in order to get definition of struct timeval.
 *.I_SYS_SELECT is not set correctly in the dist3.0 p22
 * This unit overrides the default one. It checks the content of
 * the include file <sys/select.h> to find the definition of timeval
 */
/*#define  I_TMVAL_SYS_SELECT	 */ /* NC */

/* MAY_PANIC:
 *	This symbol is defined if the run-time is to be compiled with extra
 *	consistency checks. Those checks make sure some "impossible" conditions
 *	never occur, and they raise a panic if they do. Typical checks include
 *	free-list consistency check, stack overflow or underflow, etc...
 */
/*#define  MAY_PANIC	 */ /* Extra run-time consistency checks */

/* USE_BSD_SIGNALS:
 * On some Unix, we need to define _BSD_SIGNALS (e.g IRIX*)
 */

/*#define  USE_BSD_SIGNALS	 */ /* NC */

/* USE_TLS:
 *	This symbol, if defined, indicates that thread-local storage specifier
 *	can be used to access thread-local variables.
 */
/*#define  USE_TLS	 */ /* NC */

/* INTEGER_64 display format:
 * 	This symbol is used in printf and others to display 64 bits signed
 *	integers.
 */

#define EIF_INTEGER_64_DISPLAY "lld"
#define EIF_NATURAL_64_DISPLAY "llu"
/* GOBO #define EIF_POINTER_DISPLAY "lX" */

/* Does current platform support conversion from uin64 to floating point? */
#define	HAS_BUILTIN_CONVERSION_FROM_UINT64_TO_FLOATING_POINT	/* NC */

/* INTEGER_64 constant definition: */
#ifndef RTI64C
#define RTI64C(x)	CAT2(x,LL)
#endif
#ifndef RTU64C
#define RTU64C(x)	CAT2(x,ULL)
#endif

/* Define EIF_OS Constants */

#define EIF_OS_WINNT 	1
#define EIF_OS_LINUX 	2
#define EIF_OS_SUNOS	3
#define EIF_OS_DARWIN 	4
#define EIF_OS_ALPHA 	5
#define EIF_OS_FREEBSD 	6
#define EIF_OS_HPUX 	7
#define EIF_OS_IRIX 	8
#define EIF_OS_OPENBSD 	9
#define EIF_OS_UNICOS 	10
#define EIF_OS_VXWORKS	11
#define EIF_OS_VMS  	12
#define EIF_OS_HAIKU	13
#define EIF_OS_IPHONE	14

/* Define EIF_OS value */
#define EIF_OS EIF_OS_DARWIN

/* Define EIF_ARCH Constants */

#define EIF_ARCH_X86 		1
#define EIF_ARCH_X86_64 	2
#define EIF_ARCH_SPARC 		3
#define EIF_ARCH_SPARC_64 	4
#define EIF_ARCH_PPC		5
#define EIF_ARCH_PPC_64		6
#define EIF_ARCH_C90		7
#define EIF_ARCH_T3D		8
#define EIF_ARCH_HPPA		9
#define EIF_ARCH_MIPS		10
#define EIF_ARCH_MIPS_64	11
#define EIF_ARCH_ARM6		12
#define EIF_ARCH_VAX		13
#define EIF_ARCH_ALPHA		14
#define EIF_ARCH_IA64		15

/* Define EIF_ARCH value */
#define EIF_ARCH EIF_ARCH_X86_64

/* Is 64 bits platform? */
#define	EIF_64_BITS		/* NC */

#else

/* ABORTSIG:
 *	This symbol holds the signal number (symbol) used by the abort() call. To
 *	actually define the signal symbol, <signal.h> should be included.
 */
#define ABORTSIG SIGABRT		/* NC */

/* MEM_ALIGNBYTES:
 *	This symbol contains the number of bytes required to align a
 *	double. Usual values are 2, 4 and 8.
 */
#define MEM_ALIGNBYTES 8	/* NC */

/* BYTEORDER:
 *	This symbol hold the hexadecimal constant defined in byteorder,
 *	i.e. 0x1234 or 0x4321, etc...
 */
#define BYTEORDER 0x1234	/* large digits for MSB */

/* CAT2:
 *	This macro catenates 2 tokens together.
 */
#if 42 == 1
#define CAT2(a,b)a/* NC */b
#define CAT3(a,b,c)a/* NC */b/* NC */c
#elif 42 == 42
#define CAT2(a,b)a ## b
#define CAT3(a,b,c)a ## b ## c
#endif

#ifndef CAT2
#include "Warning: How does this C preprocessor catenate tokens?"
#endif

/* VAL_NOFILE:
 *	This symbol contains the number of file descriptors available to the
 *	process, as determined at configuration time. Unless a static constant
 *	is needed, you should rely on getdtablesize() to obtain that number.
 */
#define VAL_NOFILE 1024	/* Number of file descriptors */

/* USE_BSDJMP:
 *	This symbol, if defined, indicates that the BSD _setjmp and _longjmp
 *	routines are available to do non-local gotos wihtout saving or restoring
 *	the signal mask flag.
 */
#define USE_BSDJMP		/* NC */

/* HAS_CHOWN:
 *	This symbol, if defined, indicates that the chown routine is
 *	available.
 */
#define HAS_CHOWN		/* NC */

/* HAS_DUP2:
 *	This symbol, if defined, indicates that the dup2 routine is
 *	available to duplicate file descriptors.
 */
#define HAS_DUP2	/* NC */

/* EOFPIPE:
 *	This symbol, if defined, indicates that EOF condition will be detected
 *	by the reader of the pipe when it is closed by the writing process.
 *	That is, a select() call on that file descriptor will not block when
 *	only an EOF remains (typical behaviour for BSD systems).
 */
#define EOFPIPE		/* NC */

/* HAS_FCNTL:
 *	This symbol, if defined, indicates to the C program that
 *	the fcntl() function exists.
 */
#define HAS_FCNTL		/* NC */

/* HAS_FTIME:
 *	This symbol, if defined, indicates that the ftime() routine exists.
 *	It is basically a sub-second accuracy clock, but is less accurate
 *	than gettimeofday(2) anyway. The type "Timeval" should be used to
 *	refer to "struct timeb".
 */
/*#define  HAS_FTIME		 */ /* NC */
#ifdef HAS_FTIME
#define Timeval struct timeb		/* Structure used by ftime() */
#endif

/* HAS_GETTIMEOFDAY:
 *	This symbol, if defined, indicates that the gettimeofday() system
 *	call is available for a sub-second accuracy clock. Usually, the file
 *	<sys/resource.h> needs to be included (see I_SYS_RESOURCE).
 *	The type "Timeval" should be used to refer to "struct timeval".
 */
#define HAS_GETTIMEOFDAY	/* NC */
#ifdef HAS_GETTIMEOFDAY
#define Timeval struct timeval	/* Structure used by gettimeofday() */
#endif

/* HAS_GETGROUPS:
 *	This symbol, if defined, indicates that the getgroups() routine is
 *	available to get the list of process groups.  If unavailable, multiple
 *	groups are probably not supported.
 */
#define HAS_GETGROUPS		/* NC */

/* Groups_t:
 *	This symbol holds the type used for the second argument to
 *	getgroups().  Usually, this is the same of gidtype, but
 *	sometimes it isn't.  It can be int, ushort, uid_t, etc...
 *	It may be necessary to include <sys/types.h> to get any
 *	typedef'ed information.  This is only required if you have
 *	getgroups().
 */
#ifdef HAS_GETGROUPS
#define Groups_t gid_t	/* Type for 2nd arg to getgroups() */
#endif

/* PAGESIZE_VALUE:
 *	This symbol holds the size in bytes of a system page (obtained via
 *	the getpagesize() system call at configuration time or asked to the
 *	user if the system call is not available).
 */
#define PAGESIZE_VALUE 4096	/* System page size, in bytes */

/* SIGNALS_KEPT:
 *	This symbol is defined if signal handlers needn't be reinstated after
 *	receipt of a signal.
 */
#define SIGNALS_KEPT	/* NC */

/* HAS_LINK:
 *	This symbol, if defined, indicates that the link routine is
 *	available to create hard links.
 */
#define HAS_LINK	/* NC */

/* HAS_LSTAT:
 *	This symbol, if defined, indicates that the lstat routine is
 *	available to do file stats on symbolic links.
 */
#define HAS_LSTAT		/* NC */

/* HAS_MKDIR:
 *	This symbol, if defined, indicates that the mkdir routine is available
 *	to create directories.  Otherwise you should fork off a new process to
 *	exec /bin/mkdir.
 */
#define HAS_MKDIR		/* NC */

/* PIDCHECK:
 *	This symbol, if defined, means that the kill(pid, 0) will
 *	check for an active pid (i.e. the kernel will run all the
 *	necessary pid checks, but no signal is actually sent).
 */
#define PIDCHECK		/* NC */

/* HAS_READDIR:
 *	This symbol, if defined, indicates that the readdir routine is
 *	available to read directory entries. You may have to include
 *	<dirent.h>. See I_DIRENT.
 */
#define HAS_READDIR		/* NC */

/* HAS_REWINDDIR:
 *	This symbol, if defined, indicates that the rewinddir routine is
 *	available. You may have to include <dirent.h>. See I_DIRENT.
 */
#define HAS_REWINDDIR		/* NC */

/* HAS_RENAME:
 *	This symbol, if defined, indicates that the rename routine is available
 *	to rename files.  Otherwise you should do the unlink(), link(), unlink()
 *	trick.
 */
#define HAS_RENAME	/* NC */

/* HAS_RMDIR:
 *	This symbol, if defined, indicates that the rmdir routine is
 *	available to remove directories. Otherwise you should fork off a
 *	new process to exec /bin/rmdir.
 */
#define HAS_RMDIR		/* NC */

/* HAS_GETRUSAGE:
 *	This symbol, if defined, indicates that the getrusage() routine is
 *	available to get process statistics with a sub-second accuracy.
 *	Inclusion of <sys/resource.h> and <sys/time.h> may be necessary.
 */
#define HAS_GETRUSAGE		/* NC */

/* HAS_SBRK:
 *	This symbol, if defined, indicates that the sbrk system call is
 *	available to add/relase core. Always true on Unix.
 */
#define HAS_SBRK	/* NC */

/* HAS_SIGACTION:
 *	This symbol, if defined, indicates that the sigaction() routine is
 *	available as a better alternative to the signal call.
 */
#define HAS_SIGACTION		/* NC */

/* HAS_SIGALTSTACK:
 *	This symbol, if defined, indicates that the sigaltstack() routine is
 *	available to set an alternative call stack. Otherwise it means that
 *  a stack overflow will not be correctly handled.
 */
#define HAS_SIGALTSTACK		/* NC */

/* HAS_SYS_SIGLIST:
 *	This symbol, if defined, indicates that the sys_siglist array is
 *	available to translate signal numbers to strings.
 */
#define HAS_SYS_SIGLIST		/* NC */

/* HAS_SIGSETMASK:
 *	This symbol, if defined, indicates that the sigsetmask() routine is
 *	available to set current signal mask. Otherwise, you should probably
 *	emulate this by using signal(), but fear race conditions...
 */
#define HAS_SIGSETMASK		/* NC */

/* HAS_SIGVEC:
 *	This symbol, if defined, indicates that BSD reliable signals are
 *	supported.
 */
#define HAS_SIGVEC	/* NC */

/* HAS_SIGVECTOR:
 *	This symbol, if defined, indicates that the sigvec() routine is called
 *	sigvector() instead, and that sigspace() is provided instead of
 *	sigstack().  This is probably only true for HP-UX.
 */
/*#define  HAS_SIGVECTOR	 */ /* NC */

/* HAS_STRERROR:
 *	This symbol, if defined, indicates that the strerror routine is
 *	available to translate error numbers to strings. See the writeup
 *	of Strerror() in this file before you try to define your own.
 */
#define HAS_STRERROR		/* NC */

/* HAS_SYS_ERRLIST:
 *	This symbol, if defined, indicates that the sys_errlist array is
 *	available to translate error numbers to strings. The extern int
 *	sys_nerr gives the size of that table.
 */
#define HAS_SYS_ERRLIST	/* NC */

/* HAS_SYS_ERRNOLIST:
 *	This symbol, if defined, indicates that the sys_errnolist array is
 *	available to translate an errno code into its symbolic name (e.g.
 * ENOENT). The extern int sys_nerrno gives the size of that table.
 */
/*#define  HAS_SYS_ERRNOLIST	 */ /* NC */

/* Strerror:
 *	This preprocessor symbol is defined as a macro if strerror() is
 *	not available to translate error numbers to strings but sys_errlist[]
 *	array is there.
 */
#define Strerror(e) strerror(e)

/* HAS_TIME:
 *	This symbol, if defined, indicates that the time() routine exists.
 */
#define HAS_TIME		/* NC */

/* Time_t:
 *	This symbol holds the type returned by time(). It can be long,
 *	or time_t on BSD sites (in which case <sys/types.h> should be
 *	included).
 */
#define Time_t time_t		/* Time type */

/* HAS_TIMES:
 *	This symbol, if defined, indicates that the times() routine exists.
 *	Note that this became obsolete on some systems (SUNOS), which now
 * use getrusage(). It may be necessary to include <sys/times.h>.
 */
#define HAS_TIMES		/* NC */

/* HAS_USLEEP:
 *	This symbol, if defined, indicates that the usleep routine is
 *	available to let the process sleep on a sub-second accuracy.
 */
#define HAS_USLEEP		/* NC */

/* HAS_NANOSLEEP:
 *	This symbol, if defined, indicates that the nanosleep routine is
 *	available to let the process sleep on a sub-second accuracy.
 */
#define HAS_NANOSLEEP		/* NC */

/* Signal_t:
 *	This symbol's value is either "void" or "int", corresponding to the
 *	appropriate return type of a signal handler.  Thus, you can declare
 *	a signal handler using "Signal_t (*handler)()", and define the
 *	handler using "Signal_t handler(sig)".
 */
#define Signal_t void	/* Signal handler's return type */

/* I_DIRENT:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <dirent.h>. Using this symbol also triggers the definition
 *	of the Direntry_t define which ends up being 'struct dirent' or
 *	'struct direct' depending on the availability of <dirent.h>.
 */
#define I_DIRENT		/* NC */

/* DIRNAMLEN:
 *	This symbol, if defined, indicates to the C program that the length
 *	of directory entry names is provided by a d_namlen field.  Otherwise
 *	you need to do strlen() on the d_name field.
 */
/*#define  DIRNAMLEN	 */ /* NC */

/* I_FCNTL:
 *	This manifest constant tells the C program to include <fcntl.h>.
 */
/*#define  I_FCNTL	 */ /* NC */

/* I_GRP:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <grp.h>.
 */
#define I_GRP		/* NC */

/* I_LIMITS:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <limits.h> to get definition of symbols like WORD_BIT or
 *	LONG_MAX, i.e. machine dependant limitations.
 */
#define I_LIMITS		/* NC */

/* I_NETINET_IN:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <netinet/in.h>. Otherwise, you may try <sys/in.h>.
 */
#define I_NETINET_IN	/* NC */

/* I_SYS_IN:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/in.h> instead of <netinet/in.h>.
 */
/*#define  I_SYS_IN		 */ /* NC */

/* I_PWD:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <pwd.h>.
 */
#define I_PWD		/* NC */

/* I_SYS_DIR:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/dir.h>.
 */
#define I_SYS_DIR		/* NC */

/* I_SYS_FILE:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/file.h> to get definition of R_OK and friends.
 */
#define I_SYS_FILE		/* NC */

/* I_SYS_NDIR:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/ndir.h>.
 */
/*#define  I_SYS_NDIR	 */ /* NC */

/* I_SYS_RESOURCE:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/resource.h>.
 */
#define I_SYS_RESOURCE		/* NC */

/* I_SYS_SOCKET:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/socket.h> before performing socket calls.
 */
#define I_SYS_SOCKET		/* NC */

/* I_SYS_TIMEB:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/timeb.h>, in order to define struct timeb (some systems
 *	define this in <sys/time.h>). This is useful when using ftime().
 *	You should include <sys/time.h> if I_SYS_TIMEB is not defined,
 *	nor is I_SYS_TIME.
 */
#define I_SYS_TIMEB		/* NC */

/* I_SYS_TIMES:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/times.h>.
 */
#define	I_SYS_TIMES		/* NC */

/* I_SYS_UN:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/un.h> to get UNIX domain socket definitions.
 */
#define I_SYS_UN		/* NC */

/* I_TIME:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <time.h>.
 */
#define I_TIME		/* NC */

/* I_SYS_TIME:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/time.h>.
 */
#define I_SYS_TIME		/* NC */

/* I_SYS_TIME_KERNEL:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/time.h> with KERNEL defined.
 */
/*#define  I_SYS_TIME_KERNEL		 */ /* NC */

/* I_UTIME:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <utime.h>.
 */
#define I_UTIME		/* NC */

/* I_SYSUTIME:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/utime.h>.
 */
/*#define  I_SYSUTIME		 */ /* NC */

/* I_STDARG:
 *	This symbol, if defined, indicates that <stdarg.h> exists and should
 *	be included.
 */
#define I_STDARG		/* NC */

/* I_VARARGS:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <varargs.h>.
 */
/*#define  I_VARARGS	 */ /* NC */

/* INTSIZE:
 *	This symbol contains the size of an int, so that the C preprocessor
 *	can make decisions based on it.
 */
#define INTSIZE 4		/* NC */

/* Malloc_t:
 *	This symbol is the type of pointer returned by malloc and realloc.
 */
#define Malloc_t void *			/* NC */

/* Pid_t:
 *	This symbol holds the type used to declare process ids in the kernel.
 *	It can be int, uint, pid_t, etc... It may be necessary to include
 *	<sys/types.h> to get any typedef'ed information.
 */
#define Pid_t pid_t		/* PID type */

/* CAN_PROTOTYPE:
 *	If defined, this macro indicates that the C compiler can handle
 *	function prototypes.
 */
#define	CAN_PROTOTYPE	/* NC */

/* _:
 *	This macro is used to declare function parameters for folks who want
 *	to make declarations with prototypes using a different style than
 *	the above macros.  Use double parentheses.  For example:
 *
 *		int main _((int argc, char *argv[]));
 */
#ifdef CAN_PROTOTYPE
#define	_(args) args
#else
#define	_(args) ()
#endif

/* HAS_SMART_SBRK:
 *	This symbol is defined when the sbrk() system call may be used with
 *	a negative argument to lower the break value, therefore releasing
 *	core to the system. If not, you'd probably be better off using the
 *	mmap() system call.
 */
/*#define  HAS_SMART_SBRK  */ /* NC */

/* Select_fd_set_t:
 *	This symbol holds the type used for the 2nd, 3rd, and 4th
 *	arguments to select.  Usually, this is 'fd_set *', if HAS_FD_SET
 *	is defined, and 'int *' otherwise.  This is only useful if you
 *	have select(), of course.
 */
#define Select_fd_set_t 	fd_set *	/* NC */

/* CAN_KEEPALIVE:
 *	This symbol if defined indicates to the C program that the SO_KEEPALIVE
 *	option of setsockopt() will work as advertised in the manual.
 */
/*#define  CAN_KEEPALIVE		 */ /* NC */

/* Uid_t:
 *	This symbol holds the type used to declare user ids in the kernel.
 *	It can be int, ushort, uid_t, etc... It may be necessary to include
 *	<sys/types.h> to get any typedef'ed information.
 */
#define Uid_t uid_t		/* UID type */

/* VOIDFLAGS:
 *	This symbol indicates how much support of the void type is given by this
 *	compiler.  What various bits mean:
 *
 *	    1 = supports declaration of void
 *	    2 = supports arrays of pointers to functions returning void
 *	    4 = supports comparisons between pointers to void functions and
 *		    addresses of void functions
 *	    8 = suports declaration of generic void pointers
 *
 *	The package designer should define VOIDUSED to indicate the requirements
 *	of the package.  This can be done either by #defining VOIDUSED before
 *	including eif_config.h, or by defining defvoidused in Myinit.U.  If the
 *	latter approach is taken, only those flags will be tested.  If the
 *	level of void support necessary is not present, defines void to int.
 */
#ifndef VOIDUSED
#define VOIDUSED 15
#endif
#define VOIDFLAGS 15
#if (VOIDFLAGS & VOIDUSED) != VOIDUSED
#define void int		/* is void to be avoided? */
#define M_VOID			/* Xenix strikes again */
#endif

/* USE_ADD_LOG:
 *	This symbol is defined if the run time logging is enabled, mainly for
 *	debugging purposes (although the logging level may be set to a low level
 *	to leave only critical error messages). This will never be defined by
 *	default.
 */
/*#define  USE_ADD_LOG		 */ /* Allow logging */
#define LOGGING_LEVEL	9	/* Logging level */

/* HAS_SMART_MMAP:
 *	This symbol, if defined, indicates to the C program that it can
 *	use mmap and munmap for shared memory.
 */
/*#define  HAS_SMART_MMAP	 */ /* NC */

/* HAS_GETPWUID:
 *	This symbol, if defined, indicates that the getpwuid system call is
 *	available
 */
#define HAS_GETPWUID	/* NC */

/* HAS_GETGRGID:
 *	This symbol, if defined, indicates that the getgrgid system call is
 *	available
 */
#define HAS_GETGRGID	/* NC */

/* HAS_GETEUID:
 *	This symbol, if defined, indicates that the geteuid system call is
 *	available
 */
#define HAS_GETEUID	/* NC */

/* HAS_UNLINK:
 *	This symbol, if defined, indicates that the unlink routine is
 *	available.
 */
#define HAS_UNLINK	/* NC */

/* HAS_UTIME:
 *	This symbol, if defined, indicates that the utime routine is
 *	available.
 */
#define HAS_UTIME	/* NC */

/* I_FD_SET_SYS_SELECT:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/select.h> in order to get definition of struct fd_set.
 */
/*#define  I_FD_SET_SYS_SELECT	 */ /* NC */

/* I_TMVAL_SYS_SELECT:
 *	This symbol, if defined, indicates to the C program that it should
 *	include <sys/select.h> in order to get definition of struct timeval.
 *.I_SYS_SELECT is not set correctly in the dist3.0 p22
 * This unit overrides the default one. It checks the content of
 * the include file <sys/select.h> to find the definition of timeval
 */
/*#define  I_TMVAL_SYS_SELECT	 */ /* NC */

/* MAY_PANIC:
 *	This symbol is defined if the run-time is to be compiled with extra
 *	consistency checks. Those checks make sure some "impossible" conditions
 *	never occur, and they raise a panic if they do. Typical checks include
 *	free-list consistency check, stack overflow or underflow, etc...
 */
/*#define  MAY_PANIC	 */ /* Extra run-time consistency checks */

/* USE_BSD_SIGNALS:
 * On some Unix, we need to define _BSD_SIGNALS (e.g IRIX*)
 */

/*#define  USE_BSD_SIGNALS	 */ /* NC */

/* USE_TLS:
 *	This symbol, if defined, indicates that thread-local storage specifier
 *	can be used to access thread-local variables.
 */
/*#define  USE_TLS	 */ /* NC */

/* INTEGER_64 display format:
 * 	This symbol is used in printf and others to display 64 bits signed
 *	integers.
 */

#define EIF_INTEGER_64_DISPLAY "lld"
#define EIF_NATURAL_64_DISPLAY "llu"
/* GOBO #define EIF_POINTER_DISPLAY "lX" */

/* Does current platform support conversion from uin64 to floating point? */
#define	HAS_BUILTIN_CONVERSION_FROM_UINT64_TO_FLOATING_POINT	/* NC */

/* INTEGER_64 constant definition: */
#ifndef RTI64C
#define RTI64C(x)	CAT2(x,LL)
#endif
#ifndef RTU64C
#define RTU64C(x)	CAT2(x,ULL)
#endif

/* Define EIF_OS Constants */

#define EIF_OS_WINNT 	1
#define EIF_OS_LINUX 	2
#define EIF_OS_SUNOS	3
#define EIF_OS_DARWIN 	4
#define EIF_OS_ALPHA 	5
#define EIF_OS_FREEBSD 	6
#define EIF_OS_HPUX 	7
#define EIF_OS_IRIX 	8
#define EIF_OS_OPENBSD 	9
#define EIF_OS_UNICOS 	10
#define EIF_OS_VXWORKS	11
#define EIF_OS_VMS  	12
#define EIF_OS_HAIKU	13
#define EIF_OS_IPHONE	14

/* Define EIF_OS value */
#define EIF_OS EIF_OS_LINUX

/* Define EIF_ARCH Constants */

#define EIF_ARCH_X86 		1
#define EIF_ARCH_X86_64 	2
#define EIF_ARCH_SPARC 		3
#define EIF_ARCH_SPARC_64 	4
#define EIF_ARCH_PPC		5
#define EIF_ARCH_PPC_64		6
#define EIF_ARCH_C90		7
#define EIF_ARCH_T3D		8
#define EIF_ARCH_HPPA		9
#define EIF_ARCH_MIPS		10
#define EIF_ARCH_MIPS_64	11
#define EIF_ARCH_ARM6		12
#define EIF_ARCH_VAX		13
#define EIF_ARCH_ALPHA		14
#define EIF_ARCH_IA64		15

/* Define EIF_ARCH value */
#define EIF_ARCH EIF_ARCH_X86_64

/* Is 64 bits platform? */
#define	EIF_64_BITS		/* NC */

#endif

#endif
