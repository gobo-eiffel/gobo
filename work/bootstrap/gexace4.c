#include "gexace.h"

#ifdef __cplusplus
extern "C" {
#endif

/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].set_internal_cursor */
void T97f52(T0* C, T0* a1)
{
	((T97*)(C))->a8 = a1;
}

/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_slots */
void T97f51(T0* C, T6 a1)
{
	T0* t1;
	t1 = (T97f22(C));
	((T97*)(C))->a14 = (T53f2(GE_void(t1), a1));
}

/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_clashes */
void T97f50(T0* C, T6 a1)
{
	T0* t1;
	t1 = (T97f22(C));
	((T97*)(C))->a12 = (T53f2(GE_void(t1), a1));
}

/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_key_storage */
void T97f49(T0* C, T6 a1)
{
	((T97*)(C))->a17 = T54c3();
	((T97*)(C))->a11 = (T54f2(GE_void(((T97*)(C))->a17), a1));
}

/* DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING_8].make_item_storage */
void T97f48(T0* C, T6 a1)
{
	((T97*)(C))->a16 = T165c3();
	((T97*)(C))->a10 = (T165f1(GE_void(((T97*)(C))->a16), a1));
}

/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY_CONFIG].make */
T0* T165f1(T0* C, T6 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	R = T164c5(l1, a1);
	return R;
}

/* SPECIAL [ET_XACE_LIBRARY_CONFIG].make_filled */
T0* T164c5(T0* a1, T6 a2)
{
	T0* C;
	T6 t1;
	C = GE_new164(a2, EIF_TRUE);
	T164f7(C, a2);
	t1 = ((T6)((a2)-((T6)(GE_int32(1)))));
	T164f8(C, a1, (T6)(GE_int32(0)), t1);
	return C;
}

/* SPECIAL [ET_XACE_LIBRARY_CONFIG].fill_with */
void T164f8(T0* C, T0* a1, T6 a2, T6 a3)
{
	T1 t1;
	T6 l1 = 0;
	T6 l2 = 0;
	l1 = a2;
	l2 = ((T6)((a3)+((T6)(GE_int32(1)))));
	while (1) {
		t1 = (((((l1) == (l2)))));
		if (t1) {
			break;
		}
		((T164*)(C))->z2[l1] = (a1);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
}

/* SPECIAL [ET_XACE_LIBRARY_CONFIG].make */
void T164f7(T0* C, T6 a1)
{
}

/* KL_SPECIAL_ROUTINES [ET_XACE_LIBRARY_CONFIG].default_create */
T0* T165c3(void)
{
	T0* C;
	C = GE_new165(EIF_TRUE);
	return C;
}

/* ET_XACE_AST_FACTORY.make */
T0* T87c10(void)
{
	T0* C;
	C = GE_new87(EIF_TRUE);
	return C;
}

/* GEXACE_LIBRARY_COMMAND.execute */
void T40f15(T0* C)
{
	T1 t1;
	T0* t2;
	T6 t3;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	l1 = T80c248(((T40*)(C))->a3, ((T40*)(C))->a4);
	T80f249(GE_void(l1), ((T40*)(C))->a6);
	T80f250(GE_void(l1), ((T40*)(C))->a8);
	l3 = T77c37(((T40*)(C))->a5);
	T77f39(GE_void(l3));
	t1 = (T77f20(GE_void(l3)));
	if (t1) {
		T80f251(GE_void(l1), l3);
		T77f40(GE_void(l3));
		l2 = (((T80*)(GE_void(l1)))->a1);
		t1 = ((l2)!=(EIF_VOID));
		if (t1) {
			t2 = (((T81*)(GE_void(l2)))->a1);
			t1 = ((t2)!=(EIF_VOID));
		}
		if (t1) {
			t2 = (((T81*)(GE_void(l2)))->a1);
			t3 = (((((T0*)(GE_void(t2)))->id==17)?((T17*)(t2))->a2:((T232*)(t2))->a1));
			t1 = (T6f4(&t3, (T6)(GE_int32(0))));
		}
		if (t1) {
			T40f16(C, l2);
		}
	} else {
		T28f16(GE_void(((T40*)(C))->a4), ((T40*)(C))->a5);
	}
}

/* GEXACE_LIBRARY_COMMAND.execute_generators */
void T40f16(T0* C, T0* a1)
{
	T1 t1;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	l1 = (T46f5(GE_void(((T40*)(C))->a2)));
	T64f8(GE_void(l1));
	while (1) {
		t1 = (((T64*)(GE_void(l1)))->a3);
		if (t1) {
			break;
		}
		l2 = (T64f6(GE_void(l1)));
		t1 = ((((T40*)(C))->a7)!=(EIF_VOID));
		if (t1) {
			l3 = ((T40*)(C))->a7;
		} else {
			l3 = (T42x2677(GE_void(l2)));
		}
		l4 = T79c21(l3);
		T79f23(GE_void(l4));
		t1 = (T79f12(GE_void(l4)));
		if (t1) {
			T42x2683T0T0(GE_void(l2), a1, l4);
			T79f24(GE_void(l4));
		} else {
			T28f17(GE_void(((T40*)(C))->a4), l3);
		}
		T64f9(GE_void(l1));
	}
}

/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].forth */
void T64f9(T0* C)
{
	T46f12(GE_void(((T64*)(C))->a1), C);
}

/* DS_LINKED_LIST [ET_XACE_GENERATOR].cursor_forth */
void T46f12(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (((T64*)(a1))->a2);
	if (t1) {
		l1 = EIF_TRUE;
		l3 = ((T46*)(C))->a2;
	} else {
		t2 = (((T64*)(a1))->a4);
		l3 = (((T65*)(GE_void(t2)))->a2);
	}
	l2 = ((l3)==(EIF_VOID));
	T64f10(a1, l3, EIF_FALSE, l2);
	if (l2) {
		t1 = ((T1)(!(l1)));
		if (t1) {
			T46f14(C, a1);
		}
	} else {
		if (l1) {
			T46f13(C, a1);
		}
	}
}

/* DS_LINKED_LIST [ET_XACE_GENERATOR].add_traversing_cursor */
void T46f13(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	t1 = ((a1)!=(((T46*)(C))->a4));
	if (t1) {
		t2 = (((T64*)(GE_void(((T46*)(C))->a4)))->a5);
		T64f11(a1, t2);
		T64f11(GE_void(((T46*)(C))->a4), a1);
	}
}

/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].set_next_cursor */
void T64f11(T0* C, T0* a1)
{
	((T64*)(C))->a5 = a1;
}

/* DS_LINKED_LIST [ET_XACE_GENERATOR].remove_traversing_cursor */
void T46f14(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* l1 = 0;
	T0* l2 = 0;
	t1 = ((a1)!=(((T46*)(C))->a4));
	if (t1) {
		l2 = ((T46*)(C))->a4;
		l1 = (((T64*)(GE_void(l2)))->a5);
		while (1) {
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
			if (t1) {
				break;
			}
			l2 = l1;
			l1 = (((T64*)(GE_void(l1)))->a5);
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T64*)(a1))->a5);
			T64f11(GE_void(l2), t2);
			T64f11(a1, EIF_VOID);
		}
	}
}

/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].set */
void T64f10(T0* C, T0* a1, T1 a2, T1 a3)
{
	((T64*)(C))->a4 = a1;
	((T64*)(C))->a2 = a2;
	((T64*)(C))->a3 = a3;
}

/* ET_XACE_DEFAULT_ERROR_HANDLER.report_cannot_write_file_error */
void T28f17(T0* C, T0* a1)
{
	T0* l1 = 0;
	l1 = T85c7(a1);
	T28f11(C, l1);
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.make */
T0* T85c7(T0* a1)
{
	T0* C;
	C = GE_new85(EIF_TRUE);
	((T85*)(C))->a1 = T63c6((T6)(GE_int32(1)), (T6)(GE_int32(1)));
	T63f7(GE_void(((T85*)(C))->a1), a1, (T6)(GE_int32(1)));
	return C;
}

/* KL_TEXT_OUTPUT_FILE.close */
void T79f24(T0* C)
{
	GE_rescue r;
	T1 t1;
	T1 l1 = 0;
	if (GE_setjmp(r.jb) != 0) {
		t1 = ((T1)(!((T1)l1)));
		if (t1) {
			l1 = EIF_TRUE;
			goto GE_retry;
		}
		GE_raise(8);
	}
GE_retry:
	r.previous = GE_last_rescue;
	GE_last_rescue = &r;
	t1 = ((T1)(!((T1)l1)));
	if (t1) {
		T79f26(C);
	}
	GE_last_rescue = r.previous;
}

/* KL_TEXT_OUTPUT_FILE.is_open_write */
T1 T79f12(T0* C)
{
	T1 R = 0;
	R = (T79f8(C));
	return R;
}

/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
T1 T79f8(T0* C)
{
	T1 t1;
	T1 R = 0;
	t1 = (((((((T79*)(C))->a1) == ((T6)(GE_int32(2)))))));
	if (!(t1)) {
		t1 = (((((((T79*)(C))->a1) == ((T6)(GE_int32(4)))))));
	}
	if (!(t1)) {
		t1 = (((((((T79*)(C))->a1) == ((T6)(GE_int32(5)))))));
	}
	if (!(t1)) {
		R = (((((((T79*)(C))->a1) == ((T6)(GE_int32(3)))))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* KL_TEXT_OUTPUT_FILE.open_write */
void T79f23(T0* C)
{
	GE_rescue r;
	T1 t1;
	T1 l1 = 0;
	if (GE_setjmp(r.jb) != 0) {
		t1 = ((T1)(!((T1)l1)));
		if (t1) {
			l1 = EIF_TRUE;
			goto GE_retry;
		}
		GE_raise(8);
	}
GE_retry:
	r.previous = GE_last_rescue;
	GE_last_rescue = &r;
	t1 = ((T1)(!((T1)l1)));
	if (t1) {
		t1 = ((((T79*)(C))->a3)!=(ge64ov5153));
		if (t1) {
			T79f27(C);
		}
	} else {
		t1 = (T79f13(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T79f24(C);
		}
	}
	GE_last_rescue = r.previous;
}

/* KL_TEXT_OUTPUT_FILE.is_closed */
T1 T79f13(T0* C)
{
	T1 R = 0;
	R = (T79f11(C));
	return R;
}

/* KL_TEXT_OUTPUT_FILE.old_open_write */
void T79f27(T0* C)
{
	T14 t1;
	T1 t2;
	T79f27p1(C);
	t1 = (T79f18(C));
	t2 = (((((((T79*)(C))->a5) == (t1)))));
	if (t2) {
		((T79*)(C))->a1 = (T6)(GE_int32(0));
		((T79*)(C))->a6 = EIF_FALSE;
	}
}

/* KL_TEXT_OUTPUT_FILE.default_pointer */
T14 T79f18(T0* C)
{
	T14 R = 0;
	return R;
}

/* KL_TEXT_OUTPUT_FILE.open_write */
void T79f27p1(T0* C)
{
	T72 t1;
	T14 t2;
	T0* l1 = 0;
	l1 = (((((T0*)(GE_void(((T79*)(C))->a3)))->id==17)?T17f27(((T79*)(C))->a3):T232f10(((T79*)(C))->a3)));
	(t1).id = 72;
	(t1).a1 = ((l1?(T14)(GE_types[((T0*)(l1))->id].is_special?(T14)((T15*)(l1))->z2:(T14)l1):(T14)0));
	t2 = ((t1).a1);
	((T79*)(C))->a5 = (T79f19(C, t2, (T6)(GE_int32(1))));
	((T79*)(C))->a1 = (T6)(GE_int32(2));
}

/* KL_TEXT_OUTPUT_FILE.file_open */
T14 T79f19(T0* C, T14 a1, T6 a2)
{
	T14 R = 0;
	R = (T14)(EIF_POINTER )file_open((char *)a1,( int)a2);
	return R;
}

/* KL_TEXT_OUTPUT_FILE.make */
T0* T79c21(T0* a1)
{
	T0* C;
	T6 t1;
	T1 t2;
	T0* t3;
	C = GE_new79(EIF_TRUE);
	((T79*)(C))->a2 = a1;
	t1 = (((T17*)(GE_void(a1)))->a2);
	t2 = (T6f4(&t1, (T6)(GE_int32(0))));
	if (t2) {
		t3 = (T79f9(C));
		t3 = (T47f10(GE_void(t3), a1));
		T79f25(C, t3);
	} else {
		T79f25(C, ge64ov5153);
	}
	return C;
}

/* KL_TEXT_OUTPUT_FILE.old_make */
void T79f25(T0* C, T0* a1)
{
	((T79*)(C))->a3 = a1;
	((T79*)(C))->a1 = (T6)(GE_int32(0));
	((T79*)(C))->a4 = T17c41();
}

/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].item */
T0* T64f6(T0* C)
{
	T0* R = 0;
	R = (((T65*)(GE_void(((T64*)(C))->a4)))->a1);
	return R;
}

/* DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR].start */
void T64f8(T0* C)
{
	T46f11(GE_void(((T64*)(C))->a1), C);
}

/* DS_LINKED_LIST [ET_XACE_GENERATOR].cursor_start */
void T46f11(T0* C, T0* a1)
{
	T1 t1;
	T1 l1 = 0;
	T1 l2 = 0;
	l1 = (T46f7(C, a1));
	l2 = ((((T46*)(C))->a2)==(EIF_VOID));
	T64f10(a1, ((T46*)(C))->a2, EIF_FALSE, l2);
	t1 = ((T1)(!(l2)));
	if (t1) {
		t1 = (l1);
	}
	if (t1) {
		T46f13(C, a1);
	}
}

/* DS_LINKED_LIST [ET_XACE_GENERATOR].cursor_off */
T1 T46f7(T0* C, T0* a1)
{
	T0* t1;
	T1 R = 0;
	t1 = (((T64*)(a1))->a4);
	R = ((t1)==(EIF_VOID));
	return R;
}

/* ET_XACE_LIBRARY_CONFIG_PARSER.parse_file */
void T80f251(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	((T80*)(C))->a1 = EIF_VOID;
	T99f203(GE_void(((T80*)(C))->a6), a1);
	t1 = (T99f121(GE_void(((T80*)(C))->a6)));
	if (t1) {
		t2 = (((T92*)(GE_void(((T80*)(C))->a7)))->a1);
		t1 = (((T93*)(GE_void(t2)))->a1);
		t1 = ((T1)(!(t1)));
		if (t1) {
			l1 = (T92f5(GE_void(((T80*)(C))->a7)));
			l2 = (((T88*)(GE_void(l1)))->a1);
			t2 = (((T92*)(GE_void(((T80*)(C))->a7)))->a2);
			l3 = (((T94*)(GE_void(t2)))->a1);
			T95f32(GE_void(((T80*)(C))->a8), l1, l3);
			t1 = (((T95*)(GE_void(((T80*)(C))->a8)))->a1);
			t1 = ((T1)(!(t1)));
			if (t1) {
				T96f11(GE_void(((T80*)(C))->a9), l2, l3);
				((T80*)(C))->a1 = (T80f12(C, l2, l3));
				T97f38(GE_void(((T80*)(C))->a10));
			}
		} else {
			t2 = (T92f8(GE_void(((T80*)(C))->a7)));
			T28f18(GE_void(((T80*)(C))->a11), t2);
		}
	} else {
		t2 = (T99f89(GE_void(((T80*)(C))->a6)));
		T28f18(GE_void(((T80*)(C))->a11), t2);
	}
}

/* ET_XACE_LIBRARY_CONFIG_PARSER.new_library */
T0* T80f12(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T0* R = 0;
	R = (T87f5(GE_void(((T80*)(C))->a4)));
	t1 = (T80f14(C));
	t1 = (T141f1(GE_void(t1)));
	T80f254(C, R, a1, a2, t1);
	T81f14(GE_void(R));
	return R;
}

/* ET_XACE_LIBRARY_CONFIG_PARSER.tokens */
T0* T80f14(T0* C)
{
	T0* R = 0;
	if (ge916os4794) {
		return ge916ov4794;
	} else {
		ge916os4794 = '\1';
		ge916ov4794 = R;
	}
	R = T141c129();
	ge916ov4794 = R;
	return R;
}

/* ET_XACE_LIBRARY_CONFIG_PARSER.set_ve */
void T80f250(T0* C, T1 a1)
{
	T1 t1;
	((T80*)(C))->a3 = a1;
	t1 = (((T80*)(GE_void(((T80*)(C))->a5)))->a3);
	t1 = (((((t1) != (a1)))));
	if (t1) {
		T80f250(GE_void(((T80*)(C))->a5), a1);
	}
}

/* ET_XACE_LIBRARY_CONFIG_PARSER.set_shallow */
void T80f249(T0* C, T1 a1)
{
	T1 t1;
	((T80*)(C))->a2 = a1;
	t1 = (((T80*)(GE_void(((T80*)(C))->a5)))->a2);
	t1 = (((((t1) != (a1)))));
	if (t1) {
		T80f249(GE_void(((T80*)(C))->a5), a1);
	}
}

/* ET_XACE_LIBRARY_CONFIG_PARSER.make_with_variables */
T0* T80c248(T0* a1, T0* a2)
{
	T0* C;
	C = GE_new80(EIF_TRUE);
	((T80*)(C))->a4 = T87c10();
	T80f252(C, a1, ((T80*)(C))->a4, a2);
	return C;
}

/* GEXACE_SYSTEM_COMMAND.execute */
void T36f15(T0* C)
{
	T1 t1;
	T0* t2;
	T1 t3;
	T6 t4;
	T1 t5;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	l1 = T75c250(((T36*)(C))->a3, ((T36*)(C))->a4);
	T75f251(GE_void(l1), ((T36*)(C))->a6);
	T75f252(GE_void(l1), ((T36*)(C))->a8);
	l3 = T77c37(((T36*)(C))->a5);
	T77f39(GE_void(l3));
	t1 = (T77f20(GE_void(l3)));
	if (t1) {
		T75f253(GE_void(l1), l3);
		T77f40(GE_void(l3));
		l2 = (((T75*)(GE_void(l1)))->a1);
		t1 = ((l2)!=(EIF_VOID));
		if (t1) {
			t2 = (((T76*)(GE_void(l2)))->a1);
			t3 = ((t2)!=(EIF_VOID));
			if (t3) {
				t2 = (((T76*)(GE_void(l2)))->a1);
				t4 = (((((T0*)(GE_void(t2)))->id==17)?((T17*)(t2))->a2:((T232*)(t2))->a1));
				t3 = (T6f4(&t4, (T6)(GE_int32(0))));
			}
			if (t3) {
				t2 = (((T76*)(GE_void(l2)))->a2);
				t5 = ((t2)!=(EIF_VOID));
				if (t5) {
					t2 = (((T76*)(GE_void(l2)))->a2);
					t4 = (((((T0*)(GE_void(t2)))->id==17)?((T17*)(t2))->a2:((T232*)(t2))->a1));
					t3 = (T6f4(&t4, (T6)(GE_int32(0))));
				} else {
					t3 = EIF_FALSE;
				}
			}
			if (t3) {
				t2 = (((T76*)(GE_void(l2)))->a3);
				t3 = ((t2)!=(EIF_VOID));
				if (t3) {
					t2 = (((T76*)(GE_void(l2)))->a3);
					t4 = (((((T0*)(GE_void(t2)))->id==17)?((T17*)(t2))->a2:((T232*)(t2))->a1));
					t1 = (T6f4(&t4, (T6)(GE_int32(0))));
				} else {
					t1 = EIF_FALSE;
				}
			} else {
				t1 = EIF_FALSE;
			}
		}
		if (t1) {
			T36f16(C, l2);
		}
	} else {
		T28f16(GE_void(((T36*)(C))->a4), ((T36*)(C))->a5);
	}
}

/* GEXACE_SYSTEM_COMMAND.execute_generators */
void T36f16(T0* C, T0* a1)
{
	T1 t1;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	l1 = (T46f5(GE_void(((T36*)(C))->a2)));
	T64f8(GE_void(l1));
	while (1) {
		t1 = (((T64*)(GE_void(l1)))->a3);
		if (t1) {
			break;
		}
		l2 = (T64f6(GE_void(l1)));
		t1 = ((((T36*)(C))->a7)!=(EIF_VOID));
		if (t1) {
			l3 = ((T36*)(C))->a7;
		} else {
			l3 = (T42x2676(GE_void(l2)));
		}
		l4 = T79c21(l3);
		T79f23(GE_void(l4));
		t1 = (T79f12(GE_void(l4)));
		if (t1) {
			T42x2682T0T0(GE_void(l2), a1, l4);
			T79f24(GE_void(l4));
		} else {
			T28f17(GE_void(((T36*)(C))->a4), l3);
		}
		T64f9(GE_void(l1));
	}
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.parse_file */
void T75f253(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	((T75*)(C))->a1 = EIF_VOID;
	T99f203(GE_void(((T75*)(C))->a6), a1);
	t1 = (T99f121(GE_void(((T75*)(C))->a6)));
	if (t1) {
		t2 = (((T92*)(GE_void(((T75*)(C))->a7)))->a1);
		t1 = (((T93*)(GE_void(t2)))->a1);
		t1 = ((T1)(!(t1)));
		if (t1) {
			l1 = (T92f5(GE_void(((T75*)(C))->a7)));
			l2 = (((T88*)(GE_void(l1)))->a1);
			t2 = (((T92*)(GE_void(((T75*)(C))->a7)))->a2);
			l3 = (((T94*)(GE_void(t2)))->a1);
			T95f31(GE_void(((T75*)(C))->a8), l1, l3);
			t1 = (((T95*)(GE_void(((T75*)(C))->a8)))->a1);
			t1 = ((T1)(!(t1)));
			if (t1) {
				T96f11(GE_void(((T75*)(C))->a9), l2, l3);
				((T75*)(C))->a1 = (T75f12(C, l2, l3));
				T97f38(GE_void(((T75*)(C))->a10));
			}
		} else {
			t2 = (T92f8(GE_void(((T75*)(C))->a7)));
			T28f18(GE_void(((T75*)(C))->a11), t2);
		}
	} else {
		t2 = (T99f89(GE_void(((T75*)(C))->a6)));
		T28f18(GE_void(((T75*)(C))->a11), t2);
	}
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.new_system */
T0* T75f12(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T0* R = 0;
	R = (T87f1(GE_void(((T75*)(C))->a2)));
	t1 = (T75f14(C));
	t1 = (T141f1(GE_void(t1)));
	T75f255(C, R, a1, a2, t1);
	T76f15(GE_void(R));
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.fill_system */
void T75f255(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T0* t1;
	T1 t2;
	T0* t3;
	T0* t4;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T0* l10 = 0;
	T0* l11 = 0;
	T0* l12 = 0;
	T6 l13 = 0;
	T6 l14 = 0;
	T0* l15 = 0;
	T0* l16 = 0;
	T0* l17 = 0;
	T0* l18 = 0;
	t1 = (T75f15(C));
	t2 = (T89f15(GE_void(a2), t1));
	if (t2) {
		t1 = (T75f15(C));
		t1 = (T89f18(GE_void(a2), t1));
		l1 = (((T145*)(GE_void(t1)))->a3);
	}
	t1 = (T75f16(C));
	t2 = (T89f19(GE_void(a2), t1));
	if (t2) {
		t1 = (T75f16(C));
		l2 = (T89f20(GE_void(a2), t1));
		t1 = (T75f17(C));
		t2 = (T89f15(GE_void(l2), t1));
		if (t2) {
			t1 = (T75f17(C));
			t1 = (T89f18(GE_void(l2), t1));
			l3 = (((T145*)(GE_void(t1)))->a3);
		}
		t1 = (T75f18(C));
		t2 = (T89f15(GE_void(l2), t1));
		if (t2) {
			t1 = (T75f18(C));
			t1 = (T89f18(GE_void(l2), t1));
			l4 = (((T145*)(GE_void(t1)))->a3);
		}
	}
	l5 = (T89f22(GE_void(a2)));
	T146f10(GE_void(l5));
	while (1) {
		t2 = (((T146*)(GE_void(l5)))->a1);
		if (t2) {
			break;
		}
		t1 = (T146f8(GE_void(l5)));
		if ((t1)==EIF_VOID) {
			l7 = EIF_VOID;
		} else {
			switch (((T0*)(t1))->id) {
			case 89:
				l7 = t1;
				break;
			default:
				l7 = EIF_VOID;
			}
		}
		t2 = ((l7)!=(EIF_VOID));
		if (t2) {
			t1 = (T75f19(C));
			t3 = (((T89*)(GE_void(l7)))->a2);
			t4 = (T75f20(C));
			t2 = (T47f1(GE_void(t1), t3, t4));
			if (t2) {
				t1 = (T75f15(C));
				t2 = (T89f15(GE_void(l7), t1));
				if (t2) {
					l8 = (T75f22(C, l7, ge1261ov4572, a3, a4));
					t2 = ((l8)!=(EIF_VOID));
					if (t2) {
						t2 = ((l10)==(EIF_VOID));
						if (t2) {
							l10 = (T87f2(GE_void(((T75*)(C))->a2), l8));
						} else {
							T108f6(GE_void(l10), l8);
						}
					}
				} else {
					l6 = (T89f22(GE_void(l7)));
					T146f10(GE_void(l6));
					while (1) {
						t2 = (((T146*)(GE_void(l6)))->a1);
						if (t2) {
							break;
						}
						t1 = (T146f8(GE_void(l6)));
						if ((t1)==EIF_VOID) {
							l7 = EIF_VOID;
						} else {
							switch (((T0*)(t1))->id) {
							case 89:
								l7 = t1;
								break;
							default:
								l7 = EIF_VOID;
							}
						}
						t2 = ((l7)!=(EIF_VOID));
						if (t2) {
							t1 = (T75f19(C));
							t3 = (((T89*)(GE_void(l7)))->a2);
							t4 = (T75f20(C));
							t2 = (T47f1(GE_void(t1), t3, t4));
							if (t2) {
								l8 = (T75f22(C, l7, ge1261ov4572, a3, a4));
								t2 = ((l8)!=(EIF_VOID));
								if (t2) {
									t2 = ((l10)==(EIF_VOID));
									if (t2) {
										l10 = (T87f2(GE_void(((T75*)(C))->a2), l8));
									} else {
										T108f6(GE_void(l10), l8);
									}
								}
							} else {
								t1 = (T75f19(C));
								t3 = (((T89*)(GE_void(l7)))->a2);
								t4 = (T75f23(C));
								t2 = (T47f1(GE_void(t1), t3, t4));
								if (t2) {
									l11 = (T75f24(C, l7, a3, a4));
									t2 = ((l11)!=(EIF_VOID));
									if (t2) {
										t2 = ((l12)==(EIF_VOID));
										if (t2) {
											l12 = (T87f3(GE_void(((T75*)(C))->a2)));
										}
										t1 = (((T118*)(GE_void(l11)))->a1);
										l16 = (T109f2(GE_void(l12), t1));
										t2 = ((l16)!=(EIF_VOID));
										if (t2) {
											t2 = (T118f7(GE_void(l11), l16));
											t2 = ((T1)(!(t2)));
											if (t2) {
												T28f20(GE_void(((T75*)(C))->a11), l11, l16);
											}
										} else {
											T109f6(GE_void(l12), l11);
										}
									}
								} else {
									t1 = (T75f19(C));
									t3 = (((T89*)(GE_void(l7)))->a2);
									t4 = (T75f25(C));
									t2 = (T47f1(GE_void(t1), t3, t4));
									if (t2) {
										t2 = ((l9)!=(EIF_VOID));
										if (t2) {
											T75f256(C, l9, l7, a3);
										} else {
											l9 = (T75f26(C, l7, a3));
										}
									} else {
										t1 = (T75f19(C));
										t3 = (((T89*)(GE_void(l7)))->a2);
										t4 = (T75f27(C));
										t2 = (T47f1(GE_void(t1), t3, t4));
										if (t2) {
											t2 = ((l9)==(EIF_VOID));
											if (t2) {
												l9 = (T87f4(GE_void(((T75*)(C))->a2)));
											}
											T75f257(C, l9, EIF_VOID, l7, a3);
										}
									}
								}
							}
						}
						T146f11(GE_void(l6));
					}
				}
			} else {
				t1 = (T75f19(C));
				t3 = (((T89*)(GE_void(l7)))->a2);
				t4 = (T75f23(C));
				t2 = (T47f1(GE_void(t1), t3, t4));
				if (t2) {
					l11 = (T75f24(C, l7, a3, a4));
					t2 = ((l11)!=(EIF_VOID));
					if (t2) {
						t2 = ((l12)==(EIF_VOID));
						if (t2) {
							l12 = (T87f3(GE_void(((T75*)(C))->a2)));
						}
						t1 = (((T118*)(GE_void(l11)))->a1);
						l16 = (T109f2(GE_void(l12), t1));
						t2 = ((l16)!=(EIF_VOID));
						if (t2) {
							t2 = (T118f7(GE_void(l11), l16));
							t2 = ((T1)(!(t2)));
							if (t2) {
								T28f20(GE_void(((T75*)(C))->a11), l11, l16);
							}
						} else {
							T109f6(GE_void(l12), l11);
						}
					}
				} else {
					t1 = (T75f19(C));
					t3 = (((T89*)(GE_void(l7)))->a2);
					t4 = (T75f25(C));
					t2 = (T47f1(GE_void(t1), t3, t4));
					if (t2) {
						t2 = ((l9)!=(EIF_VOID));
						if (t2) {
							T75f256(C, l9, l7, a3);
						} else {
							l9 = (T75f26(C, l7, a3));
						}
					} else {
						t1 = (T75f19(C));
						t3 = (((T89*)(GE_void(l7)))->a2);
						t4 = (T75f27(C));
						t2 = (T47f1(GE_void(t1), t3, t4));
						if (t2) {
							t2 = ((l9)==(EIF_VOID));
							if (t2) {
								l9 = (T87f4(GE_void(((T75*)(C))->a2)));
							}
							T75f257(C, l9, EIF_VOID, l7, a3);
						}
					}
				}
			}
		}
		T146f11(GE_void(l5));
	}
	t2 = ((l10)!=(EIF_VOID));
	if (t2) {
		t2 = ((l9)!=(EIF_VOID));
		if (t2) {
			t2 = (T110f207(GE_void(l9)));
			if (t2) {
				t1 = (T110f209(GE_void(l9)));
				l17 = (T113f22(GE_void(t1)));
				T111f7(GE_void(l17));
				while (1) {
					t2 = (T111f5(GE_void(l17)));
					if (t2) {
						break;
					}
					t1 = (T111f4(GE_void(l17)));
					l18 = (T108f2(GE_void(l10), t1));
					t2 = ((l18)!=(EIF_VOID));
					if (t2) {
						T116f43(GE_void(l18), EIF_TRUE);
					}
					T111f8(GE_void(l17));
				}
			}
		}
		t2 = ((l12)==(EIF_VOID));
		if (t2) {
			l12 = (T87f3(GE_void(((T75*)(C))->a2)));
		}
		T108f7(GE_void(l10), l12, ((T75*)(C))->a11);
		t1 = (((T109*)(GE_void(l12)))->a1);
		t2 = (T117f6(GE_void(t1)));
		if (t2) {
			l12 = EIF_VOID;
		}
	}
	t2 = ((l12)!=(EIF_VOID));
	if (t2) {
		T109f7(GE_void(l12), EIF_TRUE);
		l15 = (((T109*)(GE_void(l12)))->a1);
		l14 = (((T117*)(GE_void(l15)))->a1);
		l13 = (T6)(GE_int32(1));
		while (1) {
			t2 = (T6f4((&l13), l14));
			if (t2) {
				break;
			}
			t1 = (T117f10(GE_void(l15), l13));
			t1 = (((T118*)(GE_void(t1)))->a3);
			T81f15(GE_void(t1), l12, ((T75*)(C))->a11);
			l13 = ((T6)((l13)+((T6)(GE_int32(1)))));
		}
	}
	t2 = ((l9)==(EIF_VOID));
	if (t2) {
		l9 = (T87f4(GE_void(((T75*)(C))->a2)));
	}
	t2 = ((l10)!=(EIF_VOID));
	if (t2) {
		T76f9(GE_void(a1), l10);
	}
	T76f10(GE_void(a1), l1);
	T76f11(GE_void(a1), l3);
	T76f12(GE_void(a1), l4);
	T76f13(GE_void(a1), l9);
	T76f14(GE_void(a1), l12);
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.fill_externals */
void T75f257(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 t1;
	T0* t2;
	T0* t3;
	T0* t4;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	l1 = (T89f22(GE_void(a3)));
	T146f10(GE_void(l1));
	while (1) {
		t1 = (((T146*)(GE_void(l1)))->a1);
		if (t1) {
			break;
		}
		t2 = (T146f8(GE_void(l1)));
		if ((t2)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(t2))->id) {
			case 89:
				l2 = t2;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t1 = ((l2)!=(EIF_VOID));
		if (t1) {
			t2 = (T75f19(C));
			t3 = (((T89*)(GE_void(l2)))->a2);
			t4 = (T75f139(C));
			t1 = (T47f1(GE_void(t2), t3, t4));
			if (t1) {
				t2 = (T75f140(C));
				t1 = (T89f15(GE_void(l2), t2));
				if (t1) {
					t2 = (T75f140(C));
					t2 = (T89f18(GE_void(l2), t2));
					l4 = (((T145*)(GE_void(t2)))->a3);
					t1 = ((l4)!=(EIF_VOID));
					if (t1) {
						T110f432(GE_void(a1), l4);
					}
				}
			} else {
				t2 = (T75f19(C));
				t3 = (((T89*)(GE_void(l2)))->a2);
				t4 = (T75f141(C));
				t1 = (T47f1(GE_void(t2), t3, t4));
				if (t1) {
					t2 = (T75f140(C));
					t1 = (T89f15(GE_void(l2), t2));
					if (t1) {
						t2 = (T75f140(C));
						t2 = (T89f18(GE_void(l2), t2));
						l4 = (((T145*)(GE_void(t2)))->a3);
						t1 = ((l4)!=(EIF_VOID));
						if (t1) {
							T110f421(GE_void(a1), l4);
						}
					}
				} else {
					t2 = (T75f19(C));
					t3 = (((T89*)(GE_void(l2)))->a2);
					t4 = (T75f142(C));
					t1 = (T47f1(GE_void(t2), t3, t4));
					if (t1) {
						t1 = ((a2)!=(EIF_VOID));
						if (t1) {
							l3 = (T75f143(C, l2, a4));
							t1 = ((l3)!=(EIF_VOID));
							if (t1) {
								T116f35(GE_void(a2), l3);
							}
						}
					}
				}
			}
		}
		T146f11(GE_void(l1));
	}
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.new_export */
T0* T75f143(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	t1 = (T75f17(C));
	t2 = (T89f15(GE_void(a1), t1));
	if (t2) {
		t1 = (T75f17(C));
		t1 = (T89f18(GE_void(a1), t1));
		l1 = (((T145*)(GE_void(t1)))->a3);
		t2 = ((l1)!=(EIF_VOID));
		if (t2) {
			t3 = (((((T0*)(GE_void(l1)))->id==17)?((T17*)(l1))->a2:((T232*)(l1))->a1));
			t2 = (T6f4(&t3, (T6)(GE_int32(0))));
			if (t2) {
				l5 = (T87f4(GE_void(((T75*)(C))->a2)));
				R = (T87f8(GE_void(((T75*)(C))->a2), l1, l5));
				l2 = (T89f22(GE_void(a1)));
				T146f10(GE_void(l2));
				while (1) {
					t2 = (((T146*)(GE_void(l2)))->a1);
					if (t2) {
						break;
					}
					t1 = (T146f8(GE_void(l2)));
					if ((t1)==EIF_VOID) {
						l4 = EIF_VOID;
					} else {
						switch (((T0*)(t1))->id) {
						case 89:
							l4 = t1;
							break;
						default:
							l4 = EIF_VOID;
						}
					}
					t2 = ((l4)!=(EIF_VOID));
					if (t2) {
						t1 = (T75f19(C));
						t4 = (((T89*)(GE_void(l4)))->a2);
						t5 = (T75f246(C));
						t2 = (T47f1(GE_void(t1), t4, t5));
					}
					if (t2) {
						l3 = (T75f247(C, l4, a2));
						t2 = ((l3)!=(EIF_VOID));
						if (t2) {
							T121f5(GE_void(R), l3);
						}
					}
					T146f11(GE_void(l2));
				}
				t1 = (((T121*)(GE_void(R)))->a1);
				t2 = (T122f6(GE_void(t1)));
				if (t2) {
					T110f410(GE_void(l5), l1);
				}
			}
		}
	}
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.new_exported_feature */
T0* T75f247(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	t1 = (T75f15(C));
	t2 = (T89f15(GE_void(a1), t1));
	if (t2) {
		t1 = (T75f15(C));
		t1 = (T89f18(GE_void(a1), t1));
		l1 = (((T145*)(GE_void(t1)))->a3);
		t2 = ((l1)!=(EIF_VOID));
		if (t2) {
			t1 = (T75f249(C));
			t2 = (T89f15(GE_void(a1), t1));
			if (t2) {
				t1 = (T75f249(C));
				t1 = (T89f18(GE_void(a1), t1));
				l2 = (((T145*)(GE_void(t1)))->a3);
				t2 = ((l2)==(EIF_VOID));
				if (t2) {
					l2 = l1;
				}
			} else {
				l2 = l1;
			}
			t3 = (((((T0*)(GE_void(l1)))->id==17)?((T17*)(l1))->a2:((T232*)(l1))->a1));
			t2 = (T6f4(&t3, (T6)(GE_int32(0))));
			if (t2) {
				t3 = (((((T0*)(GE_void(l2)))->id==17)?((T17*)(l2))->a2:((T232*)(l2))->a1));
				t2 = (T6f4(&t3, (T6)(GE_int32(0))));
			}
			if (t2) {
				l3 = (T87f4(GE_void(((T75*)(C))->a2)));
				T110f410(GE_void(l3), l2);
				R = (T87f9(GE_void(((T75*)(C))->a2), l1, l3));
			}
		}
	}
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_alias */
T0* T75f249(T0* C)
{
	T0* R = 0;
	if (ge1258os2506) {
		return ge1258ov2506;
	} else {
		ge1258os2506 = '\1';
		ge1258ov2506 = R;
	}
	R = GE_ms8("alias", 5);
	ge1258ov2506 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_feature */
T0* T75f246(T0* C)
{
	T0* R = 0;
	if (ge1258os2507) {
		return ge1258ov2507;
	} else {
		ge1258os2507 = '\1';
		ge1258ov2507 = R;
	}
	R = GE_ms8("feature", 7);
	ge1258ov2507 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_export */
T0* T75f142(T0* C)
{
	T0* R = 0;
	if (ge1258os2505) {
		return ge1258ov2505;
	} else {
		ge1258os2505 = '\1';
		ge1258ov2505 = R;
	}
	R = GE_ms8("export", 6);
	ge1258ov2505 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_include_dir */
T0* T75f141(T0* C)
{
	T0* R = 0;
	if (ge1258os2504) {
		return ge1258ov2504;
	} else {
		ge1258os2504 = '\1';
		ge1258ov2504 = R;
	}
	R = GE_ms8("include_dir", 11);
	ge1258ov2504 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_location */
T0* T75f140(T0* C)
{
	T0* R = 0;
	if (ge1258os2491) {
		return ge1258ov2491;
	} else {
		ge1258os2491 = '\1';
		ge1258ov2491 = R;
	}
	R = GE_ms8("location", 8);
	ge1258ov2491 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_link_library */
T0* T75f139(T0* C)
{
	T0* R = 0;
	if (ge1258os2508) {
		return ge1258ov2508;
	} else {
		ge1258os2508 = '\1';
		ge1258ov2508 = R;
	}
	R = GE_ms8("link_library", 12);
	ge1258ov2508 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_external */
T0* T75f27(T0* C)
{
	T0* R = 0;
	if (ge1258os2495) {
		return ge1258ov2495;
	} else {
		ge1258os2495 = '\1';
		ge1258ov2495 = R;
	}
	R = GE_ms8("external", 8);
	ge1258ov2495 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.new_options */
T0* T75f26(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T87f4(GE_void(((T75*)(C))->a2)));
	T75f256(C, R, a1, a2);
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.fill_options */
void T75f256(T0* C, T0* a1, T0* a2, T0* a3)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* t4;
	T0* t5;
	T1 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T6 l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	l1 = EIF_TRUE;
	t1 = (T75f15(C));
	t2 = (T89f15(GE_void(a2), t1));
	if (t2) {
		l1 = EIF_FALSE;
		t1 = (T75f15(C));
		t1 = (T89f18(GE_void(a2), t1));
		l4 = (((T145*)(GE_void(t1)))->a3);
		t2 = ((l4)==(EIF_VOID));
		if (t2) {
		} else {
			t1 = (T75f28(C));
			t2 = (T89f15(GE_void(a2), t1));
			t2 = ((T1)(!(t2)));
			if (t2) {
			} else {
				t1 = (T75f28(C));
				t1 = (T89f18(GE_void(a2), t1));
				l5 = (((T145*)(GE_void(t1)))->a3);
				t2 = ((l5)==(EIF_VOID));
				if (t2) {
				} else {
					t1 = (T75f29(C));
					T149f36(GE_void(t1), l4);
					t1 = (T75f29(C));
					t2 = (T149f30(GE_void(t1)));
					if (t2) {
						t1 = (T75f29(C));
						t3 = (T149f22(GE_void(t1)));
						switch (t3) {
						case (T6)(T6)(GE_int32(1)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f382(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f382(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(2)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f383(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f383(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(3)):
							T110f384(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(4)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f385(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f385(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(5)):
							t3 = (((((T0*)(GE_void(l5)))->id==17)?((T17*)(l5))->a2:((T232*)(l5))->a1));
							t2 = (T6f4(&t3, (T6)(GE_int32(0))));
							if (t2) {
								T110f386(GE_void(a1), l5);
							} else {
								t1 = (T75f28(C));
								t4 = (T90f2(GE_void(a3), a2));
								T28f22(GE_void(((T75*)(C))->a11), a2, t1, t4);
							}
							break;
						case (T6)(T6)(GE_int32(6)):
							t1 = (T110f173(GE_void(a1)));
							t2 = (T113f26(GE_void(t1), l5));
							if (t2) {
								T110f387(GE_void(a1), l5);
							} else {
								t1 = (T75f28(C));
								t4 = (T110f173(GE_void(a1)));
								t5 = (T90f2(GE_void(a3), a2));
								T28f23(GE_void(((T75*)(C))->a11), a2, t1, l5, t4, t5);
							}
							break;
						case (T6)(T6)(GE_int32(7)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f388(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f388(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(8)):
							t1 = (T110f178(GE_void(a1)));
							t2 = (T113f26(GE_void(t1), l5));
							if (t2) {
								T110f389(GE_void(a1), l5);
							} else {
								t1 = (T75f28(C));
								t4 = (T110f178(GE_void(a1)));
								t5 = (T90f2(GE_void(a3), a2));
								T28f23(GE_void(((T75*)(C))->a11), a2, t1, l5, t4, t5);
							}
							break;
						case (T6)(T6)(GE_int32(9)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f390(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f390(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(10)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f391(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f391(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(11)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f391(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f391(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(12)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f392(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f392(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(13)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f393(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f393(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(14)):
							t3 = (((((T0*)(GE_void(l5)))->id==17)?((T17*)(l5))->a2:((T232*)(l5))->a1));
							t2 = (T6f4(&t3, (T6)(GE_int32(0))));
							if (t2) {
								T110f394(GE_void(a1), l5);
							} else {
								t1 = (T75f28(C));
								t4 = (T90f2(GE_void(a3), a2));
								T28f22(GE_void(((T75*)(C))->a11), a2, t1, t4);
							}
							break;
						case (T6)(T6)(GE_int32(15)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f395(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f395(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(16)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f396(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f396(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(17)):
							T110f397(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(18)):
							T110f398(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(19)):
							t1 = (T110f186(GE_void(a1)));
							t2 = (T113f26(GE_void(t1), l5));
							if (t2) {
								T110f399(GE_void(a1), l5);
							} else {
								t1 = (T75f28(C));
								t4 = (T110f186(GE_void(a1)));
								t5 = (T90f2(GE_void(a3), a2));
								T28f23(GE_void(((T75*)(C))->a11), a2, t1, l5, t4, t5);
							}
							break;
						case (T6)(T6)(GE_int32(20)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f400(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f400(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(21)):
							T110f401(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(22)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f402(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f402(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(23)):
							T110f403(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(24)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f404(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f404(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(25)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f405(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f405(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(26)):
							T110f406(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(27)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f407(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f407(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(28)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f408(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f408(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(29)):
							T110f409(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(30)):
							T110f410(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(31)):
							T110f411(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(32)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f412(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f412(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(33)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f413(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f413(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(34)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f414(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f414(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(35)):
							t2 = (((((T0*)(GE_void(l5)))->id==17)?T17f16(l5):T232f33(l5)));
							if (t2) {
								l6 = (((((T0*)(GE_void(l5)))->id==17)?T17f17(l5):T232f34(l5)));
								t2 = (T6f2((&l6), (T6)(GE_int32(0))));
								if (t2) {
									T110f415(GE_void(a1), l6);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f24(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							} else {
								t1 = (T75f28(C));
								t4 = (T90f2(GE_void(a3), a2));
								T28f24(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
							}
							break;
						case (T6)(T6)(GE_int32(36)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f416(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f416(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(37)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f417(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f417(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(38)):
							t1 = (T110f189(GE_void(a1)));
							t2 = (T113f26(GE_void(t1), l5));
							if (t2) {
								T110f418(GE_void(a1), l5);
							} else {
								t1 = (T75f28(C));
								t4 = (T110f189(GE_void(a1)));
								t5 = (T90f2(GE_void(a3), a2));
								T28f23(GE_void(((T75*)(C))->a11), a2, t1, l5, t4, t5);
							}
							break;
						case (T6)(T6)(GE_int32(39)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f419(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f419(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(40)):
							t2 = (((((T0*)(GE_void(l5)))->id==17)?T17f16(l5):T232f33(l5)));
							if (t2) {
								l6 = (((((T0*)(GE_void(l5)))->id==17)?T17f17(l5):T232f34(l5)));
								t2 = (T6f2((&l6), (T6)(GE_int32(0))));
								if (t2) {
									T110f420(GE_void(a1), l6);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f24(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							} else {
								t1 = (T75f28(C));
								t4 = (T90f2(GE_void(a3), a2));
								T28f24(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
							}
							break;
						case (T6)(T6)(GE_int32(41)):
							T110f421(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(42)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f422(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f422(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(43)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f423(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f423(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(44)):
							T110f424(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(45)):
							t1 = (T110f190(GE_void(a1)));
							t2 = (T113f26(GE_void(t1), l5));
							if (t2) {
								T110f425(GE_void(a1), l5);
							} else {
								t1 = (T75f28(C));
								t4 = (T110f190(GE_void(a1)));
								t5 = (T90f2(GE_void(a3), a2));
								T28f23(GE_void(((T75*)(C))->a11), a2, t1, l5, t4, t5);
							}
							break;
						case (T6)(T6)(GE_int32(46)):
							t2 = (((((T0*)(GE_void(l5)))->id==17)?T17f16(l5):T232f33(l5)));
							if (t2) {
								l6 = (((((T0*)(GE_void(l5)))->id==17)?T17f17(l5):T232f34(l5)));
								t2 = (T6f2((&l6), (T6)(GE_int32(0))));
								if (t2) {
									T110f426(GE_void(a1), l6);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f24(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							} else {
								t1 = (T75f28(C));
								t4 = (T90f2(GE_void(a3), a2));
								T28f24(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
							}
							break;
						case (T6)(T6)(GE_int32(47)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f427(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f427(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(48)):
							t1 = (T110f193(GE_void(a1)));
							t2 = (T113f26(GE_void(t1), l5));
							if (t2) {
								T110f428(GE_void(a1), l5);
							} else {
								t1 = (T75f28(C));
								t4 = (T110f193(GE_void(a1)));
								t5 = (T90f2(GE_void(a3), a2));
								T28f23(GE_void(((T75*)(C))->a11), a2, t1, l5, t4, t5);
							}
							break;
						case (T6)(T6)(GE_int32(49)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f429(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f429(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(50)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f430(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f430(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(51)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f431(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f431(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(52)):
							T110f432(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(53)):
							t1 = (T110f195(GE_void(a1)));
							t2 = (T113f26(GE_void(t1), l5));
							if (t2) {
								T110f433(GE_void(a1), l5);
							} else {
								t1 = (T75f28(C));
								t4 = (T110f195(GE_void(a1)));
								t5 = (T90f2(GE_void(a3), a2));
								T28f23(GE_void(((T75*)(C))->a11), a2, t1, l5, t4, t5);
							}
							break;
						case (T6)(T6)(GE_int32(54)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f434(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f434(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(55)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f435(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f435(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(56)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f436(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f436(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(57)):
							T110f437(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(58)):
							T110f438(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(59)):
							t2 = (((((T0*)(GE_void(l5)))->id==17)?T17f16(l5):T232f33(l5)));
							if (t2) {
								l6 = (((((T0*)(GE_void(l5)))->id==17)?T17f17(l5):T232f34(l5)));
								t2 = (T6f4((&l6), (T6)(GE_int32(0))));
								if (t2) {
									T110f439(GE_void(a1), l6);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f24(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							} else {
								t1 = (T75f28(C));
								t4 = (T90f2(GE_void(a3), a2));
								T28f24(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
							}
							break;
						case (T6)(T6)(GE_int32(60)):
							T110f440(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(61)):
							T110f441(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(62)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f442(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f442(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(63)):
							T110f443(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(64)):
							T110f444(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(65)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f445(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f445(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(66)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f446(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f446(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(67)):
							T110f447(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(68)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f448(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f448(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(69)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f449(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f449(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(70)):
							T110f450(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(71)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f451(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f451(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(72)):
							T110f452(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(73)):
							T110f453(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(74)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f454(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f454(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(75)):
							T110f455(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(76)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f456(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f456(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(77)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f457(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f457(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(78)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f458(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f458(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(79)):
							T110f459(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(80)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f460(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f460(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(81)):
							t2 = (((((T0*)(GE_void(l5)))->id==17)?T17f16(l5):T232f33(l5)));
							if (t2) {
								l6 = (((((T0*)(GE_void(l5)))->id==17)?T17f17(l5):T232f34(l5)));
								t2 = (T6f2((&l6), (T6)(GE_int32(0))));
								if (t2) {
									T110f461(GE_void(a1), l6);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f24(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							} else {
								t1 = (T75f28(C));
								t4 = (T90f2(GE_void(a3), a2));
								T28f24(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
							}
							break;
						case (T6)(T6)(GE_int32(83)):
							T110f462(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(84)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f463(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f463(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(85)):
							t1 = (T110f197(GE_void(a1)));
							t2 = (T113f26(GE_void(t1), l5));
							if (t2) {
								T110f464(GE_void(a1), l5);
							} else {
								t1 = (T75f28(C));
								t4 = (T110f197(GE_void(a1)));
								t5 = (T90f2(GE_void(a3), a2));
								T28f23(GE_void(((T75*)(C))->a11), a2, t1, l5, t4, t5);
							}
							break;
						case (T6)(T6)(GE_int32(86)):
							t1 = (T110f202(GE_void(a1)));
							t2 = (T113f26(GE_void(t1), l5));
							if (t2) {
								T110f465(GE_void(a1), l5);
							} else {
								t1 = (T75f28(C));
								t4 = (T110f202(GE_void(a1)));
								t5 = (T90f2(GE_void(a3), a2));
								T28f23(GE_void(((T75*)(C))->a11), a2, t1, l5, t4, t5);
							}
							break;
						case (T6)(T6)(GE_int32(87)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f466(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f466(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(88)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f467(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f467(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(89)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f468(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f468(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(90)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f469(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f469(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						case (T6)(T6)(GE_int32(91)):
							T110f470(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(92)):
							T110f471(GE_void(a1), l5);
							break;
						case (T6)(T6)(GE_int32(93)):
							t1 = (T110f205(GE_void(a1)));
							t2 = (T113f26(GE_void(t1), l5));
							if (t2) {
								T110f472(GE_void(a1), l5);
							} else {
								t1 = (T75f28(C));
								t4 = (T110f205(GE_void(a1)));
								t5 = (T90f2(GE_void(a3), a2));
								T28f23(GE_void(((T75*)(C))->a11), a2, t1, l5, t4, t5);
							}
							break;
						case (T6)(T6)(GE_int32(94)):
							t2 = (T75f123(C, l5));
							if (t2) {
								T110f473(GE_void(a1), EIF_TRUE);
							} else {
								t2 = (T75f124(C, l5));
								if (t2) {
									T110f473(GE_void(a1), EIF_FALSE);
								} else {
									t1 = (T75f28(C));
									t4 = (T90f2(GE_void(a3), a2));
									T28f21(GE_void(((T75*)(C))->a11), a2, t1, l5, t4);
								}
							}
							break;
						default:
							break;
						}
					}
				}
			}
		}
	}
	l2 = (T89f22(GE_void(a2)));
	T146f10(GE_void(l2));
	while (1) {
		t2 = (((T146*)(GE_void(l2)))->a1);
		if (t2) {
			break;
		}
		t1 = (T146f8(GE_void(l2)));
		if ((t1)==EIF_VOID) {
			l3 = EIF_VOID;
		} else {
			switch (((T0*)(t1))->id) {
			case 89:
				l3 = t1;
				break;
			default:
				l3 = EIF_VOID;
			}
		}
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			t2 = ((T1)(!(l1)));
			if (t2) {
			} else {
				t1 = (T75f19(C));
				t4 = (((T89*)(GE_void(l3)))->a2);
				t5 = (T75f25(C));
				t2 = (T47f1(GE_void(t1), t4, t5));
				if (t2) {
					T75f256(C, a1, l3, a3);
				} else {
					t1 = (T75f19(C));
					t4 = (((T89*)(GE_void(l3)))->a2);
					t5 = (T75f125(C));
					t2 = (T47f1(GE_void(t1), t4, t5));
					if (t2) {
						t1 = (T90f2(GE_void(a3), l3));
						T28f25(GE_void(((T75*)(C))->a11), l3, GE_ms8("<option name=\"assertion\" value=\"require\"/>", 42), t1);
						t1 = (T75f126(C));
						t2 = (T89f15(GE_void(l3), t1));
						if (t2) {
							t1 = (T75f126(C));
							t1 = (T89f18(GE_void(l3), t1));
							l7 = (((T145*)(GE_void(t1)))->a3);
							t2 = ((l7)!=(EIF_VOID));
							if (t2) {
								t2 = (T75f123(C, l7));
								if (t2) {
									T110f387(GE_void(a1), ge1230ov4786);
								}
							}
						} else {
							T110f387(GE_void(a1), ge1230ov4786);
						}
					} else {
						t1 = (T75f19(C));
						t4 = (((T89*)(GE_void(l3)))->a2);
						t5 = (T75f128(C));
						t2 = (T47f1(GE_void(t1), t4, t5));
						if (t2) {
							t1 = (T90f2(GE_void(a3), l3));
							T28f25(GE_void(((T75*)(C))->a11), l3, GE_ms8("<option name=\"assertion\" value=\"ensure\"/>", 41), t1);
							t1 = (T75f126(C));
							t2 = (T89f15(GE_void(l3), t1));
							if (t2) {
								t1 = (T75f126(C));
								t1 = (T89f18(GE_void(l3), t1));
								l7 = (((T145*)(GE_void(t1)))->a3);
								t2 = ((l7)!=(EIF_VOID));
								if (t2) {
									t2 = (T75f123(C, l7));
									if (t2) {
										T110f387(GE_void(a1), ge1230ov4772);
									}
								}
							} else {
								T110f387(GE_void(a1), ge1230ov4772);
							}
						} else {
							t1 = (T75f19(C));
							t4 = (((T89*)(GE_void(l3)))->a2);
							t5 = (T75f130(C));
							t2 = (T47f1(GE_void(t1), t4, t5));
							if (t2) {
								t1 = (T90f2(GE_void(a3), l3));
								T28f25(GE_void(((T75*)(C))->a11), l3, GE_ms8("<option name=\"assertion\" value=\"invariant\"/>", 44), t1);
								t1 = (T75f126(C));
								t2 = (T89f15(GE_void(l3), t1));
								if (t2) {
									t1 = (T75f126(C));
									t1 = (T89f18(GE_void(l3), t1));
									l7 = (((T145*)(GE_void(t1)))->a3);
									t2 = ((l7)!=(EIF_VOID));
									if (t2) {
										t2 = (T75f123(C, l7));
										if (t2) {
											T110f387(GE_void(a1), ge1230ov4777);
										}
									}
								} else {
									T110f387(GE_void(a1), ge1230ov4777);
								}
							} else {
								t1 = (T75f19(C));
								t4 = (((T89*)(GE_void(l3)))->a2);
								t5 = (T75f132(C));
								t2 = (T47f1(GE_void(t1), t4, t5));
								if (t2) {
									t1 = (T90f2(GE_void(a3), l3));
									T28f25(GE_void(((T75*)(C))->a11), l3, GE_ms8("<option name=\"assertion\" value=\"loop_[in]variant\"/>", 51), t1);
									t1 = (T75f126(C));
									t2 = (T89f15(GE_void(l3), t1));
									if (t2) {
										t1 = (T75f126(C));
										t1 = (T89f18(GE_void(l3), t1));
										l7 = (((T145*)(GE_void(t1)))->a3);
										t2 = ((l7)!=(EIF_VOID));
										if (t2) {
											t2 = (T75f123(C, l7));
											if (t2) {
												T110f387(GE_void(a1), ge1230ov4778);
												T110f387(GE_void(a1), ge1230ov4779);
											}
										}
									} else {
										T110f387(GE_void(a1), ge1230ov4778);
										T110f387(GE_void(a1), ge1230ov4779);
									}
								} else {
									t1 = (T75f19(C));
									t4 = (((T89*)(GE_void(l3)))->a2);
									t5 = (T75f135(C));
									t2 = (T47f1(GE_void(t1), t4, t5));
									if (t2) {
										t1 = (T90f2(GE_void(a3), l3));
										T28f25(GE_void(((T75*)(C))->a11), l3, GE_ms8("<option name=\"assertion\" value=\"check\"/>", 40), t1);
										t1 = (T75f126(C));
										t2 = (T89f15(GE_void(l3), t1));
										if (t2) {
											t1 = (T75f126(C));
											t1 = (T89f18(GE_void(l3), t1));
											l7 = (((T145*)(GE_void(t1)))->a3);
											t2 = ((l7)!=(EIF_VOID));
											if (t2) {
												t2 = (T75f123(C, l7));
												if (t2) {
													T110f387(GE_void(a1), ge1230ov4766);
												}
											}
										} else {
											T110f387(GE_void(a1), ge1230ov4766);
										}
									} else {
										t1 = (T75f19(C));
										t4 = (((T89*)(GE_void(l3)))->a2);
										t5 = (T75f137(C));
										t2 = (T47f1(GE_void(t1), t4, t5));
										if (t2) {
											t1 = (T90f2(GE_void(a3), l3));
											T28f25(GE_void(((T75*)(C))->a11), l3, GE_ms8("<option name=\"finalize\" value=\"true\"/>", 38), t1);
											t1 = (T75f126(C));
											t2 = (T89f15(GE_void(l3), t1));
											if (t2) {
												t1 = (T75f126(C));
												t1 = (T89f18(GE_void(l3), t1));
												l7 = (((T145*)(GE_void(t1)))->a3);
												t2 = ((l7)!=(EIF_VOID));
												if (t2) {
													t2 = (T75f123(C, l7));
													if (t2) {
														T110f412(GE_void(a1), EIF_TRUE);
													}
												}
											} else {
												T110f412(GE_void(a1), EIF_TRUE);
											}
										} else {
											t1 = (T75f19(C));
											t4 = (((T89*)(GE_void(l3)))->a2);
											t5 = (T75f138(C));
											t2 = (T47f1(GE_void(t1), t4, t5));
											if (t2) {
												t1 = (T75f15(C));
												t2 = (T89f15(GE_void(l3), t1));
												if (t2) {
													t1 = (T75f15(C));
													t1 = (T89f18(GE_void(l3), t1));
													l8 = (((T145*)(GE_void(t1)))->a3);
													t2 = ((l8)!=(EIF_VOID));
													if (t2) {
														t1 = (T75f19(C));
														t1 = (T47f9(GE_void(t1), GE_ms8("<option name=\"debug_tag\" value=\"", 32), l8));
														t1 = (((((T0*)(GE_void(t1)))->id==17)?T17f19(t1, GE_ms8("\"/>", 3)):T232f13(t1, GE_ms8("\"/>", 3))));
														t4 = (T90f2(GE_void(a3), l3));
														T28f25(GE_void(((T75*)(C))->a11), l3, t1, t4);
														t1 = (T75f126(C));
														t2 = (T89f15(GE_void(l3), t1));
														if (t2) {
															t1 = (T75f126(C));
															t1 = (T89f18(GE_void(l3), t1));
															l7 = (((T145*)(GE_void(t1)))->a3);
															t2 = ((l7)!=(EIF_VOID));
															if (t2) {
																t2 = (T75f123(C, l7));
																if (t2) {
																	T110f401(GE_void(a1), l8);
																}
															}
														} else {
															T110f401(GE_void(a1), l8);
														}
													}
												} else {
													t1 = (T75f126(C));
													t2 = (T89f15(GE_void(l3), t1));
													if (t2) {
														t1 = (T75f126(C));
														t1 = (T89f18(GE_void(l3), t1));
														l7 = (((T145*)(GE_void(t1)))->a3);
														t2 = ((l7)!=(EIF_VOID));
														if (t2) {
															t2 = (T75f123(C, l7));
															if (t2) {
																t1 = (T90f2(GE_void(a3), l3));
																T28f25(GE_void(((T75*)(C))->a11), l3, GE_ms8("<option name=\"debug\" value=\"true\"/>", 35), t1);
																T110f400(GE_void(a1), EIF_TRUE);
															} else {
																t2 = (T75f124(C, l7));
																if (t2) {
																	t1 = (T90f2(GE_void(a3), l3));
																	T28f25(GE_void(((T75*)(C))->a11), l3, GE_ms8("<option name=\"debug\" value=\"false\"/>", 36), t1);
																	T110f400(GE_void(a1), EIF_FALSE);
																} else {
																	t1 = (T90f2(GE_void(a3), l3));
																	T28f25(GE_void(((T75*)(C))->a11), l3, GE_ms8("<option name=\"debug\" value=\"true/false\"/>", 41), t1);
																}
															}
														}
													} else {
														t1 = (T90f2(GE_void(a3), l3));
														T28f25(GE_void(((T75*)(C))->a11), l3, GE_ms8("<option name=\"debug\" value=\"true\"/>", 35), t1);
														T110f400(GE_void(a1), EIF_TRUE);
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
			}
		}
		T146f11(GE_void(l2));
	}
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_debug */
T0* T75f138(T0* C)
{
	T0* R = 0;
	if (ge1258os2502) {
		return ge1258ov2502;
	} else {
		ge1258os2502 = '\1';
		ge1258ov2502 = R;
	}
	R = GE_ms8("debug", 5);
	ge1258ov2502 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_optimize */
T0* T75f137(T0* C)
{
	T0* R = 0;
	if (ge1258os2503) {
		return ge1258ov2503;
	} else {
		ge1258os2503 = '\1';
		ge1258ov2503 = R;
	}
	R = GE_ms8("optimize", 8);
	ge1258ov2503 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_check */
T0* T75f135(T0* C)
{
	T0* R = 0;
	if (ge1258os2501) {
		return ge1258ov2501;
	} else {
		ge1258os2501 = '\1';
		ge1258ov2501 = R;
	}
	R = GE_ms8("check", 5);
	ge1258ov2501 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_loop */
T0* T75f132(T0* C)
{
	T0* R = 0;
	if (ge1258os2500) {
		return ge1258ov2500;
	} else {
		ge1258os2500 = '\1';
		ge1258ov2500 = R;
	}
	R = GE_ms8("loop", 4);
	ge1258ov2500 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_invariant */
T0* T75f130(T0* C)
{
	T0* R = 0;
	if (ge1258os2499) {
		return ge1258ov2499;
	} else {
		ge1258os2499 = '\1';
		ge1258ov2499 = R;
	}
	R = GE_ms8("invariant", 9);
	ge1258ov2499 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_ensure */
T0* T75f128(T0* C)
{
	T0* R = 0;
	if (ge1258os2498) {
		return ge1258ov2498;
	} else {
		ge1258os2498 = '\1';
		ge1258ov2498 = R;
	}
	R = GE_ms8("ensure", 6);
	ge1258ov2498 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_enable */
T0* T75f126(T0* C)
{
	T0* R = 0;
	if (ge1258os2496) {
		return ge1258ov2496;
	} else {
		ge1258os2496 = '\1';
		ge1258ov2496 = R;
	}
	R = GE_ms8("enable", 6);
	ge1258ov2496 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_require */
T0* T75f125(T0* C)
{
	T0* R = 0;
	if (ge1258os2497) {
		return ge1258ov2497;
	} else {
		ge1258os2497 = '\1';
		ge1258ov2497 = R;
	}
	R = GE_ms8("require", 7);
	ge1258ov2497 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.is_false */
T1 T75f124(T0* C, T0* a1)
{
	T0* t1;
	T1 R = 0;
	t1 = (T75f19(C));
	R = (T47f11(GE_void(t1), a1, ge1261ov4571));
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.is_true */
T1 T75f123(T0* C, T0* a1)
{
	T0* t1;
	T1 R = 0;
	t1 = (T75f19(C));
	R = (T47f11(GE_void(t1), a1, ge1261ov4570));
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.option_codes */
T0* T75f29(T0* C)
{
	T0* t1;
	T0* R = 0;
	if (ge1230os4761) {
		return ge1230ov4761;
	} else {
		ge1230os4761 = '\1';
		ge1230ov4761 = R;
	}
	R = T149c35((T6)(GE_int32(94)));
	ge1230ov4761 = R;
	t1 = (T75f13(C));
	T149f37(GE_void(R), t1);
	T149f38(GE_void(R), (T6)(GE_int32(1)), ge1230ov4573);
	T149f38(GE_void(R), (T6)(GE_int32(2)), ge1230ov4574);
	T149f38(GE_void(R), (T6)(GE_int32(3)), ge1230ov4575);
	T149f38(GE_void(R), (T6)(GE_int32(4)), ge1230ov4576);
	T149f38(GE_void(R), (T6)(GE_int32(5)), ge1230ov4577);
	T149f38(GE_void(R), (T6)(GE_int32(6)), ge1230ov4578);
	T149f38(GE_void(R), (T6)(GE_int32(7)), ge1230ov4579);
	T149f38(GE_void(R), (T6)(GE_int32(8)), ge1230ov4580);
	T149f38(GE_void(R), (T6)(GE_int32(9)), ge1230ov4581);
	T149f38(GE_void(R), (T6)(GE_int32(10)), ge1230ov4582);
	T149f38(GE_void(R), (T6)(GE_int32(11)), ge1230ov4583);
	T149f38(GE_void(R), (T6)(GE_int32(12)), ge1230ov4584);
	T149f38(GE_void(R), (T6)(GE_int32(13)), ge1230ov4585);
	T149f38(GE_void(R), (T6)(GE_int32(14)), ge1230ov4586);
	T149f38(GE_void(R), (T6)(GE_int32(15)), ge1230ov4587);
	T149f38(GE_void(R), (T6)(GE_int32(16)), ge1230ov4588);
	T149f38(GE_void(R), (T6)(GE_int32(17)), ge1230ov4589);
	T149f38(GE_void(R), (T6)(GE_int32(18)), ge1230ov4590);
	T149f38(GE_void(R), (T6)(GE_int32(19)), ge1230ov4591);
	T149f38(GE_void(R), (T6)(GE_int32(20)), ge1230ov4592);
	T149f38(GE_void(R), (T6)(GE_int32(21)), ge1230ov4593);
	T149f38(GE_void(R), (T6)(GE_int32(22)), ge1230ov4594);
	T149f38(GE_void(R), (T6)(GE_int32(23)), ge1230ov4595);
	T149f38(GE_void(R), (T6)(GE_int32(24)), ge1230ov4596);
	T149f38(GE_void(R), (T6)(GE_int32(25)), ge1230ov4597);
	T149f38(GE_void(R), (T6)(GE_int32(26)), ge1230ov4598);
	T149f38(GE_void(R), (T6)(GE_int32(27)), ge1230ov4599);
	T149f38(GE_void(R), (T6)(GE_int32(28)), ge1230ov4600);
	T149f38(GE_void(R), (T6)(GE_int32(29)), ge1230ov4601);
	T149f38(GE_void(R), (T6)(GE_int32(30)), ge1230ov4602);
	T149f38(GE_void(R), (T6)(GE_int32(31)), ge1230ov4603);
	T149f38(GE_void(R), (T6)(GE_int32(32)), ge1230ov4604);
	T149f38(GE_void(R), (T6)(GE_int32(33)), ge1230ov4605);
	T149f38(GE_void(R), (T6)(GE_int32(34)), ge1230ov4606);
	T149f38(GE_void(R), (T6)(GE_int32(35)), ge1230ov4607);
	T149f38(GE_void(R), (T6)(GE_int32(36)), ge1230ov4608);
	T149f38(GE_void(R), (T6)(GE_int32(37)), ge1230ov4609);
	T149f38(GE_void(R), (T6)(GE_int32(38)), ge1230ov4610);
	T149f38(GE_void(R), (T6)(GE_int32(39)), ge1230ov4611);
	T149f38(GE_void(R), (T6)(GE_int32(40)), ge1230ov4612);
	T149f38(GE_void(R), (T6)(GE_int32(41)), ge1230ov4613);
	T149f38(GE_void(R), (T6)(GE_int32(42)), ge1230ov4614);
	T149f38(GE_void(R), (T6)(GE_int32(43)), ge1230ov4615);
	T149f38(GE_void(R), (T6)(GE_int32(44)), ge1230ov4616);
	T149f38(GE_void(R), (T6)(GE_int32(45)), ge1230ov4617);
	T149f38(GE_void(R), (T6)(GE_int32(46)), ge1230ov4618);
	T149f38(GE_void(R), (T6)(GE_int32(47)), ge1230ov4619);
	T149f38(GE_void(R), (T6)(GE_int32(48)), ge1230ov4620);
	T149f38(GE_void(R), (T6)(GE_int32(49)), ge1230ov4621);
	T149f38(GE_void(R), (T6)(GE_int32(50)), ge1230ov4622);
	T149f38(GE_void(R), (T6)(GE_int32(51)), ge1230ov4623);
	T149f38(GE_void(R), (T6)(GE_int32(52)), ge1230ov4624);
	T149f38(GE_void(R), (T6)(GE_int32(53)), ge1230ov4625);
	T149f38(GE_void(R), (T6)(GE_int32(54)), ge1230ov4626);
	T149f38(GE_void(R), (T6)(GE_int32(55)), ge1230ov4627);
	T149f38(GE_void(R), (T6)(GE_int32(56)), ge1230ov4628);
	T149f38(GE_void(R), (T6)(GE_int32(57)), ge1230ov4629);
	T149f38(GE_void(R), (T6)(GE_int32(58)), ge1230ov4630);
	T149f38(GE_void(R), (T6)(GE_int32(59)), ge1230ov4631);
	T149f38(GE_void(R), (T6)(GE_int32(60)), ge1230ov4632);
	T149f38(GE_void(R), (T6)(GE_int32(61)), ge1230ov4633);
	T149f38(GE_void(R), (T6)(GE_int32(62)), ge1230ov4634);
	T149f38(GE_void(R), (T6)(GE_int32(63)), ge1230ov4635);
	T149f38(GE_void(R), (T6)(GE_int32(64)), ge1230ov4636);
	T149f38(GE_void(R), (T6)(GE_int32(65)), ge1230ov4637);
	T149f38(GE_void(R), (T6)(GE_int32(66)), ge1230ov4638);
	T149f38(GE_void(R), (T6)(GE_int32(67)), ge1230ov4639);
	T149f38(GE_void(R), (T6)(GE_int32(68)), ge1230ov4640);
	T149f38(GE_void(R), (T6)(GE_int32(69)), ge1230ov4641);
	T149f38(GE_void(R), (T6)(GE_int32(70)), ge1230ov4642);
	T149f38(GE_void(R), (T6)(GE_int32(71)), ge1230ov4643);
	T149f38(GE_void(R), (T6)(GE_int32(72)), ge1230ov4644);
	T149f38(GE_void(R), (T6)(GE_int32(73)), ge1230ov4645);
	T149f38(GE_void(R), (T6)(GE_int32(74)), ge1230ov4646);
	T149f38(GE_void(R), (T6)(GE_int32(75)), ge1230ov4647);
	T149f38(GE_void(R), (T6)(GE_int32(76)), ge1230ov4648);
	T149f38(GE_void(R), (T6)(GE_int32(77)), ge1230ov4649);
	T149f38(GE_void(R), (T6)(GE_int32(78)), ge1230ov4650);
	T149f38(GE_void(R), (T6)(GE_int32(79)), ge1230ov4651);
	T149f38(GE_void(R), (T6)(GE_int32(80)), ge1230ov4652);
	T149f38(GE_void(R), (T6)(GE_int32(81)), ge1230ov4653);
	T149f38(GE_void(R), (T6)(GE_int32(82)), ge1230ov4654);
	T149f38(GE_void(R), (T6)(GE_int32(83)), ge1230ov4655);
	T149f38(GE_void(R), (T6)(GE_int32(84)), ge1230ov4656);
	T149f38(GE_void(R), (T6)(GE_int32(85)), ge1230ov4657);
	T149f38(GE_void(R), (T6)(GE_int32(86)), ge1230ov4658);
	T149f38(GE_void(R), (T6)(GE_int32(87)), ge1230ov4659);
	T149f38(GE_void(R), (T6)(GE_int32(88)), ge1230ov4660);
	T149f38(GE_void(R), (T6)(GE_int32(89)), ge1230ov4661);
	T149f38(GE_void(R), (T6)(GE_int32(90)), ge1230ov4662);
	T149f38(GE_void(R), (T6)(GE_int32(91)), ge1230ov4663);
	T149f38(GE_void(R), (T6)(GE_int32(92)), ge1230ov4664);
	T149f38(GE_void(R), (T6)(GE_int32(93)), ge1230ov4665);
	T149f38(GE_void(R), (T6)(GE_int32(94)), ge1230ov4666);
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.string_equality_tester */
T0* T75f13(T0* C)
{
	T0* R = 0;
	if (ge130os1769) {
		return ge130ov1769;
	} else {
		ge130os1769 = '\1';
		ge130ov1769 = R;
	}
	R = T25c3();
	ge130ov1769 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_value */
T0* T75f28(T0* C)
{
	T0* R = 0;
	if (ge1258os2487) {
		return ge1258ov2487;
	} else {
		ge1258os2487 = '\1';
		ge1258ov2487 = R;
	}
	R = GE_ms8("value", 5);
	ge1258ov2487 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_option */
T0* T75f25(T0* C)
{
	T0* R = 0;
	if (ge1258os2494) {
		return ge1258ov2494;
	} else {
		ge1258os2494 = '\1';
		ge1258ov2494 = R;
	}
	R = GE_ms8("option", 6);
	ge1258ov2494 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.new_mount */
T0* T75f24(T0* C, T0* a1, T0* a2, T0* a3)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	t1 = (T75f140(C));
	t2 = (T89f15(GE_void(a1), t1));
	if (t2) {
		t1 = (T75f140(C));
		t1 = (T89f18(GE_void(a1), t1));
		l1 = (((T145*)(GE_void(t1)))->a3);
		t2 = ((l1)!=(EIF_VOID));
		if (t2) {
			t1 = (T75f146(C));
			t2 = (T89f15(GE_void(a1), t1));
			if (t2) {
				t1 = (T75f146(C));
				t1 = (T89f18(GE_void(a1), t1));
				l3 = (((T145*)(GE_void(t1)))->a3);
			}
			T97f53(GE_void(((T75*)(C))->a10), l1);
			t2 = (T97f23(GE_void(((T75*)(C))->a10)));
			if (t2) {
				l2 = (T97f24(GE_void(((T75*)(C))->a10)));
			} else {
				l2 = (T87f5(GE_void(((T75*)(C))->a2)));
				T97f54(GE_void(((T75*)(C))->a10), l2, l1);
				t2 = ((T1)(!(((T75*)(C))->a3)));
				if (t2) {
					t3 = ((T1)(!(((T75*)(C))->a5)));
					if (!(t3)) {
						t3 = (((((T0*)(GE_void(l1)))->id==17)?T17f32(l1, GE_ms8("${VE_Lib}", 9)):T232f53(l1, GE_ms8("${VE_Lib}", 9))));
						t2 = ((T1)(!(t3)));
					} else {
						t2 = EIF_TRUE;
					}
				}
				if (t2) {
					t1 = (T75f148(C));
					l4 = (T131f2(GE_void(t1), l1));
					l5 = T77c37(l4);
					T77f39(GE_void(l5));
					t2 = (T77f20(GE_void(l5)));
					if (t2) {
						T80f257(GE_void(((T75*)(C))->a4), l2, l5, a3);
						T77f40(GE_void(l5));
					} else {
						T28f16(GE_void(((T75*)(C))->a11), l1);
					}
				}
			}
			t1 = (T90f2(GE_void(a2), a1));
			R = (T87f7(GE_void(((T75*)(C))->a2), l1, l2, t1));
			t2 = ((l3)!=(EIF_VOID));
			if (t2) {
				T118f11(GE_void(R), l3);
			}
		}
	}
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.execution_environment */
T0* T75f148(T0* C)
{
	T0* R = 0;
	if (ge113os1771) {
		return ge113ov1771;
	} else {
		ge113os1771 = '\1';
		ge113ov1771 = R;
	}
	R = T131c5();
	ge113ov1771 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_prefix */
T0* T75f146(T0* C)
{
	T0* R = 0;
	if (ge1258os2492) {
		return ge1258ov2492;
	} else {
		ge1258os2492 = '\1';
		ge1258ov2492 = R;
	}
	R = GE_ms8("prefix", 6);
	ge1258ov2492 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_mount */
T0* T75f23(T0* C)
{
	T0* R = 0;
	if (ge1258os2490) {
		return ge1258ov2490;
	} else {
		ge1258os2490 = '\1';
		ge1258ov2490 = R;
	}
	R = GE_ms8("mount", 5);
	ge1258ov2490 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.new_cluster */
T0* T75f22(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T0* l10 = 0;
	T0* l11 = 0;
	T0* l12 = 0;
	T0* l13 = 0;
	t1 = (T75f15(C));
	t2 = (T89f15(GE_void(a1), t1));
	if (t2) {
		t1 = (T75f15(C));
		t1 = (T89f18(GE_void(a1), t1));
		l1 = (((T145*)(GE_void(t1)))->a3);
		t2 = ((l1)!=(EIF_VOID));
		if (t2) {
			t3 = (((((T0*)(GE_void(l1)))->id==17)?((T17*)(l1))->a2:((T232*)(l1))->a1));
			t2 = (T6f4(&t3, (T6)(GE_int32(0))));
			if (t2) {
				t1 = (T75f140(C));
				t2 = (T89f15(GE_void(a1), t1));
				if (t2) {
					t1 = (T75f140(C));
					t1 = (T89f18(GE_void(a1), t1));
					l2 = (((T145*)(GE_void(t1)))->a3);
				}
				R = (T87f6(GE_void(((T75*)(C))->a2), l1, l2, a4));
				t1 = (T75f144(C));
				t2 = (T89f15(GE_void(a1), t1));
				if (t2) {
					t1 = (T75f144(C));
					t4 = (T90f2(GE_void(a3), a1));
					T28f35(GE_void(((T75*)(C))->a11), a1, t1, GE_ms8("<option name=\"abstract\" value=\"true/false\"/>", 44), t4);
					t1 = (T75f144(C));
					t1 = (T89f18(GE_void(a1), t1));
					l3 = (((T145*)(GE_void(t1)))->a3);
					t2 = ((l3)!=(EIF_VOID));
					if (t2) {
						t2 = (T75f123(C, l3));
						if (t2) {
							t2 = ((l7)==(EIF_VOID));
							if (t2) {
								l7 = (T87f4(GE_void(((T75*)(C))->a2)));
							}
							T110f382(GE_void(l7), EIF_TRUE);
						} else {
							t2 = (T75f124(C, l3));
							if (t2) {
								t2 = ((l7)==(EIF_VOID));
								if (t2) {
									l7 = (T87f4(GE_void(((T75*)(C))->a2)));
								}
								T110f382(GE_void(l7), EIF_FALSE);
							}
						}
					}
				}
				t1 = (T75f145(C));
				t2 = (T89f15(GE_void(a1), t1));
				if (t2) {
					t1 = (T75f145(C));
					t1 = (T89f18(GE_void(a1), t1));
					l3 = (((T145*)(GE_void(t1)))->a3);
					t2 = ((l3)!=(EIF_VOID));
					if (t2) {
						t2 = (T75f123(C, l3));
						if (t2) {
							T116f33(GE_void(R), EIF_TRUE);
						} else {
							t2 = (T75f124(C, l3));
							if (t2) {
								T116f33(GE_void(R), EIF_FALSE);
							}
						}
					}
				}
				l12 = a2;
				t1 = (T75f146(C));
				t2 = (T89f15(GE_void(a1), t1));
				if (t2) {
					t1 = (T75f146(C));
					t1 = (T89f18(GE_void(a1), t1));
					l12 = (((T145*)(GE_void(t1)))->a3);
				}
				T116f34(GE_void(R), l12);
				l4 = (T89f22(GE_void(a1)));
				T146f10(GE_void(l4));
				while (1) {
					t2 = (((T146*)(GE_void(l4)))->a1);
					if (t2) {
						break;
					}
					t1 = (T146f8(GE_void(l4)));
					if ((t1)==EIF_VOID) {
						l5 = EIF_VOID;
					} else {
						switch (((T0*)(t1))->id) {
						case 89:
							l5 = t1;
							break;
						default:
							l5 = EIF_VOID;
						}
					}
					t2 = ((l5)!=(EIF_VOID));
					if (t2) {
						t1 = (T75f19(C));
						t4 = (((T89*)(GE_void(l5)))->a2);
						t5 = (T75f20(C));
						t2 = (T47f1(GE_void(t1), t4, t5));
						if (t2) {
							l6 = (T75f22(C, l5, l12, a3, a4));
							t2 = ((l6)!=(EIF_VOID));
							if (t2) {
								t2 = ((l9)==(EIF_VOID));
								if (t2) {
									l9 = (T87f2(GE_void(((T75*)(C))->a2), l6));
								} else {
									T108f6(GE_void(l9), l6);
								}
							}
						} else {
							t1 = (T75f19(C));
							t4 = (((T89*)(GE_void(l5)))->a2);
							t5 = (T75f23(C));
							t2 = (T47f1(GE_void(t1), t4, t5));
							if (t2) {
								t1 = (((T142*)(GE_void(a4)))->a1);
								l10 = (T75f24(C, l5, a3, t1));
								t2 = ((l10)!=(EIF_VOID));
								if (t2) {
									t2 = ((l11)==(EIF_VOID));
									if (t2) {
										l11 = (T87f3(GE_void(((T75*)(C))->a2)));
									}
									t1 = (((T118*)(GE_void(l10)))->a1);
									l13 = (T109f2(GE_void(l11), t1));
									t2 = ((l13)!=(EIF_VOID));
									if (t2) {
										t2 = (T118f7(GE_void(l10), l13));
										t2 = ((T1)(!(t2)));
										if (t2) {
											T28f20(GE_void(((T75*)(C))->a11), l10, l13);
										}
									} else {
										T109f6(GE_void(l11), l10);
									}
								}
							} else {
								t1 = (T75f19(C));
								t4 = (((T89*)(GE_void(l5)))->a2);
								t5 = (T75f25(C));
								t2 = (T47f1(GE_void(t1), t4, t5));
								if (t2) {
									t2 = ((l7)!=(EIF_VOID));
									if (t2) {
										T75f256(C, l7, l5, a3);
									} else {
										l7 = (T75f26(C, l5, a3));
									}
								} else {
									t1 = (T75f19(C));
									t4 = (((T89*)(GE_void(l5)))->a2);
									t5 = (T75f17(C));
									t2 = (T47f1(GE_void(t1), t4, t5));
									if (t2) {
										l8 = (T75f147(C, l5, a3));
										t2 = ((l8)!=(EIF_VOID));
										if (t2) {
											T116f35(GE_void(R), l8);
										}
									} else {
										t1 = (T75f19(C));
										t4 = (((T89*)(GE_void(l5)))->a2);
										t5 = (T75f27(C));
										t2 = (T47f1(GE_void(t1), t4, t5));
										if (t2) {
											t2 = ((l7)==(EIF_VOID));
											if (t2) {
												l7 = (T87f4(GE_void(((T75*)(C))->a2)));
											}
											T75f257(C, l7, R, l5, a3);
										}
									}
								}
							}
						}
					}
					T146f11(GE_void(l4));
				}
				t2 = ((l7)!=(EIF_VOID));
				if (t2) {
					t2 = (T110f211(GE_void(l7)));
					if (t2) {
						t2 = (T110f213(GE_void(l7)));
						T116f36(GE_void(R), t2);
					}
					t2 = (T110f215(GE_void(l7)));
					if (t2) {
						t2 = (T110f217(GE_void(l7)));
						T116f37(GE_void(R), t2);
					}
					t2 = (T110f219(GE_void(l7)));
					if (t2) {
						t2 = (T110f222(GE_void(l7)));
						T116f38(GE_void(R), t2);
					}
				}
				T116f39(GE_void(R), l7);
				T116f40(GE_void(R), l9);
				T116f41(GE_void(R), l11);
			}
		}
	}
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.new_class */
T0* T75f147(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	t1 = (T75f15(C));
	t2 = (T89f15(GE_void(a1), t1));
	if (t2) {
		t1 = (T75f15(C));
		t1 = (T89f18(GE_void(a1), t1));
		l1 = (((T145*)(GE_void(t1)))->a3);
		t2 = ((l1)!=(EIF_VOID));
		if (t2) {
			t3 = (((((T0*)(GE_void(l1)))->id==17)?((T17*)(l1))->a2:((T232*)(l1))->a1));
			t2 = (T6f4(&t3, (T6)(GE_int32(0))));
			if (t2) {
				l2 = (T87f4(GE_void(((T75*)(C))->a2)));
				R = (T87f8(GE_void(((T75*)(C))->a2), l1, l2));
				l3 = (T89f22(GE_void(a1)));
				T146f10(GE_void(l3));
				while (1) {
					t2 = (((T146*)(GE_void(l3)))->a1);
					if (t2) {
						break;
					}
					t1 = (T146f8(GE_void(l3)));
					if ((t1)==EIF_VOID) {
						l4 = EIF_VOID;
					} else {
						switch (((T0*)(t1))->id) {
						case 89:
							l4 = t1;
							break;
						default:
							l4 = EIF_VOID;
						}
					}
					t2 = ((l4)!=(EIF_VOID));
					if (t2) {
						t1 = (T75f19(C));
						t4 = (((T89*)(GE_void(l4)))->a2);
						t5 = (T75f25(C));
						t2 = (T47f1(GE_void(t1), t4, t5));
						if (t2) {
							T75f256(C, l2, l4, a2);
						} else {
							t1 = (T75f19(C));
							t4 = (((T89*)(GE_void(l4)))->a2);
							t5 = (T75f246(C));
							t2 = (T47f1(GE_void(t1), t4, t5));
							if (t2) {
								l5 = (T75f248(C, l4, a2));
								t2 = ((l5)!=(EIF_VOID));
								if (t2) {
									T121f5(GE_void(R), l5);
								}
							}
						}
					}
					T146f11(GE_void(l3));
				}
			}
		}
	}
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.new_feature */
T0* T75f248(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* t4;
	T0* t5;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	t1 = (T75f15(C));
	t2 = (T89f15(GE_void(a1), t1));
	if (t2) {
		t1 = (T75f15(C));
		t1 = (T89f18(GE_void(a1), t1));
		l1 = (((T145*)(GE_void(t1)))->a3);
		t2 = ((l1)!=(EIF_VOID));
		if (t2) {
			t3 = (((((T0*)(GE_void(l1)))->id==17)?((T17*)(l1))->a2:((T232*)(l1))->a1));
			t2 = (T6f4(&t3, (T6)(GE_int32(0))));
			if (t2) {
				l2 = (T87f4(GE_void(((T75*)(C))->a2)));
				R = (T87f9(GE_void(((T75*)(C))->a2), l1, l2));
				l3 = (T89f22(GE_void(a1)));
				T146f10(GE_void(l3));
				while (1) {
					t2 = (((T146*)(GE_void(l3)))->a1);
					if (t2) {
						break;
					}
					t1 = (T146f8(GE_void(l3)));
					if ((t1)==EIF_VOID) {
						l4 = EIF_VOID;
					} else {
						switch (((T0*)(t1))->id) {
						case 89:
							l4 = t1;
							break;
						default:
							l4 = EIF_VOID;
						}
					}
					t2 = ((l4)!=(EIF_VOID));
					if (t2) {
						t1 = (T75f19(C));
						t4 = (((T89*)(GE_void(l4)))->a2);
						t5 = (T75f25(C));
						t2 = (T47f1(GE_void(t1), t4, t5));
						if (t2) {
							T75f256(C, l2, l4, a2);
						}
					}
					T146f11(GE_void(l3));
				}
			}
		}
	}
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_relative */
T0* T75f145(T0* C)
{
	T0* R = 0;
	if (ge1258os2489) {
		return ge1258ov2489;
	} else {
		ge1258os2489 = '\1';
		ge1258ov2489 = R;
	}
	R = GE_ms8("relative", 8);
	ge1258ov2489 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_abstract */
T0* T75f144(T0* C)
{
	T0* R = 0;
	if (ge1258os2488) {
		return ge1258ov2488;
	} else {
		ge1258os2488 = '\1';
		ge1258ov2488 = R;
	}
	R = GE_ms8("abstract", 8);
	ge1258ov2488 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_cluster */
T0* T75f20(T0* C)
{
	T0* R = 0;
	if (ge1258os2485) {
		return ge1258ov2485;
	} else {
		ge1258os2485 = '\1';
		ge1258ov2485 = R;
	}
	R = GE_ms8("cluster", 7);
	ge1258ov2485 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.string_ */
T0* T75f19(T0* C)
{
	T0* R = 0;
	if (ge37os1763) {
		return ge37ov1763;
	} else {
		ge37os1763 = '\1';
		ge37ov1763 = R;
	}
	R = T47c14();
	ge37ov1763 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_creation */
T0* T75f18(T0* C)
{
	T0* R = 0;
	if (ge1258os2483) {
		return ge1258ov2483;
	} else {
		ge1258os2483 = '\1';
		ge1258ov2483 = R;
	}
	R = GE_ms8("creation", 8);
	ge1258ov2483 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_class */
T0* T75f17(T0* C)
{
	T0* R = 0;
	if (ge1258os2482) {
		return ge1258ov2482;
	} else {
		ge1258os2482 = '\1';
		ge1258ov2482 = R;
	}
	R = GE_ms8("class", 5);
	ge1258ov2482 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_root */
T0* T75f16(T0* C)
{
	T0* R = 0;
	if (ge1258os2481) {
		return ge1258ov2481;
	} else {
		ge1258os2481 = '\1';
		ge1258ov2481 = R;
	}
	R = GE_ms8("root", 4);
	ge1258ov2481 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.uc_name */
T0* T75f15(T0* C)
{
	T0* R = 0;
	if (ge1258os2486) {
		return ge1258ov2486;
	} else {
		ge1258os2486 = '\1';
		ge1258ov2486 = R;
	}
	R = GE_ms8("name", 4);
	ge1258ov2486 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.tokens */
T0* T75f14(T0* C)
{
	T0* R = 0;
	if (ge916os4794) {
		return ge916ov4794;
	} else {
		ge916os4794 = '\1';
		ge916ov4794 = R;
	}
	R = T141c129();
	ge916ov4794 = R;
	return R;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.set_ve */
void T75f252(T0* C, T1 a1)
{
	T1 t1;
	((T75*)(C))->a5 = a1;
	t1 = (((T80*)(GE_void(((T75*)(C))->a4)))->a3);
	t1 = (((((t1) != (a1)))));
	if (t1) {
		T80f250(GE_void(((T75*)(C))->a4), a1);
	}
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.set_shallow */
void T75f251(T0* C, T1 a1)
{
	T1 t1;
	((T75*)(C))->a3 = a1;
	t1 = (((T80*)(GE_void(((T75*)(C))->a4)))->a2);
	t1 = (((((t1) != (a1)))));
	if (t1) {
		T80f249(GE_void(((T75*)(C))->a4), a1);
	}
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.make_with_variables */
T0* T75c250(T0* a1, T0* a2)
{
	T0* C;
	C = GE_new75(EIF_TRUE);
	((T75*)(C))->a2 = T87c10();
	T75f254(C, a1, ((T75*)(C))->a2, a2);
	return C;
}

/* ET_XACE_SYSTEM_CONFIG_PARSER.make_with_variables_and_factory */
void T75f254(T0* C, T0* a1, T0* a2, T0* a3)
{
	T0* t1;
	T1 t2;
	T0* l1 = 0;
	((T75*)(C))->a11 = a3;
	((T75*)(C))->a2 = a2;
	((T75*)(C))->a10 = T97c37((T6)(GE_int32(10)));
	t1 = (T75f13(C));
	T97f39(GE_void(((T75*)(C))->a10), t1);
	((T75*)(C))->a4 = EIF_VOID;
	t2 = ((((T75*)(C))->a4)==(EIF_VOID));
	if (t2) {
		((T75*)(C))->a4 = T80c252(a1, a2, a3);
		T80f253(GE_void(((T75*)(C))->a4), ((T75*)(C))->a10);
	}
	((T75*)(C))->a9 = T96c10(a1, ((T75*)(C))->a11);
	((T75*)(C))->a8 = T95c30(a3);
	l1 = T98c3();
	t2 = (T98f1(GE_void(l1)));
	if (t2) {
		((T75*)(C))->a6 = (T98f2(GE_void(l1)));
	} else {
		((T75*)(C))->a6 = T99c202();
	}
	T99f204(GE_void(((T75*)(C))->a6));
	((T75*)(C))->a7 = T92c10();
	t1 = (((T92*)(GE_void(((T75*)(C))->a7)))->a3);
	T99f205(GE_void(((T75*)(C))->a6), t1);
	t1 = (((T92*)(GE_void(((T75*)(C))->a7)))->a2);
	T94f10(GE_void(t1), ((T75*)(C))->a6);
}

/* GEXACE_VALIDATE_COMMAND.set_xace_filename */
void T41f8(T0* C, T0* a1)
{
	((T41*)(C))->a3 = a1;
}

/* GEXACE_LIBRARY_COMMAND.set_xace_filename */
void T40f14(T0* C, T0* a1)
{
	((T40*)(C))->a5 = a1;
}

/* GEXACE_SYSTEM_COMMAND.set_xace_filename */
void T36f14(T0* C, T0* a1)
{
	((T36*)(C))->a5 = a1;
}

/* XM_EIFFEL_PE_ENTITY_DEF.error_position */
T0* T209f57(T0* C)
{
	T0* R = 0;
	R = T167c7(((T209*)(C))->a8, ((T209*)(C))->a17, ((T209*)(C))->a16, ((T209*)(C))->a15);
	return R;
}

/* XM_DEFAULT_POSITION.make */
T0* T167c7(T0* a1, T6 a2, T6 a3, T6 a4)
{
	T0* C;
	C = GE_new167(EIF_TRUE);
	((T167*)(C))->a1 = a1;
	((T167*)(C))->a4 = a2;
	((T167*)(C))->a3 = a3;
	((T167*)(C))->a2 = a4;
	return C;
}

/* XM_EIFFEL_SCANNER_DTD.error_position */
T0* T207f55(T0* C)
{
	T0* R = 0;
	R = T167c7(((T207*)(C))->a3, ((T207*)(C))->a4, ((T207*)(C))->a5, ((T207*)(C))->a6);
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.error_position */
T0* T203f56(T0* C)
{
	T0* R = 0;
	R = T167c7(((T203*)(C))->a8, ((T203*)(C))->a17, ((T203*)(C))->a16, ((T203*)(C))->a15);
	return R;
}

/* XM_EIFFEL_SCANNER.error_position */
T0* T166f63(T0* C)
{
	T0* R = 0;
	R = T167c7(((T166*)(C))->a3, ((T166*)(C))->a4, ((T166*)(C))->a5, ((T166*)(C))->a6);
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.end_of_file */
T1 T209f60(T0* C)
{
	T1 R = 0;
	R = (((((((T209*)(C))->a43) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.end_of_file */
T1 T207f61(T0* C)
{
	T1 R = 0;
	R = (((((((T207*)(C))->a1) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.end_of_file */
T1 T203f59(T0* C)
{
	T1 R = 0;
	R = (((((((T203*)(C))->a41) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_EIFFEL_SCANNER.end_of_file */
T1 T166f65(T0* C)
{
	T1 R = 0;
	R = (((((((T166*)(C))->a1) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.is_applicable_encoding */
T1 T209f61(T0* C, T0* a1)
{
	T1 t1;
	T1 R = 0;
	t1 = (T233f9(GE_void(((T209*)(C))->a45), a1));
	if (t1) {
		R = (T233f16(GE_void(((T209*)(C))->a45), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.is_applicable_encoding */
T1 T233f16(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	t1 = (((((((T233*)(C))->a2) == ((T6)(GE_int32(6)))))));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T233f17(C));
		t1 = (T47f11(GE_void(t2), a1, ge1425ov10799));
		if (!(t1)) {
			t2 = (T233f17(C));
			t1 = (T47f11(GE_void(t2), a1, ge1425ov10798));
		}
		if (t1) {
			t1 = (((((((T233*)(C))->a2) == ((T6)(GE_int32(2)))))));
			if (!(t1)) {
				t1 = (((((((T233*)(C))->a2) == ((T6)(GE_int32(1)))))));
			}
			if (!(t1)) {
				R = (((((((T233*)(C))->a2) == ((T6)(GE_int32(3)))))));
			} else {
				R = EIF_TRUE;
			}
		} else {
			t2 = (T233f17(C));
			t1 = (T47f11(GE_void(t2), a1, ge1425ov10800));
			if (t1) {
				t1 = (((((((T233*)(C))->a2) == ((T6)(GE_int32(2)))))));
				if (!(t1)) {
					R = (((((((T233*)(C))->a2) == ((T6)(GE_int32(1)))))));
				} else {
					R = EIF_TRUE;
				}
			} else {
				t2 = (T233f17(C));
				t1 = (T47f11(GE_void(t2), a1, ge1425ov10801));
				if (t1) {
					t1 = (((((((T233*)(C))->a2) == ((T6)(GE_int32(4)))))));
					if (!(t1)) {
						R = (((((((T233*)(C))->a2) == ((T6)(GE_int32(5)))))));
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
T1 T233f9(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T233f17(C));
		t1 = (T47f11(GE_void(t2), a1, ge1425ov10799));
		if (!(t1)) {
			t2 = (T233f17(C));
			t1 = (T47f11(GE_void(t2), a1, ge1425ov10798));
		}
		if (!(t1)) {
			t2 = (T233f17(C));
			t1 = (T47f11(GE_void(t2), a1, ge1425ov10800));
		}
		if (!(t1)) {
			t2 = (T233f17(C));
			R = (T47f11(GE_void(t2), a1, ge1425ov10801));
		} else {
			R = EIF_TRUE;
		}
	}
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.is_applicable_encoding */
T1 T207f48(T0* C, T0* a1)
{
	T1 t1;
	T1 R = 0;
	t1 = (T233f9(GE_void(((T207*)(C))->a7), a1));
	if (t1) {
		R = (T233f16(GE_void(((T207*)(C))->a7), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.is_applicable_encoding */
T1 T203f60(T0* C, T0* a1)
{
	T1 t1;
	T1 R = 0;
	t1 = (T233f9(GE_void(((T203*)(C))->a43), a1));
	if (t1) {
		R = (T233f16(GE_void(((T203*)(C))->a43), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_EIFFEL_SCANNER.is_applicable_encoding */
T1 T166f66(T0* C, T0* a1)
{
	T1 t1;
	T1 R = 0;
	t1 = (T233f9(GE_void(((T166*)(C))->a7), a1));
	if (t1) {
		R = (T233f16(GE_void(((T166*)(C))->a7), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.start_condition */
T6 T209f62(T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((((T209*)(C))->a11)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.start_condition */
T6 T207f50(T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((((T207*)(C))->a8)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.start_condition */
T6 T203f61(T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((((T203*)(C))->a11)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* XM_EIFFEL_SCANNER.start_condition */
T6 T166f43(T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((((T166*)(C))->a8)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* ET_XACE_ECF_GENERATOR.default_system_output_filename */
unsigned char ge1254os2676 = '\0';
T0* ge1254ov2676;
T0* T45f5(T0* C)
{
	T0* R = 0;
	if (ge1254os2676) {
		return ge1254ov2676;
	} else {
		ge1254os2676 = '\1';
		ge1254ov2676 = R;
	}
	R = (T17f19(GE_void(((T45*)(C))->a1), GE_ms8(".ecf", 4)));
	ge1254ov2676 = R;
	return R;
}

/* ET_XACE_ACE_GENERATOR.default_system_output_filename */
unsigned char ge1253os2676 = '\0';
T0* ge1253ov2676;
T0* T44f5(T0* C)
{
	T0* R = 0;
	if (ge1253os2676) {
		return ge1253ov2676;
	} else {
		ge1253os2676 = '\1';
		ge1253ov2676 = R;
	}
	R = (T17f19(GE_void(((T44*)(C))->a1), GE_ms8(".ace", 4)));
	ge1253ov2676 = R;
	return R;
}

/* ET_XACE_XACE_GENERATOR.default_system_output_filename */
unsigned char ge1256os2676 = '\0';
T0* ge1256ov2676;
T0* T43f5(T0* C)
{
	T0* R = 0;
	if (ge1256os2676) {
		return ge1256ov2676;
	} else {
		ge1256os2676 = '\1';
		ge1256ov2676 = R;
	}
	R = (T17f19(GE_void(((T43*)(C))->a1), GE_ms8(".xace", 5)));
	ge1256ov2676 = R;
	return R;
}

/* ET_XACE_ECF_GENERATOR.default_library_output_filename */
unsigned char ge1254os2677 = '\0';
T0* ge1254ov2677;
T0* T45f6(T0* C)
{
	T0* R = 0;
	if (ge1254os2677) {
		return ge1254ov2677;
	} else {
		ge1254os2677 = '\1';
		ge1254ov2677 = R;
	}
	R = (T17f19(GE_void(((T45*)(C))->a1), GE_ms8(".ecf", 4)));
	ge1254ov2677 = R;
	return R;
}

/* ET_XACE_ACE_GENERATOR.default_library_output_filename */
unsigned char ge1253os2677 = '\0';
T0* ge1253ov2677;
T0* T44f6(T0* C)
{
	T0* R = 0;
	if (ge1253os2677) {
		return ge1253ov2677;
	} else {
		ge1253os2677 = '\1';
		ge1253ov2677 = R;
	}
	R = (T17f19(GE_void(((T44*)(C))->a1), GE_ms8(".ace", 4)));
	ge1253ov2677 = R;
	return R;
}

/* ET_XACE_XACE_GENERATOR.default_library_output_filename */
unsigned char ge1256os2677 = '\0';
T0* ge1256ov2677;
T0* T43f6(T0* C)
{
	T0* R = 0;
	if (ge1256os2677) {
		return ge1256ov2677;
	} else {
		ge1256os2677 = '\1';
		ge1256ov2677 = R;
	}
	R = (T17f19(GE_void(((T43*)(C))->a1), GE_ms8(".xace", 5)));
	ge1256ov2677 = R;
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.default_message */
T0* T313f5(T0* C)
{
	T0* R = 0;
	R = (T313f3(C, ge1239ov2654));
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.message */
T0* T313f3(T0* C, T0* a1)
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
	t1 = (T313f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, l5);
				} else {
					T232f58(R, l5);
				}
			} else {
				t1 = (T313f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T232f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T232f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T313f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f38(l1, l5);
									} else {
										T232f58(l1, l5);
									}
								} else {
									t1 = (T313f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
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
									T17f38(l1, l5);
								} else {
									T232f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T232f33(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T232f34(l1)));
						t2 = (T63f4(GE_void(((T313*)(C))->a1), l3));
						if (t2) {
							t1 = (T313f4(C));
							t5 = (T63f5(GE_void(((T313*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T313f4(C));
								t5 = (T313f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T232f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T232f58(R, (T2)('{'));
									}
								}
								t1 = (T313f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T232f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T232f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T232f58(R, (T2)('{'));
							}
						}
						t1 = (T313f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T232f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.arguments */
T0* T313f6(T0* C)
{
	T0* R = 0;
	if (ge110os1762) {
		return ge110ov1762;
	} else {
		ge110os1762 = '\1';
		ge110ov1762 = R;
	}
	R = T23c4();
	ge110ov1762 = R;
	return R;
}

/* ARRAY [STRING_8].valid_index */
T1 T63f4(T0* C, T6 a1)
{
	T1 t1;
	T1 R = 0;
	t1 = (T6f6(&(((T63*)(C))->a2), a1));
	if (t1) {
		R = (T6f6(&a1, ((T63*)(C))->a3));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.string_ */
T0* T313f4(T0* C)
{
	T0* R = 0;
	if (ge37os1763) {
		return ge37ov1763;
	} else {
		ge37os1763 = '\1';
		ge37ov1763 = R;
	}
	R = T47c14();
	ge37ov1763 = R;
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.default_message */
T0* T312f5(T0* C)
{
	T0* R = 0;
	R = (T312f3(C, ge1233ov2654));
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.message */
T0* T312f3(T0* C, T0* a1)
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
	t1 = (T312f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, l5);
				} else {
					T232f58(R, l5);
				}
			} else {
				t1 = (T312f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T232f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T232f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T312f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f38(l1, l5);
									} else {
										T232f58(l1, l5);
									}
								} else {
									t1 = (T312f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
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
									T17f38(l1, l5);
								} else {
									T232f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T232f33(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T232f34(l1)));
						t2 = (T63f4(GE_void(((T312*)(C))->a1), l3));
						if (t2) {
							t1 = (T312f4(C));
							t5 = (T63f5(GE_void(((T312*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T312f4(C));
								t5 = (T312f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T232f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T232f58(R, (T2)('{'));
									}
								}
								t1 = (T312f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T232f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T232f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T232f58(R, (T2)('{'));
							}
						}
						t1 = (T312f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T232f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.arguments */
T0* T312f6(T0* C)
{
	T0* R = 0;
	if (ge110os1762) {
		return ge110ov1762;
	} else {
		ge110os1762 = '\1';
		ge110ov1762 = R;
	}
	R = T23c4();
	ge110ov1762 = R;
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.string_ */
T0* T312f4(T0* C)
{
	T0* R = 0;
	if (ge37os1763) {
		return ge37ov1763;
	} else {
		ge37os1763 = '\1';
		ge37ov1763 = R;
	}
	R = T47c14();
	ge37ov1763 = R;
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.default_message */
T0* T222f5(T0* C)
{
	T0* R = 0;
	R = (T222f3(C, ge1249ov2654));
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.message */
T0* T222f3(T0* C, T0* a1)
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
	t1 = (T222f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, l5);
				} else {
					T232f58(R, l5);
				}
			} else {
				t1 = (T222f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T232f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T232f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T222f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f38(l1, l5);
									} else {
										T232f58(l1, l5);
									}
								} else {
									t1 = (T222f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
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
									T17f38(l1, l5);
								} else {
									T232f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T232f33(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T232f34(l1)));
						t2 = (T63f4(GE_void(((T222*)(C))->a1), l3));
						if (t2) {
							t1 = (T222f4(C));
							t5 = (T63f5(GE_void(((T222*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T222f4(C));
								t5 = (T222f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T232f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T232f58(R, (T2)('{'));
									}
								}
								t1 = (T222f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T232f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T232f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T232f58(R, (T2)('{'));
							}
						}
						t1 = (T222f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T232f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.arguments */
T0* T222f6(T0* C)
{
	T0* R = 0;
	if (ge110os1762) {
		return ge110ov1762;
	} else {
		ge110os1762 = '\1';
		ge110ov1762 = R;
	}
	R = T23c4();
	ge110ov1762 = R;
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.string_ */
T0* T222f4(T0* C)
{
	T0* R = 0;
	if (ge37os1763) {
		return ge37ov1763;
	} else {
		ge37os1763 = '\1';
		ge37ov1763 = R;
	}
	R = T47c14();
	ge37ov1763 = R;
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.default_message */
T0* T221f5(T0* C)
{
	T0* R = 0;
	R = (T221f3(C, ge1246ov2654));
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.message */
T0* T221f3(T0* C, T0* a1)
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
	t1 = (T221f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, l5);
				} else {
					T232f58(R, l5);
				}
			} else {
				t1 = (T221f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T232f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T232f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T221f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f38(l1, l5);
									} else {
										T232f58(l1, l5);
									}
								} else {
									t1 = (T221f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
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
									T17f38(l1, l5);
								} else {
									T232f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T232f33(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T232f34(l1)));
						t2 = (T63f4(GE_void(((T221*)(C))->a1), l3));
						if (t2) {
							t1 = (T221f4(C));
							t5 = (T63f5(GE_void(((T221*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T221f4(C));
								t5 = (T221f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T232f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T232f58(R, (T2)('{'));
									}
								}
								t1 = (T221f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T232f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T232f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T232f58(R, (T2)('{'));
							}
						}
						t1 = (T221f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T232f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.arguments */
T0* T221f6(T0* C)
{
	T0* R = 0;
	if (ge110os1762) {
		return ge110ov1762;
	} else {
		ge110os1762 = '\1';
		ge110ov1762 = R;
	}
	R = T23c4();
	ge110ov1762 = R;
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.string_ */
T0* T221f4(T0* C)
{
	T0* R = 0;
	if (ge37os1763) {
		return ge37ov1763;
	} else {
		ge37os1763 = '\1';
		ge37ov1763 = R;
	}
	R = T47c14();
	ge37ov1763 = R;
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.default_message */
T0* T220f5(T0* C)
{
	T0* R = 0;
	R = (T220f3(C, ge1248ov2654));
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.message */
T0* T220f3(T0* C, T0* a1)
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
	t1 = (T220f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, l5);
				} else {
					T232f58(R, l5);
				}
			} else {
				t1 = (T220f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T232f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T232f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T220f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f38(l1, l5);
									} else {
										T232f58(l1, l5);
									}
								} else {
									t1 = (T220f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
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
									T17f38(l1, l5);
								} else {
									T232f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T232f33(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T232f34(l1)));
						t2 = (T63f4(GE_void(((T220*)(C))->a1), l3));
						if (t2) {
							t1 = (T220f4(C));
							t5 = (T63f5(GE_void(((T220*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T220f4(C));
								t5 = (T220f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T232f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T232f58(R, (T2)('{'));
									}
								}
								t1 = (T220f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T232f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T232f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T232f58(R, (T2)('{'));
							}
						}
						t1 = (T220f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T232f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.arguments */
T0* T220f6(T0* C)
{
	T0* R = 0;
	if (ge110os1762) {
		return ge110ov1762;
	} else {
		ge110os1762 = '\1';
		ge110ov1762 = R;
	}
	R = T23c4();
	ge110ov1762 = R;
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.string_ */
T0* T220f4(T0* C)
{
	T0* R = 0;
	if (ge37os1763) {
		return ge37ov1763;
	} else {
		ge37os1763 = '\1';
		ge37ov1763 = R;
	}
	R = T47c14();
	ge37ov1763 = R;
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.default_message */
T0* T219f5(T0* C)
{
	T0* R = 0;
	R = (T219f3(C, ge1245ov2654));
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.message */
T0* T219f3(T0* C, T0* a1)
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
	t1 = (T219f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, l5);
				} else {
					T232f58(R, l5);
				}
			} else {
				t1 = (T219f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T232f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T232f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T219f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f38(l1, l5);
									} else {
										T232f58(l1, l5);
									}
								} else {
									t1 = (T219f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
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
									T17f38(l1, l5);
								} else {
									T232f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T232f33(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T232f34(l1)));
						t2 = (T63f4(GE_void(((T219*)(C))->a1), l3));
						if (t2) {
							t1 = (T219f4(C));
							t5 = (T63f5(GE_void(((T219*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T219f4(C));
								t5 = (T219f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T232f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T232f58(R, (T2)('{'));
									}
								}
								t1 = (T219f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T232f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T232f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T232f58(R, (T2)('{'));
							}
						}
						t1 = (T219f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T232f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.arguments */
T0* T219f6(T0* C)
{
	T0* R = 0;
	if (ge110os1762) {
		return ge110ov1762;
	} else {
		ge110os1762 = '\1';
		ge110ov1762 = R;
	}
	R = T23c4();
	ge110ov1762 = R;
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.string_ */
T0* T219f4(T0* C)
{
	T0* R = 0;
	if (ge37os1763) {
		return ge37ov1763;
	} else {
		ge37os1763 = '\1';
		ge37ov1763 = R;
	}
	R = T47c14();
	ge37ov1763 = R;
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.default_message */
T0* T218f5(T0* C)
{
	T0* R = 0;
	R = (T218f3(C, ge1241ov2654));
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.message */
T0* T218f3(T0* C, T0* a1)
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
	t1 = (T218f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, l5);
				} else {
					T232f58(R, l5);
				}
			} else {
				t1 = (T218f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T232f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T232f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T218f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f38(l1, l5);
									} else {
										T232f58(l1, l5);
									}
								} else {
									t1 = (T218f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
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
									T17f38(l1, l5);
								} else {
									T232f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T232f33(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T232f34(l1)));
						t2 = (T63f4(GE_void(((T218*)(C))->a1), l3));
						if (t2) {
							t1 = (T218f4(C));
							t5 = (T63f5(GE_void(((T218*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T218f4(C));
								t5 = (T218f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T232f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T232f58(R, (T2)('{'));
									}
								}
								t1 = (T218f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T232f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T232f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T232f58(R, (T2)('{'));
							}
						}
						t1 = (T218f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T232f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.arguments */
T0* T218f6(T0* C)
{
	T0* R = 0;
	if (ge110os1762) {
		return ge110ov1762;
	} else {
		ge110os1762 = '\1';
		ge110ov1762 = R;
	}
	R = T23c4();
	ge110ov1762 = R;
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.string_ */
T0* T218f4(T0* C)
{
	T0* R = 0;
	if (ge37os1763) {
		return ge37ov1763;
	} else {
		ge37os1763 = '\1';
		ge37ov1763 = R;
	}
	R = T47c14();
	ge37ov1763 = R;
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.default_message */
T0* T217f5(T0* C)
{
	T0* R = 0;
	R = (T217f3(C, ge1240ov2654));
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.message */
T0* T217f3(T0* C, T0* a1)
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
	t1 = (T217f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, l5);
				} else {
					T232f58(R, l5);
				}
			} else {
				t1 = (T217f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T232f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T232f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T217f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f38(l1, l5);
									} else {
										T232f58(l1, l5);
									}
								} else {
									t1 = (T217f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
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
									T17f38(l1, l5);
								} else {
									T232f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T232f33(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T232f34(l1)));
						t2 = (T63f4(GE_void(((T217*)(C))->a1), l3));
						if (t2) {
							t1 = (T217f4(C));
							t5 = (T63f5(GE_void(((T217*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T217f4(C));
								t5 = (T217f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T232f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T232f58(R, (T2)('{'));
									}
								}
								t1 = (T217f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T232f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T232f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T232f58(R, (T2)('{'));
							}
						}
						t1 = (T217f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T232f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.arguments */
T0* T217f6(T0* C)
{
	T0* R = 0;
	if (ge110os1762) {
		return ge110ov1762;
	} else {
		ge110os1762 = '\1';
		ge110ov1762 = R;
	}
	R = T23c4();
	ge110ov1762 = R;
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.string_ */
T0* T217f4(T0* C)
{
	T0* R = 0;
	if (ge37os1763) {
		return ge37ov1763;
	} else {
		ge37os1763 = '\1';
		ge37ov1763 = R;
	}
	R = T47c14();
	ge37ov1763 = R;
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.default_message */
T0* T216f5(T0* C)
{
	T0* R = 0;
	R = (T216f3(C, ge1252ov2654));
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.message */
T0* T216f3(T0* C, T0* a1)
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
	t1 = (T216f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, l5);
				} else {
					T232f58(R, l5);
				}
			} else {
				t1 = (T216f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T232f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T232f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T216f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f38(l1, l5);
									} else {
										T232f58(l1, l5);
									}
								} else {
									t1 = (T216f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
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
									T17f38(l1, l5);
								} else {
									T232f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T232f33(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T232f34(l1)));
						t2 = (T63f4(GE_void(((T216*)(C))->a1), l3));
						if (t2) {
							t1 = (T216f4(C));
							t5 = (T63f5(GE_void(((T216*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T216f4(C));
								t5 = (T216f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T232f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T232f58(R, (T2)('{'));
									}
								}
								t1 = (T216f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T232f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T232f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T232f58(R, (T2)('{'));
							}
						}
						t1 = (T216f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T232f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.arguments */
T0* T216f6(T0* C)
{
	T0* R = 0;
	if (ge110os1762) {
		return ge110ov1762;
	} else {
		ge110os1762 = '\1';
		ge110ov1762 = R;
	}
	R = T23c4();
	ge110ov1762 = R;
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.string_ */
T0* T216f4(T0* C)
{
	T0* R = 0;
	if (ge37os1763) {
		return ge37ov1763;
	} else {
		ge37os1763 = '\1';
		ge37ov1763 = R;
	}
	R = T47c14();
	ge37ov1763 = R;
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.default_message */
T0* T215f5(T0* C)
{
	T0* R = 0;
	R = (T215f3(C, ge1236ov2654));
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.message */
T0* T215f3(T0* C, T0* a1)
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
	t1 = (T215f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, l5);
				} else {
					T232f58(R, l5);
				}
			} else {
				t1 = (T215f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T232f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T232f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T215f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f38(l1, l5);
									} else {
										T232f58(l1, l5);
									}
								} else {
									t1 = (T215f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
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
									T17f38(l1, l5);
								} else {
									T232f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T232f33(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T232f34(l1)));
						t2 = (T63f4(GE_void(((T215*)(C))->a1), l3));
						if (t2) {
							t1 = (T215f4(C));
							t5 = (T63f5(GE_void(((T215*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T215f4(C));
								t5 = (T215f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T232f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T232f58(R, (T2)('{'));
									}
								}
								t1 = (T215f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T232f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T232f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T232f58(R, (T2)('{'));
							}
						}
						t1 = (T215f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T232f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.arguments */
T0* T215f6(T0* C)
{
	T0* R = 0;
	if (ge110os1762) {
		return ge110ov1762;
	} else {
		ge110os1762 = '\1';
		ge110ov1762 = R;
	}
	R = T23c4();
	ge110ov1762 = R;
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.string_ */
T0* T215f4(T0* C)
{
	T0* R = 0;
	if (ge37os1763) {
		return ge37ov1763;
	} else {
		ge37os1763 = '\1';
		ge37ov1763 = R;
	}
	R = T47c14();
	ge37ov1763 = R;
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.default_message */
T0* T214f5(T0* C)
{
	T0* R = 0;
	R = (T214f3(C, ge1247ov2654));
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.message */
T0* T214f3(T0* C, T0* a1)
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
	t1 = (T214f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, l5);
				} else {
					T232f58(R, l5);
				}
			} else {
				t1 = (T214f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T232f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T232f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T214f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f38(l1, l5);
									} else {
										T232f58(l1, l5);
									}
								} else {
									t1 = (T214f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
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
									T17f38(l1, l5);
								} else {
									T232f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T232f33(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T232f34(l1)));
						t2 = (T63f4(GE_void(((T214*)(C))->a1), l3));
						if (t2) {
							t1 = (T214f4(C));
							t5 = (T63f5(GE_void(((T214*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T214f4(C));
								t5 = (T214f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T232f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T232f58(R, (T2)('{'));
									}
								}
								t1 = (T214f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T232f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T232f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T232f58(R, (T2)('{'));
							}
						}
						t1 = (T214f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T232f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.arguments */
T0* T214f6(T0* C)
{
	T0* R = 0;
	if (ge110os1762) {
		return ge110ov1762;
	} else {
		ge110os1762 = '\1';
		ge110ov1762 = R;
	}
	R = T23c4();
	ge110ov1762 = R;
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.string_ */
T0* T214f4(T0* C)
{
	T0* R = 0;
	if (ge37os1763) {
		return ge37ov1763;
	} else {
		ge37os1763 = '\1';
		ge37ov1763 = R;
	}
	R = T47c14();
	ge37ov1763 = R;
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.default_message */
T0* T213f5(T0* C)
{
	T0* R = 0;
	R = (T213f3(C, ge1251ov2654));
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.message */
T0* T213f3(T0* C, T0* a1)
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
	t1 = (T213f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, l5);
				} else {
					T232f58(R, l5);
				}
			} else {
				t1 = (T213f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T232f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T232f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T213f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f38(l1, l5);
									} else {
										T232f58(l1, l5);
									}
								} else {
									t1 = (T213f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
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
									T17f38(l1, l5);
								} else {
									T232f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T232f33(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T232f34(l1)));
						t2 = (T63f4(GE_void(((T213*)(C))->a1), l3));
						if (t2) {
							t1 = (T213f4(C));
							t5 = (T63f5(GE_void(((T213*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T213f4(C));
								t5 = (T213f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T232f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T232f58(R, (T2)('{'));
									}
								}
								t1 = (T213f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T232f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T232f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T232f58(R, (T2)('{'));
							}
						}
						t1 = (T213f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T232f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.arguments */
T0* T213f6(T0* C)
{
	T0* R = 0;
	if (ge110os1762) {
		return ge110ov1762;
	} else {
		ge110os1762 = '\1';
		ge110ov1762 = R;
	}
	R = T23c4();
	ge110ov1762 = R;
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.default_message */
T0* T212f5(T0* C)
{
	T0* R = 0;
	R = (T212f3(C, ge1243ov2654));
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.message */
T0* T212f3(T0* C, T0* a1)
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
	t1 = (T212f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, l5);
				} else {
					T232f58(R, l5);
				}
			} else {
				t1 = (T212f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T232f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T232f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T212f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f38(l1, l5);
									} else {
										T232f58(l1, l5);
									}
								} else {
									t1 = (T212f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
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
									T17f38(l1, l5);
								} else {
									T232f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T232f33(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T232f34(l1)));
						t2 = (T63f4(GE_void(((T212*)(C))->a1), l3));
						if (t2) {
							t1 = (T212f4(C));
							t5 = (T63f5(GE_void(((T212*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T212f4(C));
								t5 = (T212f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T232f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T232f58(R, (T2)('{'));
									}
								}
								t1 = (T212f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T232f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T232f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T232f58(R, (T2)('{'));
							}
						}
						t1 = (T212f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T232f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.arguments */
T0* T212f6(T0* C)
{
	T0* R = 0;
	if (ge110os1762) {
		return ge110ov1762;
	} else {
		ge110os1762 = '\1';
		ge110ov1762 = R;
	}
	R = T23c4();
	ge110ov1762 = R;
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.string_ */
T0* T212f4(T0* C)
{
	T0* R = 0;
	if (ge37os1763) {
		return ge37ov1763;
	} else {
		ge37os1763 = '\1';
		ge37ov1763 = R;
	}
	R = T47c14();
	ge37ov1763 = R;
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.default_message */
T0* T211f5(T0* C)
{
	T0* R = 0;
	R = (T211f3(C, ge1234ov2654));
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.message */
T0* T211f3(T0* C, T0* a1)
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
	t1 = (T211f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, l5);
				} else {
					T232f58(R, l5);
				}
			} else {
				t1 = (T211f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T232f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T232f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T211f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f38(l1, l5);
									} else {
										T232f58(l1, l5);
									}
								} else {
									t1 = (T211f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
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
									T17f38(l1, l5);
								} else {
									T232f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T232f33(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T232f34(l1)));
						t2 = (T63f4(GE_void(((T211*)(C))->a1), l3));
						if (t2) {
							t1 = (T211f4(C));
							t5 = (T63f5(GE_void(((T211*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T211f4(C));
								t5 = (T211f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T232f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T232f58(R, (T2)('{'));
									}
								}
								t1 = (T211f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T232f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T232f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T232f58(R, (T2)('{'));
							}
						}
						t1 = (T211f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T232f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.arguments */
T0* T211f6(T0* C)
{
	T0* R = 0;
	if (ge110os1762) {
		return ge110ov1762;
	} else {
		ge110os1762 = '\1';
		ge110ov1762 = R;
	}
	R = T23c4();
	ge110ov1762 = R;
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.string_ */
T0* T211f4(T0* C)
{
	T0* R = 0;
	if (ge37os1763) {
		return ge37ov1763;
	} else {
		ge37os1763 = '\1';
		ge37ov1763 = R;
	}
	R = T47c14();
	ge37ov1763 = R;
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.default_message */
T0* T210f5(T0* C)
{
	T0* R = 0;
	R = (T210f3(C, ge1242ov2654));
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.message */
T0* T210f3(T0* C, T0* a1)
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
	t1 = (T210f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, l5);
				} else {
					T232f58(R, l5);
				}
			} else {
				t1 = (T210f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T232f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T232f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T210f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f38(l1, l5);
									} else {
										T232f58(l1, l5);
									}
								} else {
									t1 = (T210f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
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
									T17f38(l1, l5);
								} else {
									T232f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T232f33(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T232f34(l1)));
						t2 = (T63f4(GE_void(((T210*)(C))->a1), l3));
						if (t2) {
							t1 = (T210f4(C));
							t5 = (T63f5(GE_void(((T210*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T210f4(C));
								t5 = (T210f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T232f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T232f58(R, (T2)('{'));
									}
								}
								t1 = (T210f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T232f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T232f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T232f58(R, (T2)('{'));
							}
						}
						t1 = (T210f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T232f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.arguments */
T0* T210f6(T0* C)
{
	T0* R = 0;
	if (ge110os1762) {
		return ge110ov1762;
	} else {
		ge110os1762 = '\1';
		ge110ov1762 = R;
	}
	R = T23c4();
	ge110ov1762 = R;
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.string_ */
T0* T210f4(T0* C)
{
	T0* R = 0;
	if (ge37os1763) {
		return ge37ov1763;
	} else {
		ge37os1763 = '\1';
		ge37ov1763 = R;
	}
	R = T47c14();
	ge37ov1763 = R;
	return R;
}

/* ET_XACE_NOT_XACE_FILE_ERROR.default_message */
T0* T107f5(T0* C)
{
	T0* R = 0;
	R = (T107f3(C, ge1244ov2654));
	return R;
}

/* ET_XACE_NOT_XACE_FILE_ERROR.message */
T0* T107f3(T0* C, T0* a1)
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
	t1 = (T107f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, l5);
				} else {
					T232f58(R, l5);
				}
			} else {
				t1 = (T107f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T232f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T232f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T107f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f38(l1, l5);
									} else {
										T232f58(l1, l5);
									}
								} else {
									t1 = (T107f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
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
									T17f38(l1, l5);
								} else {
									T232f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T232f33(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T232f34(l1)));
						t2 = (T63f4(GE_void(((T107*)(C))->a1), l3));
						if (t2) {
							t1 = (T107f4(C));
							t5 = (T63f5(GE_void(((T107*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T107f4(C));
								t5 = (T107f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T232f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T232f58(R, (T2)('{'));
									}
								}
								t1 = (T107f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T232f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T232f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T232f58(R, (T2)('{'));
							}
						}
						t1 = (T107f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T232f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_XACE_NOT_XACE_FILE_ERROR.arguments */
T0* T107f6(T0* C)
{
	T0* R = 0;
	if (ge110os1762) {
		return ge110ov1762;
	} else {
		ge110os1762 = '\1';
		ge110ov1762 = R;
	}
	R = T23c4();
	ge110ov1762 = R;
	return R;
}

/* ET_XACE_NOT_XACE_FILE_ERROR.string_ */
T0* T107f4(T0* C)
{
	T0* R = 0;
	if (ge37os1763) {
		return ge37ov1763;
	} else {
		ge37os1763 = '\1';
		ge37ov1763 = R;
	}
	R = T47c14();
	ge37ov1763 = R;
	return R;
}

/* UT_MESSAGE.default_message */
T0* T106f5(T0* C)
{
	T0* R = 0;
	R = (T106f3(C, ge1275ov2654));
	return R;
}

/* UT_MESSAGE.message */
T0* T106f3(T0* C, T0* a1)
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
	t1 = (T106f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, l5);
				} else {
					T232f58(R, l5);
				}
			} else {
				t1 = (T106f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T232f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T232f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T106f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f38(l1, l5);
									} else {
										T232f58(l1, l5);
									}
								} else {
									t1 = (T106f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
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
									T17f38(l1, l5);
								} else {
									T232f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T232f33(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T232f34(l1)));
						t2 = (T63f4(GE_void(((T106*)(C))->a1), l3));
						if (t2) {
							t1 = (T106f4(C));
							t5 = (T63f5(GE_void(((T106*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T106f4(C));
								t5 = (T106f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T232f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T232f58(R, (T2)('{'));
									}
								}
								t1 = (T106f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T232f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T232f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T232f58(R, (T2)('{'));
							}
						}
						t1 = (T106f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T232f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_MESSAGE.arguments */
T0* T106f6(T0* C)
{
	T0* R = 0;
	if (ge110os1762) {
		return ge110ov1762;
	} else {
		ge110os1762 = '\1';
		ge110ov1762 = R;
	}
	R = T23c4();
	ge110ov1762 = R;
	return R;
}

/* UT_MESSAGE.string_ */
T0* T106f4(T0* C)
{
	T0* R = 0;
	if (ge37os1763) {
		return ge37ov1763;
	} else {
		ge37os1763 = '\1';
		ge37ov1763 = R;
	}
	R = T47c14();
	ge37ov1763 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
T0* T85f5(T0* C)
{
	T0* R = 0;
	R = (T85f3(C, ge1272ov2654));
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
T0* T85f3(T0* C, T0* a1)
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
	t1 = (T85f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, l5);
				} else {
					T232f58(R, l5);
				}
			} else {
				t1 = (T85f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T232f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T232f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T85f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f38(l1, l5);
									} else {
										T232f58(l1, l5);
									}
								} else {
									t1 = (T85f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
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
									T17f38(l1, l5);
								} else {
									T232f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T232f33(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T232f34(l1)));
						t2 = (T63f4(GE_void(((T85*)(C))->a1), l3));
						if (t2) {
							t1 = (T85f4(C));
							t5 = (T63f5(GE_void(((T85*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T85f4(C));
								t5 = (T85f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T232f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T232f58(R, (T2)('{'));
									}
								}
								t1 = (T85f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T232f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T232f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T232f58(R, (T2)('{'));
							}
						}
						t1 = (T85f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T232f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.arguments */
T0* T85f6(T0* C)
{
	T0* R = 0;
	if (ge110os1762) {
		return ge110ov1762;
	} else {
		ge110os1762 = '\1';
		ge110ov1762 = R;
	}
	R = T23c4();
	ge110ov1762 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
T0* T85f4(T0* C)
{
	T0* R = 0;
	if (ge37os1763) {
		return ge37ov1763;
	} else {
		ge37os1763 = '\1';
		ge37ov1763 = R;
	}
	R = T47c14();
	ge37ov1763 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.default_message */
T0* T84f5(T0* C)
{
	T0* R = 0;
	R = (T84f3(C, ge1271ov2654));
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.message */
T0* T84f3(T0* C, T0* a1)
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
	t1 = (T84f4(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, l5);
				} else {
					T232f58(R, l5);
				}
			} else {
				t1 = (T84f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T232f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T232f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T84f4(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f38(l1, l5);
									} else {
										T232f58(l1, l5);
									}
								} else {
									t1 = (T84f4(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
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
									T17f38(l1, l5);
								} else {
									T232f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T232f33(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T232f34(l1)));
						t2 = (T63f4(GE_void(((T84*)(C))->a1), l3));
						if (t2) {
							t1 = (T84f4(C));
							t5 = (T63f5(GE_void(((T84*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T84f4(C));
								t5 = (T84f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T232f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T232f58(R, (T2)('{'));
									}
								}
								t1 = (T84f4(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T232f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T232f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T232f58(R, (T2)('{'));
							}
						}
						t1 = (T84f4(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T232f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.arguments */
T0* T84f6(T0* C)
{
	T0* R = 0;
	if (ge110os1762) {
		return ge110ov1762;
	} else {
		ge110os1762 = '\1';
		ge110ov1762 = R;
	}
	R = T23c4();
	ge110ov1762 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.string_ */
T0* T84f4(T0* C)
{
	T0* R = 0;
	if (ge37os1763) {
		return ge37ov1763;
	} else {
		ge37os1763 = '\1';
		ge37ov1763 = R;
	}
	R = T47c14();
	ge37ov1763 = R;
	return R;
}

/* UT_USAGE_MESSAGE.default_message */
T0* T34f2(T0* C)
{
	T0* R = 0;
	R = (T34f4(C, ge1281ov2654));
	return R;
}

/* UT_USAGE_MESSAGE.message */
T0* T34f4(T0* C, T0* a1)
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
	t1 = (T34f5(C));
	R = (T47f2(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f4((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f13(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, l5);
				} else {
					T232f58(R, l5);
				}
			} else {
				t1 = (T34f5(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T47f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T232f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f13(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T232f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T34f5(C));
					l1 = (T47f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f38(l1, l5);
									} else {
										T232f58(l1, l5);
									}
								} else {
									t1 = (T34f5(C));
									T47f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f4((&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f13(a1, l2));
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
									T17f38(l1, l5);
								} else {
									T232f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T232f33(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T232f34(l1)));
						t2 = (T63f4(GE_void(((T34*)(C))->a1), l3));
						if (t2) {
							t1 = (T34f5(C));
							t5 = (T63f5(GE_void(((T34*)(C))->a1), l3));
							R = (T47f4(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T34f5(C));
								t5 = (T34f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T47f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T232f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T232f58(R, (T2)('{'));
									}
								}
								t1 = (T34f5(C));
								R = (T47f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T232f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T232f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T232f58(R, (T2)('{'));
							}
						}
						t1 = (T34f5(C));
						R = (T47f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T232f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_USAGE_MESSAGE.arguments */
T0* T34f6(T0* C)
{
	T0* R = 0;
	if (ge110os1762) {
		return ge110ov1762;
	} else {
		ge110os1762 = '\1';
		ge110ov1762 = R;
	}
	R = T23c4();
	ge110ov1762 = R;
	return R;
}

/* UT_USAGE_MESSAGE.string_ */
T0* T34f5(T0* C)
{
	T0* R = 0;
	if (ge37os1763) {
		return ge37ov1763;
	} else {
		ge37os1763 = '\1';
		ge37ov1763 = R;
	}
	R = T47c14();
	ge37ov1763 = R;
	return R;
}

T0* GE_ma229(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new51(c, EIF_FALSE);
	*(T51*)t1 = GE_default51;
	((T51*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T6 *i = ((T51*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T6);
		}
		va_end(v);
	}
	R = GE_new229(EIF_TRUE);
	((T229*)(R))->a1 = t1;
	((T229*)(R))->a2 = 1;
	((T229*)(R))->a3 = c;
	return R;
}

T0* GE_ma63(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new50(c, EIF_FALSE);
	*(T50*)t1 = GE_default50;
	((T50*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T50*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new63(EIF_TRUE);
	((T63*)(R))->a1 = t1;
	((T63*)(R))->a2 = 1;
	((T63*)(R))->a3 = c;
	return R;
}

T0* GE_ma156(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new155(c, EIF_FALSE);
	*(T155*)t1 = GE_default155;
	((T155*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T155*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new156(EIF_TRUE);
	((T156*)(R))->a1 = t1;
	((T156*)(R))->a2 = 1;
	((T156*)(R))->a3 = c;
	return R;
}

T0* ge78ov2991;
T0* ge42ov2930;
T0* ge4ov2106;
T0* ge4ov2107;
T0* ge131ov4430;
T0* ge141ov10791;
T0* ge1434ov10054;
T0* ge1434ov10055;
T0* ge66ov5133;
T0* ge1425ov10799;
T0* ge1425ov10801;
T0* ge1377ov5958;
T0* ge1358ov9899;
T0* ge1358ov9898;
T0* ge1230ov4770;
T0* ge1230ov4783;
T0* ge1230ov4786;
T0* ge1230ov4762;
T0* ge1230ov4790;
T0* ge1230ov4772;
T0* ge1230ov4766;
T0* ge1230ov4777;
T0* ge1230ov4779;
T0* ge1230ov4778;
T0* ge1230ov4791;
T0* ge83ov8084;
T0* ge1230ov4774;
T0* ge1230ov4763;
T0* ge1230ov4769;
T0* ge1230ov4785;
T0* ge1230ov4771;
T0* ge1230ov4773;
T0* ge176ov2991;
T0* ge1230ov4775;
T0* ge1230ov4764;
T0* ge1230ov4776;
T0* ge1420ov6118;
T0* ge1420ov6117;
T0* ge1261ov4572;
T0* ge1230ov4789;
T0* ge1230ov4768;
T0* ge1230ov4782;
T0* ge1230ov4784;
T0* ge1230ov4788;
T0* ge1230ov4781;
T0* ge1230ov4787;
T0* ge1230ov4765;
T0* ge1230ov4780;
T0* ge1230ov4767;
T0* ge1230ov4793;
T0* ge1261ov4571;
T0* ge1261ov4570;
T0* ge1230ov4573;
T0* ge1230ov4574;
T0* ge1230ov4575;
T0* ge1230ov4576;
T0* ge1230ov4577;
T0* ge1230ov4578;
T0* ge1230ov4579;
T0* ge1230ov4580;
T0* ge1230ov4581;
T0* ge1230ov4582;
T0* ge1230ov4583;
T0* ge1230ov4584;
T0* ge1230ov4585;
T0* ge1230ov4586;
T0* ge1230ov4587;
T0* ge1230ov4588;
T0* ge1230ov4589;
T0* ge1230ov4590;
T0* ge1230ov4591;
T0* ge1230ov4592;
T0* ge1230ov4593;
T0* ge1230ov4594;
T0* ge1230ov4595;
T0* ge1230ov4596;
T0* ge1230ov4597;
T0* ge1230ov4598;
T0* ge1230ov4599;
T0* ge1230ov4600;
T0* ge1230ov4601;
T0* ge1230ov4602;
T0* ge1230ov4603;
T0* ge1230ov4604;
T0* ge1230ov4605;
T0* ge1230ov4606;
T0* ge1230ov4607;
T0* ge1230ov4608;
T0* ge1230ov4609;
T0* ge1230ov4610;
T0* ge1230ov4611;
T0* ge1230ov4612;
T0* ge1230ov4613;
T0* ge1230ov4614;
T0* ge1230ov4615;
T0* ge1230ov4616;
T0* ge1230ov4617;
T0* ge1230ov4618;
T0* ge1230ov4619;
T0* ge1230ov4620;
T0* ge1230ov4621;
T0* ge1230ov4622;
T0* ge1230ov4623;
T0* ge1230ov4624;
T0* ge1230ov4625;
T0* ge1230ov4626;
T0* ge1230ov4627;
T0* ge1230ov4628;
T0* ge1230ov4629;
T0* ge1230ov4630;
T0* ge1230ov4631;
T0* ge1230ov4632;
T0* ge1230ov4633;
T0* ge1230ov4634;
T0* ge1230ov4635;
T0* ge1230ov4636;
T0* ge1230ov4637;
T0* ge1230ov4638;
T0* ge1230ov4639;
T0* ge1230ov4640;
T0* ge1230ov4641;
T0* ge1230ov4642;
T0* ge1230ov4643;
T0* ge1230ov4644;
T0* ge1230ov4645;
T0* ge1230ov4646;
T0* ge1230ov4647;
T0* ge1230ov4648;
T0* ge1230ov4649;
T0* ge1230ov4650;
T0* ge1230ov4651;
T0* ge1230ov4652;
T0* ge1230ov4653;
T0* ge1230ov4654;
T0* ge1230ov4655;
T0* ge1230ov4656;
T0* ge1230ov4657;
T0* ge1230ov4658;
T0* ge1230ov4659;
T0* ge1230ov4660;
T0* ge1230ov4661;
T0* ge1230ov4662;
T0* ge1230ov4663;
T0* ge1230ov4664;
T0* ge1230ov4665;
T0* ge1230ov4666;
T0* ge69ov2991;
T0* ge1220ov7036;
T0* ge922ov8575;
T0* ge922ov8604;
T0* ge922ov8566;
T0* ge922ov8568;
T0* ge922ov8608;
T0* ge922ov8607;
T0* ge922ov8600;
T0* ge922ov8599;
T0* ge922ov8595;
T0* ge922ov8594;
T0* ge922ov8576;
T0* ge922ov8606;
T0* ge922ov8593;
T0* ge922ov8598;
T0* ge922ov8597;
T0* ge922ov8590;
T0* ge922ov8589;
T0* ge922ov8588;
T0* ge922ov8587;
T0* ge922ov8582;
T0* ge922ov8581;
T0* ge922ov8580;
T0* ge922ov8579;
T0* ge922ov8573;
T0* ge922ov8572;
T0* ge922ov8570;
T0* ge922ov8820;
T0* ge922ov8809;
T0* ge922ov8610;
T0* ge922ov8609;
T0* ge922ov8605;
T0* ge922ov8833;
T0* ge922ov8601;
T0* ge922ov8603;
T0* ge922ov8602;
T0* ge922ov8596;
T0* ge922ov8591;
T0* ge922ov8586;
T0* ge922ov8578;
T0* ge922ov8574;
T0* ge922ov8571;
T0* ge922ov8923;
T0* ge922ov8907;
T0* ge922ov8920;
T0* ge922ov8921;
T0* ge922ov8914;
T0* ge922ov8917;
T0* ge922ov8909;
T0* ge922ov8912;
T0* ge922ov8908;
T0* ge922ov8922;
T0* ge922ov8905;
T0* ge922ov8906;
T0* ge1226ov5933;
T0* ge1427ov6742;
T0* ge1427ov6704;
T0* ge1427ov6702;
T0* ge1427ov6743;
T0* ge1427ov6715;
T0* ge1427ov6714;
T0* ge1427ov6725;
T0* ge1427ov6719;
T0* ge1427ov6718;
T0* ge1427ov6717;
T0* ge1427ov6723;
T0* ge1427ov6722;
T0* ge1427ov6724;
T0* ge1427ov6701;
T0* ge1427ov6727;
T0* ge1427ov6736;
T0* ge1430ov6465;
T0* ge1430ov6463;
T0* ge1430ov6464;
T0* ge1427ov6737;
T0* ge1427ov6738;
T0* ge1427ov6741;
T0* ge1427ov6739;
T0* ge1427ov6740;
T0* ge1427ov6734;
T0* ge1423ov10507;
T0* ge1423ov10508;
T0* ge1427ov6707;
T0* ge1427ov6730;
T0* ge1427ov6750;
T0* ge1427ov6751;
T0* ge1427ov6752;
T0* ge1427ov6745;
T0* ge1427ov6728;
T0* ge1427ov6729;
T0* ge1427ov6731;
T0* ge1427ov6735;
T0* ge64ov5153;
T0* ge1425ov10798;
T0* ge1425ov10800;
T0* ge1239ov2654;
T0* ge1233ov2654;
T0* ge1249ov2654;
T0* ge1246ov2654;
T0* ge1248ov2654;
T0* ge1245ov2654;
T0* ge1241ov2654;
T0* ge1240ov2654;
T0* ge1252ov2654;
T0* ge1236ov2654;
T0* ge1247ov2654;
T0* ge1251ov2654;
T0* ge1243ov2654;
T0* ge1234ov2654;
T0* ge1242ov2654;
T0* ge1244ov2654;
T0* ge1275ov2654;
T0* ge1272ov2654;
T0* ge1271ov2654;
T0* ge1281ov2654;

void GE_const_init()
{
	ge78ov2991 = (GE_ms8("\n", 1));
	ge42ov2930 = (GE_ms8("", 0));
	ge4ov2106 = (GE_ms8("system.xace", 11));
	ge4ov2107 = (GE_ms8("library.xace", 12));
	ge131ov4430 = (GE_ms8("", 0));
	ge141ov10791 = (GE_ms8("", 0));
	ge1434ov10054 = (GE_ms8(" ", 1));
	ge1434ov10055 = (GE_ms8("  ", 2));
	ge66ov5133 = (GE_ms8("", 0));
	ge1425ov10799 = (GE_ms8("iso-8859-1", 10));
	ge1425ov10801 = (GE_ms8("utf-16", 6));
	ge1377ov5958 = (GE_ms8("root", 4));
	ge1358ov9899 = (GE_ms8("Namespace declared twice", 24));
	ge1358ov9898 = (GE_ms8("Undeclared namespace error", 26));
	ge1230ov4770 = (GE_ms8("default", 7));
	ge1230ov4783 = (GE_ms8("none", 4));
	ge1230ov4786 = (GE_ms8("require", 7));
	ge1230ov4762 = (GE_ms8("all", 3));
	ge1230ov4790 = (GE_ms8("supplier_precondition", 21));
	ge1230ov4772 = (GE_ms8("ensure", 6));
	ge1230ov4766 = (GE_ms8("check", 5));
	ge1230ov4777 = (GE_ms8("invariant", 9));
	ge1230ov4779 = (GE_ms8("loop_variant", 12));
	ge1230ov4778 = (GE_ms8("loop_invariant", 14));
	ge1230ov4791 = (GE_ms8("transitional", 12));
	ge83ov8084 = (GE_ms8(".", 1));
	ge1230ov4774 = (GE_ms8("feature", 7));
	ge1230ov4763 = (GE_ms8("array", 5));
	ge1230ov4769 = (GE_ms8("constant", 8));
	ge1230ov4785 = (GE_ms8("once", 4));
	ge1230ov4771 = (GE_ms8("dll", 3));
	ge1230ov4773 = (GE_ms8("exe", 3));
	ge176ov2991 = (GE_ms8("\n", 1));
	ge1230ov4775 = (GE_ms8("generate", 8));
	ge1230ov4764 = (GE_ms8("auto", 4));
	ge1230ov4776 = (GE_ms8("internal", 8));
	ge1420ov6118 = (GE_ms8("undefined", 9));
	ge1420ov6117 = (GE_ms8("(TRUNCATED)", 11));
	ge1261ov4572 = (GE_ms8("", 0));
	ge1230ov4789 = (GE_ms8("style", 5));
	ge1230ov4768 = (GE_ms8("com", 3));
	ge1230ov4782 = (GE_ms8("no_main", 7));
	ge1230ov4784 = (GE_ms8("obsolete", 8));
	ge1230ov4788 = (GE_ms8("standard", 8));
	ge1230ov4781 = (GE_ms8("microsoft", 9));
	ge1230ov4787 = (GE_ms8("sequential", 10));
	ge1230ov4765 = (GE_ms8("boehm", 5));
	ge1230ov4780 = (GE_ms8("low_level", 9));
	ge1230ov4767 = (GE_ms8("class", 5));
	ge1230ov4793 = (GE_ms8("winapi", 6));
	ge1261ov4571 = (GE_ms8("false", 5));
	ge1261ov4570 = (GE_ms8("true", 4));
	ge1230ov4573 = (GE_ms8("abstract", 8));
	ge1230ov4574 = (GE_ms8("address_expression", 18));
	ge1230ov4575 = (GE_ms8("arguments", 9));
	ge1230ov4576 = (GE_ms8("array_optimization", 18));
	ge1230ov4577 = (GE_ms8("assembly", 8));
	ge1230ov4578 = (GE_ms8("assertion", 9));
	ge1230ov4579 = (GE_ms8("automatic_backup", 16));
	ge1230ov4580 = (GE_ms8("callback", 8));
	ge1230ov4581 = (GE_ms8("case_insensitive", 16));
	ge1230ov4582 = (GE_ms8("check_generic_creation_constraint", 33));
	ge1230ov4583 = (GE_ms8("check_vape", 10));
	ge1230ov4584 = (GE_ms8("clean", 5));
	ge1230ov4585 = (GE_ms8("cls_compliant", 13));
	ge1230ov4586 = (GE_ms8("component", 9));
	ge1230ov4587 = (GE_ms8("console_application", 19));
	ge1230ov4588 = (GE_ms8("create_keyword_extension", 24));
	ge1230ov4589 = (GE_ms8("culture", 7));
	ge1230ov4590 = (GE_ms8("c_compiler_options", 18));
	ge1230ov4591 = (GE_ms8("dead_code_removal", 17));
	ge1230ov4592 = (GE_ms8("debug", 5));
	ge1230ov4593 = (GE_ms8("debug_tag", 9));
	ge1230ov4594 = (GE_ms8("debugger", 8));
	ge1230ov4595 = (GE_ms8("document", 8));
	ge1230ov4596 = (GE_ms8("dotnet_naming_convention", 24));
	ge1230ov4597 = (GE_ms8("dynamic_runtime", 15));
	ge1230ov4598 = (GE_ms8("ecf_library", 11));
	ge1230ov4599 = (GE_ms8("enforce_unique_class_names", 26));
	ge1230ov4600 = (GE_ms8("exception_trace", 15));
	ge1230ov4601 = (GE_ms8("exclude", 7));
	ge1230ov4602 = (GE_ms8("export", 6));
	ge1230ov4603 = (GE_ms8("external_runtime", 16));
	ge1230ov4604 = (GE_ms8("finalize", 8));
	ge1230ov4605 = (GE_ms8("flat_fst_optimization", 21));
	ge1230ov4606 = (GE_ms8("force_32bits", 12));
	ge1230ov4607 = (GE_ms8("fst_expansion_factor", 20));
	ge1230ov4608 = (GE_ms8("fst_optimization", 16));
	ge1230ov4609 = (GE_ms8("full_class_checking", 19));
	ge1230ov4610 = (GE_ms8("garbage_collector", 17));
	ge1230ov4611 = (GE_ms8("gc_info", 7));
	ge1230ov4612 = (GE_ms8("heap_size", 9));
	ge1230ov4613 = (GE_ms8("header", 6));
	ge1230ov4614 = (GE_ms8("high_memory_compiler", 20));
	ge1230ov4615 = (GE_ms8("il_verifiable", 13));
	ge1230ov4616 = (GE_ms8("include", 7));
	ge1230ov4617 = (GE_ms8("inlining", 8));
	ge1230ov4618 = (GE_ms8("inlining_size", 13));
	ge1230ov4619 = (GE_ms8("jumps_optimization", 18));
	ge1230ov4620 = (GE_ms8("layout", 6));
	ge1230ov4621 = (GE_ms8("layout_optimization", 19));
	ge1230ov4622 = (GE_ms8("leaves_optimization", 19));
	ge1230ov4623 = (GE_ms8("line_generation", 15));
	ge1230ov4624 = (GE_ms8("link", 4));
	ge1230ov4625 = (GE_ms8("linker", 6));
	ge1230ov4626 = (GE_ms8("linux_fpu_double_precision", 26));
	ge1230ov4627 = (GE_ms8("manifest_string_trace", 21));
	ge1230ov4628 = (GE_ms8("map", 3));
	ge1230ov4629 = (GE_ms8("metadata_cache_path", 19));
	ge1230ov4630 = (GE_ms8("msil_assembly_compatibility", 27));
	ge1230ov4631 = (GE_ms8("msil_classes_per_module", 23));
	ge1230ov4632 = (GE_ms8("msil_clr_version", 16));
	ge1230ov4633 = (GE_ms8("msil_culture", 12));
	ge1230ov4634 = (GE_ms8("msil_generation", 15));
	ge1230ov4635 = (GE_ms8("msil_generation_version", 23));
	ge1230ov4636 = (GE_ms8("msil_key_file_name", 18));
	ge1230ov4637 = (GE_ms8("msil_use_optimized_precompile", 29));
	ge1230ov4638 = (GE_ms8("multithreaded", 13));
	ge1230ov4639 = (GE_ms8("namespace", 9));
	ge1230ov4640 = (GE_ms8("no_default_lib", 14));
	ge1230ov4641 = (GE_ms8("old_verbatim_strings", 20));
	ge1230ov4642 = (GE_ms8("override_cluster", 16));
	ge1230ov4643 = (GE_ms8("portable_code_generation", 24));
	ge1230ov4644 = (GE_ms8("precompiled", 11));
	ge1230ov4645 = (GE_ms8("prefix", 6));
	ge1230ov4646 = (GE_ms8("profile", 7));
	ge1230ov4647 = (GE_ms8("public_key_token", 16));
	ge1230ov4648 = (GE_ms8("read_only", 9));
	ge1230ov4649 = (GE_ms8("recursive", 9));
	ge1230ov4650 = (GE_ms8("reloads_optimization", 20));
	ge1230ov4651 = (GE_ms8("shared_library_definition", 25));
	ge1230ov4652 = (GE_ms8("split", 5));
	ge1230ov4653 = (GE_ms8("stack_size", 10));
	ge1230ov4654 = (GE_ms8("storable", 8));
	ge1230ov4655 = (GE_ms8("storable_filename", 17));
	ge1230ov4656 = (GE_ms8("strip", 5));
	ge1230ov4657 = (GE_ms8("syntax", 6));
	ge1230ov4658 = (GE_ms8("target", 6));
	ge1230ov4659 = (GE_ms8("trace", 5));
	ge1230ov4660 = (GE_ms8("use_cluster_name_as_namespace", 29));
	ge1230ov4661 = (GE_ms8("use_full_cluster_name_as_namespace", 34));
	ge1230ov4662 = (GE_ms8("verbose", 7));
	ge1230ov4663 = (GE_ms8("version", 7));
	ge1230ov4664 = (GE_ms8("visible_filename", 16));
	ge1230ov4665 = (GE_ms8("warning", 7));
	ge1230ov4666 = (GE_ms8("wedit", 5));
	ge69ov2991 = (GE_ms8("\n", 1));
	ge1220ov7036 = (GE_ms8("", 0));
	ge922ov8575 = (GE_ms8("DISPOSABLE", 10));
	ge922ov8604 = (GE_ms8("SYSTEM_OBJECT", 13));
	ge922ov8566 = (GE_ms8("ANY", 3));
	ge922ov8568 = (GE_ms8("ARRAY", 5));
	ge922ov8608 = (GE_ms8("TYPED_POINTER", 13));
	ge922ov8607 = (GE_ms8("TYPE", 4));
	ge922ov8600 = (GE_ms8("SPECIAL", 7));
	ge922ov8599 = (GE_ms8("ROUTINE", 7));
	ge922ov8595 = (GE_ms8("PROCEDURE", 9));
	ge922ov8594 = (GE_ms8("PREDICATE", 9));
	ge922ov8576 = (GE_ms8("FUNCTION", 8));
	ge922ov8606 = (GE_ms8("TUPLE", 5));
	ge922ov8593 = (GE_ms8("POINTER", 7));
	ge922ov8598 = (GE_ms8("REAL_64", 7));
	ge922ov8597 = (GE_ms8("REAL_32", 7));
	ge922ov8590 = (GE_ms8("NATURAL_64", 10));
	ge922ov8589 = (GE_ms8("NATURAL_32", 10));
	ge922ov8588 = (GE_ms8("NATURAL_16", 10));
	ge922ov8587 = (GE_ms8("NATURAL_8", 9));
	ge922ov8582 = (GE_ms8("INTEGER_64", 10));
	ge922ov8581 = (GE_ms8("INTEGER_32", 10));
	ge922ov8580 = (GE_ms8("INTEGER_16", 10));
	ge922ov8579 = (GE_ms8("INTEGER_8", 9));
	ge922ov8573 = (GE_ms8("CHARACTER_32", 12));
	ge922ov8572 = (GE_ms8("CHARACTER_8", 11));
	ge922ov8570 = (GE_ms8("BOOLEAN", 7));
	ge922ov8820 = (GE_ms8("end", 3));
	ge922ov8809 = (GE_ms8("class", 5));
	ge922ov8610 = (GE_ms8("*UNKNOWN*", 9));
	ge922ov8609 = (GE_ms8("WIDE_CHARACTER", 14));
	ge922ov8605 = (GE_ms8("SYSTEM_STRING", 13));
	ge922ov8833 = (GE_ms8("inherit", 7));
	ge922ov8601 = (GE_ms8("STRING", 6));
	ge922ov8603 = (GE_ms8("STRING_32", 9));
	ge922ov8602 = (GE_ms8("STRING_8", 8));
	ge922ov8596 = (GE_ms8("REAL", 4));
	ge922ov8591 = (GE_ms8("NONE", 4));
	ge922ov8586 = (GE_ms8("NATURAL", 7));
	ge922ov8578 = (GE_ms8("INTEGER", 7));
	ge922ov8574 = (GE_ms8("DOUBLE", 6));
	ge922ov8571 = (GE_ms8("CHARACTER", 9));
	ge922ov8923 = (GE_ms8("WIDE_CHARACTER_REF", 18));
	ge922ov8907 = (GE_ms8("CHARACTER_32_REF", 16));
	ge922ov8920 = (GE_ms8("REAL_REF", 8));
	ge922ov8921 = (GE_ms8("REAL_32_REF", 11));
	ge922ov8914 = (GE_ms8("NATURAL_REF", 11));
	ge922ov8917 = (GE_ms8("NATURAL_32_REF", 14));
	ge922ov8909 = (GE_ms8("INTEGER_REF", 11));
	ge922ov8912 = (GE_ms8("INTEGER_32_REF", 14));
	ge922ov8908 = (GE_ms8("DOUBLE_REF", 10));
	ge922ov8922 = (GE_ms8("REAL_64_REF", 11));
	ge922ov8905 = (GE_ms8("CHARACTER_REF", 13));
	ge922ov8906 = (GE_ms8("CHARACTER_8_REF", 15));
	ge1226ov5933 = (GE_ms8("", 0));
	ge1427ov6742 = (GE_ms8("PE reference only allowed in DTD", 32));
	ge1427ov6704 = (GE_ms8("< not allowed in attribute value", 32));
	ge1427ov6702 = (GE_ms8("-- not allowed in comment", 25));
	ge1427ov6743 = (GE_ms8("xml prefix reserved in processing instruction", 45));
	ge1427ov6715 = (GE_ms8("Misformed XML Declaration", 25));
	ge1427ov6714 = (GE_ms8("Misplaced markup declaration", 28));
	ge1427ov6725 = (GE_ms8("End tag does not match start tag", 32));
	ge1427ov6719 = (GE_ms8("Missing element end tag", 23));
	ge1427ov6718 = (GE_ms8("Error in element content", 24));
	ge1427ov6717 = (GE_ms8("Misformed start tag", 19));
	ge1427ov6723 = (GE_ms8("Attribute declared twice", 24));
	ge1427ov6722 = (GE_ms8("Misformed attribute in tag", 26));
	ge1427ov6724 = (GE_ms8("Error in end tag", 16));
	ge1427ov6701 = (GE_ms8("]]> not allowed in content", 26));
	ge1427ov6727 = (GE_ms8("Error in XML declaration", 24));
	ge1427ov6736 = (GE_ms8("Misformed element type declaration", 34));
	ge1430ov6465 = (GE_ms8("*", 1));
	ge1430ov6463 = (GE_ms8("+", 1));
	ge1430ov6464 = (GE_ms8("\?", 1));
	ge1427ov6737 = (GE_ms8("Misformed attribute list declaration", 36));
	ge1427ov6738 = (GE_ms8("Misformed attribute definition declaration", 42));
	ge1427ov6741 = (GE_ms8("Misformed conditional section", 29));
	ge1427ov6739 = (GE_ms8("Misformed entity declaration", 28));
	ge1427ov6740 = (GE_ms8("Misformed entity notation", 25));
	ge1427ov6734 = (GE_ms8("Parser is not configured to support external DTDs", 49));
	ge1423ov10507 = (GE_ms8("1.0", 3));
	ge1423ov10508 = (GE_ms8("utf-8", 5));
	ge1427ov6707 = (GE_ms8("unsupported character encoding", 30));
	ge1427ov6730 = (GE_ms8("External reference in quoted value", 34));
	ge1427ov6750 = (GE_ms8("Unexpected non-ASCII character in ASCII-only mode", 49));
	ge1427ov6751 = (GE_ms8("Unexpected non-latin1 character in latin1-only mode", 51));
	ge1427ov6752 = (GE_ms8("Invalid UTF8 character sequence", 31));
	ge1427ov6745 = (GE_ms8("Name misformed", 14));
	ge1427ov6728 = (GE_ms8("Literal entity expected in attribute", 36));
	ge1427ov6729 = (GE_ms8("Entity is not defined", 21));
	ge1427ov6731 = (GE_ms8("Entity cannot be recursively included", 37));
	ge1427ov6735 = (GE_ms8("Undefined PE entity", 19));
	ge64ov5153 = (GE_ms8("empty_name", 10));
	ge1425ov10798 = (GE_ms8("us-ascii", 8));
	ge1425ov10800 = (GE_ms8("utf-8", 5));
	ge1239ov2654 = (GE_ms8("found invalid expression \'$1\' at $2", 35));
	ge1233ov2654 = (GE_ms8("attribute \'$2\' of element <$1> at $4 is obsolete, use element $3 instead", 72));
	ge1249ov2654 = (GE_ms8("option name \'$1\' in option-element is unknown $2", 48));
	ge1246ov2654 = (GE_ms8("<exclude> at $1 is obsolete, use \'if\'/\'unless\' attributes instead", 65));
	ge1248ov2654 = (GE_ms8("found unknown element \'$2\' in element \'$1\' $3", 45));
	ge1245ov2654 = (GE_ms8("<cluster> at $1 is obsolete. Specify options, clusters and mounts directly under <system> instead", 97));
	ge1241ov2654 = (GE_ms8("element \'$1\' must have child-element \'$2\' $3", 44));
	ge1240ov2654 = (GE_ms8("element \'$1\' must have attribute \'$2\' $3", 40));
	ge1252ov2654 = (GE_ms8("Xace document must have a \'$1\' root-element $2", 46));
	ge1236ov2654 = (GE_ms8("element <$1> at $3 is obsolete, use element $2 instead", 54));
	ge1247ov2654 = (GE_ms8("attribute \'$2\' in element \'$1\' should have a positive integer value $4", 70));
	ge1251ov2654 = (GE_ms8("attribute \'$2\' in element \'$1\' should have one of the following values: $4 $5", 77));
	ge1243ov2654 = (GE_ms8("attribute \'$2\' in element \'$1\' should have a non-empty value $3", 63));
	ge1234ov2654 = (GE_ms8("attribute \'$2\' in element \'$1\' should have a boolean value $4", 61));
	ge1242ov2654 = (GE_ms8("Library \'$1\' mounted with incompatible prefixes \'$2\' and \'$3\' in $4 and $5", 74));
	ge1244ov2654 = (GE_ms8("\'$1\' is not an Xace file", 24));
	ge1275ov2654 = (GE_ms8("$1", 2));
	ge1272ov2654 = (GE_ms8("$0: cannot write to \'$1\'", 24));
	ge1271ov2654 = (GE_ms8("$0: cannot read \'$1\'", 20));
	ge1281ov2654 = (GE_ms8("usage: $0 $1", 12));
}

EIF_TYPE GE_types[441] = {
{0, 0, EIF_FALSE, 0},
{0, 1, EIF_FALSE, 0, 0},
{0, 2, EIF_FALSE, 0, 0},
{0, 3, EIF_FALSE, 0, 0},
{0, 4, EIF_FALSE, 0, 0},
{0, 5, EIF_FALSE, 0, 0},
{0, 6, EIF_FALSE, 0, 0},
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
{0, 17, EIF_FALSE, 0, 0},
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
{0, 28, EIF_FALSE, 0, 0},
{0, 29, EIF_FALSE, 0, 0},
{0, 30, EIF_FALSE, 0, 0},
{0, 31, EIF_FALSE, 0, 0},
{0, 32, EIF_FALSE, 0, 0},
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
{0, 50, EIF_TRUE, 0, 0},
{0, 51, EIF_TRUE, 0, 0},
{0, 52, EIF_FALSE, 0, 0},
{0, 53, EIF_FALSE, 0, 0},
{0, 54, EIF_FALSE, 0, 0},
{0, 55, EIF_FALSE, 0, 0},
{0, 56, EIF_FALSE, 0, 0},
{0, 57, EIF_FALSE, 0, 0},
{0, 58, EIF_FALSE, 0, 0},
{0, 59, EIF_FALSE, 0, 0},
{0, 60, EIF_FALSE, 0, 0},
{0, 61, EIF_FALSE, 0, 0},
{0, 62, EIF_FALSE, 0, 0},
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
{0, 77, EIF_FALSE, &T77f38, 0},
{0, 78, EIF_FALSE, 0, 0},
{0, 79, EIF_FALSE, &T79f22, 0},
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
{0, 105, EIF_TRUE, 0, 0},
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
{0, 128, EIF_FALSE, 0, 0},
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
{0, 153, EIF_TRUE, 0, 0},
{0, 154, EIF_FALSE, 0, 0},
{0, 155, EIF_TRUE, 0, 0},
{0, 156, EIF_FALSE, 0, 0},
{0, 157, EIF_FALSE, 0, 0},
{0, 158, EIF_FALSE, 0, 0},
{0, 159, EIF_FALSE, 0, 0},
{0, 160, EIF_FALSE, 0, 0},
{0, 161, EIF_FALSE, 0, 0},
{0, 162, EIF_FALSE, 0, 0},
{0, 163, EIF_FALSE, 0, 0},
{0, 164, EIF_TRUE, 0, 0},
{0, 165, EIF_FALSE, 0, 0},
{0, 166, EIF_FALSE, 0, 0},
{0, 167, EIF_FALSE, 0, 0},
{0, 168, EIF_FALSE, 0, 0},
{0, 169, EIF_FALSE, 0, 0},
{0, 170, EIF_FALSE, 0, 0},
{0, 171, EIF_FALSE, 0, 0},
{0, 172, EIF_FALSE, 0, 0},
{0, 173, EIF_FALSE, 0, 0},
{0, 174, EIF_TRUE, 0, 0},
{0, 175, EIF_FALSE, 0, 0},
{0, 176, EIF_FALSE, 0, 0},
{0, 177, EIF_FALSE, 0, 0},
{0, 178, EIF_FALSE, 0, 0},
{0, 179, EIF_FALSE, 0, 0},
{0, 180, EIF_FALSE, 0, 0},
{0, 181, EIF_FALSE, 0, 0},
{0, 182, EIF_FALSE, 0, 0},
{0, 183, EIF_FALSE, 0, 0},
{0, 184, EIF_TRUE, 0, 0},
{0, 185, EIF_FALSE, 0, 0},
{0, 186, EIF_TRUE, 0, 0},
{0, 187, EIF_FALSE, 0, 0},
{0, 188, EIF_TRUE, 0, 0},
{0, 189, EIF_TRUE, 0, 0},
{0, 190, EIF_FALSE, 0, 0},
{0, 191, EIF_TRUE, 0, 0},
{0, 192, EIF_FALSE, 0, 0},
{0, 193, EIF_TRUE, 0, 0},
{0, 194, EIF_FALSE, 0, 0},
{0, 195, EIF_FALSE, 0, 0},
{0, 196, EIF_TRUE, 0, 0},
{0, 197, EIF_FALSE, 0, 0},
{0, 198, EIF_TRUE, 0, 0},
{0, 199, EIF_FALSE, 0, 0},
{0, 200, EIF_FALSE, 0, 0},
{0, 201, EIF_TRUE, 0, 0},
{0, 202, EIF_FALSE, 0, 0},
{0, 203, EIF_FALSE, 0, 0},
{0, 204, EIF_FALSE, 0, 0},
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
{0, 237, EIF_TRUE, 0, 0},
{0, 238, EIF_FALSE, 0, 0},
{0, 239, EIF_FALSE, 0, 0},
{0, 240, EIF_TRUE, 0, 0},
{0, 241, EIF_FALSE, 0, 0},
{0, 242, EIF_FALSE, 0, 0},
{0, 243, EIF_FALSE, 0, 0},
{0, 244, EIF_FALSE, 0, 0},
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
{0, 299, EIF_TRUE, 0, 0},
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
{0, 328, EIF_TRUE, 0, 0},
{0, 329, EIF_FALSE, 0, 0},
{0, 330, EIF_FALSE, 0, 0},
{0, 331, EIF_FALSE, 0, 0},
{0, 332, EIF_TRUE, 0, 0},
{0, 333, EIF_FALSE, 0, 0},
{0, 334, EIF_FALSE, 0, 0},
{0, 335, EIF_FALSE, 0, 0},
{0, 336, EIF_FALSE, 0, 0},
{0, 337, EIF_FALSE, 0, 0},
{0, 338, EIF_FALSE, 0, 0},
{0, 339, EIF_FALSE, 0, 0},
{0, 340, EIF_FALSE, 0, 0},
{0, 341, EIF_FALSE, 0, 0},
{0, 342, EIF_TRUE, 0, 0},
{0, 343, EIF_FALSE, 0, 0},
{0, 344, EIF_TRUE, 0, 0},
{0, 345, EIF_FALSE, 0, 0},
{0, 346, EIF_FALSE, 0, 0},
{0, 347, EIF_FALSE, 0, 0},
{0, 348, EIF_FALSE, 0, 0},
{0, 349, EIF_FALSE, 0, 0},
{0, 350, EIF_TRUE, 0, 0},
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
{0, 384, EIF_TRUE, 0, 0},
{0, 385, EIF_TRUE, 0, 0},
{0, 386, EIF_FALSE, 0, 0},
{0, 387, EIF_FALSE, 0, 0},
{0, 388, EIF_FALSE, 0, 0},
{0, 389, EIF_TRUE, 0, 0},
{0, 390, EIF_FALSE, 0, 0},
{0, 391, EIF_FALSE, 0, 0},
{0, 392, EIF_TRUE, 0, 0},
{0, 393, EIF_FALSE, 0, 0},
{0, 394, EIF_FALSE, 0, 0},
{0, 395, EIF_FALSE, 0, 0},
{0, 396, EIF_TRUE, 0, 0},
{0, 397, EIF_FALSE, 0, 0},
{0, 398, EIF_FALSE, 0, 0},
{0, 399, EIF_FALSE, 0, 0},
{0, 400, EIF_TRUE, 0, 0},
{0, 401, EIF_FALSE, 0, 0},
{0, 402, EIF_FALSE, 0, 0},
{0, 403, EIF_TRUE, 0, 0},
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
{0, 415, EIF_FALSE, &T415f8, 0},
{0, 416, EIF_TRUE, 0, 0},
{0, 417, EIF_FALSE, 0, 0},
{0, 418, EIF_FALSE, 0, 0},
{0, 419, EIF_FALSE, 0, 0},
{0, 420, EIF_FALSE, 0, 0},
{0, 421, EIF_FALSE, 0, 0},
{0, 422, EIF_FALSE, 0, 0},
{0, 423, EIF_TRUE, 0, 0},
{0, 424, EIF_FALSE, 0, 0},
{0, 425, EIF_FALSE, 0, 0},
{0, 426, EIF_TRUE, 0, 0},
{0, 427, EIF_FALSE, 0, 0},
{0, 428, EIF_FALSE, 0, 0},
{0, 429, EIF_TRUE, 0, 0},
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
{0, 440, EIF_FALSE, 0, 0}
};

int main(int argc, char** argv)
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
		GC_GENERAL_REGISTER_DISAPPEARING_LINK(&wp->object, GC_base(object));
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
	return (EIF_REFERENCE) GC_call_with_alloc_lock(GE_weak_pointer_object_without_lock, wp);
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
					GC_unregister_disappearing_link(&wp->object);
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
					GC_unregister_disappearing_link(&wp->object);
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

EIF_CHARACTER_FUNCTION eif_character_function(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_character_function' in 'eif_cecil.c' not implemented\n");
	return (EIF_CHARACTER_FUNCTION) 0;
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
