#include "gepp.h"

#ifdef __cplusplus
extern "C" {
#endif

T0* GE_boxed1(T1 a1)
{
	T0* R;
	R = (T0*)GE_alloc(sizeof(Tb1));
	((T0*)(R))->id = 1;
	((Tb1*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed2(T2 a1)
{
	T0* R;
	R = (T0*)GE_alloc(sizeof(Tb2));
	((T0*)(R))->id = 2;
	((Tb2*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed3(T3 a1)
{
	T0* R;
	R = (T0*)GE_alloc(sizeof(Tb3));
	((T0*)(R))->id = 3;
	((Tb3*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed4(T4 a1)
{
	T0* R;
	R = (T0*)GE_alloc(sizeof(Tb4));
	((T0*)(R))->id = 4;
	((Tb4*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed5(T5 a1)
{
	T0* R;
	R = (T0*)GE_alloc(sizeof(Tb5));
	((T0*)(R))->id = 5;
	((Tb5*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed6(T6 a1)
{
	T0* R;
	R = (T0*)GE_alloc(sizeof(Tb6));
	((T0*)(R))->id = 6;
	((Tb6*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed7(T7 a1)
{
	T0* R;
	R = (T0*)GE_alloc(sizeof(Tb7));
	((T0*)(R))->id = 7;
	((Tb7*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed8(T8 a1)
{
	T0* R;
	R = (T0*)GE_alloc(sizeof(Tb8));
	((T0*)(R))->id = 8;
	((Tb8*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed9(T9 a1)
{
	T0* R;
	R = (T0*)GE_alloc(sizeof(Tb9));
	((T0*)(R))->id = 9;
	((Tb9*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed10(T10 a1)
{
	T0* R;
	R = (T0*)GE_alloc(sizeof(Tb10));
	((T0*)(R))->id = 10;
	((Tb10*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed11(T11 a1)
{
	T0* R;
	R = (T0*)GE_alloc(sizeof(Tb11));
	((T0*)(R))->id = 11;
	((Tb11*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed12(T12 a1)
{
	T0* R;
	R = (T0*)GE_alloc(sizeof(Tb12));
	((T0*)(R))->id = 12;
	((Tb12*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed13(T13 a1)
{
	T0* R;
	R = (T0*)GE_alloc(sizeof(Tb13));
	((T0*)(R))->id = 13;
	((Tb13*)(R))->z1 = a1;
	return R;
}

T0* GE_boxed14(T14 a1)
{
	T0* R;
	R = (T0*)GE_alloc(sizeof(Tb14));
	((T0*)(R))->id = 14;
	((Tb14*)(R))->z1 = a1;
	return R;
}

T1 GE_default1 = 0;
T2 GE_default2 = 0;
T3 GE_default3 = 0;
T4 GE_default4 = 0;
T5 GE_default5 = 0;
T6 GE_default6 = 0;
T7 GE_default7 = 0;
T8 GE_default8 = 0;
T9 GE_default9 = 0;
T10 GE_default10 = 0;
T11 GE_default11 = 0;
T12 GE_default12 = 0;
T13 GE_default13 = 0;
T14 GE_default14 = 0;
T15 GE_default15 = {15,0,{0}};
T17 GE_default17 = {17,0,0,0};
T21 GE_default21 = {21,0,0,0,0};
T22 GE_default22 = {22,0};
T23 GE_default23 = {23,0,0,0};
T24 GE_default24 = {24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
T25 GE_default25 = {25};
T26 GE_default26 = {26};
T27 GE_default27 = {27,0,0,0,0,0,0,0,0};
T28 GE_default28 = {28,0,0,0,0,0};
T30 GE_default30 = {30};
T31 GE_default31 = {31,0,0,0};
T32 GE_default32 = {32,0,0,0,0,0,0};
T34 GE_default34 = {34,0};
T36 GE_default36 = {36,0};
T37 GE_default37 = {37,0};
T38 GE_default38 = {38,0};
T39 GE_default39 = {39,0,0,0};
T40 GE_default40 = {40,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
T41 GE_default41 = {41,0,0,0,0};
T42 GE_default42 = {42,0,0,0,0};
T43 GE_default43 = {43,0,0,0,0,0,0,0,0,0,0,0,0};
T44 GE_default44 = {44,0,0,0,0,0,0,0,0,0};
T45 GE_default45 = {45,0,{0}};
T46 GE_default46 = {46};
T48 GE_default48 = {48,0,{0}};
T49 GE_default49 = {49};
T50 GE_default50 = {50,0,{0}};
T51 GE_default51 = {51};
T52 GE_default52 = {52,0,{0}};
T53 GE_default53 = {53};
T54 GE_default54 = {54,0};
T55 GE_default55 = {55,0};
T56 GE_default56 = {56,0};
T57 GE_default57 = {57};
T58 GE_default58 = {58};
T61 GE_default61 = {61,0};
T62 GE_default62 = {62,0,0,0};
T64 GE_default64 = {64,0,0,0};
T65 GE_default65 = {65,0,0,0};
T66 GE_default66 = {66,0,0};
T67 GE_default67 = {67};
T68 GE_default68 = {68,0};
T69 GE_default69 = {69};
T70 GE_default70 = {70,0,0,0};
T72 GE_default72 = {72,0,0,0};
T73 GE_default73 = {73,0,{0}};
T74 GE_default74 = {74};
T75 GE_default75 = {75,0};
T76 GE_default76 = {76,0};
T77 GE_default77 = {77,0};
T78 GE_default78 = {78,0};
T79 GE_default79 = {79};
T81 GE_default81 = {81};
T83 GE_default83 = {83,0,0,0,0,0,0,0,0,0,0};
T85 GE_default85 = {85,0,0};
T86 GE_default86 = {86,0};
T88 GE_default88 = {88,0,0,0,0,0,0};
T89 GE_default89 = {89,0,0};
T90 GE_default90 = {90,0};
T91 GE_default91 = {91,0,0};
T92 GE_default92 = {92,0,0,0,0};
T94 GE_default94 = {94,0,{0}};
T95 GE_default95 = {95,0,0,0};
T96 GE_default96 = {96,0,{0}};
T97 GE_default97 = {97};
T98 GE_default98 = {98,0};
T99 GE_default99 = {99};

T0* GE_ms(char* s, T6 c)
{
	T0* R;
	T0* t1;
	t1 = (T0*)GE_alloc(sizeof(T15)+c*sizeof(T2));
	((T0*)(t1))->id = 15;
	((T15*)(t1))->z1 = (c+1);
	memcpy(((T15*)(t1))->z2, s, c);
	R = (T0*)GE_alloc(sizeof(T17));
	((T0*)(R))->id = 17;
	((T17*)(R))->a1 = t1;
	((T17*)(R))->a2 = (T6)c;
	return R;
}

/* Call to UT_ERROR.default_message */
T0* T35x3619(T0* C)
{
	int t1 = ((T0*)(C))->id;
if (t1<=38) {
if (t1<=36) {
if (t1==34) {
	return (T34f2(C));
} else {
	return (T36f2(C));
}
} else {
if (t1==37) {
	return (T37f2(C));
} else {
	return (T38f2(C));
}
}
} else {
if (t1<=55) {
if (t1==54) {
	return (T54f5(C));
} else {
	return (T55f5(C));
}
} else {
	return (T56f5(C));
}
}
}

/* GEPP.execute */
T0* T21c10(void)
{
	T0* C;
	T0* t1;
	C = (T0*)GE_alloc(sizeof(T21));
	*(T21*)C = GE_default21;
	if (EIF_FALSE) {
		T21f11(C);
	}
	t1 = (T21f5(C));
	T22f5(GE_void(t1), GE_ms("gepp", 4));
	((T21*)(C))->a1 = T23c6();
	((T21*)(C))->a2 = T24c172(((T21*)(C))->a1);
	((T21*)(C))->a3 = GE_ms("-", 1);
	((T21*)(C))->a4 = GE_ms("-", 1);
	T21f12(C);
	T21f13(C);
	return C;
}

/* GEPP.preprocess */
void T21f13(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	T0* t2;
	T1 t3;
	t1 = (T17f9(GE_void(((T21*)(C))->a4), GE_ms("-", 1)));
	t1 = ((T1)(!(t1)));
	if (t1) {
		l2 = T28c24(((T21*)(C))->a4);
		T28f25(GE_void(l2));
		t1 = (T28f18(GE_void(l2)));
		if (t1) {
			T24f176(GE_void(((T21*)(C))->a2), l2);
		} else {
			T21f17(C, ((T21*)(C))->a4);
			t2 = (T21f6(C));
			T26f2(GE_void(t2), (T6)(GE_int32(1)));
		}
	} else {
		t2 = (T21f7(C));
		t2 = (T30f1(GE_void(t2)));
		T24f176(GE_void(((T21*)(C))->a2), t2);
	}
	t1 = (T17f9(GE_void(((T21*)(C))->a3), GE_ms("-", 1)));
	if (t1) {
		t2 = (T21f7(C));
		t2 = (T30f2(GE_void(t2)));
		T24f177(GE_void(((T21*)(C))->a2), t2);
	} else {
		l1 = T27c36(((T21*)(C))->a3);
		T27f37(GE_void(l1));
		t1 = (T27f10(GE_void(l1)));
		if (t1) {
			T24f177(GE_void(((T21*)(C))->a2), l1);
			T27f38(GE_void(l1));
		} else {
			T21f18(C, ((T21*)(C))->a3);
			t2 = (T21f6(C));
			T26f2(GE_void(t2), (T6)(GE_int32(1)));
		}
	}
	t1 = (T24f99(GE_void(((T21*)(C))->a2)));
	if (t1) {
		t2 = (T21f6(C));
		T26f2(GE_void(t2), (T6)(GE_int32(1)));
	}
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t3 = (T28f11(GE_void(l2)));
		t1 = ((T1)(!(t3)));
	}
	if (t1) {
		T28f26(GE_void(l2));
	}
}

/* KL_TEXT_OUTPUT_FILE.close */
void T28f26(T0* C)
{
	GE_rescue r;
	T1 l1 = 0;
	T1 t1;
	if (GE_setjmp(r.jb) != 0) {
		t1 = ((T1)(!(l1)));
		if (t1) {
			l1 = EIF_TRUE;
			goto GE_retry;
		}
		GE_raise(8);
	}
GE_retry:
	r.previous = GE_last_rescue;
	GE_last_rescue = &r;
	t1 = ((T1)(!(l1)));
	if (t1) {
		T28f32(C);
	}
	GE_last_rescue = r.previous;
}

/* KL_TEXT_OUTPUT_FILE.old_close */
void T28f32(T0* C)
{
	T28f35(C, ((T28*)(C))->a4);
	((T28*)(C))->a1 = (T6)(GE_int32(0));
	((T28*)(C))->a5 = EIF_FALSE;
}

/* KL_TEXT_OUTPUT_FILE.file_close */
void T28f35(T0* C, T14 a1)
{
	file_close((FILE *)a1);
}

/* KL_TEXT_OUTPUT_FILE.is_closed */
T1 T28f11(T0* C)
{
	T1 R = 0;
	R = (T28f17(C));
	return R;
}

/* KL_TEXT_OUTPUT_FILE.old_is_closed */
T1 T28f17(T0* C)
{
	T1 R = 0;
	R = ((((T28*)(C))->a1)==((T6)(GE_int32(0))));
	return R;
}

/* GEPP_PARSER.syntax_error */
T1 T24f99(T0* C)
{
	T1 R = 0;
	R = ((((T24*)(C))->a1)==((T6)(GE_int32(102))));
	return R;
}

/* GEPP.report_cannot_read_error */
void T21f18(T0* C, T0* a1)
{
	T0* l1 = 0;
	l1 = T38c7(a1);
	T23f8(GE_void(((T21*)(C))->a1), l1);
}

/* UT_ERROR_HANDLER.report_error */
void T23f8(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T23f5(C, a1));
	T23f10(C, t1);
}

/* UT_ERROR_HANDLER.report_error_message */
void T23f10(T0* C, T0* a1)
{
	T39f10(GE_void(((T23*)(C))->a1), a1);
}

/* KL_STDERR_FILE.put_line */
void T39f10(T0* C, T0* a1)
{
	T39f12(C, a1);
	T39f13(C);
}

/* KL_STDERR_FILE.put_new_line */
void T39f13(T0* C)
{
	T39f12(C, ge403ov2942);
}

/* KL_STDERR_FILE.put_string */
void T39f12(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T39f6(C));
	l1 = (T58f1(GE_void(t1), a1));
	T39f16(C, l1);
}

/* KL_STDERR_FILE.old_put_string */
void T39f16(T0* C, T0* a1)
{
	T0* l1 = 0;
	T6 t1;
	T1 t2;
	T61 t3;
	T14 t4;
	t1 = (((T17*)(GE_void(a1)))->a2);
	t2 = ((t1)!=((T6)(GE_int32(0))));
	if (t2) {
		l1 = (((T17*)(GE_void(a1)))->a1);
		(t3).id = 61;
		(t3).a1 = ((l1?(T14)(GE_types[((T0*)(l1))->id].is_special?(T14)((T15*)(l1))->z2:(T14)l1):(T14)0));
		t4 = ((t3).a1);
		t1 = (((T17*)(GE_void(a1)))->a2);
		T39f17(C, ((T39*)(C))->a1, t4, t1);
	}
}

/* KL_STDERR_FILE.console_ps */
void T39f17(T0* C, T14 a1, T14 a2, T6 a3)
{
	console_ps((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
}

/* KL_STRING_ROUTINES.as_string */
T0* T58f1(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	t1 = (T58f5(C));
	t2 = (T81f1(GE_void(t1), a1, ge407ov4264));
	if (t2) {
		R = a1;
	} else {
		l1 = EIF_VOID;
		t2 = ((l1)!=(EIF_VOID));
		if (t2) {
			R = ((GE_void(l1), (T0*)0));
		} else {
			R = (T17f10(GE_void(a1)));
		}
	}
	return R;
}

/* STRING_8.string */
T0* T17f10(T0* C)
{
	T0* R = 0;
	R = T17c27(((T17*)(C))->a2);
	T17f34(GE_void(R), C);
	return R;
}

/* STRING_8.append */
void T17f34(T0* C, T0* a1)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	l2 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T6f1(&l2, (T6)(GE_int32(0))));
	if (t1) {
		l1 = ((T17*)(C))->a2;
		l3 = ((T6)((l2)+(l1)));
		t2 = (T17f17(C));
		t1 = (T6f1(&l3, t2));
		if (t1) {
			t2 = (T17f18(C));
			t2 = ((T6)((l3)+(t2)));
			T17f36(C, t2);
		}
		t3 = (((T17*)(GE_void(a1)))->a1);
		T15f8(GE_void(((T17*)(C))->a1), t3, (T6)(GE_int32(0)), l1, l2);
		((T17*)(C))->a2 = l3;
		((T17*)(C))->a3 = (T6)(GE_int32(0));
	}
}

/* SPECIAL [CHARACTER_8].copy_data */
void T15f8(T0* C, T0* a1, T6 a2, T6 a3, T6 a4)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T2 t2;
	t1 = ((a1)==(C));
	if (t1) {
		T15f10(C, a2, a3, a4);
	} else {
		l1 = a2;
		l2 = a3;
		l3 = ((T6)((a2)+(a4)));
		t1 = ((l1)==(l3));
		while (!(t1)) {
			t2 = (((T15*)(GE_void(a1)))->z2[l1]);
			((T15*)(C))->z2[l2] = (t2);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			t1 = ((l1)==(l3));
		}
	}
}

/* SPECIAL [CHARACTER_8].move_data */
void T15f10(T0* C, T6 a1, T6 a2, T6 a3)
{
	T1 t1;
	T6 t2;
	t1 = ((a1)==(a2));
	if (t1) {
	} else {
		t1 = (T6f1(&a1, a2));
		if (t1) {
			t2 = ((T6)((a2)+(a3)));
			t1 = ((T1)((t2)<(a1)));
			if (t1) {
				T15f11(C, a1, a2, a3);
			} else {
				T15f12(C, a1, a2, a3);
			}
		} else {
			t2 = ((T6)((a1)+(a3)));
			t1 = ((T1)((t2)<(a2)));
			if (t1) {
				T15f11(C, a1, a2, a3);
			} else {
				T15f12(C, a1, a2, a3);
			}
		}
	}
}

/* SPECIAL [CHARACTER_8].overlapping_move */
void T15f12(T0* C, T6 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T6 t2;
	T2 t3;
	t1 = ((T1)((a1)<(a2)));
	if (t1) {
		t2 = ((T6)((a1)+(a3)));
		l1 = ((T6)((t2)-((T6)(GE_int32(1)))));
		l2 = ((T6)((a1)-((T6)(GE_int32(1)))));
		l3 = ((T6)((a2)-(a1)));
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t3 = (((T15*)(C))->z2[l1]);
			t2 = ((T6)((l1)+(l3)));
			((T15*)(C))->z2[t2] = (t3);
			l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
			t1 = ((l1)==(l2));
		}
	} else {
		l1 = a1;
		l2 = ((T6)((a1)+(a3)));
		l3 = ((T6)((a1)-(a2)));
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t3 = (((T15*)(C))->z2[l1]);
			t2 = ((T6)((l1)-(l3)));
			((T15*)(C))->z2[t2] = (t3);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t1 = ((l1)==(l2));
		}
	}
}

/* SPECIAL [CHARACTER_8].non_overlapping_move */
void T15f11(T0* C, T6 a1, T6 a2, T6 a3)
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
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T15*)(C))->z2[l1]);
		t3 = ((T6)((l1)+(l3)));
		((T15*)(C))->z2[t3] = (t2);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t1 = ((l1)==(l2));
	}
}

/* STRING_8.resize */
void T17f36(T0* C, T6 a1)
{
	T6 l1 = 0;
	T1 t1;
	T6 t2;
	l1 = (((T15*)(GE_void(((T17*)(C))->a1)))->z1);
	t1 = (T6f2(&a1, l1));
	if (t1) {
		t2 = ((T6)((a1)+((T6)(GE_int32(1)))));
		((T17*)(C))->a1 = (T15f4(GE_void(((T17*)(C))->a1), t2));
	}
}

/* SPECIAL [CHARACTER_8].aliased_resized_area */
T0* T15f4(T0* C, T6 a1)
{
	T0* R = 0;
	T6 t1;
	t1 = ((T15*)(C))->z1;
	if (a1>t1) {
		R = (T0*)GE_alloc(sizeof(T15)+a1*sizeof(T2));
		*(T15*)(R) = *(T15*)(C);
		memcpy(((T15*)(R))->z2,((T15*)(C))->z2,t1*sizeof(T2));
	} else {
		R = C;
	}
	((T15*)(R))->z1 = a1;
	return R;
}

/* INTEGER_32.infix ">=" */
T1 T6f2(T6* C, T6 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((T1)((*C)<(a1)));
	R = ((T1)(!(t1)));
	return R;
}

/* STRING_8.additional_space */
T6 T17f18(T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = (T17f17(C));
	t1 = ((T6)((t1)/((T6)(GE_int32(2)))));
	R = (T6f15(&t1, (T6)(GE_int32(5))));
	return R;
}

/* INTEGER_32.max */
T6 T6f15(T6* C, T6 a1)
{
	T6 R = 0;
	T1 t1;
	t1 = (T6f2(C, a1));
	if (t1) {
		R = *C;
	} else {
		R = a1;
	}
	return R;
}

/* STRING_8.capacity */
T6 T17f17(T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = (((T15*)(GE_void(((T17*)(C))->a1)))->z1);
	R = ((T6)((t1)-((T6)(GE_int32(1)))));
	return R;
}

/* INTEGER_32.infix ">" */
T1 T6f1(T6* C, T6 a1)
{
	T1 R = 0;
	R = ((T1)((a1)<(*C)));
	return R;
}

/* STRING_8.make */
T0* T17c27(T6 a1)
{
	T0* C;
	T6 t1;
	C = (T0*)GE_alloc(sizeof(T17));
	*(T17*)C = GE_default17;
	((T17*)(C))->a2 = (T6)(GE_int32(0));
	((T17*)(C))->a3 = (T6)(GE_int32(0));
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	T17f29(C, t1);
	return C;
}

/* STRING_8.make_area */
void T17f29(T0* C, T6 a1)
{
	((T17*)(C))->a1 = T15c9(a1);
}

/* SPECIAL [CHARACTER_8].make */
T0* T15c9(T6 a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T15)+a1*sizeof(T2));
	*(T15*)C = GE_default15;
	((T15*)(C))->z1 = a1;
	return C;
}

/* KL_ANY_ROUTINES.same_types */
T1 T81f1(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = ((T1)(((T0*)(GE_void(a2)))->id==17));
	return R;
}

/* KL_STRING_ROUTINES.any_ */
unsigned char ge265os2070 = '\0';
T0* ge265ov2070;
T0* T58f5(T0* C)
{
	T0* R = 0;
	if (ge265os2070) {
		return ge265ov2070;
	} else {
		ge265os2070 = '\1';
	}
	R = T81c3();
	ge265ov2070 = R;
	return R;
}

/* KL_ANY_ROUTINES.default_create */
T0* T81c3(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T81));
	*(T81*)C = GE_default81;
	return C;
}

/* KL_STDERR_FILE.string_ */
unsigned char ge273os1776 = '\0';
T0* ge273ov1776;
T0* T39f6(T0* C)
{
	T0* R = 0;
	if (ge273os1776) {
		return ge273ov1776;
	} else {
		ge273os1776 = '\1';
	}
	R = T58c11();
	ge273ov1776 = R;
	return R;
}

/* KL_STRING_ROUTINES.default_create */
T0* T58c11(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T58));
	*(T58*)C = GE_default58;
	return C;
}

/* UT_ERROR_HANDLER.message */
T0* T23f5(T0* C, T0* a1)
{
	T0* R = 0;
	R = (T35x3619(GE_void(a1)));
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.make */
T0* T38c7(T0* a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T38));
	*(T38*)C = GE_default38;
	((T38*)(C))->a1 = T64c10((T6)(GE_int32(1)), (T6)(GE_int32(1)));
	T64f11(GE_void(((T38*)(C))->a1), a1, (T6)(GE_int32(1)));
	return C;
}

/* ARRAY [STRING_8].put */
void T64f11(T0* C, T0* a1, T6 a2)
{
	T6 t1;
	t1 = ((T6)((a2)-(((T64*)(C))->a2)));
	((T50*)(GE_void(((T64*)(C))->a1)))->z2[t1] = (a1);
}

/* ARRAY [STRING_8].make */
T0* T64c10(T6 a1, T6 a2)
{
	T0* C;
	T1 t1;
	T6 t2;
	C = (T0*)GE_alloc(sizeof(T64));
	*(T64*)C = GE_default64;
	((T64*)(C))->a2 = a1;
	((T64*)(C))->a3 = a2;
	t1 = (T6f6(&a1, a2));
	if (t1) {
		t2 = ((T6)((a2)-(a1)));
		t2 = ((T6)((t2)+((T6)(GE_int32(1)))));
		T64f12(C, t2);
	} else {
		T64f12(C, (T6)(GE_int32(0)));
	}
	return C;
}

/* ARRAY [STRING_8].make_area */
void T64f12(T0* C, T6 a1)
{
	((T64*)(C))->a1 = T50c5(a1);
}

/* SPECIAL [STRING_8].make */
T0* T50c5(T6 a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T50)+a1*sizeof(T0*));
	*(T50*)C = GE_default50;
	((T50*)(C))->z1 = a1;
	return C;
}

/* INTEGER_32.infix "<=" */
T1 T6f6(T6* C, T6 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((T1)((a1)<(*C)));
	R = ((T1)(!(t1)));
	return R;
}

/* KL_TEXT_INPUT_FILE.close */
void T27f38(T0* C)
{
	GE_rescue r;
	T1 l1 = 0;
	T1 t1;
	if (GE_setjmp(r.jb) != 0) {
		t1 = ((T1)(!(l1)));
		if (t1) {
			l1 = EIF_TRUE;
			goto GE_retry;
		}
		GE_raise(8);
	}
GE_retry:
	r.previous = GE_last_rescue;
	GE_last_rescue = &r;
	t1 = ((T1)(!(l1)));
	if (t1) {
		T27f41(C);
		((T27*)(C))->a4 = EIF_VOID;
	}
	GE_last_rescue = r.previous;
}

/* KL_TEXT_INPUT_FILE.old_close */
void T27f41(T0* C)
{
	T27f42(C, ((T27*)(C))->a6);
	((T27*)(C))->a1 = (T6)(GE_int32(0));
	((T27*)(C))->a7 = EIF_FALSE;
}

/* KL_TEXT_INPUT_FILE.file_close */
void T27f42(T0* C, T14 a1)
{
	file_close((FILE *)a1);
}

/* KL_TEXT_INPUT_FILE.is_open_read */
T1 T27f10(T0* C)
{
	T1 R = 0;
	R = (T27f19(C));
	return R;
}

/* KL_TEXT_INPUT_FILE.old_is_open_read */
T1 T27f19(T0* C)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T27*)(C))->a1)==((T6)(GE_int32(1))));
	if (!(t1)) {
		t1 = ((((T27*)(C))->a1)==((T6)(GE_int32(4))));
	}
	if (!(t1)) {
		R = ((((T27*)(C))->a1)==((T6)(GE_int32(5))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* KL_TEXT_INPUT_FILE.open_read */
void T27f37(T0* C)
{
	GE_rescue r;
	T1 l1 = 0;
	T1 t1;
	if (GE_setjmp(r.jb) != 0) {
		t1 = ((T1)(!(l1)));
		if (t1) {
			l1 = EIF_TRUE;
			goto GE_retry;
		}
		GE_raise(8);
	}
GE_retry:
	r.previous = GE_last_rescue;
	GE_last_rescue = &r;
	t1 = ((T1)(!(l1)));
	if (t1) {
		t1 = ((((T27*)(C))->a3)!=(ge380ov2218));
		if (t1) {
			((T27*)(C))->a4 = EIF_VOID;
			((T27*)(C))->a5 = EIF_FALSE;
			t1 = (T27f13(C));
			if (t1) {
				t1 = (T27f14(C));
			}
			if (t1) {
				T27f40(C);
			}
		}
	} else {
		t1 = (T27f15(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T27f38(C);
		}
	}
	GE_last_rescue = r.previous;
}

/* KL_TEXT_INPUT_FILE.is_closed */
T1 T27f15(T0* C)
{
	T1 R = 0;
	R = (T27f23(C));
	return R;
}

/* KL_TEXT_INPUT_FILE.old_is_closed */
T1 T27f23(T0* C)
{
	T1 R = 0;
	R = ((((T27*)(C))->a1)==((T6)(GE_int32(0))));
	return R;
}

/* KL_TEXT_INPUT_FILE.old_open_read */
void T27f40(T0* C)
{
	T14 t1;
	T1 t2;
	T27f40p1(C);
	t1 = (T27f18(C));
	t2 = ((((T27*)(C))->a6)==(t1));
	if (t2) {
		((T27*)(C))->a1 = (T6)(GE_int32(0));
		((T27*)(C))->a7 = EIF_FALSE;
	}
}

/* KL_TEXT_INPUT_FILE.default_pointer */
T14 T27f18(T0* C)
{
	T14 R = 0;
	return R;
}

/* KL_TEXT_INPUT_FILE.open_read */
void T27f40p1(T0* C)
{
	T0* l1 = 0;
	T61 t1;
	T14 t2;
	l1 = (T17f7(GE_void(((T27*)(C))->a3)));
	(t1).id = 61;
	(t1).a1 = ((l1?(T14)(GE_types[((T0*)(l1))->id].is_special?(T14)((T15*)(l1))->z2:(T14)l1):(T14)0));
	t2 = ((t1).a1);
	((T27*)(C))->a6 = (T27f20(C, t2, (T6)(GE_int32(0))));
	((T27*)(C))->a1 = (T6)(GE_int32(1));
}

/* KL_TEXT_INPUT_FILE.file_open */
T14 T27f20(T0* C, T14 a1, T6 a2)
{
	T14 R = 0;
	R = (T14)(EIF_POINTER )file_open((char *)a1,( int)a2);
	return R;
}

/* STRING_8.to_c */
T0* T17f7(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = ((T17*)(C))->a1;
	((T15*)(GE_void(l1)))->z2[((T17*)(C))->a2] = ((T2)('\000'));
	R = l1;
	return R;
}

/* KL_TEXT_INPUT_FILE.old_is_readable */
T1 T27f14(T0* C)
{
	T1 R = 0;
	T0* t1;
	T27f43(C);
	t1 = (T27f22(C));
	R = (T66f5(GE_void(t1)));
	return R;
}

/* UNIX_FILE_INFO.is_readable */
T1 T66f5(T0* C)
{
	T1 R = 0;
	T86 t1;
	T0* t2;
	T14 t3;
	(t1).id = 86;
	(t1).a1 = (((t2 = ((T66*)(C))->a1)?(T14)(GE_types[((T0*)(t2))->id].is_special?(T14)((T15*)(t2))->z2:(T14)((T66*)(C))->a1):(T14)0));
	t3 = ((t1).a1);
	R = (T66f3(C, t3, (T6)(GE_int32(0))));
	return R;
}

/* UNIX_FILE_INFO.file_eaccess */
T1 T66f3(T0* C, T14 a1, T6 a2)
{
	T1 R = 0;
	R = (T1)EIF_TEST((EIF_BOOLEAN )file_eaccess((struct stat *)a1,( int)a2));
	return R;
}

/* KL_TEXT_INPUT_FILE.buffered_file_info */
unsigned char ge524os2431 = '\0';
T0* ge524ov2431;
T0* T27f22(T0* C)
{
	T0* R = 0;
	if (ge524os2431) {
		return ge524ov2431;
	} else {
		ge524os2431 = '\1';
	}
	R = T66c6();
	ge524ov2431 = R;
	return R;
}

/* UNIX_FILE_INFO.make */
T0* T66c6(void)
{
	T0* C;
	T6 t1;
	C = (T0*)GE_alloc(sizeof(T66));
	*(T66*)C = GE_default66;
	t1 = (T66f4(C));
	T66f8(C, t1);
	return C;
}

/* UNIX_FILE_INFO.make_buffered_file_info */
void T66f8(T0* C, T6 a1)
{
	((T66*)(C))->a1 = T15c9(a1);
}

/* UNIX_FILE_INFO.stat_size */
T6 T66f4(T0* C)
{
	T6 R = 0;
	R = (T6)stat_size();
	return R;
}

/* KL_TEXT_INPUT_FILE.set_buffer */
void T27f43(T0* C)
{
	T0* t1;
	t1 = (T27f22(C));
	T66f7(GE_void(t1), ((T27*)(C))->a3);
}

/* UNIX_FILE_INFO.update */
void T66f7(T0* C, T0* a1)
{
	T0* l1 = 0;
	T61 t1;
	T14 t2;
	T86 t3;
	T0* t4;
	T14 t5;
	l1 = (T17f7(GE_void(a1)));
	(t1).id = 61;
	(t1).a1 = ((l1?(T14)(GE_types[((T0*)(l1))->id].is_special?(T14)((T15*)(l1))->z2:(T14)l1):(T14)0));
	t2 = ((t1).a1);
	(t3).id = 86;
	(t3).a1 = (((t4 = ((T66*)(C))->a1)?(T14)(GE_types[((T0*)(t4))->id].is_special?(T14)((T15*)(t4))->z2:(T14)((T66*)(C))->a1):(T14)0));
	t5 = ((t3).a1);
	T66f9(C, t2, t5);
	((T66*)(C))->a2 = a1;
}

/* UNIX_FILE_INFO.file_stat */
void T66f9(T0* C, T14 a1, T14 a2)
{
	file_stat((char *)a1,( struct stat *)a2);
}

/* KL_TEXT_INPUT_FILE.old_exists */
T1 T27f13(T0* C)
{
	T1 R = 0;
	T0* l1 = 0;
	T61 t1;
	T14 t2;
	l1 = (T17f7(GE_void(((T27*)(C))->a3)));
	(t1).id = 61;
	(t1).a1 = ((l1?(T14)(GE_types[((T0*)(l1))->id].is_special?(T14)((T15*)(l1))->z2:(T14)l1):(T14)0));
	t2 = ((t1).a1);
	R = (T27f21(C, t2));
	return R;
}

/* KL_TEXT_INPUT_FILE.file_exists */
T1 T27f21(T0* C, T14 a1)
{
	T1 R = 0;
	R = (T1)EIF_TEST((EIF_BOOLEAN )file_exists((char *)a1));
	return R;
}

/* KL_TEXT_INPUT_FILE.make */
T0* T27c36(T0* a1)
{
	T0* C;
	T6 t1;
	T1 t2;
	T0* t3;
	C = (T0*)GE_alloc(sizeof(T27));
	*(T27*)C = GE_default27;
	((T27*)(C))->a2 = a1;
	t1 = (((T17*)(GE_void(a1)))->a2);
	t2 = (T6f1(&t1, (T6)(GE_int32(0))));
	if (t2) {
		t3 = (T27f26(C));
		t3 = (T58f1(GE_void(t3), a1));
		T27f39(C, t3);
	} else {
		T27f39(C, ge380ov2218);
	}
	return C;
}

/* KL_TEXT_INPUT_FILE.old_make */
void T27f39(T0* C, T0* a1)
{
	((T27*)(C))->a3 = a1;
	((T27*)(C))->a1 = (T6)(GE_int32(0));
}

/* KL_TEXT_INPUT_FILE.string_ */
T0* T27f26(T0* C)
{
	T0* R = 0;
	if (ge273os1776) {
		return ge273ov1776;
	} else {
		ge273os1776 = '\1';
	}
	R = T58c11();
	ge273ov1776 = R;
	return R;
}

/* GEPP_PARSER.parse_file */
void T24f177(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T24f91(C, a1));
	T24f180(C, t1);
	T24f181(C);
	if (((T24*)(C))->a6) {
		T24f182(C, GE_ms("\n", 1));
	}
}

/* GEPP_PARSER.output */
void T24f182(T0* C, T0* a1)
{
	T6 l1 = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	t1 = (T24f106(C));
	t1 = ((T1)(!(t1)));
	if (t1) {
		l1 = (((T17*)(GE_void(a1)))->a2);
		t1 = (T6f1(&l1, (T6)(GE_int32(0))));
		if (t1) {
			t2 = (T17f5(GE_void(a1), l1));
			t1 = ((t2)==((T2)('\n')));
			if (t1) {
				l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
				t1 = (T6f1(&l1, (T6)(GE_int32(0))));
				if (t1) {
					t2 = (T17f5(GE_void(a1), l1));
					t1 = ((t2)==((T2)('\r')));
				}
				if (t1) {
					l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
				}
				t1 = (T6f1(&l1, (T6)(GE_int32(0))));
				if (t1) {
					t3 = (T17f6(GE_void(a1), (T6)(GE_int32(1)), l1));
					if (((T0*)(GE_void(((T24*)(C))->a8)))->id==28) {
						T28f27(((T24*)(C))->a8, t3);
					} else {
						T31f10(((T24*)(C))->a8, t3);
					}
				} else {
					if (((T0*)(GE_void(((T24*)(C))->a8)))->id==28) {
						T28f28(((T24*)(C))->a8);
					} else {
						T31f11(((T24*)(C))->a8);
					}
				}
			} else {
				if (((T0*)(GE_void(((T24*)(C))->a8)))->id==28) {
					T28f29(((T24*)(C))->a8, a1);
				} else {
					T31f12(((T24*)(C))->a8, a1);
				}
			}
		}
	} else {
		if (((T24*)(C))->a7) {
			if (((T0*)(GE_void(((T24*)(C))->a8)))->id==28) {
				T28f28(((T24*)(C))->a8);
			} else {
				T31f11(((T24*)(C))->a8);
			}
		}
	}
}

/* KL_STDOUT_FILE.put_string */
void T31f12(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T31f5(C));
	l1 = (T58f1(GE_void(t1), a1));
	T31f14(C, l1);
}

/* KL_STDOUT_FILE.old_put_string */
void T31f14(T0* C, T0* a1)
{
	T0* l1 = 0;
	T6 t1;
	T1 t2;
	T61 t3;
	T14 t4;
	t1 = (((T17*)(GE_void(a1)))->a2);
	t2 = ((t1)!=((T6)(GE_int32(0))));
	if (t2) {
		l1 = (((T17*)(GE_void(a1)))->a1);
		(t3).id = 61;
		(t3).a1 = ((l1?(T14)(GE_types[((T0*)(l1))->id].is_special?(T14)((T15*)(l1))->z2:(T14)l1):(T14)0));
		t4 = ((t3).a1);
		t1 = (((T17*)(GE_void(a1)))->a2);
		T31f17(C, ((T31*)(C))->a1, t4, t1);
	}
}

/* KL_STDOUT_FILE.console_ps */
void T31f17(T0* C, T14 a1, T14 a2, T6 a3)
{
	console_ps((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
}

/* KL_STDOUT_FILE.string_ */
T0* T31f5(T0* C)
{
	T0* R = 0;
	if (ge273os1776) {
		return ge273ov1776;
	} else {
		ge273os1776 = '\1';
	}
	R = T58c11();
	ge273ov1776 = R;
	return R;
}

/* KL_TEXT_OUTPUT_FILE.put_string */
void T28f29(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T28f12(C));
	t1 = (T58f1(GE_void(t1), a1));
	T28f33(C, t1);
}

/* KL_TEXT_OUTPUT_FILE.old_put_string */
void T28f33(T0* C, T0* a1)
{
	T0* l1 = 0;
	T6 t1;
	T1 t2;
	T61 t3;
	T14 t4;
	t1 = (((T17*)(GE_void(a1)))->a2);
	t2 = ((t1)!=((T6)(GE_int32(0))));
	if (t2) {
		l1 = (((T17*)(GE_void(a1)))->a1);
		(t3).id = 61;
		(t3).a1 = ((l1?(T14)(GE_types[((T0*)(l1))->id].is_special?(T14)((T15*)(l1))->z2:(T14)l1):(T14)0));
		t4 = ((t3).a1);
		t1 = (((T17*)(GE_void(a1)))->a2);
		T28f36(C, ((T28*)(C))->a4, t4, t1);
	}
}

/* KL_TEXT_OUTPUT_FILE.file_ps */
void T28f36(T0* C, T14 a1, T14 a2, T6 a3)
{
	file_ps((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
}

/* KL_TEXT_OUTPUT_FILE.string_ */
T0* T28f12(T0* C)
{
	T0* R = 0;
	if (ge273os1776) {
		return ge273ov1776;
	} else {
		ge273os1776 = '\1';
	}
	R = T58c11();
	ge273ov1776 = R;
	return R;
}

/* KL_STDOUT_FILE.put_new_line */
void T31f11(T0* C)
{
	T31f12(C, ge405ov2942);
}

/* KL_TEXT_OUTPUT_FILE.put_new_line */
void T28f28(T0* C)
{
	T28f29(C, ge410ov2942);
}

/* KL_STDOUT_FILE.put_line */
void T31f10(T0* C, T0* a1)
{
	T31f12(C, a1);
	T31f11(C);
}

/* KL_TEXT_OUTPUT_FILE.put_line */
void T28f27(T0* C, T0* a1)
{
	T28f29(C, a1);
	T28f28(C);
}

/* STRING_8.substring */
T0* T17f6(T0* C, T6 a1, T6 a2)
{
	T0* R = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	T6 t4;
	t1 = (T6)(GE_int32(1));
	t2 = (T6f6(&t1, a1));
	if (t2) {
		t2 = (T6f6(&a1, a2));
	}
	if (t2) {
		t2 = (T6f6(&a2, ((T17*)(C))->a2));
	}
	if (t2) {
		t1 = ((T6)((a2)-(a1)));
		t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
		R = (T17f8(C, t1));
		t3 = (((T17*)(GE_void(R)))->a1);
		t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
		t4 = ((T6)((a2)-(a1)));
		t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
		T15f8(GE_void(t3), ((T17*)(C))->a1, t1, (T6)(GE_int32(0)), t4);
		t1 = ((T6)((a2)-(a1)));
		t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
		T17f28(GE_void(R), t1);
	} else {
		R = (T17f8(C, (T6)(GE_int32(0))));
	}
	return R;
}

/* STRING_8.set_count */
void T17f28(T0* C, T6 a1)
{
	((T17*)(C))->a2 = a1;
	((T17*)(C))->a3 = (T6)(GE_int32(0));
}

/* STRING_8.new_string */
T0* T17f8(T0* C, T6 a1)
{
	T0* R = 0;
	R = T17c27(a1);
	return R;
}

/* STRING_8.item */
T2 T17f5(T0* C, T6 a1)
{
	T2 R = 0;
	T6 t1;
	t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
	R = (((T15*)(GE_void(((T17*)(C))->a1)))->z2[t1]);
	return R;
}

/* GEPP_PARSER.ignored */
T1 T24f106(T0* C)
{
	T1 R = 0;
	R = ((((T24*)(C))->a78)!=((T6)(GE_int32(0))));
	return R;
}

/* GEPP_PARSER.parse */
void T24f181(T0* C)
{
	GE_rescue r;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T6 l6 = 0;
	T6 l7 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	if (GE_setjmp(r.jb) != 0) {
		T24f190(C);
		T24f196(C);
		GE_raise(8);
	}
GE_retry:
	r.previous = GE_last_rescue;
	GE_last_rescue = &r;
	t1 = ((((T24*)(C))->a1)==((T6)(GE_int32(105))));
	if (t1) {
		l1 = ((T24*)(C))->a16;
		l2 = ((T24*)(C))->a17;
		l3 = ((T24*)(C))->a18;
		l4 = ((T24*)(C))->a19;
		l5 = ((T24*)(C))->a20;
		l6 = ((T24*)(C))->a21;
		l7 = ((T24*)(C))->a22;
		((T24*)(C))->a1 = (T6)(GE_int32(104));
	} else {
		((T24*)(C))->a23 = (T6)(GE_int32(0));
		((T24*)(C))->a24 = EIF_TRUE;
		((T24*)(C))->a25 = (T6)(GE_int32(0));
		T24f187(C);
		((T24*)(C))->a26 = (T6)(GE_int32(-1));
		l1 = (((T45*)(GE_void(((T24*)(C))->a10)))->z1);
		((T24*)(C))->a1 = (T6)(GE_int32(104));
		l7 = (T6)(GE_int32(1));
	}
	t1 = ((((T24*)(C))->a1)!=((T6)(GE_int32(104))));
	while (!(t1)) {
		switch (l7) {
		case (T6)(T6)(GE_int32(1)):
			((T24*)(C))->a26 = ((T6)((((T24*)(C))->a26)+((T6)(GE_int32(1)))));
			t1 = (T6f2(&(((T24*)(C))->a26), l1));
			if (t1) {
				l1 = ((T6)((l1)+((T6)(GE_int32(200)))));
				t2 = (T24f112(C));
				((T24*)(C))->a10 = (T46f2(GE_void(t2), ((T24*)(C))->a10, l1));
			}
			((T45*)(GE_void(((T24*)(C))->a10)))->z2[((T24*)(C))->a26] = (l2);
			l3 = (((T45*)(GE_void(((T24*)(C))->a27)))->z2[l2]);
			t1 = ((l3)==((T6)(GE_int32(-32768))));
			if (t1) {
				l7 = (T6)(GE_int32(2));
			} else {
				if (((T24*)(C))->a24) {
					T24f188(C);
					((T24*)(C))->a24 = EIF_FALSE;
				}
				t1 = (T6f1(&(((T24*)(C))->a28), (T6)(GE_int32(0))));
				if (t1) {
					t1 = (T6f6(&(((T24*)(C))->a28), (T6)(GE_int32(269))));
					if (t1) {
						l4 = (((T45*)(GE_void(((T24*)(C))->a29)))->z2[((T24*)(C))->a28]);
					} else {
						l4 = (T6)(GE_int32(25));
					}
					l3 = ((T6)((l3)+(l4)));
				} else {
					t1 = ((((T24*)(C))->a28)==((T6)(GE_int32(0))));
					if (t1) {
						l4 = (T6)(GE_int32(0));
					} else {
						((T24*)(C))->a23 = ((T6)((((T24*)(C))->a23)+((T6)(GE_int32(1)))));
						T24f189(C, l2);
						T24f190(C);
						l3 = (T6)(GE_int32(-1));
					}
				}
				t1 = ((T1)((l3)<((T6)(GE_int32(0)))));
				if (!(t1)) {
					t1 = (T6f1(&l3, (T6)(GE_int32(51))));
				}
				if (!(t1)) {
					t3 = (((T45*)(GE_void(((T24*)(C))->a30)))->z2[l3]);
					t1 = ((t3)!=(l4));
				}
				if (t1) {
					l7 = (T6)(GE_int32(2));
				} else {
					l3 = (((T45*)(GE_void(((T24*)(C))->a31)))->z2[l3]);
					t1 = ((T1)((l3)<((T6)(GE_int32(0)))));
					if (t1) {
						t1 = ((l3)==((T6)(GE_int32(-32768))));
						if (t1) {
							l7 = (T6)(GE_int32(4));
						} else {
							l3 = ((T6)(-(l3)));
							l7 = (T6)(GE_int32(3));
						}
					} else {
						t1 = ((l3)==((T6)(GE_int32(0))));
						if (t1) {
							l7 = (T6)(GE_int32(4));
						} else {
							t1 = ((l3)==((T6)(GE_int32(41))));
							if (t1) {
								T24f191(C);
							} else {
								t1 = (T6f1(&(((T24*)(C))->a28), (T6)(GE_int32(0))));
								if (t1) {
									((T24*)(C))->a24 = EIF_TRUE;
								}
								T24f192(C, l4);
								t1 = ((((T24*)(C))->a25)!=((T6)(GE_int32(0))));
								if (t1) {
									((T24*)(C))->a25 = ((T6)((((T24*)(C))->a25)-((T6)(GE_int32(1)))));
								}
								l2 = l3;
							}
						}
					}
				}
			}
			break;
		case (T6)(T6)(GE_int32(2)):
			l3 = (((T45*)(GE_void(((T24*)(C))->a32)))->z2[l2]);
			t1 = ((l3)==((T6)(GE_int32(0))));
			if (t1) {
				l7 = (T6)(GE_int32(4));
			} else {
				l7 = (T6)(GE_int32(3));
			}
			break;
		case (T6)(T6)(GE_int32(3)):
			T24f193(C, l3);
			switch (((T24*)(C))->a1) {
			case (T6)(T6)(GE_int32(104)):
				l3 = (((T45*)(GE_void(((T24*)(C))->a33)))->z2[l3]);
				l6 = (((T45*)(GE_void(((T24*)(C))->a10)))->z2[((T24*)(C))->a26]);
				l5 = ((T6)((l3)-((T6)(GE_int32(18)))));
				t3 = (((T45*)(GE_void(((T24*)(C))->a34)))->z2[l5]);
				l2 = ((T6)((t3)+(l6)));
				t1 = (T6f2(&l2, (T6)(GE_int32(0))));
				if (t1) {
					t1 = (T6f6(&l2, (T6)(GE_int32(51))));
				}
				if (t1) {
					t3 = (((T45*)(GE_void(((T24*)(C))->a30)))->z2[l2]);
					t1 = ((t3)==(l6));
				}
				if (t1) {
					l2 = (((T45*)(GE_void(((T24*)(C))->a31)))->z2[l2]);
				} else {
					l2 = (((T45*)(GE_void(((T24*)(C))->a35)))->z2[l5]);
				}
				l7 = (T6)(GE_int32(1));
				break;
			case (T6)(T6)(GE_int32(105)):
				((T24*)(C))->a16 = l1;
				((T24*)(C))->a17 = l2;
				((T24*)(C))->a18 = l3;
				((T24*)(C))->a19 = l4;
				((T24*)(C))->a20 = l5;
				((T24*)(C))->a21 = l6;
				((T24*)(C))->a22 = l7;
				break;
			case (T6)(T6)(GE_int32(103)):
				((T24*)(C))->a1 = (T6)(GE_int32(104));
				l7 = (T6)(GE_int32(4));
				break;
			default:
				break;
			}
			break;
		case (T6)(T6)(GE_int32(4)):
			t1 = ((((T24*)(C))->a25)==((T6)(GE_int32(3))));
			if (t1) {
				t1 = (T6f6(&(((T24*)(C))->a28), (T6)(GE_int32(0))));
				if (t1) {
					T24f190(C);
				} else {
					((T24*)(C))->a24 = EIF_TRUE;
					l7 = (T6)(GE_int32(5));
				}
			} else {
				t1 = ((((T24*)(C))->a25)==((T6)(GE_int32(0))));
				if (t1) {
					((T24*)(C))->a23 = ((T6)((((T24*)(C))->a23)+((T6)(GE_int32(1)))));
					T24f189(C, l2);
				}
				((T24*)(C))->a25 = (T6)(GE_int32(3));
				l7 = (T6)(GE_int32(5));
			}
			break;
		case (T6)(T6)(GE_int32(5)):
			l3 = (((T45*)(GE_void(((T24*)(C))->a27)))->z2[l2]);
			t1 = ((l3)==((T6)(GE_int32(-32768))));
			if (t1) {
				l7 = (T6)(GE_int32(6));
			} else {
				l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
				t1 = ((T1)((l3)<((T6)(GE_int32(0)))));
				if (!(t1)) {
					t1 = (T6f1(&l3, (T6)(GE_int32(51))));
				}
				if (!(t1)) {
					t3 = (((T45*)(GE_void(((T24*)(C))->a30)))->z2[l3]);
					t1 = ((t3)!=((T6)(GE_int32(1))));
				}
				if (t1) {
					l7 = (T6)(GE_int32(6));
				} else {
					l3 = (((T45*)(GE_void(((T24*)(C))->a31)))->z2[l3]);
					t1 = ((T1)((l3)<((T6)(GE_int32(0)))));
					if (t1) {
						t1 = ((l3)==((T6)(GE_int32(-32768))));
						if (t1) {
							l7 = (T6)(GE_int32(6));
						} else {
							l3 = ((T6)(-(l3)));
							l7 = (T6)(GE_int32(3));
						}
					} else {
						t1 = ((l3)==((T6)(GE_int32(0))));
						if (t1) {
							l7 = (T6)(GE_int32(6));
						} else {
							t1 = ((l3)==((T6)(GE_int32(41))));
							if (t1) {
								T24f191(C);
							} else {
								T24f194(C);
								l2 = l3;
								l7 = (T6)(GE_int32(1));
							}
						}
					}
				}
			}
			break;
		case (T6)(T6)(GE_int32(6)):
			t1 = ((((T24*)(C))->a26)==((T6)(GE_int32(0))));
			if (t1) {
				T24f190(C);
			} else {
				T24f195(C, l2);
				((T24*)(C))->a26 = ((T6)((((T24*)(C))->a26)-((T6)(GE_int32(1)))));
				l2 = (((T45*)(GE_void(((T24*)(C))->a10)))->z2[((T24*)(C))->a26]);
				l7 = (T6)(GE_int32(5));
			}
			break;
		default:
			break;
		}
		t1 = ((((T24*)(C))->a1)!=((T6)(GE_int32(104))));
	}
	t1 = ((((T24*)(C))->a1)!=((T6)(GE_int32(105))));
	if (t1) {
		T24f196(C);
	}
	GE_last_rescue = r.previous;
}

/* GEPP_PARSER.yy_pop_last_value */
void T24f195(T0* C, T6 a1)
{
	T6 l1 = 0;
	l1 = (((T45*)(GE_void(((T24*)(C))->a36)))->z2[a1]);
	switch (l1) {
	case (T6)(T6)(GE_int32(1)):
		((T24*)(C))->a39 = ((T6)((((T24*)(C))->a39)-((T6)(GE_int32(1)))));
		break;
	case (T6)(T6)(GE_int32(2)):
		((T24*)(C))->a40 = ((T6)((((T24*)(C))->a40)-((T6)(GE_int32(1)))));
		break;
	case (T6)(T6)(GE_int32(3)):
		((T24*)(C))->a41 = ((T6)((((T24*)(C))->a41)-((T6)(GE_int32(1)))));
		break;
	default:
		T24f190(C);
		break;
	}
}

/* GEPP_PARSER.yy_push_error_value */
void T24f194(T0* C)
{
	T0* l1 = 0;
	T1 t1;
	((T24*)(C))->a39 = ((T6)((((T24*)(C))->a39)+((T6)(GE_int32(1)))));
	t1 = (T6f2(&(((T24*)(C))->a39), ((T24*)(C))->a68));
	if (t1) {
		t1 = ((((T24*)(C))->a69)==(EIF_VOID));
		if (t1) {
			((T24*)(C))->a70 = T49c3();
			((T24*)(C))->a68 = (T6)(GE_int32(10));
			((T24*)(C))->a69 = (T49f1(GE_void(((T24*)(C))->a70), ((T24*)(C))->a68));
		} else {
			((T24*)(C))->a68 = ((T6)((((T24*)(C))->a68)+((T6)(GE_int32(10)))));
			((T24*)(C))->a69 = (T49f2(GE_void(((T24*)(C))->a70), ((T24*)(C))->a69, ((T24*)(C))->a68));
		}
	}
	((T48*)(GE_void(((T24*)(C))->a69)))->z2[((T24*)(C))->a39] = (l1);
}

/* KL_SPECIAL_ROUTINES [ANY].resize */
T0* T49f2(T0* C, T0* a1, T6 a2)
{
	T0* R = 0;
	T6 t1;
	T1 t2;
	t1 = (((T48*)(GE_void(a1)))->z1);
	t2 = (T6f1(&a2, t1));
	if (t2) {
		R = (T48f2(GE_void(a1), a2));
	} else {
		R = a1;
	}
	return R;
}

/* SPECIAL [ANY].resized_area */
T0* T48f2(T0* C, T6 a1)
{
	T0* R = 0;
	T6 t1;
	R = T48c4(a1);
	t1 = (((T48*)(C))->z1);
	T48f7(GE_void(R), C, (T6)(GE_int32(0)), (T6)(GE_int32(0)), t1);
	return R;
}

/* SPECIAL [ANY].copy_data */
void T48f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T0* t2;
	t1 = ((a1)==(C));
	if (t1) {
		T48f8(C, a2, a3, a4);
	} else {
		l1 = a2;
		l2 = a3;
		l3 = ((T6)((a2)+(a4)));
		t1 = ((l1)==(l3));
		while (!(t1)) {
			t2 = (((T48*)(a1))->z2[l1]);
			((T48*)(C))->z2[l2] = (t2);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			t1 = ((l1)==(l3));
		}
	}
}

/* SPECIAL [ANY].move_data */
void T48f8(T0* C, T6 a1, T6 a2, T6 a3)
{
	T1 t1;
	T6 t2;
	t1 = ((a1)==(a2));
	if (t1) {
	} else {
		t1 = (T6f1(&a1, a2));
		if (t1) {
			t2 = ((T6)((a2)+(a3)));
			t1 = ((T1)((t2)<(a1)));
			if (t1) {
				T48f9(C, a1, a2, a3);
			} else {
				T48f10(C, a1, a2, a3);
			}
		} else {
			t2 = ((T6)((a1)+(a3)));
			t1 = ((T1)((t2)<(a2)));
			if (t1) {
				T48f9(C, a1, a2, a3);
			} else {
				T48f10(C, a1, a2, a3);
			}
		}
	}
}

/* SPECIAL [ANY].overlapping_move */
void T48f10(T0* C, T6 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((T1)((a1)<(a2)));
	if (t1) {
		t2 = ((T6)((a1)+(a3)));
		l1 = ((T6)((t2)-((T6)(GE_int32(1)))));
		l2 = ((T6)((a1)-((T6)(GE_int32(1)))));
		l3 = ((T6)((a2)-(a1)));
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t3 = (((T48*)(C))->z2[l1]);
			t2 = ((T6)((l1)+(l3)));
			((T48*)(C))->z2[t2] = (t3);
			l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
			t1 = ((l1)==(l2));
		}
	} else {
		l1 = a1;
		l2 = ((T6)((a1)+(a3)));
		l3 = ((T6)((a1)-(a2)));
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t3 = (((T48*)(C))->z2[l1]);
			t2 = ((T6)((l1)-(l3)));
			((T48*)(C))->z2[t2] = (t3);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t1 = ((l1)==(l2));
		}
	}
}

/* SPECIAL [ANY].non_overlapping_move */
void T48f9(T0* C, T6 a1, T6 a2, T6 a3)
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
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T48*)(C))->z2[l1]);
		t3 = ((T6)((l1)+(l3)));
		((T48*)(C))->z2[t3] = (t2);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t1 = ((l1)==(l2));
	}
}

/* SPECIAL [ANY].make */
T0* T48c4(T6 a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T48)+a1*sizeof(T0*));
	*(T48*)C = GE_default48;
	((T48*)(C))->z1 = a1;
	return C;
}

/* KL_SPECIAL_ROUTINES [ANY].make */
T0* T49f1(T0* C, T6 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T76c2(a1);
	R = (((T76*)(GE_void(l1)))->a1);
	return R;
}

/* TO_SPECIAL [ANY].make_area */
T0* T76c2(T6 a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T76));
	*(T76*)C = GE_default76;
	((T76*)(C))->a1 = T48c4(a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [ANY].default_create */
T0* T49c3(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T49));
	*(T49*)C = GE_default49;
	return C;
}

/* GEPP_PARSER.yy_do_action */
void T24f193(T0* C, T6 a1)
{
	T0* l1 = 0;
	T1 l2 = 0;
	T1 t1;
	T0* t2;
	T1 t3;
	T6 t4;
	switch (a1) {
	case (T6)(T6)(GE_int32(1)):
		t1 = ((((T24*)(C))->a1)==((T6)(GE_int32(104))));
		if (t1) {
			((T24*)(C))->a26 = ((T6)((((T24*)(C))->a26)-((T6)(GE_int32(1)))));
			((T48*)(GE_void(((T24*)(C))->a69)))->z2[((T24*)(C))->a39] = (l1);
		}
		break;
	case (T6)(T6)(GE_int32(2)):
		t1 = ((((T24*)(C))->a1)==((T6)(GE_int32(104))));
		if (t1) {
			((T24*)(C))->a26 = ((T6)((((T24*)(C))->a26)-((T6)(GE_int32(0)))));
			((T24*)(C))->a39 = ((T6)((((T24*)(C))->a39)+((T6)(GE_int32(1)))));
			t1 = (T6f2(&(((T24*)(C))->a39), ((T24*)(C))->a68));
			if (t1) {
				t1 = ((((T24*)(C))->a69)==(EIF_VOID));
				if (t1) {
					((T24*)(C))->a70 = T49c3();
					((T24*)(C))->a68 = (T6)(GE_int32(10));
					((T24*)(C))->a69 = (T49f1(GE_void(((T24*)(C))->a70), ((T24*)(C))->a68));
				} else {
					((T24*)(C))->a68 = ((T6)((((T24*)(C))->a68)+((T6)(GE_int32(10)))));
					((T24*)(C))->a69 = (T49f2(GE_void(((T24*)(C))->a70), ((T24*)(C))->a69, ((T24*)(C))->a68));
				}
			}
			((T48*)(GE_void(((T24*)(C))->a69)))->z2[((T24*)(C))->a39] = (l1);
		}
		break;
	case (T6)(T6)(GE_int32(3)):
		t1 = ((((T24*)(C))->a1)==((T6)(GE_int32(104))));
		if (t1) {
			((T24*)(C))->a26 = ((T6)((((T24*)(C))->a26)-((T6)(GE_int32(1)))));
			((T48*)(GE_void(((T24*)(C))->a69)))->z2[((T24*)(C))->a39] = (l1);
		}
		break;
	case (T6)(T6)(GE_int32(4)):
		t1 = ((((T24*)(C))->a1)==((T6)(GE_int32(104))));
		if (t1) {
			((T24*)(C))->a26 = ((T6)((((T24*)(C))->a26)-((T6)(GE_int32(2)))));
			((T24*)(C))->a39 = ((T6)((((T24*)(C))->a39)-((T6)(GE_int32(1)))));
			((T48*)(GE_void(((T24*)(C))->a69)))->z2[((T24*)(C))->a39] = (l1);
		}
		break;
	case (T6)(T6)(GE_int32(5)):
		t1 = ((((T24*)(C))->a1)==((T6)(GE_int32(104))));
		if (t1) {
			((T24*)(C))->a26 = ((T6)((((T24*)(C))->a26)-((T6)(GE_int32(3)))));
			((T24*)(C))->a39 = ((T6)((((T24*)(C))->a39)-((T6)(GE_int32(2)))));
			((T48*)(GE_void(((T24*)(C))->a69)))->z2[((T24*)(C))->a39] = (l1);
		}
		break;
	case (T6)(T6)(GE_int32(6)):
		t1 = ((((T24*)(C))->a1)==((T6)(GE_int32(104))));
		if (t1) {
			((T24*)(C))->a26 = ((T6)((((T24*)(C))->a26)-((T6)(GE_int32(5)))));
			((T24*)(C))->a39 = ((T6)((((T24*)(C))->a39)-((T6)(GE_int32(4)))));
			((T48*)(GE_void(((T24*)(C))->a69)))->z2[((T24*)(C))->a39] = (l1);
		}
		break;
	case (T6)(T6)(GE_int32(7)):
		t1 = (T24f106(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t2 = (((T50*)(GE_void(((T24*)(C))->a73)))->z2[((T24*)(C))->a40]);
			T24f173(C, GE_ms("", 0), t2);
		}
		t1 = ((((T24*)(C))->a1)==((T6)(GE_int32(104))));
		if (t1) {
			((T24*)(C))->a26 = ((T6)((((T24*)(C))->a26)-((T6)(GE_int32(3)))));
			((T24*)(C))->a39 = ((T6)((((T24*)(C))->a39)-((T6)(GE_int32(1)))));
			((T24*)(C))->a40 = ((T6)((((T24*)(C))->a40)-((T6)(GE_int32(1)))));
			((T48*)(GE_void(((T24*)(C))->a69)))->z2[((T24*)(C))->a39] = (l1);
		}
		break;
	case (T6)(T6)(GE_int32(8)):
		t1 = (T24f106(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t2 = (((T50*)(GE_void(((T24*)(C))->a73)))->z2[((T24*)(C))->a40]);
			T24f205(C, t2);
		}
		t1 = ((((T24*)(C))->a1)==((T6)(GE_int32(104))));
		if (t1) {
			((T24*)(C))->a26 = ((T6)((((T24*)(C))->a26)-((T6)(GE_int32(3)))));
			((T24*)(C))->a39 = ((T6)((((T24*)(C))->a39)-((T6)(GE_int32(1)))));
			((T24*)(C))->a40 = ((T6)((((T24*)(C))->a40)-((T6)(GE_int32(1)))));
			((T48*)(GE_void(((T24*)(C))->a69)))->z2[((T24*)(C))->a39] = (l1);
		}
		break;
	case (T6)(T6)(GE_int32(9)):
		t1 = (T24f106(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t2 = (((T50*)(GE_void(((T24*)(C))->a73)))->z2[((T24*)(C))->a40]);
			T24f206(C, t2);
		}
		t1 = ((((T24*)(C))->a1)==((T6)(GE_int32(104))));
		if (t1) {
			((T24*)(C))->a26 = ((T6)((((T24*)(C))->a26)-((T6)(GE_int32(3)))));
			((T24*)(C))->a39 = ((T6)((((T24*)(C))->a39)-((T6)(GE_int32(1)))));
			((T24*)(C))->a40 = ((T6)((((T24*)(C))->a40)-((T6)(GE_int32(1)))));
			((T48*)(GE_void(((T24*)(C))->a69)))->z2[((T24*)(C))->a39] = (l1);
		}
		break;
	case (T6)(T6)(GE_int32(10)):
		((T24*)(C))->a76 = ((T6)((((T24*)(C))->a76)+((T6)(GE_int32(1)))));
		t1 = (T24f106(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (((T52*)(GE_void(((T24*)(C))->a77)))->z2[((T24*)(C))->a41]);
			t1 = ((T1)(!(t3)));
		}
		if (t1) {
			((T24*)(C))->a78 = ((T24*)(C))->a76;
		}
		t1 = ((((T24*)(C))->a1)==((T6)(GE_int32(104))));
		if (t1) {
			((T24*)(C))->a26 = ((T6)((((T24*)(C))->a26)-((T6)(GE_int32(3)))));
			((T24*)(C))->a39 = ((T6)((((T24*)(C))->a39)-((T6)(GE_int32(1)))));
			((T24*)(C))->a41 = ((T6)((((T24*)(C))->a41)-((T6)(GE_int32(1)))));
			((T48*)(GE_void(((T24*)(C))->a69)))->z2[((T24*)(C))->a39] = (l1);
		}
		break;
	case (T6)(T6)(GE_int32(11)):
		((T24*)(C))->a76 = ((T6)((((T24*)(C))->a76)+((T6)(GE_int32(1)))));
		t1 = (T24f106(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t1 = (((T52*)(GE_void(((T24*)(C))->a77)))->z2[((T24*)(C))->a41]);
		}
		if (t1) {
			((T24*)(C))->a78 = ((T24*)(C))->a76;
		}
		t1 = ((((T24*)(C))->a1)==((T6)(GE_int32(104))));
		if (t1) {
			((T24*)(C))->a26 = ((T6)((((T24*)(C))->a26)-((T6)(GE_int32(3)))));
			((T24*)(C))->a39 = ((T6)((((T24*)(C))->a39)-((T6)(GE_int32(1)))));
			((T24*)(C))->a41 = ((T6)((((T24*)(C))->a41)-((T6)(GE_int32(1)))));
			((T48*)(GE_void(((T24*)(C))->a69)))->z2[((T24*)(C))->a39] = (l1);
		}
		break;
	case (T6)(T6)(GE_int32(12)):
		t2 = (((T50*)(GE_void(((T24*)(C))->a73)))->z2[((T24*)(C))->a40]);
		l2 = (T24f134(C, t2));
		t1 = ((((T24*)(C))->a1)==((T6)(GE_int32(104))));
		if (t1) {
			((T24*)(C))->a26 = ((T6)((((T24*)(C))->a26)-((T6)(GE_int32(1)))));
			((T24*)(C))->a41 = ((T6)((((T24*)(C))->a41)+((T6)(GE_int32(1)))));
			((T24*)(C))->a40 = ((T6)((((T24*)(C))->a40)-((T6)(GE_int32(1)))));
			t1 = (T6f2(&(((T24*)(C))->a41), ((T24*)(C))->a79));
			if (t1) {
				t1 = ((((T24*)(C))->a77)==(EIF_VOID));
				if (t1) {
					((T24*)(C))->a80 = T53c3();
					((T24*)(C))->a79 = (T6)(GE_int32(10));
					((T24*)(C))->a77 = (T53f1(GE_void(((T24*)(C))->a80), ((T24*)(C))->a79));
				} else {
					((T24*)(C))->a79 = ((T6)((((T24*)(C))->a79)+((T6)(GE_int32(10)))));
					((T24*)(C))->a77 = (T53f2(GE_void(((T24*)(C))->a80), ((T24*)(C))->a77, ((T24*)(C))->a79));
				}
			}
			((T52*)(GE_void(((T24*)(C))->a77)))->z2[((T24*)(C))->a41] = (l2);
		}
		break;
	case (T6)(T6)(GE_int32(13)):
		l2 = (((T52*)(GE_void(((T24*)(C))->a77)))->z2[((T24*)(C))->a41]);
		t1 = ((((T24*)(C))->a1)==((T6)(GE_int32(104))));
		if (t1) {
			((T24*)(C))->a26 = ((T6)((((T24*)(C))->a26)-((T6)(GE_int32(3)))));
			((T24*)(C))->a39 = ((T6)((((T24*)(C))->a39)-((T6)(GE_int32(2)))));
			((T52*)(GE_void(((T24*)(C))->a77)))->z2[((T24*)(C))->a41] = (l2);
		}
		break;
	case (T6)(T6)(GE_int32(14)):
		t4 = ((T6)((((T24*)(C))->a41)-((T6)(GE_int32(1)))));
		t1 = (((T52*)(GE_void(((T24*)(C))->a77)))->z2[t4]);
		if (t1) {
			l2 = (((T52*)(GE_void(((T24*)(C))->a77)))->z2[((T24*)(C))->a41]);
		} else {
			l2 = EIF_FALSE;
		}
		t1 = ((((T24*)(C))->a1)==((T6)(GE_int32(104))));
		if (t1) {
			((T24*)(C))->a26 = ((T6)((((T24*)(C))->a26)-((T6)(GE_int32(3)))));
			((T24*)(C))->a41 = ((T6)((((T24*)(C))->a41)-((T6)(GE_int32(1)))));
			((T24*)(C))->a39 = ((T6)((((T24*)(C))->a39)-((T6)(GE_int32(1)))));
			((T52*)(GE_void(((T24*)(C))->a77)))->z2[((T24*)(C))->a41] = (l2);
		}
		break;
	case (T6)(T6)(GE_int32(15)):
		t4 = ((T6)((((T24*)(C))->a41)-((T6)(GE_int32(1)))));
		t1 = (((T52*)(GE_void(((T24*)(C))->a77)))->z2[t4]);
		if (!(t1)) {
			l2 = (((T52*)(GE_void(((T24*)(C))->a77)))->z2[((T24*)(C))->a41]);
		} else {
			l2 = EIF_TRUE;
		}
		t1 = ((((T24*)(C))->a1)==((T6)(GE_int32(104))));
		if (t1) {
			((T24*)(C))->a26 = ((T6)((((T24*)(C))->a26)-((T6)(GE_int32(3)))));
			((T24*)(C))->a41 = ((T6)((((T24*)(C))->a41)-((T6)(GE_int32(1)))));
			((T24*)(C))->a39 = ((T6)((((T24*)(C))->a39)-((T6)(GE_int32(1)))));
			((T52*)(GE_void(((T24*)(C))->a77)))->z2[((T24*)(C))->a41] = (l2);
		}
		break;
	case (T6)(T6)(GE_int32(16)):
		t1 = (((T52*)(GE_void(((T24*)(C))->a77)))->z2[((T24*)(C))->a41]);
		l2 = ((T1)(!(t1)));
		t1 = ((((T24*)(C))->a1)==((T6)(GE_int32(104))));
		if (t1) {
			((T24*)(C))->a26 = ((T6)((((T24*)(C))->a26)-((T6)(GE_int32(2)))));
			((T24*)(C))->a39 = ((T6)((((T24*)(C))->a39)-((T6)(GE_int32(1)))));
			((T52*)(GE_void(((T24*)(C))->a77)))->z2[((T24*)(C))->a41] = (l2);
		}
		break;
	case (T6)(T6)(GE_int32(17)):
		t1 = ((((T24*)(C))->a78)==(((T24*)(C))->a76));
		if (t1) {
			((T24*)(C))->a78 = (T6)(GE_int32(0));
		}
		((T24*)(C))->a76 = ((T6)((((T24*)(C))->a76)-((T6)(GE_int32(1)))));
		t1 = ((((T24*)(C))->a1)==((T6)(GE_int32(104))));
		if (t1) {
			((T24*)(C))->a26 = ((T6)((((T24*)(C))->a26)-((T6)(GE_int32(2)))));
			((T24*)(C))->a39 = ((T6)((((T24*)(C))->a39)-((T6)(GE_int32(1)))));
			((T48*)(GE_void(((T24*)(C))->a69)))->z2[((T24*)(C))->a39] = (l1);
		}
		break;
	case (T6)(T6)(GE_int32(18)):
		t1 = (T24f106(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			((T24*)(C))->a78 = ((T24*)(C))->a76;
		} else {
			t1 = ((((T24*)(C))->a78)==(((T24*)(C))->a76));
			if (t1) {
				((T24*)(C))->a78 = (T6)(GE_int32(0));
			}
		}
		t1 = ((((T24*)(C))->a1)==((T6)(GE_int32(104))));
		if (t1) {
			((T24*)(C))->a26 = ((T6)((((T24*)(C))->a26)-((T6)(GE_int32(2)))));
			((T24*)(C))->a39 = ((T6)((((T24*)(C))->a39)-((T6)(GE_int32(1)))));
			((T48*)(GE_void(((T24*)(C))->a69)))->z2[((T24*)(C))->a39] = (l1);
		}
		break;
	default:
		T24f190(C);
		break;
	}
}

/* KL_SPECIAL_ROUTINES [BOOLEAN].resize */
T0* T53f2(T0* C, T0* a1, T6 a2)
{
	T0* R = 0;
	T6 t1;
	T1 t2;
	t1 = (((T52*)(GE_void(a1)))->z1);
	t2 = (T6f1(&a2, t1));
	if (t2) {
		R = (T52f3(GE_void(a1), a2));
	} else {
		R = a1;
	}
	return R;
}

/* SPECIAL [BOOLEAN].resized_area */
T0* T52f3(T0* C, T6 a1)
{
	T0* R = 0;
	T6 t1;
	R = T52c4(a1);
	t1 = (((T52*)(C))->z1);
	T52f7(GE_void(R), C, (T6)(GE_int32(0)), (T6)(GE_int32(0)), t1);
	return R;
}

/* SPECIAL [BOOLEAN].copy_data */
void T52f7(T0* C, T0* a1, T6 a2, T6 a3, T6 a4)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		T52f8(C, a2, a3, a4);
	} else {
		l1 = a2;
		l2 = a3;
		l3 = ((T6)((a2)+(a4)));
		t1 = ((l1)==(l3));
		while (!(t1)) {
			t1 = (((T52*)(a1))->z2[l1]);
			((T52*)(C))->z2[l2] = (t1);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			t1 = ((l1)==(l3));
		}
	}
}

/* SPECIAL [BOOLEAN].move_data */
void T52f8(T0* C, T6 a1, T6 a2, T6 a3)
{
	T1 t1;
	T6 t2;
	t1 = ((a1)==(a2));
	if (t1) {
	} else {
		t1 = (T6f1(&a1, a2));
		if (t1) {
			t2 = ((T6)((a2)+(a3)));
			t1 = ((T1)((t2)<(a1)));
			if (t1) {
				T52f9(C, a1, a2, a3);
			} else {
				T52f10(C, a1, a2, a3);
			}
		} else {
			t2 = ((T6)((a1)+(a3)));
			t1 = ((T1)((t2)<(a2)));
			if (t1) {
				T52f9(C, a1, a2, a3);
			} else {
				T52f10(C, a1, a2, a3);
			}
		}
	}
}

/* SPECIAL [BOOLEAN].overlapping_move */
void T52f10(T0* C, T6 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T6 t2;
	t1 = ((T1)((a1)<(a2)));
	if (t1) {
		t2 = ((T6)((a1)+(a3)));
		l1 = ((T6)((t2)-((T6)(GE_int32(1)))));
		l2 = ((T6)((a1)-((T6)(GE_int32(1)))));
		l3 = ((T6)((a2)-(a1)));
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t1 = (((T52*)(C))->z2[l1]);
			t2 = ((T6)((l1)+(l3)));
			((T52*)(C))->z2[t2] = (t1);
			l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
			t1 = ((l1)==(l2));
		}
	} else {
		l1 = a1;
		l2 = ((T6)((a1)+(a3)));
		l3 = ((T6)((a1)-(a2)));
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t1 = (((T52*)(C))->z2[l1]);
			t2 = ((T6)((l1)-(l3)));
			((T52*)(C))->z2[t2] = (t1);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t1 = ((l1)==(l2));
		}
	}
}

/* SPECIAL [BOOLEAN].non_overlapping_move */
void T52f9(T0* C, T6 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T6 t2;
	l1 = a1;
	l2 = ((T6)((a1)+(a3)));
	l3 = ((T6)((a2)-(a1)));
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t1 = (((T52*)(C))->z2[l1]);
		t2 = ((T6)((l1)+(l3)));
		((T52*)(C))->z2[t2] = (t1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t1 = ((l1)==(l2));
	}
}

/* SPECIAL [BOOLEAN].make */
T0* T52c4(T6 a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T52)+a1*sizeof(T1));
	*(T52*)C = GE_default52;
	((T52*)(C))->z1 = a1;
	return C;
}

/* KL_SPECIAL_ROUTINES [BOOLEAN].make */
T0* T53f1(T0* C, T6 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T78c2(a1);
	R = (((T78*)(GE_void(l1)))->a1);
	return R;
}

/* TO_SPECIAL [BOOLEAN].make_area */
T0* T78c2(T6 a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T78));
	*(T78*)C = GE_default78;
	((T78*)(C))->a1 = T52c4(a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [BOOLEAN].default_create */
T0* T53c3(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T53));
	*(T53*)C = GE_default53;
	return C;
}

/* GEPP_PARSER.is_defined */
T1 T24f134(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T40f30(GE_void(((T24*)(C))->a3), a1));
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].has */
T1 T40f30(T0* C, T0* a1)
{
	T1 R = 0;
	T40f37(C, a1);
	R = ((((T40*)(C))->a1)!=((T6)(GE_int32(0))));
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].search_position */
void T40f37(T0* C, T0* a1)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T1 t1;
	T0* t2;
	T1 t3;
	t1 = ((a1)==(EIF_VOID));
	if (t1) {
		((T40*)(C))->a1 = (T40f24(C, ((T40*)(C))->a8));
		((T40*)(C))->a5 = ((T40*)(C))->a8;
		((T40*)(C))->a9 = (T6)(GE_int32(0));
	} else {
		l4 = ((T40*)(C))->a2;
		t1 = ((l4)!=(EIF_VOID));
		if (t1) {
			t1 = ((((T40*)(C))->a1)==((T6)(GE_int32(0))));
			if (!(t1)) {
				t2 = (T40f27(C, ((T40*)(C))->a1));
				t3 = (T25f1(GE_void(l4), a1, t2));
				t1 = ((T1)(!(t3)));
			}
			if (!(t1)) {
				t1 = (T25f1(GE_void(l4), a1, l3));
			}
			if (t1) {
				((T40*)(C))->a5 = (T40f25(C, a1));
				l1 = (T40f24(C, ((T40*)(C))->a5));
				((T40*)(C))->a1 = (T6)(GE_int32(0));
				l2 = (T6)(GE_int32(0));
				t1 = ((l1)==((T6)(GE_int32(0))));
				while (!(t1)) {
					t2 = (T40f27(C, l1));
					t1 = (T25f1(GE_void(l4), a1, t2));
					if (t1) {
						((T40*)(C))->a1 = l1;
						l1 = (T6)(GE_int32(0));
					} else {
						l2 = l1;
						l1 = (T40f21(C, l1));
					}
					t1 = ((l1)==((T6)(GE_int32(0))));
				}
				((T40*)(C))->a9 = l2;
			}
		} else {
			t1 = ((((T40*)(C))->a1)==((T6)(GE_int32(0))));
			if (!(t1)) {
				t2 = (T40f27(C, ((T40*)(C))->a1));
				t1 = ((a1)!=(t2));
			}
			if (!(t1)) {
				t1 = ((a1)==(l3));
			}
			if (t1) {
				((T40*)(C))->a5 = (T40f25(C, a1));
				l1 = (T40f24(C, ((T40*)(C))->a5));
				((T40*)(C))->a1 = (T6)(GE_int32(0));
				l2 = (T6)(GE_int32(0));
				t1 = ((l1)==((T6)(GE_int32(0))));
				while (!(t1)) {
					t2 = (T40f27(C, l1));
					t1 = ((a1)==(t2));
					if (t1) {
						((T40*)(C))->a1 = l1;
						l1 = (T6)(GE_int32(0));
					} else {
						l2 = l1;
						l1 = (T40f21(C, l1));
					}
					t1 = ((l1)==((T6)(GE_int32(0))));
				}
				((T40*)(C))->a9 = l2;
			}
		}
	}
}

/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_item */
T6 T40f21(T0* C, T6 a1)
{
	T6 R = 0;
	R = (((T45*)(GE_void(((T40*)(C))->a14)))->z2[a1]);
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].hash_position */
T6 T40f25(T0* C, T0* a1)
{
	T6 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T17f19(GE_void(a1)));
		R = ((T6)((t2)%(((T40*)(C))->a8)));
	} else {
		R = ((T40*)(C))->a8;
	}
	return R;
}

/* STRING_8.hash_code */
T6 T17f19(T0* C)
{
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T6 t2;
	T2 t3;
	T6 t4;
	R = ((T17*)(C))->a3;
	t1 = ((R)==((T6)(GE_int32(0))));
	if (t1) {
		l1 = (T6)(GE_int32(0));
		l2 = ((T17*)(C))->a2;
		l3 = ((T17*)(C))->a1;
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t2 = ((T6)((R)%((T6)(GE_int32(8388593)))));
			t2 = (T6f16(&t2, (T6)(GE_int32(8))));
			t3 = (((T15*)(GE_void(l3)))->z2[l1]);
			t4 = ((T6)(t3));
			R = ((T6)((t2)+(t4)));
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t1 = ((l1)==(l2));
		}
		((T17*)(C))->a3 = R;
	}
	return R;
}

/* INTEGER_32.infix "|<<" */
T6 T6f16(T6* C, T6 a1)
{
	T6 R = 0;
	R = ((T6)((*C)<<(a1)));
	return R;
}

/* KL_EQUALITY_TESTER [STRING_8].test */
T1 T25f1(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T1 t1;
	T0* t2;
	t1 = ((a1)==(a2));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((a1)==(EIF_VOID));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t1 = ((a2)==(EIF_VOID));
			if (t1) {
				R = EIF_FALSE;
			} else {
				t2 = (T25f2(C));
				R = (T81f2(GE_void(t2), a1, a2));
			}
		}
	}
	return R;
}

/* KL_ANY_ROUTINES.equal_objects */
T1 T81f2(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(a2));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((a1)==(EIF_VOID));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t1 = ((a2)==(EIF_VOID));
			if (t1) {
				R = EIF_FALSE;
			} else {
				t1 = (T81f1(C, a1, a2));
				if (t1) {
					R = (T17f9(GE_void(a1), a2));
				}
			}
		}
	}
	return R;
}

/* KL_EQUALITY_TESTER [STRING_8].any_ */
T0* T25f2(T0* C)
{
	T0* R = 0;
	if (ge265os2070) {
		return ge265ov2070;
	} else {
		ge265os2070 = '\1';
	}
	R = T81c3();
	ge265ov2070 = R;
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_item */
T0* T40f27(T0* C, T6 a1)
{
	T0* R = 0;
	R = (((T50*)(GE_void(((T40*)(C))->a16)))->z2[a1]);
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].slots_item */
T6 T40f24(T0* C, T6 a1)
{
	T6 R = 0;
	R = (((T45*)(GE_void(((T40*)(C))->a15)))->z2[a1]);
	return R;
}

/* GEPP_PARSER.process_include */
void T24f206(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	t1 = (T42f5(GE_void(((T24*)(C))->a5)));
	t1 = ((T1)(!(t1)));
	if (t1) {
		if (((T24*)(C))->a6) {
			T24f182(C, GE_ms(" \\\n\t", 4));
			T24f182(C, a1);
		}
		t2 = (T24f157(C));
		t2 = (T57f1(GE_void(t2), a1));
		l1 = T27c36(t2);
		T27f37(GE_void(l1));
		t1 = (T27f10(GE_void(l1)));
		if (t1) {
			T41f7(GE_void(((T24*)(C))->a4), ((T24*)(C))->a9);
			T42f9(GE_void(((T24*)(C))->a5), ((T24*)(C))->a11);
			t2 = (T24f91(C, l1));
			T24f180(C, t2);
			((T24*)(C))->a9 = (T6)(GE_int32(1));
		} else {
			l2 = T38c7(a1);
			T23f8(GE_void(((T24*)(C))->a2), l2);
			T24f190(C);
		}
	} else {
		t3 = (((T42*)(GE_void(((T24*)(C))->a5)))->a1);
		t3 = ((T6)((t3)+((T6)(GE_int32(1)))));
		l3 = T56c7(t3);
		T23f8(GE_void(((T24*)(C))->a2), l3);
		T24f190(C);
	}
}

/* GEPP_TOO_MANY_INCLUDES_ERROR.make */
T0* T56c7(T6 a1)
{
	T0* C;
	T0* t1;
	C = (T0*)GE_alloc(sizeof(T56));
	*(T56*)C = GE_default56;
	((T56*)(C))->a1 = T64c10((T6)(GE_int32(1)), (T6)(GE_int32(1)));
	t1 = (T6f10(&a1));
	T64f11(GE_void(((T56*)(C))->a1), t1, (T6)(GE_int32(1)));
	return C;
}

/* INTEGER_32.out */
T0* T6f10(T6* C)
{
	T0* R = 0;
	T6 t1;
	R = T17c27((T6)(GE_int32(11)));
	t1 = (*C);
	T17f33(GE_void(R), t1);
	return R;
}

/* STRING_8.append_integer */
void T17f33(T0* C, T6 a1)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T2 l4 = 0;
	T0* l5 = 0;
	T1 t1;
	T6 t2;
	T2 t3;
	t1 = ((a1)==((T6)(GE_int32(0))));
	if (t1) {
		T17f30(C, (T2)('0'));
	} else {
		l2 = ((T17*)(C))->a2;
		t1 = ((T1)((a1)<((T6)(GE_int32(0)))));
		if (t1) {
			T17f30(C, (T2)('-'));
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			t2 = ((T6)(GE_int32(-2147483647)-1));
			t1 = ((a1)==(t2));
			if (t1) {
				T17f30(C, (T2)('8'));
				t2 = ((T6)((a1)/((T6)(GE_int32(10)))));
				l1 = ((T6)(-(t2)));
			} else {
				l1 = ((T6)(-(a1)));
			}
		} else {
			l1 = a1;
		}
		t1 = ((l1)==((T6)(GE_int32(0))));
		while (!(t1)) {
			t2 = ((T6)((l1)%((T6)(GE_int32(10)))));
			t2 = ((T6)((t2)+((T6)(GE_int32(48)))));
			t3 = ((T2)(t2));
			T17f30(C, t3);
			l1 = ((T6)((l1)/((T6)(GE_int32(10)))));
			t1 = ((l1)==((T6)(GE_int32(0))));
		}
		l3 = ((T6)((((T17*)(C))->a2)-((T6)(GE_int32(1)))));
		l5 = ((T17*)(C))->a1;
		t1 = (T6f2(&l2, l3));
		while (!(t1)) {
			l4 = (((T15*)(GE_void(l5)))->z2[l2]);
			t3 = (((T15*)(GE_void(l5)))->z2[l3]);
			((T15*)(GE_void(l5)))->z2[l2] = (t3);
			((T15*)(GE_void(l5)))->z2[l3] = (l4);
			l3 = ((T6)((l3)-((T6)(GE_int32(1)))));
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			t1 = (T6f2(&l2, l3));
		}
	}
}

/* STRING_8.append_character */
void T17f30(T0* C, T2 a1)
{
	T6 l1 = 0;
	T6 t1;
	T1 t2;
	l1 = ((T17*)(C))->a2;
	t1 = (T17f17(C));
	t2 = ((l1)==(t1));
	if (t2) {
		t1 = (T17f18(C));
		t1 = ((T6)((l1)+(t1)));
		T17f36(C, t1);
	}
	((T15*)(GE_void(((T17*)(C))->a1)))->z2[l1] = (a1);
	((T17*)(C))->a2 = ((T6)((l1)+((T6)(GE_int32(1)))));
	((T17*)(C))->a3 = (T6)(GE_int32(0));
}

/* DS_ARRAYED_STACK [YY_BUFFER].put */
void T42f9(T0* C, T0* a1)
{
	((T42*)(C))->a1 = ((T6)((((T42*)(C))->a1)+((T6)(GE_int32(1)))));
	((T73*)(GE_void(((T42*)(C))->a3)))->z2[((T42*)(C))->a1] = (a1);
}

/* DS_ARRAYED_STACK [INTEGER_32].put */
void T41f7(T0* C, T6 a1)
{
	((T41*)(C))->a2 = ((T6)((((T41*)(C))->a2)+((T6)(GE_int32(1)))));
	((T45*)(GE_void(((T41*)(C))->a1)))->z2[((T41*)(C))->a2] = (a1);
}

/* KL_EXECUTION_ENVIRONMENT.interpreted_string */
T0* T57f1(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T2 l4 = 0;
	T1 l5 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	l2 = (T6)(GE_int32(1));
	l3 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T57f2(C));
	R = (T58f2(GE_void(t1), a1, l3));
	t2 = (T6f1(&l2, l3));
	while (!(t2)) {
		l4 = (T17f5(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l4)!=((T2)('$')));
		if (t2) {
			t2 = ((l4)!=((T2)('\000')));
			if (t2) {
				T17f30(GE_void(R), l4);
			} else {
				t1 = (T57f2(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T58f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l3));
			if (t2) {
				T17f30(GE_void(R), (T2)('$'));
			} else {
				l4 = (T17f5(GE_void(a1), l2));
				t2 = ((l4)==((T2)('$')));
				if (t2) {
					T17f30(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T57f2(C));
					l1 = (T58f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l4)==((T2)('{')));
					if (t2) {
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						l5 = EIF_FALSE;
						t2 = (T6f1(&l2, l3));
						if (!(t2)) {
							t2 = (l5);
						}
						while (!(t2)) {
							l4 = (T17f5(GE_void(a1), l2));
							t2 = ((l4)==((T2)('}')));
							if (t2) {
								l5 = EIF_TRUE;
							} else {
								t2 = ((l4)!=((T2)('\000')));
								if (t2) {
									T17f30(GE_void(l1), l4);
								} else {
									t1 = (T57f2(C));
									T58f12(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l3));
							if (!(t2)) {
								t2 = (l5);
							}
						}
					} else {
						l5 = EIF_FALSE;
						t2 = (T6f1(&l2, l3));
						if (!(t2)) {
							t2 = (l5);
						}
						while (!(t2)) {
							l4 = (T17f5(GE_void(a1), l2));
							switch (l4) {
							case (T2)'a':
							case (T2)'b':
							case (T2)'c':
							case (T2)'d':
							case (T2)'e':
							case (T2)'f':
							case (T2)'g':
							case (T2)'h':
							case (T2)'i':
							case (T2)'j':
							case (T2)'k':
							case (T2)'l':
							case (T2)'m':
							case (T2)'n':
							case (T2)'o':
							case (T2)'p':
							case (T2)'q':
							case (T2)'r':
							case (T2)'s':
							case (T2)'t':
							case (T2)'u':
							case (T2)'v':
							case (T2)'w':
							case (T2)'x':
							case (T2)'y':
							case (T2)'z':
							case (T2)'A':
							case (T2)'B':
							case (T2)'C':
							case (T2)'D':
							case (T2)'E':
							case (T2)'F':
							case (T2)'G':
							case (T2)'H':
							case (T2)'I':
							case (T2)'J':
							case (T2)'K':
							case (T2)'L':
							case (T2)'M':
							case (T2)'N':
							case (T2)'O':
							case (T2)'P':
							case (T2)'Q':
							case (T2)'R':
							case (T2)'S':
							case (T2)'T':
							case (T2)'U':
							case (T2)'V':
							case (T2)'W':
							case (T2)'X':
							case (T2)'Y':
							case (T2)'Z':
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
							case (T2)(T2)('_'):
								T17f30(GE_void(l1), l4);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l5 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l3));
							if (!(t2)) {
								t2 = (l5);
							}
						}
					}
					l1 = (T57f3(C, l1));
					t2 = ((l1)!=(EIF_VOID));
					if (t2) {
						t1 = (T57f2(C));
						R = (T58f4(GE_void(t1), R, l1));
					}
				}
			}
		}
		t2 = (T6f1(&l2, l3));
	}
	return R;
}

/* KL_STRING_ROUTINES.appended_string */
T0* T58f4(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = EIF_VOID;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		(GE_void(l1), a2);
		R = l1;
	} else {
		l1 = EIF_VOID;
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			R = (T58f8(C, a1, a2));
		} else {
			T17f32(GE_void(a1), a2);
			R = a1;
		}
	}
	return R;
}

/* STRING_8.append_string */
void T17f32(T0* C, T0* a1)
{
	T1 t1;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		T17f34(C, a1);
	}
}

/* KL_STRING_ROUTINES.concat */
T0* T58f8(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = EIF_VOID;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), a2, (T0*)0));
	} else {
		l1 = EIF_VOID;
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			R = ((GE_void(l1), a1, (T0*)0));
		} else {
			R = (T17f14(GE_void(a1), a2));
		}
	}
	return R;
}

/* STRING_8.infix "+" */
T0* T17f14(T0* C, T0* a1)
{
	T0* R = 0;
	T6 t1;
	t1 = (((T17*)(GE_void(a1)))->a2);
	t1 = ((T6)((((T17*)(C))->a2)+(t1)));
	R = (T17f8(C, t1));
	T17f34(GE_void(R), C);
	T17f34(GE_void(R), a1);
	return R;
}

/* KL_EXECUTION_ENVIRONMENT.variable_value */
T0* T57f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* t1;
	T0* t2;
	t1 = (T57f4(C));
	t2 = (T57f2(C));
	t2 = (T58f1(GE_void(t2), a1));
	R = (T79f1(GE_void(t1), t2));
	return R;
}

/* EXECUTION_ENVIRONMENT.get */
T0* T79f1(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T14 l2 = 0;
	T14 l3 = 0;
	T61 t1;
	T14 t2;
	T1 t3;
	l1 = (T17f7(GE_void(a1)));
	(t1).id = 61;
	(t1).a1 = ((l1?(T14)(GE_types[((T0*)(l1))->id].is_special?(T14)((T15*)(l1))->z2:(T14)l1):(T14)0));
	t2 = ((t1).a1);
	l2 = (T79f3(C, t2));
	t3 = ((l2)!=(l3));
	if (t3) {
		R = T17c38(l2);
	}
	return R;
}

/* STRING_8.make_from_c */
T0* T17c38(T14 a1)
{
	T6 l1 = 0;
	T0* C;
	T1 t1;
	T0* t2;
	T6 t3;
	C = (T0*)GE_alloc(sizeof(T17));
	*(T17*)C = GE_default17;
	t1 = ((((T17*)(C))->a1)==(EIF_VOID));
	if (t1) {
		t2 = (T17f22(C));
		T91f5(GE_void(t2), a1);
		t2 = (T17f22(C));
		l1 = (((T91*)(GE_void(t2)))->a1);
		t3 = ((T6)((l1)+((T6)(GE_int32(1)))));
		T17f29(C, t3);
		((T17*)(C))->a2 = l1;
		((T17*)(C))->a3 = (T6)(GE_int32(0));
		t2 = (T17f22(C));
		T91f6(GE_void(t2), C);
	} else {
		T17f39(C, a1);
	}
	return C;
}

/* STRING_8.from_c */
void T17f39(T0* C, T14 a1)
{
	T6 l1 = 0;
	T0* t1;
	T6 t2;
	t1 = (T17f22(C));
	T91f5(GE_void(t1), a1);
	t1 = (T17f22(C));
	l1 = (((T91*)(GE_void(t1)))->a1);
	t2 = ((T6)((l1)+((T6)(GE_int32(1)))));
	T17f36(C, t2);
	((T17*)(C))->a2 = l1;
	((T17*)(C))->a3 = (T6)(GE_int32(0));
	t1 = (T17f22(C));
	T91f6(GE_void(t1), C);
}

/* C_STRING.read_string_into */
void T91f6(T0* C, T0* a1)
{
	T91f8(C, a1, (T6)(GE_int32(1)), ((T91*)(C))->a1);
}

/* C_STRING.read_substring_into */
void T91f8(T0* C, T0* a1, T6 a2, T6 a3)
{
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T8 t2;
	T10 t3;
	T6 t4;
	l2 = ((T6)((a2)-((T6)(GE_int32(1)))));
	l3 = a3;
	l1 = ((T91*)(C))->a2;
	t1 = ((l2)==(l3));
	while (!(t1)) {
		t2 = (T95f6(GE_void(l1), l2));
		t3 = (T8f7(&t2));
		t4 = ((T6)((l2)+((T6)(GE_int32(1)))));
		T17f43(a1, t3, t4);
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t1 = ((l2)==(l3));
	}
}

/* STRING_8.put_code */
void T17f43(T0* C, T10 a1, T6 a2)
{
	T2 t1;
	T6 t2;
	t1 = ((T2)(a1));
	t2 = ((T6)((a2)-((T6)(GE_int32(1)))));
	((T15*)(GE_void(((T17*)(C))->a1)))->z2[t2] = (t1);
	((T17*)(C))->a3 = (T6)(GE_int32(0));
}

/* NATURAL_8.to_natural_32 */
T10 T8f7(T8* C)
{
	T10 R = 0;
	R = ((T10)(*C));
	return R;
}

/* MANAGED_POINTER.read_natural_8 */
T8 T95f6(T0* C, T6 a1)
{
	T8 R = 0;
	T98 t1;
	T14 t2;
	(t1).id = 98;
	(t1).a1 = ((T14)&R);
	t2 = ((T14)(((char*)(((T95*)(C))->a2))+(a1)));
	T98f2(&t1, t2, (T6)(GE_int32(1)));
	return R;
}

/* TYPED_POINTER [NATURAL_8].memory_copy */
void T98f2(T98* C, T14 a1, T6 a2)
{
	T98f3(C, (*C).a1, a1, a2);
}

/* TYPED_POINTER [NATURAL_8].c_memcpy */
void T98f3(T98* C, T14 a1, T14 a2, T6 a3)
{
	memcpy((void *)a1,( const void *)a2,( size_t)a3);
}

/* C_STRING.share_from_pointer */
void T91f5(T0* C, T14 a1)
{
	T6 t1;
	t1 = (T91f3(C, a1));
	T91f7(C, a1, t1);
}

/* C_STRING.share_from_pointer_and_count */
void T91f7(T0* C, T14 a1, T6 a2)
{
	T1 t1;
	T1 t2;
	T6 t3;
	((T91*)(C))->a1 = a2;
	t1 = ((((T91*)(C))->a2)==(EIF_VOID));
	if (!(t1)) {
		t2 = (((T95*)(GE_void(((T91*)(C))->a2)))->a1);
		t1 = ((T1)(!(t2)));
	}
	if (t1) {
		t3 = ((T6)((a2)+((T6)(GE_int32(1)))));
		((T91*)(C))->a2 = T95c8(a1, t3);
	} else {
		t3 = ((T6)((a2)+((T6)(GE_int32(1)))));
		T95f9(GE_void(((T91*)(C))->a2), a1, t3);
	}
}

/* MANAGED_POINTER.set_from_pointer */
void T95f9(T0* C, T14 a1, T6 a2)
{
	((T95*)(C))->a2 = a1;
	((T95*)(C))->a3 = a2;
}

/* MANAGED_POINTER.share_from_pointer */
T0* T95c8(T14 a1, T6 a2)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T95));
	*(T95*)C = GE_default95;
	((T95*)(C))->a2 = a1;
	((T95*)(C))->a3 = a2;
	((T95*)(C))->a1 = EIF_TRUE;
	return C;
}

/* C_STRING.c_strlen */
T6 T91f3(T0* C, T14 a1)
{
	T6 R = 0;
	R = (T6)(EIF_INTEGER )strlen((char *)a1);
	return R;
}

/* STRING_8.c_string_provider */
unsigned char ge541os1257 = '\0';
T0* ge541ov1257;
T0* T17f22(T0* C)
{
	T0* R = 0;
	if (ge541os1257) {
		return ge541ov1257;
	} else {
		ge541os1257 = '\1';
	}
	R = T91c4((T6)(GE_int32(0)));
	ge541ov1257 = R;
	return R;
}

/* C_STRING.make_empty */
T0* T91c4(T6 a1)
{
	T0* C;
	T6 t1;
	C = (T0*)GE_alloc(sizeof(T91));
	*(T91*)C = GE_default91;
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	((T91*)(C))->a2 = T95c7(t1);
	((T91*)(C))->a1 = (T6)(GE_int32(0));
	return C;
}

/* MANAGED_POINTER.make */
T0* T95c7(T6 a1)
{
	T0* C;
	T6 t1;
	T14 t2;
	T1 t3;
	T0* t4;
	C = (T0*)GE_alloc(sizeof(T95));
	*(T95*)C = GE_default95;
	t1 = (T6f15(&a1, (T6)(GE_int32(1))));
	((T95*)(C))->a2 = (T14f2(&(((T95*)(C))->a2), (T6)(GE_int32(1)), t1));
	t2 = (T95f5(C));
	t3 = ((((T95*)(C))->a2)==(t2));
	if (t3) {
		t4 = (T99c2());
		T99f3(t4, GE_ms("No more memory", 14));
	}
	((T95*)(C))->a3 = a1;
	return C;
}

/* EXCEPTIONS.raise */
void T99f3(T0* C, T0* a1)
{
	T0* l1 = 0;
	T1 t1;
	T61 t2;
	T14 t3;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		l1 = (T17f7(a1));
	}
	(t2).id = 61;
	(t2).a1 = ((l1?(T14)(GE_types[((T0*)(l1))->id].is_special?(T14)((T15*)(l1))->z2:(T14)l1):(T14)0));
	t3 = ((t2).a1);
	T99f4(C, t3, (T6)(GE_int32(24)));
}

/* EXCEPTIONS.eraise */
void T99f4(T0* C, T14 a1, T6 a2)
{
	eraise((char *)a1,( long)a2);
}

/* EXCEPTIONS.default_create */
T0* T99c2(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T99));
	*(T99*)C = GE_default99;
	return C;
}

/* MANAGED_POINTER.default_pointer */
T14 T95f5(T0* C)
{
	T14 R = 0;
	return R;
}

/* POINTER.memory_calloc */
T14 T14f2(T14* C, T6 a1, T6 a2)
{
	T14 R = 0;
	R = (T14f3(C, a1, a2));
	return R;
}

/* POINTER.c_calloc */
T14 T14f3(T14* C, T6 a1, T6 a2)
{
	T14 R = 0;
	R = (T14)(EIF_POINTER )calloc((size_t)a1,( size_t)a2);
	return R;
}

/* EXECUTION_ENVIRONMENT.eif_getenv */
T14 T79f3(T0* C, T14 a1)
{
	T14 R = 0;
	R = (T14)getenv((char*)a1);
	return R;
}

/* KL_EXECUTION_ENVIRONMENT.environment_impl */
unsigned char ge379os4085 = '\0';
T0* ge379ov4085;
T0* T57f4(T0* C)
{
	T0* R = 0;
	if (ge379os4085) {
		return ge379ov4085;
	} else {
		ge379os4085 = '\1';
	}
	R = T79c4();
	ge379ov4085 = R;
	return R;
}

/* EXECUTION_ENVIRONMENT.default_create */
T0* T79c4(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T79));
	*(T79*)C = GE_default79;
	return C;
}

/* KL_STRING_ROUTINES.append_substring_to_string */
void T58f12(T0* C, T0* a1, T0* a2, T6 a3, T6 a4)
{
	T0* l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T2 t2;
	l1 = EIF_VOID;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		(GE_void(l1), a2, a3, a4);
	} else {
		l2 = a3;
		t1 = (T6f1(&l2, a4));
		while (!(t1)) {
			t2 = (T17f5(GE_void(a2), l2));
			T17f30(GE_void(a1), t2);
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			t1 = (T6f1(&l2, a4));
		}
	}
}

/* KL_STRING_ROUTINES.appended_substring */
T0* T58f3(T0* C, T0* a1, T0* a2, T6 a3, T6 a4)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T6 t2;
	T2 t3;
	l1 = EIF_VOID;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		(GE_void(l1), a2, a3, a4);
		R = l1;
	} else {
		l1 = EIF_VOID;
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t2 = (((T17*)(GE_void(a1)))->a2);
			t2 = ((T6)((t2)+(a4)));
			t2 = ((T6)((t2)-(a3)));
			t2 = ((T6)((t2)+((T6)(GE_int32(1)))));
			l1 = ((GE_void(l1), t2, (T0*)0));
			(GE_void(l1), a1);
			(GE_void(l1), a2, a3, a4);
			R = l1;
		} else {
			l2 = a3;
			t1 = (T6f1(&l2, a4));
			while (!(t1)) {
				t3 = (T17f5(GE_void(a2), l2));
				T17f30(GE_void(a1), t3);
				l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				t1 = (T6f1(&l2, a4));
			}
			R = a1;
		}
	}
	return R;
}

/* KL_STRING_ROUTINES.new_empty_string */
T0* T58f2(T0* C, T0* a1, T6 a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	t1 = (T58f5(C));
	t2 = (T81f1(GE_void(t1), a1, ge407ov4264));
	if (t2) {
		R = T17c27(a2);
	} else {
		l1 = EIF_VOID;
		t2 = ((l1)!=(EIF_VOID));
		if (t2) {
			R = ((GE_void(l1), a2, (T0*)0));
		} else {
			R = (T58f7(C, a1));
			T17f31(GE_void(R));
		}
	}
	return R;
}

/* STRING_8.wipe_out */
void T17f31(T0* C)
{
	((T17*)(C))->a1 = T15c9((T6)(GE_int32(1)));
	((T17*)(C))->a2 = (T6)(GE_int32(0));
	((T17*)(C))->a3 = (T6)(GE_int32(0));
}

/* KL_STRING_ROUTINES.cloned_string */
T0* T58f7(T0* C, T0* a1)
{
	T0* R = 0;
	R = (T17f13(GE_void(a1)));
	return R;
}

/* STRING_8.twin */
T0* T17f13(T0* C)
{
	T0* R = 0;
	R = (T0*)GE_alloc(sizeof(T17));
	((T0*)(R))->id = 17;
	T17f35(R, C);
	return R;
}

/* STRING_8.copy */
void T17f35(T0* C, T0* a1)
{
	T0* l1 = 0;
	T1 t1;
	T6 t2;
	t1 = ((a1)!=(C));
	if (t1) {
		l1 = ((T17*)(C))->a1;
		*(T17*)(C) = *(T17*)(a1);
		t1 = ((l1)==(EIF_VOID));
		if (!(t1)) {
			t2 = (((T15*)(GE_void(l1)))->z1);
			t1 = (T6f6(&t2, ((T17*)(C))->a2));
		}
		if (t1) {
			((T17*)(C))->a1 = (T15f3(GE_void(((T17*)(C))->a1)));
		} else {
			T15f8(GE_void(l1), ((T17*)(C))->a1, (T6)(GE_int32(0)), (T6)(GE_int32(0)), ((T17*)(C))->a2);
			((T17*)(C))->a1 = l1;
		}
		((T17*)(C))->a3 = (T6)(GE_int32(0));
	}
}

/* SPECIAL [CHARACTER_8].twin */
T0* T15f3(T0* C)
{
	T0* R = 0;
	R = (T0*)GE_alloc(sizeof(T15)+((T15*)(C))->z1*sizeof(T2));
	*(T15*)(R) = *(T15*)(C);
	memcpy(((T15*)(R))->z2,((T15*)(C))->z2,((T15*)(C))->z1*sizeof(T2));
	return R;
}

/* KL_EXECUTION_ENVIRONMENT.string_ */
T0* T57f2(T0* C)
{
	T0* R = 0;
	if (ge273os1776) {
		return ge273ov1776;
	} else {
		ge273os1776 = '\1';
	}
	R = T58c11();
	ge273ov1776 = R;
	return R;
}

/* GEPP_PARSER.execution_environment */
unsigned char ge322os1982 = '\0';
T0* ge322ov1982;
T0* T24f157(T0* C)
{
	T0* R = 0;
	if (ge322os1982) {
		return ge322ov1982;
	} else {
		ge322os1982 = '\1';
	}
	R = T57c5();
	ge322ov1982 = R;
	return R;
}

/* KL_EXECUTION_ENVIRONMENT.default_create */
T0* T57c5(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T57));
	*(T57*)C = GE_default57;
	return C;
}

/* DS_ARRAYED_STACK [YY_BUFFER].is_full */
T1 T42f5(T0* C)
{
	T1 R = 0;
	R = ((((T42*)(C))->a1)==(((T42*)(C))->a2));
	return R;
}

/* GEPP_PARSER.undefine_value */
void T24f205(T0* C, T0* a1)
{
	T40f36(GE_void(((T24*)(C))->a3), a1);
}

/* DS_HASH_TABLE [STRING_8, STRING_8].remove */
void T40f36(T0* C, T0* a1)
{
	T1 t1;
	T40f39(C);
	T40f37(C, a1);
	t1 = ((((T40*)(C))->a1)!=((T6)(GE_int32(0))));
	if (t1) {
		T40f45(C, ((T40*)(C))->a1);
	}
}

/* DS_HASH_TABLE [STRING_8, STRING_8].remove_position */
void T40f45(T0* C, T6 a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T6 l4 = 0;
	T0* l5 = 0;
	T1 t1;
	T6 t2;
	t1 = ((a1)!=(((T40*)(C))->a1));
	if (t1) {
		l2 = (T40f27(C, a1));
		l4 = (T40f25(C, l2));
		t2 = (T40f24(C, l4));
		t1 = ((t2)==(a1));
		if (t1) {
			((T40*)(C))->a1 = a1;
			((T40*)(C))->a5 = l4;
			((T40*)(C))->a9 = (T6)(GE_int32(0));
		} else {
			l5 = ((T40*)(C))->a2;
			T40f51(C, EIF_VOID);
			T40f37(C, l2);
			T40f51(C, l5);
		}
	}
	T40f52(C, ((T40*)(C))->a1);
	t1 = ((((T40*)(C))->a9)==((T6)(GE_int32(0))));
	if (t1) {
		t2 = (T40f21(C, ((T40*)(C))->a1));
		T40f43(C, t2, ((T40*)(C))->a5);
	} else {
		t2 = (T40f21(C, ((T40*)(C))->a1));
		T40f42(C, t2, ((T40*)(C))->a9);
	}
	T40f40(C, l1, ((T40*)(C))->a1);
	T40f44(C, l3, ((T40*)(C))->a1);
	t1 = ((((T40*)(C))->a6)==((T6)(GE_int32(0))));
	if (t1) {
		t1 = ((((T40*)(C))->a1)==(((T40*)(C))->a7));
	}
	if (t1) {
		((T40*)(C))->a7 = ((T6)((((T40*)(C))->a7)-((T6)(GE_int32(1)))));
		T40f42(C, (T6)(GE_int32(0)), ((T40*)(C))->a1);
	} else {
		t2 = (T6)(GE_int32(-1));
		t2 = ((T6)((t2)-(((T40*)(C))->a6)));
		T40f42(C, t2, ((T40*)(C))->a1);
		((T40*)(C))->a6 = ((T40*)(C))->a1;
	}
	((T40*)(C))->a3 = ((T6)((((T40*)(C))->a3)-((T6)(GE_int32(1)))));
}

/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_put */
void T40f44(T0* C, T0* a1, T6 a2)
{
	((T50*)(GE_void(((T40*)(C))->a16)))->z2[a2] = (a1);
}

/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_put */
void T40f40(T0* C, T0* a1, T6 a2)
{
	((T50*)(GE_void(((T40*)(C))->a13)))->z2[a2] = (a1);
}

/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_put */
void T40f42(T0* C, T6 a1, T6 a2)
{
	((T45*)(GE_void(((T40*)(C))->a14)))->z2[a2] = (a1);
}

/* DS_HASH_TABLE [STRING_8, STRING_8].slots_put */
void T40f43(T0* C, T6 a1, T6 a2)
{
	((T45*)(GE_void(((T40*)(C))->a15)))->z2[a2] = (a1);
}

/* DS_HASH_TABLE [STRING_8, STRING_8].move_cursors_forth */
void T40f52(T0* C, T6 a1)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T6 t2;
	l1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	l2 = ((T40*)(C))->a7;
	t1 = (T6f1(&l1, l2));
	if (!(t1)) {
		t2 = (T40f21(C, l1));
		t1 = (T6f1(&t2, (T6)(GE_int32(-1))));
	}
	while (!(t1)) {
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t1 = (T6f1(&l1, l2));
		if (!(t1)) {
			t2 = (T40f21(C, l1));
			t1 = (T6f1(&t2, (T6)(GE_int32(-1))));
		}
	}
	t1 = (T6f1(&l1, l2));
	if (t1) {
		T40f57(C, a1);
	} else {
		T40f58(C, a1, l1);
	}
}

/* DS_HASH_TABLE [STRING_8, STRING_8].move_all_cursors */
void T40f58(T0* C, T6 a1, T6 a2)
{
	T0* l1 = 0;
	T1 t1;
	T6 t2;
	l1 = ((T40*)(C))->a17;
	t1 = ((l1)==(EIF_VOID));
	while (!(t1)) {
		t2 = (((T72*)(GE_void(l1)))->a1);
		t1 = ((t2)==(a1));
		if (t1) {
			T72f5(GE_void(l1), a2);
		}
		l1 = (((T72*)(GE_void(l1)))->a2);
		t1 = ((l1)==(EIF_VOID));
	}
}

/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].set_position */
void T72f5(T0* C, T6 a1)
{
	((T72*)(C))->a1 = a1;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].move_cursors_after */
void T40f57(T0* C, T6 a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T6 t1;
	T1 t2;
	l1 = ((T40*)(C))->a17;
	t1 = (((T72*)(GE_void(l1)))->a1);
	t2 = ((t1)==(a1));
	if (t2) {
		T72f5(GE_void(l1), (T6)(GE_int32(-2)));
	}
	l2 = l1;
	l1 = (((T72*)(GE_void(l1)))->a2);
	t2 = ((l1)==(EIF_VOID));
	while (!(t2)) {
		t1 = (((T72*)(GE_void(l1)))->a1);
		t2 = ((t1)==(a1));
		if (t2) {
			T72f5(GE_void(l1), (T6)(GE_int32(-2)));
			l3 = (((T72*)(GE_void(l1)))->a2);
			T72f6(GE_void(l2), l3);
			T72f6(GE_void(l1), EIF_VOID);
			l1 = l3;
		} else {
			l2 = l1;
			l1 = (((T72*)(GE_void(l1)))->a2);
		}
		t2 = ((l1)==(EIF_VOID));
	}
}

/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].set_next_cursor */
void T72f6(T0* C, T0* a1)
{
	((T72*)(C))->a2 = a1;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].internal_set_key_equality_tester */
void T40f51(T0* C, T0* a1)
{
	((T40*)(C))->a2 = a1;
	T70f6(GE_void(((T40*)(C))->a11), a1);
}

/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].internal_set_equality_tester */
void T70f6(T0* C, T0* a1)
{
	((T70*)(C))->a2 = a1;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].unset_found_item */
void T40f39(T0* C)
{
	((T40*)(C))->a12 = (T6)(GE_int32(0));
}

/* GEPP_PARSER.define_value */
void T24f173(T0* C, T0* a1, T0* a2)
{
	T40f35(GE_void(((T24*)(C))->a3), a1, a2);
}

/* DS_HASH_TABLE [STRING_8, STRING_8].force */
void T40f35(T0* C, T0* a1, T0* a2)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T6 t2;
	T6 t3;
	T40f39(C);
	T40f37(C, a2);
	t1 = ((((T40*)(C))->a1)!=((T6)(GE_int32(0))));
	if (t1) {
		T40f40(C, a1, ((T40*)(C))->a1);
	} else {
		t1 = ((((T40*)(C))->a3)==(((T40*)(C))->a4));
		if (t1) {
			t2 = ((T6)((((T40*)(C))->a3)+((T6)(GE_int32(1)))));
			t2 = (T40f31(C, t2));
			T40f41(C, t2);
			l2 = (T40f25(C, a2));
		} else {
			l2 = ((T40*)(C))->a5;
		}
		l1 = ((T40*)(C))->a6;
		t1 = ((l1)==((T6)(GE_int32(0))));
		if (t1) {
			((T40*)(C))->a7 = ((T6)((((T40*)(C))->a7)+((T6)(GE_int32(1)))));
			l1 = ((T40*)(C))->a7;
		} else {
			t2 = (T6)(GE_int32(-1));
			t3 = (T40f21(C, l1));
			((T40*)(C))->a6 = ((T6)((t2)-(t3)));
		}
		t2 = (T40f24(C, l2));
		T40f42(C, t2, l1);
		T40f43(C, l1, l2);
		T40f40(C, a1, l1);
		T40f44(C, a2, l1);
		((T40*)(C))->a3 = ((T6)((((T40*)(C))->a3)+((T6)(GE_int32(1)))));
	}
}

/* DS_HASH_TABLE [STRING_8, STRING_8].resize */
void T40f41(T0* C, T6 a1)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	T40f39(C);
	l1 = (T40f22(C, a1));
	t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	T40f47(C, t1);
	l2 = ((T40*)(C))->a8;
	t2 = ((T1)((l2)<((T6)(GE_int32(0)))));
	while (!(t2)) {
		T40f43(C, (T6)(GE_int32(0)), l2);
		l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
		t2 = ((T1)((l2)<((T6)(GE_int32(0)))));
	}
	((T40*)(C))->a8 = l1;
	l2 = ((T40*)(C))->a7;
	t2 = ((T1)((l2)<((T6)(GE_int32(1)))));
	while (!(t2)) {
		t1 = (T40f21(C, l2));
		t2 = (T6f1(&t1, (T6)(GE_int32(-1))));
		if (t2) {
			t3 = (T40f27(C, l2));
			l3 = (T40f25(C, t3));
			t1 = (T40f24(C, l3));
			T40f42(C, t1, l2);
			T40f43(C, l2, l3);
		}
		l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
		t2 = ((T1)((l2)<((T6)(GE_int32(1)))));
	}
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	T40f48(C, t1);
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	T40f49(C, t1);
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	T40f50(C, t1);
	((T40*)(C))->a4 = a1;
	((T40*)(C))->a1 = (T6)(GE_int32(0));
}

/* DS_HASH_TABLE [STRING_8, STRING_8].clashes_resize */
void T40f50(T0* C, T6 a1)
{
	T0* t1;
	t1 = (T40f29(C));
	((T40*)(C))->a14 = (T46f2(GE_void(t1), ((T40*)(C))->a14, a1));
}

/* DS_HASH_TABLE [STRING_8, STRING_8].special_integer_ */
unsigned char ge271os1780 = '\0';
T0* ge271ov1780;
T0* T40f29(T0* C)
{
	T0* R = 0;
	if (ge271os1780) {
		return ge271ov1780;
	} else {
		ge271os1780 = '\1';
	}
	R = T46c4();
	ge271ov1780 = R;
	return R;
}

/* KL_SPECIAL_ROUTINES [INTEGER_32].default_create */
T0* T46c4(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T46));
	*(T46*)C = GE_default46;
	return C;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].key_storage_resize */
void T40f49(T0* C, T6 a1)
{
	((T40*)(C))->a16 = (T51f2(GE_void(((T40*)(C))->a19), ((T40*)(C))->a16, a1));
}

/* KL_SPECIAL_ROUTINES [STRING_8].resize */
T0* T51f2(T0* C, T0* a1, T6 a2)
{
	T0* R = 0;
	T6 t1;
	T1 t2;
	t1 = (((T50*)(GE_void(a1)))->z1);
	t2 = (T6f1(&a2, t1));
	if (t2) {
		R = (T50f3(GE_void(a1), a2));
	} else {
		R = a1;
	}
	return R;
}

/* SPECIAL [STRING_8].resized_area */
T0* T50f3(T0* C, T6 a1)
{
	T0* R = 0;
	T6 t1;
	R = T50c5(a1);
	t1 = (((T50*)(C))->z1);
	T50f8(GE_void(R), C, (T6)(GE_int32(0)), (T6)(GE_int32(0)), t1);
	return R;
}

/* SPECIAL [STRING_8].copy_data */
void T50f8(T0* C, T0* a1, T6 a2, T6 a3, T6 a4)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T0* t2;
	t1 = ((a1)==(C));
	if (t1) {
		T50f9(C, a2, a3, a4);
	} else {
		l1 = a2;
		l2 = a3;
		l3 = ((T6)((a2)+(a4)));
		t1 = ((l1)==(l3));
		while (!(t1)) {
			t2 = (((T50*)(a1))->z2[l1]);
			((T50*)(C))->z2[l2] = (t2);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			t1 = ((l1)==(l3));
		}
	}
}

/* SPECIAL [STRING_8].move_data */
void T50f9(T0* C, T6 a1, T6 a2, T6 a3)
{
	T1 t1;
	T6 t2;
	t1 = ((a1)==(a2));
	if (t1) {
	} else {
		t1 = (T6f1(&a1, a2));
		if (t1) {
			t2 = ((T6)((a2)+(a3)));
			t1 = ((T1)((t2)<(a1)));
			if (t1) {
				T50f10(C, a1, a2, a3);
			} else {
				T50f11(C, a1, a2, a3);
			}
		} else {
			t2 = ((T6)((a1)+(a3)));
			t1 = ((T1)((t2)<(a2)));
			if (t1) {
				T50f10(C, a1, a2, a3);
			} else {
				T50f11(C, a1, a2, a3);
			}
		}
	}
}

/* SPECIAL [STRING_8].overlapping_move */
void T50f11(T0* C, T6 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((T1)((a1)<(a2)));
	if (t1) {
		t2 = ((T6)((a1)+(a3)));
		l1 = ((T6)((t2)-((T6)(GE_int32(1)))));
		l2 = ((T6)((a1)-((T6)(GE_int32(1)))));
		l3 = ((T6)((a2)-(a1)));
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t3 = (((T50*)(C))->z2[l1]);
			t2 = ((T6)((l1)+(l3)));
			((T50*)(C))->z2[t2] = (t3);
			l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
			t1 = ((l1)==(l2));
		}
	} else {
		l1 = a1;
		l2 = ((T6)((a1)+(a3)));
		l3 = ((T6)((a1)-(a2)));
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t3 = (((T50*)(C))->z2[l1]);
			t2 = ((T6)((l1)-(l3)));
			((T50*)(C))->z2[t2] = (t3);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t1 = ((l1)==(l2));
		}
	}
}

/* SPECIAL [STRING_8].non_overlapping_move */
void T50f10(T0* C, T6 a1, T6 a2, T6 a3)
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
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T50*)(C))->z2[l1]);
		t3 = ((T6)((l1)+(l3)));
		((T50*)(C))->z2[t3] = (t2);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t1 = ((l1)==(l2));
	}
}

/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_resize */
void T40f48(T0* C, T6 a1)
{
	((T40*)(C))->a13 = (T51f2(GE_void(((T40*)(C))->a18), ((T40*)(C))->a13, a1));
}

/* DS_HASH_TABLE [STRING_8, STRING_8].slots_resize */
void T40f47(T0* C, T6 a1)
{
	T0* t1;
	t1 = (T40f29(C));
	((T40*)(C))->a15 = (T46f2(GE_void(t1), ((T40*)(C))->a15, a1));
}

/* DS_HASH_TABLE [STRING_8, STRING_8].new_modulus */
T6 T40f22(T0* C, T6 a1)
{
	T6 R = 0;
	T6 t1;
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	t1 = ((T6)((t1)*((T6)(GE_int32(3)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].new_capacity */
T6 T40f31(T0* C, T6 a1)
{
	T6 R = 0;
	T6 t1;
	t1 = (T6)(GE_int32(2));
	R = ((T6)((t1)*(a1)));
	return R;
}

/* GEPP_PARSER.yy_push_last_value */
void T24f192(T0* C, T6 a1)
{
	T6 t1;
	T1 t2;
	t1 = (((T45*)(GE_void(((T24*)(C))->a37)))->z2[a1]);
	switch (t1) {
	case (T6)(T6)(GE_int32(1)):
		((T24*)(C))->a39 = ((T6)((((T24*)(C))->a39)+((T6)(GE_int32(1)))));
		t2 = (T6f2(&(((T24*)(C))->a39), ((T24*)(C))->a68));
		if (t2) {
			t2 = ((((T24*)(C))->a69)==(EIF_VOID));
			if (t2) {
				((T24*)(C))->a70 = T49c3();
				((T24*)(C))->a68 = (T6)(GE_int32(10));
				((T24*)(C))->a69 = (T49f1(GE_void(((T24*)(C))->a70), ((T24*)(C))->a68));
			} else {
				((T24*)(C))->a68 = ((T6)((((T24*)(C))->a68)+((T6)(GE_int32(10)))));
				((T24*)(C))->a69 = (T49f2(GE_void(((T24*)(C))->a70), ((T24*)(C))->a69, ((T24*)(C))->a68));
			}
		}
		((T48*)(GE_void(((T24*)(C))->a69)))->z2[((T24*)(C))->a39] = (((T24*)(C))->a71);
		break;
	case (T6)(T6)(GE_int32(2)):
		((T24*)(C))->a40 = ((T6)((((T24*)(C))->a40)+((T6)(GE_int32(1)))));
		t2 = (T6f2(&(((T24*)(C))->a40), ((T24*)(C))->a72));
		if (t2) {
			t2 = ((((T24*)(C))->a73)==(EIF_VOID));
			if (t2) {
				((T24*)(C))->a74 = T51c3();
				((T24*)(C))->a72 = (T6)(GE_int32(10));
				((T24*)(C))->a73 = (T51f1(GE_void(((T24*)(C))->a74), ((T24*)(C))->a72));
			} else {
				((T24*)(C))->a72 = ((T6)((((T24*)(C))->a72)+((T6)(GE_int32(10)))));
				((T24*)(C))->a73 = (T51f2(GE_void(((T24*)(C))->a74), ((T24*)(C))->a73, ((T24*)(C))->a72));
			}
		}
		((T50*)(GE_void(((T24*)(C))->a73)))->z2[((T24*)(C))->a40] = (((T24*)(C))->a75);
		break;
	default:
		T24f190(C);
		break;
	}
}

/* KL_SPECIAL_ROUTINES [STRING_8].make */
T0* T51f1(T0* C, T6 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T77c2(a1);
	R = (((T77*)(GE_void(l1)))->a1);
	return R;
}

/* TO_SPECIAL [STRING_8].make_area */
T0* T77c2(T6 a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T77));
	*(T77*)C = GE_default77;
	((T77*)(C))->a1 = T50c5(a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [STRING_8].default_create */
T0* T51c3(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T51));
	*(T51*)C = GE_default51;
	return C;
}

/* GEPP_PARSER.accept */
void T24f191(T0* C)
{
	((T24*)(C))->a1 = (T6)(GE_int32(101));
}

/* GEPP_PARSER.yy_do_error_action */
void T24f189(T0* C, T6 a1)
{
	switch (a1) {
	case (T6)(T6)(GE_int32(39)):
		T24f203(C);
		break;
	default:
		T24f204(C, GE_ms("parse error", 11));
		break;
	}
}

/* GEPP_PARSER.report_error */
void T24f204(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T0* t2;
	if ((((T24*)(C))->a11)==EIF_VOID) {
		l2 = EIF_VOID;
	} else {
		switch (((T0*)(((T24*)(C))->a11))->id) {
		case 43:
			l2 = ((T24*)(C))->a11;
			break;
		default:
			l2 = EIF_VOID;
		}
	}
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t2 = (((T43*)(GE_void(l2)))->a9);
		l3 = (((((T0*)(GE_void(t2)))->id==27)?((T27*)(t2))->a2:((T32*)(t2))->a3));
	} else {
		l3 = GE_ms("string", 6);
	}
	l1 = T55c7(l3, ((T24*)(C))->a9);
	T23f8(GE_void(((T24*)(C))->a2), l1);
}

/* UT_SYNTAX_ERROR.make */
T0* T55c7(T0* a1, T6 a2)
{
	T0* C;
	T0* t1;
	C = (T0*)GE_alloc(sizeof(T55));
	*(T55*)C = GE_default55;
	((T55*)(C))->a1 = T64c10((T6)(GE_int32(1)), (T6)(GE_int32(2)));
	T64f11(GE_void(((T55*)(C))->a1), a1, (T6)(GE_int32(1)));
	t1 = (T6f10(&a2));
	T64f11(GE_void(((T55*)(C))->a1), t1, (T6)(GE_int32(2)));
	return C;
}

/* GEPP_PARSER.report_eof_expected_error */
void T24f203(T0* C)
{
	T24f204(C, GE_ms("parse error", 11));
}

/* GEPP_PARSER.read_token */
void T24f188(T0* C)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T6 l6 = 0;
	T6 l7 = 0;
	T6 l8 = 0;
	T1 l9 = 0;
	T6 l10 = 0;
	T6 l11 = 0;
	T6 l12 = 0;
	T1 l13 = 0;
	T1 t1;
	T2 t2;
	T6 t3;
	((T24*)(C))->a28 = (T6)(GE_int32(-2));
	l7 = (T6)(GE_int32(1));
	t1 = ((((T24*)(C))->a28)!=((T6)(GE_int32(-2))));
	while (!(t1)) {
		switch (l7) {
		case (T6)(T6)(GE_int32(1)):
			if (((T24*)(C))->a42) {
				((T24*)(C))->a43 = ((T6)((((T24*)(C))->a12)-(((T24*)(C))->a38)));
				((T24*)(C))->a42 = EIF_FALSE;
			} else {
				((T24*)(C))->a43 = (T6)(GE_int32(0));
				((T24*)(C))->a44 = ((T24*)(C))->a14;
				((T24*)(C))->a45 = ((T24*)(C))->a15;
				((T24*)(C))->a46 = ((T24*)(C))->a13;
			}
			l1 = ((T24*)(C))->a12;
			l2 = l1;
			t1 = (((((T0*)(GE_void(((T24*)(C))->a11)))->id==43)?((T43*)(((T24*)(C))->a11))->a6:((T44*)(((T24*)(C))->a11))->a6));
			if (t1) {
				l3 = ((T6)((((T24*)(C))->a47)+((T6)(GE_int32(1)))));
			} else {
				l3 = ((T24*)(C))->a47;
			}
			if (EIF_FALSE) {
				((T45*)(GE_void(((T24*)(C))->a48)))->z2[(T6)(GE_int32(0))] = (l3);
				((T24*)(C))->a49 = (T6)(GE_int32(1));
			}
			l7 = (T6)(GE_int32(2));
			break;
		case (T6)(T6)(GE_int32(2)):
			l13 = EIF_FALSE;
			while (!(l13)) {
				t1 = ((((T24*)(C))->a50)!=(EIF_VOID));
				if (t1) {
					t1 = ((((T24*)(C))->a51)!=(EIF_VOID));
					if (t1) {
						t2 = (((T15*)(GE_void(((T24*)(C))->a51)))->z2[l1]);
						t3 = ((T6)(t2));
						l8 = (((T45*)(GE_void(((T24*)(C))->a50)))->z2[t3]);
					} else {
						t2 = (T85f3(GE_void(((T24*)(C))->a52), l1));
						t3 = ((T6)(t2));
						l8 = (((T45*)(GE_void(((T24*)(C))->a50)))->z2[t3]);
					}
				} else {
					t1 = ((((T24*)(C))->a51)!=(EIF_VOID));
					if (t1) {
						t2 = (((T15*)(GE_void(((T24*)(C))->a51)))->z2[l1]);
						l8 = ((T6)(t2));
					} else {
						t2 = (T85f3(GE_void(((T24*)(C))->a52), l1));
						l8 = ((T6)(t2));
					}
				}
				t1 = EIF_FALSE;
				t1 = ((T1)(!(t1)));
				if (t1) {
					t3 = (((T45*)(GE_void(((T24*)(C))->a53)))->z2[l3]);
					t1 = ((t3)!=((T6)(GE_int32(0))));
				}
				if (t1) {
					((T24*)(C))->a54 = l3;
					((T24*)(C))->a55 = l1;
				}
				t3 = (((T45*)(GE_void(((T24*)(C))->a57)))->z2[l3]);
				t3 = ((T6)((t3)+(l8)));
				t3 = (((T45*)(GE_void(((T24*)(C))->a56)))->z2[t3]);
				t1 = ((t3)==(l3));
				while (!(t1)) {
					l3 = (((T45*)(GE_void(((T24*)(C))->a58)))->z2[l3]);
					t1 = ((((T24*)(C))->a59)!=(EIF_VOID));
					if (t1) {
						t1 = (T6f2(&l3, (T6)(GE_int32(73))));
					}
					if (t1) {
						l8 = (((T45*)(GE_void(((T24*)(C))->a59)))->z2[l8]);
					}
					t3 = (((T45*)(GE_void(((T24*)(C))->a57)))->z2[l3]);
					t3 = ((T6)((t3)+(l8)));
					t3 = (((T45*)(GE_void(((T24*)(C))->a56)))->z2[t3]);
					t1 = ((t3)==(l3));
				}
				t3 = (((T45*)(GE_void(((T24*)(C))->a57)))->z2[l3]);
				t3 = ((T6)((t3)+(l8)));
				l3 = (((T45*)(GE_void(((T24*)(C))->a60)))->z2[t3]);
				if (EIF_FALSE) {
					((T45*)(GE_void(((T24*)(C))->a48)))->z2[((T24*)(C))->a49] = (l3);
					((T24*)(C))->a49 = ((T6)((((T24*)(C))->a49)+((T6)(GE_int32(1)))));
				}
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				l13 = ((l3)==((T6)(GE_int32(72))));
			}
			t1 = EIF_FALSE;
			t1 = ((T1)(!(t1)));
			if (t1) {
				l1 = ((T24*)(C))->a55;
				l3 = ((T24*)(C))->a54;
			}
			l7 = (T6)(GE_int32(3));
			break;
		case (T6)(T6)(GE_int32(3)):
			t1 = EIF_FALSE;
			t1 = ((T1)(!(t1)));
			if (t1) {
				l6 = (((T45*)(GE_void(((T24*)(C))->a53)))->z2[l3]);
				l7 = (T6)(GE_int32(4));
			} else {
				((T24*)(C))->a49 = ((T6)((((T24*)(C))->a49)-((T6)(GE_int32(1)))));
				l3 = (((T45*)(GE_void(((T24*)(C))->a48)))->z2[((T24*)(C))->a49]);
				((T24*)(C))->a61 = (((T45*)(GE_void(((T24*)(C))->a53)))->z2[l3]);
				l7 = (T6)(GE_int32(5));
			}
			break;
		case (T6)(T6)(GE_int32(5)):
			l9 = EIF_FALSE;
			while (!(l9)) {
				t1 = ((((T24*)(C))->a61)!=((T6)(GE_int32(0))));
				if (t1) {
					t3 = ((T6)((l3)+((T6)(GE_int32(1)))));
					t3 = (((T45*)(GE_void(((T24*)(C))->a53)))->z2[t3]);
					t1 = ((T1)((((T24*)(C))->a61)<(t3)));
				}
				if (t1) {
					l6 = ((GE_void(((T24*)(C))->a62), ((T24*)(C))->a61, (T6)0));
					if (EIF_FALSE) {
						t3 = (T6)(GE_int32(25));
						t3 = ((T6)(-(t3)));
						t1 = ((T1)((l6)<(t3)));
						if (!(t1)) {
							t1 = ((((T24*)(C))->a63)!=((T6)(GE_int32(0))));
						}
						if (t1) {
							t1 = ((l6)==(((T24*)(C))->a63));
							if (t1) {
								((T24*)(C))->a63 = (T6)(GE_int32(0));
								t3 = ((T6)(-(l6)));
								l6 = ((T6)((t3)-((T6)(GE_int32(25)))));
								l9 = EIF_TRUE;
							} else {
								((T24*)(C))->a61 = ((T6)((((T24*)(C))->a61)+((T6)(GE_int32(1)))));
							}
						} else {
							t1 = ((T1)((l6)<((T6)(GE_int32(0)))));
							if (t1) {
								((T24*)(C))->a63 = ((T6)((l6)-((T6)(GE_int32(25)))));
								if (EIF_FALSE) {
									((T24*)(C))->a64 = l1;
									((T24*)(C))->a65 = ((T24*)(C))->a49;
									((T24*)(C))->a66 = ((T24*)(C))->a61;
								}
								((T24*)(C))->a61 = ((T6)((((T24*)(C))->a61)+((T6)(GE_int32(1)))));
							} else {
								((T24*)(C))->a64 = l1;
								((T24*)(C))->a65 = ((T24*)(C))->a49;
								((T24*)(C))->a66 = ((T24*)(C))->a61;
								l9 = EIF_TRUE;
							}
						}
					} else {
						((T24*)(C))->a64 = l1;
						l9 = EIF_TRUE;
					}
				} else {
					l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
					((T24*)(C))->a49 = ((T6)((((T24*)(C))->a49)-((T6)(GE_int32(1)))));
					l3 = (((T45*)(GE_void(((T24*)(C))->a48)))->z2[((T24*)(C))->a49]);
					((T24*)(C))->a61 = (((T45*)(GE_void(((T24*)(C))->a53)))->z2[l3]);
				}
			}
			l10 = ((T24*)(C))->a14;
			l11 = ((T24*)(C))->a15;
			l12 = ((T24*)(C))->a13;
			l7 = (T6)(GE_int32(4));
			break;
		case (T6)(T6)(GE_int32(4)):
			l2 = ((T6)((l2)-(((T24*)(C))->a43)));
			((T24*)(C))->a38 = l2;
			((T24*)(C))->a12 = l1;
			l7 = (T6)(GE_int32(1));
			t1 = ((l6)==((T6)(GE_int32(0))));
			if (t1) {
				t1 = EIF_FALSE;
				t1 = ((T1)(!(t1)));
				if (t1) {
					l1 = ((T24*)(C))->a55;
					l2 = ((T6)((l2)+(((T24*)(C))->a43)));
					l3 = ((T24*)(C))->a54;
					l7 = (T6)(GE_int32(3));
				} else {
					((T24*)(C))->a28 = (T6)(GE_int32(-1));
					T24f199(C, GE_ms("fatal scanner internal error: no action found", 45));
				}
			} else {
				t1 = ((l6)==((T6)(GE_int32(26))));
				if (t1) {
					t3 = ((T6)((l1)-(l2)));
					l5 = ((T6)((t3)-((T6)(GE_int32(1)))));
					t3 = (((((T0*)(GE_void(((T24*)(C))->a11)))->id==43)?((T43*)(((T24*)(C))->a11))->a7:((T44*)(((T24*)(C))->a11))->a7));
					t3 = ((T6)((t3)+((T6)(GE_int32(1)))));
					t1 = (T6f6(&(((T24*)(C))->a12), t3));
					if (t1) {
						((T24*)(C))->a12 = ((T6)((l2)+(l5)));
						l3 = (T24f117(C));
						l4 = (T24f118(C, l3));
						l2 = ((T6)((l2)+(((T24*)(C))->a43)));
						t1 = ((l4)!=((T6)(GE_int32(0))));
						if (t1) {
							l1 = ((T6)((((T24*)(C))->a12)+((T6)(GE_int32(1)))));
							((T24*)(C))->a12 = l1;
							l3 = l4;
							l7 = (T6)(GE_int32(2));
						} else {
							if (EIF_FALSE) {
								l1 = ((T24*)(C))->a12;
								((T24*)(C))->a49 = ((T6)((((T24*)(C))->a49)-((T6)(GE_int32(1)))));
							} else {
								l1 = ((T24*)(C))->a55;
								l3 = ((T24*)(C))->a54;
							}
							l7 = (T6)(GE_int32(3));
						}
					} else {
						((T24*)(C))->a12 = ((T6)((((T24*)(C))->a12)-((T6)(GE_int32(1)))));
						T24f200(C);
						t1 = (((((T0*)(GE_void(((T24*)(C))->a11)))->id==43)?((T43*)(((T24*)(C))->a11))->a8:((T44*)(((T24*)(C))->a11))->a8));
						if (t1) {
							l3 = (T24f117(C));
							l1 = ((T24*)(C))->a12;
							l2 = ((T6)((((T24*)(C))->a38)+(((T24*)(C))->a43)));
							l7 = (T6)(GE_int32(2));
						} else {
							t3 = ((T6)((((T24*)(C))->a12)-(((T24*)(C))->a38)));
							t3 = ((T6)((t3)-(((T24*)(C))->a43)));
							t1 = ((t3)!=((T6)(GE_int32(0))));
							if (t1) {
								l3 = (T24f117(C));
								l1 = ((T24*)(C))->a12;
								l2 = ((T6)((((T24*)(C))->a38)+(((T24*)(C))->a43)));
								l7 = (T6)(GE_int32(3));
							} else {
								t1 = (T24f119(C));
								if (t1) {
									l2 = ((T24*)(C))->a38;
									l1 = ((T24*)(C))->a12;
									t3 = ((T6)((((T24*)(C))->a47)-((T6)(GE_int32(1)))));
									t3 = ((T6)((t3)/((T6)(GE_int32(2)))));
									T24f201(C, t3);
								}
							}
						}
					}
				} else {
					T24f202(C, l6);
					if (((T24*)(C))->a67) {
						((T24*)(C))->a67 = EIF_FALSE;
						((T24*)(C))->a14 = l10;
						((T24*)(C))->a15 = l11;
						((T24*)(C))->a13 = l12;
						l1 = ((T24*)(C))->a64;
						if (EIF_FALSE) {
							((T24*)(C))->a61 = ((T24*)(C))->a66;
							((T24*)(C))->a49 = ((T24*)(C))->a65;
							t3 = ((T6)((((T24*)(C))->a49)-((T6)(GE_int32(1)))));
							l3 = (((T45*)(GE_void(((T24*)(C))->a48)))->z2[t3]);
						}
						((T24*)(C))->a61 = ((T6)((((T24*)(C))->a61)+((T6)(GE_int32(1)))));
						l7 = (T6)(GE_int32(5));
					}
				}
			}
			break;
		default:
			break;
		}
		t1 = ((((T24*)(C))->a28)!=((T6)(GE_int32(-2))));
	}
}

/* GEPP_PARSER.yy_execute_action */
void T24f202(T0* C, T6 a1)
{
	T1 t1;
	T6 t2;
	T2 t3;
	t1 = (T6f6(&a1, (T6)(GE_int32(13))));
	if (t1) {
		t1 = (T6f6(&a1, (T6)(GE_int32(7))));
		if (t1) {
			t1 = (T6f6(&a1, (T6)(GE_int32(4))));
			if (t1) {
				t1 = (T6f6(&a1, (T6)(GE_int32(2))));
				if (t1) {
					t1 = ((a1)==((T6)(GE_int32(1))));
					if (t1) {
						T24f209(C, (T6)(GE_int32(3)));
						if (((T24*)(C))->a7) {
							if (((T0*)(GE_void(((T24*)(C))->a8)))->id==28) {
								T28f28(((T24*)(C))->a8);
							} else {
								T31f11(((T24*)(C))->a8);
							}
						}
					} else {
						((T24*)(C))->a28 = (T6)(GE_int32(258));
						T24f209(C, (T6)(GE_int32(1)));
						if (((T24*)(C))->a7) {
							if (((T0*)(GE_void(((T24*)(C))->a8)))->id==28) {
								T28f28(((T24*)(C))->a8);
							} else {
								T31f11(((T24*)(C))->a8);
							}
						}
					}
				} else {
					t1 = ((a1)==((T6)(GE_int32(3))));
					if (t1) {
						((T24*)(C))->a28 = (T6)(GE_int32(259));
						T24f209(C, (T6)(GE_int32(1)));
						if (((T24*)(C))->a7) {
							if (((T0*)(GE_void(((T24*)(C))->a8)))->id==28) {
								T28f28(((T24*)(C))->a8);
							} else {
								T31f11(((T24*)(C))->a8);
							}
						}
					} else {
						((T24*)(C))->a28 = (T6)(GE_int32(263));
						T24f209(C, (T6)(GE_int32(1)));
						if (((T24*)(C))->a7) {
							if (((T0*)(GE_void(((T24*)(C))->a8)))->id==28) {
								T28f28(((T24*)(C))->a8);
							} else {
								T31f11(((T24*)(C))->a8);
							}
						}
					}
				}
			} else {
				t1 = (T6f6(&a1, (T6)(GE_int32(6))));
				if (t1) {
					t1 = ((a1)==((T6)(GE_int32(5))));
					if (t1) {
						((T24*)(C))->a28 = (T6)(GE_int32(264));
						T24f209(C, (T6)(GE_int32(1)));
						if (((T24*)(C))->a7) {
							if (((T0*)(GE_void(((T24*)(C))->a8)))->id==28) {
								T28f28(((T24*)(C))->a8);
							} else {
								T31f11(((T24*)(C))->a8);
							}
						}
					} else {
						((T24*)(C))->a28 = (T6)(GE_int32(260));
						T24f209(C, (T6)(GE_int32(1)));
						if (((T24*)(C))->a7) {
							if (((T0*)(GE_void(((T24*)(C))->a8)))->id==28) {
								T28f28(((T24*)(C))->a8);
							} else {
								T31f11(((T24*)(C))->a8);
							}
						}
					}
				} else {
					((T24*)(C))->a28 = (T6)(GE_int32(261));
					T24f209(C, (T6)(GE_int32(1)));
					if (((T24*)(C))->a7) {
						if (((T0*)(GE_void(((T24*)(C))->a8)))->id==28) {
							T28f28(((T24*)(C))->a8);
						} else {
							T31f11(((T24*)(C))->a8);
						}
					}
				}
			}
		} else {
			t1 = (T6f6(&a1, (T6)(GE_int32(10))));
			if (t1) {
				t1 = (T6f6(&a1, (T6)(GE_int32(9))));
				if (t1) {
					t1 = ((a1)==((T6)(GE_int32(8))));
					if (t1) {
						((T24*)(C))->a28 = (T6)(GE_int32(262));
						T24f209(C, (T6)(GE_int32(1)));
						if (((T24*)(C))->a7) {
							if (((T0*)(GE_void(((T24*)(C))->a8)))->id==28) {
								T28f28(((T24*)(C))->a8);
							} else {
								T31f11(((T24*)(C))->a8);
							}
						}
					} else {
						T24f211(C);
						T24f209(C, (T6)(GE_int32(2)));
					}
				} else {
					T24f211(C);
					((T24*)(C))->a9 = ((T6)((((T24*)(C))->a9)+((T6)(GE_int32(1)))));
				}
			} else {
				t1 = (T6f6(&a1, (T6)(GE_int32(12))));
				if (t1) {
					t1 = ((a1)==((T6)(GE_int32(11))));
					if (t1) {
						T24f211(C);
						((T24*)(C))->a9 = ((T6)((((T24*)(C))->a9)+((T6)(GE_int32(1)))));
					} else {
						T24f211(C);
					}
				} else {
					T24f211(C);
					((T24*)(C))->a9 = ((T6)((((T24*)(C))->a9)+((T6)(GE_int32(1)))));
					T24f209(C, (T6)(GE_int32(0)));
				}
			}
		}
	} else {
		t1 = (T6f6(&a1, (T6)(GE_int32(19))));
		if (t1) {
			t1 = (T6f6(&a1, (T6)(GE_int32(16))));
			if (t1) {
				t1 = (T6f6(&a1, (T6)(GE_int32(15))));
				if (t1) {
					t1 = ((a1)==((T6)(GE_int32(14))));
					if (t1) {
						T24f211(C);
						T24f209(C, (T6)(GE_int32(0)));
					} else {
						((T24*)(C))->a9 = ((T6)((((T24*)(C))->a9)+((T6)(GE_int32(1)))));
						T24f209(C, (T6)(GE_int32(0)));
					}
				} else {
					T24f209(C, (T6)(GE_int32(0)));
				}
			} else {
				t1 = (T6f6(&a1, (T6)(GE_int32(18))));
				if (t1) {
					t1 = ((a1)==((T6)(GE_int32(17))));
					if (t1) {
					} else {
						((T24*)(C))->a28 = (T6)(GE_int32(267));
						t2 = (T24f150(C));
						t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
						((T24*)(C))->a75 = (T24f151(C, (T6)(GE_int32(2)), t2));
					}
				} else {
					((T24*)(C))->a28 = (T6)(GE_int32(266));
					((T24*)(C))->a75 = (T24f153(C));
				}
			}
		} else {
			t1 = (T6f6(&a1, (T6)(GE_int32(22))));
			if (t1) {
				t1 = (T6f6(&a1, (T6)(GE_int32(21))));
				if (t1) {
					t1 = ((a1)==((T6)(GE_int32(20))));
					if (t1) {
						((T24*)(C))->a28 = (T6)(GE_int32(269));
					} else {
						((T24*)(C))->a28 = (T6)(GE_int32(268));
					}
				} else {
					((T24*)(C))->a28 = (T6)(GE_int32(265));
					((T24*)(C))->a9 = ((T6)((((T24*)(C))->a9)+((T6)(GE_int32(1)))));
					T24f209(C, (T6)(GE_int32(0)));
				}
			} else {
				t1 = (T6f6(&a1, (T6)(GE_int32(24))));
				if (t1) {
					t1 = ((a1)==((T6)(GE_int32(23))));
					if (t1) {
						t3 = (T24f156(C, (T6)(GE_int32(1))));
						((T24*)(C))->a28 = ((T6)(t3));
					} else {
						t3 = (T24f156(C, (T6)(GE_int32(1))));
						((T24*)(C))->a28 = ((T6)(t3));
					}
				} else {
					((T24*)(C))->a28 = (T6)(GE_int32(-1));
					T24f199(C, GE_ms("scanner jammed", 14));
				}
			}
		}
	}
	T24f212(C);
}

/* GEPP_PARSER.yy_set_beginning_of_line */
void T24f212(T0* C)
{
	T1 t1;
	T6 t2;
	T2 t3;
	t1 = (T6f1(&(((T24*)(C))->a12), ((T24*)(C))->a38));
	if (t1) {
		t1 = ((((T24*)(C))->a51)!=(EIF_VOID));
		if (t1) {
			t2 = ((T6)((((T24*)(C))->a12)-((T6)(GE_int32(1)))));
			t3 = (((T15*)(GE_void(((T24*)(C))->a51)))->z2[t2]);
			t1 = ((t3)==((T2)('\n')));
			if (((T0*)(GE_void(((T24*)(C))->a11)))->id==43) {
				T43f20(((T24*)(C))->a11, t1);
			} else {
				T44f16(((T24*)(C))->a11, t1);
			}
		} else {
			t2 = ((T6)((((T24*)(C))->a12)-((T6)(GE_int32(1)))));
			t3 = (T85f3(GE_void(((T24*)(C))->a52), t2));
			t1 = ((t3)==((T2)('\n')));
			if (((T0*)(GE_void(((T24*)(C))->a11)))->id==43) {
				T43f20(((T24*)(C))->a11, t1);
			} else {
				T44f16(((T24*)(C))->a11, t1);
			}
		}
	}
}

/* YY_BUFFER.set_beginning_of_line */
void T44f16(T0* C, T1 a1)
{
	((T44*)(C))->a6 = a1;
}

/* YY_FILE_BUFFER.set_beginning_of_line */
void T43f20(T0* C, T1 a1)
{
	((T43*)(C))->a6 = a1;
}

/* GEPP_PARSER.text_item */
T2 T24f156(T0* C, T6 a1)
{
	T2 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((((T24*)(C))->a51)!=(EIF_VOID));
	if (t1) {
		t2 = ((T6)((((T24*)(C))->a38)+(a1)));
		t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
		R = (((T15*)(GE_void(((T24*)(C))->a51)))->z2[t2]);
	} else {
		t2 = ((T6)((((T24*)(C))->a38)+(a1)));
		t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
		R = (T85f3(GE_void(((T24*)(C))->a52), t2));
	}
	return R;
}

/* GEPP_PARSER.text */
T0* T24f153(T0* C)
{
	T0* R = 0;
	T1 t1;
	T6 t2;
	t1 = ((T1)((((T24*)(C))->a38)<(((T24*)(C))->a12)));
	if (t1) {
		t2 = ((T6)((((T24*)(C))->a12)-((T6)(GE_int32(1)))));
		R = (T85f6(GE_void(((T24*)(C))->a52), ((T24*)(C))->a38, t2));
	} else {
		R = T17c27((T6)(GE_int32(0)));
	}
	return R;
}

/* KL_CHARACTER_BUFFER.substring */
T0* T85f6(T0* C, T6 a1, T6 a2)
{
	T0* R = 0;
	T1 t1;
	T6 t2;
	T6 t3;
	t1 = ((T1)((a2)<(a1)));
	if (t1) {
		R = T17c27((T6)(GE_int32(0)));
	} else {
		t1 = ((((T85*)(C))->a1)!=(EIF_VOID));
		if (t1) {
			t2 = ((T6)((a1)+((T6)(GE_int32(1)))));
			t3 = ((T6)((a2)+((T6)(GE_int32(1)))));
			R = (T17f6(GE_void(((T85*)(C))->a2), t2, t3));
		} else {
			R = (T17f6(GE_void(((T85*)(C))->a2), a1, a2));
		}
	}
	return R;
}

/* GEPP_PARSER.text_substring */
T0* T24f151(T0* C, T6 a1, T6 a2)
{
	T0* R = 0;
	T1 t1;
	T6 t2;
	T6 t3;
	t1 = ((T1)((a2)<(a1)));
	if (t1) {
		R = T17c27((T6)(GE_int32(0)));
	} else {
		t2 = ((T6)((((T24*)(C))->a38)+(a1)));
		t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
		t3 = ((T6)((((T24*)(C))->a38)+(a2)));
		t3 = ((T6)((t3)-((T6)(GE_int32(1)))));
		R = (T85f6(GE_void(((T24*)(C))->a52), t2, t3));
	}
	return R;
}

/* GEPP_PARSER.text_count */
T6 T24f150(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T24*)(C))->a12)-(((T24*)(C))->a38)));
	return R;
}

/* GEPP_PARSER.echo */
void T24f211(T0* C)
{
	T1 t1;
	T0* t2;
	t1 = ((T1)(!(((T24*)(C))->a6)));
	if (t1) {
		t2 = (T24f153(C));
		T24f182(C, t2);
	}
}

/* GEPP_PARSER.set_start_condition */
void T24f209(T0* C, T6 a1)
{
	T6 t1;
	t1 = (T6)(GE_int32(2));
	t1 = ((T6)((t1)*(a1)));
	((T24*)(C))->a47 = ((T6)((t1)+((T6)(GE_int32(1)))));
}

/* GEPP_PARSER.yy_execute_eof_action */
void T24f201(T0* C, T6 a1)
{
	switch (a1) {
	case (T6)(T6)(GE_int32(1)):
		((T24*)(C))->a28 = (T6)(GE_int32(265));
		T24f209(C, (T6)(GE_int32(0)));
		break;
	default:
		T24f210(C);
		break;
	}
}

/* GEPP_PARSER.terminate */
void T24f210(T0* C)
{
	((T24*)(C))->a28 = (T6)(GE_int32(0));
}

/* GEPP_PARSER.wrap */
T1 T24f119(T0* C)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	T0* t2;
	t1 = (T42f6(GE_void(((T24*)(C))->a5)));
	t1 = ((T1)(!(t1)));
	if (t1) {
		if ((((T24*)(C))->a11)==EIF_VOID) {
			l1 = EIF_VOID;
		} else {
			switch (((T0*)(((T24*)(C))->a11))->id) {
			case 43:
				l1 = ((T24*)(C))->a11;
				break;
			default:
				l1 = EIF_VOID;
			}
		}
		t2 = (T42f7(GE_void(((T24*)(C))->a5)));
		T24f180(C, t2);
		((T24*)(C))->a9 = (T41f5(GE_void(((T24*)(C))->a4)));
		T41f8(GE_void(((T24*)(C))->a4));
		T42f10(GE_void(((T24*)(C))->a5));
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			l2 = (((T43*)(GE_void(l1)))->a9);
			t1 = (((((T0*)(GE_void(l2)))->id==27)?T27f25(l2):T32f8(l2)));
			if (t1) {
				if (((T0*)(GE_void(l2)))->id==27) {
					T27f38(l2);
				} else {
					T32f23(l2);
				}
			}
		}
		T24f209(C, (T6)(GE_int32(0)));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* KL_STDIN_FILE.close */
void T32f23(T0* C)
{
}

/* KL_STDIN_FILE.is_closable */
T1 T32f8(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* KL_TEXT_INPUT_FILE.is_closable */
T1 T27f25(T0* C)
{
	T1 R = 0;
	R = (T27f10(C));
	return R;
}

/* DS_ARRAYED_STACK [YY_BUFFER].remove */
void T42f10(T0* C)
{
	T0* l1 = 0;
	((T73*)(GE_void(((T42*)(C))->a3)))->z2[((T42*)(C))->a1] = (l1);
	((T42*)(C))->a1 = ((T6)((((T42*)(C))->a1)-((T6)(GE_int32(1)))));
}

/* DS_ARRAYED_STACK [INTEGER_32].remove */
void T41f8(T0* C)
{
	T6 l1 = 0;
	((T45*)(GE_void(((T41*)(C))->a1)))->z2[((T41*)(C))->a2] = (l1);
	((T41*)(C))->a2 = ((T6)((((T41*)(C))->a2)-((T6)(GE_int32(1)))));
}

/* DS_ARRAYED_STACK [INTEGER_32].item */
T6 T41f5(T0* C)
{
	T6 R = 0;
	R = (((T45*)(GE_void(((T41*)(C))->a1)))->z2[((T41*)(C))->a2]);
	return R;
}

/* DS_ARRAYED_STACK [YY_BUFFER].item */
T0* T42f7(T0* C)
{
	T0* R = 0;
	R = (((T73*)(GE_void(((T42*)(C))->a3)))->z2[((T42*)(C))->a1]);
	return R;
}

/* DS_ARRAYED_STACK [YY_BUFFER].is_empty */
T1 T42f6(T0* C)
{
	T1 R = 0;
	R = ((((T42*)(C))->a1)==((T6)(GE_int32(0))));
	return R;
}

/* GEPP_PARSER.yy_refill_input_buffer */
void T24f200(T0* C)
{
	T6 l1 = 0;
	T0* t1;
	T6 t2;
	if (((T0*)(GE_void(((T24*)(C))->a11)))->id==43) {
		T43f17(((T24*)(C))->a11, ((T24*)(C))->a38);
	} else {
		T44f13(((T24*)(C))->a11, ((T24*)(C))->a38);
	}
	if (((T0*)(GE_void(((T24*)(C))->a11)))->id==43) {
		T43f19(((T24*)(C))->a11);
	} else {
		T44f15(((T24*)(C))->a11);
	}
	t1 = (((((T0*)(GE_void(((T24*)(C))->a11)))->id==43)?((T43*)(((T24*)(C))->a11))->a1:((T44*)(((T24*)(C))->a11))->a1));
	T24f198(C, t1);
	l1 = (((((T0*)(GE_void(((T24*)(C))->a11)))->id==43)?((T43*)(((T24*)(C))->a11))->a2:((T44*)(((T24*)(C))->a11))->a2));
	t2 = ((T6)((((T24*)(C))->a12)-(((T24*)(C))->a38)));
	((T24*)(C))->a12 = ((T6)((t2)+(l1)));
	((T24*)(C))->a38 = l1;
}

/* GEPP_PARSER.yy_set_content */
void T24f198(T0* C, T0* a1)
{
	T6 l1 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	((T24*)(C))->a52 = a1;
	((T24*)(C))->a51 = (((T85*)(GE_void(a1)))->a1);
	if (EIF_FALSE) {
		t1 = (T85f4(GE_void(a1)));
		l1 = ((T6)((t1)+((T6)(GE_int32(1)))));
		t1 = (((T45*)(GE_void(((T24*)(C))->a48)))->z1);
		t2 = ((T1)((t1)<(l1)));
		if (t2) {
			t3 = (T24f112(C));
			((T24*)(C))->a48 = (T46f2(GE_void(t3), ((T24*)(C))->a48, l1));
		}
	}
}

/* KL_CHARACTER_BUFFER.count */
T6 T85f4(T0* C)
{
	T6 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((((T85*)(C))->a1)!=(EIF_VOID));
	if (t1) {
		t2 = (((T17*)(GE_void(((T85*)(C))->a2)))->a2);
		R = ((T6)((t2)-((T6)(GE_int32(1)))));
	} else {
		R = (((T17*)(GE_void(((T85*)(C))->a2)))->a2);
	}
	return R;
}

/* YY_BUFFER.fill */
void T44f15(T0* C)
{
	((T44*)(C))->a8 = EIF_FALSE;
}

/* YY_FILE_BUFFER.fill */
void T43f19(T0* C)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T2 t2;
	T6 t3;
	if (((T43*)(C))->a8) {
		t1 = ((T1)(!(((T43*)(C))->a10)));
	} else {
		t1 = EIF_FALSE;
	}
	if (t1) {
		T43f22(C);
		l3 = ((T43*)(C))->a1;
		l1 = ((T6)((((T43*)(C))->a11)-(((T43*)(C))->a7)));
		if (((T43*)(C))->a12) {
			if (((T0*)(GE_void(((T43*)(C))->a9)))->id==27) {
				T27f44(((T43*)(C))->a9);
			} else {
				T32f24(((T43*)(C))->a9);
			}
			t1 = (((((T0*)(GE_void(((T43*)(C))->a9)))->id==27)?T27f24(((T43*)(C))->a9):((T32*)(((T43*)(C))->a9))->a1));
			t1 = ((T1)(!(t1)));
			if (t1) {
				((T43*)(C))->a7 = ((T6)((((T43*)(C))->a7)+((T6)(GE_int32(1)))));
				t2 = (((((T0*)(GE_void(((T43*)(C))->a9)))->id==27)?((T27*)(((T43*)(C))->a9))->a8:((T32*)(((T43*)(C))->a9))->a5));
				T85f9(GE_void(l3), t2, ((T43*)(C))->a7);
				((T43*)(C))->a8 = EIF_TRUE;
			} else {
				((T43*)(C))->a8 = EIF_FALSE;
				((T43*)(C))->a10 = EIF_TRUE;
			}
		} else {
			t3 = ((T6)((((T43*)(C))->a7)+((T6)(GE_int32(1)))));
			l2 = (T85f5(GE_void(l3), ((T43*)(C))->a9, t3, l1));
			t1 = ((T1)((l2)<(l1)));
			if (t1) {
				((T43*)(C))->a10 = (((((T0*)(GE_void(((T43*)(C))->a9)))->id==27)?T27f24(((T43*)(C))->a9):((T32*)(((T43*)(C))->a9))->a1));
			}
			t1 = (T6f1(&l2, (T6)(GE_int32(0))));
			if (t1) {
				((T43*)(C))->a8 = EIF_TRUE;
			} else {
				((T43*)(C))->a8 = EIF_FALSE;
			}
			((T43*)(C))->a7 = ((T6)((((T43*)(C))->a7)+(l2)));
		}
		t3 = ((T6)((((T43*)(C))->a7)+((T6)(GE_int32(1)))));
		T85f9(GE_void(l3), (T2)('\000'), t3);
		t3 = ((T6)((((T43*)(C))->a7)+((T6)(GE_int32(2)))));
		T85f9(GE_void(l3), (T2)('\000'), t3);
	} else {
		((T43*)(C))->a8 = EIF_FALSE;
	}
}

/* KL_CHARACTER_BUFFER.fill_from_stream */
T6 T85f5(T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((((T85*)(C))->a1)!=(EIF_VOID));
	if (t1) {
		t2 = ((T6)((a2)+((T6)(GE_int32(1)))));
		R = (((((T0*)(GE_void(a1)))->id==27)?T27f30(a1, ((T85*)(C))->a2, t2, a3):T32f14(a1, ((T85*)(C))->a2, t2, a3)));
	} else {
		R = (((((T0*)(GE_void(a1)))->id==27)?T27f30(a1, ((T85*)(C))->a2, a2, a3):T32f14(a1, ((T85*)(C))->a2, a2, a3)));
	}
	return R;
}

/* KL_STDIN_FILE.read_to_string */
T6 T32f14(T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T0* l5 = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	T6 t4;
	l2 = a2;
	t1 = ((l1)==(a3));
	if (!(t1)) {
		t1 = ((((T32*)(C))->a6)==(EIF_VOID));
	}
	while (!(t1)) {
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t2 = ((GE_void(((T32*)(C))->a6), (T2)0));
		T17f41(GE_void(a1), t2, l2);
		((T32*)(C))->a6 = ((GE_void(((T32*)(C))->a6), (T0*)0));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t1 = ((l1)==(a3));
		if (!(t1)) {
			t1 = ((((T32*)(C))->a6)==(EIF_VOID));
		}
	}
	t1 = ((T1)((l1)<(a3)));
	if (t1) {
		t1 = (T32f11(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T32f15(C));
			t1 = (T81f1(GE_void(t3), a1, ge404ov3525));
			if (t1) {
				t4 = ((T6)((a3)-(l1)));
				t4 = (T32f17(C, a1, l2, t4));
				R = ((T6)((l1)+(t4)));
			} else {
				l4 = ((T6)((a3)-(l1)));
				l5 = T17c27(l4);
				T17f28(GE_void(l5), l4);
				l4 = (T32f17(C, l5, (T6)(GE_int32(1)), l4));
				l3 = (T6)(GE_int32(1));
				t1 = (T6f1(&l3, l4));
				while (!(t1)) {
					t2 = (T17f5(GE_void(l5), l3));
					T17f41(GE_void(a1), t2, l2);
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
					l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
					t1 = (T6f1(&l3, l4));
				}
				R = ((T6)((l1)+(l4)));
			}
		} else {
			R = l1;
		}
		((T32*)(C))->a1 = (T32f11(C));
	} else {
		R = l1;
	}
	return R;
}

/* KL_STDIN_FILE.old_read_to_string */
T6 T32f17(T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 R = 0;
	T0* t1;
	T6 t2;
	T14 t3;
	t1 = (((T17*)(GE_void(a1)))->a1);
	t2 = ((T6)((a2)-((T6)(GE_int32(1)))));
	t3 = (T15f5(GE_void(t1), t2));
	R = (T32f18(C, ((T32*)(C))->a2, t3, a3));
	return R;
}

/* KL_STDIN_FILE.file_gss */
T6 T32f18(T0* C, T14 a1, T14 a2, T6 a3)
{
	T6 R = 0;
	R = (T6)(EIF_INTEGER )file_gss((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
	return R;
}

/* SPECIAL [CHARACTER_8].item_address */
T14 T15f5(T0* C, T6 a1)
{
	T14 R = 0;
	T86 t1;
	T6 t2;
	(t1).id = 86;
	(t1).a1 = (T14)(((T15*)(C))->z2);
	R = ((t1).a1);
	t2 = (sizeof(T2));
	t2 = ((T6)((a1)*(t2)));
	R = ((T14)(((char*)(R))+(t2)));
	return R;
}

/* KL_STDIN_FILE.any_ */
T0* T32f15(T0* C)
{
	T0* R = 0;
	if (ge265os2070) {
		return ge265ov2070;
	} else {
		ge265os2070 = '\1';
	}
	R = T81c3();
	ge265ov2070 = R;
	return R;
}

/* KL_STDIN_FILE.old_end_of_file */
T1 T32f11(T0* C)
{
	T1 R = 0;
	R = (T32f13(C, ((T32*)(C))->a2));
	return R;
}

/* KL_STDIN_FILE.console_eof */
T1 T32f13(T0* C, T14 a1)
{
	T1 R = 0;
	R = (T1)EIF_TEST((EIF_BOOLEAN )console_eof((FILE *)a1));
	return R;
}

/* STRING_8.put */
void T17f41(T0* C, T2 a1, T6 a2)
{
	T6 t1;
	t1 = ((T6)((a2)-((T6)(GE_int32(1)))));
	((T15*)(GE_void(((T17*)(C))->a1)))->z2[t1] = (a1);
	((T17*)(C))->a3 = (T6)(GE_int32(0));
}

/* KL_TEXT_INPUT_FILE.read_to_string */
T6 T27f30(T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	T6 t4;
	T0* t5;
	l1 = a2;
	t1 = ((l5)==(a3));
	if (!(t1)) {
		t1 = ((((T27*)(C))->a4)==(EIF_VOID));
	}
	while (!(t1)) {
		l5 = ((T6)((l5)+((T6)(GE_int32(1)))));
		t2 = ((GE_void(((T27*)(C))->a4), (T2)0));
		T17f41(GE_void(a1), t2, l1);
		((T27*)(C))->a4 = ((GE_void(((T27*)(C))->a4), (T0*)0));
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t1 = ((l5)==(a3));
		if (!(t1)) {
			t1 = ((((T27*)(C))->a4)==(EIF_VOID));
		}
	}
	t1 = ((T1)((l5)<(a3)));
	if (t1) {
		t1 = (T27f27(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T27f31(C));
			t1 = (T81f1(GE_void(t3), a1, ge391ov2198));
			if (t1) {
				t4 = ((T6)((a3)-(l5)));
				t4 = (T27f33(C, a1, l1, t4));
				l5 = ((T6)((l5)+(t4)));
			} else {
				t3 = (T27f31(C));
				t5 = (T27f34(C));
				t1 = (T81f1(GE_void(t3), a1, t5));
				if (t1) {
					t4 = ((T6)((a3)-(l5)));
					t4 = (T27f33(C, a1, l1, t4));
					l5 = ((T6)((l5)+(t4)));
				} else {
					l4 = ((T6)((a3)-(l5)));
					l2 = T17c27(l4);
					T17f28(GE_void(l2), l4);
					l4 = (T27f33(C, l2, (T6)(GE_int32(1)), l4));
					l3 = (T6)(GE_int32(1));
					t1 = (T6f1(&l3, l4));
					while (!(t1)) {
						t2 = (T17f5(GE_void(l2), l3));
						T17f41(GE_void(a1), t2, l1);
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
						t1 = (T6f1(&l3, l4));
					}
					l5 = ((T6)((l5)+(l4)));
				}
			}
		}
		((T27*)(C))->a5 = (T27f27(C));
	}
	R = l5;
	return R;
}

/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
unsigned char ge391os2199 = '\0';
T0* ge391ov2199;
T0* T27f34(T0* C)
{
	T0* R = 0;
	if (ge391os2199) {
		return ge391ov2199;
	} else {
		ge391os2199 = '\1';
	}
	R = T85c8((T6)(GE_int32(0)));
	ge391ov2199 = R;
	return R;
}

/* KL_CHARACTER_BUFFER.make */
T0* T85c8(T6 a1)
{
	T0* C;
	T0* t1;
	T1 t2;
	T6 t3;
	C = (T0*)GE_alloc(sizeof(T85));
	*(T85*)C = GE_default85;
	t1 = (T85f7(C));
	t2 = (T67f6(GE_void(t1)));
	t2 = ((T1)(!(t2)));
	if (t2) {
		t3 = ((T6)((a1)+((T6)(GE_int32(1)))));
		((T85*)(C))->a2 = T17c27(t3);
		t3 = ((T6)((a1)+((T6)(GE_int32(1)))));
		T17f28(GE_void(((T85*)(C))->a2), t3);
		((T85*)(C))->a1 = (((T17*)(GE_void(((T85*)(C))->a2)))->a1);
	} else {
		((T85*)(C))->a2 = T17c27(a1);
		T17f28(GE_void(((T85*)(C))->a2), a1);
	}
	return C;
}

/* KL_OPERATING_SYSTEM.is_dotnet */
unsigned char ge397os3230 = '\0';
T1 ge397ov3230;
T1 T67f6(T0* C)
{
	T1 R = 0;
	T0* l1 = 0;
	if (ge397os3230) {
		return ge397ov3230;
	} else {
		ge397os3230 = '\1';
	}
	l1 = T97c2();
	R = (EIF_FALSE);
	ge397ov3230 = R;
	return R;
}

/* PLATFORM.default_create */
T0* T97c2(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T97));
	*(T97*)C = GE_default97;
	return C;
}

/* KL_CHARACTER_BUFFER.operating_system */
unsigned char ge323os2237 = '\0';
T0* ge323ov2237;
T0* T85f7(T0* C)
{
	T0* R = 0;
	if (ge323os2237) {
		return ge323ov2237;
	} else {
		ge323os2237 = '\1';
	}
	R = T67c7();
	ge323ov2237 = R;
	return R;
}

/* KL_OPERATING_SYSTEM.default_create */
T0* T67c7(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T67));
	*(T67*)C = GE_default67;
	return C;
}

/* KL_TEXT_INPUT_FILE.old_read_to_string */
T6 T27f33(T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 R = 0;
	T0* t1;
	T6 t2;
	T14 t3;
	t1 = (((T17*)(GE_void(a1)))->a1);
	t2 = ((T6)((a2)-((T6)(GE_int32(1)))));
	t3 = (T15f5(GE_void(t1), t2));
	R = (T27f35(C, ((T27*)(C))->a6, t3, a3));
	return R;
}

/* KL_TEXT_INPUT_FILE.file_gss */
T6 T27f35(T0* C, T14 a1, T14 a2, T6 a3)
{
	T6 R = 0;
	R = (T6)(EIF_INTEGER )file_gss((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
	return R;
}

/* KL_TEXT_INPUT_FILE.any_ */
T0* T27f31(T0* C)
{
	T0* R = 0;
	if (ge265os2070) {
		return ge265ov2070;
	} else {
		ge265os2070 = '\1';
	}
	R = T81c3();
	ge265ov2070 = R;
	return R;
}

/* KL_TEXT_INPUT_FILE.old_end_of_file */
T1 T27f27(T0* C)
{
	T1 R = 0;
	R = (T27f29(C, ((T27*)(C))->a6));
	return R;
}

/* KL_TEXT_INPUT_FILE.file_feof */
T1 T27f29(T0* C, T14 a1)
{
	T1 R = 0;
	R = (T1)EIF_TEST((EIF_BOOLEAN )file_feof((FILE *)a1));
	return R;
}

/* KL_CHARACTER_BUFFER.put */
void T85f9(T0* C, T2 a1, T6 a2)
{
	T1 t1;
	t1 = ((((T85*)(C))->a1)!=(EIF_VOID));
	if (t1) {
		((T15*)(GE_void(((T85*)(C))->a1)))->z2[a2] = (a1);
	} else {
		T17f41(GE_void(((T85*)(C))->a2), a1, a2);
	}
}

/* KL_TEXT_INPUT_FILE.end_of_input */
T1 T27f24(T0* C)
{
	T1 R = 0;
	R = ((T27*)(C))->a5;
	return R;
}

/* KL_STDIN_FILE.read_character */
void T32f24(T0* C)
{
	T1 t1;
	t1 = ((((T32*)(C))->a6)!=(EIF_VOID));
	if (t1) {
		((T32*)(C))->a5 = ((GE_void(((T32*)(C))->a6), (T2)0));
		((T32*)(C))->a6 = ((GE_void(((T32*)(C))->a6), (T0*)0));
	} else {
		t1 = (T32f11(C));
		if (t1) {
			((T32*)(C))->a1 = EIF_TRUE;
		} else {
			T32f25(C);
			((T32*)(C))->a1 = (T32f11(C));
		}
	}
}

/* KL_STDIN_FILE.old_read_character */
void T32f25(T0* C)
{
	((T32*)(C))->a5 = (T32f12(C, ((T32*)(C))->a2));
}

/* KL_STDIN_FILE.console_readchar */
T2 T32f12(T0* C, T14 a1)
{
	T2 R = 0;
	R = (T2)(EIF_CHARACTER )console_readchar((FILE *)a1);
	return R;
}

/* KL_TEXT_INPUT_FILE.read_character */
void T27f44(T0* C)
{
	T1 t1;
	t1 = ((((T27*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		((T27*)(C))->a8 = ((GE_void(((T27*)(C))->a4), (T2)0));
		((T27*)(C))->a4 = ((GE_void(((T27*)(C))->a4), (T0*)0));
	} else {
		t1 = (T27f27(C));
		if (t1) {
			((T27*)(C))->a5 = EIF_TRUE;
		} else {
			T27f45(C);
			((T27*)(C))->a5 = (T27f27(C));
		}
	}
}

/* KL_TEXT_INPUT_FILE.old_read_character */
void T27f45(T0* C)
{
	((T27*)(C))->a8 = (T27f28(C, ((T27*)(C))->a6));
}

/* KL_TEXT_INPUT_FILE.file_gc */
T2 T27f28(T0* C, T14 a1)
{
	T2 R = 0;
	R = (T2)(EIF_CHARACTER )file_gc((FILE *)a1);
	return R;
}

/* YY_FILE_BUFFER.compact_left */
void T43f22(T0* C)
{
	T6 l1 = 0;
	T6 t1;
	T1 t2;
	t1 = ((T6)((((T43*)(C))->a7)-(((T43*)(C))->a2)));
	l1 = ((T6)((t1)+((T6)(GE_int32(1)))));
	t2 = (T6f2(&l1, ((T43*)(C))->a11));
	if (t2) {
		T43f24(C);
	}
	t2 = ((((T43*)(C))->a2)!=((T6)(GE_int32(1))));
	if (t2) {
		t1 = ((T6)((l1)+((T6)(GE_int32(2)))));
		T85f10(GE_void(((T43*)(C))->a1), ((T43*)(C))->a2, (T6)(GE_int32(1)), t1);
		((T43*)(C))->a2 = (T6)(GE_int32(1));
		((T43*)(C))->a7 = l1;
	}
}

/* KL_CHARACTER_BUFFER.move_left */
void T85f10(T0* C, T6 a1, T6 a2, T6 a3)
{
	T1 t1;
	T6 t2;
	T6 t3;
	T6 t4;
	t1 = (T6f1(&a3, (T6)(GE_int32(0))));
	if (t1) {
		t1 = ((((T85*)(C))->a1)!=(EIF_VOID));
		if (t1) {
			t2 = ((T6)((a1)+((T6)(GE_int32(1)))));
			t3 = ((T6)((a1)+(a3)));
			t4 = ((T6)((a2)+((T6)(GE_int32(1)))));
			T17f42(GE_void(((T85*)(C))->a2), ((T85*)(C))->a2, t2, t3, t4);
		} else {
			t2 = ((T6)((a1)+(a3)));
			t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
			T17f42(GE_void(((T85*)(C))->a2), ((T85*)(C))->a2, a1, t2, a2);
		}
	}
}

/* STRING_8.subcopy */
void T17f42(T0* C, T0* a1, T6 a2, T6 a3, T6 a4)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	T6 t2;
	T6 t3;
	T6 t4;
	l1 = (((T17*)(GE_void(a1)))->a1);
	l2 = ((T17*)(C))->a1;
	t1 = (T6f2(&a3, a2));
	if (t1) {
		t1 = ((l2)!=(l1));
		if (t1) {
			t2 = ((T6)((a2)-((T6)(GE_int32(1)))));
			t3 = ((T6)((a4)-((T6)(GE_int32(1)))));
			t4 = ((T6)((a3)-(a2)));
			t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
			T15f8(GE_void(l2), l1, t2, t3, t4);
		} else {
			t2 = ((T6)((a2)-((T6)(GE_int32(1)))));
			t3 = ((T6)((a4)-((T6)(GE_int32(1)))));
			t4 = ((T6)((a3)-(a2)));
			t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
			T15f12(GE_void(l2), t2, t3, t4);
		}
		((T17*)(C))->a3 = (T6)(GE_int32(0));
	}
}

/* YY_FILE_BUFFER.resize */
void T43f24(T0* C)
{
	T1 t1;
	T6 t2;
	T6 t3;
	t1 = ((((T43*)(C))->a11)==((T6)(GE_int32(0))));
	if (t1) {
		((T43*)(C))->a11 = (T43f13(C));
	} else {
		((T43*)(C))->a11 = ((T6)((((T43*)(C))->a11)*((T6)(GE_int32(2)))));
	}
	t2 = ((T6)((((T43*)(C))->a11)+((T6)(GE_int32(2)))));
	t3 = (T85f4(GE_void(((T43*)(C))->a1)));
	t1 = (T6f1(&t2, t3));
	if (t1) {
		t2 = ((T6)((((T43*)(C))->a11)+((T6)(GE_int32(2)))));
		T85f11(GE_void(((T43*)(C))->a1), t2);
	}
}

/* KL_CHARACTER_BUFFER.resize */
void T85f11(T0* C, T6 a1)
{
	T1 t1;
	T6 t2;
	t1 = ((((T85*)(C))->a1)!=(EIF_VOID));
	if (t1) {
		t2 = ((T6)((a1)+((T6)(GE_int32(1)))));
		T17f36(GE_void(((T85*)(C))->a2), t2);
		t2 = ((T6)((a1)+((T6)(GE_int32(1)))));
		T17f28(GE_void(((T85*)(C))->a2), t2);
		((T85*)(C))->a1 = (((T17*)(GE_void(((T85*)(C))->a2)))->a1);
	} else {
		T17f36(GE_void(((T85*)(C))->a2), a1);
		T17f28(GE_void(((T85*)(C))->a2), a1);
	}
}

/* YY_FILE_BUFFER.default_capacity */
unsigned char ge139os4041 = '\0';
T6 ge139ov4041;
T6 T43f13(T0* C)
{
	T6 R = 0;
	if (ge139os4041) {
		return ge139ov4041;
	} else {
		ge139os4041 = '\1';
	}
	R = (T6)(GE_int32(16384));
	ge139ov4041 = R;
	return R;
}

/* YY_BUFFER.set_index */
void T44f13(T0* C, T6 a1)
{
	((T44*)(C))->a2 = a1;
}

/* YY_FILE_BUFFER.set_index */
void T43f17(T0* C, T6 a1)
{
	((T43*)(C))->a2 = a1;
}

/* GEPP_PARSER.yy_null_trans_state */
T6 T24f118(T0* C, T6 a1)
{
	T6 R = 0;
	T6 l1 = 0;
	T1 l2 = 0;
	T1 t1;
	T6 t2;
	t1 = EIF_FALSE;
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (((T45*)(GE_void(((T24*)(C))->a53)))->z2[a1]);
		t1 = ((t2)!=((T6)(GE_int32(0))));
		if (t1) {
			((T24*)(C))->a54 = a1;
			((T24*)(C))->a55 = ((T24*)(C))->a12;
		}
	}
	R = a1;
	l1 = (T6)(GE_int32(1));
	t2 = (((T45*)(GE_void(((T24*)(C))->a57)))->z2[R]);
	t2 = ((T6)((t2)+(l1)));
	t2 = (((T45*)(GE_void(((T24*)(C))->a56)))->z2[t2]);
	t1 = ((t2)==(R));
	while (!(t1)) {
		R = (((T45*)(GE_void(((T24*)(C))->a58)))->z2[R]);
		t1 = ((((T24*)(C))->a59)!=(EIF_VOID));
		if (t1) {
			t1 = (T6f2(&R, (T6)(GE_int32(73))));
		}
		if (t1) {
			l1 = (((T45*)(GE_void(((T24*)(C))->a59)))->z2[l1]);
		}
		t2 = (((T45*)(GE_void(((T24*)(C))->a57)))->z2[R]);
		t2 = ((T6)((t2)+(l1)));
		t2 = (((T45*)(GE_void(((T24*)(C))->a56)))->z2[t2]);
		t1 = ((t2)==(R));
	}
	t2 = (((T45*)(GE_void(((T24*)(C))->a57)))->z2[R]);
	t2 = ((T6)((t2)+(l1)));
	R = (((T45*)(GE_void(((T24*)(C))->a60)))->z2[t2]);
	if (EIF_FALSE) {
		((T45*)(GE_void(((T24*)(C))->a48)))->z2[((T24*)(C))->a49] = (R);
		((T24*)(C))->a49 = ((T6)((((T24*)(C))->a49)+((T6)(GE_int32(1)))));
	}
	l2 = ((R)==((T6)(GE_int32(72))));
	if (l2) {
		R = (T6)(GE_int32(0));
	}
	return R;
}

/* GEPP_PARSER.yy_previous_state */
T6 T24f117(T0* C)
{
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T2 t2;
	T6 t3;
	t1 = (((((T0*)(GE_void(((T24*)(C))->a11)))->id==43)?((T43*)(((T24*)(C))->a11))->a6:((T44*)(((T24*)(C))->a11))->a6));
	if (t1) {
		R = ((T6)((((T24*)(C))->a47)+((T6)(GE_int32(1)))));
	} else {
		R = ((T24*)(C))->a47;
	}
	if (EIF_FALSE) {
		((T45*)(GE_void(((T24*)(C))->a48)))->z2[(T6)(GE_int32(0))] = (R);
		((T24*)(C))->a49 = (T6)(GE_int32(1));
	}
	l1 = ((T6)((((T24*)(C))->a38)+(((T24*)(C))->a43)));
	l2 = ((T24*)(C))->a12;
	t1 = (T6f2(&l1, l2));
	while (!(t1)) {
		t1 = ((((T24*)(C))->a51)!=(EIF_VOID));
		if (t1) {
			t2 = (((T15*)(GE_void(((T24*)(C))->a51)))->z2[l1]);
			l3 = ((T6)(t2));
		} else {
			t2 = (T85f3(GE_void(((T24*)(C))->a52), l1));
			l3 = ((T6)(t2));
		}
		t1 = ((l3)==((T6)(GE_int32(0))));
		if (t1) {
			l3 = (T6)(GE_int32(1));
		} else {
			t1 = ((((T24*)(C))->a50)!=(EIF_VOID));
			if (t1) {
				l3 = (((T45*)(GE_void(((T24*)(C))->a50)))->z2[l3]);
			}
		}
		t1 = EIF_FALSE;
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (((T45*)(GE_void(((T24*)(C))->a53)))->z2[R]);
			t1 = ((t3)!=((T6)(GE_int32(0))));
			if (t1) {
				((T24*)(C))->a54 = R;
				((T24*)(C))->a55 = l1;
			}
		}
		t3 = (((T45*)(GE_void(((T24*)(C))->a57)))->z2[R]);
		t3 = ((T6)((t3)+(l3)));
		t3 = (((T45*)(GE_void(((T24*)(C))->a56)))->z2[t3]);
		t1 = ((t3)==(R));
		while (!(t1)) {
			R = (((T45*)(GE_void(((T24*)(C))->a58)))->z2[R]);
			t1 = ((((T24*)(C))->a59)!=(EIF_VOID));
			if (t1) {
				t1 = (T6f2(&R, (T6)(GE_int32(73))));
			}
			if (t1) {
				l3 = (((T45*)(GE_void(((T24*)(C))->a59)))->z2[l3]);
			}
			t3 = (((T45*)(GE_void(((T24*)(C))->a57)))->z2[R]);
			t3 = ((T6)((t3)+(l3)));
			t3 = (((T45*)(GE_void(((T24*)(C))->a56)))->z2[t3]);
			t1 = ((t3)==(R));
		}
		t3 = (((T45*)(GE_void(((T24*)(C))->a57)))->z2[R]);
		t3 = ((T6)((t3)+(l3)));
		R = (((T45*)(GE_void(((T24*)(C))->a60)))->z2[t3]);
		if (EIF_FALSE) {
			((T45*)(GE_void(((T24*)(C))->a48)))->z2[((T24*)(C))->a49] = (R);
			((T24*)(C))->a49 = ((T6)((((T24*)(C))->a49)+((T6)(GE_int32(1)))));
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t1 = (T6f2(&l1, l2));
	}
	return R;
}

/* GEPP_PARSER.fatal_error */
void T24f199(T0* C, T0* a1)
{
	T0* l1 = 0;
	l1 = T54c7(a1);
	T23f8(GE_void(((T24*)(C))->a2), l1);
}

/* UT_MESSAGE.make */
T0* T54c7(T0* a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T54));
	*(T54*)C = GE_default54;
	((T54*)(C))->a1 = T64c10((T6)(GE_int32(1)), (T6)(GE_int32(1)));
	T64f11(GE_void(((T54*)(C))->a1), a1, (T6)(GE_int32(1)));
	return C;
}

/* KL_CHARACTER_BUFFER.item */
T2 T85f3(T0* C, T6 a1)
{
	T2 R = 0;
	T1 t1;
	t1 = ((((T85*)(C))->a1)!=(EIF_VOID));
	if (t1) {
		R = (((T15*)(GE_void(((T85*)(C))->a1)))->z2[a1]);
	} else {
		R = (T17f5(GE_void(((T85*)(C))->a2), a1));
	}
	return R;
}

/* KL_SPECIAL_ROUTINES [INTEGER_32].resize */
T0* T46f2(T0* C, T0* a1, T6 a2)
{
	T0* R = 0;
	T6 t1;
	T1 t2;
	t1 = (((T45*)(GE_void(a1)))->z1);
	t2 = (T6f1(&a2, t1));
	if (t2) {
		R = (T45f3(GE_void(a1), a2));
	} else {
		R = a1;
	}
	return R;
}

/* SPECIAL [INTEGER_32].resized_area */
T0* T45f3(T0* C, T6 a1)
{
	T0* R = 0;
	T6 t1;
	R = T45c4(a1);
	t1 = (((T45*)(C))->z1);
	T45f6(GE_void(R), C, (T6)(GE_int32(0)), (T6)(GE_int32(0)), t1);
	return R;
}

/* SPECIAL [INTEGER_32].copy_data */
void T45f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T6 t2;
	t1 = ((a1)==(C));
	if (t1) {
		T45f7(C, a2, a3, a4);
	} else {
		l1 = a2;
		l2 = a3;
		l3 = ((T6)((a2)+(a4)));
		t1 = ((l1)==(l3));
		while (!(t1)) {
			t2 = (((T45*)(a1))->z2[l1]);
			((T45*)(C))->z2[l2] = (t2);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			t1 = ((l1)==(l3));
		}
	}
}

/* SPECIAL [INTEGER_32].move_data */
void T45f7(T0* C, T6 a1, T6 a2, T6 a3)
{
	T1 t1;
	T6 t2;
	t1 = ((a1)==(a2));
	if (t1) {
	} else {
		t1 = (T6f1(&a1, a2));
		if (t1) {
			t2 = ((T6)((a2)+(a3)));
			t1 = ((T1)((t2)<(a1)));
			if (t1) {
				T45f8(C, a1, a2, a3);
			} else {
				T45f9(C, a1, a2, a3);
			}
		} else {
			t2 = ((T6)((a1)+(a3)));
			t1 = ((T1)((t2)<(a2)));
			if (t1) {
				T45f8(C, a1, a2, a3);
			} else {
				T45f9(C, a1, a2, a3);
			}
		}
	}
}

/* SPECIAL [INTEGER_32].overlapping_move */
void T45f9(T0* C, T6 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T6 t2;
	T6 t3;
	t1 = ((T1)((a1)<(a2)));
	if (t1) {
		t2 = ((T6)((a1)+(a3)));
		l1 = ((T6)((t2)-((T6)(GE_int32(1)))));
		l2 = ((T6)((a1)-((T6)(GE_int32(1)))));
		l3 = ((T6)((a2)-(a1)));
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t2 = (((T45*)(C))->z2[l1]);
			t3 = ((T6)((l1)+(l3)));
			((T45*)(C))->z2[t3] = (t2);
			l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
			t1 = ((l1)==(l2));
		}
	} else {
		l1 = a1;
		l2 = ((T6)((a1)+(a3)));
		l3 = ((T6)((a1)-(a2)));
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t2 = (((T45*)(C))->z2[l1]);
			t3 = ((T6)((l1)-(l3)));
			((T45*)(C))->z2[t3] = (t2);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t1 = ((l1)==(l2));
		}
	}
}

/* SPECIAL [INTEGER_32].non_overlapping_move */
void T45f8(T0* C, T6 a1, T6 a2, T6 a3)
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
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T45*)(C))->z2[l1]);
		t3 = ((T6)((l1)+(l3)));
		((T45*)(C))->z2[t3] = (t2);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t1 = ((l1)==(l2));
	}
}

/* SPECIAL [INTEGER_32].make */
T0* T45c4(T6 a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T45)+a1*sizeof(T6));
	*(T45*)C = GE_default45;
	((T45*)(C))->z1 = a1;
	return C;
}

/* GEPP_PARSER.special_integer_ */
T0* T24f112(T0* C)
{
	T0* R = 0;
	if (ge271os1780) {
		return ge271ov1780;
	} else {
		ge271os1780 = '\1';
	}
	R = T46c4();
	ge271ov1780 = R;
	return R;
}

/* GEPP_PARSER.yy_init_value_stacks */
void T24f187(T0* C)
{
	((T24*)(C))->a39 = (T6)(GE_int32(-1));
	((T24*)(C))->a40 = (T6)(GE_int32(-1));
	((T24*)(C))->a41 = (T6)(GE_int32(-1));
}

/* GEPP_PARSER.yy_clear_all */
void T24f196(T0* C)
{
	T24f207(C);
}

/* GEPP_PARSER.clear_all */
void T24f207(T0* C)
{
	T24f213(C);
}

/* GEPP_PARSER.clear_stacks */
void T24f213(T0* C)
{
	T24f214(C);
}

/* GEPP_PARSER.yy_clear_value_stacks */
void T24f214(T0* C)
{
	T1 t1;
	t1 = ((((T24*)(C))->a69)!=(EIF_VOID));
	if (t1) {
		T48f6(GE_void(((T24*)(C))->a69));
	}
	t1 = ((((T24*)(C))->a73)!=(EIF_VOID));
	if (t1) {
		T50f7(GE_void(((T24*)(C))->a73));
	}
	t1 = ((((T24*)(C))->a77)!=(EIF_VOID));
	if (t1) {
		T52f6(GE_void(((T24*)(C))->a77));
	}
}

/* SPECIAL [BOOLEAN].clear_all */
void T52f6(T0* C)
{
	T6 l1 = 0;
	T1 l2 = 0;
	T6 t1;
	T1 t2;
	t1 = (((T52*)(C))->z1);
	l1 = ((T6)((t1)-((T6)(GE_int32(1)))));
	t2 = ((T1)((l1)<((T6)(GE_int32(0)))));
	while (!(t2)) {
		((T52*)(C))->z2[l1] = (l2);
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
		t2 = ((T1)((l1)<((T6)(GE_int32(0)))));
	}
}

/* SPECIAL [STRING_8].clear_all */
void T50f7(T0* C)
{
	T6 l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	t1 = (((T50*)(C))->z1);
	l1 = ((T6)((t1)-((T6)(GE_int32(1)))));
	t2 = ((T1)((l1)<((T6)(GE_int32(0)))));
	while (!(t2)) {
		((T50*)(C))->z2[l1] = (l2);
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
		t2 = ((T1)((l1)<((T6)(GE_int32(0)))));
	}
}

/* SPECIAL [ANY].clear_all */
void T48f6(T0* C)
{
	T6 l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	t1 = (((T48*)(C))->z1);
	l1 = ((T6)((t1)-((T6)(GE_int32(1)))));
	t2 = ((T1)((l1)<((T6)(GE_int32(0)))));
	while (!(t2)) {
		((T48*)(C))->z2[l1] = (l2);
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
		t2 = ((T1)((l1)<((T6)(GE_int32(0)))));
	}
}

/* GEPP_PARSER.abort */
void T24f190(T0* C)
{
	((T24*)(C))->a1 = (T6)(GE_int32(102));
}

/* GEPP_PARSER.set_input_buffer */
void T24f180(T0* C, T0* a1)
{
	T1 t1;
	t1 = ((a1)!=(((T24*)(C))->a11));
	if (t1) {
		if (((T0*)(GE_void(((T24*)(C))->a11)))->id==43) {
			T43f17(((T24*)(C))->a11, ((T24*)(C))->a12);
		} else {
			T44f13(((T24*)(C))->a11, ((T24*)(C))->a12);
		}
		if (((T0*)(GE_void(((T24*)(C))->a11)))->id==43) {
			T43f18(((T24*)(C))->a11, ((T24*)(C))->a13, ((T24*)(C))->a14, ((T24*)(C))->a15);
		} else {
			T44f14(((T24*)(C))->a11, ((T24*)(C))->a13, ((T24*)(C))->a14, ((T24*)(C))->a15);
		}
		((T24*)(C))->a11 = a1;
		T24f186(C);
	}
}

/* GEPP_PARSER.yy_load_input_buffer */
void T24f186(T0* C)
{
	T0* t1;
	t1 = (((((T0*)(GE_void(((T24*)(C))->a11)))->id==43)?((T43*)(((T24*)(C))->a11))->a1:((T44*)(((T24*)(C))->a11))->a1));
	T24f198(C, t1);
	((T24*)(C))->a12 = (((((T0*)(GE_void(((T24*)(C))->a11)))->id==43)?((T43*)(((T24*)(C))->a11))->a2:((T44*)(((T24*)(C))->a11))->a2));
	((T24*)(C))->a38 = ((T24*)(C))->a12;
	((T24*)(C))->a14 = (((((T0*)(GE_void(((T24*)(C))->a11)))->id==43)?((T43*)(((T24*)(C))->a11))->a3:((T44*)(((T24*)(C))->a11))->a3));
	((T24*)(C))->a15 = (((((T0*)(GE_void(((T24*)(C))->a11)))->id==43)?((T43*)(((T24*)(C))->a11))->a4:((T44*)(((T24*)(C))->a11))->a4));
	((T24*)(C))->a13 = (((((T0*)(GE_void(((T24*)(C))->a11)))->id==43)?((T43*)(((T24*)(C))->a11))->a5:((T44*)(((T24*)(C))->a11))->a5));
}

/* YY_BUFFER.set_position */
void T44f14(T0* C, T6 a1, T6 a2, T6 a3)
{
	((T44*)(C))->a5 = a1;
	((T44*)(C))->a3 = a2;
	((T44*)(C))->a4 = a3;
}

/* YY_FILE_BUFFER.set_position */
void T43f18(T0* C, T6 a1, T6 a2, T6 a3)
{
	((T43*)(C))->a5 = a1;
	((T43*)(C))->a3 = a2;
	((T43*)(C))->a4 = a3;
}

/* GEPP_PARSER.new_file_buffer */
T0* T24f91(T0* C, T0* a1)
{
	T0* R = 0;
	R = T43c16(a1);
	return R;
}

/* YY_FILE_BUFFER.make */
T0* T43c16(T0* a1)
{
	T0* C;
	T6 t1;
	C = (T0*)GE_alloc(sizeof(T43));
	*(T43*)C = GE_default43;
	t1 = (T43f13(C));
	T43f21(C, a1, t1);
	return C;
}

/* YY_FILE_BUFFER.make_with_size */
void T43f21(T0* C, T0* a1, T6 a2)
{
	T6 t1;
	((T43*)(C))->a11 = a2;
	t1 = ((T6)((a2)+((T6)(GE_int32(2)))));
	((T43*)(C))->a1 = (T43f15(C, t1));
	T43f23(C, a1);
}

/* YY_FILE_BUFFER.set_file */
void T43f23(T0* C, T0* a1)
{
	((T43*)(C))->a10 = (((((T0*)(GE_void(a1)))->id==27)?T27f24(a1):((T32*)(a1))->a1));
	T43f25(C);
	((T43*)(C))->a9 = a1;
}

/* YY_FILE_BUFFER.flush */
void T43f25(T0* C)
{
	T85f9(GE_void(((T43*)(C))->a1), (T2)('\000'), (T6)(GE_int32(1)));
	T85f9(GE_void(((T43*)(C))->a1), (T2)('\000'), (T6)(GE_int32(2)));
	((T43*)(C))->a7 = (T6)(GE_int32(0));
	((T43*)(C))->a2 = (T6)(GE_int32(1));
	((T43*)(C))->a3 = (T6)(GE_int32(1));
	((T43*)(C))->a4 = (T6)(GE_int32(1));
	((T43*)(C))->a5 = (T6)(GE_int32(1));
	((T43*)(C))->a6 = EIF_TRUE;
	((T43*)(C))->a8 = EIF_TRUE;
}

/* YY_FILE_BUFFER.new_default_buffer */
T0* T43f15(T0* C, T6 a1)
{
	T0* R = 0;
	R = T85c8(a1);
	return R;
}

/* KL_STANDARD_FILES.input */
unsigned char ge305os3219 = '\0';
T0* ge305ov3219;
T0* T30f2(T0* C)
{
	T0* R = 0;
	if (ge305os3219) {
		return ge305ov3219;
	} else {
		ge305os3219 = '\1';
	}
	R = T32c19();
	ge305ov3219 = R;
	return R;
}

/* KL_STDIN_FILE.make */
T0* T32c19(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T32));
	*(T32*)C = GE_default32;
	T32f20(C, GE_ms("stdin", 5));
	((T32*)(C))->a1 = EIF_FALSE;
	return C;
}

/* KL_STDIN_FILE.make_open_stdin */
void T32f20(T0* C, T0* a1)
{
	T32f21(C, a1);
	((T32*)(C))->a2 = (T32f9(C, (T6)(GE_int32(0))));
	T32f22(C);
}

/* KL_STDIN_FILE.set_read_mode */
void T32f22(T0* C)
{
	((T32*)(C))->a4 = (T6)(GE_int32(1));
}

/* KL_STDIN_FILE.console_def */
T14 T32f9(T0* C, T6 a1)
{
	T14 R = 0;
	R = (T14)console_def(a1);
	return R;
}

/* KL_STDIN_FILE.old_make */
void T32f21(T0* C, T0* a1)
{
	((T32*)(C))->a3 = a1;
	((T32*)(C))->a4 = (T6)(GE_int32(0));
}

/* KL_STANDARD_FILES.output */
unsigned char ge305os3220 = '\0';
T0* ge305ov3220;
T0* T30f1(T0* C)
{
	T0* R = 0;
	if (ge305os3220) {
		return ge305ov3220;
	} else {
		ge305os3220 = '\1';
	}
	R = T31c9();
	ge305ov3220 = R;
	return R;
}

/* KL_STDOUT_FILE.make */
T0* T31c9(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T31));
	*(T31*)C = GE_default31;
	T31f13(C, GE_ms("stdout", 6));
	return C;
}

/* KL_STDOUT_FILE.make_open_stdout */
void T31f13(T0* C, T0* a1)
{
	T31f15(C, a1);
	((T31*)(C))->a1 = (T31f4(C, (T6)(GE_int32(1))));
	T31f16(C);
}

/* KL_STDOUT_FILE.set_write_mode */
void T31f16(T0* C)
{
	((T31*)(C))->a3 = (T6)(GE_int32(2));
}

/* KL_STDOUT_FILE.console_def */
T14 T31f4(T0* C, T6 a1)
{
	T14 R = 0;
	R = (T14)console_def(a1);
	return R;
}

/* KL_STDOUT_FILE.old_make */
void T31f15(T0* C, T0* a1)
{
	((T31*)(C))->a2 = a1;
	((T31*)(C))->a3 = (T6)(GE_int32(0));
}

/* GEPP.std */
unsigned char ge303os1569 = '\0';
T0* ge303ov1569;
T0* T21f7(T0* C)
{
	T0* R = 0;
	if (ge303os1569) {
		return ge303ov1569;
	} else {
		ge303os1569 = '\1';
	}
	R = T30c4();
	ge303ov1569 = R;
	return R;
}

/* KL_STANDARD_FILES.default_create */
T0* T30c4(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T30));
	*(T30*)C = GE_default30;
	return C;
}

/* KL_EXCEPTIONS.die */
void T26f2(T0* C, T6 a1)
{
	esdie(a1);
}

/* GEPP.exceptions */
unsigned char ge321os1570 = '\0';
T0* ge321ov1570;
T0* T21f6(T0* C)
{
	T0* R = 0;
	if (ge321os1570) {
		return ge321ov1570;
	} else {
		ge321os1570 = '\1';
	}
	R = T26c1();
	ge321ov1570 = R;
	return R;
}

/* KL_EXCEPTIONS.default_create */
T0* T26c1(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T26));
	*(T26*)C = GE_default26;
	return C;
}

/* GEPP.report_cannot_write_error */
void T21f17(T0* C, T0* a1)
{
	T0* l1 = 0;
	l1 = T37c7(a1);
	T23f8(GE_void(((T21*)(C))->a1), l1);
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.make */
T0* T37c7(T0* a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T37));
	*(T37*)C = GE_default37;
	((T37*)(C))->a1 = T64c10((T6)(GE_int32(1)), (T6)(GE_int32(1)));
	T64f11(GE_void(((T37*)(C))->a1), a1, (T6)(GE_int32(1)));
	return C;
}

/* GEPP_PARSER.set_output_file */
void T24f176(T0* C, T0* a1)
{
	((T24*)(C))->a8 = a1;
}

/* KL_TEXT_OUTPUT_FILE.is_open_write */
T1 T28f18(T0* C)
{
	T1 R = 0;
	R = (T28f16(C));
	return R;
}

/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
T1 T28f16(T0* C)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T28*)(C))->a1)==((T6)(GE_int32(2))));
	if (!(t1)) {
		t1 = ((((T28*)(C))->a1)==((T6)(GE_int32(4))));
	}
	if (!(t1)) {
		t1 = ((((T28*)(C))->a1)==((T6)(GE_int32(5))));
	}
	if (!(t1)) {
		R = ((((T28*)(C))->a1)==((T6)(GE_int32(3))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* KL_TEXT_OUTPUT_FILE.recursive_open_write */
void T28f25(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T0* t2;
	T28f31(C);
	t1 = (T28f18(C));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (T28f14(C));
		l2 = (((((T0*)(GE_void(t2)))->id==68)?T68f12(t2, ((T28*)(C))->a2):T69f1(t2, ((T28*)(C))->a2)));
		t2 = (T28f14(C));
		l1 = (((((T0*)(GE_void(t2)))->id==68)?T68f2(t2, l2):T69f2(t2, l2)));
		l3 = T62c13(l1);
		t1 = (T62f5(GE_void(l3)));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T62f14(GE_void(l3));
			t1 = (T62f5(GE_void(l3)));
			if (t1) {
				T28f31(C);
			}
		}
	}
}

/* KL_DIRECTORY.recursive_create_directory */
void T62f14(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T0* t2;
	T62f16(C);
	t1 = (T62f5(C));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (T62f7(C));
		l2 = (((((T0*)(GE_void(t2)))->id==68)?T68f12(t2, ((T62*)(C))->a1):T69f1(t2, ((T62*)(C))->a1)));
		t2 = (T62f7(C));
		l1 = (((((T0*)(GE_void(t2)))->id==68)?T68f2(t2, l2):T69f2(t2, l2)));
		t2 = (T62f6(C));
		t1 = (T58f9(GE_void(t2), l1, l2));
		t1 = ((T1)(!(t1)));
		if (t1) {
			l3 = T62c13(l1);
			t1 = (T62f5(GE_void(l3)));
			t1 = ((T1)(!(t1)));
			if (t1) {
				T62f14(GE_void(l3));
				t1 = (T62f5(GE_void(l3)));
				if (t1) {
					T62f16(C);
				}
			}
		}
	}
}

/* KL_STRING_ROUTINES.same_string */
T1 T58f9(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T6 t2;
	T6 t3;
	T0* t4;
	t1 = ((a2)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (((T17*)(GE_void(a2)))->a2);
		t3 = (((T17*)(GE_void(a1)))->a2);
		t1 = ((t2)==(t3));
		if (t1) {
			l1 = EIF_VOID;
			t1 = ((l1)!=(EIF_VOID));
			if (t1) {
				R = ((GE_void(l1), a2, (T1)0));
			} else {
				l1 = EIF_VOID;
				t1 = ((l1)!=(EIF_VOID));
				if (t1) {
					R = ((GE_void(l1), a1, (T1)0));
				} else {
					t4 = (T58f5(C));
					t1 = (T81f1(GE_void(t4), a1, ge407ov4264));
					if (t1) {
						t4 = (T58f5(C));
						t1 = (T81f1(GE_void(t4), a2, ge407ov4264));
					}
					if (t1) {
						R = (T58f10(C, a1, a2));
					} else {
						R = EIF_TRUE;
						l3 = (((T17*)(GE_void(a1)))->a2);
						l2 = (T6)(GE_int32(1));
						t1 = (T6f1(&l2, l3));
						while (!(t1)) {
							t2 = (T17f23(GE_void(a1), l2));
							t3 = (T17f23(GE_void(a2), l2));
							t1 = ((t2)!=(t3));
							if (t1) {
								R = EIF_FALSE;
								l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
							} else {
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							}
							t1 = (T6f1(&l2, l3));
						}
					}
				}
			}
		}
	}
	return R;
}

/* STRING_8.item_code */
T6 T17f23(T0* C, T6 a1)
{
	T6 R = 0;
	T6 t1;
	T2 t2;
	t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
	t2 = (((T15*)(GE_void(((T17*)(C))->a1)))->z2[t1]);
	R = ((T6)(t2));
	return R;
}

/* KL_STRING_ROUTINES.elks_same_string */
T1 T58f10(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T1 t1;
	T6 t2;
	T6 t3;
	T0* t4;
	t1 = ((a2)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (((T17*)(GE_void(a2)))->a2);
		t3 = (((T17*)(GE_void(a1)))->a2);
		t1 = ((t2)==(t3));
		if (t1) {
			t4 = (T58f5(C));
			t1 = (T81f1(GE_void(t4), a2, ge407ov4264));
			if (t1) {
				R = (T17f24(GE_void(a1), a2));
			} else {
				R = (T17f24(GE_void(a2), a1));
			}
		}
	}
	return R;
}

/* STRING_8.same_string */
T1 T17f24(T0* C, T0* a1)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T1 t1;
	T6 t2;
	T2 t3;
	T2 t4;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (((T17*)(GE_void(a1)))->a2);
		t1 = ((t2)==(((T17*)(C))->a2));
		if (t1) {
			R = EIF_TRUE;
			l2 = ((T17*)(C))->a2;
			t1 = (EIF_TRUE);
			if (t1) {
				l3 = ((T17*)(C))->a1;
				l4 = (((T17*)(GE_void(a1)))->a1);
				t1 = ((l1)==(l2));
				while (!(t1)) {
					t3 = (((T15*)(GE_void(l3)))->z2[l1]);
					t4 = (((T15*)(GE_void(l4)))->z2[l1]);
					t1 = ((t3)!=(t4));
					if (t1) {
						R = EIF_FALSE;
						l1 = l2;
					} else {
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					}
					t1 = ((l1)==(l2));
				}
			} else {
				l1 = (T6)(GE_int32(1));
				l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				t1 = ((l1)==(l2));
				while (!(t1)) {
					t3 = (T17f5(C, l1));
					t4 = (T17f5(GE_void(a1), l1));
					t1 = ((t3)!=(t4));
					if (t1) {
						R = EIF_FALSE;
						l1 = l2;
					} else {
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					}
					t1 = ((l1)==(l2));
				}
			}
		}
	}
	return R;
}

/* KL_DIRECTORY.string_ */
T0* T62f6(T0* C)
{
	T0* R = 0;
	if (ge273os1776) {
		return ge273ov1776;
	} else {
		ge273os1776 = '\1';
	}
	R = T58c11();
	ge273ov1776 = R;
	return R;
}

/* KL_DIRECTORY.file_system */
unsigned char ge302os2233 = '\0';
T0* ge302ov2233;
T0* T62f7(T0* C)
{
	T0* R = 0;
	T0* t1;
	T1 t2;
	if (ge302os2233) {
		return ge302ov2233;
	} else {
		ge302os2233 = '\1';
	}
	t1 = (T62f10(C));
	t2 = (T67f1(GE_void(t1)));
	if (t2) {
		R = (T62f11(C));
	} else {
		t1 = (T62f10(C));
		t2 = (T67f2(GE_void(t1)));
		if (t2) {
			R = (T62f12(C));
		} else {
			R = (T62f12(C));
		}
	}
	ge302ov2233 = R;
	return R;
}

/* KL_DIRECTORY.unix_file_system */
unsigned char ge302os2236 = '\0';
T0* ge302ov2236;
T0* T62f12(T0* C)
{
	T0* R = 0;
	if (ge302os2236) {
		return ge302ov2236;
	} else {
		ge302os2236 = '\1';
	}
	R = T69c11();
	ge302ov2236 = R;
	return R;
}

/* KL_UNIX_FILE_SYSTEM.make */
T0* T69c11(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T69));
	*(T69*)C = GE_default69;
	return C;
}

/* KL_OPERATING_SYSTEM.is_unix */
unsigned char ge397os3229 = '\0';
T1 ge397ov3229;
T1 T67f2(T0* C)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	T6 t2;
	T2 t3;
	if (ge397os3229) {
		return ge397ov3229;
	} else {
		ge397os3229 = '\1';
	}
	l2 = (T67f3(C, GE_ms("GOBO_OS", 7)));
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t2 = (((T17*)(GE_void(l2)))->a2);
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		t1 = (T17f9(GE_void(l2), GE_ms("unix", 4)));
		if (t1) {
			R = EIF_TRUE;
		}
	} else {
		l1 = (T67f4(C));
		t2 = (((T17*)(GE_void(l1)))->a2);
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
		if (t1) {
			t3 = (T17f5(GE_void(l1), (T6)(GE_int32(1))));
			R = ((t3)==((T2)('/')));
		}
	}
	ge397ov3229 = R;
	return R;
}

/* KL_OPERATING_SYSTEM.current_working_directory */
T0* T67f4(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T67f5(C));
	R = (T79f2(GE_void(t1)));
	return R;
}

/* EXECUTION_ENVIRONMENT.current_working_directory */
T0* T79f2(T0* C)
{
	T0* R = 0;
	R = (T0*)dir_current();
	return R;
}

/* KL_OPERATING_SYSTEM.execution_environment */
unsigned char ge397os3233 = '\0';
T0* ge397ov3233;
T0* T67f5(T0* C)
{
	T0* R = 0;
	if (ge397os3233) {
		return ge397ov3233;
	} else {
		ge397os3233 = '\1';
	}
	R = T79c4();
	ge397ov3233 = R;
	return R;
}

/* KL_OPERATING_SYSTEM.variable_value */
T0* T67f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* t1;
	t1 = (T67f5(C));
	R = (T79f1(GE_void(t1), a1));
	return R;
}

/* KL_DIRECTORY.windows_file_system */
unsigned char ge302os2234 = '\0';
T0* ge302ov2234;
T0* T62f11(T0* C)
{
	T0* R = 0;
	if (ge302os2234) {
		return ge302ov2234;
	} else {
		ge302os2234 = '\1';
	}
	R = T68c13();
	ge302ov2234 = R;
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.make */
T0* T68c13(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T68));
	*(T68*)C = GE_default68;
	((T68*)(C))->a1 = (T2)('/');
	return C;
}

/* KL_OPERATING_SYSTEM.is_windows */
unsigned char ge397os3228 = '\0';
T1 ge397ov3228;
T1 T67f1(T0* C)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T6 t2;
	T2 t3;
	if (ge397os3228) {
		return ge397ov3228;
	} else {
		ge397os3228 = '\1';
	}
	l2 = (T67f3(C, GE_ms("GOBO_OS", 7)));
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t2 = (((T17*)(GE_void(l2)))->a2);
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		t1 = (T17f9(GE_void(l2), GE_ms("windows", 7)));
		if (t1) {
			R = EIF_TRUE;
		}
	} else {
		l3 = (T67f3(C, GE_ms("OS", 2)));
		t1 = ((l3)!=(EIF_VOID));
		if (t1) {
			t1 = (T17f9(GE_void(l3), GE_ms("Windows_NT", 10)));
		}
		if (t1) {
			R = EIF_TRUE;
		} else {
			l1 = (T67f4(C));
			t2 = (((T17*)(GE_void(l1)))->a2);
			t1 = (T6f2(&t2, (T6)(GE_int32(3))));
			if (t1) {
				t3 = (T17f5(GE_void(l1), (T6)(GE_int32(2))));
				t1 = ((t3)==((T2)(':')));
				if (t1) {
					t3 = (T17f5(GE_void(l1), (T6)(GE_int32(3))));
					t1 = ((t3)==((T2)('\\')));
				}
				if (t1) {
					R = EIF_TRUE;
				} else {
					t3 = (T17f5(GE_void(l1), (T6)(GE_int32(1))));
					t1 = ((t3)==((T2)('\\')));
					if (t1) {
						t3 = (T17f5(GE_void(l1), (T6)(GE_int32(2))));
						t1 = ((t3)==((T2)('\\')));
					}
					if (t1) {
						R = EIF_TRUE;
					}
				}
			}
		}
	}
	ge397ov3228 = R;
	return R;
}

/* KL_DIRECTORY.operating_system */
T0* T62f10(T0* C)
{
	T0* R = 0;
	if (ge323os2237) {
		return ge323ov2237;
	} else {
		ge323os2237 = '\1';
	}
	R = T67c7();
	ge323ov2237 = R;
	return R;
}

/* KL_DIRECTORY.create_directory */
void T62f16(T0* C)
{
	GE_rescue r;
	T1 l1 = 0;
	T1 t1;
	T6 t2;
	if (GE_setjmp(r.jb) != 0) {
		t1 = ((T1)(!(l1)));
		if (t1) {
			l1 = EIF_TRUE;
			goto GE_retry;
		}
		GE_raise(8);
	}
GE_retry:
	r.previous = GE_last_rescue;
	GE_last_rescue = &r;
	t1 = ((T1)(!(l1)));
	if (t1) {
		t2 = (((T17*)(GE_void(((T62*)(C))->a1)))->a2);
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
		if (t1) {
			t1 = (T62f8(C));
			t1 = ((T1)(!(t1)));
			if (t1) {
				T62f17(C);
			}
		}
	}
	GE_last_rescue = r.previous;
}

/* KL_DIRECTORY.create_dir */
void T62f17(T0* C)
{
	T0* l1 = 0;
	T61 t1;
	T14 t2;
	l1 = (T17f7(GE_void(((T62*)(C))->a1)));
	(t1).id = 61;
	(t1).a1 = ((l1?(T14)(GE_types[((T0*)(l1))->id].is_special?(T14)((T15*)(l1))->z2:(T14)l1):(T14)0));
	t2 = ((t1).a1);
	T62f18(C, t2);
}

/* KL_DIRECTORY.file_mkdir */
void T62f18(T0* C, T14 a1)
{
	file_mkdir((char *)a1);
}

/* KL_DIRECTORY.old_exists */
T1 T62f8(T0* C)
{
	T1 R = 0;
	T0* l1 = 0;
	T61 t1;
	T14 t2;
	l1 = (T17f7(GE_void(((T62*)(C))->a1)));
	(t1).id = 61;
	(t1).a1 = ((l1?(T14)(GE_types[((T0*)(l1))->id].is_special?(T14)((T15*)(l1))->z2:(T14)l1):(T14)0));
	t2 = ((t1).a1);
	R = (T62f4(C, t2));
	return R;
}

/* KL_DIRECTORY.eif_dir_exists */
T1 T62f4(T0* C, T14 a1)
{
	T1 R = 0;
	R = (T1)EIF_TEST((EIF_BOOLEAN )eif_dir_exists((char *)a1));
	return R;
}

/* KL_DIRECTORY.exists */
T1 T62f5(T0* C)
{
	T1 R = 0;
	T6 t1;
	T1 t2;
	t1 = (((T17*)(GE_void(((T62*)(C))->a1)))->a2);
	t2 = (T6f1(&t1, (T6)(GE_int32(0))));
	if (t2) {
		R = (T62f8(C));
	}
	return R;
}

/* KL_DIRECTORY.make */
T0* T62c13(T0* a1)
{
	T0* C;
	T0* t1;
	C = (T0*)GE_alloc(sizeof(T62));
	*(T62*)C = GE_default62;
	((T62*)(C))->a2 = a1;
	t1 = (T62f6(C));
	t1 = (T58f1(GE_void(t1), a1));
	T62f15(C, t1);
	return C;
}

/* KL_DIRECTORY.old_make */
void T62f15(T0* C, T0* a1)
{
	((T62*)(C))->a1 = a1;
	((T62*)(C))->a3 = (T6)(GE_int32(1));
}

/* KL_UNIX_FILE_SYSTEM.dirname */
T0* T69f2(T0* C, T0* a1)
{
	T0* R = 0;
	T6 l1 = 0;
	T1 t1;
	T2 t2;
	t1 = (T69f5(C, a1));
	if (t1) {
		R = (T69f6(C));
	} else {
		l1 = (((T17*)(GE_void(a1)))->a2);
		t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
		if (!(t1)) {
			t2 = (T17f5(GE_void(a1), l1));
			t1 = ((t2)!=((T2)('/')));
		}
		while (!(t1)) {
			l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
			t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
			if (!(t1)) {
				t2 = (T17f5(GE_void(a1), l1));
				t1 = ((t2)!=((T2)('/')));
			}
		}
		t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
		if (!(t1)) {
			t2 = (T17f5(GE_void(a1), l1));
			t1 = ((t2)==((T2)('/')));
		}
		while (!(t1)) {
			l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
			t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
			if (!(t1)) {
				t2 = (T17f5(GE_void(a1), l1));
				t1 = ((t2)==((T2)('/')));
			}
		}
		t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
		if (t1) {
			R = ge308ov4466;
		} else {
			t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
			if (!(t1)) {
				t2 = (T17f5(GE_void(a1), l1));
				t1 = ((t2)!=((T2)('/')));
			}
			while (!(t1)) {
				l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
				t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
				if (!(t1)) {
					t2 = (T17f5(GE_void(a1), l1));
					t1 = ((t2)!=((T2)('/')));
				}
			}
			t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
			if (t1) {
				R = (T69f6(C));
			} else {
				R = (T17f6(GE_void(a1), (T6)(GE_int32(1)), l1));
			}
		}
	}
	return R;
}

/* KL_UNIX_FILE_SYSTEM.root_directory */
unsigned char ge308os4468 = '\0';
T0* ge308ov4468;
T0* T69f6(T0* C)
{
	T0* R = 0;
	if (ge308os4468) {
		return ge308ov4468;
	} else {
		ge308os4468 = '\1';
	}
	R = GE_ms("/", 1);
	ge308ov4468 = R;
	return R;
}

/* KL_UNIX_FILE_SYSTEM.is_root_directory */
T1 T69f5(T0* C, T0* a1)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T2 t2;
	l2 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T6f1(&l2, (T6)(GE_int32(0))));
	if (t1) {
		R = EIF_TRUE;
		l1 = (T6)(GE_int32(1));
		t1 = (T6f1(&l1, l2));
		while (!(t1)) {
			t2 = (T17f5(GE_void(a1), l1));
			t1 = ((t2)!=((T2)('/')));
			if (t1) {
				R = EIF_FALSE;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t1 = (T6f1(&l1, l2));
		}
	}
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.dirname */
T0* T68f2(T0* C, T0* a1)
{
	T0* R = 0;
	T6 l1 = 0;
	T1 t1;
	T2 t2;
	T1 t3;
	T6 t4;
	t1 = (T68f5(C, a1));
	if (t1) {
		R = a1;
	} else {
		l1 = (((T17*)(GE_void(a1)))->a2);
		t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
		if (!(t1)) {
			t2 = (T17f5(GE_void(a1), l1));
			t3 = (T68f6(C, t2));
			t1 = ((T1)(!(t3)));
		}
		while (!(t1)) {
			l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
			t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
			if (!(t1)) {
				t2 = (T17f5(GE_void(a1), l1));
				t3 = (T68f6(C, t2));
				t1 = ((T1)(!(t3)));
			}
		}
		t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
		if (!(t1)) {
			t2 = (T17f5(GE_void(a1), l1));
			t1 = (T68f6(C, t2));
		}
		while (!(t1)) {
			l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
			t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
			if (!(t1)) {
				t2 = (T17f5(GE_void(a1), l1));
				t1 = (T68f6(C, t2));
			}
		}
		t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
		if (t1) {
			R = ge310ov4466;
		} else {
			t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
			if (!(t1)) {
				t2 = (T17f5(GE_void(a1), l1));
				t3 = (T68f6(C, t2));
				t1 = ((T1)(!(t3)));
			}
			while (!(t1)) {
				l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
				t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
				if (!(t1)) {
					t2 = (T17f5(GE_void(a1), l1));
					t3 = (T68f6(C, t2));
					t1 = ((T1)(!(t3)));
				}
			}
			t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
			if (t1) {
				R = (T68f8(C));
			} else {
				t2 = (T17f5(GE_void(a1), l1));
				t1 = ((t2)==((T2)(':')));
				if (t1) {
					t4 = (((T17*)(GE_void(a1)))->a2);
					t1 = ((T1)((l1)<(t4)));
				}
				if (t1) {
					t4 = ((T6)((l1)+((T6)(GE_int32(1)))));
					R = (T17f6(GE_void(a1), (T6)(GE_int32(1)), t4));
				} else {
					R = (T17f6(GE_void(a1), (T6)(GE_int32(1)), l1));
				}
			}
		}
	}
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.root_directory */
unsigned char ge310os4468 = '\0';
T0* ge310ov4468;
T0* T68f8(T0* C)
{
	T0* R = 0;
	if (ge310os4468) {
		return ge310ov4468;
	} else {
		ge310os4468 = '\1';
	}
	R = GE_ms("\\", 1);
	ge310ov4468 = R;
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.is_directory_separator */
T1 T68f6(T0* C, T2 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==((T2)('\\')));
	if (!(t1)) {
		R = ((a1)==(((T68*)(C))->a1));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.is_root_directory */
T1 T68f5(T0* C, T0* a1)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 l3 = 0;
	T1 l4 = 0;
	T2 l5 = 0;
	T1 t1;
	T2 t2;
	T1 t3;
	T6 t4;
	l2 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T6f2(&l2, (T6)(GE_int32(4))));
	if (t1) {
		t2 = (T17f5(GE_void(a1), (T6)(GE_int32(1))));
		t1 = (T68f6(C, t2));
	}
	if (t1) {
		t2 = (T17f5(GE_void(a1), (T6)(GE_int32(2))));
		t1 = (T68f6(C, t2));
		if (t1) {
			t2 = (T17f5(GE_void(a1), (T6)(GE_int32(3))));
			t3 = (T68f6(C, t2));
			t1 = ((T1)(!(t3)));
		}
		if (t1) {
			l1 = (T6)(GE_int32(4));
			t1 = (T6f1(&l1, l2));
			if (!(t1)) {
				t1 = (l4);
			}
			while (!(t1)) {
				l5 = (T17f5(GE_void(a1), l1));
				t1 = (T68f6(C, l5));
				if (t1) {
					l4 = EIF_TRUE;
				} else {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				}
				t1 = (T6f1(&l1, l2));
				if (!(t1)) {
					t1 = (l4);
				}
			}
			if (l4) {
				t1 = ((T1)((l1)<(l2)));
				if (t1) {
					t4 = ((T6)((l1)+((T6)(GE_int32(1)))));
					t2 = (T17f5(GE_void(a1), t4));
					t3 = (T68f6(C, t2));
					t1 = ((T1)(!(t3)));
				}
				if (t1) {
					l4 = EIF_FALSE;
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					t1 = (T6f1(&l1, l2));
					if (!(t1)) {
						t1 = (l4);
					}
					while (!(t1)) {
						l5 = (T17f5(GE_void(a1), l1));
						t1 = (T68f6(C, l5));
						if (t1) {
							l4 = EIF_TRUE;
						} else {
							l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						}
						t1 = (T6f1(&l1, l2));
						if (!(t1)) {
							t1 = (l4);
						}
					}
					if (l4) {
						l4 = EIF_FALSE;
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						t1 = (T6f1(&l1, l2));
						if (!(t1)) {
							t1 = (l4);
						}
						while (!(t1)) {
							l5 = (T17f5(GE_void(a1), l1));
							t1 = (T68f6(C, l5));
							t1 = ((T1)(!(t1)));
							if (t1) {
								l4 = EIF_TRUE;
							} else {
								l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
							}
							t1 = (T6f1(&l1, l2));
							if (!(t1)) {
								t1 = (l4);
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
		t1 = (T6f2(&l2, (T6)(GE_int32(3))));
		if (t1) {
			l5 = (T17f5(GE_void(a1), (T6)(GE_int32(1))));
			t1 = (T68f6(C, l5));
			t1 = ((T1)(!(t1)));
			if (t1) {
				t1 = ((l5)!=((T2)(':')));
			}
			if (t1) {
				l1 = (T6)(GE_int32(2));
				t1 = (T6f1(&l1, l2));
				if (!(t1)) {
					t1 = (l3);
				}
				if (!(t1)) {
					t1 = (l4);
				}
				while (!(t1)) {
					l5 = (T17f5(GE_void(a1), l1));
					t1 = (T68f6(C, l5));
					if (t1) {
						l3 = EIF_TRUE;
					} else {
						t1 = ((l5)==((T2)(':')));
						if (t1) {
							l4 = EIF_TRUE;
						} else {
							l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						}
					}
					t1 = (T6f1(&l1, l2));
					if (!(t1)) {
						t1 = (l3);
					}
					if (!(t1)) {
						t1 = (l4);
					}
				}
				if (l4) {
					t4 = ((T6)((l1)+((T6)(GE_int32(1)))));
					t1 = ((t4)==(l2));
				} else {
					t1 = EIF_FALSE;
				}
				if (t1) {
					l5 = (T17f5(GE_void(a1), l2));
					R = (T68f6(C, l5));
				}
			}
		} else {
			t1 = ((l2)==((T6)(GE_int32(1))));
			if (t1) {
				l5 = (T17f5(GE_void(a1), (T6)(GE_int32(1))));
				R = (T68f6(C, l5));
			}
		}
	}
	return R;
}

/* KL_UNIX_FILE_SYSTEM.canonical_pathname */
T0* T69f1(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = (T69f3(C, a1));
	T88f14(GE_void(l1));
	R = (T69f4(C, l1));
	return R;
}

/* KL_UNIX_FILE_SYSTEM.pathname_to_string */
T0* T69f4(T0* C, T0* a1)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	T0* t3;
	R = T17c27((T6)(GE_int32(50)));
	t1 = (((T88*)(GE_void(a1)))->a5);
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (T69f9(C));
		t3 = (T69f6(C));
		R = (T58f4(GE_void(t2), R, t3));
	}
	l2 = (((T88*)(GE_void(a1)))->a1);
	l1 = (T6)(GE_int32(1));
	t1 = (T6f2(&l1, l2));
	while (!(t1)) {
		t1 = (T88f11(GE_void(a1), l1));
		if (t1) {
			t2 = (T69f9(C));
			R = (T58f4(GE_void(t2), R, ge308ov4466));
		} else {
			t1 = (T88f7(GE_void(a1), l1));
			if (t1) {
				t2 = (T69f9(C));
				R = (T58f4(GE_void(t2), R, ge308ov4467));
			} else {
				t2 = (T69f9(C));
				t3 = (T88f8(GE_void(a1), l1));
				R = (T58f4(GE_void(t2), R, t3));
			}
		}
		T17f30(GE_void(R), (T2)('/'));
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t1 = (T6f2(&l1, l2));
	}
	t1 = ((l1)==(l2));
	if (t1) {
		t1 = (T88f11(GE_void(a1), l1));
		if (t1) {
			t2 = (T69f9(C));
			R = (T58f4(GE_void(t2), R, ge308ov4466));
		} else {
			t1 = (T88f7(GE_void(a1), l1));
			if (t1) {
				t2 = (T69f9(C));
				R = (T58f4(GE_void(t2), R, ge308ov4467));
			} else {
				t2 = (T69f9(C));
				t3 = (T88f8(GE_void(a1), l1));
				R = (T58f4(GE_void(t2), R, t3));
			}
		}
	}
	return R;
}

/* KL_PATHNAME.item */
T0* T88f8(T0* C, T6 a1)
{
	T0* R = 0;
	R = (T64f5(GE_void(((T88*)(C))->a6), a1));
	return R;
}

/* ARRAY [STRING_8].item */
T0* T64f5(T0* C, T6 a1)
{
	T0* R = 0;
	T6 t1;
	t1 = ((T6)((a1)-(((T64*)(C))->a2)));
	R = (((T50*)(GE_void(((T64*)(C))->a1)))->z2[t1]);
	return R;
}

/* KL_PATHNAME.is_parent */
T1 T88f7(T0* C, T6 a1)
{
	T1 R = 0;
	T0* t1;
	t1 = (T88f8(C, a1));
	R = ((t1)==(ge299ov4694));
	return R;
}

/* KL_PATHNAME.is_current */
T1 T88f11(T0* C, T6 a1)
{
	T1 R = 0;
	T0* t1;
	t1 = (T88f8(C, a1));
	R = ((t1)==(ge299ov4693));
	return R;
}

/* KL_UNIX_FILE_SYSTEM.string_ */
T0* T69f9(T0* C)
{
	T0* R = 0;
	if (ge273os1776) {
		return ge273ov1776;
	} else {
		ge273os1776 = '\1';
	}
	R = T58c11();
	ge273ov1776 = R;
	return R;
}

/* KL_PATHNAME.set_canonical */
void T88f14(T0* C)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	l3 = ((T88*)(C))->a1;
	t1 = ((l3)==((T6)(GE_int32(1))));
	if (t1) {
		t1 = (T88f11(C, (T6)(GE_int32(1))));
	}
	if (t1) {
		t1 = (((T88*)(C))->a5);
	}
	if (t1) {
	} else {
		l2 = (T6)(GE_int32(1));
		l1 = (T6)(GE_int32(1));
		t1 = (T6f1(&l1, l3));
		while (!(t1)) {
			t1 = (T88f11(C, l1));
			if (t1) {
			} else {
				t1 = (T88f7(C, l1));
				if (t1) {
					t1 = ((l2)==((T6)(GE_int32(1))));
					if (!(t1)) {
						t2 = ((T6)((l2)-((T6)(GE_int32(1)))));
						t1 = (T88f7(C, t2));
					}
					if (t1) {
						if (((T88*)(C))->a5) {
							t3 = (T88f8(C, l1));
							T64f11(GE_void(((T88*)(C))->a6), t3, l2);
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
					}
				} else {
					t3 = (T88f8(C, l1));
					T64f11(GE_void(((T88*)(C))->a6), t3, l2);
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				}
			}
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t1 = (T6f1(&l1, l3));
		}
		((T88*)(C))->a1 = ((T6)((l2)-((T6)(GE_int32(1)))));
		t1 = (T6f1(&l2, l3));
		while (!(t1)) {
			T64f11(GE_void(((T88*)(C))->a6), EIF_VOID, l2);
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			t1 = (T6f1(&l2, l3));
		}
		if (((T88*)(C))->a5) {
			t1 = ((((T88*)(C))->a1)==((T6)(GE_int32(0))));
		} else {
			t1 = EIF_FALSE;
		}
		if (t1) {
			T88f16(C);
		}
	}
}

/* KL_PATHNAME.append_current */
void T88f16(T0* C)
{
	T88f21(C, ge299ov4693);
}

/* KL_PATHNAME.append_name */
void T88f21(T0* C, T0* a1)
{
	((T88*)(C))->a1 = ((T6)((((T88*)(C))->a1)+((T6)(GE_int32(1)))));
	T64f13(GE_void(((T88*)(C))->a6), a1, ((T88*)(C))->a1);
}

/* ARRAY [STRING_8].force */
void T64f13(T0* C, T0* a1, T6 a2)
{
	T1 t1;
	t1 = ((T1)((a2)<(((T64*)(C))->a2)));
	if (t1) {
		T64f14(C, a2, ((T64*)(C))->a3);
	} else {
		t1 = (T6f1(&a2, ((T64*)(C))->a3));
		if (t1) {
			T64f14(C, ((T64*)(C))->a2, a2);
		}
	}
	T64f11(C, a1, a2);
}

/* ARRAY [STRING_8].auto_resize */
void T64f14(T0* C, T6 a1, T6 a2)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T0* l6 = 0;
	T1 t1;
	T6 t2;
	T6 t3;
	t1 = (T64f6(C));
	if (t1) {
		l3 = a1;
		l4 = a2;
	} else {
		l3 = (T6f21(&a1, ((T64*)(C))->a2));
		l4 = (T6f15(&a2, ((T64*)(C))->a3));
	}
	t2 = ((T6)((l4)-(l3)));
	l2 = ((T6)((t2)+((T6)(GE_int32(1)))));
	t1 = (T64f6(C));
	t1 = ((T1)(!(t1)));
	if (t1) {
		l1 = (((T50*)(GE_void(((T64*)(C))->a1)))->z1);
		t1 = (T6f1(&l2, l1));
		if (t1) {
			t2 = ((T6)((l2)-(l1)));
			t3 = (T64f7(C));
			t1 = ((T1)((t2)<(t3)));
		}
		if (t1) {
			t2 = (T64f7(C));
			l2 = ((T6)((l1)+(t2)));
		}
	}
	t1 = (T64f6(C));
	if (t1) {
		T64f12(C, l2);
	} else {
		t1 = (T6f1(&l2, l1));
		if (t1) {
			((T64*)(C))->a1 = (T50f4(GE_void(((T64*)(C))->a1), l2));
		}
		t1 = ((T1)((l3)<(((T64*)(C))->a2)));
		if (t1) {
			l5 = ((T6)((((T64*)(C))->a2)-(l3)));
			t2 = (T64f8(C));
			T50f9(GE_void(((T64*)(C))->a1), (T6)(GE_int32(0)), l5, t2);
			t2 = ((T6)((l5)-((T6)(GE_int32(1)))));
			T50f12(GE_void(((T64*)(C))->a1), l6, (T6)(GE_int32(0)), t2);
		}
	}
	((T64*)(C))->a2 = l3;
	((T64*)(C))->a3 = l4;
}

/* SPECIAL [STRING_8].fill_with */
void T50f12(T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	l1 = a2;
	l2 = ((T6)((a3)+((T6)(GE_int32(1)))));
	t1 = ((l1)==(l2));
	while (!(t1)) {
		((T50*)(C))->z2[l1] = (a1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t1 = ((l1)==(l2));
	}
}

/* ARRAY [STRING_8].capacity */
T6 T64f8(T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = ((T6)((((T64*)(C))->a3)-(((T64*)(C))->a2)));
	R = ((T6)((t1)+((T6)(GE_int32(1)))));
	return R;
}

/* SPECIAL [STRING_8].aliased_resized_area */
T0* T50f4(T0* C, T6 a1)
{
	T0* R = 0;
	T6 t1;
	t1 = ((T50*)(C))->z1;
	if (a1>t1) {
		R = (T0*)GE_alloc(sizeof(T50)+a1*sizeof(T0*));
		*(T50*)(R) = *(T50*)(C);
		memcpy(((T50*)(R))->z2,((T50*)(C))->z2,t1*sizeof(T0*));
	} else {
		R = C;
	}
	((T50*)(R))->z1 = a1;
	return R;
}

/* ARRAY [STRING_8].additional_space */
T6 T64f7(T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = (T64f8(C));
	t1 = ((T6)((t1)/((T6)(GE_int32(2)))));
	R = (T6f15(&t1, (T6)(GE_int32(5))));
	return R;
}

/* INTEGER_32.min */
T6 T6f21(T6* C, T6 a1)
{
	T6 R = 0;
	T1 t1;
	t1 = (T6f6(C, a1));
	if (t1) {
		R = *C;
	} else {
		R = a1;
	}
	return R;
}

/* ARRAY [STRING_8].empty_area */
T1 T64f6(T0* C)
{
	T1 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((((T64*)(C))->a1)==(EIF_VOID));
	if (!(t1)) {
		t2 = (((T50*)(GE_void(((T64*)(C))->a1)))->z1);
		R = ((t2)==((T6)(GE_int32(0))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* KL_UNIX_FILE_SYSTEM.string_to_pathname */
T0* T69f3(T0* C, T0* a1)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T0* l5 = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	R = T88c13();
	l2 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T6f1(&l2, (T6)(GE_int32(0))));
	if (t1) {
		t2 = (T17f5(GE_void(a1), (T6)(GE_int32(1))));
		t1 = ((t2)!=((T2)('/')));
		if (t1) {
			T88f15(GE_void(R), EIF_TRUE);
		}
	} else {
		T88f15(GE_void(R), EIF_TRUE);
	}
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t1 = (T6f1(&l1, l2));
		if (!(t1)) {
			t2 = (T17f5(GE_void(a1), l1));
			t1 = ((t2)!=((T2)('/')));
		}
		while (!(t1)) {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t1 = (T6f1(&l1, l2));
			if (!(t1)) {
				t2 = (T17f5(GE_void(a1), l1));
				t1 = ((t2)!=((T2)('/')));
			}
		}
		t1 = (T6f6(&l1, l2));
		if (t1) {
			l3 = l1;
			t1 = (T6f1(&l1, l2));
			if (!(t1)) {
				t2 = (T17f5(GE_void(a1), l1));
				t1 = ((t2)==((T2)('/')));
			}
			while (!(t1)) {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				t1 = (T6f1(&l1, l2));
				if (!(t1)) {
					t2 = (T17f5(GE_void(a1), l1));
					t1 = ((t2)==((T2)('/')));
				}
			}
			l4 = ((T6)((l1)-((T6)(GE_int32(1)))));
			l5 = (T17f6(GE_void(a1), l3, l4));
			t3 = (T69f9(C));
			t1 = (T58f9(GE_void(t3), l5, ge308ov4466));
			if (t1) {
				T88f16(GE_void(R));
			} else {
				t3 = (T69f9(C));
				t1 = (T58f9(GE_void(t3), l5, ge308ov4467));
				if (t1) {
					T88f17(GE_void(R));
				} else {
					T88f21(GE_void(R), l5);
				}
			}
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* KL_PATHNAME.append_parent */
void T88f17(T0* C)
{
	T88f21(C, ge299ov4694);
}

/* KL_PATHNAME.set_relative */
void T88f15(T0* C, T1 a1)
{
	((T88*)(C))->a5 = a1;
}

/* KL_PATHNAME.make */
T0* T88c13(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T88));
	*(T88*)C = GE_default88;
	((T88*)(C))->a6 = T64c10((T6)(GE_int32(1)), (T6)(GE_int32(10)));
	return C;
}

/* KL_WINDOWS_FILE_SYSTEM.canonical_pathname */
T0* T68f12(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = (T68f3(C, a1));
	T88f14(GE_void(l1));
	R = (T68f4(C, l1));
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.pathname_to_string */
T0* T68f4(T0* C, T0* a1)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T1 t1;
	T0* t2;
	T0* t3;
	R = T17c27((T6)(GE_int32(50)));
	l2 = (((T88*)(GE_void(a1)))->a1);
	l3 = (((T88*)(GE_void(a1)))->a2);
	t1 = ((l3)!=(EIF_VOID));
	if (t1) {
		t2 = (T68f9(C));
		R = (T58f4(GE_void(t2), R, l3));
		T17f30(GE_void(R), (T2)('\\'));
	} else {
		l4 = (((T88*)(GE_void(a1)))->a3);
		t1 = ((l4)!=(EIF_VOID));
		if (t1) {
			T17f30(GE_void(R), (T2)('\\'));
			T17f30(GE_void(R), (T2)('\\'));
			t2 = (T68f9(C));
			R = (T58f4(GE_void(t2), R, l4));
			T17f30(GE_void(R), (T2)('\\'));
			l5 = (((T88*)(GE_void(a1)))->a4);
			t1 = ((l5)!=(EIF_VOID));
			if (t1) {
				t2 = (T68f9(C));
				R = (T58f4(GE_void(t2), R, l5));
				t1 = (T6f1(&l2, (T6)(GE_int32(0))));
				if (t1) {
					T17f30(GE_void(R), (T2)('\\'));
				}
			}
		} else {
			t1 = (((T88*)(GE_void(a1)))->a5);
			t1 = ((T1)(!(t1)));
			if (t1) {
				t2 = (T68f9(C));
				t3 = (T68f8(C));
				R = (T58f4(GE_void(t2), R, t3));
			}
		}
	}
	l1 = (T6)(GE_int32(1));
	t1 = (T6f2(&l1, l2));
	while (!(t1)) {
		t1 = (T88f11(GE_void(a1), l1));
		if (t1) {
			t2 = (T68f9(C));
			R = (T58f4(GE_void(t2), R, ge310ov4466));
		} else {
			t1 = (T88f7(GE_void(a1), l1));
			if (t1) {
				t2 = (T68f9(C));
				R = (T58f4(GE_void(t2), R, ge310ov4467));
			} else {
				t2 = (T68f9(C));
				t3 = (T88f8(GE_void(a1), l1));
				R = (T58f4(GE_void(t2), R, t3));
			}
		}
		T17f30(GE_void(R), (T2)('\\'));
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t1 = (T6f2(&l1, l2));
	}
	t1 = ((l1)==(l2));
	if (t1) {
		t1 = (T88f11(GE_void(a1), l1));
		if (t1) {
			t2 = (T68f9(C));
			R = (T58f4(GE_void(t2), R, ge310ov4466));
		} else {
			t1 = (T88f7(GE_void(a1), l1));
			if (t1) {
				t2 = (T68f9(C));
				R = (T58f4(GE_void(t2), R, ge310ov4467));
			} else {
				t2 = (T68f9(C));
				t3 = (T88f8(GE_void(a1), l1));
				R = (T58f4(GE_void(t2), R, t3));
			}
		}
	}
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.string_ */
T0* T68f9(T0* C)
{
	T0* R = 0;
	if (ge273os1776) {
		return ge273ov1776;
	} else {
		ge273os1776 = '\1';
	}
	R = T58c11();
	ge273ov1776 = R;
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.string_to_pathname */
T0* T68f3(T0* C, T0* a1)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
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
	R = T88c13();
	T88f15(GE_void(R), EIF_TRUE);
	l2 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T6f1(&l2, (T6)(GE_int32(2))));
	if (t1) {
		t2 = (T17f5(GE_void(a1), (T6)(GE_int32(1))));
		t3 = (T68f6(C, t2));
		if (t3) {
			t2 = (T17f5(GE_void(a1), (T6)(GE_int32(2))));
			t1 = (T68f6(C, t2));
		} else {
			t1 = EIF_FALSE;
		}
	}
	if (t1) {
		l6 = EIF_TRUE;
		T88f15(GE_void(R), EIF_FALSE);
		l1 = (T6)(GE_int32(3));
	} else {
		t1 = (T6f1(&l2, (T6)(GE_int32(0))));
		if (t1) {
			t2 = (T17f5(GE_void(a1), (T6)(GE_int32(1))));
			t1 = (T68f6(C, t2));
		}
		if (t1) {
			T88f15(GE_void(R), EIF_FALSE);
			l1 = (T6)(GE_int32(2));
		} else {
			l8 = EIF_TRUE;
			l1 = (T6)(GE_int32(1));
		}
	}
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t1 = (T6f1(&l1, l2));
		if (!(t1)) {
			t2 = (T17f5(GE_void(a1), l1));
			t3 = (T68f6(C, t2));
			t1 = ((T1)(!(t3)));
		}
		while (!(t1)) {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t1 = (T6f1(&l1, l2));
			if (!(t1)) {
				t2 = (T17f5(GE_void(a1), l1));
				t3 = (T68f6(C, t2));
				t1 = ((T1)(!(t3)));
			}
		}
		t1 = (T6f6(&l1, l2));
		if (t1) {
			l3 = l1;
			t1 = (T6f1(&l1, l2));
			if (!(t1)) {
				t2 = (T17f5(GE_void(a1), l1));
				t1 = (T68f6(C, t2));
			}
			while (!(t1)) {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				t1 = (T6f1(&l1, l2));
				if (!(t1)) {
					t2 = (T17f5(GE_void(a1), l1));
					t1 = (T68f6(C, t2));
				}
			}
			l4 = ((T6)((l1)-((T6)(GE_int32(1)))));
			l5 = (T17f6(GE_void(a1), l3, l4));
			t4 = (T68f9(C));
			t1 = (T58f9(GE_void(t4), l5, ge310ov4466));
			if (t1) {
				T88f16(GE_void(R));
				l7 = EIF_FALSE;
			} else {
				t4 = (T68f9(C));
				t1 = (T58f9(GE_void(t4), l5, ge310ov4467));
				if (t1) {
					T88f17(GE_void(R));
					l7 = EIF_FALSE;
				} else {
					if (l6) {
						T88f18(GE_void(R), l5);
						l7 = EIF_TRUE;
					} else {
						if (l7) {
							T88f19(GE_void(R), l5);
							l7 = EIF_FALSE;
						} else {
							if (l8) {
								t5 = (((T17*)(GE_void(l5)))->a2);
								t2 = (T17f5(GE_void(l5), t5));
								t1 = ((t2)==((T2)(':')));
								if (t1) {
									T88f20(GE_void(R), l5);
									T88f15(GE_void(R), EIF_FALSE);
								} else {
									T88f21(GE_void(R), l5);
								}
							} else {
								T88f21(GE_void(R), l5);
							}
						}
					}
				}
			}
			l6 = EIF_FALSE;
			l8 = EIF_FALSE;
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* KL_PATHNAME.set_drive */
void T88f20(T0* C, T0* a1)
{
	((T88*)(C))->a2 = a1;
}

/* KL_PATHNAME.set_sharename */
void T88f19(T0* C, T0* a1)
{
	((T88*)(C))->a4 = a1;
}

/* KL_PATHNAME.set_hostname */
void T88f18(T0* C, T0* a1)
{
	((T88*)(C))->a3 = a1;
}

/* KL_TEXT_OUTPUT_FILE.file_system */
T0* T28f14(T0* C)
{
	T0* R = 0;
	T0* t1;
	T1 t2;
	if (ge302os2233) {
		return ge302ov2233;
	} else {
		ge302os2233 = '\1';
	}
	t1 = (T28f21(C));
	t2 = (T67f1(GE_void(t1)));
	if (t2) {
		R = (T28f22(C));
	} else {
		t1 = (T28f21(C));
		t2 = (T67f2(GE_void(t1)));
		if (t2) {
			R = (T28f23(C));
		} else {
			R = (T28f23(C));
		}
	}
	ge302ov2233 = R;
	return R;
}

/* KL_TEXT_OUTPUT_FILE.unix_file_system */
T0* T28f23(T0* C)
{
	T0* R = 0;
	if (ge302os2236) {
		return ge302ov2236;
	} else {
		ge302os2236 = '\1';
	}
	R = T69c11();
	ge302ov2236 = R;
	return R;
}

/* KL_TEXT_OUTPUT_FILE.windows_file_system */
T0* T28f22(T0* C)
{
	T0* R = 0;
	if (ge302os2234) {
		return ge302ov2234;
	} else {
		ge302os2234 = '\1';
	}
	R = T68c13();
	ge302ov2234 = R;
	return R;
}

/* KL_TEXT_OUTPUT_FILE.operating_system */
T0* T28f21(T0* C)
{
	T0* R = 0;
	if (ge323os2237) {
		return ge323ov2237;
	} else {
		ge323os2237 = '\1';
	}
	R = T67c7();
	ge323ov2237 = R;
	return R;
}

/* KL_TEXT_OUTPUT_FILE.open_write */
void T28f31(T0* C)
{
	GE_rescue r;
	T1 l1 = 0;
	T1 t1;
	if (GE_setjmp(r.jb) != 0) {
		t1 = ((T1)(!(l1)));
		if (t1) {
			l1 = EIF_TRUE;
			goto GE_retry;
		}
		GE_raise(8);
	}
GE_retry:
	r.previous = GE_last_rescue;
	GE_last_rescue = &r;
	t1 = ((T1)(!(l1)));
	if (t1) {
		t1 = ((((T28*)(C))->a3)!=(ge380ov2218));
		if (t1) {
			T28f34(C);
		}
	} else {
		t1 = (T28f11(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T28f26(C);
		}
	}
	GE_last_rescue = r.previous;
}

/* KL_TEXT_OUTPUT_FILE.old_open_write */
void T28f34(T0* C)
{
	T14 t1;
	T1 t2;
	T28f34p1(C);
	t1 = (T28f19(C));
	t2 = ((((T28*)(C))->a4)==(t1));
	if (t2) {
		((T28*)(C))->a1 = (T6)(GE_int32(0));
		((T28*)(C))->a5 = EIF_FALSE;
	}
}

/* KL_TEXT_OUTPUT_FILE.default_pointer */
T14 T28f19(T0* C)
{
	T14 R = 0;
	return R;
}

/* KL_TEXT_OUTPUT_FILE.open_write */
void T28f34p1(T0* C)
{
	T0* l1 = 0;
	T61 t1;
	T14 t2;
	l1 = (T17f7(GE_void(((T28*)(C))->a3)));
	(t1).id = 61;
	(t1).a1 = ((l1?(T14)(GE_types[((T0*)(l1))->id].is_special?(T14)((T15*)(l1))->z2:(T14)l1):(T14)0));
	t2 = ((t1).a1);
	((T28*)(C))->a4 = (T28f20(C, t2, (T6)(GE_int32(1))));
	((T28*)(C))->a1 = (T6)(GE_int32(2));
}

/* KL_TEXT_OUTPUT_FILE.file_open */
T14 T28f20(T0* C, T14 a1, T6 a2)
{
	T14 R = 0;
	R = (T14)(EIF_POINTER )file_open((char *)a1,( int)a2);
	return R;
}

/* KL_TEXT_OUTPUT_FILE.make */
T0* T28c24(T0* a1)
{
	T0* C;
	T6 t1;
	T1 t2;
	T0* t3;
	C = (T0*)GE_alloc(sizeof(T28));
	*(T28*)C = GE_default28;
	((T28*)(C))->a2 = a1;
	t1 = (((T17*)(GE_void(a1)))->a2);
	t2 = (T6f1(&t1, (T6)(GE_int32(0))));
	if (t2) {
		t3 = (T28f12(C));
		t3 = (T58f1(GE_void(t3), a1));
		T28f30(C, t3);
	} else {
		T28f30(C, ge380ov2218);
	}
	return C;
}

/* KL_TEXT_OUTPUT_FILE.old_make */
void T28f30(T0* C, T0* a1)
{
	((T28*)(C))->a3 = a1;
	((T28*)(C))->a1 = (T6)(GE_int32(0));
}

/* STRING_8.is_equal */
T1 T17f9(T0* C, T0* a1)
{
	T1 R = 0;
	T6 l1 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		l1 = ((T17*)(C))->a2;
		t2 = (((T17*)(GE_void(a1)))->a2);
		t1 = ((l1)==(t2));
		if (t1) {
			t3 = (((T17*)(GE_void(a1)))->a1);
			t2 = (T17f4(C, ((T17*)(C))->a1, t3, l1));
			R = ((t2)==((T6)(GE_int32(0))));
		}
	}
	return R;
}

/* STRING_8.str_strict_cmp */
T6 T17f4(T0* C, T0* a1, T0* a2, T6 a3)
{
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T2 t2;
	t1 = ((l1)==(a3));
	while (!(t1)) {
		t2 = (((T15*)(GE_void(a1)))->z2[l1]);
		l2 = ((T6)(t2));
		t2 = (((T15*)(GE_void(a2)))->z2[l1]);
		l3 = ((T6)(t2));
		t1 = ((l2)!=(l3));
		if (t1) {
			R = ((T6)((l2)-(l3)));
			l1 = ((T6)((a3)-((T6)(GE_int32(1)))));
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t1 = ((l1)==(a3));
	}
	return R;
}

/* GEPP.read_arguments */
void T21f12(T0* C)
{
	T0* l1 = 0;
	T1 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T0* t1;
	T1 t2;
	T2 t3;
	T6 t4;
	t1 = (T21f5(C));
	l5 = ((T6)(GE_argc - 1));
	t2 = ((l5)==((T6)(GE_int32(1))));
	if (t2) {
		t1 = (T21f5(C));
		l1 = (T22f2(GE_void(t1), (T6)(GE_int32(1))));
		t2 = (T17f9(GE_void(l1), GE_ms("-V", 2)));
		if (!(t2)) {
			t2 = (T17f9(GE_void(l1), GE_ms("--version", 9)));
		}
		if (t2) {
			T21f14(C);
			t1 = (T21f6(C));
			T26f2(GE_void(t1), (T6)(GE_int32(0)));
		} else {
			t2 = (T17f9(GE_void(l1), GE_ms("-h", 2)));
			if (!(t2)) {
				t2 = (T17f9(GE_void(l1), GE_ms("-\?", 2)));
			}
			if (!(t2)) {
				t2 = (T17f9(GE_void(l1), GE_ms("--help", 6)));
			}
			if (t2) {
				T21f15(C);
				t1 = (T21f6(C));
				T26f2(GE_void(t1), (T6)(GE_int32(0)));
			}
		}
	}
	l3 = (T6)(GE_int32(1));
	t2 = (T6f1(&l3, l5));
	if (!(t2)) {
		t2 = (l2);
	}
	while (!(t2)) {
		t1 = (T21f5(C));
		l1 = (T22f2(GE_void(t1), l3));
		l4 = (((T17*)(GE_void(l1)))->a2);
		t2 = (T6f2(&l4, (T6)(GE_int32(2))));
		if (t2) {
			t3 = (T17f5(GE_void(l1), (T6)(GE_int32(1))));
			t2 = ((t3)==((T2)('-')));
		}
		if (t2) {
			t3 = (T17f5(GE_void(l1), (T6)(GE_int32(2))));
			t2 = ((t3)==((T2)('D')));
			if (t2) {
				t2 = (T6f1(&l4, (T6)(GE_int32(2))));
				if (t2) {
					t1 = (T17f6(GE_void(l1), (T6)(GE_int32(3)), l4));
					T24f173(GE_void(((T21*)(C))->a2), GE_ms("", 0), t1);
				}
				l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
			} else {
				t2 = ((l4)==((T6)(GE_int32(2))));
				if (t2) {
					t3 = (T17f5(GE_void(l1), (T6)(GE_int32(2))));
					t2 = ((t3)==((T2)('M')));
				}
				if (t2) {
					T24f174(GE_void(((T21*)(C))->a2), EIF_TRUE);
					l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
				} else {
					t2 = ((l4)==((T6)(GE_int32(2))));
					if (t2) {
						t3 = (T17f5(GE_void(l1), (T6)(GE_int32(2))));
						t2 = ((t3)==((T2)('l')));
					}
					if (t2) {
						T24f175(GE_void(((T21*)(C))->a2), EIF_TRUE);
						l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
					} else {
						t2 = (T17f9(GE_void(l1), GE_ms("--lines", 7)));
						if (t2) {
							T24f175(GE_void(((T21*)(C))->a2), EIF_TRUE);
							l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
						} else {
							l2 = EIF_TRUE;
						}
					}
				}
			}
		} else {
			l2 = EIF_TRUE;
		}
		t2 = (T6f1(&l3, l5));
		if (!(t2)) {
			t2 = (l2);
		}
	}
	t4 = ((T6)((l5)-(l3)));
	t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
	switch (t4) {
	case (T6)(T6)(GE_int32(0)):
		break;
	case (T6)(T6)(GE_int32(1)):
		t1 = (T21f5(C));
		((T21*)(C))->a3 = (T22f2(GE_void(t1), l3));
		break;
	case (T6)(T6)(GE_int32(2)):
		t1 = (T21f5(C));
		((T21*)(C))->a3 = (T22f2(GE_void(t1), l3));
		t1 = (T21f5(C));
		t4 = ((T6)((l3)+((T6)(GE_int32(1)))));
		((T21*)(C))->a4 = (T22f2(GE_void(t1), t4));
		break;
	default:
		T21f16(C);
		t1 = (T21f6(C));
		T26f2(GE_void(t1), (T6)(GE_int32(1)));
		break;
	}
}

/* GEPP.report_usage_error */
void T21f16(T0* C)
{
	T0* t1;
	t1 = (T21f9(C));
	T23f8(GE_void(((T21*)(C))->a1), t1);
}

/* GEPP.usage_message */
unsigned char ge54os1566 = '\0';
T0* ge54ov1566;
T0* T21f9(T0* C)
{
	T0* R = 0;
	if (ge54os1566) {
		return ge54ov1566;
	} else {
		ge54os1566 = '\1';
	}
	R = T36c7(GE_ms("[--version][--help][-hV\?lM]\n\t[--lines][-Dname ...][filename | -][filename | -]", 78));
	ge54ov1566 = R;
	return R;
}

/* UT_USAGE_MESSAGE.make */
T0* T36c7(T0* a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T36));
	*(T36*)C = GE_default36;
	((T36*)(C))->a1 = T64c10((T6)(GE_int32(1)), (T6)(GE_int32(1)));
	T64f11(GE_void(((T36*)(C))->a1), a1, (T6)(GE_int32(1)));
	return C;
}

/* GEPP_PARSER.set_empty_lines */
void T24f175(T0* C, T1 a1)
{
	((T24*)(C))->a7 = a1;
}

/* GEPP_PARSER.set_makefile_dependencies */
void T24f174(T0* C, T1 a1)
{
	((T24*)(C))->a6 = a1;
}

/* GEPP.report_usage_message */
void T21f15(T0* C)
{
	T0* t1;
	t1 = (T21f9(C));
	T23f7(GE_void(((T21*)(C))->a1), t1);
}

/* UT_ERROR_HANDLER.report_info */
void T23f7(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T23f5(C, a1));
	T23f9(C, t1);
}

/* UT_ERROR_HANDLER.report_info_message */
void T23f9(T0* C, T0* a1)
{
	T31f10(GE_void(((T23*)(C))->a3), a1);
}

/* GEPP.report_version_number */
void T21f14(T0* C)
{
	T0* l1 = 0;
	l1 = T34c7(ge316ov1568);
	T23f7(GE_void(((T21*)(C))->a1), l1);
}

/* UT_VERSION_NUMBER.make */
T0* T34c7(T0* a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T34));
	*(T34*)C = GE_default34;
	((T34*)(C))->a1 = T64c10((T6)(GE_int32(1)), (T6)(GE_int32(1)));
	T64f11(GE_void(((T34*)(C))->a1), a1, (T6)(GE_int32(1)));
	return C;
}

/* KL_ARGUMENTS.argument */
T0* T22f2(T0* C, T6 a1)
{
	T0* R = 0;
	char* s = GE_argv[a1];
	R = GE_ms(s,strlen(s));
	return R;
}

/* GEPP_PARSER.make */
T0* T24c172(T0* a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T24));
	*(T24*)C = GE_default24;
	T24f178(C);
	T24f179(C);
	((T24*)(C))->a2 = a1;
	((T24*)(C))->a3 = T40c34((T6)(GE_int32(10)));
	((T24*)(C))->a4 = T41c6((T6)(GE_int32(10)));
	((T24*)(C))->a5 = T42c8((T6)(GE_int32(10)));
	return C;
}

/* DS_ARRAYED_STACK [YY_BUFFER].make */
T0* T42c8(T6 a1)
{
	T0* C;
	T6 t1;
	C = (T0*)GE_alloc(sizeof(T42));
	*(T42*)C = GE_default42;
	((T42*)(C))->a4 = T74c2();
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	((T42*)(C))->a3 = (T74f1(GE_void(((T42*)(C))->a4), t1));
	((T42*)(C))->a2 = a1;
	return C;
}

/* KL_SPECIAL_ROUTINES [YY_BUFFER].make */
T0* T74f1(T0* C, T6 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T90c2(a1);
	R = (((T90*)(GE_void(l1)))->a1);
	return R;
}

/* TO_SPECIAL [YY_BUFFER].make_area */
T0* T90c2(T6 a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T90));
	*(T90*)C = GE_default90;
	((T90*)(C))->a1 = T73c2(a1);
	return C;
}

/* SPECIAL [YY_BUFFER].make */
T0* T73c2(T6 a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T73)+a1*sizeof(T0*));
	*(T73*)C = GE_default73;
	((T73*)(C))->z1 = a1;
	return C;
}

/* KL_SPECIAL_ROUTINES [YY_BUFFER].default_create */
T0* T74c2(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T74));
	*(T74*)C = GE_default74;
	return C;
}

/* DS_ARRAYED_STACK [INTEGER_32].make */
T0* T41c6(T6 a1)
{
	T0* C;
	T6 t1;
	C = (T0*)GE_alloc(sizeof(T41));
	*(T41*)C = GE_default41;
	((T41*)(C))->a3 = T46c4();
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	((T41*)(C))->a1 = (T46f1(GE_void(((T41*)(C))->a3), t1));
	((T41*)(C))->a4 = a1;
	return C;
}

/* KL_SPECIAL_ROUTINES [INTEGER_32].make */
T0* T46f1(T0* C, T6 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T75c2(a1);
	R = (((T75*)(GE_void(l1)))->a1);
	return R;
}

/* TO_SPECIAL [INTEGER_32].make_area */
T0* T75c2(T6 a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T75));
	*(T75*)C = GE_default75;
	((T75*)(C))->a1 = T45c4(a1);
	return C;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].make */
T0* T40c34(T6 a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T40));
	*(T40*)C = GE_default40;
	((T40*)(C))->a2 = T25c3();
	T40f38(C, a1, EIF_VOID, ((T40*)(C))->a2);
	return C;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].make_with_equality_testers */
void T40f38(T0* C, T6 a1, T0* a2, T0* a3)
{
	((T40*)(C))->a10 = a2;
	((T40*)(C))->a2 = a3;
	T40f46(C, a1);
	((T40*)(C))->a11 = T70c5(C);
}

/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].make */
T0* T70c5(T0* a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T70));
	*(T70*)C = GE_default70;
	((T70*)(C))->a1 = a1;
	((T70*)(C))->a2 = (((T40*)(GE_void(((T70*)(C))->a1)))->a2);
	((T70*)(C))->a3 = (T70f4(C));
	return C;
}

/* DS_SPARSE_TABLE_KEYS [STRING_8, STRING_8].new_cursor */
T0* T70f4(T0* C)
{
	T0* R = 0;
	R = T89c3(C);
	return R;
}

/* DS_SPARSE_TABLE_KEYS_CURSOR [STRING_8, STRING_8].make */
T0* T89c3(T0* a1)
{
	T0* C;
	T0* t1;
	C = (T0*)GE_alloc(sizeof(T89));
	*(T89*)C = GE_default89;
	((T89*)(C))->a1 = a1;
	t1 = (((T70*)(GE_void(((T89*)(C))->a1)))->a1);
	((T89*)(C))->a2 = (T40f28(GE_void(t1)));
	return C;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].new_cursor */
T0* T40f28(T0* C)
{
	T0* R = 0;
	R = T72c4(C);
	return R;
}

/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].make */
T0* T72c4(T0* a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T72));
	*(T72*)C = GE_default72;
	((T72*)(C))->a3 = a1;
	((T72*)(C))->a1 = ((T6)(GE_int32(-1)));
	return C;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].make_sparse_container */
void T40f46(T0* C, T6 a1)
{
	T6 t1;
	((T40*)(C))->a4 = a1;
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	T40f53(C, t1);
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	T40f54(C, t1);
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	T40f55(C, t1);
	((T40*)(C))->a8 = (T40f22(C, a1));
	t1 = ((T6)((((T40*)(C))->a8)+((T6)(GE_int32(1)))));
	T40f56(C, t1);
	((T40*)(C))->a7 = (T6)(GE_int32(0));
	((T40*)(C))->a6 = (T6)(GE_int32(0));
	((T40*)(C))->a1 = (T6)(GE_int32(0));
	T40f39(C);
	((T40*)(C))->a17 = (T40f28(C));
}

/* DS_HASH_TABLE [STRING_8, STRING_8].make_slots */
void T40f56(T0* C, T6 a1)
{
	T0* t1;
	t1 = (T40f29(C));
	((T40*)(C))->a15 = (T46f1(GE_void(t1), a1));
}

/* DS_HASH_TABLE [STRING_8, STRING_8].make_clashes */
void T40f55(T0* C, T6 a1)
{
	T0* t1;
	t1 = (T40f29(C));
	((T40*)(C))->a14 = (T46f1(GE_void(t1), a1));
}

/* DS_HASH_TABLE [STRING_8, STRING_8].make_key_storage */
void T40f54(T0* C, T6 a1)
{
	((T40*)(C))->a19 = T51c3();
	((T40*)(C))->a16 = (T51f1(GE_void(((T40*)(C))->a19), a1));
}

/* DS_HASH_TABLE [STRING_8, STRING_8].make_item_storage */
void T40f53(T0* C, T6 a1)
{
	((T40*)(C))->a18 = T51c3();
	((T40*)(C))->a13 = (T51f1(GE_void(((T40*)(C))->a18), a1));
}

/* KL_EQUALITY_TESTER [STRING_8].default_create */
T0* T25c3(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T25));
	*(T25*)C = GE_default25;
	return C;
}

/* GEPP_PARSER.make_parser_skeleton */
void T24f179(T0* C)
{
	T0* t1;
	t1 = (T24f112(C));
	((T24*)(C))->a10 = (T46f1(GE_void(t1), (T6)(GE_int32(200))));
	T24f184(C);
	T24f185(C);
}

/* GEPP_PARSER.yy_build_parser_tables */
void T24f185(T0* C)
{
	((T24*)(C))->a29 = (T24f107(C));
	((T24*)(C))->a33 = (T24f110(C));
	((T24*)(C))->a36 = (T24f113(C));
	((T24*)(C))->a37 = (T24f120(C));
	((T24*)(C))->a32 = (T24f122(C));
	((T24*)(C))->a35 = (T24f123(C));
	((T24*)(C))->a27 = (T24f124(C));
	((T24*)(C))->a34 = (T24f126(C));
	((T24*)(C))->a31 = (T24f127(C));
	((T24*)(C))->a30 = (T24f128(C));
}

/* GEPP_PARSER.yycheck_template */
unsigned char ge55os1642 = '\0';
T0* ge55ov1642;
T0* T24f128(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge55os1642) {
		return ge55ov1642;
	} else {
		ge55os1642 = '\1';
	}
	t1 = GE_ma65((T6)53,
(T6)(GE_int32(6)),
(T6)(GE_int32(8)),
(T6)(GE_int32(5)),
(T6)(GE_int32(11)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(10)),
(T6)(GE_int32(15)),
(T6)(GE_int32(16)),
(T6)(GE_int32(12)),
(T6)(GE_int32(13)),
(T6)(GE_int32(10)),
(T6)(GE_int32(18)),
(T6)(GE_int32(3)),
(T6)(GE_int32(4)),
(T6)(GE_int32(5)),
(T6)(GE_int32(6)),
(T6)(GE_int32(7)),
(T6)(GE_int32(8)),
(T6)(GE_int32(9)),
(T6)(GE_int32(14)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(10)),
(T6)(GE_int32(31)),
(T6)(GE_int32(10)),
(T6)(GE_int32(3)),
(T6)(GE_int32(4)),
(T6)(GE_int32(5)),
(T6)(GE_int32(6)),
(T6)(GE_int32(7)),
(T6)(GE_int32(37)),
(T6)(GE_int32(9)),
(T6)(GE_int32(3)),
(T6)(GE_int32(4)),
(T6)(GE_int32(5)),
(T6)(GE_int32(6)),
(T6)(GE_int32(7)),
(T6)(GE_int32(13)),
(T6)(GE_int32(14)),
(T6)(GE_int32(12)),
(T6)(GE_int32(10)),
(T6)(GE_int32(17)),
(T6)(GE_int32(10)),
(T6)(GE_int32(13)),
(T6)(GE_int32(14)),
(T6)(GE_int32(13)),
(T6)(GE_int32(14)),
(T6)(GE_int32(10)),
(T6)(GE_int32(37)),
(T6)(GE_int32(11)),
(T6)(GE_int32(11)),
(T6)(GE_int32(2147483647)));
	R = (T24f168(C, t1));
	ge55ov1642 = R;
	return R;
}

/* GEPP_PARSER.yyfixed_array */
T0* T24f168(T0* C, T0* a1)
{
	T0* R = 0;
	T0* t1;
	t1 = (T24f112(C));
	R = (T46f3(GE_void(t1), a1));
	return R;
}

/* KL_SPECIAL_ROUTINES [INTEGER_32].to_special */
T0* T46f3(T0* C, T0* a1)
{
	T0* R = 0;
	R = (((T65*)(a1))->a1);
	return R;
}

/* GEPP_PARSER.yytable_template */
unsigned char ge55os1641 = '\0';
T0* ge55ov1641;
T0* T24f127(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge55os1641) {
		return ge55ov1641;
	} else {
		ge55os1641 = '\1';
	}
	t1 = GE_ma65((T6)53,
(T6)(GE_int32(17)),
(T6)(GE_int32(18)),
(T6)(GE_int32(16)),
(T6)(GE_int32(14)),
(T6)(GE_int32(41)),
(T6)(GE_int32(40)),
(T6)(GE_int32(36)),
(T6)(GE_int32(13)),
(T6)(GE_int32(12)),
(T6)(GE_int32(22)),
(T6)(GE_int32(23)),
(T6)(GE_int32(35)),
(T6)(GE_int32(17)),
(T6)(GE_int32(5)),
(T6)(GE_int32(4)),
(T6)(GE_int32(3)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(29)),
(T6)(GE_int32(28)),
(T6)(GE_int32(24)),
(T6)(GE_int32(33)),
(T6)(GE_int32(34)),
(T6)(GE_int32(21)),
(T6)(GE_int32(37)),
(T6)(GE_int32(20)),
(T6)(GE_int32(5)),
(T6)(GE_int32(4)),
(T6)(GE_int32(3)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(17)),
(T6)(GE_int32(28)),
(T6)(GE_int32(5)),
(T6)(GE_int32(4)),
(T6)(GE_int32(3)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(11)),
(T6)(GE_int32(27)),
(T6)(GE_int32(32)),
(T6)(GE_int32(26)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(25)),
(T6)(GE_int32(24)),
(T6)(GE_int32(19)),
(T6)(GE_int32(38)),
(T6)(GE_int32(10)),
(T6)(GE_int32(9)),
(T6)(GE_int32(2147483647)));
	R = (T24f168(C, t1));
	ge55ov1641 = R;
	return R;
}

/* GEPP_PARSER.yypgoto_template */
unsigned char ge55os1640 = '\0';
T0* ge55ov1640;
T0* T24f126(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge55os1640) {
		return ge55ov1640;
	} else {
		ge55os1640 = '\1';
	}
	t1 = GE_ma65((T6)8,
(T6)(GE_int32(-3)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-7)),
(T6)(GE_int32(-6)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(12)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(2147483647)));
	R = (T24f168(C, t1));
	ge55ov1640 = R;
	return R;
}

/* GEPP_PARSER.yypact_template */
unsigned char ge55os1639 = '\0';
T0* ge55ov1639;
T0* T24f124(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge55os1639) {
		return ge55ov1639;
	} else {
		ge55os1639 = '\1';
	}
	t1 = GE_ma65((T6)43,
(T6)(GE_int32(30)),
(T6)(GE_int32(40)),
(T6)(GE_int32(39)),
(T6)(GE_int32(28)),
(T6)(GE_int32(-8)),
(T6)(GE_int32(-8)),
(T6)(GE_int32(30)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(30)),
(T6)(GE_int32(38)),
(T6)(GE_int32(15)),
(T6)(GE_int32(13)),
(T6)(GE_int32(-8)),
(T6)(GE_int32(-8)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(33)),
(T6)(GE_int32(31)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(10)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(25)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-8)),
(T6)(GE_int32(-8)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(1)),
(T6)(GE_int32(-4)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(30)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(6)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(23)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(5)),
(T6)(GE_int32(4)),
(T6)(GE_int32(-32768)),
(T6)(GE_int32(2147483647)));
	R = (T24f168(C, t1));
	ge55ov1639 = R;
	return R;
}

/* GEPP_PARSER.yydefgoto_template */
unsigned char ge55os1638 = '\0';
T0* ge55ov1638;
T0* T24f123(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge55os1638) {
		return ge55ov1638;
	} else {
		ge55os1638 = '\1';
	}
	t1 = GE_ma65((T6)8,
(T6)(GE_int32(15)),
(T6)(GE_int32(39)),
(T6)(GE_int32(6)),
(T6)(GE_int32(7)),
(T6)(GE_int32(8)),
(T6)(GE_int32(30)),
(T6)(GE_int32(31)),
(T6)(GE_int32(2147483647)));
	R = (T24f168(C, t1));
	ge55ov1638 = R;
	return R;
}

/* GEPP_PARSER.yydefact_template */
unsigned char ge55os1637 = '\0';
T0* ge55ov1637;
T0* T24f122(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge55os1637) {
		return ge55ov1637;
	} else {
		ge55os1637 = '\1';
	}
	t1 = GE_ma65((T6)43,
(T6)(GE_int32(2)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(1)),
(T6)(GE_int32(3)),
(T6)(GE_int32(2)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(12)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(4)),
(T6)(GE_int32(0)),
(T6)(GE_int32(8)),
(T6)(GE_int32(7)),
(T6)(GE_int32(9)),
(T6)(GE_int32(0)),
(T6)(GE_int32(16)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(11)),
(T6)(GE_int32(10)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(5)),
(T6)(GE_int32(2)),
(T6)(GE_int32(13)),
(T6)(GE_int32(14)),
(T6)(GE_int32(15)),
(T6)(GE_int32(17)),
(T6)(GE_int32(18)),
(T6)(GE_int32(0)),
(T6)(GE_int32(6)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(2147483647)));
	R = (T24f168(C, t1));
	ge55ov1637 = R;
	return R;
}

/* GEPP_PARSER.yytypes2_template */
unsigned char ge55os1636 = '\0';
T0* ge55ov1636;
T0* T24f120(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge55os1636) {
		return ge55ov1636;
	} else {
		ge55os1636 = '\1';
	}
	t1 = GE_ma65((T6)19,
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2147483647)));
	R = (T24f168(C, t1));
	ge55ov1636 = R;
	return R;
}

/* GEPP_PARSER.yytypes1_template */
unsigned char ge55os1635 = '\0';
T0* ge55ov1635;
T0* T24f113(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge55os1635) {
		return ge55ov1635;
	} else {
		ge55os1635 = '\1';
	}
	t1 = GE_ma65((T6)43,
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2147483647)));
	R = (T24f168(C, t1));
	ge55ov1635 = R;
	return R;
}

/* GEPP_PARSER.yyr1_template */
unsigned char ge55os1634 = '\0';
T0* ge55ov1634;
T0* T24f110(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge55os1634) {
		return ge55ov1634;
	} else {
		ge55os1634 = '\1';
	}
	t1 = GE_ma65((T6)20,
(T6)(GE_int32(0)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(20)),
(T6)(GE_int32(20)),
(T6)(GE_int32(21)),
(T6)(GE_int32(21)),
(T6)(GE_int32(21)),
(T6)(GE_int32(21)),
(T6)(GE_int32(21)),
(T6)(GE_int32(22)),
(T6)(GE_int32(22)),
(T6)(GE_int32(18)),
(T6)(GE_int32(18)),
(T6)(GE_int32(18)),
(T6)(GE_int32(18)),
(T6)(GE_int32(18)),
(T6)(GE_int32(23)),
(T6)(GE_int32(24)),
(T6)(GE_int32(2147483647)));
	R = (T24f168(C, t1));
	ge55ov1634 = R;
	return R;
}

/* GEPP_PARSER.yytranslate_template */
unsigned char ge55os1633 = '\0';
T0* ge55ov1633;
T0* T24f107(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge55os1633) {
		return ge55ov1633;
	} else {
		ge55os1633 = '\1';
	}
	t1 = GE_ma65((T6)271,
(T6)(GE_int32(0)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(15)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(16)),
(T6)(GE_int32(17)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(3)),
(T6)(GE_int32(4)),
(T6)(GE_int32(5)),
(T6)(GE_int32(6)),
(T6)(GE_int32(7)),
(T6)(GE_int32(8)),
(T6)(GE_int32(9)),
(T6)(GE_int32(10)),
(T6)(GE_int32(11)),
(T6)(GE_int32(12)),
(T6)(GE_int32(13)),
(T6)(GE_int32(14)),
(T6)(GE_int32(2147483647)));
	R = (T24f168(C, t1));
	ge55ov1633 = R;
	return R;
}

/* GEPP_PARSER.yy_create_value_stacks */
void T24f184(T0* C)
{
}

/* GEPP_PARSER.make_gepp_scanner */
void T24f178(T0* C)
{
	T0* t1;
	t1 = (T24f94(C));
	T24f183(C, t1);
	t1 = (T24f95(C));
	((T24*)(C))->a8 = (T30f1(GE_void(t1)));
	((T24*)(C))->a9 = (T6)(GE_int32(1));
}

/* GEPP_PARSER.std */
T0* T24f95(T0* C)
{
	T0* R = 0;
	if (ge303os1569) {
		return ge303ov1569;
	} else {
		ge303os1569 = '\1';
	}
	R = T30c4();
	ge303ov1569 = R;
	return R;
}

/* GEPP_PARSER.make_with_buffer */
void T24f183(T0* C, T0* a1)
{
	((T24*)(C))->a11 = a1;
	T24f197(C);
	T24f186(C);
}

/* GEPP_PARSER.yy_initialize */
void T24f197(T0* C)
{
	T0* t1;
	T0* t2;
	T6 t3;
	T24f208(C);
	((T24*)(C))->a47 = (T6)(GE_int32(1));
	((T24*)(C))->a14 = (T6)(GE_int32(1));
	((T24*)(C))->a15 = (T6)(GE_int32(1));
	((T24*)(C))->a13 = (T6)(GE_int32(1));
	((T24*)(C))->a44 = (T6)(GE_int32(1));
	((T24*)(C))->a45 = (T6)(GE_int32(1));
	((T24*)(C))->a46 = (T6)(GE_int32(1));
	if (EIF_FALSE) {
		t1 = (T24f112(C));
		t2 = (((((T0*)(GE_void(((T24*)(C))->a11)))->id==43)?((T43*)(((T24*)(C))->a11))->a1:((T44*)(((T24*)(C))->a11))->a1));
		t3 = (T85f4(GE_void(t2)));
		t3 = ((T6)((t3)+((T6)(GE_int32(1)))));
		((T24*)(C))->a48 = (T46f1(GE_void(t1), t3));
	}
}

/* GEPP_PARSER.yy_build_tables */
void T24f208(T0* C)
{
	((T24*)(C))->a60 = (T24f158(C));
	((T24*)(C))->a56 = (T24f159(C));
	((T24*)(C))->a57 = (T24f160(C));
	((T24*)(C))->a58 = (T24f161(C));
	((T24*)(C))->a50 = (T24f162(C));
	((T24*)(C))->a59 = (T24f163(C));
	((T24*)(C))->a53 = (T24f164(C));
}

/* GEPP_PARSER.yy_accept_template */
unsigned char ge56os1792 = '\0';
T0* ge56ov1792;
T0* T24f164(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge56os1792) {
		return ge56ov1792;
	} else {
		ge56os1792 = '\1';
	}
	t1 = GE_ma65((T6)74,
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(14)),
(T6)(GE_int32(14)),
(T6)(GE_int32(16)),
(T6)(GE_int32(16)),
(T6)(GE_int32(26)),
(T6)(GE_int32(24)),
(T6)(GE_int32(12)),
(T6)(GE_int32(11)),
(T6)(GE_int32(9)),
(T6)(GE_int32(23)),
(T6)(GE_int32(17)),
(T6)(GE_int32(22)),
(T6)(GE_int32(23)),
(T6)(GE_int32(23)),
(T6)(GE_int32(19)),
(T6)(GE_int32(23)),
(T6)(GE_int32(14)),
(T6)(GE_int32(13)),
(T6)(GE_int32(16)),
(T6)(GE_int32(15)),
(T6)(GE_int32(12)),
(T6)(GE_int32(10)),
(T6)(GE_int32(1)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(17)),
(T6)(GE_int32(0)),
(T6)(GE_int32(20)),
(T6)(GE_int32(19)),
(T6)(GE_int32(21)),
(T6)(GE_int32(14)),
(T6)(GE_int32(13)),
(T6)(GE_int32(16)),
(T6)(GE_int32(15)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(18)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(4)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(5)),
(T6)(GE_int32(2)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(8)),
(T6)(GE_int32(7)),
(T6)(GE_int32(3)),
(T6)(GE_int32(0)),
(T6)(GE_int32(6)),
(T6)(GE_int32(0)),
(T6)(GE_int32(2147483647)));
	R = (T24f171(C, t1));
	ge56ov1792 = R;
	return R;
}

/* GEPP_PARSER.yy_fixed_array */
T0* T24f171(T0* C, T0* a1)
{
	T0* R = 0;
	T0* t1;
	t1 = (T24f112(C));
	R = (T46f3(GE_void(t1), a1));
	return R;
}

/* GEPP_PARSER.yy_meta_template */
unsigned char ge56os1791 = '\0';
T0* ge56ov1791;
T0* T24f163(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge56os1791) {
		return ge56ov1791;
	} else {
		ge56os1791 = '\1';
	}
	t1 = GE_ma65((T6)19,
(T6)(GE_int32(0)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(3)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(4)),
(T6)(GE_int32(4)),
(T6)(GE_int32(4)),
(T6)(GE_int32(4)),
(T6)(GE_int32(4)),
(T6)(GE_int32(4)),
(T6)(GE_int32(4)),
(T6)(GE_int32(4)),
(T6)(GE_int32(4)),
(T6)(GE_int32(5)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2147483647)));
	R = (T24f171(C, t1));
	ge56ov1791 = R;
	return R;
}

/* GEPP_PARSER.yy_ec_template */
unsigned char ge56os1790 = '\0';
T0* ge56ov1790;
T0* T24f162(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge56os1790) {
		return ge56ov1790;
	} else {
		ge56os1790 = '\1';
	}
	t1 = GE_ma65((T6)258,
(T6)(GE_int32(0)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(3)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2)),
(T6)(GE_int32(1)),
(T6)(GE_int32(4)),
(T6)(GE_int32(5)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(6)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(1)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(8)),
(T6)(GE_int32(9)),
(T6)(GE_int32(10)),
(T6)(GE_int32(11)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(12)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(13)),
(T6)(GE_int32(7)),
(T6)(GE_int32(14)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(15)),
(T6)(GE_int32(7)),
(T6)(GE_int32(16)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(7)),
(T6)(GE_int32(1)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(8)),
(T6)(GE_int32(9)),
(T6)(GE_int32(10)),
(T6)(GE_int32(11)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(12)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(13)),
(T6)(GE_int32(7)),
(T6)(GE_int32(14)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(15)),
(T6)(GE_int32(7)),
(T6)(GE_int32(16)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(7)),
(T6)(GE_int32(1)),
(T6)(GE_int32(17)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(1)),
(T6)(GE_int32(2147483647)));
	R = (T24f171(C, t1));
	ge56ov1790 = R;
	return R;
}

/* GEPP_PARSER.yy_def_template */
unsigned char ge56os1789 = '\0';
T0* ge56ov1789;
T0* T24f161(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge56os1789) {
		return ge56ov1789;
	} else {
		ge56os1789 = '\1';
	}
	t1 = GE_ma65((T6)84,
(T6)(GE_int32(0)),
(T6)(GE_int32(73)),
(T6)(GE_int32(74)),
(T6)(GE_int32(72)),
(T6)(GE_int32(3)),
(T6)(GE_int32(75)),
(T6)(GE_int32(75)),
(T6)(GE_int32(76)),
(T6)(GE_int32(76)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(77)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(78)),
(T6)(GE_int32(72)),
(T6)(GE_int32(79)),
(T6)(GE_int32(72)),
(T6)(GE_int32(80)),
(T6)(GE_int32(72)),
(T6)(GE_int32(81)),
(T6)(GE_int32(72)),
(T6)(GE_int32(77)),
(T6)(GE_int32(72)),
(T6)(GE_int32(82)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(78)),
(T6)(GE_int32(72)),
(T6)(GE_int32(79)),
(T6)(GE_int32(72)),
(T6)(GE_int32(80)),
(T6)(GE_int32(72)),
(T6)(GE_int32(81)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(0)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(2147483647)));
	R = (T24f171(C, t1));
	ge56ov1789 = R;
	return R;
}

/* GEPP_PARSER.yy_base_template */
unsigned char ge56os1788 = '\0';
T0* ge56ov1788;
T0* T24f160(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge56os1788) {
		return ge56ov1788;
	} else {
		ge56os1788 = '\1';
	}
	t1 = GE_ma65((T6)84,
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(5)),
(T6)(GE_int32(0)),
(T6)(GE_int32(114)),
(T6)(GE_int32(113)),
(T6)(GE_int32(112)),
(T6)(GE_int32(111)),
(T6)(GE_int32(113)),
(T6)(GE_int32(118)),
(T6)(GE_int32(109)),
(T6)(GE_int32(118)),
(T6)(GE_int32(18)),
(T6)(GE_int32(118)),
(T6)(GE_int32(109)),
(T6)(GE_int32(118)),
(T6)(GE_int32(0)),
(T6)(GE_int32(104)),
(T6)(GE_int32(0)),
(T6)(GE_int32(92)),
(T6)(GE_int32(105)),
(T6)(GE_int32(118)),
(T6)(GE_int32(104)),
(T6)(GE_int32(118)),
(T6)(GE_int32(103)),
(T6)(GE_int32(118)),
(T6)(GE_int32(0)),
(T6)(GE_int32(95)),
(T6)(GE_int32(11)),
(T6)(GE_int32(15)),
(T6)(GE_int32(90)),
(T6)(GE_int32(101)),
(T6)(GE_int32(98)),
(T6)(GE_int32(118)),
(T6)(GE_int32(0)),
(T6)(GE_int32(118)),
(T6)(GE_int32(98)),
(T6)(GE_int32(118)),
(T6)(GE_int32(97)),
(T6)(GE_int32(118)),
(T6)(GE_int32(88)),
(T6)(GE_int32(83)),
(T6)(GE_int32(88)),
(T6)(GE_int32(22)),
(T6)(GE_int32(88)),
(T6)(GE_int32(86)),
(T6)(GE_int32(118)),
(T6)(GE_int32(82)),
(T6)(GE_int32(83)),
(T6)(GE_int32(80)),
(T6)(GE_int32(81)),
(T6)(GE_int32(81)),
(T6)(GE_int32(76)),
(T6)(GE_int32(78)),
(T6)(GE_int32(73)),
(T6)(GE_int32(118)),
(T6)(GE_int32(75)),
(T6)(GE_int32(74)),
(T6)(GE_int32(74)),
(T6)(GE_int32(67)),
(T6)(GE_int32(71)),
(T6)(GE_int32(68)),
(T6)(GE_int32(118)),
(T6)(GE_int32(118)),
(T6)(GE_int32(53)),
(T6)(GE_int32(54)),
(T6)(GE_int32(118)),
(T6)(GE_int32(118)),
(T6)(GE_int32(118)),
(T6)(GE_int32(25)),
(T6)(GE_int32(118)),
(T6)(GE_int32(118)),
(T6)(GE_int32(36)),
(T6)(GE_int32(41)),
(T6)(GE_int32(46)),
(T6)(GE_int32(51)),
(T6)(GE_int32(56)),
(T6)(GE_int32(61)),
(T6)(GE_int32(28)),
(T6)(GE_int32(66)),
(T6)(GE_int32(71)),
(T6)(GE_int32(76)),
(T6)(GE_int32(2147483647)));
	R = (T24f171(C, t1));
	ge56ov1788 = R;
	return R;
}

/* GEPP_PARSER.yy_chk_template */
unsigned char ge56os1787 = '\0';
T0* ge56ov1787;
T0* T24f159(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge56os1787) {
		return ge56ov1787;
	} else {
		ge56os1787 = '\1';
	}
	t1 = GE_ma65((T6)137,
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(0)),
(T6)(GE_int32(2)),
(T6)(GE_int32(0)),
(T6)(GE_int32(2)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(3)),
(T6)(GE_int32(13)),
(T6)(GE_int32(29)),
(T6)(GE_int32(29)),
(T6)(GE_int32(30)),
(T6)(GE_int32(13)),
(T6)(GE_int32(13)),
(T6)(GE_int32(30)),
(T6)(GE_int32(13)),
(T6)(GE_int32(44)),
(T6)(GE_int32(79)),
(T6)(GE_int32(79)),
(T6)(GE_int32(13)),
(T6)(GE_int32(70)),
(T6)(GE_int32(44)),
(T6)(GE_int32(73)),
(T6)(GE_int32(73)),
(T6)(GE_int32(73)),
(T6)(GE_int32(73)),
(T6)(GE_int32(73)),
(T6)(GE_int32(74)),
(T6)(GE_int32(74)),
(T6)(GE_int32(74)),
(T6)(GE_int32(74)),
(T6)(GE_int32(74)),
(T6)(GE_int32(75)),
(T6)(GE_int32(75)),
(T6)(GE_int32(75)),
(T6)(GE_int32(75)),
(T6)(GE_int32(75)),
(T6)(GE_int32(76)),
(T6)(GE_int32(76)),
(T6)(GE_int32(76)),
(T6)(GE_int32(76)),
(T6)(GE_int32(76)),
(T6)(GE_int32(77)),
(T6)(GE_int32(77)),
(T6)(GE_int32(77)),
(T6)(GE_int32(77)),
(T6)(GE_int32(77)),
(T6)(GE_int32(78)),
(T6)(GE_int32(66)),
(T6)(GE_int32(65)),
(T6)(GE_int32(78)),
(T6)(GE_int32(78)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(80)),
(T6)(GE_int32(81)),
(T6)(GE_int32(81)),
(T6)(GE_int32(81)),
(T6)(GE_int32(81)),
(T6)(GE_int32(81)),
(T6)(GE_int32(82)),
(T6)(GE_int32(62)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(82)),
(T6)(GE_int32(61)),
(T6)(GE_int32(60)),
(T6)(GE_int32(59)),
(T6)(GE_int32(58)),
(T6)(GE_int32(57)),
(T6)(GE_int32(55)),
(T6)(GE_int32(54)),
(T6)(GE_int32(53)),
(T6)(GE_int32(52)),
(T6)(GE_int32(51)),
(T6)(GE_int32(50)),
(T6)(GE_int32(49)),
(T6)(GE_int32(48)),
(T6)(GE_int32(46)),
(T6)(GE_int32(45)),
(T6)(GE_int32(43)),
(T6)(GE_int32(42)),
(T6)(GE_int32(41)),
(T6)(GE_int32(39)),
(T6)(GE_int32(37)),
(T6)(GE_int32(33)),
(T6)(GE_int32(32)),
(T6)(GE_int32(31)),
(T6)(GE_int32(28)),
(T6)(GE_int32(25)),
(T6)(GE_int32(23)),
(T6)(GE_int32(21)),
(T6)(GE_int32(20)),
(T6)(GE_int32(18)),
(T6)(GE_int32(15)),
(T6)(GE_int32(11)),
(T6)(GE_int32(9)),
(T6)(GE_int32(8)),
(T6)(GE_int32(7)),
(T6)(GE_int32(6)),
(T6)(GE_int32(5)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(2147483647)));
	R = (T24f171(C, t1));
	ge56ov1787 = R;
	return R;
}

/* GEPP_PARSER.yy_nxt_template */
unsigned char ge56os1786 = '\0';
T0* ge56ov1786;
T0* T24f158(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge56os1786) {
		return ge56ov1786;
	} else {
		ge56os1786 = '\1';
	}
	t1 = GE_ma65((T6)137,
(T6)(GE_int32(0)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(12)),
(T6)(GE_int32(72)),
(T6)(GE_int32(13)),
(T6)(GE_int32(14)),
(T6)(GE_int32(15)),
(T6)(GE_int32(16)),
(T6)(GE_int32(17)),
(T6)(GE_int32(14)),
(T6)(GE_int32(18)),
(T6)(GE_int32(19)),
(T6)(GE_int32(19)),
(T6)(GE_int32(19)),
(T6)(GE_int32(19)),
(T6)(GE_int32(19)),
(T6)(GE_int32(19)),
(T6)(GE_int32(19)),
(T6)(GE_int32(19)),
(T6)(GE_int32(19)),
(T6)(GE_int32(19)),
(T6)(GE_int32(20)),
(T6)(GE_int32(27)),
(T6)(GE_int32(42)),
(T6)(GE_int32(43)),
(T6)(GE_int32(44)),
(T6)(GE_int32(28)),
(T6)(GE_int32(29)),
(T6)(GE_int32(45)),
(T6)(GE_int32(30)),
(T6)(GE_int32(51)),
(T6)(GE_int32(35)),
(T6)(GE_int32(35)),
(T6)(GE_int32(31)),
(T6)(GE_int32(71)),
(T6)(GE_int32(52)),
(T6)(GE_int32(10)),
(T6)(GE_int32(10)),
(T6)(GE_int32(10)),
(T6)(GE_int32(10)),
(T6)(GE_int32(10)),
(T6)(GE_int32(11)),
(T6)(GE_int32(11)),
(T6)(GE_int32(11)),
(T6)(GE_int32(11)),
(T6)(GE_int32(11)),
(T6)(GE_int32(21)),
(T6)(GE_int32(21)),
(T6)(GE_int32(21)),
(T6)(GE_int32(21)),
(T6)(GE_int32(21)),
(T6)(GE_int32(23)),
(T6)(GE_int32(23)),
(T6)(GE_int32(23)),
(T6)(GE_int32(23)),
(T6)(GE_int32(23)),
(T6)(GE_int32(25)),
(T6)(GE_int32(25)),
(T6)(GE_int32(25)),
(T6)(GE_int32(25)),
(T6)(GE_int32(25)),
(T6)(GE_int32(33)),
(T6)(GE_int32(70)),
(T6)(GE_int32(69)),
(T6)(GE_int32(33)),
(T6)(GE_int32(33)),
(T6)(GE_int32(37)),
(T6)(GE_int32(37)),
(T6)(GE_int32(37)),
(T6)(GE_int32(37)),
(T6)(GE_int32(37)),
(T6)(GE_int32(39)),
(T6)(GE_int32(39)),
(T6)(GE_int32(39)),
(T6)(GE_int32(39)),
(T6)(GE_int32(39)),
(T6)(GE_int32(27)),
(T6)(GE_int32(68)),
(T6)(GE_int32(27)),
(T6)(GE_int32(27)),
(T6)(GE_int32(27)),
(T6)(GE_int32(67)),
(T6)(GE_int32(66)),
(T6)(GE_int32(65)),
(T6)(GE_int32(64)),
(T6)(GE_int32(63)),
(T6)(GE_int32(62)),
(T6)(GE_int32(61)),
(T6)(GE_int32(60)),
(T6)(GE_int32(59)),
(T6)(GE_int32(58)),
(T6)(GE_int32(57)),
(T6)(GE_int32(56)),
(T6)(GE_int32(55)),
(T6)(GE_int32(54)),
(T6)(GE_int32(53)),
(T6)(GE_int32(50)),
(T6)(GE_int32(49)),
(T6)(GE_int32(48)),
(T6)(GE_int32(40)),
(T6)(GE_int32(38)),
(T6)(GE_int32(47)),
(T6)(GE_int32(32)),
(T6)(GE_int32(46)),
(T6)(GE_int32(41)),
(T6)(GE_int32(26)),
(T6)(GE_int32(40)),
(T6)(GE_int32(38)),
(T6)(GE_int32(36)),
(T6)(GE_int32(34)),
(T6)(GE_int32(32)),
(T6)(GE_int32(26)),
(T6)(GE_int32(72)),
(T6)(GE_int32(24)),
(T6)(GE_int32(24)),
(T6)(GE_int32(22)),
(T6)(GE_int32(22)),
(T6)(GE_int32(9)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(72)),
(T6)(GE_int32(2147483647)));
	R = (T24f171(C, t1));
	ge56ov1786 = R;
	return R;
}

/* GEPP_PARSER.empty_buffer */
unsigned char ge144os1949 = '\0';
T0* ge144ov1949;
T0* T24f94(T0* C)
{
	T0* R = 0;
	if (ge144os1949) {
		return ge144ov1949;
	} else {
		ge144os1949 = '\1';
	}
	R = T44c12(GE_ms("", 0));
	ge144ov1949 = R;
	return R;
}

/* YY_BUFFER.make */
T0* T44c12(T0* a1)
{
	T0* l1 = 0;
	T6 l2 = 0;
	T0* C;
	T6 t1;
	C = (T0*)GE_alloc(sizeof(T44));
	*(T44*)C = GE_default44;
	t1 = (((T17*)(a1))->a2);
	l2 = ((T6)((t1)+((T6)(GE_int32(2)))));
	l1 = (T44f11(C, l2));
	T85f12(GE_void(l1), a1, (T6)(GE_int32(1)));
	t1 = ((T6)((l2)-((T6)(GE_int32(1)))));
	T85f9(GE_void(l1), (T2)('\000'), t1);
	T85f9(GE_void(l1), (T2)('\000'), l2);
	T44f17(C, l1);
	return C;
}

/* YY_BUFFER.make_from_buffer */
void T44f17(T0* C, T0* a1)
{
	T6 t1;
	t1 = (T85f4(GE_void(a1)));
	((T44*)(C))->a9 = ((T6)((t1)-((T6)(GE_int32(2)))));
	((T44*)(C))->a7 = ((T44*)(C))->a9;
	((T44*)(C))->a1 = a1;
	((T44*)(C))->a2 = (T6)(GE_int32(1));
	((T44*)(C))->a3 = (T6)(GE_int32(1));
	((T44*)(C))->a4 = (T6)(GE_int32(1));
	((T44*)(C))->a5 = (T6)(GE_int32(1));
	((T44*)(C))->a6 = EIF_TRUE;
}

/* KL_CHARACTER_BUFFER.fill_from_string */
void T85f12(T0* C, T0* a1, T6 a2)
{
	T6 l1 = 0;
	T1 t1;
	T6 t2;
	l1 = (((T17*)(a1))->a2);
	t1 = (T6f1(&l1, (T6)(GE_int32(0))));
	if (t1) {
		t1 = ((((T85*)(C))->a1)!=(EIF_VOID));
		if (t1) {
			t2 = ((T6)((a2)+((T6)(GE_int32(1)))));
			T17f42(GE_void(((T85*)(C))->a2), a1, (T6)(GE_int32(1)), l1, t2);
		} else {
			T17f42(GE_void(((T85*)(C))->a2), a1, (T6)(GE_int32(1)), l1, a2);
		}
	}
}

/* YY_BUFFER.new_default_buffer */
T0* T44f11(T0* C, T6 a1)
{
	T0* R = 0;
	R = T85c8(a1);
	return R;
}

/* UT_ERROR_HANDLER.make_standard */
T0* T23c6(void)
{
	T0* C;
	T0* t1;
	C = (T0*)GE_alloc(sizeof(T23));
	*(T23*)C = GE_default23;
	t1 = (T23f4(C));
	((T23*)(C))->a1 = (T30f3(GE_void(t1)));
	t1 = (T23f4(C));
	((T23*)(C))->a2 = (T30f3(GE_void(t1)));
	t1 = (T23f4(C));
	((T23*)(C))->a3 = (T30f1(GE_void(t1)));
	return C;
}

/* KL_STANDARD_FILES.error */
unsigned char ge305os3221 = '\0';
T0* ge305ov3221;
T0* T30f3(T0* C)
{
	T0* R = 0;
	if (ge305os3221) {
		return ge305ov3221;
	} else {
		ge305os3221 = '\1';
	}
	R = T39c9();
	ge305ov3221 = R;
	return R;
}

/* KL_STDERR_FILE.make */
T0* T39c9(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T39));
	*(T39*)C = GE_default39;
	T39f11(C, GE_ms("stderr", 6));
	return C;
}

/* KL_STDERR_FILE.make_open_stderr */
void T39f11(T0* C, T0* a1)
{
	T39f14(C, a1);
	((T39*)(C))->a1 = (T39f5(C, (T6)(GE_int32(2))));
	T39f15(C);
}

/* KL_STDERR_FILE.set_write_mode */
void T39f15(T0* C)
{
	((T39*)(C))->a3 = (T6)(GE_int32(2));
}

/* KL_STDERR_FILE.console_def */
T14 T39f5(T0* C, T6 a1)
{
	T14 R = 0;
	R = (T14)console_def(a1);
	return R;
}

/* KL_STDERR_FILE.old_make */
void T39f14(T0* C, T0* a1)
{
	((T39*)(C))->a2 = a1;
	((T39*)(C))->a3 = (T6)(GE_int32(0));
}

/* UT_ERROR_HANDLER.std */
T0* T23f4(T0* C)
{
	T0* R = 0;
	if (ge303os1569) {
		return ge303ov1569;
	} else {
		ge303os1569 = '\1';
	}
	R = T30c4();
	ge303ov1569 = R;
	return R;
}

/* KL_ARGUMENTS.set_program_name */
void T22f5(T0* C, T0* a1)
{
	((T22*)(C))->a1 = a1;
}

/* GEPP.arguments */
unsigned char ge319os1572 = '\0';
T0* ge319ov1572;
T0* T21f5(T0* C)
{
	T0* R = 0;
	if (ge319os1572) {
		return ge319ov1572;
	} else {
		ge319os1572 = '\1';
	}
	R = T22c4();
	ge319ov1572 = R;
	return R;
}

/* KL_ARGUMENTS.make */
T0* T22c4(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T22));
	*(T22*)C = GE_default22;
	((T22*)(C))->a1 = (T22f2(C, (T6)(GE_int32(0))));
	return C;
}

/* GEPP.resurrect_code */
void T21f11(T0* C)
{
	T0* l1 = 0;
	l1 = T25c3();
}

/* GEPP_TOO_MANY_INCLUDES_ERROR.default_message */
T0* T56f5(T0* C)
{
	T0* R = 0;
	R = (T56f3(C, ge58ov3620));
	return R;
}

/* GEPP_TOO_MANY_INCLUDES_ERROR.message */
T0* T56f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
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
	t1 = (T56f4(C));
	R = (T58f2(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f5(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				T17f30(GE_void(R), l5);
			} else {
				t1 = (T56f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T58f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				T17f30(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f5(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					T17f30(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T56f4(C));
					l1 = (T58f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f5(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									T17f30(GE_void(l1), l5);
								} else {
									t1 = (T56f4(C));
									T58f12(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f5(a1, l2));
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
								T17f30(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (T17f11(GE_void(l1)));
					if (t2) {
						l3 = (T17f12(GE_void(l1)));
						t2 = (T64f4(GE_void(((T56*)(C))->a1), l3));
						if (t2) {
							t1 = (T56f4(C));
							t5 = (T64f5(GE_void(((T56*)(C))->a1), l3));
							R = (T58f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T56f4(C));
								t5 = (T56f6(C));
								t5 = (((T22*)(GE_void(t5)))->a1);
								R = (T58f4(GE_void(t1), R, t5));
							} else {
								T17f30(GE_void(R), (T2)('$'));
								if (l7) {
									T17f30(GE_void(R), (T2)('{'));
								}
								t1 = (T56f4(C));
								R = (T58f4(GE_void(t1), R, l1));
								if (l8) {
									T17f30(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f30(GE_void(R), (T2)('$'));
						if (l7) {
							T17f30(GE_void(R), (T2)('{'));
						}
						t1 = (T56f4(C));
						R = (T58f4(GE_void(t1), R, l1));
						if (l8) {
							T17f30(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* GEPP_TOO_MANY_INCLUDES_ERROR.arguments */
T0* T56f6(T0* C)
{
	T0* R = 0;
	if (ge319os1572) {
		return ge319ov1572;
	} else {
		ge319os1572 = '\1';
	}
	R = T22c4();
	ge319ov1572 = R;
	return R;
}

/* ARRAY [STRING_8].valid_index */
T1 T64f4(T0* C, T6 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = (T6f6(&(((T64*)(C))->a2), a1));
	if (t1) {
		R = (T6f6(&a1, ((T64*)(C))->a3));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* STRING_8.to_integer */
T6 T17f12(T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T6 t1;
	l1 = (T17f16(C));
	t1 = ((T6)(GE_int32(0)));
	T83f17(GE_void(l1), C, t1);
	R = (T83f13(GE_void(l1)));
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
T6 T83f13(T0* C)
{
	T6 R = 0;
	T1 t1;
	T11 t2;
	T6 t3;
	t1 = ((((T83*)(C))->a1)==((T6)(GE_int32(1))));
	if (t1) {
		t2 = ((T11)((((T83*)(C))->a2)*((T11)(GE_nat64(10)))));
		t2 = ((T11)((t2)+(((T83*)(C))->a3)));
		t3 = ((T6)(t2));
		R = ((T6)(-(t3)));
	} else {
		t2 = ((T11)((((T83*)(C))->a2)*((T11)(GE_nat64(10)))));
		t2 = ((T11)((t2)+(((T83*)(C))->a3)));
		R = ((T6)(t2));
	}
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
void T83f17(T0* C, T0* a1, T6 a2)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T1 t1;
	T2 t2;
	T3 t3;
	T10 t4;
	T83f18(C, a2);
	l1 = (T6)(GE_int32(0));
	l2 = (((T17*)(a1))->a2);
	l3 = a1;
	t1 = ((l3)!=(EIF_VOID));
	if (t1) {
		l4 = (((T17*)(GE_void(l3)))->a1);
		t1 = ((l1)==(l2));
		if (!(t1)) {
			t1 = (T6f2(&(((T83*)(C))->a4), (T6)(GE_int32(4))));
		}
		while (!(t1)) {
			t2 = (((T15*)(GE_void(l4)))->z2[l1]);
			T83f23(C, t2);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t1 = ((l1)==(l2));
			if (!(t1)) {
				t1 = (T6f2(&(((T83*)(C))->a4), (T6)(GE_int32(4))));
			}
		}
	} else {
		l5 = EIF_VOID;
		t1 = ((l5)!=(EIF_VOID));
		if (t1) {
			l6 = ((GE_void(l5), (T0*)0));
			t1 = ((l1)==(l2));
			if (!(t1)) {
				t1 = (T6f2(&(((T83*)(C))->a4), (T6)(GE_int32(4))));
			}
			while (!(t1)) {
				t3 = ((GE_void(l6), l1, (T3)0));
				t2 = ((T2)(t3));
				T83f23(C, t2);
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				t1 = ((l1)==(l2));
				if (!(t1)) {
					t1 = (T6f2(&(((T83*)(C))->a4), (T6)(GE_int32(4))));
				}
			}
		} else {
			l1 = (T6)(GE_int32(1));
			l2 = (((T17*)(a1))->a2);
			t1 = (T6f1(&l1, l2));
			if (!(t1)) {
				t1 = (T6f2(&(((T83*)(C))->a4), (T6)(GE_int32(4))));
			}
			while (!(t1)) {
				t4 = (T17f25(a1, l1));
				t2 = ((T2)(t4));
				T83f23(C, t2);
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				t1 = (T6f1(&l1, l2));
				if (!(t1)) {
					t1 = (T6f2(&(((T83*)(C))->a4), (T6)(GE_int32(4))));
				}
			}
		}
	}
}

/* STRING_8.code */
T10 T17f25(T0* C, T6 a1)
{
	T10 R = 0;
	T6 t1;
	T2 t2;
	t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
	t2 = (((T15*)(GE_void(((T17*)(C))->a1)))->z2[t1]);
	t1 = ((T6)(t2));
	R = (T6f20(&t1));
	return R;
}

/* INTEGER_32.to_natural_32 */
T10 T6f20(T6* C)
{
	T10 R = 0;
	R = ((T10)(*C));
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.parse_character */
void T83f23(T0* C, T2 a1)
{
	T11 l1 = 0;
	T11 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	T11 t4;
	l3 = ((T83*)(C))->a4;
	t1 = (T6f6(&l3, (T6)(GE_int32(4))));
	if (t1) {
		switch (l3) {
		case (T6)(T6)(GE_int32(0)):
			t1 = (T2f2(&a1));
			if (t1) {
				l3 = (T6)(GE_int32(2));
				((T83*)(C))->a2 = (T11)(GE_nat64(0));
				t2 = ((T6)(a1));
				t2 = ((T6)((t2)-((T6)(GE_int32(48)))));
				((T83*)(C))->a3 = (T6f17(&t2));
			} else {
				t1 = ((a1)==((T2)('-')));
				if (!(t1)) {
					t1 = ((a1)==((T2)('+')));
				}
				if (t1) {
					l3 = (T6)(GE_int32(1));
					t1 = ((a1)==((T2)('-')));
					if (t1) {
						((T83*)(C))->a1 = (T6)(GE_int32(1));
					} else {
						((T83*)(C))->a1 = (T6)(GE_int32(0));
					}
				} else {
					if (((T83*)(C))->a9) {
						t1 = (T17f26(GE_void(((T83*)(C))->a7), a1));
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
		case (T6)(T6)(GE_int32(1)):
			t1 = (T2f2(&a1));
			if (t1) {
				((T83*)(C))->a2 = (T11)(GE_nat64(0));
				t2 = ((T6)(a1));
				t2 = ((T6)((t2)-((T6)(GE_int32(48)))));
				((T83*)(C))->a3 = (T6f17(&t2));
				t1 = ((((T83*)(C))->a6)!=((T6)(GE_int32(0))));
				if (t1) {
					t3 = (T83f14(C));
					t1 = (T92f7(GE_void(t3), ((T83*)(C))->a2, ((T83*)(C))->a3, ((T83*)(C))->a6, ((T83*)(C))->a1));
					if (t1) {
						((T83*)(C))->a5 = EIF_TRUE;
						((T83*)(C))->a2 = l1;
						((T83*)(C))->a3 = l2;
						l3 = (T6)(GE_int32(5));
					}
				}
				l3 = (T6)(GE_int32(2));
			} else {
				l3 = (T6)(GE_int32(4));
			}
			break;
		case (T6)(T6)(GE_int32(2)):
			t1 = (T2f2(&a1));
			if (t1) {
				l1 = ((T83*)(C))->a2;
				l2 = ((T83*)(C))->a3;
				t4 = ((T11)((((T83*)(C))->a2)*((T11)(GE_nat64(10)))));
				((T83*)(C))->a2 = ((T11)((t4)+(((T83*)(C))->a3)));
				t2 = ((T6)(a1));
				t2 = ((T6)((t2)-((T6)(GE_int32(48)))));
				((T83*)(C))->a3 = (T6f17(&t2));
				t1 = ((((T83*)(C))->a6)!=((T6)(GE_int32(0))));
				if (t1) {
					t3 = (T83f14(C));
					((T83*)(C))->a5 = (T92f7(GE_void(t3), ((T83*)(C))->a2, ((T83*)(C))->a3, ((T83*)(C))->a6, ((T83*)(C))->a1));
					t1 = (T83f15(C));
					if (t1) {
						((T83*)(C))->a2 = l1;
						((T83*)(C))->a3 = l2;
						l3 = (T6)(GE_int32(5));
					}
				}
			} else {
				if (((T83*)(C))->a10) {
					t1 = (T17f26(GE_void(((T83*)(C))->a8), a1));
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
		case (T6)(T6)(GE_int32(3)):
			if (((T83*)(C))->a10) {
				t1 = (T17f26(GE_void(((T83*)(C))->a8), a1));
			} else {
				t1 = EIF_FALSE;
			}
			if (t1) {
			} else {
				l3 = (T6)(GE_int32(4));
			}
			break;
		default:
			break;
		}
	}
	((T83*)(C))->a4 = l3;
}

/* STRING_TO_INTEGER_CONVERTOR.overflowed */
T1 T83f15(T0* C)
{
	T1 R = 0;
	if (((T83*)(C))->a5) {
		R = ((((T83*)(C))->a1)==((T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* INTEGER_OVERFLOW_CHECKER.will_overflow */
T1 T92f7(T0* C, T11 a1, T11 a2, T6 a3, T6 a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T1 t1;
	T6 t2;
	T11 t3;
	R = ((a3)!=((T6)(GE_int32(0))));
	if (R) {
		t1 = ((a3)==((T6)(GE_int32(1))));
		if (!(t1)) {
			t1 = ((a3)==((T6)(GE_int32(2))));
		}
		if (!(t1)) {
			t1 = ((a3)==((T6)(GE_int32(3))));
		}
		if (!(t1)) {
			t1 = ((a3)==((T6)(GE_int32(4))));
		}
		if (t1) {
			t2 = ((T6)((a4)*((T6)(GE_int32(4)))));
			l1 = ((T6)((t2)+(a3)));
			t3 = (((T96*)(GE_void(((T92*)(C))->a1)))->z2[l1]);
			t1 = (T11f4(&a1, t3));
			if (!(t1)) {
				t3 = (((T96*)(GE_void(((T92*)(C))->a1)))->z2[l1]);
				t1 = ((a1)==(t3));
				if (t1) {
					t3 = (((T96*)(GE_void(((T92*)(C))->a2)))->z2[l1]);
					R = (T11f4(&a2, t3));
				} else {
					R = EIF_FALSE;
				}
			} else {
				R = EIF_TRUE;
			}
		} else {
			l1 = ((T6)((a3)-((T6)(GE_int32(10)))));
			t1 = ((a4)==((T6)(GE_int32(1))));
			if (t1) {
				t1 = (T11f4(&a1, (T11)(GE_nat64(0))));
				if (!(t1)) {
					R = (T11f4(&a2, (T11)(GE_nat64(0))));
				} else {
					R = EIF_TRUE;
				}
			} else {
				t3 = (((T96*)(GE_void(((T92*)(C))->a3)))->z2[l1]);
				t1 = (T11f4(&a1, t3));
				if (!(t1)) {
					t3 = (((T96*)(GE_void(((T92*)(C))->a3)))->z2[l1]);
					t1 = ((a1)==(t3));
					if (t1) {
						t3 = (((T96*)(GE_void(((T92*)(C))->a4)))->z2[l1]);
						R = (T11f4(&a2, t3));
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

/* NATURAL_64.infix ">" */
T1 T11f4(T11* C, T11 a1)
{
	T1 R = 0;
	R = ((T1)((a1)<(*C)));
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
unsigned char ge544os5173 = '\0';
T0* ge544ov5173;
T0* T83f14(T0* C)
{
	T0* R = 0;
	if (ge544os5173) {
		return ge544ov5173;
	} else {
		ge544os5173 = '\1';
	}
	R = T92c13();
	ge544ov5173 = R;
	return R;
}

/* INTEGER_OVERFLOW_CHECKER.make */
T0* T92c13(void)
{
	T0* C;
	T6 t1;
	T4 t2;
	T11 t3;
	T5 t4;
	T7 t5;
	T8 t6;
	T9 t7;
	T10 t8;
	C = (T0*)GE_alloc(sizeof(T92));
	*(T92*)C = GE_default92;
	t1 = (T6)(GE_int32(4));
	t1 = ((T6)((t1)*((T6)(GE_int32(2)))));
	t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
	((T92*)(C))->a1 = T96c2(t1);
	t1 = (T6)(GE_int32(4));
	t1 = ((T6)((t1)*((T6)(GE_int32(2)))));
	t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
	((T92*)(C))->a2 = T96c2(t1);
	t2 = ((T4)(GE_int8(127)));
	t2 = ((T4)((t2)/((T4)(GE_int8(10)))));
	t3 = (T4f3(&t2));
	((T96*)(GE_void(((T92*)(C))->a1)))->z2[(T6)(GE_int32(1))] = (t3);
	t2 = ((T4)(GE_int8(127)));
	t2 = ((T4)((t2)%((T4)(GE_int8(10)))));
	t3 = (T4f3(&t2));
	((T96*)(GE_void(((T92*)(C))->a2)))->z2[(T6)(GE_int32(1))] = (t3);
	t4 = ((T5)(GE_int16(32767)));
	t4 = ((T5)((t4)/((T5)(GE_int16(10)))));
	t3 = (T5f3(&t4));
	((T96*)(GE_void(((T92*)(C))->a1)))->z2[(T6)(GE_int32(2))] = (t3);
	t4 = ((T5)(GE_int16(32767)));
	t4 = ((T5)((t4)%((T5)(GE_int16(10)))));
	t3 = (T5f3(&t4));
	((T96*)(GE_void(((T92*)(C))->a2)))->z2[(T6)(GE_int32(2))] = (t3);
	t1 = ((T6)(GE_int32(2147483647)));
	t1 = ((T6)((t1)/((T6)(GE_int32(10)))));
	t3 = (T6f17(&t1));
	((T96*)(GE_void(((T92*)(C))->a1)))->z2[(T6)(GE_int32(3))] = (t3);
	t1 = ((T6)(GE_int32(2147483647)));
	t1 = ((T6)((t1)%((T6)(GE_int32(10)))));
	t3 = (T6f17(&t1));
	((T96*)(GE_void(((T92*)(C))->a2)))->z2[(T6)(GE_int32(3))] = (t3);
	t5 = ((T7)(GE_int64(9223372036854775807)));
	t5 = ((T7)((t5)/((T7)(GE_int64(10)))));
	t3 = (T7f3(&t5));
	((T96*)(GE_void(((T92*)(C))->a1)))->z2[(T6)(GE_int32(4))] = (t3);
	t5 = ((T7)(GE_int64(9223372036854775807)));
	t5 = ((T7)((t5)%((T7)(GE_int64(10)))));
	t3 = (T7f3(&t5));
	((T96*)(GE_void(((T92*)(C))->a2)))->z2[(T6)(GE_int32(4))] = (t3);
	t2 = ((T4)(GE_int8(-128)));
	t2 = ((T4)((t2)/((T4)(GE_int8(10)))));
	t2 = ((T4)(-(t2)));
	t3 = (T4f3(&t2));
	((T96*)(GE_void(((T92*)(C))->a1)))->z2[(T6)(GE_int32(5))] = (t3);
	t2 = ((T4)(GE_int8(-128)));
	t2 = ((T4)((t2)%((T4)(GE_int8(10)))));
	t2 = ((T4)(-(t2)));
	t3 = (T4f3(&t2));
	((T96*)(GE_void(((T92*)(C))->a2)))->z2[(T6)(GE_int32(5))] = (t3);
	t4 = ((T5)(GE_int16(-32768)));
	t4 = ((T5)((t4)/((T5)(GE_int16(10)))));
	t4 = ((T5)(-(t4)));
	t3 = (T5f3(&t4));
	((T96*)(GE_void(((T92*)(C))->a1)))->z2[(T6)(GE_int32(6))] = (t3);
	t4 = ((T5)(GE_int16(-32768)));
	t4 = ((T5)((t4)%((T5)(GE_int16(10)))));
	t4 = ((T5)(-(t4)));
	t3 = (T5f3(&t4));
	((T96*)(GE_void(((T92*)(C))->a2)))->z2[(T6)(GE_int32(6))] = (t3);
	t1 = ((T6)(GE_int32(-2147483647)-1));
	t1 = ((T6)((t1)/((T6)(GE_int32(10)))));
	t1 = ((T6)(-(t1)));
	t3 = (T6f17(&t1));
	((T96*)(GE_void(((T92*)(C))->a1)))->z2[(T6)(GE_int32(7))] = (t3);
	t1 = ((T6)(GE_int32(-2147483647)-1));
	t1 = ((T6)((t1)%((T6)(GE_int32(10)))));
	t1 = ((T6)(-(t1)));
	t3 = (T6f17(&t1));
	((T96*)(GE_void(((T92*)(C))->a2)))->z2[(T6)(GE_int32(7))] = (t3);
	t5 = ((T7)(GE_int64(-9223372036854775807)-1));
	t5 = ((T7)((t5)/((T7)(GE_int64(10)))));
	t5 = ((T7)(-(t5)));
	t3 = (T7f3(&t5));
	((T96*)(GE_void(((T92*)(C))->a1)))->z2[(T6)(GE_int32(8))] = (t3);
	t5 = ((T7)(GE_int64(-9223372036854775807)-1));
	t5 = ((T7)((t5)%((T7)(GE_int64(10)))));
	t5 = ((T7)(-(t5)));
	t3 = (T7f3(&t5));
	((T96*)(GE_void(((T92*)(C))->a2)))->z2[(T6)(GE_int32(8))] = (t3);
	t1 = (T6)(GE_int32(4));
	t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
	((T92*)(C))->a3 = T96c2(t1);
	t1 = (T6)(GE_int32(4));
	t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
	((T92*)(C))->a4 = T96c2(t1);
	t6 = ((T8)(GE_nat8(255)));
	t6 = ((T8)((t6)/((T8)(GE_nat8(10)))));
	t3 = (T8f10(&t6));
	((T96*)(GE_void(((T92*)(C))->a3)))->z2[(T6)(GE_int32(1))] = (t3);
	t6 = ((T8)(GE_nat8(255)));
	t6 = ((T8)((t6)%((T8)(GE_nat8(10)))));
	t3 = (T8f10(&t6));
	((T96*)(GE_void(((T92*)(C))->a4)))->z2[(T6)(GE_int32(1))] = (t3);
	t7 = ((T9)(GE_nat16(65535)));
	t7 = ((T9)((t7)/((T9)(GE_nat16(10)))));
	t3 = (T9f3(&t7));
	((T96*)(GE_void(((T92*)(C))->a3)))->z2[(T6)(GE_int32(2))] = (t3);
	t7 = ((T9)(GE_nat16(65535)));
	t7 = ((T9)((t7)%((T9)(GE_nat16(10)))));
	t3 = (T9f3(&t7));
	((T96*)(GE_void(((T92*)(C))->a4)))->z2[(T6)(GE_int32(2))] = (t3);
	t8 = ((T10)(GE_nat32(4294967295)));
	t8 = ((T10)((t8)/((T10)(GE_nat32(10)))));
	t3 = (T10f4(&t8));
	((T96*)(GE_void(((T92*)(C))->a3)))->z2[(T6)(GE_int32(3))] = (t3);
	t8 = ((T10)(GE_nat32(4294967295)));
	t8 = ((T10)((t8)%((T10)(GE_nat32(10)))));
	t3 = (T10f4(&t8));
	((T96*)(GE_void(((T92*)(C))->a4)))->z2[(T6)(GE_int32(3))] = (t3);
	t3 = ((T11)(GE_nat64(18446744073709551615)));
	t3 = ((T11)((t3)/((T11)(GE_nat64(10)))));
	t3 = (T11f7(&t3));
	((T96*)(GE_void(((T92*)(C))->a3)))->z2[(T6)(GE_int32(4))] = (t3);
	t3 = ((T11)(GE_nat64(18446744073709551615)));
	t3 = ((T11)((t3)%((T11)(GE_nat64(10)))));
	t3 = (T11f7(&t3));
	((T96*)(GE_void(((T92*)(C))->a4)))->z2[(T6)(GE_int32(4))] = (t3);
	return C;
}

/* NATURAL_64.to_natural_64 */
T11 T11f7(T11* C)
{
	T11 R = 0;
	R = (*C);
	return R;
}

/* NATURAL_32.to_natural_64 */
T11 T10f4(T10* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* NATURAL_16.to_natural_64 */
T11 T9f3(T9* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* NATURAL_8.to_natural_64 */
T11 T8f10(T8* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* INTEGER_64.to_natural_64 */
T11 T7f3(T7* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* INTEGER_16.to_natural_64 */
T11 T5f3(T5* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* INTEGER_8.to_natural_64 */
T11 T4f3(T4* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* SPECIAL [NATURAL_64].make */
T0* T96c2(T6 a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T96)+a1*sizeof(T11));
	*(T96*)C = GE_default96;
	((T96*)(C))->z1 = a1;
	return C;
}

/* STRING_8.has */
T1 T17f26(T0* C, T2 a1)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T2 t2;
	l2 = ((T17*)(C))->a2;
	t1 = (T6f1(&l2, (T6)(GE_int32(0))));
	if (t1) {
		l3 = ((T17*)(C))->a1;
		t1 = ((l1)==(l2));
		if (!(t1)) {
			t2 = (((T15*)(GE_void(l3)))->z2[l1]);
			t1 = ((t2)==(a1));
		}
		while (!(t1)) {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t1 = ((l1)==(l2));
			if (!(t1)) {
				t2 = (((T15*)(GE_void(l3)))->z2[l1]);
				t1 = ((t2)==(a1));
			}
		}
		R = ((T1)((l1)<(l2)));
	}
	return R;
}

/* INTEGER_32.to_natural_64 */
T11 T6f17(T6* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* CHARACTER_8.is_digit */
T1 T2f2(T2* C)
{
	T1 R = 0;
	T2 t1;
	T6 t2;
	T8 t3;
	t1 = (*C);
	t2 = ((T6)(t1));
	t3 = (T2f4(C, t2));
	t3 = (T8f1(&t3, (T8)(GE_nat8(0x04))));
	R = (T8f2(&t3, (T8)(GE_nat8(0))));
	return R;
}

/* NATURAL_8.infix ">" */
T1 T8f2(T8* C, T8 a1)
{
	T1 R = 0;
	R = ((T1)((a1)<(*C)));
	return R;
}

/* NATURAL_8.infix "&" */
T8 T8f1(T8* C, T8 a1)
{
	T8 R = 0;
	R = ((T8)((*C)&(a1)));
	return R;
}

/* CHARACTER_8.character_types */
T8 T2f4(T2* C, T6 a1)
{
	T8 R = 0;
	T1 t1;
	T0* t2;
	t1 = ((T1)((a1)<((T6)(GE_int32(256)))));
	if (t1) {
		t2 = (T2f6(C));
		R = (((T94*)(GE_void(t2)))->z2[a1]);
	}
	return R;
}

/* CHARACTER_8.internal_character_types */
unsigned char ge37os93 = '\0';
T0* ge37ov93;
T0* T2f6(T2* C)
{
	T0* R = 0;
	T8 t1;
	if (ge37os93) {
		return ge37ov93;
	} else {
		ge37os93 = '\1';
	}
	R = T94c2((T6)(GE_int32(256)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(0))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(1))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(2))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(3))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(4))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(5))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(6))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(7))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(8))] = ((T8)(GE_nat8(0x20)));
	t1 = (T8)(GE_nat8(0x20));
	t1 = (T8f3(&t1, (T8)(GE_nat8(0x08))));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(9))] = (t1);
	t1 = (T8)(GE_nat8(0x20));
	t1 = (T8f3(&t1, (T8)(GE_nat8(0x08))));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(10))] = (t1);
	t1 = (T8)(GE_nat8(0x20));
	t1 = (T8f3(&t1, (T8)(GE_nat8(0x08))));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(11))] = (t1);
	t1 = (T8)(GE_nat8(0x20));
	t1 = (T8f3(&t1, (T8)(GE_nat8(0x08))));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(12))] = (t1);
	t1 = (T8)(GE_nat8(0x20));
	t1 = (T8f3(&t1, (T8)(GE_nat8(0x08))));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(13))] = (t1);
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(14))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(15))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(16))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(17))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(18))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(19))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(20))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(21))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(22))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(23))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(24))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(25))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(26))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(27))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(28))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(29))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(30))] = ((T8)(GE_nat8(0x20)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(31))] = ((T8)(GE_nat8(0x20)));
	t1 = (T8)(GE_nat8(0x08));
	t1 = (T8f3(&t1, (T8)(GE_nat8(0x80))));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(32))] = (t1);
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(33))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(34))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(35))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(36))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(37))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(38))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(39))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(40))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(41))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(42))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(43))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(44))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(45))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(46))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(47))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(48))] = ((T8)(GE_nat8(0x04)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(49))] = ((T8)(GE_nat8(0x04)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(50))] = ((T8)(GE_nat8(0x04)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(51))] = ((T8)(GE_nat8(0x04)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(52))] = ((T8)(GE_nat8(0x04)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(53))] = ((T8)(GE_nat8(0x04)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(54))] = ((T8)(GE_nat8(0x04)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(55))] = ((T8)(GE_nat8(0x04)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(56))] = ((T8)(GE_nat8(0x04)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(57))] = ((T8)(GE_nat8(0x04)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(58))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(59))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(60))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(61))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(62))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(63))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(64))] = ((T8)(GE_nat8(0x10)));
	t1 = (T8)(GE_nat8(0x01));
	t1 = (T8f3(&t1, (T8)(GE_nat8(0x40))));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(65))] = (t1);
	t1 = (T8)(GE_nat8(0x01));
	t1 = (T8f3(&t1, (T8)(GE_nat8(0x40))));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(66))] = (t1);
	t1 = (T8)(GE_nat8(0x01));
	t1 = (T8f3(&t1, (T8)(GE_nat8(0x40))));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(67))] = (t1);
	t1 = (T8)(GE_nat8(0x01));
	t1 = (T8f3(&t1, (T8)(GE_nat8(0x40))));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(68))] = (t1);
	t1 = (T8)(GE_nat8(0x01));
	t1 = (T8f3(&t1, (T8)(GE_nat8(0x40))));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(69))] = (t1);
	t1 = (T8)(GE_nat8(0x01));
	t1 = (T8f3(&t1, (T8)(GE_nat8(0x40))));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(70))] = (t1);
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(71))] = ((T8)(GE_nat8(0x01)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(72))] = ((T8)(GE_nat8(0x01)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(73))] = ((T8)(GE_nat8(0x01)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(74))] = ((T8)(GE_nat8(0x01)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(75))] = ((T8)(GE_nat8(0x01)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(76))] = ((T8)(GE_nat8(0x01)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(77))] = ((T8)(GE_nat8(0x01)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(78))] = ((T8)(GE_nat8(0x01)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(79))] = ((T8)(GE_nat8(0x01)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(80))] = ((T8)(GE_nat8(0x01)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(81))] = ((T8)(GE_nat8(0x01)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(82))] = ((T8)(GE_nat8(0x01)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(83))] = ((T8)(GE_nat8(0x01)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(84))] = ((T8)(GE_nat8(0x01)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(85))] = ((T8)(GE_nat8(0x01)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(86))] = ((T8)(GE_nat8(0x01)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(87))] = ((T8)(GE_nat8(0x01)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(88))] = ((T8)(GE_nat8(0x01)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(89))] = ((T8)(GE_nat8(0x01)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(90))] = ((T8)(GE_nat8(0x01)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(91))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(92))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(93))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(94))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(95))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(96))] = ((T8)(GE_nat8(0x10)));
	t1 = (T8)(GE_nat8(0x02));
	t1 = (T8f3(&t1, (T8)(GE_nat8(0x40))));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(97))] = (t1);
	t1 = (T8)(GE_nat8(0x02));
	t1 = (T8f3(&t1, (T8)(GE_nat8(0x40))));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(98))] = (t1);
	t1 = (T8)(GE_nat8(0x02));
	t1 = (T8f3(&t1, (T8)(GE_nat8(0x40))));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(99))] = (t1);
	t1 = (T8)(GE_nat8(0x02));
	t1 = (T8f3(&t1, (T8)(GE_nat8(0x40))));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(100))] = (t1);
	t1 = (T8)(GE_nat8(0x02));
	t1 = (T8f3(&t1, (T8)(GE_nat8(0x40))));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(101))] = (t1);
	t1 = (T8)(GE_nat8(0x02));
	t1 = (T8f3(&t1, (T8)(GE_nat8(0x40))));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(102))] = (t1);
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(103))] = ((T8)(GE_nat8(0x02)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(104))] = ((T8)(GE_nat8(0x02)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(105))] = ((T8)(GE_nat8(0x02)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(106))] = ((T8)(GE_nat8(0x02)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(107))] = ((T8)(GE_nat8(0x02)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(108))] = ((T8)(GE_nat8(0x02)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(109))] = ((T8)(GE_nat8(0x02)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(110))] = ((T8)(GE_nat8(0x02)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(111))] = ((T8)(GE_nat8(0x02)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(112))] = ((T8)(GE_nat8(0x02)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(113))] = ((T8)(GE_nat8(0x02)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(114))] = ((T8)(GE_nat8(0x02)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(115))] = ((T8)(GE_nat8(0x02)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(116))] = ((T8)(GE_nat8(0x02)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(117))] = ((T8)(GE_nat8(0x02)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(118))] = ((T8)(GE_nat8(0x02)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(119))] = ((T8)(GE_nat8(0x02)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(120))] = ((T8)(GE_nat8(0x02)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(121))] = ((T8)(GE_nat8(0x02)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(122))] = ((T8)(GE_nat8(0x02)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(123))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(124))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(125))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(126))] = ((T8)(GE_nat8(0x10)));
	((T94*)(GE_void(R)))->z2[(T6)(GE_int32(127))] = ((T8)(GE_nat8(0x20)));
	ge37ov93 = R;
	return R;
}

/* NATURAL_8.infix "|" */
T8 T8f3(T8* C, T8 a1)
{
	T8 R = 0;
	R = ((T8)((*C)|(a1)));
	return R;
}

/* SPECIAL [NATURAL_8].make */
T0* T94c2(T6 a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T94)+a1*sizeof(T8));
	*(T94*)C = GE_default94;
	((T94*)(C))->z1 = a1;
	return C;
}

/* STRING_TO_INTEGER_CONVERTOR.reset */
void T83f18(T0* C, T6 a1)
{
	((T83*)(C))->a4 = (T6)(GE_int32(0));
	((T83*)(C))->a2 = (T11)(GE_nat64(0));
	((T83*)(C))->a3 = (T11)(GE_nat64(0));
	((T83*)(C))->a1 = (T6)(GE_int32(0));
	((T83*)(C))->a6 = a1;
	((T83*)(C))->a5 = EIF_FALSE;
}

/* STRING_8.ctoi_convertor */
unsigned char ge541os1258 = '\0';
T0* ge541ov1258;
T0* T17f16(T0* C)
{
	T0* R = 0;
	if (ge541os1258) {
		return ge541ov1258;
	} else {
		ge541os1258 = '\1';
	}
	R = T83c16();
	T83f19(GE_void(R), GE_ms(" ", 1));
	T83f20(GE_void(R), GE_ms(" ", 1));
	T83f21(GE_void(R), EIF_TRUE);
	T83f22(GE_void(R), EIF_TRUE);
	ge541ov1258 = R;
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
void T83f22(T0* C, T1 a1)
{
	((T83*)(C))->a10 = a1;
}

/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
void T83f21(T0* C, T1 a1)
{
	((T83*)(C))->a9 = a1;
}

/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
void T83f20(T0* C, T0* a1)
{
	((T83*)(C))->a8 = T17c40(a1);
}

/* STRING_8.make_from_string */
T0* T17c40(T0* a1)
{
	T0* C;
	T1 t1;
	T0* t2;
	C = (T0*)GE_alloc(sizeof(T17));
	*(T17*)C = GE_default17;
	t1 = ((C)!=(a1));
	if (t1) {
		t2 = (((T17*)(a1))->a1);
		((T17*)(C))->a1 = (T15f3(GE_void(t2)));
		((T17*)(C))->a2 = (((T17*)(a1))->a2);
		((T17*)(C))->a3 = (T6)(GE_int32(0));
	}
	return C;
}

/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
void T83f19(T0* C, T0* a1)
{
	((T83*)(C))->a7 = T17c40(a1);
}

/* STRING_TO_INTEGER_CONVERTOR.make */
T0* T83c16(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T83));
	*(T83*)C = GE_default83;
	T83f18(C, (T6)(GE_int32(0)));
	T83f19(C, GE_ms(" ", 1));
	T83f20(C, GE_ms(" ", 1));
	return C;
}

/* STRING_8.is_integer */
T1 T17f11(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = ((T6)(GE_int32(3)));
	R = (T17f15(C, t1));
	return R;
}

/* STRING_8.is_valid_integer_or_natural */
T1 T17f15(T0* C, T6 a1)
{
	T1 R = 0;
	T0* l1 = 0;
	l1 = (T17f16(C));
	T83f18(GE_void(l1), a1);
	T83f17(GE_void(l1), C, a1);
	R = (T83f12(GE_void(l1)));
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.is_integral_integer */
T1 T83f12(T0* C)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T83*)(C))->a4)==((T6)(GE_int32(2))));
	if (!(t1)) {
		t1 = ((((T83*)(C))->a4)==((T6)(GE_int32(3))));
	}
	if (t1) {
		R = ((T1)(!(((T83*)(C))->a5)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEPP_TOO_MANY_INCLUDES_ERROR.string_ */
T0* T56f4(T0* C)
{
	T0* R = 0;
	if (ge273os1776) {
		return ge273ov1776;
	} else {
		ge273os1776 = '\1';
	}
	R = T58c11();
	ge273ov1776 = R;
	return R;
}

/* UT_SYNTAX_ERROR.default_message */
T0* T55f5(T0* C)
{
	T0* R = 0;
	R = (T55f3(C, ge219ov3620));
	return R;
}

/* UT_SYNTAX_ERROR.message */
T0* T55f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
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
	t1 = (T55f4(C));
	R = (T58f2(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f5(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				T17f30(GE_void(R), l5);
			} else {
				t1 = (T55f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T58f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				T17f30(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f5(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					T17f30(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T55f4(C));
					l1 = (T58f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f5(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									T17f30(GE_void(l1), l5);
								} else {
									t1 = (T55f4(C));
									T58f12(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f5(a1, l2));
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
								T17f30(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (T17f11(GE_void(l1)));
					if (t2) {
						l3 = (T17f12(GE_void(l1)));
						t2 = (T64f4(GE_void(((T55*)(C))->a1), l3));
						if (t2) {
							t1 = (T55f4(C));
							t5 = (T64f5(GE_void(((T55*)(C))->a1), l3));
							R = (T58f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T55f4(C));
								t5 = (T55f6(C));
								t5 = (((T22*)(GE_void(t5)))->a1);
								R = (T58f4(GE_void(t1), R, t5));
							} else {
								T17f30(GE_void(R), (T2)('$'));
								if (l7) {
									T17f30(GE_void(R), (T2)('{'));
								}
								t1 = (T55f4(C));
								R = (T58f4(GE_void(t1), R, l1));
								if (l8) {
									T17f30(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f30(GE_void(R), (T2)('$'));
						if (l7) {
							T17f30(GE_void(R), (T2)('{'));
						}
						t1 = (T55f4(C));
						R = (T58f4(GE_void(t1), R, l1));
						if (l8) {
							T17f30(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* UT_SYNTAX_ERROR.arguments */
T0* T55f6(T0* C)
{
	T0* R = 0;
	if (ge319os1572) {
		return ge319ov1572;
	} else {
		ge319os1572 = '\1';
	}
	R = T22c4();
	ge319ov1572 = R;
	return R;
}

/* UT_SYNTAX_ERROR.string_ */
T0* T55f4(T0* C)
{
	T0* R = 0;
	if (ge273os1776) {
		return ge273ov1776;
	} else {
		ge273os1776 = '\1';
	}
	R = T58c11();
	ge273ov1776 = R;
	return R;
}

/* UT_MESSAGE.default_message */
T0* T54f5(T0* C)
{
	T0* R = 0;
	R = (T54f3(C, ge217ov3620));
	return R;
}

/* UT_MESSAGE.message */
T0* T54f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
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
	t1 = (T54f4(C));
	R = (T58f2(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f5(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				T17f30(GE_void(R), l5);
			} else {
				t1 = (T54f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T58f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				T17f30(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f5(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					T17f30(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T54f4(C));
					l1 = (T58f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f5(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									T17f30(GE_void(l1), l5);
								} else {
									t1 = (T54f4(C));
									T58f12(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f5(a1, l2));
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
								T17f30(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (T17f11(GE_void(l1)));
					if (t2) {
						l3 = (T17f12(GE_void(l1)));
						t2 = (T64f4(GE_void(((T54*)(C))->a1), l3));
						if (t2) {
							t1 = (T54f4(C));
							t5 = (T64f5(GE_void(((T54*)(C))->a1), l3));
							R = (T58f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T54f4(C));
								t5 = (T54f6(C));
								t5 = (((T22*)(GE_void(t5)))->a1);
								R = (T58f4(GE_void(t1), R, t5));
							} else {
								T17f30(GE_void(R), (T2)('$'));
								if (l7) {
									T17f30(GE_void(R), (T2)('{'));
								}
								t1 = (T54f4(C));
								R = (T58f4(GE_void(t1), R, l1));
								if (l8) {
									T17f30(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f30(GE_void(R), (T2)('$'));
						if (l7) {
							T17f30(GE_void(R), (T2)('{'));
						}
						t1 = (T54f4(C));
						R = (T58f4(GE_void(t1), R, l1));
						if (l8) {
							T17f30(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* UT_MESSAGE.arguments */
T0* T54f6(T0* C)
{
	T0* R = 0;
	if (ge319os1572) {
		return ge319ov1572;
	} else {
		ge319os1572 = '\1';
	}
	R = T22c4();
	ge319ov1572 = R;
	return R;
}

/* UT_MESSAGE.string_ */
T0* T54f4(T0* C)
{
	T0* R = 0;
	if (ge273os1776) {
		return ge273ov1776;
	} else {
		ge273os1776 = '\1';
	}
	R = T58c11();
	ge273ov1776 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.default_message */
T0* T38f2(T0* C)
{
	T0* R = 0;
	R = (T38f4(C, ge213ov3620));
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.message */
T0* T38f4(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
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
	t1 = (T38f5(C));
	R = (T58f2(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f5(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				T17f30(GE_void(R), l5);
			} else {
				t1 = (T38f5(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T58f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				T17f30(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f5(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					T17f30(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T38f5(C));
					l1 = (T58f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f5(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									T17f30(GE_void(l1), l5);
								} else {
									t1 = (T38f5(C));
									T58f12(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f5(a1, l2));
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
								T17f30(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (T17f11(GE_void(l1)));
					if (t2) {
						l3 = (T17f12(GE_void(l1)));
						t2 = (T64f4(GE_void(((T38*)(C))->a1), l3));
						if (t2) {
							t1 = (T38f5(C));
							t5 = (T64f5(GE_void(((T38*)(C))->a1), l3));
							R = (T58f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T38f5(C));
								t5 = (T38f6(C));
								t5 = (((T22*)(GE_void(t5)))->a1);
								R = (T58f4(GE_void(t1), R, t5));
							} else {
								T17f30(GE_void(R), (T2)('$'));
								if (l7) {
									T17f30(GE_void(R), (T2)('{'));
								}
								t1 = (T38f5(C));
								R = (T58f4(GE_void(t1), R, l1));
								if (l8) {
									T17f30(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f30(GE_void(R), (T2)('$'));
						if (l7) {
							T17f30(GE_void(R), (T2)('{'));
						}
						t1 = (T38f5(C));
						R = (T58f4(GE_void(t1), R, l1));
						if (l8) {
							T17f30(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.arguments */
T0* T38f6(T0* C)
{
	T0* R = 0;
	if (ge319os1572) {
		return ge319ov1572;
	} else {
		ge319os1572 = '\1';
	}
	R = T22c4();
	ge319ov1572 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.string_ */
T0* T38f5(T0* C)
{
	T0* R = 0;
	if (ge273os1776) {
		return ge273ov1776;
	} else {
		ge273os1776 = '\1';
	}
	R = T58c11();
	ge273ov1776 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
T0* T37f2(T0* C)
{
	T0* R = 0;
	R = (T37f4(C, ge214ov3620));
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
T0* T37f4(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
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
	t1 = (T37f5(C));
	R = (T58f2(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f5(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				T17f30(GE_void(R), l5);
			} else {
				t1 = (T37f5(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T58f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				T17f30(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f5(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					T17f30(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T37f5(C));
					l1 = (T58f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f5(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									T17f30(GE_void(l1), l5);
								} else {
									t1 = (T37f5(C));
									T58f12(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f5(a1, l2));
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
								T17f30(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (T17f11(GE_void(l1)));
					if (t2) {
						l3 = (T17f12(GE_void(l1)));
						t2 = (T64f4(GE_void(((T37*)(C))->a1), l3));
						if (t2) {
							t1 = (T37f5(C));
							t5 = (T64f5(GE_void(((T37*)(C))->a1), l3));
							R = (T58f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T37f5(C));
								t5 = (T37f6(C));
								t5 = (((T22*)(GE_void(t5)))->a1);
								R = (T58f4(GE_void(t1), R, t5));
							} else {
								T17f30(GE_void(R), (T2)('$'));
								if (l7) {
									T17f30(GE_void(R), (T2)('{'));
								}
								t1 = (T37f5(C));
								R = (T58f4(GE_void(t1), R, l1));
								if (l8) {
									T17f30(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f30(GE_void(R), (T2)('$'));
						if (l7) {
							T17f30(GE_void(R), (T2)('{'));
						}
						t1 = (T37f5(C));
						R = (T58f4(GE_void(t1), R, l1));
						if (l8) {
							T17f30(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.arguments */
T0* T37f6(T0* C)
{
	T0* R = 0;
	if (ge319os1572) {
		return ge319ov1572;
	} else {
		ge319os1572 = '\1';
	}
	R = T22c4();
	ge319ov1572 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
T0* T37f5(T0* C)
{
	T0* R = 0;
	if (ge273os1776) {
		return ge273ov1776;
	} else {
		ge273os1776 = '\1';
	}
	R = T58c11();
	ge273ov1776 = R;
	return R;
}

/* UT_USAGE_MESSAGE.default_message */
T0* T36f2(T0* C)
{
	T0* R = 0;
	R = (T36f4(C, ge223ov3620));
	return R;
}

/* UT_USAGE_MESSAGE.message */
T0* T36f4(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
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
	t1 = (T36f5(C));
	R = (T58f2(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f5(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				T17f30(GE_void(R), l5);
			} else {
				t1 = (T36f5(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T58f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				T17f30(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f5(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					T17f30(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T36f5(C));
					l1 = (T58f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f5(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									T17f30(GE_void(l1), l5);
								} else {
									t1 = (T36f5(C));
									T58f12(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f5(a1, l2));
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
								T17f30(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (T17f11(GE_void(l1)));
					if (t2) {
						l3 = (T17f12(GE_void(l1)));
						t2 = (T64f4(GE_void(((T36*)(C))->a1), l3));
						if (t2) {
							t1 = (T36f5(C));
							t5 = (T64f5(GE_void(((T36*)(C))->a1), l3));
							R = (T58f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T36f5(C));
								t5 = (T36f6(C));
								t5 = (((T22*)(GE_void(t5)))->a1);
								R = (T58f4(GE_void(t1), R, t5));
							} else {
								T17f30(GE_void(R), (T2)('$'));
								if (l7) {
									T17f30(GE_void(R), (T2)('{'));
								}
								t1 = (T36f5(C));
								R = (T58f4(GE_void(t1), R, l1));
								if (l8) {
									T17f30(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f30(GE_void(R), (T2)('$'));
						if (l7) {
							T17f30(GE_void(R), (T2)('{'));
						}
						t1 = (T36f5(C));
						R = (T58f4(GE_void(t1), R, l1));
						if (l8) {
							T17f30(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* UT_USAGE_MESSAGE.arguments */
T0* T36f6(T0* C)
{
	T0* R = 0;
	if (ge319os1572) {
		return ge319ov1572;
	} else {
		ge319os1572 = '\1';
	}
	R = T22c4();
	ge319ov1572 = R;
	return R;
}

/* UT_USAGE_MESSAGE.string_ */
T0* T36f5(T0* C)
{
	T0* R = 0;
	if (ge273os1776) {
		return ge273ov1776;
	} else {
		ge273os1776 = '\1';
	}
	R = T58c11();
	ge273ov1776 = R;
	return R;
}

/* UT_VERSION_NUMBER.default_message */
T0* T34f2(T0* C)
{
	T0* R = 0;
	R = (T34f4(C, ge224ov3620));
	return R;
}

/* UT_VERSION_NUMBER.message */
T0* T34f4(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
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
	t1 = (T34f5(C));
	R = (T58f2(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f5(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				T17f30(GE_void(R), l5);
			} else {
				t1 = (T34f5(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T58f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				T17f30(GE_void(R), (T2)('$'));
			} else {
				l5 = (T17f5(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					T17f30(GE_void(R), (T2)('$'));
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T34f5(C));
					l1 = (T58f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f5(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									T17f30(GE_void(l1), l5);
								} else {
									t1 = (T34f5(C));
									T58f12(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f5(a1, l2));
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
								T17f30(GE_void(l1), l5);
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (T17f11(GE_void(l1)));
					if (t2) {
						l3 = (T17f12(GE_void(l1)));
						t2 = (T64f4(GE_void(((T34*)(C))->a1), l3));
						if (t2) {
							t1 = (T34f5(C));
							t5 = (T64f5(GE_void(((T34*)(C))->a1), l3));
							R = (T58f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T34f5(C));
								t5 = (T34f6(C));
								t5 = (((T22*)(GE_void(t5)))->a1);
								R = (T58f4(GE_void(t1), R, t5));
							} else {
								T17f30(GE_void(R), (T2)('$'));
								if (l7) {
									T17f30(GE_void(R), (T2)('{'));
								}
								t1 = (T34f5(C));
								R = (T58f4(GE_void(t1), R, l1));
								if (l8) {
									T17f30(GE_void(R), (T2)('}'));
								}
							}
						}
					} else {
						T17f30(GE_void(R), (T2)('$'));
						if (l7) {
							T17f30(GE_void(R), (T2)('{'));
						}
						t1 = (T34f5(C));
						R = (T58f4(GE_void(t1), R, l1));
						if (l8) {
							T17f30(GE_void(R), (T2)('}'));
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* UT_VERSION_NUMBER.arguments */
T0* T34f6(T0* C)
{
	T0* R = 0;
	if (ge319os1572) {
		return ge319ov1572;
	} else {
		ge319os1572 = '\1';
	}
	R = T22c4();
	ge319ov1572 = R;
	return R;
}

/* UT_VERSION_NUMBER.string_ */
T0* T34f5(T0* C)
{
	T0* R = 0;
	if (ge273os1776) {
		return ge273ov1776;
	} else {
		ge273os1776 = '\1';
	}
	R = T58c11();
	ge273ov1776 = R;
	return R;
}

T0* GE_ma65(T6 c, ...)
{
	T0* R;
	T0* t1;
	t1 = (T0*)GE_alloc(sizeof(T45)+c*sizeof(T6));
	((T0*)(t1))->id = 45;
	((T45*)(t1))->z1 = c;
	if (c!=0) {
		va_list v;
		T6 n = c;
		T6 *i = ((T45*)(t1))->z2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T6);
		}
		va_end(v);
	}
	R = (T0*)GE_alloc(sizeof(T65));
	((T0*)(R))->id = 65;
	((T65*)(R))->a1 = t1;
	((T65*)(R))->a2 = 1;
	((T65*)(R))->a3 = (T6)c;
	return R;
}

T0* ge403ov2942;
T0* ge407ov4264;
T0* ge380ov2218;
T0* ge405ov2942;
T0* ge410ov2942;
T0* ge404ov3525;
T0* ge391ov2198;
T0* ge308ov4466;
T0* ge310ov4466;
T0* ge308ov4467;
T0* ge299ov4694;
T0* ge299ov4693;
T0* ge310ov4467;
T0* ge316ov1568;
T0* ge58ov3620;
T0* ge219ov3620;
T0* ge217ov3620;
T0* ge213ov3620;
T0* ge214ov3620;
T0* ge223ov3620;
T0* ge224ov3620;

void GE_const_init()
{
	ge403ov2942 = (GE_ms("\n", 1));
	ge407ov4264 = (GE_ms("", 0));
	ge380ov2218 = (GE_ms("empty_name", 10));
	ge405ov2942 = (GE_ms("\n", 1));
	ge410ov2942 = (GE_ms("\n", 1));
	ge404ov3525 = (GE_ms("", 0));
	ge391ov2198 = (GE_ms("", 0));
	ge308ov4466 = (GE_ms(".", 1));
	ge310ov4466 = (GE_ms(".", 1));
	ge308ov4467 = (GE_ms("..", 2));
	ge299ov4694 = (GE_ms("..", 2));
	ge299ov4693 = (GE_ms(".", 1));
	ge310ov4467 = (GE_ms("..", 2));
	ge316ov1568 = (GE_ms("3.7", 3));
	ge58ov3620 = (GE_ms("$0: too many (i.e. $1) nested include files", 43));
	ge219ov3620 = (GE_ms("Syntax error in \"$1\" at line $2", 31));
	ge217ov3620 = (GE_ms("$1", 2));
	ge213ov3620 = (GE_ms("$0: cannot read \'$1\'", 20));
	ge214ov3620 = (GE_ms("$0: cannot write to \'$1\'", 24));
	ge223ov3620 = (GE_ms("usage: $0 $1", 12));
	ge224ov3620 = (GE_ms("$0 version $1", 13));
}

EIF_TYPE GE_types[100] = {
{0, 0, EIF_FALSE},
{0, 1, EIF_FALSE},
{0, 2, EIF_FALSE},
{0, 3, EIF_FALSE},
{0, 4, EIF_FALSE},
{0, 5, EIF_FALSE},
{0, 6, EIF_FALSE},
{0, 7, EIF_FALSE},
{0, 8, EIF_FALSE},
{0, 9, EIF_FALSE},
{0, 10, EIF_FALSE},
{0, 11, EIF_FALSE},
{0, 12, EIF_FALSE},
{0, 13, EIF_FALSE},
{0, 14, EIF_FALSE},
{0, 15, EIF_TRUE},
{0, 16, EIF_TRUE},
{0, 17, EIF_FALSE},
{0, 18, EIF_FALSE},
{0, 19, EIF_FALSE},
{0, 20, EIF_FALSE},
{0, 21, EIF_FALSE},
{0, 22, EIF_FALSE},
{0, 23, EIF_FALSE},
{0, 24, EIF_FALSE},
{0, 25, EIF_FALSE},
{0, 26, EIF_FALSE},
{0, 27, EIF_FALSE},
{0, 28, EIF_FALSE},
{0, 29, EIF_FALSE},
{0, 30, EIF_FALSE},
{0, 31, EIF_FALSE},
{0, 32, EIF_FALSE},
{0, 33, EIF_FALSE},
{0, 34, EIF_FALSE},
{0, 35, EIF_FALSE},
{0, 36, EIF_FALSE},
{0, 37, EIF_FALSE},
{0, 38, EIF_FALSE},
{0, 39, EIF_FALSE},
{0, 40, EIF_FALSE},
{0, 41, EIF_FALSE},
{0, 42, EIF_FALSE},
{0, 43, EIF_FALSE},
{0, 44, EIF_FALSE},
{0, 45, EIF_TRUE},
{0, 46, EIF_FALSE},
{0, 47, EIF_FALSE},
{0, 48, EIF_TRUE},
{0, 49, EIF_FALSE},
{0, 50, EIF_TRUE},
{0, 51, EIF_FALSE},
{0, 52, EIF_TRUE},
{0, 53, EIF_FALSE},
{0, 54, EIF_FALSE},
{0, 55, EIF_FALSE},
{0, 56, EIF_FALSE},
{0, 57, EIF_FALSE},
{0, 58, EIF_FALSE},
{0, 59, EIF_FALSE},
{0, 60, EIF_FALSE},
{0, 61, EIF_FALSE},
{0, 62, EIF_FALSE},
{0, 63, EIF_FALSE},
{0, 64, EIF_FALSE},
{0, 65, EIF_FALSE},
{0, 66, EIF_FALSE},
{0, 67, EIF_FALSE},
{0, 68, EIF_FALSE},
{0, 69, EIF_FALSE},
{0, 70, EIF_FALSE},
{0, 71, EIF_FALSE},
{0, 72, EIF_FALSE},
{0, 73, EIF_TRUE},
{0, 74, EIF_FALSE},
{0, 75, EIF_FALSE},
{0, 76, EIF_FALSE},
{0, 77, EIF_FALSE},
{0, 78, EIF_FALSE},
{0, 79, EIF_FALSE},
{0, 80, EIF_FALSE},
{0, 81, EIF_FALSE},
{0, 82, EIF_FALSE},
{0, 83, EIF_FALSE},
{0, 84, EIF_FALSE},
{0, 85, EIF_FALSE},
{0, 86, EIF_FALSE},
{0, 87, EIF_FALSE},
{0, 88, EIF_FALSE},
{0, 89, EIF_FALSE},
{0, 90, EIF_FALSE},
{0, 91, EIF_FALSE},
{0, 92, EIF_FALSE},
{0, 93, EIF_FALSE},
{0, 94, EIF_TRUE},
{0, 95, EIF_FALSE},
{0, 96, EIF_TRUE},
{0, 97, EIF_FALSE},
{0, 98, EIF_FALSE},
{0, 99, EIF_FALSE}
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
	t1 = T21c10();
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
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_GC_C
#define GE_GC_C

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
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_FILE_C
#define EIF_FILE_C

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

void file_mkdir(char* dirname) {
#ifdef WIN32
	mkdir(dirname);
#else
	mkdir(dirname, 0777);
#endif
}

void file_rename(char* from, char* to) {
#ifdef WIN32
	struct stat buf;

	if (stat(to, &buf) != -1) {
		remove(to);
	}
#endif
	rename(from, to);
}

void file_link(char *from, char *to) {
		/* Link file `from' into `to' */
#ifdef HAS_LINK
	link(from, to);
#endif
}

void file_unlink(char *name) {
		/* Delete file or directory `name' */
	struct stat buf;

	if (stat(name, &buf) != -1) {
		if (buf.st_mode & S_IFDIR) {
			rmdir(name);
		} else {
			remove(name);
		}
	}
}

static char* file_open_mode(int how) {
	switch (how) {
	case 0: 
		return "r";
	case 1:
		return "w";
	case 2:
		return "a";
	case 3:
		return "r+";
	case 4:
		return "w+";
	case 5:
		return "a+";
	case 10: 
		return "rb";
	case 11:
		return "wb";
	case 12:
		return "ab";
	case 13:
		return "rb+";
	case 14:
		return "wb+";
	case 15:
		return "ab+";
	default:
		return "r";
	}
}

EIF_POINTER file_open(char *name, int how) {
	/* TODO: raise an exception if could not open file */
	return (EIF_POINTER)fopen(name, file_open_mode(how));
}

EIF_POINTER file_dopen(int fd, int how) {
	/* TODO: raise an exception if could not open file */
	return (EIF_POINTER)fdopen(fd, file_open_mode(how));
}

EIF_POINTER file_reopen(char *name, int how, FILE *old) {
	/* TODO: raise an exception if could not open file */
	return (EIF_POINTER)freopen(name, file_open_mode(how), old);
}

void file_close(FILE *fp) {
	fclose(fp);
}

void file_flush(FILE *fp) {
	fflush(fp);
}

EIF_INTEGER file_fd(FILE *f) {
	return (EIF_INTEGER)fileno(f);
}

EIF_CHARACTER file_gc(FILE *f) {
	return (EIF_CHARACTER)getc(f);
}

EIF_INTEGER file_gs(FILE *f, char *s, EIF_INTEGER bound, EIF_INTEGER start) {
	EIF_INTEGER amount;
	int c = '\0';
	EIF_INTEGER read;

	amount = bound - start;
	s += start;
	read = 0;
	while (amount-- > 0) {
		if ((c = getc(f)) == '\n' || c == EOF)
			break;
		*s++ = c;
		read++;
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

EIF_INTEGER file_gss(FILE* f, char* s, EIF_INTEGER bound) {
	return (EIF_INTEGER)fread((void*)s, (size_t)1, (size_t)bound, f);
}

EIF_INTEGER file_gw(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start) {
	EIF_INTEGER amount;
	int c = 0;

	amount = bound - start;
	s += start;
	if (start == 0) {
		while ((c = getc(f)) != EOF)
			if (!isspace(c))
				break;
		if (c == EOF)
			return (EIF_INTEGER) 0;
		else
			ungetc(c, f);
	}
	while (amount-- > 0) {
		c = getc(f);
		if (c == EOF)
			break;
		if (isspace(c)) {
			ungetc(c, f);
			break;
		}
		*s++ = c;
	}
	if (c == EOF || isspace(c))
		return bound - start - amount - 1;
	return bound - start + 1;
}

EIF_CHARACTER file_lh(FILE *f) {
	int c;

	c = getc(f);
	if (c != EOF)
		ungetc(c, f);
	return (EIF_CHARACTER)(c == EOF ? (char)0 : (char)c);
}

EIF_INTEGER eif_file_size(FILE *fp) {
	struct stat buf;

	fflush (fp);
	if (fstat(fileno(fp), &buf) == -1)
		return (EIF_INTEGER)0;
	else
		return (EIF_INTEGER)(buf.st_size);
}

void file_tnil(FILE *f) {
	int c;

	while ((c = getc(f)) != '\n' && c != EOF)
		;
}

EIF_INTEGER file_tell(FILE *f) {
	return (EIF_INTEGER)ftell(f);
}

void file_touch(char *name) {
	file_utime(name, time((time_t *) 0), 2);
}

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
	utime(name, &tp);
}

void file_stat(char *path, struct stat *buf) {
	stat(path, buf);
}

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
				break;
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
				break;
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
				break;
			}
		break;
	default:
		break;
	}
    file_chmod(name, fmode);
}

void file_chmod(char *path, int mode) {
	chmod(path, mode);
}

void file_chown(char *name, int uid) {
#ifdef HAS_CHOWN
	int gid;
	struct stat buf;
	
	file_stat(name, &buf);
	gid = buf.st_gid;
	chown(name, uid, gid);
#endif
}

void file_chgrp(char *name, int gid) {
#ifdef HAS_CHOWN
	int uid;
	struct stat buf;
	
	file_stat(name, &buf);
	uid = buf.st_uid;
	chown(name, uid, gid);
#endif
}

void file_tnwl(FILE *f) {
	putc('\n', f);
}

void file_append(FILE *f, FILE *other, EIF_INTEGER l) {
	size_t amount;
	char buffer[512];
	int bufsize = 512;

	fseek(other, 0, SEEK_SET);
	fseek(f, 0, SEEK_END);
	while (l > 0) {
		amount = l;
		if (l < bufsize)
			amount = l;
		else
			amount = bufsize;
		if (amount != fread(buffer, sizeof(char), amount, other))
			break;
		l -= amount;
		if (amount != fwrite(buffer, sizeof(char), amount, f))
			break;
	}
}

void file_ps(FILE *f, char *str, EIF_INTEGER len) {
	fwrite(str, sizeof(char) * len, 1, f);
}

void file_pc(FILE *f, char c) {
	putc(c, f);
}

void file_go(FILE *f, EIF_INTEGER pos) {
	fseek(f, pos, SEEK_SET);
	clearerr(f);
}

void file_recede(FILE *f, EIF_INTEGER pos) {
	fseek(f, -pos, SEEK_END);
	clearerr(f);
}

void file_move(FILE *f, EIF_INTEGER pos) {
	fseek(f, pos, SEEK_CUR);
	clearerr(f);
}

EIF_BOOLEAN file_feof(FILE *fp) {
	return (EIF_BOOLEAN)(feof(fp) != 0);
}

EIF_BOOLEAN file_exists(char *name) {
	struct stat buf;

	return ((stat(name, &buf) == -1) ? EIF_FALSE : EIF_TRUE);
}

EIF_BOOLEAN file_path_exists(char *name) {
	struct stat buf;

	return ((stat(name, &buf) == -1) ? EIF_FALSE : EIF_TRUE);
}

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

static void swallow_nl(FILE *f) {
		/* Swallow next character if it is a new line */
	if (f != stdin) {
		fscanf (f, "\n");
	} else {
		int c;
		c = getc(f);
		if (c != '\n')
			ungetc(c, f);
	}
}

EIF_INTEGER file_gi(FILE *f) {
	EIF_INTEGER i;     

	fscanf(f, "%d", &i);
	swallow_nl(f);
	return i;
}

EIF_REAL_32 file_gr(FILE *f) {
	EIF_REAL_32 r;     

	fscanf(f, "%f", &r);
	swallow_nl(f);
	return r;
}

EIF_REAL_64 file_gd(FILE *f) {
	EIF_REAL_64 d;     

	fscanf(f, "%lf", &d);
	swallow_nl(f);
	return d;
}

void file_pi(FILE *f, EIF_INTEGER number) {
	fprintf(f, "%d", number);
}

void file_pr(FILE *f, EIF_REAL_32 number) {
    fprintf (f, "%g", number);
}

void file_pd(FILE *f, EIF_REAL_64 val) {
	fprintf(f, "%.17g", val);
}

EIF_INTEGER stat_size(void) {
	return (EIF_INTEGER)sizeof(struct stat);
}

EIF_BOOLEAN file_eaccess(struct stat *buf, int op) {
	int mode = buf->st_mode & ST_MODE;	/* Current mode */
#ifndef WIN32
	int uid = buf->st_uid;				/* File owner */
	int gid = buf->st_gid;				/* File group */
	int euid, egid;						/* Effective user and group */
#endif

    switch (op) {
	case 0: /* Is file readable */
#ifdef WIN32
		return ((mode && S_IREAD) ? EIF_TRUE : EIF_FALSE);
#else
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
	case 1: /* Is file writable */
#ifdef WIN32
		return ((mode & S_IWRITE) ? EIF_TRUE : EIF_FALSE);
#else
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
	case 2: /* Is file executable */
#ifdef WIN32
		return EIF_TRUE;
#else
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
	case 3: /* Is file setuid */
#ifdef WIN32
		return EIF_FALSE;
#else
		return ((mode & S_ISUID) ? EIF_TRUE : EIF_FALSE);
#endif
	case 4: /* Is file setgid */
#ifdef WIN32
		return EIF_FALSE;
#else
		return ((mode & S_ISGID) ? EIF_TRUE : EIF_FALSE);
#endif
	case 5: /* Is file sticky */
#ifdef WIN32
		return EIF_FALSE;
#else
		return ((mode & S_ISVTX) ? EIF_TRUE : EIF_FALSE);
#endif
	case 6: /* Is file owned by effective UID */
#ifdef WIN32
		return EIF_TRUE;
#else
		return ((uid == geteuid()) ? EIF_TRUE : EIF_FALSE);
#endif
	case 7: /* Is file owned by real UID */
#ifdef WIN32
		return EIF_TRUE;
#else
		return ((uid == getuid()) ? EIF_TRUE : EIF_FALSE);
#endif
	default:
		break;
	}
	return EIF_FALSE;
}

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
		return (EIF_INTEGER)0;
	case 14: /* Is file a device */
		if (buf->st_mode & S_IFCHR)
			return (EIF_INTEGER)S_IFCHR;
		if (buf->st_mode & S_IFBLK)
			return (EIF_INTEGER)S_IFBLK;
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
		break;
    }
	return (EIF_INTEGER)0;
}

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
	return GE_ms(str, strlen(str));
}

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
	return GE_ms(str, strlen(str));
}

EIF_INTEGER file_gib(FILE* f) {
	EIF_INTEGER i;     

	fread (&i, sizeof(EIF_INTEGER), 1, f);
	return i;
}

EIF_REAL_32 file_grb(FILE* f) {
	EIF_REAL_32 r;     

	fread (&r, sizeof(EIF_REAL_32), 1, f);
	return r;
}

EIF_REAL_64 file_gdb(FILE* f) {
	EIF_REAL_64 d;     

	fread (&d, sizeof(EIF_REAL_64), 1, f);
	return d;
}

EIF_POINTER file_binary_open(char* name, int how) {
	/* TODO: raise an exception if could not open file */
	if (how < 10)
		return (EIF_POINTER)fopen(name, file_open_mode(how + 10));
	else
		return (EIF_POINTER)fopen(name, file_open_mode(how));
}

EIF_POINTER file_binary_dopen(int fd, int how) {
	/* TODO: raise an exception if could not open file */
	if (how < 10)
		return (EIF_POINTER)fdopen(fd, file_open_mode(how + 10));
	else
		return (EIF_POINTER)fdopen(fd, file_open_mode(how));
}

EIF_POINTER file_binary_reopen(char* name, int how, FILE* old) {
	/* TODO: raise an exception if could not open file */
	if (how < 10)
		return (EIF_POINTER)freopen(name, file_open_mode(how + 10), old);
	else
		return (EIF_POINTER)freopen(name, file_open_mode(how), old);
}

void file_pib(FILE* f, EIF_INTEGER number) {
	fwrite(&number, sizeof(EIF_INTEGER), 1, f);
}

void file_prb(FILE* f, EIF_REAL_32 number) {
    fwrite(&number, sizeof(EIF_REAL_32), 1, f);
}

void file_pdb(FILE* f, EIF_REAL_64 val) {
	fwrite (&val, sizeof(EIF_REAL_64), 1, f);
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
			return GE_ms(s,strlen(s));
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
			return GE_ms(s,strlen(s));
		}
	}
#else
	struct dirent* p = readdir((DIR*)dir);
	if (p) {
		char* s = p->d_name;
		return GE_ms(s,strlen(s));
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
	result = GE_ms(s, strlen(s));
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
