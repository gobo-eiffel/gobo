#include "geant.h"

#ifdef __cplusplus
extern "C" {
#endif

/* XM_EIFFEL_CHARACTER_ENTITY.from_hexadecimal */
void T277f10(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	t1 = (T277f7(ac, C));
	((T277*)(C))->a1 = (T115f13(ac, GE_void(t1), a1));
}

/* KL_STRING_ROUTINES.hexadecimal_to_integer */
T6 T115f13(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T2 t2;
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	l2 = (((T17*)(GE_void(a1)))->a2);
	l1 = (T6)(GE_int32(1));
	while (1) {
		t1 = (T6f1(ac, (&l1), l2));
		if (t1) {
			break;
		}
		R = ((T6)((R)*((T6)(GE_int32(16)))));
		t2 = (T17f10(ac, GE_void(a1), l1));
		switch (t2) {
		case (T2)(T2)('0'):
			break;
		case (T2)(T2)('1'):
			R = ((T6)((R)+((T6)(GE_int32(1)))));
			break;
		case (T2)(T2)('2'):
			R = ((T6)((R)+((T6)(GE_int32(2)))));
			break;
		case (T2)(T2)('3'):
			R = ((T6)((R)+((T6)(GE_int32(3)))));
			break;
		case (T2)(T2)('4'):
			R = ((T6)((R)+((T6)(GE_int32(4)))));
			break;
		case (T2)(T2)('5'):
			R = ((T6)((R)+((T6)(GE_int32(5)))));
			break;
		case (T2)(T2)('6'):
			R = ((T6)((R)+((T6)(GE_int32(6)))));
			break;
		case (T2)(T2)('7'):
			R = ((T6)((R)+((T6)(GE_int32(7)))));
			break;
		case (T2)(T2)('8'):
			R = ((T6)((R)+((T6)(GE_int32(8)))));
			break;
		case (T2)(T2)('9'):
			R = ((T6)((R)+((T6)(GE_int32(9)))));
			break;
		case (T2)(T2)('a'):
		case (T2)(T2)('A'):
			R = ((T6)((R)+((T6)(GE_int32(10)))));
			break;
		case (T2)(T2)('b'):
		case (T2)(T2)('B'):
			R = ((T6)((R)+((T6)(GE_int32(11)))));
			break;
		case (T2)(T2)('c'):
		case (T2)(T2)('C'):
			R = ((T6)((R)+((T6)(GE_int32(12)))));
			break;
		case (T2)(T2)('d'):
		case (T2)(T2)('D'):
			R = ((T6)((R)+((T6)(GE_int32(13)))));
			break;
		case (T2)(T2)('e'):
		case (T2)(T2)('E'):
			R = ((T6)((R)+((T6)(GE_int32(14)))));
			break;
		case (T2)(T2)('f'):
		case (T2)(T2)('F'):
			R = ((T6)((R)+((T6)(GE_int32(15)))));
			break;
		default:
			GE_raise(GE_EX_WHEN);
			break;
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	return R;
}

/* XM_EIFFEL_CHARACTER_ENTITY.string_ */
T0* T277f7(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge128os1973) {
		return ge128ov1973;
	} else {
		ge128os1973 = '\1';
		ge128ov1973 = R;
	}
	R = T115c19(ac);
	ge128ov1973 = R;
	return R;
}

/* XM_EIFFEL_CHARACTER_ENTITY.to_utf8 */
T0* T277f3(GE_context* ac, T0* C)
{
	T0* t1;
	T0* R = 0;
	R = T17c36(ac, (T6)(GE_int32(6)));
	t1 = (T277f6(ac, C));
	T264f37(ac, GE_void(t1), R, ((T277*)(C))->a1);
	return R;
}

/* XM_EIFFEL_CHARACTER_ENTITY.utf8 */
T0* T277f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge220os6168) {
		return ge220ov6168;
	} else {
		ge220os6168 = '\1';
		ge220ov6168 = R;
	}
	R = T264c36(ac);
	ge220ov6168 = R;
	return R;
}

/* XM_EIFFEL_CHARACTER_ENTITY.is_ascii */
T1 T277f2(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T6f10(ac, &(((T277*)(C))->a1), (T6)(GE_int32(127))));
	return R;
}

/* XM_EIFFEL_CHARACTER_ENTITY.is_valid */
T1 T277f5(GE_context* ac, T0* C)
{
	T0* t1;
	T1 t2;
	T1 R = 0;
	t1 = (T277f4(ac, C));
	t2 = (T389f3(ac, GE_void(t1), ((T277*)(C))->a1));
	if (t2) {
		t2 = (((((((T277*)(C))->a1) == ((T6)(GE_int32(9)))))));
		if (!(t2)) {
			t2 = (((((((T277*)(C))->a1) == ((T6)(GE_int32(10)))))));
		}
		if (!(t2)) {
			t2 = (((((((T277*)(C))->a1) == ((T6)(GE_int32(13)))))));
		}
		if (!(t2)) {
			t2 = (T6f8(ac, &(((T277*)(C))->a1), (T6)(GE_int32(32))));
			if (t2) {
				t2 = (((((((T277*)(C))->a1) != ((T6)(GE_int32(65279)))))));
			}
			if (t2) {
				R = (((((((T277*)(C))->a1) != ((T6)(GE_int32(65535)))))));
			} else {
				R = EIF_FALSE;
			}
		} else {
			R = EIF_TRUE;
		}
	}
	return R;
}

/* UC_UNICODE_ROUTINES.valid_non_surrogate_code */
T1 T389f3(GE_context* ac, T0* C, T6 a1)
{
	T1 t1;
	T1 R = 0;
	t1 = (T6f8(ac, &a1, (T6)(GE_int32(0))));
	if (t1) {
		t1 = ((T1)((a1)<((T6)(GE_int32(55296)))));
	}
	if (!(t1)) {
		t1 = (T6f1(ac, &a1, (T6)(GE_int32(57343))));
		if (t1) {
			R = (T6f10(ac, &a1, (T6)(GE_int32(1114111))));
		} else {
			R = EIF_FALSE;
		}
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* XM_EIFFEL_CHARACTER_ENTITY.unicode */
T0* T277f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge217os5168) {
		return ge217ov5168;
	} else {
		ge217os5168 = '\1';
		ge217ov5168 = R;
	}
	R = T389c31(ac);
	ge217ov5168 = R;
	return R;
}

/* XM_EIFFEL_CHARACTER_ENTITY.from_decimal */
void T277f9(GE_context* ac, T0* C, T0* a1)
{
	((T277*)(C))->a1 = (T17f17(ac, GE_void(a1)));
}

/* XM_EIFFEL_PE_ENTITY_DEF.has_normalized_newline */
T1 T226f203(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T226f65(ac, C));
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.text_substring */
T0* T226f183(GE_context* ac, T0* C, T6 a1, T6 a2)
{
	T1 t1;
	T6 t2;
	T6 t3;
	T0* R = 0;
	t1 = ((T1)((a2)<(a1)));
	if (t1) {
		R = T17c36(ac, (T6)(GE_int32(0)));
	} else {
		t2 = ((T6)((((T226*)(C))->a25)+(a1)));
		t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
		t3 = ((T6)((((T226*)(C))->a25)+(a2)));
		t3 = ((T6)((t3)-((T6)(GE_int32(1)))));
		R = (T413f3(ac, GE_void(((T226*)(C))->a44), t2, t3));
	}
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.text_count */
T6 T226f182(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = ((T6)((((T226*)(C))->a26)-(((T226*)(C))->a25)));
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.system_literal_text */
T0* T226f164(GE_context* ac, T0* C)
{
	T6 t1;
	T2 t2;
	T1 t3;
	T6 t4;
	T0* R = 0;
	T6 l1 = 0;
	T2 l2 = 0;
	t1 = (T226f182(ac, C));
	l2 = (T226f209(ac, C, t1));
	t1 = (T226f182(ac, C));
	l1 = ((T6)((t1)-((T6)(GE_int32(1)))));
	while (1) {
		t2 = (T226f209(ac, C, l1));
		t3 = (((((t2) == (l2)))));
		if (t3) {
			break;
		}
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
	}
	t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	t4 = (T226f182(ac, C));
	t4 = ((T6)((t4)-((T6)(GE_int32(1)))));
	R = (T226f183(ac, C, t1, t4));
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.text_item */
T2 T226f209(GE_context* ac, T0* C, T6 a1)
{
	T1 t1;
	T6 t2;
	T2 R = 0;
	T0* l1 = 0;
	l1 = ((T226*)(C))->a45;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		t2 = ((T6)((((T226*)(C))->a25)+(a1)));
		t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
		R = (((T15*)(GE_void(l1)))->z2[t2]);
	} else {
		t2 = ((T6)((((T226*)(C))->a25)+(a1)));
		t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
		R = (T413f6(ac, GE_void(((T226*)(C))->a44), t2));
	}
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
T0* T226f123(GE_context* ac, T0* C)
{
	T1 t1;
	T0* R = 0;
	t1 = (T226f65(ac, C));
	if (t1) {
		R = (T226f107(ac, C));
	} else {
		R = (T226f123p1(ac, C));
	}
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.normalized_newline */
unsigned char ge1521os7189 = '\0';
T0* ge1521ov7189;
T0* T226f123p1(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge1521os7189) {
		return ge1521ov7189;
	} else {
		ge1521os7189 = '\1';
		ge1521ov7189 = R;
	}
	R = GE_ms8("\n", 1);
	ge1521ov7189 = R;
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.yy_set_line_column */
void T226f251(GE_context* ac, T0* C)
{
	T1 t1;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T0* l7 = 0;
	l7 = ((T226*)(C))->a45;
	l1 = ((T6)((((T226*)(C))->a26)-((T6)(GE_int32(1)))));
	l2 = ((T6)((((T226*)(C))->a25)+(((T226*)(C))->a31)));
	while (1) {
		t1 = ((T1)((l1)<(l2)));
		if (!(t1)) {
			t1 = (l5);
		}
		if (t1) {
			break;
		}
		t1 = ((l7)!=(EIF_VOID));
		if (t1) {
			l6 = (((T15*)(GE_void(l7)))->z2[l1]);
		} else {
			l6 = (T413f6(ac, GE_void(((T226*)(C))->a44), l1));
		}
		t1 = (((((l6) == ((T2)('\n'))))));
		if (t1) {
			l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
			l5 = EIF_TRUE;
		} else {
			l4 = ((T6)((l4)+((T6)(GE_int32(1)))));
		}
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
	}
	while (1) {
		t1 = ((T1)((l1)<(l2)));
		if (t1) {
			break;
		}
		t1 = ((l7)!=(EIF_VOID));
		if (t1) {
			l6 = (((T15*)(GE_void(l7)))->z2[l1]);
		} else {
			l6 = (T413f6(ac, GE_void(((T226*)(C))->a44), l1));
		}
		t1 = (((((l6) == ((T2)('\n'))))));
		if (t1) {
			l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
		}
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
	}
	if (l5) {
		((T226*)(C))->a22 = ((T6)((((T226*)(C))->a22)+(l3)));
		((T226*)(C))->a23 = ((T6)((l4)+((T6)(GE_int32(1)))));
	} else {
		((T226*)(C))->a23 = ((T6)((((T226*)(C))->a23)+(l4)));
	}
}

/* XM_EIFFEL_PE_ENTITY_DEF.text */
T0* T226f107(GE_context* ac, T0* C)
{
	T1 t1;
	T6 t2;
	T0* R = 0;
	t1 = ((T1)((((T226*)(C))->a25)<(((T226*)(C))->a26)));
	if (t1) {
		t2 = ((T6)((((T226*)(C))->a26)-((T6)(GE_int32(1)))));
		R = (T413f3(ac, GE_void(((T226*)(C))->a44), ((T226*)(C))->a25, t2));
	} else {
		R = T17c36(ac, (T6)(GE_int32(0)));
	}
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.pop_start_condition */
void T226f250(GE_context* ac, T0* C)
{
	T6 t1;
	((T226*)(C))->a20 = ((T6)((((T226*)(C))->a20)-((T6)(GE_int32(1)))));
	t1 = (((T95*)(GE_void(((T226*)(C))->a6)))->z2[((T226*)(C))->a20]);
	T226f235(ac, C, t1);
}

/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition */
void T226f248(GE_context* ac, T0* C, T6 a1)
{
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (((T95*)(GE_void(((T226*)(C))->a6)))->a2);
	t2 = (T6f8(ac, &(((T226*)(C))->a20), t1));
	if (t2) {
		t3 = (T226f56(ac, C));
		t1 = ((T6)((((T226*)(C))->a20)+((T6)(GE_int32(10)))));
		((T226*)(C))->a6 = (T106f3(ac, GE_void(t3), ((T226*)(C))->a6, t1));
	}
	t3 = (T226f56(ac, C));
	t1 = (T226f64(ac, C));
	T106f8(ac, GE_void(t3), ((T226*)(C))->a6, t1, ((T226*)(C))->a20);
	((T226*)(C))->a20 = ((T6)((((T226*)(C))->a20)+((T6)(GE_int32(1)))));
	T226f235(ac, C, a1);
}

/* XM_EIFFEL_PE_ENTITY_DEF.set_last_token */
void T226f249(GE_context* ac, T0* C, T6 a1)
{
	((T226*)(C))->a46 = a1;
}

/* XM_EIFFEL_PE_ENTITY_DEF.yy_execute_eof_action */
void T226f246(GE_context* ac, T0* C, T6 a1)
{
	T226f244(ac, C);
}

/* XM_EIFFEL_PE_ENTITY_DEF.wrap */
T1 T226f101(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.yy_refill_input_buffer */
void T226f245(GE_context* ac, T0* C)
{
	T0* t1;
	T6 t2;
	T6 l1 = 0;
	if (((T0*)(GE_void(((T226*)(C))->a7)))->id==278) {
		T278f13(ac, ((T226*)(C))->a7, ((T226*)(C))->a25);
	} else {
		T279f18(ac, ((T226*)(C))->a7, ((T226*)(C))->a25);
	}
	if (((T0*)(GE_void(((T226*)(C))->a7)))->id==278) {
		T278f15(ac, ((T226*)(C))->a7);
	} else {
		T279f20(ac, ((T226*)(C))->a7);
	}
	t1 = (((((T0*)(GE_void(((T226*)(C))->a7)))->id==278)?((T278*)(((T226*)(C))->a7))->a4:((T279*)(((T226*)(C))->a7))->a4));
	T226f220(ac, C, t1);
	l1 = (((((T0*)(GE_void(((T226*)(C))->a7)))->id==278)?((T278*)(((T226*)(C))->a7))->a5:((T279*)(((T226*)(C))->a7))->a5));
	t2 = ((T6)((((T226*)(C))->a26)-(((T226*)(C))->a25)));
	((T226*)(C))->a26 = ((T6)((t2)+(l1)));
	((T226*)(C))->a25 = l1;
}

/* YY_FILE_BUFFER.fill */
void T279f20(GE_context* ac, T0* C)
{
	T1 t1;
	T2 t2;
	T6 t3;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	if (((T279*)(C))->a3) {
		t1 = ((T1)(!(((T279*)(C))->a10)));
	} else {
		t1 = EIF_FALSE;
	}
	if (t1) {
		T279f22(ac, C);
		l3 = ((T279*)(C))->a4;
		l1 = ((T6)((((T279*)(C))->a11)-(((T279*)(C))->a2)));
		if (((T279*)(C))->a12) {
			T266f31(ac, GE_void(((T279*)(C))->a9));
			t1 = (T266f18(ac, GE_void(((T279*)(C))->a9)));
			t1 = ((T1)(!(t1)));
			if (t1) {
				((T279*)(C))->a2 = ((T6)((((T279*)(C))->a2)+((T6)(GE_int32(1)))));
				t2 = (T266f19(ac, GE_void(((T279*)(C))->a9)));
				T413f9(ac, GE_void(l3), t2, ((T279*)(C))->a2);
				((T279*)(C))->a3 = EIF_TRUE;
			} else {
				((T279*)(C))->a3 = EIF_FALSE;
				((T279*)(C))->a10 = EIF_TRUE;
			}
		} else {
			t3 = ((T6)((((T279*)(C))->a2)+((T6)(GE_int32(1)))));
			l2 = (T413f5(ac, GE_void(l3), ((T279*)(C))->a9, t3, l1));
			t1 = ((T1)((l2)<(l1)));
			if (t1) {
				((T279*)(C))->a10 = (T266f18(ac, GE_void(((T279*)(C))->a9)));
			}
			t1 = (T6f1(ac, (&l2), (T6)(GE_int32(0))));
			if (t1) {
				((T279*)(C))->a3 = EIF_TRUE;
			} else {
				((T279*)(C))->a3 = EIF_FALSE;
			}
			((T279*)(C))->a2 = ((T6)((((T279*)(C))->a2)+(l2)));
		}
		t3 = ((T6)((((T279*)(C))->a2)+((T6)(GE_int32(1)))));
		T413f9(ac, GE_void(l3), (T2)('\000'), t3);
		t3 = ((T6)((((T279*)(C))->a2)+((T6)(GE_int32(2)))));
		T413f9(ac, GE_void(l3), (T2)('\000'), t3);
	} else {
		((T279*)(C))->a3 = EIF_FALSE;
	}
}

/* KL_CHARACTER_BUFFER.fill_from_stream */
T6 T413f5(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((a2)+((T6)(GE_int32(1)))));
	R = (T266f27(ac, GE_void(a1), ((T413*)(C))->a2, t1, a3));
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.read_to_string */
T6 T266f27(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T1 t1;
	T6 t2;
	T2 t3;
	T6 R = 0;
	t1 = (((((((T266*)(C))->a2) == ((T6)(GE_int32(6)))))));
	if (!(t1)) {
		t1 = (((((((T266*)(C))->a2) == ((T6)(GE_int32(2)))))));
	}
	if (!(t1)) {
		t2 = (((T391*)(GE_void(((T266*)(C))->a4)))->a1);
		t1 = (T6f1(ac, &t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		T266f31(ac, C);
		t1 = (T266f18(ac, C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T266f19(ac, C));
			T17f52(ac, GE_void(a1), t3, a2);
			R = (T6)(GE_int32(1));
		} else {
			R = (T6)(GE_int32(0));
		}
	} else {
		t1 = (((((((T266*)(C))->a2) == ((T6)(GE_int32(1)))))));
		if (t1) {
			R = (((((T0*)(GE_void(((T266*)(C))->a3)))->id==97)?T97f36(ac, ((T266*)(C))->a3, a1, a2, a3):T412f8(ac, ((T266*)(C))->a3, a1, a2, a3)));
		} else {
			R = (T266f27p1(ac, C, a1, a2, a3));
		}
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.read_to_string */
T6 T266f27p1(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3)
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
		t2 = (T6f1(ac, (&l1), l2));
		if (t2) {
			break;
		}
		T266f31(ac, C);
		t2 = (T266f18(ac, C));
		t2 = ((T1)(!(t2)));
		if (t2) {
			t3 = (T266f19(ac, C));
			T17f52(ac, GE_void(a1), t3, l1);
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
T6 T412f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3)
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
		t2 = (T6f1(ac, (&l1), l2));
		if (t2) {
			break;
		}
		T412f10(ac, C);
		t2 = ((T1)(!(((T412*)(C))->a1)));
		if (t2) {
			T17f52(ac, GE_void(a1), ((T412*)(C))->a2, l1);
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

/* YY_FILE_BUFFER.compact_left */
void T279f22(GE_context* ac, T0* C)
{
	T6 t1;
	T1 t2;
	T6 l1 = 0;
	t1 = ((T6)((((T279*)(C))->a2)-(((T279*)(C))->a5)));
	l1 = ((T6)((t1)+((T6)(GE_int32(1)))));
	t2 = (T6f8(ac, (&l1), ((T279*)(C))->a11));
	if (t2) {
		T279f24(ac, C);
	}
	t2 = (((((((T279*)(C))->a5) != ((T6)(GE_int32(1)))))));
	if (t2) {
		t1 = ((T6)((l1)+((T6)(GE_int32(2)))));
		T413f10(ac, GE_void(((T279*)(C))->a4), ((T279*)(C))->a5, (T6)(GE_int32(1)), t1);
		((T279*)(C))->a5 = (T6)(GE_int32(1));
		((T279*)(C))->a2 = l1;
	}
}

/* KL_CHARACTER_BUFFER.move_left */
void T413f10(GE_context* ac, T0* C, T6 a1, T6 a2, T6 a3)
{
	T1 t1;
	T6 t2;
	T6 t3;
	T6 t4;
	t1 = (T6f1(ac, &a3, (T6)(GE_int32(0))));
	if (t1) {
		t2 = ((T6)((a1)+((T6)(GE_int32(1)))));
		t3 = ((T6)((a1)+(a3)));
		t4 = ((T6)((a2)+((T6)(GE_int32(1)))));
		T17f58(ac, GE_void(((T413*)(C))->a2), ((T413*)(C))->a2, t2, t3, t4);
	}
}

/* YY_FILE_BUFFER.resize */
void T279f24(GE_context* ac, T0* C)
{
	T1 t1;
	T6 t2;
	T6 t3;
	t1 = (((((((T279*)(C))->a11) == ((T6)(GE_int32(0)))))));
	if (t1) {
		((T279*)(C))->a11 = (T279f13(ac, C));
	} else {
		((T279*)(C))->a11 = ((T6)((((T279*)(C))->a11)*((T6)(GE_int32(2)))));
	}
	t2 = ((T6)((((T279*)(C))->a11)+((T6)(GE_int32(2)))));
	t3 = (T413f4(ac, GE_void(((T279*)(C))->a4)));
	t1 = (T6f1(ac, &t2, t3));
	if (t1) {
		t2 = ((T6)((((T279*)(C))->a11)+((T6)(GE_int32(2)))));
		T413f11(ac, GE_void(((T279*)(C))->a4), t2);
	}
}

/* XM_EIFFEL_PE_ENTITY_DEF.yy_null_trans_state */
T6 T226f100(GE_context* ac, T0* C, T6 a1)
{
	T1 t1;
	T6 t2;
	T0* m1 = 0;
	T0* t3;
	T6 R = 0;
	T6 l1 = 0;
	T1 l2 = 0;
	t1 = EIF_FALSE;
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (((T95*)(GE_void(((T226*)(C))->a43)))->z2[a1]);
		t1 = (((((t2) != ((T6)(GE_int32(0)))))));
		if (t1) {
			((T226*)(C))->a32 = a1;
			((T226*)(C))->a33 = ((T226*)(C))->a26;
		}
	}
	R = a1;
	l1 = (T6)(GE_int32(1));
	while (1) {
		t2 = (((T95*)(GE_void(((T226*)(C))->a39)))->z2[R]);
		t2 = ((T6)((t2)+(l1)));
		t2 = (((T95*)(GE_void(((T226*)(C))->a38)))->z2[t2]);
		t1 = (((((t2) == (R)))));
		if (t1) {
			break;
		}
		R = (((T95*)(GE_void(((T226*)(C))->a40)))->z2[R]);
		t1 = (((T226*)(C))->a42?((m1 = ((T226*)(C))->a42, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t1 = (T6f8(ac, (&R), (T6)(GE_int32(831))));
		}
		if (t1) {
			l1 = (((T95*)(m1))->z2[l1]);
		}
	}
	t2 = (((T95*)(GE_void(((T226*)(C))->a39)))->z2[R]);
	t2 = ((T6)((t2)+(l1)));
	R = (((T95*)(GE_void(((T226*)(C))->a37)))->z2[t2]);
	if (EIF_FALSE) {
		t3 = (T226f56(ac, C));
		T106f8(ac, GE_void(t3), ((T226*)(C))->a34, R, ((T226*)(C))->a14);
		((T226*)(C))->a14 = ((T6)((((T226*)(C))->a14)+((T6)(GE_int32(1)))));
	}
	l2 = (((((R) == ((T6)(GE_int32(830)))))));
	if (l2) {
		R = (T6)(GE_int32(0));
	}
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.yy_previous_state */
T6 T226f99(GE_context* ac, T0* C)
{
	T1 t1;
	T0* t2;
	T2 t3;
	T0* m1 = 0;
	T6 t4;
	T0* m2 = 0;
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T0* l4 = 0;
	t1 = (((((T0*)(GE_void(((T226*)(C))->a7)))->id==278)?((T278*)(((T226*)(C))->a7))->a1:((T279*)(((T226*)(C))->a7))->a1));
	if (t1) {
		R = ((T6)((((T226*)(C))->a21)+((T6)(GE_int32(1)))));
	} else {
		R = ((T226*)(C))->a21;
	}
	if (EIF_FALSE) {
		t2 = (T226f56(ac, C));
		T106f8(ac, GE_void(t2), ((T226*)(C))->a34, R, (T6)(GE_int32(0)));
		((T226*)(C))->a14 = (T6)(GE_int32(1));
	}
	l4 = ((T226*)(C))->a45;
	l1 = ((T6)((((T226*)(C))->a25)+(((T226*)(C))->a31)));
	l2 = ((T226*)(C))->a26;
	while (1) {
		t1 = (T6f8(ac, (&l1), l2));
		if (t1) {
			break;
		}
		t1 = ((l4)!=(EIF_VOID));
		if (t1) {
			t3 = (((T15*)(GE_void(l4)))->z2[l1]);
			l3 = ((T6)(t3));
		} else {
			t3 = (T413f6(ac, GE_void(((T226*)(C))->a44), l1));
			l3 = ((T6)(t3));
		}
		t1 = (((((l3) == ((T6)(GE_int32(0)))))));
		if (t1) {
			l3 = (T6)(GE_int32(1));
		} else {
			t1 = (((T226*)(C))->a41?((m1 = ((T226*)(C))->a41, EIF_TRUE)):EIF_FALSE);
			if (t1) {
				l3 = (((T95*)(m1))->z2[l3]);
			}
		}
		t1 = EIF_FALSE;
		t1 = ((T1)(!(t1)));
		if (t1) {
			t4 = (((T95*)(GE_void(((T226*)(C))->a43)))->z2[R]);
			t1 = (((((t4) != ((T6)(GE_int32(0)))))));
			if (t1) {
				((T226*)(C))->a32 = R;
				((T226*)(C))->a33 = l1;
			}
		}
		while (1) {
			t4 = (((T95*)(GE_void(((T226*)(C))->a39)))->z2[R]);
			t4 = ((T6)((t4)+(l3)));
			t4 = (((T95*)(GE_void(((T226*)(C))->a38)))->z2[t4]);
			t1 = (((((t4) == (R)))));
			if (t1) {
				break;
			}
			R = (((T95*)(GE_void(((T226*)(C))->a40)))->z2[R]);
			t1 = (((T226*)(C))->a42?((m2 = ((T226*)(C))->a42, EIF_TRUE)):EIF_FALSE);
			if (t1) {
				t1 = (T6f8(ac, (&R), (T6)(GE_int32(831))));
			}
			if (t1) {
				l3 = (((T95*)(m2))->z2[l3]);
			}
		}
		t4 = (((T95*)(GE_void(((T226*)(C))->a39)))->z2[R]);
		t4 = ((T6)((t4)+(l3)));
		R = (((T95*)(GE_void(((T226*)(C))->a37)))->z2[t4]);
		if (EIF_FALSE) {
			t2 = (T226f56(ac, C));
			T106f8(ac, GE_void(t2), ((T226*)(C))->a34, R, ((T226*)(C))->a14);
			((T226*)(C))->a14 = ((T6)((((T226*)(C))->a14)+((T6)(GE_int32(1)))));
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.terminate */
void T226f244(GE_context* ac, T0* C)
{
	((T226*)(C))->a46 = (T6)(GE_int32(0));
}

/* XM_EIFFEL_SCANNER_DTD.read_token */
void T224f203(GE_context* ac, T0* C)
{
	T1 t1;
	t1 = ((T1)(!(((T224*)(C))->a12)));
	if (t1) {
		T224f212(ac, C, (T6)(GE_int32(289)));
		((T224*)(C))->a12 = EIF_TRUE;
	} else {
		if (((T224*)(C))->a13) {
			T224f213(ac, C);
		} else {
			T224f203p1(ac, C);
			t1 = (T224f63(ac, C));
			if (t1) {
				T224f212(ac, C, (T6)(GE_int32(290)));
				((T224*)(C))->a13 = EIF_TRUE;
			}
		}
	}
}

/* XM_EIFFEL_SCANNER_DTD.read_token */
void T224f203p1(GE_context* ac, T0* C)
{
	T1 t1;
	T0* t2;
	T0* m1 = 0;
	T2 t3;
	T6 t4;
	T0* m2 = 0;
	T0* m3 = 0;
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
	T0* l14 = 0;
	((T224*)(C))->a1 = (T6)(GE_int32(-2));
	l7 = (T6)(GE_int32(1));
	while (1) {
		t1 = (((((((T224*)(C))->a1) != ((T6)(GE_int32(-2)))))));
		if (t1) {
			break;
		}
		switch (l7) {
		case (T6)(T6)(GE_int32(1)):
			if (((T224*)(C))->a14) {
				((T224*)(C))->a15 = ((T6)((((T224*)(C))->a16)-(((T224*)(C))->a17)));
				((T224*)(C))->a14 = EIF_FALSE;
			} else {
				((T224*)(C))->a15 = (T6)(GE_int32(0));
				((T224*)(C))->a6 = ((T224*)(C))->a18;
				((T224*)(C))->a5 = ((T224*)(C))->a19;
				((T224*)(C))->a4 = ((T224*)(C))->a20;
			}
			l1 = ((T224*)(C))->a16;
			l2 = l1;
			t1 = (((((T0*)(GE_void(((T224*)(C))->a21)))->id==278)?((T278*)(((T224*)(C))->a21))->a1:((T279*)(((T224*)(C))->a21))->a1));
			if (t1) {
				l3 = ((T6)((((T224*)(C))->a8)+((T6)(GE_int32(1)))));
			} else {
				l3 = ((T224*)(C))->a8;
			}
			if (EIF_FALSE) {
				t2 = (T224f62(ac, C));
				T106f8(ac, GE_void(t2), ((T224*)(C))->a22, l3, (T6)(GE_int32(0)));
				((T224*)(C))->a23 = (T6)(GE_int32(1));
			}
			l7 = (T6)(GE_int32(2));
			break;
		case (T6)(T6)(GE_int32(2)):
			l14 = ((T224*)(C))->a24;
			l13 = EIF_FALSE;
			while (1) {
				if (l13) {
					break;
				}
				t1 = (((T224*)(C))->a25?((m1 = ((T224*)(C))->a25, EIF_TRUE)):EIF_FALSE);
				if (t1) {
					t1 = ((l14)!=(EIF_VOID));
					if (t1) {
						t3 = (((T15*)(GE_void(l14)))->z2[l1]);
						t4 = ((T6)(t3));
						l8 = (((T95*)(m1))->z2[t4]);
					} else {
						t3 = (T413f6(ac, GE_void(((T224*)(C))->a26), l1));
						t4 = ((T6)(t3));
						l8 = (((T95*)(m1))->z2[t4]);
					}
				} else {
					t1 = ((l14)!=(EIF_VOID));
					if (t1) {
						t3 = (((T15*)(GE_void(l14)))->z2[l1]);
						l8 = ((T6)(t3));
					} else {
						t3 = (T413f6(ac, GE_void(((T224*)(C))->a26), l1));
						l8 = ((T6)(t3));
					}
				}
				t1 = EIF_FALSE;
				t1 = ((T1)(!(t1)));
				if (t1) {
					t4 = (((T95*)(GE_void(((T224*)(C))->a27)))->z2[l3]);
					t1 = (((((t4) != ((T6)(GE_int32(0)))))));
				}
				if (t1) {
					((T224*)(C))->a28 = l3;
					((T224*)(C))->a29 = l1;
				}
				while (1) {
					t4 = (((T95*)(GE_void(((T224*)(C))->a31)))->z2[l3]);
					t4 = ((T6)((t4)+(l8)));
					t4 = (((T95*)(GE_void(((T224*)(C))->a30)))->z2[t4]);
					t1 = (((((t4) == (l3)))));
					if (t1) {
						break;
					}
					l3 = (((T95*)(GE_void(((T224*)(C))->a32)))->z2[l3]);
					t1 = (((T224*)(C))->a33?((m2 = ((T224*)(C))->a33, EIF_TRUE)):EIF_FALSE);
					if (t1) {
						t1 = (T6f8(ac, (&l3), (T6)(GE_int32(831))));
					}
					if (t1) {
						l8 = (((T95*)(m2))->z2[l8]);
					}
				}
				t4 = (((T95*)(GE_void(((T224*)(C))->a31)))->z2[l3]);
				t4 = ((T6)((t4)+(l8)));
				l3 = (((T95*)(GE_void(((T224*)(C))->a34)))->z2[t4]);
				if (EIF_FALSE) {
					t2 = (T224f62(ac, C));
					T106f8(ac, GE_void(t2), ((T224*)(C))->a22, l3, ((T224*)(C))->a23);
					((T224*)(C))->a23 = ((T6)((((T224*)(C))->a23)+((T6)(GE_int32(1)))));
				}
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				l13 = (((((l3) == ((T6)(GE_int32(830)))))));
			}
			t1 = EIF_FALSE;
			t1 = ((T1)(!(t1)));
			if (t1) {
				l1 = ((T224*)(C))->a29;
				l3 = ((T224*)(C))->a28;
			}
			l7 = (T6)(GE_int32(3));
			break;
		case (T6)(T6)(GE_int32(3)):
			t1 = EIF_FALSE;
			t1 = ((T1)(!(t1)));
			if (t1) {
				l6 = (((T95*)(GE_void(((T224*)(C))->a27)))->z2[l3]);
				l7 = (T6)(GE_int32(4));
			} else {
				((T224*)(C))->a23 = ((T6)((((T224*)(C))->a23)-((T6)(GE_int32(1)))));
				l3 = (((T95*)(GE_void(((T224*)(C))->a22)))->z2[((T224*)(C))->a23]);
				((T224*)(C))->a35 = (((T95*)(GE_void(((T224*)(C))->a27)))->z2[l3]);
				l7 = (T6)(GE_int32(5));
			}
			break;
		case (T6)(T6)(GE_int32(5)):
			{
				if (!(EIF_FALSE)) {
					GE_raise(GE_EX_CHECK);
				}				t1 = (((T224*)(C))->a36?((m3 = ((T224*)(C))->a36, EIF_TRUE)):EIF_FALSE);
				if (!(t1)) {
					GE_raise(GE_EX_CHECK);
				}				l9 = EIF_FALSE;
				while (1) {
					if (l9) {
						break;
					}
					t1 = (((((((T224*)(C))->a35) != ((T6)(GE_int32(0)))))));
					if (t1) {
						t4 = ((T6)((l3)+((T6)(GE_int32(1)))));
						t4 = (((T95*)(GE_void(((T224*)(C))->a27)))->z2[t4]);
						t1 = ((T1)((((T224*)(C))->a35)<(t4)));
					}
					if (t1) {
						l6 = ((m3, ((T224*)(C))->a35, (T6)0));
						if (EIF_FALSE) {
							t4 = (T6)(GE_int32(149));
							t4 = ((T6)(-(t4)));
							t1 = ((T1)((l6)<(t4)));
							if (!(t1)) {
								t1 = (((((((T224*)(C))->a37) != ((T6)(GE_int32(0)))))));
							}
							if (t1) {
								t1 = (((((l6) == (((T224*)(C))->a37)))));
								if (t1) {
									((T224*)(C))->a37 = (T6)(GE_int32(0));
									t4 = ((T6)(-(l6)));
									l6 = ((T6)((t4)-((T6)(GE_int32(149)))));
									l9 = EIF_TRUE;
								} else {
									((T224*)(C))->a35 = ((T6)((((T224*)(C))->a35)+((T6)(GE_int32(1)))));
								}
							} else {
								t1 = ((T1)((l6)<((T6)(GE_int32(0)))));
								if (t1) {
									((T224*)(C))->a37 = ((T6)((l6)-((T6)(GE_int32(149)))));
									if (EIF_FALSE) {
										((T224*)(C))->a38 = l1;
										((T224*)(C))->a39 = ((T224*)(C))->a23;
										((T224*)(C))->a40 = ((T224*)(C))->a35;
									}
									((T224*)(C))->a35 = ((T6)((((T224*)(C))->a35)+((T6)(GE_int32(1)))));
								} else {
									((T224*)(C))->a38 = l1;
									((T224*)(C))->a39 = ((T224*)(C))->a23;
									((T224*)(C))->a40 = ((T224*)(C))->a35;
									l9 = EIF_TRUE;
								}
							}
						} else {
							((T224*)(C))->a38 = l1;
							l9 = EIF_TRUE;
						}
					} else {
						l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
						((T224*)(C))->a23 = ((T6)((((T224*)(C))->a23)-((T6)(GE_int32(1)))));
						l3 = (((T95*)(GE_void(((T224*)(C))->a22)))->z2[((T224*)(C))->a23]);
						((T224*)(C))->a35 = (((T95*)(GE_void(((T224*)(C))->a27)))->z2[l3]);
					}
				}
				l10 = ((T224*)(C))->a18;
				l11 = ((T224*)(C))->a19;
				l12 = ((T224*)(C))->a20;
				l7 = (T6)(GE_int32(4));
			}
			break;
		case (T6)(T6)(GE_int32(4)):
			l2 = ((T6)((l2)-(((T224*)(C))->a15)));
			((T224*)(C))->a17 = l2;
			((T224*)(C))->a16 = l1;
			l7 = (T6)(GE_int32(1));
			t1 = (((((l6) == ((T6)(GE_int32(0)))))));
			if (t1) {
				t1 = EIF_FALSE;
				t1 = ((T1)(!(t1)));
				if (t1) {
					l1 = ((T224*)(C))->a29;
					l2 = ((T6)((l2)+(((T224*)(C))->a15)));
					l3 = ((T224*)(C))->a28;
					l7 = (T6)(GE_int32(3));
				} else {
					((T224*)(C))->a1 = (T6)(GE_int32(-1));
					T224f214(ac, C, GE_ms8("fatal scanner internal error: no action found", 45));
				}
			} else {
				t1 = (((((l6) == ((T6)(GE_int32(150)))))));
				if (t1) {
					t4 = ((T6)((l1)-(l2)));
					l5 = ((T6)((t4)-((T6)(GE_int32(1)))));
					t4 = (((((T0*)(GE_void(((T224*)(C))->a21)))->id==278)?((T278*)(((T224*)(C))->a21))->a2:((T279*)(((T224*)(C))->a21))->a2));
					t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
					t1 = (T6f10(ac, &(((T224*)(C))->a16), t4));
					if (t1) {
						((T224*)(C))->a16 = ((T6)((l2)+(l5)));
						l3 = (T224f66(ac, C));
						l4 = (T224f67(ac, C, l3));
						l2 = ((T6)((l2)+(((T224*)(C))->a15)));
						t1 = (((((l4) != ((T6)(GE_int32(0)))))));
						if (t1) {
							l1 = ((T6)((((T224*)(C))->a16)+((T6)(GE_int32(1)))));
							((T224*)(C))->a16 = l1;
							l3 = l4;
							l7 = (T6)(GE_int32(2));
						} else {
							if (EIF_FALSE) {
								l1 = ((T224*)(C))->a16;
								((T224*)(C))->a23 = ((T6)((((T224*)(C))->a23)-((T6)(GE_int32(1)))));
							} else {
								l1 = ((T224*)(C))->a29;
								l3 = ((T224*)(C))->a28;
							}
							l7 = (T6)(GE_int32(3));
						}
					} else {
						((T224*)(C))->a16 = ((T6)((((T224*)(C))->a16)-((T6)(GE_int32(1)))));
						T224f215(ac, C);
						t1 = (((((T0*)(GE_void(((T224*)(C))->a21)))->id==278)?((T278*)(((T224*)(C))->a21))->a3:((T279*)(((T224*)(C))->a21))->a3));
						if (t1) {
							l3 = (T224f66(ac, C));
							l1 = ((T224*)(C))->a16;
							l2 = ((T6)((((T224*)(C))->a17)+(((T224*)(C))->a15)));
							l7 = (T6)(GE_int32(2));
						} else {
							t4 = ((T6)((((T224*)(C))->a16)-(((T224*)(C))->a17)));
							t4 = ((T6)((t4)-(((T224*)(C))->a15)));
							t1 = (((((t4) != ((T6)(GE_int32(0)))))));
							if (t1) {
								l3 = (T224f66(ac, C));
								l1 = ((T224*)(C))->a16;
								l2 = ((T6)((((T224*)(C))->a17)+(((T224*)(C))->a15)));
								l7 = (T6)(GE_int32(3));
							} else {
								t1 = (T224f68(ac, C));
								if (t1) {
									l2 = ((T224*)(C))->a17;
									l1 = ((T224*)(C))->a16;
									t4 = ((T6)((((T224*)(C))->a8)-((T6)(GE_int32(1)))));
									t4 = ((T6)((t4)/((T6)(GE_int32(2)))));
									T224f216(ac, C, t4);
								}
							}
						}
					}
				} else {
					T224f217(ac, C, l6);
					if (((T224*)(C))->a41) {
						((T224*)(C))->a41 = EIF_FALSE;
						((T224*)(C))->a18 = l10;
						((T224*)(C))->a19 = l11;
						((T224*)(C))->a20 = l12;
						l1 = ((T224*)(C))->a38;
						if (EIF_FALSE) {
							((T224*)(C))->a35 = ((T224*)(C))->a40;
							((T224*)(C))->a23 = ((T224*)(C))->a39;
							t4 = ((T6)((((T224*)(C))->a23)-((T6)(GE_int32(1)))));
							l3 = (((T95*)(GE_void(((T224*)(C))->a22)))->z2[t4]);
						}
						((T224*)(C))->a35 = ((T6)((((T224*)(C))->a35)+((T6)(GE_int32(1)))));
						l7 = (T6)(GE_int32(5));
					}
				}
			}
			break;
		default:
			GE_raise(GE_EX_WHEN);
			break;
		}
	}
}

/* XM_EIFFEL_SCANNER_DTD.yy_execute_action */
void T224f217(GE_context* ac, T0* C, T6 a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = (T6f10(ac, &a1, (T6)(GE_int32(75))));
	if (t1) {
		t1 = (T6f10(ac, &a1, (T6)(GE_int32(38))));
		if (t1) {
			t1 = (T6f10(ac, &a1, (T6)(GE_int32(19))));
			if (t1) {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(10))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(5))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(3))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(2))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(1)))))));
								if (t1) {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(4)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(4)))));
									T224f212(ac, C, (T6)(GE_int32(268)));
									T224f218(ac, C, (T6)(GE_int32(1)));
								} else {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(3)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(3)))));
									T224f212(ac, C, (T6)(GE_int32(269)));
									t1 = (T6f1(ac, &(((T224*)(C))->a45), (T6)(GE_int32(0))));
									if (t1) {
										T224f222(ac, C);
									}
								}
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(2)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(2)))));
								T224f212(ac, C, (T6)(GE_int32(270)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(4)))))));
							if (t1) {
								T224f223(ac, C);
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(266)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							} else {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(266)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(8))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(7))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(6)))))));
								if (t1) {
									t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
									t2 = ((T6)((t2)-(((T224*)(C))->a17)));
									((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
									t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
									t2 = ((T6)((t2)-(((T224*)(C))->a17)));
									((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
									T224f212(ac, C, (T6)(GE_int32(267)));
									((T224*)(C))->a2 = (T224f80(ac, C));
								} else {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
									T224f212(ac, C, (T6)(GE_int32(266)));
									((T224*)(C))->a2 = (T224f80(ac, C));
								}
							} else {
								T224f223(ac, C);
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(276)));
								T224f218(ac, C, (T6)(GE_int32(3)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(9)))))));
							if (t1) {
								T224f223(ac, C);
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(275)));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(2)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(2)))));
								T224f212(ac, C, (T6)(GE_int32(271)));
								T224f218(ac, C, (T6)(GE_int32(2)));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(15))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(13))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(12))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(11)))))));
								if (t1) {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(2)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(2)))));
									T224f212(ac, C, (T6)(GE_int32(277)));
									t1 = (T6f1(ac, &(((T224*)(C))->a45), (T6)(GE_int32(0))));
									if (t1) {
										T224f222(ac, C);
									}
								} else {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(7)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(7)))));
									T224f212(ac, C, (T6)(GE_int32(278)));
								}
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(3)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(3)))));
								T224f212(ac, C, (T6)(GE_int32(279)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(14)))))));
							if (t1) {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(10)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(10)))));
								T224f212(ac, C, (T6)(GE_int32(280)));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(3)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(3)))));
								T224f212(ac, C, (T6)(GE_int32(281)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(17))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(16)))))));
							if (t1) {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(2)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(2)))));
								T224f212(ac, C, (T6)(GE_int32(282)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(8)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(8)))));
								T224f212(ac, C, (T6)(GE_int32(283)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(18)))))));
							if (t1) {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(284)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(262)));
							}
						}
					}
				}
			} else {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(29))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(24))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(22))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(21))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(20)))))));
								if (t1) {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
									T224f212(ac, C, (T6)(GE_int32(264)));
								} else {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
									T224f212(ac, C, (T6)(GE_int32(265)));
								}
							} else {
								T224f223(ac, C);
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(263)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(23)))))));
							if (t1) {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(2)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(2)))));
								T224f212(ac, C, (T6)(GE_int32(274)));
								t1 = (T6f1(ac, &(((T224*)(C))->a45), (T6)(GE_int32(0))));
								if (t1) {
									T224f222(ac, C);
								}
							} else {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(272)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(27))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(26))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(25)))))));
								if (t1) {
									t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
									t2 = ((T6)((t2)-(((T224*)(C))->a17)));
									((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
									t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
									t2 = ((T6)((t2)-(((T224*)(C))->a17)));
									((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
									T224f212(ac, C, (T6)(GE_int32(273)));
									((T224*)(C))->a2 = (T224f80(ac, C));
								} else {
									T224f223(ac, C);
									t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
									t2 = ((T6)((t2)-(((T224*)(C))->a17)));
									((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
									T224f212(ac, C, (T6)(GE_int32(263)));
									((T224*)(C))->a2 = (T224f80(ac, C));
								}
							} else {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(266)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(28)))))));
							if (t1) {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(267)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(266)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(34))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(32))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(31))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(30)))))));
								if (t1) {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(9)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(9)))));
									T224f212(ac, C, (T6)(GE_int32(285)));
									T224f218(ac, C, (T6)(GE_int32(4)));
								} else {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(3)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(3)))));
									T224f212(ac, C, (T6)(GE_int32(286)));
									t1 = (T6f1(ac, &(((T224*)(C))->a45), (T6)(GE_int32(0))));
									if (t1) {
										T224f222(ac, C);
									}
								}
							} else {
								T224f223(ac, C);
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(266)));
								((T224*)(C))->a2 = (T224f106(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(33)))))));
							if (t1) {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(266)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							} else {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(267)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(36))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(35)))))));
							if (t1) {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(266)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(9)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(9)))));
								T224f212(ac, C, (T6)(GE_int32(287)));
								T224f218(ac, C, (T6)(GE_int32(12)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(37)))))));
							if (t1) {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(9)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(9)))));
								T224f212(ac, C, (T6)(GE_int32(308)));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(8)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(8)))));
								T224f212(ac, C, (T6)(GE_int32(309)));
							}
						}
					}
				}
			}
		} else {
			t1 = (T6f10(ac, &a1, (T6)(GE_int32(57))));
			if (t1) {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(48))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(43))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(41))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(40))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(39)))))));
								if (t1) {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(6)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(6)))));
									T224f212(ac, C, (T6)(GE_int32(310)));
								} else {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(5)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(5)))));
									T224f212(ac, C, (T6)(GE_int32(311)));
									((T224*)(C))->a2 = (T224f80(ac, C));
								}
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(2)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(2)))));
								T224f212(ac, C, (T6)(GE_int32(312)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(42)))))));
							if (t1) {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(5)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(5)))));
								T224f212(ac, C, (T6)(GE_int32(313)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(6)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(6)))));
								T224f212(ac, C, (T6)(GE_int32(314)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(46))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(45))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(44)))))));
								if (t1) {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(6)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(6)))));
									T224f212(ac, C, (T6)(GE_int32(315)));
									((T224*)(C))->a2 = (T224f80(ac, C));
								} else {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(8)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(8)))));
									T224f212(ac, C, (T6)(GE_int32(316)));
									((T224*)(C))->a2 = (T224f80(ac, C));
								}
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(7)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(7)))));
								T224f212(ac, C, (T6)(GE_int32(317)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(47)))))));
							if (t1) {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(8)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(8)))));
								T224f212(ac, C, (T6)(GE_int32(318)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(8)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(8)))));
								T224f212(ac, C, (T6)(GE_int32(319)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(53))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(51))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(50))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(49)))))));
								if (t1) {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
									T224f212(ac, C, (T6)(GE_int32(331)));
									T224f218(ac, C, (T6)(GE_int32(6)));
								} else {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
									T224f212(ac, C, (T6)(GE_int32(331)));
									T224f218(ac, C, (T6)(GE_int32(7)));
								}
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(289)));
								T224f218(ac, C, (T6)(GE_int32(10)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(52)))))));
							if (t1) {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(289)));
								T224f218(ac, C, (T6)(GE_int32(10)));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(290)));
								t1 = (T6f1(ac, &(((T224*)(C))->a45), (T6)(GE_int32(0))));
								if (t1) {
									T224f222(ac, C);
								}
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(55))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(54)))))));
							if (t1) {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(9)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(9)))));
								T224f212(ac, C, (T6)(GE_int32(293)));
								T224f218(ac, C, (T6)(GE_int32(13)));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(9)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(9)))));
								T224f212(ac, C, (T6)(GE_int32(294)));
								T224f218(ac, C, (T6)(GE_int32(14)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(56)))))));
							if (t1) {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(8)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(8)))));
								T224f212(ac, C, (T6)(GE_int32(295)));
								T224f218(ac, C, (T6)(GE_int32(15)));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(10)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(10)))));
								T224f212(ac, C, (T6)(GE_int32(296)));
								T224f218(ac, C, (T6)(GE_int32(16)));
							}
						}
					}
				}
			} else {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(66))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(62))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(60))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(59))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(58)))))));
								if (t1) {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(6)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(6)))));
									T224f212(ac, C, (T6)(GE_int32(325)));
									((T224*)(C))->a2 = (T224f80(ac, C));
								} else {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(7)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(7)))));
									T224f212(ac, C, (T6)(GE_int32(326)));
									((T224*)(C))->a2 = (T224f80(ac, C));
								}
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(3)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(3)))));
								T224f212(ac, C, (T6)(GE_int32(328)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(61)))))));
							if (t1) {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(3)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(3)))));
								T224f212(ac, C, (T6)(GE_int32(329)));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(3)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(3)))));
								T224f212(ac, C, (T6)(GE_int32(328)));
								T224f218(ac, C, (T6)(GE_int32(17)));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(64))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(63)))))));
							if (t1) {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(3)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(3)))));
								T224f212(ac, C, (T6)(GE_int32(329)));
								t1 = (T6f1(ac, &(((T224*)(C))->a45), (T6)(GE_int32(0))));
								if (t1) {
									T224f222(ac, C);
								}
							} else {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(266)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(65)))))));
							if (t1) {
								T224f223(ac, C);
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(266)));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(7)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(7)))));
								T224f212(ac, C, (T6)(GE_int32(304)));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(71))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(69))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(68))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(67)))))));
								if (t1) {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(5)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(5)))));
									T224f212(ac, C, (T6)(GE_int32(291)));
									((T224*)(C))->a2 = (T224f80(ac, C));
								} else {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(3)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(3)))));
									T224f212(ac, C, (T6)(GE_int32(292)));
									((T224*)(C))->a2 = (T224f80(ac, C));
								}
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(5)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(5)))));
								T224f212(ac, C, (T6)(GE_int32(327)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(70)))))));
							if (t1) {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(288)));
								t1 = (T6f1(ac, &(((T224*)(C))->a45), (T6)(GE_int32(0))));
								if (t1) {
									T224f222(ac, C);
								}
							} else {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(258)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(73))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(72)))))));
							if (t1) {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(259)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							} else {
								T224f223(ac, C);
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(263)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(74)))))));
							if (t1) {
								T224f223(ac, C);
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(306)));
								((T224*)(C))->a2 = (T224f144(ac, C));
							} else {
								T224f223(ac, C);
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(307)));
								((T224*)(C))->a2 = (T224f144(ac, C));
							}
						}
					}
				}
			}
		}
	} else {
		t1 = (T6f10(ac, &a1, (T6)(GE_int32(112))));
		if (t1) {
			t1 = (T6f10(ac, &a1, (T6)(GE_int32(94))));
			if (t1) {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(85))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(80))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(78))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(77))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(76)))))));
								if (t1) {
									T224f223(ac, C);
									t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
									t2 = ((T6)((t2)-(((T224*)(C))->a17)));
									((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
									T224f212(ac, C, (T6)(GE_int32(305)));
									((T224*)(C))->a2 = (T224f144(ac, C));
									T224f218(ac, C, (T6)(GE_int32(11)));
								} else {
									T224f223(ac, C);
									t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
									t2 = ((T6)((t2)-(((T224*)(C))->a17)));
									((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
									T224f212(ac, C, (T6)(GE_int32(306)));
									((T224*)(C))->a2 = (T224f144(ac, C));
									t1 = (T6f1(ac, &(((T224*)(C))->a45), (T6)(GE_int32(0))));
									if (t1) {
										T224f222(ac, C);
									}
								}
							} else {
								T224f223(ac, C);
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(307)));
								((T224*)(C))->a2 = (T224f144(ac, C));
								t1 = (T6f1(ac, &(((T224*)(C))->a45), (T6)(GE_int32(0))));
								if (t1) {
									T224f222(ac, C);
								}
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(79)))))));
							if (t1) {
								T224f223(ac, C);
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(288)));
								t1 = (T6f1(ac, &(((T224*)(C))->a45), (T6)(GE_int32(0))));
								if (t1) {
									T224f222(ac, C);
								}
								t1 = (T6f1(ac, &(((T224*)(C))->a45), (T6)(GE_int32(0))));
								if (t1) {
									T224f222(ac, C);
								}
							} else {
								((T224*)(C))->a18 = ((T6)((((T224*)(C))->a18)+((T6)(GE_int32(1)))));
								((T224*)(C))->a19 = (T6)(GE_int32(1));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(349)));
								t1 = (T6f1(ac, &(((T224*)(C))->a45), (T6)(GE_int32(0))));
								if (t1) {
									T224f222(ac, C);
								}
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(83))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(82))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(81)))))));
								if (t1) {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
									T224f212(ac, C, (T6)(GE_int32(299)));
								} else {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
									T224f212(ac, C, (T6)(GE_int32(300)));
								}
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(297)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(84)))))));
							if (t1) {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(298)));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(301)));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(90))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(88))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(87))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(86)))))));
								if (t1) {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
									T224f212(ac, C, (T6)(GE_int32(302)));
								} else {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
									T224f212(ac, C, (T6)(GE_int32(303)));
								}
							} else {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(260)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(89)))))));
							if (t1) {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(261)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(320)));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(92))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(91)))))));
							if (t1) {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(331)));
								T224f218(ac, C, (T6)(GE_int32(8)));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(331)));
								T224f218(ac, C, (T6)(GE_int32(9)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(93)))))));
							if (t1) {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(321)));
								t2 = (T224f162(ac, C));
								t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
								((T224*)(C))->a2 = (T224f163(ac, C, (T6)(GE_int32(2)), t2));
							} else {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(322)));
								t2 = (T224f162(ac, C));
								t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
								((T224*)(C))->a2 = (T224f163(ac, C, (T6)(GE_int32(2)), t2));
							}
						}
					}
				}
			} else {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(103))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(99))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(97))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(96))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(95)))))));
								if (t1) {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
									T224f212(ac, C, (T6)(GE_int32(348)));
								} else {
									t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
									t2 = ((T6)((t2)-(((T224*)(C))->a17)));
									((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
									t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
									t2 = ((T6)((t2)-(((T224*)(C))->a17)));
									((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
									T224f212(ac, C, (T6)(GE_int32(323)));
									t2 = (T224f162(ac, C));
									t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
									((T224*)(C))->a2 = (T224f163(ac, C, (T6)(GE_int32(2)), t2));
								}
							} else {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(324)));
								t2 = (T224f162(ac, C));
								t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
								((T224*)(C))->a2 = (T224f163(ac, C, (T6)(GE_int32(2)), t2));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(98)))))));
							if (t1) {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(348)));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(2)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(2)))));
								T224f212(ac, C, (T6)(GE_int32(334)));
								T224f218(ac, C, (T6)(GE_int32(5)));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(101))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(100)))))));
							if (t1) {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(333)));
								T224f218(ac, C, (T6)(GE_int32(5)));
							} else {
								T224f223(ac, C);
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(335)));
								t1 = (T6f1(ac, &(((T224*)(C))->a45), (T6)(GE_int32(0))));
								if (t1) {
									T224f222(ac, C);
								}
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(102)))))));
							if (t1) {
								T224f223(ac, C);
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(336)));
								t1 = (T6f1(ac, &(((T224*)(C))->a45), (T6)(GE_int32(0))));
								if (t1) {
									T224f222(ac, C);
								}
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(341)));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(108))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(106))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(105))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(104)))))));
								if (t1) {
									t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
									t2 = ((T6)((t2)-(((T224*)(C))->a17)));
									((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
									t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
									t2 = ((T6)((t2)-(((T224*)(C))->a17)));
									((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
									T224f212(ac, C, (T6)(GE_int32(337)));
									((T224*)(C))->a2 = (T224f80(ac, C));
								} else {
									t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
									t2 = ((T6)((t2)-(((T224*)(C))->a17)));
									((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
									t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
									t2 = ((T6)((t2)-(((T224*)(C))->a17)));
									((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
									T224f212(ac, C, (T6)(GE_int32(338)));
									((T224*)(C))->a2 = (T224f80(ac, C));
								}
							} else {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(339)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(107)))))));
							if (t1) {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(340)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							} else {
								T224f223(ac, C);
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(263)));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(110))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(109)))))));
							if (t1) {
								T224f223(ac, C);
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(262)));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(331)));
								T224f218(ac, C, (T6)(GE_int32(6)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(111)))))));
							if (t1) {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(331)));
								T224f218(ac, C, (T6)(GE_int32(7)));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(6)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(6)))));
								T224f212(ac, C, (T6)(GE_int32(266)));
								((T224*)(C))->a2 = GE_ms8("\'", 1);
							}
						}
					}
				}
			}
		} else {
			t1 = (T6f10(ac, &a1, (T6)(GE_int32(131))));
			if (t1) {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(122))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(117))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(115))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(114))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(113)))))));
								if (t1) {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(6)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(6)))));
									T224f212(ac, C, (T6)(GE_int32(266)));
									((T224*)(C))->a2 = GE_ms8("\"", 1);
								} else {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(4)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(4)))));
									T224f212(ac, C, (T6)(GE_int32(266)));
									((T224*)(C))->a2 = GE_ms8("<", 1);
								}
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(4)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(4)))));
								T224f212(ac, C, (T6)(GE_int32(266)));
								((T224*)(C))->a2 = GE_ms8(">", 1);
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(116)))))));
							if (t1) {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(5)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(5)))));
								T224f212(ac, C, (T6)(GE_int32(266)));
								((T224*)(C))->a2 = GE_ms8("&", 1);
							} else {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(342)));
								t2 = (T224f162(ac, C));
								t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
								((T224*)(C))->a2 = (T224f163(ac, C, (T6)(GE_int32(2)), t2));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(120))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(119))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(118)))))));
								if (t1) {
									t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
									t2 = ((T6)((t2)-(((T224*)(C))->a17)));
									((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
									t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
									t2 = ((T6)((t2)-(((T224*)(C))->a17)));
									((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
									T224f212(ac, C, (T6)(GE_int32(343)));
									t2 = (T224f162(ac, C));
									t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
									((T224*)(C))->a2 = (T224f163(ac, C, (T6)(GE_int32(2)), t2));
								} else {
									t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
									t2 = ((T6)((t2)-(((T224*)(C))->a17)));
									((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
									t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
									t2 = ((T6)((t2)-(((T224*)(C))->a17)));
									((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
									T224f212(ac, C, (T6)(GE_int32(266)));
									((T224*)(C))->a2 = (T224f80(ac, C));
								}
							} else {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(267)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(121)))))));
							if (t1) {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(266)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							} else {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(345)));
								t2 = (T224f162(ac, C));
								t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
								((T224*)(C))->a2 = (T224f163(ac, C, (T6)(GE_int32(2)), t2));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(127))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(125))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(124))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(123)))))));
								if (t1) {
									t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
									t2 = ((T6)((t2)-(((T224*)(C))->a17)));
									((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
									t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
									t2 = ((T6)((t2)-(((T224*)(C))->a17)));
									((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
									T224f212(ac, C, (T6)(GE_int32(346)));
									t2 = (T224f162(ac, C));
									t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
									((T224*)(C))->a2 = (T224f163(ac, C, (T6)(GE_int32(2)), t2));
								} else {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
									T224f212(ac, C, (T6)(GE_int32(347)));
									((T224*)(C))->a2 = (T224f80(ac, C));
								}
							} else {
								((T224*)(C))->a18 = ((T6)((((T224*)(C))->a18)+((T6)(GE_int32(1)))));
								((T224*)(C))->a19 = (T6)(GE_int32(1));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(2)))));
								T224f212(ac, C, (T6)(GE_int32(266)));
								t1 = (T224f183(ac, C));
								if (t1) {
									((T224*)(C))->a2 = ge1521ov7192;
								} else {
									((T224*)(C))->a2 = ge1521ov7191;
								}
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(126)))))));
							if (t1) {
								T224f223(ac, C);
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(266)));
								((T224*)(C))->a2 = ge1521ov7191;
							} else {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(266)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(129))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(128)))))));
							if (t1) {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(267)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							} else {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = (T224f162(ac, C));
								t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
								t3 = (T224f163(ac, C, (T6)(GE_int32(3)), t2));
								T277f9(ac, GE_void(((T224*)(C))->a9), t3);
								t1 = (T277f5(ac, GE_void(((T224*)(C))->a9)));
								if (t1) {
									t1 = (T277f2(ac, GE_void(((T224*)(C))->a9)));
									if (t1) {
										T224f212(ac, C, (T6)(GE_int32(266)));
									} else {
										T224f212(ac, C, (T6)(GE_int32(267)));
									}
									((T224*)(C))->a2 = (T277f3(ac, GE_void(((T224*)(C))->a9)));
								} else {
									T224f212(ac, C, (T6)(GE_int32(348)));
								}
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(130)))))));
							if (t1) {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = (T224f162(ac, C));
								t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
								t3 = (T224f163(ac, C, (T6)(GE_int32(4)), t2));
								T277f10(ac, GE_void(((T224*)(C))->a9), t3);
								t1 = (T277f5(ac, GE_void(((T224*)(C))->a9)));
								if (t1) {
									t1 = (T277f2(ac, GE_void(((T224*)(C))->a9)));
									if (t1) {
										T224f212(ac, C, (T6)(GE_int32(266)));
									} else {
										T224f212(ac, C, (T6)(GE_int32(267)));
									}
									((T224*)(C))->a2 = (T277f3(ac, GE_void(((T224*)(C))->a9)));
								} else {
									T224f212(ac, C, (T6)(GE_int32(348)));
								}
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(348)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						}
					}
				}
			} else {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(140))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(136))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(134))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(133))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(132)))))));
								if (t1) {
									T224f223(ac, C);
									t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
									t2 = ((T6)((t2)-(((T224*)(C))->a17)));
									((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
									T224f212(ac, C, (T6)(GE_int32(266)));
									((T224*)(C))->a2 = (T224f106(ac, C));
								} else {
									T224f223(ac, C);
									t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
									t2 = ((T6)((t2)-(((T224*)(C))->a17)));
									((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
									T224f212(ac, C, (T6)(GE_int32(266)));
									((T224*)(C))->a2 = (T224f80(ac, C));
								}
							} else {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(266)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(135)))))));
							if (t1) {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(267)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(332)));
								t1 = (T6f1(ac, &(((T224*)(C))->a45), (T6)(GE_int32(0))));
								if (t1) {
									T224f222(ac, C);
								}
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(138))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(137)))))));
							if (t1) {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(266)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(332)));
								t1 = (T6f1(ac, &(((T224*)(C))->a45), (T6)(GE_int32(0))));
								if (t1) {
									T224f222(ac, C);
								}
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(139)))))));
							if (t1) {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(266)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(3)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(3)))));
								((T224*)(C))->a1 = (T6)(GE_int32(344));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(145))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(143))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(142))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(141)))))));
								if (t1) {
									((T224*)(C))->a18 = ((T6)((((T224*)(C))->a18)+((T6)(GE_int32(1)))));
									((T224*)(C))->a19 = (T6)(GE_int32(1));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(2)))));
									T224f212(ac, C, (T6)(GE_int32(263)));
									((T224*)(C))->a2 = (T224f106(ac, C));
								} else {
									((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
									((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
									T224f212(ac, C, (T6)(GE_int32(263)));
									((T224*)(C))->a2 = (T224f106(ac, C));
								}
							} else {
								((T224*)(C))->a18 = ((T6)((((T224*)(C))->a18)+((T6)(GE_int32(1)))));
								((T224*)(C))->a19 = (T6)(GE_int32(1));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(263)));
								((T224*)(C))->a2 = (T224f106(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(144)))))));
							if (t1) {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(263)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							} else {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(266)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(147))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(146)))))));
							if (t1) {
								t2 = ((T6)((((T224*)(C))->a19)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a19 = ((T6)((t2)-(((T224*)(C))->a15)));
								t2 = ((T6)((((T224*)(C))->a20)+(((T224*)(C))->a16)));
								t2 = ((T6)((t2)-(((T224*)(C))->a17)));
								((T224*)(C))->a20 = ((T6)((t2)-(((T224*)(C))->a15)));
								T224f212(ac, C, (T6)(GE_int32(267)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							} else {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(266)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(148)))))));
							if (t1) {
								((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+((T6)(GE_int32(1)))));
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								T224f212(ac, C, (T6)(GE_int32(349)));
								((T224*)(C))->a2 = (T224f80(ac, C));
							} else {
								T224f223(ac, C);
								((T224*)(C))->a20 = ((T6)((((T224*)(C))->a20)+((T6)(GE_int32(1)))));
								((T224*)(C))->a1 = (T6)(GE_int32(-1));
								T224f214(ac, C, GE_ms8("scanner jammed", 14));
							}
						}
					}
				}
			}
		}
	}
}

/* XM_EIFFEL_SCANNER_DTD.has_normalized_newline */
T1 T224f183(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.text_substring */
T0* T224f163(GE_context* ac, T0* C, T6 a1, T6 a2)
{
	T1 t1;
	T6 t2;
	T6 t3;
	T0* R = 0;
	t1 = ((T1)((a2)<(a1)));
	if (t1) {
		R = T17c36(ac, (T6)(GE_int32(0)));
	} else {
		t2 = ((T6)((((T224*)(C))->a17)+(a1)));
		t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
		t3 = ((T6)((((T224*)(C))->a17)+(a2)));
		t3 = ((T6)((t3)-((T6)(GE_int32(1)))));
		R = (T413f3(ac, GE_void(((T224*)(C))->a26), t2, t3));
	}
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.text_count */
T6 T224f162(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = ((T6)((((T224*)(C))->a16)-(((T224*)(C))->a17)));
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.system_literal_text */
T0* T224f144(GE_context* ac, T0* C)
{
	T6 t1;
	T2 t2;
	T1 t3;
	T6 t4;
	T0* R = 0;
	T6 l1 = 0;
	T2 l2 = 0;
	t1 = (T224f162(ac, C));
	l2 = (T224f197(ac, C, t1));
	t1 = (T224f162(ac, C));
	l1 = ((T6)((t1)-((T6)(GE_int32(1)))));
	while (1) {
		t2 = (T224f197(ac, C, l1));
		t3 = (((((t2) == (l2)))));
		if (t3) {
			break;
		}
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
	}
	t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	t4 = (T224f162(ac, C));
	t4 = ((T6)((t4)-((T6)(GE_int32(1)))));
	R = (T224f163(ac, C, t1, t4));
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.text_item */
T2 T224f197(GE_context* ac, T0* C, T6 a1)
{
	T1 t1;
	T6 t2;
	T2 R = 0;
	T0* l1 = 0;
	l1 = ((T224*)(C))->a24;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		t2 = ((T6)((((T224*)(C))->a17)+(a1)));
		t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
		R = (((T15*)(GE_void(l1)))->z2[t2]);
	} else {
		t2 = ((T6)((((T224*)(C))->a17)+(a1)));
		t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
		R = (T413f6(ac, GE_void(((T224*)(C))->a26), t2));
	}
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.normalized_newline */
T0* T224f106(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge1521os7189) {
		return ge1521ov7189;
	} else {
		ge1521os7189 = '\1';
		ge1521ov7189 = R;
	}
	R = GE_ms8("\n", 1);
	ge1521ov7189 = R;
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.yy_set_line_column */
void T224f223(GE_context* ac, T0* C)
{
	T1 t1;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T0* l7 = 0;
	l7 = ((T224*)(C))->a24;
	l1 = ((T6)((((T224*)(C))->a16)-((T6)(GE_int32(1)))));
	l2 = ((T6)((((T224*)(C))->a17)+(((T224*)(C))->a15)));
	while (1) {
		t1 = ((T1)((l1)<(l2)));
		if (!(t1)) {
			t1 = (l5);
		}
		if (t1) {
			break;
		}
		t1 = ((l7)!=(EIF_VOID));
		if (t1) {
			l6 = (((T15*)(GE_void(l7)))->z2[l1]);
		} else {
			l6 = (T413f6(ac, GE_void(((T224*)(C))->a26), l1));
		}
		t1 = (((((l6) == ((T2)('\n'))))));
		if (t1) {
			l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
			l5 = EIF_TRUE;
		} else {
			l4 = ((T6)((l4)+((T6)(GE_int32(1)))));
		}
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
	}
	while (1) {
		t1 = ((T1)((l1)<(l2)));
		if (t1) {
			break;
		}
		t1 = ((l7)!=(EIF_VOID));
		if (t1) {
			l6 = (((T15*)(GE_void(l7)))->z2[l1]);
		} else {
			l6 = (T413f6(ac, GE_void(((T224*)(C))->a26), l1));
		}
		t1 = (((((l6) == ((T2)('\n'))))));
		if (t1) {
			l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
		}
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
	}
	if (l5) {
		((T224*)(C))->a18 = ((T6)((((T224*)(C))->a18)+(l3)));
		((T224*)(C))->a19 = ((T6)((l4)+((T6)(GE_int32(1)))));
	} else {
		((T224*)(C))->a19 = ((T6)((((T224*)(C))->a19)+(l4)));
	}
}

/* XM_EIFFEL_SCANNER_DTD.text */
T0* T224f80(GE_context* ac, T0* C)
{
	T1 t1;
	T6 t2;
	T0* R = 0;
	t1 = ((T1)((((T224*)(C))->a17)<(((T224*)(C))->a16)));
	if (t1) {
		t2 = ((T6)((((T224*)(C))->a16)-((T6)(GE_int32(1)))));
		R = (T413f3(ac, GE_void(((T224*)(C))->a26), ((T224*)(C))->a17, t2));
	} else {
		R = T17c36(ac, (T6)(GE_int32(0)));
	}
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.pop_start_condition */
void T224f222(GE_context* ac, T0* C)
{
	T6 t1;
	((T224*)(C))->a45 = ((T6)((((T224*)(C))->a45)-((T6)(GE_int32(1)))));
	t1 = (((T95*)(GE_void(((T224*)(C))->a42)))->z2[((T224*)(C))->a45]);
	T224f208(ac, C, t1);
}

/* XM_EIFFEL_SCANNER_DTD.push_start_condition */
void T224f218(GE_context* ac, T0* C, T6 a1)
{
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (((T95*)(GE_void(((T224*)(C))->a42)))->a2);
	t2 = (T6f8(ac, &(((T224*)(C))->a45), t1));
	if (t2) {
		t3 = (T224f62(ac, C));
		t1 = ((T6)((((T224*)(C))->a45)+((T6)(GE_int32(10)))));
		((T224*)(C))->a42 = (T106f3(ac, GE_void(t3), ((T224*)(C))->a42, t1));
	}
	t3 = (T224f62(ac, C));
	t1 = (T224f51(ac, C));
	T106f8(ac, GE_void(t3), ((T224*)(C))->a42, t1, ((T224*)(C))->a45);
	((T224*)(C))->a45 = ((T6)((((T224*)(C))->a45)+((T6)(GE_int32(1)))));
	T224f208(ac, C, a1);
}

/* XM_EIFFEL_SCANNER_DTD.yy_execute_eof_action */
void T224f216(GE_context* ac, T0* C, T6 a1)
{
	T224f213(ac, C);
}

/* XM_EIFFEL_SCANNER_DTD.wrap */
T1 T224f68(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.yy_refill_input_buffer */
void T224f215(GE_context* ac, T0* C)
{
	T0* t1;
	T6 t2;
	T6 l1 = 0;
	if (((T0*)(GE_void(((T224*)(C))->a21)))->id==278) {
		T278f13(ac, ((T224*)(C))->a21, ((T224*)(C))->a17);
	} else {
		T279f18(ac, ((T224*)(C))->a21, ((T224*)(C))->a17);
	}
	if (((T0*)(GE_void(((T224*)(C))->a21)))->id==278) {
		T278f15(ac, ((T224*)(C))->a21);
	} else {
		T279f20(ac, ((T224*)(C))->a21);
	}
	t1 = (((((T0*)(GE_void(((T224*)(C))->a21)))->id==278)?((T278*)(((T224*)(C))->a21))->a4:((T279*)(((T224*)(C))->a21))->a4));
	T224f221(ac, C, t1);
	l1 = (((((T0*)(GE_void(((T224*)(C))->a21)))->id==278)?((T278*)(((T224*)(C))->a21))->a5:((T279*)(((T224*)(C))->a21))->a5));
	t2 = ((T6)((((T224*)(C))->a16)-(((T224*)(C))->a17)));
	((T224*)(C))->a16 = ((T6)((t2)+(l1)));
	((T224*)(C))->a17 = l1;
}

/* XM_EIFFEL_SCANNER_DTD.yy_null_trans_state */
T6 T224f67(GE_context* ac, T0* C, T6 a1)
{
	T1 t1;
	T6 t2;
	T0* m1 = 0;
	T0* t3;
	T6 R = 0;
	T6 l1 = 0;
	T1 l2 = 0;
	t1 = EIF_FALSE;
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (((T95*)(GE_void(((T224*)(C))->a27)))->z2[a1]);
		t1 = (((((t2) != ((T6)(GE_int32(0)))))));
		if (t1) {
			((T224*)(C))->a28 = a1;
			((T224*)(C))->a29 = ((T224*)(C))->a16;
		}
	}
	R = a1;
	l1 = (T6)(GE_int32(1));
	while (1) {
		t2 = (((T95*)(GE_void(((T224*)(C))->a31)))->z2[R]);
		t2 = ((T6)((t2)+(l1)));
		t2 = (((T95*)(GE_void(((T224*)(C))->a30)))->z2[t2]);
		t1 = (((((t2) == (R)))));
		if (t1) {
			break;
		}
		R = (((T95*)(GE_void(((T224*)(C))->a32)))->z2[R]);
		t1 = (((T224*)(C))->a33?((m1 = ((T224*)(C))->a33, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t1 = (T6f8(ac, (&R), (T6)(GE_int32(831))));
		}
		if (t1) {
			l1 = (((T95*)(m1))->z2[l1]);
		}
	}
	t2 = (((T95*)(GE_void(((T224*)(C))->a31)))->z2[R]);
	t2 = ((T6)((t2)+(l1)));
	R = (((T95*)(GE_void(((T224*)(C))->a34)))->z2[t2]);
	if (EIF_FALSE) {
		t3 = (T224f62(ac, C));
		T106f8(ac, GE_void(t3), ((T224*)(C))->a22, R, ((T224*)(C))->a23);
		((T224*)(C))->a23 = ((T6)((((T224*)(C))->a23)+((T6)(GE_int32(1)))));
	}
	l2 = (((((R) == ((T6)(GE_int32(830)))))));
	if (l2) {
		R = (T6)(GE_int32(0));
	}
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.yy_previous_state */
T6 T224f66(GE_context* ac, T0* C)
{
	T1 t1;
	T0* t2;
	T2 t3;
	T0* m1 = 0;
	T6 t4;
	T0* m2 = 0;
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T0* l4 = 0;
	t1 = (((((T0*)(GE_void(((T224*)(C))->a21)))->id==278)?((T278*)(((T224*)(C))->a21))->a1:((T279*)(((T224*)(C))->a21))->a1));
	if (t1) {
		R = ((T6)((((T224*)(C))->a8)+((T6)(GE_int32(1)))));
	} else {
		R = ((T224*)(C))->a8;
	}
	if (EIF_FALSE) {
		t2 = (T224f62(ac, C));
		T106f8(ac, GE_void(t2), ((T224*)(C))->a22, R, (T6)(GE_int32(0)));
		((T224*)(C))->a23 = (T6)(GE_int32(1));
	}
	l4 = ((T224*)(C))->a24;
	l1 = ((T6)((((T224*)(C))->a17)+(((T224*)(C))->a15)));
	l2 = ((T224*)(C))->a16;
	while (1) {
		t1 = (T6f8(ac, (&l1), l2));
		if (t1) {
			break;
		}
		t1 = ((l4)!=(EIF_VOID));
		if (t1) {
			t3 = (((T15*)(GE_void(l4)))->z2[l1]);
			l3 = ((T6)(t3));
		} else {
			t3 = (T413f6(ac, GE_void(((T224*)(C))->a26), l1));
			l3 = ((T6)(t3));
		}
		t1 = (((((l3) == ((T6)(GE_int32(0)))))));
		if (t1) {
			l3 = (T6)(GE_int32(1));
		} else {
			t1 = (((T224*)(C))->a25?((m1 = ((T224*)(C))->a25, EIF_TRUE)):EIF_FALSE);
			if (t1) {
				l3 = (((T95*)(m1))->z2[l3]);
			}
		}
		t1 = EIF_FALSE;
		t1 = ((T1)(!(t1)));
		if (t1) {
			t4 = (((T95*)(GE_void(((T224*)(C))->a27)))->z2[R]);
			t1 = (((((t4) != ((T6)(GE_int32(0)))))));
			if (t1) {
				((T224*)(C))->a28 = R;
				((T224*)(C))->a29 = l1;
			}
		}
		while (1) {
			t4 = (((T95*)(GE_void(((T224*)(C))->a31)))->z2[R]);
			t4 = ((T6)((t4)+(l3)));
			t4 = (((T95*)(GE_void(((T224*)(C))->a30)))->z2[t4]);
			t1 = (((((t4) == (R)))));
			if (t1) {
				break;
			}
			R = (((T95*)(GE_void(((T224*)(C))->a32)))->z2[R]);
			t1 = (((T224*)(C))->a33?((m2 = ((T224*)(C))->a33, EIF_TRUE)):EIF_FALSE);
			if (t1) {
				t1 = (T6f8(ac, (&R), (T6)(GE_int32(831))));
			}
			if (t1) {
				l3 = (((T95*)(m2))->z2[l3]);
			}
		}
		t4 = (((T95*)(GE_void(((T224*)(C))->a31)))->z2[R]);
		t4 = ((T6)((t4)+(l3)));
		R = (((T95*)(GE_void(((T224*)(C))->a34)))->z2[t4]);
		if (EIF_FALSE) {
			t2 = (T224f62(ac, C));
			T106f8(ac, GE_void(t2), ((T224*)(C))->a22, R, ((T224*)(C))->a23);
			((T224*)(C))->a23 = ((T6)((((T224*)(C))->a23)+((T6)(GE_int32(1)))));
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.fatal_error */
void T224f214(GE_context* ac, T0* C, T0* a1)
{
	((T224*)(C))->a44 = a1;
}

/* XM_EIFFEL_SCANNER_DTD.terminate */
void T224f213(GE_context* ac, T0* C)
{
	((T224*)(C))->a1 = (T6)(GE_int32(0));
}

/* XM_EIFFEL_SCANNER_DTD.set_last_token */
void T224f212(GE_context* ac, T0* C, T6 a1)
{
	((T224*)(C))->a1 = a1;
}

/* XM_EIFFEL_ENTITY_DEF.read_token */
void T223f233(GE_context* ac, T0* C)
{
	T1 t1;
	T1 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 l4 = 0;
	T223f233p1(ac, C);
	t1 = ((T1)(!(((T223*)(C))->a8)));
	if (t1) {
		((T223*)(C))->a8 = EIF_TRUE;
		t1 = (T223f66(ac, C));
		if (t1) {
			t1 = (((((((T223*)(C))->a44) == ((T6)(GE_int32(276)))))));
		}
		if (t1) {
			while (1) {
				t1 = (T223f60(ac, C));
				if (!(t1)) {
					t1 = (l1);
				}
				if (t1) {
					break;
				}
				T223f233p1(ac, C);
				t1 = (((((((T223*)(C))->a44) == ((T6)(GE_int32(283)))))));
				if (t1) {
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
					l4 = EIF_TRUE;
				} else {
					t1 = (((((((T223*)(C))->a44) == ((T6)(GE_int32(278)))))));
					if (t1) {
						l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
						l4 = EIF_TRUE;
					} else {
						t1 = (((((((T223*)(C))->a44) == ((T6)(GE_int32(262)))))));
						if (t1) {
							l1 = ((T1)(!(l4)));
							l4 = EIF_FALSE;
						} else {
							t1 = (((((((T223*)(C))->a44) == ((T6)(GE_int32(263)))))));
							if (t1) {
							} else {
								t1 = (((((((T223*)(C))->a44) == ((T6)(GE_int32(264)))))));
								if (!(t1)) {
									t1 = (((((((T223*)(C))->a44) == ((T6)(GE_int32(265)))))));
								}
								if (!(t1)) {
									t1 = (((((((T223*)(C))->a44) == ((T6)(GE_int32(284)))))));
								}
								if (!(t1)) {
									t1 = (((((((T223*)(C))->a44) == ((T6)(GE_int32(279)))))));
								}
								if (t1) {
									l4 = EIF_FALSE;
								} else {
									t1 = (((((((T223*)(C))->a44) == ((T6)(GE_int32(277)))))));
									if (t1) {
										t1 = (((((l2) == ((T6)(GE_int32(1)))))));
										if (t1) {
											t1 = (T6f10(ac, (&l3), (T6)(GE_int32(1))));
										}
										if (t1) {
											T223f233p1(ac, C);
										}
										l1 = EIF_TRUE;
									} else {
										l1 = EIF_TRUE;
									}
								}
							}
						}
					}
				}
			}
		}
	}
	t1 = (T223f60(ac, C));
	if (t1) {
		((T223*)(C))->a8 = EIF_FALSE;
	}
}

/* XM_EIFFEL_ENTITY_DEF.read_token */
void T223f233p1(GE_context* ac, T0* C)
{
	T1 t1;
	T0* t2;
	T0* m1 = 0;
	T2 t3;
	T6 t4;
	T0* m2 = 0;
	T0* m3 = 0;
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
	T0* l14 = 0;
	((T223*)(C))->a44 = (T6)(GE_int32(-2));
	l7 = (T6)(GE_int32(1));
	while (1) {
		t1 = (((((((T223*)(C))->a44) != ((T6)(GE_int32(-2)))))));
		if (t1) {
			break;
		}
		switch (l7) {
		case (T6)(T6)(GE_int32(1)):
			if (((T223*)(C))->a30) {
				((T223*)(C))->a31 = ((T6)((((T223*)(C))->a26)-(((T223*)(C))->a25)));
				((T223*)(C))->a30 = EIF_FALSE;
			} else {
				((T223*)(C))->a31 = (T6)(GE_int32(0));
				((T223*)(C))->a27 = ((T223*)(C))->a22;
				((T223*)(C))->a28 = ((T223*)(C))->a23;
				((T223*)(C))->a29 = ((T223*)(C))->a24;
			}
			l1 = ((T223*)(C))->a26;
			l2 = l1;
			t1 = (((((T0*)(GE_void(((T223*)(C))->a7)))->id==278)?((T278*)(((T223*)(C))->a7))->a1:((T279*)(((T223*)(C))->a7))->a1));
			if (t1) {
				l3 = ((T6)((((T223*)(C))->a21)+((T6)(GE_int32(1)))));
			} else {
				l3 = ((T223*)(C))->a21;
			}
			if (EIF_FALSE) {
				t2 = (T223f70(ac, C));
				T106f8(ac, GE_void(t2), ((T223*)(C))->a34, l3, (T6)(GE_int32(0)));
				((T223*)(C))->a14 = (T6)(GE_int32(1));
			}
			l7 = (T6)(GE_int32(2));
			break;
		case (T6)(T6)(GE_int32(2)):
			l14 = ((T223*)(C))->a43;
			l13 = EIF_FALSE;
			while (1) {
				if (l13) {
					break;
				}
				t1 = (((T223*)(C))->a39?((m1 = ((T223*)(C))->a39, EIF_TRUE)):EIF_FALSE);
				if (t1) {
					t1 = ((l14)!=(EIF_VOID));
					if (t1) {
						t3 = (((T15*)(GE_void(l14)))->z2[l1]);
						t4 = ((T6)(t3));
						l8 = (((T95*)(m1))->z2[t4]);
					} else {
						t3 = (T413f6(ac, GE_void(((T223*)(C))->a42), l1));
						t4 = ((T6)(t3));
						l8 = (((T95*)(m1))->z2[t4]);
					}
				} else {
					t1 = ((l14)!=(EIF_VOID));
					if (t1) {
						t3 = (((T15*)(GE_void(l14)))->z2[l1]);
						l8 = ((T6)(t3));
					} else {
						t3 = (T413f6(ac, GE_void(((T223*)(C))->a42), l1));
						l8 = ((T6)(t3));
					}
				}
				t1 = EIF_FALSE;
				t1 = ((T1)(!(t1)));
				if (t1) {
					t4 = (((T95*)(GE_void(((T223*)(C))->a41)))->z2[l3]);
					t1 = (((((t4) != ((T6)(GE_int32(0)))))));
				}
				if (t1) {
					((T223*)(C))->a32 = l3;
					((T223*)(C))->a33 = l1;
				}
				while (1) {
					t4 = (((T95*)(GE_void(((T223*)(C))->a37)))->z2[l3]);
					t4 = ((T6)((t4)+(l8)));
					t4 = (((T95*)(GE_void(((T223*)(C))->a36)))->z2[t4]);
					t1 = (((((t4) == (l3)))));
					if (t1) {
						break;
					}
					l3 = (((T95*)(GE_void(((T223*)(C))->a38)))->z2[l3]);
					t1 = (((T223*)(C))->a40?((m2 = ((T223*)(C))->a40, EIF_TRUE)):EIF_FALSE);
					if (t1) {
						t1 = (T6f8(ac, (&l3), (T6)(GE_int32(831))));
					}
					if (t1) {
						l8 = (((T95*)(m2))->z2[l8]);
					}
				}
				t4 = (((T95*)(GE_void(((T223*)(C))->a37)))->z2[l3]);
				t4 = ((T6)((t4)+(l8)));
				l3 = (((T95*)(GE_void(((T223*)(C))->a35)))->z2[t4]);
				if (EIF_FALSE) {
					t2 = (T223f70(ac, C));
					T106f8(ac, GE_void(t2), ((T223*)(C))->a34, l3, ((T223*)(C))->a14);
					((T223*)(C))->a14 = ((T6)((((T223*)(C))->a14)+((T6)(GE_int32(1)))));
				}
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				l13 = (((((l3) == ((T6)(GE_int32(830)))))));
			}
			t1 = EIF_FALSE;
			t1 = ((T1)(!(t1)));
			if (t1) {
				l1 = ((T223*)(C))->a33;
				l3 = ((T223*)(C))->a32;
			}
			l7 = (T6)(GE_int32(3));
			break;
		case (T6)(T6)(GE_int32(3)):
			t1 = EIF_FALSE;
			t1 = ((T1)(!(t1)));
			if (t1) {
				l6 = (((T95*)(GE_void(((T223*)(C))->a41)))->z2[l3]);
				l7 = (T6)(GE_int32(4));
			} else {
				((T223*)(C))->a14 = ((T6)((((T223*)(C))->a14)-((T6)(GE_int32(1)))));
				l3 = (((T95*)(GE_void(((T223*)(C))->a34)))->z2[((T223*)(C))->a14]);
				((T223*)(C))->a16 = (((T95*)(GE_void(((T223*)(C))->a41)))->z2[l3]);
				l7 = (T6)(GE_int32(5));
			}
			break;
		case (T6)(T6)(GE_int32(5)):
			{
				if (!(EIF_FALSE)) {
					GE_raise(GE_EX_CHECK);
				}				t1 = (((T223*)(C))->a48?((m3 = ((T223*)(C))->a48, EIF_TRUE)):EIF_FALSE);
				if (!(t1)) {
					GE_raise(GE_EX_CHECK);
				}				l9 = EIF_FALSE;
				while (1) {
					if (l9) {
						break;
					}
					t1 = (((((((T223*)(C))->a16) != ((T6)(GE_int32(0)))))));
					if (t1) {
						t4 = ((T6)((l3)+((T6)(GE_int32(1)))));
						t4 = (((T95*)(GE_void(((T223*)(C))->a41)))->z2[t4]);
						t1 = ((T1)((((T223*)(C))->a16)<(t4)));
					}
					if (t1) {
						l6 = ((m3, ((T223*)(C))->a16, (T6)0));
						if (EIF_FALSE) {
							t4 = (T6)(GE_int32(149));
							t4 = ((T6)(-(t4)));
							t1 = ((T1)((l6)<(t4)));
							if (!(t1)) {
								t1 = (((((((T223*)(C))->a17) != ((T6)(GE_int32(0)))))));
							}
							if (t1) {
								t1 = (((((l6) == (((T223*)(C))->a17)))));
								if (t1) {
									((T223*)(C))->a17 = (T6)(GE_int32(0));
									t4 = ((T6)(-(l6)));
									l6 = ((T6)((t4)-((T6)(GE_int32(149)))));
									l9 = EIF_TRUE;
								} else {
									((T223*)(C))->a16 = ((T6)((((T223*)(C))->a16)+((T6)(GE_int32(1)))));
								}
							} else {
								t1 = ((T1)((l6)<((T6)(GE_int32(0)))));
								if (t1) {
									((T223*)(C))->a17 = ((T6)((l6)-((T6)(GE_int32(149)))));
									if (EIF_FALSE) {
										((T223*)(C))->a15 = l1;
										((T223*)(C))->a19 = ((T223*)(C))->a14;
										((T223*)(C))->a18 = ((T223*)(C))->a16;
									}
									((T223*)(C))->a16 = ((T6)((((T223*)(C))->a16)+((T6)(GE_int32(1)))));
								} else {
									((T223*)(C))->a15 = l1;
									((T223*)(C))->a19 = ((T223*)(C))->a14;
									((T223*)(C))->a18 = ((T223*)(C))->a16;
									l9 = EIF_TRUE;
								}
							}
						} else {
							((T223*)(C))->a15 = l1;
							l9 = EIF_TRUE;
						}
					} else {
						l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
						((T223*)(C))->a14 = ((T6)((((T223*)(C))->a14)-((T6)(GE_int32(1)))));
						l3 = (((T95*)(GE_void(((T223*)(C))->a34)))->z2[((T223*)(C))->a14]);
						((T223*)(C))->a16 = (((T95*)(GE_void(((T223*)(C))->a41)))->z2[l3]);
					}
				}
				l10 = ((T223*)(C))->a22;
				l11 = ((T223*)(C))->a23;
				l12 = ((T223*)(C))->a24;
				l7 = (T6)(GE_int32(4));
			}
			break;
		case (T6)(T6)(GE_int32(4)):
			l2 = ((T6)((l2)-(((T223*)(C))->a31)));
			((T223*)(C))->a25 = l2;
			((T223*)(C))->a26 = l1;
			l7 = (T6)(GE_int32(1));
			t1 = (((((l6) == ((T6)(GE_int32(0)))))));
			if (t1) {
				t1 = EIF_FALSE;
				t1 = ((T1)(!(t1)));
				if (t1) {
					l1 = ((T223*)(C))->a33;
					l2 = ((T6)((l2)+(((T223*)(C))->a31)));
					l3 = ((T223*)(C))->a32;
					l7 = (T6)(GE_int32(3));
				} else {
					((T223*)(C))->a44 = (T6)(GE_int32(-1));
					T223f238(ac, C, GE_ms8("fatal scanner internal error: no action found", 45));
				}
			} else {
				t1 = (((((l6) == ((T6)(GE_int32(150)))))));
				if (t1) {
					t4 = ((T6)((l1)-(l2)));
					l5 = ((T6)((t4)-((T6)(GE_int32(1)))));
					t4 = (((((T0*)(GE_void(((T223*)(C))->a7)))->id==278)?((T278*)(((T223*)(C))->a7))->a2:((T279*)(((T223*)(C))->a7))->a2));
					t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
					t1 = (T6f10(ac, &(((T223*)(C))->a26), t4));
					if (t1) {
						((T223*)(C))->a26 = ((T6)((l2)+(l5)));
						l3 = (T223f96(ac, C));
						l4 = (T223f97(ac, C, l3));
						l2 = ((T6)((l2)+(((T223*)(C))->a31)));
						t1 = (((((l4) != ((T6)(GE_int32(0)))))));
						if (t1) {
							l1 = ((T6)((((T223*)(C))->a26)+((T6)(GE_int32(1)))));
							((T223*)(C))->a26 = l1;
							l3 = l4;
							l7 = (T6)(GE_int32(2));
						} else {
							if (EIF_FALSE) {
								l1 = ((T223*)(C))->a26;
								((T223*)(C))->a14 = ((T6)((((T223*)(C))->a14)-((T6)(GE_int32(1)))));
							} else {
								l1 = ((T223*)(C))->a33;
								l3 = ((T223*)(C))->a32;
							}
							l7 = (T6)(GE_int32(3));
						}
					} else {
						((T223*)(C))->a26 = ((T6)((((T223*)(C))->a26)-((T6)(GE_int32(1)))));
						T223f240(ac, C);
						t1 = (((((T0*)(GE_void(((T223*)(C))->a7)))->id==278)?((T278*)(((T223*)(C))->a7))->a3:((T279*)(((T223*)(C))->a7))->a3));
						if (t1) {
							l3 = (T223f96(ac, C));
							l1 = ((T223*)(C))->a26;
							l2 = ((T6)((((T223*)(C))->a25)+(((T223*)(C))->a31)));
							l7 = (T6)(GE_int32(2));
						} else {
							t4 = ((T6)((((T223*)(C))->a26)-(((T223*)(C))->a25)));
							t4 = ((T6)((t4)-(((T223*)(C))->a31)));
							t1 = (((((t4) != ((T6)(GE_int32(0)))))));
							if (t1) {
								l3 = (T223f96(ac, C));
								l1 = ((T223*)(C))->a26;
								l2 = ((T6)((((T223*)(C))->a25)+(((T223*)(C))->a31)));
								l7 = (T6)(GE_int32(3));
							} else {
								t1 = (T223f98(ac, C));
								if (t1) {
									l2 = ((T223*)(C))->a25;
									l1 = ((T223*)(C))->a26;
									t4 = ((T6)((((T223*)(C))->a21)-((T6)(GE_int32(1)))));
									t4 = ((T6)((t4)/((T6)(GE_int32(2)))));
									T223f241(ac, C, t4);
								}
							}
						}
					}
				} else {
					T223f242(ac, C, l6);
					if (((T223*)(C))->a13) {
						((T223*)(C))->a13 = EIF_FALSE;
						((T223*)(C))->a22 = l10;
						((T223*)(C))->a23 = l11;
						((T223*)(C))->a24 = l12;
						l1 = ((T223*)(C))->a15;
						if (EIF_FALSE) {
							((T223*)(C))->a16 = ((T223*)(C))->a18;
							((T223*)(C))->a14 = ((T223*)(C))->a19;
							t4 = ((T6)((((T223*)(C))->a14)-((T6)(GE_int32(1)))));
							l3 = (((T95*)(GE_void(((T223*)(C))->a34)))->z2[t4]);
						}
						((T223*)(C))->a16 = ((T6)((((T223*)(C))->a16)+((T6)(GE_int32(1)))));
						l7 = (T6)(GE_int32(5));
					}
				}
			}
			break;
		default:
			GE_raise(GE_EX_WHEN);
			break;
		}
	}
}

/* XM_EIFFEL_ENTITY_DEF.yy_execute_action */
void T223f242(GE_context* ac, T0* C, T6 a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = (T6f10(ac, &a1, (T6)(GE_int32(75))));
	if (t1) {
		t1 = (T6f10(ac, &a1, (T6)(GE_int32(38))));
		if (t1) {
			t1 = (T6f10(ac, &a1, (T6)(GE_int32(19))));
			if (t1) {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(10))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(5))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(3))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(2))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(1)))))));
								if (t1) {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(4)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(4)))));
									T223f245(ac, C, (T6)(GE_int32(268)));
									T223f243(ac, C, (T6)(GE_int32(1)));
								} else {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(3)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(3)))));
									T223f245(ac, C, (T6)(GE_int32(269)));
									t1 = (T6f1(ac, &(((T223*)(C))->a20), (T6)(GE_int32(0))));
									if (t1) {
										T223f246(ac, C);
									}
								}
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(2)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(2)))));
								T223f245(ac, C, (T6)(GE_int32(270)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(4)))))));
							if (t1) {
								T223f247(ac, C);
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(266)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							} else {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(266)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(8))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(7))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(6)))))));
								if (t1) {
									t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
									t2 = ((T6)((t2)-(((T223*)(C))->a25)));
									((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
									t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
									t2 = ((T6)((t2)-(((T223*)(C))->a25)));
									((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
									T223f245(ac, C, (T6)(GE_int32(267)));
									((T223*)(C))->a10 = (T223f104(ac, C));
								} else {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
									T223f245(ac, C, (T6)(GE_int32(266)));
									((T223*)(C))->a10 = (T223f104(ac, C));
								}
							} else {
								T223f247(ac, C);
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(276)));
								T223f243(ac, C, (T6)(GE_int32(3)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(9)))))));
							if (t1) {
								T223f247(ac, C);
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(275)));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(2)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(2)))));
								T223f245(ac, C, (T6)(GE_int32(271)));
								T223f243(ac, C, (T6)(GE_int32(2)));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(15))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(13))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(12))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(11)))))));
								if (t1) {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(2)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(2)))));
									T223f245(ac, C, (T6)(GE_int32(277)));
									t1 = (T6f1(ac, &(((T223*)(C))->a20), (T6)(GE_int32(0))));
									if (t1) {
										T223f246(ac, C);
									}
								} else {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(7)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(7)))));
									T223f245(ac, C, (T6)(GE_int32(278)));
								}
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(3)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(3)))));
								T223f245(ac, C, (T6)(GE_int32(279)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(14)))))));
							if (t1) {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(10)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(10)))));
								T223f245(ac, C, (T6)(GE_int32(280)));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(3)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(3)))));
								T223f245(ac, C, (T6)(GE_int32(281)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(17))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(16)))))));
							if (t1) {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(2)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(2)))));
								T223f245(ac, C, (T6)(GE_int32(282)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(8)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(8)))));
								T223f245(ac, C, (T6)(GE_int32(283)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(18)))))));
							if (t1) {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(284)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(262)));
							}
						}
					}
				}
			} else {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(29))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(24))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(22))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(21))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(20)))))));
								if (t1) {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
									T223f245(ac, C, (T6)(GE_int32(264)));
								} else {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
									T223f245(ac, C, (T6)(GE_int32(265)));
								}
							} else {
								T223f247(ac, C);
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(263)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(23)))))));
							if (t1) {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(2)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(2)))));
								T223f245(ac, C, (T6)(GE_int32(274)));
								t1 = (T6f1(ac, &(((T223*)(C))->a20), (T6)(GE_int32(0))));
								if (t1) {
									T223f246(ac, C);
								}
							} else {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(272)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(27))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(26))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(25)))))));
								if (t1) {
									t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
									t2 = ((T6)((t2)-(((T223*)(C))->a25)));
									((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
									t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
									t2 = ((T6)((t2)-(((T223*)(C))->a25)));
									((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
									T223f245(ac, C, (T6)(GE_int32(273)));
									((T223*)(C))->a10 = (T223f104(ac, C));
								} else {
									T223f247(ac, C);
									t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
									t2 = ((T6)((t2)-(((T223*)(C))->a25)));
									((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
									T223f245(ac, C, (T6)(GE_int32(263)));
									((T223*)(C))->a10 = (T223f104(ac, C));
								}
							} else {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(266)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(28)))))));
							if (t1) {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(267)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(266)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(34))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(32))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(31))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(30)))))));
								if (t1) {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(9)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(9)))));
									T223f245(ac, C, (T6)(GE_int32(285)));
									T223f243(ac, C, (T6)(GE_int32(4)));
								} else {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(3)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(3)))));
									T223f245(ac, C, (T6)(GE_int32(286)));
									t1 = (T6f1(ac, &(((T223*)(C))->a20), (T6)(GE_int32(0))));
									if (t1) {
										T223f246(ac, C);
									}
								}
							} else {
								T223f247(ac, C);
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(266)));
								((T223*)(C))->a10 = (T223f120(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(33)))))));
							if (t1) {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(266)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							} else {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(267)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(36))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(35)))))));
							if (t1) {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(266)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(9)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(9)))));
								T223f245(ac, C, (T6)(GE_int32(287)));
								T223f243(ac, C, (T6)(GE_int32(12)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(37)))))));
							if (t1) {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(9)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(9)))));
								T223f245(ac, C, (T6)(GE_int32(308)));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(8)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(8)))));
								T223f245(ac, C, (T6)(GE_int32(309)));
							}
						}
					}
				}
			}
		} else {
			t1 = (T6f10(ac, &a1, (T6)(GE_int32(57))));
			if (t1) {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(48))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(43))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(41))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(40))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(39)))))));
								if (t1) {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(6)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(6)))));
									T223f245(ac, C, (T6)(GE_int32(310)));
								} else {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(5)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(5)))));
									T223f245(ac, C, (T6)(GE_int32(311)));
									((T223*)(C))->a10 = (T223f104(ac, C));
								}
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(2)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(2)))));
								T223f245(ac, C, (T6)(GE_int32(312)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(42)))))));
							if (t1) {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(5)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(5)))));
								T223f245(ac, C, (T6)(GE_int32(313)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(6)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(6)))));
								T223f245(ac, C, (T6)(GE_int32(314)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(46))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(45))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(44)))))));
								if (t1) {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(6)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(6)))));
									T223f245(ac, C, (T6)(GE_int32(315)));
									((T223*)(C))->a10 = (T223f104(ac, C));
								} else {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(8)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(8)))));
									T223f245(ac, C, (T6)(GE_int32(316)));
									((T223*)(C))->a10 = (T223f104(ac, C));
								}
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(7)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(7)))));
								T223f245(ac, C, (T6)(GE_int32(317)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(47)))))));
							if (t1) {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(8)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(8)))));
								T223f245(ac, C, (T6)(GE_int32(318)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(8)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(8)))));
								T223f245(ac, C, (T6)(GE_int32(319)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(53))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(51))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(50))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(49)))))));
								if (t1) {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
									T223f245(ac, C, (T6)(GE_int32(331)));
									T223f243(ac, C, (T6)(GE_int32(6)));
								} else {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
									T223f245(ac, C, (T6)(GE_int32(331)));
									T223f243(ac, C, (T6)(GE_int32(7)));
								}
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(289)));
								T223f243(ac, C, (T6)(GE_int32(10)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(52)))))));
							if (t1) {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(289)));
								T223f243(ac, C, (T6)(GE_int32(10)));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(290)));
								t1 = (T6f1(ac, &(((T223*)(C))->a20), (T6)(GE_int32(0))));
								if (t1) {
									T223f246(ac, C);
								}
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(55))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(54)))))));
							if (t1) {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(9)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(9)))));
								T223f245(ac, C, (T6)(GE_int32(293)));
								T223f243(ac, C, (T6)(GE_int32(13)));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(9)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(9)))));
								T223f245(ac, C, (T6)(GE_int32(294)));
								T223f243(ac, C, (T6)(GE_int32(14)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(56)))))));
							if (t1) {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(8)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(8)))));
								T223f245(ac, C, (T6)(GE_int32(295)));
								T223f243(ac, C, (T6)(GE_int32(15)));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(10)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(10)))));
								T223f245(ac, C, (T6)(GE_int32(296)));
								T223f243(ac, C, (T6)(GE_int32(16)));
							}
						}
					}
				}
			} else {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(66))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(62))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(60))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(59))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(58)))))));
								if (t1) {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(6)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(6)))));
									T223f245(ac, C, (T6)(GE_int32(325)));
									((T223*)(C))->a10 = (T223f104(ac, C));
								} else {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(7)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(7)))));
									T223f245(ac, C, (T6)(GE_int32(326)));
									((T223*)(C))->a10 = (T223f104(ac, C));
								}
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(3)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(3)))));
								T223f245(ac, C, (T6)(GE_int32(328)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(61)))))));
							if (t1) {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(3)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(3)))));
								T223f245(ac, C, (T6)(GE_int32(329)));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(3)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(3)))));
								T223f245(ac, C, (T6)(GE_int32(328)));
								T223f243(ac, C, (T6)(GE_int32(17)));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(64))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(63)))))));
							if (t1) {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(3)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(3)))));
								T223f245(ac, C, (T6)(GE_int32(329)));
								t1 = (T6f1(ac, &(((T223*)(C))->a20), (T6)(GE_int32(0))));
								if (t1) {
									T223f246(ac, C);
								}
							} else {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(266)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(65)))))));
							if (t1) {
								T223f247(ac, C);
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(266)));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(7)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(7)))));
								T223f245(ac, C, (T6)(GE_int32(304)));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(71))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(69))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(68))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(67)))))));
								if (t1) {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(5)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(5)))));
									T223f245(ac, C, (T6)(GE_int32(291)));
									((T223*)(C))->a10 = (T223f104(ac, C));
								} else {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(3)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(3)))));
									T223f245(ac, C, (T6)(GE_int32(292)));
									((T223*)(C))->a10 = (T223f104(ac, C));
								}
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(5)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(5)))));
								T223f245(ac, C, (T6)(GE_int32(327)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(70)))))));
							if (t1) {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(288)));
								t1 = (T6f1(ac, &(((T223*)(C))->a20), (T6)(GE_int32(0))));
								if (t1) {
									T223f246(ac, C);
								}
							} else {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(258)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(73))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(72)))))));
							if (t1) {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(259)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							} else {
								T223f247(ac, C);
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(263)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(74)))))));
							if (t1) {
								T223f247(ac, C);
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(306)));
								((T223*)(C))->a10 = (T223f161(ac, C));
							} else {
								T223f247(ac, C);
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(307)));
								((T223*)(C))->a10 = (T223f161(ac, C));
							}
						}
					}
				}
			}
		}
	} else {
		t1 = (T6f10(ac, &a1, (T6)(GE_int32(112))));
		if (t1) {
			t1 = (T6f10(ac, &a1, (T6)(GE_int32(94))));
			if (t1) {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(85))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(80))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(78))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(77))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(76)))))));
								if (t1) {
									T223f247(ac, C);
									t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
									t2 = ((T6)((t2)-(((T223*)(C))->a25)));
									((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
									T223f245(ac, C, (T6)(GE_int32(305)));
									((T223*)(C))->a10 = (T223f161(ac, C));
									T223f243(ac, C, (T6)(GE_int32(11)));
								} else {
									T223f247(ac, C);
									t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
									t2 = ((T6)((t2)-(((T223*)(C))->a25)));
									((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
									T223f245(ac, C, (T6)(GE_int32(306)));
									((T223*)(C))->a10 = (T223f161(ac, C));
									t1 = (T6f1(ac, &(((T223*)(C))->a20), (T6)(GE_int32(0))));
									if (t1) {
										T223f246(ac, C);
									}
								}
							} else {
								T223f247(ac, C);
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(307)));
								((T223*)(C))->a10 = (T223f161(ac, C));
								t1 = (T6f1(ac, &(((T223*)(C))->a20), (T6)(GE_int32(0))));
								if (t1) {
									T223f246(ac, C);
								}
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(79)))))));
							if (t1) {
								T223f247(ac, C);
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(288)));
								t1 = (T6f1(ac, &(((T223*)(C))->a20), (T6)(GE_int32(0))));
								if (t1) {
									T223f246(ac, C);
								}
								t1 = (T6f1(ac, &(((T223*)(C))->a20), (T6)(GE_int32(0))));
								if (t1) {
									T223f246(ac, C);
								}
							} else {
								((T223*)(C))->a22 = ((T6)((((T223*)(C))->a22)+((T6)(GE_int32(1)))));
								((T223*)(C))->a23 = (T6)(GE_int32(1));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(349)));
								t1 = (T6f1(ac, &(((T223*)(C))->a20), (T6)(GE_int32(0))));
								if (t1) {
									T223f246(ac, C);
								}
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(83))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(82))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(81)))))));
								if (t1) {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
									T223f245(ac, C, (T6)(GE_int32(299)));
								} else {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
									T223f245(ac, C, (T6)(GE_int32(300)));
								}
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(297)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(84)))))));
							if (t1) {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(298)));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(301)));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(90))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(88))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(87))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(86)))))));
								if (t1) {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
									T223f245(ac, C, (T6)(GE_int32(302)));
								} else {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
									T223f245(ac, C, (T6)(GE_int32(303)));
								}
							} else {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(260)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(89)))))));
							if (t1) {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(261)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(320)));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(92))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(91)))))));
							if (t1) {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(331)));
								T223f243(ac, C, (T6)(GE_int32(8)));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(331)));
								T223f243(ac, C, (T6)(GE_int32(9)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(93)))))));
							if (t1) {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(321)));
								t2 = (T223f179(ac, C));
								t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
								((T223*)(C))->a10 = (T223f180(ac, C, (T6)(GE_int32(2)), t2));
							} else {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(322)));
								t2 = (T223f179(ac, C));
								t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
								((T223*)(C))->a10 = (T223f180(ac, C, (T6)(GE_int32(2)), t2));
							}
						}
					}
				}
			} else {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(103))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(99))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(97))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(96))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(95)))))));
								if (t1) {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
									T223f245(ac, C, (T6)(GE_int32(348)));
								} else {
									t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
									t2 = ((T6)((t2)-(((T223*)(C))->a25)));
									((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
									t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
									t2 = ((T6)((t2)-(((T223*)(C))->a25)));
									((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
									T223f245(ac, C, (T6)(GE_int32(323)));
									t2 = (T223f179(ac, C));
									t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
									((T223*)(C))->a10 = (T223f180(ac, C, (T6)(GE_int32(2)), t2));
								}
							} else {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(324)));
								t2 = (T223f179(ac, C));
								t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
								((T223*)(C))->a10 = (T223f180(ac, C, (T6)(GE_int32(2)), t2));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(98)))))));
							if (t1) {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(348)));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(2)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(2)))));
								T223f245(ac, C, (T6)(GE_int32(334)));
								T223f243(ac, C, (T6)(GE_int32(5)));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(101))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(100)))))));
							if (t1) {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(333)));
								T223f243(ac, C, (T6)(GE_int32(5)));
							} else {
								T223f247(ac, C);
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(335)));
								t1 = (T6f1(ac, &(((T223*)(C))->a20), (T6)(GE_int32(0))));
								if (t1) {
									T223f246(ac, C);
								}
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(102)))))));
							if (t1) {
								T223f247(ac, C);
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(336)));
								t1 = (T6f1(ac, &(((T223*)(C))->a20), (T6)(GE_int32(0))));
								if (t1) {
									T223f246(ac, C);
								}
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(341)));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(108))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(106))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(105))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(104)))))));
								if (t1) {
									t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
									t2 = ((T6)((t2)-(((T223*)(C))->a25)));
									((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
									t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
									t2 = ((T6)((t2)-(((T223*)(C))->a25)));
									((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
									T223f245(ac, C, (T6)(GE_int32(337)));
									((T223*)(C))->a10 = (T223f104(ac, C));
								} else {
									t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
									t2 = ((T6)((t2)-(((T223*)(C))->a25)));
									((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
									t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
									t2 = ((T6)((t2)-(((T223*)(C))->a25)));
									((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
									T223f245(ac, C, (T6)(GE_int32(338)));
									((T223*)(C))->a10 = (T223f104(ac, C));
								}
							} else {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(339)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(107)))))));
							if (t1) {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(340)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							} else {
								T223f247(ac, C);
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(263)));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(110))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(109)))))));
							if (t1) {
								T223f247(ac, C);
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(262)));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(331)));
								T223f243(ac, C, (T6)(GE_int32(6)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(111)))))));
							if (t1) {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(331)));
								T223f243(ac, C, (T6)(GE_int32(7)));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(6)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(6)))));
								T223f245(ac, C, (T6)(GE_int32(266)));
								((T223*)(C))->a10 = GE_ms8("\'", 1);
							}
						}
					}
				}
			}
		} else {
			t1 = (T6f10(ac, &a1, (T6)(GE_int32(131))));
			if (t1) {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(122))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(117))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(115))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(114))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(113)))))));
								if (t1) {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(6)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(6)))));
									T223f245(ac, C, (T6)(GE_int32(266)));
									((T223*)(C))->a10 = GE_ms8("\"", 1);
								} else {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(4)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(4)))));
									T223f245(ac, C, (T6)(GE_int32(266)));
									((T223*)(C))->a10 = GE_ms8("<", 1);
								}
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(4)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(4)))));
								T223f245(ac, C, (T6)(GE_int32(266)));
								((T223*)(C))->a10 = GE_ms8(">", 1);
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(116)))))));
							if (t1) {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(5)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(5)))));
								T223f245(ac, C, (T6)(GE_int32(266)));
								((T223*)(C))->a10 = GE_ms8("&", 1);
							} else {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(342)));
								t2 = (T223f179(ac, C));
								t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
								((T223*)(C))->a10 = (T223f180(ac, C, (T6)(GE_int32(2)), t2));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(120))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(119))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(118)))))));
								if (t1) {
									t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
									t2 = ((T6)((t2)-(((T223*)(C))->a25)));
									((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
									t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
									t2 = ((T6)((t2)-(((T223*)(C))->a25)));
									((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
									T223f245(ac, C, (T6)(GE_int32(343)));
									t2 = (T223f179(ac, C));
									t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
									((T223*)(C))->a10 = (T223f180(ac, C, (T6)(GE_int32(2)), t2));
								} else {
									t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
									t2 = ((T6)((t2)-(((T223*)(C))->a25)));
									((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
									t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
									t2 = ((T6)((t2)-(((T223*)(C))->a25)));
									((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
									T223f245(ac, C, (T6)(GE_int32(266)));
									((T223*)(C))->a10 = (T223f104(ac, C));
								}
							} else {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(267)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(121)))))));
							if (t1) {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(266)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							} else {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(345)));
								t2 = (T223f179(ac, C));
								t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
								((T223*)(C))->a10 = (T223f180(ac, C, (T6)(GE_int32(2)), t2));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(127))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(125))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(124))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(123)))))));
								if (t1) {
									t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
									t2 = ((T6)((t2)-(((T223*)(C))->a25)));
									((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
									t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
									t2 = ((T6)((t2)-(((T223*)(C))->a25)));
									((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
									T223f245(ac, C, (T6)(GE_int32(346)));
									t2 = (T223f179(ac, C));
									t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
									((T223*)(C))->a10 = (T223f180(ac, C, (T6)(GE_int32(2)), t2));
								} else {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
									T223f245(ac, C, (T6)(GE_int32(347)));
									((T223*)(C))->a10 = (T223f104(ac, C));
								}
							} else {
								((T223*)(C))->a22 = ((T6)((((T223*)(C))->a22)+((T6)(GE_int32(1)))));
								((T223*)(C))->a23 = (T6)(GE_int32(1));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(2)))));
								T223f245(ac, C, (T6)(GE_int32(266)));
								t1 = (T223f200(ac, C));
								if (t1) {
									((T223*)(C))->a10 = ge1521ov7192;
								} else {
									((T223*)(C))->a10 = ge1521ov7191;
								}
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(126)))))));
							if (t1) {
								T223f247(ac, C);
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(266)));
								((T223*)(C))->a10 = ge1521ov7191;
							} else {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(266)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(129))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(128)))))));
							if (t1) {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(267)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							} else {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = (T223f179(ac, C));
								t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
								t3 = (T223f180(ac, C, (T6)(GE_int32(3)), t2));
								T277f9(ac, GE_void(((T223*)(C))->a5), t3);
								t1 = (T277f5(ac, GE_void(((T223*)(C))->a5)));
								if (t1) {
									t1 = (T277f2(ac, GE_void(((T223*)(C))->a5)));
									if (t1) {
										T223f245(ac, C, (T6)(GE_int32(266)));
									} else {
										T223f245(ac, C, (T6)(GE_int32(267)));
									}
									((T223*)(C))->a10 = (T277f3(ac, GE_void(((T223*)(C))->a5)));
								} else {
									T223f245(ac, C, (T6)(GE_int32(348)));
								}
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(130)))))));
							if (t1) {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = (T223f179(ac, C));
								t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
								t3 = (T223f180(ac, C, (T6)(GE_int32(4)), t2));
								T277f10(ac, GE_void(((T223*)(C))->a5), t3);
								t1 = (T277f5(ac, GE_void(((T223*)(C))->a5)));
								if (t1) {
									t1 = (T277f2(ac, GE_void(((T223*)(C))->a5)));
									if (t1) {
										T223f245(ac, C, (T6)(GE_int32(266)));
									} else {
										T223f245(ac, C, (T6)(GE_int32(267)));
									}
									((T223*)(C))->a10 = (T277f3(ac, GE_void(((T223*)(C))->a5)));
								} else {
									T223f245(ac, C, (T6)(GE_int32(348)));
								}
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(348)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						}
					}
				}
			} else {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(140))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(136))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(134))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(133))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(132)))))));
								if (t1) {
									T223f247(ac, C);
									t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
									t2 = ((T6)((t2)-(((T223*)(C))->a25)));
									((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
									T223f245(ac, C, (T6)(GE_int32(266)));
									((T223*)(C))->a10 = (T223f120(ac, C));
								} else {
									T223f247(ac, C);
									t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
									t2 = ((T6)((t2)-(((T223*)(C))->a25)));
									((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
									T223f245(ac, C, (T6)(GE_int32(266)));
									((T223*)(C))->a10 = (T223f104(ac, C));
								}
							} else {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(266)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(135)))))));
							if (t1) {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(267)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(332)));
								t1 = (T6f1(ac, &(((T223*)(C))->a20), (T6)(GE_int32(0))));
								if (t1) {
									T223f246(ac, C);
								}
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(138))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(137)))))));
							if (t1) {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(266)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(332)));
								t1 = (T6f1(ac, &(((T223*)(C))->a20), (T6)(GE_int32(0))));
								if (t1) {
									T223f246(ac, C);
								}
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(139)))))));
							if (t1) {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(266)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(3)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(3)))));
								((T223*)(C))->a44 = (T6)(GE_int32(344));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(145))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(143))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(142))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(141)))))));
								if (t1) {
									((T223*)(C))->a22 = ((T6)((((T223*)(C))->a22)+((T6)(GE_int32(1)))));
									((T223*)(C))->a23 = (T6)(GE_int32(1));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(2)))));
									T223f245(ac, C, (T6)(GE_int32(263)));
									((T223*)(C))->a10 = (T223f120(ac, C));
								} else {
									((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
									((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
									T223f245(ac, C, (T6)(GE_int32(263)));
									((T223*)(C))->a10 = (T223f120(ac, C));
								}
							} else {
								((T223*)(C))->a22 = ((T6)((((T223*)(C))->a22)+((T6)(GE_int32(1)))));
								((T223*)(C))->a23 = (T6)(GE_int32(1));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(263)));
								((T223*)(C))->a10 = (T223f120(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(144)))))));
							if (t1) {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(263)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							} else {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(266)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(147))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(146)))))));
							if (t1) {
								t2 = ((T6)((((T223*)(C))->a23)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a23 = ((T6)((t2)-(((T223*)(C))->a31)));
								t2 = ((T6)((((T223*)(C))->a24)+(((T223*)(C))->a26)));
								t2 = ((T6)((t2)-(((T223*)(C))->a25)));
								((T223*)(C))->a24 = ((T6)((t2)-(((T223*)(C))->a31)));
								T223f245(ac, C, (T6)(GE_int32(267)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							} else {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(266)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(148)))))));
							if (t1) {
								((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+((T6)(GE_int32(1)))));
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								T223f245(ac, C, (T6)(GE_int32(349)));
								((T223*)(C))->a10 = (T223f104(ac, C));
							} else {
								T223f247(ac, C);
								((T223*)(C))->a24 = ((T6)((((T223*)(C))->a24)+((T6)(GE_int32(1)))));
								((T223*)(C))->a44 = (T6)(GE_int32(-1));
								T223f238(ac, C, GE_ms8("scanner jammed", 14));
							}
						}
					}
				}
			}
		}
	}
}

/* XM_EIFFEL_ENTITY_DEF.has_normalized_newline */
T1 T223f200(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T223f63(ac, C));
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.text_substring */
T0* T223f180(GE_context* ac, T0* C, T6 a1, T6 a2)
{
	T1 t1;
	T6 t2;
	T6 t3;
	T0* R = 0;
	t1 = ((T1)((a2)<(a1)));
	if (t1) {
		R = T17c36(ac, (T6)(GE_int32(0)));
	} else {
		t2 = ((T6)((((T223*)(C))->a25)+(a1)));
		t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
		t3 = ((T6)((((T223*)(C))->a25)+(a2)));
		t3 = ((T6)((t3)-((T6)(GE_int32(1)))));
		R = (T413f3(ac, GE_void(((T223*)(C))->a42), t2, t3));
	}
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.text_count */
T6 T223f179(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = ((T6)((((T223*)(C))->a26)-(((T223*)(C))->a25)));
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.system_literal_text */
T0* T223f161(GE_context* ac, T0* C)
{
	T6 t1;
	T2 t2;
	T1 t3;
	T6 t4;
	T0* R = 0;
	T6 l1 = 0;
	T2 l2 = 0;
	t1 = (T223f179(ac, C));
	l2 = (T223f207(ac, C, t1));
	t1 = (T223f179(ac, C));
	l1 = ((T6)((t1)-((T6)(GE_int32(1)))));
	while (1) {
		t2 = (T223f207(ac, C, l1));
		t3 = (((((t2) == (l2)))));
		if (t3) {
			break;
		}
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
	}
	t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	t4 = (T223f179(ac, C));
	t4 = ((T6)((t4)-((T6)(GE_int32(1)))));
	R = (T223f180(ac, C, t1, t4));
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.text_item */
T2 T223f207(GE_context* ac, T0* C, T6 a1)
{
	T1 t1;
	T6 t2;
	T2 R = 0;
	T0* l1 = 0;
	l1 = ((T223*)(C))->a43;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		t2 = ((T6)((((T223*)(C))->a25)+(a1)));
		t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
		R = (((T15*)(GE_void(l1)))->z2[t2]);
	} else {
		t2 = ((T6)((((T223*)(C))->a25)+(a1)));
		t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
		R = (T413f6(ac, GE_void(((T223*)(C))->a42), t2));
	}
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
T0* T223f120(GE_context* ac, T0* C)
{
	T1 t1;
	T0* R = 0;
	t1 = (T223f63(ac, C));
	if (t1) {
		R = (T223f104(ac, C));
	} else {
		R = (T223f120p1(ac, C));
	}
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.normalized_newline */
T0* T223f120p1(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge1521os7189) {
		return ge1521ov7189;
	} else {
		ge1521os7189 = '\1';
		ge1521ov7189 = R;
	}
	R = GE_ms8("\n", 1);
	ge1521ov7189 = R;
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.yy_set_line_column */
void T223f247(GE_context* ac, T0* C)
{
	T1 t1;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T0* l7 = 0;
	l7 = ((T223*)(C))->a43;
	l1 = ((T6)((((T223*)(C))->a26)-((T6)(GE_int32(1)))));
	l2 = ((T6)((((T223*)(C))->a25)+(((T223*)(C))->a31)));
	while (1) {
		t1 = ((T1)((l1)<(l2)));
		if (!(t1)) {
			t1 = (l5);
		}
		if (t1) {
			break;
		}
		t1 = ((l7)!=(EIF_VOID));
		if (t1) {
			l6 = (((T15*)(GE_void(l7)))->z2[l1]);
		} else {
			l6 = (T413f6(ac, GE_void(((T223*)(C))->a42), l1));
		}
		t1 = (((((l6) == ((T2)('\n'))))));
		if (t1) {
			l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
			l5 = EIF_TRUE;
		} else {
			l4 = ((T6)((l4)+((T6)(GE_int32(1)))));
		}
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
	}
	while (1) {
		t1 = ((T1)((l1)<(l2)));
		if (t1) {
			break;
		}
		t1 = ((l7)!=(EIF_VOID));
		if (t1) {
			l6 = (((T15*)(GE_void(l7)))->z2[l1]);
		} else {
			l6 = (T413f6(ac, GE_void(((T223*)(C))->a42), l1));
		}
		t1 = (((((l6) == ((T2)('\n'))))));
		if (t1) {
			l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
		}
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
	}
	if (l5) {
		((T223*)(C))->a22 = ((T6)((((T223*)(C))->a22)+(l3)));
		((T223*)(C))->a23 = ((T6)((l4)+((T6)(GE_int32(1)))));
	} else {
		((T223*)(C))->a23 = ((T6)((((T223*)(C))->a23)+(l4)));
	}
}

/* XM_EIFFEL_ENTITY_DEF.text */
T0* T223f104(GE_context* ac, T0* C)
{
	T1 t1;
	T6 t2;
	T0* R = 0;
	t1 = ((T1)((((T223*)(C))->a25)<(((T223*)(C))->a26)));
	if (t1) {
		t2 = ((T6)((((T223*)(C))->a26)-((T6)(GE_int32(1)))));
		R = (T413f3(ac, GE_void(((T223*)(C))->a42), ((T223*)(C))->a25, t2));
	} else {
		R = T17c36(ac, (T6)(GE_int32(0)));
	}
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.pop_start_condition */
void T223f246(GE_context* ac, T0* C)
{
	T6 t1;
	((T223*)(C))->a20 = ((T6)((((T223*)(C))->a20)-((T6)(GE_int32(1)))));
	t1 = (((T95*)(GE_void(((T223*)(C))->a6)))->z2[((T223*)(C))->a20]);
	T223f231(ac, C, t1);
}

/* XM_EIFFEL_ENTITY_DEF.push_start_condition */
void T223f243(GE_context* ac, T0* C, T6 a1)
{
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (((T95*)(GE_void(((T223*)(C))->a6)))->a2);
	t2 = (T6f8(ac, &(((T223*)(C))->a20), t1));
	if (t2) {
		t3 = (T223f70(ac, C));
		t1 = ((T6)((((T223*)(C))->a20)+((T6)(GE_int32(10)))));
		((T223*)(C))->a6 = (T106f3(ac, GE_void(t3), ((T223*)(C))->a6, t1));
	}
	t3 = (T223f70(ac, C));
	t1 = (T223f62(ac, C));
	T106f8(ac, GE_void(t3), ((T223*)(C))->a6, t1, ((T223*)(C))->a20);
	((T223*)(C))->a20 = ((T6)((((T223*)(C))->a20)+((T6)(GE_int32(1)))));
	T223f231(ac, C, a1);
}

/* XM_EIFFEL_ENTITY_DEF.set_last_token */
void T223f245(GE_context* ac, T0* C, T6 a1)
{
	((T223*)(C))->a44 = a1;
}

/* XM_EIFFEL_ENTITY_DEF.yy_execute_eof_action */
void T223f241(GE_context* ac, T0* C, T6 a1)
{
	T223f244(ac, C);
}

/* XM_EIFFEL_ENTITY_DEF.terminate */
void T223f244(GE_context* ac, T0* C)
{
	((T223*)(C))->a44 = (T6)(GE_int32(0));
}

/* XM_EIFFEL_ENTITY_DEF.wrap */
T1 T223f98(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.yy_refill_input_buffer */
void T223f240(GE_context* ac, T0* C)
{
	T0* t1;
	T6 t2;
	T6 l1 = 0;
	if (((T0*)(GE_void(((T223*)(C))->a7)))->id==278) {
		T278f13(ac, ((T223*)(C))->a7, ((T223*)(C))->a25);
	} else {
		T279f18(ac, ((T223*)(C))->a7, ((T223*)(C))->a25);
	}
	if (((T0*)(GE_void(((T223*)(C))->a7)))->id==278) {
		T278f15(ac, ((T223*)(C))->a7);
	} else {
		T279f20(ac, ((T223*)(C))->a7);
	}
	t1 = (((((T0*)(GE_void(((T223*)(C))->a7)))->id==278)?((T278*)(((T223*)(C))->a7))->a4:((T279*)(((T223*)(C))->a7))->a4));
	T223f216(ac, C, t1);
	l1 = (((((T0*)(GE_void(((T223*)(C))->a7)))->id==278)?((T278*)(((T223*)(C))->a7))->a5:((T279*)(((T223*)(C))->a7))->a5));
	t2 = ((T6)((((T223*)(C))->a26)-(((T223*)(C))->a25)));
	((T223*)(C))->a26 = ((T6)((t2)+(l1)));
	((T223*)(C))->a25 = l1;
}

/* XM_EIFFEL_ENTITY_DEF.yy_null_trans_state */
T6 T223f97(GE_context* ac, T0* C, T6 a1)
{
	T1 t1;
	T6 t2;
	T0* m1 = 0;
	T0* t3;
	T6 R = 0;
	T6 l1 = 0;
	T1 l2 = 0;
	t1 = EIF_FALSE;
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (((T95*)(GE_void(((T223*)(C))->a41)))->z2[a1]);
		t1 = (((((t2) != ((T6)(GE_int32(0)))))));
		if (t1) {
			((T223*)(C))->a32 = a1;
			((T223*)(C))->a33 = ((T223*)(C))->a26;
		}
	}
	R = a1;
	l1 = (T6)(GE_int32(1));
	while (1) {
		t2 = (((T95*)(GE_void(((T223*)(C))->a37)))->z2[R]);
		t2 = ((T6)((t2)+(l1)));
		t2 = (((T95*)(GE_void(((T223*)(C))->a36)))->z2[t2]);
		t1 = (((((t2) == (R)))));
		if (t1) {
			break;
		}
		R = (((T95*)(GE_void(((T223*)(C))->a38)))->z2[R]);
		t1 = (((T223*)(C))->a40?((m1 = ((T223*)(C))->a40, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t1 = (T6f8(ac, (&R), (T6)(GE_int32(831))));
		}
		if (t1) {
			l1 = (((T95*)(m1))->z2[l1]);
		}
	}
	t2 = (((T95*)(GE_void(((T223*)(C))->a37)))->z2[R]);
	t2 = ((T6)((t2)+(l1)));
	R = (((T95*)(GE_void(((T223*)(C))->a35)))->z2[t2]);
	if (EIF_FALSE) {
		t3 = (T223f70(ac, C));
		T106f8(ac, GE_void(t3), ((T223*)(C))->a34, R, ((T223*)(C))->a14);
		((T223*)(C))->a14 = ((T6)((((T223*)(C))->a14)+((T6)(GE_int32(1)))));
	}
	l2 = (((((R) == ((T6)(GE_int32(830)))))));
	if (l2) {
		R = (T6)(GE_int32(0));
	}
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.yy_previous_state */
T6 T223f96(GE_context* ac, T0* C)
{
	T1 t1;
	T0* t2;
	T2 t3;
	T0* m1 = 0;
	T6 t4;
	T0* m2 = 0;
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T0* l4 = 0;
	t1 = (((((T0*)(GE_void(((T223*)(C))->a7)))->id==278)?((T278*)(((T223*)(C))->a7))->a1:((T279*)(((T223*)(C))->a7))->a1));
	if (t1) {
		R = ((T6)((((T223*)(C))->a21)+((T6)(GE_int32(1)))));
	} else {
		R = ((T223*)(C))->a21;
	}
	if (EIF_FALSE) {
		t2 = (T223f70(ac, C));
		T106f8(ac, GE_void(t2), ((T223*)(C))->a34, R, (T6)(GE_int32(0)));
		((T223*)(C))->a14 = (T6)(GE_int32(1));
	}
	l4 = ((T223*)(C))->a43;
	l1 = ((T6)((((T223*)(C))->a25)+(((T223*)(C))->a31)));
	l2 = ((T223*)(C))->a26;
	while (1) {
		t1 = (T6f8(ac, (&l1), l2));
		if (t1) {
			break;
		}
		t1 = ((l4)!=(EIF_VOID));
		if (t1) {
			t3 = (((T15*)(GE_void(l4)))->z2[l1]);
			l3 = ((T6)(t3));
		} else {
			t3 = (T413f6(ac, GE_void(((T223*)(C))->a42), l1));
			l3 = ((T6)(t3));
		}
		t1 = (((((l3) == ((T6)(GE_int32(0)))))));
		if (t1) {
			l3 = (T6)(GE_int32(1));
		} else {
			t1 = (((T223*)(C))->a39?((m1 = ((T223*)(C))->a39, EIF_TRUE)):EIF_FALSE);
			if (t1) {
				l3 = (((T95*)(m1))->z2[l3]);
			}
		}
		t1 = EIF_FALSE;
		t1 = ((T1)(!(t1)));
		if (t1) {
			t4 = (((T95*)(GE_void(((T223*)(C))->a41)))->z2[R]);
			t1 = (((((t4) != ((T6)(GE_int32(0)))))));
			if (t1) {
				((T223*)(C))->a32 = R;
				((T223*)(C))->a33 = l1;
			}
		}
		while (1) {
			t4 = (((T95*)(GE_void(((T223*)(C))->a37)))->z2[R]);
			t4 = ((T6)((t4)+(l3)));
			t4 = (((T95*)(GE_void(((T223*)(C))->a36)))->z2[t4]);
			t1 = (((((t4) == (R)))));
			if (t1) {
				break;
			}
			R = (((T95*)(GE_void(((T223*)(C))->a38)))->z2[R]);
			t1 = (((T223*)(C))->a40?((m2 = ((T223*)(C))->a40, EIF_TRUE)):EIF_FALSE);
			if (t1) {
				t1 = (T6f8(ac, (&R), (T6)(GE_int32(831))));
			}
			if (t1) {
				l3 = (((T95*)(m2))->z2[l3]);
			}
		}
		t4 = (((T95*)(GE_void(((T223*)(C))->a37)))->z2[R]);
		t4 = ((T6)((t4)+(l3)));
		R = (((T95*)(GE_void(((T223*)(C))->a35)))->z2[t4]);
		if (EIF_FALSE) {
			t2 = (T223f70(ac, C));
			T106f8(ac, GE_void(t2), ((T223*)(C))->a34, R, ((T223*)(C))->a14);
			((T223*)(C))->a14 = ((T6)((((T223*)(C))->a14)+((T6)(GE_int32(1)))));
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	return R;
}

/* XM_EIFFEL_SCANNER.read_token */
void T183f201(GE_context* ac, T0* C)
{
	T1 t1;
	T0* t2;
	T0* m1 = 0;
	T2 t3;
	T6 t4;
	T0* m2 = 0;
	T0* m3 = 0;
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
	T0* l14 = 0;
	((T183*)(C))->a1 = (T6)(GE_int32(-2));
	l7 = (T6)(GE_int32(1));
	while (1) {
		t1 = (((((((T183*)(C))->a1) != ((T6)(GE_int32(-2)))))));
		if (t1) {
			break;
		}
		switch (l7) {
		case (T6)(T6)(GE_int32(1)):
			if (((T183*)(C))->a12) {
				((T183*)(C))->a13 = ((T6)((((T183*)(C))->a14)-(((T183*)(C))->a15)));
				((T183*)(C))->a12 = EIF_FALSE;
			} else {
				((T183*)(C))->a13 = (T6)(GE_int32(0));
				((T183*)(C))->a6 = ((T183*)(C))->a16;
				((T183*)(C))->a5 = ((T183*)(C))->a17;
				((T183*)(C))->a4 = ((T183*)(C))->a18;
			}
			l1 = ((T183*)(C))->a14;
			l2 = l1;
			t1 = (((((T0*)(GE_void(((T183*)(C))->a19)))->id==279)?((T279*)(((T183*)(C))->a19))->a1:((T278*)(((T183*)(C))->a19))->a1));
			if (t1) {
				l3 = ((T6)((((T183*)(C))->a8)+((T6)(GE_int32(1)))));
			} else {
				l3 = ((T183*)(C))->a8;
			}
			if (EIF_FALSE) {
				t2 = (T183f51(ac, C));
				T106f8(ac, GE_void(t2), ((T183*)(C))->a20, l3, (T6)(GE_int32(0)));
				((T183*)(C))->a21 = (T6)(GE_int32(1));
			}
			l7 = (T6)(GE_int32(2));
			break;
		case (T6)(T6)(GE_int32(2)):
			l14 = ((T183*)(C))->a22;
			l13 = EIF_FALSE;
			while (1) {
				if (l13) {
					break;
				}
				t1 = (((T183*)(C))->a23?((m1 = ((T183*)(C))->a23, EIF_TRUE)):EIF_FALSE);
				if (t1) {
					t1 = ((l14)!=(EIF_VOID));
					if (t1) {
						t3 = (((T15*)(GE_void(l14)))->z2[l1]);
						t4 = ((T6)(t3));
						l8 = (((T95*)(m1))->z2[t4]);
					} else {
						t3 = (T413f6(ac, GE_void(((T183*)(C))->a24), l1));
						t4 = ((T6)(t3));
						l8 = (((T95*)(m1))->z2[t4]);
					}
				} else {
					t1 = ((l14)!=(EIF_VOID));
					if (t1) {
						t3 = (((T15*)(GE_void(l14)))->z2[l1]);
						l8 = ((T6)(t3));
					} else {
						t3 = (T413f6(ac, GE_void(((T183*)(C))->a24), l1));
						l8 = ((T6)(t3));
					}
				}
				t1 = EIF_FALSE;
				t1 = ((T1)(!(t1)));
				if (t1) {
					t4 = (((T95*)(GE_void(((T183*)(C))->a25)))->z2[l3]);
					t1 = (((((t4) != ((T6)(GE_int32(0)))))));
				}
				if (t1) {
					((T183*)(C))->a26 = l3;
					((T183*)(C))->a27 = l1;
				}
				while (1) {
					t4 = (((T95*)(GE_void(((T183*)(C))->a29)))->z2[l3]);
					t4 = ((T6)((t4)+(l8)));
					t4 = (((T95*)(GE_void(((T183*)(C))->a28)))->z2[t4]);
					t1 = (((((t4) == (l3)))));
					if (t1) {
						break;
					}
					l3 = (((T95*)(GE_void(((T183*)(C))->a30)))->z2[l3]);
					t1 = (((T183*)(C))->a31?((m2 = ((T183*)(C))->a31, EIF_TRUE)):EIF_FALSE);
					if (t1) {
						t1 = (T6f8(ac, (&l3), (T6)(GE_int32(831))));
					}
					if (t1) {
						l8 = (((T95*)(m2))->z2[l8]);
					}
				}
				t4 = (((T95*)(GE_void(((T183*)(C))->a29)))->z2[l3]);
				t4 = ((T6)((t4)+(l8)));
				l3 = (((T95*)(GE_void(((T183*)(C))->a32)))->z2[t4]);
				if (EIF_FALSE) {
					t2 = (T183f51(ac, C));
					T106f8(ac, GE_void(t2), ((T183*)(C))->a20, l3, ((T183*)(C))->a21);
					((T183*)(C))->a21 = ((T6)((((T183*)(C))->a21)+((T6)(GE_int32(1)))));
				}
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				l13 = (((((l3) == ((T6)(GE_int32(830)))))));
			}
			t1 = EIF_FALSE;
			t1 = ((T1)(!(t1)));
			if (t1) {
				l1 = ((T183*)(C))->a27;
				l3 = ((T183*)(C))->a26;
			}
			l7 = (T6)(GE_int32(3));
			break;
		case (T6)(T6)(GE_int32(3)):
			t1 = EIF_FALSE;
			t1 = ((T1)(!(t1)));
			if (t1) {
				l6 = (((T95*)(GE_void(((T183*)(C))->a25)))->z2[l3]);
				l7 = (T6)(GE_int32(4));
			} else {
				((T183*)(C))->a21 = ((T6)((((T183*)(C))->a21)-((T6)(GE_int32(1)))));
				l3 = (((T95*)(GE_void(((T183*)(C))->a20)))->z2[((T183*)(C))->a21]);
				((T183*)(C))->a33 = (((T95*)(GE_void(((T183*)(C))->a25)))->z2[l3]);
				l7 = (T6)(GE_int32(5));
			}
			break;
		case (T6)(T6)(GE_int32(5)):
			{
				if (!(EIF_FALSE)) {
					GE_raise(GE_EX_CHECK);
				}				t1 = (((T183*)(C))->a34?((m3 = ((T183*)(C))->a34, EIF_TRUE)):EIF_FALSE);
				if (!(t1)) {
					GE_raise(GE_EX_CHECK);
				}				l9 = EIF_FALSE;
				while (1) {
					if (l9) {
						break;
					}
					t1 = (((((((T183*)(C))->a33) != ((T6)(GE_int32(0)))))));
					if (t1) {
						t4 = ((T6)((l3)+((T6)(GE_int32(1)))));
						t4 = (((T95*)(GE_void(((T183*)(C))->a25)))->z2[t4]);
						t1 = ((T1)((((T183*)(C))->a33)<(t4)));
					}
					if (t1) {
						l6 = ((m3, ((T183*)(C))->a33, (T6)0));
						if (EIF_FALSE) {
							t4 = (T6)(GE_int32(149));
							t4 = ((T6)(-(t4)));
							t1 = ((T1)((l6)<(t4)));
							if (!(t1)) {
								t1 = (((((((T183*)(C))->a35) != ((T6)(GE_int32(0)))))));
							}
							if (t1) {
								t1 = (((((l6) == (((T183*)(C))->a35)))));
								if (t1) {
									((T183*)(C))->a35 = (T6)(GE_int32(0));
									t4 = ((T6)(-(l6)));
									l6 = ((T6)((t4)-((T6)(GE_int32(149)))));
									l9 = EIF_TRUE;
								} else {
									((T183*)(C))->a33 = ((T6)((((T183*)(C))->a33)+((T6)(GE_int32(1)))));
								}
							} else {
								t1 = ((T1)((l6)<((T6)(GE_int32(0)))));
								if (t1) {
									((T183*)(C))->a35 = ((T6)((l6)-((T6)(GE_int32(149)))));
									if (EIF_FALSE) {
										((T183*)(C))->a36 = l1;
										((T183*)(C))->a37 = ((T183*)(C))->a21;
										((T183*)(C))->a38 = ((T183*)(C))->a33;
									}
									((T183*)(C))->a33 = ((T6)((((T183*)(C))->a33)+((T6)(GE_int32(1)))));
								} else {
									((T183*)(C))->a36 = l1;
									((T183*)(C))->a37 = ((T183*)(C))->a21;
									((T183*)(C))->a38 = ((T183*)(C))->a33;
									l9 = EIF_TRUE;
								}
							}
						} else {
							((T183*)(C))->a36 = l1;
							l9 = EIF_TRUE;
						}
					} else {
						l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
						((T183*)(C))->a21 = ((T6)((((T183*)(C))->a21)-((T6)(GE_int32(1)))));
						l3 = (((T95*)(GE_void(((T183*)(C))->a20)))->z2[((T183*)(C))->a21]);
						((T183*)(C))->a33 = (((T95*)(GE_void(((T183*)(C))->a25)))->z2[l3]);
					}
				}
				l10 = ((T183*)(C))->a16;
				l11 = ((T183*)(C))->a17;
				l12 = ((T183*)(C))->a18;
				l7 = (T6)(GE_int32(4));
			}
			break;
		case (T6)(T6)(GE_int32(4)):
			l2 = ((T6)((l2)-(((T183*)(C))->a13)));
			((T183*)(C))->a15 = l2;
			((T183*)(C))->a14 = l1;
			l7 = (T6)(GE_int32(1));
			t1 = (((((l6) == ((T6)(GE_int32(0)))))));
			if (t1) {
				t1 = EIF_FALSE;
				t1 = ((T1)(!(t1)));
				if (t1) {
					l1 = ((T183*)(C))->a27;
					l2 = ((T6)((l2)+(((T183*)(C))->a13)));
					l3 = ((T183*)(C))->a26;
					l7 = (T6)(GE_int32(3));
				} else {
					((T183*)(C))->a1 = (T6)(GE_int32(-1));
					T183f209(ac, C, GE_ms8("fatal scanner internal error: no action found", 45));
				}
			} else {
				t1 = (((((l6) == ((T6)(GE_int32(150)))))));
				if (t1) {
					t4 = ((T6)((l1)-(l2)));
					l5 = ((T6)((t4)-((T6)(GE_int32(1)))));
					t4 = (((((T0*)(GE_void(((T183*)(C))->a19)))->id==279)?((T279*)(((T183*)(C))->a19))->a2:((T278*)(((T183*)(C))->a19))->a2));
					t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
					t1 = (T6f10(ac, &(((T183*)(C))->a14), t4));
					if (t1) {
						((T183*)(C))->a14 = ((T6)((l2)+(l5)));
						l3 = (T183f61(ac, C));
						l4 = (T183f62(ac, C, l3));
						l2 = ((T6)((l2)+(((T183*)(C))->a13)));
						t1 = (((((l4) != ((T6)(GE_int32(0)))))));
						if (t1) {
							l1 = ((T6)((((T183*)(C))->a14)+((T6)(GE_int32(1)))));
							((T183*)(C))->a14 = l1;
							l3 = l4;
							l7 = (T6)(GE_int32(2));
						} else {
							if (EIF_FALSE) {
								l1 = ((T183*)(C))->a14;
								((T183*)(C))->a21 = ((T6)((((T183*)(C))->a21)-((T6)(GE_int32(1)))));
							} else {
								l1 = ((T183*)(C))->a27;
								l3 = ((T183*)(C))->a26;
							}
							l7 = (T6)(GE_int32(3));
						}
					} else {
						((T183*)(C))->a14 = ((T6)((((T183*)(C))->a14)-((T6)(GE_int32(1)))));
						T183f210(ac, C);
						t1 = (((((T0*)(GE_void(((T183*)(C))->a19)))->id==279)?((T279*)(((T183*)(C))->a19))->a3:((T278*)(((T183*)(C))->a19))->a3));
						if (t1) {
							l3 = (T183f61(ac, C));
							l1 = ((T183*)(C))->a14;
							l2 = ((T6)((((T183*)(C))->a15)+(((T183*)(C))->a13)));
							l7 = (T6)(GE_int32(2));
						} else {
							t4 = ((T6)((((T183*)(C))->a14)-(((T183*)(C))->a15)));
							t4 = ((T6)((t4)-(((T183*)(C))->a13)));
							t1 = (((((t4) != ((T6)(GE_int32(0)))))));
							if (t1) {
								l3 = (T183f61(ac, C));
								l1 = ((T183*)(C))->a14;
								l2 = ((T6)((((T183*)(C))->a15)+(((T183*)(C))->a13)));
								l7 = (T6)(GE_int32(3));
							} else {
								t1 = (T183f63(ac, C));
								if (t1) {
									l2 = ((T183*)(C))->a15;
									l1 = ((T183*)(C))->a14;
									t4 = ((T6)((((T183*)(C))->a8)-((T6)(GE_int32(1)))));
									t4 = ((T6)((t4)/((T6)(GE_int32(2)))));
									T183f211(ac, C, t4);
								}
							}
						}
					}
				} else {
					T183f212(ac, C, l6);
					if (((T183*)(C))->a39) {
						((T183*)(C))->a39 = EIF_FALSE;
						((T183*)(C))->a16 = l10;
						((T183*)(C))->a17 = l11;
						((T183*)(C))->a18 = l12;
						l1 = ((T183*)(C))->a36;
						if (EIF_FALSE) {
							((T183*)(C))->a33 = ((T183*)(C))->a38;
							((T183*)(C))->a21 = ((T183*)(C))->a37;
							t4 = ((T6)((((T183*)(C))->a21)-((T6)(GE_int32(1)))));
							l3 = (((T95*)(GE_void(((T183*)(C))->a20)))->z2[t4]);
						}
						((T183*)(C))->a33 = ((T6)((((T183*)(C))->a33)+((T6)(GE_int32(1)))));
						l7 = (T6)(GE_int32(5));
					}
				}
			}
			break;
		default:
			GE_raise(GE_EX_WHEN);
			break;
		}
	}
}

/* XM_EIFFEL_SCANNER.yy_execute_action */
void T183f212(GE_context* ac, T0* C, T6 a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = (T6f10(ac, &a1, (T6)(GE_int32(75))));
	if (t1) {
		t1 = (T6f10(ac, &a1, (T6)(GE_int32(38))));
		if (t1) {
			t1 = (T6f10(ac, &a1, (T6)(GE_int32(19))));
			if (t1) {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(10))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(5))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(3))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(2))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(1)))))));
								if (t1) {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(4)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(4)))));
									T183f218(ac, C, (T6)(GE_int32(268)));
									T183f213(ac, C, (T6)(GE_int32(1)));
								} else {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(3)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(3)))));
									T183f218(ac, C, (T6)(GE_int32(269)));
									t1 = (T6f1(ac, &(((T183*)(C))->a43), (T6)(GE_int32(0))));
									if (t1) {
										T183f219(ac, C);
									}
								}
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(2)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(2)))));
								T183f218(ac, C, (T6)(GE_int32(270)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(4)))))));
							if (t1) {
								T183f220(ac, C);
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(266)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							} else {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(266)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(8))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(7))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(6)))))));
								if (t1) {
									t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
									t2 = ((T6)((t2)-(((T183*)(C))->a15)));
									((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
									t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
									t2 = ((T6)((t2)-(((T183*)(C))->a15)));
									((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
									T183f218(ac, C, (T6)(GE_int32(267)));
									((T183*)(C))->a2 = (T183f75(ac, C));
								} else {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
									T183f218(ac, C, (T6)(GE_int32(266)));
									((T183*)(C))->a2 = (T183f75(ac, C));
								}
							} else {
								T183f220(ac, C);
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(276)));
								T183f213(ac, C, (T6)(GE_int32(3)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(9)))))));
							if (t1) {
								T183f220(ac, C);
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(275)));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(2)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(2)))));
								T183f218(ac, C, (T6)(GE_int32(271)));
								T183f213(ac, C, (T6)(GE_int32(2)));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(15))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(13))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(12))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(11)))))));
								if (t1) {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(2)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(2)))));
									T183f218(ac, C, (T6)(GE_int32(277)));
									t1 = (T6f1(ac, &(((T183*)(C))->a43), (T6)(GE_int32(0))));
									if (t1) {
										T183f219(ac, C);
									}
								} else {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(7)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(7)))));
									T183f218(ac, C, (T6)(GE_int32(278)));
								}
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(3)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(3)))));
								T183f218(ac, C, (T6)(GE_int32(279)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(14)))))));
							if (t1) {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(10)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(10)))));
								T183f218(ac, C, (T6)(GE_int32(280)));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(3)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(3)))));
								T183f218(ac, C, (T6)(GE_int32(281)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(17))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(16)))))));
							if (t1) {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(2)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(2)))));
								T183f218(ac, C, (T6)(GE_int32(282)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(8)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(8)))));
								T183f218(ac, C, (T6)(GE_int32(283)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(18)))))));
							if (t1) {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(284)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(262)));
							}
						}
					}
				}
			} else {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(29))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(24))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(22))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(21))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(20)))))));
								if (t1) {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
									T183f218(ac, C, (T6)(GE_int32(264)));
								} else {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
									T183f218(ac, C, (T6)(GE_int32(265)));
								}
							} else {
								T183f220(ac, C);
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(263)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(23)))))));
							if (t1) {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(2)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(2)))));
								T183f218(ac, C, (T6)(GE_int32(274)));
								t1 = (T6f1(ac, &(((T183*)(C))->a43), (T6)(GE_int32(0))));
								if (t1) {
									T183f219(ac, C);
								}
							} else {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(272)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(27))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(26))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(25)))))));
								if (t1) {
									t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
									t2 = ((T6)((t2)-(((T183*)(C))->a15)));
									((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
									t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
									t2 = ((T6)((t2)-(((T183*)(C))->a15)));
									((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
									T183f218(ac, C, (T6)(GE_int32(273)));
									((T183*)(C))->a2 = (T183f75(ac, C));
								} else {
									T183f220(ac, C);
									t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
									t2 = ((T6)((t2)-(((T183*)(C))->a15)));
									((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
									T183f218(ac, C, (T6)(GE_int32(263)));
									((T183*)(C))->a2 = (T183f75(ac, C));
								}
							} else {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(266)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(28)))))));
							if (t1) {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(267)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(266)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(34))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(32))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(31))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(30)))))));
								if (t1) {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(9)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(9)))));
									T183f218(ac, C, (T6)(GE_int32(285)));
									T183f213(ac, C, (T6)(GE_int32(4)));
								} else {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(3)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(3)))));
									T183f218(ac, C, (T6)(GE_int32(286)));
									t1 = (T6f1(ac, &(((T183*)(C))->a43), (T6)(GE_int32(0))));
									if (t1) {
										T183f219(ac, C);
									}
								}
							} else {
								T183f220(ac, C);
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(266)));
								((T183*)(C))->a2 = (T183f101(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(33)))))));
							if (t1) {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(266)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							} else {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(267)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(36))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(35)))))));
							if (t1) {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(266)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(9)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(9)))));
								T183f218(ac, C, (T6)(GE_int32(287)));
								T183f213(ac, C, (T6)(GE_int32(12)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(37)))))));
							if (t1) {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(9)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(9)))));
								T183f218(ac, C, (T6)(GE_int32(308)));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(8)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(8)))));
								T183f218(ac, C, (T6)(GE_int32(309)));
							}
						}
					}
				}
			}
		} else {
			t1 = (T6f10(ac, &a1, (T6)(GE_int32(57))));
			if (t1) {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(48))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(43))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(41))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(40))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(39)))))));
								if (t1) {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(6)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(6)))));
									T183f218(ac, C, (T6)(GE_int32(310)));
								} else {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(5)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(5)))));
									T183f218(ac, C, (T6)(GE_int32(311)));
									((T183*)(C))->a2 = (T183f75(ac, C));
								}
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(2)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(2)))));
								T183f218(ac, C, (T6)(GE_int32(312)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(42)))))));
							if (t1) {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(5)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(5)))));
								T183f218(ac, C, (T6)(GE_int32(313)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(6)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(6)))));
								T183f218(ac, C, (T6)(GE_int32(314)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(46))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(45))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(44)))))));
								if (t1) {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(6)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(6)))));
									T183f218(ac, C, (T6)(GE_int32(315)));
									((T183*)(C))->a2 = (T183f75(ac, C));
								} else {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(8)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(8)))));
									T183f218(ac, C, (T6)(GE_int32(316)));
									((T183*)(C))->a2 = (T183f75(ac, C));
								}
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(7)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(7)))));
								T183f218(ac, C, (T6)(GE_int32(317)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(47)))))));
							if (t1) {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(8)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(8)))));
								T183f218(ac, C, (T6)(GE_int32(318)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(8)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(8)))));
								T183f218(ac, C, (T6)(GE_int32(319)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(53))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(51))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(50))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(49)))))));
								if (t1) {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
									T183f218(ac, C, (T6)(GE_int32(331)));
									T183f213(ac, C, (T6)(GE_int32(6)));
								} else {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
									T183f218(ac, C, (T6)(GE_int32(331)));
									T183f213(ac, C, (T6)(GE_int32(7)));
								}
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(289)));
								T183f213(ac, C, (T6)(GE_int32(10)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(52)))))));
							if (t1) {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(289)));
								T183f213(ac, C, (T6)(GE_int32(10)));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(290)));
								t1 = (T6f1(ac, &(((T183*)(C))->a43), (T6)(GE_int32(0))));
								if (t1) {
									T183f219(ac, C);
								}
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(55))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(54)))))));
							if (t1) {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(9)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(9)))));
								T183f218(ac, C, (T6)(GE_int32(293)));
								T183f213(ac, C, (T6)(GE_int32(13)));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(9)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(9)))));
								T183f218(ac, C, (T6)(GE_int32(294)));
								T183f213(ac, C, (T6)(GE_int32(14)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(56)))))));
							if (t1) {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(8)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(8)))));
								T183f218(ac, C, (T6)(GE_int32(295)));
								T183f213(ac, C, (T6)(GE_int32(15)));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(10)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(10)))));
								T183f218(ac, C, (T6)(GE_int32(296)));
								T183f213(ac, C, (T6)(GE_int32(16)));
							}
						}
					}
				}
			} else {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(66))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(62))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(60))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(59))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(58)))))));
								if (t1) {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(6)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(6)))));
									T183f218(ac, C, (T6)(GE_int32(325)));
									((T183*)(C))->a2 = (T183f75(ac, C));
								} else {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(7)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(7)))));
									T183f218(ac, C, (T6)(GE_int32(326)));
									((T183*)(C))->a2 = (T183f75(ac, C));
								}
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(3)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(3)))));
								T183f218(ac, C, (T6)(GE_int32(328)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(61)))))));
							if (t1) {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(3)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(3)))));
								T183f218(ac, C, (T6)(GE_int32(329)));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(3)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(3)))));
								T183f218(ac, C, (T6)(GE_int32(328)));
								T183f213(ac, C, (T6)(GE_int32(17)));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(64))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(63)))))));
							if (t1) {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(3)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(3)))));
								T183f218(ac, C, (T6)(GE_int32(329)));
								t1 = (T6f1(ac, &(((T183*)(C))->a43), (T6)(GE_int32(0))));
								if (t1) {
									T183f219(ac, C);
								}
							} else {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(266)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(65)))))));
							if (t1) {
								T183f220(ac, C);
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(266)));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(7)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(7)))));
								T183f218(ac, C, (T6)(GE_int32(304)));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(71))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(69))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(68))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(67)))))));
								if (t1) {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(5)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(5)))));
									T183f218(ac, C, (T6)(GE_int32(291)));
									((T183*)(C))->a2 = (T183f75(ac, C));
								} else {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(3)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(3)))));
									T183f218(ac, C, (T6)(GE_int32(292)));
									((T183*)(C))->a2 = (T183f75(ac, C));
								}
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(5)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(5)))));
								T183f218(ac, C, (T6)(GE_int32(327)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(70)))))));
							if (t1) {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(288)));
								t1 = (T6f1(ac, &(((T183*)(C))->a43), (T6)(GE_int32(0))));
								if (t1) {
									T183f219(ac, C);
								}
							} else {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(258)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(73))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(72)))))));
							if (t1) {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(259)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							} else {
								T183f220(ac, C);
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(263)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(74)))))));
							if (t1) {
								T183f220(ac, C);
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(306)));
								((T183*)(C))->a2 = (T183f142(ac, C));
							} else {
								T183f220(ac, C);
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(307)));
								((T183*)(C))->a2 = (T183f142(ac, C));
							}
						}
					}
				}
			}
		}
	} else {
		t1 = (T6f10(ac, &a1, (T6)(GE_int32(112))));
		if (t1) {
			t1 = (T6f10(ac, &a1, (T6)(GE_int32(94))));
			if (t1) {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(85))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(80))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(78))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(77))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(76)))))));
								if (t1) {
									T183f220(ac, C);
									t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
									t2 = ((T6)((t2)-(((T183*)(C))->a15)));
									((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
									T183f218(ac, C, (T6)(GE_int32(305)));
									((T183*)(C))->a2 = (T183f142(ac, C));
									T183f213(ac, C, (T6)(GE_int32(11)));
								} else {
									T183f220(ac, C);
									t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
									t2 = ((T6)((t2)-(((T183*)(C))->a15)));
									((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
									T183f218(ac, C, (T6)(GE_int32(306)));
									((T183*)(C))->a2 = (T183f142(ac, C));
									t1 = (T6f1(ac, &(((T183*)(C))->a43), (T6)(GE_int32(0))));
									if (t1) {
										T183f219(ac, C);
									}
								}
							} else {
								T183f220(ac, C);
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(307)));
								((T183*)(C))->a2 = (T183f142(ac, C));
								t1 = (T6f1(ac, &(((T183*)(C))->a43), (T6)(GE_int32(0))));
								if (t1) {
									T183f219(ac, C);
								}
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(79)))))));
							if (t1) {
								T183f220(ac, C);
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(288)));
								t1 = (T6f1(ac, &(((T183*)(C))->a43), (T6)(GE_int32(0))));
								if (t1) {
									T183f219(ac, C);
								}
								t1 = (T6f1(ac, &(((T183*)(C))->a43), (T6)(GE_int32(0))));
								if (t1) {
									T183f219(ac, C);
								}
							} else {
								((T183*)(C))->a16 = ((T6)((((T183*)(C))->a16)+((T6)(GE_int32(1)))));
								((T183*)(C))->a17 = (T6)(GE_int32(1));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(349)));
								t1 = (T6f1(ac, &(((T183*)(C))->a43), (T6)(GE_int32(0))));
								if (t1) {
									T183f219(ac, C);
								}
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(83))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(82))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(81)))))));
								if (t1) {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
									T183f218(ac, C, (T6)(GE_int32(299)));
								} else {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
									T183f218(ac, C, (T6)(GE_int32(300)));
								}
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(297)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(84)))))));
							if (t1) {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(298)));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(301)));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(90))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(88))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(87))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(86)))))));
								if (t1) {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
									T183f218(ac, C, (T6)(GE_int32(302)));
								} else {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
									T183f218(ac, C, (T6)(GE_int32(303)));
								}
							} else {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(260)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(89)))))));
							if (t1) {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(261)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(320)));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(92))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(91)))))));
							if (t1) {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(331)));
								T183f213(ac, C, (T6)(GE_int32(8)));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(331)));
								T183f213(ac, C, (T6)(GE_int32(9)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(93)))))));
							if (t1) {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(321)));
								t2 = (T183f160(ac, C));
								t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
								((T183*)(C))->a2 = (T183f161(ac, C, (T6)(GE_int32(2)), t2));
							} else {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(322)));
								t2 = (T183f160(ac, C));
								t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
								((T183*)(C))->a2 = (T183f161(ac, C, (T6)(GE_int32(2)), t2));
							}
						}
					}
				}
			} else {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(103))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(99))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(97))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(96))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(95)))))));
								if (t1) {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
									T183f218(ac, C, (T6)(GE_int32(348)));
								} else {
									t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
									t2 = ((T6)((t2)-(((T183*)(C))->a15)));
									((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
									t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
									t2 = ((T6)((t2)-(((T183*)(C))->a15)));
									((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
									T183f218(ac, C, (T6)(GE_int32(323)));
									t2 = (T183f160(ac, C));
									t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
									((T183*)(C))->a2 = (T183f161(ac, C, (T6)(GE_int32(2)), t2));
								}
							} else {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(324)));
								t2 = (T183f160(ac, C));
								t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
								((T183*)(C))->a2 = (T183f161(ac, C, (T6)(GE_int32(2)), t2));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(98)))))));
							if (t1) {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(348)));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(2)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(2)))));
								T183f218(ac, C, (T6)(GE_int32(334)));
								T183f213(ac, C, (T6)(GE_int32(5)));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(101))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(100)))))));
							if (t1) {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(333)));
								T183f213(ac, C, (T6)(GE_int32(5)));
							} else {
								T183f220(ac, C);
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(335)));
								t1 = (T6f1(ac, &(((T183*)(C))->a43), (T6)(GE_int32(0))));
								if (t1) {
									T183f219(ac, C);
								}
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(102)))))));
							if (t1) {
								T183f220(ac, C);
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(336)));
								t1 = (T6f1(ac, &(((T183*)(C))->a43), (T6)(GE_int32(0))));
								if (t1) {
									T183f219(ac, C);
								}
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(341)));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(108))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(106))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(105))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(104)))))));
								if (t1) {
									t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
									t2 = ((T6)((t2)-(((T183*)(C))->a15)));
									((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
									t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
									t2 = ((T6)((t2)-(((T183*)(C))->a15)));
									((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
									T183f218(ac, C, (T6)(GE_int32(337)));
									((T183*)(C))->a2 = (T183f75(ac, C));
								} else {
									t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
									t2 = ((T6)((t2)-(((T183*)(C))->a15)));
									((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
									t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
									t2 = ((T6)((t2)-(((T183*)(C))->a15)));
									((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
									T183f218(ac, C, (T6)(GE_int32(338)));
									((T183*)(C))->a2 = (T183f75(ac, C));
								}
							} else {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(339)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(107)))))));
							if (t1) {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(340)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							} else {
								T183f220(ac, C);
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(263)));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(110))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(109)))))));
							if (t1) {
								T183f220(ac, C);
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(262)));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(331)));
								T183f213(ac, C, (T6)(GE_int32(6)));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(111)))))));
							if (t1) {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(331)));
								T183f213(ac, C, (T6)(GE_int32(7)));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(6)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(6)))));
								T183f218(ac, C, (T6)(GE_int32(266)));
								((T183*)(C))->a2 = GE_ms8("\'", 1);
							}
						}
					}
				}
			}
		} else {
			t1 = (T6f10(ac, &a1, (T6)(GE_int32(131))));
			if (t1) {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(122))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(117))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(115))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(114))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(113)))))));
								if (t1) {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(6)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(6)))));
									T183f218(ac, C, (T6)(GE_int32(266)));
									((T183*)(C))->a2 = GE_ms8("\"", 1);
								} else {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(4)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(4)))));
									T183f218(ac, C, (T6)(GE_int32(266)));
									((T183*)(C))->a2 = GE_ms8("<", 1);
								}
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(4)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(4)))));
								T183f218(ac, C, (T6)(GE_int32(266)));
								((T183*)(C))->a2 = GE_ms8(">", 1);
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(116)))))));
							if (t1) {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(5)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(5)))));
								T183f218(ac, C, (T6)(GE_int32(266)));
								((T183*)(C))->a2 = GE_ms8("&", 1);
							} else {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(342)));
								t2 = (T183f160(ac, C));
								t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
								((T183*)(C))->a2 = (T183f161(ac, C, (T6)(GE_int32(2)), t2));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(120))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(119))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(118)))))));
								if (t1) {
									t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
									t2 = ((T6)((t2)-(((T183*)(C))->a15)));
									((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
									t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
									t2 = ((T6)((t2)-(((T183*)(C))->a15)));
									((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
									T183f218(ac, C, (T6)(GE_int32(343)));
									t2 = (T183f160(ac, C));
									t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
									((T183*)(C))->a2 = (T183f161(ac, C, (T6)(GE_int32(2)), t2));
								} else {
									t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
									t2 = ((T6)((t2)-(((T183*)(C))->a15)));
									((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
									t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
									t2 = ((T6)((t2)-(((T183*)(C))->a15)));
									((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
									T183f218(ac, C, (T6)(GE_int32(266)));
									((T183*)(C))->a2 = (T183f75(ac, C));
								}
							} else {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(267)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(121)))))));
							if (t1) {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(266)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							} else {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(345)));
								t2 = (T183f160(ac, C));
								t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
								((T183*)(C))->a2 = (T183f161(ac, C, (T6)(GE_int32(2)), t2));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(127))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(125))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(124))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(123)))))));
								if (t1) {
									t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
									t2 = ((T6)((t2)-(((T183*)(C))->a15)));
									((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
									t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
									t2 = ((T6)((t2)-(((T183*)(C))->a15)));
									((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
									T183f218(ac, C, (T6)(GE_int32(346)));
									t2 = (T183f160(ac, C));
									t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
									((T183*)(C))->a2 = (T183f161(ac, C, (T6)(GE_int32(2)), t2));
								} else {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
									T183f218(ac, C, (T6)(GE_int32(347)));
									((T183*)(C))->a2 = (T183f75(ac, C));
								}
							} else {
								((T183*)(C))->a16 = ((T6)((((T183*)(C))->a16)+((T6)(GE_int32(1)))));
								((T183*)(C))->a17 = (T6)(GE_int32(1));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(2)))));
								T183f218(ac, C, (T6)(GE_int32(266)));
								t1 = (T183f181(ac, C));
								if (t1) {
									((T183*)(C))->a2 = ge1521ov7192;
								} else {
									((T183*)(C))->a2 = ge1521ov7191;
								}
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(126)))))));
							if (t1) {
								T183f220(ac, C);
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(266)));
								((T183*)(C))->a2 = ge1521ov7191;
							} else {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(266)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(129))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(128)))))));
							if (t1) {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(267)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							} else {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = (T183f160(ac, C));
								t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
								t3 = (T183f161(ac, C, (T6)(GE_int32(3)), t2));
								T277f9(ac, GE_void(((T183*)(C))->a9), t3);
								t1 = (T277f5(ac, GE_void(((T183*)(C))->a9)));
								if (t1) {
									t1 = (T277f2(ac, GE_void(((T183*)(C))->a9)));
									if (t1) {
										T183f218(ac, C, (T6)(GE_int32(266)));
									} else {
										T183f218(ac, C, (T6)(GE_int32(267)));
									}
									((T183*)(C))->a2 = (T277f3(ac, GE_void(((T183*)(C))->a9)));
								} else {
									T183f218(ac, C, (T6)(GE_int32(348)));
								}
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(130)))))));
							if (t1) {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = (T183f160(ac, C));
								t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
								t3 = (T183f161(ac, C, (T6)(GE_int32(4)), t2));
								T277f10(ac, GE_void(((T183*)(C))->a9), t3);
								t1 = (T277f5(ac, GE_void(((T183*)(C))->a9)));
								if (t1) {
									t1 = (T277f2(ac, GE_void(((T183*)(C))->a9)));
									if (t1) {
										T183f218(ac, C, (T6)(GE_int32(266)));
									} else {
										T183f218(ac, C, (T6)(GE_int32(267)));
									}
									((T183*)(C))->a2 = (T277f3(ac, GE_void(((T183*)(C))->a9)));
								} else {
									T183f218(ac, C, (T6)(GE_int32(348)));
								}
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(348)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						}
					}
				}
			} else {
				t1 = (T6f10(ac, &a1, (T6)(GE_int32(140))));
				if (t1) {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(136))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(134))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(133))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(132)))))));
								if (t1) {
									T183f220(ac, C);
									t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
									t2 = ((T6)((t2)-(((T183*)(C))->a15)));
									((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
									T183f218(ac, C, (T6)(GE_int32(266)));
									((T183*)(C))->a2 = (T183f101(ac, C));
								} else {
									T183f220(ac, C);
									t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
									t2 = ((T6)((t2)-(((T183*)(C))->a15)));
									((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
									T183f218(ac, C, (T6)(GE_int32(266)));
									((T183*)(C))->a2 = (T183f75(ac, C));
								}
							} else {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(266)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(135)))))));
							if (t1) {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(267)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(332)));
								t1 = (T6f1(ac, &(((T183*)(C))->a43), (T6)(GE_int32(0))));
								if (t1) {
									T183f219(ac, C);
								}
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(138))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(137)))))));
							if (t1) {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(266)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(332)));
								t1 = (T6f1(ac, &(((T183*)(C))->a43), (T6)(GE_int32(0))));
								if (t1) {
									T183f219(ac, C);
								}
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(139)))))));
							if (t1) {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(266)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(3)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(3)))));
								((T183*)(C))->a1 = (T6)(GE_int32(344));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						}
					}
				} else {
					t1 = (T6f10(ac, &a1, (T6)(GE_int32(145))));
					if (t1) {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(143))));
						if (t1) {
							t1 = (T6f10(ac, &a1, (T6)(GE_int32(142))));
							if (t1) {
								t1 = (((((a1) == ((T6)(GE_int32(141)))))));
								if (t1) {
									((T183*)(C))->a16 = ((T6)((((T183*)(C))->a16)+((T6)(GE_int32(1)))));
									((T183*)(C))->a17 = (T6)(GE_int32(1));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(2)))));
									T183f218(ac, C, (T6)(GE_int32(263)));
									((T183*)(C))->a2 = (T183f101(ac, C));
								} else {
									((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
									((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
									T183f218(ac, C, (T6)(GE_int32(263)));
									((T183*)(C))->a2 = (T183f101(ac, C));
								}
							} else {
								((T183*)(C))->a16 = ((T6)((((T183*)(C))->a16)+((T6)(GE_int32(1)))));
								((T183*)(C))->a17 = (T6)(GE_int32(1));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(263)));
								((T183*)(C))->a2 = (T183f101(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(144)))))));
							if (t1) {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(263)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							} else {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(266)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						}
					} else {
						t1 = (T6f10(ac, &a1, (T6)(GE_int32(147))));
						if (t1) {
							t1 = (((((a1) == ((T6)(GE_int32(146)))))));
							if (t1) {
								t2 = ((T6)((((T183*)(C))->a17)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a17 = ((T6)((t2)-(((T183*)(C))->a13)));
								t2 = ((T6)((((T183*)(C))->a18)+(((T183*)(C))->a14)));
								t2 = ((T6)((t2)-(((T183*)(C))->a15)));
								((T183*)(C))->a18 = ((T6)((t2)-(((T183*)(C))->a13)));
								T183f218(ac, C, (T6)(GE_int32(267)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							} else {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(266)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							}
						} else {
							t1 = (((((a1) == ((T6)(GE_int32(148)))))));
							if (t1) {
								((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+((T6)(GE_int32(1)))));
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								T183f218(ac, C, (T6)(GE_int32(349)));
								((T183*)(C))->a2 = (T183f75(ac, C));
							} else {
								T183f220(ac, C);
								((T183*)(C))->a18 = ((T6)((((T183*)(C))->a18)+((T6)(GE_int32(1)))));
								((T183*)(C))->a1 = (T6)(GE_int32(-1));
								T183f209(ac, C, GE_ms8("scanner jammed", 14));
							}
						}
					}
				}
			}
		}
	}
}

/* XM_EIFFEL_SCANNER.has_normalized_newline */
T1 T183f181(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* XM_EIFFEL_SCANNER.text_substring */
T0* T183f161(GE_context* ac, T0* C, T6 a1, T6 a2)
{
	T1 t1;
	T6 t2;
	T6 t3;
	T0* R = 0;
	t1 = ((T1)((a2)<(a1)));
	if (t1) {
		R = T17c36(ac, (T6)(GE_int32(0)));
	} else {
		t2 = ((T6)((((T183*)(C))->a15)+(a1)));
		t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
		t3 = ((T6)((((T183*)(C))->a15)+(a2)));
		t3 = ((T6)((t3)-((T6)(GE_int32(1)))));
		R = (T413f3(ac, GE_void(((T183*)(C))->a24), t2, t3));
	}
	return R;
}

/* XM_EIFFEL_SCANNER.text_count */
T6 T183f160(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = ((T6)((((T183*)(C))->a14)-(((T183*)(C))->a15)));
	return R;
}

/* XM_EIFFEL_SCANNER.system_literal_text */
T0* T183f142(GE_context* ac, T0* C)
{
	T6 t1;
	T2 t2;
	T1 t3;
	T6 t4;
	T0* R = 0;
	T6 l1 = 0;
	T2 l2 = 0;
	t1 = (T183f160(ac, C));
	l2 = (T183f195(ac, C, t1));
	t1 = (T183f160(ac, C));
	l1 = ((T6)((t1)-((T6)(GE_int32(1)))));
	while (1) {
		t2 = (T183f195(ac, C, l1));
		t3 = (((((t2) == (l2)))));
		if (t3) {
			break;
		}
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
	}
	t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	t4 = (T183f160(ac, C));
	t4 = ((T6)((t4)-((T6)(GE_int32(1)))));
	R = (T183f161(ac, C, t1, t4));
	return R;
}

/* XM_EIFFEL_SCANNER.text_item */
T2 T183f195(GE_context* ac, T0* C, T6 a1)
{
	T1 t1;
	T6 t2;
	T2 R = 0;
	T0* l1 = 0;
	l1 = ((T183*)(C))->a22;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		t2 = ((T6)((((T183*)(C))->a15)+(a1)));
		t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
		R = (((T15*)(GE_void(l1)))->z2[t2]);
	} else {
		t2 = ((T6)((((T183*)(C))->a15)+(a1)));
		t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
		R = (T413f6(ac, GE_void(((T183*)(C))->a24), t2));
	}
	return R;
}

/* XM_EIFFEL_SCANNER.normalized_newline */
T0* T183f101(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge1521os7189) {
		return ge1521ov7189;
	} else {
		ge1521os7189 = '\1';
		ge1521ov7189 = R;
	}
	R = GE_ms8("\n", 1);
	ge1521ov7189 = R;
	return R;
}

/* XM_EIFFEL_SCANNER.yy_set_line_column */
void T183f220(GE_context* ac, T0* C)
{
	T1 t1;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T0* l7 = 0;
	l7 = ((T183*)(C))->a22;
	l1 = ((T6)((((T183*)(C))->a14)-((T6)(GE_int32(1)))));
	l2 = ((T6)((((T183*)(C))->a15)+(((T183*)(C))->a13)));
	while (1) {
		t1 = ((T1)((l1)<(l2)));
		if (!(t1)) {
			t1 = (l5);
		}
		if (t1) {
			break;
		}
		t1 = ((l7)!=(EIF_VOID));
		if (t1) {
			l6 = (((T15*)(GE_void(l7)))->z2[l1]);
		} else {
			l6 = (T413f6(ac, GE_void(((T183*)(C))->a24), l1));
		}
		t1 = (((((l6) == ((T2)('\n'))))));
		if (t1) {
			l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
			l5 = EIF_TRUE;
		} else {
			l4 = ((T6)((l4)+((T6)(GE_int32(1)))));
		}
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
	}
	while (1) {
		t1 = ((T1)((l1)<(l2)));
		if (t1) {
			break;
		}
		t1 = ((l7)!=(EIF_VOID));
		if (t1) {
			l6 = (((T15*)(GE_void(l7)))->z2[l1]);
		} else {
			l6 = (T413f6(ac, GE_void(((T183*)(C))->a24), l1));
		}
		t1 = (((((l6) == ((T2)('\n'))))));
		if (t1) {
			l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
		}
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
	}
	if (l5) {
		((T183*)(C))->a16 = ((T6)((((T183*)(C))->a16)+(l3)));
		((T183*)(C))->a17 = ((T6)((l4)+((T6)(GE_int32(1)))));
	} else {
		((T183*)(C))->a17 = ((T6)((((T183*)(C))->a17)+(l4)));
	}
}

/* XM_EIFFEL_SCANNER.text */
T0* T183f75(GE_context* ac, T0* C)
{
	T1 t1;
	T6 t2;
	T0* R = 0;
	t1 = ((T1)((((T183*)(C))->a15)<(((T183*)(C))->a14)));
	if (t1) {
		t2 = ((T6)((((T183*)(C))->a14)-((T6)(GE_int32(1)))));
		R = (T413f3(ac, GE_void(((T183*)(C))->a24), ((T183*)(C))->a15, t2));
	} else {
		R = T17c36(ac, (T6)(GE_int32(0)));
	}
	return R;
}

/* XM_EIFFEL_SCANNER.pop_start_condition */
void T183f219(GE_context* ac, T0* C)
{
	T6 t1;
	((T183*)(C))->a43 = ((T6)((((T183*)(C))->a43)-((T6)(GE_int32(1)))));
	t1 = (((T95*)(GE_void(((T183*)(C))->a40)))->z2[((T183*)(C))->a43]);
	T183f221(ac, C, t1);
}

/* XM_EIFFEL_SCANNER.set_start_condition */
void T183f221(GE_context* ac, T0* C, T6 a1)
{
	T6 t1;
	t1 = (T6)(GE_int32(2));
	t1 = ((T6)((t1)*(a1)));
	((T183*)(C))->a8 = ((T6)((t1)+((T6)(GE_int32(1)))));
}

/* XM_EIFFEL_SCANNER.push_start_condition */
void T183f213(GE_context* ac, T0* C, T6 a1)
{
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (((T95*)(GE_void(((T183*)(C))->a40)))->a2);
	t2 = (T6f8(ac, &(((T183*)(C))->a43), t1));
	if (t2) {
		t3 = (T183f51(ac, C));
		t1 = ((T6)((((T183*)(C))->a43)+((T6)(GE_int32(10)))));
		((T183*)(C))->a40 = (T106f3(ac, GE_void(t3), ((T183*)(C))->a40, t1));
	}
	t3 = (T183f51(ac, C));
	t1 = (T183f44(ac, C));
	T106f8(ac, GE_void(t3), ((T183*)(C))->a40, t1, ((T183*)(C))->a43);
	((T183*)(C))->a43 = ((T6)((((T183*)(C))->a43)+((T6)(GE_int32(1)))));
	T183f221(ac, C, a1);
}

/* XM_EIFFEL_SCANNER.set_last_token */
void T183f218(GE_context* ac, T0* C, T6 a1)
{
	((T183*)(C))->a1 = a1;
}

/* XM_EIFFEL_SCANNER.yy_execute_eof_action */
void T183f211(GE_context* ac, T0* C, T6 a1)
{
	T183f217(ac, C);
}

/* XM_EIFFEL_SCANNER.terminate */
void T183f217(GE_context* ac, T0* C)
{
	((T183*)(C))->a1 = (T6)(GE_int32(0));
}

/* XM_EIFFEL_SCANNER.wrap */
T1 T183f63(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* XM_EIFFEL_SCANNER.yy_refill_input_buffer */
void T183f210(GE_context* ac, T0* C)
{
	T0* t1;
	T6 t2;
	T6 l1 = 0;
	if (((T0*)(GE_void(((T183*)(C))->a19)))->id==279) {
		T279f18(ac, ((T183*)(C))->a19, ((T183*)(C))->a15);
	} else {
		T278f13(ac, ((T183*)(C))->a19, ((T183*)(C))->a15);
	}
	if (((T0*)(GE_void(((T183*)(C))->a19)))->id==279) {
		T279f20(ac, ((T183*)(C))->a19);
	} else {
		T278f15(ac, ((T183*)(C))->a19);
	}
	t1 = (((((T0*)(GE_void(((T183*)(C))->a19)))->id==279)?((T279*)(((T183*)(C))->a19))->a4:((T278*)(((T183*)(C))->a19))->a4));
	T183f216(ac, C, t1);
	l1 = (((((T0*)(GE_void(((T183*)(C))->a19)))->id==279)?((T279*)(((T183*)(C))->a19))->a5:((T278*)(((T183*)(C))->a19))->a5));
	t2 = ((T6)((((T183*)(C))->a14)-(((T183*)(C))->a15)));
	((T183*)(C))->a14 = ((T6)((t2)+(l1)));
	((T183*)(C))->a15 = l1;
}

/* XM_EIFFEL_SCANNER.yy_null_trans_state */
T6 T183f62(GE_context* ac, T0* C, T6 a1)
{
	T1 t1;
	T6 t2;
	T0* m1 = 0;
	T0* t3;
	T6 R = 0;
	T6 l1 = 0;
	T1 l2 = 0;
	t1 = EIF_FALSE;
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (((T95*)(GE_void(((T183*)(C))->a25)))->z2[a1]);
		t1 = (((((t2) != ((T6)(GE_int32(0)))))));
		if (t1) {
			((T183*)(C))->a26 = a1;
			((T183*)(C))->a27 = ((T183*)(C))->a14;
		}
	}
	R = a1;
	l1 = (T6)(GE_int32(1));
	while (1) {
		t2 = (((T95*)(GE_void(((T183*)(C))->a29)))->z2[R]);
		t2 = ((T6)((t2)+(l1)));
		t2 = (((T95*)(GE_void(((T183*)(C))->a28)))->z2[t2]);
		t1 = (((((t2) == (R)))));
		if (t1) {
			break;
		}
		R = (((T95*)(GE_void(((T183*)(C))->a30)))->z2[R]);
		t1 = (((T183*)(C))->a31?((m1 = ((T183*)(C))->a31, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t1 = (T6f8(ac, (&R), (T6)(GE_int32(831))));
		}
		if (t1) {
			l1 = (((T95*)(m1))->z2[l1]);
		}
	}
	t2 = (((T95*)(GE_void(((T183*)(C))->a29)))->z2[R]);
	t2 = ((T6)((t2)+(l1)));
	R = (((T95*)(GE_void(((T183*)(C))->a32)))->z2[t2]);
	if (EIF_FALSE) {
		t3 = (T183f51(ac, C));
		T106f8(ac, GE_void(t3), ((T183*)(C))->a20, R, ((T183*)(C))->a21);
		((T183*)(C))->a21 = ((T6)((((T183*)(C))->a21)+((T6)(GE_int32(1)))));
	}
	l2 = (((((R) == ((T6)(GE_int32(830)))))));
	if (l2) {
		R = (T6)(GE_int32(0));
	}
	return R;
}

/* XM_EIFFEL_SCANNER.yy_previous_state */
T6 T183f61(GE_context* ac, T0* C)
{
	T1 t1;
	T0* t2;
	T2 t3;
	T0* m1 = 0;
	T6 t4;
	T0* m2 = 0;
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T0* l4 = 0;
	t1 = (((((T0*)(GE_void(((T183*)(C))->a19)))->id==279)?((T279*)(((T183*)(C))->a19))->a1:((T278*)(((T183*)(C))->a19))->a1));
	if (t1) {
		R = ((T6)((((T183*)(C))->a8)+((T6)(GE_int32(1)))));
	} else {
		R = ((T183*)(C))->a8;
	}
	if (EIF_FALSE) {
		t2 = (T183f51(ac, C));
		T106f8(ac, GE_void(t2), ((T183*)(C))->a20, R, (T6)(GE_int32(0)));
		((T183*)(C))->a21 = (T6)(GE_int32(1));
	}
	l4 = ((T183*)(C))->a22;
	l1 = ((T6)((((T183*)(C))->a15)+(((T183*)(C))->a13)));
	l2 = ((T183*)(C))->a14;
	while (1) {
		t1 = (T6f8(ac, (&l1), l2));
		if (t1) {
			break;
		}
		t1 = ((l4)!=(EIF_VOID));
		if (t1) {
			t3 = (((T15*)(GE_void(l4)))->z2[l1]);
			l3 = ((T6)(t3));
		} else {
			t3 = (T413f6(ac, GE_void(((T183*)(C))->a24), l1));
			l3 = ((T6)(t3));
		}
		t1 = (((((l3) == ((T6)(GE_int32(0)))))));
		if (t1) {
			l3 = (T6)(GE_int32(1));
		} else {
			t1 = (((T183*)(C))->a23?((m1 = ((T183*)(C))->a23, EIF_TRUE)):EIF_FALSE);
			if (t1) {
				l3 = (((T95*)(m1))->z2[l3]);
			}
		}
		t1 = EIF_FALSE;
		t1 = ((T1)(!(t1)));
		if (t1) {
			t4 = (((T95*)(GE_void(((T183*)(C))->a25)))->z2[R]);
			t1 = (((((t4) != ((T6)(GE_int32(0)))))));
			if (t1) {
				((T183*)(C))->a26 = R;
				((T183*)(C))->a27 = l1;
			}
		}
		while (1) {
			t4 = (((T95*)(GE_void(((T183*)(C))->a29)))->z2[R]);
			t4 = ((T6)((t4)+(l3)));
			t4 = (((T95*)(GE_void(((T183*)(C))->a28)))->z2[t4]);
			t1 = (((((t4) == (R)))));
			if (t1) {
				break;
			}
			R = (((T95*)(GE_void(((T183*)(C))->a30)))->z2[R]);
			t1 = (((T183*)(C))->a31?((m2 = ((T183*)(C))->a31, EIF_TRUE)):EIF_FALSE);
			if (t1) {
				t1 = (T6f8(ac, (&R), (T6)(GE_int32(831))));
			}
			if (t1) {
				l3 = (((T95*)(m2))->z2[l3]);
			}
		}
		t4 = (((T95*)(GE_void(((T183*)(C))->a29)))->z2[R]);
		t4 = ((T6)((t4)+(l3)));
		R = (((T95*)(GE_void(((T183*)(C))->a32)))->z2[t4]);
		if (EIF_FALSE) {
			t2 = (T183f51(ac, C));
			T106f8(ac, GE_void(t2), ((T183*)(C))->a20, R, ((T183*)(C))->a21);
			((T183*)(C))->a21 = ((T6)((((T183*)(C))->a21)+((T6)(GE_int32(1)))));
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	return R;
}

/* XM_EIFFEL_SCANNER.fatal_error */
void T183f209(GE_context* ac, T0* C, T0* a1)
{
	((T183*)(C))->a42 = a1;
}

/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition_dtd_ignore */
void T226f239(GE_context* ac, T0* C)
{
	T226f248(ac, C, (T6)(GE_int32(17)));
}

/* XM_EIFFEL_SCANNER_DTD.push_start_condition_dtd_ignore */
void T224f205(GE_context* ac, T0* C)
{
	T224f218(ac, C, (T6)(GE_int32(17)));
}

/* XM_EIFFEL_ENTITY_DEF.push_start_condition_dtd_ignore */
void T223f235(GE_context* ac, T0* C)
{
	T223f243(ac, C, (T6)(GE_int32(17)));
}

/* XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
void T183f203(GE_context* ac, T0* C)
{
	T183f213(ac, C, (T6)(GE_int32(17)));
}

/* XM_EIFFEL_PE_ENTITY_DEF.set_encoding */
void T226f240(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	{
		t1 = (((T226*)(C))->a47?((m1 = ((T226*)(C))->a47, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		T266f30(ac, m1, a1);
	}
}

/* XM_EIFFEL_INPUT_STREAM.set_encoding */
void T266f30(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	t1 = (T266f17(ac, C));
	t2 = (T115f11(ac, GE_void(t1), a1, ge1512ov8332));
	if (t2) {
		((T266*)(C))->a2 = (T6)(GE_int32(3));
	} else {
		t1 = (T266f17(ac, C));
		t2 = (T115f11(ac, GE_void(t1), a1, ge1512ov8334));
		if (t2) {
		} else {
			((T266*)(C))->a2 = (T6)(GE_int32(1));
		}
	}
}

/* XM_EIFFEL_SCANNER_DTD.set_encoding */
void T224f206(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	{
		t1 = (((T224*)(C))->a7?((m1 = ((T224*)(C))->a7, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		T266f30(ac, m1, a1);
	}
}

/* XM_EIFFEL_ENTITY_DEF.set_encoding */
void T223f236(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	{
		t1 = (((T223*)(C))->a45?((m1 = ((T223*)(C))->a45, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		T266f30(ac, m1, a1);
	}
}

/* XM_EIFFEL_SCANNER.set_encoding */
void T183f204(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	{
		t1 = (((T183*)(C))->a7?((m1 = ((T183*)(C))->a7, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		T266f30(ac, m1, a1);
	}
}

/* XM_EIFFEL_PE_ENTITY_DEF.set_input_from_resolver */
void T226f241(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	{
		t1 = (T191f2(ac, GE_void(a1)));
		t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
		if (!(t2)) {
			GE_raise(GE_EX_CHECK);
		}		T226f236(ac, C, m1);
		((T226*)(C))->a49 = a1;
	}
}

/* XM_EIFFEL_SCANNER_DTD.set_input_from_resolver */
void T224f207(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	{
		t1 = (T191f2(ac, GE_void(a1)));
		t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
		if (!(t2)) {
			GE_raise(GE_EX_CHECK);
		}		T224f202(ac, C, m1);
		((T224*)(C))->a11 = a1;
	}
}

/* XM_EIFFEL_ENTITY_DEF.set_input_from_resolver */
void T223f237(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	{
		t1 = (T191f2(ac, GE_void(a1)));
		t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
		if (!(t2)) {
			GE_raise(GE_EX_CHECK);
		}		T223f232(ac, C, m1);
		((T223*)(C))->a47 = a1;
	}
}

/* XM_EIFFEL_SCANNER.set_input_from_resolver */
void T183f205(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	{
		t1 = (T191f2(ac, GE_void(a1)));
		t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
		if (!(t2)) {
			GE_raise(GE_EX_CHECK);
		}		T183f200(ac, C, m1);
		((T183*)(C))->a11 = a1;
	}
}

/* XM_EIFFEL_PE_ENTITY_DEF.close_input */
void T226f238(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* m2 = 0;
	t1 = (((T226*)(C))->a48?((m1 = ((T226*)(C))->a48, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t1 = (((T226*)(C))->a49?((m2 = ((T226*)(C))->a49, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t1 = (((((T0*)(m1))->id==97)?T97f30(ac, m1):T412f7(ac, m1)));
			if (t1) {
				if (((T0*)(m1))->id==97) {
					T97f63(ac, m1);
				} else {
					T412f11(ac, m1);
				}
			}
			T191f6(ac, m2);
		}
		((T226*)(C))->a48 = EIF_VOID;
		((T226*)(C))->a49 = EIF_VOID;
	}
}

/* KL_STRING_INPUT_STREAM.close */
void T412f11(GE_context* ac, T0* C)
{
}

/* KL_STRING_INPUT_STREAM.is_closable */
T1 T412f7(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* KL_TEXT_INPUT_FILE.is_closable */
T1 T97f30(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T97f28(ac, C));
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.close_input */
void T224f204(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* m2 = 0;
	t1 = (((T224*)(C))->a10?((m1 = ((T224*)(C))->a10, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t1 = (((T224*)(C))->a11?((m2 = ((T224*)(C))->a11, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t1 = (T97f30(ac, m1));
			if (t1) {
				T97f63(ac, m1);
			}
			T191f6(ac, m2);
		}
		((T224*)(C))->a10 = EIF_VOID;
		((T224*)(C))->a11 = EIF_VOID;
	}
}

/* XM_EIFFEL_ENTITY_DEF.close_input */
void T223f234(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* m2 = 0;
	t1 = (((T223*)(C))->a46?((m1 = ((T223*)(C))->a46, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t1 = (((T223*)(C))->a47?((m2 = ((T223*)(C))->a47, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t1 = (((((T0*)(m1))->id==97)?T97f30(ac, m1):T412f7(ac, m1)));
			if (t1) {
				if (((T0*)(m1))->id==97) {
					T97f63(ac, m1);
				} else {
					T412f11(ac, m1);
				}
			}
			T191f6(ac, m2);
		}
		((T223*)(C))->a46 = EIF_VOID;
		((T223*)(C))->a47 = EIF_VOID;
	}
}

/* XM_EIFFEL_SCANNER.close_input */
void T183f202(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* m2 = 0;
	t1 = (((T183*)(C))->a10?((m1 = ((T183*)(C))->a10, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t1 = (((T183*)(C))->a11?((m2 = ((T183*)(C))->a11, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t1 = (T97f30(ac, m1));
			if (t1) {
				T97f63(ac, m1);
			}
			T191f6(ac, m2);
		}
		((T183*)(C))->a10 = EIF_VOID;
		((T183*)(C))->a11 = EIF_VOID;
	}
}

/* XM_NAMESPACE_RESOLVER.on_start */
void T227f27(GE_context* ac, T0* C)
{
	T227f38(ac, C);
	T141x5884(ac, GE_void(((T227*)(C))->a1));
}

/* XM_CALLBACKS_NULL.on_start */
void T188f2(GE_context* ac, T0* C)
{
}

/* XM_STOP_ON_ERROR_FILTER.on_start */
void T145f9(GE_context* ac, T0* C)
{
	((T145*)(C))->a1 = EIF_FALSE;
	((T145*)(C))->a2 = EIF_VOID;
	T145f9p1(ac, C);
}

/* XM_STOP_ON_ERROR_FILTER.on_start */
void T145f9p1(GE_context* ac, T0* C)
{
	T141x5884(ac, GE_void(((T145*)(C))->a3));
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_start */
void T142f14(GE_context* ac, T0* C)
{
	T142f12(ac, C);
}

/* XM_NAMESPACE_RESOLVER.on_finish */
void T227f28(GE_context* ac, T0* C)
{
	T141x5885(ac, GE_void(((T227*)(C))->a1));
}

/* XM_CALLBACKS_NULL.on_finish */
void T188f3(GE_context* ac, T0* C)
{
}

/* XM_STOP_ON_ERROR_FILTER.on_finish */
void T145f10(GE_context* ac, T0* C)
{
	T1 t1;
	t1 = ((T1)(!(((T145*)(C))->a1)));
	if (t1) {
		T145f10p1(ac, C);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_finish */
void T145f10p1(GE_context* ac, T0* C)
{
	T141x5885(ac, GE_void(((T145*)(C))->a3));
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_finish */
void T142f15(GE_context* ac, T0* C)
{
	T141x5885(ac, GE_void(((T142*)(C))->a6));
}

/* XM_NAMESPACE_RESOLVER.on_comment */
void T227f29(GE_context* ac, T0* C, T0* a1)
{
	T141x5889T0(ac, GE_void(((T227*)(C))->a1), a1);
}

/* XM_CALLBACKS_NULL.on_comment */
void T188f4(GE_context* ac, T0* C, T0* a1)
{
}

/* XM_STOP_ON_ERROR_FILTER.on_comment */
void T145f11(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	t1 = ((T1)(!(((T145*)(C))->a1)));
	if (t1) {
		T145f11p1(ac, C, a1);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_comment */
void T145f11p1(GE_context* ac, T0* C, T0* a1)
{
	T141x5889T0(ac, GE_void(((T145*)(C))->a3), a1);
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_comment */
void T142f16(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T0* l1 = 0;
	t1 = (((T142*)(C))->a4?((m1 = ((T142*)(C))->a4, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		l1 = T323c3(ac, m1, a1);
	} else {
		l1 = T323c4(ac, ((T142*)(C))->a2, a1);
	}
	T142f24(ac, C, l1);
}

/* XM_CALLBACKS_TO_TREE_FILTER.handle_position */
void T142f24(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T0* m2 = 0;
	T0* t2;
	t1 = (((T142*)(C))->a1?((m1 = ((T142*)(C))->a1, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t1 = (((T142*)(C))->a3?((m2 = ((T142*)(C))->a3, EIF_TRUE)):EIF_FALSE);
	}
	if (t1) {
		t2 = (T138f141(ac, m2));
		T146f5(ac, m1, t2, a1);
	}
}

/* XM_POSITION_TABLE.put */
void T146f5(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	l1 = T271c3(ac, a1, a2);
	T241f9(ac, GE_void(((T146*)(C))->a1), l1);
}

/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].put_last */
void T241f9(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T0* l1 = 0;
	t1 = (((T241*)(C))->a2?((m1 = ((T241*)(C))->a2, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		l1 = T330c3(ac, a1);
		T330f4(ac, m1, l1);
		((T241*)(C))->a2 = l1;
		((T241*)(C))->a3 = ((T6)((((T241*)(C))->a3)+((T6)(GE_int32(1)))));
	} else {
		((T241*)(C))->a4 = T330c3(ac, a1);
		((T241*)(C))->a2 = ((T241*)(C))->a4;
		((T241*)(C))->a3 = (T6)(GE_int32(1));
	}
}

/* detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].put_right */
void T330f4(GE_context* ac, T0* C, T0* a1)
{
	((T330*)(C))->a2 = a1;
}

/* detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].make */
T0* T330c3(GE_context* ac, T0* a1)
{
	T0* C;
	C = GE_new330(EIF_TRUE);
	((T330*)(C))->a1 = a1;
	return C;
}

/* DS_PAIR [XM_POSITION, XM_NODE].make */
T0* T271c3(GE_context* ac, T0* a1, T0* a2)
{
	T0* C;
	C = GE_new271(EIF_TRUE);
	((T271*)(C))->a1 = a1;
	((T271*)(C))->a2 = a2;
	return C;
}

/* XM_COMMENT.make_last_in_document */
T0* T323c4(GE_context* ac, T0* a1, T0* a2)
{
	T0* C;
	C = GE_new323(EIF_TRUE);
	((T323*)(C))->a1 = a2;
	((T323*)(C))->a2 = a1;
	T143f12(ac, GE_void(a1), C);
	return C;
}

/* XM_COMMENT.make_last */
T0* T323c3(GE_context* ac, T0* a1, T0* a2)
{
	T0* C;
	C = GE_new323(EIF_TRUE);
	((T323*)(C))->a1 = a2;
	((T323*)(C))->a2 = a1;
	T144f28(ac, GE_void(a1), C);
	return C;
}

/* XM_ELEMENT.force_last */
void T144f28(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	t1 = (T144f17(ac, C));
	if (!(t1)) {
		t2 = (T144f18(ac, C));
		t1 = ((t2)!=(a1));
	}
	if (t1) {
		T144f29(ac, C, a1);
		T239f13(ac, GE_void(((T144*)(C))->a2), a1);
	}
}

/* XM_LINKED_LIST [XM_ELEMENT_NODE].force_last */
void T239f13(GE_context* ac, T0* C, T0* a1)
{
	T239f18(ac, C, a1);
	T239f13p1(ac, C, a1);
}

/* XM_LINKED_LIST [XM_ELEMENT_NODE].force_last */
void T239f13p1(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T0* l1 = 0;
	t1 = (((T239*)(C))->a2?((m1 = ((T239*)(C))->a2, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		l1 = T329c3(ac, a1);
		T329f4(ac, m1, l1);
		((T239*)(C))->a2 = l1;
		((T239*)(C))->a3 = ((T6)((((T239*)(C))->a3)+((T6)(GE_int32(1)))));
	} else {
		((T239*)(C))->a4 = T329c3(ac, a1);
		((T239*)(C))->a2 = ((T239*)(C))->a4;
		((T239*)(C))->a3 = (T6)(GE_int32(1));
	}
}

/* detachable DS_LINKABLE [XM_ELEMENT_NODE].make */
T0* T329c3(GE_context* ac, T0* a1)
{
	T0* C;
	C = GE_new329(EIF_TRUE);
	((T329*)(C))->a2 = a1;
	return C;
}

/* XM_LINKED_LIST [XM_ELEMENT_NODE].before_addition */
void T239f18(GE_context* ac, T0* C, T0* a1)
{
}

/* XM_ELEMENT.before_addition */
void T144f29(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	t1 = (T309x6500(ac, a1));
	t2 = ((t1)!=(C));
	if (t2) {
		t1 = (T309x6500(ac, a1));
		if (((T0*)(GE_void(t1)))->id==143) {
			T143f14(ac, t1, a1);
		} else {
			T144f27(ac, t1, a1);
		}
	}
	T309x6513T0(ac, a1, C);
}

/* XM_ELEMENT.last */
T0* T144f18(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T239f8(ac, GE_void(((T144*)(C))->a2)));
	return R;
}

/* XM_LINKED_LIST [XM_ELEMENT_NODE].last */
T0* T239f8(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* R = 0;
	{
		t1 = (((T239*)(C))->a2?((m1 = ((T239*)(C))->a2, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		R = (((T329*)(m1))->a2);
	}
	return R;
}

/* XM_ELEMENT.is_empty */
T1 T144f17(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T239f7(ac, GE_void(((T144*)(C))->a2)));
	return R;
}

/* XM_LINKED_LIST [XM_ELEMENT_NODE].is_empty */
T1 T239f7(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (((((((T239*)(C))->a3) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_NAMESPACE_RESOLVER.on_processing_instruction */
void T227f30(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T141x5888T0T0(ac, GE_void(((T227*)(C))->a1), a1, a2);
}

/* XM_CALLBACKS_NULL.on_processing_instruction */
void T188f5(GE_context* ac, T0* C, T0* a1, T0* a2)
{
}

/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
void T145f12(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T1 t1;
	t1 = ((T1)(!(((T145*)(C))->a1)));
	if (t1) {
		T145f12p1(ac, C, a1, a2);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
void T145f12p1(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T141x5888T0T0(ac, GE_void(((T145*)(C))->a3), a1, a2);
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_processing_instruction */
void T142f17(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T0* m1 = 0;
	T0* l1 = 0;
	t1 = (((T142*)(C))->a4?((m1 = ((T142*)(C))->a4, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		l1 = T324c4(ac, m1, a1, a2);
	} else {
		l1 = T324c5(ac, ((T142*)(C))->a2, a1, a2);
	}
	T142f24(ac, C, l1);
}

/* XM_PROCESSING_INSTRUCTION.make_last_in_document */
T0* T324c5(GE_context* ac, T0* a1, T0* a2, T0* a3)
{
	T0* C;
	C = GE_new324(EIF_TRUE);
	((T324*)(C))->a1 = a2;
	((T324*)(C))->a2 = a3;
	((T324*)(C))->a3 = a1;
	T143f12(ac, GE_void(a1), C);
	return C;
}

/* XM_PROCESSING_INSTRUCTION.make_last */
T0* T324c4(GE_context* ac, T0* a1, T0* a2, T0* a3)
{
	T0* C;
	C = GE_new324(EIF_TRUE);
	((T324*)(C))->a1 = a2;
	((T324*)(C))->a2 = a3;
	((T324*)(C))->a3 = a1;
	T144f28(ac, GE_void(a1), C);
	return C;
}

/* XM_NAMESPACE_RESOLVER.on_content */
void T227f31(GE_context* ac, T0* C, T0* a1)
{
	T141x5894T0(ac, GE_void(((T227*)(C))->a1), a1);
}

/* XM_CALLBACKS_NULL.on_content */
void T188f6(GE_context* ac, T0* C, T0* a1)
{
}

/* XM_STOP_ON_ERROR_FILTER.on_content */
void T145f13(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	t1 = ((T1)(!(((T145*)(C))->a1)));
	if (t1) {
		T145f13p1(ac, C, a1);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_content */
void T145f13p1(GE_context* ac, T0* C, T0* a1)
{
	T141x5894T0(ac, GE_void(((T145*)(C))->a3), a1);
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_content */
void T142f18(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T0* l1 = 0;
	{
		t1 = (((T142*)(C))->a4?((m1 = ((T142*)(C))->a4, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		l1 = T325c3(ac, m1, a1);
		T142f24(ac, C, l1);
	}
}

/* XM_CHARACTER_DATA.make_last */
T0* T325c3(GE_context* ac, T0* a1, T0* a2)
{
	T0* C;
	C = GE_new325(EIF_TRUE);
	((T325*)(C))->a1 = a2;
	((T325*)(C))->a2 = a1;
	T144f28(ac, GE_void(a1), C);
	return C;
}

/* XM_NAMESPACE_RESOLVER.on_start_tag */
void T227f34(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3)
{
	T299f12(ac, GE_void(((T227*)(C))->a4));
	((T227*)(C))->a3 = a2;
	((T227*)(C))->a2 = a3;
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.push */
void T299f12(GE_context* ac, T0* C)
{
	T0* t1;
	t1 = (T299f8(ac, C));
	T407f10(ac, GE_void(((T299*)(C))->a1), t1);
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].force_last */
void T407f10(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T0* l1 = 0;
	t1 = (((T407*)(C))->a2?((m1 = ((T407*)(C))->a2, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		l1 = T501c4(ac, a1);
		T501f5(ac, m1, l1);
		((T407*)(C))->a2 = l1;
		((T407*)(C))->a1 = ((T6)((((T407*)(C))->a1)+((T6)(GE_int32(1)))));
	} else {
		((T407*)(C))->a3 = T501c4(ac, a1);
		((T407*)(C))->a2 = ((T407*)(C))->a3;
		((T407*)(C))->a1 = (T6)(GE_int32(1));
	}
}

/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].put_right */
void T501f5(GE_context* ac, T0* C, T0* a1)
{
	((T501*)(C))->a3 = a1;
	T501f6(ac, GE_void(a1), C);
}

/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].attach_left */
void T501f6(GE_context* ac, T0* C, T0* a1)
{
	((T501*)(C))->a2 = a1;
}

/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].make */
T0* T501c4(GE_context* ac, T0* a1)
{
	T0* C;
	C = GE_new501(EIF_TRUE);
	((T501*)(C))->a1 = a1;
	return C;
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.new_string_string_table */
T0* T299f8(GE_context* ac, T0* C)
{
	T0* t1;
	T0* R = 0;
	R = T120c40(ac);
	t1 = (T299f9(ac, C));
	T120f41(ac, GE_void(R), t1);
	t1 = (T299f9(ac, C));
	T120f42(ac, GE_void(R), t1);
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].set_equality_tester */
void T120f42(GE_context* ac, T0* C, T0* a1)
{
	((T120*)(C))->a3 = a1;
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.string_equality_tester */
T0* T299f9(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge222os2707) {
		return ge222ov2707;
	} else {
		ge222os2707 = '\1';
		ge222ov2707 = R;
	}
	R = T101c3(ac);
	ge222ov2707 = R;
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].make_map_default */
T0* T120c40(GE_context* ac)
{
	T0* C;
	T6 t1;
	C = GE_new120(EIF_TRUE);
	t1 = (T120f37(ac, C));
	T120f43(ac, C, t1);
	return C;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].default_capacity */
T6 T120f37(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (T6)(GE_int32(10));
	return R;
}

/* XM_CALLBACKS_NULL.on_start_tag */
void T188f9(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3)
{
}

/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
void T145f14(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	t1 = ((T1)(!(((T145*)(C))->a1)));
	if (t1) {
		T145f14p1(ac, C, a1, a2, a3);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
void T145f14p1(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3)
{
	T141x5890T0T0T0(ac, GE_void(((T145*)(C))->a3), a1, a2, a3);
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag */
void T142f19(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T0* m1 = 0;
	T0* m2 = 0;
	T0* t2;
	T0* l1 = 0;
	{
		t1 = (a1?((m1 = a1, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		t1 = (((T142*)(C))->a4?((m2 = ((T142*)(C))->a4, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t2 = (T142f8(ac, C, m1, a2));
			l1 = T144c25(ac, m2, a3, t2);
		} else {
			t2 = (T142f8(ac, C, m1, a2));
			l1 = T144c26(ac, ((T142*)(C))->a2, a3, t2);
		}
		((T142*)(C))->a4 = l1;
		T142f24(ac, C, l1);
	}
}

/* XM_ELEMENT.make_root */
T0* T144c26(GE_context* ac, T0* a1, T0* a2, T0* a3)
{
	T0* C;
	C = GE_new144(EIF_TRUE);
	((T144*)(C))->a4 = a2;
	((T144*)(C))->a3 = a3;
	((T144*)(C))->a1 = a1;
	((T144*)(C))->a2 = T239c11(ac);
	T143f15(ac, GE_void(a1), C);
	return C;
}

/* XM_DOCUMENT.set_root_element */
void T143f15(GE_context* ac, T0* C, T0* a1)
{
	T143f16(ac, C);
	((T143*)(C))->a1 = a1;
	T143f12(ac, C, a1);
}

/* XM_DOCUMENT.remove_previous_root_element */
void T143f16(GE_context* ac, T0* C)
{
	T1 t1;
	T0* t2;
	T0* l1 = 0;
	l1 = (T143f7(ac, C));
	T269f11(ac, GE_void(l1));
	while (1) {
		t1 = (((T269*)(GE_void(l1)))->a1);
		if (t1) {
			break;
		}
		t2 = (T269f8(ac, GE_void(l1)));
		t1 = ((t2)==(((T143*)(C))->a1));
		if (t1) {
			T269f12(ac, GE_void(l1));
			T269f14(ac, GE_void(l1));
		} else {
			T269f13(ac, GE_void(l1));
		}
	}
}

/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].go_after */
void T269f14(GE_context* ac, T0* C)
{
	T232f28(ac, GE_void(((T269*)(C))->a3), C);
}

/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_go_after */
void T232f28(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T1 l1 = 0;
	l1 = (T232f8(ac, C, a1));
	T269f18(ac, a1);
	t1 = ((T1)(!(l1)));
	if (t1) {
		T232f23(ac, C, a1);
	}
}

/* XM_ELEMENT.make_last */
T0* T144c25(GE_context* ac, T0* a1, T0* a2, T0* a3)
{
	T0* C;
	C = GE_new144(EIF_TRUE);
	((T144*)(C))->a4 = a2;
	((T144*)(C))->a3 = a3;
	((T144*)(C))->a1 = a1;
	((T144*)(C))->a2 = T239c11(ac);
	T144f28(ac, GE_void(a1), C);
	return C;
}

/* XM_CALLBACKS_TO_TREE_FILTER.new_namespace */
T0* T142f8(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T0* t2;
	T0* R = 0;
	R = T231c8(ac, a2, a1);
	t1 = (T230f30(ac, GE_void(((T142*)(C))->a5), R));
	if (t1) {
		t2 = (T230f17(ac, GE_void(((T142*)(C))->a5), R));
		t1 = (T231f5(ac, GE_void(t2), R));
	}
	if (t1) {
		R = (T230f17(ac, GE_void(((T142*)(C))->a5), R));
	} else {
		T230f39(ac, GE_void(((T142*)(C))->a5), R);
	}
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].force_last */
void T230f39(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T230f37(ac, C);
	T230f40(ac, C, a1);
	t1 = (((((((T230*)(C))->a6) != ((T6)(GE_int32(-1)))))));
	if (t1) {
		T230f41(ac, C, a1, ((T230*)(C))->a6);
	} else {
		l1 = ((T6)((((T230*)(C))->a4)+((T6)(GE_int32(1)))));
		t1 = (T6f8(ac, (&l1), ((T230*)(C))->a2));
		if (t1) {
			t2 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t2 = (T230f19(ac, C, t2));
			T230f42(ac, C, t2);
			l2 = (T230f20(ac, C, a1));
		} else {
			l2 = ((T230*)(C))->a13;
		}
		((T230*)(C))->a4 = l1;
		t2 = (T230f22(ac, C, l2));
		T230f43(ac, C, t2, l1);
		T230f44(ac, C, l1, l2);
		T230f41(ac, C, a1, l1);
		((T230*)(C))->a14 = ((T6)((((T230*)(C))->a14)+((T6)(GE_int32(1)))));
	}
}

/* DS_HASH_SET [XM_NAMESPACE].slots_put */
void T230f44(GE_context* ac, T0* C, T6 a1, T6 a2)
{
	((T95*)(GE_void(((T230*)(C))->a10)))->z2[a2] = (a1);
}

/* DS_HASH_SET [XM_NAMESPACE].clashes_put */
void T230f43(GE_context* ac, T0* C, T6 a1, T6 a2)
{
	((T95*)(GE_void(((T230*)(C))->a9)))->z2[a2] = (a1);
}

/* DS_HASH_SET [XM_NAMESPACE].slots_item */
T6 T230f22(GE_context* ac, T0* C, T6 a1)
{
	T6 R = 0;
	R = (((T95*)(GE_void(((T230*)(C))->a10)))->z2[a1]);
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].hash_position */
T6 T230f20(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T6 t2;
	T6 R = 0;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t1 = (((T230*)(C))->a16?((m1 = ((T230*)(C))->a16, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t2 = ((m1, a1, (T6)0));
			R = ((T6)((t2)%(((T230*)(C))->a3)));
		} else {
			t2 = (T231f6(ac, GE_void(a1)));
			R = ((T6)((t2)%(((T230*)(C))->a3)));
		}
	} else {
		R = ((T230*)(C))->a3;
	}
	return R;
}

/* XM_NAMESPACE.hash_code */
T6 T231f6(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((((T0*)(GE_void(((T231*)(C))->a1)))->id==17)?T17f8(ac, ((T231*)(C))->a1):T265f18(ac, ((T231*)(C))->a1)));
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].resize */
void T230f42(GE_context* ac, T0* C, T6 a1)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T230f37(ac, C);
	l1 = (T230f21(ac, C, a1));
	t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	T230f45(ac, C, t1);
	l2 = ((T230*)(C))->a3;
	while (1) {
		t2 = ((T1)((l2)<((T6)(GE_int32(0)))));
		if (t2) {
			break;
		}
		T230f44(ac, C, (T6)(GE_int32(-1)), l2);
		l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
	}
	((T230*)(C))->a3 = l1;
	l2 = ((T230*)(C))->a4;
	while (1) {
		t2 = ((T1)((l2)<((T6)(GE_int32(0)))));
		if (t2) {
			break;
		}
		t1 = (T230f26(ac, C, l2));
		t2 = (T6f1(ac, &t1, (T6)(GE_int32(-2))));
		if (t2) {
			t3 = (T230f28(ac, C, l2));
			l3 = (T230f20(ac, C, t3));
			t1 = (T230f22(ac, C, l3));
			T230f43(ac, C, t1, l2);
			T230f44(ac, C, l2, l3);
		}
		l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
	}
	T230f46(ac, C, a1);
	T230f47(ac, C, a1);
	T230f48(ac, C, a1);
	((T230*)(C))->a2 = a1;
	((T230*)(C))->a6 = (T6)(GE_int32(-1));
}

/* DS_HASH_SET [XM_NAMESPACE].clashes_resize */
void T230f48(GE_context* ac, T0* C, T6 a1)
{
	T0* t1;
	t1 = (T230f29(ac, C));
	((T230*)(C))->a9 = (T106f1(ac, GE_void(t1), ((T230*)(C))->a9, (T6)(GE_int32(-1)), a1));
}

/* DS_HASH_SET [XM_NAMESPACE].special_integer_ */
T0* T230f29(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge127os2705) {
		return ge127ov2705;
	} else {
		ge127os2705 = '\1';
		ge127ov2705 = R;
	}
	R = T106c7(ac);
	ge127ov2705 = R;
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].key_storage_resize */
void T230f47(GE_context* ac, T0* C, T6 a1)
{
}

/* DS_HASH_SET [XM_NAMESPACE].item_storage_resize */
void T230f46(GE_context* ac, T0* C, T6 a1)
{
	((T230*)(C))->a8 = (T304f2(ac, GE_void(((T230*)(C))->a7), ((T230*)(C))->a8, a1));
}

/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].aliased_resized_area */
T0* T304f2(GE_context* ac, T0* C, T0* a1, T6 a2)
{
	T6 t1;
	T1 t2;
	T0* R = 0;
	t1 = (((T305*)(GE_void(a1)))->a2);
	t2 = (T6f1(ac, &a2, t1));
	if (t2) {
		R = (T305f4(ac, GE_void(a1), a2));
	} else {
		R = a1;
	}
	return R;
}

/* SPECIAL [XM_NAMESPACE].aliased_resized_area */
T0* T305f4(GE_context* ac, T0* C, T6 a1)
{
	T0* R = 0;
	T6 t1;
	{
	t1 = ((T305*)(C))->a2;
	if (a1 > t1) {
		R = GE_new305(a1, EIF_FALSE);
		*(T305*)(R) = *(T305*)(C);
		memcpy(((T305*)(R))->z2,((T305*)(C))->z2,t1*sizeof(T0*));
#ifndef GE_alloc_cleared
		memset(((T305*)(R))->z2+t1,0,(a1-t1)*sizeof(T0*));
#endif
	} else {
		R = C;
		t1 = ((T305*)(R))->a1;
		if (t1 > a1) {
			((T305*)(R))->a1 = a1;
#ifndef GE_alloc_cleared
			memset(((T305*)(R))->z2+a1,0,(t1-a1)*sizeof(T0*));
#endif
		}
	}
	((T305*)(R))->a2 = a1;
	}
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].key_storage_item */
T0* T230f28(GE_context* ac, T0* C, T6 a1)
{
	T0* R = 0;
	R = (T230f18(ac, C, a1));
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].item_storage_item */
T0* T230f18(GE_context* ac, T0* C, T6 a1)
{
	T0* R = 0;
	R = (((T305*)(GE_void(((T230*)(C))->a8)))->z2[a1]);
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].clashes_item */
T6 T230f26(GE_context* ac, T0* C, T6 a1)
{
	T6 R = 0;
	R = (((T95*)(GE_void(((T230*)(C))->a9)))->z2[a1]);
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].slots_resize */
void T230f45(GE_context* ac, T0* C, T6 a1)
{
	T0* t1;
	t1 = (T230f29(ac, C));
	((T230*)(C))->a10 = (T106f1(ac, GE_void(t1), ((T230*)(C))->a10, (T6)(GE_int32(-1)), a1));
}

/* DS_HASH_SET [XM_NAMESPACE].new_capacity */
T6 T230f19(GE_context* ac, T0* C, T6 a1)
{
	T6 t1;
	T6 R = 0;
	t1 = (T6)(GE_int32(2));
	R = ((T6)((t1)*(a1)));
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].item_storage_put */
void T230f41(GE_context* ac, T0* C, T0* a1, T6 a2)
{
	T304f4(ac, GE_void(((T230*)(C))->a7), ((T230*)(C))->a8, a1, a2);
}

/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].force */
void T304f4(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3)
{
	T6 t1;
	T1 t2;
	t1 = (((T305*)(GE_void(a1)))->a1);
	t2 = ((T1)((a3)<(t1)));
	if (t2) {
		((T305*)(GE_void(a1)))->z2[a3] = (a2);
	} else {
		t1 = (((T305*)(GE_void(a1)))->a1);
		T305f7(ac, GE_void(a1), a2, t1, a3);
	}
}

/* SPECIAL [XM_NAMESPACE].fill_with */
void T305f7(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 t1;
	T1 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	l1 = a2;
	t1 = ((T6)((a3)+((T6)(GE_int32(1)))));
	l3 = (T6f11(ac, &(((T305*)(C))->a1), t1));
	l2 = l3;
	while (1) {
		t2 = (((((l1) == (l2)))));
		if (t2) {
			break;
		}
		((T305*)(C))->z2[l1] = (a1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	l1 = l3;
	l2 = ((T6)((a3)+((T6)(GE_int32(1)))));
	while (1) {
		t2 = (((((l1) == (l2)))));
		if (t2) {
			break;
		}
		T305f8(ac, C, a1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
}

/* SPECIAL [XM_NAMESPACE].extend */
void T305f8(GE_context* ac, T0* C, T0* a1)
{
	T6 t1;
	{
	t1 = ((T305*)(C))->a1;
	((T305*)(C))->a1 = t1 + 1 ;
	((T305*)(C))->z2[t1] = a1;
	}
}

/* DS_HASH_SET [XM_NAMESPACE].search_position */
void T230f40(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* m1 = 0;
	T6 t3;
	T1 t4;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	t1 = ((a1)==(EIF_VOID));
	if (t1) {
		((T230*)(C))->a6 = (T230f22(ac, C, ((T230*)(C))->a3));
		((T230*)(C))->a13 = ((T230*)(C))->a3;
		((T230*)(C))->a15 = (T6)(GE_int32(-1));
	} else {
		t2 = (T230f25(ac, C));
		t1 = (t2?((m1 = t2, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			l3 = ((T230*)(C))->a6;
			l4 = ((T230*)(C))->a13;
			l2 = ((T230*)(C))->a15;
			t1 = (((((((T230*)(C))->a6) == ((T6)(GE_int32(-1)))))));
			if (!(t1)) {
				t3 = (T230f26(ac, C, ((T230*)(C))->a6));
				t1 = (T6f10(ac, &t3, (T6)(GE_int32(-2))));
			}
			if (!(t1)) {
				t2 = (T230f28(ac, C, ((T230*)(C))->a6));
				t4 = (T302f1(ac, m1, a1, t2));
				t1 = ((T1)(!(t4)));
			}
			if (t1) {
				l4 = (T230f20(ac, C, a1));
				l1 = (T230f22(ac, C, l4));
				l3 = (T6)(GE_int32(-1));
				l2 = (T6)(GE_int32(-1));
				while (1) {
					t1 = (((((l1) == ((T6)(GE_int32(-1)))))));
					if (t1) {
						break;
					}
					t2 = (T230f28(ac, C, l1));
					t1 = (T302f1(ac, m1, a1, t2));
					if (t1) {
						l3 = l1;
						l1 = (T6)(GE_int32(-1));
					} else {
						l2 = l1;
						l1 = (T230f26(ac, C, l1));
					}
				}
			}
			((T230*)(C))->a6 = l3;
			((T230*)(C))->a13 = l4;
			((T230*)(C))->a15 = l2;
		} else {
			t1 = (((((((T230*)(C))->a6) == ((T6)(GE_int32(-1)))))));
			if (!(t1)) {
				t3 = (T230f26(ac, C, ((T230*)(C))->a6));
				t1 = (T6f10(ac, &t3, (T6)(GE_int32(-2))));
			}
			if (!(t1)) {
				t2 = (T230f28(ac, C, ((T230*)(C))->a6));
				t1 = ((a1)!=(t2));
			}
			if (t1) {
				((T230*)(C))->a13 = (T230f20(ac, C, a1));
				l1 = (T230f22(ac, C, ((T230*)(C))->a13));
				((T230*)(C))->a6 = (T6)(GE_int32(-1));
				l2 = (T6)(GE_int32(-1));
				while (1) {
					t1 = (((((l1) == ((T6)(GE_int32(-1)))))));
					if (t1) {
						break;
					}
					t2 = (T230f28(ac, C, l1));
					t1 = ((a1)==(t2));
					if (t1) {
						((T230*)(C))->a6 = l1;
						l1 = (T6)(GE_int32(-1));
					} else {
						l2 = l1;
						l1 = (T230f26(ac, C, l1));
					}
				}
				((T230*)(C))->a15 = l2;
			}
		}
	}
}

/* detachable KL_EQUALITY_TESTER [XM_NAMESPACE].test */
T1 T302f1(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = ((a1)==(a2));
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = ((((a1) == EIF_VOID)?((a2) == EIF_VOID):(((a2) != EIF_VOID)&&T231f4(ac, a1, a2))));
	}
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].key_equality_tester */
T0* T230f25(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = ((T230*)(C))->a1;
	return R;
}

/* XM_NAMESPACE.same_prefix */
T1 T231f5(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* m1 = 0;
	T0* m2 = 0;
	T1 R = 0;
	t1 = (T231f4(ac, C, a1));
	if (t1) {
		t2 = (((T231*)(GE_void(a1)))->a2);
		t1 = ((((T231*)(C))->a2)==(t2));
		if (!(t1)) {
			t1 = (((T231*)(C))->a2?((m1 = ((T231*)(C))->a2, EIF_TRUE)):EIF_FALSE);
			if (t1) {
				t2 = (((T231*)(GE_void(a1)))->a2);
				t1 = (t2?((m2 = t2, EIF_TRUE)):EIF_FALSE);
			}
			if (t1) {
				t2 = (T231f3(ac, C));
				R = (T115f1(ac, GE_void(t2), m1, m2));
			} else {
				R = EIF_FALSE;
			}
		} else {
			R = EIF_TRUE;
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].item */
T0* T230f17(GE_context* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T230f40(ac, C, a1);
	R = (T230f18(ac, C, ((T230*)(C))->a6));
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].has */
T1 T230f30(GE_context* ac, T0* C, T0* a1)
{
	T1 R = 0;
	T230f40(ac, C, a1);
	R = (((((((T230*)(C))->a6) != ((T6)(GE_int32(-1)))))));
	return R;
}

/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
void T227f32(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* m2 = 0;
	T0* t2;
	T0* l1 = 0;
	{
		t1 = (((T227*)(C))->a2?((m1 = ((T227*)(C))->a2, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		t1 = (((T227*)(C))->a3?((m2 = ((T227*)(C))->a3, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t1 = (T227f10(ac, C, m2));
		}
		if (t1) {
			t1 = (T299f5(ac, GE_void(((T227*)(C))->a4), m2));
			if (t1) {
				t2 = (T299f2(ac, GE_void(((T227*)(C))->a4), m2));
				T141x5890T0T0T0(ac, GE_void(((T227*)(C))->a1), t2, m2, m1);
				T227f39(ac, C);
			} else {
				t2 = (T227f14(ac, C));
				l1 = (T115f7(ac, GE_void(t2), ge1444ov8030));
				t2 = (T227f14(ac, C));
				l1 = (T115f5(ac, GE_void(t2), l1, GE_ms8(" in tag <", 9)));
				t2 = (T227f14(ac, C));
				l1 = (T115f5(ac, GE_void(t2), l1, m2));
				t2 = (T227f14(ac, C));
				l1 = (T115f5(ac, GE_void(t2), l1, GE_ms8(":", 1)));
				t2 = (T227f14(ac, C));
				l1 = (T115f5(ac, GE_void(t2), l1, m1));
				t2 = (T227f14(ac, C));
				l1 = (T115f5(ac, GE_void(t2), l1, GE_ms8(">", 1)));
				T227f36(ac, C, l1);
			}
		} else {
			t2 = (T299f3(ac, GE_void(((T227*)(C))->a4)));
			T141x5890T0T0T0(ac, GE_void(((T227*)(C))->a1), t2, ((T227*)(C))->a3, m1);
			T227f39(ac, C);
		}
		T227f32p1(ac, C);
	}
}

/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
void T227f32p1(GE_context* ac, T0* C)
{
	T141x5892(ac, GE_void(((T227*)(C))->a1));
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve_default */
T0* T299f3(GE_context* ac, T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T299f7(ac, C));
	R = (T299f2(ac, C, t1));
	return R;
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.default_pseudo_prefix */
unsigned char ge1445os8569 = '\0';
T0* ge1445ov8569;
T0* T299f7(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge1445os8569) {
		return ge1445ov8569;
	} else {
		ge1445os8569 = '\1';
		ge1445ov8569 = R;
	}
	R = T17c40(ac);
	ge1445ov8569 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER.string_ */
T0* T227f14(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge128os1973) {
		return ge128ov1973;
	} else {
		ge128os1973 = '\1';
		ge128ov1973 = R;
	}
	R = T115c19(ac);
	ge128ov1973 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER.on_delayed_attributes */
void T227f39(GE_context* ac, T0* C)
{
	T1 t1;
	T0* t2;
	T0* t3;
	T0* t4;
	T0* l1 = 0;
	while (1) {
		t1 = (T227f12(ac, C));
		if (t1) {
			break;
		}
		l1 = (T301f5(ac, GE_void(((T227*)(C))->a6)));
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t1 = (T227f10(ac, C, l1));
		}
		if (t1) {
			t1 = (T299f5(ac, GE_void(((T227*)(C))->a4), l1));
			if (t1) {
				t2 = (T299f2(ac, GE_void(((T227*)(C))->a4), l1));
				t3 = (T301f5(ac, GE_void(((T227*)(C))->a7)));
				t4 = (T301f5(ac, GE_void(((T227*)(C))->a8)));
				T141x5891T0T0T0T0(ac, GE_void(((T227*)(C))->a1), t2, l1, t3, t4);
			} else {
				t1 = (T227f16(ac, C, l1));
				if (t1) {
					t2 = (T227f17(ac, C));
					t3 = (T301f5(ac, GE_void(((T227*)(C))->a7)));
					t4 = (T301f5(ac, GE_void(((T227*)(C))->a8)));
					T141x5891T0T0T0T0(ac, GE_void(((T227*)(C))->a1), t2, l1, t3, t4);
				} else {
					t1 = (T227f9(ac, C, l1));
					if (t1) {
						t2 = (T227f18(ac, C));
						t3 = (T301f5(ac, GE_void(((T227*)(C))->a7)));
						t4 = (T301f5(ac, GE_void(((T227*)(C))->a8)));
						T141x5891T0T0T0T0(ac, GE_void(((T227*)(C))->a1), t2, l1, t3, t4);
					} else {
						T227f36(ac, C, ge1444ov8030);
					}
				}
			}
		} else {
			t2 = (T227f19(ac, C));
			t3 = (T301f5(ac, GE_void(((T227*)(C))->a7)));
			t4 = (T301f5(ac, GE_void(((T227*)(C))->a8)));
			T141x5891T0T0T0T0(ac, GE_void(((T227*)(C))->a1), t2, l1, t3, t4);
		}
		T227f43(ac, C);
	}
}

/* XM_NAMESPACE_RESOLVER.attributes_remove */
void T227f43(GE_context* ac, T0* C)
{
	T301f8(ac, GE_void(((T227*)(C))->a6));
	T301f8(ac, GE_void(((T227*)(C))->a7));
	T301f8(ac, GE_void(((T227*)(C))->a8));
}

/* DS_LINKED_QUEUE [STRING_8].remove */
void T301f8(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	t1 = (((((((T301*)(C))->a2) == ((T6)(GE_int32(1)))))));
	if (t1) {
		T301f9(ac, C);
	} else {
		{
			t1 = (((T301*)(C))->a1?((m1 = ((T301*)(C))->a1, EIF_TRUE)):EIF_FALSE);
			if (!(t1)) {
				GE_raise(GE_EX_CHECK);
			}			((T301*)(C))->a1 = (((T409*)(m1))->a2);
			((T301*)(C))->a2 = ((T6)((((T301*)(C))->a2)-((T6)(GE_int32(1)))));
		}
	}
}

/* DS_LINKED_QUEUE [STRING_8].wipe_out */
void T301f9(GE_context* ac, T0* C)
{
	((T301*)(C))->a1 = EIF_VOID;
	((T301*)(C))->a3 = EIF_VOID;
	((T301*)(C))->a2 = (T6)(GE_int32(0));
}

/* XM_NAMESPACE_RESOLVER.unprefixed_attribute_namespace */
T0* T227f19(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T227f24(ac, C));
	return R;
}

/* XM_NAMESPACE_RESOLVER.default_namespace */
unsigned char ge1412os7643 = '\0';
T0* ge1412ov7643;
T0* T227f24(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge1412os7643) {
		return ge1412ov7643;
	} else {
		ge1412os7643 = '\1';
		ge1412ov7643 = R;
	}
	R = GE_ms8("", 0);
	ge1412ov7643 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER.xmlns_namespace */
unsigned char ge1412os7651 = '\0';
T0* ge1412ov7651;
T0* T227f18(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge1412os7651) {
		return ge1412ov7651;
	} else {
		ge1412os7651 = '\1';
		ge1412ov7651 = R;
	}
	R = GE_ms8("http://www.w3.org/2000/xmlns/", 29);
	ge1412ov7651 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER.is_xmlns */
T1 T227f9(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T227f21(ac, C));
		R = (T227f22(ac, C, t2, a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_NAMESPACE_RESOLVER.same_string */
T1 T227f22(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 R = 0;
	t1 = (T227f25(ac, C));
	R = (T101f1(ac, GE_void(t1), a1, a2));
	return R;
}

/* XM_NAMESPACE_RESOLVER.string_equality_tester */
T0* T227f25(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge222os2707) {
		return ge222ov2707;
	} else {
		ge222os2707 = '\1';
		ge222ov2707 = R;
	}
	R = T101c3(ac);
	ge222ov2707 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER.xmlns */
unsigned char ge1412os7644 = '\0';
T0* ge1412ov7644;
T0* T227f21(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge1412os7644) {
		return ge1412ov7644;
	} else {
		ge1412os7644 = '\1';
		ge1412ov7644 = R;
	}
	R = GE_ms8("xmlns", 5);
	ge1412ov7644 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER.xml_prefix_namespace */
unsigned char ge1412os7650 = '\0';
T0* ge1412ov7650;
T0* T227f17(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge1412os7650) {
		return ge1412ov7650;
	} else {
		ge1412os7650 = '\1';
		ge1412ov7650 = R;
	}
	R = GE_ms8("http://www.w3.org/XML/1998/namespace", 36);
	ge1412ov7650 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER.is_xml */
T1 T227f16(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T227f23(ac, C));
		R = (T227f22(ac, C, t2, a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_NAMESPACE_RESOLVER.xml_prefix */
unsigned char ge1412os7645 = '\0';
T0* ge1412ov7645;
T0* T227f23(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge1412os7645) {
		return ge1412ov7645;
	} else {
		ge1412os7645 = '\1';
		ge1412ov7645 = R;
	}
	R = GE_ms8("xml", 3);
	ge1412ov7645 = R;
	return R;
}

/* DS_LINKED_QUEUE [STRING_8].item */
T0* T301f5(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* R = 0;
	{
		t1 = (((T301*)(C))->a1?((m1 = ((T301*)(C))->a1, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		R = (((T409*)(m1))->a1);
	}
	return R;
}

/* XM_NAMESPACE_RESOLVER.attributes_is_empty */
T1 T227f12(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T301f4(ac, GE_void(((T227*)(C))->a6)));
	return R;
}

/* DS_LINKED_QUEUE [STRING_8].is_empty */
T1 T301f4(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (((((((T301*)(C))->a2) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve */
T0* T299f2(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* R = 0;
	T0* l1 = 0;
	R = (T299f6(ac, C));
	l1 = (T407f6(ac, GE_void(((T299*)(C))->a1)));
	T408f9(ac, GE_void(l1));
	while (1) {
		t1 = (((T408*)(GE_void(l1)))->a1);
		if (t1) {
			break;
		}
		t2 = (T408f6(ac, GE_void(l1)));
		t1 = (T120f21(ac, GE_void(t2), a1));
		if (t1) {
			t2 = (T408f6(ac, GE_void(l1)));
			R = (T120f22(ac, GE_void(t2), a1));
			T408f10(ac, GE_void(l1));
		} else {
			T408f11(ac, GE_void(l1));
		}
	}
	return R;
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].back */
void T408f11(GE_context* ac, T0* C)
{
	T407f18(ac, GE_void(((T408*)(C))->a4), C);
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_back */
void T407f18(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (((T408*)(a1))->a2);
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		l3 = (((T501*)(m1))->a2);
	} else {
		l1 = EIF_TRUE;
		l3 = ((T407*)(C))->a2;
	}
	l2 = ((l3)==(EIF_VOID));
	T408f14(ac, a1, l3, l2, EIF_FALSE);
	if (l2) {
		t2 = ((T1)(!(l1)));
		if (t2) {
			T407f20(ac, C, a1);
		}
	} else {
		if (l1) {
			T407f19(ac, C, a1);
		}
	}
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].add_traversing_cursor */
void T407f19(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	t1 = ((a1)!=(((T407*)(C))->a4));
	if (t1) {
		t2 = (((T408*)(GE_void(((T407*)(C))->a4)))->a3);
		T408f13(ac, a1, t2);
		T408f13(ac, GE_void(((T407*)(C))->a4), a1);
	}
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_next_cursor */
void T408f13(GE_context* ac, T0* C, T0* a1)
{
	((T408*)(C))->a3 = a1;
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_traversing_cursor */
void T407f20(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* l1 = 0;
	T0* l2 = 0;
	t1 = ((a1)!=(((T407*)(C))->a4));
	if (t1) {
		l2 = ((T407*)(C))->a4;
		l1 = (((T408*)(GE_void(l2)))->a3);
		while (1) {
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
			if (t1) {
				break;
			}
			l2 = l1;
			l1 = (((T408*)(GE_void(l1)))->a3);
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T408*)(a1))->a3);
			T408f13(ac, GE_void(l2), t2);
			T408f13(ac, a1, EIF_VOID);
		}
	}
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set */
void T408f14(GE_context* ac, T0* C, T0* a1, T1 a2, T1 a3)
{
	((T408*)(C))->a2 = a1;
	((T408*)(C))->a1 = a2;
	((T408*)(C))->a5 = a3;
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].go_before */
void T408f10(GE_context* ac, T0* C)
{
	T407f17(ac, GE_void(((T408*)(C))->a4), C);
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_go_before */
void T407f17(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T1 l1 = 0;
	l1 = (T407f7(ac, C, a1));
	T408f15(ac, a1);
	t1 = ((T1)(!(l1)));
	if (t1) {
		T407f20(ac, C, a1);
	}
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_before */
void T408f15(GE_context* ac, T0* C)
{
	((T408*)(C))->a2 = EIF_VOID;
	((T408*)(C))->a1 = EIF_TRUE;
	((T408*)(C))->a5 = EIF_FALSE;
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_off */
T1 T407f7(GE_context* ac, T0* C, T0* a1)
{
	T1 R = 0;
	R = (T408f7(ac, a1));
	return R;
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].off */
T1 T408f7(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = ((((T408*)(C))->a2)==(EIF_VOID));
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].item */
T0* T120f22(GE_context* ac, T0* C, T0* a1)
{
	T0* R = 0;
	T120f57(ac, C, a1);
	R = (T120f25(ac, C, ((T120*)(C))->a8));
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_item */
T0* T120f25(GE_context* ac, T0* C, T6 a1)
{
	T0* R = 0;
	R = (((T39*)(GE_void(((T120*)(C))->a10)))->z2[a1]);
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].has */
T1 T120f21(GE_context* ac, T0* C, T0* a1)
{
	T1 R = 0;
	T120f57(ac, C, a1);
	R = (((((((T120*)(C))->a8) != ((T6)(GE_int32(-1)))))));
	return R;
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].item */
T0* T408f6(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* R = 0;
	{
		t1 = (((T408*)(C))->a2?((m1 = ((T408*)(C))->a2, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		R = (((T501*)(m1))->a1);
	}
	return R;
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].finish */
void T408f9(GE_context* ac, T0* C)
{
	T407f16(ac, GE_void(((T408*)(C))->a4), C);
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_finish */
void T407f16(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T1 l1 = 0;
	T1 l2 = 0;
	l1 = (T407f7(ac, C, a1));
	l2 = ((((T407*)(C))->a2)==(EIF_VOID));
	T408f14(ac, a1, ((T407*)(C))->a2, l2, EIF_FALSE);
	t1 = ((T1)(!(l2)));
	if (t1) {
		t1 = (l1);
	}
	if (t1) {
		T407f19(ac, C, a1);
	}
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.default_namespace */
unsigned char ge1445os8570 = '\0';
T0* ge1445ov8570;
T0* T299f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge1445os8570) {
		return ge1445ov8570;
	} else {
		ge1445os8570 = '\1';
		ge1445ov8570 = R;
	}
	R = T17c40(ac);
	ge1445ov8570 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.has */
T1 T299f5(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T0* l1 = 0;
	l1 = (T407f6(ac, GE_void(((T299*)(C))->a1)));
	T408f9(ac, GE_void(l1));
	while (1) {
		t1 = (((T408*)(GE_void(l1)))->a1);
		if (t1) {
			break;
		}
		t2 = (T408f6(ac, GE_void(l1)));
		R = (T120f21(ac, GE_void(t2), a1));
		if (R) {
			T408f10(ac, GE_void(l1));
		} else {
			T408f11(ac, GE_void(l1));
		}
	}
	return R;
}

/* XM_NAMESPACE_RESOLVER.has_prefix */
T1 T227f10(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(a1)))->id==17)?((T17*)(a1))->a2:((T265*)(a1))->a1));
		R = (T6f1(ac, &t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_CALLBACKS_NULL.on_start_tag_finish */
void T188f7(GE_context* ac, T0* C)
{
}

/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
void T145f15(GE_context* ac, T0* C)
{
	T1 t1;
	t1 = ((T1)(!(((T145*)(C))->a1)));
	if (t1) {
		T145f15p1(ac, C);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
void T145f15p1(GE_context* ac, T0* C)
{
	T141x5892(ac, GE_void(((T145*)(C))->a3));
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag_finish */
void T142f20(GE_context* ac, T0* C)
{
	T141x5892(ac, GE_void(((T142*)(C))->a6));
}

/* XM_NAMESPACE_RESOLVER.on_end_tag */
void T227f33(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T0* t2;
	t1 = ((a2)!=(EIF_VOID));
	if (t1) {
		t1 = (T227f10(ac, C, a2));
	}
	if (t1) {
		t2 = (T299f2(ac, GE_void(((T227*)(C))->a4), a2));
		T227f33p1(ac, C, t2, a2, a3);
	} else {
		t2 = (T299f3(ac, GE_void(((T227*)(C))->a4)));
		T227f33p1(ac, C, t2, a2, a3);
	}
	T299f11(ac, GE_void(((T227*)(C))->a4));
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.pop */
void T299f11(GE_context* ac, T0* C)
{
	T6 t1;
	T1 t2;
	t1 = (((T407*)(GE_void(((T299*)(C))->a1)))->a1);
	t2 = (T6f1(ac, &t1, (T6)(GE_int32(0))));
	if (t2) {
		T407f9(ac, GE_void(((T299*)(C))->a1));
	}
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_last */
void T407f9(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* t2;
	T0* m2 = 0;
	t1 = (((((((T407*)(C))->a1) == ((T6)(GE_int32(1)))))));
	if (t1) {
		T407f12(ac, C);
	} else {
		{
			t1 = (((T407*)(C))->a2?((m1 = ((T407*)(C))->a2, EIF_TRUE)):EIF_FALSE);
			if (t1) {
				t2 = (((T501*)(m1))->a2);
				t1 = (t2?((m2 = t2, EIF_TRUE)):EIF_FALSE);
			}
			if (!(t1)) {
				GE_raise(GE_EX_CHECK);
			}			T407f13(ac, C);
			T407f14(ac, C, m2);
			((T407*)(C))->a1 = ((T6)((((T407*)(C))->a1)-((T6)(GE_int32(1)))));
		}
	}
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].set_last_cell */
void T407f14(GE_context* ac, T0* C, T0* a1)
{
	T501f7(ac, GE_void(a1));
	((T407*)(C))->a2 = a1;
}

/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].forget_right */
void T501f7(GE_context* ac, T0* C)
{
	((T501*)(C))->a3 = EIF_VOID;
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_last_cursors_after */
void T407f13(GE_context* ac, T0* C)
{
	T0* t1;
	T1 t2;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	l1 = ((T407*)(C))->a4;
	l4 = ((T407*)(C))->a2;
	t1 = (((T408*)(GE_void(l1)))->a2);
	t2 = ((t1)==(l4));
	if (t2) {
		T408f12(ac, GE_void(l1));
	}
	l3 = l1;
	l1 = (((T408*)(GE_void(l1)))->a3);
	while (1) {
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			break;
		}
		t1 = (((T408*)(GE_void(l1)))->a2);
		t2 = ((t1)==(l4));
		if (t2) {
			T408f12(ac, GE_void(l1));
			l2 = (((T408*)(GE_void(l1)))->a3);
			T408f13(ac, GE_void(l3), l2);
			T408f13(ac, GE_void(l1), EIF_VOID);
			l1 = l2;
		} else {
			l3 = l1;
			l1 = (((T408*)(GE_void(l1)))->a3);
		}
	}
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_after */
void T408f12(GE_context* ac, T0* C)
{
	((T408*)(C))->a2 = EIF_VOID;
	((T408*)(C))->a1 = EIF_FALSE;
	((T408*)(C))->a5 = EIF_TRUE;
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].wipe_out */
void T407f12(GE_context* ac, T0* C)
{
	T407f15(ac, C);
	((T407*)(C))->a3 = EIF_VOID;
	((T407*)(C))->a2 = EIF_VOID;
	((T407*)(C))->a1 = (T6)(GE_int32(0));
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_all_cursors_after */
void T407f15(GE_context* ac, T0* C)
{
	T1 t1;
	T0* l1 = 0;
	T0* l2 = 0;
	l1 = ((T407*)(C))->a4;
	while (1) {
		t1 = ((l1)==(EIF_VOID));
		if (t1) {
			break;
		}
		T408f12(ac, GE_void(l1));
		l2 = (((T408*)(GE_void(l1)))->a3);
		T408f13(ac, GE_void(l1), EIF_VOID);
		l1 = l2;
	}
}

/* XM_NAMESPACE_RESOLVER.on_end_tag */
void T227f33p1(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3)
{
	T141x5893T0T0T0(ac, GE_void(((T227*)(C))->a1), a1, a2, a3);
}

/* XM_CALLBACKS_NULL.on_end_tag */
void T188f8(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3)
{
}

/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
void T145f16(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	t1 = ((T1)(!(((T145*)(C))->a1)));
	if (t1) {
		T145f16p1(ac, C, a1, a2, a3);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
void T145f16p1(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3)
{
	T141x5893T0T0T0(ac, GE_void(((T145*)(C))->a3), a1, a2, a3);
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_end_tag */
void T142f21(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T0* m1 = 0;
	T0* t2;
	T0* m2 = 0;
	{
		t1 = (((T142*)(C))->a4?((m1 = ((T142*)(C))->a4, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		t2 = (((T144*)(m1))->a1);
		t1 = (t2?((m2 = t2, EIF_TRUE)):EIF_FALSE);
		t1 = ((T1)(!(t1)));
		if (!(t1)) {
			t1 = (((((T0*)(m2))->id==143)?T143f8(ac, m2):T144f16(ac, m2)));
		}
		if (t1) {
			((T142*)(C))->a4 = EIF_VOID;
		} else {
			((T142*)(C))->a4 = (T144f15(ac, m1));
		}
	}
}

/* XM_ELEMENT.parent_element */
T0* T144f15(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m2 = 0;
	T0* R = 0;
	{
		t1 = T144f15ot1(((T144*)(C))->a1, &m2);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		R = m2;
	}
	return R;
}

T1 T144f15ot1(T0* a1, T0** a2)
{
	if ((a1)==EIF_VOID) {
		return EIF_FALSE;
	} else {
		switch (((T0*)(a1))->id) {
		case 144:
			*a2 = a1;
			return EIF_TRUE;
		default:
			return EIF_FALSE;
		}
	}
}

/* XM_ELEMENT.is_root_node */
T1 T144f16(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = ((((T144*)(C))->a1)==(EIF_VOID));
	return R;
}

/* XM_DOCUMENT.is_root_node */
T1 T143f8(GE_context* ac, T0* C)
{
	T0* t1;
	T1 R = 0;
	t1 = (T143f9(ac, C));
	R = (EIF_TRUE);
	return R;
}

/* XM_DOCUMENT.parent */
T0* T143f9(GE_context* ac, T0* C)
{
	T0* R = 0;
	return R;
}

/* XM_NAMESPACE_RESOLVER.on_error */
void T227f36(GE_context* ac, T0* C, T0* a1)
{
	T141x5887T0(ac, GE_void(((T227*)(C))->a1), a1);
}

/* XM_CALLBACKS_NULL.on_error */
void T188f11(GE_context* ac, T0* C, T0* a1)
{
}

/* XM_STOP_ON_ERROR_FILTER.on_error */
void T145f17(GE_context* ac, T0* C, T0* a1)
{
	((T145*)(C))->a1 = EIF_TRUE;
	((T145*)(C))->a2 = a1;
	T145f17p1(ac, C, a1);
}

/* XM_STOP_ON_ERROR_FILTER.on_error */
void T145f17p1(GE_context* ac, T0* C, T0* a1)
{
	T141x5887T0(ac, GE_void(((T145*)(C))->a3), a1);
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_error */
void T142f22(GE_context* ac, T0* C, T0* a1)
{
	T141x5887T0(ac, GE_void(((T142*)(C))->a6), a1);
}

/* XM_NAMESPACE_RESOLVER.on_attribute */
void T227f35(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 t1;
	t1 = (T227f10(ac, C, a2));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t1 = (T227f9(ac, C, a3));
	}
	if (t1) {
		T299f13(ac, GE_void(((T227*)(C))->a4), a4);
		if (((T227*)(C))->a5) {
			T227f40(ac, C, a2, a3, a4);
		}
	} else {
		t1 = ((a2)!=(EIF_VOID));
		if (t1) {
			t1 = (T227f9(ac, C, a2));
		}
		if (t1) {
			t1 = (T299f4(ac, GE_void(((T227*)(C))->a4), a2));
			if (t1) {
				T227f36(ac, C, ge1444ov8031);
			} else {
				T299f14(ac, GE_void(((T227*)(C))->a4), a4, a3);
			}
			if (((T227*)(C))->a5) {
				T227f40(ac, C, a2, a3, a4);
			}
		} else {
			T227f40(ac, C, a2, a3, a4);
		}
	}
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.add */
void T299f14(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T0* t1;
	t1 = (T407f5(ac, GE_void(((T299*)(C))->a1)));
	T120f54(ac, GE_void(t1), a1, a2);
}

/* DS_HASH_TABLE [STRING_8, STRING_8].force_new */
void T120f54(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T6 t2;
	T6 t3;
	T6 l1 = 0;
	T6 l2 = 0;
	T120f50(ac, C);
	t1 = (((((((T120*)(C))->a18) == (((T120*)(C))->a4)))));
	if (t1) {
		t2 = ((T6)((((T120*)(C))->a18)+((T6)(GE_int32(1)))));
		t2 = (T120f27(ac, C, t2));
		T120f59(ac, C, t2);
	}
	l1 = ((T120*)(C))->a7;
	t1 = (((((l1) == ((T6)(GE_int32(-1)))))));
	if (t1) {
		((T120*)(C))->a6 = ((T6)((((T120*)(C))->a6)+((T6)(GE_int32(1)))));
		l1 = ((T120*)(C))->a6;
	} else {
		t2 = (T6)(GE_int32(-3));
		t3 = (T120f33(ac, C, l1));
		((T120*)(C))->a7 = ((T6)((t2)-(t3)));
	}
	l2 = (T120f28(ac, C, a2));
	t2 = (T120f30(ac, C, l2));
	T120f60(ac, C, t2, l1);
	T120f61(ac, C, l1, l2);
	T120f58(ac, C, a1, l1);
	T120f62(ac, C, a2, l1);
	((T120*)(C))->a18 = ((T6)((((T120*)(C))->a18)+((T6)(GE_int32(1)))));
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].last */
T0* T407f5(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* R = 0;
	{
		t1 = (((T407*)(C))->a2?((m1 = ((T407*)(C))->a2, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		R = (((T501*)(m1))->a1);
	}
	return R;
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.shallow_has */
T1 T299f4(GE_context* ac, T0* C, T0* a1)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T1 R = 0;
	t1 = (((T407*)(GE_void(((T299*)(C))->a1)))->a1);
	t2 = (T6f1(ac, &t1, (T6)(GE_int32(0))));
	if (t2) {
		t3 = (T407f5(ac, GE_void(((T299*)(C))->a1)));
		R = (T120f21(ac, GE_void(t3), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_NAMESPACE_RESOLVER.attributes_force */
void T227f40(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3)
{
	T301f7(ac, GE_void(((T227*)(C))->a6), a1);
	T301f7(ac, GE_void(((T227*)(C))->a7), a2);
	T301f7(ac, GE_void(((T227*)(C))->a8), a3);
}

/* DS_LINKED_QUEUE [STRING_8].force */
void T301f7(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T0* l1 = 0;
	l1 = T409c3(ac, a1);
	t1 = (((T301*)(C))->a3?((m1 = ((T301*)(C))->a3, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		T409f4(ac, m1, l1);
		((T301*)(C))->a3 = l1;
		((T301*)(C))->a2 = ((T6)((((T301*)(C))->a2)+((T6)(GE_int32(1)))));
	} else {
		((T301*)(C))->a1 = l1;
		((T301*)(C))->a3 = l1;
		((T301*)(C))->a2 = (T6)(GE_int32(1));
	}
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.add_default */
void T299f13(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	t1 = (T299f7(ac, C));
	T299f14(ac, C, a1, t1);
}

/* XM_CALLBACKS_NULL.on_attribute */
void T188f10(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
}

/* XM_STOP_ON_ERROR_FILTER.on_attribute */
void T145f18(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 t1;
	t1 = ((T1)(!(((T145*)(C))->a1)));
	if (t1) {
		T145f18p1(ac, C, a1, a2, a3, a4);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_attribute */
void T145f18p1(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T141x5891T0T0T0T0(ac, GE_void(((T145*)(C))->a3), a1, a2, a3, a4);
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_attribute */
void T142f23(GE_context* ac, T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 t1;
	T0* m1 = 0;
	T0* m2 = 0;
	T0* t2;
	T0* l1 = 0;
	{
		t1 = (a1?((m1 = a1, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		t1 = (((T142*)(C))->a4?((m2 = ((T142*)(C))->a4, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		t2 = (T142f8(ac, C, m1, a2));
		l1 = T257c5(ac, a3, t2, a4, m2);
		T142f24(ac, C, l1);
	}
}

/* XM_ATTRIBUTE.make_last */
T0* T257c5(GE_context* ac, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T0* C;
	C = GE_new257(EIF_TRUE);
	((T257*)(C))->a1 = a1;
	((T257*)(C))->a2 = a2;
	((T257*)(C))->a3 = a3;
	((T257*)(C))->a4 = a4;
	T144f28(ac, GE_void(a4), C);
	return C;
}

/* XM_NAMESPACE_RESOLVER.on_xml_declaration */
void T227f44(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3)
{
	T141x5886T0T0T1(ac, GE_void(((T227*)(C))->a1), a1, a2, a3);
}

/* XM_CALLBACKS_NULL.on_xml_declaration */
void T188f12(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3)
{
}

/* XM_STOP_ON_ERROR_FILTER.on_xml_declaration */
void T145f19(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3)
{
	T141x5886T0T0T1(ac, GE_void(((T145*)(C))->a3), a1, a2, a3);
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_xml_declaration */
void T142f25(GE_context* ac, T0* C, T0* a1, T0* a2, T1 a3)
{
	T141x5886T0T0T1(ac, GE_void(((T142*)(C))->a6), a1, a2, a3);
}

/* XM_NAMESPACE_RESOLVER.set_next */
void T227f41(GE_context* ac, T0* C, T0* a1)
{
	((T227*)(C))->a1 = a1;
}

/* XM_STOP_ON_ERROR_FILTER.set_next */
void T145f8(GE_context* ac, T0* C, T0* a1)
{
	((T145*)(C))->a3 = a1;
}

/* XM_CALLBACKS_TO_TREE_FILTER.set_next */
void T142f13(GE_context* ac, T0* C, T0* a1)
{
	((T142*)(C))->a6 = a1;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_start */
void T120f55(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 l3 = 0;
	t1 = (T120f34(ac, C));
	if (t1) {
		T105f13(ac, a1);
	} else {
		l3 = (T120f35(ac, C, a1));
		l1 = (T6)(GE_int32(0));
		l2 = ((T120*)(C))->a6;
		while (1) {
			t1 = (T6f1(ac, (&l1), l2));
			if (!(t1)) {
				t2 = (T120f33(ac, C, l1));
				t1 = (T6f1(ac, &t2, (T6)(GE_int32(-2))));
			}
			if (t1) {
				break;
			}
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(ac, (&l1), l2));
		if (t1) {
			T105f13(ac, a1);
			t1 = ((T1)(!(l3)));
			if (t1) {
				T120f63(ac, C, a1);
			}
		} else {
			T105f14(ac, a1, l1);
			if (l3) {
				T120f64(ac, C, a1);
			}
		}
	}
}

/* DS_HASH_TABLE [STRING_8, STRING_8].add_traversing_cursor */
void T120f64(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	t1 = ((a1)!=(((T120*)(C))->a16));
	if (t1) {
		t2 = (((T105*)(GE_void(((T120*)(C))->a16)))->a3);
		T105f15(ac, a1, t2);
		T105f15(ac, GE_void(((T120*)(C))->a16), a1);
	}
}

/* DS_HASH_TABLE [STRING_8, STRING_8].remove_traversing_cursor */
void T120f63(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* l1 = 0;
	T0* l2 = 0;
	t1 = ((a1)!=(((T120*)(C))->a16));
	if (t1) {
		l2 = ((T120*)(C))->a16;
		l1 = (((T105*)(GE_void(l2)))->a3);
		while (1) {
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
			if (t1) {
				break;
			}
			l2 = l1;
			l1 = (((T105*)(GE_void(l1)))->a3);
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T105*)(a1))->a3);
			T105f15(ac, GE_void(l2), t2);
			T105f15(ac, a1, EIF_VOID);
		}
	}
}

/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_off */
T1 T120f35(GE_context* ac, T0* C, T0* a1)
{
	T1 R = 0;
	R = (T105f9(ac, a1));
	return R;
}

/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].off */
T1 T105f9(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = ((T1)((((T105*)(C))->a2)<((T6)(GE_int32(0)))));
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].is_empty */
T1 T120f34(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (((((((T120*)(C))->a18) == ((T6)(GE_int32(0)))))));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.cursor_start */
void T41f69(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 l3 = 0;
	t1 = (T41f39(ac, C));
	if (t1) {
		T105f13(ac, GE_void(a1));
	} else {
		l3 = (T41f40(ac, C, a1));
		l1 = (T6)(GE_int32(0));
		l2 = ((T41*)(C))->a6;
		while (1) {
			t1 = (T6f1(ac, (&l1), l2));
			if (!(t1)) {
				t2 = (T41f26(ac, C, l1));
				t1 = (T6f1(ac, &t2, (T6)(GE_int32(-2))));
			}
			if (t1) {
				break;
			}
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(ac, (&l1), l2));
		if (t1) {
			T105f13(ac, GE_void(a1));
			t1 = ((T1)(!(l3)));
			if (t1) {
				T41f72(ac, C, a1);
			}
		} else {
			T105f14(ac, GE_void(a1), l1);
			if (l3) {
				T41f73(ac, C, a1);
			}
		}
	}
}

/* GEANT_ARGUMENT_VARIABLES.add_traversing_cursor */
void T41f73(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	t1 = ((a1)!=(((T41*)(C))->a19));
	if (t1) {
		t2 = (((T105*)(GE_void(((T41*)(C))->a19)))->a3);
		T105f15(ac, GE_void(a1), t2);
		T105f15(ac, GE_void(((T41*)(C))->a19), a1);
	}
}

/* GEANT_ARGUMENT_VARIABLES.remove_traversing_cursor */
void T41f72(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* l1 = 0;
	T0* l2 = 0;
	t1 = ((a1)!=(((T41*)(C))->a19));
	if (t1) {
		l2 = ((T41*)(C))->a19;
		l1 = (((T105*)(GE_void(l2)))->a3);
		while (1) {
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
			if (t1) {
				break;
			}
			l2 = l1;
			l1 = (((T105*)(GE_void(l1)))->a3);
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T105*)(GE_void(a1)))->a3);
			T105f15(ac, GE_void(l2), t2);
			T105f15(ac, GE_void(a1), EIF_VOID);
		}
	}
}

/* GEANT_ARGUMENT_VARIABLES.cursor_off */
T1 T41f40(GE_context* ac, T0* C, T0* a1)
{
	T1 R = 0;
	R = (T105f9(ac, GE_void(a1)));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.is_empty */
T1 T41f39(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (((((((T41*)(C))->a2) == ((T6)(GE_int32(0)))))));
	return R;
}

/* GEANT_VARIABLES.cursor_start */
void T36f71(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 l3 = 0;
	t1 = (T36f39(ac, C));
	if (t1) {
		T105f13(ac, GE_void(a1));
	} else {
		l3 = (T36f40(ac, C, a1));
		l1 = (T6)(GE_int32(0));
		l2 = ((T36*)(C))->a6;
		while (1) {
			t1 = (T6f1(ac, (&l1), l2));
			if (!(t1)) {
				t2 = (T36f26(ac, C, l1));
				t1 = (T6f1(ac, &t2, (T6)(GE_int32(-2))));
			}
			if (t1) {
				break;
			}
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(ac, (&l1), l2));
		if (t1) {
			T105f13(ac, GE_void(a1));
			t1 = ((T1)(!(l3)));
			if (t1) {
				T36f73(ac, C, a1);
			}
		} else {
			T105f14(ac, GE_void(a1), l1);
			if (l3) {
				T36f74(ac, C, a1);
			}
		}
	}
}

/* GEANT_VARIABLES.add_traversing_cursor */
void T36f74(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	t1 = ((a1)!=(((T36*)(C))->a19));
	if (t1) {
		t2 = (((T105*)(GE_void(((T36*)(C))->a19)))->a3);
		T105f15(ac, GE_void(a1), t2);
		T105f15(ac, GE_void(((T36*)(C))->a19), a1);
	}
}

/* GEANT_VARIABLES.remove_traversing_cursor */
void T36f73(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* l1 = 0;
	T0* l2 = 0;
	t1 = ((a1)!=(((T36*)(C))->a19));
	if (t1) {
		l2 = ((T36*)(C))->a19;
		l1 = (((T105*)(GE_void(l2)))->a3);
		while (1) {
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
			if (t1) {
				break;
			}
			l2 = l1;
			l1 = (((T105*)(GE_void(l1)))->a3);
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T105*)(GE_void(a1)))->a3);
			T105f15(ac, GE_void(l2), t2);
			T105f15(ac, GE_void(a1), EIF_VOID);
		}
	}
}

/* GEANT_VARIABLES.cursor_off */
T1 T36f40(GE_context* ac, T0* C, T0* a1)
{
	T1 R = 0;
	R = (T105f9(ac, GE_void(a1)));
	return R;
}

/* GEANT_VARIABLES.is_empty */
T1 T36f39(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (((((((T36*)(C))->a2) == ((T6)(GE_int32(0)))))));
	return R;
}

/* GEANT_PROJECT_VARIABLES.cursor_start */
void T32f82(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 l3 = 0;
	t1 = (T32f51(ac, C));
	if (t1) {
		T105f13(ac, GE_void(a1));
	} else {
		l3 = (T32f52(ac, C, a1));
		l1 = (T6)(GE_int32(0));
		l2 = ((T32*)(C))->a8;
		while (1) {
			t1 = (T6f1(ac, (&l1), l2));
			if (!(t1)) {
				t2 = (T32f21(ac, C, l1));
				t1 = (T6f1(ac, &t2, (T6)(GE_int32(-2))));
			}
			if (t1) {
				break;
			}
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(ac, (&l1), l2));
		if (t1) {
			T105f13(ac, GE_void(a1));
			t1 = ((T1)(!(l3)));
			if (t1) {
				T32f84(ac, C, a1);
			}
		} else {
			T105f14(ac, GE_void(a1), l1);
			if (l3) {
				T32f85(ac, C, a1);
			}
		}
	}
}

/* GEANT_PROJECT_VARIABLES.add_traversing_cursor */
void T32f85(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	t1 = ((a1)!=(((T32*)(C))->a19));
	if (t1) {
		t2 = (((T105*)(GE_void(((T32*)(C))->a19)))->a3);
		T105f15(ac, GE_void(a1), t2);
		T105f15(ac, GE_void(((T32*)(C))->a19), a1);
	}
}

/* GEANT_PROJECT_VARIABLES.remove_traversing_cursor */
void T32f84(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* l1 = 0;
	T0* l2 = 0;
	t1 = ((a1)!=(((T32*)(C))->a19));
	if (t1) {
		l2 = ((T32*)(C))->a19;
		l1 = (((T105*)(GE_void(l2)))->a3);
		while (1) {
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
			if (t1) {
				break;
			}
			l2 = l1;
			l1 = (((T105*)(GE_void(l1)))->a3);
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T105*)(GE_void(a1)))->a3);
			T105f15(ac, GE_void(l2), t2);
			T105f15(ac, GE_void(a1), EIF_VOID);
		}
	}
}

/* GEANT_PROJECT_VARIABLES.cursor_off */
T1 T32f52(GE_context* ac, T0* C, T0* a1)
{
	T1 R = 0;
	R = (T105f9(ac, GE_void(a1)));
	return R;
}

/* GEANT_PROJECT_VARIABLES.is_empty */
T1 T32f51(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (((((((T32*)(C))->a4) == ((T6)(GE_int32(0)))))));
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_forth */
void T120f56(GE_context* ac, T0* C, T0* a1)
{
	T6 t1;
	T1 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 l3 = 0;
	T6 l4 = 0;
	l4 = (((T105*)(a1))->a2);
	t1 = ((T6)(GE_int32(-2)));
	t2 = (((((l4) == (t1)))));
	if (t2) {
		l3 = EIF_TRUE;
		l1 = (T6)(GE_int32(0));
	} else {
		l3 = EIF_FALSE;
		l1 = ((T6)((l4)+((T6)(GE_int32(1)))));
	}
	l2 = ((T120*)(C))->a6;
	while (1) {
		t2 = (T6f1(ac, (&l1), l2));
		if (!(t2)) {
			t1 = (T120f33(ac, C, l1));
			t2 = (T6f1(ac, &t1, (T6)(GE_int32(-2))));
		}
		if (t2) {
			break;
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	t2 = (T6f1(ac, (&l1), l2));
	if (t2) {
		T105f13(ac, a1);
		t2 = ((T1)(!(l3)));
		if (t2) {
			T120f63(ac, C, a1);
		}
	} else {
		T105f14(ac, a1, l1);
		if (l3) {
			T120f64(ac, C, a1);
		}
	}
}

/* GEANT_ARGUMENT_VARIABLES.cursor_forth */
void T41f70(GE_context* ac, T0* C, T0* a1)
{
	T6 t1;
	T1 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 l3 = 0;
	T6 l4 = 0;
	l4 = (((T105*)(GE_void(a1)))->a2);
	t1 = ((T6)(GE_int32(-2)));
	t2 = (((((l4) == (t1)))));
	if (t2) {
		l3 = EIF_TRUE;
		l1 = (T6)(GE_int32(0));
	} else {
		l3 = EIF_FALSE;
		l1 = ((T6)((l4)+((T6)(GE_int32(1)))));
	}
	l2 = ((T41*)(C))->a6;
	while (1) {
		t2 = (T6f1(ac, (&l1), l2));
		if (!(t2)) {
			t1 = (T41f26(ac, C, l1));
			t2 = (T6f1(ac, &t1, (T6)(GE_int32(-2))));
		}
		if (t2) {
			break;
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	t2 = (T6f1(ac, (&l1), l2));
	if (t2) {
		T105f13(ac, GE_void(a1));
		t2 = ((T1)(!(l3)));
		if (t2) {
			T41f72(ac, C, a1);
		}
	} else {
		T105f14(ac, GE_void(a1), l1);
		if (l3) {
			T41f73(ac, C, a1);
		}
	}
}

/* GEANT_VARIABLES.cursor_forth */
void T36f72(GE_context* ac, T0* C, T0* a1)
{
	T6 t1;
	T1 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 l3 = 0;
	T6 l4 = 0;
	l4 = (((T105*)(GE_void(a1)))->a2);
	t1 = ((T6)(GE_int32(-2)));
	t2 = (((((l4) == (t1)))));
	if (t2) {
		l3 = EIF_TRUE;
		l1 = (T6)(GE_int32(0));
	} else {
		l3 = EIF_FALSE;
		l1 = ((T6)((l4)+((T6)(GE_int32(1)))));
	}
	l2 = ((T36*)(C))->a6;
	while (1) {
		t2 = (T6f1(ac, (&l1), l2));
		if (!(t2)) {
			t1 = (T36f26(ac, C, l1));
			t2 = (T6f1(ac, &t1, (T6)(GE_int32(-2))));
		}
		if (t2) {
			break;
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	t2 = (T6f1(ac, (&l1), l2));
	if (t2) {
		T105f13(ac, GE_void(a1));
		t2 = ((T1)(!(l3)));
		if (t2) {
			T36f73(ac, C, a1);
		}
	} else {
		T105f14(ac, GE_void(a1), l1);
		if (l3) {
			T36f74(ac, C, a1);
		}
	}
}

/* GEANT_PROJECT_VARIABLES.cursor_forth */
void T32f83(GE_context* ac, T0* C, T0* a1)
{
	T6 t1;
	T1 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 l3 = 0;
	T6 l4 = 0;
	l4 = (((T105*)(GE_void(a1)))->a2);
	t1 = ((T6)(GE_int32(-2)));
	t2 = (((((l4) == (t1)))));
	if (t2) {
		l3 = EIF_TRUE;
		l1 = (T6)(GE_int32(0));
	} else {
		l3 = EIF_FALSE;
		l1 = ((T6)((l4)+((T6)(GE_int32(1)))));
	}
	l2 = ((T32*)(C))->a8;
	while (1) {
		t2 = (T6f1(ac, (&l1), l2));
		if (!(t2)) {
			t1 = (T32f21(ac, C, l1));
			t2 = (T6f1(ac, &t1, (T6)(GE_int32(-2))));
		}
		if (t2) {
			break;
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	t2 = (T6f1(ac, (&l1), l2));
	if (t2) {
		T105f13(ac, GE_void(a1));
		t2 = ((T1)(!(l3)));
		if (t2) {
			T32f84(ac, C, a1);
		}
	} else {
		T105f14(ac, GE_void(a1), l1);
		if (l3) {
			T32f85(ac, C, a1);
		}
	}
}

/* AP_DISPLAY_HELP_FLAG.reset */
void T112f40(GE_context* ac, T0* C)
{
	((T112*)(C))->a5 = (T6)(GE_int32(0));
}

/* AP_STRING_OPTION.reset */
void T44f29(GE_context* ac, T0* C)
{
	((T44*)(C))->a1 = T110c22(ac, (T6)(GE_int32(1)));
}

/* AP_FLAG.reset */
void T42f22(GE_context* ac, T0* C)
{
	((T42*)(C))->a1 = (T6)(GE_int32(0));
}

/* AP_DISPLAY_HELP_FLAG.record_occurrence */
void T112f41(GE_context* ac, T0* C, T0* a1)
{
	T112f42(ac, C, a1);
}

/* AP_DISPLAY_HELP_FLAG.display_help */
void T112f42(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	T0* t2;
	t1 = (((T45*)(a1))->a3);
	t2 = (T112f14(ac, C, a1));
	T52f11(ac, GE_void(t1), t2);
	t1 = (T112f15(ac, C));
	T55f2(ac, GE_void(t1), (T6)(GE_int32(0)));
}

/* AP_DISPLAY_HELP_FLAG.exceptions */
T0* T112f15(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge204os1975) {
		return ge204ov1975;
	} else {
		ge204os1975 = '\1';
		ge204ov1975 = R;
	}
	R = T55c1(ac);
	ge204ov1975 = R;
	return R;
}

/* AP_ERROR_HANDLER.report_info_message */
void T52f11(GE_context* ac, T0* C, T0* a1)
{
	T108f6(ac, GE_void(((T52*)(C))->a4), a1);
}

/* AP_DISPLAY_HELP_FLAG.full_help_text */
T0* T112f14(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T0* t3;
	T6 t4;
	T0* R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T1 l5 = 0;
	l3 = T317c3(ac);
	l4 = T318c2(ac, l3);
	R = (T112f16(ac, C, a1));
	t1 = (((T45*)(a1))->a6);
	t2 = (T17f30(ac, GE_void(t1)));
	t2 = ((T1)(!(t2)));
	if (t2) {
		T17f42(ac, GE_void(R), ge104ov5114);
		t1 = (T112f18(ac, C));
		T320f10(ac, GE_void(t1), (T6)(GE_int32(0)));
		t1 = (T112f18(ac, C));
		t3 = (((T45*)(a1))->a6);
		t1 = (T320f5(ac, GE_void(t1), t3));
		T17f42(ac, GE_void(R), t1);
		T17f42(ac, GE_void(R), ge104ov5115);
	}
	T17f42(ac, GE_void(R), ge104ov5116);
	l2 = (T45f16(ac, a1));
	T318f3(ac, GE_void(l4), l2);
	l1 = (T6)(GE_int32(0));
	T113f19(ac, GE_void(l2));
	while (1) {
		t2 = (T113f9(ac, GE_void(l2)));
		if (t2) {
			break;
		}
		t1 = (T113f7(ac, GE_void(l2)));
		t2 = (T49x3082(ac, GE_void(t1)));
		t2 = ((T1)(!(t2)));
		if (t2) {
			t1 = (T113f7(ac, GE_void(l2)));
			t1 = (T49x3075(ac, GE_void(t1)));
			t4 = (((T17*)(GE_void(t1)))->a2);
			l1 = (T6f5(ac, &t4, l1));
		}
		T113f20(ac, GE_void(l2));
	}
	T113f19(ac, GE_void(l2));
	while (1) {
		t2 = (T113f9(ac, GE_void(l2)));
		if (t2) {
			break;
		}
		t1 = (T113f7(ac, GE_void(l2)));
		t2 = (T49x3082(ac, GE_void(t1)));
		t2 = ((T1)(!(t2)));
		if (t2) {
			if (l5) {
				T17f37(ac, GE_void(R), (T2)('\n'));
			}
			t1 = (T113f7(ac, GE_void(l2)));
			t4 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t1 = (T112f23(ac, C, t1, t4));
			T17f42(ac, GE_void(R), t1);
			l5 = EIF_TRUE;
		}
		T113f20(ac, GE_void(l2));
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.option_help_text */
T0* T112f23(GE_context* ac, T0* C, T0* a1, T6 a2)
{
	T0* t1;
	T6 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	T0* l1 = 0;
	t1 = (T49x3075(ac, GE_void(a1)));
	t2 = (((T17*)(GE_void(t1)))->a2);
	t2 = ((T6)((a2)-(t2)));
	l1 = T17c57(ac, (T2)(' '), t2);
	t1 = (T112f18(ac, C));
	T320f10(ac, GE_void(t1), a2);
	t1 = (T112f18(ac, C));
	t3 = (T49x3075(ac, GE_void(a1)));
	t3 = (T17f9(ac, GE_void(t3), l1));
	t4 = (T49x3071(ac, GE_void(a1)));
	t3 = (T17f9(ac, GE_void(t3), t4));
	R = (T320f5(ac, GE_void(t1), t3));
	return R;
}

/* DS_QUICK_SORTER [AP_OPTION].sort */
void T318f3(GE_context* ac, T0* C, T0* a1)
{
	T318f4(ac, C, a1, ((T318*)(C))->a1);
}

/* DS_QUICK_SORTER [AP_OPTION].sort_with_comparator */
void T318f4(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T6 t2;
	t1 = (T113f15(ac, GE_void(a1)));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (((T113*)(GE_void(a1)))->a2);
		T318f5(ac, C, a1, a2, (T6)(GE_int32(1)), t2);
	}
}

/* DS_QUICK_SORTER [AP_OPTION].subsort_with_comparator */
void T318f5(GE_context* ac, T0* C, T0* a1, T0* a2, T6 a3, T6 a4)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T1 t4;
	T6 l1 = 0;
	T6 l2 = 0;
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
	t1 = ((T6)((a4)-(a3)));
	l5 = ((T6)((t1)+((T6)(GE_int32(1)))));
	while (1) {
		t2 = (((((l5) == ((T6)(GE_int32(0)))))));
		if (t2) {
			break;
		}
		l5 = ((T6)((l5)/((T6)(GE_int32(2)))));
		l4 = ((T6)((l4)+((T6)(GE_int32(1)))));
	}
	l4 = ((T6)((l4)+((T6)(GE_int32(10)))));
	l11 = T263c9(ac, (T6)(GE_int32(0)), (T6)(GE_int32(1)), l4);
	l12 = T263c9(ac, (T6)(GE_int32(0)), (T6)(GE_int32(1)), l4);
	T263f11(ac, GE_void(l11), a3, (T6)(GE_int32(1)));
	T263f11(ac, GE_void(l12), a4, (T6)(GE_int32(1)));
	l4 = (T6)(GE_int32(1));
	while (1) {
		t2 = (((((l4) == ((T6)(GE_int32(0)))))));
		if (t2) {
			break;
		}
		l9 = (T263f4(ac, GE_void(l11), l4));
		l10 = (T263f4(ac, GE_void(l12), l4));
		l4 = ((T6)((l4)-((T6)(GE_int32(1)))));
		l1 = l9;
		l2 = l10;
		t2 = ((T1)((l1)<(l2)));
		if (t2) {
			t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t2 = (((((l2) == (t1)))));
			if (t2) {
				l7 = (T113f16(ac, GE_void(a1), l1));
				l8 = (T113f16(ac, GE_void(a1), l2));
				t2 = (T317f1(ac, GE_void(a2), l8, l7));
				if (t2) {
					T113f27(ac, GE_void(a1), l7, l2);
					T113f27(ac, GE_void(a1), l8, l1);
				}
			} else {
				t1 = ((T6)((l1)+(l2)));
				l3 = ((T6)((t1)/((T6)(GE_int32(2)))));
				l6 = (T113f16(ac, GE_void(a1), l3));
				t3 = (T113f16(ac, GE_void(a1), l10));
				T113f27(ac, GE_void(a1), t3, l3);
				while (1) {
					t2 = (T6f8(ac, (&l1), l2));
					if (t2) {
						break;
					}
					while (1) {
						t2 = (T6f8(ac, (&l1), l2));
						if (!(t2)) {
							t3 = (T113f16(ac, GE_void(a1), l1));
							t4 = (T317f1(ac, GE_void(a2), t3, l6));
							t2 = ((T1)(!(t4)));
						}
						if (t2) {
							break;
						}
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					}
					l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
					while (1) {
						t2 = (T6f10(ac, (&l2), l1));
						if (!(t2)) {
							t3 = (T113f16(ac, GE_void(a1), l2));
							t4 = (T317f1(ac, GE_void(a2), l6, t3));
							t2 = ((T1)(!(t4)));
						}
						if (t2) {
							break;
						}
						l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
					}
					t2 = ((T1)((l1)<(l2)));
					if (t2) {
						T113f28(ac, GE_void(a1), l1, l2);
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					}
				}
				t3 = (T113f16(ac, GE_void(a1), l1));
				T113f27(ac, GE_void(a1), t3, l10);
				T113f27(ac, GE_void(a1), l6, l1);
				t1 = ((T6)((l1)-((T6)(GE_int32(1)))));
				t2 = (T6f1(ac, &t1, l9));
				if (t2) {
					l4 = ((T6)((l4)+((T6)(GE_int32(1)))));
					T263f12(ac, GE_void(l11), l9, l4);
					t1 = ((T6)((l1)-((T6)(GE_int32(1)))));
					T263f12(ac, GE_void(l12), t1, l4);
				}
				t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				t2 = ((T1)((t1)<(l10)));
				if (t2) {
					l4 = ((T6)((l4)+((T6)(GE_int32(1)))));
					t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					T263f12(ac, GE_void(l11), t1, l4);
					T263f12(ac, GE_void(l12), l10, l4);
				}
			}
		}
	}
}

/* ARRAY [INTEGER_32].force */
void T263f12(GE_context* ac, T0* C, T6 a1, T6 a2)
{
	T6 t1;
	T1 t2;
	T6 t3;
	T0* t4;
	T6 t5;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T6 l6 = 0;
	T1 l7 = 0;
	l3 = (T6f11(ac, &(((T263*)(C))->a2), a2));
	l4 = (T6f5(ac, &(((T263*)(C))->a3), a2));
	t1 = ((T6)((l4)-(l3)));
	l2 = ((T6)((t1)+((T6)(GE_int32(1)))));
	t1 = ((T6)((((T263*)(C))->a3)+((T6)(GE_int32(1)))));
	t2 = (((((a2) == (t1)))));
	if (!(t2)) {
		t1 = ((T6)((((T263*)(C))->a2)-((T6)(GE_int32(1)))));
		l7 = (((((a2) == (t1)))));
	} else {
		l7 = EIF_TRUE;
	}
	t2 = (T263f5(ac, C));
	if (t2) {
		t1 = (T263f6(ac, C));
		t1 = (T6f5(ac, (&l2), t1));
		T263f14(ac, C, t1);
		t2 = ((T1)(!(l7)));
		if (t2) {
			t1 = ((T6)0);
			t3 = ((T6)((l2)-((T6)(GE_int32(2)))));
			T95f11(ac, GE_void(((T263*)(C))->a1), t1, (T6)(GE_int32(0)), t3);
		}
		T95f12(ac, GE_void(((T263*)(C))->a1), a1);
	} else {
		l1 = (((T95*)(GE_void(((T263*)(C))->a1)))->a2);
		t2 = (T6f1(ac, (&l2), l1));
		if (t2) {
			t1 = (T263f6(ac, C));
			t1 = ((T6)((l1)+(t1)));
			t1 = (T6f5(ac, (&l2), t1));
			t4 = (T95f5(ac, GE_void(((T263*)(C))->a1), t1));
			T263f15(ac, C, t4);
		}
		t2 = ((T1)((l3)<(((T263*)(C))->a2)));
		if (t2) {
			l6 = ((T6)((((T263*)(C))->a2)-(l3)));
			l5 = (T263f7(ac, C));
			t2 = ((T1)(!(l7)));
			if (t2) {
				t2 = (T6f1(ac, (&l6), l5));
			}
			if (t2) {
				t1 = ((T6)0);
				t3 = ((T6)((l6)-((T6)(GE_int32(1)))));
				T95f11(ac, GE_void(((T263*)(C))->a1), t1, l5, t3);
			}
			T95f13(ac, GE_void(((T263*)(C))->a1), (T6)(GE_int32(0)), l6, l5);
			t2 = ((T1)(!(l7)));
			if (t2) {
				t1 = ((T6)0);
				t3 = ((T6)((l6)-((T6)(GE_int32(1)))));
				T95f11(ac, GE_void(((T263*)(C))->a1), t1, (T6)(GE_int32(1)), t3);
			}
			((T95*)(GE_void(((T263*)(C))->a1)))->z2[(T6)(GE_int32(0))] = (a1);
		} else {
			t1 = (((T95*)(GE_void(((T263*)(C))->a1)))->a1);
			t2 = (T6f1(ac, (&l2), t1));
			if (t2) {
				t2 = ((T1)(!(l7)));
				if (t2) {
					t1 = ((T6)0);
					t3 = (((T95*)(GE_void(((T263*)(C))->a1)))->a1);
					t5 = ((T6)((l2)-((T6)(GE_int32(2)))));
					T95f11(ac, GE_void(((T263*)(C))->a1), t1, t3, t5);
				}
				T95f12(ac, GE_void(((T263*)(C))->a1), a1);
			} else {
				t1 = ((T6)((a2)-(((T263*)(C))->a2)));
				((T95*)(GE_void(((T263*)(C))->a1)))->z2[t1] = (a1);
			}
		}
	}
	((T263*)(C))->a2 = l3;
	((T263*)(C))->a3 = l4;
}

/* ARRAY [INTEGER_32].capacity */
T6 T263f7(GE_context* ac, T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((((T263*)(C))->a3)-(((T263*)(C))->a2)));
	R = ((T6)((t1)+((T6)(GE_int32(1)))));
	return R;
}

/* ARRAY [INTEGER_32].set_area */
void T263f15(GE_context* ac, T0* C, T0* a1)
{
	((T263*)(C))->a1 = a1;
}

/* ARRAY [INTEGER_32].make_empty_area */
void T263f14(GE_context* ac, T0* C, T6 a1)
{
	((T263*)(C))->a1 = T95c7(ac, a1);
}

/* ARRAY [INTEGER_32].additional_space */
T6 T263f6(GE_context* ac, T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = (T263f7(ac, C));
	t1 = ((T6)((t1)/((T6)(GE_int32(2)))));
	R = (T6f5(ac, &t1, (T6)(GE_int32(5))));
	return R;
}

/* ARRAY [INTEGER_32].empty_area */
T1 T263f5(GE_context* ac, T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T263*)(C))->a1)==(EIF_VOID));
	if (!(t1)) {
		t2 = (((T95*)(GE_void(((T263*)(C))->a1)))->a2);
		R = (((((t2) == ((T6)(GE_int32(0)))))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* DS_ARRAYED_LIST [AP_OPTION].swap */
void T113f28(GE_context* ac, T0* C, T6 a1, T6 a2)
{
	T0* t1;
	T0* l1 = 0;
	l1 = (T113f16(ac, C, a1));
	t1 = (T113f16(ac, C, a2));
	T113f27(ac, C, t1, a1);
	T113f27(ac, C, l1, a2);
}

/* DS_ARRAYED_LIST [AP_OPTION].replace */
void T113f27(GE_context* ac, T0* C, T0* a1, T6 a2)
{
	T6 t1;
	t1 = ((T6)((a2)-((T6)(GE_int32(1)))));
	((T154*)(GE_void(((T113*)(C))->a4)))->z2[t1] = (a1);
}

/* AP_OPTION_COMPARATOR.less_than */
T1 T317f1(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	T2 t3;
	T0* m2 = 0;
	T6 t4;
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	t1 = (T49x3073(ac, GE_void(a1)));
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		l1 = m1;
	} else {
		t3 = (T49x3078(ac, GE_void(a1)));
		l1 = (T2f1(ac, &t3));
	}
	t1 = (T49x3073(ac, GE_void(a2)));
	t2 = (t1?((m2 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		l2 = m2;
	} else {
		t3 = (T49x3078(ac, GE_void(a2)));
		l2 = (T2f1(ac, &t3));
	}
	t1 = (T317f2(ac, C));
	t4 = (T115f14(ac, GE_void(t1), l1, l2));
	R = (((((t4) == ((T6)(GE_int32(-1)))))));
	return R;
}

/* KL_STRING_ROUTINES.three_way_comparison */
T6 T115f14(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T0* t2;
	T6 t3;
	T6 R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T6 l8 = 0;
	T6 l9 = 0;
	T1 l10 = 0;
	t1 = ((a2)==(a1));
	if (t1) {
		R = (T6)(GE_int32(0));
	} else {
		t2 = (T115f8(ac, C));
		t1 = (T130f1(ac, GE_void(t2), a1, ge133ov5162));
		if (t1) {
			t2 = (T115f8(ac, C));
			t1 = (T130f1(ac, GE_void(t2), a2, ge133ov5162));
		}
		if (t1) {
			l4 = (((T17*)(GE_void(a1)))->a2);
			l5 = (((T17*)(GE_void(a2)))->a2);
			t1 = ((T1)((l4)<(l5)));
			if (t1) {
				l3 = l4;
			} else {
				l3 = l5;
			}
			l2 = (T6)(GE_int32(1));
			while (1) {
				t1 = (T6f1(ac, (&l2), l3));
				if (t1) {
					break;
				}
				l6 = (T17f10(ac, GE_void(a1), l2));
				l7 = (T17f10(ac, GE_void(a2), l2));
				t1 = (((((l6) == (l7)))));
				if (t1) {
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T2f6(ac, (&l6), l7));
					if (t1) {
						l10 = EIF_TRUE;
						R = (T6)(GE_int32(-1));
						l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
					} else {
						l10 = EIF_TRUE;
						R = (T6)(GE_int32(1));
						l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
					}
				}
			}
			t1 = ((T1)(!(l10)));
			if (t1) {
				t1 = ((T1)((l4)<(l5)));
				if (t1) {
					R = (T6)(GE_int32(-1));
				} else {
					t1 = (((((l4) != (l5)))));
					if (t1) {
						R = (T6)(GE_int32(1));
					}
				}
			}
		} else {
			l1 = EIF_VOID;
			t1 = (EIF_FALSE);
			if (t1) {
				R = ((GE_void(l1), a2, (T6)0));
			} else {
				l1 = EIF_VOID;
				t1 = (EIF_FALSE);
				if (t1) {
					t3 = ((GE_void(l1), a1, (T6)0));
					R = ((T6)(-(t3)));
				} else {
					l4 = (((T17*)(GE_void(a1)))->a2);
					l5 = (((T17*)(GE_void(a2)))->a2);
					t1 = ((T1)((l4)<(l5)));
					if (t1) {
						l3 = l4;
					} else {
						l3 = l5;
					}
					l2 = (T6)(GE_int32(1));
					while (1) {
						t1 = (T6f1(ac, (&l2), l3));
						if (t1) {
							break;
						}
						l8 = (T17f14(ac, GE_void(a1), l2));
						l9 = (T17f14(ac, GE_void(a2), l2));
						t1 = (((((l8) == (l9)))));
						if (t1) {
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						} else {
							t1 = ((T1)((l8)<(l9)));
							if (t1) {
								l10 = EIF_TRUE;
								R = (T6)(GE_int32(-1));
								l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
							} else {
								l10 = EIF_TRUE;
								R = (T6)(GE_int32(1));
								l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
							}
						}
					}
					t1 = ((T1)(!(l10)));
					if (t1) {
						t1 = ((T1)((l4)<(l5)));
						if (t1) {
							R = (T6)(GE_int32(-1));
						} else {
							t1 = (((((l4) != (l5)))));
							if (t1) {
								R = (T6)(GE_int32(1));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* AP_OPTION_COMPARATOR.string_ */
T0* T317f2(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge128os1973) {
		return ge128ov1973;
	} else {
		ge128os1973 = '\1';
		ge128ov1973 = R;
	}
	R = T115c19(ac);
	ge128ov1973 = R;
	return R;
}

/* DS_ARRAYED_LIST [AP_OPTION].item */
T0* T113f16(GE_context* ac, T0* C, T6 a1)
{
	T6 t1;
	T0* R = 0;
	t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
	R = (((T154*)(GE_void(((T113*)(C))->a4)))->z2[t1]);
	return R;
}

/* ST_WORD_WRAPPER.wrapped_string */
T0* T320f5(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	T6 t2;
	T1 t3;
	T2 t4;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T0* l6 = 0;
	t1 = (T320f4(ac, C));
	l1 = (T115f7(ac, GE_void(t1), a1));
	T320f12(ac, C, l1);
	l2 = (((((T0*)(GE_void(l1)))->id==17)?((T17*)(l1))->a2:((T265*)(l1))->a1));
	l6 = T17c57(ac, (T2)(' '), ((T320*)(C))->a1);
	t2 = (((T17*)(GE_void(a1)))->a2);
	R = T17c36(ac, t2);
	((T320*)(C))->a2 = (T6)(GE_int32(0));
	l4 = (T6)(GE_int32(1));
	l3 = ((T320*)(C))->a3;
	while (1) {
		t3 = (T6f1(ac, (&l4), l2));
		if (t3) {
			break;
		}
		t2 = ((T6)((l4)+(l3)));
		t3 = (T6f10(ac, &t2, l2));
		if (t3) {
			l5 = ((T6)((l4)+(l3)));
			while (1) {
				t3 = (((((l5) == (l4)))));
				if (!(t3)) {
					t4 = (((((T0*)(GE_void(l1)))->id==17)?T17f10(ac, l1, l5):T265f12(ac, l1, l5)));
					t3 = (((((t4) == ((T2)(' '))))));
				}
				if (t3) {
					break;
				}
				l5 = ((T6)((l5)-((T6)(GE_int32(1)))));
			}
		} else {
			l5 = ((T6)((l2)+((T6)(GE_int32(1)))));
		}
		t3 = (((((l5) == (l4)))));
		if (t3) {
			((T320*)(C))->a2 = ((T6)((((T320*)(C))->a2)+((T6)(GE_int32(1)))));
			t2 = ((T6)((l4)+(l3)));
			l5 = ((T6)((t2)-((T6)(GE_int32(1)))));
			t1 = (((((T0*)(GE_void(l1)))->id==17)?T17f11(ac, l1, l4, l5):T265f41(ac, l1, l4, l5)));
			T17f42(ac, GE_void(R), t1);
		} else {
			t2 = ((T6)((l5)-((T6)(GE_int32(1)))));
			t1 = (((((T0*)(GE_void(l1)))->id==17)?T17f11(ac, l1, l4, t2):T265f41(ac, l1, l4, t2)));
			T17f42(ac, GE_void(R), t1);
		}
		l4 = ((T6)((l5)+((T6)(GE_int32(1)))));
		t2 = (((((T0*)(GE_void(l1)))->id==17)?((T17*)(l1))->a2:((T265*)(l1))->a1));
		t3 = (T6f10(ac, (&l4), t2));
		if (t3) {
			T17f37(ac, GE_void(R), (T2)('\n'));
			T17f42(ac, GE_void(R), l6);
		}
		l3 = ((T6)((((T320*)(C))->a3)-(((T320*)(C))->a1)));
	}
	return R;
}

/* ST_WORD_WRAPPER.canonify_whitespace */
void T320f12(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 l1 = 0;
	T6 l2 = 0;
	T2 l3 = 0;
	l2 = (((((T0*)(GE_void(a1)))->id==17)?((T17*)(a1))->a2:((T265*)(a1))->a1));
	l1 = (T6)(GE_int32(1));
	while (1) {
		t1 = (T6f1(ac, (&l1), l2));
		if (t1) {
			break;
		}
		l3 = (((((T0*)(GE_void(a1)))->id==17)?T17f10(ac, a1, l1):T265f12(ac, a1, l1)));
		t1 = (T320f8(ac, C, l3));
		if (t1) {
			if (((T0*)(GE_void(a1)))->id==17) {
				T17f52(ac, a1, (T2)(' '), l1);
			} else {
				T265f88(ac, a1, (T2)(' '), l1);
			}
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
}

/* UC_UTF8_STRING.put */
void T265f88(GE_context* ac, T0* C, T2 a1, T6 a2)
{
	T1 t1;
	T0* t2;
	T6 t3;
	T6 t4;
	T6 l1 = 0;
	T6 l2 = 0;
	T2 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T6 l6 = 0;
	t1 = (((((((T265*)(C))->a1) == (((T265*)(C))->a3)))));
	if (t1) {
		l1 = a2;
		l4 = (T6)(GE_int32(1));
	} else {
		l1 = (T265f30(ac, C, a2));
		l3 = (T265f24(ac, C, l1));
		t2 = (T265f29(ac, C));
		l4 = (T264f3(ac, GE_void(t2), l3));
	}
	t2 = (T265f29(ac, C));
	l5 = (T264f23(ac, GE_void(t2), a1));
	t1 = (((((l5) == (l4)))));
	if (t1) {
	} else {
		t1 = ((T1)((l5)<(l4)));
		if (t1) {
			t3 = ((T6)((l1)+(l4)));
			t4 = ((T6)((l4)-(l5)));
			T265f82(ac, C, t3, t4);
		} else {
			l2 = ((T6)((l5)-(l4)));
			l6 = ((T6)((((T265*)(C))->a3)+(l2)));
			t3 = (T265f45(ac, C));
			t1 = (T6f1(ac, (&l6), t3));
			if (t1) {
				T265f74(ac, C, l6);
			}
			t3 = ((T6)((l1)+(l4)));
			T265f87(ac, C, t3, l2);
		}
	}
	T265f76(ac, C, a1, l5, l1);
}

/* ST_WORD_WRAPPER.is_space */
T1 T320f8(GE_context* ac, T0* C, T2 a1)
{
	T1 t1;
	T1 R = 0;
	t1 = (((((a1) == ((T2)(' '))))));
	if (!(t1)) {
		t1 = (((((a1) == ((T2)('\t'))))));
	}
	if (!(t1)) {
		t1 = (((((a1) == ((T2)('\n'))))));
	}
	if (!(t1)) {
		R = (((((a1) == ((T2)('\r'))))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* ST_WORD_WRAPPER.string_ */
T0* T320f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge128os1973) {
		return ge128ov1973;
	} else {
		ge128os1973 = '\1';
		ge128ov1973 = R;
	}
	R = T115c19(ac);
	ge128ov1973 = R;
	return R;
}

/* ST_WORD_WRAPPER.set_new_line_indentation */
void T320f10(GE_context* ac, T0* C, T6 a1)
{
	((T320*)(C))->a1 = a1;
}

/* AP_DISPLAY_HELP_FLAG.wrapper */
unsigned char ge104os5126 = '\0';
T0* ge104ov5126;
T0* T112f18(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge104os5126) {
		return ge104ov5126;
	} else {
		ge104os5126 = '\1';
		ge104ov5126 = R;
	}
	R = T320c9(ac);
	ge104ov5126 = R;
	T320f11(ac, GE_void(R), (T6)(GE_int32(79)));
	return R;
}

/* ST_WORD_WRAPPER.set_maximum_text_width */
void T320f11(GE_context* ac, T0* C, T6 a1)
{
	((T320*)(C))->a3 = a1;
}

/* ST_WORD_WRAPPER.make */
T0* T320c9(GE_context* ac)
{
	T0* C;
	C = GE_new320(EIF_TRUE);
	((T320*)(C))->a3 = (T6)(GE_int32(79));
	((T320*)(C))->a1 = (T6)(GE_int32(0));
	return C;
}

/* AP_DISPLAY_HELP_FLAG.full_usage_instruction */
T0* T112f16(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* R = 0;
	T0* l1 = 0;
	R = (T112f24(ac, C, a1));
	T17f37(ac, GE_void(R), (T2)('\n'));
	l1 = (((T45*)(a1))->a2);
	T114f16(ac, GE_void(l1));
	while (1) {
		t1 = (T114f7(ac, GE_void(l1)));
		if (t1) {
			break;
		}
		t2 = (T114f6(ac, GE_void(l1)));
		t2 = (((T43*)(GE_void(t2)))->a1);
		t1 = (((((T0*)(GE_void(t2)))->id==42)?((T42*)(t2))->a8:((T112*)(t2))->a8));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t2 = (T114f6(ac, GE_void(l1)));
			t2 = (T112f25(ac, C, a1, t2));
			T17f42(ac, GE_void(R), t2);
		}
		T17f37(ac, GE_void(R), (T2)('\n'));
		T114f17(ac, GE_void(l1));
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.alternative_usage_instruction */
T0* T112f25(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T0* t3;
	T6 t4;
	T6 t5;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	l1 = T17c40(ac);
	t1 = (((T43*)(GE_void(a2)))->a1);
	t1 = (((((T0*)(GE_void(t1)))->id==42)?T42f16(ac, t1):T112f27(ac, t1)));
	T17f42(ac, GE_void(l1), t1);
	T17f37(ac, GE_void(l1), (T2)(' '));
	T43f16(ac, GE_void(a2));
	while (1) {
		t2 = (T43f5(ac, GE_void(a2)));
		if (t2) {
			break;
		}
		l2 = (T43f6(ac, GE_void(a2)));
		t2 = ((GE_void(l2), (T1)0));
		t2 = ((T1)(!(t2)));
		if (t2) {
			t1 = ((GE_void(l2), (T0*)0));
			T17f42(ac, GE_void(l1), t1);
			T17f37(ac, GE_void(l1), (T2)(' '));
		}
		T43f17(ac, GE_void(a2));
	}
	t1 = (((T43*)(GE_void(a2)))->a2);
	T17f42(ac, GE_void(l1), t1);
	t1 = (T112f28(ac, C));
	t3 = (T112f29(ac, C));
	t3 = (((T34*)(GE_void(t3)))->a1);
	l3 = (((((T0*)(GE_void(t1)))->id==92)?T92f24(ac, t1, t3):T93f21(ac, t1, t3)));
	if (((T0*)(GE_void(l3)))->id==17) {
		T17f56(ac, l3, (T6)(GE_int32(40)));
	} else {
		T265f63(ac, l3, (T6)(GE_int32(40)));
	}
	t4 = (((T17*)(ge104ov5113))->a2);
	R = T17c57(ac, (T2)(' '), t4);
	T17f42(ac, GE_void(R), l3);
	T17f37(ac, GE_void(R), (T2)(' '));
	T17f42(ac, GE_void(R), l1);
	t1 = (T112f18(ac, C));
	t4 = (((T17*)(ge104ov5113))->a2);
	t5 = (((((T0*)(GE_void(l3)))->id==17)?((T17*)(l3))->a2:((T265*)(l3))->a1));
	t4 = ((T6)((t4)+(t5)));
	t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
	T320f10(ac, GE_void(t1), t4);
	t1 = (T112f18(ac, C));
	R = (T320f5(ac, GE_void(t1), R));
	return R;
}

/* AP_DISPLAY_HELP_FLAG.arguments */
T0* T112f29(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge202os1982) {
		return ge202ov1982;
	} else {
		ge202os1982 = '\1';
		ge202ov1982 = R;
	}
	R = T34c5(ac);
	ge202ov1982 = R;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.file_system */
T0* T112f28(GE_context* ac, T0* C)
{
	T0* t1;
	T1 t2;
	T0* R = 0;
	if (ge165os1977) {
		return ge165ov1977;
	} else {
		ge165os1977 = '\1';
		ge165ov1977 = R;
	}
	t1 = (T112f32(ac, C));
	t2 = (T90f1(ac, GE_void(t1)));
	if (t2) {
		R = (T112f33(ac, C));
		ge165ov1977 = R;
	} else {
		t1 = (T112f32(ac, C));
		t2 = (T90f2(ac, GE_void(t1)));
		if (t2) {
			R = (T112f34(ac, C));
			ge165ov1977 = R;
		} else {
			R = (T112f34(ac, C));
			ge165ov1977 = R;
		}
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.unix_file_system */
T0* T112f34(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge165os1980) {
		return ge165ov1980;
	} else {
		ge165os1980 = '\1';
		ge165ov1980 = R;
	}
	R = T93c33(ac);
	ge165ov1980 = R;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.windows_file_system */
T0* T112f33(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge165os1978) {
		return ge165ov1978;
	} else {
		ge165os1978 = '\1';
		ge165ov1978 = R;
	}
	R = T92c36(ac);
	ge165ov1978 = R;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.operating_system */
T0* T112f32(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge207os1981) {
		return ge207ov1981;
	} else {
		ge207os1981 = '\1';
		ge207ov1981 = R;
	}
	R = T90c6(ac);
	ge207ov1981 = R;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.usage_instruction */
T0* T112f24(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* t3;
	T6 t4;
	T6 t5;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	l1 = T17c40(ac);
	l3 = (((T45*)(a1))->a1);
	T113f19(ac, GE_void(l3));
	while (1) {
		t1 = (T113f9(ac, GE_void(l3)));
		if (t1) {
			break;
		}
		l2 = (T113f7(ac, GE_void(l3)));
		t1 = (T49x3082(ac, GE_void(l2)));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t2 = (T49x3072(ac, GE_void(l2)));
			T17f42(ac, GE_void(l1), t2);
			T17f37(ac, GE_void(l1), (T2)(' '));
		}
		T113f20(ac, GE_void(l3));
	}
	t2 = (((T45*)(a1))->a7);
	T17f42(ac, GE_void(l1), t2);
	t2 = (T112f28(ac, C));
	t3 = (T112f29(ac, C));
	t3 = (((T34*)(GE_void(t3)))->a1);
	l4 = (((((T0*)(GE_void(t2)))->id==92)?T92f24(ac, t2, t3):T93f21(ac, t2, t3)));
	if (((T0*)(GE_void(l4)))->id==17) {
		T17f56(ac, l4, (T6)(GE_int32(40)));
	} else {
		T265f63(ac, l4, (T6)(GE_int32(40)));
	}
	R = T17c36(ac, (T6)(GE_int32(20)));
	T17f42(ac, GE_void(R), ge104ov5113);
	T17f42(ac, GE_void(R), l4);
	T17f37(ac, GE_void(R), (T2)(' '));
	T17f42(ac, GE_void(R), l1);
	t2 = (T112f18(ac, C));
	t4 = (((T17*)(ge104ov5113))->a2);
	t5 = (((((T0*)(GE_void(l4)))->id==17)?((T17*)(l4))->a2:((T265*)(l4))->a1));
	t4 = ((T6)((t4)+(t5)));
	t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
	T320f10(ac, GE_void(t2), t4);
	t2 = (T112f18(ac, C));
	R = (T320f5(ac, GE_void(t2), R));
	return R;
}

/* DS_QUICK_SORTER [AP_OPTION].make */
T0* T318c2(GE_context* ac, T0* a1)
{
	T0* C;
	C = GE_new318(EIF_TRUE);
	((T318*)(C))->a1 = a1;
	return C;
}

/* AP_OPTION_COMPARATOR.default_create */
T0* T317c3(GE_context* ac)
{
	T0* C;
	C = GE_new317(EIF_TRUE);
	return C;
}

/* AP_STRING_OPTION.record_occurrence */
void T44f31(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	t1 = (((T45*)(a1))->a10);
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	t2 = ((T1)(!(t2)));
	if (t2) {
		T110f26(ac, GE_void(((T44*)(C))->a1), ((T44*)(C))->a2);
	} else {
		T110f26(ac, GE_void(((T44*)(C))->a1), m1);
	}
}

/* AP_FLAG.record_occurrence */
void T42f24(GE_context* ac, T0* C, T0* a1)
{
	((T42*)(C))->a1 = ((T6)((((T42*)(C))->a1)+((T6)(GE_int32(1)))));
}

/* GEANT_ARGUMENT_VARIABLES.force_last */
void T41f68(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T6 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T41f50(ac, C);
	T41f51(ac, C, a2);
	t1 = (((((((T41*)(C))->a1) != ((T6)(GE_int32(-1)))))));
	if (t1) {
		T41f52(ac, C, a1, ((T41*)(C))->a1);
	} else {
		l1 = ((T6)((((T41*)(C))->a6)+((T6)(GE_int32(1)))));
		t1 = (T6f8(ac, (&l1), ((T41*)(C))->a3));
		if (t1) {
			t2 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t2 = (T41f23(ac, C, t2));
			T41f53(ac, C, t2);
			l2 = (T41f24(ac, C, a2));
		} else {
			l2 = ((T41*)(C))->a4;
		}
		((T41*)(C))->a6 = l1;
		t2 = (T41f31(ac, C, l2));
		T41f54(ac, C, t2, l1);
		T41f55(ac, C, l1, l2);
		T41f52(ac, C, a1, l1);
		T41f56(ac, C, a2, l1);
		((T41*)(C))->a2 = ((T6)((((T41*)(C))->a2)+((T6)(GE_int32(1)))));
	}
}

/* GEANT_VARIABLES.force_last */
void T36f70(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T6 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T36f51(ac, C);
	T36f52(ac, C, a2);
	t1 = (((((((T36*)(C))->a1) != ((T6)(GE_int32(-1)))))));
	if (t1) {
		T36f53(ac, C, a1, ((T36*)(C))->a1);
	} else {
		l1 = ((T6)((((T36*)(C))->a6)+((T6)(GE_int32(1)))));
		t1 = (T6f8(ac, (&l1), ((T36*)(C))->a3));
		if (t1) {
			t2 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t2 = (T36f23(ac, C, t2));
			T36f54(ac, C, t2);
			l2 = (T36f24(ac, C, a2));
		} else {
			l2 = ((T36*)(C))->a4;
		}
		((T36*)(C))->a6 = l1;
		t2 = (T36f33(ac, C, l2));
		T36f55(ac, C, t2, l1);
		T36f56(ac, C, l1, l2);
		T36f53(ac, C, a1, l1);
		T36f57(ac, C, a2, l1);
		((T36*)(C))->a2 = ((T6)((((T36*)(C))->a2)+((T6)(GE_int32(1)))));
	}
}

/* GEANT_PROJECT_VARIABLES.force_last */
void T32f93(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T6 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T32f64(ac, C);
	T32f65(ac, C, a2);
	t1 = (((((((T32*)(C))->a3) != ((T6)(GE_int32(-1)))))));
	if (t1) {
		T32f66(ac, C, a1, ((T32*)(C))->a3);
	} else {
		l1 = ((T6)((((T32*)(C))->a8)+((T6)(GE_int32(1)))));
		t1 = (T6f8(ac, (&l1), ((T32*)(C))->a5));
		if (t1) {
			t2 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t2 = (T32f32(ac, C, t2));
			T32f67(ac, C, t2);
			l2 = (T32f33(ac, C, a2));
		} else {
			l2 = ((T32*)(C))->a6;
		}
		((T32*)(C))->a8 = l1;
		t2 = (T32f22(ac, C, l2));
		T32f68(ac, C, t2, l1);
		T32f69(ac, C, l1, l2);
		T32f66(ac, C, a1, l1);
		T32f70(ac, C, a2, l1);
		((T32*)(C))->a4 = ((T6)((((T32*)(C))->a4)+((T6)(GE_int32(1)))));
	}
}

/* GEANT_PROJECT_VARIABLES.resize */
void T32f67(GE_context* ac, T0* C, T6 a1)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T32f64(ac, C);
	l1 = (T32f31(ac, C, a1));
	t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	T32f72(ac, C, t1);
	l2 = ((T32*)(C))->a11;
	while (1) {
		t2 = ((T1)((l2)<((T6)(GE_int32(0)))));
		if (t2) {
			break;
		}
		T32f69(ac, C, (T6)(GE_int32(-1)), l2);
		l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
	}
	((T32*)(C))->a11 = l1;
	l2 = ((T32*)(C))->a8;
	while (1) {
		t2 = ((T1)((l2)<((T6)(GE_int32(0)))));
		if (t2) {
			break;
		}
		t1 = (T32f21(ac, C, l2));
		t2 = (T6f1(ac, &t1, (T6)(GE_int32(-2))));
		if (t2) {
			t3 = (T32f28(ac, C, l2));
			l3 = (T32f33(ac, C, t3));
			t1 = (T32f22(ac, C, l3));
			T32f68(ac, C, t1, l2);
			T32f69(ac, C, l2, l3);
		}
		l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
	}
	T32f73(ac, C, a1);
	T32f74(ac, C, a1);
	T32f75(ac, C, a1);
	((T32*)(C))->a5 = a1;
	((T32*)(C))->a3 = (T6)(GE_int32(-1));
}

/* GEANT_PROJECT_VARIABLES.clashes_resize */
void T32f75(GE_context* ac, T0* C, T6 a1)
{
	T0* t1;
	t1 = (T32f37(ac, C));
	((T32*)(C))->a15 = (T106f1(ac, GE_void(t1), ((T32*)(C))->a15, (T6)(GE_int32(-1)), a1));
}

/* GEANT_PROJECT_VARIABLES.special_integer_ */
T0* T32f37(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge127os2705) {
		return ge127ov2705;
	} else {
		ge127os2705 = '\1';
		ge127ov2705 = R;
	}
	R = T106c7(ac);
	ge127ov2705 = R;
	return R;
}

/* GEANT_PROJECT_VARIABLES.key_storage_resize */
void T32f74(GE_context* ac, T0* C, T6 a1)
{
	((T32*)(C))->a18 = (T104f1(ac, GE_void(((T32*)(C))->a17), ((T32*)(C))->a18, a1));
}

/* GEANT_PROJECT_VARIABLES.item_storage_resize */
void T32f73(GE_context* ac, T0* C, T6 a1)
{
	((T32*)(C))->a14 = (T104f1(ac, GE_void(((T32*)(C))->a13), ((T32*)(C))->a14, a1));
}

/* GEANT_PROJECT_VARIABLES.slots_resize */
void T32f72(GE_context* ac, T0* C, T6 a1)
{
	T0* t1;
	t1 = (T32f37(ac, C));
	((T32*)(C))->a16 = (T106f1(ac, GE_void(t1), ((T32*)(C))->a16, (T6)(GE_int32(-1)), a1));
}

/* GEANT_PROJECT_VARIABLES.new_capacity */
T6 T32f32(GE_context* ac, T0* C, T6 a1)
{
	T6 t1;
	T6 R = 0;
	t1 = (T6)(GE_int32(2));
	R = ((T6)((t1)*(a1)));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.search */
void T41f71(GE_context* ac, T0* C, T0* a1)
{
	T41f51(ac, C, a1);
	((T41*)(C))->a9 = ((T41*)(C))->a1;
}

/* GEANT_VARIABLES.search */
void T36f69(GE_context* ac, T0* C, T0* a1)
{
	T36f52(ac, C, a1);
	((T36*)(C))->a9 = ((T36*)(C))->a1;
}

/* GEANT_PROJECT_VARIABLES.search */
void T32f81(GE_context* ac, T0* C, T0* a1)
{
	T32f65(ac, C, a1);
	((T32*)(C))->a10 = ((T32*)(C))->a3;
}

/* GEANT_ARGUMENT_VARIABLES.start */
void T41f77(GE_context* ac, T0* C)
{
	T41f69(ac, C, ((T41*)(C))->a19);
}

/* GEANT_VARIABLES.start */
void T36f77(GE_context* ac, T0* C)
{
	T36f71(ac, C, ((T36*)(C))->a19);
}

/* GEANT_PROJECT_VARIABLES.start */
void T32f95(GE_context* ac, T0* C)
{
	T32f82(ac, C, ((T32*)(C))->a19);
}

/* GEANT_ARGUMENT_VARIABLES.forth */
void T41f78(GE_context* ac, T0* C)
{
	T41f70(ac, C, ((T41*)(C))->a19);
}

/* GEANT_VARIABLES.forth */
void T36f78(GE_context* ac, T0* C)
{
	T36f72(ac, C, ((T36*)(C))->a19);
}

/* GEANT_PROJECT_VARIABLES.forth */
void T32f96(GE_context* ac, T0* C)
{
	T32f83(ac, C, ((T32*)(C))->a19);
}

/* GEANT_ARGUMENT_VARIABLES.set_variable_value */
void T41f75(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T41f47(ac, C, a2, a1);
}

/* GEANT_VARIABLES.set_variable_value */
void T36f47(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T36f48(ac, C, a2, a1);
}

/* GEANT_PROJECT_VARIABLES.set_variable_value */
void T32f59(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T32f62(ac, C, a2, a1);
}

/* GEANT_PROJECT_VARIABLES.force */
void T32f62(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T6 t2;
	T6 t3;
	T6 l1 = 0;
	T6 l2 = 0;
	T32f64(ac, C);
	T32f65(ac, C, a2);
	t1 = (((((((T32*)(C))->a3) != ((T6)(GE_int32(-1)))))));
	if (t1) {
		T32f66(ac, C, a1, ((T32*)(C))->a3);
	} else {
		t1 = (((((((T32*)(C))->a4) == (((T32*)(C))->a5)))));
		if (t1) {
			t2 = ((T6)((((T32*)(C))->a4)+((T6)(GE_int32(1)))));
			t2 = (T32f32(ac, C, t2));
			T32f67(ac, C, t2);
			l2 = (T32f33(ac, C, a2));
		} else {
			l2 = ((T32*)(C))->a6;
		}
		l1 = ((T32*)(C))->a7;
		t1 = (((((l1) == ((T6)(GE_int32(-1)))))));
		if (t1) {
			((T32*)(C))->a8 = ((T6)((((T32*)(C))->a8)+((T6)(GE_int32(1)))));
			l1 = ((T32*)(C))->a8;
		} else {
			t2 = (T6)(GE_int32(-3));
			t3 = (T32f21(ac, C, l1));
			((T32*)(C))->a7 = ((T6)((t2)-(t3)));
		}
		t2 = (T32f22(ac, C, l2));
		T32f68(ac, C, t2, l1);
		T32f69(ac, C, l1, l2);
		T32f66(ac, C, a1, l1);
		T32f70(ac, C, a2, l1);
		((T32*)(C))->a4 = ((T6)((((T32*)(C))->a4)+((T6)(GE_int32(1)))));
	}
}

/* GEANT_ARGUMENT_VARIABLES.replace */
void T41f76(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T41f50(ac, C);
	T41f51(ac, C, a2);
	T41f52(ac, C, a1, ((T41*)(C))->a1);
}

/* GEANT_VARIABLES.replace */
void T36f76(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T36f51(ac, C);
	T36f52(ac, C, a2);
	T36f53(ac, C, a1, ((T36*)(C))->a1);
}

/* GEANT_PROJECT_VARIABLES.replace */
void T32f94(GE_context* ac, T0* C, T0* a1, T0* a2)
{
	T32f64(ac, C);
	T32f65(ac, C, a2);
	T32f66(ac, C, a1, ((T32*)(C))->a3);
}

/* SERIALIZATION_FAILURE.set_throwing_exception */
void T89f7(GE_context* ac, T0* C, T0* a1)
{
	((T89*)(C))->a1 = a1;
}

/* ADDRESS_APPLIED_TO_MELTED_FEATURE.set_throwing_exception */
void T88f7(GE_context* ac, T0* C, T0* a1)
{
	((T88*)(C))->a1 = a1;
}

/* DEVELOPER_EXCEPTION.set_throwing_exception */
void T87f11(GE_context* ac, T0* C, T0* a1)
{
	((T87*)(C))->a1 = a1;
}

/* MISMATCH_FAILURE.set_throwing_exception */
void T86f7(GE_context* ac, T0* C, T0* a1)
{
	((T86*)(C))->a1 = a1;
}

/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.set_throwing_exception */
void T85f7(GE_context* ac, T0* C, T0* a1)
{
	((T85*)(C))->a1 = a1;
}

/* VOID_ASSIGNED_TO_EXPANDED.set_throwing_exception */
void T84f7(GE_context* ac, T0* C, T0* a1)
{
	((T84*)(C))->a1 = a1;
}

/* EXTERNAL_FAILURE.set_throwing_exception */
void T83f7(GE_context* ac, T0* C, T0* a1)
{
	((T83*)(C))->a1 = a1;
}

/* CREATE_ON_DEFERRED.set_throwing_exception */
void T82f7(GE_context* ac, T0* C, T0* a1)
{
	((T82*)(C))->a1 = a1;
}

/* RESUMPTION_FAILURE.set_throwing_exception */
void T81f7(GE_context* ac, T0* C, T0* a1)
{
	((T81*)(C))->a1 = a1;
}

/* RESCUE_FAILURE.set_throwing_exception */
void T80f7(GE_context* ac, T0* C, T0* a1)
{
	((T80*)(C))->a1 = a1;
}

/* LOOP_INVARIANT_VIOLATION.set_throwing_exception */
void T79f7(GE_context* ac, T0* C, T0* a1)
{
	((T79*)(C))->a1 = a1;
}

/* VARIANT_VIOLATION.set_throwing_exception */
void T78f7(GE_context* ac, T0* C, T0* a1)
{
	((T78*)(C))->a1 = a1;
}

/* BAD_INSPECT_VALUE.set_throwing_exception */
void T77f7(GE_context* ac, T0* C, T0* a1)
{
	((T77*)(C))->a1 = a1;
}

/* CHECK_VIOLATION.set_throwing_exception */
void T76f7(GE_context* ac, T0* C, T0* a1)
{
	((T76*)(C))->a1 = a1;
}

/* FLOATING_POINT_FAILURE.set_throwing_exception */
void T75f7(GE_context* ac, T0* C, T0* a1)
{
	((T75*)(C))->a1 = a1;
}

/* POSTCONDITION_VIOLATION.set_throwing_exception */
void T74f7(GE_context* ac, T0* C, T0* a1)
{
	((T74*)(C))->a1 = a1;
}

/* PRECONDITION_VIOLATION.set_throwing_exception */
void T73f7(GE_context* ac, T0* C, T0* a1)
{
	((T73*)(C))->a1 = a1;
}

/* EIFFEL_RUNTIME_PANIC.set_throwing_exception */
void T70f10(GE_context* ac, T0* C, T0* a1)
{
	((T70*)(C))->a2 = a1;
}

/* COM_FAILURE.set_throwing_exception */
void T69f13(GE_context* ac, T0* C, T0* a1)
{
	((T69*)(C))->a1 = a1;
}

/* OPERATING_SYSTEM_FAILURE.set_throwing_exception */
void T68f8(GE_context* ac, T0* C, T0* a1)
{
	((T68*)(C))->a1 = a1;
}

/* IO_FAILURE.set_throwing_exception */
void T67f10(GE_context* ac, T0* C, T0* a1)
{
	((T67*)(C))->a2 = a1;
}

/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_throwing_exception */
void T66f8(GE_context* ac, T0* C, T0* a1)
{
	((T66*)(C))->a1 = a1;
}

/* INVARIANT_VIOLATION.set_throwing_exception */
void T65f8(GE_context* ac, T0* C, T0* a1)
{
	((T65*)(C))->a1 = a1;
}

/* NO_MORE_MEMORY.set_throwing_exception */
void T64f11(GE_context* ac, T0* C, T0* a1)
{
	((T64*)(C))->a3 = a1;
}

/* OLD_VIOLATION.set_throwing_exception */
void T62f7(GE_context* ac, T0* C, T0* a1)
{
	((T62*)(C))->a1 = a1;
}

/* ROUTINE_FAILURE.set_throwing_exception */
void T60f11(GE_context* ac, T0* C, T0* a1)
{
	((T60*)(C))->a3 = a1;
}

/* VOID_TARGET.set_throwing_exception */
void T58f7(GE_context* ac, T0* C, T0* a1)
{
	((T58*)(C))->a1 = a1;
}

/* SERIALIZATION_FAILURE.set_exception_trace */
void T89f8(GE_context* ac, T0* C, T0* a1)
{
	((T89*)(C))->a2 = a1;
}

/* ADDRESS_APPLIED_TO_MELTED_FEATURE.set_exception_trace */
void T88f8(GE_context* ac, T0* C, T0* a1)
{
	((T88*)(C))->a2 = a1;
}

/* DEVELOPER_EXCEPTION.set_exception_trace */
void T87f12(GE_context* ac, T0* C, T0* a1)
{
	((T87*)(C))->a2 = a1;
}

/* MISMATCH_FAILURE.set_exception_trace */
void T86f8(GE_context* ac, T0* C, T0* a1)
{
	((T86*)(C))->a2 = a1;
}

/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.set_exception_trace */
void T85f8(GE_context* ac, T0* C, T0* a1)
{
	((T85*)(C))->a2 = a1;
}

/* VOID_ASSIGNED_TO_EXPANDED.set_exception_trace */
void T84f8(GE_context* ac, T0* C, T0* a1)
{
	((T84*)(C))->a2 = a1;
}

/* EXTERNAL_FAILURE.set_exception_trace */
void T83f8(GE_context* ac, T0* C, T0* a1)
{
	((T83*)(C))->a2 = a1;
}

/* CREATE_ON_DEFERRED.set_exception_trace */
void T82f8(GE_context* ac, T0* C, T0* a1)
{
	((T82*)(C))->a2 = a1;
}

/* RESUMPTION_FAILURE.set_exception_trace */
void T81f8(GE_context* ac, T0* C, T0* a1)
{
	((T81*)(C))->a2 = a1;
}

/* RESCUE_FAILURE.set_exception_trace */
void T80f8(GE_context* ac, T0* C, T0* a1)
{
	((T80*)(C))->a2 = a1;
}

/* LOOP_INVARIANT_VIOLATION.set_exception_trace */
void T79f8(GE_context* ac, T0* C, T0* a1)
{
	((T79*)(C))->a2 = a1;
}

/* VARIANT_VIOLATION.set_exception_trace */
void T78f8(GE_context* ac, T0* C, T0* a1)
{
	((T78*)(C))->a2 = a1;
}

/* BAD_INSPECT_VALUE.set_exception_trace */
void T77f8(GE_context* ac, T0* C, T0* a1)
{
	((T77*)(C))->a2 = a1;
}

/* CHECK_VIOLATION.set_exception_trace */
void T76f8(GE_context* ac, T0* C, T0* a1)
{
	((T76*)(C))->a2 = a1;
}

/* FLOATING_POINT_FAILURE.set_exception_trace */
void T75f8(GE_context* ac, T0* C, T0* a1)
{
	((T75*)(C))->a2 = a1;
}

/* POSTCONDITION_VIOLATION.set_exception_trace */
void T74f8(GE_context* ac, T0* C, T0* a1)
{
	((T74*)(C))->a2 = a1;
}

/* PRECONDITION_VIOLATION.set_exception_trace */
void T73f8(GE_context* ac, T0* C, T0* a1)
{
	((T73*)(C))->a2 = a1;
}

/* EIFFEL_RUNTIME_PANIC.set_exception_trace */
void T70f11(GE_context* ac, T0* C, T0* a1)
{
	((T70*)(C))->a3 = a1;
}

/* COM_FAILURE.set_exception_trace */
void T69f16(GE_context* ac, T0* C, T0* a1)
{
	((T69*)(C))->a5 = a1;
}

/* OPERATING_SYSTEM_FAILURE.set_exception_trace */
void T68f10(GE_context* ac, T0* C, T0* a1)
{
	((T68*)(C))->a3 = a1;
}

/* IO_FAILURE.set_exception_trace */
void T67f12(GE_context* ac, T0* C, T0* a1)
{
	((T67*)(C))->a4 = a1;
}

/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_exception_trace */
void T66f10(GE_context* ac, T0* C, T0* a1)
{
	((T66*)(C))->a3 = a1;
}

/* INVARIANT_VIOLATION.set_exception_trace */
void T65f10(GE_context* ac, T0* C, T0* a1)
{
	((T65*)(C))->a3 = a1;
}

/* NO_MORE_MEMORY.set_exception_trace */
void T64f9(GE_context* ac, T0* C, T0* a1)
{
	((T64*)(C))->a1 = a1;
}

/* OLD_VIOLATION.set_exception_trace */
void T62f8(GE_context* ac, T0* C, T0* a1)
{
	((T62*)(C))->a2 = a1;
}

/* ROUTINE_FAILURE.set_exception_trace */
void T60f12(GE_context* ac, T0* C, T0* a1)
{
	((T60*)(C))->a4 = a1;
}

/* VOID_TARGET.set_exception_trace */
void T58f8(GE_context* ac, T0* C, T0* a1)
{
	((T58*)(C))->a2 = a1;
}

/* SERIALIZATION_FAILURE.set_description */
void T89f9(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T89*)(C))->a3 = l3;
	} else {
		((T89*)(C))->a3 = EIF_VOID;
	}
}

/* C_STRING.set_count */
void T127f8(GE_context* ac, T0* C, T6 a1)
{
	T6 t1;
	T1 t2;
	T6 l1 = 0;
	l1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	t1 = (((T128*)(GE_void(((T127*)(C))->a1)))->a1);
	t2 = ((T1)((t1)<(l1)));
	if (t2) {
		T128f11(ac, GE_void(((T127*)(C))->a1), l1);
	}
	((T127*)(C))->a2 = a1;
}

/* UTF_CONVERTER.utf_32_string_into_utf_8_0_pointer */
void T125f11(GE_context* ac, T125* C, T0* a1, T0* a2, T6 a3, T0* a4)
{
	T6 t1;
	T6 t2;
	T1 t3;
	T8 t4;
	T10 t5;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T10 l5 = 0;
	T1 l6 = 0;
	l3 = (((T17*)(GE_void(a1)))->a2);
	l4 = (((T128*)(GE_void(a2)))->a1);
	t1 = ((T6)((l4)-(a3)));
	t2 = ((T6)((l3)+((T6)(GE_int32(1)))));
	t3 = ((T1)((t1)<(t2)));
	if (t3) {
		t1 = (T125f1(ac, C, a1, (T6)(GE_int32(1)), l3));
		t1 = ((T6)((a3)+(t1)));
		l4 = ((T6)((t1)+((T6)(GE_int32(1)))));
		T128f11(ac, GE_void(a2), l4);
		l6 = EIF_TRUE;
	}
	l2 = (T6)(GE_int32(0));
	l1 = a3;
	while (1) {
		t3 = (T6f8(ac, (&l2), l3));
		if (t3) {
			break;
		}
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		l5 = (T17f23(ac, GE_void(a1), l2));
		t3 = (T10f2(ac, (&l5), (T10)(GE_nat32(127))));
		if (t3) {
			t4 = (T10f4(ac, (&l5)));
			T128f12(ac, GE_void(a2), t4, l1);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		} else {
			t3 = ((T1)(!(l6)));
			if (t3) {
				t1 = ((T6)((l1)+((T6)(GE_int32(5)))));
				t2 = ((T6)((l3)-(l2)));
				t1 = ((T6)((t1)+(t2)));
				t3 = (T6f1(ac, &t1, l4));
			}
			if (t3) {
				t1 = (T125f1(ac, C, a1, l2, l3));
				t1 = ((T6)((l1)+(t1)));
				l4 = ((T6)((t1)+((T6)(GE_int32(1)))));
				T128f11(ac, GE_void(a2), l4);
				l6 = EIF_TRUE;
			}
			t3 = (T10f2(ac, (&l5), (T10)(GE_nat32(2047))));
			if (t3) {
				t5 = ((T10)((l5)>>((T6)(GE_int32(6)))));
				t5 = ((T10)((t5)|((T10)(GE_nat32(192)))));
				t4 = (T10f4(ac, &t5));
				T128f12(ac, GE_void(a2), t4, l1);
				t5 = ((T10)((l5)&((T10)(GE_nat32(63)))));
				t5 = ((T10)((t5)|((T10)(GE_nat32(128)))));
				t4 = (T10f4(ac, &t5));
				t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				T128f12(ac, GE_void(a2), t4, t1);
				l1 = ((T6)((l1)+((T6)(GE_int32(2)))));
			} else {
				t3 = (T10f2(ac, (&l5), (T10)(GE_nat32(65535))));
				if (t3) {
					t5 = ((T10)((l5)>>((T6)(GE_int32(12)))));
					t5 = ((T10)((t5)|((T10)(GE_nat32(224)))));
					t4 = (T10f4(ac, &t5));
					T128f12(ac, GE_void(a2), t4, l1);
					t5 = ((T10)((l5)>>((T6)(GE_int32(6)))));
					t5 = ((T10)((t5)&((T10)(GE_nat32(63)))));
					t5 = ((T10)((t5)|((T10)(GE_nat32(128)))));
					t4 = (T10f4(ac, &t5));
					t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					T128f12(ac, GE_void(a2), t4, t1);
					t5 = ((T10)((l5)&((T10)(GE_nat32(63)))));
					t5 = ((T10)((t5)|((T10)(GE_nat32(128)))));
					t4 = (T10f4(ac, &t5));
					t1 = ((T6)((l1)+((T6)(GE_int32(2)))));
					T128f12(ac, GE_void(a2), t4, t1);
					l1 = ((T6)((l1)+((T6)(GE_int32(3)))));
				} else {
					t5 = ((T10)((l5)>>((T6)(GE_int32(18)))));
					t5 = ((T10)((t5)|((T10)(GE_nat32(240)))));
					t4 = (T10f4(ac, &t5));
					T128f12(ac, GE_void(a2), t4, l1);
					t5 = ((T10)((l5)>>((T6)(GE_int32(12)))));
					t5 = ((T10)((t5)&((T10)(GE_nat32(63)))));
					t5 = ((T10)((t5)|((T10)(GE_nat32(128)))));
					t4 = (T10f4(ac, &t5));
					t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					T128f12(ac, GE_void(a2), t4, t1);
					t5 = ((T10)((l5)>>((T6)(GE_int32(6)))));
					t5 = ((T10)((t5)&((T10)(GE_nat32(63)))));
					t5 = ((T10)((t5)|((T10)(GE_nat32(128)))));
					t4 = (T10f4(ac, &t5));
					t1 = ((T6)((l1)+((T6)(GE_int32(2)))));
					T128f12(ac, GE_void(a2), t4, t1);
					t5 = ((T10)((l5)&((T10)(GE_nat32(63)))));
					t5 = ((T10)((t5)|((T10)(GE_nat32(128)))));
					t4 = (T10f4(ac, &t5));
					t1 = ((T6)((l1)+((T6)(GE_int32(3)))));
					T128f12(ac, GE_void(a2), t4, t1);
					l1 = ((T6)((l1)+((T6)(GE_int32(4)))));
				}
			}
		}
	}
	if (l6) {
		t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		T128f11(ac, GE_void(a2), t1);
	}
	T128f12(ac, GE_void(a2), (T8)(GE_nat8(0)), l1);
	t3 = ((a4)!=(EIF_VOID));
	if (t3) {
		T126f2(ac, GE_void(a4), l1);
	}
}

/* ADDRESS_APPLIED_TO_MELTED_FEATURE.set_description */
void T88f9(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T88*)(C))->a3 = l3;
	} else {
		((T88*)(C))->a3 = EIF_VOID;
	}
}

/* DEVELOPER_EXCEPTION.set_description */
void T87f13(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (((T17*)(GE_void(a1)))->a2);
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T87*)(C))->a3 = l3;
	} else {
		((T87*)(C))->a3 = EIF_VOID;
	}
}

/* MISMATCH_FAILURE.set_description */
void T86f9(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T86*)(C))->a3 = l3;
	} else {
		((T86*)(C))->a3 = EIF_VOID;
	}
}

/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.set_description */
void T85f9(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T85*)(C))->a3 = l3;
	} else {
		((T85*)(C))->a3 = EIF_VOID;
	}
}

/* VOID_ASSIGNED_TO_EXPANDED.set_description */
void T84f9(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T84*)(C))->a3 = l3;
	} else {
		((T84*)(C))->a3 = EIF_VOID;
	}
}

/* EXTERNAL_FAILURE.set_description */
void T83f9(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T83*)(C))->a3 = l3;
	} else {
		((T83*)(C))->a3 = EIF_VOID;
	}
}

/* CREATE_ON_DEFERRED.set_description */
void T82f9(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T82*)(C))->a3 = l3;
	} else {
		((T82*)(C))->a3 = EIF_VOID;
	}
}

/* RESUMPTION_FAILURE.set_description */
void T81f9(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T81*)(C))->a3 = l3;
	} else {
		((T81*)(C))->a3 = EIF_VOID;
	}
}

/* RESCUE_FAILURE.set_description */
void T80f9(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T80*)(C))->a3 = l3;
	} else {
		((T80*)(C))->a3 = EIF_VOID;
	}
}

/* LOOP_INVARIANT_VIOLATION.set_description */
void T79f9(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T79*)(C))->a3 = l3;
	} else {
		((T79*)(C))->a3 = EIF_VOID;
	}
}

/* VARIANT_VIOLATION.set_description */
void T78f9(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T78*)(C))->a3 = l3;
	} else {
		((T78*)(C))->a3 = EIF_VOID;
	}
}

/* BAD_INSPECT_VALUE.set_description */
void T77f9(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T77*)(C))->a3 = l3;
	} else {
		((T77*)(C))->a3 = EIF_VOID;
	}
}

/* CHECK_VIOLATION.set_description */
void T76f9(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T76*)(C))->a3 = l3;
	} else {
		((T76*)(C))->a3 = EIF_VOID;
	}
}

/* FLOATING_POINT_FAILURE.set_description */
void T75f9(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T75*)(C))->a3 = l3;
	} else {
		((T75*)(C))->a3 = EIF_VOID;
	}
}

/* POSTCONDITION_VIOLATION.set_description */
void T74f9(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T74*)(C))->a3 = l3;
	} else {
		((T74*)(C))->a3 = EIF_VOID;
	}
}

/* PRECONDITION_VIOLATION.set_description */
void T73f9(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T73*)(C))->a3 = l3;
	} else {
		((T73*)(C))->a3 = EIF_VOID;
	}
}

/* EIFFEL_RUNTIME_PANIC.set_description */
void T70f12(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T70*)(C))->a4 = l3;
	} else {
		((T70*)(C))->a4 = EIF_VOID;
	}
}

/* COM_FAILURE.set_description */
void T69f17(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T69*)(C))->a6 = l3;
	} else {
		((T69*)(C))->a6 = EIF_VOID;
	}
}

/* OPERATING_SYSTEM_FAILURE.set_description */
void T68f11(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T68*)(C))->a4 = l3;
	} else {
		((T68*)(C))->a4 = EIF_VOID;
	}
}

/* IO_FAILURE.set_description */
void T67f13(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T67*)(C))->a5 = l3;
	} else {
		((T67*)(C))->a5 = EIF_VOID;
	}
}

/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_description */
void T66f11(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T66*)(C))->a4 = l3;
	} else {
		((T66*)(C))->a4 = EIF_VOID;
	}
}

/* INVARIANT_VIOLATION.set_description */
void T65f11(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T65*)(C))->a4 = l3;
	} else {
		((T65*)(C))->a4 = EIF_VOID;
	}
}

/* NO_MORE_MEMORY.set_description */
void T64f12(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T64*)(C))->a4 = l3;
	} else {
		((T64*)(C))->a4 = EIF_VOID;
	}
}

/* OLD_VIOLATION.set_description */
void T62f9(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T62*)(C))->a3 = l3;
	} else {
		((T62*)(C))->a3 = EIF_VOID;
	}
}

/* ROUTINE_FAILURE.set_description */
void T60f13(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T60*)(C))->a5 = l3;
	} else {
		((T60*)(C))->a5 = EIF_VOID;
	}
}

/* VOID_TARGET.set_description */
void T58f9(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T125 l1 = GE_default125;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (EIF_FALSE);
	if (t1) {
		t2 = ((GE_void(a1), (T6)0));
		l3 = T127c7(ac, t2);
		l2 = T126c2(ac, (T6)(GE_int32(0)));
		t3 = (((T127*)(GE_void(l3)))->a1);
		T125f11(ac, (&l1), a1, t3, (T6)(GE_int32(0)), l2);
		t2 = (((T126*)(GE_void(l2)))->a1);
		T127f8(ac, GE_void(l3), t2);
		((T58*)(C))->a3 = l3;
	} else {
		((T58*)(C))->a3 = EIF_VOID;
	}
}

/* SERIALIZATION_FAILURE.set_recipient_name */
void T89f10(GE_context* ac, T0* C, T0* a1)
{
	((T89*)(C))->a4 = a1;
}

/* ADDRESS_APPLIED_TO_MELTED_FEATURE.set_recipient_name */
void T88f10(GE_context* ac, T0* C, T0* a1)
{
	((T88*)(C))->a4 = a1;
}

/* DEVELOPER_EXCEPTION.set_recipient_name */
void T87f14(GE_context* ac, T0* C, T0* a1)
{
	((T87*)(C))->a4 = a1;
}

/* MISMATCH_FAILURE.set_recipient_name */
void T86f10(GE_context* ac, T0* C, T0* a1)
{
	((T86*)(C))->a4 = a1;
}

/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.set_recipient_name */
void T85f10(GE_context* ac, T0* C, T0* a1)
{
	((T85*)(C))->a4 = a1;
}

/* VOID_ASSIGNED_TO_EXPANDED.set_recipient_name */
void T84f10(GE_context* ac, T0* C, T0* a1)
{
	((T84*)(C))->a4 = a1;
}

/* EXTERNAL_FAILURE.set_recipient_name */
void T83f10(GE_context* ac, T0* C, T0* a1)
{
	((T83*)(C))->a4 = a1;
}

/* CREATE_ON_DEFERRED.set_recipient_name */
void T82f10(GE_context* ac, T0* C, T0* a1)
{
	((T82*)(C))->a4 = a1;
}

/* RESUMPTION_FAILURE.set_recipient_name */
void T81f10(GE_context* ac, T0* C, T0* a1)
{
	((T81*)(C))->a4 = a1;
}

/* RESCUE_FAILURE.set_recipient_name */
void T80f10(GE_context* ac, T0* C, T0* a1)
{
	((T80*)(C))->a4 = a1;
}

/* LOOP_INVARIANT_VIOLATION.set_recipient_name */
void T79f10(GE_context* ac, T0* C, T0* a1)
{
	((T79*)(C))->a4 = a1;
}

/* VARIANT_VIOLATION.set_recipient_name */
void T78f10(GE_context* ac, T0* C, T0* a1)
{
	((T78*)(C))->a4 = a1;
}

/* BAD_INSPECT_VALUE.set_recipient_name */
void T77f10(GE_context* ac, T0* C, T0* a1)
{
	((T77*)(C))->a4 = a1;
}

/* CHECK_VIOLATION.set_recipient_name */
void T76f10(GE_context* ac, T0* C, T0* a1)
{
	((T76*)(C))->a4 = a1;
}

/* FLOATING_POINT_FAILURE.set_recipient_name */
void T75f10(GE_context* ac, T0* C, T0* a1)
{
	((T75*)(C))->a4 = a1;
}

/* POSTCONDITION_VIOLATION.set_recipient_name */
void T74f10(GE_context* ac, T0* C, T0* a1)
{
	((T74*)(C))->a4 = a1;
}

/* PRECONDITION_VIOLATION.set_recipient_name */
void T73f10(GE_context* ac, T0* C, T0* a1)
{
	((T73*)(C))->a4 = a1;
}

/* EIFFEL_RUNTIME_PANIC.set_recipient_name */
void T70f13(GE_context* ac, T0* C, T0* a1)
{
	((T70*)(C))->a5 = a1;
}

/* COM_FAILURE.set_recipient_name */
void T69f18(GE_context* ac, T0* C, T0* a1)
{
	((T69*)(C))->a7 = a1;
}

/* OPERATING_SYSTEM_FAILURE.set_recipient_name */
void T68f12(GE_context* ac, T0* C, T0* a1)
{
	((T68*)(C))->a5 = a1;
}

/* IO_FAILURE.set_recipient_name */
void T67f14(GE_context* ac, T0* C, T0* a1)
{
	((T67*)(C))->a6 = a1;
}

/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_recipient_name */
void T66f12(GE_context* ac, T0* C, T0* a1)
{
	((T66*)(C))->a5 = a1;
}

/* INVARIANT_VIOLATION.set_recipient_name */
void T65f12(GE_context* ac, T0* C, T0* a1)
{
	((T65*)(C))->a5 = a1;
}

/* NO_MORE_MEMORY.set_recipient_name */
void T64f13(GE_context* ac, T0* C, T0* a1)
{
	((T64*)(C))->a5 = a1;
}

/* OLD_VIOLATION.set_recipient_name */
void T62f10(GE_context* ac, T0* C, T0* a1)
{
	((T62*)(C))->a4 = a1;
}

/* ROUTINE_FAILURE.set_recipient_name */
void T60f14(GE_context* ac, T0* C, T0* a1)
{
	((T60*)(C))->a6 = a1;
}

/* VOID_TARGET.set_recipient_name */
void T58f10(GE_context* ac, T0* C, T0* a1)
{
	((T58*)(C))->a4 = a1;
}

/* SERIALIZATION_FAILURE.set_type_name */
void T89f11(GE_context* ac, T0* C, T0* a1)
{
	((T89*)(C))->a5 = a1;
}

/* ADDRESS_APPLIED_TO_MELTED_FEATURE.set_type_name */
void T88f11(GE_context* ac, T0* C, T0* a1)
{
	((T88*)(C))->a5 = a1;
}

/* DEVELOPER_EXCEPTION.set_type_name */
void T87f15(GE_context* ac, T0* C, T0* a1)
{
	((T87*)(C))->a5 = a1;
}

/* MISMATCH_FAILURE.set_type_name */
void T86f11(GE_context* ac, T0* C, T0* a1)
{
	((T86*)(C))->a5 = a1;
}

/* EXCEPTION_IN_SIGNAL_HANDLER_FAILURE.set_type_name */
void T85f11(GE_context* ac, T0* C, T0* a1)
{
	((T85*)(C))->a5 = a1;
}

/* VOID_ASSIGNED_TO_EXPANDED.set_type_name */
void T84f11(GE_context* ac, T0* C, T0* a1)
{
	((T84*)(C))->a5 = a1;
}

/* EXTERNAL_FAILURE.set_type_name */
void T83f11(GE_context* ac, T0* C, T0* a1)
{
	((T83*)(C))->a5 = a1;
}

/* CREATE_ON_DEFERRED.set_type_name */
void T82f11(GE_context* ac, T0* C, T0* a1)
{
	((T82*)(C))->a5 = a1;
}

/* RESUMPTION_FAILURE.set_type_name */
void T81f11(GE_context* ac, T0* C, T0* a1)
{
	((T81*)(C))->a5 = a1;
}

/* RESCUE_FAILURE.set_type_name */
void T80f11(GE_context* ac, T0* C, T0* a1)
{
	((T80*)(C))->a5 = a1;
}

/* LOOP_INVARIANT_VIOLATION.set_type_name */
void T79f11(GE_context* ac, T0* C, T0* a1)
{
	((T79*)(C))->a5 = a1;
}

/* VARIANT_VIOLATION.set_type_name */
void T78f11(GE_context* ac, T0* C, T0* a1)
{
	((T78*)(C))->a5 = a1;
}

/* BAD_INSPECT_VALUE.set_type_name */
void T77f11(GE_context* ac, T0* C, T0* a1)
{
	((T77*)(C))->a5 = a1;
}

/* CHECK_VIOLATION.set_type_name */
void T76f11(GE_context* ac, T0* C, T0* a1)
{
	((T76*)(C))->a5 = a1;
}

/* FLOATING_POINT_FAILURE.set_type_name */
void T75f11(GE_context* ac, T0* C, T0* a1)
{
	((T75*)(C))->a5 = a1;
}

/* POSTCONDITION_VIOLATION.set_type_name */
void T74f11(GE_context* ac, T0* C, T0* a1)
{
	((T74*)(C))->a5 = a1;
}

/* PRECONDITION_VIOLATION.set_type_name */
void T73f11(GE_context* ac, T0* C, T0* a1)
{
	((T73*)(C))->a5 = a1;
}

/* EIFFEL_RUNTIME_PANIC.set_type_name */
void T70f14(GE_context* ac, T0* C, T0* a1)
{
	((T70*)(C))->a6 = a1;
}

/* COM_FAILURE.set_type_name */
void T69f19(GE_context* ac, T0* C, T0* a1)
{
	((T69*)(C))->a8 = a1;
}

/* OPERATING_SYSTEM_FAILURE.set_type_name */
void T68f13(GE_context* ac, T0* C, T0* a1)
{
	((T68*)(C))->a6 = a1;
}

/* IO_FAILURE.set_type_name */
void T67f15(GE_context* ac, T0* C, T0* a1)
{
	((T67*)(C))->a7 = a1;
}

/* OPERATING_SYSTEM_SIGNAL_FAILURE.set_type_name */
void T66f13(GE_context* ac, T0* C, T0* a1)
{
	((T66*)(C))->a6 = a1;
}

/* INVARIANT_VIOLATION.set_type_name */
void T65f13(GE_context* ac, T0* C, T0* a1)
{
	((T65*)(C))->a6 = a1;
}

/* NO_MORE_MEMORY.set_type_name */
void T64f14(GE_context* ac, T0* C, T0* a1)
{
	((T64*)(C))->a6 = a1;
}

/* OLD_VIOLATION.set_type_name */
void T62f11(GE_context* ac, T0* C, T0* a1)
{
	((T62*)(C))->a5 = a1;
}

/* ROUTINE_FAILURE.set_type_name */
void T60f15(GE_context* ac, T0* C, T0* a1)
{
	((T60*)(C))->a7 = a1;
}

/* VOID_TARGET.set_type_name */
void T58f11(GE_context* ac, T0* C, T0* a1)
{
	((T58*)(C))->a5 = a1;
}

/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].labeled */
T1 T632f3(GE_context* ac, T0* C, T6 a1)
{
	T1 R = 0;
	R = (((((((T632*)(C))->a1) == (a1)))));
	return R;
}

/* LX_EPSILON_TRANSITION [LX_NFA_STATE].labeled */
T1 T630f2(GE_context* ac, T0* C, T6 a1)
{
	T1 R = 0;
	return R;
}

/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].labeled */
T1 T628f3(GE_context* ac, T0* C, T6 a1)
{
	T1 t1;
	T1 R = 0;
	t1 = (((T577*)(GE_void(((T628*)(C))->a1)))->a5);
	if (t1) {
		t1 = (T577f9(ac, GE_void(((T628*)(C))->a1), a1));
		R = ((T1)(!(t1)));
	} else {
		R = (T577f9(ac, GE_void(((T628*)(C))->a1), a1));
	}
	return R;
}

/* GEANT_REPLACE_TASK.is_executable */
T1 T384f18(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T481f14(ac, GE_void(((T384*)(C))->a1)));
	return R;
}

/* GEANT_REPLACE_COMMAND.is_executable */
T1 T481f14(GE_context* ac, T0* C)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T0* t4;
	T1 R = 0;
	t1 = (T481f15(ac, C));
	t2 = (T481f16(ac, C));
	t3 = (T481f17(ac, C));
	t4 = GE_ma545((T6)2,(T6)2,
(int)(t2),
(int)(t3));
	R = (T544f1(ac, GE_void(t1), t4));
	return R;
}

/* KL_BOOLEAN_ROUTINES.nxor */
T1 T544f1(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	l1 = (((T545*)(a1))->a2);
	l2 = (((T545*)(a1))->a3);
	while (1) {
		t1 = (T6f1(ac, (&l1), l2));
		if (t1) {
			break;
		}
		t1 = (T545f4(ac, a1, l1));
		if (t1) {
			if (R) {
				R = EIF_FALSE;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				R = EIF_TRUE;
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* GEANT_REPLACE_COMMAND.is_fileset_to_directory_executable */
T1 T481f17(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = ((((T481*)(C))->a11)!=(EIF_VOID));
	return R;
}

/* GEANT_REPLACE_COMMAND.boolean_ */
unsigned char ge123os5715 = '\0';
T0* ge123ov5715;
T0* T481f15(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge123os5715) {
		return ge123ov5715;
	} else {
		ge123os5715 = '\1';
		ge123ov5715 = R;
	}
	R = T544c2(ac);
	ge123ov5715 = R;
	return R;
}

/* KL_BOOLEAN_ROUTINES.default_create */
T0* T544c2(GE_context* ac)
{
	T0* C;
	C = GE_new544(EIF_TRUE);
	return C;
}

/* GEANT_INPUT_TASK.is_executable */
T1 T382f20(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T479f11(ac, GE_void(((T382*)(C))->a1)));
	return R;
}

/* GEANT_INPUT_COMMAND.is_executable */
T1 T479f11(GE_context* ac, T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T479*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T479*)(C))->a3)))->id==17)?((T17*)(((T479*)(C))->a3))->a2:((T265*)(((T479*)(C))->a3))->a1));
		t1 = (T6f1(ac, &t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		R = ((((T479*)(C))->a4)!=(EIF_VOID));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_AVAILABLE_TASK.is_executable */
T1 T380f6(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T477f9(ac, GE_void(((T380*)(C))->a1)));
	return R;
}

/* GEANT_AVAILABLE_COMMAND.is_executable */
T1 T477f9(GE_context* ac, T0* C)
{
	T1 t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T0* l1 = 0;
	l1 = T540c2(ac, EIF_TRUE);
	t1 = (T428f5(ac, GE_void(((T477*)(C))->a1)));
	T477f20(ac, C, t1, GE_ms8("  [available] error: \'resource\' is not defined", 46), l1);
	t1 = (((T540*)(GE_void(l1)))->a1);
	if (t1) {
		t2 = (T428f6(ac, GE_void(((T477*)(C))->a1)));
		t3 = (((((T0*)(GE_void(t2)))->id==17)?T17f30(ac, t2):T265f53(ac, t2)));
		t1 = ((T1)(!(t3)));
	}
	T477f20(ac, C, t1, GE_ms8("  [available] error: \'resource\' is empty", 40), l1);
	t1 = (((T540*)(GE_void(l1)))->a1);
	if (t1) {
		t1 = (T428f5(ac, GE_void(((T477*)(C))->a2)));
	}
	T477f20(ac, C, t1, GE_ms8("  [available] error: \'variable\' is not defined", 46), l1);
	t1 = (((T540*)(GE_void(l1)))->a1);
	if (t1) {
		t2 = (T428f6(ac, GE_void(((T477*)(C))->a2)));
		t3 = (((((T0*)(GE_void(t2)))->id==17)?T17f30(ac, t2):T265f53(ac, t2)));
		t1 = ((T1)(!(t3)));
	}
	T477f20(ac, C, t1, GE_ms8("  [available] error: \'variable\' is empty", 40), l1);
	R = (((T540*)(GE_void(l1)))->a1);
	return R;
}

/* GEANT_AVAILABLE_COMMAND.validate_condition */
void T477f20(GE_context* ac, T0* C, T1 a1, T0* a2, T0* a3)
{
	T1 t1;
	T0* t2;
	t1 = (((T540*)(GE_void(a3)))->a1);
	if (t1) {
		t1 = ((T1)(!(a1)));
		if (t1) {
			T540f3(ac, GE_void(a3), EIF_FALSE);
			t2 = (T477f16(ac, C));
			T110f26(ac, GE_void(t2), a2);
		}
	}
}

/* GEANT_AVAILABLE_COMMAND.validation_messages */
T0* T477f16(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge10os1964) {
		return ge10ov1964;
	} else {
		ge10os1964 = '\1';
		ge10ov1964 = R;
	}
	R = T110c22(ac, (T6)(GE_int32(5)));
	ge10ov1964 = R;
	return R;
}

/* DS_CELL [BOOLEAN].put */
void T540f3(GE_context* ac, T0* C, T1 a1)
{
	((T540*)(C))->a1 = a1;
}

/* DS_CELL [BOOLEAN].make */
T0* T540c2(GE_context* ac, T1 a1)
{
	T0* C;
	C = GE_new540(EIF_TRUE);
	((T540*)(C))->a1 = a1;
	return C;
}

/* GEANT_PRECURSOR_TASK.is_executable */
T1 T378f17(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T475f7(ac, GE_void(((T378*)(C))->a1)));
	return R;
}

/* GEANT_PRECURSOR_COMMAND.is_executable */
T1 T475f7(GE_context* ac, T0* C)
{
	T0* t1;
	T1 t2;
	T1 R = 0;
	t1 = (T29f22(ac, GE_void(((T475*)(C))->a3)));
	t1 = (((T33*)(GE_void(t1)))->a14);
	R = ((t1)!=(EIF_VOID));
	t2 = ((T1)(!(R)));
	if (t2) {
		t1 = GE_ma40((T6)1,(T6)1,
GE_ms8("  [precursor] error: precursor does not exist.", 46));
		T29f50(ac, GE_void(((T475*)(C))->a3), t1);
	}
	return R;
}

/* GEANT_EXIT_TASK.is_executable */
T1 T376f10(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T473f6(ac, GE_void(((T376*)(C))->a1)));
	return R;
}

/* GEANT_EXIT_COMMAND.is_executable */
T1 T473f6(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* GEANT_OUTOFDATE_TASK.is_executable */
T1 T374f15(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T471f11(ac, GE_void(((T374*)(C))->a1)));
	return R;
}

/* GEANT_OUTOFDATE_COMMAND.is_executable */
T1 T471f11(GE_context* ac, T0* C)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = (T471f12(ac, C));
	t2 = (T471f13(ac, C));
	R = ((T1)((t1)^(t2)));
	return R;
}

/* GEANT_OUTOFDATE_COMMAND.is_fileset_executable */
T1 T471f13(GE_context* ac, T0* C)
{
	T1 t1;
	T1 R = 0;
	R = ((((T471*)(C))->a3)==(EIF_VOID));
	if (R) {
		R = ((((T471*)(C))->a4)==(EIF_VOID));
	} else {
		R = EIF_FALSE;
	}
	if (R) {
		t1 = ((((T471*)(C))->a8)!=(EIF_VOID));
	} else {
		t1 = EIF_FALSE;
	}
	if (t1) {
		R = (T432f19(ac, GE_void(((T471*)(C))->a8)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_XSLT_TASK.is_executable */
T1 T372f29(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T468f17(ac, GE_void(((T372*)(C))->a1)));
	return R;
}

/* GEANT_XSLT_COMMAND.is_executable */
T1 T468f17(GE_context* ac, T0* C)
{
	T1 t1;
	T6 t2;
	T1 t3;
	T1 R = 0;
	t1 = ((((T468*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T468*)(C))->a4)))->id==17)?((T17*)(((T468*)(C))->a4))->a2:((T265*)(((T468*)(C))->a4))->a1));
		t1 = (T6f1(ac, &t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		t3 = ((((T468*)(C))->a5)!=(EIF_VOID));
		if (t3) {
			t2 = (((((T0*)(GE_void(((T468*)(C))->a5)))->id==17)?((T17*)(((T468*)(C))->a5))->a2:((T265*)(((T468*)(C))->a5))->a1));
			t1 = (T6f1(ac, &t2, (T6)(GE_int32(0))));
		} else {
			t1 = EIF_FALSE;
		}
	}
	if (t1) {
		t1 = ((((T468*)(C))->a7)!=(EIF_VOID));
		if (t1) {
			t2 = (((((T0*)(GE_void(((T468*)(C))->a7)))->id==17)?((T17*)(((T468*)(C))->a7))->a2:((T265*)(((T468*)(C))->a7))->a1));
			R = (T6f1(ac, &t2, (T6)(GE_int32(0))));
		} else {
			R = EIF_FALSE;
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_SETENV_TASK.is_executable */
T1 T370f11(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T465f7(ac, GE_void(((T370*)(C))->a1)));
	return R;
}

/* GEANT_SETENV_COMMAND.is_executable */
T1 T465f7(GE_context* ac, T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T465*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T465*)(C))->a3)))->id==17)?((T17*)(((T465*)(C))->a3))->a2:((T265*)(((T465*)(C))->a3))->a1));
		t1 = (T6f1(ac, &t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		R = ((((T465*)(C))->a4)!=(EIF_VOID));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_MOVE_TASK.is_executable */
T1 T368f13(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T463f9(ac, GE_void(((T368*)(C))->a1)));
	return R;
}

/* GEANT_MOVE_COMMAND.is_executable */
T1 T463f9(GE_context* ac, T0* C)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = (T463f10(ac, C));
	if (t1) {
		t2 = (T463f11(ac, C));
		t1 = ((T1)(!(t2)));
	}
	if (t1) {
		t2 = (T463f12(ac, C));
		t1 = ((T1)(!(t2)));
	}
	if (!(t1)) {
		t2 = (T463f10(ac, C));
		t2 = ((T1)(!(t2)));
		if (t2) {
			t2 = (T463f11(ac, C));
		}
		if (t2) {
			t2 = (T463f12(ac, C));
			t1 = ((T1)(!(t2)));
		} else {
			t1 = EIF_FALSE;
		}
	}
	if (!(t1)) {
		t1 = (T463f10(ac, C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t2 = (T463f11(ac, C));
			t1 = ((T1)(!(t2)));
		}
		if (t1) {
			R = (T463f12(ac, C));
		} else {
			R = EIF_FALSE;
		}
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* GEANT_MOVE_COMMAND.is_fileset_to_directory_executable */
T1 T463f12(GE_context* ac, T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T463*)(C))->a6)!=(EIF_VOID));
	if (t1) {
		t1 = ((((T463*)(C))->a5)!=(EIF_VOID));
	}
	if (t1) {
		t2 = (((((T0*)(GE_void(((T463*)(C))->a5)))->id==17)?((T17*)(((T463*)(C))->a5))->a2:((T265*)(((T463*)(C))->a5))->a1));
		R = (T6f1(ac, &t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_COPY_TASK.is_executable */
T1 T366f19(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T461f10(ac, GE_void(((T366*)(C))->a1)));
	return R;
}

/* GEANT_COPY_COMMAND.is_executable */
T1 T461f10(GE_context* ac, T0* C)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	T0* t5;
	T1 R = 0;
	t1 = (T461f11(ac, C));
	t2 = (T461f12(ac, C));
	t3 = (T461f13(ac, C));
	t4 = (T461f14(ac, C));
	t5 = GE_ma545((T6)3,(T6)3,
(int)(t2),
(int)(t3),
(int)(t4));
	R = (T544f1(ac, GE_void(t1), t5));
	return R;
}

/* GEANT_COPY_COMMAND.is_fileset_to_directory_executable */
T1 T461f14(GE_context* ac, T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T461*)(C))->a7)!=(EIF_VOID));
	if (t1) {
		t1 = ((((T461*)(C))->a5)!=(EIF_VOID));
	}
	if (t1) {
		t2 = (((((T0*)(GE_void(((T461*)(C))->a5)))->id==17)?((T17*)(((T461*)(C))->a5))->a2:((T265*)(((T461*)(C))->a5))->a1));
		R = (T6f1(ac, &t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_COPY_COMMAND.boolean_ */
T0* T461f11(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge123os5715) {
		return ge123ov5715;
	} else {
		ge123os5715 = '\1';
		ge123ov5715 = R;
	}
	R = T544c2(ac);
	ge123ov5715 = R;
	return R;
}

/* GEANT_DELETE_TASK.is_executable */
T1 T364f19(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T458f10(ac, GE_void(((T364*)(C))->a1)));
	return R;
}

/* GEANT_DELETE_COMMAND.is_executable */
T1 T458f10(GE_context* ac, T0* C)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	T0* t5;
	T1 R = 0;
	t1 = (T458f11(ac, C));
	t2 = (T458f12(ac, C));
	t3 = (T458f13(ac, C));
	t4 = (T458f14(ac, C));
	if (!(t4)) {
		t4 = (T458f15(ac, C));
	}
	t5 = GE_ma545((T6)3,(T6)3,
(int)(t2),
(int)(t3),
(int)(t4));
	R = (T544f1(ac, GE_void(t1), t5));
	return R;
}

/* GEANT_DELETE_COMMAND.boolean_ */
T0* T458f11(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge123os5715) {
		return ge123ov5715;
	} else {
		ge123os5715 = '\1';
		ge123ov5715 = R;
	}
	R = T544c2(ac);
	ge123ov5715 = R;
	return R;
}

/* GEANT_MKDIR_TASK.is_executable */
T1 T362f6(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T455f8(ac, GE_void(((T362*)(C))->a1)));
	return R;
}

/* GEANT_MKDIR_COMMAND.is_executable */
T1 T455f8(GE_context* ac, T0* C)
{
	T1 t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T0* l1 = 0;
	l1 = T540c2(ac, EIF_TRUE);
	t1 = (T428f5(ac, GE_void(((T455*)(C))->a1)));
	T455f17(ac, C, t1, GE_ms8("  [mkdir] error: \'directory\' is not defined", 43), l1);
	t1 = (((T540*)(GE_void(l1)))->a1);
	if (t1) {
		t2 = (T428f6(ac, GE_void(((T455*)(C))->a1)));
		t3 = (((((T0*)(GE_void(t2)))->id==17)?T17f30(ac, t2):T265f53(ac, t2)));
		t1 = ((T1)(!(t3)));
	}
	T455f17(ac, C, t1, GE_ms8("  [mkdir] error: \'directory\' is empty", 37), l1);
	R = (((T540*)(GE_void(l1)))->a1);
	return R;
}

/* GEANT_MKDIR_COMMAND.validate_condition */
void T455f17(GE_context* ac, T0* C, T1 a1, T0* a2, T0* a3)
{
	T1 t1;
	T0* t2;
	t1 = (((T540*)(GE_void(a3)))->a1);
	if (t1) {
		t1 = ((T1)(!(a1)));
		if (t1) {
			T540f3(ac, GE_void(a3), EIF_FALSE);
			t2 = (T455f12(ac, C));
			T110f26(ac, GE_void(t2), a2);
		}
	}
}

/* GEANT_MKDIR_COMMAND.validation_messages */
T0* T455f12(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge10os1964) {
		return ge10ov1964;
	} else {
		ge10os1964 = '\1';
		ge10ov1964 = R;
	}
	R = T110c22(ac, (T6)(GE_int32(5)));
	ge10ov1964 = R;
	return R;
}

/* GEANT_ECHO_TASK.is_executable */
T1 T360f6(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T453f9(ac, GE_void(((T360*)(C))->a1)));
	return R;
}

/* GEANT_ECHO_COMMAND.is_executable */
T1 T453f9(GE_context* ac, T0* C)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T0* l1 = 0;
	l1 = T540c2(ac, EIF_TRUE);
	t1 = (T428f5(ac, GE_void(((T453*)(C))->a1)));
	T453f17(ac, C, t1, GE_ms8("  [echo] error: \'message\' is not defined", 40), l1);
	t1 = (((T540*)(GE_void(l1)))->a1);
	if (t1) {
		t1 = (T428f5(ac, GE_void(((T453*)(C))->a2)));
		if (t1) {
			t2 = (T428f6(ac, GE_void(((T453*)(C))->a2)));
			t1 = (((((T0*)(GE_void(t2)))->id==17)?T17f30(ac, t2):T265f53(ac, t2)));
			t1 = ((T1)(!(t1)));
			T453f17(ac, C, t1, GE_ms8("  [echo] error: \'to_file\' may not be empty", 42), l1);
		}
	}
	R = (((T540*)(GE_void(l1)))->a1);
	return R;
}

/* GEANT_ECHO_COMMAND.validate_condition */
void T453f17(GE_context* ac, T0* C, T1 a1, T0* a2, T0* a3)
{
	T1 t1;
	T0* t2;
	t1 = (((T540*)(GE_void(a3)))->a1);
	if (t1) {
		t1 = ((T1)(!(a1)));
		if (t1) {
			T540f3(ac, GE_void(a3), EIF_FALSE);
			t2 = (T453f11(ac, C));
			T110f26(ac, GE_void(t2), a2);
		}
	}
}

/* GEANT_ECHO_COMMAND.validation_messages */
T0* T453f11(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge10os1964) {
		return ge10ov1964;
	} else {
		ge10os1964 = '\1';
		ge10ov1964 = R;
	}
	R = T110c22(ac, (T6)(GE_int32(5)));
	ge10ov1964 = R;
	return R;
}

/* GEANT_GEANT_TASK.is_executable */
T1 T358f25(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T451f13(ac, GE_void(((T358*)(C))->a1)));
	return R;
}

/* GEANT_GEANT_COMMAND.is_executable */
T1 T451f13(GE_context* ac, T0* C)
{
	T1 t1;
	T1 R = 0;
	t1 = (T451f14(ac, C));
	if (!(t1)) {
		R = (T451f15(ac, C));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* GEANT_GEANT_COMMAND.is_target_executable */
T1 T451f15(GE_context* ac, T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T451*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T451*)(C))->a4)))->id==17)?((T17*)(((T451*)(C))->a4))->a2:((T265*)(((T451*)(C))->a4))->a1));
		R = (T6f1(ac, &t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GETEST_TASK.is_executable */
T1 T356f27(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T449f16(ac, GE_void(((T356*)(C))->a1)));
	return R;
}

/* GEANT_GETEST_COMMAND.is_executable */
T1 T449f16(GE_context* ac, T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T449*)(C))->a8)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T449*)(C))->a8)))->id==17)?((T17*)(((T449*)(C))->a8))->a2:((T265*)(((T449*)(C))->a8))->a1));
		R = (T6f1(ac, &t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEPP_TASK.is_executable */
T1 T354f22(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T447f12(ac, GE_void(((T354*)(C))->a1)));
	return R;
}

/* GEANT_GEPP_COMMAND.is_executable */
T1 T447f12(GE_context* ac, T0* C)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = (T447f13(ac, C));
	t2 = (T447f14(ac, C));
	R = ((T1)((t1)^(t2)));
	return R;
}

/* GEANT_GEPP_COMMAND.is_fileset_executable */
T1 T447f14(GE_context* ac, T0* C)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	t1 = ((((T447*)(C))->a9)!=(EIF_VOID));
	if (t1) {
		t2 = (((T432*)(GE_void(((T447*)(C))->a9)))->a18);
		R = ((t2)!=(EIF_VOID));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEYACC_TASK.is_executable */
T1 T352f23(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T445f13(ac, GE_void(((T352*)(C))->a1)));
	return R;
}

/* GEANT_GEYACC_COMMAND.is_executable */
T1 T445f13(GE_context* ac, T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T445*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T445*)(C))->a4)))->id==17)?((T17*)(((T445*)(C))->a4))->a2:((T265*)(((T445*)(C))->a4))->a1));
		R = (T6f1(ac, &t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GELEX_TASK.is_executable */
T1 T350f27(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T443f17(ac, GE_void(((T350*)(C))->a1)));
	return R;
}

/* GEANT_GELEX_COMMAND.is_executable */
T1 T443f17(GE_context* ac, T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T443*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T443*)(C))->a4)))->id==17)?((T17*)(((T443*)(C))->a4))->a2:((T265*)(((T443*)(C))->a4))->a1));
		t1 = (T6f1(ac, &t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		if (((T443*)(C))->a10) {
			R = ((T1)(!(((T443*)(C))->a7)));
		} else {
			R = EIF_TRUE;
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEXACE_TASK.is_executable */
T1 T348f23(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T441f13(ac, GE_void(((T348*)(C))->a1)));
	return R;
}

/* GEANT_GEXACE_COMMAND.is_executable */
T1 T441f13(GE_context* ac, T0* C)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	T0* t5;
	T1 R = 0;
	t1 = (T441f14(ac, C));
	t2 = (T441f15(ac, C));
	t3 = (T441f16(ac, C));
	t4 = (T441f17(ac, C));
	t5 = GE_ma545((T6)3,(T6)3,
(int)(t2),
(int)(t3),
(int)(t4));
	R = (T544f1(ac, GE_void(t1), t5));
	return R;
}

/* GEANT_GEXACE_COMMAND.boolean_ */
T0* T441f14(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge123os5715) {
		return ge123ov5715;
	} else {
		ge123os5715 = '\1';
		ge123ov5715 = R;
	}
	R = T544c2(ac);
	ge123ov5715 = R;
	return R;
}

/* GEANT_UNSET_TASK.is_executable */
T1 T346f10(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T438f6(ac, GE_void(((T346*)(C))->a1)));
	return R;
}

/* GEANT_UNSET_COMMAND.is_executable */
T1 T438f6(GE_context* ac, T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T438*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T438*)(C))->a3)))->id==17)?((T17*)(((T438*)(C))->a3))->a2:((T265*)(((T438*)(C))->a3))->a1));
		R = (T6f1(ac, &t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_SET_TASK.is_executable */
T1 T344f11(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T436f7(ac, GE_void(((T344*)(C))->a1)));
	return R;
}

/* GEANT_SET_COMMAND.is_executable */
T1 T436f7(GE_context* ac, T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T436*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T436*)(C))->a3)))->id==17)?((T17*)(((T436*)(C))->a3))->a2:((T265*)(((T436*)(C))->a3))->a1));
		t1 = (T6f1(ac, &t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		R = ((((T436*)(C))->a4)!=(EIF_VOID));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_LCC_TASK.is_executable */
T1 T342f11(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T434f7(ac, GE_void(((T342*)(C))->a1)));
	return R;
}

/* GEANT_LCC_COMMAND.is_executable */
T1 T434f7(GE_context* ac, T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T434*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T434*)(C))->a3)))->id==17)?((T17*)(((T434*)(C))->a3))->a2:((T265*)(((T434*)(C))->a3))->a1));
		t1 = (T6f1(ac, &t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		t1 = ((((T434*)(C))->a4)!=(EIF_VOID));
		if (t1) {
			t2 = (((((T0*)(GE_void(((T434*)(C))->a4)))->id==17)?((T17*)(((T434*)(C))->a4))->a2:((T265*)(((T434*)(C))->a4))->a1));
			R = (T6f1(ac, &t2, (T6)(GE_int32(0))));
		} else {
			R = EIF_FALSE;
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_EXEC_TASK.is_executable */
T1 T340f7(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T427f9(ac, GE_void(((T340*)(C))->a1)));
	return R;
}

/* GEANT_EXEC_COMMAND.is_executable */
T1 T427f9(GE_context* ac, T0* C)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T0* l1 = 0;
	l1 = T540c2(ac, EIF_TRUE);
	t1 = (T428f5(ac, GE_void(((T427*)(C))->a1)));
	T427f17(ac, C, t1, GE_ms8("  [echo] error: \'executable\' is not defined", 43), l1);
	t1 = (((T540*)(GE_void(l1)))->a1);
	if (t1) {
		t2 = (T428f6(ac, GE_void(((T427*)(C))->a1)));
		t1 = (((((T0*)(GE_void(t2)))->id==17)?T17f30(ac, t2):T265f53(ac, t2)));
		t1 = ((T1)(!(t1)));
		T427f17(ac, C, t1, GE_ms8("  [echo] error: \'executable\' is empty", 37), l1);
	}
	t1 = (((T540*)(GE_void(l1)))->a1);
	if (t1) {
		t1 = ((((T427*)(C))->a6)==(EIF_VOID));
		if (t1) {
			((T427*)(C))->a8 = EIF_TRUE;
			t1 = (T428f5(ac, GE_void(((T427*)(C))->a2)));
			if (t1) {
				t2 = (T428f6(ac, GE_void(((T427*)(C))->a2)));
				t1 = (((((T0*)(GE_void(t2)))->id==17)?T17f30(ac, t2):T265f53(ac, t2)));
				t1 = ((T1)(!(t1)));
				T427f17(ac, C, t1, GE_ms8("  [echo] error: \'exit_code_variable\' may not be empty", 53), l1);
			}
		} else {
			((T427*)(C))->a8 = EIF_FALSE;
			t1 = (T428f5(ac, GE_void(((T427*)(C))->a2)));
			t1 = ((T1)(!(t1)));
			T427f17(ac, C, t1, GE_ms8("  [echo] error: \'exit_code_variable\' may not be defined together with \'fileset\'", 79), l1);
		}
	}
	R = (((T540*)(GE_void(l1)))->a1);
	return R;
}

/* GEANT_EXEC_COMMAND.validate_condition */
void T427f17(GE_context* ac, T0* C, T1 a1, T0* a2, T0* a3)
{
	T1 t1;
	T0* t2;
	t1 = (((T540*)(GE_void(a3)))->a1);
	if (t1) {
		t1 = ((T1)(!(a1)));
		if (t1) {
			T540f3(ac, GE_void(a3), EIF_FALSE);
			t2 = (T427f12(ac, C));
			T110f26(ac, GE_void(t2), a2);
		}
	}
}

/* GEANT_EXEC_COMMAND.validation_messages */
T0* T427f12(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge10os1964) {
		return ge10ov1964;
	} else {
		ge10os1964 = '\1';
		ge10ov1964 = R;
	}
	R = T110c22(ac, (T6)(GE_int32(5)));
	ge10ov1964 = R;
	return R;
}

/* GEANT_ISE_TASK.is_executable */
T1 T338f24(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T424f13(ac, GE_void(((T338*)(C))->a1)));
	return R;
}

/* GEANT_ISE_COMMAND.is_executable */
T1 T424f13(GE_context* ac, T0* C)
{
	T1 t1;
	T1 t2;
	T6 t3;
	T1 R = 0;
	t1 = (T424f14(ac, C));
	t2 = (T424f15(ac, C));
	R = ((T1)((t1)^(t2)));
	if (R) {
		t1 = ((((T424*)(C))->a10)==(EIF_VOID));
		if (!(t1)) {
			t3 = (((((T0*)(GE_void(((T424*)(C))->a10)))->id==17)?((T17*)(((T424*)(C))->a10))->a2:((T265*)(((T424*)(C))->a10))->a1));
			R = (T6f1(ac, &t3, (T6)(GE_int32(0))));
		} else {
			R = EIF_TRUE;
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_ISE_COMMAND.is_cleanable */
T1 T424f15(GE_context* ac, T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T424*)(C))->a5)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T424*)(C))->a5)))->id==17)?((T17*)(((T424*)(C))->a5))->a2:((T265*)(((T424*)(C))->a5))->a1));
		R = (T6f1(ac, &t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEC_TASK.is_executable */
T1 T332f25(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T420f15(ac, GE_void(((T332*)(C))->a1)));
	return R;
}

/* GEANT_GEC_COMMAND.is_executable */
T1 T420f15(GE_context* ac, T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = (T420f16(ac, C));
	if (!(t1)) {
		R = (T420f17(ac, C));
	} else {
		R = EIF_TRUE;
	}
	if (R) {
		t1 = ((((T420*)(C))->a12)==(EIF_VOID));
		if (!(t1)) {
			t2 = (((((T0*)(GE_void(((T420*)(C))->a12)))->id==17)?((T17*)(((T420*)(C))->a12))->a2:((T265*)(((T420*)(C))->a12))->a1));
			R = (T6f1(ac, &t2, (T6)(GE_int32(0))));
		} else {
			R = EIF_TRUE;
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_REPLACE_TASK.is_enabled */
T1 T384f19(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T384f17(ac, C));
	t2 = (((T29*)(GE_void(((T384*)(C))->a3)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T384f22(ac, C));
	t3 = (T384f10(ac, C, t1));
	if (t3) {
		t1 = (T384f22(ac, C));
		t1 = (T144f13(ac, GE_void(((T384*)(C))->a2), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T384f17(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T384*)(C))->a3), t1);
	}
	t1 = (T384f23(ac, C));
	t3 = (T384f10(ac, C, t1));
	if (t3) {
		t1 = (T384f23(ac, C));
		t1 = (T144f13(ac, GE_void(((T384*)(C))->a2), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T384f17(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T384*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_REPLACE_TASK.unless_attribute_name */
T0* T384f23(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_REPLACE_TASK.if_attribute_name */
T0* T384f22(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_INPUT_TASK.is_enabled */
T1 T382f21(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T382f19(ac, C));
	t2 = (((T29*)(GE_void(((T382*)(C))->a3)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T382f24(ac, C));
	t3 = (T382f11(ac, C, t1));
	if (t3) {
		t1 = (T382f24(ac, C));
		t1 = (T144f13(ac, GE_void(((T382*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T382f19(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T382*)(C))->a3), t1);
	}
	t1 = (T382f25(ac, C));
	t3 = (T382f11(ac, C, t1));
	if (t3) {
		t1 = (T382f25(ac, C));
		t1 = (T144f13(ac, GE_void(((T382*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T382f19(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T382*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_INPUT_TASK.unless_attribute_name */
T0* T382f25(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_INPUT_TASK.if_attribute_name */
T0* T382f24(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_AVAILABLE_TASK.is_enabled */
T1 T380f7(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T380f10(ac, C));
	t2 = (((T29*)(GE_void(((T380*)(C))->a3)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T380f11(ac, C));
	t3 = (T380f12(ac, C, t1));
	if (t3) {
		t1 = (T380f11(ac, C));
		t1 = (T144f13(ac, GE_void(((T380*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T380f10(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T380*)(C))->a3), t1);
	}
	t1 = (T380f13(ac, C));
	t3 = (T380f12(ac, C, t1));
	if (t3) {
		t1 = (T380f13(ac, C));
		t1 = (T144f13(ac, GE_void(((T380*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T380f10(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T380*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_AVAILABLE_TASK.unless_attribute_name */
T0* T380f13(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_AVAILABLE_TASK.has_attribute */
T1 T380f12(GE_context* ac, T0* C, T0* a1)
{
	T1 R = 0;
	R = (T144f12(ac, GE_void(((T380*)(C))->a4), a1));
	return R;
}

/* GEANT_AVAILABLE_TASK.if_attribute_name */
T0* T380f11(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_PRECURSOR_TASK.is_enabled */
T1 T378f18(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T378f16(ac, C));
	t2 = (((T29*)(GE_void(((T378*)(C))->a2)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T378f21(ac, C));
	t3 = (T378f9(ac, C, t1));
	if (t3) {
		t1 = (T378f21(ac, C));
		t1 = (T144f13(ac, GE_void(((T378*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T378f16(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T378*)(C))->a2), t1);
	}
	t1 = (T378f22(ac, C));
	t3 = (T378f9(ac, C, t1));
	if (t3) {
		t1 = (T378f22(ac, C));
		t1 = (T144f13(ac, GE_void(((T378*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T378f16(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T378*)(C))->a2), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_PRECURSOR_TASK.unless_attribute_name */
T0* T378f22(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_PRECURSOR_TASK.if_attribute_name */
T0* T378f21(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_EXIT_TASK.is_enabled */
T1 T376f11(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T376f9(ac, C));
	t2 = (((T29*)(GE_void(((T376*)(C))->a3)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T376f14(ac, C));
	t3 = (T376f5(ac, C, t1));
	if (t3) {
		t1 = (T376f14(ac, C));
		t1 = (T144f13(ac, GE_void(((T376*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T376f9(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T376*)(C))->a3), t1);
	}
	t1 = (T376f15(ac, C));
	t3 = (T376f5(ac, C, t1));
	if (t3) {
		t1 = (T376f15(ac, C));
		t1 = (T144f13(ac, GE_void(((T376*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T376f9(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T376*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_EXIT_TASK.unless_attribute_name */
T0* T376f15(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_EXIT_TASK.if_attribute_name */
T0* T376f14(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_OUTOFDATE_TASK.is_enabled */
T1 T374f16(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T374f14(ac, C));
	t2 = (((T29*)(GE_void(((T374*)(C))->a3)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T374f19(ac, C));
	t3 = (T374f9(ac, C, t1));
	if (t3) {
		t1 = (T374f19(ac, C));
		t1 = (T144f13(ac, GE_void(((T374*)(C))->a2), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T374f14(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T374*)(C))->a3), t1);
	}
	t1 = (T374f20(ac, C));
	t3 = (T374f9(ac, C, t1));
	if (t3) {
		t1 = (T374f20(ac, C));
		t1 = (T144f13(ac, GE_void(((T374*)(C))->a2), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T374f14(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T374*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_OUTOFDATE_TASK.unless_attribute_name */
T0* T374f20(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_OUTOFDATE_TASK.if_attribute_name */
T0* T374f19(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_XSLT_TASK.is_enabled */
T1 T372f30(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T372f28(ac, C));
	t2 = (((T29*)(GE_void(((T372*)(C))->a2)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T372f33(ac, C));
	t3 = (T372f18(ac, C, t1));
	if (t3) {
		t1 = (T372f33(ac, C));
		t1 = (T144f13(ac, GE_void(((T372*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T372f28(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T372*)(C))->a2), t1);
	}
	t1 = (T372f34(ac, C));
	t3 = (T372f18(ac, C, t1));
	if (t3) {
		t1 = (T372f34(ac, C));
		t1 = (T144f13(ac, GE_void(((T372*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T372f28(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T372*)(C))->a2), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_XSLT_TASK.unless_attribute_name */
T0* T372f34(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_XSLT_TASK.if_attribute_name */
T0* T372f33(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_SETENV_TASK.is_enabled */
T1 T370f12(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T370f10(ac, C));
	t2 = (((T29*)(GE_void(((T370*)(C))->a3)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T370f15(ac, C));
	t3 = (T370f6(ac, C, t1));
	if (t3) {
		t1 = (T370f15(ac, C));
		t1 = (T144f13(ac, GE_void(((T370*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T370f10(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T370*)(C))->a3), t1);
	}
	t1 = (T370f16(ac, C));
	t3 = (T370f6(ac, C, t1));
	if (t3) {
		t1 = (T370f16(ac, C));
		t1 = (T144f13(ac, GE_void(((T370*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T370f10(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T370*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_SETENV_TASK.unless_attribute_name */
T0* T370f16(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_SETENV_TASK.if_attribute_name */
T0* T370f15(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_MOVE_TASK.is_enabled */
T1 T368f14(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T368f12(ac, C));
	t2 = (((T29*)(GE_void(((T368*)(C))->a3)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T368f17(ac, C));
	t3 = (T368f7(ac, C, t1));
	if (t3) {
		t1 = (T368f17(ac, C));
		t1 = (T144f13(ac, GE_void(((T368*)(C))->a2), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T368f12(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T368*)(C))->a3), t1);
	}
	t1 = (T368f18(ac, C));
	t3 = (T368f7(ac, C, t1));
	if (t3) {
		t1 = (T368f18(ac, C));
		t1 = (T144f13(ac, GE_void(((T368*)(C))->a2), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T368f12(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T368*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_MOVE_TASK.unless_attribute_name */
T0* T368f18(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_MOVE_TASK.if_attribute_name */
T0* T368f17(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_COPY_TASK.is_enabled */
T1 T366f20(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T366f18(ac, C));
	t2 = (((T29*)(GE_void(((T366*)(C))->a3)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T366f23(ac, C));
	t3 = (T366f9(ac, C, t1));
	if (t3) {
		t1 = (T366f23(ac, C));
		t1 = (T144f13(ac, GE_void(((T366*)(C))->a2), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T366f18(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T366*)(C))->a3), t1);
	}
	t1 = (T366f24(ac, C));
	t3 = (T366f9(ac, C, t1));
	if (t3) {
		t1 = (T366f24(ac, C));
		t1 = (T144f13(ac, GE_void(((T366*)(C))->a2), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T366f18(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T366*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_COPY_TASK.unless_attribute_name */
T0* T366f24(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_COPY_TASK.if_attribute_name */
T0* T366f23(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_DELETE_TASK.is_enabled */
T1 T364f20(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T364f18(ac, C));
	t2 = (((T29*)(GE_void(((T364*)(C))->a3)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T364f23(ac, C));
	t3 = (T364f8(ac, C, t1));
	if (t3) {
		t1 = (T364f23(ac, C));
		t1 = (T144f13(ac, GE_void(((T364*)(C))->a2), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T364f18(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T364*)(C))->a3), t1);
	}
	t1 = (T364f24(ac, C));
	t3 = (T364f8(ac, C, t1));
	if (t3) {
		t1 = (T364f24(ac, C));
		t1 = (T144f13(ac, GE_void(((T364*)(C))->a2), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T364f18(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T364*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_DELETE_TASK.unless_attribute_name */
T0* T364f24(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_DELETE_TASK.if_attribute_name */
T0* T364f23(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_MKDIR_TASK.is_enabled */
T1 T362f7(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T362f10(ac, C));
	t2 = (((T29*)(GE_void(((T362*)(C))->a3)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T362f11(ac, C));
	t3 = (T362f12(ac, C, t1));
	if (t3) {
		t1 = (T362f11(ac, C));
		t1 = (T144f13(ac, GE_void(((T362*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T362f10(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T362*)(C))->a3), t1);
	}
	t1 = (T362f13(ac, C));
	t3 = (T362f12(ac, C, t1));
	if (t3) {
		t1 = (T362f13(ac, C));
		t1 = (T144f13(ac, GE_void(((T362*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T362f10(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T362*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_MKDIR_TASK.unless_attribute_name */
T0* T362f13(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_MKDIR_TASK.has_attribute */
T1 T362f12(GE_context* ac, T0* C, T0* a1)
{
	T1 R = 0;
	R = (T144f12(ac, GE_void(((T362*)(C))->a4), a1));
	return R;
}

/* GEANT_MKDIR_TASK.if_attribute_name */
T0* T362f11(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_ECHO_TASK.is_enabled */
T1 T360f7(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T360f10(ac, C));
	t2 = (((T29*)(GE_void(((T360*)(C))->a3)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T360f11(ac, C));
	t3 = (T360f12(ac, C, t1));
	if (t3) {
		t1 = (T360f11(ac, C));
		t1 = (T144f13(ac, GE_void(((T360*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T360f10(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T360*)(C))->a3), t1);
	}
	t1 = (T360f13(ac, C));
	t3 = (T360f12(ac, C, t1));
	if (t3) {
		t1 = (T360f13(ac, C));
		t1 = (T144f13(ac, GE_void(((T360*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T360f10(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T360*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_ECHO_TASK.unless_attribute_name */
T0* T360f13(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_ECHO_TASK.has_attribute */
T1 T360f12(GE_context* ac, T0* C, T0* a1)
{
	T1 R = 0;
	R = (T144f12(ac, GE_void(((T360*)(C))->a4), a1));
	return R;
}

/* GEANT_ECHO_TASK.if_attribute_name */
T0* T360f11(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_GEANT_TASK.is_enabled */
T1 T358f26(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T358f24(ac, C));
	t2 = (((T29*)(GE_void(((T358*)(C))->a3)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T358f29(ac, C));
	t3 = (T358f8(ac, C, t1));
	if (t3) {
		t1 = (T358f29(ac, C));
		t1 = (T144f13(ac, GE_void(((T358*)(C))->a2), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T358f24(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T358*)(C))->a3), t1);
	}
	t1 = (T358f30(ac, C));
	t3 = (T358f8(ac, C, t1));
	if (t3) {
		t1 = (T358f30(ac, C));
		t1 = (T144f13(ac, GE_void(((T358*)(C))->a2), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T358f24(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T358*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEANT_TASK.unless_attribute_name */
T0* T358f30(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_GEANT_TASK.if_attribute_name */
T0* T358f29(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_GETEST_TASK.is_enabled */
T1 T356f28(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T356f24(ac, C));
	t2 = (((T29*)(GE_void(((T356*)(C))->a2)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T356f31(ac, C));
	t3 = (T356f17(ac, C, t1));
	if (t3) {
		t1 = (T356f31(ac, C));
		t1 = (T144f13(ac, GE_void(((T356*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T356f24(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T356*)(C))->a2), t1);
	}
	t1 = (T356f32(ac, C));
	t3 = (T356f17(ac, C, t1));
	if (t3) {
		t1 = (T356f32(ac, C));
		t1 = (T144f13(ac, GE_void(((T356*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T356f24(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T356*)(C))->a2), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GETEST_TASK.unless_attribute_name */
T0* T356f32(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_GETEST_TASK.if_attribute_name */
T0* T356f31(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_GEPP_TASK.is_enabled */
T1 T354f23(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T354f21(ac, C));
	t2 = (((T29*)(GE_void(((T354*)(C))->a2)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T354f26(ac, C));
	t3 = (T354f10(ac, C, t1));
	if (t3) {
		t1 = (T354f26(ac, C));
		t1 = (T144f13(ac, GE_void(((T354*)(C))->a3), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T354f21(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T354*)(C))->a2), t1);
	}
	t1 = (T354f27(ac, C));
	t3 = (T354f10(ac, C, t1));
	if (t3) {
		t1 = (T354f27(ac, C));
		t1 = (T144f13(ac, GE_void(((T354*)(C))->a3), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T354f21(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T354*)(C))->a2), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEPP_TASK.unless_attribute_name */
T0* T354f27(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_GEPP_TASK.if_attribute_name */
T0* T354f26(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_GEYACC_TASK.is_enabled */
T1 T352f24(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T352f22(ac, C));
	t2 = (((T29*)(GE_void(((T352*)(C))->a3)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T352f27(ac, C));
	t3 = (T352f14(ac, C, t1));
	if (t3) {
		t1 = (T352f27(ac, C));
		t1 = (T144f13(ac, GE_void(((T352*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T352f22(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T352*)(C))->a3), t1);
	}
	t1 = (T352f28(ac, C));
	t3 = (T352f14(ac, C, t1));
	if (t3) {
		t1 = (T352f28(ac, C));
		t1 = (T144f13(ac, GE_void(((T352*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T352f22(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T352*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEYACC_TASK.unless_attribute_name */
T0* T352f28(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_GEYACC_TASK.if_attribute_name */
T0* T352f27(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_GELEX_TASK.is_enabled */
T1 T350f28(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T350f26(ac, C));
	t2 = (((T29*)(GE_void(((T350*)(C))->a3)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T350f31(ac, C));
	t3 = (T350f18(ac, C, t1));
	if (t3) {
		t1 = (T350f31(ac, C));
		t1 = (T144f13(ac, GE_void(((T350*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T350f26(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T350*)(C))->a3), t1);
	}
	t1 = (T350f32(ac, C));
	t3 = (T350f18(ac, C, t1));
	if (t3) {
		t1 = (T350f32(ac, C));
		t1 = (T144f13(ac, GE_void(((T350*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T350f26(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T350*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GELEX_TASK.unless_attribute_name */
T0* T350f32(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_GELEX_TASK.if_attribute_name */
T0* T350f31(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_GEXACE_TASK.is_enabled */
T1 T348f24(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T348f18(ac, C));
	t2 = (((T29*)(GE_void(((T348*)(C))->a2)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T348f27(ac, C));
	t3 = (T348f14(ac, C, t1));
	if (t3) {
		t1 = (T348f27(ac, C));
		t1 = (T144f13(ac, GE_void(((T348*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T348f18(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T348*)(C))->a2), t1);
	}
	t1 = (T348f28(ac, C));
	t3 = (T348f14(ac, C, t1));
	if (t3) {
		t1 = (T348f28(ac, C));
		t1 = (T144f13(ac, GE_void(((T348*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T348f18(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T348*)(C))->a2), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEXACE_TASK.unless_attribute_name */
T0* T348f28(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_GEXACE_TASK.if_attribute_name */
T0* T348f27(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_UNSET_TASK.is_enabled */
T1 T346f11(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T346f9(ac, C));
	t2 = (((T29*)(GE_void(((T346*)(C))->a3)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T346f14(ac, C));
	t3 = (T346f5(ac, C, t1));
	if (t3) {
		t1 = (T346f14(ac, C));
		t1 = (T144f13(ac, GE_void(((T346*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T346f9(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T346*)(C))->a3), t1);
	}
	t1 = (T346f15(ac, C));
	t3 = (T346f5(ac, C, t1));
	if (t3) {
		t1 = (T346f15(ac, C));
		t1 = (T144f13(ac, GE_void(((T346*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T346f9(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T346*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_UNSET_TASK.unless_attribute_name */
T0* T346f15(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_UNSET_TASK.if_attribute_name */
T0* T346f14(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_SET_TASK.is_enabled */
T1 T344f12(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T344f10(ac, C));
	t2 = (((T29*)(GE_void(((T344*)(C))->a3)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T344f15(ac, C));
	t3 = (T344f6(ac, C, t1));
	if (t3) {
		t1 = (T344f15(ac, C));
		t1 = (T144f13(ac, GE_void(((T344*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T344f10(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T344*)(C))->a3), t1);
	}
	t1 = (T344f16(ac, C));
	t3 = (T344f6(ac, C, t1));
	if (t3) {
		t1 = (T344f16(ac, C));
		t1 = (T144f13(ac, GE_void(((T344*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T344f10(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T344*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_SET_TASK.unless_attribute_name */
T0* T344f16(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_SET_TASK.if_attribute_name */
T0* T344f15(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_LCC_TASK.is_enabled */
T1 T342f12(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T342f10(ac, C));
	t2 = (((T29*)(GE_void(((T342*)(C))->a3)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T342f15(ac, C));
	t3 = (T342f6(ac, C, t1));
	if (t3) {
		t1 = (T342f15(ac, C));
		t1 = (T144f13(ac, GE_void(((T342*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T342f10(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T342*)(C))->a3), t1);
	}
	t1 = (T342f16(ac, C));
	t3 = (T342f6(ac, C, t1));
	if (t3) {
		t1 = (T342f16(ac, C));
		t1 = (T144f13(ac, GE_void(((T342*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T342f10(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T342*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_LCC_TASK.unless_attribute_name */
T0* T342f16(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_LCC_TASK.if_attribute_name */
T0* T342f15(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_EXEC_TASK.is_enabled */
T1 T340f8(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T340f11(ac, C));
	t2 = (((T29*)(GE_void(((T340*)(C))->a3)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T340f12(ac, C));
	t3 = (T340f13(ac, C, t1));
	if (t3) {
		t1 = (T340f12(ac, C));
		t1 = (T144f13(ac, GE_void(((T340*)(C))->a2), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T340f11(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T340*)(C))->a3), t1);
	}
	t1 = (T340f14(ac, C));
	t3 = (T340f13(ac, C, t1));
	if (t3) {
		t1 = (T340f14(ac, C));
		t1 = (T144f13(ac, GE_void(((T340*)(C))->a2), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T340f11(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T340*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_EXEC_TASK.unless_attribute_name */
T0* T340f14(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_EXEC_TASK.has_attribute */
T1 T340f13(GE_context* ac, T0* C, T0* a1)
{
	T1 R = 0;
	R = (T144f12(ac, GE_void(((T340*)(C))->a2), a1));
	return R;
}

/* GEANT_EXEC_TASK.if_attribute_name */
T0* T340f12(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_ISE_TASK.is_enabled */
T1 T338f25(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T338f23(ac, C));
	t2 = (((T29*)(GE_void(((T338*)(C))->a3)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T338f28(ac, C));
	t3 = (T338f15(ac, C, t1));
	if (t3) {
		t1 = (T338f28(ac, C));
		t1 = (T144f13(ac, GE_void(((T338*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T338f23(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T338*)(C))->a3), t1);
	}
	t1 = (T338f29(ac, C));
	t3 = (T338f15(ac, C, t1));
	if (t3) {
		t1 = (T338f29(ac, C));
		t1 = (T144f13(ac, GE_void(((T338*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T338f23(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T338*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_ISE_TASK.unless_attribute_name */
T0* T338f29(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_ISE_TASK.if_attribute_name */
T0* T338f28(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_GEC_TASK.is_enabled */
T1 T332f26(GE_context* ac, T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T332f24(ac, C));
	t2 = (((T29*)(GE_void(((T332*)(C))->a3)))->a15);
	T100f19(ac, GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T332f29(ac, C));
	t3 = (T332f16(ac, C, t1));
	if (t3) {
		t1 = (T332f29(ac, C));
		t1 = (T144f13(ac, GE_void(((T332*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T332f24(ac, C));
		l1 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l1)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T29f39(ac, GE_void(((T332*)(C))->a3), t1);
	}
	t1 = (T332f30(ac, C));
	t3 = (T332f16(ac, C, t1));
	if (t3) {
		t1 = (T332f30(ac, C));
		t1 = (T144f13(ac, GE_void(((T332*)(C))->a4), t1));
		l3 = (((T257*)(GE_void(t1)))->a3);
		t1 = (T332f24(ac, C));
		l2 = (T100f8(ac, GE_void(t1), l3));
		t1 = (T1f6(ac, (&l2)));
		t1 = GE_ma40((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T29f39(ac, GE_void(((T332*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEC_TASK.unless_attribute_name */
T0* T332f30(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2908) {
		return ge86ov2908;
	} else {
		ge86os2908 = '\1';
		ge86ov2908 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2908 = R;
	return R;
}

/* GEANT_GEC_TASK.if_attribute_name */
T0* T332f29(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge86os2907) {
		return ge86ov2907;
	} else {
		ge86os2907 = '\1';
		ge86ov2907 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2907 = R;
	return R;
}

/* GEANT_REPLACE_TASK.is_exit_command */
T1 T384f20(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T481f13(ac, GE_void(((T384*)(C))->a1)));
	return R;
}

/* GEANT_REPLACE_COMMAND.is_exit_command */
T1 T481f13(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_INPUT_TASK.is_exit_command */
T1 T382f22(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T479f10(ac, GE_void(((T382*)(C))->a1)));
	return R;
}

/* GEANT_INPUT_COMMAND.is_exit_command */
T1 T479f10(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_AVAILABLE_TASK.is_exit_command */
T1 T380f8(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T477f10(ac, GE_void(((T380*)(C))->a1)));
	return R;
}

/* GEANT_AVAILABLE_COMMAND.is_exit_command */
T1 T477f10(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_PRECURSOR_TASK.is_exit_command */
T1 T378f19(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T475f6(ac, GE_void(((T378*)(C))->a1)));
	return R;
}

/* GEANT_PRECURSOR_COMMAND.is_exit_command */
T1 T475f6(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_EXIT_TASK.is_exit_command */
T1 T376f12(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (EIF_TRUE);
	return R;
}

/* GEANT_OUTOFDATE_TASK.is_exit_command */
T1 T374f17(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T471f16(ac, GE_void(((T374*)(C))->a1)));
	return R;
}

/* GEANT_OUTOFDATE_COMMAND.is_exit_command */
T1 T471f16(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_XSLT_TASK.is_exit_command */
T1 T372f31(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T468f18(ac, GE_void(((T372*)(C))->a1)));
	return R;
}

/* GEANT_XSLT_COMMAND.is_exit_command */
T1 T468f18(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_SETENV_TASK.is_exit_command */
T1 T370f13(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T465f6(ac, GE_void(((T370*)(C))->a1)));
	return R;
}

/* GEANT_SETENV_COMMAND.is_exit_command */
T1 T465f6(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_MOVE_TASK.is_exit_command */
T1 T368f15(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T463f8(ac, GE_void(((T368*)(C))->a1)));
	return R;
}

/* GEANT_MOVE_COMMAND.is_exit_command */
T1 T463f8(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_COPY_TASK.is_exit_command */
T1 T366f21(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T461f9(ac, GE_void(((T366*)(C))->a1)));
	return R;
}

/* GEANT_COPY_COMMAND.is_exit_command */
T1 T461f9(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_DELETE_TASK.is_exit_command */
T1 T364f21(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T458f9(ac, GE_void(((T364*)(C))->a1)));
	return R;
}

/* GEANT_DELETE_COMMAND.is_exit_command */
T1 T458f9(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_MKDIR_TASK.is_exit_command */
T1 T362f8(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T455f9(ac, GE_void(((T362*)(C))->a1)));
	return R;
}

/* GEANT_MKDIR_COMMAND.is_exit_command */
T1 T455f9(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_ECHO_TASK.is_exit_command */
T1 T360f8(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T453f10(ac, GE_void(((T360*)(C))->a1)));
	return R;
}

/* GEANT_ECHO_COMMAND.is_exit_command */
T1 T453f10(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_GEANT_TASK.is_exit_command */
T1 T358f27(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T451f12(ac, GE_void(((T358*)(C))->a1)));
	return R;
}

/* GEANT_GEANT_COMMAND.is_exit_command */
T1 T451f12(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_GETEST_TASK.is_exit_command */
T1 T356f29(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T449f15(ac, GE_void(((T356*)(C))->a1)));
	return R;
}

/* GEANT_GETEST_COMMAND.is_exit_command */
T1 T449f15(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_GEPP_TASK.is_exit_command */
T1 T354f24(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T447f11(ac, GE_void(((T354*)(C))->a1)));
	return R;
}

/* GEANT_GEPP_COMMAND.is_exit_command */
T1 T447f11(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_GEYACC_TASK.is_exit_command */
T1 T352f25(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T445f12(ac, GE_void(((T352*)(C))->a1)));
	return R;
}

/* GEANT_GEYACC_COMMAND.is_exit_command */
T1 T445f12(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_GELEX_TASK.is_exit_command */
T1 T350f29(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T443f16(ac, GE_void(((T350*)(C))->a1)));
	return R;
}

/* GEANT_GELEX_COMMAND.is_exit_command */
T1 T443f16(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_GEXACE_TASK.is_exit_command */
T1 T348f25(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T441f12(ac, GE_void(((T348*)(C))->a1)));
	return R;
}

/* GEANT_GEXACE_COMMAND.is_exit_command */
T1 T441f12(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_UNSET_TASK.is_exit_command */
T1 T346f12(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T438f5(ac, GE_void(((T346*)(C))->a1)));
	return R;
}

/* GEANT_UNSET_COMMAND.is_exit_command */
T1 T438f5(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_SET_TASK.is_exit_command */
T1 T344f13(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T436f6(ac, GE_void(((T344*)(C))->a1)));
	return R;
}

/* GEANT_SET_COMMAND.is_exit_command */
T1 T436f6(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_LCC_TASK.is_exit_command */
T1 T342f13(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T434f6(ac, GE_void(((T342*)(C))->a1)));
	return R;
}

/* GEANT_LCC_COMMAND.is_exit_command */
T1 T434f6(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_EXEC_TASK.is_exit_command */
T1 T340f9(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T427f10(ac, GE_void(((T340*)(C))->a1)));
	return R;
}

/* GEANT_EXEC_COMMAND.is_exit_command */
T1 T427f10(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_ISE_TASK.is_exit_command */
T1 T338f26(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T424f12(ac, GE_void(((T338*)(C))->a1)));
	return R;
}

/* GEANT_ISE_COMMAND.is_exit_command */
T1 T424f12(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_GEC_TASK.is_exit_command */
T1 T332f27(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T420f14(ac, GE_void(((T332*)(C))->a1)));
	return R;
}

/* GEANT_GEC_COMMAND.is_exit_command */
T1 T420f14(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_REPLACE_TASK.exit_code */
T6 T384f21(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T481*)(GE_void(((T384*)(C))->a1)))->a12);
	return R;
}

/* GEANT_INPUT_TASK.exit_code */
T6 T382f23(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T479*)(GE_void(((T382*)(C))->a1)))->a9);
	return R;
}

/* GEANT_AVAILABLE_TASK.exit_code */
T6 T380f9(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T477*)(GE_void(((T380*)(C))->a1)))->a8);
	return R;
}

/* GEANT_PRECURSOR_TASK.exit_code */
T6 T378f20(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T475*)(GE_void(((T378*)(C))->a1)))->a5);
	return R;
}

/* GEANT_EXIT_TASK.exit_code */
T6 T376f13(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T473*)(GE_void(((T376*)(C))->a1)))->a4);
	return R;
}

/* GEANT_OUTOFDATE_TASK.exit_code */
T6 T374f18(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T471*)(GE_void(((T374*)(C))->a1)))->a9);
	return R;
}

/* GEANT_XSLT_TASK.exit_code */
T6 T372f32(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T468*)(GE_void(((T372*)(C))->a1)))->a13);
	return R;
}

/* GEANT_SETENV_TASK.exit_code */
T6 T370f14(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T465*)(GE_void(((T370*)(C))->a1)))->a5);
	return R;
}

/* GEANT_MOVE_TASK.exit_code */
T6 T368f16(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T463*)(GE_void(((T368*)(C))->a1)))->a7);
	return R;
}

/* GEANT_COPY_TASK.exit_code */
T6 T366f22(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T461*)(GE_void(((T366*)(C))->a1)))->a8);
	return R;
}

/* GEANT_DELETE_TASK.exit_code */
T6 T364f22(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T458*)(GE_void(((T364*)(C))->a1)))->a8);
	return R;
}

/* GEANT_MKDIR_TASK.exit_code */
T6 T362f9(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T455*)(GE_void(((T362*)(C))->a1)))->a5);
	return R;
}

/* GEANT_ECHO_TASK.exit_code */
T6 T360f9(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T453*)(GE_void(((T360*)(C))->a1)))->a8);
	return R;
}

/* GEANT_GEANT_TASK.exit_code */
T6 T358f28(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T451*)(GE_void(((T358*)(C))->a1)))->a11);
	return R;
}

/* GEANT_GETEST_TASK.exit_code */
T6 T356f30(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T449*)(GE_void(((T356*)(C))->a1)))->a14);
	return R;
}

/* GEANT_GEPP_TASK.exit_code */
T6 T354f25(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T447*)(GE_void(((T354*)(C))->a1)))->a10);
	return R;
}

/* GEANT_GEYACC_TASK.exit_code */
T6 T352f26(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T445*)(GE_void(((T352*)(C))->a1)))->a11);
	return R;
}

/* GEANT_GELEX_TASK.exit_code */
T6 T350f30(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T443*)(GE_void(((T350*)(C))->a1)))->a15);
	return R;
}

/* GEANT_GEXACE_TASK.exit_code */
T6 T348f26(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T441*)(GE_void(((T348*)(C))->a1)))->a11);
	return R;
}

/* GEANT_UNSET_TASK.exit_code */
T6 T346f13(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T438*)(GE_void(((T346*)(C))->a1)))->a4);
	return R;
}

/* GEANT_SET_TASK.exit_code */
T6 T344f14(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T436*)(GE_void(((T344*)(C))->a1)))->a5);
	return R;
}

/* GEANT_LCC_TASK.exit_code */
T6 T342f14(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T434*)(GE_void(((T342*)(C))->a1)))->a5);
	return R;
}

/* GEANT_EXEC_TASK.exit_code */
T6 T340f10(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T427*)(GE_void(((T340*)(C))->a1)))->a7);
	return R;
}

/* GEANT_ISE_TASK.exit_code */
T6 T338f27(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T424*)(GE_void(((T338*)(C))->a1)))->a11);
	return R;
}

/* GEANT_GEC_TASK.exit_code */
T6 T332f28(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T420*)(GE_void(((T332*)(C))->a1)))->a13);
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.error_position */
T0* T226f60(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = T184c5(ac, ((T226*)(C))->a9, ((T226*)(C))->a29, ((T226*)(C))->a28, ((T226*)(C))->a27);
	return R;
}

/* XM_DEFAULT_POSITION.make */
T0* T184c5(GE_context* ac, T0* a1, T6 a2, T6 a3, T6 a4)
{
	T0* C;
	C = GE_new184(EIF_TRUE);
	((T184*)(C))->a1 = a1;
	((T184*)(C))->a4 = a2;
	((T184*)(C))->a3 = a3;
	((T184*)(C))->a2 = a4;
	return C;
}

/* XM_EIFFEL_SCANNER_DTD.error_position */
T0* T224f56(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = T184c5(ac, ((T224*)(C))->a3, ((T224*)(C))->a4, ((T224*)(C))->a5, ((T224*)(C))->a6);
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.error_position */
T0* T223f58(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = T184c5(ac, ((T223*)(C))->a9, ((T223*)(C))->a29, ((T223*)(C))->a28, ((T223*)(C))->a27);
	return R;
}

/* XM_EIFFEL_SCANNER.error_position */
T0* T183f66(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = T184c5(ac, ((T183*)(C))->a3, ((T183*)(C))->a4, ((T183*)(C))->a5, ((T183*)(C))->a6);
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.end_of_file */
T1 T226f62(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (((((((T226*)(C))->a46) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.end_of_file */
T1 T224f63(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (((((((T224*)(C))->a1) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.end_of_file */
T1 T223f60(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (((((((T223*)(C))->a44) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_EIFFEL_SCANNER.end_of_file */
T1 T183f68(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (((((((T183*)(C))->a1) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.is_applicable_encoding */
T1 T226f63(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	{
		t1 = (((T226*)(C))->a47?((m1 = ((T226*)(C))->a47, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		t1 = (T266f9(ac, m1, a1));
		if (t1) {
			R = (T266f16(ac, m1, a1));
		} else {
			R = EIF_FALSE;
		}
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.is_applicable_encoding */
T1 T266f16(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	t1 = (((((((T266*)(C))->a2) == ((T6)(GE_int32(6)))))));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T266f17(ac, C));
		t1 = (T115f11(ac, GE_void(t2), a1, ge1512ov8332));
		if (!(t1)) {
			t2 = (T266f17(ac, C));
			t1 = (T115f11(ac, GE_void(t2), a1, ge1512ov8331));
		}
		if (t1) {
			t1 = (((((((T266*)(C))->a2) == ((T6)(GE_int32(2)))))));
			if (!(t1)) {
				t1 = (((((((T266*)(C))->a2) == ((T6)(GE_int32(1)))))));
			}
			if (!(t1)) {
				R = (((((((T266*)(C))->a2) == ((T6)(GE_int32(3)))))));
			} else {
				R = EIF_TRUE;
			}
		} else {
			t2 = (T266f17(ac, C));
			t1 = (T115f11(ac, GE_void(t2), a1, ge1512ov8333));
			if (t1) {
				t1 = (((((((T266*)(C))->a2) == ((T6)(GE_int32(2)))))));
				if (!(t1)) {
					R = (((((((T266*)(C))->a2) == ((T6)(GE_int32(1)))))));
				} else {
					R = EIF_TRUE;
				}
			} else {
				t2 = (T266f17(ac, C));
				t1 = (T115f11(ac, GE_void(t2), a1, ge1512ov8334));
				if (t1) {
					t1 = (((((((T266*)(C))->a2) == ((T6)(GE_int32(4)))))));
					if (!(t1)) {
						R = (((((((T266*)(C))->a2) == ((T6)(GE_int32(5)))))));
					} else {
						R = EIF_TRUE;
					}
				}
			}
		}
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.is_valid_encoding */
T1 T266f9(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T266f17(ac, C));
		t1 = (T115f11(ac, GE_void(t2), a1, ge1512ov8332));
		if (!(t1)) {
			t2 = (T266f17(ac, C));
			t1 = (T115f11(ac, GE_void(t2), a1, ge1512ov8331));
		}
		if (!(t1)) {
			t2 = (T266f17(ac, C));
			t1 = (T115f11(ac, GE_void(t2), a1, ge1512ov8333));
		}
		if (!(t1)) {
			t2 = (T266f17(ac, C));
			R = (T115f11(ac, GE_void(t2), a1, ge1512ov8334));
		} else {
			R = EIF_TRUE;
		}
	}
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.is_applicable_encoding */
T1 T224f49(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	{
		t1 = (((T224*)(C))->a7?((m1 = ((T224*)(C))->a7, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		t1 = (T266f9(ac, m1, a1));
		if (t1) {
			R = (T266f16(ac, m1, a1));
		} else {
			R = EIF_FALSE;
		}
	}
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.is_applicable_encoding */
T1 T223f61(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	{
		t1 = (((T223*)(C))->a45?((m1 = ((T223*)(C))->a45, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		t1 = (T266f9(ac, m1, a1));
		if (t1) {
			R = (T266f16(ac, m1, a1));
		} else {
			R = EIF_FALSE;
		}
	}
	return R;
}

/* XM_EIFFEL_SCANNER.is_applicable_encoding */
T1 T183f69(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	{
		t1 = (((T183*)(C))->a7?((m1 = ((T183*)(C))->a7, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		t1 = (T266f9(ac, m1, a1));
		if (t1) {
			R = (T266f16(ac, m1, a1));
		} else {
			R = EIF_FALSE;
		}
	}
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.start_condition */
T6 T226f64(GE_context* ac, T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((((T226*)(C))->a21)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.start_condition */
T6 T224f51(GE_context* ac, T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((((T224*)(C))->a8)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.start_condition */
T6 T223f62(GE_context* ac, T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((((T223*)(C))->a21)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* XM_EIFFEL_SCANNER.start_condition */
T6 T183f44(GE_context* ac, T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((((T183*)(C))->a8)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_item */
T0* T120f23(GE_context* ac, T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T105*)(a1))->a2);
	R = (T120f25(ac, C, t1));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.cursor_item */
T0* T41f34(GE_context* ac, T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T105*)(GE_void(a1)))->a2);
	R = (T41f38(ac, C, t1));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.item_storage_item */
T0* T41f38(GE_context* ac, T0* C, T6 a1)
{
	T0* R = 0;
	R = (((T39*)(GE_void(((T41*)(C))->a13)))->z2[a1]);
	return R;
}

/* GEANT_VARIABLES.cursor_item */
T0* T36f37(GE_context* ac, T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T105*)(GE_void(a1)))->a2);
	R = (T36f35(ac, C, t1));
	return R;
}

/* GEANT_PROJECT_VARIABLES.cursor_item */
T0* T32f45(GE_context* ac, T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T105*)(GE_void(a1)))->a2);
	R = (T32f48(ac, C, t1));
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_key */
T0* T120f24(GE_context* ac, T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T105*)(a1))->a2);
	R = (T120f26(ac, C, t1));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.cursor_key */
T0* T41f35(GE_context* ac, T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T105*)(GE_void(a1)))->a2);
	R = (T41f30(ac, C, t1));
	return R;
}

/* GEANT_VARIABLES.cursor_key */
T0* T36f38(GE_context* ac, T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T105*)(GE_void(a1)))->a2);
	R = (T36f30(ac, C, t1));
	return R;
}

/* GEANT_PROJECT_VARIABLES.cursor_key */
T0* T32f46(GE_context* ac, T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T105*)(GE_void(a1)))->a2);
	R = (T32f28(ac, C, t1));
	return R;
}

/* UC_UTF8_STRING.character_32_item */
T3 T265f35(GE_context* ac, T0* C, T6 a1)
{
	T10 t1;
	T3 R = 0;
	t1 = (T265f23(ac, C, a1));
	R = ((T3)(t1));
	return R;
}

/* IMMUTABLE_STRING_32.item */
T3 T122f7(GE_context* ac, T0* C, T6 a1)
{
	T6 t1;
	T3 R = 0;
	t1 = ((T6)((a1)+(((T122*)(C))->a4)));
	t1 = ((T6)((t1)-((T6)(GE_int32(1)))));
	R = (((T16*)(GE_void(((T122*)(C))->a1)))->z2[t1]);
	return R;
}

/* STRING_32.item */
T3 T18f10(GE_context* ac, T0* C, T6 a1)
{
	T6 t1;
	T3 R = 0;
	t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
	R = (((T16*)(GE_void(((T18*)(C))->a1)))->z2[t1]);
	return R;
}

/* STRING_8.character_32_item */
T3 T17f21(GE_context* ac, T0* C, T6 a1)
{
	T10 t1;
	T3 R = 0;
	t1 = (T17f23(ac, C, a1));
	R = ((T3)(t1));
	return R;
}

/* UC_UTF8_STRING.substring */
T0* T265f41(GE_context* ac, T0* C, T6 a1, T6 a2)
{
	T1 t1;
	T0* R = 0;
	t1 = ((T1)((a2)<(a1)));
	if (t1) {
		R = T265c64(ac, (T6)(GE_int32(0)));
	} else {
		R = T265c65(ac, C, a1, a2);
	}
	return R;
}

/* UC_UTF8_STRING.make_from_substring */
T0* T265c65(GE_context* ac, T0* a1, T6 a2, T6 a3)
{
	T0* C;
	C = GE_new265(EIF_TRUE);
	T265f79(ac, C, a1, a2, a3);
	return C;
}

/* UC_UTF8_STRING.make_from_substring_general */
void T265f79(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T1 t1;
	T0* t2;
	T6 t3;
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	l3 = a1;
	t1 = ((l3)!=(EIF_VOID));
	if (t1) {
		((T265*)(C))->a2 = (((T265*)(GE_void(l3)))->a2);
		t1 = ((a1)!=(C));
		if (t1) {
			l3 = EIF_VOID;
		}
	}
	t1 = ((l3)!=(EIF_VOID));
	if (t1) {
		t1 = (((((a2) == ((T6)(GE_int32(1)))))));
	}
	if (t1) {
		t1 = (((((a3) == (((T265*)(C))->a1)))));
	}
	if (t1) {
		((T265*)(C))->a2 = (((T265*)(GE_void(l3)))->a2);
	} else {
		t1 = ((T1)((a3)<(a2)));
		if (t1) {
			T265f64(ac, C, (T6)(GE_int32(0)));
		} else {
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				l2 = (T265f46(ac, GE_void(l3)));
			} else {
				l2 = a1;
			}
			t2 = (T265f29(ac, C));
			l1 = (T264f22(ac, GE_void(t2), l2, a2, a3));
			T265f64(ac, C, l1);
			t3 = ((T6)((a3)-(a2)));
			t3 = ((T6)((t3)+((T6)(GE_int32(1)))));
			T265f71(ac, C, t3);
			((T265*)(C))->a3 = l1;
			T265f77(ac, C, l2, a2, a3, l1, (T6)(GE_int32(1)));
		}
	}
}

/* IMMUTABLE_STRING_32.substring */
T0* T122f8(GE_context* ac, T0* C, T6 a1, T6 a2)
{
	T6 t1;
	T1 t2;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	t1 = (T6)(GE_int32(1));
	t2 = (T6f10(ac, &t1, a1));
	if (t2) {
		t2 = (T6f10(ac, &a1, a2));
	}
	if (t2) {
		t2 = (T6f10(ac, &a2, ((T122*)(C))->a2));
	}
	if (t2) {
		t1 = ((T6)((a2)-(a1)));
		l2 = ((T6)((t1)+((T6)(GE_int32(1)))));
		t1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		l1 = T16c7(ac, t1);
		t1 = ((T6)((((T122*)(C))->a4)+(a1)));
		t1 = ((T6)((t1)-((T6)(GE_int32(1)))));
		T16f8(ac, GE_void(l1), ((T122*)(C))->a1, t1, (T6)(GE_int32(0)), l2);
		T16f16(ac, GE_void(l1), (T3)(GE_nat32(0)));
		R = T122c17(ac, l1, (T6)(GE_int32(0)), l2);
	} else {
		R = (T122f9(ac, C));
	}
	return R;
}

/* IMMUTABLE_STRING_32.empty_string */
unsigned char ge2409os5212 = '\0';
T0* ge2409ov5212;
T0* T122f9(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge2409os5212) {
		return ge2409ov5212;
	} else {
		ge2409os5212 = '\1';
		ge2409ov5212 = R;
	}
	R = T122c15(ac, (T6)(GE_int32(0)));
	ge2409ov5212 = R;
	return R;
}

/* STRING_32.substring */
T0* T18f11(GE_context* ac, T0* C, T6 a1, T6 a2)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T6 t4;
	T0* R = 0;
	t1 = (T6)(GE_int32(1));
	t2 = (T6f10(ac, &t1, a1));
	if (t2) {
		t2 = (T6f10(ac, &a1, a2));
	}
	if (t2) {
		t2 = (T6f10(ac, &a2, ((T18*)(C))->a2));
	}
	if (t2) {
		t1 = ((T6)((a2)-(a1)));
		t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
		R = (T18f12(ac, C, t1));
		t3 = (((T18*)(GE_void(R)))->a1);
		t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
		t4 = ((T6)((a2)-(a1)));
		t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
		T16f8(ac, GE_void(t3), ((T18*)(C))->a1, t1, (T6)(GE_int32(0)), t4);
		t1 = ((T6)((a2)-(a1)));
		t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
		T18f21(ac, GE_void(R), t1);
	} else {
		R = (T18f12(ac, C, (T6)(GE_int32(0))));
	}
	return R;
}

/* STRING_32.new_string */
T0* T18f12(GE_context* ac, T0* C, T6 a1)
{
	T0* R = 0;
	R = T18c13(ac, a1);
	return R;
}

/* STRING_8.substring */
T0* T17f11(GE_context* ac, T0* C, T6 a1, T6 a2)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T6 t4;
	T0* R = 0;
	t1 = (T6)(GE_int32(1));
	t2 = (T6f10(ac, &t1, a1));
	if (t2) {
		t2 = (T6f10(ac, &a1, a2));
	}
	if (t2) {
		t2 = (T6f10(ac, &a2, ((T17*)(C))->a2));
	}
	if (t2) {
		t1 = ((T6)((a2)-(a1)));
		t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
		R = (T17f22(ac, C, t1));
		t3 = (((T17*)(GE_void(R)))->a1);
		t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
		t4 = ((T6)((a2)-(a1)));
		t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
		T15f13(ac, GE_void(t3), ((T17*)(C))->a1, t1, (T6)(GE_int32(0)), t4);
		t1 = ((T6)((a2)-(a1)));
		t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
		T17f43(ac, GE_void(R), t1);
	} else {
		R = (T17f22(ac, C, (T6)(GE_int32(0))));
	}
	return R;
}

/* UC_UTF8_STRING.code */
T10 T265f23(GE_context* ac, T0* C, T6 a1)
{
	T6 t1;
	T10 R = 0;
	t1 = (T265f17(ac, C, a1));
	R = ((T10)(t1));
	return R;
}

/* IMMUTABLE_STRING_32.code */
T10 T122f5(GE_context* ac, T0* C, T6 a1)
{
	T6 t1;
	T3 t2;
	T10 R = 0;
	t1 = ((T6)((a1)+(((T122*)(C))->a4)));
	t1 = ((T6)((t1)-((T6)(GE_int32(1)))));
	t2 = (((T16*)(GE_void(((T122*)(C))->a1)))->z2[t1]);
	R = ((T10)(t2));
	return R;
}

/* STRING_32.code */
T10 T18f5(GE_context* ac, T0* C, T6 a1)
{
	T6 t1;
	T3 t2;
	T10 R = 0;
	t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
	t2 = (((T16*)(GE_void(((T18*)(C))->a1)))->z2[t1]);
	t1 = ((T6)(t2));
	R = (T6f17(ac, &t1));
	return R;
}

/* STRING_8.code */
T10 T17f23(GE_context* ac, T0* C, T6 a1)
{
	T6 t1;
	T2 t2;
	T10 R = 0;
	t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
	t2 = (((T15*)(GE_void(((T17*)(C))->a1)))->z2[t1]);
	t1 = ((T6)(t2));
	R = (T6f17(ac, &t1));
	return R;
}

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.default_message */
T0* T619f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T619f3(ac, C, ge294ov3408));
	return R;
}

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.message */
T0* T619f3(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T619f4(ac, C));
	R = (T115f3(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f37(ac, R, l5);
				} else {
					T265f60(ac, R, l5);
				}
			} else {
				t1 = (T619f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T115f4(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f37(ac, R, (T2)('$'));
				} else {
					T265f60(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f37(ac, R, (T2)('$'));
					} else {
						T265f60(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T619f4(ac, C));
					l1 = (T115f3(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f37(ac, l1, l5);
									} else {
										T265f60(ac, l1, l5);
									}
								} else {
									t1 = (T619f4(ac, C));
									T115f20(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f37(ac, l1, l5);
								} else {
									T265f60(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(ac, l1):T265f38(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(ac, l1):T265f39(ac, l1)));
						t2 = (T40f5(ac, GE_void(((T619*)(C))->a1), l3));
						if (t2) {
							t1 = (T619f4(ac, C));
							t5 = (T40f4(ac, GE_void(((T619*)(C))->a1), l3));
							R = (T115f5(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T619f4(ac, C));
								t5 = (T619f6(ac, C));
								t5 = (((T34*)(GE_void(t5)))->a1);
								R = (T115f5(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f37(ac, R, (T2)('$'));
								} else {
									T265f60(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f37(ac, R, (T2)('{'));
									} else {
										T265f60(ac, R, (T2)('{'));
									}
								}
								t1 = (T619f4(ac, C));
								R = (T115f5(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f37(ac, R, (T2)('}'));
									} else {
										T265f60(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f37(ac, R, (T2)('$'));
						} else {
							T265f60(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f37(ac, R, (T2)('{'));
							} else {
								T265f60(ac, R, (T2)('{'));
							}
						}
						t1 = (T619f4(ac, C));
						R = (T115f5(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f37(ac, R, (T2)('}'));
							} else {
								T265f60(ac, R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.arguments */
T0* T619f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge202os1982) {
		return ge202ov1982;
	} else {
		ge202os1982 = '\1';
		ge202ov1982 = R;
	}
	R = T34c5(ac);
	ge202ov1982 = R;
	return R;
}

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.string_ */
T0* T619f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge128os1973) {
		return ge128ov1973;
	} else {
		ge128os1973 = '\1';
		ge128ov1973 = R;
	}
	R = T115c19(ac);
	ge128ov1973 = R;
	return R;
}

/* LX_CHARACTER_OUT_OF_RANGE_ERROR.default_message */
T0* T595f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T595f3(ac, C, ge280ov3408));
	return R;
}

/* LX_CHARACTER_OUT_OF_RANGE_ERROR.message */
T0* T595f3(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T595f4(ac, C));
	R = (T115f3(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f37(ac, R, l5);
				} else {
					T265f60(ac, R, l5);
				}
			} else {
				t1 = (T595f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T115f4(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f37(ac, R, (T2)('$'));
				} else {
					T265f60(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f37(ac, R, (T2)('$'));
					} else {
						T265f60(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T595f4(ac, C));
					l1 = (T115f3(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f37(ac, l1, l5);
									} else {
										T265f60(ac, l1, l5);
									}
								} else {
									t1 = (T595f4(ac, C));
									T115f20(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f37(ac, l1, l5);
								} else {
									T265f60(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(ac, l1):T265f38(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(ac, l1):T265f39(ac, l1)));
						t2 = (T40f5(ac, GE_void(((T595*)(C))->a1), l3));
						if (t2) {
							t1 = (T595f4(ac, C));
							t5 = (T40f4(ac, GE_void(((T595*)(C))->a1), l3));
							R = (T115f5(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T595f4(ac, C));
								t5 = (T595f6(ac, C));
								t5 = (((T34*)(GE_void(t5)))->a1);
								R = (T115f5(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f37(ac, R, (T2)('$'));
								} else {
									T265f60(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f37(ac, R, (T2)('{'));
									} else {
										T265f60(ac, R, (T2)('{'));
									}
								}
								t1 = (T595f4(ac, C));
								R = (T115f5(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f37(ac, R, (T2)('}'));
									} else {
										T265f60(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f37(ac, R, (T2)('$'));
						} else {
							T265f60(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f37(ac, R, (T2)('{'));
							} else {
								T265f60(ac, R, (T2)('{'));
							}
						}
						t1 = (T595f4(ac, C));
						R = (T115f5(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f37(ac, R, (T2)('}'));
							} else {
								T265f60(ac, R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* LX_CHARACTER_OUT_OF_RANGE_ERROR.arguments */
T0* T595f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge202os1982) {
		return ge202ov1982;
	} else {
		ge202os1982 = '\1';
		ge202ov1982 = R;
	}
	R = T34c5(ac);
	ge202ov1982 = R;
	return R;
}

/* LX_CHARACTER_OUT_OF_RANGE_ERROR.string_ */
T0* T595f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge128os1973) {
		return ge128ov1973;
	} else {
		ge128os1973 = '\1';
		ge128ov1973 = R;
	}
	R = T115c19(ac);
	ge128ov1973 = R;
	return R;
}

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.default_message */
T0* T594f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T594f3(ac, C, ge286ov3408));
	return R;
}

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.message */
T0* T594f3(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T594f4(ac, C));
	R = (T115f3(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f37(ac, R, l5);
				} else {
					T265f60(ac, R, l5);
				}
			} else {
				t1 = (T594f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T115f4(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f37(ac, R, (T2)('$'));
				} else {
					T265f60(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f37(ac, R, (T2)('$'));
					} else {
						T265f60(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T594f4(ac, C));
					l1 = (T115f3(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f37(ac, l1, l5);
									} else {
										T265f60(ac, l1, l5);
									}
								} else {
									t1 = (T594f4(ac, C));
									T115f20(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f37(ac, l1, l5);
								} else {
									T265f60(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(ac, l1):T265f38(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(ac, l1):T265f39(ac, l1)));
						t2 = (T40f5(ac, GE_void(((T594*)(C))->a1), l3));
						if (t2) {
							t1 = (T594f4(ac, C));
							t5 = (T40f4(ac, GE_void(((T594*)(C))->a1), l3));
							R = (T115f5(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T594f4(ac, C));
								t5 = (T594f6(ac, C));
								t5 = (((T34*)(GE_void(t5)))->a1);
								R = (T115f5(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f37(ac, R, (T2)('$'));
								} else {
									T265f60(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f37(ac, R, (T2)('{'));
									} else {
										T265f60(ac, R, (T2)('{'));
									}
								}
								t1 = (T594f4(ac, C));
								R = (T115f5(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f37(ac, R, (T2)('}'));
									} else {
										T265f60(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f37(ac, R, (T2)('$'));
						} else {
							T265f60(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f37(ac, R, (T2)('{'));
							} else {
								T265f60(ac, R, (T2)('{'));
							}
						}
						t1 = (T594f4(ac, C));
						R = (T115f5(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f37(ac, R, (T2)('}'));
							} else {
								T265f60(ac, R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.arguments */
T0* T594f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge202os1982) {
		return ge202ov1982;
	} else {
		ge202os1982 = '\1';
		ge202ov1982 = R;
	}
	R = T34c5(ac);
	ge202ov1982 = R;
	return R;
}

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.string_ */
T0* T594f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge128os1973) {
		return ge128ov1973;
	} else {
		ge128os1973 = '\1';
		ge128ov1973 = R;
	}
	R = T115c19(ac);
	ge128ov1973 = R;
	return R;
}

/* LX_FULL_AND_REJECT_ERROR.default_message */
T0* T593f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T593f3(ac, C, ge285ov3408));
	return R;
}

/* LX_FULL_AND_REJECT_ERROR.message */
T0* T593f3(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T593f4(ac, C));
	R = (T115f3(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f37(ac, R, l5);
				} else {
					T265f60(ac, R, l5);
				}
			} else {
				t1 = (T593f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T115f4(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f37(ac, R, (T2)('$'));
				} else {
					T265f60(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f37(ac, R, (T2)('$'));
					} else {
						T265f60(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T593f4(ac, C));
					l1 = (T115f3(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f37(ac, l1, l5);
									} else {
										T265f60(ac, l1, l5);
									}
								} else {
									t1 = (T593f4(ac, C));
									T115f20(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f37(ac, l1, l5);
								} else {
									T265f60(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(ac, l1):T265f38(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(ac, l1):T265f39(ac, l1)));
						t2 = (T40f5(ac, GE_void(((T593*)(C))->a1), l3));
						if (t2) {
							t1 = (T593f4(ac, C));
							t5 = (T40f4(ac, GE_void(((T593*)(C))->a1), l3));
							R = (T115f5(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T593f4(ac, C));
								t5 = (T593f6(ac, C));
								t5 = (((T34*)(GE_void(t5)))->a1);
								R = (T115f5(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f37(ac, R, (T2)('$'));
								} else {
									T265f60(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f37(ac, R, (T2)('{'));
									} else {
										T265f60(ac, R, (T2)('{'));
									}
								}
								t1 = (T593f4(ac, C));
								R = (T115f5(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f37(ac, R, (T2)('}'));
									} else {
										T265f60(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f37(ac, R, (T2)('$'));
						} else {
							T265f60(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f37(ac, R, (T2)('{'));
							} else {
								T265f60(ac, R, (T2)('{'));
							}
						}
						t1 = (T593f4(ac, C));
						R = (T115f5(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f37(ac, R, (T2)('}'));
							} else {
								T265f60(ac, R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* LX_FULL_AND_REJECT_ERROR.arguments */
T0* T593f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge202os1982) {
		return ge202ov1982;
	} else {
		ge202os1982 = '\1';
		ge202ov1982 = R;
	}
	R = T34c5(ac);
	ge202ov1982 = R;
	return R;
}

/* LX_FULL_AND_REJECT_ERROR.string_ */
T0* T593f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge128os1973) {
		return ge128ov1973;
	} else {
		ge128os1973 = '\1';
		ge128ov1973 = R;
	}
	R = T115c19(ac);
	ge128ov1973 = R;
	return R;
}

/* LX_FULL_AND_META_ERROR.default_message */
T0* T592f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T592f3(ac, C, ge284ov3408));
	return R;
}

/* LX_FULL_AND_META_ERROR.message */
T0* T592f3(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T592f4(ac, C));
	R = (T115f3(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f37(ac, R, l5);
				} else {
					T265f60(ac, R, l5);
				}
			} else {
				t1 = (T592f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T115f4(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f37(ac, R, (T2)('$'));
				} else {
					T265f60(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f37(ac, R, (T2)('$'));
					} else {
						T265f60(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T592f4(ac, C));
					l1 = (T115f3(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f37(ac, l1, l5);
									} else {
										T265f60(ac, l1, l5);
									}
								} else {
									t1 = (T592f4(ac, C));
									T115f20(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f37(ac, l1, l5);
								} else {
									T265f60(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(ac, l1):T265f38(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(ac, l1):T265f39(ac, l1)));
						t2 = (T40f5(ac, GE_void(((T592*)(C))->a1), l3));
						if (t2) {
							t1 = (T592f4(ac, C));
							t5 = (T40f4(ac, GE_void(((T592*)(C))->a1), l3));
							R = (T115f5(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T592f4(ac, C));
								t5 = (T592f6(ac, C));
								t5 = (((T34*)(GE_void(t5)))->a1);
								R = (T115f5(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f37(ac, R, (T2)('$'));
								} else {
									T265f60(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f37(ac, R, (T2)('{'));
									} else {
										T265f60(ac, R, (T2)('{'));
									}
								}
								t1 = (T592f4(ac, C));
								R = (T115f5(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f37(ac, R, (T2)('}'));
									} else {
										T265f60(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f37(ac, R, (T2)('$'));
						} else {
							T265f60(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f37(ac, R, (T2)('{'));
							} else {
								T265f60(ac, R, (T2)('{'));
							}
						}
						t1 = (T592f4(ac, C));
						R = (T115f5(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f37(ac, R, (T2)('}'));
							} else {
								T265f60(ac, R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* LX_FULL_AND_META_ERROR.arguments */
T0* T592f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge202os1982) {
		return ge202ov1982;
	} else {
		ge202os1982 = '\1';
		ge202ov1982 = R;
	}
	R = T34c5(ac);
	ge202ov1982 = R;
	return R;
}

/* LX_FULL_AND_META_ERROR.string_ */
T0* T592f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge128os1973) {
		return ge128ov1973;
	} else {
		ge128os1973 = '\1';
		ge128ov1973 = R;
	}
	R = T115c19(ac);
	ge128ov1973 = R;
	return R;
}

/* LX_BAD_CHARACTER_ERROR.default_message */
T0* T591f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T591f3(ac, C, ge275ov3408));
	return R;
}

/* LX_BAD_CHARACTER_ERROR.message */
T0* T591f3(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T591f4(ac, C));
	R = (T115f3(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f37(ac, R, l5);
				} else {
					T265f60(ac, R, l5);
				}
			} else {
				t1 = (T591f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T115f4(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f37(ac, R, (T2)('$'));
				} else {
					T265f60(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f37(ac, R, (T2)('$'));
					} else {
						T265f60(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T591f4(ac, C));
					l1 = (T115f3(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f37(ac, l1, l5);
									} else {
										T265f60(ac, l1, l5);
									}
								} else {
									t1 = (T591f4(ac, C));
									T115f20(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f37(ac, l1, l5);
								} else {
									T265f60(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(ac, l1):T265f38(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(ac, l1):T265f39(ac, l1)));
						t2 = (T40f5(ac, GE_void(((T591*)(C))->a1), l3));
						if (t2) {
							t1 = (T591f4(ac, C));
							t5 = (T40f4(ac, GE_void(((T591*)(C))->a1), l3));
							R = (T115f5(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T591f4(ac, C));
								t5 = (T591f6(ac, C));
								t5 = (((T34*)(GE_void(t5)))->a1);
								R = (T115f5(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f37(ac, R, (T2)('$'));
								} else {
									T265f60(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f37(ac, R, (T2)('{'));
									} else {
										T265f60(ac, R, (T2)('{'));
									}
								}
								t1 = (T591f4(ac, C));
								R = (T115f5(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f37(ac, R, (T2)('}'));
									} else {
										T265f60(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f37(ac, R, (T2)('$'));
						} else {
							T265f60(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f37(ac, R, (T2)('{'));
							} else {
								T265f60(ac, R, (T2)('{'));
							}
						}
						t1 = (T591f4(ac, C));
						R = (T115f5(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f37(ac, R, (T2)('}'));
							} else {
								T265f60(ac, R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* LX_BAD_CHARACTER_ERROR.arguments */
T0* T591f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge202os1982) {
		return ge202ov1982;
	} else {
		ge202os1982 = '\1';
		ge202ov1982 = R;
	}
	R = T34c5(ac);
	ge202ov1982 = R;
	return R;
}

/* LX_BAD_CHARACTER_ERROR.string_ */
T0* T591f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge128os1973) {
		return ge128ov1973;
	} else {
		ge128os1973 = '\1';
		ge128ov1973 = R;
	}
	R = T115c19(ac);
	ge128ov1973 = R;
	return R;
}

/* LX_BAD_CHARACTER_CLASS_ERROR.default_message */
T0* T590f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T590f3(ac, C, ge274ov3408));
	return R;
}

/* LX_BAD_CHARACTER_CLASS_ERROR.message */
T0* T590f3(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T590f4(ac, C));
	R = (T115f3(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f37(ac, R, l5);
				} else {
					T265f60(ac, R, l5);
				}
			} else {
				t1 = (T590f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T115f4(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f37(ac, R, (T2)('$'));
				} else {
					T265f60(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f37(ac, R, (T2)('$'));
					} else {
						T265f60(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T590f4(ac, C));
					l1 = (T115f3(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f37(ac, l1, l5);
									} else {
										T265f60(ac, l1, l5);
									}
								} else {
									t1 = (T590f4(ac, C));
									T115f20(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f37(ac, l1, l5);
								} else {
									T265f60(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(ac, l1):T265f38(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(ac, l1):T265f39(ac, l1)));
						t2 = (T40f5(ac, GE_void(((T590*)(C))->a1), l3));
						if (t2) {
							t1 = (T590f4(ac, C));
							t5 = (T40f4(ac, GE_void(((T590*)(C))->a1), l3));
							R = (T115f5(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T590f4(ac, C));
								t5 = (T590f6(ac, C));
								t5 = (((T34*)(GE_void(t5)))->a1);
								R = (T115f5(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f37(ac, R, (T2)('$'));
								} else {
									T265f60(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f37(ac, R, (T2)('{'));
									} else {
										T265f60(ac, R, (T2)('{'));
									}
								}
								t1 = (T590f4(ac, C));
								R = (T115f5(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f37(ac, R, (T2)('}'));
									} else {
										T265f60(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f37(ac, R, (T2)('$'));
						} else {
							T265f60(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f37(ac, R, (T2)('{'));
							} else {
								T265f60(ac, R, (T2)('{'));
							}
						}
						t1 = (T590f4(ac, C));
						R = (T115f5(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f37(ac, R, (T2)('}'));
							} else {
								T265f60(ac, R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* LX_BAD_CHARACTER_CLASS_ERROR.arguments */
T0* T590f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge202os1982) {
		return ge202ov1982;
	} else {
		ge202os1982 = '\1';
		ge202ov1982 = R;
	}
	R = T34c5(ac);
	ge202ov1982 = R;
	return R;
}

/* LX_BAD_CHARACTER_CLASS_ERROR.string_ */
T0* T590f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge128os1973) {
		return ge128ov1973;
	} else {
		ge128os1973 = '\1';
		ge128ov1973 = R;
	}
	R = T115c19(ac);
	ge128ov1973 = R;
	return R;
}

/* LX_MISSING_QUOTE_ERROR.default_message */
T0* T589f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T589f3(ac, C, ge291ov3408));
	return R;
}

/* LX_MISSING_QUOTE_ERROR.message */
T0* T589f3(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T589f4(ac, C));
	R = (T115f3(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f37(ac, R, l5);
				} else {
					T265f60(ac, R, l5);
				}
			} else {
				t1 = (T589f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T115f4(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f37(ac, R, (T2)('$'));
				} else {
					T265f60(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f37(ac, R, (T2)('$'));
					} else {
						T265f60(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T589f4(ac, C));
					l1 = (T115f3(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f37(ac, l1, l5);
									} else {
										T265f60(ac, l1, l5);
									}
								} else {
									t1 = (T589f4(ac, C));
									T115f20(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f37(ac, l1, l5);
								} else {
									T265f60(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(ac, l1):T265f38(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(ac, l1):T265f39(ac, l1)));
						t2 = (T40f5(ac, GE_void(((T589*)(C))->a1), l3));
						if (t2) {
							t1 = (T589f4(ac, C));
							t5 = (T40f4(ac, GE_void(((T589*)(C))->a1), l3));
							R = (T115f5(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T589f4(ac, C));
								t5 = (T589f6(ac, C));
								t5 = (((T34*)(GE_void(t5)))->a1);
								R = (T115f5(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f37(ac, R, (T2)('$'));
								} else {
									T265f60(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f37(ac, R, (T2)('{'));
									} else {
										T265f60(ac, R, (T2)('{'));
									}
								}
								t1 = (T589f4(ac, C));
								R = (T115f5(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f37(ac, R, (T2)('}'));
									} else {
										T265f60(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f37(ac, R, (T2)('$'));
						} else {
							T265f60(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f37(ac, R, (T2)('{'));
							} else {
								T265f60(ac, R, (T2)('{'));
							}
						}
						t1 = (T589f4(ac, C));
						R = (T115f5(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f37(ac, R, (T2)('}'));
							} else {
								T265f60(ac, R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* LX_MISSING_QUOTE_ERROR.arguments */
T0* T589f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge202os1982) {
		return ge202ov1982;
	} else {
		ge202os1982 = '\1';
		ge202ov1982 = R;
	}
	R = T34c5(ac);
	ge202ov1982 = R;
	return R;
}

/* LX_MISSING_QUOTE_ERROR.string_ */
T0* T589f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge128os1973) {
		return ge128ov1973;
	} else {
		ge128os1973 = '\1';
		ge128ov1973 = R;
	}
	R = T115c19(ac);
	ge128ov1973 = R;
	return R;
}

/* LX_UNRECOGNIZED_RULE_ERROR.default_message */
T0* T588f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T588f3(ac, C, ge304ov3408));
	return R;
}

/* LX_UNRECOGNIZED_RULE_ERROR.message */
T0* T588f3(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T588f4(ac, C));
	R = (T115f3(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f37(ac, R, l5);
				} else {
					T265f60(ac, R, l5);
				}
			} else {
				t1 = (T588f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T115f4(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f37(ac, R, (T2)('$'));
				} else {
					T265f60(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f37(ac, R, (T2)('$'));
					} else {
						T265f60(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T588f4(ac, C));
					l1 = (T115f3(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f37(ac, l1, l5);
									} else {
										T265f60(ac, l1, l5);
									}
								} else {
									t1 = (T588f4(ac, C));
									T115f20(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f37(ac, l1, l5);
								} else {
									T265f60(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(ac, l1):T265f38(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(ac, l1):T265f39(ac, l1)));
						t2 = (T40f5(ac, GE_void(((T588*)(C))->a1), l3));
						if (t2) {
							t1 = (T588f4(ac, C));
							t5 = (T40f4(ac, GE_void(((T588*)(C))->a1), l3));
							R = (T115f5(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T588f4(ac, C));
								t5 = (T588f6(ac, C));
								t5 = (((T34*)(GE_void(t5)))->a1);
								R = (T115f5(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f37(ac, R, (T2)('$'));
								} else {
									T265f60(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f37(ac, R, (T2)('{'));
									} else {
										T265f60(ac, R, (T2)('{'));
									}
								}
								t1 = (T588f4(ac, C));
								R = (T115f5(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f37(ac, R, (T2)('}'));
									} else {
										T265f60(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f37(ac, R, (T2)('$'));
						} else {
							T265f60(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f37(ac, R, (T2)('{'));
							} else {
								T265f60(ac, R, (T2)('{'));
							}
						}
						t1 = (T588f4(ac, C));
						R = (T115f5(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f37(ac, R, (T2)('}'));
							} else {
								T265f60(ac, R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* LX_UNRECOGNIZED_RULE_ERROR.arguments */
T0* T588f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge202os1982) {
		return ge202ov1982;
	} else {
		ge202os1982 = '\1';
		ge202ov1982 = R;
	}
	R = T34c5(ac);
	ge202ov1982 = R;
	return R;
}

/* LX_UNRECOGNIZED_RULE_ERROR.string_ */
T0* T588f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge128os1973) {
		return ge128ov1973;
	} else {
		ge128os1973 = '\1';
		ge128ov1973 = R;
	}
	R = T115c19(ac);
	ge128ov1973 = R;
	return R;
}

/* UT_SYNTAX_ERROR.default_message */
T0* T586f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T586f3(ac, C, ge1363ov3408));
	return R;
}

/* UT_SYNTAX_ERROR.message */
T0* T586f3(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T586f4(ac, C));
	R = (T115f3(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f37(ac, R, l5);
				} else {
					T265f60(ac, R, l5);
				}
			} else {
				t1 = (T586f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T115f4(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f37(ac, R, (T2)('$'));
				} else {
					T265f60(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f37(ac, R, (T2)('$'));
					} else {
						T265f60(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T586f4(ac, C));
					l1 = (T115f3(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f37(ac, l1, l5);
									} else {
										T265f60(ac, l1, l5);
									}
								} else {
									t1 = (T586f4(ac, C));
									T115f20(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f37(ac, l1, l5);
								} else {
									T265f60(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(ac, l1):T265f38(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(ac, l1):T265f39(ac, l1)));
						t2 = (T40f5(ac, GE_void(((T586*)(C))->a1), l3));
						if (t2) {
							t1 = (T586f4(ac, C));
							t5 = (T40f4(ac, GE_void(((T586*)(C))->a1), l3));
							R = (T115f5(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T586f4(ac, C));
								t5 = (T586f6(ac, C));
								t5 = (((T34*)(GE_void(t5)))->a1);
								R = (T115f5(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f37(ac, R, (T2)('$'));
								} else {
									T265f60(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f37(ac, R, (T2)('{'));
									} else {
										T265f60(ac, R, (T2)('{'));
									}
								}
								t1 = (T586f4(ac, C));
								R = (T115f5(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f37(ac, R, (T2)('}'));
									} else {
										T265f60(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f37(ac, R, (T2)('$'));
						} else {
							T265f60(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f37(ac, R, (T2)('{'));
							} else {
								T265f60(ac, R, (T2)('{'));
							}
						}
						t1 = (T586f4(ac, C));
						R = (T115f5(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f37(ac, R, (T2)('}'));
							} else {
								T265f60(ac, R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_SYNTAX_ERROR.arguments */
T0* T586f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge202os1982) {
		return ge202ov1982;
	} else {
		ge202os1982 = '\1';
		ge202ov1982 = R;
	}
	R = T34c5(ac);
	ge202ov1982 = R;
	return R;
}

/* UT_SYNTAX_ERROR.string_ */
T0* T586f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge128os1973) {
		return ge128ov1973;
	} else {
		ge128os1973 = '\1';
		ge128ov1973 = R;
	}
	R = T115c19(ac);
	ge128ov1973 = R;
	return R;
}

/* UT_VERSION_NUMBER.default_message */
T0* T56f3(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T56f5(ac, C, ge1368ov3408));
	return R;
}

/* UT_VERSION_NUMBER.message */
T0* T56f5(GE_context* ac, T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T56f6(ac, C));
	R = (T115f3(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f37(ac, R, l5);
				} else {
					T265f60(ac, R, l5);
				}
			} else {
				t1 = (T56f6(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T115f4(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f37(ac, R, (T2)('$'));
				} else {
					T265f60(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f37(ac, R, (T2)('$'));
					} else {
						T265f60(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T56f6(ac, C));
					l1 = (T115f3(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f37(ac, l1, l5);
									} else {
										T265f60(ac, l1, l5);
									}
								} else {
									t1 = (T56f6(ac, C));
									T115f20(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
								if (((T0*)(GE_void(l1)))->id==17) {
									T17f37(ac, l1, l5);
								} else {
									T265f60(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(ac, l1):T265f38(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(ac, l1):T265f39(ac, l1)));
						t2 = (T40f5(ac, GE_void(((T56*)(C))->a1), l3));
						if (t2) {
							t1 = (T56f6(ac, C));
							t5 = (T40f4(ac, GE_void(((T56*)(C))->a1), l3));
							R = (T115f5(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T56f6(ac, C));
								t5 = (T56f7(ac, C));
								t5 = (((T34*)(GE_void(t5)))->a1);
								R = (T115f5(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f37(ac, R, (T2)('$'));
								} else {
									T265f60(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f37(ac, R, (T2)('{'));
									} else {
										T265f60(ac, R, (T2)('{'));
									}
								}
								t1 = (T56f6(ac, C));
								R = (T115f5(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f37(ac, R, (T2)('}'));
									} else {
										T265f60(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f37(ac, R, (T2)('$'));
						} else {
							T265f60(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f37(ac, R, (T2)('{'));
							} else {
								T265f60(ac, R, (T2)('{'));
							}
						}
						t1 = (T56f6(ac, C));
						R = (T115f5(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f37(ac, R, (T2)('}'));
							} else {
								T265f60(ac, R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_VERSION_NUMBER.arguments */
T0* T56f7(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge202os1982) {
		return ge202ov1982;
	} else {
		ge202os1982 = '\1';
		ge202ov1982 = R;
	}
	R = T34c5(ac);
	ge202ov1982 = R;
	return R;
}

/* UT_VERSION_NUMBER.string_ */
T0* T56f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge128os1973) {
		return ge128ov1973;
	} else {
		ge128os1973 = '\1';
		ge128ov1973 = R;
	}
	R = T115c19(ac);
	ge128ov1973 = R;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.was_found */
T1 T112f10(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T6f1(ac, &(((T112*)(C))->a5), (T6)(GE_int32(0))));
	return R;
}

/* AP_STRING_OPTION.was_found */
T1 T44f15(GE_context* ac, T0* C)
{
	T6 t1;
	T1 R = 0;
	t1 = (T44f18(ac, C));
	R = (T6f1(ac, &t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_FLAG.was_found */
T1 T42f9(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T6f1(ac, &(((T42*)(C))->a1), (T6)(GE_int32(0))));
	return R;
}

/* AP_STRING_OPTION.occurrences */
T6 T44f18(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T110*)(GE_void(((T44*)(C))->a1)))->a1);
	return R;
}

/* AP_DISPLAY_HELP_FLAG.allows_parameter */
T1 T112f21(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_STRING_OPTION.allows_parameter */
T1 T44f17(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_FLAG.allows_parameter */
T1 T42f11(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.needs_parameter */
T1 T112f9(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_FLAG.needs_parameter */
T1 T42f10(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.name */
T0* T112f11(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (((T112*)(C))->a4?((m1 = ((T112*)(C))->a4, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f1(ac, &t2));
		t2 = (T2)('-');
		t4 = (T2f1(ac, &t2));
		t3 = (T17f9(ac, GE_void(t3), t4));
		R = (T17f9(ac, GE_void(t3), m1));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(ac, &t2));
		t4 = (T2f1(ac, &(((T112*)(C))->a2)));
		R = (T17f9(ac, GE_void(t3), t4));
	}
	return R;
}

/* AP_STRING_OPTION.name */
T0* T44f12(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (((T44*)(C))->a8?((m1 = ((T44*)(C))->a8, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f1(ac, &t2));
		t2 = (T2)('-');
		t4 = (T2f1(ac, &t2));
		t3 = (T17f9(ac, GE_void(t3), t4));
		R = (T17f9(ac, GE_void(t3), m1));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(ac, &t2));
		t4 = (T2f1(ac, &(((T44*)(C))->a6)));
		R = (T17f9(ac, GE_void(t3), t4));
	}
	return R;
}

/* AP_FLAG.name */
T0* T42f14(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (((T42*)(C))->a3?((m1 = ((T42*)(C))->a3, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f1(ac, &t2));
		t2 = (T2)('-');
		t4 = (T2f1(ac, &t2));
		t3 = (T17f9(ac, GE_void(t3), t4));
		R = (T17f9(ac, GE_void(t3), m1));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(ac, &t2));
		t4 = (T2f1(ac, &(((T42*)(C))->a4)));
		R = (T17f9(ac, GE_void(t3), t4));
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.names */
T0* T112f22(GE_context* ac, T0* C)
{
	T2 t1;
	T1 t2;
	T0* m1 = 0;
	T0* R = 0;
	T0* l1 = 0;
	if (((T112*)(C))->a3) {
		t1 = (T2)('-');
		l1 = (T2f1(ac, &t1));
		T17f37(ac, GE_void(l1), ((T112*)(C))->a2);
	}
	t2 = (((T112*)(C))->a4?((m1 = ((T112*)(C))->a4, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f42(ac, GE_void(l1), GE_ms8(", ", 2));
		}
		T17f37(ac, GE_void(l1), (T2)('-'));
		T17f37(ac, GE_void(l1), (T2)('-'));
		T17f42(ac, GE_void(l1), m1);
	}
	{
		t2 = ((l1)!=(EIF_VOID));
		if (!(t2)) {
			GE_raise(GE_EX_CHECK);
		}		R = l1;
	}
	return R;
}

/* AP_STRING_OPTION.names */
T0* T44f19(GE_context* ac, T0* C)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T0* R = 0;
	R = (T44f19p1(ac, C));
	t1 = (T44f21(ac, C));
	if (t1) {
		t1 = ((T1)(!(((T44*)(C))->a5)));
		if (t1) {
			T17f37(ac, GE_void(R), (T2)('['));
		}
		t2 = (T2)('=');
		t3 = (T2f1(ac, &t2));
		T17f42(ac, GE_void(R), t3);
		T17f42(ac, GE_void(R), ((T44*)(C))->a4);
		t1 = ((T1)(!(((T44*)(C))->a5)));
		if (t1) {
			T17f37(ac, GE_void(R), (T2)(']'));
		}
	} else {
		T17f37(ac, GE_void(R), (T2)(' '));
		T17f42(ac, GE_void(R), ((T44*)(C))->a4);
	}
	return R;
}

/* AP_STRING_OPTION.has_long_form */
T1 T44f21(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = ((((T44*)(C))->a8)!=(EIF_VOID));
	return R;
}

/* AP_STRING_OPTION.names */
T0* T44f19p1(GE_context* ac, T0* C)
{
	T2 t1;
	T1 t2;
	T0* m1 = 0;
	T0* R = 0;
	T0* l1 = 0;
	if (((T44*)(C))->a7) {
		t1 = (T2)('-');
		l1 = (T2f1(ac, &t1));
		T17f37(ac, GE_void(l1), ((T44*)(C))->a6);
	}
	t2 = (((T44*)(C))->a8?((m1 = ((T44*)(C))->a8, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f42(ac, GE_void(l1), GE_ms8(", ", 2));
		}
		T17f37(ac, GE_void(l1), (T2)('-'));
		T17f37(ac, GE_void(l1), (T2)('-'));
		T17f42(ac, GE_void(l1), m1);
	}
	{
		t2 = ((l1)!=(EIF_VOID));
		if (!(t2)) {
			GE_raise(GE_EX_CHECK);
		}		R = l1;
	}
	return R;
}

/* AP_FLAG.names */
T0* T42f15(GE_context* ac, T0* C)
{
	T2 t1;
	T1 t2;
	T0* m1 = 0;
	T0* R = 0;
	T0* l1 = 0;
	if (((T42*)(C))->a5) {
		t1 = (T2)('-');
		l1 = (T2f1(ac, &t1));
		T17f37(ac, GE_void(l1), ((T42*)(C))->a4);
	}
	t2 = (((T42*)(C))->a3?((m1 = ((T42*)(C))->a3, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f42(ac, GE_void(l1), GE_ms8(", ", 2));
		}
		T17f37(ac, GE_void(l1), (T2)('-'));
		T17f37(ac, GE_void(l1), (T2)('-'));
		T17f42(ac, GE_void(l1), m1);
	}
	{
		t2 = ((l1)!=(EIF_VOID));
		if (!(t2)) {
			GE_raise(GE_EX_CHECK);
		}		R = l1;
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.example */
T0* T112f27(GE_context* ac, T0* C)
{
	T1 t1;
	T0* t2;
	T0* R = 0;
	T0* l1 = 0;
	R = T17c36(ac, (T6)(GE_int32(20)));
	t1 = ((T1)(!(((T112*)(C))->a6)));
	if (t1) {
		T17f37(ac, GE_void(R), (T2)('['));
	}
	T17f37(ac, GE_void(R), (T2)('-'));
	if (((T112*)(C))->a3) {
		t2 = (T2f1(ac, &(((T112*)(C))->a2)));
		T17f42(ac, GE_void(R), t2);
	} else {
		l1 = ((T112*)(C))->a4;
		T17f37(ac, GE_void(R), (T2)('-'));
		T17f42(ac, GE_void(R), l1);
	}
	t1 = ((T1)(!(((T112*)(C))->a6)));
	if (t1) {
		T17f37(ac, GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_STRING_OPTION.example */
T0* T44f20(GE_context* ac, T0* C)
{
	T1 t1;
	T0* R = 0;
	T0* l1 = 0;
	R = T17c36(ac, (T6)(GE_int32(20)));
	t1 = ((T1)(!(((T44*)(C))->a9)));
	if (t1) {
		T17f37(ac, GE_void(R), (T2)('['));
	}
	T17f37(ac, GE_void(R), (T2)('-'));
	if (((T44*)(C))->a7) {
		T17f37(ac, GE_void(R), ((T44*)(C))->a6);
		T17f37(ac, GE_void(R), (T2)(' '));
		T17f42(ac, GE_void(R), ((T44*)(C))->a4);
	} else {
		T17f37(ac, GE_void(R), (T2)('-'));
		l1 = ((T44*)(C))->a8;
		T17f42(ac, GE_void(R), l1);
		t1 = ((T1)(!(((T44*)(C))->a5)));
		if (t1) {
			T17f37(ac, GE_void(R), (T2)('['));
		}
		T17f37(ac, GE_void(R), (T2)('='));
		T17f42(ac, GE_void(R), ((T44*)(C))->a4);
		t1 = ((T1)(!(((T44*)(C))->a5)));
		if (t1) {
			T17f37(ac, GE_void(R), (T2)(']'));
		}
	}
	t1 = ((T1)(!(((T44*)(C))->a9)));
	if (t1) {
		T17f37(ac, GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_FLAG.example */
T0* T42f16(GE_context* ac, T0* C)
{
	T1 t1;
	T0* t2;
	T0* R = 0;
	T0* l1 = 0;
	R = T17c36(ac, (T6)(GE_int32(20)));
	t1 = ((T1)(!(((T42*)(C))->a6)));
	if (t1) {
		T17f37(ac, GE_void(R), (T2)('['));
	}
	T17f37(ac, GE_void(R), (T2)('-'));
	if (((T42*)(C))->a5) {
		t2 = (T2f1(ac, &(((T42*)(C))->a4)));
		T17f42(ac, GE_void(R), t2);
	} else {
		l1 = ((T42*)(C))->a3;
		T17f37(ac, GE_void(R), (T2)('-'));
		T17f42(ac, GE_void(R), l1);
	}
	t1 = ((T1)(!(((T42*)(C))->a6)));
	if (t1) {
		T17f37(ac, GE_void(R), (T2)(']'));
	}
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.found */
T1 T41f36(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (((((((T41*)(C))->a9) != ((T6)(GE_int32(-1)))))));
	return R;
}

/* GEANT_VARIABLES.found */
T1 T36f36(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (((((((T36*)(C))->a9) != ((T6)(GE_int32(-1)))))));
	return R;
}

/* GEANT_PROJECT_VARIABLES.found */
T1 T32f44(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (((((((T32*)(C))->a10) != ((T6)(GE_int32(-1)))))));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.found_item */
T0* T41f41(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T41f38(ac, C, ((T41*)(C))->a9));
	return R;
}

/* GEANT_VARIABLES.found_item */
T0* T36f41(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T36f35(ac, C, ((T36*)(C))->a9));
	return R;
}

/* GEANT_PROJECT_VARIABLES.found_item */
T0* T32f53(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T32f48(ac, C, ((T32*)(C))->a10));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.after */
T1 T41f42(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T41f45(ac, C, ((T41*)(C))->a19));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.cursor_after */
T1 T41f45(GE_context* ac, T0* C, T0* a1)
{
	T1 R = 0;
	R = (T105f4(ac, GE_void(a1)));
	return R;
}

/* GEANT_VARIABLES.after */
T1 T36f42(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T36f45(ac, C, ((T36*)(C))->a19));
	return R;
}

/* GEANT_VARIABLES.cursor_after */
T1 T36f45(GE_context* ac, T0* C, T0* a1)
{
	T1 R = 0;
	R = (T105f4(ac, GE_void(a1)));
	return R;
}

/* GEANT_PROJECT_VARIABLES.after */
T1 T32f54(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T32f57(ac, C, ((T32*)(C))->a19));
	return R;
}

/* GEANT_PROJECT_VARIABLES.cursor_after */
T1 T32f57(GE_context* ac, T0* C, T0* a1)
{
	T1 R = 0;
	R = (T105f4(ac, GE_void(a1)));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.key_for_iteration */
T0* T41f43(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T41f35(ac, C, ((T41*)(C))->a19));
	return R;
}

/* GEANT_VARIABLES.key_for_iteration */
T0* T36f43(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T36f38(ac, C, ((T36*)(C))->a19));
	return R;
}

/* GEANT_PROJECT_VARIABLES.key_for_iteration */
T0* T32f55(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T32f46(ac, C, ((T32*)(C))->a19));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.item_for_iteration */
T0* T41f44(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T41f34(ac, C, ((T41*)(C))->a19));
	return R;
}

/* GEANT_VARIABLES.item_for_iteration */
T0* T36f44(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T36f37(ac, C, ((T36*)(C))->a19));
	return R;
}

/* GEANT_PROJECT_VARIABLES.item_for_iteration */
T0* T32f56(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T32f45(ac, C, ((T32*)(C))->a19));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.has */
T1 T41f32(GE_context* ac, T0* C, T0* a1)
{
	T1 R = 0;
	T41f51(ac, C, a1);
	R = (((((((T41*)(C))->a1) != ((T6)(GE_int32(-1)))))));
	return R;
}

/* GEANT_VARIABLES.has */
T1 T36f32(GE_context* ac, T0* C, T0* a1)
{
	T1 R = 0;
	T36f52(ac, C, a1);
	R = (((((((T36*)(C))->a1) != ((T6)(GE_int32(-1)))))));
	return R;
}

/* GEANT_PROJECT_VARIABLES.has */
T1 T32f49(GE_context* ac, T0* C, T0* a1)
{
	T1 R = 0;
	T32f65(ac, C, a1);
	R = (((((((T32*)(C))->a3) != ((T6)(GE_int32(-1)))))));
	return R;
}

T0* GE_ma40(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new39(c, EIF_FALSE);
	*(T39*)t1 = GE_default39;
	((T39*)(t1))->a2 = c;
	((T39*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T39*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new40(EIF_TRUE);
	((T40*)(R))->a1 = t1;
	((T40*)(R))->a2 = 1;
	((T40*)(R))->a3 = c;
	return R;
}

T0* GE_ma263(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new95(c, EIF_FALSE);
	*(T95*)t1 = GE_default95;
	((T95*)(t1))->a2 = c;
	((T95*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T6 *i = ((T95*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T6);
		}
		va_end(v);
	}
	R = GE_new263(EIF_TRUE);
	((T263*)(R))->a1 = t1;
	((T263*)(R))->a2 = 1;
	((T263*)(R))->a3 = c;
	return R;
}

T0* GE_ma229(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new228(c, EIF_FALSE);
	*(T228*)t1 = GE_default228;
	((T228*)(t1))->a2 = c;
	((T228*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T228*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new229(EIF_TRUE);
	((T229*)(R))->a1 = t1;
	((T229*)(R))->a2 = 1;
	((T229*)(R))->a3 = c;
	return R;
}

T0* GE_ma572(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new571(c, EIF_FALSE);
	*(T571*)t1 = GE_default571;
	((T571*)(t1))->a2 = c;
	((T571*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T571*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new572(EIF_TRUE);
	((T572*)(R))->a1 = t1;
	((T572*)(R))->a2 = 1;
	((T572*)(R))->a3 = c;
	return R;
}

T0* GE_ma545(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new96(c, EIF_FALSE);
	*(T96*)t1 = GE_default96;
	((T96*)(t1))->a2 = c;
	((T96*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T1 *i = ((T96*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = (T1)va_arg(v, int);
		}
		va_end(v);
	}
	R = GE_new545(EIF_TRUE);
	((T545*)(R))->a1 = t1;
	((T545*)(R))->a2 = 1;
	((T545*)(R))->a3 = c;
	return R;
}

T0* GE_mt27(T6 a1, T6 a2, T6 a3, T0* a4, T0* a5, T0* a6, T0* a7, T0* a8, T0* a9, T6 a10, T1 a11)
{
	T0* R;
	R = GE_new27(EIF_TRUE);
	((T27*)(R))->z1 = a1;
	((T27*)(R))->z2 = a2;
	((T27*)(R))->z3 = a3;
	((T27*)(R))->z4 = a4;
	((T27*)(R))->z5 = a5;
	((T27*)(R))->z6 = a6;
	((T27*)(R))->z7 = a7;
	((T27*)(R))->z8 = a8;
	((T27*)(R))->z9 = a9;
	((T27*)(R))->z10 = a10;
	((T27*)(R))->z11 = a11;
	return R;
}

T0* GE_mt618(T0* a1)
{
	T0* R;
	R = GE_new618(EIF_TRUE);
	((T618*)(R))->z1 = a1;
	return R;
}

T0* GE_mt670(T0* a1)
{
	T0* R;
	R = GE_new670(EIF_TRUE);
	((T670*)(R))->z1 = a1;
	return R;
}

T0* ge133ov5162;
T0* ge169ov3427;
T0* ge223ov6754;
T0* ge233ov8324;
T0* ge154ov9599;
T0* ge154ov9600;
T0* ge156ov3773;
T0* ge171ov3427;
T0* ge177ov3817;
T0* ge177ov3818;
T0* ge162ov4399;
T0* ge162ov4398;
T0* ge174ov3817;
T0* ge174ov3818;
T0* ge1507ov5699;
T0* ge1507ov5698;
T0* ge309ov11781;
T0* ge160ov3427;
T0* ge1359ov3410;
T0* ge424ov10045;
T0* ge155ov3976;
T0* ge457ov9736;
T0* ge260ov3427;
T0* ge1514ov6147;
T0* ge1514ov6109;
T0* ge1514ov6107;
T0* ge1514ov6148;
T0* ge1514ov6120;
T0* ge1514ov6119;
T0* ge1514ov6130;
T0* ge1514ov6124;
T0* ge1514ov6123;
T0* ge1514ov6122;
T0* ge1514ov6128;
T0* ge1514ov6127;
T0* ge1514ov6129;
T0* ge1514ov6106;
T0* ge1514ov6132;
T0* ge1514ov6141;
T0* ge1517ov5839;
T0* ge1517ov5837;
T0* ge1517ov5838;
T0* ge1514ov6142;
T0* ge1514ov6143;
T0* ge1514ov6146;
T0* ge1514ov6144;
T0* ge1514ov6145;
T0* ge1514ov6139;
T0* ge1510ov7715;
T0* ge1510ov7716;
T0* ge1514ov6112;
T0* ge1514ov6135;
T0* ge1514ov6155;
T0* ge1514ov6156;
T0* ge1514ov6157;
T0* ge1514ov6150;
T0* ge1514ov6133;
T0* ge1514ov6134;
T0* ge1514ov6136;
T0* ge1514ov6140;
T0* ge1464ov6446;
T0* ge177ov3828;
T0* ge174ov3828;
T0* ge103ov3105;
T0* ge106ov3392;
T0* ge106ov3399;
T0* ge193ov1955;
T0* ge106ov3395;
T0* ge106ov3402;
T0* ge106ov3393;
T0* ge106ov3400;
T0* ge106ov3394;
T0* ge106ov3401;
T0* ge106ov3396;
T0* ge106ov3403;
T0* ge106ov3397;
T0* ge106ov3404;
T0* ge103ov3100;
T0* ge103ov3099;
T0* ge103ov3107;
T0* ge103ov3106;
T0* ge428ov10805;
T0* ge428ov10842;
T0* ge428ov10827;
T0* ge428ov10820;
T0* ge428ov10830;
T0* ge428ov10823;
T0* ge428ov10831;
T0* ge428ov10840;
T0* ge428ov10833;
T0* ge428ov10829;
T0* ge428ov10817;
T0* ge428ov10818;
T0* ge428ov10832;
T0* ge428ov10819;
T0* ge428ov10806;
T0* ge428ov10807;
T0* ge428ov10808;
T0* ge428ov10814;
T0* ge428ov10816;
T0* ge428ov10811;
T0* ge428ov10836;
T0* ge428ov10835;
T0* ge428ov10812;
T0* ge428ov10813;
T0* ge428ov10810;
T0* ge428ov10809;
T0* ge42ov9366;
T0* ge157ov3955;
T0* ge155ov3978;
T0* ge2310ov9660;
T0* ge2310ov9661;
T0* ge154ov9598;
T0* ge1521ov7191;
T0* ge1521ov7192;
T0* ge1512ov8332;
T0* ge1512ov8334;
T0* ge1444ov8030;
T0* ge1444ov8031;
T0* ge104ov5114;
T0* ge104ov5115;
T0* ge104ov5116;
T0* ge104ov5113;
T0* ge1512ov8331;
T0* ge1512ov8333;
T0* ge294ov3408;
T0* ge280ov3408;
T0* ge286ov3408;
T0* ge285ov3408;
T0* ge284ov3408;
T0* ge275ov3408;
T0* ge274ov3408;
T0* ge291ov3408;
T0* ge304ov3408;
T0* ge1363ov3408;
T0* ge1368ov3408;

void GE_init_const1()
{
	ge133ov5162 = (GE_ms8("", 0));
	ge169ov3427 = (GE_ms8("\n", 1));
	ge223ov6754 = (GE_ms8("", 0));
	ge233ov8324 = (GE_ms8("", 0));
	ge154ov9599 = (GE_ms8("", 0));
	ge154ov9600 = (GE_ms8("empty_name", 10));
	ge156ov3773 = (GE_ms8("dummy", 5));
	ge171ov3427 = (GE_ms8("\n", 1));
	ge177ov3817 = (GE_ms8(".", 1));
	ge177ov3818 = (GE_ms8("..", 2));
	ge162ov4399 = (GE_ms8("..", 2));
	ge162ov4398 = (GE_ms8(".", 1));
	ge174ov3817 = (GE_ms8(".", 1));
	ge174ov3818 = (GE_ms8("..", 2));
	ge1507ov5699 = (GE_ms8("undefined", 9));
	ge1507ov5698 = (GE_ms8("(TRUNCATED)", 11));
	ge309ov11781 = (GE_ms8("standard input", 14));
	ge160ov3427 = (GE_ms8("\n", 1));
	ge1359ov3410 = (GE_ms8("", 0));
	ge424ov10045 = (GE_ms8("", 0));
	ge155ov3976 = (GE_ms8("empty_name", 10));
	ge457ov9736 = (GE_ms8(" \t\r\n", 4));
	ge260ov3427 = (GE_ms8("\n", 1));
	ge1514ov6147 = (GE_ms8("PE reference only allowed in DTD", 32));
	ge1514ov6109 = (GE_ms8("< not allowed in attribute value", 32));
	ge1514ov6107 = (GE_ms8("-- not allowed in comment", 25));
	ge1514ov6148 = (GE_ms8("xml prefix reserved in processing instruction", 45));
	ge1514ov6120 = (GE_ms8("Misformed XML Declaration", 25));
	ge1514ov6119 = (GE_ms8("Misplaced markup declaration", 28));
	ge1514ov6130 = (GE_ms8("End tag does not match start tag", 32));
	ge1514ov6124 = (GE_ms8("Missing element end tag", 23));
	ge1514ov6123 = (GE_ms8("Error in element content", 24));
	ge1514ov6122 = (GE_ms8("Misformed start tag", 19));
	ge1514ov6128 = (GE_ms8("Attribute declared twice", 24));
	ge1514ov6127 = (GE_ms8("Misformed attribute in tag", 26));
	ge1514ov6129 = (GE_ms8("Error in end tag", 16));
	ge1514ov6106 = (GE_ms8("]]> not allowed in content", 26));
	ge1514ov6132 = (GE_ms8("Error in XML declaration", 24));
	ge1514ov6141 = (GE_ms8("Misformed element type declaration", 34));
	ge1517ov5839 = (GE_ms8("*", 1));
	ge1517ov5837 = (GE_ms8("+", 1));
	ge1517ov5838 = (GE_ms8("\?", 1));
	ge1514ov6142 = (GE_ms8("Misformed attribute list declaration", 36));
	ge1514ov6143 = (GE_ms8("Misformed attribute definition declaration", 42));
	ge1514ov6146 = (GE_ms8("Misformed conditional section", 29));
	ge1514ov6144 = (GE_ms8("Misformed entity declaration", 28));
	ge1514ov6145 = (GE_ms8("Misformed entity notation", 25));
	ge1514ov6139 = (GE_ms8("Parser is not configured to support external DTDs", 49));
	ge1510ov7715 = (GE_ms8("1.0", 3));
	ge1510ov7716 = (GE_ms8("utf-8", 5));
	ge1514ov6112 = (GE_ms8("unsupported character encoding", 30));
	ge1514ov6135 = (GE_ms8("External reference in quoted value", 34));
	ge1514ov6155 = (GE_ms8("Unexpected non-ASCII character in ASCII-only mode", 49));
	ge1514ov6156 = (GE_ms8("Unexpected non-latin1 character in latin1-only mode", 51));
	ge1514ov6157 = (GE_ms8("Invalid UTF8 character sequence", 31));
	ge1514ov6150 = (GE_ms8("Name misformed", 14));
	ge1514ov6133 = (GE_ms8("Literal entity expected in attribute", 36));
	ge1514ov6134 = (GE_ms8("Entity is not defined", 21));
	ge1514ov6136 = (GE_ms8("Entity cannot be recursively included", 37));
	ge1514ov6140 = (GE_ms8("Undefined PE entity", 19));
	ge1464ov6446 = (GE_ms8("root", 4));
	ge177ov3828 = (GE_ms8(".exe", 4));
	ge174ov3828 = (GE_ms8("", 0));
	ge103ov3105 = (GE_ms8("Errors parsing arguments, aborting.", 35));
	ge106ov3392 = (GE_ms8("The value \'$2\' is not valid for the option \'$1\'.", 48));
	ge106ov3399 = (GE_ms8("APIPAR", 6));
	ge193ov1955 = (GE_ms8("3.9", 3));
	ge106ov3395 = (GE_ms8("Too many occurrences of option \'$1\'.", 36));
	ge106ov3402 = (GE_ms8("APSOPT", 6));
	ge106ov3393 = (GE_ms8("The mandatory option \'$1\' is missing.", 37));
	ge106ov3400 = (GE_ms8("APMOPT", 6));
	ge106ov3394 = (GE_ms8("The option \'$1\' is missing a parameter.", 39));
	ge106ov3401 = (GE_ms8("APMPAR", 6));
	ge106ov3396 = (GE_ms8("Unknown option \'$1\'.", 20));
	ge106ov3403 = (GE_ms8("APUOPT", 6));
	ge106ov3397 = (GE_ms8("The flag \'$1\' was given the parameter \'$2\'.", 43));
	ge106ov3404 = (GE_ms8("APUPAR", 6));
	ge103ov3100 = (GE_ms8("help", 4));
	ge103ov3099 = (GE_ms8("Display this help text.", 23));
	ge103ov3107 = (GE_ms8("parameters ...", 14));
	ge103ov3106 = (GE_ms8("", 0));
	ge428ov10805 = (GE_ms8("compilation successfully", 24));
	ge428ov10842 = (GE_ms8("no pattern compiled", 19));
	ge428ov10827 = (GE_ms8("unmatched parentheses", 21));
	ge428ov10820 = (GE_ms8("back reference to non-existent subpattern", 41));
	ge428ov10830 = (GE_ms8("lookbehind assertion is not fixed length", 40));
	ge428ov10823 = (GE_ms8("missing ) after comment", 23));
	ge428ov10831 = (GE_ms8("malformed number after (\?(", 26));
	ge428ov10840 = (GE_ms8("invalid condition (\?(0)", 23));
	ge428ov10833 = (GE_ms8("assertion expected after (\?(", 28));
	ge428ov10829 = (GE_ms8("unrecognized character after (\?<", 32));
	ge428ov10817 = (GE_ms8("unrecognized character after (\?", 31));
	ge428ov10818 = (GE_ms8("too many capturing parenthesized sub-patterns", 45));
	ge428ov10832 = (GE_ms8("conditional group contains more than two branches", 49));
	ge428ov10819 = (GE_ms8("missing )", 9));
	ge428ov10806 = (GE_ms8("\\ at end of pattern", 19));
	ge428ov10807 = (GE_ms8("\\c at end of pattern", 20));
	ge428ov10808 = (GE_ms8("unrecognized character follows \\", 32));
	ge428ov10814 = (GE_ms8("nothing to repeat", 17));
	ge428ov10816 = (GE_ms8("internal error: unexpected repeat", 33));
}

void GE_init_const2()
{
	ge428ov10811 = (GE_ms8("missing terminating ] for character class", 41));
	ge428ov10836 = (GE_ms8("POSIX collating elements are not supported", 42));
	ge428ov10835 = (GE_ms8("unknown POSIX class name", 24));
	ge428ov10812 = (GE_ms8("invalid escape sequence in character class", 42));
	ge428ov10813 = (GE_ms8("range out of order in character class", 37));
	ge428ov10810 = (GE_ms8("number too big in {} quantifier", 31));
	ge428ov10809 = (GE_ms8("numbers out of order in {} quantifier", 37));
	ge42ov9366 = (GE_ms8("_dummy_", 7));
	ge157ov3955 = (GE_ms8("", 0));
	ge155ov3978 = (GE_ms8("dummy", 5));
	ge2310ov9660 = (GE_ms8(".", 1));
	ge2310ov9661 = (GE_ms8("..", 2));
	ge154ov9598 = (GE_ms8("dummy", 5));
	ge1521ov7191 = (GE_ms8(" ", 1));
	ge1521ov7192 = (GE_ms8("  ", 2));
	ge1512ov8332 = (GE_ms8("iso-8859-1", 10));
	ge1512ov8334 = (GE_ms8("utf-16", 6));
	ge1444ov8030 = (GE_ms8("Undeclared namespace error", 26));
	ge1444ov8031 = (GE_ms8("Namespace declared twice", 24));
	ge104ov5114 = (GE_ms8("\n", 1));
	ge104ov5115 = (GE_ms8("\n", 1));
	ge104ov5116 = (GE_ms8("\nOptions:\n", 10));
	ge104ov5113 = (GE_ms8("usage: ", 7));
	ge1512ov8331 = (GE_ms8("us-ascii", 8));
	ge1512ov8333 = (GE_ms8("utf-8", 5));
	ge294ov3408 = (GE_ms8("\"$1\", line $2: negative range in character class", 48));
	ge280ov3408 = (GE_ms8("\"$1\", line $2: character \'$3\' out of range", 42));
	ge286ov3408 = (GE_ms8("$0: variable trailing context rules cannot be used with -f", 58));
	ge285ov3408 = (GE_ms8("$0: `reject\' cannot be used with -f", 35));
	ge284ov3408 = (GE_ms8("$0: -f and -m don\'t make sense together", 39));
	ge275ov3408 = (GE_ms8("\"$1\", line $2: bad character: $3", 32));
	ge274ov3408 = (GE_ms8("\"$1\", line $2: bad character class or missing close bracket", 59));
	ge291ov3408 = (GE_ms8("\"$1\", line $2: missing quote", 28));
	ge304ov3408 = (GE_ms8("\"$1\", line $2: unrecognized rule", 32));
	ge1363ov3408 = (GE_ms8("Syntax error in \"$1\" at line $2", 31));
	ge1368ov3408 = (GE_ms8("$0 version $1", 13));
}

void GE_init_const()
{
	GE_init_const1();
	GE_init_const2();
}

EIF_TYPE GE_types[677] = {
{0, 0, EIF_FALSE, 0},
{658, 1, EIF_FALSE, 0, 0},
{0, 2, EIF_FALSE, 0, 0},
{0, 3, EIF_FALSE, 0, 0},
{0, 4, EIF_FALSE, 0, 0},
{0, 5, EIF_FALSE, 0, 0},
{507, 6, EIF_FALSE, 0, 0},
{0, 7, EIF_FALSE, 0, 0},
{0, 8, EIF_FALSE, 0, 0},
{0, 9, EIF_FALSE, 0, 0},
{0, 10, EIF_FALSE, 0, 0},
{0, 11, EIF_FALSE, 0, 0},
{0, 12, EIF_FALSE, 0, 0},
{0, 13, EIF_FALSE, 0, 0},
{0, 14, EIF_FALSE, 0, 0},
{0, 15, EIF_TRUE, 0, 0},
{0, 16, EIF_TRUE, 0, 0},
{260, 17, EIF_FALSE, 0, 0},
{0, 18, EIF_FALSE, 0, 0},
{0, 19, EIF_FALSE, 0, 0},
{0, 20, EIF_FALSE, 0, 0},
{0, 21, EIF_FALSE, 0, 0},
{0, 22, EIF_FALSE, 0, 0},
{0, 23, EIF_FALSE, 0, 0},
{0, 24, EIF_FALSE, 0, 0},
{0, 25, EIF_FALSE, 0, 0},
{0, 26, EIF_FALSE, 0, 0},
{0, 27, EIF_FALSE, 0, 0},
{503, 28, EIF_FALSE, 0, 0},
{0, 29, EIF_FALSE, 0, 0},
{0, 30, EIF_FALSE, 0, 0},
{0, 31, EIF_FALSE, 0, 0},
{0, 32, EIF_FALSE, 0, 0},
{314, 33, EIF_FALSE, 0, 0},
{0, 34, EIF_FALSE, 0, 0},
{0, 35, EIF_FALSE, 0, 0},
{0, 36, EIF_FALSE, 0, 0},
{0, 37, EIF_FALSE, 0, 0},
{0, 38, EIF_FALSE, 0, 0},
{0, 39, EIF_TRUE, 0, 0},
{0, 40, EIF_FALSE, 0, 0},
{0, 41, EIF_FALSE, 0, 0},
{0, 42, EIF_FALSE, 0, 0},
{0, 43, EIF_FALSE, 0, 0},
{0, 44, EIF_FALSE, 0, 0},
{0, 45, EIF_FALSE, 0, 0},
{0, 46, EIF_FALSE, 0, 0},
{0, 47, EIF_FALSE, 0, 0},
{0, 48, EIF_FALSE, 0, 0},
{0, 49, EIF_FALSE, 0, 0},
{0, 50, EIF_FALSE, 0, 0},
{0, 51, EIF_FALSE, 0, 0},
{0, 52, EIF_FALSE, 0, 0},
{0, 53, EIF_FALSE, 0, 0},
{0, 54, EIF_FALSE, 0, 0},
{0, 55, EIF_FALSE, 0, 0},
{0, 56, EIF_FALSE, 0, 0},
{0, 57, EIF_FALSE, 0, 0},
{59, 58, EIF_FALSE, 0, 0},
{0, 59, EIF_FALSE, 0, 0},
{61, 60, EIF_FALSE, 0, 0},
{0, 61, EIF_FALSE, 0, 0},
{63, 62, EIF_FALSE, 0, 0},
{0, 63, EIF_FALSE, 0, 0},
{0, 64, EIF_FALSE, 0, 0},
{0, 65, EIF_FALSE, 0, 0},
{0, 66, EIF_FALSE, 0, 0},
{0, 67, EIF_FALSE, 0, 0},
{0, 68, EIF_FALSE, 0, 0},
{0, 69, EIF_FALSE, 0, 0},
{0, 70, EIF_FALSE, 0, 0},
{0, 71, EIF_FALSE, 0, 0},
{0, 72, EIF_FALSE, 0, 0},
{0, 73, EIF_FALSE, 0, 0},
{0, 74, EIF_FALSE, 0, 0},
{0, 75, EIF_FALSE, 0, 0},
{0, 76, EIF_FALSE, 0, 0},
{0, 77, EIF_FALSE, 0, 0},
{0, 78, EIF_FALSE, 0, 0},
{0, 79, EIF_FALSE, 0, 0},
{0, 80, EIF_FALSE, 0, 0},
{0, 81, EIF_FALSE, 0, 0},
{0, 82, EIF_FALSE, 0, 0},
{0, 83, EIF_FALSE, 0, 0},
{0, 84, EIF_FALSE, 0, 0},
{0, 85, EIF_FALSE, 0, 0},
{0, 86, EIF_FALSE, 0, 0},
{502, 87, EIF_FALSE, 0, 0},
{0, 88, EIF_FALSE, 0, 0},
{0, 89, EIF_FALSE, 0, 0},
{0, 90, EIF_FALSE, 0, 0},
{0, 91, EIF_FALSE, 0, 0},
{0, 92, EIF_FALSE, 0, 0},
{0, 93, EIF_FALSE, 0, 0},
{0, 94, EIF_FALSE, 0, 0},
{0, 95, EIF_TRUE, 0, 0},
{0, 96, EIF_TRUE, 0, 0},
{0, 97, EIF_FALSE, &T97f61, 0},
{0, 98, EIF_FALSE, 0, 0},
{0, 99, EIF_FALSE, 0, 0},
{0, 100, EIF_FALSE, 0, 0},
{0, 101, EIF_FALSE, 0, 0},
{0, 102, EIF_FALSE, 0, 0},
{0, 103, EIF_FALSE, 0, 0},
{0, 104, EIF_FALSE, 0, 0},
{0, 105, EIF_FALSE, 0, 0},
{0, 106, EIF_FALSE, 0, 0},
{0, 107, EIF_FALSE, 0, 0},
{0, 108, EIF_FALSE, 0, 0},
{0, 109, EIF_FALSE, 0, 0},
{0, 110, EIF_FALSE, 0, 0},
{0, 111, EIF_FALSE, 0, 0},
{0, 112, EIF_FALSE, 0, 0},
{0, 113, EIF_FALSE, 0, 0},
{0, 114, EIF_FALSE, 0, 0},
{0, 115, EIF_FALSE, 0, 0},
{0, 116, EIF_FALSE, 0, 0},
{0, 117, EIF_FALSE, 0, 0},
{0, 118, EIF_FALSE, 0, 0},
{0, 119, EIF_FALSE, 0, 0},
{0, 120, EIF_FALSE, 0, 0},
{0, 121, EIF_FALSE, 0, 0},
{0, 122, EIF_FALSE, 0, 0},
{0, 123, EIF_FALSE, 0, 0},
{0, 124, EIF_FALSE, 0, 0},
{0, 125, EIF_FALSE, 0, 0},
{0, 126, EIF_FALSE, 0, 0},
{0, 127, EIF_FALSE, 0, 0},
{0, 128, EIF_FALSE, &T128f10, 0},
{0, 129, EIF_FALSE, 0, 0},
{0, 130, EIF_FALSE, 0, 0},
{0, 131, EIF_FALSE, 0, 0},
{0, 132, EIF_FALSE, 0, 0},
{0, 133, EIF_FALSE, 0, 0},
{0, 134, EIF_FALSE, 0, 0},
{0, 135, EIF_FALSE, 0, 0},
{0, 136, EIF_FALSE, 0, 0},
{0, 137, EIF_FALSE, 0, 0},
{0, 138, EIF_FALSE, 0, 0},
{0, 139, EIF_FALSE, 0, 0},
{0, 140, EIF_FALSE, 0, 0},
{0, 141, EIF_FALSE, 0, 0},
{0, 142, EIF_FALSE, 0, 0},
{0, 143, EIF_FALSE, 0, 0},
{0, 144, EIF_FALSE, 0, 0},
{0, 145, EIF_FALSE, 0, 0},
{0, 146, EIF_FALSE, 0, 0},
{0, 147, EIF_FALSE, 0, 0},
{0, 148, EIF_FALSE, 0, 0},
{0, 149, EIF_FALSE, 0, 0},
{0, 150, EIF_FALSE, 0, 0},
{0, 151, EIF_FALSE, 0, 0},
{0, 152, EIF_FALSE, 0, 0},
{0, 153, EIF_FALSE, 0, 0},
{0, 154, EIF_TRUE, 0, 0},
{0, 155, EIF_FALSE, 0, 0},
{0, 156, EIF_FALSE, 0, 0},
{0, 157, EIF_TRUE, 0, 0},
{0, 158, EIF_FALSE, 0, 0},
{0, 159, EIF_FALSE, 0, 0},
{0, 160, EIF_FALSE, 0, 0},
{0, 161, EIF_FALSE, 0, 0},
{0, 162, EIF_FALSE, 0, 0},
{0, 163, EIF_FALSE, 0, 0},
{0, 164, EIF_FALSE, 0, 0},
{0, 165, EIF_FALSE, 0, 0},
{0, 166, EIF_FALSE, 0, 0},
{0, 167, EIF_TRUE, 0, 0},
{0, 168, EIF_FALSE, 0, 0},
{0, 169, EIF_FALSE, 0, 0},
{0, 170, EIF_FALSE, 0, 0},
{0, 171, EIF_FALSE, 0, 0},
{0, 172, EIF_TRUE, 0, 0},
{0, 173, EIF_FALSE, 0, 0},
{0, 174, EIF_FALSE, 0, 0},
{0, 175, EIF_FALSE, 0, 0},
{0, 176, EIF_FALSE, 0, 0},
{0, 177, EIF_FALSE, 0, 0},
{0, 178, EIF_FALSE, 0, 0},
{0, 179, EIF_TRUE, 0, 0},
{0, 180, EIF_FALSE, 0, 0},
{0, 181, EIF_FALSE, 0, 0},
{0, 182, EIF_FALSE, 0, 0},
{0, 183, EIF_FALSE, 0, 0},
{0, 184, EIF_FALSE, 0, 0},
{0, 185, EIF_FALSE, 0, 0},
{0, 186, EIF_FALSE, 0, 0},
{0, 187, EIF_FALSE, 0, 0},
{0, 188, EIF_FALSE, 0, 0},
{0, 189, EIF_FALSE, 0, 0},
{0, 190, EIF_FALSE, 0, 0},
{0, 191, EIF_FALSE, 0, 0},
{0, 192, EIF_FALSE, 0, 0},
{0, 193, EIF_FALSE, 0, 0},
{0, 194, EIF_TRUE, 0, 0},
{0, 195, EIF_FALSE, 0, 0},
{0, 196, EIF_FALSE, 0, 0},
{0, 197, EIF_FALSE, 0, 0},
{0, 198, EIF_FALSE, 0, 0},
{0, 199, EIF_FALSE, 0, 0},
{0, 200, EIF_FALSE, 0, 0},
{0, 201, EIF_FALSE, 0, 0},
{0, 202, EIF_FALSE, 0, 0},
{0, 203, EIF_FALSE, 0, 0},
{0, 204, EIF_TRUE, 0, 0},
{0, 205, EIF_FALSE, 0, 0},
{0, 206, EIF_TRUE, 0, 0},
{0, 207, EIF_FALSE, 0, 0},
{0, 208, EIF_TRUE, 0, 0},
{0, 209, EIF_FALSE, 0, 0},
{0, 210, EIF_FALSE, 0, 0},
{0, 211, EIF_TRUE, 0, 0},
{0, 212, EIF_FALSE, 0, 0},
{0, 213, EIF_TRUE, 0, 0},
{0, 214, EIF_FALSE, 0, 0},
{0, 215, EIF_FALSE, 0, 0},
{0, 216, EIF_TRUE, 0, 0},
{0, 217, EIF_FALSE, 0, 0},
{0, 218, EIF_TRUE, 0, 0},
{0, 219, EIF_FALSE, 0, 0},
{0, 220, EIF_FALSE, 0, 0},
{0, 221, EIF_TRUE, 0, 0},
{0, 222, EIF_FALSE, 0, 0},
{0, 223, EIF_FALSE, 0, 0},
{0, 224, EIF_FALSE, 0, 0},
{0, 225, EIF_FALSE, 0, 0},
{0, 226, EIF_FALSE, 0, 0},
{0, 227, EIF_FALSE, 0, 0},
{0, 228, EIF_TRUE, 0, 0},
{0, 229, EIF_FALSE, 0, 0},
{0, 230, EIF_FALSE, 0, 0},
{0, 231, EIF_FALSE, 0, 0},
{0, 232, EIF_FALSE, 0, 0},
{0, 233, EIF_FALSE, 0, 0},
{0, 234, EIF_FALSE, 0, 0},
{0, 235, EIF_FALSE, 0, 0},
{0, 236, EIF_FALSE, 0, 0},
{0, 237, EIF_FALSE, 0, 0},
{0, 238, EIF_FALSE, 0, 0},
{0, 239, EIF_FALSE, 0, 0},
{0, 240, EIF_FALSE, 0, 0},
{0, 241, EIF_FALSE, 0, 0},
{0, 242, EIF_TRUE, 0, 0},
{0, 243, EIF_FALSE, 0, 0},
{0, 244, EIF_TRUE, 0, 0},
{0, 245, EIF_FALSE, 0, 0},
{0, 246, EIF_FALSE, 0, 0},
{0, 247, EIF_FALSE, 0, 0},
{0, 248, EIF_FALSE, 0, 0},
{0, 249, EIF_FALSE, 0, 0},
{0, 250, EIF_FALSE, 0, 0},
{0, 251, EIF_FALSE, 0, 0},
{0, 252, EIF_FALSE, 0, 0},
{0, 253, EIF_FALSE, 0, 0},
{0, 254, EIF_FALSE, 0, 0},
{0, 255, EIF_FALSE, 0, 0},
{0, 256, EIF_FALSE, 0, 0},
{0, 257, EIF_FALSE, 0, 0},
{0, 258, EIF_FALSE, 0, 0},
{0, 259, EIF_FALSE, 0, 0},
{0, 260, EIF_FALSE, 0, 0},
{0, 261, EIF_FALSE, 0, 0},
{0, 262, EIF_FALSE, 0, 0},
{0, 263, EIF_FALSE, 0, 0},
{0, 264, EIF_FALSE, 0, 0},
{0, 265, EIF_FALSE, 0, 0},
{0, 266, EIF_FALSE, 0, 0},
{0, 267, EIF_FALSE, 0, 0},
{0, 268, EIF_FALSE, 0, 0},
{0, 269, EIF_FALSE, 0, 0},
{0, 270, EIF_FALSE, 0, 0},
{0, 271, EIF_FALSE, 0, 0},
{0, 272, EIF_FALSE, 0, 0},
{0, 273, EIF_FALSE, 0, 0},
{0, 274, EIF_FALSE, 0, 0},
{0, 275, EIF_FALSE, 0, 0},
{0, 276, EIF_FALSE, 0, 0},
{0, 277, EIF_FALSE, 0, 0},
{0, 278, EIF_FALSE, 0, 0},
{0, 279, EIF_FALSE, 0, 0},
{0, 280, EIF_FALSE, 0, 0},
{0, 281, EIF_FALSE, 0, 0},
{0, 282, EIF_FALSE, 0, 0},
{0, 283, EIF_FALSE, 0, 0},
{0, 284, EIF_FALSE, 0, 0},
{0, 285, EIF_FALSE, 0, 0},
{0, 286, EIF_TRUE, 0, 0},
{0, 287, EIF_FALSE, 0, 0},
{0, 288, EIF_FALSE, 0, 0},
{0, 289, EIF_FALSE, 0, 0},
{0, 290, EIF_FALSE, 0, 0},
{0, 291, EIF_FALSE, 0, 0},
{0, 292, EIF_FALSE, 0, 0},
{0, 293, EIF_FALSE, 0, 0},
{0, 294, EIF_FALSE, 0, 0},
{0, 295, EIF_FALSE, 0, 0},
{0, 296, EIF_FALSE, 0, 0},
{0, 297, EIF_FALSE, 0, 0},
{0, 298, EIF_FALSE, 0, 0},
{0, 299, EIF_FALSE, 0, 0},
{0, 300, EIF_FALSE, 0, 0},
{0, 301, EIF_FALSE, 0, 0},
{0, 302, EIF_FALSE, 0, 0},
{0, 303, EIF_FALSE, 0, 0},
{0, 304, EIF_FALSE, 0, 0},
{0, 305, EIF_TRUE, 0, 0},
{0, 306, EIF_FALSE, 0, 0},
{0, 307, EIF_FALSE, 0, 0},
{0, 308, EIF_FALSE, 0, 0},
{0, 309, EIF_FALSE, 0, 0},
{0, 310, EIF_FALSE, 0, 0},
{0, 311, EIF_FALSE, 0, 0},
{0, 312, EIF_FALSE, 0, 0},
{0, 313, EIF_FALSE, 0, 0},
{0, 314, EIF_FALSE, 0, 0},
{0, 315, EIF_FALSE, 0, 0},
{0, 316, EIF_FALSE, 0, 0},
{0, 317, EIF_FALSE, 0, 0},
{0, 318, EIF_FALSE, 0, 0},
{0, 319, EIF_FALSE, 0, 0},
{0, 320, EIF_FALSE, 0, 0},
{0, 321, EIF_FALSE, 0, 0},
{0, 322, EIF_FALSE, 0, 0},
{0, 323, EIF_FALSE, 0, 0},
{0, 324, EIF_FALSE, 0, 0},
{0, 325, EIF_FALSE, 0, 0},
{0, 326, EIF_FALSE, 0, 0},
{0, 327, EIF_FALSE, 0, 0},
{0, 328, EIF_FALSE, 0, 0},
{0, 329, EIF_FALSE, 0, 0},
{0, 330, EIF_FALSE, 0, 0},
{0, 331, EIF_FALSE, 0, 0},
{0, 332, EIF_FALSE, 0, 0},
{0, 333, EIF_FALSE, 0, 0},
{0, 334, EIF_FALSE, 0, 0},
{0, 335, EIF_FALSE, 0, 0},
{0, 336, EIF_FALSE, 0, 0},
{0, 337, EIF_FALSE, 0, 0},
{0, 338, EIF_FALSE, 0, 0},
{0, 339, EIF_FALSE, 0, 0},
{0, 340, EIF_FALSE, 0, 0},
{0, 341, EIF_FALSE, 0, 0},
{0, 342, EIF_FALSE, 0, 0},
{0, 343, EIF_FALSE, 0, 0},
{0, 344, EIF_FALSE, 0, 0},
{0, 345, EIF_FALSE, 0, 0},
{0, 346, EIF_FALSE, 0, 0},
{0, 347, EIF_FALSE, 0, 0},
{0, 348, EIF_FALSE, 0, 0},
{0, 349, EIF_FALSE, 0, 0},
{0, 350, EIF_FALSE, 0, 0},
{0, 351, EIF_FALSE, 0, 0},
{0, 352, EIF_FALSE, 0, 0},
{0, 353, EIF_FALSE, 0, 0},
{0, 354, EIF_FALSE, 0, 0},
{0, 355, EIF_FALSE, 0, 0},
{0, 356, EIF_FALSE, 0, 0},
{0, 357, EIF_FALSE, 0, 0},
{0, 358, EIF_FALSE, 0, 0},
{0, 359, EIF_FALSE, 0, 0},
{0, 360, EIF_FALSE, 0, 0},
{0, 361, EIF_FALSE, 0, 0},
{0, 362, EIF_FALSE, 0, 0},
{0, 363, EIF_FALSE, 0, 0},
{0, 364, EIF_FALSE, 0, 0},
{0, 365, EIF_FALSE, 0, 0},
{0, 366, EIF_FALSE, 0, 0},
{0, 367, EIF_FALSE, 0, 0},
{0, 368, EIF_FALSE, 0, 0},
{0, 369, EIF_FALSE, 0, 0},
{0, 370, EIF_FALSE, 0, 0},
{0, 371, EIF_FALSE, 0, 0},
{0, 372, EIF_FALSE, 0, 0},
{0, 373, EIF_FALSE, 0, 0},
{0, 374, EIF_FALSE, 0, 0},
{0, 375, EIF_FALSE, 0, 0},
{0, 376, EIF_FALSE, 0, 0},
{0, 377, EIF_FALSE, 0, 0},
{0, 378, EIF_FALSE, 0, 0},
{0, 379, EIF_FALSE, 0, 0},
{0, 380, EIF_FALSE, 0, 0},
{0, 381, EIF_FALSE, 0, 0},
{0, 382, EIF_FALSE, 0, 0},
{0, 383, EIF_FALSE, 0, 0},
{0, 384, EIF_FALSE, 0, 0},
{0, 385, EIF_FALSE, 0, 0},
{0, 386, EIF_FALSE, 0, 0},
{0, 387, EIF_TRUE, 0, 0},
{0, 388, EIF_FALSE, 0, 0},
{0, 389, EIF_FALSE, 0, 0},
{0, 390, EIF_FALSE, 0, 0},
{0, 391, EIF_FALSE, 0, 0},
{0, 392, EIF_FALSE, 0, 0},
{0, 393, EIF_TRUE, 0, 0},
{0, 394, EIF_FALSE, 0, 0},
{0, 395, EIF_FALSE, 0, 0},
{0, 396, EIF_FALSE, 0, 0},
{0, 397, EIF_FALSE, 0, 0},
{0, 398, EIF_FALSE, 0, 0},
{0, 399, EIF_FALSE, 0, 0},
{0, 400, EIF_FALSE, 0, 0},
{0, 401, EIF_FALSE, 0, 0},
{0, 402, EIF_FALSE, 0, 0},
{0, 403, EIF_FALSE, 0, 0},
{0, 404, EIF_FALSE, 0, 0},
{0, 405, EIF_FALSE, 0, 0},
{0, 406, EIF_FALSE, 0, 0},
{0, 407, EIF_FALSE, 0, 0},
{0, 408, EIF_FALSE, 0, 0},
{0, 409, EIF_FALSE, 0, 0},
{0, 410, EIF_FALSE, &T410f44, 0},
{0, 411, EIF_FALSE, 0, 0},
{0, 412, EIF_FALSE, 0, 0},
{0, 413, EIF_FALSE, 0, 0},
{0, 414, EIF_FALSE, 0, 0},
{0, 415, EIF_TRUE, 0, 0},
{0, 416, EIF_FALSE, 0, 0},
{0, 417, EIF_FALSE, 0, 0},
{0, 418, EIF_FALSE, 0, 0},
{0, 419, EIF_FALSE, 0, 0},
{0, 420, EIF_FALSE, 0, 0},
{0, 421, EIF_FALSE, 0, 0},
{0, 422, EIF_FALSE, 0, 0},
{0, 423, EIF_FALSE, 0, 0},
{0, 424, EIF_FALSE, 0, 0},
{0, 425, EIF_FALSE, 0, 0},
{0, 426, EIF_FALSE, 0, 0},
{0, 427, EIF_FALSE, 0, 0},
{0, 428, EIF_FALSE, 0, 0},
{0, 429, EIF_FALSE, 0, 0},
{0, 430, EIF_FALSE, 0, 0},
{0, 431, EIF_FALSE, 0, 0},
{0, 432, EIF_FALSE, 0, 0},
{0, 433, EIF_FALSE, 0, 0},
{0, 434, EIF_FALSE, 0, 0},
{0, 435, EIF_FALSE, 0, 0},
{0, 436, EIF_FALSE, 0, 0},
{0, 437, EIF_FALSE, 0, 0},
{0, 438, EIF_FALSE, 0, 0},
{0, 439, EIF_FALSE, 0, 0},
{0, 440, EIF_FALSE, 0, 0},
{0, 441, EIF_FALSE, 0, 0},
{0, 442, EIF_FALSE, 0, 0},
{0, 443, EIF_FALSE, 0, 0},
{0, 444, EIF_FALSE, 0, 0},
{0, 445, EIF_FALSE, 0, 0},
{0, 446, EIF_FALSE, 0, 0},
{0, 447, EIF_FALSE, 0, 0},
{0, 448, EIF_FALSE, 0, 0},
{0, 449, EIF_FALSE, 0, 0},
{0, 450, EIF_FALSE, 0, 0},
{0, 451, EIF_FALSE, 0, 0},
{0, 452, EIF_FALSE, 0, 0},
{0, 453, EIF_FALSE, 0, 0},
{0, 454, EIF_FALSE, 0, 0},
{0, 455, EIF_FALSE, 0, 0},
{0, 456, EIF_FALSE, 0, 0},
{0, 457, EIF_FALSE, 0, 0},
{0, 458, EIF_FALSE, 0, 0},
{0, 459, EIF_FALSE, 0, 0},
{0, 460, EIF_FALSE, 0, 0},
{0, 461, EIF_FALSE, 0, 0},
{0, 462, EIF_FALSE, 0, 0},
{0, 463, EIF_FALSE, 0, 0},
{0, 464, EIF_FALSE, 0, 0},
{0, 465, EIF_FALSE, 0, 0},
{0, 466, EIF_FALSE, 0, 0},
{0, 467, EIF_FALSE, 0, 0},
{0, 468, EIF_FALSE, 0, 0},
{0, 469, EIF_FALSE, 0, 0},
{0, 470, EIF_FALSE, 0, 0},
{0, 471, EIF_FALSE, 0, 0},
{0, 472, EIF_FALSE, 0, 0},
{0, 473, EIF_FALSE, 0, 0},
{0, 474, EIF_FALSE, 0, 0},
{0, 475, EIF_FALSE, 0, 0},
{0, 476, EIF_FALSE, 0, 0},
{0, 477, EIF_FALSE, 0, 0},
{0, 478, EIF_FALSE, 0, 0},
{0, 479, EIF_FALSE, 0, 0},
{0, 480, EIF_FALSE, 0, 0},
{0, 481, EIF_FALSE, 0, 0},
{0, 482, EIF_FALSE, 0, 0},
{0, 483, EIF_TRUE, 0, 0},
{0, 484, EIF_TRUE, 0, 0},
{0, 485, EIF_FALSE, 0, 0},
{0, 486, EIF_FALSE, 0, 0},
{0, 487, EIF_FALSE, 0, 0},
{0, 488, EIF_FALSE, 0, 0},
{0, 489, EIF_TRUE, 0, 0},
{0, 490, EIF_FALSE, 0, 0},
{0, 491, EIF_FALSE, 0, 0},
{0, 492, EIF_FALSE, 0, 0},
{0, 493, EIF_FALSE, 0, 0},
{0, 494, EIF_TRUE, 0, 0},
{0, 495, EIF_FALSE, 0, 0},
{0, 496, EIF_FALSE, 0, 0},
{0, 497, EIF_FALSE, 0, 0},
{0, 498, EIF_FALSE, 0, 0},
{0, 499, EIF_TRUE, 0, 0},
{0, 500, EIF_FALSE, 0, 0},
{0, 501, EIF_FALSE, 0, 0},
{0, 502, EIF_FALSE, 0, 0},
{0, 503, EIF_FALSE, 0, 0},
{0, 504, EIF_FALSE, 0, 0},
{0, 505, EIF_FALSE, 0, 0},
{0, 506, EIF_FALSE, 0, 0},
{0, 507, EIF_FALSE, 0, 0},
{0, 508, EIF_FALSE, 0, 0},
{0, 509, EIF_FALSE, 0, 0},
{0, 510, EIF_FALSE, 0, 0},
{0, 511, EIF_FALSE, 0, 0},
{0, 512, EIF_FALSE, 0, 0},
{0, 513, EIF_FALSE, 0, 0},
{0, 514, EIF_FALSE, 0, 0},
{0, 515, EIF_FALSE, 0, 0},
{0, 516, EIF_FALSE, 0, 0},
{0, 517, EIF_FALSE, 0, 0},
{0, 518, EIF_FALSE, 0, 0},
{0, 519, EIF_FALSE, 0, 0},
{0, 520, EIF_FALSE, 0, 0},
{0, 521, EIF_FALSE, 0, 0},
{0, 522, EIF_FALSE, 0, 0},
{0, 523, EIF_FALSE, 0, 0},
{0, 524, EIF_FALSE, 0, 0},
{0, 525, EIF_FALSE, 0, 0},
{0, 526, EIF_FALSE, 0, 0},
{0, 527, EIF_FALSE, &T527f26, 0},
{0, 528, EIF_FALSE, 0, 0},
{0, 529, EIF_FALSE, 0, 0},
{0, 530, EIF_FALSE, 0, 0},
{0, 531, EIF_FALSE, 0, 0},
{0, 532, EIF_FALSE, 0, 0},
{0, 533, EIF_TRUE, 0, 0},
{0, 534, EIF_FALSE, 0, 0},
{0, 535, EIF_FALSE, 0, 0},
{0, 536, EIF_FALSE, 0, 0},
{0, 537, EIF_FALSE, 0, 0},
{0, 538, EIF_FALSE, 0, 0},
{0, 539, EIF_FALSE, 0, 0},
{0, 540, EIF_FALSE, 0, 0},
{0, 541, EIF_FALSE, 0, 0},
{0, 542, EIF_FALSE, 0, 0},
{557, 543, EIF_FALSE, 0, 0},
{0, 544, EIF_FALSE, 0, 0},
{0, 545, EIF_FALSE, 0, 0},
{0, 546, EIF_FALSE, 0, 0},
{0, 547, EIF_FALSE, 0, 0},
{0, 548, EIF_FALSE, 0, 0},
{0, 549, EIF_FALSE, 0, 0},
{0, 550, EIF_FALSE, 0, 0},
{0, 551, EIF_FALSE, 0, 0},
{0, 552, EIF_FALSE, 0, 0},
{0, 553, EIF_FALSE, 0, 0},
{0, 554, EIF_TRUE, 0, 0},
{0, 555, EIF_FALSE, 0, 0},
{0, 556, EIF_FALSE, 0, 0},
{0, 557, EIF_FALSE, 0, 0},
{0, 558, EIF_FALSE, 0, 0},
{0, 559, EIF_FALSE, 0, 0},
{0, 560, EIF_FALSE, 0, 0},
{0, 561, EIF_FALSE, 0, 0},
{0, 562, EIF_FALSE, 0, 0},
{0, 563, EIF_FALSE, 0, 0},
{0, 564, EIF_FALSE, 0, 0},
{0, 565, EIF_FALSE, 0, 0},
{0, 566, EIF_FALSE, 0, 0},
{0, 567, EIF_FALSE, 0, 0},
{0, 568, EIF_FALSE, 0, 0},
{0, 569, EIF_FALSE, 0, 0},
{0, 570, EIF_FALSE, 0, 0},
{0, 571, EIF_TRUE, 0, 0},
{0, 572, EIF_FALSE, 0, 0},
{0, 573, EIF_FALSE, 0, 0},
{0, 574, EIF_FALSE, 0, 0},
{0, 575, EIF_FALSE, 0, 0},
{0, 576, EIF_FALSE, 0, 0},
{0, 577, EIF_FALSE, 0, 0},
{0, 578, EIF_FALSE, 0, 0},
{0, 579, EIF_TRUE, 0, 0},
{0, 580, EIF_FALSE, 0, 0},
{0, 581, EIF_FALSE, 0, 0},
{0, 582, EIF_FALSE, 0, 0},
{0, 583, EIF_FALSE, 0, 0},
{0, 584, EIF_TRUE, 0, 0},
{0, 585, EIF_FALSE, 0, 0},
{0, 586, EIF_FALSE, 0, 0},
{0, 587, EIF_FALSE, 0, 0},
{0, 588, EIF_FALSE, 0, 0},
{0, 589, EIF_FALSE, 0, 0},
{0, 590, EIF_FALSE, 0, 0},
{0, 591, EIF_FALSE, 0, 0},
{0, 592, EIF_FALSE, 0, 0},
{0, 593, EIF_FALSE, 0, 0},
{0, 594, EIF_FALSE, 0, 0},
{0, 595, EIF_FALSE, 0, 0},
{0, 596, EIF_TRUE, 0, 0},
{0, 597, EIF_FALSE, 0, 0},
{0, 598, EIF_FALSE, 0, 0},
{0, 599, EIF_FALSE, 0, 0},
{0, 600, EIF_FALSE, 0, 0},
{0, 601, EIF_FALSE, 0, 0},
{0, 602, EIF_FALSE, 0, 0},
{0, 603, EIF_FALSE, 0, 0},
{0, 604, EIF_FALSE, 0, 0},
{0, 605, EIF_FALSE, 0, 0},
{0, 606, EIF_FALSE, 0, 0},
{0, 607, EIF_FALSE, 0, 0},
{0, 608, EIF_FALSE, &T608f37, 0},
{0, 609, EIF_FALSE, &T609f25, 0},
{0, 610, EIF_FALSE, 0, 0},
{0, 611, EIF_FALSE, 0, 0},
{0, 612, EIF_FALSE, 0, 0},
{0, 613, EIF_FALSE, 0, 0},
{0, 614, EIF_FALSE, 0, 0},
{0, 615, EIF_FALSE, &T615f16, 0},
{0, 616, EIF_FALSE, &T616f20, 0},
{0, 617, EIF_FALSE, 0, 0},
{0, 618, EIF_FALSE, 0, 0},
{0, 619, EIF_FALSE, 0, 0},
{0, 620, EIF_FALSE, 0, 0},
{0, 621, EIF_FALSE, 0, 0},
{0, 622, EIF_TRUE, 0, 0},
{0, 623, EIF_FALSE, 0, 0},
{0, 624, EIF_FALSE, 0, 0},
{0, 625, EIF_FALSE, 0, 0},
{0, 626, EIF_FALSE, 0, 0},
{0, 627, EIF_FALSE, 0, 0},
{0, 628, EIF_FALSE, 0, 0},
{0, 629, EIF_FALSE, 0, 0},
{0, 630, EIF_FALSE, 0, 0},
{0, 631, EIF_FALSE, 0, 0},
{0, 632, EIF_FALSE, 0, 0},
{0, 633, EIF_FALSE, 0, 0},
{0, 634, EIF_TRUE, 0, 0},
{0, 635, EIF_FALSE, 0, 0},
{0, 636, EIF_FALSE, 0, 0},
{0, 637, EIF_FALSE, 0, 0},
{0, 638, EIF_FALSE, 0, 0},
{0, 639, EIF_FALSE, 0, 0},
{0, 640, EIF_FALSE, 0, 0},
{0, 641, EIF_FALSE, 0, 0},
{0, 642, EIF_TRUE, 0, 0},
{0, 643, EIF_FALSE, 0, 0},
{0, 644, EIF_FALSE, 0, 0},
{0, 645, EIF_FALSE, 0, 0},
{0, 646, EIF_FALSE, 0, 0},
{0, 647, EIF_TRUE, 0, 0},
{0, 648, EIF_FALSE, 0, 0},
{0, 649, EIF_FALSE, 0, 0},
{0, 650, EIF_FALSE, 0, 0},
{0, 651, EIF_FALSE, 0, 0},
{0, 652, EIF_FALSE, 0, 0},
{0, 653, EIF_FALSE, 0, 0},
{0, 654, EIF_FALSE, 0, 0},
{0, 655, EIF_FALSE, 0, 0},
{0, 656, EIF_FALSE, 0, 0},
{0, 657, EIF_FALSE, 0, 0},
{0, 658, EIF_FALSE, 0, 0},
{0, 659, EIF_FALSE, 0, 0},
{0, 660, EIF_FALSE, 0, 0},
{0, 661, EIF_FALSE, 0, 0},
{0, 662, EIF_FALSE, 0, 0},
{0, 663, EIF_FALSE, 0, 0},
{0, 664, EIF_FALSE, 0, 0},
{0, 665, EIF_FALSE, 0, 0},
{0, 666, EIF_FALSE, 0, 0},
{0, 667, EIF_FALSE, 0, 0},
{0, 668, EIF_FALSE, 0, 0},
{0, 669, EIF_FALSE, 0, 0},
{0, 670, EIF_FALSE, 0, 0},
{0, 671, EIF_TRUE, 0, 0},
{0, 672, EIF_FALSE, 0, 0},
{0, 673, EIF_FALSE, 0, 0},
{0, 674, EIF_FALSE, 0, 0},
{0, 675, EIF_TRUE, 0, 0},
{0, 676, EIF_TRUE, 0, 0}
};

int GE_main(int argc, EIF_NATIVE_CHAR** argv)
{
	T0* t1;
	GE_context tc = GE_default_context;
	GE_context* ac = &tc;
	GE_argc = argc;
	GE_argv = argv;
	GE_main_context = ac;
	GE_system_name = "geant";
	GE_root_class_name = "GEANT";
	GE_init_gc();
	GE_new_exception_manager = &GE_new19;
	GE_init_exception_manager = &T19f14;
	GE_set_exception_data = &T19f15;
	GE_init_exception(ac);
	GE_init_identified();
	GE_init_const();
	t1 = T22c20(ac);
	return 0;
}


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to implement class ARGUMENTS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2013, Eric Bezault and others"
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
EIF_NATIVE_CHAR** GE_argv;

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
	copyright: "Copyright (c) 2007-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_EXCEPTION_C
#define GE_EXCEPTION_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EXCEPTION_H
#include "ge_exception.h"
#endif
#ifdef EIF_WINDOWS
#include <winbase.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Pre-defined exception tags. No restriction on size.
 */
static char* GE_exception_tags[] = {
	(char *) 0,							/* Nothing */
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
	"Serialization failed."				/* GE_EX_SEL */
	"SCOOP processor dirty."			/* GE_EX_DIRTY */
};

/*
 * Exception tag associated with `code'.
 */
char* GE_exception_tag(long code)
{
	if (code < 0) {
		return "User-defined exception.";
	} else if (code < 1 || code > GE_EX_NEX) {
		return "Unknown exception.";
	} else {
		return GE_exception_tags[code];
	}
}

/*
 * Initialize `a_trace'.
 */
static void GE_init_exception_trace_buffer(GE_exception_trace_buffer* a_trace)
{
	a_trace->count = 0;
	a_trace->capacity = 0;
	a_trace->area = (char*) GE_raw_calloc_atomic_uncollectable(4096, 1);
	if (a_trace->area) {
		a_trace->capacity = 4096;
	}
}

/*
 * Append `a_string' to `a_trace'.
 * Resize area if needed.
 */
static void GE_append_to_exception_trace_buffer(GE_exception_trace_buffer* a_trace, char* a_string)
{
	int l_length = strlen(a_string);
	uint32_t l_new_capacity;
	char* l_new_area;

	if (a_trace->area) {
		if ((a_trace->capacity - a_trace->count) <= l_length) {
			l_new_capacity = a_trace->capacity + l_length + 512;
			l_new_area = (char*) GE_raw_recalloc(a_trace->area, a_trace->capacity, l_new_capacity, 1);
			if (l_new_area) {
				a_trace->area = l_new_area;
				a_trace->capacity = l_new_capacity;
			}
		}
	} else {
		GE_init_exception_trace_buffer(a_trace);
	}
	if ((a_trace->capacity - a_trace->count) > l_length) {
		strcpy (a_trace->area + a_trace->count, a_string);
		a_trace->count += l_length;
	}
}

/*
 * Wipe out `a_trace'.
 */
static void GE_wipe_out_exception_trace_buffer(GE_exception_trace_buffer* a_trace)
{
	char* l_area = a_trace->area;

	if (l_area) {
		memset (l_area, 0, a_trace->count);
		a_trace->count = 0;
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
	l_class_count = (int) strlen(a_class_name);
	l_feature_count = (int) strlen(a_feature_name);
	l_tag_count = (int) strlen(a_tag_name);

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

	l_location_count = (int) strlen(a_location);
	l_reason_count = (int) strlen(a_reason);
	l_effect_count = (int) strlen(a_effect);

		/* 1 - precision of 211 = 254 - 43, 43 being number of characters written
			   for `a_object_addr' and `a_location'.
		 * 2 - precision of 181 = 254 - 73, 73 being number of characters written
			   for `a_object_addr', `a_location' and `a_reason'.
		 * 3 - 22, number of characters written for `a_location'
		 * 4 - 29, number of characters written for `a_reason' */

		/* Check this for formatting using `printf':
		 * http://en.wikipedia.org/wiki/Printf#printf_format_placeholders */

		/* Print object address with 16 digits to be ready when pointers
		 * will be on 64 bits on all platform. */
	sprintf(buffer, "<%016" EIF_POINTER_DISPLAY ">  ", (unsigned long)(uint64_t)a_object_addr);
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
static void GE_print_exception_trace(GE_context* context, long code, const char* tag, GE_exception_trace_buffer* a_trace)
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

#ifdef EIF_THREADS
	sprintf(buffer, "%s\n", "******************************** Thread exception *****************************");
	GE_append_to_exception_trace_buffer(a_trace, buffer);
	if (context == GE_main_context) {
			/* Main thread. */
		sprintf(buffer,"%-19.19s %-22.22s 0x%" EIF_POINTER_DISPLAY " %s\n", "In thread", "Root thread", (uint64_t) 0, "(thread id)");
	} else {
		sprintf(buffer,"%-19.19s %-22.22s 0x%" EIF_POINTER_DISPLAY " %s\n", "In thread", "Child thread", (uint64_t) context->thread->thread_id, "(thread id)");
	}
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
	l_call = context->call;
	if (l_call) {
		l_class_name = l_call->class_name;
		l_feature_name = l_call->feature_name;
#ifdef EIF_CURRENT_IN_EXCEPTION_TRACE
		l_object = l_call->object;
#endif
	} else {
		l_class_name = l_root_class;
		l_feature_name = l_root_feature;
	}
	if (tag) {
		sprintf(l_tag_buf, "%.254s:", tag);
		l_tag = l_tag_buf;
	} else {
		l_tag = "";
	}
	GE_print_class_feature_tag(a_trace, l_class_name, l_feature_name, l_tag);
	l_reason = GE_exception_tag(code);
	l_effect = "Fail";
	GE_print_object_location_reason_effect(a_trace, l_object, l_location, l_reason, l_effect);
	sprintf(buffer, "%s\n", "-------------------------------------------------------------------------------");
	GE_append_to_exception_trace_buffer(a_trace, buffer);
	while (l_call) {
		l_tag = "";
		GE_print_class_feature_tag(a_trace, l_call->class_name, l_call->feature_name, l_tag);
#ifdef EIF_CURRENT_IN_EXCEPTION_TRACE
		l_object = l_call->object;
#endif
		l_reason = "Routine failure.";
		l_effect = "Fail";
		GE_print_object_location_reason_effect(a_trace, l_object, l_location, l_reason, l_effect);
		sprintf(buffer, "%s\n", "-------------------------------------------------------------------------------");
		GE_append_to_exception_trace_buffer(a_trace, buffer);
		l_call = l_call->caller;
	}
	l_tag = "";
	GE_print_class_feature_tag(a_trace, l_root_class, l_root_feature, l_tag);
#ifdef EIF_CURRENT_IN_EXCEPTION_TRACE
	l_object = NULL;
#endif
	l_reason = "Routine failure.";
	l_effect = "Exit";
	GE_print_object_location_reason_effect(a_trace, l_object, l_location, l_reason, l_effect);
	sprintf(buffer, "%s\n", "-------------------------------------------------------------------------------");
	GE_append_to_exception_trace_buffer(a_trace, buffer);
}

/*
 * Default initialization for `GE_context'.
 */
GE_context GE_default_context = {0, 0, 0, 0, 0, '\1', 0, 0, {0, 0, 0}, {0, 0, 0}
#ifdef EIF_THREADS
	, 0
#endif
	};

/*
 * Execution context of main thread.
 * Should be used from the main thread only.
 */
GE_context* GE_main_context;

/*
 * Execution context of current thread.
 */
GE_context* GE_current_context()
{
#ifdef EIF_THREADS
	GE_thread_context* volatile ge_thread_context;
	EIF_TSD_GET0(GE_thread_context*, GE_thread_context_key, ge_thread_context);
	return ge_thread_context->context;
#else
	return GE_main_context;
#endif
}

/*
 * Initialization of exception handling.
 */
void GE_init_exception(GE_context* context)
{
	EIF_REFERENCE l_exception_manager;

	GE_init_exception_trace_buffer(&context->exception_trace_buffer);
	GE_init_exception_trace_buffer(&context->last_exception_trace);
	l_exception_manager = GE_new_exception_manager(EIF_TRUE);
	context->exception_manager = l_exception_manager;
	GE_init_exception_manager(context, l_exception_manager);
}

/*
 * Pointer to function to create a new exception manager object.
 */
EIF_REFERENCE (*GE_new_exception_manager)(EIF_BOOLEAN);

/*
 * Pointer to Eiffel routine EXCEPTION_MANAGER.init_exception_manager.
 */
void (*GE_init_exception_manager)(GE_context*, EIF_REFERENCE);

/*
 * Pointer to Eiffel routine EXCEPTION_MANAGER.set_exception_data.
 */
void (*GE_set_exception_data)(GE_context*, EIF_REFERENCE, EIF_INTEGER_32, EIF_BOOLEAN, EIF_INTEGER_32, EIF_INTEGER_32, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_INTEGER_32, EIF_BOOLEAN);

/*
 * Jump to execute the rescue of the last routine with a rescue
 * in the call stack.
 */
static void GE_jump_to_last_rescue(GE_context* context)
{
	char* l_exception_trace;

	GE_rescue* r = context->last_rescue;
	if (r != 0) {
		context->last_rescue = r->previous;
		context->raising_exception = '\0';
		GE_longjmp(r->jb, 1);
	}
	if (context->exception_trace_enabled) {
#ifdef EIF_WINDOWS
		GE_show_console();
#endif
		if (GE_system_name) {
			fprintf(stderr, "\n%s: system execution failed.\n", GE_system_name);
		} else {
			fprintf(stderr, "\nsystem execution failed.\n");
		}
		l_exception_trace = context->last_exception_trace.area;
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
static void GE_call_set_exception_data(GE_context* context, long code, int new_obj, int signal_code, int error_code, const char* tag, char* recipient, char* eclass, char* rf_routine, char* rf_class, char* trace, int line_number, int is_invariant_entry)
{
	EIF_REFERENCE l_tag;
	EIF_REFERENCE l_recipient;
	EIF_REFERENCE l_eclass;
	EIF_REFERENCE l_rf_routine;
	EIF_REFERENCE l_rf_class;
	EIF_REFERENCE l_trace;
	EIF_REFERENCE ge_exception_manager;

	ge_exception_manager = context->exception_manager;
	if (!ge_exception_manager) {
		GE_init_exception(context);
		ge_exception_manager = context->exception_manager;
	}
	if (tag) {
		l_tag = GE_str8(tag);
	} else {
		l_tag = GE_ms8("", 0);
	}
	if (recipient) {
		l_recipient = GE_str8(recipient);
	} else {
		l_recipient = GE_ms8("", 0);
	}
	if (eclass) {
		l_eclass = GE_str8(eclass);
	} else {
		l_eclass = GE_ms8("", 0);
	}
	if (rf_routine) {
		l_rf_routine = GE_str8(rf_routine);
	} else {
		l_rf_routine = GE_ms8("", 0);
	}
	if (rf_class) {
		l_rf_class = GE_str8(rf_class);
	} else {
		l_rf_class = GE_ms8("", 0);
	}
	if (trace && context->exception_trace_enabled) {
		l_trace = GE_str8(trace);
	} else {
		l_trace = GE_ms8("", 0);
	}
	GE_set_exception_data(context, ge_exception_manager, (EIF_INTEGER_32) code, EIF_TEST(new_obj), (EIF_INTEGER_32) signal_code, (EIF_INTEGER_32) error_code, l_tag, l_recipient, l_eclass, l_rf_routine, l_rf_class, l_trace, (EIF_INTEGER_32) line_number, EIF_TEST(is_invariant_entry));
}

/*
 * Raise an exception.
 */
static void GE_raise_exception(long code, int new_obj, int signal_code, int error_code, const char* tag, char* recipient, char* eclass, char* rf_routine, char* rf_class, char* trace, int line_number, int is_invariant_entry)
{
	char* l_trace;
	GE_exception_trace_buffer* l_trace_buffer;
	GE_context* context;

	context = GE_current_context();
	if (!context) {
#ifdef EIF_WINDOWS
		GE_show_console();
#endif
		if (GE_system_name) {
			fprintf(stderr, "\n%s: system execution failed.\n", GE_system_name);
		} else {
			fprintf(stderr, "\nsystem execution failed.\n");
		}
		fprintf(stderr, "Panic: No execution context found.\n");
		exit(1);
	} else if (context->raising_exception) {
#ifdef EIF_WINDOWS
		GE_show_console();
#endif
		if (GE_system_name) {
			fprintf(stderr, "\n%s: system execution failed.\n", GE_system_name);
		} else {
			fprintf(stderr, "\nsystem execution failed.\n");
		}
		fprintf(stderr, "Panic: A crash occurred while processing exceptions.\n");
		l_trace = context->last_exception_trace.area;
		if (l_trace) {
			fprintf(stderr, "Following is the set of recorded exceptions\n");
			fprintf(stderr, "NB: The raised panic may have induced completely inconsistent information:\n\n");
			fprintf(stderr, "%s", l_trace);
		} else {
			fprintf(stderr, "No exception trace found.\n");
		}
		exit(1);
	} else {
		context->raising_exception = '\1';
		context->exception_code = code;
		context->exception_tag = tag;
		if (code != GE_EX_FAIL) {
			GE_wipe_out_exception_trace_buffer(&context->last_exception_trace);
		}
		l_trace = trace;
		if (context->exception_trace_enabled && !l_trace) {
			l_trace_buffer = &context->exception_trace_buffer;
			GE_wipe_out_exception_trace_buffer(l_trace_buffer);
			GE_print_exception_trace(context, code, tag, l_trace_buffer);
			l_trace = l_trace_buffer->area;
		}
		if (code != GE_EX_FAIL && l_trace) {
			GE_append_to_exception_trace_buffer(&context->last_exception_trace, l_trace);
		}
		GE_call_set_exception_data(context, code, new_obj, signal_code, error_code, tag, recipient, eclass, rf_routine, rf_class, l_trace, line_number, is_invariant_entry);
		GE_jump_to_last_rescue(context);
		context->raising_exception = '\0';
		context->exception_code = 0;
		context->exception_tag = (char*)0;
	}
}

/*
 * Raise an exception with code `code'.
 */
void GE_raise(long code)
{
	GE_raise_with_message(code, NULL);
}

/*
 * Raise an exception with code `code' and message `msg'.
 */
void GE_raise_with_message(long code, const char* msg)
{
	GE_raise_exception(code, 1, -1, -1, msg, NULL, NULL, NULL, NULL, NULL, -1, 0);
}

/*
 * Raise an exception from EXCEPTION_MANAGER.
 */
void GE_developer_raise(long code, char* meaning, char* message)
{
	GE_raise_exception(code, 0, -1, -1, message, NULL, NULL, NULL, NULL, NULL, -1, 0);
}

/*
 * Check whether the type id of `obj' is not in `type_ids'.
 * If it is, then raise a CAT-call exception. Don't do anything if `obj' is Void.
 * `nb' is the number of ids in `type_ids' and is expected to be >0.
 * `type_ids' is sorted in increasing order.
 * Return `obj'.
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
		GE_raise(GE_EX_VOID);
	}
	return (obj);
}

/*
 * Check whether `ptr' is a null pointer.
 * If it is, then raise a no-more-memory exception.
 * Return `ptr'.
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
		GE_raise(GE_EX_MEM);
	}
	return (ptr);
}

#ifdef EIF_WINDOWS
static LONG WINAPI GE_windows_exception_filter(LPEXCEPTION_POINTERS an_exception)
{
		/* In order to be able to catch exceptions that cannot be caught by
		 * just using signals on Windows, we need to set `windows_exception_filter'
		 * as an unhandled exception filter.
		 */

	switch (an_exception->ExceptionRecord->ExceptionCode) {
		case STATUS_STACK_OVERFLOW:
			GE_raise_with_message(GE_EX_EXT, "Stack overflow");
			break;

		case STATUS_INTEGER_DIVIDE_BY_ZERO:
			GE_raise_with_message(GE_EX_FLOAT, "Integer division by Zero");
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
void GE_set_windows_exception_filter()
{
	LPTOP_LEVEL_EXCEPTION_FILTER old_exception_handler = NULL;
	old_exception_handler = SetUnhandledExceptionFilter (GE_windows_exception_filter);
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
			GE_raise(GE_EX_PROG);
		}
		hconerr = GetStdHandle(STD_ERROR_HANDLE);
		if (hconerr == INVALID_HANDLE_VALUE) {
			GE_raise(GE_EX_PROG);
		}
		hconin = GetStdHandle(STD_INPUT_HANDLE);
		if (hconin == INVALID_HANDLE_VALUE) {
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
	copyright: "Copyright (c) 2007-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_MAIN_C
#define GE_MAIN_C

#ifdef __cplusplus
extern "C" {
#endif

/*
 * System name.
 */
char* GE_system_name = NULL;

/*
 * Root class name.
 */
char* GE_root_class_name = NULL;

#ifdef EIF_WINDOWS

/*
 * Used in WEL.
 */
HINSTANCE eif_hInstance;
HINSTANCE eif_hPrevInstance;
LPWSTR eif_lpCmdLine;
int eif_nCmdShow;

/*
 * Main entry point when compiling a Windows application.
 * See:
 *    http://en.wikipedia.org/wiki/WinMain
 *    http://msdn2.microsoft.com/en-us/library/ms633559.aspx
 */
extern int main(void);
extern void GE_get_argcargv(EIF_NATIVE_CHAR* cmd, int* argc, EIF_NATIVE_CHAR*** argvp);
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
{
	return main();
}

int main(void)
{
	int code;
	int argc;
	EIF_NATIVE_CHAR** argv;
	EIF_NATIVE_CHAR* cmd;
#ifdef EIF_WINDOWS
	GE_set_windows_exception_filter();
		/* Variables used in WEL. */
	eif_hInstance = GetModuleHandle(NULL);
	eif_hPrevInstance = NULL;
	eif_lpCmdLine = GetCommandLineW();
	eif_nCmdShow = SW_SHOW;
#endif
	cmd = GE_nstrdup(GetCommandLineW());
	GE_get_argcargv(cmd, &argc, &argv);
	code = GE_main(argc, argv);
	free(cmd);
	free(argv);
	return code;
}

/*
 * Break the shell command held in 'cmd', putting each shell word
 * in a separate array entry, hence building an argument
 * suitable for the 'main'. Note that 'cmd' will be altered
 * and 'argvp' will point to some chunks of it.
 */
void GE_get_argcargv(EIF_NATIVE_CHAR* cmd, int* argc, EIF_NATIVE_CHAR*** argvp)
{
	int quoted = 0; /* parsing inside a quoted string? */
	int nbs; /* number of backspaces */
	int i;
	EIF_NATIVE_CHAR *p = NULL, *pe = NULL; /* pointers in `cmd' */
	EIF_NATIVE_CHAR *qb = NULL, *q = NULL; /* pointers in arguments */

	*argc = 0;
	/* Remove leading and trailing white spaces */
	for (p = cmd; *p == L' ' || *p == L'\t'; p++)
		; /* empty */
	for (pe = p + GE_nstrlen(p) - 1; pe >= p && (*pe == L' ' || *pe == L'\t'); pe--)
		; /* empty */
	if (p <= pe) {
		*argc = *argc + 1; /* at least one argument */
		qb = q = malloc((pe - p + 2) * sizeof(EIF_NATIVE_CHAR));
		if (!qb) {
			return;
		}
		do {
			switch(*p) {
				case L' ':
				case L'\t':
					if (quoted) {
						do {
							*q++ = *p++;
						} while(*p == L' ' || *p == L'\t');
					} else {
						do {
							p++;
						} while(*p == L' ' || *p == L'\t');
						*q++ = L'\0';
						*argc = *argc + 1;
					}
					break;
				case L'\"':
					quoted = ! quoted;
					p++;
					break;
				case L'\\':
					for (nbs = 0; *p == L'\\'; nbs++)
						*q++ = *p++;
					if (*p == L'\"') {
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
		*q++ = L'\0';
	}

	if (!argvp) {
		free(qb);
		return;
	}

	*argvp = (EIF_NATIVE_CHAR**)malloc((*argc+1)*sizeof(EIF_NATIVE_CHAR*));
	if (!(*argvp)) {
		free(qb);
		return;
	}

	for (i = 0; i < *argc; i++) {
		(*argvp)[i] = qb;
		qb += GE_nstrlen(qb) + 1;
	}
	(*argvp)[i] = (EIF_NATIVE_CHAR *)0;
}

#else

int main (int argc, char ** argv)
{
	return GE_main (argc, argv);
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
	copyright: "Copyright (c) 2007-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_GC_C
#define GE_GC_C

/*
 * Allocate memory that does not contain pointers to collectable objects.
 * The allocated memory is zeroed.
 * The allocated object is itself not collectable.
 * Do not raise an exception when no-more-memory.
 */
#ifdef EIF_BOEHM_GC
void* GE_raw_calloc_atomic_uncollectable(size_t nelem, size_t elsize)
{
	void* new_p;

	new_p = GC_malloc_atomic_uncollectable(nelem * elsize);
	if (new_p) {
		memset(new_p, 0, nelem * elsize);
	}
	return new_p;
}
#endif

/*
 * Allocate more memory for the given pointer.
 * The reallocated pointer keeps the same properties (e.g. atomic or not, collectable or not).
 * The extra allocated memory is zeroed.
 * The allocated object is itself collectable.
 * Raise an exception when no-more-memory.
 */
void* GE_recalloc(void* p, size_t old_nelem, size_t new_nelem, size_t elsize)
{
	void* new_p;
#ifdef EIF_BOEHM_GC
	new_p = GE_null(GC_REALLOC(p, new_nelem * elsize));
#else /* No GC */
	new_p = GE_null(realloc(p, new_nelem * elsize));
#endif
	memset(((char*) new_p) + (old_nelem * elsize), 0, (new_nelem - old_nelem) * elsize);
	return new_p;
}

/*
 * Allocate more memory for the given pointer.
 * The reallocated pointer keeps the same properties (e.g. atomic or not, collectable or not).
 * The extra allocated memory is zeroed.
 * The allocated object is itself collectable.
 * Do not raise an exception when no-more-memory.
 */
void* GE_raw_recalloc(void* p, size_t old_nelem, size_t new_nelem, size_t elsize)
{
	void* new_p;
#ifdef EIF_BOEHM_GC
	new_p = GC_REALLOC(p, new_nelem * elsize);
#else /* No GC */
	new_p = realloc(p, new_nelem * elsize);
#endif
	if (new_p) {
		memset(((char*) new_p) + (old_nelem * elsize), 0, (new_nelem - old_nelem) * elsize);
	}
	return new_p;
}

/*
 * Call dispose routine `disp' on object `C'.
 */
#ifdef EIF_BOEHM_GC
void GE_boehm_dispose(void* C, void* disp) {
	((GE_types[((EIF_REFERENCE)C)->id]).dispose)(GE_current_context(), (EIF_REFERENCE) C);
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

		"C functions used to implement class IDENTIFIED"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_IDENTIFIED_C
#define GE_IDENTIFIED_C

#ifdef __cplusplus
extern "C" {
#endif

/*
	Weak pointers.
*/

/*
 * Weak pointer structure.
 */
typedef struct GE_weak_pointer {
	EIF_REFERENCE object;
} GE_weak_pointer;

/*
 * Create a new weak pointer to `object'.
 */
GE_weak_pointer* GE_new_weak_pointer(EIF_REFERENCE object) {
	GE_weak_pointer* wp;

	if (object == 0) {
		return (GE_weak_pointer*) 0;
	} else {
		wp = (GE_weak_pointer*) GE_malloc_atomic(sizeof(GE_weak_pointer));
		wp->object = object;
#ifdef EIF_BOEHM_GC
		GC_GENERAL_REGISTER_DISAPPEARING_LINK((void**)(&wp->object), GC_base(object));
#endif
		return wp;
	}
}

/*
 * Direct access to the object held in the weak pointer.
 */
EIF_REFERENCE GE_weak_pointer_object_without_lock(GE_weak_pointer* wp) {
	if (wp == 0) {
		return (EIF_REFERENCE) 0;
	} else {
		return (wp->object);
	}
}

/*
 * Access to the object held in the weak pointer.
 */
#ifdef EIF_BOEHM_GC
EIF_REFERENCE GE_weak_pointer_object(GE_weak_pointer* wp) {
	return (EIF_REFERENCE) GC_call_with_alloc_lock((GC_fn_type)GE_weak_pointer_object_without_lock, wp);
}
#else /* No GC */
#define GE_weak_pointer_object(wp) GE_weak_pointer_object_without_lock(wp)
#endif


/*
	Identified data structures and functions.
*/

/*
 * Size of inner arrays in `GE_id_objects'.
 */
#define GE_ID_OBJECT_CHUNK_SIZE 512

/*
 * Number of slots to be added to the outer array of
 * `GE_id_objects' when resizing it.
 */
#define GE_ID_OBJECT_CAPACITY_INCREMENT 512

/*
 * Array of arrays of weak pointers. Each inner array has the same size
 * (GE_ID_OBJECT_CHUNK_SIZE). Given an id, the weak pointer associated
 * the object, if any, is at index (id % GE_ID_OBJECT_CHUNK_SIZE) in the
 * inner array located at index (id / GE_ID_OBJECT_CHUNK_SIZE) in the
 * outer array.
 */
GE_weak_pointer*** GE_id_objects;

/*
 * Capacity of the outer array of `GE_id_objects'.
 */
EIF_INTEGER_32 GE_id_objects_capacity;

/*
 * Last id associated with an object.
 */
EIF_INTEGER_32 GE_last_object_id;

/*
 * Initialize data to keep track of object ids.
 */
void GE_init_identified(void) {
	GE_id_objects = (GE_weak_pointer***) 0;
	GE_id_objects_capacity = 0;
	GE_last_object_id = 0;
}

/*
 * Get a new id for `object', assuming it is NOT in the stack.
 */
EIF_INTEGER_32 GE_object_id(EIF_OBJECT object) {
	GE_weak_pointer** id_object_chunk;
	EIF_INTEGER_32 i;
	EIF_INTEGER_32 l_old_capacity;

	GE_last_object_id++;
	i = GE_last_object_id / GE_ID_OBJECT_CHUNK_SIZE;
	if (i >= GE_id_objects_capacity) {
		l_old_capacity = GE_id_objects_capacity;
		GE_id_objects_capacity = GE_id_objects_capacity + GE_ID_OBJECT_CAPACITY_INCREMENT;
		if (GE_id_objects == 0) {
			GE_id_objects = GE_calloc_atomic_uncollectable(GE_id_objects_capacity, sizeof(GE_weak_pointer**));
		} else {
			GE_id_objects = GE_recalloc(GE_id_objects, l_old_capacity, GE_id_objects_capacity, sizeof(GE_weak_pointer**));
		}
	}
	id_object_chunk = GE_id_objects[i];
	if (id_object_chunk == 0) {
		id_object_chunk = GE_calloc_uncollectable(GE_ID_OBJECT_CHUNK_SIZE, sizeof(GE_weak_pointer*));
		GE_id_objects[i] = id_object_chunk;
	}
	i = GE_last_object_id % GE_ID_OBJECT_CHUNK_SIZE;
	id_object_chunk[i] = GE_new_weak_pointer(object);
	return GE_last_object_id;
}

/*
 * Return the object associated with `id'.
 */
EIF_REFERENCE GE_id_object(EIF_INTEGER_32 id) {
	GE_weak_pointer** id_object_chunk;
	GE_weak_pointer* wp;
	EIF_REFERENCE object;
	EIF_INTEGER_32 i;

	i = id / GE_ID_OBJECT_CHUNK_SIZE;
	if (i >= GE_id_objects_capacity) {
		return (EIF_REFERENCE) 0;
	} else {
		id_object_chunk = GE_id_objects[i];
		if (id_object_chunk == 0) {
			return (EIF_REFERENCE) 0;
		} else {
			i = id % GE_ID_OBJECT_CHUNK_SIZE;
			wp = id_object_chunk[i];
			if (wp == 0) {
				return (EIF_REFERENCE) 0;
			} else {
				object = GE_weak_pointer_object(wp);
				if (object == 0) {
					id_object_chunk[i] = (GE_weak_pointer*) 0;
#ifdef EIF_BOEHM_GC
					GC_unregister_disappearing_link((void**)(&wp->object));
#endif
					GE_free(wp);
					return (EIF_REFERENCE) 0;
				} else {
					return object;
				}
			}
		}
	}
}

/*
 * Remove the object associated with `id' from the stack.
 */
void GE_object_id_free(EIF_INTEGER_32 id) {
	GE_weak_pointer** id_object_chunk;
	GE_weak_pointer* wp;
	EIF_REFERENCE object;
	EIF_INTEGER_32 i;

	i = id / GE_ID_OBJECT_CHUNK_SIZE;
	if (i < GE_id_objects_capacity) {
		id_object_chunk = GE_id_objects[i];
		if (id_object_chunk != 0) {
			i = id % GE_ID_OBJECT_CHUNK_SIZE;
			wp = id_object_chunk[i];
			if (wp != 0) {
				object = GE_weak_pointer_object(wp);
				if (object != 0) {
#ifdef EIF_BOEHM_GC
					GC_unregister_disappearing_link((void**)(&wp->object));
#endif
				}
				id_object_chunk[i] = (GE_weak_pointer*) 0;
				GE_free(wp);
			}
		}
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

		"Part of ISE Eiffel runtime. Needed to compile the EiffelCOM library."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_CECIL_C
#define EIF_CECIL_C

#ifdef __cplusplus
extern "C" {
#endif

EIF_PROCEDURE eif_procedure(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_procedure' in 'eif_cecil.c' not implemented\n");
	return (EIF_PROCEDURE) 0;
}

EIF_INTEGER_FUNCTION eif_integer_function(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_integer_function' in 'eif_cecil.c' not implemented\n");
	return (EIF_INTEGER_FUNCTION) 0;
}

EIF_REFERENCE_FUNCTION eif_reference_function(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_reference_function' in 'eif_cecil.c' not implemented\n");
	return (EIF_REFERENCE_FUNCTION) 0;
}

EIF_POINTER_FUNCTION eif_pointer_function(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_pointer_function' in 'eif_cecil.c' not implemented\n");
	return (EIF_POINTER_FUNCTION) 0;
}

EIF_BOOLEAN_FUNCTION eif_boolean_function(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_boolean_function' in 'eif_cecil.c' not implemented\n");
	return (EIF_BOOLEAN_FUNCTION) 0;
}

EIF_REAL_32_FUNCTION eif_real_32_function(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_real_32_function' in 'eif_cecil.c' not implemented\n");
	return (EIF_REAL_32_FUNCTION) 0;
}

EIF_REAL_64_FUNCTION eif_real_64_function(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_real_64_function' in 'eif_cecil.c' not implemented\n");
	return (EIF_REAL_64_FUNCTION) 0;
}

EIF_CHARACTER_8_FUNCTION eif_character_8_function(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_character_8_function' in 'eif_cecil.c' not implemented\n");
	return (EIF_CHARACTER_8_FUNCTION) 0;
}

EIF_OBJECT eif_create(EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_create' in 'eif_cecil.c' not implemented\n");
	return (EIF_OBJECT) 0;
}

EIF_TYPE_ID eif_type_id(char* type_string) {
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_type_id' in 'eif_cecil.c' not implemented\n");
	return EIF_NO_TYPE;
}

extern EIF_INTEGER eifaddr_offset(EIF_REFERENCE object, char *name, int * const ret) {
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eifaddr_offset' in 'eif_cecil.c' not implemented\n");
	return 0;
}

EIF_TYPE_ID eiftype(EIF_OBJECT object) {
		/* Obsolete. Use "eif_type_by_reference" instead.
		 * Return the Type id of the specified object. 
		 */
	return (EIF_TYPE_ID) object->id;
}

EIF_TYPE_ID eif_type_by_reference (EIF_REFERENCE object) {
		/* Return type id of the direct reference "object" */
	return (EIF_TYPE_ID) object->id;
}

EIF_TYPE_INDEX eif_gen_param_id (EIF_TYPE_INDEX dftype, uint32_t pos) {
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_gen_param_id' in 'eif_cecil.c' not implemented\n");
	return 0;
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

		"Part of ISE Eiffel runtime. Needed to compile the EiffelCOM library."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_PLUG_C
#define EIF_PLUG_C

#ifdef __cplusplus
extern "C" {
#endif

#ifndef EIF_THREADS
int nstcall = 0;
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

		"C functions used to implement class EXCEPTIONS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_EXCEPT_C
#define EIF_EXCEPT_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef EIF_EXCEPT_H
#include "eif_except.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Raise an Eiffel exception.
 */
void eraise(const char* name, long code)
{
	GE_raise_with_message(code, name);
}

/*
 * Raise an Eiffel exception of the given code with no associated tag.
 */
void xraise(int code)
{
	GE_raise((long)code);
}

/*
 * Raise an "Operating system error" exception.
 */
void esys(void)
{
	if (errno == 0) {
			/* External event */
		GE_raise(GE_EX_EXT);
	} else {
			/* Operating system error */
		GE_raise(GE_EX_SYS);
	}
}

/*
 * As a special case, an I/O error is raised when a system call which is I/O bound fails.
 */
void eise_io(const char* tag)
{
	GE_raise_with_message(GE_EX_ISE_IO, tag);
}

/*
 * Raise a "No more memory" exception.
 */
 void enomem(void) {
	GE_raise(GE_EX_OMEM);
 }

/*
 * Raise EiffelCOM exception.
 */
void com_eraise(const char* tag, long num)
{
	GE_raise_with_message(num, tag);
}

/*
 * Terminate execution with exit status `code',
 * without triggering an exception.
 */
void esdie(int code)
{
/* TODO: check that the Boehm GC triggers the 'dispose' routines. */
	exit(code);
}

/*
 * Exception tag associated with `code'.
 * This is a duplication from Eiffel classes, but still used for trace printing and in EiffelCom.
 */
EIF_REFERENCE eename(long code)
{
	return GE_str8(GE_exception_tag(code));
}

/*
 * Is exception `ex' defined?
 * Used in EiffelCOM.
 */
char eedefined(long ex)
{
	return (char) ((ex > 0 && ex <= GE_EX_NEX)? 1 : 0);
}

/*
 * Enable/diable printing of the exception trace.
 * Per thead information.
 */
void eetrace(char b) {
	GE_context* context;

	context = GE_current_context();
	context->exception_trace_enabled = b;
}

/*
 * Is current execution during rescue?
 */
EIF_BOOLEAN eif_is_in_rescue(void)
{
	GE_context* context;

	context = GE_current_context();
	return (EIF_TEST(context->in_rescue > 0));
}

#ifdef EIF_WINDOWS
/*
 * Set default exception handler.
 */
void set_windows_exception_filter()
{
	GE_set_windows_exception_filter();
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

		"C functions used to implement class REAL"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_REAL_C
#define GE_REAL_C

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Bit representation of `v'.
 */
EIF_NATURAL_32 GE_real_32_to_bits(EIF_REAL_32 v)
{
	return *(EIF_NATURAL_32 *)&v;
}

/*
 * Bit representation of `v'.
 */
EIF_NATURAL_64 GE_real_64_to_bits(EIF_REAL_64 v)
{
	return *(EIF_NATURAL_64 *)&v;
}

/*
 * Real value with `v' as bit representation.
 */
EIF_REAL_32 GE_real_32_from_bits(EIF_NATURAL_32 v)
{
	return *(EIF_REAL_32 *)&v;
}

/*
 * Real value with `v' as bit representation.
 */
EIF_REAL_64 GE_real_64_from_bits(EIF_NATURAL_64 v)
{
	return *(EIF_REAL_64 *)&v;
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
	copyright: "Copyright (c) 2006-2013, Eric Bezault and others"
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

#ifndef FILE_TYPE_MAX
#define FILE_TYPE_MAX 5		/* max size of fopen type string (like "a+b") */
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
#ifndef S_IFMT
#define S_IFMT 0170000
#endif
#ifndef S_ISREG
#define S_ISREG(m) (((m) & S_IFMT) == S_IFREG)
#endif
#ifndef S_ISDIR
#define S_ISDIR(m) (((m) & S_IFMT) == S_IFDIR)
#endif
#ifndef S_ISCHR
#define S_ISCHR(m) (((m) & S_IFMT) == S_IFCHR)
#endif
#ifndef S_ISBLK
#define S_ISBLK(m) (((m) & S_IFMT) == S_IFBLK)
#endif
#ifndef S_ISLNK
#define S_ISLNK(m) (((m) & S_IFMT) == S_IFLNK)
#endif
#ifndef S_ISFIFO
#define S_ISFIFO(m) (((m) & S_IFMT) == S_IFIFO)
#endif
#ifndef S_ISSOCK
#define S_ISSOCK(m) (((m) & S_IFMT) == S_IFSOCK)
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

#define FS_START	0			/* Beginning of file for `fseek' */
#define FS_CUR		1			/* Current position for `fseek' */
#define FS_END		2			/* End of file for `fseek' */
/* Keep only permission mode */
#ifndef ST_MODE
#define ST_MODE 0x0fff
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS
#	ifdef EIF_64_BITS
#		define rt_stat		_wstat64
#		define rt_fstat		_fstat64
#	else
#		define rt_stat		_wstat64i32
#		define rt_fstat		_fstat64i32
#	endif
#	define rt_access		_waccess
#else
#	define rt_stat			stat
#	define rt_lstat			lstat
#	define rt_fstat			fstat
#	define rt_access		access
#endif

static int rt_mkdir(EIF_FILENAME path, int mode)
{
#ifdef EIF_WINDOWS
	return _wmkdir(path);
#else
	return mkdir(path, mode);
#endif
}

static int rt_rename(EIF_FILENAME from, EIF_FILENAME to)
{
#ifdef EIF_WINDOWS
	return _wrename(from, to);
#else
	return rename(from, to);
#endif
}

static int rt_rmdir(EIF_FILENAME path)
{
#ifdef EIF_WINDOWS
	return _wrmdir(path);
#else
	return rmdir(path);
#endif
}

static int rt_unlink(EIF_FILENAME path)
{
#ifdef EIF_WINDOWS
	return _wunlink(path);
#else
	return unlink(path);
#endif
}

static FILE *rt_file_fopen(EIF_FILENAME name, EIF_FILENAME type)
{
#ifdef EIF_WINDOWS
	return _wfopen(name, type);
#else
	return fopen(name, type);
#endif
}

static FILE *rt_file_fdopen(int fd, EIF_FILENAME type)
{
#ifdef EIF_WINDOWS
	return _wfdopen(fd, type);
#else
	return fdopen(fd, type);
#endif
}

static FILE *rt_file_freopen(EIF_FILENAME name, EIF_FILENAME type, FILE *stream)
{
#ifdef EIF_WINDOWS
	return _wfreopen(name, type, stream);
#else
	return freopen(name, type, stream);
#endif
}

static int rt_utime(EIF_FILENAME path, struct utimbuf *times)
{
#ifdef EIF_WINDOWS
	return _wutime(path, (struct _utimbuf *) times);
#else
	return utime(path, times);
#endif
}

/*
 * Swallow next character if it is a new line.
 */
static void rt_swallow_nl(FILE *f) {
		/* getc() cannot be used as it doesn't set the EOF flag */

	if (f != stdin) {
		if (fscanf (f, "\n") == EOF && ferror(f)) {
			eise_io ("FILE: error during reading the end of the file,");
		}
	} else {
		int c;

		errno = 0;
		c = getc(f);
		if (c == EOF && ferror(f))
			eise_io("FILE: error during reading the end of the file.");

		if (c != '\n' && EOF == ungetc(c, f))
			eise_io("FILE: End of file.");
	}
}

static void rt_file_stat (EIF_FILENAME path, rt_stat_buf *buf)
{
		/* To preserve compatibility we always follow symbolic links and raise an exception upon failure. */
	if (eif_file_stat(path, buf, 1) == -1) {
		esys();
	}
}

/*
 * Given `how' the file is being opened and a `mode' create a platform specific character
 * string (UTF-16 encoding on Windows and a byte sequence otherwise) that can be used by
 * the underlying OS system call to open the mode in the proper mode (e.g. open append,
 * read-write mode, ....).
 */
static EIF_FILENAME rt_file_open_mode(int how, char mode)
{
#ifdef EIF_WINDOWS
	static wchar_t file_type [FILE_TYPE_MAX];
#else
	static char file_type [FILE_TYPE_MAX];
#endif

	file_type[4] = '\0';
	file_type[3] = '\0';
	file_type[2] = '\0';
	if (how >= 10) how -= 10;
	switch (how) {
		case 0:
		case 3: file_type[0] = 'r'; break;
		case 1:
		case 4: file_type[0] = 'w'; break;
		case 2:
		case 5: file_type[0] = 'a'; break;
		default: file_type[0] = 'r'; break;
	}
	file_type[1] = mode;
	switch (how) {
		case 3:
		case 4:
		case 5:
			if (mode == '\0') {
				file_type[1] = '+';
			} else {
				file_type[2] = '+';
			}
	}
#ifdef EIF_WINDOWS
	/* We make sure that files created in Eiffel are not inheritable
	 * by default as otherwise it makes things too complicated for the
	 * end user when spawing child processes. */
	if (file_type [1] == '\0') {
		file_type [1] = 'N';
	} else if (file_type [2] == '\0') {
		file_type [2] = 'N';
	} else {
		file_type [3] = 'N';
	}
#endif
	return file_type;
}

/*
 * Create directory `dirname'.
 */
void eif_file_mkdir(EIF_FILENAME dirname) {
	errno = 0;
	if (rt_mkdir(dirname, 0777) == -1) {
		esys(); /* Raise exception */
	}
}

/*
 * Rename file `from' into `to'.
 */
void eif_file_rename(EIF_FILENAME from, EIF_FILENAME to) {
	for (;;) {
#ifdef EIF_WINDOWS
		if (eif_file_exists(to)) {
				/* To have the same behavior as Unix, we need to remove the destination file if it exists.
				 * Of course we can do this only if `from' and `to' do not represent the same file.
				 * To check this, we use `CreateFile' to open both file, and then using the information
				 * returned by `GetFileInformationByHandle' we can check whether or not they are indeed
				 * the same. */
			BY_HANDLE_FILE_INFORMATION l_to_info, l_from_info;
			HANDLE l_from_file = CreateFileW (from, GENERIC_READ, FILE_SHARE_READ, NULL,
				OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
			HANDLE l_to_file = CreateFileW (to, GENERIC_READ, FILE_SHARE_READ, NULL,
					OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);

			if ((l_from_file == INVALID_HANDLE_VALUE) || (l_to_file == INVALID_HANDLE_VALUE)) {
					/* We do not need the handles anymore, simply close them. Since Microsoft
					 * API accepts INVALID_HANDLE_VALUE we don't check the validity of arguments. */
				CloseHandle(l_from_file);
				CloseHandle(l_to_file);

					/* For some reasons we cannot open the file. This should not happen, maybe the OS has
					 * removed `from' or `to'. In that case, we simply try to remove destination as we were
					 * doing in former revision of `file_rename'. */
				_wremove (to);
			} else {
				BOOL success = GetFileInformationByHandle (l_from_file, &l_from_info);
				if (success) {
					success = GetFileInformationByHandle (l_to_file, &l_to_info);
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
							_wremove (to);
						} else {
								/* Files are identical, nothing to be done apart from */
							break;
						}
					} else {
							/* An error occurred while retrieving the information about `from' and `to'. Like
							 * for the case where `l_from_file' and `l_to_file' are invalid, we try to remove
							 * the file. */
						_wremove (to);
					}
				} else {
						/* We do not need the handles anymore, simply close them. */
					CloseHandle(l_from_file);
					CloseHandle(l_to_file);
						/* An error occurred while retrieving the information about `from' and `to'. Like
						 * for the case where `l_from_file' and `l_to_file' are invalid, we try to remove
						 * the file. */
					_wremove (to);
				}
			}
		}
#endif
		errno = 0;
		if (rt_rename(from, to) == -1) {
			esys(); /* Raise exception */
		}
		break;
	}
}

/*
 * Link file `from' into `to'.
 */
void eif_file_link(EIF_FILENAME from, EIF_FILENAME to) {
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
void eif_file_unlink(EIF_FILENAME name) {
	rt_stat_buf buf;				/* File statistics */
	int status;						/* Status from system call */

	status = eif_file_stat(name, &buf, 0);				/* Side effect: ensure file exists */
	if (status == -1) {				/* An error occurred */
		esys();
	} else {
		for (;;) {
			errno = 0;						/* Reset error condition */
			if (S_ISDIR(buf.st_mode))		/* Directory */
				status = rt_rmdir(name);		/* Remove only if empty */
			else
				status = rt_unlink(name);		/* Not a directory */
			if (status == -1) {				/* An error occurred */
				if (errno == EINTR)			/* Interrupted by signal */
					continue;				/* Re-issue system call */
				else
					esys();					/* Raise exception */
			}
			break;
		}
	}
}

/*
 * Open file `name' with the corresponding type `how'.
 */
EIF_POINTER eif_file_open(EIF_FILENAME name, int how) {
	FILE *fp;
	errno = 0;
#if defined EIF_WINDOWS
	fp = (FILE *)rt_file_fopen(name, rt_file_open_mode(how, (how < 10 ? 't' : 'b')));
#else
	fp = (FILE *)rt_file_fopen(name, rt_file_open_mode(how, '\0'));
#endif
	if (fp == (FILE *)0) {
		esys(); /* Open failed, raise exception */
	}
	return (EIF_POINTER)fp;
}

/*
 * Open file `fd' with the corresponding type `how'.
 */
EIF_POINTER eif_file_dopen(int fd, int how) {
	FILE *fp;
	errno = 0;
#ifdef EIF_WINDOWS
	fp = (FILE *)rt_file_fdopen(fd, rt_file_open_mode(how, (how < 10 ? 't' : 'b')));
#else
	fp = (FILE *)rt_file_fdopen(fd, rt_file_open_mode(how, '\0'));
#endif
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
EIF_POINTER eif_file_reopen(EIF_FILENAME name, int how, FILE *old) {
	FILE *fp;
	errno = 0;
#ifdef EIF_WINDOWS
	fp = (FILE *)rt_file_freopen(name, rt_file_open_mode(how, (how < 10 ? 't' : 'b')), old);
#else
	fp = (FILE *)rt_file_freopen(name, rt_file_open_mode(how, '\0'), old);
#endif
	if (fp == (FILE *)0) {
		esys(); /* Open failed, raise exception */
	}
	return (EIF_POINTER)fp;
}

/*
 * Close the file.
 */
void eif_file_close(FILE *fp) {
	errno = 0;
	if (fclose(fp) != 0) {
		esys(); /* Close failed, raise exception */
	}
}

/*
 * Flush data held in stdio buffer.
 */
void eif_file_flush(FILE *fp) {
	errno = 0;
	if (fflush(fp) != 0) {
	    esys(); /* Flush failed, raise exception */
	}
#ifdef EIF_WINDOWS
		/* On Windows, it does not write directly to disk, so we have to force it. See KB66052:
		 * http://support.microsoft.com/kb/66052
		 * We ignore bad file descriptor case, as it is most likely when calling it on one of the standard
		 * input/outputs. */
	if ((0 != _commit(fileno(fp))) && (errno != EBADF)) {
		esys();
	}
#endif
}

/*
 * Return the associated file descriptor.
 */
EIF_INTEGER eif_file_fd(FILE *f) {
	int res;
	if (!f) {
		res = 0;
		eraise("invalid file pointer", EN_EXT);
	} else {
		res = fileno(f);
		if (res == -1) {
			eraise("error occurred", EN_EXT);
		}
	}
	return (EIF_INTEGER) res;
}

/*
 * Get a character from `f'.
 */
EIF_CHARACTER_8 eif_file_gc(FILE *f) {
	int c;
	errno = 0;
	c = getc(f);
	if (c == EOF && ferror(f)) {
		eise_io("FILE: unable to read CHARACTER value.");
	}
	return (EIF_CHARACTER_8)c;
}

/*
 * Get a string from `f' and fill it into `s' (at most `bound' characters),
 * with `start' being the amount of bytes already stored within s. This
 * means we really have to read (bound - start) characters.
 */
EIF_INTEGER eif_file_gs(FILE *f, char *s, EIF_INTEGER bound, EIF_INTEGER start) {
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
EIF_INTEGER eif_file_gss(FILE* f, char* s, EIF_INTEGER bound) {
	size_t amount = fread(s, sizeof(char), (size_t) bound, f);

	if (ferror(f)) {	/* An I/O error occurred */
		eise_io("FILE: unable to read stream.");					/* Raise exception */
	}

	return (EIF_INTEGER) amount;	/* Number of characters read */
}

/*
 * Get a word from `f' and fill it into `s' (at most `bound' characters),
 * with `start' being the amount of bytes already stored within s. This
 * means we really have to read (bound - start) characters. Any leading
 * spaces are skipped.
 */
EIF_INTEGER eif_file_gw(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start) {
	EIF_INTEGER amount;	/* Amount of bytes to be read */
	int c = 0;			/* Last char read */

	amount = bound - start;		/* Characters to be read */
	s += start;					/* Where read characters are written */
	errno = 0;					/* No error, a priori */

	if (start == 0)	{			/* First call */
		while ((c = getc(f)) != EOF)
			if (!isspace(c))
				break;
		if (c == EOF && ferror(f))	/* An I/O error occurred */
			eise_io("FILE: unable to read word.");					/* Raise exception */
		if (c == EOF)
			return (EIF_INTEGER) 0;				/* Reached EOF before word */
		else if (EOF == ungetc(c, f))
			eise_io("FILE: unable to read word.");
	}

	while (amount-- > 0) {
		c = getc(f);
		if (c == EOF)
			break;
		if (isspace(c)) {
			if (EOF == ungetc(c, f))
				eise_io("FILE: unable to read word.");
			break;
		}
		*s++ = (char) c;
	}

	if (c == EOF && ferror(f))	/* An I/O error occurred */
		eise_io("FILE: unable to read word.");					/* Raise exception */

	/* If we managed to get the whole string, return the number of characters
	 * read. Otherwise, return (bound - start + 1) to indicate an error
	 * condition.
	 */

	if (c == EOF || isspace(c))
		return bound - start - amount - 1;	/* Number of characters read */

	return bound - start + 1;			/* Error condition */
}

/*
 * Look ahead one character. If EOF, return 0.
 */
EIF_CHARACTER_8 eif_file_lh(FILE *f) {
	int c;

	errno = 0;
	c = getc(f);
	if (c == EOF && ferror(f))
		eise_io("FILE: error when reading a character ahead.");

	if (c != EOF && EOF == ungetc(c, f))
		eise_io("FILE: error when reading a character ahead.");

	return (EIF_CHARACTER_8) (c == EOF ? (char) 0 : (char) c);
}

/*
 * Size of file `fp'.
 */
EIF_INTEGER eif_file_size(FILE *fp) {
	rt_stat_buf buf;

	errno = 0;
	if (fflush (fp) != 0) {
		esys();
	}
	if (rt_fstat (fileno(fp), &buf) == -1)
		esys();		/* An error occurred: raise exception */
		/* FIXME: This code should be upgraded to use 64-bit */
	return (EIF_INTEGER) buf.st_size;
}

/*
 * Read upto next input line.
 */
void eif_file_tnil(FILE *f) {
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
EIF_INTEGER eif_file_tell(FILE *f) {
	long res;

	if (f == (FILE *) 0) {
		eraise("invalid file pointer", EN_EXT);
	}

	res = ftell(f);
	if (res == -1) {
		eraise("error occurred", EN_EXT);
	}
	return (EIF_INTEGER) res;
}

/*
 * Touch file `name' by setting both access and modification time to the
 * current time stamp. This external function exists only because there
 * is no way within UNIX_FILE to get the current time stamp. Otherwise,
 * we could simply call file_utime.
 */
void eif_file_touch(EIF_FILENAME name) {
	eif_file_utime(name, time((time_t *) 0), 2);
}

/*
 * Modify the modification and/or the access time stored in the file's
 * inode. The 'how' parameter tells which attributes should be set.
 */
void eif_file_utime(EIF_FILENAME name, time_t stamp, int how) {
	struct utimbuf tp;	/* Time array */
	rt_stat_buf buf;	/* File statistics */
	int status;			/* System call status */

	if (how < 2) {				/* Need to fetch time from inode */
		rt_file_stat(name, &buf);
		switch (how) {
		case 0:					/* Change only access time */
			tp.actime = stamp;
			tp.modtime = buf.st_mtime;
			break;
		case 1:					/* Change only modification time */
			tp.actime = buf.st_atime;
			tp.modtime = stamp;
			break;
		}
	} else
		tp.actime = tp.modtime = stamp;	/* Change both access and modification times */
	errno = 0;

	if (rt_utime(name, &tp) == -1) {
			/* Raise exception */
		esys();
	}
}

/*
 * This is an encapsulation of the stat() system call. The routine either
 * succeeds and returns or fails and raises the appropriate exception.
 */
int eif_file_stat(EIF_FILENAME path, rt_stat_buf *buf, int follow) {
	int status;			/* System call status */

	for (;;) {
		errno = 0;						/* Reset error condition */
#ifdef HAS_LSTAT
		status = rt_lstat(path, buf);
		if ((status == 0) && (follow) && (S_ISLNK(buf->st_mode))) {
				/* We found a file which is a symbolic link and we are asked to
				 * follow the link to fetch properties on the link location.
				 * We call `rt_stat' to make sure the link is valid. It is going to
				 * slow down current call by stating twice the info, but this
				 * case is quite rare and there is a benefit in using `lstat'
				 * over `rt_stat' the first time as more than 90% of the files
				 * we stat are not symlink. */
			status = rt_stat (path, buf);
		}
#else
		status = rt_stat (path, buf);		/* Get file statistics */
#endif
		if ((status == -1) && (errno == EINTR)) {
				/* Call was interrupted by a signal we re-issue it. */
			continue;
		}
		break;
	}
	return status;
}

/*
 * Change permissions of file `name', using an interface like chmod(1).
 * The flag is true if permissions are to be added, 0 to remove them.
 */
void eif_file_perm(EIF_FILENAME name, char *who, char *what, int flag) {
	int fmode;					/* File mode to be altered */
	rt_stat_buf buf;			/* File statistics */

		/* We need to follow links since `chmod' does follow them to change the permissions. */
	if (eif_file_stat(name, &buf, 1)) {
		esys();
	} else {
		fmode = (int) buf.st_mode;	/* Fetch current file mode */

		switch (*who) {
		case 'u':
			while (*what)
				switch (*what++) {
#ifdef EIF_WINDOWS
				case 's': break;
				case 'r': break;
				case 'w': break;
				case 'x': break;
#else
				case 's':
					if (flag) fmode |= S_ISUID; else fmode &= ~S_ISUID;
					break;
				case 'r':
					if (flag) fmode |= S_IRUSR; else fmode &= ~S_IRUSR;
					break;
				case 'w':
					if (flag) fmode |= S_IWUSR; else fmode &= ~S_IWUSR;
					break;
				case 'x':
					if (flag) fmode |= S_IXUSR; else fmode &= ~S_IXUSR;
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
#ifdef S_ISGID
					if (flag) fmode |= S_ISGID; else fmode &= ~S_ISGID;
#endif
					break;
				case 'r':
#ifdef S_IRGRP
					if (flag) fmode |= S_IRGRP; else fmode &= ~S_IRGRP;
#endif
					break;
				case 'w':
#ifdef S_IWGRP
					if (flag) fmode |= S_IWGRP; else fmode &= ~S_IWGRP;
#endif
					break;
				case 'x':
#ifdef S_IXGRP
					if (flag) fmode |= S_IXGRP; else fmode &= ~S_IXGRP;
#endif
					break;
				default:
					eraise("invalid group permission", EN_EXT);
				}
			break;
		case 'o':
			while (*what)
				switch (*what++) {
				case 't':
#ifdef S_ISVTX
					if (flag) fmode |= S_ISVTX; else fmode &= ~S_ISVTX;
#endif
					break;
				case 'r':
#ifdef S_IROTH
					if (flag) fmode |= S_IROTH; else fmode &= ~S_IROTH;
#endif
					break;
				case 'w':
#ifdef S_IWOTH
					if (flag) fmode |= S_IWOTH; else fmode &= ~S_IWOTH;
#endif
					break;
				case 'x':
#ifdef S_IXOTH
					if (flag) fmode |= S_IXOTH; else fmode &= ~S_IXOTH;
#endif
					break;
				default:
					eraise("invalid other permission", EN_EXT);
				}
			break;
		default:
			eraise("invalid permission target", EN_EXT);
		}
		eif_file_chmod(name, fmode);
	}
}

/*
 * Change permission mode on file `path'.
 */
void eif_file_chmod(EIF_FILENAME path, int mode) {
	errno = 0;
#ifdef EIF_WINDOWS
	if (_wchmod(path, mode) == -1) {
#else
	if (chmod(path, mode) == -1) {
#endif
		esys();
	}
}

/*
 * Change the owner of the file to `uid'.
 */
void eif_file_chown(EIF_FILENAME name, int uid) {
#ifdef HAS_CHOWN
	int gid;
	rt_stat_buf buf;

	rt_file_stat(name, &buf);
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
void eif_file_chgrp(EIF_FILENAME name, int gid) {
#ifdef HAS_CHOWN
	int uid;
	rt_stat_buf buf;

	rt_file_stat(name, &buf);
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
void eif_file_tnwl(FILE *f) {
	errno = 0;
	if (putc('\n', f) == EOF) {
		eise_io("FILE: unable to write new line.");
	}
}

/*
 * Append a copy of `other' to `f'.
 */
void eif_file_append(FILE *f, FILE *other, EIF_INTEGER l) {
	size_t amount;
	char buffer[512];
	int bufsize = 512;

	errno = 0;
	if (fseek(other, 0, FS_START) != 0) {
		esys();
	}
	if (fseek(f, 0, FS_END) != 0) {
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
		l -= (EIF_INTEGER) amount;
		if (amount != fwrite(buffer, sizeof(char), amount, f)) {
			eise_io("FILE: unable to write appended file.");
			break;
		}
	}
}

/*
 * Write string `str' on `f'.
 */
void eif_file_ps(FILE *f, char *str, EIF_INTEGER len) {
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
void eif_file_pc(FILE *f, char c) {
	errno = 0;
	if (putc(c, f) == EOF) {
		eise_io("FILE: unable to write CHARACTER value.");
	}
}

/*
 * Go to absolute position `pos' counted from start.
 */
void eif_file_go(FILE *f, EIF_INTEGER pos) {
	errno = 0;
	if (fseek(f, pos, FS_START) != 0) {
		esys();
	}
	clearerr(f);
}

/*
 * Go to absolute position `pos' counted from end.
 */
void eif_file_recede(FILE *f, EIF_INTEGER pos) {
	errno = 0;
	if (fseek(f, -pos, FS_END) != 0) {
		esys();
	}
	clearerr(f);
}

/*
 * Go to absolute position `pos' counted from current position.
 */
void eif_file_move(FILE *f, EIF_INTEGER pos) {
	errno = 0;
	if (fseek(f, pos, FS_CUR) != 0) {
		esys();
	}
	clearerr(f);
}

/*
 * End of file.
 */
EIF_BOOLEAN eif_file_feof(FILE *fp) {
	return (EIF_BOOLEAN)(feof(fp) != 0);
}

/*
 * Test whether file exists or not. If `name' represents a symbolic link,
 * it will check that pointed file does exist.
 */
EIF_BOOLEAN eif_file_exists(EIF_FILENAME name) {
	int status;					/* System call status */
	rt_stat_buf buf;			/* Buffer to get file statistics */

	status = eif_file_stat (name, &buf, 1);

#ifdef EOVERFLOW
	if (status == -1) {
			/* If the file is larger than what our file routines can handle
			 * it does not mean that the file does not exist. It does but we
			 * cannot handle it.
			 * This is needed to be able to check existence of file bigger than 2GB.
			 */
		return (errno == EOVERFLOW ? EIF_TRUE : EIF_FALSE);
	} else {
		return EIF_TRUE;
	}
#else
	return (status == -1 ? EIF_FALSE : EIF_TRUE);
#endif
}

/*
 * Test whether file exists or not without following the symbolic link
 * if `name' represents one.
 */
EIF_BOOLEAN eif_file_path_exists(EIF_FILENAME name) {
	int status;					/* System call status */
	rt_stat_buf buf;			/* Buffer to get file statistics */

	status = eif_file_stat (name, &buf, 0);

#ifdef EOVERFLOW
	if (status == -1) {
			/* If the file is larger than what our file routines can handle
			 * it does not mean that the file does not exist. It does but we
			 * cannot handle it.
			 * This is needed to be able to check existence of file bigger than 2GB.
			 */
		return (errno == EOVERFLOW ? EIF_TRUE : EIF_FALSE);
	} else {
		return EIF_TRUE;
	}
#else
	return (status == -1 ? EIF_FALSE : EIF_TRUE);
#endif
}

/*
 * Check whether access permission `op' are possible on file `name' using
 * real UID and real GID. This is probably only useful to setuid or setgid
 * programs.
 */
EIF_BOOLEAN eif_file_access(EIF_FILENAME name, EIF_INTEGER op) {
	switch (op) {
	case 0: /* Does file exist? */
		return (EIF_BOOLEAN) ((-1 != rt_access(name, F_OK)) ? '\01' : '\0');
	case 1: /* Test for search permission */
		return (EIF_BOOLEAN) ((-1 != rt_access(name, X_OK)) ? '\01' : '\0');
	case 2: /* Test for write permission */
		return (EIF_BOOLEAN) ((-1 != rt_access(name, W_OK)) ? '\01' : '\0');
	case 3: /* Test for read permission */
		return (EIF_BOOLEAN) ((-1 != rt_access(name, R_OK)) ? '\01' : '\0');
	default:
		return EIF_FALSE;
	}
}

/*
 * Check whether the file `path' may be created: we need write permissions
 * in the parent directory and there must not be any file bearing that name
 * with no write permissions...
 */
EIF_BOOLEAN eif_file_creatable(EIF_FILENAME path, EIF_INTEGER nbytes) {
	rt_stat_buf buf;			/* Buffer to get parent directory statistics */
	EIF_FILENAME temp = NULL;
	EIF_FILENAME ptr;
	size_t l_extra_bytes;

		/* Allocate one extra character, just to be sure since we might be appending characters. */
#ifdef EIF_WINDOWS
	l_extra_bytes = sizeof(wchar_t);
#else
	l_extra_bytes = sizeof(char);
#endif
	temp = (EIF_FILENAME) malloc (nbytes + l_extra_bytes);
	if (!temp) {
		enomem();
	} else {
			/* Search the directory separator. */
#ifdef EIF_WINDOWS
		memcpy (temp, path, nbytes);
		ptr = wcsrchr (temp, '\\');
		if (!ptr) {
				/* On Windows we can have a forward slash as separator. */
			ptr = wcsrchr (temp, '/');
		}
#else
		strcpy (temp, path);
		ptr = strrchr (temp, '/');
#endif
		if (ptr) {
			*ptr = '\0';
#ifdef EIF_WINDOWS
			if ((ptr == temp) || (*(ptr -1) == ':')) {
					/* path is of the form a:\bbb or \bbb, parent is a:\ or \ */
				wcscat (ptr, L"\\");
			}
#endif
		} else {
#ifdef EIF_WINDOWS
			wcsncpy (temp, L".", 2);
#else
			strcpy (temp, ".");
#endif
		}

			/* Does the parent exist? */
		if (!eif_file_exists(temp)) {
			free (temp);
			return (EIF_BOOLEAN) '\0';
		}

		rt_file_stat(temp, &buf);
		free (temp);

		if (S_ISDIR(buf.st_mode)) {	/* Is parent a directory? */
			if (eif_file_eaccess(&buf, 1)) {	/* Check for write permissions */
					/* Check if a non writable file `path' exists */
				if (eif_file_exists(path)) {
					rt_file_stat(path, &buf);
					if (S_ISDIR(buf.st_mode)) {
							/* File exists and it is already a directory, thus we cannot create a file. */
						return (EIF_BOOLEAN) '\0';
					} else {
						return (eif_file_eaccess(&buf, 1)); /* Check for write permissions to re create it */
					}
				}

				return (EIF_BOOLEAN) '\01';
			}
		}
	}
	return (EIF_BOOLEAN) '\0';
}

/*
 * Get an integer from `f'.
 */
EIF_INTEGER eif_file_gi(FILE *f) {
	EIF_INTEGER i;

	errno = 0;
	if (fscanf(f, "%d", &i) < 0) {
		eise_io("FILE: unable to read INTEGER value.");
	}
	rt_swallow_nl(f);
	return i;
}

/*
 * Get a real from `f'.
 */
EIF_REAL_32 eif_file_gr(FILE *f) {
	EIF_REAL_32 r;
	errno = 0;
	if (fscanf(f, "%f", &r) < 0) {
		eise_io("FILE: unable to read REAL value.");
	}
	rt_swallow_nl(f);
	return r;
}

/*
 * Get a double from `f'.
 */
EIF_REAL_64 eif_file_gd(FILE *f) {
	EIF_REAL_64 d;
	errno = 0;
	if (fscanf(f, "%lf", &d) < 0) {
		eise_io("FILE: unable to read DOUBLE value.");
	}
	rt_swallow_nl(f);
	return d;
}

/*
 * Write `number' on `f'.
 */
void eif_file_pi(FILE *f, EIF_INTEGER number) {
	errno = 0;
	if (fprintf(f, "%d", number) < 0) {
		eise_io("FILE: unable to write INTEGER value.");
	}
}

/*
 * Write `number' on `f'.
 */
void eif_file_pr(FILE *f, EIF_REAL_32 number) {
	int res;
	errno = 0;

	if (number != number) {
		res = fprintf (f, "%s", "NaN");
	} else if (GE_real_32_is_negative_infinity(number)) {
		res = fprintf (f, "%s", "-Infinity");
	} else if (GE_real_32_is_positive_infinity(number)) {
		res = fprintf (f, "%s", "Infinity");
	} else {
		res = fprintf (f, "%g", number);
	}
    if (res < 0) {
		eise_io("FILE: unable to write REAL_32 value.");
	}
}

/*
 * Write double `val' onto `f'.
 */
void eif_file_pd(FILE *f, EIF_REAL_64 val) {
	int res;
	errno = 0;

	if (val != val) {
		res = fprintf (f, "%s", "NaN");
	} else if (GE_real_64_is_negative_infinity(val)) {
		res = fprintf (f, "%s", "-Infinity");
	} else if (GE_real_64_is_positive_infinity(val)) {
			res = fprintf (f, "%s", "Infinity");
	} else {
		res = fprintf(f, "%.17g", val);
	}

	if (res < 0) {
		eise_io("FILE: unable to write REAL_64 value.");
	}
}

/*
 * Size of the stat structure. This is used by the Eiffel side to create
 * the area (special object) which will play the role of a stat buffer
 * structure.
 */
EIF_INTEGER stat_size(void) {
	return (EIF_INTEGER)sizeof(rt_stat_buf);
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
EIF_BOOLEAN eif_file_eaccess(rt_stat_buf *buf, int op) {
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
EIF_INTEGER eif_file_info(rt_stat_buf *buf, int op) {
	switch (op) {
	case 0:	/* File permission mode */
		return (EIF_INTEGER)(buf->st_mode & ST_MODE);
	case 1:	/* Inode number */
		return (EIF_INTEGER)buf->st_ino;
	case 2:	/* Device inode resides on */
		return (EIF_INTEGER) buf->st_dev;
	case 3:	/* Device type */
		return (EIF_INTEGER) buf->st_rdev;
	case 4:	/* UID of file */
		return (EIF_INTEGER) buf->st_uid;
	case 5:	/* GID of file */
		return (EIF_INTEGER) buf->st_gid;
	case 6:	/* Size of file, in bytes */
			/* FIXME: This code should be upgraded to use 64-bit */
		return (EIF_INTEGER) buf->st_size;
	case 7:	/* Last modification time on file */
			/* FIXME: This code should be upgraded to use 64-bit */
		return (EIF_INTEGER) buf->st_mtime;
	case 8:	/* Last access made on file */
			/* FIXME: This code should be upgraded to use 64-bit */
		return (EIF_INTEGER) buf->st_atime;
	case 9:	/* Last status change */
			/* FIXME: This code should be upgraded to use 64-bit */
		return (EIF_INTEGER) buf->st_ctime;
	case 10: /* Number of links */
		return (EIF_INTEGER) buf->st_nlink;
	case 11: /* File type */
		return (EIF_INTEGER) (buf->st_mode & S_IFMT);
	case 12: /* Is file a directory */
		return (EIF_INTEGER) S_ISDIR(buf->st_mode);
	case 13: /* Is file a regular (plain) one */
		if (S_ISREG(buf->st_mode) || (0 == (buf->st_mode & S_IFMT)))
			return (EIF_INTEGER) EIF_TRUE;
		return (EIF_INTEGER) 0;
	case 14: /* Is file a device, ie character or block device. */
		return (S_ISCHR(buf->st_mode) || S_ISBLK(buf->st_mode));
	case 15: /* Is file a character device */
		return (EIF_INTEGER) S_ISCHR(buf->st_mode);
	case 16: /* Is file a block device */
		return (EIF_INTEGER) S_ISBLK(buf->st_mode);
	case 17: /* Is file a FIFO */
		return (EIF_INTEGER) S_ISFIFO(buf->st_mode);
	case 18: /* Is file a symbolic link */
		return (EIF_INTEGER) S_ISLNK(buf->st_mode);
	case 19: /* Is file a socket */
		return (EIF_INTEGER) S_ISSOCK(buf->st_mode);
	default:
		return (EIF_INTEGER)0;
    }
}

/*
 * Return the Eiffel string filled in with the name associated with `uid'
 * if found in /etc/passwd. Otherwise, return fill it in with the numeric
 * value.
 */
EIF_REFERENCE eif_file_owner(int uid) {
	char str[NAME_MAX];
#ifdef HAS_GETPWUID
	struct passwd *pp;

	pp = getpwuid(uid);
	if (pp == (struct passwd *) 0)
		sprintf(str, "%d", uid);		/* Not available: use UID */
	else
		strcpy(str, pp->pw_name);		/* Available: fetch login name */
#else
	sprintf(str, "%d", uid);			/* Not available: use UID */
#endif
	return GE_str8(str);
}

/*
 * Return the Eiffel string filled in with the name associated with `gid'
 * if found in /etc/group. Otherwise, return fill it in with the numeric
 * value.
 */
EIF_REFERENCE eif_file_group(int gid) {
	char str[NAME_MAX];
#ifdef HAS_GETGRGID
	struct group *gp; /* %%ss moved from above */

	gp = getgrgid(gid);
	if (gp == (struct group *) 0)
		sprintf(str, "%d", gid);		/* Not available: use GID */
	else
		strcpy(str, gp->gr_name);		/* Available: fetch login name */
#else
	sprintf(str, "%d", gid);			/* Not available: use UID */
#endif
	return GE_str8(str);
}

/*
 * Get an integer from `f'.
 */
EIF_INTEGER eif_file_gib(FILE* f) {
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
EIF_REAL_32 eif_file_grb(FILE* f) {
	EIF_REAL_32 r;
	errno = 0;
	if (fread (&r, sizeof (EIF_REAL_32), 1, f) != 1) {
		eise_io("FILE: unable to read REAL_32 value.");
	}
	return r;
}

/*
 * Get a double from `f'.
 */
EIF_REAL_64 eif_file_gdb(FILE* f) {
	EIF_REAL_64 d;
	errno = 0;
	if (fread (&d, sizeof(EIF_REAL_64), 1, f) != 1) {
		eise_io("FILE: unable to read REAL_64 value.");
	}
	return d;
}

/*
 * Open file `name' with the corresponding type `how'.
 */
EIF_POINTER eif_file_binary_open(EIF_FILENAME name, int how)
{
	FILE *fp;
	errno = 0;
#ifdef EIF_WINDOWS
	fp = (FILE *)rt_file_fopen(name, rt_file_open_mode(how,'b'));
#else
	fp = (FILE *)rt_file_fopen(name, rt_file_open_mode(how,'\0'));
#endif
	if (fp == (FILE *)0) {
		esys(); /* Open failed, raise exception */
	}
	return (EIF_POINTER)fp;

}

/*
 * Open file `fd' with the corresponding type `how'.
 */
EIF_POINTER eif_file_binary_dopen(int fd, int how) {
	FILE *fp;
	errno = 0;
#ifdef EIF_WINDOWS
		fp = (FILE *)rt_file_fdopen(fd, rt_file_open_mode(how,'b'));
#else
		fp = (FILE *)rt_file_fdopen(fd, rt_file_open_mode(how,'\0'));
#endif
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
EIF_POINTER eif_file_binary_reopen(EIF_FILENAME name, int how, FILE* old) {
	FILE *fp;
	errno = 0;
#ifdef EIF_WINDOWS
		fp = (FILE *)rt_file_freopen(name, rt_file_open_mode(how,'b'), old);
#else
		fp = (FILE *)rt_file_freopen(name, rt_file_open_mode(how,'\0'), old);
#endif
	if (fp == (FILE *)0) {
		esys(); /* Open failed, raise exception */
	}
	return (EIF_POINTER)fp;
}

/*
 * Write `number' on `f'.
 */
void eif_file_pib(FILE* f, EIF_INTEGER number) {
	errno = 0;
	if (fwrite(&number, sizeof(EIF_INTEGER),1, f) != 1) {
		eise_io("FILE: unable to write INTEGER value.");
	}
}

/*
 * Write `number' on `f'.
 */
void eif_file_prb(FILE* f, EIF_REAL_32 number) {
	errno = 0;
    if (fwrite(&number, sizeof(EIF_REAL_32),1, f) != 1) {
		eise_io("FILE: unable to write REAL_32 value.");
	}
}

/*
 * Write double `val' onto `f'.
 */
void eif_file_pdb(FILE* f, EIF_REAL_64 val) {
	errno = 0;
	if (fwrite (&val, sizeof(EIF_REAL_64), 1, f) != 1) {
		eise_io("FILE: unable to write REAL_64 value.");
	}
}

/*
 * Access time of a file.
 * Seconds since epoch (01 January 1970) in UTC or 0 if time cannot be retrieved.
 * mode: Mode of operation: non-zero for modification and zero for access time.
 */
static EIF_INTEGER eif_file_date_for (EIF_FILENAME name, int mode)
{
	EIF_INTEGER result = 0;
#ifdef EIF_WINDOWS
		/* On NTFS file system, windows store UTC file stamps in 100 of nanoseconds
		 * starting from January 1st 0. Converted in seconds, this time is greater
		 * than 232 therefore we substract the EPOCH date January 1st 1970 to get
		 * a 32 bits representation of the date.
		 * FIXME: Manu 01/28/2004: On FAT file system, the date is in local time,
		 * meaning that the code below does not compensate if you change your timezone
		 * and will return a different date value for the same stamp just because
		 * you are in different time zone.
		 */

		 /* WARNING: This is using the Ansi version of the Win32 API. Remember
		  * that if you are doing any change below.
		  */

	WIN32_FIND_DATAW l_find_data;
	HANDLE l_file_handle;
	ULARGE_INTEGER l_date;

	l_file_handle = FindFirstFileW (name, &l_find_data);
	if (l_file_handle != INVALID_HANDLE_VALUE) {
			/* We do not need the file handle anymore, so we close it to
			 * avoid handle leak. */
		FindClose (l_file_handle);
		if (mode) {
			l_date.LowPart = l_find_data.ftLastWriteTime.dwLowDateTime;
			l_date.HighPart = l_find_data.ftLastWriteTime.dwHighDateTime;
		} else {
			l_date.LowPart = l_find_data.ftLastAccessTime.dwLowDateTime;
			l_date.HighPart = l_find_data.ftLastAccessTime.dwHighDateTime;
		}
			/* Convert 100-nanosecond intervals to seconds
			 * and ajust "1 Jan 1601" to "1 Jan 1970".
			 * The difference between "1 Jan 1601" and "1 Jan 1970"
			 * can be precomputed using the following code:
			 *	SYSTEMTIME epoch = {1970, 1, 0, 1, 0, 0, 0, 0};
			 *	FILETIME epoch_file;
			 *	ULARGE_INTEGER epoch_date;
			 *	SystemTimeToFileTime (&epoch, &epoch_file);
			 *	epoch_date.LowPart = epoch_file.dwLowDateTime;
			 *	epoch_date.HighPart = epoch_file.dwHighDateTime;
			 * time_shift = epoch_date.QuadPart / 10000000UL; // 11644473600
			 */
		result = (EIF_INTEGER) (l_date.QuadPart / GE_nat64(10000000) - GE_nat64(11644473600));
	}
#else
	rt_stat_buf	info;
	if (-1 != eif_file_stat (name, &info, 1)) {
		result = (mode ?  (EIF_INTEGER) info.st_mtime: (EIF_INTEGER) info.st_atime);
	}
#endif
	return result;
}

/*
 * Modification time of a file.
 * Seconds since epoch (01 January 1970) in UTC or 0 if time cannot be retrieved.
 */
EIF_INTEGER eif_file_date (EIF_FILENAME  name) {
	return eif_file_date_for (name, 1);
}

/*
 * Access time of a file.
 * Seconds since epoch (01 January 1970) in UTC or 0 if time cannot be retrieved.
 */
EIF_INTEGER eif_file_access_date (EIF_FILENAME  name) {
	return eif_file_date_for (name, 0);
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
	copyright: "Copyright (c) 2006-2013, Eric Bezault and others"
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
	return eif_file_feof(fp);
}

EIF_CHARACTER_8 console_separator(FILE *f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return eif_file_lh(f);
}

void console_ps(FILE* f, char* str, EIF_INTEGER len) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	eif_file_ps(f, str, len);
}

void console_pr(FILE* f, EIF_REAL_32 number) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	eif_file_pr(f, number);
}

void console_pc(FILE* f, EIF_CHARACTER_8 c) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	eif_file_pc(f, c);
}

void console_pd(FILE* f, EIF_REAL_64 val) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	eif_file_pd(f, val);
}

void console_pi(FILE* f, EIF_INTEGER number) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	eif_file_pi(f, number);
}

void console_tnwl(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	console_pc(f,'\n');
}

EIF_CHARACTER_8 console_readchar(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return eif_file_gc(f);
}

EIF_REAL_32 console_readreal(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return eif_file_gr(f);
}

EIF_INTEGER console_readint(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return eif_file_gi(f);
}

EIF_REAL_64 console_readdouble(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return eif_file_gd(f);
}

EIF_INTEGER console_readword(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return eif_file_gw(f, s, bound, start);
}

EIF_INTEGER console_readline(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return eif_file_gs(f, s, bound, start);
}

void console_next_line(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	eif_file_tnil(f);
}

EIF_INTEGER console_readstream(FILE* f, char* s, EIF_INTEGER bound) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return eif_file_gss(f, s, bound);
}

void console_file_close (FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	eif_file_close(f);
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
	copyright: "Copyright (c) 2006-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_DIR_C
#define EIF_DIR_C

#ifdef EIF_WINDOWS
#ifdef __cplusplus
extern "C" {
#endif
typedef struct {
	HANDLE handle;
	WIN32_FIND_DATAW last_entry;
	wchar_t	*name;
} GE_directory;
#ifdef __cplusplus
}
#endif
#include <io.h> /* for 'access' */
#include <direct.h> /* (ch|rm)dir */
#include <wchar.h>
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
#ifndef S_IFMT
#define S_IFMT 0170000
#endif
#ifndef S_ISREG
#define S_ISREG(m) (((m) & S_IFMT) == S_IFREG)
#endif
#ifndef S_ISDIR
#define S_ISDIR(m) (((m) & S_IFMT) == S_IFDIR)
#endif
#ifndef S_ISCHR
#define S_ISCHR(m) (((m) & S_IFMT) == S_IFCHR)
#endif
#ifndef S_ISBLK
#define S_ISBLK(m) (((m) & S_IFMT) == S_IFBLK)
#endif
#ifndef S_ISLNK
#define S_ISLNK(m) (((m) & S_IFMT) == S_IFLNK)
#endif
#ifndef S_ISFIFO
#define S_ISFIFO(m) (((m) & S_IFMT) == S_IFIFO)
#endif

/* Keep only permission mode */
#ifndef ST_MODE
#define ST_MODE 0x0fff
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

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS
#	ifdef EIF_64_BITS
#		define rt_stat_buf	struct _stat64
#	else
#		define rt_stat_buf	struct _stat64i32
#	endif
#else
#	define rt_stat_buf		struct stat
#endif

#ifdef EIF_WINDOWS
#	ifdef EIF_64_BITS
#		define rt_stat		_wstat64
#		define rt_fstat		_fstat64
#	else
#		define rt_stat		_wstat64i32
#		define rt_fstat		_fstat64i32
#	endif
#	define rt_access		_waccess
#else
#	define rt_stat			stat
#	define rt_lstat			lstat
#	define rt_fstat			fstat
#	define rt_access		access
#endif

EIF_POINTER eif_dir_open(EIF_FILENAME dirname) {
#ifdef EIF_WINDOWS
	GE_directory* result = (GE_directory*)malloc(sizeof(GE_directory));
	result->name = dirname;
	result->handle = 0;
	return result;
#else
	return (opendir(((char*)dirname)));
#endif
}

EIF_POINTER eif_dir_next(EIF_POINTER dir) {
#ifdef EIF_WINDOWS
	BOOL r;
	size_t a_name_length;
	wchar_t * wname;
	GE_directory* GE_dir = (GE_directory*)dir;
	HANDLE h = GE_dir->handle;

	if (h) {
		r = FindNextFileW(h, &(GE_dir->last_entry));
	} else {
		r = EIF_FALSE;
			/* Allocate additional space for "\\*": 2 characters + terminating zero */
		a_name_length = wcslen(GE_dir->name);
		wname = (wchar_t *)malloc((a_name_length + 3) * sizeof(wchar_t));
		if (!wname) {
			enomem();
		} else {
			wcscpy(wname, GE_dir->name);
			if (wname[a_name_length - 1] == '\\') {
				wcscat(wname, L"*");
			} else {
				wcscat(wname , L"\\*");
			}
			h = FindFirstFileW(wname, &(GE_dir->last_entry));
			free (wname);
			if (h != INVALID_HANDLE_VALUE) {
				GE_dir->handle = h;
				r = EIF_TRUE;
			}
		}
	}
	if (r) {
		return GE_dir->last_entry.cFileName;
	} else {
		return NULL;
	}
#else
	struct dirent* p = readdir((DIR*)dir);
	if (p) {
		return p->d_name;
	} else {
		return NULL;
	}
#endif
}

EIF_POINTER eif_dir_rewind(EIF_POINTER dir, EIF_FILENAME a_name) {
#ifdef EIF_WINDOWS
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
	return GE_dir;
}

void eif_dir_close(EIF_POINTER dir) {
#ifdef EIF_WINDOWS
	GE_directory* GE_dir = (GE_directory*)dir;
	HANDLE h = GE_dir->handle;

	if (h) {
		FindClose(h);
	}
	GE_dir->handle = 0;
	free(GE_dir);
#else
	closedir((DIR*)dir);
#endif
}

EIF_BOOLEAN eif_dir_exists(EIF_FILENAME dirname) {
	rt_stat_buf buf;

	return (EIF_BOOLEAN) ((!rt_stat (dirname, &buf) && S_ISDIR(buf.st_mode)) ? EIF_TRUE : EIF_FALSE);
}

EIF_BOOLEAN eif_dir_is_readable(EIF_FILENAME dirname) {
#ifdef EIF_WINDOWS
	return (EIF_BOOLEAN) (_waccess (dirname, R_OK) != -1);
#else
	int uid, gid;
	int euid, egid;
	int mode;
	rt_stat_buf buf;

	rt_stat(dirname, &buf);
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
#ifdef HAS_GETGROUPS
	else if (eif_group_in_list(gid))
		return (EIF_BOOLEAN) ((mode & S_IRGRP) ? EIF_TRUE : EIF_FALSE);
#endif
	else
		return ((mode & S_IROTH) ? EIF_TRUE : EIF_FALSE);
#endif
}

EIF_BOOLEAN eif_dir_is_executable(EIF_FILENAME dirname) {
#ifdef EIF_WINDOWS
	return (EIF_BOOLEAN) (_waccess (dirname, F_OK) != -1);
#else
	int uid, gid;
	int euid, egid;
	int mode;
	rt_stat_buf buf;

	rt_stat(dirname, &buf);
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
#ifdef HAS_GETGROUPS
	else if (eif_group_in_list(gid))
		return (EIF_BOOLEAN) ((mode & S_IXGRP) ? EIF_TRUE : EIF_FALSE);
#endif
	else
		return ((mode & S_IXOTH) ? EIF_TRUE : EIF_FALSE);
#endif
}

EIF_BOOLEAN eif_dir_is_writable(EIF_FILENAME dirname) {
#ifdef EIF_WINDOWS
	return (EIF_BOOLEAN) (_waccess (dirname, W_OK) != -1);
#else
	int uid, gid;
	int euid, egid;
	int mode;
	rt_stat_buf buf;

	rt_stat(dirname, &buf);
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
#ifdef HAS_GETGROUPS
	else if (eif_group_in_list(gid))
		return (EIF_BOOLEAN) ((mode & S_IWGRP) ? EIF_TRUE : EIF_FALSE);
#endif
	else
		return ((mode & S_IWOTH) ? EIF_TRUE : EIF_FALSE);
#endif
}

EIF_BOOLEAN eif_dir_is_deletable (EIF_FILENAME name)
{
	return eif_dir_is_writable (name);
}

EIF_CHARACTER_8 eif_dir_separator(void) {
#ifdef EIF_WINDOWS
	return (EIF_CHARACTER_8)'\\';
#else
	return (EIF_CHARACTER_8)'/';
#endif
}

EIF_INTEGER eif_dir_current (EIF_FILENAME a_buffer, EIF_INTEGER a_count) {
	EIF_INTEGER l_nbytes;

#ifdef EIF_WINDOWS
	wchar_t *subpart;
	wchar_t drive[2];
	drive [0] = '.';
	drive [1] = '\0';
		/* First calculate the length of the buffer we need to hold the current working directory. */
	l_nbytes = (GetFullPathNameW (drive, 0, NULL, &subpart) + 1) * sizeof(wchar_t) ;

	if (l_nbytes == 0) {
			/* Failure: we cannot retrieve our current directory. */
		l_nbytes = -1;
	} else {
		if (a_buffer && (a_count >= l_nbytes)) {
			l_nbytes = (GetFullPathNameW (drive, l_nbytes / sizeof(wchar_t), a_buffer, &subpart) + 1) * sizeof(wchar_t);
		}
	}
	return l_nbytes;

#else
	char *cwd;
	cwd = getcwd (NULL, PATH_MAX);

	if (cwd) {
		l_nbytes = (strlen(cwd) + 1) * sizeof(char);
		if (a_buffer && (a_count >= l_nbytes)) {
			memcpy (a_buffer, cwd, l_nbytes);
		}
		free(cwd);	/* Not `eif_free', getcwd() call malloc in POSIX.1 */
	} else {
		l_nbytes = -1;
	}

	return l_nbytes;

#endif
}

EIF_INTEGER eif_chdir(EIF_FILENAME path) {
#ifdef EIF_WINDOWS
	return _wchdir (path);
#else
	return chdir (path);
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

		"C functions used to implement class COM_FAILURE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_COM_FAILURE_C
#define GE_COM_FAILURE_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_COM_FAILURE_H
#include "ge_com_failure.h"
#endif
#ifdef EIF_WINDOWS
#include <winerror.h>
#include <tchar.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

EIF_INTEGER GE_ccom_hresult(EIF_POINTER an_exception_code)
{
#ifdef EIF_WINDOWS
	char *stopstring = NULL;
	long result = 0, high_bits = 0, low_bits = 0;
	char high_str [7];
	char *exception_code = (char *)(an_exception_code);

	if (exception_code != NULL) {
		strncpy (high_str, exception_code, 6);
		high_str [6] = '\0';

		high_bits = strtol (high_str, &stopstring, 16);
		low_bits = strtol (exception_code + 6, &stopstring, 16);
		result = (high_bits << 16) + low_bits;
	}
	return (EIF_INTEGER)result;
#else
	return 0;
#endif
}

EIF_INTEGER GE_ccom_hresult_code(EIF_INTEGER an_hresult)
{
#ifdef EIF_WINDOWS
	return HRESULT_CODE(an_hresult);
#else
	return 0;
#endif
}

EIF_INTEGER GE_ccom_hresult_facility(EIF_INTEGER an_hresult)
{
#ifdef EIF_WINDOWS
	return HRESULT_FACILITY(an_hresult);
#else
	return 0;
#endif
}

/*
 * Get text from error `a_code'. It is up to the caller to free
 * the returned buffer using `GE_ccom_local_free'.
 */
EIF_POINTER GE_ccom_error_text(EIF_INTEGER a_code)
{
#ifdef EIF_WINDOWS
	LPVOID result;
	FormatMessage(
		FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS,
		NULL,
		a_code,
		MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), // Default language
		(LPTSTR) &result,
		0,
		NULL
		);
	return result;
#else
	return 0;
#endif
}

/*
 * Number of characters in `ptr'.
 */
EIF_INTEGER_32 GE_ccom_strlen(EIF_POINTER ptr)
{
#ifdef EIF_WINDOWS
	return (EIF_INTEGER_32) _tcslen ((TCHAR *) ptr);
#else
	return 0;
#endif
}

/*
 * Number of bytes occupied by a TCHAR.
 */
EIF_INTEGER_32 GE_ccom_character_size()
{
#ifdef EIF_WINDOWS
	return sizeof(TCHAR);
#else
	return 0;
#endif
}

/*
 * Free `a_ptr' using LocalFree.
 */
void GE_ccom_local_free(EIF_POINTER a_ptr)
{
#ifdef EIF_WINDOWS
	LocalFree((HLOCAL) a_ptr);
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
	copyright: "Copyright (c) 2006-2013, Eric Bezault and others"
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

EIF_INTEGER eif_system(EIF_NATIVE_CHAR* s) {
#ifdef EIF_WINDOWS
	return (EIF_INTEGER)_wsystem(s);
#else
	return (EIF_INTEGER)system(s);
#endif
}

void eif_system_asynchronous(EIF_NATIVE_CHAR* cmd) {
#ifdef EIF_WINDOWS
	STARTUPINFOW siStartInfo;
	PROCESS_INFORMATION procinfo;
	wchar_t* current_dir;
	EIF_INTEGER result;

	current_dir = (wchar_t*)_wgetcwd(NULL, PATH_MAX);
	memset(&siStartInfo, 0, sizeof siStartInfo);
	siStartInfo.cb = sizeof(STARTUPINFO);
	siStartInfo.lpTitle = NULL;
	siStartInfo.lpReserved = NULL;
	siStartInfo.lpReserved2 = NULL;
	siStartInfo.cbReserved2 = 0;
	siStartInfo.lpDesktop = NULL;
	siStartInfo.dwFlags = STARTF_FORCEONFEEDBACK;
	result = CreateProcessW(
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
	_wchdir(current_dir);
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
