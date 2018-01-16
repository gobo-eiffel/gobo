/*
	description:

		"C functions used to implement class CONSOLE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_CONSOLE_C
#define GE_CONSOLE_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_CONSOLE_H
#include "ge_console.h"
#endif
#ifndef GE_EIFFEL_H
#include "ge_eiffel.h"
#endif
#ifndef GE_EXCEPTION_H
#include "ge_exception.h"
#endif
#ifdef GE_USE_THREADS
#ifndef GE_THREAD_H
#include "ge_thread.h"
#endif
#endif

#ifdef EIF_WINDOWS
#include <stdio.h>
#include <windows.h>
#include <io.h>
#include <fcntl.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS

static EIF_BOOLEAN GE_console_allocated = EIF_FALSE;
#ifdef GE_USE_THREADS
static EIF_POINTER GE_console_mutex = 0;
#endif

/*
 * Initialize mutex to determine whether a new
 * console needs to be created.
 */
void GE_init_console(void)
{
#ifdef GE_USE_THREADS
	GE_console_mutex = GE_mutex_create();
#endif
}

/*
 * Create a new DOS console if needed (i.e. in case of a Windows application).
 */
void GE_show_console(void)
{
#ifdef GE_USE_THREADS
	if (GE_console_mutex) {
		GE_mutex_lock(GE_console_mutex);
#endif
	if (!GE_console_allocated) {
		HANDLE hconin, hconout, hconerr;
		CONSOLE_SCREEN_BUFFER_INFO csbi;
		BOOL bLaunched;
		BOOL bSuccess;
		int hCrt;
#ifdef __LCC__
extern FILE * __cdecl _fdopen(int, const char *);
extern int _open_osfhandle(long, int);
#elif !defined EIF_BORLAND
		FILE *hf;
#endif

		bSuccess = AllocConsole();
			/* Get all Std handles and raise an IO exception if we fail getting one. */
		hconout = GetStdHandle(STD_OUTPUT_HANDLE);
		if (hconout == INVALID_HANDLE_VALUE) {
#ifdef GE_USE_THREADS
			GE_mutex_unlock(GE_console_mutex);
#endif
			GE_raise(GE_EX_PROG);
		}
		hconerr = GetStdHandle(STD_ERROR_HANDLE);
		if (hconerr == INVALID_HANDLE_VALUE) {
#ifdef GE_USE_THREADS
			GE_mutex_unlock(GE_console_mutex);
#endif
			GE_raise(GE_EX_PROG);
		}
		hconin = GetStdHandle(STD_INPUT_HANDLE);
		if (hconin == INVALID_HANDLE_VALUE) {
#ifdef GE_USE_THREADS
			GE_mutex_unlock(GE_console_mutex);
#endif
			GE_raise(GE_EX_PROG);
		}
		if (bSuccess) {
				/*
					Console was manually created, we are most likely in
					a Windows application that tries to output something.
					Therefore we need to correctly associated all standard
					handles `stdin', `stdout' and `stderr' to the new created console.
					Code was taken from http://codeguru.earthweb.com/console/Console.html
					But also checkout Microsoft support web site:
					http://support.microsoft.com/default.aspx?scid=kb;EN-US;q105305
					Note: For Borland, the above trick does not work, one has to
					duplicate the handle, unfortunately the solution does not work
					with Microsoft which explains the ifdef statement.
				*/
			hCrt = _open_osfhandle((intptr_t)hconout, _O_TEXT);
#if defined(__LCC__) || defined(EIF_BORLAND)
			dup2(hCrt, _fileno(stdout));
#else
			hf = _fdopen (hCrt, "w");
			*stdout = *hf;
#endif
			setvbuf(stdout, NULL, _IONBF, 0);
			hCrt = _open_osfhandle((intptr_t)hconerr, _O_TEXT);
#if defined(__LCC__) || defined(EIF_BORLAND)
			dup2(hCrt, _fileno(stderr));
#else
			hf = _fdopen(hCrt, "w");
			*stderr = *hf;
#endif
			setvbuf(stderr, NULL, _IONBF, 0);
			hCrt = _open_osfhandle((intptr_t)hconin, _O_TEXT | _O_RDONLY);
#if defined(__LCC__) || defined(EIF_BORLAND)
			dup2(hCrt, _fileno(stdin));
#else
			hf = _fdopen(hCrt, "r");
			*stdin = *hf;
#endif
		}
			/*
				We are computing the cursor position to figure out, if the application
				has been launched from a DOS console or from the Windows Shell.
			*/
		GetConsoleScreenBufferInfo(hconout, &csbi);
		bLaunched = ((csbi.dwCursorPosition.X == 0) && (csbi.dwCursorPosition.Y == 0));
		if ((csbi.dwSize.X <= 0) || (csbi.dwSize.Y <= 0))
			bLaunched = FALSE;
/*
		if (bLaunched == TRUE)
			eif_register_cleanup (eif_console_cleanup);
*/

		GE_console_allocated = EIF_TRUE;
	}
#ifdef GE_USE_THREADS
		GE_mutex_unlock(GE_console_mutex);
	}
#endif
}

#endif

#ifdef __cplusplus
}
#endif

#endif
