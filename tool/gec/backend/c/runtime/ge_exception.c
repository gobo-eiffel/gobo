/*
	description:

		"C functions used to implement class EXCEPTION"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2024, Eric Bezault and others"
	license: "MIT License"
*/

#ifndef GE_EXCEPTION_C
#define GE_EXCEPTION_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EXCEPTION_H
#include "ge_exception.h"
#endif
#ifndef GE_GC_H
#include "ge_gc.h"
#endif
#ifndef GE_STRING_H
#include "ge_string.h"
#endif
#ifndef GE_CONSOLE_H
#include "ge_console.h"
#endif
#ifndef GE_MAIN_H
#include "ge_main.h"
#endif
#ifdef GE_USE_THREADS
#ifndef GE_THREAD_H
#include "ge_thread.h"
#endif
#endif

#ifdef EIF_WINDOWS
#ifdef __LCC__
#include <windows.h>
#else
#include <winbase.h>
#endif
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Pre-defined exception tags. No restriction on size.
 */
static char* GE_exception_tags[] = {
	(char*) 0,							/* Nothing */
	"Feature call on void target.",		/* GE_EX_VOID */
	"No more memory.",					/* GE_EX_MEM */
	"Precondition violated.",			/* GE_EX_PRE */
	"Postcondition violated.",			/* GE_EX_POST */
	"Floating point exception.",		/* GE_EX_FLOAT */
	"Class invariant violated.",		/* GE_EX_CINV */
	"Assertion violated.",				/* GE_EX_CHECK */
	"Routine failure.",					/* GE_EX_FAIL */
	"Unmatched inspect value.",			/* GE_EX_WHEN */
	"Non-decreasing loop variant or negative value reached.",		/* GE_EX_VAR */
	"Loop invariant violated.",			/* GE_EX_LINV */
	"Operating system signal.",			/* GE_EX_SIG */
	"Eiffel run-time panic.",			/* GE_EX_BYE */
	"Exception in rescue clause.",		/* GE_EX_RESC */
	"Out of memory.",					/* GE_EX_OMEM */
	"Resumption attempt failed.",		/* GE_EX_RES */
	"Create on deferred.",				/* GE_EX_CDEF */
	"External event.",					/* GE_EX_EXT */
	"Void assigned to expanded.",		/* GE_EX_VEXP */
	"Exception in signal handler.",		/* GE_EX_HDLR */
	"I/O error.",						/* GE_EX_IO */
	"Operating system error.",			/* GE_EX_SYS */
	"Retrieval error.",					/* GE_EX_RETR */
	"Developer exception.",				/* GE_EX_PROG */
	"Eiffel run-time fatal error.",		/* GE_EX_FATAL */
	"CECIL cannot call melted code",	/* GE_EX_DOL */
	"Runtime I/O error.",				/* GE_EX_ISE_IO */
	"COM error.",						/* GE_EX_COM */
	"Runtime check violated.",			/* GE_EX_RT_CHECK */
	"Old expression evaluation failed.",/* GE_EX_OLD */
	"Serialization failed.",			/* GE_EX_SEL */
	"SCOOP processor dirty."			/* GE_EX_DIRTY */
};

/*
 * Exception tag associated with `a_code'.
 */
char* GE_exception_tag(long a_code)
{
	if (a_code < 0) {
		return "User-defined exception.";
	} else if (a_code < 1 || a_code > GE_EX_NEX) {
		return "Unknown exception.";
	} else {
		return GE_exception_tags[a_code];
	}
}

/*
 * Initialize `a_trace'.
 */
static void GE_init_exception_trace_buffer(GE_exception_trace_buffer* a_trace)
{
	a_trace->count = 0;
	a_trace->capacity = 0;
	a_trace->area = (char*)GE_malloc_atomic_uncollectable(4096);
	a_trace->area[0] = '\0';
	a_trace->capacity = 4096;
}

/*
 * Free memory allocated in `a_trace'.
 */
static void GE_free_exception_trace_buffer(GE_exception_trace_buffer* a_trace)
{
	a_trace->count = 0;
	a_trace->capacity = 0;
	if (a_trace->area) {
		GE_free(a_trace->area);
	}
}

/*
 * Append `a_string' to `a_trace'.
 * Resize area if needed.
 */
void GE_append_to_exception_trace_buffer(GE_exception_trace_buffer* a_trace, char* a_string)
{
	int l_length = strlen(a_string);
	uint32_t l_new_capacity;
	char* l_new_area;

	if (a_trace->area) {
		if ((a_trace->capacity - a_trace->count) <= l_length) {
			l_new_capacity = a_trace->capacity + l_length + 512;
			l_new_area = (char*)GE_realloc(a_trace->area, l_new_capacity);
			if (l_new_area) {
				a_trace->area = l_new_area;
				a_trace->capacity = l_new_capacity;
			}
		}
		if ((a_trace->capacity - a_trace->count) > l_length) {
			strcpy(a_trace->area + a_trace->count, a_string);
			a_trace->count += l_length;
		}
	} else {
		GE_init_exception_trace_buffer(a_trace);
		GE_append_to_exception_trace_buffer(a_trace, a_string);
	}
}

/*
 * Wipe out `a_trace'.
 */
void GE_wipe_out_exception_trace_buffer(GE_exception_trace_buffer* a_trace)
{
	if (a_trace->count > 0) {
		a_trace->count = 0;
		a_trace->area[0] = '\0';
	}
}

/*
 * Print first line of exception which contains `a_class_name', `a_feature_name'
 * and `a_tag_name' to `a_trace'.
 */
static void GE_print_class_feature_tag(GE_exception_trace_buffer* a_trace, const char* a_class_name, const char* a_feature_name, const char* a_tag_name)
{
	char buffer[256];
	int l_class_count, l_feature_count, l_tag_count;

		/* We are trying to provide the best format possible so that we can see all the useful
		 * information about the location and the reason of the crash.
		 * Note that the C format `%width[.precision]s' means that we will display `width'
		 * characters on the screen and only `precision' characters from `s' will be displayed,
		 * meaning that if `precision' is smaller than `width' the text is right aligned.
		 *
		 * Note: because `buffer' has a fixed size of 256, we need to use `precision' to avoid
		 * writting more than `buffer' can hold. And for `sprintf', a null character is appended
		 * after the last character written, which should be taken into account.
		 */
	l_class_count = (int)strlen(a_class_name);
	l_feature_count = (int)strlen(a_feature_name);
	l_tag_count = (int)strlen(a_tag_name);

		/* 1 - precision of 211 = 254 - 43, 43 being number of characters written
		 *      for `a_class_name' and `a_feature_name'. */
		/* 2 - precision of 234 = 254 - 20, 20 being number of characters written
		 *      for `a_class_name'.*/
		/* 3 - precision of 254, 254 being number of characters written
		 *      excluding `\n' and null character appended at the end */
		/* 4 - precision of 251, 231 and 208 being number of characters written
		 *      excluding eclipse from above numbers. */
	if (l_class_count > 19) {
		if (l_class_count > 251) {
			sprintf(buffer, "%.251s...\n", a_class_name);
		} else {
			sprintf(buffer, "%*.254s\n", l_class_count, a_class_name);
		}
		GE_append_to_exception_trace_buffer(a_trace, buffer);
		if (l_feature_count > 22) {
			if (l_feature_count > 231) {
				sprintf(buffer, "%.231s...\n", a_feature_name);
			} else {
				sprintf(buffer, "%*.234s\n", 20 + l_feature_count, a_feature_name);
			}
			GE_append_to_exception_trace_buffer(a_trace, buffer);
			if (l_tag_count > 0) {
				if (l_tag_count > 208) {
					sprintf(buffer, "%.208s...\n", a_tag_name);
				} else {
					sprintf(buffer, "%*.211s\n", 43 + l_tag_count, a_tag_name);
				}
				GE_append_to_exception_trace_buffer(a_trace, buffer);
			}
		} else {
			if (l_tag_count > 208) {
				sprintf(buffer, "%*.22s %.208s...\n", 20 + l_feature_count, a_feature_name, a_tag_name);
			} else {
				sprintf(buffer, "%*.22s %*.211s\n", 20 + l_feature_count, a_feature_name, (43 + l_tag_count) - (20 + l_feature_count + 1), a_tag_name);
			}
			GE_append_to_exception_trace_buffer(a_trace, buffer);
		}
	} else {
		if (l_feature_count > 22) {
			if (l_feature_count > 208) {
				sprintf(buffer, "%-19.19s %.208s...\n", a_class_name, a_feature_name);
			} else {
				sprintf(buffer, "%-19.19s %*.211s\n", a_class_name, l_feature_count, a_feature_name);
			}
			GE_append_to_exception_trace_buffer(a_trace, buffer);
			if (l_tag_count > 0) {
				if (l_tag_count > 208) {
					sprintf(buffer, "%.208s...\n", a_tag_name);
				} else {
					sprintf(buffer, "%*.211s\n", 43 + l_tag_count, a_tag_name);
				}
				GE_append_to_exception_trace_buffer(a_trace, buffer);
			}
		} else {
			if (l_tag_count > 208) {
				sprintf(buffer, "%-19.19s %-22.22s %-29.208s...\n", a_class_name, a_feature_name, a_tag_name);
			} else {
				sprintf(buffer, "%-19.19s %-22.22s %-29.211s\n", a_class_name, a_feature_name, a_tag_name);
			}
			GE_append_to_exception_trace_buffer(a_trace, buffer);
		}
	}
}

/*
 * Print second line of exception which contains `a_object_addr', `a_location',
 * `a_reason' and `a_effect' to `a_trace'.
 */
static void GE_print_object_location_reason_effect(GE_exception_trace_buffer* a_trace, void* a_object_addr, char* a_location, char* a_reason, char* a_effect)
{
	char buffer[256];
	int l_location_count, l_reason_count, l_effect_count;

		/* We are trying to provide the best format possible so that we can see all the useful
		 * information about the location and the reason of the crash.
		 * Note that the C format `%width[.precision]s' means that we will display `width'
		 * characters on the screen and only `precision' characters from `s' will be displayed,
		 * meaning that if `precision' is smaller than `width' the text is right aligned.
		 *
		 * Note: because `buffer' has a fixed size of 256, we need to use `precision' to avoid
		 * writting more than `buffer' can hold.
		 */

	l_location_count = (int)strlen(a_location);
	l_reason_count = (int)strlen(a_reason);
	l_effect_count = (int)strlen(a_effect);

		/* 1 - precision of 211 = 254 - 43, 43 being number of characters written
		 *     for `a_object_addr' and `a_location'.
		 * 2 - precision of 181 = 254 - 73, 73 being number of characters written
		 *     for `a_object_addr', `a_location' and `a_reason'.
		 * 3 - 22, number of characters written for `a_location'
		 * 4 - 29, number of characters written for `a_reason' */

		/* Check this for formatting using `printf':
		 * http://en.wikipedia.org/wiki/Printf#printf_format_placeholders */

		/* Print object address with 16 digits to be ready when pointers
		 * will be on 64 bits on all platform. */
	sprintf(buffer, "<%016" EIF_POINTER_DISPLAY ">  ", (unsigned long)(uintptr_t)a_object_addr);
	GE_append_to_exception_trace_buffer(a_trace, buffer);

	if (l_location_count > 22) {
		sprintf(buffer, "%*.254s\n", l_location_count, a_location);
		GE_append_to_exception_trace_buffer(a_trace, buffer);
		if (l_reason_count > 29) {
			sprintf(buffer, "%*.211s\n", 43 + l_reason_count, a_reason);
			GE_append_to_exception_trace_buffer(a_trace, buffer);
			sprintf(buffer, "%*.181s\n", 73 + l_effect_count, a_effect);
			GE_append_to_exception_trace_buffer(a_trace, buffer);
		} else {
			sprintf(buffer, "%*.29s %*.181s\n", 43 + l_reason_count, a_reason, (73 + l_effect_count) - (43 + l_reason_count + 1), a_effect);
			GE_append_to_exception_trace_buffer(a_trace, buffer);
		}
	} else {
		if (l_reason_count > 29) {
			sprintf(buffer,"%-22.22s %*.211s\n", a_location, l_reason_count, a_reason);
			GE_append_to_exception_trace_buffer(a_trace, buffer);
			sprintf(buffer, "%*.181s\n", 73 + l_effect_count, a_effect);
			GE_append_to_exception_trace_buffer(a_trace, buffer);
		} else {
			sprintf(buffer,"%-22.22s %-29.29s %*.181s\n", a_location, a_reason, l_effect_count, a_effect);
			GE_append_to_exception_trace_buffer(a_trace, buffer);
		}
	}
}

/*
 * Print to `a_trace' the exception trace corresponding to `a_context'.
 */
static void GE_print_exception_trace(GE_context* a_context, long a_code, const char* a_tag, GE_exception_trace_buffer* a_trace)
{
	char buffer[1024];
	GE_call* l_call;
	char* l_tag;
	char l_tag_buf[256];
	void* l_object = NULL;
	char* l_location = "";
	char* l_reason;
	char* l_effect;
	char* l_root_class;
	char* l_root_feature = "root's creation";
	const char* l_class_name;
	const char* l_feature_name;
	unsigned long l_thread_id = 0;
	char* l_thread_name = "";
	unsigned long l_region_id = 0;

#ifdef GE_USE_THREADS
	if (a_context == GE_main_context) {
			/* Main thread. */
		l_thread_name = "Root thread";
	} else {
		l_thread_id = (unsigned long)(uint64_t)a_context->thread->thread_id;
		l_thread_name = "Child thread";
	}
#endif	
#ifdef GE_USE_SCOOP
	l_region_id = (unsigned long)(uint64_t)a_context->region;
	sprintf(buffer, "%s\n", "******************************** SCOOP exception ******************************");
	GE_append_to_exception_trace_buffer(a_trace, buffer);
	sprintf(buffer,"%-10.10s 0x%016" EIF_POINTER_DISPLAY " %-12.12s 0x%" EIF_POINTER_DISPLAY " %s\n", "In region", l_region_id, "(region id)", l_thread_id, "(thread id)");
	GE_append_to_exception_trace_buffer(a_trace, buffer);
	sprintf(buffer, "%s\n", "*******************************************************************************");
	GE_append_to_exception_trace_buffer(a_trace, buffer);
#elif defined(GE_USE_THREADS)
	sprintf(buffer, "%s\n", "******************************** Thread exception *****************************");
	GE_append_to_exception_trace_buffer(a_trace, buffer);
	sprintf(buffer,"%-19.19s %-22.22s 0x%" EIF_POINTER_DISPLAY " %s\n", "In thread", l_thread_name, l_thread_id, "(thread id)");
	GE_append_to_exception_trace_buffer(a_trace, buffer);
	sprintf(buffer, "%s\n", "*******************************************************************************");
	GE_append_to_exception_trace_buffer(a_trace, buffer);
#endif
	sprintf(buffer, "%s\n", "-------------------------------------------------------------------------------");
	GE_append_to_exception_trace_buffer(a_trace, buffer);
	sprintf(buffer, "%-19.19s %-22.22s %-29.29s %-6.6s\n", "Class / Object", "Routine", "Nature of exception", "Effect");
	GE_append_to_exception_trace_buffer(a_trace, buffer);
	sprintf(buffer, "%s\n", "-------------------------------------------------------------------------------");
	GE_append_to_exception_trace_buffer(a_trace, buffer);
	if (GE_root_class_name) {
		l_root_class = GE_root_class_name;
	} else {
		l_root_class = "ROOT CLASS";
	}
	l_call = a_context->call;
	if (l_call && l_call->caller) {
		l_class_name = l_call->class_name;
		l_feature_name = l_call->feature_name;
#ifdef GE_USE_CURRENT_IN_EXCEPTION_TRACE
		l_object = l_call->object;
#endif
	} else {
		l_class_name = l_root_class;
		l_feature_name = l_root_feature;
	}
	if (a_tag) {
		sprintf(l_tag_buf, "%.254s:", a_tag);
		l_tag = l_tag_buf;
	} else {
		l_tag = "";
	}
	GE_print_class_feature_tag(a_trace, l_class_name, l_feature_name, l_tag);
	l_reason = GE_exception_tag(a_code);
	l_effect = "Fail";
	GE_print_object_location_reason_effect(a_trace, l_object, l_location, l_reason, l_effect);
	sprintf(buffer, "%s\n", "-------------------------------------------------------------------------------");
	GE_append_to_exception_trace_buffer(a_trace, buffer);
	while (l_call) {
		l_tag = "";
		GE_print_class_feature_tag(a_trace, l_call->class_name, l_call->feature_name, l_tag);
#ifdef GE_USE_CURRENT_IN_EXCEPTION_TRACE
		l_object = l_call->object;
#endif
		l_reason = "Routine failure.";
		if (l_call->caller) {
			l_effect = "Fail";
		} else {
			l_effect = "Exit";
			if (strcmp(l_call->feature_name, "separate call") == 0) {
				l_reason = "Dirty region.";
			}
		}
		GE_print_object_location_reason_effect(a_trace, l_object, l_location, l_reason, l_effect);
		sprintf(buffer, "%s\n", "-------------------------------------------------------------------------------");
		GE_append_to_exception_trace_buffer(a_trace, buffer);
		l_call = l_call->caller;
	}
}

/*
 * New execution context.
 */
GE_context* GE_new_context(int is_scoop_processor)
{
	GE_context* l_context;

#ifdef GE_USE_SCOOP
	if (is_scoop_processor) {
		/* Use `GE_calloc_atomic' because we want `l_context->region' to be
		 * collected if it is the only reference left. Other data are kept 
		 * alive thanks to a reference from the SCOOP region. */
		l_context = (GE_context*)GE_calloc_atomic(1, sizeof(GE_context));
	} else
#endif
	{
		/* Use `GE_calloc' because we want all data reachable from `l_context'
		 * to be kept alive while `l_context' is alive. */
		l_context = (GE_context*)GE_calloc(1, sizeof(GE_context));
	}
	l_context->exception_trace_enabled = '\1';
	l_context->pre_ecma_mapping_status = 1;
	return l_context;
}

/*
 * Execution context of main thread.
 * Should be used from the main thread only.
 */
GE_context* GE_main_context = 0;

/*
 * Execution context of current thread.
 */
GE_context* GE_current_context(void)
{
#ifdef GE_USE_THREADS
	return GE_thread_current_context();
#else
	return GE_main_context;
#endif
}

/*
 * Initialization of exception handling.
 */
void GE_init_exception(GE_context* a_context)
{
	EIF_REFERENCE l_exception_manager;

	GE_init_exception_trace_buffer(&a_context->exception_trace_buffer);
	GE_init_exception_trace_buffer(&a_context->last_exception_trace);
#ifdef GE_USE_SCOOP
	if (!a_context->thread->is_scoop_processor) {
#endif
		l_exception_manager = GE_new_exception_manager(a_context, EIF_TRUE);
		a_context->exception_manager = l_exception_manager;
		GE_init_exception_manager(a_context);
#ifdef GE_USE_SCOOP
	}
#endif
}

/*
 * Free memory allocated in `a_context' for exception handling.
 */
void GE_free_exception(GE_context* a_context)
{
	GE_free_exception_trace_buffer(&(a_context->exception_trace_buffer));
	GE_free_exception_trace_buffer(&(a_context->last_exception_trace));
	a_context->exception_manager = EIF_VOID;
}

/*
 * Pointer to function to create a new exception manager object
 * (of type ISE_EXCEPTION_MANAGER).
 */
EIF_REFERENCE (*GE_new_exception_manager)(GE_context*, EIF_BOOLEAN);

/*
 * Pointer to Eiffel routine ISE_EXCEPTION_MANAGER.init_exception_manager.
 */
void (*GE_init_exception_manager)(GE_context*);

/*
 * Pointer to Eiffel routine ISE_EXCEPTION_MANAGER.last_exception.
 */
EIF_REFERENCE (*GE_last_exception)(GE_context*);

/*
 * Pointer to Eiffel routine ISE_EXCEPTION_MANAGER.once_raise.
 */
void (*GE_once_raise)(GE_context*, EIF_REFERENCE);

/*
 * Pointer to Eiffel routine ISE_EXCEPTION_MANAGER.set_exception_data.
 */
void (*GE_set_exception_data)(GE_context*, EIF_INTEGER_32, EIF_BOOLEAN, EIF_INTEGER_32, EIF_INTEGER_32, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_INTEGER_32, EIF_BOOLEAN);

/*
 * Jump to execute the rescue of the last routine with a rescue
 * in the call stack.
 */
void GE_jump_to_last_rescue(GE_context* a_context)
{
	char* l_exception_trace;

	GE_rescue* r = a_context->last_rescue;
	if (r != 0) {
		a_context->last_rescue = r->previous;
		a_context->raising_exception = '\0';
		GE_longjmp(r->jb, 1);
	}
	if (a_context->exception_trace_enabled) {
		GE_show_console();
		if (GE_system_name) {
			fprintf(stderr, "\n%s: system execution failed.\n", GE_system_name);
		} else {
			fprintf(stderr, "\nsystem execution failed.\n");
		}
		l_exception_trace = a_context->last_exception_trace.area;
		if (l_exception_trace) {
			fprintf(stderr, "Following is the set of recorded exceptions:\n\n");
			fprintf(stderr, "%s", l_exception_trace);
		} else {
			fprintf(stderr, "No exception trace found.\n");
		}
	}
	exit(1);
}

/*
 * Call feature EXCEPTION_MANAGER.set_exception_data.
 */
static void GE_call_set_exception_data(GE_context* a_context, long code, int new_obj, int signal_code, int error_code, const char* tag, char* recipient, char* eclass, char* rf_routine, char* rf_class, char* trace, int line_number, int is_invariant_entry)
{
	EIF_REFERENCE l_tag;
	EIF_REFERENCE l_recipient;
	EIF_REFERENCE l_eclass;
	EIF_REFERENCE l_rf_routine;
	EIF_REFERENCE l_rf_class;
	EIF_REFERENCE l_trace;

	if (!a_context->exception_manager) {
		fprintf(stderr, "\nsystem execution failed while handling an exception before the initialing the exception manager.\n");
		exit(1);
	}
	if (tag) {
		l_tag = GE_str(tag);
	} else {
		l_tag = GE_ms("", 0);
	}
	if (recipient) {
		l_recipient = GE_str(recipient);
	} else {
		l_recipient = GE_ms("", 0);
	}
	if (eclass) {
		l_eclass = GE_str(eclass);
	} else {
		l_eclass = GE_ms("", 0);
	}
	if (rf_routine) {
		l_rf_routine = GE_str(rf_routine);
	} else {
		l_rf_routine = GE_ms("", 0);
	}
	if (rf_class) {
		l_rf_class = GE_str(rf_class);
	} else {
		l_rf_class = GE_ms("", 0);
	}
	if (trace && a_context->exception_trace_enabled) {
		l_trace = GE_str(trace);
	} else {
		l_trace = GE_ms("", 0);
	}
	GE_set_exception_data(a_context, (EIF_INTEGER_32) code, EIF_TEST(new_obj), (EIF_INTEGER_32) signal_code, (EIF_INTEGER_32) error_code, l_tag, l_recipient, l_eclass, l_rf_routine, l_rf_class, l_trace, (EIF_INTEGER_32) line_number, EIF_TEST(is_invariant_entry));
}

/*
 * Raise an exception.
 */
static void GE_raise_exception(long code, int new_obj, int signal_code, int error_code, const char* tag, char* recipient, char* eclass, char* rf_routine, char* rf_class, char* trace, int line_number, int is_invariant_entry)
{
	char* l_trace;
	GE_exception_trace_buffer* l_trace_buffer;
	GE_context* l_context;
	const char* l_tag;

	l_context = GE_current_context();
	if (!l_context) {
		GE_show_console();
		if (GE_system_name) {
			fprintf(stderr, "\n%s: system execution failed.\n", GE_system_name);
		} else {
			fprintf(stderr, "\nsystem execution failed.\n");
		}
		if (tag) {
			l_tag = tag;
		} else {
			l_tag = "";
		}
		fprintf(stderr, "%s: %s\n", GE_exception_tag(code), l_tag);
		fprintf(stderr, "Panic: No execution context found.\n");
		exit(1);
	} else if (l_context->raising_exception) {
		GE_show_console();
		if (GE_system_name) {
			fprintf(stderr, "\n%s: system execution failed.\n", GE_system_name);
		} else {
			fprintf(stderr, "\nsystem execution failed.\n");
		}
		if (tag) {
			l_tag = tag;
		} else {
			l_tag = "";
		}
		fprintf(stderr, "%s: %s\n", GE_exception_tag(code), l_tag);
		fprintf(stderr, "Panic: A crash occurred while processing exceptions.\n");
		l_trace = l_context->last_exception_trace.area;
		if (l_trace) {
			fprintf(stderr, "Following is the set of recorded exceptions\n");
			fprintf(stderr, "NB: The raised panic may have induced completely inconsistent information:\n\n");
			fprintf(stderr, "%s", l_trace);
		} else {
			fprintf(stderr, "No exception trace found.\n");
		}
		exit(1);
	} else {
		l_context->raising_exception = '\1';
		l_context->exception_code = code;
		l_context->exception_tag = tag;
		if (code != GE_EX_FAIL) {
			GE_wipe_out_exception_trace_buffer(&l_context->last_exception_trace);
		}
		l_trace = trace;
		if (l_context->exception_trace_enabled && !l_trace) {
			l_trace_buffer = &l_context->exception_trace_buffer;
			GE_wipe_out_exception_trace_buffer(l_trace_buffer);
			GE_print_exception_trace(l_context, code, tag, l_trace_buffer);
			l_trace = l_trace_buffer->area;
		}
		if ((code != GE_EX_FAIL) && l_trace) {
			GE_append_to_exception_trace_buffer(&l_context->last_exception_trace, l_trace);
		}
		GE_call_set_exception_data(l_context, code, new_obj, signal_code, error_code, tag, recipient, eclass, rf_routine, rf_class, l_trace, line_number, is_invariant_entry);
		l_context->raising_exception = '\0';
		l_context->exception_code = 0;
		l_context->exception_tag = (char*)0;
		GE_jump_to_last_rescue(l_context);
	}
}

/*
 * Raise an exception with code `a_code'.
 */
void GE_raise(long a_code)
{
	GE_raise_with_message(a_code, NULL);
}

/*
 * Raise an exception with code `a_code' and message `msg'.
 */
void GE_raise_with_message(long a_code, const char* msg)
{
	GE_raise_exception(a_code, 1, -1, -1, msg, NULL, NULL, NULL, NULL, NULL, -1, 0);
}

/*
 * Raise an exception from EXCEPTION_MANAGER.
 */
void GE_developer_raise(long a_code, EIF_POINTER a_meaning, EIF_POINTER a_message)
{
	GE_raise_exception(a_code, 0, -1, -1, (char*)a_message, NULL, NULL, NULL, NULL, NULL, -1, 0);
}

/*
 * Raise exception which was raised the first time a once routine
 * was executed when executing it again.
 */
void GE_raise_once_exception(GE_context* a_context, EIF_REFERENCE a_exception)
{
	GE_once_raise(a_context, a_exception);
}

/*
 * Raise exception which was raised when an old expression was evaluated.
 */
int GE_raise_old_exception(GE_context* a_context, EIF_REFERENCE a_exception)
{
	GE_raise(GE_EX_OLD);
	return 0;
}

/*
 * Exception, if any, which was last raised in `a_context'.
 */
EIF_REFERENCE GE_last_exception_raised(GE_context* a_context)
{
	return GE_last_exception(a_context);
}

/*
 * Set `in_assertion' to 'not b'.
 * Return the opposite of previous value.
 */
EIF_BOOLEAN GE_check_assert(EIF_BOOLEAN b)
{
	EIF_BOOLEAN l_old_value;
	GE_context* l_context;

	l_context = GE_current_context();
	l_old_value = EIF_TEST(!(l_context->in_assertion));
	l_context->in_assertion = (b?0:1);
	return l_old_value;
}

/*
 * Check whether the type id of `obj' is not in `type_ids'.
 * If it is, then raise a CAT-call exception. Don't do anything if `obj' is Void.
 * `nb' is the number of ids in `type_ids' and is expected to be >0.
 * `type_ids' is sorted in increasing order.
 * Return `obj'.
 */
EIF_REFERENCE GE_check_catcall(EIF_REFERENCE obj, EIF_TYPE_INDEX type_ids[], int nb)
{
	if (obj) {
		int type_id = obj->id;
		if (type_id < type_ids[0]) {
			/* Done */
		} else if (type_id > type_ids[nb-1]) {
			/* Done */
		} else {
			int i;
			for (i = 0; i < nb; i++) {
				if (type_id == type_ids[i]) {
					GE_show_console();
					fprintf(stderr, "CAT-call error!\n");
#ifdef EIF_DEBUG
					{
						volatile char c;
						fprintf(stderr, "Press Enter...\n");
						scanf("%c", &c);
					}
#endif
					GE_raise_with_message(GE_EX_PROG, "CAT-call error.");
					break;
				} else if (type_id < type_ids[i]) {
						/* type-ids are sorted in increasing order. */
					break;
				}
			}
		}
	}
	return (obj);
}

/*
 * Check whether `obj' is Void.
 * If it is, then raise a call-on-void-target exception.
 * Return `obj'.
 */
EIF_REFERENCE GE_check_void(EIF_REFERENCE obj)
{
	if (!obj) {
		GE_show_console();
		fprintf(stderr, "Call on Void target!\n");
		GE_raise(GE_EX_VOID);
	}
	return (obj);
}

#ifdef GE_DEBUG
/*
 * Check whether `obj' is Void.
 * If it is, then raise a call-on-void-target exception.
 * Include the id `i' in the message displayed in the console
 * to help debugging when `obj' is Void.
 * Return `obj'.
 */
EIF_REFERENCE GE_check_void2(EIF_REFERENCE obj, EIF_INTEGER i)
{
	if (!obj) {
		GE_show_console();
		fprintf(stderr, "Call on Void target! (%d)\n", i);
		GE_raise(GE_EX_VOID);
	}
	return (obj);
}
#endif

/*
 * Check whether `ptr' is a null pointer.
 * If it is, then raise a no-more-memory exception.
 * Return `ptr'.
 */
void* GE_check_null(void* ptr)
{
	if (!ptr) {
		GE_show_console();
		fprintf(stderr, "No more memory!\n");
		GE_raise(GE_EX_MEM);
	}
	return (ptr);
}

#ifdef EIF_WINDOWS
static LONG WINAPI GE_windows_exception_filter(LPEXCEPTION_POINTERS a_exception)
{
		/* In order to be able to catch exceptions that cannot be caught by
		 * just using signals on Windows, we need to set `windows_exception_filter'
		 * as an unhandled exception filter.
		 * See https://learn.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-exception_record.
		 */

	switch (a_exception->ExceptionRecord->ExceptionCode) {
		case STATUS_STACK_OVERFLOW:
			GE_raise_with_message(GE_EX_EXT, "Stack overflow");
			break;

		case STATUS_INTEGER_DIVIDE_BY_ZERO:
			GE_raise_with_message(GE_EX_FLOAT, "Integer division by Zero");
			break;

		case STATUS_ACCESS_VIOLATION:
			GE_raise_with_message(GE_EX_EXT, "Segmentation violation");
			break;

		default:
			GE_raise_with_message(GE_EX_EXT, "Unhandled exception");
			break;
	}

		/* Possible return values include:
		 * EXCEPTION_CONTINUE_EXECUTION : Returns to the statement that caused the exception
		 *    and re-executes that statement. (Causes an infinite loop of calling the exception
		 *    handler if the handler does not fix the problem)
		 * EXCEPTION_EXECUTE_HANDLER: Passes the exception to default handler, in our case
		 *    none, since `windows_exception_filter' is the default one now.
		 * EXCEPTION_CONTINUE_SEARCH: Continue to search up the stack for a handle
		 */
	return EXCEPTION_EXECUTE_HANDLER;
}

/*
 * Set default exception handler.
 */
void GE_set_windows_exception_filter(void)
{
	LPTOP_LEVEL_EXCEPTION_FILTER old_exception_handler = NULL;
	old_exception_handler = SetUnhandledExceptionFilter (GE_windows_exception_filter);
}
#endif

#ifdef __cplusplus
}
#endif

#endif
