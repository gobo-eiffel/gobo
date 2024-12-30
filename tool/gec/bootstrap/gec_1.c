#include "gec.h"

#ifdef __cplusplus
extern "C" {
#endif

T0* GE_boxed1(TC* ac, T1 a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb1));
	((T0*)(R))->id = 1;
	((Tb1*)(R))->p1 = &(((Tb1*)(R))->z1);
	((Tb1*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed_pointer1(TC* ac, volatile T1* a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb1));
	((T0*)(R))->id = 1;
	((Tb1*)(R))->p1 = (T1*)a1;
	((Tb1*)(R))->z1 = *(T1*)a1;
	return R;
}

T0* GE_boxed2(TC* ac, T2 a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb2));
	((T0*)(R))->id = 2;
	((Tb2*)(R))->p1 = &(((Tb2*)(R))->z1);
	((Tb2*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed_pointer2(TC* ac, volatile T2* a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb2));
	((T0*)(R))->id = 2;
	((Tb2*)(R))->p1 = (T2*)a1;
	((Tb2*)(R))->z1 = *(T2*)a1;
	return R;
}

T0* GE_boxed3(TC* ac, T3 a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb3));
	((T0*)(R))->id = 3;
	((Tb3*)(R))->p1 = &(((Tb3*)(R))->z1);
	((Tb3*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed_pointer3(TC* ac, volatile T3* a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb3));
	((T0*)(R))->id = 3;
	((Tb3*)(R))->p1 = (T3*)a1;
	((Tb3*)(R))->z1 = *(T3*)a1;
	return R;
}

T0* GE_boxed4(TC* ac, T4 a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb4));
	((T0*)(R))->id = 4;
	((Tb4*)(R))->p1 = &(((Tb4*)(R))->z1);
	((Tb4*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed_pointer4(TC* ac, volatile T4* a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb4));
	((T0*)(R))->id = 4;
	((Tb4*)(R))->p1 = (T4*)a1;
	((Tb4*)(R))->z1 = *(T4*)a1;
	return R;
}

T0* GE_boxed5(TC* ac, T5 a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb5));
	((T0*)(R))->id = 5;
	((Tb5*)(R))->p1 = &(((Tb5*)(R))->z1);
	((Tb5*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed_pointer5(TC* ac, volatile T5* a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb5));
	((T0*)(R))->id = 5;
	((Tb5*)(R))->p1 = (T5*)a1;
	((Tb5*)(R))->z1 = *(T5*)a1;
	return R;
}

T0* GE_boxed6(TC* ac, T6 a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb6));
	((T0*)(R))->id = 6;
	((Tb6*)(R))->p1 = &(((Tb6*)(R))->z1);
	((Tb6*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed_pointer6(TC* ac, volatile T6* a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb6));
	((T0*)(R))->id = 6;
	((Tb6*)(R))->p1 = (T6*)a1;
	((Tb6*)(R))->z1 = *(T6*)a1;
	return R;
}

T0* GE_boxed7(TC* ac, T7 a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb7));
	((T0*)(R))->id = 7;
	((Tb7*)(R))->p1 = &(((Tb7*)(R))->z1);
	((Tb7*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed_pointer7(TC* ac, volatile T7* a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb7));
	((T0*)(R))->id = 7;
	((Tb7*)(R))->p1 = (T7*)a1;
	((Tb7*)(R))->z1 = *(T7*)a1;
	return R;
}

T0* GE_boxed8(TC* ac, T8 a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb8));
	((T0*)(R))->id = 8;
	((Tb8*)(R))->p1 = &(((Tb8*)(R))->z1);
	((Tb8*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed_pointer8(TC* ac, volatile T8* a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb8));
	((T0*)(R))->id = 8;
	((Tb8*)(R))->p1 = (T8*)a1;
	((Tb8*)(R))->z1 = *(T8*)a1;
	return R;
}

T0* GE_boxed9(TC* ac, T9 a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb9));
	((T0*)(R))->id = 9;
	((Tb9*)(R))->p1 = &(((Tb9*)(R))->z1);
	((Tb9*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed_pointer9(TC* ac, volatile T9* a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb9));
	((T0*)(R))->id = 9;
	((Tb9*)(R))->p1 = (T9*)a1;
	((Tb9*)(R))->z1 = *(T9*)a1;
	return R;
}

T0* GE_boxed10(TC* ac, T10 a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb10));
	((T0*)(R))->id = 10;
	((Tb10*)(R))->p1 = &(((Tb10*)(R))->z1);
	((Tb10*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed_pointer10(TC* ac, volatile T10* a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb10));
	((T0*)(R))->id = 10;
	((Tb10*)(R))->p1 = (T10*)a1;
	((Tb10*)(R))->z1 = *(T10*)a1;
	return R;
}

T0* GE_boxed11(TC* ac, T11 a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb11));
	((T0*)(R))->id = 11;
	((Tb11*)(R))->p1 = &(((Tb11*)(R))->z1);
	((Tb11*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed_pointer11(TC* ac, volatile T11* a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb11));
	((T0*)(R))->id = 11;
	((Tb11*)(R))->p1 = (T11*)a1;
	((Tb11*)(R))->z1 = *(T11*)a1;
	return R;
}

T0* GE_boxed12(TC* ac, T12 a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb12));
	((T0*)(R))->id = 12;
	((Tb12*)(R))->p1 = &(((Tb12*)(R))->z1);
	((Tb12*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed_pointer12(TC* ac, volatile T12* a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb12));
	((T0*)(R))->id = 12;
	((Tb12*)(R))->p1 = (T12*)a1;
	((Tb12*)(R))->z1 = *(T12*)a1;
	return R;
}

T0* GE_boxed13(TC* ac, T13 a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb13));
	((T0*)(R))->id = 13;
	((Tb13*)(R))->p1 = &(((Tb13*)(R))->z1);
	((Tb13*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed_pointer13(TC* ac, volatile T13* a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb13));
	((T0*)(R))->id = 13;
	((Tb13*)(R))->p1 = (T13*)a1;
	((Tb13*)(R))->z1 = *(T13*)a1;
	return R;
}

T0* GE_boxed14(TC* ac, T14 a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb14));
	((T0*)(R))->id = 14;
	((Tb14*)(R))->p1 = &(((Tb14*)(R))->z1);
	((Tb14*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed_pointer14(TC* ac, volatile T14* a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb14));
	((T0*)(R))->id = 14;
	((Tb14*)(R))->p1 = (T14*)a1;
	((Tb14*)(R))->z1 = *(T14*)a1;
	return R;
}

T0* GE_boxed40(TC* ac, T40 a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb40));
	((T0*)(R))->id = 40;
	((Tb40*)(R))->p1 = &(((Tb40*)(R))->z1);
	((Tb40*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed_pointer40(TC* ac, T40* a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb40));
	((T0*)(R))->id = 40;
	((Tb40*)(R))->p1 = (T40*)a1;
	((Tb40*)(R))->z1 = *(T40*)a1;
	return R;
}

T0* GE_boxed1076(TC* ac, T1076 a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb1076));
	((T0*)(R))->id = 1076;
	((Tb1076*)(R))->p1 = &(((Tb1076*)(R))->z1);
	((Tb1076*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed_pointer1076(TC* ac, T1076* a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb1076));
	((T0*)(R))->id = 1076;
	((Tb1076*)(R))->p1 = (T1076*)a1;
	((Tb1076*)(R))->z1 = *(T1076*)a1;
	return R;
}

T0* GE_boxed1447(TC* ac, T1447 a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb1447));
	((T0*)(R))->id = 1447;
	((Tb1447*)(R))->p1 = &(((Tb1447*)(R))->z1);
	((Tb1447*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed_pointer1447(TC* ac, T1447* a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb1447));
	((T0*)(R))->id = 1447;
	((Tb1447*)(R))->p1 = (T1447*)a1;
	((Tb1447*)(R))->z1 = *(T1447*)a1;
	return R;
}

T0* GE_boxed1566(TC* ac, T1566 a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb1566));
	((T0*)(R))->id = 1566;
	((Tb1566*)(R))->p1 = &(((Tb1566*)(R))->z1);
	((Tb1566*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed_pointer1566(TC* ac, T1566* a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb1566));
	((T0*)(R))->id = 1566;
	((Tb1566*)(R))->p1 = (T1566*)a1;
	((Tb1566*)(R))->z1 = *(T1566*)a1;
	return R;
}

T0* GE_boxed1567(TC* ac, T1567 a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb1567));
	((T0*)(R))->id = 1567;
	((Tb1567*)(R))->p1 = &(((Tb1567*)(R))->z1);
	((Tb1567*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed_pointer1567(TC* ac, T1567* a1)
{
	T0* R;
	R = (T0*)GE_calloc(1, sizeof(Tb1567));
	((T0*)(R))->id = 1567;
	((Tb1567*)(R))->p1 = (T1567*)a1;
	((Tb1567*)(R))->z1 = *(T1567*)a1;
	return R;
}

T40 GE_default40 = {0};
T1076 GE_default1076 = {0};
T1447 GE_default1447 = {0};
T1566 GE_default1566 = {0};
T1567 GE_default1567 = {0};

T0* GE_new_str8(T6 c)
{
	T0* R;
	TC* ac = GE_current_context();
	T0* t1;
	t1 = GE_new15(ac, c+1, EIF_TRUE);
	R = GE_new17(ac, EIF_TRUE);
	((T17*)(R))->a1 = t1;
	return R;
}

T0* GE_new_str32(T6 c)
{
	T0* R;
	TC* ac = GE_current_context();
	T0* t1;
	t1 = GE_new16(ac, c+1, EIF_TRUE);
	R = GE_new18(ac, EIF_TRUE);
	((T18*)(R))->a1 = t1;
	return R;
}

T0* GE_new_istr8(T6 c)
{
	T0* R;
	TC* ac = GE_current_context();
	R = EIF_VOID;
	return R;
}

T0* GE_new_istr32(T6 c)
{
	T0* R;
	TC* ac = GE_current_context();
	T0* t1;
	t1 = GE_new16(ac, c+1, EIF_TRUE);
	R = GE_new20(ac, EIF_TRUE);
	((T20*)(R))->a1 = t1;
	return R;
}

T14 GE_sp8_base_address(T0* a1)
{
	return (T14)(((T15*)(a1))->z2);
}

T14 GE_sp32_base_address(T0* a1)
{
	return (T14)(((T16*)(a1))->z2);
}

/* New instance of type SPECIAL [CHARACTER_8] */
T0* GE_new15(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T15)+a1*sizeof(T2);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 15;
		((T15*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type SPECIAL [CHARACTER_32] */
T0* GE_new16(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T16)+a1*sizeof(T3);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 16;
		((T16*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type STRING_8 */
T0* GE_new17(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T17);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 17;
	}
	return R;
}

/* New instance of type STRING_32 */
T0* GE_new18(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T18);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 18;
	}
	return R;
}

/* New instance of type IMMUTABLE_STRING_32 */
T0* GE_new20(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T20);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 20;
	}
	return R;
}

/* New instance of type ISE_EXCEPTION_MANAGER */
T0* GE_new21(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T21);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 21;
	}
	return R;
}

/* New instance of type GEC */
T0* GE_new26(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T26);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 26;
	}
	return R;
}

/* New instance of type CELL [detachable EXCEPTION] */
T0* GE_new27(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T27);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 27;
	}
	return R;
}

/* New instance of type HASH_TABLE [INTEGER_32, INTEGER_32] */
T0* GE_new28(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T28);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 28;
	}
	return R;
}

/* New instance of type CELL [detachable TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, INTEGER_32, BOOLEAN]] */
T0* GE_new29(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T29);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 29;
	}
	return R;
}

/* New instance of type CELL [NO_MORE_MEMORY] */
T0* GE_new30(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T30);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 30;
	}
	return R;
}

/* New instance of type C_STRING */
T0* GE_new31(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T31);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 31;
	}
	return R;
}

/* New instance of type TUPLE [INTEGER_32, INTEGER_32, INTEGER_32, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, STRING_8, INTEGER_32, BOOLEAN] */
T0* GE_new32(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T32);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 32;
	}
	return R;
}

/* New instance of type KL_ARGUMENTS */
T0* GE_new33(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T33);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 33;
	}
	return R;
}

/* New instance of type ARRAY [STRING_8] */
T0* GE_new34(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T34);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 34;
	}
	return R;
}

/* New instance of type SPECIAL [STRING_8] */
T0* GE_new35(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T35)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 35;
		((T35*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_EXCEPTIONS */
T0* GE_new36(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T36);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 36;
	}
	return R;
}

/* New instance of type EXCEPTIONS */
T0* GE_new37(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T37);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 37;
	}
	return R;
}

/* New instance of type KL_STANDARD_FILES */
T0* GE_new38(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T38);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 38;
	}
	return R;
}

/* New instance of type KL_STDERR_FILE */
T0* GE_new39(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T39);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 39;
	}
	return R;
}

/* New instance of type ET_ERROR_HANDLER */
T0* GE_new42(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T42);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 42;
	}
	return R;
}

/* New instance of type KL_TEXT_INPUT_FILE */
T0* GE_new43(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T43);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 43;
	}
	GE_register_dispose(R,&T43f60);
	return R;
}

/* New instance of type UT_GOBO_VARIABLES */
T0* GE_new44(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T44);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 44;
	}
	return R;
}

/* New instance of type UT_ISE_VARIABLES */
T0* GE_new45(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T45);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 45;
	}
	return R;
}

/* New instance of type AP_FLAG */
T0* GE_new46(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T46);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 46;
	}
	return R;
}

/* New instance of type KL_EXECUTION_ENVIRONMENT */
T0* GE_new49(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T49);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 49;
	}
	return R;
}

/* New instance of type ET_SYSTEM */
T0* GE_new50(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T50);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 50;
	}
	return R;
}

/* New instance of type AP_PARSER */
T0* GE_new52(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T52);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 52;
	}
	return R;
}

/* New instance of type AP_ALTERNATIVE_OPTIONS_LIST */
T0* GE_new53(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T53);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 53;
	}
	return R;
}

/* New instance of type AP_STRING_OPTION */
T0* GE_new54(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T54);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 54;
	}
	return R;
}

/* New instance of type UT_VERSION */
T0* GE_new56(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T56);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 56;
	}
	return R;
}

/* New instance of type AP_ENUMERATION_OPTION */
T0* GE_new57(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T57);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 57;
	}
	return R;
}

/* New instance of type AP_BOOLEAN_OPTION */
T0* GE_new58(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T58);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 58;
	}
	return R;
}

/* New instance of type AP_INTEGER_OPTION */
T0* GE_new59(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T59);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 59;
	}
	return R;
}

/* New instance of type ET_NULL_ERROR_HANDLER */
T0* GE_new63(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T63);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 63;
	}
	return R;
}

/* New instance of type ET_AST_FACTORY */
T0* GE_new65(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T65);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 65;
	}
	return R;
}

/* New instance of type ET_SYSTEM_PROCESSOR */
T0* GE_new66(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T66);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 66;
	}
	return R;
}

/* New instance of type ET_CLUSTER */
T0* GE_new67(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T67);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 67;
	}
	return R;
}

/* New instance of type ET_EIFFEL_PARSER */
T0* GE_new68(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T68);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 68;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_CLASS] */
T0* GE_new69(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T69);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 69;
	}
	return R;
}

/* New instance of type ET_CLASS */
T0* GE_new70(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T70);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 70;
	}
	return R;
}

/* New instance of type TUPLE [ET_CLASS] */
T0* GE_new74(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T74);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 74;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_CLASS]] */
T0* GE_new75(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T75);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 75;
	}
	return R;
}

/* New instance of type TUPLE */
T0* GE_new76(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T76);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 76;
	}
	return R;
}

/* New instance of type TUPLE [DS_ARRAYED_LIST [ET_CLASS]] */
T0* GE_new77(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T77);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 77;
	}
	return R;
}

/* New instance of type PREDICATE [TUPLE [ET_CLASS]] */
T0* GE_new78(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T78);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 78;
	}
	return R;
}

/* New instance of type ET_CREATOR_LIST */
T0* GE_new80(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T80);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 80;
	}
	return R;
}

/* New instance of type ET_TOKEN_CONSTANTS */
T0* GE_new81(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T81);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 81;
	}
	return R;
}

/* New instance of type ET_CREATOR */
T0* GE_new82(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T82);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 82;
	}
	return R;
}

/* New instance of type UT_CANNOT_READ_FILE_ERROR */
T0* GE_new83(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T83);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 83;
	}
	return R;
}

/* New instance of type ET_ECF_SYSTEM_PARSER */
T0* GE_new85(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T85);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 85;
	}
	return R;
}

/* New instance of type ET_ECF_ERROR_HANDLER */
T0* GE_new86(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T86);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 86;
	}
	return R;
}

/* New instance of type ET_ECF_SYSTEM */
T0* GE_new87(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T87);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 87;
	}
	return R;
}

/* New instance of type ET_ECF_TARGET */
T0* GE_new88(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T88);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 88;
	}
	return R;
}

/* New instance of type ET_ECF_CLUSTER */
T0* GE_new89(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T89);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 89;
	}
	return R;
}

/* New instance of type ET_ECF_SETTINGS */
T0* GE_new90(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T90);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 90;
	}
	return R;
}

/* New instance of type ET_ECF_CAPABILITIES */
T0* GE_new91(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T91);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 91;
	}
	return R;
}

/* New instance of type ET_ECF_VARIABLES */
T0* GE_new92(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T92);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 92;
	}
	return R;
}

/* New instance of type ET_CLUSTERS */
T0* GE_new94(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T94);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 94;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_SYSTEM */
T0* GE_new95(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T95);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 95;
	}
	return R;
}

/* New instance of type DT_DATE_TIME */
T0* GE_new97(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T97);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 97;
	}
	return R;
}

/* New instance of type DS_HASH_SET [STRING_8] */
T0* GE_new99(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T99);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 99;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_PUSH_TYPE_SET_BUILDER */
T0* GE_new100(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T100);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 100;
	}
	return R;
}

/* New instance of type ET_CLASS_TYPE */
T0* GE_new102(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T102);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 102;
	}
	return R;
}

/* New instance of type UT_VERSION_NUMBER */
T0* GE_new103(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T103);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 103;
	}
	return R;
}

/* New instance of type EXECUTION_ENVIRONMENT */
T0* GE_new105(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T105);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 105;
	}
	return R;
}

/* New instance of type UT_MESSAGE */
T0* GE_new106(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T106);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 106;
	}
	return R;
}

/* New instance of type RX_PCRE_REGULAR_EXPRESSION */
T0* GE_new107(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T107);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 107;
	}
	return R;
}

/* New instance of type KL_STRING_ROUTINES */
T0* GE_new108(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T108);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 108;
	}
	return R;
}

/* New instance of type ST_SPLITTER */
T0* GE_new109(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T109);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 109;
	}
	return R;
}

/* New instance of type AP_ERROR */
T0* GE_new113(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T113);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 113;
	}
	return R;
}

/* New instance of type ET_C_GENERATOR */
T0* GE_new114(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T114);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 114;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_DYNAMIC_PRIMARY_TYPE] */
T0* GE_new116(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T116);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 116;
	}
	return R;
}

/* New instance of type KL_SHELL_COMMAND */
T0* GE_new117(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T117);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 117;
	}
	return R;
}

/* New instance of type GECC */
T0* GE_new118(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T118);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 118;
	}
	return R;
}

/* New instance of type KL_OPERATING_SYSTEM */
T0* GE_new119(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T119);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 119;
	}
	return R;
}

/* New instance of type VOID_TARGET */
T0* GE_new120(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T120);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 120;
	}
	return R;
}

/* New instance of type ROUTINE_FAILURE */
T0* GE_new122(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T122);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 122;
	}
	return R;
}

/* New instance of type OLD_VIOLATION */
T0* GE_new124(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T124);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 124;
	}
	return R;
}

/* New instance of type NO_MORE_MEMORY */
T0* GE_new126(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T126);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 126;
	}
	return R;
}

/* New instance of type INVARIANT_VIOLATION */
T0* GE_new127(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T127);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 127;
	}
	return R;
}

/* New instance of type OPERATING_SYSTEM_SIGNAL_FAILURE */
T0* GE_new128(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T128);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 128;
	}
	return R;
}

/* New instance of type IO_FAILURE */
T0* GE_new129(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T129);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 129;
	}
	return R;
}

/* New instance of type OPERATING_SYSTEM_FAILURE */
T0* GE_new130(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T130);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 130;
	}
	return R;
}

/* New instance of type COM_FAILURE */
T0* GE_new131(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T131);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 131;
	}
	return R;
}

/* New instance of type EIFFEL_RUNTIME_PANIC */
T0* GE_new132(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T132);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 132;
	}
	return R;
}

/* New instance of type PRECONDITION_VIOLATION */
T0* GE_new134(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T134);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 134;
	}
	return R;
}

/* New instance of type POSTCONDITION_VIOLATION */
T0* GE_new135(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T135);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 135;
	}
	return R;
}

/* New instance of type FLOATING_POINT_FAILURE */
T0* GE_new136(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T136);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 136;
	}
	return R;
}

/* New instance of type CHECK_VIOLATION */
T0* GE_new137(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T137);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 137;
	}
	return R;
}

/* New instance of type BAD_INSPECT_VALUE */
T0* GE_new138(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T138);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 138;
	}
	return R;
}

/* New instance of type VARIANT_VIOLATION */
T0* GE_new139(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T139);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 139;
	}
	return R;
}

/* New instance of type LOOP_INVARIANT_VIOLATION */
T0* GE_new140(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T140);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 140;
	}
	return R;
}

/* New instance of type RESCUE_FAILURE */
T0* GE_new141(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T141);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 141;
	}
	return R;
}

/* New instance of type RESUMPTION_FAILURE */
T0* GE_new142(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T142);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 142;
	}
	return R;
}

/* New instance of type CREATE_ON_DEFERRED */
T0* GE_new143(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T143);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 143;
	}
	return R;
}

/* New instance of type EXTERNAL_FAILURE */
T0* GE_new144(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T144);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 144;
	}
	return R;
}

/* New instance of type VOID_ASSIGNED_TO_EXPANDED */
T0* GE_new145(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T145);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 145;
	}
	return R;
}

/* New instance of type EXCEPTION_IN_SIGNAL_HANDLER_FAILURE */
T0* GE_new146(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T146);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 146;
	}
	return R;
}

/* New instance of type MISMATCH_FAILURE */
T0* GE_new147(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T147);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 147;
	}
	return R;
}

/* New instance of type DEVELOPER_EXCEPTION */
T0* GE_new148(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T148);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 148;
	}
	return R;
}

/* New instance of type ADDRESS_APPLIED_TO_MELTED_FEATURE */
T0* GE_new149(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T149);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 149;
	}
	return R;
}

/* New instance of type SERIALIZATION_FAILURE */
T0* GE_new150(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T150);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 150;
	}
	return R;
}

/* New instance of type KL_WINDOWS_FILE_SYSTEM */
T0* GE_new151(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T151);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 151;
	}
	return R;
}

/* New instance of type KL_UNIX_FILE_SYSTEM */
T0* GE_new152(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T152);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 152;
	}
	return R;
}

/* New instance of type PRIMES */
T0* GE_new153(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T153);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 153;
	}
	return R;
}

/* New instance of type SPECIAL [INTEGER_32] */
T0* GE_new154(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T154)+a1*sizeof(T6);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 154;
		((T154*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type SPECIAL [BOOLEAN] */
T0* GE_new155(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T155)+a1*sizeof(T1);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 155;
		((T155*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type ARGUMENTS_32 */
T0* GE_new156(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T156);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 156;
	}
	return R;
}

/* New instance of type MUTEX */
T0* GE_new159(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T159);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 159;
	}
	GE_register_dispose(R,&T159f9);
	return R;
}

/* New instance of type UT_ERROR_HANDLER */
T0* GE_new160(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T160);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 160;
	}
	return R;
}

/* New instance of type KL_STDOUT_FILE */
T0* GE_new161(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T161);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 161;
	}
	return R;
}

/* New instance of type MANAGED_POINTER */
T0* GE_new162(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T162);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 162;
	}
	GE_register_dispose(R,&T162f9);
	return R;
}

/* New instance of type KL_LINKABLE [CHARACTER_8] */
T0* GE_new164(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T164);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 164;
	}
	return R;
}

/* New instance of type FILE_INFO */
T0* GE_new166(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T166);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 166;
	}
	return R;
}

/* New instance of type KL_DIRECTORY */
T0* GE_new167(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T167);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 167;
	}
	GE_register_dispose(R,&T167f36);
	return R;
}

/* New instance of type UC_UTF8_ROUTINES */
T0* GE_new168(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T168);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 168;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [STRING_8] */
T0* GE_new170(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T170);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 170;
	}
	return R;
}

/* New instance of type TUPLE [ET_UNIVERSE] */
T0* GE_new171(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T171);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 171;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_UNIVERSE]] */
T0* GE_new172(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T172);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 172;
	}
	return R;
}

/* New instance of type TUPLE [PROCEDURE [TUPLE [ET_CLASS]], FUNCTION [TUPLE [ET_CLASS], BOOLEAN]] */
T0* GE_new173(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T173);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 173;
	}
	return R;
}

/* New instance of type ET_ADAPTED_LIBRARIES */
T0* GE_new174(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T174);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 174;
	}
	return R;
}

/* New instance of type ET_ADAPTED_DOTNET_ASSEMBLIES */
T0* GE_new175(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T175);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 175;
	}
	return R;
}

/* New instance of type ET_IMPLICIT_TYPE_MARK */
T0* GE_new177(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T177);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 177;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_MASTER_CLASS, ET_CLASS_NAME] */
T0* GE_new178(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T178);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 178;
	}
	return R;
}

/* New instance of type ET_CLASS_NAME_TESTER */
T0* GE_new179(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T179);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 179;
	}
	return R;
}

/* New instance of type ET_PARENT */
T0* GE_new181(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T181);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 181;
	}
	return R;
}

/* New instance of type ET_PARENT_LIST */
T0* GE_new182(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T182);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 182;
	}
	return R;
}

/* New instance of type ET_CLIENT_LIST */
T0* GE_new183(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T183);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 183;
	}
	return R;
}

/* New instance of type ET_TUPLE_TYPE */
T0* GE_new184(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T184);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 184;
	}
	return R;
}

/* New instance of type ET_ACTUAL_PARAMETER_LIST */
T0* GE_new186(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T186);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 186;
	}
	return R;
}

/* New instance of type ET_BUILTIN_CONVERT_FEATURE */
T0* GE_new187(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T187);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 187;
	}
	return R;
}

/* New instance of type DS_HASH_SET [ET_UNIVERSE] */
T0* GE_new188(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T188);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 188;
	}
	return R;
}

/* New instance of type ET_MASTER_CLASS */
T0* GE_new189(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T189);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 189;
	}
	return R;
}

/* New instance of type ET_CLIENT */
T0* GE_new190(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T190);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 190;
	}
	return R;
}

/* New instance of type ET_KEYWORD */
T0* GE_new192(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T192);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 192;
	}
	return R;
}

/* New instance of type ET_ATTACHMENT_MARK_SEPARATE_KEYWORD */
T0* GE_new193(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T193);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 193;
	}
	return R;
}

/* New instance of type ET_RENAME_LIST */
T0* GE_new194(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T194);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 194;
	}
	return R;
}

/* New instance of type ET_EXPORT_LIST */
T0* GE_new195(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T195);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 195;
	}
	return R;
}

/* New instance of type ET_KEYWORD_FEATURE_NAME_LIST */
T0* GE_new196(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T196);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 196;
	}
	return R;
}

/* New instance of type ET_NONE_GROUP */
T0* GE_new199(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T199);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 199;
	}
	return R;
}

/* New instance of type ET_LIKE_CURRENT */
T0* GE_new200(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T200);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 200;
	}
	return R;
}

/* New instance of type ET_UNFOLDED_EMPTY_TUPLE_ACTUAL_PARAMETERS */
T0* GE_new202(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T202);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 202;
	}
	return R;
}

/* New instance of type ET_LIBRARY */
T0* GE_new204(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T204);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 204;
	}
	return R;
}

/* New instance of type TUPLE [ET_LIBRARY] */
T0* GE_new205(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T205);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 205;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_LIBRARY]] */
T0* GE_new206(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T206);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 206;
	}
	return R;
}

/* New instance of type TUPLE [DS_HASH_SET [ET_UNIVERSE]] */
T0* GE_new207(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T207);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 207;
	}
	return R;
}

/* New instance of type ET_DOTNET_ASSEMBLY */
T0* GE_new208(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T208);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 208;
	}
	return R;
}

/* New instance of type TUPLE [ET_DOTNET_ASSEMBLY] */
T0* GE_new209(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T209);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 209;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_DOTNET_ASSEMBLY]] */
T0* GE_new210(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T210);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 210;
	}
	return R;
}

/* New instance of type ST_WORD_WRAPPER */
T0* GE_new211(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T211);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 211;
	}
	return R;
}

/* New instance of type AP_DISPLAY_HELP_FLAG */
T0* GE_new213(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T213);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 213;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [AP_OPTION] */
T0* GE_new214(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T214);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 214;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST] */
T0* GE_new215(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T215);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 215;
	}
	return R;
}

/* New instance of type AP_ERROR_HANDLER */
T0* GE_new216(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T216);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 216;
	}
	return R;
}

/* New instance of type DS_LINKABLE [AP_OPTION] */
T0* GE_new217(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T217);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 217;
	}
	return R;
}

/* New instance of type DS_LINKED_LIST_CURSOR [AP_OPTION] */
T0* GE_new218(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T218);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 218;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [detachable STRING_8] */
T0* GE_new219(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T219);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 219;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [detachable STRING_8] */
T0* GE_new220(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T220);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 220;
	}
	return R;
}

/* New instance of type DS_LINKED_LIST [STRING_8] */
T0* GE_new221(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T221);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 221;
	}
	return R;
}

/* New instance of type KL_STRING_EQUALITY_TESTER */
T0* GE_new222(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T222);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 222;
	}
	return R;
}

/* New instance of type KL_EQUALITY_TESTER [STRING_8] */
T0* GE_new223(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T223);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 223;
	}
	return R;
}

/* New instance of type DS_LINKED_LIST [BOOLEAN] */
T0* GE_new226(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T226);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 226;
	}
	return R;
}

/* New instance of type DS_LINKED_LIST [INTEGER_32] */
T0* GE_new229(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T229);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 229;
	}
	return R;
}

/* New instance of type KL_NULL_TEXT_OUTPUT_STREAM */
T0* GE_new230(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T230);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 230;
	}
	return R;
}

/* New instance of type ET_EIFFEL_PREPARSER */
T0* GE_new232(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T232);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 232;
	}
	return R;
}

/* New instance of type ET_MASTER_CLASS_CHECKER */
T0* GE_new233(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T233);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 233;
	}
	return R;
}

/* New instance of type ET_PROVIDER_CHECKER */
T0* GE_new234(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T234);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 234;
	}
	return R;
}

/* New instance of type ET_ANCESTOR_BUILDER */
T0* GE_new235(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T235);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 235;
	}
	return R;
}

/* New instance of type ET_FEATURE_FLATTENER */
T0* GE_new236(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T236);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 236;
	}
	return R;
}

/* New instance of type ET_INTERFACE_CHECKER */
T0* GE_new237(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T237);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 237;
	}
	return R;
}

/* New instance of type ET_IMPLEMENTATION_CHECKER */
T0* GE_new238(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T238);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 238;
	}
	return R;
}

/* New instance of type ET_AST_NULL_PROCESSOR */
T0* GE_new239(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T239);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 239;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [INTEGER_32] */
T0* GE_new240(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T240);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 240;
	}
	return R;
}

/* New instance of type ET_DOTNET_ASSEMBLY_CLASSIC_CONSUMER */
T0* GE_new242(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T242);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 242;
	}
	return R;
}

/* New instance of type YY_UNICODE_FILE_BUFFER */
T0* GE_new244(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T244);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 244;
	}
	return R;
}

/* New instance of type KL_STDIN_FILE */
T0* GE_new245(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T245);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 245;
	}
	return R;
}

/* New instance of type DS_ARRAYED_STACK [INTEGER_32] */
T0* GE_new246(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T246);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 246;
	}
	return R;
}

/* New instance of type DS_ARRAYED_STACK [detachable ET_FORMAL_ARGUMENT_LIST] */
T0* GE_new247(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T247);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 247;
	}
	return R;
}

/* New instance of type DS_ARRAYED_STACK [detachable ET_LOCAL_VARIABLE_LIST] */
T0* GE_new248(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T248);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 248;
	}
	return R;
}

/* New instance of type DS_ARRAYED_STACK [detachable ET_KEYWORD] */
T0* GE_new249(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T249);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 249;
	}
	return R;
}

/* New instance of type DS_ARRAYED_STACK [detachable ET_SYMBOL] */
T0* GE_new250(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T250);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 250;
	}
	return R;
}

/* New instance of type DS_ARRAYED_STACK [detachable ET_OBJECT_TEST_LIST] */
T0* GE_new251(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T251);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 251;
	}
	return R;
}

/* New instance of type DS_ARRAYED_STACK [ET_OBJECT_TEST_LIST] */
T0* GE_new252(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T252);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 252;
	}
	return R;
}

/* New instance of type DS_ARRAYED_STACK [detachable ET_ITERATION_COMPONENT_LIST] */
T0* GE_new253(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T253);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 253;
	}
	return R;
}

/* New instance of type DS_ARRAYED_STACK [ET_ITERATION_COMPONENT_LIST] */
T0* GE_new254(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T254);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 254;
	}
	return R;
}

/* New instance of type DS_ARRAYED_STACK [detachable ET_INLINE_SEPARATE_ARGUMENT_LIST] */
T0* GE_new255(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T255);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 255;
	}
	return R;
}

/* New instance of type DS_ARRAYED_STACK [ET_INLINE_SEPARATE_ARGUMENT_LIST] */
T0* GE_new256(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T256);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 256;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ASSERTION_ITEM] */
T0* GE_new257(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T257);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 257;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_QUERY] */
T0* GE_new258(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T258);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 258;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_PROCEDURE] */
T0* GE_new259(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T259);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 259;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [detachable ET_CONSTRAINT_TYPE] */
T0* GE_new260(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T260);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 260;
	}
	return R;
}

/* New instance of type DS_HASH_SET [ET_NAMED_CLASS] */
T0* GE_new261(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T261);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 261;
	}
	return R;
}

/* New instance of type YY_BUFFER */
T0* GE_new262(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T262);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 262;
	}
	return R;
}

/* New instance of type ET_UNKNOWN_GROUP */
T0* GE_new263(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T263);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 263;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [INTEGER_32] */
T0* GE_new264(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T264);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 264;
	}
	return R;
}

/* New instance of type KL_UNICODE_CHARACTER_BUFFER */
T0* GE_new266(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T266);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 266;
	}
	return R;
}

/* New instance of type ET_CLIENTS */
T0* GE_new268(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T268);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 268;
	}
	return R;
}

/* New instance of type ET_FEATURE_CLAUSE */
T0* GE_new269(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T269);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 269;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ANY] */
T0* GE_new272(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T272);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 272;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ANY] */
T0* GE_new273(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T273)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 273;
		((T273*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_KEYWORD] */
T0* GE_new274(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T274);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 274;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_KEYWORD] */
T0* GE_new275(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T275)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 275;
		((T275*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_AGENT_KEYWORD] */
T0* GE_new276(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T276);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 276;
	}
	return R;
}

/* New instance of type ET_AGENT_KEYWORD */
T0* GE_new277(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T277);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 277;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_AGENT_KEYWORD] */
T0* GE_new278(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T278)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 278;
		((T278*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_INVARIANT_KEYWORD] */
T0* GE_new279(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T279);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 279;
	}
	return R;
}

/* New instance of type ET_INVARIANT_KEYWORD */
T0* GE_new280(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T280);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 280;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_INVARIANT_KEYWORD] */
T0* GE_new281(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T281)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 281;
		((T281*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_PRECURSOR_KEYWORD] */
T0* GE_new282(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T282);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 282;
	}
	return R;
}

/* New instance of type ET_PRECURSOR_KEYWORD */
T0* GE_new283(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T283);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 283;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_PRECURSOR_KEYWORD] */
T0* GE_new284(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T284)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 284;
		((T284*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_SYMBOL] */
T0* GE_new285(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T285);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 285;
	}
	return R;
}

/* New instance of type ET_SYMBOL */
T0* GE_new286(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T286);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 286;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_SYMBOL] */
T0* GE_new287(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T287)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 287;
		((T287*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_POSITION] */
T0* GE_new288(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T288);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 288;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_POSITION] */
T0* GE_new290(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T290)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 290;
		((T290*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_BOOLEAN_CONSTANT] */
T0* GE_new291(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T291);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 291;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_BOOLEAN_CONSTANT] */
T0* GE_new293(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T293)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 293;
		((T293*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_BREAK] */
T0* GE_new294(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T294);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 294;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_BREAK] */
T0* GE_new296(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T296)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 296;
		((T296*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CHARACTER_CONSTANT] */
T0* GE_new297(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T297);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 297;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CHARACTER_CONSTANT] */
T0* GE_new299(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T299)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 299;
		((T299*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CURRENT] */
T0* GE_new300(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T300);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 300;
	}
	return R;
}

/* New instance of type ET_CURRENT */
T0* GE_new301(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T301);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 301;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CURRENT] */
T0* GE_new302(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T302)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 302;
		((T302*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_FREE_OPERATOR] */
T0* GE_new303(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T303);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 303;
	}
	return R;
}

/* New instance of type ET_FREE_OPERATOR */
T0* GE_new304(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T304);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 304;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_FREE_OPERATOR] */
T0* GE_new305(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T305)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 305;
		((T305*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_IDENTIFIER] */
T0* GE_new306(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T306);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 306;
	}
	return R;
}

/* New instance of type ET_IDENTIFIER */
T0* GE_new307(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T307);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 307;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_IDENTIFIER] */
T0* GE_new308(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T308)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 308;
		((T308*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_INTEGER_CONSTANT] */
T0* GE_new309(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T309);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 309;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_INTEGER_CONSTANT] */
T0* GE_new311(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T311)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 311;
		((T311*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_KEYWORD_OPERATOR] */
T0* GE_new312(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T312);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 312;
	}
	return R;
}

/* New instance of type ET_KEYWORD_OPERATOR */
T0* GE_new313(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T313);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 313;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_KEYWORD_OPERATOR] */
T0* GE_new314(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T314)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 314;
		((T314*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_MANIFEST_STRING] */
T0* GE_new315(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T315);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 315;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_MANIFEST_STRING] */
T0* GE_new317(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T317)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 317;
		((T317*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_REAL_CONSTANT] */
T0* GE_new318(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T318);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 318;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_REAL_CONSTANT] */
T0* GE_new320(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T320)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 320;
		((T320*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_RESULT] */
T0* GE_new321(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T321);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 321;
	}
	return R;
}

/* New instance of type ET_RESULT */
T0* GE_new322(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T322);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 322;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_RESULT] */
T0* GE_new323(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T323)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 323;
		((T323*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_RETRY_INSTRUCTION] */
T0* GE_new324(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T324);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 324;
	}
	return R;
}

/* New instance of type ET_RETRY_INSTRUCTION */
T0* GE_new325(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T325);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 325;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_RETRY_INSTRUCTION] */
T0* GE_new326(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T326)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 326;
		((T326*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_SYMBOL_OPERATOR] */
T0* GE_new327(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T327);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 327;
	}
	return R;
}

/* New instance of type ET_SYMBOL_OPERATOR */
T0* GE_new328(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T328);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 328;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_SYMBOL_OPERATOR] */
T0* GE_new329(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T329)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 329;
		((T329*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_VOID] */
T0* GE_new330(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T330);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 330;
	}
	return R;
}

/* New instance of type ET_VOID */
T0* GE_new331(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T331);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 331;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_VOID] */
T0* GE_new332(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T332)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 332;
		((T332*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_SEMICOLON_SYMBOL] */
T0* GE_new333(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T333);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 333;
	}
	return R;
}

/* New instance of type ET_SEMICOLON_SYMBOL */
T0* GE_new334(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T334);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 334;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_SEMICOLON_SYMBOL] */
T0* GE_new335(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T335)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 335;
		((T335*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_BRACKET_SYMBOL] */
T0* GE_new336(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T336);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 336;
	}
	return R;
}

/* New instance of type ET_BRACKET_SYMBOL */
T0* GE_new337(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T337);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 337;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_BRACKET_SYMBOL] */
T0* GE_new338(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T338)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 338;
		((T338*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_QUESTION_MARK_SYMBOL] */
T0* GE_new339(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T339);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 339;
	}
	return R;
}

/* New instance of type ET_QUESTION_MARK_SYMBOL */
T0* GE_new340(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T340);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 340;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_QUESTION_MARK_SYMBOL] */
T0* GE_new341(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T341)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 341;
		((T341*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_ACROSS_EXPRESSION] */
T0* GE_new342(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T342);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 342;
	}
	return R;
}

/* New instance of type ET_ACROSS_EXPRESSION */
T0* GE_new343(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T343);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 343;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_ACROSS_EXPRESSION] */
T0* GE_new344(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T344)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 344;
		((T344*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_ACROSS_INSTRUCTION] */
T0* GE_new345(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T345);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 345;
	}
	return R;
}

/* New instance of type ET_ACROSS_INSTRUCTION */
T0* GE_new346(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T346);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 346;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_ACROSS_INSTRUCTION] */
T0* GE_new347(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T347)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 347;
		((T347*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_ACTUAL_ARGUMENT_LIST] */
T0* GE_new348(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T348);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 348;
	}
	return R;
}

/* New instance of type ET_ACTUAL_ARGUMENT_LIST */
T0* GE_new349(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T349);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 349;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_ACTUAL_ARGUMENT_LIST] */
T0* GE_new350(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T350)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 350;
		((T350*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_ACTUAL_PARAMETER_ITEM] */
T0* GE_new351(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T351);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 351;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_ACTUAL_PARAMETER_ITEM] */
T0* GE_new352(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T352)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 352;
		((T352*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_ACTUAL_PARAMETER_LIST] */
T0* GE_new353(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T353);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 353;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_ACTUAL_PARAMETER_LIST] */
T0* GE_new354(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T354)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 354;
		((T354*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_AGENT_ARGUMENT_OPERAND] */
T0* GE_new355(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T355);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 355;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_AGENT_ARGUMENT_OPERAND] */
T0* GE_new357(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T357)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 357;
		((T357*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_AGENT_ARGUMENT_OPERAND_ITEM] */
T0* GE_new358(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T358);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 358;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_AGENT_ARGUMENT_OPERAND_ITEM] */
T0* GE_new360(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T360)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 360;
		((T360*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_AGENT_ARGUMENT_OPERAND_LIST] */
T0* GE_new361(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T361);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 361;
	}
	return R;
}

/* New instance of type ET_AGENT_ARGUMENT_OPERAND_LIST */
T0* GE_new362(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T362);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 362;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_AGENT_ARGUMENT_OPERAND_LIST] */
T0* GE_new363(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T363)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 363;
		((T363*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_AGENT_TARGET] */
T0* GE_new364(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T364);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 364;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_AGENT_TARGET] */
T0* GE_new366(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T366)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 366;
		((T366*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_ALIAS_NAME] */
T0* GE_new367(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T367);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 367;
	}
	return R;
}

/* New instance of type ET_ALIAS_NAME */
T0* GE_new368(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T368);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 368;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_ALIAS_NAME] */
T0* GE_new369(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T369)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 369;
		((T369*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_ALIAS_NAME_LIST] */
T0* GE_new370(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T370);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 370;
	}
	return R;
}

/* New instance of type ET_ALIAS_NAME_LIST */
T0* GE_new371(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T371);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 371;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_ALIAS_NAME_LIST] */
T0* GE_new372(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T372)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 372;
		((T372*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_ASSIGNER] */
T0* GE_new373(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T373);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 373;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_ASSIGNER] */
T0* GE_new375(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T375)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 375;
		((T375*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_BRACKET_EXPRESSION] */
T0* GE_new376(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T376);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 376;
	}
	return R;
}

/* New instance of type ET_BRACKET_EXPRESSION */
T0* GE_new377(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T377);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 377;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_BRACKET_EXPRESSION] */
T0* GE_new378(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T378)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 378;
		((T378*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CALL_AGENT] */
T0* GE_new379(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T379);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 379;
	}
	return R;
}

/* New instance of type ET_CALL_AGENT */
T0* GE_new380(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T380);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 380;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CALL_AGENT] */
T0* GE_new381(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T381)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 381;
		((T381*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_QUALIFIED_CALL_EXPRESSION] */
T0* GE_new382(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T382);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 382;
	}
	return R;
}

/* New instance of type ET_QUALIFIED_CALL_EXPRESSION */
T0* GE_new383(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T383);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 383;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_QUALIFIED_CALL_EXPRESSION] */
T0* GE_new384(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T384)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 384;
		((T384*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CHECK_INSTRUCTION] */
T0* GE_new385(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T385);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 385;
	}
	return R;
}

/* New instance of type ET_CHECK_INSTRUCTION */
T0* GE_new386(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T386);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 386;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CHECK_INSTRUCTION] */
T0* GE_new387(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T387)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 387;
		((T387*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CHOICE] */
T0* GE_new388(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T388);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 388;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CHOICE] */
T0* GE_new390(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T390)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 390;
		((T390*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CHOICE_CONSTANT] */
T0* GE_new391(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T391);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 391;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CHOICE_CONSTANT] */
T0* GE_new393(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T393)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 393;
		((T393*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CHOICE_ITEM] */
T0* GE_new394(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T394);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 394;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CHOICE_ITEM] */
T0* GE_new396(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T396)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 396;
		((T396*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CHOICE_LIST] */
T0* GE_new397(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T397);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 397;
	}
	return R;
}

/* New instance of type ET_CHOICE_LIST */
T0* GE_new398(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T398);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 398;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CHOICE_LIST] */
T0* GE_new399(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T399)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 399;
		((T399*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CLASS] */
T0* GE_new400(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T400);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 400;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CLASS] */
T0* GE_new401(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T401)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 401;
		((T401*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CLIENT_ITEM] */
T0* GE_new402(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T402);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 402;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CLIENT_ITEM] */
T0* GE_new403(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T403)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 403;
		((T403*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CLIENTS] */
T0* GE_new404(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T404);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 404;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CLIENTS] */
T0* GE_new405(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T405)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 405;
		((T405*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_COMPOUND] */
T0* GE_new406(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T406);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 406;
	}
	return R;
}

/* New instance of type ET_COMPOUND */
T0* GE_new407(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T407);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 407;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_COMPOUND] */
T0* GE_new408(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T408)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 408;
		((T408*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CONDITIONAL] */
T0* GE_new409(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T409);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 409;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CONDITIONAL] */
T0* GE_new411(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T411)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 411;
		((T411*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CONSTANT] */
T0* GE_new412(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T412);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 412;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CONSTANT] */
T0* GE_new414(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T414)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 414;
		((T414*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM] */
T0* GE_new415(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T415);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 415;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM] */
T0* GE_new417(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T417)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 417;
		((T417*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST] */
T0* GE_new418(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T418);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 418;
	}
	return R;
}

/* New instance of type ET_CONSTRAINT_ACTUAL_PARAMETER_LIST */
T0* GE_new419(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T419);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 419;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST] */
T0* GE_new420(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T420)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 420;
		((T420*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CONSTRAINT_CREATOR] */
T0* GE_new421(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T421);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 421;
	}
	return R;
}

/* New instance of type ET_CONSTRAINT_CREATOR */
T0* GE_new422(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T422);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 422;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CONSTRAINT_CREATOR] */
T0* GE_new423(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T423)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 423;
		((T423*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CONSTRAINT_RENAME_LIST] */
T0* GE_new424(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T424);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 424;
	}
	return R;
}

/* New instance of type ET_CONSTRAINT_RENAME_LIST */
T0* GE_new425(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T425);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 425;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CONSTRAINT_RENAME_LIST] */
T0* GE_new426(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T426)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 426;
		((T426*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CONSTRAINT_TYPE] */
T0* GE_new427(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T427);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 427;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CONSTRAINT_TYPE] */
T0* GE_new429(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T429)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 429;
		((T429*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CONVERT_FEATURE] */
T0* GE_new430(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T430);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 430;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CONVERT_FEATURE] */
T0* GE_new432(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T432)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 432;
		((T432*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CONVERT_FEATURE_ITEM] */
T0* GE_new433(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T433);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 433;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CONVERT_FEATURE_ITEM] */
T0* GE_new435(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T435)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 435;
		((T435*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CONVERT_FEATURE_LIST] */
T0* GE_new436(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T436);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 436;
	}
	return R;
}

/* New instance of type ET_CONVERT_FEATURE_LIST */
T0* GE_new437(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T437);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 437;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CONVERT_FEATURE_LIST] */
T0* GE_new438(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T438)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 438;
		((T438*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CREATE_EXPRESSION] */
T0* GE_new439(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T439);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 439;
	}
	return R;
}

/* New instance of type ET_CREATE_EXPRESSION */
T0* GE_new440(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T440);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 440;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CREATE_EXPRESSION] */
T0* GE_new441(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T441)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 441;
		((T441*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CREATION_REGION] */
T0* GE_new442(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T442);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 442;
	}
	return R;
}

/* New instance of type ET_CREATION_REGION */
T0* GE_new443(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T443);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 443;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CREATION_REGION] */
T0* GE_new444(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T444)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 444;
		((T444*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CREATOR] */
T0* GE_new445(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T445);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 445;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CREATOR] */
T0* GE_new446(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T446)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 446;
		((T446*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_CREATOR_LIST] */
T0* GE_new447(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T447);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 447;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_CREATOR_LIST] */
T0* GE_new448(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T448)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 448;
		((T448*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_DEBUG_INSTRUCTION] */
T0* GE_new449(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T449);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 449;
	}
	return R;
}

/* New instance of type ET_DEBUG_INSTRUCTION */
T0* GE_new450(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T450);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 450;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_DEBUG_INSTRUCTION] */
T0* GE_new451(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T451)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 451;
		((T451*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_ELSEIF_EXPRESSION] */
T0* GE_new452(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T452);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 452;
	}
	return R;
}

/* New instance of type ET_ELSEIF_EXPRESSION */
T0* GE_new453(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T453);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 453;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_ELSEIF_EXPRESSION] */
T0* GE_new454(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T454)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 454;
		((T454*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_ELSEIF_EXPRESSION_LIST] */
T0* GE_new455(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T455);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 455;
	}
	return R;
}

/* New instance of type ET_ELSEIF_EXPRESSION_LIST */
T0* GE_new456(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T456);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 456;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_ELSEIF_EXPRESSION_LIST] */
T0* GE_new457(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T457)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 457;
		((T457*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_ELSEIF_PART] */
T0* GE_new458(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T458);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 458;
	}
	return R;
}

/* New instance of type ET_ELSEIF_PART */
T0* GE_new459(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T459);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 459;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_ELSEIF_PART] */
T0* GE_new460(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T460)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 460;
		((T460*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_ELSEIF_PART_LIST] */
T0* GE_new461(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T461);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 461;
	}
	return R;
}

/* New instance of type ET_ELSEIF_PART_LIST */
T0* GE_new462(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T462);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 462;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_ELSEIF_PART_LIST] */
T0* GE_new463(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T463)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 463;
		((T463*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_EXPORT] */
T0* GE_new464(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T464);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 464;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_EXPORT] */
T0* GE_new466(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T466)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 466;
		((T466*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_EXPORT_LIST] */
T0* GE_new467(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T467);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 467;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_EXPORT_LIST] */
T0* GE_new468(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T468)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 468;
		((T468*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_EXPRESSION] */
T0* GE_new469(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T469);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 469;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_EXPRESSION] */
T0* GE_new471(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T471)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 471;
		((T471*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_EXPRESSION_ITEM] */
T0* GE_new472(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T472);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 472;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_EXPRESSION_ITEM] */
T0* GE_new474(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T474)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 474;
		((T474*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_EXTENDED_FEATURE_NAME] */
T0* GE_new475(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T475);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 475;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_EXTENDED_FEATURE_NAME] */
T0* GE_new477(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T477)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 477;
		((T477*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_EXTERNAL_ALIAS] */
T0* GE_new478(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T478);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 478;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_EXTERNAL_ALIAS] */
T0* GE_new480(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T480)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 480;
		((T480*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_FEATURE_CLAUSE] */
T0* GE_new481(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T481);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 481;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_FEATURE_CLAUSE] */
T0* GE_new482(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T482)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 482;
		((T482*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_FEATURE_CLAUSE_LIST] */
T0* GE_new483(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T483);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 483;
	}
	return R;
}

/* New instance of type ET_FEATURE_CLAUSE_LIST */
T0* GE_new484(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T484);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 484;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_FEATURE_CLAUSE_LIST] */
T0* GE_new485(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T485)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 485;
		((T485*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_FEATURE_EXPORT] */
T0* GE_new486(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T486);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 486;
	}
	return R;
}

/* New instance of type ET_FEATURE_EXPORT */
T0* GE_new487(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T487);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 487;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_FEATURE_EXPORT] */
T0* GE_new488(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T488)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 488;
		((T488*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_FEATURE_NAME] */
T0* GE_new489(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T489);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 489;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_FEATURE_NAME] */
T0* GE_new490(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T490)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 490;
		((T490*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_FEATURE_NAME_ITEM] */
T0* GE_new491(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T491);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 491;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_FEATURE_NAME_ITEM] */
T0* GE_new493(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T493)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 493;
		((T493*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_FORMAL_ARGUMENT] */
T0* GE_new494(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T494);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 494;
	}
	return R;
}

/* New instance of type ET_FORMAL_ARGUMENT */
T0* GE_new495(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T495);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 495;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_FORMAL_ARGUMENT] */
T0* GE_new496(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T496)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 496;
		((T496*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_FORMAL_ARGUMENT_ITEM] */
T0* GE_new497(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T497);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 497;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_FORMAL_ARGUMENT_ITEM] */
T0* GE_new499(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T499)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 499;
		((T499*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_FORMAL_ARGUMENT_LIST] */
T0* GE_new500(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T500);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 500;
	}
	return R;
}

/* New instance of type ET_FORMAL_ARGUMENT_LIST */
T0* GE_new501(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T501);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 501;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_FORMAL_ARGUMENT_LIST] */
T0* GE_new502(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T502)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 502;
		((T502*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_FORMAL_PARAMETER] */
T0* GE_new503(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T503);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 503;
	}
	return R;
}

/* New instance of type ET_FORMAL_PARAMETER */
T0* GE_new504(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T504);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 504;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_FORMAL_PARAMETER] */
T0* GE_new505(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T505)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 505;
		((T505*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_FORMAL_PARAMETER_ITEM] */
T0* GE_new506(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T506);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 506;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_FORMAL_PARAMETER_ITEM] */
T0* GE_new508(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T508)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 508;
		((T508*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_FORMAL_PARAMETER_LIST] */
T0* GE_new509(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T509);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 509;
	}
	return R;
}

/* New instance of type ET_FORMAL_PARAMETER_LIST */
T0* GE_new510(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T510);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 510;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_FORMAL_PARAMETER_LIST] */
T0* GE_new511(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T511)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 511;
		((T511*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_IF_EXPRESSION] */
T0* GE_new512(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T512);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 512;
	}
	return R;
}

/* New instance of type ET_IF_EXPRESSION */
T0* GE_new513(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T513);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 513;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_IF_EXPRESSION] */
T0* GE_new514(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T514)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 514;
		((T514*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_IF_INSTRUCTION] */
T0* GE_new515(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T515);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 515;
	}
	return R;
}

/* New instance of type ET_IF_INSTRUCTION */
T0* GE_new516(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T516);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 516;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_IF_INSTRUCTION] */
T0* GE_new517(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T517)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 517;
		((T517*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_INLINE_AGENT] */
T0* GE_new518(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T518);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 518;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_INLINE_AGENT] */
T0* GE_new520(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T520)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 520;
		((T520*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_INLINE_SEPARATE_ARGUMENT] */
T0* GE_new521(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T521);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 521;
	}
	return R;
}

/* New instance of type ET_INLINE_SEPARATE_ARGUMENT */
T0* GE_new522(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T522);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 522;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_INLINE_SEPARATE_ARGUMENT] */
T0* GE_new523(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T523)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 523;
		((T523*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_INLINE_SEPARATE_ARGUMENT_ITEM] */
T0* GE_new524(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T524);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 524;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_INLINE_SEPARATE_ARGUMENT_ITEM] */
T0* GE_new526(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T526)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 526;
		((T526*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_INLINE_SEPARATE_ARGUMENTS] */
T0* GE_new527(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T527);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 527;
	}
	return R;
}

/* New instance of type ET_INLINE_SEPARATE_ARGUMENTS */
T0* GE_new528(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T528);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 528;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_INLINE_SEPARATE_ARGUMENTS] */
T0* GE_new529(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T529)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 529;
		((T529*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_INLINE_SEPARATE_INSTRUCTION] */
T0* GE_new530(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T530);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 530;
	}
	return R;
}

/* New instance of type ET_INLINE_SEPARATE_INSTRUCTION */
T0* GE_new531(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T531);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 531;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_INLINE_SEPARATE_INSTRUCTION] */
T0* GE_new532(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T532)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 532;
		((T532*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_INSPECT_EXPRESSION] */
T0* GE_new533(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T533);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 533;
	}
	return R;
}

/* New instance of type ET_INSPECT_EXPRESSION */
T0* GE_new534(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T534);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 534;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_INSPECT_EXPRESSION] */
T0* GE_new535(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T535)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 535;
		((T535*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_INSPECT_INSTRUCTION] */
T0* GE_new536(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T536);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 536;
	}
	return R;
}

/* New instance of type ET_INSPECT_INSTRUCTION */
T0* GE_new537(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T537);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 537;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_INSPECT_INSTRUCTION] */
T0* GE_new538(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T538)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 538;
		((T538*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_INSTRUCTION] */
T0* GE_new539(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T539);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 539;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_INSTRUCTION] */
T0* GE_new541(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T541)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 541;
		((T541*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_INVARIANTS] */
T0* GE_new542(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T542);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 542;
	}
	return R;
}

/* New instance of type ET_INVARIANTS */
T0* GE_new543(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T543);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 543;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_INVARIANTS] */
T0* GE_new544(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T544)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 544;
		((T544*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_KEYWORD_FEATURE_NAME_LIST] */
T0* GE_new545(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T545);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 545;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_KEYWORD_FEATURE_NAME_LIST] */
T0* GE_new546(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T546)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 546;
		((T546*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_LIKE_TYPE] */
T0* GE_new547(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T547);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 547;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_LIKE_TYPE] */
T0* GE_new549(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T549)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 549;
		((T549*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_LOCAL_VARIABLE] */
T0* GE_new550(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T550);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 550;
	}
	return R;
}

/* New instance of type ET_LOCAL_VARIABLE */
T0* GE_new551(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T551);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 551;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_LOCAL_VARIABLE] */
T0* GE_new552(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T552)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 552;
		((T552*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_LOCAL_VARIABLE_ITEM] */
T0* GE_new553(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T553);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 553;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_LOCAL_VARIABLE_ITEM] */
T0* GE_new555(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T555)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 555;
		((T555*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_LOCAL_VARIABLE_LIST] */
T0* GE_new556(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T556);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 556;
	}
	return R;
}

/* New instance of type ET_LOCAL_VARIABLE_LIST */
T0* GE_new557(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T557);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 557;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_LOCAL_VARIABLE_LIST] */
T0* GE_new558(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T558)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 558;
		((T558*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_LOOP_INVARIANTS] */
T0* GE_new559(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T559);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 559;
	}
	return R;
}

/* New instance of type ET_LOOP_INVARIANTS */
T0* GE_new560(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T560);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 560;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_LOOP_INVARIANTS] */
T0* GE_new561(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T561)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 561;
		((T561*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_MANIFEST_ARRAY] */
T0* GE_new562(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T562);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 562;
	}
	return R;
}

/* New instance of type ET_MANIFEST_ARRAY */
T0* GE_new563(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T563);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 563;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_MANIFEST_ARRAY] */
T0* GE_new564(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T564)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 564;
		((T564*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_MANIFEST_STRING_ITEM] */
T0* GE_new565(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T565);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 565;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_MANIFEST_STRING_ITEM] */
T0* GE_new567(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T567)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 567;
		((T567*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_MANIFEST_STRING_LIST] */
T0* GE_new568(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T568);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 568;
	}
	return R;
}

/* New instance of type ET_MANIFEST_STRING_LIST */
T0* GE_new569(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T569);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 569;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_MANIFEST_STRING_LIST] */
T0* GE_new570(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T570)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 570;
		((T570*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_MANIFEST_TUPLE] */
T0* GE_new571(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T571);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 571;
	}
	return R;
}

/* New instance of type ET_MANIFEST_TUPLE */
T0* GE_new572(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T572);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 572;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_MANIFEST_TUPLE] */
T0* GE_new573(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T573)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 573;
		((T573*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_NOTE_LIST] */
T0* GE_new574(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T574);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 574;
	}
	return R;
}

/* New instance of type ET_NOTE_LIST */
T0* GE_new575(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T575);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 575;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_NOTE_LIST] */
T0* GE_new576(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T576)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 576;
		((T576*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_NOTE_ITEM] */
T0* GE_new577(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T577);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 577;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_NOTE_ITEM] */
T0* GE_new579(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T579)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 579;
		((T579*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_NOTE_TERM] */
T0* GE_new580(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T580);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 580;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_NOTE_TERM] */
T0* GE_new582(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T582)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 582;
		((T582*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_NOTE_TERM_ITEM] */
T0* GE_new583(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T583);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 583;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_NOTE_TERM_ITEM] */
T0* GE_new585(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T585)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 585;
		((T585*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_NOTE_TERM_LIST] */
T0* GE_new586(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T586);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 586;
	}
	return R;
}

/* New instance of type ET_NOTE_TERM_LIST */
T0* GE_new587(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T587);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 587;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_NOTE_TERM_LIST] */
T0* GE_new588(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T588)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 588;
		((T588*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_OBSOLETE] */
T0* GE_new589(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T589);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 589;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_OBSOLETE] */
T0* GE_new591(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T591)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 591;
		((T591*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_PARENTHESIZED_EXPRESSION] */
T0* GE_new592(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T592);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 592;
	}
	return R;
}

/* New instance of type ET_PARENTHESIZED_EXPRESSION */
T0* GE_new593(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T593);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 593;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_PARENTHESIZED_EXPRESSION] */
T0* GE_new594(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T594)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 594;
		((T594*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_PARENT] */
T0* GE_new595(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T595);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 595;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_PARENT] */
T0* GE_new596(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T596)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 596;
		((T596*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_PARENT_CLAUSE_LIST] */
T0* GE_new597(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T597);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 597;
	}
	return R;
}

/* New instance of type ET_PARENT_CLAUSE_LIST */
T0* GE_new598(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T598);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 598;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_PARENT_CLAUSE_LIST] */
T0* GE_new599(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T599)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 599;
		((T599*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_PARENT_ITEM] */
T0* GE_new600(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T600);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 600;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_PARENT_ITEM] */
T0* GE_new601(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T601)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 601;
		((T601*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_PARENT_LIST] */
T0* GE_new602(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T602);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 602;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_PARENT_LIST] */
T0* GE_new603(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T603)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 603;
		((T603*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_POSTCONDITIONS] */
T0* GE_new604(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T604);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 604;
	}
	return R;
}

/* New instance of type ET_POSTCONDITIONS */
T0* GE_new605(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T605);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 605;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_POSTCONDITIONS] */
T0* GE_new606(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T606)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 606;
		((T606*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_PRECONDITIONS] */
T0* GE_new607(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T607);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 607;
	}
	return R;
}

/* New instance of type ET_PRECONDITIONS */
T0* GE_new608(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T608);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 608;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_PRECONDITIONS] */
T0* GE_new609(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T609)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 609;
		((T609*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_PROCEDURE] */
T0* GE_new610(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T610);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 610;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_PROCEDURE] */
T0* GE_new612(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T612)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 612;
		((T612*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_QUALIFIED_LIKE_IDENTIFIER] */
T0* GE_new613(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T613);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 613;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_QUALIFIED_LIKE_IDENTIFIER] */
T0* GE_new615(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T615)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 615;
		((T615*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_QUANTIFIER_EXPRESSION] */
T0* GE_new616(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T616);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 616;
	}
	return R;
}

/* New instance of type ET_QUANTIFIER_EXPRESSION */
T0* GE_new617(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T617);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 617;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_QUANTIFIER_EXPRESSION] */
T0* GE_new618(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T618)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 618;
		((T618*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_QUERY] */
T0* GE_new619(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T619);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 619;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_QUERY] */
T0* GE_new621(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T621)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 621;
		((T621*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_RENAME_ITEM] */
T0* GE_new622(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T622);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 622;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_RENAME_ITEM] */
T0* GE_new624(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T624)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 624;
		((T624*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_RENAME_LIST] */
T0* GE_new625(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T625);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 625;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_RENAME_LIST] */
T0* GE_new626(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T626)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 626;
		((T626*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_REPEAT_INSTRUCTION] */
T0* GE_new627(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T627);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 627;
	}
	return R;
}

/* New instance of type ET_REPEAT_INSTRUCTION */
T0* GE_new628(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T628);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 628;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_REPEAT_INSTRUCTION] */
T0* GE_new629(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T629)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 629;
		((T629*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_STATIC_CALL_EXPRESSION] */
T0* GE_new630(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T630);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 630;
	}
	return R;
}

/* New instance of type ET_STATIC_CALL_EXPRESSION */
T0* GE_new631(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T631);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 631;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_STATIC_CALL_EXPRESSION] */
T0* GE_new632(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T632)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 632;
		((T632*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_STRIP_EXPRESSION] */
T0* GE_new633(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T633);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 633;
	}
	return R;
}

/* New instance of type ET_STRIP_EXPRESSION */
T0* GE_new634(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T634);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 634;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_STRIP_EXPRESSION] */
T0* GE_new635(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T635)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 635;
		((T635*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_TYPE] */
T0* GE_new636(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T636);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 636;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_TYPE] */
T0* GE_new637(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T637)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 637;
		((T637*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_TYPE_CONSTRAINT] */
T0* GE_new638(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T638);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 638;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_TYPE_CONSTRAINT] */
T0* GE_new640(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T640)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 640;
		((T640*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_TYPE_CONSTRAINT_ITEM] */
T0* GE_new641(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T641);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 641;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_TYPE_CONSTRAINT_ITEM] */
T0* GE_new643(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T643)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 643;
		((T643*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_TYPE_CONSTRAINT_LIST] */
T0* GE_new644(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T644);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 644;
	}
	return R;
}

/* New instance of type ET_TYPE_CONSTRAINT_LIST */
T0* GE_new645(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T645);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 645;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_TYPE_CONSTRAINT_LIST] */
T0* GE_new646(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T646)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 646;
		((T646*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_TYPE_ITEM] */
T0* GE_new647(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T647);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 647;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_TYPE_ITEM] */
T0* GE_new649(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T649)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 649;
		((T649*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_TYPE_LIST] */
T0* GE_new650(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T650);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 650;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_TYPE_LIST] */
T0* GE_new652(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T652)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 652;
		((T652*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_VARIANT] */
T0* GE_new653(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T653);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 653;
	}
	return R;
}

/* New instance of type ET_VARIANT */
T0* GE_new654(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T654);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 654;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_VARIANT] */
T0* GE_new655(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T655)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 655;
		((T655*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_WHEN_EXPRESSION] */
T0* GE_new656(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T656);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 656;
	}
	return R;
}

/* New instance of type ET_WHEN_EXPRESSION */
T0* GE_new657(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T657);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 657;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_WHEN_EXPRESSION] */
T0* GE_new658(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T658)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 658;
		((T658*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_WHEN_EXPRESSION_LIST] */
T0* GE_new659(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T659);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 659;
	}
	return R;
}

/* New instance of type ET_WHEN_EXPRESSION_LIST */
T0* GE_new660(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T660);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 660;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_WHEN_EXPRESSION_LIST] */
T0* GE_new661(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T661)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 661;
		((T661*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_WHEN_PART] */
T0* GE_new662(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T662);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 662;
	}
	return R;
}

/* New instance of type ET_WHEN_PART */
T0* GE_new663(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T663);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 663;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_WHEN_PART] */
T0* GE_new664(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T664)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 664;
		((T664*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_WHEN_PART_LIST] */
T0* GE_new665(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T665);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 665;
	}
	return R;
}

/* New instance of type ET_WHEN_PART_LIST */
T0* GE_new666(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T666);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 666;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_WHEN_PART_LIST] */
T0* GE_new667(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T667)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 667;
		((T667*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_WRITABLE] */
T0* GE_new668(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T668);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 668;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_WRITABLE] */
T0* GE_new670(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T670)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 670;
		((T670*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type ET_OBJECT_TEST_LIST */
T0* GE_new672(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T672);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 672;
	}
	return R;
}

/* New instance of type ET_ITERATION_COMPONENT_LIST */
T0* GE_new673(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T673);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 673;
	}
	return R;
}

/* New instance of type ET_INLINE_SEPARATE_ARGUMENT_LIST */
T0* GE_new674(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T674);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 674;
	}
	return R;
}

/* New instance of type ET_C3_CHARACTER_CONSTANT */
T0* GE_new675(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T675);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 675;
	}
	return R;
}

/* New instance of type ET_REGULAR_MANIFEST_STRING */
T0* GE_new676(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T676);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 676;
	}
	return R;
}

/* New instance of type ET_SPECIAL_MANIFEST_STRING */
T0* GE_new677(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T677);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 677;
	}
	return R;
}

/* New instance of type ET_VERBATIM_STRING */
T0* GE_new678(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T678);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 678;
	}
	return R;
}

/* New instance of type ET_REGULAR_INTEGER_CONSTANT */
T0* GE_new679(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T679);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 679;
	}
	return R;
}

/* New instance of type ET_UNDERSCORED_INTEGER_CONSTANT */
T0* GE_new680(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T680);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 680;
	}
	return R;
}

/* New instance of type ET_HEXADECIMAL_INTEGER_CONSTANT */
T0* GE_new681(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T681);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 681;
	}
	return R;
}

/* New instance of type ET_OCTAL_INTEGER_CONSTANT */
T0* GE_new682(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T682);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 682;
	}
	return R;
}

/* New instance of type ET_BINARY_INTEGER_CONSTANT */
T0* GE_new683(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T683);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 683;
	}
	return R;
}

/* New instance of type ET_REGULAR_REAL_CONSTANT */
T0* GE_new684(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T684);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 684;
	}
	return R;
}

/* New instance of type ET_UNDERSCORED_REAL_CONSTANT */
T0* GE_new685(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T685);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 685;
	}
	return R;
}

/* New instance of type ET_COMMENT */
T0* GE_new686(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T686);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 686;
	}
	return R;
}

/* New instance of type ET_TRUE_CONSTANT */
T0* GE_new687(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T687);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 687;
	}
	return R;
}

/* New instance of type ET_FALSE_CONSTANT */
T0* GE_new688(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T688);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 688;
	}
	return R;
}

/* New instance of type ET_C1_CHARACTER_CONSTANT */
T0* GE_new689(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T689);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 689;
	}
	return R;
}

/* New instance of type ET_C2_CHARACTER_CONSTANT */
T0* GE_new690(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T690);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 690;
	}
	return R;
}

/* New instance of type ET_TAGGED_NOTE */
T0* GE_new692(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T692);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 692;
	}
	return R;
}

/* New instance of type ET_NOTE */
T0* GE_new693(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T693);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 693;
	}
	return R;
}

/* New instance of type ET_CUSTOM_ATTRIBUTE */
T0* GE_new694(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T694);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 694;
	}
	return R;
}

/* New instance of type ET_CONSTRAINED_FORMAL_PARAMETER */
T0* GE_new695(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T695);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 695;
	}
	return R;
}

/* New instance of type ET_TYPE_RENAME_CONSTRAINT */
T0* GE_new696(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T696);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 696;
	}
	return R;
}

/* New instance of type ET_CONSTRAINT_NAMED_TYPE */
T0* GE_new697(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T697);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 697;
	}
	return R;
}

/* New instance of type ET_CONSTRAINT_LABELED_ACTUAL_PARAMETER */
T0* GE_new698(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T698);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 698;
	}
	return R;
}

/* New instance of type ET_CONSTRAINT_LABELED_COMMA_ACTUAL_PARAMETER */
T0* GE_new699(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T699);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 699;
	}
	return R;
}

/* New instance of type ET_RENAME */
T0* GE_new700(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T700);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 700;
	}
	return R;
}

/* New instance of type ET_ALL_EXPORT */
T0* GE_new701(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T701);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 701;
	}
	return R;
}

/* New instance of type ET_CONVERT_FUNCTION */
T0* GE_new703(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T703);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 703;
	}
	return R;
}

/* New instance of type ET_CONVERT_PROCEDURE */
T0* GE_new704(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T704);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 704;
	}
	return R;
}

/* New instance of type ET_ATTRIBUTE */
T0* GE_new706(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T706);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 706;
	}
	return R;
}

/* New instance of type ET_EXTENDED_ATTRIBUTE */
T0* GE_new707(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T707);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 707;
	}
	return R;
}

/* New instance of type ET_CONSTANT_ATTRIBUTE */
T0* GE_new708(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T708);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 708;
	}
	return R;
}

/* New instance of type ET_UNIQUE_ATTRIBUTE */
T0* GE_new709(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T709);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 709;
	}
	return R;
}

/* New instance of type ET_DO_FUNCTION */
T0* GE_new710(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T710);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 710;
	}
	return R;
}

/* New instance of type ET_ONCE_FUNCTION */
T0* GE_new711(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T711);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 711;
	}
	return R;
}

/* New instance of type ET_DEFERRED_FUNCTION */
T0* GE_new712(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T712);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 712;
	}
	return R;
}

/* New instance of type ET_EXTERNAL_FUNCTION */
T0* GE_new714(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T714);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 714;
	}
	return R;
}

/* New instance of type ET_DO_PROCEDURE */
T0* GE_new715(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T715);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 715;
	}
	return R;
}

/* New instance of type ET_ONCE_PROCEDURE */
T0* GE_new716(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T716);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 716;
	}
	return R;
}

/* New instance of type ET_DEFERRED_PROCEDURE */
T0* GE_new717(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T717);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 717;
	}
	return R;
}

/* New instance of type ET_EXTERNAL_PROCEDURE */
T0* GE_new718(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T718);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 718;
	}
	return R;
}

/* New instance of type ET_ALIASED_FEATURE_NAME */
T0* GE_new719(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T719);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 719;
	}
	return R;
}

/* New instance of type ET_ALIAS_FREE_NAME */
T0* GE_new720(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T720);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 720;
	}
	return R;
}

/* New instance of type ET_CLASS_ASSERTION */
T0* GE_new723(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T723);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 723;
	}
	return R;
}

/* New instance of type ET_LABELED_ACTUAL_PARAMETER */
T0* GE_new724(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T724);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 724;
	}
	return R;
}

/* New instance of type ET_LIKE_FEATURE */
T0* GE_new726(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T726);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 726;
	}
	return R;
}

/* New instance of type ET_QUALIFIED_LIKE_BRACED_TYPE */
T0* GE_new728(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T728);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 728;
	}
	return R;
}

/* New instance of type ET_QUALIFIED_LIKE_TYPE */
T0* GE_new729(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T729);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 729;
	}
	return R;
}

/* New instance of type ET_ASSIGNER_INSTRUCTION */
T0* GE_new730(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T730);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 730;
	}
	return R;
}

/* New instance of type ET_ASSIGNMENT */
T0* GE_new731(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T731);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 731;
	}
	return R;
}

/* New instance of type ET_ASSIGNMENT_ATTEMPT */
T0* GE_new732(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T732);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 732;
	}
	return R;
}

/* New instance of type ET_LOOP_INSTRUCTION */
T0* GE_new733(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T733);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 733;
	}
	return R;
}

/* New instance of type ET_BANG_INSTRUCTION */
T0* GE_new735(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T735);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 735;
	}
	return R;
}

/* New instance of type ET_QUALIFIED_CALL */
T0* GE_new736(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T736);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 736;
	}
	return R;
}

/* New instance of type ET_CREATE_INSTRUCTION */
T0* GE_new738(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T738);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 738;
	}
	return R;
}

/* New instance of type ET_CHOICE_RANGE */
T0* GE_new739(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T739);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 739;
	}
	return R;
}

/* New instance of type ET_QUALIFIED_CALL_INSTRUCTION */
T0* GE_new740(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T740);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 740;
	}
	return R;
}

/* New instance of type ET_PRECURSOR_INSTRUCTION */
T0* GE_new741(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T741);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 741;
	}
	return R;
}

/* New instance of type ET_STATIC_CALL_INSTRUCTION */
T0* GE_new743(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T743);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 743;
	}
	return R;
}

/* New instance of type ET_PRECURSOR_EXPRESSION */
T0* GE_new744(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T744);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 744;
	}
	return R;
}

/* New instance of type ET_FEATURE_ADDRESS */
T0* GE_new745(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T745);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 745;
	}
	return R;
}

/* New instance of type ET_CURRENT_ADDRESS */
T0* GE_new746(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T746);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 746;
	}
	return R;
}

/* New instance of type ET_RESULT_ADDRESS */
T0* GE_new747(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T747);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 747;
	}
	return R;
}

/* New instance of type ET_EXPRESSION_ADDRESS */
T0* GE_new748(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T748);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 748;
	}
	return R;
}

/* New instance of type ET_INFIX_EXPRESSION */
T0* GE_new749(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T749);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 749;
	}
	return R;
}

/* New instance of type ET_INFIX_AND_THEN_OPERATOR */
T0* GE_new750(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T750);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 750;
	}
	return R;
}

/* New instance of type ET_INFIX_OR_ELSE_OPERATOR */
T0* GE_new751(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T751);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 751;
	}
	return R;
}

/* New instance of type ET_EQUALITY_EXPRESSION */
T0* GE_new752(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T752);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 752;
	}
	return R;
}

/* New instance of type ET_OBJECT_EQUALITY_EXPRESSION */
T0* GE_new753(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T753);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 753;
	}
	return R;
}

/* New instance of type ET_MANIFEST_TYPE */
T0* GE_new754(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T754);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 754;
	}
	return R;
}

/* New instance of type ET_PREFIX_EXPRESSION */
T0* GE_new755(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T755);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 755;
	}
	return R;
}

/* New instance of type ET_OLD_EXPRESSION */
T0* GE_new756(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T756);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 756;
	}
	return R;
}

/* New instance of type ET_OLD_OBJECT_TEST */
T0* GE_new757(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T757);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 757;
	}
	return R;
}

/* New instance of type ET_OBJECT_TEST */
T0* GE_new758(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T758);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 758;
	}
	return R;
}

/* New instance of type ET_NAMED_OBJECT_TEST */
T0* GE_new759(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T759);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 759;
	}
	return R;
}

/* New instance of type ET_ONCE_MANIFEST_STRING */
T0* GE_new760(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T760);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 760;
	}
	return R;
}

/* New instance of type ET_ITERATION_CURSOR */
T0* GE_new761(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T761);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 761;
	}
	return R;
}

/* New instance of type ET_DO_FUNCTION_INLINE_AGENT */
T0* GE_new763(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T763);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 763;
	}
	return R;
}

/* New instance of type ET_ONCE_FUNCTION_INLINE_AGENT */
T0* GE_new764(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T764);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 764;
	}
	return R;
}

/* New instance of type ET_EXTERNAL_FUNCTION_INLINE_AGENT */
T0* GE_new765(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T765);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 765;
	}
	return R;
}

/* New instance of type ET_DO_PROCEDURE_INLINE_AGENT */
T0* GE_new766(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T766);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 766;
	}
	return R;
}

/* New instance of type ET_ONCE_PROCEDURE_INLINE_AGENT */
T0* GE_new767(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T767);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 767;
	}
	return R;
}

/* New instance of type ET_EXTERNAL_PROCEDURE_INLINE_AGENT */
T0* GE_new768(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T768);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 768;
	}
	return R;
}

/* New instance of type ET_AGENT_OPEN_TARGET */
T0* GE_new769(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T769);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 769;
	}
	return R;
}

/* New instance of type ET_AGENT_TYPED_OPEN_ARGUMENT */
T0* GE_new770(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T770);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 770;
	}
	return R;
}

/* New instance of type ET_QUERY_LIST */
T0* GE_new773(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T773);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 773;
	}
	return R;
}

/* New instance of type ET_PROCEDURE_LIST */
T0* GE_new774(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T774);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 774;
	}
	return R;
}

/* New instance of type ET_TAGGED_ASSERTION */
T0* GE_new776(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T776);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 776;
	}
	return R;
}

/* New instance of type ET_FILE_POSITION */
T0* GE_new778(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T778);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 778;
	}
	return R;
}

/* New instance of type SPECIAL [ET_CLASS] */
T0* GE_new779(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T779)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 779;
		((T779*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_CLASS] */
T0* GE_new780(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T780);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 780;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_CLASS] */
T0* GE_new781(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T781);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 781;
	}
	return R;
}

/* New instance of type ET_BASE_TYPE_LIST */
T0* GE_new782(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T782);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 782;
	}
	return R;
}

/* New instance of type ET_CLASS_CODES */
T0* GE_new783(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T783);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 783;
	}
	return R;
}

/* New instance of type ET_ECF_AST_FACTORY */
T0* GE_new784(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T784);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 784;
	}
	return R;
}

/* New instance of type DS_CELL [detachable ET_ECF_SYSTEM] */
T0* GE_new785(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T785);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 785;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_TARGET] */
T0* GE_new786(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T786);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 786;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_ECF_TARGET]] */
T0* GE_new787(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T787);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 787;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_SYSTEM_PARSER] */
T0* GE_new788(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T788);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 788;
	}
	return R;
}

/* New instance of type XM_ELEMENT */
T0* GE_new789(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T789);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 789;
	}
	return R;
}

/* New instance of type XM_POSITION_TABLE */
T0* GE_new790(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T790);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 790;
	}
	return R;
}

/* New instance of type TUPLE [XM_ELEMENT, detachable XM_POSITION_TABLE, STRING_8] */
T0* GE_new791(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T791);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 791;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [XM_ELEMENT, detachable XM_POSITION_TABLE, STRING_8]] */
T0* GE_new792(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T792);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 792;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_SYSTEM_PARSER, detachable STRING_8, PROCEDURE [TUPLE [ET_ECF_TARGET]], DS_CELL [detachable ET_ECF_SYSTEM]] */
T0* GE_new793(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T793);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 793;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_ECF_LIBRARY, STRING_8] */
T0* GE_new795(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T795);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 795;
	}
	return R;
}

/* New instance of type KL_CASE_INSENSITIVE_STRING_EQUALITY_TESTER */
T0* GE_new796(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T796);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 796;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_ECF_DOTNET_ASSEMBLY, STRING_8] */
T0* GE_new797(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T797);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 797;
	}
	return R;
}

/* New instance of type XM_EIFFEL_PARSER */
T0* GE_new799(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T799);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 799;
	}
	return R;
}

/* New instance of type XM_TREE_CALLBACKS_PIPE */
T0* GE_new800(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T800);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 800;
	}
	return R;
}

/* New instance of type XM_CALLBACKS_TO_TREE_FILTER */
T0* GE_new803(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T803);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 803;
	}
	return R;
}

/* New instance of type ET_ECF_STATE */
T0* GE_new804(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T804);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 804;
	}
	return R;
}

/* New instance of type ET_ECF_SYSTEM_CONFIG */
T0* GE_new805(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T805);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 805;
	}
	return R;
}

/* New instance of type ET_ECF_LIBRARY */
T0* GE_new806(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T806);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 806;
	}
	return R;
}

/* New instance of type TUPLE [ET_ADAPTED_LIBRARY] */
T0* GE_new808(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T808);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 808;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_ADAPTED_LIBRARY]] */
T0* GE_new809(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T809);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 809;
	}
	return R;
}

/* New instance of type XM_DOCUMENT */
T0* GE_new810(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T810);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 810;
	}
	return R;
}

/* New instance of type ET_COMPRESSED_POSITION */
T0* GE_new811(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T811);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 811;
	}
	return R;
}

/* New instance of type XM_STOP_ON_ERROR_FILTER */
T0* GE_new813(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T813);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 813;
	}
	return R;
}

/* New instance of type XM_ATTRIBUTE */
T0* GE_new814(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T814);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 814;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_ECF_SYSTEM_CONFIG, STRING_8] */
T0* GE_new815(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T815);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 815;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_ECF_TARGET, STRING_8] */
T0* GE_new816(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T816);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 816;
	}
	return R;
}

/* New instance of type ET_ECF_TARGET_PARENT */
T0* GE_new817(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T817);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 817;
	}
	return R;
}

/* New instance of type DS_CELL [detachable ET_ECF_SYSTEM_CONFIG] */
T0* GE_new818(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T818);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 818;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_SYSTEM_PARSER, ET_ECF_INTERNAL_UNIVERSE, DS_CELL [detachable ET_ECF_SYSTEM_CONFIG]] */
T0* GE_new819(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T819);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 819;
	}
	return R;
}

/* New instance of type ET_ECF_TARGETS */
T0* GE_new820(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T820);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 820;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING_8] */
T0* GE_new821(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T821);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 821;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [detachable RX_REGULAR_EXPRESSION, STRING_8] */
T0* GE_new822(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T822);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 822;
	}
	return R;
}

/* New instance of type DS_CELL [detachable ET_ECF_LIBRARY] */
T0* GE_new824(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T824);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 824;
	}
	return R;
}

/* New instance of type ET_ECF_ADAPTED_LIBRARY */
T0* GE_new825(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T825);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 825;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_SYSTEM_PARSER, ET_ECF_ADAPTED_LIBRARY, DS_CELL [detachable ET_ECF_LIBRARY]] */
T0* GE_new826(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T826);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 826;
	}
	return R;
}

/* New instance of type ET_ECF_DOTNET_ASSEMBLY */
T0* GE_new828(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T828);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 828;
	}
	return R;
}

/* New instance of type ET_ECF_ADAPTED_DOTNET_ASSEMBLY */
T0* GE_new830(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T830);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 830;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [STRING_8, STRING_8] */
T0* GE_new831(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T831);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 831;
	}
	return R;
}

/* New instance of type ET_ECF_ERROR */
T0* GE_new832(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T832);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 832;
	}
	return R;
}

/* New instance of type ET_ECF_OPTIONS */
T0* GE_new833(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T833);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 833;
	}
	return R;
}

/* New instance of type ET_ECF_CLUSTERS */
T0* GE_new834(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T834);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 834;
	}
	return R;
}

/* New instance of type KL_AGENT_HASH_FUNCTION [STRING_8] */
T0* GE_new835(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T835);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 835;
	}
	return R;
}

/* New instance of type TUPLE [STRING_8] */
T0* GE_new836(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T836);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 836;
	}
	return R;
}

/* New instance of type FUNCTION [TUPLE [STRING_8], INTEGER_32] */
T0* GE_new837(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T837);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 837;
	}
	return R;
}

/* New instance of type TUPLE [KL_STRING_ROUTINES] */
T0* GE_new838(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T838);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 838;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_IDENTIFIER, STRING_8] */
T0* GE_new840(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T840);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 840;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_CLUSTER] */
T0* GE_new842(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T842);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 842;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_PRIMARY_TYPE */
T0* GE_new843(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T843);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 843;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_FEATURE_LIST */
T0* GE_new844(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T844);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 844;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_DYNAMIC_PRIMARY_TYPE, STRING_8] */
T0* GE_new845(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T845);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 845;
	}
	return R;
}

/* New instance of type TUPLE [INTEGER_32] */
T0* GE_new846(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T846);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 846;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_NULL_TYPE_SET_BUILDER */
T0* GE_new847(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T847);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 847;
	}
	return R;
}

/* New instance of type TUPLE [ET_DYNAMIC_SYSTEM] */
T0* GE_new848(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T848);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 848;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_FEATURE */
T0* GE_new850(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T850);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 850;
	}
	return R;
}

/* New instance of type ET_NESTED_TYPE_CONTEXT */
T0* GE_new852(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T852);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 852;
	}
	return R;
}

/* New instance of type ET_FORMAL_PARAMETER_TYPE */
T0* GE_new853(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T853);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 853;
	}
	return R;
}

/* New instance of type ARRAY [ET_TYPE] */
T0* GE_new854(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T854);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 854;
	}
	return R;
}

/* New instance of type SPECIAL [ET_TYPE] */
T0* GE_new855(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T855)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 855;
		((T855*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type ET_SYSTEM_MULTIPROCESSOR */
T0* GE_new858(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T858);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 858;
	}
	return R;
}

/* New instance of type DS_HASH_SET_CURSOR [STRING_8] */
T0* GE_new859(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T859);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 859;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [STRING_8] */
T0* GE_new860(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T860);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 860;
	}
	return R;
}

/* New instance of type ET_FEATURE_CHECKER */
T0* GE_new862(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T862);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 862;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_TYPE_SET_LIST */
T0* GE_new863(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T863);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 863;
	}
	return R;
}

/* New instance of type DS_HASH_SET [ET_FEATURE] */
T0* GE_new864(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T864);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 864;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_PRECURSOR */
T0* GE_new865(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T865);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 865;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_PRECURSOR_LIST */
T0* GE_new866(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T866);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 866;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_DYNAMIC_TYPE_SET, ET_DYNAMIC_TYPE] */
T0* GE_new867(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T867);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 867;
	}
	return R;
}

/* New instance of type ET_TYPE_CHECKER */
T0* GE_new869(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T869);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 869;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_INLINE_AGENT] */
T0* GE_new872(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T872);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 872;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [DS_ARRAYED_LIST [ET_PROCEDURE]] */
T0* GE_new873(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T873);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 873;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [DS_ARRAYED_LIST [ET_QUERY]] */
T0* GE_new874(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T874);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 874;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [DS_ARRAYED_LIST [ET_FEATURE]] */
T0* GE_new875(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T875);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 875;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [TUPLE [detachable ET_QUERY, ET_CLASS, ET_NESTED_TYPE_CONTEXT]] */
T0* GE_new876(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T876);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 876;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_NESTED_TYPE_CONTEXT] */
T0* GE_new877(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T877);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 877;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_NESTED_TYPE_CONTEXT, ET_NAMED_OBJECT_TEST] */
T0* GE_new878(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T878);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 878;
	}
	return R;
}

/* New instance of type ET_OBJECT_TEST_SCOPE */
T0* GE_new879(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T879);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 879;
	}
	return R;
}

/* New instance of type ET_OBJECT_TEST_SCOPE_BUILDER */
T0* GE_new880(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T880);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 880;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_NESTED_TYPE_CONTEXT, ET_ITERATION_COMPONENT] */
T0* GE_new881(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T881);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 881;
	}
	return R;
}

/* New instance of type ET_ITERATION_ITEM_SCOPE */
T0* GE_new882(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T882);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 882;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_NESTED_TYPE_CONTEXT, ET_INLINE_SEPARATE_ARGUMENT] */
T0* GE_new883(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T883);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 883;
	}
	return R;
}

/* New instance of type ET_INLINE_SEPARATE_ARGUMENT_SCOPE */
T0* GE_new884(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T884);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 884;
	}
	return R;
}

/* New instance of type ET_ATTACHMENT_SCOPE */
T0* GE_new885(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T885);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 885;
	}
	return R;
}

/* New instance of type ET_ATTACHMENT_SCOPE_BUILDER */
T0* GE_new886(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T886);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 886;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ATTACHMENT_SCOPE] */
T0* GE_new887(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T887);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 887;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_ASSERTIONS, ET_FEATURE] */
T0* GE_new888(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T888);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 888;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_NOTE_TERM] */
T0* GE_new889(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T889);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 889;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [DS_ARRAYED_LIST [ET_ADAPTED_CLASS]] */
T0* GE_new890(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T890);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 890;
	}
	return R;
}

/* New instance of type ET_ADAPTED_BASE_CLASS_CHECKER */
T0* GE_new891(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T891);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 891;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_QUALIFIED_QUERY_CALL */
T0* GE_new893(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T893);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 893;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL */
T0* GE_new894(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T894);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 894;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_2 [ET_PRECONDITIONS, INTEGER_32] */
T0* GE_new896(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T896);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 896;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_2 [ET_POSTCONDITIONS, INTEGER_32] */
T0* GE_new897(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T897);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 897;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_2 [ET_INVARIANTS, INTEGER_32] */
T0* GE_new898(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T898);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 898;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_TUPLE_TYPE */
T0* GE_new904(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T904);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 904;
	}
	return R;
}

/* New instance of type ET_FEATURE_LIST */
T0* GE_new907(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T907);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 907;
	}
	return R;
}

/* New instance of type NATIVE_STRING */
T0* GE_new909(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T909);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 909;
	}
	return R;
}

/* New instance of type HASH_TABLE [NATIVE_STRING, IMMUTABLE_STRING_32] */
T0* GE_new910(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T910);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 910;
	}
	return R;
}

/* New instance of type RX_BYTE_CODE */
T0* GE_new912(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T912);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 912;
	}
	return R;
}

/* New instance of type RX_CHARACTER_SET */
T0* GE_new913(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T913);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 913;
	}
	return R;
}

/* New instance of type RX_CASE_MAPPING */
T0* GE_new914(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T914);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 914;
	}
	return R;
}

/* New instance of type UC_UNICODE_ROUTINES */
T0* GE_new916(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T916);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 916;
	}
	return R;
}

/* New instance of type ARRAY [RX_CHARACTER_SET] */
T0* GE_new917(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T917);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 917;
	}
	return R;
}

/* New instance of type SPECIAL [RX_CHARACTER_SET] */
T0* GE_new918(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T918)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 918;
		((T918*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type UC_STRING */
T0* GE_new919(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T919);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 919;
	}
	return R;
}

/* New instance of type DS_LINKED_LIST_CURSOR [STRING_8] */
T0* GE_new920(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T920);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 920;
	}
	return R;
}

/* New instance of type DS_HASH_SET [NATURAL_32] */
T0* GE_new921(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T921);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 921;
	}
	return R;
}

/* New instance of type KL_STRING_OUTPUT_STREAM */
T0* GE_new922(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T922);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 922;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_OLD_EXPRESSION] */
T0* GE_new923(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T923);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 923;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_IDENTIFIER, ET_OLD_EXPRESSION] */
T0* GE_new924(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T924);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 924;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_IDENTIFIER] */
T0* GE_new925(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T925);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 925;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [detachable ET_DYNAMIC_PRIMARY_TYPE] */
T0* GE_new926(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T926);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 926;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [BOOLEAN] */
T0* GE_new927(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T927);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 927;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_EQUALITY_EXPRESSION] */
T0* GE_new928(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T928);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 928;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_DYNAMIC_EQUALITY_TYPES] */
T0* GE_new929(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T929);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 929;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_DYNAMIC_OBJECT_EQUALITY_TYPES] */
T0* GE_new930(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T930);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 930;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_UNQUALIFIED_CALL_EXPRESSION] */
T0* GE_new931(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T931);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 931;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_QUALIFIED_CALL_EXPRESSION] */
T0* GE_new932(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T932);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 932;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ACTUAL_ARGUMENT_LIST] */
T0* GE_new933(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T933);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 933;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_RESULT] */
T0* GE_new934(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T934);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 934;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_PRIMARY_TYPE_HASH_LIST */
T0* GE_new935(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T935);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 935;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_STANDALONE_TYPE_SET */
T0* GE_new936(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T936);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 936;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_DYNAMIC_STANDALONE_TYPE_SET] */
T0* GE_new937(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T937);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 937;
	}
	return R;
}

/* New instance of type DS_ARRAYED_STACK [ET_EXPRESSION] */
T0* GE_new938(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T938);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 938;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_EXPRESSION] */
T0* GE_new939(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T939);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 939;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_DYNAMIC_PRIMARY_TYPE, INTEGER_32] */
T0* GE_new940(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T940);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 940;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_STANDALONE_TYPE_SET_LIST */
T0* GE_new941(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T941);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 941;
	}
	return R;
}

/* New instance of type DS_HASH_SET [ET_DYNAMIC_PRIMARY_TYPE] */
T0* GE_new942(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T942);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 942;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_DYNAMIC_STANDALONE_TYPE_SET, ET_DYNAMIC_PRIMARY_TYPE] */
T0* GE_new943(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T943);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 943;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_2 [ET_OBJECT_TEST, INTEGER_32] */
T0* GE_new944(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T944);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 944;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [INTEGER_32, INTEGER_32] */
T0* GE_new945(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T945);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 945;
	}
	return R;
}

/* New instance of type DS_HASH_SET [INTEGER_32] */
T0* GE_new946(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T946);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 946;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_2 [ET_AGENT, INTEGER_32] */
T0* GE_new947(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T947);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 947;
	}
	return R;
}

/* New instance of type ET_GENERAL_QUALIFIED_FEATURE_CALL_INSTRUCTION */
T0* GE_new948(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T948);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 948;
	}
	return R;
}

/* New instance of type ET_GENERAL_QUALIFIED_FEATURE_CALL_EXPRESSION */
T0* GE_new950(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T950);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 950;
	}
	return R;
}

/* New instance of type DS_HASH_SET [ET_DYNAMIC_TUPLE_TYPE] */
T0* GE_new951(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T951);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 951;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [INTEGER_32, ET_STANDALONE_CLOSURE] */
T0* GE_new952(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T952);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 952;
	}
	return R;
}

/* New instance of type ARRAY [INTEGER_32] */
T0* GE_new953(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T953);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 953;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_CONSTANT, ET_FEATURE] */
T0* GE_new954(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T954);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 954;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_DYNAMIC_PRIMARY_TYPE, ET_INLINE_CONSTANT] */
T0* GE_new955(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T955);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 955;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [detachable ET_DYNAMIC_FEATURE, ET_DYNAMIC_PRIMARY_TYPE] */
T0* GE_new956(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T956);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 956;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_DYNAMIC_INLINED_EXPRESSION] */
T0* GE_new957(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T957);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 957;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_DYNAMIC_CALL_CONTEXT] */
T0* GE_new958(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T958);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 958;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_DYNAMIC_FEATURE] */
T0* GE_new959(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T959);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 959;
	}
	return R;
}

/* New instance of type DS_HASH_SET [ET_DYNAMIC_FEATURE] */
T0* GE_new960(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T960);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 960;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [BOOLEAN, STRING_8] */
T0* GE_new961(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T961);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 961;
	}
	return R;
}

/* New instance of type DS_STRING_HASH_TABLE */
T0* GE_new962(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T962);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 962;
	}
	return R;
}

/* New instance of type KL_TEXT_OUTPUT_FILE */
T0* GE_new963(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T963);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 963;
	}
	GE_register_dispose(R,&T963f32);
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [STRING_8, STRING_8] */
T0* GE_new964(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T964);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 964;
	}
	return R;
}

/* New instance of type UT_UNDEFINED_ENVIRONMENT_VARIABLE_ERROR */
T0* GE_new965(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T965);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 965;
	}
	return R;
}

/* New instance of type UT_CANNOT_WRITE_TO_FILE_ERROR */
T0* GE_new966(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T966);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 966;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [DS_ARRAYED_LIST [STRING_8]] */
T0* GE_new967(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T967);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 967;
	}
	return R;
}

/* New instance of type DS_QUICK_SORTER [STRING_8] */
T0* GE_new968(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T968);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 968;
	}
	return R;
}

/* New instance of type UC_STRING_COMPARATOR */
T0* GE_new969(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T969);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 969;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [TUPLE [STRING_8, detachable STRING_8], STRING_8] */
T0* GE_new970(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T970);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 970;
	}
	return R;
}

/* New instance of type TUPLE [STRING_8, STRING_8] */
T0* GE_new973(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T973);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 973;
	}
	return R;
}

/* New instance of type DS_HASH_TOPOLOGICAL_SORTER [ET_DYNAMIC_PRIMARY_TYPE] */
T0* GE_new974(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T974);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 974;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_EQUALITY_TYPES */
T0* GE_new975(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T975);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 975;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_OBJECT_EQUALITY_TYPES */
T0* GE_new977(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T977);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 977;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_SPECIAL_TYPE */
T0* GE_new978(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T978);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 978;
	}
	return R;
}

/* New instance of type DS_QUICK_SORTER [ET_DYNAMIC_PRIMARY_TYPE] */
T0* GE_new980(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T980);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 980;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_SECONDARY_TYPE */
T0* GE_new981(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T981);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 981;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_PRIMARY_TYPE_COMPARATOR_BY_ID */
T0* GE_new982(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T982);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 982;
	}
	return R;
}

/* New instance of type DS_HASH_SET_CURSOR [ET_DYNAMIC_PRIMARY_TYPE] */
T0* GE_new988(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T988);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 988;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_INLINED_EXPRESSION */
T0* GE_new992(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T992);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 992;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_CALL_CONTEXT */
T0* GE_new993(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T993);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 993;
	}
	return R;
}

/* New instance of type DS_QUICK_SORTER [INTEGER_32] */
T0* GE_new994(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T994);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 994;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE] */
T0* GE_new996(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T996);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 996;
	}
	return R;
}

/* New instance of type TUPLE [ET_C_GENERATOR, ET_IDENTIFIER, ET_CURRENT, ET_DYNAMIC_PRIMARY_TYPE, BOOLEAN] */
T0* GE_new997(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T997);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 997;
	}
	return R;
}

/* New instance of type TUPLE [ET_C_GENERATOR, ET_IDENTIFIER, ET_RESULT, ET_DYNAMIC_PRIMARY_TYPE, BOOLEAN] */
T0* GE_new998(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T998);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 998;
	}
	return R;
}

/* New instance of type TUPLE [ET_C_GENERATOR, ET_DYNAMIC_FEATURE, ET_RESULT, ET_DYNAMIC_PRIMARY_TYPE, BOOLEAN] */
T0* GE_new999(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T999);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 999;
	}
	return R;
}

/* New instance of type TUPLE [ET_C_GENERATOR, INTEGER_32, ET_RESULT, ET_DYNAMIC_PRIMARY_TYPE, BOOLEAN] */
T0* GE_new1000(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1000);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1000;
	}
	return R;
}

/* New instance of type UT_INTEGER_FORMATTER */
T0* GE_new1001(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1001);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1001;
	}
	return R;
}

/* New instance of type TUPLE [ET_C_GENERATOR, INTEGER_32, ET_EXPRESSION, ET_DYNAMIC_PRIMARY_TYPE, BOOLEAN] */
T0* GE_new1006(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1006);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1006;
	}
	return R;
}

/* New instance of type TUPLE [ET_C_GENERATOR, ET_EXPRESSION, ET_DYNAMIC_PRIMARY_TYPE] */
T0* GE_new1007(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1007);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1007;
	}
	return R;
}

/* New instance of type TUPLE [ET_C_GENERATOR, ET_DYNAMIC_FEATURE, ET_DYNAMIC_PRIMARY_TYPE, BOOLEAN] */
T0* GE_new1011(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1011);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1011;
	}
	return R;
}

/* New instance of type TUPLE [ET_C_GENERATOR, ET_DYNAMIC_FEATURE, ET_EXPRESSION, ET_DYNAMIC_PRIMARY_TYPE, BOOLEAN] */
T0* GE_new1016(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1016);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1016;
	}
	return R;
}

/* New instance of type TUPLE [ET_C_GENERATOR, ET_DYNAMIC_FEATURE, INTEGER_32, INTEGER_32] */
T0* GE_new1017(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1017);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1017;
	}
	return R;
}

/* New instance of type SPECIAL [ET_DYNAMIC_PRIMARY_TYPE] */
T0* GE_new1018(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1018)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1018;
		((T1018*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_DYNAMIC_PRIMARY_TYPE] */
T0* GE_new1019(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1019);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1019;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_DYNAMIC_PRIMARY_TYPE] */
T0* GE_new1020(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1020);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1020;
	}
	return R;
}

/* New instance of type TUPLE [GECC, DS_ARRAYED_LIST [STRING_8], INTEGER_32, MUTEX] */
T0* GE_new1023(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1023);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1023;
	}
	return R;
}

/* New instance of type WORKER_THREAD */
T0* GE_new1024(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1024);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1024;
	}
	return R;
}

/* New instance of type PATH */
T0* GE_new1026(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1026);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1026;
	}
	return R;
}

/* New instance of type STRING_TO_INTEGER_CONVERTOR */
T0* GE_new1027(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1027);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1027;
	}
	return R;
}

/* New instance of type STRING_8_SEARCHER */
T0* GE_new1029(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1029);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1029;
	}
	return R;
}

/* New instance of type STD_FILES */
T0* GE_new1031(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1031);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1031;
	}
	return R;
}

/* New instance of type HEXADECIMAL_STRING_TO_INTEGER_CONVERTER */
T0* GE_new1032(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1032);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1032;
	}
	return R;
}

/* New instance of type DT_SHARED_SYSTEM_CLOCK */
T0* GE_new1034(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1034);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1034;
	}
	return R;
}

/* New instance of type DT_SYSTEM_CLOCK */
T0* GE_new1035(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1035);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1035;
	}
	return R;
}

/* New instance of type DT_DATE_TIME_DURATION */
T0* GE_new1036(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1036);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1036;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [INTEGER_32, STRING_8] */
T0* GE_new1041(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1041);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1041;
	}
	return R;
}

/* New instance of type ET_CONSTRAINT_GENERIC_NAMED_TYPE */
T0* GE_new1044(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1044);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1044;
	}
	return R;
}

/* New instance of type ET_UNQUALIFIED_CALL_EXPRESSION */
T0* GE_new1045(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1045);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1045;
	}
	return R;
}

/* New instance of type ET_UNQUALIFIED_CALL_INSTRUCTION */
T0* GE_new1046(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1046);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1046;
	}
	return R;
}

/* New instance of type KL_ARRAY_ROUTINES [INTEGER_32] */
T0* GE_new1047(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1047);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1047;
	}
	return R;
}

/* New instance of type DS_CELL [detachable ET_ECF_CONFIG] */
T0* GE_new1050(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1050);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1050;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_SYSTEM_PARSER, ET_ECF_SYSTEM, DS_CELL [detachable ET_ECF_CONFIG]] */
T0* GE_new1052(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1052);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1052;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ECF_NOTE_ELEMENT] */
T0* GE_new1054(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1054);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1054;
	}
	return R;
}

/* New instance of type XM_NAMESPACE */
T0* GE_new1055(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1055);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1055;
	}
	return R;
}

/* New instance of type DS_LINKED_LIST_CURSOR [XM_ELEMENT_NODE] */
T0* GE_new1056(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1056);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1056;
	}
	return R;
}

/* New instance of type ET_ECF_REDIRECTION_CONFIG */
T0* GE_new1058(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1058);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1058;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_PROCEDURE_TYPE */
T0* GE_new1059(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1059);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1059;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_FUNCTION_TYPE */
T0* GE_new1060(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1060);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1060;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_PUSH_TYPE_SET */
T0* GE_new1061(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1061);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1061;
	}
	return R;
}

/* New instance of type KL_PLATFORM */
T0* GE_new1062(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1062);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1062;
	}
	return R;
}

/* New instance of type UT_CONFIG_PARSER */
T0* GE_new1063(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1063);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1063;
	}
	return R;
}

/* New instance of type KL_COMPARABLE_COMPARATOR [INTEGER_32] */
T0* GE_new1064(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1064);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1064;
	}
	return R;
}

/* New instance of type CELL [INTEGER_32] */
T0* GE_new1067(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1067);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1067;
	}
	return R;
}

/* New instance of type KL_PATHNAME */
T0* GE_new1069(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1069);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1069;
	}
	return R;
}

/* New instance of type KL_ANY_ROUTINES */
T0* GE_new1070(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1070);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1070;
	}
	return R;
}

/* New instance of type KL_WINDOWS_INPUT_FILE */
T0* GE_new1071(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1071);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1071;
	}
	GE_register_dispose(R,&T1071f32);
	return R;
}

/* New instance of type KL_UNIX_INPUT_FILE */
T0* GE_new1072(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1072);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1072;
	}
	GE_register_dispose(R,&T1072f32);
	return R;
}

/* New instance of type ARRAY [IMMUTABLE_STRING_32] */
T0* GE_new1073(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1073);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1073;
	}
	return R;
}

/* New instance of type SPECIAL [IMMUTABLE_STRING_32] */
T0* GE_new1074(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1074)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1074;
		((T1074*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type SPECIAL [NATURAL_8] */
T0* GE_new1075(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1075)+a1*sizeof(T8);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1075;
		((T1075*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type UC_UTF8_STRING */
T0* GE_new1078(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1078);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1078;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [STRING_8] */
T0* GE_new1079(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1079);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1079;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ADAPTED_LIBRARY] */
T0* GE_new1080(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1080);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1080;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ADAPTED_DOTNET_ASSEMBLY] */
T0* GE_new1081(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1081);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1081;
	}
	return R;
}

/* New instance of type SPECIAL [ET_MASTER_CLASS] */
T0* GE_new1082(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1082)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1082;
		((T1082*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_MASTER_CLASS] */
T0* GE_new1085(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1085);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1085;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_CLASS_NAME] */
T0* GE_new1086(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1086);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1086;
	}
	return R;
}

/* New instance of type SPECIAL [ET_CLASS_NAME] */
T0* GE_new1087(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1087)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1087;
		((T1087*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_MASTER_CLASS, ET_CLASS_NAME] */
T0* GE_new1088(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1088);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1088;
	}
	return R;
}

/* New instance of type SPECIAL [ET_PARENT_ITEM] */
T0* GE_new1090(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1090)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1090;
		((T1090*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_PARENT_ITEM] */
T0* GE_new1091(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1091);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1091;
	}
	return R;
}

/* New instance of type SPECIAL [ET_CLIENT_ITEM] */
T0* GE_new1092(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1092)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1092;
		((T1092*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_CLIENT_ITEM] */
T0* GE_new1093(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1093);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1093;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ACTUAL_PARAMETER_ITEM] */
T0* GE_new1094(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1094)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1094;
		((T1094*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ACTUAL_PARAMETER_ITEM] */
T0* GE_new1096(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1096);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1096;
	}
	return R;
}

/* New instance of type ET_BRACED_TYPE_LIST */
T0* GE_new1097(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1097);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1097;
	}
	return R;
}

/* New instance of type DS_HASH_SET_CURSOR [ET_UNIVERSE] */
T0* GE_new1098(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1098);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1098;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_UNIVERSE] */
T0* GE_new1100(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1100);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1100;
	}
	return R;
}

/* New instance of type SPECIAL [ET_UNIVERSE] */
T0* GE_new1101(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1101)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1101;
		((T1101*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_MASTER_CLASS] */
T0* GE_new1102(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1102);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1102;
	}
	return R;
}

/* New instance of type TUPLE [ET_MASTER_CLASS] */
T0* GE_new1103(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1103);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1103;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_MASTER_CLASS]] */
T0* GE_new1104(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1104);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1104;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [AP_OPTION] */
T0* GE_new1105(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1105);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1105;
	}
	return R;
}

/* New instance of type SPECIAL [AP_OPTION] */
T0* GE_new1107(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1107)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1107;
		((T1107*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [AP_OPTION] */
T0* GE_new1108(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1108);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1108;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST] */
T0* GE_new1109(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1109);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1109;
	}
	return R;
}

/* New instance of type SPECIAL [AP_ALTERNATIVE_OPTIONS_LIST] */
T0* GE_new1110(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1110)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1110;
		((T1110*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [AP_ALTERNATIVE_OPTIONS_LIST] */
T0* GE_new1111(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1111);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1111;
	}
	return R;
}

/* New instance of type SPECIAL [detachable STRING_8] */
T0* GE_new1112(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1112)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1112;
		((T1112*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable STRING_8] */
T0* GE_new1113(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1113);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1113;
	}
	return R;
}

/* New instance of type DS_LINKABLE [STRING_8] */
T0* GE_new1114(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1114);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1114;
	}
	return R;
}

/* New instance of type DS_LINKABLE [BOOLEAN] */
T0* GE_new1115(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1115);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1115;
	}
	return R;
}

/* New instance of type DS_LINKED_LIST_CURSOR [BOOLEAN] */
T0* GE_new1116(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1116);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1116;
	}
	return R;
}

/* New instance of type DS_LINKABLE [INTEGER_32] */
T0* GE_new1117(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1117);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1117;
	}
	return R;
}

/* New instance of type DS_LINKED_LIST_CURSOR [INTEGER_32] */
T0* GE_new1118(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1118);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1118;
	}
	return R;
}

/* New instance of type YY_FILE_BUFFER */
T0* GE_new1120(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1120);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1120;
	}
	return R;
}

/* New instance of type DS_HASH_TOPOLOGICAL_SORTER [ET_CLASS] */
T0* GE_new1121(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1121);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1121;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_BASE_TYPE, ET_CLASS] */
T0* GE_new1122(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1122);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1122;
	}
	return R;
}

/* New instance of type ET_PARENT_CHECKER1 */
T0* GE_new1123(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1123);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1123;
	}
	return R;
}

/* New instance of type ET_FORMAL_PARAMETER_CHECKER1 */
T0* GE_new1124(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1124);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1124;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_FEATURE_NAME] */
T0* GE_new1125(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1125);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1125;
	}
	return R;
}

/* New instance of type ET_FEATURE_NAME_TESTER */
T0* GE_new1126(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1126);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1126;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_FLATTENED_FEATURE, ET_ALIAS_NAME] */
T0* GE_new1128(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1128);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1128;
	}
	return R;
}

/* New instance of type ET_ALIAS_NAME_TESTER */
T0* GE_new1129(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1129);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1129;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_CLIENT_LIST] */
T0* GE_new1131(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1131);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1131;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_CLIENT, ET_CLASS] */
T0* GE_new1132(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1132);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1132;
	}
	return R;
}

/* New instance of type ET_FEATURE_ADAPTATION_RESOLVER */
T0* GE_new1133(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1133);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1133;
	}
	return R;
}

/* New instance of type ET_DOTNET_FEATURE_ADAPTATION_RESOLVER */
T0* GE_new1134(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1134);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1134;
	}
	return R;
}

/* New instance of type ET_IDENTIFIER_TYPE_RESOLVER */
T0* GE_new1135(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1135);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1135;
	}
	return R;
}

/* New instance of type ET_UNFOLDED_TUPLE_ACTUAL_PARAMETERS_RESOLVER1 */
T0* GE_new1136(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1136);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1136;
	}
	return R;
}

/* New instance of type ET_ANCHORED_TYPE_CHECKER */
T0* GE_new1137(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1137);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1137;
	}
	return R;
}

/* New instance of type ET_SIGNATURE_CHECKER */
T0* GE_new1138(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1138);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1138;
	}
	return R;
}

/* New instance of type ET_PARENT_CHECKER2 */
T0* GE_new1139(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1139);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1139;
	}
	return R;
}

/* New instance of type ET_FORMAL_PARAMETER_CHECKER2 */
T0* GE_new1140(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1140);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1140;
	}
	return R;
}

/* New instance of type ET_BUILTIN_FEATURE_CHECKER */
T0* GE_new1141(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1141);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1141;
	}
	return R;
}

/* New instance of type ET_PRECURSOR_CHECKER */
T0* GE_new1142(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1142);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1142;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_FEATURE, INTEGER_32] */
T0* GE_new1143(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1143);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1143;
	}
	return R;
}

/* New instance of type DS_HASH_SET [ET_CLASS] */
T0* GE_new1144(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1144);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1144;
	}
	return R;
}

/* New instance of type ET_QUALIFIED_ANCHORED_TYPE_CHECKER */
T0* GE_new1145(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1145);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1145;
	}
	return R;
}

/* New instance of type ET_UNFOLDED_TUPLE_ACTUAL_PARAMETERS_RESOLVER2 */
T0* GE_new1146(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1146);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1146;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_RENAME, ET_FEATURE_NAME] */
T0* GE_new1147(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1147);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1147;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_RENAME, ET_ALIAS_NAME] */
T0* GE_new1148(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1148);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1148;
	}
	return R;
}

/* New instance of type ET_PARENT_CHECKER3 */
T0* GE_new1149(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1149);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1149;
	}
	return R;
}

/* New instance of type DS_HASH_SET [ET_PROCEDURE] */
T0* GE_new1150(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1150);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1150;
	}
	return R;
}

/* New instance of type DS_HASH_SET [ET_QUERY] */
T0* GE_new1151(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1151);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1151;
	}
	return R;
}

/* New instance of type ET_SUPPLIER_BUILDER */
T0* GE_new1152(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1152);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1152;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [INTEGER_32] */
T0* GE_new1153(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1153);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1153;
	}
	return R;
}

/* New instance of type YY_UNICODE_BUFFER */
T0* GE_new1155(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1155);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1155;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_OBJECT_TEST_LIST] */
T0* GE_new1156(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1156)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1156;
		((T1156*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_OBJECT_TEST_LIST] */
T0* GE_new1157(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1157);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1157;
	}
	return R;
}

/* New instance of type SPECIAL [ET_OBJECT_TEST_LIST] */
T0* GE_new1158(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1158)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1158;
		((T1158*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_OBJECT_TEST_LIST] */
T0* GE_new1159(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1159);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1159;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_ITERATION_COMPONENT_LIST] */
T0* GE_new1160(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1160)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1160;
		((T1160*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_ITERATION_COMPONENT_LIST] */
T0* GE_new1161(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1161);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1161;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ITERATION_COMPONENT_LIST] */
T0* GE_new1162(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1162)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1162;
		((T1162*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ITERATION_COMPONENT_LIST] */
T0* GE_new1163(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1163);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1163;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_INLINE_SEPARATE_ARGUMENT_LIST] */
T0* GE_new1164(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1164)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1164;
		((T1164*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_INLINE_SEPARATE_ARGUMENT_LIST] */
T0* GE_new1165(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1165);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1165;
	}
	return R;
}

/* New instance of type SPECIAL [ET_INLINE_SEPARATE_ARGUMENT_LIST] */
T0* GE_new1166(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1166)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1166;
		((T1166*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_INLINE_SEPARATE_ARGUMENT_LIST] */
T0* GE_new1167(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1167);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1167;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ASSERTION_ITEM] */
T0* GE_new1168(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1168)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1168;
		((T1168*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ASSERTION_ITEM] */
T0* GE_new1169(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1169);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1169;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ASSERTION_ITEM] */
T0* GE_new1170(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1170);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1170;
	}
	return R;
}

/* New instance of type SPECIAL [ET_QUERY] */
T0* GE_new1171(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1171)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1171;
		((T1171*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_QUERY] */
T0* GE_new1172(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1172);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1172;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_QUERY] */
T0* GE_new1173(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1173);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1173;
	}
	return R;
}

/* New instance of type SPECIAL [ET_PROCEDURE] */
T0* GE_new1174(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1174)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1174;
		((T1174*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_PROCEDURE] */
T0* GE_new1175(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1175);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1175;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_PROCEDURE] */
T0* GE_new1176(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1176);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1176;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [detachable ET_CONSTRAINT_TYPE] */
T0* GE_new1177(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1177);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1177;
	}
	return R;
}

/* New instance of type DS_HASH_SET_CURSOR [ET_NAMED_CLASS] */
T0* GE_new1178(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1178);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1178;
	}
	return R;
}

/* New instance of type SPECIAL [ET_NAMED_CLASS] */
T0* GE_new1179(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1179)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1179;
		((T1179*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_NAMED_CLASS] */
T0* GE_new1180(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1180);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1180;
	}
	return R;
}

/* New instance of type SPECIAL [ET_EXPRESSION_ITEM] */
T0* GE_new1182(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1182)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1182;
		((T1182*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_EXPRESSION_ITEM] */
T0* GE_new1184(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1184);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1184;
	}
	return R;
}

/* New instance of type SPECIAL [ET_INSTRUCTION] */
T0* GE_new1186(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1186)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1186;
		((T1186*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_INSTRUCTION] */
T0* GE_new1187(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1187);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1187;
	}
	return R;
}

/* New instance of type SPECIAL [ET_INLINE_SEPARATE_ARGUMENT_ITEM] */
T0* GE_new1189(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1189)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1189;
		((T1189*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_INLINE_SEPARATE_ARGUMENT_ITEM] */
T0* GE_new1190(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1190);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1190;
	}
	return R;
}

/* New instance of type SPECIAL [ET_NAMED_OBJECT_TEST] */
T0* GE_new1191(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1191)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1191;
		((T1191*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_NAMED_OBJECT_TEST] */
T0* GE_new1192(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1192);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1192;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ITERATION_COMPONENT] */
T0* GE_new1193(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1193)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1193;
		((T1193*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ITERATION_COMPONENT] */
T0* GE_new1194(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1194);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1194;
	}
	return R;
}

/* New instance of type SPECIAL [ET_INLINE_SEPARATE_ARGUMENT] */
T0* GE_new1195(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1195)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1195;
		((T1195*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_INLINE_SEPARATE_ARGUMENT] */
T0* GE_new1196(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1196);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1196;
	}
	return R;
}

/* New instance of type SPECIAL [ET_BASE_TYPE] */
T0* GE_new1197(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1197)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1197;
		((T1197*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_BASE_TYPE] */
T0* GE_new1198(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1198);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1198;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME] */
T0* GE_new1199(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1199);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1199;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_ECF_LIBRARY, STRING_8] */
T0* GE_new1200(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1200);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1200;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_LIBRARY] */
T0* GE_new1201(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1201)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1201;
		((T1201*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_LIBRARY] */
T0* GE_new1204(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1204);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1204;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_DOTNET_ASSEMBLY] */
T0* GE_new1205(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1205)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1205;
		((T1205*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_ECF_DOTNET_ASSEMBLY, STRING_8] */
T0* GE_new1208(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1208);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1208;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_DOTNET_ASSEMBLY] */
T0* GE_new1209(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1209);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1209;
	}
	return R;
}

/* New instance of type XM_EIFFEL_SCANNER */
T0* GE_new1210(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1210);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1210;
	}
	return R;
}

/* New instance of type XM_DEFAULT_POSITION */
T0* GE_new1211(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1211);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1211;
	}
	return R;
}

/* New instance of type DS_BILINKED_LIST [XM_POSITION] */
T0* GE_new1213(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1213);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1213;
	}
	return R;
}

/* New instance of type DS_LINKED_STACK [XM_EIFFEL_SCANNER] */
T0* GE_new1214(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1214);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1214;
	}
	return R;
}

/* New instance of type XM_CALLBACKS_NULL */
T0* GE_new1215(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1215);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1215;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [XM_EIFFEL_ENTITY_DEF, STRING_8] */
T0* GE_new1216(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1216);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1216;
	}
	return R;
}

/* New instance of type XM_NULL_EXTERNAL_RESOLVER */
T0* GE_new1218(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1218);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1218;
	}
	return R;
}

/* New instance of type XM_DTD_CALLBACKS_NULL */
T0* GE_new1220(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1220);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1220;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_PARSER_NAME] */
T0* GE_new1221(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1221);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1221;
	}
	return R;
}

/* New instance of type XM_EIFFEL_PARSER_NAME */
T0* GE_new1222(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1222);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1222;
	}
	return R;
}

/* New instance of type SPECIAL [XM_EIFFEL_PARSER_NAME] */
T0* GE_new1223(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1223)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1223;
		((T1223*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
T0* GE_new1224(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1224);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1224;
	}
	return R;
}

/* New instance of type DS_HASH_SET [XM_EIFFEL_PARSER_NAME] */
T0* GE_new1225(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1225);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1225;
	}
	return R;
}

/* New instance of type SPECIAL [DS_HASH_SET [XM_EIFFEL_PARSER_NAME]] */
T0* GE_new1226(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1226)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1226;
		((T1226*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_EXTERNAL_ID] */
T0* GE_new1227(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1227);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1227;
	}
	return R;
}

/* New instance of type XM_DTD_EXTERNAL_ID */
T0* GE_new1228(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1228);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1228;
	}
	return R;
}

/* New instance of type SPECIAL [XM_DTD_EXTERNAL_ID] */
T0* GE_new1229(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1229)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1229;
		((T1229*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_ELEMENT_CONTENT] */
T0* GE_new1230(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1230);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1230;
	}
	return R;
}

/* New instance of type XM_DTD_ELEMENT_CONTENT */
T0* GE_new1231(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1231);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1231;
	}
	return R;
}

/* New instance of type SPECIAL [XM_DTD_ELEMENT_CONTENT] */
T0* GE_new1232(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1232)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1232;
		((T1232*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
T0* GE_new1233(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1233);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1233;
	}
	return R;
}

/* New instance of type DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT] */
T0* GE_new1234(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1234);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1234;
	}
	return R;
}

/* New instance of type SPECIAL [DS_BILINKED_LIST [XM_DTD_ATTRIBUTE_CONTENT]] */
T0* GE_new1235(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1235)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1235;
		((T1235*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [XM_DTD_ATTRIBUTE_CONTENT] */
T0* GE_new1236(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1236);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1236;
	}
	return R;
}

/* New instance of type XM_DTD_ATTRIBUTE_CONTENT */
T0* GE_new1237(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1237);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1237;
	}
	return R;
}

/* New instance of type SPECIAL [XM_DTD_ATTRIBUTE_CONTENT] */
T0* GE_new1238(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1238)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1238;
		((T1238*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [DS_BILINKED_LIST [STRING_8]] */
T0* GE_new1239(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1239);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1239;
	}
	return R;
}

/* New instance of type DS_BILINKED_LIST [STRING_8] */
T0* GE_new1240(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1240);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1240;
	}
	return R;
}

/* New instance of type SPECIAL [DS_BILINKED_LIST [STRING_8]] */
T0* GE_new1241(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1241)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1241;
		((T1241*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [BOOLEAN] */
T0* GE_new1242(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1242);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1242;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_DECLARATION] */
T0* GE_new1243(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1243);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1243;
	}
	return R;
}

/* New instance of type XM_EIFFEL_DECLARATION */
T0* GE_new1244(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1244);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1244;
	}
	return R;
}

/* New instance of type SPECIAL [XM_EIFFEL_DECLARATION] */
T0* GE_new1245(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1245)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1245;
		((T1245*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type XM_EIFFEL_ENTITY_DEF */
T0* GE_new1248(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1248);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1248;
	}
	return R;
}

/* New instance of type XM_EIFFEL_SCANNER_DTD */
T0* GE_new1249(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1249);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1249;
	}
	return R;
}

/* New instance of type XM_EIFFEL_PE_ENTITY_DEF */
T0* GE_new1251(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1251);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1251;
	}
	return R;
}

/* New instance of type XM_NAMESPACE_RESOLVER */
T0* GE_new1252(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1252);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1252;
	}
	return R;
}

/* New instance of type ARRAY [XM_CALLBACKS_FILTER] */
T0* GE_new1253(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1253);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1253;
	}
	return R;
}

/* New instance of type SPECIAL [XM_CALLBACKS_FILTER] */
T0* GE_new1254(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1254)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1254;
		((T1254*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_HASH_SET [XM_NAMESPACE] */
T0* GE_new1255(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1255);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1255;
	}
	return R;
}

/* New instance of type XM_LINKED_LIST [XM_DOCUMENT_NODE] */
T0* GE_new1256(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1256);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1256;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_SYSTEM_CONFIG] */
T0* GE_new1259(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1259)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1259;
		((T1259*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_SYSTEM_CONFIG] */
T0* GE_new1261(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1261);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1261;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_ECF_SYSTEM_CONFIG, STRING_8] */
T0* GE_new1262(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1262);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1262;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_ECF_TARGET, STRING_8] */
T0* GE_new1263(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1263);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1263;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_TARGET] */
T0* GE_new1264(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1264)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1264;
		((T1264*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_TARGET] */
T0* GE_new1266(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1266);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1266;
	}
	return R;
}

/* New instance of type DS_SPARSE_TABLE_KEYS [detachable RX_REGULAR_EXPRESSION, STRING_8] */
T0* GE_new1268(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1268);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1268;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable RX_REGULAR_EXPRESSION] */
T0* GE_new1269(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1269);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1269;
	}
	return R;
}

/* New instance of type SPECIAL [detachable RX_REGULAR_EXPRESSION] */
T0* GE_new1270(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1270)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1270;
		((T1270*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type ET_DOTNET_ASSEMBLIES */
T0* GE_new1271(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1271);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1271;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_IDENTIFIER] */
T0* GE_new1275(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1275);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1275;
	}
	return R;
}

/* New instance of type SPECIAL [ET_IDENTIFIER] */
T0* GE_new1276(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1276)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1276;
		((T1276*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_IDENTIFIER, STRING_8] */
T0* GE_new1277(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1277);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1277;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_CLUSTER] */
T0* GE_new1278(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1278);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1278;
	}
	return R;
}

/* New instance of type SPECIAL [ET_CLUSTER] */
T0* GE_new1279(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1279)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1279;
		((T1279*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_CLUSTER] */
T0* GE_new1280(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1280);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1280;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_DYNAMIC_FEATURE, INTEGER_32] */
T0* GE_new1281(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1281);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1281;
	}
	return R;
}

/* New instance of type ET_FEATURE_IDS */
T0* GE_new1282(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1282);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1282;
	}
	return R;
}

/* New instance of type SPECIAL [ET_DYNAMIC_FEATURE] */
T0* GE_new1283(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1283)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1283;
		((T1283*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_DYNAMIC_FEATURE] */
T0* GE_new1284(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1284);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1284;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_DYNAMIC_PRIMARY_TYPE, STRING_8] */
T0* GE_new1286(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1286);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1286;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_DYNAMIC_QUALIFIED_QUERY_CALL, ET_CALL_NAME] */
T0* GE_new1287(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1287);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1287;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL, ET_CALL_NAME] */
T0* GE_new1288(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1288);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1288;
	}
	return R;
}

/* New instance of type ET_LIKE_N */
T0* GE_new1290(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1290);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1290;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_TYPE] */
T0* GE_new1291(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1291);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1291;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_SYSTEM_PROCESSOR] */
T0* GE_new1292(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1292);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1292;
	}
	return R;
}

/* New instance of type TUPLE [ET_SYSTEM_PROCESSOR, DS_ARRAYED_LIST [ET_CLASS]] */
T0* GE_new1293(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1293);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1293;
	}
	return R;
}

/* New instance of type SPECIAL [ET_DYNAMIC_TYPE_SET] */
T0* GE_new1294(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1294)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1294;
		((T1294*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_DYNAMIC_TYPE_SET] */
T0* GE_new1295(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1295);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1295;
	}
	return R;
}

/* New instance of type DS_HASH_SET_CURSOR [ET_FEATURE] */
T0* GE_new1296(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1296);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1296;
	}
	return R;
}

/* New instance of type SPECIAL [ET_FEATURE] */
T0* GE_new1297(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1297)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1297;
		((T1297*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_FEATURE] */
T0* GE_new1298(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1298);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1298;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ADAPTED_CLASS] */
T0* GE_new1300(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1300);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1300;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_INLINE_AGENT] */
T0* GE_new1301(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1301);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1301;
	}
	return R;
}

/* New instance of type SPECIAL [ET_INLINE_AGENT] */
T0* GE_new1302(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1302)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1302;
		((T1302*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_INLINE_AGENT] */
T0* GE_new1303(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1303);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1303;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [ET_PROCEDURE]] */
T0* GE_new1304(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1304);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1304;
	}
	return R;
}

/* New instance of type SPECIAL [DS_ARRAYED_LIST [ET_PROCEDURE]] */
T0* GE_new1305(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1305)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1305;
		((T1305*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [ET_PROCEDURE]] */
T0* GE_new1306(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1306);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1306;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [ET_QUERY]] */
T0* GE_new1307(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1307);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1307;
	}
	return R;
}

/* New instance of type SPECIAL [DS_ARRAYED_LIST [ET_QUERY]] */
T0* GE_new1308(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1308)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1308;
		((T1308*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [ET_QUERY]] */
T0* GE_new1309(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1309);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1309;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [ET_FEATURE]] */
T0* GE_new1310(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1310);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1310;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_FEATURE] */
T0* GE_new1311(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1311);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1311;
	}
	return R;
}

/* New instance of type SPECIAL [DS_ARRAYED_LIST [ET_FEATURE]] */
T0* GE_new1312(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1312)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1312;
		((T1312*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [ET_FEATURE]] */
T0* GE_new1313(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1313);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1313;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [TUPLE [detachable ET_QUERY, ET_CLASS, ET_NESTED_TYPE_CONTEXT]] */
T0* GE_new1314(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1314);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1314;
	}
	return R;
}

/* New instance of type TUPLE [detachable ET_QUERY, ET_CLASS, ET_NESTED_TYPE_CONTEXT] */
T0* GE_new1315(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1315);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1315;
	}
	return R;
}

/* New instance of type SPECIAL [TUPLE [detachable ET_QUERY, ET_CLASS, ET_NESTED_TYPE_CONTEXT]] */
T0* GE_new1316(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1316)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1316;
		((T1316*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [TUPLE [detachable ET_QUERY, ET_CLASS, ET_NESTED_TYPE_CONTEXT]] */
T0* GE_new1317(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1317);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1317;
	}
	return R;
}

/* New instance of type SPECIAL [ET_NESTED_TYPE_CONTEXT] */
T0* GE_new1318(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1318)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1318;
		((T1318*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_NESTED_TYPE_CONTEXT] */
T0* GE_new1319(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1319);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1319;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_NESTED_TYPE_CONTEXT] */
T0* GE_new1320(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1320);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1320;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_NESTED_TYPE_CONTEXT, ET_NAMED_OBJECT_TEST] */
T0* GE_new1321(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1321);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1321;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_NAMED_OBJECT_TEST] */
T0* GE_new1324(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1324);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1324;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_NESTED_TYPE_CONTEXT, ET_ITERATION_COMPONENT] */
T0* GE_new1325(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1325);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1325;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ITERATION_COMPONENT] */
T0* GE_new1327(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1327);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1327;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_NESTED_TYPE_CONTEXT, ET_INLINE_SEPARATE_ARGUMENT] */
T0* GE_new1329(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1329);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1329;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_INLINE_SEPARATE_ARGUMENT] */
T0* GE_new1330(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1330);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1330;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ATTACHMENT_SCOPE] */
T0* GE_new1332(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1332)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1332;
		((T1332*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ATTACHMENT_SCOPE] */
T0* GE_new1333(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1333);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1333;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ATTACHMENT_SCOPE] */
T0* GE_new1334(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1334);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1334;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_ASSERTIONS, ET_FEATURE] */
T0* GE_new1335(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1335);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1335;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ASSERTIONS] */
T0* GE_new1336(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1336)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1336;
		((T1336*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ASSERTIONS] */
T0* GE_new1338(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1338);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1338;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_NOTE_TERM] */
T0* GE_new1339(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1339);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1339;
	}
	return R;
}

/* New instance of type SPECIAL [ET_NOTE_TERM] */
T0* GE_new1340(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1340)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1340;
		((T1340*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_NOTE_TERM] */
T0* GE_new1341(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1341);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1341;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [ET_ADAPTED_CLASS]] */
T0* GE_new1342(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1342);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1342;
	}
	return R;
}

/* New instance of type SPECIAL [DS_ARRAYED_LIST [ET_ADAPTED_CLASS]] */
T0* GE_new1343(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1343)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1343;
		((T1343*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [ET_ADAPTED_CLASS]] */
T0* GE_new1344(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1344);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1344;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_PRECONDITIONS] */
T0* GE_new1345(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1345);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1345;
	}
	return R;
}

/* New instance of type SPECIAL [ET_PRECONDITIONS] */
T0* GE_new1346(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1346)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1346;
		((T1346*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_POSTCONDITIONS] */
T0* GE_new1347(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1347);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1347;
	}
	return R;
}

/* New instance of type SPECIAL [ET_POSTCONDITIONS] */
T0* GE_new1348(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1348)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1348;
		((T1348*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_INVARIANTS] */
T0* GE_new1349(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1349);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1349;
	}
	return R;
}

/* New instance of type SPECIAL [ET_INVARIANTS] */
T0* GE_new1350(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1350)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1350;
		((T1350*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type SPECIAL [NATIVE_STRING] */
T0* GE_new1351(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1351)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1351;
		((T1351*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type SPECIAL [NATURAL_32] */
T0* GE_new1352(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1352)+a1*sizeof(T10);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1352;
		((T1352*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [RX_CHARACTER_SET] */
T0* GE_new1353(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1353);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1353;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [NATURAL_32] */
T0* GE_new1354(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1354);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1354;
	}
	return R;
}

/* New instance of type SPECIAL [NATURAL_64] */
T0* GE_new1355(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1355)+a1*sizeof(T11);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1355;
		((T1355*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [NATURAL_64, NATURAL_32] */
T0* GE_new1356(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1356);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1356;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [NATURAL_64, NATURAL_32] */
T0* GE_new1357(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1357);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1357;
	}
	return R;
}

/* New instance of type SPECIAL [ARRAY [INTEGER_32]] */
T0* GE_new1358(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1358)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1358;
		((T1358*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type SPECIAL [SPECIAL [ARRAY [INTEGER_32]]] */
T0* GE_new1359(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1359)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1359;
		((T1359*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_INTEGER_ROUTINES */
T0* GE_new1360(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1360);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1360;
	}
	return R;
}

/* New instance of type DS_HASH_SET_CURSOR [NATURAL_32] */
T0* GE_new1363(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1363);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1363;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_OLD_EXPRESSION] */
T0* GE_new1365(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1365);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1365;
	}
	return R;
}

/* New instance of type SPECIAL [ET_OLD_EXPRESSION] */
T0* GE_new1366(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1366)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1366;
		((T1366*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_OLD_EXPRESSION] */
T0* GE_new1367(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1367);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1367;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_IDENTIFIER, ET_OLD_EXPRESSION] */
T0* GE_new1369(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1369);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1369;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_IDENTIFIER] */
T0* GE_new1370(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1370);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1370;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_DYNAMIC_PRIMARY_TYPE] */
T0* GE_new1371(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1371)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1371;
		((T1371*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_DYNAMIC_PRIMARY_TYPE] */
T0* GE_new1372(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1372);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1372;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [detachable ET_DYNAMIC_PRIMARY_TYPE] */
T0* GE_new1373(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1373);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1373;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [BOOLEAN] */
T0* GE_new1374(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1374);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1374;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_EQUALITY_EXPRESSION] */
T0* GE_new1375(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1375);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1375;
	}
	return R;
}

/* New instance of type SPECIAL [ET_EQUALITY_EXPRESSION] */
T0* GE_new1376(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1376)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1376;
		((T1376*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_EQUALITY_EXPRESSION] */
T0* GE_new1377(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1377);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1377;
	}
	return R;
}

/* New instance of type SPECIAL [ET_DYNAMIC_EQUALITY_TYPES] */
T0* GE_new1378(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1378)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1378;
		((T1378*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_DYNAMIC_EQUALITY_TYPES] */
T0* GE_new1379(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1379);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1379;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_DYNAMIC_EQUALITY_TYPES] */
T0* GE_new1380(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1380);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1380;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_DYNAMIC_OBJECT_EQUALITY_TYPES] */
T0* GE_new1381(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1381);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1381;
	}
	return R;
}

/* New instance of type SPECIAL [ET_DYNAMIC_OBJECT_EQUALITY_TYPES] */
T0* GE_new1382(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1382)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1382;
		((T1382*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_DYNAMIC_OBJECT_EQUALITY_TYPES] */
T0* GE_new1383(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1383);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1383;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_UNQUALIFIED_CALL_EXPRESSION] */
T0* GE_new1384(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1384);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1384;
	}
	return R;
}

/* New instance of type SPECIAL [ET_UNQUALIFIED_CALL_EXPRESSION] */
T0* GE_new1385(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1385)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1385;
		((T1385*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_UNQUALIFIED_CALL_EXPRESSION] */
T0* GE_new1386(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1386);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1386;
	}
	return R;
}

/* New instance of type SPECIAL [ET_QUALIFIED_CALL_EXPRESSION] */
T0* GE_new1387(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1387)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1387;
		((T1387*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_QUALIFIED_CALL_EXPRESSION] */
T0* GE_new1388(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1388);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1388;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_QUALIFIED_CALL_EXPRESSION] */
T0* GE_new1389(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1389);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1389;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ACTUAL_ARGUMENT_LIST] */
T0* GE_new1390(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1390);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1390;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ACTUAL_ARGUMENT_LIST] */
T0* GE_new1391(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1391)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1391;
		((T1391*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ACTUAL_ARGUMENT_LIST] */
T0* GE_new1392(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1392);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1392;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_RESULT] */
T0* GE_new1393(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1393);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1393;
	}
	return R;
}

/* New instance of type SPECIAL [ET_RESULT] */
T0* GE_new1394(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1394)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1394;
		((T1394*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_RESULT] */
T0* GE_new1395(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1395);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1395;
	}
	return R;
}

/* New instance of type SPECIAL [ET_DYNAMIC_STANDALONE_TYPE_SET] */
T0* GE_new1396(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1396)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1396;
		((T1396*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_DYNAMIC_STANDALONE_TYPE_SET] */
T0* GE_new1397(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1397);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1397;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_DYNAMIC_STANDALONE_TYPE_SET] */
T0* GE_new1398(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1398);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1398;
	}
	return R;
}

/* New instance of type SPECIAL [ET_EXPRESSION] */
T0* GE_new1399(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1399)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1399;
		((T1399*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_EXPRESSION] */
T0* GE_new1400(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1400);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1400;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_EXPRESSION] */
T0* GE_new1401(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1401);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1401;
	}
	return R;
}

/* New instance of type KL_EQUALITY_TESTER [INTEGER_32] */
T0* GE_new1402(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1402);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1402;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_DYNAMIC_PRIMARY_TYPE, INTEGER_32] */
T0* GE_new1403(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1403);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1403;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_DYNAMIC_STANDALONE_TYPE_SET, ET_DYNAMIC_PRIMARY_TYPE] */
T0* GE_new1404(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1404);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1404;
	}
	return R;
}

/* New instance of type SPECIAL [ET_OBJECT_TEST] */
T0* GE_new1406(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1406)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1406;
		((T1406*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_OBJECT_TEST] */
T0* GE_new1407(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1407);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1407;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [INTEGER_32, INTEGER_32] */
T0* GE_new1409(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1409);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1409;
	}
	return R;
}

/* New instance of type DS_HASH_SET_CURSOR [INTEGER_32] */
T0* GE_new1410(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1410);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1410;
	}
	return R;
}

/* New instance of type SPECIAL [ET_AGENT] */
T0* GE_new1413(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1413)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1413;
		((T1413*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_AGENT] */
T0* GE_new1414(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1414);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1414;
	}
	return R;
}

/* New instance of type DS_HASH_SET_CURSOR [ET_DYNAMIC_TUPLE_TYPE] */
T0* GE_new1415(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1415);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1415;
	}
	return R;
}

/* New instance of type SPECIAL [ET_DYNAMIC_TUPLE_TYPE] */
T0* GE_new1416(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1416)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1416;
		((T1416*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_DYNAMIC_TUPLE_TYPE] */
T0* GE_new1417(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1417);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1417;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [INTEGER_32, ET_STANDALONE_CLOSURE] */
T0* GE_new1419(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1419);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1419;
	}
	return R;
}

/* New instance of type SPECIAL [ET_STANDALONE_CLOSURE] */
T0* GE_new1420(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1420)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1420;
		((T1420*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_STANDALONE_CLOSURE] */
T0* GE_new1421(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1421);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1421;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_CONSTANT, ET_FEATURE] */
T0* GE_new1422(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1422);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1422;
	}
	return R;
}

/* New instance of type SPECIAL [ET_CONSTANT] */
T0* GE_new1423(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1423)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1423;
		((T1423*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_CONSTANT] */
T0* GE_new1425(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1425);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1425;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_DYNAMIC_PRIMARY_TYPE, ET_INLINE_CONSTANT] */
T0* GE_new1426(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1426);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1426;
	}
	return R;
}

/* New instance of type SPECIAL [ET_INLINE_CONSTANT] */
T0* GE_new1427(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1427)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1427;
		((T1427*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_INLINE_CONSTANT] */
T0* GE_new1429(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1429);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1429;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_DYNAMIC_FEATURE] */
T0* GE_new1430(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1430)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1430;
		((T1430*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [detachable ET_DYNAMIC_FEATURE, ET_DYNAMIC_PRIMARY_TYPE] */
T0* GE_new1432(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1432);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1432;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_DYNAMIC_FEATURE] */
T0* GE_new1433(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1433);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1433;
	}
	return R;
}

/* New instance of type SPECIAL [ET_DYNAMIC_INLINED_EXPRESSION] */
T0* GE_new1434(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1434)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1434;
		((T1434*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_DYNAMIC_INLINED_EXPRESSION] */
T0* GE_new1435(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1435);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1435;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_DYNAMIC_INLINED_EXPRESSION] */
T0* GE_new1436(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1436);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1436;
	}
	return R;
}

/* New instance of type SPECIAL [ET_DYNAMIC_CALL_CONTEXT] */
T0* GE_new1437(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1437)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1437;
		((T1437*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_DYNAMIC_CALL_CONTEXT] */
T0* GE_new1438(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1438);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1438;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_DYNAMIC_CALL_CONTEXT] */
T0* GE_new1439(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1439);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1439;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_DYNAMIC_FEATURE] */
T0* GE_new1440(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1440);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1440;
	}
	return R;
}

/* New instance of type DS_HASH_SET_CURSOR [ET_DYNAMIC_FEATURE] */
T0* GE_new1441(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1441);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1441;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [BOOLEAN, STRING_8] */
T0* GE_new1444(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1444);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1444;
	}
	return R;
}

/* New instance of type SPECIAL [DS_ARRAYED_LIST [STRING_8]] */
T0* GE_new1448(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1448)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1448;
		((T1448*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [STRING_8]] */
T0* GE_new1449(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1449);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1449;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [STRING_8]] */
T0* GE_new1450(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1450);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1450;
	}
	return R;
}

/* New instance of type SPECIAL [TUPLE [STRING_8, detachable STRING_8]] */
T0* GE_new1451(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1451)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1451;
		((T1451*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [TUPLE [STRING_8, detachable STRING_8]] */
T0* GE_new1453(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1453);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1453;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [TUPLE [STRING_8, detachable STRING_8], STRING_8] */
T0* GE_new1454(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1454);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1454;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [INTEGER_32, ET_DYNAMIC_PRIMARY_TYPE] */
T0* GE_new1455(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1455);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1455;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [detachable DS_LINKABLE [INTEGER_32]] */
T0* GE_new1456(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1456);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1456;
	}
	return R;
}

/* New instance of type ARRAY [BOOLEAN] */
T0* GE_new1457(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1457);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1457;
	}
	return R;
}

/* New instance of type THREAD_ATTRIBUTES */
T0* GE_new1459(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1459);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1459;
	}
	return R;
}

/* New instance of type CELL [BOOLEAN] */
T0* GE_new1460(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1460);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1460;
	}
	return R;
}

/* New instance of type CHARACTER_PROPERTY */
T0* GE_new1462(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1462);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1462;
	}
	return R;
}

/* New instance of type ET_SYSTEM_ERROR */
T0* GE_new1463(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1463);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1463;
	}
	return R;
}

/* New instance of type ET_INTERNAL_ERROR */
T0* GE_new1464(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1464);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1464;
	}
	return R;
}

/* New instance of type ET_SYNTAX_ERROR */
T0* GE_new1465(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1465);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1465;
	}
	return R;
}

/* New instance of type ET_VALIDITY_ERROR */
T0* GE_new1466(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1466);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1466;
	}
	return R;
}

/* New instance of type ET_FORMAL_COMMA_ARGUMENT */
T0* GE_new1467(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1467);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1467;
	}
	return R;
}

/* New instance of type ET_LOCAL_COMMA_VARIABLE */
T0* GE_new1468(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1468);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1468;
	}
	return R;
}

/* New instance of type ET_LABELED_COMMA_ACTUAL_PARAMETER */
T0* GE_new1469(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1469);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1469;
	}
	return R;
}

/* New instance of type ET_KEYWORD_EXPRESSION */
T0* GE_new1471(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1471);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1471;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [detachable ET_FORMAL_PARAMETER_TYPE] */
T0* GE_new1474(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1474);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1474;
	}
	return R;
}

/* New instance of type SPECIAL [ET_CREATOR] */
T0* GE_new1475(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1475)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1475;
		((T1475*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_CREATOR] */
T0* GE_new1476(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1476);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1476;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_FEATURE_NAME_ITEM] */
T0* GE_new1477(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1477);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1477;
	}
	return R;
}

/* New instance of type SPECIAL [ET_FEATURE_NAME_ITEM] */
T0* GE_new1478(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1478)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1478;
		((T1478*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type ET_ECF_NOTE_ELEMENT */
T0* GE_new1479(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1479);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1479;
	}
	return R;
}

/* New instance of type ET_ECF_ADAPTED_LIBRARIES */
T0* GE_new1480(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1480);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1480;
	}
	return R;
}

/* New instance of type ET_ECF_ADAPTED_DOTNET_ASSEMBLIES */
T0* GE_new1481(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1481);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1481;
	}
	return R;
}

/* New instance of type ET_ECF_FILE_RULES */
T0* GE_new1482(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1482);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1482;
	}
	return R;
}

/* New instance of type ET_ECF_NAMESPACES */
T0* GE_new1483(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1483);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1483;
	}
	return R;
}

/* New instance of type ET_ECF_EXTERNAL_CFLAGS */
T0* GE_new1484(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1484);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1484;
	}
	return R;
}

/* New instance of type ET_ECF_EXTERNAL_INCLUDES */
T0* GE_new1485(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1485);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1485;
	}
	return R;
}

/* New instance of type ET_ECF_EXTERNAL_LIBRARIES */
T0* GE_new1486(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1486);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1486;
	}
	return R;
}

/* New instance of type ET_ECF_EXTERNAL_LINKER_FLAGS */
T0* GE_new1487(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1487);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1487;
	}
	return R;
}

/* New instance of type ET_ECF_EXTERNAL_MAKES */
T0* GE_new1488(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1488);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1488;
	}
	return R;
}

/* New instance of type ET_ECF_EXTERNAL_OBJECTS */
T0* GE_new1489(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1489);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1489;
	}
	return R;
}

/* New instance of type ET_ECF_EXTERNAL_RESOURCES */
T0* GE_new1490(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1490);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1490;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ECF_ACTION] */
T0* GE_new1491(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1491);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1491;
	}
	return R;
}

/* New instance of type ET_ECF_ADAPTED_PRECOMPILED_LIBRARY */
T0* GE_new1492(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1492);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1492;
	}
	return R;
}

/* New instance of type ET_ECF_VERSION */
T0* GE_new1494(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1494);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1494;
	}
	return R;
}

/* New instance of type ET_ECF_NAMESPACE */
T0* GE_new1495(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1495);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1495;
	}
	return R;
}

/* New instance of type ET_ECF_EXTERNAL_CFLAG */
T0* GE_new1496(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1496);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1496;
	}
	return R;
}

/* New instance of type ET_ECF_EXTERNAL_INCLUDE */
T0* GE_new1497(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1497);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1497;
	}
	return R;
}

/* New instance of type ET_ECF_EXTERNAL_LIBRARY */
T0* GE_new1498(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1498);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1498;
	}
	return R;
}

/* New instance of type ET_ECF_EXTERNAL_LINKER_FLAG */
T0* GE_new1499(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1499);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1499;
	}
	return R;
}

/* New instance of type ET_ECF_EXTERNAL_MAKE */
T0* GE_new1500(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1500);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1500;
	}
	return R;
}

/* New instance of type ET_ECF_EXTERNAL_OBJECT */
T0* GE_new1501(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1501);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1501;
	}
	return R;
}

/* New instance of type ET_ECF_EXTERNAL_RESOURCE */
T0* GE_new1502(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1502);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1502;
	}
	return R;
}

/* New instance of type ET_ECF_FILE_RULE */
T0* GE_new1503(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1503);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1503;
	}
	return R;
}

/* New instance of type ET_ECF_ACTION */
T0* GE_new1504(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1504);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1504;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_ECF_OPTIONS, STRING_8] */
T0* GE_new1505(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1505);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1505;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ECF_VISIBLE_CLASS] */
T0* GE_new1506(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1506);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1506;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_OPTIONS] */
T0* GE_new1507(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1507);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1507;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_ECF_OPTIONS]] */
T0* GE_new1508(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1508);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1508;
	}
	return R;
}

/* New instance of type ET_ECF_ROOT_CLASS */
T0* GE_new1509(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1509);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1509;
	}
	return R;
}

/* New instance of type ET_ECF_ROOT_ALL_CLASSES */
T0* GE_new1510(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1510);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1510;
	}
	return R;
}

/* New instance of type ET_ECF_ORED_CONDITIONS */
T0* GE_new1511(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1511);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1511;
	}
	return R;
}

/* New instance of type ET_ECF_ANDED_CONDITIONS */
T0* GE_new1512(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1512);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1512;
	}
	return R;
}

/* New instance of type ET_ECF_VISIBLE_CLASS */
T0* GE_new1513(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1513);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1513;
	}
	return R;
}

/* New instance of type ET_ECF_BUILD_CONDITION */
T0* GE_new1515(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1515);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1515;
	}
	return R;
}

/* New instance of type ET_ECF_CONCURRENCY_CONDITION */
T0* GE_new1516(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1516);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1516;
	}
	return R;
}

/* New instance of type ET_ECF_VOID_SAFETY_CONDITION */
T0* GE_new1517(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1517);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1517;
	}
	return R;
}

/* New instance of type ET_ECF_CUSTOM_CONDITION */
T0* GE_new1518(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1518);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1518;
	}
	return R;
}

/* New instance of type ET_ECF_DOTNET_CONDITION */
T0* GE_new1519(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1519);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1519;
	}
	return R;
}

/* New instance of type ET_ECF_DYNAMIC_RUNTIME_CONDITION */
T0* GE_new1520(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1520);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1520;
	}
	return R;
}

/* New instance of type ET_ECF_PLATFORM_CONDITION */
T0* GE_new1521(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1521);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1521;
	}
	return R;
}

/* New instance of type ET_ECF_COMPILER_VERSION_CONDITION */
T0* GE_new1523(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1523);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1523;
	}
	return R;
}

/* New instance of type ET_ECF_MSIL_CLR_VERSION_CONDITION */
T0* GE_new1524(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1524);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1524;
	}
	return R;
}

/* New instance of type UT_COUNTER */
T0* GE_new1526(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1526);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1526;
	}
	return R;
}

/* New instance of type KL_AGENT_ROUTINES [ET_CLASS] */
T0* GE_new1527(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1527);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1527;
	}
	return R;
}

/* New instance of type TUPLE [UT_COUNTER] */
T0* GE_new1528(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1528);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1528;
	}
	return R;
}

/* New instance of type TUPLE [KL_AGENT_ROUTINES [ET_CLASS], PROCEDURE [TUPLE]] */
T0* GE_new1529(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1529);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1529;
	}
	return R;
}

/* New instance of type TUPLE [PROCEDURE [TUPLE [ET_CLASS]]] */
T0* GE_new1530(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1530);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1530;
	}
	return R;
}

/* New instance of type TUPLE [PROCEDURE [TUPLE [ET_CLASS]], FUNCTION [TUPLE, BOOLEAN]] */
T0* GE_new1531(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1531);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1531;
	}
	return R;
}

/* New instance of type DS_HASH_SET [ET_DOTNET_ASSEMBLY] */
T0* GE_new1533(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1533);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1533;
	}
	return R;
}

/* New instance of type PREDICATE [TUPLE [ET_DOTNET_ASSEMBLY]] */
T0* GE_new1534(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1534);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1534;
	}
	return R;
}

/* New instance of type TUPLE [DS_HASH_SET [ET_DOTNET_ASSEMBLY]] */
T0* GE_new1535(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1535);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1535;
	}
	return R;
}

/* New instance of type TUPLE [ET_INTERNAL_UNIVERSE] */
T0* GE_new1536(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1536);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1536;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_INTERNAL_UNIVERSE]] */
T0* GE_new1537(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1537);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1537;
	}
	return R;
}

/* New instance of type TUPLE [PROCEDURE [TUPLE [ET_DOTNET_ASSEMBLY]], PREDICATE [TUPLE [ET_DOTNET_ASSEMBLY]]] */
T0* GE_new1538(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1538);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1538;
	}
	return R;
}

/* New instance of type TUPLE [ET_DOTNET_ASSEMBLIES] */
T0* GE_new1539(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1539);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1539;
	}
	return R;
}

/* New instance of type TUPLE [ET_SYSTEM_PROCESSOR] */
T0* GE_new1540(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1540);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1540;
	}
	return R;
}

/* New instance of type TUPLE [ET_CLUSTER] */
T0* GE_new1541(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1541);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1541;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_CLUSTER]] */
T0* GE_new1542(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1542);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1542;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_SYSTEM] */
T0* GE_new1543(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1543);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1543;
	}
	return R;
}

/* New instance of type DS_HASH_SET [ET_INTERNAL_UNIVERSE] */
T0* GE_new1544(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1544);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1544;
	}
	return R;
}

/* New instance of type TUPLE [ET_AST_PROCESSOR] */
T0* GE_new1545(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1545);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1545;
	}
	return R;
}

/* New instance of type TUPLE [ET_ADAPTED_DOTNET_ASSEMBLY] */
T0* GE_new1546(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1546);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1546;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_ADAPTED_DOTNET_ASSEMBLY]] */
T0* GE_new1547(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1547);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1547;
	}
	return R;
}

/* New instance of type ET_ANCESTORS_STATUS_CHECKER */
T0* GE_new1548(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1548);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1548;
	}
	return R;
}

/* New instance of type ET_FLATTENING_STATUS_CHECKER */
T0* GE_new1549(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1549);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1549;
	}
	return R;
}

/* New instance of type ET_INTERFACE_STATUS_CHECKER */
T0* GE_new1550(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1550);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1550;
	}
	return R;
}

/* New instance of type ET_IMPLEMENTATION_STATUS_CHECKER */
T0* GE_new1551(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1551);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1551;
	}
	return R;
}

/* New instance of type TUPLE [ET_ANCESTORS_STATUS_CHECKER] */
T0* GE_new1552(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1552);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1552;
	}
	return R;
}

/* New instance of type TUPLE [ET_FLATTENING_STATUS_CHECKER] */
T0* GE_new1553(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1553);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1553;
	}
	return R;
}

/* New instance of type TUPLE [ET_INTERFACE_STATUS_CHECKER] */
T0* GE_new1554(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1554);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1554;
	}
	return R;
}

/* New instance of type TUPLE [ET_IMPLEMENTATION_STATUS_CHECKER] */
T0* GE_new1555(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1555);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1555;
	}
	return R;
}

/* New instance of type TUPLE [BOOLEAN] */
T0* GE_new1556(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1556);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1556;
	}
	return R;
}

/* New instance of type TUPLE [PROCEDURE [TUPLE [ET_CLUSTER]]] */
T0* GE_new1559(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1559);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1559;
	}
	return R;
}

/* New instance of type TUPLE [DS_HASH_SET [ET_INTERNAL_UNIVERSE]] */
T0* GE_new1563(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1563);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1563;
	}
	return R;
}

/* New instance of type TUPLE [PROCEDURE [TUPLE [ET_MASTER_CLASS]]] */
T0* GE_new1564(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1564);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1564;
	}
	return R;
}

/* New instance of type ET_PARENTHESIS_EXPRESSION */
T0* GE_new1565(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1565);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1565;
	}
	return R;
}

/* New instance of type DS_HASH_SET [ET_LIBRARY] */
T0* GE_new1568(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1568);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1568;
	}
	return R;
}

/* New instance of type TUPLE [DS_HASH_SET [ET_LIBRARY]] */
T0* GE_new1569(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1569);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1569;
	}
	return R;
}

/* New instance of type SPECIAL [ET_RENAME_ITEM] */
T0* GE_new1573(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1573)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1573;
		((T1573*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_RENAME_ITEM] */
T0* GE_new1574(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1574);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1574;
	}
	return R;
}

/* New instance of type SPECIAL [ET_EXPORT] */
T0* GE_new1576(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1576)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1576;
		((T1576*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_EXPORT] */
T0* GE_new1577(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1577);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1577;
	}
	return R;
}

/* New instance of type ET_CLUSTER_DEPENDENCE_CONSTRAINT */
T0* GE_new1580(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1580);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1580;
	}
	return R;
}

/* New instance of type ET_PARENT_FEATURE */
T0* GE_new1582(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1582);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1582;
	}
	return R;
}

/* New instance of type DS_QUICK_SORTER [ET_QUERY] */
T0* GE_new1583(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1583);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1583;
	}
	return R;
}

/* New instance of type DS_QUICK_SORTER [ET_PROCEDURE] */
T0* GE_new1584(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1584);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1584;
	}
	return R;
}

/* New instance of type ET_INHERITED_FEATURE */
T0* GE_new1585(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1585);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1585;
	}
	return R;
}

/* New instance of type ET_REDECLARED_FEATURE */
T0* GE_new1587(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1587);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1587;
	}
	return R;
}

/* New instance of type KL_CHARACTER_BUFFER */
T0* GE_new1595(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1595);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1595;
	}
	return R;
}

/* New instance of type SPECIAL [ET_AGENT_ARGUMENT_OPERAND_ITEM] */
T0* GE_new1597(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1597)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1597;
		((T1597*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_AGENT_ARGUMENT_OPERAND_ITEM] */
T0* GE_new1598(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1598);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1598;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ALIAS_NAME] */
T0* GE_new1599(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1599)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1599;
		((T1599*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ALIAS_NAME] */
T0* GE_new1600(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1600);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1600;
	}
	return R;
}

/* New instance of type ET_AGENT_IMPLICIT_CURRENT_TARGET */
T0* GE_new1601(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1601);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1601;
	}
	return R;
}

/* New instance of type SPECIAL [ET_CHOICE_ITEM] */
T0* GE_new1603(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1603)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1603;
		((T1603*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_CHOICE_ITEM] */
T0* GE_new1604(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1604);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1604;
	}
	return R;
}

/* New instance of type SPECIAL [ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM] */
T0* GE_new1605(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1605)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1605;
		((T1605*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM] */
T0* GE_new1607(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1607);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1607;
	}
	return R;
}

/* New instance of type SPECIAL [ET_CONVERT_FEATURE_ITEM] */
T0* GE_new1608(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1608)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1608;
		((T1608*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_CONVERT_FEATURE_ITEM] */
T0* GE_new1610(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1610);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1610;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ELSEIF_EXPRESSION] */
T0* GE_new1611(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1611)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1611;
		((T1611*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ELSEIF_EXPRESSION] */
T0* GE_new1612(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1612);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1612;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ELSEIF_PART] */
T0* GE_new1613(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1613)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1613;
		((T1613*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ELSEIF_PART] */
T0* GE_new1614(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1614);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1614;
	}
	return R;
}

/* New instance of type SPECIAL [ET_FEATURE_CLAUSE] */
T0* GE_new1615(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1615)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1615;
		((T1615*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_FEATURE_CLAUSE] */
T0* GE_new1616(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1616);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1616;
	}
	return R;
}

/* New instance of type SPECIAL [ET_FORMAL_ARGUMENT_ITEM] */
T0* GE_new1617(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1617)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1617;
		((T1617*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_FORMAL_ARGUMENT_ITEM] */
T0* GE_new1619(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1619);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1619;
	}
	return R;
}

/* New instance of type SPECIAL [ET_FORMAL_PARAMETER_ITEM] */
T0* GE_new1620(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1620)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1620;
		((T1620*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_FORMAL_PARAMETER_ITEM] */
T0* GE_new1621(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1621);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1621;
	}
	return R;
}

/* New instance of type SPECIAL [ET_LOCAL_VARIABLE_ITEM] */
T0* GE_new1622(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1622)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1622;
		((T1622*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_LOCAL_VARIABLE_ITEM] */
T0* GE_new1624(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1624);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1624;
	}
	return R;
}

/* New instance of type SPECIAL [ET_MANIFEST_STRING_ITEM] */
T0* GE_new1626(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1626)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1626;
		((T1626*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_MANIFEST_STRING_ITEM] */
T0* GE_new1627(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1627);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1627;
	}
	return R;
}

/* New instance of type SPECIAL [ET_NOTE_ITEM] */
T0* GE_new1629(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1629)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1629;
		((T1629*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_NOTE_ITEM] */
T0* GE_new1630(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1630);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1630;
	}
	return R;
}

/* New instance of type SPECIAL [ET_NOTE_TERM_ITEM] */
T0* GE_new1631(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1631)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1631;
		((T1631*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_NOTE_TERM_ITEM] */
T0* GE_new1632(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1632);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1632;
	}
	return R;
}

/* New instance of type SPECIAL [ET_PARENT_LIST] */
T0* GE_new1633(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1633)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1633;
		((T1633*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_PARENT_LIST] */
T0* GE_new1634(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1634);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1634;
	}
	return R;
}

/* New instance of type SPECIAL [ET_TYPE_CONSTRAINT_ITEM] */
T0* GE_new1636(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1636)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1636;
		((T1636*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_TYPE_CONSTRAINT_ITEM] */
T0* GE_new1637(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1637);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1637;
	}
	return R;
}

/* New instance of type SPECIAL [ET_WHEN_EXPRESSION] */
T0* GE_new1638(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1638)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1638;
		((T1638*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_WHEN_EXPRESSION] */
T0* GE_new1639(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1639);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1639;
	}
	return R;
}

/* New instance of type SPECIAL [ET_WHEN_PART] */
T0* GE_new1640(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1640)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1640;
		((T1640*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_WHEN_PART] */
T0* GE_new1641(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1641);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1641;
	}
	return R;
}

/* New instance of type XM_LINKED_LIST [XM_ELEMENT_NODE] */
T0* GE_new1643(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1643);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1643;
	}
	return R;
}

/* New instance of type UC_STRING_EQUALITY_TESTER */
T0* GE_new1645(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1645);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1645;
	}
	return R;
}

/* New instance of type DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]] */
T0* GE_new1647(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1647);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1647;
	}
	return R;
}

/* New instance of type DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]] */
T0* GE_new1648(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1648);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1648;
	}
	return R;
}

/* New instance of type DS_PAIR [XM_POSITION, XM_NODE] */
T0* GE_new1649(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1649);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1649;
	}
	return R;
}

/* New instance of type XM_EIFFEL_INPUT_STREAM */
T0* GE_new1650(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1650);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1650;
	}
	return R;
}

/* New instance of type DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE] */
T0* GE_new1651(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1651);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1651;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ECF_TARGET] */
T0* GE_new1652(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1652);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1652;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_ECF_OPTIONS, STRING_8] */
T0* GE_new1653(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1653);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1653;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ADAPTED_UNIVERSE] */
T0* GE_new1654(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1654);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1654;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ECF_TARGET_PARENT] */
T0* GE_new1656(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1656);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1656;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ECF_CLUSTER] */
T0* GE_new1657(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1657);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1657;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_DYNAMIC_TYPE_SET, ET_DYNAMIC_TYPE] */
T0* GE_new1659(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1659);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1659;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_DYNAMIC_TYPE] */
T0* GE_new1662(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1662);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1662;
	}
	return R;
}

/* New instance of type SPECIAL [ET_DYNAMIC_TYPE] */
T0* GE_new1663(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1663)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1663;
		((T1663*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type INTEGER_OVERFLOW_CHECKER */
T0* GE_new1668(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1668);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1668;
	}
	return R;
}

/* New instance of type CONSOLE */
T0* GE_new1669(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1669);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1669;
	}
	return R;
}

/* New instance of type C_DATE */
T0* GE_new1670(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1670);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1670;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [INTEGER_32, STRING_8] */
T0* GE_new1672(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1672);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1672;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_NOTE_ELEMENT] */
T0* GE_new1673(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1673);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1673;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_NOTE_ELEMENT] */
T0* GE_new1674(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1674)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1674;
		((T1674*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ECF_NOTE_ELEMENT] */
T0* GE_new1675(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1675);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1675;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_TARGET_LIST */
T0* GE_new1677(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1677);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1677;
	}
	return R;
}

/* New instance of type DS_ARRAYED_STACK [YY_BUFFER] */
T0* GE_new1678(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1678);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1678;
	}
	return R;
}

/* New instance of type UT_SYNTAX_ERROR */
T0* GE_new1679(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1679);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1679;
	}
	return R;
}

/* New instance of type UT_TOO_MANY_INCLUDES_ERROR */
T0* GE_new1680(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1680);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1680;
	}
	return R;
}

/* New instance of type ARRAY [detachable STRING_8] */
T0* GE_new1681(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1681);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1681;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ADAPTED_LIBRARY] */
T0* GE_new1683(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1683)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1683;
		((T1683*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ADAPTED_LIBRARY] */
T0* GE_new1684(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1684);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1684;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_LIBRARY] */
T0* GE_new1685(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1685);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1685;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ADAPTED_DOTNET_ASSEMBLY] */
T0* GE_new1686(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1686)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1686;
		((T1686*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ADAPTED_DOTNET_ASSEMBLY] */
T0* GE_new1687(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1687);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1687;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_DOTNET_ASSEMBLY] */
T0* GE_new1688(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1688);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1688;
	}
	return R;
}

/* New instance of type SPECIAL [ET_TYPE_ITEM] */
T0* GE_new1689(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1689)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1689;
		((T1689*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_TYPE_ITEM] */
T0* GE_new1690(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1690);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1690;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [INTEGER_32, ET_CLASS] */
T0* GE_new1691(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1691);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1691;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_BASE_TYPE, ET_CLASS] */
T0* GE_new1692(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1692);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1692;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_BASE_TYPE_CONSTRAINT] */
T0* GE_new1694(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1694);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1694;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [NATURAL_32] */
T0* GE_new1695(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1695);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1695;
	}
	return R;
}

/* New instance of type ET_BASE_TYPE_CONSTRAINT_LIST */
T0* GE_new1696(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1696);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1696;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_FLATTENED_FEATURE, ET_FEATURE_NAME] */
T0* GE_new1697(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1697);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1697;
	}
	return R;
}

/* New instance of type SPECIAL [ET_FLATTENED_FEATURE] */
T0* GE_new1698(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1698)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1698;
		((T1698*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type SPECIAL [ET_FEATURE_NAME] */
T0* GE_new1701(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1701)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1701;
		((T1701*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_FLATTENED_FEATURE] */
T0* GE_new1702(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1702);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1702;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_FEATURE_NAME] */
T0* GE_new1703(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1703);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1703;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_FLATTENED_FEATURE, ET_ALIAS_NAME] */
T0* GE_new1705(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1705);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1705;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_CLIENT_LIST] */
T0* GE_new1706(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1706);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1706;
	}
	return R;
}

/* New instance of type SPECIAL [ET_CLIENT_LIST] */
T0* GE_new1707(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1707)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1707;
		((T1707*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_CLIENT_LIST] */
T0* GE_new1708(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1708);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1708;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_CLIENT, ET_CLASS] */
T0* GE_new1710(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1710);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1710;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_CLIENT] */
T0* GE_new1711(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1711);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1711;
	}
	return R;
}

/* New instance of type SPECIAL [ET_CLIENT] */
T0* GE_new1712(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1712)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1712;
		((T1712*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_HASH_SET [ET_FEATURE_NAME] */
T0* GE_new1713(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1713);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1713;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [BOOLEAN, ET_FEATURE_NAME] */
T0* GE_new1714(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1714);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1714;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [ET_REPLICABLE_FEATURE, INTEGER_32] */
T0* GE_new1715(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1715);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1715;
	}
	return R;
}

/* New instance of type ET_REPLICATED_FEATURE */
T0* GE_new1717(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1717);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1717;
	}
	return R;
}

/* New instance of type DS_LINKED_LIST [ET_ADAPTED_FEATURE] */
T0* GE_new1718(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1718);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1718;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_PARENT_FEATURE] */
T0* GE_new1719(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1719);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1719;
	}
	return R;
}

/* New instance of type ET_DOTNET_SIGNATURE_TESTER */
T0* GE_new1720(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1720);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1720;
	}
	return R;
}

/* New instance of type DS_HASH_SET [ET_DOTNET_FEATURE] */
T0* GE_new1721(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1721);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1721;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [DS_LINKED_LIST [ET_DOTNET_FEATURE], ET_DOTNET_FEATURE] */
T0* GE_new1723(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1723);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1723;
	}
	return R;
}

/* New instance of type DS_LINKED_LIST [ET_DOTNET_FEATURE] */
T0* GE_new1725(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1725);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1725;
	}
	return R;
}

/* New instance of type DS_HASH_TOPOLOGICAL_SORTER [ET_LIKE_FEATURE] */
T0* GE_new1726(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1726);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1726;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_LIKE_FEATURE] */
T0* GE_new1727(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1727);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1727;
	}
	return R;
}

/* New instance of type DS_LINKED_LIST_CURSOR [ET_PARENT_FEATURE] */
T0* GE_new1728(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1728);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1728;
	}
	return R;
}

/* New instance of type DS_LINKED_LIST [ET_PARENT_FEATURE] */
T0* GE_new1729(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1729);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1729;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [DS_HASH_TABLE [TUPLE [detachable ARRAY [ET_TYPE], detachable ET_TYPE, NATURAL_8], ET_FEATURE_NAME], NATURAL_8] */
T0* GE_new1730(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1730);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1730;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_FEATURE, INTEGER_32] */
T0* GE_new1731(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1731);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1731;
	}
	return R;
}

/* New instance of type DS_HASH_SET_CURSOR [ET_CLASS] */
T0* GE_new1734(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1734);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1734;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_RENAME, ET_FEATURE_NAME] */
T0* GE_new1736(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1736);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1736;
	}
	return R;
}

/* New instance of type SPECIAL [ET_RENAME] */
T0* GE_new1737(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1737)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1737;
		((T1737*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_RENAME] */
T0* GE_new1740(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1740);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1740;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_RENAME, ET_ALIAS_NAME] */
T0* GE_new1744(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1744);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1744;
	}
	return R;
}

/* New instance of type DS_HASH_SET_CURSOR [ET_PROCEDURE] */
T0* GE_new1745(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1745);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1745;
	}
	return R;
}

/* New instance of type DS_HASH_SET_CURSOR [ET_QUERY] */
T0* GE_new1746(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1746);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1746;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [NATURAL_8] */
T0* GE_new1749(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1749);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1749;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [NATURAL_8, ET_CLASS_NAME] */
T0* GE_new1750(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1750);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1750;
	}
	return R;
}

/* New instance of type XM_EIFFEL_CHARACTER_ENTITY */
T0* GE_new1751(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1751);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1751;
	}
	return R;
}

/* New instance of type DS_BILINKABLE [XM_POSITION] */
T0* GE_new1752(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1752);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1752;
	}
	return R;
}

/* New instance of type DS_BILINKED_LIST_CURSOR [XM_POSITION] */
T0* GE_new1753(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1753);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1753;
	}
	return R;
}

/* New instance of type DS_LINKABLE [XM_EIFFEL_SCANNER] */
T0* GE_new1754(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1754);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1754;
	}
	return R;
}

/* New instance of type SPECIAL [XM_EIFFEL_ENTITY_DEF] */
T0* GE_new1755(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1755)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1755;
		((T1755*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [XM_EIFFEL_ENTITY_DEF, STRING_8] */
T0* GE_new1758(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1758);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1758;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [XM_EIFFEL_ENTITY_DEF] */
T0* GE_new1759(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1759);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1759;
	}
	return R;
}

/* New instance of type KL_EQUALITY_TESTER [XM_EIFFEL_PARSER_NAME] */
T0* GE_new1762(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1762);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1762;
	}
	return R;
}

/* New instance of type DS_HASH_SET_CURSOR [XM_EIFFEL_PARSER_NAME] */
T0* GE_new1763(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1763);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1763;
	}
	return R;
}

/* New instance of type DS_BILINKED_LIST [XM_DTD_ELEMENT_CONTENT] */
T0* GE_new1764(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1764);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1764;
	}
	return R;
}

/* New instance of type DS_BILINKED_LIST_CURSOR [XM_DTD_ATTRIBUTE_CONTENT] */
T0* GE_new1765(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1765);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1765;
	}
	return R;
}

/* New instance of type DS_BILINKABLE [XM_DTD_ATTRIBUTE_CONTENT] */
T0* GE_new1766(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1766);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1766;
	}
	return R;
}

/* New instance of type DS_BILINKED_LIST_CURSOR [STRING_8] */
T0* GE_new1767(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1767);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1767;
	}
	return R;
}

/* New instance of type DS_BILINKABLE [STRING_8] */
T0* GE_new1768(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1768);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1768;
	}
	return R;
}

/* New instance of type XM_NAMESPACE_RESOLVER_CONTEXT */
T0* GE_new1769(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1769);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1769;
	}
	return R;
}

/* New instance of type DS_LINKED_QUEUE [detachable STRING_8] */
T0* GE_new1772(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1772);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1772;
	}
	return R;
}

/* New instance of type DS_LINKED_QUEUE [STRING_8] */
T0* GE_new1773(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1773);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1773;
	}
	return R;
}

/* New instance of type KL_EQUALITY_TESTER [XM_NAMESPACE] */
T0* GE_new1774(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1774);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1774;
	}
	return R;
}

/* New instance of type DS_HASH_SET_CURSOR [XM_NAMESPACE] */
T0* GE_new1775(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1775);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1775;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [XM_NAMESPACE] */
T0* GE_new1776(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1776);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1776;
	}
	return R;
}

/* New instance of type SPECIAL [XM_NAMESPACE] */
T0* GE_new1777(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1777)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1777;
		((T1777*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_LINKABLE [XM_DOCUMENT_NODE] */
T0* GE_new1778(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1778);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1778;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_DOTNET_ASSEMBLY] */
T0* GE_new1780(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1780);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1780;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_DYNAMIC_FEATURE, INTEGER_32] */
T0* GE_new1781(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1781);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1781;
	}
	return R;
}

/* New instance of type SPECIAL [ET_DYNAMIC_QUALIFIED_QUERY_CALL] */
T0* GE_new1783(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1783)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1783;
		((T1783*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type SPECIAL [ET_CALL_NAME] */
T0* GE_new1785(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1785)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1785;
		((T1785*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_DYNAMIC_QUALIFIED_QUERY_CALL] */
T0* GE_new1787(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1787);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1787;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_CALL_NAME] */
T0* GE_new1788(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1788);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1788;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_DYNAMIC_QUALIFIED_QUERY_CALL, ET_CALL_NAME] */
T0* GE_new1789(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1789);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1789;
	}
	return R;
}

/* New instance of type SPECIAL [ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL] */
T0* GE_new1790(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1790)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1790;
		((T1790*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL, ET_CALL_NAME] */
T0* GE_new1792(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1792);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1792;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL] */
T0* GE_new1793(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1793);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1793;
	}
	return R;
}

/* New instance of type SPECIAL [ET_SYSTEM_PROCESSOR] */
T0* GE_new1794(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1794)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1794;
		((T1794*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_SYSTEM_PROCESSOR] */
T0* GE_new1795(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1795);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1795;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_SYSTEM_PROCESSOR] */
T0* GE_new1796(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1796);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1796;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ADAPTED_CLASS] */
T0* GE_new1797(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1797);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1797;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ADAPTED_CLASS] */
T0* GE_new1799(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1799)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1799;
		((T1799*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_CLASS] */
T0* GE_new1800(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1800);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1800;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_NAMED_OBJECT_TEST] */
T0* GE_new1801(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1801);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1801;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ITERATION_COMPONENT] */
T0* GE_new1802(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1802);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1802;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_INLINE_SEPARATE_ARGUMENT] */
T0* GE_new1803(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1803);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1803;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [RX_CHARACTER_SET] */
T0* GE_new1804(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1804);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1804;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [RX_CHARACTER_SET] */
T0* GE_new1805(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1805);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1805;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [NATURAL_64] */
T0* GE_new1810(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1810);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1810;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [INTEGER_32, ET_DYNAMIC_PRIMARY_TYPE] */
T0* GE_new1814(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1814);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1814;
	}
	return R;
}

/* New instance of type SPECIAL [detachable DS_LINKABLE [INTEGER_32]] */
T0* GE_new1815(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1815)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1815;
		((T1815*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable DS_LINKABLE [INTEGER_32]] */
T0* GE_new1816(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1816);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1816;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [detachable DS_LINKABLE [INTEGER_32]] */
T0* GE_new1817(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1817);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1817;
	}
	return R;
}

/* New instance of type KL_STRING_INPUT_STREAM */
T0* GE_new1819(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1819);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1819;
	}
	return R;
}

/* New instance of type UT_TRISTATE */
T0* GE_new1821(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1821);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1821;
	}
	return R;
}

/* New instance of type KL_AGENT_ROUTINES [ANY] */
T0* GE_new1822(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1822);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1822;
	}
	return R;
}

/* New instance of type TUPLE [UT_TRISTATE] */
T0* GE_new1823(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1823);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1823;
	}
	return R;
}

/* New instance of type TUPLE [KL_AGENT_ROUTINES [ANY], PROCEDURE [TUPLE]] */
T0* GE_new1824(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1824);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1824;
	}
	return R;
}

/* New instance of type PREDICATE [TUPLE [ET_MASTER_CLASS]] */
T0* GE_new1825(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1825);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1825;
	}
	return R;
}

/* New instance of type PREDICATE [TUPLE] */
T0* GE_new1826(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1826);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1826;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [INTEGER_32, ET_UNIVERSE] */
T0* GE_new1828(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1828);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1828;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [INTEGER_32, ET_UNIVERSE] */
T0* GE_new1829(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1829);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1829;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_SYSTEM, DS_HASH_TABLE [INTEGER_32, ET_UNIVERSE], INTEGER_32] */
T0* GE_new1830(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1830);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1830;
	}
	return R;
}

/* New instance of type KL_AGENT_ROUTINES [ET_UNIVERSE] */
T0* GE_new1831(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1831);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1831;
	}
	return R;
}

/* New instance of type PREDICATE [TUPLE [ET_UNIVERSE]] */
T0* GE_new1832(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1832);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1832;
	}
	return R;
}

/* New instance of type TUPLE [DS_HASH_TABLE [INTEGER_32, ET_UNIVERSE]] */
T0* GE_new1833(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1833);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1833;
	}
	return R;
}

/* New instance of type TUPLE [KL_AGENT_ROUTINES [ET_UNIVERSE], PREDICATE [TUPLE [ET_UNIVERSE]]] */
T0* GE_new1834(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1834);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1834;
	}
	return R;
}

/* New instance of type TUPLE [PROCEDURE [TUPLE [ET_MASTER_CLASS]], FUNCTION [TUPLE, BOOLEAN]] */
T0* GE_new1836(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1836);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1836;
	}
	return R;
}

/* New instance of type TUPLE [PROCEDURE [TUPLE [ET_MASTER_CLASS]], FUNCTION [TUPLE [ET_MASTER_CLASS], BOOLEAN]] */
T0* GE_new1837(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1837);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1837;
	}
	return R;
}

/* New instance of type TUPLE [PROCEDURE [TUPLE [ET_MASTER_CLASS]], FUNCTION [TUPLE [ET_MASTER_CLASS], BOOLEAN], FUNCTION [TUPLE, BOOLEAN]] */
T0* GE_new1838(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1838);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1838;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_AGENT_OPERAND_PUSH_TYPE_SET */
T0* GE_new1839(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1839);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1839;
	}
	return R;
}

/* New instance of type TUPLE [ET_MASTER_CLASS, ET_SYSTEM_PROCESSOR] */
T0* GE_new1847(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1847);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1847;
	}
	return R;
}

/* New instance of type DS_CELL [detachable ET_CLASS] */
T0* GE_new1848(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1848);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1848;
	}
	return R;
}

/* New instance of type TUPLE [DS_CELL [detachable ET_CLASS]] */
T0* GE_new1849(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1849);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1849;
	}
	return R;
}

/* New instance of type TUPLE [ET_EIFFEL_PREPARSER, DS_ARRAYED_LIST [STRING_8]] */
T0* GE_new1851(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1851);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1851;
	}
	return R;
}

/* New instance of type ET_SEEDED_QUERY_COMPARATOR */
T0* GE_new1853(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1853);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1853;
	}
	return R;
}

/* New instance of type ET_SEEDED_PROCEDURE_COMPARATOR */
T0* GE_new1856(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1856);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1856;
	}
	return R;
}

/* New instance of type TUPLE [ET_CLIENT_LIST] */
T0* GE_new1860(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1860);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1860;
	}
	return R;
}

/* New instance of type ET_STANDARD_ONCE_KEYS */
T0* GE_new1864(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1864);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1864;
	}
	return R;
}

/* New instance of type XM_COMMENT */
T0* GE_new1867(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1867);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1867;
	}
	return R;
}

/* New instance of type XM_PROCESSING_INSTRUCTION */
T0* GE_new1868(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1868);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1868;
	}
	return R;
}

/* New instance of type XM_CHARACTER_DATA */
T0* GE_new1869(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1869);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1869;
	}
	return R;
}

/* New instance of type ET_PARENTHESIS_SYMBOL */
T0* GE_new1885(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1885);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1885;
	}
	return R;
}

/* New instance of type ET_PARENTHESIS_INSTRUCTION */
T0* GE_new1888(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1888);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1888;
	}
	return R;
}

/* New instance of type ET_UNFOLDED_TUPLE_ACTUAL_ARGUMENT_LIST */
T0* GE_new1892(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1892);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1892;
	}
	return R;
}

/* New instance of type ET_AGENT_IMPLICIT_OPEN_ARGUMENT_LIST */
T0* GE_new1893(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1893);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1893;
	}
	return R;
}

/* New instance of type ET_AGENT_IMPLICIT_OPEN_ARGUMENT */
T0* GE_new1894(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1894);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1894;
	}
	return R;
}

/* New instance of type ET_INFIX_CAST_EXPRESSION */
T0* GE_new1896(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1896);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1896;
	}
	return R;
}

/* New instance of type SPECIAL [ET_DYNAMIC_PRECURSOR] */
T0* GE_new1899(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1899)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1899;
		((T1899*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_DYNAMIC_PRECURSOR] */
T0* GE_new1900(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1900);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1900;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_MASTER_CLASS] */
T0* GE_new1908(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1908);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1908;
	}
	return R;
}

/* New instance of type ET_BASE_TYPE_RENAME_CONSTRAINT */
T0* GE_new1910(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1910);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1910;
	}
	return R;
}

/* New instance of type DS_SPARSE_TABLE_KEYS [ET_CLIENT, ET_CLASS] */
T0* GE_new1913(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1913);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1913;
	}
	return R;
}

/* New instance of type SPECIAL [NATURAL_16] */
T0* GE_new1922(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1922)+a1*sizeof(T9);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1922;
		((T1922*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type ARRAY [NATURAL_16] */
T0* GE_new1923(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1923);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1923;
	}
	return R;
}

/* New instance of type ARRAY [NATURAL_32] */
T0* GE_new1924(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1924);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1924;
	}
	return R;
}

/* New instance of type SPECIAL [detachable ET_FORMAL_PARAMETER_TYPE] */
T0* GE_new1925(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1925)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1925;
		((T1925*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [detachable ET_FORMAL_PARAMETER_TYPE] */
T0* GE_new1926(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1926);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1926;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [detachable ET_FORMAL_PARAMETER_TYPE] */
T0* GE_new1927(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1927);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1927;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ECF_ADAPTED_LIBRARY] */
T0* GE_new1928(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1928);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1928;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ECF_ADAPTED_DOTNET_ASSEMBLY] */
T0* GE_new1929(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1929);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1929;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ECF_FILE_RULE] */
T0* GE_new1930(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1930);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1930;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ECF_NAMESPACE] */
T0* GE_new1931(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1931);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1931;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ECF_EXTERNAL_CFLAG] */
T0* GE_new1932(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1932);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1932;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ECF_EXTERNAL_INCLUDE] */
T0* GE_new1933(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1933);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1933;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ECF_EXTERNAL_LIBRARY] */
T0* GE_new1934(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1934);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1934;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ECF_EXTERNAL_LINKER_FLAG] */
T0* GE_new1935(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1935);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1935;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ECF_EXTERNAL_MAKE] */
T0* GE_new1936(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1936);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1936;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ECF_EXTERNAL_OBJECT] */
T0* GE_new1937(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1937);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1937;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ECF_EXTERNAL_RESOURCE] */
T0* GE_new1938(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1938);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1938;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_ACTION] */
T0* GE_new1939(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1939);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1939;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_ACTION] */
T0* GE_new1940(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1940)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1940;
		((T1940*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ECF_ACTION] */
T0* GE_new1941(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1941);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1941;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [RX_PCRE_REGULAR_EXPRESSION] */
T0* GE_new1942(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1942);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1942;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_OPTIONS] */
T0* GE_new1943(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1943)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1943;
		((T1943*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_OPTIONS] */
T0* GE_new1946(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1946);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1946;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_VISIBLE_CLASS] */
T0* GE_new1947(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1947);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1947;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_VISIBLE_CLASS] */
T0* GE_new1948(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1948)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1948;
		((T1948*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ECF_VISIBLE_CLASS] */
T0* GE_new1949(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1949);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1949;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ECF_ANDED_CONDITIONS] */
T0* GE_new1950(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1950);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1950;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_ECF_CONDITION_ITEM] */
T0* GE_new1951(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1951);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1951;
	}
	return R;
}

/* New instance of type DS_HASH_SET_CURSOR [ET_DOTNET_ASSEMBLY] */
T0* GE_new1952(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1952);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1952;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_DOTNET_ASSEMBLY] */
T0* GE_new1953(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1953);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1953;
	}
	return R;
}

/* New instance of type SPECIAL [ET_DOTNET_ASSEMBLY] */
T0* GE_new1954(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1954)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1954;
		((T1954*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_HASH_SET_CURSOR [ET_INTERNAL_UNIVERSE] */
T0* GE_new1956(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1956);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1956;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_INTERNAL_UNIVERSE] */
T0* GE_new1958(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1958);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1958;
	}
	return R;
}

/* New instance of type SPECIAL [ET_INTERNAL_UNIVERSE] */
T0* GE_new1959(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1959)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1959;
		((T1959*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type ET_CLASS_TYPE_STATUS_CHECKER1 */
T0* GE_new1960(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1960);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1960;
	}
	return R;
}

/* New instance of type ET_CLASS_TYPE_STATUS_CHECKER2 */
T0* GE_new1961(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1961);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1961;
	}
	return R;
}

/* New instance of type ET_QUALIFIED_ANCHORED_TYPE_STATUS_CHECKER */
T0* GE_new1962(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1962);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1962;
	}
	return R;
}

/* New instance of type ET_CLASS_TYPE_STATUS_CHECKER3 */
T0* GE_new1963(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1963);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1963;
	}
	return R;
}

/* New instance of type DS_HASH_SET_CURSOR [ET_LIBRARY] */
T0* GE_new1964(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1964);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1964;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_LIBRARY] */
T0* GE_new1965(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1965);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1965;
	}
	return R;
}

/* New instance of type SPECIAL [ET_LIBRARY] */
T0* GE_new1966(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1966)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1966;
		((T1966*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type LX_DFA_WILDCARD */
T0* GE_new1967(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1967);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1967;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [LX_WILDCARD, STRING_8] */
T0* GE_new1968(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1968);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1968;
	}
	return R;
}

/* New instance of type DS_LINKED_QUEUE [CHARACTER_8] */
T0* GE_new1971(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1971);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1971;
	}
	return R;
}

/* New instance of type UC_UTF16_ROUTINES */
T0* GE_new1972(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1972);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1972;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ECF_TARGET] */
T0* GE_new1973(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1973);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1973;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ADAPTED_UNIVERSE] */
T0* GE_new1974(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1974)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1974;
		((T1974*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ADAPTED_UNIVERSE] */
T0* GE_new1975(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1975);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1975;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ADAPTED_UNIVERSE] */
T0* GE_new1976(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1976);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1976;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_TARGET_PARENT] */
T0* GE_new1977(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1977)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1977;
		((T1977*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_TARGET_PARENT] */
T0* GE_new1978(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1978);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1978;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ECF_TARGET_PARENT] */
T0* GE_new1979(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1979);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1979;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_CLUSTER] */
T0* GE_new1980(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1980)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1980;
		((T1980*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_CLUSTER] */
T0* GE_new1981(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1981);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1981;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ECF_CLUSTER] */
T0* GE_new1982(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1982);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1982;
	}
	return R;
}

/* New instance of type SPECIAL [ET_DYNAMIC_TARGET] */
T0* GE_new1983(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1983)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1983;
		((T1983*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_DYNAMIC_TARGET] */
T0* GE_new1984(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1984);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1984;
	}
	return R;
}

/* New instance of type SPECIAL [YY_BUFFER] */
T0* GE_new1985(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1985)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1985;
		((T1985*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [YY_BUFFER] */
T0* GE_new1986(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1986);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1986;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [INTEGER_32, ET_CLASS] */
T0* GE_new1988(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1988);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1988;
	}
	return R;
}

/* New instance of type SPECIAL [ET_BASE_TYPE_CONSTRAINT] */
T0* GE_new1989(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1989)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1989;
		((T1989*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_BASE_TYPE_CONSTRAINT] */
T0* GE_new1990(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1990);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1990;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_BASE_TYPE_CONSTRAINT] */
T0* GE_new1991(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1991);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1991;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [NATURAL_32] */
T0* GE_new1992(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1992);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1992;
	}
	return R;
}

/* New instance of type DS_HASH_SET_CURSOR [ET_FEATURE_NAME] */
T0* GE_new1993(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1993);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1993;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [BOOLEAN, ET_FEATURE_NAME] */
T0* GE_new1994(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1994);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1994;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [ET_REPLICABLE_FEATURE, INTEGER_32] */
T0* GE_new1996(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1996);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1996;
	}
	return R;
}

/* New instance of type SPECIAL [ET_REPLICABLE_FEATURE] */
T0* GE_new1997(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1997)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 1997;
		((T1997*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_REPLICABLE_FEATURE] */
T0* GE_new1999(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T1999);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 1999;
	}
	return R;
}

/* New instance of type DS_LINKED_LIST_CURSOR [ET_ADAPTED_FEATURE] */
T0* GE_new2000(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2000);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2000;
	}
	return R;
}

/* New instance of type DS_LINKABLE [ET_ADAPTED_FEATURE] */
T0* GE_new2001(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2001);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2001;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_PARENT_FEATURE] */
T0* GE_new2002(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2002);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2002;
	}
	return R;
}

/* New instance of type SPECIAL [ET_PARENT_FEATURE] */
T0* GE_new2003(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2003)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2003;
		((T2003*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_PARENT_FEATURE] */
T0* GE_new2004(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2004);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2004;
	}
	return R;
}

/* New instance of type SPECIAL [ET_DOTNET_FEATURE] */
T0* GE_new2005(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2005)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2005;
		((T2005*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_HASH_SET_CURSOR [ET_DOTNET_FEATURE] */
T0* GE_new2006(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2006);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2006;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_DOTNET_FEATURE] */
T0* GE_new2007(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2007);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2007;
	}
	return R;
}

/* New instance of type SPECIAL [DS_LINKED_LIST [ET_DOTNET_FEATURE]] */
T0* GE_new2008(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2008)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2008;
		((T2008*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [DS_LINKED_LIST [ET_DOTNET_FEATURE], ET_DOTNET_FEATURE] */
T0* GE_new2011(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2011);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2011;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [DS_LINKED_LIST [ET_DOTNET_FEATURE]] */
T0* GE_new2012(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2012);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2012;
	}
	return R;
}

/* New instance of type DS_LINKED_LIST_CURSOR [ET_DOTNET_FEATURE] */
T0* GE_new2013(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2013);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2013;
	}
	return R;
}

/* New instance of type DS_LINKABLE [ET_DOTNET_FEATURE] */
T0* GE_new2014(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2014);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2014;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [INTEGER_32, ET_LIKE_FEATURE] */
T0* GE_new2015(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2015);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2015;
	}
	return R;
}

/* New instance of type SPECIAL [ET_LIKE_FEATURE] */
T0* GE_new2016(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2016)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2016;
		((T2016*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_LIKE_FEATURE] */
T0* GE_new2017(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2017);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2017;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_LIKE_FEATURE] */
T0* GE_new2018(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2018);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2018;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [DS_HASH_TABLE [TUPLE [detachable ARRAY [ET_TYPE], detachable ET_TYPE, NATURAL_8], ET_FEATURE_NAME], NATURAL_8] */
T0* GE_new2020(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2020);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2020;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [DS_HASH_TABLE [TUPLE [detachable ARRAY [ET_TYPE], detachable ET_TYPE, NATURAL_8], ET_FEATURE_NAME]] */
T0* GE_new2021(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2021);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2021;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [TUPLE [detachable ARRAY [ET_TYPE], detachable ET_TYPE, NATURAL_8], ET_FEATURE_NAME] */
T0* GE_new2022(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2022);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2022;
	}
	return R;
}

/* New instance of type SPECIAL [DS_HASH_TABLE [TUPLE [detachable ARRAY [ET_TYPE], detachable ET_TYPE, NATURAL_8], ET_FEATURE_NAME]] */
T0* GE_new2023(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2023)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2023;
		((T2023*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_BILINKED_LIST_CURSOR [XM_DTD_ELEMENT_CONTENT] */
T0* GE_new2024(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2024);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2024;
	}
	return R;
}

/* New instance of type DS_BILINKABLE [XM_DTD_ELEMENT_CONTENT] */
T0* GE_new2025(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2025);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2025;
	}
	return R;
}

/* New instance of type DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]] */
T0* GE_new2027(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2027);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2027;
	}
	return R;
}

/* New instance of type DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]] */
T0* GE_new2028(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2028);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2028;
	}
	return R;
}

/* New instance of type DS_LINKABLE [detachable STRING_8] */
T0* GE_new2029(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2029);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2029;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_DOTNET_ASSEMBLY] */
T0* GE_new2030(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2030);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2030;
	}
	return R;
}

/* New instance of type ET_CLUSTER_ERROR */
T0* GE_new2031(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2031);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2031;
	}
	return R;
}

/* New instance of type TUPLE [ET_SYSTEM, DS_HASH_TABLE [INTEGER_32, ET_UNIVERSE], INTEGER_32] */
T0* GE_new2032(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2032);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2032;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_CLUSTER] */
T0* GE_new2033(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2033);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2033;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_ECF_CLUSTER]] */
T0* GE_new2034(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2034);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2034;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_TARGET, STRING_8] */
T0* GE_new2035(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2035);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2035;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_ADAPTED_LIBRARY] */
T0* GE_new2037(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2037);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2037;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_ECF_ADAPTED_LIBRARY]] */
T0* GE_new2038(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2038);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2038;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_ADAPTED_DOTNET_ASSEMBLY] */
T0* GE_new2039(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2039);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2039;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_ECF_ADAPTED_DOTNET_ASSEMBLY]] */
T0* GE_new2040(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2040);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2040;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [STRING_8]] */
T0* GE_new2043(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2043);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2043;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_OPTIONS, STRING_8] */
T0* GE_new2044(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2044);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2044;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [DS_HASH_TABLE [INTEGER_32, STRING_8], STRING_8] */
T0* GE_new2045(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2045);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2045;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_EQUALITY_EXPRESSION */
T0* GE_new2046(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2046);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2046;
	}
	return R;
}

/* New instance of type ET_DYNAMIC_OBJECT_EQUALITY_EXPRESSION */
T0* GE_new2047(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2047);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2047;
	}
	return R;
}

/* New instance of type ET_AST_PRETTY_PRINTER */
T0* GE_new2052(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2052);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2052;
	}
	return R;
}

/* New instance of type KL_CHARACTER_ROUTINES */
T0* GE_new2054(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2054);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2054;
	}
	return R;
}

/* New instance of type TUPLE [ET_C_GENERATOR, ET_SEPARATE_CALL, ET_DYNAMIC_FEATURE, ET_DYNAMIC_PRIMARY_TYPE] */
T0* GE_new2055(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2055);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2055;
	}
	return R;
}

/* New instance of type TUPLE [ET_C_GENERATOR, ET_DYNAMIC_FEATURE, ET_DYNAMIC_PRIMARY_TYPE] */
T0* GE_new2056(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2056);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2056;
	}
	return R;
}

/* New instance of type TUPLE [ET_C_GENERATOR, INTEGER_32, ET_CURRENT, ET_DYNAMIC_TUPLE_TYPE, BOOLEAN] */
T0* GE_new2057(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2057);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2057;
	}
	return R;
}

/* New instance of type TUPLE [ET_GROUP] */
T0* GE_new2065(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2065);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2065;
	}
	return R;
}

/* New instance of type TUPLE [PROCEDURE [TUPLE [ET_CLASS]], PREDICATE [TUPLE [ET_CLASS]]] */
T0* GE_new2066(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2066);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2066;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_LIBRARY, DS_HASH_TABLE [INTEGER_32, ET_UNIVERSE], INTEGER_32] */
T0* GE_new2067(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2067);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2067;
	}
	return R;
}

/* New instance of type ET_CONVERT_BUILTIN_EXPRESSION */
T0* GE_new2068(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2068);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2068;
	}
	return R;
}

/* New instance of type ET_CONVERT_FROM_EXPRESSION */
T0* GE_new2069(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2069);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2069;
	}
	return R;
}

/* New instance of type ET_CONVERT_TO_EXPRESSION */
T0* GE_new2070(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2070);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2070;
	}
	return R;
}

/* New instance of type DS_LINKABLE [XM_ELEMENT_NODE] */
T0* GE_new2082(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2082);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2082;
	}
	return R;
}

/* New instance of type TUPLE [detachable ARRAY [ET_TYPE], detachable ET_TYPE, NATURAL_8] */
T0* GE_new2083(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2083);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2083;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_FEATURE] */
T0* GE_new2086(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2086);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2086;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_EXTERNAL_CFLAG] */
T0* GE_new2092(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2092);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2092;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_ECF_EXTERNAL_CFLAG]] */
T0* GE_new2093(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2093);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2093;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_TARGET, ET_ECF_STATE] */
T0* GE_new2094(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2094);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2094;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_EXTERNAL_INCLUDE] */
T0* GE_new2095(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2095);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2095;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_ECF_EXTERNAL_INCLUDE]] */
T0* GE_new2096(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2096);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2096;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_EXTERNAL_LIBRARY] */
T0* GE_new2097(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2097);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2097;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_ECF_EXTERNAL_LIBRARY]] */
T0* GE_new2098(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2098);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2098;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_EXTERNAL_LINKER_FLAG] */
T0* GE_new2099(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2099);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2099;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_ECF_EXTERNAL_LINKER_FLAG]] */
T0* GE_new2100(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2100);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2100;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_EXTERNAL_MAKE] */
T0* GE_new2101(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2101);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2101;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_ECF_EXTERNAL_MAKE]] */
T0* GE_new2102(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2102);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2102;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_EXTERNAL_OBJECT] */
T0* GE_new2103(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2103);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2103;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_ECF_EXTERNAL_OBJECT]] */
T0* GE_new2104(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2104);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2104;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_EXTERNAL_RESOURCE] */
T0* GE_new2105(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2105);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2105;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_ECF_EXTERNAL_RESOURCE]] */
T0* GE_new2106(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2106);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2106;
	}
	return R;
}

/* New instance of type TUPLE [LX_WILDCARD] */
T0* GE_new2109(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2109);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2109;
	}
	return R;
}

/* New instance of type PREDICATE [TUPLE [LX_WILDCARD]] */
T0* GE_new2110(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2110);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2110;
	}
	return R;
}

/* New instance of type TUPLE [ET_CLUSTER_DEPENDENCE_CONSTRAINT, ET_GROUP, STRING_8] */
T0* GE_new2111(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2111);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2111;
	}
	return R;
}

/* New instance of type PREDICATE [TUPLE [STRING_8]] */
T0* GE_new2113(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2113);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2113;
	}
	return R;
}

/* New instance of type TUPLE [KL_STRING_ROUTINES, STRING_8] */
T0* GE_new2114(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2114);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2114;
	}
	return R;
}

/* New instance of type DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]] */
T0* GE_new2116(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2116);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2116;
	}
	return R;
}

/* New instance of type SPECIAL [ET_AGENT_IMPLICIT_OPEN_ARGUMENT] */
T0* GE_new2118(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2118)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2118;
		((T2118*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_AGENT_IMPLICIT_OPEN_ARGUMENT] */
T0* GE_new2119(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2119);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2119;
	}
	return R;
}

/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [ET_CLIENT, ET_CLASS] */
T0* GE_new2120(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2120);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2120;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_ADAPTED_LIBRARY] */
T0* GE_new2122(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2122)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2122;
		((T2122*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_ADAPTED_LIBRARY] */
T0* GE_new2123(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2123);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2123;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ECF_ADAPTED_LIBRARY] */
T0* GE_new2124(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2124);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2124;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_ADAPTED_DOTNET_ASSEMBLY] */
T0* GE_new2125(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2125)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2125;
		((T2125*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_ADAPTED_DOTNET_ASSEMBLY] */
T0* GE_new2126(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2126);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2126;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ECF_ADAPTED_DOTNET_ASSEMBLY] */
T0* GE_new2127(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2127);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2127;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_FILE_RULE] */
T0* GE_new2128(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2128);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2128;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_FILE_RULE] */
T0* GE_new2129(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2129)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2129;
		((T2129*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ECF_FILE_RULE] */
T0* GE_new2130(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2130);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2130;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_NAMESPACE] */
T0* GE_new2131(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2131);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2131;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_NAMESPACE] */
T0* GE_new2132(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2132)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2132;
		((T2132*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ECF_NAMESPACE] */
T0* GE_new2133(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2133);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2133;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_EXTERNAL_CFLAG] */
T0* GE_new2134(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2134);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2134;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_EXTERNAL_CFLAG] */
T0* GE_new2135(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2135)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2135;
		((T2135*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ECF_EXTERNAL_CFLAG] */
T0* GE_new2136(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2136);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2136;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_EXTERNAL_INCLUDE] */
T0* GE_new2137(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2137);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2137;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_EXTERNAL_INCLUDE] */
T0* GE_new2138(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2138)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2138;
		((T2138*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ECF_EXTERNAL_INCLUDE] */
T0* GE_new2139(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2139);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2139;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_EXTERNAL_LIBRARY] */
T0* GE_new2140(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2140);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2140;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_EXTERNAL_LIBRARY] */
T0* GE_new2141(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2141)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2141;
		((T2141*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ECF_EXTERNAL_LIBRARY] */
T0* GE_new2142(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2142);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2142;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_EXTERNAL_LINKER_FLAG] */
T0* GE_new2143(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2143);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2143;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_EXTERNAL_LINKER_FLAG] */
T0* GE_new2144(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2144)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2144;
		((T2144*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ECF_EXTERNAL_LINKER_FLAG] */
T0* GE_new2145(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2145);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2145;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_EXTERNAL_MAKE] */
T0* GE_new2146(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2146);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2146;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_EXTERNAL_MAKE] */
T0* GE_new2147(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2147)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2147;
		((T2147*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ECF_EXTERNAL_MAKE] */
T0* GE_new2148(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2148);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2148;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_EXTERNAL_OBJECT] */
T0* GE_new2149(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2149);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2149;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_EXTERNAL_OBJECT] */
T0* GE_new2150(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2150)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2150;
		((T2150*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ECF_EXTERNAL_OBJECT] */
T0* GE_new2151(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2151);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2151;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_EXTERNAL_RESOURCE] */
T0* GE_new2152(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2152);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2152;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_EXTERNAL_RESOURCE] */
T0* GE_new2153(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2153)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2153;
		((T2153*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ECF_EXTERNAL_RESOURCE] */
T0* GE_new2154(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2154);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2154;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [RX_PCRE_REGULAR_EXPRESSION] */
T0* GE_new2155(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2155);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2155;
	}
	return R;
}

/* New instance of type SPECIAL [RX_PCRE_REGULAR_EXPRESSION] */
T0* GE_new2156(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2156)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2156;
		((T2156*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [RX_PCRE_REGULAR_EXPRESSION] */
T0* GE_new2157(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2157);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2157;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_ANDED_CONDITIONS] */
T0* GE_new2158(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2158);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2158;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_ANDED_CONDITIONS] */
T0* GE_new2159(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2159)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2159;
		((T2159*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ECF_ANDED_CONDITIONS] */
T0* GE_new2160(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2160);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2160;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_ECF_CONDITION_ITEM] */
T0* GE_new2161(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2161);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2161;
	}
	return R;
}

/* New instance of type SPECIAL [ET_ECF_CONDITION_ITEM] */
T0* GE_new2162(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2162)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2162;
		((T2162*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_ECF_CONDITION_ITEM] */
T0* GE_new2163(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2163);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2163;
	}
	return R;
}

/* New instance of type LX_WILDCARD_PARSER */
T0* GE_new2165(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2165);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2165;
	}
	return R;
}

/* New instance of type LX_DESCRIPTION */
T0* GE_new2166(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2166);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2166;
	}
	return R;
}

/* New instance of type LX_FULL_DFA */
T0* GE_new2167(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2167);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2167;
	}
	return R;
}

/* New instance of type SPECIAL [LX_WILDCARD] */
T0* GE_new2169(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2169)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2169;
		((T2169*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [LX_WILDCARD] */
T0* GE_new2172(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2172);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2172;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [LX_WILDCARD, STRING_8] */
T0* GE_new2173(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2173);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2173;
	}
	return R;
}

/* New instance of type DS_LINKABLE [CHARACTER_8] */
T0* GE_new2174(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2174);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2174;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [INTEGER_32, ET_LIKE_FEATURE] */
T0* GE_new2176(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2176);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2176;
	}
	return R;
}

/* New instance of type SPECIAL [TUPLE [detachable ARRAY [ET_TYPE], detachable ET_TYPE, NATURAL_8]] */
T0* GE_new2177(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2177)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2177;
		((T2177*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [TUPLE [detachable ARRAY [ET_TYPE], detachable ET_TYPE, NATURAL_8]] */
T0* GE_new2180(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2180);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2180;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [TUPLE [detachable ARRAY [ET_TYPE], detachable ET_TYPE, NATURAL_8], ET_FEATURE_NAME] */
T0* GE_new2181(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2181);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2181;
	}
	return R;
}

/* New instance of type DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]] */
T0* GE_new2182(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2182);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2182;
	}
	return R;
}

/* New instance of type ARRAYED_LIST [INTEGER_32] */
T0* GE_new2183(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2183);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2183;
	}
	return R;
}

/* New instance of type ET_UNIVERSE_ERROR */
T0* GE_new2184(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2184);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2184;
	}
	return R;
}

/* New instance of type ET_DOTNET_ASSEMBLY_ERROR */
T0* GE_new2185(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2185);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2185;
	}
	return R;
}

/* New instance of type AP_OPTION_COMPARATOR */
T0* GE_new2186(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2186);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2186;
	}
	return R;
}

/* New instance of type DS_QUICK_SORTER [AP_OPTION] */
T0* GE_new2187(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2187);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2187;
	}
	return R;
}

/* New instance of type ET_UNFOLDED_TUPLE_ACTUAL_PARAMETERS */
T0* GE_new2190(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2190);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2190;
	}
	return R;
}

/* New instance of type ET_ACTUAL_PARAMETER_SUBLIST */
T0* GE_new2191(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2191);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2191;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_FILE_RULE] */
T0* GE_new2194(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2194);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2194;
	}
	return R;
}

/* New instance of type PREDICATE [TUPLE [ET_ECF_FILE_RULE]] */
T0* GE_new2195(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2195);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2195;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_ECF_FILE_RULE]] */
T0* GE_new2197(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2197);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2197;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_FILE_RULES] */
T0* GE_new2198(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2198);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2198;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_STATE] */
T0* GE_new2199(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2199);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2199;
	}
	return R;
}

/* New instance of type SPECIAL [DS_HASH_TABLE [INTEGER_32, STRING_8]] */
T0* GE_new2202(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2202)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2202;
		((T2202*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [DS_HASH_TABLE [INTEGER_32, STRING_8]] */
T0* GE_new2205(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2205);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2205;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [DS_HASH_TABLE [INTEGER_32, STRING_8], STRING_8] */
T0* GE_new2206(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2206);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2206;
	}
	return R;
}

/* New instance of type ET_COMMENT_FINDER */
T0* GE_new2208(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2208);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2208;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_BREAK] */
T0* GE_new2209(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2209);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2209;
	}
	return R;
}

/* New instance of type TUPLE [ET_BREAK] */
T0* GE_new2210(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2210);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2210;
	}
	return R;
}

/* New instance of type PROCEDURE [TUPLE [ET_BREAK]] */
T0* GE_new2211(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2211);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2211;
	}
	return R;
}

/* New instance of type TUPLE [ET_AST_PRETTY_PRINTER] */
T0* GE_new2212(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2212);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2212;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [LX_RULE] */
T0* GE_new2213(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2213);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2213;
	}
	return R;
}

/* New instance of type LX_START_CONDITIONS */
T0* GE_new2214(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2214);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2214;
	}
	return R;
}

/* New instance of type LX_ACTION_FACTORY */
T0* GE_new2215(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2215);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2215;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [DS_ARRAYED_LIST [DS_ARRAYED_LIST [LX_SYMBOL_CLASS]], LX_SYMBOL_CLASS] */
T0* GE_new2216(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2216);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2216;
	}
	return R;
}

/* New instance of type LX_SYMBOL_CLASS */
T0* GE_new2217(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2217);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2217;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [STRING_32, STRING_8] */
T0* GE_new2218(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2218);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2218;
	}
	return R;
}

/* New instance of type DS_HASH_SET [LX_SYMBOL_CLASS] */
T0* GE_new2219(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2219);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2219;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING_32] */
T0* GE_new2220(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2220);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2220;
	}
	return R;
}

/* New instance of type KL_EQUALITY_TESTER [STRING_32] */
T0* GE_new2221(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2221);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2221;
	}
	return R;
}

/* New instance of type DS_ARRAYED_STACK [BOOLEAN] */
T0* GE_new2222(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2222);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2222;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [STRING_32] */
T0* GE_new2223(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2223);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2223;
	}
	return R;
}

/* New instance of type SPECIAL [STRING_32] */
T0* GE_new2224(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2224)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2224;
		((T2224*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS] */
T0* GE_new2225(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2225);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2225;
	}
	return R;
}

/* New instance of type SPECIAL [LX_SYMBOL_CLASS] */
T0* GE_new2226(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2226)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2226;
		((T2226*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [LX_NFA] */
T0* GE_new2227(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2227);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2227;
	}
	return R;
}

/* New instance of type LX_NFA */
T0* GE_new2228(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2228);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2228;
	}
	return R;
}

/* New instance of type SPECIAL [LX_NFA] */
T0* GE_new2229(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2229)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2229;
		((T2229*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type LX_RULE */
T0* GE_new2230(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2230);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2230;
	}
	return R;
}

/* New instance of type DS_HASH_SET_CURSOR [LX_SYMBOL_CLASS] */
T0* GE_new2231(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2231);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2231;
	}
	return R;
}

/* New instance of type LX_EQUIVALENCE_CLASSES */
T0* GE_new2232(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2232);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2232;
	}
	return R;
}

/* New instance of type LX_UNRECOGNIZED_RULE_ERROR */
T0* GE_new2233(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2233);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2233;
	}
	return R;
}

/* New instance of type LX_INVALID_UNICODE_CHARACTER_ERROR */
T0* GE_new2234(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2234);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2234;
	}
	return R;
}

/* New instance of type LX_MISSING_QUOTE_ERROR */
T0* GE_new2235(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2235);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2235;
	}
	return R;
}

/* New instance of type LX_BAD_CHARACTER_CLASS_ERROR */
T0* GE_new2236(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2236);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2236;
	}
	return R;
}

/* New instance of type LX_BAD_CHARACTER_ERROR */
T0* GE_new2237(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2237);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2237;
	}
	return R;
}

/* New instance of type LX_FULL_AND_META_ERROR */
T0* GE_new2238(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2238);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2238;
	}
	return R;
}

/* New instance of type LX_FULL_AND_REJECT_ERROR */
T0* GE_new2239(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2239);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2239;
	}
	return R;
}

/* New instance of type LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR */
T0* GE_new2240(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2240);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2240;
	}
	return R;
}

/* New instance of type LX_CHARACTER_OUT_OF_RANGE_ERROR */
T0* GE_new2241(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2241);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2241;
	}
	return R;
}

/* New instance of type ARRAY [LX_RULE] */
T0* GE_new2242(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2242);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2242;
	}
	return R;
}

/* New instance of type SPECIAL [LX_RULE] */
T0* GE_new2243(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2243)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2243;
		((T2243*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type LX_DFA_STATE */
T0* GE_new2244(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2244);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2244;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [LX_NFA_STATE] */
T0* GE_new2245(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2245);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2245;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [LX_DFA_STATE] */
T0* GE_new2246(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2246);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2246;
	}
	return R;
}

/* New instance of type LX_SYMBOL_PARTITIONS */
T0* GE_new2247(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2247);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2247;
	}
	return R;
}

/* New instance of type KL_ARRAY_ROUTINES [LX_RULE] */
T0* GE_new2248(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2248);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2248;
	}
	return R;
}

/* New instance of type ARRAY [detachable LX_RULE] */
T0* GE_new2249(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2249);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2249;
	}
	return R;
}

/* New instance of type SPECIAL [detachable LX_RULE] */
T0* GE_new2250(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2250)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2250;
		((T2250*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type LX_START_CONDITION */
T0* GE_new2251(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2251);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2251;
	}
	return R;
}

/* New instance of type LX_TRANSITION_TABLE [LX_DFA_STATE] */
T0* GE_new2252(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2252);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2252;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [LX_NFA] */
T0* GE_new2253(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2253);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2253;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [LX_NFA, INTEGER_32] */
T0* GE_new2254(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2254);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2254;
	}
	return R;
}

/* New instance of type LX_NFA_STATE */
T0* GE_new2255(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2255);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2255;
	}
	return R;
}

/* New instance of type DS_SPARSE_TABLE_KEYS_CURSOR [detachable RX_REGULAR_EXPRESSION, STRING_8] */
T0* GE_new2261(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2261);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2261;
	}
	return R;
}

/* New instance of type TUPLE [RX_PCRE_REGULAR_EXPRESSION] */
T0* GE_new2262(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2262);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2262;
	}
	return R;
}

/* New instance of type PREDICATE [TUPLE [RX_PCRE_REGULAR_EXPRESSION]] */
T0* GE_new2263(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2263);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2263;
	}
	return R;
}

/* New instance of type TUPLE [DS_HASH_SET [STRING_8]] */
T0* GE_new2266(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2266);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2266;
	}
	return R;
}

/* New instance of type DS_LINKABLE [ET_PARENT_FEATURE] */
T0* GE_new2268(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2268);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2268;
	}
	return R;
}

/* New instance of type ARRAY [detachable LX_SYMBOL_CLASS] */
T0* GE_new2269(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2269);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2269;
	}
	return R;
}

/* New instance of type SPECIAL [detachable LX_SYMBOL_CLASS] */
T0* GE_new2270(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2270)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2270;
		((T2270*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type ARRAY [detachable DS_HASH_SET [INTEGER_32]] */
T0* GE_new2271(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2271);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2271;
	}
	return R;
}

/* New instance of type SPECIAL [detachable DS_HASH_SET [INTEGER_32]] */
T0* GE_new2272(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2272)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2272;
		((T2272*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [DS_ARRAYED_LIST [LX_SYMBOL_CLASS]] */
T0* GE_new2273(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2273);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2273;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [LX_SYMBOL_CLASS] */
T0* GE_new2274(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2274);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2274;
	}
	return R;
}

/* New instance of type LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR */
T0* GE_new2275(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2275);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2275;
	}
	return R;
}

/* New instance of type ET_AST_NULL_LEAF */
T0* GE_new2276(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2276);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2276;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST [ET_AST_NODE] */
T0* GE_new2277(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2277);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2277;
	}
	return R;
}

/* New instance of type SPECIAL [ET_BREAK] */
T0* GE_new2279(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2279)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2279;
		((T2279*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_BREAK] */
T0* GE_new2280(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2280);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2280;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_BREAK] */
T0* GE_new2281(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2281);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2281;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [LX_RULE] */
T0* GE_new2282(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2282);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2282;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_RULE] */
T0* GE_new2283(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2283);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2283;
	}
	return R;
}

/* New instance of type KL_ARRAY_ROUTINES [STRING_8] */
T0* GE_new2284(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2284);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2284;
	}
	return R;
}

/* New instance of type SPECIAL [LX_START_CONDITION] */
T0* GE_new2285(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2285)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2285;
		((T2285*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [LX_START_CONDITION] */
T0* GE_new2286(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2286);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2286;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION] */
T0* GE_new2287(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2287);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2287;
	}
	return R;
}

/* New instance of type SPECIAL [DS_ARRAYED_LIST [DS_ARRAYED_LIST [LX_SYMBOL_CLASS]]] */
T0* GE_new2288(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2288)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2288;
		((T2288*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_EQUALITY_TESTER [LX_SYMBOL_CLASS] */
T0* GE_new2289(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2289);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2289;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [DS_ARRAYED_LIST [LX_SYMBOL_CLASS]]] */
T0* GE_new2291(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2291);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2291;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [DS_ARRAYED_LIST [DS_ARRAYED_LIST [LX_SYMBOL_CLASS]], LX_SYMBOL_CLASS] */
T0* GE_new2292(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2292);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2292;
	}
	return R;
}

/* New instance of type SPECIAL [detachable SPECIAL [NATURAL_64]] */
T0* GE_new2293(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2293)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2293;
		((T2293*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [STRING_32, STRING_8] */
T0* GE_new2295(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2295);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2295;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING_32] */
T0* GE_new2297(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2297);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2297;
	}
	return R;
}

/* New instance of type LX_EPSILON_TRANSITION [LX_NFA_STATE] */
T0* GE_new2298(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2298);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2298;
	}
	return R;
}

/* New instance of type LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE] */
T0* GE_new2301(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2301);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2301;
	}
	return R;
}

/* New instance of type LX_SYMBOL_TRANSITION [LX_NFA_STATE] */
T0* GE_new2302(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2302);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2302;
	}
	return R;
}

/* New instance of type LX_ACTION */
T0* GE_new2304(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2304);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2304;
	}
	return R;
}

/* New instance of type ARRAY [DS_BILINKABLE [INTEGER_32]] */
T0* GE_new2305(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2305);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2305;
	}
	return R;
}

/* New instance of type DS_BILINKABLE [INTEGER_32] */
T0* GE_new2306(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2306);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2306;
	}
	return R;
}

/* New instance of type SPECIAL [DS_BILINKABLE [INTEGER_32]] */
T0* GE_new2307(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2307)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2307;
		((T2307*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type DS_BUBBLE_SORTER [LX_NFA_STATE] */
T0* GE_new2308(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2308);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2308;
	}
	return R;
}

/* New instance of type DS_BUBBLE_SORTER [LX_RULE] */
T0* GE_new2310(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2310);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2310;
	}
	return R;
}

/* New instance of type SPECIAL [LX_NFA_STATE] */
T0* GE_new2312(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2312)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2312;
		((T2312*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [LX_NFA_STATE] */
T0* GE_new2314(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2314);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2314;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE] */
T0* GE_new2315(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2315);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2315;
	}
	return R;
}

/* New instance of type SPECIAL [LX_DFA_STATE] */
T0* GE_new2317(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2317)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2317;
		((T2317*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [LX_DFA_STATE] */
T0* GE_new2318(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2318);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2318;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE] */
T0* GE_new2319(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2319);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2319;
	}
	return R;
}

/* New instance of type KL_ARRAY [LX_RULE] */
T0* GE_new2320(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2320);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2320;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE [LX_DFA_STATE, INTEGER_32] */
T0* GE_new2321(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2321);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2321;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_NFA] */
T0* GE_new2322(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2322);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2322;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER_32] */
T0* GE_new2324(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2324);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2324;
	}
	return R;
}

/* New instance of type TUPLE [ET_LIBRARY, DS_HASH_TABLE [INTEGER_32, ET_UNIVERSE], INTEGER_32] */
T0* GE_new2325(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2325);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2325;
	}
	return R;
}

/* New instance of type TUPLE [ET_DOTNET_ASSEMBLY, DS_HASH_TABLE [INTEGER_32, ET_UNIVERSE], INTEGER_32] */
T0* GE_new2326(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2326);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2326;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_LIBRARY] */
T0* GE_new2327(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2327);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2327;
	}
	return R;
}

/* New instance of type TUPLE [ET_ECF_DOTNET_ASSEMBLY, DS_HASH_TABLE [INTEGER_32, ET_UNIVERSE], INTEGER_32] */
T0* GE_new2329(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2329);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2329;
	}
	return R;
}

/* New instance of type KL_COMPARABLE_COMPARATOR [LX_RULE] */
T0* GE_new2334(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2334);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2334;
	}
	return R;
}

/* New instance of type KL_COMPARABLE_COMPARATOR [LX_NFA_STATE] */
T0* GE_new2337(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2337);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2337;
	}
	return R;
}

/* New instance of type SPECIAL [DS_ARRAYED_LIST [LX_SYMBOL_CLASS]] */
T0* GE_new2340(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2340)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2340;
		((T2340*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [LX_SYMBOL_CLASS]] */
T0* GE_new2341(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2341);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2341;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [LX_SYMBOL_CLASS]] */
T0* GE_new2342(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2342);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2342;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [LX_SYMBOL_CLASS] */
T0* GE_new2343(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2343);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2343;
	}
	return R;
}

/* New instance of type SPECIAL [ET_AST_NODE] */
T0* GE_new2345(TC* ac, T6 a1, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2345)+a1*sizeof(T0*);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2345;
		((T2345*)(R))->a1 = a1;
	}
	return R;
}

/* New instance of type KL_SPECIAL_ROUTINES [ET_AST_NODE] */
T0* GE_new2346(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2346);
	R = (T0*)GE_calloc_atomic(1, s);
	if (initialize) {
		((T0*)(R))->id = 2346;
	}
	return R;
}

/* New instance of type DS_ARRAYED_LIST_CURSOR [ET_AST_NODE] */
T0* GE_new2347(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2347);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2347;
	}
	return R;
}

/* New instance of type KL_ARRAY [STRING_8] */
T0* GE_new2348(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2348);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2348;
	}
	return R;
}

/* New instance of type DS_HASH_TABLE_CURSOR [LX_DFA_STATE, INTEGER_32] */
T0* GE_new2350(TC* ac, T1 initialize)
{
	T0* R;
	size_t s = sizeof(T2350);
	R = (T0*)GE_calloc(1, s);
	if (initialize) {
		((T0*)(R))->id = 2350;
	}
	return R;
}

/* GEC.execute */
T0* T26c74(TC* ac)
{
	T0* C;
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* m1 = 0;
	T0* t1;
	T1 t2;
	T0* t3;
	C = GE_new26(ac, EIF_TRUE);
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		t1 = (T37s1(ac));
		t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
		if (t2) {
			t1 = (T26s43(ac));
			t1 = (T38s1(ac));
			t3 = (T40s3(ac, m1));
			T39f6(ac, t1, t3);
		}
		t1 = (T26s40(ac));
		T36s2(ac, (T6)(GE_int32(4)));
		ac->last_rescue = r.previous;
		GE_raise(GE_EX_FAIL);
	}
GE_retry:
	t1 = (T26s41(ac));
	t1 = (T33f5(ac, t1));
	T26f75(ac, C, t1);
	t1 = (T26s40(ac));
	T36s2(ac, ((T26*)(C))->a1);
	ac->last_rescue = r.previous;
	return C;
}

/* GEC.execute_with_arguments */
void T26f75(TC* ac, T0* C, T0* a1)
{
	T0* l1 = 0;
	l1 = T42c193(ac);
	T26f76(ac, C, a1, l1);
}

/* GEC.execute_with_arguments_and_error_handler */
void T26f76(TC* ac, T0* C, T0* a1, T0* a2)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* m1 = 0;
	T0* t1;
	T1 t2;
	T1 t3;
	T0* t4;
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		((T26*)(C))->a1 = (T6)(GE_int32(4));
		ac->last_rescue = r.previous;
		GE_raise(GE_EX_FAIL);
	}
GE_retry:
	t1 = (T26s41(ac));
	T33f7(ac, t1, GE_ms8("gec", 3));
	t1 = (T26s53(ac));
	T44s16(ac);
	t1 = (T26s36(ac));
	T45s18(ac);
	((T26*)(C))->a2 = a2;
	T26f77(ac, C, a1);
	t2 = (T1)((((T26*)(C))->a1) == ((T6)(GE_int32(0))));
	if (t2) {
		t3 = (T46f9(ac, ((T26*)(C))->a3));
		t2 = ((T1)(!(t3)));
	}
	if (t2) {
		l1 = ((T26*)(C))->a4;
		t1 = (T26s44(ac));
		t4 = (T26s44(ac));
		t4 = (ge375ov6144044);
		t2 = (((((T0*)(t1))->id==151)?T151s2(ac, l1, t4):T152s2(ac, l1, t4)));
		if (t2) {
			l2 = T43c61(ac, l1);
			T43f62(ac, l2);
			t2 = (T43f30(ac, l2));
			if (t2) {
				T26f78(ac, C, l2);
				T43f63(ac, l2);
				t2 = (T1)(((T26*)(C))->a5==EIF_VOID);
				if (t2) {
					((T26*)(C))->a1 = (T6)(GE_int32(1));
				}
			} else {
				T26f79(ac, C, l1);
				((T26*)(C))->a1 = (T6)(GE_int32(1));
			}
			t1 = (T26s44(ac));
			t4 = GE_ma34(ac, (T6)5, (T6)5,
GE_ms8("library", 7),
GE_ms8("common", 6),
GE_ms8("config", 6),
GE_ms8("ecf", 3),
GE_ms8("default.ecf", 11));
			l1 = (((((T0*)(t1))->id==151)?T151s3(ac, GE_ms8("${GOBO}", 7), t4):T152s3(ac, GE_ms8("${GOBO}", 7), t4)));
			t1 = (T26s62(ac));
			l1 = (T49f2(ac, t1, l1));
		}
		t2 = (T1)((((T26*)(C))->a1) == ((T6)(GE_int32(0))));
		if (t2) {
			l2 = T43c61(ac, l1);
			T43f62(ac, l2);
			t2 = (T43f30(ac, l2));
			if (t2) {
				((T26*)(C))->a6 = EIF_VOID;
				T26f80(ac, C, l2);
				T43f63(ac, l2);
				t2 = (((T26*)(C))->a6?((m1 = ((T26*)(C))->a6, EIF_TRUE)):EIF_FALSE);
				if (t2) {
					T26f81(ac, C, m1);
					t2 = (T1)((((T26*)(C))->a1) == ((T6)(GE_int32(0))));
					if (t2) {
						t2 = (((((T0*)(((T26*)(C))->a2))->id==42)?((T42*)(((T26*)(C))->a2))->a1:((T63*)(((T26*)(C))->a2))->a1));
					}
					if (t2) {
						((T26*)(C))->a1 = (T6)(GE_int32(2));
					}
				} else {
					((T26*)(C))->a1 = (T6)(GE_int32(3));
				}
			} else {
				T26f79(ac, C, l1);
				((T26*)(C))->a1 = (T6)(GE_int32(1));
			}
		}
	}
	ac->last_rescue = r.previous;
}

/* GEC.process_system */
void T26f81(TC* ac, T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T6 volatile l4 = 0;
	T0* l5 = 0;
	T0* m1 = 0;
	T1 t1;
	T1 t2;
	T0* t3;
	T0* t4;
	T0* t5;
	if (((T0*)(((T26*)(C))->a2))->id==42) {
		T42f195(ac, ((T26*)(C))->a2);
	} else {
		T63f195(ac, ((T26*)(C))->a2);
	}
	t1 = (T26f45(ac, C));
	if (((T0*)(((T26*)(C))->a2))->id==42) {
		T42f196(ac, ((T26*)(C))->a2, t1);
	} else {
		T63f196(ac, ((T26*)(C))->a2, t1);
	}
	l4 = (T26f46(ac, C));
	l2 = (T98s1(ac, l4));
	if (((T0*)(l2))->id==858) {
		T858f50(ac, l2, ((T26*)(C))->a2);
	} else {
		T66f50(ac, l2, ((T26*)(C))->a2);
	}
	if (((T0*)(l2))->id==858) {
		T858f51(ac, l2, ((T26*)(C))->a26);
	} else {
		T66f48(ac, l2, ((T26*)(C))->a26);
	}
	t2 = (T26f47(ac, C));
	t1 = ((T1)(!(t2)));
	if (t1) {
		t2 = (T26f38(ac, C));
		t1 = ((T1)(!(t2)));
	}
	if (((T0*)(l2))->id==858) {
		T858f52(ac, l2, t1);
	} else {
		T66f65(ac, l2, t1);
	}
	t2 = (T26f48(ac, C));
	if (t2) {
		t2 = (T26f47(ac, C));
		t1 = ((T1)(!(t2)));
	} else {
		t1 = EIF_FALSE;
	}
	if (t1) {
		t2 = (T26f38(ac, C));
		t1 = ((T1)(!(t2)));
	}
	if (((T0*)(l2))->id==858) {
		T858f53(ac, l2, t1);
	} else {
		T66f66(ac, l2, t1);
	}
	t1 = (T26f49(ac, C));
	if (t1) {
		t2 = (T26f38(ac, C));
		t1 = ((T1)(!(t2)));
	}
	if (((T0*)(l2))->id==858) {
		T858f54(ac, l2, t1);
	} else {
		T66f67(ac, l2, t1);
	}
	l5 = (((((T0*)(l2))->id==858)?T858f45(ac, l2):T66f39(ac, l2)));
	t1 = (T26f50(ac, C));
	if (t1) {
		if (((T0*)(l2))->id==858) {
			T858f55(ac, l2, EIF_TRUE);
		} else {
			T66f68(ac, l2, EIF_TRUE);
		}
		if (((T0*)(l2))->id==858) {
			T858f56(ac, l2, EIF_TRUE);
		} else {
			T66f69(ac, l2, EIF_TRUE);
		}
	}
	l1 = T95c85(ac, a1, l2);
	t2 = (T26f50(ac, C));
	if (!(t2)) {
		t2 = (T6f4(ac, (&l4), (T6)(GE_int32(1))));
	}
	if (!(t2)) {
		t1 = (((((T0*)(l2))->id==858)?((T858*)(l2))->a1:((T66*)(l2))->a25));
	} else {
		t1 = EIF_TRUE;
	}
	if (!(t1)) {
		t1 = (((((T0*)(l2))->id==858)?((T858*)(l2))->a2:((T66*)(l2))->a26));
	}
	if (t1) {
		T95f86(ac, l1, EIF_TRUE);
	}
	t1 = (T26f51(ac, C));
	T95f87(ac, l1, t1);
	t1 = (T26f52(ac, C));
	T95f88(ac, l1, t1);
	T95f89(ac, l1, ((T26*)(C))->a34);
	l3 = T100c121(ac, l1, l2);
	T95f90(ac, l1, l3);
	T95f91(ac, l1, l2);
	t3 = (((T87*)(a1))->a107);
	t1 = (t3?((m1 = t3, EIF_TRUE)):EIF_FALSE);
	t1 = ((T1)(!(t1)));
	if (t1) {
	} else {
		t3 = (((T87*)(a1))->a69);
		t4 = (T26s37(ac));
		t4 = (T81s2(ac));
		t5 = (T26s37(ac));
		t5 = (T81s2(ac));
		t1 = (T102f22(ac, m1, t3, t4, t5));
		if (t1) {
		} else {
			t1 = (((T95*)(l1))->a1);
			if (t1) {
				((T26*)(C))->a1 = (T6)(GE_int32(1));
			} else {
				T26f90(ac, C, l1, l2);
				t1 = (T1)((((T26*)(C))->a1) == ((T6)(GE_int32(0))));
				if (t1) {
					t2 = (T26f54(ac, C));
					t1 = ((T1)(!(t2)));
				}
				if (t1) {
					T26f91(ac, C, a1, l2);
				}
			}
		}
	}
	if (((T0*)(l2))->id==858) {
		T858f58(ac, l2, l5, GE_ms8("Total Time", 10));
	} else {
		T66f71(ac, l2, l5, GE_ms8("Total Time", 10));
	}
}

/* ET_SYSTEM_PROCESSOR.record_end_time */
void T66f71(TC* ac, T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 t2;
	t2 = (T66f41(ac, C));
	t1 = ((T1)(!(t2)));
	if (t1) {
		t1 = (T1)(a1!=EIF_VOID);
	}
	if (t1) {
		T66f80(ac, C, a1, a2);
	}
}

/* ET_SYSTEM_PROCESSOR.print_time */
void T66f80(TC* ac, T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T0* t2;
	T0* t3;
	t1 = (T66f41(ac, C));
	t1 = ((T1)(!(t1)));
	if (t1) {
		l1 = T1034c2(ac);
		t2 = (T1034s1(ac));
		l2 = (T1035f10(ac, t2));
		l3 = (T97f12(ac, l2, a1));
		T1036f17(ac, l3, a1);
		t2 = (((((T0*)(((T66*)(C))->a9))->id==42)?((T42*)(((T66*)(C))->a9))->a2:((T63*)(((T66*)(C))->a9))->a2));
		if (((T0*)(t2))->id==230) {
			T230f5(ac, t2, a2);
		} else {
			T161f6(ac, t2, a2);
		}
		t2 = (((((T0*)(((T66*)(C))->a9))->id==42)?((T42*)(((T66*)(C))->a9))->a2:((T63*)(((T66*)(C))->a9))->a2));
		if (((T0*)(t2))->id==230) {
			T230f5(ac, t2, GE_ms8(": ", 2));
		} else {
			T161f6(ac, t2, GE_ms8(": ", 2));
		}
		t2 = (((((T0*)(((T66*)(C))->a9))->id==42)?((T42*)(((T66*)(C))->a9))->a2:((T63*)(((T66*)(C))->a9))->a2));
		t3 = (T1036f9(ac, l3));
		if (((T0*)(t2))->id==230) {
			T230f4(ac, t2, t3);
		} else {
			T161f9(ac, t2, t3);
		}
	}
}

/* KL_STDOUT_FILE.put_line */
void T161f9(TC* ac, T0* C, T0* a1)
{
	T161f6(ac, C, a1);
	T161f8(ac, C);
}

/* KL_STDOUT_FILE.put_new_line */
void T161f8(TC* ac, T0* C)
{
	T161f6(ac, C, ge412ov6307841);
}

/* KL_NULL_TEXT_OUTPUT_STREAM.put_line */
void T230f4(TC* ac, T0* C, T0* a1)
{
	T230f5(ac, C, a1);
	T230f7(ac, C);
}

/* KL_NULL_TEXT_OUTPUT_STREAM.put_new_line */
void T230f7(TC* ac, T0* C)
{
	T230f5(ac, C, ge401ov6307841);
}

/* DT_DATE_TIME_DURATION.out */
T0* T1036f9(TC* ac, T0* C)
{
	T0* R = 0;
	R = T17c49(ac, (T6)(GE_int32(23)));
	T1036f18(ac, C, R);
	return R;
}

/* DT_DATE_TIME_DURATION.append_to_string */
void T1036f18(TC* ac, T0* C, T0* a1)
{
	T1036f22(ac, C, a1);
	T17f52(ac, a1, (T2)(' '));
	T1036f23(ac, C, a1);
}

/* DT_DATE_TIME_DURATION.append_time_to_string */
void T1036f23(TC* ac, T0* C, T0* a1)
{
	T6 l1 = 0;
	T0* t1;
	T1 t2;
	t1 = (T1036s14(ac));
	T1360s6(ac, ((T1036*)(C))->a4, a1);
	T17f52(ac, a1, (T2)(':'));
	t1 = (T1036s14(ac));
	T1360s6(ac, ((T1036*)(C))->a5, a1);
	T17f52(ac, a1, (T2)(':'));
	t1 = (T1036s14(ac));
	T1360s6(ac, ((T1036*)(C))->a6, a1);
	l1 = ((T1036*)(C))->a7;
	t2 = (T1)(!(T1)((l1) == ((T6)(GE_int32(0)))));
	if (t2) {
		T17f52(ac, a1, (T2)('.'));
		t2 = ((T1)((l1)<((T6)(GE_int32(0)))));
		if (t2) {
			T17f52(ac, a1, (T2)('-'));
			l1 = ((T6)(-(l1)));
		}
		t2 = ((T1)((l1)<((T6)(GE_int32(10)))));
		if (t2) {
			T17f52(ac, a1, (T2)('0'));
			T17f52(ac, a1, (T2)('0'));
		} else {
			t2 = ((T1)((l1)<((T6)(GE_int32(100)))));
			if (t2) {
				T17f52(ac, a1, (T2)('0'));
			}
		}
		t1 = (T1036s14(ac));
		T1360s6(ac, l1, a1);
	}
}

/* KL_INTEGER_ROUTINES.append_decimal_integer */
void T1360s6(TC* ac, T6 a1, T0* a2)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T6 t2;
	t1 = (T1)((a1) == ((T6)(GE_int32(0))));
	if (t1) {
		T17f61(ac, a2, (T10)(GE_nat32(48)));
	} else {
		t1 = ((T1)((a1)<((T6)(GE_int32(0)))));
		if (t1) {
			T17f61(ac, a2, (T10)(GE_nat32(45)));
			t2 = ((T6)((a1)+((T6)(GE_int32(1)))));
			l2 = ((T6)(-(t2)));
			l1 = ((T6)((l2)/((T6)(GE_int32(10)))));
			t2 = ((T6)((l2)%((T6)(GE_int32(10)))));
			switch (t2) {
			case GE_int32(0):
				t1 = (T1)(!(T1)((l1) == ((T6)(GE_int32(0)))));
				if (t1) {
					T1360s6(ac, l1, a2);
				}
				T17f61(ac, a2, (T10)(GE_nat32(49)));
				break;
			case GE_int32(1):
				t1 = (T1)(!(T1)((l1) == ((T6)(GE_int32(0)))));
				if (t1) {
					T1360s6(ac, l1, a2);
				}
				T17f61(ac, a2, (T10)(GE_nat32(50)));
				break;
			case GE_int32(2):
				t1 = (T1)(!(T1)((l1) == ((T6)(GE_int32(0)))));
				if (t1) {
					T1360s6(ac, l1, a2);
				}
				T17f61(ac, a2, (T10)(GE_nat32(51)));
				break;
			case GE_int32(3):
				t1 = (T1)(!(T1)((l1) == ((T6)(GE_int32(0)))));
				if (t1) {
					T1360s6(ac, l1, a2);
				}
				T17f61(ac, a2, (T10)(GE_nat32(52)));
				break;
			case GE_int32(4):
				t1 = (T1)(!(T1)((l1) == ((T6)(GE_int32(0)))));
				if (t1) {
					T1360s6(ac, l1, a2);
				}
				T17f61(ac, a2, (T10)(GE_nat32(53)));
				break;
			case GE_int32(5):
				t1 = (T1)(!(T1)((l1) == ((T6)(GE_int32(0)))));
				if (t1) {
					T1360s6(ac, l1, a2);
				}
				T17f61(ac, a2, (T10)(GE_nat32(54)));
				break;
			case GE_int32(6):
				t1 = (T1)(!(T1)((l1) == ((T6)(GE_int32(0)))));
				if (t1) {
					T1360s6(ac, l1, a2);
				}
				T17f61(ac, a2, (T10)(GE_nat32(55)));
				break;
			case GE_int32(7):
				t1 = (T1)(!(T1)((l1) == ((T6)(GE_int32(0)))));
				if (t1) {
					T1360s6(ac, l1, a2);
				}
				T17f61(ac, a2, (T10)(GE_nat32(56)));
				break;
			case GE_int32(8):
				t1 = (T1)(!(T1)((l1) == ((T6)(GE_int32(0)))));
				if (t1) {
					T1360s6(ac, l1, a2);
				}
				T17f61(ac, a2, (T10)(GE_nat32(57)));
				break;
			case GE_int32(9):
				t2 = ((T6)((l1)+((T6)(GE_int32(1)))));
				T1360s6(ac, t2, a2);
				T17f61(ac, a2, (T10)(GE_nat32(48)));
				break;
			default:
				GE_raise(GE_EX_WHEN);
				break;
			}
		} else {
			l2 = a1;
			l1 = ((T6)((l2)/((T6)(GE_int32(10)))));
			t1 = (T1)(!(T1)((l1) == ((T6)(GE_int32(0)))));
			if (t1) {
				T1360s6(ac, l1, a2);
			}
			t2 = ((T6)((l2)%((T6)(GE_int32(10)))));
			switch (t2) {
			case GE_int32(0):
				T17f61(ac, a2, (T10)(GE_nat32(48)));
				break;
			case GE_int32(1):
				T17f61(ac, a2, (T10)(GE_nat32(49)));
				break;
			case GE_int32(2):
				T17f61(ac, a2, (T10)(GE_nat32(50)));
				break;
			case GE_int32(3):
				T17f61(ac, a2, (T10)(GE_nat32(51)));
				break;
			case GE_int32(4):
				T17f61(ac, a2, (T10)(GE_nat32(52)));
				break;
			case GE_int32(5):
				T17f61(ac, a2, (T10)(GE_nat32(53)));
				break;
			case GE_int32(6):
				T17f61(ac, a2, (T10)(GE_nat32(54)));
				break;
			case GE_int32(7):
				T17f61(ac, a2, (T10)(GE_nat32(55)));
				break;
			case GE_int32(8):
				T17f61(ac, a2, (T10)(GE_nat32(56)));
				break;
			case GE_int32(9):
				T17f61(ac, a2, (T10)(GE_nat32(57)));
				break;
			default:
				GE_raise(GE_EX_WHEN);
				break;
			}
		}
	}
}

/* STRING_8.append_code */
void T17f61(TC* ac, T0* C, T10 a1)
{
	T6 volatile l1 = 0;
	T6 t1;
	T1 t2;
	l1 = ((T6)((((T17*)(C))->a2)+((T6)(GE_int32(1)))));
	t1 = (T17f7(ac, C));
	t2 = (T6f4(ac, (&l1), t1));
	if (t2) {
		T17f54(ac, C, l1);
	}
	T17f67(ac, C, l1);
	T17f70(ac, C, a1, l1);
}

/* STRING_8.put_code */
void T17f70(TC* ac, T0* C, T10 a1, T6 a2)
{
	T2 t1;
	T6 t2;
	t1 = ((T2)(a1));
	t2 = ((T6)((a2)-((T6)(GE_int32(1)))));
	((T15*)(((T17*)(C))->a1))->z2[t2] = (t1);
	T17f55(ac, C);
}

/* STRING_8.reset_hash_codes */
void T17f55(TC* ac, T0* C)
{
	((T17*)(C))->a3 = (T6)(GE_int32(0));
	((T17*)(C))->a4 = (T6)(GE_int32(0));
}

/* STRING_8.set_count */
void T17f67(TC* ac, T0* C, T6 a1)
{
	((T17*)(C))->a2 = a1;
	T17f55(ac, C);
}

/* STRING_8.resize */
void T17f54(TC* ac, T0* C, T6 a1)
{
	T6 t1;
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	((T17*)(C))->a1 = (T15f4(ac, ((T17*)(C))->a1, (T2)('\000'), t1));
}

/* SPECIAL [CHARACTER_8].aliased_resized_area_with_default */
T0* T15f4(TC* ac, T0* C, T2 a1, T6 a2)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	R = (T15f5(ac, C, a2));
	t1 = (((T15*)(R))->a2);
	t2 = ((T6)((a2)-((T6)(GE_int32(1)))));
	T15f15(ac, R, a1, t1, t2);
	return R;
}

/* SPECIAL [CHARACTER_8].fill_with */
void T15f15(TC* ac, T0* C, T2 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 t1;
	T1 t2;
	l1 = a2;
	t1 = ((T6)((a3)+((T6)(GE_int32(1)))));
	l3 = (T6f17(ac, &(((T15*)(C))->a2), t1));
	l2 = l3;
	while (1) {
		t2 = (T1)((l1) == (l2));
		if (t2) {
			break;
		}
		((T15*)(C))->z2[l1] = (a1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	l1 = l3;
	l2 = ((T6)((a3)+((T6)(GE_int32(1)))));
	while (1) {
		t2 = (T1)((l1) == (l2));
		if (t2) {
			break;
		}
		T15f19(ac, C, a1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
}

/* SPECIAL [CHARACTER_8].extend */
void T15f19(TC* ac, T0* C, T2 a1)
{
	T6 t1;
	{
	t1 = ((T15*)(C))->a2;
	((T15*)(C))->a2 = t1 + 1 ;
	((T15*)(C))->z2[t1] = a1;
	}
}

/* INTEGER_32.min */
T6 T6f17(TC* ac, T6 volatile* C, T6 a1)
{
	T6 R = 0;
	T1 t1;
	t1 = (T6f15(ac, C, a1));
	if (t1) {
		R = *C;
	} else {
		R = a1;
	}
	return R;
}

/* INTEGER_32.is_less_equal */
T1 T6f15(TC* ac, T6 volatile* C, T6 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((T1)((a1)<(*C)));
	R = ((T1)(!(t1)));
	return R;
}

/* SPECIAL [CHARACTER_8].aliased_resized_area */
T0* T15f5(TC* ac, T0* C, T6 a1)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	{
	t1 = ((T15*)(C))->a1;
	if (a1 == t1) {
		R = C;
	} else {
		R = GE_new15(ac, a1, EIF_TRUE);
		t1 = ((T15*)(C))->a2;
		((T15*)(R))->a2 = ((t1 < a1)?t1:a1);
		t2 = ((T15*)(C))->a2;
		t1 = ((T15*)(R))->a2;
		if (t2 > t1) {
			t2 = t1;
		}
		if (t2 > 0) {
			memcpy((void*)(((T15*)(R))->z2), (void*)(((T15*)(C))->z2), t2 * sizeof(T2));
		}
	}
	}
	return R;
}

/* STRING_8.capacity */
T6 T17f7(TC* ac, T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = (((T15*)(((T17*)(C))->a1))->a2);
	R = ((T6)((t1)-((T6)(GE_int32(1)))));
	return R;
}

/* DT_DATE_TIME_DURATION.integer_ */
T0* T1036s14(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[0]) {
		if (ac->thread_onces->reference_exception[0]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[0]);
		}
		return ac->thread_onces->reference_value[0];
	} else {
		ac->thread_onces->reference_status[0] = '\1';
		ac->thread_onces->reference_value[0] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[0] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T1360c5(ac);
	ac->thread_onces->reference_value[0] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* KL_INTEGER_ROUTINES.default_create */
T0* T1360c5(TC* ac)
{
	T0* C;
	C = GE_new1360(ac, EIF_TRUE);
	return C;
}

/* STRING_8.append_character */
void T17f52(TC* ac, T0* C, T2 a1)
{
	T6 l1 = 0;
	T6 t1;
	T1 t2;
	l1 = ((T17*)(C))->a2;
	t1 = (T17f7(ac, C));
	t2 = (T1)((l1) == (t1));
	if (t2) {
		t1 = (T17f8(ac, C));
		t1 = ((T6)((l1)+(t1)));
		T17f54(ac, C, t1);
	}
	((T15*)(((T17*)(C))->a1))->z2[l1] = (a1);
	((T17*)(C))->a2 = ((T6)((l1)+((T6)(GE_int32(1)))));
	T17f55(ac, C);
}

/* STRING_8.additional_space */
T6 T17f8(TC* ac, T0* C)
{
	T6 R = 0;
	T6 volatile t1;
	t1 = (T17f7(ac, C));
	t1 = ((T6)((t1)/((T6)(GE_int32(2)))));
	R = (T6f16(ac, &t1, (T6)(GE_int32(5))));
	return R;
}

/* INTEGER_32.max */
T6 T6f16(TC* ac, T6 volatile* C, T6 a1)
{
	T6 R = 0;
	T1 t1;
	t1 = (T6f14(ac, C, a1));
	if (t1) {
		R = *C;
	} else {
		R = a1;
	}
	return R;
}

/* INTEGER_32.is_greater_equal */
T1 T6f14(TC* ac, T6 volatile* C, T6 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((T1)((*C)<(a1)));
	R = ((T1)(!(t1)));
	return R;
}

/* DT_DATE_TIME_DURATION.append_date_to_string */
void T1036f22(TC* ac, T0* C, T0* a1)
{
	T0* t1;
	t1 = (T1036s14(ac));
	T1360s6(ac, ((T1036*)(C))->a1, a1);
	T17f52(ac, a1, (T2)('/'));
	t1 = (T1036s14(ac));
	T1360s6(ac, ((T1036*)(C))->a2, a1);
	T17f52(ac, a1, (T2)('/'));
	t1 = (T1036s14(ac));
	T1360s6(ac, ((T1036*)(C))->a3, a1);
}

/* STRING_8.make */
void T17f49(TC* ac, T0* C, T6 a1)
{
	T6 t1;
	((T17*)(C))->a2 = (T6)(GE_int32(0));
	((T17*)(C))->a3 = (T6)(GE_int32(0));
	((T17*)(C))->a4 = (T6)(GE_int32(0));
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	((T17*)(C))->a1 = T15c12(ac, (T2)('\000'), t1);
}

/* STRING_8.make */
T0* T17c49(TC* ac, T6 a1)
{
	T0* C;
	T6 t1;
	C = GE_new17(ac, EIF_TRUE);
	((T17*)(C))->a2 = (T6)(GE_int32(0));
	((T17*)(C))->a3 = (T6)(GE_int32(0));
	((T17*)(C))->a4 = (T6)(GE_int32(0));
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	((T17*)(C))->a1 = T15c12(ac, (T2)('\000'), t1);
	return C;
}

/* SPECIAL [CHARACTER_8].make_filled */
T0* T15c12(TC* ac, T2 a1, T6 a2)
{
	T0* C;
	T6 t1;
	C = GE_new15(ac, a2, EIF_TRUE);
	T15f16(ac, C, a2);
	t1 = ((T6)((a2)-((T6)(GE_int32(1)))));
	T15f15(ac, C, a1, (T6)(GE_int32(0)), t1);
	return C;
}

/* SPECIAL [CHARACTER_8].make_empty */
void T15f16(TC* ac, T0* C, T6 a1)
{
	{
	}
}

/* SPECIAL [CHARACTER_8].make_empty */
T0* T15c16(TC* ac, T6 a1)
{
	T0* C;
	C = GE_new15(ac, a1, EIF_TRUE);
	{
	}
	return C;
}

/* KL_STDOUT_FILE.put_string */
void T161f6(TC* ac, T0* C, T0* a1)
{
	T0* t1;
	T0* t2;
	t1 = (T161s1(ac));
	t2 = (T161s2(ac));
	t2 = (T108s12(ac, a1));
	T1669f22(ac, t1, t2);
}

/* CONSOLE.put_string */
void T1669f22(TC* ac, T0* C, T0* a1)
{
	T6 volatile l1 = 0;
	T0* l2 = 0;
	T1 t1;
	T1447 t2;
	T14 t3;
	l1 = (T104x2228263(ac, a1));
	t1 = (T6f4(ac, (&l1), (T6)(GE_int32(0))));
	if (t1) {
		l2 = (T104x2211878(ac, a1));
		(t2).a1 = ((l2?(T14)(GE_types[((T0*)(l2))->id][0].is_special?(T14)((T15*)(l2))->z2:(T14)l2):(T14)0));
		t3 = ((t2).a1);
		T1669s29(ac, ((T1669*)(C))->a2, t3, l1);
	}
}

/* CONSOLE.console_ps */
void T1669s29(TC* ac, T14 a1, T14 a2, T6 a3)
{
	{
	console_ps((FILE *)(void*)a1,( char *)(void*)a2,( EIF_INTEGER)a3);
	}
}

/* UC_UTF8_STRING.area */
T0* T1078f2(TC* ac, T0* C)
{
	T0* R = 0;
	R = ((T1078*)(C))->a2;
	return R;
}

/* UC_STRING.area */
T0* T919f2(TC* ac, T0* C)
{
	T0* R = 0;
	R = ((T919*)(C))->a2;
	return R;
}

/* STRING_8.area */
T0* T17f1(TC* ac, T0* C)
{
	T0* R = 0;
	R = ((T17*)(C))->a1;
	return R;
}

/* UC_UTF8_STRING.count */
T6 T1078f1(TC* ac, T0* C)
{
	T6 R = 0;
	R = ((T1078*)(C))->a1;
	return R;
}

/* UC_STRING.count */
T6 T919f1(TC* ac, T0* C)
{
	T6 R = 0;
	R = ((T919*)(C))->a1;
	return R;
}

/* STRING_8.count */
T6 T17f2(TC* ac, T0* C)
{
	T6 R = 0;
	R = ((T17*)(C))->a2;
	return R;
}

/* KL_STRING_ROUTINES.as_readable_string_8_no_uc_string */
T0* T108s12(TC* ac, T0* a1)
{
	T0* R = 0;
	T0* m1 = 0;
	T1 t1;
	t1 = (a1?((m1 = a1, T108s12ot1(ac, a1))):EIF_FALSE);
	if (t1) {
		R = (((((T0*)(m1))->id==919)?T919f56(ac, m1):T1078f20(ac, m1)));
	} else {
		R = a1;
	}
	return R;
}

T1 T108s12ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* UC_UTF8_STRING.as_string */
T0* T1078f20(TC* ac, T0* C)
{
	T0* R = 0;
	R = (T1078f51(ac, C));
	return R;
}

/* UC_UTF8_STRING.to_utf8 */
T0* T1078f51(TC* ac, T0* C)
{
	T0* R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T2 t2;
	l2 = ((T1078*)(C))->a3;
	R = T17c49(ac, l2);
	l1 = (T6)(GE_int32(1));
	while (1) {
		t1 = (T6f4(ac, (&l1), l2));
		if (t1) {
			break;
		}
		t2 = (T1078f16(ac, C, l1));
		T17f52(ac, R, t2);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	return R;
}

/* UC_UTF8_STRING.byte_item */
T2 T1078f16(TC* ac, T0* C, T6 a1)
{
	T2 R = 0;
	T6 l1 = 0;
	l1 = ((T1078*)(C))->a1;
	T1078f74(ac, C, ((T1078*)(C))->a3);
	R = (T1078f50(ac, C, a1));
	T1078f74(ac, C, l1);
	return R;
}

/* UC_UTF8_STRING.old_item */
T2 T1078f50(TC* ac, T0* C, T6 a1)
{
	T2 R = 0;
	T6 t1;
	t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
	R = (((T15*)(((T1078*)(C))->a2))->z2[t1]);
	return R;
}

/* UC_UTF8_STRING.set_count */
void T1078f74(TC* ac, T0* C, T6 a1)
{
	T1 t1;
	t1 = (T6f4(ac, &(((T1078*)(C))->a5), a1));
	if (t1) {
		T1078f94(ac, C);
	}
	((T1078*)(C))->a1 = a1;
}

/* UC_UTF8_STRING.reset_byte_index_cache */
void T1078f94(TC* ac, T0* C)
{
	((T1078*)(C))->a5 = (T6)(GE_int32(1));
	((T1078*)(C))->a6 = (T6)(GE_int32(1));
}

/* UC_STRING.as_string */
T0* T919f56(TC* ac, T0* C)
{
	T0* R = 0;
	R = (T919f31(ac, C));
	return R;
}

/* UC_STRING.to_utf8 */
T0* T919f31(TC* ac, T0* C)
{
	T0* R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T2 t2;
	l2 = ((T919*)(C))->a3;
	R = T17c49(ac, l2);
	l1 = (T6)(GE_int32(1));
	while (1) {
		t1 = (T6f4(ac, (&l1), l2));
		if (t1) {
			break;
		}
		t2 = (T919f36(ac, C, l1));
		T17f52(ac, R, t2);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	return R;
}

/* UC_STRING.byte_item */
T2 T919f36(TC* ac, T0* C, T6 a1)
{
	T2 R = 0;
	T6 l1 = 0;
	l1 = ((T919*)(C))->a1;
	T919f90(ac, C, ((T919*)(C))->a3);
	R = (T919f54(ac, C, a1));
	T919f90(ac, C, l1);
	return R;
}

/* UC_STRING.old_item */
T2 T919f54(TC* ac, T0* C, T6 a1)
{
	T2 R = 0;
	T6 t1;
	t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
	R = (((T15*)(((T919*)(C))->a2))->z2[t1]);
	return R;
}

/* UC_STRING.set_count */
void T919f90(TC* ac, T0* C, T6 a1)
{
	T1 t1;
	t1 = (T6f4(ac, &(((T919*)(C))->a5), a1));
	if (t1) {
		T919f103(ac, C);
	}
	((T919*)(C))->a1 = a1;
}

/* UC_STRING.reset_byte_index_cache */
void T919f103(TC* ac, T0* C)
{
	((T919*)(C))->a5 = (T6)(GE_int32(1));
	((T919*)(C))->a6 = (T6)(GE_int32(1));
}

/* KL_STDOUT_FILE.string_ */
T0* T161s2(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[1]) {
		if (ac->thread_onces->reference_exception[1]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[1]);
		}
		return ac->thread_onces->reference_value[1];
	} else {
		ac->thread_onces->reference_status[1] = '\1';
		ac->thread_onces->reference_value[1] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[1] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T108c22(ac);
	ac->thread_onces->reference_value[1] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* KL_STRING_ROUTINES.default_create */
T0* T108c22(TC* ac)
{
	T0* C;
	C = GE_new108(ac, EIF_TRUE);
	return C;
}

/* KL_STDOUT_FILE.console */
T0* T161s1(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	T0* t1;
	if (ac->thread_onces->reference_status[2]) {
		if (ac->thread_onces->reference_exception[2]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[2]);
		}
		return ac->thread_onces->reference_value[2];
	} else {
		ac->thread_onces->reference_status[2] = '\1';
		ac->thread_onces->reference_value[2] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[2] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	t1 = (T161s4(ac));
	R = (T1031s3(ac));
	ac->thread_onces->reference_value[2] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* STD_FILES.output */
T0* T1031s3(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[3]) {
		if (ac->thread_onces->reference_exception[3]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[3]);
		}
		return ac->thread_onces->reference_value[3];
	} else {
		ac->thread_onces->reference_status[3] = '\1';
		ac->thread_onces->reference_value[3] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[3] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T1669c23(ac, GE_ms8("stdout", 6));
	ac->thread_onces->reference_value[3] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* CONSOLE.make_open_stdout */
T0* T1669c23(TC* ac, T0* a1)
{
	T0* C;
	C = GE_new1669(ac, EIF_TRUE);
	T1669f27(ac, C, a1);
	((T1669*)(C))->a2 = (T1669s14(ac, (T6)(GE_int32(1))));
	T1669f28(ac, C);
	return C;
}

/* CONSOLE.set_write_mode */
void T1669f28(TC* ac, T0* C)
{
	((T1669*)(C))->a4 = (T6)(GE_int32(2));
}

/* CONSOLE.console_def */
T14 T1669s14(TC* ac, T6 a1)
{
	T14 R = 0;
	{
	R = (T14)(console_def(a1));
	}
	return R;
}

/* CONSOLE.make_with_name */
void T1669f27(TC* ac, T0* C, T0* a1)
{
	T1669f27p1(ac, C, a1);
	((T1669*)(C))->a3 = T18c22(ac);
}

/* STRING_32.make_empty */
T0* T18c22(TC* ac)
{
	T0* C;
	C = GE_new18(ac, EIF_TRUE);
	T18f23(ac, C, (T6)(GE_int32(0)));
	return C;
}

/* STRING_32.make */
void T18f23(TC* ac, T0* C, T6 a1)
{
	T6 t1;
	((T18*)(C))->a2 = (T6)(GE_int32(0));
	((T18*)(C))->a3 = (T6)(GE_int32(0));
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	((T18*)(C))->a1 = T16c8(ac, (T3)(GE_nat32(0)), t1);
}

/* STRING_32.make */
T0* T18c23(TC* ac, T6 a1)
{
	T0* C;
	T6 t1;
	C = GE_new18(ac, EIF_TRUE);
	((T18*)(C))->a2 = (T6)(GE_int32(0));
	((T18*)(C))->a3 = (T6)(GE_int32(0));
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	((T18*)(C))->a1 = T16c8(ac, (T3)(GE_nat32(0)), t1);
	return C;
}

/* SPECIAL [CHARACTER_32].make_filled */
T0* T16c8(TC* ac, T3 a1, T6 a2)
{
	T0* C;
	T6 t1;
	C = GE_new16(ac, a2, EIF_TRUE);
	T16f11(ac, C, a2);
	t1 = ((T6)((a2)-((T6)(GE_int32(1)))));
	T16f13(ac, C, a1, (T6)(GE_int32(0)), t1);
	return C;
}

/* SPECIAL [CHARACTER_32].fill_with */
void T16f13(TC* ac, T0* C, T3 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 t1;
	T1 t2;
	l1 = a2;
	t1 = ((T6)((a3)+((T6)(GE_int32(1)))));
	l3 = (T6f17(ac, &(((T16*)(C))->a2), t1));
	l2 = l3;
	while (1) {
		t2 = (T1)((l1) == (l2));
		if (t2) {
			break;
		}
		((T16*)(C))->z2[l1] = (a1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	l1 = l3;
	l2 = ((T6)((a3)+((T6)(GE_int32(1)))));
	while (1) {
		t2 = (T1)((l1) == (l2));
		if (t2) {
			break;
		}
		T16f12(ac, C, a1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
}

/* SPECIAL [CHARACTER_32].extend */
void T16f12(TC* ac, T0* C, T3 a1)
{
	T6 t1;
	{
	t1 = ((T16*)(C))->a2;
	((T16*)(C))->a2 = t1 + 1 ;
	((T16*)(C))->z2[t1] = a1;
	}
}

/* SPECIAL [CHARACTER_32].make_empty */
void T16f11(TC* ac, T0* C, T6 a1)
{
	{
	}
}

/* SPECIAL [CHARACTER_32].make_empty */
T0* T16c11(TC* ac, T6 a1)
{
	T0* C;
	C = GE_new16(ac, a1, EIF_TRUE);
	{
	}
	return C;
}

/* CONSOLE.make_with_name */
void T1669f27p1(TC* ac, T0* C, T0* a1)
{
	T1669f33(ac, C, a1);
	((T1669*)(C))->a4 = (T6)(GE_int32(0));
	((T1669*)(C))->a2 = (T1669s9(ac));
	((T1669*)(C))->a1 = T17c58(ac);
}

/* STRING_8.make_empty */
T0* T17c58(TC* ac)
{
	T0* C;
	C = GE_new17(ac, EIF_TRUE);
	T17f49(ac, C, (T6)(GE_int32(0)));
	return C;
}

/* CONSOLE.default_pointer */
T14 T1669s9(TC* ac)
{
	T14 R = 0;
	return R;
}

/* CONSOLE.set_name */
void T1669f33(TC* ac, T0* C, T0* a1)
{
	T0* t1;
	((T1669*)(C))->a5 = a1;
	t1 = (T1669f16(ac, C));
	((T1669*)(C))->a6 = (T166f7(ac, t1, a1, ((T1669*)(C))->a6));
}

/* FILE_INFO.file_name_to_pointer */
T0* T166f7(TC* ac, T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T40 l1 = GE_default40;
	T0* l2 = 0;
	T1 t1;
	T6 t2;
	T14 t3;
	T14 t4;
	T6 t5;
	T0* t6;
	R = a2;
	t1 = (EIF_IS_WINDOWS);
	if (t1) {
		t1 = EIF_FALSE;
		if (t1) {
			t1 = (R?(EIF_TRUE):EIF_FALSE);
			if (t1) {
				t2 = (T41x2228263(ac, a1));
				t2 = ((T6)((t2)+((T6)(GE_int32(1)))));
				t2 = ((T6)((t2)*((T6)(GE_int32(2)))));
				T162f11(ac, R, t2);
			} else {
				t2 = (T41x2228263(ac, a1));
				t2 = ((T6)((t2)+((T6)(GE_int32(1)))));
				t2 = ((T6)((t2)*((T6)(GE_int32(2)))));
				R = T162c10(ac, t2);
			}
			t2 = (T41x2228263(ac, a1));
			T40s17(ac, a1, (T6)(GE_int32(1)), t2, R, (T6)(GE_int32(0)), EIF_VOID);
		} else {
			l2 = T31c9(ac, a1);
			t1 = (R?(EIF_TRUE):EIF_FALSE);
			if (t1) {
				t3 = (T31f4(ac, l2));
				t4 = (T166s13(ac));
				t2 = (T166s14(ac, t3, t4, (T6)(GE_int32(0))));
				T162f11(ac, R, t2);
			} else {
				t3 = (T31f4(ac, l2));
				t4 = (T166s13(ac));
				t2 = (T166s14(ac, t3, t4, (T6)(GE_int32(0))));
				R = T162c10(ac, t2);
			}
			t3 = (T31f4(ac, l2));
			t4 = (((T162*)(R))->a1);
			t2 = (((T162*)(R))->a3);
			t5 = (T166s6(ac));
			t2 = ((T6)((t2)/(t5)));
			t2 = (T166s14(ac, t3, t4, t2));
			T6s37(ac);
		}
	} else {
		t1 = (R?(EIF_TRUE):EIF_FALSE);
		if (t1) {
			t2 = (T41x2228263(ac, a1));
			t2 = ((T6)((t2)+((T6)(GE_int32(1)))));
			T162f11(ac, R, t2);
		} else {
			t2 = (T41x2228263(ac, a1));
			t2 = ((T6)((t2)+((T6)(GE_int32(1)))));
			R = T162c10(ac, t2);
		}
		t1 = EIF_FALSE;
		if (t1) {
			t2 = (T41x2228263(ac, a1));
			T40s18(ac, a1, (T6)(GE_int32(1)), t2, R, (T6)(GE_int32(0)), EIF_VOID);
		} else {
			t3 = (((T162*)(R))->a1);
			t2 = (T41x2228263(ac, a1));
			t6 = (T31c10(ac, t3, t2));
			T31f11(ac, t6, a1);
		}
	}
	return R;
}

/* C_STRING.set_string */
void T31f11(TC* ac, T0* C, T0* a1)
{
	T6 t1;
	t1 = (T41x2228263(ac, a1));
	T31f15(ac, C, a1, (T6)(GE_int32(1)), t1);
}

/* C_STRING.set_substring */
void T31f15(TC* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 t1;
	T1 t2;
	T10 volatile t3;
	T8 t4;
	t1 = ((T6)((a3)-(a2)));
	l2 = ((T6)((t1)+((T6)(GE_int32(1)))));
	((T31*)(C))->a2 = l2;
	l3 = ((T6)((l2)+((T6)(GE_int32(1)))));
	t1 = (((T162*)(((T31*)(C))->a1))->a3);
	t2 = ((T1)((t1)<(l3)));
	if (t2) {
		T162f11(ac, ((T31*)(C))->a1, l3);
	}
	l1 = (T6)(GE_int32(0));
	while (1) {
		t2 = (T1)((l1) == (l2));
		if (t2) {
			break;
		}
		t1 = ((T6)((l1)+(a2)));
		t3 = (T41x2228225T6(ac, a1, t1));
		t4 = (T10f23(ac, &t3));
		T162f16(ac, ((T31*)(C))->a1, t4, l1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	T162f16(ac, ((T31*)(C))->a1, (T8)(GE_nat8(0)), l2);
}

/* MANAGED_POINTER.put_natural_8 */
void T162f16(TC* ac, T0* C, T8 a1, T6 a2)
{
	T14 volatile t1;
	T1566 t2;
	T14 t3;
	t1 = ((T14)(((char*)(((T162*)(C))->a1))+(a2)));
	(t2).a1 = ((T14)&a1);
	t3 = ((t2).a1);
	T14f19(ac, &t1, t3, (T6)(GE_int32(1)));
}

/* POINTER.memory_copy */
void T14f19(TC* ac, T14 volatile* C, T14 a1, T6 a2)
{
	T14s20(ac, *C, a1, a2);
}

/* POINTER.c_memcpy */
void T14s20(TC* ac, T14 a1, T14 a2, T6 a3)
{
	{
	memcpy((void *)(void*)a1,( const void *)(void*)a2,( size_t)a3);
	}
}

/* NATURAL_32.to_natural_8 */
T8 T10f23(TC* ac, T10 volatile* C)
{
	T8 R = 0;
	R = ((T8)(*C));
	return R;
}

/* UC_UTF8_STRING.code */
T10 T1078f48(TC* ac, T0* C, T6 a1)
{
	T10 R = 0;
	T6 l1 = 0;
	T1 t1;
	T2 volatile t2;
	t1 = (T1)((((T1078*)(C))->a1) == (((T1078*)(C))->a3));
	if (t1) {
		t2 = (T1078f16(ac, C, a1));
		R = (T2f7(ac, &t2));
	} else {
		l1 = (T1078f14(ac, C, a1));
		R = (T1078f43(ac, C, l1));
	}
	return R;
}

/* UC_UTF8_STRING.code_at_byte_index */
T10 T1078f43(TC* ac, T0* C, T6 a1)
{
	T10 R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T2 l3 = 0;
	T0* t1;
	T6 t2;
	T1 t3;
	T10 t4;
	T10 t5;
	l1 = a1;
	l3 = (T1078f16(ac, C, l1));
	t1 = (T1078s45(ac));
	R = (T168s23(ac, l3));
	t1 = (T1078s45(ac));
	t2 = (T168s2(ac, l3));
	t2 = ((T6)((l1)+(t2)));
	l2 = ((T6)((t2)-((T6)(GE_int32(1)))));
	l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	while (1) {
		t3 = (T6f4(ac, (&l1), l2));
		if (t3) {
			break;
		}
		l3 = (T1078f16(ac, C, l1));
		t4 = ((T10)((R)*((T10)(GE_nat32(64)))));
		t1 = (T1078s45(ac));
		t5 = (T168s24(ac, l3));
		R = ((T10)((t4)+(t5)));
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	return R;
}

/* UC_UTF8_ROUTINES.natural_32_encoded_next_value */
T10 T168s24(TC* ac, T2 a1)
{
	T10 R = 0;
	T10 t1;
	t1 = (T2f7(ac, &a1));
	R = ((T10)((t1)%((T10)(GE_nat32(64)))));
	return R;
}

/* UC_UTF8_ROUTINES.encoded_byte_count */
T6 T168s2(TC* ac, T2 a1)
{
	T6 R = 0;
	T1 t1;
	t1 = (T2f10(ac, &a1, (T2)('\177')));
	if (t1) {
		R = (T6)(GE_int32(1));
	} else {
		t1 = (T2f10(ac, &a1, (T2)('\337')));
		if (t1) {
			R = (T6)(GE_int32(2));
		} else {
			t1 = (T2f10(ac, &a1, (T2)('\357')));
			if (t1) {
				R = (T6)(GE_int32(3));
			} else {
				R = (T6)(GE_int32(4));
			}
		}
	}
	return R;
}

/* CHARACTER_8.is_less_equal */
T1 T2f10(TC* ac, T2 volatile* C, T2 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = (T2f15(ac, &a1, *C));
	R = ((T1)(!(t1)));
	return R;
}

/* CHARACTER_8.is_less */
T1 T2f15(TC* ac, T2 volatile* C, T2 a1)
{
	T1 R = 0;
	T10 t1;
	T10 t2;
	t1 = (T2f7(ac, C));
	t2 = (T2f7(ac, &a1));
	R = ((T1)((t1)<(t2)));
	return R;
}

/* UC_UTF8_ROUTINES.natural_32_encoded_first_value */
T10 T168s23(TC* ac, T2 a1)
{
	T10 R = 0;
	T1 t1;
	R = (T2f7(ac, &a1));
	t1 = (T2f10(ac, &a1, (T2)('\177')));
	if (t1) {
	} else {
		t1 = (T2f10(ac, &a1, (T2)('\337')));
		if (t1) {
			R = ((T10)((R)%((T10)(GE_nat32(32)))));
		} else {
			t1 = (T2f10(ac, &a1, (T2)('\357')));
			if (t1) {
				R = ((T10)((R)%((T10)(GE_nat32(16)))));
			} else {
				t1 = (T2f10(ac, &a1, (T2)('\364')));
				if (t1) {
					R = ((T10)((R)%((T10)(GE_nat32(8)))));
				}
			}
		}
	}
	return R;
}

/* UC_UTF8_STRING.utf8 */
T0* T1078s45(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[4]) {
		if (ac->thread_onces->reference_exception[4]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[4]);
		}
		return ac->thread_onces->reference_value[4];
	} else {
		ac->thread_onces->reference_status[4] = '\1';
		ac->thread_onces->reference_value[4] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[4] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T168c58(ac);
	ac->thread_onces->reference_value[4] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* UC_UTF8_ROUTINES.default_create */
T0* T168c58(TC* ac)
{
	T0* C;
	C = GE_new168(ac, EIF_TRUE);
	return C;
}

/* UC_UTF8_STRING.byte_index */
T6 T1078f14(TC* ac, T0* C, T6 a1)
{
	T6 R = 0;
	T6 l1 = 0;
	T2 l2 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	t1 = (T1)((((T1078*)(C))->a3) == (((T1078*)(C))->a1));
	if (t1) {
		R = a1;
	} else {
		t1 = ((T1)((a1)<(((T1078*)(C))->a5)));
		if (t1) {
			l1 = (T6)(GE_int32(1));
			R = (T6)(GE_int32(1));
		} else {
			l1 = ((T1078*)(C))->a5;
			R = ((T1078*)(C))->a6;
		}
		while (1) {
			t1 = (T1)((l1) == (a1));
			if (t1) {
				break;
			}
			l2 = (T1078f16(ac, C, R));
			t2 = (T1078s45(ac));
			t3 = (T168s2(ac, l2));
			R = ((T6)((R)+(t3)));
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
	((T1078*)(C))->a5 = a1;
	((T1078*)(C))->a6 = R;
	return R;
}

/* CHARACTER_8.natural_32_code */
T10 T2f7(TC* ac, T2 volatile* C)
{
	T10 R = 0;
	T6 volatile t1;
	t1 = ((T6)(*C));
	R = (T6f20(ac, &t1));
	return R;
}

/* INTEGER_32.to_natural_32 */
T10 T6f20(TC* ac, T6 volatile* C)
{
	T10 R = 0;
	R = ((T10)(*C));
	return R;
}

/* UC_STRING.code */
T10 T919f10(TC* ac, T0* C, T6 a1)
{
	T10 R = 0;
	T6 l1 = 0;
	T1 t1;
	T2 volatile t2;
	t1 = (T1)((((T919*)(C))->a1) == (((T919*)(C))->a3));
	if (t1) {
		t2 = (T919f36(ac, C, a1));
		R = (T2f7(ac, &t2));
	} else {
		l1 = (T919f37(ac, C, a1));
		R = (T919f38(ac, C, l1));
	}
	return R;
}

/* UC_STRING.code_at_byte_index */
T10 T919f38(TC* ac, T0* C, T6 a1)
{
	T10 R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T2 l3 = 0;
	T0* t1;
	T6 t2;
	T1 t3;
	T10 t4;
	T10 t5;
	l1 = a1;
	l3 = (T919f36(ac, C, l1));
	t1 = (T919s35(ac));
	R = (T168s23(ac, l3));
	t1 = (T919s35(ac));
	t2 = (T168s2(ac, l3));
	t2 = ((T6)((l1)+(t2)));
	l2 = ((T6)((t2)-((T6)(GE_int32(1)))));
	l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	while (1) {
		t3 = (T6f4(ac, (&l1), l2));
		if (t3) {
			break;
		}
		l3 = (T919f36(ac, C, l1));
		t4 = ((T10)((R)*((T10)(GE_nat32(64)))));
		t1 = (T919s35(ac));
		t5 = (T168s24(ac, l3));
		R = ((T10)((t4)+(t5)));
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	return R;
}

/* UC_STRING.utf8 */
T0* T919s35(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[4]) {
		if (ac->thread_onces->reference_exception[4]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[4]);
		}
		return ac->thread_onces->reference_value[4];
	} else {
		ac->thread_onces->reference_status[4] = '\1';
		ac->thread_onces->reference_value[4] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[4] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T168c58(ac);
	ac->thread_onces->reference_value[4] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* UC_STRING.byte_index */
T6 T919f37(TC* ac, T0* C, T6 a1)
{
	T6 R = 0;
	T6 l1 = 0;
	T2 l2 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	t1 = (T1)((((T919*)(C))->a3) == (((T919*)(C))->a1));
	if (t1) {
		R = a1;
	} else {
		t1 = ((T1)((a1)<(((T919*)(C))->a5)));
		if (t1) {
			l1 = (T6)(GE_int32(1));
			R = (T6)(GE_int32(1));
		} else {
			l1 = ((T919*)(C))->a5;
			R = ((T919*)(C))->a6;
		}
		while (1) {
			t1 = (T1)((l1) == (a1));
			if (t1) {
				break;
			}
			l2 = (T919f36(ac, C, R));
			t2 = (T919s35(ac));
			t3 = (T168s2(ac, l2));
			R = ((T6)((R)+(t3)));
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
	((T919*)(C))->a5 = a1;
	((T919*)(C))->a6 = R;
	return R;
}

/* STRING_8.code */
T10 T17f10(TC* ac, T0* C, T6 a1)
{
	T10 R = 0;
	T6 volatile t1;
	T2 t2;
	t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
	t2 = (((T15*)(((T17*)(C))->a1))->z2[t1]);
	t1 = ((T6)(t2));
	R = (T6f20(ac, &t1));
	return R;
}

/* C_STRING.make_shared_from_pointer_and_count */
void T31f10(TC* ac, T0* C, T14 a1, T6 a2)
{
	T6 t1;
	((T31*)(C))->a2 = a2;
	t1 = ((T6)((a2)+((T6)(GE_int32(1)))));
	((T31*)(C))->a1 = T162c14(ac, a1, t1);
}

/* C_STRING.make_shared_from_pointer_and_count */
T0* T31c10(TC* ac, T14 a1, T6 a2)
{
	T0* C;
	T6 t1;
	C = GE_new31(ac, EIF_TRUE);
	((T31*)(C))->a2 = a2;
	t1 = ((T6)((a2)+((T6)(GE_int32(1)))));
	((T31*)(C))->a1 = T162c14(ac, a1, t1);
	return C;
}

/* MANAGED_POINTER.share_from_pointer */
T0* T162c14(TC* ac, T14 a1, T6 a2)
{
	T0* C;
	C = GE_new162(ac, EIF_TRUE);
	T162f12(ac, C);
	((T162*)(C))->a1 = a1;
	((T162*)(C))->a3 = a2;
	((T162*)(C))->a2 = EIF_TRUE;
	return C;
}

/* MANAGED_POINTER.increment_counter */
void T162f12(TC* ac, T0* C)
{
}

/* UTF_CONVERTER.escaped_utf_32_substring_into_utf_8_0_pointer */
void T40s18(TC* ac, T0* a1, T6 a2, T6 a3, T0* a4, T6 a5, T0* a6)
{
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T10 volatile l5 = 0;
	T0* l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T6 volatile t1;
	T6 t2;
	T1 t3;
	T3 t4;
	T10 volatile t5;
	T8 t6;
	T10 volatile t7;
	T10 volatile t8;
	T10 volatile t9;
	T10 volatile t10;
	T10 volatile t11;
	T10 volatile t12;
	T10 volatile t13;
	T10 volatile t14;
	t1 = ((T6)((a3)-(a2)));
	l2 = ((T6)((t1)+((T6)(GE_int32(1)))));
	l4 = (((T162*)(a4))->a3);
	t1 = ((T6)((l4)-(a5)));
	t2 = ((T6)((l2)+((T6)(GE_int32(1)))));
	t3 = ((T1)((t1)<(t2)));
	if (t3) {
		t1 = (T40s12(ac, a1, a2, a3));
		t1 = ((T6)((a5)+(t1)));
		l4 = ((T6)((t1)+((T6)(GE_int32(1)))));
		T162f11(ac, a4, l4);
		l8 = EIF_TRUE;
	}
	l3 = a5;
	l1 = ((T6)((a2)-((T6)(GE_int32(1)))));
	while (1) {
		t3 = (T6f14(ac, (&l1), a3));
		if (t3) {
			break;
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		l5 = (T41x2228225T6(ac, a1, l1));
		t4 = (T3)(GE_nat32(65533));
		t5 = ((T10)(t4));
		t3 = (T1)((l5) == (t5));
		if (t3) {
			t3 = ((T1)((l1)<(l2)));
			if (t3) {
				t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				t4 = (T41x2228226T6(ac, a1, t1));
				t3 = (T1)((t4) == ((T3)(GE_nat32(65533))));
			}
			if (t3) {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			} else {
				t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				t3 = ((T1)((t1)<(l2)));
				if (t3) {
					t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					t2 = ((T6)((l1)+((T6)(GE_int32(2)))));
					l6 = (T41x2228304T6T6(ac, a1, t1, t2));
					t3 = (T40s5(ac, l6));
					if (t3) {
						l5 = (T40s6(ac, l6));
						t3 = (T10f5(ac, (&l5), (T10)(GE_nat32(127))));
						if (t3) {
							t4 = (T3)(GE_nat32(65533));
							l5 = ((T10)(t4));
						} else {
							l7 = EIF_TRUE;
							l1 = ((T6)((l1)+((T6)(GE_int32(2)))));
						}
					}
				}
			}
		}
		t3 = ((T1)(!(l7)));
		if (t3) {
			t3 = (T10f5(ac, (&l5), (T10)(GE_nat32(127))));
			if (t3) {
				t6 = (T10f23(ac, (&l5)));
				T162f16(ac, a4, t6, l3);
				l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
			} else {
				t3 = ((T1)(!(l8)));
				if (t3) {
					t1 = ((T6)((l3)+((T6)(GE_int32(5)))));
					t2 = ((T6)((a3)-(l1)));
					t1 = ((T6)((t1)+(t2)));
					t3 = (T6f4(ac, &t1, l4));
				}
				if (t3) {
					t2 = (T40s12(ac, a1, l1, a3));
					t2 = ((T6)((l3)+(t2)));
					l4 = ((T6)((t2)+((T6)(GE_int32(1)))));
					T162f11(ac, a4, l4);
					l8 = EIF_TRUE;
				}
				t3 = (T10f5(ac, (&l5), (T10)(GE_nat32(2047))));
				if (t3) {
					t5 = ((T10)((l5)>>((T6)(GE_int32(6)))));
					t5 = ((T10)((t5)|((T10)(GE_nat32(192)))));
					t6 = (T10f23(ac, &t5));
					T162f16(ac, a4, t6, l3);
					t7 = ((T10)((l5)&((T10)(GE_nat32(63)))));
					t7 = ((T10)((t7)|((T10)(GE_nat32(128)))));
					t6 = (T10f23(ac, &t7));
					t2 = ((T6)((l3)+((T6)(GE_int32(1)))));
					T162f16(ac, a4, t6, t2);
					l3 = ((T6)((l3)+((T6)(GE_int32(2)))));
				} else {
					t3 = (T10f5(ac, (&l5), (T10)(GE_nat32(65535))));
					if (t3) {
						t8 = ((T10)((l5)>>((T6)(GE_int32(12)))));
						t8 = ((T10)((t8)|((T10)(GE_nat32(224)))));
						t6 = (T10f23(ac, &t8));
						T162f16(ac, a4, t6, l3);
						t9 = ((T10)((l5)>>((T6)(GE_int32(6)))));
						t9 = ((T10)((t9)&((T10)(GE_nat32(63)))));
						t9 = ((T10)((t9)|((T10)(GE_nat32(128)))));
						t6 = (T10f23(ac, &t9));
						t2 = ((T6)((l3)+((T6)(GE_int32(1)))));
						T162f16(ac, a4, t6, t2);
						t10 = ((T10)((l5)&((T10)(GE_nat32(63)))));
						t10 = ((T10)((t10)|((T10)(GE_nat32(128)))));
						t6 = (T10f23(ac, &t10));
						t2 = ((T6)((l3)+((T6)(GE_int32(2)))));
						T162f16(ac, a4, t6, t2);
						l3 = ((T6)((l3)+((T6)(GE_int32(3)))));
					} else {
						t11 = ((T10)((l5)>>((T6)(GE_int32(18)))));
						t11 = ((T10)((t11)|((T10)(GE_nat32(240)))));
						t6 = (T10f23(ac, &t11));
						T162f16(ac, a4, t6, l3);
						t12 = ((T10)((l5)>>((T6)(GE_int32(12)))));
						t12 = ((T10)((t12)&((T10)(GE_nat32(63)))));
						t12 = ((T10)((t12)|((T10)(GE_nat32(128)))));
						t6 = (T10f23(ac, &t12));
						t2 = ((T6)((l3)+((T6)(GE_int32(1)))));
						T162f16(ac, a4, t6, t2);
						t13 = ((T10)((l5)>>((T6)(GE_int32(6)))));
						t13 = ((T10)((t13)&((T10)(GE_nat32(63)))));
						t13 = ((T10)((t13)|((T10)(GE_nat32(128)))));
						t6 = (T10f23(ac, &t13));
						t2 = ((T6)((l3)+((T6)(GE_int32(2)))));
						T162f16(ac, a4, t6, t2);
						t14 = ((T10)((l5)&((T10)(GE_nat32(63)))));
						t14 = ((T10)((t14)|((T10)(GE_nat32(128)))));
						t6 = (T10f23(ac, &t14));
						t2 = ((T6)((l3)+((T6)(GE_int32(3)))));
						T162f16(ac, a4, t6, t2);
						l3 = ((T6)((l3)+((T6)(GE_int32(4)))));
					}
				}
			}
		} else {
			l7 = EIF_FALSE;
			t6 = (T10f23(ac, (&l5)));
			T162f16(ac, a4, t6, l3);
			l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
		}
	}
	if (l8) {
		t2 = ((T6)((l3)+((T6)(GE_int32(1)))));
		T162f11(ac, a4, t2);
	}
	T162f16(ac, a4, (T8)(GE_nat8(0)), l3);
	t3 = (T1)(a6!=EIF_VOID);
	if (t3) {
		T1067f2(ac, a6, l3);
	}
}

/* CELL [INTEGER_32].put */
void T1067f2(TC* ac, T0* C, T6 a1)
{
	((T1067*)(C))->a1 = a1;
}

/* CELL [INTEGER_32].put */
T0* T1067c2(TC* ac, T6 a1)
{
	T0* C;
	C = GE_new1067(ac, EIF_TRUE);
	((T1067*)(C))->a1 = a1;
	return C;
}

/* NATURAL_32.is_less_equal */
T1 T10f5(TC* ac, T10 volatile* C, T10 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((T1)((a1)<(*C)));
	R = ((T1)(!(t1)));
	return R;
}

/* UTF_CONVERTER.to_natural_32 */
T10 T40s6(TC* ac, T0* a1)
{
	T10 R = 0;
	T0* l1 = 0;
	l1 = (T40s7(ac));
	T1032f19(ac, l1, a1, (T6)(GE_int32(0)));
	R = (T1032f12(ac, l1));
	return R;
}

/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.parsed_natural_32 */
T10 T1032f12(TC* ac, T0* C)
{
	T10 R = 0;
	T11 t1;
	t1 = ((T11)((((T1032*)(C))->a3)*((T11)(GE_nat64(16)))));
	t1 = ((T11)((t1)+(((T1032*)(C))->a4)));
	R = ((T10)(t1));
	return R;
}

/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.parse_string_with_type */
void T1032f19(TC* ac, T0* C, T0* a1, T6 a2)
{
	T6 volatile l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T6 l4 = 0;
	T10 volatile l5 = 0;
	T3 volatile l6 = 0;
	T0* m1 = 0;
	T0* m2 = 0;
	T1 t1;
	T6 t2;
	T2 t3;
	T3 t4;
	T10 t5;
	T1032f18(ac, C, a2);
	t1 = (a1?((m1 = a1, T1032f19ot1(ac, a1))):EIF_FALSE);
	if (t1) {
		l2 = (T104x2211878(ac, m1));
		l1 = (T104x2211879(ac, m1));
		t2 = (T104x2228263(ac, m1));
		l4 = ((T6)((l1)+(t2)));
		while (1) {
			t1 = (T1)((l1) == (l4));
			if (!(t1)) {
				t1 = (T6f14(ac, &(((T1032*)(C))->a1), (T6)(GE_int32(4))));
			}
			if (t1) {
				break;
			}
			t2 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t1 = ((T1)((t2)<(l4)));
			if (t1) {
				t2 = ((T6)((l1)+((T6)(GE_int32(1)))));
				((T1032*)(C))->a9 = (((T15*)(l2))->z2[t2]);
			} else {
				((T1032*)(C))->a9 = (T2)(' ');
			}
			t3 = (((T15*)(l2))->z2[l1]);
			T1032f22(ac, C, t3);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	} else {
		t1 = (a1?((m2 = a1, T1032f19ot2(ac, a1))):EIF_FALSE);
		if (t1) {
			l3 = (((((T0*)(m2))->id==20)?((T20*)(m2))->a1:((T18*)(m2))->a1));
			l1 = (((((T0*)(m2))->id==20)?((T20*)(m2))->a3:T18f8(ac, m2)));
			t2 = (((((T0*)(m2))->id==20)?((T20*)(m2))->a2:((T18*)(m2))->a2));
			l4 = ((T6)((l1)+(t2)));
			while (1) {
				t1 = (T1)((l1) == (l4));
				if (!(t1)) {
					t1 = (T6f14(ac, &(((T1032*)(C))->a1), (T6)(GE_int32(4))));
				}
				if (t1) {
					break;
				}
				t2 = ((T6)((l1)+((T6)(GE_int32(1)))));
				t1 = ((T1)((t2)<(l4)));
				if (t1) {
					t2 = ((T6)((l1)+((T6)(GE_int32(1)))));
					t4 = (((T16*)(l3))->z2[t2]);
					((T1032*)(C))->a9 = ((T2)(t4));
				} else {
					((T1032*)(C))->a9 = (T2)(' ');
				}
				l6 = (((T16*)(l3))->z2[l1]);
				t1 = (T3f12(ac, (&l6)));
				if (t1) {
					t3 = ((T2)(l6));
					T1032f22(ac, C, t3);
				} else {
					((T1032*)(C))->a1 = (T6)(GE_int32(4));
				}
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		} else {
			l1 = (T6)(GE_int32(1));
			l4 = (T41x2228263(ac, a1));
			while (1) {
				t1 = (T6f4(ac, (&l1), l4));
				if (!(t1)) {
					t1 = (T6f14(ac, &(((T1032*)(C))->a1), (T6)(GE_int32(4))));
				}
				if (t1) {
					break;
				}
				t2 = ((T6)((l1)+((T6)(GE_int32(1)))));
				t1 = ((T1)((t2)<(l4)));
				if (t1) {
					t2 = ((T6)((l1)+((T6)(GE_int32(1)))));
					t5 = (T41x2228225T6(ac, a1, t2));
					((T1032*)(C))->a9 = ((T2)(t5));
				} else {
					((T1032*)(C))->a9 = (T2)(' ');
				}
				l5 = (T41x2228225T6(ac, a1, l1));
				t1 = (T10f30(ac, (&l5)));
				if (t1) {
					t3 = ((T2)(l5));
					T1032f22(ac, C, t3);
				} else {
					((T1032*)(C))->a1 = (T6)(GE_int32(4));
				}
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
	}
}

T1 T1032f19ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 20:
	case 18:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

T1 T1032f19ot2(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 20:
	case 18:
		return EIF_TRUE;
	default:
		return EIF_FALSE;
	}
}

/* NATURAL_32.is_valid_character_8_code */
T1 T10f30(TC* ac, T10 volatile* C)
{
	T1 R = 0;
	T6 volatile t1;
	T10 t2;
	t1 = (T6)(GE_int32(255));
	t2 = (T6f20(ac, &t1));
	R = (T10f5(ac, &(*C), t2));
	return R;
}

/* IMMUTABLE_STRING_32.code */
T10 T20f5(TC* ac, T0* C, T6 a1)
{
	T10 R = 0;
	T6 t1;
	T3 t2;
	t1 = ((T6)((a1)+(((T20*)(C))->a3)));
	t1 = ((T6)((t1)-((T6)(GE_int32(1)))));
	t2 = (((T16*)(((T20*)(C))->a1))->z2[t1]);
	R = ((T10)(t2));
	return R;
}

/* STRING_32.count */
T6 T18f2(TC* ac, T0* C)
{
	T6 R = 0;
	R = ((T18*)(C))->a2;
	return R;
}

/* IMMUTABLE_STRING_32.count */
T6 T20f2(TC* ac, T0* C)
{
	T6 R = 0;
	R = ((T20*)(C))->a2;
	return R;
}

/* CHARACTER_32.is_character_8 */
T1 T3f12(TC* ac, T3 volatile* C)
{
	T1 R = 0;
	T10 volatile t1;
	T6 volatile t2;
	T10 t3;
	t1 = ((T10)(*C));
	t2 = (T6)(GE_int32(255));
	t3 = (T6f20(ac, &t2));
	R = (T10f5(ac, &t1, t3));
	return R;
}

/* STRING_32.area_lower */
T6 T18f8(TC* ac, T0* C)
{
	T6 R = 0;
	return R;
}

/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.parse_character */
void T1032f22(TC* ac, T0* C, T2 a1)
{
	T11 l1 = 0;
	T11 l2 = 0;
	T6 volatile l3 = 0;
	T1 t1;
	T1 t2;
	T8 volatile t3;
	T8 volatile t4;
	T0* t5;
	T8 volatile t6;
	T11 t7;
	T8 volatile t8;
	l3 = ((T1032*)(C))->a1;
	t1 = (T6f15(ac, (&l3), (T6)(GE_int32(5))));
	if (t1) {
		switch (l3) {
		case GE_int32(0):
			t2 = (T1)((a1) == ((T2)('0')));
			if (t2) {
				t2 = (T1)((((T1032*)(C))->a9) == ((T2)('x')));
				if (!(t2)) {
					t1 = (T1)((((T1032*)(C))->a9) == ((T2)('X')));
				} else {
					t1 = EIF_TRUE;
				}
			} else {
				t1 = EIF_FALSE;
			}
			if (!(t1)) {
				t1 = (T1)((a1) == ((T2)('&')));
			}
			if (t1) {
				l3 = (T6)(GE_int32(1));
			} else {
				t1 = (T1)((a1) == ((T2)('-')));
				if (!(t1)) {
					t1 = (T1)((a1) == ((T2)('+')));
				}
				if (t1) {
					l3 = (T6)(GE_int32(1));
					t1 = (T1)((a1) == ((T2)('-')));
					if (t1) {
						((T1032*)(C))->a7 = (T6)(GE_int32(1));
					} else {
						((T1032*)(C))->a7 = (T6)(GE_int32(0));
					}
				} else {
					t1 = (T2f28(ac, &a1));
					if (t1) {
						l3 = (T6)(GE_int32(3));
						((T1032*)(C))->a3 = (T11)(GE_nat64(0));
						t3 = (T2f29(ac, &a1));
						((T1032*)(C))->a4 = (T8f15(ac, &t3));
					} else {
						if (((T1032*)(C))->a10) {
							t1 = (T17f16(ac, ((T1032*)(C))->a5, a1));
						} else {
							t1 = EIF_FALSE;
						}
						if (t1) {
						} else {
							l3 = (T6)(GE_int32(4));
						}
					}
				}
			}
			break;
		case GE_int32(1):
			t1 = (T2f28(ac, &a1));
			if (t1) {
				((T1032*)(C))->a3 = (T11)(GE_nat64(0));
				t4 = (T2f29(ac, &a1));
				((T1032*)(C))->a4 = (T8f15(ac, &t4));
				l3 = (T6)(GE_int32(3));
				t1 = (T1)(!(T1)((((T1032*)(C))->a8) == ((T6)(GE_int32(0)))));
				if (t1) {
					t5 = (T1032f15(ac, C));
					t1 = (T1668f7(ac, t5, ((T1032*)(C))->a3, ((T1032*)(C))->a4, ((T1032*)(C))->a8, ((T1032*)(C))->a7));
				}
				if (t1) {
					((T1032*)(C))->a2 = EIF_TRUE;
					((T1032*)(C))->a4 = (T11)(GE_nat64(0));
					l3 = (T6)(GE_int32(6));
				}
			} else {
				t1 = (T1)((a1) == ((T2)('#')));
				if (t1) {
					l3 = (T6)(GE_int32(1));
				} else {
					t1 = (T1)((a1) == ((T2)('x')));
					if (!(t1)) {
						t1 = (T1)((a1) == ((T2)('X')));
					}
					if (t1) {
						l3 = (T6)(GE_int32(2));
					}
				}
			}
			break;
		case GE_int32(2):
			t1 = (T2f28(ac, &a1));
			if (t1) {
				((T1032*)(C))->a3 = (T11)(GE_nat64(0));
				t6 = (T2f29(ac, &a1));
				((T1032*)(C))->a4 = (T8f15(ac, &t6));
				l3 = (T6)(GE_int32(3));
				t1 = (T1)(!(T1)((((T1032*)(C))->a8) == ((T6)(GE_int32(0)))));
				if (t1) {
					t5 = (T1032f15(ac, C));
					t1 = (T1668f7(ac, t5, ((T1032*)(C))->a3, ((T1032*)(C))->a4, ((T1032*)(C))->a8, ((T1032*)(C))->a7));
				}
				if (t1) {
					((T1032*)(C))->a2 = EIF_TRUE;
					((T1032*)(C))->a4 = (T11)(GE_nat64(0));
					l3 = (T6)(GE_int32(6));
				}
			}
			break;
		case GE_int32(3):
			t1 = (T2f28(ac, &a1));
			if (t1) {
				l1 = ((T1032*)(C))->a3;
				l2 = ((T1032*)(C))->a4;
				t7 = ((T11)((((T1032*)(C))->a3)*((T11)(GE_nat64(16)))));
				((T1032*)(C))->a3 = ((T11)((t7)+(((T1032*)(C))->a4)));
				t8 = (T2f29(ac, &a1));
				((T1032*)(C))->a4 = (T8f15(ac, &t8));
				t1 = (T1)(!(T1)((((T1032*)(C))->a8) == ((T6)(GE_int32(0)))));
				if (t1) {
					t5 = (T1032f15(ac, C));
					((T1032*)(C))->a2 = (T1668f7(ac, t5, ((T1032*)(C))->a3, ((T1032*)(C))->a4, ((T1032*)(C))->a8, ((T1032*)(C))->a7));
					t1 = (T1032f16(ac, C));
					if (t1) {
						((T1032*)(C))->a3 = l1;
						((T1032*)(C))->a4 = l2;
						l3 = (T6)(GE_int32(6));
					}
				}
			} else {
				if (((T1032*)(C))->a11) {
					t1 = (T17f16(ac, ((T1032*)(C))->a6, a1));
				} else {
					t1 = EIF_FALSE;
				}
				if (t1) {
					l3 = (T6)(GE_int32(4));
				} else {
					l3 = (T6)(GE_int32(5));
				}
			}
			break;
		case GE_int32(4):
			t1 = ((T1)(!(((T1032*)(C))->a11)));
			if (!(t1)) {
				t2 = (T17f16(ac, ((T1032*)(C))->a6, a1));
				t1 = ((T1)(!(t2)));
			}
			if (t1) {
				l3 = (T6)(GE_int32(5));
			}
			break;
		default:
			GE_raise(GE_EX_WHEN);
			break;
		}
	}
	((T1032*)(C))->a1 = l3;
}

/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.overflowed */
T1 T1032f16(TC* ac, T0* C)
{
	T1 R = 0;
	if (((T1032*)(C))->a2) {
		R = (T1)((((T1032*)(C))->a7) == ((T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* INTEGER_OVERFLOW_CHECKER.will_overflow */
T1 T1668f7(TC* ac, T0* C, T11 a1, T11 a2, T6 a3, T6 a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T1 t1;
	T1 t2;
	T6 t3;
	T11 t4;
	t1 = (T1)(!(T1)((a3) == ((T6)(GE_int32(0)))));
	if (t1) {
		t2 = (T1)((a3) == ((T6)(GE_int32(1))));
		if (!(t2)) {
			t2 = (T1)((a3) == ((T6)(GE_int32(2))));
		}
		if (!(t2)) {
			t1 = (T1)((a3) == ((T6)(GE_int32(3))));
		} else {
			t1 = EIF_TRUE;
		}
		if (!(t1)) {
			t1 = (T1)((a3) == ((T6)(GE_int32(4))));
		}
		if (t1) {
			t3 = ((T6)((a4)*((T6)(GE_int32(4)))));
			l1 = ((T6)((t3)+(a3)));
			t4 = (((T1355*)(((T1668*)(C))->a1))->z2[l1]);
			t1 = (T11f20(ac, &a1, t4));
			if (!(t1)) {
				t4 = (((T1355*)(((T1668*)(C))->a1))->z2[l1]);
				t1 = (T1)((a1) == (t4));
				if (t1) {
					t4 = (((T1355*)(((T1668*)(C))->a2))->z2[l1]);
					R = (T11f20(ac, &a2, t4));
				} else {
					R = EIF_FALSE;
				}
			} else {
				R = EIF_TRUE;
			}
		} else {
			t1 = (T1)((a4) == ((T6)(GE_int32(1))));
			if (t1) {
				t1 = (T11f20(ac, &a1, (T11)(GE_nat64(0))));
				if (!(t1)) {
					R = (T11f20(ac, &a2, (T11)(GE_nat64(0))));
				} else {
					R = EIF_TRUE;
				}
			} else {
				l1 = ((T6)((a3)-((T6)(GE_int32(10)))));
				t4 = (((T1355*)(((T1668*)(C))->a3))->z2[l1]);
				t1 = (T11f20(ac, &a1, t4));
				if (!(t1)) {
					t4 = (((T1355*)(((T1668*)(C))->a3))->z2[l1]);
					t1 = (T1)((a1) == (t4));
					if (t1) {
						t4 = (((T1355*)(((T1668*)(C))->a4))->z2[l1]);
						R = (T11f20(ac, &a2, t4));
					} else {
						R = EIF_FALSE;
					}
				} else {
					R = EIF_TRUE;
				}
			}
		}
	}
	return R;
}

/* NATURAL_64.is_greater */
T1 T11f20(TC* ac, T11 volatile* C, T11 a1)
{
	T1 R = 0;
	R = ((T1)((a1)<(*C)));
	return R;
}

/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.overflow_checker */
T0* T1032f15(TC* ac, T0* C)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[5]) {
		if (ac->thread_onces->reference_exception[5]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[5]);
		}
		return ac->thread_onces->reference_value[5];
	} else {
		ac->thread_onces->reference_status[5] = '\1';
		ac->thread_onces->reference_value[5] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[5] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T1668c13(ac);
	ac->thread_onces->reference_value[5] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* INTEGER_OVERFLOW_CHECKER.make */
T0* T1668c13(TC* ac)
{
	T0* C;
	T6 volatile t1;
	T4 volatile t2;
	T11 volatile t3;
	T4 volatile t4;
	T5 volatile t5;
	T5 volatile t6;
	T6 volatile t7;
	T7 volatile t8;
	T7 volatile t9;
	T4 volatile t10;
	T4 volatile t11;
	T5 volatile t12;
	T5 volatile t13;
	T6 volatile t14;
	T6 volatile t15;
	T7 volatile t16;
	T7 volatile t17;
	T6 t18;
	T8 volatile t19;
	T8 volatile t20;
	T9 volatile t21;
	T9 volatile t22;
	T10 volatile t23;
	T10 volatile t24;
	T11 volatile t25;
	C = GE_new1668(ac, EIF_TRUE);
	t1 = (T6)(GE_int32(4));
	t1 = ((T6)((t1)*((T6)(GE_int32(2)))));
	t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
	((T1668*)(C))->a1 = T1355c11(ac, t1);
	T1355f13(ac, ((T1668*)(C))->a1, (T11)(GE_nat64(0)));
	t1 = (T6)(GE_int32(4));
	t1 = ((T6)((t1)*((T6)(GE_int32(2)))));
	t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
	((T1668*)(C))->a2 = T1355c11(ac, t1);
	T1355f13(ac, ((T1668*)(C))->a2, (T11)(GE_nat64(0)));
	t2 = (T4)(GE_int8(127));
	t2 = ((T4)((t2)/((T4)(GE_int8(10)))));
	t3 = (T4f9(ac, &t2));
	T1355f13(ac, ((T1668*)(C))->a1, t3);
	t4 = (T4)(GE_int8(127));
	t4 = ((T4)((t4)%((T4)(GE_int8(10)))));
	t3 = (T4f9(ac, &t4));
	T1355f13(ac, ((T1668*)(C))->a2, t3);
	t5 = (T5)(GE_int16(32767));
	t5 = ((T5)((t5)/((T5)(GE_int16(10)))));
	t3 = (T5f6(ac, &t5));
	T1355f13(ac, ((T1668*)(C))->a1, t3);
	t6 = (T5)(GE_int16(32767));
	t6 = ((T5)((t6)%((T5)(GE_int16(10)))));
	t3 = (T5f6(ac, &t6));
	T1355f13(ac, ((T1668*)(C))->a2, t3);
	t1 = (T6)(GE_int32(2147483647));
	t1 = ((T6)((t1)/((T6)(GE_int32(10)))));
	t3 = (T6f19(ac, &t1));
	T1355f13(ac, ((T1668*)(C))->a1, t3);
	t7 = (T6)(GE_int32(2147483647));
	t7 = ((T6)((t7)%((T6)(GE_int32(10)))));
	t3 = (T6f19(ac, &t7));
	T1355f13(ac, ((T1668*)(C))->a2, t3);
	t8 = (T7)(GE_int64(9223372036854775807));
	t8 = ((T7)((t8)/((T7)(GE_int64(10)))));
	t3 = (T7f18(ac, &t8));
	T1355f13(ac, ((T1668*)(C))->a1, t3);
	t9 = (T7)(GE_int64(9223372036854775807));
	t9 = ((T7)((t9)%((T7)(GE_int64(10)))));
	t3 = (T7f18(ac, &t9));
	T1355f13(ac, ((T1668*)(C))->a2, t3);
	t10 = (T4)(GE_int8(-128));
	t10 = ((T4)((t10)/((T4)(GE_int8(10)))));
	t10 = ((T4)(-(t10)));
	t3 = (T4f9(ac, &t10));
	T1355f13(ac, ((T1668*)(C))->a1, t3);
	t11 = (T4)(GE_int8(-128));
	t11 = ((T4)((t11)%((T4)(GE_int8(10)))));
	t11 = ((T4)(-(t11)));
	t3 = (T4f9(ac, &t11));
	T1355f13(ac, ((T1668*)(C))->a2, t3);
	t12 = (T5)(GE_int16(-32768));
	t12 = ((T5)((t12)/((T5)(GE_int16(10)))));
	t12 = ((T5)(-(t12)));
	t3 = (T5f6(ac, &t12));
	T1355f13(ac, ((T1668*)(C))->a1, t3);
	t13 = (T5)(GE_int16(-32768));
	t13 = ((T5)((t13)%((T5)(GE_int16(10)))));
	t13 = ((T5)(-(t13)));
	t3 = (T5f6(ac, &t13));
	T1355f13(ac, ((T1668*)(C))->a2, t3);
	t14 = (T6)(GE_min_int32);
	t14 = ((T6)((t14)/((T6)(GE_int32(10)))));
	t14 = ((T6)(-(t14)));
	t3 = (T6f19(ac, &t14));
	T1355f13(ac, ((T1668*)(C))->a1, t3);
	t15 = (T6)(GE_min_int32);
	t15 = ((T6)((t15)%((T6)(GE_int32(10)))));
	t15 = ((T6)(-(t15)));
	t3 = (T6f19(ac, &t15));
	T1355f13(ac, ((T1668*)(C))->a2, t3);
	t16 = (T7)(GE_min_int64);
	t16 = ((T7)((t16)/((T7)(GE_int64(10)))));
	t16 = ((T7)(-(t16)));
	t3 = (T7f18(ac, &t16));
	T1355f13(ac, ((T1668*)(C))->a1, t3);
	t17 = (T7)(GE_min_int64);
	t17 = ((T7)((t17)%((T7)(GE_int64(10)))));
	t17 = ((T7)(-(t17)));
	t3 = (T7f18(ac, &t17));
	T1355f13(ac, ((T1668*)(C))->a2, t3);
	t18 = (T6)(GE_int32(4));
	t18 = ((T6)((t18)+((T6)(GE_int32(1)))));
	((T1668*)(C))->a3 = T1355c11(ac, t18);
	T1355f13(ac, ((T1668*)(C))->a3, (T11)(GE_nat64(0)));
	t18 = (T6)(GE_int32(4));
	t18 = ((T6)((t18)+((T6)(GE_int32(1)))));
	((T1668*)(C))->a4 = T1355c11(ac, t18);
	T1355f13(ac, ((T1668*)(C))->a4, (T11)(GE_nat64(0)));
	t19 = (T8)(GE_nat8(255));
	t19 = ((T8)((t19)/((T8)(GE_nat8(10)))));
	t3 = (T8f15(ac, &t19));
	T1355f13(ac, ((T1668*)(C))->a3, t3);
	t20 = (T8)(GE_nat8(255));
	t20 = ((T8)((t20)%((T8)(GE_nat8(10)))));
	t3 = (T8f15(ac, &t20));
	T1355f13(ac, ((T1668*)(C))->a4, t3);
	t21 = (T9)(GE_nat16(65535));
	t21 = ((T9)((t21)/((T9)(GE_nat16(10)))));
	t3 = (T9f19(ac, &t21));
	T1355f13(ac, ((T1668*)(C))->a3, t3);
	t22 = (T9)(GE_nat16(65535));
	t22 = ((T9)((t22)%((T9)(GE_nat16(10)))));
	t3 = (T9f19(ac, &t22));
	T1355f13(ac, ((T1668*)(C))->a4, t3);
	t23 = (T10)(GE_nat32(4294967295));
	t23 = ((T10)((t23)/((T10)(GE_nat32(10)))));
	t3 = (T10f28(ac, &t23));
	T1355f13(ac, ((T1668*)(C))->a3, t3);
	t24 = (T10)(GE_nat32(4294967295));
	t24 = ((T10)((t24)%((T10)(GE_nat32(10)))));
	t3 = (T10f28(ac, &t24));
	T1355f13(ac, ((T1668*)(C))->a4, t3);
	t3 = (T11)(GE_nat64(18446744073709551615));
	t3 = ((T11)((t3)/((T11)(GE_nat64(10)))));
	t3 = (T11f21(ac, &t3));
	T1355f13(ac, ((T1668*)(C))->a3, t3);
	t25 = (T11)(GE_nat64(18446744073709551615));
	t25 = ((T11)((t25)%((T11)(GE_nat64(10)))));
	t25 = (T11f21(ac, &t25));
	T1355f13(ac, ((T1668*)(C))->a4, t25);
	return C;
}

/* NATURAL_64.to_natural_64 */
T11 T11f21(TC* ac, T11 volatile* C)
{
	T11 R = 0;
	R = *C;
	return R;
}

/* NATURAL_32.to_natural_64 */
T11 T10f28(TC* ac, T10 volatile* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* NATURAL_16.to_natural_64 */
T11 T9f19(TC* ac, T9 volatile* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* INTEGER_64.to_natural_64 */
T11 T7f18(TC* ac, T7 volatile* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* INTEGER_32.to_natural_64 */
T11 T6f19(TC* ac, T6 volatile* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* INTEGER_16.to_natural_64 */
T11 T5f6(TC* ac, T5 volatile* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* INTEGER_8.to_natural_64 */
T11 T4f9(TC* ac, T4 volatile* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* SPECIAL [NATURAL_64].extend */
void T1355f13(TC* ac, T0* C, T11 a1)
{
	T6 t1;
	{
	t1 = ((T1355*)(C))->a2;
	((T1355*)(C))->a2 = t1 + 1 ;
	((T1355*)(C))->z2[t1] = a1;
	}
}

/* SPECIAL [NATURAL_64].make_empty */
void T1355f11(TC* ac, T0* C, T6 a1)
{
	{
	}
}

/* SPECIAL [NATURAL_64].make_empty */
T0* T1355c11(TC* ac, T6 a1)
{
	T0* C;
	C = GE_new1355(ac, a1, EIF_TRUE);
	{
	}
	return C;
}

/* STRING_8.has */
T1 T17f16(TC* ac, T0* C, T2 a1)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 volatile l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T2 t2;
	l2 = ((T17*)(C))->a2;
	t1 = (T6f4(ac, (&l2), (T6)(GE_int32(0))));
	if (t1) {
		l1 = (T17f9(ac, C));
		l3 = ((T17*)(C))->a1;
		l2 = ((T6)((l2)+(l1)));
		while (1) {
			t1 = (T1)((l1) == (l2));
			if (!(t1)) {
				t2 = (((T15*)(l3))->z2[l1]);
				t1 = (T1)((t2) == (a1));
			}
			if (t1) {
				break;
			}
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		R = ((T1)((l1)<(l2)));
	}
	return R;
}

/* NATURAL_8.to_natural_64 */
T11 T8f15(TC* ac, T8 volatile* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* CHARACTER_8.to_hexa_digit */
T8 T2f29(TC* ac, T2 volatile* C)
{
	T8 R = 0;
	T8 l1 = 0;
	T10 volatile t1;
	T8 volatile t2;
	T4 volatile t3;
	T8 t4;
	T8 t5;
	t1 = (T2f7(ac, C));
	t2 = (T10f23(ac, &t1));
	R = ((T8)((t2)&((T8)(GE_nat8(79)))));
	t2 = ((T8)((R)<<((T6)(GE_int32(1)))));
	t3 = (T8f17(ac, &t2));
	t3 = ((T4)((t3)>>((T6)(GE_int32(7)))));
	l1 = (T4f5(ac, &t3));
	t4 = ((T8)(~(l1)));
	t4 = ((T8)((R)&(t4)));
	t5 = ((T8)((R)-((T8)(GE_nat8(55)))));
	t5 = ((T8)((t5)&(l1)));
	R = ((T8)((t4)|(t5)));
	return R;
}

/* INTEGER_8.to_natural_8 */
T8 T4f5(TC* ac, T4 volatile* C)
{
	T8 R = 0;
	R = ((T8)(*C));
	return R;
}

/* NATURAL_8.to_integer_8 */
T4 T8f17(TC* ac, T8 volatile* C)
{
	T4 R = 0;
	R = ((T4)(*C));
	return R;
}

/* CHARACTER_8.is_hexa_digit */
T1 T2f28(TC* ac, T2 volatile* C)
{
	T1 R = 0;
	T6 t1;
	T8 volatile t2;
	T8 t3;
	t1 = ((T6)(*C));
	t2 = (T2f13(ac, C, t1));
	t3 = (T8)(GE_nat8(64));
	t3 = ((T8)((t3)|((T8)(GE_nat8(4)))));
	t2 = ((T8)((t2)&(t3)));
	R = (T8f5(ac, &t2, (T8)(GE_nat8(0))));
	return R;
}

/* NATURAL_8.is_greater */
T1 T8f5(TC* ac, T8 volatile* C, T8 a1)
{
	T1 R = 0;
	R = ((T1)((a1)<(*C)));
	return R;
}

/* CHARACTER_8.character_types */
T8 T2f13(TC* ac, T2 volatile* C, T6 a1)
{
	T8 R = 0;
	T1 t1;
	T0* t2;
	t1 = ((T1)((a1)<((T6)(GE_int32(256)))));
	if (t1) {
		t2 = (T2f16(ac, C));
		R = (((T1075*)(t2))->z2[a1]);
	}
	return R;
}

/* CHARACTER_8.internal_character_types */
T0* T2f16(TC* ac, T2 volatile* C)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	T8 t1;
	if (ac->thread_onces->reference_status[6]) {
		if (ac->thread_onces->reference_exception[6]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[6]);
		}
		return ac->thread_onces->reference_value[6];
	} else {
		ac->thread_onces->reference_status[6] = '\1';
		ac->thread_onces->reference_value[6] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[6] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T1075c6(ac, (T6)(GE_int32(256)));
	ac->thread_onces->reference_value[6] = R;
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	t1 = (T8)(GE_nat8(32));
	t1 = ((T8)((t1)|((T8)(GE_nat8(8)))));
	T1075f7(ac, R, t1);
	t1 = (T8)(GE_nat8(32));
	t1 = ((T8)((t1)|((T8)(GE_nat8(8)))));
	T1075f7(ac, R, t1);
	t1 = (T8)(GE_nat8(32));
	t1 = ((T8)((t1)|((T8)(GE_nat8(8)))));
	T1075f7(ac, R, t1);
	t1 = (T8)(GE_nat8(32));
	t1 = ((T8)((t1)|((T8)(GE_nat8(8)))));
	T1075f7(ac, R, t1);
	t1 = (T8)(GE_nat8(32));
	t1 = ((T8)((t1)|((T8)(GE_nat8(8)))));
	T1075f7(ac, R, t1);
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	t1 = (T8)(GE_nat8(32));
	t1 = ((T8)((t1)|((T8)(GE_nat8(8)))));
	T1075f7(ac, R, t1);
	t1 = (T8)(GE_nat8(32));
	t1 = ((T8)((t1)|((T8)(GE_nat8(8)))));
	T1075f7(ac, R, t1);
	t1 = (T8)(GE_nat8(32));
	t1 = ((T8)((t1)|((T8)(GE_nat8(8)))));
	T1075f7(ac, R, t1);
	t1 = (T8)(GE_nat8(32));
	t1 = ((T8)((t1)|((T8)(GE_nat8(8)))));
	T1075f7(ac, R, t1);
	t1 = (T8)(GE_nat8(128));
	t1 = ((T8)((t1)|((T8)(GE_nat8(8)))));
	T1075f7(ac, R, t1);
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(4)));
	T1075f7(ac, R, (T8)(GE_nat8(4)));
	T1075f7(ac, R, (T8)(GE_nat8(4)));
	T1075f7(ac, R, (T8)(GE_nat8(4)));
	T1075f7(ac, R, (T8)(GE_nat8(4)));
	T1075f7(ac, R, (T8)(GE_nat8(4)));
	T1075f7(ac, R, (T8)(GE_nat8(4)));
	T1075f7(ac, R, (T8)(GE_nat8(4)));
	T1075f7(ac, R, (T8)(GE_nat8(4)));
	T1075f7(ac, R, (T8)(GE_nat8(4)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	t1 = (T8)(GE_nat8(1));
	t1 = ((T8)((t1)|((T8)(GE_nat8(64)))));
	T1075f7(ac, R, t1);
	t1 = (T8)(GE_nat8(1));
	t1 = ((T8)((t1)|((T8)(GE_nat8(64)))));
	T1075f7(ac, R, t1);
	t1 = (T8)(GE_nat8(1));
	t1 = ((T8)((t1)|((T8)(GE_nat8(64)))));
	T1075f7(ac, R, t1);
	t1 = (T8)(GE_nat8(1));
	t1 = ((T8)((t1)|((T8)(GE_nat8(64)))));
	T1075f7(ac, R, t1);
	t1 = (T8)(GE_nat8(1));
	t1 = ((T8)((t1)|((T8)(GE_nat8(64)))));
	T1075f7(ac, R, t1);
	t1 = (T8)(GE_nat8(1));
	t1 = ((T8)((t1)|((T8)(GE_nat8(64)))));
	T1075f7(ac, R, t1);
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	t1 = (T8)(GE_nat8(2));
	t1 = ((T8)((t1)|((T8)(GE_nat8(64)))));
	T1075f7(ac, R, t1);
	t1 = (T8)(GE_nat8(2));
	t1 = ((T8)((t1)|((T8)(GE_nat8(64)))));
	T1075f7(ac, R, t1);
	t1 = (T8)(GE_nat8(2));
	t1 = ((T8)((t1)|((T8)(GE_nat8(64)))));
	T1075f7(ac, R, t1);
	t1 = (T8)(GE_nat8(2));
	t1 = ((T8)((t1)|((T8)(GE_nat8(64)))));
	T1075f7(ac, R, t1);
	t1 = (T8)(GE_nat8(2));
	t1 = ((T8)((t1)|((T8)(GE_nat8(64)))));
	T1075f7(ac, R, t1);
	t1 = (T8)(GE_nat8(2));
	t1 = ((T8)((t1)|((T8)(GE_nat8(64)))));
	T1075f7(ac, R, t1);
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	t1 = (T8)(GE_nat8(32));
	t1 = ((T8)((t1)|((T8)(GE_nat8(128)))));
	t1 = ((T8)((t1)|((T8)(GE_nat8(8)))));
	T1075f7(ac, R, t1);
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	T1075f7(ac, R, (T8)(GE_nat8(32)));
	t1 = (T8)(GE_nat8(128));
	t1 = ((T8)((t1)|((T8)(GE_nat8(8)))));
	T1075f7(ac, R, t1);
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(16)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(1)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(0)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	T1075f7(ac, R, (T8)(GE_nat8(2)));
	ac->last_rescue = r.previous;
	return R;
}

/* SPECIAL [NATURAL_8].extend */
void T1075f7(TC* ac, T0* C, T8 a1)
{
	T6 t1;
	{
	t1 = ((T1075*)(C))->a2;
	((T1075*)(C))->a2 = t1 + 1 ;
	((T1075*)(C))->z2[t1] = a1;
	}
}

/* SPECIAL [NATURAL_8].make_empty */
void T1075f6(TC* ac, T0* C, T6 a1)
{
	{
	}
}

/* SPECIAL [NATURAL_8].make_empty */
T0* T1075c6(TC* ac, T6 a1)
{
	T0* C;
	C = GE_new1075(ac, a1, EIF_TRUE);
	{
	}
	return C;
}

/* UC_UTF8_STRING.area_lower */
T6 T1078f49(TC* ac, T0* C)
{
	T6 R = 0;
	return R;
}

/* UC_STRING.area_lower */
T6 T919f11(TC* ac, T0* C)
{
	T6 R = 0;
	return R;
}

/* STRING_8.area_lower */
T6 T17f9(TC* ac, T0* C)
{
	T6 R = 0;
	return R;
}

/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.reset */
void T1032f18(TC* ac, T0* C, T6 a1)
{
	((T1032*)(C))->a1 = (T6)(GE_int32(0));
	((T1032*)(C))->a7 = (T6)(GE_int32(0));
	((T1032*)(C))->a8 = a1;
	((T1032*)(C))->a2 = EIF_FALSE;
}

/* UTF_CONVERTER.ctoi_convertor */
T0* T40s7(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[7]) {
		if (ac->thread_onces->reference_exception[7]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[7]);
		}
		return ac->thread_onces->reference_value[7];
	} else {
		ac->thread_onces->reference_status[7] = '\1';
		ac->thread_onces->reference_value[7] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[7] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T1032c17(ac);
	ac->thread_onces->reference_value[7] = R;
	T1032f20(ac, R, EIF_FALSE);
	T1032f21(ac, R, EIF_FALSE);
	ac->last_rescue = r.previous;
	return R;
}

/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.set_trailing_separators_acceptable */
void T1032f21(TC* ac, T0* C, T1 a1)
{
	((T1032*)(C))->a11 = a1;
}

/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.set_leading_separators_acceptable */
void T1032f20(TC* ac, T0* C, T1 a1)
{
	((T1032*)(C))->a10 = a1;
}

/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.make */
T0* T1032c17(TC* ac)
{
	T0* C;
	C = GE_new1032(ac, EIF_TRUE);
	T1032f18(ac, C, (T6)(GE_int32(0)));
	((T1032*)(C))->a5 = T17c85(ac, GE_ms8(" ", 1));
	((T1032*)(C))->a6 = T17c85(ac, GE_ms8(" ", 1));
	return C;
}

/* STRING_8.make_from_string */
T0* T17c85(TC* ac, T0* a1)
{
	T0* C;
	T1 t1;
	T6 t2;
	T0* t3;
	T6 t4;
	C = GE_new17(ac, EIF_TRUE);
	((T17*)(C))->a1 = (((T17*)(a1))->a1);
	((T17*)(C))->a2 = (((T17*)(a1))->a2);
	((T17*)(C))->a3 = (T6)(GE_int32(0));
	((T17*)(C))->a4 = (T6)(GE_int32(0));
	t1 = (T1)(C!=a1);
	if (t1) {
		t2 = ((T6)((((T17*)(C))->a2)+((T6)(GE_int32(1)))));
		((T17*)(C))->a1 = T15c16(ac, t2);
		t3 = (((T17*)(a1))->a1);
		t2 = (T17f9(ac, a1));
		t4 = ((T6)((((T17*)(C))->a2)+((T6)(GE_int32(1)))));
		T15f14(ac, ((T17*)(C))->a1, t3, t2, (T6)(GE_int32(0)), t4);
	}
	return C;
}

/* SPECIAL [CHARACTER_8].copy_data */
void T15f14(TC* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T2 t2;
	t1 = (T1)(a1==C);
	if (t1) {
		T15f17(ac, C, a2, a3, a4);
	} else {
		l1 = a2;
		l2 = a3;
		l3 = ((T6)((a2)+(a4)));
		while (1) {
			t1 = (T1)((l1) == (l3));
			if (t1) {
				break;
			}
			t2 = (((T15*)(a1))->z2[l1]);
			T15f18(ac, C, t2, l2);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		}
	}
}

/* SPECIAL [CHARACTER_8].force */
void T15f18(TC* ac, T0* C, T2 a1, T6 a2)
{
	T1 t1;
	t1 = ((T1)((a2)<(((T15*)(C))->a2)));
	if (t1) {
		((T15*)(C))->z2[a2] = (a1);
	} else {
		T15f19(ac, C, a1);
	}
}

/* SPECIAL [CHARACTER_8].move_data */
void T15f17(TC* ac, T0* C, T6 a1, T6 a2, T6 a3)
{
	T1 t1;
	T6 t2;
	t1 = (T1)((a1) == (a2));
	if (t1) {
	} else {
		t1 = (T6f4(ac, &a1, a2));
		if (t1) {
			t2 = ((T6)((a2)+(a3)));
			t1 = ((T1)((t2)<(a1)));
			if (t1) {
				T15f20(ac, C, a1, a2, a3);
			} else {
				T15f21(ac, C, a1, a2, a3);
			}
		} else {
			t2 = ((T6)((a1)+(a3)));
			t1 = ((T1)((t2)<(a2)));
			if (t1) {
				T15f20(ac, C, a1, a2, a3);
			} else {
				T15f21(ac, C, a1, a2, a3);
			}
		}
	}
}

/* SPECIAL [CHARACTER_8].overlapping_move */
void T15f21(TC* ac, T0* C, T6 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T6 volatile t2;
	T2 t3;
	T6 t4;
	t1 = ((T1)((a1)<(a2)));
	if (t1) {
		t2 = ((T6)((a1)+(a3)));
		l1 = ((T6)((t2)-((T6)(GE_int32(1)))));
		l2 = ((T6)((a1)-((T6)(GE_int32(1)))));
		l3 = ((T6)((a2)-(a1)));
		t2 = ((T6)((a2)+(a3)));
		t1 = (T6f14(ac, &t2, ((T15*)(C))->a2));
		if (t1) {
			t3 = (((T15*)(C))->z2[a1]);
			t4 = ((T6)((a2)+(a3)));
			t4 = ((T6)((t4)-((T6)(GE_int32(1)))));
			T15f15(ac, C, t3, ((T15*)(C))->a2, t4);
		}
		while (1) {
			t1 = (T1)((l1) == (l2));
			if (t1) {
				break;
			}
			t3 = (((T15*)(C))->z2[l1]);
			t4 = ((T6)((l1)+(l3)));
			((T15*)(C))->z2[t4] = (t3);
			l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
		}
	} else {
		l1 = a1;
		l2 = ((T6)((a1)+(a3)));
		l3 = ((T6)((a1)-(a2)));
		while (1) {
			t1 = (T1)((l1) == (l2));
			if (t1) {
				break;
			}
			t3 = (((T15*)(C))->z2[l1]);
			t4 = ((T6)((l1)-(l3)));
			T15f18(ac, C, t3, t4);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
}

/* SPECIAL [CHARACTER_8].non_overlapping_move */
void T15f20(TC* ac, T0* C, T6 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T2 t2;
	T6 t3;
	l1 = a1;
	l2 = ((T6)((a1)+(a3)));
	l3 = ((T6)((a2)-(a1)));
	while (1) {
		t1 = (T1)((l1) == (l2));
		if (t1) {
			break;
		}
		t2 = (((T15*)(C))->z2[l1]);
		t3 = ((T6)((l1)+(l3)));
		T15f18(ac, C, t2, t3);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
}

/* UTF_CONVERTER.is_hexa_decimal */
T1 T40s5(TC* ac, T0* a1)
{
	T1 R = 0;
	T0* l1 = 0;
	l1 = (T40s7(ac));
	T1032f18(ac, l1, (T6)(GE_int32(13)));
	T1032f19(ac, l1, a1, (T6)(GE_int32(13)));
	R = (T1032f14(ac, l1));
	return R;
}

/* HEXADECIMAL_STRING_TO_INTEGER_CONVERTER.is_integral_integer */
T1 T1032f14(TC* ac, T0* C)
{
	T1 R = 0;
	T1 t1;
	t1 = (T1)((((T1032*)(C))->a1) == ((T6)(GE_int32(2))));
	if (!(t1)) {
		t1 = (T1)((((T1032*)(C))->a1) == ((T6)(GE_int32(3))));
	}
	if (t1) {
		R = ((T1)(!(((T1032*)(C))->a2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* UC_UTF8_STRING.substring */
T0* T1078f10(TC* ac, T0* C, T6 a1, T6 a2)
{
	T0* R = 0;
	T1 t1;
	t1 = ((T1)((a2)<(a1)));
	if (t1) {
		R = T1078c85(ac, (T6)(GE_int32(0)));
	} else {
		R = T1078c86(ac, C, a1, a2);
	}
	return R;
}

/* UC_UTF8_STRING.make_from_substring */
T0* T1078c86(TC* ac, T0* a1, T6 a2, T6 a3)
{
	T0* C;
	C = GE_new1078(ac, EIF_TRUE);
	T1078f104(ac, C, a1, a2, a3);
	return C;
}

/* UC_UTF8_STRING.make_from_substring_general */
void T1078f104(TC* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* m1 = 0;
	T1 t1;
	T1 t2;
	T0* t3;
	T6 t4;
	t1 = (m1 = a1, EIF_TRUE);
	if (t1) {
		l3 = m1;
		((T1078*)(C))->a2 = (((T1078*)(l3))->a2);
		t1 = (T1)(a1!=C);
		if (t1) {
			l3 = EIF_VOID;
		}
	}
	t2 = (T1)(l3!=EIF_VOID);
	if (t2) {
		t1 = (T1)((a2) == ((T6)(GE_int32(1))));
	} else {
		t1 = EIF_FALSE;
	}
	if (t1) {
		t1 = (T1)((a3) == (((T1078*)(C))->a1));
	}
	if (t1) {
		((T1078*)(C))->a2 = (((T1078*)(l3))->a2);
	} else {
		t1 = ((T1)((a3)<(a2)));
		if (t1) {
			T1078f85(ac, C, (T6)(GE_int32(0)));
		} else {
			t1 = (T1)(l3!=EIF_VOID);
			if (t1) {
				l2 = (T1078f33(ac, l3));
			} else {
				l2 = a1;
			}
			t3 = (T1078s45(ac));
			l1 = (T168s10(ac, l2, a2, a3));
			T1078f85(ac, C, l1);
			t4 = ((T6)((a3)-(a2)));
			t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
			T1078f74(ac, C, t4);
			((T1078*)(C))->a3 = l1;
			T1078f103(ac, C, l2, a2, a3, l1, (T6)(GE_int32(1)));
		}
	}
}

/* UC_UTF8_STRING.put_substring_at_byte_index */
void T1078f103(TC* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4, T6 a5)
{
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T6 l6 = 0;
	T0* m1 = 0;
	T0* m2 = 0;
	T0* m3 = 0;
	T0* m4 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	T2 t4;
	T10 volatile t5;
	t1 = (T6f4(ac, &a4, (T6)(GE_int32(0))));
	if (t1) {
		t1 = (a1?((m1 = a1, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t2 = (T1078s42(ac));
			t1 = (T1070s1(ac, a1, ge488ov7995457));
		}
		if (t1) {
			t3 = ((T6)((a3)-(a2)));
			l2 = ((T6)((t3)+((T6)(GE_int32(1)))));
			t1 = (T1)((l2) == (a4));
			if (t1) {
				l3 = a5;
				l1 = a2;
				while (1) {
					t1 = (T6f4(ac, (&l1), a3));
					if (t1) {
						break;
					}
					t4 = (T17x2572289T6(ac, m1, l1));
					T1078f110(ac, C, t4, l3);
					l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				}
			} else {
				l3 = a5;
				l1 = a2;
				while (1) {
					t1 = (T6f4(ac, (&l1), a3));
					if (t1) {
						break;
					}
					l5 = (T17x2572289T6(ac, m1, l1));
					t2 = (T1078s45(ac));
					l4 = (T168s27(ac, l5));
					T1078f102(ac, C, l5, l4, l3);
					l3 = ((T6)((l3)+(l4)));
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				}
			}
		} else {
			t2 = (T1078s42(ac));
			t1 = (T1070s1(ac, a1, C));
			if (t1) {
				t1 = (a1?((m2 = a1, T1078f103ot1(ac, a1))):EIF_FALSE);
			}
			if (t1) {
				l3 = a5;
				l1 = (((((T0*)(m2))->id==1078)?T1078f14(ac, m2, a2):T919f37(ac, m2, a2)));
				t3 = ((T6)((l1)+(a4)));
				l2 = ((T6)((t3)-((T6)(GE_int32(1)))));
				while (1) {
					t1 = (T6f4(ac, (&l1), l2));
					if (t1) {
						break;
					}
					t4 = (((((T0*)(m2))->id==1078)?T1078f16(ac, m2, l1):T919f36(ac, m2, l1)));
					T1078f110(ac, C, t4, l3);
					l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				}
			} else {
				t1 = (a1?((m3 = a1, T1078f103ot2(ac, a1))):EIF_FALSE);
				if (t1) {
					l3 = a5;
					l1 = (T1078f14(ac, m3, a2));
					t3 = ((T6)((l1)+(a4)));
					l2 = ((T6)((t3)-((T6)(GE_int32(1)))));
					while (1) {
						t1 = (T6f4(ac, (&l1), l2));
						if (t1) {
							break;
						}
						t4 = (T1078f16(ac, m3, l1));
						T1078f110(ac, C, t4, l3);
						l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					}
				} else {
					t1 = (a1?((m4 = a1, T1078f103ot3(ac, a1))):EIF_FALSE);
					if (t1) {
						l3 = a5;
						l1 = (((((T0*)(m4))->id==1078)?T1078f14(ac, m4, a2):T919f37(ac, m4, a2)));
						t3 = ((T6)((l1)+(a4)));
						l2 = ((T6)((t3)-((T6)(GE_int32(1)))));
						while (1) {
							t1 = (T6f4(ac, (&l1), l2));
							if (t1) {
								break;
							}
							l6 = (((((T0*)(m4))->id==1078)?T1078f17(ac, m4, l1):T919f33(ac, m4, l1)));
							t2 = (T1078s45(ac));
							l4 = (T168s28(ac, l6));
							T1078f109(ac, C, l6, l4, l3);
							l3 = ((T6)((l3)+(l4)));
							l1 = (((((T0*)(m4))->id==1078)?T1078f18(ac, m4, l1):T919f34(ac, m4, l1)));
						}
					} else {
						l3 = a5;
						l1 = a2;
						while (1) {
							t1 = (T6f4(ac, (&l1), a3));
							if (t1) {
								break;
							}
							t5 = (T41x2228225T6(ac, a1, l1));
							l6 = (T10f11(ac, &t5));
							t2 = (T1078s45(ac));
							l4 = (T168s28(ac, l6));
							T1078f109(ac, C, l6, l4, l3);
							l3 = ((T6)((l3)+(l4)));
							l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						}
					}
				}
			}
		}
	}
}

T1 T1078f103ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

T1 T1078f103ot2(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 1078:
		return EIF_TRUE;
	default:
		return EIF_FALSE;
	}
}

T1 T1078f103ot3(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* NATURAL_32.to_integer_32 */
T6 T10f11(TC* ac, T10 volatile* C)
{
	T6 R = 0;
	R = ((T6)(*C));
	return R;
}

/* UC_STRING.next_byte_index */
T6 T919f34(TC* ac, T0* C, T6 a1)
{
	T6 R = 0;
	T0* t1;
	T2 t2;
	T6 t3;
	t1 = (T919s35(ac));
	t2 = (T919f36(ac, C, a1));
	t3 = (T168s2(ac, t2));
	R = ((T6)((a1)+(t3)));
	return R;
}

/* UC_UTF8_STRING.next_byte_index */
T6 T1078f18(TC* ac, T0* C, T6 a1)
{
	T6 R = 0;
	T0* t1;
	T2 t2;
	T6 t3;
	t1 = (T1078s45(ac));
	t2 = (T1078f16(ac, C, a1));
	t3 = (T168s2(ac, t2));
	R = ((T6)((a1)+(t3)));
	return R;
}

/* UC_UTF8_STRING.put_code_at_byte_index */
void T1078f109(TC* ac, T0* C, T6 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T2 l2 = 0;
	T6 l3 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	l3 = a1;
	t1 = ((T6)((a3)+(a2)));
	l1 = ((T6)((t1)-((T6)(GE_int32(1)))));
	while (1) {
		t2 = (T1)((l1) == (a3));
		if (t2) {
			break;
		}
		t3 = (T1078s58(ac));
		t1 = ((T6)((l3)%((T6)(GE_int32(64)))));
		t1 = ((T6)((t1)+((T6)(GE_int32(128)))));
		l2 = (T1360s2(ac, t1));
		T1078f110(ac, C, l2, l1);
		l3 = ((T6)((l3)/((T6)(GE_int32(64)))));
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
	}
	switch (a2) {
	case GE_int32(1):
		t3 = (T1078s58(ac));
		l2 = (T1360s2(ac, l3));
		break;
	case GE_int32(2):
		t3 = (T1078s58(ac));
		t1 = ((T6)((l3)+((T6)(GE_int32(192)))));
		l2 = (T1360s2(ac, t1));
		break;
	case GE_int32(3):
		t3 = (T1078s58(ac));
		t1 = ((T6)((l3)+((T6)(GE_int32(224)))));
		l2 = (T1360s2(ac, t1));
		break;
	case GE_int32(4):
		t3 = (T1078s58(ac));
		t1 = ((T6)((l3)+((T6)(GE_int32(240)))));
		l2 = (T1360s2(ac, t1));
		break;
	case GE_int32(5):
		t3 = (T1078s58(ac));
		t1 = ((T6)((l3)+((T6)(GE_int32(248)))));
		l2 = (T1360s2(ac, t1));
		break;
	case GE_int32(6):
		t3 = (T1078s58(ac));
		t1 = ((T6)((l3)+((T6)(GE_int32(252)))));
		l2 = (T1360s2(ac, t1));
		break;
	default:
		GE_raise(GE_EX_WHEN);
		break;
	}
	T1078f110(ac, C, l2, a3);
}

/* KL_INTEGER_ROUTINES.to_character */
T2 T1360s2(TC* ac, T6 a1)
{
	T2 R = 0;
	R = ((T2)(a1));
	return R;
}

/* UC_UTF8_STRING.integer_ */
T0* T1078s58(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[0]) {
		if (ac->thread_onces->reference_exception[0]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[0]);
		}
		return ac->thread_onces->reference_value[0];
	} else {
		ac->thread_onces->reference_status[0] = '\1';
		ac->thread_onces->reference_value[0] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[0] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T1360c5(ac);
	ac->thread_onces->reference_value[0] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* UC_UTF8_ROUTINES.code_byte_count */
T6 T168s28(TC* ac, T6 a1)
{
	T6 R = 0;
	T1 t1;
	T10 t2;
	t1 = (T6f15(ac, &a1, (T6)(GE_int32(1114111))));
	if (t1) {
		t2 = (T6f20(ac, &a1));
		R = (T168s16(ac, t2));
	} else {
		R = (T6)(GE_int32(1));
	}
	return R;
}

/* UC_UTF8_ROUTINES.natural_32_code_byte_count */
T6 T168s16(TC* ac, T10 a1)
{
	T6 R = 0;
	T1 t1;
	t1 = ((T1)((a1)<((T10)(GE_nat32(128)))));
	if (t1) {
		R = (T6)(GE_int32(1));
	} else {
		t1 = ((T1)((a1)<((T10)(GE_nat32(2048)))));
		if (t1) {
			R = (T6)(GE_int32(2));
		} else {
			t1 = ((T1)((a1)<((T10)(GE_nat32(55296)))));
			if (t1) {
				R = (T6)(GE_int32(3));
			} else {
				t1 = (T10f5(ac, &a1, (T10)(GE_nat32(57343))));
				if (t1) {
					R = (T6)(GE_int32(1));
				} else {
					t1 = ((T1)((a1)<((T10)(GE_nat32(65536)))));
					if (t1) {
						R = (T6)(GE_int32(3));
					} else {
						t1 = (T10f5(ac, &a1, (T10)(GE_nat32(1114111))));
						if (t1) {
							R = (T6)(GE_int32(4));
						} else {
							R = (T6)(GE_int32(1));
						}
					}
				}
			}
		}
	}
	return R;
}

/* UC_STRING.item_code_at_byte_index */
T6 T919f33(TC* ac, T0* C, T6 a1)
{
	T6 R = 0;
	T10 volatile t1;
	t1 = (T919f38(ac, C, a1));
	R = (T10f11(ac, &t1));
	return R;
}

/* UC_UTF8_STRING.item_code_at_byte_index */
T6 T1078f17(TC* ac, T0* C, T6 a1)
{
	T6 R = 0;
	T10 volatile t1;
	t1 = (T1078f43(ac, C, a1));
	R = (T10f11(ac, &t1));
	return R;
}

/* UC_UTF8_STRING.put_character_at_byte_index */
void T1078f102(TC* ac, T0* C, T2 a1, T6 a2, T6 a3)
{
	T2 l1 = 0;
	T6 l2 = 0;
	T0* t1;
	T6 t2;
	switch (a2) {
	case GE_int32(1):
		T1078f110(ac, C, a1, a3);
		break;
	case GE_int32(2):
		l2 = ((T6)(a1));
		t1 = (T1078s58(ac));
		t2 = ((T6)((l2)/((T6)(GE_int32(64)))));
		t2 = ((T6)((t2)+((T6)(GE_int32(192)))));
		l1 = (T1360s2(ac, t2));
		T1078f110(ac, C, l1, a3);
		t1 = (T1078s58(ac));
		t2 = ((T6)((l2)%((T6)(GE_int32(64)))));
		t2 = ((T6)((t2)+((T6)(GE_int32(128)))));
		l1 = (T1360s2(ac, t2));
		t2 = ((T6)((a3)+((T6)(GE_int32(1)))));
		T1078f110(ac, C, l1, t2);
		break;
	default:
		t2 = ((T6)(a1));
		T1078f109(ac, C, t2, a2, a3);
		break;
	}
}

/* UC_UTF8_ROUTINES.character_byte_count */
T6 T168s27(TC* ac, T2 a1)
{
	T6 R = 0;
	R = (T168s13(ac, a1));
	return R;
}

/* UC_UTF8_ROUTINES.character_8_byte_count */
T6 T168s13(TC* ac, T2 a1)
{
	T6 R = 0;
	T1 t1;
	t1 = (T2f10(ac, &a1, (T2)('\177')));
	if (t1) {
		R = (T6)(GE_int32(1));
	} else {
		R = (T6)(GE_int32(2));
	}
	return R;
}

/* UC_UTF8_STRING.put_byte */
void T1078f110(TC* ac, T0* C, T2 a1, T6 a2)
{
	T6 l1 = 0;
	l1 = ((T1078*)(C))->a1;
	T1078f74(ac, C, ((T1078*)(C))->a3);
	T1078f101(ac, C, a1, a2);
	T1078f74(ac, C, l1);
}

/* UC_UTF8_STRING.old_put */
void T1078f101(TC* ac, T0* C, T2 a1, T6 a2)
{
	T6 t1;
	t1 = ((T6)((a2)-((T6)(GE_int32(1)))));
	((T15*)(((T1078*)(C))->a2))->z2[t1] = (a1);
	T1078f98(ac, C);
}

/* UC_UTF8_STRING.reset_hash_codes */
void T1078f98(TC* ac, T0* C)
{
	((T1078*)(C))->a4 = (T6)(GE_int32(0));
	((T1078*)(C))->a7 = (T6)(GE_int32(0));
}

/* UC_STRING.item */
T2 T919f18(TC* ac, T0* C, T6 a1)
{
	T2 R = 0;
	T6 l1 = 0;
	T1 t1;
	t1 = (T1)((((T919*)(C))->a1) == (((T919*)(C))->a3));
	if (t1) {
		R = (T919f36(ac, C, a1));
	} else {
		l1 = (T919f37(ac, C, a1));
		R = (T919f43(ac, C, l1));
	}
	return R;
}

/* UC_STRING.character_item_at_byte_index */
T2 T919f43(TC* ac, T0* C, T6 a1)
{
	T2 R = 0;
	T2 l1 = 0;
	T6 volatile l2 = 0;
	T0* t1;
	T6 t2;
	T6 t3;
	T1 t4;
	l1 = (T919f36(ac, C, a1));
	t1 = (T919s35(ac));
	t2 = (T168s2(ac, l1));
	switch (t2) {
	case GE_int32(1):
		R = l1;
		break;
	case GE_int32(2):
		t1 = (T919s35(ac));
		l2 = (T168s25(ac, l1));
		t2 = ((T6)((a1)+((T6)(GE_int32(1)))));
		l1 = (T919f36(ac, C, t2));
		t2 = ((T6)((l2)*((T6)(GE_int32(64)))));
		t1 = (T919s35(ac));
		t3 = (T168s26(ac, l1));
		l2 = ((T6)((t2)+(t3)));
		t1 = (T919s41(ac));
		t2 = (T1062s2(ac));
		t4 = (T6f15(ac, (&l2), t2));
		if (t4) {
			t1 = (T919s57(ac));
			R = (T1360s2(ac, l2));
		} else {
			R = (T2)('\000');
		}
		break;
	default:
		l2 = (T919f33(ac, C, a1));
		t1 = (T919s41(ac));
		t2 = (T1062s2(ac));
		t4 = (T6f15(ac, (&l2), t2));
		if (t4) {
			t1 = (T919s57(ac));
			R = (T1360s2(ac, l2));
		} else {
			R = (T2)('\000');
		}
		break;
	}
	return R;
}

/* UC_STRING.integer_ */
T0* T919s57(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[0]) {
		if (ac->thread_onces->reference_exception[0]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[0]);
		}
		return ac->thread_onces->reference_value[0];
	} else {
		ac->thread_onces->reference_status[0] = '\1';
		ac->thread_onces->reference_value[0] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[0] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T1360c5(ac);
	ac->thread_onces->reference_value[0] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* KL_PLATFORM.maximum_character_code */
T6 T1062s2(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T6 R = 0;
	if (ac->thread_onces->integer_32_status[0]) {
		if (ac->thread_onces->integer_32_exception[0]) {
			GE_raise_once_exception(ac, ac->thread_onces->integer_32_exception[0]);
		}
		return ac->thread_onces->integer_32_value[0];
	} else {
		ac->thread_onces->integer_32_status[0] = '\1';
		ac->thread_onces->integer_32_value[0] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->integer_32_exception[0] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = (T6)(GE_int32(255));
	ac->thread_onces->integer_32_value[0] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* UC_STRING.platform */
T0* T919s41(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[8]) {
		if (ac->thread_onces->reference_exception[8]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[8]);
		}
		return ac->thread_onces->reference_value[8];
	} else {
		ac->thread_onces->reference_status[8] = '\1';
		ac->thread_onces->reference_value[8] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[8] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T1062c3(ac);
	ac->thread_onces->reference_value[8] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* KL_PLATFORM.default_create */
T0* T1062c3(TC* ac)
{
	T0* C;
	C = GE_new1062(ac, EIF_TRUE);
	return C;
}

/* UC_UTF8_ROUTINES.encoded_next_value */
T6 T168s26(TC* ac, T2 a1)
{
	T6 R = 0;
	T10 volatile t1;
	t1 = (T168s24(ac, a1));
	R = (T10f11(ac, &t1));
	return R;
}

/* UC_UTF8_ROUTINES.encoded_first_value */
T6 T168s25(TC* ac, T2 a1)
{
	T6 R = 0;
	T10 volatile t1;
	t1 = (T168s23(ac, a1));
	R = (T10f11(ac, &t1));
	return R;
}

/* STRING_8.item */
T2 T17f24(TC* ac, T0* C, T6 a1)
{
	T2 R = 0;
	T6 t1;
	t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
	R = (((T15*)(((T17*)(C))->a1))->z2[t1]);
	return R;
}

/* UC_UTF8_STRING.item */
T2 T1078f63(TC* ac, T0* C, T6 a1)
{
	T2 R = 0;
	T6 l1 = 0;
	T1 t1;
	t1 = (T1)((((T1078*)(C))->a1) == (((T1078*)(C))->a3));
	if (t1) {
		R = (T1078f16(ac, C, a1));
	} else {
		l1 = (T1078f14(ac, C, a1));
		R = (T1078f44(ac, C, l1));
	}
	return R;
}

/* UC_UTF8_STRING.character_item_at_byte_index */
T2 T1078f44(TC* ac, T0* C, T6 a1)
{
	T2 R = 0;
	T2 l1 = 0;
	T6 volatile l2 = 0;
	T0* t1;
	T6 t2;
	T6 t3;
	T1 t4;
	l1 = (T1078f16(ac, C, a1));
	t1 = (T1078s45(ac));
	t2 = (T168s2(ac, l1));
	switch (t2) {
	case GE_int32(1):
		R = l1;
		break;
	case GE_int32(2):
		t1 = (T1078s45(ac));
		l2 = (T168s25(ac, l1));
		t2 = ((T6)((a1)+((T6)(GE_int32(1)))));
		l1 = (T1078f16(ac, C, t2));
		t2 = ((T6)((l2)*((T6)(GE_int32(64)))));
		t1 = (T1078s45(ac));
		t3 = (T168s26(ac, l1));
		l2 = ((T6)((t2)+(t3)));
		t1 = (T1078s47(ac));
		t2 = (T1062s2(ac));
		t4 = (T6f15(ac, (&l2), t2));
		if (t4) {
			t1 = (T1078s58(ac));
			R = (T1360s2(ac, l2));
		} else {
			R = (T2)('\000');
		}
		break;
	default:
		l2 = (T1078f17(ac, C, a1));
		t1 = (T1078s47(ac));
		t2 = (T1062s2(ac));
		t4 = (T6f15(ac, (&l2), t2));
		if (t4) {
			t1 = (T1078s58(ac));
			R = (T1360s2(ac, l2));
		} else {
			R = (T2)('\000');
		}
		break;
	}
	return R;
}

/* UC_UTF8_STRING.platform */
T0* T1078s47(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[8]) {
		if (ac->thread_onces->reference_exception[8]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[8]);
		}
		return ac->thread_onces->reference_value[8];
	} else {
		ac->thread_onces->reference_status[8] = '\1';
		ac->thread_onces->reference_value[8] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[8] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T1062c3(ac);
	ac->thread_onces->reference_value[8] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* KL_ANY_ROUTINES.same_types */
T1 T1070s1(TC* ac, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T25x229380T0(ac, a1, a2));
	return R;
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].same_type */
T1 T2245f18(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	{
	R = (T1)(((T0*)(a1))->id == 2245);
	}
	return R;
}

/* LX_DFA_STATE.same_type */
T1 T2244f15(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	{
	R = (T1)(((T0*)(a1))->id == 2244);
	}
	return R;
}

/* DS_HASH_SET [INTEGER_32].same_type */
T1 T946f42(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	{
	R = (T1)(((T0*)(a1))->id == 946);
	}
	return R;
}

/* ET_INVARIANT_KEYWORD.same_type */
T1 T280f30(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	{
	R = EIF_FALSE;
	}
	return R;
}

/* UC_UTF8_STRING.same_type */
T1 T1078f23(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	{
	R = (T1)(((T0*)(a1))->id == 1078);
	}
	return R;
}

/* UC_STRING.same_type */
T1 T919f32(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	{
	R = (T1)(((T0*)(a1))->id == 919);
	}
	return R;
}

/* STRING_8.same_type */
T1 T17f18(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	{
	R = (T1)(((T0*)(a1))->id == 17);
	}
	return R;
}

/* STRING_32.same_type */
T1 T18f18(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	{
	R = EIF_FALSE;
	}
	return R;
}

/* KL_UNIX_FILE_SYSTEM.same_type */
T1 T152f33(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	{
	R = EIF_FALSE;
	}
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.same_type */
T1 T151f36(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	{
	R = (T1)(((T0*)(a1))->id == 151);
	}
	return R;
}

/* UC_UTF8_STRING.any_ */
T0* T1078s42(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[9]) {
		if (ac->thread_onces->reference_exception[9]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[9]);
		}
		return ac->thread_onces->reference_value[9];
	} else {
		ac->thread_onces->reference_status[9] = '\1';
		ac->thread_onces->reference_value[9] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[9] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T1070c2(ac);
	ac->thread_onces->reference_value[9] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* KL_ANY_ROUTINES.default_create */
T0* T1070c2(TC* ac)
{
	T0* C;
	C = GE_new1070(ac, EIF_TRUE);
	return C;
}

/* UC_UTF8_ROUTINES.substring_byte_count */
T6 T168s10(TC* ac, T0* a1, T6 a2, T6 a3)
{
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 volatile l3 = 0;
	T0* m1 = 0;
	T0* m2 = 0;
	T0* m3 = 0;
	T1 t1;
	T0* t2;
	T2 t3;
	T6 t4;
	T0* t5;
	T3 t6;
	t1 = (T6f15(ac, &a2, a3));
	if (t1) {
		t2 = (T168s11(ac));
		t1 = (T1070s1(ac, a1, ge498ov8159289));
		if (t1) {
			t1 = (a1?((m1 = a1, T168s10ot1(ac, a1))):EIF_FALSE);
		}
		if (t1) {
			l3 = a2;
			while (1) {
				t1 = (T6f4(ac, (&l3), a3));
				if (t1) {
					break;
				}
				t3 = (T17x2572289T6(ac, m1, l3));
				t4 = (T168s13(ac, t3));
				R = ((T6)((R)+(t4)));
				l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
			}
		} else {
			t2 = (T168s11(ac));
			t5 = (T168s14(ac));
			t1 = (T1070s1(ac, a1, t5));
			if (t1) {
				t1 = (a1?((m2 = a1, T168s10ot2(ac, a1))):EIF_FALSE);
			}
			if (t1) {
				t1 = (T1)((a2) == ((T6)(GE_int32(1))));
				if (t1) {
					t4 = (((((T0*)(m2))->id==919)?((T919*)(m2))->a1:((T1078*)(m2))->a1));
					t1 = (T1)((a3) == (t4));
				}
				if (t1) {
					R = (((((T0*)(m2))->id==919)?((T919*)(m2))->a3:((T1078*)(m2))->a3));
				} else {
					l1 = (((((T0*)(m2))->id==919)?T919f37(ac, m2, a2):T1078f14(ac, m2, a2)));
					t4 = (((((T0*)(m2))->id==919)?((T919*)(m2))->a1:((T1078*)(m2))->a1));
					t1 = (T1)((a3) == (t4));
					if (t1) {
						t4 = (((((T0*)(m2))->id==919)?((T919*)(m2))->a3:((T1078*)(m2))->a3));
						t4 = ((T6)((t4)-(l1)));
						R = ((T6)((t4)+((T6)(GE_int32(1)))));
					} else {
						t4 = ((T6)((a3)-(a2)));
						t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
						l2 = (((((T0*)(m2))->id==919)?T919f53(ac, m2, l1, t4):T1078f15(ac, m2, l1, t4)));
						R = ((T6)((l2)-(l1)));
					}
				}
			} else {
				t1 = (a1?((m3 = a1, T168s10ot3(ac, a1))):EIF_FALSE);
				if (t1) {
					t1 = (T1)((a2) == ((T6)(GE_int32(1))));
					if (t1) {
						t4 = (((T1078*)(m3))->a1);
						t1 = (T1)((a3) == (t4));
					}
					if (t1) {
						R = (((T1078*)(m3))->a3);
					} else {
						l1 = (T1078f14(ac, m3, a2));
						t4 = (((T1078*)(m3))->a1);
						t1 = (T1)((a3) == (t4));
						if (t1) {
							t4 = (((T1078*)(m3))->a3);
							t4 = ((T6)((t4)-(l1)));
							R = ((T6)((t4)+((T6)(GE_int32(1)))));
						} else {
							t4 = ((T6)((a3)-(a2)));
							t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
							l2 = (T1078f15(ac, m3, l1, t4));
							R = ((T6)((l2)-(l1)));
						}
					}
				} else {
					l3 = a2;
					while (1) {
						t1 = (T6f4(ac, (&l3), a3));
						if (t1) {
							break;
						}
						t6 = (T41x2228226T6(ac, a1, l3));
						t4 = (T168s15(ac, t6));
						R = ((T6)((R)+(t4)));
						l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
					}
				}
			}
		}
	}
	return R;
}

T1 T168s10ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 18:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

T1 T168s10ot2(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 919:
	case 1078:
		return EIF_TRUE;
	default:
		return EIF_FALSE;
	}
}

T1 T168s10ot3(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 1078:
		return EIF_TRUE;
	default:
		return EIF_FALSE;
	}
}

/* UC_UTF8_ROUTINES.character_32_byte_count */
T6 T168s15(TC* ac, T3 a1)
{
	T6 R = 0;
	T10 t1;
	t1 = ((T10)(a1));
	R = (T168s16(ac, t1));
	return R;
}

/* UC_UTF8_STRING.shifted_byte_index */
T6 T1078f15(TC* ac, T0* C, T6 a1, T6 a2)
{
	T6 volatile R = 0;
	T6 volatile l1 = 0;
	T1 t1;
	T0* t2;
	T2 t3;
	T6 t4;
	R = a1;
	l1 = (T6)(GE_int32(1));
	while (1) {
		t1 = (T6f4(ac, (&l1), a2));
		if (t1) {
			break;
		}
		t2 = (T1078s45(ac));
		t3 = (T1078f16(ac, C, R));
		t4 = (T168s2(ac, t3));
		R = ((T6)((R)+(t4)));
		t1 = (T6f4(ac, (&R), ((T1078*)(C))->a3));
		if (t1) {
			l1 = ((T6)((a2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* UC_STRING.shifted_byte_index */
T6 T919f53(TC* ac, T0* C, T6 a1, T6 a2)
{
	T6 volatile R = 0;
	T6 volatile l1 = 0;
	T1 t1;
	T0* t2;
	T2 t3;
	T6 t4;
	R = a1;
	l1 = (T6)(GE_int32(1));
	while (1) {
		t1 = (T6f4(ac, (&l1), a2));
		if (t1) {
			break;
		}
		t2 = (T919s35(ac));
		t3 = (T919f36(ac, C, R));
		t4 = (T168s2(ac, t3));
		R = ((T6)((R)+(t4)));
		t1 = (T6f4(ac, (&R), ((T919*)(C))->a3));
		if (t1) {
			l1 = ((T6)((a2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* UC_UTF8_ROUTINES.dummy_uc_string */
T0* T168s14(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[10]) {
		if (ac->thread_onces->reference_exception[10]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[10]);
		}
		return ac->thread_onces->reference_value[10];
	} else {
		ac->thread_onces->reference_status[10] = '\1';
		ac->thread_onces->reference_value[10] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[10] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T919c83(ac);
	ac->thread_onces->reference_value[10] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* UC_STRING.make_empty */
T0* T919c83(TC* ac)
{
	T0* C;
	C = GE_new919(ac, EIF_TRUE);
	T919f84(ac, C, (T6)(GE_int32(0)));
	return C;
}

/* UC_STRING.make */
void T919f84(TC* ac, T0* C, T6 a1)
{
	T1 t1;
	T6 t2;
	T919f103(ac, C);
	((T919*)(C))->a1 = (T6)(GE_int32(0));
	t1 = (T1)((a1) == ((T6)(GE_int32(0))));
	if (t1) {
		T919f84p1(ac, C, (T6)(GE_int32(1)));
	} else {
		T919f84p1(ac, C, a1);
	}
	t2 = (T919f59(ac, C));
	T919f90(ac, C, t2);
	t2 = (T919f59(ac, C));
	T919f87(ac, C, t2);
	T919f90(ac, C, (T6)(GE_int32(0)));
	((T919*)(C))->a3 = (T6)(GE_int32(0));
}

/* UC_STRING.make */
T0* T919c84(TC* ac, T6 a1)
{
	T0* C;
	T1 t1;
	T6 t2;
	C = GE_new919(ac, EIF_TRUE);
	T919f103(ac, C);
	((T919*)(C))->a1 = (T6)(GE_int32(0));
	t1 = (T1)((a1) == ((T6)(GE_int32(0))));
	if (t1) {
		T919f84p1(ac, C, (T6)(GE_int32(1)));
	} else {
		T919f84p1(ac, C, a1);
	}
	t2 = (T919f59(ac, C));
	T919f90(ac, C, t2);
	t2 = (T919f59(ac, C));
	T919f87(ac, C, t2);
	T919f90(ac, C, (T6)(GE_int32(0)));
	((T919*)(C))->a3 = (T6)(GE_int32(0));
	return C;
}

/* UC_STRING.old_set_count */
void T919f87(TC* ac, T0* C, T6 a1)
{
	((T919*)(C))->a1 = a1;
	T919f96(ac, C);
}

/* UC_STRING.reset_hash_codes */
void T919f96(TC* ac, T0* C)
{
	((T919*)(C))->a4 = (T6)(GE_int32(0));
	((T919*)(C))->a7 = (T6)(GE_int32(0));
}

/* UC_STRING.byte_capacity */
T6 T919f59(TC* ac, T0* C)
{
	T6 R = 0;
	R = (T919f59p1(ac, C));
	return R;
}

/* UC_STRING.capacity */
T6 T919f59p1(TC* ac, T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = (((T15*)(((T919*)(C))->a2))->a2);
	R = ((T6)((t1)-((T6)(GE_int32(1)))));
	return R;
}

/* UC_STRING.make */
void T919f84p1(TC* ac, T0* C, T6 a1)
{
	T6 t1;
	((T919*)(C))->a1 = (T6)(GE_int32(0));
	((T919*)(C))->a4 = (T6)(GE_int32(0));
	((T919*)(C))->a7 = (T6)(GE_int32(0));
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	((T919*)(C))->a2 = T15c12(ac, (T2)('\000'), t1);
}

/* UC_UTF8_ROUTINES.any_ */
T0* T168s11(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[9]) {
		if (ac->thread_onces->reference_exception[9]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[9]);
		}
		return ac->thread_onces->reference_value[9];
	} else {
		ac->thread_onces->reference_status[9] = '\1';
		ac->thread_onces->reference_value[9] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[9] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T1070c2(ac);
	ac->thread_onces->reference_value[9] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* UC_UTF8_STRING.cloned_string */
T0* T1078f33(TC* ac, T0* C)
{
	T0* R = 0;
	R = (T1078f25(ac, C));
	return R;
}

/* UC_UTF8_STRING.twin */
T0* T1078f25(TC* ac, T0* C)
{
	T0* R = 0;
	{
	R = GE_new1078(ac, EIF_TRUE);
	T1078f88(ac, R, C);
	}
	return R;
}

/* UC_UTF8_STRING.copy */
void T1078f88(TC* ac, T0* C, T0* a1)
{
	T6 l1 = 0;
	T1 t1;
	T6 t2;
	t1 = (T1)(a1!=C);
	if (t1) {
		l1 = (((T1078*)(a1))->a1);
		t2 = (((T1078*)(a1))->a3);
		T1078f74(ac, a1, t2);
		T1078f88p1(ac, C, a1);
		T1078f74(ac, C, l1);
		T1078f74(ac, a1, l1);
	}
}

/* UC_UTF8_STRING.copy */
void T1078f88p1(TC* ac, T0* C, T0* a1)
{
	T0* l1 = 0;
	T1 t1;
	T1 t2;
	T0* t3;
	T6 volatile t4;
	T6 t5;
	t1 = (T1)(a1!=C);
	if (t1) {
		l1 = ((T1078*)(C))->a2;
		memcpy(((char*)(C)) + offsetof(T1078, a1), ((char*)(a1)) + offsetof(T1078, a1), sizeof(T1078) - offsetof(T1078, a1));
		t2 = (T1)(l1==EIF_VOID);
		if (!(t2)) {
			t3 = (((T1078*)(a1))->a2);
			t1 = (T1)(l1==t3);
		} else {
			t1 = EIF_TRUE;
		}
		if (!(t1)) {
			t4 = (((T15*)(l1))->a2);
			t1 = (T6f15(ac, &t4, ((T1078*)(C))->a1));
		}
		if (t1) {
			t5 = ((T6)((((T1078*)(C))->a1)+((T6)(GE_int32(1)))));
			((T1078*)(C))->a2 = (T15f7(ac, ((T1078*)(C))->a2, t5));
		} else {
			T15f14(ac, l1, ((T1078*)(C))->a2, (T6)(GE_int32(0)), (T6)(GE_int32(0)), ((T1078*)(C))->a1);
			((T1078*)(C))->a2 = l1;
		}
		((T1078*)(C))->a4 = (T6)(GE_int32(0));
		((T1078*)(C))->a7 = (T6)(GE_int32(0));
	}
}

/* SPECIAL [CHARACTER_8].resized_area */
T0* T15f7(TC* ac, T0* C, T6 a1)
{
	T0* R = 0;
	T6 t1;
	R = T15c16(ac, a1);
	t1 = (T6f17(ac, &a1, ((T15*)(C))->a2));
	T15f14(ac, R, C, (T6)(GE_int32(0)), (T6)(GE_int32(0)), t1);
	return R;
}

/* UC_UTF8_STRING.make */
void T1078f85(TC* ac, T0* C, T6 a1)
{
	T1 t1;
	T6 t2;
	T1078f94(ac, C);
	((T1078*)(C))->a1 = (T6)(GE_int32(0));
	t1 = (T1)((a1) == ((T6)(GE_int32(0))));
	if (t1) {
		T1078f85p1(ac, C, (T6)(GE_int32(1)));
	} else {
		T1078f85p1(ac, C, a1);
	}
	t2 = (T1078f61(ac, C));
	T1078f74(ac, C, t2);
	t2 = (T1078f61(ac, C));
	T1078f89(ac, C, t2);
	T1078f74(ac, C, (T6)(GE_int32(0)));
	((T1078*)(C))->a3 = (T6)(GE_int32(0));
}

/* UC_UTF8_STRING.make */
T0* T1078c85(TC* ac, T6 a1)
{
	T0* C;
	T1 t1;
	T6 t2;
	C = GE_new1078(ac, EIF_TRUE);
	T1078f94(ac, C);
	((T1078*)(C))->a1 = (T6)(GE_int32(0));
	t1 = (T1)((a1) == ((T6)(GE_int32(0))));
	if (t1) {
		T1078f85p1(ac, C, (T6)(GE_int32(1)));
	} else {
		T1078f85p1(ac, C, a1);
	}
	t2 = (T1078f61(ac, C));
	T1078f74(ac, C, t2);
	t2 = (T1078f61(ac, C));
	T1078f89(ac, C, t2);
	T1078f74(ac, C, (T6)(GE_int32(0)));
	((T1078*)(C))->a3 = (T6)(GE_int32(0));
	return C;
}

/* UC_UTF8_STRING.old_set_count */
void T1078f89(TC* ac, T0* C, T6 a1)
{
	((T1078*)(C))->a1 = a1;
	T1078f98(ac, C);
}

/* UC_UTF8_STRING.byte_capacity */
T6 T1078f61(TC* ac, T0* C)
{
	T6 R = 0;
	R = (T1078f61p1(ac, C));
	return R;
}

/* UC_UTF8_STRING.capacity */
T6 T1078f61p1(TC* ac, T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = (((T15*)(((T1078*)(C))->a2))->a2);
	R = ((T6)((t1)-((T6)(GE_int32(1)))));
	return R;
}

/* UC_UTF8_STRING.make */
void T1078f85p1(TC* ac, T0* C, T6 a1)
{
	T6 t1;
	((T1078*)(C))->a1 = (T6)(GE_int32(0));
	((T1078*)(C))->a4 = (T6)(GE_int32(0));
	((T1078*)(C))->a7 = (T6)(GE_int32(0));
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	((T1078*)(C))->a2 = T15c12(ac, (T2)('\000'), t1);
}

/* STRING_32.substring */
T0* T18f13(TC* ac, T0* C, T6 a1, T6 a2)
{
	T0* R = 0;
	T1 t1;
	T6 volatile t2;
	T1 t3;
	T6 t4;
	T0* t5;
	T6 t6;
	t2 = (T6)(GE_int32(1));
	t3 = (T6f15(ac, &t2, a1));
	if (t3) {
		t1 = (T6f15(ac, &a1, a2));
	} else {
		t1 = EIF_FALSE;
	}
	if (t1) {
		t1 = (T6f15(ac, &a2, ((T18*)(C))->a2));
	}
	if (t1) {
		t4 = ((T6)((a2)-(a1)));
		t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
		R = (T18f19(ac, C, t4));
		t5 = (((T18*)(R))->a1);
		t4 = ((T6)((a1)-((T6)(GE_int32(1)))));
		t6 = ((T6)((a2)-(a1)));
		t6 = ((T6)((t6)+((T6)(GE_int32(1)))));
		T16f10(ac, t5, ((T18*)(C))->a1, t4, (T6)(GE_int32(0)), t6);
		t4 = ((T6)((a2)-(a1)));
		t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
		T18f28(ac, R, t4);
	} else {
		R = (T18f19(ac, C, (T6)(GE_int32(0))));
	}
	return R;
}

/* STRING_32.set_count */
void T18f28(TC* ac, T0* C, T6 a1)
{
	((T18*)(C))->a2 = a1;
	T18f32(ac, C);
}

/* STRING_32.reset_hash_codes */
void T18f32(TC* ac, T0* C)
{
	((T18*)(C))->a3 = (T6)(GE_int32(0));
	((T18*)(C))->a4 = (T6)(GE_int32(0));
}

/* SPECIAL [CHARACTER_32].copy_data */
void T16f10(TC* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T3 t2;
	t1 = (T1)(a1==C);
	if (t1) {
		T16f14(ac, C, a2, a3, a4);
	} else {
		l1 = a2;
		l2 = a3;
		l3 = ((T6)((a2)+(a4)));
		while (1) {
			t1 = (T1)((l1) == (l3));
			if (t1) {
				break;
			}
			t2 = (((T16*)(a1))->z2[l1]);
			T16f15(ac, C, t2, l2);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		}
	}
}

/* SPECIAL [CHARACTER_32].force */
void T16f15(TC* ac, T0* C, T3 a1, T6 a2)
{
	T1 t1;
	t1 = ((T1)((a2)<(((T16*)(C))->a2)));
	if (t1) {
		((T16*)(C))->z2[a2] = (a1);
	} else {
		T16f12(ac, C, a1);
	}
}

/* SPECIAL [CHARACTER_32].move_data */
void T16f14(TC* ac, T0* C, T6 a1, T6 a2, T6 a3)
{
	T1 t1;
	T6 t2;
	t1 = (T1)((a1) == (a2));
	if (t1) {
	} else {
		t1 = (T6f4(ac, &a1, a2));
		if (t1) {
			t2 = ((T6)((a2)+(a3)));
			t1 = ((T1)((t2)<(a1)));
			if (t1) {
				T16f16(ac, C, a1, a2, a3);
			} else {
				T16f17(ac, C, a1, a2, a3);
			}
		} else {
			t2 = ((T6)((a1)+(a3)));
			t1 = ((T1)((t2)<(a2)));
			if (t1) {
				T16f16(ac, C, a1, a2, a3);
			} else {
				T16f17(ac, C, a1, a2, a3);
			}
		}
	}
}

/* SPECIAL [CHARACTER_32].overlapping_move */
void T16f17(TC* ac, T0* C, T6 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T6 volatile t2;
	T3 t3;
	T6 t4;
	t1 = ((T1)((a1)<(a2)));
	if (t1) {
		t2 = ((T6)((a1)+(a3)));
		l1 = ((T6)((t2)-((T6)(GE_int32(1)))));
		l2 = ((T6)((a1)-((T6)(GE_int32(1)))));
		l3 = ((T6)((a2)-(a1)));
		t2 = ((T6)((a2)+(a3)));
		t1 = (T6f14(ac, &t2, ((T16*)(C))->a2));
		if (t1) {
			t3 = (((T16*)(C))->z2[a1]);
			t4 = ((T6)((a2)+(a3)));
			t4 = ((T6)((t4)-((T6)(GE_int32(1)))));
			T16f13(ac, C, t3, ((T16*)(C))->a2, t4);
		}
		while (1) {
			t1 = (T1)((l1) == (l2));
			if (t1) {
				break;
			}
			t3 = (((T16*)(C))->z2[l1]);
			t4 = ((T6)((l1)+(l3)));
			((T16*)(C))->z2[t4] = (t3);
			l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
		}
	} else {
		l1 = a1;
		l2 = ((T6)((a1)+(a3)));
		l3 = ((T6)((a1)-(a2)));
		while (1) {
			t1 = (T1)((l1) == (l2));
			if (t1) {
				break;
			}
			t3 = (((T16*)(C))->z2[l1]);
			t4 = ((T6)((l1)-(l3)));
			T16f15(ac, C, t3, t4);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
}

/* SPECIAL [CHARACTER_32].non_overlapping_move */
void T16f16(TC* ac, T0* C, T6 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T3 t2;
	T6 t3;
	l1 = a1;
	l2 = ((T6)((a1)+(a3)));
	l3 = ((T6)((a2)-(a1)));
	while (1) {
		t1 = (T1)((l1) == (l2));
		if (t1) {
			break;
		}
		t2 = (((T16*)(C))->z2[l1]);
		t3 = ((T6)((l1)+(l3)));
		T16f15(ac, C, t2, t3);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
}

/* STRING_32.new_string */
T0* T18f19(TC* ac, T0* C, T6 a1)
{
	T0* R = 0;
	R = T18c23(ac, a1);
	return R;
}

/* UC_STRING.substring */
T0* T919f16(TC* ac, T0* C, T6 a1, T6 a2)
{
	T0* R = 0;
	T1 t1;
	t1 = ((T1)((a2)<(a1)));
	if (t1) {
		R = T919c84(ac, (T6)(GE_int32(0)));
	} else {
		R = T919c89(ac, C, a1, a2);
	}
	return R;
}

/* UC_STRING.make_from_substring */
T0* T919c89(TC* ac, T0* a1, T6 a2, T6 a3)
{
	T0* C;
	C = GE_new919(ac, EIF_TRUE);
	T919f93(ac, C, a1, a2, a3);
	return C;
}

/* UC_STRING.make_from_substring_general */
void T919f93(TC* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* m1 = 0;
	T1 t1;
	T1 t2;
	T0* t3;
	T6 t4;
	t1 = (a1?((m1 = a1, T919f93ot1(ac, a1))):EIF_FALSE);
	if (t1) {
		l3 = m1;
		((T919*)(C))->a2 = (((((T0*)(l3))->id==919)?((T919*)(l3))->a2:((T1078*)(l3))->a2));
		t1 = (T1)(a1!=C);
		if (t1) {
			l3 = EIF_VOID;
		}
	}
	t2 = (T1)(l3!=EIF_VOID);
	if (t2) {
		t1 = (T1)((a2) == ((T6)(GE_int32(1))));
	} else {
		t1 = EIF_FALSE;
	}
	if (t1) {
		t1 = (T1)((a3) == (((T919*)(C))->a1));
	}
	if (t1) {
		((T919*)(C))->a2 = (((((T0*)(l3))->id==919)?((T919*)(l3))->a2:((T1078*)(l3))->a2));
	} else {
		t1 = ((T1)((a3)<(a2)));
		if (t1) {
			T919f84(ac, C, (T6)(GE_int32(0)));
		} else {
			t1 = (T1)(l3!=EIF_VOID);
			if (t1) {
				l2 = (((((T0*)(l3))->id==919)?T919f44(ac, l3):T1078f33(ac, l3)));
			} else {
				l2 = a1;
			}
			t3 = (T919s35(ac));
			l1 = (T168s10(ac, l2, a2, a3));
			T919f84(ac, C, l1);
			t4 = ((T6)((a3)-(a2)));
			t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
			T919f90(ac, C, t4);
			((T919*)(C))->a3 = l1;
			T919f98(ac, C, l2, a2, a3, l1, (T6)(GE_int32(1)));
		}
	}
}

T1 T919f93ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* UC_STRING.put_substring_at_byte_index */
void T919f98(TC* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4, T6 a5)
{
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T6 l6 = 0;
	T0* m1 = 0;
	T0* m2 = 0;
	T0* m3 = 0;
	T0* m4 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	T2 t4;
	T10 volatile t5;
	t1 = (T6f4(ac, &a4, (T6)(GE_int32(0))));
	if (t1) {
		t1 = (a1?((m1 = a1, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t2 = (T919s46(ac));
			t1 = (T1070s1(ac, a1, ge488ov7995457));
		}
		if (t1) {
			t3 = ((T6)((a3)-(a2)));
			l2 = ((T6)((t3)+((T6)(GE_int32(1)))));
			t1 = (T1)((l2) == (a4));
			if (t1) {
				l3 = a5;
				l1 = a2;
				while (1) {
					t1 = (T6f4(ac, (&l1), a3));
					if (t1) {
						break;
					}
					t4 = (T17x2572289T6(ac, m1, l1));
					T919f109(ac, C, t4, l3);
					l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				}
			} else {
				l3 = a5;
				l1 = a2;
				while (1) {
					t1 = (T6f4(ac, (&l1), a3));
					if (t1) {
						break;
					}
					l5 = (T17x2572289T6(ac, m1, l1));
					t2 = (T919s35(ac));
					l4 = (T168s27(ac, l5));
					T919f101(ac, C, l5, l4, l3);
					l3 = ((T6)((l3)+(l4)));
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				}
			}
		} else {
			t2 = (T919s46(ac));
			t1 = (T1070s1(ac, a1, C));
			if (t1) {
				t1 = (a1?((m2 = a1, T919f98ot1(ac, a1))):EIF_FALSE);
			}
			if (t1) {
				l3 = a5;
				l1 = (((((T0*)(m2))->id==919)?T919f37(ac, m2, a2):T1078f14(ac, m2, a2)));
				t3 = ((T6)((l1)+(a4)));
				l2 = ((T6)((t3)-((T6)(GE_int32(1)))));
				while (1) {
					t1 = (T6f4(ac, (&l1), l2));
					if (t1) {
						break;
					}
					t4 = (((((T0*)(m2))->id==919)?T919f36(ac, m2, l1):T1078f16(ac, m2, l1)));
					T919f109(ac, C, t4, l3);
					l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				}
			} else {
				t1 = (a1?((m3 = a1, T919f98ot2(ac, a1))):EIF_FALSE);
				if (t1) {
					l3 = a5;
					l1 = (T1078f14(ac, m3, a2));
					t3 = ((T6)((l1)+(a4)));
					l2 = ((T6)((t3)-((T6)(GE_int32(1)))));
					while (1) {
						t1 = (T6f4(ac, (&l1), l2));
						if (t1) {
							break;
						}
						t4 = (T1078f16(ac, m3, l1));
						T919f109(ac, C, t4, l3);
						l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					}
				} else {
					t1 = (a1?((m4 = a1, T919f98ot3(ac, a1))):EIF_FALSE);
					if (t1) {
						l3 = a5;
						l1 = (((((T0*)(m4))->id==919)?T919f37(ac, m4, a2):T1078f14(ac, m4, a2)));
						t3 = ((T6)((l1)+(a4)));
						l2 = ((T6)((t3)-((T6)(GE_int32(1)))));
						while (1) {
							t1 = (T6f4(ac, (&l1), l2));
							if (t1) {
								break;
							}
							l6 = (((((T0*)(m4))->id==919)?T919f33(ac, m4, l1):T1078f17(ac, m4, l1)));
							t2 = (T919s35(ac));
							l4 = (T168s28(ac, l6));
							T919f108(ac, C, l6, l4, l3);
							l3 = ((T6)((l3)+(l4)));
							l1 = (((((T0*)(m4))->id==919)?T919f34(ac, m4, l1):T1078f18(ac, m4, l1)));
						}
					} else {
						l3 = a5;
						l1 = a2;
						while (1) {
							t1 = (T6f4(ac, (&l1), a3));
							if (t1) {
								break;
							}
							t5 = (T41x2228225T6(ac, a1, l1));
							l6 = (T10f11(ac, &t5));
							t2 = (T919s35(ac));
							l4 = (T168s28(ac, l6));
							T919f108(ac, C, l6, l4, l3);
							l3 = ((T6)((l3)+(l4)));
							l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						}
					}
				}
			}
		}
	}
}

T1 T919f98ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

T1 T919f98ot2(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 1078:
		return EIF_TRUE;
	default:
		return EIF_FALSE;
	}
}

T1 T919f98ot3(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* UC_STRING.put_code_at_byte_index */
void T919f108(TC* ac, T0* C, T6 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T2 l2 = 0;
	T6 l3 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	l3 = a1;
	t1 = ((T6)((a3)+(a2)));
	l1 = ((T6)((t1)-((T6)(GE_int32(1)))));
	while (1) {
		t2 = (T1)((l1) == (a3));
		if (t2) {
			break;
		}
		t3 = (T919s57(ac));
		t1 = ((T6)((l3)%((T6)(GE_int32(64)))));
		t1 = ((T6)((t1)+((T6)(GE_int32(128)))));
		l2 = (T1360s2(ac, t1));
		T919f109(ac, C, l2, l1);
		l3 = ((T6)((l3)/((T6)(GE_int32(64)))));
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
	}
	switch (a2) {
	case GE_int32(1):
		t3 = (T919s57(ac));
		l2 = (T1360s2(ac, l3));
		break;
	case GE_int32(2):
		t3 = (T919s57(ac));
		t1 = ((T6)((l3)+((T6)(GE_int32(192)))));
		l2 = (T1360s2(ac, t1));
		break;
	case GE_int32(3):
		t3 = (T919s57(ac));
		t1 = ((T6)((l3)+((T6)(GE_int32(224)))));
		l2 = (T1360s2(ac, t1));
		break;
	case GE_int32(4):
		t3 = (T919s57(ac));
		t1 = ((T6)((l3)+((T6)(GE_int32(240)))));
		l2 = (T1360s2(ac, t1));
		break;
	case GE_int32(5):
		t3 = (T919s57(ac));
		t1 = ((T6)((l3)+((T6)(GE_int32(248)))));
		l2 = (T1360s2(ac, t1));
		break;
	case GE_int32(6):
		t3 = (T919s57(ac));
		t1 = ((T6)((l3)+((T6)(GE_int32(252)))));
		l2 = (T1360s2(ac, t1));
		break;
	default:
		GE_raise(GE_EX_WHEN);
		break;
	}
	T919f109(ac, C, l2, a3);
}

/* UC_STRING.put_character_at_byte_index */
void T919f101(TC* ac, T0* C, T2 a1, T6 a2, T6 a3)
{
	T2 l1 = 0;
	T6 l2 = 0;
	T0* t1;
	T6 t2;
	switch (a2) {
	case GE_int32(1):
		T919f109(ac, C, a1, a3);
		break;
	case GE_int32(2):
		l2 = ((T6)(a1));
		t1 = (T919s57(ac));
		t2 = ((T6)((l2)/((T6)(GE_int32(64)))));
		t2 = ((T6)((t2)+((T6)(GE_int32(192)))));
		l1 = (T1360s2(ac, t2));
		T919f109(ac, C, l1, a3);
		t1 = (T919s57(ac));
		t2 = ((T6)((l2)%((T6)(GE_int32(64)))));
		t2 = ((T6)((t2)+((T6)(GE_int32(128)))));
		l1 = (T1360s2(ac, t2));
		t2 = ((T6)((a3)+((T6)(GE_int32(1)))));
		T919f109(ac, C, l1, t2);
		break;
	default:
		t2 = ((T6)(a1));
		T919f108(ac, C, t2, a2, a3);
		break;
	}
}

/* UC_STRING.put_byte */
void T919f109(TC* ac, T0* C, T2 a1, T6 a2)
{
	T6 l1 = 0;
	l1 = ((T919*)(C))->a1;
	T919f90(ac, C, ((T919*)(C))->a3);
	T919f100(ac, C, a1, a2);
	T919f90(ac, C, l1);
}

/* UC_STRING.old_put */
void T919f100(TC* ac, T0* C, T2 a1, T6 a2)
{
	T6 t1;
	t1 = ((T6)((a2)-((T6)(GE_int32(1)))));
	((T15*)(((T919*)(C))->a2))->z2[t1] = (a1);
	T919f96(ac, C);
}

/* UC_STRING.any_ */
T0* T919s46(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[9]) {
		if (ac->thread_onces->reference_exception[9]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[9]);
		}
		return ac->thread_onces->reference_value[9];
	} else {
		ac->thread_onces->reference_status[9] = '\1';
		ac->thread_onces->reference_value[9] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[9] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T1070c2(ac);
	ac->thread_onces->reference_value[9] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* UC_STRING.cloned_string */
T0* T919f44(TC* ac, T0* C)
{
	T0* R = 0;
	R = (T919f55(ac, C));
	return R;
}

/* UC_STRING.twin */
T0* T919f55(TC* ac, T0* C)
{
	T0* R = 0;
	{
	R = GE_new919(ac, EIF_TRUE);
	T919f86(ac, R, C);
	}
	return R;
}

/* UC_STRING.copy */
void T919f86(TC* ac, T0* C, T0* a1)
{
	T6 l1 = 0;
	T1 t1;
	T6 t2;
	t1 = (T1)(a1!=C);
	if (t1) {
		l1 = (((T919*)(a1))->a1);
		t2 = (((T919*)(a1))->a3);
		T919f90(ac, a1, t2);
		T919f86p1(ac, C, a1);
		T919f90(ac, C, l1);
		T919f90(ac, a1, l1);
	}
}

/* UC_STRING.copy */
void T919f86p1(TC* ac, T0* C, T0* a1)
{
	T0* l1 = 0;
	T1 t1;
	T1 t2;
	T0* t3;
	T6 volatile t4;
	T6 t5;
	t1 = (T1)(a1!=C);
	if (t1) {
		l1 = ((T919*)(C))->a2;
		memcpy(((char*)(C)) + offsetof(T919, a1), ((char*)(a1)) + offsetof(T919, a1), sizeof(T919) - offsetof(T919, a1));
		t2 = (T1)(l1==EIF_VOID);
		if (!(t2)) {
			t3 = (((T919*)(a1))->a2);
			t1 = (T1)(l1==t3);
		} else {
			t1 = EIF_TRUE;
		}
		if (!(t1)) {
			t4 = (((T15*)(l1))->a2);
			t1 = (T6f15(ac, &t4, ((T919*)(C))->a1));
		}
		if (t1) {
			t5 = ((T6)((((T919*)(C))->a1)+((T6)(GE_int32(1)))));
			((T919*)(C))->a2 = (T15f7(ac, ((T919*)(C))->a2, t5));
		} else {
			T15f14(ac, l1, ((T919*)(C))->a2, (T6)(GE_int32(0)), (T6)(GE_int32(0)), ((T919*)(C))->a1);
			((T919*)(C))->a2 = l1;
		}
		((T919*)(C))->a4 = (T6)(GE_int32(0));
		((T919*)(C))->a7 = (T6)(GE_int32(0));
	}
}

/* STRING_8.substring */
T0* T17f12(TC* ac, T0* C, T6 a1, T6 a2)
{
	T0* R = 0;
	T1 t1;
	T6 volatile t2;
	T1 t3;
	T6 t4;
	T0* t5;
	T6 t6;
	t2 = (T6)(GE_int32(1));
	t3 = (T6f15(ac, &t2, a1));
	if (t3) {
		t1 = (T6f15(ac, &a1, a2));
	} else {
		t1 = EIF_FALSE;
	}
	if (t1) {
		t1 = (T6f15(ac, &a2, ((T17*)(C))->a2));
	}
	if (t1) {
		t4 = ((T6)((a2)-(a1)));
		t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
		R = (T17f6(ac, C, t4));
		t5 = (((T17*)(R))->a1);
		t4 = ((T6)((a1)-((T6)(GE_int32(1)))));
		t6 = ((T6)((a2)-(a1)));
		t6 = ((T6)((t6)+((T6)(GE_int32(1)))));
		T15f14(ac, t5, ((T17*)(C))->a1, t4, (T6)(GE_int32(0)), t6);
		t4 = ((T6)((a2)-(a1)));
		t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
		T17f67(ac, R, t4);
	} else {
		R = (T17f6(ac, C, (T6)(GE_int32(0))));
	}
	return R;
}

/* STRING_8.new_string */
T0* T17f6(TC* ac, T0* C, T6 a1)
{
	T0* R = 0;
	R = T17c49(ac, a1);
	return R;
}

/* UC_UTF8_STRING.character_32_item */
T3 T1078f9(TC* ac, T0* C, T6 a1)
{
	T3 R = 0;
	T10 t1;
	t1 = (T1078f48(ac, C, a1));
	R = ((T3)(t1));
	return R;
}

/* STRING_32.item */
T3 T18f10(TC* ac, T0* C, T6 a1)
{
	T3 R = 0;
	T6 t1;
	t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
	R = (((T16*)(((T18*)(C))->a1))->z2[t1]);
	return R;
}

/* UC_STRING.character_32_item */
T3 T919f27(TC* ac, T0* C, T6 a1)
{
	T3 R = 0;
	T10 t1;
	t1 = (T919f10(ac, C, a1));
	R = ((T3)(t1));
	return R;
}

/* STRING_8.character_32_item */
T3 T17f11(TC* ac, T0* C, T6 a1)
{
	T3 R = 0;
	T10 t1;
	t1 = (T17f10(ac, C, a1));
	R = ((T3)(t1));
	return R;
}

/* STRING_32.code */
T10 T18f7(TC* ac, T0* C, T6 a1)
{
	T10 R = 0;
	T6 volatile t1;
	T3 t2;
	t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
	t2 = (((T16*)(((T18*)(C))->a1))->z2[t1]);
	t1 = ((T6)(t2));
	R = (T6f20(ac, &t1));
	return R;
}

/* UTF_CONVERTER.utf_8_bytes_count */
T6 T40s12(TC* ac, T0* a1, T6 a2, T6 a3)
{
	T6 R = 0;
	T6 volatile l1 = 0;
	T10 volatile l2 = 0;
	T1 t1;
	l1 = a2;
	while (1) {
		t1 = (T6f4(ac, (&l1), a3));
		if (t1) {
			break;
		}
		l2 = (T41x2228225T6(ac, a1, l1));
		t1 = (T10f5(ac, (&l2), (T10)(GE_nat32(127))));
		if (t1) {
			R = ((T6)((R)+((T6)(GE_int32(1)))));
		} else {
			t1 = (T10f5(ac, (&l2), (T10)(GE_nat32(2047))));
			if (t1) {
				R = ((T6)((R)+((T6)(GE_int32(2)))));
			} else {
				t1 = (T10f5(ac, (&l2), (T10)(GE_nat32(65535))));
				if (t1) {
					R = ((T6)((R)+((T6)(GE_int32(3)))));
				} else {
					R = ((T6)((R)+((T6)(GE_int32(4)))));
				}
			}
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	return R;
}

/* INTEGER_32.do_nothing */
void T6s37(TC* ac)
{
}

/* FILE_INFO.wchar_length */
T6 T166s6(TC* ac)
{
	{
return sizeof(wchar_t);
	}
}

/* FILE_INFO.multi_byte_to_utf_16 */
T6 T166s14(TC* ac, T14 a1, T14 a2, T6 a3)
{
	{
			#ifdef EIF_WINDOWS
				return (EIF_INTEGER) MultiByteToWideChar(CP_ACP, 0, (LPSTR) (void*)a1, -1, (LPWSTR) (void*)a2, (int) a3) * sizeof(wchar_t);
			#else
				return a3;
			#endif
	}
}

/* FILE_INFO.default_pointer */
T14 T166s13(TC* ac)
{
	T14 R = 0;
	return R;
}

/* C_STRING.item */
T14 T31f4(TC* ac, T0* C)
{
	T14 R = 0;
	R = (((T162*)(((T31*)(C))->a1))->a1);
	return R;
}

/* C_STRING.make */
T0* T31c9(TC* ac, T0* a1)
{
	T0* C;
	T6 t1;
	C = GE_new31(ac, EIF_TRUE);
	t1 = (T41x2228263(ac, a1));
	T31f7(ac, C, t1);
	T31f11(ac, C, a1);
	return C;
}

/* C_STRING.make_empty */
void T31f7(TC* ac, T0* C, T6 a1)
{
	T6 t1;
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	((T31*)(C))->a1 = T162c10(ac, t1);
	((T31*)(C))->a2 = (T6)(GE_int32(0));
}

/* C_STRING.make_empty */
T0* T31c7(TC* ac, T6 a1)
{
	T0* C;
	T6 t1;
	C = GE_new31(ac, EIF_TRUE);
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	((T31*)(C))->a1 = T162c10(ac, t1);
	((T31*)(C))->a2 = (T6)(GE_int32(0));
	return C;
}

/* UTF_CONVERTER.escaped_utf_32_substring_into_utf_16_0_pointer */
void T40s17(TC* ac, T0* a1, T6 a2, T6 a3, T0* a4, T6 a5, T0* a6)
{
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T10 volatile l5 = 0;
	T0* l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T6 volatile t1;
	T6 t2;
	T1 t3;
	T3 t4;
	T10 volatile t5;
	T2 t6;
	T3 t7;
	T9 t8;
	T10 volatile t9;
	T10 t10;
	t1 = ((T6)((a3)-(a2)));
	l2 = ((T6)((t1)+((T6)(GE_int32(1)))));
	l4 = (((T162*)(a4))->a3);
	t1 = ((T6)((l4)-(a5)));
	t2 = ((T6)((l2)+((T6)(GE_int32(1)))));
	t2 = ((T6)((t2)*((T6)(GE_int32(2)))));
	t3 = ((T1)((t1)<(t2)));
	if (t3) {
		t1 = (T40s13(ac, a1, a2, a3));
		t1 = ((T6)((a5)+(t1)));
		l4 = ((T6)((t1)+((T6)(GE_int32(2)))));
		T162f11(ac, a4, l4);
		l8 = EIF_TRUE;
	}
	l1 = ((T6)((a2)-((T6)(GE_int32(1)))));
	l3 = a5;
	while (1) {
		t3 = (T6f14(ac, (&l1), a3));
		if (t3) {
			break;
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		l5 = (T41x2228225T6(ac, a1, l1));
		t4 = (T3)(GE_nat32(65533));
		t5 = ((T10)(t4));
		t3 = (T1)((l5) == (t5));
		if (t3) {
			t3 = ((T1)((l1)<(l2)));
			if (t3) {
				t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				t4 = (T41x2228226T6(ac, a1, t1));
				t3 = (T1)((t4) == ((T3)(GE_nat32(65533))));
				if (t3) {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				} else {
					t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					t4 = (T41x2228226T6(ac, a1, t1));
					t6 = (T2)('u');
					t7 = ((T3)(t6));
					t3 = (T1)((t4) == (t7));
					if (t3) {
						t1 = ((T6)((l1)+((T6)(GE_int32(4)))));
						t3 = ((T1)((t1)<(l2)));
						if (t3) {
							t1 = ((T6)((l1)+((T6)(GE_int32(2)))));
							t2 = ((T6)((l1)+((T6)(GE_int32(5)))));
							l6 = (T41x2228304T6T6(ac, a1, t1, t2));
							t3 = (T40s5(ac, l6));
							if (t3) {
								l5 = (T40s6(ac, l6));
								t3 = ((T1)((l5)<((T10)(GE_nat32(55296)))));
								if (!(t3)) {
									t3 = (T10f12(ac, (&l5), (T10)(GE_nat32(57343))));
								}
								if (t3) {
									t4 = (T3)(GE_nat32(65533));
									l5 = ((T10)(t4));
								} else {
									l7 = EIF_TRUE;
									l1 = ((T6)((l1)+((T6)(GE_int32(5)))));
								}
							}
						}
					}
				}
			}
		}
		t3 = ((T1)(!(l7)));
		if (t3) {
			t3 = (T10f5(ac, (&l5), (T10)(GE_nat32(65535))));
			if (t3) {
				t8 = (T10f24(ac, (&l5)));
				T162f18(ac, a4, t8, l3);
				l3 = ((T6)((l3)+((T6)(GE_int32(2)))));
			} else {
				t3 = ((T1)(!(l8)));
				if (t3) {
					t1 = ((T6)((l3)+((T6)(GE_int32(6)))));
					t2 = ((T6)((a3)-(l1)));
					t2 = ((T6)((t2)*((T6)(GE_int32(2)))));
					t1 = ((T6)((t1)+(t2)));
					t3 = (T6f4(ac, &t1, l4));
				}
				if (t3) {
					t2 = (T40s13(ac, a1, l1, a3));
					t2 = ((T6)((l3)+(t2)));
					l4 = ((T6)((t2)+((T6)(GE_int32(2)))));
					T162f11(ac, a4, l4);
					l8 = EIF_TRUE;
				}
				t5 = ((T10)((T6)(GE_int32(55232))));
				t9 = ((T10)((l5)>>((T6)(GE_int32(10)))));
				t5 = ((T10)((t5)+(t9)));
				t8 = (T10f24(ac, &t5));
				T162f18(ac, a4, t8, l3);
				t9 = ((T10)((T6)(GE_int32(56320))));
				t10 = ((T10)((l5)&((T10)(GE_nat32(1023)))));
				t9 = ((T10)((t9)+(t10)));
				t8 = (T10f24(ac, &t9));
				t2 = ((T6)((l3)+((T6)(GE_int32(2)))));
				T162f18(ac, a4, t8, t2);
				l3 = ((T6)((l3)+((T6)(GE_int32(4)))));
			}
		} else {
			l7 = EIF_FALSE;
			t8 = (T10f24(ac, (&l5)));
			T162f18(ac, a4, t8, l3);
			l3 = ((T6)((l3)+((T6)(GE_int32(2)))));
		}
	}
	if (l8) {
		t2 = ((T6)((l3)+((T6)(GE_int32(2)))));
		T162f11(ac, a4, t2);
	}
	T162f18(ac, a4, (T9)(GE_nat16(0)), l3);
	t3 = (T1)(a6!=EIF_VOID);
	if (t3) {
		T1067f2(ac, a6, l3);
	}
}

/* MANAGED_POINTER.put_natural_16 */
void T162f18(TC* ac, T0* C, T9 a1, T6 a2)
{
	T14 volatile t1;
	T1567 t2;
	T14 t3;
	t1 = ((T14)(((char*)(((T162*)(C))->a1))+(a2)));
	(t2).a1 = ((T14)&a1);
	t3 = ((t2).a1);
	T14f19(ac, &t1, t3, (T6)(GE_int32(2)));
}

/* NATURAL_32.to_natural_16 */
T9 T10f24(TC* ac, T10 volatile* C)
{
	T9 R = 0;
	R = ((T9)(*C));
	return R;
}

/* NATURAL_32.is_greater */
T1 T10f12(TC* ac, T10 volatile* C, T10 a1)
{
	T1 R = 0;
	R = ((T1)((a1)<(*C)));
	return R;
}

/* UTF_CONVERTER.utf_16_bytes_count */
T6 T40s13(TC* ac, T0* a1, T6 a2, T6 a3)
{
	T6 R = 0;
	T6 volatile l1 = 0;
	T10 volatile l2 = 0;
	T1 t1;
	l1 = a2;
	while (1) {
		t1 = (T6f4(ac, (&l1), a3));
		if (t1) {
			break;
		}
		l2 = (T41x2228225T6(ac, a1, l1));
		t1 = (T10f5(ac, (&l2), (T10)(GE_nat32(65535))));
		if (t1) {
			R = ((T6)((R)+((T6)(GE_int32(2)))));
		} else {
			R = ((T6)((R)+((T6)(GE_int32(4)))));
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	return R;
}

/* MANAGED_POINTER.make */
T0* T162c10(TC* ac, T6 a1)
{
	T0* C;
	T6 t1;
	T14 t2;
	T1 t3;
	T0* t4;
	C = GE_new162(ac, EIF_TRUE);
	T162f12(ac, C);
	t1 = (T6f16(ac, &a1, (T6)(GE_int32(1))));
	((T162*)(C))->a1 = (T14s5(ac, t1, (T6)(GE_int32(1))));
	t2 = (T162s4(ac));
	t3 = (T1)((((T162*)(C))->a1) == (t2));
	if (t3) {
		t4 = (T37c3(ac));
		T37s4(ac, GE_ms8("No more memory", 14));
	}
	((T162*)(C))->a3 = a1;
	((T162*)(C))->a2 = EIF_FALSE;
	return C;
}

/* EXCEPTIONS.raise */
void T37s4(TC* ac, T0* a1)
{
	T0* l1 = 0;
	l1 = T148c12(ac);
	T148f15(ac, l1, a1);
	T148f18(ac, l1);
}

/* DEVELOPER_EXCEPTION.raise */
void T148f18(TC* ac, T0* C)
{
	T0* t1;
	t1 = (T148s8(ac));
	T21s19(ac, C);
}

/* ISE_EXCEPTION_MANAGER.raise */
void T21s19(TC* ac, T0* a1)
{
	T14 l1 = 0;
	T14 l2 = 0;
	T0* m1 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	t1 = (T148f9(ac, a1));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t1 = (T21s8(ac));
		if (t1) {
			t2 = (T21s1(ac));
			T148f13(ac, a1, t2);
		}
		T21s17(ac, a1);
		l1 = (T21s9(ac));
		t2 = (((T148*)(a1))->a3);
		t1 = (t2?((m1 = t2, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			l2 = (T31f4(ac, m1));
		} else {
			l2 = (T21s9(ac));
		}
		t3 = (T148f10(ac, a1));
		GE_developer_raise((t3), (l1), (l2));
	}
}

/* DEVELOPER_EXCEPTION.code */
T6 T148f10(TC* ac, T0* C)
{
	T6 R = 0;
	R = (T6)(GE_int32(24));
	return R;
}

/* ISE_EXCEPTION_MANAGER.default_pointer */
T14 T21s9(TC* ac)
{
	T14 R = 0;
	return R;
}

/* ISE_EXCEPTION_MANAGER.set_last_exception */
void T21s17(TC* ac, T0* a1)
{
	T0* t1;
	t1 = (T21s2(ac));
	T27f2(ac, t1, a1);
}

/* CELL [detachable EXCEPTION].put */
void T27f2(TC* ac, T0* C, T0* a1)
{
	((T27*)(C))->a1 = a1;
}

/* CELL [detachable EXCEPTION].put */
T0* T27c2(TC* ac, T0* a1)
{
	T0* C;
	C = GE_new27(ac, EIF_TRUE);
	((T27*)(C))->a1 = a1;
	return C;
}

/* ISE_EXCEPTION_MANAGER.last_exception_cell */
T0* T21s2(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[11]) {
		if (ac->thread_onces->reference_exception[11]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[11]);
		}
		return ac->thread_onces->reference_value[11];
	} else {
		ac->thread_onces->reference_status[11] = '\1';
		ac->thread_onces->reference_value[11] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[11] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T27c2(ac, EIF_VOID);
	ac->thread_onces->reference_value[11] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* DEVELOPER_EXCEPTION.set_throwing_exception */
void T148f13(TC* ac, T0* C, T0* a1)
{
	((T148*)(C))->a1 = a1;
}

/* ISE_EXCEPTION_MANAGER.in_rescue */
T1 T21s8(TC* ac)
{
	T1 R = 0;
	{
	R = EIF_TEST(eif_is_in_rescue());
	}
	return R;
}

/* DEVELOPER_EXCEPTION.is_ignored */
T1 T148f9(TC* ac, T0* C)
{
	T1 R = 0;
	T0* t1;
	T0* t2;
	t1 = (T148s8(ac));
	t2 = ((T0*)&(GE_types[148][0]));
	R = (T21s13(ac, t2));
	return R;
}

/* ISE_EXCEPTION_MANAGER.is_ignored */
T1 T21s13(TC* ac, T0* a1)
{
	T1 R = 0;
	T0* t1;
	T6 t2;
	t1 = (T21s3(ac));
	t2 = (((EIF_TYPE_OBJ*)(a1))->type_id);
	R = (T28f34(ac, t1, t2));
	return R;
}

/* HASH_TABLE [INTEGER_32, INTEGER_32].has */
T1 T28f34(TC* ac, T0* C, T6 a1)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 volatile l4 = 0;
	T6 l5 = 0;
	T6 l6 = 0;
	T6 l7 = 0;
	T6 l8 = 0;
	T0* l9 = 0;
	T0* l10 = 0;
	T0* l11 = 0;
	T6 l12 = 0;
	T1 t1;
	T6 t2;
	T6 t3;
	l7 = (T6)(GE_int32(-1));
	t1 = (T1)((a1) == (l1));
	if (!(t1)) {
		t1 = EIF_FALSE;
	}
	if (t1) {
		if (((T28*)(C))->a11) {
			R = EIF_TRUE;
		}
	} else {
		l9 = ((T28*)(C))->a3;
		l10 = ((T28*)(C))->a5;
		l11 = ((T28*)(C))->a4;
		l6 = ((T28*)(C))->a1;
		l8 = l6;
		l2 = (T28f25(ac, C, a1));
		t2 = (T6)(GE_int32(1));
		t3 = ((T6)((l6)-((T6)(GE_int32(1)))));
		t3 = ((T6)((l2)%(t3)));
		l3 = ((T6)((t2)+(t3)));
		t2 = ((T6)((l2)%(l6)));
		l5 = ((T6)((t2)-(l3)));
		while (1) {
			t1 = (T1)((l8) == ((T6)(GE_int32(0))));
			if (t1) {
				break;
			}
			t2 = ((T6)((l5)+(l3)));
			l5 = ((T6)((t2)%(l6)));
			l4 = (((T154*)(l10))->z2[l5]);
			t1 = (T6f14(ac, (&l4), (T6)(GE_int32(0))));
			if (t1) {
				l12 = (((T154*)(l9))->z2[l4]);
				t1 = (T28f26(ac, C, l12, a1));
				if (t1) {
					l8 = (T6)(GE_int32(1));
					R = EIF_TRUE;
				}
			} else {
				t1 = (T1)((l4) == ((T6)(GE_int32(-1))));
				if (t1) {
					l8 = (T6)(GE_int32(1));
				} else {
					t1 = (T1)((l7) == ((T6)(GE_int32(-1))));
					if (t1) {
						t2 = ((T6)(-(l4)));
						l4 = ((T6)((t2)+((T6)(GE_int32(-2)))));
						t1 = (((T155*)(l11))->z2[l4]);
						t1 = ((T1)(!(t1)));
						if (t1) {
							l8 = (T6)(GE_int32(1));
						} else {
							l7 = l5;
						}
					}
				}
			}
			l8 = ((T6)((l8)-((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* HASH_TABLE [INTEGER_32, INTEGER_32].same_keys */
T1 T28f26(TC* ac, T0* C, T6 a1, T6 a2)
{
	T1 R = 0;
	R = (T1)((a1) == (a2));
	return R;
}

/* HASH_TABLE [INTEGER_32, INTEGER_32].hash_code_of */
T6 T28f25(TC* ac, T0* C, T6 a1)
{
	T6 R = 0;
	R = (T6f27(ac, &a1));
	return R;
}

/* INTEGER_32.hash_code */
T6 T6f27(TC* ac, T6 volatile* C)
{
	T6 R = 0;
	R = ((T6)((*C)&((T6)(GE_int32(2147483647)))));
	return R;
}

/* ISE_EXCEPTION_MANAGER.ignored_exceptions */
T0* T21s3(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[12]) {
		if (ac->thread_onces->reference_exception[12]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[12]);
		}
		return ac->thread_onces->reference_value[12];
	} else {
		ac->thread_onces->reference_status[12] = '\1';
		ac->thread_onces->reference_value[12] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[12] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T28c35(ac, (T6)(GE_int32(0)));
	ac->thread_onces->reference_value[12] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* HASH_TABLE [INTEGER_32, INTEGER_32].make */
T0* T28c35(TC* ac, T6 a1)
{
	T0* C;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T6 t1;
	C = GE_new28(ac, EIF_TRUE);
	l1 = T153c5(ac);
	l4 = (T6f16(ac, &a1, (T6)(GE_int32(2))));
	t1 = ((T6)((l4)/((T6)(GE_int32(2)))));
	t1 = ((T6)((l4)+(t1)));
	l4 = ((T6)((t1)+((T6)(GE_int32(1)))));
	l4 = (T153s1(ac, l4));
	((T28*)(C))->a1 = l4;
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	((T28*)(C))->a2 = T154c8(ac, t1);
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	((T28*)(C))->a3 = T154c8(ac, t1);
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	((T28*)(C))->a4 = T155c5(ac, EIF_FALSE, t1);
	t1 = ((T6)((l4)+((T6)(GE_int32(1)))));
	((T28*)(C))->a5 = T154c9(ac, (T6)(GE_int32(-1)), t1);
	((T28*)(C))->a6 = ((T6)((a1)+((T6)(GE_int32(1)))));
	((T28*)(C))->a7 = (T6)(GE_int32(0));
	((T28*)(C))->a8 = (T6)(GE_int32(-1));
	((T28*)(C))->a9 = (T6)(GE_int32(0));
	((T28*)(C))->a10 = l2;
	((T28*)(C))->a11 = EIF_FALSE;
	((T28*)(C))->a12 = (T6)(GE_int32(0));
	((T28*)(C))->a13 = (T6)(GE_int32(2147483645));
	((T28*)(C))->a14 = l2;
	((T28*)(C))->a15 = l3;
	return C;
}

/* SPECIAL [INTEGER_32].make_filled */
T0* T154c9(TC* ac, T6 a1, T6 a2)
{
	T0* C;
	T6 t1;
	C = GE_new154(ac, a2, EIF_TRUE);
	T154f8(ac, C, a2);
	t1 = ((T6)((a2)-((T6)(GE_int32(1)))));
	T154f12(ac, C, a1, (T6)(GE_int32(0)), t1);
	return C;
}

/* SPECIAL [INTEGER_32].fill_with */
void T154f12(TC* ac, T0* C, T6 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 t1;
	T1 t2;
	l1 = a2;
	t1 = ((T6)((a3)+((T6)(GE_int32(1)))));
	l3 = (T6f17(ac, &(((T154*)(C))->a2), t1));
	l2 = l3;
	while (1) {
		t2 = (T1)((l1) == (l2));
		if (t2) {
			break;
		}
		((T154*)(C))->z2[l1] = (a1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	l1 = l3;
	l2 = ((T6)((a3)+((T6)(GE_int32(1)))));
	while (1) {
		t2 = (T1)((l1) == (l2));
		if (t2) {
			break;
		}
		T154f13(ac, C, a1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
}

/* SPECIAL [INTEGER_32].extend */
void T154f13(TC* ac, T0* C, T6 a1)
{
	T6 t1;
	{
	t1 = ((T154*)(C))->a2;
	((T154*)(C))->a2 = t1 + 1 ;
	((T154*)(C))->z2[t1] = a1;
	}
}

/* SPECIAL [BOOLEAN].make_filled */
T0* T155c5(TC* ac, T1 a1, T6 a2)
{
	T0* C;
	T6 t1;
	C = GE_new155(ac, a2, EIF_TRUE);
	T155f7(ac, C, a2);
	t1 = ((T6)((a2)-((T6)(GE_int32(1)))));
	T155f8(ac, C, a1, (T6)(GE_int32(0)), t1);
	return C;
}

/* SPECIAL [BOOLEAN].fill_with */
void T155f8(TC* ac, T0* C, T1 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 t1;
	T1 t2;
	l1 = a2;
	t1 = ((T6)((a3)+((T6)(GE_int32(1)))));
	l3 = (T6f17(ac, &(((T155*)(C))->a2), t1));
	l2 = l3;
	while (1) {
		t2 = (T1)((l1) == (l2));
		if (t2) {
			break;
		}
		((T155*)(C))->z2[l1] = (a1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	l1 = l3;
	l2 = ((T6)((a3)+((T6)(GE_int32(1)))));
	while (1) {
		t2 = (T1)((l1) == (l2));
		if (t2) {
			break;
		}
		T155f10(ac, C, a1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
}

/* SPECIAL [BOOLEAN].extend */
void T155f10(TC* ac, T0* C, T1 a1)
{
	T6 t1;
	{
	t1 = ((T155*)(C))->a2;
	((T155*)(C))->a2 = t1 + 1 ;
	((T155*)(C))->z2[t1] = a1;
	}
}

/* SPECIAL [BOOLEAN].make_empty */
void T155f7(TC* ac, T0* C, T6 a1)
{
	{
	}
}

/* SPECIAL [BOOLEAN].make_empty */
T0* T155c7(TC* ac, T6 a1)
{
	T0* C;
	C = GE_new155(ac, a1, EIF_TRUE);
	{
	}
	return C;
}

/* SPECIAL [INTEGER_32].make_empty */
void T154f8(TC* ac, T0* C, T6 a1)
{
	{
	}
}

/* SPECIAL [INTEGER_32].make_empty */
T0* T154c8(TC* ac, T6 a1)
{
	T0* C;
	C = GE_new154(ac, a1, EIF_TRUE);
	{
	}
	return C;
}

/* PRIMES.higher_prime */
T6 T153s1(TC* ac, T6 a1)
{
	T6 R = 0;
	T1 t1;
	T6 t2;
	t1 = (T6f15(ac, &a1, (T6)(GE_int32(2))));
	if (t1) {
		R = (T6)(GE_int32(2));
	} else {
		t2 = ((T6)((a1)%((T6)(GE_int32(2)))));
		t1 = (T1)((t2) == ((T6)(GE_int32(0))));
		if (t1) {
			R = ((T6)((a1)+((T6)(GE_int32(1)))));
		} else {
			R = a1;
		}
		while (1) {
			t1 = (T153s3(ac, R));
			if (t1) {
				break;
			}
			R = ((T6)((R)+((T6)(GE_int32(2)))));
		}
	}
	return R;
}

/* PRIMES.is_prime */
T1 T153s3(TC* ac, T6 a1)
{
	T1 R = 0;
	T6 l1 = 0;
	T1 t1;
	T6 volatile t2;
	T6 volatile t3;
	t1 = (T6f15(ac, &a1, (T6)(GE_int32(1))));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = (T1)((a1) == ((T6)(GE_int32(2))));
		if (t1) {
			R = EIF_TRUE;
		} else {
			t2 = ((T6)((a1)%((T6)(GE_int32(2)))));
			t1 = (T1)(!(T1)((t2) == ((T6)(GE_int32(0)))));
			if (t1) {
				l1 = (T6)(GE_int32(3));
				while (1) {
					t2 = ((T6)((a1)%(l1)));
					t1 = (T1)((t2) == ((T6)(GE_int32(0))));
					if (!(t1)) {
						t2 = ((T6)((l1)*(l1)));
						t1 = (T6f14(ac, &t2, a1));
					}
					if (t1) {
						break;
					}
					l1 = ((T6)((l1)+((T6)(GE_int32(2)))));
				}
				t3 = ((T6)((l1)*(l1)));
				t1 = (T6f4(ac, &t3, a1));
				if (t1) {
					R = EIF_TRUE;
				}
			}
		}
	}
	return R;
}

/* PRIMES.default_create */
T0* T153c5(TC* ac)
{
	T0* C;
	C = GE_new153(ac, EIF_TRUE);
	return C;
}

/* DEVELOPER_EXCEPTION.exception_manager */
T0* T148s8(TC* ac)
{
	T0* R = 0;
	{
	R = ac->exception_manager;
	}
	return R;
}

/* DEVELOPER_EXCEPTION.set_description */
void T148f15(TC* ac, T0* C, T0* a1)
{
	T40 l1 = GE_default40;
	T0* l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = (T1)(a1!=EIF_VOID);
	if (t1) {
		t2 = (((T17*)(a1))->a2);
		l3 = T31c7(ac, t2);
		l2 = T1067c2(ac, (T6)(GE_int32(0)));
		t3 = (((T31*)(l3))->a1);
		T40s16(ac, a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T1067*)(l2))->a1);
		T31f8(ac, l3, t2);
		((T148*)(C))->a3 = l3;
	} else {
		((T148*)(C))->a3 = EIF_VOID;
	}
}

/* C_STRING.set_count */
void T31f8(TC* ac, T0* C, T6 a1)
{
	T6 l1 = 0;
	T6 t1;
	T1 t2;
	l1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	t1 = (((T162*)(((T31*)(C))->a1))->a3);
	t2 = ((T1)((t1)<(l1)));
	if (t2) {
		T162f11(ac, ((T31*)(C))->a1, l1);
	}
	((T31*)(C))->a2 = a1;
}

/* UTF_CONVERTER.utf_32_string_into_utf_8_0_pointer */
void T40s16(TC* ac, T0* a1, T0* a2, T6 a3, T0* a4)
{
	T6 l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T10 volatile l5 = 0;
	T1 l6 = 0;
	T6 volatile t1;
	T6 t2;
	T1 t3;
	T8 t4;
	T10 volatile t5;
	T10 volatile t6;
	T10 volatile t7;
	T10 volatile t8;
	T10 volatile t9;
	T10 volatile t10;
	T10 volatile t11;
	T10 volatile t12;
	T10 volatile t13;
	l3 = (((T17*)(a1))->a2);
	l4 = (((T162*)(a2))->a3);
	t1 = ((T6)((l4)-(a3)));
	t2 = ((T6)((l3)+((T6)(GE_int32(1)))));
	t3 = ((T1)((t1)<(t2)));
	if (t3) {
		t1 = (T40s12(ac, a1, (T6)(GE_int32(1)), l3));
		t1 = ((T6)((a3)+(t1)));
		l4 = ((T6)((t1)+((T6)(GE_int32(1)))));
		T162f11(ac, a2, l4);
		l6 = EIF_TRUE;
	}
	l2 = (T6)(GE_int32(0));
	l1 = a3;
	while (1) {
		t3 = (T6f14(ac, (&l2), l3));
		if (t3) {
			break;
		}
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		l5 = (T17f10(ac, a1, l2));
		t3 = (T10f5(ac, (&l5), (T10)(GE_nat32(127))));
		if (t3) {
			t4 = (T10f23(ac, (&l5)));
			T162f16(ac, a2, t4, l1);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		} else {
			t3 = ((T1)(!(l6)));
			if (t3) {
				t1 = ((T6)((l1)+((T6)(GE_int32(5)))));
				t2 = ((T6)((l3)-(l2)));
				t1 = ((T6)((t1)+(t2)));
				t3 = (T6f4(ac, &t1, l4));
			}
			if (t3) {
				t2 = (T40s12(ac, a1, l2, l3));
				t2 = ((T6)((l1)+(t2)));
				l4 = ((T6)((t2)+((T6)(GE_int32(1)))));
				T162f11(ac, a2, l4);
				l6 = EIF_TRUE;
			}
			t3 = (T10f5(ac, (&l5), (T10)(GE_nat32(2047))));
			if (t3) {
				t5 = ((T10)((l5)>>((T6)(GE_int32(6)))));
				t5 = ((T10)((t5)|((T10)(GE_nat32(192)))));
				t4 = (T10f23(ac, &t5));
				T162f16(ac, a2, t4, l1);
				t6 = ((T10)((l5)&((T10)(GE_nat32(63)))));
				t6 = ((T10)((t6)|((T10)(GE_nat32(128)))));
				t4 = (T10f23(ac, &t6));
				t2 = ((T6)((l1)+((T6)(GE_int32(1)))));
				T162f16(ac, a2, t4, t2);
				l1 = ((T6)((l1)+((T6)(GE_int32(2)))));
			} else {
				t3 = (T10f5(ac, (&l5), (T10)(GE_nat32(65535))));
				if (t3) {
					t7 = ((T10)((l5)>>((T6)(GE_int32(12)))));
					t7 = ((T10)((t7)|((T10)(GE_nat32(224)))));
					t4 = (T10f23(ac, &t7));
					T162f16(ac, a2, t4, l1);
					t8 = ((T10)((l5)>>((T6)(GE_int32(6)))));
					t8 = ((T10)((t8)&((T10)(GE_nat32(63)))));
					t8 = ((T10)((t8)|((T10)(GE_nat32(128)))));
					t4 = (T10f23(ac, &t8));
					t2 = ((T6)((l1)+((T6)(GE_int32(1)))));
					T162f16(ac, a2, t4, t2);
					t9 = ((T10)((l5)&((T10)(GE_nat32(63)))));
					t9 = ((T10)((t9)|((T10)(GE_nat32(128)))));
					t4 = (T10f23(ac, &t9));
					t2 = ((T6)((l1)+((T6)(GE_int32(2)))));
					T162f16(ac, a2, t4, t2);
					l1 = ((T6)((l1)+((T6)(GE_int32(3)))));
				} else {
					t10 = ((T10)((l5)>>((T6)(GE_int32(18)))));
					t10 = ((T10)((t10)|((T10)(GE_nat32(240)))));
					t4 = (T10f23(ac, &t10));
					T162f16(ac, a2, t4, l1);
					t11 = ((T10)((l5)>>((T6)(GE_int32(12)))));
					t11 = ((T10)((t11)&((T10)(GE_nat32(63)))));
					t11 = ((T10)((t11)|((T10)(GE_nat32(128)))));
					t4 = (T10f23(ac, &t11));
					t2 = ((T6)((l1)+((T6)(GE_int32(1)))));
					T162f16(ac, a2, t4, t2);
					t12 = ((T10)((l5)>>((T6)(GE_int32(6)))));
					t12 = ((T10)((t12)&((T10)(GE_nat32(63)))));
					t12 = ((T10)((t12)|((T10)(GE_nat32(128)))));
					t4 = (T10f23(ac, &t12));
					t2 = ((T6)((l1)+((T6)(GE_int32(2)))));
					T162f16(ac, a2, t4, t2);
					t13 = ((T10)((l5)&((T10)(GE_nat32(63)))));
					t13 = ((T10)((t13)|((T10)(GE_nat32(128)))));
					t4 = (T10f23(ac, &t13));
					t2 = ((T6)((l1)+((T6)(GE_int32(3)))));
					T162f16(ac, a2, t4, t2);
					l1 = ((T6)((l1)+((T6)(GE_int32(4)))));
				}
			}
		}
	}
	if (l6) {
		t2 = ((T6)((l1)+((T6)(GE_int32(1)))));
		T162f11(ac, a2, t2);
	}
	T162f16(ac, a2, (T8)(GE_nat8(0)), l1);
	t3 = (T1)(a4!=EIF_VOID);
	if (t3) {
		T1067f2(ac, a4, l1);
	}
}

/* DEVELOPER_EXCEPTION.default_create */
T0* T148c12(TC* ac)
{
	T0* C;
	C = GE_new148(ac, EIF_TRUE);
	return C;
}

/* EXCEPTIONS.default_create */
T0* T37c3(TC* ac)
{
	T0* C;
	C = GE_new37(ac, EIF_TRUE);
	return C;
}

/* MANAGED_POINTER.default_pointer */
T14 T162s4(TC* ac)
{
	T14 R = 0;
	return R;
}

/* POINTER.memory_calloc */
T14 T14s5(TC* ac, T6 a1, T6 a2)
{
	T14 R = 0;
	R = (T14s8(ac, a1, a2));
	return R;
}

/* POINTER.c_calloc */
T14 T14s8(TC* ac, T6 a1, T6 a2)
{
	T14 R = 0;
	{
	R = (T14)(calloc((size_t)a1,( size_t)a2));
	}
	return R;
}

/* MANAGED_POINTER.resize */
void T162f11(TC* ac, T0* C, T6 a1)
{
	T1 t1;
	T6 t2;
	T14 volatile t3;
	T0* t4;
	t1 = (T1)(!(T1)((a1) == (((T162*)(C))->a3)));
	if (t1) {
		t2 = (T6f16(ac, &a1, (T6)(GE_int32(1))));
		((T162*)(C))->a1 = (T14f6(ac, &(((T162*)(C))->a1), t2));
		t3 = (T162s4(ac));
		t1 = (T1)((((T162*)(C))->a1) == (t3));
		if (t1) {
			t4 = (T37c3(ac));
			T37s4(ac, GE_ms8("No more memory", 14));
		}
	}
	t1 = (T6f4(ac, &a1, ((T162*)(C))->a3));
	if (t1) {
		t3 = ((T14)(((char*)(((T162*)(C))->a1))+(((T162*)(C))->a3)));
		t2 = ((T6)((a1)-(((T162*)(C))->a3)));
		T14f15(ac, &t3, (T6)(GE_int32(0)), t2);
	}
	((T162*)(C))->a3 = a1;
}

/* POINTER.memory_set */
void T14f15(TC* ac, T14 volatile* C, T6 a1, T6 a2)
{
	T14s18(ac, *C, a1, a2);
}

/* POINTER.c_memset */
void T14s18(TC* ac, T14 a1, T6 a2, T6 a3)
{
	{
	memset((void *)(void*)a1,( int)a2,( size_t)a3);
	}
}

/* POINTER.memory_realloc */
T14 T14f6(TC* ac, T14 volatile* C, T6 a1)
{
	T14 R = 0;
	R = (T14s9(ac, *C, a1));
	return R;
}

/* POINTER.c_realloc */
T14 T14s9(TC* ac, T14 a1, T6 a2)
{
	T14 R = 0;
	{
	R = (T14)(realloc((void *)(void*)a1,( size_t)a2));
	}
	return R;
}

/* CONSOLE.buffered_file_info */
T0* T1669f16(TC* ac, T0* C)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[13]) {
		if (ac->thread_onces->reference_exception[13]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[13]);
		}
		return ac->thread_onces->reference_value[13];
	} else {
		ac->thread_onces->reference_status[13] = '\1';
		ac->thread_onces->reference_value[13] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[13] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T166c23(ac);
	ac->thread_onces->reference_value[13] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* FILE_INFO.make */
T0* T166c23(TC* ac)
{
	T0* C;
	T6 t1;
	C = GE_new166(ac, EIF_TRUE);
	t1 = (T166s10(ac));
	T166f25(ac, C, (T8)(GE_nat8(0)), t1);
	((T166*)(C))->a2 = EIF_TRUE;
	((T166*)(C))->a3 = EIF_FALSE;
	return C;
}

/* FILE_INFO.make_filled_area */
void T166f25(TC* ac, T0* C, T8 a1, T6 a2)
{
	((T166*)(C))->a1 = T1075c5(ac, a1, a2);
}

/* SPECIAL [NATURAL_8].make_filled */
T0* T1075c5(TC* ac, T8 a1, T6 a2)
{
	T0* C;
	T6 t1;
	C = GE_new1075(ac, a2, EIF_TRUE);
	T1075f6(ac, C, a2);
	t1 = ((T6)((a2)-((T6)(GE_int32(1)))));
	T1075f8(ac, C, a1, (T6)(GE_int32(0)), t1);
	return C;
}

/* SPECIAL [NATURAL_8].fill_with */
void T1075f8(TC* ac, T0* C, T8 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 t1;
	T1 t2;
	l1 = a2;
	t1 = ((T6)((a3)+((T6)(GE_int32(1)))));
	l3 = (T6f17(ac, &(((T1075*)(C))->a2), t1));
	l2 = l3;
	while (1) {
		t2 = (T1)((l1) == (l2));
		if (t2) {
			break;
		}
		((T1075*)(C))->z2[l1] = (a1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	l1 = l3;
	l2 = ((T6)((a3)+((T6)(GE_int32(1)))));
	while (1) {
		t2 = (T1)((l1) == (l2));
		if (t2) {
			break;
		}
		T1075f7(ac, C, a1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
}

/* FILE_INFO.stat_size */
T6 T166s10(TC* ac)
{
	T6 R = 0;
	{
	R = (T6)(stat_size());
	}
	return R;
}

/* KL_STDOUT_FILE.io */
T0* T161s4(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[14]) {
		if (ac->thread_onces->reference_exception[14]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[14]);
		}
		return ac->thread_onces->reference_value[14];
	} else {
		ac->thread_onces->reference_status[14] = '\1';
		ac->thread_onces->reference_value[14] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[14] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T1031c5(ac);
	ac->thread_onces->reference_value[14] = R;
	T1031f6(ac, R);
	ac->last_rescue = r.previous;
	return R;
}

/* STD_FILES.set_output_default */
void T1031f6(TC* ac, T0* C)
{
	((T1031*)(C))->a1 = (T1031s3(ac));
}

/* STD_FILES.default_create */
T0* T1031c5(TC* ac)
{
	T0* C;
	C = GE_new1031(ac, EIF_TRUE);
	return C;
}

/* KL_NULL_TEXT_OUTPUT_STREAM.put_string */
void T230f5(TC* ac, T0* C, T0* a1)
{
}

/* DT_DATE_TIME_DURATION.set_canonical */
void T1036f17(TC* ac, T0* C, T0* a1)
{
	T0* l1 = 0;
	l1 = (T1036f8(ac, C));
	T97f63(ac, l1, a1);
	T97f64(ac, l1, a1);
	T97f65(ac, l1, C);
	T1036f21(ac, C, a1, l1);
}

/* DT_DATE_TIME_DURATION.make_canonical_from_dates */
void T1036f21(TC* ac, T0* C, T0* a1, T0* a2)
{
	T6 l1 = 0;
	T6 volatile l2 = 0;
	T6 volatile l3 = 0;
	T6 volatile l4 = 0;
	T6 l5 = 0;
	T6 l6 = 0;
	T6 l7 = 0;
	T6 l8 = 0;
	T6 l9 = 0;
	T6 l10 = 0;
	T6 l11 = 0;
	T6 l12 = 0;
	T6 t1;
	T6 t2;
	T1 t3;
	t1 = (T97f8(ac, a2));
	t2 = (T97f8(ac, a1));
	l1 = ((T6)((t1)-(t2)));
	t1 = (T97f9(ac, a2));
	t2 = (T97f9(ac, a1));
	l2 = ((T6)((t1)-(t2)));
	l10 = (T97f10(ac, a2));
	l9 = (T97f10(ac, a1));
	l3 = ((T6)((l10)-(l9)));
	t1 = (T97f43(ac, a2));
	t2 = (T97f43(ac, a1));
	l4 = ((T6)((t1)-(t2)));
	t3 = (T97f44(ac, a1, a2));
	if (t3) {
		t3 = ((T1)((l4)<((T6)(GE_int32(0)))));
		if (t3) {
			l3 = ((T6)((l3)-((T6)(GE_int32(1)))));
			l4 = ((T6)((l4)+((T6)(GE_int32(86400000)))));
		}
		l8 = ((T6)((l4)%((T6)(GE_int32(1000)))));
		l4 = ((T6)((l4)/((T6)(GE_int32(1000)))));
		l7 = ((T6)((l4)%((T6)(GE_int32(60)))));
		l4 = ((T6)((l4)/((T6)(GE_int32(60)))));
		l6 = ((T6)((l4)%((T6)(GE_int32(60)))));
		l5 = ((T6)((l4)/((T6)(GE_int32(60)))));
		t3 = ((T1)((l3)<((T6)(GE_int32(0)))));
		if (t3) {
			l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
			l11 = (T97f45(ac, a2));
			t3 = ((T1)((l11)<(l9)));
			if (t3) {
				l3 = ((T6)((l3)+(l9)));
			} else {
				l3 = ((T6)((l3)+(l11)));
			}
		}
		t3 = ((T1)((l2)<((T6)(GE_int32(0)))));
		if (t3) {
			l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
			t1 = (T6)(GE_int32(12));
			l2 = ((T6)((t1)+(l2)));
		}
	} else {
		t3 = (T6f4(ac, (&l4), (T6)(GE_int32(0))));
		if (t3) {
			l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
			l4 = ((T6)((l4)-((T6)(GE_int32(86400000)))));
		}
		l4 = ((T6)(-(l4)));
		t1 = ((T6)((l4)%((T6)(GE_int32(1000)))));
		l8 = ((T6)(-(t1)));
		l4 = ((T6)((l4)/((T6)(GE_int32(1000)))));
		t1 = ((T6)((l4)%((T6)(GE_int32(60)))));
		l7 = ((T6)(-(t1)));
		l4 = ((T6)((l4)/((T6)(GE_int32(60)))));
		t1 = ((T6)((l4)%((T6)(GE_int32(60)))));
		l6 = ((T6)(-(t1)));
		t1 = ((T6)((l4)/((T6)(GE_int32(60)))));
		l5 = ((T6)(-(t1)));
		l12 = (T97f46(ac, a2));
		t3 = (T6f4(ac, (&l3), (T6)(GE_int32(0))));
		if (t3) {
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			l3 = ((T6)((l3)-(l12)));
		} else {
			t3 = ((T1)((l12)<(l9)));
			if (t3) {
				t1 = ((T6)((l3)+(l9)));
				l3 = ((T6)((t1)-(l12)));
			}
		}
		t3 = (T6f4(ac, (&l2), (T6)(GE_int32(0))));
		if (t3) {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			l2 = ((T6)((l2)-((T6)(GE_int32(12)))));
		}
	}
	T1036f16(ac, C, l1, l2, l3, l5, l6, l7, l8);
}

/* DT_DATE_TIME_DURATION.make_precise */
void T1036f16(TC* ac, T0* C, T6 a1, T6 a2, T6 a3, T6 a4, T6 a5, T6 a6, T6 a7)
{
	T1036f19(ac, C, a1, a2, a3);
	T1036f20(ac, C, a4, a5, a6, a7);
}

/* DT_DATE_TIME_DURATION.make_precise */
T0* T1036c16(TC* ac, T6 a1, T6 a2, T6 a3, T6 a4, T6 a5, T6 a6, T6 a7)
{
	T0* C;
	C = GE_new1036(ac, EIF_TRUE);
	T1036f19(ac, C, a1, a2, a3);
	T1036f20(ac, C, a4, a5, a6, a7);
	return C;
}

/* DT_DATE_TIME_DURATION.make_precise_time_duration */
void T1036f20(TC* ac, T0* C, T6 a1, T6 a2, T6 a3, T6 a4)
{
	((T1036*)(C))->a4 = a1;
	((T1036*)(C))->a5 = a2;
	((T1036*)(C))->a6 = a3;
	((T1036*)(C))->a7 = a4;
}

/* DT_DATE_TIME_DURATION.make_date_duration */
void T1036f19(TC* ac, T0* C, T6 a1, T6 a2, T6 a3)
{
	((T1036*)(C))->a1 = a1;
	((T1036*)(C))->a2 = a2;
	((T1036*)(C))->a3 = a3;
}

/* DT_DATE_TIME.days_in_current_month */
T6 T97f46(TC* ac, T0* C)
{
	T6 R = 0;
	T6 t1;
	T6 t2;
	t1 = (T97f9(ac, C));
	t2 = (T97f8(ac, C));
	R = (T97s48(ac, t1, t2));
	return R;
}

/* DT_DATE_TIME.days_in_month */
T6 T97s48(TC* ac, T6 a1, T6 a2)
{
	T6 R = 0;
	T1 t1;
	switch (a1) {
	case GE_int32(1):
	case GE_int32(3):
	case GE_int32(5):
	case GE_int32(7):
	case GE_int32(8):
	case GE_int32(10):
	case GE_int32(12):
		R = (T6)(GE_int32(31));
		break;
	case GE_int32(4):
	case GE_int32(6):
	case GE_int32(9):
	case GE_int32(11):
		R = (T6)(GE_int32(30));
		break;
	case GE_int32(2):
		t1 = (T97s41(ac, a2));
		if (t1) {
			R = (T6)(GE_int32(29));
		} else {
			R = (T6)(GE_int32(28));
		}
		break;
	default:
		GE_raise(GE_EX_WHEN);
		break;
	}
	return R;
}

/* DT_DATE_TIME.leap_year */
T1 T97s41(TC* ac, T6 a1)
{
	T1 R = 0;
	T6 t1;
	T1 t2;
	t1 = ((T6)((a1)%((T6)(GE_int32(4)))));
	t2 = (T1)((t1) == ((T6)(GE_int32(0))));
	if (t2) {
		t1 = ((T6)((a1)%((T6)(GE_int32(100)))));
		t2 = (T1)(!(T1)((t1) == ((T6)(GE_int32(0)))));
		if (!(t2)) {
			t1 = ((T6)((a1)%((T6)(GE_int32(400)))));
			R = (T1)((t1) == ((T6)(GE_int32(0))));
		} else {
			R = EIF_TRUE;
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* DT_DATE_TIME.days_in_previous_month */
T6 T97f45(TC* ac, T0* C)
{
	T6 R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T6 t1;
	T1 t2;
	T6 t3;
	t1 = (T97f9(ac, C));
	l1 = ((T6)((t1)-((T6)(GE_int32(1)))));
	l2 = (T97f8(ac, C));
	t2 = (T6f15(ac, (&l1), (T6)(GE_int32(0))));
	if (t2) {
		t1 = ((T6)(-(l1)));
		t1 = ((T6)((t1)/((T6)(GE_int32(12)))));
		t1 = ((T6)((l2)-(t1)));
		l2 = ((T6)((t1)-((T6)(GE_int32(1)))));
		t1 = (T6)(GE_int32(12));
		t3 = ((T6)(-(l1)));
		t3 = ((T6)((t3)%((T6)(GE_int32(12)))));
		l1 = ((T6)((t1)-(t3)));
	}
	R = (T97s48(ac, l1, l2));
	return R;
}

/* DT_DATE_TIME.is_less */
T1 T97f44(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	T6 t1;
	T1 t2;
	t1 = (((T97*)(a1))->a2);
	t2 = ((T1)((((T97*)(C))->a2)<(t1)));
	if (!(t2)) {
		t1 = (((T97*)(a1))->a2);
		t2 = (T1)((((T97*)(C))->a2) == (t1));
		if (t2) {
			t1 = (((T97*)(a1))->a1);
			R = ((T1)((((T97*)(C))->a1)<(t1)));
		} else {
			R = EIF_FALSE;
		}
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* DT_DATE_TIME.millisecond_count */
T6 T97f43(TC* ac, T0* C)
{
	T6 R = 0;
	R = ((T97*)(C))->a1;
	return R;
}

/* DT_DATE_TIME.day */
T6 T97f10(TC* ac, T0* C)
{
	T6 R = 0;
	R = ((T6)((((T97*)(C))->a2)&((T6)(GE_int32(31)))));
	return R;
}

/* DT_DATE_TIME.month */
T6 T97f9(TC* ac, T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = ((T6)((((T97*)(C))->a2)&((T6)(GE_int32(480)))));
	R = ((T6)((t1)>>((T6)(GE_int32(5)))));
	return R;
}

/* DT_DATE_TIME.year */
T6 T97f8(TC* ac, T0* C)
{
	T6 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((T1)((((T97*)(C))->a2)<((T6)(GE_int32(0)))));
	if (t1) {
		t2 = ((T6)((((T97*)(C))->a2)&((T6)(GE_int32(4294966784)))));
		t2 = ((T6)(-(t2)));
		t2 = ((T6)((t2)>>((T6)(GE_int32(9)))));
		R = ((T6)(-(t2)));
	} else {
		t2 = ((T6)((((T97*)(C))->a2)&((T6)(GE_int32(4294966784)))));
		R = ((T6)((t2)>>((T6)(GE_int32(9)))));
	}
	return R;
}

/* DT_DATE_TIME.add_duration */
void T97f65(TC* ac, T0* C, T0* a1)
{
	T6 l1 = 0;
	T6 t1;
	T6 t2;
	T6 t3;
	T1 t4;
	t1 = (((T1036*)(a1))->a1);
	t2 = (((T1036*)(a1))->a2);
	t3 = (((T1036*)(a1))->a3);
	T97f68(ac, C, t1, t2, t3);
	l1 = (T1036f15(ac, a1));
	t4 = (T1)(!(T1)((l1) == ((T6)(GE_int32(0)))));
	if (t4) {
		T97f69(ac, C, l1);
	}
}

/* DT_DATE_TIME.add_milliseconds */
void T97f69(TC* ac, T0* C, T6 a1)
{
	T7 l1 = 0;
	T7 l2 = 0;
	T1 t1;
	T7 t2;
	t1 = (T1)(!(T1)((a1) == ((T6)(GE_int32(0)))));
	if (t1) {
		l2 = (T6f21(ac, &a1));
		t2 = (T6f21(ac, &(((T97*)(C))->a1)));
		l1 = ((T7)((t2)+(l2)));
		T97f72(ac, C, l1);
	}
}

/* DT_DATE_TIME.set_normalized_time_storage */
void T97f72(TC* ac, T0* C, T7 a1)
{
	T1 t1;
	T7 volatile t2;
	T6 volatile t3;
	T7 volatile t4;
	T6 volatile t5;
	T7 volatile t6;
	T6 volatile t7;
	T7 volatile t8;
	T6 volatile t9;
	T6 volatile t10;
	t1 = ((T1)((a1)<((T7)(GE_int64(0)))));
	if (t1) {
		t2 = ((T7)(-(a1)));
		t3 = (T6)(GE_int32(86400000));
		t4 = (T6f21(ac, &t3));
		t2 = ((T7)((t2)/(t4)));
		t2 = ((T7)(-(t2)));
		t2 = ((T7)((t2)-((T7)(GE_int64(1)))));
		t5 = (T7f21(ac, &t2));
		T97f73(ac, C, t5);
		t5 = (T6)(GE_int32(86400000));
		t4 = (T6f21(ac, &t5));
		t6 = ((T7)(-(a1)));
		t7 = (T6)(GE_int32(86400000));
		t8 = (T6f21(ac, &t7));
		t6 = ((T7)((t6)%(t8)));
		t4 = ((T7)((t4)-(t6)));
		((T97*)(C))->a1 = (T7f21(ac, &t4));
	} else {
		t9 = (T6)(GE_int32(86400000));
		t6 = (T6f21(ac, &t9));
		t6 = ((T7)((a1)/(t6)));
		t10 = (T7f21(ac, &t6));
		T97f73(ac, C, t10);
		t10 = (T6)(GE_int32(86400000));
		t8 = (T6f21(ac, &t10));
		t8 = ((T7)((a1)%(t8)));
		((T97*)(C))->a1 = (T7f21(ac, &t8));
	}
}

/* DT_DATE_TIME.add_days */
void T97f73(TC* ac, T0* C, T6 a1)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 volatile l4 = 0;
	T1 t1;
	T6 t2;
	t1 = (T1)(!(T1)((a1) == ((T6)(GE_int32(0)))));
	if (t1) {
		l1 = (T97f8(ac, C));
		l2 = (T97f9(ac, C));
		l3 = (T97f10(ac, C));
		l4 = ((T6)((l3)+(a1)));
		t1 = (T6f14(ac, (&l4), (T6)(GE_int32(1))));
		if (t1) {
			t2 = (T97s48(ac, l2, l1));
			t1 = (T6f15(ac, (&l4), t2));
		}
		if (t1) {
			T97f70(ac, C, l4);
		} else {
			t2 = (T97s11(ac, l1, l2, l3));
			t2 = ((T6)((t2)+(a1)));
			T97f71(ac, C, t2);
		}
	}
}

/* DT_DATE_TIME.set_from_epoch_days */
void T97f71(TC* ac, T0* C, T6 a1)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 volatile l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T6 t1;
	T1 t2;
	t1 = (T97s49(ac));
	l3 = ((T6)((a1)-(t1)));
	t2 = ((T1)((l3)<((T6)(GE_int32(0)))));
	if (t2) {
		l3 = ((T6)(-(l3)));
		t1 = ((T6)((l3)/((T6)(GE_int32(146097)))));
		l1 = ((T6)((t1)*((T6)(GE_int32(400)))));
		l3 = ((T6)((l3)%((T6)(GE_int32(146097)))));
		l4 = ((T6)((l3)/((T6)(GE_int32(36524)))));
		t2 = (T1)((l4) == ((T6)(GE_int32(4))));
		if (t2) {
			l1 = ((T6)((l1)+((T6)(GE_int32(300)))));
			t1 = (T6)(GE_int32(3));
			t1 = ((T6)((t1)*((T6)(GE_int32(36524)))));
			l3 = ((T6)((l3)-(t1)));
		} else {
			t1 = ((T6)((l4)*((T6)(GE_int32(100)))));
			l1 = ((T6)((l1)+(t1)));
			l3 = ((T6)((l3)%((T6)(GE_int32(36524)))));
		}
		t1 = ((T6)((l3)/((T6)(GE_int32(1461)))));
		t1 = ((T6)((t1)*((T6)(GE_int32(4)))));
		l1 = ((T6)((l1)+(t1)));
		l3 = ((T6)((l3)%((T6)(GE_int32(1461)))));
		t2 = (T6f4(ac, (&l3), (T6)(GE_int32(1095))));
		if (t2) {
			l1 = ((T6)((l1)+((T6)(GE_int32(4)))));
			t1 = (T6)(GE_int32(1461));
			l3 = ((T6)((t1)-(l3)));
		} else {
			t2 = (T6f4(ac, (&l3), (T6)(GE_int32(730))));
			if (t2) {
				l1 = ((T6)((l1)+((T6)(GE_int32(3)))));
				t1 = (T6)(GE_int32(1095));
				l3 = ((T6)((t1)-(l3)));
			} else {
				t2 = (T6f4(ac, (&l3), (T6)(GE_int32(365))));
				if (t2) {
					l1 = ((T6)((l1)+((T6)(GE_int32(2)))));
					t1 = (T6)(GE_int32(730));
					l3 = ((T6)((t1)-(l3)));
				} else {
					t2 = (T6f4(ac, (&l3), (T6)(GE_int32(0))));
					if (t2) {
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						t1 = (T6)(GE_int32(365));
						l3 = ((T6)((t1)-(l3)));
					}
				}
			}
		}
		t1 = (T6)(GE_int32(2000));
		l1 = ((T6)((t1)-(l1)));
		l2 = (T6)(GE_int32(1));
		l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
		l5 = (T97s48(ac, l2, l1));
		while (1) {
			t2 = (T6f15(ac, (&l3), l5));
			if (t2) {
				break;
			}
			l3 = ((T6)((l3)-(l5)));
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			l5 = (T97s48(ac, l2, l1));
		}
		T97f60(ac, C, l1, l2, l3);
	} else {
		t1 = ((T6)((l3)/((T6)(GE_int32(146097)))));
		l1 = ((T6)((t1)*((T6)(GE_int32(400)))));
		l3 = ((T6)((l3)%((T6)(GE_int32(146097)))));
		l4 = ((T6)((l3)/((T6)(GE_int32(36524)))));
		t2 = (T1)((l4) == ((T6)(GE_int32(4))));
		if (t2) {
			l1 = ((T6)((l1)+((T6)(GE_int32(300)))));
			t1 = (T6)(GE_int32(3));
			t1 = ((T6)((t1)*((T6)(GE_int32(36524)))));
			l3 = ((T6)((l3)-(t1)));
		} else {
			t1 = ((T6)((l4)*((T6)(GE_int32(100)))));
			l1 = ((T6)((l1)+(t1)));
			l3 = ((T6)((l3)%((T6)(GE_int32(36524)))));
		}
		t1 = ((T6)((l3)/((T6)(GE_int32(1461)))));
		t1 = ((T6)((t1)*((T6)(GE_int32(4)))));
		l1 = ((T6)((l1)+(t1)));
		l3 = ((T6)((l3)%((T6)(GE_int32(1461)))));
		t2 = (T6f14(ac, (&l3), (T6)(GE_int32(1096))));
		if (t2) {
			l1 = ((T6)((l1)+((T6)(GE_int32(3)))));
			l3 = ((T6)((l3)-((T6)(GE_int32(1096)))));
		} else {
			t2 = (T6f14(ac, (&l3), (T6)(GE_int32(731))));
			if (t2) {
				l1 = ((T6)((l1)+((T6)(GE_int32(2)))));
				l3 = ((T6)((l3)-((T6)(GE_int32(731)))));
			} else {
				t2 = (T6f14(ac, (&l3), (T6)(GE_int32(366))));
				if (t2) {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					l3 = ((T6)((l3)-((T6)(GE_int32(366)))));
				}
			}
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(2000)))));
		l2 = (T6)(GE_int32(1));
		l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
		l5 = (T97s48(ac, l2, l1));
		while (1) {
			t2 = (T6f15(ac, (&l3), l5));
			if (t2) {
				break;
			}
			l3 = ((T6)((l3)-(l5)));
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			l5 = (T97s48(ac, l2, l1));
		}
		T97f60(ac, C, l1, l2, l3);
	}
}

/* DT_DATE_TIME.set_year_month_day */
void T97f60(TC* ac, T0* C, T6 a1, T6 a2, T6 a3)
{
	T1 t1;
	T6 t2;
	T6 t3;
	t1 = ((T1)((a1)<((T6)(GE_int32(0)))));
	if (t1) {
		t2 = ((T6)(-(a1)));
		t2 = ((T6)((T10)(t2)<<((T6)(GE_int32(9)))));
		t2 = ((T6)(-(t2)));
		t3 = ((T6)((T10)(a2)<<((T6)(GE_int32(5)))));
		t2 = ((T6)((t2)|(t3)));
		((T97*)(C))->a2 = ((T6)((t2)|(a3)));
	} else {
		t2 = ((T6)((T10)(a1)<<((T6)(GE_int32(9)))));
		t3 = ((T6)((T10)(a2)<<((T6)(GE_int32(5)))));
		t2 = ((T6)((t2)|(t3)));
		((T97*)(C))->a2 = ((T6)((t2)|(a3)));
	}
}

/* DT_DATE_TIME.epoch_to_y2k_days */
T6 T97s49(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T6 R = 0;
	if (ac->thread_onces->integer_32_status[1]) {
		if (ac->thread_onces->integer_32_exception[1]) {
			GE_raise_once_exception(ac, ac->thread_onces->integer_32_exception[1]);
		}
		return ac->thread_onces->integer_32_value[1];
	} else {
		ac->thread_onces->integer_32_status[1] = '\1';
		ac->thread_onces->integer_32_value[1] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->integer_32_exception[1] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = (T97s11(ac, (T6)(GE_int32(2000)), (T6)(GE_int32(1)), (T6)(GE_int32(1))));
	ac->thread_onces->integer_32_value[1] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* DT_DATE_TIME.epoch_days */
T6 T97s11(TC* ac, T6 a1, T6 a2, T6 a3)
{
	T6 R = 0;
	T6 t1;
	T0* t2;
	T6 t3;
	T6 t4;
	t1 = ((T6)((a1)-((T6)(GE_int32(1970)))));
	t1 = ((T6)((t1)*((T6)(GE_int32(365)))));
	t2 = (T97s24(ac));
	t3 = ((T6)((a1)-((T6)(GE_int32(1)))));
	t3 = (T1360s4(ac, t3, (T6)(GE_int32(4))));
	t2 = (T97s24(ac));
	t4 = ((T6)((a1)-((T6)(GE_int32(1)))));
	t4 = (T1360s4(ac, t4, (T6)(GE_int32(100))));
	t3 = ((T6)((t3)-(t4)));
	t2 = (T97s24(ac));
	t4 = ((T6)((a1)-((T6)(GE_int32(1)))));
	t4 = (T1360s4(ac, t4, (T6)(GE_int32(400))));
	t3 = ((T6)((t3)+(t4)));
	t4 = (T97s25(ac));
	t3 = ((T6)((t3)-(t4)));
	t1 = ((T6)((t1)+(t3)));
	t3 = (T97s26(ac, a2, a1));
	t4 = (T97s27(ac));
	t3 = ((T6)((t3)-(t4)));
	t1 = ((T6)((t1)+(t3)));
	t3 = ((T6)((a3)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)+(t3)));
	return R;
}

/* DT_DATE_TIME.epoch_days_at_month */
T6 T97s27(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T6 R = 0;
	if (ac->thread_onces->integer_32_status[2]) {
		if (ac->thread_onces->integer_32_exception[2]) {
			GE_raise_once_exception(ac, ac->thread_onces->integer_32_exception[2]);
		}
		return ac->thread_onces->integer_32_value[2];
	} else {
		ac->thread_onces->integer_32_status[2] = '\1';
		ac->thread_onces->integer_32_value[2] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->integer_32_exception[2] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = (T97s26(ac, (T6)(GE_int32(1)), (T6)(GE_int32(1970))));
	ac->thread_onces->integer_32_value[2] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* DT_DATE_TIME.days_at_month */
T6 T97s26(TC* ac, T6 a1, T6 a2)
{
	T6 R = 0;
	T1 t1;
	switch (a1) {
	case GE_int32(1):
		R = (T6)(GE_int32(0));
		break;
	case GE_int32(2):
		R = (T6)(GE_int32(31));
		break;
	case GE_int32(3):
		R = (T6)(GE_int32(59));
		break;
	case GE_int32(4):
		R = (T6)(GE_int32(90));
		break;
	case GE_int32(5):
		R = (T6)(GE_int32(120));
		break;
	case GE_int32(6):
		R = (T6)(GE_int32(151));
		break;
	case GE_int32(7):
		R = (T6)(GE_int32(181));
		break;
	case GE_int32(8):
		R = (T6)(GE_int32(212));
		break;
	case GE_int32(9):
		R = (T6)(GE_int32(243));
		break;
	case GE_int32(10):
		R = (T6)(GE_int32(273));
		break;
	case GE_int32(11):
		R = (T6)(GE_int32(304));
		break;
	case GE_int32(12):
		R = (T6)(GE_int32(334));
		break;
	default:
		GE_raise(GE_EX_WHEN);
		break;
	}
	t1 = (T6f4(ac, &a1, (T6)(GE_int32(2))));
	if (t1) {
		t1 = (T97s41(ac, a2));
	}
	if (t1) {
		R = ((T6)((R)+((T6)(GE_int32(1)))));
	}
	return R;
}

/* DT_DATE_TIME.epoch_leap_years */
T6 T97s25(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T6 R = 0;
	T6 t1;
	T6 t2;
	if (ac->thread_onces->integer_32_status[3]) {
		if (ac->thread_onces->integer_32_exception[3]) {
			GE_raise_once_exception(ac, ac->thread_onces->integer_32_exception[3]);
		}
		return ac->thread_onces->integer_32_value[3];
	} else {
		ac->thread_onces->integer_32_status[3] = '\1';
		ac->thread_onces->integer_32_value[3] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->integer_32_exception[3] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	t1 = (T6)(GE_int32(1970));
	t1 = ((T6)((t1)-((T6)(GE_int32(1)))));
	t1 = ((T6)((t1)/((T6)(GE_int32(4)))));
	t2 = (T6)(GE_int32(1970));
	t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
	t2 = ((T6)((t2)/((T6)(GE_int32(100)))));
	t1 = ((T6)((t1)-(t2)));
	t2 = (T6)(GE_int32(1970));
	t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
	t2 = ((T6)((t2)/((T6)(GE_int32(400)))));
	R = ((T6)((t1)+(t2)));
	ac->thread_onces->integer_32_value[3] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* KL_INTEGER_ROUTINES.div */
T6 T1360s4(TC* ac, T6 a1, T6 a2)
{
	T6 R = 0;
	R = ((T6)((a1)/(a2)));
	return R;
}

/* DT_DATE_TIME.integer_ */
T0* T97s24(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[0]) {
		if (ac->thread_onces->reference_exception[0]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[0]);
		}
		return ac->thread_onces->reference_value[0];
	} else {
		ac->thread_onces->reference_status[0] = '\1';
		ac->thread_onces->reference_value[0] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[0] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T1360c5(ac);
	ac->thread_onces->reference_value[0] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* DT_DATE_TIME.set_day */
void T97f70(TC* ac, T0* C, T6 a1)
{
	T6 t1;
	t1 = (T6)(GE_int32(4294966784));
	t1 = ((T6)((t1)|((T6)(GE_int32(480)))));
	t1 = ((T6)((((T97*)(C))->a2)&(t1)));
	((T97*)(C))->a2 = ((T6)((a1)|(t1)));
}

/* INTEGER_64.to_integer */
T6 T7f21(TC* ac, T7 volatile* C)
{
	T6 R = 0;
	R = ((T6)(*C));
	return R;
}

/* INTEGER_32.to_integer_64 */
T7 T6f21(TC* ac, T6 volatile* C)
{
	T7 R = 0;
	R = ((T7)(*C));
	return R;
}

/* DT_DATE_TIME_DURATION.millisecond_count */
T6 T1036f15(TC* ac, T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = ((T6)((((T1036*)(C))->a4)*((T6)(GE_int32(60)))));
	t1 = ((T6)((t1)+(((T1036*)(C))->a5)));
	t1 = ((T6)((t1)*((T6)(GE_int32(60)))));
	t1 = ((T6)((t1)+(((T1036*)(C))->a6)));
	t1 = ((T6)((t1)*((T6)(GE_int32(1000)))));
	R = ((T6)((t1)+(((T1036*)(C))->a7)));
	return R;
}

/* DT_DATE_TIME.add_years_months_days */
void T97f68(TC* ac, T0* C, T6 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 volatile l2 = 0;
	T6 volatile l3 = 0;
	T6 l4 = 0;
	T6 volatile l5 = 0;
	T1 t1;
	T1 t2;
	T6 t3;
	T6 t4;
	t2 = (T1)(!(T1)((a1) == ((T6)(GE_int32(0)))));
	if (!(t2)) {
		t1 = (T1)(!(T1)((a2) == ((T6)(GE_int32(0)))));
	} else {
		t1 = EIF_TRUE;
	}
	if (!(t1)) {
		t1 = (T1)(!(T1)((a3) == ((T6)(GE_int32(0)))));
	}
	if (t1) {
		t3 = (T97f8(ac, C));
		l1 = ((T6)((t3)+(a1)));
		l2 = (T97f9(ac, C));
		l3 = (T97f10(ac, C));
		t1 = (T1)(!(T1)((a2) == ((T6)(GE_int32(0)))));
		if (t1) {
			l2 = ((T6)((l2)+(a2)));
			t1 = (T6f15(ac, (&l2), (T6)(GE_int32(0))));
			if (t1) {
				t3 = ((T6)(-(l2)));
				t3 = ((T6)((t3)/((T6)(GE_int32(12)))));
				t3 = ((T6)((l1)-(t3)));
				l1 = ((T6)((t3)-((T6)(GE_int32(1)))));
				t3 = (T6)(GE_int32(12));
				t4 = ((T6)(-(l2)));
				t4 = ((T6)((t4)%((T6)(GE_int32(12)))));
				l2 = ((T6)((t3)-(t4)));
			} else {
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t3 = ((T6)((t3)/((T6)(GE_int32(12)))));
				l1 = ((T6)((l1)+(t3)));
				t3 = (T6)(GE_int32(1));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((t4)%((T6)(GE_int32(12)))));
				l2 = ((T6)((t3)+(t4)));
			}
		}
		t1 = (T1)(!(T1)((a1) == ((T6)(GE_int32(0)))));
		if (!(t1)) {
			t1 = (T1)(!(T1)((a2) == ((T6)(GE_int32(0)))));
		}
		if (t1) {
			l4 = (T97s48(ac, l2, l1));
			t1 = (T6f4(ac, (&l3), l4));
			if (t1) {
				l3 = l4;
			}
		}
		l5 = ((T6)((l3)+(a3)));
		t1 = (T6f14(ac, (&l5), (T6)(GE_int32(1))));
		if (t1) {
			t3 = (T97s48(ac, l2, l1));
			t1 = (T6f15(ac, (&l5), t3));
		}
		if (t1) {
			t1 = (T1)((a1) == ((T6)(GE_int32(0))));
			if (t1) {
				t1 = (T1)((a2) == ((T6)(GE_int32(0))));
			}
			if (t1) {
				T97f70(ac, C, l5);
			} else {
				T97f60(ac, C, l1, l2, l5);
			}
		} else {
			t3 = (T97s11(ac, l1, l2, (T6)(GE_int32(1))));
			t3 = ((T6)((t3)+(l3)));
			t3 = ((T6)((t3)-((T6)(GE_int32(1)))));
			t3 = ((T6)((t3)+(a3)));
			T97f71(ac, C, t3);
		}
	}
}

/* DT_DATE_TIME.set_time */
void T97f64(TC* ac, T0* C, T0* a1)
{
	((T97*)(C))->a1 = (((T97*)(a1))->a1);
}

/* DT_DATE_TIME.set_date */
void T97f63(TC* ac, T0* C, T0* a1)
{
	((T97*)(C))->a2 = (((T97*)(a1))->a2);
}

/* DT_DATE_TIME_DURATION.tmp_date_time */
T0* T1036f8(TC* ac, T0* C)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[15]) {
		if (ac->thread_onces->reference_exception[15]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[15]);
		}
		return ac->thread_onces->reference_value[15];
	} else {
		ac->thread_onces->reference_status[15] = '\1';
		ac->thread_onces->reference_value[15] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[15] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T97c62(ac, (T6)(GE_int32(1)), (T6)(GE_int32(1)), (T6)(GE_int32(1)), (T6)(GE_int32(0)), (T6)(GE_int32(0)), (T6)(GE_int32(0)));
	ac->thread_onces->reference_value[15] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* DT_DATE_TIME.make */
T0* T97c62(TC* ac, T6 a1, T6 a2, T6 a3, T6 a4, T6 a5, T6 a6)
{
	T0* C;
	C = GE_new97(ac, EIF_TRUE);
	T97f66(ac, C, a1, a2, a3);
	T97f67(ac, C, a4, a5, a6);
	return C;
}

/* DT_DATE_TIME.make_time */
void T97f67(TC* ac, T0* C, T6 a1, T6 a2, T6 a3)
{
	T6 t1;
	T6 t2;
	t1 = ((T6)((a1)*((T6)(GE_int32(3600000)))));
	t2 = ((T6)((a2)*((T6)(GE_int32(60000)))));
	t1 = ((T6)((t1)+(t2)));
	t2 = ((T6)((a3)*((T6)(GE_int32(1000)))));
	((T97*)(C))->a1 = ((T6)((t1)+(t2)));
}

/* DT_DATE_TIME.make_date */
void T97f66(TC* ac, T0* C, T6 a1, T6 a2, T6 a3)
{
	T97f60(ac, C, a1, a2, a3);
}

/* DT_DATE_TIME.minus */
T0* T97f12(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	R = (T97f16(ac, C, a1));
	return R;
}

/* DT_DATE_TIME.duration */
T0* T97f16(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	T6 t3;
	T6 t4;
	T6 t5;
	T6 t6;
	t1 = (T97f3(ac, C));
	t2 = (T97f3(ac, a1));
	t1 = ((T6)((t1)-(t2)));
	t2 = (T97f4(ac, C));
	t3 = (T97f4(ac, a1));
	t2 = ((T6)((t2)-(t3)));
	t3 = (T97f5(ac, C));
	t4 = (T97f5(ac, a1));
	t3 = ((T6)((t3)-(t4)));
	t4 = (T97f6(ac, C));
	t5 = (T97f6(ac, a1));
	t4 = ((T6)((t4)-(t5)));
	t5 = (T97f7(ac, C));
	t6 = (T97f7(ac, a1));
	t5 = ((T6)((t5)-(t6)));
	R = T1036c16(ac, (T6)(GE_int32(0)), (T6)(GE_int32(0)), t1, t2, t3, t4, t5);
	return R;
}

/* DT_DATE_TIME.millisecond */
T6 T97f7(TC* ac, T0* C)
{
	T6 R = 0;
	R = ((T6)((((T97*)(C))->a1)%((T6)(GE_int32(1000)))));
	return R;
}

/* DT_DATE_TIME.second */
T6 T97f6(TC* ac, T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = ((T6)((((T97*)(C))->a1)/((T6)(GE_int32(1000)))));
	R = ((T6)((t1)%((T6)(GE_int32(60)))));
	return R;
}

/* DT_DATE_TIME.minute */
T6 T97f5(TC* ac, T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = ((T6)((((T97*)(C))->a1)/((T6)(GE_int32(60000)))));
	R = ((T6)((t1)%((T6)(GE_int32(60)))));
	return R;
}

/* DT_DATE_TIME.hour */
T6 T97f4(TC* ac, T0* C)
{
	T6 R = 0;
	R = ((T6)((((T97*)(C))->a1)/((T6)(GE_int32(3600000)))));
	return R;
}

/* DT_DATE_TIME.day_count */
T6 T97f3(TC* ac, T0* C)
{
	T6 R = 0;
	T6 t1;
	T6 t2;
	T6 t3;
	t1 = (T97f8(ac, C));
	t2 = (T97f9(ac, C));
	t3 = (T97f10(ac, C));
	R = (T97s11(ac, t1, t2, t3));
	return R;
}

/* DT_SYSTEM_CLOCK.date_time_now */
T0* T1035f10(TC* ac, T0* C)
{
	T0* R = 0;
	R = T97c59(ac, (T6)(GE_int32(0)), (T6)(GE_int32(0)));
	T1035f12(ac, C, R);
	return R;
}

/* DT_SYSTEM_CLOCK.set_date_time_to_now */
void T1035f12(TC* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T1035f13(ac, C);
	t1 = (T6f14(ac, &(((T1035*)(C))->a1), (T6)(GE_int32(60))));
	if (t1) {
		t2 = (T6)(GE_int32(60));
		((T1035*)(C))->a1 = ((T6)((t2)-((T6)(GE_int32(1)))));
	}
	T97f60(ac, a1, ((T1035*)(C))->a2, ((T1035*)(C))->a3, ((T1035*)(C))->a4);
	T97f61(ac, a1, ((T1035*)(C))->a5, ((T1035*)(C))->a6, ((T1035*)(C))->a1, ((T1035*)(C))->a7);
}

/* DT_DATE_TIME.set_precise_hour_minute_second */
void T97f61(TC* ac, T0* C, T6 a1, T6 a2, T6 a3, T6 a4)
{
	T6 t1;
	T6 t2;
	t1 = ((T6)((a1)*((T6)(GE_int32(3600000)))));
	t2 = ((T6)((a2)*((T6)(GE_int32(60000)))));
	t1 = ((T6)((t1)+(t2)));
	t2 = ((T6)((a3)*((T6)(GE_int32(1000)))));
	t1 = ((T6)((t1)+(t2)));
	((T97*)(C))->a1 = ((T6)((t1)+(a4)));
}

/* DT_SYSTEM_CLOCK.set_local_time */
void T1035f13(TC* ac, T0* C)
{
	T0* l1 = 0;
	T1 t1;
	l1 = ((T1035*)(C))->a8;
	t1 = (T1)(l1==EIF_VOID);
	if (t1) {
		l1 = T1670c22(ac);
		((T1035*)(C))->a8 = l1;
	} else {
		T1670f23(ac, l1);
	}
	((T1035*)(C))->a2 = (T1670f7(ac, l1));
	((T1035*)(C))->a3 = (T1670f8(ac, l1));
	((T1035*)(C))->a4 = (T1670f15(ac, l1));
	((T1035*)(C))->a5 = (T1670f4(ac, l1));
	((T1035*)(C))->a6 = (T1670f5(ac, l1));
	((T1035*)(C))->a1 = (T1670f6(ac, l1));
	((T1035*)(C))->a7 = (((T1670*)(l1))->a1);
}

/* C_DATE.second_now */
T6 T1670f6(TC* ac, T0* C)
{
	T6 volatile R = 0;
	T14 t1;
	T1 t2;
	t1 = (((T162*)(((T1670*)(C))->a2))->a1);
	R = (T1670s13(ac, t1));
	t2 = (T6f4(ac, (&R), (T6)(GE_int32(59))));
	if (t2) {
		R = (T6)(GE_int32(59));
	}
	return R;
}

/* C_DATE.get_tm_sec */
T6 T1670s13(TC* ac, T14 a1)
{
	{
return ((struct tm *) (void*)a1)->tm_sec;
	}
}

/* C_DATE.minute_now */
T6 T1670f5(TC* ac, T0* C)
{
	T6 R = 0;
	T14 t1;
	t1 = (((T162*)(((T1670*)(C))->a2))->a1);
	R = (T1670s12(ac, t1));
	return R;
}

/* C_DATE.get_tm_min */
T6 T1670s12(TC* ac, T14 a1)
{
	{
return ((struct tm *) (void*)a1)->tm_min;
	}
}

/* C_DATE.hour_now */
T6 T1670f4(TC* ac, T0* C)
{
	T6 R = 0;
	T14 t1;
	t1 = (((T162*)(((T1670*)(C))->a2))->a1);
	R = (T1670s11(ac, t1));
	return R;
}

/* C_DATE.get_tm_hour */
T6 T1670s11(TC* ac, T14 a1)
{
	{
return ((struct tm *) (void*)a1)->tm_hour;
	}
}

/* C_DATE.day_now */
T6 T1670f15(TC* ac, T0* C)
{
	T6 R = 0;
	T14 t1;
	t1 = (((T162*)(((T1670*)(C))->a2))->a1);
	R = (T1670s10(ac, t1));
	return R;
}

/* C_DATE.get_tm_mday */
T6 T1670s10(TC* ac, T14 a1)
{
	{
return ((struct tm *) (void*)a1)->tm_mday;
	}
}

/* C_DATE.month_now */
T6 T1670f8(TC* ac, T0* C)
{
	T6 R = 0;
	T14 t1;
	T6 t2;
	t1 = (((T162*)(((T1670*)(C))->a2))->a1);
	t2 = (T1670s9(ac, t1));
	R = ((T6)((t2)+((T6)(GE_int32(1)))));
	return R;
}

/* C_DATE.get_tm_mon */
T6 T1670s9(TC* ac, T14 a1)
{
	{
return ((struct tm *) (void*)a1)->tm_mon;
	}
}

/* C_DATE.year_now */
T6 T1670f7(TC* ac, T0* C)
{
	T6 R = 0;
	T6 t1;
	T14 t2;
	T6 t3;
	t1 = (T6)(GE_int32(1900));
	t2 = (((T162*)(((T1670*)(C))->a2))->a1);
	t3 = (T1670s14(ac, t2));
	R = ((T6)((t1)+(t3)));
	return R;
}

/* C_DATE.get_tm_year */
T6 T1670s14(TC* ac, T14 a1)
{
	{
return ((struct tm *) (void*)a1)->tm_year;
	}
}

/* C_DATE.update */
void T1670f23(TC* ac, T0* C)
{
	T14 volatile l1 = 0;
	T14 l2 = 0;
	T14 volatile l3 = 0;
	T6 volatile l4 = 0;
	T6 t1;
	T1 t2;
	t1 = (T1670s16(ac));
	l1 = (T14s11(ac, t1));
	t1 = (T1670s17(ac));
	l3 = (T14s11(ac, t1));
	T1670s24(ac, l1);
	T1670s25(ac, l1, l3);
	if (((T1670*)(C))->a3) {
		l2 = (T1670s18(ac, l3));
	} else {
		l2 = (T1670s19(ac, l3));
	}
	t1 = (T1670s20(ac));
	((T1670*)(C))->a2 = T162c13(ac, l2, t1);
	l4 = (T1670s21(ac, l1));
	t2 = ((T1)((l4)<((T6)(GE_int32(0)))));
	if (!(t2)) {
		t2 = (T6f4(ac, (&l4), (T6)(GE_int32(999))));
	}
	if (t2) {
		((T1670*)(C))->a1 = (T6)(GE_int32(0));
	} else {
		((T1670*)(C))->a1 = l4;
	}
	T14f14(ac, (&l1));
	T14f14(ac, (&l3));
}

/* POINTER.memory_free */
void T14f14(TC* ac, T14 volatile* C)
{
	T14 t1;
	T14s16(ac, *C);
	t1 = (T14s10(ac));
	*C = (t1);
}

/* POINTER.default_pointer */
T14 T14s10(TC* ac)
{
	T14 R = 0;
	return R;
}

/* POINTER.c_free */
void T14s16(TC* ac, T14 a1)
{
	{
	free((void *)(void*)a1);
	}
}

/* C_DATE.get_millitm */
T6 T1670s21(TC* ac, T14 a1)
{
	{
return GE_timebmillitm((void*)a1);
	}
}

/* MANAGED_POINTER.make_from_pointer */
T0* T162c13(TC* ac, T14 a1, T6 a2)
{
	T0* C;
	T6 t1;
	T14 t2;
	T1 t3;
	T0* t4;
	C = GE_new162(ac, EIF_TRUE);
	T162f12(ac, C);
	t1 = (T6f16(ac, &a2, (T6)(GE_int32(1))));
	((T162*)(C))->a1 = (T14s11(ac, t1));
	t2 = (T162s4(ac));
	t3 = (T1)((((T162*)(C))->a1) == (t2));
	if (t3) {
		t4 = (T37c3(ac));
		T37s4(ac, GE_ms8("No more memory", 14));
	}
	T14f19(ac, &(((T162*)(C))->a1), a1, a2);
	((T162*)(C))->a3 = a2;
	((T162*)(C))->a2 = EIF_FALSE;
	return C;
}

/* C_DATE.tm_structure_size */
T6 T1670s20(TC* ac)
{
	{
return sizeof(struct tm);
	}
}

/* C_DATE.localtime */
T14 T1670s19(TC* ac, T14 a1)
{
	{
return localtime((time_t *) (void*)a1);
	}
}

/* C_DATE.gmtime */
T14 T1670s18(TC* ac, T14 a1)
{
	{
return gmtime((time_t *) (void*)a1);
	}
}

/* C_DATE.get_time */
void T1670s25(TC* ac, T14 a1, T14 a2)
{
	{
*(time_t *) (void*)a2 = GE_timebtime((void*)a1);
	}
}

/* C_DATE.ftime */
void T1670s24(TC* ac, T14 a1)
{
	{
GE_ftime((void*)a1);
	}
}

/* C_DATE.time_t_structure_size */
T6 T1670s17(TC* ac)
{
	{
return sizeof(time_t);
	}
}

/* POINTER.memory_alloc */
T14 T14s11(TC* ac, T6 a1)
{
	T14 R = 0;
	R = (T14s12(ac, a1));
	return R;
}

/* POINTER.c_malloc */
T14 T14s12(TC* ac, T6 a1)
{
	T14 R = 0;
	{
	R = (T14)(malloc((size_t)a1));
	}
	return R;
}

/* C_DATE.timeb_structure_size */
T6 T1670s16(TC* ac)
{
	{
return GE_timebsz;
	}
}

/* C_DATE.default_create */
T0* T1670c22(TC* ac)
{
	T0* C;
	C = GE_new1670(ac, EIF_TRUE);
	((T1670*)(C))->a3 = EIF_FALSE;
	T1670f23(ac, C);
	return C;
}

/* DT_DATE_TIME.make_from_storage */
T0* T97c59(TC* ac, T6 a1, T6 a2)
{
	T0* C;
	C = GE_new97(ac, EIF_TRUE);
	((T97*)(C))->a2 = a1;
	((T97*)(C))->a1 = a2;
	return C;
}

/* DT_SHARED_SYSTEM_CLOCK.system_clock */
T0* T1034s1(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[16]) {
		if (ac->thread_onces->reference_exception[16]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[16]);
		}
		return ac->thread_onces->reference_value[16];
	} else {
		ac->thread_onces->reference_status[16] = '\1';
		ac->thread_onces->reference_value[16] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[16] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T1035c11(ac);
	ac->thread_onces->reference_value[16] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* DT_SYSTEM_CLOCK.make */
T0* T1035c11(TC* ac)
{
	T0* C;
	C = GE_new1035(ac, EIF_TRUE);
	return C;
}

/* DT_SHARED_SYSTEM_CLOCK.default_create */
T0* T1034c2(TC* ac)
{
	T0* C;
	C = GE_new1034(ac, EIF_TRUE);
	return C;
}

/* ET_SYSTEM_PROCESSOR.stop_requested */
T1 T66f41(TC* ac, T0* C)
{
	T1 R = 0;
	T0* m1 = 0;
	T1 t1;
	t1 = EIF_FALSE;
	if (t1) {
		R = ((m1, GE_mt76(ac), (T1)0));
	}
	return R;
}

/* ET_SYSTEM_MULTIPROCESSOR.record_end_time */
void T858f58(TC* ac, T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 t2;
	t2 = (T858f44(ac, C));
	t1 = ((T1)(!(t2)));
	if (t1) {
		t1 = (T1)(a1!=EIF_VOID);
	}
	if (t1) {
		T858f70(ac, C, a1, a2);
	}
}

/* ET_SYSTEM_MULTIPROCESSOR.print_time */
void T858f70(TC* ac, T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T0* t2;
	T0* t3;
	t1 = (T858f44(ac, C));
	t1 = ((T1)(!(t1)));
	if (t1) {
		l1 = T1034c2(ac);
		t2 = (T1034s1(ac));
		l2 = (T1035f10(ac, t2));
		l3 = (T97f12(ac, l2, a1));
		T1036f17(ac, l3, a1);
		t2 = (((((T0*)(((T858*)(C))->a6))->id==42)?((T42*)(((T858*)(C))->a6))->a2:((T63*)(((T858*)(C))->a6))->a2));
		if (((T0*)(t2))->id==230) {
			T230f5(ac, t2, a2);
		} else {
			T161f6(ac, t2, a2);
		}
		t2 = (((((T0*)(((T858*)(C))->a6))->id==42)?((T42*)(((T858*)(C))->a6))->a2:((T63*)(((T858*)(C))->a6))->a2));
		if (((T0*)(t2))->id==230) {
			T230f5(ac, t2, GE_ms8(": ", 2));
		} else {
			T161f6(ac, t2, GE_ms8(": ", 2));
		}
		t2 = (((((T0*)(((T858*)(C))->a6))->id==42)?((T42*)(((T858*)(C))->a6))->a2:((T63*)(((T858*)(C))->a6))->a2));
		t3 = (T1036f9(ac, l3));
		if (((T0*)(t2))->id==230) {
			T230f4(ac, t2, t3);
		} else {
			T161f9(ac, t2, t3);
		}
	}
}

/* ET_SYSTEM_MULTIPROCESSOR.stop_requested */
T1 T858f44(TC* ac, T0* C)
{
	T1 R = 0;
	T0* m1 = 0;
	T1 t1;
	t1 = EIF_FALSE;
	if (t1) {
		R = ((m1, GE_mt76(ac), (T1)0));
	}
	return R;
}

/* GEC.compile_c_code */
void T26f91(TC* ac, T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T6 l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T0* m1 = 0;
	T0* m2 = 0;
	T0* m3 = 0;
	T0* t1;
	T1 t2;
	T6 volatile t3;
	T0* t4;
	T6 volatile t5;
	l7 = (((((T0*)(a2))->id==858)?T858f45(ac, a2):T66f39(ac, a2)));
	t1 = (((T87*)(a1))->a106);
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		l1 = m1;
	} else {
		t1 = (((T87*)(a1))->a21);
		t2 = (t1?((m2 = t1, EIF_TRUE)):EIF_FALSE);
		if (t2) {
			l1 = m2;
		} else {
			t1 = (((T87*)(a1))->a107);
			t2 = (t1?((m3 = t1, EIF_TRUE)):EIF_FALSE);
			if (t2) {
				t1 = (T102f11(ac, m3));
				l1 = (T70f147(ac, t1));
			} else {
				l1 = GE_ms8("unknown", 7);
			}
		}
	}
	t1 = (T26s66(ac));
	t2 = (T119s1(ac));
	if (t2) {
		l3 = (T17x2211872T0(ac, l1, GE_ms8(".bat", 4)));
	} else {
		l3 = (T17x2211872T0(ac, l1, GE_ms8(".sh", 3)));
	}
	t1 = (T26s44(ac));
	if (((T0*)(t1))->id==151) {
		T151f39(ac, t1, ge1869ov30621755);
	} else {
		T152f36(ac, t1, ge1869ov30621755);
	}
	t2 = (T26f68(ac, C));
	if (t2) {
		t1 = (T26s44(ac));
		t1 = (((((T0*)(t1))->id==151)?T151f5(ac, t1, l3):T152f5(ac, t1, l3)));
		l2 = T117c10(ac, t1);
		T117f11(ac, l2);
		l6 = (((T117*)(l2))->a1);
	} else {
		t2 = (T26f69(ac, C));
		if (t2) {
			l8 = (T44s2(ac, GE_ms8("gecc", 4)));
			t1 = (T17x2211872T0(ac, l8, GE_ms8(" --thread=", 10)));
			t3 = (T26f46(ac, C));
			t4 = (T6f7(ac, &t3));
			t1 = (T17x2211872T0(ac, t1, t4));
			t1 = (T17x2211872T0(ac, t1, GE_ms8(" ", 1)));
			t1 = (T17x2211872T0(ac, t1, l3));
			l2 = T117c10(ac, t1);
			T117f11(ac, l2);
			l6 = (((T117*)(l2))->a1);
		} else {
			t2 = (EIF_TRUE);
			if (t2) {
				t5 = (T26f46(ac, C));
				t1 = (T6f7(ac, &t5));
				t1 = (T17f5(ac, GE_ms8("--thread=", 9), t1));
				t1 = GE_ma34(ac, (T6)2, (T6)2,
t1,
l3);
				l5 = T118c11(ac, t1);
				l6 = (((T118*)(l5))->a1);
			} else {
				t1 = GE_ma34(ac, (T6)1, (T6)1,
l3);
				l5 = T118c11(ac, t1);
				l6 = (((T118*)(l5))->a1);
			}
		}
	}
	t1 = (T26s44(ac));
	t4 = (T26s44(ac));
	t4 = (((((T0*)(t4))->id==151)?ge421ov6144033:ge418ov6144033));
	if (((T0*)(t1))->id==151) {
		T151f39(ac, t1, t4);
	} else {
		T152f36(ac, t1, t4);
	}
	t1 = (T26s44(ac));
	t1 = (((((T0*)(t1))->id==151)?ge421ov6144043:ge418ov6144043));
	l4 = (T17x2211872T0(ac, l1, t1));
	t1 = (T26s44(ac));
	t4 = (T26s44(ac));
	t4 = (((((T0*)(t4))->id==151)?T151s8(ac, ge1869ov30621755, l4):T152s8(ac, ge1869ov30621755, l4)));
	if (((T0*)(t1))->id==151) {
		T151s40(ac, t4, l4);
	} else {
		T152s37(ac, t4, l4);
	}
	t2 = (T1)(!(T1)((l6) == ((T6)(GE_int32(0)))));
	if (t2) {
		((T26*)(C))->a1 = (T6)(GE_int32(1));
	}
	if (((T0*)(a2))->id==858) {
		T858f58(ac, a2, l7, GE_ms8("\rDegree -4", 10));
	} else {
		T66f71(ac, a2, l7, GE_ms8("\rDegree -4", 10));
	}
}

/* KL_UNIX_FILE_SYSTEM.rename_file */
void T152s37(TC* ac, T0* a1, T0* a2)
{
	T0* t1;
	t1 = (T152s25(ac));
	T43f74(ac, t1, a1);
	t1 = (T152s25(ac));
	T43f75(ac, t1, a2);
}

/* KL_TEXT_INPUT_FILE.change_name */
void T43f75(TC* ac, T0* C, T0* a1)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T1 volatile l1 = 0;
	T0* volatile l2 = 0;
	T0* volatile l3 = 0;
	T1 t1;
	T0* t2;
	T6 volatile t3;
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		t1 = ((T1)(!(l1)));
		if (t1) {
			l1 = EIF_TRUE;
			ac->in_rescue = tr;
			if (tr == 0) {
				ac->exception_code = 0;
				ac->exception_tag = (char*)0;
			}
			goto GE_retry;
		}
		ac->last_rescue = r.previous;
		GE_raise(GE_EX_FAIL);
	}
GE_retry:
	t1 = ((T1)(!(l1)));
	if (t1) {
		l3 = (T43f23(ac, C));
		t2 = (T43s22(ac));
		l2 = (T108s2(ac, a1));
		t2 = (T43f23(ac, C));
		t1 = (T1)(t2!=ge396ov6488072);
		if (t1) {
			t3 = (T17x2228263(ac, l2));
			t1 = (T6f4(ac, &t3, (T6)(GE_int32(0))));
		}
		if (t1) {
			t1 = (T43f35(ac, C));
			if (t1) {
				t1 = (T43f39(ac, C, l2));
				t1 = ((T1)(!(t1)));
				if (t1) {
					T43f78(ac, C, l2);
					((T43*)(C))->a1 = a1;
				}
			}
		}
	} else {
		t1 = (T1)(l3!=EIF_VOID);
		if (t1) {
		}
	}
	ac->last_rescue = r.previous;
}

/* KL_TEXT_INPUT_FILE.old_change_name */
void T43f78(TC* ac, T0* C, T0* a1)
{
	T43f80(ac, C, a1);
}

/* KL_TEXT_INPUT_FILE.rename_file */
void T43f80(TC* ac, T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	T14 t2;
	T14 t3;
	t1 = (T43f33(ac, C));
	l1 = (T166f7(ac, t1, a1, EIF_VOID));
	t1 = (T43f17(ac, C));
	t2 = (((T162*)(t1))->a1);
	t3 = (((T162*)(l1))->a1);
	T43s82(ac, t2, t3);
	T43f71(ac, C, a1);
}

/* KL_TEXT_INPUT_FILE.set_name */
void T43f71(TC* ac, T0* C, T0* a1)
{
	T0* t1;
	((T43*)(C))->a5 = a1;
	t1 = (T43f33(ac, C));
	((T43*)(C))->a6 = (T166f7(ac, t1, a1, ((T43*)(C))->a6));
}

/* KL_TEXT_INPUT_FILE.file_rename */
void T43s82(TC* ac, T14 a1, T14 a2)
{
	{
	eif_file_rename((EIF_FILENAME)(void*)a1,( EIF_FILENAME)(void*)a2);
	}
}

/* KL_TEXT_INPUT_FILE.internal_name_pointer */
T0* T43f17(TC* ac, T0* C)
{
	T0* R = 0;
	T0* m1 = 0;
	T1 t1;
	t1 = (((T43*)(C))->a6?((m1 = ((T43*)(C))->a6, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = m1;
	} else {
		if (!(EIF_FALSE)) {
			GE_raise_with_message(GE_EX_CHECK, "internal_name_pointer_set");
		}
	}
	return R;
}

/* KL_TEXT_INPUT_FILE.buffered_file_info */
T0* T43f33(TC* ac, T0* C)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[13]) {
		if (ac->thread_onces->reference_exception[13]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[13]);
		}
		return ac->thread_onces->reference_value[13];
	} else {
		ac->thread_onces->reference_status[13] = '\1';
		ac->thread_onces->reference_value[13] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[13] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T166c23(ac);
	ac->thread_onces->reference_value[13] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* KL_TEXT_INPUT_FILE.same_physical_file */
T1 T43f39(TC* ac, T0* C, T0* a1)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T1 volatile R = 0;
	T0* volatile l1 = 0;
	T0* volatile l2 = 0;
	T0* volatile l3 = 0;
	T0* volatile l4 = 0;
	T0* volatile l5 = 0;
	T0* volatile l6 = 0;
	T0* volatile l7 = 0;
	T6 volatile l8 = 0;
	T1 volatile l9 = 0;
	T6 volatile l10 = 0;
	T1 t1;
	T0* t2;
	T6 volatile t3;
	T6 t4;
	T6 t5;
	T0* t6;
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		t1 = ((T1)(!(l9)));
		if (t1) {
			l9 = EIF_TRUE;
			ac->in_rescue = tr;
			if (tr == 0) {
				ac->exception_code = 0;
				ac->exception_tag = (char*)0;
			}
			goto GE_retry;
		}
		ac->last_rescue = r.previous;
		GE_raise(GE_EX_FAIL);
	}
GE_retry:
	t1 = ((T1)(!(l9)));
	if (t1) {
		l6 = (T43f23(ac, C));
		t2 = (T43s22(ac));
		l7 = (T108s2(ac, a1));
		t2 = (T43f23(ac, C));
		t1 = (T1)(t2!=ge396ov6488072);
		if (t1) {
			t3 = (T17x2228263(ac, l7));
			t1 = (T6f4(ac, &t3, (T6)(GE_int32(0))));
		}
		if (t1) {
			t1 = (T43f35(ac, C));
			if (t1) {
				t2 = (T43s43(ac));
				T43f74(ac, t2, l7);
				t2 = (T43s43(ac));
				t1 = (T43f35(ac, t2));
				if (t1) {
					t2 = (T43f23(ac, C));
					t1 = (T17x2211860T0(ac, t2, l7));
					if (t1) {
						R = EIF_TRUE;
					} else {
						l5 = (T43f23(ac, C));
						t2 = (T43s43(ac));
						l10 = (T43f44(ac, t2));
						t4 = (T43f44(ac, C));
						t1 = (T1)(!(T1)((t4) == (l10)));
						if (t1) {
							R = EIF_FALSE;
						} else {
							t2 = (T43s43(ac));
							t4 = (T43f45(ac, t2));
							t5 = (T43f45(ac, C));
							t1 = (T1)(!(T1)((t4) == (t5)));
							if (t1) {
								R = EIF_FALSE;
							} else {
								t2 = (T43s43(ac));
								t4 = (T43f15(ac, t2));
								t5 = (T43f15(ac, C));
								t1 = (T1)(!(T1)((t4) == (t5)));
								if (t1) {
									R = EIF_FALSE;
								} else {
									t2 = (T43s46(ac));
									l1 = (((((T0*)(t2))->id==151)?T151f5(ac, t2, ((T43*)(C))->a1):T152f5(ac, t2, ((T43*)(C))->a1)));
									t2 = (T43s46(ac));
									l2 = (((((T0*)(t2))->id==151)?T151f5(ac, t2, a1):T152f5(ac, t2, a1)));
									t2 = (T43s22(ac));
									t1 = (T108s1(ac, l1, l2));
									if (t1) {
										R = EIF_TRUE;
									} else {
										t2 = (T43s46(ac));
										l3 = (((((T0*)(t2))->id==151)?T151s17(ac, l1):T152s17(ac, l1)));
										t2 = (T43s46(ac));
										l4 = (((((T0*)(t2))->id==151)?T151s17(ac, l2):T152s17(ac, l2)));
										t2 = (T43s22(ac));
										t1 = (T108s1(ac, l3, l4));
										if (t1) {
											R = EIF_TRUE;
										} else {
											l8 = (T6)(GE_int32(1));
											t2 = (T6f7(ac, (&l8)));
											l5 = (T17f5(ac, GE_ms8("gobotmp", 7), t2));
											t2 = (T43s43(ac));
											T43f74(ac, t2, l5);
											while (1) {
												t2 = (T43s43(ac));
												t1 = (T43f35(ac, t2));
												t1 = ((T1)(!(t1)));
												if (t1) {
													break;
												}
												l8 = ((T6)((l8)+((T6)(GE_int32(1)))));
												t2 = (T6f7(ac, (&l8)));
												l5 = (T17f5(ac, GE_ms8("gobotmp", 7), t2));
												t2 = (T43s43(ac));
												T43f74(ac, t2, l5);
											}
											t2 = (T43s43(ac));
											t6 = (T43f23(ac, C));
											T43f74(ac, t2, t6);
											t2 = (T43s43(ac));
											T43f75(ac, t2, l5);
											t1 = (T43f35(ac, C));
											t1 = ((T1)(!(t1)));
											if (t1) {
												t2 = (T43s43(ac));
												T43f74(ac, t2, l7);
												t2 = (T43s43(ac));
												t1 = (T43f35(ac, t2));
												R = ((T1)(!(t1)));
												t2 = (T43s43(ac));
												T43f74(ac, t2, l5);
												t2 = (T43s43(ac));
												t6 = (T43f23(ac, C));
												T43f75(ac, t2, t6);
											} else {
												R = EIF_TRUE;
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	} else {
		t1 = (T1)(l6!=EIF_VOID);
		if (t1) {
		}
		R = EIF_TRUE;
	}
	ac->last_rescue = r.previous;
	return R;
}

/* KL_UNIX_FILE_SYSTEM.canonical_pathname */
T0* T152s17(TC* ac, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = (T152s27(ac, a1));
	T1069f21(ac, l1);
	R = (T152s29(ac, l1));
	return R;
}

/* KL_UNIX_FILE_SYSTEM.pathname_to_string */
T0* T152s29(TC* ac, T0* a1)
{
	T0* R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	T0* t3;
	R = T17c49(ac, (T6)(GE_int32(50)));
	t1 = (((T1069*)(a1))->a5);
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (T152s20(ac));
		t3 = (T152s22(ac));
		R = (T108s5(ac, R, t3));
	}
	l2 = (((T1069*)(a1))->a1);
	l1 = (T6)(GE_int32(1));
	while (1) {
		t1 = (T6f14(ac, (&l1), l2));
		if (t1) {
			break;
		}
		t1 = (T1069f7(ac, a1, l1));
		if (t1) {
			t2 = (T152s20(ac));
			R = (T108s5(ac, R, ge418ov6144032));
		} else {
			t1 = (T1069f8(ac, a1, l1));
			if (t1) {
				t2 = (T152s20(ac));
				R = (T108s5(ac, R, ge418ov6144033));
			} else {
				t2 = (T152s20(ac));
				t3 = (T1069f9(ac, a1, l1));
				R = (T108s5(ac, R, t3));
			}
		}
		T17x2293809T2(ac, R, (T2)('/'));
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	t1 = (T1)((l1) == (l2));
	if (t1) {
		t1 = (T1069f7(ac, a1, l1));
		if (t1) {
			t2 = (T152s20(ac));
			R = (T108s5(ac, R, ge418ov6144032));
		} else {
			t1 = (T1069f8(ac, a1, l1));
			if (t1) {
				t2 = (T152s20(ac));
				R = (T108s5(ac, R, ge418ov6144033));
			} else {
				t2 = (T152s20(ac));
				t3 = (T1069f9(ac, a1, l1));
				R = (T108s5(ac, R, t3));
			}
		}
	}
	return R;
}

/* UC_UTF8_STRING.append_character */
void T1078f80(TC* ac, T0* C, T2 a1)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 volatile l3 = 0;
	T6 l4 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	t1 = (T2f10(ac, &a1, (T2)('\177')));
	if (t1) {
		l2 = (T6)(GE_int32(1));
	} else {
		t2 = (T1078s45(ac));
		l2 = (T168s27(ac, a1));
	}
	l1 = ((T6)((((T1078*)(C))->a3)+((T6)(GE_int32(1)))));
	l3 = ((T6)((((T1078*)(C))->a3)+(l2)));
	t3 = (T1078f61(ac, C));
	t1 = (T6f4(ac, (&l3), t3));
	if (t1) {
		T1078f100(ac, C, l3);
	}
	((T1078*)(C))->a3 = l3;
	t1 = (T1)((l2) == ((T6)(GE_int32(1))));
	if (t1) {
		l4 = ((T6)((((T1078*)(C))->a1)+((T6)(GE_int32(1)))));
		T1078f74(ac, C, ((T1078*)(C))->a3);
		T1078f101(ac, C, a1, l1);
		T1078f74(ac, C, l4);
	} else {
		t3 = ((T6)((((T1078*)(C))->a1)+((T6)(GE_int32(1)))));
		T1078f74(ac, C, t3);
		T1078f102(ac, C, a1, l2, l1);
	}
}

/* UC_UTF8_STRING.resize_byte_storage */
void T1078f100(TC* ac, T0* C, T6 a1)
{
	T6 l1 = 0;
	T6 t1;
	T1 t2;
	t1 = (T1078f61(ac, C));
	t2 = (T6f4(ac, &a1, t1));
	if (t2) {
		T1078f97(ac, C, a1);
		l1 = ((T1078*)(C))->a1;
		T1078f74(ac, C, a1);
		T1078f89(ac, C, a1);
		T1078f74(ac, C, l1);
	}
}

/* UC_UTF8_STRING.resize */
void T1078f97(TC* ac, T0* C, T6 a1)
{
	T6 t1;
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	((T1078*)(C))->a2 = (T15f4(ac, ((T1078*)(C))->a2, (T2)('\000'), t1));
}

/* UC_STRING.append_character */
void T919f77(TC* ac, T0* C, T2 a1)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 volatile l3 = 0;
	T6 l4 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	t1 = (T2f10(ac, &a1, (T2)('\177')));
	if (t1) {
		l2 = (T6)(GE_int32(1));
	} else {
		t2 = (T919s35(ac));
		l2 = (T168s27(ac, a1));
	}
	l1 = ((T6)((((T919*)(C))->a3)+((T6)(GE_int32(1)))));
	l3 = ((T6)((((T919*)(C))->a3)+(l2)));
	t3 = (T919f59(ac, C));
	t1 = (T6f4(ac, (&l3), t3));
	if (t1) {
		T919f97(ac, C, l3);
	}
	((T919*)(C))->a3 = l3;
	t1 = (T1)((l2) == ((T6)(GE_int32(1))));
	if (t1) {
		l4 = ((T6)((((T919*)(C))->a1)+((T6)(GE_int32(1)))));
		T919f90(ac, C, ((T919*)(C))->a3);
		T919f100(ac, C, a1, l1);
		T919f90(ac, C, l4);
	} else {
		t3 = ((T6)((((T919*)(C))->a1)+((T6)(GE_int32(1)))));
		T919f90(ac, C, t3);
		T919f101(ac, C, a1, l2, l1);
	}
}

/* UC_STRING.resize_byte_storage */
void T919f97(TC* ac, T0* C, T6 a1)
{
	T6 l1 = 0;
	T6 t1;
	T1 t2;
	t1 = (T919f59(ac, C));
	t2 = (T6f4(ac, &a1, t1));
	if (t2) {
		T919f95(ac, C, a1);
		l1 = ((T919*)(C))->a1;
		T919f90(ac, C, a1);
		T919f87(ac, C, a1);
		T919f90(ac, C, l1);
	}
}

/* UC_STRING.resize */
void T919f95(TC* ac, T0* C, T6 a1)
{
	T6 t1;
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	((T919*)(C))->a2 = (T15f4(ac, ((T919*)(C))->a2, (T2)('\000'), t1));
}

/* KL_PATHNAME.item */
T0* T1069f9(TC* ac, T0* C, T6 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (T1681f4(ac, ((T1069*)(C))->a6, a1));
	t1 = (T1)(l1!=EIF_VOID);
	if (!(t1)) {
		GE_raise_with_message(GE_EX_CHECK, "s_not_void");
	}
	R = l1;
	return R;
}

/* ARRAY [detachable STRING_8].item */
T0* T1681f4(TC* ac, T0* C, T6 a1)
{
	T0* R = 0;
	T6 t1;
	t1 = ((T6)((a1)-(((T1681*)(C))->a2)));
	R = (((T1112*)(((T1681*)(C))->a1))->z2[t1]);
	return R;
}

/* KL_PATHNAME.is_parent */
T1 T1069f8(TC* ac, T0* C, T6 a1)
{
	T1 R = 0;
	T0* t1;
	t1 = (T1069f9(ac, C, a1));
	R = (T1)(t1==ge403ov6602764);
	return R;
}

/* KL_PATHNAME.is_current */
T1 T1069f7(TC* ac, T0* C, T6 a1)
{
	T1 R = 0;
	T0* t1;
	t1 = (T1069f9(ac, C, a1));
	R = (T1)(t1==ge403ov6602763);
	return R;
}

/* KL_STRING_ROUTINES.appended_string */
T0* T108s5(TC* ac, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* m1 = 0;
	T0* m2 = 0;
	T1 t1;
	T0* t2;
	t1 = (EIF_TRUE);
	if (t1) {
		R = (T108s10(ac, a1, a2));
	} else {
		t1 = (a1?((m1 = a1, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t2 = (T108s6(ac, a2));
			T17x2326547T0(ac, m1, t2);
			R = m1;
		} else {
			t2 = (T41x2228284(ac, a1));
			t1 = EIF_FALSE;
			if (t1) {
				t2 = (T108s6(ac, a2));
				(m2, t2);
				R = m2;
			} else {
				R = (T108s10(ac, a1, a2));
			}
		}
	}
	return R;
}

/* UC_UTF8_STRING.to_string_32 */
T0* T1078f21(TC* ac, T0* C)
{
	T0* R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T6 volatile t2;
	T10 t3;
	R = T18c23(ac, ((T1078*)(C))->a1);
	l2 = ((T1078*)(C))->a3;
	l1 = (T6)(GE_int32(1));
	while (1) {
		t1 = (T6f4(ac, (&l1), l2));
		if (t1) {
			break;
		}
		t2 = (T1078f17(ac, C, l1));
		t3 = (T6f20(ac, &t2));
		T18f26(ac, R, t3);
		l1 = (T1078f18(ac, C, l1));
	}
	return R;
}

/* STRING_32.append_code */
void T18f26(TC* ac, T0* C, T10 a1)
{
	T6 volatile l1 = 0;
	T6 t1;
	T1 t2;
	l1 = ((T6)((((T18*)(C))->a2)+((T6)(GE_int32(1)))));
	t1 = (T18f5(ac, C));
	t2 = (T6f4(ac, (&l1), t1));
	if (t2) {
		T18f31(ac, C, l1);
	}
	T18f28(ac, C, l1);
	T18f29(ac, C, a1, l1);
}

/* STRING_32.put_code */
void T18f29(TC* ac, T0* C, T10 a1, T6 a2)
{
	T3 t1;
	T6 t2;
	t1 = ((T3)(a1));
	t2 = ((T6)((a2)-((T6)(GE_int32(1)))));
	((T16*)(((T18*)(C))->a1))->z2[t2] = (t1);
	T18f32(ac, C);
}

/* STRING_32.resize */
void T18f31(TC* ac, T0* C, T6 a1)
{
	T6 t1;
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	((T18*)(C))->a1 = (T16f4(ac, ((T18*)(C))->a1, (T3)(GE_nat32(0)), t1));
}

/* SPECIAL [CHARACTER_32].aliased_resized_area_with_default */
T0* T16f4(TC* ac, T0* C, T3 a1, T6 a2)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	R = (T16f5(ac, C, a2));
	t1 = (((T16*)(R))->a2);
	t2 = ((T6)((a2)-((T6)(GE_int32(1)))));
	T16f13(ac, R, a1, t1, t2);
	return R;
}

/* SPECIAL [CHARACTER_32].aliased_resized_area */
T0* T16f5(TC* ac, T0* C, T6 a1)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	{
	t1 = ((T16*)(C))->a1;
	if (a1 == t1) {
		R = C;
	} else {
		R = GE_new16(ac, a1, EIF_TRUE);
		t1 = ((T16*)(C))->a2;
		((T16*)(R))->a2 = ((t1 < a1)?t1:a1);
		t2 = ((T16*)(C))->a2;
		t1 = ((T16*)(R))->a2;
		if (t2 > t1) {
			t2 = t1;
		}
		if (t2 > 0) {
			memcpy((void*)(((T16*)(R))->z2), (void*)(((T16*)(C))->z2), t2 * sizeof(T3));
		}
	}
	}
	return R;
}

/* STRING_32.capacity */
T6 T18f5(TC* ac, T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = (((T16*)(((T18*)(C))->a1))->a2);
	R = ((T6)((t1)-((T6)(GE_int32(1)))));
	return R;
}

/* UC_STRING.to_string_32 */
T0* T919f61(TC* ac, T0* C)
{
	T0* R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T6 volatile t2;
	T10 t3;
	R = T18c23(ac, ((T919*)(C))->a1);
	l2 = ((T919*)(C))->a3;
	l1 = (T6)(GE_int32(1));
	while (1) {
		t1 = (T6f4(ac, (&l1), l2));
		if (t1) {
			break;
		}
		t2 = (T919f33(ac, C, l1));
		t3 = (T6f20(ac, &t2));
		T18f26(ac, R, t3);
		l1 = (T919f34(ac, C, l1));
	}
	return R;
}

/* STRING_8.to_string_32 */
T0* T17f19(TC* ac, T0* C)
{
	T0* R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T0* m1 = 0;
	T1 t1;
	T10 t2;
	t1 = EIF_FALSE;
	if (t1) {
		R = m1;
	} else {
		l2 = ((T17*)(C))->a2;
		R = T18c23(ac, l2);
		T18f28(ac, R, l2);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t1 = (T6f4(ac, (&l1), l2));
			if (t1) {
				break;
			}
			t2 = (T17f10(ac, C, l1));
			T18f29(ac, R, t2, l1);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* UC_UTF8_STRING.append_string_general */
void T1078f78(TC* ac, T0* C, T0* a1)
{
	T0* m1 = 0;
	T1 t1;
	t1 = (a1?((m1 = a1, T1078f78ot1(ac, a1))):EIF_FALSE);
	if (t1) {
		T1078f96(ac, C, m1);
	} else {
		T1078f78p1(ac, C, a1);
	}
}

T1 T1078f78ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 18:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* UC_UTF8_STRING.append_string_general */
void T1078f78p1(TC* ac, T0* C, T0* a1)
{
	T0* m1 = 0;
	T1 t1;
	t1 = (a1?((m1 = a1, T1078f78p1ot1(ac, a1))):EIF_FALSE);
	if (t1) {
		T1078f96(ac, C, m1);
	} else {
		T1078f78p0(ac, C, a1);
	}
}

T1 T1078f78p1ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 18:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* UC_UTF8_STRING.append */
void T1078f78p0(TC* ac, T0* C, T0* a1)
{
	T6 volatile l1 = 0;
	T6 volatile l2 = 0;
	T6 volatile l3 = 0;
	T1 t1;
	T6 t2;
	T10 t3;
	l1 = (T41x2228263(ac, a1));
	t1 = (T6f4(ac, (&l1), (T6)(GE_int32(0))));
	if (t1) {
		l2 = ((T6)((l1)+(((T1078*)(C))->a1)));
		t2 = (T1078f61(ac, C));
		t1 = (T6f4(ac, (&l2), t2));
		if (t1) {
			T1078f97(ac, C, l2);
		}
		l3 = (T6)(GE_int32(1));
		while (1) {
			t1 = (T6f4(ac, (&l3), l1));
			if (t1) {
				break;
			}
			t3 = (T41x2228225T6(ac, a1, l3));
			T1078f79(ac, C, t3);
			l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
		}
		T1078f89(ac, C, l2);
		T1078f98(ac, C);
	}
}

/* UC_UTF8_STRING.append_code */
void T1078f79(TC* ac, T0* C, T10 a1)
{
	T6 t1;
	t1 = ((T6)(a1));
	T1078f99(ac, C, t1);
}

/* UC_UTF8_STRING.append_item_code */
void T1078f99(TC* ac, T0* C, T6 a1)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 volatile l3 = 0;
	T0* t1;
	T6 t2;
	T1 t3;
	t1 = (T1078s45(ac));
	l2 = (T168s28(ac, a1));
	l1 = ((T6)((((T1078*)(C))->a3)+((T6)(GE_int32(1)))));
	l3 = ((T6)((((T1078*)(C))->a3)+(l2)));
	t2 = (T1078f61(ac, C));
	t3 = (T6f4(ac, (&l3), t2));
	if (t3) {
		T1078f100(ac, C, l3);
	}
	((T1078*)(C))->a3 = l3;
	t2 = ((T6)((((T1078*)(C))->a1)+((T6)(GE_int32(1)))));
	T1078f74(ac, C, t2);
	T1078f109(ac, C, a1, l2, l1);
}

/* UC_UTF8_STRING.append */
void T1078f96(TC* ac, T0* C, T0* a1)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T1 l6 = 0;
	T0* m1 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T0* t4;
	t1 = (T1078s42(ac));
	t2 = (T1070s1(ac, a1, ge488ov7995457));
	if (t2) {
		t1 = (T1078s45(ac));
		t3 = (T104x2228263(ac, a1));
		l1 = (T168s10(ac, a1, (T6)(GE_int32(1)), t3));
		t3 = (T104x2228263(ac, a1));
		t2 = (T1)((l1) == (t3));
		if (t2) {
			l4 = ((T6)((((T1078*)(C))->a3)+(l1)));
			l5 = ((T6)((((T1078*)(C))->a1)+(l1)));
			T1078f74(ac, C, ((T1078*)(C))->a3);
			T1078f89(ac, C, ((T1078*)(C))->a3);
			l6 = (EIF_TEST(GE_check_assert((EIF_FALSE))));
			T1078f96p1(ac, C, a1);
			l6 = (EIF_TEST(GE_check_assert((l6))));
			t3 = (T1078f61(ac, C));
			T1078f74(ac, C, t3);
			t3 = (T1078f61(ac, C));
			T1078f89(ac, C, t3);
			T1078f74(ac, C, l5);
			((T1078*)(C))->a3 = l4;
		} else {
			t3 = (T104x2228263(ac, a1));
			T1078f81(ac, C, a1, (T6)(GE_int32(1)), t3);
		}
	} else {
		t2 = (a1?((m1 = a1, T1078f96ot1(ac, a1))):EIF_FALSE);
		if (t2) {
			t2 = (a1?(T1078f96ot2(ac, a1)):EIF_FALSE);
			if (!(t2)) {
				t1 = (T1078s42(ac));
				t4 = (T1078s65(ac));
				t2 = (T1070s1(ac, m1, t4));
			}
			if (t2) {
				t2 = (T1)(m1==C);
				if (t2) {
					t3 = (T6)(GE_int32(2));
					l4 = ((T6)((t3)*(((T1078*)(C))->a3)));
					t3 = (T6)(GE_int32(2));
					l5 = ((T6)((t3)*(((T1078*)(C))->a1)));
					T1078f74(ac, C, ((T1078*)(C))->a3);
					T1078f89(ac, C, ((T1078*)(C))->a3);
					l6 = (EIF_TEST(GE_check_assert((EIF_FALSE))));
					T1078f96p1(ac, C, a1);
					l6 = (EIF_TEST(GE_check_assert((l6))));
					t3 = (T1078f61(ac, C));
					T1078f74(ac, C, t3);
					t3 = (T1078f61(ac, C));
					T1078f89(ac, C, t3);
					T1078f74(ac, C, l5);
					((T1078*)(C))->a3 = l4;
				} else {
					l3 = (((((T0*)(m1))->id==919)?((T919*)(m1))->a1:((T1078*)(m1))->a1));
					l2 = (((((T0*)(m1))->id==919)?((T919*)(m1))->a3:((T1078*)(m1))->a3));
					l4 = ((T6)((((T1078*)(C))->a3)+(l2)));
					l5 = ((T6)((((T1078*)(C))->a1)+(l3)));
					if (((T0*)(m1))->id==919) {
						T919f90(ac, m1, l2);
					} else {
						T1078f74(ac, m1, l2);
					}
					T1078f74(ac, C, ((T1078*)(C))->a3);
					T1078f89(ac, C, ((T1078*)(C))->a3);
					l6 = (EIF_TEST(GE_check_assert((EIF_FALSE))));
					T1078f96p1(ac, C, a1);
					l6 = (EIF_TEST(GE_check_assert((l6))));
					t3 = (T1078f61(ac, C));
					T1078f74(ac, C, t3);
					t3 = (T1078f61(ac, C));
					T1078f89(ac, C, t3);
					T1078f74(ac, C, l5);
					if (((T0*)(m1))->id==919) {
						T919f90(ac, m1, l3);
					} else {
						T1078f74(ac, m1, l3);
					}
					((T1078*)(C))->a3 = l4;
				}
			} else {
				t3 = (T104x2228263(ac, a1));
				T1078f81(ac, C, a1, (T6)(GE_int32(1)), t3);
			}
		} else {
			t3 = (T104x2228263(ac, a1));
			T1078f81(ac, C, a1, (T6)(GE_int32(1)), t3);
		}
	}
}

T1 T1078f96ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

T1 T1078f96ot2(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 1078:
		return EIF_TRUE;
	default:
		return EIF_FALSE;
	}
}

/* UC_UTF8_STRING.dummy_uc_string */
T0* T1078s65(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[17]) {
		if (ac->thread_onces->reference_exception[17]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[17]);
		}
		return ac->thread_onces->reference_value[17];
	} else {
		ac->thread_onces->reference_status[17] = '\1';
		ac->thread_onces->reference_value[17] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[17] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T919c83(ac);
	ac->thread_onces->reference_value[17] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* UC_UTF8_STRING.gobo_append_substring */
void T1078f81(TC* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 volatile l4 = 0;
	T0* l5 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = ((T6)((a3)-(a2)));
	l1 = ((T6)((t1)+((T6)(GE_int32(1)))));
	t2 = (T1)(!(T1)((l1) == ((T6)(GE_int32(0)))));
	if (t2) {
		t2 = (T1)(a1==C);
		if (t2) {
			l5 = (T1078f33(ac, C));
		} else {
			l5 = a1;
		}
		t3 = (T1078s45(ac));
		l3 = (T168s10(ac, l5, a2, a3));
		l2 = ((T6)((((T1078*)(C))->a3)+((T6)(GE_int32(1)))));
		l4 = ((T6)((((T1078*)(C))->a3)+(l3)));
		t1 = (T1078f61(ac, C));
		t2 = (T6f4(ac, (&l4), t1));
		if (t2) {
			T1078f100(ac, C, l4);
		}
		((T1078*)(C))->a3 = l4;
		t1 = ((T6)((((T1078*)(C))->a1)+(l1)));
		T1078f74(ac, C, t1);
		T1078f103(ac, C, l5, a2, a3, l3, l2);
	}
}

/* UC_UTF8_STRING.append */
void T1078f96p1(TC* ac, T0* C, T0* a1)
{
	T6 l1 = 0;
	T6 volatile l2 = 0;
	T6 volatile l3 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	l2 = (T104x2228263(ac, a1));
	t1 = (T6f4(ac, (&l2), (T6)(GE_int32(0))));
	if (t1) {
		l1 = ((T1078*)(C))->a1;
		l3 = ((T6)((l2)+(l1)));
		t2 = (T1078f61(ac, C));
		t1 = (T6f4(ac, (&l3), t2));
		if (t1) {
			t2 = (T1078f62(ac, C));
			t2 = ((T6)((l3)+(t2)));
			T1078f97(ac, C, t2);
		}
		t3 = (T104x2211878(ac, a1));
		t2 = (T104x2211879(ac, a1));
		T15f14(ac, ((T1078*)(C))->a2, t3, t2, l1, l2);
		((T1078*)(C))->a1 = l3;
		T1078f98(ac, C);
	}
}

/* UC_UTF8_STRING.additional_space */
T6 T1078f62(TC* ac, T0* C)
{
	T6 R = 0;
	T6 volatile t1;
	t1 = (T1078f61(ac, C));
	t1 = ((T6)((t1)/((T6)(GE_int32(2)))));
	R = (T6f16(ac, &t1, (T6)(GE_int32(5))));
	return R;
}

/* UC_STRING.append_string_general */
void T919f74(TC* ac, T0* C, T0* a1)
{
	T0* m1 = 0;
	T1 t1;
	t1 = (a1?((m1 = a1, T919f74ot1(ac, a1))):EIF_FALSE);
	if (t1) {
		T919f94(ac, C, m1);
	} else {
		T919f74p1(ac, C, a1);
	}
}

T1 T919f74ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 18:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* UC_STRING.append_string_general */
void T919f74p1(TC* ac, T0* C, T0* a1)
{
	T0* m1 = 0;
	T1 t1;
	t1 = (a1?((m1 = a1, T919f74p1ot1(ac, a1))):EIF_FALSE);
	if (t1) {
		T919f94(ac, C, m1);
	} else {
		T919f74p0(ac, C, a1);
	}
}

T1 T919f74p1ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 18:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* UC_STRING.append */
void T919f74p0(TC* ac, T0* C, T0* a1)
{
	T6 volatile l1 = 0;
	T6 volatile l2 = 0;
	T6 volatile l3 = 0;
	T1 t1;
	T6 t2;
	T10 t3;
	l1 = (T41x2228263(ac, a1));
	t1 = (T6f4(ac, (&l1), (T6)(GE_int32(0))));
	if (t1) {
		l2 = ((T6)((l1)+(((T919*)(C))->a1)));
		t2 = (T919f59(ac, C));
		t1 = (T6f4(ac, (&l2), t2));
		if (t1) {
			T919f95(ac, C, l2);
		}
		l3 = (T6)(GE_int32(1));
		while (1) {
			t1 = (T6f4(ac, (&l3), l1));
			if (t1) {
				break;
			}
			t3 = (T41x2228225T6(ac, a1, l3));
			T919f76(ac, C, t3);
			l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
		}
		T919f87(ac, C, l2);
		T919f96(ac, C);
	}
}

/* UC_STRING.append_code */
void T919f76(TC* ac, T0* C, T10 a1)
{
	T6 t1;
	t1 = ((T6)(a1));
	T919f99(ac, C, t1);
}

/* UC_STRING.append_item_code */
void T919f99(TC* ac, T0* C, T6 a1)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 volatile l3 = 0;
	T0* t1;
	T6 t2;
	T1 t3;
	t1 = (T919s35(ac));
	l2 = (T168s28(ac, a1));
	l1 = ((T6)((((T919*)(C))->a3)+((T6)(GE_int32(1)))));
	l3 = ((T6)((((T919*)(C))->a3)+(l2)));
	t2 = (T919f59(ac, C));
	t3 = (T6f4(ac, (&l3), t2));
	if (t3) {
		T919f97(ac, C, l3);
	}
	((T919*)(C))->a3 = l3;
	t2 = ((T6)((((T919*)(C))->a1)+((T6)(GE_int32(1)))));
	T919f90(ac, C, t2);
	T919f108(ac, C, a1, l2, l1);
}

/* UC_STRING.append */
void T919f94(TC* ac, T0* C, T0* a1)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T1 l6 = 0;
	T0* m1 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T0* t4;
	t1 = (T919s46(ac));
	t2 = (T1070s1(ac, a1, ge488ov7995457));
	if (t2) {
		t1 = (T919s35(ac));
		t3 = (T104x2228263(ac, a1));
		l1 = (T168s10(ac, a1, (T6)(GE_int32(1)), t3));
		t3 = (T104x2228263(ac, a1));
		t2 = (T1)((l1) == (t3));
		if (t2) {
			l4 = ((T6)((((T919*)(C))->a3)+(l1)));
			l5 = ((T6)((((T919*)(C))->a1)+(l1)));
			T919f90(ac, C, ((T919*)(C))->a3);
			T919f87(ac, C, ((T919*)(C))->a3);
			l6 = (EIF_TEST(GE_check_assert((EIF_FALSE))));
			T919f94p1(ac, C, a1);
			l6 = (EIF_TEST(GE_check_assert((l6))));
			t3 = (T919f59(ac, C));
			T919f90(ac, C, t3);
			t3 = (T919f59(ac, C));
			T919f87(ac, C, t3);
			T919f90(ac, C, l5);
			((T919*)(C))->a3 = l4;
		} else {
			t3 = (T104x2228263(ac, a1));
			T919f75(ac, C, a1, (T6)(GE_int32(1)), t3);
		}
	} else {
		t2 = (a1?((m1 = a1, T919f94ot1(ac, a1))):EIF_FALSE);
		if (t2) {
			t2 = (a1?(T919f94ot2(ac, a1)):EIF_FALSE);
			if (!(t2)) {
				t1 = (T919s46(ac));
				t4 = (T919s63(ac));
				t2 = (T1070s1(ac, m1, t4));
			}
			if (t2) {
				t2 = (T1)(m1==C);
				if (t2) {
					t3 = (T6)(GE_int32(2));
					l4 = ((T6)((t3)*(((T919*)(C))->a3)));
					t3 = (T6)(GE_int32(2));
					l5 = ((T6)((t3)*(((T919*)(C))->a1)));
					T919f90(ac, C, ((T919*)(C))->a3);
					T919f87(ac, C, ((T919*)(C))->a3);
					l6 = (EIF_TEST(GE_check_assert((EIF_FALSE))));
					T919f94p1(ac, C, a1);
					l6 = (EIF_TEST(GE_check_assert((l6))));
					t3 = (T919f59(ac, C));
					T919f90(ac, C, t3);
					t3 = (T919f59(ac, C));
					T919f87(ac, C, t3);
					T919f90(ac, C, l5);
					((T919*)(C))->a3 = l4;
				} else {
					l3 = (((((T0*)(m1))->id==919)?((T919*)(m1))->a1:((T1078*)(m1))->a1));
					l2 = (((((T0*)(m1))->id==919)?((T919*)(m1))->a3:((T1078*)(m1))->a3));
					l4 = ((T6)((((T919*)(C))->a3)+(l2)));
					l5 = ((T6)((((T919*)(C))->a1)+(l3)));
					if (((T0*)(m1))->id==919) {
						T919f90(ac, m1, l2);
					} else {
						T1078f74(ac, m1, l2);
					}
					T919f90(ac, C, ((T919*)(C))->a3);
					T919f87(ac, C, ((T919*)(C))->a3);
					l6 = (EIF_TEST(GE_check_assert((EIF_FALSE))));
					T919f94p1(ac, C, a1);
					l6 = (EIF_TEST(GE_check_assert((l6))));
					t3 = (T919f59(ac, C));
					T919f90(ac, C, t3);
					t3 = (T919f59(ac, C));
					T919f87(ac, C, t3);
					T919f90(ac, C, l5);
					if (((T0*)(m1))->id==919) {
						T919f90(ac, m1, l3);
					} else {
						T1078f74(ac, m1, l3);
					}
					((T919*)(C))->a3 = l4;
				}
			} else {
				t3 = (T104x2228263(ac, a1));
				T919f75(ac, C, a1, (T6)(GE_int32(1)), t3);
			}
		} else {
			t3 = (T104x2228263(ac, a1));
			T919f75(ac, C, a1, (T6)(GE_int32(1)), t3);
		}
	}
}

T1 T919f94ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

T1 T919f94ot2(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 1078:
		return EIF_TRUE;
	default:
		return EIF_FALSE;
	}
}

/* UC_STRING.dummy_uc_string */
T0* T919s63(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[17]) {
		if (ac->thread_onces->reference_exception[17]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[17]);
		}
		return ac->thread_onces->reference_value[17];
	} else {
		ac->thread_onces->reference_status[17] = '\1';
		ac->thread_onces->reference_value[17] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[17] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T919c83(ac);
	ac->thread_onces->reference_value[17] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* UC_STRING.gobo_append_substring */
void T919f75(TC* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 volatile l4 = 0;
	T0* l5 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = ((T6)((a3)-(a2)));
	l1 = ((T6)((t1)+((T6)(GE_int32(1)))));
	t2 = (T1)(!(T1)((l1) == ((T6)(GE_int32(0)))));
	if (t2) {
		t2 = (T1)(a1==C);
		if (t2) {
			l5 = (T919f44(ac, C));
		} else {
			l5 = a1;
		}
		t3 = (T919s35(ac));
		l3 = (T168s10(ac, l5, a2, a3));
		l2 = ((T6)((((T919*)(C))->a3)+((T6)(GE_int32(1)))));
		l4 = ((T6)((((T919*)(C))->a3)+(l3)));
		t1 = (T919f59(ac, C));
		t2 = (T6f4(ac, (&l4), t1));
		if (t2) {
			T919f97(ac, C, l4);
		}
		((T919*)(C))->a3 = l4;
		t1 = ((T6)((((T919*)(C))->a1)+(l1)));
		T919f90(ac, C, t1);
		T919f98(ac, C, l5, a2, a3, l3, l2);
	}
}

/* UC_STRING.append */
void T919f94p1(TC* ac, T0* C, T0* a1)
{
	T6 l1 = 0;
	T6 volatile l2 = 0;
	T6 volatile l3 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	l2 = (T104x2228263(ac, a1));
	t1 = (T6f4(ac, (&l2), (T6)(GE_int32(0))));
	if (t1) {
		l1 = ((T919*)(C))->a1;
		l3 = ((T6)((l2)+(l1)));
		t2 = (T919f59(ac, C));
		t1 = (T6f4(ac, (&l3), t2));
		if (t1) {
			t2 = (T919f60(ac, C));
			t2 = ((T6)((l3)+(t2)));
			T919f95(ac, C, t2);
		}
		t3 = (T104x2211878(ac, a1));
		t2 = (T104x2211879(ac, a1));
		T15f14(ac, ((T919*)(C))->a2, t3, t2, l1, l2);
		((T919*)(C))->a1 = l3;
		T919f96(ac, C);
	}
}

/* UC_STRING.additional_space */
T6 T919f60(TC* ac, T0* C)
{
	T6 R = 0;
	T6 volatile t1;
	t1 = (T919f59(ac, C));
	t1 = ((T6)((t1)/((T6)(GE_int32(2)))));
	R = (T6f16(ac, &t1, (T6)(GE_int32(5))));
	return R;
}

/* STRING_8.append_string_general */
void T17f64(TC* ac, T0* C, T0* a1)
{
	T0* m1 = 0;
	T1 t1;
	t1 = (a1?((m1 = a1, T17f64ot1(ac, a1))):EIF_FALSE);
	if (t1) {
		T17f53(ac, C, m1);
	} else {
		T17f64p1(ac, C, a1);
	}
}

T1 T17f64ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 18:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* STRING_8.append */
void T17f64p1(TC* ac, T0* C, T0* a1)
{
	T6 volatile l1 = 0;
	T6 volatile l2 = 0;
	T6 volatile l3 = 0;
	T1 t1;
	T6 t2;
	T10 t3;
	l1 = (T41x2228263(ac, a1));
	t1 = (T6f4(ac, (&l1), (T6)(GE_int32(0))));
	if (t1) {
		l2 = ((T6)((l1)+(((T17*)(C))->a2)));
		t2 = (T17f7(ac, C));
		t1 = (T6f4(ac, (&l2), t2));
		if (t1) {
			T17f54(ac, C, l2);
		}
		l3 = (T6)(GE_int32(1));
		while (1) {
			t1 = (T6f4(ac, (&l3), l1));
			if (t1) {
				break;
			}
			t3 = (T41x2228225T6(ac, a1, l3));
			T17f61(ac, C, t3);
			l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
		}
		T17f67(ac, C, l2);
		T17f55(ac, C);
	}
}

/* STRING_8.append */
void T17f53(TC* ac, T0* C, T0* a1)
{
	T6 l1 = 0;
	T6 volatile l2 = 0;
	T6 volatile l3 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	l2 = (T104x2228263(ac, a1));
	t1 = (T6f4(ac, (&l2), (T6)(GE_int32(0))));
	if (t1) {
		l1 = ((T17*)(C))->a2;
		l3 = ((T6)((l2)+(l1)));
		t2 = (T17f7(ac, C));
		t1 = (T6f4(ac, (&l3), t2));
		if (t1) {
			t2 = (T17f8(ac, C));
			t2 = ((T6)((l3)+(t2)));
			T17f54(ac, C, t2);
		}
		t3 = (T104x2211878(ac, a1));
		t2 = (T104x2211879(ac, a1));
		T15f14(ac, ((T17*)(C))->a1, t3, t2, l1, l2);
		((T17*)(C))->a2 = l3;
		T17f55(ac, C);
	}
}

/* KL_STRING_ROUTINES.as_readable_string_general_no_uc_string */
T0* T108s6(TC* ac, T0* a1)
{
	T0* R = 0;
	T0* m1 = 0;
	T1 t1;
	t1 = (a1?((m1 = a1, T108s6ot1(ac, a1))):EIF_FALSE);
	if (t1) {
		t1 = (EIF_TRUE);
		if (t1) {
			R = (((((T0*)(m1))->id==919)?T919f56(ac, m1):T1078f20(ac, m1)));
		} else {
			R = (((((T0*)(m1))->id==919)?T919f61(ac, m1):T1078f21(ac, m1)));
		}
	} else {
		R = a1;
	}
	return R;
}

T1 T108s6ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* KL_STRING_ROUTINES.appended_string_8 */
T0* T108s10(TC* ac, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* m1 = 0;
	T0* m2 = 0;
	T0* m3 = 0;
	T0* m4 = 0;
	T1 t1;
	t1 = (a1?((m1 = a1, T108s10ot1(ac, a1))):EIF_FALSE);
	if (t1) {
		if (((T0*)(m1))->id==919) {
			T919f74(ac, m1, a2);
		} else {
			T1078f78(ac, m1, a2);
		}
		R = m1;
	} else {
		t1 = (a2?((m2 = a2, T108s10ot2(ac, a2))):EIF_FALSE);
		if (t1) {
			R = (T108s11(ac, a1, a2));
		} else {
			t1 = (a1?((m3 = a1, EIF_TRUE)):EIF_FALSE);
			if (t1) {
				t1 = (a2?((m4 = a2, EIF_TRUE)):EIF_FALSE);
			}
			if (t1) {
				T17x2293820T0(ac, m3, m4);
				R = m3;
			} else {
				R = (T108s11(ac, a1, a2));
			}
		}
	}
	return R;
}

T1 T108s10ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

T1 T108s10ot2(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* UC_UTF8_STRING.append_string */
void T1078f77(TC* ac, T0* C, T0* a1)
{
	T1 t1;
	t1 = (T1)(a1!=EIF_VOID);
	if (t1) {
		T1078f96(ac, C, a1);
	}
}

/* UC_STRING.append_string */
void T919f80(TC* ac, T0* C, T0* a1)
{
	T1 t1;
	t1 = (T1)(a1!=EIF_VOID);
	if (t1) {
		T919f94(ac, C, a1);
	}
}

/* STRING_8.append_string */
void T17f50(TC* ac, T0* C, T0* a1)
{
	T1 t1;
	t1 = (T1)(a1!=EIF_VOID);
	if (t1) {
		T17f53(ac, C, a1);
	}
}

/* KL_STRING_ROUTINES.concat_string_8 */
T0* T108s11(TC* ac, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* m1 = 0;
	T0* m2 = 0;
	T0* m3 = 0;
	T0* m4 = 0;
	T1 t1;
	T0* t2;
	t1 = (a1?((m1 = a1, T108s11ot1(ac, a1))):EIF_FALSE);
	if (t1) {
		R = (((((T0*)(m1))->id==919)?T919f8(ac, m1, a2):T1078f31(ac, m1, a2)));
	} else {
		t1 = (a2?((m2 = a2, T108s11ot2(ac, a2))):EIF_FALSE);
		if (t1) {
			R = (((((T0*)(m2))->id==919)?T919f21(ac, m2, a1):T1078f19(ac, m2, a1)));
		} else {
			t1 = (a1?((m3 = a1, EIF_TRUE)):EIF_FALSE);
			if (t1) {
				t1 = (a2?((m4 = a2, EIF_TRUE)):EIF_FALSE);
			}
			if (t1) {
				t2 = (T104x2228277(ac, m3));
				R = (T17x2211872T0(ac, t2, m4));
			} else {
				t2 = (T919c73(ac, a1));
				R = (T919f8(ac, t2, a2));
			}
		}
	}
	return R;
}

T1 T108s11ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

T1 T108s11ot2(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* UC_STRING.make_from_string_general */
T0* T919c73(TC* ac, T0* a1)
{
	T0* C;
	T0* l1 = 0;
	T0* m1 = 0;
	T1 t1;
	T6 t2;
	C = GE_new919(ac, EIF_TRUE);
	t1 = (a1?((m1 = a1, T919f73ot1(ac, a1))):EIF_FALSE);
	if (t1) {
		l1 = m1;
		((T919*)(C))->a2 = (((((T0*)(l1))->id==919)?((T919*)(l1))->a2:((T1078*)(l1))->a2));
		t1 = (T1)(a1!=C);
		if (t1) {
			l1 = EIF_VOID;
		}
	}
	t1 = (T1)(l1!=EIF_VOID);
	if (t1) {
		((T919*)(C))->a2 = (((((T0*)(l1))->id==919)?((T919*)(l1))->a2:((T1078*)(l1))->a2));
	} else {
		t2 = (T41x2228263(ac, a1));
		T919f93(ac, C, a1, (T6)(GE_int32(1)), t2);
	}
	return C;
}

T1 T919f73ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* UC_UTF8_STRING.to_string_8 */
T0* T1078f32(TC* ac, T0* C)
{
	T0* R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T0* m1 = 0;
	T1 t1;
	T10 t2;
	t1 = (m1 = C, EIF_TRUE);
	if (t1) {
		R = m1;
	} else {
		l2 = ((T1078*)(C))->a1;
		R = T17c49(ac, l2);
		if (((T0*)(R))->id==1078) {
			T1078f89(ac, R, l2);
		} else {
			T17f67(ac, R, l2);
		}
		l1 = (T6)(GE_int32(1));
		while (1) {
			t1 = (T6f4(ac, (&l1), l2));
			if (t1) {
				break;
			}
			t2 = (T1078f48(ac, C, l1));
			if (((T0*)(R))->id==1078) {
				T1078f90(ac, R, t2, l1);
			} else {
				T17f70(ac, R, t2, l1);
			}
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* UC_UTF8_STRING.put_code */
void T1078f90(TC* ac, T0* C, T10 a1, T6 a2)
{
	T6 t1;
	t1 = ((T6)(a1));
	T1078f106(ac, C, t1, a2);
}

/* UC_UTF8_STRING.put_item_code */
void T1078f106(TC* ac, T0* C, T6 a1, T6 a2)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T6 volatile l5 = 0;
	T2 l6 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	T6 t4;
	t1 = (T1)((((T1078*)(C))->a1) == (((T1078*)(C))->a3));
	if (t1) {
		l1 = a2;
		l3 = (T6)(GE_int32(1));
	} else {
		l1 = (T1078f14(ac, C, a2));
		l6 = (T1078f16(ac, C, l1));
		t2 = (T1078s45(ac));
		l3 = (T168s2(ac, l6));
	}
	t2 = (T1078s45(ac));
	l4 = (T168s28(ac, a1));
	t1 = (T1)((l4) == (l3));
	if (t1) {
	} else {
		t1 = ((T1)((l4)<(l3)));
		if (t1) {
			t3 = ((T6)((l1)+(l3)));
			t4 = ((T6)((l3)-(l4)));
			T1078f107(ac, C, t3, t4);
		} else {
			l2 = ((T6)((l4)-(l3)));
			l5 = ((T6)((((T1078*)(C))->a3)+(l2)));
			t3 = (T1078f61(ac, C));
			t1 = (T6f4(ac, (&l5), t3));
			if (t1) {
				T1078f100(ac, C, l5);
			}
			t3 = ((T6)((l1)+(l3)));
			T1078f108(ac, C, t3, l2);
		}
	}
	T1078f109(ac, C, a1, l4, l1);
}

/* UC_UTF8_STRING.move_bytes_right */
void T1078f108(TC* ac, T0* C, T6 a1, T6 a2)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T2 t2;
	T6 t3;
	t1 = (T6f4(ac, &(((T1078*)(C))->a6), a1));
	if (t1) {
		T1078f94(ac, C);
	}
	l1 = ((T1078*)(C))->a3;
	l2 = a1;
	((T1078*)(C))->a3 = ((T6)((((T1078*)(C))->a3)+(a2)));
	l3 = ((T1078*)(C))->a1;
	T1078f74(ac, C, ((T1078*)(C))->a3);
	while (1) {
		t1 = ((T1)((l1)<(l2)));
		if (t1) {
			break;
		}
		t2 = (T1078f50(ac, C, l1));
		t3 = ((T6)((l1)+(a2)));
		T1078f101(ac, C, t2, t3);
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
	}
	T1078f74(ac, C, l3);
}

/* UC_UTF8_STRING.move_bytes_left */
void T1078f107(TC* ac, T0* C, T6 a1, T6 a2)
{
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 t1;
	T1 t2;
	T2 t3;
	t1 = ((T6)((a1)-(a2)));
	t2 = (T6f4(ac, &(((T1078*)(C))->a6), t1));
	if (t2) {
		T1078f94(ac, C);
	}
	l1 = a1;
	l2 = ((T1078*)(C))->a3;
	l3 = ((T1078*)(C))->a1;
	T1078f74(ac, C, ((T1078*)(C))->a3);
	while (1) {
		t2 = (T6f4(ac, (&l1), l2));
		if (t2) {
			break;
		}
		t3 = (T1078f50(ac, C, l1));
		t1 = ((T6)((l1)-(a2)));
		T1078f101(ac, C, t3, t1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	T1078f74(ac, C, l3);
	((T1078*)(C))->a3 = ((T6)((((T1078*)(C))->a3)-(a2)));
}

/* UC_STRING.to_string_8 */
T0* T919f9(TC* ac, T0* C)
{
	T0* R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T0* m1 = 0;
	T1 t1;
	T10 t2;
	t1 = (m1 = C, EIF_TRUE);
	if (t1) {
		R = m1;
	} else {
		l2 = ((T919*)(C))->a1;
		R = T17c49(ac, l2);
		if (((T0*)(R))->id==919) {
			T919f87(ac, R, l2);
		} else {
			T17f67(ac, R, l2);
		}
		l1 = (T6)(GE_int32(1));
		while (1) {
			t1 = (T6f4(ac, (&l1), l2));
			if (t1) {
				break;
			}
			t2 = (T919f10(ac, C, l1));
			if (((T0*)(R))->id==919) {
				T919f88(ac, R, t2, l1);
			} else {
				T17f70(ac, R, t2, l1);
			}
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* UC_STRING.put_code */
void T919f88(TC* ac, T0* C, T10 a1, T6 a2)
{
	T6 t1;
	t1 = ((T6)(a1));
	T919f105(ac, C, t1, a2);
}

/* UC_STRING.put_item_code */
void T919f105(TC* ac, T0* C, T6 a1, T6 a2)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T6 volatile l5 = 0;
	T2 l6 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	T6 t4;
	t1 = (T1)((((T919*)(C))->a1) == (((T919*)(C))->a3));
	if (t1) {
		l1 = a2;
		l3 = (T6)(GE_int32(1));
	} else {
		l1 = (T919f37(ac, C, a2));
		l6 = (T919f36(ac, C, l1));
		t2 = (T919s35(ac));
		l3 = (T168s2(ac, l6));
	}
	t2 = (T919s35(ac));
	l4 = (T168s28(ac, a1));
	t1 = (T1)((l4) == (l3));
	if (t1) {
	} else {
		t1 = ((T1)((l4)<(l3)));
		if (t1) {
			t3 = ((T6)((l1)+(l3)));
			t4 = ((T6)((l3)-(l4)));
			T919f106(ac, C, t3, t4);
		} else {
			l2 = ((T6)((l4)-(l3)));
			l5 = ((T6)((((T919*)(C))->a3)+(l2)));
			t3 = (T919f59(ac, C));
			t1 = (T6f4(ac, (&l5), t3));
			if (t1) {
				T919f97(ac, C, l5);
			}
			t3 = ((T6)((l1)+(l3)));
			T919f107(ac, C, t3, l2);
		}
	}
	T919f108(ac, C, a1, l4, l1);
}

/* UC_STRING.move_bytes_right */
void T919f107(TC* ac, T0* C, T6 a1, T6 a2)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T2 t2;
	T6 t3;
	t1 = (T6f4(ac, &(((T919*)(C))->a6), a1));
	if (t1) {
		T919f103(ac, C);
	}
	l1 = ((T919*)(C))->a3;
	l2 = a1;
	((T919*)(C))->a3 = ((T6)((((T919*)(C))->a3)+(a2)));
	l3 = ((T919*)(C))->a1;
	T919f90(ac, C, ((T919*)(C))->a3);
	while (1) {
		t1 = ((T1)((l1)<(l2)));
		if (t1) {
			break;
		}
		t2 = (T919f54(ac, C, l1));
		t3 = ((T6)((l1)+(a2)));
		T919f100(ac, C, t2, t3);
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
	}
	T919f90(ac, C, l3);
}

/* UC_STRING.move_bytes_left */
void T919f106(TC* ac, T0* C, T6 a1, T6 a2)
{
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 t1;
	T1 t2;
	T2 t3;
	t1 = ((T6)((a1)-(a2)));
	t2 = (T6f4(ac, &(((T919*)(C))->a6), t1));
	if (t2) {
		T919f103(ac, C);
	}
	l1 = a1;
	l2 = ((T919*)(C))->a3;
	l3 = ((T919*)(C))->a1;
	T919f90(ac, C, ((T919*)(C))->a3);
	while (1) {
		t2 = (T6f4(ac, (&l1), l2));
		if (t2) {
			break;
		}
		t3 = (T919f54(ac, C, l1));
		t1 = ((T6)((l1)-(a2)));
		T919f100(ac, C, t3, t1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	T919f90(ac, C, l3);
	((T919*)(C))->a3 = ((T6)((((T919*)(C))->a3)-(a2)));
}

/* STRING_8.to_string_8 */
T0* T17f20(TC* ac, T0* C)
{
	T0* R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T0* m1 = 0;
	T1 t1;
	T10 t2;
	t1 = (m1 = C, EIF_TRUE);
	if (t1) {
		R = m1;
	} else {
		l2 = ((T17*)(C))->a2;
		R = T17c49(ac, l2);
		T17f67(ac, R, l2);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t1 = (T6f4(ac, (&l1), l2));
			if (t1) {
				break;
			}
			t2 = (T17f10(ac, C, l1));
			T17f70(ac, R, t2, l1);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* UC_UTF8_STRING.prefixed_string */
T0* T1078f19(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T0* t1;
	T6 t2;
	t1 = (T1078s45(ac));
	t2 = (T41x2228263(ac, a1));
	t2 = (T168s10(ac, a1, (T6)(GE_int32(1)), t2));
	t2 = ((T6)((((T1078*)(C))->a3)+(t2)));
	R = T1078c85(ac, t2);
	T1078f78(ac, R, a1);
	T1078f77(ac, R, C);
	return R;
}

/* UC_STRING.prefixed_string */
T0* T919f21(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T0* t1;
	T6 t2;
	t1 = (T919s35(ac));
	t2 = (T41x2228263(ac, a1));
	t2 = (T168s10(ac, a1, (T6)(GE_int32(1)), t2));
	t2 = ((T6)((((T919*)(C))->a3)+(t2)));
	R = T919c84(ac, t2);
	T919f74(ac, R, a1);
	T919f80(ac, R, C);
	return R;
}

/* UC_UTF8_STRING.gobo_plus_general */
T0* T1078f31(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T0* t1;
	T6 t2;
	t1 = (T1078s45(ac));
	t2 = (T41x2228263(ac, a1));
	t2 = (T168s10(ac, a1, (T6)(GE_int32(1)), t2));
	t2 = ((T6)((((T1078*)(C))->a3)+(t2)));
	R = T1078c85(ac, t2);
	T1078f77(ac, R, C);
	T1078f78(ac, R, a1);
	return R;
}

/* UC_STRING.gobo_plus_general */
T0* T919f8(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T0* t1;
	T6 t2;
	t1 = (T919s35(ac));
	t2 = (T41x2228263(ac, a1));
	t2 = (T168s10(ac, a1, (T6)(GE_int32(1)), t2));
	t2 = ((T6)((((T919*)(C))->a3)+(t2)));
	R = T919c84(ac, t2);
	T919f80(ac, R, C);
	T919f74(ac, R, a1);
	return R;
}

/* KL_UNIX_FILE_SYSTEM.root_directory */
T0* T152s22(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[18]) {
		if (ac->thread_onces->reference_exception[18]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[18]);
		}
		return ac->thread_onces->reference_value[18];
	} else {
		ac->thread_onces->reference_status[18] = '\1';
		ac->thread_onces->reference_value[18] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[18] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = GE_ms8("/", 1);
	ac->thread_onces->reference_value[18] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* KL_UNIX_FILE_SYSTEM.string_ */
T0* T152s20(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[1]) {
		if (ac->thread_onces->reference_exception[1]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[1]);
		}
		return ac->thread_onces->reference_value[1];
	} else {
		ac->thread_onces->reference_status[1] = '\1';
		ac->thread_onces->reference_value[1] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[1] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T108c22(ac);
	ac->thread_onces->reference_value[1] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* KL_PATHNAME.set_canonical */
void T1069f21(TC* ac, T0* C)
{
	T6 volatile l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T1 t2;
	T6 t3;
	T0* t4;
	l3 = ((T1069*)(C))->a1;
	t2 = (T1)((l3) == ((T6)(GE_int32(1))));
	if (t2) {
		t1 = (T1069f7(ac, C, (T6)(GE_int32(1))));
	} else {
		t1 = EIF_FALSE;
	}
	if (t1) {
		t1 = ((T1069*)(C))->a5;
	}
	if (t1) {
	} else {
		l2 = (T6)(GE_int32(1));
		l1 = (T6)(GE_int32(1));
		while (1) {
			t1 = (T6f4(ac, (&l1), l3));
			if (t1) {
				break;
			}
			t1 = (T1069f7(ac, C, l1));
			if (t1) {
			} else {
				t1 = (T1069f8(ac, C, l1));
				if (t1) {
					t1 = (T1)((l2) == ((T6)(GE_int32(1))));
					if (!(t1)) {
						t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
						t1 = (T1069f8(ac, C, t3));
					}
					if (t1) {
						if (((T1069*)(C))->a5) {
							t4 = (T1069f9(ac, C, l1));
							T1681f10(ac, ((T1069*)(C))->a6, t4, l2);
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
					}
				} else {
					t4 = (T1069f9(ac, C, l1));
					T1681f10(ac, ((T1069*)(C))->a6, t4, l2);
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				}
			}
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		((T1069*)(C))->a1 = ((T6)((l2)-((T6)(GE_int32(1)))));
		while (1) {
			t1 = (T6f4(ac, (&l2), l3));
			if (t1) {
				break;
			}
			T1681f10(ac, ((T1069*)(C))->a6, EIF_VOID, l2);
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		}
		if (((T1069*)(C))->a5) {
			t1 = (T1)((((T1069*)(C))->a1) == ((T6)(GE_int32(0))));
		} else {
			t1 = EIF_FALSE;
		}
		if (t1) {
			T1069f23(ac, C);
		}
	}
}

/* KL_PATHNAME.append_current */
void T1069f23(TC* ac, T0* C)
{
	T1069f28(ac, C, ge403ov6602763);
}

/* KL_PATHNAME.append_name */
void T1069f28(TC* ac, T0* C, T0* a1)
{
	((T1069*)(C))->a1 = ((T6)((((T1069*)(C))->a1)+((T6)(GE_int32(1)))));
	T1681f11(ac, ((T1069*)(C))->a6, a1, ((T1069*)(C))->a1);
}

/* ARRAY [detachable STRING_8].force */
void T1681f11(TC* ac, T0* C, T0* a1, T6 a2)
{
	T6 l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T6 volatile l6 = 0;
	T1 l7 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	T6 t4;
	l3 = (T6f17(ac, &(((T1681*)(C))->a2), a2));
	l4 = (T6f16(ac, &(((T1681*)(C))->a3), a2));
	t1 = ((T6)((l4)-(l3)));
	l2 = ((T6)((t1)+((T6)(GE_int32(1)))));
	t1 = ((T6)((((T1681*)(C))->a3)+((T6)(GE_int32(1)))));
	t2 = (T1)((a2) == (t1));
	if (!(t2)) {
		t1 = ((T6)((((T1681*)(C))->a2)-((T6)(GE_int32(1)))));
		l7 = (T1)((a2) == (t1));
	} else {
		l7 = EIF_TRUE;
	}
	t2 = (T1681f5(ac, C));
	if (t2) {
		t1 = (T1681f6(ac, C));
		t1 = (T6f16(ac, (&l2), t1));
		T1681f13(ac, C, t1);
		t2 = ((T1)((l3)<(((T1681*)(C))->a2)));
		if (t2) {
			T1112f9(ac, ((T1681*)(C))->a1, a1);
			t2 = ((T1)(!(l7)));
			if (t2) {
				t3 = ((T0*)0);
				t1 = ((T6)((l2)-((T6)(GE_int32(1)))));
				T1112f7(ac, ((T1681*)(C))->a1, t3, (T6)(GE_int32(1)), t1);
			}
		} else {
			t2 = ((T1)(!(l7)));
			if (t2) {
				t3 = ((T0*)0);
				t1 = ((T6)((l2)-((T6)(GE_int32(2)))));
				T1112f7(ac, ((T1681*)(C))->a1, t3, (T6)(GE_int32(0)), t1);
			}
			T1112f9(ac, ((T1681*)(C))->a1, a1);
		}
	} else {
		l1 = (((T1112*)(((T1681*)(C))->a1))->a1);
		t2 = (T6f4(ac, (&l2), l1));
		if (t2) {
			t1 = (T1681f6(ac, C));
			t1 = ((T6)((l1)+(t1)));
			t1 = (T6f16(ac, (&l2), t1));
			t3 = (T1112f4(ac, ((T1681*)(C))->a1, t1));
			T1681f14(ac, C, t3);
		}
		t2 = ((T1)((l3)<(((T1681*)(C))->a2)));
		if (t2) {
			l6 = ((T6)((((T1681*)(C))->a2)-(l3)));
			l5 = (T1681f7(ac, C));
			t2 = ((T1)(!(l7)));
			if (t2) {
				t2 = (T6f4(ac, (&l6), l5));
			}
			if (t2) {
				t3 = ((T0*)0);
				t1 = ((T6)((l6)-((T6)(GE_int32(1)))));
				T1112f7(ac, ((T1681*)(C))->a1, t3, l5, t1);
			}
			T1112f10(ac, ((T1681*)(C))->a1, (T6)(GE_int32(0)), l6, l5);
			t2 = ((T1)(!(l7)));
			if (t2) {
				t3 = ((T0*)0);
				t1 = ((T6)((l6)-((T6)(GE_int32(1)))));
				T1112f7(ac, ((T1681*)(C))->a1, t3, (T6)(GE_int32(1)), t1);
			}
			((T1112*)(((T1681*)(C))->a1))->z2[(T6)(GE_int32(0))] = (a1);
		} else {
			t1 = (((T1112*)(((T1681*)(C))->a1))->a2);
			t2 = (T6f4(ac, (&l2), t1));
			if (t2) {
				t2 = ((T1)(!(l7)));
				if (t2) {
					t3 = ((T0*)0);
					t1 = (((T1112*)(((T1681*)(C))->a1))->a2);
					t4 = ((T6)((l2)-((T6)(GE_int32(2)))));
					T1112f7(ac, ((T1681*)(C))->a1, t3, t1, t4);
				}
				T1112f9(ac, ((T1681*)(C))->a1, a1);
			} else {
				t1 = ((T6)((a2)-(((T1681*)(C))->a2)));
				((T1112*)(((T1681*)(C))->a1))->z2[t1] = (a1);
			}
		}
	}
	((T1681*)(C))->a2 = l3;
	((T1681*)(C))->a3 = l4;
}

/* SPECIAL [detachable STRING_8].move_data */
void T1112f10(TC* ac, T0* C, T6 a1, T6 a2, T6 a3)
{
	T1 t1;
	T6 t2;
	t1 = (T1)((a1) == (a2));
	if (t1) {
	} else {
		t1 = (T6f4(ac, &a1, a2));
		if (t1) {
			t2 = ((T6)((a2)+(a3)));
			t1 = ((T1)((t2)<(a1)));
			if (t1) {
				T1112f11(ac, C, a1, a2, a3);
			} else {
				T1112f12(ac, C, a1, a2, a3);
			}
		} else {
			t2 = ((T6)((a1)+(a3)));
			t1 = ((T1)((t2)<(a2)));
			if (t1) {
				T1112f11(ac, C, a1, a2, a3);
			} else {
				T1112f12(ac, C, a1, a2, a3);
			}
		}
	}
}

/* SPECIAL [detachable STRING_8].overlapping_move */
void T1112f12(TC* ac, T0* C, T6 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T6 volatile t2;
	T0* t3;
	T6 t4;
	t1 = ((T1)((a1)<(a2)));
	if (t1) {
		t2 = ((T6)((a1)+(a3)));
		l1 = ((T6)((t2)-((T6)(GE_int32(1)))));
		l2 = ((T6)((a1)-((T6)(GE_int32(1)))));
		l3 = ((T6)((a2)-(a1)));
		t2 = ((T6)((a2)+(a3)));
		t1 = (T6f14(ac, &t2, ((T1112*)(C))->a2));
		if (t1) {
			t3 = (((T1112*)(C))->z2[a1]);
			t4 = ((T6)((a2)+(a3)));
			t4 = ((T6)((t4)-((T6)(GE_int32(1)))));
			T1112f7(ac, C, t3, ((T1112*)(C))->a2, t4);
		}
		while (1) {
			t1 = (T1)((l1) == (l2));
			if (t1) {
				break;
			}
			t3 = (((T1112*)(C))->z2[l1]);
			t4 = ((T6)((l1)+(l3)));
			((T1112*)(C))->z2[t4] = (t3);
			l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
		}
	} else {
		l1 = a1;
		l2 = ((T6)((a1)+(a3)));
		l3 = ((T6)((a1)-(a2)));
		while (1) {
			t1 = (T1)((l1) == (l2));
			if (t1) {
				break;
			}
			t3 = (((T1112*)(C))->z2[l1]);
			t4 = ((T6)((l1)-(l3)));
			T1112f13(ac, C, t3, t4);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
}

/* SPECIAL [detachable STRING_8].force */
void T1112f13(TC* ac, T0* C, T0* a1, T6 a2)
{
	T1 t1;
	t1 = ((T1)((a2)<(((T1112*)(C))->a2)));
	if (t1) {
		((T1112*)(C))->z2[a2] = (a1);
	} else {
		T1112f9(ac, C, a1);
	}
}

/* SPECIAL [detachable STRING_8].non_overlapping_move */
void T1112f11(TC* ac, T0* C, T6 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	l1 = a1;
	l2 = ((T6)((a1)+(a3)));
	l3 = ((T6)((a2)-(a1)));
	while (1) {
		t1 = (T1)((l1) == (l2));
		if (t1) {
			break;
		}
		t2 = (((T1112*)(C))->z2[l1]);
		t3 = ((T6)((l1)+(l3)));
		T1112f13(ac, C, t2, t3);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
}

/* ARRAY [detachable STRING_8].capacity */
T6 T1681f7(TC* ac, T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = ((T6)((((T1681*)(C))->a3)-(((T1681*)(C))->a2)));
	R = ((T6)((t1)+((T6)(GE_int32(1)))));
	return R;
}

/* ARRAY [detachable STRING_8].set_area */
void T1681f14(TC* ac, T0* C, T0* a1)
{
	((T1681*)(C))->a1 = a1;
}

/* SPECIAL [detachable STRING_8].aliased_resized_area */
T0* T1112f4(TC* ac, T0* C, T6 a1)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	{
	t1 = ((T1112*)(C))->a1;
	if (a1 == t1) {
		R = C;
	} else {
		R = GE_new1112(ac, a1, EIF_TRUE);
		t1 = ((T1112*)(C))->a2;
		((T1112*)(R))->a2 = ((t1 < a1)?t1:a1);
		t2 = ((T1112*)(C))->a2;
		t1 = ((T1112*)(R))->a2;
		if (t2 > t1) {
			t2 = t1;
		}
		if (t2 > 0) {
			memcpy((void*)(((T1112*)(R))->z2), (void*)(((T1112*)(C))->z2), t2 * sizeof(T0*));
		}
	}
	}
	return R;
}

/* SPECIAL [detachable STRING_8].fill_with */
void T1112f7(TC* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 t1;
	T1 t2;
	l1 = a2;
	t1 = ((T6)((a3)+((T6)(GE_int32(1)))));
	l3 = (T6f17(ac, &(((T1112*)(C))->a2), t1));
	l2 = l3;
	while (1) {
		t2 = (T1)((l1) == (l2));
		if (t2) {
			break;
		}
		((T1112*)(C))->z2[l1] = (a1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	l1 = l3;
	l2 = ((T6)((a3)+((T6)(GE_int32(1)))));
	while (1) {
		t2 = (T1)((l1) == (l2));
		if (t2) {
			break;
		}
		T1112f9(ac, C, a1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
}

/* SPECIAL [detachable STRING_8].extend */
void T1112f9(TC* ac, T0* C, T0* a1)
{
	T6 t1;
	{
	t1 = ((T1112*)(C))->a2;
	((T1112*)(C))->a2 = t1 + 1 ;
	((T1112*)(C))->z2[t1] = a1;
	}
}

/* ARRAY [detachable STRING_8].make_empty_area */
void T1681f13(TC* ac, T0* C, T6 a1)
{
	((T1681*)(C))->a1 = T1112c5(ac, a1);
}

/* SPECIAL [detachable STRING_8].make_empty */
void T1112f5(TC* ac, T0* C, T6 a1)
{
	{
	}
}

/* SPECIAL [detachable STRING_8].make_empty */
T0* T1112c5(TC* ac, T6 a1)
{
	T0* C;
	C = GE_new1112(ac, a1, EIF_TRUE);
	{
	}
	return C;
}

/* ARRAY [detachable STRING_8].additional_space */
T6 T1681f6(TC* ac, T0* C)
{
	T6 R = 0;
	T6 volatile t1;
	t1 = (T1681f7(ac, C));
	t1 = ((T6)((t1)/((T6)(GE_int32(2)))));
	R = (T6f16(ac, &t1, (T6)(GE_int32(5))));
	return R;
}

/* ARRAY [detachable STRING_8].empty_area */
T1 T1681f5(TC* ac, T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (((T1112*)(((T1681*)(C))->a1))->a1);
	R = (T1)((t1) == ((T6)(GE_int32(0))));
	return R;
}

/* ARRAY [detachable STRING_8].put */
void T1681f10(TC* ac, T0* C, T0* a1, T6 a2)
{
	T6 t1;
	t1 = ((T6)((a2)-(((T1681*)(C))->a2)));
	((T1112*)(((T1681*)(C))->a1))->z2[t1] = (a1);
}

/* KL_UNIX_FILE_SYSTEM.string_to_pathname */
T0* T152s27(TC* ac, T0* a1)
{
	T0* R = 0;
	T6 volatile l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T0* l5 = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	R = T1069c20(ac);
	l2 = (T17x2228263(ac, a1));
	t1 = (T6f4(ac, (&l2), (T6)(GE_int32(0))));
	if (t1) {
		t2 = (T17x2572289T6(ac, a1, (T6)(GE_int32(1))));
		t1 = (T1)(!(T1)((t2) == ((T2)('/'))));
		if (t1) {
			T1069f22(ac, R, EIF_TRUE);
		}
	} else {
		T1069f22(ac, R, EIF_TRUE);
	}
	l1 = (T6)(GE_int32(1));
	while (1) {
		t1 = (T6f4(ac, (&l1), l2));
		if (t1) {
			break;
		}
		while (1) {
			t1 = (T6f4(ac, (&l1), l2));
			if (!(t1)) {
				t2 = (T17x2572289T6(ac, a1, l1));
				t1 = (T1)(!(T1)((t2) == ((T2)('/'))));
			}
			if (t1) {
				break;
			}
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f15(ac, (&l1), l2));
		if (t1) {
			l3 = l1;
			while (1) {
				t1 = (T6f4(ac, (&l1), l2));
				if (!(t1)) {
					t2 = (T17x2572289T6(ac, a1, l1));
					t1 = (T1)((t2) == ((T2)('/')));
				}
				if (t1) {
					break;
				}
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			l4 = ((T6)((l1)-((T6)(GE_int32(1)))));
			l5 = (T17x2228304T6T6(ac, a1, l3, l4));
			t3 = (T152s20(ac));
			t1 = (T108s1(ac, l5, ge418ov6144032));
			if (t1) {
				T1069f23(ac, R);
			} else {
				t3 = (T152s20(ac));
				t1 = (T108s1(ac, l5, ge418ov6144033));
				if (t1) {
					T1069f24(ac, R);
				} else {
					T1069f28(ac, R, l5);
				}
			}
		}
	}
	return R;
}

/* KL_PATHNAME.append_parent */
void T1069f24(TC* ac, T0* C)
{
	T1069f28(ac, C, ge403ov6602764);
}

/* KL_PATHNAME.set_relative */
void T1069f22(TC* ac, T0* C, T1 a1)
{
	((T1069*)(C))->a5 = a1;
}

/* KL_PATHNAME.make */
T0* T1069c20(TC* ac)
{
	T0* C;
	C = GE_new1069(ac, EIF_TRUE);
	((T1069*)(C))->a6 = T1681c9(ac, EIF_VOID, (T6)(GE_int32(1)), (T6)(GE_int32(10)));
	return C;
}

/* ARRAY [detachable STRING_8].make_filled */
T0* T1681c9(TC* ac, T0* a1, T6 a2, T6 a3)
{
	T0* C;
	T6 l1 = 0;
	T1 t1;
	T6 t2;
	C = GE_new1681(ac, EIF_TRUE);
	((T1681*)(C))->a2 = a2;
	((T1681*)(C))->a3 = a3;
	t1 = (T6f15(ac, &a2, a3));
	if (t1) {
		t2 = ((T6)((a3)-(a2)));
		l1 = ((T6)((t2)+((T6)(GE_int32(1)))));
	}
	T1681f12(ac, C, a1, l1);
	return C;
}

/* ARRAY [detachable STRING_8].make_filled_area */
void T1681f12(TC* ac, T0* C, T0* a1, T6 a2)
{
	((T1681*)(C))->a1 = T1112c8(ac, a1, a2);
}

/* SPECIAL [detachable STRING_8].make_filled */
T0* T1112c8(TC* ac, T0* a1, T6 a2)
{
	T0* C;
	T6 t1;
	C = GE_new1112(ac, a2, EIF_TRUE);
	T1112f5(ac, C, a2);
	t1 = ((T6)((a2)-((T6)(GE_int32(1)))));
	T1112f7(ac, C, a1, (T6)(GE_int32(0)), t1);
	return C;
}

/* KL_WINDOWS_FILE_SYSTEM.canonical_pathname */
T0* T151s17(TC* ac, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = (T151s29(ac, a1));
	T1069f21(ac, l1);
	R = (T151s31(ac, l1));
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.pathname_to_string */
T0* T151s31(TC* ac, T0* a1)
{
	T0* R = 0;
	T6 volatile l1 = 0;
	T6 volatile l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T1 t1;
	T0* t2;
	T0* t3;
	R = T17c49(ac, (T6)(GE_int32(50)));
	l2 = (((T1069*)(a1))->a1);
	l3 = (((T1069*)(a1))->a2);
	t1 = (T1)(l3!=EIF_VOID);
	if (t1) {
		t2 = (T151s20(ac));
		R = (T108s5(ac, R, l3));
		T17x2293809T2(ac, R, (T2)('\\'));
	} else {
		l4 = (((T1069*)(a1))->a3);
		t1 = (T1)(l4!=EIF_VOID);
		if (t1) {
			T17x2293809T2(ac, R, (T2)('\\'));
			T17x2293809T2(ac, R, (T2)('\\'));
			t2 = (T151s20(ac));
			R = (T108s5(ac, R, l4));
			T17x2293809T2(ac, R, (T2)('\\'));
			l5 = (((T1069*)(a1))->a4);
			t1 = (T1)(l5!=EIF_VOID);
			if (t1) {
				t2 = (T151s20(ac));
				R = (T108s5(ac, R, l5));
				t1 = (T6f4(ac, (&l2), (T6)(GE_int32(0))));
				if (t1) {
					T17x2293809T2(ac, R, (T2)('\\'));
				}
			}
		} else {
			t1 = (((T1069*)(a1))->a5);
			t1 = ((T1)(!(t1)));
			if (t1) {
				t2 = (T151s20(ac));
				t3 = (T151s23(ac));
				R = (T108s5(ac, R, t3));
			}
		}
	}
	l1 = (T6)(GE_int32(1));
	while (1) {
		t1 = (T6f14(ac, (&l1), l2));
		if (t1) {
			break;
		}
		t1 = (T1069f7(ac, a1, l1));
		if (t1) {
			t2 = (T151s20(ac));
			R = (T108s5(ac, R, ge421ov6144032));
		} else {
			t1 = (T1069f8(ac, a1, l1));
			if (t1) {
				t2 = (T151s20(ac));
				R = (T108s5(ac, R, ge421ov6144033));
			} else {
				t2 = (T151s20(ac));
				t3 = (T1069f9(ac, a1, l1));
				R = (T108s5(ac, R, t3));
			}
		}
		T17x2293809T2(ac, R, (T2)('\\'));
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	t1 = (T1)((l1) == (l2));
	if (t1) {
		t1 = (T1069f7(ac, a1, l1));
		if (t1) {
			t2 = (T151s20(ac));
			R = (T108s5(ac, R, ge421ov6144032));
		} else {
			t1 = (T1069f8(ac, a1, l1));
			if (t1) {
				t2 = (T151s20(ac));
				R = (T108s5(ac, R, ge421ov6144033));
			} else {
				t2 = (T151s20(ac));
				t3 = (T1069f9(ac, a1, l1));
				R = (T108s5(ac, R, t3));
			}
		}
	}
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.root_directory */
T0* T151s23(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[19]) {
		if (ac->thread_onces->reference_exception[19]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[19]);
		}
		return ac->thread_onces->reference_value[19];
	} else {
		ac->thread_onces->reference_status[19] = '\1';
		ac->thread_onces->reference_value[19] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[19] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = GE_ms8("\\", 1);
	ac->thread_onces->reference_value[19] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.string_ */
T0* T151s20(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[1]) {
		if (ac->thread_onces->reference_exception[1]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[1]);
		}
		return ac->thread_onces->reference_value[1];
	} else {
		ac->thread_onces->reference_status[1] = '\1';
		ac->thread_onces->reference_value[1] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[1] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T108c22(ac);
	ac->thread_onces->reference_value[1] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.string_to_pathname */
T0* T151s29(TC* ac, T0* a1)
{
	T0* R = 0;
	T6 volatile l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T0* l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T1 t1;
	T2 t2;
	T1 t3;
	T0* t4;
	T6 t5;
	R = T1069c20(ac);
	T1069f22(ac, R, EIF_TRUE);
	l2 = (T17x2228263(ac, a1));
	t1 = (T6f4(ac, (&l2), (T6)(GE_int32(2))));
	if (t1) {
		t2 = (T17x2572289T6(ac, a1, (T6)(GE_int32(1))));
		t3 = (T151s21(ac, t2));
		if (t3) {
			t2 = (T17x2572289T6(ac, a1, (T6)(GE_int32(2))));
			t1 = (T151s21(ac, t2));
		} else {
			t1 = EIF_FALSE;
		}
	}
	if (t1) {
		l6 = EIF_TRUE;
		T1069f22(ac, R, EIF_FALSE);
		l1 = (T6)(GE_int32(3));
	} else {
		t1 = (T6f4(ac, (&l2), (T6)(GE_int32(0))));
		if (t1) {
			t2 = (T17x2572289T6(ac, a1, (T6)(GE_int32(1))));
			t1 = (T151s21(ac, t2));
		}
		if (t1) {
			T1069f22(ac, R, EIF_FALSE);
			l1 = (T6)(GE_int32(2));
		} else {
			l8 = EIF_TRUE;
			l1 = (T6)(GE_int32(1));
		}
	}
	while (1) {
		t1 = (T6f4(ac, (&l1), l2));
		if (t1) {
			break;
		}
		while (1) {
			t1 = (T6f4(ac, (&l1), l2));
			if (!(t1)) {
				t2 = (T17x2572289T6(ac, a1, l1));
				t3 = (T151s21(ac, t2));
				t1 = ((T1)(!(t3)));
			}
			if (t1) {
				break;
			}
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f15(ac, (&l1), l2));
		if (t1) {
			l3 = l1;
			while (1) {
				t1 = (T6f4(ac, (&l1), l2));
				if (!(t1)) {
					t2 = (T17x2572289T6(ac, a1, l1));
					t1 = (T151s21(ac, t2));
				}
				if (t1) {
					break;
				}
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			l4 = ((T6)((l1)-((T6)(GE_int32(1)))));
			l5 = (T17x2228304T6T6(ac, a1, l3, l4));
			t4 = (T151s20(ac));
			t1 = (T108s1(ac, l5, ge421ov6144032));
			if (t1) {
				T1069f23(ac, R);
				l7 = EIF_FALSE;
			} else {
				t4 = (T151s20(ac));
				t1 = (T108s1(ac, l5, ge421ov6144033));
				if (t1) {
					T1069f24(ac, R);
					l7 = EIF_FALSE;
				} else {
					if (l6) {
						T1069f25(ac, R, l5);
						l7 = EIF_TRUE;
					} else {
						if (l7) {
							T1069f26(ac, R, l5);
							l7 = EIF_FALSE;
						} else {
							if (l8) {
								t5 = (T17x2228263(ac, l5));
								t2 = (T17x2572289T6(ac, l5, t5));
								t1 = (T1)((t2) == ((T2)(':')));
								if (t1) {
									T1069f27(ac, R, l5);
									T1069f22(ac, R, EIF_FALSE);
								} else {
									T1069f28(ac, R, l5);
								}
							} else {
								T1069f28(ac, R, l5);
							}
						}
					}
				}
			}
			l6 = EIF_FALSE;
			l8 = EIF_FALSE;
		}
	}
	return R;
}

/* KL_PATHNAME.set_drive */
void T1069f27(TC* ac, T0* C, T0* a1)
{
	((T1069*)(C))->a2 = a1;
}

/* KL_PATHNAME.set_sharename */
void T1069f26(TC* ac, T0* C, T0* a1)
{
	((T1069*)(C))->a4 = a1;
}

/* KL_PATHNAME.set_hostname */
void T1069f25(TC* ac, T0* C, T0* a1)
{
	((T1069*)(C))->a3 = a1;
}

/* KL_WINDOWS_FILE_SYSTEM.is_directory_separator */
T1 T151s21(TC* ac, T2 a1)
{
	T1 R = 0;
	T1 t1;
	T2 t2;
	t1 = (T1)((a1) == ((T2)('\\')));
	if (!(t1)) {
		t2 = (T151s33(ac));
		R = (T1)((a1) == (t2));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.secondary_directory_separator */
T2 T151s33(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T2 R = 0;
	if (ac->thread_onces->character_8_status[0]) {
		if (ac->thread_onces->character_8_exception[0]) {
			GE_raise_once_exception(ac, ac->thread_onces->character_8_exception[0]);
		}
		return ac->thread_onces->character_8_value[0];
	} else {
		ac->thread_onces->character_8_status[0] = '\1';
		ac->thread_onces->character_8_value[0] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->character_8_exception[0] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = (T2)('/');
	ac->thread_onces->character_8_value[0] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* KL_STRING_ROUTINES.same_string */
T1 T108s1(TC* ac, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* m1 = 0;
	T0* m2 = 0;
	T1 t1;
	T6 t2;
	T6 t3;
	t1 = (T1)(a2==a1);
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T41x2228263(ac, a2));
		t3 = (T41x2228263(ac, a1));
		t1 = (T1)(!(T1)((t2) == (t3)));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t1 = (a1?((m1 = a1, T108s1ot1(ac, a1))):EIF_FALSE);
			if (t1) {
				R = (((((T0*)(m1))->id==919)?T919f25(ac, m1, a2):T1078f35(ac, m1, a2)));
			} else {
				t1 = (a2?((m2 = a2, T108s1ot2(ac, a2))):EIF_FALSE);
				if (t1) {
					R = (((((T0*)(m2))->id==919)?T919f25(ac, m2, a1):T1078f35(ac, m2, a1)));
				} else {
					R = (T41x2228269T0(ac, a1, a2));
				}
			}
		}
	}
	return R;
}

T1 T108s1ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

T1 T108s1ot2(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* UC_UTF8_STRING.same_string_general */
T1 T1078f36(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T10 volatile l4 = 0;
	T10 volatile l5 = 0;
	T10 l6 = 0;
	T0* m1 = 0;
	T1 t1;
	T6 volatile t2;
	T6 volatile t3;
	T6 volatile t4;
	T6 volatile t5;
	T6 volatile t6;
	t1 = (T1)(a1==C);
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T41x2228263(ac, a1));
		t1 = (T1)(!(T1)((t2) == (((T1078*)(C))->a1)));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t1 = (a1?((m1 = a1, T1078f36ot1(ac, a1))):EIF_FALSE);
			if (t1) {
				t1 = (EIF_TRUE);
				if (t1) {
					t2 = (T6)(GE_int32(255));
					l6 = (T6f20(ac, &t2));
				} else {
					l6 = (T10)(GE_nat32(4294967295));
				}
				l3 = ((T1078*)(C))->a3;
				l1 = (T6)(GE_int32(1));
				l2 = (T6)(GE_int32(1));
				R = EIF_TRUE;
				while (1) {
					t1 = (T6f4(ac, (&l1), l3));
					if (t1) {
						break;
					}
					t3 = (T1078f17(ac, C, l1));
					l4 = (T6f20(ac, &t3));
					t1 = (T10f12(ac, (&l4), l6));
					if (t1) {
						l4 = (T10)(GE_nat32(0));
					}
					t4 = (((((T0*)(m1))->id==919)?T919f33(ac, m1, l2):T1078f17(ac, m1, l2)));
					l5 = (T6f20(ac, &t4));
					t1 = (T10f12(ac, (&l5), l6));
					if (t1) {
						l5 = (T10)(GE_nat32(0));
					}
					t1 = (T1)(!(T1)((l4) == (l5)));
					if (t1) {
						R = EIF_FALSE;
						l1 = ((T6)((l3)+((T6)(GE_int32(1)))));
					} else {
						l1 = (T1078f18(ac, C, l1));
						l2 = (((((T0*)(m1))->id==919)?T919f34(ac, m1, l2):T1078f18(ac, m1, l2)));
					}
				}
			} else {
				t1 = (EIF_TRUE);
				if (t1) {
					t5 = (T6)(GE_int32(255));
					l6 = (T6f20(ac, &t5));
				} else {
					l6 = (T10)(GE_nat32(4294967295));
				}
				l3 = ((T1078*)(C))->a3;
				l1 = (T6)(GE_int32(1));
				l2 = (T6)(GE_int32(1));
				R = EIF_TRUE;
				while (1) {
					t1 = (T6f4(ac, (&l1), l3));
					if (t1) {
						break;
					}
					t6 = (T1078f17(ac, C, l1));
					l4 = (T6f20(ac, &t6));
					t1 = (T10f12(ac, (&l4), l6));
					if (t1) {
						l4 = (T10)(GE_nat32(0));
					}
					l5 = (T41x2228225T6(ac, a1, l2));
					t1 = (T10f12(ac, (&l5), l6));
					if (t1) {
						l5 = (T10)(GE_nat32(0));
					}
					t1 = (T1)(!(T1)((l4) == (l5)));
					if (t1) {
						R = EIF_FALSE;
						l1 = ((T6)((l3)+((T6)(GE_int32(1)))));
					} else {
						l1 = (T1078f18(ac, C, l1));
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
					}
				}
			}
		}
	}
	return R;
}

T1 T1078f36ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* UC_STRING.same_string_general */
T1 T919f26(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T10 volatile l4 = 0;
	T10 volatile l5 = 0;
	T10 l6 = 0;
	T0* m1 = 0;
	T1 t1;
	T6 volatile t2;
	T6 volatile t3;
	T6 volatile t4;
	T6 volatile t5;
	T6 volatile t6;
	t1 = (T1)(a1==C);
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T41x2228263(ac, a1));
		t1 = (T1)(!(T1)((t2) == (((T919*)(C))->a1)));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t1 = (a1?((m1 = a1, T919f26ot1(ac, a1))):EIF_FALSE);
			if (t1) {
				t1 = (EIF_TRUE);
				if (t1) {
					t2 = (T6)(GE_int32(255));
					l6 = (T6f20(ac, &t2));
				} else {
					l6 = (T10)(GE_nat32(4294967295));
				}
				l3 = ((T919*)(C))->a3;
				l1 = (T6)(GE_int32(1));
				l2 = (T6)(GE_int32(1));
				R = EIF_TRUE;
				while (1) {
					t1 = (T6f4(ac, (&l1), l3));
					if (t1) {
						break;
					}
					t3 = (T919f33(ac, C, l1));
					l4 = (T6f20(ac, &t3));
					t1 = (T10f12(ac, (&l4), l6));
					if (t1) {
						l4 = (T10)(GE_nat32(0));
					}
					t4 = (((((T0*)(m1))->id==919)?T919f33(ac, m1, l2):T1078f17(ac, m1, l2)));
					l5 = (T6f20(ac, &t4));
					t1 = (T10f12(ac, (&l5), l6));
					if (t1) {
						l5 = (T10)(GE_nat32(0));
					}
					t1 = (T1)(!(T1)((l4) == (l5)));
					if (t1) {
						R = EIF_FALSE;
						l1 = ((T6)((l3)+((T6)(GE_int32(1)))));
					} else {
						l1 = (T919f34(ac, C, l1));
						l2 = (((((T0*)(m1))->id==919)?T919f34(ac, m1, l2):T1078f18(ac, m1, l2)));
					}
				}
			} else {
				t1 = (EIF_TRUE);
				if (t1) {
					t5 = (T6)(GE_int32(255));
					l6 = (T6f20(ac, &t5));
				} else {
					l6 = (T10)(GE_nat32(4294967295));
				}
				l3 = ((T919*)(C))->a3;
				l1 = (T6)(GE_int32(1));
				l2 = (T6)(GE_int32(1));
				R = EIF_TRUE;
				while (1) {
					t1 = (T6f4(ac, (&l1), l3));
					if (t1) {
						break;
					}
					t6 = (T919f33(ac, C, l1));
					l4 = (T6f20(ac, &t6));
					t1 = (T10f12(ac, (&l4), l6));
					if (t1) {
						l4 = (T10)(GE_nat32(0));
					}
					l5 = (T41x2228225T6(ac, a1, l2));
					t1 = (T10f12(ac, (&l5), l6));
					if (t1) {
						l5 = (T10)(GE_nat32(0));
					}
					t1 = (T1)(!(T1)((l4) == (l5)));
					if (t1) {
						R = EIF_FALSE;
						l1 = ((T6)((l3)+((T6)(GE_int32(1)))));
					} else {
						l1 = (T919f34(ac, C, l1));
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
					}
				}
			}
		}
	}
	return R;
}

T1 T919f26ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* STRING_8.same_string_general */
T1 T17f17(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	T6 l1 = 0;
	T1 t1;
	T6 t2;
	t1 = (T1)(a1==C);
	if (t1) {
		R = EIF_TRUE;
	} else {
		l1 = ((T17*)(C))->a2;
		t2 = (T41x2228263(ac, a1));
		t1 = (T1)((l1) == (t2));
		if (t1) {
			t1 = (T1)((l1) == ((T6)(GE_int32(0))));
			if (!(t1)) {
				R = (T17f29(ac, C, a1, (T6)(GE_int32(1)), l1, (T6)(GE_int32(1))));
			} else {
				R = EIF_TRUE;
			}
		}
	}
	return R;
}

/* STRING_8.same_characters_general */
T1 T17f29(TC* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 volatile l3 = 0;
	T6 t1;
	T1 t2;
	T3 t3;
	T3 t4;
	t1 = ((T6)((a3)-(a2)));
	l3 = ((T6)((t1)+((T6)(GE_int32(1)))));
	t1 = ((T6)((((T17*)(C))->a2)-(a4)));
	t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
	t2 = (T6f15(ac, (&l3), t1));
	if (t2) {
		R = EIF_TRUE;
		l1 = a4;
		l2 = a2;
		l3 = ((T6)((l3)+(l1)));
		while (1) {
			t2 = (T1)((l1) == (l3));
			if (t2) {
				break;
			}
			t3 = (T17f11(ac, C, l1));
			t4 = (T41x2228226T6(ac, a1, l2));
			t2 = (T1)(!(T1)((t3) == (t4)));
			if (t2) {
				R = EIF_FALSE;
				l1 = ((T6)((l3)-((T6)(GE_int32(1)))));
			}
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* UC_UTF8_STRING.same_unicode_string */
T1 T1078f35(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T10 l4 = 0;
	T10 l5 = 0;
	T0* m1 = 0;
	T1 t1;
	T6 volatile t2;
	T6 volatile t3;
	T6 volatile t4;
	t1 = (T1)(a1==C);
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T41x2228263(ac, a1));
		t1 = (T1)(!(T1)((t2) == (((T1078*)(C))->a1)));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t1 = (a1?((m1 = a1, T1078f35ot1(ac, a1))):EIF_FALSE);
			if (t1) {
				l3 = ((T1078*)(C))->a3;
				l1 = (T6)(GE_int32(1));
				l2 = (T6)(GE_int32(1));
				R = EIF_TRUE;
				while (1) {
					t1 = (T6f4(ac, (&l1), l3));
					if (t1) {
						break;
					}
					t2 = (T1078f17(ac, C, l1));
					l4 = (T6f20(ac, &t2));
					t3 = (((((T0*)(m1))->id==919)?T919f33(ac, m1, l2):T1078f17(ac, m1, l2)));
					l5 = (T6f20(ac, &t3));
					t1 = (T1)(!(T1)((l4) == (l5)));
					if (t1) {
						R = EIF_FALSE;
						l1 = ((T6)((l3)+((T6)(GE_int32(1)))));
					} else {
						l1 = (T1078f18(ac, C, l1));
						l2 = (((((T0*)(m1))->id==919)?T919f34(ac, m1, l2):T1078f18(ac, m1, l2)));
					}
				}
			} else {
				l3 = ((T1078*)(C))->a3;
				l1 = (T6)(GE_int32(1));
				l2 = (T6)(GE_int32(1));
				R = EIF_TRUE;
				while (1) {
					t1 = (T6f4(ac, (&l1), l3));
					if (t1) {
						break;
					}
					t4 = (T1078f17(ac, C, l1));
					l4 = (T6f20(ac, &t4));
					l5 = (T41x2228225T6(ac, a1, l2));
					t1 = (T1)(!(T1)((l4) == (l5)));
					if (t1) {
						R = EIF_FALSE;
						l1 = ((T6)((l3)+((T6)(GE_int32(1)))));
					} else {
						l1 = (T1078f18(ac, C, l1));
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
					}
				}
			}
		}
	}
	return R;
}

T1 T1078f35ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* UC_STRING.same_unicode_string */
T1 T919f25(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T10 l4 = 0;
	T10 l5 = 0;
	T0* m1 = 0;
	T1 t1;
	T6 volatile t2;
	T6 volatile t3;
	T6 volatile t4;
	t1 = (T1)(a1==C);
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T41x2228263(ac, a1));
		t1 = (T1)(!(T1)((t2) == (((T919*)(C))->a1)));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t1 = (a1?((m1 = a1, T919f25ot1(ac, a1))):EIF_FALSE);
			if (t1) {
				l3 = ((T919*)(C))->a3;
				l1 = (T6)(GE_int32(1));
				l2 = (T6)(GE_int32(1));
				R = EIF_TRUE;
				while (1) {
					t1 = (T6f4(ac, (&l1), l3));
					if (t1) {
						break;
					}
					t2 = (T919f33(ac, C, l1));
					l4 = (T6f20(ac, &t2));
					t3 = (((((T0*)(m1))->id==919)?T919f33(ac, m1, l2):T1078f17(ac, m1, l2)));
					l5 = (T6f20(ac, &t3));
					t1 = (T1)(!(T1)((l4) == (l5)));
					if (t1) {
						R = EIF_FALSE;
						l1 = ((T6)((l3)+((T6)(GE_int32(1)))));
					} else {
						l1 = (T919f34(ac, C, l1));
						l2 = (((((T0*)(m1))->id==919)?T919f34(ac, m1, l2):T1078f18(ac, m1, l2)));
					}
				}
			} else {
				l3 = ((T919*)(C))->a3;
				l1 = (T6)(GE_int32(1));
				l2 = (T6)(GE_int32(1));
				R = EIF_TRUE;
				while (1) {
					t1 = (T6f4(ac, (&l1), l3));
					if (t1) {
						break;
					}
					t4 = (T919f33(ac, C, l1));
					l4 = (T6f20(ac, &t4));
					l5 = (T41x2228225T6(ac, a1, l2));
					t1 = (T1)(!(T1)((l4) == (l5)));
					if (t1) {
						R = EIF_FALSE;
						l1 = ((T6)((l3)+((T6)(GE_int32(1)))));
					} else {
						l1 = (T919f34(ac, C, l1));
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
					}
				}
			}
		}
	}
	return R;
}

T1 T919f25ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* KL_TEXT_INPUT_FILE.file_system */
T0* T43s46(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	T0* t1;
	T1 t2;
	if (ac->thread_onces->reference_status[20]) {
		if (ac->thread_onces->reference_exception[20]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[20]);
		}
		return ac->thread_onces->reference_value[20];
	} else {
		ac->thread_onces->reference_status[20] = '\1';
		ac->thread_onces->reference_value[20] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[20] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	t1 = (T43s53(ac));
	t2 = (T119s1(ac));
	if (t2) {
		R = (T43s54(ac));
		ac->thread_onces->reference_value[20] = R;
	} else {
		t1 = (T43s53(ac));
		t2 = (T119s2(ac));
		if (t2) {
			R = (T43s55(ac));
			ac->thread_onces->reference_value[20] = R;
		} else {
			R = (T43s55(ac));
			ac->thread_onces->reference_value[20] = R;
		}
	}
	ac->last_rescue = r.previous;
	return R;
}

/* KL_TEXT_INPUT_FILE.unix_file_system */
T0* T43s55(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[21]) {
		if (ac->thread_onces->reference_exception[21]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[21]);
		}
		return ac->thread_onces->reference_value[21];
	} else {
		ac->thread_onces->reference_status[21] = '\1';
		ac->thread_onces->reference_value[21] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[21] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T152c35(ac);
	ac->thread_onces->reference_value[21] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* KL_UNIX_FILE_SYSTEM.make */
T0* T152c35(TC* ac)
{
	T0* C;
	C = GE_new152(ac, EIF_TRUE);
	return C;
}

/* KL_OPERATING_SYSTEM.is_unix */
T1 T119s2(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	T6 volatile t2;
	T6 volatile t3;
	T2 t4;
	if (ac->thread_onces->boolean_status[0]) {
		if (ac->thread_onces->boolean_exception[0]) {
			GE_raise_once_exception(ac, ac->thread_onces->boolean_exception[0]);
		}
		return ac->thread_onces->boolean_value[0];
	} else {
		ac->thread_onces->boolean_status[0] = '\1';
		ac->thread_onces->boolean_value[0] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->boolean_exception[0] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	l2 = (T119s3(ac, GE_ms8("GOBO_OS", 7)));
	t1 = (T1)(l2!=EIF_VOID);
	if (t1) {
		t2 = (((T17*)(l2))->a2);
		t1 = (T6f4(ac, &t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		t1 = (T17f39(ac, l2, GE_ms8("unix", 4)));
		if (t1) {
			R = EIF_TRUE;
			ac->thread_onces->boolean_value[0] = R;
		}
	} else {
		l1 = (T119s4(ac));
		t3 = (((T17*)(l1))->a2);
		t1 = (T6f4(ac, &t3, (T6)(GE_int32(0))));
		if (t1) {
			t4 = (T17f24(ac, l1, (T6)(GE_int32(1))));
			R = (T1)((t4) == ((T2)('/')));
			ac->thread_onces->boolean_value[0] = R;
		}
	}
	ac->last_rescue = r.previous;
	return R;
}

/* KL_OPERATING_SYSTEM.current_working_directory */
T0* T119s4(TC* ac)
{
	T0* R = 0;
	T0* t1;
	t1 = (T119s5(ac));
	t1 = (T105s7(ac));
	R = (T1026f6(ac, t1));
	return R;
}

/* PATH.utf_8_name */
T0* T1026f6(TC* ac, T0* C)
{
	T0* R = 0;
	T40 l1 = GE_default40;
	T0* t1;
	t1 = (T1026f4(ac, C));
	R = (T40s3(ac, t1));
	return R;
}

/* PATH.name */
T0* T1026f4(TC* ac, T0* C)
{
	T0* R = 0;
	T40 l1 = GE_default40;
	T0* m1 = 0;
	T1 t1;
	T0* t2;
	t1 = (((T1026*)(C))->a1?((m1 = ((T1026*)(C))->a1, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = m1;
	} else {
		t1 = (EIF_IS_WINDOWS);
		if (t1) {
			t2 = (T40s11(ac, ((T1026*)(C))->a2));
			R = T20c18(ac, t2);
		} else {
			t2 = (T40s8(ac, ((T1026*)(C))->a2));
			R = T20c18(ac, t2);
		}
		((T1026*)(C))->a1 = R;
	}
	return R;
}

/* UTF_CONVERTER.utf_8_string_8_to_escaped_string_32 */
T0* T40s8(TC* ac, T0* a1)
{
	T0* R = 0;
	T6 t1;
	t1 = (((T17*)(a1))->a2);
	R = T18c23(ac, t1);
	T40s20(ac, a1, R);
	return R;
}

/* UTF_CONVERTER.utf_8_string_8_into_escaped_string_32 */
void T40s20(TC* ac, T0* a1, T0* a2)
{
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T8 volatile l3 = 0;
	T8 l4 = 0;
	T8 l5 = 0;
	T8 l6 = 0;
	T3 l7 = 0;
	T6 t1;
	T1 t2;
	T10 t3;
	T3 t4;
	T8 t5;
	T8 t6;
	T10 t7;
	T9 t8;
	T1 t9;
	l2 = (((T17*)(a1))->a2);
	t1 = (((T18*)(a2))->a2);
	t1 = ((T6)((t1)+(l2)));
	T18f35(ac, a2, t1);
	while (1) {
		t2 = (T6f14(ac, (&l1), l2));
		if (t2) {
			break;
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t3 = (T17f10(ac, a1, l1));
		l3 = ((T8)(t3));
		t2 = (T8f9(ac, (&l3), (T8)(GE_nat8(127))));
		if (t2) {
			t4 = ((T3)(l3));
			T18f36(ac, a2, t4);
		} else {
			t5 = ((T8)((l3)&((T8)(GE_nat8(224)))));
			t6 = ((T8)((T6)(GE_int32(192))));
			t2 = (T1)((t5) == (t6));
			if (t2) {
				t2 = ((T1)((l1)<(l2)));
				if (t2) {
					t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					t3 = (T17f10(ac, a1, t1));
					l4 = ((T8)(t3));
					t5 = ((T8)((l4)&((T8)(GE_nat8(192)))));
					t6 = ((T8)((T6)(GE_int32(128))));
					t2 = (T1)((t5) == (t6));
					if (t2) {
						t3 = ((T10)(l3));
						t3 = ((T10)((t3)&((T10)(GE_nat32(31)))));
						t3 = ((T10)((t3)<<((T6)(GE_int32(6)))));
						t7 = ((T10)(l4));
						t7 = ((T10)((t7)&((T10)(GE_nat32(63)))));
						t3 = ((T10)((t3)|(t7)));
						t4 = ((T3)(t3));
						T18f36(ac, a2, t4);
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					} else {
						t8 = (T8f12(ac, (&l3)));
						T40s24(ac, a2, t8);
					}
				} else {
					t8 = (T8f12(ac, (&l3)));
					T40s24(ac, a2, t8);
				}
			} else {
				t5 = ((T8)((l3)&((T8)(GE_nat8(240)))));
				t6 = ((T8)((T6)(GE_int32(224))));
				t2 = (T1)((t5) == (t6));
				if (t2) {
					t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					t2 = ((T1)((t1)<(l2)));
					if (t2) {
						t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						t3 = (T17f10(ac, a1, t1));
						l4 = ((T8)(t3));
						t1 = ((T6)((l1)+((T6)(GE_int32(2)))));
						t3 = (T17f10(ac, a1, t1));
						l5 = ((T8)(t3));
						t5 = ((T8)((l4)&((T8)(GE_nat8(192)))));
						t6 = ((T8)((T6)(GE_int32(128))));
						t2 = (T1)((t5) == (t6));
						if (t2) {
							t5 = ((T8)((l5)&((T8)(GE_nat8(192)))));
							t6 = ((T8)((T6)(GE_int32(128))));
							t2 = (T1)((t5) == (t6));
						}
						if (t2) {
							t3 = ((T10)(l3));
							t3 = ((T10)((t3)&((T10)(GE_nat32(15)))));
							t3 = ((T10)((t3)<<((T6)(GE_int32(12)))));
							t7 = ((T10)(l4));
							t7 = ((T10)((t7)&((T10)(GE_nat32(63)))));
							t7 = ((T10)((t7)<<((T6)(GE_int32(6)))));
							t3 = ((T10)((t3)|(t7)));
							t7 = ((T10)(l5));
							t7 = ((T10)((t7)&((T10)(GE_nat32(63)))));
							t3 = ((T10)((t3)|(t7)));
							l7 = ((T3)(t3));
							T18f36(ac, a2, l7);
							l1 = ((T6)((l1)+((T6)(GE_int32(2)))));
						} else {
							t8 = (T8f12(ac, (&l3)));
							T40s24(ac, a2, t8);
						}
					} else {
						t8 = (T8f12(ac, (&l3)));
						T40s24(ac, a2, t8);
					}
				} else {
					t5 = ((T8)((l3)&((T8)(GE_nat8(248)))));
					t6 = ((T8)((T6)(GE_int32(240))));
					t2 = (T1)((t5) == (t6));
					if (t2) {
						t1 = ((T6)((l1)+((T6)(GE_int32(2)))));
						t2 = ((T1)((t1)<(l2)));
						if (t2) {
							t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
							t3 = (T17f10(ac, a1, t1));
							l4 = ((T8)(t3));
							t1 = ((T6)((l1)+((T6)(GE_int32(2)))));
							t3 = (T17f10(ac, a1, t1));
							l5 = ((T8)(t3));
							t1 = ((T6)((l1)+((T6)(GE_int32(3)))));
							t3 = (T17f10(ac, a1, t1));
							l6 = ((T8)(t3));
							t5 = ((T8)((l4)&((T8)(GE_nat8(192)))));
							t6 = ((T8)((T6)(GE_int32(128))));
							t9 = (T1)((t5) == (t6));
							if (t9) {
								t5 = ((T8)((l5)&((T8)(GE_nat8(192)))));
								t6 = ((T8)((T6)(GE_int32(128))));
								t2 = (T1)((t5) == (t6));
							} else {
								t2 = EIF_FALSE;
							}
							if (t2) {
								t5 = ((T8)((l6)&((T8)(GE_nat8(192)))));
								t6 = ((T8)((T6)(GE_int32(128))));
								t2 = (T1)((t5) == (t6));
							}
							if (t2) {
								t3 = ((T10)(l3));
								t3 = ((T10)((t3)&((T10)(GE_nat32(7)))));
								t3 = ((T10)((t3)<<((T6)(GE_int32(18)))));
								t7 = ((T10)(l4));
								t7 = ((T10)((t7)&((T10)(GE_nat32(63)))));
								t7 = ((T10)((t7)<<((T6)(GE_int32(12)))));
								t3 = ((T10)((t3)|(t7)));
								t7 = ((T10)(l5));
								t7 = ((T10)((t7)&((T10)(GE_nat32(63)))));
								t7 = ((T10)((t7)<<((T6)(GE_int32(6)))));
								t3 = ((T10)((t3)|(t7)));
								t7 = ((T10)(l6));
								t7 = ((T10)((t7)&((T10)(GE_nat32(63)))));
								t3 = ((T10)((t3)|(t7)));
								t4 = ((T3)(t3));
								T18f36(ac, a2, t4);
								l1 = ((T6)((l1)+((T6)(GE_int32(3)))));
							} else {
								t8 = (T8f12(ac, (&l3)));
								T40s24(ac, a2, t8);
							}
						} else {
							t8 = (T8f12(ac, (&l3)));
							T40s24(ac, a2, t8);
						}
					} else {
						t8 = (T8f12(ac, (&l3)));
						T40s24(ac, a2, t8);
					}
				}
			}
		}
	}
}

/* UTF_CONVERTER.escape_code_into */
void T40s24(TC* ac, T0* a1, T9 a2)
{
	T8 volatile t1;
	T9 t2;
	T1 t3;
	T8 volatile t4;
	T0* t5;
	T18f25(ac, a1, (T3)(GE_nat32(65533)));
	t1 = (T8)(GE_nat8(255));
	t2 = (T8f12(ac, &t1));
	t3 = (T9f10(ac, &a2, t2));
	if (t3) {
		t4 = ((T8)(a2));
		t5 = (T8f14(ac, &t4));
		T18f24(ac, a1, t5);
	} else {
		T18f25(ac, a1, (T3)(GE_nat32(117)));
		t5 = (T9f12(ac, &a2));
		T18f24(ac, a1, t5);
	}
}

/* NATURAL_16.to_hex_string */
T0* T9f12(TC* ac, T9 volatile* C)
{
	T0* R = 0;
	T6 l1 = 0;
	T9 l2 = 0;
	T6 t1;
	T1 t2;
	T9 volatile t3;
	T2 t4;
	t1 = (T6)(GE_int32(16));
	l1 = ((T6)((t1)/((T6)(GE_int32(4)))));
	R = T17c60(ac, (T2)('0'), l1);
	l2 = *C;
	while (1) {
		t2 = (T1)((l1) == ((T6)(GE_int32(0))));
		if (t2) {
			break;
		}
		t3 = ((T9)((l2)&((T9)(GE_nat16(15)))));
		t4 = (T9f15(ac, &t3));
		T17f77(ac, R, t4, l1);
		l2 = ((T9)((l2)>>((T6)(GE_int32(4)))));
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
	}
	return R;
}

/* STRING_8.put */
void T17f77(TC* ac, T0* C, T2 a1, T6 a2)
{
	T6 t1;
	t1 = ((T6)((a2)-((T6)(GE_int32(1)))));
	((T15*)(((T17*)(C))->a1))->z2[t1] = (a1);
	T17f55(ac, C);
}

/* NATURAL_16.to_hex_character */
T2 T9f15(TC* ac, T9 volatile* C)
{
	T2 R = 0;
	T6 volatile l1 = 0;
	T2 volatile t1;
	T1 t2;
	T2 volatile t3;
	l1 = (T9f5(ac, &(*C)));
	t2 = (T6f15(ac, (&l1), (T6)(GE_int32(9))));
	if (t2) {
		t1 = (T2)('0');
	} else {
		t3 = (T2)('A');
		t1 = (T2f32(ac, &t3, (T6)(GE_int32(10))));
	}
	R = (T2f33(ac, &t1, l1));
	return R;
}

/* CHARACTER_8.plus */
T2 T2f33(TC* ac, T2 volatile* C, T6 a1)
{
	T2 R = 0;
	T6 t1;
	t1 = ((T6)(*C));
	t1 = ((T6)((t1)+(a1)));
	R = ((T2)(t1));
	return R;
}

/* CHARACTER_8.minus */
T2 T2f32(TC* ac, T2 volatile* C, T6 a1)
{
	T2 R = 0;
	T6 t1;
	t1 = ((T6)(*C));
	t1 = ((T6)((t1)-(a1)));
	R = ((T2)(t1));
	return R;
}

/* NATURAL_16.to_integer_32 */
T6 T9f5(TC* ac, T9 volatile* C)
{
	T6 R = 0;
	R = ((T6)(*C));
	return R;
}

/* STRING_8.make_filled */
T0* T17c60(TC* ac, T2 a1, T6 a2)
{
	T0* C;
	C = GE_new17(ac, EIF_TRUE);
	T17f49(ac, C, a2);
	T17f71(ac, C, a1);
	return C;
}

/* STRING_8.fill_character */
void T17f71(TC* ac, T0* C, T2 a1)
{
	T6 l1 = 0;
	T1 t1;
	T6 t2;
	l1 = (T17f7(ac, C));
	t1 = (T1)(!(T1)((l1) == ((T6)(GE_int32(0)))));
	if (t1) {
		t2 = ((T6)((l1)-((T6)(GE_int32(1)))));
		T15f15(ac, ((T17*)(C))->a1, a1, (T6)(GE_int32(0)), t2);
		((T17*)(C))->a2 = l1;
		((T17*)(C))->a3 = (T6)(GE_int32(0));
		((T17*)(C))->a4 = (T6)(GE_int32(0));
	}
}

/* STRING_32.append_string_general */
void T18f24(TC* ac, T0* C, T0* a1)
{
	T0* m1 = 0;
	T1 t1;
	t1 = (a1?((m1 = a1, T18f24ot1(ac, a1))):EIF_FALSE);
	if (t1) {
		T18f30(ac, C, m1);
	} else {
		T18f24p1(ac, C, a1);
	}
}

T1 T18f24ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 18:
		return EIF_TRUE;
	default:
		return EIF_FALSE;
	}
}

/* STRING_32.append */
void T18f24p1(TC* ac, T0* C, T0* a1)
{
	T6 volatile l1 = 0;
	T6 volatile l2 = 0;
	T6 volatile l3 = 0;
	T1 t1;
	T6 t2;
	T10 t3;
	l1 = (T41x2228263(ac, a1));
	t1 = (T6f4(ac, (&l1), (T6)(GE_int32(0))));
	if (t1) {
		l2 = ((T6)((l1)+(((T18*)(C))->a2)));
		t2 = (T18f5(ac, C));
		t1 = (T6f4(ac, (&l2), t2));
		if (t1) {
			T18f31(ac, C, l2);
		}
		l3 = (T6)(GE_int32(1));
		while (1) {
			t1 = (T6f4(ac, (&l3), l1));
			if (t1) {
				break;
			}
			t3 = (T41x2228225T6(ac, a1, l3));
			T18f26(ac, C, t3);
			l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
		}
		T18f28(ac, C, l2);
		T18f32(ac, C);
	}
}

/* STRING_32.append */
void T18f30(TC* ac, T0* C, T0* a1)
{
	T6 l1 = 0;
	T6 volatile l2 = 0;
	T6 volatile l3 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	l2 = (((T18*)(a1))->a2);
	t1 = (T6f4(ac, (&l2), (T6)(GE_int32(0))));
	if (t1) {
		l1 = ((T18*)(C))->a2;
		l3 = ((T6)((l2)+(l1)));
		t2 = (T18f5(ac, C));
		t1 = (T6f4(ac, (&l3), t2));
		if (t1) {
			t2 = (T18f6(ac, C));
			t2 = ((T6)((l3)+(t2)));
			T18f31(ac, C, t2);
		}
		t3 = (((T18*)(a1))->a1);
		t2 = (T18f8(ac, a1));
		T16f10(ac, ((T18*)(C))->a1, t3, t2, l1, l2);
		((T18*)(C))->a2 = l3;
		T18f32(ac, C);
	}
}

/* STRING_32.additional_space */
T6 T18f6(TC* ac, T0* C)
{
	T6 R = 0;
	T6 volatile t1;
	t1 = (T18f5(ac, C));
	t1 = ((T6)((t1)/((T6)(GE_int32(2)))));
	R = (T6f16(ac, &t1, (T6)(GE_int32(5))));
	return R;
}

/* NATURAL_8.to_hex_string */
T0* T8f14(TC* ac, T8 volatile* C)
{
	T0* R = 0;
	T6 l1 = 0;
	T8 l2 = 0;
	T6 t1;
	T1 t2;
	T8 volatile t3;
	T2 t4;
	t1 = (T6)(GE_int32(8));
	l1 = ((T6)((t1)/((T6)(GE_int32(4)))));
	R = T17c60(ac, (T2)('0'), l1);
	l2 = *C;
	while (1) {
		t2 = (T1)((l1) == ((T6)(GE_int32(0))));
		if (t2) {
			break;
		}
		t3 = ((T8)((l2)&((T8)(GE_nat8(15)))));
		t4 = (T8f21(ac, &t3));
		T17f77(ac, R, t4, l1);
		l2 = ((T8)((l2)>>((T6)(GE_int32(4)))));
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
	}
	return R;
}

/* NATURAL_8.to_hex_character */
T2 T8f21(TC* ac, T8 volatile* C)
{
	T2 R = 0;
	T6 volatile l1 = 0;
	T2 volatile t1;
	T1 t2;
	T2 volatile t3;
	l1 = (T8f25(ac, &(*C)));
	t2 = (T6f15(ac, (&l1), (T6)(GE_int32(9))));
	if (t2) {
		t1 = (T2)('0');
	} else {
		t3 = (T2)('A');
		t1 = (T2f32(ac, &t3, (T6)(GE_int32(10))));
	}
	R = (T2f33(ac, &t1, l1));
	return R;
}

/* NATURAL_8.to_integer_32 */
T6 T8f25(TC* ac, T8 volatile* C)
{
	T6 R = 0;
	R = ((T6)(*C));
	return R;
}

/* NATURAL_16.is_less_equal */
T1 T9f10(TC* ac, T9 volatile* C, T9 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((T1)((a1)<(*C)));
	R = ((T1)(!(t1)));
	return R;
}

/* STRING_32.append_character */
void T18f25(TC* ac, T0* C, T3 a1)
{
	T6 l1 = 0;
	T6 t1;
	T1 t2;
	l1 = ((T18*)(C))->a2;
	t1 = (T18f5(ac, C));
	t2 = (T1)((l1) == (t1));
	if (t2) {
		t1 = (T18f6(ac, C));
		t1 = ((T6)((l1)+(t1)));
		T18f31(ac, C, t1);
	}
	((T16*)(((T18*)(C))->a1))->z2[l1] = (a1);
	((T18*)(C))->a2 = ((T6)((l1)+((T6)(GE_int32(1)))));
	T18f32(ac, C);
}

/* NATURAL_8.to_natural_16 */
T9 T8f12(TC* ac, T8 volatile* C)
{
	T9 R = 0;
	R = ((T9)(*C));
	return R;
}

/* STRING_32.extend */
void T18f36(TC* ac, T0* C, T3 a1)
{
	T6 l1 = 0;
	T6 t1;
	T1 t2;
	l1 = ((T18*)(C))->a2;
	t1 = (T18f5(ac, C));
	t2 = (T1)((l1) == (t1));
	if (t2) {
		t1 = (T18f6(ac, C));
		t1 = ((T6)((l1)+(t1)));
		T18f31(ac, C, t1);
	}
	((T16*)(((T18*)(C))->a1))->z2[l1] = (a1);
	((T18*)(C))->a2 = ((T6)((l1)+((T6)(GE_int32(1)))));
	T18f32(ac, C);
}

/* NATURAL_8.is_less_equal */
T1 T8f9(TC* ac, T8 volatile* C, T8 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((T1)((a1)<(*C)));
	R = ((T1)(!(t1)));
	return R;
}

/* STRING_32.grow */
void T18f35(TC* ac, T0* C, T6 a1)
{
	T6 t1;
	T1 t2;
	t1 = (T18f5(ac, C));
	t2 = (T6f4(ac, &a1, t1));
	if (t2) {
		T18f31(ac, C, a1);
	}
}

/* IMMUTABLE_STRING_32.make_from_string */
T0* T20c18(TC* ac, T0* a1)
{
	T0* C;
	T1 t1;
	T6 t2;
	T0* t3;
	T6 t4;
	C = GE_new20(ac, EIF_TRUE);
	((T20*)(C))->a1 = (((T18*)(a1))->a1);
	((T20*)(C))->a2 = (((T18*)(a1))->a2);
	((T20*)(C))->a4 = (T6)(GE_int32(0));
	t1 = EIF_TRUE;
	if (t1) {
		t2 = ((T6)((((T20*)(C))->a2)+((T6)(GE_int32(1)))));
		((T20*)(C))->a1 = T16c11(ac, t2);
		t3 = (((T18*)(a1))->a1);
		t2 = (T18f8(ac, a1));
		t4 = ((T6)((((T20*)(C))->a2)+((T6)(GE_int32(1)))));
		T16f10(ac, ((T20*)(C))->a1, t3, t2, (T6)(GE_int32(0)), t4);
	}
	return C;
}

/* UTF_CONVERTER.utf_16le_string_8_to_escaped_string_32 */
T0* T40s11(TC* ac, T0* a1)
{
	T0* R = 0;
	T6 t1;
	t1 = (((T17*)(a1))->a2);
	t1 = ((T6)((t1)>>((T6)(GE_int32(1)))));
	R = T18c23(ac, t1);
	T40s23(ac, a1, R);
	return R;
}

/* UTF_CONVERTER.utf_16le_string_8_into_escaped_string_32 */
void T40s23(TC* ac, T0* a1, T0* a2)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T10 volatile l3 = 0;
	T10 volatile l4 = 0;
	T6 volatile t1;
	T6 volatile t2;
	T1 t3;
	T10 t4;
	T10 t5;
	T3 t6;
	T6 t7;
	T9 t8;
	l2 = (((T17*)(a1))->a2);
	t1 = (((T18*)(a2))->a2);
	t2 = ((T6)((l2)>>((T6)(GE_int32(1)))));
	t1 = ((T6)((t1)+(t2)));
	T18f35(ac, a2, t1);
	while (1) {
		t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t3 = (T6f14(ac, &t1, l2));
		if (t3) {
			break;
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(2)))));
		t2 = ((T6)((l1)-((T6)(GE_int32(1)))));
		t4 = (T17f10(ac, a1, t2));
		t5 = (T17f10(ac, a1, l1));
		t5 = ((T10)((t5)<<((T6)(GE_int32(8)))));
		l3 = ((T10)((t4)|(t5)));
		t3 = ((T1)((l3)<((T10)(GE_nat32(55296)))));
		if (!(t3)) {
			t3 = (T10f14(ac, (&l3), (T10)(GE_nat32(57344))));
		}
		if (t3) {
			t6 = ((T3)(l3));
			T18f36(ac, a2, t6);
		} else {
			t3 = (T10f5(ac, (&l3), (T10)(GE_nat32(56319))));
			if (t3) {
				t2 = ((T6)((l1)+((T6)(GE_int32(2)))));
				t3 = (T6f15(ac, &t2, l2));
			}
			if (t3) {
				t7 = ((T6)((l1)+((T6)(GE_int32(1)))));
				t4 = (T17f10(ac, a1, t7));
				t7 = ((T6)((l1)+((T6)(GE_int32(2)))));
				t5 = (T17f10(ac, a1, t7));
				t5 = ((T10)((t5)<<((T6)(GE_int32(8)))));
				l4 = ((T10)((t4)|(t5)));
				t3 = (T10f14(ac, (&l4), (T10)(GE_nat32(56320))));
				if (t3) {
					t3 = (T10f5(ac, (&l4), (T10)(GE_nat32(57343))));
				}
				if (t3) {
					t4 = ((T10)((l3)<<((T6)(GE_int32(10)))));
					t4 = ((T10)((t4)+(l4)));
					t4 = ((T10)((t4)-((T10)(GE_nat32(56613888)))));
					t6 = ((T3)(t4));
					T18f36(ac, a2, t6);
					l1 = ((T6)((l1)+((T6)(GE_int32(2)))));
				} else {
					t8 = ((T9)(l3));
					T40s24(ac, a2, t8);
				}
			} else {
				t8 = ((T9)(l3));
				T40s24(ac, a2, t8);
			}
		}
	}
}

/* NATURAL_32.is_greater_equal */
T1 T10f14(TC* ac, T10 volatile* C, T10 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((T1)((*C)<(a1)));
	R = ((T1)(!(t1)));
	return R;
}

/* EXECUTION_ENVIRONMENT.current_working_path */
T0* T105s7(TC* ac)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 volatile l2 = 0;
	T0* l3 = 0;
	T14 t1;
	T1 t2;
	l1 = (T6)(GE_int32(50));
	l3 = T162c10(ac, l1);
	t1 = (((T162*)(l3))->a1);
	l2 = (T105s8(ac, t1, l1));
	t2 = (T1)((l2) == ((T6)(GE_int32(-1))));
	if (t2) {
		R = T1026c17(ac, GE_ms8(".", 1));
	} else {
		t2 = (T6f4(ac, (&l2), l1));
		if (t2) {
			l1 = l2;
			T162f11(ac, l3, l1);
			t1 = (((T162*)(l3))->a1);
			l2 = (T105s8(ac, t1, l1));
		}
		t2 = (T6f4(ac, (&l2), (T6)(GE_int32(0))));
		if (t2) {
			t2 = (T6f15(ac, (&l2), l1));
		}
		if (t2) {
			t1 = (((T162*)(l3))->a1);
			R = T1026c18(ac, t1);
		} else {
			R = T1026c17(ac, GE_ms8(".", 1));
		}
	}
	return R;
}

/* PATH.make_from_pointer */
T0* T1026c18(TC* ac, T14 a1)
{
	T0* C;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 t1;
	T1 t2;
	C = GE_new1026(ac, EIF_TRUE);
	l2 = (T1026f7(ac, C, a1));
	t1 = (T1026f5(ac, C));
	t1 = ((T6)((l2)%(t1)));
	l2 = ((T6)((l2)-(t1)));
	l1 = T31c10(ac, a1, l2);
	((T1026*)(C))->a2 = (T31f3(ac, l1, (T6)(GE_int32(1)), l2));
	t2 = (T17f15(ac, ((T1026*)(C))->a2));
	t2 = ((T1)(!(t2)));
	if (t2) {
		T1026f20(ac, C);
	}
	T1026f21(ac, C);
	return C;
}

/* PATH.reset_internal_data */
void T1026f21(TC* ac, T0* C)
{
	((T1026*)(C))->a1 = EIF_VOID;
}

/* PATH.normalize */
void T1026f20(TC* ac, T0* C)
{
	T0* l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T6 volatile l4 = 0;
	T6 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T1 t1;
	T1 t2;
	T2 t3;
	T6 t4;
	T6 t5;
	l1 = ((T1026*)(C))->a2;
	l4 = (((T17*)(l1))->a2);
	t1 = (EIF_IS_WINDOWS);
	if (t1) {
		l2 = (T6)(GE_int32(1));
		t1 = (T6f14(ac, (&l4), (T6)(GE_int32(10))));
		if (t1) {
			t2 = (T1026f8(ac, C, l1, (T6)(GE_int32(1)), (T2)('/')));
			if (t2) {
				t2 = (T1026f8(ac, C, l1, (T6)(GE_int32(3)), (T2)('/')));
				if (!(t2)) {
					t1 = (T1026f8(ac, C, l1, (T6)(GE_int32(3)), (T2)('\\')));
				} else {
					t1 = EIF_TRUE;
				}
			} else {
				t1 = EIF_FALSE;
			}
			if (!(t1)) {
				t2 = (T1026f8(ac, C, l1, (T6)(GE_int32(1)), (T2)('\\')));
				if (t2) {
					t2 = (T1026f8(ac, C, l1, (T6)(GE_int32(3)), (T2)('\\')));
					if (!(t2)) {
						t1 = (T1026f8(ac, C, l1, (T6)(GE_int32(3)), (T2)('/')));
					} else {
						t1 = EIF_TRUE;
					}
				} else {
					t1 = EIF_FALSE;
				}
			}
			if (t1) {
				t2 = (T1026f8(ac, C, l1, (T6)(GE_int32(5)), (T2)('/')));
				t1 = ((T1)(!(t2)));
				if (t1) {
					t2 = (T1026f8(ac, C, l1, (T6)(GE_int32(5)), (T2)('\\')));
					t1 = ((T1)(!(t2)));
				}
				if (t1) {
					l2 = (T6)(GE_int32(5));
					l8 = EIF_TRUE;
				}
			}
		}
		l3 = l2;
		l7 = EIF_TRUE;
		while (1) {
			t1 = (T6f4(ac, (&l2), l4));
			if (t1) {
				break;
			}
			if (l6) {
				t1 = (T1026f8(ac, C, l1, l2, (T2)('\\')));
				t1 = ((T1)(!(t1)));
				if (t1) {
					t1 = (T1026f8(ac, C, l1, l2, (T2)('/')));
					l7 = ((T1)(!(t1)));
				} else {
					l7 = EIF_FALSE;
				}
				l6 = ((T1)(!(l7)));
			} else {
				t1 = (T1026f8(ac, C, l1, l2, (T2)('/')));
				if (t1) {
					T17f77(ac, l1, (T2)('\\'), l2);
					l6 = EIF_TRUE;
				} else {
					l6 = (T1026f8(ac, C, l1, l2, (T2)('\\')));
				}
			}
			if (l7) {
				t1 = (T1)(!(T1)((l2) == (l3)));
				if (t1) {
					t3 = (T17f24(ac, l1, l2));
					T17f77(ac, l1, t3, l3);
					t4 = ((T6)((l2)+((T6)(GE_int32(1)))));
					t3 = (T17f24(ac, l1, t4));
					t4 = ((T6)((l3)+((T6)(GE_int32(1)))));
					T17f77(ac, l1, t3, t4);
				}
				l3 = ((T6)((l3)+((T6)(GE_int32(2)))));
			}
			l2 = ((T6)((l2)+((T6)(GE_int32(2)))));
		}
	} else {
		l2 = (T6)(GE_int32(1));
		l3 = l2;
		l7 = EIF_TRUE;
		while (1) {
			t1 = (T6f4(ac, (&l2), l4));
			if (t1) {
				break;
			}
			if (l6) {
				t1 = (T1026f8(ac, C, l1, l2, (T2)('/')));
				l7 = ((T1)(!(t1)));
				l6 = ((T1)(!(l7)));
			} else {
				l6 = (T1026f8(ac, C, l1, l2, (T2)('/')));
			}
			if (l7) {
				t1 = (T1)(!(T1)((l2) == (l3)));
				if (t1) {
					t3 = (T17f24(ac, l1, l2));
					T17f77(ac, l1, t3, l3);
				}
				l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
			}
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		}
	}
	t1 = (T1)(!(T1)((l2) == (l3)));
	if (t1) {
		t4 = ((T6)((l3)-((T6)(GE_int32(1)))));
		T17f72(ac, l1, t4);
	}
	((T1026*)(C))->a3 = EIF_TRUE;
	if (l8) {
		l5 = (T1026f12(ac, C));
		t1 = (T1)((l5) == ((T6)(GE_int32(0))));
		if (t1) {
			t4 = (T1026f5(ac, C));
			T17f76(ac, l1, t4);
		}
	}
	t4 = (((T17*)(l1))->a2);
	t5 = (T1026f5(ac, C));
	t4 = ((T6)((t4)-(t5)));
	t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
	t3 = (T1026s13(ac));
	t1 = (T1026f8(ac, C, l1, t4, t3));
	if (t1) {
		t4 = (T1026f12(ac, C));
		t5 = (((T17*)(l1))->a2);
		t1 = ((T1)((t4)<(t5)));
	}
	if (t1) {
		t4 = (T1026f5(ac, C));
		T17f66(ac, l1, t4);
	}
}

/* STRING_8.remove_tail */
void T17f66(TC* ac, T0* C, T6 a1)
{
	T6 l1 = 0;
	T1 t1;
	T6 t2;
	l1 = ((T17*)(C))->a2;
	t1 = (T6f4(ac, &a1, l1));
	if (t1) {
		((T17*)(C))->a2 = (T6)(GE_int32(0));
		T17f55(ac, C);
	} else {
		t2 = ((T6)((l1)-(a1)));
		T17f72(ac, C, t2);
	}
}

/* PATH.directory_separator */
T2 T1026s13(TC* ac)
{
	T2 R = 0;
	T1 t1;
	t1 = (EIF_IS_WINDOWS);
	if (t1) {
		R = (T2)('\\');
	} else {
		R = (T2)('/');
	}
	return R;
}

/* STRING_8.remove_head */
void T17f76(TC* ac, T0* C, T6 a1)
{
	T1 t1;
	T6 t2;
	t1 = (T6f4(ac, &a1, ((T17*)(C))->a2));
	if (t1) {
		((T17*)(C))->a2 = (T6)(GE_int32(0));
		T17f55(ac, C);
	} else {
		t2 = ((T6)((((T17*)(C))->a2)-(a1)));
		T17f80(ac, C, t2);
	}
}

/* STRING_8.keep_tail */
void T17f80(TC* ac, T0* C, T6 a1)
{
	T6 l1 = 0;
	T1 t1;
	T6 t2;
	l1 = ((T17*)(C))->a2;
	t1 = ((T1)((a1)<(l1)));
	if (t1) {
		t2 = ((T6)((l1)-(a1)));
		T15f21(ac, ((T17*)(C))->a1, t2, (T6)(GE_int32(0)), a1);
		((T17*)(C))->a2 = a1;
		T17f55(ac, C);
	}
}

/* PATH.root_end_position */
T6 T1026f12(TC* ac, T0* C)
{
	T6 R = 0;
	T2 volatile l1 = 0;
	T6 volatile l2 = 0;
	T1 t1;
	T6 volatile t2;
	T6 volatile t3;
	T2 volatile t4;
	T1 t5;
	T2 t6;
	T6 volatile t7;
	T6 volatile t8;
	T6 t9;
	t1 = (T17f15(ac, ((T1026*)(C))->a2));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t1 = (EIF_IS_WINDOWS);
		if (t1) {
			t2 = (((T17*)(((T1026*)(C))->a2))->a2);
			t3 = (T1026f5(ac, C));
			t1 = (T1)((t2) == (t3));
			if (t1) {
				t1 = (T1026f8(ac, C, ((T1026*)(C))->a2, (T6)(GE_int32(1)), (T2)('\\')));
			}
			if (t1) {
				R = (T1026f5(ac, C));
			} else {
				t2 = (((T17*)(((T1026*)(C))->a2))->a2);
				t1 = (T6f14(ac, &t2, (T6)(GE_int32(4))));
				if (t1) {
					t4 = (T17f24(ac, ((T1026*)(C))->a2, (T6)(GE_int32(2))));
					t5 = (T1)((t4) == ((T2)('\000')));
					if (t5) {
						t4 = (T17f24(ac, ((T1026*)(C))->a2, (T6)(GE_int32(4))));
						t1 = (T1)((t4) == ((T2)('\000')));
					} else {
						t1 = EIF_FALSE;
					}
				}
				if (t1) {
					t4 = (T17f24(ac, ((T1026*)(C))->a2, (T6)(GE_int32(1))));
					l1 = (T2f26(ac, &t4));
					t5 = (T2f12(ac, (&l1), (T2)('a')));
					if (t5) {
						t1 = (T2f10(ac, (&l1), (T2)('z')));
					} else {
						t1 = EIF_FALSE;
					}
					if (t1) {
						t6 = (T17f24(ac, ((T1026*)(C))->a2, (T6)(GE_int32(3))));
						t1 = (T1)((t6) == ((T2)(':')));
					}
					if (t1) {
						t3 = (((T17*)(((T1026*)(C))->a2))->a2);
						t7 = (T6)(GE_int32(3));
						t8 = (T1026f5(ac, C));
						t7 = ((T6)((t7)*(t8)));
						t1 = (T6f14(ac, &t3, t7));
						if (t1) {
							t1 = (T1026f8(ac, C, ((T1026*)(C))->a2, (T6)(GE_int32(5)), (T2)('\\')));
						}
						if (t1) {
							R = (T6)(GE_int32(6));
						} else {
							R = (T6)(GE_int32(4));
						}
					} else {
						t1 = (T1)((l1) == ((T2)('\\')));
						if (t1) {
							t6 = (T17f24(ac, ((T1026*)(C))->a2, (T6)(GE_int32(3))));
							t1 = (T1)(!(T1)((t6) == ((T2)('\\'))));
						}
						if (t1) {
							R = (T1026f5(ac, C));
						} else {
							t7 = (((T17*)(((T1026*)(C))->a2))->a2);
							t5 = (T6f14(ac, &t7, (T6)(GE_int32(10))));
							if (t5) {
								t5 = (T1)((l1) == ((T2)('\\')));
							}
							if (t5) {
								t6 = (T17f24(ac, ((T1026*)(C))->a2, (T6)(GE_int32(3))));
								t1 = (T1)((t6) == ((T2)('\\')));
							} else {
								t1 = EIF_FALSE;
							}
							if (t1) {
								t6 = (T17f24(ac, ((T1026*)(C))->a2, (T6)(GE_int32(5))));
								t1 = (T1)(!(T1)((t6) == ((T2)('\\'))));
							}
							if (t1) {
								l2 = (T1026f16(ac, C, (T6)(GE_int32(7))));
								t1 = (T6f4(ac, (&l2), (T6)(GE_int32(0))));
								if (t1) {
									t8 = (T1026f5(ac, C));
									t8 = ((T6)((l2)+(t8)));
									t9 = (((T17*)(((T1026*)(C))->a2))->a2);
									t1 = (T6f15(ac, &t8, t9));
								}
								if (t1) {
									t9 = (T1026f5(ac, C));
									t9 = ((T6)((l2)+(t9)));
									l2 = (T1026f16(ac, C, t9));
									t1 = (T6f4(ac, (&l2), (T6)(GE_int32(0))));
									if (t1) {
										R = ((T6)((l2)+((T6)(GE_int32(1)))));
									} else {
										R = (((T17*)(((T1026*)(C))->a2))->a2);
									}
								}
							}
						}
					}
				}
			}
		} else {
			t6 = (T17f24(ac, ((T1026*)(C))->a2, (T6)(GE_int32(1))));
			t1 = (T1)((t6) == ((T2)('/')));
			if (t1) {
				R = (T6)(GE_int32(1));
			}
		}
	}
	return R;
}

/* PATH.next_directory_separator */
T6 T1026f16(TC* ac, T0* C, T6 a1)
{
	T6 volatile R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T2 l3 = 0;
	T0* l4 = 0;
	T1 t1;
	T1 t2;
	l2 = (T1026f5(ac, C));
	l3 = (T1026s13(ac));
	R = a1;
	l4 = ((T1026*)(C))->a2;
	l1 = (((T17*)(l4))->a2);
	while (1) {
		t2 = ((T1)((R)<((T6)(GE_int32(1)))));
		if (!(t2)) {
			t1 = (T6f4(ac, (&R), l1));
		} else {
			t1 = EIF_TRUE;
		}
		if (!(t1)) {
			t1 = (T1026f8(ac, C, l4, R, l3));
		}
		if (t1) {
			break;
		}
		R = ((T6)((R)+(l2)));
	}
	t1 = (T6f4(ac, (&R), l1));
	if (t1) {
		R = (T6)(GE_int32(0));
	}
	return R;
}

/* CHARACTER_8.is_greater_equal */
T1 T2f12(TC* ac, T2 volatile* C, T2 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = (T2f15(ac, C, a1));
	R = ((T1)(!(t1)));
	return R;
}

/* CHARACTER_8.as_lower */
T2 T2f26(TC* ac, T2 volatile* C)
{
	T2 R = 0;
	T0* t1;
	T10 t2;
	T6 t3;
	t1 = (T2f30(ac, C));
	t2 = (T2f7(ac, C));
	t3 = ((T6)(t2));
	R = (((T15*)(t1))->z2[t3]);
	return R;
}

/* CHARACTER_8.lower_value */
T0* T2f30(TC* ac, T2 volatile* C)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[22]) {
		if (ac->thread_onces->reference_exception[22]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[22]);
		}
		return ac->thread_onces->reference_value[22];
	} else {
		ac->thread_onces->reference_status[22] = '\1';
		ac->thread_onces->reference_value[22] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[22] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = (((T17*)(GE_ms8("\000\001\002\003\004\005\006\007\010\t\n\013\014\r\016\017\020\021\022\023\024\025\026\027\030\031\032\033\034\035\036\037 !\"#$\045&\'()*+,-./0123456789:;<=>\?@abcdefghijklmnopqrstuvwxyz[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~\177\200\201\202\203\204\205\206\207\210\211\212\213\214\215\216\217\220\221\222\223\224\225\226\227\230\231\232\233\234\235\236\237\240\241\242\243\244\245\246\247\250\251\252\253\254\255\256\257\260\261\262\263\264\265\266\267\270\271\272\273\274\275\276\277\340\341\342\343\344\345\346\347\350\351\352\353\354\355\356\357\360\361\362\363\364\365\366\327\370\371\372\373\374\375\376\337\340\341\342\343\344\345\346\347\350\351\352\353\354\355\356\357\360\361\362\363\364\365\366\367\370\371\372\373\374\375\376\377", 256)))->a1);
	ac->thread_onces->reference_value[22] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* STRING_8.keep_head */
void T17f72(TC* ac, T0* C, T6 a1)
{
	T1 t1;
	t1 = ((T1)((a1)<(((T17*)(C))->a2)));
	if (t1) {
		((T17*)(C))->a2 = a1;
		T17f55(ac, C);
	}
}

/* PATH.is_character */
T1 T1026f8(TC* ac, T0* C, T0* a1, T6 a2, T2 a3)
{
	T1 R = 0;
	T1 t1;
	T2 t2;
	T6 t3;
	t1 = (EIF_IS_WINDOWS);
	if (t1) {
		t2 = (T17f24(ac, a1, a2));
		t1 = (T1)((t2) == (a3));
		if (t1) {
			t3 = ((T6)((a2)+((T6)(GE_int32(1)))));
			t2 = (T17f24(ac, a1, t3));
			R = (T1)((t2) == ((T2)('\000')));
		} else {
			R = EIF_FALSE;
		}
	} else {
		t2 = (T17f24(ac, a1, a2));
		R = (T1)((t2) == (a3));
	}
	return R;
}

/* STRING_8.is_empty */
T1 T17f15(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T1)((((T17*)(C))->a2) == ((T6)(GE_int32(0))));
	return R;
}

/* C_STRING.substring_8 */
T0* T31f3(TC* ac, T0* C, T6 a1, T6 a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 t1;
	t1 = ((T6)((a2)-(a1)));
	l1 = ((T6)((t1)+((T6)(GE_int32(1)))));
	R = T17c49(ac, l1);
	T17f67(ac, R, l1);
	T31f14(ac, C, R, a1, a2);
	return R;
}

/* C_STRING.read_substring_into */
void T31f14(TC* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T0* l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T1 t1;
	T8 volatile t2;
	T10 t3;
	l2 = ((T6)((a2)-((T6)(GE_int32(1)))));
	l4 = ((T6)((a3)-(a2)));
	l1 = ((T31*)(C))->a1;
	l3 = (T6)(GE_int32(1));
	while (1) {
		t1 = (T6f4(ac, (&l2), l4));
		if (t1) {
			break;
		}
		t2 = (T162f5(ac, l1, l2));
		t3 = (T8f8(ac, &t2));
		T17f70(ac, a1, t3, l3);
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
	}
}

/* NATURAL_8.to_natural_32 */
T10 T8f8(TC* ac, T8 volatile* C)
{
	T10 R = 0;
	R = ((T10)(*C));
	return R;
}

/* MANAGED_POINTER.read_natural_8 */
T8 T162f5(TC* ac, T0* C, T6 a1)
{
	T8 volatile R = 0;
	T1566 t1;
	T14 t2;
	(t1).a1 = ((T14)&R);
	t2 = ((T14)(((char*)(((T162*)(C))->a1))+(a1)));
	T1566f4(ac, &t1, t2, (T6)(GE_int32(1)));
	return R;
}

/* TYPED_POINTER [NATURAL_8].memory_copy */
void T1566f4(TC* ac, T1566* C, T14 a1, T6 a2)
{
	T1566s6(ac, (*C).a1, a1, a2);
}

/* TYPED_POINTER [NATURAL_8].c_memcpy */
void T1566s6(TC* ac, T14 a1, T14 a2, T6 a3)
{
	{
	memcpy((void *)(void*)a1,( const void *)(void*)a2,( size_t)a3);
	}
}

/* PATH.unit_size */
T6 T1026f5(TC* ac, T0* C)
{
	T6 R = 0;
	T1 t1;
	t1 = (EIF_IS_WINDOWS);
	if (t1) {
		R = (T6)(GE_int32(2));
	} else {
		R = (T6)(GE_int32(1));
	}
	return R;
}

/* PATH.pointer_length_in_bytes */
T6 T1026f7(TC* ac, T0* C, T14 a1)
{
	T6 R = 0;
	T11 volatile l1 = 0;
	T6 volatile t1;
	T11 t2;
	T1 t3;
	l1 = (T1026f15(ac, C, a1));
	t1 = (T6)(GE_int32(2147483647));
	t2 = (T6f19(ac, &t1));
	t3 = (T11f8(ac, (&l1), t2));
	if (t3) {
		R = (T11f16(ac, (&l1)));
	} else {
		R = (T6)(GE_int32(2147483647));
	}
	return R;
}

/* NATURAL_64.to_integer_32 */
T6 T11f16(TC* ac, T11 volatile* C)
{
	T6 R = 0;
	R = ((T6)(*C));
	return R;
}

/* NATURAL_64.is_less_equal */
T1 T11f8(TC* ac, T11 volatile* C, T11 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((T1)((a1)<(*C)));
	R = ((T1)(!(t1)));
	return R;
}

/* PATH.c_pointer_length_in_bytes */
T11 T1026f15(TC* ac, T0* C, T14 a1)
{
	{
			#ifdef EIF_WINDOWS
				return (EIF_NATURAL_64) wcslen((void*)a1) * sizeof(wchar_t);
			#else
				return (EIF_NATURAL_64) strlen((void*)a1) * sizeof(char);
			#endif
	}
}

/* PATH.make_from_string */
T0* T1026c17(TC* ac, T0* a1)
{
	T0* C;
	T6 t1;
	T6 t2;
	T1 t3;
	C = GE_new1026(ac, EIF_TRUE);
	t1 = (T41x2228263(ac, a1));
	t2 = (T1026f5(ac, C));
	t1 = ((T6)((t1)*(t2)));
	((T1026*)(C))->a2 = T17c49(ac, t1);
	t3 = (T41x2228241(ac, a1));
	t3 = ((T1)(!(t3)));
	if (t3) {
		T1026f19(ac, C, ((T1026*)(C))->a2, a1, (T2)('\000'));
		T1026f20(ac, C);
	} else {
		((T1026*)(C))->a3 = EIF_TRUE;
	}
	T1026f21(ac, C);
	return C;
}

/* PATH.internal_append_into */
void T1026f19(TC* ac, T0* C, T0* a1, T0* a2, T2 a3)
{
	T40 l1 = GE_default40;
	T1 t1;
	T1 t2;
	T1 t3;
	T6 t4;
	T6 t5;
	T3 t6;
	T2 t7;
	T3 t8;
	t1 = (T41x2228241(ac, a2));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (T1)(!(T1)((a3) == ((T2)('\000'))));
		if (t2) {
			t3 = (T17f15(ac, a1));
			t2 = ((T1)(!(t3)));
		}
		if (t2) {
			t4 = (((T17*)(a1))->a2);
			t5 = (T1026f5(ac, C));
			t4 = ((T6)((t4)-(t5)));
			t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
			t2 = (T1026f8(ac, C, a1, t4, a3));
			t1 = ((T1)(!(t2)));
		} else {
			t1 = EIF_FALSE;
		}
		if (t1) {
			t6 = (T41x2228226T6(ac, a2, (T6)(GE_int32(1))));
			t7 = (T2)('/');
			t8 = ((T3)(t7));
			t1 = (T1)(!(T1)((t6) == (t8)));
		}
		if (t1) {
			t1 = (EIF_IS_WINDOWS);
			if (t1) {
				t6 = (T41x2228226T6(ac, a2, (T6)(GE_int32(1))));
				t7 = (T2)('\\');
				t8 = ((T3)(t7));
				t1 = (T1)(!(T1)((t6) == (t8)));
				if (t1) {
					T17f52(ac, a1, a3);
					T17f52(ac, a1, (T2)('\000'));
				}
			} else {
				T17f52(ac, a1, a3);
			}
		}
		t1 = (EIF_IS_WINDOWS);
		if (t1) {
			T40s19(ac, a2, a1);
		} else {
			T40s15(ac, a2, a1);
		}
	}
}

/* UTF_CONVERTER.escaped_utf_32_string_into_utf_8_string_8 */
void T40s15(TC* ac, T0* a1, T0* a2)
{
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T10 volatile l3 = 0;
	T0* l4 = 0;
	T1 l5 = 0;
	T6 t1;
	T1 t2;
	T3 t3;
	T10 t4;
	T6 t5;
	T2 t6;
	l2 = (T41x2228263(ac, a1));
	t1 = (((T17*)(a2))->a2);
	t1 = ((T6)((t1)+(l2)));
	T17f56(ac, a2, t1);
	while (1) {
		t2 = (T6f14(ac, (&l1), l2));
		if (t2) {
			break;
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		l3 = (T41x2228225T6(ac, a1, l1));
		t3 = (T3)(GE_nat32(65533));
		t4 = ((T10)(t3));
		t2 = (T1)((l3) == (t4));
		if (t2) {
			t2 = ((T1)((l1)<(l2)));
			if (t2) {
				t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				t3 = (T41x2228226T6(ac, a1, t1));
				t2 = (T1)((t3) == ((T3)(GE_nat32(65533))));
			}
			if (t2) {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			} else {
				t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				t2 = ((T1)((t1)<(l2)));
				if (t2) {
					t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					t5 = ((T6)((l1)+((T6)(GE_int32(2)))));
					l4 = (T41x2228304T6T6(ac, a1, t1, t5));
					t2 = (T40s5(ac, l4));
					if (t2) {
						l3 = (T40s6(ac, l4));
						t2 = (T10f5(ac, (&l3), (T10)(GE_nat32(127))));
						if (t2) {
							t3 = (T3)(GE_nat32(65533));
							l3 = ((T10)(t3));
						} else {
							l5 = EIF_TRUE;
							l1 = ((T6)((l1)+((T6)(GE_int32(2)))));
						}
					}
				}
			}
		}
		t2 = ((T1)(!(l5)));
		if (t2) {
			t2 = (T10f5(ac, (&l3), (T10)(GE_nat32(127))));
			if (t2) {
				t6 = ((T2)(l3));
				T17f57(ac, a2, t6);
			} else {
				t2 = (T10f5(ac, (&l3), (T10)(GE_nat32(2047))));
				if (t2) {
					t4 = ((T10)((l3)>>((T6)(GE_int32(6)))));
					t4 = ((T10)((t4)|((T10)(GE_nat32(192)))));
					t6 = ((T2)(t4));
					T17f57(ac, a2, t6);
					t4 = ((T10)((l3)&((T10)(GE_nat32(63)))));
					t4 = ((T10)((t4)|((T10)(GE_nat32(128)))));
					t6 = ((T2)(t4));
					T17f57(ac, a2, t6);
				} else {
					t2 = (T10f5(ac, (&l3), (T10)(GE_nat32(65535))));
					if (t2) {
						t4 = ((T10)((l3)>>((T6)(GE_int32(12)))));
						t4 = ((T10)((t4)|((T10)(GE_nat32(224)))));
						t6 = ((T2)(t4));
						T17f57(ac, a2, t6);
						t4 = ((T10)((l3)>>((T6)(GE_int32(6)))));
						t4 = ((T10)((t4)&((T10)(GE_nat32(63)))));
						t4 = ((T10)((t4)|((T10)(GE_nat32(128)))));
						t6 = ((T2)(t4));
						T17f57(ac, a2, t6);
						t4 = ((T10)((l3)&((T10)(GE_nat32(63)))));
						t4 = ((T10)((t4)|((T10)(GE_nat32(128)))));
						t6 = ((T2)(t4));
						T17f57(ac, a2, t6);
					} else {
						t4 = ((T10)((l3)>>((T6)(GE_int32(18)))));
						t4 = ((T10)((t4)|((T10)(GE_nat32(240)))));
						t6 = ((T2)(t4));
						T17f57(ac, a2, t6);
						t4 = ((T10)((l3)>>((T6)(GE_int32(12)))));
						t4 = ((T10)((t4)&((T10)(GE_nat32(63)))));
						t4 = ((T10)((t4)|((T10)(GE_nat32(128)))));
						t6 = ((T2)(t4));
						T17f57(ac, a2, t6);
						t4 = ((T10)((l3)>>((T6)(GE_int32(6)))));
						t4 = ((T10)((t4)&((T10)(GE_nat32(63)))));
						t4 = ((T10)((t4)|((T10)(GE_nat32(128)))));
						t6 = ((T2)(t4));
						T17f57(ac, a2, t6);
						t4 = ((T10)((l3)&((T10)(GE_nat32(63)))));
						t4 = ((T10)((t4)|((T10)(GE_nat32(128)))));
						t6 = ((T2)(t4));
						T17f57(ac, a2, t6);
					}
				}
			}
		} else {
			l5 = EIF_FALSE;
			t6 = ((T2)(l3));
			T17f57(ac, a2, t6);
		}
	}
}

/* STRING_8.extend */
void T17f57(TC* ac, T0* C, T2 a1)
{
	T6 l1 = 0;
	T6 t1;
	T1 t2;
	l1 = ((T17*)(C))->a2;
	t1 = (T17f7(ac, C));
	t2 = (T1)((l1) == (t1));
	if (t2) {
		t1 = (T17f8(ac, C));
		t1 = ((T6)((l1)+(t1)));
		T17f54(ac, C, t1);
	}
	((T15*)(((T17*)(C))->a1))->z2[l1] = (a1);
	((T17*)(C))->a2 = ((T6)((l1)+((T6)(GE_int32(1)))));
	T17f55(ac, C);
}

/* IMMUTABLE_STRING_32.substring */
T0* T20f7(TC* ac, T0* C, T6 a1, T6 a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T6 volatile t2;
	T1 t3;
	T6 t4;
	t2 = (T6)(GE_int32(1));
	t3 = (T6f15(ac, &t2, a1));
	if (t3) {
		t1 = (T6f15(ac, &a1, a2));
	} else {
		t1 = EIF_FALSE;
	}
	if (t1) {
		t1 = (T6f15(ac, &a2, ((T20*)(C))->a2));
	}
	if (t1) {
		t4 = ((T6)((a2)-(a1)));
		l2 = ((T6)((t4)+((T6)(GE_int32(1)))));
		t4 = ((T6)((l2)+((T6)(GE_int32(1)))));
		l1 = T16c11(ac, t4);
		t4 = ((T6)((((T20*)(C))->a3)+(a1)));
		t4 = ((T6)((t4)-((T6)(GE_int32(1)))));
		T16f10(ac, l1, ((T20*)(C))->a1, t4, (T6)(GE_int32(0)), l2);
		T16f12(ac, l1, (T3)(GE_nat32(0)));
		R = T20c16(ac, l1, (T6)(GE_int32(0)), l2);
	} else {
		R = (T20f8(ac, C));
	}
	return R;
}

/* IMMUTABLE_STRING_32.empty_string */
T0* T20f8(TC* ac, T0* C)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[23]) {
		if (ac->thread_onces->reference_exception[23]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[23]);
		}
		return ac->thread_onces->reference_value[23];
	} else {
		ac->thread_onces->reference_status[23] = '\1';
		ac->thread_onces->reference_value[23] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[23] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T20c19(ac, (T6)(GE_int32(0)));
	ac->thread_onces->reference_value[23] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* IMMUTABLE_STRING_32.make */
void T20f19(TC* ac, T0* C, T6 a1)
{
	T6 t1;
	((T20*)(C))->a2 = (T6)(GE_int32(0));
	((T20*)(C))->a4 = (T6)(GE_int32(0));
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	((T20*)(C))->a1 = T16c8(ac, (T3)(GE_nat32(0)), t1);
}

/* IMMUTABLE_STRING_32.make */
T0* T20c19(TC* ac, T6 a1)
{
	T0* C;
	T6 t1;
	C = GE_new20(ac, EIF_TRUE);
	((T20*)(C))->a2 = (T6)(GE_int32(0));
	((T20*)(C))->a4 = (T6)(GE_int32(0));
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	((T20*)(C))->a1 = T16c8(ac, (T3)(GE_nat32(0)), t1);
	return C;
}

/* IMMUTABLE_STRING_32.make_from_area_and_bounds */
void T20f16(TC* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	((T20*)(C))->a1 = a1;
	((T20*)(C))->a3 = a2;
	((T20*)(C))->a2 = a3;
}

/* IMMUTABLE_STRING_32.make_from_area_and_bounds */
T0* T20c16(TC* ac, T0* a1, T6 a2, T6 a3)
{
	T0* C;
	C = GE_new20(ac, EIF_TRUE);
	((T20*)(C))->a1 = a1;
	((T20*)(C))->a3 = a2;
	((T20*)(C))->a2 = a3;
	return C;
}

/* IMMUTABLE_STRING_32.item */
T3 T20f6(TC* ac, T0* C, T6 a1)
{
	T3 R = 0;
	T6 t1;
	t1 = ((T6)((a1)+(((T20*)(C))->a3)));
	t1 = ((T6)((t1)-((T6)(GE_int32(1)))));
	R = (((T16*)(((T20*)(C))->a1))->z2[t1]);
	return R;
}

/* STRING_8.grow */
void T17f56(TC* ac, T0* C, T6 a1)
{
	T6 t1;
	T1 t2;
	t1 = (T17f7(ac, C));
	t2 = (T6f4(ac, &a1, t1));
	if (t2) {
		T17f54(ac, C, a1);
	}
}

/* UTF_CONVERTER.escaped_utf_32_string_into_utf_16le_string_8 */
void T40s19(TC* ac, T0* a1, T0* a2)
{
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T10 volatile l3 = 0;
	T9 l4 = 0;
	T0* l5 = 0;
	T1 l6 = 0;
	T6 t1;
	T6 t2;
	T1 t3;
	T3 t4;
	T10 volatile t5;
	T2 t6;
	T3 t7;
	T10 volatile t8;
	T9 t9;
	T10 t10;
	l2 = (T41x2228263(ac, a1));
	t1 = (((T17*)(a2))->a2);
	t2 = ((T6)((l2)*((T6)(GE_int32(2)))));
	t1 = ((T6)((t1)+(t2)));
	T17f56(ac, a2, t1);
	while (1) {
		t3 = (T6f14(ac, (&l1), l2));
		if (t3) {
			break;
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		l3 = (T41x2228225T6(ac, a1, l1));
		t4 = (T3)(GE_nat32(65533));
		t5 = ((T10)(t4));
		t3 = (T1)((l3) == (t5));
		if (t3) {
			t3 = ((T1)((l1)<(l2)));
			if (t3) {
				t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				t4 = (T41x2228226T6(ac, a1, t1));
				t3 = (T1)((t4) == ((T3)(GE_nat32(65533))));
				if (t3) {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				} else {
					t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					t4 = (T41x2228226T6(ac, a1, t1));
					t6 = (T2)('u');
					t7 = ((T3)(t6));
					t3 = (T1)((t4) == (t7));
					if (t3) {
						t1 = ((T6)((l1)+((T6)(GE_int32(4)))));
						t3 = ((T1)((t1)<(l2)));
						if (t3) {
							t1 = ((T6)((l1)+((T6)(GE_int32(2)))));
							t2 = ((T6)((l1)+((T6)(GE_int32(5)))));
							l5 = (T41x2228304T6T6(ac, a1, t1, t2));
							t3 = (T40s5(ac, l5));
							if (t3) {
								l3 = (T40s6(ac, l5));
								t3 = ((T1)((l3)<((T10)(GE_nat32(55296)))));
								if (!(t3)) {
									t3 = (T10f12(ac, (&l3), (T10)(GE_nat32(57343))));
								}
								if (t3) {
									t4 = (T3)(GE_nat32(65533));
									l3 = ((T10)(t4));
								} else {
									l6 = EIF_TRUE;
									l1 = ((T6)((l1)+((T6)(GE_int32(5)))));
								}
							}
						}
					}
				}
			}
		}
		t3 = ((T1)(!(l6)));
		if (t3) {
			t3 = (T10f5(ac, (&l3), (T10)(GE_nat32(65535))));
			if (t3) {
				t5 = ((T10)((l3)&((T10)(GE_nat32(255)))));
				t6 = ((T2)(t5));
				T17f57(ac, a2, t6);
				t5 = ((T10)((l3)&((T10)(GE_nat32(65280)))));
				t5 = ((T10)((t5)>>((T6)(GE_int32(8)))));
				t6 = ((T2)(t5));
				T17f57(ac, a2, t6);
			} else {
				t5 = ((T10)((T6)(GE_int32(55232))));
				t8 = ((T10)((l3)>>((T6)(GE_int32(10)))));
				t5 = ((T10)((t5)+(t8)));
				l4 = (T10f24(ac, &t5));
				t9 = ((T9)((l4)&((T9)(GE_nat16(255)))));
				t6 = ((T2)(t9));
				T17f57(ac, a2, t6);
				t9 = ((T9)((l4)&((T9)(GE_nat16(65280)))));
				t9 = ((T9)((t9)>>((T6)(GE_int32(8)))));
				t6 = ((T2)(t9));
				T17f57(ac, a2, t6);
				t8 = ((T10)((T6)(GE_int32(56320))));
				t10 = ((T10)((l3)&((T10)(GE_nat32(1023)))));
				t8 = ((T10)((t8)+(t10)));
				l4 = (T10f24(ac, &t8));
				t9 = ((T9)((l4)&((T9)(GE_nat16(255)))));
				t6 = ((T2)(t9));
				T17f57(ac, a2, t6);
				t9 = ((T9)((l4)&((T9)(GE_nat16(65280)))));
				t9 = ((T9)((t9)>>((T6)(GE_int32(8)))));
				t6 = ((T2)(t9));
				T17f57(ac, a2, t6);
			}
		} else {
			l6 = EIF_FALSE;
			t10 = ((T10)((l3)&((T10)(GE_nat32(255)))));
			t6 = ((T2)(t10));
			T17f57(ac, a2, t6);
			t10 = ((T10)((l3)&((T10)(GE_nat32(65280)))));
			t10 = ((T10)((t10)>>((T6)(GE_int32(8)))));
			t6 = ((T2)(t10));
			T17f57(ac, a2, t6);
		}
	}
}

/* UC_UTF8_STRING.old_is_empty */
T1 T1078f8(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T1)((((T1078*)(C))->a1) == ((T6)(GE_int32(0))));
	return R;
}

/* UC_STRING.old_is_empty */
T1 T919f13(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T1)((((T919*)(C))->a1) == ((T6)(GE_int32(0))));
	return R;
}

/* EXECUTION_ENVIRONMENT.eif_dir_current */
T6 T105s8(TC* ac, T14 a1, T6 a2)
{
	T6 R = 0;
	{
	R = (T6)(eif_dir_current((EIF_FILENAME)(void*)a1,( EIF_INTEGER)a2));
	}
	return R;
}

/* KL_OPERATING_SYSTEM.execution_environment */
T0* T119s5(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[24]) {
		if (ac->thread_onces->reference_exception[24]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[24]);
		}
		return ac->thread_onces->reference_value[24];
	} else {
		ac->thread_onces->reference_status[24] = '\1';
		ac->thread_onces->reference_value[24] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[24] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T105c10(ac);
	ac->thread_onces->reference_value[24] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* EXECUTION_ENVIRONMENT.default_create */
T0* T105c10(TC* ac)
{
	T0* C;
	C = GE_new105(ac, EIF_TRUE);
	return C;
}

/* STRING_8.is_equal */
T1 T17f39(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T6 t2;
	T1 t3;
	T0* t4;
	T6 t5;
	t1 = (T1)(a1==C);
	if (t1) {
		R = EIF_TRUE;
	} else {
		l1 = ((T17*)(C))->a2;
		t2 = (((T17*)(a1))->a2);
		t1 = (T1)((l1) == (t2));
		if (t1) {
			l2 = ((T17*)(C))->a3;
			l3 = (((T17*)(a1))->a3);
			t3 = (T1)((l2) == ((T6)(GE_int32(0))));
			if (!(t3)) {
				t1 = (T1)((l3) == ((T6)(GE_int32(0))));
			} else {
				t1 = EIF_TRUE;
			}
			if (!(t1)) {
				t1 = (T1)((l2) == (l3));
			}
			if (t1) {
				t4 = (((T17*)(a1))->a1);
				t2 = (T17f9(ac, a1));
				t5 = (T17f9(ac, C));
				R = (T15f6(ac, ((T17*)(C))->a1, t4, t2, t5, l1));
			}
		}
	}
	return R;
}

/* SPECIAL [CHARACTER_8].same_items */
T1 T15f6(TC* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T2 t2;
	T2 t3;
	R = EIF_TRUE;
	t1 = (T1)(a1!=C);
	if (!(t1)) {
		t1 = (T1)(!(T1)((a2) == (a3)));
	}
	if (t1) {
		l1 = a2;
		l2 = a3;
		l3 = ((T6)((a2)+(a4)));
		while (1) {
			t1 = (T1)((l1) == (l3));
			if (t1) {
				break;
			}
			t2 = (((T15*)(a1))->z2[l1]);
			t3 = (((T15*)(C))->z2[l2]);
			t1 = (T1)(!(T1)((t2) == (t3)));
			if (t1) {
				R = EIF_FALSE;
				l1 = l3;
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			}
		}
	}
	return R;
}

/* KL_OPERATING_SYSTEM.variable_value */
T0* T119s3(TC* ac, T0* a1)
{
	T0* R = 0;
	T0* m1 = 0;
	T0* t1;
	T1 t2;
	t1 = (T119s5(ac));
	t1 = (T105s2(ac, a1));
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = (T18f14(ac, m1));
		if (t2) {
			R = (T18f15(ac, m1));
		} else {
			R = (T168s1(ac, m1));
		}
	}
	return R;
}

/* UC_UTF8_ROUTINES.string_to_utf8 */
T0* T168s1(TC* ac, T0* a1)
{
	T0* R = 0;
	T6 t1;
	t1 = (((T18*)(a1))->a2);
	R = (T168s6(ac, a1, (T6)(GE_int32(1)), t1));
	return R;
}

/* UC_UTF8_ROUTINES.substring_to_utf8 */
T0* T168s6(TC* ac, T0* a1, T6 a2, T6 a3)
{
	T0* R = 0;
	T6 t1;
	t1 = (T168s10(ac, a1, a2, a3));
	R = T17c49(ac, t1);
	T168s56(ac, R, a1, a2, a3);
	return R;
}

/* UC_UTF8_ROUTINES.append_substring_to_utf8 */
void T168s56(TC* ac, T0* a1, T0* a2, T6 a3, T6 a4)
{
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T10 t2;
	t1 = (T6f15(ac, &a3, a4));
	if (t1) {
		l1 = a3;
		l2 = a4;
		while (1) {
			t1 = (T6f4(ac, (&l1), l2));
			if (t1) {
				break;
			}
			t2 = (((((T0*)(a2))->id==18)?T18f7(ac, a2, l1):T17f10(ac, a2, l1)));
			T168s57(ac, a1, t2);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
}

/* UC_UTF8_ROUTINES.append_natural_32_code_to_utf8 */
void T168s57(TC* ac, T0* a1, T10 a2)
{
	T2 l1 = 0;
	T2 l2 = 0;
	T2 l3 = 0;
	T10 l4 = 0;
	T1 t1;
	T2 t2;
	T10 t3;
	t1 = ((T1)((a2)<((T10)(GE_nat32(128)))));
	if (t1) {
		t2 = ((T2)(a2));
		T17f52(ac, a1, t2);
	} else {
		t1 = ((T1)((a2)<((T10)(GE_nat32(2048)))));
		if (t1) {
			l4 = a2;
			t3 = ((T10)((l4)%((T10)(GE_nat32(64)))));
			t3 = ((T10)((t3)+((T10)(GE_nat32(128)))));
			l1 = ((T2)(t3));
			l4 = ((T10)((l4)/((T10)(GE_nat32(64)))));
			t3 = ((T10)((l4)+((T10)(GE_nat32(192)))));
			t2 = ((T2)(t3));
			T17f52(ac, a1, t2);
			T17f52(ac, a1, l1);
		} else {
			t1 = ((T1)((a2)<((T10)(GE_nat32(65536)))));
			if (t1) {
				t1 = (T10f14(ac, &a2, (T10)(GE_nat32(55296))));
				if (t1) {
					t1 = (T10f5(ac, &a2, (T10)(GE_nat32(57343))));
				}
				if (t1) {
					T17f52(ac, a1, (T2)('\377'));
				} else {
					l4 = a2;
					t3 = ((T10)((l4)%((T10)(GE_nat32(64)))));
					t3 = ((T10)((t3)+((T10)(GE_nat32(128)))));
					l2 = ((T2)(t3));
					l4 = ((T10)((l4)/((T10)(GE_nat32(64)))));
					t3 = ((T10)((l4)%((T10)(GE_nat32(64)))));
					t3 = ((T10)((t3)+((T10)(GE_nat32(128)))));
					l1 = ((T2)(t3));
					l4 = ((T10)((l4)/((T10)(GE_nat32(64)))));
					t3 = ((T10)((l4)+((T10)(GE_nat32(224)))));
					t2 = ((T2)(t3));
					T17f52(ac, a1, t2);
					T17f52(ac, a1, l1);
					T17f52(ac, a1, l2);
				}
			} else {
				t1 = (T10f5(ac, &a2, (T10)(GE_nat32(1114111))));
				if (t1) {
					l4 = a2;
					t3 = ((T10)((l4)%((T10)(GE_nat32(64)))));
					t3 = ((T10)((t3)+((T10)(GE_nat32(128)))));
					l3 = ((T2)(t3));
					l4 = ((T10)((l4)/((T10)(GE_nat32(64)))));
					t3 = ((T10)((l4)%((T10)(GE_nat32(64)))));
					t3 = ((T10)((t3)+((T10)(GE_nat32(128)))));
					l2 = ((T2)(t3));
					l4 = ((T10)((l4)/((T10)(GE_nat32(64)))));
					t3 = ((T10)((l4)%((T10)(GE_nat32(64)))));
					t3 = ((T10)((t3)+((T10)(GE_nat32(128)))));
					l1 = ((T2)(t3));
					l4 = ((T10)((l4)/((T10)(GE_nat32(64)))));
					t3 = ((T10)((l4)+((T10)(GE_nat32(240)))));
					t2 = ((T2)(t3));
					T17f52(ac, a1, t2);
					T17f52(ac, a1, l1);
					T17f52(ac, a1, l2);
					T17f52(ac, a1, l3);
				} else {
					T17f52(ac, a1, (T2)('\377'));
				}
			}
		}
	}
}

/* STRING_32.to_string_8 */
T0* T18f15(TC* ac, T0* C)
{
	T0* R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T0* m1 = 0;
	T1 t1;
	T10 t2;
	t1 = EIF_FALSE;
	if (t1) {
		R = m1;
	} else {
		l2 = ((T18*)(C))->a2;
		R = T17c49(ac, l2);
		T17f67(ac, R, l2);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t1 = (T6f4(ac, (&l1), l2));
			if (t1) {
				break;
			}
			t2 = (T18f7(ac, C, l1));
			T17f70(ac, R, t2, l1);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* STRING_32.is_valid_as_string_8 */
T1 T18f14(TC* ac, T0* C)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T3 t2;
	T6 volatile t3;
	R = EIF_TRUE;
	l1 = (T18f8(ac, C));
	l2 = ((T6)((((T18*)(C))->a2)+(l1)));
	l3 = ((T18*)(C))->a1;
	while (1) {
		t1 = (T1)((l1) == (l2));
		if (!(t1)) {
			t1 = ((T1)(!(R)));
		}
		if (t1) {
			break;
		}
		t2 = (((T16*)(l3))->z2[l1]);
		t3 = ((T6)(t2));
		R = (T6f15(ac, &t3, (T6)(GE_int32(255))));
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	return R;
}

/* EXECUTION_ENVIRONMENT.item */
T0* T105s2(TC* ac, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T14 l2 = 0;
	T14 t1;
	T1 t2;
	T0* t3;
	l1 = T909c9(ac, a1);
	t1 = (T909f3(ac, l1));
	l2 = (T105s3(ac, t1));
	t2 = ((T1)(l2==(T14)0));
	t2 = ((T1)(!(t2)));
	if (t2) {
		t3 = (T909c10(ac, l2));
		R = (T909f6(ac, t3));
	}
	return R;
}

/* NATIVE_STRING.string */
T0* T909f6(TC* ac, T0* C)
{
	T0* R = 0;
	T40 l1 = GE_default40;
	T1 t1;
	t1 = (EIF_IS_WINDOWS);
	if (t1) {
		R = (T40s9(ac, ((T909*)(C))->a1));
	} else {
		R = (T40s10(ac, ((T909*)(C))->a1));
	}
	return R;
}

/* UTF_CONVERTER.utf_8_0_pointer_to_escaped_string_32 */
T0* T40s10(TC* ac, T0* a1)
{
	T0* R = 0;
	T6 t1;
	t1 = (((T162*)(a1))->a3);
	R = T18c23(ac, t1);
	T40s22(ac, a1, R);
	return R;
}

/* UTF_CONVERTER.utf_8_0_pointer_into_escaped_string_32 */
void T40s22(TC* ac, T0* a1, T0* a2)
{
	T6 t1;
	t1 = (((T162*)(a1))->a3);
	t1 = ((T6)((t1)-((T6)(GE_int32(1)))));
	T40s26(ac, a1, (T6)(GE_int32(0)), t1, EIF_TRUE, a2);
}

/* UTF_CONVERTER.utf_8_0_subpointer_into_escaped_string_32 */
void T40s26(TC* ac, T0* a1, T6 a2, T6 a3, T1 a4, T0* a5)
{
	T6 volatile l1 = 0;
	T8 volatile l2 = 0;
	T8 l3 = 0;
	T8 l4 = 0;
	T8 l5 = 0;
	T3 l6 = 0;
	T6 t1;
	T1 t2;
	T8 t3;
	T3 t4;
	T8 t5;
	T10 t6;
	T10 t7;
	T9 t8;
	T1 t9;
	t1 = (((T18*)(a5))->a2);
	t1 = ((T6)((t1)+(a3)));
	t1 = ((T6)((t1)-(a2)));
	t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
	T18f35(ac, a5, t1);
	l1 = a2;
	while (1) {
		t2 = (T6f4(ac, (&l1), a3));
		if (t2) {
			break;
		}
		l2 = (T162f5(ac, a1, l1));
		t3 = ((T8)((T6)(GE_int32(0))));
		t2 = (T1)((l2) == (t3));
		if (t2) {
			t2 = a4;
		}
		if (t2) {
			l1 = ((T6)((a3)+((T6)(GE_int32(1)))));
		} else {
			t2 = (T8f9(ac, (&l2), (T8)(GE_nat8(127))));
			if (t2) {
				t4 = ((T3)(l2));
				T18f36(ac, a5, t4);
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			} else {
				t3 = ((T8)((l2)&((T8)(GE_nat8(224)))));
				t5 = ((T8)((T6)(GE_int32(192))));
				t2 = (T1)((t3) == (t5));
				if (t2) {
					t2 = ((T1)((l1)<(a3)));
					if (t2) {
						t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						l3 = (T162f5(ac, a1, t1));
						t3 = ((T8)((l3)&((T8)(GE_nat8(192)))));
						t5 = ((T8)((T6)(GE_int32(128))));
						t2 = (T1)((t3) == (t5));
						if (t2) {
							t6 = ((T10)(l2));
							t6 = ((T10)((t6)&((T10)(GE_nat32(31)))));
							t6 = ((T10)((t6)<<((T6)(GE_int32(6)))));
							t7 = ((T10)(l3));
							t7 = ((T10)((t7)&((T10)(GE_nat32(63)))));
							t6 = ((T10)((t6)|(t7)));
							t4 = ((T3)(t6));
							T18f36(ac, a5, t4);
							l1 = ((T6)((l1)+((T6)(GE_int32(2)))));
						} else {
							t8 = (T8f12(ac, (&l2)));
							T40s24(ac, a5, t8);
							l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						}
					} else {
						t8 = (T8f12(ac, (&l2)));
						T40s24(ac, a5, t8);
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					}
				} else {
					t3 = ((T8)((l2)&((T8)(GE_nat8(240)))));
					t5 = ((T8)((T6)(GE_int32(224))));
					t2 = (T1)((t3) == (t5));
					if (t2) {
						t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						t2 = ((T1)((t1)<(a3)));
						if (t2) {
							t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
							l3 = (T162f5(ac, a1, t1));
							t1 = ((T6)((l1)+((T6)(GE_int32(2)))));
							l4 = (T162f5(ac, a1, t1));
							t3 = ((T8)((l3)&((T8)(GE_nat8(192)))));
							t5 = ((T8)((T6)(GE_int32(128))));
							t2 = (T1)((t3) == (t5));
							if (t2) {
								t3 = ((T8)((l4)&((T8)(GE_nat8(192)))));
								t5 = ((T8)((T6)(GE_int32(128))));
								t2 = (T1)((t3) == (t5));
							}
							if (t2) {
								t6 = ((T10)(l2));
								t6 = ((T10)((t6)&((T10)(GE_nat32(15)))));
								t6 = ((T10)((t6)<<((T6)(GE_int32(12)))));
								t7 = ((T10)(l3));
								t7 = ((T10)((t7)&((T10)(GE_nat32(63)))));
								t7 = ((T10)((t7)<<((T6)(GE_int32(6)))));
								t6 = ((T10)((t6)|(t7)));
								t7 = ((T10)(l4));
								t7 = ((T10)((t7)&((T10)(GE_nat32(63)))));
								t6 = ((T10)((t6)|(t7)));
								l6 = ((T3)(t6));
								T18f36(ac, a5, l6);
								l1 = ((T6)((l1)+((T6)(GE_int32(3)))));
							} else {
								t8 = (T8f12(ac, (&l2)));
								T40s24(ac, a5, t8);
								l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
							}
						} else {
							t8 = (T8f12(ac, (&l2)));
							T40s24(ac, a5, t8);
							l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						}
					} else {
						t3 = ((T8)((l2)&((T8)(GE_nat8(248)))));
						t5 = ((T8)((T6)(GE_int32(240))));
						t2 = (T1)((t3) == (t5));
						if (t2) {
							t1 = ((T6)((l1)+((T6)(GE_int32(2)))));
							t2 = ((T1)((t1)<(a3)));
							if (t2) {
								t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
								l3 = (T162f5(ac, a1, t1));
								t1 = ((T6)((l1)+((T6)(GE_int32(2)))));
								l4 = (T162f5(ac, a1, t1));
								t1 = ((T6)((l1)+((T6)(GE_int32(3)))));
								l5 = (T162f5(ac, a1, t1));
								t3 = ((T8)((l3)&((T8)(GE_nat8(192)))));
								t5 = ((T8)((T6)(GE_int32(128))));
								t9 = (T1)((t3) == (t5));
								if (t9) {
									t3 = ((T8)((l4)&((T8)(GE_nat8(192)))));
									t5 = ((T8)((T6)(GE_int32(128))));
									t2 = (T1)((t3) == (t5));
								} else {
									t2 = EIF_FALSE;
								}
								if (t2) {
									t3 = ((T8)((l5)&((T8)(GE_nat8(192)))));
									t5 = ((T8)((T6)(GE_int32(128))));
									t2 = (T1)((t3) == (t5));
								}
								if (t2) {
									t6 = ((T10)(l2));
									t6 = ((T10)((t6)&((T10)(GE_nat32(7)))));
									t6 = ((T10)((t6)<<((T6)(GE_int32(18)))));
									t7 = ((T10)(l3));
									t7 = ((T10)((t7)&((T10)(GE_nat32(63)))));
									t7 = ((T10)((t7)<<((T6)(GE_int32(12)))));
									t6 = ((T10)((t6)|(t7)));
									t7 = ((T10)(l4));
									t7 = ((T10)((t7)&((T10)(GE_nat32(63)))));
									t7 = ((T10)((t7)<<((T6)(GE_int32(6)))));
									t6 = ((T10)((t6)|(t7)));
									t7 = ((T10)(l5));
									t7 = ((T10)((t7)&((T10)(GE_nat32(63)))));
									t6 = ((T10)((t6)|(t7)));
									t4 = ((T3)(t6));
									T18f36(ac, a5, t4);
									l1 = ((T6)((l1)+((T6)(GE_int32(4)))));
								} else {
									t8 = (T8f12(ac, (&l2)));
									T40s24(ac, a5, t8);
									l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
								}
							} else {
								t8 = (T8f12(ac, (&l2)));
								T40s24(ac, a5, t8);
								l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
							}
						} else {
							t8 = (T8f12(ac, (&l2)));
							T40s24(ac, a5, t8);
							l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						}
					}
				}
			}
		}
	}
}

/* UTF_CONVERTER.utf_16_0_pointer_to_escaped_string_32 */
T0* T40s9(TC* ac, T0* a1)
{
	T0* R = 0;
	T6 t1;
	t1 = (((T162*)(a1))->a3);
	R = T18c23(ac, t1);
	T40s21(ac, a1, R);
	return R;
}

/* UTF_CONVERTER.utf_16_0_pointer_into_escaped_string_32 */
void T40s21(TC* ac, T0* a1, T0* a2)
{
	T6 t1;
	t1 = (((T162*)(a1))->a3);
	t1 = ((T6)((t1)/((T6)(GE_int32(2)))));
	t1 = ((T6)((t1)-((T6)(GE_int32(1)))));
	T40s25(ac, a1, (T6)(GE_int32(0)), t1, EIF_TRUE, a2);
}

/* UTF_CONVERTER.utf_16_0_subpointer_into_escaped_string_32 */
void T40s25(TC* ac, T0* a1, T6 a2, T6 a3, T1 a4, T0* a5)
{
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T10 volatile l3 = 0;
	T10 volatile l4 = 0;
	T6 t1;
	T1 t2;
	T9 volatile t3;
	T10 t4;
	T3 t5;
	T9 volatile t6;
	T9 t7;
	t1 = (((T18*)(a5))->a2);
	t1 = ((T6)((t1)+(a3)));
	t1 = ((T6)((t1)-(a2)));
	t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
	T18f35(ac, a5, t1);
	l1 = ((T6)((a2)*((T6)(GE_int32(2)))));
	l2 = ((T6)((a3)*((T6)(GE_int32(2)))));
	while (1) {
		t2 = (T6f4(ac, (&l1), l2));
		if (t2) {
			break;
		}
		t3 = (T162f6(ac, a1, l1));
		l3 = (T9f13(ac, &t3));
		t4 = ((T10)((T6)(GE_int32(0))));
		t2 = (T1)((l3) == (t4));
		if (t2) {
			t2 = a4;
		}
		if (t2) {
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(2)))));
			t2 = ((T1)((l3)<((T10)(GE_nat32(55296)))));
			if (!(t2)) {
				t2 = (T10f14(ac, (&l3), (T10)(GE_nat32(57344))));
			}
			if (t2) {
				t5 = ((T3)(l3));
				T18f36(ac, a5, t5);
			} else {
				t2 = (T10f5(ac, (&l3), (T10)(GE_nat32(56319))));
				if (t2) {
					t2 = (T6f15(ac, (&l1), l2));
				}
				if (t2) {
					t6 = (T162f6(ac, a1, l1));
					l4 = (T9f13(ac, &t6));
					t2 = (T10f14(ac, (&l4), (T10)(GE_nat32(56320))));
					if (t2) {
						t2 = (T10f5(ac, (&l4), (T10)(GE_nat32(57343))));
					}
					if (t2) {
						t4 = ((T10)((l3)<<((T6)(GE_int32(10)))));
						t4 = ((T10)((t4)+(l4)));
						t4 = ((T10)((t4)-((T10)(GE_nat32(56613888)))));
						t5 = ((T3)(t4));
						T18f36(ac, a5, t5);
						l1 = ((T6)((l1)+((T6)(GE_int32(2)))));
					} else {
						t7 = ((T9)(l3));
						T40s24(ac, a5, t7);
					}
				} else {
					t7 = ((T9)(l3));
					T40s24(ac, a5, t7);
				}
			}
		}
	}
}

/* NATURAL_16.to_natural_32 */
T10 T9f13(TC* ac, T9 volatile* C)
{
	T10 R = 0;
	R = ((T10)(*C));
	return R;
}

/* MANAGED_POINTER.read_natural_16 */
T9 T162f6(TC* ac, T0* C, T6 a1)
{
	T9 volatile R = 0;
	T1567 t1;
	T14 t2;
	(t1).a1 = ((T14)&R);
	t2 = ((T14)(((char*)(((T162*)(C))->a1))+(a1)));
	T1567f4(ac, &t1, t2, (T6)(GE_int32(2)));
	return R;
}

/* TYPED_POINTER [NATURAL_16].memory_copy */
void T1567f4(TC* ac, T1567* C, T14 a1, T6 a2)
{
	T1567s6(ac, (*C).a1, a1, a2);
}

/* TYPED_POINTER [NATURAL_16].c_memcpy */
void T1567s6(TC* ac, T14 a1, T14 a2, T6 a3)
{
	{
	memcpy((void *)(void*)a1,( const void *)(void*)a2,( size_t)a3);
	}
}

/* NATIVE_STRING.make_from_pointer */
T0* T909c10(TC* ac, T14 a1)
{
	T0* C;
	T6 l1 = 0;
	T6 t1;
	C = GE_new909(ac, EIF_TRUE);
	l1 = (T909f4(ac, C, a1));
	t1 = (T909f5(ac, C));
	t1 = ((T6)((l1)+(t1)));
	((T909*)(C))->a1 = T162c13(ac, a1, t1);
	t1 = (T909f5(ac, C));
	((T909*)(C))->a2 = ((T6)((l1)/(t1)));
	return C;
}

/* NATIVE_STRING.unit_size */
T6 T909f5(TC* ac, T0* C)
{
	T6 R = 0;
	T1 t1;
	t1 = (EIF_IS_WINDOWS);
	if (t1) {
		R = (T6)(GE_int32(2));
	} else {
		R = (T6)(GE_int32(1));
	}
	return R;
}

/* NATIVE_STRING.pointer_length_in_bytes */
T6 T909f4(TC* ac, T0* C, T14 a1)
{
	T6 R = 0;
	T11 volatile l1 = 0;
	T6 volatile t1;
	T11 t2;
	T1 t3;
	l1 = (T909f8(ac, C, a1));
	t1 = (T6)(GE_int32(2147483647));
	t2 = (T6f19(ac, &t1));
	t3 = (T11f8(ac, (&l1), t2));
	if (t3) {
		R = (T11f16(ac, (&l1)));
	} else {
		R = (T6)(GE_int32(2147483647));
	}
	return R;
}

/* NATIVE_STRING.c_pointer_length_in_bytes */
T11 T909f8(TC* ac, T0* C, T14 a1)
{
	{
			#ifdef EIF_WINDOWS
				return (EIF_NATURAL_64) wcslen((void*)a1) * sizeof(wchar_t);
			#else
				return (EIF_NATURAL_64) strlen((void*)a1) * sizeof(char);
			#endif
	}
}

/* EXECUTION_ENVIRONMENT.eif_getenv */
T14 T105s3(TC* ac, T14 a1)
{
	{
#ifdef EIF_WINDOWS
	return _wgetenv ((EIF_NATIVE_CHAR *) (void*)a1);
#else
	return getenv ((EIF_NATIVE_CHAR *) (void*)a1);
#endif
	}
}

/* NATIVE_STRING.item */
T14 T909f3(TC* ac, T0* C)
{
	T14 R = 0;
	R = (((T162*)(((T909*)(C))->a1))->a1);
	return R;
}

/* NATIVE_STRING.make */
T0* T909c9(TC* ac, T0* a1)
{
	T0* C;
	T6 t1;
	C = GE_new909(ac, EIF_TRUE);
	t1 = (T41x2228263(ac, a1));
	T909f11(ac, C, t1);
	T909f12(ac, C, a1);
	return C;
}

/* NATIVE_STRING.set_string */
void T909f12(TC* ac, T0* C, T0* a1)
{
	T6 t1;
	t1 = (T41x2228263(ac, a1));
	T909f13(ac, C, a1, (T6)(GE_int32(1)), t1);
}

/* NATIVE_STRING.set_substring */
void T909f13(TC* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T40 l1 = GE_default40;
	T1 t1;
	T0* t2;
	T6 t3;
	T6 t4;
	t1 = (EIF_IS_WINDOWS);
	if (t1) {
		t2 = (T909f7(ac, C));
		T40s17(ac, a1, a2, a3, ((T909*)(C))->a1, (T6)(GE_int32(0)), t2);
	} else {
		t2 = (T909f7(ac, C));
		T40s18(ac, a1, a2, a3, ((T909*)(C))->a1, (T6)(GE_int32(0)), t2);
	}
	t2 = (T909f7(ac, C));
	t3 = (((T1067*)(t2))->a1);
	t4 = (T909f5(ac, C));
	((T909*)(C))->a2 = ((T6)((t3)/(t4)));
}

/* NATIVE_STRING.upper_cell */
T0* T909f7(TC* ac, T0* C)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[25]) {
		if (ac->thread_onces->reference_exception[25]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[25]);
		}
		return ac->thread_onces->reference_value[25];
	} else {
		ac->thread_onces->reference_status[25] = '\1';
		ac->thread_onces->reference_value[25] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[25] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T1067c2(ac, (T6)(GE_int32(0)));
	ac->thread_onces->reference_value[25] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* NATIVE_STRING.make_empty */
void T909f11(TC* ac, T0* C, T6 a1)
{
	T6 t1;
	T6 t2;
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	t2 = (T909f5(ac, C));
	t1 = ((T6)((t1)*(t2)));
	((T909*)(C))->a1 = T162c10(ac, t1);
	((T909*)(C))->a2 = (T6)(GE_int32(0));
}

/* KL_TEXT_INPUT_FILE.windows_file_system */
T0* T43s54(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[26]) {
		if (ac->thread_onces->reference_exception[26]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[26]);
		}
		return ac->thread_onces->reference_value[26];
	} else {
		ac->thread_onces->reference_status[26] = '\1';
		ac->thread_onces->reference_value[26] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[26] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T151c38(ac);
	ac->thread_onces->reference_value[26] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.make */
T0* T151c38(TC* ac)
{
	T0* C;
	C = GE_new151(ac, EIF_TRUE);
	return C;
}

/* KL_TEXT_INPUT_FILE.operating_system */
T0* T43s53(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[27]) {
		if (ac->thread_onces->reference_exception[27]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[27]);
		}
		return ac->thread_onces->reference_value[27];
	} else {
		ac->thread_onces->reference_status[27] = '\1';
		ac->thread_onces->reference_value[27] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[27] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T119c6(ac);
	ac->thread_onces->reference_value[27] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* KL_OPERATING_SYSTEM.default_create */
T0* T119c6(TC* ac)
{
	T0* C;
	C = GE_new119(ac, EIF_TRUE);
	return C;
}

/* KL_TEXT_INPUT_FILE.time_stamp */
T6 T43f15(TC* ac, T0* C)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T6 volatile R = 0;
	T1 volatile l1 = 0;
	T1 t1;
	T0* t2;
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		t1 = ((T1)(!(l1)));
		if (t1) {
			l1 = EIF_TRUE;
			ac->in_rescue = tr;
			if (tr == 0) {
				ac->exception_code = 0;
				ac->exception_tag = (char*)0;
			}
			goto GE_retry;
		}
		ac->last_rescue = r.previous;
		GE_raise(GE_EX_FAIL);
	}
GE_retry:
	R = (T6)(GE_int32(-1));
	t1 = ((T1)(!(l1)));
	if (t1) {
		t2 = (T43f23(ac, C));
		t1 = (T1)(t2!=ge396ov6488072);
		if (t1) {
			t1 = (T43f27(ac, C));
			if (t1) {
				R = (T43f29(ac, C));
				t1 = ((T1)((R)<((T6)(GE_int32(0)))));
				if (t1) {
					R = (T6)(GE_int32(-1));
				}
			}
		}
	}
	ac->last_rescue = r.previous;
	return R;
}

/* KL_TEXT_INPUT_FILE.date */
T6 T43f29(TC* ac, T0* C)
{
	T6 R = 0;
	T0* t1;
	T14 t2;
	t1 = (T43f17(ac, C));
	t2 = (((T162*)(t1))->a1);
	R = (T43s19(ac, t2));
	return R;
}

/* KL_TEXT_INPUT_FILE.eif_file_date */
T6 T43s19(TC* ac, T14 a1)
{
	T6 R = 0;
	{
	R = (T6)(eif_file_date((EIF_FILENAME)(void*)a1));
	}
	return R;
}

/* KL_TEXT_INPUT_FILE.old_exists */
T1 T43f27(TC* ac, T0* C)
{
	T1 R = 0;
	T1 t1;
	T0* t2;
	T14 t3;
	t1 = (T43f16(ac, C));
	if (t1) {
		t2 = (T43f17(ac, C));
		t3 = (((T162*)(t2))->a1);
		R = (T43s18(ac, t3));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* KL_TEXT_INPUT_FILE.file_exists */
T1 T43s18(TC* ac, T14 a1)
{
	T1 R = 0;
	{
	R = EIF_TEST(eif_file_exists((EIF_FILENAME)(void*)a1));
	}
	return R;
}

/* KL_TEXT_INPUT_FILE.old_is_closed */
T1 T43f16(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T1)((((T43*)(C))->a4) == ((T6)(GE_int32(0))));
	return R;
}

/* KL_TEXT_INPUT_FILE.count */
T6 T43f45(TC* ac, T0* C)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T6 volatile R = 0;
	T1 volatile l1 = 0;
	T1 t1;
	T0* t2;
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		t1 = ((T1)(!(l1)));
		if (t1) {
			l1 = EIF_TRUE;
			ac->in_rescue = tr;
			if (tr == 0) {
				ac->exception_code = 0;
				ac->exception_tag = (char*)0;
			}
			goto GE_retry;
		}
		ac->last_rescue = r.previous;
		GE_raise(GE_EX_FAIL);
	}
GE_retry:
	R = (T6)(GE_int32(-1));
	t1 = ((T1)(!(l1)));
	if (t1) {
		t2 = (T43f23(ac, C));
		t1 = (T1)(t2!=ge396ov6488072);
		if (t1) {
			t1 = (T43f27(ac, C));
			if (t1) {
				R = (T43f52(ac, C));
			}
		}
	}
	ac->last_rescue = r.previous;
	return R;
}

/* KL_TEXT_INPUT_FILE.old_count */
T6 T43f52(TC* ac, T0* C)
{
	T6 R = 0;
	T1 t1;
	T0* t2;
	t1 = (T43f27(ac, C));
	if (t1) {
		t1 = (T43f56(ac, C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T43f73(ac, C);
			t2 = (T43f33(ac, C));
			R = (T166f19(ac, t2));
		} else {
			R = (T43s57(ac, ((T43*)(C))->a9));
		}
	}
	return R;
}

/* KL_TEXT_INPUT_FILE.file_size */
T6 T43s57(TC* ac, T14 a1)
{
	T6 R = 0;
	{
	R = (T6)(eif_file_size((FILE *)(void*)a1));
	}
	return R;
}

/* FILE_INFO.size */
T6 T166f19(TC* ac, T0* C)
{
	T6 R = 0;
	T1076 t1;
	T0* t2;
	T14 t3;
	(t1).a1 = (((t2 = ((T166*)(C))->a1)?(T14)(GE_types[((T0*)(t2))->id][0].is_special?(T14)((T1075*)(t2))->z2:(T14)((T166*)(C))->a1):(T14)0));
	t3 = ((t1).a1);
	R = (T166s9(ac, t3, (T6)(GE_int32(6))));
	return R;
}

/* FILE_INFO.file_info */
T6 T166s9(TC* ac, T14 a1, T6 a2)
{
	T6 R = 0;
	{
	R = (T6)(eif_file_info((rt_stat_buf *)(void*)a1,( int)a2));
	}
	return R;
}

/* KL_TEXT_INPUT_FILE.set_buffer */
void T43f73(TC* ac, T0* C)
{
	T0* t1;
	T0* t2;
	t1 = (T43f33(ac, C));
	t2 = (T43f17(ac, C));
	T166f24(ac, t1, ((T43*)(C))->a5, t2);
}

/* FILE_INFO.fast_update */
void T166f24(TC* ac, T0* C, T0* a1, T0* a2)
{
	T14 t1;
	T1076 t2;
	T0* t3;
	T14 t4;
	T6 t5;
	((T166*)(C))->a4 = a1;
	((T166*)(C))->a5 = a2;
	t1 = (((T162*)(a2))->a1);
	(t2).a1 = (((t3 = ((T166*)(C))->a1)?(T14)(GE_types[((T0*)(t3))->id][0].is_special?(T14)((T1075*)(t3))->z2:(T14)((T166*)(C))->a1):(T14)0));
	t4 = ((t2).a1);
	t5 = (T166s15(ac, t1, t4, ((T166*)(C))->a2));
	((T166*)(C))->a3 = (T1)((t5) == ((T6)(GE_int32(0))));
}

/* FILE_INFO.eif_file_stat */
T6 T166s15(TC* ac, T14 a1, T14 a2, T1 a3)
{
	T6 R = 0;
	{
	R = (T6)(eif_file_stat((EIF_FILENAME)(void*)a1,( rt_stat_buf *)(void*)a2,( int)a3));
	}
	return R;
}

/* KL_TEXT_INPUT_FILE.old_is_open_write */
T1 T43f56(TC* ac, T0* C)
{
	T1 R = 0;
	T1 t1;
	T1 t2;
	t2 = (T1)((((T43*)(C))->a4) == ((T6)(GE_int32(2))));
	if (!(t2)) {
		t1 = (T1)((((T43*)(C))->a4) == ((T6)(GE_int32(4))));
	} else {
		t1 = EIF_TRUE;
	}
	if (!(t1)) {
		t1 = (T1)((((T43*)(C))->a4) == ((T6)(GE_int32(5))));
	}
	if (!(t1)) {
		R = (T1)((((T43*)(C))->a4) == ((T6)(GE_int32(3))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* KL_TEXT_INPUT_FILE.inode */
T6 T43f44(TC* ac, T0* C)
{
	T6 R = 0;
	T0* t1;
	T43f73(ac, C);
	t1 = (T43f33(ac, C));
	R = (T166f18(ac, t1));
	return R;
}

/* FILE_INFO.inode */
T6 T166f18(TC* ac, T0* C)
{
	T6 R = 0;
	T1076 t1;
	T0* t2;
	T14 t3;
	(t1).a1 = (((t2 = ((T166*)(C))->a1)?(T14)(GE_types[((T0*)(t2))->id][0].is_special?(T14)((T1075*)(t2))->z2:(T14)((T166*)(C))->a1):(T14)0));
	t3 = ((t1).a1);
	R = (T166s9(ac, t3, (T6)(GE_int32(1))));
	return R;
}

/* UC_UTF8_STRING.same_string */
T1 T1078f26(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	R = (T1078f36(ac, C, a1));
	return R;
}

/* UC_STRING.same_string */
T1 T919f17(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	R = (T919f26(ac, C, a1));
	return R;
}

/* STRING_8.same_string */
T1 T17f22(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	T6 l1 = 0;
	T1 t1;
	T6 t2;
	t1 = (T1)(a1==C);
	if (t1) {
		R = EIF_TRUE;
	} else {
		l1 = ((T17*)(C))->a2;
		t2 = (T104x2228263(ac, a1));
		t1 = (T1)((l1) == (t2));
		if (t1) {
			t1 = (T1)((l1) == ((T6)(GE_int32(0))));
			if (!(t1)) {
				R = (T17f31(ac, C, a1, (T6)(GE_int32(1)), l1, (T6)(GE_int32(1))));
			} else {
				R = EIF_TRUE;
			}
		}
	}
	return R;
}

/* STRING_8.same_characters */
T1 T17f31(TC* ac, T0* C, T0* a1, T6 a2, T6 a3, T6 a4)
{
	T1 R = 0;
	T6 volatile l1 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	T6 t4;
	t1 = ((T6)((a3)-(a2)));
	l1 = ((T6)((t1)+((T6)(GE_int32(1)))));
	t1 = ((T6)((((T17*)(C))->a2)-(a4)));
	t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
	t2 = (T6f15(ac, (&l1), t1));
	if (t2) {
		t3 = (T104x2211878(ac, a1));
		t1 = (T104x2211879(ac, a1));
		t1 = ((T6)((t1)+(a2)));
		t1 = ((T6)((t1)-((T6)(GE_int32(1)))));
		t4 = (T17f9(ac, C));
		t4 = ((T6)((t4)+(a4)));
		t4 = ((T6)((t4)-((T6)(GE_int32(1)))));
		R = (T15f6(ac, ((T17*)(C))->a1, t3, t1, t4, l1));
	}
	return R;
}

/* KL_TEXT_INPUT_FILE.tmp_file1 */
T0* T43s43(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[28]) {
		if (ac->thread_onces->reference_exception[28]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[28]);
		}
		return ac->thread_onces->reference_value[28];
	} else {
		ac->thread_onces->reference_status[28] = '\1';
		ac->thread_onces->reference_value[28] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[28] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T43c61(ac, ge396ov6488074);
	ac->thread_onces->reference_value[28] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* KL_TEXT_INPUT_FILE.exists */
T1 T43f35(TC* ac, T0* C)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T1 volatile R = 0;
	T1 volatile l1 = 0;
	T1 t1;
	T0* t2;
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		t1 = ((T1)(!(l1)));
		if (t1) {
			l1 = EIF_TRUE;
			ac->in_rescue = tr;
			if (tr == 0) {
				ac->exception_code = 0;
				ac->exception_tag = (char*)0;
			}
			goto GE_retry;
		}
		ac->last_rescue = r.previous;
		GE_raise(GE_EX_FAIL);
	}
GE_retry:
	t1 = ((T1)(!(l1)));
	if (t1) {
		t2 = (T43f23(ac, C));
		t1 = (T1)(t2!=ge396ov6488072);
		if (t1) {
			t1 = (T43f27(ac, C));
			if (t1) {
				R = (T43f37(ac, C));
			} else {
				R = EIF_FALSE;
			}
		}
	} else {
		R = EIF_FALSE;
	}
	ac->last_rescue = r.previous;
	return R;
}

/* KL_TEXT_INPUT_FILE.is_plain */
T1 T43f37(TC* ac, T0* C)
{
	T1 R = 0;
	T0* t1;
	T43f73(ac, C);
	t1 = (T43f33(ac, C));
	R = (T166f12(ac, t1));
	return R;
}

/* FILE_INFO.is_plain */
T1 T166f12(TC* ac, T0* C)
{
	T1 R = 0;
	T1076 t1;
	T0* t2;
	T14 t3;
	T6 t4;
	(t1).a1 = (((t2 = ((T166*)(C))->a1)?(T14)(GE_types[((T0*)(t2))->id][0].is_special?(T14)((T1075*)(t2))->z2:(T14)((T166*)(C))->a1):(T14)0));
	t3 = ((t1).a1);
	t4 = (T166s9(ac, t3, (T6)(GE_int32(13))));
	R = (T1)(!(T1)((t4) == ((T6)(GE_int32(0)))));
	return R;
}

/* KL_STRING_ROUTINES.as_string_no_uc_string */
T0* T108s2(TC* ac, T0* a1)
{
	T0* R = 0;
	T0* m1 = 0;
	T0* m2 = 0;
	T1 t1;
	T1 t2;
	T0* t3;
	t1 = (a1?((m1 = a1, T108s2ot1(ac, a1))):EIF_FALSE);
	if (t1) {
		t2 = (EIF_TRUE);
		t1 = ((T1)(!(t2)));
		if (t1) {
			t3 = (((((T0*)(m1))->id==919)?T919f61(ac, m1):T1078f21(ac, m1)));
			t1 = EIF_FALSE;
		}
		if (t1) {
			R = m2;
		} else {
			R = (((((T0*)(m1))->id==919)?T919f56(ac, m1):T1078f20(ac, m1)));
		}
	} else {
		R = a1;
	}
	return R;
}

T1 T108s2ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* KL_TEXT_INPUT_FILE.string_ */
T0* T43s22(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[1]) {
		if (ac->thread_onces->reference_exception[1]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[1]);
		}
		return ac->thread_onces->reference_value[1];
	} else {
		ac->thread_onces->reference_status[1] = '\1';
		ac->thread_onces->reference_value[1] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[1] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T108c22(ac);
	ac->thread_onces->reference_value[1] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* KL_TEXT_INPUT_FILE.string_name */
T0* T43f23(TC* ac, T0* C)
{
	T0* R = 0;
	R = (T41x2228280(ac, ((T43*)(C))->a5));
	return R;
}

/* UC_UTF8_STRING.as_string_8 */
T0* T1078f27(TC* ac, T0* C)
{
	T0* R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T10 l3 = 0;
	T0* m1 = 0;
	T1 t1;
	t1 = (m1 = C, EIF_TRUE);
	if (t1) {
		R = m1;
	} else {
		l2 = ((T1078*)(C))->a1;
		R = T17c49(ac, l2);
		if (((T0*)(R))->id==1078) {
			T1078f89(ac, R, l2);
		} else {
			T17f67(ac, R, l2);
		}
		l1 = (T6)(GE_int32(1));
		while (1) {
			t1 = (T6f4(ac, (&l1), l2));
			if (t1) {
				break;
			}
			l3 = (T1078f48(ac, C, l1));
			t1 = (((((T0*)(R))->id==1078)?T1078f52(ac, R, l3):T17f28(ac, R, l3)));
			if (t1) {
				if (((T0*)(R))->id==1078) {
					T1078f90(ac, R, l3, l1);
				} else {
					T17f70(ac, R, l3, l1);
				}
			} else {
				if (((T0*)(R))->id==1078) {
					T1078f90(ac, R, (T10)(GE_nat32(0)), l1);
				} else {
					T17f70(ac, R, (T10)(GE_nat32(0)), l1);
				}
			}
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* STRING_8.valid_code */
T1 T17f28(TC* ac, T0* C, T10 a1)
{
	T1 R = 0;
	T6 volatile t1;
	T10 t2;
	t1 = (T6)(GE_int32(255));
	t2 = (T6f20(ac, &t1));
	R = (T10f5(ac, &a1, t2));
	return R;
}

/* UC_UTF8_STRING.valid_code */
T1 T1078f52(TC* ac, T0* C, T10 a1)
{
	T1 R = 0;
	T6 volatile t1;
	T10 t2;
	t1 = (T6)(GE_int32(255));
	t2 = (T6f20(ac, &t1));
	R = (T10f5(ac, &a1, t2));
	return R;
}

/* UC_STRING.as_string_8 */
T0* T919f12(TC* ac, T0* C)
{
	T0* R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T10 l3 = 0;
	T0* m1 = 0;
	T1 t1;
	t1 = (m1 = C, EIF_TRUE);
	if (t1) {
		R = m1;
	} else {
		l2 = ((T919*)(C))->a1;
		R = T17c49(ac, l2);
		if (((T0*)(R))->id==919) {
			T919f87(ac, R, l2);
		} else {
			T17f67(ac, R, l2);
		}
		l1 = (T6)(GE_int32(1));
		while (1) {
			t1 = (T6f4(ac, (&l1), l2));
			if (t1) {
				break;
			}
			l3 = (T919f10(ac, C, l1));
			t1 = (((((T0*)(R))->id==919)?T919f39(ac, R, l3):T17f28(ac, R, l3)));
			if (t1) {
				if (((T0*)(R))->id==919) {
					T919f88(ac, R, l3, l1);
				} else {
					T17f70(ac, R, l3, l1);
				}
			} else {
				if (((T0*)(R))->id==919) {
					T919f88(ac, R, (T10)(GE_nat32(0)), l1);
				} else {
					T17f70(ac, R, (T10)(GE_nat32(0)), l1);
				}
			}
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* UC_STRING.valid_code */
T1 T919f39(TC* ac, T0* C, T10 a1)
{
	T1 R = 0;
	T6 volatile t1;
	T10 t2;
	t1 = (T6)(GE_int32(255));
	t2 = (T6f20(ac, &t1));
	R = (T10f5(ac, &a1, t2));
	return R;
}

/* STRING_8.as_string_8 */
T0* T17f14(TC* ac, T0* C)
{
	T0* R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T10 l3 = 0;
	T0* m1 = 0;
	T1 t1;
	t1 = (m1 = C, EIF_TRUE);
	if (t1) {
		R = m1;
	} else {
		l2 = ((T17*)(C))->a2;
		R = T17c49(ac, l2);
		T17f67(ac, R, l2);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t1 = (T6f4(ac, (&l1), l2));
			if (t1) {
				break;
			}
			l3 = (T17f10(ac, C, l1));
			t1 = (T17f28(ac, R, l3));
			if (t1) {
				T17f70(ac, R, l3, l1);
			} else {
				T17f70(ac, R, (T10)(GE_nat32(0)), l1);
			}
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* KL_TEXT_INPUT_FILE.reset */
void T43f74(TC* ac, T0* C, T0* a1)
{
	T43f61(ac, C, a1);
}

/* KL_UNIX_FILE_SYSTEM.tmp_file */
T0* T152s25(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[29]) {
		if (ac->thread_onces->reference_exception[29]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[29]);
		}
		return ac->thread_onces->reference_value[29];
	} else {
		ac->thread_onces->reference_status[29] = '\1';
		ac->thread_onces->reference_value[29] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[29] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T43c61(ac, ge397ov6504465);
	ac->thread_onces->reference_value[29] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.rename_file */
void T151s40(TC* ac, T0* a1, T0* a2)
{
	T0* t1;
	t1 = (T151s27(ac));
	T43f74(ac, t1, a1);
	t1 = (T151s27(ac));
	T43f75(ac, t1, a2);
}

/* KL_WINDOWS_FILE_SYSTEM.tmp_file */
T0* T151s27(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[29]) {
		if (ac->thread_onces->reference_exception[29]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[29]);
		}
		return ac->thread_onces->reference_value[29];
	} else {
		ac->thread_onces->reference_status[29] = '\1';
		ac->thread_onces->reference_value[29] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[29] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T43c61(ac, ge397ov6504465);
	ac->thread_onces->reference_value[29] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* KL_UNIX_FILE_SYSTEM.pathname */
T0* T152s8(TC* ac, T0* a1, T0* a2)
{
	T0* R = 0;
	T6 volatile l1 = 0;
	T6 volatile t1;
	T1 t2;
	T2 t3;
	T0* t4;
	R = (T17x229387(ac, a1));
	t1 = (T17x2228263(ac, a2));
	t2 = (T6f4(ac, &t1, (T6)(GE_int32(0))));
	if (t2) {
		l1 = (T17x2228263(ac, R));
		t2 = (T6f4(ac, (&l1), (T6)(GE_int32(0))));
		if (t2) {
			t3 = (T17x2572289T6(ac, R, l1));
			t2 = (T1)(!(T1)((t3) == ((T2)('/'))));
		}
		if (t2) {
			T17x2293809T2(ac, R, (T2)('/'));
		}
		t4 = (T152s20(ac));
		R = (T108s5(ac, R, a2));
	}
	return R;
}

/* STRING_8.twin */
T0* T17f13(TC* ac, T0* C)
{
	T0* R = 0;
	{
	R = GE_new17(ac, EIF_TRUE);
	T17f69(ac, R, C);
	}
	return R;
}

/* STRING_8.copy */
void T17f69(TC* ac, T0* C, T0* a1)
{
	T0* l1 = 0;
	T1 t1;
	T1 t2;
	T0* t3;
	T6 volatile t4;
	T6 t5;
	t1 = (T1)(a1!=C);
	if (t1) {
		l1 = ((T17*)(C))->a1;
		memcpy(((char*)(C)) + offsetof(T17, a1), ((char*)(a1)) + offsetof(T17, a1), sizeof(T17) - offsetof(T17, a1));
		t2 = (T1)(l1==EIF_VOID);
		if (!(t2)) {
			t3 = (((T17*)(a1))->a1);
			t1 = (T1)(l1==t3);
		} else {
			t1 = EIF_TRUE;
		}
		if (!(t1)) {
			t4 = (((T15*)(l1))->a2);
			t1 = (T6f15(ac, &t4, ((T17*)(C))->a2));
		}
		if (t1) {
			t5 = ((T6)((((T17*)(C))->a2)+((T6)(GE_int32(1)))));
			((T17*)(C))->a1 = (T15f7(ac, ((T17*)(C))->a1, t5));
		} else {
			T15f14(ac, l1, ((T17*)(C))->a1, (T6)(GE_int32(0)), (T6)(GE_int32(0)), ((T17*)(C))->a2);
			((T17*)(C))->a1 = l1;
		}
		((T17*)(C))->a3 = (T6)(GE_int32(0));
		((T17*)(C))->a4 = (T6)(GE_int32(0));
	}
}

/* KL_WINDOWS_FILE_SYSTEM.pathname */
T0* T151s8(TC* ac, T0* a1, T0* a2)
{
	T0* R = 0;
	T6 volatile l1 = 0;
	T6 volatile t1;
	T1 t2;
	T2 t3;
	T1 t4;
	T0* t5;
	R = (T17x229387(ac, a1));
	t1 = (T17x2228263(ac, a2));
	t2 = (T6f4(ac, &t1, (T6)(GE_int32(0))));
	if (t2) {
		l1 = (T17x2228263(ac, R));
		t2 = (T6f4(ac, (&l1), (T6)(GE_int32(0))));
		if (t2) {
			t3 = (T17x2572289T6(ac, R, l1));
			t4 = (T151s21(ac, t3));
			t2 = ((T1)(!(t4)));
		}
		if (t2) {
			T17x2293809T2(ac, R, (T2)('\\'));
		}
		t5 = (T151s20(ac));
		R = (T108s5(ac, R, a2));
	}
	return R;
}

/* GECC.execute_with_arguments */
T0* T118c11(TC* ac, T0* a1)
{
	T0* C;
	T0* l1 = 0;
	C = GE_new118(ac, EIF_TRUE);
	l1 = T160c7(ac);
	T118f12(ac, C, a1, l1);
	return C;
}

/* GECC.execute_with_arguments_and_error_handler */
void T118f12(TC* ac, T0* C, T0* a1, T0* a2)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T6 volatile l6 = 0;
	T6 volatile l7 = 0;
	T0* t1;
	T1 t2;
	T1 t3;
	T6 t4;
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		((T118*)(C))->a1 = (T6)(GE_int32(4));
		ac->last_rescue = r.previous;
		GE_raise(GE_EX_FAIL);
	}
GE_retry:
	t1 = (T118s9(ac));
	T33f7(ac, t1, GE_ms8("gecc", 4));
	t1 = (T118s6(ac));
	T44s16(ac);
	t1 = (T118s7(ac));
	T45s18(ac);
	((T118*)(C))->a2 = a2;
	T118f13(ac, C, a1);
	t2 = (T1)((((T118*)(C))->a1) == ((T6)(GE_int32(0))));
	if (t2) {
		t3 = (T46f9(ac, ((T118*)(C))->a3));
		t2 = ((T1)(!(t3)));
	}
	if (t2) {
		l1 = ((T118*)(C))->a4;
		l2 = T43c61(ac, l1);
		T43f62(ac, l2);
		t2 = (T43f30(ac, l2));
		if (t2) {
			l3 = T170c21(ac, (T6)(GE_int32(50)));
			T43f64(ac, l2);
			while (1) {
				t2 = (((T43*)(l2))->a2);
				if (t2) {
					break;
				}
				t1 = (((T43*)(l2))->a3);
				l4 = (T17f13(ac, t1));
				T17f68(ac, l4);
				t3 = (T17f15(ac, l4));
				t2 = ((T1)(!(t3)));
				if (t2) {
					t3 = (T17f21(ac, l4, GE_ms8("#", 1)));
					if (t3) {
						t3 = (T17x2211869T0(ac, l1, GE_ms8(".sh", 3)));
					}
					t2 = ((T1)(!(t3)));
				}
				if (t2) {
					T170f25(ac, l3, l4);
				}
				T43f64(ac, l2);
			}
			T43f63(ac, l2);
			t2 = (T170f7(ac, l3));
			t2 = ((T1)(!(t2)));
			if (t2) {
				l5 = T159c10(ac);
				l7 = (T118f8(ac, C));
				t4 = (((T170*)(l3))->a1);
				t4 = ((T6)((t4)-((T6)(GE_int32(1)))));
				l6 = (T6f17(ac, (&l7), t4));
				t2 = (T6f14(ac, (&l6), (T6)(GE_int32(2))));
				if (t2) {
					t1 = T118f12ac1(ac, C, l3, (T6)(GE_int32(1)), l5);
					T118f15(ac, C, t1, l6);
				}
				T118f14(ac, C, l3, (T6)(GE_int32(0)), l5);
			}
		} else {
			T118f16(ac, C, l1);
			((T118*)(C))->a1 = (T6)(GE_int32(1));
		}
	}
	ac->last_rescue = r.previous;
}

/* Function for agent #1 in feature GECC.execute_with_arguments_and_error_handler */
void T118f12af1(TC* ac, T0* a1, T0* a2)
{
	T118f14(ac, ((T1023*)(a1))->z1, ((T1023*)(a1))->z2, ((T1023*)(a1))->z3, ((T1023*)(a1))->z4);
}

/* Creation of agent #1 in feature GECC.execute_with_arguments_and_error_handler */
T0* T118f12ac1(TC* ac, T0* a1, T0* a2, T6 a3, T0* a4)
{
	T0* R;
	T0* t1;
	R = GE_new996(ac, EIF_TRUE);
	t1 = GE_new1023(ac, EIF_TRUE);
	((T1023*)(t1))->z1 = a1;
	((T1023*)(t1))->z2 = a2;
	((T1023*)(t1))->z3 = a3;
	((T1023*)(t1))->z4 = a4;
	T996f7(ac, R, (T14)&T118f12af1, (T14)&T118f12af1, (T14)0, t1, EIF_TRUE, 0);
	return R;
}

/* PROCEDURE [TUPLE].set_rout_disp_final */
void T996f7(TC* ac, T0* C, T14 a1, T14 a2, T14 a3, T0* a4, T1 a5, T6 a6)
{
	((T996*)(C))->a1 = a1;
	((T996*)(C))->a3 = a2;
	((T996*)(C))->a4 = a3;
	((T996*)(C))->a2 = a4;
	((T996*)(C))->a5 = a5;
	((T996*)(C))->a6 = a6;
}

/* GECC.report_cannot_read_error */
void T118f16(TC* ac, T0* C, T0* a1)
{
	T0* l1 = 0;
	l1 = T83c8(ac, a1);
	T160f9(ac, ((T118*)(C))->a2, l1);
}

/* UT_ERROR_HANDLER.report_error */
void T160f9(TC* ac, T0* C, T0* a1)
{
	T0* t1;
	t1 = (T160f5(ac, C, a1));
	T160f11(ac, C, t1);
}

/* UT_ERROR_HANDLER.report_error_message */
void T160f11(TC* ac, T0* C, T0* a1)
{
	if (((T0*)(((T160*)(C))->a1))->id==39) {
		T39f7(ac, ((T160*)(C))->a1, a1);
	} else {
		T230f4(ac, ((T160*)(C))->a1, a1);
	}
}

/* KL_STDERR_FILE.put_line */
void T39f7(TC* ac, T0* C, T0* a1)
{
	T39f6(ac, C, a1);
	T39f8(ac, C);
}

/* KL_STDERR_FILE.put_new_line */
void T39f8(TC* ac, T0* C)
{
	T39f6(ac, C, ge410ov6307841);
}

/* UT_ERROR_HANDLER.message */
T0* T160f5(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	R = (T84x11878403(ac, a1));
	return R;
}

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.default_message */
T0* T2275f5(TC* ac, T0* C)
{
	T0* R = 0;
	R = (T2275f3(ac, C, ge1673ov11878404));
	return R;
}

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.message */
T0* T2275f3(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T2275s4(ac));
	R = (T108s3(ac, a1, l4));
	while (1) {
		t2 = (T6f4(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f24(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (T1)(!(T1)((l5) == ((T2)('$'))));
		if (t2) {
			t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
			if (t2) {
				T17x2293809T2(ac, R, l5);
			} else {
				t1 = (T2275s4(ac));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T108s4(ac, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(ac, (&l2), l4));
			if (t2) {
				T17x2293809T2(ac, R, (T2)('$'));
			} else {
				l5 = (T17f24(ac, a1, l2));
				t2 = (T1)((l5) == ((T2)('$')));
				if (t2) {
					T17x2293809T2(ac, R, (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T2275s4(ac));
					l1 = (T108s3(ac, a1, (T6)(GE_int32(5))));
					t2 = (T1)((l5) == ((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l8;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							t2 = (T1)((l5) == ((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
								if (t2) {
									T17x2293809T2(ac, l1, l5);
								} else {
									t1 = (T2275s4(ac));
									T108s23(ac, l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l6;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								T17x2293809T2(ac, l1, l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17x2228255(ac, l1));
					if (t2) {
						l3 = (T17x2228289(ac, l1));
						t2 = (T34f4(ac, ((T2275*)(C))->a1, l3));
						if (t2) {
							t1 = (T2275s4(ac));
							t5 = (T34f5(ac, ((T2275*)(C))->a1, l3));
							R = (T108s5(ac, R, t5));
						} else {
							t2 = (T1)((l3) == ((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T2275s4(ac));
								t5 = (T2275s6(ac));
								t5 = (((T33*)(t5))->a1);
								R = (T108s5(ac, R, t5));
							} else {
								T17x2293809T2(ac, R, (T2)('$'));
								if (l7) {
									T17x2293809T2(ac, R, (T2)('{'));
								}
								t1 = (T2275s4(ac));
								R = (T108s5(ac, R, l1));
								if (l8) {
									T17x2293809T2(ac, R, (T2)('}'));
								}
							}
						}
					} else {
						T17x2293809T2(ac, R, (T2)('$'));
						if (l7) {
							T17x2293809T2(ac, R, (T2)('{'));
						}
						t1 = (T2275s4(ac));
						R = (T108s5(ac, R, l1));
						if (l8) {
							T17x2293809T2(ac, R, (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.arguments */
T0* T2275s6(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[30]) {
		if (ac->thread_onces->reference_exception[30]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[30]);
		}
		return ac->thread_onces->reference_value[30];
	} else {
		ac->thread_onces->reference_status[30] = '\1';
		ac->thread_onces->reference_value[30] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[30] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T33c6(ac);
	ac->thread_onces->reference_value[30] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* KL_ARGUMENTS.make */
T0* T33c6(TC* ac)
{
	T0* C;
	C = GE_new33(ac, EIF_TRUE);
	((T33*)(C))->a1 = (T33s3(ac, (T6)(GE_int32(0))));
	return C;
}

/* KL_ARGUMENTS.argument */
T0* T33s3(TC* ac, T6 a1)
{
	T0* R = 0;
	T0* t1;
	t1 = (T33s4(ac));
	t1 = (T156s2(ac, a1));
	R = (T20f12(ac, t1));
	return R;
}

/* IMMUTABLE_STRING_32.as_string_8 */
T0* T20f12(TC* ac, T0* C)
{
	T0* R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T10 l3 = 0;
	T0* m1 = 0;
	T1 t1;
	t1 = EIF_FALSE;
	if (t1) {
		R = m1;
	} else {
		l2 = ((T20*)(C))->a2;
		R = T17c49(ac, l2);
		T17f67(ac, R, l2);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t1 = (T6f4(ac, (&l1), l2));
			if (t1) {
				break;
			}
			l3 = (T20f5(ac, C, l1));
			t1 = (T17f28(ac, R, l3));
			if (t1) {
				T17f70(ac, R, l3, l1);
			} else {
				T17f70(ac, R, (T10)(GE_nat32(0)), l1);
			}
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* ARGUMENTS_32.argument */
T0* T156s2(TC* ac, T6 a1)
{
	T0* R = 0;
	T0* t1;
	t1 = (T156s3(ac));
	R = (T1073f5(ac, t1, a1));
	return R;
}

/* ARRAY [IMMUTABLE_STRING_32].item */
T0* T1073f5(TC* ac, T0* C, T6 a1)
{
	T0* R = 0;
	T6 t1;
	t1 = ((T6)((a1)-(((T1073*)(C))->a2)));
	R = (((T1074*)(((T1073*)(C))->a1))->z2[t1]);
	return R;
}

/* ARGUMENTS_32.internal_argument_array */
T0* T156s3(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	T6 volatile l1 = 0;
	T0* t1;
	T6 t2;
	T1 t3;
	if (ac->thread_onces->reference_status[31]) {
		if (ac->thread_onces->reference_exception[31]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[31]);
		}
		return ac->thread_onces->reference_value[31];
	} else {
		ac->thread_onces->reference_status[31] = '\1';
		ac->thread_onces->reference_value[31] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[31] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	t1 = (T20c17(ac));
	t2 = ((T6)(GE_argc - 1));
	R = T1073c6(ac, t1, (T6)(GE_int32(0)), t2);
	ac->thread_onces->reference_value[31] = R;
	T1073f7(ac, R);
	while (1) {
		t2 = ((T6)(GE_argc - 1));
		t3 = (T6f4(ac, (&l1), t2));
		if (t3) {
			break;
		}
		t1 = (GE_istr32_from_nstr(GE_argv[l1]));
		T1073f8(ac, R, t1, l1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	ac->last_rescue = r.previous;
	return R;
}

/* ARRAY [IMMUTABLE_STRING_32].put */
void T1073f8(TC* ac, T0* C, T0* a1, T6 a2)
{
	T6 t1;
	t1 = ((T6)((a2)-(((T1073*)(C))->a2)));
	((T1074*)(((T1073*)(C))->a1))->z2[t1] = (a1);
}

/* ARRAY [IMMUTABLE_STRING_32].compare_objects */
void T1073f7(TC* ac, T0* C)
{
	((T1073*)(C))->a4 = EIF_TRUE;
}

/* ARRAY [IMMUTABLE_STRING_32].make_filled */
T0* T1073c6(TC* ac, T0* a1, T6 a2, T6 a3)
{
	T0* C;
	T6 l1 = 0;
	T1 t1;
	T6 t2;
	C = GE_new1073(ac, EIF_TRUE);
	((T1073*)(C))->a2 = a2;
	((T1073*)(C))->a3 = a3;
	t1 = (T6f15(ac, &a2, a3));
	if (t1) {
		t2 = ((T6)((a3)-(a2)));
		l1 = ((T6)((t2)+((T6)(GE_int32(1)))));
	}
	T1073f9(ac, C, a1, l1);
	return C;
}

/* ARRAY [IMMUTABLE_STRING_32].make_filled_area */
void T1073f9(TC* ac, T0* C, T0* a1, T6 a2)
{
	((T1073*)(C))->a1 = T1074c6(ac, a1, a2);
}

/* SPECIAL [IMMUTABLE_STRING_32].make_filled */
T0* T1074c6(TC* ac, T0* a1, T6 a2)
{
	T0* C;
	T6 t1;
	C = GE_new1074(ac, a2, EIF_TRUE);
	T1074f4(ac, C, a2);
	t1 = ((T6)((a2)-((T6)(GE_int32(1)))));
	T1074f9(ac, C, a1, (T6)(GE_int32(0)), t1);
	return C;
}

/* SPECIAL [IMMUTABLE_STRING_32].fill_with */
void T1074f9(TC* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 t1;
	T1 t2;
	l1 = a2;
	t1 = ((T6)((a3)+((T6)(GE_int32(1)))));
	l3 = (T6f17(ac, &(((T1074*)(C))->a2), t1));
	l2 = l3;
	while (1) {
		t2 = (T1)((l1) == (l2));
		if (t2) {
			break;
		}
		((T1074*)(C))->z2[l1] = (a1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	l1 = l3;
	l2 = ((T6)((a3)+((T6)(GE_int32(1)))));
	while (1) {
		t2 = (T1)((l1) == (l2));
		if (t2) {
			break;
		}
		T1074f8(ac, C, a1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
}

/* SPECIAL [IMMUTABLE_STRING_32].extend */
void T1074f8(TC* ac, T0* C, T0* a1)
{
	T6 t1;
	{
	t1 = ((T1074*)(C))->a2;
	((T1074*)(C))->a2 = t1 + 1 ;
	((T1074*)(C))->z2[t1] = a1;
	}
}

/* SPECIAL [IMMUTABLE_STRING_32].make_empty */
void T1074f4(TC* ac, T0* C, T6 a1)
{
	{
	}
}

/* SPECIAL [IMMUTABLE_STRING_32].make_empty */
T0* T1074c4(TC* ac, T6 a1)
{
	T0* C;
	C = GE_new1074(ac, a1, EIF_TRUE);
	{
	}
	return C;
}

/* IMMUTABLE_STRING_32.make_empty */
T0* T20c17(TC* ac)
{
	T0* C;
	C = GE_new20(ac, EIF_TRUE);
	T20f19(ac, C, (T6)(GE_int32(0)));
	return C;
}

/* KL_ARGUMENTS.internal_arguments */
T0* T33s4(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[32]) {
		if (ac->thread_onces->reference_exception[32]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[32]);
		}
		return ac->thread_onces->reference_value[32];
	} else {
		ac->thread_onces->reference_status[32] = '\1';
		ac->thread_onces->reference_value[32] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[32] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T156c5(ac);
	ac->thread_onces->reference_value[32] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* ARGUMENTS_32.default_create */
T0* T156c5(TC* ac)
{
	T0* C;
	C = GE_new156(ac, EIF_TRUE);
	return C;
}

/* ARRAY [STRING_8].item */
T0* T34f5(TC* ac, T0* C, T6 a1)
{
	T0* R = 0;
	T6 t1;
	t1 = ((T6)((a1)-(((T34*)(C))->a2)));
	R = (((T35*)(((T34*)(C))->a1))->z2[t1]);
	return R;
}

/* ARRAY [STRING_8].valid_index */
T1 T34f4(TC* ac, T0* C, T6 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = (T6f15(ac, &(((T34*)(C))->a2), a1));
	if (t1) {
		R = (T6f15(ac, &a1, ((T34*)(C))->a3));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* UC_UTF8_STRING.to_integer */
T6 T1078f40(TC* ac, T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	l1 = (T1078f60(ac, C));
	T1027f17(ac, l1, C, (T6)(GE_int32(0)));
	R = (T1027f13(ac, l1));
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
T6 T1027f13(TC* ac, T0* C)
{
	T6 R = 0;
	T1 t1;
	T11 t2;
	T6 t3;
	t1 = (T1)((((T1027*)(C))->a1) == ((T6)(GE_int32(1))));
	if (t1) {
		t2 = ((T11)((((T1027*)(C))->a2)*((T11)(GE_nat64(10)))));
		t2 = ((T11)((t2)+(((T1027*)(C))->a3)));
		t3 = ((T6)(t2));
		R = ((T6)(-(t3)));
	} else {
		t2 = ((T11)((((T1027*)(C))->a2)*((T11)(GE_nat64(10)))));
		t2 = ((T11)((t2)+(((T1027*)(C))->a3)));
		R = ((T6)(t2));
	}
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
void T1027f17(TC* ac, T0* C, T0* a1, T6 a2)
{
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T3 volatile l5 = 0;
	T10 volatile l6 = 0;
	T0* m1 = 0;
	T0* m2 = 0;
	T1 t1;
	T6 t2;
	T2 t3;
	T1027f22(ac, C, a2);
	t1 = (m1 = a1, EIF_TRUE);
	if (t1) {
		l3 = (T104x2211878(ac, m1));
		l1 = (T104x2211879(ac, m1));
		t2 = (T104x2228263(ac, m1));
		l2 = ((T6)((l1)+(t2)));
		while (1) {
			t1 = (T1)((l1) == (l2));
			if (!(t1)) {
				t1 = (T6f14(ac, &(((T1027*)(C))->a4), (T6)(GE_int32(4))));
			}
			if (t1) {
				break;
			}
			t3 = (((T15*)(l3))->z2[l1]);
			T1027f23(ac, C, t3);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	} else {
		t1 = EIF_FALSE;
		if (t1) {
			l4 = ((m2, (T0*)0));
			l1 = ((m2, (T6)0));
			t2 = ((m2, (T6)0));
			l2 = ((T6)((l1)+(t2)));
			while (1) {
				t1 = (T1)((l1) == (l2));
				if (!(t1)) {
					t1 = (T6f14(ac, &(((T1027*)(C))->a4), (T6)(GE_int32(4))));
				}
				if (t1) {
					break;
				}
				l5 = ((l4, l1, (T3)0));
				t1 = (T3f12(ac, (&l5)));
				if (t1) {
					t3 = ((T2)(l5));
					T1027f23(ac, C, t3);
				} else {
					((T1027*)(C))->a4 = (T6)(GE_int32(4));
				}
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		} else {
			l1 = (T6)(GE_int32(1));
			l2 = (T41x2228263(ac, a1));
			while (1) {
				t1 = (T6f4(ac, (&l1), l2));
				if (!(t1)) {
					t1 = (T6f14(ac, &(((T1027*)(C))->a4), (T6)(GE_int32(4))));
				}
				if (t1) {
					break;
				}
				l6 = (T41x2228225T6(ac, a1, l1));
				t1 = (T10f30(ac, (&l6)));
				if (t1) {
					t3 = ((T2)(l6));
					T1027f23(ac, C, t3);
				} else {
					((T1027*)(C))->a4 = (T6)(GE_int32(4));
				}
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
	}
}

/* STRING_TO_INTEGER_CONVERTOR.parse_character */
void T1027f23(TC* ac, T0* C, T2 a1)
{
	T11 l1 = 0;
	T11 l2 = 0;
	T6 volatile l3 = 0;
	T1 t1;
	T6 volatile t2;
	T6 volatile t3;
	T0* t4;
	T11 t5;
	T6 volatile t6;
	l3 = ((T1027*)(C))->a4;
	t1 = (T6f15(ac, (&l3), (T6)(GE_int32(4))));
	if (t1) {
		switch (l3) {
		case GE_int32(0):
			t1 = (T2f27(ac, &a1));
			if (t1) {
				l3 = (T6)(GE_int32(2));
				((T1027*)(C))->a2 = (T11)(GE_nat64(0));
				t2 = ((T6)(a1));
				t2 = ((T6)((t2)-((T6)(GE_int32(48)))));
				((T1027*)(C))->a3 = (T6f19(ac, &t2));
			} else {
				t1 = (T1)((a1) == ((T2)('-')));
				if (!(t1)) {
					t1 = (T1)((a1) == ((T2)('+')));
				}
				if (t1) {
					l3 = (T6)(GE_int32(1));
					t1 = (T1)((a1) == ((T2)('-')));
					if (t1) {
						((T1027*)(C))->a1 = (T6)(GE_int32(1));
					} else {
						((T1027*)(C))->a1 = (T6)(GE_int32(0));
					}
				} else {
					if (((T1027*)(C))->a8) {
						t1 = (T17f16(ac, ((T1027*)(C))->a6, a1));
					} else {
						t1 = EIF_FALSE;
					}
					if (t1) {
					} else {
						l3 = (T6)(GE_int32(4));
					}
				}
			}
			break;
		case GE_int32(1):
			t1 = (T2f27(ac, &a1));
			if (t1) {
				((T1027*)(C))->a2 = (T11)(GE_nat64(0));
				t3 = ((T6)(a1));
				t3 = ((T6)((t3)-((T6)(GE_int32(48)))));
				((T1027*)(C))->a3 = (T6f19(ac, &t3));
				l3 = (T6)(GE_int32(2));
				t1 = (T1)(!(T1)((((T1027*)(C))->a10) == ((T6)(GE_int32(0)))));
				if (t1) {
					t4 = (T1027f14(ac, C));
					t1 = (T1668f7(ac, t4, ((T1027*)(C))->a2, ((T1027*)(C))->a3, ((T1027*)(C))->a10, ((T1027*)(C))->a1));
				}
				if (t1) {
					((T1027*)(C))->a5 = EIF_TRUE;
					((T1027*)(C))->a2 = l1;
					((T1027*)(C))->a3 = l2;
					l3 = (T6)(GE_int32(5));
				}
			} else {
				l3 = (T6)(GE_int32(4));
			}
			break;
		case GE_int32(2):
			t1 = (T2f27(ac, &a1));
			if (t1) {
				l1 = ((T1027*)(C))->a2;
				l2 = ((T1027*)(C))->a3;
				t5 = ((T11)((((T1027*)(C))->a2)*((T11)(GE_nat64(10)))));
				((T1027*)(C))->a2 = ((T11)((t5)+(((T1027*)(C))->a3)));
				t6 = ((T6)(a1));
				t6 = ((T6)((t6)-((T6)(GE_int32(48)))));
				((T1027*)(C))->a3 = (T6f19(ac, &t6));
				t1 = (T1)(!(T1)((((T1027*)(C))->a10) == ((T6)(GE_int32(0)))));
				if (t1) {
					t4 = (T1027f14(ac, C));
					((T1027*)(C))->a5 = (T1668f7(ac, t4, ((T1027*)(C))->a2, ((T1027*)(C))->a3, ((T1027*)(C))->a10, ((T1027*)(C))->a1));
					t1 = (T1027f15(ac, C));
					if (t1) {
						((T1027*)(C))->a2 = l1;
						((T1027*)(C))->a3 = l2;
						l3 = (T6)(GE_int32(5));
					}
				}
			} else {
				if (((T1027*)(C))->a9) {
					t1 = (T17f16(ac, ((T1027*)(C))->a7, a1));
				} else {
					t1 = EIF_FALSE;
				}
				if (t1) {
					l3 = (T6)(GE_int32(3));
				} else {
					l3 = (T6)(GE_int32(4));
				}
			}
			break;
		case GE_int32(3):
			if (((T1027*)(C))->a9) {
				t1 = (T17f16(ac, ((T1027*)(C))->a7, a1));
			} else {
				t1 = EIF_FALSE;
			}
			if (t1) {
			} else {
				l3 = (T6)(GE_int32(4));
			}
			break;
		default:
			GE_raise(GE_EX_WHEN);
			break;
		}
	}
	((T1027*)(C))->a4 = l3;
}

/* STRING_TO_INTEGER_CONVERTOR.overflowed */
T1 T1027f15(TC* ac, T0* C)
{
	T1 R = 0;
	if (((T1027*)(C))->a5) {
		R = (T1)((((T1027*)(C))->a1) == ((T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
T0* T1027f14(TC* ac, T0* C)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[33]) {
		if (ac->thread_onces->reference_exception[33]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[33]);
		}
		return ac->thread_onces->reference_value[33];
	} else {
		ac->thread_onces->reference_status[33] = '\1';
		ac->thread_onces->reference_value[33] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[33] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T1668c13(ac);
	ac->thread_onces->reference_value[33] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* CHARACTER_8.is_digit */
T1 T2f27(TC* ac, T2 volatile* C)
{
	T1 R = 0;
	T6 t1;
	T8 volatile t2;
	t1 = ((T6)(*C));
	t2 = (T2f13(ac, C, t1));
	t2 = ((T8)((t2)&((T8)(GE_nat8(4)))));
	R = (T8f5(ac, &t2, (T8)(GE_nat8(0))));
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.reset */
void T1027f22(TC* ac, T0* C, T6 a1)
{
	((T1027*)(C))->a4 = (T6)(GE_int32(0));
	((T1027*)(C))->a2 = (T11)(GE_nat64(0));
	((T1027*)(C))->a3 = (T11)(GE_nat64(0));
	((T1027*)(C))->a1 = (T6)(GE_int32(0));
	((T1027*)(C))->a10 = a1;
	((T1027*)(C))->a5 = EIF_FALSE;
}

/* UC_UTF8_STRING.ctoi_convertor */
T0* T1078f60(TC* ac, T0* C)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[34]) {
		if (ac->thread_onces->reference_exception[34]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[34]);
		}
		return ac->thread_onces->reference_value[34];
	} else {
		ac->thread_onces->reference_status[34] = '\1';
		ac->thread_onces->reference_value[34] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[34] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T1027c16(ac);
	ac->thread_onces->reference_value[34] = R;
	T1027f18(ac, R, GE_ms8(" ", 1));
	T1027f19(ac, R, GE_ms8(" ", 1));
	T1027f20(ac, R, EIF_TRUE);
	T1027f21(ac, R, EIF_TRUE);
	ac->last_rescue = r.previous;
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
void T1027f21(TC* ac, T0* C, T1 a1)
{
	((T1027*)(C))->a9 = a1;
}

/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
void T1027f20(TC* ac, T0* C, T1 a1)
{
	((T1027*)(C))->a8 = a1;
}

/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
void T1027f19(TC* ac, T0* C, T0* a1)
{
	((T1027*)(C))->a7 = T17c85(ac, a1);
}

/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
void T1027f18(TC* ac, T0* C, T0* a1)
{
	((T1027*)(C))->a6 = T17c85(ac, a1);
}

/* STRING_TO_INTEGER_CONVERTOR.make */
T0* T1027c16(TC* ac)
{
	T0* C;
	C = GE_new1027(ac, EIF_TRUE);
	T1027f22(ac, C, (T6)(GE_int32(0)));
	((T1027*)(C))->a6 = T17c85(ac, GE_ms8(" ", 1));
	((T1027*)(C))->a7 = T17c85(ac, GE_ms8(" ", 1));
	return C;
}

/* UC_STRING.to_integer */
T6 T919f30(TC* ac, T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	l1 = (T919f52(ac, C));
	T1027f17(ac, l1, C, (T6)(GE_int32(0)));
	R = (T1027f13(ac, l1));
	return R;
}

/* UC_STRING.ctoi_convertor */
T0* T919f52(TC* ac, T0* C)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[34]) {
		if (ac->thread_onces->reference_exception[34]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[34]);
		}
		return ac->thread_onces->reference_value[34];
	} else {
		ac->thread_onces->reference_status[34] = '\1';
		ac->thread_onces->reference_value[34] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[34] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T1027c16(ac);
	ac->thread_onces->reference_value[34] = R;
	T1027f18(ac, R, GE_ms8(" ", 1));
	T1027f19(ac, R, GE_ms8(" ", 1));
	T1027f20(ac, R, EIF_TRUE);
	T1027f21(ac, R, EIF_TRUE);
	ac->last_rescue = r.previous;
	return R;
}

/* STRING_8.to_integer */
T6 T17f27(TC* ac, T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	l1 = (T17f33(ac, C));
	T1027f17(ac, l1, C, (T6)(GE_int32(0)));
	R = (T1027f13(ac, l1));
	return R;
}

/* STRING_8.ctoi_convertor */
T0* T17f33(TC* ac, T0* C)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[34]) {
		if (ac->thread_onces->reference_exception[34]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[34]);
		}
		return ac->thread_onces->reference_value[34];
	} else {
		ac->thread_onces->reference_status[34] = '\1';
		ac->thread_onces->reference_value[34] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[34] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T1027c16(ac);
	ac->thread_onces->reference_value[34] = R;
	T1027f18(ac, R, GE_ms8(" ", 1));
	T1027f19(ac, R, GE_ms8(" ", 1));
	T1027f20(ac, R, EIF_TRUE);
	T1027f21(ac, R, EIF_TRUE);
	ac->last_rescue = r.previous;
	return R;
}

/* UC_UTF8_STRING.is_integer */
T1 T1078f39(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T1078f59(ac, C, (T6)(GE_int32(3))));
	return R;
}

/* UC_UTF8_STRING.is_valid_integer_or_natural */
T1 T1078f59(TC* ac, T0* C, T6 a1)
{
	T1 R = 0;
	T0* l1 = 0;
	l1 = (T1078f60(ac, C));
	T1027f22(ac, l1, a1);
	T1027f17(ac, l1, C, a1);
	R = (T1027f12(ac, l1));
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.is_integral_integer */
T1 T1027f12(TC* ac, T0* C)
{
	T1 R = 0;
	T1 t1;
	t1 = (T1)((((T1027*)(C))->a4) == ((T6)(GE_int32(2))));
	if (!(t1)) {
		t1 = (T1)((((T1027*)(C))->a4) == ((T6)(GE_int32(3))));
	}
	if (t1) {
		R = ((T1)(!(((T1027*)(C))->a5)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* UC_STRING.is_integer */
T1 T919f29(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T919f51(ac, C, (T6)(GE_int32(3))));
	return R;
}

/* UC_STRING.is_valid_integer_or_natural */
T1 T919f51(TC* ac, T0* C, T6 a1)
{
	T1 R = 0;
	T0* l1 = 0;
	l1 = (T919f52(ac, C));
	T1027f22(ac, l1, a1);
	T1027f17(ac, l1, C, a1);
	R = (T1027f12(ac, l1));
	return R;
}

/* STRING_8.is_integer */
T1 T17f36(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T17f43(ac, C, (T6)(GE_int32(3))));
	return R;
}

/* STRING_8.is_valid_integer_or_natural */
T1 T17f43(TC* ac, T0* C, T6 a1)
{
	T1 R = 0;
	T0* l1 = 0;
	l1 = (T17f33(ac, C));
	T1027f22(ac, l1, a1);
	T1027f17(ac, l1, C, a1);
	R = (T1027f12(ac, l1));
	return R;
}

/* KL_STRING_ROUTINES.append_substring_to_string */
void T108s23(TC* ac, T0* a1, T0* a2, T6 a3, T6 a4)
{
	T6 volatile l1 = 0;
	T0* m1 = 0;
	T1 t1;
	T10 t2;
	t1 = (a1?((m1 = a1, T108s23ot1(ac, a1))):EIF_FALSE);
	if (t1) {
		if (((T0*)(m1))->id==919) {
			T919f75(ac, m1, a2, a3, a4);
		} else {
			T1078f81(ac, m1, a2, a3, a4);
		}
	} else {
		l1 = a3;
		while (1) {
			t1 = (T6f4(ac, (&l1), a4));
			if (t1) {
				break;
			}
			t2 = (T41x2228225T6(ac, a2, l1));
			T169x2326558T10(ac, a1, t2);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
}

T1 T108s23ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* KL_STRING_ROUTINES.appended_substring */
T0* T108s4(TC* ac, T0* a1, T0* a2, T6 a3, T6 a4)
{
	T0* R = 0;
	T0* m1 = 0;
	T0* m2 = 0;
	T1 t1;
	T0* t2;
	t1 = (EIF_TRUE);
	if (t1) {
		R = (T108s9(ac, a1, a2, a3, a4));
	} else {
		t1 = (a1?((m1 = a1, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t2 = (T108s6(ac, a2));
			T17x2326546T0T6T6(ac, m1, t2, a3, a4);
			R = m1;
		} else {
			t2 = (T41x2228284(ac, a1));
			t1 = EIF_FALSE;
			if (t1) {
				t2 = (T108s6(ac, a2));
				(m2, t2, a3, a4);
				R = m2;
			} else {
				R = (T108s9(ac, a1, a2, a3, a4));
			}
		}
	}
	return R;
}

/* UC_UTF8_STRING.append_substring_general */
void T1078f83(TC* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 volatile l1 = 0;
	T6 volatile l2 = 0;
	T6 volatile l3 = 0;
	T6 t1;
	T1 t2;
	T10 t3;
	t1 = ((T6)((a3)-(a2)));
	l1 = ((T6)((t1)+((T6)(GE_int32(1)))));
	t2 = (T6f4(ac, (&l1), (T6)(GE_int32(0))));
	if (t2) {
		l2 = ((T6)((l1)+(((T1078*)(C))->a1)));
		t1 = (T1078f61(ac, C));
		t2 = (T6f4(ac, (&l2), t1));
		if (t2) {
			T1078f97(ac, C, l2);
		}
		l3 = a2;
		while (1) {
			t2 = (T6f4(ac, (&l3), a3));
			if (t2) {
				break;
			}
			t3 = (T41x2228225T6(ac, a1, l3));
			T1078f79(ac, C, t3);
			l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
		}
		T1078f89(ac, C, l2);
		T1078f98(ac, C);
	}
}

/* UC_STRING.append_substring_general */
void T919f79(TC* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 volatile l1 = 0;
	T6 volatile l2 = 0;
	T6 volatile l3 = 0;
	T6 t1;
	T1 t2;
	T10 t3;
	t1 = ((T6)((a3)-(a2)));
	l1 = ((T6)((t1)+((T6)(GE_int32(1)))));
	t2 = (T6f4(ac, (&l1), (T6)(GE_int32(0))));
	if (t2) {
		l2 = ((T6)((l1)+(((T919*)(C))->a1)));
		t1 = (T919f59(ac, C));
		t2 = (T6f4(ac, (&l2), t1));
		if (t2) {
			T919f95(ac, C, l2);
		}
		l3 = a2;
		while (1) {
			t2 = (T6f4(ac, (&l3), a3));
			if (t2) {
				break;
			}
			t3 = (T41x2228225T6(ac, a1, l3));
			T919f76(ac, C, t3);
			l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
		}
		T919f87(ac, C, l2);
		T919f96(ac, C);
	}
}

/* STRING_8.append_substring_general */
void T17f63(TC* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 volatile l1 = 0;
	T6 volatile l2 = 0;
	T6 volatile l3 = 0;
	T6 t1;
	T1 t2;
	T10 t3;
	t1 = ((T6)((a3)-(a2)));
	l1 = ((T6)((t1)+((T6)(GE_int32(1)))));
	t2 = (T6f4(ac, (&l1), (T6)(GE_int32(0))));
	if (t2) {
		l2 = ((T6)((l1)+(((T17*)(C))->a2)));
		t1 = (T17f7(ac, C));
		t2 = (T6f4(ac, (&l2), t1));
		if (t2) {
			T17f54(ac, C, l2);
		}
		l3 = a2;
		while (1) {
			t2 = (T6f4(ac, (&l3), a3));
			if (t2) {
				break;
			}
			t3 = (T41x2228225T6(ac, a1, l3));
			T17f61(ac, C, t3);
			l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
		}
		T17f67(ac, C, l2);
		T17f55(ac, C);
	}
}

/* KL_STRING_ROUTINES.appended_substring_8 */
T0* T108s9(TC* ac, T0* a1, T0* a2, T6 a3, T6 a4)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* m1 = 0;
	T0* m2 = 0;
	T0* m3 = 0;
	T0* m4 = 0;
	T1 t1;
	T6 t2;
	t1 = (a1?((m1 = a1, T108s9ot1(ac, a1))):EIF_FALSE);
	if (t1) {
		if (((T0*)(m1))->id==919) {
			T919f75(ac, m1, a2, a3, a4);
		} else {
			T1078f81(ac, m1, a2, a3, a4);
		}
		R = m1;
	} else {
		t1 = (a2?((m2 = a2, T108s9ot2(ac, a2))):EIF_FALSE);
		if (t1) {
			t2 = (T41x2228263(ac, a1));
			t2 = ((T6)((t2)+(a4)));
			t2 = ((T6)((t2)-(a3)));
			t2 = ((T6)((t2)+((T6)(GE_int32(1)))));
			l1 = (((((T0*)(m2))->id==919)?T919f40(ac, m2, t2):T1078f24(ac, m2, t2)));
			if (((T0*)(l1))->id==919) {
				T919f74(ac, l1, a1);
			} else {
				T1078f78(ac, l1, a1);
			}
			if (((T0*)(l1))->id==919) {
				T919f75(ac, l1, a2, a3, a4);
			} else {
				T1078f81(ac, l1, a2, a3, a4);
			}
			R = l1;
		} else {
			t1 = (a1?((m3 = a1, EIF_TRUE)):EIF_FALSE);
			if (t1) {
				t1 = (a2?((m4 = a2, EIF_TRUE)):EIF_FALSE);
			}
			if (t1) {
				T17x2293821T0T6T6(ac, m3, m4, a3, a4);
				R = m3;
			} else {
				l1 = T919c73(ac, a1);
				if (((T0*)(l1))->id==919) {
					T919f75(ac, l1, a2, a3, a4);
				} else {
					T1078f81(ac, l1, a2, a3, a4);
				}
				R = l1;
			}
		}
	}
	return R;
}

T1 T108s9ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

T1 T108s9ot2(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* UC_UTF8_STRING.append_substring */
void T1078f82(TC* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 volatile l2 = 0;
	T6 volatile l3 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = ((T6)((a3)-(a2)));
	l2 = ((T6)((t1)+((T6)(GE_int32(1)))));
	t2 = (T6f4(ac, (&l2), (T6)(GE_int32(0))));
	if (t2) {
		l1 = ((T1078*)(C))->a1;
		l3 = ((T6)((l2)+(l1)));
		t1 = (T1078f61(ac, C));
		t2 = (T6f4(ac, (&l3), t1));
		if (t2) {
			t1 = (T1078f62(ac, C));
			t1 = ((T6)((l3)+(t1)));
			T1078f97(ac, C, t1);
		}
		t3 = (T104x2211878(ac, a1));
		t1 = (T104x2211879(ac, a1));
		t1 = ((T6)((t1)+(a2)));
		t1 = ((T6)((t1)-((T6)(GE_int32(1)))));
		T15f14(ac, ((T1078*)(C))->a2, t3, t1, l1, l2);
		((T1078*)(C))->a1 = l3;
		T1078f98(ac, C);
	}
}

/* UC_STRING.append_substring */
void T919f78(TC* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 volatile l2 = 0;
	T6 volatile l3 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = ((T6)((a3)-(a2)));
	l2 = ((T6)((t1)+((T6)(GE_int32(1)))));
	t2 = (T6f4(ac, (&l2), (T6)(GE_int32(0))));
	if (t2) {
		l1 = ((T919*)(C))->a1;
		l3 = ((T6)((l2)+(l1)));
		t1 = (T919f59(ac, C));
		t2 = (T6f4(ac, (&l3), t1));
		if (t2) {
			t1 = (T919f60(ac, C));
			t1 = ((T6)((l3)+(t1)));
			T919f95(ac, C, t1);
		}
		t3 = (T104x2211878(ac, a1));
		t1 = (T104x2211879(ac, a1));
		t1 = ((T6)((t1)+(a2)));
		t1 = ((T6)((t1)-((T6)(GE_int32(1)))));
		T15f14(ac, ((T919*)(C))->a2, t3, t1, l1, l2);
		((T919*)(C))->a1 = l3;
		T919f96(ac, C);
	}
}

/* STRING_8.append_substring */
void T17f65(TC* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 volatile l2 = 0;
	T6 volatile l3 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = ((T6)((a3)-(a2)));
	l2 = ((T6)((t1)+((T6)(GE_int32(1)))));
	t2 = (T6f4(ac, (&l2), (T6)(GE_int32(0))));
	if (t2) {
		l1 = ((T17*)(C))->a2;
		l3 = ((T6)((l2)+(l1)));
		t1 = (T17f7(ac, C));
		t2 = (T6f4(ac, (&l3), t1));
		if (t2) {
			t1 = (T17f8(ac, C));
			t1 = ((T6)((l3)+(t1)));
			T17f54(ac, C, t1);
		}
		t3 = (T104x2211878(ac, a1));
		t1 = (T104x2211879(ac, a1));
		t1 = ((T6)((t1)+(a2)));
		t1 = ((T6)((t1)-((T6)(GE_int32(1)))));
		T15f14(ac, ((T17*)(C))->a1, t3, t1, l1, l2);
		((T17*)(C))->a2 = l3;
		T17f55(ac, C);
	}
}

/* UC_UTF8_STRING.new_empty_string */
T0* T1078f24(TC* ac, T0* C, T6 a1)
{
	T0* R = 0;
	R = T1078c85(ac, a1);
	return R;
}

/* UC_STRING.new_empty_string */
T0* T919f40(TC* ac, T0* C, T6 a1)
{
	T0* R = 0;
	R = T919c84(ac, a1);
	return R;
}

/* KL_STRING_ROUTINES.new_empty_string */
T0* T108s3(TC* ac, T0* a1, T6 a2)
{
	T0* R = 0;
	T0* m1 = 0;
	T0* m2 = 0;
	T1 t1;
	T0* t2;
	t1 = (T17x229380T0(ac, a1, ge366ov5996588));
	if (t1) {
		R = T17c49(ac, a2);
	} else {
		t1 = (a1?((m1 = a1, T108s3ot1(ac, a1))):EIF_FALSE);
		if (t1) {
			t2 = (((((T0*)(m1))->id==919)?T919f40(ac, m1, a2):T1078f24(ac, m1, a2)));
			t1 = (t2?((m2 = t2, EIF_TRUE)):EIF_FALSE);
			if (!(t1)) {
				GE_raise_with_message(GE_EX_CHECK, "attached {STRING} uc_string.new_empty_string (n) as l_new_empty_string");
			}
			R = m2;
		} else {
			R = (T17x229387(ac, a1));
			T17x2326530(ac, R);
		}
	}
	return R;
}

T1 T108s3ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* UC_UTF8_STRING.old_wipe_out */
void T1078f87(TC* ac, T0* C)
{
	((T1078*)(C))->a1 = (T6)(GE_int32(0));
	T1078f87p1(ac, C);
	T1078f95(ac, C);
}

/* UC_UTF8_STRING.wipe_out */
void T1078f95(TC* ac, T0* C)
{
	((T1078*)(C))->a3 = (T6)(GE_int32(0));
	T1078f74(ac, C, (T6)(GE_int32(0)));
}

/* UC_UTF8_STRING.wipe_out */
void T1078f87p1(TC* ac, T0* C)
{
	((T1078*)(C))->a1 = (T6)(GE_int32(0));
	T1078f98(ac, C);
}

/* UC_STRING.old_wipe_out */
void T919f85(TC* ac, T0* C)
{
	((T919*)(C))->a1 = (T6)(GE_int32(0));
	T919f85p1(ac, C);
	T919f102(ac, C);
}

/* UC_STRING.wipe_out */
void T919f102(TC* ac, T0* C)
{
	((T919*)(C))->a3 = (T6)(GE_int32(0));
	T919f90(ac, C, (T6)(GE_int32(0)));
}

/* UC_STRING.wipe_out */
void T919f85p1(TC* ac, T0* C)
{
	((T919*)(C))->a1 = (T6)(GE_int32(0));
	T919f96(ac, C);
}

/* STRING_8.wipe_out */
void T17f62(TC* ac, T0* C)
{
	((T17*)(C))->a2 = (T6)(GE_int32(0));
	T17f55(ac, C);
}

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.string_ */
T0* T2275s4(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[1]) {
		if (ac->thread_onces->reference_exception[1]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[1]);
		}
		return ac->thread_onces->reference_value[1];
	} else {
		ac->thread_onces->reference_status[1] = '\1';
		ac->thread_onces->reference_value[1] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[1] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T108c22(ac);
	ac->thread_onces->reference_value[1] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* LX_CHARACTER_OUT_OF_RANGE_ERROR.default_message */
T0* T2241f5(TC* ac, T0* C)
{
	T0* R = 0;
	R = (T2241f3(ac, C, ge1658ov11878404));
	return R;
}

/* LX_CHARACTER_OUT_OF_RANGE_ERROR.message */
T0* T2241f3(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T2241s4(ac));
	R = (T108s3(ac, a1, l4));
	while (1) {
		t2 = (T6f4(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f24(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (T1)(!(T1)((l5) == ((T2)('$'))));
		if (t2) {
			t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
			if (t2) {
				T17x2293809T2(ac, R, l5);
			} else {
				t1 = (T2241s4(ac));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T108s4(ac, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(ac, (&l2), l4));
			if (t2) {
				T17x2293809T2(ac, R, (T2)('$'));
			} else {
				l5 = (T17f24(ac, a1, l2));
				t2 = (T1)((l5) == ((T2)('$')));
				if (t2) {
					T17x2293809T2(ac, R, (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T2241s4(ac));
					l1 = (T108s3(ac, a1, (T6)(GE_int32(5))));
					t2 = (T1)((l5) == ((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l8;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							t2 = (T1)((l5) == ((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
								if (t2) {
									T17x2293809T2(ac, l1, l5);
								} else {
									t1 = (T2241s4(ac));
									T108s23(ac, l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l6;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								T17x2293809T2(ac, l1, l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17x2228255(ac, l1));
					if (t2) {
						l3 = (T17x2228289(ac, l1));
						t2 = (T34f4(ac, ((T2241*)(C))->a1, l3));
						if (t2) {
							t1 = (T2241s4(ac));
							t5 = (T34f5(ac, ((T2241*)(C))->a1, l3));
							R = (T108s5(ac, R, t5));
						} else {
							t2 = (T1)((l3) == ((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T2241s4(ac));
								t5 = (T2241s6(ac));
								t5 = (((T33*)(t5))->a1);
								R = (T108s5(ac, R, t5));
							} else {
								T17x2293809T2(ac, R, (T2)('$'));
								if (l7) {
									T17x2293809T2(ac, R, (T2)('{'));
								}
								t1 = (T2241s4(ac));
								R = (T108s5(ac, R, l1));
								if (l8) {
									T17x2293809T2(ac, R, (T2)('}'));
								}
							}
						}
					} else {
						T17x2293809T2(ac, R, (T2)('$'));
						if (l7) {
							T17x2293809T2(ac, R, (T2)('{'));
						}
						t1 = (T2241s4(ac));
						R = (T108s5(ac, R, l1));
						if (l8) {
							T17x2293809T2(ac, R, (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* LX_CHARACTER_OUT_OF_RANGE_ERROR.arguments */
T0* T2241s6(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[30]) {
		if (ac->thread_onces->reference_exception[30]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[30]);
		}
		return ac->thread_onces->reference_value[30];
	} else {
		ac->thread_onces->reference_status[30] = '\1';
		ac->thread_onces->reference_value[30] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[30] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T33c6(ac);
	ac->thread_onces->reference_value[30] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* LX_CHARACTER_OUT_OF_RANGE_ERROR.string_ */
T0* T2241s4(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[1]) {
		if (ac->thread_onces->reference_exception[1]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[1]);
		}
		return ac->thread_onces->reference_value[1];
	} else {
		ac->thread_onces->reference_status[1] = '\1';
		ac->thread_onces->reference_value[1] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[1] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T108c22(ac);
	ac->thread_onces->reference_value[1] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.default_message */
T0* T2240f5(TC* ac, T0* C)
{
	T0* R = 0;
	R = (T2240f3(ac, C, ge1664ov11878404));
	return R;
}

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.message */
T0* T2240f3(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T2240s4(ac));
	R = (T108s3(ac, a1, l4));
	while (1) {
		t2 = (T6f4(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f24(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (T1)(!(T1)((l5) == ((T2)('$'))));
		if (t2) {
			t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
			if (t2) {
				T17x2293809T2(ac, R, l5);
			} else {
				t1 = (T2240s4(ac));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T108s4(ac, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(ac, (&l2), l4));
			if (t2) {
				T17x2293809T2(ac, R, (T2)('$'));
			} else {
				l5 = (T17f24(ac, a1, l2));
				t2 = (T1)((l5) == ((T2)('$')));
				if (t2) {
					T17x2293809T2(ac, R, (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T2240s4(ac));
					l1 = (T108s3(ac, a1, (T6)(GE_int32(5))));
					t2 = (T1)((l5) == ((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l8;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							t2 = (T1)((l5) == ((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
								if (t2) {
									T17x2293809T2(ac, l1, l5);
								} else {
									t1 = (T2240s4(ac));
									T108s23(ac, l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l6;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								T17x2293809T2(ac, l1, l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17x2228255(ac, l1));
					if (t2) {
						l3 = (T17x2228289(ac, l1));
						t2 = (T34f4(ac, ((T2240*)(C))->a1, l3));
						if (t2) {
							t1 = (T2240s4(ac));
							t5 = (T34f5(ac, ((T2240*)(C))->a1, l3));
							R = (T108s5(ac, R, t5));
						} else {
							t2 = (T1)((l3) == ((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T2240s4(ac));
								t5 = (T2240s6(ac));
								t5 = (((T33*)(t5))->a1);
								R = (T108s5(ac, R, t5));
							} else {
								T17x2293809T2(ac, R, (T2)('$'));
								if (l7) {
									T17x2293809T2(ac, R, (T2)('{'));
								}
								t1 = (T2240s4(ac));
								R = (T108s5(ac, R, l1));
								if (l8) {
									T17x2293809T2(ac, R, (T2)('}'));
								}
							}
						}
					} else {
						T17x2293809T2(ac, R, (T2)('$'));
						if (l7) {
							T17x2293809T2(ac, R, (T2)('{'));
						}
						t1 = (T2240s4(ac));
						R = (T108s5(ac, R, l1));
						if (l8) {
							T17x2293809T2(ac, R, (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.arguments */
T0* T2240s6(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[30]) {
		if (ac->thread_onces->reference_exception[30]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[30]);
		}
		return ac->thread_onces->reference_value[30];
	} else {
		ac->thread_onces->reference_status[30] = '\1';
		ac->thread_onces->reference_value[30] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[30] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T33c6(ac);
	ac->thread_onces->reference_value[30] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.string_ */
T0* T2240s4(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[1]) {
		if (ac->thread_onces->reference_exception[1]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[1]);
		}
		return ac->thread_onces->reference_value[1];
	} else {
		ac->thread_onces->reference_status[1] = '\1';
		ac->thread_onces->reference_value[1] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[1] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T108c22(ac);
	ac->thread_onces->reference_value[1] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* LX_FULL_AND_REJECT_ERROR.default_message */
T0* T2239f5(TC* ac, T0* C)
{
	T0* R = 0;
	R = (T2239f3(ac, C, ge1663ov11878404));
	return R;
}

/* LX_FULL_AND_REJECT_ERROR.message */
T0* T2239f3(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T2239s4(ac));
	R = (T108s3(ac, a1, l4));
	while (1) {
		t2 = (T6f4(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f24(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (T1)(!(T1)((l5) == ((T2)('$'))));
		if (t2) {
			t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
			if (t2) {
				T17x2293809T2(ac, R, l5);
			} else {
				t1 = (T2239s4(ac));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T108s4(ac, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(ac, (&l2), l4));
			if (t2) {
				T17x2293809T2(ac, R, (T2)('$'));
			} else {
				l5 = (T17f24(ac, a1, l2));
				t2 = (T1)((l5) == ((T2)('$')));
				if (t2) {
					T17x2293809T2(ac, R, (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T2239s4(ac));
					l1 = (T108s3(ac, a1, (T6)(GE_int32(5))));
					t2 = (T1)((l5) == ((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l8;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							t2 = (T1)((l5) == ((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
								if (t2) {
									T17x2293809T2(ac, l1, l5);
								} else {
									t1 = (T2239s4(ac));
									T108s23(ac, l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l6;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								T17x2293809T2(ac, l1, l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17x2228255(ac, l1));
					if (t2) {
						l3 = (T17x2228289(ac, l1));
						t2 = (T34f4(ac, ((T2239*)(C))->a1, l3));
						if (t2) {
							t1 = (T2239s4(ac));
							t5 = (T34f5(ac, ((T2239*)(C))->a1, l3));
							R = (T108s5(ac, R, t5));
						} else {
							t2 = (T1)((l3) == ((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T2239s4(ac));
								t5 = (T2239s6(ac));
								t5 = (((T33*)(t5))->a1);
								R = (T108s5(ac, R, t5));
							} else {
								T17x2293809T2(ac, R, (T2)('$'));
								if (l7) {
									T17x2293809T2(ac, R, (T2)('{'));
								}
								t1 = (T2239s4(ac));
								R = (T108s5(ac, R, l1));
								if (l8) {
									T17x2293809T2(ac, R, (T2)('}'));
								}
							}
						}
					} else {
						T17x2293809T2(ac, R, (T2)('$'));
						if (l7) {
							T17x2293809T2(ac, R, (T2)('{'));
						}
						t1 = (T2239s4(ac));
						R = (T108s5(ac, R, l1));
						if (l8) {
							T17x2293809T2(ac, R, (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* LX_FULL_AND_REJECT_ERROR.arguments */
T0* T2239s6(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[30]) {
		if (ac->thread_onces->reference_exception[30]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[30]);
		}
		return ac->thread_onces->reference_value[30];
	} else {
		ac->thread_onces->reference_status[30] = '\1';
		ac->thread_onces->reference_value[30] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[30] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T33c6(ac);
	ac->thread_onces->reference_value[30] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* LX_FULL_AND_REJECT_ERROR.string_ */
T0* T2239s4(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[1]) {
		if (ac->thread_onces->reference_exception[1]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[1]);
		}
		return ac->thread_onces->reference_value[1];
	} else {
		ac->thread_onces->reference_status[1] = '\1';
		ac->thread_onces->reference_value[1] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[1] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T108c22(ac);
	ac->thread_onces->reference_value[1] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* LX_FULL_AND_META_ERROR.default_message */
T0* T2238f5(TC* ac, T0* C)
{
	T0* R = 0;
	R = (T2238f3(ac, C, ge1662ov11878404));
	return R;
}

/* LX_FULL_AND_META_ERROR.message */
T0* T2238f3(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T2238s4(ac));
	R = (T108s3(ac, a1, l4));
	while (1) {
		t2 = (T6f4(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f24(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (T1)(!(T1)((l5) == ((T2)('$'))));
		if (t2) {
			t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
			if (t2) {
				T17x2293809T2(ac, R, l5);
			} else {
				t1 = (T2238s4(ac));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T108s4(ac, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(ac, (&l2), l4));
			if (t2) {
				T17x2293809T2(ac, R, (T2)('$'));
			} else {
				l5 = (T17f24(ac, a1, l2));
				t2 = (T1)((l5) == ((T2)('$')));
				if (t2) {
					T17x2293809T2(ac, R, (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T2238s4(ac));
					l1 = (T108s3(ac, a1, (T6)(GE_int32(5))));
					t2 = (T1)((l5) == ((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l8;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							t2 = (T1)((l5) == ((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
								if (t2) {
									T17x2293809T2(ac, l1, l5);
								} else {
									t1 = (T2238s4(ac));
									T108s23(ac, l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l6;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								T17x2293809T2(ac, l1, l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17x2228255(ac, l1));
					if (t2) {
						l3 = (T17x2228289(ac, l1));
						t2 = (T34f4(ac, ((T2238*)(C))->a1, l3));
						if (t2) {
							t1 = (T2238s4(ac));
							t5 = (T34f5(ac, ((T2238*)(C))->a1, l3));
							R = (T108s5(ac, R, t5));
						} else {
							t2 = (T1)((l3) == ((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T2238s4(ac));
								t5 = (T2238s6(ac));
								t5 = (((T33*)(t5))->a1);
								R = (T108s5(ac, R, t5));
							} else {
								T17x2293809T2(ac, R, (T2)('$'));
								if (l7) {
									T17x2293809T2(ac, R, (T2)('{'));
								}
								t1 = (T2238s4(ac));
								R = (T108s5(ac, R, l1));
								if (l8) {
									T17x2293809T2(ac, R, (T2)('}'));
								}
							}
						}
					} else {
						T17x2293809T2(ac, R, (T2)('$'));
						if (l7) {
							T17x2293809T2(ac, R, (T2)('{'));
						}
						t1 = (T2238s4(ac));
						R = (T108s5(ac, R, l1));
						if (l8) {
							T17x2293809T2(ac, R, (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* LX_FULL_AND_META_ERROR.arguments */
T0* T2238s6(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[30]) {
		if (ac->thread_onces->reference_exception[30]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[30]);
		}
		return ac->thread_onces->reference_value[30];
	} else {
		ac->thread_onces->reference_status[30] = '\1';
		ac->thread_onces->reference_value[30] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[30] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T33c6(ac);
	ac->thread_onces->reference_value[30] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* LX_FULL_AND_META_ERROR.string_ */
T0* T2238s4(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[1]) {
		if (ac->thread_onces->reference_exception[1]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[1]);
		}
		return ac->thread_onces->reference_value[1];
	} else {
		ac->thread_onces->reference_status[1] = '\1';
		ac->thread_onces->reference_value[1] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[1] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T108c22(ac);
	ac->thread_onces->reference_value[1] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* LX_BAD_CHARACTER_ERROR.default_message */
T0* T2237f5(TC* ac, T0* C)
{
	T0* R = 0;
	R = (T2237f3(ac, C, ge1653ov11878404));
	return R;
}

/* LX_BAD_CHARACTER_ERROR.message */
T0* T2237f3(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T2237s4(ac));
	R = (T108s3(ac, a1, l4));
	while (1) {
		t2 = (T6f4(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f24(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (T1)(!(T1)((l5) == ((T2)('$'))));
		if (t2) {
			t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
			if (t2) {
				T17x2293809T2(ac, R, l5);
			} else {
				t1 = (T2237s4(ac));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T108s4(ac, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(ac, (&l2), l4));
			if (t2) {
				T17x2293809T2(ac, R, (T2)('$'));
			} else {
				l5 = (T17f24(ac, a1, l2));
				t2 = (T1)((l5) == ((T2)('$')));
				if (t2) {
					T17x2293809T2(ac, R, (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T2237s4(ac));
					l1 = (T108s3(ac, a1, (T6)(GE_int32(5))));
					t2 = (T1)((l5) == ((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l8;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							t2 = (T1)((l5) == ((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
								if (t2) {
									T17x2293809T2(ac, l1, l5);
								} else {
									t1 = (T2237s4(ac));
									T108s23(ac, l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l6;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								T17x2293809T2(ac, l1, l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17x2228255(ac, l1));
					if (t2) {
						l3 = (T17x2228289(ac, l1));
						t2 = (T34f4(ac, ((T2237*)(C))->a1, l3));
						if (t2) {
							t1 = (T2237s4(ac));
							t5 = (T34f5(ac, ((T2237*)(C))->a1, l3));
							R = (T108s5(ac, R, t5));
						} else {
							t2 = (T1)((l3) == ((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T2237s4(ac));
								t5 = (T2237s6(ac));
								t5 = (((T33*)(t5))->a1);
								R = (T108s5(ac, R, t5));
							} else {
								T17x2293809T2(ac, R, (T2)('$'));
								if (l7) {
									T17x2293809T2(ac, R, (T2)('{'));
								}
								t1 = (T2237s4(ac));
								R = (T108s5(ac, R, l1));
								if (l8) {
									T17x2293809T2(ac, R, (T2)('}'));
								}
							}
						}
					} else {
						T17x2293809T2(ac, R, (T2)('$'));
						if (l7) {
							T17x2293809T2(ac, R, (T2)('{'));
						}
						t1 = (T2237s4(ac));
						R = (T108s5(ac, R, l1));
						if (l8) {
							T17x2293809T2(ac, R, (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* LX_BAD_CHARACTER_ERROR.arguments */
T0* T2237s6(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[30]) {
		if (ac->thread_onces->reference_exception[30]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[30]);
		}
		return ac->thread_onces->reference_value[30];
	} else {
		ac->thread_onces->reference_status[30] = '\1';
		ac->thread_onces->reference_value[30] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[30] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T33c6(ac);
	ac->thread_onces->reference_value[30] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* LX_BAD_CHARACTER_ERROR.string_ */
T0* T2237s4(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[1]) {
		if (ac->thread_onces->reference_exception[1]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[1]);
		}
		return ac->thread_onces->reference_value[1];
	} else {
		ac->thread_onces->reference_status[1] = '\1';
		ac->thread_onces->reference_value[1] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[1] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T108c22(ac);
	ac->thread_onces->reference_value[1] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* LX_BAD_CHARACTER_CLASS_ERROR.default_message */
T0* T2236f5(TC* ac, T0* C)
{
	T0* R = 0;
	R = (T2236f3(ac, C, ge1652ov11878404));
	return R;
}

/* LX_BAD_CHARACTER_CLASS_ERROR.message */
T0* T2236f3(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T2236s4(ac));
	R = (T108s3(ac, a1, l4));
	while (1) {
		t2 = (T6f4(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f24(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (T1)(!(T1)((l5) == ((T2)('$'))));
		if (t2) {
			t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
			if (t2) {
				T17x2293809T2(ac, R, l5);
			} else {
				t1 = (T2236s4(ac));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T108s4(ac, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(ac, (&l2), l4));
			if (t2) {
				T17x2293809T2(ac, R, (T2)('$'));
			} else {
				l5 = (T17f24(ac, a1, l2));
				t2 = (T1)((l5) == ((T2)('$')));
				if (t2) {
					T17x2293809T2(ac, R, (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T2236s4(ac));
					l1 = (T108s3(ac, a1, (T6)(GE_int32(5))));
					t2 = (T1)((l5) == ((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l8;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							t2 = (T1)((l5) == ((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
								if (t2) {
									T17x2293809T2(ac, l1, l5);
								} else {
									t1 = (T2236s4(ac));
									T108s23(ac, l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l6;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								T17x2293809T2(ac, l1, l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17x2228255(ac, l1));
					if (t2) {
						l3 = (T17x2228289(ac, l1));
						t2 = (T34f4(ac, ((T2236*)(C))->a1, l3));
						if (t2) {
							t1 = (T2236s4(ac));
							t5 = (T34f5(ac, ((T2236*)(C))->a1, l3));
							R = (T108s5(ac, R, t5));
						} else {
							t2 = (T1)((l3) == ((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T2236s4(ac));
								t5 = (T2236s6(ac));
								t5 = (((T33*)(t5))->a1);
								R = (T108s5(ac, R, t5));
							} else {
								T17x2293809T2(ac, R, (T2)('$'));
								if (l7) {
									T17x2293809T2(ac, R, (T2)('{'));
								}
								t1 = (T2236s4(ac));
								R = (T108s5(ac, R, l1));
								if (l8) {
									T17x2293809T2(ac, R, (T2)('}'));
								}
							}
						}
					} else {
						T17x2293809T2(ac, R, (T2)('$'));
						if (l7) {
							T17x2293809T2(ac, R, (T2)('{'));
						}
						t1 = (T2236s4(ac));
						R = (T108s5(ac, R, l1));
						if (l8) {
							T17x2293809T2(ac, R, (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* LX_BAD_CHARACTER_CLASS_ERROR.arguments */
T0* T2236s6(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[30]) {
		if (ac->thread_onces->reference_exception[30]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[30]);
		}
		return ac->thread_onces->reference_value[30];
	} else {
		ac->thread_onces->reference_status[30] = '\1';
		ac->thread_onces->reference_value[30] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[30] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T33c6(ac);
	ac->thread_onces->reference_value[30] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* LX_BAD_CHARACTER_CLASS_ERROR.string_ */
T0* T2236s4(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[1]) {
		if (ac->thread_onces->reference_exception[1]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[1]);
		}
		return ac->thread_onces->reference_value[1];
	} else {
		ac->thread_onces->reference_status[1] = '\1';
		ac->thread_onces->reference_value[1] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[1] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T108c22(ac);
	ac->thread_onces->reference_value[1] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* LX_MISSING_QUOTE_ERROR.default_message */
T0* T2235f5(TC* ac, T0* C)
{
	T0* R = 0;
	R = (T2235f3(ac, C, ge1670ov11878404));
	return R;
}

/* LX_MISSING_QUOTE_ERROR.message */
T0* T2235f3(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T2235s4(ac));
	R = (T108s3(ac, a1, l4));
	while (1) {
		t2 = (T6f4(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f24(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (T1)(!(T1)((l5) == ((T2)('$'))));
		if (t2) {
			t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
			if (t2) {
				T17x2293809T2(ac, R, l5);
			} else {
				t1 = (T2235s4(ac));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T108s4(ac, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(ac, (&l2), l4));
			if (t2) {
				T17x2293809T2(ac, R, (T2)('$'));
			} else {
				l5 = (T17f24(ac, a1, l2));
				t2 = (T1)((l5) == ((T2)('$')));
				if (t2) {
					T17x2293809T2(ac, R, (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T2235s4(ac));
					l1 = (T108s3(ac, a1, (T6)(GE_int32(5))));
					t2 = (T1)((l5) == ((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l8;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							t2 = (T1)((l5) == ((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
								if (t2) {
									T17x2293809T2(ac, l1, l5);
								} else {
									t1 = (T2235s4(ac));
									T108s23(ac, l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l6;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								T17x2293809T2(ac, l1, l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17x2228255(ac, l1));
					if (t2) {
						l3 = (T17x2228289(ac, l1));
						t2 = (T34f4(ac, ((T2235*)(C))->a1, l3));
						if (t2) {
							t1 = (T2235s4(ac));
							t5 = (T34f5(ac, ((T2235*)(C))->a1, l3));
							R = (T108s5(ac, R, t5));
						} else {
							t2 = (T1)((l3) == ((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T2235s4(ac));
								t5 = (T2235s6(ac));
								t5 = (((T33*)(t5))->a1);
								R = (T108s5(ac, R, t5));
							} else {
								T17x2293809T2(ac, R, (T2)('$'));
								if (l7) {
									T17x2293809T2(ac, R, (T2)('{'));
								}
								t1 = (T2235s4(ac));
								R = (T108s5(ac, R, l1));
								if (l8) {
									T17x2293809T2(ac, R, (T2)('}'));
								}
							}
						}
					} else {
						T17x2293809T2(ac, R, (T2)('$'));
						if (l7) {
							T17x2293809T2(ac, R, (T2)('{'));
						}
						t1 = (T2235s4(ac));
						R = (T108s5(ac, R, l1));
						if (l8) {
							T17x2293809T2(ac, R, (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* LX_MISSING_QUOTE_ERROR.arguments */
T0* T2235s6(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[30]) {
		if (ac->thread_onces->reference_exception[30]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[30]);
		}
		return ac->thread_onces->reference_value[30];
	} else {
		ac->thread_onces->reference_status[30] = '\1';
		ac->thread_onces->reference_value[30] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[30] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T33c6(ac);
	ac->thread_onces->reference_value[30] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* LX_MISSING_QUOTE_ERROR.string_ */
T0* T2235s4(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[1]) {
		if (ac->thread_onces->reference_exception[1]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[1]);
		}
		return ac->thread_onces->reference_value[1];
	} else {
		ac->thread_onces->reference_status[1] = '\1';
		ac->thread_onces->reference_value[1] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[1] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T108c22(ac);
	ac->thread_onces->reference_value[1] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* LX_INVALID_UNICODE_CHARACTER_ERROR.default_message */
T0* T2234f5(TC* ac, T0* C)
{
	T0* R = 0;
	R = (T2234f3(ac, C, ge1667ov11878404));
	return R;
}

/* LX_INVALID_UNICODE_CHARACTER_ERROR.message */
T0* T2234f3(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T2234s4(ac));
	R = (T108s3(ac, a1, l4));
	while (1) {
		t2 = (T6f4(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f24(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (T1)(!(T1)((l5) == ((T2)('$'))));
		if (t2) {
			t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
			if (t2) {
				T17x2293809T2(ac, R, l5);
			} else {
				t1 = (T2234s4(ac));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T108s4(ac, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(ac, (&l2), l4));
			if (t2) {
				T17x2293809T2(ac, R, (T2)('$'));
			} else {
				l5 = (T17f24(ac, a1, l2));
				t2 = (T1)((l5) == ((T2)('$')));
				if (t2) {
					T17x2293809T2(ac, R, (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T2234s4(ac));
					l1 = (T108s3(ac, a1, (T6)(GE_int32(5))));
					t2 = (T1)((l5) == ((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l8;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							t2 = (T1)((l5) == ((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
								if (t2) {
									T17x2293809T2(ac, l1, l5);
								} else {
									t1 = (T2234s4(ac));
									T108s23(ac, l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l6;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								T17x2293809T2(ac, l1, l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17x2228255(ac, l1));
					if (t2) {
						l3 = (T17x2228289(ac, l1));
						t2 = (T34f4(ac, ((T2234*)(C))->a1, l3));
						if (t2) {
							t1 = (T2234s4(ac));
							t5 = (T34f5(ac, ((T2234*)(C))->a1, l3));
							R = (T108s5(ac, R, t5));
						} else {
							t2 = (T1)((l3) == ((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T2234s4(ac));
								t5 = (T2234s6(ac));
								t5 = (((T33*)(t5))->a1);
								R = (T108s5(ac, R, t5));
							} else {
								T17x2293809T2(ac, R, (T2)('$'));
								if (l7) {
									T17x2293809T2(ac, R, (T2)('{'));
								}
								t1 = (T2234s4(ac));
								R = (T108s5(ac, R, l1));
								if (l8) {
									T17x2293809T2(ac, R, (T2)('}'));
								}
							}
						}
					} else {
						T17x2293809T2(ac, R, (T2)('$'));
						if (l7) {
							T17x2293809T2(ac, R, (T2)('{'));
						}
						t1 = (T2234s4(ac));
						R = (T108s5(ac, R, l1));
						if (l8) {
							T17x2293809T2(ac, R, (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* LX_INVALID_UNICODE_CHARACTER_ERROR.arguments */
T0* T2234s6(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[30]) {
		if (ac->thread_onces->reference_exception[30]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[30]);
		}
		return ac->thread_onces->reference_value[30];
	} else {
		ac->thread_onces->reference_status[30] = '\1';
		ac->thread_onces->reference_value[30] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[30] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T33c6(ac);
	ac->thread_onces->reference_value[30] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* LX_INVALID_UNICODE_CHARACTER_ERROR.string_ */
T0* T2234s4(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[1]) {
		if (ac->thread_onces->reference_exception[1]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[1]);
		}
		return ac->thread_onces->reference_value[1];
	} else {
		ac->thread_onces->reference_status[1] = '\1';
		ac->thread_onces->reference_value[1] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[1] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T108c22(ac);
	ac->thread_onces->reference_value[1] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* LX_UNRECOGNIZED_RULE_ERROR.default_message */
T0* T2233f5(TC* ac, T0* C)
{
	T0* R = 0;
	R = (T2233f3(ac, C, ge1683ov11878404));
	return R;
}

/* LX_UNRECOGNIZED_RULE_ERROR.message */
T0* T2233f3(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T2233s4(ac));
	R = (T108s3(ac, a1, l4));
	while (1) {
		t2 = (T6f4(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f24(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (T1)(!(T1)((l5) == ((T2)('$'))));
		if (t2) {
			t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
			if (t2) {
				T17x2293809T2(ac, R, l5);
			} else {
				t1 = (T2233s4(ac));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T108s4(ac, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(ac, (&l2), l4));
			if (t2) {
				T17x2293809T2(ac, R, (T2)('$'));
			} else {
				l5 = (T17f24(ac, a1, l2));
				t2 = (T1)((l5) == ((T2)('$')));
				if (t2) {
					T17x2293809T2(ac, R, (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T2233s4(ac));
					l1 = (T108s3(ac, a1, (T6)(GE_int32(5))));
					t2 = (T1)((l5) == ((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l8;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							t2 = (T1)((l5) == ((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
								if (t2) {
									T17x2293809T2(ac, l1, l5);
								} else {
									t1 = (T2233s4(ac));
									T108s23(ac, l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l6;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								T17x2293809T2(ac, l1, l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17x2228255(ac, l1));
					if (t2) {
						l3 = (T17x2228289(ac, l1));
						t2 = (T34f4(ac, ((T2233*)(C))->a1, l3));
						if (t2) {
							t1 = (T2233s4(ac));
							t5 = (T34f5(ac, ((T2233*)(C))->a1, l3));
							R = (T108s5(ac, R, t5));
						} else {
							t2 = (T1)((l3) == ((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T2233s4(ac));
								t5 = (T2233s6(ac));
								t5 = (((T33*)(t5))->a1);
								R = (T108s5(ac, R, t5));
							} else {
								T17x2293809T2(ac, R, (T2)('$'));
								if (l7) {
									T17x2293809T2(ac, R, (T2)('{'));
								}
								t1 = (T2233s4(ac));
								R = (T108s5(ac, R, l1));
								if (l8) {
									T17x2293809T2(ac, R, (T2)('}'));
								}
							}
						}
					} else {
						T17x2293809T2(ac, R, (T2)('$'));
						if (l7) {
							T17x2293809T2(ac, R, (T2)('{'));
						}
						t1 = (T2233s4(ac));
						R = (T108s5(ac, R, l1));
						if (l8) {
							T17x2293809T2(ac, R, (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* LX_UNRECOGNIZED_RULE_ERROR.arguments */
T0* T2233s6(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[30]) {
		if (ac->thread_onces->reference_exception[30]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[30]);
		}
		return ac->thread_onces->reference_value[30];
	} else {
		ac->thread_onces->reference_status[30] = '\1';
		ac->thread_onces->reference_value[30] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[30] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T33c6(ac);
	ac->thread_onces->reference_value[30] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* LX_UNRECOGNIZED_RULE_ERROR.string_ */
T0* T2233s4(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[1]) {
		if (ac->thread_onces->reference_exception[1]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[1]);
		}
		return ac->thread_onces->reference_value[1];
	} else {
		ac->thread_onces->reference_status[1] = '\1';
		ac->thread_onces->reference_value[1] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[1] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T108c22(ac);
	ac->thread_onces->reference_value[1] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* UT_SYNTAX_ERROR.default_message */
T0* T1679f5(TC* ac, T0* C)
{
	T0* R = 0;
	R = (T1679f3(ac, C, ge730ov11878404));
	return R;
}

/* UT_SYNTAX_ERROR.message */
T0* T1679f3(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T1679s4(ac));
	R = (T108s3(ac, a1, l4));
	while (1) {
		t2 = (T6f4(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f24(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (T1)(!(T1)((l5) == ((T2)('$'))));
		if (t2) {
			t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
			if (t2) {
				T17x2293809T2(ac, R, l5);
			} else {
				t1 = (T1679s4(ac));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T108s4(ac, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(ac, (&l2), l4));
			if (t2) {
				T17x2293809T2(ac, R, (T2)('$'));
			} else {
				l5 = (T17f24(ac, a1, l2));
				t2 = (T1)((l5) == ((T2)('$')));
				if (t2) {
					T17x2293809T2(ac, R, (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1679s4(ac));
					l1 = (T108s3(ac, a1, (T6)(GE_int32(5))));
					t2 = (T1)((l5) == ((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l8;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							t2 = (T1)((l5) == ((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
								if (t2) {
									T17x2293809T2(ac, l1, l5);
								} else {
									t1 = (T1679s4(ac));
									T108s23(ac, l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l6;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								T17x2293809T2(ac, l1, l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17x2228255(ac, l1));
					if (t2) {
						l3 = (T17x2228289(ac, l1));
						t2 = (T34f4(ac, ((T1679*)(C))->a1, l3));
						if (t2) {
							t1 = (T1679s4(ac));
							t5 = (T34f5(ac, ((T1679*)(C))->a1, l3));
							R = (T108s5(ac, R, t5));
						} else {
							t2 = (T1)((l3) == ((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T1679s4(ac));
								t5 = (T1679s6(ac));
								t5 = (((T33*)(t5))->a1);
								R = (T108s5(ac, R, t5));
							} else {
								T17x2293809T2(ac, R, (T2)('$'));
								if (l7) {
									T17x2293809T2(ac, R, (T2)('{'));
								}
								t1 = (T1679s4(ac));
								R = (T108s5(ac, R, l1));
								if (l8) {
									T17x2293809T2(ac, R, (T2)('}'));
								}
							}
						}
					} else {
						T17x2293809T2(ac, R, (T2)('$'));
						if (l7) {
							T17x2293809T2(ac, R, (T2)('{'));
						}
						t1 = (T1679s4(ac));
						R = (T108s5(ac, R, l1));
						if (l8) {
							T17x2293809T2(ac, R, (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_SYNTAX_ERROR.arguments */
T0* T1679s6(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[30]) {
		if (ac->thread_onces->reference_exception[30]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[30]);
		}
		return ac->thread_onces->reference_value[30];
	} else {
		ac->thread_onces->reference_status[30] = '\1';
		ac->thread_onces->reference_value[30] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[30] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T33c6(ac);
	ac->thread_onces->reference_value[30] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* UT_SYNTAX_ERROR.string_ */
T0* T1679s4(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[1]) {
		if (ac->thread_onces->reference_exception[1]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[1]);
		}
		return ac->thread_onces->reference_value[1];
	} else {
		ac->thread_onces->reference_status[1] = '\1';
		ac->thread_onces->reference_value[1] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[1] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T108c22(ac);
	ac->thread_onces->reference_value[1] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* UT_VERSION_NUMBER.default_message */
T0* T103f3(TC* ac, T0* C)
{
	T0* R = 0;
	R = (T103f5(ac, C, ge735ov11878404));
	return R;
}

/* UT_VERSION_NUMBER.message */
T0* T103f5(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T103s6(ac));
	R = (T108s3(ac, a1, l4));
	while (1) {
		t2 = (T6f4(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f24(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (T1)(!(T1)((l5) == ((T2)('$'))));
		if (t2) {
			t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
			if (t2) {
				T17x2293809T2(ac, R, l5);
			} else {
				t1 = (T103s6(ac));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T108s4(ac, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(ac, (&l2), l4));
			if (t2) {
				T17x2293809T2(ac, R, (T2)('$'));
			} else {
				l5 = (T17f24(ac, a1, l2));
				t2 = (T1)((l5) == ((T2)('$')));
				if (t2) {
					T17x2293809T2(ac, R, (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T103s6(ac));
					l1 = (T108s3(ac, a1, (T6)(GE_int32(5))));
					t2 = (T1)((l5) == ((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l8;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							t2 = (T1)((l5) == ((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
								if (t2) {
									T17x2293809T2(ac, l1, l5);
								} else {
									t1 = (T103s6(ac));
									T108s23(ac, l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l6;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								T17x2293809T2(ac, l1, l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17x2228255(ac, l1));
					if (t2) {
						l3 = (T17x2228289(ac, l1));
						t2 = (T34f4(ac, ((T103*)(C))->a1, l3));
						if (t2) {
							t1 = (T103s6(ac));
							t5 = (T34f5(ac, ((T103*)(C))->a1, l3));
							R = (T108s5(ac, R, t5));
						} else {
							t2 = (T1)((l3) == ((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T103s6(ac));
								t5 = (T103s7(ac));
								t5 = (((T33*)(t5))->a1);
								R = (T108s5(ac, R, t5));
							} else {
								T17x2293809T2(ac, R, (T2)('$'));
								if (l7) {
									T17x2293809T2(ac, R, (T2)('{'));
								}
								t1 = (T103s6(ac));
								R = (T108s5(ac, R, l1));
								if (l8) {
									T17x2293809T2(ac, R, (T2)('}'));
								}
							}
						}
					} else {
						T17x2293809T2(ac, R, (T2)('$'));
						if (l7) {
							T17x2293809T2(ac, R, (T2)('{'));
						}
						t1 = (T103s6(ac));
						R = (T108s5(ac, R, l1));
						if (l8) {
							T17x2293809T2(ac, R, (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_VERSION_NUMBER.arguments */
T0* T103s7(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[30]) {
		if (ac->thread_onces->reference_exception[30]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[30]);
		}
		return ac->thread_onces->reference_value[30];
	} else {
		ac->thread_onces->reference_status[30] = '\1';
		ac->thread_onces->reference_value[30] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[30] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T33c6(ac);
	ac->thread_onces->reference_value[30] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* UT_VERSION_NUMBER.string_ */
T0* T103s6(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[1]) {
		if (ac->thread_onces->reference_exception[1]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[1]);
		}
		return ac->thread_onces->reference_value[1];
	} else {
		ac->thread_onces->reference_status[1] = '\1';
		ac->thread_onces->reference_value[1] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[1] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T108c22(ac);
	ac->thread_onces->reference_value[1] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.default_message */
T0* T83f3(TC* ac, T0* C)
{
	T0* R = 0;
	R = (T83f5(ac, C, ge723ov11878404));
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.message */
T0* T83f5(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T83s6(ac));
	R = (T108s3(ac, a1, l4));
	while (1) {
		t2 = (T6f4(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f24(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (T1)(!(T1)((l5) == ((T2)('$'))));
		if (t2) {
			t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
			if (t2) {
				T17x2293809T2(ac, R, l5);
			} else {
				t1 = (T83s6(ac));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T108s4(ac, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(ac, (&l2), l4));
			if (t2) {
				T17x2293809T2(ac, R, (T2)('$'));
			} else {
				l5 = (T17f24(ac, a1, l2));
				t2 = (T1)((l5) == ((T2)('$')));
				if (t2) {
					T17x2293809T2(ac, R, (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T83s6(ac));
					l1 = (T108s3(ac, a1, (T6)(GE_int32(5))));
					t2 = (T1)((l5) == ((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l8;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							t2 = (T1)((l5) == ((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
								if (t2) {
									T17x2293809T2(ac, l1, l5);
								} else {
									t1 = (T83s6(ac));
									T108s23(ac, l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l6;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								T17x2293809T2(ac, l1, l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17x2228255(ac, l1));
					if (t2) {
						l3 = (T17x2228289(ac, l1));
						t2 = (T34f4(ac, ((T83*)(C))->a1, l3));
						if (t2) {
							t1 = (T83s6(ac));
							t5 = (T34f5(ac, ((T83*)(C))->a1, l3));
							R = (T108s5(ac, R, t5));
						} else {
							t2 = (T1)((l3) == ((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T83s6(ac));
								t5 = (T83s7(ac));
								t5 = (((T33*)(t5))->a1);
								R = (T108s5(ac, R, t5));
							} else {
								T17x2293809T2(ac, R, (T2)('$'));
								if (l7) {
									T17x2293809T2(ac, R, (T2)('{'));
								}
								t1 = (T83s6(ac));
								R = (T108s5(ac, R, l1));
								if (l8) {
									T17x2293809T2(ac, R, (T2)('}'));
								}
							}
						}
					} else {
						T17x2293809T2(ac, R, (T2)('$'));
						if (l7) {
							T17x2293809T2(ac, R, (T2)('{'));
						}
						t1 = (T83s6(ac));
						R = (T108s5(ac, R, l1));
						if (l8) {
							T17x2293809T2(ac, R, (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.arguments */
T0* T83s7(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[30]) {
		if (ac->thread_onces->reference_exception[30]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[30]);
		}
		return ac->thread_onces->reference_value[30];
	} else {
		ac->thread_onces->reference_status[30] = '\1';
		ac->thread_onces->reference_value[30] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[30] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T33c6(ac);
	ac->thread_onces->reference_value[30] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.string_ */
T0* T83s6(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[1]) {
		if (ac->thread_onces->reference_exception[1]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[1]);
		}
		return ac->thread_onces->reference_value[1];
	} else {
		ac->thread_onces->reference_status[1] = '\1';
		ac->thread_onces->reference_value[1] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[1] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T108c22(ac);
	ac->thread_onces->reference_value[1] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.make */
T0* T83c8(TC* ac, T0* a1)
{
	T0* C;
	C = GE_new83(ac, EIF_TRUE);
	((T83*)(C))->a1 = T34c7(ac, ge725ov11878406, (T6)(GE_int32(1)), (T6)(GE_int32(1)));
	T34f8(ac, ((T83*)(C))->a1, a1, (T6)(GE_int32(1)));
	return C;
}

/* ARRAY [STRING_8].put */
void T34f8(TC* ac, T0* C, T0* a1, T6 a2)
{
	T6 t1;
	t1 = ((T6)((a2)-(((T34*)(C))->a2)));
	((T35*)(((T34*)(C))->a1))->z2[t1] = (a1);
}

/* ARRAY [STRING_8].make_filled */
T0* T34c7(TC* ac, T0* a1, T6 a2, T6 a3)
{
	T0* C;
	T6 l1 = 0;
	T1 t1;
	T6 t2;
	C = GE_new34(ac, EIF_TRUE);
	((T34*)(C))->a2 = a2;
	((T34*)(C))->a3 = a3;
	t1 = (T6f15(ac, &a2, a3));
	if (t1) {
		t2 = ((T6)((a3)-(a2)));
		l1 = ((T6)((t2)+((T6)(GE_int32(1)))));
	}
	T34f9(ac, C, a1, l1);
	return C;
}

/* ARRAY [STRING_8].make_filled_area */
void T34f9(TC* ac, T0* C, T0* a1, T6 a2)
{
	((T34*)(C))->a1 = T35c7(ac, a1, a2);
}

/* SPECIAL [STRING_8].make_filled */
T0* T35c7(TC* ac, T0* a1, T6 a2)
{
	T0* C;
	T6 t1;
	C = GE_new35(ac, a2, EIF_TRUE);
	T35f8(ac, C, a2);
	t1 = ((T6)((a2)-((T6)(GE_int32(1)))));
	T35f9(ac, C, a1, (T6)(GE_int32(0)), t1);
	return C;
}

/* SPECIAL [STRING_8].fill_with */
void T35f9(TC* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 t1;
	T1 t2;
	l1 = a2;
	t1 = ((T6)((a3)+((T6)(GE_int32(1)))));
	l3 = (T6f17(ac, &(((T35*)(C))->a2), t1));
	l2 = l3;
	while (1) {
		t2 = (T1)((l1) == (l2));
		if (t2) {
			break;
		}
		((T35*)(C))->z2[l1] = (a1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	l1 = l3;
	l2 = ((T6)((a3)+((T6)(GE_int32(1)))));
	while (1) {
		t2 = (T1)((l1) == (l2));
		if (t2) {
			break;
		}
		T35f10(ac, C, a1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
}

/* SPECIAL [STRING_8].extend */
void T35f10(TC* ac, T0* C, T0* a1)
{
	T6 t1;
	{
	t1 = ((T35*)(C))->a2;
	((T35*)(C))->a2 = t1 + 1 ;
	((T35*)(C))->z2[t1] = a1;
	}
}

/* SPECIAL [STRING_8].make_empty */
void T35f8(TC* ac, T0* C, T6 a1)
{
	{
	}
}

/* SPECIAL [STRING_8].make_empty */
T0* T35c8(TC* ac, T6 a1)
{
	T0* C;
	C = GE_new35(ac, a1, EIF_TRUE);
	{
	}
	return C;
}

/* GECC.process_lines */
void T118f14(TC* ac, T0* C, T0* a1, T6 a2, T0* a3)
{
	T0* l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T6 volatile t2;
	T6 t3;
	while (1) {
		if (l2) {
			break;
		}
		T159f11(ac, a3);
		t1 = (T1)(!(T1)((((T118*)(C))->a1) == ((T6)(GE_int32(0)))));
		if (t1) {
			l2 = EIF_TRUE;
			l1 = EIF_VOID;
		} else {
			t2 = (((T170*)(a1))->a1);
			t1 = (T6f15(ac, &t2, a2));
			if (t1) {
				l2 = EIF_TRUE;
				l1 = EIF_VOID;
			} else {
				l1 = (T170f8(ac, a1));
				T170f27(ac, a1);
			}
		}
		T159f12(ac, a3);
		t1 = (T1)(l1!=EIF_VOID);
		if (t1) {
			l3 = T117c10(ac, l1);
			T117f11(ac, l3);
			t3 = (((T117*)(l3))->a1);
			t1 = (T1)(!(T1)((t3) == ((T6)(GE_int32(0)))));
			if (t1) {
				T159f11(ac, a3);
				((T118*)(C))->a1 = (T6)(GE_int32(1));
				T159f12(ac, a3);
				l2 = EIF_TRUE;
			}
		}
	}
}

/* MUTEX.unlock */
void T159f12(TC* ac, T0* C)
{
	((T159*)(C))->a2 = (T159s7(ac));
	T159s15(ac, ((T159*)(C))->a1);
}

/* MUTEX.eif_thr_mutex_unlock */
void T159s15(TC* ac, T14 a1)
{
	{
	eif_thr_mutex_unlock((EIF_NATIVE_CHAR*)a1);
	}
}

/* MUTEX.default_pointer */
T14 T159s7(TC* ac)
{
	T14 R = 0;
	return R;
}

/* DS_ARRAYED_LIST [STRING_8].remove_first */
void T170f27(TC* ac, T0* C)
{
	T170f32(ac, C, (T6)(GE_int32(1)));
}

/* DS_ARRAYED_LIST [STRING_8].remove */
void T170f32(TC* ac, T0* C, T6 a1)
{
	T1 t1;
	T6 t2;
	t1 = (T1)((a1) == (((T170*)(C))->a1));
	if (t1) {
		T170f35(ac, C);
	} else {
		t2 = ((T6)((a1)+((T6)(GE_int32(1)))));
		T170f36(ac, C, t2);
		t2 = ((T6)((a1)+((T6)(GE_int32(1)))));
		T170f37(ac, C, t2, (T6)(GE_int32(1)));
		T35f11(ac, ((T170*)(C))->a2, ((T170*)(C))->a1);
	}
}

/* SPECIAL [STRING_8].keep_head */
void T35f11(TC* ac, T0* C, T6 a1)
{
	T35f12(ac, C, a1);
}

/* SPECIAL [STRING_8].set_count */
void T35f12(TC* ac, T0* C, T6 a1)
{
	T6 t1;
	{
	t1 = ((T35*)(C))->a2;
	if (t1 > a1) {
		((T35*)(C))->a2 = a1;
		memset((char*)(((T35*)(C))->z2+a1),0,(t1-a1)*sizeof(T0*));
	}
	}
}

/* DS_ARRAYED_LIST [STRING_8].move_left */
void T170f37(TC* ac, T0* C, T6 a1, T6 a2)
{
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	l1 = ((T6)((a1)-((T6)(GE_int32(1)))));
	l2 = ((T6)((((T170*)(C))->a1)-((T6)(GE_int32(1)))));
	while (1) {
		t1 = (T6f4(ac, (&l1), l2));
		if (t1) {
			break;
		}
		t2 = (((T35*)(((T170*)(C))->a2))->z2[l1]);
		t3 = ((T6)((l1)-(a2)));
		((T35*)(((T170*)(C))->a2))->z2[t3] = (t2);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	((T170*)(C))->a1 = ((T6)((((T170*)(C))->a1)-(a2)));
}

/* DS_ARRAYED_LIST [STRING_8].move_cursors_left */
void T170f36(TC* ac, T0* C, T6 a1)
{
	T6 volatile l1 = 0;
	T0* l2 = 0;
	T1 t1;
	T6 t2;
	l2 = ((T170*)(C))->a3;
	while (1) {
		t1 = (T1)(l2==EIF_VOID);
		if (t1) {
			break;
		}
		l1 = (((T1079*)(l2))->a1);
		t2 = ((T6)((a1)-((T6)(GE_int32(1)))));
		t1 = (T6f14(ac, (&l1), t2));
		if (t1) {
			t2 = ((T6)((l1)-((T6)(GE_int32(1)))));
			T1079f10(ac, l2, t2);
		}
		l2 = (((T1079*)(l2))->a2);
	}
}

/* DS_ARRAYED_LIST_CURSOR [STRING_8].set_position */
void T1079f10(TC* ac, T0* C, T6 a1)
{
	((T1079*)(C))->a1 = a1;
}

/* DS_ARRAYED_LIST [STRING_8].remove_last */
void T170f35(TC* ac, T0* C)
{
	T170f38(ac, C);
	((T170*)(C))->a1 = ((T6)((((T170*)(C))->a1)-((T6)(GE_int32(1)))));
	T35f11(ac, ((T170*)(C))->a2, ((T170*)(C))->a1);
}

/* DS_ARRAYED_LIST [STRING_8].move_last_cursors_after */
void T170f38(TC* ac, T0* C)
{
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 t1;
	T1 t2;
	l1 = ((T6)((((T170*)(C))->a1)-((T6)(GE_int32(1)))));
	l2 = ((T170*)(C))->a3;
	t1 = (((T1079*)(l2))->a1);
	t2 = (T1)((t1) == (l1));
	if (t2) {
		T1079f9(ac, l2);
	}
	l4 = l2;
	l2 = (((T1079*)(l2))->a2);
	while (1) {
		t2 = (T1)(l2==EIF_VOID);
		if (t2) {
			break;
		}
		t1 = (((T1079*)(l2))->a1);
		t2 = (T1)((t1) == (l1));
		if (t2) {
			T1079f9(ac, l2);
			l3 = (((T1079*)(l2))->a2);
			T1079f11(ac, l4, l3);
			T1079f11(ac, l2, EIF_VOID);
			l2 = l3;
		} else {
			l4 = l2;
			l2 = (((T1079*)(l2))->a2);
		}
	}
}

/* DS_ARRAYED_LIST_CURSOR [STRING_8].set_next_cursor */
void T1079f11(TC* ac, T0* C, T0* a1)
{
	((T1079*)(C))->a2 = a1;
}

/* DS_ARRAYED_LIST_CURSOR [STRING_8].set_after */
void T1079f9(TC* ac, T0* C)
{
	((T1079*)(C))->a1 = (T6)(GE_int32(-2));
}

/* DS_ARRAYED_LIST [STRING_8].first */
T0* T170f8(TC* ac, T0* C)
{
	T0* R = 0;
	R = (((T35*)(((T170*)(C))->a2))->z2[(T6)(GE_int32(0))]);
	return R;
}

/* MUTEX.lock */
void T159f11(TC* ac, T0* C)
{
	T159s14(ac, ((T159*)(C))->a1);
	((T159*)(C))->a2 = (T159s5(ac));
}

/* MUTEX.current_thread_id */
T14 T159s5(TC* ac)
{
	{
return eif_thr_thread_id();
	}
}

/* MUTEX.eif_thr_mutex_lock */
void T159s14(TC* ac, T14 a1)
{
	{
	eif_thr_mutex_lock((EIF_NATIVE_CHAR*)a1);
	}
}

/* GECC.process */
void T118f15(TC* ac, T0* C, T0* a1, T6 a2)
{
	T6 volatile l1 = 0;
	T0* l2 = 0;
	T6 l3 = 0;
	T1 t1;
	l1 = (T6)(GE_int32(1));
	l3 = ((T6)((a2)-((T6)(GE_int32(1)))));
	while (1) {
		t1 = (T6f4(ac, (&l1), l3));
		if (t1) {
			break;
		}
		l2 = T1024c9(ac, a1);
		T1024f10(ac, l2);
		T105s12(ac, (T7)(GE_int64(1000)));
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	((void (*)(TC*, T0*, T0*))(((T996*)(a1))->a1))(ac, ((T996*)(a1))->a2, 0);
	T1025s1(ac);
}

/* THREAD_CONTROL.join_all */
void T1025s1(TC* ac)
{
	{
	eif_thr_join_all();
	}
}

/* EXECUTION_ENVIRONMENT.sleep */
void T105s12(TC* ac, T7 a1)
{
	T105s13(ac, a1);
}

/* EXECUTION_ENVIRONMENT.eif_sleep */
void T105s13(TC* ac, T7 a1)
{
	{
	eif_sleep(a1);
	}
}

/* WORKER_THREAD.launch */
void T1024f10(TC* ac, T0* C)
{
	T0* t1;
	t1 = (T1459c7(ac));
	T1024f12(ac, C, t1);
}

/* WORKER_THREAD.launch_with_attributes */
void T1024f12(TC* ac, T0* C, T0* a1)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* t1;
	T1 t2;
	T14 t3;
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		t1 = (T1024f7(ac, C));
		T1460f2(ac, t1, EIF_FALSE);
		T159f12(ac, ((T1024*)(C))->a2);
		ac->last_rescue = r.previous;
		GE_raise(GE_EX_FAIL);
	}
GE_retry:
	T159f11(ac, ((T1024*)(C))->a2);
	t2 = (T1024f5(ac, C));
	t2 = ((T1)(!(t2)));
	if (t2) {
		t1 = (T1024f7(ac, C));
		T1460f2(ac, t1, EIF_FALSE);
	} else {
		t3 = (T1459f4(ac, a1));
		T1024s15(ac, C, ((T14)(&T1024a13)), ((T14)(&T1024a14)), t3);
		((T1024*)(C))->a3 = (T1024s6(ac));
		t1 = (T1024f7(ac, C));
		T1460f2(ac, t1, EIF_TRUE);
	}
	T159f12(ac, ((T1024*)(C))->a2);
	ac->last_rescue = r.previous;
}

/* WORKER_THREAD.last_created_thread */
T14 T1024s6(TC* ac)
{
	T14 R = 0;
	{
	R = (T14)(eif_thr_last_thread());
	}
	return R;
}

/* WORKER_THREAD.thr_set_terminated */
void T1024f14(TC* ac, T0* C, T1 a1)
{
	T159f11(ac, ((T1024*)(C))->a2);
	((T1024*)(C))->a4 = a1;
	T159f12(ac, ((T1024*)(C))->a2);
}

/* WORKER_THREAD.thr_set_terminated */
void T1024a14(T0* C, T1 a1)
{
	T1024f14(GE_current_context(), C, a1);
}

/* WORKER_THREAD.thr_main */
void T1024f13(TC* ac, T0* C, T6 a1)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		T159f11(ac, ((T1024*)(C))->a2);
		((T1024*)(C))->a4 = EIF_TRUE;
		((T1024*)(C))->a3 = (T1024s8(ac));
		T159f12(ac, ((T1024*)(C))->a2);
		ac->last_rescue = r.previous;
		GE_raise(GE_EX_FAIL);
	}
GE_retry:
	T159f11(ac, ((T1024*)(C))->a2);
	T159f12(ac, ((T1024*)(C))->a2);
	T1024f16(ac, C);
	T159f11(ac, ((T1024*)(C))->a2);
	((T1024*)(C))->a4 = EIF_TRUE;
	((T1024*)(C))->a3 = (T1024s8(ac));
	T159f12(ac, ((T1024*)(C))->a2);
	ac->last_rescue = r.previous;
}

/* WORKER_THREAD.thr_main */
void T1024a13(T0* C, T6 a1)
{
	T1024f13(GE_current_context(), C, a1);
}

/* WORKER_THREAD.execute_procedure */
void T1024f16(TC* ac, T0* C)
{
	((void (*)(TC*, T0*, T0*))(((T996*)(((T1024*)(C))->a1))->a1))(ac, ((T996*)(((T1024*)(C))->a1))->a2, 0);
}

/* WORKER_THREAD.default_pointer */
T14 T1024s8(TC* ac)
{
	T14 R = 0;
	return R;
}

/* WORKER_THREAD.create_thread_with_attr */
void T1024s15(TC* ac, T0* a1, T14 a2, T14 a3, T14 a4)
{
	{
	eif_thr_create_with_attr((EIF_OBJECT)a1,( EIF_PROCEDURE)(void*)a2,( EIF_PROCEDURE)(void*)a3,( EIF_POINTER)(void*)a4);
	}
}

/* THREAD_ATTRIBUTES.item */
T14 T1459f4(TC* ac, T0* C)
{
	T14 R = 0;
	T0* l1 = 0;
	T1 t1;
	if (((T1459*)(C))->a1) {
		R = ((T1459*)(C))->a2;
	} else {
		l1 = ((T1459*)(C))->a3;
		t1 = (T1)(l1!=EIF_VOID);
		if (t1) {
			R = (((T162*)(l1))->a1);
		}
	}
	return R;
}

/* WORKER_THREAD.is_launchable */
T1 T1024f5(TC* ac, T0* C)
{
	T1 R = 0;
	T1 t1;
	T14 t2;
	t1 = (T159f6(ac, ((T1024*)(C))->a2));
	if (t1) {
		t2 = (T1024s8(ac));
		t1 = (T1)((((T1024*)(C))->a3) == (t2));
	}
	if (t1) {
		R = ((T1)(!(((T1024*)(C))->a4)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* MUTEX.is_set */
T1 T159f6(TC* ac, T0* C)
{
	T1 R = 0;
	T14 t1;
	T1 t2;
	t1 = (T159s7(ac));
	t2 = (T1)(!(T1)((((T159*)(C))->a1) == (t1)));
	if (!(t2)) {
		t2 = (EIF_TRUE);
		R = ((T1)(!(t2)));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* CELL [BOOLEAN].put */
void T1460f2(TC* ac, T0* C, T1 a1)
{
	((T1460*)(C))->a1 = a1;
}

/* CELL [BOOLEAN].put */
T0* T1460c2(TC* ac, T1 a1)
{
	T0* C;
	C = GE_new1460(ac, EIF_TRUE);
	((T1460*)(C))->a1 = a1;
	return C;
}

/* WORKER_THREAD.is_last_launch_successful_cell */
T0* T1024f7(TC* ac, T0* C)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[35]) {
		if (ac->thread_onces->reference_exception[35]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[35]);
		}
		return ac->thread_onces->reference_value[35];
	} else {
		ac->thread_onces->reference_status[35] = '\1';
		ac->thread_onces->reference_value[35] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[35] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T1460c2(ac, EIF_FALSE);
	ac->thread_onces->reference_value[35] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* THREAD_ATTRIBUTES.make */
T0* T1459c7(TC* ac)
{
	T0* C;
	T6 t1;
	C = GE_new1459(ac, EIF_TRUE);
	T1459f8(ac, C);
	t1 = (T1459s5(ac));
	T1459f9(ac, C, t1);
	return C;
}

/* THREAD_ATTRIBUTES.set_priority */
void T1459f9(TC* ac, T0* C, T6 a1)
{
	T14 t1;
	t1 = (T1459f4(ac, C));
	T1459s10(ac, t1, a1);
}

/* THREAD_ATTRIBUTES.c_set_priority */
void T1459s10(TC* ac, T14 a1, T6 a2)
{
	{
#ifdef EIF_THREADS
	((EIF_THR_ATTR_TYPE *) (void*)a1)->priority = a2;
#endif
	}
}

/* THREAD_ATTRIBUTES.default_priority */
T6 T1459s5(TC* ac)
{
	T6 R = 0;
	{
	R = (T6)(eif_thr_default_priority());
	}
	return R;
}

/* THREAD_ATTRIBUTES.mem_make */
void T1459f8(TC* ac, T0* C)
{
	T14 l1 = 0;
	T6 t1;
	((T1459*)(C))->a2 = l1;
	t1 = (T1459s6(ac));
	((T1459*)(C))->a3 = T162c10(ac, t1);
	((T1459*)(C))->a1 = EIF_FALSE;
}

/* THREAD_ATTRIBUTES.structure_size */
T6 T1459s6(TC* ac)
{
	{
#ifdef EIF_THREADS
	return sizeof(EIF_THR_ATTR_TYPE);
#else
	return 1L;
#endif
	}
}

/* WORKER_THREAD.make */
T0* T1024c9(TC* ac, T0* a1)
{
	T0* C;
	C = GE_new1024(ac, EIF_TRUE);
	T1024f11(ac, C);
	((T1024*)(C))->a1 = a1;
	return C;
}

/* WORKER_THREAD.thread_make */
void T1024f11(TC* ac, T0* C)
{
	((T1024*)(C))->a2 = T159c10(ac);
}

/* GECC.thread_count */
T6 T118f8(TC* ac, T0* C)
{
	T6 volatile R = 0;
	T10 t1;
	T6 t2;
	T1 t3;
	T1 t4;
	t1 = (T105s5(ac));
	t2 = ((T6)(t1));
	R = ((T6)((t2)-((T6)(GE_int32(3)))));
	t3 = (T59f13(ac, ((T118*)(C))->a5));
	if (t3) {
		R = (T59f14(ac, ((T118*)(C))->a5));
		t3 = (T6f15(ac, (&R), (T6)(GE_int32(0))));
		if (t3) {
			t1 = (T105s5(ac));
			t2 = ((T6)(t1));
			R = ((T6)((t2)+(R)));
		}
	}
	t3 = ((T1)((R)<((T6)(GE_int32(1)))));
	if (!(t3)) {
		t4 = (EIF_TRUE);
		t3 = ((T1)(!(t4)));
	}
	if (t3) {
		R = (T6)(GE_int32(1));
	}
	return R;
}

/* AP_INTEGER_OPTION.parameter */
T6 T59f14(TC* ac, T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T59*)(C))->a1;
	t1 = (T229f6(ac, l1));
	t1 = ((T1)(!(t1)));
	if (t1) {
		R = (T229f7(ac, l1));
	} else {
		R = ((T59*)(C))->a2;
	}
	return R;
}

/* DS_LINKED_LIST [INTEGER_32].last */
T6 T229f7(TC* ac, T0* C)
{
	T6 R = 0;
	T0* m1 = 0;
	T1 t1;
	t1 = (((T229*)(C))->a2?((m1 = ((T229*)(C))->a2, EIF_TRUE)):EIF_FALSE);
	if (!(t1)) {
		GE_raise_with_message(GE_EX_CHECK, "not_empty");
	}
	R = (((T1117*)(m1))->a1);
	return R;
}

/* DS_LINKED_LIST [INTEGER_32].is_empty */
T1 T229f6(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T1)((((T229*)(C))->a1) == ((T6)(GE_int32(0))));
	return R;
}

/* AP_INTEGER_OPTION.was_found */
T1 T59f13(TC* ac, T0* C)
{
	T1 R = 0;
	T6 volatile t1;
	t1 = (T59f16(ac, C));
	R = (T6f4(ac, &t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_INTEGER_OPTION.occurrences */
T6 T59f16(TC* ac, T0* C)
{
	T6 R = 0;
	R = (((T229*)(((T59*)(C))->a1))->a1);
	return R;
}

/* EXECUTION_ENVIRONMENT.available_cpu_count */
T10 T105s5(TC* ac)
{
	{
#ifdef EIF_WINDOWS
	SYSTEM_INFO SysInfo;
	ZeroMemory (&SysInfo, sizeof (SYSTEM_INFO));
	GetSystemInfo (&SysInfo);
	return (EIF_NATURAL_32) SysInfo.dwNumberOfProcessors;
#elif defined(EIF_MACOSX)
		/* MacOS X < 10.4 */
	int nm [2];
	size_t len = 4;
	uint32_t count;
	nm [0] = CTL_HW; nm [1] = HW_AVAILCPU;
	sysctl (nm, 2, &count, &len, NULL, 0);
	if(count < 1) {
		nm[1] = HW_NCPU;
		sysctl(nm, 2, &count, &len, NULL, 0);
		if (count < 1) {count = 1;}
	}
	return (EIF_NATURAL_32) count;
#else
		/* Linux, Solaris, AIX, Mac OS X >=10.4 (i.e. Tiger onwards), ... */
	return (EIF_NATURAL_32) sysconf(_SC_NPROCESSORS_ONLN);
#endif
	}
}

/* MUTEX.make */
T0* T159c10(TC* ac)
{
	T0* C;
	C = GE_new159(ac, EIF_TRUE);
	((T159*)(C))->a1 = (T159s8(ac));
	return C;
}

/* MUTEX.eif_thr_mutex_create */
T14 T159s8(TC* ac)
{
	T14 R = 0;
	{
	R = (T14)(eif_thr_mutex_create());
	}
	return R;
}

/* DS_ARRAYED_LIST [STRING_8].is_empty */
T1 T170f7(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T1)((((T170*)(C))->a1) == ((T6)(GE_int32(0))));
	return R;
}

/* DS_ARRAYED_LIST [STRING_8].force_last */
void T170f25(TC* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	t1 = (T170f16(ac, C, (T6)(GE_int32(1))));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = ((T6)((((T170*)(C))->a1)+((T6)(GE_int32(1)))));
		t2 = (T170f17(ac, C, t2));
		T170f31(ac, C, t2);
	}
	T860s4(ac, ((T170*)(C))->a2, a1, ((T170*)(C))->a1);
	((T170*)(C))->a1 = ((T6)((((T170*)(C))->a1)+((T6)(GE_int32(1)))));
}

/* KL_SPECIAL_ROUTINES [STRING_8].force */
void T860s4(TC* ac, T0* a1, T0* a2, T6 a3)
{
	T6 t1;
	T1 t2;
	t1 = (((T35*)(a1))->a2);
	t2 = ((T1)((a3)<(t1)));
	if (t2) {
		((T35*)(a1))->z2[a3] = (a2);
	} else {
		t1 = (((T35*)(a1))->a2);
		T35f9(ac, a1, a2, t1, a3);
	}
}

/* DS_ARRAYED_LIST [STRING_8].resize */
void T170f31(TC* ac, T0* C, T6 a1)
{
	((T170*)(C))->a2 = (T860s2(ac, ((T170*)(C))->a2, a1));
	((T170*)(C))->a5 = a1;
}

/* KL_SPECIAL_ROUTINES [STRING_8].aliased_resized_area */
T0* T860s2(TC* ac, T0* a1, T6 a2)
{
	T0* R = 0;
	T6 t1;
	T1 t2;
	t1 = (((T35*)(a1))->a1);
	t2 = (T6f4(ac, &a2, t1));
	if (t2) {
		R = (T35f4(ac, a1, a2));
	} else {
		R = a1;
	}
	return R;
}

/* SPECIAL [STRING_8].aliased_resized_area */
T0* T35f4(TC* ac, T0* C, T6 a1)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	{
	t1 = ((T35*)(C))->a1;
	if (a1 == t1) {
		R = C;
	} else {
		R = GE_new35(ac, a1, EIF_TRUE);
		t1 = ((T35*)(C))->a2;
		((T35*)(R))->a2 = ((t1 < a1)?t1:a1);
		t2 = ((T35*)(C))->a2;
		t1 = ((T35*)(R))->a2;
		if (t2 > t1) {
			t2 = t1;
		}
		if (t2 > 0) {
			memcpy((void*)(((T35*)(R))->z2), (void*)(((T35*)(C))->z2), t2 * sizeof(T0*));
		}
	}
	}
	return R;
}

/* DS_ARRAYED_LIST [STRING_8].new_capacity */
T6 T170f17(TC* ac, T0* C, T6 a1)
{
	T6 R = 0;
	T6 t1;
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	t1 = ((T6)((t1)*((T6)(GE_int32(3)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* DS_ARRAYED_LIST [STRING_8].extendible */
T1 T170f16(TC* ac, T0* C, T6 a1)
{
	T1 R = 0;
	T6 t1;
	t1 = ((T6)((((T170*)(C))->a1)+(a1)));
	R = (T6f14(ac, &(((T170*)(C))->a5), t1));
	return R;
}

/* UC_UTF8_STRING.ends_with */
T1 T1078f28(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T1 t1;
	T6 t2;
	T2 t3;
	T2 t4;
	t1 = EIF_FALSE;
	if (t1) {
		R = EIF_TRUE;
	} else {
		l1 = (((T17*)(a1))->a2);
		l2 = ((T1078*)(C))->a1;
		t1 = (T6f15(ac, (&l1), l2));
		if (t1) {
			l4 = ((T1078*)(C))->a2;
			l5 = (((T17*)(a1))->a1);
			t2 = (T1078f53(ac, C));
			l2 = ((T6)((t2)+((T6)(GE_int32(1)))));
			t2 = (T17f30(ac, a1));
			l1 = ((T6)((t2)+((T6)(GE_int32(1)))));
			l3 = (T17f9(ac, a1));
			R = EIF_TRUE;
			while (1) {
				t1 = (T1)((l1) == (l3));
				if (t1) {
					break;
				}
				l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
				l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t3 = (((T15*)(l4))->z2[l2]);
				t4 = (((T15*)(l5))->z2[l1]);
				t1 = (T1)(!(T1)((t3) == (t4)));
				if (t1) {
					R = EIF_FALSE;
					l1 = l3;
				}
			}
		}
	}
	return R;
}

/* STRING_8.area_upper */
T6 T17f30(TC* ac, T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = (T17f9(ac, C));
	t1 = ((T6)((t1)+(((T17*)(C))->a2)));
	R = ((T6)((t1)-((T6)(GE_int32(1)))));
	return R;
}

/* UC_UTF8_STRING.area_upper */
T6 T1078f53(TC* ac, T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = (T1078f49(ac, C));
	t1 = ((T6)((t1)+(((T1078*)(C))->a1)));
	R = ((T6)((t1)-((T6)(GE_int32(1)))));
	return R;
}

/* UC_STRING.ends_with */
T1 T919f22(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T1 t1;
	T6 t2;
	T2 t3;
	T2 t4;
	t1 = EIF_FALSE;
	if (t1) {
		R = EIF_TRUE;
	} else {
		l1 = (((T17*)(a1))->a2);
		l2 = ((T919*)(C))->a1;
		t1 = (T6f15(ac, (&l1), l2));
		if (t1) {
			l4 = ((T919*)(C))->a2;
			l5 = (((T17*)(a1))->a1);
			t2 = (T919f45(ac, C));
			l2 = ((T6)((t2)+((T6)(GE_int32(1)))));
			t2 = (T17f30(ac, a1));
			l1 = ((T6)((t2)+((T6)(GE_int32(1)))));
			l3 = (T17f9(ac, a1));
			R = EIF_TRUE;
			while (1) {
				t1 = (T1)((l1) == (l3));
				if (t1) {
					break;
				}
				l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
				l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t3 = (((T15*)(l4))->z2[l2]);
				t4 = (((T15*)(l5))->z2[l1]);
				t1 = (T1)(!(T1)((t3) == (t4)));
				if (t1) {
					R = EIF_FALSE;
					l1 = l3;
				}
			}
		}
	}
	return R;
}

/* UC_STRING.area_upper */
T6 T919f45(TC* ac, T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = (T919f11(ac, C));
	t1 = ((T6)((t1)+(((T919*)(C))->a1)));
	R = ((T6)((t1)-((T6)(GE_int32(1)))));
	return R;
}

/* STRING_8.ends_with */
T1 T17f25(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T1 t1;
	T6 t2;
	T2 t3;
	T2 t4;
	t1 = (T1)(C==a1);
	if (t1) {
		R = EIF_TRUE;
	} else {
		l1 = (((T17*)(a1))->a2);
		l2 = ((T17*)(C))->a2;
		t1 = (T6f15(ac, (&l1), l2));
		if (t1) {
			l4 = ((T17*)(C))->a1;
			l5 = (((T17*)(a1))->a1);
			t2 = (T17f30(ac, C));
			l2 = ((T6)((t2)+((T6)(GE_int32(1)))));
			t2 = (T17f30(ac, a1));
			l1 = ((T6)((t2)+((T6)(GE_int32(1)))));
			l3 = (T17f9(ac, a1));
			R = EIF_TRUE;
			while (1) {
				t1 = (T1)((l1) == (l3));
				if (t1) {
					break;
				}
				l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
				l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t3 = (((T15*)(l4))->z2[l2]);
				t4 = (((T15*)(l5))->z2[l1]);
				t1 = (T1)(!(T1)((t3) == (t4)));
				if (t1) {
					R = EIF_FALSE;
					l1 = l3;
				}
			}
		}
	}
	return R;
}

/* STRING_8.starts_with */
T1 T17f21(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T1 t1;
	T6 t2;
	T2 t3;
	T2 t4;
	t1 = (T1)(C==a1);
	if (t1) {
		R = EIF_TRUE;
	} else {
		l1 = (((T17*)(a1))->a2);
		t1 = (T6f15(ac, (&l1), ((T17*)(C))->a2));
		if (t1) {
			l4 = ((T17*)(C))->a1;
			l5 = (((T17*)(a1))->a1);
			t2 = (T17f9(ac, C));
			l2 = ((T6)((t2)+(l1)));
			t2 = (T17f30(ac, a1));
			l1 = ((T6)((t2)+((T6)(GE_int32(1)))));
			l3 = (T17f9(ac, a1));
			R = EIF_TRUE;
			while (1) {
				t1 = (T1)((l1) == (l3));
				if (t1) {
					break;
				}
				l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
				l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t3 = (((T15*)(l4))->z2[l2]);
				t4 = (((T15*)(l5))->z2[l1]);
				t1 = (T1)(!(T1)((t3) == (t4)));
				if (t1) {
					R = EIF_FALSE;
					l1 = l3;
				}
			}
		}
	}
	return R;
}

/* STRING_8.adjust */
void T17f68(TC* ac, T0* C)
{
	T17f73(ac, C);
	T17f74(ac, C);
}

/* STRING_8.right_adjust */
void T17f74(TC* ac, T0* C)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 volatile l3 = 0;
	T0* l4 = 0;
	T1 t1;
	T2 volatile t2;
	T1 t3;
	T6 t4;
	l2 = ((T6)((((T17*)(C))->a2)-((T6)(GE_int32(1)))));
	l1 = l2;
	l4 = ((T17*)(C))->a1;
	while (1) {
		t1 = ((T1)((l1)<((T6)(GE_int32(0)))));
		if (!(t1)) {
			t2 = (((T15*)(l4))->z2[l1]);
			t3 = (T2f9(ac, &t2));
			t1 = ((T1)(!(t3)));
		}
		if (t1) {
			break;
		}
		l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
	}
	t1 = (T6f4(ac, (&l3), (T6)(GE_int32(0))));
	if (t1) {
		t4 = ((T6)((l2)+((T6)(GE_int32(1)))));
		((T17*)(C))->a2 = ((T6)((t4)-(l3)));
		T17f55(ac, C);
	}
}

/* CHARACTER_8.is_space */
T1 T2f9(TC* ac, T2 volatile* C)
{
	T1 R = 0;
	T6 t1;
	T8 volatile t2;
	t1 = ((T6)(*C));
	t2 = (T2f13(ac, C, t1));
	t2 = ((T8)((t2)&((T8)(GE_nat8(8)))));
	R = (T8f5(ac, &t2, (T8)(GE_nat8(0))));
	return R;
}

/* STRING_8.left_adjust */
void T17f73(TC* ac, T0* C)
{
	T6 l1 = 0;
	T6 volatile l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T2 volatile t2;
	T1 t3;
	T6 t4;
	l1 = ((T6)((((T17*)(C))->a2)-((T6)(GE_int32(1)))));
	l3 = ((T17*)(C))->a1;
	while (1) {
		t1 = (T6f4(ac, (&l2), l1));
		if (!(t1)) {
			t2 = (((T15*)(l3))->z2[l2]);
			t3 = (T2f9(ac, &t2));
			t1 = ((T1)(!(t3)));
		}
		if (t1) {
			break;
		}
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
	}
	t1 = (T6f4(ac, (&l2), (T6)(GE_int32(0))));
	if (t1) {
		t4 = ((T6)((l1)+((T6)(GE_int32(1)))));
		l1 = ((T6)((t4)-(l2)));
		T15f21(ac, l3, l2, (T6)(GE_int32(0)), l1);
		((T17*)(C))->a2 = l1;
		T17f55(ac, C);
	}
}

/* KL_TEXT_INPUT_FILE.read_line */
void T43f64(TC* ac, T0* C)
{
	T1 l1 = 0;
	T0* l2 = 0;
	T2 l3 = 0;
	T1 l4 = 0;
	T1 l5 = 0;
	T0* t1;
	t1 = (T43s22(ac));
	T108s24(ac, ((T43*)(C))->a3);
	l4 = EIF_TRUE;
	l2 = ((T43*)(C))->a3;
	while (1) {
		if (l1) {
			break;
		}
		T43f68(ac, C);
		if (((T43*)(C))->a2) {
			l1 = EIF_TRUE;
		} else {
			l4 = EIF_FALSE;
			l3 = ((T43*)(C))->a8;
			switch (l3) {
			case (T2)'\n':
				l1 = EIF_TRUE;
				break;
			case (T2)'\r':
				l5 = EIF_TRUE;
				break;
			default:
				if (l5) {
					T43f69(ac, C, l3);
					l1 = EIF_TRUE;
				} else {
					T17f52(ac, l2, l3);
				}
				break;
			}
		}
	}
	((T43*)(C))->a2 = l4;
}

/* KL_TEXT_INPUT_FILE.unread_character */
void T43f69(TC* ac, T0* C, T2 a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	l1 = T164c3(ac, a1);
	l2 = ((T43*)(C))->a7;
	t1 = (T1)(l2!=EIF_VOID);
	if (t1) {
		T164f4(ac, l1, l2);
	}
	((T43*)(C))->a7 = l1;
	((T43*)(C))->a8 = a1;
	((T43*)(C))->a2 = EIF_FALSE;
}

/* KL_LINKABLE [CHARACTER_8].put_right */
void T164f4(TC* ac, T0* C, T0* a1)
{
	((T164*)(C))->a2 = a1;
}

/* KL_LINKABLE [CHARACTER_8].make */
T0* T164c3(TC* ac, T2 a1)
{
	T0* C;
	C = GE_new164(ac, EIF_TRUE);
	((T164*)(C))->a1 = a1;
	return C;
}

/* KL_TEXT_INPUT_FILE.read_character */
void T43f68(TC* ac, T0* C)
{
	T0* l1 = 0;
	T1 t1;
	l1 = ((T43*)(C))->a7;
	t1 = (T1)(l1!=EIF_VOID);
	if (t1) {
		((T43*)(C))->a8 = (((T164*)(l1))->a1);
		((T43*)(C))->a7 = (((T164*)(l1))->a2);
	} else {
		t1 = (T43f32(ac, C));
		if (t1) {
			((T43*)(C))->a2 = EIF_TRUE;
		} else {
			T43f72(ac, C);
			((T43*)(C))->a2 = (T43f32(ac, C));
		}
	}
}

/* KL_TEXT_INPUT_FILE.old_read_character */
void T43f72(TC* ac, T0* C)
{
	((T43*)(C))->a8 = (T43s34(ac, ((T43*)(C))->a9));
}

/* KL_TEXT_INPUT_FILE.file_gc */
T2 T43s34(TC* ac, T14 a1)
{
	T2 R = 0;
	{
	R = (T2)(eif_file_gc((FILE *)(void*)a1));
	}
	return R;
}

/* KL_TEXT_INPUT_FILE.old_end_of_file */
T1 T43f32(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T43s36(ac, ((T43*)(C))->a9));
	return R;
}

/* KL_TEXT_INPUT_FILE.file_feof */
T1 T43s36(TC* ac, T14 a1)
{
	T1 R = 0;
	{
	R = EIF_TEST(eif_file_feof((FILE *)(void*)a1));
	}
	return R;
}

/* KL_STRING_ROUTINES.wipe_out */
void T108s24(TC* ac, T0* a1)
{
	T17f72(ac, a1, (T6)(GE_int32(0)));
}

/* DS_ARRAYED_LIST [STRING_8].make */
void T170f21(TC* ac, T0* C, T6 a1)
{
	T0* t1;
	((T170*)(C))->a4 = T860c3(ac);
	((T170*)(C))->a2 = (T860s1(ac, a1));
	((T170*)(C))->a5 = a1;
	t1 = (T170f15(ac, C));
	T170f28(ac, C, t1);
}

/* DS_ARRAYED_LIST [STRING_8].make */
T0* T170c21(TC* ac, T6 a1)
{
	T0* C;
	T0* t1;
	C = GE_new170(ac, EIF_TRUE);
	((T170*)(C))->a4 = T860c3(ac);
	((T170*)(C))->a2 = (T860s1(ac, a1));
	((T170*)(C))->a5 = a1;
	t1 = (T170f15(ac, C));
	T170f28(ac, C, t1);
	return C;
}

/* DS_ARRAYED_LIST [STRING_8].set_internal_cursor */
void T170f28(TC* ac, T0* C, T0* a1)
{
	((T170*)(C))->a3 = a1;
}

/* DS_ARRAYED_LIST [STRING_8].new_cursor */
T0* T170f15(TC* ac, T0* C)
{
	T0* R = 0;
	R = T1079c8(ac, C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [STRING_8].make */
T0* T1079c8(TC* ac, T0* a1)
{
	T0* C;
	C = GE_new1079(ac, EIF_TRUE);
	((T1079*)(C))->a3 = a1;
	((T1079*)(C))->a1 = (T6)(GE_int32(-1));
	return C;
}

/* KL_SPECIAL_ROUTINES [STRING_8].make */
T0* T860s1(TC* ac, T6 a1)
{
	T0* R = 0;
	R = T35c8(ac, a1);
	return R;
}

/* KL_SPECIAL_ROUTINES [STRING_8].default_create */
T0* T860c3(TC* ac)
{
	T0* C;
	C = GE_new860(ac, EIF_TRUE);
	return C;
}

/* GECC.parse_arguments */
void T118f13(TC* ac, T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	l1 = T52c41(ac);
	T52f42(ac, l1, GE_ms8("Gobo Eiffel C Compilation, compile C code generated by gec.", 59));
	T52f43(ac, l1, GE_ms8("script_filename", 15));
	((T118*)(C))->a5 = T59c23(ac, GE_ms8("thread", 6));
	T59f24(ac, ((T118*)(C))->a5, GE_ms8("Number of threads to be used. Negative numbers -N mean \"number of CPUs - N\". (default: -3)", 90));
	T59f25(ac, ((T118*)(C))->a5, GE_ms8("thread_count", 12));
	t1 = (EIF_TRUE);
	if (t1) {
		t2 = (((T52*)(l1))->a1);
		T214f18(ac, t2, ((T118*)(C))->a5);
	}
	((T118*)(C))->a3 = T46c19(ac, (T2)('V'), GE_ms8("version", 7));
	T46f18(ac, ((T118*)(C))->a3, GE_ms8("Print the version number of gecc and exit.", 42));
	l2 = T53c13(ac, ((T118*)(C))->a3);
	t2 = (((T52*)(l1))->a2);
	T215f15(ac, t2, l2);
	T52f44(ac, l1, a1);
	t1 = (T46f9(ac, ((T118*)(C))->a3));
	if (t1) {
		T118f17(ac, C);
		((T118*)(C))->a4 = GE_ms8("", 0);
		((T118*)(C))->a1 = (T6)(GE_int32(0));
	} else {
		t2 = (((T52*)(l1))->a3);
		t3 = (((T170*)(t2))->a1);
		t1 = (T1)(!(T1)((t3) == ((T6)(GE_int32(1)))));
		if (t1) {
			t2 = (((T52*)(l1))->a5);
			t2 = (T213f12(ac, t2, l1));
			T160f8(ac, ((T118*)(C))->a2, t2);
			((T118*)(C))->a4 = GE_ms8("", 0);
			((T118*)(C))->a1 = (T6)(GE_int32(1));
		} else {
			t2 = (((T52*)(l1))->a3);
			((T118*)(C))->a4 = (T170f8(ac, t2));
		}
	}
}

/* UT_ERROR_HANDLER.report_info_message */
void T160f8(TC* ac, T0* C, T0* a1)
{
	if (((T0*)(((T160*)(C))->a3))->id==161) {
		T161f9(ac, ((T160*)(C))->a3, a1);
	} else {
		T230f4(ac, ((T160*)(C))->a3, a1);
	}
}

/* AP_DISPLAY_HELP_FLAG.full_usage_instruction */
T0* T213f12(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	R = (T52f23(ac, a1));
	return R;
}

/* AP_PARSER.full_usage_instruction */
T0* T52f23(TC* ac, T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	R = (T52f17(ac, C));
	T17f52(ac, R, (T2)('\n'));
	l1 = ((T52*)(C))->a2;
	T215f16(ac, l1);
	while (1) {
		t1 = (T215f7(ac, l1));
		if (t1) {
			break;
		}
		t2 = (T215f6(ac, l1));
		t2 = (((T53*)(t2))->a4);
		t1 = (((((T0*)(t2))->id==46)?((T46*)(t2))->a6:((T213*)(t2))->a6));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t2 = (T215f6(ac, l1));
			t2 = (T52f21(ac, C, t2));
			T17f50(ac, R, t2);
		}
		T17f52(ac, R, (T2)('\n'));
		T215f17(ac, l1);
	}
	return R;
}

/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].forth */
void T215f17(TC* ac, T0* C)
{
	T215f21(ac, C, ((T215*)(C))->a1);
}

/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_forth */
void T215f21(TC* ac, T0* C, T0* a1)
{
	T1 l1 = 0;
	T6 volatile l2 = 0;
	T1 t1;
	l2 = (((T1109*)(a1))->a1);
	l1 = (T1)((l2) == ((T6)(GE_int32(-1))));
	l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
	t1 = (T6f14(ac, (&l2), ((T215*)(C))->a5));
	if (t1) {
		l2 = ((T6)(GE_int32(-2)));
		t1 = ((T1)(!(l1)));
		if (t1) {
			T215f23(ac, C, a1);
		}
	} else {
		if (l1) {
			T215f22(ac, C, a1);
		}
	}
	T1109f10(ac, a1, l2);
}

/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].set_position */
void T1109f10(TC* ac, T0* C, T6 a1)
{
	((T1109*)(C))->a1 = a1;
}

/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].add_traversing_cursor */
void T215f22(TC* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	t1 = (T1)(a1!=((T215*)(C))->a1);
	if (t1) {
		t2 = (((T1109*)(((T215*)(C))->a1))->a2);
		T1109f11(ac, a1, t2);
		T1109f11(ac, ((T215*)(C))->a1, a1);
	}
}

/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].set_next_cursor */
void T1109f11(TC* ac, T0* C, T0* a1)
{
	((T1109*)(C))->a2 = a1;
}

/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].remove_traversing_cursor */
void T215f23(TC* ac, T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	T0* t2;
	t1 = (T1)(a1!=((T215*)(C))->a1);
	if (t1) {
		l2 = ((T215*)(C))->a1;
		l1 = (((T1109*)(l2))->a2);
		while (1) {
			t1 = (T1)(l1==a1);
			if (!(t1)) {
				t1 = (T1)(l1==EIF_VOID);
			}
			if (t1) {
				break;
			}
			l2 = l1;
			l1 = (((T1109*)(l1))->a2);
		}
		t1 = (T1)(l1==a1);
		if (t1) {
			t2 = (((T1109*)(a1))->a2);
			T1109f11(ac, l2, t2);
			T1109f11(ac, a1, EIF_VOID);
		}
	}
}

/* AP_PARSER.alternative_usage_instruction */
T0* T52f21(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T1 t2;
	T0* t3;
	T6 t4;
	T6 t5;
	l1 = T17c58(ac);
	t1 = (((T53*)(a1))->a4);
	t1 = (((((T0*)(t1))->id==46)?T46f11(ac, t1):T213f14(ac, t1)));
	T17f50(ac, l1, t1);
	T17f52(ac, l1, (T2)(' '));
	T53f19(ac, a1);
	while (1) {
		t2 = (T53f8(ac, a1));
		if (t2) {
			break;
		}
		l2 = (T53f9(ac, a1));
		t2 = (((T46*)(l2))->a6);
		t2 = ((T1)(!(t2)));
		if (t2) {
			t1 = (T46f11(ac, l2));
			T17f50(ac, l1, t1);
			T17f52(ac, l1, (T2)(' '));
		}
		T53f20(ac, a1);
	}
	t1 = (((T53*)(a1))->a5);
	T17f50(ac, l1, t1);
	t1 = (T52s26(ac));
	t3 = (T52s27(ac));
	t3 = (((T33*)(t3))->a1);
	l3 = (((((T0*)(t1))->id==151)?T151s14(ac, t3):T152s14(ac, t3)));
	T17x2326539T6(ac, l3, (T6)(GE_int32(40)));
	t4 = (((T17*)(ge332ov5439510))->a2);
	R = T17c60(ac, (T2)(' '), t4);
	T17f50(ac, R, l3);
	T17f52(ac, R, (T2)(' '));
	T17f50(ac, R, l1);
	t1 = (T52f12(ac, C));
	t4 = (((T17*)(ge332ov5439510))->a2);
	t5 = (T17x2228263(ac, l3));
	t4 = ((T6)((t4)+(t5)));
	t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
	T211f10(ac, t1, t4);
	t1 = (T52f12(ac, C));
	R = (T211f5(ac, t1, R));
	return R;
}

/* ST_WORD_WRAPPER.wrapped_string */
T0* T211f5(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 volatile l4 = 0;
	T6 l5 = 0;
	T0* l6 = 0;
	T0* t1;
	T6 volatile t2;
	T1 t3;
	T2 t4;
	T6 t5;
	t1 = (T211s4(ac));
	l1 = (T108s13(ac, a1));
	T211f12(ac, C, l1);
	l2 = (T17x2228263(ac, l1));
	l6 = T17c60(ac, (T2)(' '), ((T211*)(C))->a1);
	t2 = (((T17*)(a1))->a2);
	R = T17c49(ac, t2);
	((T211*)(C))->a2 = (T6)(GE_int32(0));
	l4 = (T6)(GE_int32(1));
	l3 = ((T211*)(C))->a3;
	while (1) {
		t3 = (T6f4(ac, (&l4), l2));
		if (t3) {
			break;
		}
		t2 = ((T6)((l4)+(l3)));
		t3 = (T6f15(ac, &t2, l2));
		if (t3) {
			l5 = ((T6)((l4)+(l3)));
			while (1) {
				t3 = (T1)((l5) == (l4));
				if (!(t3)) {
					t4 = (T17x2572289T6(ac, l1, l5));
					t3 = (T1)((t4) == ((T2)(' ')));
				}
				if (t3) {
					break;
				}
				l5 = ((T6)((l5)-((T6)(GE_int32(1)))));
			}
		} else {
			l5 = ((T6)((l2)+((T6)(GE_int32(1)))));
		}
		t3 = (T1)((l5) == (l4));
		if (t3) {
			((T211*)(C))->a2 = ((T6)((((T211*)(C))->a2)+((T6)(GE_int32(1)))));
			t5 = ((T6)((l4)+(l3)));
			l5 = ((T6)((t5)-((T6)(GE_int32(1)))));
			t1 = (T17x2228304T6T6(ac, l1, l4, l5));
			T17f50(ac, R, t1);
		} else {
			t5 = ((T6)((l5)-((T6)(GE_int32(1)))));
			t1 = (T17x2228304T6T6(ac, l1, l4, t5));
			T17f50(ac, R, t1);
		}
		l4 = ((T6)((l5)+((T6)(GE_int32(1)))));
		t5 = (T17x2228263(ac, l1));
		t3 = (T6f15(ac, (&l4), t5));
		if (t3) {
			T17f52(ac, R, (T2)('\n'));
			T17f50(ac, R, l6);
		}
		l3 = ((T6)((((T211*)(C))->a3)-(((T211*)(C))->a1)));
	}
	return R;
}

/* ST_WORD_WRAPPER.canonify_whitespace */
void T211f12(TC* ac, T0* C, T0* a1)
{
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T2 l3 = 0;
	T1 t1;
	l2 = (T17x2228263(ac, a1));
	l1 = (T6)(GE_int32(1));
	while (1) {
		t1 = (T6f4(ac, (&l1), l2));
		if (t1) {
			break;
		}
		l3 = (T17x2572289T6(ac, a1, l1));
		t1 = (T211f8(ac, C, l3));
		if (t1) {
			T17x2588678T2T6(ac, a1, (T2)(' '), l1);
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
}

/* UC_UTF8_STRING.put */
void T1078f112(TC* ac, T0* C, T2 a1, T6 a2)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T2 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T6 volatile l6 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	T6 t4;
	t1 = (T1)((((T1078*)(C))->a1) == (((T1078*)(C))->a3));
	if (t1) {
		l1 = a2;
		l4 = (T6)(GE_int32(1));
	} else {
		l1 = (T1078f14(ac, C, a2));
		l3 = (T1078f16(ac, C, l1));
		t2 = (T1078s45(ac));
		l4 = (T168s2(ac, l3));
	}
	t2 = (T1078s45(ac));
	l5 = (T168s27(ac, a1));
	t1 = (T1)((l5) == (l4));
	if (t1) {
	} else {
		t1 = ((T1)((l5)<(l4)));
		if (t1) {
			t3 = ((T6)((l1)+(l4)));
			t4 = ((T6)((l4)-(l5)));
			T1078f107(ac, C, t3, t4);
		} else {
			l2 = ((T6)((l5)-(l4)));
			l6 = ((T6)((((T1078*)(C))->a3)+(l2)));
			t3 = (T1078f61(ac, C));
			t1 = (T6f4(ac, (&l6), t3));
			if (t1) {
				T1078f100(ac, C, l6);
			}
			t3 = ((T6)((l1)+(l4)));
			T1078f108(ac, C, t3, l2);
		}
	}
	T1078f102(ac, C, a1, l5, l1);
}

/* UC_STRING.put */
void T919f111(TC* ac, T0* C, T2 a1, T6 a2)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T2 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T6 volatile l6 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	T6 t4;
	t1 = (T1)((((T919*)(C))->a1) == (((T919*)(C))->a3));
	if (t1) {
		l1 = a2;
		l4 = (T6)(GE_int32(1));
	} else {
		l1 = (T919f37(ac, C, a2));
		l3 = (T919f36(ac, C, l1));
		t2 = (T919s35(ac));
		l4 = (T168s2(ac, l3));
	}
	t2 = (T919s35(ac));
	l5 = (T168s27(ac, a1));
	t1 = (T1)((l5) == (l4));
	if (t1) {
	} else {
		t1 = ((T1)((l5)<(l4)));
		if (t1) {
			t3 = ((T6)((l1)+(l4)));
			t4 = ((T6)((l4)-(l5)));
			T919f106(ac, C, t3, t4);
		} else {
			l2 = ((T6)((l5)-(l4)));
			l6 = ((T6)((((T919*)(C))->a3)+(l2)));
			t3 = (T919f59(ac, C));
			t1 = (T6f4(ac, (&l6), t3));
			if (t1) {
				T919f97(ac, C, l6);
			}
			t3 = ((T6)((l1)+(l4)));
			T919f107(ac, C, t3, l2);
		}
	}
	T919f101(ac, C, a1, l5, l1);
}

/* ST_WORD_WRAPPER.is_space */
T1 T211f8(TC* ac, T0* C, T2 a1)
{
	T1 R = 0;
	T1 t1;
	T1 t2;
	t2 = (T1)((a1) == ((T2)(' ')));
	if (!(t2)) {
		t1 = (T1)((a1) == ((T2)('\t')));
	} else {
		t1 = EIF_TRUE;
	}
	if (!(t1)) {
		t1 = (T1)((a1) == ((T2)('\n')));
	}
	if (!(t1)) {
		R = (T1)((a1) == ((T2)('\r')));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* KL_STRING_ROUTINES.cloned_string */
T0* T108s13(TC* ac, T0* a1)
{
	T0* R = 0;
	R = (T17x229387(ac, a1));
	return R;
}

/* ST_WORD_WRAPPER.string_ */
T0* T211s4(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[1]) {
		if (ac->thread_onces->reference_exception[1]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[1]);
		}
		return ac->thread_onces->reference_value[1];
	} else {
		ac->thread_onces->reference_status[1] = '\1';
		ac->thread_onces->reference_value[1] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[1] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T108c22(ac);
	ac->thread_onces->reference_value[1] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* ST_WORD_WRAPPER.set_new_line_indentation */
void T211f10(TC* ac, T0* C, T6 a1)
{
	((T211*)(C))->a1 = a1;
}

/* AP_PARSER.wrapper */
T0* T52f12(TC* ac, T0* C)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[36]) {
		if (ac->thread_onces->reference_exception[36]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[36]);
		}
		return ac->thread_onces->reference_value[36];
	} else {
		ac->thread_onces->reference_status[36] = '\1';
		ac->thread_onces->reference_value[36] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[36] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T211c9(ac);
	ac->thread_onces->reference_value[36] = R;
	T211f11(ac, R, (T6)(GE_int32(79)));
	ac->last_rescue = r.previous;
	return R;
}

/* ST_WORD_WRAPPER.set_maximum_text_width */
void T211f11(TC* ac, T0* C, T6 a1)
{
	((T211*)(C))->a3 = a1;
}

/* ST_WORD_WRAPPER.make */
T0* T211c9(TC* ac)
{
	T0* C;
	C = GE_new211(ac, EIF_TRUE);
	((T211*)(C))->a3 = (T6)(GE_int32(79));
	((T211*)(C))->a1 = (T6)(GE_int32(0));
	return C;
}

/* UC_UTF8_STRING.keep_head */
void T1078f75(TC* ac, T0* C, T6 a1)
{
	T1 t1;
	T6 t2;
	t1 = (T1)((a1) == ((T6)(GE_int32(0))));
	if (t1) {
		((T1078*)(C))->a3 = (T6)(GE_int32(0));
		T1078f74(ac, C, (T6)(GE_int32(0)));
	} else {
		t1 = ((T1)((a1)<(((T1078*)(C))->a1)));
		if (t1) {
			t1 = (T1)((((T1078*)(C))->a1) == (((T1078*)(C))->a3));
			if (t1) {
				((T1078*)(C))->a3 = a1;
			} else {
				t2 = ((T6)((a1)+((T6)(GE_int32(1)))));
				t2 = (T1078f14(ac, C, t2));
				((T1078*)(C))->a3 = ((T6)((t2)-((T6)(GE_int32(1)))));
			}
			T1078f74(ac, C, a1);
		}
	}
}

/* UC_STRING.keep_head */
void T919f82(TC* ac, T0* C, T6 a1)
{
	T1 t1;
	T6 t2;
	t1 = (T1)((a1) == ((T6)(GE_int32(0))));
	if (t1) {
		((T919*)(C))->a3 = (T6)(GE_int32(0));
		T919f90(ac, C, (T6)(GE_int32(0)));
	} else {
		t1 = ((T1)((a1)<(((T919*)(C))->a1)));
		if (t1) {
			t1 = (T1)((((T919*)(C))->a1) == (((T919*)(C))->a3));
			if (t1) {
				((T919*)(C))->a3 = a1;
			} else {
				t2 = ((T6)((a1)+((T6)(GE_int32(1)))));
				t2 = (T919f37(ac, C, t2));
				((T919*)(C))->a3 = ((T6)((t2)-((T6)(GE_int32(1)))));
			}
			T919f90(ac, C, a1);
		}
	}
}

/* KL_UNIX_FILE_SYSTEM.basename */
T0* T152s14(TC* ac, T0* a1)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T2 t2;
	T6 t3;
	t1 = (T152s11(ac, a1));
	if (t1) {
		R = (T152s22(ac));
	} else {
		l1 = (T17x2228263(ac, a1));
		while (1) {
			t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
			if (!(t1)) {
				t2 = (T17x2572289T6(ac, a1, l1));
				t1 = (T1)(!(T1)((t2) == ((T2)('/'))));
			}
			if (t1) {
				break;
			}
			l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
		}
		l2 = l1;
		while (1) {
			t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
			if (!(t1)) {
				t2 = (T17x2572289T6(ac, a1, l1));
				t1 = (T1)((t2) == ((T2)('/')));
			}
			if (t1) {
				break;
			}
			l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
		}
		t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
		if (t1) {
			t3 = (T17x2228263(ac, a1));
			t1 = (T1)((l2) == (t3));
		}
		if (t1) {
			R = a1;
		} else {
			t3 = ((T6)((l1)+((T6)(GE_int32(1)))));
			R = (T17x2228304T6T6(ac, a1, t3, l2));
		}
	}
	return R;
}

/* KL_UNIX_FILE_SYSTEM.is_root_directory */
T1 T152s11(TC* ac, T0* a1)
{
	T1 R = 0;
	T6 volatile l1 = 0;
	T6 volatile l2 = 0;
	T1 t1;
	T2 t2;
	l2 = (T17x2228263(ac, a1));
	t1 = (T6f4(ac, (&l2), (T6)(GE_int32(0))));
	if (t1) {
		R = EIF_TRUE;
		l1 = (T6)(GE_int32(1));
		while (1) {
			t1 = (T6f4(ac, (&l1), l2));
			if (t1) {
				break;
			}
			t2 = (T17x2572289T6(ac, a1, l1));
			t1 = (T1)(!(T1)((t2) == ((T2)('/'))));
			if (t1) {
				R = EIF_FALSE;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
	}
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.basename */
T0* T151s14(TC* ac, T0* a1)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T2 t2;
	T1 t3;
	T6 t4;
	t1 = (T151s11(ac, a1));
	if (t1) {
		R = (T151s23(ac));
	} else {
		l1 = (T17x2228263(ac, a1));
		while (1) {
			t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
			if (!(t1)) {
				t2 = (T17x2572289T6(ac, a1, l1));
				t3 = (T151s21(ac, t2));
				t1 = ((T1)(!(t3)));
			}
			if (t1) {
				break;
			}
			l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
		}
		l2 = l1;
		while (1) {
			t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
			if (!(t1)) {
				t2 = (T17x2572289T6(ac, a1, l1));
				t1 = (T151s21(ac, t2));
			}
			if (t1) {
				break;
			}
			l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
		}
		t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
		if (t1) {
			t4 = (T17x2228263(ac, a1));
			t1 = (T1)((l2) == (t4));
		}
		if (t1) {
			R = a1;
		} else {
			t4 = ((T6)((l1)+((T6)(GE_int32(1)))));
			R = (T17x2228304T6T6(ac, a1, t4, l2));
		}
	}
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.is_root_directory */
T1 T151s11(TC* ac, T0* a1)
{
	T1 R = 0;
	T6 volatile l1 = 0;
	T6 volatile l2 = 0;
	T1 l3 = 0;
	T1 l4 = 0;
	T2 l5 = 0;
	T1 t1;
	T2 t2;
	T1 t3;
	T6 t4;
	l2 = (T17x2228263(ac, a1));
	t1 = (T6f14(ac, (&l2), (T6)(GE_int32(4))));
	if (t1) {
		t2 = (T17x2572289T6(ac, a1, (T6)(GE_int32(1))));
		t1 = (T151s21(ac, t2));
	}
	if (t1) {
		t2 = (T17x2572289T6(ac, a1, (T6)(GE_int32(2))));
		t1 = (T151s21(ac, t2));
		if (t1) {
			t2 = (T17x2572289T6(ac, a1, (T6)(GE_int32(3))));
			t3 = (T151s21(ac, t2));
			t1 = ((T1)(!(t3)));
		}
		if (t1) {
			l1 = (T6)(GE_int32(4));
			while (1) {
				t1 = (T6f4(ac, (&l1), l2));
				if (!(t1)) {
					t1 = l4;
				}
				if (t1) {
					break;
				}
				l5 = (T17x2572289T6(ac, a1, l1));
				t1 = (T151s21(ac, l5));
				if (t1) {
					l4 = EIF_TRUE;
				} else {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				}
			}
			if (l4) {
				t1 = ((T1)((l1)<(l2)));
				if (t1) {
					t4 = ((T6)((l1)+((T6)(GE_int32(1)))));
					t2 = (T17x2572289T6(ac, a1, t4));
					t3 = (T151s21(ac, t2));
					t1 = ((T1)(!(t3)));
				}
				if (t1) {
					l4 = EIF_FALSE;
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					while (1) {
						t1 = (T6f4(ac, (&l1), l2));
						if (!(t1)) {
							t1 = l4;
						}
						if (t1) {
							break;
						}
						l5 = (T17x2572289T6(ac, a1, l1));
						t1 = (T151s21(ac, l5));
						if (t1) {
							l4 = EIF_TRUE;
						} else {
							l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						}
					}
					if (l4) {
						l4 = EIF_FALSE;
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						while (1) {
							t1 = (T6f4(ac, (&l1), l2));
							if (!(t1)) {
								t1 = l4;
							}
							if (t1) {
								break;
							}
							l5 = (T17x2572289T6(ac, a1, l1));
							t1 = (T151s21(ac, l5));
							t1 = ((T1)(!(t1)));
							if (t1) {
								l4 = EIF_TRUE;
							} else {
								l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
							}
						}
						R = ((T1)(!(l4)));
					} else {
						R = EIF_TRUE;
					}
				}
			}
		}
	} else {
		t1 = (T6f14(ac, (&l2), (T6)(GE_int32(3))));
		if (t1) {
			l5 = (T17x2572289T6(ac, a1, (T6)(GE_int32(1))));
			t3 = (T151s21(ac, l5));
			t1 = ((T1)(!(t3)));
			if (t1) {
				t1 = (T1)(!(T1)((l5) == ((T2)(':'))));
			}
			if (t1) {
				l1 = (T6)(GE_int32(2));
				while (1) {
					t3 = (T6f4(ac, (&l1), l2));
					if (!(t3)) {
						t1 = l3;
					} else {
						t1 = EIF_TRUE;
					}
					if (!(t1)) {
						t1 = l4;
					}
					if (t1) {
						break;
					}
					l5 = (T17x2572289T6(ac, a1, l1));
					t1 = (T151s21(ac, l5));
					if (t1) {
						l3 = EIF_TRUE;
					} else {
						t1 = (T1)((l5) == ((T2)(':')));
						if (t1) {
							l4 = EIF_TRUE;
						} else {
							l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						}
					}
				}
				if (l4) {
					t4 = ((T6)((l1)+((T6)(GE_int32(1)))));
					t1 = (T1)((t4) == (l2));
				} else {
					t1 = EIF_FALSE;
				}
				if (t1) {
					l5 = (T17x2572289T6(ac, a1, l2));
					R = (T151s21(ac, l5));
				}
			}
		} else {
			t1 = (T1)((l2) == ((T6)(GE_int32(1))));
			if (t1) {
				l5 = (T17x2572289T6(ac, a1, (T6)(GE_int32(1))));
				R = (T151s21(ac, l5));
			}
		}
	}
	return R;
}

/* AP_PARSER.arguments */
T0* T52s27(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[30]) {
		if (ac->thread_onces->reference_exception[30]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[30]);
		}
		return ac->thread_onces->reference_value[30];
	} else {
		ac->thread_onces->reference_status[30] = '\1';
		ac->thread_onces->reference_value[30] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[30] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T33c6(ac);
	ac->thread_onces->reference_value[30] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* AP_PARSER.file_system */
T0* T52s26(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	T0* t1;
	T1 t2;
	if (ac->thread_onces->reference_status[20]) {
		if (ac->thread_onces->reference_exception[20]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[20]);
		}
		return ac->thread_onces->reference_value[20];
	} else {
		ac->thread_onces->reference_status[20] = '\1';
		ac->thread_onces->reference_value[20] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[20] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	t1 = (T52s13(ac));
	t2 = (T119s1(ac));
	if (t2) {
		R = (T52s14(ac));
		ac->thread_onces->reference_value[20] = R;
	} else {
		t1 = (T52s13(ac));
		t2 = (T119s2(ac));
		if (t2) {
			R = (T52s15(ac));
			ac->thread_onces->reference_value[20] = R;
		} else {
			R = (T52s15(ac));
			ac->thread_onces->reference_value[20] = R;
		}
	}
	ac->last_rescue = r.previous;
	return R;
}

/* AP_PARSER.unix_file_system */
T0* T52s15(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[21]) {
		if (ac->thread_onces->reference_exception[21]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[21]);
		}
		return ac->thread_onces->reference_value[21];
	} else {
		ac->thread_onces->reference_status[21] = '\1';
		ac->thread_onces->reference_value[21] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[21] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T152c35(ac);
	ac->thread_onces->reference_value[21] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* AP_PARSER.windows_file_system */
T0* T52s14(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[26]) {
		if (ac->thread_onces->reference_exception[26]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[26]);
		}
		return ac->thread_onces->reference_value[26];
	} else {
		ac->thread_onces->reference_status[26] = '\1';
		ac->thread_onces->reference_value[26] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[26] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T151c38(ac);
	ac->thread_onces->reference_value[26] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* AP_PARSER.operating_system */
T0* T52s13(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[27]) {
		if (ac->thread_onces->reference_exception[27]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[27]);
		}
		return ac->thread_onces->reference_value[27];
	} else {
		ac->thread_onces->reference_status[27] = '\1';
		ac->thread_onces->reference_value[27] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[27] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T119c6(ac);
	ac->thread_onces->reference_value[27] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* AP_ALTERNATIVE_OPTIONS_LIST.forth */
void T53f20(TC* ac, T0* C)
{
	T53f22(ac, C, ((T53*)(C))->a6);
}

/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_forth */
void T53f22(TC* ac, T0* C, T0* a1)
{
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	T0* m1 = 0;
	T0* t1;
	T1 t2;
	t1 = (((T218*)(a1))->a4);
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		l3 = (((T217*)(m1))->a2);
	} else {
		l1 = EIF_TRUE;
		l3 = ((T53*)(C))->a3;
	}
	l2 = (T1)(l3==EIF_VOID);
	T218f8(ac, a1, l3, EIF_FALSE, l2);
	if (l2) {
		t2 = ((T1)(!(l1)));
		if (t2) {
			T53f24(ac, C, a1);
		}
	} else {
		if (l1) {
			T53f23(ac, C, a1);
		}
	}
}

/* AP_ALTERNATIVE_OPTIONS_LIST.add_traversing_cursor */
void T53f23(TC* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	t1 = (T1)(a1!=((T53*)(C))->a6);
	if (t1) {
		t2 = (((T218*)(((T53*)(C))->a6))->a5);
		T218f9(ac, a1, t2);
		T218f9(ac, ((T53*)(C))->a6, a1);
	}
}

/* DS_LINKED_LIST_CURSOR [AP_OPTION].set_next_cursor */
void T218f9(TC* ac, T0* C, T0* a1)
{
	((T218*)(C))->a5 = a1;
}

/* AP_ALTERNATIVE_OPTIONS_LIST.remove_traversing_cursor */
void T53f24(TC* ac, T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	T0* t2;
	t1 = (T1)(a1!=((T53*)(C))->a6);
	if (t1) {
		l2 = ((T53*)(C))->a6;
		l1 = (((T218*)(l2))->a5);
		while (1) {
			t1 = (T1)(l1==a1);
			if (!(t1)) {
				t1 = (T1)(l1==EIF_VOID);
			}
			if (t1) {
				break;
			}
			l2 = l1;
			l1 = (((T218*)(l1))->a5);
		}
		t1 = (T1)(l1==a1);
		if (t1) {
			t2 = (((T218*)(a1))->a5);
			T218f9(ac, l2, t2);
			T218f9(ac, a1, EIF_VOID);
		}
	}
}

/* DS_LINKED_LIST_CURSOR [AP_OPTION].set */
void T218f8(TC* ac, T0* C, T0* a1, T1 a2, T1 a3)
{
	((T218*)(C))->a4 = a1;
	((T218*)(C))->a2 = a2;
	((T218*)(C))->a3 = a3;
}

/* AP_ALTERNATIVE_OPTIONS_LIST.item_for_iteration */
T0* T53f9(TC* ac, T0* C)
{
	T0* R = 0;
	R = (T53f11(ac, C, ((T53*)(C))->a6));
	return R;
}

/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_item */
T0* T53f11(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T0* m1 = 0;
	T0* t1;
	T1 t2;
	t1 = (((T218*)(a1))->a4);
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	if (!(t2)) {
		GE_raise_with_message(GE_EX_CHECK, "not_off");
	}
	R = (((T217*)(m1))->a1);
	return R;
}

/* AP_ALTERNATIVE_OPTIONS_LIST.after */
T1 T53f8(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T53f10(ac, C, ((T53*)(C))->a6));
	return R;
}

/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_after */
T1 T53f10(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	R = (((T218*)(a1))->a3);
	return R;
}

/* AP_ALTERNATIVE_OPTIONS_LIST.start */
void T53f19(TC* ac, T0* C)
{
	T53f21(ac, C, ((T53*)(C))->a6);
}

/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_start */
void T53f21(TC* ac, T0* C, T0* a1)
{
	T1 l1 = 0;
	T1 l2 = 0;
	T1 t1;
	l1 = (T53f12(ac, C, a1));
	l2 = (T1)(((T53*)(C))->a3==EIF_VOID);
	T218f8(ac, a1, ((T53*)(C))->a3, EIF_FALSE, l2);
	t1 = ((T1)(!(l2)));
	if (t1) {
		t1 = l1;
	}
	if (t1) {
		T53f23(ac, C, a1);
	}
}

/* AP_ALTERNATIVE_OPTIONS_LIST.cursor_off */
T1 T53f12(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	R = (T218f6(ac, a1));
	return R;
}

/* DS_LINKED_LIST_CURSOR [AP_OPTION].off */
T1 T218f6(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T1)(((T218*)(C))->a4==EIF_VOID);
	return R;
}

/* AP_DISPLAY_HELP_FLAG.example */
T0* T213f14(TC* ac, T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	R = T17c49(ac, (T6)(GE_int32(20)));
	t1 = ((T1)(!(((T213*)(C))->a7)));
	if (t1) {
		T17f52(ac, R, (T2)('['));
	}
	T17f52(ac, R, (T2)('-'));
	if (((T213*)(C))->a3) {
		t2 = (T2f4(ac, &(((T213*)(C))->a2)));
		T17f50(ac, R, t2);
	} else {
		l1 = ((T213*)(C))->a4;
		T17f52(ac, R, (T2)('-'));
		T17f50(ac, R, l1);
	}
	t1 = ((T1)(!(((T213*)(C))->a7)));
	if (t1) {
		T17f52(ac, R, (T2)(']'));
	}
	return R;
}

/* CHARACTER_8.out */
T0* T2f4(TC* ac, T2 volatile* C)
{
	T0* R = 0;
	R = T17c49(ac, (T6)(GE_int32(1)));
	T17f52(ac, R, *C);
	return R;
}

/* AP_FLAG.example */
T0* T46f11(TC* ac, T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	R = T17c49(ac, (T6)(GE_int32(20)));
	t1 = ((T1)(!(((T46*)(C))->a7)));
	if (t1) {
		T17f52(ac, R, (T2)('['));
	}
	T17f52(ac, R, (T2)('-'));
	if (((T46*)(C))->a5) {
		t2 = (T2f4(ac, &(((T46*)(C))->a4)));
		T17f50(ac, R, t2);
	} else {
		l1 = ((T46*)(C))->a3;
		T17f52(ac, R, (T2)('-'));
		T17f50(ac, R, l1);
	}
	t1 = ((T1)(!(((T46*)(C))->a7)));
	if (t1) {
		T17f52(ac, R, (T2)(']'));
	}
	return R;
}

/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].item_for_iteration */
T0* T215f6(TC* ac, T0* C)
{
	T0* R = 0;
	R = (T215f11(ac, C, ((T215*)(C))->a1));
	return R;
}

/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_item */
T0* T215f11(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T6 t1;
	t1 = (((T1109*)(a1))->a1);
	R = (((T1110*)(((T215*)(C))->a2))->z2[t1]);
	return R;
}

/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].after */
T1 T215f7(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T215f8(ac, C, ((T215*)(C))->a1));
	return R;
}

/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_after */
T1 T215f8(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	R = (T1109f5(ac, a1));
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].after */
T1 T1109f5(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T1)((((T1109*)(C))->a1) == ((T6)(GE_int32(-2))));
	return R;
}

/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].start */
void T215f16(TC* ac, T0* C)
{
	T215f20(ac, C, ((T215*)(C))->a1);
}

/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].cursor_start */
void T215f20(TC* ac, T0* C, T0* a1)
{
	T1 l1 = 0;
	T1 t1;
	l1 = (T1109f7(ac, a1));
	t1 = (T215f13(ac, C));
	if (t1) {
		T1109f9(ac, a1);
	} else {
		T1109f10(ac, a1, (T6)(GE_int32(0)));
		if (l1) {
			T215f22(ac, C, a1);
		}
	}
}

/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].set_after */
void T1109f9(TC* ac, T0* C)
{
	((T1109*)(C))->a1 = (T6)(GE_int32(-2));
}

/* DS_ARRAYED_LIST [AP_ALTERNATIVE_OPTIONS_LIST].is_empty */
T1 T215f13(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T1)((((T215*)(C))->a5) == ((T6)(GE_int32(0))));
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].off */
T1 T1109f7(TC* ac, T0* C)
{
	T1 R = 0;
	T1 t1;
	t1 = (T1109f5(ac, C));
	if (!(t1)) {
		R = (T1109f6(ac, C));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [AP_ALTERNATIVE_OPTIONS_LIST].before */
T1 T1109f6(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T1)((((T1109*)(C))->a1) == ((T6)(GE_int32(-1))));
	return R;
}

/* AP_PARSER.usage_instruction */
T0* T52f17(TC* ac, T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T1 t1;
	T0* t2;
	T0* t3;
	T6 t4;
	T6 t5;
	l1 = T17c58(ac);
	l3 = ((T52*)(C))->a1;
	T214f19(ac, l3);
	while (1) {
		t1 = (T214f9(ac, l3));
		if (t1) {
			break;
		}
		l2 = (T214f7(ac, l3));
		t1 = (T61x5586955(ac, l2));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t2 = (T61x5586946(ac, l2));
			T17f50(ac, l1, t2);
			T17f52(ac, l1, (T2)(' '));
		}
		T214f20(ac, l3);
	}
	T17f50(ac, l1, ((T52*)(C))->a4);
	t2 = (T52s26(ac));
	t3 = (T52s27(ac));
	t3 = (((T33*)(t3))->a1);
	l4 = (((((T0*)(t2))->id==151)?T151s14(ac, t3):T152s14(ac, t3)));
	T17x2326539T6(ac, l4, (T6)(GE_int32(40)));
	R = T17c49(ac, (T6)(GE_int32(20)));
	T17f50(ac, R, ge332ov5439510);
	T17f50(ac, R, l4);
	T17f52(ac, R, (T2)(' '));
	T17f50(ac, R, l1);
	t2 = (T52f12(ac, C));
	t4 = (((T17*)(ge332ov5439510))->a2);
	t5 = (T17x2228263(ac, l4));
	t4 = ((T6)((t4)+(t5)));
	t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
	T211f10(ac, t2, t4);
	t2 = (T52f12(ac, C));
	R = (T211f5(ac, t2, R));
	return R;
}

/* DS_ARRAYED_LIST [AP_OPTION].forth */
void T214f20(TC* ac, T0* C)
{
	T214f24(ac, C, ((T214*)(C))->a1);
}

/* DS_ARRAYED_LIST [AP_OPTION].cursor_forth */
void T214f24(TC* ac, T0* C, T0* a1)
{
	T1 l1 = 0;
	T6 volatile l2 = 0;
	T1 t1;
	l2 = (((T1105*)(a1))->a1);
	l1 = (T1)((l2) == ((T6)(GE_int32(-1))));
	l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
	t1 = (T6f14(ac, (&l2), ((T214*)(C))->a2));
	if (t1) {
		l2 = ((T6)(GE_int32(-2)));
		t1 = ((T1)(!(l1)));
		if (t1) {
			T214f26(ac, C, a1);
		}
	} else {
		if (l1) {
			T214f25(ac, C, a1);
		}
	}
	T1105f10(ac, a1, l2);
}

/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].set_position */
void T1105f10(TC* ac, T0* C, T6 a1)
{
	((T1105*)(C))->a1 = a1;
}

/* DS_ARRAYED_LIST [AP_OPTION].add_traversing_cursor */
void T214f25(TC* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	t1 = (T1)(a1!=((T214*)(C))->a1);
	if (t1) {
		t2 = (((T1105*)(((T214*)(C))->a1))->a2);
		T1105f11(ac, a1, t2);
		T1105f11(ac, ((T214*)(C))->a1, a1);
	}
}

/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].set_next_cursor */
void T1105f11(TC* ac, T0* C, T0* a1)
{
	((T1105*)(C))->a2 = a1;
}

/* DS_ARRAYED_LIST [AP_OPTION].remove_traversing_cursor */
void T214f26(TC* ac, T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	T0* t2;
	t1 = (T1)(a1!=((T214*)(C))->a1);
	if (t1) {
		l2 = ((T214*)(C))->a1;
		l1 = (((T1105*)(l2))->a2);
		while (1) {
			t1 = (T1)(l1==a1);
			if (!(t1)) {
				t1 = (T1)(l1==EIF_VOID);
			}
			if (t1) {
				break;
			}
			l2 = l1;
			l1 = (((T1105*)(l1))->a2);
		}
		t1 = (T1)(l1==a1);
		if (t1) {
			t2 = (((T1105*)(a1))->a2);
			T1105f11(ac, l2, t2);
			T1105f11(ac, a1, EIF_VOID);
		}
	}
}

/* AP_INTEGER_OPTION.example */
T0* T59f15(TC* ac, T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	R = T17c49(ac, (T6)(GE_int32(20)));
	t1 = ((T1)(!(((T59*)(C))->a9)));
	if (t1) {
		T17f52(ac, R, (T2)('['));
	}
	T17f52(ac, R, (T2)('-'));
	if (((T59*)(C))->a11) {
		T17f52(ac, R, ((T59*)(C))->a7);
		T17f52(ac, R, (T2)(' '));
		T17f50(ac, R, ((T59*)(C))->a4);
	} else {
		T17f52(ac, R, (T2)('-'));
		l1 = ((T59*)(C))->a6;
		T17f50(ac, R, l1);
		t1 = ((T1)(!(((T59*)(C))->a5)));
		if (t1) {
			T17f52(ac, R, (T2)('['));
		}
		T17f52(ac, R, (T2)('='));
		T17f50(ac, R, ((T59*)(C))->a4);
		t1 = ((T1)(!(((T59*)(C))->a5)));
		if (t1) {
			T17f52(ac, R, (T2)(']'));
		}
	}
	t1 = ((T1)(!(((T59*)(C))->a9)));
	if (t1) {
		T17f52(ac, R, (T2)(']'));
	}
	return R;
}

/* AP_BOOLEAN_OPTION.example */
T0* T58f17(TC* ac, T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	R = T17c49(ac, (T6)(GE_int32(20)));
	t1 = ((T1)(!(((T58*)(C))->a8)));
	if (t1) {
		T17f52(ac, R, (T2)('['));
	}
	T17f52(ac, R, (T2)('-'));
	if (((T58*)(C))->a10) {
		T17f52(ac, R, ((T58*)(C))->a11);
		T17f52(ac, R, (T2)(' '));
		T17f50(ac, R, ((T58*)(C))->a4);
	} else {
		T17f52(ac, R, (T2)('-'));
		l1 = ((T58*)(C))->a6;
		T17f50(ac, R, l1);
		t1 = ((T1)(!(((T58*)(C))->a5)));
		if (t1) {
			T17f52(ac, R, (T2)('['));
		}
		T17f52(ac, R, (T2)('='));
		T17f50(ac, R, ((T58*)(C))->a4);
		t1 = ((T1)(!(((T58*)(C))->a5)));
		if (t1) {
			T17f52(ac, R, (T2)(']'));
		}
	}
	t1 = ((T1)(!(((T58*)(C))->a8)));
	if (t1) {
		T17f52(ac, R, (T2)(']'));
	}
	return R;
}

/* AP_ENUMERATION_OPTION.example */
T0* T57f13(TC* ac, T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	R = T17c49(ac, (T6)(GE_int32(20)));
	t1 = ((T1)(!(((T57*)(C))->a9)));
	if (t1) {
		T17f52(ac, R, (T2)('['));
	}
	T17f52(ac, R, (T2)('-'));
	if (((T57*)(C))->a11) {
		T17f52(ac, R, ((T57*)(C))->a12);
		T17f52(ac, R, (T2)(' '));
		T17f50(ac, R, ((T57*)(C))->a5);
	} else {
		T17f52(ac, R, (T2)('-'));
		l1 = ((T57*)(C))->a7;
		T17f50(ac, R, l1);
		t1 = ((T1)(!(((T57*)(C))->a6)));
		if (t1) {
			T17f52(ac, R, (T2)('['));
		}
		T17f52(ac, R, (T2)('='));
		T17f50(ac, R, ((T57*)(C))->a5);
		t1 = ((T1)(!(((T57*)(C))->a6)));
		if (t1) {
			T17f52(ac, R, (T2)(']'));
		}
	}
	t1 = ((T1)(!(((T57*)(C))->a9)));
	if (t1) {
		T17f52(ac, R, (T2)(']'));
	}
	return R;
}

/* AP_STRING_OPTION.example */
T0* T54f18(TC* ac, T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	R = T17c49(ac, (T6)(GE_int32(20)));
	t1 = ((T1)(!(((T54*)(C))->a9)));
	if (t1) {
		T17f52(ac, R, (T2)('['));
	}
	T17f52(ac, R, (T2)('-'));
	if (((T54*)(C))->a11) {
		T17f52(ac, R, ((T54*)(C))->a12);
		T17f52(ac, R, (T2)(' '));
		T17f50(ac, R, ((T54*)(C))->a4);
	} else {
		T17f52(ac, R, (T2)('-'));
		l1 = ((T54*)(C))->a7;
		T17f50(ac, R, l1);
		t1 = ((T1)(!(((T54*)(C))->a6)));
		if (t1) {
			T17f52(ac, R, (T2)('['));
		}
		T17f52(ac, R, (T2)('='));
		T17f50(ac, R, ((T54*)(C))->a4);
		t1 = ((T1)(!(((T54*)(C))->a6)));
		if (t1) {
			T17f52(ac, R, (T2)(']'));
		}
	}
	t1 = ((T1)(!(((T54*)(C))->a9)));
	if (t1) {
		T17f52(ac, R, (T2)(']'));
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.is_hidden */
T1 T213f6(TC* ac, T0* C)
{
	T1 R = 0;
	R = ((T213*)(C))->a6;
	return R;
}

/* AP_INTEGER_OPTION.is_hidden */
T1 T59f8(TC* ac, T0* C)
{
	T1 R = 0;
	R = ((T59*)(C))->a8;
	return R;
}

/* AP_BOOLEAN_OPTION.is_hidden */
T1 T58f7(TC* ac, T0* C)
{
	T1 R = 0;
	R = ((T58*)(C))->a7;
	return R;
}

/* AP_ENUMERATION_OPTION.is_hidden */
T1 T57f8(TC* ac, T0* C)
{
	T1 R = 0;
	R = ((T57*)(C))->a8;
	return R;
}

/* AP_FLAG.is_hidden */
T1 T46f6(TC* ac, T0* C)
{
	T1 R = 0;
	R = ((T46*)(C))->a6;
	return R;
}

/* AP_STRING_OPTION.is_hidden */
T1 T54f8(TC* ac, T0* C)
{
	T1 R = 0;
	R = ((T54*)(C))->a8;
	return R;
}

/* DS_ARRAYED_LIST [AP_OPTION].item_for_iteration */
T0* T214f7(TC* ac, T0* C)
{
	T0* R = 0;
	R = (T214f11(ac, C, ((T214*)(C))->a1));
	return R;
}

/* DS_ARRAYED_LIST [AP_OPTION].cursor_item */
T0* T214f11(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T6 t1;
	t1 = (((T1105*)(a1))->a1);
	R = (((T1107*)(((T214*)(C))->a4))->z2[t1]);
	return R;
}

/* DS_ARRAYED_LIST [AP_OPTION].after */
T1 T214f9(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T214f10(ac, C, ((T214*)(C))->a1));
	return R;
}

/* DS_ARRAYED_LIST [AP_OPTION].cursor_after */
T1 T214f10(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	R = (T1105f5(ac, a1));
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].after */
T1 T1105f5(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T1)((((T1105*)(C))->a1) == ((T6)(GE_int32(-2))));
	return R;
}

/* DS_ARRAYED_LIST [AP_OPTION].start */
void T214f19(TC* ac, T0* C)
{
	T214f23(ac, C, ((T214*)(C))->a1);
}

/* DS_ARRAYED_LIST [AP_OPTION].cursor_start */
void T214f23(TC* ac, T0* C, T0* a1)
{
	T1 l1 = 0;
	T1 t1;
	l1 = (T1105f7(ac, a1));
	t1 = (T214f15(ac, C));
	if (t1) {
		T1105f9(ac, a1);
	} else {
		T1105f10(ac, a1, (T6)(GE_int32(0)));
		if (l1) {
			T214f25(ac, C, a1);
		}
	}
}

/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].set_after */
void T1105f9(TC* ac, T0* C)
{
	((T1105*)(C))->a1 = (T6)(GE_int32(-2));
}

/* DS_ARRAYED_LIST [AP_OPTION].is_empty */
T1 T214f15(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T1)((((T214*)(C))->a2) == ((T6)(GE_int32(0))));
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].off */
T1 T1105f7(TC* ac, T0* C)
{
	T1 R = 0;
	T1 t1;
	t1 = (T1105f5(ac, C));
	if (!(t1)) {
		R = (T1105f6(ac, C));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].before */
T1 T1105f6(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T1)((((T1105*)(C))->a1) == ((T6)(GE_int32(-1))));
	return R;
}

/* GECC.report_version_number */
void T118f17(TC* ac, T0* C)
{
	T0* l1 = 0;
	l1 = T103c8(ac, ge748ov12255233);
	T160f10(ac, ((T118*)(C))->a2, l1);
}

/* UT_ERROR_HANDLER.report_info */
void T160f10(TC* ac, T0* C, T0* a1)
{
	T0* t1;
	t1 = (T160f5(ac, C, a1));
	T160f8(ac, C, t1);
}

/* UT_VERSION_NUMBER.make */
T0* T103c8(TC* ac, T0* a1)
{
	T0* C;
	C = GE_new103(ac, EIF_TRUE);
	((T103*)(C))->a1 = T34c7(ac, ge725ov11878406, (T6)(GE_int32(1)), (T6)(GE_int32(1)));
	T34f8(ac, ((T103*)(C))->a1, a1, (T6)(GE_int32(1)));
	return C;
}

/* AP_PARSER.parse_array */
void T52f44(TC* ac, T0* C, T0* a1)
{
	T0* l1 = 0;
	l1 = T170c22(ac, a1);
	T52f45(ac, C, l1);
}

/* AP_PARSER.parse_list */
void T52f45(TC* ac, T0* C, T0* a1)
{
	T1 t1;
	T52f46(ac, C);
	T170f23(ac, a1);
	while (1) {
		t1 = (T170f9(ac, a1));
		if (t1) {
			break;
		}
		T52f47(ac, C, a1);
	}
	T52f48(ac, C);
	t1 = (((T216*)(((T52*)(C))->a6))->a1);
	if (t1) {
		T52f49(ac, C);
	}
}

/* AP_PARSER.final_error_action */
void T52f49(TC* ac, T0* C)
{
	T0* t1;
	T216f10(ac, ((T52*)(C))->a6, ge334ov5472263);
	t1 = (T52s31(ac));
	T36s2(ac, (T6)(GE_int32(1)));
}

/* AP_PARSER.exceptions */
T0* T52s31(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[37]) {
		if (ac->thread_onces->reference_exception[37]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[37]);
		}
		return ac->thread_onces->reference_value[37];
	} else {
		ac->thread_onces->reference_status[37] = '\1';
		ac->thread_onces->reference_value[37] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[37] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T36c1(ac);
	ac->thread_onces->reference_value[37] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* KL_EXCEPTIONS.default_create */
T0* T36c1(TC* ac)
{
	T0* C;
	C = GE_new36(ac, EIF_TRUE);
	return C;
}

/* AP_ERROR_HANDLER.report_error_message */
void T216f10(TC* ac, T0* C, T0* a1)
{
	((T216*)(C))->a1 = EIF_TRUE;
	T216f10p1(ac, C, a1);
}

/* AP_ERROR_HANDLER.report_error_message */
void T216f10p1(TC* ac, T0* C, T0* a1)
{
	T39f7(ac, ((T216*)(C))->a2, a1);
}

/* AP_PARSER.check_options_after_parsing */
void T52f48(TC* ac, T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T1 t2;
	T6 volatile t3;
	T6 volatile t4;
	T6 t5;
	l3 = ((T52*)(C))->a8;
	t1 = (T1)(l3!=EIF_VOID);
	if (!(t1)) {
		GE_raise_with_message(GE_EX_CHECK, "current_options_not_void");
	}
	if (((T0*)(l3))->id==214) {
		T214f19(ac, l3);
	} else {
		T53f19(ac, l3);
	}
	while (1) {
		t1 = (((((T0*)(l3))->id==214)?T214f9(ac, l3):T53f8(ac, l3)));
		if (t1) {
			break;
		}
		l1 = (((((T0*)(l3))->id==214)?T214f7(ac, l3):T53f9(ac, l3)));
		t1 = (T61x5586956(ac, l1));
		if (t1) {
			t2 = (T61x5586961(ac, l1));
			t1 = ((T1)(!(t2)));
		}
		if (t1) {
			l2 = T113c22(ac, l1);
			T216f9(ac, ((T52*)(C))->a6, l2);
		}
		t3 = (T61x5586951(ac, l1));
		t1 = (T6f4(ac, &t3, (T6)(GE_int32(0))));
		if (t1) {
			t4 = (T61x5586950(ac, l1));
			t5 = (T61x5586951(ac, l1));
			t1 = (T6f4(ac, &t4, t5));
		}
		if (t1) {
			l2 = T113c23(ac, l1);
			T216f9(ac, ((T52*)(C))->a6, l2);
		}
		if (((T0*)(l3))->id==214) {
			T214f20(ac, l3);
		} else {
			T53f20(ac, l3);
		}
	}
}

/* AP_ERROR.make_surplus_option_error */
T0* T113c23(TC* ac, T0* a1)
{
	T0* C;
	T0* t1;
	C = GE_new113(ac, EIF_TRUE);
	((T113*)(C))->a1 = T34c7(ac, ge725ov11878406, (T6)(GE_int32(1)), (T6)(GE_int32(1)));
	t1 = (T61x5586948(ac, a1));
	T34f8(ac, ((T113*)(C))->a1, t1, (T6)(GE_int32(1)));
	((T113*)(C))->a2 = ge337ov5521413;
	((T113*)(C))->a3 = ge337ov5521420;
	return C;
}

/* AP_DISPLAY_HELP_FLAG.name */
T0* T213f10(TC* ac, T0* C)
{
	T0* R = 0;
	T0* m1 = 0;
	T1 t1;
	T2 volatile t2;
	T0* t3;
	T2 volatile t4;
	T0* t5;
	T2 volatile t6;
	t1 = (((T213*)(C))->a4?((m1 = ((T213*)(C))->a4, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f4(ac, &t2));
		t4 = (T2)('-');
		t5 = (T2f4(ac, &t4));
		t3 = (T17f5(ac, t3, t5));
		R = (T17f5(ac, t3, m1));
	} else {
		t6 = (T2)('-');
		t3 = (T2f4(ac, &t6));
		t5 = (T2f4(ac, &(((T213*)(C))->a2)));
		R = (T17f5(ac, t3, t5));
	}
	return R;
}

/* AP_INTEGER_OPTION.name */
T0* T59f17(TC* ac, T0* C)
{
	T0* R = 0;
	T0* m1 = 0;
	T1 t1;
	T2 volatile t2;
	T0* t3;
	T2 volatile t4;
	T0* t5;
	T2 volatile t6;
	t1 = (((T59*)(C))->a6?((m1 = ((T59*)(C))->a6, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f4(ac, &t2));
		t4 = (T2)('-');
		t5 = (T2f4(ac, &t4));
		t3 = (T17f5(ac, t3, t5));
		R = (T17f5(ac, t3, m1));
	} else {
		t6 = (T2)('-');
		t3 = (T2f4(ac, &t6));
		t5 = (T2f4(ac, &(((T59*)(C))->a7)));
		R = (T17f5(ac, t3, t5));
	}
	return R;
}

/* AP_BOOLEAN_OPTION.name */
T0* T58f13(TC* ac, T0* C)
{
	T0* R = 0;
	T0* m1 = 0;
	T1 t1;
	T2 volatile t2;
	T0* t3;
	T2 volatile t4;
	T0* t5;
	T2 volatile t6;
	t1 = (((T58*)(C))->a6?((m1 = ((T58*)(C))->a6, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f4(ac, &t2));
		t4 = (T2)('-');
		t5 = (T2f4(ac, &t4));
		t3 = (T17f5(ac, t3, t5));
		R = (T17f5(ac, t3, m1));
	} else {
		t6 = (T2)('-');
		t3 = (T2f4(ac, &t6));
		t5 = (T2f4(ac, &(((T58*)(C))->a11)));
		R = (T17f5(ac, t3, t5));
	}
	return R;
}

/* AP_ENUMERATION_OPTION.name */
T0* T57f15(TC* ac, T0* C)
{
	T0* R = 0;
	T0* m1 = 0;
	T1 t1;
	T2 volatile t2;
	T0* t3;
	T2 volatile t4;
	T0* t5;
	T2 volatile t6;
	t1 = (((T57*)(C))->a7?((m1 = ((T57*)(C))->a7, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f4(ac, &t2));
		t4 = (T2)('-');
		t5 = (T2f4(ac, &t4));
		t3 = (T17f5(ac, t3, t5));
		R = (T17f5(ac, t3, m1));
	} else {
		t6 = (T2)('-');
		t3 = (T2f4(ac, &t6));
		t5 = (T2f4(ac, &(((T57*)(C))->a12)));
		R = (T17f5(ac, t3, t5));
	}
	return R;
}

/* AP_FLAG.name */
T0* T46f10(TC* ac, T0* C)
{
	T0* R = 0;
	T0* m1 = 0;
	T1 t1;
	T2 volatile t2;
	T0* t3;
	T2 volatile t4;
	T0* t5;
	T2 volatile t6;
	t1 = (((T46*)(C))->a3?((m1 = ((T46*)(C))->a3, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f4(ac, &t2));
		t4 = (T2)('-');
		t5 = (T2f4(ac, &t4));
		t3 = (T17f5(ac, t3, t5));
		R = (T17f5(ac, t3, m1));
	} else {
		t6 = (T2)('-');
		t3 = (T2f4(ac, &t6));
		t5 = (T2f4(ac, &(((T46*)(C))->a4)));
		R = (T17f5(ac, t3, t5));
	}
	return R;
}

/* AP_STRING_OPTION.name */
T0* T54f14(TC* ac, T0* C)
{
	T0* R = 0;
	T0* m1 = 0;
	T1 t1;
	T2 volatile t2;
	T0* t3;
	T2 volatile t4;
	T0* t5;
	T2 volatile t6;
	t1 = (((T54*)(C))->a7?((m1 = ((T54*)(C))->a7, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f4(ac, &t2));
		t4 = (T2)('-');
		t5 = (T2f4(ac, &t4));
		t3 = (T17f5(ac, t3, t5));
		R = (T17f5(ac, t3, m1));
	} else {
		t6 = (T2)('-');
		t3 = (T2f4(ac, &t6));
		t5 = (T2f4(ac, &(((T54*)(C))->a12)));
		R = (T17f5(ac, t3, t5));
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.occurrences */
T6 T213f5(TC* ac, T0* C)
{
	T6 R = 0;
	R = ((T213*)(C))->a5;
	return R;
}

/* AP_BOOLEAN_OPTION.occurrences */
T6 T58f14(TC* ac, T0* C)
{
	T6 R = 0;
	R = (((T226*)(((T58*)(C))->a1))->a1);
	return R;
}

/* AP_ENUMERATION_OPTION.occurrences */
T6 T57f16(TC* ac, T0* C)
{
	T6 R = 0;
	R = (((T219*)(((T57*)(C))->a1))->a1);
	return R;
}

/* AP_FLAG.occurrences */
T6 T46f1(TC* ac, T0* C)
{
	T6 R = 0;
	R = ((T46*)(C))->a1;
	return R;
}

/* AP_STRING_OPTION.occurrences */
T6 T54f17(TC* ac, T0* C)
{
	T6 R = 0;
	R = (((T219*)(((T54*)(C))->a1))->a1);
	return R;
}

/* AP_DISPLAY_HELP_FLAG.maximum_occurrences */
T6 T213f8(TC* ac, T0* C)
{
	T6 R = 0;
	R = ((T213*)(C))->a8;
	return R;
}

/* AP_INTEGER_OPTION.maximum_occurrences */
T6 T59f10(TC* ac, T0* C)
{
	T6 R = 0;
	R = ((T59*)(C))->a10;
	return R;
}

/* AP_BOOLEAN_OPTION.maximum_occurrences */
T6 T58f9(TC* ac, T0* C)
{
	T6 R = 0;
	R = ((T58*)(C))->a9;
	return R;
}

/* AP_ENUMERATION_OPTION.maximum_occurrences */
T6 T57f10(TC* ac, T0* C)
{
	T6 R = 0;
	R = ((T57*)(C))->a10;
	return R;
}

/* AP_FLAG.maximum_occurrences */
T6 T46f8(TC* ac, T0* C)
{
	T6 R = 0;
	R = ((T46*)(C))->a8;
	return R;
}

/* AP_STRING_OPTION.maximum_occurrences */
T6 T54f10(TC* ac, T0* C)
{
	T6 R = 0;
	R = ((T54*)(C))->a10;
	return R;
}

/* AP_ERROR_HANDLER.report_error */
void T216f9(TC* ac, T0* C, T0* a1)
{
	T0* t1;
	t1 = (T216f6(ac, C, a1));
	T216f10(ac, C, t1);
}

/* AP_ERROR_HANDLER.message */
T0* T216f6(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	R = (T113f17(ac, a1));
	return R;
}

/* AP_ERROR.default_message */
T0* T113f17(TC* ac, T0* C)
{
	T0* R = 0;
	R = (T113f18(ac, C, ((T113*)(C))->a2));
	return R;
}

/* AP_ERROR.message */
T0* T113f18(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T113s19(ac));
	R = (T108s3(ac, a1, l4));
	while (1) {
		t2 = (T6f4(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f24(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (T1)(!(T1)((l5) == ((T2)('$'))));
		if (t2) {
			t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
			if (t2) {
				T17x2293809T2(ac, R, l5);
			} else {
				t1 = (T113s19(ac));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T108s4(ac, R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(ac, (&l2), l4));
			if (t2) {
				T17x2293809T2(ac, R, (T2)('$'));
			} else {
				l5 = (T17f24(ac, a1, l2));
				t2 = (T1)((l5) == ((T2)('$')));
				if (t2) {
					T17x2293809T2(ac, R, (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T113s19(ac));
					l1 = (T108s3(ac, a1, (T6)(GE_int32(5))));
					t2 = (T1)((l5) == ((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l8;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							t2 = (T1)((l5) == ((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (T1)(!(T1)((l5) == ((T2)('\000'))));
								if (t2) {
									T17x2293809T2(ac, l1, l5);
								} else {
									t1 = (T113s19(ac));
									T108s23(ac, l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4(ac, (&l2), l4));
							if (!(t2)) {
								t2 = l6;
							}
							if (t2) {
								break;
							}
							l5 = (T17f24(ac, a1, l2));
							switch (l5) {
							case (T2)'0':
							case (T2)'1':
							case (T2)'2':
							case (T2)'3':
							case (T2)'4':
							case (T2)'5':
							case (T2)'6':
							case (T2)'7':
							case (T2)'8':
							case (T2)'9':
								T17x2293809T2(ac, l1, l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (T17x2228255(ac, l1));
					if (t2) {
						l3 = (T17x2228289(ac, l1));
						t2 = (T34f4(ac, ((T113*)(C))->a1, l3));
						if (t2) {
							t1 = (T113s19(ac));
							t5 = (T34f5(ac, ((T113*)(C))->a1, l3));
							R = (T108s5(ac, R, t5));
						} else {
							t2 = (T1)((l3) == ((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T113s19(ac));
								t5 = (T113s20(ac));
								t5 = (((T33*)(t5))->a1);
								R = (T108s5(ac, R, t5));
							} else {
								T17x2293809T2(ac, R, (T2)('$'));
								if (l7) {
									T17x2293809T2(ac, R, (T2)('{'));
								}
								t1 = (T113s19(ac));
								R = (T108s5(ac, R, l1));
								if (l8) {
									T17x2293809T2(ac, R, (T2)('}'));
								}
							}
						}
					} else {
						T17x2293809T2(ac, R, (T2)('$'));
						if (l7) {
							T17x2293809T2(ac, R, (T2)('{'));
						}
						t1 = (T113s19(ac));
						R = (T108s5(ac, R, l1));
						if (l8) {
							T17x2293809T2(ac, R, (T2)('}'));
						}
					}
				}
			}
		}
	}
	return R;
}

/* AP_ERROR.arguments */
T0* T113s20(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[30]) {
		if (ac->thread_onces->reference_exception[30]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[30]);
		}
		return ac->thread_onces->reference_value[30];
	} else {
		ac->thread_onces->reference_status[30] = '\1';
		ac->thread_onces->reference_value[30] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[30] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T33c6(ac);
	ac->thread_onces->reference_value[30] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* AP_ERROR.string_ */
T0* T113s19(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[1]) {
		if (ac->thread_onces->reference_exception[1]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[1]);
		}
		return ac->thread_onces->reference_value[1];
	} else {
		ac->thread_onces->reference_status[1] = '\1';
		ac->thread_onces->reference_value[1] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[1] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T108c22(ac);
	ac->thread_onces->reference_value[1] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* AP_ERROR.make_missing_option_error */
T0* T113c22(TC* ac, T0* a1)
{
	T0* C;
	T0* t1;
	C = GE_new113(ac, EIF_TRUE);
	((T113*)(C))->a1 = T34c7(ac, ge725ov11878406, (T6)(GE_int32(1)), (T6)(GE_int32(1)));
	t1 = (T61x5586948(ac, a1));
	T34f8(ac, ((T113*)(C))->a1, t1, (T6)(GE_int32(1)));
	((T113*)(C))->a2 = ge337ov5521411;
	((T113*)(C))->a3 = ge337ov5521418;
	return C;
}

/* AP_DISPLAY_HELP_FLAG.was_found */
T1 T213f13(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T6f4(ac, &(((T213*)(C))->a5), (T6)(GE_int32(0))));
	return R;
}

/* AP_BOOLEAN_OPTION.was_found */
T1 T58f16(TC* ac, T0* C)
{
	T1 R = 0;
	T6 volatile t1;
	t1 = (T58f14(ac, C));
	R = (T6f4(ac, &t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_ENUMERATION_OPTION.was_found */
T1 T57f18(TC* ac, T0* C)
{
	T1 R = 0;
	T6 volatile t1;
	t1 = (T57f16(ac, C));
	R = (T6f4(ac, &t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_STRING_OPTION.was_found */
T1 T54f13(TC* ac, T0* C)
{
	T1 R = 0;
	T6 volatile t1;
	t1 = (T54f17(ac, C));
	R = (T6f4(ac, &t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_DISPLAY_HELP_FLAG.is_mandatory */
T1 T213f7(TC* ac, T0* C)
{
	T1 R = 0;
	R = ((T213*)(C))->a7;
	return R;
}

/* AP_INTEGER_OPTION.is_mandatory */
T1 T59f9(TC* ac, T0* C)
{
	T1 R = 0;
	R = ((T59*)(C))->a9;
	return R;
}

/* AP_BOOLEAN_OPTION.is_mandatory */
T1 T58f8(TC* ac, T0* C)
{
	T1 R = 0;
	R = ((T58*)(C))->a8;
	return R;
}

/* AP_ENUMERATION_OPTION.is_mandatory */
T1 T57f9(TC* ac, T0* C)
{
	T1 R = 0;
	R = ((T57*)(C))->a9;
	return R;
}

/* AP_FLAG.is_mandatory */
T1 T46f7(TC* ac, T0* C)
{
	T1 R = 0;
	R = ((T46*)(C))->a7;
	return R;
}

/* AP_STRING_OPTION.is_mandatory */
T1 T54f9(TC* ac, T0* C)
{
	T1 R = 0;
	R = ((T54*)(C))->a9;
	return R;
}

/* AP_PARSER.parse_argument */
void T52f47(TC* ac, T0* C, T0* a1)
{
	T0* l1 = 0;
	T6 volatile l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	l3 = ((T52*)(C))->a3;
	l1 = (T170f13(ac, a1));
	l2 = (T17x2228263(ac, l1));
	t1 = (T6f14(ac, (&l2), (T6)(GE_int32(2))));
	if (t1) {
		t2 = (T17x2572289T6(ac, l1, (T6)(GE_int32(1))));
		t1 = (T1)((t2) == ((T2)('-')));
	}
	if (t1) {
		t2 = (T17x2572289T6(ac, l1, (T6)(GE_int32(2))));
		t1 = (T1)((t2) == ((T2)('-')));
		if (t1) {
			t1 = (T1)((l2) == ((T6)(GE_int32(2))));
			if (t1) {
				T170f24(ac, a1);
				while (1) {
					t1 = (T170f9(ac, a1));
					if (t1) {
						break;
					}
					t3 = (T170f13(ac, a1));
					T170f25(ac, l3, t3);
					T170f24(ac, a1);
				}
			} else {
				T52f50(ac, C, a1);
			}
		} else {
			T52f51(ac, C, a1);
		}
	} else {
		T170f25(ac, l3, l1);
		T170f24(ac, a1);
	}
}

/* AP_PARSER.parse_short */
void T52f51(TC* ac, T0* C, T0* a1)
{
	T0* l1 = 0;
	T6 volatile l2 = 0;
	T2 volatile l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	T2 t4;
	T6 t5;
	l1 = (T170f13(ac, a1));
	l2 = (T6)(GE_int32(2));
	while (1) {
		t1 = (T17x2228263(ac, l1));
		t2 = (T6f4(ac, (&l2), t1));
		if (t2) {
			break;
		}
		l3 = (T17x2572289T6(ac, l1, l2));
		l4 = EIF_VOID;
		if (((T52*)(C))->a9) {
			T215f16(ac, ((T52*)(C))->a2);
			while (1) {
				t2 = (T1)(l4!=EIF_VOID);
				if (!(t2)) {
					t2 = (T215f7(ac, ((T52*)(C))->a2));
				}
				if (t2) {
					break;
				}
				t3 = (T215f6(ac, ((T52*)(C))->a2));
				l5 = (((T53*)(t3))->a4);
				t2 = (T61x5586954(ac, l5));
				if (t2) {
					t4 = (T61x5586952(ac, l5));
					t2 = (T1)((t4) == (l3));
				}
				if (t2) {
					l4 = l5;
					((T52*)(C))->a8 = (T215f6(ac, ((T52*)(C))->a2));
				}
				T215f17(ac, ((T52*)(C))->a2);
			}
			((T52*)(C))->a9 = EIF_FALSE;
		}
		l8 = ((T52*)(C))->a8;
		t2 = (T1)(l4==EIF_VOID);
		if (t2) {
			t2 = (T1)(l8!=EIF_VOID);
		}
		if (t2) {
			if (((T0*)(l8))->id==214) {
				T214f19(ac, l8);
			} else {
				T53f19(ac, l8);
			}
			while (1) {
				t2 = (T1)(l4!=EIF_VOID);
				if (!(t2)) {
					t2 = (((((T0*)(l8))->id==214)?T214f9(ac, l8):T53f8(ac, l8)));
				}
				if (t2) {
					break;
				}
				l5 = (((((T0*)(l8))->id==214)?T214f7(ac, l8):T53f9(ac, l8)));
				t2 = (T61x5586954(ac, l5));
				if (t2) {
					t4 = (T61x5586952(ac, l5));
					t2 = (T1)((t4) == (l3));
				}
				if (t2) {
					l4 = l5;
				}
				if (((T0*)(l8))->id==214) {
					T214f20(ac, l8);
				} else {
					T53f20(ac, l8);
				}
			}
		}
		t2 = (T1)(l4==EIF_VOID);
		if (t2) {
			t3 = (T2f4(ac, (&l3)));
			l7 = T113c24(ac, t3);
			T216f9(ac, ((T52*)(C))->a6, l7);
		} else {
			t2 = (T61x5586958(ac, l4));
			if (t2) {
				t1 = (T17x2228263(ac, l1));
				t2 = (T1)((l2) == (t1));
				if (t2) {
					T170f24(ac, a1);
					t2 = (T170f14(ac, a1));
					t2 = ((T1)(!(t2)));
					if (t2) {
						l6 = (T170f13(ac, a1));
					}
				} else {
					t1 = ((T6)((l2)+((T6)(GE_int32(1)))));
					t5 = (T17x2228263(ac, l1));
					l6 = (T17x2228304T6T6(ac, l1, t1, t5));
					l2 = (T17x2228263(ac, l1));
				}
				t2 = (T1)(l6==EIF_VOID);
				if (t2) {
					l7 = T113c25(ac, l4);
					T216f9(ac, ((T52*)(C))->a6, l7);
				} else {
					((T52*)(C))->a10 = l6;
					T61x5586963T0(ac, l4, C);
				}
			} else {
				T61x5586963T0(ac, l4, C);
			}
		}
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
	}
	t2 = (T170f9(ac, a1));
	t2 = ((T1)(!(t2)));
	if (t2) {
		T170f24(ac, a1);
	}
}

/* AP_DISPLAY_HELP_FLAG.record_occurrence */
void T213f26(TC* ac, T0* C, T0* a1)
{
	T213f27(ac, C, a1);
}

/* AP_DISPLAY_HELP_FLAG.display_help */
void T213f27(TC* ac, T0* C, T0* a1)
{
	T0* t1;
	T0* t2;
	t1 = (((T52*)(a1))->a6);
	t2 = (T213f17(ac, C, a1));
	T216f11(ac, t1, t2);
	t1 = (T213s18(ac));
	T36s2(ac, (T6)(GE_int32(0)));
}

/* AP_DISPLAY_HELP_FLAG.exceptions */
T0* T213s18(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[37]) {
		if (ac->thread_onces->reference_exception[37]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[37]);
		}
		return ac->thread_onces->reference_value[37];
	} else {
		ac->thread_onces->reference_status[37] = '\1';
		ac->thread_onces->reference_value[37] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[37] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T36c1(ac);
	ac->thread_onces->reference_value[37] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* AP_ERROR_HANDLER.report_info_message */
void T216f11(TC* ac, T0* C, T0* a1)
{
	T161f9(ac, ((T216*)(C))->a4, a1);
}

/* AP_DISPLAY_HELP_FLAG.full_help_text */
T0* T213f17(TC* ac, T0* C, T0* a1)
{
	T0* R = 0;
	R = (T52f35(ac, a1));
	return R;
}

/* AP_PARSER.full_help_text */
T0* T52f35(TC* ac, T0* C)
{
	T0* R = 0;
	T6 volatile l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T1 l5 = 0;
	T1 t1;
	T0* t2;
	T6 volatile t3;
	T6 t4;
	l3 = T2186c3(ac);
	l4 = T2187c2(ac, l3);
	R = (T52f23(ac, C));
	t1 = (T17f15(ac, ((T52*)(C))->a7));
	t1 = ((T1)(!(t1)));
	if (t1) {
		T17f50(ac, R, ge332ov5439511);
		t2 = (T52f12(ac, C));
		T211f10(ac, t2, (T6)(GE_int32(0)));
		t2 = (T52f12(ac, C));
		t2 = (T211f5(ac, t2, ((T52*)(C))->a7));
		T17f50(ac, R, t2);
		T17f50(ac, R, ge332ov5439512);
	}
	T17f50(ac, R, ge332ov5439513);
	l2 = (T52f25(ac, C));
	T2187f3(ac, l4, l2);
	l1 = (T6)(GE_int32(0));
	T214f19(ac, l2);
	while (1) {
		t1 = (T214f9(ac, l2));
		if (t1) {
			break;
		}
		t2 = (T214f7(ac, l2));
		t1 = (T61x5586955(ac, t2));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t2 = (T214f7(ac, l2));
			t2 = (T61x5586949(ac, t2));
			t3 = (((T17*)(t2))->a2);
			l1 = (T6f16(ac, &t3, l1));
		}
		T214f20(ac, l2);
	}
	l1 = (T6f17(ac, (&l1), (T6)(GE_int32(25))));
	T214f19(ac, l2);
	while (1) {
		t1 = (T214f9(ac, l2));
		if (t1) {
			break;
		}
		t2 = (T214f7(ac, l2));
		t1 = (T61x5586955(ac, t2));
		t1 = ((T1)(!(t1)));
		if (t1) {
			if (l5) {
				T17f52(ac, R, (T2)('\n'));
			}
			t2 = (T214f7(ac, l2));
			t4 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t2 = (T52f40(ac, C, t2, t4));
			T17f50(ac, R, t2);
			l5 = EIF_TRUE;
		}
		T214f20(ac, l2);
	}
	return R;
}

/* AP_PARSER.option_help_text */
T0* T52f40(TC* ac, T0* C, T0* a1, T6 a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* t1;
	T6 t2;
	T1 t3;
	T0* t4;
	T0* t5;
	t1 = (T52f12(ac, C));
	T211f10(ac, t1, a2);
	t1 = (T61x5586949(ac, a1));
	t2 = (((T17*)(t1))->a2);
	t3 = (T6f15(ac, &a2, t2));
	if (t3) {
		l1 = T17c60(ac, (T2)(' '), a2);
		t1 = (T61x5586949(ac, a1));
		t1 = (T17f5(ac, t1, GE_ms8("\n", 1)));
		t4 = (T52f12(ac, C));
		t5 = (T61x5586945(ac, a1));
		t5 = (T17f5(ac, l1, t5));
		t4 = (T211f5(ac, t4, t5));
		R = (T17f5(ac, t1, t4));
	} else {
		t1 = (T61x5586949(ac, a1));
		t2 = (((T17*)(t1))->a2);
		t2 = ((T6)((a2)-(t2)));
		l1 = T17c60(ac, (T2)(' '), t2);
		t1 = (T52f12(ac, C));
		t4 = (T61x5586949(ac, a1));
		t4 = (T17f5(ac, t4, l1));
		t5 = (T61x5586945(ac, a1));
		t4 = (T17f5(ac, t4, t5));
		R = (T211f5(ac, t1, t4));
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.description */
T0* T213f1(TC* ac, T0* C)
{
	T0* R = 0;
	R = ((T213*)(C))->a1;
	return R;
}

/* AP_INTEGER_OPTION.description */
T0* T59f3(TC* ac, T0* C)
{
	T0* R = 0;
	R = ((T59*)(C))->a3;
	return R;
}

/* AP_BOOLEAN_OPTION.description */
T0* T58f3(TC* ac, T0* C)
{
	T0* R = 0;
	R = ((T58*)(C))->a3;
	return R;
}

/* AP_ENUMERATION_OPTION.description */
T0* T57f3(TC* ac, T0* C)
{
	T0* R = 0;
	R = ((T57*)(C))->a3;
	return R;
}

/* AP_FLAG.description */
T0* T46f2(TC* ac, T0* C)
{
	T0* R = 0;
	R = ((T46*)(C))->a2;
	return R;
}

/* AP_STRING_OPTION.description */
T0* T54f3(TC* ac, T0* C)
{
	T0* R = 0;
	R = ((T54*)(C))->a3;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.names */
T0* T213f19(TC* ac, T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* m1 = 0;
	T2 volatile t1;
	T1 t2;
	if (((T213*)(C))->a3) {
		t1 = (T2)('-');
		l1 = (T2f4(ac, &t1));
		T17f52(ac, l1, ((T213*)(C))->a2);
	}
	t2 = (((T213*)(C))->a4?((m1 = ((T213*)(C))->a4, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = (T1)(l1==EIF_VOID);
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f50(ac, l1, GE_ms8(", ", 2));
		}
		T17f52(ac, l1, (T2)('-'));
		T17f52(ac, l1, (T2)('-'));
		T17f50(ac, l1, m1);
	}
	t2 = (T1)(l1!=EIF_VOID);
	if (!(t2)) {
		GE_raise_with_message(GE_EX_CHECK, "has_short_or_long");
	}
	R = l1;
	return R;
}

/* AP_INTEGER_OPTION.names */
T0* T59f21(TC* ac, T0* C)
{
	T0* R = 0;
	T1 t1;
	T2 volatile t2;
	T0* t3;
	R = (T59f21p1(ac, C));
	t1 = (T59f22(ac, C));
	if (t1) {
		t1 = ((T1)(!(((T59*)(C))->a5)));
		if (t1) {
			T17f52(ac, R, (T2)('['));
		}
		t2 = (T2)('=');
		t3 = (T2f4(ac, &t2));
		T17f50(ac, R, t3);
		T17f50(ac, R, ((T59*)(C))->a4);
		t1 = ((T1)(!(((T59*)(C))->a5)));
		if (t1) {
			T17f52(ac, R, (T2)(']'));
		}
	} else {
		T17f52(ac, R, (T2)(' '));
		T17f50(ac, R, ((T59*)(C))->a4);
	}
	return R;
}

/* AP_INTEGER_OPTION.has_long_form */
T1 T59f22(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T1)(((T59*)(C))->a6!=EIF_VOID);
	return R;
}

/* AP_INTEGER_OPTION.names */
T0* T59f21p1(TC* ac, T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* m1 = 0;
	T2 volatile t1;
	T1 t2;
	if (((T59*)(C))->a11) {
		t1 = (T2)('-');
		l1 = (T2f4(ac, &t1));
		T17f52(ac, l1, ((T59*)(C))->a7);
	}
	t2 = (((T59*)(C))->a6?((m1 = ((T59*)(C))->a6, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = (T1)(l1==EIF_VOID);
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f50(ac, l1, GE_ms8(", ", 2));
		}
		T17f52(ac, l1, (T2)('-'));
		T17f52(ac, l1, (T2)('-'));
		T17f50(ac, l1, m1);
	}
	t2 = (T1)(l1!=EIF_VOID);
	if (!(t2)) {
		GE_raise_with_message(GE_EX_CHECK, "has_short_or_long");
	}
	R = l1;
	return R;
}

/* AP_BOOLEAN_OPTION.names */
T0* T58f24(TC* ac, T0* C)
{
	T0* R = 0;
	T1 t1;
	T2 volatile t2;
	T0* t3;
	R = (T58f24p1(ac, C));
	t1 = (T58f25(ac, C));
	if (t1) {
		t1 = ((T1)(!(((T58*)(C))->a5)));
		if (t1) {
			T17f52(ac, R, (T2)('['));
		}
		t2 = (T2)('=');
		t3 = (T2f4(ac, &t2));
		T17f50(ac, R, t3);
		T17f50(ac, R, ((T58*)(C))->a4);
		t1 = ((T1)(!(((T58*)(C))->a5)));
		if (t1) {
			T17f52(ac, R, (T2)(']'));
		}
	} else {
		T17f52(ac, R, (T2)(' '));
		T17f50(ac, R, ((T58*)(C))->a4);
	}
	return R;
}

/* AP_BOOLEAN_OPTION.has_long_form */
T1 T58f25(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T1)(((T58*)(C))->a6!=EIF_VOID);
	return R;
}

/* AP_BOOLEAN_OPTION.names */
T0* T58f24p1(TC* ac, T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* m1 = 0;
	T2 volatile t1;
	T1 t2;
	if (((T58*)(C))->a10) {
		t1 = (T2)('-');
		l1 = (T2f4(ac, &t1));
		T17f52(ac, l1, ((T58*)(C))->a11);
	}
	t2 = (((T58*)(C))->a6?((m1 = ((T58*)(C))->a6, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = (T1)(l1==EIF_VOID);
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f50(ac, l1, GE_ms8(", ", 2));
		}
		T17f52(ac, l1, (T2)('-'));
		T17f52(ac, l1, (T2)('-'));
		T17f50(ac, l1, m1);
	}
	t2 = (T1)(l1!=EIF_VOID);
	if (!(t2)) {
		GE_raise_with_message(GE_EX_CHECK, "has_short_or_long");
	}
	R = l1;
	return R;
}

/* AP_ENUMERATION_OPTION.names */
T0* T57f23(TC* ac, T0* C)
{
	T0* R = 0;
	T1 t1;
	T2 volatile t2;
	T0* t3;
	R = (T57f23p1(ac, C));
	t1 = (T57f24(ac, C));
	if (t1) {
		t1 = ((T1)(!(((T57*)(C))->a6)));
		if (t1) {
			T17f52(ac, R, (T2)('['));
		}
		t2 = (T2)('=');
		t3 = (T2f4(ac, &t2));
		T17f50(ac, R, t3);
		T17f50(ac, R, ((T57*)(C))->a5);
		t1 = ((T1)(!(((T57*)(C))->a6)));
		if (t1) {
			T17f52(ac, R, (T2)(']'));
		}
	} else {
		T17f52(ac, R, (T2)(' '));
		T17f50(ac, R, ((T57*)(C))->a5);
	}
	return R;
}

/* AP_ENUMERATION_OPTION.has_long_form */
T1 T57f24(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T1)(((T57*)(C))->a7!=EIF_VOID);
	return R;
}

/* AP_ENUMERATION_OPTION.names */
T0* T57f23p1(TC* ac, T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* m1 = 0;
	T2 volatile t1;
	T1 t2;
	if (((T57*)(C))->a11) {
		t1 = (T2)('-');
		l1 = (T2f4(ac, &t1));
		T17f52(ac, l1, ((T57*)(C))->a12);
	}
	t2 = (((T57*)(C))->a7?((m1 = ((T57*)(C))->a7, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = (T1)(l1==EIF_VOID);
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f50(ac, l1, GE_ms8(", ", 2));
		}
		T17f52(ac, l1, (T2)('-'));
		T17f52(ac, l1, (T2)('-'));
		T17f50(ac, l1, m1);
	}
	t2 = (T1)(l1!=EIF_VOID);
	if (!(t2)) {
		GE_raise_with_message(GE_EX_CHECK, "has_short_or_long");
	}
	R = l1;
	return R;
}

/* AP_FLAG.names */
T0* T46f16(TC* ac, T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* m1 = 0;
	T2 volatile t1;
	T1 t2;
	if (((T46*)(C))->a5) {
		t1 = (T2)('-');
		l1 = (T2f4(ac, &t1));
		T17f52(ac, l1, ((T46*)(C))->a4);
	}
	t2 = (((T46*)(C))->a3?((m1 = ((T46*)(C))->a3, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = (T1)(l1==EIF_VOID);
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f50(ac, l1, GE_ms8(", ", 2));
		}
		T17f52(ac, l1, (T2)('-'));
		T17f52(ac, l1, (T2)('-'));
		T17f50(ac, l1, m1);
	}
	t2 = (T1)(l1!=EIF_VOID);
	if (!(t2)) {
		GE_raise_with_message(GE_EX_CHECK, "has_short_or_long");
	}
	R = l1;
	return R;
}

/* AP_STRING_OPTION.names */
T0* T54f22(TC* ac, T0* C)
{
	T0* R = 0;
	T1 t1;
	T2 volatile t2;
	T0* t3;
	R = (T54f22p1(ac, C));
	t1 = (T54f23(ac, C));
	if (t1) {
		t1 = ((T1)(!(((T54*)(C))->a6)));
		if (t1) {
			T17f52(ac, R, (T2)('['));
		}
		t2 = (T2)('=');
		t3 = (T2f4(ac, &t2));
		T17f50(ac, R, t3);
		T17f50(ac, R, ((T54*)(C))->a4);
		t1 = ((T1)(!(((T54*)(C))->a6)));
		if (t1) {
			T17f52(ac, R, (T2)(']'));
		}
	} else {
		T17f52(ac, R, (T2)(' '));
		T17f50(ac, R, ((T54*)(C))->a4);
	}
	return R;
}

/* AP_STRING_OPTION.has_long_form */
T1 T54f23(TC* ac, T0* C)
{
	T1 R = 0;
	R = (T1)(((T54*)(C))->a7!=EIF_VOID);
	return R;
}

/* AP_STRING_OPTION.names */
T0* T54f22p1(TC* ac, T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* m1 = 0;
	T2 volatile t1;
	T1 t2;
	if (((T54*)(C))->a11) {
		t1 = (T2)('-');
		l1 = (T2f4(ac, &t1));
		T17f52(ac, l1, ((T54*)(C))->a12);
	}
	t2 = (((T54*)(C))->a7?((m1 = ((T54*)(C))->a7, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = (T1)(l1==EIF_VOID);
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f50(ac, l1, GE_ms8(", ", 2));
		}
		T17f52(ac, l1, (T2)('-'));
		T17f52(ac, l1, (T2)('-'));
		T17f50(ac, l1, m1);
	}
	t2 = (T1)(l1!=EIF_VOID);
	if (!(t2)) {
		GE_raise_with_message(GE_EX_CHECK, "has_short_or_long");
	}
	R = l1;
	return R;
}

/* DS_QUICK_SORTER [AP_OPTION].sort */
void T2187f3(TC* ac, T0* C, T0* a1)
{
	T2187f4(ac, C, a1, ((T2187*)(C))->a1);
}

/* DS_QUICK_SORTER [AP_OPTION].sort_with_comparator */
void T2187f4(TC* ac, T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T6 t2;
	t1 = (T214f15(ac, a1));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (((T214*)(a1))->a2);
		T2187f5(ac, C, a1, a2, (T6)(GE_int32(1)), t2);
	}
}

/* DS_QUICK_SORTER [AP_OPTION].subsort_with_comparator */
void T2187f5(TC* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4)
{
	T6 volatile l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T6 l9 = 0;
	T6 l10 = 0;
	T0* l11 = 0;
	T0* l12 = 0;
	T6 volatile t1;
	T1 t2;
	T0* t3;
	T1 t4;
	T6 t5;
	t1 = ((T6)((a4)-(a3)));
	l5 = ((T6)((t1)+((T6)(GE_int32(1)))));
	while (1) {
		t2 = (T1)((l5) == ((T6)(GE_int32(0))));
		if (t2) {
			break;
		}
		l5 = ((T6)((l5)/((T6)(GE_int32(2)))));
		l4 = ((T6)((l4)+((T6)(GE_int32(1)))));
	}
	l4 = ((T6)((l4)+((T6)(GE_int32(10)))));
	l11 = T953c10(ac, (T6)(GE_int32(0)), (T6)(GE_int32(1)), l4);
	l12 = T953c10(ac, (T6)(GE_int32(0)), (T6)(GE_int32(1)), l4);
	T953f12(ac, l11, a3, (T6)(GE_int32(1)));
	T953f12(ac, l12, a4, (T6)(GE_int32(1)));
	l4 = (T6)(GE_int32(1));
	while (1) {
		t2 = (T1)((l4) == ((T6)(GE_int32(0))));
		if (t2) {
			break;
		}
		l9 = (T953f4(ac, l11, l4));
		l10 = (T953f4(ac, l12, l4));
		l4 = ((T6)((l4)-((T6)(GE_int32(1)))));
		l1 = l9;
		l2 = l10;
		t2 = ((T1)((l1)<(l2)));
		if (t2) {
			t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t2 = (T1)((l2) == (t1));
			if (t2) {
				l7 = (T214f16(ac, a1, l1));
				l8 = (T214f16(ac, a1, l2));
				t2 = (T2186f1(ac, a2, l8, l7));
				if (t2) {
					T214f27(ac, a1, l7, l2);
					T214f27(ac, a1, l8, l1);
				}
			} else {
				t1 = ((T6)((l1)+(l2)));
				l3 = ((T6)((t1)/((T6)(GE_int32(2)))));
				l6 = (T214f16(ac, a1, l3));
				t3 = (T214f16(ac, a1, l10));
				T214f27(ac, a1, t3, l3);
				while (1) {
					t2 = (T6f14(ac, (&l1), l2));
					if (t2) {
						break;
					}
					while (1) {
						t2 = (T6f14(ac, (&l1), l2));
						if (!(t2)) {
							t3 = (T214f16(ac, a1, l1));
							t4 = (T2186f1(ac, a2, t3, l6));
							t2 = ((T1)(!(t4)));
						}
						if (t2) {
							break;
						}
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					}
					l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
					while (1) {
						t2 = (T6f15(ac, (&l2), l1));
						if (!(t2)) {
							t3 = (T214f16(ac, a1, l2));
							t4 = (T2186f1(ac, a2, l6, t3));
							t2 = ((T1)(!(t4)));
						}
						if (t2) {
							break;
						}
						l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
					}
					t2 = ((T1)((l1)<(l2)));
					if (t2) {
						T214f28(ac, a1, l1, l2);
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					}
				}
				t3 = (T214f16(ac, a1, l1));
				T214f27(ac, a1, t3, l10);
				T214f27(ac, a1, l6, l1);
				t1 = ((T6)((l1)-((T6)(GE_int32(1)))));
				t2 = (T6f4(ac, &t1, l9));
				if (t2) {
					l4 = ((T6)((l4)+((T6)(GE_int32(1)))));
					T953f14(ac, l11, l9, l4);
					t5 = ((T6)((l1)-((T6)(GE_int32(1)))));
					T953f14(ac, l12, t5, l4);
				}
				t5 = ((T6)((l1)+((T6)(GE_int32(1)))));
				t2 = ((T1)((t5)<(l10)));
				if (t2) {
					l4 = ((T6)((l4)+((T6)(GE_int32(1)))));
					t5 = ((T6)((l1)+((T6)(GE_int32(1)))));
					T953f14(ac, l11, t5, l4);
					T953f14(ac, l12, l10, l4);
				}
			}
		}
	}
}

/* ARRAY [INTEGER_32].force */
void T953f14(TC* ac, T0* C, T6 a1, T6 a2)
{
	T6 l1 = 0;
	T6 volatile l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T6 volatile l6 = 0;
	T1 l7 = 0;
	T6 t1;
	T1 t2;
	T6 t3;
	T0* t4;
	T6 t5;
	l3 = (T6f17(ac, &(((T953*)(C))->a2), a2));
	l4 = (T6f16(ac, &(((T953*)(C))->a3), a2));
	t1 = ((T6)((l4)-(l3)));
	l2 = ((T6)((t1)+((T6)(GE_int32(1)))));
	t1 = ((T6)((((T953*)(C))->a3)+((T6)(GE_int32(1)))));
	t2 = (T1)((a2) == (t1));
	if (!(t2)) {
		t1 = ((T6)((((T953*)(C))->a2)-((T6)(GE_int32(1)))));
		l7 = (T1)((a2) == (t1));
	} else {
		l7 = EIF_TRUE;
	}
	t2 = (T953f5(ac, C));
	if (t2) {
		t1 = (T953f6(ac, C));
		t1 = (T6f16(ac, (&l2), t1));
		T953f15(ac, C, t1);
		t2 = ((T1)((l3)<(((T953*)(C))->a2)));
		if (t2) {
			T154f13(ac, ((T953*)(C))->a1, a1);
			t2 = ((T1)(!(l7)));
			if (t2) {
				t1 = ((T6)0);
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				T154f12(ac, ((T953*)(C))->a1, t1, (T6)(GE_int32(1)), t3);
			}
		} else {
			t2 = ((T1)(!(l7)));
			if (t2) {
				t1 = ((T6)0);
				t3 = ((T6)((l2)-((T6)(GE_int32(2)))));
				T154f12(ac, ((T953*)(C))->a1, t1, (T6)(GE_int32(0)), t3);
			}
			T154f13(ac, ((T953*)(C))->a1, a1);
		}
	} else {
		l1 = (((T154*)(((T953*)(C))->a1))->a1);
		t2 = (T6f4(ac, (&l2), l1));
		if (t2) {
			t1 = (T953f6(ac, C));
			t1 = ((T6)((l1)+(t1)));
			t1 = (T6f16(ac, (&l2), t1));
			t4 = (T154f4(ac, ((T953*)(C))->a1, t1));
			T953f16(ac, C, t4);
		}
		t2 = ((T1)((l3)<(((T953*)(C))->a2)));
		if (t2) {
			l6 = ((T6)((((T953*)(C))->a2)-(l3)));
			l5 = (T953f7(ac, C));
			t2 = ((T1)(!(l7)));
			if (t2) {
				t2 = (T6f4(ac, (&l6), l5));
			}
			if (t2) {
				t1 = ((T6)0);
				t3 = ((T6)((l6)-((T6)(GE_int32(1)))));
				T154f12(ac, ((T953*)(C))->a1, t1, l5, t3);
			}
			T154f16(ac, ((T953*)(C))->a1, (T6)(GE_int32(0)), l6, l5);
			t2 = ((T1)(!(l7)));
			if (t2) {
				t1 = ((T6)0);
				t3 = ((T6)((l6)-((T6)(GE_int32(1)))));
				T154f12(ac, ((T953*)(C))->a1, t1, (T6)(GE_int32(1)), t3);
			}
			((T154*)(((T953*)(C))->a1))->z2[(T6)(GE_int32(0))] = (a1);
		} else {
			t1 = (((T154*)(((T953*)(C))->a1))->a2);
			t2 = (T6f4(ac, (&l2), t1));
			if (t2) {
				t2 = ((T1)(!(l7)));
				if (t2) {
					t1 = ((T6)0);
					t3 = (((T154*)(((T953*)(C))->a1))->a2);
					t5 = ((T6)((l2)-((T6)(GE_int32(2)))));
					T154f12(ac, ((T953*)(C))->a1, t1, t3, t5);
				}
				T154f13(ac, ((T953*)(C))->a1, a1);
			} else {
				t1 = ((T6)((a2)-(((T953*)(C))->a2)));
				((T154*)(((T953*)(C))->a1))->z2[t1] = (a1);
			}
		}
	}
	((T953*)(C))->a2 = l3;
	((T953*)(C))->a3 = l4;
}

/* SPECIAL [INTEGER_32].move_data */
void T154f16(TC* ac, T0* C, T6 a1, T6 a2, T6 a3)
{
	T1 t1;
	T6 t2;
	t1 = (T1)((a1) == (a2));
	if (t1) {
	} else {
		t1 = (T6f4(ac, &a1, a2));
		if (t1) {
			t2 = ((T6)((a2)+(a3)));
			t1 = ((T1)((t2)<(a1)));
			if (t1) {
				T154f18(ac, C, a1, a2, a3);
			} else {
				T154f19(ac, C, a1, a2, a3);
			}
		} else {
			t2 = ((T6)((a1)+(a3)));
			t1 = ((T1)((t2)<(a2)));
			if (t1) {
				T154f18(ac, C, a1, a2, a3);
			} else {
				T154f19(ac, C, a1, a2, a3);
			}
		}
	}
}

/* SPECIAL [INTEGER_32].overlapping_move */
void T154f19(TC* ac, T0* C, T6 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T6 volatile t2;
	T6 t3;
	T6 t4;
	t1 = ((T1)((a1)<(a2)));
	if (t1) {
		t2 = ((T6)((a1)+(a3)));
		l1 = ((T6)((t2)-((T6)(GE_int32(1)))));
		l2 = ((T6)((a1)-((T6)(GE_int32(1)))));
		l3 = ((T6)((a2)-(a1)));
		t2 = ((T6)((a2)+(a3)));
		t1 = (T6f14(ac, &t2, ((T154*)(C))->a2));
		if (t1) {
			t3 = (((T154*)(C))->z2[a1]);
			t4 = ((T6)((a2)+(a3)));
			t4 = ((T6)((t4)-((T6)(GE_int32(1)))));
			T154f12(ac, C, t3, ((T154*)(C))->a2, t4);
		}
		while (1) {
			t1 = (T1)((l1) == (l2));
			if (t1) {
				break;
			}
			t3 = (((T154*)(C))->z2[l1]);
			t4 = ((T6)((l1)+(l3)));
			((T154*)(C))->z2[t4] = (t3);
			l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
		}
	} else {
		l1 = a1;
		l2 = ((T6)((a1)+(a3)));
		l3 = ((T6)((a1)-(a2)));
		while (1) {
			t1 = (T1)((l1) == (l2));
			if (t1) {
				break;
			}
			t3 = (((T154*)(C))->z2[l1]);
			t4 = ((T6)((l1)-(l3)));
			T154f11(ac, C, t3, t4);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
}

/* SPECIAL [INTEGER_32].force */
void T154f11(TC* ac, T0* C, T6 a1, T6 a2)
{
	T1 t1;
	t1 = ((T1)((a2)<(((T154*)(C))->a2)));
	if (t1) {
		((T154*)(C))->z2[a2] = (a1);
	} else {
		T154f13(ac, C, a1);
	}
}

/* SPECIAL [INTEGER_32].non_overlapping_move */
void T154f18(TC* ac, T0* C, T6 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T6 t2;
	T6 t3;
	l1 = a1;
	l2 = ((T6)((a1)+(a3)));
	l3 = ((T6)((a2)-(a1)));
	while (1) {
		t1 = (T1)((l1) == (l2));
		if (t1) {
			break;
		}
		t2 = (((T154*)(C))->z2[l1]);
		t3 = ((T6)((l1)+(l3)));
		T154f11(ac, C, t2, t3);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
}

/* ARRAY [INTEGER_32].capacity */
T6 T953f7(TC* ac, T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = ((T6)((((T953*)(C))->a3)-(((T953*)(C))->a2)));
	R = ((T6)((t1)+((T6)(GE_int32(1)))));
	return R;
}

/* ARRAY [INTEGER_32].set_area */
void T953f16(TC* ac, T0* C, T0* a1)
{
	((T953*)(C))->a1 = a1;
}

/* SPECIAL [INTEGER_32].aliased_resized_area */
T0* T154f4(TC* ac, T0* C, T6 a1)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	{
	t1 = ((T154*)(C))->a1;
	if (a1 == t1) {
		R = C;
	} else {
		R = GE_new154(ac, a1, EIF_TRUE);
		t1 = ((T154*)(C))->a2;
		((T154*)(R))->a2 = ((t1 < a1)?t1:a1);
		t2 = ((T154*)(C))->a2;
		t1 = ((T154*)(R))->a2;
		if (t2 > t1) {
			t2 = t1;
		}
		if (t2 > 0) {
			memcpy((void*)(((T154*)(R))->z2), (void*)(((T154*)(C))->z2), t2 * sizeof(T6));
		}
	}
	}
	return R;
}

/* ARRAY [INTEGER_32].make_empty_area */
void T953f15(TC* ac, T0* C, T6 a1)
{
	((T953*)(C))->a1 = T154c8(ac, a1);
}

/* ARRAY [INTEGER_32].additional_space */
T6 T953f6(TC* ac, T0* C)
{
	T6 R = 0;
	T6 volatile t1;
	t1 = (T953f7(ac, C));
	t1 = ((T6)((t1)/((T6)(GE_int32(2)))));
	R = (T6f16(ac, &t1, (T6)(GE_int32(5))));
	return R;
}

/* ARRAY [INTEGER_32].empty_area */
T1 T953f5(TC* ac, T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (((T154*)(((T953*)(C))->a1))->a1);
	R = (T1)((t1) == ((T6)(GE_int32(0))));
	return R;
}

/* DS_ARRAYED_LIST [AP_OPTION].swap */
void T214f28(TC* ac, T0* C, T6 a1, T6 a2)
{
	T0* l1 = 0;
	T0* t1;
	l1 = (T214f16(ac, C, a1));
	t1 = (T214f16(ac, C, a2));
	T214f27(ac, C, t1, a1);
	T214f27(ac, C, l1, a2);
}

/* DS_ARRAYED_LIST [AP_OPTION].replace */
void T214f27(TC* ac, T0* C, T0* a1, T6 a2)
{
	T6 t1;
	t1 = ((T6)((a2)-((T6)(GE_int32(1)))));
	((T1107*)(((T214*)(C))->a4))->z2[t1] = (a1);
}

/* AP_OPTION_COMPARATOR.less_than */
T1 T2186f1(TC* ac, T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* m1 = 0;
	T0* m2 = 0;
	T0* t1;
	T1 t2;
	T2 volatile t3;
	T2 volatile t4;
	T6 t5;
	t1 = (T61x5586947(ac, a1));
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		l1 = m1;
	} else {
		t3 = (T61x5586952(ac, a1));
		l1 = (T2f4(ac, &t3));
	}
	t1 = (T61x5586947(ac, a2));
	t2 = (t1?((m2 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		l2 = m2;
	} else {
		t4 = (T61x5586952(ac, a2));
		l2 = (T2f4(ac, &t4));
	}
	t1 = (T2186s2(ac));
	t5 = (T108s20(ac, l1, l2));
	R = (T1)((t5) == ((T6)(GE_int32(-1))));
	return R;
}

/* KL_STRING_ROUTINES.three_way_comparison */
T6 T108s20(TC* ac, T0* a1, T0* a2)
{
	T6 R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T10 l5 = 0;
	T10 l6 = 0;
	T1 l7 = 0;
	T0* m1 = 0;
	T0* m2 = 0;
	T1 t1;
	T6 t2;
	t1 = (T1)(a2==a1);
	if (t1) {
		R = (T6)(GE_int32(0));
	} else {
		t1 = (a1?((m1 = a1, T108s20ot1(ac, a1))):EIF_FALSE);
		if (t1) {
			R = (((((T0*)(m1))->id==919)?T919f70(ac, m1, a2):T1078f70(ac, m1, a2)));
		} else {
			t1 = (a2?((m2 = a2, T108s20ot2(ac, a2))):EIF_FALSE);
			if (t1) {
				t2 = (((((T0*)(m2))->id==919)?T919f70(ac, m2, a1):T1078f70(ac, m2, a1)));
				R = ((T6)(-(t2)));
			} else {
				l3 = (T41x2228263(ac, a1));
				l4 = (T41x2228263(ac, a2));
				t1 = ((T1)((l3)<(l4)));
				if (t1) {
					l2 = l3;
				} else {
					l2 = l4;
				}
				l1 = (T6)(GE_int32(1));
				while (1) {
					t1 = (T6f4(ac, (&l1), l2));
					if (t1) {
						break;
					}
					l5 = (T41x2228225T6(ac, a1, l1));
					l6 = (T41x2228225T6(ac, a2, l1));
					t1 = (T1)((l5) == (l6));
					if (t1) {
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					} else {
						t1 = ((T1)((l5)<(l6)));
						if (t1) {
							l7 = EIF_TRUE;
							R = (T6)(GE_int32(-1));
							l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
						} else {
							l7 = EIF_TRUE;
							R = (T6)(GE_int32(1));
							l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					}
				}
				t1 = ((T1)(!(l7)));
				if (t1) {
					t1 = ((T1)((l3)<(l4)));
					if (t1) {
						R = (T6)(GE_int32(-1));
					} else {
						t1 = (T1)(!(T1)((l3) == (l4)));
						if (t1) {
							R = (T6)(GE_int32(1));
						}
					}
				}
			}
		}
	}
	return R;
}

T1 T108s20ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

T1 T108s20ot2(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* UC_UTF8_STRING.three_way_unicode_comparison */
T6 T1078f70(TC* ac, T0* C, T0* a1)
{
	T6 R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 volatile l5 = 0;
	T2 l6 = 0;
	T10 l7 = 0;
	T10 l8 = 0;
	T1 l9 = 0;
	T0* m1 = 0;
	T1 t1;
	t1 = (T1)(a1==C);
	if (t1) {
		R = (T6)(GE_int32(0));
	} else {
		t1 = ((T1)(((T0*)(a1))->id == 1078));
		if (t1) {
			t1 = (a1?((m1 = a1, T1078f70ot1(ac, a1))):EIF_FALSE);
		}
		if (t1) {
			l3 = ((T1078*)(C))->a3;
			l4 = (((((T0*)(m1))->id==919)?((T919*)(m1))->a3:((T1078*)(m1))->a3));
			t1 = ((T1)((l3)<(l4)));
			if (t1) {
				l2 = l3;
			} else {
				l2 = l4;
			}
			l1 = (T6)(GE_int32(1));
			while (1) {
				t1 = (T6f4(ac, (&l1), l2));
				if (t1) {
					break;
				}
				l5 = (T1078f16(ac, C, l1));
				l6 = (((((T0*)(m1))->id==919)?T919f36(ac, m1, l1):T1078f16(ac, m1, l1)));
				t1 = (T1)((l5) == (l6));
				if (t1) {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T2f15(ac, (&l5), l6));
					if (t1) {
						l9 = EIF_TRUE;
						R = (T6)(GE_int32(-1));
						l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
					} else {
						l9 = EIF_TRUE;
						R = (T6)(GE_int32(1));
						l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
					}
				}
			}
			t1 = ((T1)(!(l9)));
			if (t1) {
				t1 = ((T1)((l3)<(l4)));
				if (t1) {
					R = (T6)(GE_int32(-1));
				} else {
					t1 = (T1)(!(T1)((l3) == (l4)));
					if (t1) {
						R = (T6)(GE_int32(1));
					}
				}
			}
		} else {
			l3 = ((T1078*)(C))->a1;
			l4 = (T41x2228263(ac, a1));
			t1 = ((T1)((l3)<(l4)));
			if (t1) {
				l2 = l3;
			} else {
				l2 = l4;
			}
			l1 = (T6)(GE_int32(1));
			while (1) {
				t1 = (T6f4(ac, (&l1), l2));
				if (t1) {
					break;
				}
				l7 = (T1078f48(ac, C, l1));
				l8 = (T41x2228225T6(ac, a1, l1));
				t1 = (T1)((l7) == (l8));
				if (t1) {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				} else {
					t1 = ((T1)((l7)<(l8)));
					if (t1) {
						l9 = EIF_TRUE;
						R = (T6)(GE_int32(-1));
						l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
					} else {
						l9 = EIF_TRUE;
						R = (T6)(GE_int32(1));
						l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
					}
				}
			}
			t1 = ((T1)(!(l9)));
			if (t1) {
				t1 = ((T1)((l3)<(l4)));
				if (t1) {
					R = (T6)(GE_int32(-1));
				} else {
					t1 = (T1)(!(T1)((l3) == (l4)));
					if (t1) {
						R = (T6)(GE_int32(1));
					}
				}
			}
		}
	}
	return R;
}

T1 T1078f70ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* UC_STRING.three_way_unicode_comparison */
T6 T919f70(TC* ac, T0* C, T0* a1)
{
	T6 R = 0;
	T6 volatile l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 volatile l5 = 0;
	T2 l6 = 0;
	T10 l7 = 0;
	T10 l8 = 0;
	T1 l9 = 0;
	T0* m1 = 0;
	T1 t1;
	t1 = (T1)(a1==C);
	if (t1) {
		R = (T6)(GE_int32(0));
	} else {
		t1 = ((T1)(((T0*)(a1))->id == 919));
		if (t1) {
			t1 = (a1?((m1 = a1, T919f70ot1(ac, a1))):EIF_FALSE);
		}
		if (t1) {
			l3 = ((T919*)(C))->a3;
			l4 = (((((T0*)(m1))->id==919)?((T919*)(m1))->a3:((T1078*)(m1))->a3));
			t1 = ((T1)((l3)<(l4)));
			if (t1) {
				l2 = l3;
			} else {
				l2 = l4;
			}
			l1 = (T6)(GE_int32(1));
			while (1) {
				t1 = (T6f4(ac, (&l1), l2));
				if (t1) {
					break;
				}
				l5 = (T919f36(ac, C, l1));
				l6 = (((((T0*)(m1))->id==919)?T919f36(ac, m1, l1):T1078f16(ac, m1, l1)));
				t1 = (T1)((l5) == (l6));
				if (t1) {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T2f15(ac, (&l5), l6));
					if (t1) {
						l9 = EIF_TRUE;
						R = (T6)(GE_int32(-1));
						l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
					} else {
						l9 = EIF_TRUE;
						R = (T6)(GE_int32(1));
						l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
					}
				}
			}
			t1 = ((T1)(!(l9)));
			if (t1) {
				t1 = ((T1)((l3)<(l4)));
				if (t1) {
					R = (T6)(GE_int32(-1));
				} else {
					t1 = (T1)(!(T1)((l3) == (l4)));
					if (t1) {
						R = (T6)(GE_int32(1));
					}
				}
			}
		} else {
			l3 = ((T919*)(C))->a1;
			l4 = (T41x2228263(ac, a1));
			t1 = ((T1)((l3)<(l4)));
			if (t1) {
				l2 = l3;
			} else {
				l2 = l4;
			}
			l1 = (T6)(GE_int32(1));
			while (1) {
				t1 = (T6f4(ac, (&l1), l2));
				if (t1) {
					break;
				}
				l7 = (T919f10(ac, C, l1));
				l8 = (T41x2228225T6(ac, a1, l1));
				t1 = (T1)((l7) == (l8));
				if (t1) {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				} else {
					t1 = ((T1)((l7)<(l8)));
					if (t1) {
						l9 = EIF_TRUE;
						R = (T6)(GE_int32(-1));
						l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
					} else {
						l9 = EIF_TRUE;
						R = (T6)(GE_int32(1));
						l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
					}
				}
			}
			t1 = ((T1)(!(l9)));
			if (t1) {
				t1 = ((T1)((l3)<(l4)));
				if (t1) {
					R = (T6)(GE_int32(-1));
				} else {
					t1 = (T1)(!(T1)((l3) == (l4)));
					if (t1) {
						R = (T6)(GE_int32(1));
					}
				}
			}
		}
	}
	return R;
}

T1 T919f70ot1(TC* ac, T0* a1)
{
	switch (((T0*)(a1))->id) {
	case 17:
		return EIF_FALSE;
	default:
		return EIF_TRUE;
	}
}

/* AP_OPTION_COMPARATOR.string_ */
T0* T2186s2(TC* ac)
{
	GE_rescue r;
	volatile uint32_t tr = ac->in_rescue;
	T0* R = 0;
	if (ac->thread_onces->reference_status[1]) {
		if (ac->thread_onces->reference_exception[1]) {
			GE_raise_once_exception(ac, ac->thread_onces->reference_exception[1]);
		}
		return ac->thread_onces->reference_value[1];
	} else {
		ac->thread_onces->reference_status[1] = '\1';
		ac->thread_onces->reference_value[1] = R;
	}
	r.previous = ac->last_rescue;
	ac->last_rescue = &r;
	if (GE_setjmp(r.jb) != 0) {
		ac->last_rescue = &r;
		ac->in_rescue = tr + 1;
		ac->thread_onces->reference_exception[1] = GE_last_exception_raised(ac);
		ac->last_rescue = r.previous;
		GE_jump_to_last_rescue(ac);
	}
	R = T108c22(ac);
	ac->thread_onces->reference_value[1] = R;
	ac->last_rescue = r.previous;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.long_form */
T0* T213f4(TC* ac, T0* C)
{
	T0* R = 0;
	R = ((T213*)(C))->a4;
	return R;
}

/* AP_INTEGER_OPTION.long_form */
T0* T59f6(TC* ac, T0* C)
{
	T0* R = 0;
	R = ((T59*)(C))->a6;
	return R;
}

/* AP_BOOLEAN_OPTION.long_form */
T0* T58f6(TC* ac, T0* C)
{
	T0* R = 0;
	R = ((T58*)(C))->a6;
	return R;
}

/* AP_ENUMERATION_OPTION.long_form */
T0* T57f7(TC* ac, T0* C)
{
	T0* R = 0;
	R = ((T57*)(C))->a7;
	return R;
}

/* AP_FLAG.long_form */
T0* T46f3(TC* ac, T0* C)
{
	T0* R = 0;
	R = ((T46*)(C))->a3;
	return R;
}

/* AP_STRING_OPTION.long_form */
T0* T54f7(TC* ac, T0* C)
{
	T0* R = 0;
	R = ((T54*)(C))->a7;
	return R;
}

/* DS_ARRAYED_LIST [AP_OPTION].item */
T0* T214f16(TC* ac, T0* C, T6 a1)
{
	T0* R = 0;
	T6 t1;
	t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
	R = (((T1107*)(((T214*)(C))->a4))->z2[t1]);
	return R;
}

/* ARRAY [INTEGER_32].item */
T6 T953f4(TC* ac, T0* C, T6 a1)
{
	T6 R = 0;
	T6 t1;
	t1 = ((T6)((a1)-(((T953*)(C))->a2)));
	R = (((T154*)(((T953*)(C))->a1))->z2[t1]);
	return R;
}

/* ARRAY [INTEGER_32].put */
void T953f12(TC* ac, T0* C, T6 a1, T6 a2)
{
	T6 t1;
	t1 = ((T6)((a2)-(((T953*)(C))->a2)));
	((T154*)(((T953*)(C))->a1))->z2[t1] = (a1);
}

/* ARRAY [INTEGER_32].make_filled */
T0* T953c10(TC* ac, T6 a1, T6 a2, T6 a3)
{
	T0* C;
	T6 l1 = 0;
	T1 t1;
	T6 t2;
	C = GE_new953(ac, EIF_TRUE);
	((T953*)(C))->a2 = a2;
	((T953*)(C))->a3 = a3;
	t1 = (T6f15(ac, &a2, a3));
	if (t1) {
		t2 = ((T6)((a3)-(a2)));
		l1 = ((T6)((t2)+((T6)(GE_int32(1)))));
	}
	T953f13(ac, C, a1, l1);
	return C;
}

/* ARRAY [INTEGER_32].make_filled_area */
void T953f13(TC* ac, T0* C, T6 a1, T6 a2)
{
	((T953*)(C))->a1 = T154c9(ac, a1, a2);
}

/* AP_PARSER.all_options */
T0* T52f25(TC* ac, T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	R = T214c17(ac, (T6)(GE_int32(0)));
	T214f19(ac, ((T52*)(C))->a1);
	while (1) {
		t1 = (T214f9(ac, ((T52*)(C))->a1));
		if (t1) {
			break;
		}
		t2 = (T214f7(ac, ((T52*)(C))->a1));
		t1 = (T214f8(ac, R, t2));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t2 = (T214f7(ac, ((T52*)(C))->a1));
			T214f18(ac, R, t2);
		}
		T214f20(ac, ((T52*)(C))->a1);
	}
	T215f16(ac, ((T52*)(C))->a2);
	while (1) {
		t1 = (T215f7(ac, ((T52*)(C))->a2));
		if (t1) {
			break;
		}
		l1 = (T215f6(ac, ((T52*)(C))->a2));
		t2 = (((T53*)(l1))->a4);
		t1 = (T214f8(ac, R, t2));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t2 = (((T53*)(l1))->a4);
			T214f18(ac, R, t2);
		}
		T53f19(ac, l1);
		while (1) {
			t1 = (T53f8(ac, l1));
			if (t1) {
				break;
			}
			t2 = (T53f9(ac, l1));
			t1 = (T214f8(ac, R, t2));
			t1 = ((T1)(!(t1)));
			if (t1) {
				t2 = (T53f9(ac, l1));
				T214f18(ac, R, t2);
			}
			T53f20(ac, l1);
		}
		T215f17(ac, ((T52*)(C))->a2);
	}
	return R;
}

/* DS_ARRAYED_LIST [AP_OPTION].has */
T1 T214f8(TC* ac, T0* C, T0* a1)
{
	T1 R = 0;
	T6 l1 = 0;
	T0* m1 = 0;
	T1 t1;
	T0* t2;
	l1 = ((T6)((((T214*)(C))->a2)-((T6)(GE_int32(1)))));
	t1 = EIF_FALSE;
	if (t1) {
		while (1) {
			t1 = ((T1)((l1)<((T6)(GE_int32(0)))));
			if (t1) {
				break;
			}
			t2 = (((T1107*)(((T214*)(C))->a4))->z2[l1]);
			t1 = ((m1, t2, a1, (T1)0));
			if (t1) {
				R = EIF_TRUE;
				l1 = (T6)(GE_int32(-1));
			} else {
				l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
			}
		}
	} else {
		while (1) {
			t1 = ((T1)((l1)<((T6)(GE_int32(0)))));
			if (t1) {
				break;
			}
			t2 = (((T1107*)(((T214*)(C))->a4))->z2[l1]);
			t1 = (T1)(t2==a1);
			if (t1) {
				R = EIF_TRUE;
				l1 = (T6)(GE_int32(-1));
			} else {
				l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
			}
		}
	}
	return R;
}

/* DS_ARRAYED_LIST [AP_OPTION].make */
T0* T214c17(TC* ac, T6 a1)
{
	T0* C;
	T0* t1;
	C = GE_new214(ac, EIF_TRUE);
	((T214*)(C))->a5 = T1108c3(ac);
	((T214*)(C))->a4 = (T1108s1(ac, a1));
	((T214*)(C))->a6 = a1;
	t1 = (T214f12(ac, C));
	T214f21(ac, C, t1);
	return C;
}

/* DS_ARRAYED_LIST [AP_OPTION].set_internal_cursor */
void T214f21(TC* ac, T0* C, T0* a1)
{
	((T214*)(C))->a1 = a1;
}

/* DS_ARRAYED_LIST [AP_OPTION].new_cursor */
T0* T214f12(TC* ac, T0* C)
{
	T0* R = 0;
	R = T1105c8(ac, C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [AP_OPTION].make */
T0* T1105c8(TC* ac, T0* a1)
{
	T0* C;
	C = GE_new1105(ac, EIF_TRUE);
	((T1105*)(C))->a3 = a1;
	((T1105*)(C))->a1 = (T6)(GE_int32(-1));
	return C;
}

/* KL_SPECIAL_ROUTINES [AP_OPTION].make */
T0* T1108s1(TC* ac, T6 a1)
{
	T0* R = 0;
	R = T1107c5(ac, a1);
	return R;
}

/* SPECIAL [AP_OPTION].make_empty */
T0* T1107c5(TC* ac, T6 a1)
{
	T0* C;
	C = GE_new1107(ac, a1, EIF_TRUE);
	{
	}
	return C;
}

/* KL_SPECIAL_ROUTINES [AP_OPTION].default_create */
T0* T1108c3(TC* ac)
{
	T0* C;
	C = GE_new1108(ac, EIF_TRUE);
	return C;
}

/* DS_QUICK_SORTER [AP_OPTION].make */
T0* T2187c2(TC* ac, T0* a1)
{
	T0* C;
	C = GE_new2187(ac, EIF_TRUE);
	((T2187*)(C))->a1 = a1;
	return C;
}

/* AP_OPTION_COMPARATOR.default_create */
T0* T2186c3(TC* ac)
{
	T0* C;
	C = GE_new2186(ac, EIF_TRUE);
	return C;
}

/* AP_INTEGER_OPTION.record_occurrence */
void T59f29(TC* ac, T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* m1 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	t1 = (((T52*)(a1))->a10);
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	t2 = ((T1)(!(t2)));
	if (t2) {
		T229f10(ac, ((T59*)(C))->a1, ((T59*)(C))->a2);
	} else {
		t2 = (T17x2228255(ac, m1));
		if (t2) {
			t3 = (T17x2228289(ac, m1));
			T229f10(ac, ((T59*)(C))->a1, t3);
		} else {
			l1 = T113c21(ac, C, m1);
			t1 = (((T52*)(a1))->a6);
			T216f9(ac, t1, l1);
			T229f10(ac, ((T59*)(C))->a1, (T6)(GE_int32(0)));
		}
	}
}

/* AP_ERROR.make_invalid_parameter_error */
T0* T113c21(TC* ac, T0* a1, T0* a2)
{
	T0* C;
	T0* t1;
	C = GE_new113(ac, EIF_TRUE);
	((T113*)(C))->a1 = T34c7(ac, ge725ov11878406, (T6)(GE_int32(1)), (T6)(GE_int32(2)));
	t1 = (T61x5586948(ac, a1));
	T34f8(ac, ((T113*)(C))->a1, t1, (T6)(GE_int32(1)));
	T34f8(ac, ((T113*)(C))->a1, a2, (T6)(GE_int32(2)));
	((T113*)(C))->a2 = ge337ov5521410;
	((T113*)(C))->a3 = ge337ov5521417;
	return C;
}

/* DS_LINKED_LIST [INTEGER_32].force_last */
void T229f10(TC* ac, T0* C, T6 a1)
{
	T0* l1 = 0;
	T0* m1 = 0;
	T1 t1;
	t1 = (((T229*)(C))->a2?((m1 = ((T229*)(C))->a2, EIF_TRUE)):EIF_FALSE);
	if (t1) {
	} else {
	}