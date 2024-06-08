/*
	description:

		"C functions used to handle signals"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef GE_SIGNAL_C
#define GE_SIGNAL_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_SIGNAL_H
#include "ge_signal.h"
#endif
#ifndef GE_EXCEPTION_H
#include "ge_exception.h"
#endif

#include <signal.h>

#ifdef GE_USE_THREADS
#ifndef GE_THREAD_H
#include "ge_thread.h"
#endif
#elif !defined(GE_WINDOWS) && defined(GE_USE_BOEHM_GC)
#include <pthread.h>
#endif

#ifndef NSIG
#ifdef GE_WINDOWS
#define GE_NSIG 23
#else
#define GE_NSIG 32
#endif
#else
#ifdef GE_USE_THREADS
#define GE_NSIG	32 /* In MT-mode, it is better not to deal with signals above 32. */
#else
#define	GE_NSIG	NSIG /* GE_NSIG is NSIG in a single threaded runtime. */
#endif
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifdef GE_USE_THREADS
static EIF_MUTEX_TYPE* GE_ignored_signals_mutex = 0; /* Mutex to access `GE_ignored_signals'. */

/* Initialize `GE_ignored_signals_mutex'. */
void GE_init_ignored_signals_mutex()
{
	GE_ignored_signals_mutex = (EIF_MUTEX_TYPE*)GE_mutex_create();
}
#elif defined (GE_WINDOWS)
static DWORD GE_root_thread_id = 0; /* Thread ID of the main thread in non-multithreaded mode. */
#elif defined(GE_USE_BOEHM_GC)
static pthread_t GE_root_thread_id = 0; /* Thread ID of the main thread in non-multithreaded mode. */
#endif

/* Indicates which signals are ignored or not. */
static char GE_ignored_signals[GE_NSIG];

/* Indicates which signals were originally ignored or not. */
static char GE_originally_ignored_signals[GE_NSIG];

/*
 * Code to be executed when the signal `a_sig' is raised.
 */
extern void GE_handle_signal(int a_sig);

/*
 * Code to be executed when the floating point exception signal `a_sig' is raised.
 */
extern void GE_handle_fpe_signal(int a_sig);

/*
 * Code to be executed when the signal `a_sig' is raised.
 */
static void GE_handle_general_signal(int a_sig, int is_fpe)
{
	if (!(GE_main_context && GE_main_context->exception_manager)) {
		fprintf(stderr, "\nSignal caught %d while initializing Eiffel system.\n", a_sig);
		exit(1);
	}
#ifdef GE_USE_THREADS
	GE_context* l_context = GE_unprotected_thread_current_context();
#else
	GE_context* l_context = GE_main_context;
#endif
		/* Check if signal was caught in a non-Eiffel thread. In which case we wimply
		 * print out the signal number except if this is SIGINT or SIGBREAK which are
		 * usually the result of a user action to stop the process. */
#if defined(GE_USE_THREADS) || defined(GE_WINDOWS) || defined(GE_USE_BOEHM_GC)
#ifdef GE_USE_THREADS
	if (!l_context)
#elif defined(GE_WINDOWS)
		/* On Windows for a non-multithreaded program, if we are called from a different
		 * thread than the root one, we clearly cannot continue. */
	if (GE_root_thread_id != GetCurrentThreadId())
#elif defined(GE_USE_BOEHM_GC)
	if (!pthread_equal(GE_root_thread_id, pthread_self()))
#endif
	{
#ifdef SIGBREAK
		if (a_sig != SIGINT && a_sig != SIGBREAK)
#else
		if (a_sig != SIGINT)
#endif
		{
			fprintf(stderr, "\nSignal caught %d while in a non-Eiffel thread.\n", a_sig);
		}
		exit(1);
	}
#endif

	{
		void (*old_handler)(int);

		/* Assume default signal handler is SIG_DFL.
		 * Reset signal handler to call Eiffel's signal handler.
		 */

		if (is_fpe) {
			old_handler = signal(a_sig, GE_handle_fpe_signal);
		} else {
			old_handler = signal(a_sig, GE_handle_signal);
		}

		if (old_handler != SIG_DFL) {
			/* Oops - someone called `signal' to override
			 * Eiffel's handler.  Their handler is still
			 * the one to use, so restore it.
			 */
			signal(a_sig, old_handler);
		}
	}

	if (a_sig >= 1 && a_sig < GE_NSIG) {
		char l_ignored;
#ifdef GE_USE_THREADS
		if (GE_ignored_signals_mutex)
			GE_mutex_lock(GE_ignored_signals_mutex);
#endif
		l_ignored = GE_ignored_signals[a_sig];
#ifdef GE_USE_THREADS
		if (GE_ignored_signals_mutex)
			GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
		if (l_ignored)	/* If signal is to be ignored */
			return; /* Nothing to be done */
	}

	l_context->signal_number = a_sig;
	if (!l_context->exception_manager) {
		fprintf(stderr, "\nSignal caught %d while initializing Eiffel thread.\n", a_sig);
		exit(1);
	}
	GE_raise_with_message((is_fpe?GE_EX_FLOAT:GE_EX_SIG), GE_signal_name(a_sig));
}

/*
 * Code to be executed when the signal `a_sig' is raised.
 */
void GE_handle_signal(int a_sig)
{
	GE_handle_general_signal(a_sig, 0);
}

/*
 * Code to be executed when the floating point exception signal `a_sig' is raised.
 */
void GE_handle_fpe_signal(int a_sig)
{
	GE_handle_general_signal(a_sig, 1);
}

/* Struct for the description of signals. */
struct GE_signal_description {
	int index;				/* Index for Eiffel/C mapping */
	int number;				/* Signal number */
	char *description;		/* Description */
};

/* Descriptions of defined signals. */
static struct GE_signal_description GE_signal_descriptions[] = {
#ifdef SIGHUP
	{ 1, SIGHUP, "Hangup" },
#endif
#ifdef SIGINT
	{ 2, SIGINT, "Interrupt" },
#endif
#ifdef SIGQUIT
	{ 3, SIGQUIT, "Quit" },
#endif
#ifdef SIGILL
	{ 4, SIGILL, "Illegal instruction" },
#endif
#ifdef SIGTRAP
	{ 5, SIGTRAP, "Trace trap" },
#endif
#ifdef SIGABRT
	{ 6, SIGABRT, "Abort" },
#endif
#ifdef SIGIOT
	{ 7, SIGIOT, "IOT instruction" },
#endif
#ifdef SIGEMT
	{ 8, SIGEMT, "EMT instruction" },
#endif
#ifdef SIGFPE
	{ 9, SIGFPE, "Floating point exception" },
#endif
#ifdef SIGKILL
	{ 10, SIGKILL, "Terminator" },
#endif
#ifdef SIGBUS
	{ 11, SIGBUS, "Bus error" },
#endif
#ifdef SIGSEGV
	{ 12, SIGSEGV, "Segmentation violation" },
#endif
#ifdef SIGSYS
	{ 13, SIGSYS, "Bad argument to system call" },
#endif
#ifdef SIGPIPE
	{ 14, SIGPIPE, "Broken pipe" },
#endif
#ifdef SIGALRM
	{ 15, SIGALRM, "Alarm clock" },
#endif
#ifdef SIGTERM
	{ 16, SIGTERM, "Software termination" },
#endif
#ifdef SIGUSR1
	{ 17, SIGUSR1, "User-defined signal #1" },
#endif
#ifdef SIGUSR2
	{ 18, SIGUSR2, "User-defined signal #2" },
#endif
#ifdef SIGCHLD
	{ 19, SIGCHLD, "Death of a child" },
#endif
#ifdef SIGCLD
	{ 20, SIGCLD, "Death of a child" },
#endif
#ifdef SIGIO
	{ 21, SIGIO, "Pending I/O on a descriptor" },
#endif
#ifdef SIGPOLL
	{ 22, SIGPOLL, "Selectable event pending" },
#endif
#ifdef SIGTTIN
	{ 23, SIGTTIN, "Tty input from background" },
#endif
#ifdef SIGTTOU
	{ 24, SIGTTOU, "Tty output from background" },
#endif
#ifdef SIGSTOP
	{ 25, SIGSTOP, "Stop" },
#endif
#ifdef SIGTSTP
	{ 26, SIGTSTP, "Stop from tty" },
#endif
#ifdef SIGXCPU
	{ 27, SIGXCPU, "Cpu time limit exceeded" },
#endif
#ifdef SIGXFSZ
	{ 28, SIGXFSZ, "File size limit exceeded" },
#endif
#ifdef SIGVTALRM
	{ 29, SIGVTALRM, "Virtual time alarm" },
#endif
#ifdef SIGPWR
	{ 30, SIGPWR, "Power-fail" },
#endif
#ifdef SIGPROF
	{ 31, SIGPROF, "Profiling timer alarm" },
#endif
#ifdef SIGWINCH
	{ 32, SIGWINCH, "Window size changed" },
#endif
#ifdef SIGWIND
	{ 33, SIGWIND, "Window change" },
#endif
#ifdef SIGPHONE
	{ 34, SIGPHONE, "Line status change" },
#endif
#ifdef SIGLOST
	{ 35, SIGLOST, "Resource lost" },
#endif
#ifdef SIGURG
	{ 36, SIGURG, "Urgent condition on socket" },
#endif
#ifdef SIGCONT
	{ 37, SIGCONT, "Continue after stop" },
#endif
#ifdef SIGBREAK
	{ 38, SIGBREAK, "Ctrl-Break"},
#endif
	{ 39, 0, "Unknown signal" }
};

/* Description of signal `a_sig'. */
char *GE_signal_name(EIF_INTEGER a_sig)
{
	int i;

	for (i = 0; ; i++) {
		if ((EIF_INTEGER)GE_signal_descriptions[i].number == a_sig || GE_signal_descriptions[i].number == 0) {
			return GE_signal_descriptions[i].description;
		}
	}
}

/* Is signal `a_sig' defined? */
char GE_is_signal_defined(EIF_INTEGER a_sig)
{
	int i;

	if (a_sig < 1 || a_sig > GE_NSIG - 1) {
		return (char)0;
	}
	for (i = 0; ; i++) {
		if ((EIF_INTEGER)GE_signal_descriptions[i].number == a_sig) {
			return (char)1;
		} else if (GE_signal_descriptions[i].number == 0) {
				return (char)0;
		}
	}
}

/* C signal code for signal of index `idx'. */
EIF_INTEGER GE_signal_map(EIF_INTEGER idx)
{
	int i;

	for (i = 0; ; i++)
		if ((EIF_INTEGER)GE_signal_descriptions[i].index == idx || GE_signal_descriptions[i].number == 0)
			return (EIF_INTEGER)GE_signal_descriptions[i].number;
}

/*
 * Catch signal `a_sig'.
 * Check that the signal is defined.
 */
void GE_catch_signal(EIF_INTEGER a_sig)
{
	if (GE_is_signal_defined(a_sig) == (char)0)
		return;

	/* We may not change the status of SIGPROF because it is possible
	 * that we do (run-time) external profiling. Changing the catch
	 * status of this signal means that profiling stops.
	 */

#ifdef SIGPROF
	if (a_sig == SIGPROF)
		return;
#endif
#ifdef GE_USE_THREADS
	if (GE_ignored_signals_mutex)
		GE_mutex_lock(GE_ignored_signals_mutex);
#endif
	GE_ignored_signals[a_sig] = 0;
#ifdef SIGTTIN
	if (a_sig == SIGTTIN) {
		signal(SIGTTIN, SIG_DFL);	/* Ignore background input signal */
#ifdef GE_USE_THREADS
		if (GE_ignored_signals_mutex)
			GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
		return;
	}
#endif
#ifdef SIGTTOU
	if (a_sig == SIGTTOU) {
		signal(SIGTTOU, SIG_DFL);	/* Ignore background output signal */
#ifdef GE_USE_THREADS
		if (GE_ignored_signals_mutex)
			GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
		return;
	}
#endif
#ifdef SIGTSTP
	if (a_sig == SIGTSTP) {
		signal(SIGTSTP, SIG_DFL);	/* Restore default behaviour */
#ifdef GE_USE_THREADS
		if (GE_ignored_signals_mutex)
			GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
		return;
	}
#endif
#ifdef SIGCONT
	if (a_sig == SIGCONT) {
		signal(SIGCONT, SIG_DFL);	/* Restore default behaviour */
#ifdef GE_USE_THREADS
		if (GE_ignored_signals_mutex)
			GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
		return;
	}
#endif
#ifdef SIGTRAP
	if (a_sig == SIGTRAP) {
		signal(SIGTRAP, SIG_DFL);	/* Restore default behaviour */
#ifdef GE_USE_THREADS
		if (GE_ignored_signals_mutex)
			GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
		return;
	}
#endif
#ifdef SIGFPE
	if (a_sig == SIGFPE) {
		signal(SIGFPE, GE_handle_fpe_signal);		/* Raise an Eiffel exception when caught */
#ifdef GE_USE_THREADS
		if (GE_ignored_signals_mutex)
			GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
		return;
	}
#endif
#ifdef GE_USE_THREADS
	if (GE_ignored_signals_mutex)
		GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
}

/* 
 * Ignore signal `a_sig'.
 * Check that the signal is defined.
 */
void GE_ignore_signal(EIF_INTEGER a_sig)
{
	if (GE_is_signal_defined(a_sig) == (char)0)
		return;

	/* We may not change the status of SIGPROF because it is possible
	 * that we do (run-time) external profiling. Changing the catch
	 * status of this signal means that profiling stops.
	 */

#ifdef SIGPROF
	if (a_sig == SIGPROF)
		return;
#endif
#ifdef GE_USE_THREADS
	if (GE_ignored_signals_mutex)
		GE_mutex_lock(GE_ignored_signals_mutex);
#endif
	GE_ignored_signals[a_sig] = 1;
#ifdef SIGTTIN
	if (a_sig == SIGTTIN) {
		signal(SIGTTIN, SIG_IGN);
#ifdef GE_USE_THREADS
		if (GE_ignored_signals_mutex)
			GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
		return;
	}
#endif
#ifdef SIGTTOU
	if (a_sig == SIGTTOU) {
		signal(SIGTTOU, SIG_IGN);
#ifdef GE_USE_THREADS
		if (GE_ignored_signals_mutex)
			GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
		return;
	}
#endif
#ifdef SIGTSTP
	if (a_sig == SIGTSTP) {
		signal(SIGTSTP, SIG_IGN);
#ifdef GE_USE_THREADS
		if (GE_ignored_signals_mutex)
			GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
		return;
	}
#endif
#ifdef SIGCONT
	if (a_sig == SIGCONT) {
		signal(SIGCONT, SIG_IGN);
#ifdef GE_USE_THREADS
		if (GE_ignored_signals_mutex)
			GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
		return;
	}
#endif
#ifdef SIGTRAP
	if (a_sig == SIGTRAP) {
		signal(SIGTRAP, SIG_IGN);
#ifdef GE_USE_THREADS
		if (GE_ignored_signals_mutex)
			GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
		return;
	}
#endif
#ifdef SIGFPE
	if (a_sig == SIGFPE) {
		signal(SIGFPE, SIG_IGN);
#ifdef GE_USE_THREADS
		if (GE_ignored_signals_mutex)
			GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
		return;
	}
#endif
#ifdef GE_USE_THREADS
	if (GE_ignored_signals_mutex)
		GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
}

/*
 * Is signal of number `a_sig' caught?
 * Check that the signal is defined.
 */
char GE_is_signal_caught(EIF_INTEGER a_sig)
{
	char l_ignored;

	if (GE_is_signal_defined(a_sig) == (char)0)
		return (char)0;
#ifdef GE_USE_THREADS
	if (GE_ignored_signals_mutex)
		GE_mutex_lock(GE_ignored_signals_mutex);
#endif
	l_ignored = GE_ignored_signals[a_sig];
#ifdef GE_USE_THREADS
	if (GE_ignored_signals_mutex)
		GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
	return (char)((l_ignored == 1)? 0: 1);
}

/* Reset all the signals to their default handling. */
void GE_reset_all_signals(void)
{
	int l_sig;
#ifdef GE_USE_THREADS
	if (GE_ignored_signals_mutex)
		GE_mutex_lock(GE_ignored_signals_mutex);
#endif
	for (l_sig = 1; l_sig < GE_NSIG; l_sig++)
#ifdef SIGPROF
		if (l_sig != SIGPROF)
			GE_ignored_signals[l_sig] = GE_originally_ignored_signals[l_sig];
#else
		GE_ignored_signals[l_sig] = GE_originally_ignored_signals[l_sig];
#endif
	
#ifdef SIGTTIN
	signal(SIGTTIN, SIG_IGN);/* Ignore background input signal */
#endif
#ifdef SIGTTOU
	signal(SIGTTOU, SIG_IGN);/* Ignore background output signal */
#endif
#ifdef SIGTSTP
	signal(SIGTSTP, SIG_DFL);	/* Restore default behaviour */
#endif
#ifdef SIGCONT
	signal(SIGCONT, SIG_DFL);	/* Restore default behaviour */
#endif
#ifdef SIGTRAP
	signal(SIGTRAP, SIG_DFL);	/* Restore default behaviour */
#endif
#ifdef SIGFPE
	signal(SIGFPE, GE_handle_fpe_signal);	/* Raise an Eiffel exception when caught */
#endif
#ifdef GE_USE_THREADS
	if (GE_ignored_signals_mutex)
		GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
}

/* Reset signal `a_sig' to its default handling. */
void GE_reset_signal_to_default(EIF_INTEGER a_sig)
{

	if (GE_is_signal_defined(a_sig) == (char)0)
		return;

	/* We may not change the status of SIGPROF because it is possible
	 * that we do (run-time) external profiling. Changing the catch
	 * status of this signal means that profiling stops.
	 */

#ifdef SIGPROF
	if (a_sig == SIGPROF)
		return;
#endif

#ifdef GE_USE_THREADS
	if (GE_ignored_signals_mutex)
		GE_mutex_lock(GE_ignored_signals_mutex);
#endif
	GE_ignored_signals[a_sig] = GE_originally_ignored_signals[a_sig];
#ifdef SIGTTIN
	if (a_sig == SIGTTIN) {
		signal(SIGTTIN, SIG_IGN);	/* Ignore background input signal */
#ifdef GE_USE_THREADS
		if (GE_ignored_signals_mutex)
			GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
		return;
	}
#endif
#ifdef SIGTTOU
	if (a_sig == SIGTTOU) {
	 	signal(SIGTTOU, SIG_IGN);	/* Ignore background output signal */
#ifdef GE_USE_THREADS
		if (GE_ignored_signals_mutex)
			GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
		return;
	}
#endif
#ifdef SIGTSTP
	if (a_sig == SIGTSTP) {
		signal(SIGTSTP, SIG_DFL);	/* Restore default behaviour */
#ifdef GE_USE_THREADS
		if (GE_ignored_signals_mutex)
			GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
		return;
	}
#endif
#ifdef SIGCONT
	if (a_sig == SIGCONT) {
		signal(SIGCONT, SIG_DFL);	/* Restore default behaviour */
#ifdef GE_USE_THREADS
		if (GE_ignored_signals_mutex)
			GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
		return;
	}
#endif
#ifdef SIGTRAP
	if (a_sig == SIGTRAP) {
		signal(SIGTRAP, SIG_DFL);	/* Restore default behaviour */
#ifdef GE_USE_THREADS
		if (GE_ignored_signals_mutex)
			GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
		return;
	}
#endif
#ifdef SIGFPE
	if (a_sig == SIGFPE) {
		signal(SIGFPE, GE_handle_fpe_signal);	/* Raise an Eiffel exception when caught */
#ifdef GE_USE_THREADS
		if (GE_ignored_signals_mutex)
			GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
		return;
	}
#endif
#ifdef GE_USE_THREADS
	if (GE_ignored_signals_mutex)
		GE_mutex_unlock(GE_ignored_signals_mutex);
#endif
}

/* Number of last signal. */
EIF_INTEGER GE_signal_number()
{
	return (EIF_INTEGER)GE_current_context()->signal_number;
}

/*
 * Set signal handlers.
 * To be called at the beginning of the main thread.
 */
void GE_init_signal()
{
	int l_sig;
	void (*old)(int);	/* Old signal handler */

#ifndef GE_USE_THREADS
#if defined(GE_WINDOWS)
	GE_root_thread_id = GetCurrentThreadId();
#elif defined(GE_USE_BOEHM_GC)
	GE_root_thread_id = pthread_self();
#endif
#endif

	for (l_sig = 1; l_sig < GE_NSIG; l_sig++) {
		old = SIG_IGN;
		/* Default to be ignored before handler installation,
		 * in order to avoid immediate signal handling after 
		 * handler installation, when flags have not been 
		 * correctly set. 
		 */
		GE_ignored_signals[l_sig] = 1; 

		/* In Multi-threaded mode, we do not want to call
		* signal () on some specific signals.
		*/
		switch (l_sig) {

#ifdef GE_USE_THREADS

#if defined(GE_USE_POSIX_THREADS)
			/* So far, used in Linux threads */
			case SIGUSR1:
				break;

			case SIGUSR2:
				break;
#endif

#if defined(SIGPTRESCHED) && defined(GE_USE_POSIX_THREADS) && defined(_POSIX_C_SOURCE) && (_POSIX_C_SOURCE==199506L)
			/* So far, used in Posix 1003.1c threads */
			case SIGPTRESCHED:
				break;
#endif

#if defined(SIGPTINTR) && defined(GE_USE_POSIX_THREADS) && defined(_POSIX_C_SOURCE) && (_POSIX_C_SOURCE==199506L)
			/* So far, used in Posix 1003.1c */
			case SIGPTINTR:
				break;
#endif

#if defined(SIGRTMIN) && defined(GE_USE_POSIX_THREADS) && defined(_POSIX_C_SOURCE) && (_POSIX_C_SOURCE==199309L)
			/* So far, used in Posix 1003.1b */
			case SIGRTMIN:
				break;
#endif

#if defined(SIGRTMAX) && defined(GE_USE_POSIX_THREADS) && defined(_POSIX_C_SOURCE) && (_POSIX_C_SOURCE==199309L)
			/* So far, used in Posix 1003.1b */
			case SIGRTMAX:
				break;
#endif

#endif /* GE_USE_THREADS */

#ifdef SIGPROF
			/* When profiling, we must not catch this signal. */
			case SIGPROF:
				break;
#endif /* SIGPROF */

			default:
				if (GE_is_signal_defined(l_sig) == (char)1) {
					old = signal(l_sig, GE_handle_signal);
				}
		}			

		if (old == SIG_IGN) {
			GE_ignored_signals[l_sig] = 1;	/* Signal was ignored by default */
		} else {
			GE_ignored_signals[l_sig] = 0;	/* Signal was not ignored */
		}
	}

	/* Hardwired defaults: ignore SIGCHLD (or SIGCLD), SIGIO, SIGURG, SIGCONT
	 * and SIGWINCH if they are defined. That is to say, the Eiffel run-time
	 * will not deliver these to the process if the user does not explicitely
	 * set a handler for them.
	 */

#ifdef SIGCHLD
	GE_ignored_signals[SIGCHLD] = 1;	/* Ignore death of a child */
	signal(SIGCHLD, SIG_DFL);			/* Restore the default value */
#endif
#ifdef SIGCLD
	GE_ignored_signals[SIGCLD] = 1;		/* Ignore death of a child */
#endif
#ifdef SIGIO
	GE_ignored_signals[SIGIO] = 1;		/* Ignore pending I/O on descriptor */
#endif
#ifdef SIGCONT
	GE_ignored_signals[SIGCONT] = 1;	/* Ignore continue after a stop */
#endif
#ifdef SIGURG
	GE_ignored_signals[SIGURG] = 1;		/* Ignore urgent condition on socket */
#endif
#ifdef SIGWINCH
	GE_ignored_signals[SIGWINCH] = 1;	/* Ignore window size change */
	signal(SIGWINCH, SIG_IGN);
#endif
#ifdef SIGTTIN
	GE_ignored_signals[SIGTTIN] = 1;	/* Ignore background input signal */
	signal(SIGTTIN, SIG_IGN);
#endif
#ifdef SIGTTOU
	GE_ignored_signals[SIGTTOU] = 1;	/* Ignore background output signal */
	signal(SIGTTOU, SIG_IGN);
#endif

	/* Do not catch SIGTSTP (stop signal from tty like ^Z under csh or ksh)
	 * otherwise job control will not be allowed. However, SIGSTOP is caught.
	 * Likewise, do not catch SIGCONT (continue signal for stopped process).
	 */

#ifdef SIGTSTP
	GE_ignored_signals[SIGTSTP] = 0;	/* Do not ignore that signal */
	signal(SIGTSTP, SIG_DFL);			/* Restore default behaviour */
#endif
#ifdef SIGCONT
	GE_ignored_signals[SIGCONT] = 0;	/* Do not ignore continue signal */
	signal(SIGCONT, SIG_DFL);			/* Restore default behaviour */
#endif

	/* It would not be wise to catch SIGTRAP: C debuggers may use this signal
	 * to do step-by-step execution and we do not want the Eiffel run-time
	 * to interfere with this particular low-level signal--RAM.
	 */

#ifdef SIGTRAP
	GE_ignored_signals[SIGTRAP] = 0;	/* Do not ignore Trap signal */
	signal(SIGTRAP, SIG_DFL);			/* Restore default behaviour */
#endif

	/* Special treatment for SIGFPE -- always raise an Eiffel exception when
	 * it is caught (unless exception is explicitely ignored, but that's the
	 * handler's problem).
	 */

#ifdef SIGFPE
	GE_ignored_signals[SIGFPE] = 0;			/* Do not ignore a floating point signal */
	signal(SIGFPE, GE_handle_fpe_signal);	/* Raise an Eiffel exception when caught */
#endif

	/* Now save all the defaults in the special original status array, in order
	 * for the run-time to know what to do when a signal is restored to its
	 * "default" state.
	 */

	for (l_sig = 1; l_sig < GE_NSIG; l_sig++) {
		GE_originally_ignored_signals[l_sig] = GE_ignored_signals[l_sig];
	}
}

#ifdef __cplusplus
}
#endif

#endif
