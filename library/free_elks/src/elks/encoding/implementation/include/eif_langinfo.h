/* eif_langinfo.h */
/* Use libcharset if on OpenBSD */

#if EIF_OS == EIF_OS_OPENBSD
#include <libcharset.h>
#endif

#ifndef EIF_WINDOWS_MINGW
#include <langinfo.h>

#else
#include <libcharset.h>

// Definitions to allow compilation with mingw.

#define nl_langinfo(x) locale_charset()

// Definitions for missing langinfo.h on mingw

# define CODESET     10000
# define RADIXCHAR   10001
# define THOUSEP     10002
# define D_T_FMT     10003
# define D_FMT       10004
# define T_FMT       10005
# define T_FMT_AMPM  10006
# define AM_STR      10007
# define PM_STR      10008
# define DAY_1       10009
# define DAY_2       (DAY_1 + 1)
# define DAY_3       (DAY_1 + 2)
# define DAY_4       (DAY_1 + 3)
# define DAY_5       (DAY_1 + 4)
# define DAY_6       (DAY_1 + 5)
# define DAY_7       (DAY_1 + 6)
# define ABDAY_1     10016
# define ABDAY_2     (ABDAY_1 + 1)
# define ABDAY_3     (ABDAY_1 + 2)
# define ABDAY_4     (ABDAY_1 + 3)
# define ABDAY_5     (ABDAY_1 + 4)
# define ABDAY_6     (ABDAY_1 + 5)
# define ABDAY_7     (ABDAY_1 + 6)
# define MON_1       10023
# define MON_2       (MON_1 + 1)
# define MON_3       (MON_1 + 2)
# define MON_4       (MON_1 + 3)
# define MON_5       (MON_1 + 4)
# define MON_6       (MON_1 + 5)
# define MON_7       (MON_1 + 6)
# define MON_8       (MON_1 + 7)
# define MON_9       (MON_1 + 8)
# define MON_10      (MON_1 + 9)
# define MON_11      (MON_1 + 10)
# define MON_12      (MON_1 + 11)
# define ABMON_1     10035
# define ABMON_2     (ABMON_1 + 1)
# define ABMON_3     (ABMON_1 + 2)
# define ABMON_4     (ABMON_1 + 3)
# define ABMON_5     (ABMON_1 + 4)
# define ABMON_6     (ABMON_1 + 5)
# define ABMON_7     (ABMON_1 + 6)
# define ABMON_8     (ABMON_1 + 7)
# define ABMON_9     (ABMON_1 + 8)
# define ABMON_10    (ABMON_1 + 9)
# define ABMON_11    (ABMON_1 + 10)
# define ABMON_12    (ABMON_1 + 11)
# define ERA         10047
# define ERA_D_FMT   10048
# define ERA_D_T_FMT 10049
# define ERA_T_FMT   10050
# define ALT_DIGITS  10051
# define CRNCYSTR    10052
# define YESEXPR     10053
# define NOEXPR      10054

#endif
