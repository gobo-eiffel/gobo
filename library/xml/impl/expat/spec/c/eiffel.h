#ifdef ise
#ifndef eif_h
#define eif_h
#include <eif_portable.h>
#include <eif_hector.h>
#include <eif_macros.h>
#endif
#endif

#ifdef se
#include "sys/runtime/base.h"
#define TRUE 1
#endif

#ifdef ve
#include "cecil.h"
#define TRUE 1
#endif

