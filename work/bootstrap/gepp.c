#include "gepp.h"

T0* gems(char* s, int c)
{
	T0* R;
	T0* a;
	a = (T0*)gealloc(sizeof(T15)+c*sizeof(T1));
	((T15*)(a))->id = 15;
	((T15*)(a))->a1 = (c+1);
	memcpy(((T15*)(a))->a2, s, c);
	R = (T0*)gealloc(sizeof(T16));
	((T16*)(R))->id = 16;
	((T16*)(R))->a1 = a;
	((T16*)(R))->a2 = (T4)c;
	return R;
}

/* Call to UT_ERROR.default_message */
T0* T32x3309(T0* C)
{
	int z1 = C->id;
if (z1<=34) {
if (z1<=33) {
if (z1==31) {
	return (T31f2(C));
} else {
	return (T33f2(C));
}
} else {
	return (T34f2(C));
}
} else {
if (z1<=51) {
if (z1==35) {
	return (T35f2(C));
} else {
	return (T51f1(C));
}
} else {
	return (T52f1(C));
}
}
	return 0;
}

/* GEPP.execute */
T0* T18c10()
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T18));
	((T18*)(C))->id = 18;
	if (EIF_FALSE) {
		T18f11(C);
	}
	t1 = (T18f1(C));
	T19f5(t1, gems("gepp", 4));
	((T18*)(C))->a2 = T20c6();
	((T18*)(C))->a3 = T21c170(((T18*)(C))->a2);
	((T18*)(C))->a4 = (gems("-", 1));
	((T18*)(C))->a5 = (gems("-", 1));
	T18f12(C);
	T18f13(C);
	return C;
}

/* GEPP.preprocess */
void T18f13(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	T2 t3;
	t1 = (T16f3(((T18*)(C))->a5, gems("-", 1)));
	t1 = ((T2)(!(t1)));
	if (t1) {
		l2 = T25c24(((T18*)(C))->a5);
		T25f25(l2);
		t1 = (T25f1(l2));
		if (t1) {
			T21f174(((T18*)(C))->a3, l2);
		} else {
			T18f17(C, ((T18*)(C))->a5);
			t2 = (T18f6(C));
			T23f2(t2, (T4)(geint32(1)));
		}
	} else {
		t2 = (T18f7(C));
		t2 = (T27f1(t2));
		T21f174(((T18*)(C))->a3, t2);
	}
	t1 = (T16f3(((T18*)(C))->a4, gems("-", 1)));
	if (t1) {
		t2 = (T18f7(C));
		t2 = (T27f2(t2));
		T21f175(((T18*)(C))->a3, t2);
	} else {
		l1 = T24c36(((T18*)(C))->a4);
		T24f37(l1);
		t1 = (T24f1(l1));
		if (t1) {
			T21f175(((T18*)(C))->a3, l1);
			T24f38(l1);
		} else {
			T18f18(C, ((T18*)(C))->a4);
			t2 = (T18f6(C));
			T23f2(t2, (T4)(geint32(1)));
		}
	}
	t1 = (T21f1(((T18*)(C))->a3));
	if (t1) {
		t2 = (T18f6(C));
		T23f2(t2, (T4)(geint32(1)));
	}
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t3 = (T25f2(l2));
		t1 = ((T2)(!(t3)));
	}
	if (t1) {
		T25f26(l2);
	}
}

/* KL_TEXT_OUTPUT_FILE.close */
void T25f26(T0* C)
{
	T2 l1 = 0;
	T2 t1;
	t1 = ((T2)(!(l1)));
	if (t1) {
		T25f32(C);
	}
}

/* KL_TEXT_OUTPUT_FILE.old_close */
void T25f32(T0* C)
{
	T25f35(C, ((T25*)(C))->a17);
	((T25*)(C))->a5 = ((T4)(geint32(0)));
	((T25*)(C))->a18 = (EIF_FALSE);
}

/* KL_TEXT_OUTPUT_FILE.file_close */
void T25f35(T0* C, T14 a1)
{
	file_close((FILE *)a1);
}

/* KL_TEXT_OUTPUT_FILE.is_closed */
T2 T25f2(T0* C)
{
	T2 R = 0;
	R = (T25f4(C));
	return R;
}

/* KL_TEXT_OUTPUT_FILE.old_is_closed */
T2 T25f4(T0* C)
{
	T2 R = 0;
	R = ((((T25*)(C))->a5)==((T4)(geint32(0))));
	return R;
}

/* GEPP_PARSER.syntax_error */
T2 T21f1(T0* C)
{
	T2 R = 0;
	R = ((((T21*)(C))->a2)!=((T4)(geint32(101))));
	return R;
}

/* GEPP.report_cannot_read_error */
void T18f18(T0* C, T0* a1)
{
	T0* l1 = 0;
	l1 = T35c7(a1);
	T20f8(((T18*)(C))->a2, l1);
}

/* UT_ERROR_HANDLER.report_error */
void T20f8(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T20f5(C, a1));
	T20f10(C, t1);
}

/* UT_ERROR_HANDLER.report_error_message */
void T20f10(T0* C, T0* a1)
{
	T36f10(((T20*)(C))->a1, a1);
}

/* KL_STDERR_FILE.put_line */
void T36f10(T0* C, T0* a1)
{
	T36f11(C, a1);
	T36f14(C);
}

/* KL_STDERR_FILE.put_new_line */
void T36f14(T0* C)
{
	T36f11(C, ge388ov2659);
}

/* KL_STDERR_FILE.put_string */
void T36f11(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T36f1(C));
	l1 = (T54f1(t1, a1));
	T36f15(C, l1);
}

/* KL_STDERR_FILE.old_put_string */
void T36f15(T0* C, T0* a1)
{
	T0* l1 = 0;
	T4 t1;
	T2 t2;
	T57 t3;
	T14 t4;
	t1 = (((T16*)(a1))->a2);
	t2 = ((t1)!=((T4)(geint32(0))));
	if (t2) {
		l1 = (((T16*)(a1))->a1);
		t3.id = 57;
		t3.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
		t4 = (T57f2(&t3));
		t1 = (((T16*)(a1))->a2);
		T36f19(C, ((T36*)(C))->a2, t4, t1);
	}
}

/* KL_STDERR_FILE.console_ps */
void T36f19(T0* C, T14 a1, T14 a2, T4 a3)
{
	console_ps((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
}

/* TYPED_POINTER [ANY].to_pointer */
T14 T57f2(T57* C)
{
	T14 R = 0;
	R = ((*C).a1);
	return R;
}

/* KL_STRING_ROUTINES.as_string */
T0* T54f1(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* t1;
	T2 t2;
	t1 = (T54f6(C));
	t2 = (T75f1(t1, a1, ge392ov3909));
	if (t2) {
		R = (a1);
	} else {
		l1 = EIF_VOID;
		t2 = ((l1)!=(EIF_VOID));
		if (t2) {
			R = ((T0*)gevoid(l1));
		} else {
			R = (T16f10(a1));
		}
	}
	return R;
}

/* STRING.string */
T0* T16f10(T0* C)
{
	T0* R = 0;
	R = T16c25(((T16*)(C))->a2);
	T16f32(R, C);
	return R;
}

/* STRING.append */
void T16f32(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	l2 = (((T16*)(a1))->a2);
	t1 = (T4f1(&l2, (T4)(geint32(0))));
	if (t1) {
		l1 = (((T16*)(C))->a2);
		l3 = ((T4)((l2)+(l1)));
		t2 = (T16f15(C));
		t1 = (T4f1(&l3, t2));
		if (t1) {
			t2 = (T16f16(C));
			t2 = ((T4)((l3)+(t2)));
			T16f34(C, t2);
		}
		t3 = (((T16*)(a1))->a1);
		T15f8(((T16*)(C))->a1, t3, (T4)(geint32(0)), l1, l2);
		((T16*)(C))->a2 = (l3);
		((T16*)(C))->a9 = ((T4)(geint32(0)));
	}
}

/* SPECIAL [CHARACTER].copy_data */
void T15f8(T0* C, T0* a1, T4 a2, T4 a3, T4 a4)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T1 t2;
	t1 = ((a1)==(C));
	if (t1) {
		T15f10(C, a2, a3, a4);
	} else {
		l1 = (a2);
		l2 = (a3);
		l3 = ((T4)((a2)+(a4)));
		t1 = ((l1)==(l3));
		while (!(t1)) {
			t2 = (((T15*)(a1))->a2[l1]);
			((T15*)(C))->a2[l2] = (t2);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = ((l1)==(l3));
		}
	}
}

/* SPECIAL [CHARACTER].move_data */
void T15f10(T0* C, T4 a1, T4 a2, T4 a3)
{
	T2 t1;
	T4 t2;
	t1 = ((a1)==(a2));
	if (t1) {
	} else {
		t1 = (T4f1(&a1, a2));
		if (t1) {
			t2 = ((T4)((a2)+(a3)));
			t1 = ((T2)((t2)<(a1)));
			if (t1) {
				T15f11(C, a1, a2, a3);
			} else {
				T15f12(C, a1, a2, a3);
			}
		} else {
			t2 = ((T4)((a1)+(a3)));
			t1 = ((T2)((t2)<(a2)));
			if (t1) {
				T15f11(C, a1, a2, a3);
			} else {
				T15f12(C, a1, a2, a3);
			}
		}
	}
}

/* SPECIAL [CHARACTER].overlapping_move */
void T15f12(T0* C, T4 a1, T4 a2, T4 a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T4 t2;
	T1 t3;
	t1 = ((T2)((a1)<(a2)));
	if (t1) {
		t2 = ((T4)((a1)+(a3)));
		l1 = ((T4)((t2)-((T4)(geint32(1)))));
		l2 = ((T4)((a1)-((T4)(geint32(1)))));
		l3 = ((T4)((a2)-(a1)));
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t3 = (((T15*)(C))->a2[l1]);
			t2 = ((T4)((l1)+(l3)));
			((T15*)(C))->a2[t2] = (t3);
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
			t1 = ((l1)==(l2));
		}
	} else {
		l1 = (a1);
		l2 = ((T4)((a1)+(a3)));
		l3 = ((T4)((a1)-(a2)));
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t3 = (((T15*)(C))->a2[l1]);
			t2 = ((T4)((l1)-(l3)));
			((T15*)(C))->a2[t2] = (t3);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = ((l1)==(l2));
		}
	}
}

/* SPECIAL [CHARACTER].non_overlapping_move */
void T15f11(T0* C, T4 a1, T4 a2, T4 a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T1 t2;
	T4 t3;
	l1 = (a1);
	l2 = ((T4)((a1)+(a3)));
	l3 = ((T4)((a2)-(a1)));
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T15*)(C))->a2[l1]);
		t3 = ((T4)((l1)+(l3)));
		((T15*)(C))->a2[t3] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
}

/* STRING.resize */
void T16f34(T0* C, T4 a1)
{
	T4 l1 = 0;
	T2 t1;
	T4 t2;
	l1 = (((T15*)(((T16*)(C))->a1))->a1);
	t1 = (T4f2(&a1, l1));
	if (t1) {
		t2 = ((T4)((a1)+((T4)(geint32(1)))));
		((T16*)(C))->a1 = (T15f4(((T16*)(C))->a1, t2));
	}
}

/* SPECIAL [CHARACTER].aliased_resized_area */
T0* T15f4(T0* C, T4 a1)
{
	T0* R = 0;
	T4 t1 = ((T15*)(C))->a1;
	if (a1>t1) {
		R = (T0*)gealloc(sizeof(T15)+a1*sizeof(T1));
		*(T15*)(R) = *(T15*)(C);
		memcpy(((T15*)(R))->a2, ((T15*)(C))->a2, t1*sizeof(T1));
	} else {
		R = C;
	}
	((T15*)(R))->a1 = a1;
	return R;
}

/* INTEGER.infix ">=" */
T2 T4f2(T4* C, T4 a1)
{
	T2 R = 0;
	T2 t1;
	t1 = ((T2)((*C)<(a1)));
	R = ((T2)(!(t1)));
	return R;
}

/* STRING.additional_space */
T4 T16f16(T0* C)
{
	T4 R = 0;
	T4 t1;
	t1 = (T16f15(C));
	t1 = ((T4)((t1)*((T4)(geint32(50)))));
	t1 = ((T4)((t1)/((T4)(geint32(100)))));
	R = (T4f14(&t1, (T4)(geint32(5))));
	return R;
}

/* INTEGER.max */
T4 T4f14(T4* C, T4 a1)
{
	T4 R = 0;
	T2 t1;
	t1 = (T4f2(C, a1));
	if (t1) {
		R = (*C);
	} else {
		R = (a1);
	}
	return R;
}

/* STRING.capacity */
T4 T16f15(T0* C)
{
	T4 R = 0;
	T4 t1;
	t1 = (((T15*)(((T16*)(C))->a1))->a1);
	R = ((T4)((t1)-((T4)(geint32(1)))));
	return R;
}

/* INTEGER.infix ">" */
T2 T4f1(T4* C, T4 a1)
{
	T2 R = 0;
	R = ((T2)((a1)<(*C)));
	return R;
}

/* STRING.make */
T0* T16c25(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T16));
	((T16*)(C))->id = 16;
	((T16*)(C))->a2 = ((T4)(geint32(0)));
	((T16*)(C))->a9 = ((T4)(geint32(0)));
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T16f27(C, t1);
	return C;
}

/* STRING.make_area */
void T16f27(T0* C, T4 a1)
{
	((T16*)(C))->a1 = T15c9(a1);
}

/* SPECIAL [CHARACTER].make */
T0* T15c9(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T15)+a1*sizeof(T1));
	((T15*)(C))->a1 = a1;
	((T15*)(C))->id = 15;
	return C;
}

/* KL_ANY_ROUTINES.same_types */
T2 T75f1(T0* C, T0* a1, T0* a2)
{
	T2 R = 0;
	R = ((T2)(((T0*)(a1))->id==((T0*)(a2))->id));
	return R;
}

/* KL_STRING_ROUTINES.any_ */
unsigned char ge254os1802 = '\0';
T0* ge254ov1802;
T0* T54f6(T0* C)
{
	T0* R = 0;
	if (ge254os1802) {
		return ge254ov1802;
	} else {
		ge254os1802 = '\1';
	}
	R = T75c2();
	ge254ov1802 = R;
	return R;
}

/* KL_ANY_ROUTINES.default_create */
T0* T75c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T75));
	((T75*)(C))->id = 75;
	return C;
}

/* KL_STDERR_FILE.string_ */
unsigned char ge262os1508 = '\0';
T0* ge262ov1508;
T0* T36f1(T0* C)
{
	T0* R = 0;
	if (ge262os1508) {
		return ge262ov1508;
	} else {
		ge262os1508 = '\1';
	}
	R = T54c12();
	ge262ov1508 = R;
	return R;
}

/* KL_STRING_ROUTINES.default_create */
T0* T54c12()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T54));
	((T54*)(C))->id = 54;
	return C;
}

/* UT_ERROR_HANDLER.message */
T0* T20f5(T0* C, T0* a1)
{
	T0* R = 0;
	R = (T32x3309(a1));
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.make */
T0* T35c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T35));
	((T35*)(C))->id = 35;
	((T35*)(C))->a1 = T60c11((T4)(geint32(1)), (T4)(geint32(1)));
	T60f12(((T35*)(C))->a1, a1, (T4)(geint32(1)));
	return C;
}

/* ARRAY [STRING].put */
void T60f12(T0* C, T0* a1, T4 a2)
{
	T4 t1;
	t1 = ((T4)((a2)-(((T60*)(C))->a2)));
	((T47*)(((T60*)(C))->a1))->a2[t1] = (a1);
}

/* ARRAY [STRING].make */
T0* T60c11(T4 a1, T4 a2)
{
	T2 t1;
	T4 t2;
	T0* C;
	C = (T0*)gealloc(sizeof(T60));
	((T60*)(C))->id = 60;
	((T60*)(C))->a2 = (a1);
	((T60*)(C))->a3 = (a2);
	t1 = (T4f6(&a1, a2));
	if (t1) {
		t2 = ((T4)((a2)-(a1)));
		t2 = ((T4)((t2)+((T4)(geint32(1)))));
		T60f13(C, t2);
	} else {
		T60f13(C, (T4)(geint32(0)));
	}
	return C;
}

/* ARRAY [STRING].make_area */
void T60f13(T0* C, T4 a1)
{
	((T60*)(C))->a1 = T47c5(a1);
}

/* SPECIAL [STRING].make */
T0* T47c5(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T47)+a1*sizeof(T0*));
	((T47*)(C))->a1 = a1;
	((T47*)(C))->id = 47;
	return C;
}

/* INTEGER.infix "<=" */
T2 T4f6(T4* C, T4 a1)
{
	T2 R = 0;
	T2 t1;
	t1 = ((T2)((a1)<(*C)));
	R = ((T2)(!(t1)));
	return R;
}

/* KL_TEXT_INPUT_FILE.close */
void T24f38(T0* C)
{
	T2 l1 = 0;
	T2 t1;
	t1 = ((T2)(!(l1)));
	if (t1) {
		T24f41(C);
		((T24*)(C))->a11 = (EIF_VOID);
	}
}

/* KL_TEXT_INPUT_FILE.old_close */
void T24f41(T0* C)
{
	T24f42(C, ((T24*)(C))->a17);
	((T24*)(C))->a3 = ((T4)(geint32(0)));
	((T24*)(C))->a19 = (EIF_FALSE);
}

/* KL_TEXT_INPUT_FILE.file_close */
void T24f42(T0* C, T14 a1)
{
	file_close((FILE *)a1);
}

/* KL_TEXT_INPUT_FILE.is_open_read */
T2 T24f1(T0* C)
{
	T2 R = 0;
	R = (T24f2(C));
	return R;
}

/* KL_TEXT_INPUT_FILE.old_is_open_read */
T2 T24f2(T0* C)
{
	T2 R = 0;
	T2 t1;
	t1 = ((((T24*)(C))->a3)==((T4)(geint32(1))));
	if (!(t1)) {
		t1 = ((((T24*)(C))->a3)==((T4)(geint32(4))));
	}
	if (!(t1)) {
		R = ((((T24*)(C))->a3)==((T4)(geint32(5))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* KL_TEXT_INPUT_FILE.open_read */
void T24f37(T0* C)
{
	T2 l1 = 0;
	T2 t1;
	t1 = ((T2)(!(l1)));
	if (t1) {
		t1 = ((((T24*)(C))->a10)!=(ge365ov1942));
		if (t1) {
			((T24*)(C))->a11 = (EIF_VOID);
			((T24*)(C))->a12 = (EIF_FALSE);
			t1 = (T24f13(C));
			if (t1) {
				t1 = (T24f14(C));
			}
			if (t1) {
				T24f40(C);
			}
		}
	} else {
		t1 = (T24f15(C));
		t1 = ((T2)(!(t1)));
		if (t1) {
			T24f38(C);
		}
	}
}

/* KL_TEXT_INPUT_FILE.is_closed */
T2 T24f15(T0* C)
{
	T2 R = 0;
	R = (T24f23(C));
	return R;
}

/* KL_TEXT_INPUT_FILE.old_is_closed */
T2 T24f23(T0* C)
{
	T2 R = 0;
	R = ((((T24*)(C))->a3)==((T4)(geint32(0))));
	return R;
}

/* KL_TEXT_INPUT_FILE.old_open_read */
void T24f40(T0* C)
{
	T14 t1;
	T2 t2;
	T24f40p1(C);
	t1 = (T24f18(C));
	t2 = ((((T24*)(C))->a17)==(t1));
	if (t2) {
		((T24*)(C))->a3 = ((T4)(geint32(0)));
		((T24*)(C))->a19 = (EIF_FALSE);
	}
}

/* KL_TEXT_INPUT_FILE.default_pointer */
T14 T24f18(T0* C)
{
	T14 R = 0;
	return R;
}

/* KL_TEXT_INPUT_FILE.open_read */
void T24f40p1(T0* C)
{
	T0* l1 = 0;
	T57 t1;
	T14 t2;
	l1 = (T16f7(((T24*)(C))->a10));
	t1.id = 57;
	t1.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
	t2 = (T57f2(&t1));
	((T24*)(C))->a17 = (T24f20(C, t2, (T4)(geint32(0))));
	((T24*)(C))->a3 = ((T4)(geint32(1)));
}

/* KL_TEXT_INPUT_FILE.file_open */
T14 T24f20(T0* C, T14 a1, T4 a2)
{
	T14 R = 0;
	R = (T14)( EIF_POINTER )file_open((char *)a1,( int)a2);
	return R;
}

/* STRING.to_c */
T0* T16f7(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = (((T16*)(C))->a1);
	((T15*)(l1))->a2[((T16*)(C))->a2] = ((T1)('\000'));
	R = (l1);
	return R;
}

/* KL_TEXT_INPUT_FILE.old_is_readable */
T2 T24f14(T0* C)
{
	T2 R = 0;
	T0* t1;
	T24f43(C);
	t1 = (T24f22(C));
	R = (T62f1(t1));
	return R;
}

/* UNIX_FILE_INFO.is_readable */
T2 T62f1(T0* C)
{
	T2 R = 0;
	T80 t1;
	T14 t2;
	t1.id = 80;
	t1.a1 = ((((T62*)(C))->a5?(T14)(getypes[(((T62*)(C))->a5)->id].is_special?(T14)((T15*)(((T62*)(C))->a5))->a2:(T14)((T62*)(C))->a5):(T14)0));
	t2 = (T80f2(&t1));
	R = (T62f2(C, t2, (T4)(geint32(0))));
	return R;
}

/* UNIX_FILE_INFO.file_eaccess */
T2 T62f2(T0* C, T14 a1, T4 a2)
{
	T2 R = 0;
	R = (T2)( EIF_BOOLEAN )file_eaccess((struct stat *)a1,( int)a2);
	return R;
}

/* TYPED_POINTER [SPECIAL [CHARACTER]].to_pointer */
T14 T80f2(T80* C)
{
	T14 R = 0;
	R = ((*C).a1);
	return R;
}

/* KL_TEXT_INPUT_FILE.buffered_file_info */
unsigned char ge508os2154 = '\0';
T0* ge508ov2154;
T0* T24f22(T0* C)
{
	T0* R = 0;
	if (ge508os2154) {
		return ge508ov2154;
	} else {
		ge508os2154 = '\1';
	}
	R = T62c6();
	ge508ov2154 = R;
	return R;
}

/* UNIX_FILE_INFO.make */
T0* T62c6()
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T62));
	((T62*)(C))->id = 62;
	t1 = (T62f3(C));
	T62f8(C, t1);
	return C;
}

/* UNIX_FILE_INFO.make_buffered_file_info */
void T62f8(T0* C, T4 a1)
{
	((T62*)(C))->a5 = T15c9(a1);
}

/* UNIX_FILE_INFO.stat_size */
T4 T62f3(T0* C)
{
	T4 R = 0;
	R = (T4)stat_size();
	return R;
}

/* KL_TEXT_INPUT_FILE.set_buffer */
void T24f43(T0* C)
{
	T0* t1;
	t1 = (T24f22(C));
	T62f7(t1, ((T24*)(C))->a10);
}

/* UNIX_FILE_INFO.update */
void T62f7(T0* C, T0* a1)
{
	T0* l1 = 0;
	T57 t1;
	T14 t2;
	T80 t3;
	T14 t4;
	l1 = (T16f7(a1));
	t1.id = 57;
	t1.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
	t2 = (T57f2(&t1));
	t3.id = 80;
	t3.a1 = ((((T62*)(C))->a5?(T14)(getypes[(((T62*)(C))->a5)->id].is_special?(T14)((T15*)(((T62*)(C))->a5))->a2:(T14)((T62*)(C))->a5):(T14)0));
	t4 = (T80f2(&t3));
	T62f9(C, t2, t4);
	((T62*)(C))->a4 = (a1);
}

/* UNIX_FILE_INFO.file_stat */
void T62f9(T0* C, T14 a1, T14 a2)
{
	file_stat((char *)a1,( struct stat *)a2);
}

/* KL_TEXT_INPUT_FILE.old_exists */
T2 T24f13(T0* C)
{
	T2 R = 0;
	T0* l1 = 0;
	T57 t1;
	T14 t2;
	l1 = (T16f7(((T24*)(C))->a10));
	t1.id = 57;
	t1.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
	t2 = (T57f2(&t1));
	R = (T24f21(C, t2));
	return R;
}

/* KL_TEXT_INPUT_FILE.file_exists */
T2 T24f21(T0* C, T14 a1)
{
	T2 R = 0;
	R = (T2)( EIF_BOOLEAN )file_exists((char *)a1);
	return R;
}

/* KL_TEXT_INPUT_FILE.make */
T0* T24c36(T0* a1)
{
	T4 t1;
	T2 t2;
	T0* t3;
	T0* C;
	C = (T0*)gealloc(sizeof(T24));
	((T24*)(C))->id = 24;
	((T24*)(C))->a7 = (a1);
	t1 = (((T16*)(a1))->a2);
	t2 = (T4f1(&t1, (T4)(geint32(0))));
	if (t2) {
		t3 = (T24f8(C));
		t3 = (T54f1(t3, a1));
		T24f39(C, t3);
	} else {
		T24f39(C, ge365ov1942);
	}
	return C;
}

/* KL_TEXT_INPUT_FILE.old_make */
void T24f39(T0* C, T0* a1)
{
	((T24*)(C))->a10 = (a1);
	((T24*)(C))->a3 = ((T4)(geint32(0)));
}

/* KL_TEXT_INPUT_FILE.string_ */
T0* T24f8(T0* C)
{
	T0* R = 0;
	if (ge262os1508) {
		return ge262ov1508;
	} else {
		ge262os1508 = '\1';
	}
	R = T54c12();
	ge262ov1508 = R;
	return R;
}

/* GEPP_PARSER.parse_file */
void T21f175(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T21f11(C, a1));
	T21f178(C, t1);
	T21f179(C);
	if (((T21*)(C))->a8) {
		T21f180(C, gems("\n", 1));
	}
}

/* GEPP_PARSER.output */
void T21f180(T0* C, T0* a1)
{
	T4 l1 = 0;
	T2 t1;
	T1 t2;
	T0* t3;
	t1 = (T21f60(C));
	t1 = ((T2)(!(t1)));
	if (t1) {
		l1 = (((T16*)(a1))->a2);
		t1 = (T4f1(&l1, (T4)(geint32(0))));
		if (t1) {
			t2 = (T16f5(a1, l1));
			t1 = ((t2)==((T1)('\n')));
			if (t1) {
				l1 = ((T4)((l1)-((T4)(geint32(1)))));
				t1 = (T4f1(&l1, (T4)(geint32(0))));
				if (t1) {
					t2 = (T16f5(a1, l1));
					t1 = ((t2)==((T1)('\r')));
				}
				if (t1) {
					l1 = ((T4)((l1)-((T4)(geint32(1)))));
				}
				t1 = (T4f1(&l1, (T4)(geint32(0))));
				if (t1) {
					t3 = (T16f6(a1, (T4)(geint32(1)), l1));
					if ((((T21*)(C))->a10)->id==25) {
						T25f27(((T21*)(C))->a10, t3);
					} else {
						T28f10(((T21*)(C))->a10, t3);
					}
				} else {
					if ((((T21*)(C))->a10)->id==25) {
						T25f28(((T21*)(C))->a10);
					} else {
						T28f11(((T21*)(C))->a10);
					}
				}
			} else {
				if ((((T21*)(C))->a10)->id==25) {
					T25f29(((T21*)(C))->a10, a1);
				} else {
					T28f12(((T21*)(C))->a10, a1);
				}
			}
		}
	} else {
		if (((T21*)(C))->a9) {
			if ((((T21*)(C))->a10)->id==25) {
				T25f28(((T21*)(C))->a10);
			} else {
				T28f11(((T21*)(C))->a10);
			}
		}
	}
}

/* KL_STDOUT_FILE.put_string */
void T28f12(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T28f2(C));
	l1 = (T54f1(t1, a1));
	T28f14(C, l1);
}

/* KL_STDOUT_FILE.old_put_string */
void T28f14(T0* C, T0* a1)
{
	T0* l1 = 0;
	T4 t1;
	T2 t2;
	T57 t3;
	T14 t4;
	t1 = (((T16*)(a1))->a2);
	t2 = ((t1)!=((T4)(geint32(0))));
	if (t2) {
		l1 = (((T16*)(a1))->a1);
		t3.id = 57;
		t3.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
		t4 = (T57f2(&t3));
		t1 = (((T16*)(a1))->a2);
		T28f17(C, ((T28*)(C))->a3, t4, t1);
	}
}

/* KL_STDOUT_FILE.console_ps */
void T28f17(T0* C, T14 a1, T14 a2, T4 a3)
{
	console_ps((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
}

/* KL_STDOUT_FILE.string_ */
T0* T28f2(T0* C)
{
	T0* R = 0;
	if (ge262os1508) {
		return ge262ov1508;
	} else {
		ge262os1508 = '\1';
	}
	R = T54c12();
	ge262ov1508 = R;
	return R;
}

/* KL_TEXT_OUTPUT_FILE.put_string */
void T25f29(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T25f12(C));
	t1 = (T54f1(t1, a1));
	T25f33(C, t1);
}

/* KL_TEXT_OUTPUT_FILE.old_put_string */
void T25f33(T0* C, T0* a1)
{
	T0* l1 = 0;
	T4 t1;
	T2 t2;
	T57 t3;
	T14 t4;
	t1 = (((T16*)(a1))->a2);
	t2 = ((t1)!=((T4)(geint32(0))));
	if (t2) {
		l1 = (((T16*)(a1))->a1);
		t3.id = 57;
		t3.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
		t4 = (T57f2(&t3));
		t1 = (((T16*)(a1))->a2);
		T25f36(C, ((T25*)(C))->a17, t4, t1);
	}
}

/* KL_TEXT_OUTPUT_FILE.file_ps */
void T25f36(T0* C, T14 a1, T14 a2, T4 a3)
{
	file_ps((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
}

/* KL_TEXT_OUTPUT_FILE.string_ */
T0* T25f12(T0* C)
{
	T0* R = 0;
	if (ge262os1508) {
		return ge262ov1508;
	} else {
		ge262os1508 = '\1';
	}
	R = T54c12();
	ge262ov1508 = R;
	return R;
}

/* KL_STDOUT_FILE.put_new_line */
void T28f11(T0* C)
{
	T28f12(C, ge390ov2659);
}

/* KL_TEXT_OUTPUT_FILE.put_new_line */
void T25f28(T0* C)
{
	T25f29(C, ge395ov2659);
}

/* KL_STDOUT_FILE.put_line */
void T28f10(T0* C, T0* a1)
{
	T28f12(C, a1);
	T28f11(C);
}

/* KL_TEXT_OUTPUT_FILE.put_line */
void T25f27(T0* C, T0* a1)
{
	T25f29(C, a1);
	T25f28(C);
}

/* STRING.substring */
T0* T16f6(T0* C, T4 a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	T4 t4;
	t1 = (T4)(geint32(1));
	t2 = (T4f6(&t1, a1));
	if (t2) {
		t2 = (T4f6(&a1, a2));
	}
	if (t2) {
		t2 = (T4f6(&a2, ((T16*)(C))->a2));
	}
	if (t2) {
		t1 = ((T4)((a2)-(a1)));
		t1 = ((T4)((t1)+((T4)(geint32(1)))));
		R = (T16f8(C, t1));
		t3 = (((T16*)(R))->a1);
		t1 = ((T4)((a1)-((T4)(geint32(1)))));
		t4 = ((T4)((a2)-(a1)));
		t4 = ((T4)((t4)+((T4)(geint32(1)))));
		T15f8(t3, ((T16*)(C))->a1, t1, (T4)(geint32(0)), t4);
		t1 = ((T4)((a2)-(a1)));
		t1 = ((T4)((t1)+((T4)(geint32(1)))));
		T16f26(R, t1);
	} else {
		R = (T16f8(C, (T4)(geint32(0))));
	}
	return R;
}

/* STRING.set_count */
void T16f26(T0* C, T4 a1)
{
	((T16*)(C))->a2 = (a1);
	((T16*)(C))->a9 = ((T4)(geint32(0)));
}

/* STRING.new_string */
T0* T16f8(T0* C, T4 a1)
{
	T0* R = 0;
	R = T16c25(a1);
	return R;
}

/* STRING.item */
T1 T16f5(T0* C, T4 a1)
{
	T1 R = 0;
	T4 t1;
	t1 = ((T4)((a1)-((T4)(geint32(1)))));
	R = (((T15*)(((T16*)(C))->a1))->a2[t1]);
	return R;
}

/* GEPP_PARSER.ignored */
T2 T21f60(T0* C)
{
	T2 R = 0;
	R = ((((T21*)(C))->a132)!=((T4)(geint32(0))));
	return R;
}

/* GEPP_PARSER.parse */
void T21f179(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T4 l7 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	t1 = ((((T21*)(C))->a2)==((T4)(geint32(105))));
	if (t1) {
		l1 = (((T21*)(C))->a24);
		l2 = (((T21*)(C))->a25);
		l3 = (((T21*)(C))->a26);
		l4 = (((T21*)(C))->a27);
		l5 = (((T21*)(C))->a28);
		l6 = (((T21*)(C))->a29);
		l7 = (((T21*)(C))->a30);
		((T21*)(C))->a2 = ((T4)(geint32(104)));
	} else {
		((T21*)(C))->a32 = ((T4)(geint32(0)));
		((T21*)(C))->a33 = (EIF_TRUE);
		((T21*)(C))->a34 = ((T4)(geint32(0)));
		T21f185(C);
		((T21*)(C))->a35 = ((T4)(geint32(-1)));
		l1 = (((T41*)(((T21*)(C))->a15))->a1);
		((T21*)(C))->a2 = ((T4)(geint32(104)));
		l7 = ((T4)(geint32(1)));
	}
	t1 = ((((T21*)(C))->a2)!=((T4)(geint32(104))));
	while (!(t1)) {
		switch (l7) {
		case (T4)(T4)(geint32(1)):
			((T21*)(C))->a35 = ((T4)((((T21*)(C))->a35)+((T4)(geint32(1)))));
			t1 = (T4f2(&(((T21*)(C))->a35), l1));
			if (t1) {
				l1 = ((T4)((l1)+((T4)(geint32(200)))));
				t2 = (T21f16(C));
				((T21*)(C))->a15 = (T42f2(t2, ((T21*)(C))->a15, l1));
			}
			((T41*)(((T21*)(C))->a15))->a2[((T21*)(C))->a35] = (l2);
			l3 = (((T41*)(((T21*)(C))->a42))->a2[l2]);
			t1 = ((l3)==((T4)(geint32(-32768))));
			if (t1) {
				l7 = ((T4)(geint32(2)));
			} else {
				if (((T21*)(C))->a33) {
					T21f186(C);
					((T21*)(C))->a33 = (EIF_FALSE);
				}
				t1 = (T4f1(&(((T21*)(C))->a44), (T4)(geint32(0))));
				if (t1) {
					t1 = (T4f6(&(((T21*)(C))->a44), (T4)(geint32(270))));
					if (t1) {
						l4 = (((T41*)(((T21*)(C))->a47))->a2[((T21*)(C))->a44]);
					} else {
						l4 = ((T4)(geint32(26)));
					}
					l3 = ((T4)((l3)+(l4)));
				} else {
					t1 = ((((T21*)(C))->a44)==((T4)(geint32(0))));
					if (t1) {
						l4 = ((T4)(geint32(0)));
					} else {
						((T21*)(C))->a32 = ((T4)((((T21*)(C))->a32)+((T4)(geint32(1)))));
						T21f187(C, l2);
						T21f188(C);
						l3 = ((T4)(geint32(-1)));
					}
				}
				t1 = ((T2)((l3)<((T4)(geint32(0)))));
				if (!(t1)) {
					t1 = (T4f1(&l3, (T4)(geint32(52))));
				}
				if (!(t1)) {
					t3 = (((T41*)(((T21*)(C))->a50))->a2[l3]);
					t1 = ((t3)!=(l4));
				}
				if (t1) {
					l7 = ((T4)(geint32(2)));
				} else {
					l3 = (((T41*)(((T21*)(C))->a51))->a2[l3]);
					t1 = ((T2)((l3)<((T4)(geint32(0)))));
					if (t1) {
						t1 = ((l3)==((T4)(geint32(-32768))));
						if (t1) {
							l7 = ((T4)(geint32(4)));
						} else {
							l3 = ((T4)(-(l3)));
							l7 = ((T4)(geint32(3)));
						}
					} else {
						t1 = ((l3)==((T4)(geint32(0))));
						if (t1) {
							l7 = ((T4)(geint32(4)));
						} else {
							t1 = ((l3)==((T4)(geint32(41))));
							if (t1) {
								T21f189(C);
							} else {
								t1 = (T4f1(&(((T21*)(C))->a44), (T4)(geint32(0))));
								if (t1) {
									((T21*)(C))->a33 = (EIF_TRUE);
								}
								T21f190(C, l4);
								t1 = ((((T21*)(C))->a34)!=((T4)(geint32(0))));
								if (t1) {
									((T21*)(C))->a34 = ((T4)((((T21*)(C))->a34)-((T4)(geint32(1)))));
								}
								l2 = (l3);
							}
						}
					}
				}
			}
			break;
		case (T4)(T4)(geint32(2)):
			l3 = (((T41*)(((T21*)(C))->a53))->a2[l2]);
			t1 = ((l3)==((T4)(geint32(0))));
			if (t1) {
				l7 = ((T4)(geint32(4)));
			} else {
				l7 = ((T4)(geint32(3)));
			}
			break;
		case (T4)(T4)(geint32(3)):
			T21f191(C, l3);
			switch (((T21*)(C))->a2) {
			case (T4)(T4)(geint32(104)):
				l3 = (((T41*)(((T21*)(C))->a55))->a2[l3]);
				l6 = (((T41*)(((T21*)(C))->a15))->a2[((T21*)(C))->a35]);
				l5 = ((T4)((l3)-((T4)(geint32(19)))));
				t3 = (((T41*)(((T21*)(C))->a57))->a2[l5]);
				l2 = ((T4)((t3)+(l6)));
				t1 = (T4f2(&l2, (T4)(geint32(0))));
				if (t1) {
					t1 = (T4f6(&l2, (T4)(geint32(52))));
				}
				if (t1) {
					t3 = (((T41*)(((T21*)(C))->a50))->a2[l2]);
					t1 = ((t3)==(l6));
				}
				if (t1) {
					l2 = (((T41*)(((T21*)(C))->a51))->a2[l2]);
				} else {
					l2 = (((T41*)(((T21*)(C))->a58))->a2[l5]);
				}
				l7 = ((T4)(geint32(1)));
				break;
			case (T4)(T4)(geint32(105)):
				((T21*)(C))->a24 = (l1);
				((T21*)(C))->a25 = (l2);
				((T21*)(C))->a26 = (l3);
				((T21*)(C))->a27 = (l4);
				((T21*)(C))->a28 = (l5);
				((T21*)(C))->a29 = (l6);
				((T21*)(C))->a30 = (l7);
				break;
			case (T4)(T4)(geint32(103)):
				((T21*)(C))->a2 = ((T4)(geint32(104)));
				l7 = ((T4)(geint32(4)));
				break;
			default:
				break;
			}
			break;
		case (T4)(T4)(geint32(4)):
			t1 = ((((T21*)(C))->a34)==((T4)(geint32(3))));
			if (t1) {
				t1 = (T4f6(&(((T21*)(C))->a44), (T4)(geint32(0))));
				if (t1) {
					T21f188(C);
				} else {
					((T21*)(C))->a33 = (EIF_TRUE);
					l7 = ((T4)(geint32(5)));
				}
			} else {
				t1 = ((((T21*)(C))->a34)==((T4)(geint32(0))));
				if (t1) {
					((T21*)(C))->a32 = ((T4)((((T21*)(C))->a32)+((T4)(geint32(1)))));
					T21f187(C, l2);
				}
				((T21*)(C))->a34 = ((T4)(geint32(3)));
				l7 = ((T4)(geint32(5)));
			}
			break;
		case (T4)(T4)(geint32(5)):
			l3 = (((T41*)(((T21*)(C))->a42))->a2[l2]);
			t1 = ((l3)==((T4)(geint32(-32768))));
			if (t1) {
				l7 = ((T4)(geint32(6)));
			} else {
				l3 = ((T4)((l3)+((T4)(geint32(1)))));
				t1 = ((T2)((l3)<((T4)(geint32(0)))));
				if (!(t1)) {
					t1 = (T4f1(&l3, (T4)(geint32(52))));
				}
				if (!(t1)) {
					t3 = (((T41*)(((T21*)(C))->a50))->a2[l3]);
					t1 = ((t3)!=((T4)(geint32(1))));
				}
				if (t1) {
					l7 = ((T4)(geint32(6)));
				} else {
					l3 = (((T41*)(((T21*)(C))->a51))->a2[l3]);
					t1 = ((T2)((l3)<((T4)(geint32(0)))));
					if (t1) {
						t1 = ((l3)==((T4)(geint32(-32768))));
						if (t1) {
							l7 = ((T4)(geint32(6)));
						} else {
							l3 = ((T4)(-(l3)));
							l7 = ((T4)(geint32(3)));
						}
					} else {
						t1 = ((l3)==((T4)(geint32(0))));
						if (t1) {
							l7 = ((T4)(geint32(6)));
						} else {
							t1 = ((l3)==((T4)(geint32(41))));
							if (t1) {
								T21f189(C);
							} else {
								T21f192(C);
								l2 = (l3);
								l7 = ((T4)(geint32(1)));
							}
						}
					}
				}
			}
			break;
		case (T4)(T4)(geint32(6)):
			t1 = ((((T21*)(C))->a35)==((T4)(geint32(0))));
			if (t1) {
				T21f188(C);
			} else {
				T21f193(C, l2);
				((T21*)(C))->a35 = ((T4)((((T21*)(C))->a35)-((T4)(geint32(1)))));
				l2 = (((T41*)(((T21*)(C))->a15))->a2[((T21*)(C))->a35]);
				l7 = ((T4)(geint32(5)));
			}
			break;
		default:
			break;
		}
		t1 = ((((T21*)(C))->a2)!=((T4)(geint32(104))));
	}
	t1 = ((((T21*)(C))->a2)!=((T4)(geint32(105))));
	if (t1) {
		T21f194(C);
	}
}

/* GEPP_PARSER.yy_clear_all */
void T21f194(T0* C)
{
	T21f205(C);
}

/* GEPP_PARSER.clear_all */
void T21f205(T0* C)
{
	T21f211(C);
}

/* GEPP_PARSER.clear_stacks */
void T21f211(T0* C)
{
	T21f212(C);
}

/* GEPP_PARSER.yy_clear_value_stacks */
void T21f212(T0* C)
{
	T2 t1;
	t1 = ((((T21*)(C))->a122)!=(EIF_VOID));
	if (t1) {
		T45f6(((T21*)(C))->a122);
	}
	t1 = ((((T21*)(C))->a127)!=(EIF_VOID));
	if (t1) {
		T47f7(((T21*)(C))->a127);
	}
	t1 = ((((T21*)(C))->a131)!=(EIF_VOID));
	if (t1) {
		T49f6(((T21*)(C))->a131);
	}
}

/* SPECIAL [BOOLEAN].clear_all */
void T49f6(T0* C)
{
	T4 l1 = 0;
	T2 l2 = 0;
	T4 t1;
	T2 t2;
	t1 = (((T49*)(C))->a1);
	l1 = ((T4)((t1)-((T4)(geint32(1)))));
	t2 = ((T2)((l1)<((T4)(geint32(0)))));
	while (!(t2)) {
		((T49*)(C))->a2[l1] = (l2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t2 = ((T2)((l1)<((T4)(geint32(0)))));
	}
}

/* SPECIAL [STRING].clear_all */
void T47f7(T0* C)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T4 t1;
	T2 t2;
	t1 = (((T47*)(C))->a1);
	l1 = ((T4)((t1)-((T4)(geint32(1)))));
	t2 = ((T2)((l1)<((T4)(geint32(0)))));
	while (!(t2)) {
		((T47*)(C))->a2[l1] = (l2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t2 = ((T2)((l1)<((T4)(geint32(0)))));
	}
}

/* SPECIAL [ANY].clear_all */
void T45f6(T0* C)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T4 t1;
	T2 t2;
	t1 = (((T45*)(C))->a1);
	l1 = ((T4)((t1)-((T4)(geint32(1)))));
	t2 = ((T2)((l1)<((T4)(geint32(0)))));
	while (!(t2)) {
		((T45*)(C))->a2[l1] = (l2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t2 = ((T2)((l1)<((T4)(geint32(0)))));
	}
}

/* GEPP_PARSER.yy_pop_last_value */
void T21f193(T0* C, T4 a1)
{
	T4 l1 = 0;
	l1 = (((T41*)(((T21*)(C))->a63))->a2[a1]);
	switch (l1) {
	case (T4)(T4)(geint32(1)):
		((T21*)(C))->a74 = ((T4)((((T21*)(C))->a74)-((T4)(geint32(1)))));
		break;
	case (T4)(T4)(geint32(2)):
		((T21*)(C))->a75 = ((T4)((((T21*)(C))->a75)-((T4)(geint32(1)))));
		break;
	case (T4)(T4)(geint32(3)):
		((T21*)(C))->a76 = ((T4)((((T21*)(C))->a76)-((T4)(geint32(1)))));
		break;
	default:
		T21f188(C);
		break;
	}
}

/* GEPP_PARSER.yy_push_error_value */
void T21f192(T0* C)
{
	T0* l1 = 0;
	T2 t1;
	((T21*)(C))->a74 = ((T4)((((T21*)(C))->a74)+((T4)(geint32(1)))));
	t1 = (T4f2(&(((T21*)(C))->a74), ((T21*)(C))->a121));
	if (t1) {
		t1 = ((((T21*)(C))->a122)==(EIF_VOID));
		if (t1) {
			((T21*)(C))->a123 = T46c3();
			((T21*)(C))->a121 = ((T4)(geint32(10)));
			((T21*)(C))->a122 = (T46f1(((T21*)(C))->a123, ((T21*)(C))->a121));
		} else {
			((T21*)(C))->a121 = ((T4)((((T21*)(C))->a121)+((T4)(geint32(10)))));
			((T21*)(C))->a122 = (T46f2(((T21*)(C))->a123, ((T21*)(C))->a122, ((T21*)(C))->a121));
		}
	}
	((T45*)(((T21*)(C))->a122))->a2[((T21*)(C))->a74] = (l1);
}

/* KL_SPECIAL_ROUTINES [ANY].resize */
T0* T46f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T45*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T45f2(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [ANY].resized_area */
T0* T45f2(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T45c4(a1);
	l2 = (((T45*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T45*)(C))->a2[l1]);
		((T45*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* SPECIAL [ANY].make */
T0* T45c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T45)+a1*sizeof(T0*));
	((T45*)(C))->a1 = a1;
	((T45*)(C))->id = 45;
	return C;
}

/* KL_SPECIAL_ROUTINES [ANY].make */
T0* T46f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T70c2(a1);
	R = (((T70*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [ANY].make_area */
T0* T70c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T70));
	((T70*)(C))->id = 70;
	((T70*)(C))->a1 = T45c4(a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [ANY].default_create */
T0* T46c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T46));
	((T46*)(C))->id = 46;
	return C;
}

/* GEPP_PARSER.yy_do_action */
void T21f191(T0* C, T4 a1)
{
	T0* l1 = 0;
	T2 l2 = 0;
	T2 t1;
	T0* t2;
	T2 t3;
	T4 t4;
	switch (a1) {
	case (T4)(T4)(geint32(1)):
		t1 = ((((T21*)(C))->a2)==((T4)(geint32(104))));
		if (t1) {
			((T21*)(C))->a35 = ((T4)((((T21*)(C))->a35)-((T4)(geint32(1)))));
			((T45*)(((T21*)(C))->a122))->a2[((T21*)(C))->a74] = (l1);
		}
		break;
	case (T4)(T4)(geint32(2)):
		t1 = ((((T21*)(C))->a2)==((T4)(geint32(104))));
		if (t1) {
			((T21*)(C))->a35 = ((T4)((((T21*)(C))->a35)-((T4)(geint32(0)))));
			((T21*)(C))->a74 = ((T4)((((T21*)(C))->a74)+((T4)(geint32(1)))));
			t1 = (T4f2(&(((T21*)(C))->a74), ((T21*)(C))->a121));
			if (t1) {
				t1 = ((((T21*)(C))->a122)==(EIF_VOID));
				if (t1) {
					((T21*)(C))->a123 = T46c3();
					((T21*)(C))->a121 = ((T4)(geint32(10)));
					((T21*)(C))->a122 = (T46f1(((T21*)(C))->a123, ((T21*)(C))->a121));
				} else {
					((T21*)(C))->a121 = ((T4)((((T21*)(C))->a121)+((T4)(geint32(10)))));
					((T21*)(C))->a122 = (T46f2(((T21*)(C))->a123, ((T21*)(C))->a122, ((T21*)(C))->a121));
				}
			}
			((T45*)(((T21*)(C))->a122))->a2[((T21*)(C))->a74] = (l1);
		}
		break;
	case (T4)(T4)(geint32(3)):
		t1 = ((((T21*)(C))->a2)==((T4)(geint32(104))));
		if (t1) {
			((T21*)(C))->a35 = ((T4)((((T21*)(C))->a35)-((T4)(geint32(1)))));
			((T45*)(((T21*)(C))->a122))->a2[((T21*)(C))->a74] = (l1);
		}
		break;
	case (T4)(T4)(geint32(4)):
		t1 = ((((T21*)(C))->a2)==((T4)(geint32(104))));
		if (t1) {
			((T21*)(C))->a35 = ((T4)((((T21*)(C))->a35)-((T4)(geint32(2)))));
			((T21*)(C))->a74 = ((T4)((((T21*)(C))->a74)-((T4)(geint32(1)))));
			((T45*)(((T21*)(C))->a122))->a2[((T21*)(C))->a74] = (l1);
		}
		break;
	case (T4)(T4)(geint32(5)):
		t1 = ((((T21*)(C))->a2)==((T4)(geint32(104))));
		if (t1) {
			((T21*)(C))->a35 = ((T4)((((T21*)(C))->a35)-((T4)(geint32(3)))));
			((T21*)(C))->a74 = ((T4)((((T21*)(C))->a74)-((T4)(geint32(2)))));
			((T45*)(((T21*)(C))->a122))->a2[((T21*)(C))->a74] = (l1);
		}
		break;
	case (T4)(T4)(geint32(6)):
		t1 = ((((T21*)(C))->a2)==((T4)(geint32(104))));
		if (t1) {
			((T21*)(C))->a35 = ((T4)((((T21*)(C))->a35)-((T4)(geint32(5)))));
			((T21*)(C))->a74 = ((T4)((((T21*)(C))->a74)-((T4)(geint32(4)))));
			((T45*)(((T21*)(C))->a122))->a2[((T21*)(C))->a74] = (l1);
		}
		break;
	case (T4)(T4)(geint32(7)):
		t1 = (T21f60(C));
		t1 = ((T2)(!(t1)));
		if (t1) {
			t2 = (((T47*)(((T21*)(C))->a127))->a2[((T21*)(C))->a75]);
			T21f171(C, gems("", 0), t2);
		}
		t1 = ((((T21*)(C))->a2)==((T4)(geint32(104))));
		if (t1) {
			((T21*)(C))->a35 = ((T4)((((T21*)(C))->a35)-((T4)(geint32(3)))));
			((T21*)(C))->a74 = ((T4)((((T21*)(C))->a74)-((T4)(geint32(1)))));
			((T21*)(C))->a75 = ((T4)((((T21*)(C))->a75)-((T4)(geint32(1)))));
			((T45*)(((T21*)(C))->a122))->a2[((T21*)(C))->a74] = (l1);
		}
		break;
	case (T4)(T4)(geint32(8)):
		t1 = (T21f60(C));
		t1 = ((T2)(!(t1)));
		if (t1) {
			t2 = (((T47*)(((T21*)(C))->a127))->a2[((T21*)(C))->a75]);
			T21f203(C, t2);
		}
		t1 = ((((T21*)(C))->a2)==((T4)(geint32(104))));
		if (t1) {
			((T21*)(C))->a35 = ((T4)((((T21*)(C))->a35)-((T4)(geint32(3)))));
			((T21*)(C))->a74 = ((T4)((((T21*)(C))->a74)-((T4)(geint32(1)))));
			((T21*)(C))->a75 = ((T4)((((T21*)(C))->a75)-((T4)(geint32(1)))));
			((T45*)(((T21*)(C))->a122))->a2[((T21*)(C))->a74] = (l1);
		}
		break;
	case (T4)(T4)(geint32(9)):
		t1 = (T21f60(C));
		t1 = ((T2)(!(t1)));
		if (t1) {
			t2 = (((T47*)(((T21*)(C))->a127))->a2[((T21*)(C))->a75]);
			T21f204(C, t2);
		}
		t1 = ((((T21*)(C))->a2)==((T4)(geint32(104))));
		if (t1) {
			((T21*)(C))->a35 = ((T4)((((T21*)(C))->a35)-((T4)(geint32(3)))));
			((T21*)(C))->a74 = ((T4)((((T21*)(C))->a74)-((T4)(geint32(1)))));
			((T21*)(C))->a75 = ((T4)((((T21*)(C))->a75)-((T4)(geint32(1)))));
			((T45*)(((T21*)(C))->a122))->a2[((T21*)(C))->a74] = (l1);
		}
		break;
	case (T4)(T4)(geint32(10)):
		((T21*)(C))->a130 = ((T4)((((T21*)(C))->a130)+((T4)(geint32(1)))));
		t1 = (T21f60(C));
		t1 = ((T2)(!(t1)));
		if (t1) {
			t3 = (((T49*)(((T21*)(C))->a131))->a2[((T21*)(C))->a76]);
			t1 = ((T2)(!(t3)));
		}
		if (t1) {
			((T21*)(C))->a132 = (((T21*)(C))->a130);
		}
		t1 = ((((T21*)(C))->a2)==((T4)(geint32(104))));
		if (t1) {
			((T21*)(C))->a35 = ((T4)((((T21*)(C))->a35)-((T4)(geint32(3)))));
			((T21*)(C))->a74 = ((T4)((((T21*)(C))->a74)-((T4)(geint32(1)))));
			((T21*)(C))->a76 = ((T4)((((T21*)(C))->a76)-((T4)(geint32(1)))));
			((T45*)(((T21*)(C))->a122))->a2[((T21*)(C))->a74] = (l1);
		}
		break;
	case (T4)(T4)(geint32(11)):
		((T21*)(C))->a130 = ((T4)((((T21*)(C))->a130)+((T4)(geint32(1)))));
		t1 = (T21f60(C));
		t1 = ((T2)(!(t1)));
		if (t1) {
			t1 = (((T49*)(((T21*)(C))->a131))->a2[((T21*)(C))->a76]);
		}
		if (t1) {
			((T21*)(C))->a132 = (((T21*)(C))->a130);
		}
		t1 = ((((T21*)(C))->a2)==((T4)(geint32(104))));
		if (t1) {
			((T21*)(C))->a35 = ((T4)((((T21*)(C))->a35)-((T4)(geint32(3)))));
			((T21*)(C))->a74 = ((T4)((((T21*)(C))->a74)-((T4)(geint32(1)))));
			((T21*)(C))->a76 = ((T4)((((T21*)(C))->a76)-((T4)(geint32(1)))));
			((T45*)(((T21*)(C))->a122))->a2[((T21*)(C))->a74] = (l1);
		}
		break;
	case (T4)(T4)(geint32(12)):
		t2 = (((T47*)(((T21*)(C))->a127))->a2[((T21*)(C))->a75]);
		l2 = (T21f133(C, t2));
		t1 = ((((T21*)(C))->a2)==((T4)(geint32(104))));
		if (t1) {
			((T21*)(C))->a35 = ((T4)((((T21*)(C))->a35)-((T4)(geint32(1)))));
			((T21*)(C))->a76 = ((T4)((((T21*)(C))->a76)+((T4)(geint32(1)))));
			((T21*)(C))->a75 = ((T4)((((T21*)(C))->a75)-((T4)(geint32(1)))));
			t1 = (T4f2(&(((T21*)(C))->a76), ((T21*)(C))->a134));
			if (t1) {
				t1 = ((((T21*)(C))->a131)==(EIF_VOID));
				if (t1) {
					((T21*)(C))->a135 = T50c3();
					((T21*)(C))->a134 = ((T4)(geint32(10)));
					((T21*)(C))->a131 = (T50f1(((T21*)(C))->a135, ((T21*)(C))->a134));
				} else {
					((T21*)(C))->a134 = ((T4)((((T21*)(C))->a134)+((T4)(geint32(10)))));
					((T21*)(C))->a131 = (T50f2(((T21*)(C))->a135, ((T21*)(C))->a131, ((T21*)(C))->a134));
				}
			}
			((T49*)(((T21*)(C))->a131))->a2[((T21*)(C))->a76] = (l2);
		}
		break;
	case (T4)(T4)(geint32(13)):
		l2 = (((T49*)(((T21*)(C))->a131))->a2[((T21*)(C))->a76]);
		t1 = ((((T21*)(C))->a2)==((T4)(geint32(104))));
		if (t1) {
			((T21*)(C))->a35 = ((T4)((((T21*)(C))->a35)-((T4)(geint32(3)))));
			((T21*)(C))->a74 = ((T4)((((T21*)(C))->a74)-((T4)(geint32(2)))));
			((T49*)(((T21*)(C))->a131))->a2[((T21*)(C))->a76] = (l2);
		}
		break;
	case (T4)(T4)(geint32(14)):
		t4 = ((T4)((((T21*)(C))->a76)-((T4)(geint32(1)))));
		t1 = (((T49*)(((T21*)(C))->a131))->a2[t4]);
		if (t1) {
			l2 = (((T49*)(((T21*)(C))->a131))->a2[((T21*)(C))->a76]);
		} else {
			l2 = EIF_FALSE;
		}
		t1 = ((((T21*)(C))->a2)==((T4)(geint32(104))));
		if (t1) {
			((T21*)(C))->a35 = ((T4)((((T21*)(C))->a35)-((T4)(geint32(3)))));
			((T21*)(C))->a76 = ((T4)((((T21*)(C))->a76)-((T4)(geint32(1)))));
			((T21*)(C))->a74 = ((T4)((((T21*)(C))->a74)-((T4)(geint32(1)))));
			((T49*)(((T21*)(C))->a131))->a2[((T21*)(C))->a76] = (l2);
		}
		break;
	case (T4)(T4)(geint32(15)):
		t4 = ((T4)((((T21*)(C))->a76)-((T4)(geint32(1)))));
		t1 = (((T49*)(((T21*)(C))->a131))->a2[t4]);
		if (!(t1)) {
			l2 = (((T49*)(((T21*)(C))->a131))->a2[((T21*)(C))->a76]);
		} else {
			l2 = EIF_TRUE;
		}
		t1 = ((((T21*)(C))->a2)==((T4)(geint32(104))));
		if (t1) {
			((T21*)(C))->a35 = ((T4)((((T21*)(C))->a35)-((T4)(geint32(3)))));
			((T21*)(C))->a76 = ((T4)((((T21*)(C))->a76)-((T4)(geint32(1)))));
			((T21*)(C))->a74 = ((T4)((((T21*)(C))->a74)-((T4)(geint32(1)))));
			((T49*)(((T21*)(C))->a131))->a2[((T21*)(C))->a76] = (l2);
		}
		break;
	case (T4)(T4)(geint32(16)):
		t1 = (((T49*)(((T21*)(C))->a131))->a2[((T21*)(C))->a76]);
		l2 = ((T2)(!(t1)));
		t1 = ((((T21*)(C))->a2)==((T4)(geint32(104))));
		if (t1) {
			((T21*)(C))->a35 = ((T4)((((T21*)(C))->a35)-((T4)(geint32(2)))));
			((T21*)(C))->a74 = ((T4)((((T21*)(C))->a74)-((T4)(geint32(1)))));
			((T49*)(((T21*)(C))->a131))->a2[((T21*)(C))->a76] = (l2);
		}
		break;
	case (T4)(T4)(geint32(17)):
		t1 = ((((T21*)(C))->a132)==(((T21*)(C))->a130));
		if (t1) {
			((T21*)(C))->a132 = ((T4)(geint32(0)));
		}
		((T21*)(C))->a130 = ((T4)((((T21*)(C))->a130)-((T4)(geint32(1)))));
		t1 = ((((T21*)(C))->a2)==((T4)(geint32(104))));
		if (t1) {
			((T21*)(C))->a35 = ((T4)((((T21*)(C))->a35)-((T4)(geint32(2)))));
			((T21*)(C))->a74 = ((T4)((((T21*)(C))->a74)-((T4)(geint32(1)))));
			((T45*)(((T21*)(C))->a122))->a2[((T21*)(C))->a74] = (l1);
		}
		break;
	case (T4)(T4)(geint32(18)):
		t1 = (T21f60(C));
		t1 = ((T2)(!(t1)));
		if (t1) {
			((T21*)(C))->a132 = (((T21*)(C))->a130);
		} else {
			t1 = ((((T21*)(C))->a132)==(((T21*)(C))->a130));
			if (t1) {
				((T21*)(C))->a132 = ((T4)(geint32(0)));
			}
		}
		t1 = ((((T21*)(C))->a2)==((T4)(geint32(104))));
		if (t1) {
			((T21*)(C))->a35 = ((T4)((((T21*)(C))->a35)-((T4)(geint32(2)))));
			((T21*)(C))->a74 = ((T4)((((T21*)(C))->a74)-((T4)(geint32(1)))));
			((T45*)(((T21*)(C))->a122))->a2[((T21*)(C))->a74] = (l1);
		}
		break;
	default:
		T21f188(C);
		break;
	}
}

/* KL_SPECIAL_ROUTINES [BOOLEAN].resize */
T0* T50f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T49*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T49f3(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [BOOLEAN].resized_area */
T0* T49f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	R = T49c4(a1);
	l2 = (((T49*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t1 = (((T49*)(C))->a2[l1]);
		((T49*)(R))->a2[l1] = (t1);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* SPECIAL [BOOLEAN].make */
T0* T49c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T49)+a1*sizeof(T2));
	((T49*)(C))->a1 = a1;
	((T49*)(C))->id = 49;
	return C;
}

/* KL_SPECIAL_ROUTINES [BOOLEAN].make */
T0* T50f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T72c2(a1);
	R = (((T72*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [BOOLEAN].make_area */
T0* T72c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T72));
	((T72*)(C))->id = 72;
	((T72*)(C))->a1 = T49c4(a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [BOOLEAN].default_create */
T0* T50c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T50));
	((T50*)(C))->id = 50;
	return C;
}

/* GEPP_PARSER.is_defined */
T2 T21f133(T0* C, T0* a1)
{
	T2 R = 0;
	R = (T37f1(((T21*)(C))->a5, a1));
	return R;
}

/* DS_HASH_TABLE [STRING, STRING].has */
T2 T37f1(T0* C, T0* a1)
{
	T2 R = 0;
	T37f36(C, a1);
	R = ((((T37*)(C))->a2)!=((T4)(geint32(0))));
	return R;
}

/* DS_HASH_TABLE [STRING, STRING].search_position */
void T37f36(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T0* t2;
	T2 t3;
	t1 = ((a1)==(EIF_VOID));
	if (t1) {
		((T37*)(C))->a2 = (T37f14(C, ((T37*)(C))->a15));
		((T37*)(C))->a9 = (((T37*)(C))->a15);
		((T37*)(C))->a16 = ((T4)(geint32(0)));
	} else {
		l4 = (((T37*)(C))->a4);
		t1 = ((l4)!=(EIF_VOID));
		if (t1) {
			t1 = ((((T37*)(C))->a2)==((T4)(geint32(0))));
			if (!(t1)) {
				t2 = (T37f17(C, ((T37*)(C))->a2));
				t3 = (T22f1(l4, a1, t2));
				t1 = ((T2)(!(t3)));
			}
			if (!(t1)) {
				t1 = (T22f1(l4, a1, l3));
			}
			if (t1) {
				((T37*)(C))->a9 = (T37f8(C, a1));
				l1 = (T37f14(C, ((T37*)(C))->a9));
				((T37*)(C))->a2 = ((T4)(geint32(0)));
				l2 = ((T4)(geint32(0)));
				t1 = ((l1)==((T4)(geint32(0))));
				while (!(t1)) {
					t2 = (T37f17(C, l1));
					t1 = (T22f1(l4, a1, t2));
					if (t1) {
						((T37*)(C))->a2 = (l1);
						l1 = ((T4)(geint32(0)));
					} else {
						l2 = (l1);
						l1 = (T37f13(C, l1));
					}
					t1 = ((l1)==((T4)(geint32(0))));
				}
				((T37*)(C))->a16 = (l2);
			}
		} else {
			t1 = ((((T37*)(C))->a2)==((T4)(geint32(0))));
			if (!(t1)) {
				t2 = (T37f17(C, ((T37*)(C))->a2));
				t1 = ((a1)!=(t2));
			}
			if (!(t1)) {
				t1 = ((a1)==(l3));
			}
			if (t1) {
				((T37*)(C))->a9 = (T37f8(C, a1));
				l1 = (T37f14(C, ((T37*)(C))->a9));
				((T37*)(C))->a2 = ((T4)(geint32(0)));
				l2 = ((T4)(geint32(0)));
				t1 = ((l1)==((T4)(geint32(0))));
				while (!(t1)) {
					t2 = (T37f17(C, l1));
					t1 = ((a1)==(t2));
					if (t1) {
						((T37*)(C))->a2 = (l1);
						l1 = ((T4)(geint32(0)));
					} else {
						l2 = (l1);
						l1 = (T37f13(C, l1));
					}
					t1 = ((l1)==((T4)(geint32(0))));
				}
				((T37*)(C))->a16 = (l2);
			}
		}
	}
}

/* DS_HASH_TABLE [STRING, STRING].clashes_item */
T4 T37f13(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T41*)(((T37*)(C))->a23))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [STRING, STRING].hash_position */
T4 T37f8(T0* C, T0* a1)
{
	T4 R = 0;
	T2 t1;
	T4 t2;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T16f17(a1));
		R = ((T4)((t2)%(((T37*)(C))->a15)));
	} else {
		R = (((T37*)(C))->a15);
	}
	return R;
}

/* STRING.hash_code */
T4 T16f17(T0* C)
{
	T4 R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T4 t2;
	T1 t3;
	T4 t4;
	R = (((T16*)(C))->a9);
	t1 = ((R)==((T4)(geint32(0))));
	if (t1) {
		l1 = ((T4)(geint32(0)));
		l2 = (((T16*)(C))->a2);
		l3 = (((T16*)(C))->a1);
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t2 = ((T4)((R)%((T4)(geint32(8388593)))));
			t2 = (T4f15(&t2, (T4)(geint32(8))));
			t3 = (((T15*)(l3))->a2[l1]);
			t4 = ((T4)(t3));
			R = ((T4)((t2)+(t4)));
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = ((l1)==(l2));
		}
		((T16*)(C))->a9 = (R);
	}
	return R;
}

/* INTEGER.infix "|<<" */
T4 T4f15(T4* C, T4 a1)
{
	T4 R = 0;
	R = ((T4)((*C)<<(a1)));
	return R;
}

/* KL_EQUALITY_TESTER [STRING].test */
T2 T22f1(T0* C, T0* a1, T0* a2)
{
	T2 R = 0;
	T2 t1;
	t1 = ((a1)==(a2));
	if (t1) {
		R = (EIF_TRUE);
	} else {
		t1 = ((a1)==(EIF_VOID));
		if (t1) {
			R = (EIF_FALSE);
		} else {
			t1 = ((a2)==(EIF_VOID));
			if (t1) {
				R = (EIF_FALSE);
			} else {
				R = (T16f3(a1, a2));
			}
		}
	}
	return R;
}

/* DS_HASH_TABLE [STRING, STRING].keys_item */
T0* T37f17(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T47*)(((T37*)(C))->a25))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [STRING, STRING].slots_item */
T4 T37f14(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T41*)(((T37*)(C))->a24))->a2[a1]);
	return R;
}

/* GEPP_PARSER.process_include */
void T21f204(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	t1 = (T38f1(((T21*)(C))->a6));
	t1 = ((T2)(!(t1)));
	if (t1) {
		if (((T21*)(C))->a8) {
			T21f180(C, gems(" \\\n\t", 4));
			T21f180(C, a1);
		}
		t2 = (T21f155(C));
		t2 = (T53f1(t2, a1));
		l1 = T24c36(t2);
		T24f37(l1);
		t1 = (T24f1(l1));
		if (t1) {
			T38f9(((T21*)(C))->a6, ((T21*)(C))->a18);
			t2 = (T21f11(C, l1));
			T21f178(C, t2);
		} else {
			l2 = T35c7(a1);
			T20f8(((T21*)(C))->a4, l2);
			T21f188(C);
		}
	} else {
		t3 = (((T38*)(((T21*)(C))->a6))->a2);
		t3 = ((T4)((t3)+((T4)(geint32(1)))));
		l3 = T52c7(t3);
		T20f8(((T21*)(C))->a4, l3);
		T21f188(C);
	}
}

/* GEPP_TOO_MANY_INCLUDES_ERROR.make */
T0* T52c7(T4 a1)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T52));
	((T52*)(C))->id = 52;
	((T52*)(C))->a5 = T60c11((T4)(geint32(1)), (T4)(geint32(1)));
	t1 = (T4f10(&a1));
	T60f12(((T52*)(C))->a5, t1, (T4)(geint32(1)));
	return C;
}

/* INTEGER.out */
T0* T4f10(T4* C)
{
	T0* R = 0;
	T4 t1;
	R = T16c25((T4)(geint32(11)));
	t1 = (*C);
	T16f31(R, t1);
	return R;
}

/* STRING.append_integer */
void T16f31(T0* C, T4 a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T1 l4 = 0;
	T0* l5 = 0;
	T2 t1;
	T4 t2;
	T1 t3;
	t1 = ((a1)==((T4)(geint32(0))));
	if (t1) {
		T16f28(C, (T1)('0'));
	} else {
		l2 = (((T16*)(C))->a2);
		t1 = ((T2)((a1)<((T4)(geint32(0)))));
		if (t1) {
			T16f28(C, (T1)('-'));
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			l1 = ((T4)(-(a1)));
			t2 = ((T4)(geint32(-2147483647)-1));
			t1 = ((l1)==(t2));
			if (t1) {
				t2 = ((T4)((l1)%((T4)(geint32(10)))));
				t2 = ((T4)(-(t2)));
				t2 = ((T4)((t2)+((T4)(geint32(48)))));
				t3 = ((T1)(t2));
				T16f28(C, t3);
				t2 = ((T4)((l1)/((T4)(geint32(10)))));
				l1 = ((T4)(-(t2)));
			}
		} else {
			l1 = (a1);
		}
		t1 = ((l1)==((T4)(geint32(0))));
		while (!(t1)) {
			t2 = ((T4)((l1)%((T4)(geint32(10)))));
			t2 = ((T4)((t2)+((T4)(geint32(48)))));
			t3 = ((T1)(t2));
			T16f28(C, t3);
			l1 = ((T4)((l1)/((T4)(geint32(10)))));
			t1 = ((l1)==((T4)(geint32(0))));
		}
		l3 = ((T4)((((T16*)(C))->a2)-((T4)(geint32(1)))));
		l5 = (((T16*)(C))->a1);
		t1 = (T4f2(&l2, l3));
		while (!(t1)) {
			l4 = (((T15*)(l5))->a2[l2]);
			t3 = (((T15*)(l5))->a2[l3]);
			((T15*)(l5))->a2[l2] = (t3);
			((T15*)(l5))->a2[l3] = (l4);
			l3 = ((T4)((l3)-((T4)(geint32(1)))));
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = (T4f2(&l2, l3));
		}
	}
}

/* STRING.append_character */
void T16f28(T0* C, T1 a1)
{
	T4 l1 = 0;
	T4 t1;
	T2 t2;
	l1 = (((T16*)(C))->a2);
	t1 = (T16f15(C));
	t2 = ((l1)==(t1));
	if (t2) {
		t1 = (T16f16(C));
		t1 = ((T4)((l1)+(t1)));
		T16f34(C, t1);
	}
	((T15*)(((T16*)(C))->a1))->a2[l1] = (a1);
	((T16*)(C))->a2 = ((T4)((l1)+((T4)(geint32(1)))));
	((T16*)(C))->a9 = ((T4)(geint32(0)));
}

/* DS_ARRAYED_STACK [YY_BUFFER].put */
void T38f9(T0* C, T0* a1)
{
	((T38*)(C))->a2 = ((T4)((((T38*)(C))->a2)+((T4)(geint32(1)))));
	((T67*)(((T38*)(C))->a6))->a2[((T38*)(C))->a2] = (a1);
}

/* KL_EXECUTION_ENVIRONMENT.interpreted_string */
T0* T53f1(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T1 l4 = 0;
	T2 l5 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	l2 = ((T4)(geint32(1)));
	l3 = (((T16*)(a1))->a2);
	t1 = (T53f2(C));
	R = (T54f2(t1, a1, l3));
	t2 = (T4f1(&l2, l3));
	while (!(t2)) {
		l4 = (T16f5(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l4)!=((T1)('$')));
		if (t2) {
			t2 = ((l4)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l4);
			} else {
				t1 = (T53f2(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T54f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l3));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l4 = (T16f5(a1, l2));
				t2 = ((l4)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T53f2(C));
					l1 = (T54f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l4)==((T1)('{')));
					if (t2) {
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						l5 = (EIF_FALSE);
						t2 = (T4f1(&l2, l3));
						if (!(t2)) {
							t2 = (l5);
						}
						while (!(t2)) {
							l4 = (T16f5(a1, l2));
							t2 = ((l4)==((T1)('}')));
							if (t2) {
								l5 = (EIF_TRUE);
							} else {
								t2 = ((l4)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l4);
								} else {
									t1 = (T53f2(C));
									T54f13(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l3));
							if (!(t2)) {
								t2 = (l5);
							}
						}
					} else {
						l5 = (EIF_FALSE);
						t2 = (T4f1(&l2, l3));
						if (!(t2)) {
							t2 = (l5);
						}
						while (!(t2)) {
							l4 = (T16f5(a1, l2));
							switch (l4) {
							case (T1)'a':
							case (T1)'b':
							case (T1)'c':
							case (T1)'d':
							case (T1)'e':
							case (T1)'f':
							case (T1)'g':
							case (T1)'h':
							case (T1)'i':
							case (T1)'j':
							case (T1)'k':
							case (T1)'l':
							case (T1)'m':
							case (T1)'n':
							case (T1)'o':
							case (T1)'p':
							case (T1)'q':
							case (T1)'r':
							case (T1)'s':
							case (T1)'t':
							case (T1)'u':
							case (T1)'v':
							case (T1)'w':
							case (T1)'x':
							case (T1)'y':
							case (T1)'z':
							case (T1)'A':
							case (T1)'B':
							case (T1)'C':
							case (T1)'D':
							case (T1)'E':
							case (T1)'F':
							case (T1)'G':
							case (T1)'H':
							case (T1)'I':
							case (T1)'J':
							case (T1)'K':
							case (T1)'L':
							case (T1)'M':
							case (T1)'N':
							case (T1)'O':
							case (T1)'P':
							case (T1)'Q':
							case (T1)'R':
							case (T1)'S':
							case (T1)'T':
							case (T1)'U':
							case (T1)'V':
							case (T1)'W':
							case (T1)'X':
							case (T1)'Y':
							case (T1)'Z':
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
							case (T1)(T1)('_'):
								T16f28(l1, l4);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l5 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l3));
							if (!(t2)) {
								t2 = (l5);
							}
						}
					}
					l1 = (T53f3(C, l1));
					t2 = ((l1)!=(EIF_VOID));
					if (t2) {
						t1 = (T53f2(C));
						R = (T54f5(t1, R, l1));
					}
				}
			}
		}
		t2 = (T4f1(&l2, l3));
	}
	return R;
}

/* KL_STRING_ROUTINES.appended_string */
T0* T54f5(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T2 t1;
	l1 = EIF_VOID;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		gevoid(l1, a2);
		R = (l1);
	} else {
		l1 = EIF_VOID;
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			R = (T54f9(C, a1, a2));
		} else {
			T16f30(a1, a2);
			R = (a1);
		}
	}
	return R;
}

/* STRING.append_string */
void T16f30(T0* C, T0* a1)
{
	T2 t1;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		T16f32(C, a1);
	}
}

/* KL_STRING_ROUTINES.concat */
T0* T54f9(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T2 t1;
	l1 = EIF_VOID;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((T0*)gevoid(l1, a2));
	} else {
		l1 = EIF_VOID;
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			R = ((T0*)gevoid(l1, a1));
		} else {
			R = (T16f13(a1, a2));
		}
	}
	return R;
}

/* STRING.infix "+" */
T0* T16f13(T0* C, T0* a1)
{
	T0* R = 0;
	T4 t1;
	t1 = (((T16*)(a1))->a2);
	t1 = ((T4)((((T16*)(C))->a2)+(t1)));
	R = (T16f8(C, t1));
	T16f32(R, C);
	T16f32(R, a1);
	return R;
}

/* KL_EXECUTION_ENVIRONMENT.variable_value */
T0* T53f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* t1;
	T0* t2;
	t1 = (T53f4(C));
	t2 = (T53f2(C));
	t2 = (T54f1(t2, a1));
	R = (T73f1(t1, t2));
	return R;
}

/* EXECUTION_ENVIRONMENT.get */
T0* T73f1(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T14 l2 = 0;
	T14 l3 = 0;
	T57 t1;
	T14 t2;
	T2 t3;
	l1 = (T16f7(a1));
	t1.id = 57;
	t1.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
	t2 = (T57f2(&t1));
	l2 = (T73f3(C, t2));
	t3 = ((l2)!=(l3));
	if (t3) {
		R = T16c36(l2);
	}
	return R;
}

/* STRING.make_from_c */
T0* T16c36(T14 a1)
{
	T4 l1 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	T0* C;
	C = (T0*)gealloc(sizeof(T16));
	((T16*)(C))->id = 16;
	t1 = ((((T16*)(C))->a1)==(EIF_VOID));
	if (t1) {
		t2 = (T16f21(C));
		T84f5(t2, a1);
		t2 = (T16f21(C));
		l1 = (((T84*)(t2))->a1);
		t3 = ((T4)((l1)+((T4)(geint32(1)))));
		T16f27(C, t3);
		((T16*)(C))->a2 = (l1);
		((T16*)(C))->a9 = ((T4)(geint32(0)));
		t2 = (T16f21(C));
		T84f6(t2, C);
	} else {
		T16f37(C, a1);
	}
	return C;
}

/* STRING.from_c */
void T16f37(T0* C, T14 a1)
{
	T4 l1 = 0;
	T0* t1;
	T4 t2;
	t1 = (T16f21(C));
	T84f5(t1, a1);
	t1 = (T16f21(C));
	l1 = (((T84*)(t1))->a1);
	t2 = ((T4)((l1)+((T4)(geint32(1)))));
	T16f34(C, t2);
	((T16*)(C))->a2 = (l1);
	((T16*)(C))->a9 = ((T4)(geint32(0)));
	t1 = (T16f21(C));
	T84f6(t1, C);
}

/* C_STRING.read_string_into */
void T84f6(T0* C, T0* a1)
{
	T84f8(C, a1, (T4)(geint32(1)), ((T84*)(C))->a1);
}

/* C_STRING.read_substring_into */
void T84f8(T0* C, T0* a1, T4 a2, T4 a3)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T2 t1;
	T8 t2;
	T1 t3;
	l3 = ((T4)((a2)-((T4)(geint32(1)))));
	l4 = (a3);
	l1 = (((T16*)(a1))->a1);
	l2 = (((T84*)(C))->a2);
	t1 = ((l3)==(l4));
	while (!(t1)) {
		t2 = (T87f2(l2, l3));
		t3 = ((T1)(t2));
		((T15*)(l1))->a2[l3] = (t3);
		l3 = ((T4)((l3)+((T4)(geint32(1)))));
		t1 = ((l3)==(l4));
	}
}

/* MANAGED_POINTER.read_natural_8 */
T8 T87f2(T0* C, T4 a1)
{
	T8 R = 0;
	T91 t1;
	T14 t2;
	t1.id = 91;
	t1.a1 = ((T14)&R);
	t2 = ((T14)(((char*)(((T87*)(C))->a3))+(a1)));
	T91f2(&t1, t2, (T4)(geint32(1)));
	return R;
}

/* TYPED_POINTER [NATURAL_8].memory_copy */
void T91f2(T91* C, T14 a1, T4 a2)
{
	T14 t1;
	t1 = ((*C).a1);
	T91f3(C, t1, a1, a2);
}

/* TYPED_POINTER [NATURAL_8].c_memcpy */
void T91f3(T91* C, T14 a1, T14 a2, T4 a3)
{
	memcpy((void *)a1,( const void *)a2,( size_t)a3);
}

/* C_STRING.share_from_pointer */
void T84f5(T0* C, T14 a1)
{
	T4 t1;
	t1 = (T84f3(C, a1));
	T84f7(C, a1, t1);
}

/* C_STRING.share_from_pointer_and_count */
void T84f7(T0* C, T14 a1, T4 a2)
{
	T2 t1;
	T2 t2;
	T4 t3;
	((T84*)(C))->a1 = (a2);
	t1 = ((((T84*)(C))->a2)==(EIF_VOID));
	if (!(t1)) {
		t2 = (((T87*)(((T84*)(C))->a2))->a1);
		t1 = ((T2)(!(t2)));
	}
	if (t1) {
		t3 = ((T4)((a2)+((T4)(geint32(1)))));
		((T84*)(C))->a2 = T87c8(a1, t3);
	} else {
		t3 = ((T4)((a2)+((T4)(geint32(1)))));
		T87f9(((T84*)(C))->a2, a1, t3);
	}
}

/* MANAGED_POINTER.set_from_pointer */
void T87f9(T0* C, T14 a1, T4 a2)
{
	((T87*)(C))->a3 = (a1);
	((T87*)(C))->a6 = (a2);
}

/* MANAGED_POINTER.share_from_pointer */
T0* T87c8(T14 a1, T4 a2)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T87));
	((T87*)(C))->id = 87;
	((T87*)(C))->a3 = (a1);
	((T87*)(C))->a6 = (a2);
	((T87*)(C))->a1 = (EIF_TRUE);
	return C;
}

/* C_STRING.c_strlen */
T4 T84f3(T0* C, T14 a1)
{
	T4 R = 0;
	R = (T4)( EIF_INTEGER )strlen((char *)a1);
	return R;
}

/* STRING.c_string_provider */
unsigned char ge6os1165 = '\0';
T0* ge6ov1165;
T0* T16f21(T0* C)
{
	T0* R = 0;
	if (ge6os1165) {
		return ge6ov1165;
	} else {
		ge6os1165 = '\1';
	}
	R = T84c4((T4)(geint32(0)));
	ge6ov1165 = R;
	return R;
}

/* C_STRING.make_empty */
T0* T84c4(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T84));
	((T84*)(C))->id = 84;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T84*)(C))->a2 = T87c7(t1);
	((T84*)(C))->a1 = ((T4)(geint32(0)));
	return C;
}

/* MANAGED_POINTER.make */
T0* T87c7(T4 a1)
{
	T4 t1;
	T14 t2;
	T2 t3;
	T0* t4;
	T0* C;
	C = (T0*)gealloc(sizeof(T87));
	((T87*)(C))->id = 87;
	t1 = (T4f14(&a1, (T4)(geint32(1))));
	((T87*)(C))->a3 = (T14f2(&(((T87*)(C))->a3), (T4)(geint32(1)), t1));
	t2 = (T87f5(C));
	t3 = ((((T87*)(C))->a3)==(t2));
	if (t3) {
		t4 = (T92c2());
		T92f3(t4, gems("No more memory", 14));
	}
	((T87*)(C))->a6 = (a1);
	return C;
}

/* EXCEPTIONS.raise */
void T92f3(T0* C, T0* a1)
{
	T0* l1 = 0;
	T2 t1;
	T57 t2;
	T14 t3;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		l1 = (T16f7(a1));
	}
	t2.id = 57;
	t2.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
	t3 = (T57f2(&t2));
	T92f4(C, t3, (T4)(geint32(24)));
}

/* EXCEPTIONS.eraise */
void T92f4(T0* C, T14 a1, T4 a2)
{
	eraise((char *)a1,( long)a2);
}

/* EXCEPTIONS.default_create */
T0* T92c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T92));
	((T92*)(C))->id = 92;
	return C;
}

/* MANAGED_POINTER.default_pointer */
T14 T87f5(T0* C)
{
	T14 R = 0;
	return R;
}

/* POINTER.memory_calloc */
T14 T14f2(T14* C, T4 a1, T4 a2)
{
	T14 R = 0;
	R = (T14f3(C, a1, a2));
	return R;
}

/* POINTER.c_calloc */
T14 T14f3(T14* C, T4 a1, T4 a2)
{
	T14 R = 0;
	R = (T14)( EIF_POINTER )calloc((size_t)a1,( size_t)a2);
	return R;
}

/* EXECUTION_ENVIRONMENT.eif_getenv */
T14 T73f3(T0* C, T14 a1)
{
	T14 R = 0;
	R = (T14)eif_getenv(a1);
	return R;
}

/* KL_EXECUTION_ENVIRONMENT.environment_impl */
unsigned char ge364os3734 = '\0';
T0* ge364ov3734;
T0* T53f4(T0* C)
{
	T0* R = 0;
	if (ge364os3734) {
		return ge364ov3734;
	} else {
		ge364os3734 = '\1';
	}
	R = T73c4();
	ge364ov3734 = R;
	return R;
}

/* EXECUTION_ENVIRONMENT.default_create */
T0* T73c4()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T73));
	((T73*)(C))->id = 73;
	return C;
}

/* KL_STRING_ROUTINES.append_substring_to_string */
void T54f13(T0* C, T0* a1, T0* a2, T4 a3, T4 a4)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T1 t2;
	l1 = EIF_VOID;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		gevoid(l1, a2, a3, a4);
	} else {
		l2 = (a3);
		t1 = (T4f1(&l2, a4));
		while (!(t1)) {
			t2 = (T16f5(a2, l2));
			T16f28(a1, t2);
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = (T4f1(&l2, a4));
		}
	}
}

/* KL_STRING_ROUTINES.appended_substring */
T0* T54f3(T0* C, T0* a1, T0* a2, T4 a3, T4 a4)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	T1 t3;
	l1 = EIF_VOID;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		gevoid(l1, a2, a3, a4);
		R = (l1);
	} else {
		l1 = EIF_VOID;
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t2 = (((T16*)(a1))->a2);
			t2 = ((T4)((t2)+(a4)));
			t2 = ((T4)((t2)-(a3)));
			t2 = ((T4)((t2)+((T4)(geint32(1)))));
			l1 = ((T0*)gevoid(l1, t2));
			gevoid(l1, a1);
			gevoid(l1, a2, a3, a4);
			R = (l1);
		} else {
			l2 = (a3);
			t1 = (T4f1(&l2, a4));
			while (!(t1)) {
				t3 = (T16f5(a2, l2));
				T16f28(a1, t3);
				l2 = ((T4)((l2)+((T4)(geint32(1)))));
				t1 = (T4f1(&l2, a4));
			}
			R = (a1);
		}
	}
	return R;
}

/* KL_STRING_ROUTINES.new_empty_string */
T0* T54f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* t1;
	T2 t2;
	t1 = (T54f6(C));
	t2 = (T75f1(t1, a1, ge392ov3909));
	if (t2) {
		R = T16c25(a2);
	} else {
		l1 = EIF_VOID;
		t2 = ((l1)!=(EIF_VOID));
		if (t2) {
			R = ((T0*)gevoid(l1, a2));
		} else {
			R = (T54f8(C, a1));
			T16f29(R);
		}
	}
	return R;
}

/* STRING.wipe_out */
void T16f29(T0* C)
{
	((T16*)(C))->a1 = T15c9((T4)(geint32(1)));
	((T16*)(C))->a2 = ((T4)(geint32(0)));
	((T16*)(C))->a9 = ((T4)(geint32(0)));
}

/* KL_STRING_ROUTINES.cloned_string */
T0* T54f8(T0* C, T0* a1)
{
	T0* R = 0;
	R = (T16f12(a1));
	return R;
}

/* STRING.twin */
T0* T16f12(T0* C)
{
	T0* R = 0;
	R = (T0*)gealloc(sizeof(T16));
	((T16*)(R))->id = 16;
	T16f33(R, C);
	return R;
}

/* STRING.copy */
void T16f33(T0* C, T0* a1)
{
	T0* l1 = 0;
	T2 t1;
	T4 t2;
	t1 = ((a1)!=(C));
	if (t1) {
		l1 = (((T16*)(C))->a1);
		*(T16*)(C) = *(T16*)(a1);
		t1 = ((l1)==(EIF_VOID));
		if (!(t1)) {
			t2 = (((T15*)(l1))->a1);
			t1 = (T4f6(&t2, ((T16*)(C))->a2));
		}
		if (t1) {
			((T16*)(C))->a1 = (T15f3(((T16*)(C))->a1));
		} else {
			T15f8(l1, ((T16*)(C))->a1, (T4)(geint32(0)), (T4)(geint32(0)), ((T16*)(C))->a2);
			((T16*)(C))->a1 = (l1);
		}
		((T16*)(C))->a9 = ((T4)(geint32(0)));
	}
}

/* SPECIAL [CHARACTER].twin */
T0* T15f3(T0* C)
{
	T0* R = 0;
	R = (T0*)gealloc(sizeof(T15)+((T15*)(C))->a1*sizeof(T1));
	*(T15*)(R) = *(T15*)(C);
	memcpy(((T15*)(R))->a2,((T15*)(C))->a2,  ((T15*)(C))->a1*sizeof(T1));
	return R;
}

/* KL_EXECUTION_ENVIRONMENT.string_ */
T0* T53f2(T0* C)
{
	T0* R = 0;
	if (ge262os1508) {
		return ge262ov1508;
	} else {
		ge262os1508 = '\1';
	}
	R = T54c12();
	ge262ov1508 = R;
	return R;
}

/* GEPP_PARSER.execution_environment */
unsigned char ge311os1713 = '\0';
T0* ge311ov1713;
T0* T21f155(T0* C)
{
	T0* R = 0;
	if (ge311os1713) {
		return ge311ov1713;
	} else {
		ge311os1713 = '\1';
	}
	R = T53c5();
	ge311ov1713 = R;
	return R;
}

/* KL_EXECUTION_ENVIRONMENT.default_create */
T0* T53c5()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T53));
	((T53*)(C))->id = 53;
	return C;
}

/* DS_ARRAYED_STACK [YY_BUFFER].is_full */
T2 T38f1(T0* C)
{
	T2 R = 0;
	R = ((((T38*)(C))->a2)==(((T38*)(C))->a5));
	return R;
}

/* GEPP_PARSER.undefine_value */
void T21f203(T0* C, T0* a1)
{
	T37f35(((T21*)(C))->a5, a1);
}

/* DS_HASH_TABLE [STRING, STRING].remove */
void T37f35(T0* C, T0* a1)
{
	T2 t1;
	T37f38(C);
	T37f36(C, a1);
	t1 = ((((T37*)(C))->a2)!=((T4)(geint32(0))));
	if (t1) {
		T37f44(C, ((T37*)(C))->a2);
	}
}

/* DS_HASH_TABLE [STRING, STRING].remove_position */
void T37f44(T0* C, T4 a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T4 l4 = 0;
	T0* l5 = 0;
	T2 t1;
	T4 t2;
	t1 = ((a1)!=(((T37*)(C))->a2));
	if (t1) {
		l2 = (T37f17(C, a1));
		l4 = (T37f8(C, l2));
		t2 = (T37f14(C, l4));
		t1 = ((t2)==(a1));
		if (t1) {
			((T37*)(C))->a2 = (a1);
			((T37*)(C))->a9 = (l4);
			((T37*)(C))->a16 = ((T4)(geint32(0)));
		} else {
			l5 = (((T37*)(C))->a4);
			T37f50(C, EIF_VOID);
			T37f36(C, l2);
			T37f50(C, l5);
		}
	}
	T37f51(C, ((T37*)(C))->a2);
	t1 = ((((T37*)(C))->a16)==((T4)(geint32(0))));
	if (t1) {
		t2 = (T37f13(C, ((T37*)(C))->a2));
		T37f42(C, t2, ((T37*)(C))->a9);
	} else {
		t2 = (T37f13(C, ((T37*)(C))->a2));
		T37f41(C, t2, ((T37*)(C))->a16);
	}
	T37f39(C, l1, ((T37*)(C))->a2);
	T37f43(C, l3, ((T37*)(C))->a2);
	t1 = ((((T37*)(C))->a10)==((T4)(geint32(0))));
	if (t1) {
		t1 = ((((T37*)(C))->a2)==(((T37*)(C))->a11));
	}
	if (t1) {
		((T37*)(C))->a11 = ((T4)((((T37*)(C))->a11)-((T4)(geint32(1)))));
		T37f41(C, (T4)(geint32(0)), ((T37*)(C))->a2);
	} else {
		t2 = (T4)(geint32(-1));
		t2 = ((T4)((t2)-(((T37*)(C))->a10)));
		T37f41(C, t2, ((T37*)(C))->a2);
		((T37*)(C))->a10 = (((T37*)(C))->a2);
	}
	((T37*)(C))->a5 = ((T4)((((T37*)(C))->a5)-((T4)(geint32(1)))));
}

/* DS_HASH_TABLE [STRING, STRING].keys_put */
void T37f43(T0* C, T0* a1, T4 a2)
{
	((T47*)(((T37*)(C))->a25))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [STRING, STRING].items_put */
void T37f39(T0* C, T0* a1, T4 a2)
{
	((T47*)(((T37*)(C))->a20))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [STRING, STRING].clashes_put */
void T37f41(T0* C, T4 a1, T4 a2)
{
	((T41*)(((T37*)(C))->a23))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [STRING, STRING].slots_put */
void T37f42(T0* C, T4 a1, T4 a2)
{
	((T41*)(((T37*)(C))->a24))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [STRING, STRING].move_cursors_forth */
void T37f51(T0* C, T4 a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	l1 = ((T4)((a1)+((T4)(geint32(1)))));
	l2 = (((T37*)(C))->a11);
	t1 = (T4f1(&l1, l2));
	if (!(t1)) {
		t2 = (T37f13(C, l1));
		t1 = (T4f1(&t2, (T4)(geint32(-1))));
	}
	while (!(t1)) {
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
		if (!(t1)) {
			t2 = (T37f13(C, l1));
			t1 = (T4f1(&t2, (T4)(geint32(-1))));
		}
	}
	t1 = (T4f1(&l1, l2));
	if (t1) {
		T37f56(C, a1);
	} else {
		T37f57(C, a1, l1);
	}
}

/* DS_HASH_TABLE [STRING, STRING].move_all_cursors */
void T37f57(T0* C, T4 a1, T4 a2)
{
	T0* l1 = 0;
	T2 t1;
	T4 t2;
	l1 = (((T37*)(C))->a26);
	t1 = ((l1)==(EIF_VOID));
	while (!(t1)) {
		t2 = (((T66*)(l1))->a1);
		t1 = ((t2)==(a1));
		if (t1) {
			T66f5(l1, a2);
		}
		l1 = (((T66*)(l1))->a2);
		t1 = ((l1)==(EIF_VOID));
	}
}

/* DS_HASH_TABLE_CURSOR [STRING, STRING].set_position */
void T66f5(T0* C, T4 a1)
{
	((T66*)(C))->a1 = (a1);
}

/* DS_HASH_TABLE [STRING, STRING].move_cursors_after */
void T37f56(T0* C, T4 a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T4 t1;
	T2 t2;
	l1 = (((T37*)(C))->a26);
	t1 = (((T66*)(l1))->a1);
	t2 = ((t1)==(a1));
	if (t2) {
		T66f5(l1, (T4)(geint32(-2)));
	}
	l2 = (l1);
	l1 = (((T66*)(l1))->a2);
	t2 = ((l1)==(EIF_VOID));
	while (!(t2)) {
		t1 = (((T66*)(l1))->a1);
		t2 = ((t1)==(a1));
		if (t2) {
			T66f5(l1, (T4)(geint32(-2)));
			l3 = (((T66*)(l1))->a2);
			T66f6(l2, l3);
			T66f6(l1, EIF_VOID);
			l1 = (l3);
		} else {
			l2 = (l1);
			l1 = (((T66*)(l1))->a2);
		}
		t2 = ((l1)==(EIF_VOID));
	}
}

/* DS_HASH_TABLE_CURSOR [STRING, STRING].set_next_cursor */
void T66f6(T0* C, T0* a1)
{
	((T66*)(C))->a2 = (a1);
}

/* DS_HASH_TABLE [STRING, STRING].internal_set_key_equality_tester */
void T37f50(T0* C, T0* a1)
{
	((T37*)(C))->a4 = (a1);
}

/* DS_HASH_TABLE [STRING, STRING].unset_found_item */
void T37f38(T0* C)
{
	((T37*)(C))->a19 = ((T4)(geint32(0)));
}

/* GEPP_PARSER.define_value */
void T21f171(T0* C, T0* a1, T0* a2)
{
	T37f34(((T21*)(C))->a5, a1, a2);
}

/* DS_HASH_TABLE [STRING, STRING].force */
void T37f34(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	T37f38(C);
	T37f36(C, a2);
	t1 = ((((T37*)(C))->a2)!=((T4)(geint32(0))));
	if (t1) {
		T37f39(C, a1, ((T37*)(C))->a2);
	} else {
		t1 = ((((T37*)(C))->a5)==(((T37*)(C))->a6));
		if (t1) {
			t2 = ((T4)((((T37*)(C))->a5)+((T4)(geint32(1)))));
			t2 = (T37f7(C, t2));
			T37f40(C, t2);
			l2 = (T37f8(C, a2));
		} else {
			l2 = (((T37*)(C))->a9);
		}
		l1 = (((T37*)(C))->a10);
		t1 = ((l1)==((T4)(geint32(0))));
		if (t1) {
			((T37*)(C))->a11 = ((T4)((((T37*)(C))->a11)+((T4)(geint32(1)))));
			l1 = (((T37*)(C))->a11);
		} else {
			t2 = (T4)(geint32(-1));
			t3 = (T37f13(C, l1));
			((T37*)(C))->a10 = ((T4)((t2)-(t3)));
		}
		t2 = (T37f14(C, l2));
		T37f41(C, t2, l1);
		T37f42(C, l1, l2);
		T37f39(C, a1, l1);
		T37f43(C, a2, l1);
		((T37*)(C))->a5 = ((T4)((((T37*)(C))->a5)+((T4)(geint32(1)))));
	}
}

/* DS_HASH_TABLE [STRING, STRING].resize */
void T37f40(T0* C, T4 a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	T37f38(C);
	l1 = (T37f21(C, a1));
	t1 = ((T4)((l1)+((T4)(geint32(1)))));
	T37f46(C, t1);
	l2 = (((T37*)(C))->a15);
	t2 = ((T2)((l2)<((T4)(geint32(0)))));
	while (!(t2)) {
		T37f42(C, (T4)(geint32(0)), l2);
		l2 = ((T4)((l2)-((T4)(geint32(1)))));
		t2 = ((T2)((l2)<((T4)(geint32(0)))));
	}
	((T37*)(C))->a15 = (l1);
	l2 = (((T37*)(C))->a11);
	t2 = ((T2)((l2)<((T4)(geint32(1)))));
	while (!(t2)) {
		t1 = (T37f13(C, l2));
		t2 = (T4f1(&t1, (T4)(geint32(-1))));
		if (t2) {
			t3 = (T37f17(C, l2));
			l3 = (T37f8(C, t3));
			t1 = (T37f14(C, l3));
			T37f41(C, t1, l2);
			T37f42(C, l2, l3);
		}
		l2 = ((T4)((l2)-((T4)(geint32(1)))));
		t2 = ((T2)((l2)<((T4)(geint32(1)))));
	}
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T37f47(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T37f48(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T37f49(C, t1);
	((T37*)(C))->a6 = (a1);
	((T37*)(C))->a2 = ((T4)(geint32(0)));
}

/* DS_HASH_TABLE [STRING, STRING].clashes_resize */
void T37f49(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T37f28(C));
	((T37*)(C))->a23 = (T42f2(t1, ((T37*)(C))->a23, a1));
}

/* DS_HASH_TABLE [STRING, STRING].special_integer_ */
unsigned char ge260os1512 = '\0';
T0* ge260ov1512;
T0* T37f28(T0* C)
{
	T0* R = 0;
	if (ge260os1512) {
		return ge260ov1512;
	} else {
		ge260os1512 = '\1';
	}
	R = T42c4();
	ge260ov1512 = R;
	return R;
}

/* KL_SPECIAL_ROUTINES [INTEGER].default_create */
T0* T42c4()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T42));
	((T42*)(C))->id = 42;
	return C;
}

/* DS_HASH_TABLE [STRING, STRING].keys_resize */
void T37f48(T0* C, T4 a1)
{
	((T37*)(C))->a25 = (T48f2(((T37*)(C))->a30, ((T37*)(C))->a25, a1));
}

/* KL_SPECIAL_ROUTINES [STRING].resize */
T0* T48f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T47*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T47f3(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [STRING].resized_area */
T0* T47f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T47c5(a1);
	l2 = (((T47*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T47*)(C))->a2[l1]);
		((T47*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* DS_HASH_TABLE [STRING, STRING].items_resize */
void T37f47(T0* C, T4 a1)
{
	((T37*)(C))->a20 = (T48f2(((T37*)(C))->a29, ((T37*)(C))->a20, a1));
}

/* DS_HASH_TABLE [STRING, STRING].slots_resize */
void T37f46(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T37f28(C));
	((T37*)(C))->a24 = (T42f2(t1, ((T37*)(C))->a24, a1));
}

/* DS_HASH_TABLE [STRING, STRING].new_modulus */
T4 T37f21(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* DS_HASH_TABLE [STRING, STRING].new_capacity */
T4 T37f7(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = (T4)(geint32(2));
	R = ((T4)((t1)*(a1)));
	return R;
}

/* GEPP_PARSER.yy_push_last_value */
void T21f190(T0* C, T4 a1)
{
	T4 t1;
	T2 t2;
	t1 = (((T41*)(((T21*)(C))->a65))->a2[a1]);
	switch (t1) {
	case (T4)(T4)(geint32(1)):
		((T21*)(C))->a74 = ((T4)((((T21*)(C))->a74)+((T4)(geint32(1)))));
		t2 = (T4f2(&(((T21*)(C))->a74), ((T21*)(C))->a121));
		if (t2) {
			t2 = ((((T21*)(C))->a122)==(EIF_VOID));
			if (t2) {
				((T21*)(C))->a123 = T46c3();
				((T21*)(C))->a121 = ((T4)(geint32(10)));
				((T21*)(C))->a122 = (T46f1(((T21*)(C))->a123, ((T21*)(C))->a121));
			} else {
				((T21*)(C))->a121 = ((T4)((((T21*)(C))->a121)+((T4)(geint32(10)))));
				((T21*)(C))->a122 = (T46f2(((T21*)(C))->a123, ((T21*)(C))->a122, ((T21*)(C))->a121));
			}
		}
		((T45*)(((T21*)(C))->a122))->a2[((T21*)(C))->a74] = (((T21*)(C))->a125);
		break;
	case (T4)(T4)(geint32(2)):
		((T21*)(C))->a75 = ((T4)((((T21*)(C))->a75)+((T4)(geint32(1)))));
		t2 = (T4f2(&(((T21*)(C))->a75), ((T21*)(C))->a126));
		if (t2) {
			t2 = ((((T21*)(C))->a127)==(EIF_VOID));
			if (t2) {
				((T21*)(C))->a128 = T48c3();
				((T21*)(C))->a126 = ((T4)(geint32(10)));
				((T21*)(C))->a127 = (T48f1(((T21*)(C))->a128, ((T21*)(C))->a126));
			} else {
				((T21*)(C))->a126 = ((T4)((((T21*)(C))->a126)+((T4)(geint32(10)))));
				((T21*)(C))->a127 = (T48f2(((T21*)(C))->a128, ((T21*)(C))->a127, ((T21*)(C))->a126));
			}
		}
		((T47*)(((T21*)(C))->a127))->a2[((T21*)(C))->a75] = (((T21*)(C))->a129);
		break;
	default:
		T21f188(C);
		break;
	}
}

/* KL_SPECIAL_ROUTINES [STRING].make */
T0* T48f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T71c2(a1);
	R = (((T71*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [STRING].make_area */
T0* T71c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T71));
	((T71*)(C))->id = 71;
	((T71*)(C))->a1 = T47c5(a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [STRING].default_create */
T0* T48c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T48));
	((T48*)(C))->id = 48;
	return C;
}

/* GEPP_PARSER.accept */
void T21f189(T0* C)
{
	((T21*)(C))->a2 = ((T4)(geint32(101)));
}

/* GEPP_PARSER.abort */
void T21f188(T0* C)
{
	((T21*)(C))->a2 = ((T4)(geint32(102)));
}

/* GEPP_PARSER.yy_do_error_action */
void T21f187(T0* C, T4 a1)
{
	switch (a1) {
	case (T4)(T4)(geint32(39)):
		T21f201(C);
		break;
	default:
		T21f202(C, gems("parse error", 11));
		break;
	}
}

/* GEPP_PARSER.report_error */
void T21f202(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	if ((((T21*)(C))->a18)==EIF_VOID) {
		l2 = EIF_VOID;
	} else {
		switch ((((T21*)(C))->a18)->id) {
		case 39:
			l2 = ((T21*)(C))->a18;
			break;
		default:
			l2 = EIF_VOID;
		}
	}
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t2 = (((T39*)(l2))->a9);
		l3 = ((((t2)->id==24)?((T24*)(t2))->a7:((T29*)(t2))->a4));
	} else {
		l3 = (gems("string", 6));
	}
	l1 = T51c7(l3, ((T21*)(C))->a14);
	T20f8(((T21*)(C))->a4, l1);
}

/* UT_SYNTAX_ERROR.make */
T0* T51c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T51));
	((T51*)(C))->id = 51;
	((T51*)(C))->a5 = T60c11((T4)(geint32(1)), (T4)(geint32(2)));
	T60f12(((T51*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f10(&a2));
	T60f12(((T51*)(C))->a5, t1, (T4)(geint32(2)));
	return C;
}

/* GEPP_PARSER.report_eof_expected_error */
void T21f201(T0* C)
{
	T21f202(C, gems("parse error", 11));
}

/* GEPP_PARSER.read_token */
void T21f186(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T4 l7 = 0;
	T4 l8 = 0;
	T2 l9 = 0;
	T4 l10 = 0;
	T4 l11 = 0;
	T4 l12 = 0;
	T2 l13 = 0;
	T2 t1;
	T1 t2;
	T4 t3;
	((T21*)(C))->a44 = ((T4)(geint32(-2)));
	l7 = ((T4)(geint32(1)));
	t1 = ((((T21*)(C))->a44)!=((T4)(geint32(-2))));
	while (!(t1)) {
		switch (l7) {
		case (T4)(T4)(geint32(1)):
			if (((T21*)(C))->a83) {
				((T21*)(C))->a84 = ((T4)((((T21*)(C))->a19)-(((T21*)(C))->a73)));
				((T21*)(C))->a83 = (EIF_FALSE);
			} else {
				((T21*)(C))->a84 = ((T4)(geint32(0)));
				((T21*)(C))->a85 = (((T21*)(C))->a21);
				((T21*)(C))->a86 = (((T21*)(C))->a22);
				((T21*)(C))->a87 = (((T21*)(C))->a20);
			}
			l1 = (((T21*)(C))->a19);
			l2 = (l1);
			t1 = ((((((T21*)(C))->a18)->id==39)?((T39*)(((T21*)(C))->a18))->a6:((T40*)(((T21*)(C))->a18))->a6));
			if (t1) {
				l3 = ((T4)((((T21*)(C))->a88)+((T4)(geint32(1)))));
			} else {
				l3 = (((T21*)(C))->a88);
			}
			if (EIF_FALSE) {
				((T41*)(((T21*)(C))->a90))->a2[(T4)(geint32(0))] = (l3);
				((T21*)(C))->a91 = ((T4)(geint32(1)));
			}
			l7 = ((T4)(geint32(2)));
			break;
		case (T4)(T4)(geint32(2)):
			l13 = (EIF_FALSE);
			while (!(l13)) {
				t1 = ((((T21*)(C))->a92)!=(EIF_VOID));
				if (t1) {
					t1 = ((((T21*)(C))->a93)!=(EIF_VOID));
					if (t1) {
						t2 = (((T15*)(((T21*)(C))->a93))->a2[l1]);
						t3 = ((T4)(t2));
						l8 = (((T41*)(((T21*)(C))->a92))->a2[t3]);
					} else {
						t2 = (T79f1(((T21*)(C))->a94, l1));
						t3 = ((T4)(t2));
						l8 = (((T41*)(((T21*)(C))->a92))->a2[t3]);
					}
				} else {
					t1 = ((((T21*)(C))->a93)!=(EIF_VOID));
					if (t1) {
						t2 = (((T15*)(((T21*)(C))->a93))->a2[l1]);
						l8 = ((T4)(t2));
					} else {
						t2 = (T79f1(((T21*)(C))->a94, l1));
						l8 = ((T4)(t2));
					}
				}
				t1 = EIF_FALSE;
				t1 = ((T2)(!(t1)));
				if (t1) {
					t3 = (((T41*)(((T21*)(C))->a95))->a2[l3]);
					t1 = ((t3)!=((T4)(geint32(0))));
				}
				if (t1) {
					((T21*)(C))->a96 = (l3);
					((T21*)(C))->a97 = (l1);
				}
				t3 = (((T41*)(((T21*)(C))->a99))->a2[l3]);
				t3 = ((T4)((t3)+(l8)));
				t3 = (((T41*)(((T21*)(C))->a98))->a2[t3]);
				t1 = ((t3)==(l3));
				while (!(t1)) {
					l3 = (((T41*)(((T21*)(C))->a100))->a2[l3]);
					t1 = ((((T21*)(C))->a101)!=(EIF_VOID));
					if (t1) {
						t1 = (T4f2(&l3, (T4)(geint32(67))));
					}
					if (t1) {
						l8 = (((T41*)(((T21*)(C))->a101))->a2[l8]);
					}
					t3 = (((T41*)(((T21*)(C))->a99))->a2[l3]);
					t3 = ((T4)((t3)+(l8)));
					t3 = (((T41*)(((T21*)(C))->a98))->a2[t3]);
					t1 = ((t3)==(l3));
				}
				t3 = (((T41*)(((T21*)(C))->a99))->a2[l3]);
				t3 = ((T4)((t3)+(l8)));
				l3 = (((T41*)(((T21*)(C))->a103))->a2[t3]);
				if (EIF_FALSE) {
					((T41*)(((T21*)(C))->a90))->a2[((T21*)(C))->a91] = (l3);
					((T21*)(C))->a91 = ((T4)((((T21*)(C))->a91)+((T4)(geint32(1)))));
				}
				l1 = ((T4)((l1)+((T4)(geint32(1)))));
				l13 = ((l3)==((T4)(geint32(66))));
			}
			t1 = EIF_FALSE;
			t1 = ((T2)(!(t1)));
			if (t1) {
				l1 = (((T21*)(C))->a97);
				l3 = (((T21*)(C))->a96);
			}
			l7 = ((T4)(geint32(3)));
			break;
		case (T4)(T4)(geint32(3)):
			t1 = EIF_FALSE;
			t1 = ((T2)(!(t1)));
			if (t1) {
				l6 = (((T41*)(((T21*)(C))->a95))->a2[l3]);
				l7 = ((T4)(geint32(4)));
			} else {
				((T21*)(C))->a91 = ((T4)((((T21*)(C))->a91)-((T4)(geint32(1)))));
				l3 = (((T41*)(((T21*)(C))->a90))->a2[((T21*)(C))->a91]);
				((T21*)(C))->a105 = (((T41*)(((T21*)(C))->a95))->a2[l3]);
				l7 = ((T4)(geint32(5)));
			}
			break;
		case (T4)(T4)(geint32(5)):
			l9 = (EIF_FALSE);
			while (!(l9)) {
				t1 = ((((T21*)(C))->a105)!=((T4)(geint32(0))));
				if (t1) {
					t3 = ((T4)((l3)+((T4)(geint32(1)))));
					t3 = (((T41*)(((T21*)(C))->a95))->a2[t3]);
					t1 = ((T2)((((T21*)(C))->a105)<(t3)));
				}
				if (t1) {
					l6 = ((T4)gevoid(((T21*)(C))->a106, ((T21*)(C))->a105));
					if (EIF_FALSE) {
						t3 = (T4)(geint32(23));
						t3 = ((T4)(-(t3)));
						t1 = ((T2)((l6)<(t3)));
						if (!(t1)) {
							t1 = ((((T21*)(C))->a109)!=((T4)(geint32(0))));
						}
						if (t1) {
							t1 = ((l6)==(((T21*)(C))->a109));
							if (t1) {
								((T21*)(C))->a109 = ((T4)(geint32(0)));
								t3 = ((T4)(-(l6)));
								l6 = ((T4)((t3)-((T4)(geint32(23)))));
								l9 = (EIF_TRUE);
							} else {
								((T21*)(C))->a105 = ((T4)((((T21*)(C))->a105)+((T4)(geint32(1)))));
							}
						} else {
							t1 = ((T2)((l6)<((T4)(geint32(0)))));
							if (t1) {
								((T21*)(C))->a109 = ((T4)((l6)-((T4)(geint32(23)))));
								if (EIF_FALSE) {
									((T21*)(C))->a111 = (l1);
									((T21*)(C))->a112 = (((T21*)(C))->a91);
									((T21*)(C))->a113 = (((T21*)(C))->a105);
								}
								((T21*)(C))->a105 = ((T4)((((T21*)(C))->a105)+((T4)(geint32(1)))));
							} else {
								((T21*)(C))->a111 = (l1);
								((T21*)(C))->a112 = (((T21*)(C))->a91);
								((T21*)(C))->a113 = (((T21*)(C))->a105);
								l9 = (EIF_TRUE);
							}
						}
					} else {
						((T21*)(C))->a111 = (l1);
						l9 = (EIF_TRUE);
					}
				} else {
					l1 = ((T4)((l1)-((T4)(geint32(1)))));
					((T21*)(C))->a91 = ((T4)((((T21*)(C))->a91)-((T4)(geint32(1)))));
					l3 = (((T41*)(((T21*)(C))->a90))->a2[((T21*)(C))->a91]);
					((T21*)(C))->a105 = (((T41*)(((T21*)(C))->a95))->a2[l3]);
				}
			}
			l10 = (((T21*)(C))->a21);
			l11 = (((T21*)(C))->a22);
			l12 = (((T21*)(C))->a20);
			l7 = ((T4)(geint32(4)));
			break;
		case (T4)(T4)(geint32(4)):
			l2 = ((T4)((l2)-(((T21*)(C))->a84)));
			((T21*)(C))->a73 = (l2);
			((T21*)(C))->a19 = (l1);
			l7 = ((T4)(geint32(1)));
			t1 = ((l6)==((T4)(geint32(0))));
			if (t1) {
				t1 = EIF_FALSE;
				t1 = ((T2)(!(t1)));
				if (t1) {
					l1 = (((T21*)(C))->a97);
					l2 = ((T4)((l2)+(((T21*)(C))->a84)));
					l3 = (((T21*)(C))->a96);
					l7 = ((T4)(geint32(3)));
				} else {
					((T21*)(C))->a44 = ((T4)(geint32(-1)));
					T21f197(C, gems("fatal scanner internal error: no action found", 45));
				}
			} else {
				t1 = ((l6)==((T4)(geint32(24))));
				if (t1) {
					t3 = ((T4)((l1)-(l2)));
					l5 = ((T4)((t3)-((T4)(geint32(1)))));
					t3 = ((((((T21*)(C))->a18)->id==39)?((T39*)(((T21*)(C))->a18))->a7:((T40*)(((T21*)(C))->a18))->a7));
					t3 = ((T4)((t3)+((T4)(geint32(1)))));
					t1 = (T4f6(&(((T21*)(C))->a19), t3));
					if (t1) {
						((T21*)(C))->a19 = ((T4)((l2)+(l5)));
						l3 = (T21f116(C));
						l4 = (T21f117(C, l3));
						l2 = ((T4)((l2)+(((T21*)(C))->a84)));
						t1 = ((l4)!=((T4)(geint32(0))));
						if (t1) {
							l1 = ((T4)((((T21*)(C))->a19)+((T4)(geint32(1)))));
							((T21*)(C))->a19 = (l1);
							l3 = (l4);
							l7 = ((T4)(geint32(2)));
						} else {
							if (EIF_FALSE) {
								l1 = (((T21*)(C))->a19);
								((T21*)(C))->a91 = ((T4)((((T21*)(C))->a91)-((T4)(geint32(1)))));
							} else {
								l1 = (((T21*)(C))->a97);
								l3 = (((T21*)(C))->a96);
							}
							l7 = ((T4)(geint32(3)));
						}
					} else {
						((T21*)(C))->a19 = ((T4)((((T21*)(C))->a19)-((T4)(geint32(1)))));
						T21f198(C);
						t1 = ((((((T21*)(C))->a18)->id==39)?((T39*)(((T21*)(C))->a18))->a8:((T40*)(((T21*)(C))->a18))->a8));
						if (t1) {
							l3 = (T21f116(C));
							l1 = (((T21*)(C))->a19);
							l2 = ((T4)((((T21*)(C))->a73)+(((T21*)(C))->a84)));
							l7 = ((T4)(geint32(2)));
						} else {
							t3 = ((T4)((((T21*)(C))->a19)-(((T21*)(C))->a73)));
							t3 = ((T4)((t3)-(((T21*)(C))->a84)));
							t1 = ((t3)!=((T4)(geint32(0))));
							if (t1) {
								l3 = (T21f116(C));
								l1 = (((T21*)(C))->a19);
								l2 = ((T4)((((T21*)(C))->a73)+(((T21*)(C))->a84)));
								l7 = ((T4)(geint32(3)));
							} else {
								t1 = (T21f118(C));
								if (t1) {
									l2 = (((T21*)(C))->a73);
									l1 = (((T21*)(C))->a19);
									t3 = ((T4)((((T21*)(C))->a88)-((T4)(geint32(1)))));
									t3 = ((T4)((t3)/((T4)(geint32(2)))));
									T21f199(C, t3);
								}
							}
						}
					}
				} else {
					T21f200(C, l6);
					if (((T21*)(C))->a119) {
						((T21*)(C))->a119 = (EIF_FALSE);
						((T21*)(C))->a21 = (l10);
						((T21*)(C))->a22 = (l11);
						((T21*)(C))->a20 = (l12);
						l1 = (((T21*)(C))->a111);
						if (EIF_FALSE) {
							((T21*)(C))->a105 = (((T21*)(C))->a113);
							((T21*)(C))->a91 = (((T21*)(C))->a112);
							t3 = ((T4)((((T21*)(C))->a91)-((T4)(geint32(1)))));
							l3 = (((T41*)(((T21*)(C))->a90))->a2[t3]);
						}
						((T21*)(C))->a105 = ((T4)((((T21*)(C))->a105)+((T4)(geint32(1)))));
						l7 = ((T4)(geint32(5)));
					}
				}
			}
			break;
		default:
			break;
		}
		t1 = ((((T21*)(C))->a44)!=((T4)(geint32(-2))));
	}
}

/* GEPP_PARSER.yy_execute_action */
void T21f200(T0* C, T4 a1)
{
	T2 t1;
	T4 t2;
	T1 t3;
	t1 = (T4f6(&a1, (T4)(geint32(12))));
	if (t1) {
		t1 = (T4f6(&a1, (T4)(geint32(6))));
		if (t1) {
			t1 = (T4f6(&a1, (T4)(geint32(3))));
			if (t1) {
				t1 = (T4f6(&a1, (T4)(geint32(2))));
				if (t1) {
					t1 = ((a1)==((T4)(geint32(1))));
					if (t1) {
						T21f208(C, (T4)(geint32(1)));
						if (((T21*)(C))->a9) {
							if ((((T21*)(C))->a10)->id==25) {
								T25f28(((T21*)(C))->a10);
							} else {
								T28f11(((T21*)(C))->a10);
							}
						}
					} else {
						((T21*)(C))->a44 = ((T4)(geint32(258)));
						T21f208(C, (T4)(geint32(1)));
						if (((T21*)(C))->a9) {
							if ((((T21*)(C))->a10)->id==25) {
								T25f28(((T21*)(C))->a10);
							} else {
								T28f11(((T21*)(C))->a10);
							}
						}
					}
				} else {
					((T21*)(C))->a44 = ((T4)(geint32(259)));
					T21f208(C, (T4)(geint32(1)));
					if (((T21*)(C))->a9) {
						if ((((T21*)(C))->a10)->id==25) {
							T25f28(((T21*)(C))->a10);
						} else {
							T28f11(((T21*)(C))->a10);
						}
					}
				}
			} else {
				t1 = (T4f6(&a1, (T4)(geint32(5))));
				if (t1) {
					t1 = ((a1)==((T4)(geint32(4))));
					if (t1) {
						((T21*)(C))->a44 = ((T4)(geint32(264)));
						T21f208(C, (T4)(geint32(1)));
						if (((T21*)(C))->a9) {
							if ((((T21*)(C))->a10)->id==25) {
								T25f28(((T21*)(C))->a10);
							} else {
								T28f11(((T21*)(C))->a10);
							}
						}
					} else {
						((T21*)(C))->a44 = ((T4)(geint32(265)));
						T21f208(C, (T4)(geint32(1)));
						if (((T21*)(C))->a9) {
							if ((((T21*)(C))->a10)->id==25) {
								T25f28(((T21*)(C))->a10);
							} else {
								T28f11(((T21*)(C))->a10);
							}
						}
					}
				} else {
					((T21*)(C))->a44 = ((T4)(geint32(260)));
					T21f208(C, (T4)(geint32(1)));
					if (((T21*)(C))->a9) {
						if ((((T21*)(C))->a10)->id==25) {
							T25f28(((T21*)(C))->a10);
						} else {
							T28f11(((T21*)(C))->a10);
						}
					}
				}
			}
		} else {
			t1 = (T4f6(&a1, (T4)(geint32(9))));
			if (t1) {
				t1 = (T4f6(&a1, (T4)(geint32(8))));
				if (t1) {
					t1 = ((a1)==((T4)(geint32(7))));
					if (t1) {
						((T21*)(C))->a44 = ((T4)(geint32(261)));
						T21f208(C, (T4)(geint32(1)));
						if (((T21*)(C))->a9) {
							if ((((T21*)(C))->a10)->id==25) {
								T25f28(((T21*)(C))->a10);
							} else {
								T28f11(((T21*)(C))->a10);
							}
						}
					} else {
						((T21*)(C))->a44 = ((T4)(geint32(262)));
						T21f208(C, (T4)(geint32(1)));
						if (((T21*)(C))->a9) {
							if ((((T21*)(C))->a10)->id==25) {
								T25f28(((T21*)(C))->a10);
							} else {
								T28f11(((T21*)(C))->a10);
							}
						}
					}
				} else {
					T21f209(C);
					T21f208(C, (T4)(geint32(2)));
				}
			} else {
				t1 = (T4f6(&a1, (T4)(geint32(11))));
				if (t1) {
					t1 = ((a1)==((T4)(geint32(10))));
					if (t1) {
						T21f209(C);
						((T21*)(C))->a14 = ((T4)((((T21*)(C))->a14)+((T4)(geint32(1)))));
					} else {
						T21f209(C);
						((T21*)(C))->a14 = ((T4)((((T21*)(C))->a14)+((T4)(geint32(1)))));
					}
				} else {
					T21f209(C);
				}
			}
		}
	} else {
		t1 = (T4f6(&a1, (T4)(geint32(18))));
		if (t1) {
			t1 = (T4f6(&a1, (T4)(geint32(15))));
			if (t1) {
				t1 = (T4f6(&a1, (T4)(geint32(14))));
				if (t1) {
					t1 = ((a1)==((T4)(geint32(13))));
					if (t1) {
						T21f209(C);
						((T21*)(C))->a14 = ((T4)((((T21*)(C))->a14)+((T4)(geint32(1)))));
						T21f208(C, (T4)(geint32(0)));
					} else {
						T21f209(C);
						T21f208(C, (T4)(geint32(0)));
					}
				} else {
				}
			} else {
				t1 = (T4f6(&a1, (T4)(geint32(17))));
				if (t1) {
					t1 = ((a1)==((T4)(geint32(16))));
					if (t1) {
						((T21*)(C))->a44 = ((T4)(geint32(268)));
						t2 = (T21f147(C));
						t2 = ((T4)((t2)-((T4)(geint32(1)))));
						((T21*)(C))->a129 = (T21f148(C, (T4)(geint32(2)), t2));
					} else {
						((T21*)(C))->a44 = ((T4)(geint32(267)));
						((T21*)(C))->a129 = (T21f150(C));
					}
				} else {
					((T21*)(C))->a44 = ((T4)(geint32(270)));
				}
			}
		} else {
			t1 = (T4f6(&a1, (T4)(geint32(21))));
			if (t1) {
				t1 = (T4f6(&a1, (T4)(geint32(20))));
				if (t1) {
					t1 = ((a1)==((T4)(geint32(19))));
					if (t1) {
						((T21*)(C))->a44 = ((T4)(geint32(269)));
					} else {
						((T21*)(C))->a44 = ((T4)(geint32(266)));
						((T21*)(C))->a14 = ((T4)((((T21*)(C))->a14)+((T4)(geint32(1)))));
						T21f208(C, (T4)(geint32(0)));
					}
				} else {
					t3 = (T21f154(C, (T4)(geint32(1))));
					((T21*)(C))->a44 = ((T4)(t3));
				}
			} else {
				t1 = ((a1)==((T4)(geint32(22))));
				if (t1) {
					t3 = (T21f154(C, (T4)(geint32(1))));
					((T21*)(C))->a44 = ((T4)(t3));
				} else {
					((T21*)(C))->a44 = ((T4)(geint32(-1)));
					T21f197(C, gems("scanner jammed", 14));
				}
			}
		}
	}
	T21f210(C);
}

/* GEPP_PARSER.yy_set_beginning_of_line */
void T21f210(T0* C)
{
	T2 t1;
	T4 t2;
	T1 t3;
	t1 = (T4f1(&(((T21*)(C))->a19), ((T21*)(C))->a73));
	if (t1) {
		t1 = ((((T21*)(C))->a93)!=(EIF_VOID));
		if (t1) {
			t2 = ((T4)((((T21*)(C))->a19)-((T4)(geint32(1)))));
			t3 = (((T15*)(((T21*)(C))->a93))->a2[t2]);
			t1 = ((t3)==((T1)('\n')));
			if ((((T21*)(C))->a18)->id==39) {
				T39f20(((T21*)(C))->a18, t1);
			} else {
				T40f16(((T21*)(C))->a18, t1);
			}
		} else {
			t2 = ((T4)((((T21*)(C))->a19)-((T4)(geint32(1)))));
			t3 = (T79f1(((T21*)(C))->a94, t2));
			t1 = ((t3)==((T1)('\n')));
			if ((((T21*)(C))->a18)->id==39) {
				T39f20(((T21*)(C))->a18, t1);
			} else {
				T40f16(((T21*)(C))->a18, t1);
			}
		}
	}
}

/* YY_BUFFER.set_beginning_of_line */
void T40f16(T0* C, T2 a1)
{
	((T40*)(C))->a6 = (a1);
}

/* YY_FILE_BUFFER.set_beginning_of_line */
void T39f20(T0* C, T2 a1)
{
	((T39*)(C))->a6 = (a1);
}

/* GEPP_PARSER.text_item */
T1 T21f154(T0* C, T4 a1)
{
	T1 R = 0;
	T2 t1;
	T4 t2;
	t1 = ((((T21*)(C))->a93)!=(EIF_VOID));
	if (t1) {
		t2 = ((T4)((((T21*)(C))->a73)+(a1)));
		t2 = ((T4)((t2)-((T4)(geint32(1)))));
		R = (((T15*)(((T21*)(C))->a93))->a2[t2]);
	} else {
		t2 = ((T4)((((T21*)(C))->a73)+(a1)));
		t2 = ((T4)((t2)-((T4)(geint32(1)))));
		R = (T79f1(((T21*)(C))->a94, t2));
	}
	return R;
}

/* GEPP_PARSER.text */
T0* T21f150(T0* C)
{
	T0* R = 0;
	T2 t1;
	T4 t2;
	t1 = ((T2)((((T21*)(C))->a73)<(((T21*)(C))->a19)));
	if (t1) {
		t2 = ((T4)((((T21*)(C))->a19)-((T4)(geint32(1)))));
		R = (T79f2(((T21*)(C))->a94, ((T21*)(C))->a73, t2));
	} else {
		R = T16c25((T4)(geint32(0)));
	}
	return R;
}

/* KL_CHARACTER_BUFFER.substring */
T0* T79f2(T0* C, T4 a1, T4 a2)
{
	T0* R = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	t1 = ((T2)((a2)<(a1)));
	if (t1) {
		R = T16c25((T4)(geint32(0)));
	} else {
		t1 = ((((T79*)(C))->a3)!=(EIF_VOID));
		if (t1) {
			t2 = ((T4)((a1)+((T4)(geint32(1)))));
			t3 = ((T4)((a2)+((T4)(geint32(1)))));
			R = (T16f6(((T79*)(C))->a6, t2, t3));
		} else {
			R = (T16f6(((T79*)(C))->a6, a1, a2));
		}
	}
	return R;
}

/* GEPP_PARSER.text_substring */
T0* T21f148(T0* C, T4 a1, T4 a2)
{
	T0* R = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	t1 = ((T2)((a2)<(a1)));
	if (t1) {
		R = T16c25((T4)(geint32(0)));
	} else {
		t2 = ((T4)((((T21*)(C))->a73)+(a1)));
		t2 = ((T4)((t2)-((T4)(geint32(1)))));
		t3 = ((T4)((((T21*)(C))->a73)+(a2)));
		t3 = ((T4)((t3)-((T4)(geint32(1)))));
		R = (T79f2(((T21*)(C))->a94, t2, t3));
	}
	return R;
}

/* GEPP_PARSER.text_count */
T4 T21f147(T0* C)
{
	T4 R = 0;
	R = ((T4)((((T21*)(C))->a19)-(((T21*)(C))->a73)));
	return R;
}

/* GEPP_PARSER.echo */
void T21f209(T0* C)
{
	T2 t1;
	T0* t2;
	t1 = ((T2)(!(((T21*)(C))->a8)));
	if (t1) {
		t2 = (T21f150(C));
		T21f180(C, t2);
	}
}

/* GEPP_PARSER.set_start_condition */
void T21f208(T0* C, T4 a1)
{
	T4 t1;
	t1 = (T4)(geint32(2));
	t1 = ((T4)((t1)*(a1)));
	((T21*)(C))->a88 = ((T4)((t1)+((T4)(geint32(1)))));
}

/* GEPP_PARSER.yy_execute_eof_action */
void T21f199(T0* C, T4 a1)
{
	T21f207(C);
}

/* GEPP_PARSER.terminate */
void T21f207(T0* C)
{
	((T21*)(C))->a44 = ((T4)(geint32(0)));
}

/* GEPP_PARSER.wrap */
T2 T21f118(T0* C)
{
	T2 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	t1 = (T38f3(((T21*)(C))->a6));
	t1 = ((T2)(!(t1)));
	if (t1) {
		if ((((T21*)(C))->a18)==EIF_VOID) {
			l1 = EIF_VOID;
		} else {
			switch ((((T21*)(C))->a18)->id) {
			case 39:
				l1 = ((T21*)(C))->a18;
				break;
			default:
				l1 = EIF_VOID;
			}
		}
		t2 = (T38f4(((T21*)(C))->a6));
		T21f178(C, t2);
		T38f10(((T21*)(C))->a6);
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			l2 = (((T39*)(l1))->a9);
			t1 = ((((l2)->id==24)?T24f25(l2):T29f8(l2)));
			if (t1) {
				if ((l2)->id==24) {
					T24f38(l2);
				} else {
					T29f23(l2);
				}
			}
		}
		T21f208(C, (T4)(geint32(0)));
	} else {
		R = (EIF_TRUE);
	}
	return R;
}

/* KL_STDIN_FILE.close */
void T29f23(T0* C)
{
}

/* KL_STDIN_FILE.is_closable */
T2 T29f8(T0* C)
{
	T2 R = 0;
	R = (EIF_FALSE);
	return R;
}

/* KL_TEXT_INPUT_FILE.is_closable */
T2 T24f25(T0* C)
{
	T2 R = 0;
	R = (T24f1(C));
	return R;
}

/* DS_ARRAYED_STACK [YY_BUFFER].remove */
void T38f10(T0* C)
{
	T0* l1 = 0;
	((T67*)(((T38*)(C))->a6))->a2[((T38*)(C))->a2] = (l1);
	((T38*)(C))->a2 = ((T4)((((T38*)(C))->a2)-((T4)(geint32(1)))));
}

/* DS_ARRAYED_STACK [YY_BUFFER].item */
T0* T38f4(T0* C)
{
	T0* R = 0;
	R = (((T67*)(((T38*)(C))->a6))->a2[((T38*)(C))->a2]);
	return R;
}

/* DS_ARRAYED_STACK [YY_BUFFER].is_empty */
T2 T38f3(T0* C)
{
	T2 R = 0;
	R = ((((T38*)(C))->a2)==((T4)(geint32(0))));
	return R;
}

/* GEPP_PARSER.yy_refill_input_buffer */
void T21f198(T0* C)
{
	T4 l1 = 0;
	T0* t1;
	T4 t2;
	if ((((T21*)(C))->a18)->id==39) {
		T39f17(((T21*)(C))->a18, ((T21*)(C))->a73);
	} else {
		T40f13(((T21*)(C))->a18, ((T21*)(C))->a73);
	}
	if ((((T21*)(C))->a18)->id==39) {
		T39f19(((T21*)(C))->a18);
	} else {
		T40f15(((T21*)(C))->a18);
	}
	t1 = ((((((T21*)(C))->a18)->id==39)?((T39*)(((T21*)(C))->a18))->a1:((T40*)(((T21*)(C))->a18))->a1));
	T21f196(C, t1);
	l1 = ((((((T21*)(C))->a18)->id==39)?((T39*)(((T21*)(C))->a18))->a2:((T40*)(((T21*)(C))->a18))->a2));
	t2 = ((T4)((((T21*)(C))->a19)-(((T21*)(C))->a73)));
	((T21*)(C))->a19 = ((T4)((t2)+(l1)));
	((T21*)(C))->a73 = (l1);
}

/* GEPP_PARSER.yy_set_content */
void T21f196(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	((T21*)(C))->a94 = (a1);
	((T21*)(C))->a93 = (((T79*)(a1))->a3);
	if (EIF_FALSE) {
		t1 = (T79f4(a1));
		l1 = ((T4)((t1)+((T4)(geint32(1)))));
		t1 = (((T41*)(((T21*)(C))->a90))->a1);
		t2 = ((T2)((t1)<(l1)));
		if (t2) {
			t3 = (T21f16(C));
			((T21*)(C))->a90 = (T42f2(t3, ((T21*)(C))->a90, l1));
		}
	}
}

/* KL_CHARACTER_BUFFER.count */
T4 T79f4(T0* C)
{
	T4 R = 0;
	T2 t1;
	T4 t2;
	t1 = ((((T79*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((T16*)(((T79*)(C))->a6))->a2);
		R = ((T4)((t2)-((T4)(geint32(1)))));
	} else {
		R = (((T16*)(((T79*)(C))->a6))->a2);
	}
	return R;
}

/* YY_BUFFER.fill */
void T40f15(T0* C)
{
	((T40*)(C))->a8 = (EIF_FALSE);
}

/* YY_FILE_BUFFER.fill */
void T39f19(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T1 t2;
	T4 t3;
	if (((T39*)(C))->a8) {
		t1 = ((T2)(!(((T39*)(C))->a11)));
	} else {
		t1 = EIF_FALSE;
	}
	if (t1) {
		T39f22(C);
		l3 = (((T39*)(C))->a1);
		l1 = ((T4)((((T39*)(C))->a12)-(((T39*)(C))->a7)));
		if (((T39*)(C))->a13) {
			if ((((T39*)(C))->a9)->id==24) {
				T24f44(((T39*)(C))->a9);
			} else {
				T29f24(((T39*)(C))->a9);
			}
			t1 = ((((((T39*)(C))->a9)->id==24)?T24f24(((T39*)(C))->a9):((T29*)(((T39*)(C))->a9))->a1));
			t1 = ((T2)(!(t1)));
			if (t1) {
				((T39*)(C))->a7 = ((T4)((((T39*)(C))->a7)+((T4)(geint32(1)))));
				t2 = ((((((T39*)(C))->a9)->id==24)?((T24*)(((T39*)(C))->a9))->a26:((T29*)(((T39*)(C))->a9))->a9));
				T79f9(l3, t2, ((T39*)(C))->a7);
				((T39*)(C))->a8 = (EIF_TRUE);
			} else {
				((T39*)(C))->a8 = (EIF_FALSE);
				((T39*)(C))->a11 = (EIF_TRUE);
			}
		} else {
			t3 = ((T4)((((T39*)(C))->a7)+((T4)(geint32(1)))));
			l2 = (T79f5(l3, ((T39*)(C))->a9, t3, l1));
			t1 = ((T2)((l2)<(l1)));
			if (t1) {
				((T39*)(C))->a11 = ((((((T39*)(C))->a9)->id==24)?T24f24(((T39*)(C))->a9):((T29*)(((T39*)(C))->a9))->a1));
			}
			t1 = (T4f1(&l2, (T4)(geint32(0))));
			if (t1) {
				((T39*)(C))->a8 = (EIF_TRUE);
			} else {
				((T39*)(C))->a8 = (EIF_FALSE);
			}
			((T39*)(C))->a7 = ((T4)((((T39*)(C))->a7)+(l2)));
		}
		t3 = ((T4)((((T39*)(C))->a7)+((T4)(geint32(1)))));
		T79f9(l3, (T1)('\000'), t3);
		t3 = ((T4)((((T39*)(C))->a7)+((T4)(geint32(2)))));
		T79f9(l3, (T1)('\000'), t3);
	} else {
		((T39*)(C))->a8 = (EIF_FALSE);
	}
}

/* KL_CHARACTER_BUFFER.fill_from_stream */
T4 T79f5(T0* C, T0* a1, T4 a2, T4 a3)
{
	T4 R = 0;
	T2 t1;
	T4 t2;
	t1 = ((((T79*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = ((T4)((a2)+((T4)(geint32(1)))));
		R = ((((a1)->id==24)?T24f30(a1, ((T79*)(C))->a6, t2, a3):T29f14(a1, ((T79*)(C))->a6, t2, a3)));
	} else {
		R = ((((a1)->id==24)?T24f30(a1, ((T79*)(C))->a6, a2, a3):T29f14(a1, ((T79*)(C))->a6, a2, a3)));
	}
	return R;
}

/* KL_STDIN_FILE.read_to_string */
T4 T29f14(T0* C, T0* a1, T4 a2, T4 a3)
{
	T4 R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T0* l5 = 0;
	T2 t1;
	T1 t2;
	T0* t3;
	T4 t4;
	l2 = (a2);
	t1 = ((l1)==(a3));
	if (!(t1)) {
		t1 = ((((T29*)(C))->a10)==(EIF_VOID));
	}
	while (!(t1)) {
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = ((T1)gevoid(((T29*)(C))->a10));
		T16f39(a1, t2, l2);
		((T29*)(C))->a10 = ((T0*)gevoid(((T29*)(C))->a10));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t1 = ((l1)==(a3));
		if (!(t1)) {
			t1 = ((((T29*)(C))->a10)==(EIF_VOID));
		}
	}
	t1 = ((T2)((l1)<(a3)));
	if (t1) {
		t1 = (T29f11(C));
		t1 = ((T2)(!(t1)));
		if (t1) {
			t3 = (T29f15(C));
			t1 = (T75f1(t3, a1, ge389ov3237));
			if (t1) {
				t4 = ((T4)((a3)-(l1)));
				t4 = (T29f17(C, a1, l2, t4));
				R = ((T4)((l1)+(t4)));
			} else {
				l4 = ((T4)((a3)-(l1)));
				l5 = T16c25(l4);
				T16f26(l5, l4);
				l4 = (T29f17(C, l5, (T4)(geint32(1)), l4));
				l3 = ((T4)(geint32(1)));
				t1 = (T4f1(&l3, l4));
				while (!(t1)) {
					t2 = (T16f5(l5, l3));
					T16f39(a1, t2, l2);
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
					l3 = ((T4)((l3)+((T4)(geint32(1)))));
					t1 = (T4f1(&l3, l4));
				}
				R = ((T4)((l1)+(l4)));
			}
		} else {
			R = (l1);
		}
		((T29*)(C))->a1 = (T29f11(C));
	} else {
		R = (l1);
	}
	return R;
}

/* KL_STDIN_FILE.old_read_to_string */
T4 T29f17(T0* C, T0* a1, T4 a2, T4 a3)
{
	T4 R = 0;
	T0* t1;
	T4 t2;
	T14 t3;
	t1 = (((T16*)(a1))->a1);
	t2 = ((T4)((a2)-((T4)(geint32(1)))));
	t3 = (T15f5(t1, t2));
	R = (T29f18(C, ((T29*)(C))->a2, t3, a3));
	return R;
}

/* KL_STDIN_FILE.file_gss */
T4 T29f18(T0* C, T14 a1, T14 a2, T4 a3)
{
	T4 R = 0;
	R = (T4)( EIF_INTEGER )file_gss((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
	return R;
}

/* SPECIAL [CHARACTER].item_address */
T14 T15f5(T0* C, T4 a1)
{
	T14 R = 0;
	T80 t1;
	T4 t2;
	t1.id = 80;
	t1.a1 = (T14)(((T15*)(C))->a2);
	R = (T80f2(&t1));
	t2 = (sizeof(T1));
	t2 = ((T4)((a1)*(t2)));
	R = ((T14)(((char*)(R))+(t2)));
	return R;
}

/* KL_STDIN_FILE.any_ */
T0* T29f15(T0* C)
{
	T0* R = 0;
	if (ge254os1802) {
		return ge254ov1802;
	} else {
		ge254os1802 = '\1';
	}
	R = T75c2();
	ge254ov1802 = R;
	return R;
}

/* KL_STDIN_FILE.old_end_of_file */
T2 T29f11(T0* C)
{
	T2 R = 0;
	R = (T29f13(C, ((T29*)(C))->a2));
	return R;
}

/* KL_STDIN_FILE.console_eof */
T2 T29f13(T0* C, T14 a1)
{
	T2 R = 0;
	R = (T2)( EIF_BOOLEAN )console_eof((FILE *)a1);
	return R;
}

/* STRING.put */
void T16f39(T0* C, T1 a1, T4 a2)
{
	T4 t1;
	t1 = ((T4)((a2)-((T4)(geint32(1)))));
	((T15*)(((T16*)(C))->a1))->a2[t1] = (a1);
	((T16*)(C))->a9 = ((T4)(geint32(0)));
}

/* KL_TEXT_INPUT_FILE.read_to_string */
T4 T24f30(T0* C, T0* a1, T4 a2, T4 a3)
{
	T4 R = 0;
	T4 l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T2 t1;
	T1 t2;
	T0* t3;
	T4 t4;
	T0* t5;
	l1 = (a2);
	t1 = ((l5)==(a3));
	if (!(t1)) {
		t1 = ((((T24*)(C))->a11)==(EIF_VOID));
	}
	while (!(t1)) {
		l5 = ((T4)((l5)+((T4)(geint32(1)))));
		t2 = ((T1)gevoid(((T24*)(C))->a11));
		T16f39(a1, t2, l1);
		((T24*)(C))->a11 = ((T0*)gevoid(((T24*)(C))->a11));
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l5)==(a3));
		if (!(t1)) {
			t1 = ((((T24*)(C))->a11)==(EIF_VOID));
		}
	}
	t1 = ((T2)((l5)<(a3)));
	if (t1) {
		t1 = (T24f27(C));
		t1 = ((T2)(!(t1)));
		if (t1) {
			t3 = (T24f31(C));
			t1 = (T75f1(t3, a1, ge376ov1922));
			if (t1) {
				t4 = ((T4)((a3)-(l5)));
				t4 = (T24f33(C, a1, l1, t4));
				l5 = ((T4)((l5)+(t4)));
			} else {
				t3 = (T24f31(C));
				t5 = (T24f34(C));
				t1 = (T75f1(t3, a1, t5));
				if (t1) {
					t4 = ((T4)((a3)-(l5)));
					t4 = (T24f33(C, a1, l1, t4));
					l5 = ((T4)((l5)+(t4)));
				} else {
					l4 = ((T4)((a3)-(l5)));
					l2 = T16c25(l4);
					T16f26(l2, l4);
					l4 = (T24f33(C, l2, (T4)(geint32(1)), l4));
					l3 = ((T4)(geint32(1)));
					t1 = (T4f1(&l3, l4));
					while (!(t1)) {
						t2 = (T16f5(l2, l3));
						T16f39(a1, t2, l1);
						l1 = ((T4)((l1)+((T4)(geint32(1)))));
						l3 = ((T4)((l3)+((T4)(geint32(1)))));
						t1 = (T4f1(&l3, l4));
					}
					l5 = ((T4)((l5)+(l4)));
				}
			}
		}
		((T24*)(C))->a12 = (T24f27(C));
	}
	R = (l5);
	return R;
}

/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
unsigned char ge376os1923 = '\0';
T0* ge376ov1923;
T0* T24f34(T0* C)
{
	T0* R = 0;
	if (ge376os1923) {
		return ge376ov1923;
	} else {
		ge376os1923 = '\1';
	}
	R = T79c8((T4)(geint32(0)));
	ge376ov1923 = R;
	return R;
}

/* KL_CHARACTER_BUFFER.make */
T0* T79c8(T4 a1)
{
	T0* t1;
	T2 t2;
	T4 t3;
	T0* C;
	C = (T0*)gealloc(sizeof(T79));
	((T79*)(C))->id = 79;
	t1 = (T79f7(C));
	t2 = (T63f6(t1));
	t2 = ((T2)(!(t2)));
	if (t2) {
		t3 = ((T4)((a1)+((T4)(geint32(1)))));
		((T79*)(C))->a6 = T16c25(t3);
		t3 = ((T4)((a1)+((T4)(geint32(1)))));
		T16f26(((T79*)(C))->a6, t3);
		((T79*)(C))->a3 = (((T16*)(((T79*)(C))->a6))->a1);
	} else {
		((T79*)(C))->a6 = T16c25(a1);
		T16f26(((T79*)(C))->a6, a1);
	}
	return C;
}

/* KL_OPERATING_SYSTEM.is_dotnet */
unsigned char ge382os2944 = '\0';
T2 ge382ov2944;
T2 T63f6(T0* C)
{
	T2 R = 0;
	T0* l1 = 0;
	if (ge382os2944) {
		return ge382ov2944;
	} else {
		ge382os2944 = '\1';
	}
	l1 = T90c2();
	R = (EIF_FALSE);
	ge382ov2944 = R;
	return R;
}

/* PLATFORM.default_create */
T0* T90c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T90));
	((T90*)(C))->id = 90;
	return C;
}

/* KL_CHARACTER_BUFFER.operating_system */
unsigned char ge312os1961 = '\0';
T0* ge312ov1961;
T0* T79f7(T0* C)
{
	T0* R = 0;
	if (ge312os1961) {
		return ge312ov1961;
	} else {
		ge312os1961 = '\1';
	}
	R = T63c7();
	ge312ov1961 = R;
	return R;
}

/* KL_OPERATING_SYSTEM.default_create */
T0* T63c7()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T63));
	((T63*)(C))->id = 63;
	return C;
}

/* KL_TEXT_INPUT_FILE.old_read_to_string */
T4 T24f33(T0* C, T0* a1, T4 a2, T4 a3)
{
	T4 R = 0;
	T0* t1;
	T4 t2;
	T14 t3;
	t1 = (((T16*)(a1))->a1);
	t2 = ((T4)((a2)-((T4)(geint32(1)))));
	t3 = (T15f5(t1, t2));
	R = (T24f35(C, ((T24*)(C))->a17, t3, a3));
	return R;
}

/* KL_TEXT_INPUT_FILE.file_gss */
T4 T24f35(T0* C, T14 a1, T14 a2, T4 a3)
{
	T4 R = 0;
	R = (T4)( EIF_INTEGER )file_gss((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
	return R;
}

/* KL_TEXT_INPUT_FILE.any_ */
T0* T24f31(T0* C)
{
	T0* R = 0;
	if (ge254os1802) {
		return ge254ov1802;
	} else {
		ge254os1802 = '\1';
	}
	R = T75c2();
	ge254ov1802 = R;
	return R;
}

/* KL_TEXT_INPUT_FILE.old_end_of_file */
T2 T24f27(T0* C)
{
	T2 R = 0;
	R = (T24f29(C, ((T24*)(C))->a17));
	return R;
}

/* KL_TEXT_INPUT_FILE.file_feof */
T2 T24f29(T0* C, T14 a1)
{
	T2 R = 0;
	R = (T2)( EIF_BOOLEAN )file_feof((FILE *)a1);
	return R;
}

/* KL_CHARACTER_BUFFER.put */
void T79f9(T0* C, T1 a1, T4 a2)
{
	T2 t1;
	t1 = ((((T79*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		((T15*)(((T79*)(C))->a3))->a2[a2] = (a1);
	} else {
		T16f39(((T79*)(C))->a6, a1, a2);
	}
}

/* KL_TEXT_INPUT_FILE.end_of_input */
T2 T24f24(T0* C)
{
	T2 R = 0;
	R = (((T24*)(C))->a12);
	return R;
}

/* KL_STDIN_FILE.read_character */
void T29f24(T0* C)
{
	T2 t1;
	t1 = ((((T29*)(C))->a10)!=(EIF_VOID));
	if (t1) {
		((T29*)(C))->a9 = ((T1)gevoid(((T29*)(C))->a10));
		((T29*)(C))->a10 = ((T0*)gevoid(((T29*)(C))->a10));
	} else {
		t1 = (T29f11(C));
		if (t1) {
			((T29*)(C))->a1 = (EIF_TRUE);
		} else {
			T29f25(C);
			((T29*)(C))->a1 = (T29f11(C));
		}
	}
}

/* KL_STDIN_FILE.old_read_character */
void T29f25(T0* C)
{
	((T29*)(C))->a9 = (T29f12(C, ((T29*)(C))->a2));
}

/* KL_STDIN_FILE.console_readchar */
T1 T29f12(T0* C, T14 a1)
{
	T1 R = 0;
	R = (T1)( EIF_CHARACTER )console_readchar((FILE *)a1);
	return R;
}

/* KL_TEXT_INPUT_FILE.read_character */
void T24f44(T0* C)
{
	T2 t1;
	t1 = ((((T24*)(C))->a11)!=(EIF_VOID));
	if (t1) {
		((T24*)(C))->a26 = ((T1)gevoid(((T24*)(C))->a11));
		((T24*)(C))->a11 = ((T0*)gevoid(((T24*)(C))->a11));
	} else {
		t1 = (T24f27(C));
		if (t1) {
			((T24*)(C))->a12 = (EIF_TRUE);
		} else {
			T24f45(C);
			((T24*)(C))->a12 = (T24f27(C));
		}
	}
}

/* KL_TEXT_INPUT_FILE.old_read_character */
void T24f45(T0* C)
{
	((T24*)(C))->a26 = (T24f28(C, ((T24*)(C))->a17));
}

/* KL_TEXT_INPUT_FILE.file_gc */
T1 T24f28(T0* C, T14 a1)
{
	T1 R = 0;
	R = (T1)( EIF_CHARACTER )file_gc((FILE *)a1);
	return R;
}

/* YY_FILE_BUFFER.compact_left */
void T39f22(T0* C)
{
	T4 l1 = 0;
	T4 t1;
	T2 t2;
	t1 = ((T4)((((T39*)(C))->a7)-(((T39*)(C))->a2)));
	l1 = ((T4)((t1)+((T4)(geint32(1)))));
	t2 = (T4f2(&l1, ((T39*)(C))->a12));
	if (t2) {
		T39f24(C);
	}
	t2 = ((((T39*)(C))->a2)!=((T4)(geint32(1))));
	if (t2) {
		t1 = ((T4)((l1)+((T4)(geint32(2)))));
		T79f10(((T39*)(C))->a1, ((T39*)(C))->a2, (T4)(geint32(1)), t1);
		((T39*)(C))->a2 = ((T4)(geint32(1)));
		((T39*)(C))->a7 = (l1);
	}
}

/* KL_CHARACTER_BUFFER.move_left */
void T79f10(T0* C, T4 a1, T4 a2, T4 a3)
{
	T2 t1;
	T4 t2;
	T4 t3;
	T4 t4;
	t1 = (T4f1(&a3, (T4)(geint32(0))));
	if (t1) {
		t1 = ((((T79*)(C))->a3)!=(EIF_VOID));
		if (t1) {
			t2 = ((T4)((a1)+((T4)(geint32(1)))));
			t3 = ((T4)((a1)+(a3)));
			t4 = ((T4)((a2)+((T4)(geint32(1)))));
			T16f40(((T79*)(C))->a6, ((T79*)(C))->a6, t2, t3, t4);
		} else {
			t2 = ((T4)((a1)+(a3)));
			t2 = ((T4)((t2)-((T4)(geint32(1)))));
			T16f40(((T79*)(C))->a6, ((T79*)(C))->a6, a1, t2, a2);
		}
	}
}

/* STRING.subcopy */
void T16f40(T0* C, T0* a1, T4 a2, T4 a3, T4 a4)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	T4 t4;
	l1 = (((T16*)(a1))->a1);
	l2 = (((T16*)(C))->a1);
	t1 = (T4f2(&a3, a2));
	if (t1) {
		t1 = ((l2)!=(l1));
		if (t1) {
			t2 = ((T4)((a2)-((T4)(geint32(1)))));
			t3 = ((T4)((a4)-((T4)(geint32(1)))));
			t4 = ((T4)((a3)-(a2)));
			t4 = ((T4)((t4)+((T4)(geint32(1)))));
			T15f8(l2, l1, t2, t3, t4);
		} else {
			t2 = ((T4)((a2)-((T4)(geint32(1)))));
			t3 = ((T4)((a4)-((T4)(geint32(1)))));
			t4 = ((T4)((a3)-(a2)));
			t4 = ((T4)((t4)+((T4)(geint32(1)))));
			T15f12(l2, t2, t3, t4);
		}
		((T16*)(C))->a9 = ((T4)(geint32(0)));
	}
}

/* YY_FILE_BUFFER.resize */
void T39f24(T0* C)
{
	T2 t1;
	T4 t2;
	T4 t3;
	t1 = ((((T39*)(C))->a12)==((T4)(geint32(0))));
	if (t1) {
		((T39*)(C))->a12 = (T39f10(C));
	} else {
		((T39*)(C))->a12 = ((T4)((((T39*)(C))->a12)*((T4)(geint32(2)))));
	}
	t2 = ((T4)((((T39*)(C))->a12)+((T4)(geint32(2)))));
	t3 = (T79f4(((T39*)(C))->a1));
	t1 = (T4f1(&t2, t3));
	if (t1) {
		t2 = ((T4)((((T39*)(C))->a12)+((T4)(geint32(2)))));
		T79f11(((T39*)(C))->a1, t2);
	}
}

/* KL_CHARACTER_BUFFER.resize */
void T79f11(T0* C, T4 a1)
{
	T2 t1;
	T4 t2;
	t1 = ((((T79*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = ((T4)((a1)+((T4)(geint32(1)))));
		T16f34(((T79*)(C))->a6, t2);
		t2 = ((T4)((a1)+((T4)(geint32(1)))));
		T16f26(((T79*)(C))->a6, t2);
		((T79*)(C))->a3 = (((T16*)(((T79*)(C))->a6))->a1);
	} else {
		T16f34(((T79*)(C))->a6, a1);
		T16f26(((T79*)(C))->a6, a1);
	}
}

/* YY_FILE_BUFFER.default_capacity */
unsigned char ge136os3693 = '\0';
T4 ge136ov3693;
T4 T39f10(T0* C)
{
	T4 R = 0;
	if (ge136os3693) {
		return ge136ov3693;
	} else {
		ge136os3693 = '\1';
	}
	R = ((T4)(geint32(16384)));
	ge136ov3693 = R;
	return R;
}

/* YY_BUFFER.set_index */
void T40f13(T0* C, T4 a1)
{
	((T40*)(C))->a2 = (a1);
}

/* YY_FILE_BUFFER.set_index */
void T39f17(T0* C, T4 a1)
{
	((T39*)(C))->a2 = (a1);
}

/* GEPP_PARSER.yy_null_trans_state */
T4 T21f117(T0* C, T4 a1)
{
	T4 R = 0;
	T4 l1 = 0;
	T2 l2 = 0;
	T2 t1;
	T4 t2;
	t1 = EIF_FALSE;
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = (((T41*)(((T21*)(C))->a95))->a2[a1]);
		t1 = ((t2)!=((T4)(geint32(0))));
		if (t1) {
			((T21*)(C))->a96 = (a1);
			((T21*)(C))->a97 = (((T21*)(C))->a19);
		}
	}
	R = (a1);
	l1 = ((T4)(geint32(1)));
	t2 = (((T41*)(((T21*)(C))->a99))->a2[R]);
	t2 = ((T4)((t2)+(l1)));
	t2 = (((T41*)(((T21*)(C))->a98))->a2[t2]);
	t1 = ((t2)==(R));
	while (!(t1)) {
		R = (((T41*)(((T21*)(C))->a100))->a2[R]);
		t1 = ((((T21*)(C))->a101)!=(EIF_VOID));
		if (t1) {
			t1 = (T4f2(&R, (T4)(geint32(67))));
		}
		if (t1) {
			l1 = (((T41*)(((T21*)(C))->a101))->a2[l1]);
		}
		t2 = (((T41*)(((T21*)(C))->a99))->a2[R]);
		t2 = ((T4)((t2)+(l1)));
		t2 = (((T41*)(((T21*)(C))->a98))->a2[t2]);
		t1 = ((t2)==(R));
	}
	t2 = (((T41*)(((T21*)(C))->a99))->a2[R]);
	t2 = ((T4)((t2)+(l1)));
	R = (((T41*)(((T21*)(C))->a103))->a2[t2]);
	if (EIF_FALSE) {
		((T41*)(((T21*)(C))->a90))->a2[((T21*)(C))->a91] = (R);
		((T21*)(C))->a91 = ((T4)((((T21*)(C))->a91)+((T4)(geint32(1)))));
	}
	l2 = ((R)==((T4)(geint32(66))));
	if (l2) {
		R = ((T4)(geint32(0)));
	}
	return R;
}

/* GEPP_PARSER.yy_previous_state */
T4 T21f116(T0* C)
{
	T4 R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T1 t2;
	T4 t3;
	t1 = ((((((T21*)(C))->a18)->id==39)?((T39*)(((T21*)(C))->a18))->a6:((T40*)(((T21*)(C))->a18))->a6));
	if (t1) {
		R = ((T4)((((T21*)(C))->a88)+((T4)(geint32(1)))));
	} else {
		R = (((T21*)(C))->a88);
	}
	if (EIF_FALSE) {
		((T41*)(((T21*)(C))->a90))->a2[(T4)(geint32(0))] = (R);
		((T21*)(C))->a91 = ((T4)(geint32(1)));
	}
	l1 = ((T4)((((T21*)(C))->a73)+(((T21*)(C))->a84)));
	l2 = (((T21*)(C))->a19);
	t1 = (T4f2(&l1, l2));
	while (!(t1)) {
		t1 = ((((T21*)(C))->a93)!=(EIF_VOID));
		if (t1) {
			t2 = (((T15*)(((T21*)(C))->a93))->a2[l1]);
			l3 = ((T4)(t2));
		} else {
			t2 = (T79f1(((T21*)(C))->a94, l1));
			l3 = ((T4)(t2));
		}
		t1 = ((l3)==((T4)(geint32(0))));
		if (t1) {
			l3 = ((T4)(geint32(1)));
		} else {
			t1 = ((((T21*)(C))->a92)!=(EIF_VOID));
			if (t1) {
				l3 = (((T41*)(((T21*)(C))->a92))->a2[l3]);
			}
		}
		t1 = EIF_FALSE;
		t1 = ((T2)(!(t1)));
		if (t1) {
			t3 = (((T41*)(((T21*)(C))->a95))->a2[R]);
			t1 = ((t3)!=((T4)(geint32(0))));
			if (t1) {
				((T21*)(C))->a96 = (R);
				((T21*)(C))->a97 = (l1);
			}
		}
		t3 = (((T41*)(((T21*)(C))->a99))->a2[R]);
		t3 = ((T4)((t3)+(l3)));
		t3 = (((T41*)(((T21*)(C))->a98))->a2[t3]);
		t1 = ((t3)==(R));
		while (!(t1)) {
			R = (((T41*)(((T21*)(C))->a100))->a2[R]);
			t1 = ((((T21*)(C))->a101)!=(EIF_VOID));
			if (t1) {
				t1 = (T4f2(&R, (T4)(geint32(67))));
			}
			if (t1) {
				l3 = (((T41*)(((T21*)(C))->a101))->a2[l3]);
			}
			t3 = (((T41*)(((T21*)(C))->a99))->a2[R]);
			t3 = ((T4)((t3)+(l3)));
			t3 = (((T41*)(((T21*)(C))->a98))->a2[t3]);
			t1 = ((t3)==(R));
		}
		t3 = (((T41*)(((T21*)(C))->a99))->a2[R]);
		t3 = ((T4)((t3)+(l3)));
		R = (((T41*)(((T21*)(C))->a103))->a2[t3]);
		if (EIF_FALSE) {
			((T41*)(((T21*)(C))->a90))->a2[((T21*)(C))->a91] = (R);
			((T21*)(C))->a91 = ((T4)((((T21*)(C))->a91)+((T4)(geint32(1)))));
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f2(&l1, l2));
	}
	return R;
}

/* GEPP_PARSER.fatal_error */
void T21f197(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T21f13(C));
	t1 = (T27f3(t1));
	T36f11(t1, a1);
	t1 = (T21f13(C));
	t1 = (T27f3(t1));
	T36f12(t1, (T1)('\n'));
}

/* KL_STDERR_FILE.put_character */
void T36f12(T0* C, T1 a1)
{
	T36f16(C, a1);
}

/* KL_STDERR_FILE.old_put_character */
void T36f16(T0* C, T1 a1)
{
	T36f20(C, ((T36*)(C))->a2, a1);
}

/* KL_STDERR_FILE.console_pc */
void T36f20(T0* C, T14 a1, T1 a2)
{
	console_pc((FILE *)a1,( EIF_CHARACTER)a2);
}

/* KL_STANDARD_FILES.error */
unsigned char ge294os2935 = '\0';
T0* ge294ov2935;
T0* T27f3(T0* C)
{
	T0* R = 0;
	if (ge294os2935) {
		return ge294ov2935;
	} else {
		ge294os2935 = '\1';
	}
	R = T36c9();
	ge294ov2935 = R;
	return R;
}

/* KL_STDERR_FILE.make */
T0* T36c9()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T36));
	((T36*)(C))->id = 36;
	T36f13(C, gems("stderr", 6));
	return C;
}

/* KL_STDERR_FILE.make_open_stderr */
void T36f13(T0* C, T0* a1)
{
	T36f17(C, a1);
	((T36*)(C))->a2 = (T36f3(C, (T4)(geint32(2))));
	T36f18(C);
}

/* KL_STDERR_FILE.set_write_mode */
void T36f18(T0* C)
{
	((T36*)(C))->a6 = ((T4)(geint32(2)));
}

/* KL_STDERR_FILE.console_def */
T14 T36f3(T0* C, T4 a1)
{
	T14 R = 0;
	R = (T14)console_def(a1);
	return R;
}

/* KL_STDERR_FILE.old_make */
void T36f17(T0* C, T0* a1)
{
	((T36*)(C))->a5 = (a1);
	((T36*)(C))->a6 = ((T4)(geint32(0)));
}

/* GEPP_PARSER.std */
unsigned char ge292os1303 = '\0';
T0* ge292ov1303;
T0* T21f13(T0* C)
{
	T0* R = 0;
	if (ge292os1303) {
		return ge292ov1303;
	} else {
		ge292os1303 = '\1';
	}
	R = T27c4();
	ge292ov1303 = R;
	return R;
}

/* KL_STANDARD_FILES.default_create */
T0* T27c4()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T27));
	((T27*)(C))->id = 27;
	return C;
}

/* KL_CHARACTER_BUFFER.item */
T1 T79f1(T0* C, T4 a1)
{
	T1 R = 0;
	T2 t1;
	t1 = ((((T79*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		R = (((T15*)(((T79*)(C))->a3))->a2[a1]);
	} else {
		R = (T16f5(((T79*)(C))->a6, a1));
	}
	return R;
}

/* KL_SPECIAL_ROUTINES [INTEGER].resize */
T0* T42f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T41*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T41f3(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [INTEGER].resized_area */
T0* T41f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	R = T41c4(a1);
	l2 = (((T41*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T41*)(C))->a2[l1]);
		((T41*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* SPECIAL [INTEGER].make */
T0* T41c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T41)+a1*sizeof(T4));
	((T41*)(C))->a1 = a1;
	((T41*)(C))->id = 41;
	return C;
}

/* GEPP_PARSER.special_integer_ */
T0* T21f16(T0* C)
{
	T0* R = 0;
	if (ge260os1512) {
		return ge260ov1512;
	} else {
		ge260os1512 = '\1';
	}
	R = T42c4();
	ge260ov1512 = R;
	return R;
}

/* GEPP_PARSER.yy_init_value_stacks */
void T21f185(T0* C)
{
	((T21*)(C))->a74 = ((T4)(geint32(-1)));
	((T21*)(C))->a75 = ((T4)(geint32(-1)));
	((T21*)(C))->a76 = ((T4)(geint32(-1)));
}

/* GEPP_PARSER.set_input_buffer */
void T21f178(T0* C, T0* a1)
{
	T2 t1;
	t1 = ((a1)!=(((T21*)(C))->a18));
	if (t1) {
		if ((((T21*)(C))->a18)->id==39) {
			T39f17(((T21*)(C))->a18, ((T21*)(C))->a19);
		} else {
			T40f13(((T21*)(C))->a18, ((T21*)(C))->a19);
		}
		if ((((T21*)(C))->a18)->id==39) {
			T39f18(((T21*)(C))->a18, ((T21*)(C))->a20, ((T21*)(C))->a21, ((T21*)(C))->a22);
		} else {
			T40f14(((T21*)(C))->a18, ((T21*)(C))->a20, ((T21*)(C))->a21, ((T21*)(C))->a22);
		}
		((T21*)(C))->a18 = (a1);
		T21f184(C);
	}
}

/* GEPP_PARSER.yy_load_input_buffer */
void T21f184(T0* C)
{
	T0* t1;
	t1 = ((((((T21*)(C))->a18)->id==39)?((T39*)(((T21*)(C))->a18))->a1:((T40*)(((T21*)(C))->a18))->a1));
	T21f196(C, t1);
	((T21*)(C))->a19 = ((((((T21*)(C))->a18)->id==39)?((T39*)(((T21*)(C))->a18))->a2:((T40*)(((T21*)(C))->a18))->a2));
	((T21*)(C))->a73 = (((T21*)(C))->a19);
	((T21*)(C))->a21 = ((((((T21*)(C))->a18)->id==39)?((T39*)(((T21*)(C))->a18))->a3:((T40*)(((T21*)(C))->a18))->a3));
	((T21*)(C))->a22 = ((((((T21*)(C))->a18)->id==39)?((T39*)(((T21*)(C))->a18))->a4:((T40*)(((T21*)(C))->a18))->a4));
	((T21*)(C))->a20 = ((((((T21*)(C))->a18)->id==39)?((T39*)(((T21*)(C))->a18))->a5:((T40*)(((T21*)(C))->a18))->a5));
}

/* YY_BUFFER.set_position */
void T40f14(T0* C, T4 a1, T4 a2, T4 a3)
{
	((T40*)(C))->a5 = (a1);
	((T40*)(C))->a3 = (a2);
	((T40*)(C))->a4 = (a3);
}

/* YY_FILE_BUFFER.set_position */
void T39f18(T0* C, T4 a1, T4 a2, T4 a3)
{
	((T39*)(C))->a5 = (a1);
	((T39*)(C))->a3 = (a2);
	((T39*)(C))->a4 = (a3);
}

/* GEPP_PARSER.new_file_buffer */
T0* T21f11(T0* C, T0* a1)
{
	T0* R = 0;
	R = T39c16(a1);
	return R;
}

/* YY_FILE_BUFFER.make */
T0* T39c16(T0* a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T39));
	((T39*)(C))->id = 39;
	t1 = (T39f10(C));
	T39f21(C, a1, t1);
	return C;
}

/* YY_FILE_BUFFER.make_with_size */
void T39f21(T0* C, T0* a1, T4 a2)
{
	T4 t1;
	((T39*)(C))->a12 = (a2);
	t1 = ((T4)((a2)+((T4)(geint32(2)))));
	((T39*)(C))->a1 = (T39f15(C, t1));
	T39f23(C, a1);
}

/* YY_FILE_BUFFER.set_file */
void T39f23(T0* C, T0* a1)
{
	((T39*)(C))->a11 = ((((a1)->id==24)?T24f24(a1):((T29*)(a1))->a1));
	T39f25(C);
	((T39*)(C))->a9 = (a1);
}

/* YY_FILE_BUFFER.flush */
void T39f25(T0* C)
{
	T79f9(((T39*)(C))->a1, (T1)('\000'), (T4)(geint32(1)));
	T79f9(((T39*)(C))->a1, (T1)('\000'), (T4)(geint32(2)));
	((T39*)(C))->a7 = ((T4)(geint32(0)));
	((T39*)(C))->a2 = ((T4)(geint32(1)));
	((T39*)(C))->a3 = ((T4)(geint32(1)));
	((T39*)(C))->a4 = ((T4)(geint32(1)));
	((T39*)(C))->a5 = ((T4)(geint32(1)));
	((T39*)(C))->a6 = (EIF_TRUE);
	((T39*)(C))->a8 = (EIF_TRUE);
}

/* YY_FILE_BUFFER.new_default_buffer */
T0* T39f15(T0* C, T4 a1)
{
	T0* R = 0;
	R = T79c8(a1);
	return R;
}

/* KL_STANDARD_FILES.input */
unsigned char ge294os2933 = '\0';
T0* ge294ov2933;
T0* T27f2(T0* C)
{
	T0* R = 0;
	if (ge294os2933) {
		return ge294ov2933;
	} else {
		ge294os2933 = '\1';
	}
	R = T29c19();
	ge294ov2933 = R;
	return R;
}

/* KL_STDIN_FILE.make */
T0* T29c19()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T29));
	((T29*)(C))->id = 29;
	T29f20(C, gems("stdin", 5));
	((T29*)(C))->a1 = (EIF_FALSE);
	return C;
}

/* KL_STDIN_FILE.make_open_stdin */
void T29f20(T0* C, T0* a1)
{
	T29f21(C, a1);
	((T29*)(C))->a2 = (T29f3(C, (T4)(geint32(0))));
	T29f22(C);
}

/* KL_STDIN_FILE.set_read_mode */
void T29f22(T0* C)
{
	((T29*)(C))->a5 = ((T4)(geint32(1)));
}

/* KL_STDIN_FILE.console_def */
T14 T29f3(T0* C, T4 a1)
{
	T14 R = 0;
	R = (T14)console_def(a1);
	return R;
}

/* KL_STDIN_FILE.old_make */
void T29f21(T0* C, T0* a1)
{
	((T29*)(C))->a4 = (a1);
	((T29*)(C))->a5 = ((T4)(geint32(0)));
}

/* KL_STANDARD_FILES.output */
unsigned char ge294os2934 = '\0';
T0* ge294ov2934;
T0* T27f1(T0* C)
{
	T0* R = 0;
	if (ge294os2934) {
		return ge294ov2934;
	} else {
		ge294os2934 = '\1';
	}
	R = T28c9();
	ge294ov2934 = R;
	return R;
}

/* KL_STDOUT_FILE.make */
T0* T28c9()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T28));
	((T28*)(C))->id = 28;
	T28f13(C, gems("stdout", 6));
	return C;
}

/* KL_STDOUT_FILE.make_open_stdout */
void T28f13(T0* C, T0* a1)
{
	T28f15(C, a1);
	((T28*)(C))->a3 = (T28f4(C, (T4)(geint32(1))));
	T28f16(C);
}

/* KL_STDOUT_FILE.set_write_mode */
void T28f16(T0* C)
{
	((T28*)(C))->a6 = ((T4)(geint32(2)));
}

/* KL_STDOUT_FILE.console_def */
T14 T28f4(T0* C, T4 a1)
{
	T14 R = 0;
	R = (T14)console_def(a1);
	return R;
}

/* KL_STDOUT_FILE.old_make */
void T28f15(T0* C, T0* a1)
{
	((T28*)(C))->a5 = (a1);
	((T28*)(C))->a6 = ((T4)(geint32(0)));
}

/* GEPP.std */
T0* T18f7(T0* C)
{
	T0* R = 0;
	if (ge292os1303) {
		return ge292ov1303;
	} else {
		ge292os1303 = '\1';
	}
	R = T27c4();
	ge292ov1303 = R;
	return R;
}

/* KL_EXCEPTIONS.die */
void T23f2(T0* C, T4 a1)
{
	esdie(a1);
}

/* GEPP.exceptions */
unsigned char ge310os1304 = '\0';
T0* ge310ov1304;
T0* T18f6(T0* C)
{
	T0* R = 0;
	if (ge310os1304) {
		return ge310ov1304;
	} else {
		ge310os1304 = '\1';
	}
	R = T23c1();
	ge310ov1304 = R;
	return R;
}

/* KL_EXCEPTIONS.default_create */
T0* T23c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T23));
	((T23*)(C))->id = 23;
	return C;
}

/* GEPP.report_cannot_write_error */
void T18f17(T0* C, T0* a1)
{
	T0* l1 = 0;
	l1 = T34c7(a1);
	T20f8(((T18*)(C))->a2, l1);
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.make */
T0* T34c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T34));
	((T34*)(C))->id = 34;
	((T34*)(C))->a1 = T60c11((T4)(geint32(1)), (T4)(geint32(1)));
	T60f12(((T34*)(C))->a1, a1, (T4)(geint32(1)));
	return C;
}

/* GEPP_PARSER.set_output_file */
void T21f174(T0* C, T0* a1)
{
	((T21*)(C))->a10 = (a1);
}

/* KL_TEXT_OUTPUT_FILE.is_open_write */
T2 T25f1(T0* C)
{
	T2 R = 0;
	R = (T25f3(C));
	return R;
}

/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
T2 T25f3(T0* C)
{
	T2 R = 0;
	T2 t1;
	t1 = ((((T25*)(C))->a5)==((T4)(geint32(2))));
	if (!(t1)) {
		t1 = ((((T25*)(C))->a5)==((T4)(geint32(4))));
	}
	if (!(t1)) {
		t1 = ((((T25*)(C))->a5)==((T4)(geint32(5))));
	}
	if (!(t1)) {
		R = ((((T25*)(C))->a5)==((T4)(geint32(3))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* KL_TEXT_OUTPUT_FILE.recursive_open_write */
void T25f25(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	T25f31(C);
	t1 = (T25f1(C));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = (T25f14(C));
		l2 = ((((t2)->id==64)?T64f1(t2, ((T25*)(C))->a11):T65f1(t2, ((T25*)(C))->a11)));
		t2 = (T25f14(C));
		l1 = ((((t2)->id==64)?T64f2(t2, l2):T65f2(t2, l2)));
		l3 = T58c13(l1);
		t1 = (T58f1(l3));
		t1 = ((T2)(!(t1)));
		if (t1) {
			T58f14(l3);
			t1 = (T58f1(l3));
			if (t1) {
				T25f31(C);
			}
		}
	}
}

/* KL_DIRECTORY.recursive_create_directory */
void T58f14(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	T58f16(C);
	t1 = (T58f1(C));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = (T58f7(C));
		l2 = ((((t2)->id==64)?T64f1(t2, ((T58*)(C))->a2):T65f1(t2, ((T58*)(C))->a2)));
		t2 = (T58f7(C));
		l1 = ((((t2)->id==64)?T64f2(t2, l2):T65f2(t2, l2)));
		t2 = (T58f6(C));
		t1 = (T54f10(t2, l1, l2));
		t1 = ((T2)(!(t1)));
		if (t1) {
			l3 = T58c13(l1);
			t1 = (T58f1(l3));
			t1 = ((T2)(!(t1)));
			if (t1) {
				T58f14(l3);
				t1 = (T58f1(l3));
				if (t1) {
					T58f16(C);
				}
			}
		}
	}
}

/* KL_STRING_ROUTINES.same_string */
T2 T54f10(T0* C, T0* a1, T0* a2)
{
	T2 R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	T0* t4;
	t1 = ((a2)==(a1));
	if (t1) {
		R = (EIF_TRUE);
	} else {
		t2 = (((T16*)(a2))->a2);
		t3 = (((T16*)(a1))->a2);
		t1 = ((t2)==(t3));
		if (t1) {
			l1 = EIF_VOID;
			t1 = ((l1)!=(EIF_VOID));
			if (t1) {
				R = ((T2)gevoid(l1, a2));
			} else {
				l1 = EIF_VOID;
				t1 = ((l1)!=(EIF_VOID));
				if (t1) {
					R = ((T2)gevoid(l1, a1));
				} else {
					t4 = (T54f6(C));
					t1 = (T75f1(t4, a1, ge392ov3909));
					if (t1) {
						t4 = (T54f6(C));
						t1 = (T75f1(t4, a2, ge392ov3909));
					}
					if (t1) {
						R = (T54f11(C, a1, a2));
					} else {
						R = (EIF_TRUE);
						l3 = (((T16*)(a1))->a2);
						l2 = ((T4)(geint32(1)));
						t1 = (T4f1(&l2, l3));
						while (!(t1)) {
							t2 = (T16f22(a1, l2));
							t3 = (T16f22(a2, l2));
							t1 = ((t2)!=(t3));
							if (t1) {
								R = (EIF_FALSE);
								l2 = ((T4)((l3)+((T4)(geint32(1)))));
							} else {
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
							}
							t1 = (T4f1(&l2, l3));
						}
					}
				}
			}
		}
	}
	return R;
}

/* STRING.item_code */
T4 T16f22(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	T1 t2;
	t1 = ((T4)((a1)-((T4)(geint32(1)))));
	t2 = (((T15*)(((T16*)(C))->a1))->a2[t1]);
	R = ((T4)(t2));
	return R;
}

/* KL_STRING_ROUTINES.elks_same_string */
T2 T54f11(T0* C, T0* a1, T0* a2)
{
	T2 R = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	T0* t4;
	t1 = ((a2)==(a1));
	if (t1) {
		R = (EIF_TRUE);
	} else {
		t2 = (((T16*)(a2))->a2);
		t3 = (((T16*)(a1))->a2);
		t1 = ((t2)==(t3));
		if (t1) {
			t4 = (T54f6(C));
			t1 = (T75f1(t4, a2, ge392ov3909));
			if (t1) {
				R = (T16f23(a1, a2));
			} else {
				R = (T16f23(a2, a1));
			}
		}
	}
	return R;
}

/* STRING.same_string */
T2 T16f23(T0* C, T0* a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T4 t2;
	T1 t3;
	T1 t4;
	t1 = ((a1)==(C));
	if (t1) {
		R = (EIF_TRUE);
	} else {
		t2 = (((T16*)(a1))->a2);
		t1 = ((t2)==(((T16*)(C))->a2));
		if (t1) {
			R = (EIF_TRUE);
			l2 = (((T16*)(C))->a2);
			t1 = ((T2)(((T0*)(C))->id==((T0*)(a1))->id));
			if (t1) {
				l3 = (((T16*)(C))->a1);
				l4 = (((T16*)(a1))->a1);
				t1 = ((l1)==(l2));
				while (!(t1)) {
					t3 = (((T15*)(l3))->a2[l1]);
					t4 = (((T15*)(l4))->a2[l1]);
					t1 = ((t3)!=(t4));
					if (t1) {
						R = (EIF_FALSE);
						l1 = (l2);
					} else {
						l1 = ((T4)((l1)+((T4)(geint32(1)))));
					}
					t1 = ((l1)==(l2));
				}
			} else {
				l1 = ((T4)(geint32(1)));
				l2 = ((T4)((l2)+((T4)(geint32(1)))));
				t1 = ((l1)==(l2));
				while (!(t1)) {
					t3 = (T16f5(C, l1));
					t4 = (T16f5(a1, l1));
					t1 = ((t3)!=(t4));
					if (t1) {
						R = (EIF_FALSE);
						l1 = (l2);
					} else {
						l1 = ((T4)((l1)+((T4)(geint32(1)))));
					}
					t1 = ((l1)==(l2));
				}
			}
		}
	}
	return R;
}

/* KL_DIRECTORY.string_ */
T0* T58f6(T0* C)
{
	T0* R = 0;
	if (ge262os1508) {
		return ge262ov1508;
	} else {
		ge262os1508 = '\1';
	}
	R = T54c12();
	ge262ov1508 = R;
	return R;
}

/* KL_DIRECTORY.file_system */
unsigned char ge291os1957 = '\0';
T0* ge291ov1957;
T0* T58f7(T0* C)
{
	T0* R = 0;
	T0* t1;
	T2 t2;
	if (ge291os1957) {
		return ge291ov1957;
	} else {
		ge291os1957 = '\1';
	}
	t1 = (T58f10(C));
	t2 = (T63f1(t1));
	if (t2) {
		R = (T58f11(C));
	} else {
		t1 = (T58f10(C));
		t2 = (T63f2(t1));
		if (t2) {
			R = (T58f12(C));
		} else {
			R = (T58f12(C));
		}
	}
	ge291ov1957 = R;
	return R;
}

/* KL_DIRECTORY.unix_file_system */
unsigned char ge291os1960 = '\0';
T0* ge291ov1960;
T0* T58f12(T0* C)
{
	T0* R = 0;
	if (ge291os1960) {
		return ge291ov1960;
	} else {
		ge291os1960 = '\1';
	}
	R = T65c11();
	ge291ov1960 = R;
	return R;
}

/* KL_UNIX_FILE_SYSTEM.make */
T0* T65c11()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T65));
	((T65*)(C))->id = 65;
	return C;
}

/* KL_OPERATING_SYSTEM.is_unix */
unsigned char ge382os2943 = '\0';
T2 ge382ov2943;
T2 T63f2(T0* C)
{
	T2 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T4 t2;
	T1 t3;
	if (ge382os2943) {
		return ge382ov2943;
	} else {
		ge382os2943 = '\1';
	}
	l2 = (T63f3(C, gems("GOBO_OS", 7)));
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t2 = (((T16*)(l2))->a2);
		t1 = (T4f1(&t2, (T4)(geint32(0))));
	}
	if (t1) {
		t1 = (T16f3(l2, gems("unix", 4)));
		if (t1) {
			R = (EIF_TRUE);
		}
	} else {
		l1 = (T63f4(C));
		t2 = (((T16*)(l1))->a2);
		t1 = (T4f1(&t2, (T4)(geint32(0))));
		if (t1) {
			t3 = (T16f5(l1, (T4)(geint32(1))));
			R = ((t3)==((T1)('/')));
		}
	}
	ge382ov2943 = R;
	return R;
}

/* KL_OPERATING_SYSTEM.current_working_directory */
T0* T63f4(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T63f5(C));
	R = (T73f2(t1));
	return R;
}

/* EXECUTION_ENVIRONMENT.current_working_directory */
T0* T73f2(T0* C)
{
	T0* R = 0;
	R = (T0*)dir_current();
	return R;
}

/* KL_OPERATING_SYSTEM.execution_environment */
unsigned char ge382os2947 = '\0';
T0* ge382ov2947;
T0* T63f5(T0* C)
{
	T0* R = 0;
	if (ge382os2947) {
		return ge382ov2947;
	} else {
		ge382os2947 = '\1';
	}
	R = T73c4();
	ge382ov2947 = R;
	return R;
}

/* KL_OPERATING_SYSTEM.variable_value */
T0* T63f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* t1;
	t1 = (T63f5(C));
	R = (T73f1(t1, a1));
	return R;
}

/* KL_DIRECTORY.windows_file_system */
unsigned char ge291os1958 = '\0';
T0* ge291ov1958;
T0* T58f11(T0* C)
{
	T0* R = 0;
	if (ge291os1958) {
		return ge291ov1958;
	} else {
		ge291os1958 = '\1';
	}
	R = T64c13();
	ge291ov1958 = R;
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.make */
T0* T64c13()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T64));
	((T64*)(C))->id = 64;
	((T64*)(C))->a12 = ((T1)('/'));
	return C;
}

/* KL_OPERATING_SYSTEM.is_windows */
unsigned char ge382os2942 = '\0';
T2 ge382ov2942;
T2 T63f1(T0* C)
{
	T2 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T4 t2;
	T1 t3;
	if (ge382os2942) {
		return ge382ov2942;
	} else {
		ge382os2942 = '\1';
	}
	l2 = (T63f3(C, gems("GOBO_OS", 7)));
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t2 = (((T16*)(l2))->a2);
		t1 = (T4f1(&t2, (T4)(geint32(0))));
	}
	if (t1) {
		t1 = (T16f3(l2, gems("windows", 7)));
		if (t1) {
			R = (EIF_TRUE);
		}
	} else {
		l3 = (T63f3(C, gems("OS", 2)));
		t1 = ((l3)!=(EIF_VOID));
		if (t1) {
			t1 = (T16f3(l3, gems("Windows_NT", 10)));
		}
		if (t1) {
			R = (EIF_TRUE);
		} else {
			l1 = (T63f4(C));
			t2 = (((T16*)(l1))->a2);
			t1 = (T4f2(&t2, (T4)(geint32(3))));
			if (t1) {
				t3 = (T16f5(l1, (T4)(geint32(2))));
				t1 = ((t3)==((T1)(':')));
				if (t1) {
					t3 = (T16f5(l1, (T4)(geint32(3))));
					t1 = ((t3)==((T1)('\\')));
				}
				if (t1) {
					R = (EIF_TRUE);
				} else {
					t3 = (T16f5(l1, (T4)(geint32(1))));
					t1 = ((t3)==((T1)('\\')));
					if (t1) {
						t3 = (T16f5(l1, (T4)(geint32(2))));
						t1 = ((t3)==((T1)('\\')));
					}
					if (t1) {
						R = (EIF_TRUE);
					}
				}
			}
		}
	}
	ge382ov2942 = R;
	return R;
}

/* KL_DIRECTORY.operating_system */
T0* T58f10(T0* C)
{
	T0* R = 0;
	if (ge312os1961) {
		return ge312ov1961;
	} else {
		ge312os1961 = '\1';
	}
	R = T63c7();
	ge312ov1961 = R;
	return R;
}

/* KL_DIRECTORY.create_directory */
void T58f16(T0* C)
{
	T2 l1 = 0;
	T2 t1;
	T4 t2;
	t1 = ((T2)(!(l1)));
	if (t1) {
		t2 = (((T16*)(((T58*)(C))->a2))->a2);
		t1 = (T4f1(&t2, (T4)(geint32(0))));
		if (t1) {
			t1 = (T58f3(C));
			t1 = ((T2)(!(t1)));
			if (t1) {
				T58f17(C);
			}
		}
	}
}

/* KL_DIRECTORY.create_dir */
void T58f17(T0* C)
{
	T0* l1 = 0;
	T57 t1;
	T14 t2;
	l1 = (T16f7(((T58*)(C))->a2));
	t1.id = 57;
	t1.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
	t2 = (T57f2(&t1));
	T58f18(C, t2);
}

/* KL_DIRECTORY.file_mkdir */
void T58f18(T0* C, T14 a1)
{
	file_mkdir((char *)a1);
}

/* KL_DIRECTORY.old_exists */
T2 T58f3(T0* C)
{
	T2 R = 0;
	T0* l1 = 0;
	T57 t1;
	T14 t2;
	l1 = (T16f7(((T58*)(C))->a2));
	t1.id = 57;
	t1.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
	t2 = (T57f2(&t1));
	R = (T58f4(C, t2));
	return R;
}

/* KL_DIRECTORY.eif_dir_exists */
T2 T58f4(T0* C, T14 a1)
{
	T2 R = 0;
	R = (T2)( EIF_BOOLEAN )eif_dir_exists((char *)a1);
	return R;
}

/* KL_DIRECTORY.exists */
T2 T58f1(T0* C)
{
	T2 R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T16*)(((T58*)(C))->a2))->a2);
	t2 = (T4f1(&t1, (T4)(geint32(0))));
	if (t2) {
		R = (T58f3(C));
	}
	return R;
}

/* KL_DIRECTORY.make */
T0* T58c13(T0* a1)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T58));
	((T58*)(C))->id = 58;
	((T58*)(C))->a5 = (a1);
	t1 = (T58f6(C));
	t1 = (T54f1(t1, a1));
	T58f15(C, t1);
	return C;
}

/* KL_DIRECTORY.old_make */
void T58f15(T0* C, T0* a1)
{
	((T58*)(C))->a2 = (a1);
	((T58*)(C))->a8 = ((T4)(geint32(1)));
}

/* KL_UNIX_FILE_SYSTEM.dirname */
T0* T65f2(T0* C, T0* a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T2 t1;
	T1 t2;
	t1 = (T65f5(C, a1));
	if (t1) {
		R = (T65f6(C));
	} else {
		l1 = (((T16*)(a1))->a2);
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		if (!(t1)) {
			t2 = (T16f5(a1, l1));
			t1 = ((t2)!=((T1)('/')));
		}
		while (!(t1)) {
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
			if (!(t1)) {
				t2 = (T16f5(a1, l1));
				t1 = ((t2)!=((T1)('/')));
			}
		}
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		if (!(t1)) {
			t2 = (T16f5(a1, l1));
			t1 = ((t2)==((T1)('/')));
		}
		while (!(t1)) {
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
			if (!(t1)) {
				t2 = (T16f5(a1, l1));
				t1 = ((t2)==((T1)('/')));
			}
		}
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		if (t1) {
			R = (ge297ov4136);
		} else {
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
			if (!(t1)) {
				t2 = (T16f5(a1, l1));
				t1 = ((t2)!=((T1)('/')));
			}
			while (!(t1)) {
				l1 = ((T4)((l1)-((T4)(geint32(1)))));
				t1 = ((T2)((l1)<((T4)(geint32(1)))));
				if (!(t1)) {
					t2 = (T16f5(a1, l1));
					t1 = ((t2)!=((T1)('/')));
				}
			}
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
			if (t1) {
				R = (T65f6(C));
			} else {
				R = (T16f6(a1, (T4)(geint32(1)), l1));
			}
		}
	}
	return R;
}

/* KL_UNIX_FILE_SYSTEM.root_directory */
unsigned char ge297os4138 = '\0';
T0* ge297ov4138;
T0* T65f6(T0* C)
{
	T0* R = 0;
	if (ge297os4138) {
		return ge297ov4138;
	} else {
		ge297os4138 = '\1';
	}
	R = (gems("/", 1));
	ge297ov4138 = R;
	return R;
}

/* KL_UNIX_FILE_SYSTEM.is_root_directory */
T2 T65f5(T0* C, T0* a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T1 t2;
	l2 = (((T16*)(a1))->a2);
	t1 = (T4f1(&l2, (T4)(geint32(0))));
	if (t1) {
		R = (EIF_TRUE);
		l1 = ((T4)(geint32(1)));
		t1 = (T4f1(&l1, l2));
		while (!(t1)) {
			t2 = (T16f5(a1, l1));
			t1 = ((t2)!=((T1)('/')));
			if (t1) {
				R = (EIF_FALSE);
				l1 = ((T4)((l2)+((T4)(geint32(1)))));
			} else {
				l1 = ((T4)((l1)+((T4)(geint32(1)))));
			}
			t1 = (T4f1(&l1, l2));
		}
	}
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.dirname */
T0* T64f2(T0* C, T0* a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T2 t1;
	T1 t2;
	T2 t3;
	T4 t4;
	t1 = (T64f5(C, a1));
	if (t1) {
		R = (a1);
	} else {
		l1 = (((T16*)(a1))->a2);
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		if (!(t1)) {
			t2 = (T16f5(a1, l1));
			t3 = (T64f6(C, t2));
			t1 = ((T2)(!(t3)));
		}
		while (!(t1)) {
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
			if (!(t1)) {
				t2 = (T16f5(a1, l1));
				t3 = (T64f6(C, t2));
				t1 = ((T2)(!(t3)));
			}
		}
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		if (!(t1)) {
			t2 = (T16f5(a1, l1));
			t1 = (T64f6(C, t2));
		}
		while (!(t1)) {
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
			if (!(t1)) {
				t2 = (T16f5(a1, l1));
				t1 = (T64f6(C, t2));
			}
		}
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		if (t1) {
			R = (ge299ov4136);
		} else {
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
			if (!(t1)) {
				t2 = (T16f5(a1, l1));
				t3 = (T64f6(C, t2));
				t1 = ((T2)(!(t3)));
			}
			while (!(t1)) {
				l1 = ((T4)((l1)-((T4)(geint32(1)))));
				t1 = ((T2)((l1)<((T4)(geint32(1)))));
				if (!(t1)) {
					t2 = (T16f5(a1, l1));
					t3 = (T64f6(C, t2));
					t1 = ((T2)(!(t3)));
				}
			}
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
			if (t1) {
				R = (T64f8(C));
			} else {
				t2 = (T16f5(a1, l1));
				t1 = ((t2)==((T1)(':')));
				if (t1) {
					t4 = (((T16*)(a1))->a2);
					t1 = ((T2)((l1)<(t4)));
				}
				if (t1) {
					t4 = ((T4)((l1)+((T4)(geint32(1)))));
					R = (T16f6(a1, (T4)(geint32(1)), t4));
				} else {
					R = (T16f6(a1, (T4)(geint32(1)), l1));
				}
			}
		}
	}
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.root_directory */
unsigned char ge299os4138 = '\0';
T0* ge299ov4138;
T0* T64f8(T0* C)
{
	T0* R = 0;
	if (ge299os4138) {
		return ge299ov4138;
	} else {
		ge299os4138 = '\1';
	}
	R = (gems("\\", 1));
	ge299ov4138 = R;
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.is_directory_separator */
T2 T64f6(T0* C, T1 a1)
{
	T2 R = 0;
	T2 t1;
	t1 = ((a1)==((T1)('\\')));
	if (!(t1)) {
		R = ((a1)==(((T64*)(C))->a12));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.is_root_directory */
T2 T64f5(T0* C, T0* a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 l3 = 0;
	T2 l4 = 0;
	T1 l5 = 0;
	T2 t1;
	T1 t2;
	T2 t3;
	T4 t4;
	l2 = (((T16*)(a1))->a2);
	t1 = (T4f2(&l2, (T4)(geint32(4))));
	if (t1) {
		t2 = (T16f5(a1, (T4)(geint32(1))));
		t1 = (T64f6(C, t2));
	}
	if (t1) {
		t2 = (T16f5(a1, (T4)(geint32(2))));
		t1 = (T64f6(C, t2));
		if (t1) {
			t2 = (T16f5(a1, (T4)(geint32(3))));
			t3 = (T64f6(C, t2));
			t1 = ((T2)(!(t3)));
		}
		if (t1) {
			l1 = ((T4)(geint32(4)));
			t1 = (T4f1(&l1, l2));
			if (!(t1)) {
				t1 = (l4);
			}
			while (!(t1)) {
				l5 = (T16f5(a1, l1));
				t1 = (T64f6(C, l5));
				if (t1) {
					l4 = (EIF_TRUE);
				} else {
					l1 = ((T4)((l1)+((T4)(geint32(1)))));
				}
				t1 = (T4f1(&l1, l2));
				if (!(t1)) {
					t1 = (l4);
				}
			}
			if (l4) {
				t1 = ((T2)((l1)<(l2)));
				if (t1) {
					t4 = ((T4)((l1)+((T4)(geint32(1)))));
					t2 = (T16f5(a1, t4));
					t3 = (T64f6(C, t2));
					t1 = ((T2)(!(t3)));
				}
				if (t1) {
					l4 = (EIF_FALSE);
					l1 = ((T4)((l1)+((T4)(geint32(1)))));
					t1 = (T4f1(&l1, l2));
					if (!(t1)) {
						t1 = (l4);
					}
					while (!(t1)) {
						l5 = (T16f5(a1, l1));
						t1 = (T64f6(C, l5));
						if (t1) {
							l4 = (EIF_TRUE);
						} else {
							l1 = ((T4)((l1)+((T4)(geint32(1)))));
						}
						t1 = (T4f1(&l1, l2));
						if (!(t1)) {
							t1 = (l4);
						}
					}
					if (l4) {
						l4 = (EIF_FALSE);
						l1 = ((T4)((l1)+((T4)(geint32(1)))));
						t1 = (T4f1(&l1, l2));
						if (!(t1)) {
							t1 = (l4);
						}
						while (!(t1)) {
							l5 = (T16f5(a1, l1));
							t1 = (T64f6(C, l5));
							t1 = ((T2)(!(t1)));
							if (t1) {
								l4 = (EIF_TRUE);
							} else {
								l1 = ((T4)((l1)+((T4)(geint32(1)))));
							}
							t1 = (T4f1(&l1, l2));
							if (!(t1)) {
								t1 = (l4);
							}
						}
						R = ((T2)(!(l4)));
					} else {
						R = (EIF_TRUE);
					}
				}
			}
		}
	} else {
		t1 = (T4f2(&l2, (T4)(geint32(3))));
		if (t1) {
			l5 = (T16f5(a1, (T4)(geint32(1))));
			t1 = (T64f6(C, l5));
			t1 = ((T2)(!(t1)));
			if (t1) {
				t1 = ((l5)!=((T1)(':')));
			}
			if (t1) {
				l1 = ((T4)(geint32(2)));
				t1 = (T4f1(&l1, l2));
				if (!(t1)) {
					t1 = (l3);
				}
				if (!(t1)) {
					t1 = (l4);
				}
				while (!(t1)) {
					l5 = (T16f5(a1, l1));
					t1 = (T64f6(C, l5));
					if (t1) {
						l3 = (EIF_TRUE);
					} else {
						t1 = ((l5)==((T1)(':')));
						if (t1) {
							l4 = (EIF_TRUE);
						} else {
							l1 = ((T4)((l1)+((T4)(geint32(1)))));
						}
					}
					t1 = (T4f1(&l1, l2));
					if (!(t1)) {
						t1 = (l3);
					}
					if (!(t1)) {
						t1 = (l4);
					}
				}
				if (l4) {
					t4 = ((T4)((l1)+((T4)(geint32(1)))));
					t1 = ((t4)==(l2));
				} else {
					t1 = EIF_FALSE;
				}
				if (t1) {
					l5 = (T16f5(a1, l2));
					R = (T64f6(C, l5));
				}
			}
		} else {
			t1 = ((l2)==((T4)(geint32(1))));
			if (t1) {
				l5 = (T16f5(a1, (T4)(geint32(1))));
				R = (T64f6(C, l5));
			}
		}
	}
	return R;
}

/* KL_UNIX_FILE_SYSTEM.canonical_pathname */
T0* T65f1(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = (T65f3(C, a1));
	T82f14(l1);
	R = (T65f4(C, l1));
	return R;
}

/* KL_UNIX_FILE_SYSTEM.pathname_to_string */
T0* T65f4(T0* C, T0* a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	T0* t3;
	R = T16c25((T4)(geint32(50)));
	t1 = (((T82*)(a1))->a5);
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = (T65f9(C));
		t3 = (T65f6(C));
		R = (T54f5(t2, R, t3));
	}
	l2 = (((T82*)(a1))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f2(&l1, l2));
	while (!(t1)) {
		t1 = (T82f6(a1, l1));
		if (t1) {
			t2 = (T65f9(C));
			R = (T54f5(t2, R, ge297ov4136));
		} else {
			t1 = (T82f7(a1, l1));
			if (t1) {
				t2 = (T65f9(C));
				R = (T54f5(t2, R, ge297ov4137));
			} else {
				t2 = (T65f9(C));
				t3 = (T82f8(a1, l1));
				R = (T54f5(t2, R, t3));
			}
		}
		T16f28(R, (T1)('/'));
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f2(&l1, l2));
	}
	t1 = ((l1)==(l2));
	if (t1) {
		t1 = (T82f6(a1, l1));
		if (t1) {
			t2 = (T65f9(C));
			R = (T54f5(t2, R, ge297ov4136));
		} else {
			t1 = (T82f7(a1, l1));
			if (t1) {
				t2 = (T65f9(C));
				R = (T54f5(t2, R, ge297ov4137));
			} else {
				t2 = (T65f9(C));
				t3 = (T82f8(a1, l1));
				R = (T54f5(t2, R, t3));
			}
		}
	}
	return R;
}

/* KL_PATHNAME.item */
T0* T82f8(T0* C, T4 a1)
{
	T0* R = 0;
	R = (T60f5(((T82*)(C))->a11, a1));
	return R;
}

/* ARRAY [STRING].item */
T0* T60f5(T0* C, T4 a1)
{
	T0* R = 0;
	T4 t1;
	t1 = ((T4)((a1)-(((T60*)(C))->a2)));
	R = (((T47*)(((T60*)(C))->a1))->a2[t1]);
	return R;
}

/* KL_PATHNAME.is_parent */
T2 T82f7(T0* C, T4 a1)
{
	T2 R = 0;
	T0* t1;
	t1 = (T82f8(C, a1));
	R = ((t1)==(ge288ov4364));
	return R;
}

/* KL_PATHNAME.is_current */
T2 T82f6(T0* C, T4 a1)
{
	T2 R = 0;
	T0* t1;
	t1 = (T82f8(C, a1));
	R = ((t1)==(ge288ov4363));
	return R;
}

/* KL_UNIX_FILE_SYSTEM.string_ */
T0* T65f9(T0* C)
{
	T0* R = 0;
	if (ge262os1508) {
		return ge262ov1508;
	} else {
		ge262os1508 = '\1';
	}
	R = T54c12();
	ge262ov1508 = R;
	return R;
}

/* KL_PATHNAME.set_canonical */
void T82f14(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	l3 = (((T82*)(C))->a1);
	t1 = ((l3)==((T4)(geint32(1))));
	if (t1) {
		t1 = (T82f6(C, (T4)(geint32(1))));
	}
	if (t1) {
		t1 = (((T82*)(C))->a5);
	}
	if (t1) {
	} else {
		l2 = ((T4)(geint32(1)));
		l1 = ((T4)(geint32(1)));
		t1 = (T4f1(&l1, l3));
		while (!(t1)) {
			t1 = (T82f6(C, l1));
			if (t1) {
			} else {
				t1 = (T82f7(C, l1));
				if (t1) {
					t1 = ((l2)==((T4)(geint32(1))));
					if (!(t1)) {
						t2 = ((T4)((l2)-((T4)(geint32(1)))));
						t1 = (T82f7(C, t2));
					}
					if (t1) {
						if (((T82*)(C))->a5) {
							t3 = (T82f8(C, l1));
							T60f12(((T82*)(C))->a11, t3, l2);
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
						}
					} else {
						l2 = ((T4)((l2)-((T4)(geint32(1)))));
					}
				} else {
					t3 = (T82f8(C, l1));
					T60f12(((T82*)(C))->a11, t3, l2);
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				}
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l3));
		}
		((T82*)(C))->a1 = ((T4)((l2)-((T4)(geint32(1)))));
		t1 = (T4f1(&l2, l3));
		while (!(t1)) {
			T60f12(((T82*)(C))->a11, EIF_VOID, l2);
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = (T4f1(&l2, l3));
		}
		if (((T82*)(C))->a5) {
			t1 = ((((T82*)(C))->a1)==((T4)(geint32(0))));
		} else {
			t1 = EIF_FALSE;
		}
		if (t1) {
			T82f16(C);
		}
	}
}

/* KL_PATHNAME.append_current */
void T82f16(T0* C)
{
	T82f21(C, ge288ov4363);
}

/* KL_PATHNAME.append_name */
void T82f21(T0* C, T0* a1)
{
	((T82*)(C))->a1 = ((T4)((((T82*)(C))->a1)+((T4)(geint32(1)))));
	T60f14(((T82*)(C))->a11, a1, ((T82*)(C))->a1);
}

/* ARRAY [STRING].force */
void T60f14(T0* C, T0* a1, T4 a2)
{
	T2 t1;
	t1 = ((T2)((a2)<(((T60*)(C))->a2)));
	if (t1) {
		T60f15(C, a2, ((T60*)(C))->a3);
	} else {
		t1 = (T4f1(&a2, ((T60*)(C))->a3));
		if (t1) {
			T60f15(C, ((T60*)(C))->a2, a2);
		}
	}
	T60f12(C, a1, a2);
}

/* ARRAY [STRING].auto_resize */
void T60f15(T0* C, T4 a1, T4 a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T0* l6 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	t1 = (T60f6(C));
	if (t1) {
		l3 = (a1);
		l4 = (a2);
	} else {
		l3 = (T4f19(&a1, ((T60*)(C))->a2));
		l4 = (T4f14(&a2, ((T60*)(C))->a3));
	}
	t2 = ((T4)((l4)-(l3)));
	l2 = ((T4)((t2)+((T4)(geint32(1)))));
	t1 = (T60f6(C));
	t1 = ((T2)(!(t1)));
	if (t1) {
		l1 = (((T47*)(((T60*)(C))->a1))->a1);
		t1 = (T4f1(&l2, l1));
		if (t1) {
			t2 = ((T4)((l2)-(l1)));
			t3 = (T60f7(C));
			t1 = ((T2)((t2)<(t3)));
		}
		if (t1) {
			t2 = (T60f7(C));
			l2 = ((T4)((l1)+(t2)));
		}
	}
	t1 = (T60f6(C));
	if (t1) {
		T60f13(C, l2);
	} else {
		t1 = (T4f1(&l2, l1));
		if (t1) {
			((T60*)(C))->a1 = (T47f4(((T60*)(C))->a1, l2));
		}
		t1 = ((T2)((l3)<(((T60*)(C))->a2)));
		if (t1) {
			l5 = ((T4)((((T60*)(C))->a2)-(l3)));
			t2 = (T60f8(C));
			T47f8(((T60*)(C))->a1, (T4)(geint32(0)), l5, t2);
			t2 = ((T4)((l5)-((T4)(geint32(1)))));
			T47f9(((T60*)(C))->a1, l6, (T4)(geint32(0)), t2);
		}
	}
	((T60*)(C))->a2 = (l3);
	((T60*)(C))->a3 = (l4);
}

/* SPECIAL [STRING].fill_with */
void T47f9(T0* C, T0* a1, T4 a2, T4 a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	l1 = (a2);
	l2 = ((T4)((a3)+((T4)(geint32(1)))));
	t1 = ((l1)==(l2));
	while (!(t1)) {
		((T47*)(C))->a2[l1] = (a1);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
}

/* SPECIAL [STRING].move_data */
void T47f8(T0* C, T4 a1, T4 a2, T4 a3)
{
	T2 t1;
	T4 t2;
	t1 = ((a1)==(a2));
	if (t1) {
	} else {
		t1 = (T4f1(&a1, a2));
		if (t1) {
			t2 = ((T4)((a2)+(a3)));
			t1 = ((T2)((t2)<(a1)));
			if (t1) {
				T47f10(C, a1, a2, a3);
			} else {
				T47f11(C, a1, a2, a3);
			}
		} else {
			t2 = ((T4)((a1)+(a3)));
			t1 = ((T2)((t2)<(a2)));
			if (t1) {
				T47f10(C, a1, a2, a3);
			} else {
				T47f11(C, a1, a2, a3);
			}
		}
	}
}

/* SPECIAL [STRING].overlapping_move */
void T47f11(T0* C, T4 a1, T4 a2, T4 a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	t1 = ((T2)((a1)<(a2)));
	if (t1) {
		t2 = ((T4)((a1)+(a3)));
		l1 = ((T4)((t2)-((T4)(geint32(1)))));
		l2 = ((T4)((a1)-((T4)(geint32(1)))));
		l3 = ((T4)((a2)-(a1)));
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t3 = (((T47*)(C))->a2[l1]);
			t2 = ((T4)((l1)+(l3)));
			((T47*)(C))->a2[t2] = (t3);
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
			t1 = ((l1)==(l2));
		}
	} else {
		l1 = (a1);
		l2 = ((T4)((a1)+(a3)));
		l3 = ((T4)((a1)-(a2)));
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t3 = (((T47*)(C))->a2[l1]);
			t2 = ((T4)((l1)-(l3)));
			((T47*)(C))->a2[t2] = (t3);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = ((l1)==(l2));
		}
	}
}

/* SPECIAL [STRING].non_overlapping_move */
void T47f10(T0* C, T4 a1, T4 a2, T4 a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l1 = (a1);
	l2 = ((T4)((a1)+(a3)));
	l3 = ((T4)((a2)-(a1)));
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T47*)(C))->a2[l1]);
		t3 = ((T4)((l1)+(l3)));
		((T47*)(C))->a2[t3] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
}

/* ARRAY [STRING].capacity */
T4 T60f8(T0* C)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((((T60*)(C))->a3)-(((T60*)(C))->a2)));
	R = ((T4)((t1)+((T4)(geint32(1)))));
	return R;
}

/* SPECIAL [STRING].aliased_resized_area */
T0* T47f4(T0* C, T4 a1)
{
	T0* R = 0;
	T4 t1 = ((T47*)(C))->a1;
	if (a1>t1) {
		R = (T0*)gealloc(sizeof(T47)+a1*sizeof(T0*));
		*(T47*)(R) = *(T47*)(C);
		memcpy(((T47*)(R))->a2, ((T47*)(C))->a2, t1*sizeof(T0*));
	} else {
		R = C;
	}
	((T47*)(R))->a1 = a1;
	return R;
}

/* ARRAY [STRING].additional_space */
T4 T60f7(T0* C)
{
	T4 R = 0;
	T4 t1;
	t1 = (T60f8(C));
	t1 = ((T4)((t1)*((T4)(geint32(50)))));
	t1 = ((T4)((t1)/((T4)(geint32(100)))));
	R = (T4f14(&t1, (T4)(geint32(5))));
	return R;
}

/* INTEGER.min */
T4 T4f19(T4* C, T4 a1)
{
	T4 R = 0;
	T2 t1;
	t1 = (T4f6(C, a1));
	if (t1) {
		R = (*C);
	} else {
		R = (a1);
	}
	return R;
}

/* ARRAY [STRING].empty_area */
T2 T60f6(T0* C)
{
	T2 R = 0;
	T2 t1;
	T4 t2;
	t1 = ((((T60*)(C))->a1)==(EIF_VOID));
	if (!(t1)) {
		t2 = (((T47*)(((T60*)(C))->a1))->a1);
		R = ((t2)==((T4)(geint32(0))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* KL_UNIX_FILE_SYSTEM.string_to_pathname */
T0* T65f3(T0* C, T0* a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T0* l5 = 0;
	T2 t1;
	T1 t2;
	T0* t3;
	R = T82c13();
	l2 = (((T16*)(a1))->a2);
	t1 = (T4f1(&l2, (T4)(geint32(0))));
	if (t1) {
		t2 = (T16f5(a1, (T4)(geint32(1))));
		t1 = ((t2)!=((T1)('/')));
		if (t1) {
			T82f15(R, EIF_TRUE);
		}
	} else {
		T82f15(R, EIF_TRUE);
	}
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		t1 = (T4f1(&l1, l2));
		if (!(t1)) {
			t2 = (T16f5(a1, l1));
			t1 = ((t2)!=((T1)('/')));
		}
		while (!(t1)) {
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l2));
			if (!(t1)) {
				t2 = (T16f5(a1, l1));
				t1 = ((t2)!=((T1)('/')));
			}
		}
		t1 = (T4f6(&l1, l2));
		if (t1) {
			l3 = (l1);
			t1 = (T4f1(&l1, l2));
			if (!(t1)) {
				t2 = (T16f5(a1, l1));
				t1 = ((t2)==((T1)('/')));
			}
			while (!(t1)) {
				l1 = ((T4)((l1)+((T4)(geint32(1)))));
				t1 = (T4f1(&l1, l2));
				if (!(t1)) {
					t2 = (T16f5(a1, l1));
					t1 = ((t2)==((T1)('/')));
				}
			}
			l4 = ((T4)((l1)-((T4)(geint32(1)))));
			l5 = (T16f6(a1, l3, l4));
			t3 = (T65f9(C));
			t1 = (T54f10(t3, l5, ge297ov4136));
			if (t1) {
				T82f16(R);
			} else {
				t3 = (T65f9(C));
				t1 = (T54f10(t3, l5, ge297ov4137));
				if (t1) {
					T82f17(R);
				} else {
					T82f21(R, l5);
				}
			}
		}
		t1 = (T4f1(&l1, l2));
	}
	return R;
}

/* KL_PATHNAME.append_parent */
void T82f17(T0* C)
{
	T82f21(C, ge288ov4364);
}

/* KL_PATHNAME.set_relative */
void T82f15(T0* C, T2 a1)
{
	((T82*)(C))->a5 = (a1);
}

/* KL_PATHNAME.make */
T0* T82c13()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T82));
	((T82*)(C))->id = 82;
	((T82*)(C))->a11 = T60c11((T4)(geint32(1)), (T4)(geint32(10)));
	return C;
}

/* KL_WINDOWS_FILE_SYSTEM.canonical_pathname */
T0* T64f1(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = (T64f3(C, a1));
	T82f14(l1);
	R = (T64f4(C, l1));
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.pathname_to_string */
T0* T64f4(T0* C, T0* a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T2 t1;
	T0* t2;
	T0* t3;
	R = T16c25((T4)(geint32(50)));
	l2 = (((T82*)(a1))->a1);
	l3 = (((T82*)(a1))->a2);
	t1 = ((l3)!=(EIF_VOID));
	if (t1) {
		t2 = (T64f9(C));
		R = (T54f5(t2, R, l3));
		T16f28(R, (T1)('\\'));
	} else {
		l4 = (((T82*)(a1))->a3);
		t1 = ((l4)!=(EIF_VOID));
		if (t1) {
			T16f28(R, (T1)('\\'));
			T16f28(R, (T1)('\\'));
			t2 = (T64f9(C));
			R = (T54f5(t2, R, l4));
			T16f28(R, (T1)('\\'));
			l5 = (((T82*)(a1))->a4);
			t1 = ((l5)!=(EIF_VOID));
			if (t1) {
				t2 = (T64f9(C));
				R = (T54f5(t2, R, l5));
				t1 = (T4f1(&l2, (T4)(geint32(0))));
				if (t1) {
					T16f28(R, (T1)('\\'));
				}
			}
		} else {
			t1 = (((T82*)(a1))->a5);
			t1 = ((T2)(!(t1)));
			if (t1) {
				t2 = (T64f9(C));
				t3 = (T64f8(C));
				R = (T54f5(t2, R, t3));
			}
		}
	}
	l1 = ((T4)(geint32(1)));
	t1 = (T4f2(&l1, l2));
	while (!(t1)) {
		t1 = (T82f6(a1, l1));
		if (t1) {
			t2 = (T64f9(C));
			R = (T54f5(t2, R, ge299ov4136));
		} else {
			t1 = (T82f7(a1, l1));
			if (t1) {
				t2 = (T64f9(C));
				R = (T54f5(t2, R, ge299ov4137));
			} else {
				t2 = (T64f9(C));
				t3 = (T82f8(a1, l1));
				R = (T54f5(t2, R, t3));
			}
		}
		T16f28(R, (T1)('\\'));
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f2(&l1, l2));
	}
	t1 = ((l1)==(l2));
	if (t1) {
		t1 = (T82f6(a1, l1));
		if (t1) {
			t2 = (T64f9(C));
			R = (T54f5(t2, R, ge299ov4136));
		} else {
			t1 = (T82f7(a1, l1));
			if (t1) {
				t2 = (T64f9(C));
				R = (T54f5(t2, R, ge299ov4137));
			} else {
				t2 = (T64f9(C));
				t3 = (T82f8(a1, l1));
				R = (T54f5(t2, R, t3));
			}
		}
	}
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.string_ */
T0* T64f9(T0* C)
{
	T0* R = 0;
	if (ge262os1508) {
		return ge262ov1508;
	} else {
		ge262os1508 = '\1';
	}
	R = T54c12();
	ge262ov1508 = R;
	return R;
}

/* KL_WINDOWS_FILE_SYSTEM.string_to_pathname */
T0* T64f3(T0* C, T0* a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T0* l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T2 t1;
	T1 t2;
	T2 t3;
	T0* t4;
	T4 t5;
	R = T82c13();
	T82f15(R, EIF_TRUE);
	l2 = (((T16*)(a1))->a2);
	t1 = (T4f1(&l2, (T4)(geint32(2))));
	if (t1) {
		t2 = (T16f5(a1, (T4)(geint32(1))));
		t3 = (T64f6(C, t2));
		if (t3) {
			t2 = (T16f5(a1, (T4)(geint32(2))));
			t1 = (T64f6(C, t2));
		} else {
			t1 = EIF_FALSE;
		}
	}
	if (t1) {
		l6 = (EIF_TRUE);
		T82f15(R, EIF_FALSE);
		l1 = ((T4)(geint32(3)));
	} else {
		t1 = (T4f1(&l2, (T4)(geint32(0))));
		if (t1) {
			t2 = (T16f5(a1, (T4)(geint32(1))));
			t1 = (T64f6(C, t2));
		}
		if (t1) {
			T82f15(R, EIF_FALSE);
			l1 = ((T4)(geint32(2)));
		} else {
			l8 = (EIF_TRUE);
			l1 = ((T4)(geint32(1)));
		}
	}
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		t1 = (T4f1(&l1, l2));
		if (!(t1)) {
			t2 = (T16f5(a1, l1));
			t3 = (T64f6(C, t2));
			t1 = ((T2)(!(t3)));
		}
		while (!(t1)) {
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l2));
			if (!(t1)) {
				t2 = (T16f5(a1, l1));
				t3 = (T64f6(C, t2));
				t1 = ((T2)(!(t3)));
			}
		}
		t1 = (T4f6(&l1, l2));
		if (t1) {
			l3 = (l1);
			t1 = (T4f1(&l1, l2));
			if (!(t1)) {
				t2 = (T16f5(a1, l1));
				t1 = (T64f6(C, t2));
			}
			while (!(t1)) {
				l1 = ((T4)((l1)+((T4)(geint32(1)))));
				t1 = (T4f1(&l1, l2));
				if (!(t1)) {
					t2 = (T16f5(a1, l1));
					t1 = (T64f6(C, t2));
				}
			}
			l4 = ((T4)((l1)-((T4)(geint32(1)))));
			l5 = (T16f6(a1, l3, l4));
			t4 = (T64f9(C));
			t1 = (T54f10(t4, l5, ge299ov4136));
			if (t1) {
				T82f16(R);
				l7 = (EIF_FALSE);
			} else {
				t4 = (T64f9(C));
				t1 = (T54f10(t4, l5, ge299ov4137));
				if (t1) {
					T82f17(R);
					l7 = (EIF_FALSE);
				} else {
					if (l6) {
						T82f18(R, l5);
						l7 = (EIF_TRUE);
					} else {
						if (l7) {
							T82f19(R, l5);
							l7 = (EIF_FALSE);
						} else {
							if (l8) {
								t5 = (((T16*)(l5))->a2);
								t2 = (T16f5(l5, t5));
								t1 = ((t2)==((T1)(':')));
								if (t1) {
									T82f20(R, l5);
									T82f15(R, EIF_FALSE);
								} else {
									T82f21(R, l5);
								}
							} else {
								T82f21(R, l5);
							}
						}
					}
				}
			}
			l6 = (EIF_FALSE);
			l8 = (EIF_FALSE);
		}
		t1 = (T4f1(&l1, l2));
	}
	return R;
}

/* KL_PATHNAME.set_drive */
void T82f20(T0* C, T0* a1)
{
	((T82*)(C))->a2 = (a1);
}

/* KL_PATHNAME.set_sharename */
void T82f19(T0* C, T0* a1)
{
	((T82*)(C))->a4 = (a1);
}

/* KL_PATHNAME.set_hostname */
void T82f18(T0* C, T0* a1)
{
	((T82*)(C))->a3 = (a1);
}

/* KL_TEXT_OUTPUT_FILE.file_system */
T0* T25f14(T0* C)
{
	T0* R = 0;
	T0* t1;
	T2 t2;
	if (ge291os1957) {
		return ge291ov1957;
	} else {
		ge291os1957 = '\1';
	}
	t1 = (T25f21(C));
	t2 = (T63f1(t1));
	if (t2) {
		R = (T25f22(C));
	} else {
		t1 = (T25f21(C));
		t2 = (T63f2(t1));
		if (t2) {
			R = (T25f23(C));
		} else {
			R = (T25f23(C));
		}
	}
	ge291ov1957 = R;
	return R;
}

/* KL_TEXT_OUTPUT_FILE.unix_file_system */
T0* T25f23(T0* C)
{
	T0* R = 0;
	if (ge291os1960) {
		return ge291ov1960;
	} else {
		ge291os1960 = '\1';
	}
	R = T65c11();
	ge291ov1960 = R;
	return R;
}

/* KL_TEXT_OUTPUT_FILE.windows_file_system */
T0* T25f22(T0* C)
{
	T0* R = 0;
	if (ge291os1958) {
		return ge291ov1958;
	} else {
		ge291os1958 = '\1';
	}
	R = T64c13();
	ge291ov1958 = R;
	return R;
}

/* KL_TEXT_OUTPUT_FILE.operating_system */
T0* T25f21(T0* C)
{
	T0* R = 0;
	if (ge312os1961) {
		return ge312ov1961;
	} else {
		ge312os1961 = '\1';
	}
	R = T63c7();
	ge312ov1961 = R;
	return R;
}

/* KL_TEXT_OUTPUT_FILE.open_write */
void T25f31(T0* C)
{
	T2 l1 = 0;
	T2 t1;
	t1 = ((T2)(!(l1)));
	if (t1) {
		t1 = ((((T25*)(C))->a16)!=(ge365ov1942));
		if (t1) {
			T25f34(C);
		}
	} else {
		t1 = (T25f2(C));
		t1 = ((T2)(!(t1)));
		if (t1) {
			T25f26(C);
		}
	}
}

/* KL_TEXT_OUTPUT_FILE.old_open_write */
void T25f34(T0* C)
{
	T14 t1;
	T2 t2;
	T25f34p1(C);
	t1 = (T25f19(C));
	t2 = ((((T25*)(C))->a17)==(t1));
	if (t2) {
		((T25*)(C))->a5 = ((T4)(geint32(0)));
		((T25*)(C))->a18 = (EIF_FALSE);
	}
}

/* KL_TEXT_OUTPUT_FILE.default_pointer */
T14 T25f19(T0* C)
{
	T14 R = 0;
	return R;
}

/* KL_TEXT_OUTPUT_FILE.open_write */
void T25f34p1(T0* C)
{
	T0* l1 = 0;
	T57 t1;
	T14 t2;
	l1 = (T16f7(((T25*)(C))->a16));
	t1.id = 57;
	t1.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
	t2 = (T57f2(&t1));
	((T25*)(C))->a17 = (T25f20(C, t2, (T4)(geint32(1))));
	((T25*)(C))->a5 = ((T4)(geint32(2)));
}

/* KL_TEXT_OUTPUT_FILE.file_open */
T14 T25f20(T0* C, T14 a1, T4 a2)
{
	T14 R = 0;
	R = (T14)( EIF_POINTER )file_open((char *)a1,( int)a2);
	return R;
}

/* KL_TEXT_OUTPUT_FILE.make */
T0* T25c24(T0* a1)
{
	T4 t1;
	T2 t2;
	T0* t3;
	T0* C;
	C = (T0*)gealloc(sizeof(T25));
	((T25*)(C))->id = 25;
	((T25*)(C))->a11 = (a1);
	t1 = (((T16*)(a1))->a2);
	t2 = (T4f1(&t1, (T4)(geint32(0))));
	if (t2) {
		t3 = (T25f12(C));
		t3 = (T54f1(t3, a1));
		T25f30(C, t3);
	} else {
		T25f30(C, ge365ov1942);
	}
	return C;
}

/* KL_TEXT_OUTPUT_FILE.old_make */
void T25f30(T0* C, T0* a1)
{
	((T25*)(C))->a16 = (a1);
	((T25*)(C))->a5 = ((T4)(geint32(0)));
}

/* STRING.is_equal */
T2 T16f3(T0* C, T0* a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	t1 = ((a1)==(C));
	if (t1) {
		R = (EIF_TRUE);
	} else {
		l1 = (((T16*)(C))->a2);
		t2 = (((T16*)(a1))->a2);
		t1 = ((l1)==(t2));
		if (t1) {
			t3 = (((T16*)(a1))->a1);
			t2 = (T16f4(C, ((T16*)(C))->a1, t3, l1));
			R = ((t2)==((T4)(geint32(0))));
		}
	}
	return R;
}

/* STRING.str_strict_cmp */
T4 T16f4(T0* C, T0* a1, T0* a2, T4 a3)
{
	T4 R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T1 t2;
	t1 = ((l1)==(a3));
	while (!(t1)) {
		t2 = (((T15*)(a1))->a2[l1]);
		l2 = ((T4)(t2));
		t2 = (((T15*)(a2))->a2[l1]);
		l3 = ((T4)(t2));
		t1 = ((l2)!=(l3));
		if (t1) {
			R = ((T4)((l2)-(l3)));
			l1 = ((T4)((a3)-((T4)(geint32(1)))));
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(a3));
	}
	return R;
}

/* GEPP.read_arguments */
void T18f12(T0* C)
{
	T0* l1 = 0;
	T2 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T0* t1;
	T2 t2;
	T1 t3;
	T4 t4;
	t1 = (T18f1(C));
	l5 = ((T4)(geargc - 1));
	t2 = ((l5)==((T4)(geint32(1))));
	if (t2) {
		t1 = (T18f1(C));
		l1 = (T19f2(t1, (T4)(geint32(1))));
		t2 = (T16f3(l1, gems("-V", 2)));
		if (!(t2)) {
			t2 = (T16f3(l1, gems("--version", 9)));
		}
		if (t2) {
			T18f14(C);
			t1 = (T18f6(C));
			T23f2(t1, (T4)(geint32(0)));
		} else {
			t2 = (T16f3(l1, gems("-h", 2)));
			if (!(t2)) {
				t2 = (T16f3(l1, gems("-\?", 2)));
			}
			if (!(t2)) {
				t2 = (T16f3(l1, gems("--help", 6)));
			}
			if (t2) {
				T18f15(C);
				t1 = (T18f6(C));
				T23f2(t1, (T4)(geint32(0)));
			}
		}
	}
	l3 = ((T4)(geint32(1)));
	t2 = (T4f1(&l3, l5));
	if (!(t2)) {
		t2 = (l2);
	}
	while (!(t2)) {
		t1 = (T18f1(C));
		l1 = (T19f2(t1, l3));
		l4 = (((T16*)(l1))->a2);
		t2 = (T4f2(&l4, (T4)(geint32(2))));
		if (t2) {
			t3 = (T16f5(l1, (T4)(geint32(1))));
			t2 = ((t3)==((T1)('-')));
		}
		if (t2) {
			t3 = (T16f5(l1, (T4)(geint32(2))));
			t2 = ((t3)==((T1)('D')));
			if (t2) {
				t2 = (T4f1(&l4, (T4)(geint32(2))));
				if (t2) {
					t1 = (T16f6(l1, (T4)(geint32(3)), l4));
					T21f171(((T18*)(C))->a3, gems("", 0), t1);
				}
				l3 = ((T4)((l3)+((T4)(geint32(1)))));
			} else {
				t2 = ((l4)==((T4)(geint32(2))));
				if (t2) {
					t3 = (T16f5(l1, (T4)(geint32(2))));
					t2 = ((t3)==((T1)('M')));
				}
				if (t2) {
					T21f172(((T18*)(C))->a3, EIF_TRUE);
					l3 = ((T4)((l3)+((T4)(geint32(1)))));
				} else {
					t2 = ((l4)==((T4)(geint32(2))));
					if (t2) {
						t3 = (T16f5(l1, (T4)(geint32(2))));
						t2 = ((t3)==((T1)('l')));
					}
					if (t2) {
						T21f173(((T18*)(C))->a3, EIF_TRUE);
						l3 = ((T4)((l3)+((T4)(geint32(1)))));
					} else {
						t2 = (T16f3(l1, gems("--lines", 7)));
						if (t2) {
							T21f173(((T18*)(C))->a3, EIF_TRUE);
							l3 = ((T4)((l3)+((T4)(geint32(1)))));
						} else {
							l2 = (EIF_TRUE);
						}
					}
				}
			}
		} else {
			l2 = (EIF_TRUE);
		}
		t2 = (T4f1(&l3, l5));
		if (!(t2)) {
			t2 = (l2);
		}
	}
	t4 = ((T4)((l5)-(l3)));
	t4 = ((T4)((t4)+((T4)(geint32(1)))));
	switch (t4) {
	case (T4)(T4)(geint32(0)):
		break;
	case (T4)(T4)(geint32(1)):
		t1 = (T18f1(C));
		((T18*)(C))->a4 = (T19f2(t1, l3));
		break;
	case (T4)(T4)(geint32(2)):
		t1 = (T18f1(C));
		((T18*)(C))->a4 = (T19f2(t1, l3));
		t1 = (T18f1(C));
		t4 = ((T4)((l3)+((T4)(geint32(1)))));
		((T18*)(C))->a5 = (T19f2(t1, t4));
		break;
	default:
		T18f16(C);
		t1 = (T18f6(C));
		T23f2(t1, (T4)(geint32(1)));
		break;
	}
}

/* GEPP.report_usage_error */
void T18f16(T0* C)
{
	T0* t1;
	t1 = (T18f9(C));
	T20f8(((T18*)(C))->a2, t1);
}

/* GEPP.usage_message */
unsigned char ge52os1300 = '\0';
T0* ge52ov1300;
T0* T18f9(T0* C)
{
	T0* R = 0;
	if (ge52os1300) {
		return ge52ov1300;
	} else {
		ge52os1300 = '\1';
	}
	R = T33c7(gems("[--version][--help][-hV\?lM]\n\t[--lines][-Dname ...][filename | -][filename | -]", 78));
	ge52ov1300 = R;
	return R;
}

/* UT_USAGE_MESSAGE.make */
T0* T33c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T33));
	((T33*)(C))->id = 33;
	((T33*)(C))->a1 = T60c11((T4)(geint32(1)), (T4)(geint32(1)));
	T60f12(((T33*)(C))->a1, a1, (T4)(geint32(1)));
	return C;
}

/* GEPP_PARSER.set_empty_lines */
void T21f173(T0* C, T2 a1)
{
	((T21*)(C))->a9 = (a1);
}

/* GEPP_PARSER.set_makefile_dependencies */
void T21f172(T0* C, T2 a1)
{
	((T21*)(C))->a8 = (a1);
}

/* GEPP.report_usage_message */
void T18f15(T0* C)
{
	T0* t1;
	t1 = (T18f9(C));
	T20f7(((T18*)(C))->a2, t1);
}

/* UT_ERROR_HANDLER.report_info */
void T20f7(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T20f5(C, a1));
	T20f9(C, t1);
}

/* UT_ERROR_HANDLER.report_info_message */
void T20f9(T0* C, T0* a1)
{
	T28f10(((T20*)(C))->a4, a1);
}

/* GEPP.report_version_number */
void T18f14(T0* C)
{
	T0* l1 = 0;
	l1 = T31c7(ge305ov1302);
	T20f7(((T18*)(C))->a2, l1);
}

/* UT_VERSION_NUMBER.make */
T0* T31c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T31));
	((T31*)(C))->id = 31;
	((T31*)(C))->a1 = T60c11((T4)(geint32(1)), (T4)(geint32(1)));
	T60f12(((T31*)(C))->a1, a1, (T4)(geint32(1)));
	return C;
}

/* KL_ARGUMENTS.argument */
T0* T19f2(T0* C, T4 a1)
{
	T0* R = 0;
	char* s = geargv[a1];
	R = gems(s,strlen(s));
	return R;
}

/* GEPP_PARSER.make */
T0* T21c170(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T21));
	((T21*)(C))->id = 21;
	T21f176(C);
	T21f177(C);
	((T21*)(C))->a4 = (a1);
	((T21*)(C))->a5 = T37c33((T4)(geint32(10)));
	((T21*)(C))->a6 = T38c8((T4)(geint32(10)));
	return C;
}

/* DS_ARRAYED_STACK [YY_BUFFER].make */
T0* T38c8(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T38));
	((T38*)(C))->id = 38;
	((T38*)(C))->a7 = T68c2();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T38*)(C))->a6 = (T68f1(((T38*)(C))->a7, t1));
	((T38*)(C))->a5 = (a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [YY_BUFFER].make */
T0* T68f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T83c2(a1);
	R = (((T83*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [YY_BUFFER].make_area */
T0* T83c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T83));
	((T83*)(C))->id = 83;
	((T83*)(C))->a1 = T67c2(a1);
	return C;
}

/* SPECIAL [YY_BUFFER].make */
T0* T67c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T67)+a1*sizeof(T0*));
	((T67*)(C))->a1 = a1;
	((T67*)(C))->id = 67;
	return C;
}

/* KL_SPECIAL_ROUTINES [YY_BUFFER].default_create */
T0* T68c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T68));
	((T68*)(C))->id = 68;
	return C;
}

/* DS_HASH_TABLE [STRING, STRING].make */
T0* T37c33(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T37));
	((T37*)(C))->id = 37;
	((T37*)(C))->a4 = T22c2();
	T37f37(C, a1, EIF_VOID, ((T37*)(C))->a4);
	return C;
}

/* DS_HASH_TABLE [STRING, STRING].make_with_equality_testers */
void T37f37(T0* C, T4 a1, T0* a2, T0* a3)
{
	((T37*)(C))->a18 = (a2);
	((T37*)(C))->a4 = (a3);
	T37f45(C, a1);
}

/* DS_HASH_TABLE [STRING, STRING].make_sparse_container */
void T37f45(T0* C, T4 a1)
{
	T4 t1;
	((T37*)(C))->a6 = (a1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T37f52(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T37f53(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T37f54(C, t1);
	((T37*)(C))->a15 = (T37f21(C, a1));
	t1 = ((T4)((((T37*)(C))->a15)+((T4)(geint32(1)))));
	T37f55(C, t1);
	((T37*)(C))->a11 = ((T4)(geint32(0)));
	((T37*)(C))->a10 = ((T4)(geint32(0)));
	((T37*)(C))->a2 = ((T4)(geint32(0)));
	T37f38(C);
	((T37*)(C))->a26 = (T37f27(C));
}

/* DS_HASH_TABLE [STRING, STRING].new_cursor */
T0* T37f27(T0* C)
{
	T0* R = 0;
	R = T66c4(C);
	return R;
}

/* DS_HASH_TABLE_CURSOR [STRING, STRING].make */
T0* T66c4(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T66));
	((T66*)(C))->id = 66;
	((T66*)(C))->a3 = (a1);
	((T66*)(C))->a1 = ((T4)(geint32(-1)));
	return C;
}

/* DS_HASH_TABLE [STRING, STRING].make_slots */
void T37f55(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T37f28(C));
	((T37*)(C))->a24 = (T42f1(t1, a1));
}

/* KL_SPECIAL_ROUTINES [INTEGER].make */
T0* T42f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T69c2(a1);
	R = (((T69*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [INTEGER].make_area */
T0* T69c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T69));
	((T69*)(C))->id = 69;
	((T69*)(C))->a1 = T41c4(a1);
	return C;
}

/* DS_HASH_TABLE [STRING, STRING].make_clashes */
void T37f54(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T37f28(C));
	((T37*)(C))->a23 = (T42f1(t1, a1));
}

/* DS_HASH_TABLE [STRING, STRING].make_keys */
void T37f53(T0* C, T4 a1)
{
	((T37*)(C))->a30 = T48c3();
	((T37*)(C))->a25 = (T48f1(((T37*)(C))->a30, a1));
}

/* DS_HASH_TABLE [STRING, STRING].make_items */
void T37f52(T0* C, T4 a1)
{
	((T37*)(C))->a29 = T48c3();
	((T37*)(C))->a20 = (T48f1(((T37*)(C))->a29, a1));
}

/* KL_EQUALITY_TESTER [STRING].default_create */
T0* T22c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T22));
	((T22*)(C))->id = 22;
	return C;
}

/* GEPP_PARSER.make_parser_skeleton */
void T21f177(T0* C)
{
	T0* t1;
	t1 = (T21f16(C));
	((T21*)(C))->a15 = (T42f1(t1, (T4)(geint32(200))));
	T21f182(C);
	T21f183(C);
}

/* GEPP_PARSER.yy_build_parser_tables */
void T21f183(T0* C)
{
	((T21*)(C))->a47 = (T21f61(C));
	((T21*)(C))->a55 = (T21f62(C));
	((T21*)(C))->a63 = (T21f64(C));
	((T21*)(C))->a65 = (T21f66(C));
	((T21*)(C))->a53 = (T21f67(C));
	((T21*)(C))->a58 = (T21f68(C));
	((T21*)(C))->a42 = (T21f69(C));
	((T21*)(C))->a57 = (T21f70(C));
	((T21*)(C))->a51 = (T21f71(C));
	((T21*)(C))->a50 = (T21f72(C));
}

/* GEPP_PARSER.yycheck_template */
unsigned char ge53os1376 = '\0';
T0* ge53ov1376;
T0* T21f72(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge53os1376) {
		return ge53ov1376;
	} else {
		ge53os1376 = '\1';
	}
	t1 = (gema61((T4)54,
(T4)(geint32(6)),
(T4)(geint32(8)),
(T4)(geint32(5)),
(T4)(geint32(0)),
(T4)(geint32(3)),
(T4)(geint32(4)),
(T4)(geint32(5)),
(T4)(geint32(6)),
(T4)(geint32(7)),
(T4)(geint32(12)),
(T4)(geint32(13)),
(T4)(geint32(10)),
(T4)(geint32(18)),
(T4)(geint32(3)),
(T4)(geint32(4)),
(T4)(geint32(5)),
(T4)(geint32(6)),
(T4)(geint32(7)),
(T4)(geint32(0)),
(T4)(geint32(9)),
(T4)(geint32(10)),
(T4)(geint32(24)),
(T4)(geint32(25)),
(T4)(geint32(12)),
(T4)(geint32(31)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(16)),
(T4)(geint32(17)),
(T4)(geint32(14)),
(T4)(geint32(15)),
(T4)(geint32(37)),
(T4)(geint32(3)),
(T4)(geint32(4)),
(T4)(geint32(5)),
(T4)(geint32(6)),
(T4)(geint32(7)),
(T4)(geint32(14)),
(T4)(geint32(15)),
(T4)(geint32(11)),
(T4)(geint32(15)),
(T4)(geint32(18)),
(T4)(geint32(14)),
(T4)(geint32(15)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(-1)),
(T4)(geint32(37)),
(T4)(geint32(13)),
(T4)(geint32(12)),
(T4)(geint32(12)),
(T4)(geint32(2147483647))));
	R = (T21f166(C, t1));
	ge53ov1376 = R;
	return R;
}

/* GEPP_PARSER.yyfixed_array */
T0* T21f166(T0* C, T0* a1)
{
	T0* R = 0;
	T0* t1;
	t1 = (T21f16(C));
	R = (T42f3(t1, a1));
	return R;
}

/* KL_SPECIAL_ROUTINES [INTEGER].to_special */
T0* T42f3(T0* C, T0* a1)
{
	T0* R = 0;
	R = (((T61*)(a1))->a1);
	return R;
}

/* GEPP_PARSER.yytable_template */
unsigned char ge53os1375 = '\0';
T0* ge53ov1375;
T0* T21f71(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge53os1375) {
		return ge53ov1375;
	} else {
		ge53os1375 = '\1';
	}
	t1 = (gema61((T4)54,
(T4)(geint32(17)),
(T4)(geint32(18)),
(T4)(geint32(16)),
(T4)(geint32(41)),
(T4)(geint32(5)),
(T4)(geint32(4)),
(T4)(geint32(3)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(22)),
(T4)(geint32(23)),
(T4)(geint32(28)),
(T4)(geint32(17)),
(T4)(geint32(5)),
(T4)(geint32(4)),
(T4)(geint32(3)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(40)),
(T4)(geint32(29)),
(T4)(geint32(28)),
(T4)(geint32(33)),
(T4)(geint32(34)),
(T4)(geint32(14)),
(T4)(geint32(37)),
(T4)(geint32(36)),
(T4)(geint32(27)),
(T4)(geint32(13)),
(T4)(geint32(12)),
(T4)(geint32(25)),
(T4)(geint32(24)),
(T4)(geint32(17)),
(T4)(geint32(5)),
(T4)(geint32(4)),
(T4)(geint32(3)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(25)),
(T4)(geint32(24)),
(T4)(geint32(26)),
(T4)(geint32(24)),
(T4)(geint32(32)),
(T4)(geint32(25)),
(T4)(geint32(24)),
(T4)(geint32(35)),
(T4)(geint32(21)),
(T4)(geint32(20)),
(T4)(geint32(19)),
(T4)(geint32(0)),
(T4)(geint32(38)),
(T4)(geint32(11)),
(T4)(geint32(10)),
(T4)(geint32(9)),
(T4)(geint32(2147483647))));
	R = (T21f166(C, t1));
	ge53ov1375 = R;
	return R;
}

/* GEPP_PARSER.yypgoto_template */
unsigned char ge53os1374 = '\0';
T0* ge53ov1374;
T0* T21f70(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge53os1374) {
		return ge53ov1374;
	} else {
		ge53os1374 = '\1';
	}
	t1 = (gema61((T4)8,
(T4)(geint32(-3)),
(T4)(geint32(-32768)),
(T4)(geint32(-7)),
(T4)(geint32(-6)),
(T4)(geint32(-32768)),
(T4)(geint32(12)),
(T4)(geint32(-32768)),
(T4)(geint32(2147483647))));
	R = (T21f166(C, t1));
	ge53ov1374 = R;
	return R;
}

/* GEPP_PARSER.yypact_template */
unsigned char ge53os1373 = '\0';
T0* ge53ov1373;
T0* T21f69(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge53os1373) {
		return ge53ov1373;
	} else {
		ge53os1373 = '\1';
	}
	t1 = (gema61((T4)43,
(T4)(geint32(29)),
(T4)(geint32(40)),
(T4)(geint32(39)),
(T4)(geint32(37)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(29)),
(T4)(geint32(-32768)),
(T4)(geint32(29)),
(T4)(geint32(36)),
(T4)(geint32(35)),
(T4)(geint32(34)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(-32768)),
(T4)(geint32(28)),
(T4)(geint32(15)),
(T4)(geint32(-32768)),
(T4)(geint32(10)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(23)),
(T4)(geint32(-32768)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(33)),
(T4)(geint32(14)),
(T4)(geint32(-32768)),
(T4)(geint32(29)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(25)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(1)),
(T4)(geint32(-32768)),
(T4)(geint32(18)),
(T4)(geint32(3)),
(T4)(geint32(-32768)),
(T4)(geint32(2147483647))));
	R = (T21f166(C, t1));
	ge53ov1373 = R;
	return R;
}

/* GEPP_PARSER.yydefgoto_template */
unsigned char ge53os1372 = '\0';
T0* ge53ov1372;
T0* T21f68(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge53os1372) {
		return ge53ov1372;
	} else {
		ge53os1372 = '\1';
	}
	t1 = (gema61((T4)8,
(T4)(geint32(15)),
(T4)(geint32(39)),
(T4)(geint32(6)),
(T4)(geint32(7)),
(T4)(geint32(8)),
(T4)(geint32(30)),
(T4)(geint32(31)),
(T4)(geint32(2147483647))));
	R = (T21f166(C, t1));
	ge53ov1372 = R;
	return R;
}

/* GEPP_PARSER.yydefact_template */
unsigned char ge53os1371 = '\0';
T0* ge53ov1371;
T0* T21f67(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge53os1371) {
		return ge53ov1371;
	} else {
		ge53os1371 = '\1';
	}
	t1 = (gema61((T4)43,
(T4)(geint32(2)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(1)),
(T4)(geint32(3)),
(T4)(geint32(2)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(12)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(4)),
(T4)(geint32(0)),
(T4)(geint32(8)),
(T4)(geint32(7)),
(T4)(geint32(9)),
(T4)(geint32(0)),
(T4)(geint32(16)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(11)),
(T4)(geint32(10)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(5)),
(T4)(geint32(2)),
(T4)(geint32(13)),
(T4)(geint32(14)),
(T4)(geint32(15)),
(T4)(geint32(17)),
(T4)(geint32(18)),
(T4)(geint32(0)),
(T4)(geint32(6)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(2147483647))));
	R = (T21f166(C, t1));
	ge53ov1371 = R;
	return R;
}

/* GEPP_PARSER.yytypes2_template */
unsigned char ge53os1370 = '\0';
T0* ge53ov1370;
T0* T21f66(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge53os1370) {
		return ge53ov1370;
	} else {
		ge53os1370 = '\1';
	}
	t1 = (gema61((T4)20,
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2147483647))));
	R = (T21f166(C, t1));
	ge53ov1370 = R;
	return R;
}

/* GEPP_PARSER.yytypes1_template */
unsigned char ge53os1369 = '\0';
T0* ge53ov1369;
T0* T21f64(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge53os1369) {
		return ge53ov1369;
	} else {
		ge53os1369 = '\1';
	}
	t1 = (gema61((T4)43,
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2147483647))));
	R = (T21f166(C, t1));
	ge53ov1369 = R;
	return R;
}

/* GEPP_PARSER.yyr1_template */
unsigned char ge53os1368 = '\0';
T0* ge53ov1368;
T0* T21f62(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge53os1368) {
		return ge53ov1368;
	} else {
		ge53os1368 = '\1';
	}
	t1 = (gema61((T4)20,
(T4)(geint32(0)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(22)),
(T4)(geint32(22)),
(T4)(geint32(22)),
(T4)(geint32(22)),
(T4)(geint32(22)),
(T4)(geint32(23)),
(T4)(geint32(23)),
(T4)(geint32(19)),
(T4)(geint32(19)),
(T4)(geint32(19)),
(T4)(geint32(19)),
(T4)(geint32(19)),
(T4)(geint32(24)),
(T4)(geint32(25)),
(T4)(geint32(2147483647))));
	R = (T21f166(C, t1));
	ge53ov1368 = R;
	return R;
}

/* GEPP_PARSER.yytranslate_template */
unsigned char ge53os1367 = '\0';
T0* ge53ov1367;
T0* T21f61(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge53os1367) {
		return ge53ov1367;
	} else {
		ge53os1367 = '\1';
	}
	t1 = (gema61((T4)272,
(T4)(geint32(0)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(16)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(17)),
(T4)(geint32(18)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(3)),
(T4)(geint32(4)),
(T4)(geint32(5)),
(T4)(geint32(6)),
(T4)(geint32(7)),
(T4)(geint32(8)),
(T4)(geint32(9)),
(T4)(geint32(10)),
(T4)(geint32(11)),
(T4)(geint32(12)),
(T4)(geint32(13)),
(T4)(geint32(14)),
(T4)(geint32(15)),
(T4)(geint32(2147483647))));
	R = (T21f166(C, t1));
	ge53ov1367 = R;
	return R;
}

/* GEPP_PARSER.yy_create_value_stacks */
void T21f182(T0* C)
{
}

/* GEPP_PARSER.make_gepp_scanner */
void T21f176(T0* C)
{
	T0* t1;
	t1 = (T21f12(C));
	T21f181(C, t1);
	t1 = (T21f13(C));
	((T21*)(C))->a10 = (T27f1(t1));
	((T21*)(C))->a14 = ((T4)(geint32(1)));
}

/* GEPP_PARSER.make_with_buffer */
void T21f181(T0* C, T0* a1)
{
	((T21*)(C))->a18 = (a1);
	T21f195(C);
	T21f184(C);
}

/* GEPP_PARSER.yy_initialize */
void T21f195(T0* C)
{
	T0* t1;
	T0* t2;
	T4 t3;
	T21f206(C);
	((T21*)(C))->a88 = ((T4)(geint32(1)));
	((T21*)(C))->a21 = ((T4)(geint32(1)));
	((T21*)(C))->a22 = ((T4)(geint32(1)));
	((T21*)(C))->a20 = ((T4)(geint32(1)));
	((T21*)(C))->a85 = ((T4)(geint32(1)));
	((T21*)(C))->a86 = ((T4)(geint32(1)));
	((T21*)(C))->a87 = ((T4)(geint32(1)));
	if (EIF_FALSE) {
		t1 = (T21f16(C));
		t2 = ((((((T21*)(C))->a18)->id==39)?((T39*)(((T21*)(C))->a18))->a1:((T40*)(((T21*)(C))->a18))->a1));
		t3 = (T79f4(t2));
		t3 = ((T4)((t3)+((T4)(geint32(1)))));
		((T21*)(C))->a90 = (T42f1(t1, t3));
	}
}

/* GEPP_PARSER.yy_build_tables */
void T21f206(T0* C)
{
	((T21*)(C))->a103 = (T21f156(C));
	((T21*)(C))->a98 = (T21f157(C));
	((T21*)(C))->a99 = (T21f158(C));
	((T21*)(C))->a100 = (T21f159(C));
	((T21*)(C))->a92 = (T21f160(C));
	((T21*)(C))->a101 = (T21f161(C));
	((T21*)(C))->a95 = (T21f162(C));
}

/* GEPP_PARSER.yy_accept_template */
unsigned char ge54os1524 = '\0';
T0* ge54ov1524;
T0* T21f162(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge54os1524) {
		return ge54ov1524;
	} else {
		ge54os1524 = '\1';
	}
	t1 = (gema61((T4)68,
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(14)),
(T4)(geint32(14)),
(T4)(geint32(24)),
(T4)(geint32(22)),
(T4)(geint32(12)),
(T4)(geint32(11)),
(T4)(geint32(9)),
(T4)(geint32(21)),
(T4)(geint32(15)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(17)),
(T4)(geint32(21)),
(T4)(geint32(14)),
(T4)(geint32(13)),
(T4)(geint32(12)),
(T4)(geint32(10)),
(T4)(geint32(1)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(15)),
(T4)(geint32(0)),
(T4)(geint32(18)),
(T4)(geint32(17)),
(T4)(geint32(19)),
(T4)(geint32(14)),
(T4)(geint32(13)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(16)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(4)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(5)),
(T4)(geint32(2)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(8)),
(T4)(geint32(7)),
(T4)(geint32(3)),
(T4)(geint32(0)),
(T4)(geint32(6)),
(T4)(geint32(0)),
(T4)(geint32(2147483647))));
	R = (T21f169(C, t1));
	ge54ov1524 = R;
	return R;
}

/* GEPP_PARSER.yy_fixed_array */
T0* T21f169(T0* C, T0* a1)
{
	T0* R = 0;
	T0* t1;
	t1 = (T21f16(C));
	R = (T42f3(t1, a1));
	return R;
}

/* GEPP_PARSER.yy_meta_template */
unsigned char ge54os1523 = '\0';
T0* ge54ov1523;
T0* T21f161(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge54os1523) {
		return ge54ov1523;
	} else {
		ge54os1523 = '\1';
	}
	t1 = (gema61((T4)19,
(T4)(geint32(0)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(3)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(4)),
(T4)(geint32(4)),
(T4)(geint32(4)),
(T4)(geint32(4)),
(T4)(geint32(4)),
(T4)(geint32(4)),
(T4)(geint32(4)),
(T4)(geint32(4)),
(T4)(geint32(4)),
(T4)(geint32(5)),
(T4)(geint32(1)),
(T4)(geint32(2147483647))));
	R = (T21f169(C, t1));
	ge54ov1523 = R;
	return R;
}

/* GEPP_PARSER.yy_ec_template */
unsigned char ge54os1522 = '\0';
T0* ge54ov1522;
T0* T21f160(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge54os1522) {
		return ge54ov1522;
	} else {
		ge54os1522 = '\1';
	}
	t1 = (gema61((T4)258,
(T4)(geint32(0)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(3)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(4)),
(T4)(geint32(5)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(6)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(1)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(8)),
(T4)(geint32(9)),
(T4)(geint32(10)),
(T4)(geint32(11)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(12)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(13)),
(T4)(geint32(7)),
(T4)(geint32(14)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(15)),
(T4)(geint32(7)),
(T4)(geint32(16)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(7)),
(T4)(geint32(1)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(8)),
(T4)(geint32(9)),
(T4)(geint32(10)),
(T4)(geint32(11)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(12)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(13)),
(T4)(geint32(7)),
(T4)(geint32(14)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(15)),
(T4)(geint32(7)),
(T4)(geint32(16)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(1)),
(T4)(geint32(17)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2147483647))));
	R = (T21f169(C, t1));
	ge54ov1522 = R;
	return R;
}

/* GEPP_PARSER.yy_def_template */
unsigned char ge54os1521 = '\0';
T0* ge54ov1521;
T0* T21f159(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge54os1521) {
		return ge54ov1521;
	} else {
		ge54os1521 = '\1';
	}
	t1 = (gema61((T4)76,
(T4)(geint32(0)),
(T4)(geint32(67)),
(T4)(geint32(68)),
(T4)(geint32(66)),
(T4)(geint32(3)),
(T4)(geint32(69)),
(T4)(geint32(69)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(70)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(71)),
(T4)(geint32(66)),
(T4)(geint32(72)),
(T4)(geint32(66)),
(T4)(geint32(73)),
(T4)(geint32(66)),
(T4)(geint32(70)),
(T4)(geint32(66)),
(T4)(geint32(74)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(71)),
(T4)(geint32(66)),
(T4)(geint32(72)),
(T4)(geint32(66)),
(T4)(geint32(73)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(0)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(2147483647))));
	R = (T21f169(C, t1));
	ge54ov1521 = R;
	return R;
}

/* GEPP_PARSER.yy_base_template */
unsigned char ge54os1520 = '\0';
T0* ge54ov1520;
T0* T21f158(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge54os1520) {
		return ge54ov1520;
	} else {
		ge54os1520 = '\1';
	}
	t1 = (gema61((T4)76,
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(5)),
(T4)(geint32(0)),
(T4)(geint32(100)),
(T4)(geint32(99)),
(T4)(geint32(101)),
(T4)(geint32(104)),
(T4)(geint32(97)),
(T4)(geint32(104)),
(T4)(geint32(18)),
(T4)(geint32(104)),
(T4)(geint32(97)),
(T4)(geint32(104)),
(T4)(geint32(0)),
(T4)(geint32(92)),
(T4)(geint32(0)),
(T4)(geint32(80)),
(T4)(geint32(93)),
(T4)(geint32(104)),
(T4)(geint32(92)),
(T4)(geint32(104)),
(T4)(geint32(0)),
(T4)(geint32(84)),
(T4)(geint32(11)),
(T4)(geint32(15)),
(T4)(geint32(79)),
(T4)(geint32(90)),
(T4)(geint32(87)),
(T4)(geint32(104)),
(T4)(geint32(0)),
(T4)(geint32(104)),
(T4)(geint32(87)),
(T4)(geint32(104)),
(T4)(geint32(78)),
(T4)(geint32(73)),
(T4)(geint32(78)),
(T4)(geint32(22)),
(T4)(geint32(78)),
(T4)(geint32(76)),
(T4)(geint32(104)),
(T4)(geint32(72)),
(T4)(geint32(73)),
(T4)(geint32(70)),
(T4)(geint32(71)),
(T4)(geint32(71)),
(T4)(geint32(66)),
(T4)(geint32(68)),
(T4)(geint32(63)),
(T4)(geint32(104)),
(T4)(geint32(65)),
(T4)(geint32(64)),
(T4)(geint32(64)),
(T4)(geint32(57)),
(T4)(geint32(61)),
(T4)(geint32(58)),
(T4)(geint32(104)),
(T4)(geint32(104)),
(T4)(geint32(48)),
(T4)(geint32(49)),
(T4)(geint32(104)),
(T4)(geint32(104)),
(T4)(geint32(104)),
(T4)(geint32(25)),
(T4)(geint32(104)),
(T4)(geint32(104)),
(T4)(geint32(36)),
(T4)(geint32(41)),
(T4)(geint32(46)),
(T4)(geint32(51)),
(T4)(geint32(56)),
(T4)(geint32(28)),
(T4)(geint32(61)),
(T4)(geint32(66)),
(T4)(geint32(2147483647))));
	R = (T21f169(C, t1));
	ge54ov1520 = R;
	return R;
}

/* GEPP_PARSER.yy_chk_template */
unsigned char ge54os1519 = '\0';
T0* ge54ov1519;
T0* T21f157(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge54os1519) {
		return ge54ov1519;
	} else {
		ge54os1519 = '\1';
	}
	t1 = (gema61((T4)123,
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(2)),
(T4)(geint32(0)),
(T4)(geint32(2)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(11)),
(T4)(geint32(25)),
(T4)(geint32(25)),
(T4)(geint32(26)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(26)),
(T4)(geint32(11)),
(T4)(geint32(38)),
(T4)(geint32(72)),
(T4)(geint32(72)),
(T4)(geint32(11)),
(T4)(geint32(64)),
(T4)(geint32(38)),
(T4)(geint32(67)),
(T4)(geint32(67)),
(T4)(geint32(67)),
(T4)(geint32(67)),
(T4)(geint32(67)),
(T4)(geint32(68)),
(T4)(geint32(68)),
(T4)(geint32(68)),
(T4)(geint32(68)),
(T4)(geint32(68)),
(T4)(geint32(69)),
(T4)(geint32(69)),
(T4)(geint32(69)),
(T4)(geint32(69)),
(T4)(geint32(69)),
(T4)(geint32(70)),
(T4)(geint32(70)),
(T4)(geint32(70)),
(T4)(geint32(70)),
(T4)(geint32(70)),
(T4)(geint32(71)),
(T4)(geint32(60)),
(T4)(geint32(59)),
(T4)(geint32(71)),
(T4)(geint32(71)),
(T4)(geint32(73)),
(T4)(geint32(73)),
(T4)(geint32(73)),
(T4)(geint32(73)),
(T4)(geint32(73)),
(T4)(geint32(74)),
(T4)(geint32(56)),
(T4)(geint32(74)),
(T4)(geint32(74)),
(T4)(geint32(74)),
(T4)(geint32(55)),
(T4)(geint32(54)),
(T4)(geint32(53)),
(T4)(geint32(52)),
(T4)(geint32(51)),
(T4)(geint32(49)),
(T4)(geint32(48)),
(T4)(geint32(47)),
(T4)(geint32(46)),
(T4)(geint32(45)),
(T4)(geint32(44)),
(T4)(geint32(43)),
(T4)(geint32(42)),
(T4)(geint32(40)),
(T4)(geint32(39)),
(T4)(geint32(37)),
(T4)(geint32(36)),
(T4)(geint32(35)),
(T4)(geint32(33)),
(T4)(geint32(29)),
(T4)(geint32(28)),
(T4)(geint32(27)),
(T4)(geint32(24)),
(T4)(geint32(21)),
(T4)(geint32(19)),
(T4)(geint32(18)),
(T4)(geint32(16)),
(T4)(geint32(13)),
(T4)(geint32(9)),
(T4)(geint32(7)),
(T4)(geint32(6)),
(T4)(geint32(5)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(2147483647))));
	R = (T21f169(C, t1));
	ge54ov1519 = R;
	return R;
}

/* GEPP_PARSER.yy_nxt_template */
unsigned char ge54os1518 = '\0';
T0* ge54ov1518;
T0* T21f156(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge54os1518) {
		return ge54ov1518;
	} else {
		ge54os1518 = '\1';
	}
	t1 = (gema61((T4)123,
(T4)(geint32(0)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(10)),
(T4)(geint32(66)),
(T4)(geint32(11)),
(T4)(geint32(12)),
(T4)(geint32(13)),
(T4)(geint32(14)),
(T4)(geint32(15)),
(T4)(geint32(12)),
(T4)(geint32(16)),
(T4)(geint32(17)),
(T4)(geint32(17)),
(T4)(geint32(17)),
(T4)(geint32(17)),
(T4)(geint32(17)),
(T4)(geint32(17)),
(T4)(geint32(17)),
(T4)(geint32(17)),
(T4)(geint32(17)),
(T4)(geint32(17)),
(T4)(geint32(18)),
(T4)(geint32(23)),
(T4)(geint32(36)),
(T4)(geint32(37)),
(T4)(geint32(38)),
(T4)(geint32(24)),
(T4)(geint32(25)),
(T4)(geint32(39)),
(T4)(geint32(26)),
(T4)(geint32(45)),
(T4)(geint32(31)),
(T4)(geint32(31)),
(T4)(geint32(27)),
(T4)(geint32(65)),
(T4)(geint32(46)),
(T4)(geint32(8)),
(T4)(geint32(8)),
(T4)(geint32(8)),
(T4)(geint32(8)),
(T4)(geint32(8)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(19)),
(T4)(geint32(19)),
(T4)(geint32(19)),
(T4)(geint32(19)),
(T4)(geint32(19)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(29)),
(T4)(geint32(64)),
(T4)(geint32(63)),
(T4)(geint32(29)),
(T4)(geint32(29)),
(T4)(geint32(33)),
(T4)(geint32(33)),
(T4)(geint32(33)),
(T4)(geint32(33)),
(T4)(geint32(33)),
(T4)(geint32(23)),
(T4)(geint32(62)),
(T4)(geint32(23)),
(T4)(geint32(23)),
(T4)(geint32(23)),
(T4)(geint32(61)),
(T4)(geint32(60)),
(T4)(geint32(59)),
(T4)(geint32(58)),
(T4)(geint32(57)),
(T4)(geint32(56)),
(T4)(geint32(55)),
(T4)(geint32(54)),
(T4)(geint32(53)),
(T4)(geint32(52)),
(T4)(geint32(51)),
(T4)(geint32(50)),
(T4)(geint32(49)),
(T4)(geint32(48)),
(T4)(geint32(47)),
(T4)(geint32(44)),
(T4)(geint32(43)),
(T4)(geint32(42)),
(T4)(geint32(34)),
(T4)(geint32(41)),
(T4)(geint32(28)),
(T4)(geint32(40)),
(T4)(geint32(35)),
(T4)(geint32(22)),
(T4)(geint32(34)),
(T4)(geint32(32)),
(T4)(geint32(30)),
(T4)(geint32(28)),
(T4)(geint32(22)),
(T4)(geint32(66)),
(T4)(geint32(20)),
(T4)(geint32(20)),
(T4)(geint32(7)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(2147483647))));
	R = (T21f169(C, t1));
	ge54ov1518 = R;
	return R;
}

/* GEPP_PARSER.empty_buffer */
unsigned char ge141os1679 = '\0';
T0* ge141ov1679;
T0* T21f12(T0* C)
{
	T0* R = 0;
	if (ge141os1679) {
		return ge141ov1679;
	} else {
		ge141os1679 = '\1';
	}
	R = T40c12(gems("", 0));
	ge141ov1679 = R;
	return R;
}

/* YY_BUFFER.make */
T0* T40c12(T0* a1)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T40));
	((T40*)(C))->id = 40;
	t1 = (((T16*)(a1))->a2);
	l2 = ((T4)((t1)+((T4)(geint32(2)))));
	l1 = (T40f9(C, l2));
	T79f12(l1, a1, (T4)(geint32(1)));
	t1 = ((T4)((l2)-((T4)(geint32(1)))));
	T79f9(l1, (T1)('\000'), t1);
	T79f9(l1, (T1)('\000'), l2);
	T40f17(C, l1);
	return C;
}

/* YY_BUFFER.make_from_buffer */
void T40f17(T0* C, T0* a1)
{
	T4 t1;
	t1 = (T79f4(a1));
	((T40*)(C))->a11 = ((T4)((t1)-((T4)(geint32(2)))));
	((T40*)(C))->a7 = (((T40*)(C))->a11);
	((T40*)(C))->a1 = (a1);
	((T40*)(C))->a2 = ((T4)(geint32(1)));
	((T40*)(C))->a3 = ((T4)(geint32(1)));
	((T40*)(C))->a4 = ((T4)(geint32(1)));
	((T40*)(C))->a5 = ((T4)(geint32(1)));
	((T40*)(C))->a6 = (EIF_TRUE);
}

/* KL_CHARACTER_BUFFER.fill_from_string */
void T79f12(T0* C, T0* a1, T4 a2)
{
	T4 l1 = 0;
	T2 t1;
	T4 t2;
	l1 = (((T16*)(a1))->a2);
	t1 = (T4f1(&l1, (T4)(geint32(0))));
	if (t1) {
		t1 = ((((T79*)(C))->a3)!=(EIF_VOID));
		if (t1) {
			t2 = ((T4)((a2)+((T4)(geint32(1)))));
			T16f40(((T79*)(C))->a6, a1, (T4)(geint32(1)), l1, t2);
		} else {
			T16f40(((T79*)(C))->a6, a1, (T4)(geint32(1)), l1, a2);
		}
	}
}

/* YY_BUFFER.new_default_buffer */
T0* T40f9(T0* C, T4 a1)
{
	T0* R = 0;
	R = T79c8(a1);
	return R;
}

/* UT_ERROR_HANDLER.make_standard */
T0* T20c6()
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T20));
	((T20*)(C))->id = 20;
	t1 = (T20f2(C));
	((T20*)(C))->a1 = (T27f3(t1));
	t1 = (T20f2(C));
	((T20*)(C))->a3 = (T27f3(t1));
	t1 = (T20f2(C));
	((T20*)(C))->a4 = (T27f1(t1));
	return C;
}

/* UT_ERROR_HANDLER.std */
T0* T20f2(T0* C)
{
	T0* R = 0;
	if (ge292os1303) {
		return ge292ov1303;
	} else {
		ge292os1303 = '\1';
	}
	R = T27c4();
	ge292ov1303 = R;
	return R;
}

/* KL_ARGUMENTS.set_program_name */
void T19f5(T0* C, T0* a1)
{
	((T19*)(C))->a3 = (a1);
}

/* GEPP.arguments */
unsigned char ge308os1306 = '\0';
T0* ge308ov1306;
T0* T18f1(T0* C)
{
	T0* R = 0;
	if (ge308os1306) {
		return ge308ov1306;
	} else {
		ge308os1306 = '\1';
	}
	R = T19c4();
	ge308ov1306 = R;
	return R;
}

/* KL_ARGUMENTS.make */
T0* T19c4()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T19));
	((T19*)(C))->id = 19;
	((T19*)(C))->a3 = (T19f2(C, (T4)(geint32(0))));
	return C;
}

/* GEPP.resurrect_code */
void T18f11(T0* C)
{
	T0* l1 = 0;
	l1 = T22c2();
}

/* GEPP_TOO_MANY_INCLUDES_ERROR.default_message */
T0* T52f1(T0* C)
{
	T0* R = 0;
	R = (T52f3(C, ge56ov3310));
	return R;
}

/* GEPP_TOO_MANY_INCLUDES_ERROR.message */
T0* T52f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T52f4(C));
	R = (T54f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f5(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T52f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T54f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f5(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T52f4(C));
					l1 = (T54f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f5(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T52f4(C));
									T54f13(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f5(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T52f4(C));
					t2 = (T54f4(t1, l1));
					if (t2) {
						l3 = (T16f11(l1));
						t2 = (T60f4(((T52*)(C))->a5, l3));
						if (t2) {
							t1 = (T52f4(C));
							t5 = (T60f5(((T52*)(C))->a5, l3));
							R = (T54f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T52f4(C));
								t5 = (T52f6(C));
								t5 = (((T19*)(t5))->a3);
								R = (T54f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T52f4(C));
								R = (T54f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T52f4(C));
						R = (T54f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* GEPP_TOO_MANY_INCLUDES_ERROR.arguments */
T0* T52f6(T0* C)
{
	T0* R = 0;
	if (ge308os1306) {
		return ge308ov1306;
	} else {
		ge308os1306 = '\1';
	}
	R = T19c4();
	ge308ov1306 = R;
	return R;
}

/* ARRAY [STRING].valid_index */
T2 T60f4(T0* C, T4 a1)
{
	T2 R = 0;
	T2 t1;
	t1 = (T4f6(&(((T60*)(C))->a2), a1));
	if (t1) {
		R = (T4f6(&a1, ((T60*)(C))->a3));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* STRING.to_integer */
T4 T16f11(T0* C)
{
	T4 R = 0;
	T0* t1;
	T4 t2;
	t1 = (T16f14(C));
	t2 = ((T4)(geint32(3)));
	T76f16(t1, C, t2);
	t1 = (T16f14(C));
	R = (T76f1(t1));
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
T4 T76f1(T0* C)
{
	T4 R = 0;
	T4 l1 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	l1 = ((T4)(((T76*)(C))->a2));
	l1 = ((T4)((l1)*((T4)(geint32(10)))));
	t1 = ((((T76*)(C))->a3)==((T4)(geint32(1))));
	if (t1) {
		t2 = ((T4)(-(l1)));
		t3 = ((T4)(((T76*)(C))->a4));
		R = ((T4)((t2)-(t3)));
	} else {
		t2 = ((T4)(((T76*)(C))->a4));
		R = ((T4)((l1)+(t2)));
	}
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
void T76f16(T0* C, T0* a1, T4 a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T1 t2;
	T76f21(C, a2);
	l1 = ((T4)(geint32(1)));
	l2 = (((T16*)(a1))->a2);
	t1 = (T4f1(&l1, l2));
	if (!(t1)) {
		t1 = ((((T76*)(C))->a6)==((T4)(geint32(4))));
	}
	if (!(t1)) {
		t1 = ((((T76*)(C))->a6)==((T4)(geint32(5))));
	}
	while (!(t1)) {
		t2 = (T16f5(a1, l1));
		T76f22(C, t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
		if (!(t1)) {
			t1 = ((((T76*)(C))->a6)==((T4)(geint32(4))));
		}
		if (!(t1)) {
			t1 = ((((T76*)(C))->a6)==((T4)(geint32(5))));
		}
	}
}

/* STRING_TO_INTEGER_CONVERTOR.parse_character */
void T76f22(T0* C, T1 a1)
{
	T11 l1 = 0;
	T11 l2 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	T11 t4;
	t1 = ((((T76*)(C))->a6)!=((T4)(geint32(4))));
	if (t1) {
		t1 = ((((T76*)(C))->a6)!=((T4)(geint32(5))));
	}
	if (t1) {
		t2 = (T4)(geint32(0));
		l1 = (T4f16(&t2));
		t2 = (T4)(geint32(0));
		l2 = (T4f16(&t2));
		switch (((T76*)(C))->a6) {
		case (T4)(T4)(geint32(0)):
			t1 = (T1f4(&a1));
			if (t1) {
				((T76*)(C))->a6 = ((T4)(geint32(2)));
				((T76*)(C))->a2 = ((T11)(genat64(0)));
				t2 = ((T4)(a1));
				t2 = ((T4)((t2)-((T4)(geint32(48)))));
				((T76*)(C))->a4 = (T4f16(&t2));
			} else {
				t1 = ((a1)==((T1)('-')));
				if (!(t1)) {
					t1 = ((a1)==((T1)('+')));
				}
				if (t1) {
					((T76*)(C))->a6 = ((T4)(geint32(1)));
					t1 = ((a1)==((T1)('-')));
					if (t1) {
						((T76*)(C))->a3 = ((T4)(geint32(1)));
					} else {
						((T76*)(C))->a3 = ((T4)(geint32(0)));
					}
				} else {
					if (((T76*)(C))->a9) {
						t1 = (T16f24(((T76*)(C))->a7, a1));
					} else {
						t1 = EIF_FALSE;
					}
					if (t1) {
					} else {
						((T76*)(C))->a6 = ((T4)(geint32(4)));
					}
				}
			}
			break;
		case (T4)(T4)(geint32(1)):
			t1 = (T1f4(&a1));
			if (t1) {
				((T76*)(C))->a2 = ((T11)(genat64(0)));
				t2 = ((T4)(a1));
				t2 = ((T4)((t2)-((T4)(geint32(48)))));
				((T76*)(C))->a4 = (T4f16(&t2));
				t1 = ((((T76*)(C))->a11)!=((T4)(geint32(0))));
				if (t1) {
					t3 = (T76f13(C));
					((T76*)(C))->a12 = (T85f1(t3, ((T76*)(C))->a2, ((T76*)(C))->a4, ((T76*)(C))->a11, ((T76*)(C))->a3));
					if (((T76*)(C))->a12) {
						((T76*)(C))->a2 = (l1);
						((T76*)(C))->a4 = (l2);
						((T76*)(C))->a6 = ((T4)(geint32(5)));
					}
				}
				((T76*)(C))->a6 = ((T4)(geint32(2)));
			} else {
				((T76*)(C))->a6 = ((T4)(geint32(4)));
			}
			break;
		case (T4)(T4)(geint32(2)):
			t1 = (T1f4(&a1));
			if (t1) {
				l1 = (((T76*)(C))->a2);
				l2 = (((T76*)(C))->a4);
				t4 = ((T11)((((T76*)(C))->a2)*((T11)(genat64(10)))));
				((T76*)(C))->a2 = ((T11)((t4)+(((T76*)(C))->a4)));
				t2 = ((T4)(a1));
				t2 = ((T4)((t2)-((T4)(geint32(48)))));
				((T76*)(C))->a4 = (T4f16(&t2));
				t1 = ((((T76*)(C))->a11)!=((T4)(geint32(0))));
				if (t1) {
					t3 = (T76f13(C));
					((T76*)(C))->a12 = (T85f1(t3, ((T76*)(C))->a2, ((T76*)(C))->a4, ((T76*)(C))->a11, ((T76*)(C))->a3));
					t1 = (T76f14(C));
					if (t1) {
						((T76*)(C))->a6 = ((T4)(geint32(5)));
						((T76*)(C))->a2 = (l1);
						((T76*)(C))->a4 = (l2);
					}
				}
			} else {
				if (((T76*)(C))->a10) {
					t1 = (T16f24(((T76*)(C))->a8, a1));
				} else {
					t1 = EIF_FALSE;
				}
				if (t1) {
					((T76*)(C))->a6 = ((T4)(geint32(3)));
				} else {
					((T76*)(C))->a6 = ((T4)(geint32(4)));
				}
			}
			break;
		case (T4)(T4)(geint32(3)):
			if (((T76*)(C))->a10) {
				t1 = (T16f24(((T76*)(C))->a8, a1));
			} else {
				t1 = EIF_FALSE;
			}
			if (t1) {
			} else {
				((T76*)(C))->a6 = ((T4)(geint32(4)));
			}
			break;
		default:
			break;
		}
	}
}

/* STRING_TO_INTEGER_CONVERTOR.overflowed */
T2 T76f14(T0* C)
{
	T2 R = 0;
	if (((T76*)(C))->a12) {
		R = ((((T76*)(C))->a3)==((T4)(geint32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* INTEGER_OVERFLOW_CHECKER.will_overflow */
T2 T85f1(T0* C, T11 a1, T11 a2, T4 a3, T4 a4)
{
	T2 R = 0;
	T4 l1 = 0;
	T2 t1;
	T4 t2;
	T11 t3;
	t1 = ((a3)==((T4)(geint32(0))));
	if (t1) {
		R = (EIF_FALSE);
	} else {
		t1 = ((a3)==((T4)(geint32(1))));
		if (!(t1)) {
			t1 = ((a3)==((T4)(geint32(2))));
		}
		if (!(t1)) {
			t1 = ((a3)==((T4)(geint32(3))));
		}
		if (!(t1)) {
			t1 = ((a3)==((T4)(geint32(4))));
		}
		if (t1) {
			t2 = ((T4)((a4)*((T4)(geint32(4)))));
			l1 = ((T4)((t2)+(a3)));
			t3 = (T89f4(((T85*)(C))->a7, l1));
			t1 = (T11f4(&a1, t3));
			if (!(t1)) {
				t3 = (T89f4(((T85*)(C))->a7, l1));
				t1 = ((a1)==(t3));
				if (t1) {
					t3 = (T89f4(((T85*)(C))->a8, l1));
					R = (T11f4(&a2, t3));
				} else {
					R = EIF_FALSE;
				}
			} else {
				R = EIF_TRUE;
			}
		} else {
			l1 = ((T4)((a3)-((T4)(geint32(10)))));
			t1 = ((a4)==((T4)(geint32(1))));
			if (t1) {
				t1 = (T11f4(&a1, (T11)(genat64(0))));
				if (!(t1)) {
					R = (T11f4(&a2, (T11)(genat64(0))));
				} else {
					R = EIF_TRUE;
				}
			} else {
				t3 = (T89f4(((T85*)(C))->a10, l1));
				t1 = (T11f4(&a1, t3));
				if (!(t1)) {
					t3 = (T89f4(((T85*)(C))->a10, l1));
					t1 = ((a1)==(t3));
					if (t1) {
						t3 = (T89f4(((T85*)(C))->a11, l1));
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
T2 T11f4(T11* C, T11 a1)
{
	T2 R = 0;
	R = ((T2)((a1)<(*C)));
	return R;
}

/* ARRAY [NATURAL_64].item */
T11 T89f4(T0* C, T4 a1)
{
	T11 R = 0;
	T4 t1;
	t1 = ((T4)((a1)-(((T89*)(C))->a2)));
	R = (((T88*)(((T89*)(C))->a1))->a2[t1]);
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
unsigned char ge528os4701 = '\0';
T0* ge528ov4701;
T0* T76f13(T0* C)
{
	T0* R = 0;
	if (ge528os4701) {
		return ge528ov4701;
	} else {
		ge528os4701 = '\1';
	}
	R = T85c13();
	ge528ov4701 = R;
	return R;
}

/* INTEGER_OVERFLOW_CHECKER.make */
T0* T85c13()
{
	T4 t1;
	T5 t2;
	T11 t3;
	T6 t4;
	T7 t5;
	T8 t6;
	T9 t7;
	T10 t8;
	T0* C;
	C = (T0*)gealloc(sizeof(T85));
	((T85*)(C))->id = 85;
	t1 = (T4)(geint32(4));
	t1 = ((T4)((t1)*((T4)(geint32(2)))));
	((T85*)(C))->a7 = T89c5((T4)(geint32(1)), t1);
	t1 = (T4)(geint32(4));
	t1 = ((T4)((t1)*((T4)(geint32(2)))));
	((T85*)(C))->a8 = T89c5((T4)(geint32(1)), t1);
	t2 = ((T5)(geint8(127)));
	t2 = ((T5)((t2)/((T5)(geint8(10)))));
	t3 = (T5f3(&t2));
	T89f6(((T85*)(C))->a7, t3, (T4)(geint32(1)));
	t2 = ((T5)(geint8(127)));
	t2 = ((T5)((t2)%((T5)(geint8(10)))));
	t3 = (T5f3(&t2));
	T89f6(((T85*)(C))->a8, t3, (T4)(geint32(1)));
	t4 = ((T6)(geint16(32767)));
	t4 = ((T6)((t4)/((T6)(geint16(10)))));
	t3 = (T6f3(&t4));
	T89f6(((T85*)(C))->a7, t3, (T4)(geint32(2)));
	t4 = ((T6)(geint16(32767)));
	t4 = ((T6)((t4)%((T6)(geint16(10)))));
	t3 = (T6f3(&t4));
	T89f6(((T85*)(C))->a8, t3, (T4)(geint32(2)));
	t1 = ((T4)(geint32(2147483647)));
	t1 = ((T4)((t1)/((T4)(geint32(10)))));
	t3 = (T4f16(&t1));
	T89f6(((T85*)(C))->a7, t3, (T4)(geint32(3)));
	t1 = ((T4)(geint32(2147483647)));
	t1 = ((T4)((t1)%((T4)(geint32(10)))));
	t3 = (T4f16(&t1));
	T89f6(((T85*)(C))->a8, t3, (T4)(geint32(3)));
	t5 = ((T7)(geint64(9223372036854775807)));
	t5 = ((T7)((t5)/((T7)(geint64(10)))));
	t3 = (T7f3(&t5));
	T89f6(((T85*)(C))->a7, t3, (T4)(geint32(4)));
	t5 = ((T7)(geint64(9223372036854775807)));
	t5 = ((T7)((t5)%((T7)(geint64(10)))));
	t3 = (T7f3(&t5));
	T89f6(((T85*)(C))->a8, t3, (T4)(geint32(4)));
	t2 = ((T5)(geint8(-128)));
	t2 = ((T5)((t2)/((T5)(geint8(10)))));
	t2 = ((T5)(-(t2)));
	t3 = (T5f3(&t2));
	T89f6(((T85*)(C))->a7, t3, (T4)(geint32(5)));
	t2 = ((T5)(geint8(-128)));
	t2 = ((T5)((t2)%((T5)(geint8(10)))));
	t2 = ((T5)(-(t2)));
	t3 = (T5f3(&t2));
	T89f6(((T85*)(C))->a8, t3, (T4)(geint32(5)));
	t4 = ((T6)(geint16(-32768)));
	t4 = ((T6)((t4)/((T6)(geint16(10)))));
	t4 = ((T6)(-(t4)));
	t3 = (T6f3(&t4));
	T89f6(((T85*)(C))->a7, t3, (T4)(geint32(6)));
	t4 = ((T6)(geint16(-32768)));
	t4 = ((T6)((t4)%((T6)(geint16(10)))));
	t4 = ((T6)(-(t4)));
	t3 = (T6f3(&t4));
	T89f6(((T85*)(C))->a8, t3, (T4)(geint32(6)));
	t1 = ((T4)(geint32(-2147483647)-1));
	t1 = ((T4)((t1)/((T4)(geint32(10)))));
	t1 = ((T4)(-(t1)));
	t3 = (T4f16(&t1));
	T89f6(((T85*)(C))->a7, t3, (T4)(geint32(7)));
	t1 = ((T4)(geint32(-2147483647)-1));
	t1 = ((T4)((t1)%((T4)(geint32(10)))));
	t1 = ((T4)(-(t1)));
	t3 = (T4f16(&t1));
	T89f6(((T85*)(C))->a8, t3, (T4)(geint32(7)));
	t5 = ((T7)(geint64(-9223372036854775807)-1));
	t5 = ((T7)((t5)/((T7)(geint64(10)))));
	t5 = ((T7)(-(t5)));
	t3 = (T7f3(&t5));
	T89f6(((T85*)(C))->a7, t3, (T4)(geint32(8)));
	t5 = ((T7)(geint64(-9223372036854775807)-1));
	t5 = ((T7)((t5)%((T7)(geint64(10)))));
	t5 = ((T7)(-(t5)));
	t3 = (T7f3(&t5));
	T89f6(((T85*)(C))->a8, t3, (T4)(geint32(8)));
	((T85*)(C))->a10 = T89c5((T4)(geint32(1)), (T4)(geint32(4)));
	((T85*)(C))->a11 = T89c5((T4)(geint32(1)), (T4)(geint32(4)));
	t6 = ((T8)(genat8(255)));
	t6 = ((T8)((t6)/((T8)(genat8(10)))));
	t3 = (T8f10(&t6));
	T89f6(((T85*)(C))->a10, t3, (T4)(geint32(1)));
	t6 = ((T8)(genat8(255)));
	t6 = ((T8)((t6)%((T8)(genat8(10)))));
	t3 = (T8f10(&t6));
	T89f6(((T85*)(C))->a11, t3, (T4)(geint32(1)));
	t7 = ((T9)(genat16(65535)));
	t7 = ((T9)((t7)/((T9)(genat16(10)))));
	t3 = (T9f3(&t7));
	T89f6(((T85*)(C))->a10, t3, (T4)(geint32(2)));
	t7 = ((T9)(genat16(65535)));
	t7 = ((T9)((t7)%((T9)(genat16(10)))));
	t3 = (T9f3(&t7));
	T89f6(((T85*)(C))->a11, t3, (T4)(geint32(2)));
	t8 = ((T10)(genat32(4294967295)));
	t8 = ((T10)((t8)/((T10)(genat32(10)))));
	t3 = (T10f3(&t8));
	T89f6(((T85*)(C))->a10, t3, (T4)(geint32(3)));
	t8 = ((T10)(genat32(4294967295)));
	t8 = ((T10)((t8)%((T10)(genat32(10)))));
	t3 = (T10f3(&t8));
	T89f6(((T85*)(C))->a11, t3, (T4)(geint32(3)));
	t3 = ((T11)(genat64(18446744073709551615)));
	t3 = ((T11)((t3)/((T11)(genat64(10)))));
	t3 = (T11f7(&t3));
	T89f6(((T85*)(C))->a10, t3, (T4)(geint32(4)));
	t3 = ((T11)(genat64(18446744073709551615)));
	t3 = ((T11)((t3)%((T11)(genat64(10)))));
	t3 = (T11f7(&t3));
	T89f6(((T85*)(C))->a11, t3, (T4)(geint32(4)));
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
T11 T10f3(T10* C)
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
T11 T6f3(T6* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* ARRAY [NATURAL_64].put */
void T89f6(T0* C, T11 a1, T4 a2)
{
	T4 t1;
	t1 = ((T4)((a2)-(((T89*)(C))->a2)));
	((T88*)(((T89*)(C))->a1))->a2[t1] = (a1);
}

/* INTEGER_8.to_natural_64 */
T11 T5f3(T5* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* ARRAY [NATURAL_64].make */
T0* T89c5(T4 a1, T4 a2)
{
	T2 t1;
	T4 t2;
	T0* C;
	C = (T0*)gealloc(sizeof(T89));
	((T89*)(C))->id = 89;
	((T89*)(C))->a2 = (a1);
	((T89*)(C))->a3 = (a2);
	t1 = (T4f6(&a1, a2));
	if (t1) {
		t2 = ((T4)((a2)-(a1)));
		t2 = ((T4)((t2)+((T4)(geint32(1)))));
		T89f7(C, t2);
	} else {
		T89f7(C, (T4)(geint32(0)));
	}
	return C;
}

/* ARRAY [NATURAL_64].make_area */
void T89f7(T0* C, T4 a1)
{
	((T89*)(C))->a1 = T88c2(a1);
}

/* SPECIAL [NATURAL_64].make */
T0* T88c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T88)+a1*sizeof(T11));
	((T88*)(C))->a1 = a1;
	((T88*)(C))->id = 88;
	return C;
}

/* STRING.has */
T2 T16f24(T0* C, T1 a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T1 t2;
	l2 = (((T16*)(C))->a2);
	t1 = (T4f1(&l2, (T4)(geint32(0))));
	if (t1) {
		l3 = (((T16*)(C))->a1);
		t1 = ((l1)==(l2));
		if (!(t1)) {
			t2 = (((T15*)(l3))->a2[l1]);
			t1 = ((t2)==(a1));
		}
		while (!(t1)) {
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = ((l1)==(l2));
			if (!(t1)) {
				t2 = (((T15*)(l3))->a2[l1]);
				t1 = ((t2)==(a1));
			}
		}
		R = ((T2)((l1)<(l2)));
	}
	return R;
}

/* CHARACTER.is_digit */
T2 T1f4(T1* C)
{
	T2 R = 0;
	T1 t1;
	T4 t2;
	T8 t3;
	t1 = (*C);
	t2 = ((T4)(t1));
	t3 = (T1f6(C, t2));
	t3 = (T8f1(&t3, (T5)(geint8(0x04))));
	R = (T8f2(&t3, (T8)(genat8(0))));
	return R;
}

/* NATURAL_8.infix ">" */
T2 T8f2(T8* C, T8 a1)
{
	T2 R = 0;
	R = ((T2)((a1)<(*C)));
	return R;
}

/* NATURAL_8.infix "&" */
T8 T8f1(T8* C, T8 a1)
{
	T8 R = 0;
	R = ((T8)((*C)&(a1)));
	return R;
}

/* CHARACTER.character_types */
T8 T1f6(T1* C, T4 a1)
{
	T8 R = 0;
	T2 t1;
	T0* t2;
	t1 = ((T2)((a1)<((T4)(geint32(256)))));
	if (t1) {
		t2 = (T1f8(C));
		R = (((T86*)(t2))->a2[a1]);
	}
	return R;
}

/* CHARACTER.internal_character_types */
unsigned char ge35os35 = '\0';
T0* ge35ov35;
T0* T1f8(T1* C)
{
	T0* R = 0;
	T8 t1;
	if (ge35os35) {
		return ge35ov35;
	} else {
		ge35os35 = '\1';
	}
	R = T86c2((T4)(geint32(256)));
	((T86*)(R))->a2[(T4)(geint32(0))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(1))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(2))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(3))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(4))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(5))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(6))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(7))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(8))] = ((T5)(geint8(0x20)));
	t1 = (T5)(geint8(0x20));
	t1 = (T8f3(&t1, (T5)(geint8(0x08))));
	((T86*)(R))->a2[(T4)(geint32(9))] = (t1);
	t1 = (T5)(geint8(0x20));
	t1 = (T8f3(&t1, (T5)(geint8(0x08))));
	((T86*)(R))->a2[(T4)(geint32(10))] = (t1);
	t1 = (T5)(geint8(0x20));
	t1 = (T8f3(&t1, (T5)(geint8(0x08))));
	((T86*)(R))->a2[(T4)(geint32(11))] = (t1);
	t1 = (T5)(geint8(0x20));
	t1 = (T8f3(&t1, (T5)(geint8(0x08))));
	((T86*)(R))->a2[(T4)(geint32(12))] = (t1);
	t1 = (T5)(geint8(0x20));
	t1 = (T8f3(&t1, (T5)(geint8(0x08))));
	((T86*)(R))->a2[(T4)(geint32(13))] = (t1);
	((T86*)(R))->a2[(T4)(geint32(14))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(15))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(16))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(17))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(18))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(19))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(20))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(21))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(22))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(23))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(24))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(25))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(26))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(27))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(28))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(29))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(30))] = ((T5)(geint8(0x20)));
	((T86*)(R))->a2[(T4)(geint32(31))] = ((T5)(geint8(0x20)));
	t1 = (T5)(geint8(0x08));
	t1 = (T8f3(&t1, (T5)(geint8(0x80))));
	((T86*)(R))->a2[(T4)(geint32(32))] = (t1);
	((T86*)(R))->a2[(T4)(geint32(33))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(34))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(35))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(36))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(37))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(38))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(39))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(40))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(41))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(42))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(43))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(44))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(45))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(46))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(47))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(48))] = ((T5)(geint8(0x04)));
	((T86*)(R))->a2[(T4)(geint32(49))] = ((T5)(geint8(0x04)));
	((T86*)(R))->a2[(T4)(geint32(50))] = ((T5)(geint8(0x04)));
	((T86*)(R))->a2[(T4)(geint32(51))] = ((T5)(geint8(0x04)));
	((T86*)(R))->a2[(T4)(geint32(52))] = ((T5)(geint8(0x04)));
	((T86*)(R))->a2[(T4)(geint32(53))] = ((T5)(geint8(0x04)));
	((T86*)(R))->a2[(T4)(geint32(54))] = ((T5)(geint8(0x04)));
	((T86*)(R))->a2[(T4)(geint32(55))] = ((T5)(geint8(0x04)));
	((T86*)(R))->a2[(T4)(geint32(56))] = ((T5)(geint8(0x04)));
	((T86*)(R))->a2[(T4)(geint32(57))] = ((T5)(geint8(0x04)));
	((T86*)(R))->a2[(T4)(geint32(58))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(59))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(60))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(61))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(62))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(63))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(64))] = ((T5)(geint8(0x10)));
	t1 = (T5)(geint8(0x01));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T86*)(R))->a2[(T4)(geint32(65))] = (t1);
	t1 = (T5)(geint8(0x01));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T86*)(R))->a2[(T4)(geint32(66))] = (t1);
	t1 = (T5)(geint8(0x01));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T86*)(R))->a2[(T4)(geint32(67))] = (t1);
	t1 = (T5)(geint8(0x01));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T86*)(R))->a2[(T4)(geint32(68))] = (t1);
	t1 = (T5)(geint8(0x01));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T86*)(R))->a2[(T4)(geint32(69))] = (t1);
	t1 = (T5)(geint8(0x01));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T86*)(R))->a2[(T4)(geint32(70))] = (t1);
	((T86*)(R))->a2[(T4)(geint32(71))] = ((T5)(geint8(0x01)));
	((T86*)(R))->a2[(T4)(geint32(72))] = ((T5)(geint8(0x01)));
	((T86*)(R))->a2[(T4)(geint32(73))] = ((T5)(geint8(0x01)));
	((T86*)(R))->a2[(T4)(geint32(74))] = ((T5)(geint8(0x01)));
	((T86*)(R))->a2[(T4)(geint32(75))] = ((T5)(geint8(0x01)));
	((T86*)(R))->a2[(T4)(geint32(76))] = ((T5)(geint8(0x01)));
	((T86*)(R))->a2[(T4)(geint32(77))] = ((T5)(geint8(0x01)));
	((T86*)(R))->a2[(T4)(geint32(78))] = ((T5)(geint8(0x01)));
	((T86*)(R))->a2[(T4)(geint32(79))] = ((T5)(geint8(0x01)));
	((T86*)(R))->a2[(T4)(geint32(80))] = ((T5)(geint8(0x01)));
	((T86*)(R))->a2[(T4)(geint32(81))] = ((T5)(geint8(0x01)));
	((T86*)(R))->a2[(T4)(geint32(82))] = ((T5)(geint8(0x01)));
	((T86*)(R))->a2[(T4)(geint32(83))] = ((T5)(geint8(0x01)));
	((T86*)(R))->a2[(T4)(geint32(84))] = ((T5)(geint8(0x01)));
	((T86*)(R))->a2[(T4)(geint32(85))] = ((T5)(geint8(0x01)));
	((T86*)(R))->a2[(T4)(geint32(86))] = ((T5)(geint8(0x01)));
	((T86*)(R))->a2[(T4)(geint32(87))] = ((T5)(geint8(0x01)));
	((T86*)(R))->a2[(T4)(geint32(88))] = ((T5)(geint8(0x01)));
	((T86*)(R))->a2[(T4)(geint32(89))] = ((T5)(geint8(0x01)));
	((T86*)(R))->a2[(T4)(geint32(90))] = ((T5)(geint8(0x01)));
	((T86*)(R))->a2[(T4)(geint32(91))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(92))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(93))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(94))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(95))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(96))] = ((T5)(geint8(0x10)));
	t1 = (T5)(geint8(0x02));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T86*)(R))->a2[(T4)(geint32(97))] = (t1);
	t1 = (T5)(geint8(0x02));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T86*)(R))->a2[(T4)(geint32(98))] = (t1);
	t1 = (T5)(geint8(0x02));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T86*)(R))->a2[(T4)(geint32(99))] = (t1);
	t1 = (T5)(geint8(0x02));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T86*)(R))->a2[(T4)(geint32(100))] = (t1);
	t1 = (T5)(geint8(0x02));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T86*)(R))->a2[(T4)(geint32(101))] = (t1);
	t1 = (T5)(geint8(0x02));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T86*)(R))->a2[(T4)(geint32(102))] = (t1);
	((T86*)(R))->a2[(T4)(geint32(103))] = ((T5)(geint8(0x02)));
	((T86*)(R))->a2[(T4)(geint32(104))] = ((T5)(geint8(0x02)));
	((T86*)(R))->a2[(T4)(geint32(105))] = ((T5)(geint8(0x02)));
	((T86*)(R))->a2[(T4)(geint32(106))] = ((T5)(geint8(0x02)));
	((T86*)(R))->a2[(T4)(geint32(107))] = ((T5)(geint8(0x02)));
	((T86*)(R))->a2[(T4)(geint32(108))] = ((T5)(geint8(0x02)));
	((T86*)(R))->a2[(T4)(geint32(109))] = ((T5)(geint8(0x02)));
	((T86*)(R))->a2[(T4)(geint32(110))] = ((T5)(geint8(0x02)));
	((T86*)(R))->a2[(T4)(geint32(111))] = ((T5)(geint8(0x02)));
	((T86*)(R))->a2[(T4)(geint32(112))] = ((T5)(geint8(0x02)));
	((T86*)(R))->a2[(T4)(geint32(113))] = ((T5)(geint8(0x02)));
	((T86*)(R))->a2[(T4)(geint32(114))] = ((T5)(geint8(0x02)));
	((T86*)(R))->a2[(T4)(geint32(115))] = ((T5)(geint8(0x02)));
	((T86*)(R))->a2[(T4)(geint32(116))] = ((T5)(geint8(0x02)));
	((T86*)(R))->a2[(T4)(geint32(117))] = ((T5)(geint8(0x02)));
	((T86*)(R))->a2[(T4)(geint32(118))] = ((T5)(geint8(0x02)));
	((T86*)(R))->a2[(T4)(geint32(119))] = ((T5)(geint8(0x02)));
	((T86*)(R))->a2[(T4)(geint32(120))] = ((T5)(geint8(0x02)));
	((T86*)(R))->a2[(T4)(geint32(121))] = ((T5)(geint8(0x02)));
	((T86*)(R))->a2[(T4)(geint32(122))] = ((T5)(geint8(0x02)));
	((T86*)(R))->a2[(T4)(geint32(123))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(124))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(125))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(126))] = ((T5)(geint8(0x10)));
	((T86*)(R))->a2[(T4)(geint32(127))] = ((T5)(geint8(0x20)));
	ge35ov35 = R;
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
T0* T86c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T86)+a1*sizeof(T8));
	((T86*)(C))->a1 = a1;
	((T86*)(C))->id = 86;
	return C;
}

/* INTEGER.to_natural_64 */
T11 T4f16(T4* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.reset */
void T76f21(T0* C, T4 a1)
{
	((T76*)(C))->a6 = ((T4)(geint32(0)));
	((T76*)(C))->a2 = ((T11)(genat64(0)));
	((T76*)(C))->a4 = ((T11)(genat64(0)));
	((T76*)(C))->a3 = ((T4)(geint32(0)));
	((T76*)(C))->a11 = (a1);
	((T76*)(C))->a12 = (EIF_FALSE);
}

/* STRING.ctoi_convertor */
unsigned char ge6os1167 = '\0';
T0* ge6ov1167;
T0* T16f14(T0* C)
{
	T0* R = 0;
	if (ge6os1167) {
		return ge6ov1167;
	} else {
		ge6os1167 = '\1';
	}
	R = T76c15();
	T76f17(R, gems(" ", 1));
	T76f18(R, gems(" ", 1));
	T76f19(R, EIF_TRUE);
	T76f20(R, EIF_TRUE);
	ge6ov1167 = R;
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
void T76f20(T0* C, T2 a1)
{
	((T76*)(C))->a10 = (a1);
}

/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
void T76f19(T0* C, T2 a1)
{
	((T76*)(C))->a9 = (a1);
}

/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
void T76f18(T0* C, T0* a1)
{
	((T76*)(C))->a8 = T16c38(a1);
}

/* STRING.make_from_string */
T0* T16c38(T0* a1)
{
	T2 t1;
	T0* t2;
	T0* C;
	C = (T0*)gealloc(sizeof(T16));
	((T16*)(C))->id = 16;
	t1 = ((C)!=(a1));
	if (t1) {
		t2 = (((T16*)(a1))->a1);
		((T16*)(C))->a1 = (T15f3(t2));
		((T16*)(C))->a2 = (((T16*)(a1))->a2);
		((T16*)(C))->a9 = ((T4)(geint32(0)));
	}
	return C;
}

/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
void T76f17(T0* C, T0* a1)
{
	((T76*)(C))->a7 = T16c38(a1);
}

/* STRING_TO_INTEGER_CONVERTOR.make */
T0* T76c15()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T76));
	((T76*)(C))->id = 76;
	T76f21(C, (T4)(geint32(0)));
	T76f17(C, gems(" ", 1));
	T76f18(C, gems(" ", 1));
	return C;
}

/* KL_STRING_ROUTINES.is_integer */
T2 T54f4(T0* C, T0* a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T1 l3 = 0;
	T2 t1;
	l2 = (((T16*)(a1))->a2);
	t1 = ((l2)==((T4)(geint32(0))));
	if (t1) {
		R = (EIF_FALSE);
	} else {
		R = (EIF_TRUE);
		l1 = ((T4)(geint32(1)));
		t1 = (T4f1(&l1, l2));
		while (!(t1)) {
			l3 = (T16f5(a1, l1));
			t1 = (T1f2(&l3, (T1)('0')));
			if (!(t1)) {
				t1 = (T1f3(&l3, (T1)('9')));
			}
			if (t1) {
				R = (EIF_FALSE);
				l1 = ((T4)((l2)+((T4)(geint32(1)))));
			} else {
				l1 = ((T4)((l1)+((T4)(geint32(1)))));
			}
			t1 = (T4f1(&l1, l2));
		}
	}
	return R;
}

/* CHARACTER.infix ">" */
T2 T1f3(T1* C, T1 a1)
{
	T2 R = 0;
	R = (T1f2(&a1, *C));
	return R;
}

/* CHARACTER.infix "<" */
T2 T1f2(T1* C, T1 a1)
{
	T2 R = 0;
	T4 t1;
	T4 t2;
	t1 = ((T4)(*C));
	t2 = ((T4)(a1));
	R = ((T2)((t1)<(t2)));
	return R;
}

/* GEPP_TOO_MANY_INCLUDES_ERROR.string_ */
T0* T52f4(T0* C)
{
	T0* R = 0;
	if (ge262os1508) {
		return ge262ov1508;
	} else {
		ge262os1508 = '\1';
	}
	R = T54c12();
	ge262ov1508 = R;
	return R;
}

/* UT_SYNTAX_ERROR.default_message */
T0* T51f1(T0* C)
{
	T0* R = 0;
	R = (T51f3(C, ge215ov3310));
	return R;
}

/* UT_SYNTAX_ERROR.message */
T0* T51f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T51f4(C));
	R = (T54f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f5(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T51f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T54f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f5(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T51f4(C));
					l1 = (T54f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f5(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T51f4(C));
									T54f13(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f5(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T51f4(C));
					t2 = (T54f4(t1, l1));
					if (t2) {
						l3 = (T16f11(l1));
						t2 = (T60f4(((T51*)(C))->a5, l3));
						if (t2) {
							t1 = (T51f4(C));
							t5 = (T60f5(((T51*)(C))->a5, l3));
							R = (T54f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T51f4(C));
								t5 = (T51f6(C));
								t5 = (((T19*)(t5))->a3);
								R = (T54f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T51f4(C));
								R = (T54f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T51f4(C));
						R = (T54f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* UT_SYNTAX_ERROR.arguments */
T0* T51f6(T0* C)
{
	T0* R = 0;
	if (ge308os1306) {
		return ge308ov1306;
	} else {
		ge308os1306 = '\1';
	}
	R = T19c4();
	ge308ov1306 = R;
	return R;
}

/* UT_SYNTAX_ERROR.string_ */
T0* T51f4(T0* C)
{
	T0* R = 0;
	if (ge262os1508) {
		return ge262ov1508;
	} else {
		ge262os1508 = '\1';
	}
	R = T54c12();
	ge262ov1508 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.default_message */
T0* T35f2(T0* C)
{
	T0* R = 0;
	R = (T35f4(C, ge209ov3310));
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.message */
T0* T35f4(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T35f5(C));
	R = (T54f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f5(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T35f5(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T54f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f5(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T35f5(C));
					l1 = (T54f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f5(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T35f5(C));
									T54f13(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f5(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T35f5(C));
					t2 = (T54f4(t1, l1));
					if (t2) {
						l3 = (T16f11(l1));
						t2 = (T60f4(((T35*)(C))->a1, l3));
						if (t2) {
							t1 = (T35f5(C));
							t5 = (T60f5(((T35*)(C))->a1, l3));
							R = (T54f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T35f5(C));
								t5 = (T35f6(C));
								t5 = (((T19*)(t5))->a3);
								R = (T54f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T35f5(C));
								R = (T54f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T35f5(C));
						R = (T54f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.arguments */
T0* T35f6(T0* C)
{
	T0* R = 0;
	if (ge308os1306) {
		return ge308ov1306;
	} else {
		ge308os1306 = '\1';
	}
	R = T19c4();
	ge308ov1306 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.string_ */
T0* T35f5(T0* C)
{
	T0* R = 0;
	if (ge262os1508) {
		return ge262ov1508;
	} else {
		ge262os1508 = '\1';
	}
	R = T54c12();
	ge262ov1508 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
T0* T34f2(T0* C)
{
	T0* R = 0;
	R = (T34f4(C, ge210ov3310));
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
T0* T34f4(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T34f5(C));
	R = (T54f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f5(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T34f5(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T54f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f5(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T34f5(C));
					l1 = (T54f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f5(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T34f5(C));
									T54f13(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f5(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T34f5(C));
					t2 = (T54f4(t1, l1));
					if (t2) {
						l3 = (T16f11(l1));
						t2 = (T60f4(((T34*)(C))->a1, l3));
						if (t2) {
							t1 = (T34f5(C));
							t5 = (T60f5(((T34*)(C))->a1, l3));
							R = (T54f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T34f5(C));
								t5 = (T34f6(C));
								t5 = (((T19*)(t5))->a3);
								R = (T54f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T34f5(C));
								R = (T54f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T34f5(C));
						R = (T54f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.arguments */
T0* T34f6(T0* C)
{
	T0* R = 0;
	if (ge308os1306) {
		return ge308ov1306;
	} else {
		ge308os1306 = '\1';
	}
	R = T19c4();
	ge308ov1306 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
T0* T34f5(T0* C)
{
	T0* R = 0;
	if (ge262os1508) {
		return ge262ov1508;
	} else {
		ge262os1508 = '\1';
	}
	R = T54c12();
	ge262ov1508 = R;
	return R;
}

/* UT_USAGE_MESSAGE.default_message */
T0* T33f2(T0* C)
{
	T0* R = 0;
	R = (T33f4(C, ge218ov3310));
	return R;
}

/* UT_USAGE_MESSAGE.message */
T0* T33f4(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T33f5(C));
	R = (T54f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f5(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T33f5(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T54f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f5(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T33f5(C));
					l1 = (T54f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f5(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T33f5(C));
									T54f13(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f5(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T33f5(C));
					t2 = (T54f4(t1, l1));
					if (t2) {
						l3 = (T16f11(l1));
						t2 = (T60f4(((T33*)(C))->a1, l3));
						if (t2) {
							t1 = (T33f5(C));
							t5 = (T60f5(((T33*)(C))->a1, l3));
							R = (T54f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T33f5(C));
								t5 = (T33f6(C));
								t5 = (((T19*)(t5))->a3);
								R = (T54f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T33f5(C));
								R = (T54f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T33f5(C));
						R = (T54f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* UT_USAGE_MESSAGE.arguments */
T0* T33f6(T0* C)
{
	T0* R = 0;
	if (ge308os1306) {
		return ge308ov1306;
	} else {
		ge308os1306 = '\1';
	}
	R = T19c4();
	ge308ov1306 = R;
	return R;
}

/* UT_USAGE_MESSAGE.string_ */
T0* T33f5(T0* C)
{
	T0* R = 0;
	if (ge262os1508) {
		return ge262ov1508;
	} else {
		ge262os1508 = '\1';
	}
	R = T54c12();
	ge262ov1508 = R;
	return R;
}

/* UT_VERSION_NUMBER.default_message */
T0* T31f2(T0* C)
{
	T0* R = 0;
	R = (T31f4(C, ge219ov3310));
	return R;
}

/* UT_VERSION_NUMBER.message */
T0* T31f4(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T31f5(C));
	R = (T54f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f5(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T31f5(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T54f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f5(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T31f5(C));
					l1 = (T54f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f5(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T31f5(C));
									T54f13(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f5(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T31f5(C));
					t2 = (T54f4(t1, l1));
					if (t2) {
						l3 = (T16f11(l1));
						t2 = (T60f4(((T31*)(C))->a1, l3));
						if (t2) {
							t1 = (T31f5(C));
							t5 = (T60f5(((T31*)(C))->a1, l3));
							R = (T54f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T31f5(C));
								t5 = (T31f6(C));
								t5 = (((T19*)(t5))->a3);
								R = (T54f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T31f5(C));
								R = (T54f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T31f5(C));
						R = (T54f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* UT_VERSION_NUMBER.arguments */
T0* T31f6(T0* C)
{
	T0* R = 0;
	if (ge308os1306) {
		return ge308ov1306;
	} else {
		ge308os1306 = '\1';
	}
	R = T19c4();
	ge308ov1306 = R;
	return R;
}

/* UT_VERSION_NUMBER.string_ */
T0* T31f5(T0* C)
{
	T0* R = 0;
	if (ge262os1508) {
		return ge262ov1508;
	} else {
		ge262os1508 = '\1';
	}
	R = T54c12();
	ge262ov1508 = R;
	return R;
}

T0* gema61(T4 c, ...)
{
	T0* R;
	T0* a;
	a = (T0*)gealloc(sizeof(T41)+c*sizeof(T4));
	((T41*)(a))->id = 41;
	((T41*)(a))->a1 = c;
	if (c!=0) {
		va_list v;
		T4 n = c;
		T4 *i = ((T41*)(a))->a2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T4);
		}
		va_end(v);
	}
	R = (T0*)gealloc(sizeof(T61));
	((T61*)(R))->id = 61;
	((T61*)(R))->a1 = a;
	((T61*)(R))->a2 = 1;
	((T61*)(R))->a3 = (T4)c;
	return R;
}

int gevoid(T0* C, ...){
	printf("Call on Void target!\n");
	exit(1);
}

int geargc;
char** geargv;

T0* ge388ov2659;
T0* ge392ov3909;
T0* ge365ov1942;
T0* ge390ov2659;
T0* ge395ov2659;
T0* ge389ov3237;
T0* ge376ov1922;
T0* ge297ov4136;
T0* ge299ov4136;
T0* ge297ov4137;
T0* ge288ov4364;
T0* ge288ov4363;
T0* ge299ov4137;
T0* ge305ov1302;
T0* ge56ov3310;
T0* ge215ov3310;
T0* ge209ov3310;
T0* ge210ov3310;
T0* ge218ov3310;
T0* ge219ov3310;

void geconst()
{
	ge388ov2659 = (gems("\n", 1));
	ge392ov3909 = (gems("", 0));
	ge365ov1942 = (gems("empty_name", 10));
	ge390ov2659 = (gems("\n", 1));
	ge395ov2659 = (gems("\n", 1));
	ge389ov3237 = (gems("", 0));
	ge376ov1922 = (gems("", 0));
	ge297ov4136 = (gems(".", 1));
	ge299ov4136 = (gems(".", 1));
	ge297ov4137 = (gems("..", 2));
	ge288ov4364 = (gems("..", 2));
	ge288ov4363 = (gems(".", 1));
	ge299ov4137 = (gems("..", 2));
	ge305ov1302 = (gems("3.4", 3));
	ge56ov3310 = (gems("$0: too many (i.e. $1) nested include files", 43));
	ge215ov3310 = (gems("Syntax error in \"$1\" at line $2", 31));
	ge209ov3310 = (gems("$0: cannot read \'$1\'", 20));
	ge210ov3310 = (gems("$0: cannot write to \'$1\'", 24));
	ge218ov3310 = (gems("usage: $0 $1", 12));
	ge219ov3310 = (gems("$0 version $1", 13));
}

EIF_TYPE getypes[93] = {
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE}
};

int main(int argc, char** argv)
{
	T0* l1;
	geargc = argc;
	geargv = argv;
	geconst();
	l1 = T18c10();
	return 0;
}

/*
	description:

		"C functions used to implement class FILE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_FILE_C
#define EIF_FILE_C

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#ifdef EIF_WINDOWS
#include <sys/utime.h>
#include <io.h> /* for access, chmod */
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

void file_mkdir(char* dirname) {
#ifdef WIN32
	mkdir(dirname);
#else
	mkdir(dirname, 0777);
#endif
}

void file_rename(char* old, char* new) {
#ifdef WIN32
	struct stat buf;

	if (stat(new, &buf) != -1) {
		remove (new);
	}
#endif
	rename(old, new);
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
#endif
			return ((mode & S_IROTH) ? EIF_TRUE : EIF_FALSE);
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
#endif
			return ((mode & S_IWOTH) ? EIF_TRUE : EIF_FALSE);
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
#endif
			return ((mode & S_IXOTH) ? EIF_TRUE : EIF_FALSE);
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
	return gems(str, strlen(str));
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
	return gems(str, strlen(str));
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

#endif
/*
	description:

		"C functions used to implement class CONSOLE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_CONSOLE_C
#define EIF_CONSOLE_C

#include <stdio.h>

EIF_POINTER console_def(EIF_INTEGER file) {
	switch (file) {
	case 0:
		return (EIF_POINTER)stdin;
	case 1:
			/* Output is set to only have line buffered. Meaning that
			 * each displayed %N will flush the buffer. */
		setvbuf(stdout, NULL, _IOLBF, 0);
		return (EIF_POINTER)stdout;
	case 2:
		setvbuf (stderr, NULL, _IONBF, 0);
		return (EIF_POINTER)stderr;
	default:
		return NULL;
	}
}

EIF_BOOLEAN console_eof(FILE* fp) {
	return file_feof(fp);
}

EIF_CHARACTER console_separator(FILE *f) {
	return file_lh(f);
}

void console_ps(FILE* f, char* str, EIF_INTEGER len) {
	file_ps(f, str, len);
}

void console_pr(FILE* f, EIF_REAL_32 number) {
	file_pr(f, number);
}

void console_pc(FILE* f, EIF_CHARACTER c) {
	file_pc(f, c);
}

void console_pd(FILE* f, EIF_REAL_64 val) {
	file_pd(f, val);
}

void console_pi(FILE* f, EIF_INTEGER number) {
	file_pi(f, number);
}

void console_tnwl(FILE* f) {
	console_pc(f,'\n');
}

EIF_CHARACTER console_readchar(FILE* f) {
	return file_gc(f);
}

EIF_REAL_32 console_readreal(FILE* f) {
	return file_gr(f);
}

EIF_INTEGER console_readint(FILE* f) {
	return file_gi(f);
}

EIF_REAL_64 console_readdouble(FILE* f) {
	return file_gd(f);
}

EIF_INTEGER console_readword(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start) {
	return file_gw(f, s, bound, start);
}

EIF_INTEGER console_readline(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start) {
	return file_gs(f, s, bound, start);
}

void console_next_line(FILE* f) {
	file_tnil(f);
}

EIF_INTEGER console_readstream(FILE* f, char* s, EIF_INTEGER bound) {
	return file_gss(f, s, bound);
}

void console_file_close (FILE* f) {
	file_close(f);
}

#endif
/*
	description:

		"C functions used to implement class EXCEPTIONS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_EXCEPT_C
#define EIF_EXCEPT_C

void eraise(char* name, long code) {
	/* TODO */
	printf("'eraise' in 'eif_except.h' not implemented\n");
}

void esdie(int code) {
	exit(code);
}

EIF_REFERENCE eename(long except) {
	/* TODO */
	printf("'eename' in 'eif_except.h' not implemented\n");
	return EIF_VOID;
}

char* eeltag(void) {
	/* TODO */
	printf("'eeltag' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

char* eelrout(void) {
	/* TODO */
	printf("'eelrout' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

char* eelclass(void) {
	/* TODO */
	printf("'eelclass' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

long eelcode(void) {
	/* TODO */
	printf("'eelcode' in 'eif_except.h' not implemented\n");
	return 0;
}

EIF_REFERENCE stack_trace_string(void) {
	/* TODO */
	printf("'stack_trace_string' in 'eif_except.h' not implemented\n");
	return EIF_VOID;
}

char* eeotag(void) {
	/* TODO */
	printf("'eeotag' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

long eeocode(void) {
	/* TODO */
	printf("'eeocode' in 'eif_except.h' not implemented\n");
	return 0;
}

char* eeorout(void) {
	/* TODO */
	printf("'eeorout' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

char* eeoclass(void) {
	/* TODO */
	printf("'eeoclass' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

void eecatch(long code) {
	/* TODO */
	printf("'eecatch' in 'eif_except.h' not implemented\n");
}

void eeignore(long code) {
	/* TODO */
	printf("'eeignore' in 'eif_except.h' not implemented\n");
}

void eetrace(char b) {
	/* TODO */
	printf("'eetrace' in 'eif_except.h' not implemented\n");
}

#endif
/*
	description:

		"C functions used to implement class EXECUTION_ENVIRONMENT"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_MISC_C
#define EIF_MISC_C

#include <stdlib.h>
#ifdef WIN32
#include <windows.h>
#include <string.h>
#endif

#ifndef PATH_MAX
#define PATH_MAX 1024 /* Maximum length of full path name */
#endif

char* eif_getenv(char* k) {
	return (char*)getenv(k);
}

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
	result = CreateProcess(
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

#endif
/*
	description:

		"C functions used to implement class DIRECTORY"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_DIR_C
#define EIF_DIR_C

#ifdef WIN32
typedef struct {
	HANDLE handle;
	WIN32_FIND_DATA data;
	char *pattern;
} ge_directory;
#include <io.h> /* for 'access' */
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

void* dir_open(char* dirname) {
#ifdef WIN32
	int len = strlen((char*)dirname);
	char* pattern = malloc(len + 5);
	ge_directory* result = malloc(sizeof(ge_directory));

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
	ge_directory* ge_dir = (ge_directory*)dir;
	HANDLE h = ge_dir->handle;

	if (h) {
		if (FindNextFile(h, &(ge_dir->data))) {
			char* s = ge_dir->data.cFileName;
			return gems(s,strlen(s));
		} else {
			return EIF_VOID;
		}
	} else {
		h = FindFirstFile(ge_dir->pattern, &(ge_dir->data));
		if (h == INVALID_HANDLE_VALUE) {
			return EIF_VOID;
		} else {
			char* s = ge_dir->data.cFileName;
			ge_dir->handle = h;
			return gems(s,strlen(s));
		}
	}
#else
	struct dirent* p = readdir((DIR*)dir);
	if (p) {
		char* s = p->d_name;
		return gems(s,strlen(s));
	} else {
		return EIF_VOID;
	}
#endif
}

void dir_rewind(void* dir) {
#ifdef WIN32
	ge_directory* ge_dir = (ge_directory*)dir;
	HANDLE h = ge_dir->handle;

	if (h) {
		FindClose(h);
	}
	ge_dir->handle = 0;
#else
	DIR* ge_dir = (DIR*)dir;
	rewinddir(ge_dir);
#endif
}

void dir_close(void* dir) {
#ifdef WIN32
	ge_directory* ge_dir = (ge_directory*)dir;
	HANDLE h = ge_dir->handle;

	if (h) {
		FindClose(h);
	}
	free(ge_dir->pattern);
	free(ge_dir);
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
	result = gems(s, strlen(s));
	free(s);
	return result;
}

EIF_INTEGER eif_chdir(char* path) {
	return chdir(path);
}

#endif
