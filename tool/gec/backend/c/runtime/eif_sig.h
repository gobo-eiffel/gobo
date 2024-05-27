/*
	description:

		"C functions used to implement class UNIX_SIGNALS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef EIF_SIG_H
#define EIF_SIG_H
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_SIGNAL_H
#include "ge_signal.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

#define esigdefined(sig) GE_is_signal_defined((EIF_INTEGER)(sig))
#define esignum() GE_signal_number()
#define esigcatch(sig) GE_catch_signal((EIF_INTEGER)(sig))
#define esigignore(sig) GE_ignore_signal((EIF_INTEGER)(sig))
#define esigresall() GE_reset_all_signals()
#define esigresdef(sig) GE_reset_signal_to_default((EIF_INTEGER)(sig))
#define esigiscaught(sig) GE_is_signal_caught((EIF_INTEGER)(sig))
#define esigmap(idx) GE_signal_map((EIF_INTEGER)(idx))
#define esigname(sig) GE_signal_name((EIF_INTEGER)(sig))

#ifdef __cplusplus
}
#endif

#endif
