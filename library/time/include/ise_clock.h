#ifndef __GOBO_ISE_CLOCK__
#define __GOBO_ISE_CLOCK__

#include <sys/types.h>
#include <stdio.h>
#include <eif_eiffel.h>
#include <time.h>

void gobo_get_date (EIF_INTEGER *y, EIF_INTEGER *m, EIF_INTEGER *d)
{
	struct tm *date_time;

	time_t t = time (NULL);
	date_time = localtime (&t);
	*y = (EIF_INTEGER)(1900 + date_time->tm_year);
	*m = (EIF_INTEGER)(date_time->tm_mon) + 1;
	*d = (EIF_INTEGER)(date_time->tm_mday);
}

void gobo_get_time (EIF_INTEGER *h, EIF_INTEGER *mi, EIF_INTEGER *s)
{
	struct tm *date_time;

	time_t t = time (NULL);
	date_time = localtime (&t);
	*h = (EIF_INTEGER)(date_time->tm_hour);
	*mi = (EIF_INTEGER)(date_time->tm_min);
	*s = (EIF_INTEGER)(date_time->tm_sec);
}

void gobo_get_date_time (EIF_INTEGER *y, EIF_INTEGER *m, EIF_INTEGER *d,
	EIF_INTEGER *h, EIF_INTEGER *mi, EIF_INTEGER *s)
{
	struct tm *date_time;

	time_t t = time (NULL);
	date_time = localtime (&t);
	*y = (EIF_INTEGER)(1900 + date_time->tm_year);
	*m = (EIF_INTEGER)(date_time->tm_mon) + 1;
	*d = (EIF_INTEGER)(date_time->tm_mday);
	*h = (EIF_INTEGER)(date_time->tm_hour);
	*mi = (EIF_INTEGER)(date_time->tm_min);
	*s = (EIF_INTEGER)(date_time->tm_sec);
}

#endif /* __GOBO_ISE_CLOCK__ */
