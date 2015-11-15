#include "geant.h"

#ifdef __cplusplus
extern "C" {
#endif

/* XM_EIFFEL_SCANNER.has_normalized_newline */
T1 T142f179(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* XM_EIFFEL_SCANNER.text_substring */
T0* T142f159(T0* C, T6 a1, T6 a2)
{
	T1 t1;
	T6 t2;
	T6 t3;
	T0* R = 0;
	t1 = ((T1)((a2)<(a1)));
	if (t1) {
		R = T17c38((T6)(GE_int32(0)));
	} else {
		t2 = ((T6)((((T142*)(C))->a15)+(a1)));
		t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
		t3 = ((T6)((((T142*)(C))->a15)+(a2)));
		t3 = ((T6)((t3)-((T6)(GE_int32(1)))));
		R = (T387f3(GE_void(((T142*)(C))->a24), t2, t3));
	}
	return R;
}

/* XM_EIFFEL_SCANNER.text_count */
T6 T142f158(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T142*)(C))->a14)-(((T142*)(C))->a15)));
	return R;
}

/* XM_EIFFEL_SCANNER.system_literal_text */
T0* T142f140(T0* C)
{
	T6 t1;
	T2 t2;
	T1 t3;
	T6 t4;
	T0* R = 0;
	T6 l1 = 0;
	T2 l2 = 0;
	t1 = (T142f158(C));
	l2 = (T142f193(C, t1));
	t1 = (T142f158(C));
	l1 = ((T6)((t1)-((T6)(GE_int32(1)))));
	while (1) {
		t2 = (T142f193(C, l1));
		t3 = (((((t2) == (l2)))));
		if (t3) {
			break;
		}
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
	}
	t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	t4 = (T142f158(C));
	t4 = ((T6)((t4)-((T6)(GE_int32(1)))));
	R = (T142f159(C, t1, t4));
	return R;
}

/* XM_EIFFEL_SCANNER.text_item */
T2 T142f193(T0* C, T6 a1)
{
	T1 t1;
	T6 t2;
	T2 R = 0;
	T0* l1 = 0;
	l1 = ((T142*)(C))->a22;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		t2 = ((T6)((((T142*)(C))->a15)+(a1)));
		t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
		R = (((T15*)(GE_void(l1)))->z2[t2]);
	} else {
		t2 = ((T6)((((T142*)(C))->a15)+(a1)));
		t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
		R = (T387f6(GE_void(((T142*)(C))->a24), t2));
	}
	return R;
}

/* XM_EIFFEL_SCANNER.normalized_newline */
T0* T142f99(T0* C)
{
	T0* R = 0;
	if (ge1800os7270) {
		return ge1800ov7270;
	} else {
		ge1800os7270 = '\1';
		ge1800ov7270 = R;
	}
	R = GE_ms8("\n", 1);
	ge1800ov7270 = R;
	return R;
}

/* XM_EIFFEL_SCANNER.yy_set_line_column */
void T142f218(T0* C)
{
	T1 t1;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T0* l7 = 0;
	l7 = ((T142*)(C))->a22;
	l1 = ((T6)((((T142*)(C))->a14)-((T6)(GE_int32(1)))));
	l2 = ((T6)((((T142*)(C))->a15)+(((T142*)(C))->a13)));
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
			l6 = (T387f6(GE_void(((T142*)(C))->a24), l1));
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
			l6 = (T387f6(GE_void(((T142*)(C))->a24), l1));
		}
		t1 = (((((l6) == ((T2)('\n'))))));
		if (t1) {
			l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
		}
		l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
	}
	if (l5) {
		((T142*)(C))->a16 = ((T6)((((T142*)(C))->a16)+(l3)));
		((T142*)(C))->a17 = ((T6)((l4)+((T6)(GE_int32(1)))));
	} else {
		((T142*)(C))->a17 = ((T6)((((T142*)(C))->a17)+(l4)));
	}
}

/* XM_EIFFEL_SCANNER.text */
T0* T142f73(T0* C)
{
	T1 t1;
	T6 t2;
	T0* R = 0;
	t1 = ((T1)((((T142*)(C))->a15)<(((T142*)(C))->a14)));
	if (t1) {
		t2 = ((T6)((((T142*)(C))->a14)-((T6)(GE_int32(1)))));
		R = (T387f3(GE_void(((T142*)(C))->a24), ((T142*)(C))->a15, t2));
	} else {
		R = T17c38((T6)(GE_int32(0)));
	}
	return R;
}

/* XM_EIFFEL_SCANNER.pop_start_condition */
void T142f217(T0* C)
{
	T1 t1;
	T6 t2;
	t1 = (T245f3(GE_void(((T142*)(C))->a42)));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (T245f4(GE_void(((T142*)(C))->a42)));
		T142f219(C, t2);
		T245f7(GE_void(((T142*)(C))->a42));
	}
}

/* XM_EIFFEL_SCANNER.set_start_condition */
void T142f219(T0* C, T6 a1)
{
	T6 t1;
	t1 = (T6)(GE_int32(2));
	t1 = ((T6)((t1)*(a1)));
	((T142*)(C))->a8 = ((T6)((t1)+((T6)(GE_int32(1)))));
}

/* XM_EIFFEL_SCANNER.push_start_condition */
void T142f211(T0* C, T6 a1)
{
	T6 t1;
	t1 = (T142f44(C));
	T245f6(GE_void(((T142*)(C))->a42), t1);
	T142f219(C, a1);
}

/* XM_EIFFEL_SCANNER.set_last_token */
void T142f216(T0* C, T6 a1)
{
	((T142*)(C))->a1 = a1;
}

/* XM_EIFFEL_SCANNER.yy_execute_eof_action */
void T142f209(T0* C, T6 a1)
{
	T142f215(C);
}

/* XM_EIFFEL_SCANNER.terminate */
void T142f215(T0* C)
{
	((T142*)(C))->a1 = (T6)(GE_int32(0));
}

/* XM_EIFFEL_SCANNER.wrap */
T1 T142f63(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* XM_EIFFEL_SCANNER.yy_refill_input_buffer */
void T142f208(T0* C)
{
	T0* t1;
	T6 t2;
	T6 l1 = 0;
	if (((T0*)(GE_void(((T142*)(C))->a19)))->id==241) {
		T241f13(((T142*)(C))->a19, ((T142*)(C))->a15);
	} else {
		T242f18(((T142*)(C))->a19, ((T142*)(C))->a15);
	}
	if (((T0*)(GE_void(((T142*)(C))->a19)))->id==241) {
		T241f15(((T142*)(C))->a19);
	} else {
		T242f20(((T142*)(C))->a19);
	}
	t1 = (((((T0*)(GE_void(((T142*)(C))->a19)))->id==241)?((T241*)(((T142*)(C))->a19))->a4:((T242*)(((T142*)(C))->a19))->a4));
	T142f214(C, t1);
	l1 = (((((T0*)(GE_void(((T142*)(C))->a19)))->id==241)?((T241*)(((T142*)(C))->a19))->a5:((T242*)(((T142*)(C))->a19))->a5));
	t2 = ((T6)((((T142*)(C))->a14)-(((T142*)(C))->a15)));
	((T142*)(C))->a14 = ((T6)((t2)+(l1)));
	((T142*)(C))->a15 = l1;
}

/* XM_EIFFEL_SCANNER.yy_null_trans_state */
T6 T142f62(T0* C, T6 a1)
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
		t2 = (((T63*)(GE_void(((T142*)(C))->a25)))->z2[a1]);
		t1 = (((((t2) != ((T6)(GE_int32(0)))))));
		if (t1) {
			((T142*)(C))->a26 = a1;
			((T142*)(C))->a27 = ((T142*)(C))->a14;
		}
	}
	R = a1;
	l1 = (T6)(GE_int32(1));
	while (1) {
		t2 = (((T63*)(GE_void(((T142*)(C))->a29)))->z2[R]);
		t2 = ((T6)((t2)+(l1)));
		t2 = (((T63*)(GE_void(((T142*)(C))->a28)))->z2[t2]);
		t1 = (((((t2) == (R)))));
		if (t1) {
			break;
		}
		R = (((T63*)(GE_void(((T142*)(C))->a30)))->z2[R]);
		t1 = (((T142*)(C))->a31?((m1 = ((T142*)(C))->a31, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t1 = (T6f6((&R), (T6)(GE_int32(831))));
		}
		if (t1) {
			l1 = (((T63*)(m1))->z2[l1]);
		}
	}
	t2 = (((T63*)(GE_void(((T142*)(C))->a29)))->z2[R]);
	t2 = ((T6)((t2)+(l1)));
	R = (((T63*)(GE_void(((T142*)(C))->a32)))->z2[t2]);
	if (EIF_FALSE) {
		t3 = (T142f51(C));
		T65f7(GE_void(t3), ((T142*)(C))->a20, R, ((T142*)(C))->a21);
		((T142*)(C))->a21 = ((T6)((((T142*)(C))->a21)+((T6)(GE_int32(1)))));
	}
	l2 = (((((R) == ((T6)(GE_int32(830)))))));
	if (l2) {
		R = (T6)(GE_int32(0));
	}
	return R;
}

/* XM_EIFFEL_SCANNER.yy_previous_state */
T6 T142f61(T0* C)
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
	t1 = (((((T0*)(GE_void(((T142*)(C))->a19)))->id==241)?((T241*)(((T142*)(C))->a19))->a1:((T242*)(((T142*)(C))->a19))->a1));
	if (t1) {
		R = ((T6)((((T142*)(C))->a8)+((T6)(GE_int32(1)))));
	} else {
		R = ((T142*)(C))->a8;
	}
	if (EIF_FALSE) {
		t2 = (T142f51(C));
		T65f7(GE_void(t2), ((T142*)(C))->a20, R, (T6)(GE_int32(0)));
		((T142*)(C))->a21 = (T6)(GE_int32(1));
	}
	l4 = ((T142*)(C))->a22;
	l1 = ((T6)((((T142*)(C))->a15)+(((T142*)(C))->a13)));
	l2 = ((T142*)(C))->a14;
	while (1) {
		t1 = (T6f6((&l1), l2));
		if (t1) {
			break;
		}
		t1 = ((l4)!=(EIF_VOID));
		if (t1) {
			t3 = (((T15*)(GE_void(l4)))->z2[l1]);
			l3 = ((T6)(t3));
		} else {
			t3 = (T387f6(GE_void(((T142*)(C))->a24), l1));
			l3 = ((T6)(t3));
		}
		t1 = (((((l3) == ((T6)(GE_int32(0)))))));
		if (t1) {
			l3 = (T6)(GE_int32(1));
		} else {
			t1 = (((T142*)(C))->a23?((m1 = ((T142*)(C))->a23, EIF_TRUE)):EIF_FALSE);
			if (t1) {
				l3 = (((T63*)(m1))->z2[l3]);
			}
		}
		t1 = EIF_FALSE;
		t1 = ((T1)(!(t1)));
		if (t1) {
			t4 = (((T63*)(GE_void(((T142*)(C))->a25)))->z2[R]);
			t1 = (((((t4) != ((T6)(GE_int32(0)))))));
			if (t1) {
				((T142*)(C))->a26 = R;
				((T142*)(C))->a27 = l1;
			}
		}
		while (1) {
			t4 = (((T63*)(GE_void(((T142*)(C))->a29)))->z2[R]);
			t4 = ((T6)((t4)+(l3)));
			t4 = (((T63*)(GE_void(((T142*)(C))->a28)))->z2[t4]);
			t1 = (((((t4) == (R)))));
			if (t1) {
				break;
			}
			R = (((T63*)(GE_void(((T142*)(C))->a30)))->z2[R]);
			t1 = (((T142*)(C))->a31?((m2 = ((T142*)(C))->a31, EIF_TRUE)):EIF_FALSE);
			if (t1) {
				t1 = (T6f6((&R), (T6)(GE_int32(831))));
			}
			if (t1) {
				l3 = (((T63*)(m2))->z2[l3]);
			}
		}
		t4 = (((T63*)(GE_void(((T142*)(C))->a29)))->z2[R]);
		t4 = ((T6)((t4)+(l3)));
		R = (((T63*)(GE_void(((T142*)(C))->a32)))->z2[t4]);
		if (EIF_FALSE) {
			t2 = (T142f51(C));
			T65f7(GE_void(t2), ((T142*)(C))->a20, R, ((T142*)(C))->a21);
			((T142*)(C))->a21 = ((T6)((((T142*)(C))->a21)+((T6)(GE_int32(1)))));
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	return R;
}

/* XM_EIFFEL_SCANNER.fatal_error */
void T142f207(T0* C, T0* a1)
{
	((T142*)(C))->a41 = a1;
}

/* XM_EIFFEL_PE_ENTITY_DEF.push_start_condition_dtd_ignore */
void T186f237(T0* C)
{
	T186f246(C, (T6)(GE_int32(17)));
}

/* XM_EIFFEL_SCANNER_DTD.push_start_condition_dtd_ignore */
void T184f203(T0* C)
{
	T184f216(C, (T6)(GE_int32(17)));
}

/* XM_EIFFEL_ENTITY_DEF.push_start_condition_dtd_ignore */
void T183f233(T0* C)
{
	T183f241(C, (T6)(GE_int32(17)));
}

/* XM_EIFFEL_SCANNER.push_start_condition_dtd_ignore */
void T142f201(T0* C)
{
	T142f211(C, (T6)(GE_int32(17)));
}

/* XM_EIFFEL_PE_ENTITY_DEF.set_encoding */
void T186f238(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	{
		t1 = (((T186*)(C))->a46?((m1 = ((T186*)(C))->a46, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(7);
		}		T228f30(m1, a1);
	}
}

/* XM_EIFFEL_INPUT_STREAM.set_encoding */
void T228f30(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	t1 = (T228f17(C));
	t2 = (T75f11(GE_void(t1), a1, ge1791ov8466));
	if (t2) {
		((T228*)(C))->a2 = (T6)(GE_int32(3));
	} else {
		t1 = (T228f17(C));
		t2 = (T75f11(GE_void(t1), a1, ge1791ov8468));
		if (t2) {
		} else {
			((T228*)(C))->a2 = (T6)(GE_int32(1));
		}
	}
}

/* XM_EIFFEL_SCANNER_DTD.set_encoding */
void T184f204(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	{
		t1 = (((T184*)(C))->a7?((m1 = ((T184*)(C))->a7, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(7);
		}		T228f30(m1, a1);
	}
}

/* XM_EIFFEL_ENTITY_DEF.set_encoding */
void T183f234(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	{
		t1 = (((T183*)(C))->a44?((m1 = ((T183*)(C))->a44, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(7);
		}		T228f30(m1, a1);
	}
}

/* XM_EIFFEL_SCANNER.set_encoding */
void T142f202(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	{
		t1 = (((T142*)(C))->a7?((m1 = ((T142*)(C))->a7, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(7);
		}		T228f30(m1, a1);
	}
}

/* XM_EIFFEL_PE_ENTITY_DEF.set_input_from_resolver */
void T186f239(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	{
		t1 = (T150f2(GE_void(a1)));
		t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
		if (!(t2)) {
			GE_raise(7);
		}		T186f234(C, m1);
		((T186*)(C))->a48 = a1;
	}
}

/* XM_EIFFEL_SCANNER_DTD.set_input_from_resolver */
void T184f205(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	{
		t1 = (T150f2(GE_void(a1)));
		t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
		if (!(t2)) {
			GE_raise(7);
		}		T184f200(C, m1);
		((T184*)(C))->a11 = a1;
	}
}

/* XM_EIFFEL_ENTITY_DEF.set_input_from_resolver */
void T183f235(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	{
		t1 = (T150f2(GE_void(a1)));
		t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
		if (!(t2)) {
			GE_raise(7);
		}		T183f230(C, m1);
		((T183*)(C))->a46 = a1;
	}
}

/* XM_EIFFEL_SCANNER.set_input_from_resolver */
void T142f203(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	{
		t1 = (T150f2(GE_void(a1)));
		t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
		if (!(t2)) {
			GE_raise(7);
		}		T142f198(C, m1);
		((T142*)(C))->a11 = a1;
	}
}

/* XM_EIFFEL_PE_ENTITY_DEF.close_input */
void T186f236(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* m2 = 0;
	t1 = (((T186*)(C))->a47?((m1 = ((T186*)(C))->a47, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t1 = (((T186*)(C))->a48?((m2 = ((T186*)(C))->a48, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t1 = (((((T0*)(m1))->id==55)?T55f30(m1):T502f7(m1)));
			if (t1) {
				if (((T0*)(m1))->id==55) {
					T55f63(m1);
				} else {
					T502f11(m1);
				}
			}
			T150f6(m2);
		}
		((T186*)(C))->a47 = EIF_VOID;
		((T186*)(C))->a48 = EIF_VOID;
	}
}

/* KL_STRING_INPUT_STREAM.close */
void T502f11(T0* C)
{
}

/* KL_STRING_INPUT_STREAM.is_closable */
T1 T502f7(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* KL_TEXT_INPUT_FILE.is_closable */
T1 T55f30(T0* C)
{
	T1 R = 0;
	R = (T55f28(C));
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.close_input */
void T184f202(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* m2 = 0;
	t1 = (((T184*)(C))->a10?((m1 = ((T184*)(C))->a10, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t1 = (((T184*)(C))->a11?((m2 = ((T184*)(C))->a11, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t1 = (T55f30(m1));
			if (t1) {
				T55f63(m1);
			}
			T150f6(m2);
		}
		((T184*)(C))->a10 = EIF_VOID;
		((T184*)(C))->a11 = EIF_VOID;
	}
}

/* XM_EIFFEL_ENTITY_DEF.close_input */
void T183f232(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* m2 = 0;
	t1 = (((T183*)(C))->a45?((m1 = ((T183*)(C))->a45, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t1 = (((T183*)(C))->a46?((m2 = ((T183*)(C))->a46, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t1 = (((((T0*)(m1))->id==55)?T55f30(m1):T502f7(m1)));
			if (t1) {
				if (((T0*)(m1))->id==55) {
					T55f63(m1);
				} else {
					T502f11(m1);
				}
			}
			T150f6(m2);
		}
		((T183*)(C))->a45 = EIF_VOID;
		((T183*)(C))->a46 = EIF_VOID;
	}
}

/* XM_EIFFEL_SCANNER.close_input */
void T142f200(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* m2 = 0;
	t1 = (((T142*)(C))->a10?((m1 = ((T142*)(C))->a10, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t1 = (((T142*)(C))->a11?((m2 = ((T142*)(C))->a11, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t1 = (T55f30(m1));
			if (t1) {
				T55f63(m1);
			}
			T150f6(m2);
		}
		((T142*)(C))->a10 = EIF_VOID;
		((T142*)(C))->a11 = EIF_VOID;
	}
}

/* XM_NAMESPACE_RESOLVER.on_start */
void T187f27(T0* C)
{
	T187f38(C);
	T99x6080(GE_void(((T187*)(C))->a1));
}

/* XM_CALLBACKS_NULL.on_start */
void T147f2(T0* C)
{
}

/* XM_STOP_ON_ERROR_FILTER.on_start */
void T103f9(T0* C)
{
	((T103*)(C))->a1 = EIF_FALSE;
	((T103*)(C))->a2 = EIF_VOID;
	T103f9p1(C);
}

/* XM_STOP_ON_ERROR_FILTER.on_start */
void T103f9p1(T0* C)
{
	T99x6080(GE_void(((T103*)(C))->a3));
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_start */
void T100f14(T0* C)
{
	T100f12(C);
}

/* XM_NAMESPACE_RESOLVER.on_finish */
void T187f28(T0* C)
{
	T99x6081(GE_void(((T187*)(C))->a1));
}

/* XM_CALLBACKS_NULL.on_finish */
void T147f3(T0* C)
{
}

/* XM_STOP_ON_ERROR_FILTER.on_finish */
void T103f10(T0* C)
{
	T1 t1;
	t1 = ((T1)(!(((T103*)(C))->a1)));
	if (t1) {
		T103f10p1(C);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_finish */
void T103f10p1(T0* C)
{
	T99x6081(GE_void(((T103*)(C))->a3));
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_finish */
void T100f15(T0* C)
{
	T99x6081(GE_void(((T100*)(C))->a6));
}

/* XM_NAMESPACE_RESOLVER.on_comment */
void T187f29(T0* C, T0* a1)
{
	T99x6085T0(GE_void(((T187*)(C))->a1), a1);
}

/* XM_CALLBACKS_NULL.on_comment */
void T147f4(T0* C, T0* a1)
{
}

/* XM_STOP_ON_ERROR_FILTER.on_comment */
void T103f11(T0* C, T0* a1)
{
	T1 t1;
	t1 = ((T1)(!(((T103*)(C))->a1)));
	if (t1) {
		T103f11p1(C, a1);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_comment */
void T103f11p1(T0* C, T0* a1)
{
	T99x6085T0(GE_void(((T103*)(C))->a3), a1);
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_comment */
void T100f16(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T0* l1 = 0;
	t1 = (((T100*)(C))->a4?((m1 = ((T100*)(C))->a4, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		l1 = T289c3(m1, a1);
	} else {
		l1 = T289c4(((T100*)(C))->a2, a1);
	}
	T100f24(C, l1);
}

/* XM_CALLBACKS_TO_TREE_FILTER.handle_position */
void T100f24(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T0* m2 = 0;
	T0* t2;
	t1 = (((T100*)(C))->a1?((m1 = ((T100*)(C))->a1, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t1 = (((T100*)(C))->a3?((m2 = ((T100*)(C))->a3, EIF_TRUE)):EIF_FALSE);
	}
	if (t1) {
		t2 = (T96f128(m2));
		T104f5(m1, t2, a1);
	}
}

/* XM_POSITION_TABLE.put */
void T104f5(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	l1 = T233c3(a1, a2);
	T201f9(GE_void(((T104*)(C))->a1), l1);
}

/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].put_last */
void T201f9(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T0* l1 = 0;
	t1 = (((T201*)(C))->a2?((m1 = ((T201*)(C))->a2, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		l1 = T295c3(a1);
		T295f4(m1, l1);
		((T201*)(C))->a2 = l1;
		((T201*)(C))->a3 = ((T6)((((T201*)(C))->a3)+((T6)(GE_int32(1)))));
	} else {
		((T201*)(C))->a4 = T295c3(a1);
		((T201*)(C))->a2 = ((T201*)(C))->a4;
		((T201*)(C))->a3 = (T6)(GE_int32(1));
	}
}

/* detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].put_right */
void T295f4(T0* C, T0* a1)
{
	((T295*)(C))->a2 = a1;
}

/* detachable DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].make */
T0* T295c3(T0* a1)
{
	T0* C;
	C = GE_new295(EIF_TRUE);
	((T295*)(C))->a1 = a1;
	return C;
}

/* DS_PAIR [XM_POSITION, XM_NODE].make */
T0* T233c3(T0* a1, T0* a2)
{
	T0* C;
	C = GE_new233(EIF_TRUE);
	((T233*)(C))->a1 = a1;
	((T233*)(C))->a2 = a2;
	return C;
}

/* XM_COMMENT.make_last_in_document */
T0* T289c4(T0* a1, T0* a2)
{
	T0* C;
	C = GE_new289(EIF_TRUE);
	((T289*)(C))->a1 = a2;
	((T289*)(C))->a2 = a1;
	T101f12(GE_void(a1), C);
	return C;
}

/* XM_COMMENT.make_last */
T0* T289c3(T0* a1, T0* a2)
{
	T0* C;
	C = GE_new289(EIF_TRUE);
	((T289*)(C))->a1 = a2;
	((T289*)(C))->a2 = a1;
	T102f28(GE_void(a1), C);
	return C;
}

/* XM_ELEMENT.force_last */
void T102f28(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	t1 = (T102f17(C));
	if (!(t1)) {
		t2 = (T102f18(C));
		t1 = ((t2)!=(a1));
	}
	if (t1) {
		T102f29(C, a1);
		T199f13(GE_void(((T102*)(C))->a2), a1);
	}
}

/* XM_LINKED_LIST [XM_ELEMENT_NODE].force_last */
void T199f13(T0* C, T0* a1)
{
	T199f18(C, a1);
	T199f13p1(C, a1);
}

/* XM_LINKED_LIST [XM_ELEMENT_NODE].force_last */
void T199f13p1(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T0* l1 = 0;
	t1 = (((T199*)(C))->a2?((m1 = ((T199*)(C))->a2, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		l1 = T294c3(a1);
		T294f4(m1, l1);
		((T199*)(C))->a2 = l1;
		((T199*)(C))->a3 = ((T6)((((T199*)(C))->a3)+((T6)(GE_int32(1)))));
	} else {
		((T199*)(C))->a4 = T294c3(a1);
		((T199*)(C))->a2 = ((T199*)(C))->a4;
		((T199*)(C))->a3 = (T6)(GE_int32(1));
	}
}

/* detachable DS_LINKABLE [XM_ELEMENT_NODE].make */
T0* T294c3(T0* a1)
{
	T0* C;
	C = GE_new294(EIF_TRUE);
	((T294*)(C))->a2 = a1;
	return C;
}

/* XM_LINKED_LIST [XM_ELEMENT_NODE].before_addition */
void T199f18(T0* C, T0* a1)
{
}

/* XM_ELEMENT.before_addition */
void T102f29(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T282x6676(a1));
	if (((T0*)(GE_void(t1)))->id==101) {
		T101f14(t1, a1);
	} else {
		T102f27(t1, a1);
	}
	T282x6700T0(a1, C);
}

/* XM_ELEMENT.last */
T0* T102f18(T0* C)
{
	T0* R = 0;
	R = (T199f8(GE_void(((T102*)(C))->a2)));
	return R;
}

/* XM_LINKED_LIST [XM_ELEMENT_NODE].last */
T0* T199f8(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* R = 0;
	{
		t1 = (((T199*)(C))->a2?((m1 = ((T199*)(C))->a2, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(7);
		}		R = (((T294*)(m1))->a2);
	}
	return R;
}

/* XM_ELEMENT.is_empty */
T1 T102f17(T0* C)
{
	T1 R = 0;
	R = (T199f7(GE_void(((T102*)(C))->a2)));
	return R;
}

/* XM_LINKED_LIST [XM_ELEMENT_NODE].is_empty */
T1 T199f7(T0* C)
{
	T1 R = 0;
	R = (((((((T199*)(C))->a3) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_NAMESPACE_RESOLVER.on_processing_instruction */
void T187f30(T0* C, T0* a1, T0* a2)
{
	T99x6084T0T0(GE_void(((T187*)(C))->a1), a1, a2);
}

/* XM_CALLBACKS_NULL.on_processing_instruction */
void T147f5(T0* C, T0* a1, T0* a2)
{
}

/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
void T103f12(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	t1 = ((T1)(!(((T103*)(C))->a1)));
	if (t1) {
		T103f12p1(C, a1, a2);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
void T103f12p1(T0* C, T0* a1, T0* a2)
{
	T99x6084T0T0(GE_void(((T103*)(C))->a3), a1, a2);
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_processing_instruction */
void T100f17(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T0* m1 = 0;
	T0* l1 = 0;
	t1 = (((T100*)(C))->a4?((m1 = ((T100*)(C))->a4, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		l1 = T290c4(m1, a1, a2);
	} else {
		l1 = T290c5(((T100*)(C))->a2, a1, a2);
	}
	T100f24(C, l1);
}

/* XM_PROCESSING_INSTRUCTION.make_last_in_document */
T0* T290c5(T0* a1, T0* a2, T0* a3)
{
	T0* C;
	C = GE_new290(EIF_TRUE);
	((T290*)(C))->a1 = a2;
	((T290*)(C))->a2 = a3;
	((T290*)(C))->a3 = a1;
	T101f12(GE_void(a1), C);
	return C;
}

/* XM_PROCESSING_INSTRUCTION.make_last */
T0* T290c4(T0* a1, T0* a2, T0* a3)
{
	T0* C;
	C = GE_new290(EIF_TRUE);
	((T290*)(C))->a1 = a2;
	((T290*)(C))->a2 = a3;
	((T290*)(C))->a3 = a1;
	T102f28(GE_void(a1), C);
	return C;
}

/* XM_NAMESPACE_RESOLVER.on_content */
void T187f31(T0* C, T0* a1)
{
	T99x6090T0(GE_void(((T187*)(C))->a1), a1);
}

/* XM_CALLBACKS_NULL.on_content */
void T147f6(T0* C, T0* a1)
{
}

/* XM_STOP_ON_ERROR_FILTER.on_content */
void T103f13(T0* C, T0* a1)
{
	T1 t1;
	t1 = ((T1)(!(((T103*)(C))->a1)));
	if (t1) {
		T103f13p1(C, a1);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_content */
void T103f13p1(T0* C, T0* a1)
{
	T99x6090T0(GE_void(((T103*)(C))->a3), a1);
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_content */
void T100f18(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T0* l1 = 0;
	{
		t1 = (((T100*)(C))->a4?((m1 = ((T100*)(C))->a4, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(7);
		}		l1 = T291c3(m1, a1);
		T100f24(C, l1);
	}
}

/* XM_CHARACTER_DATA.make_last */
T0* T291c3(T0* a1, T0* a2)
{
	T0* C;
	C = GE_new291(EIF_TRUE);
	((T291*)(C))->a1 = a2;
	((T291*)(C))->a2 = a1;
	T102f28(GE_void(a1), C);
	return C;
}

/* XM_NAMESPACE_RESOLVER.on_start_tag */
void T187f34(T0* C, T0* a1, T0* a2, T0* a3)
{
	T272f12(GE_void(((T187*)(C))->a4));
	((T187*)(C))->a3 = a2;
	((T187*)(C))->a2 = a3;
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.push */
void T272f12(T0* C)
{
	T0* t1;
	t1 = (T272f8(C));
	T375f10(GE_void(((T272*)(C))->a1), t1);
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].force_last */
void T375f10(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T0* l1 = 0;
	t1 = (((T375*)(C))->a2?((m1 = ((T375*)(C))->a2, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		l1 = T500c4(a1);
		T500f5(m1, l1);
		((T375*)(C))->a2 = l1;
		((T375*)(C))->a1 = ((T6)((((T375*)(C))->a1)+((T6)(GE_int32(1)))));
	} else {
		((T375*)(C))->a3 = T500c4(a1);
		((T375*)(C))->a2 = ((T375*)(C))->a3;
		((T375*)(C))->a1 = (T6)(GE_int32(1));
	}
}

/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].put_right */
void T500f5(T0* C, T0* a1)
{
	((T500*)(C))->a3 = a1;
	T500f6(GE_void(a1), C);
}

/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].attach_left */
void T500f6(T0* C, T0* a1)
{
	((T500*)(C))->a2 = a1;
}

/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].make */
T0* T500c4(T0* a1)
{
	T0* C;
	C = GE_new500(EIF_TRUE);
	((T500*)(C))->a1 = a1;
	return C;
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.new_string_string_table */
T0* T272f8(T0* C)
{
	T0* t1;
	T0* R = 0;
	R = T83c40();
	t1 = (T272f9(C));
	T83f41(GE_void(R), t1);
	t1 = (T272f9(C));
	T83f42(GE_void(R), t1);
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].set_equality_tester */
void T83f42(T0* C, T0* a1)
{
	((T83*)(C))->a3 = a1;
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.string_equality_tester */
T0* T272f9(T0* C)
{
	T0* R = 0;
	if (ge222os2343) {
		return ge222ov2343;
	} else {
		ge222os2343 = '\1';
		ge222ov2343 = R;
	}
	R = T59c3();
	ge222ov2343 = R;
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].make_map_default */
T0* T83c40(void)
{
	T0* C;
	T6 t1;
	C = GE_new83(EIF_TRUE);
	t1 = (T83f37(C));
	T83f43(C, t1);
	return C;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].default_capacity */
T6 T83f37(T0* C)
{
	T6 R = 0;
	R = (T6)(GE_int32(10));
	return R;
}

/* XM_CALLBACKS_NULL.on_start_tag */
void T147f9(T0* C, T0* a1, T0* a2, T0* a3)
{
}

/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
void T103f14(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	t1 = ((T1)(!(((T103*)(C))->a1)));
	if (t1) {
		T103f14p1(C, a1, a2, a3);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
void T103f14p1(T0* C, T0* a1, T0* a2, T0* a3)
{
	T99x6086T0T0T0(GE_void(((T103*)(C))->a3), a1, a2, a3);
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag */
void T100f19(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T0* m1 = 0;
	T0* m2 = 0;
	T0* t2;
	T0* l1 = 0;
	{
		t1 = (a1?((m1 = a1, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(7);
		}		t1 = (((T100*)(C))->a4?((m2 = ((T100*)(C))->a4, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t2 = (T100f8(C, m1, a2));
			l1 = T102c25(m2, a3, t2);
		} else {
			t2 = (T100f8(C, m1, a2));
			l1 = T102c26(((T100*)(C))->a2, a3, t2);
		}
		((T100*)(C))->a4 = l1;
		T100f24(C, l1);
	}
}

/* XM_ELEMENT.make_root */
T0* T102c26(T0* a1, T0* a2, T0* a3)
{
	T0* C;
	C = GE_new102(EIF_TRUE);
	((T102*)(C))->a4 = a2;
	((T102*)(C))->a3 = a3;
	((T102*)(C))->a1 = a1;
	((T102*)(C))->a2 = T199c11();
	T101f15(GE_void(a1), C);
	return C;
}

/* XM_DOCUMENT.set_root_element */
void T101f15(T0* C, T0* a1)
{
	T101f16(C);
	((T101*)(C))->a1 = a1;
	T101f12(C, a1);
}

/* XM_DOCUMENT.remove_previous_root_element */
void T101f16(T0* C)
{
	T1 t1;
	T0* t2;
	T0* l1 = 0;
	l1 = (T101f7(C));
	T231f11(GE_void(l1));
	while (1) {
		t1 = (((T231*)(GE_void(l1)))->a1);
		if (t1) {
			break;
		}
		t2 = (T231f8(GE_void(l1)));
		t1 = ((t2)==(((T101*)(C))->a1));
		if (t1) {
			T231f12(GE_void(l1));
			T231f14(GE_void(l1));
		} else {
			T231f13(GE_void(l1));
		}
	}
}

/* DS_LINKED_LIST_CURSOR [XM_DOCUMENT_NODE].go_after */
void T231f14(T0* C)
{
	T192f28(GE_void(((T231*)(C))->a3), C);
}

/* XM_LINKED_LIST [XM_DOCUMENT_NODE].cursor_go_after */
void T192f28(T0* C, T0* a1)
{
	T1 t1;
	T1 l1 = 0;
	l1 = (T192f8(C, a1));
	T231f18(a1);
	t1 = ((T1)(!(l1)));
	if (t1) {
		T192f23(C, a1);
	}
}

/* XM_ELEMENT.make_last */
T0* T102c25(T0* a1, T0* a2, T0* a3)
{
	T0* C;
	C = GE_new102(EIF_TRUE);
	((T102*)(C))->a4 = a2;
	((T102*)(C))->a3 = a3;
	((T102*)(C))->a1 = a1;
	((T102*)(C))->a2 = T199c11();
	T102f28(GE_void(a1), C);
	return C;
}

/* XM_CALLBACKS_TO_TREE_FILTER.new_namespace */
T0* T100f8(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T0* t2;
	T0* R = 0;
	R = T191c8(a2, a1);
	t1 = (T190f30(GE_void(((T100*)(C))->a5), R));
	if (t1) {
		t2 = (T190f17(GE_void(((T100*)(C))->a5), R));
		t1 = (T191f5(GE_void(t2), R));
	}
	if (t1) {
		R = (T190f17(GE_void(((T100*)(C))->a5), R));
	} else {
		T190f39(GE_void(((T100*)(C))->a5), R);
	}
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].force_last */
void T190f39(T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T190f37(C);
	T190f40(C, a1);
	t1 = (((((((T190*)(C))->a6) != ((T6)(GE_int32(-1)))))));
	if (t1) {
		T190f41(C, a1, ((T190*)(C))->a6);
	} else {
		l1 = ((T6)((((T190*)(C))->a4)+((T6)(GE_int32(1)))));
		t1 = (T6f6((&l1), ((T190*)(C))->a2));
		if (t1) {
			t2 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t2 = (T190f19(C, t2));
			T190f42(C, t2);
			l2 = (T190f20(C, a1));
		} else {
			l2 = ((T190*)(C))->a13;
		}
		((T190*)(C))->a4 = l1;
		t2 = (T190f22(C, l2));
		T190f43(C, t2, l1);
		T190f44(C, l1, l2);
		T190f41(C, a1, l1);
		((T190*)(C))->a14 = ((T6)((((T190*)(C))->a14)+((T6)(GE_int32(1)))));
	}
}

/* DS_HASH_SET [XM_NAMESPACE].slots_put */
void T190f44(T0* C, T6 a1, T6 a2)
{
	((T63*)(GE_void(((T190*)(C))->a10)))->z2[a2] = (a1);
}

/* DS_HASH_SET [XM_NAMESPACE].clashes_put */
void T190f43(T0* C, T6 a1, T6 a2)
{
	((T63*)(GE_void(((T190*)(C))->a9)))->z2[a2] = (a1);
}

/* DS_HASH_SET [XM_NAMESPACE].slots_item */
T6 T190f22(T0* C, T6 a1)
{
	T6 R = 0;
	R = (((T63*)(GE_void(((T190*)(C))->a10)))->z2[a1]);
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].hash_position */
T6 T190f20(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T6 t2;
	T6 R = 0;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t1 = (((T190*)(C))->a16?((m1 = ((T190*)(C))->a16, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t2 = ((m1, a1, (T6)0));
			R = ((T6)((t2)%(((T190*)(C))->a3)));
		} else {
			t2 = (T191f6(GE_void(a1)));
			R = ((T6)((t2)%(((T190*)(C))->a3)));
		}
	} else {
		R = ((T190*)(C))->a3;
	}
	return R;
}

/* XM_NAMESPACE.hash_code */
T6 T191f6(T0* C)
{
	T6 R = 0;
	R = (((((T0*)(GE_void(((T191*)(C))->a1)))->id==17)?T17f8(((T191*)(C))->a1):T227f18(((T191*)(C))->a1)));
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].resize */
void T190f42(T0* C, T6 a1)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T190f37(C);
	l1 = (T190f21(C, a1));
	t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	T190f45(C, t1);
	l2 = ((T190*)(C))->a3;
	while (1) {
		t2 = ((T1)((l2)<((T6)(GE_int32(0)))));
		if (t2) {
			break;
		}
		T190f44(C, (T6)(GE_int32(-1)), l2);
		l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
	}
	((T190*)(C))->a3 = l1;
	l2 = ((T190*)(C))->a4;
	while (1) {
		t2 = ((T1)((l2)<((T6)(GE_int32(0)))));
		if (t2) {
			break;
		}
		t1 = (T190f26(C, l2));
		t2 = (T6f1(&t1, (T6)(GE_int32(-2))));
		if (t2) {
			t3 = (T190f28(C, l2));
			l3 = (T190f20(C, t3));
			t1 = (T190f22(C, l3));
			T190f43(C, t1, l2);
			T190f44(C, l2, l3);
		}
		l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
	}
	T190f46(C, a1);
	T190f47(C, a1);
	T190f48(C, a1);
	((T190*)(C))->a2 = a1;
	((T190*)(C))->a6 = (T6)(GE_int32(-1));
}

/* DS_HASH_SET [XM_NAMESPACE].clashes_resize */
void T190f48(T0* C, T6 a1)
{
	T0* t1;
	t1 = (T190f29(C));
	((T190*)(C))->a9 = (T65f1(GE_void(t1), ((T190*)(C))->a9, (T6)(GE_int32(-1)), a1));
}

/* DS_HASH_SET [XM_NAMESPACE].special_integer_ */
T0* T190f29(T0* C)
{
	T0* R = 0;
	if (ge127os2341) {
		return ge127ov2341;
	} else {
		ge127os2341 = '\1';
		ge127ov2341 = R;
	}
	R = T65c6();
	ge127ov2341 = R;
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].key_storage_resize */
void T190f47(T0* C, T6 a1)
{
}

/* DS_HASH_SET [XM_NAMESPACE].item_storage_resize */
void T190f46(T0* C, T6 a1)
{
	((T190*)(C))->a8 = (T277f2(GE_void(((T190*)(C))->a7), ((T190*)(C))->a8, a1));
}

/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].aliased_resized_area */
T0* T277f2(T0* C, T0* a1, T6 a2)
{
	T6 t1;
	T1 t2;
	T0* R = 0;
	t1 = (((T278*)(GE_void(a1)))->a2);
	t2 = (T6f1(&a2, t1));
	if (t2) {
		R = (T278f4(GE_void(a1), a2));
	} else {
		R = a1;
	}
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].key_storage_item */
T0* T190f28(T0* C, T6 a1)
{
	T0* R = 0;
	R = (T190f18(C, a1));
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].item_storage_item */
T0* T190f18(T0* C, T6 a1)
{
	T0* R = 0;
	R = (((T278*)(GE_void(((T190*)(C))->a8)))->z2[a1]);
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].clashes_item */
T6 T190f26(T0* C, T6 a1)
{
	T6 R = 0;
	R = (((T63*)(GE_void(((T190*)(C))->a9)))->z2[a1]);
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].slots_resize */
void T190f45(T0* C, T6 a1)
{
	T0* t1;
	t1 = (T190f29(C));
	((T190*)(C))->a10 = (T65f1(GE_void(t1), ((T190*)(C))->a10, (T6)(GE_int32(-1)), a1));
}

/* DS_HASH_SET [XM_NAMESPACE].new_capacity */
T6 T190f19(T0* C, T6 a1)
{
	T6 t1;
	T6 R = 0;
	t1 = (T6)(GE_int32(2));
	R = ((T6)((t1)*(a1)));
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].item_storage_put */
void T190f41(T0* C, T0* a1, T6 a2)
{
	T277f4(GE_void(((T190*)(C))->a7), ((T190*)(C))->a8, a1, a2);
}

/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].force */
void T277f4(T0* C, T0* a1, T0* a2, T6 a3)
{
	T6 t1;
	T1 t2;
	t1 = (((T278*)(GE_void(a1)))->a1);
	t2 = ((T1)((a3)<(t1)));
	if (t2) {
		((T278*)(GE_void(a1)))->z2[a3] = (a2);
	} else {
		t1 = (((T278*)(GE_void(a1)))->a1);
		T278f7(GE_void(a1), a2, t1, a3);
	}
}

/* SPECIAL [XM_NAMESPACE].fill_with */
void T278f7(T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 t1;
	T1 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	l1 = a2;
	t1 = ((T6)((a3)+((T6)(GE_int32(1)))));
	l3 = (T6f10(&(((T278*)(C))->a1), t1));
	l2 = l3;
	while (1) {
		t2 = (((((l1) == (l2)))));
		if (t2) {
			break;
		}
		((T278*)(C))->z2[l1] = (a1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	l1 = l3;
	l2 = ((T6)((a3)+((T6)(GE_int32(1)))));
	while (1) {
		t2 = (((((l1) == (l2)))));
		if (t2) {
			break;
		}
		T278f8(C, a1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
}

/* SPECIAL [XM_NAMESPACE].extend */
void T278f8(T0* C, T0* a1)
{
	T6 t1;
	t1 = ((T278*)(C))->a1;
	((T278*)(C))->a1 = t1 + 1 ;
	((T278*)(C))->z2[t1] = a1;
}

/* DS_HASH_SET [XM_NAMESPACE].search_position */
void T190f40(T0* C, T0* a1)
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
		((T190*)(C))->a6 = (T190f22(C, ((T190*)(C))->a3));
		((T190*)(C))->a13 = ((T190*)(C))->a3;
		((T190*)(C))->a15 = (T6)(GE_int32(-1));
	} else {
		t2 = (T190f25(C));
		t1 = (t2?((m1 = t2, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			l3 = ((T190*)(C))->a6;
			l4 = ((T190*)(C))->a13;
			l2 = ((T190*)(C))->a15;
			t1 = (((((((T190*)(C))->a6) == ((T6)(GE_int32(-1)))))));
			if (!(t1)) {
				t3 = (T190f26(C, ((T190*)(C))->a6));
				t1 = (T6f5(&t3, (T6)(GE_int32(-2))));
			}
			if (!(t1)) {
				t2 = (T190f28(C, ((T190*)(C))->a6));
				t4 = (T275f1(m1, a1, t2));
				t1 = ((T1)(!(t4)));
			}
			if (t1) {
				l4 = (T190f20(C, a1));
				l1 = (T190f22(C, l4));
				l3 = (T6)(GE_int32(-1));
				l2 = (T6)(GE_int32(-1));
				while (1) {
					t1 = (((((l1) == ((T6)(GE_int32(-1)))))));
					if (t1) {
						break;
					}
					t2 = (T190f28(C, l1));
					t1 = (T275f1(m1, a1, t2));
					if (t1) {
						l3 = l1;
						l1 = (T6)(GE_int32(-1));
					} else {
						l2 = l1;
						l1 = (T190f26(C, l1));
					}
				}
			}
			((T190*)(C))->a6 = l3;
			((T190*)(C))->a13 = l4;
			((T190*)(C))->a15 = l2;
		} else {
			t1 = (((((((T190*)(C))->a6) == ((T6)(GE_int32(-1)))))));
			if (!(t1)) {
				t3 = (T190f26(C, ((T190*)(C))->a6));
				t1 = (T6f5(&t3, (T6)(GE_int32(-2))));
			}
			if (!(t1)) {
				t2 = (T190f28(C, ((T190*)(C))->a6));
				t1 = ((a1)!=(t2));
			}
			if (t1) {
				((T190*)(C))->a13 = (T190f20(C, a1));
				l1 = (T190f22(C, ((T190*)(C))->a13));
				((T190*)(C))->a6 = (T6)(GE_int32(-1));
				l2 = (T6)(GE_int32(-1));
				while (1) {
					t1 = (((((l1) == ((T6)(GE_int32(-1)))))));
					if (t1) {
						break;
					}
					t2 = (T190f28(C, l1));
					t1 = ((a1)==(t2));
					if (t1) {
						((T190*)(C))->a6 = l1;
						l1 = (T6)(GE_int32(-1));
					} else {
						l2 = l1;
						l1 = (T190f26(C, l1));
					}
				}
				((T190*)(C))->a15 = l2;
			}
		}
	}
}

/* detachable KL_EQUALITY_TESTER [XM_NAMESPACE].test */
T1 T275f1(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = ((a1)==(a2));
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = ((((a1) == EIF_VOID)?((a2) == EIF_VOID):(((a2) != EIF_VOID)&&T191f4(a1, a2))));
	}
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].key_equality_tester */
T0* T190f25(T0* C)
{
	T0* R = 0;
	R = ((T190*)(C))->a1;
	return R;
}

/* XM_NAMESPACE.same_prefix */
T1 T191f5(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* m1 = 0;
	T0* m2 = 0;
	T1 R = 0;
	t1 = (T191f4(C, a1));
	if (t1) {
		t2 = (((T191*)(GE_void(a1)))->a2);
		t1 = ((((T191*)(C))->a2)==(t2));
		if (!(t1)) {
			t1 = (((T191*)(C))->a2?((m1 = ((T191*)(C))->a2, EIF_TRUE)):EIF_FALSE);
			if (t1) {
				t2 = (((T191*)(GE_void(a1)))->a2);
				t1 = (t2?((m2 = t2, EIF_TRUE)):EIF_FALSE);
			}
			if (t1) {
				t2 = (T191f3(C));
				R = (T75f1(GE_void(t2), m1, m2));
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
T0* T190f17(T0* C, T0* a1)
{
	T0* R = 0;
	T190f40(C, a1);
	R = (T190f18(C, ((T190*)(C))->a6));
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].has */
T1 T190f30(T0* C, T0* a1)
{
	T1 R = 0;
	T190f40(C, a1);
	R = (((((((T190*)(C))->a6) != ((T6)(GE_int32(-1)))))));
	return R;
}

/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
void T187f32(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* m2 = 0;
	T0* t2;
	T0* l1 = 0;
	{
		t1 = (((T187*)(C))->a2?((m1 = ((T187*)(C))->a2, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(7);
		}		t1 = (((T187*)(C))->a3?((m2 = ((T187*)(C))->a3, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t1 = (T187f10(C, m2));
		}
		if (t1) {
			t1 = (T272f5(GE_void(((T187*)(C))->a4), m2));
			if (t1) {
				t2 = (T272f2(GE_void(((T187*)(C))->a4), m2));
				T99x6086T0T0T0(GE_void(((T187*)(C))->a1), t2, m2, m1);
				T187f39(C);
			} else {
				t2 = (T187f14(C));
				l1 = (T75f7(GE_void(t2), ge1723ov8099));
				t2 = (T187f14(C));
				l1 = (T75f5(GE_void(t2), l1, GE_ms8(" in tag <", 9)));
				t2 = (T187f14(C));
				l1 = (T75f5(GE_void(t2), l1, m2));
				t2 = (T187f14(C));
				l1 = (T75f5(GE_void(t2), l1, GE_ms8(":", 1)));
				t2 = (T187f14(C));
				l1 = (T75f5(GE_void(t2), l1, m1));
				t2 = (T187f14(C));
				l1 = (T75f5(GE_void(t2), l1, GE_ms8(">", 1)));
				T187f36(C, l1);
			}
		} else {
			t2 = (T272f3(GE_void(((T187*)(C))->a4)));
			T99x6086T0T0T0(GE_void(((T187*)(C))->a1), t2, ((T187*)(C))->a3, m1);
			T187f39(C);
		}
		T187f32p1(C);
	}
}

/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
void T187f32p1(T0* C)
{
	T99x6088(GE_void(((T187*)(C))->a1));
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve_default */
T0* T272f3(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T272f7(C));
	R = (T272f2(C, t1));
	return R;
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.default_pseudo_prefix */
unsigned char ge1724os8724 = '\0';
T0* ge1724ov8724;
T0* T272f7(T0* C)
{
	T0* R = 0;
	if (ge1724os8724) {
		return ge1724ov8724;
	} else {
		ge1724os8724 = '\1';
		ge1724ov8724 = R;
	}
	R = T17c37();
	ge1724ov8724 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER.string_ */
T0* T187f14(T0* C)
{
	T0* R = 0;
	if (ge128os1922) {
		return ge128ov1922;
	} else {
		ge128os1922 = '\1';
		ge128ov1922 = R;
	}
	R = T75c19();
	ge128ov1922 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER.on_delayed_attributes */
void T187f39(T0* C)
{
	T1 t1;
	T0* t2;
	T0* t3;
	T0* t4;
	T0* l1 = 0;
	while (1) {
		t1 = (T187f12(C));
		if (t1) {
			break;
		}
		l1 = (T274f5(GE_void(((T187*)(C))->a6)));
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t1 = (T187f10(C, l1));
		}
		if (t1) {
			t1 = (T272f5(GE_void(((T187*)(C))->a4), l1));
			if (t1) {
				t2 = (T272f2(GE_void(((T187*)(C))->a4), l1));
				t3 = (T274f5(GE_void(((T187*)(C))->a7)));
				t4 = (T274f5(GE_void(((T187*)(C))->a8)));
				T99x6087T0T0T0T0(GE_void(((T187*)(C))->a1), t2, l1, t3, t4);
			} else {
				t1 = (T187f16(C, l1));
				if (t1) {
					t2 = (T187f17(C));
					t3 = (T274f5(GE_void(((T187*)(C))->a7)));
					t4 = (T274f5(GE_void(((T187*)(C))->a8)));
					T99x6087T0T0T0T0(GE_void(((T187*)(C))->a1), t2, l1, t3, t4);
				} else {
					t1 = (T187f9(C, l1));
					if (t1) {
						t2 = (T187f18(C));
						t3 = (T274f5(GE_void(((T187*)(C))->a7)));
						t4 = (T274f5(GE_void(((T187*)(C))->a8)));
						T99x6087T0T0T0T0(GE_void(((T187*)(C))->a1), t2, l1, t3, t4);
					} else {
						T187f36(C, ge1723ov8099);
					}
				}
			}
		} else {
			t2 = (T187f19(C));
			t3 = (T274f5(GE_void(((T187*)(C))->a7)));
			t4 = (T274f5(GE_void(((T187*)(C))->a8)));
			T99x6087T0T0T0T0(GE_void(((T187*)(C))->a1), t2, l1, t3, t4);
		}
		T187f43(C);
	}
}

/* XM_NAMESPACE_RESOLVER.attributes_remove */
void T187f43(T0* C)
{
	T274f8(GE_void(((T187*)(C))->a6));
	T274f8(GE_void(((T187*)(C))->a7));
	T274f8(GE_void(((T187*)(C))->a8));
}

/* DS_LINKED_QUEUE [STRING_8].remove */
void T274f8(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	t1 = (((((((T274*)(C))->a2) == ((T6)(GE_int32(1)))))));
	if (t1) {
		T274f9(C);
	} else {
		{
			t1 = (((T274*)(C))->a1?((m1 = ((T274*)(C))->a1, EIF_TRUE)):EIF_FALSE);
			if (!(t1)) {
				GE_raise(7);
			}			((T274*)(C))->a1 = (((T377*)(m1))->a2);
			((T274*)(C))->a2 = ((T6)((((T274*)(C))->a2)-((T6)(GE_int32(1)))));
		}
	}
}

/* DS_LINKED_QUEUE [STRING_8].wipe_out */
void T274f9(T0* C)
{
	((T274*)(C))->a1 = EIF_VOID;
	((T274*)(C))->a3 = EIF_VOID;
	((T274*)(C))->a2 = (T6)(GE_int32(0));
}

/* XM_NAMESPACE_RESOLVER.unprefixed_attribute_namespace */
T0* T187f19(T0* C)
{
	T0* R = 0;
	R = (T187f24(C));
	return R;
}

/* XM_NAMESPACE_RESOLVER.default_namespace */
unsigned char ge1691os7712 = '\0';
T0* ge1691ov7712;
T0* T187f24(T0* C)
{
	T0* R = 0;
	if (ge1691os7712) {
		return ge1691ov7712;
	} else {
		ge1691os7712 = '\1';
		ge1691ov7712 = R;
	}
	R = GE_ms8("", 0);
	ge1691ov7712 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER.xmlns_namespace */
unsigned char ge1691os7720 = '\0';
T0* ge1691ov7720;
T0* T187f18(T0* C)
{
	T0* R = 0;
	if (ge1691os7720) {
		return ge1691ov7720;
	} else {
		ge1691os7720 = '\1';
		ge1691ov7720 = R;
	}
	R = GE_ms8("http://www.w3.org/2000/xmlns/", 29);
	ge1691ov7720 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER.is_xmlns */
T1 T187f9(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T187f21(C));
		R = (T187f22(C, t2, a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_NAMESPACE_RESOLVER.same_string */
T1 T187f22(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 R = 0;
	t1 = (T187f25(C));
	R = (T59f1(GE_void(t1), a1, a2));
	return R;
}

/* XM_NAMESPACE_RESOLVER.string_equality_tester */
T0* T187f25(T0* C)
{
	T0* R = 0;
	if (ge222os2343) {
		return ge222ov2343;
	} else {
		ge222os2343 = '\1';
		ge222ov2343 = R;
	}
	R = T59c3();
	ge222ov2343 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER.xmlns */
unsigned char ge1691os7713 = '\0';
T0* ge1691ov7713;
T0* T187f21(T0* C)
{
	T0* R = 0;
	if (ge1691os7713) {
		return ge1691ov7713;
	} else {
		ge1691os7713 = '\1';
		ge1691ov7713 = R;
	}
	R = GE_ms8("xmlns", 5);
	ge1691ov7713 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER.xml_prefix_namespace */
unsigned char ge1691os7719 = '\0';
T0* ge1691ov7719;
T0* T187f17(T0* C)
{
	T0* R = 0;
	if (ge1691os7719) {
		return ge1691ov7719;
	} else {
		ge1691os7719 = '\1';
		ge1691ov7719 = R;
	}
	R = GE_ms8("http://www.w3.org/XML/1998/namespace", 36);
	ge1691ov7719 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER.is_xml */
T1 T187f16(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T187f23(C));
		R = (T187f22(C, t2, a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_NAMESPACE_RESOLVER.xml_prefix */
unsigned char ge1691os7714 = '\0';
T0* ge1691ov7714;
T0* T187f23(T0* C)
{
	T0* R = 0;
	if (ge1691os7714) {
		return ge1691ov7714;
	} else {
		ge1691os7714 = '\1';
		ge1691ov7714 = R;
	}
	R = GE_ms8("xml", 3);
	ge1691ov7714 = R;
	return R;
}

/* DS_LINKED_QUEUE [STRING_8].item */
T0* T274f5(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* R = 0;
	{
		t1 = (((T274*)(C))->a1?((m1 = ((T274*)(C))->a1, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(7);
		}		R = (((T377*)(m1))->a1);
	}
	return R;
}

/* XM_NAMESPACE_RESOLVER.attributes_is_empty */
T1 T187f12(T0* C)
{
	T1 R = 0;
	R = (T274f4(GE_void(((T187*)(C))->a6)));
	return R;
}

/* DS_LINKED_QUEUE [STRING_8].is_empty */
T1 T274f4(T0* C)
{
	T1 R = 0;
	R = (((((((T274*)(C))->a2) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve */
T0* T272f2(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* R = 0;
	T0* l1 = 0;
	R = (T272f6(C));
	l1 = (T375f6(GE_void(((T272*)(C))->a1)));
	T376f9(GE_void(l1));
	while (1) {
		t1 = (((T376*)(GE_void(l1)))->a1);
		if (t1) {
			break;
		}
		t2 = (T376f6(GE_void(l1)));
		t1 = (T83f21(GE_void(t2), a1));
		if (t1) {
			t2 = (T376f6(GE_void(l1)));
			R = (T83f22(GE_void(t2), a1));
			T376f10(GE_void(l1));
		} else {
			T376f11(GE_void(l1));
		}
	}
	return R;
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].back */
void T376f11(T0* C)
{
	T375f18(GE_void(((T376*)(C))->a4), C);
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_back */
void T375f18(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (((T376*)(a1))->a2);
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		l3 = (((T500*)(m1))->a2);
	} else {
		l1 = EIF_TRUE;
		l3 = ((T375*)(C))->a2;
	}
	l2 = ((l3)==(EIF_VOID));
	T376f14(a1, l3, l2, EIF_FALSE);
	if (l2) {
		t2 = ((T1)(!(l1)));
		if (t2) {
			T375f20(C, a1);
		}
	} else {
		if (l1) {
			T375f19(C, a1);
		}
	}
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].add_traversing_cursor */
void T375f19(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	t1 = ((a1)!=(((T375*)(C))->a4));
	if (t1) {
		t2 = (((T376*)(GE_void(((T375*)(C))->a4)))->a3);
		T376f13(a1, t2);
		T376f13(GE_void(((T375*)(C))->a4), a1);
	}
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_next_cursor */
void T376f13(T0* C, T0* a1)
{
	((T376*)(C))->a3 = a1;
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_traversing_cursor */
void T375f20(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* l1 = 0;
	T0* l2 = 0;
	t1 = ((a1)!=(((T375*)(C))->a4));
	if (t1) {
		l2 = ((T375*)(C))->a4;
		l1 = (((T376*)(GE_void(l2)))->a3);
		while (1) {
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
			if (t1) {
				break;
			}
			l2 = l1;
			l1 = (((T376*)(GE_void(l1)))->a3);
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T376*)(a1))->a3);
			T376f13(GE_void(l2), t2);
			T376f13(a1, EIF_VOID);
		}
	}
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set */
void T376f14(T0* C, T0* a1, T1 a2, T1 a3)
{
	((T376*)(C))->a2 = a1;
	((T376*)(C))->a1 = a2;
	((T376*)(C))->a5 = a3;
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].go_before */
void T376f10(T0* C)
{
	T375f17(GE_void(((T376*)(C))->a4), C);
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_go_before */
void T375f17(T0* C, T0* a1)
{
	T1 t1;
	T1 l1 = 0;
	l1 = (T375f7(C, a1));
	T376f15(a1);
	t1 = ((T1)(!(l1)));
	if (t1) {
		T375f20(C, a1);
	}
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_before */
void T376f15(T0* C)
{
	((T376*)(C))->a2 = EIF_VOID;
	((T376*)(C))->a1 = EIF_TRUE;
	((T376*)(C))->a5 = EIF_FALSE;
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_off */
T1 T375f7(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T376f7(a1));
	return R;
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].off */
T1 T376f7(T0* C)
{
	T1 R = 0;
	R = ((((T376*)(C))->a2)==(EIF_VOID));
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].item */
T0* T83f22(T0* C, T0* a1)
{
	T0* R = 0;
	T83f57(C, a1);
	R = (T83f25(C, ((T83*)(C))->a8));
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].item_storage_item */
T0* T83f25(T0* C, T6 a1)
{
	T0* R = 0;
	R = (((T32*)(GE_void(((T83*)(C))->a10)))->z2[a1]);
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].has */
T1 T83f21(T0* C, T0* a1)
{
	T1 R = 0;
	T83f57(C, a1);
	R = (((((((T83*)(C))->a8) != ((T6)(GE_int32(-1)))))));
	return R;
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].item */
T0* T376f6(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* R = 0;
	{
		t1 = (((T376*)(C))->a2?((m1 = ((T376*)(C))->a2, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(7);
		}		R = (((T500*)(m1))->a1);
	}
	return R;
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].finish */
void T376f9(T0* C)
{
	T375f16(GE_void(((T376*)(C))->a4), C);
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_finish */
void T375f16(T0* C, T0* a1)
{
	T1 t1;
	T1 l1 = 0;
	T1 l2 = 0;
	l1 = (T375f7(C, a1));
	l2 = ((((T375*)(C))->a2)==(EIF_VOID));
	T376f14(a1, ((T375*)(C))->a2, l2, EIF_FALSE);
	t1 = ((T1)(!(l2)));
	if (t1) {
		t1 = (l1);
	}
	if (t1) {
		T375f19(C, a1);
	}
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.default_namespace */
unsigned char ge1724os8725 = '\0';
T0* ge1724ov8725;
T0* T272f6(T0* C)
{
	T0* R = 0;
	if (ge1724os8725) {
		return ge1724ov8725;
	} else {
		ge1724os8725 = '\1';
		ge1724ov8725 = R;
	}
	R = T17c37();
	ge1724ov8725 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.has */
T1 T272f5(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T0* l1 = 0;
	l1 = (T375f6(GE_void(((T272*)(C))->a1)));
	T376f9(GE_void(l1));
	while (1) {
		t1 = (((T376*)(GE_void(l1)))->a1);
		if (t1) {
			break;
		}
		t2 = (T376f6(GE_void(l1)));
		R = (T83f21(GE_void(t2), a1));
		if (R) {
			T376f10(GE_void(l1));
		} else {
			T376f11(GE_void(l1));
		}
	}
	return R;
}

/* XM_NAMESPACE_RESOLVER.has_prefix */
T1 T187f10(T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(a1)))->id==17)?((T17*)(a1))->a2:((T227*)(a1))->a1));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_CALLBACKS_NULL.on_start_tag_finish */
void T147f7(T0* C)
{
}

/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
void T103f15(T0* C)
{
	T1 t1;
	t1 = ((T1)(!(((T103*)(C))->a1)));
	if (t1) {
		T103f15p1(C);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
void T103f15p1(T0* C)
{
	T99x6088(GE_void(((T103*)(C))->a3));
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag_finish */
void T100f20(T0* C)
{
	T99x6088(GE_void(((T100*)(C))->a6));
}

/* XM_NAMESPACE_RESOLVER.on_end_tag */
void T187f33(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T0* t2;
	t1 = ((a2)!=(EIF_VOID));
	if (t1) {
		t1 = (T187f10(C, a2));
	}
	if (t1) {
		t2 = (T272f2(GE_void(((T187*)(C))->a4), a2));
		T187f33p1(C, t2, a2, a3);
	} else {
		t2 = (T272f3(GE_void(((T187*)(C))->a4)));
		T187f33p1(C, t2, a2, a3);
	}
	T272f11(GE_void(((T187*)(C))->a4));
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.pop */
void T272f11(T0* C)
{
	T6 t1;
	T1 t2;
	t1 = (((T375*)(GE_void(((T272*)(C))->a1)))->a1);
	t2 = (T6f1(&t1, (T6)(GE_int32(0))));
	if (t2) {
		T375f9(GE_void(((T272*)(C))->a1));
	}
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_last */
void T375f9(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* t2;
	T0* m2 = 0;
	t1 = (((((((T375*)(C))->a1) == ((T6)(GE_int32(1)))))));
	if (t1) {
		T375f12(C);
	} else {
		{
			t1 = (((T375*)(C))->a2?((m1 = ((T375*)(C))->a2, EIF_TRUE)):EIF_FALSE);
			if (t1) {
				t2 = (((T500*)(m1))->a2);
				t1 = (t2?((m2 = t2, EIF_TRUE)):EIF_FALSE);
			}
			if (!(t1)) {
				GE_raise(7);
			}			T375f13(C);
			T375f14(C, m2);
			((T375*)(C))->a1 = ((T6)((((T375*)(C))->a1)-((T6)(GE_int32(1)))));
		}
	}
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].set_last_cell */
void T375f14(T0* C, T0* a1)
{
	T500f7(GE_void(a1));
	((T375*)(C))->a2 = a1;
}

/* detachable DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].forget_right */
void T500f7(T0* C)
{
	((T500*)(C))->a3 = EIF_VOID;
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_last_cursors_after */
void T375f13(T0* C)
{
	T0* t1;
	T1 t2;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	l1 = ((T375*)(C))->a4;
	l4 = ((T375*)(C))->a2;
	t1 = (((T376*)(GE_void(l1)))->a2);
	t2 = ((t1)==(l4));
	if (t2) {
		T376f12(GE_void(l1));
	}
	l3 = l1;
	l1 = (((T376*)(GE_void(l1)))->a3);
	while (1) {
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			break;
		}
		t1 = (((T376*)(GE_void(l1)))->a2);
		t2 = ((t1)==(l4));
		if (t2) {
			T376f12(GE_void(l1));
			l2 = (((T376*)(GE_void(l1)))->a3);
			T376f13(GE_void(l3), l2);
			T376f13(GE_void(l1), EIF_VOID);
			l1 = l2;
		} else {
			l3 = l1;
			l1 = (((T376*)(GE_void(l1)))->a3);
		}
	}
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_after */
void T376f12(T0* C)
{
	((T376*)(C))->a2 = EIF_VOID;
	((T376*)(C))->a1 = EIF_FALSE;
	((T376*)(C))->a5 = EIF_TRUE;
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].wipe_out */
void T375f12(T0* C)
{
	T375f15(C);
	((T375*)(C))->a3 = EIF_VOID;
	((T375*)(C))->a2 = EIF_VOID;
	((T375*)(C))->a1 = (T6)(GE_int32(0));
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_all_cursors_after */
void T375f15(T0* C)
{
	T1 t1;
	T0* l1 = 0;
	T0* l2 = 0;
	l1 = ((T375*)(C))->a4;
	while (1) {
		t1 = ((l1)==(EIF_VOID));
		if (t1) {
			break;
		}
		T376f12(GE_void(l1));
		l2 = (((T376*)(GE_void(l1)))->a3);
		T376f13(GE_void(l1), EIF_VOID);
		l1 = l2;
	}
}

/* XM_NAMESPACE_RESOLVER.on_end_tag */
void T187f33p1(T0* C, T0* a1, T0* a2, T0* a3)
{
	T99x6089T0T0T0(GE_void(((T187*)(C))->a1), a1, a2, a3);
}

/* XM_CALLBACKS_NULL.on_end_tag */
void T147f8(T0* C, T0* a1, T0* a2, T0* a3)
{
}

/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
void T103f16(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	t1 = ((T1)(!(((T103*)(C))->a1)));
	if (t1) {
		T103f16p1(C, a1, a2, a3);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
void T103f16p1(T0* C, T0* a1, T0* a2, T0* a3)
{
	T99x6089T0T0T0(GE_void(((T103*)(C))->a3), a1, a2, a3);
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_end_tag */
void T100f21(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T0* m1 = 0;
	T0* t2;
	T0* m2 = 0;
	{
		t1 = (((T100*)(C))->a4?((m1 = ((T100*)(C))->a4, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(7);
		}		t2 = (((T102*)(m1))->a1);
		t1 = (t2?((m2 = t2, EIF_TRUE)):EIF_FALSE);
		t1 = ((T1)(!(t1)));
		if (!(t1)) {
			t1 = (((((T0*)(m2))->id==101)?T101f8(m2):T102f16(m2)));
		}
		if (t1) {
			((T100*)(C))->a4 = EIF_VOID;
		} else {
			((T100*)(C))->a4 = (T102f15(m1));
		}
	}
}

/* XM_ELEMENT.parent_element */
T0* T102f15(T0* C)
{
	T1 t1;
	T0* m2 = 0;
	T0* R = 0;
	{
		t1 = T102f15ot1(((T102*)(C))->a1, &m2);
		if (!(t1)) {
			GE_raise(7);
		}		R = m2;
	}
	return R;
}

T1 T102f15ot1(T0* a1, T0** a2)
{
	if ((a1)==EIF_VOID) {
		return EIF_FALSE;
	} else {
		switch (((T0*)(a1))->id) {
		case 102:
			*a2 = a1;
			return EIF_TRUE;
		default:
			return EIF_FALSE;
		}
	}
}

/* XM_ELEMENT.is_root_node */
T1 T102f16(T0* C)
{
	T1 R = 0;
	R = ((((T102*)(C))->a1)==(EIF_VOID));
	return R;
}

/* XM_DOCUMENT.is_root_node */
T1 T101f8(T0* C)
{
	T0* t1;
	T1 R = 0;
	t1 = (T101f9(C));
	R = (EIF_TRUE);
	return R;
}

/* XM_DOCUMENT.parent */
T0* T101f9(T0* C)
{
	T0* R = 0;
	return R;
}

/* XM_NAMESPACE_RESOLVER.on_error */
void T187f36(T0* C, T0* a1)
{
	T99x6083T0(GE_void(((T187*)(C))->a1), a1);
}

/* XM_CALLBACKS_NULL.on_error */
void T147f11(T0* C, T0* a1)
{
}

/* XM_STOP_ON_ERROR_FILTER.on_error */
void T103f17(T0* C, T0* a1)
{
	((T103*)(C))->a1 = EIF_TRUE;
	((T103*)(C))->a2 = a1;
	T103f17p1(C, a1);
}

/* XM_STOP_ON_ERROR_FILTER.on_error */
void T103f17p1(T0* C, T0* a1)
{
	T99x6083T0(GE_void(((T103*)(C))->a3), a1);
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_error */
void T100f22(T0* C, T0* a1)
{
	T99x6083T0(GE_void(((T100*)(C))->a6), a1);
}

/* XM_NAMESPACE_RESOLVER.on_attribute */
void T187f35(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 t1;
	t1 = (T187f10(C, a2));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t1 = (T187f9(C, a3));
	}
	if (t1) {
		T272f13(GE_void(((T187*)(C))->a4), a4);
		if (((T187*)(C))->a5) {
			T187f40(C, a2, a3, a4);
		}
	} else {
		t1 = ((a2)!=(EIF_VOID));
		if (t1) {
			t1 = (T187f9(C, a2));
		}
		if (t1) {
			t1 = (T272f4(GE_void(((T187*)(C))->a4), a2));
			if (t1) {
				T187f36(C, ge1723ov8100);
			} else {
				T272f14(GE_void(((T187*)(C))->a4), a4, a3);
			}
			if (((T187*)(C))->a5) {
				T187f40(C, a2, a3, a4);
			}
		} else {
			T187f40(C, a2, a3, a4);
		}
	}
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.add */
void T272f14(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	t1 = (T375f5(GE_void(((T272*)(C))->a1)));
	T83f54(GE_void(t1), a1, a2);
}

/* DS_HASH_TABLE [STRING_8, STRING_8].force_new */
void T83f54(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T6 t2;
	T6 t3;
	T6 l1 = 0;
	T6 l2 = 0;
	T83f50(C);
	t1 = (((((((T83*)(C))->a18) == (((T83*)(C))->a4)))));
	if (t1) {
		t2 = ((T6)((((T83*)(C))->a18)+((T6)(GE_int32(1)))));
		t2 = (T83f27(C, t2));
		T83f59(C, t2);
	}
	l1 = ((T83*)(C))->a7;
	t1 = (((((l1) == ((T6)(GE_int32(-1)))))));
	if (t1) {
		((T83*)(C))->a6 = ((T6)((((T83*)(C))->a6)+((T6)(GE_int32(1)))));
		l1 = ((T83*)(C))->a6;
	} else {
		t2 = (T6)(GE_int32(-3));
		t3 = (T83f33(C, l1));
		((T83*)(C))->a7 = ((T6)((t2)-(t3)));
	}
	l2 = (T83f28(C, a2));
	t2 = (T83f30(C, l2));
	T83f60(C, t2, l1);
	T83f61(C, l1, l2);
	T83f58(C, a1, l1);
	T83f62(C, a2, l1);
	((T83*)(C))->a18 = ((T6)((((T83*)(C))->a18)+((T6)(GE_int32(1)))));
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].last */
T0* T375f5(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* R = 0;
	{
		t1 = (((T375*)(C))->a2?((m1 = ((T375*)(C))->a2, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(7);
		}		R = (((T500*)(m1))->a1);
	}
	return R;
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.shallow_has */
T1 T272f4(T0* C, T0* a1)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T1 R = 0;
	t1 = (((T375*)(GE_void(((T272*)(C))->a1)))->a1);
	t2 = (T6f1(&t1, (T6)(GE_int32(0))));
	if (t2) {
		t3 = (T375f5(GE_void(((T272*)(C))->a1)));
		R = (T83f21(GE_void(t3), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_NAMESPACE_RESOLVER.attributes_force */
void T187f40(T0* C, T0* a1, T0* a2, T0* a3)
{
	T274f7(GE_void(((T187*)(C))->a6), a1);
	T274f7(GE_void(((T187*)(C))->a7), a2);
	T274f7(GE_void(((T187*)(C))->a8), a3);
}

/* DS_LINKED_QUEUE [STRING_8].force */
void T274f7(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T0* l1 = 0;
	l1 = T377c3(a1);
	t1 = (((T274*)(C))->a3?((m1 = ((T274*)(C))->a3, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		T377f4(m1, l1);
		((T274*)(C))->a3 = l1;
		((T274*)(C))->a2 = ((T6)((((T274*)(C))->a2)+((T6)(GE_int32(1)))));
	} else {
		((T274*)(C))->a1 = l1;
		((T274*)(C))->a3 = l1;
		((T274*)(C))->a2 = (T6)(GE_int32(1));
	}
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.add_default */
void T272f13(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T272f7(C));
	T272f14(C, a1, t1);
}

/* XM_CALLBACKS_NULL.on_attribute */
void T147f10(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
}

/* XM_STOP_ON_ERROR_FILTER.on_attribute */
void T103f18(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 t1;
	t1 = ((T1)(!(((T103*)(C))->a1)));
	if (t1) {
		T103f18p1(C, a1, a2, a3, a4);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_attribute */
void T103f18p1(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T99x6087T0T0T0T0(GE_void(((T103*)(C))->a3), a1, a2, a3, a4);
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_attribute */
void T100f23(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 t1;
	T0* m1 = 0;
	T0* m2 = 0;
	T0* t2;
	T0* l1 = 0;
	{
		t1 = (a1?((m1 = a1, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(7);
		}		t1 = (((T100*)(C))->a4?((m2 = ((T100*)(C))->a4, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(7);
		}		t2 = (T100f8(C, m1, a2));
		l1 = T219c5(a3, t2, a4, m2);
		T100f24(C, l1);
	}
}

/* XM_ATTRIBUTE.make_last */
T0* T219c5(T0* a1, T0* a2, T0* a3, T0* a4)
{
	T0* C;
	C = GE_new219(EIF_TRUE);
	((T219*)(C))->a1 = a1;
	((T219*)(C))->a2 = a2;
	((T219*)(C))->a3 = a3;
	((T219*)(C))->a4 = a4;
	T102f28(GE_void(a4), C);
	return C;
}

/* XM_NAMESPACE_RESOLVER.on_xml_declaration */
void T187f44(T0* C, T0* a1, T0* a2, T1 a3)
{
	T99x6082T0T0T1(GE_void(((T187*)(C))->a1), a1, a2, a3);
}

/* XM_CALLBACKS_NULL.on_xml_declaration */
void T147f12(T0* C, T0* a1, T0* a2, T1 a3)
{
}

/* XM_STOP_ON_ERROR_FILTER.on_xml_declaration */
void T103f19(T0* C, T0* a1, T0* a2, T1 a3)
{
	T99x6082T0T0T1(GE_void(((T103*)(C))->a3), a1, a2, a3);
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_xml_declaration */
void T100f25(T0* C, T0* a1, T0* a2, T1 a3)
{
	T99x6082T0T0T1(GE_void(((T100*)(C))->a6), a1, a2, a3);
}

/* XM_NAMESPACE_RESOLVER.set_next */
void T187f41(T0* C, T0* a1)
{
	((T187*)(C))->a1 = a1;
}

/* XM_STOP_ON_ERROR_FILTER.set_next */
void T103f8(T0* C, T0* a1)
{
	((T103*)(C))->a3 = a1;
}

/* XM_CALLBACKS_TO_TREE_FILTER.set_next */
void T100f13(T0* C, T0* a1)
{
	((T100*)(C))->a6 = a1;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_start */
void T83f55(T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 l3 = 0;
	t1 = (T83f34(C));
	if (t1) {
		T64f13(a1);
	} else {
		l3 = (T83f35(C, a1));
		l1 = (T6)(GE_int32(0));
		l2 = ((T83*)(C))->a6;
		while (1) {
			t1 = (T6f1((&l1), l2));
			if (!(t1)) {
				t2 = (T83f33(C, l1));
				t1 = (T6f1(&t2, (T6)(GE_int32(-2))));
			}
			if (t1) {
				break;
			}
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1((&l1), l2));
		if (t1) {
			T64f13(a1);
			t1 = ((T1)(!(l3)));
			if (t1) {
				T83f63(C, a1);
			}
		} else {
			T64f14(a1, l1);
			if (l3) {
				T83f64(C, a1);
			}
		}
	}
}

/* DS_HASH_TABLE [STRING_8, STRING_8].add_traversing_cursor */
void T83f64(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	t1 = ((a1)!=(((T83*)(C))->a16));
	if (t1) {
		t2 = (((T64*)(GE_void(((T83*)(C))->a16)))->a3);
		T64f15(a1, t2);
		T64f15(GE_void(((T83*)(C))->a16), a1);
	}
}

/* DS_HASH_TABLE [STRING_8, STRING_8].remove_traversing_cursor */
void T83f63(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* l1 = 0;
	T0* l2 = 0;
	t1 = ((a1)!=(((T83*)(C))->a16));
	if (t1) {
		l2 = ((T83*)(C))->a16;
		l1 = (((T64*)(GE_void(l2)))->a3);
		while (1) {
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
			if (t1) {
				break;
			}
			l2 = l1;
			l1 = (((T64*)(GE_void(l1)))->a3);
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T64*)(a1))->a3);
			T64f15(GE_void(l2), t2);
			T64f15(a1, EIF_VOID);
		}
	}
}

/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_off */
T1 T83f35(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T64f9(a1));
	return R;
}

/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].off */
T1 T64f9(T0* C)
{
	T1 R = 0;
	R = ((T1)((((T64*)(C))->a2)<((T6)(GE_int32(0)))));
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].is_empty */
T1 T83f34(T0* C)
{
	T1 R = 0;
	R = (((((((T83*)(C))->a18) == ((T6)(GE_int32(0)))))));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.cursor_start */
void T34f70(T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 l3 = 0;
	t1 = (T34f39(C));
	if (t1) {
		T64f13(GE_void(a1));
	} else {
		l3 = (T34f40(C, a1));
		l1 = (T6)(GE_int32(0));
		l2 = ((T34*)(C))->a6;
		while (1) {
			t1 = (T6f1((&l1), l2));
			if (!(t1)) {
				t2 = (T34f26(C, l1));
				t1 = (T6f1(&t2, (T6)(GE_int32(-2))));
			}
			if (t1) {
				break;
			}
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1((&l1), l2));
		if (t1) {
			T64f13(GE_void(a1));
			t1 = ((T1)(!(l3)));
			if (t1) {
				T34f72(C, a1);
			}
		} else {
			T64f14(GE_void(a1), l1);
			if (l3) {
				T34f73(C, a1);
			}
		}
	}
}

/* GEANT_ARGUMENT_VARIABLES.add_traversing_cursor */
void T34f73(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	t1 = ((a1)!=(((T34*)(C))->a19));
	if (t1) {
		t2 = (((T64*)(GE_void(((T34*)(C))->a19)))->a3);
		T64f15(GE_void(a1), t2);
		T64f15(GE_void(((T34*)(C))->a19), a1);
	}
}

/* GEANT_ARGUMENT_VARIABLES.remove_traversing_cursor */
void T34f72(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* l1 = 0;
	T0* l2 = 0;
	t1 = ((a1)!=(((T34*)(C))->a19));
	if (t1) {
		l2 = ((T34*)(C))->a19;
		l1 = (((T64*)(GE_void(l2)))->a3);
		while (1) {
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
			if (t1) {
				break;
			}
			l2 = l1;
			l1 = (((T64*)(GE_void(l1)))->a3);
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T64*)(GE_void(a1)))->a3);
			T64f15(GE_void(l2), t2);
			T64f15(GE_void(a1), EIF_VOID);
		}
	}
}

/* GEANT_ARGUMENT_VARIABLES.cursor_off */
T1 T34f40(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T64f9(GE_void(a1)));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.is_empty */
T1 T34f39(T0* C)
{
	T1 R = 0;
	R = (((((((T34*)(C))->a2) == ((T6)(GE_int32(0)))))));
	return R;
}

/* GEANT_VARIABLES.cursor_start */
void T29f71(T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 l3 = 0;
	t1 = (T29f39(C));
	if (t1) {
		T64f13(GE_void(a1));
	} else {
		l3 = (T29f40(C, a1));
		l1 = (T6)(GE_int32(0));
		l2 = ((T29*)(C))->a6;
		while (1) {
			t1 = (T6f1((&l1), l2));
			if (!(t1)) {
				t2 = (T29f26(C, l1));
				t1 = (T6f1(&t2, (T6)(GE_int32(-2))));
			}
			if (t1) {
				break;
			}
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1((&l1), l2));
		if (t1) {
			T64f13(GE_void(a1));
			t1 = ((T1)(!(l3)));
			if (t1) {
				T29f73(C, a1);
			}
		} else {
			T64f14(GE_void(a1), l1);
			if (l3) {
				T29f74(C, a1);
			}
		}
	}
}

/* GEANT_VARIABLES.add_traversing_cursor */
void T29f74(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	t1 = ((a1)!=(((T29*)(C))->a19));
	if (t1) {
		t2 = (((T64*)(GE_void(((T29*)(C))->a19)))->a3);
		T64f15(GE_void(a1), t2);
		T64f15(GE_void(((T29*)(C))->a19), a1);
	}
}

/* GEANT_VARIABLES.remove_traversing_cursor */
void T29f73(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* l1 = 0;
	T0* l2 = 0;
	t1 = ((a1)!=(((T29*)(C))->a19));
	if (t1) {
		l2 = ((T29*)(C))->a19;
		l1 = (((T64*)(GE_void(l2)))->a3);
		while (1) {
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
			if (t1) {
				break;
			}
			l2 = l1;
			l1 = (((T64*)(GE_void(l1)))->a3);
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T64*)(GE_void(a1)))->a3);
			T64f15(GE_void(l2), t2);
			T64f15(GE_void(a1), EIF_VOID);
		}
	}
}

/* GEANT_VARIABLES.cursor_off */
T1 T29f40(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T64f9(GE_void(a1)));
	return R;
}

/* GEANT_VARIABLES.is_empty */
T1 T29f39(T0* C)
{
	T1 R = 0;
	R = (((((((T29*)(C))->a2) == ((T6)(GE_int32(0)))))));
	return R;
}

/* GEANT_PROJECT_VARIABLES.cursor_start */
void T25f82(T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 l3 = 0;
	t1 = (T25f51(C));
	if (t1) {
		T64f13(GE_void(a1));
	} else {
		l3 = (T25f52(C, a1));
		l1 = (T6)(GE_int32(0));
		l2 = ((T25*)(C))->a8;
		while (1) {
			t1 = (T6f1((&l1), l2));
			if (!(t1)) {
				t2 = (T25f21(C, l1));
				t1 = (T6f1(&t2, (T6)(GE_int32(-2))));
			}
			if (t1) {
				break;
			}
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1((&l1), l2));
		if (t1) {
			T64f13(GE_void(a1));
			t1 = ((T1)(!(l3)));
			if (t1) {
				T25f84(C, a1);
			}
		} else {
			T64f14(GE_void(a1), l1);
			if (l3) {
				T25f85(C, a1);
			}
		}
	}
}

/* GEANT_PROJECT_VARIABLES.add_traversing_cursor */
void T25f85(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	t1 = ((a1)!=(((T25*)(C))->a19));
	if (t1) {
		t2 = (((T64*)(GE_void(((T25*)(C))->a19)))->a3);
		T64f15(GE_void(a1), t2);
		T64f15(GE_void(((T25*)(C))->a19), a1);
	}
}

/* GEANT_PROJECT_VARIABLES.remove_traversing_cursor */
void T25f84(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* l1 = 0;
	T0* l2 = 0;
	t1 = ((a1)!=(((T25*)(C))->a19));
	if (t1) {
		l2 = ((T25*)(C))->a19;
		l1 = (((T64*)(GE_void(l2)))->a3);
		while (1) {
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
			if (t1) {
				break;
			}
			l2 = l1;
			l1 = (((T64*)(GE_void(l1)))->a3);
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T64*)(GE_void(a1)))->a3);
			T64f15(GE_void(l2), t2);
			T64f15(GE_void(a1), EIF_VOID);
		}
	}
}

/* GEANT_PROJECT_VARIABLES.cursor_off */
T1 T25f52(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T64f9(GE_void(a1)));
	return R;
}

/* GEANT_PROJECT_VARIABLES.is_empty */
T1 T25f51(T0* C)
{
	T1 R = 0;
	R = (((((((T25*)(C))->a4) == ((T6)(GE_int32(0)))))));
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_forth */
void T83f56(T0* C, T0* a1)
{
	T6 t1;
	T1 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 l3 = 0;
	T6 l4 = 0;
	l4 = (((T64*)(a1))->a2);
	t1 = ((T6)(GE_int32(-2)));
	t2 = (((((l4) == (t1)))));
	if (t2) {
		l3 = EIF_TRUE;
		l1 = (T6)(GE_int32(0));
	} else {
		l3 = EIF_FALSE;
		l1 = ((T6)((l4)+((T6)(GE_int32(1)))));
	}
	l2 = ((T83*)(C))->a6;
	while (1) {
		t2 = (T6f1((&l1), l2));
		if (!(t2)) {
			t1 = (T83f33(C, l1));
			t2 = (T6f1(&t1, (T6)(GE_int32(-2))));
		}
		if (t2) {
			break;
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	t2 = (T6f1((&l1), l2));
	if (t2) {
		T64f13(a1);
		t2 = ((T1)(!(l3)));
		if (t2) {
			T83f63(C, a1);
		}
	} else {
		T64f14(a1, l1);
		if (l3) {
			T83f64(C, a1);
		}
	}
}

/* GEANT_ARGUMENT_VARIABLES.cursor_forth */
void T34f71(T0* C, T0* a1)
{
	T6 t1;
	T1 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 l3 = 0;
	T6 l4 = 0;
	l4 = (((T64*)(GE_void(a1)))->a2);
	t1 = ((T6)(GE_int32(-2)));
	t2 = (((((l4) == (t1)))));
	if (t2) {
		l3 = EIF_TRUE;
		l1 = (T6)(GE_int32(0));
	} else {
		l3 = EIF_FALSE;
		l1 = ((T6)((l4)+((T6)(GE_int32(1)))));
	}
	l2 = ((T34*)(C))->a6;
	while (1) {
		t2 = (T6f1((&l1), l2));
		if (!(t2)) {
			t1 = (T34f26(C, l1));
			t2 = (T6f1(&t1, (T6)(GE_int32(-2))));
		}
		if (t2) {
			break;
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	t2 = (T6f1((&l1), l2));
	if (t2) {
		T64f13(GE_void(a1));
		t2 = ((T1)(!(l3)));
		if (t2) {
			T34f72(C, a1);
		}
	} else {
		T64f14(GE_void(a1), l1);
		if (l3) {
			T34f73(C, a1);
		}
	}
}

/* GEANT_VARIABLES.cursor_forth */
void T29f72(T0* C, T0* a1)
{
	T6 t1;
	T1 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 l3 = 0;
	T6 l4 = 0;
	l4 = (((T64*)(GE_void(a1)))->a2);
	t1 = ((T6)(GE_int32(-2)));
	t2 = (((((l4) == (t1)))));
	if (t2) {
		l3 = EIF_TRUE;
		l1 = (T6)(GE_int32(0));
	} else {
		l3 = EIF_FALSE;
		l1 = ((T6)((l4)+((T6)(GE_int32(1)))));
	}
	l2 = ((T29*)(C))->a6;
	while (1) {
		t2 = (T6f1((&l1), l2));
		if (!(t2)) {
			t1 = (T29f26(C, l1));
			t2 = (T6f1(&t1, (T6)(GE_int32(-2))));
		}
		if (t2) {
			break;
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	t2 = (T6f1((&l1), l2));
	if (t2) {
		T64f13(GE_void(a1));
		t2 = ((T1)(!(l3)));
		if (t2) {
			T29f73(C, a1);
		}
	} else {
		T64f14(GE_void(a1), l1);
		if (l3) {
			T29f74(C, a1);
		}
	}
}

/* GEANT_PROJECT_VARIABLES.cursor_forth */
void T25f83(T0* C, T0* a1)
{
	T6 t1;
	T1 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 l3 = 0;
	T6 l4 = 0;
	l4 = (((T64*)(GE_void(a1)))->a2);
	t1 = ((T6)(GE_int32(-2)));
	t2 = (((((l4) == (t1)))));
	if (t2) {
		l3 = EIF_TRUE;
		l1 = (T6)(GE_int32(0));
	} else {
		l3 = EIF_FALSE;
		l1 = ((T6)((l4)+((T6)(GE_int32(1)))));
	}
	l2 = ((T25*)(C))->a8;
	while (1) {
		t2 = (T6f1((&l1), l2));
		if (!(t2)) {
			t1 = (T25f21(C, l1));
			t2 = (T6f1(&t1, (T6)(GE_int32(-2))));
		}
		if (t2) {
			break;
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	t2 = (T6f1((&l1), l2));
	if (t2) {
		T64f13(GE_void(a1));
		t2 = ((T1)(!(l3)));
		if (t2) {
			T25f84(C, a1);
		}
	} else {
		T64f14(GE_void(a1), l1);
		if (l3) {
			T25f85(C, a1);
		}
	}
}

/* AP_DISPLAY_HELP_FLAG.reset */
void T72f40(T0* C)
{
	((T72*)(C))->a5 = (T6)(GE_int32(0));
}

/* AP_STRING_OPTION.reset */
void T37f28(T0* C)
{
	((T37*)(C))->a1 = T70c22((T6)(GE_int32(1)));
}

/* AP_FLAG.reset */
void T35f22(T0* C)
{
	((T35*)(C))->a1 = (T6)(GE_int32(0));
}

/* AP_DISPLAY_HELP_FLAG.record_occurrence */
void T72f41(T0* C, T0* a1)
{
	T72f42(C, a1);
}

/* AP_DISPLAY_HELP_FLAG.display_help */
void T72f42(T0* C, T0* a1)
{
	T0* t1;
	T0* t2;
	t1 = (((T38*)(a1))->a3);
	t2 = (T72f14(C, a1));
	T45f11(GE_void(t1), t2);
	t1 = (T72f15(C));
	T48f2(GE_void(t1), (T6)(GE_int32(0)));
}

/* AP_DISPLAY_HELP_FLAG.exceptions */
T0* T72f15(T0* C)
{
	T0* R = 0;
	if (ge204os1924) {
		return ge204ov1924;
	} else {
		ge204os1924 = '\1';
		ge204ov1924 = R;
	}
	R = T48c1();
	ge204ov1924 = R;
	return R;
}

/* AP_ERROR_HANDLER.report_info_message */
void T45f11(T0* C, T0* a1)
{
	T67f15(GE_void(((T45*)(C))->a4), a1);
}

/* AP_DISPLAY_HELP_FLAG.full_help_text */
T0* T72f14(T0* C, T0* a1)
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
	l3 = T381c3();
	l4 = T382c2(l3);
	R = (T72f16(C, a1));
	t1 = (((T38*)(a1))->a6);
	t2 = (T17f32(GE_void(t1)));
	t2 = ((T1)(!(t2)));
	if (t2) {
		T17f43(GE_void(R), ge104ov5493);
		t1 = (T72f18(C));
		T384f10(GE_void(t1), (T6)(GE_int32(0)));
		t1 = (T72f18(C));
		t3 = (((T38*)(a1))->a6);
		t1 = (T384f5(GE_void(t1), t3));
		T17f43(GE_void(R), t1);
		T17f43(GE_void(R), ge104ov5494);
	}
	T17f43(GE_void(R), ge104ov5495);
	l2 = (T38f16(a1));
	T382f3(GE_void(l4), l2);
	l1 = (T6)(GE_int32(0));
	T73f19(GE_void(l2));
	while (1) {
		t2 = (T73f9(GE_void(l2)));
		if (t2) {
			break;
		}
		t1 = (T73f7(GE_void(l2)));
		t2 = (T42x2716(GE_void(t1)));
		t2 = ((T1)(!(t2)));
		if (t2) {
			t1 = (T73f7(GE_void(l2)));
			t1 = (T42x2709(GE_void(t1)));
			t4 = (((T17*)(GE_void(t1)))->a2);
			l1 = (T6f11(&t4, l1));
		}
		T73f20(GE_void(l2));
	}
	T73f19(GE_void(l2));
	while (1) {
		t2 = (T73f9(GE_void(l2)));
		if (t2) {
			break;
		}
		t1 = (T73f7(GE_void(l2)));
		t2 = (T42x2716(GE_void(t1)));
		t2 = ((T1)(!(t2)));
		if (t2) {
			if (l5) {
				T17f39(GE_void(R), (T2)('\n'));
			}
			t1 = (T73f7(GE_void(l2)));
			t4 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t1 = (T72f23(C, t1, t4));
			T17f43(GE_void(R), t1);
			l5 = EIF_TRUE;
		}
		T73f20(GE_void(l2));
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.option_help_text */
T0* T72f23(T0* C, T0* a1, T6 a2)
{
	T0* t1;
	T6 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	T0* l1 = 0;
	t1 = (T42x2709(GE_void(a1)));
	t2 = (((T17*)(GE_void(t1)))->a2);
	t2 = ((T6)((a2)-(t2)));
	l1 = T17c58((T2)(' '), t2);
	t1 = (T72f18(C));
	T384f10(GE_void(t1), a2);
	t1 = (T72f18(C));
	t3 = (T42x2709(GE_void(a1)));
	t3 = (T17f9(GE_void(t3), l1));
	t4 = (T42x2705(GE_void(a1)));
	t3 = (T17f9(GE_void(t3), t4));
	R = (T384f5(GE_void(t1), t3));
	return R;
}

/* DS_QUICK_SORTER [AP_OPTION].sort */
void T382f3(T0* C, T0* a1)
{
	T382f4(C, a1, ((T382*)(C))->a1);
}

/* DS_QUICK_SORTER [AP_OPTION].sort_with_comparator */
void T382f4(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T6 t2;
	t1 = (T73f15(GE_void(a1)));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (((T73*)(GE_void(a1)))->a2);
		T382f5(C, a1, a2, (T6)(GE_int32(1)), t2);
	}
}

/* DS_QUICK_SORTER [AP_OPTION].subsort_with_comparator */
void T382f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4)
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
	l11 = T225c10((T6)(GE_int32(0)), (T6)(GE_int32(1)), l4);
	l12 = T225c10((T6)(GE_int32(0)), (T6)(GE_int32(1)), l4);
	T225f14(GE_void(l11), a3, (T6)(GE_int32(1)));
	T225f14(GE_void(l12), a4, (T6)(GE_int32(1)));
	l4 = (T6)(GE_int32(1));
	while (1) {
		t2 = (((((l4) == ((T6)(GE_int32(0)))))));
		if (t2) {
			break;
		}
		l9 = (T225f4(GE_void(l11), l4));
		l10 = (T225f4(GE_void(l12), l4));
		l4 = ((T6)((l4)-((T6)(GE_int32(1)))));
		l1 = l9;
		l2 = l10;
		t2 = ((T1)((l1)<(l2)));
		if (t2) {
			t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t2 = (((((l2) == (t1)))));
			if (t2) {
				l7 = (T73f16(GE_void(a1), l1));
				l8 = (T73f16(GE_void(a1), l2));
				t2 = (T381f1(GE_void(a2), l8, l7));
				if (t2) {
					T73f27(GE_void(a1), l7, l2);
					T73f27(GE_void(a1), l8, l1);
				}
			} else {
				t1 = ((T6)((l1)+(l2)));
				l3 = ((T6)((t1)/((T6)(GE_int32(2)))));
				l6 = (T73f16(GE_void(a1), l3));
				t3 = (T73f16(GE_void(a1), l10));
				T73f27(GE_void(a1), t3, l3);
				while (1) {
					t2 = (T6f6((&l1), l2));
					if (t2) {
						break;
					}
					while (1) {
						t2 = (T6f6((&l1), l2));
						if (!(t2)) {
							t3 = (T73f16(GE_void(a1), l1));
							t4 = (T381f1(GE_void(a2), t3, l6));
							t2 = ((T1)(!(t4)));
						}
						if (t2) {
							break;
						}
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					}
					l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
					while (1) {
						t2 = (T6f5((&l2), l1));
						if (!(t2)) {
							t3 = (T73f16(GE_void(a1), l2));
							t4 = (T381f1(GE_void(a2), l6, t3));
							t2 = ((T1)(!(t4)));
						}
						if (t2) {
							break;
						}
						l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
					}
					t2 = ((T1)((l1)<(l2)));
					if (t2) {
						T73f28(GE_void(a1), l1, l2);
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					}
				}
				t3 = (T73f16(GE_void(a1), l1));
				T73f27(GE_void(a1), t3, l10);
				T73f27(GE_void(a1), l6, l1);
				t1 = ((T6)((l1)-((T6)(GE_int32(1)))));
				t2 = (T6f1(&t1, l9));
				if (t2) {
					l4 = ((T6)((l4)+((T6)(GE_int32(1)))));
					T225f15(GE_void(l11), l9, l4);
					t1 = ((T6)((l1)-((T6)(GE_int32(1)))));
					T225f15(GE_void(l12), t1, l4);
				}
				t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				t2 = ((T1)((t1)<(l10)));
				if (t2) {
					l4 = ((T6)((l4)+((T6)(GE_int32(1)))));
					t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					T225f15(GE_void(l11), t1, l4);
					T225f15(GE_void(l12), l10, l4);
				}
			}
		}
	}
}

/* ARRAY [INTEGER_32].force */
void T225f15(T0* C, T6 a1, T6 a2)
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
	l3 = (T6f10(&(((T225*)(C))->a2), a2));
	l4 = (T6f11(&(((T225*)(C))->a3), a2));
	t1 = ((T6)((l4)-(l3)));
	l2 = ((T6)((t1)+((T6)(GE_int32(1)))));
	t1 = ((T6)((((T225*)(C))->a3)+((T6)(GE_int32(1)))));
	t2 = (((((a2) == (t1)))));
	if (!(t2)) {
		t1 = ((T6)((((T225*)(C))->a2)-((T6)(GE_int32(1)))));
		l7 = (((((a2) == (t1)))));
	} else {
		l7 = EIF_TRUE;
	}
	t2 = (T225f5(C));
	if (t2) {
		t1 = (T225f6(C));
		t1 = (T6f11((&l2), t1));
		T225f11(C, t1);
		t2 = ((T1)(!(l7)));
		if (t2) {
			t1 = ((T6)0);
			t3 = ((T6)((l2)-((T6)(GE_int32(2)))));
			T63f9(GE_void(((T225*)(C))->a1), t1, (T6)(GE_int32(0)), t3);
		}
		T63f10(GE_void(((T225*)(C))->a1), a1);
	} else {
		l1 = (((T63*)(GE_void(((T225*)(C))->a1)))->a2);
		t2 = (T6f1((&l2), l1));
		if (t2) {
			t1 = (T225f6(C));
			t1 = ((T6)((l1)+(t1)));
			t1 = (T6f11((&l2), t1));
			t4 = (T63f5(GE_void(((T225*)(C))->a1), t1));
			T225f16(C, t4);
		}
		t2 = ((T1)((l3)<(((T225*)(C))->a2)));
		if (t2) {
			l6 = ((T6)((((T225*)(C))->a2)-(l3)));
			l5 = (T225f7(C));
			t2 = ((T1)(!(l7)));
			if (t2) {
				t2 = (T6f1((&l6), l5));
			}
			if (t2) {
				t1 = ((T6)0);
				t3 = ((T6)((l6)-((T6)(GE_int32(1)))));
				T63f9(GE_void(((T225*)(C))->a1), t1, l5, t3);
			}
			T63f12(GE_void(((T225*)(C))->a1), (T6)(GE_int32(0)), l6, l5);
			t2 = ((T1)(!(l7)));
			if (t2) {
				t1 = ((T6)0);
				t3 = ((T6)((l6)-((T6)(GE_int32(1)))));
				T63f9(GE_void(((T225*)(C))->a1), t1, (T6)(GE_int32(1)), t3);
			}
			((T63*)(GE_void(((T225*)(C))->a1)))->z2[(T6)(GE_int32(0))] = (a1);
		} else {
			t1 = (((T63*)(GE_void(((T225*)(C))->a1)))->a1);
			t2 = (T6f1((&l2), t1));
			if (t2) {
				t2 = ((T1)(!(l7)));
				if (t2) {
					t1 = ((T6)0);
					t3 = (((T63*)(GE_void(((T225*)(C))->a1)))->a1);
					t5 = ((T6)((l2)-((T6)(GE_int32(2)))));
					T63f9(GE_void(((T225*)(C))->a1), t1, t3, t5);
				}
				T63f10(GE_void(((T225*)(C))->a1), a1);
			} else {
				t1 = ((T6)((a2)-(((T225*)(C))->a2)));
				((T63*)(GE_void(((T225*)(C))->a1)))->z2[t1] = (a1);
			}
		}
	}
	((T225*)(C))->a2 = l3;
	((T225*)(C))->a3 = l4;
}

/* ARRAY [INTEGER_32].capacity */
T6 T225f7(T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((((T225*)(C))->a3)-(((T225*)(C))->a2)));
	R = ((T6)((t1)+((T6)(GE_int32(1)))));
	return R;
}

/* ARRAY [INTEGER_32].set_area */
void T225f16(T0* C, T0* a1)
{
	((T225*)(C))->a1 = a1;
}

/* ARRAY [INTEGER_32].additional_space */
T6 T225f6(T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = (T225f7(C));
	t1 = ((T6)((t1)/((T6)(GE_int32(2)))));
	R = (T6f11(&t1, (T6)(GE_int32(5))));
	return R;
}

/* ARRAY [INTEGER_32].empty_area */
T1 T225f5(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T225*)(C))->a1)==(EIF_VOID));
	if (!(t1)) {
		t2 = (((T63*)(GE_void(((T225*)(C))->a1)))->a2);
		R = (((((t2) == ((T6)(GE_int32(0)))))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* DS_ARRAYED_LIST [AP_OPTION].swap */
void T73f28(T0* C, T6 a1, T6 a2)
{
	T0* t1;
	T0* l1 = 0;
	l1 = (T73f16(C, a1));
	t1 = (T73f16(C, a2));
	T73f27(C, t1, a1);
	T73f27(C, l1, a2);
}

/* DS_ARRAYED_LIST [AP_OPTION].replace */
void T73f27(T0* C, T0* a1, T6 a2)
{
	T6 t1;
	t1 = ((T6)((a2)-((T6)(GE_int32(1)))));
	((T112*)(GE_void(((T73*)(C))->a4)))->z2[t1] = (a1);
}

/* AP_OPTION_COMPARATOR.less_than */
T1 T381f1(T0* C, T0* a1, T0* a2)
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
	t1 = (T42x2707(GE_void(a1)));
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		l1 = m1;
	} else {
		t3 = (T42x2712(GE_void(a1)));
		l1 = (T2f1(&t3));
	}
	t1 = (T42x2707(GE_void(a2)));
	t2 = (t1?((m2 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		l2 = m2;
	} else {
		t3 = (T42x2712(GE_void(a2)));
		l2 = (T2f1(&t3));
	}
	t1 = (T381f2(C));
	t4 = (T75f14(GE_void(t1), l1, l2));
	R = (((((t4) == ((T6)(GE_int32(-1)))))));
	return R;
}

/* KL_STRING_ROUTINES.three_way_comparison */
T6 T75f14(T0* C, T0* a1, T0* a2)
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
		t2 = (T75f8(C));
		t1 = (T88f1(GE_void(t2), a1, ge133ov5541));
		if (t1) {
			t2 = (T75f8(C));
			t1 = (T88f1(GE_void(t2), a2, ge133ov5541));
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
				t1 = (T6f1((&l2), l3));
				if (t1) {
					break;
				}
				l6 = (T17f10(GE_void(a1), l2));
				l7 = (T17f10(GE_void(a2), l2));
				t1 = (((((l6) == (l7)))));
				if (t1) {
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T2f7((&l6), l7));
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
						t1 = (T6f1((&l2), l3));
						if (t1) {
							break;
						}
						l8 = (T17f14(GE_void(a1), l2));
						l9 = (T17f14(GE_void(a2), l2));
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
T0* T381f2(T0* C)
{
	T0* R = 0;
	if (ge128os1922) {
		return ge128ov1922;
	} else {
		ge128os1922 = '\1';
		ge128ov1922 = R;
	}
	R = T75c19();
	ge128ov1922 = R;
	return R;
}

/* DS_ARRAYED_LIST [AP_OPTION].item */
T0* T73f16(T0* C, T6 a1)
{
	T6 t1;
	T0* R = 0;
	t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
	R = (((T112*)(GE_void(((T73*)(C))->a4)))->z2[t1]);
	return R;
}

/* ST_WORD_WRAPPER.wrapped_string */
T0* T384f5(T0* C, T0* a1)
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
	t1 = (T384f4(C));
	l1 = (T75f7(GE_void(t1), a1));
	T384f12(C, l1);
	l2 = (((((T0*)(GE_void(l1)))->id==17)?((T17*)(l1))->a2:((T227*)(l1))->a1));
	l6 = T17c58((T2)(' '), ((T384*)(C))->a1);
	t2 = (((T17*)(GE_void(a1)))->a2);
	R = T17c38(t2);
	((T384*)(C))->a2 = (T6)(GE_int32(0));
	l4 = (T6)(GE_int32(1));
	l3 = ((T384*)(C))->a3;
	while (1) {
		t3 = (T6f1((&l4), l2));
		if (t3) {
			break;
		}
		t2 = ((T6)((l4)+(l3)));
		t3 = (T6f5(&t2, l2));
		if (t3) {
			l5 = ((T6)((l4)+(l3)));
			while (1) {
				t3 = (((((l5) == (l4)))));
				if (!(t3)) {
					t4 = (((((T0*)(GE_void(l1)))->id==17)?T17f10(l1, l5):T227f13(l1, l5)));
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
			((T384*)(C))->a2 = ((T6)((((T384*)(C))->a2)+((T6)(GE_int32(1)))));
			t2 = ((T6)((l4)+(l3)));
			l5 = ((T6)((t2)-((T6)(GE_int32(1)))));
			t1 = (((((T0*)(GE_void(l1)))->id==17)?T17f11(l1, l4, l5):T227f39(l1, l4, l5)));
			T17f43(GE_void(R), t1);
		} else {
			t2 = ((T6)((l5)-((T6)(GE_int32(1)))));
			t1 = (((((T0*)(GE_void(l1)))->id==17)?T17f11(l1, l4, t2):T227f39(l1, l4, t2)));
			T17f43(GE_void(R), t1);
		}
		l4 = ((T6)((l5)+((T6)(GE_int32(1)))));
		t2 = (((((T0*)(GE_void(l1)))->id==17)?((T17*)(l1))->a2:((T227*)(l1))->a1));
		t3 = (T6f5((&l4), t2));
		if (t3) {
			T17f39(GE_void(R), (T2)('\n'));
			T17f43(GE_void(R), l6);
		}
		l3 = ((T6)((((T384*)(C))->a3)-(((T384*)(C))->a1)));
	}
	return R;
}

/* ST_WORD_WRAPPER.canonify_whitespace */
void T384f12(T0* C, T0* a1)
{
	T1 t1;
	T6 l1 = 0;
	T6 l2 = 0;
	T2 l3 = 0;
	l2 = (((((T0*)(GE_void(a1)))->id==17)?((T17*)(a1))->a2:((T227*)(a1))->a1));
	l1 = (T6)(GE_int32(1));
	while (1) {
		t1 = (T6f1((&l1), l2));
		if (t1) {
			break;
		}
		l3 = (((((T0*)(GE_void(a1)))->id==17)?T17f10(a1, l1):T227f13(a1, l1)));
		t1 = (T384f8(C, l3));
		if (t1) {
			if (((T0*)(GE_void(a1)))->id==17) {
				T17f53(a1, (T2)(' '), l1);
			} else {
				T227f88(a1, (T2)(' '), l1);
			}
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
}

/* UC_UTF8_STRING.put */
void T227f88(T0* C, T2 a1, T6 a2)
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
	t1 = (((((((T227*)(C))->a1) == (((T227*)(C))->a3)))));
	if (t1) {
		l1 = a2;
		l4 = (T6)(GE_int32(1));
	} else {
		l1 = (T227f30(C, a2));
		l3 = (T227f24(C, l1));
		t2 = (T227f29(C));
		l4 = (T226f3(GE_void(t2), l3));
	}
	t2 = (T227f29(C));
	l5 = (T226f23(GE_void(t2), a1));
	t1 = (((((l5) == (l4)))));
	if (t1) {
	} else {
		t1 = ((T1)((l5)<(l4)));
		if (t1) {
			t3 = ((T6)((l1)+(l4)));
			t4 = ((T6)((l4)-(l5)));
			T227f80(C, t3, t4);
		} else {
			l2 = ((T6)((l5)-(l4)));
			l6 = ((T6)((((T227*)(C))->a3)+(l2)));
			t3 = (T227f40(C));
			t1 = (T6f1((&l6), t3));
			if (t1) {
				T227f70(C, l6);
			}
			t3 = ((T6)((l1)+(l4)));
			T227f81(C, t3, l2);
		}
	}
	T227f72(C, a1, l5, l1);
}

/* ST_WORD_WRAPPER.is_space */
T1 T384f8(T0* C, T2 a1)
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
T0* T384f4(T0* C)
{
	T0* R = 0;
	if (ge128os1922) {
		return ge128ov1922;
	} else {
		ge128os1922 = '\1';
		ge128ov1922 = R;
	}
	R = T75c19();
	ge128ov1922 = R;
	return R;
}

/* ST_WORD_WRAPPER.set_new_line_indentation */
void T384f10(T0* C, T6 a1)
{
	((T384*)(C))->a1 = a1;
}

/* AP_DISPLAY_HELP_FLAG.wrapper */
unsigned char ge104os5505 = '\0';
T0* ge104ov5505;
T0* T72f18(T0* C)
{
	T0* R = 0;
	if (ge104os5505) {
		return ge104ov5505;
	} else {
		ge104os5505 = '\1';
		ge104ov5505 = R;
	}
	R = T384c9();
	ge104ov5505 = R;
	T384f11(GE_void(R), (T6)(GE_int32(79)));
	return R;
}

/* ST_WORD_WRAPPER.set_maximum_text_width */
void T384f11(T0* C, T6 a1)
{
	((T384*)(C))->a3 = a1;
}

/* ST_WORD_WRAPPER.make */
T0* T384c9(void)
{
	T0* C;
	C = GE_new384(EIF_TRUE);
	((T384*)(C))->a3 = (T6)(GE_int32(79));
	((T384*)(C))->a1 = (T6)(GE_int32(0));
	return C;
}

/* AP_DISPLAY_HELP_FLAG.full_usage_instruction */
T0* T72f16(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* R = 0;
	T0* l1 = 0;
	R = (T72f24(C, a1));
	T17f39(GE_void(R), (T2)('\n'));
	l1 = (((T38*)(a1))->a2);
	T74f16(GE_void(l1));
	while (1) {
		t1 = (T74f7(GE_void(l1)));
		if (t1) {
			break;
		}
		t2 = (T74f6(GE_void(l1)));
		t2 = (((T36*)(GE_void(t2)))->a1);
		t1 = (((((T0*)(GE_void(t2)))->id==35)?((T35*)(t2))->a8:((T72*)(t2))->a8));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t2 = (T74f6(GE_void(l1)));
			t2 = (T72f25(C, a1, t2));
			T17f43(GE_void(R), t2);
		}
		T17f39(GE_void(R), (T2)('\n'));
		T74f17(GE_void(l1));
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.alternative_usage_instruction */
T0* T72f25(T0* C, T0* a1, T0* a2)
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
	l1 = T17c37();
	t1 = (((T36*)(GE_void(a2)))->a1);
	t1 = (((((T0*)(GE_void(t1)))->id==35)?T35f16(t1):T72f27(t1)));
	T17f43(GE_void(l1), t1);
	T17f39(GE_void(l1), (T2)(' '));
	T36f16(GE_void(a2));
	while (1) {
		t2 = (T36f5(GE_void(a2)));
		if (t2) {
			break;
		}
		l2 = (T36f6(GE_void(a2)));
		t2 = ((GE_void(l2), (T1)0));
		t2 = ((T1)(!(t2)));
		if (t2) {
			t1 = ((GE_void(l2), (T0*)0));
			T17f43(GE_void(l1), t1);
			T17f39(GE_void(l1), (T2)(' '));
		}
		T36f17(GE_void(a2));
	}
	t1 = (((T36*)(GE_void(a2)))->a2);
	T17f43(GE_void(l1), t1);
	t1 = (T72f28(C));
	t3 = (T72f29(C));
	t3 = (((T27*)(GE_void(t3)))->a1);
	l3 = (((((T0*)(GE_void(t1)))->id==53)?T53f24(t1, t3):T54f21(t1, t3)));
	if (((T0*)(GE_void(l3)))->id==17) {
		T17f55(l3, (T6)(GE_int32(40)));
	} else {
		T227f82(l3, (T6)(GE_int32(40)));
	}
	t4 = (((T17*)(ge104ov5492))->a2);
	R = T17c58((T2)(' '), t4);
	T17f43(GE_void(R), l3);
	T17f39(GE_void(R), (T2)(' '));
	T17f43(GE_void(R), l1);
	t1 = (T72f18(C));
	t4 = (((T17*)(ge104ov5492))->a2);
	t5 = (((((T0*)(GE_void(l3)))->id==17)?((T17*)(l3))->a2:((T227*)(l3))->a1));
	t4 = ((T6)((t4)+(t5)));
	t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
	T384f10(GE_void(t1), t4);
	t1 = (T72f18(C));
	R = (T384f5(GE_void(t1), R));
	return R;
}

/* AP_DISPLAY_HELP_FLAG.arguments */
T0* T72f29(T0* C)
{
	T0* R = 0;
	if (ge202os1931) {
		return ge202ov1931;
	} else {
		ge202os1931 = '\1';
		ge202ov1931 = R;
	}
	R = T27c5();
	ge202ov1931 = R;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.file_system */
T0* T72f28(T0* C)
{
	T0* t1;
	T1 t2;
	T0* R = 0;
	if (ge165os1926) {
		return ge165ov1926;
	} else {
		ge165os1926 = '\1';
		ge165ov1926 = R;
	}
	t1 = (T72f32(C));
	t2 = (T51f1(GE_void(t1)));
	if (t2) {
		R = (T72f33(C));
		ge165ov1926 = R;
	} else {
		t1 = (T72f32(C));
		t2 = (T51f2(GE_void(t1)));
		if (t2) {
			R = (T72f34(C));
			ge165ov1926 = R;
		} else {
			R = (T72f34(C));
			ge165ov1926 = R;
		}
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.unix_file_system */
T0* T72f34(T0* C)
{
	T0* R = 0;
	if (ge165os1929) {
		return ge165ov1929;
	} else {
		ge165os1929 = '\1';
		ge165ov1929 = R;
	}
	R = T54c33();
	ge165ov1929 = R;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.windows_file_system */
T0* T72f33(T0* C)
{
	T0* R = 0;
	if (ge165os1927) {
		return ge165ov1927;
	} else {
		ge165os1927 = '\1';
		ge165ov1927 = R;
	}
	R = T53c36();
	ge165ov1927 = R;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.operating_system */
T0* T72f32(T0* C)
{
	T0* R = 0;
	if (ge207os1930) {
		return ge207ov1930;
	} else {
		ge207os1930 = '\1';
		ge207ov1930 = R;
	}
	R = T51c6();
	ge207ov1930 = R;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.usage_instruction */
T0* T72f24(T0* C, T0* a1)
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
	l1 = T17c37();
	l3 = (((T38*)(a1))->a1);
	T73f19(GE_void(l3));
	while (1) {
		t1 = (T73f9(GE_void(l3)));
		if (t1) {
			break;
		}
		l2 = (T73f7(GE_void(l3)));
		t1 = (T42x2716(GE_void(l2)));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t2 = (T42x2706(GE_void(l2)));
			T17f43(GE_void(l1), t2);
			T17f39(GE_void(l1), (T2)(' '));
		}
		T73f20(GE_void(l3));
	}
	t2 = (((T38*)(a1))->a7);
	T17f43(GE_void(l1), t2);
	t2 = (T72f28(C));
	t3 = (T72f29(C));
	t3 = (((T27*)(GE_void(t3)))->a1);
	l4 = (((((T0*)(GE_void(t2)))->id==53)?T53f24(t2, t3):T54f21(t2, t3)));
	if (((T0*)(GE_void(l4)))->id==17) {
		T17f55(l4, (T6)(GE_int32(40)));
	} else {
		T227f82(l4, (T6)(GE_int32(40)));
	}
	R = T17c38((T6)(GE_int32(20)));
	T17f43(GE_void(R), ge104ov5492);
	T17f43(GE_void(R), l4);
	T17f39(GE_void(R), (T2)(' '));
	T17f43(GE_void(R), l1);
	t2 = (T72f18(C));
	t4 = (((T17*)(ge104ov5492))->a2);
	t5 = (((((T0*)(GE_void(l4)))->id==17)?((T17*)(l4))->a2:((T227*)(l4))->a1));
	t4 = ((T6)((t4)+(t5)));
	t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
	T384f10(GE_void(t2), t4);
	t2 = (T72f18(C));
	R = (T384f5(GE_void(t2), R));
	return R;
}

/* DS_QUICK_SORTER [AP_OPTION].make */
T0* T382c2(T0* a1)
{
	T0* C;
	C = GE_new382(EIF_TRUE);
	((T382*)(C))->a1 = a1;
	return C;
}

/* AP_OPTION_COMPARATOR.default_create */
T0* T381c3(void)
{
	T0* C;
	C = GE_new381(EIF_TRUE);
	return C;
}

/* AP_STRING_OPTION.record_occurrence */
void T37f30(T0* C, T0* a1)
{
	T0* t1;
	t1 = (((T38*)(a1))->a10);
	T70f26(GE_void(((T37*)(C))->a1), t1);
}

/* AP_FLAG.record_occurrence */
void T35f24(T0* C, T0* a1)
{
	((T35*)(C))->a1 = ((T6)((((T35*)(C))->a1)+((T6)(GE_int32(1)))));
}

/* GEANT_ARGUMENT_VARIABLES.force_last */
void T34f68(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T6 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T34f50(C);
	T34f51(C, a2);
	t1 = (((((((T34*)(C))->a1) != ((T6)(GE_int32(-1)))))));
	if (t1) {
		T34f52(C, a1, ((T34*)(C))->a1);
	} else {
		l1 = ((T6)((((T34*)(C))->a6)+((T6)(GE_int32(1)))));
		t1 = (T6f6((&l1), ((T34*)(C))->a3));
		if (t1) {
			t2 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t2 = (T34f23(C, t2));
			T34f53(C, t2);
			l2 = (T34f24(C, a2));
		} else {
			l2 = ((T34*)(C))->a4;
		}
		((T34*)(C))->a6 = l1;
		t2 = (T34f31(C, l2));
		T34f54(C, t2, l1);
		T34f55(C, l1, l2);
		T34f52(C, a1, l1);
		T34f56(C, a2, l1);
		((T34*)(C))->a2 = ((T6)((((T34*)(C))->a2)+((T6)(GE_int32(1)))));
	}
}

/* GEANT_VARIABLES.force_last */
void T29f70(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T6 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T29f51(C);
	T29f52(C, a2);
	t1 = (((((((T29*)(C))->a1) != ((T6)(GE_int32(-1)))))));
	if (t1) {
		T29f53(C, a1, ((T29*)(C))->a1);
	} else {
		l1 = ((T6)((((T29*)(C))->a6)+((T6)(GE_int32(1)))));
		t1 = (T6f6((&l1), ((T29*)(C))->a3));
		if (t1) {
			t2 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t2 = (T29f23(C, t2));
			T29f54(C, t2);
			l2 = (T29f24(C, a2));
		} else {
			l2 = ((T29*)(C))->a4;
		}
		((T29*)(C))->a6 = l1;
		t2 = (T29f33(C, l2));
		T29f55(C, t2, l1);
		T29f56(C, l1, l2);
		T29f53(C, a1, l1);
		T29f57(C, a2, l1);
		((T29*)(C))->a2 = ((T6)((((T29*)(C))->a2)+((T6)(GE_int32(1)))));
	}
}

/* GEANT_PROJECT_VARIABLES.force_last */
void T25f95(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T6 t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T25f64(C);
	T25f65(C, a2);
	t1 = (((((((T25*)(C))->a3) != ((T6)(GE_int32(-1)))))));
	if (t1) {
		T25f66(C, a1, ((T25*)(C))->a3);
	} else {
		l1 = ((T6)((((T25*)(C))->a8)+((T6)(GE_int32(1)))));
		t1 = (T6f6((&l1), ((T25*)(C))->a5));
		if (t1) {
			t2 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t2 = (T25f32(C, t2));
			T25f67(C, t2);
			l2 = (T25f33(C, a2));
		} else {
			l2 = ((T25*)(C))->a6;
		}
		((T25*)(C))->a8 = l1;
		t2 = (T25f22(C, l2));
		T25f68(C, t2, l1);
		T25f69(C, l1, l2);
		T25f66(C, a1, l1);
		T25f70(C, a2, l1);
		((T25*)(C))->a4 = ((T6)((((T25*)(C))->a4)+((T6)(GE_int32(1)))));
	}
}

/* GEANT_PROJECT_VARIABLES.resize */
void T25f67(T0* C, T6 a1)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T25f64(C);
	l1 = (T25f31(C, a1));
	t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	T25f72(C, t1);
	l2 = ((T25*)(C))->a11;
	while (1) {
		t2 = ((T1)((l2)<((T6)(GE_int32(0)))));
		if (t2) {
			break;
		}
		T25f69(C, (T6)(GE_int32(-1)), l2);
		l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
	}
	((T25*)(C))->a11 = l1;
	l2 = ((T25*)(C))->a8;
	while (1) {
		t2 = ((T1)((l2)<((T6)(GE_int32(0)))));
		if (t2) {
			break;
		}
		t1 = (T25f21(C, l2));
		t2 = (T6f1(&t1, (T6)(GE_int32(-2))));
		if (t2) {
			t3 = (T25f28(C, l2));
			l3 = (T25f33(C, t3));
			t1 = (T25f22(C, l3));
			T25f68(C, t1, l2);
			T25f69(C, l2, l3);
		}
		l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
	}
	T25f73(C, a1);
	T25f74(C, a1);
	T25f75(C, a1);
	((T25*)(C))->a5 = a1;
	((T25*)(C))->a3 = (T6)(GE_int32(-1));
}

/* GEANT_PROJECT_VARIABLES.clashes_resize */
void T25f75(T0* C, T6 a1)
{
	T0* t1;
	t1 = (T25f37(C));
	((T25*)(C))->a15 = (T65f1(GE_void(t1), ((T25*)(C))->a15, (T6)(GE_int32(-1)), a1));
}

/* GEANT_PROJECT_VARIABLES.special_integer_ */
T0* T25f37(T0* C)
{
	T0* R = 0;
	if (ge127os2341) {
		return ge127ov2341;
	} else {
		ge127os2341 = '\1';
		ge127ov2341 = R;
	}
	R = T65c6();
	ge127ov2341 = R;
	return R;
}

/* GEANT_PROJECT_VARIABLES.key_storage_resize */
void T25f74(T0* C, T6 a1)
{
	((T25*)(C))->a18 = (T62f1(GE_void(((T25*)(C))->a17), ((T25*)(C))->a18, a1));
}

/* GEANT_PROJECT_VARIABLES.item_storage_resize */
void T25f73(T0* C, T6 a1)
{
	((T25*)(C))->a14 = (T62f1(GE_void(((T25*)(C))->a13), ((T25*)(C))->a14, a1));
}

/* GEANT_PROJECT_VARIABLES.slots_resize */
void T25f72(T0* C, T6 a1)
{
	T0* t1;
	t1 = (T25f37(C));
	((T25*)(C))->a16 = (T65f1(GE_void(t1), ((T25*)(C))->a16, (T6)(GE_int32(-1)), a1));
}

/* GEANT_PROJECT_VARIABLES.new_capacity */
T6 T25f32(T0* C, T6 a1)
{
	T6 t1;
	T6 R = 0;
	t1 = (T6)(GE_int32(2));
	R = ((T6)((t1)*(a1)));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.search */
void T34f69(T0* C, T0* a1)
{
	T34f51(C, a1);
	((T34*)(C))->a9 = ((T34*)(C))->a1;
}

/* GEANT_VARIABLES.search */
void T29f69(T0* C, T0* a1)
{
	T29f52(C, a1);
	((T29*)(C))->a9 = ((T29*)(C))->a1;
}

/* GEANT_PROJECT_VARIABLES.search */
void T25f81(T0* C, T0* a1)
{
	T25f65(C, a1);
	((T25*)(C))->a10 = ((T25*)(C))->a3;
}

/* GEANT_ARGUMENT_VARIABLES.start */
void T34f77(T0* C)
{
	T34f70(C, ((T34*)(C))->a19);
}

/* GEANT_VARIABLES.start */
void T29f77(T0* C)
{
	T29f71(C, ((T29*)(C))->a19);
}

/* GEANT_PROJECT_VARIABLES.start */
void T25f97(T0* C)
{
	T25f82(C, ((T25*)(C))->a19);
}

/* GEANT_ARGUMENT_VARIABLES.forth */
void T34f78(T0* C)
{
	T34f71(C, ((T34*)(C))->a19);
}

/* GEANT_VARIABLES.forth */
void T29f78(T0* C)
{
	T29f72(C, ((T29*)(C))->a19);
}

/* GEANT_PROJECT_VARIABLES.forth */
void T25f98(T0* C)
{
	T25f83(C, ((T25*)(C))->a19);
}

/* GEANT_ARGUMENT_VARIABLES.set_variable_value */
void T34f75(T0* C, T0* a1, T0* a2)
{
	T34f47(C, a2, a1);
}

/* GEANT_VARIABLES.set_variable_value */
void T29f47(T0* C, T0* a1, T0* a2)
{
	T29f48(C, a2, a1);
}

/* GEANT_PROJECT_VARIABLES.set_variable_value */
void T25f59(T0* C, T0* a1, T0* a2)
{
	T25f62(C, a2, a1);
}

/* GEANT_PROJECT_VARIABLES.force */
void T25f62(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T6 t2;
	T6 t3;
	T6 l1 = 0;
	T6 l2 = 0;
	T25f64(C);
	T25f65(C, a2);
	t1 = (((((((T25*)(C))->a3) != ((T6)(GE_int32(-1)))))));
	if (t1) {
		T25f66(C, a1, ((T25*)(C))->a3);
	} else {
		t1 = (((((((T25*)(C))->a4) == (((T25*)(C))->a5)))));
		if (t1) {
			t2 = ((T6)((((T25*)(C))->a4)+((T6)(GE_int32(1)))));
			t2 = (T25f32(C, t2));
			T25f67(C, t2);
			l2 = (T25f33(C, a2));
		} else {
			l2 = ((T25*)(C))->a6;
		}
		l1 = ((T25*)(C))->a7;
		t1 = (((((l1) == ((T6)(GE_int32(-1)))))));
		if (t1) {
			((T25*)(C))->a8 = ((T6)((((T25*)(C))->a8)+((T6)(GE_int32(1)))));
			l1 = ((T25*)(C))->a8;
		} else {
			t2 = (T6)(GE_int32(-3));
			t3 = (T25f21(C, l1));
			((T25*)(C))->a7 = ((T6)((t2)-(t3)));
		}
		t2 = (T25f22(C, l2));
		T25f68(C, t2, l1);
		T25f69(C, l1, l2);
		T25f66(C, a1, l1);
		T25f70(C, a2, l1);
		((T25*)(C))->a4 = ((T6)((((T25*)(C))->a4)+((T6)(GE_int32(1)))));
	}
}

/* GEANT_ARGUMENT_VARIABLES.replace */
void T34f76(T0* C, T0* a1, T0* a2)
{
	T34f50(C);
	T34f51(C, a2);
	T34f52(C, a1, ((T34*)(C))->a1);
}

/* GEANT_VARIABLES.replace */
void T29f76(T0* C, T0* a1, T0* a2)
{
	T29f51(C);
	T29f52(C, a2);
	T29f53(C, a1, ((T29*)(C))->a1);
}

/* GEANT_PROJECT_VARIABLES.replace */
void T25f96(T0* C, T0* a1, T0* a2)
{
	T25f64(C);
	T25f65(C, a2);
	T25f66(C, a1, ((T25*)(C))->a3);
}

/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].labeled */
T1 T628f3(T0* C, T6 a1)
{
	T1 R = 0;
	R = (((((((T628*)(C))->a1) == (a1)))));
	return R;
}

/* LX_EPSILON_TRANSITION [LX_NFA_STATE].labeled */
T1 T626f2(T0* C, T6 a1)
{
	T1 R = 0;
	return R;
}

/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].labeled */
T1 T624f3(T0* C, T6 a1)
{
	T1 t1;
	T1 R = 0;
	t1 = (((T574*)(GE_void(((T624*)(C))->a1)))->a5);
	if (t1) {
		t1 = (T574f9(GE_void(((T624*)(C))->a1), a1));
		R = ((T1)(!(t1)));
	} else {
		R = (T574f9(GE_void(((T624*)(C))->a1), a1));
	}
	return R;
}

/* GEANT_REPLACE_TASK.is_executable */
T1 T350f18(T0* C)
{
	T1 R = 0;
	R = (T478f14(GE_void(((T350*)(C))->a1)));
	return R;
}

/* GEANT_REPLACE_COMMAND.is_executable */
T1 T478f14(T0* C)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T0* t4;
	T1 R = 0;
	t1 = (T478f15(C));
	t2 = (T478f16(C));
	t3 = (T478f17(C));
	t4 = GE_ma270((T6)2,(T6)2,
(int)(t2),
(int)(t3));
	R = (T561f1(GE_void(t1), t4));
	return R;
}

/* KL_BOOLEAN_ROUTINES.nxor */
T1 T561f1(T0* C, T0* a1)
{
	T1 t1;
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	l1 = (((T270*)(a1))->a2);
	l2 = (((T270*)(a1))->a3);
	while (1) {
		t1 = (T6f1((&l1), l2));
		if (t1) {
			break;
		}
		t1 = (T270f4(a1, l1));
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
T1 T478f17(T0* C)
{
	T1 R = 0;
	R = ((((T478*)(C))->a11)!=(EIF_VOID));
	return R;
}

/* GEANT_REPLACE_COMMAND.boolean_ */
unsigned char ge123os5911 = '\0';
T0* ge123ov5911;
T0* T478f15(T0* C)
{
	T0* R = 0;
	if (ge123os5911) {
		return ge123ov5911;
	} else {
		ge123os5911 = '\1';
		ge123ov5911 = R;
	}
	R = T561c2();
	ge123ov5911 = R;
	return R;
}

/* KL_BOOLEAN_ROUTINES.default_create */
T0* T561c2(void)
{
	T0* C;
	C = GE_new561(EIF_TRUE);
	return C;
}

/* GEANT_INPUT_TASK.is_executable */
T1 T348f20(T0* C)
{
	T1 R = 0;
	R = (T475f11(GE_void(((T348*)(C))->a1)));
	return R;
}

/* GEANT_INPUT_COMMAND.is_executable */
T1 T475f11(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T475*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T475*)(C))->a3)))->id==17)?((T17*)(((T475*)(C))->a3))->a2:((T227*)(((T475*)(C))->a3))->a1));
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		R = ((((T475*)(C))->a4)!=(EIF_VOID));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_AVAILABLE_TASK.is_executable */
T1 T346f6(T0* C)
{
	T1 R = 0;
	R = (T472f13(GE_void(((T346*)(C))->a1)));
	return R;
}

/* GEANT_AVAILABLE_COMMAND.is_executable */
T1 T472f13(T0* C)
{
	T1 t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T0* l1 = 0;
	l1 = T559c2(EIF_TRUE);
	t1 = (T402f5(GE_void(((T472*)(C))->a1)));
	T472f20(C, t1, GE_ms8("  [available] error: \'resource\' is not defined", 46), l1);
	t1 = (((T559*)(GE_void(l1)))->a1);
	if (t1) {
		t2 = (T402f6(GE_void(((T472*)(C))->a1)));
		t3 = (((((T0*)(GE_void(t2)))->id==17)?T17f32(t2):T227f53(t2)));
		t1 = ((T1)(!(t3)));
	}
	T472f20(C, t1, GE_ms8("  [available] error: \'resource\' is empty", 40), l1);
	t1 = (((T559*)(GE_void(l1)))->a1);
	if (t1) {
		t1 = (T402f5(GE_void(((T472*)(C))->a2)));
	}
	T472f20(C, t1, GE_ms8("  [available] error: \'variable\' is not defined", 46), l1);
	t1 = (((T559*)(GE_void(l1)))->a1);
	if (t1) {
		t2 = (T402f6(GE_void(((T472*)(C))->a2)));
		t3 = (((((T0*)(GE_void(t2)))->id==17)?T17f32(t2):T227f53(t2)));
		t1 = ((T1)(!(t3)));
	}
	T472f20(C, t1, GE_ms8("  [available] error: \'variable\' is empty", 40), l1);
	R = (((T559*)(GE_void(l1)))->a1);
	return R;
}

/* GEANT_AVAILABLE_COMMAND.validate_condition */
void T472f20(T0* C, T1 a1, T0* a2, T0* a3)
{
	T1 t1;
	T0* t2;
	t1 = (((T559*)(GE_void(a3)))->a1);
	if (t1) {
		t1 = ((T1)(!(a1)));
		if (t1) {
			T559f3(GE_void(a3), EIF_FALSE);
			t2 = (T472f16(C));
			T70f26(GE_void(t2), a2);
		}
	}
}

/* GEANT_AVAILABLE_COMMAND.validation_messages */
T0* T472f16(T0* C)
{
	T0* R = 0;
	if (ge10os1913) {
		return ge10ov1913;
	} else {
		ge10os1913 = '\1';
		ge10ov1913 = R;
	}
	R = T70c22((T6)(GE_int32(5)));
	ge10ov1913 = R;
	return R;
}

/* DS_CELL [BOOLEAN].put */
void T559f3(T0* C, T1 a1)
{
	((T559*)(C))->a1 = a1;
}

/* DS_CELL [BOOLEAN].make */
T0* T559c2(T1 a1)
{
	T0* C;
	C = GE_new559(EIF_TRUE);
	((T559*)(C))->a1 = a1;
	return C;
}

/* GEANT_PRECURSOR_TASK.is_executable */
T1 T344f17(T0* C)
{
	T1 R = 0;
	R = (T469f7(GE_void(((T344*)(C))->a1)));
	return R;
}

/* GEANT_PRECURSOR_COMMAND.is_executable */
T1 T469f7(T0* C)
{
	T0* t1;
	T1 t2;
	T1 R = 0;
	t1 = (T22f22(GE_void(((T469*)(C))->a3)));
	t1 = (((T26*)(GE_void(t1)))->a13);
	R = ((t1)!=(EIF_VOID));
	t2 = ((T1)(!(R)));
	if (t2) {
		t1 = GE_ma33((T6)1,(T6)1,
GE_ms8("  [precursor] error: precursor does not exist.", 46));
		T22f50(GE_void(((T469*)(C))->a3), t1);
	}
	return R;
}

/* GEANT_EXIT_TASK.is_executable */
T1 T342f10(T0* C)
{
	T1 R = 0;
	R = (T466f6(GE_void(((T342*)(C))->a1)));
	return R;
}

/* GEANT_EXIT_COMMAND.is_executable */
T1 T466f6(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* GEANT_OUTOFDATE_TASK.is_executable */
T1 T340f15(T0* C)
{
	T1 R = 0;
	R = (T463f11(GE_void(((T340*)(C))->a1)));
	return R;
}

/* GEANT_OUTOFDATE_COMMAND.is_executable */
T1 T463f11(T0* C)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = (T463f12(C));
	t2 = (T463f13(C));
	R = ((T1)((t1)^(t2)));
	return R;
}

/* GEANT_OUTOFDATE_COMMAND.is_fileset_executable */
T1 T463f13(T0* C)
{
	T1 t1;
	T1 R = 0;
	R = ((((T463*)(C))->a3)==(EIF_VOID));
	if (R) {
		R = ((((T463*)(C))->a4)==(EIF_VOID));
	} else {
		R = EIF_FALSE;
	}
	if (R) {
		t1 = ((((T463*)(C))->a8)!=(EIF_VOID));
	} else {
		t1 = EIF_FALSE;
	}
	if (t1) {
		R = (T406f19(GE_void(((T463*)(C))->a8)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_XSLT_TASK.is_executable */
T1 T338f29(T0* C)
{
	T1 R = 0;
	R = (T459f17(GE_void(((T338*)(C))->a1)));
	return R;
}

/* GEANT_XSLT_COMMAND.is_executable */
T1 T459f17(T0* C)
{
	T1 t1;
	T6 t2;
	T1 t3;
	T1 R = 0;
	t1 = ((((T459*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T459*)(C))->a4)))->id==17)?((T17*)(((T459*)(C))->a4))->a2:((T227*)(((T459*)(C))->a4))->a1));
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		t3 = ((((T459*)(C))->a5)!=(EIF_VOID));
		if (t3) {
			t2 = (((((T0*)(GE_void(((T459*)(C))->a5)))->id==17)?((T17*)(((T459*)(C))->a5))->a2:((T227*)(((T459*)(C))->a5))->a1));
			t1 = (T6f1(&t2, (T6)(GE_int32(0))));
		} else {
			t1 = EIF_FALSE;
		}
	}
	if (t1) {
		t1 = ((((T459*)(C))->a7)!=(EIF_VOID));
		if (t1) {
			t2 = (((((T0*)(GE_void(((T459*)(C))->a7)))->id==17)?((T17*)(((T459*)(C))->a7))->a2:((T227*)(((T459*)(C))->a7))->a1));
			R = (T6f1(&t2, (T6)(GE_int32(0))));
		} else {
			R = EIF_FALSE;
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_SETENV_TASK.is_executable */
T1 T336f11(T0* C)
{
	T1 R = 0;
	R = (T455f7(GE_void(((T336*)(C))->a1)));
	return R;
}

/* GEANT_SETENV_COMMAND.is_executable */
T1 T455f7(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T455*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T455*)(C))->a3)))->id==17)?((T17*)(((T455*)(C))->a3))->a2:((T227*)(((T455*)(C))->a3))->a1));
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		R = ((((T455*)(C))->a4)!=(EIF_VOID));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_MOVE_TASK.is_executable */
T1 T334f13(T0* C)
{
	T1 R = 0;
	R = (T452f9(GE_void(((T334*)(C))->a1)));
	return R;
}

/* GEANT_MOVE_COMMAND.is_executable */
T1 T452f9(T0* C)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = (T452f10(C));
	if (t1) {
		t2 = (T452f11(C));
		t1 = ((T1)(!(t2)));
	}
	if (t1) {
		t2 = (T452f12(C));
		t1 = ((T1)(!(t2)));
	}
	if (!(t1)) {
		t2 = (T452f10(C));
		t2 = ((T1)(!(t2)));
		if (t2) {
			t2 = (T452f11(C));
		}
		if (t2) {
			t2 = (T452f12(C));
			t1 = ((T1)(!(t2)));
		} else {
			t1 = EIF_FALSE;
		}
	}
	if (!(t1)) {
		t1 = (T452f10(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t2 = (T452f11(C));
			t1 = ((T1)(!(t2)));
		}
		if (t1) {
			R = (T452f12(C));
		} else {
			R = EIF_FALSE;
		}
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* GEANT_MOVE_COMMAND.is_fileset_to_directory_executable */
T1 T452f12(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T452*)(C))->a6)!=(EIF_VOID));
	if (t1) {
		t1 = ((((T452*)(C))->a5)!=(EIF_VOID));
	}
	if (t1) {
		t2 = (((((T0*)(GE_void(((T452*)(C))->a5)))->id==17)?((T17*)(((T452*)(C))->a5))->a2:((T227*)(((T452*)(C))->a5))->a1));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_COPY_TASK.is_executable */
T1 T332f19(T0* C)
{
	T1 R = 0;
	R = (T449f10(GE_void(((T332*)(C))->a1)));
	return R;
}

/* GEANT_COPY_COMMAND.is_executable */
T1 T449f10(T0* C)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	T0* t5;
	T1 R = 0;
	t1 = (T449f11(C));
	t2 = (T449f12(C));
	t3 = (T449f13(C));
	t4 = (T449f14(C));
	t5 = GE_ma270((T6)3,(T6)3,
(int)(t2),
(int)(t3),
(int)(t4));
	R = (T561f1(GE_void(t1), t5));
	return R;
}

/* GEANT_COPY_COMMAND.is_fileset_to_directory_executable */
T1 T449f14(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T449*)(C))->a7)!=(EIF_VOID));
	if (t1) {
		t1 = ((((T449*)(C))->a5)!=(EIF_VOID));
	}
	if (t1) {
		t2 = (((((T0*)(GE_void(((T449*)(C))->a5)))->id==17)?((T17*)(((T449*)(C))->a5))->a2:((T227*)(((T449*)(C))->a5))->a1));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_COPY_COMMAND.boolean_ */
T0* T449f11(T0* C)
{
	T0* R = 0;
	if (ge123os5911) {
		return ge123ov5911;
	} else {
		ge123os5911 = '\1';
		ge123ov5911 = R;
	}
	R = T561c2();
	ge123ov5911 = R;
	return R;
}

/* GEANT_DELETE_TASK.is_executable */
T1 T330f13(T0* C)
{
	T1 R = 0;
	R = (T445f9(GE_void(((T330*)(C))->a1)));
	return R;
}

/* GEANT_DELETE_COMMAND.is_executable */
T1 T445f9(T0* C)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	T0* t5;
	T1 R = 0;
	t1 = (T445f10(C));
	t2 = (T445f11(C));
	t3 = (T445f12(C));
	t4 = (T445f13(C));
	if (!(t4)) {
		t4 = (T445f14(C));
	}
	t5 = GE_ma270((T6)3,(T6)3,
(int)(t2),
(int)(t3),
(int)(t4));
	R = (T561f1(GE_void(t1), t5));
	return R;
}

/* GEANT_DELETE_COMMAND.boolean_ */
T0* T445f10(T0* C)
{
	T0* R = 0;
	if (ge123os5911) {
		return ge123ov5911;
	} else {
		ge123os5911 = '\1';
		ge123ov5911 = R;
	}
	R = T561c2();
	ge123ov5911 = R;
	return R;
}

/* GEANT_MKDIR_TASK.is_executable */
T1 T328f6(T0* C)
{
	T1 R = 0;
	R = (T441f10(GE_void(((T328*)(C))->a1)));
	return R;
}

/* GEANT_MKDIR_COMMAND.is_executable */
T1 T441f10(T0* C)
{
	T1 t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T0* l1 = 0;
	l1 = T559c2(EIF_TRUE);
	t1 = (T402f5(GE_void(((T441*)(C))->a1)));
	T441f17(C, t1, GE_ms8("  [mkdir] error: \'directory\' is not defined", 43), l1);
	t1 = (((T559*)(GE_void(l1)))->a1);
	if (t1) {
		t2 = (T402f6(GE_void(((T441*)(C))->a1)));
		t3 = (((((T0*)(GE_void(t2)))->id==17)?T17f32(t2):T227f53(t2)));
		t1 = ((T1)(!(t3)));
	}
	T441f17(C, t1, GE_ms8("  [mkdir] error: \'directory\' is empty", 37), l1);
	R = (((T559*)(GE_void(l1)))->a1);
	return R;
}

/* GEANT_MKDIR_COMMAND.validate_condition */
void T441f17(T0* C, T1 a1, T0* a2, T0* a3)
{
	T1 t1;
	T0* t2;
	t1 = (((T559*)(GE_void(a3)))->a1);
	if (t1) {
		t1 = ((T1)(!(a1)));
		if (t1) {
			T559f3(GE_void(a3), EIF_FALSE);
			t2 = (T441f12(C));
			T70f26(GE_void(t2), a2);
		}
	}
}

/* GEANT_MKDIR_COMMAND.validation_messages */
T0* T441f12(T0* C)
{
	T0* R = 0;
	if (ge10os1913) {
		return ge10ov1913;
	} else {
		ge10os1913 = '\1';
		ge10ov1913 = R;
	}
	R = T70c22((T6)(GE_int32(5)));
	ge10ov1913 = R;
	return R;
}

/* GEANT_ECHO_TASK.is_executable */
T1 T326f6(T0* C)
{
	T1 R = 0;
	R = (T438f9(GE_void(((T326*)(C))->a1)));
	return R;
}

/* GEANT_ECHO_COMMAND.is_executable */
T1 T438f9(T0* C)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T0* l1 = 0;
	l1 = T559c2(EIF_TRUE);
	t1 = (T402f5(GE_void(((T438*)(C))->a1)));
	T438f17(C, t1, GE_ms8("  [echo] error: \'message\' is not defined", 40), l1);
	t1 = (((T559*)(GE_void(l1)))->a1);
	if (t1) {
		t1 = (T402f5(GE_void(((T438*)(C))->a2)));
		if (t1) {
			t2 = (T402f6(GE_void(((T438*)(C))->a2)));
			t1 = (((((T0*)(GE_void(t2)))->id==17)?T17f32(t2):T227f53(t2)));
			t1 = ((T1)(!(t1)));
			T438f17(C, t1, GE_ms8("  [echo] error: \'to_file\' may not be empty", 42), l1);
		}
	}
	R = (((T559*)(GE_void(l1)))->a1);
	return R;
}

/* GEANT_ECHO_COMMAND.validate_condition */
void T438f17(T0* C, T1 a1, T0* a2, T0* a3)
{
	T1 t1;
	T0* t2;
	t1 = (((T559*)(GE_void(a3)))->a1);
	if (t1) {
		t1 = ((T1)(!(a1)));
		if (t1) {
			T559f3(GE_void(a3), EIF_FALSE);
			t2 = (T438f11(C));
			T70f26(GE_void(t2), a2);
		}
	}
}

/* GEANT_ECHO_COMMAND.validation_messages */
T0* T438f11(T0* C)
{
	T0* R = 0;
	if (ge10os1913) {
		return ge10ov1913;
	} else {
		ge10os1913 = '\1';
		ge10ov1913 = R;
	}
	R = T70c22((T6)(GE_int32(5)));
	ge10ov1913 = R;
	return R;
}

/* GEANT_GEANT_TASK.is_executable */
T1 T324f25(T0* C)
{
	T1 R = 0;
	R = (T434f13(GE_void(((T324*)(C))->a1)));
	return R;
}

/* GEANT_GEANT_COMMAND.is_executable */
T1 T434f13(T0* C)
{
	T1 t1;
	T1 R = 0;
	t1 = (T434f14(C));
	if (!(t1)) {
		R = (T434f15(C));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* GEANT_GEANT_COMMAND.is_target_executable */
T1 T434f15(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T434*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T434*)(C))->a4)))->id==17)?((T17*)(((T434*)(C))->a4))->a2:((T227*)(((T434*)(C))->a4))->a1));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GETEST_TASK.is_executable */
T1 T322f27(T0* C)
{
	T1 R = 0;
	R = (T431f16(GE_void(((T322*)(C))->a1)));
	return R;
}

/* GEANT_GETEST_COMMAND.is_executable */
T1 T431f16(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T431*)(C))->a8)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T431*)(C))->a8)))->id==17)?((T17*)(((T431*)(C))->a8))->a2:((T227*)(((T431*)(C))->a8))->a1));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEPP_TASK.is_executable */
T1 T320f22(T0* C)
{
	T1 R = 0;
	R = (T428f12(GE_void(((T320*)(C))->a1)));
	return R;
}

/* GEANT_GEPP_COMMAND.is_executable */
T1 T428f12(T0* C)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = (T428f13(C));
	t2 = (T428f14(C));
	R = ((T1)((t1)^(t2)));
	return R;
}

/* GEANT_GEPP_COMMAND.is_fileset_executable */
T1 T428f14(T0* C)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	t1 = ((((T428*)(C))->a9)!=(EIF_VOID));
	if (t1) {
		t2 = (((T406*)(GE_void(((T428*)(C))->a9)))->a18);
		R = ((t2)!=(EIF_VOID));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEYACC_TASK.is_executable */
T1 T318f22(T0* C)
{
	T1 R = 0;
	R = (T425f12(GE_void(((T318*)(C))->a1)));
	return R;
}

/* GEANT_GEYACC_COMMAND.is_executable */
T1 T425f12(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T425*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T425*)(C))->a4)))->id==17)?((T17*)(((T425*)(C))->a4))->a2:((T227*)(((T425*)(C))->a4))->a1));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GELEX_TASK.is_executable */
T1 T316f25(T0* C)
{
	T1 R = 0;
	R = (T422f16(GE_void(((T316*)(C))->a1)));
	return R;
}

/* GEANT_GELEX_COMMAND.is_executable */
T1 T422f16(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T422*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T422*)(C))->a4)))->id==17)?((T17*)(((T422*)(C))->a4))->a2:((T227*)(((T422*)(C))->a4))->a1));
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		if (((T422*)(C))->a9) {
			R = ((T1)(!(((T422*)(C))->a7)));
		} else {
			R = EIF_TRUE;
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEXACE_TASK.is_executable */
T1 T314f23(T0* C)
{
	T1 R = 0;
	R = (T419f13(GE_void(((T314*)(C))->a1)));
	return R;
}

/* GEANT_GEXACE_COMMAND.is_executable */
T1 T419f13(T0* C)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	T0* t5;
	T1 R = 0;
	t1 = (T419f14(C));
	t2 = (T419f15(C));
	t3 = (T419f16(C));
	t4 = (T419f17(C));
	t5 = GE_ma270((T6)3,(T6)3,
(int)(t2),
(int)(t3),
(int)(t4));
	R = (T561f1(GE_void(t1), t5));
	return R;
}

/* GEANT_GEXACE_COMMAND.boolean_ */
T0* T419f14(T0* C)
{
	T0* R = 0;
	if (ge123os5911) {
		return ge123ov5911;
	} else {
		ge123os5911 = '\1';
		ge123ov5911 = R;
	}
	R = T561c2();
	ge123ov5911 = R;
	return R;
}

/* GEANT_UNSET_TASK.is_executable */
T1 T312f10(T0* C)
{
	T1 R = 0;
	R = (T415f6(GE_void(((T312*)(C))->a1)));
	return R;
}

/* GEANT_UNSET_COMMAND.is_executable */
T1 T415f6(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T415*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T415*)(C))->a3)))->id==17)?((T17*)(((T415*)(C))->a3))->a2:((T227*)(((T415*)(C))->a3))->a1));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_SET_TASK.is_executable */
T1 T310f11(T0* C)
{
	T1 R = 0;
	R = (T412f7(GE_void(((T310*)(C))->a1)));
	return R;
}

/* GEANT_SET_COMMAND.is_executable */
T1 T412f7(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T412*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T412*)(C))->a3)))->id==17)?((T17*)(((T412*)(C))->a3))->a2:((T227*)(((T412*)(C))->a3))->a1));
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		R = ((((T412*)(C))->a4)!=(EIF_VOID));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_LCC_TASK.is_executable */
T1 T308f11(T0* C)
{
	T1 R = 0;
	R = (T409f7(GE_void(((T308*)(C))->a1)));
	return R;
}

/* GEANT_LCC_COMMAND.is_executable */
T1 T409f7(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T409*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T409*)(C))->a3)))->id==17)?((T17*)(((T409*)(C))->a3))->a2:((T227*)(((T409*)(C))->a3))->a1));
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		t1 = ((((T409*)(C))->a4)!=(EIF_VOID));
		if (t1) {
			t2 = (((((T0*)(GE_void(((T409*)(C))->a4)))->id==17)?((T17*)(((T409*)(C))->a4))->a2:((T227*)(((T409*)(C))->a4))->a1));
			R = (T6f1(&t2, (T6)(GE_int32(0))));
		} else {
			R = EIF_FALSE;
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_EXEC_TASK.is_executable */
T1 T306f7(T0* C)
{
	T1 R = 0;
	R = (T401f9(GE_void(((T306*)(C))->a1)));
	return R;
}

/* GEANT_EXEC_COMMAND.is_executable */
T1 T401f9(T0* C)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T0* l1 = 0;
	l1 = T559c2(EIF_TRUE);
	t1 = (T402f5(GE_void(((T401*)(C))->a1)));
	T401f17(C, t1, GE_ms8("  [echo] error: \'executable\' is not defined", 43), l1);
	t1 = (((T559*)(GE_void(l1)))->a1);
	if (t1) {
		t2 = (T402f6(GE_void(((T401*)(C))->a1)));
		t1 = (((((T0*)(GE_void(t2)))->id==17)?T17f32(t2):T227f53(t2)));
		t1 = ((T1)(!(t1)));
		T401f17(C, t1, GE_ms8("  [echo] error: \'executable\' is empty", 37), l1);
	}
	t1 = (((T559*)(GE_void(l1)))->a1);
	if (t1) {
		t1 = ((((T401*)(C))->a6)==(EIF_VOID));
		if (t1) {
			((T401*)(C))->a8 = EIF_TRUE;
			t1 = (T402f5(GE_void(((T401*)(C))->a2)));
			if (t1) {
				t2 = (T402f6(GE_void(((T401*)(C))->a2)));
				t1 = (((((T0*)(GE_void(t2)))->id==17)?T17f32(t2):T227f53(t2)));
				t1 = ((T1)(!(t1)));
				T401f17(C, t1, GE_ms8("  [echo] error: \'exit_code_variable\' may not be empty", 53), l1);
			}
		} else {
			((T401*)(C))->a8 = EIF_FALSE;
			t1 = (T402f5(GE_void(((T401*)(C))->a2)));
			t1 = ((T1)(!(t1)));
			T401f17(C, t1, GE_ms8("  [echo] error: \'exit_code_variable\' may not be defined together with \'fileset\'", 79), l1);
		}
	}
	R = (((T559*)(GE_void(l1)))->a1);
	return R;
}

/* GEANT_EXEC_COMMAND.validate_condition */
void T401f17(T0* C, T1 a1, T0* a2, T0* a3)
{
	T1 t1;
	T0* t2;
	t1 = (((T559*)(GE_void(a3)))->a1);
	if (t1) {
		t1 = ((T1)(!(a1)));
		if (t1) {
			T559f3(GE_void(a3), EIF_FALSE);
			t2 = (T401f12(C));
			T70f26(GE_void(t2), a2);
		}
	}
}

/* GEANT_EXEC_COMMAND.validation_messages */
T0* T401f12(T0* C)
{
	T0* R = 0;
	if (ge10os1913) {
		return ge10ov1913;
	} else {
		ge10os1913 = '\1';
		ge10ov1913 = R;
	}
	R = T70c22((T6)(GE_int32(5)));
	ge10ov1913 = R;
	return R;
}

/* GEANT_ISE_TASK.is_executable */
T1 T304f23(T0* C)
{
	T1 R = 0;
	R = (T397f11(GE_void(((T304*)(C))->a1)));
	return R;
}

/* GEANT_ISE_COMMAND.is_executable */
T1 T397f11(T0* C)
{
	T1 t1;
	T1 t2;
	T6 t3;
	T1 R = 0;
	t1 = (T397f14(C));
	t2 = (T397f15(C));
	R = ((T1)((t1)^(t2)));
	if (R) {
		t1 = ((((T397*)(C))->a9)==(EIF_VOID));
		if (!(t1)) {
			t3 = (((((T0*)(GE_void(((T397*)(C))->a9)))->id==17)?((T17*)(((T397*)(C))->a9))->a2:((T227*)(((T397*)(C))->a9))->a1));
			R = (T6f1(&t3, (T6)(GE_int32(0))));
		} else {
			R = EIF_TRUE;
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_ISE_COMMAND.is_cleanable */
T1 T397f15(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T397*)(C))->a5)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T397*)(C))->a5)))->id==17)?((T17*)(((T397*)(C))->a5))->a2:((T227*)(((T397*)(C))->a5))->a1));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEC_TASK.is_executable */
T1 T297f25(T0* C)
{
	T1 R = 0;
	R = (T393f15(GE_void(((T297*)(C))->a1)));
	return R;
}

/* GEANT_GEC_COMMAND.is_executable */
T1 T393f15(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = (T393f16(C));
	if (!(t1)) {
		R = (T393f17(C));
	} else {
		R = EIF_TRUE;
	}
	if (R) {
		t1 = ((((T393*)(C))->a12)==(EIF_VOID));
		if (!(t1)) {
			t2 = (((((T0*)(GE_void(((T393*)(C))->a12)))->id==17)?((T17*)(((T393*)(C))->a12))->a2:((T227*)(((T393*)(C))->a12))->a1));
			R = (T6f1(&t2, (T6)(GE_int32(0))));
		} else {
			R = EIF_TRUE;
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_REPLACE_TASK.is_enabled */
T1 T350f19(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T350f17(C));
	t2 = (((T22*)(GE_void(((T350*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T350f22(C));
	t3 = (T350f10(C, t1));
	if (t3) {
		t1 = (T350f22(C));
		t1 = (T102f13(GE_void(((T350*)(C))->a2), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T350f17(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T350*)(C))->a3), t1);
	}
	t1 = (T350f23(C));
	t3 = (T350f10(C, t1));
	if (t3) {
		t1 = (T350f23(C));
		t1 = (T102f13(GE_void(((T350*)(C))->a2), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T350f17(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T350*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_REPLACE_TASK.unless_attribute_name */
T0* T350f23(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_REPLACE_TASK.if_attribute_name */
T0* T350f22(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_INPUT_TASK.is_enabled */
T1 T348f21(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T348f19(C));
	t2 = (((T22*)(GE_void(((T348*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T348f24(C));
	t3 = (T348f11(C, t1));
	if (t3) {
		t1 = (T348f24(C));
		t1 = (T102f13(GE_void(((T348*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T348f19(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T348*)(C))->a3), t1);
	}
	t1 = (T348f25(C));
	t3 = (T348f11(C, t1));
	if (t3) {
		t1 = (T348f25(C));
		t1 = (T102f13(GE_void(((T348*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T348f19(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T348*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_INPUT_TASK.unless_attribute_name */
T0* T348f25(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_INPUT_TASK.if_attribute_name */
T0* T348f24(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_AVAILABLE_TASK.is_enabled */
T1 T346f7(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T346f10(C));
	t2 = (((T22*)(GE_void(((T346*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T346f11(C));
	t3 = (T346f12(C, t1));
	if (t3) {
		t1 = (T346f11(C));
		t1 = (T102f13(GE_void(((T346*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T346f10(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T346*)(C))->a3), t1);
	}
	t1 = (T346f13(C));
	t3 = (T346f12(C, t1));
	if (t3) {
		t1 = (T346f13(C));
		t1 = (T102f13(GE_void(((T346*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T346f10(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T346*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_AVAILABLE_TASK.unless_attribute_name */
T0* T346f13(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_AVAILABLE_TASK.has_attribute */
T1 T346f12(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T102f12(GE_void(((T346*)(C))->a4), a1));
	return R;
}

/* GEANT_AVAILABLE_TASK.if_attribute_name */
T0* T346f11(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_PRECURSOR_TASK.is_enabled */
T1 T344f18(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T344f16(C));
	t2 = (((T22*)(GE_void(((T344*)(C))->a2)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T344f21(C));
	t3 = (T344f9(C, t1));
	if (t3) {
		t1 = (T344f21(C));
		t1 = (T102f13(GE_void(((T344*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T344f16(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T344*)(C))->a2), t1);
	}
	t1 = (T344f22(C));
	t3 = (T344f9(C, t1));
	if (t3) {
		t1 = (T344f22(C));
		t1 = (T102f13(GE_void(((T344*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T344f16(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T344*)(C))->a2), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_PRECURSOR_TASK.unless_attribute_name */
T0* T344f22(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_PRECURSOR_TASK.if_attribute_name */
T0* T344f21(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_EXIT_TASK.is_enabled */
T1 T342f11(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T342f9(C));
	t2 = (((T22*)(GE_void(((T342*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T342f14(C));
	t3 = (T342f5(C, t1));
	if (t3) {
		t1 = (T342f14(C));
		t1 = (T102f13(GE_void(((T342*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T342f9(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T342*)(C))->a3), t1);
	}
	t1 = (T342f15(C));
	t3 = (T342f5(C, t1));
	if (t3) {
		t1 = (T342f15(C));
		t1 = (T102f13(GE_void(((T342*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T342f9(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T342*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_EXIT_TASK.unless_attribute_name */
T0* T342f15(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_EXIT_TASK.if_attribute_name */
T0* T342f14(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_OUTOFDATE_TASK.is_enabled */
T1 T340f16(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T340f14(C));
	t2 = (((T22*)(GE_void(((T340*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T340f19(C));
	t3 = (T340f9(C, t1));
	if (t3) {
		t1 = (T340f19(C));
		t1 = (T102f13(GE_void(((T340*)(C))->a2), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T340f14(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T340*)(C))->a3), t1);
	}
	t1 = (T340f20(C));
	t3 = (T340f9(C, t1));
	if (t3) {
		t1 = (T340f20(C));
		t1 = (T102f13(GE_void(((T340*)(C))->a2), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T340f14(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T340*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_OUTOFDATE_TASK.unless_attribute_name */
T0* T340f20(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_OUTOFDATE_TASK.if_attribute_name */
T0* T340f19(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_XSLT_TASK.is_enabled */
T1 T338f30(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T338f28(C));
	t2 = (((T22*)(GE_void(((T338*)(C))->a2)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T338f33(C));
	t3 = (T338f18(C, t1));
	if (t3) {
		t1 = (T338f33(C));
		t1 = (T102f13(GE_void(((T338*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T338f28(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T338*)(C))->a2), t1);
	}
	t1 = (T338f34(C));
	t3 = (T338f18(C, t1));
	if (t3) {
		t1 = (T338f34(C));
		t1 = (T102f13(GE_void(((T338*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T338f28(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T338*)(C))->a2), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_XSLT_TASK.unless_attribute_name */
T0* T338f34(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_XSLT_TASK.if_attribute_name */
T0* T338f33(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_SETENV_TASK.is_enabled */
T1 T336f12(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T336f10(C));
	t2 = (((T22*)(GE_void(((T336*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T336f15(C));
	t3 = (T336f6(C, t1));
	if (t3) {
		t1 = (T336f15(C));
		t1 = (T102f13(GE_void(((T336*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T336f10(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T336*)(C))->a3), t1);
	}
	t1 = (T336f16(C));
	t3 = (T336f6(C, t1));
	if (t3) {
		t1 = (T336f16(C));
		t1 = (T102f13(GE_void(((T336*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T336f10(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T336*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_SETENV_TASK.unless_attribute_name */
T0* T336f16(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_SETENV_TASK.if_attribute_name */
T0* T336f15(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_MOVE_TASK.is_enabled */
T1 T334f14(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T334f12(C));
	t2 = (((T22*)(GE_void(((T334*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T334f17(C));
	t3 = (T334f7(C, t1));
	if (t3) {
		t1 = (T334f17(C));
		t1 = (T102f13(GE_void(((T334*)(C))->a2), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T334f12(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T334*)(C))->a3), t1);
	}
	t1 = (T334f18(C));
	t3 = (T334f7(C, t1));
	if (t3) {
		t1 = (T334f18(C));
		t1 = (T102f13(GE_void(((T334*)(C))->a2), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T334f12(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T334*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_MOVE_TASK.unless_attribute_name */
T0* T334f18(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_MOVE_TASK.if_attribute_name */
T0* T334f17(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_COPY_TASK.is_enabled */
T1 T332f20(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T332f18(C));
	t2 = (((T22*)(GE_void(((T332*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T332f23(C));
	t3 = (T332f9(C, t1));
	if (t3) {
		t1 = (T332f23(C));
		t1 = (T102f13(GE_void(((T332*)(C))->a2), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T332f18(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T332*)(C))->a3), t1);
	}
	t1 = (T332f24(C));
	t3 = (T332f9(C, t1));
	if (t3) {
		t1 = (T332f24(C));
		t1 = (T102f13(GE_void(((T332*)(C))->a2), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T332f18(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T332*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_COPY_TASK.unless_attribute_name */
T0* T332f24(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_COPY_TASK.if_attribute_name */
T0* T332f23(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_DELETE_TASK.is_enabled */
T1 T330f14(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T330f12(C));
	t2 = (((T22*)(GE_void(((T330*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T330f17(C));
	t3 = (T330f6(C, t1));
	if (t3) {
		t1 = (T330f17(C));
		t1 = (T102f13(GE_void(((T330*)(C))->a2), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T330f12(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T330*)(C))->a3), t1);
	}
	t1 = (T330f18(C));
	t3 = (T330f6(C, t1));
	if (t3) {
		t1 = (T330f18(C));
		t1 = (T102f13(GE_void(((T330*)(C))->a2), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T330f12(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T330*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_DELETE_TASK.unless_attribute_name */
T0* T330f18(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_DELETE_TASK.if_attribute_name */
T0* T330f17(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_MKDIR_TASK.is_enabled */
T1 T328f7(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T328f10(C));
	t2 = (((T22*)(GE_void(((T328*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T328f11(C));
	t3 = (T328f12(C, t1));
	if (t3) {
		t1 = (T328f11(C));
		t1 = (T102f13(GE_void(((T328*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T328f10(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T328*)(C))->a3), t1);
	}
	t1 = (T328f13(C));
	t3 = (T328f12(C, t1));
	if (t3) {
		t1 = (T328f13(C));
		t1 = (T102f13(GE_void(((T328*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T328f10(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T328*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_MKDIR_TASK.unless_attribute_name */
T0* T328f13(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_MKDIR_TASK.has_attribute */
T1 T328f12(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T102f12(GE_void(((T328*)(C))->a4), a1));
	return R;
}

/* GEANT_MKDIR_TASK.if_attribute_name */
T0* T328f11(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_ECHO_TASK.is_enabled */
T1 T326f7(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T326f10(C));
	t2 = (((T22*)(GE_void(((T326*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T326f11(C));
	t3 = (T326f12(C, t1));
	if (t3) {
		t1 = (T326f11(C));
		t1 = (T102f13(GE_void(((T326*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T326f10(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T326*)(C))->a3), t1);
	}
	t1 = (T326f13(C));
	t3 = (T326f12(C, t1));
	if (t3) {
		t1 = (T326f13(C));
		t1 = (T102f13(GE_void(((T326*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T326f10(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T326*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_ECHO_TASK.unless_attribute_name */
T0* T326f13(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_ECHO_TASK.has_attribute */
T1 T326f12(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T102f12(GE_void(((T326*)(C))->a4), a1));
	return R;
}

/* GEANT_ECHO_TASK.if_attribute_name */
T0* T326f11(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_GEANT_TASK.is_enabled */
T1 T324f26(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T324f24(C));
	t2 = (((T22*)(GE_void(((T324*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T324f29(C));
	t3 = (T324f8(C, t1));
	if (t3) {
		t1 = (T324f29(C));
		t1 = (T102f13(GE_void(((T324*)(C))->a2), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T324f24(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T324*)(C))->a3), t1);
	}
	t1 = (T324f30(C));
	t3 = (T324f8(C, t1));
	if (t3) {
		t1 = (T324f30(C));
		t1 = (T102f13(GE_void(((T324*)(C))->a2), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T324f24(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T324*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEANT_TASK.unless_attribute_name */
T0* T324f30(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_GEANT_TASK.if_attribute_name */
T0* T324f29(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_GETEST_TASK.is_enabled */
T1 T322f28(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T322f24(C));
	t2 = (((T22*)(GE_void(((T322*)(C))->a2)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T322f31(C));
	t3 = (T322f17(C, t1));
	if (t3) {
		t1 = (T322f31(C));
		t1 = (T102f13(GE_void(((T322*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T322f24(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T322*)(C))->a2), t1);
	}
	t1 = (T322f32(C));
	t3 = (T322f17(C, t1));
	if (t3) {
		t1 = (T322f32(C));
		t1 = (T102f13(GE_void(((T322*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T322f24(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T322*)(C))->a2), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GETEST_TASK.unless_attribute_name */
T0* T322f32(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_GETEST_TASK.if_attribute_name */
T0* T322f31(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_GEPP_TASK.is_enabled */
T1 T320f23(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T320f21(C));
	t2 = (((T22*)(GE_void(((T320*)(C))->a2)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T320f26(C));
	t3 = (T320f10(C, t1));
	if (t3) {
		t1 = (T320f26(C));
		t1 = (T102f13(GE_void(((T320*)(C))->a3), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T320f21(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T320*)(C))->a2), t1);
	}
	t1 = (T320f27(C));
	t3 = (T320f10(C, t1));
	if (t3) {
		t1 = (T320f27(C));
		t1 = (T102f13(GE_void(((T320*)(C))->a3), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T320f21(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T320*)(C))->a2), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEPP_TASK.unless_attribute_name */
T0* T320f27(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_GEPP_TASK.if_attribute_name */
T0* T320f26(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_GEYACC_TASK.is_enabled */
T1 T318f23(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T318f17(C));
	t2 = (((T22*)(GE_void(((T318*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T318f26(C));
	t3 = (T318f13(C, t1));
	if (t3) {
		t1 = (T318f26(C));
		t1 = (T102f13(GE_void(((T318*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T318f17(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T318*)(C))->a3), t1);
	}
	t1 = (T318f27(C));
	t3 = (T318f13(C, t1));
	if (t3) {
		t1 = (T318f27(C));
		t1 = (T102f13(GE_void(((T318*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T318f17(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T318*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEYACC_TASK.unless_attribute_name */
T0* T318f27(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_GEYACC_TASK.if_attribute_name */
T0* T318f26(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_GELEX_TASK.is_enabled */
T1 T316f26(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T316f24(C));
	t2 = (((T22*)(GE_void(((T316*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T316f29(C));
	t3 = (T316f16(C, t1));
	if (t3) {
		t1 = (T316f29(C));
		t1 = (T102f13(GE_void(((T316*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T316f24(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T316*)(C))->a3), t1);
	}
	t1 = (T316f30(C));
	t3 = (T316f16(C, t1));
	if (t3) {
		t1 = (T316f30(C));
		t1 = (T102f13(GE_void(((T316*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T316f24(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T316*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GELEX_TASK.unless_attribute_name */
T0* T316f30(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_GELEX_TASK.if_attribute_name */
T0* T316f29(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_GEXACE_TASK.is_enabled */
T1 T314f24(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T314f18(C));
	t2 = (((T22*)(GE_void(((T314*)(C))->a2)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T314f27(C));
	t3 = (T314f14(C, t1));
	if (t3) {
		t1 = (T314f27(C));
		t1 = (T102f13(GE_void(((T314*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T314f18(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T314*)(C))->a2), t1);
	}
	t1 = (T314f28(C));
	t3 = (T314f14(C, t1));
	if (t3) {
		t1 = (T314f28(C));
		t1 = (T102f13(GE_void(((T314*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T314f18(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T314*)(C))->a2), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEXACE_TASK.unless_attribute_name */
T0* T314f28(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_GEXACE_TASK.if_attribute_name */
T0* T314f27(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_UNSET_TASK.is_enabled */
T1 T312f11(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T312f9(C));
	t2 = (((T22*)(GE_void(((T312*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T312f14(C));
	t3 = (T312f5(C, t1));
	if (t3) {
		t1 = (T312f14(C));
		t1 = (T102f13(GE_void(((T312*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T312f9(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T312*)(C))->a3), t1);
	}
	t1 = (T312f15(C));
	t3 = (T312f5(C, t1));
	if (t3) {
		t1 = (T312f15(C));
		t1 = (T102f13(GE_void(((T312*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T312f9(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T312*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_UNSET_TASK.unless_attribute_name */
T0* T312f15(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_UNSET_TASK.if_attribute_name */
T0* T312f14(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_SET_TASK.is_enabled */
T1 T310f12(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T310f10(C));
	t2 = (((T22*)(GE_void(((T310*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T310f15(C));
	t3 = (T310f6(C, t1));
	if (t3) {
		t1 = (T310f15(C));
		t1 = (T102f13(GE_void(((T310*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T310f10(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T310*)(C))->a3), t1);
	}
	t1 = (T310f16(C));
	t3 = (T310f6(C, t1));
	if (t3) {
		t1 = (T310f16(C));
		t1 = (T102f13(GE_void(((T310*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T310f10(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T310*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_SET_TASK.unless_attribute_name */
T0* T310f16(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_SET_TASK.if_attribute_name */
T0* T310f15(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_LCC_TASK.is_enabled */
T1 T308f12(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T308f10(C));
	t2 = (((T22*)(GE_void(((T308*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T308f15(C));
	t3 = (T308f6(C, t1));
	if (t3) {
		t1 = (T308f15(C));
		t1 = (T102f13(GE_void(((T308*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T308f10(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T308*)(C))->a3), t1);
	}
	t1 = (T308f16(C));
	t3 = (T308f6(C, t1));
	if (t3) {
		t1 = (T308f16(C));
		t1 = (T102f13(GE_void(((T308*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T308f10(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T308*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_LCC_TASK.unless_attribute_name */
T0* T308f16(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_LCC_TASK.if_attribute_name */
T0* T308f15(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_EXEC_TASK.is_enabled */
T1 T306f8(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T306f11(C));
	t2 = (((T22*)(GE_void(((T306*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T306f12(C));
	t3 = (T306f13(C, t1));
	if (t3) {
		t1 = (T306f12(C));
		t1 = (T102f13(GE_void(((T306*)(C))->a2), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T306f11(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T306*)(C))->a3), t1);
	}
	t1 = (T306f14(C));
	t3 = (T306f13(C, t1));
	if (t3) {
		t1 = (T306f14(C));
		t1 = (T102f13(GE_void(((T306*)(C))->a2), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T306f11(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T306*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_EXEC_TASK.unless_attribute_name */
T0* T306f14(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_EXEC_TASK.has_attribute */
T1 T306f13(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T102f12(GE_void(((T306*)(C))->a2), a1));
	return R;
}

/* GEANT_EXEC_TASK.if_attribute_name */
T0* T306f12(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_ISE_TASK.is_enabled */
T1 T304f24(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T304f22(C));
	t2 = (((T22*)(GE_void(((T304*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T304f27(C));
	t3 = (T304f14(C, t1));
	if (t3) {
		t1 = (T304f27(C));
		t1 = (T102f13(GE_void(((T304*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T304f22(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T304*)(C))->a3), t1);
	}
	t1 = (T304f28(C));
	t3 = (T304f14(C, t1));
	if (t3) {
		t1 = (T304f28(C));
		t1 = (T102f13(GE_void(((T304*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T304f22(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T304*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_ISE_TASK.unless_attribute_name */
T0* T304f28(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_ISE_TASK.if_attribute_name */
T0* T304f27(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_GEC_TASK.is_enabled */
T1 T297f26(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T297f24(C));
	t2 = (((T22*)(GE_void(((T297*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T297f29(C));
	t3 = (T297f16(C, t1));
	if (t3) {
		t1 = (T297f29(C));
		t1 = (T102f13(GE_void(((T297*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T297f24(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T297*)(C))->a3), t1);
	}
	t1 = (T297f30(C));
	t3 = (T297f16(C, t1));
	if (t3) {
		t1 = (T297f30(C));
		t1 = (T102f13(GE_void(((T297*)(C))->a4), t1));
		l3 = (((T219*)(GE_void(t1)))->a3);
		t1 = (T297f24(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T297*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEC_TASK.unless_attribute_name */
T0* T297f30(T0* C)
{
	T0* R = 0;
	if (ge86os2542) {
		return ge86ov2542;
	} else {
		ge86os2542 = '\1';
		ge86ov2542 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2542 = R;
	return R;
}

/* GEANT_GEC_TASK.if_attribute_name */
T0* T297f29(T0* C)
{
	T0* R = 0;
	if (ge86os2541) {
		return ge86ov2541;
	} else {
		ge86os2541 = '\1';
		ge86ov2541 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2541 = R;
	return R;
}

/* GEANT_REPLACE_TASK.is_exit_command */
T1 T350f20(T0* C)
{
	T1 R = 0;
	R = (T478f13(GE_void(((T350*)(C))->a1)));
	return R;
}

/* GEANT_REPLACE_COMMAND.is_exit_command */
T1 T478f13(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_INPUT_TASK.is_exit_command */
T1 T348f22(T0* C)
{
	T1 R = 0;
	R = (T475f10(GE_void(((T348*)(C))->a1)));
	return R;
}

/* GEANT_INPUT_COMMAND.is_exit_command */
T1 T475f10(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_AVAILABLE_TASK.is_exit_command */
T1 T346f8(T0* C)
{
	T1 R = 0;
	R = (T472f14(GE_void(((T346*)(C))->a1)));
	return R;
}

/* GEANT_AVAILABLE_COMMAND.is_exit_command */
T1 T472f14(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_PRECURSOR_TASK.is_exit_command */
T1 T344f19(T0* C)
{
	T1 R = 0;
	R = (T469f6(GE_void(((T344*)(C))->a1)));
	return R;
}

/* GEANT_PRECURSOR_COMMAND.is_exit_command */
T1 T469f6(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_EXIT_TASK.is_exit_command */
T1 T342f12(T0* C)
{
	T1 R = 0;
	R = (EIF_TRUE);
	return R;
}

/* GEANT_OUTOFDATE_TASK.is_exit_command */
T1 T340f17(T0* C)
{
	T1 R = 0;
	R = (T463f16(GE_void(((T340*)(C))->a1)));
	return R;
}

/* GEANT_OUTOFDATE_COMMAND.is_exit_command */
T1 T463f16(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_XSLT_TASK.is_exit_command */
T1 T338f31(T0* C)
{
	T1 R = 0;
	R = (T459f18(GE_void(((T338*)(C))->a1)));
	return R;
}

/* GEANT_XSLT_COMMAND.is_exit_command */
T1 T459f18(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_SETENV_TASK.is_exit_command */
T1 T336f13(T0* C)
{
	T1 R = 0;
	R = (T455f6(GE_void(((T336*)(C))->a1)));
	return R;
}

/* GEANT_SETENV_COMMAND.is_exit_command */
T1 T455f6(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_MOVE_TASK.is_exit_command */
T1 T334f15(T0* C)
{
	T1 R = 0;
	R = (T452f8(GE_void(((T334*)(C))->a1)));
	return R;
}

/* GEANT_MOVE_COMMAND.is_exit_command */
T1 T452f8(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_COPY_TASK.is_exit_command */
T1 T332f21(T0* C)
{
	T1 R = 0;
	R = (T449f9(GE_void(((T332*)(C))->a1)));
	return R;
}

/* GEANT_COPY_COMMAND.is_exit_command */
T1 T449f9(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_DELETE_TASK.is_exit_command */
T1 T330f15(T0* C)
{
	T1 R = 0;
	R = (T445f8(GE_void(((T330*)(C))->a1)));
	return R;
}

/* GEANT_DELETE_COMMAND.is_exit_command */
T1 T445f8(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_MKDIR_TASK.is_exit_command */
T1 T328f8(T0* C)
{
	T1 R = 0;
	R = (T441f11(GE_void(((T328*)(C))->a1)));
	return R;
}

/* GEANT_MKDIR_COMMAND.is_exit_command */
T1 T441f11(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_ECHO_TASK.is_exit_command */
T1 T326f8(T0* C)
{
	T1 R = 0;
	R = (T438f10(GE_void(((T326*)(C))->a1)));
	return R;
}

/* GEANT_ECHO_COMMAND.is_exit_command */
T1 T438f10(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_GEANT_TASK.is_exit_command */
T1 T324f27(T0* C)
{
	T1 R = 0;
	R = (T434f12(GE_void(((T324*)(C))->a1)));
	return R;
}

/* GEANT_GEANT_COMMAND.is_exit_command */
T1 T434f12(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_GETEST_TASK.is_exit_command */
T1 T322f29(T0* C)
{
	T1 R = 0;
	R = (T431f15(GE_void(((T322*)(C))->a1)));
	return R;
}

/* GEANT_GETEST_COMMAND.is_exit_command */
T1 T431f15(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_GEPP_TASK.is_exit_command */
T1 T320f24(T0* C)
{
	T1 R = 0;
	R = (T428f11(GE_void(((T320*)(C))->a1)));
	return R;
}

/* GEANT_GEPP_COMMAND.is_exit_command */
T1 T428f11(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_GEYACC_TASK.is_exit_command */
T1 T318f24(T0* C)
{
	T1 R = 0;
	R = (T425f11(GE_void(((T318*)(C))->a1)));
	return R;
}

/* GEANT_GEYACC_COMMAND.is_exit_command */
T1 T425f11(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_GELEX_TASK.is_exit_command */
T1 T316f27(T0* C)
{
	T1 R = 0;
	R = (T422f15(GE_void(((T316*)(C))->a1)));
	return R;
}

/* GEANT_GELEX_COMMAND.is_exit_command */
T1 T422f15(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_GEXACE_TASK.is_exit_command */
T1 T314f25(T0* C)
{
	T1 R = 0;
	R = (T419f12(GE_void(((T314*)(C))->a1)));
	return R;
}

/* GEANT_GEXACE_COMMAND.is_exit_command */
T1 T419f12(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_UNSET_TASK.is_exit_command */
T1 T312f12(T0* C)
{
	T1 R = 0;
	R = (T415f5(GE_void(((T312*)(C))->a1)));
	return R;
}

/* GEANT_UNSET_COMMAND.is_exit_command */
T1 T415f5(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_SET_TASK.is_exit_command */
T1 T310f13(T0* C)
{
	T1 R = 0;
	R = (T412f6(GE_void(((T310*)(C))->a1)));
	return R;
}

/* GEANT_SET_COMMAND.is_exit_command */
T1 T412f6(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_LCC_TASK.is_exit_command */
T1 T308f13(T0* C)
{
	T1 R = 0;
	R = (T409f6(GE_void(((T308*)(C))->a1)));
	return R;
}

/* GEANT_LCC_COMMAND.is_exit_command */
T1 T409f6(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_EXEC_TASK.is_exit_command */
T1 T306f9(T0* C)
{
	T1 R = 0;
	R = (T401f10(GE_void(((T306*)(C))->a1)));
	return R;
}

/* GEANT_EXEC_COMMAND.is_exit_command */
T1 T401f10(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_ISE_TASK.is_exit_command */
T1 T304f25(T0* C)
{
	T1 R = 0;
	R = (T397f12(GE_void(((T304*)(C))->a1)));
	return R;
}

/* GEANT_ISE_COMMAND.is_exit_command */
T1 T397f12(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_GEC_TASK.is_exit_command */
T1 T297f27(T0* C)
{
	T1 R = 0;
	R = (T393f14(GE_void(((T297*)(C))->a1)));
	return R;
}

/* GEANT_GEC_COMMAND.is_exit_command */
T1 T393f14(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_REPLACE_TASK.exit_code */
T6 T350f21(T0* C)
{
	T6 R = 0;
	R = (((T478*)(GE_void(((T350*)(C))->a1)))->a12);
	return R;
}

/* GEANT_INPUT_TASK.exit_code */
T6 T348f23(T0* C)
{
	T6 R = 0;
	R = (((T475*)(GE_void(((T348*)(C))->a1)))->a9);
	return R;
}

/* GEANT_AVAILABLE_TASK.exit_code */
T6 T346f9(T0* C)
{
	T6 R = 0;
	R = (((T472*)(GE_void(((T346*)(C))->a1)))->a8);
	return R;
}

/* GEANT_PRECURSOR_TASK.exit_code */
T6 T344f20(T0* C)
{
	T6 R = 0;
	R = (((T469*)(GE_void(((T344*)(C))->a1)))->a5);
	return R;
}

/* GEANT_EXIT_TASK.exit_code */
T6 T342f13(T0* C)
{
	T6 R = 0;
	R = (((T466*)(GE_void(((T342*)(C))->a1)))->a4);
	return R;
}

/* GEANT_OUTOFDATE_TASK.exit_code */
T6 T340f18(T0* C)
{
	T6 R = 0;
	R = (((T463*)(GE_void(((T340*)(C))->a1)))->a9);
	return R;
}

/* GEANT_XSLT_TASK.exit_code */
T6 T338f32(T0* C)
{
	T6 R = 0;
	R = (((T459*)(GE_void(((T338*)(C))->a1)))->a13);
	return R;
}

/* GEANT_SETENV_TASK.exit_code */
T6 T336f14(T0* C)
{
	T6 R = 0;
	R = (((T455*)(GE_void(((T336*)(C))->a1)))->a5);
	return R;
}

/* GEANT_MOVE_TASK.exit_code */
T6 T334f16(T0* C)
{
	T6 R = 0;
	R = (((T452*)(GE_void(((T334*)(C))->a1)))->a7);
	return R;
}

/* GEANT_COPY_TASK.exit_code */
T6 T332f22(T0* C)
{
	T6 R = 0;
	R = (((T449*)(GE_void(((T332*)(C))->a1)))->a8);
	return R;
}

/* GEANT_DELETE_TASK.exit_code */
T6 T330f16(T0* C)
{
	T6 R = 0;
	R = (((T445*)(GE_void(((T330*)(C))->a1)))->a7);
	return R;
}

/* GEANT_MKDIR_TASK.exit_code */
T6 T328f9(T0* C)
{
	T6 R = 0;
	R = (((T441*)(GE_void(((T328*)(C))->a1)))->a5);
	return R;
}

/* GEANT_ECHO_TASK.exit_code */
T6 T326f9(T0* C)
{
	T6 R = 0;
	R = (((T438*)(GE_void(((T326*)(C))->a1)))->a8);
	return R;
}

/* GEANT_GEANT_TASK.exit_code */
T6 T324f28(T0* C)
{
	T6 R = 0;
	R = (((T434*)(GE_void(((T324*)(C))->a1)))->a11);
	return R;
}

/* GEANT_GETEST_TASK.exit_code */
T6 T322f30(T0* C)
{
	T6 R = 0;
	R = (((T431*)(GE_void(((T322*)(C))->a1)))->a14);
	return R;
}

/* GEANT_GEPP_TASK.exit_code */
T6 T320f25(T0* C)
{
	T6 R = 0;
	R = (((T428*)(GE_void(((T320*)(C))->a1)))->a10);
	return R;
}

/* GEANT_GEYACC_TASK.exit_code */
T6 T318f25(T0* C)
{
	T6 R = 0;
	R = (((T425*)(GE_void(((T318*)(C))->a1)))->a10);
	return R;
}

/* GEANT_GELEX_TASK.exit_code */
T6 T316f28(T0* C)
{
	T6 R = 0;
	R = (((T422*)(GE_void(((T316*)(C))->a1)))->a14);
	return R;
}

/* GEANT_GEXACE_TASK.exit_code */
T6 T314f26(T0* C)
{
	T6 R = 0;
	R = (((T419*)(GE_void(((T314*)(C))->a1)))->a11);
	return R;
}

/* GEANT_UNSET_TASK.exit_code */
T6 T312f13(T0* C)
{
	T6 R = 0;
	R = (((T415*)(GE_void(((T312*)(C))->a1)))->a4);
	return R;
}

/* GEANT_SET_TASK.exit_code */
T6 T310f14(T0* C)
{
	T6 R = 0;
	R = (((T412*)(GE_void(((T310*)(C))->a1)))->a5);
	return R;
}

/* GEANT_LCC_TASK.exit_code */
T6 T308f14(T0* C)
{
	T6 R = 0;
	R = (((T409*)(GE_void(((T308*)(C))->a1)))->a5);
	return R;
}

/* GEANT_EXEC_TASK.exit_code */
T6 T306f10(T0* C)
{
	T6 R = 0;
	R = (((T401*)(GE_void(((T306*)(C))->a1)))->a7);
	return R;
}

/* GEANT_ISE_TASK.exit_code */
T6 T304f26(T0* C)
{
	T6 R = 0;
	R = (((T397*)(GE_void(((T304*)(C))->a1)))->a10);
	return R;
}

/* GEANT_GEC_TASK.exit_code */
T6 T297f28(T0* C)
{
	T6 R = 0;
	R = (((T393*)(GE_void(((T297*)(C))->a1)))->a13);
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.error_position */
T0* T186f58(T0* C)
{
	T0* R = 0;
	R = T143c5(((T186*)(C))->a8, ((T186*)(C))->a19, ((T186*)(C))->a18, ((T186*)(C))->a17);
	return R;
}

/* XM_DEFAULT_POSITION.make */
T0* T143c5(T0* a1, T6 a2, T6 a3, T6 a4)
{
	T0* C;
	C = GE_new143(EIF_TRUE);
	((T143*)(C))->a1 = a1;
	((T143*)(C))->a4 = a2;
	((T143*)(C))->a3 = a3;
	((T143*)(C))->a2 = a4;
	return C;
}

/* XM_EIFFEL_SCANNER_DTD.error_position */
T0* T184f56(T0* C)
{
	T0* R = 0;
	R = T143c5(((T184*)(C))->a3, ((T184*)(C))->a4, ((T184*)(C))->a5, ((T184*)(C))->a6);
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.error_position */
T0* T183f56(T0* C)
{
	T0* R = 0;
	R = T143c5(((T183*)(C))->a8, ((T183*)(C))->a19, ((T183*)(C))->a18, ((T183*)(C))->a17);
	return R;
}

/* XM_EIFFEL_SCANNER.error_position */
T0* T142f66(T0* C)
{
	T0* R = 0;
	R = T143c5(((T142*)(C))->a3, ((T142*)(C))->a4, ((T142*)(C))->a5, ((T142*)(C))->a6);
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.end_of_file */
T1 T186f60(T0* C)
{
	T1 R = 0;
	R = (((((((T186*)(C))->a45) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.end_of_file */
T1 T184f63(T0* C)
{
	T1 R = 0;
	R = (((((((T184*)(C))->a1) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.end_of_file */
T1 T183f58(T0* C)
{
	T1 R = 0;
	R = (((((((T183*)(C))->a43) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_EIFFEL_SCANNER.end_of_file */
T1 T142f67(T0* C)
{
	T1 R = 0;
	R = (((((((T142*)(C))->a1) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.is_applicable_encoding */
T1 T186f61(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	{
		t1 = (((T186*)(C))->a46?((m1 = ((T186*)(C))->a46, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(7);
		}		t1 = (T228f9(m1, a1));
		if (t1) {
			R = (T228f16(m1, a1));
		} else {
			R = EIF_FALSE;
		}
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.is_applicable_encoding */
T1 T228f16(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	t1 = (((((((T228*)(C))->a2) == ((T6)(GE_int32(6)))))));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T228f17(C));
		t1 = (T75f11(GE_void(t2), a1, ge1791ov8466));
		if (!(t1)) {
			t2 = (T228f17(C));
			t1 = (T75f11(GE_void(t2), a1, ge1791ov8465));
		}
		if (t1) {
			t1 = (((((((T228*)(C))->a2) == ((T6)(GE_int32(2)))))));
			if (!(t1)) {
				t1 = (((((((T228*)(C))->a2) == ((T6)(GE_int32(1)))))));
			}
			if (!(t1)) {
				R = (((((((T228*)(C))->a2) == ((T6)(GE_int32(3)))))));
			} else {
				R = EIF_TRUE;
			}
		} else {
			t2 = (T228f17(C));
			t1 = (T75f11(GE_void(t2), a1, ge1791ov8467));
			if (t1) {
				t1 = (((((((T228*)(C))->a2) == ((T6)(GE_int32(2)))))));
				if (!(t1)) {
					R = (((((((T228*)(C))->a2) == ((T6)(GE_int32(1)))))));
				} else {
					R = EIF_TRUE;
				}
			} else {
				t2 = (T228f17(C));
				t1 = (T75f11(GE_void(t2), a1, ge1791ov8468));
				if (t1) {
					t1 = (((((((T228*)(C))->a2) == ((T6)(GE_int32(4)))))));
					if (!(t1)) {
						R = (((((((T228*)(C))->a2) == ((T6)(GE_int32(5)))))));
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
T1 T228f9(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T228f17(C));
		t1 = (T75f11(GE_void(t2), a1, ge1791ov8466));
		if (!(t1)) {
			t2 = (T228f17(C));
			t1 = (T75f11(GE_void(t2), a1, ge1791ov8465));
		}
		if (!(t1)) {
			t2 = (T228f17(C));
			t1 = (T75f11(GE_void(t2), a1, ge1791ov8467));
		}
		if (!(t1)) {
			t2 = (T228f17(C));
			R = (T75f11(GE_void(t2), a1, ge1791ov8468));
		} else {
			R = EIF_TRUE;
		}
	}
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.is_applicable_encoding */
T1 T184f49(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	{
		t1 = (((T184*)(C))->a7?((m1 = ((T184*)(C))->a7, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(7);
		}		t1 = (T228f9(m1, a1));
		if (t1) {
			R = (T228f16(m1, a1));
		} else {
			R = EIF_FALSE;
		}
	}
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.is_applicable_encoding */
T1 T183f59(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	{
		t1 = (((T183*)(C))->a44?((m1 = ((T183*)(C))->a44, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(7);
		}		t1 = (T228f9(m1, a1));
		if (t1) {
			R = (T228f16(m1, a1));
		} else {
			R = EIF_FALSE;
		}
	}
	return R;
}

/* XM_EIFFEL_SCANNER.is_applicable_encoding */
T1 T142f68(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	{
		t1 = (((T142*)(C))->a7?((m1 = ((T142*)(C))->a7, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(7);
		}		t1 = (T228f9(m1, a1));
		if (t1) {
			R = (T228f16(m1, a1));
		} else {
			R = EIF_FALSE;
		}
	}
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.start_condition */
T6 T186f62(T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((((T186*)(C))->a13)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.start_condition */
T6 T184f51(T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((((T184*)(C))->a8)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.start_condition */
T6 T183f60(T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((((T183*)(C))->a13)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* XM_EIFFEL_SCANNER.start_condition */
T6 T142f44(T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((((T142*)(C))->a8)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_item */
T0* T83f23(T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T64*)(a1))->a2);
	R = (T83f25(C, t1));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.cursor_item */
T0* T34f35(T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T64*)(GE_void(a1)))->a2);
	R = (T34f38(C, t1));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.item_storage_item */
T0* T34f38(T0* C, T6 a1)
{
	T0* R = 0;
	R = (((T32*)(GE_void(((T34*)(C))->a13)))->z2[a1]);
	return R;
}

/* GEANT_VARIABLES.cursor_item */
T0* T29f37(T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T64*)(GE_void(a1)))->a2);
	R = (T29f35(C, t1));
	return R;
}

/* GEANT_PROJECT_VARIABLES.cursor_item */
T0* T25f49(T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T64*)(GE_void(a1)))->a2);
	R = (T25f48(C, t1));
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_key */
T0* T83f24(T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T64*)(a1))->a2);
	R = (T83f26(C, t1));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.cursor_key */
T0* T34f36(T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T64*)(GE_void(a1)))->a2);
	R = (T34f30(C, t1));
	return R;
}

/* GEANT_VARIABLES.cursor_key */
T0* T29f38(T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T64*)(GE_void(a1)))->a2);
	R = (T29f30(C, t1));
	return R;
}

/* GEANT_PROJECT_VARIABLES.cursor_key */
T0* T25f50(T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T64*)(GE_void(a1)))->a2);
	R = (T25f28(C, t1));
	return R;
}

/* UC_UTF8_STRING.character_32_item */
T3 T227f38(T0* C, T6 a1)
{
	T10 t1;
	T3 R = 0;
	t1 = (T227f34(C, a1));
	R = ((T3)(t1));
	return R;
}

/* IMMUTABLE_STRING_32.item */
T3 T85f7(T0* C, T6 a1)
{
	T6 t1;
	T3 R = 0;
	t1 = ((T6)((a1)+(((T85*)(C))->a4)));
	t1 = ((T6)((t1)-((T6)(GE_int32(1)))));
	R = (((T16*)(GE_void(((T85*)(C))->a1)))->z2[t1]);
	return R;
}

/* STRING_32.item */
T3 T18f10(T0* C, T6 a1)
{
	T6 t1;
	T3 R = 0;
	t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
	R = (((T16*)(GE_void(((T18*)(C))->a1)))->z2[t1]);
	return R;
}

/* STRING_8.character_32_item */
T3 T17f21(T0* C, T6 a1)
{
	T10 t1;
	T3 R = 0;
	t1 = (T17f23(C, a1));
	R = ((T3)(t1));
	return R;
}

/* UC_UTF8_STRING.substring */
T0* T227f39(T0* C, T6 a1, T6 a2)
{
	T1 t1;
	T0* R = 0;
	t1 = ((T1)((a2)<(a1)));
	if (t1) {
		R = T227c65((T6)(GE_int32(0)));
	} else {
		R = T227c66(C, a1, a2);
	}
	return R;
}

/* UC_UTF8_STRING.make_from_substring */
T0* T227c66(T0* a1, T6 a2, T6 a3)
{
	T0* C;
	C = GE_new227(EIF_TRUE);
	T227f76(C, a1, a2, a3);
	return C;
}

/* UC_UTF8_STRING.make_from_substring_general */
void T227f76(T0* C, T0* a1, T6 a2, T6 a3)
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
		((T227*)(C))->a2 = (((T227*)(GE_void(l3)))->a2);
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
		t1 = (((((a3) == (((T227*)(C))->a1)))));
	}
	if (t1) {
		((T227*)(C))->a2 = (((T227*)(GE_void(l3)))->a2);
	} else {
		t1 = ((T1)((a3)<(a2)));
		if (t1) {
			T227f65(C, (T6)(GE_int32(0)));
		} else {
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				l2 = (T227f41(GE_void(l3)));
			} else {
				l2 = a1;
			}
			t2 = (T227f29(C));
			l1 = (T226f22(GE_void(t2), l2, a2, a3));
			T227f65(C, l1);
			t3 = ((T6)((a3)-(a2)));
			t3 = ((T6)((t3)+((T6)(GE_int32(1)))));
			T227f67(C, t3);
			((T227*)(C))->a3 = l1;
			T227f73(C, l2, a2, a3, l1, (T6)(GE_int32(1)));
		}
	}
}

/* IMMUTABLE_STRING_32.substring */
T0* T85f8(T0* C, T6 a1, T6 a2)
{
	T6 t1;
	T1 t2;
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	t1 = (T6)(GE_int32(1));
	t2 = (T6f5(&t1, a1));
	if (t2) {
		t2 = (T6f5(&a1, a2));
	}
	if (t2) {
		t2 = (T6f5(&a2, ((T85*)(C))->a2));
	}
	if (t2) {
		t1 = ((T6)((a2)-(a1)));
		l2 = ((T6)((t1)+((T6)(GE_int32(1)))));
		t1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		l1 = T16c7(t1);
		t1 = ((T6)((((T85*)(C))->a4)+(a1)));
		t1 = ((T6)((t1)-((T6)(GE_int32(1)))));
		T16f8(GE_void(l1), ((T85*)(C))->a1, t1, (T6)(GE_int32(0)), l2);
		T16f16(GE_void(l1), (T3)(GE_nat32(0)));
		R = T85c17(l1, (T6)(GE_int32(0)), l2);
	} else {
		R = (T85f9(C));
	}
	return R;
}

/* IMMUTABLE_STRING_32.empty_string */
unsigned char ge1490os5791 = '\0';
T0* ge1490ov5791;
T0* T85f9(T0* C)
{
	T0* R = 0;
	if (ge1490os5791) {
		return ge1490ov5791;
	} else {
		ge1490os5791 = '\1';
		ge1490ov5791 = R;
	}
	R = T85c15((T6)(GE_int32(0)));
	ge1490ov5791 = R;
	return R;
}

/* STRING_32.substring */
T0* T18f11(T0* C, T6 a1, T6 a2)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T6 t4;
	T0* R = 0;
	t1 = (T6)(GE_int32(1));
	t2 = (T6f5(&t1, a1));
	if (t2) {
		t2 = (T6f5(&a1, a2));
	}
	if (t2) {
		t2 = (T6f5(&a2, ((T18*)(C))->a2));
	}
	if (t2) {
		t1 = ((T6)((a2)-(a1)));
		t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
		R = (T18f12(C, t1));
		t3 = (((T18*)(GE_void(R)))->a1);
		t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
		t4 = ((T6)((a2)-(a1)));
		t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
		T16f8(GE_void(t3), ((T18*)(C))->a1, t1, (T6)(GE_int32(0)), t4);
		t1 = ((T6)((a2)-(a1)));
		t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
		T18f21(GE_void(R), t1);
	} else {
		R = (T18f12(C, (T6)(GE_int32(0))));
	}
	return R;
}

/* STRING_32.new_string */
T0* T18f12(T0* C, T6 a1)
{
	T0* R = 0;
	R = T18c13(a1);
	return R;
}

/* STRING_8.substring */
T0* T17f11(T0* C, T6 a1, T6 a2)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T6 t4;
	T0* R = 0;
	t1 = (T6)(GE_int32(1));
	t2 = (T6f5(&t1, a1));
	if (t2) {
		t2 = (T6f5(&a1, a2));
	}
	if (t2) {
		t2 = (T6f5(&a2, ((T17*)(C))->a2));
	}
	if (t2) {
		t1 = ((T6)((a2)-(a1)));
		t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
		R = (T17f22(C, t1));
		t3 = (((T17*)(GE_void(R)))->a1);
		t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
		t4 = ((T6)((a2)-(a1)));
		t4 = ((T6)((t4)+((T6)(GE_int32(1)))));
		T15f13(GE_void(t3), ((T17*)(C))->a1, t1, (T6)(GE_int32(0)), t4);
		t1 = ((T6)((a2)-(a1)));
		t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
		T17f44(GE_void(R), t1);
	} else {
		R = (T17f22(C, (T6)(GE_int32(0))));
	}
	return R;
}

/* UC_UTF8_STRING.code */
T10 T227f34(T0* C, T6 a1)
{
	T6 t1;
	T10 R = 0;
	t1 = (T227f17(C, a1));
	R = ((T10)(t1));
	return R;
}

/* IMMUTABLE_STRING_32.code */
T10 T85f5(T0* C, T6 a1)
{
	T6 t1;
	T3 t2;
	T10 R = 0;
	t1 = ((T6)((a1)+(((T85*)(C))->a4)));
	t1 = ((T6)((t1)-((T6)(GE_int32(1)))));
	t2 = (((T16*)(GE_void(((T85*)(C))->a1)))->z2[t1]);
	R = ((T10)(t2));
	return R;
}

/* STRING_32.code */
T10 T18f5(T0* C, T6 a1)
{
	T6 t1;
	T3 t2;
	T10 R = 0;
	t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
	t2 = (((T16*)(GE_void(((T18*)(C))->a1)))->z2[t1]);
	t1 = ((T6)(t2));
	R = (T6f13(&t1));
	return R;
}

/* STRING_8.code */
T10 T17f23(T0* C, T6 a1)
{
	T6 t1;
	T2 t2;
	T10 R = 0;
	t1 = ((T6)((a1)-((T6)(GE_int32(1)))));
	t2 = (((T15*)(GE_void(((T17*)(C))->a1)))->z2[t1]);
	t1 = ((T6)(t2));
	R = (T6f13(&t1));
	return R;
}

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.default_message */
T0* T606f5(T0* C)
{
	T0* R = 0;
	R = (T606f3(C, ge294ov3038));
	return R;
}

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.message */
T0* T606f3(T0* C, T0* a1)
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
	t1 = (T606f4(C));
	R = (T75f3(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T227f60(R, l5);
				}
			} else {
				t1 = (T606f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T75f4(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T227f60(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T227f60(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T606f4(C));
					l1 = (T75f3(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T227f60(l1, l5);
									}
								} else {
									t1 = (T606f4(C));
									T75f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T227f60(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T227f49(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T227f50(l1)));
						t2 = (T33f5(GE_void(((T606*)(C))->a1), l3));
						if (t2) {
							t1 = (T606f4(C));
							t5 = (T33f4(GE_void(((T606*)(C))->a1), l3));
							R = (T75f5(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T606f4(C));
								t5 = (T606f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T75f5(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T227f60(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T227f60(R, (T2)('{'));
									}
								}
								t1 = (T606f4(C));
								R = (T75f5(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T227f60(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T227f60(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T227f60(R, (T2)('{'));
							}
						}
						t1 = (T606f4(C));
						R = (T75f5(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T227f60(R, (T2)('}'));
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
T0* T606f6(T0* C)
{
	T0* R = 0;
	if (ge202os1931) {
		return ge202ov1931;
	} else {
		ge202os1931 = '\1';
		ge202ov1931 = R;
	}
	R = T27c5();
	ge202ov1931 = R;
	return R;
}

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.string_ */
T0* T606f4(T0* C)
{
	T0* R = 0;
	if (ge128os1922) {
		return ge128ov1922;
	} else {
		ge128os1922 = '\1';
		ge128ov1922 = R;
	}
	R = T75c19();
	ge128ov1922 = R;
	return R;
}

/* LX_CHARACTER_OUT_OF_RANGE_ERROR.default_message */
T0* T592f5(T0* C)
{
	T0* R = 0;
	R = (T592f3(C, ge280ov3038));
	return R;
}

/* LX_CHARACTER_OUT_OF_RANGE_ERROR.message */
T0* T592f3(T0* C, T0* a1)
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
	t1 = (T592f4(C));
	R = (T75f3(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T227f60(R, l5);
				}
			} else {
				t1 = (T592f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T75f4(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T227f60(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T227f60(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T592f4(C));
					l1 = (T75f3(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T227f60(l1, l5);
									}
								} else {
									t1 = (T592f4(C));
									T75f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T227f60(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T227f49(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T227f50(l1)));
						t2 = (T33f5(GE_void(((T592*)(C))->a1), l3));
						if (t2) {
							t1 = (T592f4(C));
							t5 = (T33f4(GE_void(((T592*)(C))->a1), l3));
							R = (T75f5(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T592f4(C));
								t5 = (T592f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T75f5(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T227f60(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T227f60(R, (T2)('{'));
									}
								}
								t1 = (T592f4(C));
								R = (T75f5(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T227f60(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T227f60(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T227f60(R, (T2)('{'));
							}
						}
						t1 = (T592f4(C));
						R = (T75f5(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T227f60(R, (T2)('}'));
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
T0* T592f6(T0* C)
{
	T0* R = 0;
	if (ge202os1931) {
		return ge202ov1931;
	} else {
		ge202os1931 = '\1';
		ge202ov1931 = R;
	}
	R = T27c5();
	ge202ov1931 = R;
	return R;
}

/* LX_CHARACTER_OUT_OF_RANGE_ERROR.string_ */
T0* T592f4(T0* C)
{
	T0* R = 0;
	if (ge128os1922) {
		return ge128ov1922;
	} else {
		ge128os1922 = '\1';
		ge128ov1922 = R;
	}
	R = T75c19();
	ge128ov1922 = R;
	return R;
}

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.default_message */
T0* T591f5(T0* C)
{
	T0* R = 0;
	R = (T591f3(C, ge286ov3038));
	return R;
}

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.message */
T0* T591f3(T0* C, T0* a1)
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
	t1 = (T591f4(C));
	R = (T75f3(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T227f60(R, l5);
				}
			} else {
				t1 = (T591f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T75f4(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T227f60(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T227f60(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T591f4(C));
					l1 = (T75f3(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T227f60(l1, l5);
									}
								} else {
									t1 = (T591f4(C));
									T75f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T227f60(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T227f49(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T227f50(l1)));
						t2 = (T33f5(GE_void(((T591*)(C))->a1), l3));
						if (t2) {
							t1 = (T591f4(C));
							t5 = (T33f4(GE_void(((T591*)(C))->a1), l3));
							R = (T75f5(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T591f4(C));
								t5 = (T591f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T75f5(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T227f60(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T227f60(R, (T2)('{'));
									}
								}
								t1 = (T591f4(C));
								R = (T75f5(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T227f60(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T227f60(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T227f60(R, (T2)('{'));
							}
						}
						t1 = (T591f4(C));
						R = (T75f5(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T227f60(R, (T2)('}'));
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
T0* T591f6(T0* C)
{
	T0* R = 0;
	if (ge202os1931) {
		return ge202ov1931;
	} else {
		ge202os1931 = '\1';
		ge202ov1931 = R;
	}
	R = T27c5();
	ge202ov1931 = R;
	return R;
}

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.string_ */
T0* T591f4(T0* C)
{
	T0* R = 0;
	if (ge128os1922) {
		return ge128ov1922;
	} else {
		ge128os1922 = '\1';
		ge128ov1922 = R;
	}
	R = T75c19();
	ge128ov1922 = R;
	return R;
}

/* LX_FULL_AND_REJECT_ERROR.default_message */
T0* T590f5(T0* C)
{
	T0* R = 0;
	R = (T590f3(C, ge285ov3038));
	return R;
}

/* LX_FULL_AND_REJECT_ERROR.message */
T0* T590f3(T0* C, T0* a1)
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
	t1 = (T590f4(C));
	R = (T75f3(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T227f60(R, l5);
				}
			} else {
				t1 = (T590f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T75f4(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T227f60(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T227f60(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T590f4(C));
					l1 = (T75f3(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T227f60(l1, l5);
									}
								} else {
									t1 = (T590f4(C));
									T75f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T227f60(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T227f49(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T227f50(l1)));
						t2 = (T33f5(GE_void(((T590*)(C))->a1), l3));
						if (t2) {
							t1 = (T590f4(C));
							t5 = (T33f4(GE_void(((T590*)(C))->a1), l3));
							R = (T75f5(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T590f4(C));
								t5 = (T590f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T75f5(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T227f60(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T227f60(R, (T2)('{'));
									}
								}
								t1 = (T590f4(C));
								R = (T75f5(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T227f60(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T227f60(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T227f60(R, (T2)('{'));
							}
						}
						t1 = (T590f4(C));
						R = (T75f5(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T227f60(R, (T2)('}'));
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
T0* T590f6(T0* C)
{
	T0* R = 0;
	if (ge202os1931) {
		return ge202ov1931;
	} else {
		ge202os1931 = '\1';
		ge202ov1931 = R;
	}
	R = T27c5();
	ge202ov1931 = R;
	return R;
}

/* LX_FULL_AND_REJECT_ERROR.string_ */
T0* T590f4(T0* C)
{
	T0* R = 0;
	if (ge128os1922) {
		return ge128ov1922;
	} else {
		ge128os1922 = '\1';
		ge128ov1922 = R;
	}
	R = T75c19();
	ge128ov1922 = R;
	return R;
}

/* LX_FULL_AND_META_ERROR.default_message */
T0* T589f5(T0* C)
{
	T0* R = 0;
	R = (T589f3(C, ge284ov3038));
	return R;
}

/* LX_FULL_AND_META_ERROR.message */
T0* T589f3(T0* C, T0* a1)
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
	t1 = (T589f4(C));
	R = (T75f3(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T227f60(R, l5);
				}
			} else {
				t1 = (T589f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T75f4(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T227f60(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T227f60(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T589f4(C));
					l1 = (T75f3(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T227f60(l1, l5);
									}
								} else {
									t1 = (T589f4(C));
									T75f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T227f60(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T227f49(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T227f50(l1)));
						t2 = (T33f5(GE_void(((T589*)(C))->a1), l3));
						if (t2) {
							t1 = (T589f4(C));
							t5 = (T33f4(GE_void(((T589*)(C))->a1), l3));
							R = (T75f5(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T589f4(C));
								t5 = (T589f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T75f5(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T227f60(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T227f60(R, (T2)('{'));
									}
								}
								t1 = (T589f4(C));
								R = (T75f5(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T227f60(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T227f60(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T227f60(R, (T2)('{'));
							}
						}
						t1 = (T589f4(C));
						R = (T75f5(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T227f60(R, (T2)('}'));
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
T0* T589f6(T0* C)
{
	T0* R = 0;
	if (ge202os1931) {
		return ge202ov1931;
	} else {
		ge202os1931 = '\1';
		ge202ov1931 = R;
	}
	R = T27c5();
	ge202ov1931 = R;
	return R;
}

/* LX_FULL_AND_META_ERROR.string_ */
T0* T589f4(T0* C)
{
	T0* R = 0;
	if (ge128os1922) {
		return ge128ov1922;
	} else {
		ge128os1922 = '\1';
		ge128ov1922 = R;
	}
	R = T75c19();
	ge128ov1922 = R;
	return R;
}

/* LX_BAD_CHARACTER_ERROR.default_message */
T0* T588f5(T0* C)
{
	T0* R = 0;
	R = (T588f3(C, ge275ov3038));
	return R;
}

/* LX_BAD_CHARACTER_ERROR.message */
T0* T588f3(T0* C, T0* a1)
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
	t1 = (T588f4(C));
	R = (T75f3(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T227f60(R, l5);
				}
			} else {
				t1 = (T588f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T75f4(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T227f60(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T227f60(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T588f4(C));
					l1 = (T75f3(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T227f60(l1, l5);
									}
								} else {
									t1 = (T588f4(C));
									T75f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T227f60(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T227f49(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T227f50(l1)));
						t2 = (T33f5(GE_void(((T588*)(C))->a1), l3));
						if (t2) {
							t1 = (T588f4(C));
							t5 = (T33f4(GE_void(((T588*)(C))->a1), l3));
							R = (T75f5(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T588f4(C));
								t5 = (T588f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T75f5(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T227f60(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T227f60(R, (T2)('{'));
									}
								}
								t1 = (T588f4(C));
								R = (T75f5(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T227f60(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T227f60(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T227f60(R, (T2)('{'));
							}
						}
						t1 = (T588f4(C));
						R = (T75f5(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T227f60(R, (T2)('}'));
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
T0* T588f6(T0* C)
{
	T0* R = 0;
	if (ge202os1931) {
		return ge202ov1931;
	} else {
		ge202os1931 = '\1';
		ge202ov1931 = R;
	}
	R = T27c5();
	ge202ov1931 = R;
	return R;
}

/* LX_BAD_CHARACTER_ERROR.string_ */
T0* T588f4(T0* C)
{
	T0* R = 0;
	if (ge128os1922) {
		return ge128ov1922;
	} else {
		ge128os1922 = '\1';
		ge128ov1922 = R;
	}
	R = T75c19();
	ge128ov1922 = R;
	return R;
}

/* LX_BAD_CHARACTER_CLASS_ERROR.default_message */
T0* T587f5(T0* C)
{
	T0* R = 0;
	R = (T587f3(C, ge274ov3038));
	return R;
}

/* LX_BAD_CHARACTER_CLASS_ERROR.message */
T0* T587f3(T0* C, T0* a1)
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
	t1 = (T587f4(C));
	R = (T75f3(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T227f60(R, l5);
				}
			} else {
				t1 = (T587f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T75f4(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T227f60(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T227f60(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T587f4(C));
					l1 = (T75f3(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T227f60(l1, l5);
									}
								} else {
									t1 = (T587f4(C));
									T75f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T227f60(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T227f49(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T227f50(l1)));
						t2 = (T33f5(GE_void(((T587*)(C))->a1), l3));
						if (t2) {
							t1 = (T587f4(C));
							t5 = (T33f4(GE_void(((T587*)(C))->a1), l3));
							R = (T75f5(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T587f4(C));
								t5 = (T587f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T75f5(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T227f60(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T227f60(R, (T2)('{'));
									}
								}
								t1 = (T587f4(C));
								R = (T75f5(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T227f60(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T227f60(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T227f60(R, (T2)('{'));
							}
						}
						t1 = (T587f4(C));
						R = (T75f5(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T227f60(R, (T2)('}'));
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
T0* T587f6(T0* C)
{
	T0* R = 0;
	if (ge202os1931) {
		return ge202ov1931;
	} else {
		ge202os1931 = '\1';
		ge202ov1931 = R;
	}
	R = T27c5();
	ge202ov1931 = R;
	return R;
}

/* LX_BAD_CHARACTER_CLASS_ERROR.string_ */
T0* T587f4(T0* C)
{
	T0* R = 0;
	if (ge128os1922) {
		return ge128ov1922;
	} else {
		ge128os1922 = '\1';
		ge128ov1922 = R;
	}
	R = T75c19();
	ge128ov1922 = R;
	return R;
}

/* LX_MISSING_QUOTE_ERROR.default_message */
T0* T586f5(T0* C)
{
	T0* R = 0;
	R = (T586f3(C, ge291ov3038));
	return R;
}

/* LX_MISSING_QUOTE_ERROR.message */
T0* T586f3(T0* C, T0* a1)
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
	t1 = (T586f4(C));
	R = (T75f3(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T227f60(R, l5);
				}
			} else {
				t1 = (T586f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T75f4(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T227f60(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T227f60(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T586f4(C));
					l1 = (T75f3(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T227f60(l1, l5);
									}
								} else {
									t1 = (T586f4(C));
									T75f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T227f60(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T227f49(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T227f50(l1)));
						t2 = (T33f5(GE_void(((T586*)(C))->a1), l3));
						if (t2) {
							t1 = (T586f4(C));
							t5 = (T33f4(GE_void(((T586*)(C))->a1), l3));
							R = (T75f5(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T586f4(C));
								t5 = (T586f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T75f5(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T227f60(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T227f60(R, (T2)('{'));
									}
								}
								t1 = (T586f4(C));
								R = (T75f5(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T227f60(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T227f60(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T227f60(R, (T2)('{'));
							}
						}
						t1 = (T586f4(C));
						R = (T75f5(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T227f60(R, (T2)('}'));
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
T0* T586f6(T0* C)
{
	T0* R = 0;
	if (ge202os1931) {
		return ge202ov1931;
	} else {
		ge202os1931 = '\1';
		ge202ov1931 = R;
	}
	R = T27c5();
	ge202ov1931 = R;
	return R;
}

/* LX_MISSING_QUOTE_ERROR.string_ */
T0* T586f4(T0* C)
{
	T0* R = 0;
	if (ge128os1922) {
		return ge128ov1922;
	} else {
		ge128os1922 = '\1';
		ge128ov1922 = R;
	}
	R = T75c19();
	ge128ov1922 = R;
	return R;
}

/* LX_UNRECOGNIZED_RULE_ERROR.default_message */
T0* T585f5(T0* C)
{
	T0* R = 0;
	R = (T585f3(C, ge304ov3038));
	return R;
}

/* LX_UNRECOGNIZED_RULE_ERROR.message */
T0* T585f3(T0* C, T0* a1)
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
	t1 = (T585f4(C));
	R = (T75f3(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T227f60(R, l5);
				}
			} else {
				t1 = (T585f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T75f4(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T227f60(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T227f60(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T585f4(C));
					l1 = (T75f3(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T227f60(l1, l5);
									}
								} else {
									t1 = (T585f4(C));
									T75f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T227f60(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T227f49(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T227f50(l1)));
						t2 = (T33f5(GE_void(((T585*)(C))->a1), l3));
						if (t2) {
							t1 = (T585f4(C));
							t5 = (T33f4(GE_void(((T585*)(C))->a1), l3));
							R = (T75f5(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T585f4(C));
								t5 = (T585f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T75f5(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T227f60(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T227f60(R, (T2)('{'));
									}
								}
								t1 = (T585f4(C));
								R = (T75f5(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T227f60(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T227f60(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T227f60(R, (T2)('{'));
							}
						}
						t1 = (T585f4(C));
						R = (T75f5(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T227f60(R, (T2)('}'));
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
T0* T585f6(T0* C)
{
	T0* R = 0;
	if (ge202os1931) {
		return ge202ov1931;
	} else {
		ge202os1931 = '\1';
		ge202ov1931 = R;
	}
	R = T27c5();
	ge202ov1931 = R;
	return R;
}

/* LX_UNRECOGNIZED_RULE_ERROR.string_ */
T0* T585f4(T0* C)
{
	T0* R = 0;
	if (ge128os1922) {
		return ge128ov1922;
	} else {
		ge128os1922 = '\1';
		ge128ov1922 = R;
	}
	R = T75c19();
	ge128ov1922 = R;
	return R;
}

/* UT_SYNTAX_ERROR.default_message */
T0* T583f5(T0* C)
{
	T0* R = 0;
	R = (T583f3(C, ge1361ov3038));
	return R;
}

/* UT_SYNTAX_ERROR.message */
T0* T583f3(T0* C, T0* a1)
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
	t1 = (T583f4(C));
	R = (T75f3(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T227f60(R, l5);
				}
			} else {
				t1 = (T583f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T75f4(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T227f60(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T227f60(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T583f4(C));
					l1 = (T75f3(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T227f60(l1, l5);
									}
								} else {
									t1 = (T583f4(C));
									T75f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T227f60(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T227f49(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T227f50(l1)));
						t2 = (T33f5(GE_void(((T583*)(C))->a1), l3));
						if (t2) {
							t1 = (T583f4(C));
							t5 = (T33f4(GE_void(((T583*)(C))->a1), l3));
							R = (T75f5(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T583f4(C));
								t5 = (T583f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T75f5(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T227f60(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T227f60(R, (T2)('{'));
									}
								}
								t1 = (T583f4(C));
								R = (T75f5(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T227f60(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T227f60(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T227f60(R, (T2)('{'));
							}
						}
						t1 = (T583f4(C));
						R = (T75f5(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T227f60(R, (T2)('}'));
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
T0* T583f6(T0* C)
{
	T0* R = 0;
	if (ge202os1931) {
		return ge202ov1931;
	} else {
		ge202os1931 = '\1';
		ge202ov1931 = R;
	}
	R = T27c5();
	ge202ov1931 = R;
	return R;
}

/* UT_SYNTAX_ERROR.string_ */
T0* T583f4(T0* C)
{
	T0* R = 0;
	if (ge128os1922) {
		return ge128ov1922;
	} else {
		ge128os1922 = '\1';
		ge128ov1922 = R;
	}
	R = T75c19();
	ge128ov1922 = R;
	return R;
}

/* UT_VERSION_NUMBER.default_message */
T0* T49f3(T0* C)
{
	T0* R = 0;
	R = (T49f5(C, ge1366ov3038));
	return R;
}

/* UT_VERSION_NUMBER.message */
T0* T49f5(T0* C, T0* a1)
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
	t1 = (T49f6(C));
	R = (T75f3(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T227f60(R, l5);
				}
			} else {
				t1 = (T49f6(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T75f4(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T227f60(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T227f60(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T49f6(C));
					l1 = (T75f3(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T227f60(l1, l5);
									}
								} else {
									t1 = (T49f6(C));
									T75f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T227f60(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T227f49(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T227f50(l1)));
						t2 = (T33f5(GE_void(((T49*)(C))->a1), l3));
						if (t2) {
							t1 = (T49f6(C));
							t5 = (T33f4(GE_void(((T49*)(C))->a1), l3));
							R = (T75f5(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T49f6(C));
								t5 = (T49f7(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T75f5(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T227f60(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T227f60(R, (T2)('{'));
									}
								}
								t1 = (T49f6(C));
								R = (T75f5(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T227f60(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T227f60(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T227f60(R, (T2)('{'));
							}
						}
						t1 = (T49f6(C));
						R = (T75f5(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T227f60(R, (T2)('}'));
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
T0* T49f7(T0* C)
{
	T0* R = 0;
	if (ge202os1931) {
		return ge202ov1931;
	} else {
		ge202os1931 = '\1';
		ge202ov1931 = R;
	}
	R = T27c5();
	ge202ov1931 = R;
	return R;
}

/* UT_VERSION_NUMBER.string_ */
T0* T49f6(T0* C)
{
	T0* R = 0;
	if (ge128os1922) {
		return ge128ov1922;
	} else {
		ge128os1922 = '\1';
		ge128ov1922 = R;
	}
	R = T75c19();
	ge128ov1922 = R;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.was_found */
T1 T72f10(T0* C)
{
	T1 R = 0;
	R = (T6f1(&(((T72*)(C))->a5), (T6)(GE_int32(0))));
	return R;
}

/* AP_STRING_OPTION.was_found */
T1 T37f15(T0* C)
{
	T6 t1;
	T1 R = 0;
	t1 = (T37f17(C));
	R = (T6f1(&t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_FLAG.was_found */
T1 T35f9(T0* C)
{
	T1 R = 0;
	R = (T6f1(&(((T35*)(C))->a1), (T6)(GE_int32(0))));
	return R;
}

/* AP_STRING_OPTION.occurrences */
T6 T37f17(T0* C)
{
	T6 R = 0;
	R = (((T70*)(GE_void(((T37*)(C))->a1)))->a1);
	return R;
}

/* AP_DISPLAY_HELP_FLAG.allows_parameter */
T1 T72f21(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_STRING_OPTION.allows_parameter */
T1 T37f16(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_FLAG.allows_parameter */
T1 T35f11(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.needs_parameter */
T1 T72f9(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_FLAG.needs_parameter */
T1 T35f10(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.name */
T0* T72f11(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (((T72*)(C))->a4?((m1 = ((T72*)(C))->a4, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t2 = (T2)('-');
		t4 = (T2f1(&t2));
		t3 = (T17f9(GE_void(t3), t4));
		R = (T17f9(GE_void(t3), m1));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t4 = (T2f1(&(((T72*)(C))->a2)));
		R = (T17f9(GE_void(t3), t4));
	}
	return R;
}

/* AP_STRING_OPTION.name */
T0* T37f11(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (((T37*)(C))->a7?((m1 = ((T37*)(C))->a7, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t2 = (T2)('-');
		t4 = (T2f1(&t2));
		t3 = (T17f9(GE_void(t3), t4));
		R = (T17f9(GE_void(t3), m1));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t4 = (T2f1(&(((T37*)(C))->a5)));
		R = (T17f9(GE_void(t3), t4));
	}
	return R;
}

/* AP_FLAG.name */
T0* T35f14(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (((T35*)(C))->a3?((m1 = ((T35*)(C))->a3, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t2 = (T2)('-');
		t4 = (T2f1(&t2));
		t3 = (T17f9(GE_void(t3), t4));
		R = (T17f9(GE_void(t3), m1));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t4 = (T2f1(&(((T35*)(C))->a4)));
		R = (T17f9(GE_void(t3), t4));
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.names */
T0* T72f22(T0* C)
{
	T2 t1;
	T1 t2;
	T0* m1 = 0;
	T0* R = 0;
	T0* l1 = 0;
	if (((T72*)(C))->a3) {
		t1 = (T2)('-');
		l1 = (T2f1(&t1));
		T17f39(GE_void(l1), ((T72*)(C))->a2);
	}
	t2 = (((T72*)(C))->a4?((m1 = ((T72*)(C))->a4, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f43(GE_void(l1), GE_ms8(", ", 2));
		}
		T17f39(GE_void(l1), (T2)('-'));
		T17f39(GE_void(l1), (T2)('-'));
		T17f43(GE_void(l1), m1);
	}
	{
		t2 = ((l1)!=(EIF_VOID));
		if (!(t2)) {
			GE_raise(7);
		}		R = l1;
	}
	return R;
}

/* AP_STRING_OPTION.names */
T0* T37f18(T0* C)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T0* R = 0;
	R = (T37f18p1(C));
	t1 = (T37f20(C));
	if (t1) {
		t1 = ((T1)(!(((T37*)(C))->a4)));
		if (t1) {
			T17f39(GE_void(R), (T2)('['));
		}
		t2 = (T2)('=');
		t3 = (T2f1(&t2));
		T17f43(GE_void(R), t3);
		T17f43(GE_void(R), ((T37*)(C))->a3);
		t1 = ((T1)(!(((T37*)(C))->a4)));
		if (t1) {
			T17f39(GE_void(R), (T2)(']'));
		}
	} else {
		T17f39(GE_void(R), (T2)(' '));
		T17f43(GE_void(R), ((T37*)(C))->a3);
	}
	return R;
}

/* AP_STRING_OPTION.has_long_form */
T1 T37f20(T0* C)
{
	T1 R = 0;
	R = ((((T37*)(C))->a7)!=(EIF_VOID));
	return R;
}

/* AP_STRING_OPTION.names */
T0* T37f18p1(T0* C)
{
	T2 t1;
	T1 t2;
	T0* m1 = 0;
	T0* R = 0;
	T0* l1 = 0;
	if (((T37*)(C))->a6) {
		t1 = (T2)('-');
		l1 = (T2f1(&t1));
		T17f39(GE_void(l1), ((T37*)(C))->a5);
	}
	t2 = (((T37*)(C))->a7?((m1 = ((T37*)(C))->a7, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f43(GE_void(l1), GE_ms8(", ", 2));
		}
		T17f39(GE_void(l1), (T2)('-'));
		T17f39(GE_void(l1), (T2)('-'));
		T17f43(GE_void(l1), m1);
	}
	{
		t2 = ((l1)!=(EIF_VOID));
		if (!(t2)) {
			GE_raise(7);
		}		R = l1;
	}
	return R;
}

/* AP_FLAG.names */
T0* T35f15(T0* C)
{
	T2 t1;
	T1 t2;
	T0* m1 = 0;
	T0* R = 0;
	T0* l1 = 0;
	if (((T35*)(C))->a5) {
		t1 = (T2)('-');
		l1 = (T2f1(&t1));
		T17f39(GE_void(l1), ((T35*)(C))->a4);
	}
	t2 = (((T35*)(C))->a3?((m1 = ((T35*)(C))->a3, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f43(GE_void(l1), GE_ms8(", ", 2));
		}
		T17f39(GE_void(l1), (T2)('-'));
		T17f39(GE_void(l1), (T2)('-'));
		T17f43(GE_void(l1), m1);
	}
	{
		t2 = ((l1)!=(EIF_VOID));
		if (!(t2)) {
			GE_raise(7);
		}		R = l1;
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.example */
T0* T72f27(T0* C)
{
	T1 t1;
	T0* t2;
	T0* R = 0;
	T0* l1 = 0;
	R = T17c38((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T72*)(C))->a6)));
	if (t1) {
		T17f39(GE_void(R), (T2)('['));
	}
	T17f39(GE_void(R), (T2)('-'));
	if (((T72*)(C))->a3) {
		t2 = (T2f1(&(((T72*)(C))->a2)));
		T17f43(GE_void(R), t2);
	} else {
		l1 = ((T72*)(C))->a4;
		T17f39(GE_void(R), (T2)('-'));
		T17f43(GE_void(R), l1);
	}
	t1 = ((T1)(!(((T72*)(C))->a6)));
	if (t1) {
		T17f39(GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_STRING_OPTION.example */
T0* T37f19(T0* C)
{
	T1 t1;
	T0* R = 0;
	T0* l1 = 0;
	R = T17c38((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T37*)(C))->a8)));
	if (t1) {
		T17f39(GE_void(R), (T2)('['));
	}
	T17f39(GE_void(R), (T2)('-'));
	if (((T37*)(C))->a6) {
		T17f39(GE_void(R), ((T37*)(C))->a5);
		T17f39(GE_void(R), (T2)(' '));
		T17f43(GE_void(R), ((T37*)(C))->a3);
	} else {
		T17f39(GE_void(R), (T2)('-'));
		l1 = ((T37*)(C))->a7;
		T17f43(GE_void(R), l1);
		t1 = ((T1)(!(((T37*)(C))->a4)));
		if (t1) {
			T17f39(GE_void(R), (T2)('['));
		}
		T17f39(GE_void(R), (T2)('='));
		T17f43(GE_void(R), ((T37*)(C))->a3);
		t1 = ((T1)(!(((T37*)(C))->a4)));
		if (t1) {
			T17f39(GE_void(R), (T2)(']'));
		}
	}
	t1 = ((T1)(!(((T37*)(C))->a8)));
	if (t1) {
		T17f39(GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_FLAG.example */
T0* T35f16(T0* C)
{
	T1 t1;
	T0* t2;
	T0* R = 0;
	T0* l1 = 0;
	R = T17c38((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T35*)(C))->a6)));
	if (t1) {
		T17f39(GE_void(R), (T2)('['));
	}
	T17f39(GE_void(R), (T2)('-'));
	if (((T35*)(C))->a5) {
		t2 = (T2f1(&(((T35*)(C))->a4)));
		T17f43(GE_void(R), t2);
	} else {
		l1 = ((T35*)(C))->a3;
		T17f39(GE_void(R), (T2)('-'));
		T17f43(GE_void(R), l1);
	}
	t1 = ((T1)(!(((T35*)(C))->a6)));
	if (t1) {
		T17f39(GE_void(R), (T2)(']'));
	}
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.found */
T1 T34f33(T0* C)
{
	T1 R = 0;
	R = (((((((T34*)(C))->a9) != ((T6)(GE_int32(-1)))))));
	return R;
}

/* GEANT_VARIABLES.found */
T1 T29f36(T0* C)
{
	T1 R = 0;
	R = (((((((T29*)(C))->a9) != ((T6)(GE_int32(-1)))))));
	return R;
}

/* GEANT_PROJECT_VARIABLES.found */
T1 T25f44(T0* C)
{
	T1 R = 0;
	R = (((((((T25*)(C))->a10) != ((T6)(GE_int32(-1)))))));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.found_item */
T0* T34f41(T0* C)
{
	T0* R = 0;
	R = (T34f38(C, ((T34*)(C))->a9));
	return R;
}

/* GEANT_VARIABLES.found_item */
T0* T29f41(T0* C)
{
	T0* R = 0;
	R = (T29f35(C, ((T29*)(C))->a9));
	return R;
}

/* GEANT_PROJECT_VARIABLES.found_item */
T0* T25f53(T0* C)
{
	T0* R = 0;
	R = (T25f48(C, ((T25*)(C))->a10));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.after */
T1 T34f42(T0* C)
{
	T1 R = 0;
	R = (T34f45(C, ((T34*)(C))->a19));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.cursor_after */
T1 T34f45(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T64f4(GE_void(a1)));
	return R;
}

/* GEANT_VARIABLES.after */
T1 T29f42(T0* C)
{
	T1 R = 0;
	R = (T29f45(C, ((T29*)(C))->a19));
	return R;
}

/* GEANT_VARIABLES.cursor_after */
T1 T29f45(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T64f4(GE_void(a1)));
	return R;
}

/* GEANT_PROJECT_VARIABLES.after */
T1 T25f54(T0* C)
{
	T1 R = 0;
	R = (T25f57(C, ((T25*)(C))->a19));
	return R;
}

/* GEANT_PROJECT_VARIABLES.cursor_after */
T1 T25f57(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T64f4(GE_void(a1)));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.key_for_iteration */
T0* T34f43(T0* C)
{
	T0* R = 0;
	R = (T34f36(C, ((T34*)(C))->a19));
	return R;
}

/* GEANT_VARIABLES.key_for_iteration */
T0* T29f43(T0* C)
{
	T0* R = 0;
	R = (T29f38(C, ((T29*)(C))->a19));
	return R;
}

/* GEANT_PROJECT_VARIABLES.key_for_iteration */
T0* T25f55(T0* C)
{
	T0* R = 0;
	R = (T25f50(C, ((T25*)(C))->a19));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.item_for_iteration */
T0* T34f44(T0* C)
{
	T0* R = 0;
	R = (T34f35(C, ((T34*)(C))->a19));
	return R;
}

/* GEANT_VARIABLES.item_for_iteration */
T0* T29f44(T0* C)
{
	T0* R = 0;
	R = (T29f37(C, ((T29*)(C))->a19));
	return R;
}

/* GEANT_PROJECT_VARIABLES.item_for_iteration */
T0* T25f56(T0* C)
{
	T0* R = 0;
	R = (T25f49(C, ((T25*)(C))->a19));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.has */
T1 T34f32(T0* C, T0* a1)
{
	T1 R = 0;
	T34f51(C, a1);
	R = (((((((T34*)(C))->a1) != ((T6)(GE_int32(-1)))))));
	return R;
}

/* GEANT_VARIABLES.has */
T1 T29f32(T0* C, T0* a1)
{
	T1 R = 0;
	T29f52(C, a1);
	R = (((((((T29*)(C))->a1) != ((T6)(GE_int32(-1)))))));
	return R;
}

/* GEANT_PROJECT_VARIABLES.has */
T1 T25f46(T0* C, T0* a1)
{
	T1 R = 0;
	T25f65(C, a1);
	R = (((((((T25*)(C))->a3) != ((T6)(GE_int32(-1)))))));
	return R;
}

T0* GE_ma33(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new32(c, EIF_FALSE);
	*(T32*)t1 = GE_default32;
	((T32*)(t1))->a2 = c;
	((T32*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T32*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new33(EIF_TRUE);
	((T33*)(R))->a1 = t1;
	((T33*)(R))->a2 = 1;
	((T33*)(R))->a3 = c;
	return R;
}

T0* GE_ma225(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new63(c, EIF_FALSE);
	*(T63*)t1 = GE_default63;
	((T63*)(t1))->a2 = c;
	((T63*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T6 *i = ((T63*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T6);
		}
		va_end(v);
	}
	R = GE_new225(EIF_TRUE);
	((T225*)(R))->a1 = t1;
	((T225*)(R))->a2 = 1;
	((T225*)(R))->a3 = c;
	return R;
}

T0* GE_ma189(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new188(c, EIF_FALSE);
	*(T188*)t1 = GE_default188;
	((T188*)(t1))->a2 = c;
	((T188*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T188*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new189(EIF_TRUE);
	((T189*)(R))->a1 = t1;
	((T189*)(R))->a2 = 1;
	((T189*)(R))->a3 = c;
	return R;
}

T0* GE_ma613(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new612(c, EIF_FALSE);
	*(T612*)t1 = GE_default612;
	((T612*)(t1))->a2 = c;
	((T612*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T612*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new613(EIF_TRUE);
	((T613*)(R))->a1 = t1;
	((T613*)(R))->a2 = 1;
	((T613*)(R))->a3 = c;
	return R;
}

T0* GE_ma270(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new177(c, EIF_FALSE);
	*(T177*)t1 = GE_default177;
	((T177*)(t1))->a2 = c;
	((T177*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T1 *i = ((T177*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = (T1)va_arg(v, int);
		}
		va_end(v);
	}
	R = GE_new270(EIF_TRUE);
	((T270*)(R))->a1 = t1;
	((T270*)(R))->a2 = 1;
	((T270*)(R))->a3 = c;
	return R;
}

T0* GE_mt663(T0* a1)
{
	T0* R;
	R = GE_new663(EIF_TRUE);
	((T663*)(R))->z1 = a1;
	return R;
}

T0* GE_mt679(T0* a1)
{
	T0* R;
	R = GE_new679(EIF_TRUE);
	((T679*)(R))->z1 = a1;
	return R;
}

T0* ge133ov5541;
T0* ge169ov3055;
T0* ge223ov6930;
T0* ge233ov8458;
T0* ge154ov9926;
T0* ge154ov9927;
T0* ge156ov4207;
T0* ge171ov3055;
T0* ge177ov4251;
T0* ge177ov4252;
T0* ge162ov4519;
T0* ge162ov4518;
T0* ge174ov4251;
T0* ge174ov4252;
T0* ge1786ov5895;
T0* ge1786ov5894;
T0* ge309ov11126;
T0* ge160ov3055;
T0* ge1357ov3040;
T0* ge424ov10159;
T0* ge155ov4410;
T0* ge457ov9831;
T0* ge260ov3055;
T0* ge35ov8907;
T0* ge1793ov6343;
T0* ge1793ov6305;
T0* ge1793ov6303;
T0* ge1793ov6344;
T0* ge1793ov6316;
T0* ge1793ov6315;
T0* ge1793ov6326;
T0* ge1793ov6320;
T0* ge1793ov6319;
T0* ge1793ov6318;
T0* ge1793ov6324;
T0* ge1793ov6323;
T0* ge1793ov6325;
T0* ge1793ov6302;
T0* ge1793ov6328;
T0* ge1793ov6337;
T0* ge1796ov6035;
T0* ge1796ov6033;
T0* ge1796ov6034;
T0* ge1793ov6338;
T0* ge1793ov6339;
T0* ge1793ov6342;
T0* ge1793ov6340;
T0* ge1793ov6341;
T0* ge1793ov6335;
T0* ge1789ov8040;
T0* ge1789ov8041;
T0* ge1793ov6308;
T0* ge1793ov6331;
T0* ge1793ov6351;
T0* ge1793ov6352;
T0* ge1793ov6353;
T0* ge1793ov6346;
T0* ge1793ov6329;
T0* ge1793ov6330;
T0* ge1793ov6332;
T0* ge1793ov6336;
T0* ge1743ov6642;
T0* ge177ov4262;
T0* ge174ov4262;
T0* ge103ov2739;
T0* ge106ov3022;
T0* ge106ov3029;
T0* ge193ov1904;
T0* ge106ov3025;
T0* ge106ov3032;
T0* ge106ov3023;
T0* ge106ov3030;
T0* ge106ov3024;
T0* ge106ov3031;
T0* ge106ov3026;
T0* ge106ov3033;
T0* ge106ov3027;
T0* ge106ov3034;
T0* ge103ov2734;
T0* ge103ov2733;
T0* ge103ov2741;
T0* ge103ov2740;
T0* ge428ov11678;
T0* ge428ov11715;
T0* ge428ov11700;
T0* ge428ov11693;
T0* ge428ov11703;
T0* ge428ov11696;
T0* ge428ov11704;
T0* ge428ov11713;
T0* ge428ov11706;
T0* ge428ov11702;
T0* ge428ov11690;
T0* ge428ov11691;
T0* ge428ov11705;
T0* ge428ov11692;
T0* ge428ov11679;
T0* ge428ov11680;
T0* ge428ov11681;
T0* ge428ov11687;
T0* ge428ov11689;
T0* ge428ov11684;
T0* ge428ov11709;
T0* ge428ov11708;
T0* ge428ov11685;
T0* ge428ov11686;
T0* ge428ov11683;
T0* ge428ov11682;
T0* ge42ov9444;
T0* ge157ov4389;
T0* ge155ov4412;
T0* ge1420ov9986;
T0* ge1420ov9987;
T0* ge154ov9925;
T0* ge1800ov7272;
T0* ge1800ov7273;
T0* ge1791ov8466;
T0* ge1791ov8468;
T0* ge1723ov8099;
T0* ge1723ov8100;
T0* ge104ov5493;
T0* ge104ov5494;
T0* ge104ov5495;
T0* ge104ov5492;
T0* ge1791ov8465;
T0* ge1791ov8467;
T0* ge294ov3038;
T0* ge280ov3038;
T0* ge286ov3038;
T0* ge285ov3038;
T0* ge284ov3038;
T0* ge275ov3038;
T0* ge274ov3038;
T0* ge291ov3038;
T0* ge304ov3038;
T0* ge1361ov3038;
T0* ge1366ov3038;

void GE_const_init()
{
	ge133ov5541 = (GE_ms8("", 0));
	ge169ov3055 = (GE_ms8("\n", 1));
	ge223ov6930 = (GE_ms8("", 0));
	ge233ov8458 = (GE_ms8("", 0));
	ge154ov9926 = (GE_ms8("", 0));
	ge154ov9927 = (GE_ms8("empty_name", 10));
	ge156ov4207 = (GE_ms8("dummy", 5));
	ge171ov3055 = (GE_ms8("\n", 1));
	ge177ov4251 = (GE_ms8(".", 1));
	ge177ov4252 = (GE_ms8("..", 2));
	ge162ov4519 = (GE_ms8("..", 2));
	ge162ov4518 = (GE_ms8(".", 1));
	ge174ov4251 = (GE_ms8(".", 1));
	ge174ov4252 = (GE_ms8("..", 2));
	ge1786ov5895 = (GE_ms8("undefined", 9));
	ge1786ov5894 = (GE_ms8("(TRUNCATED)", 11));
	ge309ov11126 = (GE_ms8("standard input", 14));
	ge160ov3055 = (GE_ms8("\n", 1));
	ge1357ov3040 = (GE_ms8("", 0));
	ge424ov10159 = (GE_ms8("", 0));
	ge155ov4410 = (GE_ms8("empty_name", 10));
	ge457ov9831 = (GE_ms8(" \t\r\n", 4));
	ge260ov3055 = (GE_ms8("\n", 1));
	ge35ov8907 = (GE_ms8("", 0));
	ge1793ov6343 = (GE_ms8("PE reference only allowed in DTD", 32));
	ge1793ov6305 = (GE_ms8("< not allowed in attribute value", 32));
	ge1793ov6303 = (GE_ms8("-- not allowed in comment", 25));
	ge1793ov6344 = (GE_ms8("xml prefix reserved in processing instruction", 45));
	ge1793ov6316 = (GE_ms8("Misformed XML Declaration", 25));
	ge1793ov6315 = (GE_ms8("Misplaced markup declaration", 28));
	ge1793ov6326 = (GE_ms8("End tag does not match start tag", 32));
	ge1793ov6320 = (GE_ms8("Missing element end tag", 23));
	ge1793ov6319 = (GE_ms8("Error in element content", 24));
	ge1793ov6318 = (GE_ms8("Misformed start tag", 19));
	ge1793ov6324 = (GE_ms8("Attribute declared twice", 24));
	ge1793ov6323 = (GE_ms8("Misformed attribute in tag", 26));
	ge1793ov6325 = (GE_ms8("Error in end tag", 16));
	ge1793ov6302 = (GE_ms8("]]> not allowed in content", 26));
	ge1793ov6328 = (GE_ms8("Error in XML declaration", 24));
	ge1793ov6337 = (GE_ms8("Misformed element type declaration", 34));
	ge1796ov6035 = (GE_ms8("*", 1));
	ge1796ov6033 = (GE_ms8("+", 1));
	ge1796ov6034 = (GE_ms8("\?", 1));
	ge1793ov6338 = (GE_ms8("Misformed attribute list declaration", 36));
	ge1793ov6339 = (GE_ms8("Misformed attribute definition declaration", 42));
	ge1793ov6342 = (GE_ms8("Misformed conditional section", 29));
	ge1793ov6340 = (GE_ms8("Misformed entity declaration", 28));
	ge1793ov6341 = (GE_ms8("Misformed entity notation", 25));
	ge1793ov6335 = (GE_ms8("Parser is not configured to support external DTDs", 49));
	ge1789ov8040 = (GE_ms8("1.0", 3));
	ge1789ov8041 = (GE_ms8("utf-8", 5));
	ge1793ov6308 = (GE_ms8("unsupported character encoding", 30));
	ge1793ov6331 = (GE_ms8("External reference in quoted value", 34));
	ge1793ov6351 = (GE_ms8("Unexpected non-ASCII character in ASCII-only mode", 49));
	ge1793ov6352 = (GE_ms8("Unexpected non-latin1 character in latin1-only mode", 51));
	ge1793ov6353 = (GE_ms8("Invalid UTF8 character sequence", 31));
	ge1793ov6346 = (GE_ms8("Name misformed", 14));
	ge1793ov6329 = (GE_ms8("Literal entity expected in attribute", 36));
	ge1793ov6330 = (GE_ms8("Entity is not defined", 21));
	ge1793ov6332 = (GE_ms8("Entity cannot be recursively included", 37));
	ge1793ov6336 = (GE_ms8("Undefined PE entity", 19));
	ge1743ov6642 = (GE_ms8("root", 4));
	ge177ov4262 = (GE_ms8(".exe", 4));
	ge174ov4262 = (GE_ms8("", 0));
	ge103ov2739 = (GE_ms8("Errors parsing arguments, aborting.", 35));
	ge106ov3022 = (GE_ms8("The value \'$2\' is not valid for the option \'$1\'.", 48));
	ge106ov3029 = (GE_ms8("APIPAR", 6));
	ge193ov1904 = (GE_ms8("3.9", 3));
	ge106ov3025 = (GE_ms8("Too many occurrences of option \'$1\'.", 36));
	ge106ov3032 = (GE_ms8("APSOPT", 6));
	ge106ov3023 = (GE_ms8("The mandatory option \'$1\' is missing.", 37));
	ge106ov3030 = (GE_ms8("APMOPT", 6));
	ge106ov3024 = (GE_ms8("The option \'$1\' is missing a parameter.", 39));
	ge106ov3031 = (GE_ms8("APMPAR", 6));
	ge106ov3026 = (GE_ms8("Unknown option \'$1\'.", 20));
	ge106ov3033 = (GE_ms8("APUOPT", 6));
	ge106ov3027 = (GE_ms8("The flag \'$1\' was given the parameter \'$2\'.", 43));
	ge106ov3034 = (GE_ms8("APUPAR", 6));
	ge103ov2734 = (GE_ms8("help", 4));
	ge103ov2733 = (GE_ms8("Display this help text.", 23));
	ge103ov2741 = (GE_ms8("parameters ...", 14));
	ge103ov2740 = (GE_ms8("", 0));
	ge428ov11678 = (GE_ms8("compilation successfully", 24));
	ge428ov11715 = (GE_ms8("no pattern compiled", 19));
	ge428ov11700 = (GE_ms8("unmatched parentheses", 21));
	ge428ov11693 = (GE_ms8("back reference to non-existent subpattern", 41));
	ge428ov11703 = (GE_ms8("lookbehind assertion is not fixed length", 40));
	ge428ov11696 = (GE_ms8("missing ) after comment", 23));
	ge428ov11704 = (GE_ms8("malformed number after (\?(", 26));
	ge428ov11713 = (GE_ms8("invalid condition (\?(0)", 23));
	ge428ov11706 = (GE_ms8("assertion expected after (\?(", 28));
	ge428ov11702 = (GE_ms8("unrecognized character after (\?<", 32));
	ge428ov11690 = (GE_ms8("unrecognized character after (\?", 31));
	ge428ov11691 = (GE_ms8("too many capturing parenthesized sub-patterns", 45));
	ge428ov11705 = (GE_ms8("conditional group contains more than two branches", 49));
	ge428ov11692 = (GE_ms8("missing )", 9));
	ge428ov11679 = (GE_ms8("\\ at end of pattern", 19));
	ge428ov11680 = (GE_ms8("\\c at end of pattern", 20));
	ge428ov11681 = (GE_ms8("unrecognized character follows \\", 32));
	ge428ov11687 = (GE_ms8("nothing to repeat", 17));
	ge428ov11689 = (GE_ms8("internal error: unexpected repeat", 33));
	ge428ov11684 = (GE_ms8("missing terminating ] for character class", 41));
	ge428ov11709 = (GE_ms8("POSIX collating elements are not supported", 42));
	ge428ov11708 = (GE_ms8("unknown POSIX class name", 24));
	ge428ov11685 = (GE_ms8("invalid escape sequence in character class", 42));
	ge428ov11686 = (GE_ms8("range out of order in character class", 37));
	ge428ov11683 = (GE_ms8("number too big in {} quantifier", 31));
	ge428ov11682 = (GE_ms8("numbers out of order in {} quantifier", 37));
	ge42ov9444 = (GE_ms8("_dummy_", 7));
	ge157ov4389 = (GE_ms8("", 0));
	ge155ov4412 = (GE_ms8("dummy", 5));
	ge1420ov9986 = (GE_ms8(".", 1));
	ge1420ov9987 = (GE_ms8("..", 2));
	ge154ov9925 = (GE_ms8("dummy", 5));
	ge1800ov7272 = (GE_ms8(" ", 1));
	ge1800ov7273 = (GE_ms8("  ", 2));
	ge1791ov8466 = (GE_ms8("iso-8859-1", 10));
	ge1791ov8468 = (GE_ms8("utf-16", 6));
	ge1723ov8099 = (GE_ms8("Undeclared namespace error", 26));
	ge1723ov8100 = (GE_ms8("Namespace declared twice", 24));
	ge104ov5493 = (GE_ms8("\n", 1));
	ge104ov5494 = (GE_ms8("\n", 1));
	ge104ov5495 = (GE_ms8("\nOptions:\n", 10));
	ge104ov5492 = (GE_ms8("usage: ", 7));
	ge1791ov8465 = (GE_ms8("us-ascii", 8));
	ge1791ov8467 = (GE_ms8("utf-8", 5));
	ge294ov3038 = (GE_ms8("\"$1\", line $2: negative range in character class", 48));
	ge280ov3038 = (GE_ms8("\"$1\", line $2: character \'$3\' out of range", 42));
	ge286ov3038 = (GE_ms8("$0: variable trailing context rules cannot be used with -f", 58));
	ge285ov3038 = (GE_ms8("$0: `reject\' cannot be used with -f", 35));
	ge284ov3038 = (GE_ms8("$0: -f and -m don\'t make sense together", 39));
	ge275ov3038 = (GE_ms8("\"$1\", line $2: bad character: $3", 32));
	ge274ov3038 = (GE_ms8("\"$1\", line $2: bad character class or missing close bracket", 59));
	ge291ov3038 = (GE_ms8("\"$1\", line $2: missing quote", 28));
	ge304ov3038 = (GE_ms8("\"$1\", line $2: unrecognized rule", 32));
	ge1361ov3038 = (GE_ms8("Syntax error in \"$1\" at line $2", 31));
	ge1366ov3038 = (GE_ms8("$0 version $1", 13));
}

EIF_TYPE GE_types[687] = {
{0, 0, EIF_FALSE, 0},
{654, 1, EIF_FALSE, 0, 0},
{0, 2, EIF_FALSE, 0, 0},
{0, 3, EIF_FALSE, 0, 0},
{0, 4, EIF_FALSE, 0, 0},
{0, 5, EIF_FALSE, 0, 0},
{543, 6, EIF_FALSE, 0, 0},
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
{222, 17, EIF_FALSE, 0, 0},
{0, 18, EIF_FALSE, 0, 0},
{0, 19, EIF_FALSE, 0, 0},
{0, 20, EIF_FALSE, 0, 0},
{0, 21, EIF_FALSE, 0, 0},
{0, 22, EIF_FALSE, 0, 0},
{0, 23, EIF_FALSE, 0, 0},
{0, 24, EIF_FALSE, 0, 0},
{0, 25, EIF_FALSE, 0, 0},
{287, 26, EIF_FALSE, 0, 0},
{0, 27, EIF_FALSE, 0, 0},
{0, 28, EIF_FALSE, 0, 0},
{0, 29, EIF_FALSE, 0, 0},
{0, 30, EIF_FALSE, 0, 0},
{0, 31, EIF_FALSE, 0, 0},
{0, 32, EIF_TRUE, 0, 0},
{0, 33, EIF_FALSE, 0, 0},
{0, 34, EIF_FALSE, 0, 0},
{0, 35, EIF_FALSE, 0, 0},
{0, 36, EIF_FALSE, 0, 0},
{0, 37, EIF_FALSE, 0, 0},
{0, 38, EIF_FALSE, 0, 0},
{0, 39, EIF_FALSE, 0, 0},
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
{0, 55, EIF_FALSE, &T55f61, 0},
{0, 56, EIF_FALSE, 0, 0},
{0, 57, EIF_FALSE, 0, 0},
{0, 58, EIF_FALSE, 0, 0},
{0, 59, EIF_FALSE, 0, 0},
{0, 60, EIF_FALSE, 0, 0},
{0, 61, EIF_FALSE, 0, 0},
{0, 62, EIF_FALSE, 0, 0},
{0, 63, EIF_TRUE, 0, 0},
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
{0, 78, EIF_FALSE, &T78f10, 0},
{0, 79, EIF_FALSE, 0, 0},
{0, 80, EIF_FALSE, 0, 0},
{0, 81, EIF_FALSE, 0, 0},
{0, 82, EIF_FALSE, 0, 0},
{0, 83, EIF_FALSE, 0, 0},
{0, 84, EIF_FALSE, 0, 0},
{0, 85, EIF_FALSE, 0, 0},
{0, 86, EIF_FALSE, 0, 0},
{0, 87, EIF_FALSE, 0, 0},
{0, 88, EIF_FALSE, 0, 0},
{0, 89, EIF_FALSE, 0, 0},
{0, 90, EIF_FALSE, 0, 0},
{0, 91, EIF_FALSE, 0, 0},
{0, 92, EIF_FALSE, 0, 0},
{0, 93, EIF_FALSE, 0, 0},
{0, 94, EIF_FALSE, 0, 0},
{0, 95, EIF_FALSE, 0, 0},
{0, 96, EIF_FALSE, 0, 0},
{0, 97, EIF_FALSE, 0, 0},
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
{0, 112, EIF_TRUE, 0, 0},
{0, 113, EIF_FALSE, 0, 0},
{0, 114, EIF_FALSE, 0, 0},
{0, 115, EIF_TRUE, 0, 0},
{0, 116, EIF_FALSE, 0, 0},
{0, 117, EIF_FALSE, 0, 0},
{0, 118, EIF_FALSE, 0, 0},
{0, 119, EIF_FALSE, 0, 0},
{0, 120, EIF_FALSE, 0, 0},
{0, 121, EIF_FALSE, 0, 0},
{0, 122, EIF_TRUE, 0, 0},
{0, 123, EIF_FALSE, 0, 0},
{0, 124, EIF_FALSE, 0, 0},
{0, 125, EIF_FALSE, 0, 0},
{0, 126, EIF_FALSE, 0, 0},
{0, 127, EIF_FALSE, 0, 0},
{0, 128, EIF_FALSE, 0, 0},
{0, 129, EIF_FALSE, 0, 0},
{0, 130, EIF_FALSE, 0, 0},
{0, 131, EIF_TRUE, 0, 0},
{0, 132, EIF_FALSE, 0, 0},
{0, 133, EIF_FALSE, 0, 0},
{0, 134, EIF_FALSE, 0, 0},
{0, 135, EIF_FALSE, 0, 0},
{0, 136, EIF_FALSE, 0, 0},
{0, 137, EIF_TRUE, 0, 0},
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
{0, 160, EIF_TRUE, 0, 0},
{0, 161, EIF_FALSE, 0, 0},
{0, 162, EIF_FALSE, 0, 0},
{0, 163, EIF_TRUE, 0, 0},
{0, 164, EIF_FALSE, 0, 0},
{0, 165, EIF_FALSE, 0, 0},
{0, 166, EIF_TRUE, 0, 0},
{0, 167, EIF_FALSE, 0, 0},
{0, 168, EIF_FALSE, 0, 0},
{0, 169, EIF_TRUE, 0, 0},
{0, 170, EIF_FALSE, 0, 0},
{0, 171, EIF_FALSE, 0, 0},
{0, 172, EIF_TRUE, 0, 0},
{0, 173, EIF_FALSE, 0, 0},
{0, 174, EIF_FALSE, 0, 0},
{0, 175, EIF_TRUE, 0, 0},
{0, 176, EIF_FALSE, 0, 0},
{0, 177, EIF_TRUE, 0, 0},
{0, 178, EIF_FALSE, 0, 0},
{0, 179, EIF_FALSE, 0, 0},
{0, 180, EIF_TRUE, 0, 0},
{0, 181, EIF_FALSE, 0, 0},
{0, 182, EIF_FALSE, 0, 0},
{0, 183, EIF_FALSE, 0, 0},
{0, 184, EIF_FALSE, 0, 0},
{0, 185, EIF_FALSE, 0, 0},
{0, 186, EIF_FALSE, 0, 0},
{0, 187, EIF_FALSE, 0, 0},
{0, 188, EIF_TRUE, 0, 0},
{0, 189, EIF_FALSE, 0, 0},
{0, 190, EIF_FALSE, 0, 0},
{0, 191, EIF_FALSE, 0, 0},
{0, 192, EIF_FALSE, 0, 0},
{0, 193, EIF_FALSE, 0, 0},
{0, 194, EIF_FALSE, 0, 0},
{0, 195, EIF_FALSE, 0, 0},
{0, 196, EIF_FALSE, 0, 0},
{0, 197, EIF_FALSE, 0, 0},
{0, 198, EIF_FALSE, 0, 0},
{0, 199, EIF_FALSE, 0, 0},
{0, 200, EIF_FALSE, 0, 0},
{0, 201, EIF_FALSE, 0, 0},
{0, 202, EIF_TRUE, 0, 0},
{0, 203, EIF_FALSE, 0, 0},
{0, 204, EIF_TRUE, 0, 0},
{0, 205, EIF_FALSE, 0, 0},
{0, 206, EIF_FALSE, 0, 0},
{0, 207, EIF_FALSE, 0, 0},
{0, 208, EIF_FALSE, 0, 0},
{0, 209, EIF_FALSE, 0, 0},
{0, 210, EIF_FALSE, 0, 0},
{0, 211, EIF_FALSE, 0, 0},
{0, 212, EIF_FALSE, 0, 0},
{0, 213, EIF_FALSE, 0, 0},
{0, 214, EIF_FALSE, 0, 0},
{0, 215, EIF_FALSE, 0, 0},
{0, 216, EIF_FALSE, 0, 0},
{0, 217, EIF_FALSE, 0, 0},
{0, 218, EIF_FALSE, 0, 0},
{0, 219, EIF_FALSE, 0, 0},
{0, 220, EIF_FALSE, 0, 0},
{0, 221, EIF_FALSE, 0, 0},
{0, 222, EIF_FALSE, 0, 0},
{0, 223, EIF_FALSE, 0, 0},
{0, 224, EIF_FALSE, 0, 0},
{0, 225, EIF_FALSE, 0, 0},
{0, 226, EIF_FALSE, 0, 0},
{0, 227, EIF_FALSE, 0, 0},
{0, 228, EIF_FALSE, 0, 0},
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
{0, 242, EIF_FALSE, 0, 0},
{0, 243, EIF_FALSE, 0, 0},
{0, 244, EIF_FALSE, 0, 0},
{0, 245, EIF_FALSE, 0, 0},
{0, 246, EIF_FALSE, 0, 0},
{0, 247, EIF_FALSE, 0, 0},
{0, 248, EIF_FALSE, 0, 0},
{0, 249, EIF_TRUE, 0, 0},
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
{0, 278, EIF_TRUE, 0, 0},
{0, 279, EIF_FALSE, 0, 0},
{0, 280, EIF_FALSE, 0, 0},
{0, 281, EIF_FALSE, 0, 0},
{0, 282, EIF_FALSE, 0, 0},
{0, 283, EIF_FALSE, 0, 0},
{0, 284, EIF_FALSE, 0, 0},
{0, 285, EIF_FALSE, 0, 0},
{0, 286, EIF_FALSE, 0, 0},
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
{0, 305, EIF_FALSE, 0, 0},
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
{0, 353, EIF_TRUE, 0, 0},
{0, 354, EIF_FALSE, 0, 0},
{0, 355, EIF_FALSE, 0, 0},
{0, 356, EIF_FALSE, 0, 0},
{0, 357, EIF_FALSE, 0, 0},
{0, 358, EIF_FALSE, 0, 0},
{0, 359, EIF_TRUE, 0, 0},
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
{0, 387, EIF_FALSE, 0, 0},
{0, 388, EIF_FALSE, 0, 0},
{0, 389, EIF_FALSE, 0, 0},
{0, 390, EIF_FALSE, 0, 0},
{0, 391, EIF_TRUE, 0, 0},
{0, 392, EIF_FALSE, 0, 0},
{0, 393, EIF_FALSE, 0, 0},
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
{0, 410, EIF_FALSE, 0, 0},
{0, 411, EIF_FALSE, 0, 0},
{0, 412, EIF_FALSE, 0, 0},
{0, 413, EIF_FALSE, 0, 0},
{0, 414, EIF_FALSE, 0, 0},
{0, 415, EIF_FALSE, 0, 0},
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
{0, 482, EIF_TRUE, 0, 0},
{0, 483, EIF_TRUE, 0, 0},
{0, 484, EIF_FALSE, 0, 0},
{0, 485, EIF_FALSE, 0, 0},
{0, 486, EIF_FALSE, 0, 0},
{0, 487, EIF_FALSE, 0, 0},
{0, 488, EIF_TRUE, 0, 0},
{0, 489, EIF_FALSE, 0, 0},
{0, 490, EIF_FALSE, 0, 0},
{0, 491, EIF_FALSE, 0, 0},
{0, 492, EIF_FALSE, 0, 0},
{0, 493, EIF_TRUE, 0, 0},
{0, 494, EIF_FALSE, 0, 0},
{0, 495, EIF_FALSE, 0, 0},
{0, 496, EIF_FALSE, 0, 0},
{0, 497, EIF_FALSE, 0, 0},
{0, 498, EIF_TRUE, 0, 0},
{0, 499, EIF_FALSE, 0, 0},
{0, 500, EIF_FALSE, 0, 0},
{0, 501, EIF_FALSE, &T501f44, 0},
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
{0, 525, EIF_FALSE, &T525f26, 0},
{0, 526, EIF_FALSE, 0, 0},
{0, 527, EIF_FALSE, 0, 0},
{0, 528, EIF_FALSE, 0, 0},
{0, 529, EIF_FALSE, 0, 0},
{0, 530, EIF_FALSE, 0, 0},
{0, 531, EIF_FALSE, 0, 0},
{0, 532, EIF_TRUE, 0, 0},
{0, 533, EIF_FALSE, 0, 0},
{0, 534, EIF_FALSE, 0, 0},
{0, 535, EIF_FALSE, 0, 0},
{0, 536, EIF_FALSE, 0, 0},
{0, 537, EIF_FALSE, 0, 0},
{0, 538, EIF_FALSE, 0, 0},
{0, 539, EIF_FALSE, 0, 0},
{0, 540, EIF_FALSE, 0, 0},
{0, 541, EIF_FALSE, 0, 0},
{0, 542, EIF_FALSE, 0, 0},
{0, 543, EIF_FALSE, 0, 0},
{0, 544, EIF_FALSE, 0, 0},
{0, 545, EIF_FALSE, 0, 0},
{0, 546, EIF_FALSE, 0, 0},
{567, 547, EIF_FALSE, 0, 0},
{0, 548, EIF_TRUE, 0, 0},
{0, 549, EIF_FALSE, 0, 0},
{0, 550, EIF_FALSE, 0, 0},
{0, 551, EIF_FALSE, 0, 0},
{0, 552, EIF_FALSE, 0, 0},
{0, 553, EIF_FALSE, 0, 0},
{0, 554, EIF_FALSE, 0, 0},
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
{0, 571, EIF_FALSE, 0, 0},
{0, 572, EIF_FALSE, 0, 0},
{0, 573, EIF_FALSE, 0, 0},
{0, 574, EIF_FALSE, 0, 0},
{0, 575, EIF_FALSE, 0, 0},
{0, 576, EIF_FALSE, 0, 0},
{0, 577, EIF_TRUE, 0, 0},
{0, 578, EIF_FALSE, 0, 0},
{0, 579, EIF_FALSE, 0, 0},
{0, 580, EIF_TRUE, 0, 0},
{0, 581, EIF_FALSE, 0, 0},
{0, 582, EIF_FALSE, 0, 0},
{0, 583, EIF_FALSE, 0, 0},
{0, 584, EIF_FALSE, 0, 0},
{0, 585, EIF_FALSE, 0, 0},
{0, 586, EIF_FALSE, 0, 0},
{0, 587, EIF_FALSE, 0, 0},
{0, 588, EIF_FALSE, 0, 0},
{0, 589, EIF_FALSE, 0, 0},
{0, 590, EIF_FALSE, 0, 0},
{0, 591, EIF_FALSE, 0, 0},
{0, 592, EIF_FALSE, 0, 0},
{0, 593, EIF_TRUE, 0, 0},
{0, 594, EIF_FALSE, 0, 0},
{0, 595, EIF_FALSE, 0, 0},
{0, 596, EIF_FALSE, 0, 0},
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
{0, 608, EIF_FALSE, 0, 0},
{0, 609, EIF_FALSE, 0, 0},
{0, 610, EIF_FALSE, 0, 0},
{0, 611, EIF_FALSE, 0, 0},
{0, 612, EIF_TRUE, 0, 0},
{0, 613, EIF_FALSE, 0, 0},
{0, 614, EIF_FALSE, 0, 0},
{0, 615, EIF_FALSE, 0, 0},
{0, 616, EIF_TRUE, 0, 0},
{0, 617, EIF_FALSE, 0, 0},
{0, 618, EIF_FALSE, 0, 0},
{0, 619, EIF_FALSE, 0, 0},
{0, 620, EIF_FALSE, 0, 0},
{0, 621, EIF_FALSE, 0, 0},
{0, 622, EIF_FALSE, 0, 0},
{0, 623, EIF_FALSE, 0, 0},
{0, 624, EIF_FALSE, 0, 0},
{0, 625, EIF_FALSE, 0, 0},
{0, 626, EIF_FALSE, 0, 0},
{0, 627, EIF_FALSE, 0, 0},
{0, 628, EIF_FALSE, 0, 0},
{0, 629, EIF_FALSE, 0, 0},
{0, 630, EIF_TRUE, 0, 0},
{0, 631, EIF_FALSE, 0, 0},
{0, 632, EIF_FALSE, 0, 0},
{0, 633, EIF_FALSE, 0, 0},
{0, 634, EIF_FALSE, 0, 0},
{0, 635, EIF_FALSE, 0, 0},
{0, 636, EIF_FALSE, 0, 0},
{0, 637, EIF_FALSE, 0, 0},
{0, 638, EIF_TRUE, 0, 0},
{0, 639, EIF_FALSE, 0, 0},
{0, 640, EIF_FALSE, 0, 0},
{0, 641, EIF_FALSE, 0, 0},
{0, 642, EIF_FALSE, 0, 0},
{0, 643, EIF_TRUE, 0, 0},
{0, 644, EIF_FALSE, 0, 0},
{0, 645, EIF_FALSE, 0, 0},
{0, 646, EIF_FALSE, 0, 0},
{0, 647, EIF_FALSE, 0, 0},
{0, 648, EIF_FALSE, 0, 0},
{0, 649, EIF_FALSE, 0, 0},
{0, 650, EIF_FALSE, 0, 0},
{0, 651, EIF_FALSE, 0, 0},
{0, 652, EIF_FALSE, &T652f37, 0},
{0, 653, EIF_FALSE, &T653f25, 0},
{0, 654, EIF_FALSE, 0, 0},
{0, 655, EIF_FALSE, 0, 0},
{0, 656, EIF_FALSE, 0, 0},
{0, 657, EIF_FALSE, 0, 0},
{0, 658, EIF_FALSE, 0, 0},
{0, 659, EIF_FALSE, 0, 0},
{0, 660, EIF_FALSE, &T660f16, 0},
{0, 661, EIF_FALSE, &T661f20, 0},
{0, 662, EIF_FALSE, 0, 0},
{0, 663, EIF_FALSE, 0, 0},
{0, 664, EIF_FALSE, 0, 0},
{0, 665, EIF_FALSE, 0, 0},
{0, 666, EIF_FALSE, 0, 0},
{0, 667, EIF_FALSE, 0, 0},
{0, 668, EIF_FALSE, 0, 0},
{0, 669, EIF_FALSE, 0, 0},
{0, 670, EIF_FALSE, 0, 0},
{0, 671, EIF_FALSE, 0, 0},
{0, 672, EIF_FALSE, 0, 0},
{0, 673, EIF_FALSE, 0, 0},
{0, 674, EIF_FALSE, 0, 0},
{0, 675, EIF_FALSE, 0, 0},
{0, 676, EIF_FALSE, 0, 0},
{0, 677, EIF_FALSE, 0, 0},
{0, 678, EIF_FALSE, 0, 0},
{0, 679, EIF_FALSE, 0, 0},
{0, 680, EIF_TRUE, 0, 0},
{0, 681, EIF_FALSE, 0, 0},
{0, 682, EIF_FALSE, 0, 0},
{0, 683, EIF_FALSE, 0, 0},
{0, 684, EIF_FALSE, 0, 0},
{0, 685, EIF_TRUE, 0, 0},
{0, 686, EIF_TRUE, 0, 0}
};

int GE_main(int argc, EIF_NATIVE_CHAR** argv)
{
	T0* t1;
	GE_argc = argc;
	GE_argv = argv;
	GE_last_rescue = 0;
	GE_init_gc();
	GE_init_identified();
	GE_const_init();
#ifdef EIF_WINDOWS
	eif_hInstance = GetModuleHandle(NULL);
#endif
	t1 = T21c20();
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
	copyright: "Copyright (c) 2007-2013, Eric Bezault and others"
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
	cmd = GE_nstrdup(GetCommandLineW());
	GE_get_argcargv(cmd, &argc, &argv);
	code = GE_main(argc, argv);
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
	copyright: "Copyright (c) 2007-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_GC_C
#define GE_GC_C

/*
 * Allocate more memory for the given pointer.
 * The reallocated pointer keeps the same properties (e.g. atomic or not, collectable or not).
 * The extra allocated memory is zeroed.
 * The allocated object is itself collectable.
 */
void* GE_recalloc(void* p, size_t old_nelem, size_t new_nelem, size_t elsize) {
	void* new_p;
#ifdef EIF_BOEHM_GC
	new_p = GE_null(GC_REALLOC(p, new_nelem * elsize));
#else /* No GC */
	new_p = GE_null(realloc(p, new_nelem * elsize));
#endif
	memset(((char*) new_p) + (old_nelem * elsize), 0, (new_nelem - old_nelem) * elsize);
	return new_p;
}



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
	copyright: "Copyright (c) 2007-2010, Eric Bezault and others"
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
	return GE_ms8("Not implemented yet",19);
}

EIF_REFERENCE eeltag(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eeltag' in 'eif_except.h' not implemented\n");
	return GE_ms8("Not implemented yet",19);
}

EIF_REFERENCE eelrout(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eelrout' in 'eif_except.h' not implemented\n");
	return GE_ms8("Not implemented yet",19);
}

EIF_REFERENCE eelclass(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eelclass' in 'eif_except.h' not implemented\n");
	return GE_ms8("Not implemented yet",19);
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
	return GE_ms8("Not implemented yet",19);
}

EIF_REFERENCE eeotag(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eeotag' in 'eif_except.h' not implemented\n");
	return GE_ms8("Not implemented yet",19);
}

long eeocode(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eeocode' in 'eif_except.h' not implemented\n");
	return 0;
}

EIF_REFERENCE eeorout(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eeorout' in 'eif_except.h' not implemented\n");
	return GE_ms8("Not implemented yet",19);
}

EIF_REFERENCE eeoclass(void) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eeoclass' in 'eif_except.h' not implemented\n");
	return GE_ms8("Not implemented yet",19);
}

char eedefined(long ex) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eedefined' in 'eif_except.h' not implemented\n");
	return '\1';
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

/*
 * Raise "out of mnemory" exception.
 */
 void enomem(void) {
	xraise(EN_OMEM);
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
	return GE_ms8(str, strlen(str));
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
	return GE_ms8(str, strlen(str));
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
