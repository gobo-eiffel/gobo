#include "gec.h"

#ifdef __cplusplus
extern "C" {
#endif

/* AP_ERROR.arguments */
T0* T32f19(T0* C)
{
	T0* R = 0;
	if (ge360os1784) {
		return ge360ov1784;
	} else {
		ge360os1784 = '\1';
		ge360ov1784 = R;
	}
	R = T23c4();
	ge360ov1784 = R;
	return R;
}

/* AP_ERROR.string_ */
T0* T32f18(T0* C)
{
	T0* R = 0;
	if (ge285os1792) {
		return ge285ov1792;
	} else {
		ge285os1792 = '\1';
		ge285ov1792 = R;
	}
	R = T26c19();
	ge285ov1792 = R;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.was_found */
T1 T41f24(T0* C)
{
	T1 R = 0;
	R = (T6f1(&(((T41*)(C))->a5), (T6)(GE_int32(0))));
	return R;
}

/* AP_INTEGER_OPTION.was_found */
T1 T37f12(T0* C)
{
	T6 t1;
	T1 R = 0;
	t1 = (T37f11(C));
	R = (T6f1(&t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_BOOLEAN_OPTION.was_found */
T1 T36f14(T0* C)
{
	T6 t1;
	T1 R = 0;
	t1 = (T36f10(C));
	R = (T6f1(&t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_ENUMERATION_OPTION.was_found */
T1 T35f18(T0* C)
{
	T6 t1;
	T1 R = 0;
	t1 = (T35f17(C));
	R = (T6f1(&t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_FLAG.was_found */
T1 T33f9(T0* C)
{
	T1 R = 0;
	R = (T6f1(&(((T33*)(C))->a1), (T6)(GE_int32(0))));
	return R;
}

/* AP_INTEGER_OPTION.occurrences */
T6 T37f11(T0* C)
{
	T6 R = 0;
	R = (((T100*)(GE_void(((T37*)(C))->a1)))->a1);
	return R;
}

/* AP_BOOLEAN_OPTION.occurrences */
T6 T36f10(T0* C)
{
	T6 R = 0;
	R = (((T97*)(GE_void(((T36*)(C))->a1)))->a1);
	return R;
}

/* AP_ENUMERATION_OPTION.occurrences */
T6 T35f17(T0* C)
{
	T6 R = 0;
	R = (((T84*)(GE_void(((T35*)(C))->a1)))->a1);
	return R;
}

/* AP_DISPLAY_HELP_FLAG.allows_parameter */
T1 T41f21(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_INTEGER_OPTION.allows_parameter */
T1 T37f16(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_BOOLEAN_OPTION.allows_parameter */
T1 T36f13(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_ENUMERATION_OPTION.allows_parameter */
T1 T35f15(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_FLAG.allows_parameter */
T1 T33f12(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.needs_parameter */
T1 T41f19(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_INTEGER_OPTION.needs_parameter */
T1 T37f15(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_BOOLEAN_OPTION.needs_parameter */
T1 T36f12(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_FLAG.needs_parameter */
T1 T33f11(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.name */
T0* T41f20(T0* C)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (T41f18(C));
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t2 = (T2)('-');
		t4 = (T2f1(&t2));
		t3 = (T17f9(GE_void(t3), t4));
		R = (T17f9(GE_void(t3), ((T41*)(C))->a4));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t4 = (T2f1(&(((T41*)(C))->a2)));
		R = (T17f9(GE_void(t3), t4));
	}
	return R;
}

/* AP_INTEGER_OPTION.name */
T0* T37f10(T0* C)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (T37f13(C));
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t2 = (T2)('-');
		t4 = (T2f1(&t2));
		t3 = (T17f9(GE_void(t3), t4));
		R = (T17f9(GE_void(t3), ((T37*)(C))->a2));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t4 = (T2f1(&(((T37*)(C))->a3)));
		R = (T17f9(GE_void(t3), t4));
	}
	return R;
}

/* AP_BOOLEAN_OPTION.name */
T0* T36f16(T0* C)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (T36f11(C));
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t2 = (T2)('-');
		t4 = (T2f1(&t2));
		t3 = (T17f9(GE_void(t3), t4));
		R = (T17f9(GE_void(t3), ((T36*)(C))->a4));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t4 = (T2f1(&(((T36*)(C))->a8)));
		R = (T17f9(GE_void(t3), t4));
	}
	return R;
}

/* AP_ENUMERATION_OPTION.name */
T0* T35f12(T0* C)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (T35f14(C));
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t2 = (T2)('-');
		t4 = (T2f1(&t2));
		t3 = (T17f9(GE_void(t3), t4));
		R = (T17f9(GE_void(t3), ((T35*)(C))->a6));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t4 = (T2f1(&(((T35*)(C))->a10)));
		R = (T17f9(GE_void(t3), t4));
	}
	return R;
}

/* AP_FLAG.name */
T0* T33f13(T0* C)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (T33f10(C));
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t2 = (T2)('-');
		t4 = (T2f1(&t2));
		t3 = (T17f9(GE_void(t3), t4));
		R = (T17f9(GE_void(t3), ((T33*)(C))->a3));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t4 = (T2f1(&(((T33*)(C))->a4)));
		R = (T17f9(GE_void(t3), t4));
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.example */
T0* T41f26(T0* C)
{
	T1 t1;
	T0* t2;
	T0* R = 0;
	R = T17c37((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T41*)(C))->a7)));
	if (t1) {
		T17f39(GE_void(R), (T2)('['));
	}
	T17f39(GE_void(R), (T2)('-'));
	if (((T41*)(C))->a3) {
		t2 = (T2f1(&(((T41*)(C))->a2)));
		T17f41(GE_void(R), t2);
	} else {
		T17f39(GE_void(R), (T2)('-'));
		T17f41(GE_void(R), ((T41*)(C))->a4);
	}
	t1 = ((T1)(!(((T41*)(C))->a7)));
	if (t1) {
		T17f39(GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_INTEGER_OPTION.example */
T0* T37f19(T0* C)
{
	T1 t1;
	T0* R = 0;
	R = T17c37((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T37*)(C))->a6)));
	if (t1) {
		T17f39(GE_void(R), (T2)('['));
	}
	T17f39(GE_void(R), (T2)('-'));
	if (((T37*)(C))->a8) {
		T17f39(GE_void(R), ((T37*)(C))->a3);
		T17f39(GE_void(R), (T2)(' '));
		T17f41(GE_void(R), ((T37*)(C))->a5);
	} else {
		T17f39(GE_void(R), (T2)('-'));
		T17f41(GE_void(R), ((T37*)(C))->a2);
		t1 = (T37f15(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f39(GE_void(R), (T2)('['));
		}
		T17f39(GE_void(R), (T2)('='));
		T17f41(GE_void(R), ((T37*)(C))->a5);
		t1 = (T37f15(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f39(GE_void(R), (T2)(']'));
		}
	}
	t1 = ((T1)(!(((T37*)(C))->a6)));
	if (t1) {
		T17f39(GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_BOOLEAN_OPTION.example */
T0* T36f17(T0* C)
{
	T1 t1;
	T0* R = 0;
	R = T17c37((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T36*)(C))->a5)));
	if (t1) {
		T17f39(GE_void(R), (T2)('['));
	}
	T17f39(GE_void(R), (T2)('-'));
	if (((T36*)(C))->a7) {
		T17f39(GE_void(R), ((T36*)(C))->a8);
		T17f39(GE_void(R), (T2)(' '));
		T17f41(GE_void(R), ((T36*)(C))->a3);
	} else {
		T17f39(GE_void(R), (T2)('-'));
		T17f41(GE_void(R), ((T36*)(C))->a4);
		t1 = (T36f12(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f39(GE_void(R), (T2)('['));
		}
		T17f39(GE_void(R), (T2)('='));
		T17f41(GE_void(R), ((T36*)(C))->a3);
		t1 = (T36f12(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f39(GE_void(R), (T2)(']'));
		}
	}
	t1 = ((T1)(!(((T36*)(C))->a5)));
	if (t1) {
		T17f39(GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_ENUMERATION_OPTION.example */
T0* T35f19(T0* C)
{
	T1 t1;
	T0* R = 0;
	R = T17c37((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T35*)(C))->a7)));
	if (t1) {
		T17f39(GE_void(R), (T2)('['));
	}
	T17f39(GE_void(R), (T2)('-'));
	if (((T35*)(C))->a9) {
		T17f39(GE_void(R), ((T35*)(C))->a10);
		T17f39(GE_void(R), (T2)(' '));
		T17f41(GE_void(R), ((T35*)(C))->a4);
	} else {
		T17f39(GE_void(R), (T2)('-'));
		T17f41(GE_void(R), ((T35*)(C))->a6);
		t1 = ((T1)(!(((T35*)(C))->a5)));
		if (t1) {
			T17f39(GE_void(R), (T2)('['));
		}
		T17f39(GE_void(R), (T2)('='));
		T17f41(GE_void(R), ((T35*)(C))->a4);
		t1 = ((T1)(!(((T35*)(C))->a5)));
		if (t1) {
			T17f39(GE_void(R), (T2)(']'));
		}
	}
	t1 = ((T1)(!(((T35*)(C))->a7)));
	if (t1) {
		T17f39(GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_FLAG.example */
T0* T33f14(T0* C)
{
	T1 t1;
	T0* t2;
	T0* R = 0;
	R = T17c37((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T33*)(C))->a6)));
	if (t1) {
		T17f39(GE_void(R), (T2)('['));
	}
	T17f39(GE_void(R), (T2)('-'));
	if (((T33*)(C))->a5) {
		t2 = (T2f1(&(((T33*)(C))->a4)));
		T17f41(GE_void(R), t2);
	} else {
		T17f39(GE_void(R), (T2)('-'));
		T17f41(GE_void(R), ((T33*)(C))->a3);
	}
	t1 = ((T1)(!(((T33*)(C))->a6)));
	if (t1) {
		T17f39(GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.names */
T0* T41f34(T0* C)
{
	T2 t1;
	T1 t2;
	T0* R = 0;
	if (((T41*)(C))->a3) {
		t1 = (T2)('-');
		R = (T2f1(&t1));
		T17f39(GE_void(R), ((T41*)(C))->a2);
	}
	t2 = (T41f18(C));
	if (t2) {
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = GE_ms8("    ", 4);
		} else {
			T17f41(GE_void(R), GE_ms8(", ", 2));
		}
		T17f39(GE_void(R), (T2)('-'));
		T17f39(GE_void(R), (T2)('-'));
		T17f41(GE_void(R), ((T41*)(C))->a4);
	}
	return R;
}

/* AP_INTEGER_OPTION.names */
T0* T37f21(T0* C)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T0* R = 0;
	R = (T37f21p1(C));
	t1 = (T37f13(C));
	if (t1) {
		t1 = (T37f15(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f39(GE_void(R), (T2)('['));
		}
		t2 = (T2)('=');
		t3 = (T2f1(&t2));
		T17f41(GE_void(R), t3);
		T17f41(GE_void(R), ((T37*)(C))->a5);
		t1 = (T37f15(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f39(GE_void(R), (T2)(']'));
		}
	} else {
		T17f39(GE_void(R), (T2)(' '));
		T17f41(GE_void(R), ((T37*)(C))->a5);
	}
	return R;
}

/* AP_INTEGER_OPTION.names */
T0* T37f21p1(T0* C)
{
	T2 t1;
	T1 t2;
	T0* R = 0;
	if (((T37*)(C))->a8) {
		t1 = (T2)('-');
		R = (T2f1(&t1));
		T17f39(GE_void(R), ((T37*)(C))->a3);
	}
	t2 = (T37f13(C));
	if (t2) {
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = GE_ms8("    ", 4);
		} else {
			T17f41(GE_void(R), GE_ms8(", ", 2));
		}
		T17f39(GE_void(R), (T2)('-'));
		T17f39(GE_void(R), (T2)('-'));
		T17f41(GE_void(R), ((T37*)(C))->a2);
	}
	return R;
}

/* AP_BOOLEAN_OPTION.names */
T0* T36f24(T0* C)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T0* R = 0;
	R = (T36f24p1(C));
	t1 = (T36f11(C));
	if (t1) {
		t1 = (T36f12(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f39(GE_void(R), (T2)('['));
		}
		t2 = (T2)('=');
		t3 = (T2f1(&t2));
		T17f41(GE_void(R), t3);
		T17f41(GE_void(R), ((T36*)(C))->a3);
		t1 = (T36f12(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f39(GE_void(R), (T2)(']'));
		}
	} else {
		T17f39(GE_void(R), (T2)(' '));
		T17f41(GE_void(R), ((T36*)(C))->a3);
	}
	return R;
}

/* AP_BOOLEAN_OPTION.names */
T0* T36f24p1(T0* C)
{
	T2 t1;
	T1 t2;
	T0* R = 0;
	if (((T36*)(C))->a7) {
		t1 = (T2)('-');
		R = (T2f1(&t1));
		T17f39(GE_void(R), ((T36*)(C))->a8);
	}
	t2 = (T36f11(C));
	if (t2) {
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = GE_ms8("    ", 4);
		} else {
			T17f41(GE_void(R), GE_ms8(", ", 2));
		}
		T17f39(GE_void(R), (T2)('-'));
		T17f39(GE_void(R), (T2)('-'));
		T17f41(GE_void(R), ((T36*)(C))->a4);
	}
	return R;
}

/* AP_ENUMERATION_OPTION.names */
T0* T35f23(T0* C)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T0* R = 0;
	R = (T35f23p1(C));
	t1 = (T35f14(C));
	if (t1) {
		t1 = ((T1)(!(((T35*)(C))->a5)));
		if (t1) {
			T17f39(GE_void(R), (T2)('['));
		}
		t2 = (T2)('=');
		t3 = (T2f1(&t2));
		T17f41(GE_void(R), t3);
		T17f41(GE_void(R), ((T35*)(C))->a4);
		t1 = ((T1)(!(((T35*)(C))->a5)));
		if (t1) {
			T17f39(GE_void(R), (T2)(']'));
		}
	} else {
		T17f39(GE_void(R), (T2)(' '));
		T17f41(GE_void(R), ((T35*)(C))->a4);
	}
	return R;
}

/* AP_ENUMERATION_OPTION.names */
T0* T35f23p1(T0* C)
{
	T2 t1;
	T1 t2;
	T0* R = 0;
	if (((T35*)(C))->a9) {
		t1 = (T2)('-');
		R = (T2f1(&t1));
		T17f39(GE_void(R), ((T35*)(C))->a10);
	}
	t2 = (T35f14(C));
	if (t2) {
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = GE_ms8("    ", 4);
		} else {
			T17f41(GE_void(R), GE_ms8(", ", 2));
		}
		T17f39(GE_void(R), (T2)('-'));
		T17f39(GE_void(R), (T2)('-'));
		T17f41(GE_void(R), ((T35*)(C))->a6);
	}
	return R;
}

/* AP_FLAG.names */
T0* T33f17(T0* C)
{
	T2 t1;
	T1 t2;
	T0* R = 0;
	if (((T33*)(C))->a5) {
		t1 = (T2)('-');
		R = (T2f1(&t1));
		T17f39(GE_void(R), ((T33*)(C))->a4);
	}
	t2 = (T33f10(C));
	if (t2) {
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = GE_ms8("    ", 4);
		} else {
			T17f41(GE_void(R), GE_ms8(", ", 2));
		}
		T17f39(GE_void(R), (T2)('-'));
		T17f39(GE_void(R), (T2)('-'));
		T17f41(GE_void(R), ((T33*)(C))->a3);
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.has_long_form */
T1 T41f18(T0* C)
{
	T1 R = 0;
	R = ((((T41*)(C))->a4)!=(EIF_VOID));
	return R;
}

/* AP_INTEGER_OPTION.has_long_form */
T1 T37f13(T0* C)
{
	T1 R = 0;
	R = ((((T37*)(C))->a2)!=(EIF_VOID));
	return R;
}

/* AP_BOOLEAN_OPTION.has_long_form */
T1 T36f11(T0* C)
{
	T1 R = 0;
	R = ((((T36*)(C))->a4)!=(EIF_VOID));
	return R;
}

/* AP_ENUMERATION_OPTION.has_long_form */
T1 T35f14(T0* C)
{
	T1 R = 0;
	R = ((((T35*)(C))->a6)!=(EIF_VOID));
	return R;
}

/* AP_FLAG.has_long_form */
T1 T33f10(T0* C)
{
	T1 R = 0;
	R = ((((T33*)(C))->a3)!=(EIF_VOID));
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.last_character */
T2 T695f6(T0* C)
{
	T6 t1;
	T1 t2;
	T2 R = 0;
	t1 = (((T1289*)(GE_void(((T695*)(C))->a3)))->a1);
	t2 = (T6f1(&t1, (T6)(GE_int32(0))));
	if (t2) {
		R = (T1289f5(GE_void(((T695*)(C))->a3)));
	} else {
		R = (((((T0*)(GE_void(((T695*)(C))->a4)))->id==22)?((T22*)(((T695*)(C))->a4))->a9:((T1644*)(((T695*)(C))->a4))->a2));
	}
	return R;
}

/* DS_LINKED_QUEUE [CHARACTER_8].item */
T2 T1289f5(T0* C)
{
	T2 R = 0;
	R = (((T1550*)(GE_void(((T1289*)(C))->a2)))->a1);
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.end_of_input */
T1 T695f21(T0* C)
{
	T6 t1;
	T1 t2;
	T1 R = 0;
	t1 = (((T1289*)(GE_void(((T695*)(C))->a3)))->a1);
	t2 = (((((t1) == ((T6)(GE_int32(0)))))));
	if (t2) {
		R = (((((T0*)(GE_void(((T695*)(C))->a4)))->id==22)?T22f25(((T695*)(C))->a4):((T1644*)(((T695*)(C))->a4))->a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* KL_TEXT_INPUT_FILE.end_of_input */
T1 T22f25(T0* C)
{
	T1 R = 0;
	R = ((T22*)(C))->a5;
	return R;
}

/* KL_STDIN_FILE.is_closable */
T1 T725f11(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.is_closable */
T1 T695f7(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* KL_TEXT_INPUT_FILE.is_closable */
T1 T22f33(T0* C)
{
	T1 R = 0;
	R = (T22f11(C));
	return R;
}

/* KL_STDIN_FILE.read_to_string */
T6 T725f16(T0* C, T0* a1, T6 a2, T6 a3)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T6 t4;
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T0* l5 = 0;
	l2 = a2;
	while (1) {
		t1 = (((((l1) == (a3)))));
		if (!(t1)) {
			t1 = (EIF_TRUE);
		}
		if (t1) {
			break;
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t2 = ((GE_void(((T725*)(C))->a4), (T2)0));
		T17f55(GE_void(a1), t2, l2);
		((T725*)(C))->a4 = ((GE_void(((T725*)(C))->a4), (T0*)0));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
	}
	t1 = ((T1)((l1)<(a3)));
	if (t1) {
		t1 = (T725f7(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T725f8(C));
			t1 = (T82f1(GE_void(t3), a1, ge333ov25671));
			if (t1) {
				t4 = ((T6)((a3)-(l1)));
				t4 = (T725f10(C, a1, l2, t4));
				R = ((T6)((l1)+(t4)));
			} else {
				l4 = ((T6)((a3)-(l1)));
				l5 = T17c37(l4);
				T17f49(GE_void(l5), l4);
				l4 = (T725f10(C, l5, (T6)(GE_int32(1)), l4));
				l3 = (T6)(GE_int32(1));
				while (1) {
					t1 = (T6f1((&l3), l4));
					if (t1) {
						break;
					}
					t2 = (T17f10(GE_void(l5), l3));
					T17f55(GE_void(a1), t2, l2);
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
					l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
				}
				R = ((T6)((l1)+(l4)));
			}
		} else {
			R = l1;
		}
		((T725*)(C))->a1 = (T725f7(C));
	} else {
		R = l1;
	}
	return R;
}

/* KL_STDIN_FILE.old_read_to_string */
T6 T725f10(T0* C, T0* a1, T6 a2, T6 a3)
{
	T0* t1;
	T6 t2;
	T14 t3;
	T6 R = 0;
	t1 = (((T17*)(GE_void(a1)))->a1);
	t2 = ((T6)((a2)-((T6)(GE_int32(1)))));
	t3 = (T15f6(GE_void(t1), t2));
	R = (T725f13(C, ((T725*)(C))->a5, t3, a3));
	return R;
}

/* KL_STDIN_FILE.file_gss */
T6 T725f13(T0* C, T14 a1, T14 a2, T6 a3)
{
	T6 R = 0;
	R = (T6)(EIF_INTEGER )file_gss((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
	return R;
}

/* KL_STDIN_FILE.any_ */
T0* T725f8(T0* C)
{
	T0* R = 0;
	if (ge272os1885) {
		return ge272ov1885;
	} else {
		ge272os1885 = '\1';
		ge272ov1885 = R;
	}
	R = T82c5();
	ge272ov1885 = R;
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.read_to_string */
T6 T695f28(T0* C, T0* a1, T6 a2, T6 a3)
{
	T1 t1;
	T6 t2;
	T2 t3;
	T6 R = 0;
	t1 = (((((((T695*)(C))->a2) == ((T6)(GE_int32(6)))))));
	if (!(t1)) {
		t1 = (((((((T695*)(C))->a2) == ((T6)(GE_int32(2)))))));
	}
	if (!(t1)) {
		t2 = (((T1289*)(GE_void(((T695*)(C))->a3)))->a1);
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		T695f32(C);
		t1 = (T695f21(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T695f6(C));
			T17f55(GE_void(a1), t3, a2);
			R = (T6)(GE_int32(1));
		} else {
			R = (T6)(GE_int32(0));
		}
	} else {
		t1 = (((((((T695*)(C))->a2) == ((T6)(GE_int32(1)))))));
		if (t1) {
			R = (((((T0*)(GE_void(((T695*)(C))->a4)))->id==22)?T22f29(((T695*)(C))->a4, a1, a2, a3):T1644f7(((T695*)(C))->a4, a1, a2, a3)));
		} else {
			R = (T695f28p1(C, a1, a2, a3));
		}
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.read_to_string */
T6 T695f28p1(T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 t1;
	T1 t2;
	T2 t3;
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	t1 = ((T6)((a2)+(a3)));
	l2 = ((T6)((t1)-((T6)(GE_int32(1)))));
	l1 = a2;
	while (1) {
		t2 = (T6f1((&l1), l2));
		if (t2) {
			break;
		}
		T695f32(C);
		t2 = (T695f21(C));
		t2 = ((T1)(!(t2)));
		if (t2) {
			t3 = (T695f6(C));
			T17f55(GE_void(a1), t3, l1);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		} else {
			t1 = ((T6)((l1)-(a2)));
			R = ((T6)((t1)-(a3)));
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		}
	}
	t1 = ((T6)((R)+(l1)));
	R = ((T6)((t1)-(a2)));
	return R;
}

/* KL_STRING_INPUT_STREAM.read_to_string */
T6 T1644f7(T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 t1;
	T1 t2;
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	t1 = ((T6)((a2)+(a3)));
	l2 = ((T6)((t1)-((T6)(GE_int32(1)))));
	l1 = a2;
	while (1) {
		t2 = (T6f1((&l1), l2));
		if (t2) {
			break;
		}
		T1644f9(C);
		t2 = ((T1)(!(((T1644*)(C))->a1)));
		if (t2) {
			T17f55(GE_void(a1), ((T1644*)(C))->a2, l1);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		} else {
			t1 = ((T6)((l1)-(a2)));
			R = ((T6)((t1)-(a3)));
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		}
	}
	t1 = ((T6)((R)+(l1)));
	R = ((T6)((t1)-(a2)));
	return R;
}

/* KL_TEXT_INPUT_FILE.read_to_string */
T6 T22f29(T0* C, T0* a1, T6 a2, T6 a3)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T6 t4;
	T0* t5;
	T6 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	l1 = a2;
	while (1) {
		t1 = (((((l5) == (a3)))));
		if (!(t1)) {
			t1 = ((((T22*)(C))->a4)==(EIF_VOID));
		}
		if (t1) {
			break;
		}
		l5 = ((T6)((l5)+((T6)(GE_int32(1)))));
		t2 = (((T75*)(GE_void(((T22*)(C))->a4)))->a1);
		T17f55(GE_void(a1), t2, l1);
		((T22*)(C))->a4 = (((T75*)(GE_void(((T22*)(C))->a4)))->a2);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	t1 = ((T1)((l5)<(a3)));
	if (t1) {
		t1 = (T22f27(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T22f36(C));
			t1 = (T82f1(GE_void(t3), a1, ge318ov1905));
			if (t1) {
				t4 = ((T6)((a3)-(l5)));
				t4 = (T22f28(C, a1, l1, t4));
				l5 = ((T6)((l5)+(t4)));
			} else {
				t3 = (T22f36(C));
				t5 = (T22f38(C));
				t1 = (T82f1(GE_void(t3), a1, t5));
				if (t1) {
					t4 = ((T6)((a3)-(l5)));
					t4 = (T22f28(C, a1, l1, t4));
					l5 = ((T6)((l5)+(t4)));
				} else {
					l4 = ((T6)((a3)-(l5)));
					l2 = T17c37(l4);
					T17f49(GE_void(l2), l4);
					l4 = (T22f28(C, l2, (T6)(GE_int32(1)), l4));
					l3 = (T6)(GE_int32(1));
					while (1) {
						t1 = (T6f1((&l3), l4));
						if (t1) {
							break;
						}
						t2 = (T17f10(GE_void(l2), l3));
						T17f55(GE_void(a1), t2, l1);
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
					}
					l5 = ((T6)((l5)+(l4)));
				}
			}
		}
		((T22*)(C))->a5 = (T22f27(C));
	}
	R = l5;
	return R;
}

/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
unsigned char ge318os1906 = '\0';
T0* ge318ov1906;
T0* T22f38(T0* C)
{
	T0* R = 0;
	if (ge318os1906) {
		return ge318ov1906;
	} else {
		ge318os1906 = '\1';
		ge318ov1906 = R;
	}
	R = T698c10((T6)(GE_int32(0)));
	ge318ov1906 = R;
	return R;
}

/* KL_TEXT_INPUT_FILE.any_ */
T0* T22f36(T0* C)
{
	T0* R = 0;
	if (ge272os1885) {
		return ge272ov1885;
	} else {
		ge272os1885 = '\1';
		ge272ov1885 = R;
	}
	R = T82c5();
	ge272ov1885 = R;
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.name */
T0* T695f5(T0* C)
{
	T0* R = 0;
	R = (((((T0*)(GE_void(((T695*)(C))->a4)))->id==22)?((T22*)(((T695*)(C))->a4))->a2:T1644f6(((T695*)(C))->a4)));
	return R;
}

/* KL_STRING_INPUT_STREAM.name */
unsigned char ge335os1881 = '\0';
T0* ge335ov1881;
T0* T1644f6(T0* C)
{
	T0* R = 0;
	if (ge335os1881) {
		return ge335ov1881;
	} else {
		ge335os1881 = '\1';
		ge335ov1881 = R;
	}
	R = GE_ms8("STRING", 6);
	ge335ov1881 = R;
	return R;
}

/* ET_LACE_SYSTEM.stop_requested */
T1 T59f164(T0* C)
{
	T1 t1;
	T1 R = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		R = ((GE_void(((T59*)(C))->a6), GE_mt175(), (T1)0));
	}
	return R;
}

/* ET_ECF_SYSTEM.stop_requested */
T1 T56f170(T0* C)
{
	T1 t1;
	T1 R = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		R = ((GE_void(((T56*)(C))->a8), GE_mt175(), (T1)0));
	}
	return R;
}

/* ET_XACE_SYSTEM.stop_requested */
T1 T53f154(T0* C)
{
	T1 t1;
	T1 R = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		R = ((GE_void(((T53*)(C))->a6), GE_mt175(), (T1)0));
	}
	return R;
}

/* ET_LACE_SYSTEM.dotnet_assembly_consumer */
T0* T59f153(T0* C)
{
	T1 t1;
	T0* R = 0;
	R = ((T59*)(C))->a144;
	t1 = ((R)==(EIF_VOID));
	if (t1) {
		R = T659c3(C);
		((T59*)(C))->a144 = R;
	}
	return R;
}

/* ET_DOTNET_ASSEMBLY_CLASSIC_CONSUMER.make */
T0* T659c3(T0* a1)
{
	T0* C;
	C = GE_new659(EIF_TRUE);
	((T659*)(C))->a1 = a1;
	return C;
}

/* ET_ECF_SYSTEM.dotnet_assembly_consumer */
T0* T56f159(T0* C)
{
	T1 t1;
	T0* R = 0;
	R = ((T56*)(C))->a150;
	t1 = ((R)==(EIF_VOID));
	if (t1) {
		R = T659c3(C);
		((T56*)(C))->a150 = R;
	}
	return R;
}

/* ET_XACE_SYSTEM.dotnet_assembly_consumer */
T0* T53f164(T0* C)
{
	T1 t1;
	T0* R = 0;
	R = ((T53*)(C))->a148;
	t1 = ((R)==(EIF_VOID));
	if (t1) {
		R = T659c3(C);
		((T53*)(C))->a148 = R;
	}
	return R;
}

/* ET_SYSTEM.dotnet_assembly_consumer */
T0* T25f140(T0* C)
{
	T1 t1;
	T0* R = 0;
	R = ((T25*)(C))->a126;
	t1 = ((R)==(EIF_VOID));
	if (t1) {
		R = T659c3(C);
		((T25*)(C))->a126 = R;
	}
	return R;
}

/* ET_LACE_SYSTEM.is_dotnet */
T1 T59f166(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T59*)(C))->a71)!=(EIF_VOID));
	if (t1) {
		t2 = (T156f3(GE_void(((T59*)(C))->a71)));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_ADAPTED_DOTNET_ASSEMBLIES.count */
T6 T156f3(T0* C)
{
	T6 R = 0;
	R = (((T517*)(GE_void(((T156*)(C))->a1)))->a1);
	return R;
}

/* ET_ECF_SYSTEM.is_dotnet */
T1 T56f172(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T56*)(C))->a73)!=(EIF_VOID));
	if (t1) {
		t2 = (T156f3(GE_void(((T56*)(C))->a73)));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_XACE_SYSTEM.is_dotnet */
T1 T53f170(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T53*)(C))->a60)!=(EIF_VOID));
	if (t1) {
		t2 = (T156f3(GE_void(((T53*)(C))->a60)));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_SYSTEM.is_dotnet */
T1 T25f146(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T25*)(C))->a33)!=(EIF_VOID));
	if (t1) {
		t2 = (T156f3(GE_void(((T25*)(C))->a33)));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LACE_SYSTEM.is_ise */
T1 T59f149(T0* C)
{
	T1 R = 0;
	R = ((((T59*)(C))->a30)!=(EIF_VOID));
	return R;
}

/* ET_ECF_SYSTEM.is_ise */
T1 T56f166(T0* C)
{
	T1 R = 0;
	R = ((((T56*)(C))->a32)!=(EIF_VOID));
	return R;
}

/* ET_XACE_SYSTEM.is_ise */
T1 T53f167(T0* C)
{
	T1 R = 0;
	R = ((((T53*)(C))->a30)!=(EIF_VOID));
	return R;
}

/* ET_SYSTEM.is_ise */
T1 T25f142(T0* C)
{
	T1 R = 0;
	R = (EIF_FALSE);
	return R;
}

/* XM_NAMESPACE.is_equal */
T1 T1500f4(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T0* t3;
	T1 R = 0;
	t1 = (((T1500*)(GE_void(a1)))->a1);
	t2 = ((((T1500*)(C))->a1)==(t1));
	if (!(t2)) {
		t2 = ((((T1500*)(C))->a1)!=(EIF_VOID));
		if (t2) {
			t1 = (T1500f3(C));
			t3 = (((T1500*)(GE_void(a1)))->a1);
			R = (T26f1(GE_void(t1), ((T1500*)(C))->a1, t3));
		} else {
			R = EIF_FALSE;
		}
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* XM_EIFFEL_PARSER_NAME.is_equal */
T1 T459f10(T0* C, T0* a1)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T0* t4;
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	t1 = (((T459*)(GE_void(a1)))->a2);
	t2 = (((((((T459*)(C))->a2) == (t1)))));
	if (t2) {
		t2 = (((((((T459*)(C))->a2) == ((T6)(GE_int32(0)))))));
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = (((((((T459*)(C))->a2) == ((T6)(GE_int32(1)))))));
			if (t2) {
				t3 = (((T459*)(GE_void(a1)))->a3);
				R = (T459f15(C, ((T459*)(C))->a3, t3));
			} else {
				t2 = (((((((T459*)(C))->a2) == ((T6)(GE_int32(2)))))));
				if (t2) {
					t3 = (((T459*)(GE_void(a1)))->a3);
					t2 = (T459f15(C, ((T459*)(C))->a3, t3));
					if (t2) {
						t3 = (((T459*)(GE_void(a1)))->a4);
						R = (T459f15(C, ((T459*)(C))->a4, t3));
					} else {
						R = EIF_FALSE;
					}
				} else {
					t3 = (((T459*)(GE_void(a1)))->a3);
					t2 = (T459f15(C, ((T459*)(C))->a3, t3));
					if (t2) {
						t3 = (((T459*)(GE_void(a1)))->a4);
						R = (T459f15(C, ((T459*)(C))->a4, t3));
					} else {
						R = EIF_FALSE;
					}
					l1 = (T466f6(GE_void(((T459*)(C))->a5)));
					T1176f8(GE_void(l1));
					t3 = (((T459*)(GE_void(a1)))->a5);
					l2 = (T466f6(GE_void(t3)));
					T1176f8(GE_void(l2));
					while (1) {
						t2 = (((T1176*)(GE_void(l1)))->a3);
						if (!(t2)) {
							t2 = ((T1)(!(R)));
						}
						if (t2) {
							break;
						}
						t3 = (T1176f6(GE_void(l1)));
						t4 = (T1176f6(GE_void(l2)));
						R = (T459f15(C, t3, t4));
						T1176f9(GE_void(l1));
						T1176f9(GE_void(l2));
					}
				}
			}
		}
	}
	return R;
}

/* XM_EIFFEL_PARSER_NAME.same_string */
T1 T459f15(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 R = 0;
	t1 = (T459f8(C));
	R = (T48f1(GE_void(t1), a1, a2));
	return R;
}

/* ET_IDENTIFIER.is_equal */
T1 T147f37(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T1 R = 0;
	t1 = (T147f47(C));
	t2 = (T82f1(GE_void(t1), C, a1));
	if (t2) {
		R = (T147f35(C, a1));
	}
	return R;
}

/* STRING_8.is_equal */
T1 T17f21(T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T1 R = 0;
	T6 l1 = 0;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		l1 = ((T17*)(C))->a2;
		t2 = (((((T0*)(GE_void(a1)))->id==17)?((T17*)(a1))->a2:((T694*)(a1))->a1));
		t1 = (((((l1) == (t2)))));
		if (t1) {
			t3 = (((((T0*)(GE_void(a1)))->id==17)?((T17*)(a1))->a1:((T694*)(a1))->a2));
			t2 = (T17f24(C, ((T17*)(C))->a1, t3, l1));
			R = (((((t2) == ((T6)(GE_int32(0)))))));
		}
	}
	return R;
}

/* STRING_8.str_strict_cmp */
T6 T17f24(T0* C, T0* a1, T0* a2, T6 a3)
{
	T1 t1;
	T2 t2;
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	while (1) {
		t1 = (((((l1) == (a3)))));
		if (t1) {
			break;
		}
		t2 = (((T15*)(GE_void(a1)))->z2[l1]);
		l2 = ((T6)(t2));
		t2 = (((T15*)(GE_void(a2)))->z2[l1]);
		l3 = ((T6)(t2));
		t1 = (((((l2) != (l3)))));
		if (t1) {
			R = ((T6)((l2)-(l3)));
			l1 = ((T6)((a3)-((T6)(GE_int32(1)))));
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	return R;
}

T0* GE_ma616(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new615(c, EIF_FALSE);
	*(T615*)t1 = GE_default615;
	((T615*)(t1))->z1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T615*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new616(EIF_TRUE);
	((T616*)(R))->a1 = t1;
	((T616*)(R))->a2 = 1;
	((T616*)(R))->a3 = c;
	return R;
}

T0* GE_ma90(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new89(c, EIF_FALSE);
	*(T89*)t1 = GE_default89;
	((T89*)(t1))->z1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T89*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new90(EIF_TRUE);
	((T90*)(R))->a1 = t1;
	((T90*)(R))->a2 = 1;
	((T90*)(R))->a3 = c;
	return R;
}

T0* GE_ma416(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new121(c, EIF_FALSE);
	*(T121*)t1 = GE_default121;
	((T121*)(t1))->z1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T6 *i = ((T121*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T6);
		}
		va_end(v);
	}
	R = GE_new416(EIF_TRUE);
	((T416*)(R))->a1 = t1;
	((T416*)(R))->a2 = 1;
	((T416*)(R))->a3 = c;
	return R;
}

T0* GE_ma442(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new441(c, EIF_FALSE);
	*(T441*)t1 = GE_default441;
	((T441*)(t1))->z1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T441*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new442(EIF_TRUE);
	((T442*)(R))->a1 = t1;
	((T442*)(R))->a2 = 1;
	((T442*)(R))->a3 = c;
	return R;
}

T0* GE_ma1259(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new641(c, EIF_FALSE);
	*(T641*)t1 = GE_default641;
	((T641*)(t1))->z1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T641*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new1259(EIF_TRUE);
	((T1259*)(R))->a1 = t1;
	((T1259*)(R))->a2 = 1;
	((T1259*)(R))->a3 = c;
	return R;
}

T0* GE_mt175()
{
	T0* R;
	R = GE_new175(EIF_TRUE);
	return R;
}

T0* ge332ov9815;
T0* ge292ov3051;
T0* ge391ov25068;
T0* ge381ov10613;
T0* ge334ov9815;
T0* ge1032ov7510;
T0* ge1032ov7515;
T0* ge314ov1925;
T0* ge1284ov15639;
T0* ge1284ov15624;
T0* ge1284ov15617;
T0* ge1284ov15602;
T0* ge1284ov15627;
T0* ge1284ov15620;
T0* ge1284ov15628;
T0* ge1284ov15637;
T0* ge1284ov15630;
T0* ge1284ov15626;
T0* ge1284ov15614;
T0* ge1284ov15615;
T0* ge1284ov15629;
T0* ge1284ov15616;
T0* ge1284ov15603;
T0* ge1284ov15604;
T0* ge1284ov15605;
T0* ge1284ov15611;
T0* ge1284ov15613;
T0* ge1284ov15608;
T0* ge1284ov15633;
T0* ge1284ov15632;
T0* ge1284ov15609;
T0* ge1284ov15610;
T0* ge1284ov15607;
T0* ge1284ov15606;
T0* ge1280ov15397;
T0* ge1032ov7512;
T0* ge1032ov7514;
T0* ge1032ov7388;
T0* ge1032ov7420;
T0* ge1032ov7397;
T0* ge1032ov7392;
T0* ge1032ov7480;
T0* ge836ov13108;
T0* ge836ov13067;
T0* ge836ov13193;
T0* ge1032ov7478;
T0* ge1032ov7425;
T0* ge1032ov7427;
T0* ge1032ov7495;
T0* ge1032ov7448;
T0* ge1032ov7442;
T0* ge1032ov7383;
T0* ge1032ov7474;
T0* ge1032ov7440;
T0* ge836ov13086;
T0* ge836ov13019;
T0* ge836ov13167;
T0* ge1026ov22832;
T0* ge1026ov22831;
T0* ge1026ov22830;
T0* ge836ov13185;
T0* ge1032ov7472;
T0* ge1032ov7429;
T0* ge1032ov7422;
T0* ge1032ov7473;
T0* ge1032ov7398;
T0* ge1032ov7421;
T0* ge1032ov7482;
T0* ge1032ov7506;
T0* ge1032ov7444;
T0* ge1032ov7446;
T0* ge1032ov7445;
T0* ge1032ov7499;
T0* ge1032ov7385;
T0* ge1032ov7447;
T0* ge1032ov7477;
T0* ge1032ov7426;
T0* ge1032ov7476;
T0* ge1032ov7463;
T0* ge1032ov7489;
T0* ge1032ov7496;
T0* ge1032ov7431;
T0* ge836ov13170;
T0* ge1032ov7458;
T0* ge1032ov7439;
T0* ge1032ov7455;
T0* ge1032ov7441;
T0* ge1032ov7381;
T0* ge1032ov7384;
T0* ge1032ov7387;
T0* ge1032ov7465;
T0* ge1032ov7432;
T0* ge1032ov7497;
T0* ge1032ov7502;
T0* ge1032ov7457;
T0* ge1032ov7456;
T0* ge1032ov7466;
T0* ge1032ov7389;
T0* ge1032ov7449;
T0* ge1032ov7443;
T0* ge1032ov7386;
T0* ge1032ov7395;
T0* ge1032ov7416;
T0* ge1032ov7414;
T0* ge1032ov7407;
T0* ge1032ov7406;
T0* ge1032ov7405;
T0* ge1032ov7404;
T0* ge1032ov7402;
T0* ge1032ov7417;
T0* ge1032ov7394;
T0* ge1032ov7391;
T0* ge1032ov7464;
T0* ge1032ov7450;
T0* ge1032ov7437;
T0* ge1032ov7488;
T0* ge836ov13101;
T0* ge1032ov7494;
T0* ge1032ov7491;
T0* ge1032ov7492;
T0* ge1032ov7382;
T0* ge1032ov7493;
T0* ge1032ov7428;
T0* ge1032ov7423;
T0* ge836ov13041;
T0* ge1032ov7481;
T0* ge1032ov7433;
T0* ge1032ov7434;
T0* ge1032ov7479;
T0* ge1032ov7435;
T0* ge1032ov7436;
T0* ge1032ov7490;
T0* ge1032ov7468;
T0* ge1032ov7511;
T0* ge1032ov7390;
T0* ge1032ov7503;
T0* ge1032ov7498;
T0* ge1032ov7399;
T0* ge1032ov7487;
T0* ge1032ov7412;
T0* ge1032ov7411;
T0* ge1032ov7410;
T0* ge1032ov7409;
T0* ge1032ov7403;
T0* ge1032ov7401;
T0* ge1032ov7400;
T0* ge1032ov7396;
T0* ge836ov13010;
T0* ge1032ov7415;
T0* ge836ov13031;
T0* ge1032ov7408;
T0* ge836ov13021;
T0* ge836ov13014;
T0* ge1032ov7424;
T0* ge836ov13044;
T0* ge1032ov7393;
T0* ge836ov13007;
T0* ge836ov13189;
T0* ge836ov13183;
T0* ge836ov13045;
T0* ge1030ov22820;
T0* ge1030ov22814;
T0* ge1030ov22808;
T0* ge1030ov22816;
T0* ge1030ov22810;
T0* ge1030ov22804;
T0* ge1030ov22819;
T0* ge1030ov22813;
T0* ge1030ov22807;
T0* ge1030ov22821;
T0* ge1030ov22815;
T0* ge1030ov22809;
T0* ge836ov13079;
T0* ge1030ov22818;
T0* ge1030ov22812;
T0* ge1030ov22806;
T0* ge836ov13103;
T0* ge836ov13073;
T0* ge836ov13156;
T0* ge836ov13122;
T0* ge836ov13165;
T0* ge836ov13111;
T0* ge836ov13077;
T0* ge1031ov23752;
T0* ge1031ov23493;
T0* ge1031ov23350;
T0* ge1031ov23750;
T0* ge1031ov23491;
T0* ge1031ov23348;
T0* ge1031ov23751;
T0* ge1031ov23492;
T0* ge1031ov23349;
T0* ge836ov13047;
T0* ge1030ov22817;
T0* ge1030ov22811;
T0* ge1030ov22805;
T0* ge836ov13295;
T0* ge836ov13036;
T0* ge836ov13292;
T0* ge836ov13286;
T0* ge836ov13281;
T0* ge836ov13280;
T0* ge836ov13277;
T0* ge836ov13043;
T0* ge836ov13042;
T0* ge836ov13040;
T0* ge836ov13206;
T0* ge836ov13039;
T0* ge836ov13038;
T0* ge836ov13037;
T0* ge836ov13035;
T0* ge836ov13034;
T0* ge836ov13294;
T0* ge836ov13033;
T0* ge836ov13293;
T0* ge836ov13032;
T0* ge836ov13030;
T0* ge836ov13029;
T0* ge836ov13291;
T0* ge836ov13028;
T0* ge836ov13027;
T0* ge836ov13026;
T0* ge836ov13290;
T0* ge836ov13025;
T0* ge836ov13289;
T0* ge836ov13024;
T0* ge836ov13288;
T0* ge836ov13023;
T0* ge836ov13287;
T0* ge836ov13022;
T0* ge836ov13020;
T0* ge836ov13285;
T0* ge836ov13018;
T0* ge836ov13284;
T0* ge836ov13017;
T0* ge836ov13283;
T0* ge836ov13016;
T0* ge836ov13282;
T0* ge836ov13015;
T0* ge836ov13013;
T0* ge836ov13012;
T0* ge836ov13011;
T0* ge836ov13279;
T0* ge836ov13009;
T0* ge836ov13278;
T0* ge836ov13008;
T0* ge836ov13276;
T0* ge836ov13006;
T0* ge836ov13005;
T0* ge836ov13003;
T0* ge836ov13002;
T0* ge836ov13004;
T0* ge1104ov5333;
T0* ge1398ov11101;
T0* ge1398ov11100;
T0* ge1104ov5336;
T0* ge1104ov5328;
T0* ge1104ov5334;
T0* ge1104ov5323;
T0* ge1104ov5311;
T0* ge1104ov5322;
T0* ge1104ov5320;
T0* ge1104ov5332;
T0* ge1104ov5338;
T0* ge1104ov5337;
T0* ge1104ov5310;
T0* ge1104ov5319;
T0* ge1104ov5317;
T0* ge1104ov5321;
T0* ge1104ov5313;
T0* ge1104ov5330;
T0* ge1104ov5309;
T0* ge1104ov5327;
T0* ge1104ov5315;
T0* ge1104ov5316;
T0* ge1104ov5314;
T0* ge1104ov5339;
T0* ge1104ov5324;
T0* ge1104ov5325;
T0* ge1104ov5335;
T0* ge1104ov5312;
T0* ge1104ov5326;
T0* ge1104ov5318;
T0* ge1107ov5308;
T0* ge1107ov5307;
T0* ge1104ov5329;
T0* ge1104ov5331;
T0* ge1405ov11637;
T0* ge1405ov11599;
T0* ge1405ov11597;
T0* ge1405ov11638;
T0* ge1405ov11610;
T0* ge1405ov11609;
T0* ge1405ov11620;
T0* ge1405ov11614;
T0* ge1405ov11613;
T0* ge1405ov11612;
T0* ge1405ov11618;
T0* ge1405ov11617;
T0* ge1405ov11619;
T0* ge1405ov11596;
T0* ge1405ov11622;
T0* ge1405ov11631;
T0* ge1408ov11452;
T0* ge1408ov11450;
T0* ge1408ov11451;
T0* ge1405ov11632;
T0* ge1405ov11633;
T0* ge1405ov11636;
T0* ge1405ov11634;
T0* ge1405ov11635;
T0* ge1405ov11629;
T0* ge1401ov24280;
T0* ge1401ov24281;
T0* ge1405ov11602;
T0* ge1405ov11625;
T0* ge1405ov11645;
T0* ge1405ov11646;
T0* ge1405ov11647;
T0* ge1405ov11640;
T0* ge1405ov11623;
T0* ge1405ov11624;
T0* ge1405ov11626;
T0* ge1405ov11630;
T0* ge1122ov4271;
T0* ge1122ov4272;
T0* ge1122ov4273;
T0* ge1122ov4274;
T0* ge1122ov4275;
T0* ge1122ov4276;
T0* ge1122ov4277;
T0* ge1122ov4278;
T0* ge1122ov4279;
T0* ge1122ov4280;
T0* ge1122ov4281;
T0* ge1122ov4282;
T0* ge1122ov4283;
T0* ge1122ov4284;
T0* ge1122ov4285;
T0* ge1122ov4286;
T0* ge1122ov4287;
T0* ge1122ov4288;
T0* ge1122ov4289;
T0* ge1122ov4290;
T0* ge1122ov4291;
T0* ge1122ov4292;
T0* ge1122ov4293;
T0* ge1122ov4294;
T0* ge1122ov4295;
T0* ge1122ov4296;
T0* ge1122ov4297;
T0* ge1122ov4298;
T0* ge1122ov4299;
T0* ge1122ov4300;
T0* ge1122ov4301;
T0* ge1122ov4302;
T0* ge1122ov4303;
T0* ge1122ov4304;
T0* ge1122ov4305;
T0* ge1122ov4306;
T0* ge1122ov4307;
T0* ge1122ov4308;
T0* ge1122ov4309;
T0* ge1122ov4310;
T0* ge1122ov4311;
T0* ge1122ov4312;
T0* ge1122ov4313;
T0* ge1122ov4314;
T0* ge1122ov4315;
T0* ge1122ov4316;
T0* ge1122ov4317;
T0* ge1122ov4318;
T0* ge1122ov4319;
T0* ge1122ov4320;
T0* ge1122ov4321;
T0* ge1122ov4322;
T0* ge1122ov4323;
T0* ge1122ov4324;
T0* ge1122ov4325;
T0* ge1122ov4326;
T0* ge1122ov4327;
T0* ge1122ov4328;
T0* ge1122ov4329;
T0* ge1122ov4330;
T0* ge1122ov4331;
T0* ge1122ov4332;
T0* ge1122ov4333;
T0* ge1122ov4334;
T0* ge1122ov4335;
T0* ge1122ov4336;
T0* ge1122ov4337;
T0* ge1122ov4338;
T0* ge1122ov4339;
T0* ge1122ov4340;
T0* ge1122ov4341;
T0* ge1122ov4342;
T0* ge1122ov4343;
T0* ge1122ov4344;
T0* ge1122ov4345;
T0* ge1122ov4346;
T0* ge1122ov4347;
T0* ge1122ov4348;
T0* ge1122ov4349;
T0* ge1122ov4350;
T0* ge1122ov4351;
T0* ge1122ov4352;
T0* ge1122ov4353;
T0* ge1122ov4354;
T0* ge1122ov4355;
T0* ge1122ov4356;
T0* ge1122ov4357;
T0* ge1122ov4358;
T0* ge1122ov4359;
T0* ge1122ov4360;
T0* ge1122ov4361;
T0* ge1122ov4362;
T0* ge1122ov4363;
T0* ge1122ov4461;
T0* ge1122ov4472;
T0* ge1153ov4238;
T0* ge1122ov4481;
T0* ge1122ov4468;
T0* ge1122ov4473;
T0* ge1122ov4474;
T0* ge1122ov4475;
T0* ge1122ov4462;
T0* ge1122ov4479;
T0* ge1122ov4483;
T0* ge1122ov4466;
T0* ge1122ov4458;
T0* ge1122ov4469;
T0* ge1122ov4467;
T0* ge1122ov4464;
T0* ge1122ov4478;
T0* ge1122ov4477;
T0* ge1122ov4460;
T0* ge1122ov4482;
T0* ge1122ov4459;
T0* ge1122ov4465;
T0* ge1122ov4480;
T0* ge1122ov4476;
T0* ge1122ov4470;
T0* ge1122ov4463;
T0* ge1122ov4486;
T0* ge1122ov4471;
T0* ge1122ov4484;
T0* ge1153ov4237;
T0* ge1153ov4236;
T0* ge1112ov18180;
T0* ge1118ov17229;
T0* ge1197ov5074;
T0* ge57ov4108;
T0* ge57ov4115;
T0* ge55ov4173;
T0* ge352ov1781;
T0* ge54ov3692;
T0* ge57ov4111;
T0* ge57ov4118;
T0* ge57ov4109;
T0* ge57ov4116;
T0* ge57ov4110;
T0* ge57ov4117;
T0* ge57ov4112;
T0* ge57ov4119;
T0* ge57ov4113;
T0* ge57ov4120;
T0* ge54ov3687;
T0* ge54ov3686;
T0* ge54ov3694;
T0* ge54ov3693;
T0* ge1412ov23986;
T0* ge1412ov23987;
T0* ge1403ov25076;
T0* ge1403ov25078;
T0* ge925ov14763;
T0* ge918ov26788;
T0* ge915ov27193;
T0* ge894ov26816;
T0* ge1031ov23723;
T0* ge1031ov23472;
T0* ge1031ov23321;
T0* ge1031ov23722;
T0* ge1031ov23320;
T0* ge1031ov23537;
T0* ge1031ov23382;
T0* ge1031ov23135;
T0* ge836ov13210;
T0* ge1031ov23720;
T0* ge1031ov23471;
T0* ge1031ov23318;
T0* ge1031ov23719;
T0* ge1031ov23317;
T0* ge1031ov23536;
T0* ge1031ov23381;
T0* ge1031ov23134;
T0* ge1031ov23505;
T0* ge1031ov23367;
T0* ge1031ov23103;
T0* ge1031ov23725;
T0* ge1031ov23474;
T0* ge1031ov23323;
T0* ge1031ov23761;
T0* ge1031ov23499;
T0* ge1031ov23359;
T0* ge1031ov23762;
T0* ge1031ov23360;
T0* ge1031ov23759;
T0* ge1031ov23498;
T0* ge1031ov23357;
T0* ge1031ov23760;
T0* ge1031ov23358;
T0* ge1031ov23636;
T0* ge1031ov23429;
T0* ge1031ov23234;
T0* ge1031ov23765;
T0* ge1031ov23501;
T0* ge1031ov23363;
T0* ge1031ov23766;
T0* ge1031ov23364;
T0* ge1031ov23763;
T0* ge1031ov23500;
T0* ge1031ov23361;
T0* ge1031ov23764;
T0* ge1031ov23362;
T0* ge1031ov23634;
T0* ge1031ov23428;
T0* ge1031ov23232;
T0* ge1031ov23574;
T0* ge1031ov23399;
T0* ge1031ov23172;
T0* ge1031ov23573;
T0* ge1031ov23171;
T0* ge1031ov23568;
T0* ge1031ov23398;
T0* ge1031ov23166;
T0* ge1031ov23570;
T0* ge1031ov23168;
T0* ge1031ov23506;
T0* ge1031ov23104;
T0* ge1031ov23727;
T0* ge1031ov23475;
T0* ge1031ov23325;
T0* ge1031ov23721;
T0* ge1031ov23319;
T0* ge1031ov23726;
T0* ge1031ov23324;
T0* ge1031ov23635;
T0* ge1031ov23233;
T0* ge1031ov23566;
T0* ge1031ov23164;
T0* ge1031ov23572;
T0* ge1031ov23170;
T0* ge1031ov23569;
T0* ge1031ov23167;
T0* ge1031ov23567;
T0* ge1031ov23165;
T0* ge1031ov23715;
T0* ge1031ov23468;
T0* ge1031ov23313;
T0* ge1031ov23716;
T0* ge1031ov23314;
T0* ge1031ov23614;
T0* ge1031ov23418;
T0* ge1031ov23212;
T0* ge1031ov23540;
T0* ge1031ov23383;
T0* ge1031ov23138;
T0* ge1031ov23541;
T0* ge1031ov23139;
T0* ge1031ov23524;
T0* ge1031ov23376;
T0* ge1031ov23122;
T0* ge1031ov23523;
T0* ge1031ov23121;
T0* ge1031ov23525;
T0* ge1031ov23123;
T0* ge1031ov23549;
T0* ge1031ov23387;
T0* ge1031ov23147;
T0* ge1031ov23538;
T0* ge1031ov23136;
T0* ge1031ov23539;
T0* ge1031ov23137;
T0* ge1031ov23646;
T0* ge1031ov23435;
T0* ge1031ov23244;
T0* ge1031ov23645;
T0* ge1031ov23243;
T0* ge1031ov23647;
T0* ge1031ov23436;
T0* ge1031ov23245;
T0* ge1031ov23553;
T0* ge1031ov23389;
T0* ge1031ov23151;
T0* ge1031ov23559;
T0* ge1031ov23393;
T0* ge1031ov23157;
T0* ge1031ov23638;
T0* ge1031ov23431;
T0* ge1031ov23236;
T0* ge1031ov23621;
T0* ge1031ov23421;
T0* ge1031ov23219;
T0* ge1031ov23648;
T0* ge1031ov23437;
T0* ge1031ov23246;
T0* ge1031ov23556;
T0* ge1031ov23391;
T0* ge1031ov23154;
T0* ge1031ov23563;
T0* ge1031ov23396;
T0* ge1031ov23161;
T0* ge1031ov23639;
T0* ge1031ov23432;
T0* ge1031ov23237;
T0* ge1031ov23637;
T0* ge1031ov23430;
T0* ge1031ov23235;
T0* ge1031ov23622;
T0* ge1031ov23422;
T0* ge1031ov23220;
T0* ge1031ov23640;
T0* ge1031ov23433;
T0* ge1031ov23238;
T0* ge836ov13179;
T0* ge1031ov23610;
T0* ge1031ov23417;
T0* ge1031ov23208;
T0* ge1031ov23611;
T0* ge1031ov23209;
T0* ge1031ov23602;
T0* ge1031ov23414;
T0* ge1031ov23200;
T0* ge1031ov23613;
T0* ge1031ov23211;
T0* ge1031ov23612;
T0* ge1031ov23210;
T0* ge1031ov23609;
T0* ge1031ov23416;
T0* ge1031ov23207;
T0* ge1031ov23579;
T0* ge1031ov23403;
T0* ge1031ov23177;
T0* ge1031ov23578;
T0* ge1031ov23402;
T0* ge1031ov23176;
T0* ge1031ov23577;
T0* ge1031ov23401;
T0* ge1031ov23175;
T0* ge1031ov23576;
T0* ge1031ov23400;
T0* ge1031ov23174;
T0* ge1031ov23575;
T0* ge1031ov23173;
T0* ge1031ov23512;
T0* ge1031ov23372;
T0* ge1031ov23110;
T0* ge1031ov23510;
T0* ge1031ov23371;
T0* ge1031ov23108;
T0* ge1031ov23585;
T0* ge1031ov23404;
T0* ge1031ov23183;
T0* ge1031ov23582;
T0* ge1031ov23180;
T0* ge1031ov23589;
T0* ge1031ov23405;
T0* ge1031ov23187;
T0* ge1031ov23586;
T0* ge1031ov23184;
T0* ge1031ov23583;
T0* ge1031ov23181;
T0* ge1031ov23590;
T0* ge1031ov23188;
T0* ge1031ov23587;
T0* ge1031ov23185;
T0* ge1031ov23584;
T0* ge1031ov23182;
T0* ge1031ov23591;
T0* ge1031ov23189;
T0* ge1031ov23704;
T0* ge1031ov23463;
T0* ge1031ov23302;
T0* ge1031ov23596;
T0* ge1031ov23409;
T0* ge1031ov23194;
T0* ge1031ov23595;
T0* ge1031ov23193;
T0* ge1031ov23581;
T0* ge1031ov23179;
T0* ge1031ov23580;
T0* ge1031ov23178;
T0* ge1031ov23588;
T0* ge1031ov23186;
T0* ge1031ov23594;
T0* ge1031ov23408;
T0* ge1031ov23192;
T0* ge1031ov23593;
T0* ge1031ov23407;
T0* ge1031ov23191;
T0* ge1031ov23592;
T0* ge1031ov23406;
T0* ge1031ov23190;
T0* ge1031ov23681;
T0* ge1031ov23456;
T0* ge1031ov23279;
T0* ge1031ov23679;
T0* ge1031ov23455;
T0* ge1031ov23277;
T0* ge1031ov23527;
T0* ge1031ov23377;
T0* ge1031ov23125;
T0* ge1031ov23644;
T0* ge1031ov23434;
T0* ge1031ov23242;
T0* ge1031ov23526;
T0* ge1031ov23124;
T0* ge1031ov23643;
T0* ge1031ov23241;
T0* ge1031ov23642;
T0* ge1031ov23240;
T0* ge1031ov23557;
T0* ge1031ov23392;
T0* ge1031ov23155;
T0* ge1031ov23555;
T0* ge1031ov23390;
T0* ge1031ov23153;
T0* ge1031ov23554;
T0* ge1031ov23152;
T0* ge1031ov23561;
T0* ge1031ov23394;
T0* ge1031ov23159;
T0* ge1031ov23560;
T0* ge1031ov23158;
T0* ge1031ov23562;
T0* ge1031ov23395;
T0* ge1031ov23160;
T0* ge1031ov23626;
T0* ge1031ov23423;
T0* ge1031ov23224;
T0* ge1031ov23625;
T0* ge1031ov23223;
T0* ge1031ov23624;
T0* ge1031ov23222;
T0* ge1031ov23623;
T0* ge1031ov23221;
T0* ge1031ov23627;
T0* ge1031ov23424;
T0* ge1031ov23225;
T0* ge1031ov23543;
T0* ge1031ov23384;
T0* ge1031ov23141;
T0* ge1031ov23542;
T0* ge1031ov23140;
T0* ge1031ov23548;
T0* ge1031ov23146;
T0* ge1031ov23545;
T0* ge1031ov23385;
T0* ge1031ov23143;
T0* ge1031ov23546;
T0* ge1031ov23144;
T0* ge1031ov23641;
T0* ge1031ov23239;
T0* ge1031ov23544;
T0* ge1031ov23142;
T0* ge1031ov23558;
T0* ge1031ov23156;
T0* ge1031ov23547;
T0* ge1031ov23386;
T0* ge1031ov23145;
T0* ge1031ov23552;
T0* ge1031ov23388;
T0* ge1031ov23150;
T0* ge1031ov23550;
T0* ge1031ov23148;
T0* ge1031ov23551;
T0* ge1031ov23149;
T0* ge1031ov23649;
T0* ge1031ov23438;
T0* ge1031ov23247;
T0* ge1031ov23616;
T0* ge1031ov23410;
T0* ge1031ov23214;
T0* ge1031ov23522;
T0* ge1031ov23375;
T0* ge1031ov23120;
T0* ge1031ov23520;
T0* ge1031ov23118;
T0* ge1031ov23514;
T0* ge1031ov23374;
T0* ge1031ov23112;
T0* ge1031ov23513;
T0* ge1031ov23373;
T0* ge1031ov23111;
T0* ge1031ov23743;
T0* ge1031ov23484;
T0* ge1031ov23341;
T0* ge1031ov23747;
T0* ge1031ov23488;
T0* ge1031ov23345;
T0* ge1031ov23713;
T0* ge1031ov23467;
T0* ge1031ov23311;
T0* ge1031ov23746;
T0* ge1031ov23487;
T0* ge1031ov23344;
T0* ge1031ov23615;
T0* ge1031ov23419;
T0* ge1031ov23213;
T0* ge1031ov23617;
T0* ge1031ov23215;
T0* ge1022ov31027;
T0* ge1022ov31025;
T0* ge1022ov31023;
T0* ge1021ov30942;
T0* ge1021ov30938;
T0* ge1021ov30934;
T0* ge1031ov23756;
T0* ge1031ov23496;
T0* ge1031ov23354;
T0* ge836ov13174;
T0* ge836ov13230;
T0* ge836ov13216;
T0* ge836ov13215;
T0* ge836ov13191;
T0* ge836ov13217;
T0* ge836ov13231;
T0* ge836ov13177;
T0* ge836ov13219;
T0* ge836ov13188;
T0* ge836ov13190;
T0* ge836ov13238;
T0* ge836ov13182;
T0* ge836ov13212;
T0* ge836ov13200;
T0* ge836ov13225;
T0* ge1031ov23709;
T0* ge1031ov23464;
T0* ge1031ov23307;
T0* ge1029ov30950;
T0* ge1029ov30949;
T0* ge1031ov23708;
T0* ge1031ov23306;
T0* ge836ov13236;
T0* ge836ov13208;
T0* ge836ov13194;
T0* ge836ov13224;
T0* ge836ov13211;
T0* ge836ov13175;
T0* ge836ov13205;
T0* ge836ov13220;
T0* ge836ov13337;
T0* ge836ov13339;
T0* ge836ov13338;
T0* ge1031ov23749;
T0* ge1031ov23490;
T0* ge1031ov23347;
T0* ge836ov13120;
T0* ge836ov13088;
T0* ge836ov13087;
T0* ge836ov13069;
T0* ge836ov13068;
T0* ge836ov13154;
T0* ge836ov13162;
T0* ge836ov13161;
T0* ge836ov13160;
T0* ge836ov13260;
T0* ge836ov13265;
T0* ge836ov13261;
T0* ge836ov13266;
T0* ge836ov13248;
T0* ge836ov13274;
T0* ge1031ov23748;
T0* ge1031ov23489;
T0* ge1031ov23346;
T0* ge836ov13144;
T0* ge836ov13060;
T0* ge836ov13064;
T0* ge836ov13063;
T0* ge836ov13062;
T0* ge836ov13059;
T0* ge836ov13061;
T0* ge836ov13053;
T0* ge836ov13052;
T0* ge836ov13051;
T0* ge836ov13050;
T0* ge836ov13057;
T0* ge836ov13056;
T0* ge836ov13055;
T0* ge836ov13054;
T0* ge836ov13159;
T0* ge836ov13158;
T0* ge836ov13157;
T0* ge836ov13153;
T0* ge836ov13152;
T0* ge836ov13262;
T0* ge836ov13247;
T0* ge836ov13142;
T0* ge836ov13140;
T0* ge836ov13139;
T0* ge836ov13119;
T0* ge836ov13118;
T0* ge836ov13117;
T0* ge836ov13115;
T0* ge836ov13114;
T0* ge836ov13109;
T0* ge836ov13097;
T0* ge836ov13096;
T0* ge836ov13095;
T0* ge836ov13094;
T0* ge836ov13071;
T0* ge836ov13070;
T0* ge836ov13066;
T0* ge836ov13145;
T0* ge836ov13138;
T0* ge836ov13137;
T0* ge836ov13136;
T0* ge836ov13135;
T0* ge836ov13134;
T0* ge836ov13133;
T0* ge836ov13132;
T0* ge836ov13131;
T0* ge836ov13130;
T0* ge836ov13129;
T0* ge836ov13128;
T0* ge836ov13127;
T0* ge836ov13126;
T0* ge836ov13125;
T0* ge836ov13124;
T0* ge836ov13166;
T0* ge836ov13104;
T0* ge836ov13141;
T0* ge836ov13121;
T0* ge836ov13098;
T0* ge836ov13081;
T0* ge836ov13072;
T0* ge836ov13065;
T0* ge836ov13107;
T0* ge836ov13106;
T0* ge836ov13105;
T0* ge836ov13102;
T0* ge836ov13100;
T0* ge836ov13083;
T0* ge836ov13082;
T0* ge836ov13084;
T0* ge836ov13049;
T0* ge836ov13048;
T0* ge836ov13093;
T0* ge836ov13155;
T0* ge836ov13239;
T0* ge836ov13213;
T0* ge836ov13203;
T0* ge836ov13218;
T0* ge836ov13178;
T0* ge836ov13116;
T0* ge836ov13074;
T0* ge836ov13058;
T0* ge836ov13046;
T0* ge836ov13085;
T0* ge836ov13123;
T0* ge836ov13112;
T0* ge836ov13164;
T0* ge836ov13113;
T0* ge836ov13092;
T0* ge836ov13091;
T0* ge836ov13089;
T0* ge836ov13078;
T0* ge836ov13099;
T0* ge836ov13149;
T0* ge836ov13150;
T0* ge836ov13090;
T0* ge836ov13075;
T0* ge836ov13143;
T0* ge836ov13148;
T0* ge836ov13163;
T0* ge836ov13076;
T0* ge836ov13147;
T0* ge836ov13209;
T0* ge836ov13234;
T0* ge836ov13199;
T0* ge836ov13184;
T0* ge836ov13186;
T0* ge836ov13221;
T0* ge836ov13176;
T0* ge836ov13196;
T0* ge836ov13223;
T0* ge1031ov23698;
T0* ge1031ov23461;
T0* ge1031ov23296;
T0* ge1031ov23691;
T0* ge1031ov23289;
T0* ge1031ov23690;
T0* ge1031ov23288;
T0* ge1031ov23689;
T0* ge1031ov23287;
T0* ge1031ov23694;
T0* ge1031ov23292;
T0* ge1031ov23696;
T0* ge1031ov23294;
T0* ge1031ov23755;
T0* ge1031ov23353;
T0* ge836ov13080;
T0* ge1031ov23754;
T0* ge1031ov23495;
T0* ge1031ov23352;
T0* ge1031ov23753;
T0* ge1031ov23494;
T0* ge1031ov23351;
T0* ge836ov13110;
T0* ge836ov13146;
T0* ge836ov13151;
T0* ge836ov13168;
T0* ge836ov13169;
T0* ge836ov13171;
T0* ge836ov13172;
T0* ge836ov13173;
T0* ge836ov13180;
T0* ge836ov13181;
T0* ge836ov13187;
T0* ge836ov13192;
T0* ge836ov13195;
T0* ge836ov13197;
T0* ge836ov13198;
T0* ge836ov13201;
T0* ge836ov13202;
T0* ge836ov13204;
T0* ge836ov13207;
T0* ge836ov13214;
T0* ge836ov13222;
T0* ge836ov13226;
T0* ge836ov13227;
T0* ge836ov13228;
T0* ge836ov13229;
T0* ge836ov13232;
T0* ge836ov13233;
T0* ge836ov13235;
T0* ge836ov13237;
T0* ge836ov13240;
T0* ge836ov13241;
T0* ge836ov13242;
T0* ge836ov13243;
T0* ge836ov13244;
T0* ge836ov13245;
T0* ge836ov13246;
T0* ge836ov13249;
T0* ge836ov13250;
T0* ge836ov13251;
T0* ge836ov13252;
T0* ge836ov13253;
T0* ge836ov13254;
T0* ge836ov13255;
T0* ge836ov13256;
T0* ge836ov13257;
T0* ge836ov13258;
T0* ge836ov13259;
T0* ge836ov13263;
T0* ge836ov13267;
T0* ge836ov13268;
T0* ge836ov13269;
T0* ge836ov13270;
T0* ge836ov13271;
T0* ge836ov13272;
T0* ge836ov13273;
T0* ge296ov12364;
T0* ge1043ov18665;
T0* ge1031ov23736;
T0* ge1031ov23479;
T0* ge1031ov23334;
T0* ge1031ov23711;
T0* ge1031ov23466;
T0* ge1031ov23309;
T0* ge1031ov23712;
T0* ge1031ov23310;
T0* ge1031ov23683;
T0* ge1031ov23457;
T0* ge1031ov23281;
T0* ge1031ov23684;
T0* ge1031ov23458;
T0* ge1031ov23282;
T0* ge1031ov23680;
T0* ge1031ov23278;
T0* ge1031ov23732;
T0* ge1031ov23477;
T0* ge1031ov23330;
T0* ge1032ov7505;
T0* ge1032ov7500;
T0* ge1032ov7501;
T0* ge1032ov7469;
T0* ge1032ov7471;
T0* ge1032ov7467;
T0* ge1032ov7470;
T0* ge1032ov7507;
T0* ge1032ov7504;
T0* ge1032ov7513;
T0* ge1032ov7419;
T0* ge1032ov7438;
T0* ge1031ov23517;
T0* ge1031ov23115;
T0* ge1031ov23620;
T0* ge1031ov23420;
T0* ge1031ov23218;
T0* ge1031ov23532;
T0* ge1031ov23380;
T0* ge1031ov23130;
T0* ge1031ov23531;
T0* ge1031ov23129;
T0* ge1031ov23530;
T0* ge1031ov23379;
T0* ge1031ov23128;
T0* ge1031ov23534;
T0* ge1031ov23132;
T0* ge1031ov23529;
T0* ge1031ov23378;
T0* ge1031ov23127;
T0* ge1031ov23724;
T0* ge1031ov23473;
T0* ge1031ov23322;
T0* ge1031ov23504;
T0* ge1031ov23366;
T0* ge1031ov23102;
T0* ge1031ov23661;
T0* ge1031ov23445;
T0* ge1031ov23259;
T0* ge1031ov23660;
T0* ge1031ov23258;
T0* ge1031ov23659;
T0* ge1031ov23444;
T0* ge1031ov23257;
T0* ge1031ov23658;
T0* ge1031ov23256;
T0* ge1031ov23657;
T0* ge1031ov23443;
T0* ge1031ov23255;
T0* ge1031ov23656;
T0* ge1031ov23254;
T0* ge1031ov23667;
T0* ge1031ov23446;
T0* ge1031ov23265;
T0* ge1031ov23665;
T0* ge1031ov23263;
T0* ge1031ov23664;
T0* ge1031ov23262;
T0* ge1031ov23686;
T0* ge1031ov23459;
T0* ge1031ov23284;
T0* ge1031ov23688;
T0* ge1031ov23460;
T0* ge1031ov23286;
T0* ge1031ov23678;
T0* ge1031ov23454;
T0* ge1031ov23276;
T0* ge1031ov23733;
T0* ge1031ov23331;
T0* ge1031ov23666;
T0* ge1031ov23264;
T0* ge1031ov23663;
T0* ge1031ov23261;
T0* ge1031ov23662;
T0* ge1031ov23260;
T0* ge1031ov23682;
T0* ge1031ov23280;
T0* ge1031ov23677;
T0* ge1031ov23275;
T0* ge1031ov23714;
T0* ge1031ov23312;
T0* ge1031ov23521;
T0* ge1031ov23119;
T0* ge1031ov23519;
T0* ge1031ov23117;
T0* ge1031ov23518;
T0* ge1031ov23116;
T0* ge1031ov23710;
T0* ge1031ov23465;
T0* ge1031ov23308;
T0* ge1031ov23757;
T0* ge1031ov23497;
T0* ge1031ov23355;
T0* ge1031ov23758;
T0* ge1031ov23356;
T0* ge1031ov23718;
T0* ge1031ov23470;
T0* ge1031ov23316;
T0* ge1031ov23717;
T0* ge1031ov23469;
T0* ge1031ov23315;
T0* ge1031ov23745;
T0* ge1031ov23486;
T0* ge1031ov23343;
T0* ge1031ov23735;
T0* ge1031ov23478;
T0* ge1031ov23333;
T0* ge1031ov23734;
T0* ge1031ov23332;
T0* ge1031ov23731;
T0* ge1031ov23476;
T0* ge1031ov23329;
T0* ge1031ov23730;
T0* ge1031ov23328;
T0* ge1031ov23729;
T0* ge1031ov23327;
T0* ge1031ov23728;
T0* ge1031ov23326;
T0* ge1031ov23738;
T0* ge1031ov23480;
T0* ge1031ov23336;
T0* ge1031ov23737;
T0* ge1031ov23335;
T0* ge1031ov23604;
T0* ge1031ov23202;
T0* ge1031ov23607;
T0* ge1031ov23415;
T0* ge1031ov23205;
T0* ge1031ov23597;
T0* ge1031ov23411;
T0* ge1031ov23195;
T0* ge1031ov23600;
T0* ge1031ov23413;
T0* ge1031ov23198;
T0* ge1031ov23603;
T0* ge1031ov23201;
T0* ge1031ov23673;
T0* ge1031ov23452;
T0* ge1031ov23271;
T0* ge1031ov23672;
T0* ge1031ov23451;
T0* ge1031ov23270;
T0* ge1031ov23671;
T0* ge1031ov23450;
T0* ge1031ov23269;
T0* ge1031ov23670;
T0* ge1031ov23449;
T0* ge1031ov23268;
T0* ge1031ov23669;
T0* ge1031ov23448;
T0* ge1031ov23267;
T0* ge1031ov23668;
T0* ge1031ov23447;
T0* ge1031ov23266;
T0* ge1031ov23674;
T0* ge1031ov23453;
T0* ge1031ov23272;
T0* ge1032ov7451;
T0* ge1032ov7452;
T0* ge1032ov7453;
T0* ge1032ov7454;
T0* ge1032ov7459;
T0* ge1032ov7460;
T0* ge1032ov7461;
T0* ge1032ov7462;
T0* ge1031ov23516;
T0* ge1031ov23114;
T0* ge1031ov23619;
T0* ge1031ov23217;
T0* ge1031ov23744;
T0* ge1031ov23485;
T0* ge1031ov23342;
T0* ge1031ov23707;
T0* ge1031ov23305;
T0* ge1031ov23706;
T0* ge1031ov23304;
T0* ge1031ov23515;
T0* ge1031ov23113;
T0* ge1031ov23618;
T0* ge1031ov23216;
T0* ge1031ov23705;
T0* ge1031ov23303;
T0* ge1031ov23701;
T0* ge1031ov23462;
T0* ge1031ov23299;
T0* ge1031ov23702;
T0* ge1031ov23300;
T0* ge1031ov23703;
T0* ge1031ov23301;
T0* ge1031ov23654;
T0* ge1031ov23441;
T0* ge1031ov23252;
T0* ge1031ov23655;
T0* ge1031ov23442;
T0* ge1031ov23253;
T0* ge1031ov23653;
T0* ge1031ov23251;
T0* ge1031ov23741;
T0* ge1031ov23482;
T0* ge1031ov23339;
T0* ge1031ov23739;
T0* ge1031ov23481;
T0* ge1031ov23337;
T0* ge1031ov23742;
T0* ge1031ov23483;
T0* ge1031ov23340;
T0* ge1032ov7475;
T0* ge1031ov23509;
T0* ge1031ov23370;
T0* ge1031ov23107;
T0* ge1031ov23508;
T0* ge1031ov23369;
T0* ge1031ov23106;
T0* ge1031ov23628;
T0* ge1031ov23425;
T0* ge1031ov23226;
T0* ge1031ov23564;
T0* ge1031ov23397;
T0* ge1031ov23162;
T0* ge1031ov23565;
T0* ge1031ov23163;
T0* ge1031ov23630;
T0* ge1031ov23426;
T0* ge1031ov23228;
T0* ge1031ov23631;
T0* ge1031ov23229;
T0* ge1031ov23629;
T0* ge1031ov23227;
T0* ge1031ov23632;
T0* ge1031ov23427;
T0* ge1031ov23230;
T0* ge1031ov23651;
T0* ge1031ov23440;
T0* ge1031ov23249;
T0* ge1031ov23652;
T0* ge1031ov23250;
T0* ge1031ov23650;
T0* ge1031ov23439;
T0* ge1031ov23248;
T0* ge1031ov23507;
T0* ge1031ov23368;
T0* ge1031ov23105;
T0* ge1032ov7508;
T0* ge1031ov23606;
T0* ge1031ov23204;
T0* ge1031ov23608;
T0* ge1031ov23206;
T0* ge1031ov23598;
T0* ge1031ov23196;
T0* ge1031ov23601;
T0* ge1031ov23199;
T0* ge1031ov23599;
T0* ge1031ov23412;
T0* ge1031ov23197;
T0* ge1031ov23605;
T0* ge1031ov23203;
T0* ge1031ov23528;
T0* ge1031ov23126;
T0* ge1031ov23633;
T0* ge1031ov23231;
T0* ge1021ov30941;
T0* ge1021ov30937;
T0* ge1021ov30933;
T0* ge315ov9864;
T0* ge313ov30731;
T0* ge337ov9902;
T0* ge337ov9903;
T0* ge325ov10075;
T0* ge325ov10074;
T0* ge340ov9902;
T0* ge340ov9903;
T0* ge1355ov10878;
T0* ge1336ov23834;
T0* ge1336ov23833;
T0* ge425ov9815;
T0* ge336ov9815;
T0* ge322ov9815;
T0* ge55ov4174;
T0* ge55ov4175;
T0* ge55ov4176;
T0* ge840ov25221;
T0* ge836ov13336;
T0* ge836ov13317;
T0* ge836ov13333;
T0* ge836ov13321;
T0* ge836ov13322;
T0* ge836ov13323;
T0* ge836ov13324;
T0* ge836ov13318;
T0* ge836ov13325;
T0* ge836ov13326;
T0* ge836ov13327;
T0* ge836ov13328;
T0* ge836ov13319;
T0* ge836ov13334;
T0* ge836ov13329;
T0* ge836ov13330;
T0* ge836ov13331;
T0* ge836ov13320;
T0* ge836ov13332;
T0* ge836ov13335;
T0* ge836ov13275;
T0* ge1403ov25075;
T0* ge1403ov25077;
T0* ge769ov12437;
T0* ge769ov12438;
T0* ge836ov13313;
T0* ge836ov13312;
T0* ge836ov13300;
T0* ge836ov13301;
T0* ge836ov13302;
T0* ge836ov13303;
T0* ge836ov13304;
T0* ge836ov13305;
T0* ge836ov13306;
T0* ge836ov13307;
T0* ge836ov13308;
T0* ge836ov13309;
T0* ge836ov13310;
T0* ge836ov13311;
T0* ge836ov13315;
T0* ge836ov13316;
T0* ge836ov13296;
T0* ge836ov13297;
T0* ge836ov13298;
T0* ge836ov13299;
T0* ge836ov13314;
T0* ge859ov25878;
T0* ge859ov25877;
T0* ge836ov13264;
T0* ge876ov27033;
T0* ge865ov25132;
T0* ge1131ov4124;
T0* ge226ov4124;
T0* ge225ov4124;
T0* ge1125ov4124;
T0* ge1141ov4124;
T0* ge1138ov4124;
T0* ge1137ov4124;
T0* ge1133ov4124;
T0* ge1140ov4124;
T0* ge1132ov4124;
T0* ge1144ov4124;
T0* ge1128ov4124;
T0* ge1139ov4124;
T0* ge1143ov4124;
T0* ge1135ov4124;
T0* ge1126ov4124;
T0* ge1134ov4124;
T0* ge220ov4124;
T0* ge223ov4124;
T0* ge230ov4124;
T0* ge219ov4124;
T0* ge333ov25671;
T0* ge318ov1905;
T0* geic2;
T0* geic3;
T0* geic4;

void GE_const_init()
{
	ge332ov9815 = (GE_ms8("\n", 1));
	ge292ov3051 = (GE_ms8("", 0));
	ge391ov25068 = (GE_ms8("", 0));
	ge381ov10613 = (GE_ms8("", 0));
	ge334ov9815 = (GE_ms8("\n", 1));
	ge1032ov7510 = (GE_ms8(".bat", 4));
	ge1032ov7515 = (GE_ms8(".sh", 3));
	ge314ov1925 = (GE_ms8("empty_name", 10));
	ge1284ov15639 = (GE_ms8("no pattern compiled", 19));
	ge1284ov15624 = (GE_ms8("unmatched parentheses", 21));
	ge1284ov15617 = (GE_ms8("back reference to non-existent subpattern", 41));
	ge1284ov15602 = (GE_ms8("compilation successfully", 24));
	ge1284ov15627 = (GE_ms8("lookbehind assertion is not fixed length", 40));
	ge1284ov15620 = (GE_ms8("missing ) after comment", 23));
	ge1284ov15628 = (GE_ms8("malformed number after (\?(", 26));
	ge1284ov15637 = (GE_ms8("invalid condition (\?(0)", 23));
	ge1284ov15630 = (GE_ms8("assertion expected after (\?(", 28));
	ge1284ov15626 = (GE_ms8("unrecognized character after (\?<", 32));
	ge1284ov15614 = (GE_ms8("unrecognized character after (\?", 31));
	ge1284ov15615 = (GE_ms8("too many capturing parenthesized sub-patterns", 45));
	ge1284ov15629 = (GE_ms8("conditional group contains more than two branches", 49));
	ge1284ov15616 = (GE_ms8("missing )", 9));
	ge1284ov15603 = (GE_ms8("\\ at end of pattern", 19));
	ge1284ov15604 = (GE_ms8("\\c at end of pattern", 20));
	ge1284ov15605 = (GE_ms8("unrecognized character follows \\", 32));
	ge1284ov15611 = (GE_ms8("nothing to repeat", 17));
	ge1284ov15613 = (GE_ms8("internal error: unexpected repeat", 33));
	ge1284ov15608 = (GE_ms8("missing terminating ] for character class", 41));
	ge1284ov15633 = (GE_ms8("POSIX collating elements are not supported", 42));
	ge1284ov15632 = (GE_ms8("unknown POSIX class name", 24));
	ge1284ov15609 = (GE_ms8("invalid escape sequence in character class", 42));
	ge1284ov15610 = (GE_ms8("range out of order in character class", 37));
	ge1284ov15607 = (GE_ms8("number too big in {} quantifier", 31));
	ge1284ov15606 = (GE_ms8("numbers out of order in {} quantifier", 37));
	ge1280ov15397 = (GE_ms8("", 0));
	ge1032ov7512 = (GE_ms8(".cfg", 4));
	ge1032ov7514 = (GE_ms8(".h", 2));
	ge1032ov7388 = (GE_ms8("#define", 7));
	ge1032ov7420 = (GE_ms8("EIF_TRACE", 9));
	ge1032ov7397 = (GE_ms8("EIF_EXCEPTION_TRACE", 19));
	ge1032ov7392 = (GE_ms8("EIF_BOEHM_GC", 12));
	ge1032ov7480 = (GE_ms8("#include", 8));
	ge836ov13108 = (GE_ms8("item", 4));
	ge836ov13067 = (GE_ms8("call", 4));
	ge836ov13193 = (GE_ms8("end", 3));
	ge1032ov7478 = (GE_ms8("#ifdef", 6));
	ge1032ov7425 = (GE_ms8("EIF_WINDOWS", 11));
	ge1032ov7427 = (GE_ms8("#endif", 6));
	ge1032ov7495 = (GE_ms8("return", 6));
	ge1032ov7448 = (GE_ms8("GE_dts", 6));
	ge1032ov7442 = (GE_ms8("GE_catcall", 10));
	ge1032ov7383 = (GE_ms8("->", 2));
	ge1032ov7474 = (GE_ms8("GE_void", 7));
	ge1032ov7440 = (GE_ms8("GE_boxed", 8));
	ge836ov13086 = (GE_ms8("equal_objects", 13));
	ge836ov13019 = (GE_ms8("KL_ANY_ROUTINES", 15));
	ge836ov13167 = (GE_ms8("Current", 7));
	ge1026ov22832 = (GE_ms8("giaaa", 5));
	ge1026ov22831 = (GE_ms8("GIAAA", 5));
	ge1026ov22830 = (GE_ms8("[$1] internal error.", 20));
	ge836ov13185 = (GE_ms8("create", 6));
	ge1032ov7472 = (GE_ms8("GE_show_console", 15));
	ge1032ov7429 = (GE_ms8("extern", 6));
	ge1032ov7422 = (GE_ms8("EIF_TYPE", 8));
	ge1032ov7473 = (GE_ms8("GE_types", 8));
	ge1032ov7398 = (GE_ms8("EIF_FALSE", 9));
	ge1032ov7421 = (GE_ms8("EIF_TRUE", 8));
	ge1032ov7482 = (GE_ms8("int", 3));
	ge1032ov7506 = (GE_ms8("void", 4));
	ge1032ov7444 = (GE_ms8("GE_const_init", 13));
	ge1032ov7446 = (GE_ms8("GE_deep_twin", 12));
	ge1032ov7445 = (GE_ms8("GE_deep", 7));
	ge1032ov7499 = (GE_ms8("switch", 6));
	ge1032ov7385 = (GE_ms8("case", 4));
	ge1032ov7447 = (GE_ms8("GE_default", 10));
	ge1032ov7477 = (GE_ms8("if", 2));
	ge1032ov7426 = (GE_ms8("else", 4));
	ge1032ov7476 = (GE_ms8("id", 2));
	ge1032ov7463 = (GE_ms8("GE_new", 6));
	ge1032ov7489 = (GE_ms8("memcpy", 6));
	ge1032ov7496 = (GE_ms8("sizeof", 6));
	ge1032ov7431 = (GE_ms8("for", 3));
	ge836ov13170 = (GE_ms8("Result", 6));
	ge1032ov7458 = (GE_ms8("GE_mt", 5));
	ge1032ov7439 = (GE_ms8("GE_bma", 6));
	ge1032ov7455 = (GE_ms8("GE_ma", 5));
	ge1032ov7441 = (GE_ms8("GE_call", 7));
	ge1032ov7381 = (GE_ms8("ac", 2));
	ge1032ov7384 = (GE_ms8("break", 5));
	ge1032ov7387 = (GE_ms8("default", 7));
	ge1032ov7465 = (GE_ms8("GE_object_id_free", 17));
	ge1032ov7432 = (GE_ms8("fprintf", 7));
	ge1032ov7497 = (GE_ms8("stderr", 6));
	ge1032ov7502 = (GE_ms8("type_id", 7));
	ge1032ov7457 = (GE_ms8("GE_ms32", 7));
	ge1032ov7456 = (GE_ms8("GE_ms8", 6));
	ge1032ov7466 = (GE_ms8("GE_power", 8));
	ge1032ov7389 = (GE_ms8("double", 6));
	ge1032ov7449 = (GE_ms8("GE_floor", 8));
	ge1032ov7443 = (GE_ms8("GE_ceiling", 10));
	ge1032ov7386 = (GE_ms8("char", 4));
	ge1032ov7395 = (GE_ms8("EIF_CHARACTER_32", 16));
	ge1032ov7416 = (GE_ms8("EIF_REAL_32", 11));
	ge1032ov7414 = (GE_ms8("EIF_POINTER", 11));
	ge1032ov7407 = (GE_ms8("EIF_IS_WINDOWS", 14));
	ge1032ov7406 = (GE_ms8("EIF_IS_VMS", 10));
	ge1032ov7405 = (GE_ms8("EIF_IS_UNIX", 11));
	ge1032ov7404 = (GE_ms8("EIF_IS_MAC", 10));
	ge1032ov7402 = (GE_ms8("EIF_INTEGER_32", 14));
	ge1032ov7417 = (GE_ms8("EIF_REAL_64", 11));
	ge1032ov7394 = (GE_ms8("EIF_CHARACTER_8", 15));
	ge1032ov7391 = (GE_ms8("EIF_BOOLEAN", 11));
	ge1032ov7464 = (GE_ms8("GE_object_id", 12));
	ge1032ov7450 = (GE_ms8("GE_id_object", 12));
	ge1032ov7437 = (GE_ms8("GE_argc", 7));
	ge1032ov7488 = (GE_ms8("memcmp", 6));
	ge836ov13101 = (GE_ms8("is_equal", 8));
	ge1032ov7494 = (GE_ms8("||", 2));
	ge1032ov7491 = (GE_ms8("!", 1));
	ge1032ov7492 = (GE_ms8("!=", 2));
	ge1032ov7382 = (GE_ms8("&&", 2));
	ge1032ov7493 = (GE_ms8("", 0));
	ge1032ov7428 = (GE_ms8("==", 2));
	ge1032ov7423 = (GE_ms8("EIF_VOID", 8));
	ge836ov13041 = (GE_ms8("TUPLE", 5));
	ge1032ov7481 = (GE_ms8("initialize", 10));
	ge1032ov7433 = (GE_ms8("GE_alloc", 8));
	ge1032ov7434 = (GE_ms8("GE_alloc_atomic", 15));
	ge1032ov7479 = (GE_ms8("#ifndef", 7));
	ge1032ov7435 = (GE_ms8("GE_alloc_cleared", 16));
	ge1032ov7436 = (GE_ms8("GE_alloc_atomic_cleared", 23));
	ge1032ov7490 = (GE_ms8("memset", 6));
	ge1032ov7468 = (GE_ms8("GE_register_dispose", 19));
	ge1032ov7511 = (GE_ms8(".c", 2));
	ge1032ov7390 = (GE_ms8("EIF_ANY", 7));
	ge1032ov7503 = (GE_ms8("typedef", 7));
	ge1032ov7498 = (GE_ms8("struct", 6));
	ge1032ov7399 = (GE_ms8("EIF_INTEGER", 11));
	ge1032ov7487 = (GE_ms8("is_special", 10));
	ge1032ov7412 = (GE_ms8("EIF_NATURAL_64", 14));
	ge1032ov7411 = (GE_ms8("EIF_NATURAL_32", 14));
	ge1032ov7410 = (GE_ms8("EIF_NATURAL_16", 14));
	ge1032ov7409 = (GE_ms8("EIF_NATURAL_8", 13));
	ge1032ov7403 = (GE_ms8("EIF_INTEGER_64", 14));
	ge1032ov7401 = (GE_ms8("EIF_INTEGER_16", 14));
	ge1032ov7400 = (GE_ms8("EIF_INTEGER_8", 13));
	ge1032ov7396 = (GE_ms8("EIF_DOUBLE", 10));
	ge836ov13010 = (GE_ms8("DOUBLE", 6));
	ge1032ov7415 = (GE_ms8("EIF_REAL", 8));
	ge836ov13031 = (GE_ms8("REAL", 4));
	ge1032ov7408 = (GE_ms8("EIF_NATURAL", 11));
	ge836ov13021 = (GE_ms8("NATURAL", 7));
	ge836ov13014 = (GE_ms8("INTEGER", 7));
	ge1032ov7424 = (GE_ms8("EIF_WIDE_CHAR", 13));
	ge836ov13044 = (GE_ms8("WIDE_CHARACTER", 14));
	ge1032ov7393 = (GE_ms8("EIF_CHARACTER", 13));
	ge836ov13007 = (GE_ms8("CHARACTER", 9));
	ge836ov13189 = (GE_ms8("deferred", 8));
	ge836ov13183 = (GE_ms8("class", 5));
	ge836ov13045 = (GE_ms8("*UNKNOWN*", 9));
	ge1030ov22820 = (GE_ms8("gvsrc5a", 7));
	ge1030ov22814 = (GE_ms8("GVSRC5", 6));
	ge1030ov22808 = (GE_ms8("[$1] root creation procedure `$3\' is not a feature of root class $2.", 68));
	ge1030ov22816 = (GE_ms8("vsrc1a", 6));
	ge1030ov22810 = (GE_ms8("VSRC1", 5));
	ge1030ov22804 = (GE_ms8("[$1] root class $2 should not be generic.", 41));
	ge1030ov22819 = (GE_ms8("gvsrc4a", 7));
	ge1030ov22813 = (GE_ms8("GVSRC4", 6));
	ge1030ov22807 = (GE_ms8("[$1] unknown root class $2.", 27));
	ge1030ov22821 = (GE_ms8("gvsrc6a", 7));
	ge1030ov22815 = (GE_ms8("GVSRC6", 6));
	ge1030ov22809 = (GE_ms8("[$1] root creation procedure `$3\' is not declared as publicly available creation procedure in root class $2.", 108));
	ge836ov13079 = (GE_ms8("default_create", 14));
	ge1030ov22818 = (GE_ms8("gvsrc3a", 7));
	ge1030ov22812 = (GE_ms8("GVSRC3", 6));
	ge1030ov22806 = (GE_ms8("[$1] missing root class.", 24));
	ge836ov13103 = (GE_ms8("is_target_closed", 16));
	ge836ov13073 = (GE_ms8("closed_operands", 15));
	ge836ov13156 = (GE_ms8("to_pointer", 10));
	ge836ov13122 = (GE_ms8("pointer_item", 12));
	ge836ov13165 = (GE_ms8("upper", 5));
	ge836ov13111 = (GE_ms8("lower", 5));
	ge836ov13077 = (GE_ms8("count", 5));
	ge1031ov23752 = (GE_ms8("gvkfe3a", 7));
	ge1031ov23493 = (GE_ms8("GVKFE-3", 7));
	ge1031ov23350 = (GE_ms8("attribute `$7\' in kernel class $5 has not the expected type \'$8\'.", 65));
	ge1031ov23750 = (GE_ms8("gvkfe1a", 7));
	ge1031ov23491 = (GE_ms8("GVKFE-1", 7));
	ge1031ov23348 = (GE_ms8("feature `$7\' is missing in kernel class $5.", 43));
	ge1031ov23751 = (GE_ms8("gvkfe2a", 7));
	ge1031ov23492 = (GE_ms8("GVKFE-2", 7));
	ge1031ov23349 = (GE_ms8("feature `$7\' in kernel class $5 is not an attribute.", 52));
	ge836ov13047 = (GE_ms8("area", 4));
	ge1030ov22817 = (GE_ms8("gvknl1a", 7));
	ge1030ov22811 = (GE_ms8("GVKNL1", 6));
	ge1030ov22805 = (GE_ms8("[$1] missing kernel class $2.", 29));
	ge836ov13295 = (GE_ms8("WIDE_CHARACTER_REF", 18));
	ge836ov13036 = (GE_ms8("STRING", 6));
	ge836ov13292 = (GE_ms8("REAL_REF", 8));
	ge836ov13286 = (GE_ms8("NATURAL_REF", 11));
	ge836ov13281 = (GE_ms8("INTEGER_REF", 11));
	ge836ov13280 = (GE_ms8("DOUBLE_REF", 10));
	ge836ov13277 = (GE_ms8("CHARACTER_REF", 13));
	ge836ov13043 = (GE_ms8("TYPED_POINTER", 13));
	ge836ov13042 = (GE_ms8("TYPE", 4));
	ge836ov13040 = (GE_ms8("SYSTEM_STRING", 13));
	ge836ov13206 = (GE_ms8("inherit", 7));
	ge836ov13039 = (GE_ms8("SYSTEM_OBJECT", 13));
	ge836ov13038 = (GE_ms8("STRING_32", 9));
	ge836ov13037 = (GE_ms8("STRING_8", 8));
	ge836ov13035 = (GE_ms8("SPECIAL", 7));
	ge836ov13034 = (GE_ms8("ROUTINE", 7));
	ge836ov13294 = (GE_ms8("REAL_64_REF", 11));
	ge836ov13033 = (GE_ms8("REAL_64", 7));
	ge836ov13293 = (GE_ms8("REAL_32_REF", 11));
	ge836ov13032 = (GE_ms8("REAL_32", 7));
	ge836ov13030 = (GE_ms8("PROCEDURE", 9));
	ge836ov13029 = (GE_ms8("PREDICATE", 9));
	ge836ov13291 = (GE_ms8("POINTER_REF", 11));
	ge836ov13028 = (GE_ms8("POINTER", 7));
	ge836ov13027 = (GE_ms8("PLATFORM", 8));
	ge836ov13026 = (GE_ms8("NONE", 4));
	ge836ov13290 = (GE_ms8("NATURAL_64_REF", 14));
	ge836ov13025 = (GE_ms8("NATURAL_64", 10));
	ge836ov13289 = (GE_ms8("NATURAL_32_REF", 14));
	ge836ov13024 = (GE_ms8("NATURAL_32", 10));
	ge836ov13288 = (GE_ms8("NATURAL_16_REF", 14));
	ge836ov13023 = (GE_ms8("NATURAL_16", 10));
	ge836ov13287 = (GE_ms8("NATURAL_8_REF", 13));
	ge836ov13022 = (GE_ms8("NATURAL_8", 9));
	ge836ov13020 = (GE_ms8("NATIVE_ARRAY", 12));
	ge836ov13285 = (GE_ms8("INTEGER_64_REF", 14));
	ge836ov13018 = (GE_ms8("INTEGER_64", 10));
	ge836ov13284 = (GE_ms8("INTEGER_32_REF", 14));
	ge836ov13017 = (GE_ms8("INTEGER_32", 10));
	ge836ov13283 = (GE_ms8("INTEGER_16_REF", 14));
	ge836ov13016 = (GE_ms8("INTEGER_16", 10));
	ge836ov13282 = (GE_ms8("INTEGER_8_REF", 13));
	ge836ov13015 = (GE_ms8("INTEGER_8", 9));
	ge836ov13013 = (GE_ms8("IDENTIFIED_ROUTINES", 19));
	ge836ov13012 = (GE_ms8("FUNCTION", 8));
	ge836ov13011 = (GE_ms8("DISPOSABLE", 10));
	ge836ov13279 = (GE_ms8("CHARACTER_32_REF", 16));
	ge836ov13009 = (GE_ms8("CHARACTER_32", 12));
	ge836ov13278 = (GE_ms8("CHARACTER_8_REF", 15));
	ge836ov13008 = (GE_ms8("CHARACTER_8", 11));
	ge836ov13276 = (GE_ms8("BOOLEAN_REF", 11));
	ge836ov13006 = (GE_ms8("BOOLEAN", 7));
	ge836ov13005 = (GE_ms8("BIT", 3));
	ge836ov13003 = (GE_ms8("ARGUMENTS", 9));
	ge836ov13002 = (GE_ms8("ANY", 3));
	ge836ov13004 = (GE_ms8("ARRAY", 5));
	ge1104ov5333 = (GE_ms8("system", 6));
	ge1398ov11101 = (GE_ms8("undefined", 9));
	ge1398ov11100 = (GE_ms8("(TRUNCATED)", 11));
	ge1104ov5336 = (GE_ms8("uuid", 4));
	ge1104ov5328 = (GE_ms8("name", 4));
	ge1104ov5334 = (GE_ms8("target", 6));
	ge1104ov5323 = (GE_ms8("library_target", 14));
	ge1104ov5311 = (GE_ms8("cluster", 7));
	ge1104ov5322 = (GE_ms8("library", 7));
	ge1104ov5320 = (GE_ms8("file_rule", 9));
	ge1104ov5332 = (GE_ms8("root", 4));
	ge1104ov5338 = (GE_ms8("variable", 8));
	ge1104ov5337 = (GE_ms8("value", 5));
	ge1104ov5310 = (GE_ms8("class", 5));
	ge1104ov5319 = (GE_ms8("feature", 7));
	ge1104ov5317 = (GE_ms8("exclude", 7));
	ge1104ov5321 = (GE_ms8("include", 7));
	ge1104ov5313 = (GE_ms8("condition", 9));
	ge1104ov5330 = (GE_ms8("platform", 8));
	ge1104ov5309 = (GE_ms8("build", 5));
	ge1104ov5327 = (GE_ms8("multithreaded", 13));
	ge1104ov5315 = (GE_ms8("dotnet", 6));
	ge1104ov5316 = (GE_ms8("dynamic_runtime", 15));
	ge1104ov5314 = (GE_ms8("custom", 6));
	ge1104ov5339 = (GE_ms8("version", 7));
	ge1104ov5324 = (GE_ms8("min", 3));
	ge1104ov5325 = (GE_ms8("max", 3));
	ge1104ov5335 = (GE_ms8("type", 4));
	ge1104ov5312 = (GE_ms8("compiler", 8));
	ge1104ov5326 = (GE_ms8("msil_clr", 8));
	ge1104ov5318 = (GE_ms8("excluded_value", 14));
	ge1107ov5308 = (GE_ms8("false", 5));
	ge1107ov5307 = (GE_ms8("true", 4));
	ge1104ov5329 = (GE_ms8("location", 8));
	ge1104ov5331 = (GE_ms8("recursive", 9));
	ge1405ov11637 = (GE_ms8("PE reference only allowed in DTD", 32));
	ge1405ov11599 = (GE_ms8("< not allowed in attribute value", 32));
	ge1405ov11597 = (GE_ms8("-- not allowed in comment", 25));
	ge1405ov11638 = (GE_ms8("xml prefix reserved in processing instruction", 45));
	ge1405ov11610 = (GE_ms8("Misformed XML Declaration", 25));
	ge1405ov11609 = (GE_ms8("Misplaced markup declaration", 28));
	ge1405ov11620 = (GE_ms8("End tag does not match start tag", 32));
	ge1405ov11614 = (GE_ms8("Missing element end tag", 23));
	ge1405ov11613 = (GE_ms8("Error in element content", 24));
	ge1405ov11612 = (GE_ms8("Misformed start tag", 19));
	ge1405ov11618 = (GE_ms8("Attribute declared twice", 24));
	ge1405ov11617 = (GE_ms8("Misformed attribute in tag", 26));
	ge1405ov11619 = (GE_ms8("Error in end tag", 16));
	ge1405ov11596 = (GE_ms8("]]> not allowed in content", 26));
	ge1405ov11622 = (GE_ms8("Error in XML declaration", 24));
	ge1405ov11631 = (GE_ms8("Misformed element type declaration", 34));
	ge1408ov11452 = (GE_ms8("*", 1));
	ge1408ov11450 = (GE_ms8("+", 1));
	ge1408ov11451 = (GE_ms8("\?", 1));
	ge1405ov11632 = (GE_ms8("Misformed attribute list declaration", 36));
	ge1405ov11633 = (GE_ms8("Misformed attribute definition declaration", 42));
	ge1405ov11636 = (GE_ms8("Misformed conditional section", 29));
	ge1405ov11634 = (GE_ms8("Misformed entity declaration", 28));
	ge1405ov11635 = (GE_ms8("Misformed entity notation", 25));
	ge1405ov11629 = (GE_ms8("Parser is not configured to support external DTDs", 49));
	ge1401ov24280 = (GE_ms8("1.0", 3));
	ge1401ov24281 = (GE_ms8("utf-8", 5));
	ge1405ov11602 = (GE_ms8("unsupported character encoding", 30));
	ge1405ov11625 = (GE_ms8("External reference in quoted value", 34));
	ge1405ov11645 = (GE_ms8("Unexpected non-ASCII character in ASCII-only mode", 49));
	ge1405ov11646 = (GE_ms8("Unexpected non-latin1 character in latin1-only mode", 51));
	ge1405ov11647 = (GE_ms8("Invalid UTF8 character sequence", 31));
	ge1405ov11640 = (GE_ms8("Name misformed", 14));
	ge1405ov11623 = (GE_ms8("Literal entity expected in attribute", 36));
	ge1405ov11624 = (GE_ms8("Entity is not defined", 21));
	ge1405ov11626 = (GE_ms8("Entity cannot be recursively included", 37));
	ge1405ov11630 = (GE_ms8("Undefined PE entity", 19));
	ge1122ov4271 = (GE_ms8("abstract", 8));
	ge1122ov4272 = (GE_ms8("address_expression", 18));
	ge1122ov4273 = (GE_ms8("arguments", 9));
	ge1122ov4274 = (GE_ms8("array_optimization", 18));
	ge1122ov4275 = (GE_ms8("assembly", 8));
	ge1122ov4276 = (GE_ms8("assertion", 9));
	ge1122ov4277 = (GE_ms8("automatic_backup", 16));
	ge1122ov4278 = (GE_ms8("callback", 8));
	ge1122ov4279 = (GE_ms8("case_insensitive", 16));
	ge1122ov4280 = (GE_ms8("check_generic_creation_constraint", 33));
	ge1122ov4281 = (GE_ms8("check_vape", 10));
	ge1122ov4282 = (GE_ms8("clean", 5));
	ge1122ov4283 = (GE_ms8("cls_compliant", 13));
	ge1122ov4284 = (GE_ms8("component", 9));
	ge1122ov4285 = (GE_ms8("console_application", 19));
	ge1122ov4286 = (GE_ms8("create_keyword_extension", 24));
	ge1122ov4287 = (GE_ms8("culture", 7));
	ge1122ov4288 = (GE_ms8("c_compiler_options", 18));
	ge1122ov4289 = (GE_ms8("dead_code_removal", 17));
	ge1122ov4290 = (GE_ms8("debug", 5));
	ge1122ov4291 = (GE_ms8("debug_tag", 9));
	ge1122ov4292 = (GE_ms8("debugger", 8));
	ge1122ov4293 = (GE_ms8("document", 8));
	ge1122ov4294 = (GE_ms8("dotnet_naming_convention", 24));
	ge1122ov4295 = (GE_ms8("dynamic_runtime", 15));
	ge1122ov4296 = (GE_ms8("ecf_library", 11));
	ge1122ov4297 = (GE_ms8("enforce_unique_class_names", 26));
	ge1122ov4298 = (GE_ms8("exception_trace", 15));
	ge1122ov4299 = (GE_ms8("exclude", 7));
	ge1122ov4300 = (GE_ms8("export", 6));
	ge1122ov4301 = (GE_ms8("external_runtime", 16));
	ge1122ov4302 = (GE_ms8("finalize", 8));
	ge1122ov4303 = (GE_ms8("flat_fst_optimization", 21));
	ge1122ov4304 = (GE_ms8("force_32bits", 12));
	ge1122ov4305 = (GE_ms8("fst_expansion_factor", 20));
	ge1122ov4306 = (GE_ms8("fst_optimization", 16));
	ge1122ov4307 = (GE_ms8("full_class_checking", 19));
	ge1122ov4308 = (GE_ms8("garbage_collector", 17));
	ge1122ov4309 = (GE_ms8("gc_info", 7));
	ge1122ov4310 = (GE_ms8("heap_size", 9));
	ge1122ov4311 = (GE_ms8("header", 6));
	ge1122ov4312 = (GE_ms8("high_memory_compiler", 20));
	ge1122ov4313 = (GE_ms8("il_verifiable", 13));
	ge1122ov4314 = (GE_ms8("include", 7));
	ge1122ov4315 = (GE_ms8("inlining", 8));
	ge1122ov4316 = (GE_ms8("inlining_size", 13));
	ge1122ov4317 = (GE_ms8("jumps_optimization", 18));
	ge1122ov4318 = (GE_ms8("layout", 6));
	ge1122ov4319 = (GE_ms8("layout_optimization", 19));
	ge1122ov4320 = (GE_ms8("leaves_optimization", 19));
	ge1122ov4321 = (GE_ms8("line_generation", 15));
	ge1122ov4322 = (GE_ms8("link", 4));
	ge1122ov4323 = (GE_ms8("linker", 6));
	ge1122ov4324 = (GE_ms8("linux_fpu_double_precision", 26));
	ge1122ov4325 = (GE_ms8("manifest_string_trace", 21));
	ge1122ov4326 = (GE_ms8("map", 3));
	ge1122ov4327 = (GE_ms8("metadata_cache_path", 19));
	ge1122ov4328 = (GE_ms8("msil_assembly_compatibility", 27));
	ge1122ov4329 = (GE_ms8("msil_classes_per_module", 23));
	ge1122ov4330 = (GE_ms8("msil_clr_version", 16));
	ge1122ov4331 = (GE_ms8("msil_culture", 12));
	ge1122ov4332 = (GE_ms8("msil_generation", 15));
	ge1122ov4333 = (GE_ms8("msil_generation_version", 23));
	ge1122ov4334 = (GE_ms8("msil_key_file_name", 18));
	ge1122ov4335 = (GE_ms8("msil_use_optimized_precompile", 29));
	ge1122ov4336 = (GE_ms8("multithreaded", 13));
	ge1122ov4337 = (GE_ms8("namespace", 9));
	ge1122ov4338 = (GE_ms8("no_default_lib", 14));
	ge1122ov4339 = (GE_ms8("old_verbatim_strings", 20));
	ge1122ov4340 = (GE_ms8("override_cluster", 16));
	ge1122ov4341 = (GE_ms8("portable_code_generation", 24));
	ge1122ov4342 = (GE_ms8("precompiled", 11));
	ge1122ov4343 = (GE_ms8("prefix", 6));
	ge1122ov4344 = (GE_ms8("profile", 7));
	ge1122ov4345 = (GE_ms8("public_key_token", 16));
	ge1122ov4346 = (GE_ms8("read_only", 9));
	ge1122ov4347 = (GE_ms8("recursive", 9));
	ge1122ov4348 = (GE_ms8("reloads_optimization", 20));
	ge1122ov4349 = (GE_ms8("shared_library_definition", 25));
	ge1122ov4350 = (GE_ms8("split", 5));
	ge1122ov4351 = (GE_ms8("stack_size", 10));
	ge1122ov4352 = (GE_ms8("storable", 8));
	ge1122ov4353 = (GE_ms8("storable_filename", 17));
	ge1122ov4354 = (GE_ms8("strip", 5));
	ge1122ov4355 = (GE_ms8("target", 6));
	ge1122ov4356 = (GE_ms8("trace", 5));
	ge1122ov4357 = (GE_ms8("use_cluster_name_as_namespace", 29));
	ge1122ov4358 = (GE_ms8("use_full_cluster_name_as_namespace", 34));
	ge1122ov4359 = (GE_ms8("verbose", 7));
	ge1122ov4360 = (GE_ms8("version", 7));
	ge1122ov4361 = (GE_ms8("visible_filename", 16));
	ge1122ov4362 = (GE_ms8("warning", 7));
	ge1122ov4363 = (GE_ms8("wedit", 5));
	ge1122ov4461 = (GE_ms8("boehm", 5));
	ge1122ov4472 = (GE_ms8("internal", 8));
	ge1153ov4238 = (GE_ms8("", 0));
	ge1122ov4481 = (GE_ms8("require", 7));
	ge1122ov4468 = (GE_ms8("ensure", 6));
	ge1122ov4473 = (GE_ms8("invariant", 9));
	ge1122ov4474 = (GE_ms8("loop_invariant", 14));
	ge1122ov4475 = (GE_ms8("loop_variant", 12));
	ge1122ov4462 = (GE_ms8("check", 5));
	ge1122ov4479 = (GE_ms8("none", 4));
	ge1122ov4483 = (GE_ms8("style", 5));
	ge1122ov4466 = (GE_ms8("default", 7));
	ge1122ov4458 = (GE_ms8("all", 3));
	ge1122ov4469 = (GE_ms8("exe", 3));
	ge1122ov4467 = (GE_ms8("dll", 3));
	ge1122ov4464 = (GE_ms8("com", 3));
	ge1122ov4478 = (GE_ms8("no_main", 7));
	ge1122ov4477 = (GE_ms8("microsoft", 9));
	ge1122ov4460 = (GE_ms8("auto", 4));
	ge1122ov4482 = (GE_ms8("sequential", 10));
	ge1122ov4459 = (GE_ms8("array", 5));
	ge1122ov4465 = (GE_ms8("constant", 8));
	ge1122ov4480 = (GE_ms8("once", 4));
	ge1122ov4476 = (GE_ms8("low_level", 9));
	ge1122ov4470 = (GE_ms8("feature", 7));
	ge1122ov4463 = (GE_ms8("class", 5));
	ge1122ov4486 = (GE_ms8("winapi", 6));
	ge1122ov4471 = (GE_ms8("generate", 8));
	ge1122ov4484 = (GE_ms8("supplier_precondition", 21));
	ge1153ov4237 = (GE_ms8("false", 5));
	ge1153ov4236 = (GE_ms8("true", 4));
	ge1112ov18180 = (GE_ms8("", 0));
	ge1118ov17229 = (GE_ms8("", 0));
	ge1197ov5074 = (GE_ms8(" \t\r\n", 4));
	ge57ov4108 = (GE_ms8("The value \'$2\' is not valid for the option \'$1\'.", 48));
	ge57ov4115 = (GE_ms8("APIPAR", 6));
	ge55ov4173 = (GE_ms8("usage: ", 7));
	ge352ov1781 = (GE_ms8("3.8", 3));
	ge54ov3692 = (GE_ms8("Errors parsing arguments, aborting.", 35));
	ge57ov4111 = (GE_ms8("Too many occurrences of option \'$1\'.", 36));
	ge57ov4118 = (GE_ms8("APSOPT", 6));
	ge57ov4109 = (GE_ms8("The mandatory option \'$1\' is missing.", 37));
	ge57ov4116 = (GE_ms8("APMOPT", 6));
	ge57ov4110 = (GE_ms8("The option \'$1\' is missing a parameter.", 39));
	ge57ov4117 = (GE_ms8("APMPAR", 6));
	ge57ov4112 = (GE_ms8("Unknown option \'$1\'.", 20));
	ge57ov4119 = (GE_ms8("APUOPT", 6));
	ge57ov4113 = (GE_ms8("The flag \'$1\' was given the parameter \'$2\'.", 43));
	ge57ov4120 = (GE_ms8("APUPAR", 6));
	ge54ov3687 = (GE_ms8("help", 4));
	ge54ov3686 = (GE_ms8("Display this help text.", 23));
	ge54ov3694 = (GE_ms8("parameters ...", 14));
	ge54ov3693 = (GE_ms8("", 0));
	ge1412ov23986 = (GE_ms8(" ", 1));
	ge1412ov23987 = (GE_ms8("  ", 2));
	ge1403ov25076 = (GE_ms8("iso-8859-1", 10));
	ge1403ov25078 = (GE_ms8("utf-16", 6));
	ge925ov14763 = (GE_ms8("TUPLE", 5));
	ge918ov26788 = (GE_ms8("like ", 5));
	ge915ov27193 = (GE_ms8("like Current", 12));
	ge894ov26816 = (GE_ms8("BIT ", 4));
	ge1031ov23723 = (GE_ms8("vuar2b", 6));
	ge1031ov23472 = (GE_ms8("VUAR-2", 6));
	ge1031ov23321 = (GE_ms8("the $9-th actual argument (of type \'$10\') does not conform to the corresponding formal argument (of type \'$11\') of feature `$8\'.", 128));
	ge1031ov23722 = (GE_ms8("vuar2a", 6));
	ge1031ov23320 = (GE_ms8("the $10-th actual argument (of type \'$11\') does not conform to the corresponding formal argument (of type \'$12\') of feature `$8\' in class $9.", 141));
	ge1031ov23537 = (GE_ms8("vdpr4b", 6));
	ge1031ov23382 = (GE_ms8("VDPR-4B", 7));
	ge1031ov23135 = (GE_ms8("the $9-th actual argument (of type \'$10\') does not conform to the corresponding formal argument (of type \'$11\') of feature `$7\' in class $8.", 140));
	ge836ov13210 = (GE_ms8("like", 4));
	ge1031ov23720 = (GE_ms8("vuar1b", 6));
	ge1031ov23471 = (GE_ms8("VUAR-1", 6));
	ge1031ov23318 = (GE_ms8("the number of actual arguments is not the same as the number of formal arguments of feature `$8\'.", 97));
	ge1031ov23719 = (GE_ms8("vuar1a", 6));
	ge1031ov23317 = (GE_ms8("the number of actual arguments is not the same as the number of formal arguments of feature `$8\' in class $9.", 109));
	ge1031ov23536 = (GE_ms8("vdpr4a", 6));
	ge1031ov23381 = (GE_ms8("VDPR-4A", 7));
	ge1031ov23134 = (GE_ms8("the number of actual arguments in Precursor call is not the same as the number of formal arguments of feature `$7\' in class $8.", 127));
	ge1031ov23505 = (GE_ms8("vape0a", 6));
	ge1031ov23367 = (GE_ms8("VAPE", 4));
	ge1031ov23103 = (GE_ms8("feature `$8\' of class $5 appearing in the precondition of `$9\' is not exported to class $10 to which feature `$9\' is exported.", 126));
	ge1031ov23725 = (GE_ms8("vuex1a", 6));
	ge1031ov23474 = (GE_ms8("VUEX-1", 6));
	ge1031ov23323 = (GE_ms8("`$7\' is not the final name of a feature in class $5.", 52));
	ge1031ov23761 = (GE_ms8("gvual0a", 7));
	ge1031ov23499 = (GE_ms8("GVUAL", 5));
	ge1031ov23359 = (GE_ms8("`$7\' is a local variable of feature `$8\' and hence cannot have actual arguments.", 80));
	ge1031ov23762 = (GE_ms8("gvual0b", 7));
	ge1031ov23360 = (GE_ms8("`$7\' is a local variable of an inline agent and hence cannot have actual arguments.", 83));
	ge1031ov23759 = (GE_ms8("gvuaa0a", 7));
	ge1031ov23498 = (GE_ms8("GVUAA", 5));
	ge1031ov23357 = (GE_ms8("`$7\' is a formal argument of feature `$8\' and hence cannot have actual arguments.", 81));
	ge1031ov23760 = (GE_ms8("gvuaa0b", 7));
	ge1031ov23358 = (GE_ms8("`$7\' is a formal argument of an inline agent and hence cannot have actual arguments.", 84));
	ge1031ov23636 = (GE_ms8("vkcn2c", 6));
	ge1031ov23429 = (GE_ms8("VKCN-2", 6));
	ge1031ov23234 = (GE_ms8("procedure `$8\' appears in a call expression.", 44));
	ge1031ov23765 = (GE_ms8("gvuil0a", 7));
	ge1031ov23501 = (GE_ms8("GVUIL", 5));
	ge1031ov23363 = (GE_ms8("`$7\' is a local variable of feature `$8\' and hence cannot be an instruction.", 76));
	ge1031ov23766 = (GE_ms8("gvuil0b", 7));
	ge1031ov23364 = (GE_ms8("`$7\' is a local variable of an inline agent and hence cannot be an instruction.", 79));
	ge1031ov23763 = (GE_ms8("gvuia0a", 7));
	ge1031ov23500 = (GE_ms8("GVUIA", 5));
	ge1031ov23361 = (GE_ms8("`$7\' is a formal argument of feature `$8\' and hence cannot be an instruction.", 77));
	ge1031ov23764 = (GE_ms8("gvuia0b", 7));
	ge1031ov23362 = (GE_ms8("`$7\' is a formal argument of an inline agent and hence cannot be an instruction.", 80));
	ge1031ov23634 = (GE_ms8("vkcn1c", 6));
	ge1031ov23428 = (GE_ms8("VKCN-1", 6));
	ge1031ov23232 = (GE_ms8("query `$8\' appears in a call instruction.", 41));
	ge1031ov23574 = (GE_ms8("veen8b", 6));
	ge1031ov23399 = (GE_ms8("VEEN-8", 6));
	ge1031ov23172 = (GE_ms8("`$7\' appearing in the invariant or one of its possibly nested inline agents, is an object-test local that is used outside of its scope.", 135));
	ge1031ov23573 = (GE_ms8("veen8a", 6));
	ge1031ov23171 = (GE_ms8("`$7\' appearing in feature `$8\' or one of its possibly nested inline agents, is an object-test local that is used outside of its scope.", 134));
	ge1031ov23568 = (GE_ms8("veen2c", 6));
	ge1031ov23398 = (GE_ms8("VEEN-2", 6));
	ge1031ov23166 = (GE_ms8("local entity `$7\' appears in the precondition or postcondition of feature `$8\'.", 79));
	ge1031ov23570 = (GE_ms8("veen2e", 6));
	ge1031ov23168 = (GE_ms8("local entity `$7\' appears in the precondition or postcondition of an inline agent.", 82));
	ge1031ov23506 = (GE_ms8("vape0b", 6));
	ge1031ov23104 = (GE_ms8("feature `$8\' of class $9 appearing in the precondition of `$10\' is not exported to class $11 to which feature `$10\' is exported.", 128));
	ge1031ov23727 = (GE_ms8("vuex2b", 6));
	ge1031ov23475 = (GE_ms8("VUEX-2", 6));
	ge1031ov23325 = (GE_ms8("feature `$8\' of class $9 is not exported to class $5.", 53));
	ge1031ov23721 = (GE_ms8("vuar1c", 6));
	ge1031ov23319 = (GE_ms8("call to Tuple label `$7\' cannot have arguments.", 47));
	ge1031ov23726 = (GE_ms8("vuex2a", 6));
	ge1031ov23324 = (GE_ms8("`$7\' is not the final name of a feature in class $8.", 52));
	ge1031ov23635 = (GE_ms8("vkcn2a", 6));
	ge1031ov23233 = (GE_ms8("procedure `$8\' of class $9 appears in a call expression.", 56));
	ge1031ov23566 = (GE_ms8("veen2a", 6));
	ge1031ov23164 = (GE_ms8("entity \'Result\' appears in the body, postcondition or rescue clause of a procedure `$7\'.", 88));
	ge1031ov23572 = (GE_ms8("veen2g", 6));
	ge1031ov23170 = (GE_ms8("entity \'Result\' appears in the body, postcondition or rescue clause of an inline agent whose associated feature is a procedure.", 127));
	ge1031ov23569 = (GE_ms8("veen2d", 6));
	ge1031ov23167 = (GE_ms8("entity \'Result\' appears in the invariant of the class.", 54));
	ge1031ov23567 = (GE_ms8("veen2b", 6));
	ge1031ov23165 = (GE_ms8("entity \'Result\' appears in the precondition of feature `$7\'.", 60));
	ge1031ov23715 = (GE_ms8("vtgc0a", 6));
	ge1031ov23468 = (GE_ms8("VTGC", 4));
	ge1031ov23313 = (GE_ms8("`$7\' is not the final name of a procedure in constraint\'s base class $8.", 72));
	ge1031ov23716 = (GE_ms8("vtgc0b", 6));
	ge1031ov23314 = (GE_ms8("`$7\' is not the final name of a procedure in constraint\'s base class $8.", 72));
	ge1031ov23614 = (GE_ms8("vgcp3c", 6));
	ge1031ov23418 = (GE_ms8("VGCP-3", 6));
	ge1031ov23212 = (GE_ms8("procedure name `$7\' appears twice in creation clause of constraint.", 67));
	ge1031ov23540 = (GE_ms8("vdrd2c", 6));
	ge1031ov23383 = (GE_ms8("VDRD-2", 6));
	ge1031ov23138 = (GE_ms8("signature of selected feature `$7\' does not conform to the signature of replicated feature `$8\' in parent $9.", 109));
	ge1031ov23541 = (GE_ms8("vdrd2d", 6));
	ge1031ov23139 = (GE_ms8("signature of selected feature `$7\' inherited from $8 does not conform to the signature of replicated feature `$9\' in parent $10.", 128));
	ge1031ov23524 = (GE_ms8("vdjr0b", 6));
	ge1031ov23376 = (GE_ms8("VDJR", 4));
	ge1031ov23122 = (GE_ms8("joined deferred features `$7\' inherited from $8 and $9 don\'t have the same signature. Type of argument number $10 differs.", 122));
	ge1031ov23523 = (GE_ms8("vdjr0a", 6));
	ge1031ov23121 = (GE_ms8("joined deferred features `$7\' inherited from $8 and $9 don\'t have the same signature. Different number of arguments.", 116));
	ge1031ov23525 = (GE_ms8("vdjr0c", 6));
	ge1031ov23123 = (GE_ms8("joined deferred features `$7\' inherited from $8 and $9 don\'t have the same signature. Type of result differs.", 109));
	ge1031ov23549 = (GE_ms8("vdrd6b", 6));
	ge1031ov23387 = (GE_ms8("VDRD-6", 6));
	ge1031ov23147 = (GE_ms8("attribute `$7\' inherited from $8 and its redeclared version don\'t have the same type expandedness.", 98));
	ge1031ov23538 = (GE_ms8("vdrd2a", 6));
	ge1031ov23136 = (GE_ms8("signature of feature `$7\' does not conform to the signature of redeclared feature `$8\' in parent $9.", 100));
	ge1031ov23539 = (GE_ms8("vdrd2b", 6));
	ge1031ov23137 = (GE_ms8("signature of feature `$7\' inherited from $8 does not conform to the signature of redeclared feature `$9\' in parent $10.", 119));
	ge1031ov23646 = (GE_ms8("vmrc2b", 6));
	ge1031ov23435 = (GE_ms8("VMRC-2", 6));
	ge1031ov23244 = (GE_ms8("replicated features $7 have been selected more than once.", 57));
	ge1031ov23645 = (GE_ms8("vmrc2a", 6));
	ge1031ov23243 = (GE_ms8("replicated features $7 have not been selected.", 46));
	ge1031ov23647 = (GE_ms8("vmss1a", 6));
	ge1031ov23436 = (GE_ms8("VMSS-1", 6));
	ge1031ov23245 = (GE_ms8("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge1031ov23553 = (GE_ms8("vdrs1a", 6));
	ge1031ov23389 = (GE_ms8("VDRS-1", 6));
	ge1031ov23151 = (GE_ms8("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge1031ov23559 = (GE_ms8("vdus1a", 6));
	ge1031ov23393 = (GE_ms8("VDUS-1", 6));
	ge1031ov23157 = (GE_ms8("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge1031ov23638 = (GE_ms8("vlel2a", 6));
	ge1031ov23431 = (GE_ms8("VLEL-2", 6));
	ge1031ov23236 = (GE_ms8("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge1031ov23621 = (GE_ms8("vhrc1a", 6));
	ge1031ov23421 = (GE_ms8("VHRC-1", 6));
	ge1031ov23219 = (GE_ms8("`$7\' is not the final name of a feature in $8.", 46));
	ge1031ov23648 = (GE_ms8("vmss2a", 6));
	ge1031ov23437 = (GE_ms8("VMSS-2", 6));
	ge1031ov23246 = (GE_ms8("feature name `$7\' appears twice in the Select subclause of parent $8.", 69));
	ge1031ov23556 = (GE_ms8("vdrs3a", 6));
	ge1031ov23391 = (GE_ms8("VDRS-3", 6));
	ge1031ov23154 = (GE_ms8("feature name `$7\' appears twice in the Redefine subclause of parent $8.", 71));
	ge1031ov23563 = (GE_ms8("vdus4a", 6));
	ge1031ov23396 = (GE_ms8("VDUS-4", 6));
	ge1031ov23161 = (GE_ms8("feature name `$7\' appears twice in the Undefine subclause of parent $8.", 71));
	ge1031ov23639 = (GE_ms8("vlel3a", 6));
	ge1031ov23432 = (GE_ms8("VLEL-3", 6));
	ge1031ov23237 = (GE_ms8("feature name `$7\' appears twice in the Export subclause of parent $8.", 69));
	ge1031ov23637 = (GE_ms8("vlel1a", 6));
	ge1031ov23430 = (GE_ms8("VLEL-1", 6));
	ge1031ov23235 = (GE_ms8("\'all\' keyword appears twice in the Export subclause of parent $7.", 65));
	ge1031ov23622 = (GE_ms8("vhrc2a", 6));
	ge1031ov23422 = (GE_ms8("VHRC-2", 6));
	ge1031ov23220 = (GE_ms8("feature name `$7\' appears as first element of two Rename_pairs.", 63));
	ge1031ov23640 = (GE_ms8("vmfn0a", 6));
	ge1031ov23433 = (GE_ms8("VMFN", 4));
	ge1031ov23238 = (GE_ms8("two features with the same name `$7\'.", 37));
	ge836ov13179 = (GE_ms8("as", 2));
	ge1031ov23610 = (GE_ms8("vgcp2a", 6));
	ge1031ov23417 = (GE_ms8("VGCP-2", 6));
	ge1031ov23208 = (GE_ms8("`$7\' is not the final name of a procedure.", 42));
	ge1031ov23611 = (GE_ms8("vgcp2b", 6));
	ge1031ov23209 = (GE_ms8("`$7\' is not the final name of a procedure.", 42));
	ge1031ov23602 = (GE_ms8("vgcc6a", 6));
	ge1031ov23414 = (GE_ms8("VGCC-6", 6));
	ge1031ov23200 = (GE_ms8("`$7\' is the final name of a once-procedure.", 43));
	ge1031ov23613 = (GE_ms8("vgcp3b", 6));
	ge1031ov23211 = (GE_ms8("procedure name `$7\' appears in two different creation clauses.", 62));
	ge1031ov23612 = (GE_ms8("vgcp3a", 6));
	ge1031ov23210 = (GE_ms8("procedure name `$7\' appears twice in creation clause.", 53));
	ge1031ov23609 = (GE_ms8("vgcp1a", 6));
	ge1031ov23416 = (GE_ms8("VGCP-1", 6));
	ge1031ov23207 = (GE_ms8("deferred class has a creation clause.", 37));
	ge1031ov23579 = (GE_ms8("vfac4a", 6));
	ge1031ov23403 = (GE_ms8("VFAC-4", 6));
	ge1031ov23177 = (GE_ms8("the type of the $10-th argument of assigner procedure `$8\' and of the $9-th argument of query `$7\' do not have the same deanchored form.", 136));
	ge1031ov23578 = (GE_ms8("vfac3a", 6));
	ge1031ov23402 = (GE_ms8("VFAC-3", 6));
	ge1031ov23176 = (GE_ms8("the type of the first argument of assigner procedure `$8\' and the result type of query `$7\' do not have the same deanchored form.", 129));
	ge1031ov23577 = (GE_ms8("vfac2a", 6));
	ge1031ov23401 = (GE_ms8("VFAC-2", 6));
	ge1031ov23175 = (GE_ms8("the number of arguments in assigner procedure `$8\' is not one more than the number of arguments in query `$7\'.", 110));
	ge1031ov23576 = (GE_ms8("vfac1b", 6));
	ge1031ov23400 = (GE_ms8("VFAC-1", 6));
	ge1031ov23174 = (GE_ms8("query `$7\' has an assigner mark `$8\' but this feature is not a procedure.", 73));
	ge1031ov23575 = (GE_ms8("vfac1a", 6));
	ge1031ov23173 = (GE_ms8("query `$7\' has an assigner mark `$8\' but there is no feature with that name.", 76));
	ge1031ov23512 = (GE_ms8("vcch2a", 6));
	ge1031ov23372 = (GE_ms8("VCCH-2", 6));
	ge1031ov23110 = (GE_ms8("class is marked as deferred but has no deferred feature.", 56));
	ge1031ov23510 = (GE_ms8("vcch1a", 6));
	ge1031ov23371 = (GE_ms8("VCCH-1", 6));
	ge1031ov23108 = (GE_ms8("class is not marked as deferred but has deferred feature `$7\'.", 62));
	ge1031ov23585 = (GE_ms8("vfav1f", 6));
	ge1031ov23404 = (GE_ms8("VFAV-1", 6));
	ge1031ov23183 = (GE_ms8("features `$7\' and `$9\' have both the same binary Operator alias `$8\'.", 69));
	ge1031ov23582 = (GE_ms8("vfav1c", 6));
	ge1031ov23180 = (GE_ms8("features `$7\' and `$9\' have both the same unary Operator alias `$8\'.", 68));
	ge1031ov23589 = (GE_ms8("vfav2b", 6));
	ge1031ov23405 = (GE_ms8("VFAV-2", 6));
	ge1031ov23187 = (GE_ms8("features `$7\' and `$9\' have both the same Bracket alias `$8\'.", 61));
	ge1031ov23586 = (GE_ms8("vfav1g", 6));
	ge1031ov23184 = (GE_ms8("features `$7\' and `$9\' inherited from $11 have both the same binary Operator alias `$8\'.", 88));
	ge1031ov23583 = (GE_ms8("vfav1d", 6));
	ge1031ov23181 = (GE_ms8("features `$7\' and `$9\' inherited from $11 have both the same unary Operator alias `$8\'.", 87));
	ge1031ov23590 = (GE_ms8("vfav2c", 6));
	ge1031ov23188 = (GE_ms8("features `$7\' and `$9\' inherited from $11 have both the same Bracket alias `$8\'.", 80));
	ge1031ov23587 = (GE_ms8("vfav1h", 6));
	ge1031ov23185 = (GE_ms8("features `$7\' inherited from $9 and `$10\' inherited from $12 have both the same binary Operator alias `$8\'.", 107));
	ge1031ov23584 = (GE_ms8("vfav1e", 6));
	ge1031ov23182 = (GE_ms8("features `$7\' inherited from $9 and `$10\' inherited from $12 have both the same unary Operator alias `$8\'.", 106));
	ge1031ov23591 = (GE_ms8("vfav2d", 6));
	ge1031ov23189 = (GE_ms8("features `$7\' inherited from $9 and `$10\' inherited from $12 have both the same Bracket alias `$8\'.", 99));
	ge1031ov23704 = (GE_ms8("vtat2a", 6));
	ge1031ov23463 = (GE_ms8("VTAT-2", 6));
	ge1031ov23302 = (GE_ms8("anchor cycle $7.", 16));
	ge1031ov23596 = (GE_ms8("vffd7b", 6));
	ge1031ov23409 = (GE_ms8("VFFD-7", 6));
	ge1031ov23194 = (GE_ms8("feature `$7\' is a once funtion but its type contains a formal generic parameter.", 80));
	ge1031ov23595 = (GE_ms8("vffd7a", 6));
	ge1031ov23193 = (GE_ms8("feature `$7\' is a once funtion but its type contains an anchored type.", 70));
	ge1031ov23581 = (GE_ms8("vfav1b", 6));
	ge1031ov23179 = (GE_ms8("feature `$7\' has a unary Operator alias `$8\' but is not a query with no argument.", 81));
	ge1031ov23580 = (GE_ms8("vfav1a", 6));
	ge1031ov23178 = (GE_ms8("feature `$7\' has a binary Operator alias `$8\' but is not a query with at exactly one argument.", 94));
	ge1031ov23588 = (GE_ms8("vfav2a", 6));
	ge1031ov23186 = (GE_ms8("feature `$7\' has a Bracket alias `$8\' but is not a query with at least one argument.", 84));
	ge1031ov23594 = (GE_ms8("vffd6a", 6));
	ge1031ov23408 = (GE_ms8("VFFD-6", 6));
	ge1031ov23192 = (GE_ms8("feature `$7\' has an Infix name but is not a function with exactly one argument.", 79));
	ge1031ov23593 = (GE_ms8("vffd5a", 6));
	ge1031ov23407 = (GE_ms8("VFFD-5", 6));
	ge1031ov23191 = (GE_ms8("feature `$7\' has a Prefix name but is not an attribute or a function with no argument.", 86));
	ge1031ov23592 = (GE_ms8("vffd4a", 6));
	ge1031ov23406 = (GE_ms8("VFFD-4", 6));
	ge1031ov23190 = (GE_ms8("deferred feature `$7\' is marked as frozen.", 42));
	ge1031ov23681 = (GE_ms8("vrfa0a", 6));
	ge1031ov23456 = (GE_ms8("VRFA", 4));
	ge1031ov23279 = (GE_ms8("argument name \'$7\' in feature `$8\' is also the final name of a feature.", 71));
	ge1031ov23679 = (GE_ms8("vreg0a", 6));
	ge1031ov23455 = (GE_ms8("VREG", 4));
	ge1031ov23277 = (GE_ms8("argument name \'$7\' appear twice in feature `$8\'.", 48));
	ge1031ov23527 = (GE_ms8("vdjr2b", 6));
	ge1031ov23377 = (GE_ms8("VDJR-2", 6));
	ge1031ov23125 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $11 has a different one `$10\'.", 110));
	ge1031ov23644 = (GE_ms8("vmfn2b", 6));
	ge1031ov23434 = (GE_ms8("VMFN-2", 6));
	ge1031ov23242 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $11 has a different one `$10\'.", 110));
	ge1031ov23526 = (GE_ms8("vdjr2a", 6));
	ge1031ov23124 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $10 has none.", 93));
	ge1031ov23643 = (GE_ms8("vmfn2a", 6));
	ge1031ov23241 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $10 has none.", 93));
	ge1031ov23642 = (GE_ms8("vmfn0c", 6));
	ge1031ov23240 = (GE_ms8("two features with the same name `$7\' inherited from $8 and `$9\' inherited from $10.", 83));
	ge1031ov23557 = (GE_ms8("vdrs4a", 6));
	ge1031ov23392 = (GE_ms8("VDRS-4", 6));
	ge1031ov23155 = (GE_ms8("Redefine subclause of $8 lists feature `$7\' but it is not redefined.", 68));
	ge1031ov23555 = (GE_ms8("vdrs2b", 6));
	ge1031ov23390 = (GE_ms8("VDRS-2", 6));
	ge1031ov23153 = (GE_ms8("cannot redefine the constant attribute `$7\'.", 44));
	ge1031ov23554 = (GE_ms8("vdrs2a", 6));
	ge1031ov23152 = (GE_ms8("cannot redefine the frozen feature `$7\'.", 40));
	ge1031ov23561 = (GE_ms8("vdus2b", 6));
	ge1031ov23394 = (GE_ms8("VDUS-2", 6));
	ge1031ov23159 = (GE_ms8("cannot undefine the attribute `$7\'.", 35));
	ge1031ov23560 = (GE_ms8("vdus2a", 6));
	ge1031ov23158 = (GE_ms8("cannot undefine the frozen feature `$7\'.", 40));
	ge1031ov23562 = (GE_ms8("vdus3a", 6));
	ge1031ov23395 = (GE_ms8("VDUS-3", 6));
	ge1031ov23160 = (GE_ms8("cannot undefine the deferred feature `$7\'.", 42));
	ge1031ov23626 = (GE_ms8("vhrc4d", 6));
	ge1031ov23423 = (GE_ms8("VHRC-4", 6));
	ge1031ov23224 = (GE_ms8("`$7\' has a unary Operator alias `$8\' but `$9\' in $10 is not a query with no argument.", 85));
	ge1031ov23625 = (GE_ms8("vhrc4c", 6));
	ge1031ov23223 = (GE_ms8("`$7\' has a binary Operator alias `$8\' but `$9\' in $10 is not a query with exactly one argument.", 95));
	ge1031ov23624 = (GE_ms8("vhrc4b", 6));
	ge1031ov23222 = (GE_ms8("`$7\' has a Bracket alias `$8\' but `$9\' in $10 is not a query with at least one argument.", 88));
	ge1031ov23623 = (GE_ms8("vhrc4a", 6));
	ge1031ov23221 = (GE_ms8("`$7\' is of the Prefix form but `$8\' in $9 is not an attribute nor a function with no argument.", 94));
	ge1031ov23627 = (GE_ms8("vhrc5a", 6));
	ge1031ov23424 = (GE_ms8("VHRC-5", 6));
	ge1031ov23225 = (GE_ms8("`$7\' is of the Infix form but `$8\' in $9 is not a function with one argument.", 77));
	ge1031ov23543 = (GE_ms8("vdrd3b", 6));
	ge1031ov23384 = (GE_ms8("VDRD-3", 6));
	ge1031ov23141 = (GE_ms8("feature `$7\' is redeclared but its postconditions do not begin with \'ensure then\'.", 82));
	ge1031ov23542 = (GE_ms8("vdrd3a", 6));
	ge1031ov23140 = (GE_ms8("feature `$7\' is redeclared but its preconditions do not begin with \'require else\'.", 82));
	ge1031ov23548 = (GE_ms8("vdrd6a", 6));
	ge1031ov23146 = (GE_ms8("attribute `$7\' inherited from $8 is not redeclared into an attribute.", 69));
	ge1031ov23545 = (GE_ms8("vdrd4b", 6));
	ge1031ov23385 = (GE_ms8("VDRD-4", 6));
	ge1031ov23143 = (GE_ms8("effective feature `$7\' inherited from $8 is redefined but is not listed in the Redefine subclause.", 98));
	ge1031ov23546 = (GE_ms8("vdrd4c", 6));
	ge1031ov23144 = (GE_ms8("effective feature `$8\' inherited from $9 is redefined into a deferred one but is not listed in the Undefine and Redefine subclauses.", 132));
	ge1031ov23641 = (GE_ms8("vmfn0b", 6));
	ge1031ov23239 = (GE_ms8("two features with the same name `$7\' in current class and `$8\' inherited from $9.", 81));
	ge1031ov23544 = (GE_ms8("vdrd4a", 6));
	ge1031ov23142 = (GE_ms8("deferred feature `$7\' inherited from $8 is redefined but is not listed in the Redefine subclause.", 97));
	ge1031ov23558 = (GE_ms8("vdrs4b", 6));
	ge1031ov23156 = (GE_ms8("redeclaration of feature `$7\' from $8 is an effecting and should not appear in the Redefine subclause.", 102));
	ge1031ov23547 = (GE_ms8("vdrd5a", 6));
	ge1031ov23386 = (GE_ms8("VDRD-5", 6));
	ge1031ov23145 = (GE_ms8("effective feature `$7\' inherited from $8 is redefined into a deferred one.", 74));
	ge1031ov23552 = (GE_ms8("vdrd7c", 6));
	ge1031ov23388 = (GE_ms8("VDRD-7", 6));
	ge1031ov23150 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but its redeclared version has a different one `$11\'.", 102));
	ge1031ov23550 = (GE_ms8("vdrd7a", 6));
	ge1031ov23148 = (GE_ms8("feature `$7\' inherited from $8 has no alias but its redeclared version has one `$10\'.", 85));
	ge1031ov23551 = (GE_ms8("vdrd7b", 6));
	ge1031ov23149 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but its redeclared version has none.", 85));
	ge1031ov23649 = (GE_ms8("vmss3a", 6));
	ge1031ov23438 = (GE_ms8("VMSS-3", 6));
	ge1031ov23247 = (GE_ms8("feature name `$7\' appears in the Select subclause of parent $8 but is not replicated.", 85));
	ge1031ov23616 = (GE_ms8("vhpr1a", 6));
	ge1031ov23410 = (GE_ms8("VHPR-1", 6));
	ge1031ov23214 = (GE_ms8("inheritance cycle $7.", 21));
	ge1031ov23522 = (GE_ms8("vcfg3j", 6));
	ge1031ov23375 = (GE_ms8("VCFG-3", 6));
	ge1031ov23120 = (GE_ms8("formal generic constraint cycle $7.", 35));
	ge1031ov23520 = (GE_ms8("vcfg3g", 6));
	ge1031ov23118 = (GE_ms8("formal generic constraint cycle $7.", 35));
	ge1031ov23514 = (GE_ms8("vcfg2a", 6));
	ge1031ov23374 = (GE_ms8("VCFG-2", 6));
	ge1031ov23112 = (GE_ms8("\'$7\' is the name of formal generic parameters #$7 and #$8.", 58));
	ge1031ov23513 = (GE_ms8("vcfg1a", 6));
	ge1031ov23373 = (GE_ms8("VCFG-1", 6));
	ge1031ov23111 = (GE_ms8("formal generic parameter \'$7\' has the same name as a class in the surrounding universe.", 87));
	ge1031ov23743 = (GE_ms8("gvagp0a", 7));
	ge1031ov23484 = (GE_ms8("GVAGP", 5));
	ge1031ov23341 = (GE_ms8("ancestors with generic parameter mismatch: \'$7\' and \'$8\'.", 57));
	ge1031ov23747 = (GE_ms8("gvhso2a", 7));
	ge1031ov23488 = (GE_ms8("GVHSO-2", 7));
	ge1031ov23345 = (GE_ms8("implicitly inherits from class SYSTEM_OBJECT but SYSTEM_OBJECT is not a .NET class.", 83));
	ge1031ov23713 = (GE_ms8("vtct0a", 6));
	ge1031ov23467 = (GE_ms8("VTCT", 4));
	ge1031ov23311 = (GE_ms8("type based on unknown class $7.", 31));
	ge1031ov23746 = (GE_ms8("gvhso1a", 7));
	ge1031ov23487 = (GE_ms8("GVHSO-1", 7));
	ge1031ov23344 = (GE_ms8("implicitly inherits from unknown class SYSTEM_OBJECT.", 53));
	ge1031ov23615 = (GE_ms8("vhay0a", 6));
	ge1031ov23419 = (GE_ms8("VHAY", 4));
	ge1031ov23213 = (GE_ms8("implicitly inherits from unknown class ANY.", 43));
	ge1031ov23617 = (GE_ms8("vhpr1b", 6));
	ge1031ov23215 = (GE_ms8("inheritance cycle when inheriting from $7.", 42));
	ge1022ov31027 = (GE_ms8("gaaaa", 5));
	ge1022ov31025 = (GE_ms8("GAAAA", 5));
	ge1022ov31023 = (GE_ms8("[$1] assembly $2: .NET assemblies not supported.", 48));
	ge1021ov30942 = (GE_ms8("gcaab", 5));
	ge1021ov30938 = (GE_ms8("GCAAB", 5));
	ge1021ov30934 = (GE_ms8("[$1] cluster $2: cannot read Eiffel file \'$3\'.", 46));
	ge1031ov23756 = (GE_ms8("gvscn1b", 7));
	ge1031ov23496 = (GE_ms8("GVSCN-1", 7));
	ge1031ov23354 = (GE_ms8("file \'$8\' does not contain the expected class $5.", 49));
	ge836ov13174 = (GE_ms8("agent", 5));
	ge836ov13230 = (GE_ms8("strip", 5));
	ge836ov13216 = (GE_ms8("once", 4));
	ge836ov13215 = (GE_ms8("old", 3));
	ge836ov13191 = (GE_ms8("else", 4));
	ge836ov13217 = (GE_ms8("or", 2));
	ge836ov13231 = (GE_ms8("then", 4));
	ge836ov13177 = (GE_ms8("and", 3));
	ge836ov13219 = (GE_ms8("precursor", 9));
	ge836ov13188 = (GE_ms8("debug", 5));
	ge836ov13190 = (GE_ms8("do", 2));
	ge836ov13238 = (GE_ms8("when", 4));
	ge836ov13182 = (GE_ms8("check", 5));
	ge836ov13212 = (GE_ms8("loop", 4));
	ge836ov13200 = (GE_ms8("from", 4));
	ge836ov13225 = (GE_ms8("rescue", 6));
	ge1031ov23709 = (GE_ms8("vtbt0d", 6));
	ge1031ov23464 = (GE_ms8("VTBT", 4));
	ge1031ov23307 = (GE_ms8("invalid type \'$7\': bit size must be a positive integer constant.", 64));
	ge1029ov30950 = (GE_ms8("gssss", 5));
	ge1029ov30949 = (GE_ms8("Syntax error:\n$1", 16));
	ge1031ov23708 = (GE_ms8("vtbt0c", 6));
	ge1031ov23306 = (GE_ms8("invalid type \'$7\': bit size must be a positive integer constant.", 64));
	ge836ov13236 = (GE_ms8("variant", 7));
	ge836ov13208 = (GE_ms8("invariant", 9));
	ge836ov13194 = (GE_ms8("ensure", 6));
	ge836ov13224 = (GE_ms8("require", 7));
	ge836ov13211 = (GE_ms8("local", 5));
	ge836ov13175 = (GE_ms8("alias", 5));
	ge836ov13205 = (GE_ms8("infix", 5));
	ge836ov13220 = (GE_ms8("prefix", 6));
	ge836ov13337 = (GE_ms8("built_in", 8));
	ge836ov13339 = (GE_ms8("built_in static", 15));
	ge836ov13338 = (GE_ms8("static built_in", 15));
	ge1031ov23749 = (GE_ms8("gvkbu1a", 7));
	ge1031ov23490 = (GE_ms8("GVKBU-1", 7));
	ge1031ov23347 = (GE_ms8("unknown built-in routine `$7\' in class $5.", 42));
	ge836ov13120 = (GE_ms8("out", 3));
	ge836ov13088 = (GE_ms8("floor_real_64", 13));
	ge836ov13087 = (GE_ms8("floor_real_32", 13));
	ge836ov13069 = (GE_ms8("ceiling_real_64", 15));
	ge836ov13068 = (GE_ms8("ceiling_real_32", 15));
	ge836ov13154 = (GE_ms8("to_double", 9));
	ge836ov13162 = (GE_ms8("truncated_to_real", 17));
	ge836ov13161 = (GE_ms8("truncated_to_integer_64", 23));
	ge836ov13160 = (GE_ms8("truncated_to_integer", 20));
	ge836ov13260 = (GE_ms8("<", 1));
	ge836ov13265 = (GE_ms8("+", 1));
	ge836ov13261 = (GE_ms8("-", 1));
	ge836ov13266 = (GE_ms8("^", 1));
	ge836ov13248 = (GE_ms8("/", 1));
	ge836ov13274 = (GE_ms8("*", 1));
	ge1031ov23748 = (GE_ms8("gvkbs0a", 7));
	ge1031ov23489 = (GE_ms8("GVKBS", 5));
	ge1031ov23346 = (GE_ms8("built-in routine `$7\' in class $5 has not the expected signature \'$8\'.", 70));
	ge836ov13144 = (GE_ms8("set_item", 8));
	ge836ov13060 = (GE_ms8("bit_not", 7));
	ge836ov13064 = (GE_ms8("bit_xor", 7));
	ge836ov13063 = (GE_ms8("bit_shift_right", 15));
	ge836ov13062 = (GE_ms8("bit_shift_left", 14));
	ge836ov13059 = (GE_ms8("bit_and", 7));
	ge836ov13061 = (GE_ms8("bit_or", 6));
	ge836ov13053 = (GE_ms8("as_integer_64", 13));
	ge836ov13052 = (GE_ms8("as_integer_32", 13));
	ge836ov13051 = (GE_ms8("as_integer_16", 13));
	ge836ov13050 = (GE_ms8("as_integer_8", 12));
	ge836ov13057 = (GE_ms8("as_natural_64", 13));
	ge836ov13056 = (GE_ms8("as_natural_32", 13));
	ge836ov13055 = (GE_ms8("as_natural_16", 13));
	ge836ov13054 = (GE_ms8("as_natural_8", 12));
	ge836ov13159 = (GE_ms8("to_real_64", 10));
	ge836ov13158 = (GE_ms8("to_real_32", 10));
	ge836ov13157 = (GE_ms8("to_real", 7));
	ge836ov13153 = (GE_ms8("to_character_32", 15));
	ge836ov13152 = (GE_ms8("to_character_8", 14));
	ge836ov13262 = (GE_ms8("\\\\", 2));
	ge836ov13247 = (GE_ms8("//", 2));
	ge836ov13142 = (GE_ms8("reference_item", 14));
	ge836ov13140 = (GE_ms8("real_64_item", 12));
	ge836ov13139 = (GE_ms8("real_32_item", 12));
	ge836ov13119 = (GE_ms8("object_comparison", 17));
	ge836ov13118 = (GE_ms8("natural_64_item", 15));
	ge836ov13117 = (GE_ms8("natural_32_item", 15));
	ge836ov13115 = (GE_ms8("natural_16_item", 15));
	ge836ov13114 = (GE_ms8("natural_8_item", 14));
	ge836ov13109 = (GE_ms8("item_code", 9));
	ge836ov13097 = (GE_ms8("integer_64_item", 15));
	ge836ov13096 = (GE_ms8("integer_32_item", 15));
	ge836ov13095 = (GE_ms8("integer_16_item", 15));
	ge836ov13094 = (GE_ms8("integer_8_item", 14));
	ge836ov13071 = (GE_ms8("character_32_item", 17));
	ge836ov13070 = (GE_ms8("character_8_item", 16));
	ge836ov13066 = (GE_ms8("boolean_item", 12));
	ge836ov13145 = (GE_ms8("set_object_comparison", 21));
	ge836ov13138 = (GE_ms8("put_reference", 13));
	ge836ov13137 = (GE_ms8("put_real_64", 11));
	ge836ov13136 = (GE_ms8("put_real_32", 11));
	ge836ov13135 = (GE_ms8("put_pointer", 11));
	ge836ov13134 = (GE_ms8("put_natural_64", 14));
	ge836ov13133 = (GE_ms8("put_natural_32", 14));
	ge836ov13132 = (GE_ms8("put_natural_16", 14));
	ge836ov13131 = (GE_ms8("put_natural_8", 13));
	ge836ov13130 = (GE_ms8("put_integer_64", 14));
	ge836ov13129 = (GE_ms8("put_integer_32", 14));
	ge836ov13128 = (GE_ms8("put_integer_16", 14));
	ge836ov13127 = (GE_ms8("put_integer_8", 13));
	ge836ov13126 = (GE_ms8("put_character_32", 16));
	ge836ov13125 = (GE_ms8("put_character_8", 15));
	ge836ov13124 = (GE_ms8("put_boolean", 11));
	ge836ov13166 = (GE_ms8("wide_character_bytes", 20));
	ge836ov13104 = (GE_ms8("is_thread_capable", 17));
	ge836ov13141 = (GE_ms8("real_bytes", 10));
	ge836ov13121 = (GE_ms8("pointer_bytes", 13));
	ge836ov13098 = (GE_ms8("integer_bytes", 13));
	ge836ov13081 = (GE_ms8("double_bytes", 12));
	ge836ov13072 = (GE_ms8("character_bytes", 15));
	ge836ov13065 = (GE_ms8("boolean_bytes", 13));
	ge836ov13107 = (GE_ms8("is_windows", 10));
	ge836ov13106 = (GE_ms8("is_vms", 6));
	ge836ov13105 = (GE_ms8("is_unix", 7));
	ge836ov13102 = (GE_ms8("is_mac", 6));
	ge836ov13100 = (GE_ms8("is_dotnet", 9));
	ge836ov13083 = (GE_ms8("eif_object_id", 13));
	ge836ov13082 = (GE_ms8("eif_id_object", 13));
	ge836ov13084 = (GE_ms8("eif_object_id_free", 18));
	ge836ov13049 = (GE_ms8("argument_count", 14));
	ge836ov13048 = (GE_ms8("argument", 8));
	ge836ov13093 = (GE_ms8("hash_code", 9));
	ge836ov13155 = (GE_ms8("to_integer_32", 13));
	ge836ov13239 = (GE_ms8("xor", 3));
	ge836ov13213 = (GE_ms8("not", 3));
	ge836ov13203 = (GE_ms8("implies", 7));
	ge836ov13218 = (GE_ms8("or else", 7));
	ge836ov13178 = (GE_ms8("and then", 8));
	ge836ov13116 = (GE_ms8("natural_32_code", 15));
	ge836ov13074 = (GE_ms8("code", 4));
	ge836ov13058 = (GE_ms8("base_address", 12));
	ge836ov13046 = (GE_ms8("aliased_resized_area", 20));
	ge836ov13085 = (GE_ms8("element_size", 12));
	ge836ov13123 = (GE_ms8("put", 3));
	ge836ov13112 = (GE_ms8("make", 4));
	ge836ov13164 = (GE_ms8("type_id", 7));
	ge836ov13113 = (GE_ms8("name", 4));
	ge836ov13092 = (GE_ms8("generic_parameter_count", 23));
	ge836ov13091 = (GE_ms8("generic_parameter", 17));
	ge836ov13089 = (GE_ms8("generating_type", 15));
	ge836ov13078 = (GE_ms8("deep_twin", 9));
	ge836ov13099 = (GE_ms8("is_deep_equal", 13));
	ge836ov13149 = (GE_ms8("standard_twin", 13));
	ge836ov13150 = (GE_ms8("tagged_out", 10));
	ge836ov13090 = (GE_ms8("generator", 9));
	ge836ov13075 = (GE_ms8("conforms_to", 11));
	ge836ov13143 = (GE_ms8("same_type", 9));
	ge836ov13148 = (GE_ms8("standard_is_equal", 17));
	ge836ov13163 = (GE_ms8("twin", 4));
	ge836ov13076 = (GE_ms8("copy", 4));
	ge836ov13147 = (GE_ms8("standard_copy", 13));
	ge836ov13209 = (GE_ms8("is", 2));
	ge836ov13234 = (GE_ms8("unique", 6));
	ge836ov13199 = (GE_ms8("feature", 7));
	ge836ov13184 = (GE_ms8("convert", 7));
	ge836ov13186 = (GE_ms8("creation", 8));
	ge836ov13221 = (GE_ms8("redefine", 8));
	ge836ov13176 = (GE_ms8("all", 3));
	ge836ov13196 = (GE_ms8("export", 6));
	ge836ov13223 = (GE_ms8("rename", 6));
	ge1031ov23698 = (GE_ms8("vscn0j", 6));
	ge1031ov23461 = (GE_ms8("VSCN", 4));
	ge1031ov23296 = (GE_ms8("class in assembly \'$8\' cannot be overridden by class in file \'$10\'.", 67));
	ge1031ov23691 = (GE_ms8("vscn0c", 6));
	ge1031ov23289 = (GE_ms8("class appears in file \'$8\' and group \'$10\'.", 43));
	ge1031ov23690 = (GE_ms8("vscn0b", 6));
	ge1031ov23288 = (GE_ms8("class appears in file \'$8\' and assembly \'$10\'.", 46));
	ge1031ov23689 = (GE_ms8("vscn0a", 6));
	ge1031ov23287 = (GE_ms8("class appears in files \'$8\' and \'$10\'.", 38));
	ge1031ov23694 = (GE_ms8("vscn0f", 6));
	ge1031ov23292 = (GE_ms8("built-in class also appears in file \'$8\'.", 41));
	ge1031ov23696 = (GE_ms8("vscn0h", 6));
	ge1031ov23294 = (GE_ms8("built-in class cannot be overridden by class in file \'$8\'.", 58));
	ge1031ov23755 = (GE_ms8("gvscn1a", 7));
	ge1031ov23353 = (GE_ms8("file \'$8\' contains class $9 instead of the expected class $5.", 61));
	ge836ov13080 = (GE_ms8("dispose", 7));
	ge1031ov23754 = (GE_ms8("gvkfe5a", 7));
	ge1031ov23495 = (GE_ms8("GVKFE-5", 7));
	ge1031ov23352 = (GE_ms8("feature `$7\' in kernel class $5 is not a query.", 47));
	ge1031ov23753 = (GE_ms8("gvkfe4a", 7));
	ge1031ov23494 = (GE_ms8("GVKFE-4", 7));
	ge1031ov23351 = (GE_ms8("feature `$7\' in kernel class $5 is not a procedure.", 51));
	ge836ov13110 = (GE_ms8("last_result", 11));
	ge836ov13146 = (GE_ms8("set_operands", 12));
	ge836ov13151 = (GE_ms8("to_character", 12));
	ge836ov13168 = (GE_ms8("False", 5));
	ge836ov13169 = (GE_ms8("Precursor", 9));
	ge836ov13171 = (GE_ms8("True", 4));
	ge836ov13172 = (GE_ms8("Void", 4));
	ge836ov13173 = (GE_ms8("Unique", 6));
	ge836ov13180 = (GE_ms8("assign", 6));
	ge836ov13181 = (GE_ms8("attribute", 9));
	ge836ov13187 = (GE_ms8("current", 7));
	ge836ov13192 = (GE_ms8("elseif", 6));
	ge836ov13195 = (GE_ms8("expanded", 8));
	ge836ov13197 = (GE_ms8("external", 8));
	ge836ov13198 = (GE_ms8("false", 5));
	ge836ov13201 = (GE_ms8("frozen", 6));
	ge836ov13202 = (GE_ms8("if", 2));
	ge836ov13204 = (GE_ms8("indexing", 8));
	ge836ov13207 = (GE_ms8("inspect", 7));
	ge836ov13214 = (GE_ms8("obsolete", 8));
	ge836ov13222 = (GE_ms8("reference", 9));
	ge836ov13226 = (GE_ms8("result", 6));
	ge836ov13227 = (GE_ms8("retry", 5));
	ge836ov13228 = (GE_ms8("select", 6));
	ge836ov13229 = (GE_ms8("separate", 8));
	ge836ov13232 = (GE_ms8("true", 4));
	ge836ov13233 = (GE_ms8("undefine", 8));
	ge836ov13235 = (GE_ms8("until", 5));
	ge836ov13237 = (GE_ms8("void", 4));
	ge836ov13240 = (GE_ms8("->", 2));
	ge836ov13241 = (GE_ms8(":=", 2));
	ge836ov13242 = (GE_ms8("\?=", 2));
	ge836ov13243 = (GE_ms8("@", 1));
	ge836ov13244 = (GE_ms8("!", 1));
	ge836ov13245 = (GE_ms8(":", 1));
	ge836ov13246 = (GE_ms8(",", 1));
	ge836ov13249 = (GE_ms8("$", 1));
	ge836ov13250 = (GE_ms8(".", 1));
	ge836ov13251 = (GE_ms8("..", 2));
	ge836ov13252 = (GE_ms8("=", 1));
	ge836ov13253 = (GE_ms8(">=", 2));
	ge836ov13254 = (GE_ms8(">", 1));
	ge836ov13255 = (GE_ms8("<=", 2));
	ge836ov13256 = (GE_ms8("<<", 2));
	ge836ov13257 = (GE_ms8("{", 1));
	ge836ov13258 = (GE_ms8("[", 1));
	ge836ov13259 = (GE_ms8("(", 1));
	ge836ov13263 = (GE_ms8("/=", 2));
	ge836ov13267 = (GE_ms8("\?", 1));
	ge836ov13268 = (GE_ms8(">>", 2));
	ge836ov13269 = (GE_ms8("}", 1));
	ge836ov13270 = (GE_ms8("]", 1));
	ge836ov13271 = (GE_ms8(")", 1));
	ge836ov13272 = (GE_ms8(";", 1));
	ge836ov13273 = (GE_ms8("~", 1));
	ge296ov12364 = (GE_ms8("", 0));
	ge1043ov18665 = (GE_ms8("dummy", 5));
	ge1031ov23736 = (GE_ms8("vwbe0a", 6));
	ge1031ov23479 = (GE_ms8("VWBE", 4));
	ge1031ov23334 = (GE_ms8("boolean expression of non-BOOLEAN type \'$7\'.", 44));
	ge1031ov23711 = (GE_ms8("vtcg4a", 6));
	ge1031ov23466 = (GE_ms8("VTCG-4", 6));
	ge1031ov23309 = (GE_ms8("base class $9 of the $7-th actual generic parameter of $10 does not make feature `$8\' available as creation procedure to class $10.", 131));
	ge1031ov23712 = (GE_ms8("vtcg4b", 6));
	ge1031ov23310 = (GE_ms8("the $7-th actual generic parameter of $10, which is the $9-th formal generic parameter of class $5, does not list feature `$8\' as creation procedure in its generic constraint.", 175));
	ge1031ov23683 = (GE_ms8("vrle1a", 6));
	ge1031ov23457 = (GE_ms8("VRLE-1", 6));
	ge1031ov23281 = (GE_ms8("local variable name \'$7\' in feature `$8\' is also the final name of a feature.", 77));
	ge1031ov23684 = (GE_ms8("vrle2a", 6));
	ge1031ov23458 = (GE_ms8("VRLE-2", 6));
	ge1031ov23282 = (GE_ms8("local variable name \'$7\' in feature `$8\' is also the name of a formal argument of this feature.", 95));
	ge1031ov23680 = (GE_ms8("vreg0b", 6));
	ge1031ov23278 = (GE_ms8("local variable name \'$7\' appear twice in feature `$8\'.", 54));
	ge1031ov23732 = (GE_ms8("vuot3a", 6));
	ge1031ov23477 = (GE_ms8("VUOT-3", 6));
	ge1031ov23330 = (GE_ms8("object-test with local name \'$6\' has the same name as another object-test local appearing in the same feature `$7\' or in the same inline agent.", 143));
	ge1032ov7505 = (GE_ms8("unsigned", 8));
	ge1032ov7500 = (GE_ms8("tc", 2));
	ge1032ov7501 = (GE_ms8("&tc", 3));
	ge1032ov7469 = (GE_ms8("GE_rescue", 9));
	ge1032ov7471 = (GE_ms8("GE_setjmp", 9));
	ge1032ov7467 = (GE_ms8("GE_raise", 8));
	ge1032ov7470 = (GE_ms8("GE_retry", 8));
	ge1032ov7507 = (GE_ms8("volatile", 8));
	ge1032ov7504 = (GE_ms8("#undef", 6));
	ge1032ov7513 = (GE_ms8(".cpp", 4));
	ge1032ov7419 = (GE_ms8("EIF_TEST", 8));
	ge1032ov7438 = (GE_ms8("GE_argv", 7));
	ge1031ov23517 = (GE_ms8("vcfg3c", 6));
	ge1031ov23115 = (GE_ms8("invalid type \'$7\' in constraint of formal generic parameter.", 60));
	ge1031ov23620 = (GE_ms8("vhpr3c", 6));
	ge1031ov23420 = (GE_ms8("VHPR-3", 6));
	ge1031ov23218 = (GE_ms8("invalid type \'$7\' in parent clause.", 35));
	ge1031ov23532 = (GE_ms8("vdpr3b", 6));
	ge1031ov23380 = (GE_ms8("VDPR-3", 6));
	ge1031ov23130 = (GE_ms8("feature `$7\' is not the redefinition of an effective feature.", 61));
	ge1031ov23531 = (GE_ms8("vdpr3a", 6));
	ge1031ov23129 = (GE_ms8("conflict in Precursor construct between effective features `$7\' inherited from \'$8\' and `$9\' inherited from \'$10\'.", 114));
	ge1031ov23530 = (GE_ms8("vdpr2a", 6));
	ge1031ov23379 = (GE_ms8("VDPR-2", 6));
	ge1031ov23128 = (GE_ms8("class $7 in Precursor construct is not a parent of class $6.", 60));
	ge1031ov23534 = (GE_ms8("vdpr3d", 6));
	ge1031ov23132 = (GE_ms8("feature `$7\' is not the redeclaration of a feature.", 51));
	ge1031ov23529 = (GE_ms8("vdpr1b", 6));
	ge1031ov23378 = (GE_ms8("VDPR-1", 6));
	ge1031ov23127 = (GE_ms8("Precursor expression does not appear in a Routine_body.", 55));
	ge1031ov23724 = (GE_ms8("vuar4a", 6));
	ge1031ov23473 = (GE_ms8("VUAR-4", 6));
	ge1031ov23322 = (GE_ms8("`$7\' is not the final name of a feature in class $5.", 52));
	ge1031ov23504 = (GE_ms8("vaol1a", 6));
	ge1031ov23366 = (GE_ms8("VAOL-1", 6));
	ge1031ov23102 = (GE_ms8("old expression does not appear in a postcondition.", 50));
	ge1031ov23661 = (GE_ms8("vpca5b", 6));
	ge1031ov23445 = (GE_ms8("VPCA-5", 6));
	ge1031ov23259 = (GE_ms8("the type \'$10\' specified for the $9-th actual argument of Call_agent does not conform to the corresponding formal argument (of type \'$11\') of feature `$8\'.", 155));
	ge1031ov23660 = (GE_ms8("vpca5a", 6));
	ge1031ov23258 = (GE_ms8("the type \'$11\' specified for the $10-th actual argument of Call_agent does not conform to the corresponding formal argument (of type \'$12\') of feature `$8\' in class $9.", 168));
	ge1031ov23659 = (GE_ms8("vpca4b", 6));
	ge1031ov23444 = (GE_ms8("VPCA-4", 6));
	ge1031ov23257 = (GE_ms8("the $9-th actual argument (of type \'$10\') does not conform to the corresponding formal argument (of type \'$11\') of feature `$8\'.", 128));
	ge1031ov23658 = (GE_ms8("vpca4a", 6));
	ge1031ov23256 = (GE_ms8("the $10-th actual argument (of type \'$11\') does not conform to the corresponding formal argument (of type \'$12\') of feature `$8\' in class $9.", 141));
	ge1031ov23657 = (GE_ms8("vpca3b", 6));
	ge1031ov23443 = (GE_ms8("VPCA-3", 6));
	ge1031ov23255 = (GE_ms8("the number of actual arguments is not the same as the number of formal arguments of feature `$8\'.", 97));
	ge1031ov23656 = (GE_ms8("vpca3a", 6));
	ge1031ov23254 = (GE_ms8("the number of actual arguments is not the same as the number of formal arguments of feature `$8\' in class $9.", 109));
	ge1031ov23667 = (GE_ms8("vpir1f", 6));
	ge1031ov23446 = (GE_ms8("VPIR-1", 6));
	ge1031ov23265 = (GE_ms8("local variable name \'$7\' in inline agent is also the name of an object-test local of an enclosing feature or inline agent whose scope contains the inline agent.", 160));
	ge1031ov23665 = (GE_ms8("vpir1d", 6));
	ge1031ov23263 = (GE_ms8("local variable name \'$7\' in inline agent is also the name of a local variable of an enclosing feature or inline agent.", 118));
	ge1031ov23664 = (GE_ms8("vpir1c", 6));
	ge1031ov23262 = (GE_ms8("local variable name \'$7\' in inline agent is also the name of a formal argument of an enclosing feature or inline agent.", 119));
	ge1031ov23686 = (GE_ms8("vrlv1b", 6));
	ge1031ov23459 = (GE_ms8("VRLV-1", 6));
	ge1031ov23284 = (GE_ms8("local variable name \'$7\' in inline agent is also the final name of a feature.", 77));
	ge1031ov23688 = (GE_ms8("vrlv2b", 6));
	ge1031ov23460 = (GE_ms8("VRLV-2", 6));
	ge1031ov23286 = (GE_ms8("local variable name \'$7\' in inline agent is also the name of a formal argument of this agent.", 93));
	ge1031ov23678 = (GE_ms8("vred0d", 6));
	ge1031ov23454 = (GE_ms8("VRED", 4));
	ge1031ov23276 = (GE_ms8("local variable name \'$7\' appear twice in inline agent.", 54));
	ge1031ov23733 = (GE_ms8("vuot3b", 6));
	ge1031ov23331 = (GE_ms8("object-test with local name \'$6\' has the same name as another object-test local appearing in the invariant or in the same inline agent.", 135));
	ge1031ov23666 = (GE_ms8("vpir1e", 6));
	ge1031ov23264 = (GE_ms8("argument name \'$7\' in inline agent is also the name of an object-test local of an enclosing feature or inline agent whose scope contains the inline agent.", 154));
	ge1031ov23663 = (GE_ms8("vpir1b", 6));
	ge1031ov23261 = (GE_ms8("argument name \'$7\' in inline agent is also the name of a local variable of an enclosing feature or inline agent.", 112));
	ge1031ov23662 = (GE_ms8("vpir1a", 6));
	ge1031ov23260 = (GE_ms8("argument name \'$7\' in inline agent is also the name of a formal argument of an enclosing feature or inline agent.", 113));
	ge1031ov23682 = (GE_ms8("vrfa0b", 6));
	ge1031ov23280 = (GE_ms8("argument name \'$7\' in inline agent is also the final name of a feature.", 71));
	ge1031ov23677 = (GE_ms8("vred0c", 6));
	ge1031ov23275 = (GE_ms8("argument name \'$7\' appear twice in inline agent.", 48));
	ge1031ov23714 = (GE_ms8("vtct0b", 6));
	ge1031ov23312 = (GE_ms8("type based on unknown class $7.", 31));
	ge1031ov23521 = (GE_ms8("vcfg3h", 6));
	ge1031ov23119 = (GE_ms8("constraint of formal generic parameter \'$7\' contains \'$8\' itself.", 65));
	ge1031ov23519 = (GE_ms8("vcfg3e", 6));
	ge1031ov23117 = (GE_ms8("constraint of formal generic parameter \'$7\' is another formal generic parameter \'$8\'.", 85));
	ge1031ov23518 = (GE_ms8("vcfg3d", 6));
	ge1031ov23116 = (GE_ms8("constraint of formal generic parameter \'$7\' is \'$8\' itself.", 59));
	ge1031ov23710 = (GE_ms8("vtcg3a", 6));
	ge1031ov23465 = (GE_ms8("VTCG-3", 6));
	ge1031ov23308 = (GE_ms8("actual generic parameter \'$7\' in type \'$9\' does not conform to constraint \'$8\'.", 79));
	ge1031ov23757 = (GE_ms8("gvtcg5a", 7));
	ge1031ov23497 = (GE_ms8("GVTCG-5", 7));
	ge1031ov23355 = (GE_ms8("actual generic parameter \'$7\' in type \'$8\' is not a reference type but the corresponding formal parameter is marked as reference.", 129));
	ge1031ov23758 = (GE_ms8("gvtcg5b", 7));
	ge1031ov23356 = (GE_ms8("actual generic parameter \'$7\' in type \'$8\' is not expanded type but the corresponding formal parameter is marked as expanded.", 125));
	ge1031ov23718 = (GE_ms8("vtug2a", 6));
	ge1031ov23470 = (GE_ms8("VTUG-2", 6));
	ge1031ov23316 = (GE_ms8("type \'$7\' has wrong number of actual generic parameters.", 56));
	ge1031ov23717 = (GE_ms8("vtug1a", 6));
	ge1031ov23469 = (GE_ms8("VTUG-1", 6));
	ge1031ov23315 = (GE_ms8("type \'$7\' has actual generic parameters but class $8 is not generic.", 68));
	ge1031ov23745 = (GE_ms8("gvhpr5a", 7));
	ge1031ov23486 = (GE_ms8("GVHPR-5", 7));
	ge1031ov23343 = (GE_ms8("cannot inherit from Tuple_type \'$7\'.", 36));
	ge1031ov23735 = (GE_ms8("vuot4b", 6));
	ge1031ov23478 = (GE_ms8("VUOT-4", 6));
	ge1031ov23333 = (GE_ms8("ISE does not support object-tests in check instructions.", 56));
	ge1031ov23734 = (GE_ms8("vuot4a", 6));
	ge1031ov23332 = (GE_ms8("ISE does not support object-tests in preconditions.", 51));
	ge1031ov23731 = (GE_ms8("vuot1d", 6));
	ge1031ov23476 = (GE_ms8("VUOT-1", 6));
	ge1031ov23329 = (GE_ms8("object-test with local name \'$6\' appears in the scope of another object-test local with the same name.", 102));
	ge1031ov23730 = (GE_ms8("vuot1c", 6));
	ge1031ov23328 = (GE_ms8("object-test local name \'$6\' is also the name of a local variable of an enclosing feature or inline agent.", 105));
	ge1031ov23729 = (GE_ms8("vuot1b", 6));
	ge1031ov23327 = (GE_ms8("object-test local name \'$6\' is also the name of a formal argument of an enclosing feature or inline agent.", 106));
	ge1031ov23728 = (GE_ms8("vuot1a", 6));
	ge1031ov23326 = (GE_ms8("object-test local name \'$6\' is also the final name of a feature.", 64));
	ge1031ov23738 = (GE_ms8("vweq0b", 6));
	ge1031ov23480 = (GE_ms8("VWEQ", 4));
	ge1031ov23336 = (GE_ms8("none of the operands of \'$7\' (of types \'$8\' and \'$9\') conforms or converts to the other.", 88));
	ge1031ov23737 = (GE_ms8("vweq0a", 6));
	ge1031ov23335 = (GE_ms8("none of the operands of \'$7\' (of types \'$8\' and \'$9\') conforms or converts to the other.", 88));
	ge1031ov23604 = (GE_ms8("vgcc6c", 6));
	ge1031ov23202 = (GE_ms8("procedure `$8\' of class $9 is not exported for creation to class $5.", 68));
	ge1031ov23607 = (GE_ms8("vgcc8a", 6));
	ge1031ov23415 = (GE_ms8("VGCC-8", 6));
	ge1031ov23205 = (GE_ms8("procedure `$8\' of class $9 is not listed as creation procedure of the $10-th formal generic parameter of class $5.", 114));
	ge1031ov23597 = (GE_ms8("vgcc1a", 6));
	ge1031ov23411 = (GE_ms8("VGCC-1", 6));
	ge1031ov23195 = (GE_ms8("creation expression with no Creation_call part, but $7 is deferred.", 67));
	ge1031ov23600 = (GE_ms8("vgcc5a", 6));
	ge1031ov23413 = (GE_ms8("VGCC-5", 6));
	ge1031ov23198 = (GE_ms8("creation expression with no Creation_call part, but $7 has a Creators part.", 75));
	ge1031ov23603 = (GE_ms8("vgcc6b", 6));
	ge1031ov23201 = (GE_ms8("`$7\' is not the final name of a procedure in class $9.", 54));
	ge1031ov23673 = (GE_ms8("vqmc6a", 6));
	ge1031ov23452 = (GE_ms8("VQMC-6", 6));
	ge1031ov23271 = (GE_ms8("bit constant attribute `$7\' is not declared of Bit_type.", 56));
	ge1031ov23672 = (GE_ms8("vqmc5a", 6));
	ge1031ov23451 = (GE_ms8("VQMC-5", 6));
	ge1031ov23270 = (GE_ms8("string constant attribute `$7\' is not declared of type STRING.", 62));
	ge1031ov23671 = (GE_ms8("vqmc4a", 6));
	ge1031ov23450 = (GE_ms8("VQMC-4", 6));
	ge1031ov23269 = (GE_ms8("real constant attribute `$7\' is not declared of type REAL or DOUBLE.", 68));
	ge1031ov23670 = (GE_ms8("vqmc3a", 6));
	ge1031ov23449 = (GE_ms8("VQMC-3", 6));
	ge1031ov23268 = (GE_ms8("integer constant attribute `$7\' is not declared of type INTEGER.", 64));
	ge1031ov23669 = (GE_ms8("vqmc2a", 6));
	ge1031ov23448 = (GE_ms8("VQMC-2", 6));
	ge1031ov23267 = (GE_ms8("character constant attribute `$7\' is not declared of type CHARACTER.", 68));
	ge1031ov23668 = (GE_ms8("vqmc1a", 6));
	ge1031ov23447 = (GE_ms8("VQMC-1", 6));
	ge1031ov23266 = (GE_ms8("boolean constant attribute `$7\' is not declared of type BOOLEAN.", 64));
	ge1031ov23674 = (GE_ms8("vqui0a", 6));
	ge1031ov23453 = (GE_ms8("VQUI", 4));
	ge1031ov23272 = (GE_ms8("unique attribute `$7\' is not declared of type INTEGER.", 54));
	ge1032ov7451 = (GE_ms8("GE_int8", 7));
	ge1032ov7452 = (GE_ms8("GE_int16", 8));
	ge1032ov7453 = (GE_ms8("GE_int32", 8));
	ge1032ov7454 = (GE_ms8("GE_int64", 8));
	ge1032ov7459 = (GE_ms8("GE_nat8", 7));
	ge1032ov7460 = (GE_ms8("GE_nat16", 8));
	ge1032ov7461 = (GE_ms8("GE_nat32", 8));
	ge1032ov7462 = (GE_ms8("GE_nat64", 8));
	ge1031ov23516 = (GE_ms8("vcfg3b", 6));
	ge1031ov23114 = (GE_ms8("invalid type \'$7\' in constraint of formal generic parameter.", 60));
	ge1031ov23619 = (GE_ms8("vhpr3b", 6));
	ge1031ov23217 = (GE_ms8("invalid type \'$7\' in parent clause.", 35));
	ge1031ov23744 = (GE_ms8("gvhpr4a", 7));
	ge1031ov23485 = (GE_ms8("GVHPR-4", 7));
	ge1031ov23342 = (GE_ms8("cannot inherit from Bit_type \'$7\'.", 34));
	ge1031ov23707 = (GE_ms8("vtbt0b", 6));
	ge1031ov23305 = (GE_ms8("invalid type \'$7\': `$8\' is not the final name of a feature.", 59));
	ge1031ov23706 = (GE_ms8("vtbt0a", 6));
	ge1031ov23304 = (GE_ms8("invalid type \'$7\': `$8\' is not the final name of a constant attribute of type INTEGER.", 86));
	ge1031ov23515 = (GE_ms8("vcfg3a", 6));
	ge1031ov23113 = (GE_ms8("invalid type \'$7\' in constraint of formal generic parameter.", 60));
	ge1031ov23618 = (GE_ms8("vhpr3a", 6));
	ge1031ov23216 = (GE_ms8("invalid type \'$7\' in parent clause.", 35));
	ge1031ov23705 = (GE_ms8("vtat2b", 6));
	ge1031ov23303 = (GE_ms8("invalid type \'$7\' when part of a qualified anchored type: the type of anchor `$8\' must not contain anchored types (other than \'like Current\').", 142));
	ge1031ov23701 = (GE_ms8("vtat1a", 6));
	ge1031ov23462 = (GE_ms8("VTAT-1", 6));
	ge1031ov23299 = (GE_ms8("invalid type \'$7\': the anchor `$8\' must be the final name of a query.", 69));
	ge1031ov23702 = (GE_ms8("vtat1b", 6));
	ge1031ov23300 = (GE_ms8("invalid type \'$7\': the anchor `$8\' must be the final name of a query, or an argument of routine `$9\'.", 101));
	ge1031ov23703 = (GE_ms8("vtat1c", 6));
	ge1031ov23301 = (GE_ms8("invalid type \'$7\': the anchor `$8\' must be the final name of a query in class $9.", 81));
	ge1031ov23654 = (GE_ms8("vpca1b", 6));
	ge1031ov23441 = (GE_ms8("VPCA-1", 6));
	ge1031ov23252 = (GE_ms8("`$7\' is not the final name of a feature in class $8.", 52));
	ge1031ov23655 = (GE_ms8("vpca2a", 6));
	ge1031ov23442 = (GE_ms8("VPCA-2", 6));
	ge1031ov23253 = (GE_ms8("feature `$8\' of class $9 is not exported to class $5.", 53));
	ge1031ov23653 = (GE_ms8("vpca1a", 6));
	ge1031ov23251 = (GE_ms8("`$7\' is not the final name of a feature in class $5.", 52));
	ge1031ov23741 = (GE_ms8("vwst2a", 6));
	ge1031ov23482 = (GE_ms8("VWST-2", 6));
	ge1031ov23339 = (GE_ms8("feature name `$7\' appears twice in strip expression.", 52));
	ge1031ov23739 = (GE_ms8("vwst1a", 6));
	ge1031ov23481 = (GE_ms8("VWST-1", 6));
	ge1031ov23337 = (GE_ms8("feature name `$7\' is not the final name of a feature in class $5.", 65));
	ge1031ov23742 = (GE_ms8("vxrt0a", 6));
	ge1031ov23483 = (GE_ms8("VXRT", 4));
	ge1031ov23340 = (GE_ms8("Retry instruction does not appear in a Rescue clause.", 53));
	ge1032ov7475 = (GE_ms8("goto", 4));
	ge1031ov23509 = (GE_ms8("vbac2a", 6));
	ge1031ov23370 = (GE_ms8("VBAC-2", 6));
	ge1031ov23107 = (GE_ms8("query `$7\' in class $8 has no assigner command.", 47));
	ge1031ov23508 = (GE_ms8("vbac1a", 6));
	ge1031ov23369 = (GE_ms8("VBAC-1", 6));
	ge1031ov23106 = (GE_ms8("the source of the assigner call (of type \'$7\') does not conform nor convert to its target (of type \'$8\').", 105));
	ge1031ov23628 = (GE_ms8("vjar0a", 6));
	ge1031ov23425 = (GE_ms8("VJAR", 4));
	ge1031ov23226 = (GE_ms8("the source of the assignment (of type \'$7\') does not conform nor convert to its target entity (of type \'$8\').", 109));
	ge1031ov23564 = (GE_ms8("veen0a", 6));
	ge1031ov23397 = (GE_ms8("VEEN", 4));
	ge1031ov23162 = (GE_ms8("`$7\' appears in feature `$8\', but it is not the final name of a feature in class $6 nor the name of a local variable or formal argument of feature `$8\'.", 152));
	ge1031ov23565 = (GE_ms8("veen0b", 6));
	ge1031ov23163 = (GE_ms8("`$7\' appears in an inline agent, but it is not the final name of a feature in class $6 nor the name of a local variable or formal argument of this inline agent.", 160));
	ge1031ov23630 = (GE_ms8("vjaw0b", 6));
	ge1031ov23426 = (GE_ms8("VJAW", 4));
	ge1031ov23228 = (GE_ms8("`$7\' is the name of a formal argument of feature `$8\'. A Writable is either a local variable (including Result) or an attribute.", 128));
	ge1031ov23631 = (GE_ms8("vjaw0c", 6));
	ge1031ov23229 = (GE_ms8("`$7\' is the name of a formal argument of an inline agent. A Writable is either a local variable (including Result) or an attribute.", 131));
	ge1031ov23629 = (GE_ms8("vjaw0a", 6));
	ge1031ov23227 = (GE_ms8("feature `$7\' is not an attribute. A Writable is either a local variable (including Result) or an attribute.", 107));
	ge1031ov23632 = (GE_ms8("vjrv0a", 6));
	ge1031ov23427 = (GE_ms8("VJRV", 4));
	ge1031ov23230 = (GE_ms8("the type \'$7\' of the target entity of the assignment attempt is not a reference type.", 85));
	ge1031ov23651 = (GE_ms8("vomb2a", 6));
	ge1031ov23440 = (GE_ms8("VOMB-2", 6));
	ge1031ov23249 = (GE_ms8("inspect constant of type \'$7\' different from type \'$8\' of inspect expression.", 77));
	ge1031ov23652 = (GE_ms8("vomb2b", 6));
	ge1031ov23250 = (GE_ms8("inspect choice `$7\' is not a constant attribute.", 48));
	ge1031ov23650 = (GE_ms8("vomb1a", 6));
	ge1031ov23439 = (GE_ms8("VOMB-1", 6));
	ge1031ov23248 = (GE_ms8("inspect expression of type \'$7\' different from INTEGER or CHARACTER.", 68));
	ge1031ov23507 = (GE_ms8("vave0a", 6));
	ge1031ov23368 = (GE_ms8("VAVE", 4));
	ge1031ov23105 = (GE_ms8("loop variant expression of non-INTEGER type \'$7\'.", 49));
	ge1032ov7508 = (GE_ms8("while", 5));
	ge1031ov23606 = (GE_ms8("vgcc6e", 6));
	ge1031ov23204 = (GE_ms8("procedure `$8\' of class $9 is not exported for creation to class $5.", 68));
	ge1031ov23608 = (GE_ms8("vgcc8b", 6));
	ge1031ov23206 = (GE_ms8("procedure `$8\' of class $9 is not listed as creation procedure of the $10-th formal generic parameter of class $5.", 114));
	ge1031ov23598 = (GE_ms8("vgcc1b", 6));
	ge1031ov23196 = (GE_ms8("creation instruction with no Creation_call part, but $7 is deferred.", 68));
	ge1031ov23601 = (GE_ms8("vgcc5b", 6));
	ge1031ov23199 = (GE_ms8("creation instruction with no Creation_call part, but $7 has a Creators part.", 76));
	ge1031ov23599 = (GE_ms8("vgcc3a", 6));
	ge1031ov23412 = (GE_ms8("VGCC-3", 6));
	ge1031ov23197 = (GE_ms8("explicit creation type \'$7\' does not conform to target entity type \'$8\'.", 72));
	ge1031ov23605 = (GE_ms8("vgcc6d", 6));
	ge1031ov23203 = (GE_ms8("`$7\' is not the final name of a procedure in class $9.", 54));
	ge1031ov23528 = (GE_ms8("vdpr1a", 6));
	ge1031ov23126 = (GE_ms8("Precursor instruction does not appear in a Routine_body.", 56));
	ge1031ov23633 = (GE_ms8("vkcn1a", 6));
	ge1031ov23231 = (GE_ms8("query `$8\' of class $9 appears in a call instruction.", 53));
	ge1021ov30941 = (GE_ms8("gcaaa", 5));
	ge1021ov30937 = (GE_ms8("GCAAA", 5));
	ge1021ov30933 = (GE_ms8("[$1] cluster $2: cannot read cluster directory \'$3\'.", 52));
	ge315ov9864 = (GE_ms8("dummy", 5));
	ge313ov30731 = (GE_ms8("", 0));
	ge337ov9902 = (GE_ms8(".", 1));
	ge337ov9903 = (GE_ms8("..", 2));
	ge325ov10075 = (GE_ms8("..", 2));
	ge325ov10074 = (GE_ms8(".", 1));
	ge340ov9902 = (GE_ms8(".", 1));
	ge340ov9903 = (GE_ms8("..", 2));
	ge1355ov10878 = (GE_ms8("root", 4));
	ge1336ov23834 = (GE_ms8("Namespace declared twice", 24));
	ge1336ov23833 = (GE_ms8("Undeclared namespace error", 26));
	ge425ov9815 = (GE_ms8("\n", 1));
	ge336ov9815 = (GE_ms8("\n", 1));
	ge322ov9815 = (GE_ms8("\n", 1));
	ge55ov4174 = (GE_ms8("\n", 1));
	ge55ov4175 = (GE_ms8("\n", 1));
	ge55ov4176 = (GE_ms8("\nOptions:\n", 10));
	ge840ov25221 = (GE_ms8("alias \"", 7));
	ge836ov13336 = (GE_ms8("alias \"[]\"", 10));
	ge836ov13317 = (GE_ms8("alias \"and\"", 11));
	ge836ov13333 = (GE_ms8("alias \"and then\"", 16));
	ge836ov13321 = (GE_ms8("alias \"//\"", 10));
	ge836ov13322 = (GE_ms8("alias \"/\"", 9));
	ge836ov13323 = (GE_ms8("alias \">=\"", 10));
	ge836ov13324 = (GE_ms8("alias \">\"", 9));
	ge836ov13318 = (GE_ms8("alias \"implies\"", 15));
	ge836ov13325 = (GE_ms8("alias \"<=\"", 10));
	ge836ov13326 = (GE_ms8("alias \"<\"", 9));
	ge836ov13327 = (GE_ms8("alias \"-\"", 9));
	ge836ov13328 = (GE_ms8("alias \"\\\\\"", 10));
	ge836ov13319 = (GE_ms8("alias \"or\"", 10));
	ge836ov13334 = (GE_ms8("alias \"or else\"", 15));
	ge836ov13329 = (GE_ms8("alias \"+\"", 9));
	ge836ov13330 = (GE_ms8("alias \"^\"", 9));
	ge836ov13331 = (GE_ms8("alias \"*\"", 9));
	ge836ov13320 = (GE_ms8("alias \"xor\"", 11));
	ge836ov13332 = (GE_ms8("alias \"..\"", 10));
	ge836ov13335 = (GE_ms8("alias \"not\"", 11));
	ge836ov13275 = (GE_ms8("***unknown_name***", 18));
	ge1403ov25075 = (GE_ms8("us-ascii", 8));
	ge1403ov25077 = (GE_ms8("utf-8", 5));
	ge769ov12437 = (GE_ms8(".", 1));
	ge769ov12438 = (GE_ms8("..", 2));
	ge836ov13313 = (GE_ms8("infix \"or else\"", 15));
	ge836ov13312 = (GE_ms8("infix \"and then\"", 16));
	ge836ov13300 = (GE_ms8("infix \"//\"", 10));
	ge836ov13301 = (GE_ms8("infix \"/\"", 9));
	ge836ov13302 = (GE_ms8("infix \">=\"", 10));
	ge836ov13303 = (GE_ms8("infix \">\"", 9));
	ge836ov13304 = (GE_ms8("infix \"<=\"", 10));
	ge836ov13305 = (GE_ms8("infix \"<\"", 9));
	ge836ov13306 = (GE_ms8("infix \"-\"", 9));
	ge836ov13307 = (GE_ms8("infix \"\\\\\"", 10));
	ge836ov13308 = (GE_ms8("infix \"+\"", 9));
	ge836ov13309 = (GE_ms8("infix \"^\"", 9));
	ge836ov13310 = (GE_ms8("infix \"*\"", 9));
	ge836ov13311 = (GE_ms8("infix \"..\"", 10));
	ge836ov13315 = (GE_ms8("prefix \"-\"", 10));
	ge836ov13316 = (GE_ms8("prefix \"+\"", 10));
	ge836ov13296 = (GE_ms8("infix \"and\"", 11));
	ge836ov13297 = (GE_ms8("infix \"implies\"", 15));
	ge836ov13298 = (GE_ms8("infix \"or\"", 10));
	ge836ov13299 = (GE_ms8("infix \"xor\"", 11));
	ge836ov13314 = (GE_ms8("prefix \"not\"", 12));
	ge859ov25878 = (GE_ms8("infix \"", 7));
	ge859ov25877 = (GE_ms8("prefix \"", 8));
	ge836ov13264 = (GE_ms8("/~", 2));
	ge876ov27033 = (GE_ms8("prefix \"", 8));
	ge865ov25132 = (GE_ms8("infix \"", 7));
	ge1131ov4124 = (GE_ms8("found invalid expression \'$1\' at $2", 35));
	ge226ov4124 = (GE_ms8("$0: too many (i.e. $1) nested include files", 43));
	ge225ov4124 = (GE_ms8("Syntax error in \"$1\" at line $2", 31));
	ge1125ov4124 = (GE_ms8("attribute \'$2\' of element <$1> at $4 is obsolete, use element $3 instead", 72));
	ge1141ov4124 = (GE_ms8("option name \'$1\' in option-element is unknown $2", 48));
	ge1138ov4124 = (GE_ms8("<exclude> at $1 is obsolete, use \'if\'/\'unless\' attributes instead", 65));
	ge1137ov4124 = (GE_ms8("<cluster> at $1 is obsolete. Specify options, clusters and mounts directly under <system> instead", 97));
	ge1133ov4124 = (GE_ms8("element \'$1\' must have child-element \'$2\' $3", 44));
	ge1140ov4124 = (GE_ms8("found unknown element \'$2\' in element \'$1\' $3", 45));
	ge1132ov4124 = (GE_ms8("element \'$1\' must have attribute \'$2\' $3", 40));
	ge1144ov4124 = (GE_ms8("Xace document must have a \'$1\' root-element $2", 46));
	ge1128ov4124 = (GE_ms8("element <$1> at $3 is obsolete, use element $2 instead", 54));
	ge1139ov4124 = (GE_ms8("attribute \'$2\' in element \'$1\' should have a positive integer value $4", 70));
	ge1143ov4124 = (GE_ms8("attribute \'$2\' in element \'$1\' should have one of the following values: $4 $5", 77));
	ge1135ov4124 = (GE_ms8("attribute \'$2\' in element \'$1\' should have a non-empty value $3", 63));
	ge1126ov4124 = (GE_ms8("attribute \'$2\' in element \'$1\' should have a boolean value $4", 61));
	ge1134ov4124 = (GE_ms8("Library \'$1\' mounted with incompatible prefixes \'$2\' and \'$3\' in $4 and $5", 74));
	ge220ov4124 = (GE_ms8("$0: cannot write to \'$1\'", 24));
	ge223ov4124 = (GE_ms8("$1", 2));
	ge230ov4124 = (GE_ms8("$0 version $1", 13));
	ge219ov4124 = (GE_ms8("$0: cannot read \'$1\'", 20));
	ge333ov25671 = (GE_ms8("", 0));
	ge318ov1905 = (GE_ms8("", 0));
	geic2 = (GE_ms8(" (label on item #", 17));
	geic3 = (GE_ms8(" with a manifest tuple argument", 31));
	geic4 = (GE_ms8(" of type ", 9));
}

EIF_TYPE GE_types[1766] = {
{0, 0, EIF_FALSE, 0},
{0, 1, EIF_FALSE, 0},
{0, 2, EIF_FALSE, 0},
{0, 3, EIF_FALSE, 0},
{0, 4, EIF_FALSE, 0},
{0, 5, EIF_FALSE, 0},
{0, 6, EIF_FALSE, 0},
{0, 7, EIF_FALSE, 0},
{0, 8, EIF_FALSE, 0},
{0, 9, EIF_FALSE, 0},
{0, 10, EIF_FALSE, 0},
{0, 11, EIF_FALSE, 0},
{0, 12, EIF_FALSE, 0},
{0, 13, EIF_FALSE, 0},
{0, 14, EIF_FALSE, 0},
{0, 15, EIF_TRUE, 0},
{0, 16, EIF_TRUE, 0},
{0, 17, EIF_FALSE, 0},
{0, 18, EIF_FALSE, 0},
{0, 19, EIF_FALSE, 0},
{0, 20, EIF_FALSE, 0},
{0, 21, EIF_FALSE, 0},
{0, 22, EIF_FALSE, &T22f42},
{0, 23, EIF_FALSE, 0},
{0, 24, EIF_FALSE, 0},
{0, 25, EIF_FALSE, 0},
{0, 26, EIF_FALSE, 0},
{0, 27, EIF_FALSE, 0},
{0, 28, EIF_FALSE, 0},
{0, 29, EIF_FALSE, 0},
{0, 30, EIF_FALSE, 0},
{0, 31, EIF_FALSE, 0},
{0, 32, EIF_FALSE, 0},
{0, 33, EIF_FALSE, 0},
{0, 34, EIF_FALSE, 0},
{0, 35, EIF_FALSE, 0},
{0, 36, EIF_FALSE, 0},
{0, 37, EIF_FALSE, 0},
{0, 38, EIF_FALSE, 0},
{0, 39, EIF_FALSE, 0},
{0, 40, EIF_FALSE, 0},
{0, 41, EIF_FALSE, 0},
{0, 42, EIF_FALSE, 0},
{0, 43, EIF_FALSE, 0},
{0, 44, EIF_FALSE, 0},
{0, 45, EIF_FALSE, 0},
{0, 46, EIF_FALSE, 0},
{0, 47, EIF_FALSE, 0},
{0, 48, EIF_FALSE, 0},
{0, 49, EIF_FALSE, 0},
{0, 50, EIF_FALSE, 0},
{0, 51, EIF_FALSE, 0},
{0, 52, EIF_FALSE, 0},
{0, 53, EIF_FALSE, 0},
{0, 54, EIF_FALSE, 0},
{0, 55, EIF_FALSE, 0},
{0, 56, EIF_FALSE, 0},
{0, 57, EIF_FALSE, 0},
{0, 58, EIF_FALSE, 0},
{0, 59, EIF_FALSE, 0},
{0, 60, EIF_FALSE, 0},
{0, 61, EIF_FALSE, 0},
{0, 62, EIF_FALSE, 0},
{0, 63, EIF_FALSE, 0},
{0, 64, EIF_FALSE, 0},
{0, 65, EIF_FALSE, 0},
{0, 66, EIF_FALSE, 0},
{0, 67, EIF_FALSE, 0},
{0, 68, EIF_FALSE, 0},
{0, 69, EIF_FALSE, 0},
{0, 70, EIF_FALSE, 0},
{0, 71, EIF_FALSE, 0},
{0, 72, EIF_FALSE, 0},
{0, 73, EIF_FALSE, 0},
{0, 74, EIF_FALSE, 0},
{0, 75, EIF_FALSE, 0},
{0, 76, EIF_FALSE, 0},
{0, 77, EIF_FALSE, 0},
{0, 78, EIF_FALSE, 0},
{0, 79, EIF_FALSE, 0},
{0, 80, EIF_FALSE, 0},
{0, 81, EIF_FALSE, 0},
{0, 82, EIF_FALSE, 0},
{0, 83, EIF_FALSE, 0},
{0, 84, EIF_FALSE, 0},
{0, 85, EIF_FALSE, 0},
{0, 86, EIF_FALSE, 0},
{0, 87, EIF_FALSE, 0},
{0, 88, EIF_FALSE, 0},
{0, 89, EIF_TRUE, 0},
{0, 90, EIF_FALSE, 0},
{0, 91, EIF_FALSE, 0},
{0, 92, EIF_FALSE, 0},
{0, 93, EIF_FALSE, 0},
{0, 94, EIF_FALSE, 0},
{0, 95, EIF_FALSE, 0},
{0, 96, EIF_FALSE, 0},
{0, 97, EIF_FALSE, 0},
{0, 98, EIF_FALSE, 0},
{0, 99, EIF_FALSE, 0},
{0, 100, EIF_FALSE, 0},
{0, 101, EIF_FALSE, 0},
{0, 102, EIF_FALSE, 0},
{0, 103, EIF_FALSE, 0},
{0, 104, EIF_FALSE, 0},
{0, 105, EIF_FALSE, 0},
{0, 106, EIF_FALSE, 0},
{0, 107, EIF_FALSE, 0},
{0, 108, EIF_FALSE, 0},
{0, 109, EIF_FALSE, 0},
{0, 110, EIF_FALSE, 0},
{0, 111, EIF_FALSE, 0},
{0, 112, EIF_FALSE, 0},
{0, 113, EIF_FALSE, 0},
{0, 114, EIF_FALSE, 0},
{0, 115, EIF_FALSE, 0},
{0, 116, EIF_FALSE, 0},
{0, 117, EIF_FALSE, 0},
{0, 118, EIF_FALSE, 0},
{0, 119, EIF_FALSE, 0},
{0, 120, EIF_FALSE, 0},
{0, 121, EIF_TRUE, 0},
{0, 122, EIF_FALSE, 0},
{0, 123, EIF_FALSE, 0},
{0, 124, EIF_FALSE, 0},
{0, 125, EIF_FALSE, 0},
{0, 126, EIF_FALSE, 0},
{0, 127, EIF_FALSE, 0},
{0, 128, EIF_FALSE, 0},
{0, 129, EIF_FALSE, 0},
{0, 130, EIF_FALSE, 0},
{0, 131, EIF_FALSE, 0},
{0, 132, EIF_FALSE, 0},
{0, 133, EIF_FALSE, 0},
{0, 134, EIF_FALSE, 0},
{0, 135, EIF_FALSE, 0},
{0, 136, EIF_FALSE, 0},
{0, 137, EIF_FALSE, 0},
{0, 138, EIF_FALSE, 0},
{0, 139, EIF_FALSE, 0},
{0, 140, EIF_FALSE, 0},
{0, 141, EIF_FALSE, 0},
{0, 142, EIF_FALSE, 0},
{0, 143, EIF_FALSE, 0},
{0, 144, EIF_FALSE, 0},
{0, 145, EIF_FALSE, 0},
{0, 146, EIF_FALSE, 0},
{0, 147, EIF_FALSE, 0},
{0, 148, EIF_FALSE, 0},
{0, 149, EIF_TRUE, 0},
{0, 150, EIF_FALSE, 0},
{0, 151, EIF_TRUE, 0},
{0, 152, EIF_FALSE, 0},
{0, 153, EIF_FALSE, 0},
{0, 154, EIF_FALSE, 0},
{0, 155, EIF_FALSE, 0},
{0, 156, EIF_FALSE, 0},
{0, 157, EIF_FALSE, 0},
{0, 158, EIF_TRUE, 0},
{0, 159, EIF_TRUE, 0},
{0, 160, EIF_FALSE, 0},
{0, 161, EIF_TRUE, 0},
{0, 162, EIF_TRUE, 0},
{0, 163, EIF_FALSE, 0},
{0, 164, EIF_FALSE, 0},
{0, 165, EIF_FALSE, 0},
{0, 166, EIF_TRUE, 0},
{0, 167, EIF_FALSE, 0},
{0, 168, EIF_FALSE, 0},
{0, 169, EIF_FALSE, 0},
{0, 170, EIF_FALSE, 0},
{0, 171, EIF_FALSE, 0},
{0, 172, EIF_FALSE, 0},
{0, 173, EIF_FALSE, 0},
{0, 174, EIF_FALSE, 0},
{0, 175, EIF_FALSE, 0},
{0, 176, EIF_FALSE, 0},
{0, 177, EIF_FALSE, 0},
{0, 178, EIF_FALSE, 0},
{0, 179, EIF_FALSE, 0},
{0, 180, EIF_FALSE, 0},
{0, 181, EIF_FALSE, 0},
{0, 182, EIF_FALSE, 0},
{0, 183, EIF_FALSE, 0},
{0, 184, EIF_FALSE, 0},
{0, 185, EIF_FALSE, 0},
{0, 186, EIF_FALSE, 0},
{0, 187, EIF_FALSE, 0},
{0, 188, EIF_FALSE, 0},
{0, 189, EIF_FALSE, 0},
{0, 190, EIF_FALSE, 0},
{0, 191, EIF_FALSE, 0},
{0, 192, EIF_FALSE, 0},
{0, 193, EIF_FALSE, 0},
{0, 194, EIF_FALSE, 0},
{0, 195, EIF_FALSE, 0},
{0, 196, EIF_FALSE, 0},
{0, 197, EIF_FALSE, 0},
{0, 198, EIF_FALSE, 0},
{0, 199, EIF_FALSE, 0},
{0, 200, EIF_FALSE, 0},
{0, 201, EIF_FALSE, 0},
{0, 202, EIF_FALSE, 0},
{0, 203, EIF_FALSE, 0},
{0, 204, EIF_FALSE, 0},
{0, 205, EIF_FALSE, 0},
{0, 206, EIF_FALSE, 0},
{0, 207, EIF_FALSE, 0},
{0, 208, EIF_FALSE, 0},
{0, 209, EIF_FALSE, 0},
{0, 210, EIF_FALSE, 0},
{0, 211, EIF_FALSE, 0},
{0, 212, EIF_FALSE, 0},
{0, 213, EIF_FALSE, 0},
{0, 214, EIF_FALSE, 0},
{0, 215, EIF_FALSE, 0},
{0, 216, EIF_FALSE, 0},
{0, 217, EIF_FALSE, 0},
{0, 218, EIF_FALSE, 0},
{0, 219, EIF_FALSE, 0},
{0, 220, EIF_FALSE, 0},
{0, 221, EIF_FALSE, 0},
{0, 222, EIF_FALSE, 0},
{0, 223, EIF_FALSE, 0},
{0, 224, EIF_FALSE, 0},
{0, 225, EIF_FALSE, 0},
{0, 226, EIF_FALSE, 0},
{0, 227, EIF_FALSE, 0},
{0, 228, EIF_FALSE, 0},
{0, 229, EIF_FALSE, 0},
{0, 230, EIF_FALSE, 0},
{0, 231, EIF_FALSE, 0},
{0, 232, EIF_FALSE, 0},
{0, 233, EIF_FALSE, 0},
{0, 234, EIF_FALSE, 0},
{0, 235, EIF_FALSE, 0},
{0, 236, EIF_FALSE, 0},
{0, 237, EIF_FALSE, 0},
{0, 238, EIF_FALSE, 0},
{0, 239, EIF_FALSE, 0},
{0, 240, EIF_FALSE, 0},
{0, 241, EIF_FALSE, 0},
{0, 242, EIF_FALSE, 0},
{0, 243, EIF_FALSE, 0},
{0, 244, EIF_FALSE, &T244f21},
{0, 245, EIF_FALSE, 0},
{0, 246, EIF_FALSE, 0},
{0, 247, EIF_FALSE, 0},
{0, 248, EIF_FALSE, 0},
{0, 249, EIF_FALSE, 0},
{0, 250, EIF_FALSE, 0},
{0, 251, EIF_FALSE, 0},
{0, 252, EIF_FALSE, 0},
{0, 253, EIF_FALSE, 0},
{0, 254, EIF_FALSE, 0},
{0, 255, EIF_FALSE, 0},
{0, 256, EIF_FALSE, 0},
{0, 257, EIF_FALSE, 0},
{0, 258, EIF_FALSE, 0},
{0, 259, EIF_FALSE, 0},
{0, 260, EIF_FALSE, 0},
{0, 261, EIF_FALSE, 0},
{0, 262, EIF_FALSE, 0},
{0, 263, EIF_FALSE, 0},
{0, 264, EIF_FALSE, 0},
{0, 265, EIF_FALSE, 0},
{0, 266, EIF_FALSE, 0},
{0, 267, EIF_FALSE, 0},
{0, 268, EIF_FALSE, 0},
{0, 269, EIF_FALSE, 0},
{0, 270, EIF_FALSE, 0},
{0, 271, EIF_FALSE, 0},
{0, 272, EIF_FALSE, 0},
{0, 273, EIF_FALSE, 0},
{0, 274, EIF_FALSE, 0},
{0, 275, EIF_FALSE, 0},
{0, 276, EIF_FALSE, 0},
{0, 277, EIF_FALSE, 0},
{0, 278, EIF_FALSE, 0},
{0, 279, EIF_FALSE, 0},
{0, 280, EIF_FALSE, 0},
{0, 281, EIF_FALSE, 0},
{0, 282, EIF_FALSE, 0},
{0, 283, EIF_FALSE, 0},
{0, 284, EIF_FALSE, 0},
{0, 285, EIF_FALSE, 0},
{0, 286, EIF_FALSE, 0},
{0, 287, EIF_FALSE, 0},
{0, 288, EIF_FALSE, 0},
{0, 289, EIF_FALSE, 0},
{0, 290, EIF_FALSE, 0},
{0, 291, EIF_FALSE, 0},
{0, 292, EIF_FALSE, 0},
{0, 293, EIF_FALSE, 0},
{0, 294, EIF_FALSE, 0},
{0, 295, EIF_FALSE, 0},
{0, 296, EIF_FALSE, 0},
{0, 297, EIF_FALSE, 0},
{0, 298, EIF_FALSE, 0},
{0, 299, EIF_FALSE, 0},
{0, 300, EIF_FALSE, 0},
{0, 301, EIF_FALSE, 0},
{0, 302, EIF_FALSE, 0},
{0, 303, EIF_FALSE, 0},
{0, 304, EIF_FALSE, 0},
{0, 305, EIF_FALSE, 0},
{0, 306, EIF_FALSE, 0},
{0, 307, EIF_FALSE, 0},
{0, 308, EIF_FALSE, 0},
{0, 309, EIF_FALSE, 0},
{0, 310, EIF_FALSE, 0},
{0, 311, EIF_FALSE, 0},
{0, 312, EIF_FALSE, 0},
{0, 313, EIF_FALSE, 0},
{0, 314, EIF_FALSE, 0},
{0, 315, EIF_FALSE, 0},
{0, 316, EIF_FALSE, 0},
{0, 317, EIF_FALSE, 0},
{0, 318, EIF_FALSE, 0},
{0, 319, EIF_FALSE, 0},
{0, 320, EIF_FALSE, 0},
{0, 321, EIF_FALSE, 0},
{0, 322, EIF_FALSE, 0},
{0, 323, EIF_FALSE, 0},
{0, 324, EIF_FALSE, 0},
{0, 325, EIF_FALSE, 0},
{0, 326, EIF_FALSE, 0},
{0, 327, EIF_FALSE, 0},
{0, 328, EIF_FALSE, 0},
{0, 329, EIF_FALSE, 0},
{0, 330, EIF_FALSE, 0},
{0, 331, EIF_FALSE, 0},
{0, 332, EIF_FALSE, 0},
{0, 333, EIF_FALSE, 0},
{0, 334, EIF_FALSE, 0},
{0, 335, EIF_FALSE, 0},
{0, 336, EIF_FALSE, 0},
{0, 337, EIF_FALSE, 0},
{0, 338, EIF_FALSE, 0},
{0, 339, EIF_FALSE, 0},
{0, 340, EIF_FALSE, 0},
{0, 341, EIF_FALSE, 0},
{0, 342, EIF_FALSE, 0},
{0, 343, EIF_FALSE, 0},
{0, 344, EIF_FALSE, 0},
{0, 345, EIF_FALSE, 0},
{0, 346, EIF_FALSE, 0},
{0, 347, EIF_FALSE, 0},
{0, 348, EIF_FALSE, 0},
{0, 349, EIF_FALSE, 0},
{0, 350, EIF_FALSE, 0},
{0, 351, EIF_FALSE, 0},
{0, 352, EIF_FALSE, 0},
{0, 353, EIF_FALSE, 0},
{0, 354, EIF_FALSE, 0},
{0, 355, EIF_FALSE, 0},
{0, 356, EIF_FALSE, 0},
{0, 357, EIF_FALSE, 0},
{0, 358, EIF_FALSE, 0},
{0, 359, EIF_FALSE, 0},
{0, 360, EIF_FALSE, 0},
{0, 361, EIF_FALSE, 0},
{0, 362, EIF_FALSE, 0},
{0, 363, EIF_FALSE, 0},
{0, 364, EIF_FALSE, 0},
{0, 365, EIF_FALSE, 0},
{0, 366, EIF_FALSE, 0},
{0, 367, EIF_FALSE, 0},
{0, 368, EIF_FALSE, 0},
{0, 369, EIF_FALSE, 0},
{0, 370, EIF_FALSE, 0},
{0, 371, EIF_FALSE, 0},
{0, 372, EIF_FALSE, 0},
{0, 373, EIF_FALSE, 0},
{0, 374, EIF_FALSE, 0},
{0, 375, EIF_FALSE, 0},
{0, 376, EIF_FALSE, 0},
{0, 377, EIF_FALSE, 0},
{0, 378, EIF_FALSE, 0},
{0, 379, EIF_FALSE, 0},
{0, 380, EIF_FALSE, 0},
{0, 381, EIF_FALSE, 0},
{0, 382, EIF_FALSE, 0},
{0, 383, EIF_FALSE, 0},
{0, 384, EIF_FALSE, 0},
{0, 385, EIF_FALSE, 0},
{0, 386, EIF_FALSE, 0},
{0, 387, EIF_FALSE, 0},
{0, 388, EIF_FALSE, 0},
{0, 389, EIF_FALSE, 0},
{0, 390, EIF_FALSE, 0},
{0, 391, EIF_FALSE, 0},
{0, 392, EIF_FALSE, 0},
{0, 393, EIF_FALSE, 0},
{0, 394, EIF_FALSE, 0},
{0, 395, EIF_FALSE, 0},
{0, 396, EIF_FALSE, 0},
{0, 397, EIF_FALSE, 0},
{0, 398, EIF_FALSE, 0},
{0, 399, EIF_FALSE, 0},
{0, 400, EIF_FALSE, 0},
{0, 401, EIF_FALSE, 0},
{0, 402, EIF_FALSE, 0},
{0, 403, EIF_FALSE, 0},
{0, 404, EIF_FALSE, 0},
{0, 405, EIF_FALSE, 0},
{0, 406, EIF_FALSE, 0},
{0, 407, EIF_FALSE, 0},
{0, 408, EIF_FALSE, 0},
{0, 409, EIF_FALSE, 0},
{0, 410, EIF_FALSE, 0},
{0, 411, EIF_FALSE, 0},
{0, 412, EIF_FALSE, 0},
{0, 413, EIF_FALSE, 0},
{0, 414, EIF_FALSE, 0},
{0, 415, EIF_FALSE, 0},
{0, 416, EIF_FALSE, 0},
{0, 417, EIF_FALSE, 0},
{0, 418, EIF_FALSE, 0},
{0, 419, EIF_FALSE, 0},
{0, 420, EIF_FALSE, 0},
{0, 421, EIF_FALSE, 0},
{0, 422, EIF_FALSE, 0},
{0, 423, EIF_FALSE, 0},
{0, 424, EIF_FALSE, 0},
{0, 425, EIF_FALSE, 0},
{0, 426, EIF_FALSE, 0},
{0, 427, EIF_FALSE, 0},
{0, 428, EIF_FALSE, 0},
{0, 429, EIF_FALSE, 0},
{0, 430, EIF_TRUE, 0},
{0, 431, EIF_FALSE, 0},
{0, 432, EIF_FALSE, 0},
{0, 433, EIF_TRUE, 0},
{0, 434, EIF_FALSE, 0},
{0, 435, EIF_FALSE, 0},
{0, 436, EIF_FALSE, 0},
{0, 437, EIF_FALSE, 0},
{0, 438, EIF_FALSE, 0},
{0, 439, EIF_FALSE, 0},
{0, 440, EIF_FALSE, 0},
{0, 441, EIF_TRUE, 0},
{0, 442, EIF_FALSE, 0},
{0, 443, EIF_FALSE, 0},
{0, 444, EIF_FALSE, 0},
{0, 445, EIF_FALSE, 0},
{0, 446, EIF_FALSE, 0},
{0, 447, EIF_FALSE, 0},
{0, 448, EIF_FALSE, 0},
{0, 449, EIF_TRUE, 0},
{0, 450, EIF_FALSE, 0},
{0, 451, EIF_FALSE, 0},
{0, 452, EIF_FALSE, 0},
{0, 453, EIF_FALSE, 0},
{0, 454, EIF_FALSE, 0},
{0, 455, EIF_FALSE, 0},
{0, 456, EIF_FALSE, 0},
{0, 457, EIF_FALSE, 0},
{0, 458, EIF_FALSE, 0},
{0, 459, EIF_FALSE, 0},
{0, 460, EIF_FALSE, 0},
{0, 461, EIF_FALSE, 0},
{0, 462, EIF_FALSE, 0},
{0, 463, EIF_FALSE, 0},
{0, 464, EIF_FALSE, 0},
{0, 465, EIF_FALSE, 0},
{0, 466, EIF_FALSE, 0},
{0, 467, EIF_TRUE, 0},
{0, 468, EIF_FALSE, 0},
{0, 469, EIF_TRUE, 0},
{0, 470, EIF_FALSE, 0},
{0, 471, EIF_TRUE, 0},
{0, 472, EIF_TRUE, 0},
{0, 473, EIF_FALSE, 0},
{0, 474, EIF_TRUE, 0},
{0, 475, EIF_FALSE, 0},
{0, 476, EIF_TRUE, 0},
{0, 477, EIF_FALSE, 0},
{0, 478, EIF_FALSE, 0},
{0, 479, EIF_TRUE, 0},
{0, 480, EIF_FALSE, 0},
{0, 481, EIF_TRUE, 0},
{0, 482, EIF_FALSE, 0},
{0, 483, EIF_FALSE, 0},
{0, 484, EIF_TRUE, 0},
{0, 485, EIF_FALSE, 0},
{0, 486, EIF_FALSE, 0},
{0, 487, EIF_FALSE, 0},
{0, 488, EIF_FALSE, 0},
{0, 489, EIF_FALSE, 0},
{0, 490, EIF_FALSE, 0},
{0, 491, EIF_FALSE, 0},
{0, 492, EIF_FALSE, 0},
{0, 493, EIF_FALSE, 0},
{0, 494, EIF_FALSE, 0},
{0, 495, EIF_FALSE, 0},
{0, 496, EIF_FALSE, 0},
{0, 497, EIF_FALSE, 0},
{0, 498, EIF_FALSE, 0},
{0, 499, EIF_TRUE, 0},
{0, 500, EIF_FALSE, 0},
{0, 501, EIF_FALSE, 0},
{0, 502, EIF_FALSE, 0},
{0, 503, EIF_FALSE, 0},
{0, 504, EIF_FALSE, 0},
{0, 505, EIF_FALSE, 0},
{0, 506, EIF_FALSE, 0},
{0, 507, EIF_FALSE, 0},
{0, 508, EIF_FALSE, 0},
{0, 509, EIF_FALSE, 0},
{0, 510, EIF_FALSE, 0},
{0, 511, EIF_FALSE, 0},
{0, 512, EIF_FALSE, 0},
{0, 513, EIF_FALSE, 0},
{0, 514, EIF_FALSE, 0},
{0, 515, EIF_FALSE, 0},
{0, 516, EIF_FALSE, 0},
{0, 517, EIF_FALSE, 0},
{0, 518, EIF_FALSE, 0},
{0, 519, EIF_FALSE, 0},
{0, 520, EIF_FALSE, 0},
{0, 521, EIF_FALSE, 0},
{0, 522, EIF_FALSE, 0},
{0, 523, EIF_FALSE, 0},
{0, 524, EIF_FALSE, 0},
{0, 525, EIF_FALSE, 0},
{0, 526, EIF_FALSE, 0},
{0, 527, EIF_FALSE, 0},
{0, 528, EIF_TRUE, 0},
{0, 529, EIF_TRUE, 0},
{0, 530, EIF_FALSE, 0},
{0, 531, EIF_FALSE, 0},
{0, 532, EIF_TRUE, 0},
{0, 533, EIF_FALSE, 0},
{0, 534, EIF_FALSE, 0},
{0, 535, EIF_FALSE, 0},
{0, 536, EIF_FALSE, 0},
{0, 537, EIF_FALSE, &T537f8},
{0, 538, EIF_FALSE, 0},
{0, 539, EIF_FALSE, 0},
{0, 540, EIF_FALSE, 0},
{0, 541, EIF_TRUE, 0},
{0, 542, EIF_FALSE, 0},
{0, 543, EIF_FALSE, 0},
{0, 544, EIF_FALSE, 0},
{0, 545, EIF_FALSE, 0},
{0, 546, EIF_TRUE, 0},
{0, 547, EIF_FALSE, 0},
{0, 548, EIF_FALSE, 0},
{0, 549, EIF_FALSE, 0},
{0, 550, EIF_FALSE, 0},
{0, 551, EIF_TRUE, 0},
{0, 552, EIF_FALSE, 0},
{0, 553, EIF_FALSE, 0},
{0, 554, EIF_FALSE, 0},
{0, 555, EIF_FALSE, 0},
{0, 556, EIF_FALSE, 0},
{0, 557, EIF_FALSE, 0},
{0, 558, EIF_TRUE, 0},
{0, 559, EIF_FALSE, 0},
{0, 560, EIF_FALSE, 0},
{0, 561, EIF_FALSE, 0},
{0, 562, EIF_FALSE, 0},
{0, 563, EIF_FALSE, 0},
{0, 564, EIF_FALSE, 0},
{0, 565, EIF_TRUE, 0},
{0, 566, EIF_FALSE, 0},
{0, 567, EIF_FALSE, 0},
{0, 568, EIF_TRUE, 0},
{0, 569, EIF_FALSE, 0},
{0, 570, EIF_FALSE, 0},
{0, 571, EIF_TRUE, 0},
{0, 572, EIF_FALSE, 0},
{0, 573, EIF_FALSE, 0},
{0, 574, EIF_TRUE, 0},
{0, 575, EIF_FALSE, 0},
{0, 576, EIF_FALSE, 0},
{0, 577, EIF_TRUE, 0},
{0, 578, EIF_FALSE, 0},
{0, 579, EIF_FALSE, 0},
{0, 580, EIF_TRUE, 0},
{0, 581, EIF_FALSE, 0},
{0, 582, EIF_FALSE, 0},
{0, 583, EIF_FALSE, 0},
{0, 584, EIF_TRUE, 0},
{0, 585, EIF_FALSE, 0},
{0, 586, EIF_FALSE, 0},
{0, 587, EIF_FALSE, 0},
{0, 588, EIF_FALSE, 0},
{0, 589, EIF_TRUE, 0},
{0, 590, EIF_FALSE, 0},
{0, 591, EIF_TRUE, 0},
{0, 592, EIF_FALSE, 0},
{0, 593, EIF_FALSE, 0},
{0, 594, EIF_FALSE, 0},
{0, 595, EIF_FALSE, 0},
{0, 596, EIF_FALSE, 0},
{0, 597, EIF_TRUE, 0},
{0, 598, EIF_FALSE, 0},
{0, 599, EIF_TRUE, 0},
{0, 600, EIF_FALSE, 0},
{0, 601, EIF_FALSE, 0},
{0, 602, EIF_FALSE, 0},
{0, 603, EIF_FALSE, 0},
{0, 604, EIF_FALSE, 0},
{0, 605, EIF_FALSE, 0},
{0, 606, EIF_FALSE, 0},
{0, 607, EIF_FALSE, 0},
{0, 608, EIF_FALSE, 0},
{0, 609, EIF_FALSE, 0},
{0, 610, EIF_FALSE, 0},
{0, 611, EIF_FALSE, 0},
{0, 612, EIF_FALSE, 0},
{0, 613, EIF_FALSE, 0},
{0, 614, EIF_FALSE, 0},
{0, 615, EIF_TRUE, 0},
{0, 616, EIF_FALSE, 0},
{0, 617, EIF_FALSE, 0},
{0, 618, EIF_FALSE, 0},
{0, 619, EIF_FALSE, 0},
{0, 620, EIF_FALSE, 0},
{0, 621, EIF_FALSE, 0},
{0, 622, EIF_FALSE, 0},
{0, 623, EIF_TRUE, 0},
{0, 624, EIF_FALSE, 0},
{0, 625, EIF_FALSE, 0},
{0, 626, EIF_TRUE, 0},
{0, 627, EIF_FALSE, 0},
{0, 628, EIF_FALSE, 0},
{0, 629, EIF_TRUE, 0},
{0, 630, EIF_FALSE, 0},
{0, 631, EIF_FALSE, 0},
{0, 632, EIF_TRUE, 0},
{0, 633, EIF_FALSE, 0},
{0, 634, EIF_FALSE, 0},
{0, 635, EIF_TRUE, 0},
{0, 636, EIF_FALSE, 0},
{0, 637, EIF_FALSE, 0},
{0, 638, EIF_TRUE, 0},
{0, 639, EIF_FALSE, 0},
{0, 640, EIF_FALSE, 0},
{0, 641, EIF_TRUE, 0},
{0, 642, EIF_FALSE, 0},
{0, 643, EIF_FALSE, 0},
{0, 644, EIF_FALSE, 0},
{0, 645, EIF_FALSE, 0},
{0, 646, EIF_FALSE, 0},
{0, 647, EIF_FALSE, 0},
{0, 648, EIF_FALSE, 0},
{0, 649, EIF_FALSE, 0},
{0, 650, EIF_FALSE, 0},
{0, 651, EIF_FALSE, 0},
{0, 652, EIF_FALSE, 0},
{0, 653, EIF_FALSE, 0},
{0, 654, EIF_FALSE, 0},
{0, 655, EIF_FALSE, 0},
{0, 656, EIF_FALSE, 0},
{0, 657, EIF_FALSE, 0},
{0, 658, EIF_FALSE, 0},
{0, 659, EIF_FALSE, 0},
{0, 660, EIF_FALSE, 0},
{0, 661, EIF_FALSE, 0},
{0, 662, EIF_FALSE, 0},
{0, 663, EIF_FALSE, 0},
{0, 664, EIF_FALSE, 0},
{0, 665, EIF_FALSE, 0},
{0, 666, EIF_FALSE, 0},
{0, 667, EIF_FALSE, 0},
{0, 668, EIF_FALSE, 0},
{0, 669, EIF_FALSE, 0},
{0, 670, EIF_FALSE, 0},
{0, 671, EIF_FALSE, 0},
{0, 672, EIF_FALSE, 0},
{0, 673, EIF_FALSE, 0},
{0, 674, EIF_FALSE, 0},
{0, 675, EIF_FALSE, 0},
{0, 676, EIF_FALSE, 0},
{0, 677, EIF_FALSE, 0},
{0, 678, EIF_FALSE, 0},
{0, 679, EIF_FALSE, 0},
{0, 680, EIF_FALSE, 0},
{0, 681, EIF_FALSE, 0},
{0, 682, EIF_FALSE, 0},
{0, 683, EIF_FALSE, 0},
{0, 684, EIF_FALSE, 0},
{0, 685, EIF_FALSE, 0},
{0, 686, EIF_FALSE, 0},
{0, 687, EIF_FALSE, 0},
{0, 688, EIF_FALSE, 0},
{0, 689, EIF_FALSE, 0},
{0, 690, EIF_FALSE, 0},
{0, 691, EIF_FALSE, 0},
{0, 692, EIF_FALSE, 0},
{0, 693, EIF_FALSE, 0},
{0, 694, EIF_FALSE, 0},
{0, 695, EIF_FALSE, 0},
{0, 696, EIF_FALSE, 0},
{0, 697, EIF_FALSE, 0},
{0, 698, EIF_FALSE, 0},
{0, 699, EIF_FALSE, 0},
{0, 700, EIF_FALSE, 0},
{0, 701, EIF_FALSE, 0},
{0, 702, EIF_FALSE, 0},
{0, 703, EIF_FALSE, 0},
{0, 704, EIF_FALSE, 0},
{0, 705, EIF_FALSE, 0},
{0, 706, EIF_FALSE, 0},
{0, 707, EIF_FALSE, 0},
{0, 708, EIF_FALSE, 0},
{0, 709, EIF_FALSE, 0},
{0, 710, EIF_FALSE, 0},
{0, 711, EIF_FALSE, 0},
{0, 712, EIF_FALSE, 0},
{0, 713, EIF_TRUE, 0},
{0, 714, EIF_FALSE, 0},
{0, 715, EIF_FALSE, 0},
{0, 716, EIF_FALSE, 0},
{0, 717, EIF_FALSE, 0},
{0, 718, EIF_FALSE, 0},
{0, 719, EIF_FALSE, 0},
{0, 720, EIF_FALSE, 0},
{0, 721, EIF_FALSE, 0},
{0, 722, EIF_FALSE, 0},
{0, 723, EIF_FALSE, 0},
{0, 724, EIF_FALSE, 0},
{0, 725, EIF_FALSE, 0},
{0, 726, EIF_FALSE, 0},
{0, 727, EIF_FALSE, 0},
{0, 728, EIF_FALSE, 0},
{0, 729, EIF_FALSE, 0},
{0, 730, EIF_FALSE, 0},
{0, 731, EIF_FALSE, 0},
{0, 732, EIF_FALSE, 0},
{0, 733, EIF_FALSE, 0},
{0, 734, EIF_FALSE, 0},
{0, 735, EIF_FALSE, 0},
{0, 736, EIF_FALSE, 0},
{0, 737, EIF_FALSE, 0},
{0, 738, EIF_FALSE, 0},
{0, 739, EIF_TRUE, 0},
{0, 740, EIF_FALSE, 0},
{0, 741, EIF_FALSE, 0},
{0, 742, EIF_TRUE, 0},
{0, 743, EIF_FALSE, 0},
{0, 744, EIF_FALSE, 0},
{0, 745, EIF_TRUE, 0},
{0, 746, EIF_FALSE, 0},
{0, 747, EIF_TRUE, 0},
{0, 748, EIF_FALSE, 0},
{0, 749, EIF_TRUE, 0},
{0, 750, EIF_FALSE, 0},
{0, 751, EIF_FALSE, 0},
{0, 752, EIF_TRUE, 0},
{0, 753, EIF_FALSE, 0},
{0, 754, EIF_FALSE, 0},
{0, 755, EIF_TRUE, 0},
{0, 756, EIF_FALSE, 0},
{0, 757, EIF_FALSE, 0},
{0, 758, EIF_TRUE, 0},
{0, 759, EIF_FALSE, 0},
{0, 760, EIF_FALSE, 0},
{0, 761, EIF_TRUE, 0},
{0, 762, EIF_FALSE, 0},
{0, 763, EIF_TRUE, 0},
{0, 764, EIF_FALSE, 0},
{0, 765, EIF_FALSE, 0},
{0, 766, EIF_TRUE, 0},
{0, 767, EIF_FALSE, 0},
{0, 768, EIF_FALSE, 0},
{0, 769, EIF_TRUE, 0},
{0, 770, EIF_FALSE, 0},
{0, 771, EIF_FALSE, 0},
{0, 772, EIF_TRUE, 0},
{0, 773, EIF_FALSE, 0},
{0, 774, EIF_TRUE, 0},
{0, 775, EIF_FALSE, 0},
{0, 776, EIF_FALSE, 0},
{0, 777, EIF_TRUE, 0},
{0, 778, EIF_FALSE, 0},
{0, 779, EIF_TRUE, 0},
{0, 780, EIF_FALSE, 0},
{0, 781, EIF_FALSE, 0},
{0, 782, EIF_TRUE, 0},
{0, 783, EIF_FALSE, 0},
{0, 784, EIF_FALSE, 0},
{0, 785, EIF_TRUE, 0},
{0, 786, EIF_FALSE, 0},
{0, 787, EIF_FALSE, 0},
{0, 788, EIF_TRUE, 0},
{0, 789, EIF_FALSE, 0},
{0, 790, EIF_FALSE, 0},
{0, 791, EIF_TRUE, 0},
{0, 792, EIF_FALSE, 0},
{0, 793, EIF_TRUE, 0},
{0, 794, EIF_FALSE, 0},
{0, 795, EIF_FALSE, 0},
{0, 796, EIF_TRUE, 0},
{0, 797, EIF_FALSE, 0},
{0, 798, EIF_FALSE, 0},
{0, 799, EIF_FALSE, 0},
{0, 800, EIF_FALSE, 0},
{0, 801, EIF_FALSE, 0},
{0, 802, EIF_FALSE, 0},
{0, 803, EIF_FALSE, 0},
{0, 804, EIF_FALSE, 0},
{0, 805, EIF_FALSE, 0},
{0, 806, EIF_FALSE, 0},
{0, 807, EIF_FALSE, 0},
{0, 808, EIF_FALSE, 0},
{0, 809, EIF_FALSE, 0},
{0, 810, EIF_FALSE, 0},
{0, 811, EIF_FALSE, 0},
{0, 812, EIF_FALSE, 0},
{0, 813, EIF_FALSE, 0},
{0, 814, EIF_TRUE, 0},
{0, 815, EIF_FALSE, 0},
{0, 816, EIF_TRUE, 0},
{0, 817, EIF_TRUE, 0},
{0, 818, EIF_TRUE, 0},
{0, 819, EIF_FALSE, 0},
{0, 820, EIF_TRUE, 0},
{0, 821, EIF_FALSE, 0},
{0, 822, EIF_TRUE, 0},
{0, 823, EIF_FALSE, 0},
{0, 824, EIF_TRUE, 0},
{0, 825, EIF_FALSE, 0},
{0, 826, EIF_FALSE, 0},
{0, 827, EIF_TRUE, 0},
{0, 828, EIF_FALSE, 0},
{0, 829, EIF_TRUE, 0},
{0, 830, EIF_FALSE, 0},
{0, 831, EIF_FALSE, 0},
{0, 832, EIF_FALSE, 0},
{0, 833, EIF_FALSE, 0},
{0, 834, EIF_FALSE, 0},
{0, 835, EIF_TRUE, 0},
{0, 836, EIF_FALSE, 0},
{0, 837, EIF_FALSE, 0},
{0, 838, EIF_TRUE, 0},
{0, 839, EIF_FALSE, 0},
{0, 840, EIF_TRUE, 0},
{0, 841, EIF_FALSE, 0},
{0, 842, EIF_TRUE, 0},
{0, 843, EIF_FALSE, 0},
{0, 844, EIF_TRUE, 0},
{0, 845, EIF_FALSE, 0},
{0, 846, EIF_FALSE, 0},
{0, 847, EIF_TRUE, 0},
{0, 848, EIF_FALSE, 0},
{0, 849, EIF_TRUE, 0},
{0, 850, EIF_FALSE, 0},
{0, 851, EIF_FALSE, 0},
{0, 852, EIF_FALSE, 0},
{0, 853, EIF_TRUE, 0},
{0, 854, EIF_FALSE, 0},
{0, 855, EIF_FALSE, 0},
{0, 856, EIF_TRUE, 0},
{0, 857, EIF_FALSE, 0},
{0, 858, EIF_FALSE, 0},
{0, 859, EIF_TRUE, 0},
{0, 860, EIF_FALSE, 0},
{0, 861, EIF_TRUE, 0},
{0, 862, EIF_FALSE, 0},
{0, 863, EIF_FALSE, 0},
{0, 864, EIF_FALSE, 0},
{0, 865, EIF_TRUE, 0},
{0, 866, EIF_FALSE, 0},
{0, 867, EIF_FALSE, 0},
{0, 868, EIF_FALSE, 0},
{0, 869, EIF_FALSE, 0},
{0, 870, EIF_TRUE, 0},
{0, 871, EIF_FALSE, 0},
{0, 872, EIF_FALSE, 0},
{0, 873, EIF_FALSE, 0},
{0, 874, EIF_FALSE, 0},
{0, 875, EIF_FALSE, 0},
{0, 876, EIF_TRUE, 0},
{0, 877, EIF_TRUE, 0},
{0, 878, EIF_FALSE, 0},
{0, 879, EIF_TRUE, 0},
{0, 880, EIF_TRUE, 0},
{0, 881, EIF_TRUE, 0},
{0, 882, EIF_TRUE, 0},
{0, 883, EIF_FALSE, 0},
{0, 884, EIF_FALSE, 0},
{0, 885, EIF_FALSE, 0},
{0, 886, EIF_TRUE, 0},
{0, 887, EIF_TRUE, 0},
{0, 888, EIF_TRUE, 0},
{0, 889, EIF_FALSE, 0},
{0, 890, EIF_FALSE, 0},
{0, 891, EIF_FALSE, 0},
{0, 892, EIF_FALSE, 0},
{0, 893, EIF_TRUE, 0},
{0, 894, EIF_TRUE, 0},
{0, 895, EIF_FALSE, 0},
{0, 896, EIF_FALSE, 0},
{0, 897, EIF_FALSE, 0},
{0, 898, EIF_TRUE, 0},
{0, 899, EIF_FALSE, 0},
{0, 900, EIF_FALSE, 0},
{0, 901, EIF_FALSE, 0},
{0, 902, EIF_TRUE, 0},
{0, 903, EIF_FALSE, 0},
{0, 904, EIF_FALSE, 0},
{0, 905, EIF_FALSE, 0},
{0, 906, EIF_FALSE, 0},
{0, 907, EIF_FALSE, 0},
{0, 908, EIF_TRUE, 0},
{0, 909, EIF_FALSE, 0},
{0, 910, EIF_FALSE, 0},
{0, 911, EIF_FALSE, 0},
{0, 912, EIF_TRUE, 0},
{0, 913, EIF_FALSE, 0},
{0, 914, EIF_TRUE, 0},
{0, 915, EIF_FALSE, 0},
{0, 916, EIF_FALSE, 0},
{0, 917, EIF_TRUE, 0},
{0, 918, EIF_FALSE, 0},
{0, 919, EIF_FALSE, 0},
{0, 920, EIF_FALSE, 0},
{0, 921, EIF_FALSE, 0},
{0, 922, EIF_FALSE, 0},
{0, 923, EIF_TRUE, 0},
{0, 924, EIF_FALSE, 0},
{0, 925, EIF_FALSE, 0},
{0, 926, EIF_TRUE, 0},
{0, 927, EIF_FALSE, 0},
{0, 928, EIF_FALSE, 0},
{0, 929, EIF_FALSE, 0},
{0, 930, EIF_TRUE, 0},
{0, 931, EIF_FALSE, 0},
{0, 932, EIF_TRUE, 0},
{0, 933, EIF_TRUE, 0},
{0, 934, EIF_TRUE, 0},
{0, 935, EIF_FALSE, 0},
{0, 936, EIF_TRUE, 0},
{0, 937, EIF_FALSE, 0},
{0, 938, EIF_TRUE, 0},
{0, 939, EIF_FALSE, 0},
{0, 940, EIF_FALSE, 0},
{0, 941, EIF_FALSE, 0},
{0, 942, EIF_FALSE, 0},
{0, 943, EIF_TRUE, 0},
{0, 944, EIF_FALSE, 0},
{0, 945, EIF_FALSE, 0},
{0, 946, EIF_FALSE, 0},
{0, 947, EIF_FALSE, 0},
{0, 948, EIF_FALSE, 0},
{0, 949, EIF_FALSE, 0},
{0, 950, EIF_FALSE, 0},
{0, 951, EIF_FALSE, 0},
{0, 952, EIF_FALSE, 0},
{0, 953, EIF_FALSE, 0},
{0, 954, EIF_TRUE, 0},
{0, 955, EIF_FALSE, 0},
{0, 956, EIF_FALSE, 0},
{0, 957, EIF_FALSE, 0},
{0, 958, EIF_FALSE, 0},
{0, 959, EIF_FALSE, 0},
{0, 960, EIF_TRUE, 0},
{0, 961, EIF_TRUE, 0},
{0, 962, EIF_FALSE, 0},
{0, 963, EIF_FALSE, 0},
{0, 964, EIF_FALSE, 0},
{0, 965, EIF_FALSE, 0},
{0, 966, EIF_FALSE, 0},
{0, 967, EIF_TRUE, 0},
{0, 968, EIF_FALSE, 0},
{0, 969, EIF_TRUE, 0},
{0, 970, EIF_FALSE, 0},
{0, 971, EIF_FALSE, 0},
{0, 972, EIF_FALSE, 0},
{0, 973, EIF_FALSE, 0},
{0, 974, EIF_FALSE, 0},
{0, 975, EIF_FALSE, 0},
{0, 976, EIF_FALSE, 0},
{0, 977, EIF_TRUE, 0},
{0, 978, EIF_FALSE, 0},
{0, 979, EIF_FALSE, 0},
{0, 980, EIF_TRUE, 0},
{0, 981, EIF_FALSE, 0},
{0, 982, EIF_FALSE, 0},
{0, 983, EIF_FALSE, 0},
{0, 984, EIF_FALSE, 0},
{0, 985, EIF_FALSE, 0},
{0, 986, EIF_FALSE, 0},
{0, 987, EIF_FALSE, 0},
{0, 988, EIF_FALSE, 0},
{0, 989, EIF_FALSE, 0},
{0, 990, EIF_TRUE, 0},
{0, 991, EIF_FALSE, 0},
{0, 992, EIF_FALSE, 0},
{0, 993, EIF_FALSE, 0},
{0, 994, EIF_FALSE, 0},
{0, 995, EIF_TRUE, 0},
{0, 996, EIF_FALSE, 0},
{0, 997, EIF_FALSE, 0},
{0, 998, EIF_FALSE, 0},
{0, 999, EIF_TRUE, 0},
{0, 1000, EIF_TRUE, 0},
{0, 1001, EIF_FALSE, 0},
{0, 1002, EIF_FALSE, 0},
{0, 1003, EIF_FALSE, 0},
{0, 1004, EIF_TRUE, 0},
{0, 1005, EIF_FALSE, 0},
{0, 1006, EIF_TRUE, 0},
{0, 1007, EIF_FALSE, 0},
{0, 1008, EIF_FALSE, 0},
{0, 1009, EIF_FALSE, 0},
{0, 1010, EIF_TRUE, 0},
{0, 1011, EIF_FALSE, 0},
{0, 1012, EIF_FALSE, 0},
{0, 1013, EIF_FALSE, 0},
{0, 1014, EIF_TRUE, 0},
{0, 1015, EIF_FALSE, 0},
{0, 1016, EIF_FALSE, 0},
{0, 1017, EIF_FALSE, 0},
{0, 1018, EIF_FALSE, 0},
{0, 1019, EIF_TRUE, 0},
{0, 1020, EIF_FALSE, 0},
{0, 1021, EIF_TRUE, 0},
{0, 1022, EIF_FALSE, 0},
{0, 1023, EIF_FALSE, 0},
{0, 1024, EIF_FALSE, 0},
{0, 1025, EIF_TRUE, 0},
{0, 1026, EIF_FALSE, 0},
{0, 1027, EIF_FALSE, 0},
{0, 1028, EIF_FALSE, 0},
{0, 1029, EIF_TRUE, 0},
{0, 1030, EIF_FALSE, 0},
{0, 1031, EIF_TRUE, 0},
{0, 1032, EIF_FALSE, 0},
{0, 1033, EIF_FALSE, 0},
{0, 1034, EIF_FALSE, 0},
{0, 1035, EIF_TRUE, 0},
{0, 1036, EIF_FALSE, 0},
{0, 1037, EIF_TRUE, 0},
{0, 1038, EIF_FALSE, 0},
{0, 1039, EIF_FALSE, 0},
{0, 1040, EIF_TRUE, 0},
{0, 1041, EIF_FALSE, 0},
{0, 1042, EIF_FALSE, 0},
{0, 1043, EIF_FALSE, 0},
{0, 1044, EIF_FALSE, 0},
{0, 1045, EIF_TRUE, 0},
{0, 1046, EIF_FALSE, 0},
{0, 1047, EIF_TRUE, 0},
{0, 1048, EIF_FALSE, 0},
{0, 1049, EIF_FALSE, 0},
{0, 1050, EIF_FALSE, 0},
{0, 1051, EIF_TRUE, 0},
{0, 1052, EIF_FALSE, 0},
{0, 1053, EIF_FALSE, 0},
{0, 1054, EIF_FALSE, 0},
{0, 1055, EIF_FALSE, 0},
{0, 1056, EIF_FALSE, 0},
{0, 1057, EIF_FALSE, 0},
{0, 1058, EIF_FALSE, 0},
{0, 1059, EIF_TRUE, 0},
{0, 1060, EIF_FALSE, 0},
{0, 1061, EIF_FALSE, 0},
{0, 1062, EIF_FALSE, 0},
{0, 1063, EIF_FALSE, 0},
{0, 1064, EIF_FALSE, 0},
{0, 1065, EIF_FALSE, 0},
{0, 1066, EIF_FALSE, 0},
{0, 1067, EIF_FALSE, 0},
{0, 1068, EIF_FALSE, 0},
{0, 1069, EIF_FALSE, 0},
{0, 1070, EIF_FALSE, 0},
{0, 1071, EIF_FALSE, 0},
{0, 1072, EIF_TRUE, 0},
{0, 1073, EIF_FALSE, 0},
{0, 1074, EIF_FALSE, 0},
{0, 1075, EIF_TRUE, 0},
{0, 1076, EIF_FALSE, 0},
{0, 1077, EIF_TRUE, 0},
{0, 1078, EIF_FALSE, 0},
{0, 1079, EIF_TRUE, 0},
{0, 1080, EIF_FALSE, 0},
{0, 1081, EIF_FALSE, 0},
{0, 1082, EIF_FALSE, 0},
{0, 1083, EIF_FALSE, 0},
{0, 1084, EIF_FALSE, 0},
{0, 1085, EIF_FALSE, 0},
{0, 1086, EIF_FALSE, 0},
{0, 1087, EIF_FALSE, 0},
{0, 1088, EIF_TRUE, 0},
{0, 1089, EIF_FALSE, 0},
{0, 1090, EIF_TRUE, 0},
{0, 1091, EIF_FALSE, 0},
{0, 1092, EIF_TRUE, 0},
{0, 1093, EIF_FALSE, 0},
{0, 1094, EIF_FALSE, 0},
{0, 1095, EIF_FALSE, 0},
{0, 1096, EIF_FALSE, 0},
{0, 1097, EIF_FALSE, 0},
{0, 1098, EIF_FALSE, 0},
{0, 1099, EIF_FALSE, 0},
{0, 1100, EIF_FALSE, 0},
{0, 1101, EIF_FALSE, 0},
{0, 1102, EIF_TRUE, 0},
{0, 1103, EIF_FALSE, 0},
{0, 1104, EIF_TRUE, 0},
{0, 1105, EIF_FALSE, 0},
{0, 1106, EIF_FALSE, 0},
{0, 1107, EIF_FALSE, 0},
{0, 1108, EIF_FALSE, 0},
{0, 1109, EIF_FALSE, 0},
{0, 1110, EIF_FALSE, 0},
{0, 1111, EIF_FALSE, 0},
{0, 1112, EIF_FALSE, 0},
{0, 1113, EIF_FALSE, 0},
{0, 1114, EIF_FALSE, 0},
{0, 1115, EIF_FALSE, 0},
{0, 1116, EIF_FALSE, 0},
{0, 1117, EIF_FALSE, 0},
{0, 1118, EIF_FALSE, 0},
{0, 1119, EIF_FALSE, 0},
{0, 1120, EIF_FALSE, 0},
{0, 1121, EIF_FALSE, 0},
{0, 1122, EIF_FALSE, 0},
{0, 1123, EIF_FALSE, 0},
{0, 1124, EIF_FALSE, 0},
{0, 1125, EIF_FALSE, 0},
{0, 1126, EIF_FALSE, 0},
{0, 1127, EIF_FALSE, 0},
{0, 1128, EIF_FALSE, 0},
{0, 1129, EIF_FALSE, 0},
{0, 1130, EIF_FALSE, 0},
{0, 1131, EIF_FALSE, 0},
{0, 1132, EIF_FALSE, 0},
{0, 1133, EIF_FALSE, 0},
{0, 1134, EIF_FALSE, 0},
{0, 1135, EIF_FALSE, 0},
{0, 1136, EIF_FALSE, 0},
{0, 1137, EIF_FALSE, 0},
{0, 1138, EIF_FALSE, 0},
{0, 1139, EIF_TRUE, 0},
{0, 1140, EIF_FALSE, 0},
{0, 1141, EIF_FALSE, 0},
{0, 1142, EIF_FALSE, 0},
{0, 1143, EIF_FALSE, 0},
{0, 1144, EIF_FALSE, 0},
{0, 1145, EIF_FALSE, 0},
{0, 1146, EIF_FALSE, 0},
{0, 1147, EIF_FALSE, 0},
{0, 1148, EIF_FALSE, 0},
{0, 1149, EIF_FALSE, 0},
{0, 1150, EIF_FALSE, 0},
{0, 1151, EIF_FALSE, 0},
{0, 1152, EIF_FALSE, 0},
{0, 1153, EIF_FALSE, 0},
{0, 1154, EIF_FALSE, 0},
{0, 1155, EIF_FALSE, 0},
{0, 1156, EIF_FALSE, 0},
{0, 1157, EIF_FALSE, 0},
{0, 1158, EIF_FALSE, 0},
{0, 1159, EIF_FALSE, 0},
{0, 1160, EIF_FALSE, 0},
{0, 1161, EIF_FALSE, 0},
{0, 1162, EIF_FALSE, 0},
{0, 1163, EIF_FALSE, 0},
{0, 1164, EIF_TRUE, 0},
{0, 1165, EIF_FALSE, 0},
{0, 1166, EIF_FALSE, 0},
{0, 1167, EIF_FALSE, 0},
{0, 1168, EIF_FALSE, 0},
{0, 1169, EIF_FALSE, 0},
{0, 1170, EIF_FALSE, 0},
{0, 1171, EIF_FALSE, 0},
{0, 1172, EIF_FALSE, 0},
{0, 1173, EIF_FALSE, 0},
{0, 1174, EIF_FALSE, 0},
{0, 1175, EIF_FALSE, 0},
{0, 1176, EIF_FALSE, 0},
{0, 1177, EIF_FALSE, 0},
{0, 1178, EIF_FALSE, 0},
{0, 1179, EIF_FALSE, 0},
{0, 1180, EIF_FALSE, 0},
{0, 1181, EIF_FALSE, 0},
{0, 1182, EIF_FALSE, 0},
{0, 1183, EIF_FALSE, 0},
{0, 1184, EIF_FALSE, 0},
{0, 1185, EIF_FALSE, 0},
{0, 1186, EIF_FALSE, 0},
{0, 1187, EIF_FALSE, 0},
{0, 1188, EIF_FALSE, 0},
{0, 1189, EIF_FALSE, 0},
{0, 1190, EIF_TRUE, 0},
{0, 1191, EIF_FALSE, 0},
{0, 1192, EIF_FALSE, 0},
{0, 1193, EIF_TRUE, 0},
{0, 1194, EIF_FALSE, 0},
{0, 1195, EIF_FALSE, 0},
{0, 1196, EIF_FALSE, 0},
{0, 1197, EIF_TRUE, 0},
{0, 1198, EIF_FALSE, 0},
{0, 1199, EIF_FALSE, 0},
{0, 1200, EIF_FALSE, 0},
{0, 1201, EIF_FALSE, 0},
{0, 1202, EIF_TRUE, 0},
{0, 1203, EIF_FALSE, 0},
{0, 1204, EIF_FALSE, 0},
{0, 1205, EIF_FALSE, 0},
{0, 1206, EIF_FALSE, 0},
{0, 1207, EIF_TRUE, 0},
{0, 1208, EIF_FALSE, 0},
{0, 1209, EIF_FALSE, 0},
{0, 1210, EIF_FALSE, 0},
{0, 1211, EIF_FALSE, 0},
{0, 1212, EIF_FALSE, 0},
{0, 1213, EIF_FALSE, 0},
{0, 1214, EIF_FALSE, 0},
{0, 1215, EIF_FALSE, 0},
{0, 1216, EIF_FALSE, 0},
{0, 1217, EIF_FALSE, 0},
{0, 1218, EIF_FALSE, 0},
{0, 1219, EIF_FALSE, 0},
{0, 1220, EIF_FALSE, 0},
{0, 1221, EIF_FALSE, 0},
{0, 1222, EIF_FALSE, 0},
{0, 1223, EIF_FALSE, 0},
{0, 1224, EIF_FALSE, 0},
{0, 1225, EIF_FALSE, 0},
{0, 1226, EIF_FALSE, 0},
{0, 1227, EIF_FALSE, 0},
{0, 1228, EIF_FALSE, 0},
{0, 1229, EIF_FALSE, 0},
{0, 1230, EIF_FALSE, 0},
{0, 1231, EIF_FALSE, 0},
{0, 1232, EIF_FALSE, 0},
{0, 1233, EIF_FALSE, 0},
{0, 1234, EIF_FALSE, 0},
{0, 1235, EIF_FALSE, 0},
{0, 1236, EIF_FALSE, 0},
{0, 1237, EIF_TRUE, 0},
{0, 1238, EIF_FALSE, 0},
{0, 1239, EIF_FALSE, 0},
{0, 1240, EIF_FALSE, 0},
{0, 1241, EIF_FALSE, 0},
{0, 1242, EIF_FALSE, 0},
{0, 1243, EIF_FALSE, 0},
{0, 1244, EIF_FALSE, 0},
{0, 1245, EIF_FALSE, 0},
{0, 1246, EIF_FALSE, 0},
{0, 1247, EIF_FALSE, 0},
{0, 1248, EIF_TRUE, 0},
{0, 1249, EIF_FALSE, 0},
{0, 1250, EIF_FALSE, 0},
{0, 1251, EIF_FALSE, 0},
{0, 1252, EIF_FALSE, 0},
{0, 1253, EIF_FALSE, &T1253f25},
{0, 1254, EIF_FALSE, 0},
{0, 1255, EIF_FALSE, 0},
{0, 1256, EIF_FALSE, 0},
{0, 1257, EIF_FALSE, 0},
{0, 1258, EIF_FALSE, 0},
{0, 1259, EIF_FALSE, 0},
{0, 1260, EIF_FALSE, 0},
{0, 1261, EIF_FALSE, 0},
{0, 1262, EIF_FALSE, 0},
{0, 1263, EIF_FALSE, 0},
{0, 1264, EIF_FALSE, 0},
{0, 1265, EIF_FALSE, 0},
{0, 1266, EIF_FALSE, 0},
{0, 1267, EIF_FALSE, 0},
{0, 1268, EIF_FALSE, 0},
{0, 1269, EIF_FALSE, 0},
{0, 1270, EIF_FALSE, 0},
{0, 1271, EIF_FALSE, 0},
{0, 1272, EIF_TRUE, 0},
{0, 1273, EIF_TRUE, 0},
{0, 1274, EIF_FALSE, 0},
{0, 1275, EIF_FALSE, 0},
{0, 1276, EIF_FALSE, 0},
{0, 1277, EIF_FALSE, 0},
{0, 1278, EIF_FALSE, 0},
{0, 1279, EIF_FALSE, 0},
{0, 1280, EIF_FALSE, 0},
{0, 1281, EIF_FALSE, 0},
{0, 1282, EIF_FALSE, 0},
{0, 1283, EIF_FALSE, 0},
{0, 1284, EIF_FALSE, 0},
{0, 1285, EIF_FALSE, 0},
{0, 1286, EIF_TRUE, 0},
{0, 1287, EIF_FALSE, 0},
{0, 1288, EIF_FALSE, 0},
{0, 1289, EIF_FALSE, 0},
{0, 1290, EIF_FALSE, 0},
{0, 1291, EIF_FALSE, 0},
{0, 1292, EIF_FALSE, 0},
{0, 1293, EIF_TRUE, 0},
{0, 1294, EIF_FALSE, 0},
{0, 1295, EIF_FALSE, 0},
{0, 1296, EIF_FALSE, 0},
{0, 1297, EIF_FALSE, 0},
{0, 1298, EIF_FALSE, 0},
{0, 1299, EIF_FALSE, 0},
{0, 1300, EIF_FALSE, 0},
{0, 1301, EIF_TRUE, 0},
{0, 1302, EIF_FALSE, 0},
{0, 1303, EIF_FALSE, 0},
{0, 1304, EIF_FALSE, 0},
{0, 1305, EIF_FALSE, 0},
{0, 1306, EIF_FALSE, 0},
{0, 1307, EIF_FALSE, 0},
{0, 1308, EIF_FALSE, 0},
{0, 1309, EIF_FALSE, 0},
{0, 1310, EIF_FALSE, 0},
{0, 1311, EIF_FALSE, 0},
{0, 1312, EIF_FALSE, 0},
{0, 1313, EIF_FALSE, 0},
{0, 1314, EIF_FALSE, 0},
{0, 1315, EIF_FALSE, 0},
{0, 1316, EIF_FALSE, 0},
{0, 1317, EIF_FALSE, 0},
{0, 1318, EIF_FALSE, 0},
{0, 1319, EIF_FALSE, 0},
{0, 1320, EIF_FALSE, 0},
{0, 1321, EIF_FALSE, 0},
{0, 1322, EIF_FALSE, 0},
{0, 1323, EIF_FALSE, 0},
{0, 1324, EIF_FALSE, 0},
{0, 1325, EIF_FALSE, 0},
{0, 1326, EIF_FALSE, 0},
{0, 1327, EIF_FALSE, 0},
{0, 1328, EIF_FALSE, 0},
{0, 1329, EIF_FALSE, 0},
{0, 1330, EIF_FALSE, 0},
{0, 1331, EIF_FALSE, 0},
{0, 1332, EIF_FALSE, 0},
{0, 1333, EIF_FALSE, 0},
{0, 1334, EIF_FALSE, 0},
{0, 1335, EIF_FALSE, 0},
{0, 1336, EIF_FALSE, 0},
{0, 1337, EIF_FALSE, 0},
{0, 1338, EIF_FALSE, 0},
{0, 1339, EIF_FALSE, 0},
{0, 1340, EIF_FALSE, 0},
{0, 1341, EIF_FALSE, 0},
{0, 1342, EIF_FALSE, 0},
{0, 1343, EIF_FALSE, 0},
{0, 1344, EIF_FALSE, 0},
{0, 1345, EIF_FALSE, 0},
{0, 1346, EIF_FALSE, 0},
{0, 1347, EIF_FALSE, 0},
{0, 1348, EIF_FALSE, 0},
{0, 1349, EIF_FALSE, 0},
{0, 1350, EIF_FALSE, 0},
{0, 1351, EIF_FALSE, 0},
{0, 1352, EIF_FALSE, 0},
{0, 1353, EIF_FALSE, 0},
{0, 1354, EIF_FALSE, 0},
{0, 1355, EIF_FALSE, 0},
{0, 1356, EIF_FALSE, 0},
{0, 1357, EIF_FALSE, 0},
{0, 1358, EIF_FALSE, 0},
{0, 1359, EIF_FALSE, 0},
{0, 1360, EIF_FALSE, 0},
{0, 1361, EIF_FALSE, 0},
{0, 1362, EIF_FALSE, 0},
{0, 1363, EIF_FALSE, 0},
{0, 1364, EIF_FALSE, 0},
{0, 1365, EIF_FALSE, 0},
{0, 1366, EIF_FALSE, 0},
{0, 1367, EIF_FALSE, 0},
{0, 1368, EIF_FALSE, 0},
{0, 1369, EIF_FALSE, 0},
{0, 1370, EIF_FALSE, 0},
{0, 1371, EIF_FALSE, 0},
{0, 1372, EIF_FALSE, 0},
{0, 1373, EIF_FALSE, 0},
{0, 1374, EIF_FALSE, 0},
{0, 1375, EIF_FALSE, 0},
{0, 1376, EIF_FALSE, 0},
{0, 1377, EIF_FALSE, 0},
{0, 1378, EIF_FALSE, 0},
{0, 1379, EIF_FALSE, 0},
{0, 1380, EIF_FALSE, 0},
{0, 1381, EIF_FALSE, 0},
{0, 1382, EIF_FALSE, 0},
{0, 1383, EIF_FALSE, 0},
{0, 1384, EIF_FALSE, 0},
{0, 1385, EIF_FALSE, 0},
{0, 1386, EIF_FALSE, 0},
{0, 1387, EIF_FALSE, 0},
{0, 1388, EIF_FALSE, 0},
{0, 1389, EIF_FALSE, 0},
{0, 1390, EIF_FALSE, 0},
{0, 1391, EIF_FALSE, 0},
{0, 1392, EIF_FALSE, 0},
{0, 1393, EIF_FALSE, 0},
{0, 1394, EIF_FALSE, 0},
{0, 1395, EIF_FALSE, 0},
{0, 1396, EIF_FALSE, 0},
{0, 1397, EIF_FALSE, 0},
{0, 1398, EIF_FALSE, 0},
{0, 1399, EIF_FALSE, 0},
{0, 1400, EIF_FALSE, 0},
{0, 1401, EIF_FALSE, 0},
{0, 1402, EIF_FALSE, 0},
{0, 1403, EIF_FALSE, 0},
{0, 1404, EIF_FALSE, 0},
{0, 1405, EIF_FALSE, 0},
{0, 1406, EIF_FALSE, 0},
{0, 1407, EIF_FALSE, 0},
{0, 1408, EIF_FALSE, 0},
{0, 1409, EIF_FALSE, 0},
{0, 1410, EIF_FALSE, 0},
{0, 1411, EIF_FALSE, 0},
{0, 1412, EIF_FALSE, 0},
{0, 1413, EIF_FALSE, 0},
{0, 1414, EIF_FALSE, 0},
{0, 1415, EIF_FALSE, 0},
{0, 1416, EIF_FALSE, 0},
{0, 1417, EIF_FALSE, 0},
{0, 1418, EIF_TRUE, 0},
{0, 1419, EIF_FALSE, 0},
{0, 1420, EIF_FALSE, 0},
{0, 1421, EIF_FALSE, 0},
{0, 1422, EIF_FALSE, 0},
{0, 1423, EIF_FALSE, 0},
{0, 1424, EIF_FALSE, 0},
{0, 1425, EIF_FALSE, 0},
{0, 1426, EIF_FALSE, 0},
{0, 1427, EIF_TRUE, 0},
{0, 1428, EIF_FALSE, 0},
{0, 1429, EIF_FALSE, 0},
{0, 1430, EIF_FALSE, 0},
{0, 1431, EIF_FALSE, 0},
{0, 1432, EIF_FALSE, 0},
{0, 1433, EIF_FALSE, 0},
{0, 1434, EIF_TRUE, 0},
{0, 1435, EIF_FALSE, 0},
{0, 1436, EIF_FALSE, 0},
{0, 1437, EIF_FALSE, 0},
{0, 1438, EIF_FALSE, 0},
{0, 1439, EIF_FALSE, 0},
{0, 1440, EIF_FALSE, 0},
{0, 1441, EIF_FALSE, 0},
{0, 1442, EIF_FALSE, 0},
{0, 1443, EIF_FALSE, 0},
{0, 1444, EIF_FALSE, 0},
{0, 1445, EIF_FALSE, 0},
{0, 1446, EIF_FALSE, 0},
{0, 1447, EIF_FALSE, 0},
{0, 1448, EIF_FALSE, 0},
{0, 1449, EIF_FALSE, 0},
{0, 1450, EIF_FALSE, 0},
{0, 1451, EIF_FALSE, 0},
{0, 1452, EIF_FALSE, 0},
{0, 1453, EIF_FALSE, 0},
{0, 1454, EIF_FALSE, 0},
{0, 1455, EIF_FALSE, 0},
{0, 1456, EIF_FALSE, 0},
{0, 1457, EIF_FALSE, 0},
{0, 1458, EIF_FALSE, 0},
{0, 1459, EIF_FALSE, 0},
{0, 1460, EIF_TRUE, 0},
{0, 1461, EIF_FALSE, 0},
{0, 1462, EIF_FALSE, 0},
{0, 1463, EIF_FALSE, 0},
{0, 1464, EIF_FALSE, 0},
{0, 1465, EIF_FALSE, 0},
{0, 1466, EIF_FALSE, 0},
{0, 1467, EIF_FALSE, 0},
{0, 1468, EIF_FALSE, 0},
{0, 1469, EIF_FALSE, 0},
{0, 1470, EIF_FALSE, 0},
{0, 1471, EIF_FALSE, 0},
{0, 1472, EIF_FALSE, 0},
{0, 1473, EIF_FALSE, 0},
{0, 1474, EIF_FALSE, 0},
{0, 1475, EIF_FALSE, 0},
{0, 1476, EIF_FALSE, 0},
{0, 1477, EIF_FALSE, 0},
{0, 1478, EIF_FALSE, 0},
{0, 1479, EIF_FALSE, 0},
{0, 1480, EIF_FALSE, 0},
{0, 1481, EIF_FALSE, 0},
{0, 1482, EIF_FALSE, 0},
{0, 1483, EIF_FALSE, 0},
{0, 1484, EIF_FALSE, 0},
{0, 1485, EIF_FALSE, 0},
{0, 1486, EIF_FALSE, 0},
{0, 1487, EIF_FALSE, 0},
{0, 1488, EIF_FALSE, 0},
{0, 1489, EIF_FALSE, 0},
{0, 1490, EIF_FALSE, 0},
{0, 1491, EIF_FALSE, 0},
{0, 1492, EIF_FALSE, 0},
{0, 1493, EIF_FALSE, 0},
{0, 1494, EIF_FALSE, 0},
{0, 1495, EIF_FALSE, 0},
{0, 1496, EIF_FALSE, 0},
{0, 1497, EIF_FALSE, 0},
{0, 1498, EIF_FALSE, 0},
{0, 1499, EIF_FALSE, 0},
{0, 1500, EIF_FALSE, 0},
{0, 1501, EIF_FALSE, 0},
{0, 1502, EIF_FALSE, 0},
{0, 1503, EIF_FALSE, 0},
{0, 1504, EIF_FALSE, 0},
{0, 1505, EIF_FALSE, 0},
{0, 1506, EIF_FALSE, 0},
{0, 1507, EIF_FALSE, 0},
{0, 1508, EIF_FALSE, 0},
{0, 1509, EIF_FALSE, 0},
{0, 1510, EIF_FALSE, 0},
{0, 1511, EIF_FALSE, 0},
{0, 1512, EIF_FALSE, 0},
{0, 1513, EIF_FALSE, 0},
{0, 1514, EIF_FALSE, 0},
{0, 1515, EIF_FALSE, 0},
{0, 1516, EIF_FALSE, 0},
{0, 1517, EIF_FALSE, 0},
{0, 1518, EIF_FALSE, 0},
{0, 1519, EIF_FALSE, 0},
{0, 1520, EIF_FALSE, 0},
{0, 1521, EIF_FALSE, 0},
{0, 1522, EIF_FALSE, 0},
{0, 1523, EIF_FALSE, 0},
{0, 1524, EIF_FALSE, 0},
{0, 1525, EIF_FALSE, 0},
{0, 1526, EIF_FALSE, 0},
{0, 1527, EIF_FALSE, 0},
{0, 1528, EIF_FALSE, 0},
{0, 1529, EIF_FALSE, 0},
{0, 1530, EIF_FALSE, 0},
{0, 1531, EIF_FALSE, 0},
{0, 1532, EIF_FALSE, 0},
{0, 1533, EIF_TRUE, 0},
{0, 1534, EIF_FALSE, 0},
{0, 1535, EIF_FALSE, 0},
{0, 1536, EIF_TRUE, 0},
{0, 1537, EIF_TRUE, 0},
{0, 1538, EIF_FALSE, 0},
{0, 1539, EIF_FALSE, 0},
{0, 1540, EIF_TRUE, 0},
{0, 1541, EIF_FALSE, 0},
{0, 1542, EIF_FALSE, 0},
{0, 1543, EIF_FALSE, 0},
{0, 1544, EIF_TRUE, 0},
{0, 1545, EIF_FALSE, 0},
{0, 1546, EIF_FALSE, 0},
{0, 1547, EIF_TRUE, 0},
{0, 1548, EIF_FALSE, 0},
{0, 1549, EIF_FALSE, 0},
{0, 1550, EIF_FALSE, 0},
{0, 1551, EIF_FALSE, 0},
{0, 1552, EIF_FALSE, 0},
{0, 1553, EIF_FALSE, 0},
{0, 1554, EIF_FALSE, 0},
{0, 1555, EIF_FALSE, 0},
{0, 1556, EIF_FALSE, 0},
{0, 1557, EIF_FALSE, 0},
{0, 1558, EIF_FALSE, 0},
{0, 1559, EIF_FALSE, 0},
{0, 1560, EIF_FALSE, 0},
{0, 1561, EIF_FALSE, 0},
{0, 1562, EIF_FALSE, 0},
{0, 1563, EIF_FALSE, 0},
{0, 1564, EIF_FALSE, 0},
{0, 1565, EIF_FALSE, 0},
{0, 1566, EIF_FALSE, 0},
{0, 1567, EIF_TRUE, 0},
{0, 1568, EIF_FALSE, 0},
{0, 1569, EIF_FALSE, 0},
{0, 1570, EIF_FALSE, 0},
{0, 1571, EIF_FALSE, 0},
{0, 1572, EIF_FALSE, 0},
{0, 1573, EIF_FALSE, 0},
{0, 1574, EIF_FALSE, 0},
{0, 1575, EIF_FALSE, 0},
{0, 1576, EIF_FALSE, 0},
{0, 1577, EIF_TRUE, 0},
{0, 1578, EIF_FALSE, 0},
{0, 1579, EIF_FALSE, 0},
{0, 1580, EIF_FALSE, 0},
{0, 1581, EIF_FALSE, 0},
{0, 1582, EIF_FALSE, 0},
{0, 1583, EIF_FALSE, 0},
{0, 1584, EIF_FALSE, 0},
{0, 1585, EIF_TRUE, 0},
{0, 1586, EIF_FALSE, 0},
{0, 1587, EIF_TRUE, 0},
{0, 1588, EIF_FALSE, 0},
{0, 1589, EIF_FALSE, 0},
{0, 1590, EIF_TRUE, 0},
{0, 1591, EIF_FALSE, 0},
{0, 1592, EIF_FALSE, 0},
{0, 1593, EIF_FALSE, 0},
{0, 1594, EIF_FALSE, 0},
{0, 1595, EIF_FALSE, 0},
{0, 1596, EIF_FALSE, 0},
{0, 1597, EIF_FALSE, 0},
{0, 1598, EIF_FALSE, 0},
{0, 1599, EIF_FALSE, 0},
{0, 1600, EIF_FALSE, 0},
{0, 1601, EIF_FALSE, 0},
{0, 1602, EIF_FALSE, 0},
{0, 1603, EIF_FALSE, 0},
{0, 1604, EIF_FALSE, 0},
{0, 1605, EIF_FALSE, 0},
{0, 1606, EIF_FALSE, 0},
{0, 1607, EIF_FALSE, 0},
{0, 1608, EIF_FALSE, 0},
{0, 1609, EIF_FALSE, 0},
{0, 1610, EIF_FALSE, 0},
{0, 1611, EIF_FALSE, 0},
{0, 1612, EIF_FALSE, 0},
{0, 1613, EIF_FALSE, 0},
{0, 1614, EIF_FALSE, 0},
{0, 1615, EIF_FALSE, 0},
{0, 1616, EIF_FALSE, 0},
{0, 1617, EIF_FALSE, 0},
{0, 1618, EIF_FALSE, 0},
{0, 1619, EIF_FALSE, 0},
{0, 1620, EIF_FALSE, 0},
{0, 1621, EIF_FALSE, 0},
{0, 1622, EIF_FALSE, 0},
{0, 1623, EIF_FALSE, 0},
{0, 1624, EIF_FALSE, 0},
{0, 1625, EIF_FALSE, 0},
{0, 1626, EIF_FALSE, 0},
{0, 1627, EIF_FALSE, 0},
{0, 1628, EIF_FALSE, 0},
{0, 1629, EIF_FALSE, 0},
{0, 1630, EIF_FALSE, 0},
{0, 1631, EIF_TRUE, 0},
{0, 1632, EIF_FALSE, 0},
{0, 1633, EIF_FALSE, 0},
{0, 1634, EIF_FALSE, 0},
{0, 1635, EIF_FALSE, 0},
{0, 1636, EIF_FALSE, 0},
{0, 1637, EIF_FALSE, 0},
{0, 1638, EIF_FALSE, 0},
{0, 1639, EIF_FALSE, 0},
{0, 1640, EIF_FALSE, 0},
{0, 1641, EIF_FALSE, 0},
{0, 1642, EIF_FALSE, 0},
{0, 1643, EIF_FALSE, 0},
{0, 1644, EIF_FALSE, 0},
{0, 1645, EIF_FALSE, 0},
{0, 1646, EIF_FALSE, 0},
{0, 1647, EIF_FALSE, 0},
{0, 1648, EIF_FALSE, 0},
{0, 1649, EIF_FALSE, 0},
{0, 1650, EIF_FALSE, 0},
{0, 1651, EIF_FALSE, 0},
{0, 1652, EIF_TRUE, 0},
{0, 1653, EIF_FALSE, 0},
{0, 1654, EIF_FALSE, 0},
{0, 1655, EIF_FALSE, 0},
{0, 1656, EIF_TRUE, 0},
{0, 1657, EIF_FALSE, 0},
{0, 1658, EIF_FALSE, 0},
{0, 1659, EIF_TRUE, 0},
{0, 1660, EIF_FALSE, 0},
{0, 1661, EIF_FALSE, 0},
{0, 1662, EIF_FALSE, 0},
{0, 1663, EIF_TRUE, 0},
{0, 1664, EIF_FALSE, 0},
{0, 1665, EIF_FALSE, 0},
{0, 1666, EIF_FALSE, 0},
{0, 1667, EIF_FALSE, 0},
{0, 1668, EIF_FALSE, 0},
{0, 1669, EIF_FALSE, 0},
{0, 1670, EIF_FALSE, 0},
{0, 1671, EIF_FALSE, 0},
{0, 1672, EIF_FALSE, 0},
{0, 1673, EIF_FALSE, 0},
{0, 1674, EIF_FALSE, 0},
{0, 1675, EIF_FALSE, 0},
{0, 1676, EIF_FALSE, 0},
{0, 1677, EIF_FALSE, 0},
{0, 1678, EIF_FALSE, 0},
{0, 1679, EIF_FALSE, 0},
{0, 1680, EIF_FALSE, 0},
{0, 1681, EIF_FALSE, 0},
{0, 1682, EIF_FALSE, 0},
{0, 1683, EIF_FALSE, 0},
{0, 1684, EIF_FALSE, 0},
{0, 1685, EIF_FALSE, 0},
{0, 1686, EIF_FALSE, 0},
{0, 1687, EIF_FALSE, 0},
{0, 1688, EIF_FALSE, 0},
{0, 1689, EIF_FALSE, 0},
{0, 1690, EIF_FALSE, 0},
{0, 1691, EIF_FALSE, 0},
{0, 1692, EIF_FALSE, 0},
{0, 1693, EIF_FALSE, 0},
{0, 1694, EIF_FALSE, 0},
{0, 1695, EIF_FALSE, 0},
{0, 1696, EIF_FALSE, 0},
{0, 1697, EIF_FALSE, 0},
{0, 1698, EIF_FALSE, 0},
{0, 1699, EIF_FALSE, 0},
{0, 1700, EIF_FALSE, 0},
{0, 1701, EIF_FALSE, 0},
{0, 1702, EIF_FALSE, 0},
{0, 1703, EIF_FALSE, 0},
{0, 1704, EIF_FALSE, 0},
{0, 1705, EIF_FALSE, 0},
{0, 1706, EIF_FALSE, 0},
{0, 1707, EIF_FALSE, 0},
{0, 1708, EIF_FALSE, 0},
{0, 1709, EIF_FALSE, 0},
{0, 1710, EIF_FALSE, 0},
{0, 1711, EIF_FALSE, 0},
{0, 1712, EIF_FALSE, 0},
{0, 1713, EIF_FALSE, 0},
{0, 1714, EIF_FALSE, 0},
{0, 1715, EIF_FALSE, 0},
{0, 1716, EIF_FALSE, 0},
{0, 1717, EIF_FALSE, 0},
{0, 1718, EIF_FALSE, 0},
{0, 1719, EIF_FALSE, 0},
{0, 1720, EIF_FALSE, 0},
{0, 1721, EIF_FALSE, 0},
{0, 1722, EIF_FALSE, 0},
{0, 1723, EIF_FALSE, 0},
{0, 1724, EIF_FALSE, 0},
{0, 1725, EIF_FALSE, 0},
{0, 1726, EIF_FALSE, 0},
{0, 1727, EIF_FALSE, 0},
{0, 1728, EIF_FALSE, 0},
{0, 1729, EIF_FALSE, 0},
{0, 1730, EIF_FALSE, 0},
{0, 1731, EIF_FALSE, 0},
{0, 1732, EIF_FALSE, 0},
{0, 1733, EIF_FALSE, 0},
{0, 1734, EIF_FALSE, 0},
{0, 1735, EIF_FALSE, 0},
{0, 1736, EIF_FALSE, 0},
{0, 1737, EIF_FALSE, 0},
{0, 1738, EIF_FALSE, 0},
{0, 1739, EIF_FALSE, 0},
{0, 1740, EIF_FALSE, 0},
{0, 1741, EIF_FALSE, 0},
{0, 1742, EIF_FALSE, 0},
{0, 1743, EIF_FALSE, 0},
{0, 1744, EIF_FALSE, 0},
{0, 1745, EIF_FALSE, 0},
{0, 1746, EIF_FALSE, 0},
{0, 1747, EIF_FALSE, 0},
{0, 1748, EIF_FALSE, 0},
{0, 1749, EIF_FALSE, 0},
{0, 1750, EIF_FALSE, 0},
{0, 1751, EIF_FALSE, 0},
{0, 1752, EIF_TRUE, 0},
{0, 1753, EIF_FALSE, 0},
{0, 1754, EIF_FALSE, 0},
{0, 1755, EIF_FALSE, 0},
{0, 1756, EIF_FALSE, 0},
{0, 1757, EIF_FALSE, 0},
{0, 1758, EIF_FALSE, 0},
{0, 1759, EIF_FALSE, 0},
{0, 1760, EIF_FALSE, 0},
{0, 1761, EIF_FALSE, 0},
{0, 1762, EIF_FALSE, 0},
{0, 1763, EIF_FALSE, 0},
{0, 1764, EIF_FALSE, 0},
{0, 1765, EIF_FALSE, 0}
};

int main(int argc, char** argv)
{
	T0* t1;
	GE_argc = argc;
	GE_argv = argv;
	GE_last_rescue = 0;
	GE_init_gc();
	GE_const_init();
#ifdef EIF_WINDOWS
	eif_hInstance = GetModuleHandle(NULL);
#endif
	t1 = T21c36();
	return 0;
}


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to implement class ARGUMENTS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_ARGUMENTS_C
#define GE_ARGUMENTS_C

#ifdef __cplusplus
extern "C" {
#endif

int GE_argc;
char** GE_argv;

	/* Clean up function */
typedef void (* EIF_CLEANUP)(EIF_BOOLEAN);
void eif_register_cleanup(EIF_CLEANUP f){
	/* TODO: Needed to compile some code at AXAR */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_register_cleanup' in 'ge_arguments.h' not implemented\n");
}

#ifdef __cplusplus
}
#endif

#endif
#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to implement class EXCEPTION"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_EXCEPTION_C
#define GE_EXCEPTION_C

#ifdef __cplusplus
extern "C" {
#endif

/*
	Context of last feature entered containing a rescue clause.
	Warning: this is not thread-safe.
*/
GE_rescue* GE_last_rescue;

/*
	Raise an exception with code 'code'.
*/
void GE_raise(int code)
{
	GE_rescue* r = GE_last_rescue;
	if (r != 0) {
		GE_last_rescue = r->previous;
		GE_longjmp(r->jb, code);
	}
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "Unhandled exception\n");
	exit(1);
}

/*
	Check whether the type id of 'obj' is not in 'type_ids'.
	If it is, then raise a CAT-call exception. Don't do anything if 'obj' is Void.
	'nb' is the number of ids in 'type_ids' and is expected to be >0.
	'type_ids' is sorted in increasing order.
	Return 'obj'.
*/
EIF_REFERENCE GE_check_catcall(EIF_REFERENCE obj, int type_ids[], int nb)
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
#ifdef EIF_WINDOWS
					GE_show_console();
#endif
					fprintf(stderr, "CAT-call error!\n");
#ifdef EIF_DEBUG
					{
						char c;
						fprintf(stderr, "Press Enter...\n");
						scanf("%c", &c);
					}
#endif
					GE_raise(24);
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
	Check whether 'obj' is Void.
	If it is, then raise a call-on-void-target exception.
	Return 'obj'
*/
EIF_REFERENCE GE_check_void(EIF_REFERENCE obj)
{
	if (!obj) {
#ifdef EIF_WINDOWS
		GE_show_console();
#endif
		fprintf(stderr, "Call on Void target!\n");
#ifdef EIF_DEBUG
		{
			char c;
			fprintf(stderr, "Press Enter...\n");
			scanf("%c", &c);
		}
#endif
		GE_raise(1);
	}
	return (obj);
}

/*
	Check whether 'ptr' is a null pointer.
	If it is, then raise a no-more-memory exception.
	Return 'ptr'
*/
void* GE_check_null(void* ptr)
{
	if (!ptr) {
#ifdef EIF_WINDOWS
		GE_show_console();
#endif
		fprintf(stderr, "No more memory!\n");
#ifdef EIF_DEBUG
		{
			char c;
			fprintf(stderr, "Press Enter...\n");
			scanf("%c", &c);
		}
#endif
		GE_raise(2);
	}
	return (ptr);
}

#ifdef __cplusplus
}
#endif

#endif
#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to implement class CONSOLE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_CONSOLE_C
#define GE_CONSOLE_C

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

/*
	Create a new DOS console if needed (i.e. in case of a Windows application).
*/
void GE_show_console(void)
{
	if (!GE_console_allocated) {
		HANDLE hconin, hconout, hconerr;
		CONSOLE_SCREEN_BUFFER_INFO csbi;
		BOOL bLaunched;
		BOOL bSuccess;
		int hCrt;
#ifndef EIF_BORLAND
		FILE *hf;
extern FILE * _fdopen(int, const char *); /* Needed for lcc-win32 */
#endif

		bSuccess = AllocConsole();
			/* Get all Std handles and raise an IO exception if we fail getting one. */
		hconout = GetStdHandle(STD_OUTPUT_HANDLE);
		if (hconout == INVALID_HANDLE_VALUE) {
			GE_raise(24);
		}
		hconerr = GetStdHandle(STD_ERROR_HANDLE);
		if (hconerr == INVALID_HANDLE_VALUE) {
			GE_raise(24);
		}
		hconin = GetStdHandle(STD_INPUT_HANDLE);
		if (hconin == INVALID_HANDLE_VALUE) {
			GE_raise(24);
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
			hCrt = _open_osfhandle((intptr_t) hconout, _O_TEXT);
#ifdef EIF_BORLAND
			dup2(hCrt, _fileno(stdout));
#else
			hf = _fdopen (hCrt, "w");
			*stdout = *hf;
#endif
			setvbuf(stdout, NULL, _IONBF, 0);
			hCrt = _open_osfhandle((intptr_t) hconerr, _O_TEXT);
#ifdef EIF_BORLAND
			dup2(hCrt, _fileno(stderr));
#else
			hf = _fdopen(hCrt, "w");
			*stderr = *hf;
#endif
			setvbuf(stderr, NULL, _IONBF, 0);
			hCrt = _open_osfhandle((intptr_t) hconin, _O_TEXT | _O_RDONLY);
#ifdef EIF_BORLAND
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
}

#endif

#ifdef __cplusplus
}
#endif

#endif
#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to implement the program initialization"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_MAIN_C
#define GE_MAIN_C

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS

/*
	Main entry point when compiling a Windows application.
	See:
		http://en.wikipedia.org/wiki/WinMain
		http://msdn2.microsoft.com/en-us/library/ms633559.aspx
*/
extern int main(int argc, char** argv);
extern void GE_get_argcargv(char* cmd, int* argc, char*** argvp);
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
{
	int code;
	int argc;
	char** argv;
	char* cmd;
	cmd = strdup(GetCommandLineA());
	GE_get_argcargv(cmd, &argc, &argv);
	code = main(argc, argv);
	free(cmd);
	free(argv);
	return code;
}

/*
	Break the shell command held in 'cmd', putting each shell word
	in a separate array entry, hence building an argument
	suitable for the 'main'. Note that 'cmd' will be altered
	and 'argvp' will point to some chunks of it.
*/
void GE_get_argcargv(char* cmd, int* argc, char*** argvp)
{
	int quoted = 0; /* parsing inside a quoted string? */
	int nbs; /* number of backspaces */
	int i;
	char *p = NULL, *pe = NULL; /* pointers in `cmd' */
	char *qb = NULL, *q = NULL; /* pointers in arguments */

	*argc = 0;
	/* Remove leading and trailing white spaces */
	for (p = cmd; *p == ' ' || *p == '\t'; p++)
		; /* empty */
	for (pe = p + strlen(p) - 1; pe >= p && (*pe == ' ' || *pe == '\t'); pe--)
		; /* empty */
	if (p <= pe) {
		*argc = *argc + 1; /* at least one argument */
		qb = q = malloc(pe - p + 2);
		if (!qb) {
			return;
		}
		do {
			switch(*p) {
				case ' ':
				case '\t':
					if (quoted) {
						do {
							*q++ = *p++; 
						} while(*p == ' ' || *p == '\t');
					} else {
						do {
							p++;
						} while(*p == ' ' || *p == '\t');
						*q++ = '\0';
						*argc = *argc + 1;
					}
					break;
				case '\"':
					quoted = ! quoted;
					p++;
					break;
				case '\\':
					for (nbs = 0; *p == '\\'; nbs++)
						*q++ = *p++;
					if (*p == '\"') {
						if (nbs % 2) { /* odd number of backslashes */
							q -= (nbs + 1) / 2;
							*q++ = *p++;
						} else { /* even number of backslashes */
							quoted = ! quoted;
							q -= nbs / 2;
							p++;
						}
					}
					break;
				default:
					*q++ = *p++;
			}
		} while (p <= pe);
		*q++ = '\0';
	}

	if (!argvp) {
		free(qb);
		return;
	}

	*argvp = (char**)malloc((*argc+1)*sizeof(char*));
	if (!(*argvp)) {
		free(qb);
		return;
	}

	for (i = 0; i < *argc; i++) {
		(*argvp)[i] = qb;
		qb += strlen(qb) + 1;
	}
	(*argvp)[i] = (char *)0;
}

#endif

#ifdef __cplusplus
}
#endif

#endif
#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to access garbage collector facilities"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_GC_C
#define GE_GC_C

#ifdef EIF_BOEHM_GC
/*
 * Call dispose routine `disp' on object `C'.
 */
void GE_boehm_dispose(void* C, void* disp) {
#ifdef EIF_EXCEPTION_TRACE
	((GE_types[((EIF_REFERENCE)C)->id]).dispose)(0,(EIF_REFERENCE)C);
#else
	((GE_types[((EIF_REFERENCE)C)->id]).dispose)((EIF_REFERENCE)C);
#endif
}
#endif

#endif
#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to implement class EXCEPTIONS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_EXCEPT_C
#define EIF_EXCEPT_C

#ifdef __cplusplus
extern "C" {
#endif

void eraise(char* name, long code) {
	GE_raise((int)code);
}

void esdie(int code) {
	exit(code);
}

EIF_REFERENCE eename(long except) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eename' in 'eif_except.h' not implemented\n");
	return EIF_VOID;
}

char* eeltag(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eeltag' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

char* eelrout(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eelrout' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

char* eelclass(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eelclass' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

long eelcode(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eelcode' in 'eif_except.h' not implemented\n");
	return 0;
}

EIF_REFERENCE stack_trace_string(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'stack_trace_string' in 'eif_except.h' not implemented\n");
	return EIF_VOID;
}

char* eeotag(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eeotag' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

long eeocode(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eeocode' in 'eif_except.h' not implemented\n");
	return 0;
}

char* eeorout(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eeorout' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

char* eeoclass(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eeoclass' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

void eecatch(long code) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eecatch' in 'eif_except.h' not implemented\n");
}

void eeignore(long code) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eeignore' in 'eif_except.h' not implemented\n");
}

void eetrace(char b) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eetrace' in 'eif_except.h' not implemented\n");
}

#ifdef EIF_WINDOWS
void set_windows_exception_filter() {
	/* TODO: Needed to compile some code at AXAR */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'set_windows_exception_filter' in 'eif_except.h' not implemented\n");
}
#endif

/*
 * Raise an Eiffel exception of the given code with no associated tag.
 */
void xraise(int code) {
	eraise(NULL, (long)code);
}

/*
 * Raise 'Operating system error' exception.
 */
void esys(void) {
	if (errno == 0) {
			/* External event */
		xraise(EN_EXT);
	} else {
			/* Operating system error */
		xraise(EN_SYS);
	}
}

/*
 * As a special case, an I/O error is raised when a system call which is
 * I/O bound fails.
 */
void eise_io(char *tag) {
	eraise(tag, EN_ISE_IO);		/* I/O error */
}

#ifdef __cplusplus
}
#endif

#endif
#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to implement class FILE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_FILE_C
#define EIF_FILE_C

/* HAS_CHOWN:
 *	This symbol, if defined, indicates that the chown routine is
 *	available.
 */
#ifndef EIF_WINDOWS
#define HAS_CHOWN
#endif

/* HAS_GETEUID:
 *	This symbol, if defined, indicates that the geteuid system call is
 *	available
 */
#ifndef EIF_WINDOWS
#define  HAS_GETEUID
#endif

/* HAS_GETGRGID:
 *	This symbol, if defined, indicates that the getgrgid system call is
 *	available
 */
#ifndef EIF_WINDOWS
#define  HAS_GETGRGID
#endif

/* HAS_GETGROUPS:
 *	This symbol, if defined, indicates that the getgroups() routine is
 *	available to get the list of process groups.  If unavailable, multiple
 *	groups are probably not supported.
 */
#ifndef EIF_WINDOWS
#define HAS_GETGROUPS
#define Groups_t gid_t	/* Type for 2nd arg to getgroups() */
#endif

/* HAS_GETPWUID:
 *	This symbol, if defined, indicates that the getpwuid system call is
 *	available
 */
#ifndef EIF_WINDOWS
#define  HAS_GETPWUID
#endif

/* HAS_LINK:
 *	This symbol, if defined, indicates that the link routine is
 *	available to create hard links.
 */
#ifndef EIF_WINDOWS
#define HAS_LINK
#endif

/* HAS_LSTAT:
 *	This symbol, if defined, indicates that the lstat routine is
 *	available to do file stats on symbolic links.
 */
#ifndef EIF_WINDOWS
#define HAS_LSTAT
#endif


#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#ifdef EIF_WINDOWS
#if defined (__BORLANDC__) && (__BORLANDC__ < 0x600) /* Borland before 6.0 */
#include <utime.h>
#else
#include <sys/utime.h>
extern int utime(const char *, struct utimbuf *); /* Needed for lcc-win32 */
#endif
#include <io.h> /* for access, chmod */
#include <direct.h> /* for (ch|mk|rm)dir */
#else
#include <utime.h>
#include <unistd.h>
#include <pwd.h>
#include <grp.h>
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
#ifndef ST_MODE
#define ST_MODE 0x0fff
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Create directory `dirname'.
 */
void file_mkdir(char* dirname) {
	errno = 0;
#ifdef EIF_WINDOWS
	if (mkdir(dirname) == -1) {
#else
	if (mkdir(dirname, 0777) == -1) {
#endif
		esys(); /* Raise exception */
	}
}

/*
 * Rename file `from' into `to'.
 */
void file_rename(char* from, char* to) {
	for (;;) {
#ifdef EIF_WINDOWS
		if (file_exists(to)) {
				/* To have the same behavior as Unix, we need to remove the destination file if it exists.
				 * Of course we can do this only if `from' and `to' do not represent the same file.
				 * To check this, we use `CreateFile' to open both file, and then using the information
				 * returned by `GetFileInformationByHandle' we can check whether or not they are indeed
				 * the same. */
			BY_HANDLE_FILE_INFORMATION l_to_info, l_from_info;
			HANDLE l_from_file = CreateFile (from, GENERIC_READ, FILE_SHARE_READ, NULL,
				OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
			HANDLE l_to_file = CreateFile (to, GENERIC_READ, FILE_SHARE_READ, NULL,
					OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);

			if ((l_from_file == INVALID_HANDLE_VALUE) || (l_to_file == INVALID_HANDLE_VALUE)) {
					/* We do not need the handles anymore, simply close them. Since Microsoft
					 * API accepts INVALID_HANDLE_VALUE we don't check the validity of arguments. */
				CloseHandle(l_from_file);
				CloseHandle(l_to_file);

					/* For some reasons we cannot open the file. This should not happen, maybe the OS has
					 * removed `from' or `to'. In that case, we simply try to remove destination as we were
					 * doing in former revision of `file_rename'. */
				remove (to);
			} else {
				BOOL success = GetFileInformationByHandle (l_from_file, &l_from_info);
				success = success && GetFileInformationByHandle (l_to_file, &l_to_info);
					/* We do not need the handles anymore, simply close them. */
				CloseHandle(l_from_file);
				CloseHandle(l_to_file);
				if (success) {
						/* Check that `from' and `to' do not represent the same file. */
					if
						((l_from_info.dwVolumeSerialNumber != l_to_info.dwVolumeSerialNumber) ||
						(l_from_info.nFileIndexLow != l_to_info.nFileIndexLow) ||
						(l_from_info.nFileIndexHigh != l_to_info.nFileIndexHigh))
					{
						remove (to);
					} else {
							/* Files are identical, nothing to be done apart from */
						break;
					}
				} else {
						/* An error occurred while retrieving the information about `from' and `to'. Like
						 * for the case where `l_from_file' and `l_to_file' are invalid, we try to remove
						 * the file. */
					remove (to);
				}
			}
		}
#endif
		errno = 0;
		if (rename(from, to) == -1) {
			esys(); /* Raise exception */
		}
		break;
	}
}

/*
 * Link file `from' into `to'.
 */
void file_link(char *from, char *to) {
#ifdef HAS_LINK
	errno = 0;
	if (link(from, to) == -1) {
		esys(); /* Raise exception */
	}
#endif
}

/*
 * Delete file or directory `name'.
 */
void file_unlink(char *name) {
	struct stat buf;
	file_stat(name, &buf);
	errno = 0;
	if (buf.st_mode & S_IFDIR) {
		if (rmdir(name) == -1) {
			esys(); /* Raise exception */
		}
	} else {
		if (remove(name) == -1) {
			esys(); /* Raise exception */
		}
	}
}

static char* file_open_mode(int how) {
/* Under Windows we add the mode "N". This is to make sure that
 * files created in Eiffel are not inheritable by default as otherwise
 * it makes things too complicated for the end user when spawning
 * child processes in multithreaded mode.
 * This follows the change in EiffelStudio svn#73874.
 */
	switch (how) {
	case 0: 
#ifdef EIF_WINDOWS
		return "rtN";
#else
		return "r";
#endif
	case 1:
#ifdef EIF_WINDOWS
		return "wtN";
#else
		return "w";
#endif
	case 2:
#ifdef EIF_WINDOWS
		return "atN";
#else
		return "a";
#endif
	case 3:
#ifdef EIF_WINDOWS
		return "rt+N";
#else
		return "r+";
#endif
	case 4:
#ifdef EIF_WINDOWS
		return "wt+N";
#else
		return "w+";
#endif
	case 5:
#ifdef EIF_WINDOWS
		return "at+N";
#else
		return "a+";
#endif
	case 10: 
#ifdef EIF_WINDOWS
		return "rbN";
#else
		return "r";
#endif
	case 11:
#ifdef EIF_WINDOWS
		return "wbN";
#else
		return "w";
#endif
	case 12:
#ifdef EIF_WINDOWS
		return "abN";
#else
		return "a";
#endif
	case 13:
#ifdef EIF_WINDOWS
		return "rb+N";
#else
		return "r+";
#endif
	case 14:
#ifdef EIF_WINDOWS
		return "wb+N";
#else
		return "w+";
#endif
	case 15:
#ifdef EIF_WINDOWS
		return "ab+N";
#else
		return "a+";
#endif
	default:
#ifdef EIF_WINDOWS
		return "rtN";
#else
		return "r";
#endif
	}
}

/*
 * Open file `name' with the corresponding type `how'.
 */
EIF_POINTER file_open(char *name, int how) {
	FILE *fp;
	errno = 0;
	fp = (FILE *)fopen(name, file_open_mode(how));
	if (fp == (FILE *)0) {
		esys(); /* Open failed, raise exception */
	}
	return (EIF_POINTER)fp;
}

/*
 * Open file `fd' with the corresponding type `how'.
 */
EIF_POINTER file_dopen(int fd, int how) {
	FILE *fp;
	errno = 0;
	fp = (FILE *)fdopen(fd, file_open_mode(how));
	if (fp == (FILE *)0) {
		esys(); /* Open failed, raise exception */
	}
	return (EIF_POINTER)fp;
}

/*
 * Reopen file `name' with the corresponding type `how' and substitute that
 * to the old stream described by `old'. This is useful to redirect 'stdout'
 * to another place, for instance.
 */
EIF_POINTER file_reopen(char *name, int how, FILE *old) {
	FILE *fp;
	errno = 0;
	fp = (FILE *)freopen(name, file_open_mode(how), old);
	if (fp == (FILE *)0) {
		esys(); /* Open failed, raise exception */
	}
	return (EIF_POINTER)fp;
}

/*
 * Close the file.
 */
void file_close(FILE *fp) {
	errno = 0;
	if (fclose(fp) != 0) {
		esys(); /* Close failed, raise exception */
	}
}

/*
 * Flush data held in stdio buffer.
 */
void file_flush(FILE *fp) {
	errno = 0;
	if (fflush(fp) != 0) {
	    esys(); /* Flush failed, raise exception */
	}
}

/*
 * Return the associated file descriptor.
 */
EIF_INTEGER file_fd(FILE *f) {
	if (f == (FILE *)0) {
		eraise("invalid file pointer", EN_EXT);
	}
	return (EIF_INTEGER)fileno(f);
}

/*
 * Get a character from `f'.
 */
EIF_CHARACTER file_gc(FILE *f) {
	int c;
	errno = 0;
	c = getc(f);
	if (c == EOF && ferror(f)) {
		eise_io("FILE: unable to read CHARACTER value.");
	}
	return (EIF_CHARACTER)c;
}

/*
 * Get a string from `f' and fill it into `s' (at most `bound' characters),
 * with `start' being the amount of bytes already stored within s. This
 * means we really have to read (bound - start) characters.
 */
EIF_INTEGER file_gs(FILE *f, char *s, EIF_INTEGER bound, EIF_INTEGER start) {
	EIF_INTEGER amount;
	int c = '\0';
	EIF_INTEGER read;

	amount = bound - start;
	s += start;
	errno = 0;
	read = 0;
	while (amount-- > 0) {
		if ((c = getc(f)) == '\n' || c == EOF)
			break;
		*s++ = c;
		read++;
	}
	if (c == EOF && ferror(f)) {
			/* An I/O error occurred */
			/* Raise exception */
		eise_io("FILE: unable to read current line.");
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

/*
 * Read min (bound, remaining bytes in file) characters into `s' and
 * return the number of characters read.
 */
EIF_INTEGER file_gss(FILE* f, char* s, EIF_INTEGER bound) {
	EIF_INTEGER amount;
	amount = (EIF_INTEGER)fread((void*)s, (size_t)1, (size_t)bound, f);
	if (ferror(f)) {
			/* An I/O error occurred */
			/* Raise exception */
		eise_io("FILE: unable to read stream.");
	}
	return amount;
}

/*
 * Get a word from `f' and fill it into `s' (at most `bound' characters),
 * with `start' being the amount of bytes already stored within s. This
 * means we really have to read (bound - start) characters. Any leading
 * spaces are skipped.
 */
EIF_INTEGER file_gw(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start) {
	EIF_INTEGER amount;
	int c = 0;

	amount = bound - start;
	s += start;
	errno = 0;
	if (start == 0) {
		while ((c = getc(f)) != EOF) {
			if (!isspace(c)) {
				break;
			}
		}
		if (c == EOF) {
			if (ferror(f)) {
					/* An I/O error occurred */
					/* Raise exception */
				eise_io("FILE: unable to read word.");
			}
				/* Reached EOF before word */
			return (EIF_INTEGER) 0;
		} else if (EOF == ungetc(c, f)) {
			eise_io("FILE: unable to read word.");
		}
	}
	while (amount-- > 0) {
		c = getc(f);
		if (c == EOF) {
			if (ferror(f)) {
					/* An I/O error occurred */
					/* Raise exception */
				eise_io("FILE: unable to read word.");
			}
			break;
		} else if (isspace(c)) {
			if (EOF == ungetc(c, f)) {
				eise_io("FILE: unable to read word.");
			}
			break;
		}
		*s++ = c;
	}
	if (c == EOF || isspace(c)) {
		return bound - start - amount - 1;
	}
	return bound - start + 1;
}

/*
 * Look ahead one character. If EOF, return 0.
 */
EIF_CHARACTER file_lh(FILE *f) {
	int c;

	errno = 0;
	c = getc(f);
	if (c == EOF) {
		if (ferror(f)) {
			eise_io("FILE: error when reading a character ahead.");
		}
	} else if (EOF == ungetc(c, f)) {
		eise_io("FILE: error when reading a character ahead.");
	}
	return (EIF_CHARACTER) (c == EOF ? (char) 0 : (char) c);
}

/*
 * Size of file `fp'.
 */
EIF_INTEGER eif_file_size(FILE *fp) {
	struct stat buf;

	errno = 0;
	if (fflush (fp) != 0) {
		esys();
	}
	if (fstat(fileno(fp), &buf) == -1) {
		esys();
		return (EIF_INTEGER)0;
	} else {
		return (EIF_INTEGER)(buf.st_size);
	}
}

/*
 * Read upto next input line.
 */
void file_tnil(FILE *f) {
	int c;

	errno = 0;
	while ((c = getc(f)) != '\n' && c != EOF)
		;
	if (c == EOF && ferror(f))
		eise_io("FILE: error during reading the end of the file.");
}

/*
 * Current position within file.
 */
EIF_INTEGER file_tell(FILE *f) {

	if (f == (FILE *) 0) {
		eraise("invalid file pointer", EN_EXT);
	}
	return (EIF_INTEGER)ftell(f);
}

/*
 * Touch file `name' by setting both access and modification time to the
 * current time stamp. This external function exists only because there
 * is no way within UNIX_FILE to get the current time stamp. Otherwise,
 * we could simply call file_utime.
 */
void file_touch(char *name) {
	file_utime(name, time((time_t *) 0), 2);
}

/*
 * Modify the modification and/or the access time stored in the file's
 * inode. The 'how' parameter tells which attributes should be set.
 */
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
	errno = 0;
	if (utime(name, &tp) == -1) {
			/* Raise exception */
		esys();
	}
}

/*
 * This is an encapsulation of the stat() system call. The routine either
 * succeeds and returns or fails and raises the appropriate exception.
 */
void file_stat(char *path, struct stat *buf) {
	int status;			/* System call status */
	errno = 0;
#ifdef HAS_LSTAT
	status = lstat(path, buf);
	if (status == 0) {
		/* We found a file, not let's check if it is not a symbolic link,
		 * if it is the case, we need to call `stat' to make sure the link
		 * is valid. It is going to slow down current call by stating twice
		 * the info, but this case is quite rare and there is a benefit
		 * in using `lstat' over `stat' the first time as more than 90%
		 * of the files we stat are not symlink. */
		if ((buf->st_mode & S_IFLNK) == S_IFLNK) {
			status = stat(path, buf);
		}
	}
#else
	status = stat(path, buf);		/* Get file statistics */
#endif
	if (status == -1) {
			/* Raise exception */
		esys();
	}
}

/*
 * Change permissions of file `name', using an interface like chmod(1).
 * The flag is true if permissions are to be added, 0 to remove them.
 */
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
				eraise("invalid user permission", EN_EXT);
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
				eraise("invalid group permission", EN_EXT);
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
				eraise("invalid other permission", EN_EXT);
			}
		break;
	default:
		eraise("invalid permission target", EN_EXT);
	}
    file_chmod(name, fmode);
}

/*
 * Change permission mode on file `path'.
 */
void file_chmod(char *path, int mode) {
	errno = 0;
	if (chmod(path, mode) == -1) {
		esys();
	}
}

/*
 * Change the owner of the file to `uid'.
 */
void file_chown(char *name, int uid) {
#ifdef HAS_CHOWN
	int gid;
	struct stat buf;
	
	file_stat(name, &buf);
	gid = buf.st_gid;
	errno = 0;
	if (chown(name, uid, gid) == -1) {
		esys();
	}
#endif
}

/*
 * Change the group of the file to `gid'.
 */
void file_chgrp(char *name, int gid) {
#ifdef HAS_CHOWN
	int uid;
	struct stat buf;
	
	file_stat(name, &buf);
	uid = buf.st_uid;
	errno = 0;
	if (chown(name, uid, gid) == -1) {
		esys();
	}
#endif
}

/*
 * Put new_line onto `f'.
 */
void file_tnwl(FILE *f) {
	errno = 0;
	if (putc('\n', f) == EOF) {
		eise_io("FILE: unable to write new line.");
	}
}

/*
 * Append a copy of `other' to `f'.
 */
void file_append(FILE *f, FILE *other, EIF_INTEGER l) {
	size_t amount;
	char buffer[512];
	int bufsize = 512;

	errno = 0;
	if (fseek(other, 0, SEEK_SET) != 0) {
		esys();
	}
	if (fseek(f, 0, SEEK_END) != 0) {
		esys();
	}
	while (l > 0) {
		amount = l;
		if (l < bufsize)
			amount = l;
		else
			amount = bufsize;
		if (amount != fread(buffer, sizeof(char), amount, other)) {
			eise_io("FILE: unable to read appended file.");
			break;
		}
		l -= amount;
		if (amount != fwrite(buffer, sizeof(char), amount, f)) {
			eise_io("FILE: unable to write appended file.");
			break;
		}
	}
}

/*
 * Write string `str' on `f'.
 */
void file_ps(FILE *f, char *str, EIF_INTEGER len) {
	errno = 0;
	if (len == 0) {
		/* Nothing to be done. */
	} else if (fwrite(str, sizeof(char) * len, 1, f) != 1) {
		eise_io("FILE: unable to write STRING object.");
	}
}

/*
 * Write character `c' on `f'.
 */
void file_pc(FILE *f, char c) {
	errno = 0;
	if (putc(c, f) == EOF) {
		eise_io("FILE: unable to write CHARACTER value.");
	}
}

/*
 * Go to absolute position `pos' counted from start.
 */
void file_go(FILE *f, EIF_INTEGER pos) {
	errno = 0;
	if (fseek(f, pos, SEEK_SET) != 0) {
		esys();
	}
	clearerr(f);
}

/*
 * Go to absolute position `pos' counted from end.
 */
void file_recede(FILE *f, EIF_INTEGER pos) {
	errno = 0;
	if (fseek(f, -pos, SEEK_END) != 0) {
		esys();
	}
	clearerr(f);
}

/*
 * Go to absolute position `pos' counted from current position.
 */
void file_move(FILE *f, EIF_INTEGER pos) {
	errno = 0;
	if (fseek(f, pos, SEEK_CUR) != 0) {
		esys();
	}
	clearerr(f);
}

/*
 * End of file.
 */
EIF_BOOLEAN file_feof(FILE *fp) {
	return (EIF_BOOLEAN)(feof(fp) != 0);
}

/*
 * Test whether file exists or not. If `name' represents a symbolic link,
 * it will check that pointed file does exist.
 */
EIF_BOOLEAN file_exists(char *name) {
	int status;					/* System call status */
	struct stat buf;
#ifdef HAS_LSTAT
	status = lstat(name, &buf);	/* Attempt to stat file */
	if (status == 0) {
		/* We found a file, not let's check if it is not a symbolic link,
		 * if it is the case, we need to call `stat' to make sure the link
		 * is valid. */
		if ((buf.st_mode & S_IFLNK) == S_IFLNK) {
			status = stat(name, &buf);
		}
	}
#else
	status = stat (name, &buf);
#endif
	return ((status == -1) ? EIF_FALSE : EIF_TRUE);
}

/*
 * Test whether file exists or not without following the symbolic link
 * if `name' represents one.
 */
EIF_BOOLEAN file_path_exists(char *name) {
	struct stat buf;
#ifdef HAS_LSTAT
	return ((lstat(name, &buf) == -1) ? EIF_FALSE : EIF_TRUE);
#else
	return ((stat(name, &buf) == -1) ? EIF_FALSE : EIF_TRUE);
#endif
}

/*
 * Check whether access permission `op' are possible on file `name' using
 * real UID and real GID. This is probably only useful to setuid or setgid
 * programs.
 */
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

/*
 * Check whether the file `path' may be created: we need write permissions
 * in the parent directory and there must not be any file bearing that name
 * with no write permissions...
 */
EIF_BOOLEAN file_creatable(char *path, EIF_INTEGER length) {
	struct stat buf;
	char *temp = NULL;
	char *ptr;
	size_t n;

#ifdef EIF_WINDOWS
	ptr = strrchr(path, '\\');
#else
	ptr = strrchr(path, '/');
#endif
	if (ptr != (char *) 0) {
		n = ptr - path;
#ifdef EIF_WINDOWS
		if ((ptr == path) || (*(ptr-1) == ':'))
				/* path is of the form a:\bbb or \bbb, parent is a:\ or \ */
			n = n + 1;
#endif
		temp = (char*)malloc(n + 1);
		strncpy(temp, path, n);
		temp[n] = '\0';
	} else {
		temp = (char*)malloc(2);
		temp[0] = '.';
		temp[1] = '\0';
	}

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

/*
 * Swallow next character if it is a new line.
 */
static void swallow_nl(FILE *f) {
	if (f != stdin) {
			/* getc() cannot be used as it doesn't set the EOF flag */
		fscanf (f, "\n");
	} else {
		int c;
		errno = 0;
		c = getc(f);
		if (c == EOF && ferror(f)) {
			eise_io("FILE: error during reading the end of the file.");
		} else if (c != '\n' && EOF == ungetc(c, f)) {
			eise_io("FILE: End of file.");
		}
	}
}

/*
 * Get an integer from `f'.
 */
EIF_INTEGER file_gi(FILE *f) {
	EIF_INTEGER i;     

	errno = 0;
	if (fscanf(f, "%d", &i) < 0) {
		eise_io("FILE: unable to read INTEGER value.");
	}
	swallow_nl(f);
	return i;
}

/*
 * Get a real from `f'.
 */
EIF_REAL_32 file_gr(FILE *f) {
	EIF_REAL_32 r;     
	errno = 0;
	if (fscanf(f, "%f", &r) < 0) {
		eise_io("FILE: unable to read REAL value.");
	}
	swallow_nl(f);
	return r;
}

/*
 * Get a double from `f'.
 */
EIF_REAL_64 file_gd(FILE *f) {
	EIF_REAL_64 d;     
	errno = 0;
	if (fscanf(f, "%lf", &d) < 0) {
		eise_io("FILE: unable to read DOUBLE value.");
	}
	swallow_nl(f);
	return d;
}

/*
 * Write `number' on `f'.
 */
void file_pi(FILE *f, EIF_INTEGER number) {
	errno = 0;
	if (fprintf(f, "%d", number) < 0) {
		eise_io("FILE: unable to write INTEGER value.");
	}
}

/*
 * Write `number' on `f'.
 */
void file_pr(FILE *f, EIF_REAL_32 number) {
	errno = 0;
    if (0 > fprintf (f, "%g", number) < 0) {
		eise_io("FILE: unable to write REAL value.");
	}
}

/*
 * Write double `val' onto `f'.
 */
void file_pd(FILE *f, EIF_REAL_64 val) {
	errno = 0;
	if (fprintf(f, "%.17g", val) < 0) {
		eise_io("FILE: unable to write DOUBLE value.");
	}
}

/*
 * Size of the stat structure. This is used by the Eiffel side to create
 * the area (special object) which will play the role of a stat buffer
 * structure.
 */
EIF_INTEGER stat_size(void) {
	return (EIF_INTEGER)sizeof(struct stat);
}

#ifdef HAS_GETGROUPS
/*
 * Does the list of groups the user belongs to include `gid'?
 */
static EIF_BOOLEAN eif_group_in_list(int gid) {
	Groups_t *group_list;
	int i, nb_groups, nb_groups_max;

	nb_groups_max = getgroups(0, (Groups_t *)0);
	if (nb_groups_max <= 0) {
		return EIF_FALSE;
	} else {
		group_list = (Groups_t *)malloc(nb_groups_max * sizeof(Groups_t));
		if (group_list == (Groups_t *)0) {
			xraise(EN_IO);
			return EIF_FALSE;
		} else if ((nb_groups = getgroups(nb_groups_max, group_list)) == -1) {
			free(group_list);
			xraise(EN_IO);
			return EIF_FALSE;
		} else {
			for (i=0; i< nb_groups; i++)
				if (group_list[i] == gid) {
					free(group_list);
					return EIF_TRUE;
				}
			free(group_list);
			return EIF_FALSE;
		}
	}
}
#endif

/*
 * Check file permissions using effective UID and effective GID. The
 * current permission mode is held in the st_mode field of the stat()
 * buffer structure `buf'.
 */
EIF_BOOLEAN file_eaccess(struct stat *buf, int op) {
	int mode = buf->st_mode & ST_MODE;	/* Current mode */
#ifdef HAS_GETEUID
	int uid = buf->st_uid;				/* File owner */
	int gid = buf->st_gid;				/* File group */
	int euid, egid;						/* Effective user and group */
#endif

    switch (op) {
	case 0: /* Is file readable */
#ifdef EIF_WINDOWS
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
#ifdef HAS_GETGROUPS
		else if (eif_group_in_list(gid))
			return ((mode & S_IRGRP) ? EIF_TRUE : EIF_FALSE);
#endif
		else
#endif
			return ((mode & S_IROTH) ? EIF_TRUE : EIF_FALSE);
	case 1: /* Is file writable */
#ifdef EIF_WINDOWS
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
#ifdef HAS_GETGROUPS
		else if (eif_group_in_list(gid))
			return ((mode & S_IWGRP) ? EIF_TRUE : EIF_FALSE);
#endif
		else
#endif
			return ((mode & S_IWOTH) ? EIF_TRUE : EIF_FALSE);
	case 2: /* Is file executable */
#ifdef EIF_WINDOWS
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
#ifdef HAS_GETGROUPS
		else if (eif_group_in_list(gid))
			return ((mode & S_IXGRP) ? EIF_TRUE : EIF_FALSE);
#endif
		else
#endif
			return ((mode & S_IXOTH) ? EIF_TRUE : EIF_FALSE);
	case 3: /* Is file setuid */
#ifdef EIF_WINDOWS
		return EIF_FALSE;
#else
		return ((mode & S_ISUID) ? EIF_TRUE : EIF_FALSE);
#endif
	case 4: /* Is file setgid */
#ifdef EIF_WINDOWS
		return EIF_FALSE;
#else
		return ((mode & S_ISGID) ? EIF_TRUE : EIF_FALSE);
#endif
	case 5: /* Is file sticky */
#ifdef EIF_WINDOWS
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
		return EIF_FALSE;
	}
}

/*
 * Perform the field dereferencing from the appropriate stat structure,
 * which Eiffel cannot do directly.
 */
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
		else
			return (EIF_INTEGER)0;
	case 14: /* Is file a device */
		if (buf->st_mode & S_IFCHR)
			return (EIF_INTEGER)S_IFCHR;
		else if (buf->st_mode & S_IFBLK)
			return (EIF_INTEGER)S_IFBLK;
		else
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
		return (EIF_INTEGER)0;
    }
}

/*
 * Return the Eiffel string filled in with the name associated with `uid'
 * if found in /etc/passwd. Otherwise, return fill it in with the numeric
 * value.
 */
EIF_REFERENCE file_owner(int uid) {
	char buf[NAME_MAX];
	char* str;
#ifdef HAS_GETPWUID
	struct passwd *pp;

	pp = getpwuid(uid);
	if (pp == (struct passwd *)0) {
		snprintf(buf, NAME_MAX, "%d", uid);
		str = buf;
	} else {
		str = pp->pw_name;
	}
#else
	snprintf(buf, NAME_MAX, "%d", uid);
	str = buf;
#endif
	return GE_ms8(str, strlen(str));
}

/*
 * Return the Eiffel string filled in with the name associated with `gid'
 * if found in /etc/group. Otherwise, return fill it in with the numeric
 * value.
 */
EIF_REFERENCE file_group(int gid) {
	char buf[NAME_MAX];
	char* str;
#ifdef HAS_GETGRGID
	struct group *gp;

	gp = getgrgid(gid);
	if (gp == (struct group *)0) {
		snprintf(buf, NAME_MAX, "%d", gid);
		str = buf;
	} else {
		str = gp->gr_name;
	}
#else
	snprintf(buf, NAME_MAX, "%d", gid);
	str = buf;
#endif
	return GE_ms8(str, strlen(str));
}

/*
 * Get an integer from `f'.
 */
EIF_INTEGER file_gib(FILE* f) {
	EIF_INTEGER i;     
	errno = 0;
	if (fread (&i, sizeof (EIF_INTEGER), 1, f) != 1) {
		eise_io("FILE: unable to read INTEGER value.");
	}
	return i;
}

/*
 * Get a real from `f'.
 */
EIF_REAL_32 file_grb(FILE* f) {
	EIF_REAL_32 r;     
	errno = 0;
	if (fread (&r, sizeof (EIF_REAL_32), 1, f) != 1) {
		eise_io("FILE: unable to read REAL value.");
	}
	return r;
}

/*
 * Get a double from `f'.
 */
EIF_REAL_64 file_gdb(FILE* f) {
	EIF_REAL_64 d;     
	errno = 0;
	if (fread (&d, sizeof(EIF_REAL_64), 1, f) != 1) {
		eise_io("FILE: unable to read DOUBLE value.");
	}
	return d;
}

/*
 * Open file `name' with the corresponding type `how'.
 */
EIF_POINTER file_binary_open(char* name, int how) {
	FILE *fp;
	errno = 0;
	if (how < 10) {
		fp = (FILE *)fopen(name, file_open_mode(how + 10));
	} else {
		fp = (FILE *)fopen(name, file_open_mode(how));
	}
	if (fp == (FILE *)0) {
		esys(); /* Open failed, raise exception */
	}
	return (EIF_POINTER)fp;

}

/*
 * Open file `fd' with the corresponding type `how'.
 */
EIF_POINTER file_binary_dopen(int fd, int how) {
	FILE *fp;
	errno = 0;
	if (how < 10) {
		fp = (FILE *)fdopen(fd, file_open_mode(how + 10));
	} else {
		fp = (FILE *)fdopen(fd, file_open_mode(how));
	}
	if (fp == (FILE *)0) {
		esys(); /* Open failed, raise exception */
	}
	return (EIF_POINTER)fp;
}

/*
 * Reopen file `name' with the corresponding type `how' and substitute that
 * to the old stream described by `old'. This is useful to redirect 'stdout'
 * to another place, for instance.
 */
EIF_POINTER file_binary_reopen(char* name, int how, FILE* old) {
	FILE *fp;
	errno = 0;
	if (how < 10) {
		fp = (FILE *)freopen(name, file_open_mode(how + 10), old);
	 } else {
		fp = (FILE *)freopen(name, file_open_mode(how), old);
	}
	if (fp == (FILE *)0) {
		esys(); /* Open failed, raise exception */
	}
	return (EIF_POINTER)fp;
}

/*
 * Write `number' on `f'.
 */
void file_pib(FILE* f, EIF_INTEGER number) {
	errno = 0;
	if (fwrite(&number, sizeof(EIF_INTEGER),1, f) != 1) {
		eise_io("FILE: unable to write INTEGER value.");
	}
}

/*
 * Write `number' on `f'.
 */
void file_prb(FILE* f, EIF_REAL_32 number) {
	errno = 0;
    if (fwrite(&number, sizeof(EIF_REAL_32),1, f) != 1) {
		eise_io("FILE: unable to write REAL value.");
	}
}

/*
 * Write double `val' onto `f'.
 */
void file_pdb(FILE* f, EIF_REAL_64 val) {
	errno = 0;
	if (fwrite (&val, sizeof(EIF_REAL_64), 1, f) != 1) {
		eise_io("FILE: unable to write DOUBLE value.");
	}
}

#ifdef __cplusplus
}
#endif

#endif
#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to implement class CONSOLE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_CONSOLE_C
#define EIF_CONSOLE_C

#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

#define eif_show_console GE_show_console

EIF_POINTER console_def(EIF_INTEGER file) {
	switch (file) {
	case 0:
		return (EIF_POINTER)stdin;
	case 1:
		setvbuf(stdout, NULL, _IONBF, 0);
		return (EIF_POINTER)stdout;
	case 2:
		setvbuf (stderr, NULL, _IONBF, 0);
		return (EIF_POINTER)stderr;
	default:
		return NULL;
	}
}

EIF_BOOLEAN console_eof(FILE* fp) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return file_feof(fp);
}

EIF_CHARACTER console_separator(FILE *f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return file_lh(f);
}

void console_ps(FILE* f, char* str, EIF_INTEGER len) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	file_ps(f, str, len);
}

void console_pr(FILE* f, EIF_REAL_32 number) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	file_pr(f, number);
}

void console_pc(FILE* f, EIF_CHARACTER c) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	file_pc(f, c);
}

void console_pd(FILE* f, EIF_REAL_64 val) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	file_pd(f, val);
}

void console_pi(FILE* f, EIF_INTEGER number) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	file_pi(f, number);
}

void console_tnwl(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	console_pc(f,'\n');
}

EIF_CHARACTER console_readchar(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return file_gc(f);
}

EIF_REAL_32 console_readreal(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return file_gr(f);
}

EIF_INTEGER console_readint(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return file_gi(f);
}

EIF_REAL_64 console_readdouble(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return file_gd(f);
}

EIF_INTEGER console_readword(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return file_gw(f, s, bound, start);
}

EIF_INTEGER console_readline(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return file_gs(f, s, bound, start);
}

void console_next_line(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	file_tnil(f);
}

EIF_INTEGER console_readstream(FILE* f, char* s, EIF_INTEGER bound) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return file_gss(f, s, bound);
}

void console_file_close (FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	file_close(f);
}

#ifdef __cplusplus
}
#endif

#endif
#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to access DLLs"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_DLL_C
#define GE_DLL_C

#endif

#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to implement class EXECUTION_ENVIRONMENT"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_MISC_C
#define EIF_MISC_C

#include <stdlib.h>
#ifdef WIN32
#include <windows.h>
#include <string.h>
#include <direct.h> /* for 'getcwd' */
#endif

#ifndef PATH_MAX
#define PATH_MAX 1024 /* Maximum length of full path name */
#endif

#ifdef __cplusplus
extern "C" {
#endif

EIF_INTEGER eif_system(char* s) {
	return (EIF_INTEGER)system(s);
}

void eif_system_asynchronous(char* cmd) {
#ifdef WIN32
	STARTUPINFO siStartInfo;
	PROCESS_INFORMATION procinfo;
	char* current_dir;
	EIF_INTEGER result;

	current_dir = (char*)getcwd(NULL, PATH_MAX);
	memset(&siStartInfo, 0, sizeof(STARTUPINFO));
	siStartInfo.cb = sizeof(STARTUPINFO);
	siStartInfo.lpTitle = NULL;
	siStartInfo.lpReserved = NULL;
	siStartInfo.lpReserved2 = NULL;
	siStartInfo.cbReserved2 = 0;
	siStartInfo.lpDesktop = NULL;
	siStartInfo.dwFlags = STARTF_FORCEONFEEDBACK;
	result = CreateProcessA(
		NULL,
		cmd,
		NULL,
		NULL,
		TRUE,
		CREATE_NEW_CONSOLE,
		NULL,
		current_dir,
		&siStartInfo,
		&procinfo);
	if (result) {
		CloseHandle(procinfo.hProcess);
		CloseHandle(procinfo.hThread);
	}
	chdir(current_dir);
	free(current_dir);
#else
	int status;

	switch (fork()) {
	case -1:
		return;
	case 0:
		break;
	default:
		return;
	}
	status = system(cmd);
	exit(0);
#endif
}

void eif_sleep(EIF_INTEGER_64 nanoseconds)
{
	/*
	 * Suspend thread execution for interval specified by `nanoseconds'.
	 * Use the most precise sleep function if possible.
	 */

#ifdef HAS_NANOSLEEP
	struct timespec req;
	struct timespec rem;
	req.tv_sec = nanoseconds / 1000000000;
	req.tv_nsec = nanoseconds % 1000000000;
	while ((nanosleep (&req, &rem) == -1) && (errno == EINTR)) {
			/* Function is interrupted by a signal.   */
			/* Let's call it again to complete pause. */
		req = rem;
	}
#else
#	ifdef HAS_USLEEP
#		define EIF_SLEEP_PRECISION 1000
#		define EIF_SLEEP_TYPE      unsigned long
#		define EIF_SLEEP_FUNCTION  usleep
#	elif defined EIF_WINDOWS
#		define EIF_SLEEP_PRECISION 1000000
#		define EIF_SLEEP_TYPE      DWORD
#		define EIF_SLEEP_FUNCTION  Sleep
#	else
#		define EIF_SLEEP_PRECISION 1000000000
#		define EIF_SLEEP_TYPE      unsigned int
#		define EIF_SLEEP_FUNCTION  sleep
#	endif
		/* Set total delay time */
	EIF_INTEGER_64 total_time = nanoseconds / EIF_SLEEP_PRECISION;
		/* Set maximum timeout that can be handled by one API call */
	EIF_SLEEP_TYPE timeout = ~((~ (EIF_SLEEP_TYPE) 0) << (sizeof timeout * 8 - 1));
	if ((nanoseconds % EIF_SLEEP_PRECISION) > 0) {
			/* Increase delay to handle underflow */
		total_time++;
	}
	while (total_time > 0) {
			/* Sleep for maximum timeout not exceeding time left */
		if (timeout > total_time) {
			timeout = (EIF_SLEEP_TYPE) total_time;
		}
		EIF_SLEEP_FUNCTION(timeout);
		total_time -= timeout;
	}
#  undef EIF_SLEEP_PRECISION
#  undef EIF_SLEEP_TYPE
#  undef EIF_SLEEP_FUNCTION
#endif
}

#ifdef __cplusplus
}
#endif

#endif
#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to implement class DIRECTORY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_DIR_C
#define EIF_DIR_C

#ifdef WIN32
#ifdef __cplusplus
extern "C" {
#endif
typedef struct {
	HANDLE handle;
	WIN32_FIND_DATA data;
	char *pattern;
} GE_directory;
#ifdef __cplusplus
}
#endif
#include <io.h> /* for 'access' */
#include <direct.h> /* (ch|rm)dir */
#else
#include <dirent.h>
#include <unistd.h>
#endif
#include <sys/stat.h>
#include <string.h>

#ifndef PATH_MAX
#define PATH_MAX 1024 /* Maximum length of full path name */
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

/* Keep only permission mode */
#ifndef ST_MODE
#define ST_MODE 0x0fff
#endif

#ifdef __cplusplus
extern "C" {
#endif

void* dir_open(char* dirname) {
#ifdef WIN32
	int len = strlen((char*)dirname);
	char* pattern = (char*)malloc(len + 5);
	GE_directory* result = (GE_directory*)malloc(sizeof(GE_directory));

	pattern = strncpy(pattern, (char*)dirname, len);
	if (pattern[len - 1] != '\\')
		pattern[len++] = '\\';
	pattern[len++] = '*';
	pattern[len++] = '.';
	pattern[len++] = '*';
	pattern[len++] = '\0';
	result->pattern = pattern;
	result->handle = 0;
	return result;
#else
	return (opendir(((char*)dirname)));
#endif
}

EIF_REFERENCE dir_next(void* dir) {
#ifdef WIN32
	GE_directory* GE_dir = (GE_directory*)dir;
	HANDLE h = GE_dir->handle;

	if (h) {
		if (FindNextFileA(h, &(GE_dir->data))) {
			char* s = GE_dir->data.cFileName;
			return GE_ms8(s,strlen(s));
		} else {
			return EIF_VOID;
		}
	} else {
		h = FindFirstFileA(GE_dir->pattern, &(GE_dir->data));
		if (h == INVALID_HANDLE_VALUE) {
			return EIF_VOID;
		} else {
			char* s = GE_dir->data.cFileName;
			GE_dir->handle = h;
			return GE_ms8(s,strlen(s));
		}
	}
#else
	struct dirent* p = readdir((DIR*)dir);
	if (p) {
		char* s = p->d_name;
		return GE_ms8(s,strlen(s));
	} else {
		return EIF_VOID;
	}
#endif
}

void dir_rewind(void* dir) {
#ifdef WIN32
	GE_directory* GE_dir = (GE_directory*)dir;
	HANDLE h = GE_dir->handle;

	if (h) {
		FindClose(h);
	}
	GE_dir->handle = 0;
#else
	DIR* GE_dir = (DIR*)dir;
	rewinddir(GE_dir);
#endif
}

void dir_close(void* dir) {
#ifdef WIN32
	GE_directory* GE_dir = (GE_directory*)dir;
	HANDLE h = GE_dir->handle;

	if (h) {
		FindClose(h);
	}
	free(GE_dir->pattern);
	free(GE_dir);
#else
	closedir((DIR*)dir);
#endif
}

EIF_BOOLEAN eif_dir_exists(char* dirname) {
	struct stat buf;

	if (stat(dirname, &buf) == -1) {
		return EIF_FALSE;
	} else {
		return ((buf.st_mode & S_IFDIR) ? EIF_TRUE : EIF_FALSE);
	}
}

EIF_BOOLEAN eif_dir_is_readable(char* dirname) {
#ifdef WIN32
	return (EIF_BOOLEAN)(access(dirname, 04) != -1);
#else
	int uid, gid;
	int euid, egid;
	int mode;
	struct stat buf;

	stat(dirname, &buf);
	mode = buf.st_mode & ST_MODE;
	uid = buf.st_uid;
	gid = buf.st_gid;
	euid = geteuid();
	egid = getegid();
	if (euid == 0)
		return EIF_TRUE;
	else if (uid == euid)
		return ((mode & S_IRUSR) ? EIF_TRUE : EIF_FALSE);
	else if (gid == egid)
		return ((mode & S_IRGRP) ? EIF_TRUE : EIF_FALSE);
	else
		return ((mode & S_IROTH) ? EIF_TRUE : EIF_FALSE);
#endif
}

EIF_BOOLEAN eif_dir_is_executable(char* dirname) {
#ifdef WIN32
	return (EIF_BOOLEAN) (access (dirname, 0) != -1);
#else
	int uid, gid;
	int euid, egid;
	int mode;
	struct stat buf;

	stat(dirname, &buf);
	mode = buf.st_mode & ST_MODE;
	uid = buf.st_uid;
	gid = buf.st_gid;
	euid = geteuid();
	egid = getegid();
	if (euid == 0)
		return EIF_TRUE;
	else if (uid == euid)
		return ((mode & S_IXUSR) ? EIF_TRUE : EIF_FALSE);
	else if (gid == egid)
		return ((mode & S_IXGRP) ? EIF_TRUE : EIF_FALSE);
	else
		return ((mode & S_IXOTH) ? EIF_TRUE : EIF_FALSE);
#endif
}

EIF_BOOLEAN eif_dir_is_writable(char* dirname) {
#ifdef WIN32
	return (EIF_BOOLEAN) (access (dirname, 02) != -1);
#else
	int uid, gid;
	int euid, egid;
	int mode;
	struct stat buf;

	stat(dirname, &buf);
	mode = buf.st_mode & ST_MODE;
	uid = buf.st_uid;
	gid = buf.st_gid;
	euid = geteuid();
	egid = getegid();
	if (euid == 0)
		return EIF_TRUE;
	else if (uid == euid)
		return ((mode & S_IWUSR) ? EIF_TRUE : EIF_FALSE);
	else if (gid == egid)
		return ((mode & S_IWGRP) ? EIF_TRUE : EIF_FALSE);
	else
		return ((mode & S_IWOTH) ? EIF_TRUE : EIF_FALSE);
#endif
}

void eif_dir_delete(char* dirname) {
	rmdir(dirname);
}

EIF_CHARACTER eif_dir_separator(void) {
#ifdef WIN32
	return (EIF_CHARACTER)'\\';
#else
	return (EIF_CHARACTER)'/';
#endif
}

EIF_REFERENCE dir_current(void) {
	char* s;
	EIF_REFERENCE result;

	s = (char*)getcwd(NULL, PATH_MAX);
	result = GE_ms8(s, strlen(s));
	free(s);
	return result;
}

EIF_INTEGER eif_chdir(char* path) {
	return chdir(path);
}

#ifdef __cplusplus
}
#endif

#endif
#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to implement the main function"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_MAIN_C
#define EIF_MAIN_C

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS

/*
	Used in WEL.
*/
HINSTANCE eif_hInstance;

#endif

/*
	Used by the ISE runtime to figure out whether the application
	was launched from EiffelStudio in workbench mode or not.
*/
int debug_mode = 0; /* Assume not in debug mode */

#ifdef __cplusplus
}
#endif

#endif
#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
