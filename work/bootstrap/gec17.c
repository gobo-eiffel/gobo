#include "gec.h"

#ifdef __cplusplus
extern "C" {
#endif

/* ET_CLASS_TYPE.position */
T0* T78f63(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T1 t2;
	T0* t3;
	T0* R = 0;
	t1 = (((T78*)(C))->a2?((m1 = ((T78*)(C))->a2, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t2 = (T250x12122(m1));
		t1 = ((T1)(!(t2)));
	}
	if (t1) {
		t3 = (T250x7085(m1));
		t2 = (T180x12150(GE_void(t3)));
		t1 = ((T1)(!(t2)));
	}
	if (t1) {
		R = (T250x7085(m1));
	} else {
		R = (T176f22(GE_void(((T78*)(C))->a3)));
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.is_type_separate_with_type_mark */
T1 T246f32(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = ((a1)==(EIF_VOID));
	if (t1) {
		R = (T246f17(C));
	} else {
		t1 = (T250x12118(GE_void(a1)));
		if (t1) {
			R = EIF_TRUE;
		} else {
			R = (T246f17(C));
		}
	}
	return R;
}

/* ET_CLASS.is_type_separate_with_type_mark */
T1 T80f87(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = ((a1)==(EIF_VOID));
	if (t1) {
		R = (T80f66(C));
	} else {
		t1 = (T250x12118(GE_void(a1)));
		if (t1) {
			R = EIF_TRUE;
		} else {
			R = (T80f66(C));
		}
	}
	return R;
}

/* ET_CLASS_TYPE.is_type_separate_with_type_mark */
T1 T78f23(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = ((a1)==(EIF_VOID));
	if (t1) {
		R = (T78f24(C));
	} else {
		t1 = (T250x12118(GE_void(a1)));
		if (t1) {
			R = EIF_TRUE;
		} else {
			R = (T78f24(C));
		}
	}
	return R;
}

/* ET_BIT_FEATURE.same_named_type */
T1 T1214f32(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T1214f22(C, a1, EIF_VOID, a2, EIF_VOID, a3));
	return R;
}

/* ET_BIT_N.same_named_type */
T1 T1213f33(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T1213f10(C, a1, EIF_VOID, a2, EIF_VOID, a3));
	return R;
}

/* ET_TUPLE_TYPE.same_named_type */
T1 T254f23(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T254f31(C, a1, EIF_VOID, a2, EIF_VOID, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_named_type */
T1 T246f12(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T246f21(C, a1, EIF_VOID, a2, EIF_VOID, a3));
	return R;
}

/* ET_CLASS.same_named_type */
T1 T80f45(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T80f79(C, a1, EIF_VOID, a2, EIF_VOID, a3));
	return R;
}

/* ET_CLASS_TYPE.same_named_type */
T1 T78f19(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T78f7(C, a1, EIF_VOID, a2, EIF_VOID, a3));
	return R;
}

/* ET_BIT_FEATURE.same_base_type */
T1 T1214f61(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T1214f67(C, a1, EIF_VOID, a2, EIF_VOID, a3));
	return R;
}

/* ET_BIT_N.same_base_type */
T1 T1213f60(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T1213f65(C, a1, EIF_VOID, a2, EIF_VOID, a3));
	return R;
}

/* ET_TUPLE_TYPE.same_base_type */
T1 T254f36(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T254f40(C, a1, EIF_VOID, a2, EIF_VOID, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_base_type */
T1 T246f35(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T246f40(C, a1, EIF_VOID, a2, EIF_VOID, a3));
	return R;
}

/* ET_CLASS.same_base_type */
T1 T80f99(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T80f106(C, a1, EIF_VOID, a2, EIF_VOID, a3));
	return R;
}

/* ET_CLASS_TYPE.same_base_type */
T1 T78f37(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T78f41(C, a1, EIF_VOID, a2, EIF_VOID, a3));
	return R;
}

/* ET_BIT_FEATURE.same_as_base_class */
T1 T1214f39(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_N.same_as_base_class */
T1 T1213f39(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_TUPLE_TYPE.same_as_base_class */
T1 T254f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_as_base_class */
T1 T246f5(T0* C)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 R = 0;
	t1 = (T246f6(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t1 = (T246f6(C));
		t2 = (EIF_FALSE);
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = (T246f16(C));
			t2 = ((T1)(!(t2)));
			if (t2) {
				t2 = (T246f10(C));
				t1 = (T246f6(C));
				t3 = (T80f113(GE_void(t1)));
				t2 = (((((t2) == (t3)))));
				if (t2) {
					t2 = (T246f17(C));
					t1 = (T246f6(C));
					t3 = (T80f66(GE_void(t1)));
					R = (((((t2) == (t3)))));
				} else {
					R = EIF_FALSE;
				}
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_CLASS.same_as_base_class */
T1 T80f59(T0* C)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 R = 0;
	t1 = (T80f91(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t1 = (T80f91(C));
		t2 = ((t1)==(C));
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = (T80f121(C));
			t2 = ((T1)(!(t2)));
			if (t2) {
				t2 = (T80f113(C));
				t1 = (T80f91(C));
				t3 = (T80f113(GE_void(t1)));
				t2 = (((((t2) == (t3)))));
				if (t2) {
					t2 = (T80f66(C));
					t1 = (T80f91(C));
					t3 = (T80f66(GE_void(t1)));
					R = (((((t2) == (t3)))));
				} else {
					R = EIF_FALSE;
				}
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_CLASS_TYPE.same_as_base_class */
T1 T78f20(T0* C)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 R = 0;
	t1 = (T78f18(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t1 = (T78f18(C));
		t2 = (EIF_FALSE);
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = (T78f11(C));
			t2 = ((T1)(!(t2)));
			if (t2) {
				t2 = (T78f13(C));
				t1 = (T78f18(C));
				t3 = (T80f113(GE_void(t1)));
				t2 = (((((t2) == (t3)))));
				if (t2) {
					t2 = (T78f24(C));
					t1 = (T78f18(C));
					t3 = (T80f66(GE_void(t1)));
					R = (((((t2) == (t3)))));
				} else {
					R = EIF_FALSE;
				}
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.is_expanded */
T1 T246f10(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* t2;
	T1 R = 0;
	t1 = (((T246*)(C))->a3?((m1 = ((T246*)(C))->a3, EIF_TRUE)):EIF_FALSE);
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (T246f6(C));
		R = (T80f113(GE_void(t2)));
	} else {
		t1 = (T250x12115(m1));
		if (t1) {
			R = EIF_TRUE;
		} else {
			t1 = (T250x12116(m1));
			if (t1) {
				R = EIF_FALSE;
			} else {
				t2 = (T246f6(C));
				R = (T80f113(GE_void(t2)));
			}
		}
	}
	return R;
}

/* ET_CLASS.is_expanded */
T1 T80f113(T0* C)
{
	T1 R = 0;
	R = (T80f75(C));
	return R;
}

/* ET_CLASS.has_expanded_mark */
T1 T80f75(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	t1 = (((T80*)(C))->a26?((m1 = ((T80*)(C))->a26, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = (T388f15(m1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_CLASS_TYPE.is_expanded */
T1 T78f13(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* t2;
	T1 R = 0;
	t1 = (((T78*)(C))->a2?((m1 = ((T78*)(C))->a2, EIF_TRUE)):EIF_FALSE);
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (T78f18(C));
		R = (T80f113(GE_void(t2)));
	} else {
		t1 = (T250x12115(m1));
		if (t1) {
			R = EIF_TRUE;
		} else {
			t1 = (T250x12116(m1));
			if (t1) {
				R = EIF_FALSE;
			} else {
				t2 = (T78f18(C));
				R = (T80f113(GE_void(t2)));
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.same_named_type_with_type_marks */
T1 T1214f22(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 R = 0;
	t1 = (T1214f19(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a3)==(a5));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T243x7058T0T0T0T0T0(GE_void(a1), C, a4, a5, a2, a3));
		}
	}
	return R;
}

/* ET_BIT_N.same_named_type_with_type_marks */
T1 T1213f10(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 R = 0;
	t1 = (T1213f23(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a3)==(a5));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T243x7058T0T0T0T0T0(GE_void(a1), C, a4, a5, a2, a3));
		}
	}
	return R;
}

/* ET_TUPLE_TYPE.same_named_type_with_type_marks */
T1 T254f31(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a4));
	}
	if (t1) {
		t2 = ((a3)==(a5));
		if (!(t2)) {
			t2 = (T254f28(C));
			t1 = ((T1)(!(t2)));
		} else {
			t1 = EIF_TRUE;
		}
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T243x7061T0T0T0T0T0(GE_void(a1), C, a4, a5, a2, a3));
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_named_type_with_type_marks */
T1 T246f21(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 R = 0;
	t1 = (T246f6(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a4));
		}
		if (t2) {
			t3 = ((a3)==(a5));
			if (!(t3)) {
				t3 = (T246f16(C));
				t2 = ((T1)(!(t3)));
			} else {
				t2 = EIF_TRUE;
			}
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T243x7059T0T0T0T0T0(GE_void(a1), C, a4, a5, a2, a3));
		}
	}
	return R;
}

/* ET_CLASS.same_named_type_with_type_marks */
T1 T80f79(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 R = 0;
	t1 = (T80f91(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a4));
		}
		if (t2) {
			t3 = ((a3)==(a5));
			if (!(t3)) {
				t3 = (T80f121(C));
				t2 = ((T1)(!(t3)));
			} else {
				t2 = EIF_TRUE;
			}
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T243x7059T0T0T0T0T0(GE_void(a1), C, a4, a5, a2, a3));
		}
	}
	return R;
}

/* ET_CLASS_TYPE.same_named_type_with_type_marks */
T1 T78f7(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 R = 0;
	t1 = (T78f18(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a4));
		}
		if (t2) {
			t3 = ((a3)==(a5));
			if (!(t3)) {
				t3 = (T78f11(C));
				t2 = ((T1)(!(t3)));
			} else {
				t2 = EIF_TRUE;
			}
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T243x7059T0T0T0T0T0(GE_void(a1), C, a4, a5, a2, a3));
		}
	}
	return R;
}

/* ET_BIT_FEATURE.named_type_with_type_mark */
T0* T1214f35(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T1214f17(C, a1, a2));
	return R;
}

/* ET_BIT_N.named_type_with_type_mark */
T0* T1213f24(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T1213f21(C, a1, a2));
	return R;
}

/* ET_TUPLE_TYPE.named_type_with_type_mark */
T0* T254f47(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T254f6(C, a1, a2));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.named_type_with_type_mark */
T0* T246f38(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T246f15(C, a1, a2));
	return R;
}

/* ET_CLASS.named_type_with_type_mark */
T0* T80f102(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T80f81(C, a1, a2));
	return R;
}

/* ET_CLASS_TYPE.named_type_with_type_mark */
T0* T78f40(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T78f10(C, a1, a2));
	return R;
}

/* ET_BIT_FEATURE.base_type_actual_count */
T6 T1214f13(T0* C, T0* a1)
{
	T6 R = 0;
	R = (T1214f37(C));
	return R;
}

/* ET_BIT_N.base_type_actual_count */
T6 T1213f17(T0* C, T0* a1)
{
	T6 R = 0;
	R = (T1213f38(C));
	return R;
}

/* ET_TUPLE_TYPE.base_type_actual_count */
T6 T254f42(T0* C, T0* a1)
{
	T6 R = 0;
	R = (T254f46(C));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.base_type_actual_count */
T6 T246f42(T0* C, T0* a1)
{
	T6 R = 0;
	R = (T246f45(C));
	return R;
}

/* ET_CLASS.base_type_actual_count */
T6 T80f108(T0* C, T0* a1)
{
	T6 R = 0;
	R = (T80f111(C));
	return R;
}

/* ET_CLASS_TYPE.base_type_actual_count */
T6 T78f43(T0* C, T0* a1)
{
	T6 R = 0;
	R = (T78f47(C));
	return R;
}

/* ET_BIT_FEATURE.base_type_with_type_mark */
T0* T1214f17(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T0* t2;
	T0* R = 0;
	t1 = ((((T1214*)(C))->a5)!=(EIF_VOID));
	if (t1) {
		R = C;
	} else {
		t2 = (T1214f63(C));
		R = (T79f1(GE_void(t2)));
	}
	return R;
}

/* ET_BIT_N.base_type_with_type_mark */
T0* T1213f21(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T0* t2;
	T0* R = 0;
	t1 = ((((T1213*)(C))->a1)!=(EIF_VOID));
	if (t1) {
		R = C;
	} else {
		t2 = (T1213f62(C));
		R = (T79f1(GE_void(t2)));
	}
	return R;
}

/* ET_TUPLE_TYPE.base_type_with_type_mark */
T0* T254f6(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	l1 = ((T254*)(C))->a2;
	t1 = ((a2)==(C));
	if (t1) {
		l2 = l1;
	} else {
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			l2 = (T245f8(GE_void(l1), a2));
		}
	}
	l3 = (T254f9(C, a1));
	t1 = ((l3)!=(((T254*)(C))->a3));
	if (!(t1)) {
		t1 = ((l2)!=(l1));
	}
	if (t1) {
		l4 = T254c107(l3, l2, ((T254*)(C))->a1);
		T254f108(GE_void(l4), ((T254*)(C))->a4);
		R = l4;
	} else {
		R = C;
	}
	return R;
}

/* ET_ACTUAL_PARAMETER_LIST.named_types */
T0* T245f8(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	R = C;
	l3 = ((T6)((((T245*)(C))->a3)-((T6)(GE_int32(1)))));
	l1 = (T6)(GE_int32(0));
	while (1) {
		t1 = (T6f1((&l1), l3));
		if (t1) {
			break;
		}
		t2 = (((T640*)(GE_void(((T245*)(C))->a4)))->z2[l1]);
		l4 = (T248x7102(GE_void(t2)));
		l6 = (T848x7103(GE_void(l4)));
		t1 = ((l6)!=(l7));
		if (!(t1)) {
			t1 = ((l8)==(EIF_VOID));
		}
		if (t1) {
			l8 = (T243x7017T0(GE_void(l6), a1));
			l7 = l6;
		}
		l5 = (T848x7098T0(GE_void(l4), l8));
		t1 = ((R)!=(C));
		if (t1) {
			T245f25(GE_void(R), l5);
		} else {
			t1 = ((l4)!=(l5));
			if (t1) {
				R = T245c24(((T245*)(C))->a3);
				T245f28(GE_void(R), ((T245*)(C))->a1);
				T245f29(GE_void(R), ((T245*)(C))->a2);
				l2 = (T6)(GE_int32(0));
				while (1) {
					t1 = (T6f12((&l2), l1));
					if (t1) {
						break;
					}
					t2 = (((T640*)(GE_void(((T245*)(C))->a4)))->z2[l2]);
					t2 = (T248x7102(GE_void(t2)));
					T245f25(GE_void(R), t2);
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				}
				T245f25(GE_void(R), l5);
			}
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.base_type_with_type_mark */
T0* T246f15(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 t2;
	T0* t3;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	l1 = ((T246*)(C))->a1;
	t1 = ((a2)==(C));
	if (!(t1)) {
		t2 = (T244x7131(GE_void(a2)));
		if (t2) {
			t3 = (T244x7118(GE_void(a2)));
			t1 = ((t3)==(C));
		} else {
			t1 = EIF_FALSE;
		}
	}
	if (t1) {
		l2 = l1;
	} else {
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			l2 = (((((T0*)(GE_void(l1)))->id==245)?T245f8(l1, a2):T634f7(l1, a2)));
		}
	}
	l3 = (T246f22(C, a1));
	t1 = ((l3)!=(((T246*)(C))->a3));
	if (!(t1)) {
		t1 = ((l2)!=(l1));
	}
	if (t1) {
		t1 = ((l2)!=(EIF_VOID));
		if (t1) {
			R = T246c109(l3, ((T246*)(C))->a4, l2, ((T246*)(C))->a2);
		} else {
			R = T78c110(l3, ((T246*)(C))->a4, ((T246*)(C))->a2);
		}
	} else {
		R = C;
	}
	return R;
}

/* ET_FORMAL_PARAMETER_LIST.named_types */
T0* T634f7(T0* C, T0* a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CLASS.base_type_with_type_mark */
T0* T80f81(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 t2;
	T0* t3;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	l1 = ((T80*)(C))->a22;
	t1 = ((a2)==(C));
	if (!(t1)) {
		t2 = (T244x7131(GE_void(a2)));
		if (t2) {
			t3 = (T244x7118(GE_void(a2)));
			t1 = ((t3)==(C));
		} else {
			t1 = EIF_FALSE;
		}
	}
	if (t1) {
		l2 = l1;
	} else {
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			l2 = (T634f7(GE_void(l1), a2));
		}
	}
	l3 = (T80f74(C, a1));
	t1 = ((l3)!=(((T80*)(C))->a26));
	if (!(t1)) {
		t1 = ((l2)!=(l1));
	}
	if (t1) {
		t1 = ((l2)!=(EIF_VOID));
		if (t1) {
			R = T246c109(l3, ((T80*)(C))->a12, l2, ((T80*)(C))->a19);
		} else {
			R = T78c110(l3, ((T80*)(C))->a12, ((T80*)(C))->a19);
		}
	} else {
		R = C;
	}
	return R;
}

/* ET_CLASS_TYPE.base_type_with_type_mark */
T0* T78f10(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 t2;
	T0* t3;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	l1 = (T78f14(C));
	t1 = ((a2)==(C));
	if (!(t1)) {
		t2 = (T244x7131(GE_void(a2)));
		if (t2) {
			t3 = (T244x7118(GE_void(a2)));
			t1 = ((t3)==(C));
		} else {
			t1 = EIF_FALSE;
		}
	}
	if (t1) {
		l2 = l1;
	} else {
		t1 = (EIF_FALSE);
		if (t1) {
			l2 = ((GE_void(l1), a2, (T0*)0));
		}
	}
	l3 = (T78f17(C, a1));
	t1 = ((l3)!=(((T78*)(C))->a2));
	if (!(t1)) {
		t1 = (EIF_FALSE);
	}
	if (t1) {
		t1 = (EIF_FALSE);
		if (t1) {
			R = T246c109(l3, ((T78*)(C))->a3, l2, ((T78*)(C))->a1);
		} else {
			R = T78c110(l3, ((T78*)(C))->a3, ((T78*)(C))->a1);
		}
	} else {
		R = C;
	}
	return R;
}

/* ET_BIT_FEATURE.unaliased_to_text */
T0* T1214f31(T0* C)
{
	T0* R = 0;
	R = T17c44((T6)(GE_int32(15)));
	T1214f113(C, R);
	return R;
}

/* ET_BIT_N.unaliased_to_text */
T0* T1213f32(T0* C)
{
	T0* R = 0;
	R = T17c44((T6)(GE_int32(15)));
	T1213f112(C, R);
	return R;
}

/* ET_TUPLE_TYPE.unaliased_to_text */
T0* T254f14(T0* C)
{
	T0* R = 0;
	R = T17c44((T6)(GE_int32(15)));
	T254f109(C, R);
	return R;
}

/* ET_GENERIC_CLASS_TYPE.unaliased_to_text */
T0* T246f7(T0* C)
{
	T0* R = 0;
	R = T17c44((T6)(GE_int32(15)));
	T246f110(C, R);
	return R;
}

/* ET_CLASS.unaliased_to_text */
T0* T80f94(T0* C)
{
	T0* R = 0;
	R = T17c44((T6)(GE_int32(15)));
	T80f220(C, R);
	return R;
}

/* ET_CLASS_TYPE.unaliased_to_text */
T0* T78f27(T0* C)
{
	T0* R = 0;
	R = T17c44((T6)(GE_int32(15)));
	T78f111(C, R);
	return R;
}

/* ET_BIT_FEATURE.same_named_class_type_with_type_marks */
T1 T1214f14(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_N.same_named_class_type_with_type_marks */
T1 T1213f18(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_TUPLE_TYPE.same_named_class_type_with_type_marks */
T1 T254f58(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_named_class_type_with_type_marks */
T1 T246f58(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	T0* t5;
	T0* m1 = 0;
	T0* m2 = 0;
	T1 R = 0;
	t1 = (T246f6(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a4));
		}
		if (t2) {
			t3 = ((a3)==(a5));
			if (!(t3)) {
				t3 = (T246f16(C));
				t2 = ((T1)(!(t3)));
			} else {
				t2 = EIF_TRUE;
			}
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = (T244x7143(GE_void(a5)));
			if (t2) {
				t3 = (T246f28(C, a4, a5));
				t4 = (T78x7034T0T0(a1, a2, a3));
				t2 = (((((t3) != (t4)))));
			}
			if (t2) {
				R = EIF_FALSE;
			} else {
				t1 = (T246f6(C));
				t5 = (T78x7120(a1));
				t2 = ((t1)!=(t5));
				if (t2) {
					R = EIF_FALSE;
				} else {
					t2 = (T246f14(C, a4, a5));
					t3 = (T78x7030T0T0(a1, a2, a3));
					t2 = (((((t2) != (t3)))));
					if (t2) {
						R = EIF_FALSE;
					} else {
						t2 = (T246f32(C, a4, a5));
						t3 = (T78x10943T0T0(a1, a2, a3));
						t2 = (((((t2) != (t3)))));
						if (t2) {
							R = EIF_FALSE;
						} else {
							t1 = (T78x6943(a1));
							t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
							t2 = ((T1)(!(t2)));
							if (t2) {
								t2 = (T246f16(C));
								R = ((T1)(!(t2)));
							} else {
								t2 = (((T246*)(C))->a1?((m2 = ((T246*)(C))->a1, EIF_TRUE)):EIF_FALSE);
								t2 = ((T1)(!(t2)));
								if (t2) {
									R = (((((T0*)(m1))->id==245)?T245f9(m1):T634f14(m1)));
								} else {
									R = (((((T0*)(m2))->id==245)?T245f13(m2, m1, a3, a5):T634f8(m2, m1, a3, a5)));
								}
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_FORMAL_PARAMETER_LIST.same_named_types */
T1 T634f8(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T0* t4;
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (((((T0*)(GE_void(a1)))->id==245)?((T245*)(a1))->a3:((T634*)(a1))->a1));
		t1 = (((((t2) != (((T634*)(C))->a1)))));
		if (t1) {
			R = EIF_FALSE;
		} else {
			R = EIF_TRUE;
			l3 = (((((T0*)(GE_void(a1)))->id==245)?((T245*)(a1))->a4:((T634*)(a1))->a2));
			l2 = ((T6)((((T634*)(C))->a1)-((T6)(GE_int32(1)))));
			l1 = (T6)(GE_int32(0));
			while (1) {
				t1 = (T6f1((&l1), l2));
				if (t1) {
					break;
				}
				t3 = (((T1085*)(GE_void(((T634*)(C))->a2)))->z2[l1]);
				t3 = (((((T0*)(GE_void(t3)))->id==1081)?T1081f7(t3):T1209f10(t3)));
				t4 = (((((T0*)(GE_void(l3)))->id==640)?((T640*)(l3))->z2[l1]:((T1085*)(l3))->z2[l1]));
				t4 = (T248x7103(GE_void(t4)));
				t1 = (((((T0*)(GE_void(t3)))->id==1081)?T1081f22(t3, t4, a2, a3):T1209f24(t3, t4, a2, a3)));
				t1 = ((T1)(!(t1)));
				if (t1) {
					R = EIF_FALSE;
					l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				}
			}
		}
	}
	return R;
}

/* ET_ACTUAL_PARAMETER_LIST.same_named_types */
T1 T245f13(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T0* t4;
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (((((T0*)(GE_void(a1)))->id==245)?((T245*)(a1))->a3:((T634*)(a1))->a1));
		t1 = (((((t2) != (((T245*)(C))->a3)))));
		if (t1) {
			R = EIF_FALSE;
		} else {
			R = EIF_TRUE;
			l3 = (((((T0*)(GE_void(a1)))->id==245)?((T245*)(a1))->a4:((T634*)(a1))->a2));
			l2 = ((T6)((((T245*)(C))->a3)-((T6)(GE_int32(1)))));
			l1 = (T6)(GE_int32(0));
			while (1) {
				t1 = (T6f1((&l1), l2));
				if (t1) {
					break;
				}
				t3 = (((T640*)(GE_void(((T245*)(C))->a4)))->z2[l1]);
				t3 = (T248x7103(GE_void(t3)));
				t4 = (((((T0*)(GE_void(l3)))->id==640)?((T640*)(l3))->z2[l1]:((T1085*)(l3))->z2[l1]));
				t4 = (T248x7103(GE_void(t4)));
				t1 = (T243x7047T0T0T0(GE_void(t3), t4, a2, a3));
				t1 = ((T1)(!(t1)));
				if (t1) {
					R = EIF_FALSE;
					l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				}
			}
		}
	}
	return R;
}

/* ET_CLASS.same_named_class_type_with_type_marks */
T1 T80f140(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	T0* t5;
	T0* m1 = 0;
	T0* m2 = 0;
	T1 R = 0;
	t1 = (T80f91(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a4));
		}
		if (t2) {
			t3 = ((a3)==(a5));
			if (!(t3)) {
				t3 = (T80f121(C));
				t2 = ((T1)(!(t3)));
			} else {
				t2 = EIF_TRUE;
			}
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = (T244x7143(GE_void(a5)));
			if (t2) {
				t3 = (T80f72(C, a4, a5));
				t4 = (T78x7034T0T0(a1, a2, a3));
				t2 = (((((t3) != (t4)))));
			}
			if (t2) {
				R = EIF_FALSE;
			} else {
				t1 = (T80f91(C));
				t5 = (T78x7120(a1));
				t2 = ((t1)!=(t5));
				if (t2) {
					R = EIF_FALSE;
				} else {
					t2 = (T80f73(C, a4, a5));
					t3 = (T78x7030T0T0(a1, a2, a3));
					t2 = (((((t2) != (t3)))));
					if (t2) {
						R = EIF_FALSE;
					} else {
						t2 = (T80f87(C, a4, a5));
						t3 = (T78x10943T0T0(a1, a2, a3));
						t2 = (((((t2) != (t3)))));
						if (t2) {
							R = EIF_FALSE;
						} else {
							t1 = (T78x6943(a1));
							t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
							t2 = ((T1)(!(t2)));
							if (t2) {
								t2 = (T80f121(C));
								R = ((T1)(!(t2)));
							} else {
								t2 = (((T80*)(C))->a22?((m2 = ((T80*)(C))->a22, EIF_TRUE)):EIF_FALSE);
								t2 = ((T1)(!(t2)));
								if (t2) {
									R = (((((T0*)(m1))->id==634)?T634f14(m1):T245f9(m1)));
								} else {
									R = (T634f8(m2, m1, a3, a5));
								}
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_CLASS_TYPE.same_named_class_type_with_type_marks */
T1 T78f12(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	T0* t5;
	T0* m1 = 0;
	T0* m2 = 0;
	T1 R = 0;
	t1 = (T78f18(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a4));
		}
		if (t2) {
			t3 = ((a3)==(a5));
			if (!(t3)) {
				t3 = (T78f11(C));
				t2 = ((T1)(!(t3)));
			} else {
				t2 = EIF_TRUE;
			}
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = (T244x7143(GE_void(a5)));
			if (t2) {
				t3 = (T78f22(C, a4, a5));
				t4 = (T78x7034T0T0(a1, a2, a3));
				t2 = (((((t3) != (t4)))));
			}
			if (t2) {
				R = EIF_FALSE;
			} else {
				t1 = (T78f18(C));
				t5 = (T78x7120(a1));
				t2 = ((t1)!=(t5));
				if (t2) {
					R = EIF_FALSE;
				} else {
					t2 = (T78f9(C, a4, a5));
					t3 = (T78x7030T0T0(a1, a2, a3));
					t2 = (((((t2) != (t3)))));
					if (t2) {
						R = EIF_FALSE;
					} else {
						t2 = (T78f23(C, a4, a5));
						t3 = (T78x10943T0T0(a1, a2, a3));
						t2 = (((((t2) != (t3)))));
						if (t2) {
							R = EIF_FALSE;
						} else {
							t1 = (T78x6943(a1));
							t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
							t2 = ((T1)(!(t2)));
							if (t2) {
								t2 = (T78f11(C));
								R = ((T1)(!(t2)));
							} else {
								t1 = (T78f14(C));
								t2 = (t1?((m2 = t1, EIF_TRUE)):EIF_FALSE);
								t2 = ((T1)(!(t2)));
								if (t2) {
									R = (((((T0*)(m1))->id==245)?T245f9(m1):T634f14(m1)));
								} else {
									R = ((m2, m1, a3, a5, (T1)0));
								}
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.same_named_tuple_type_with_type_marks */
T1 T1214f15(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_N.same_named_tuple_type_with_type_marks */
T1 T1213f19(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_TUPLE_TYPE.same_named_tuple_type_with_type_marks */
T1 T254f59(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 t1;
	T1 t2;
	T1 t3;
	T0* t4;
	T0* m1 = 0;
	T0* m2 = 0;
	T1 R = 0;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a4));
	}
	if (t1) {
		t2 = ((a3)==(a5));
		if (!(t2)) {
			t2 = (T254f28(C));
			t1 = ((T1)(!(t2)));
		} else {
			t1 = EIF_TRUE;
		}
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = (T244x7143(GE_void(a5)));
		if (t1) {
			t2 = (T254f29(C, a4, a5));
			t3 = (T254f29(a1, a2, a3));
			t1 = (((((t2) != (t3)))));
		}
		if (t1) {
			R = EIF_FALSE;
		} else {
			t1 = (T254f24(C));
			t2 = (T254f24(a1));
			t1 = (((((t1) != (t2)))));
			if (t1) {
				R = EIF_FALSE;
			} else {
				t4 = (((T254*)(a1))->a2);
				t1 = (t4?((m1 = t4, EIF_TRUE)):EIF_FALSE);
				t1 = ((T1)(!(t1)));
				if (t1) {
					t1 = (T254f28(C));
					R = ((T1)(!(t1)));
				} else {
					t1 = (((T254*)(C))->a2?((m2 = ((T254*)(C))->a2, EIF_TRUE)):EIF_FALSE);
					t1 = ((T1)(!(t1)));
					if (t1) {
						R = (T245f9(m1));
					} else {
						R = (T245f13(m2, m1, a3, a5));
					}
				}
			}
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_named_tuple_type_with_type_marks */
T1 T246f59(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS.same_named_tuple_type_with_type_marks */
T1 T80f141(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS_TYPE.same_named_tuple_type_with_type_marks */
T1 T78f34(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_FEATURE.conforms_from_class_type_with_type_marks */
T1 T1214f9(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_N.conforms_from_class_type_with_type_marks */
T1 T1213f13(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_TUPLE_TYPE.conforms_from_class_type_with_type_marks */
T1 T254f18(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T0* l1 = 0;
	l1 = (T78x7120(GE_void(a1)));
	t1 = (T80f116(GE_void(l1)));
	if (t1) {
		t1 = (T244x7143(GE_void(a3)));
		if (t1) {
			R = (T254f27(C, a4, a5));
		} else {
			R = EIF_TRUE;
		}
	} else {
		t2 = (T254f12(C));
		t1 = ((l1)==(t2));
		if (t1) {
			t3 = (T254f28(C));
			t1 = ((T1)(!(t3)));
		}
		if (t1) {
			t1 = (T244x7143(GE_void(a3)));
			if (t1) {
				t1 = (T254f29(C, a4, a5));
				if (t1) {
					R = (T78x7034T0T0(GE_void(a1), a2, a3));
				} else {
					R = EIF_TRUE;
				}
			} else {
				R = EIF_TRUE;
			}
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.conforms_from_class_type_with_type_marks */
T1 T246f24(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T0* m1 = 0;
	T0* m2 = 0;
	T0* m3 = 0;
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	l1 = (T78x7120(GE_void(a1)));
	t1 = (T246f6(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a4));
		}
		if (t2) {
			t3 = ((a3)==(a5));
			if (!(t3)) {
				t3 = (T246f16(C));
				t2 = ((T1)(!(t3)));
			} else {
				t2 = EIF_TRUE;
			}
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = (T244x7143(GE_void(a3)));
			if (t2) {
				t3 = (T246f28(C, a4, a5));
				if (t3) {
					t3 = (T78x7034T0T0(GE_void(a1), a2, a3));
				} else {
					t3 = EIF_TRUE;
				}
				t2 = ((T1)(!(t3)));
			}
			if (t2) {
				R = EIF_FALSE;
			} else {
				t1 = (T246f6(C));
				t2 = ((t1)==(l1));
				if (t2) {
					t2 = (T246f14(C, a4, a5));
					if (t2) {
						t3 = (T78x7030T0T0(GE_void(a1), a2, a3));
						t2 = ((T1)(!(t3)));
					}
					if (t2) {
						R = EIF_FALSE;
					} else {
						t1 = (T78x6943(GE_void(a1)));
						t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
						t2 = ((T1)(!(t2)));
						if (t2) {
							t2 = (T246f16(C));
							R = ((T1)(!(t2)));
						} else {
							t2 = (((T246*)(C))->a1?((m2 = ((T246*)(C))->a1, EIF_TRUE)):EIF_FALSE);
							t2 = ((T1)(!(t2)));
							if (t2) {
								R = (((((T0*)(m1))->id==245)?T245f9(m1):T634f14(m1)));
							} else {
								R = (((((T0*)(m1))->id==245)?T245f10(m1, m2, a5, a3):T634f5(m1, m2, a5, a3)));
							}
						}
					}
				} else {
					t2 = (T246f14(C, a4, a5));
					t2 = ((T1)(!(t2)));
					if (t2) {
						t2 = (T80f116(GE_void(l1)));
						if (t2) {
							R = EIF_TRUE;
						} else {
							t2 = (T80f51(GE_void(l1)));
							t2 = ((T1)(!(t2)));
							if (t2) {
								R = EIF_FALSE;
							} else {
								t1 = (T80f67(GE_void(l1)));
								t1 = (T31x3181(GE_void(t1)));
								T80f218(GE_void(l1), t1);
								t1 = (T80f68(GE_void(l1), C));
								t2 = (t1?((m3 = t1, EIF_TRUE)):EIF_FALSE);
								if (t2) {
									l3 = (T78x7007T0(GE_void(a1), a2));
									t2 = (T78x6955(GE_void(a1)));
									if (t2) {
										t3 = (T71x6955(m3));
										t2 = ((T1)(!(t3)));
									}
									if (t2) {
										t3 = ((l3)==(EIF_VOID));
										if (!(t3)) {
											t3 = (T250x12120(GE_void(l3)));
											t2 = ((T1)(!(t3)));
										} else {
											t2 = EIF_TRUE;
										}
									}
									if (t2) {
										t1 = (T246f26(C));
										l3 = (T79f25(GE_void(t1)));
									}
									t2 = (T71x6952(m3));
									t2 = ((T1)(!(t2)));
									if (t2) {
										R = (T71x7067T0T0T0T0T0(m3, C, a4, a5, l3, a3));
									} else {
										t2 = ((a3)!=(a5));
										if (t2) {
											l2 = (T244x7166(GE_void(a3)));
										} else {
											l2 = (T244x7167(GE_void(a3)));
										}
										T371f54(GE_void(l2), a1);
										R = (T71x7067T0T0T0T0T0(m3, C, a4, a5, l3, l2));
										T371f55(GE_void(l2));
									}
								} else {
									t1 = (T246f6(C));
									t2 = (T80f69(GE_void(t1)));
									if (t2) {
										t1 = (T246f6(C));
										t2 = (T80f70(GE_void(t1)));
									}
									if (t2) {
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
	return R;
}

/* ET_FORMAL_PARAMETER_LIST.conforms_to_types */
T1 T634f5(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T0* t4;
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (((((T0*)(GE_void(a1)))->id==634)?((T634*)(a1))->a1:((T245*)(a1))->a3));
		t1 = (((((t2) != (((T634*)(C))->a1)))));
		if (t1) {
			R = EIF_FALSE;
		} else {
			R = EIF_TRUE;
			l3 = (((((T0*)(GE_void(a1)))->id==634)?((T634*)(a1))->a2:((T245*)(a1))->a4));
			l2 = ((T6)((((T634*)(C))->a1)-((T6)(GE_int32(1)))));
			l1 = (T6)(GE_int32(0));
			while (1) {
				t1 = (T6f1((&l1), l2));
				if (t1) {
					break;
				}
				t3 = (((T1085*)(GE_void(((T634*)(C))->a2)))->z2[l1]);
				t3 = (((((T0*)(GE_void(t3)))->id==1081)?T1081f7(t3):T1209f10(t3)));
				t4 = (((((T0*)(GE_void(l3)))->id==640)?((T640*)(l3))->z2[l1]:((T1085*)(l3))->z2[l1]));
				t4 = (T248x7103(GE_void(t4)));
				t1 = (((((T0*)(GE_void(t3)))->id==1081)?T1081f21(t3, t4, a2, a3):T1209f23(t3, t4, a2, a3)));
				t1 = ((T1)(!(t1)));
				if (t1) {
					R = EIF_FALSE;
					l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				}
			}
		}
	}
	return R;
}

/* ET_ACTUAL_PARAMETER_LIST.conforms_to_types */
T1 T245f10(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T0* t4;
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (((((T0*)(GE_void(a1)))->id==245)?((T245*)(a1))->a3:((T634*)(a1))->a1));
		t1 = (((((t2) != (((T245*)(C))->a3)))));
		if (t1) {
			R = EIF_FALSE;
		} else {
			R = EIF_TRUE;
			l3 = (((((T0*)(GE_void(a1)))->id==245)?((T245*)(a1))->a4:((T634*)(a1))->a2));
			l2 = ((T6)((((T245*)(C))->a3)-((T6)(GE_int32(1)))));
			l1 = (T6)(GE_int32(0));
			while (1) {
				t1 = (T6f1((&l1), l2));
				if (t1) {
					break;
				}
				t3 = (((T640*)(GE_void(((T245*)(C))->a4)))->z2[l1]);
				t3 = (T248x7103(GE_void(t3)));
				t4 = (((((T0*)(GE_void(l3)))->id==640)?((T640*)(l3))->z2[l1]:((T1085*)(l3))->z2[l1]));
				t4 = (T248x7103(GE_void(t4)));
				t1 = (T243x7066T0T0T0(GE_void(t3), t4, a2, a3));
				t1 = ((T1)(!(t1)));
				if (t1) {
					R = EIF_FALSE;
					l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				}
			}
		}
	}
	return R;
}

/* ET_CLASS.conforms_from_class_type_with_type_marks */
T1 T80f46(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T0* m1 = 0;
	T0* m2 = 0;
	T0* m3 = 0;
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	l1 = (T78x7120(GE_void(a1)));
	t1 = (T80f91(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a4));
		}
		if (t2) {
			t3 = ((a3)==(a5));
			if (!(t3)) {
				t3 = (T80f121(C));
				t2 = ((T1)(!(t3)));
			} else {
				t2 = EIF_TRUE;
			}
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = (T244x7143(GE_void(a3)));
			if (t2) {
				t3 = (T80f72(C, a4, a5));
				if (t3) {
					t3 = (T78x7034T0T0(GE_void(a1), a2, a3));
				} else {
					t3 = EIF_TRUE;
				}
				t2 = ((T1)(!(t3)));
			}
			if (t2) {
				R = EIF_FALSE;
			} else {
				t1 = (T80f91(C));
				t2 = ((t1)==(l1));
				if (t2) {
					t2 = (T80f73(C, a4, a5));
					if (t2) {
						t3 = (T78x7030T0T0(GE_void(a1), a2, a3));
						t2 = ((T1)(!(t3)));
					}
					if (t2) {
						R = EIF_FALSE;
					} else {
						t1 = (T78x6943(GE_void(a1)));
						t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
						t2 = ((T1)(!(t2)));
						if (t2) {
							t2 = (T80f121(C));
							R = ((T1)(!(t2)));
						} else {
							t2 = (((T80*)(C))->a22?((m2 = ((T80*)(C))->a22, EIF_TRUE)):EIF_FALSE);
							t2 = ((T1)(!(t2)));
							if (t2) {
								R = (((((T0*)(m1))->id==245)?T245f9(m1):T634f14(m1)));
							} else {
								R = (((((T0*)(m1))->id==245)?T245f10(m1, m2, a5, a3):T634f5(m1, m2, a5, a3)));
							}
						}
					}
				} else {
					t2 = (T80f73(C, a4, a5));
					t2 = ((T1)(!(t2)));
					if (t2) {
						t2 = (T80f116(GE_void(l1)));
						if (t2) {
							R = EIF_TRUE;
						} else {
							t2 = (T80f51(GE_void(l1)));
							t2 = ((T1)(!(t2)));
							if (t2) {
								R = EIF_FALSE;
							} else {
								t1 = (T80f67(GE_void(l1)));
								t1 = (T31x3181(GE_void(t1)));
								T80f218(GE_void(l1), t1);
								t1 = (T80f68(GE_void(l1), C));
								t2 = (t1?((m3 = t1, EIF_TRUE)):EIF_FALSE);
								if (t2) {
									l3 = (T78x7007T0(GE_void(a1), a2));
									t2 = (T78x6955(GE_void(a1)));
									if (t2) {
										t3 = (T71x6955(m3));
										t2 = ((T1)(!(t3)));
									}
									if (t2) {
										t3 = ((l3)==(EIF_VOID));
										if (!(t3)) {
											t3 = (T250x12120(GE_void(l3)));
											t2 = ((T1)(!(t3)));
										} else {
											t2 = EIF_TRUE;
										}
									}
									if (t2) {
										t1 = (T80f71(C));
										l3 = (T79f25(GE_void(t1)));
									}
									t2 = (T71x6952(m3));
									t2 = ((T1)(!(t2)));
									if (t2) {
										R = (T71x7067T0T0T0T0T0(m3, C, a4, a5, l3, a3));
									} else {
										t2 = ((a3)!=(a5));
										if (t2) {
											l2 = (T244x7166(GE_void(a3)));
										} else {
											l2 = (T244x7167(GE_void(a3)));
										}
										T371f54(GE_void(l2), a1);
										R = (T71x7067T0T0T0T0T0(m3, C, a4, a5, l3, l2));
										T371f55(GE_void(l2));
									}
								} else {
									t1 = (T80f91(C));
									t2 = (T80f69(GE_void(t1)));
									if (t2) {
										t1 = (T80f91(C));
										t2 = (T80f70(GE_void(t1)));
									}
									if (t2) {
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
	return R;
}

/* ET_CLASS_TYPE.conforms_from_class_type_with_type_marks */
T1 T78f29(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T0* m1 = 0;
	T0* m2 = 0;
	T0* m3 = 0;
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	l1 = (T78x7120(GE_void(a1)));
	t1 = (T78f18(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a4));
		}
		if (t2) {
			t3 = ((a3)==(a5));
			if (!(t3)) {
				t3 = (T78f11(C));
				t2 = ((T1)(!(t3)));
			} else {
				t2 = EIF_TRUE;
			}
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = (T244x7143(GE_void(a3)));
			if (t2) {
				t3 = (T78f22(C, a4, a5));
				if (t3) {
					t3 = (T78x7034T0T0(GE_void(a1), a2, a3));
				} else {
					t3 = EIF_TRUE;
				}
				t2 = ((T1)(!(t3)));
			}
			if (t2) {
				R = EIF_FALSE;
			} else {
				t1 = (T78f18(C));
				t2 = ((t1)==(l1));
				if (t2) {
					t2 = (T78f9(C, a4, a5));
					if (t2) {
						t3 = (T78x7030T0T0(GE_void(a1), a2, a3));
						t2 = ((T1)(!(t3)));
					}
					if (t2) {
						R = EIF_FALSE;
					} else {
						t1 = (T78x6943(GE_void(a1)));
						t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
						t2 = ((T1)(!(t2)));
						if (t2) {
							t2 = (T78f11(C));
							R = ((T1)(!(t2)));
						} else {
							t1 = (T78f14(C));
							t2 = (t1?((m2 = t1, EIF_TRUE)):EIF_FALSE);
							t2 = ((T1)(!(t2)));
							if (t2) {
								R = (((((T0*)(m1))->id==245)?T245f9(m1):T634f14(m1)));
							} else {
								R = (((((T0*)(m1))->id==245)?T245f10(m1, m2, a5, a3):T634f5(m1, m2, a5, a3)));
							}
						}
					}
				} else {
					t2 = (T78f9(C, a4, a5));
					t2 = ((T1)(!(t2)));
					if (t2) {
						t2 = (T80f116(GE_void(l1)));
						if (t2) {
							R = EIF_TRUE;
						} else {
							t2 = (T80f51(GE_void(l1)));
							t2 = ((T1)(!(t2)));
							if (t2) {
								R = EIF_FALSE;
							} else {
								t1 = (T80f67(GE_void(l1)));
								t1 = (T31x3181(GE_void(t1)));
								T80f218(GE_void(l1), t1);
								t1 = (T80f68(GE_void(l1), C));
								t2 = (t1?((m3 = t1, EIF_TRUE)):EIF_FALSE);
								if (t2) {
									l3 = (T78x7007T0(GE_void(a1), a2));
									t2 = (T78x6955(GE_void(a1)));
									if (t2) {
										t3 = (T71x6955(m3));
										t2 = ((T1)(!(t3)));
									}
									if (t2) {
										t3 = ((l3)==(EIF_VOID));
										if (!(t3)) {
											t3 = (T250x12120(GE_void(l3)));
											t2 = ((T1)(!(t3)));
										} else {
											t2 = EIF_TRUE;
										}
									}
									if (t2) {
										t1 = (T78f26(C));
										l3 = (T79f25(GE_void(t1)));
									}
									t2 = (T71x6952(m3));
									t2 = ((T1)(!(t2)));
									if (t2) {
										R = (T71x7067T0T0T0T0T0(m3, C, a4, a5, l3, a3));
									} else {
										t2 = ((a3)!=(a5));
										if (t2) {
											l2 = (T244x7166(GE_void(a3)));
										} else {
											l2 = (T244x7167(GE_void(a3)));
										}
										T371f54(GE_void(l2), a1);
										R = (T71x7067T0T0T0T0T0(m3, C, a4, a5, l3, l2));
										T371f55(GE_void(l2));
									}
								} else {
									t1 = (T78f18(C));
									t2 = (T80f69(GE_void(t1)));
									if (t2) {
										t1 = (T78f18(C));
										t2 = (T80f70(GE_void(t1)));
									}
									if (t2) {
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
	return R;
}

/* ET_BIT_FEATURE.conforms_from_tuple_type_with_type_marks */
T1 T1214f10(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	l1 = (T254f12(a1));
	t1 = (T80f51(GE_void(l1)));
	if (t1) {
		t2 = (T254f9(a1, a2));
		R = (T1214f9(C, l1, t2, a3, a4, a5));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		t2 = (T1214f19(C));
		t1 = (T80f51(GE_void(t2)));
		t1 = ((T1)(!(t1)));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t2 = (T1214f19(C));
			t2 = (T80f67(GE_void(t2)));
			l2 = (T31x3288(GE_void(t2)));
			t2 = (T254f9(a1, a2));
			R = (T1214f9(C, l2, t2, a3, a4, a5));
		}
	}
	return R;
}

/* ET_BIT_N.conforms_from_tuple_type_with_type_marks */
T1 T1213f14(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	l1 = (T254f12(a1));
	t1 = (T80f51(GE_void(l1)));
	if (t1) {
		t2 = (T254f9(a1, a2));
		R = (T1213f13(C, l1, t2, a3, a4, a5));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		t2 = (T1213f23(C));
		t1 = (T80f51(GE_void(t2)));
		t1 = ((T1)(!(t1)));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t2 = (T1213f23(C));
			t2 = (T80f67(GE_void(t2)));
			l2 = (T31x3288(GE_void(t2)));
			t2 = (T254f9(a1, a2));
			R = (T1213f13(C, l2, t2, a3, a4, a5));
		}
	}
	return R;
}

/* ET_TUPLE_TYPE.conforms_from_tuple_type_with_type_marks */
T1 T254f32(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 t1;
	T1 t2;
	T0* m1 = 0;
	T0* t3;
	T0* m2 = 0;
	T1 R = 0;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a4));
	}
	if (t1) {
		t2 = ((a3)==(a5));
		if (!(t2)) {
			t2 = (T254f28(C));
			t1 = ((T1)(!(t2)));
		} else {
			t1 = EIF_TRUE;
		}
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = (T244x7143(GE_void(a3)));
		if (t1) {
			t2 = (T254f29(C, a4, a5));
			if (t2) {
				t2 = (T254f29(a1, a2, a3));
			} else {
				t2 = EIF_TRUE;
			}
			t1 = ((T1)(!(t2)));
		}
		if (t1) {
			R = EIF_FALSE;
		} else {
			t1 = (((T254*)(C))->a2?((m1 = ((T254*)(C))->a2, EIF_TRUE)):EIF_FALSE);
			t1 = ((T1)(!(t1)));
			if (t1) {
				R = EIF_TRUE;
			} else {
				t3 = (((T254*)(a1))->a2);
				t1 = (t3?((m2 = t3, EIF_TRUE)):EIF_FALSE);
				t1 = ((T1)(!(t1)));
				if (t1) {
					R = (T245f9(m1));
				} else {
					R = (T245f11(m2, m1, a5, a3));
				}
			}
		}
	}
	return R;
}

/* ET_ACTUAL_PARAMETER_LIST.tuple_conforms_to_types */
T1 T245f11(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T0* t2;
	T0* t3;
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		l2 = (((T245*)(GE_void(a1)))->a3);
		t1 = (T6f13((&l2), ((T245*)(C))->a3));
		if (t1) {
			R = EIF_TRUE;
			l1 = (T6)(GE_int32(1));
			while (1) {
				t1 = (T6f1((&l1), l2));
				if (t1) {
					break;
				}
				t2 = (T245f7(C, l1));
				t3 = (T245f7(GE_void(a1), l1));
				t1 = (T243x7066T0T0T0(GE_void(t2), t3, a2, a3));
				t1 = ((T1)(!(t1)));
				if (t1) {
					R = EIF_FALSE;
					l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				}
			}
		} else {
			R = EIF_FALSE;
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.conforms_from_tuple_type_with_type_marks */
T1 T246f31(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	l1 = (T254f12(a1));
	t1 = (T80f51(GE_void(l1)));
	if (t1) {
		t2 = (T254f9(a1, a2));
		R = (T246f24(C, l1, t2, a3, a4, a5));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		t2 = (T246f6(C));
		t1 = (T80f51(GE_void(t2)));
		t1 = ((T1)(!(t1)));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t2 = (T246f6(C));
			t2 = (T80f67(GE_void(t2)));
			l2 = (T31x3288(GE_void(t2)));
			t2 = (T254f9(a1, a2));
			R = (T246f24(C, l2, t2, a3, a4, a5));
		}
	}
	return R;
}

/* ET_CLASS.conforms_from_tuple_type_with_type_marks */
T1 T80f49(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	l1 = (T254f12(a1));
	t1 = (T80f51(GE_void(l1)));
	if (t1) {
		t2 = (T254f9(a1, a2));
		R = (T80f46(C, l1, t2, a3, a4, a5));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		t2 = (T80f91(C));
		t1 = (T80f51(GE_void(t2)));
		t1 = ((T1)(!(t1)));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t2 = (T80f91(C));
			t2 = (T80f67(GE_void(t2)));
			l2 = (T31x3288(GE_void(t2)));
			t2 = (T254f9(a1, a2));
			R = (T80f46(C, l2, t2, a3, a4, a5));
		}
	}
	return R;
}

/* ET_CLASS_TYPE.conforms_from_tuple_type_with_type_marks */
T1 T78f32(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	l1 = (T254f12(a1));
	t1 = (T80f51(GE_void(l1)));
	if (t1) {
		t2 = (T254f9(a1, a2));
		R = (T78f29(C, l1, t2, a3, a4, a5));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		t2 = (T78f18(C));
		t1 = (T80f51(GE_void(t2)));
		t1 = ((T1)(!(t1)));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t2 = (T78f18(C));
			t2 = (T80f67(GE_void(t2)));
			l2 = (T31x3288(GE_void(t2)));
			t2 = (T254f9(a1, a2));
			R = (T78f29(C, l2, t2, a3, a4, a5));
		}
	}
	return R;
}

/* ET_BIT_FEATURE.same_base_class_type_with_type_marks */
T1 T1214f11(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_N.same_base_class_type_with_type_marks */
T1 T1213f15(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_TUPLE_TYPE.same_base_class_type_with_type_marks */
T1 T254f39(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_base_class_type_with_type_marks */
T1 T246f39(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	T0* t5;
	T0* m1 = 0;
	T0* m2 = 0;
	T1 R = 0;
	t1 = (T246f6(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a4));
		}
		if (t2) {
			t3 = ((a3)==(a5));
			if (!(t3)) {
				t3 = (T246f16(C));
				t2 = ((T1)(!(t3)));
			} else {
				t2 = EIF_TRUE;
			}
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = (T244x7143(GE_void(a5)));
			if (t2) {
				t3 = (T246f28(C, a4, a5));
				t4 = (T78x7034T0T0(a1, a2, a3));
				t2 = (((((t3) != (t4)))));
			}
			if (t2) {
				R = EIF_FALSE;
			} else {
				t1 = (T246f6(C));
				t5 = (T78x7120(a1));
				t2 = ((t1)!=(t5));
				if (t2) {
					R = EIF_FALSE;
				} else {
					t2 = (T246f14(C, a4, a5));
					t3 = (T78x7030T0T0(a1, a2, a3));
					t2 = (((((t2) != (t3)))));
					if (t2) {
						R = EIF_FALSE;
					} else {
						t2 = (T246f32(C, a4, a5));
						t3 = (T78x10943T0T0(a1, a2, a3));
						t2 = (((((t2) != (t3)))));
						if (t2) {
							R = EIF_FALSE;
						} else {
							t1 = (T78x6943(a1));
							t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
							t2 = ((T1)(!(t2)));
							if (t2) {
								t2 = (T246f16(C));
								R = ((T1)(!(t2)));
							} else {
								t2 = (((T246*)(C))->a1?((m2 = ((T246*)(C))->a1, EIF_TRUE)):EIF_FALSE);
								t2 = ((T1)(!(t2)));
								if (t2) {
									R = (((((T0*)(m1))->id==245)?T245f9(m1):T634f14(m1)));
								} else {
									R = (((((T0*)(m2))->id==245)?T245f13(m2, m1, a3, a5):T634f8(m2, m1, a3, a5)));
								}
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_CLASS.same_base_class_type_with_type_marks */
T1 T80f103(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	T0* t5;
	T0* m1 = 0;
	T0* m2 = 0;
	T1 R = 0;
	t1 = (T80f91(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a4));
		}
		if (t2) {
			t3 = ((a3)==(a5));
			if (!(t3)) {
				t3 = (T80f121(C));
				t2 = ((T1)(!(t3)));
			} else {
				t2 = EIF_TRUE;
			}
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = (T244x7143(GE_void(a5)));
			if (t2) {
				t3 = (T80f72(C, a4, a5));
				t4 = (T78x7034T0T0(a1, a2, a3));
				t2 = (((((t3) != (t4)))));
			}
			if (t2) {
				R = EIF_FALSE;
			} else {
				t1 = (T80f91(C));
				t5 = (T78x7120(a1));
				t2 = ((t1)!=(t5));
				if (t2) {
					R = EIF_FALSE;
				} else {
					t2 = (T80f73(C, a4, a5));
					t3 = (T78x7030T0T0(a1, a2, a3));
					t2 = (((((t2) != (t3)))));
					if (t2) {
						R = EIF_FALSE;
					} else {
						t2 = (T80f87(C, a4, a5));
						t3 = (T78x10943T0T0(a1, a2, a3));
						t2 = (((((t2) != (t3)))));
						if (t2) {
							R = EIF_FALSE;
						} else {
							t1 = (T78x6943(a1));
							t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
							t2 = ((T1)(!(t2)));
							if (t2) {
								t2 = (T80f121(C));
								R = ((T1)(!(t2)));
							} else {
								t2 = (((T80*)(C))->a22?((m2 = ((T80*)(C))->a22, EIF_TRUE)):EIF_FALSE);
								t2 = ((T1)(!(t2)));
								if (t2) {
									R = (((((T0*)(m1))->id==245)?T245f9(m1):T634f14(m1)));
								} else {
									R = (T634f8(m2, m1, a3, a5));
								}
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_CLASS_TYPE.same_base_class_type_with_type_marks */
T1 T78f46(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	T0* t5;
	T0* m1 = 0;
	T0* m2 = 0;
	T1 R = 0;
	t1 = (T78f18(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a4));
		}
		if (t2) {
			t3 = ((a3)==(a5));
			if (!(t3)) {
				t3 = (T78f11(C));
				t2 = ((T1)(!(t3)));
			} else {
				t2 = EIF_TRUE;
			}
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = (T244x7143(GE_void(a5)));
			if (t2) {
				t3 = (T78f22(C, a4, a5));
				t4 = (T78x7034T0T0(a1, a2, a3));
				t2 = (((((t3) != (t4)))));
			}
			if (t2) {
				R = EIF_FALSE;
			} else {
				t1 = (T78f18(C));
				t5 = (T78x7120(a1));
				t2 = ((t1)!=(t5));
				if (t2) {
					R = EIF_FALSE;
				} else {
					t2 = (T78f9(C, a4, a5));
					t3 = (T78x7030T0T0(a1, a2, a3));
					t2 = (((((t2) != (t3)))));
					if (t2) {
						R = EIF_FALSE;
					} else {
						t2 = (T78f23(C, a4, a5));
						t3 = (T78x10943T0T0(a1, a2, a3));
						t2 = (((((t2) != (t3)))));
						if (t2) {
							R = EIF_FALSE;
						} else {
							t1 = (T78x6943(a1));
							t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
							t2 = ((T1)(!(t2)));
							if (t2) {
								t2 = (T78f11(C));
								R = ((T1)(!(t2)));
							} else {
								t1 = (T78f14(C));
								t2 = (t1?((m2 = t1, EIF_TRUE)):EIF_FALSE);
								t2 = ((T1)(!(t2)));
								if (t2) {
									R = (((((T0*)(m1))->id==245)?T245f9(m1):T634f14(m1)));
								} else {
									R = ((m2, m1, a3, a5, (T1)0));
								}
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.same_base_tuple_type_with_type_marks */
T1 T1214f12(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_N.same_base_tuple_type_with_type_marks */
T1 T1213f16(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_TUPLE_TYPE.same_base_tuple_type_with_type_marks */
T1 T254f45(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 t1;
	T1 t2;
	T1 t3;
	T0* t4;
	T0* m1 = 0;
	T0* m2 = 0;
	T1 R = 0;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a4));
	}
	if (t1) {
		t2 = ((a3)==(a5));
		if (!(t2)) {
			t2 = (T254f28(C));
			t1 = ((T1)(!(t2)));
		} else {
			t1 = EIF_TRUE;
		}
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = (T244x7143(GE_void(a5)));
		if (t1) {
			t2 = (T254f29(C, a4, a5));
			t3 = (T254f29(a1, a2, a3));
			t1 = (((((t2) != (t3)))));
		}
		if (t1) {
			R = EIF_FALSE;
		} else {
			t1 = (T254f24(C));
			t2 = (T254f24(a1));
			t1 = (((((t1) != (t2)))));
			if (t1) {
				R = EIF_FALSE;
			} else {
				t4 = (((T254*)(a1))->a2);
				t1 = (t4?((m1 = t4, EIF_TRUE)):EIF_FALSE);
				t1 = ((T1)(!(t1)));
				if (t1) {
					t1 = (T254f28(C));
					R = ((T1)(!(t1)));
				} else {
					t1 = (((T254*)(C))->a2?((m2 = ((T254*)(C))->a2, EIF_TRUE)):EIF_FALSE);
					t1 = ((T1)(!(t1)));
					if (t1) {
						R = (T245f9(m1));
					} else {
						R = (T245f13(m2, m1, a3, a5));
					}
				}
			}
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_base_tuple_type_with_type_marks */
T1 T246f47(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS.same_base_tuple_type_with_type_marks */
T1 T80f124(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS_TYPE.same_base_tuple_type_with_type_marks */
T1 T78f49(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_FEATURE.is_type_expanded_with_type_mark */
T1 T1214f16(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* ET_BIT_N.is_type_expanded_with_type_mark */
T1 T1213f20(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* ET_TUPLE_TYPE.is_type_expanded_with_type_mark */
T1 T254f5(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.is_type_expanded_with_type_mark */
T1 T246f14(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = ((a1)==(EIF_VOID));
	if (t1) {
		R = (T246f10(C));
	} else {
		t1 = (T250x12115(GE_void(a1)));
		if (t1) {
			R = EIF_TRUE;
		} else {
			t1 = (T250x12116(GE_void(a1)));
			if (t1) {
				R = EIF_FALSE;
			} else {
				R = (T246f10(C));
			}
		}
	}
	return R;
}

/* ET_CLASS.is_type_expanded_with_type_mark */
T1 T80f73(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = ((a1)==(EIF_VOID));
	if (t1) {
		R = (T80f113(C));
	} else {
		t1 = (T250x12115(GE_void(a1)));
		if (t1) {
			R = EIF_TRUE;
		} else {
			t1 = (T250x12116(GE_void(a1)));
			if (t1) {
				R = EIF_FALSE;
			} else {
				R = (T80f113(C));
			}
		}
	}
	return R;
}

/* ET_CLASS_TYPE.is_type_expanded_with_type_mark */
T1 T78f9(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = ((a1)==(EIF_VOID));
	if (t1) {
		R = (T78f13(C));
	} else {
		t1 = (T250x12115(GE_void(a1)));
		if (t1) {
			R = EIF_TRUE;
		} else {
			t1 = (T250x12116(GE_void(a1)));
			if (t1) {
				R = EIF_FALSE;
			} else {
				R = (T78f13(C));
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.is_type_detachable_with_type_mark */
T1 T1214f18(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = (T1214f64(C, a1, a2));
	R = ((T1)(!(t1)));
	return R;
}

/* ET_BIT_N.is_type_detachable_with_type_mark */
T1 T1213f22(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = (T1213f63(C, a1, a2));
	R = ((T1)(!(t1)));
	return R;
}

/* ET_TUPLE_TYPE.is_type_detachable_with_type_mark */
T1 T254f27(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = (T254f29(C, a1, a2));
	R = ((T1)(!(t1)));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.is_type_detachable_with_type_mark */
T1 T246f46(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = (T246f28(C, a1, a2));
	R = ((T1)(!(t1)));
	return R;
}

/* ET_CLASS.is_type_detachable_with_type_mark */
T1 T80f112(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = (T80f72(C, a1, a2));
	R = ((T1)(!(t1)));
	return R;
}

/* ET_CLASS_TYPE.is_type_detachable_with_type_mark */
T1 T78f48(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = (T78f22(C, a1, a2));
	R = ((T1)(!(t1)));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.upper_name */
T0* T246f96(T0* C)
{
	T0* R = 0;
	R = (T176f7(GE_void(((T246*)(C))->a4)));
	return R;
}

/* ET_CLASS.upper_name */
T0* T80f50(T0* C)
{
	T0* R = 0;
	R = (T176f7(GE_void(((T80*)(C))->a12)));
	return R;
}

/* ET_CLASS_TYPE.upper_name */
T0* T78f96(T0* C)
{
	T0* R = 0;
	R = (T176f7(GE_void(((T78*)(C))->a3)));
	return R;
}

/* ET_BIT_FEATURE.shallow_base_type_with_type_mark */
T0* T1214f94(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T1214f17(C, a1, a2));
	return R;
}

/* ET_BIT_N.shallow_base_type_with_type_mark */
T0* T1213f93(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T1213f21(C, a1, a2));
	return R;
}

/* ET_TUPLE_TYPE.shallow_base_type_with_type_mark */
T0* T254f81(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T254f34(C, a1));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.shallow_base_type_with_type_mark */
T0* T246f84(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T246f33(C, a1));
	return R;
}

/* ET_CLASS.shallow_base_type_with_type_mark */
T0* T80f169(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T80f88(C, a1));
	return R;
}

/* ET_CLASS_TYPE.shallow_base_type_with_type_mark */
T0* T78f82(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T78f35(C, a1));
	return R;
}

/* ET_BIT_FEATURE.shallow_named_type_with_type_mark */
T0* T1214f95(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T1214f94(C, a1, a2));
	return R;
}

/* ET_BIT_N.shallow_named_type_with_type_mark */
T0* T1213f94(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T1213f93(C, a1, a2));
	return R;
}

/* ET_TUPLE_TYPE.shallow_named_type_with_type_mark */
T0* T254f82(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T254f81(C, a1, a2));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.shallow_named_type_with_type_mark */
T0* T246f85(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T246f84(C, a1, a2));
	return R;
}

/* ET_CLASS.shallow_named_type_with_type_mark */
T0* T80f170(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T80f169(C, a1, a2));
	return R;
}

/* ET_CLASS_TYPE.shallow_named_type_with_type_mark */
T0* T78f83(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T78f82(C, a1, a2));
	return R;
}

/* ET_BIT_FEATURE.actual_parameter_count */
T6 T1214f37(T0* C)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	T6 R = 0;
	t1 = (T1214f40(C));
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		R = ((m1, (T6)0));
	}
	return R;
}

/* ET_BIT_N.actual_parameter_count */
T6 T1213f38(T0* C)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	T6 R = 0;
	t1 = (T1213f40(C));
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		R = ((m1, (T6)0));
	}
	return R;
}

/* ET_TUPLE_TYPE.actual_parameter_count */
T6 T254f46(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T6 R = 0;
	t1 = (((T254*)(C))->a2?((m1 = ((T254*)(C))->a2, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = (((T245*)(m1))->a3);
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.actual_parameter_count */
T6 T246f45(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T6 R = 0;
	t1 = (((T246*)(C))->a1?((m1 = ((T246*)(C))->a1, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = (((((T0*)(m1))->id==245)?((T245*)(m1))->a3:((T634*)(m1))->a1));
	}
	return R;
}

/* ET_CLASS.formal_parameter_count */
T6 T80f111(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T6 R = 0;
	t1 = (((T80*)(C))->a22?((m1 = ((T80*)(C))->a22, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = (((T634*)(m1))->a1);
	}
	return R;
}

/* ET_CLASS_TYPE.actual_parameter_count */
T6 T78f47(T0* C)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	T6 R = 0;
	t1 = (T78f14(C));
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		R = ((m1, (T6)0));
	}
	return R;
}

/* ET_BIT_FEATURE.conforms_to_type_with_type_marks */
T1 T1214f36(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 R = 0;
	t1 = (T1214f19(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a3)==(a5));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T243x7068T0T0T0T0T0(GE_void(a1), C, a4, a5, a2, a3));
		}
	}
	return R;
}

/* ET_BIT_N.conforms_to_type_with_type_marks */
T1 T1213f37(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 R = 0;
	t1 = (T1213f23(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a3)==(a5));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T243x7068T0T0T0T0T0(GE_void(a1), C, a4, a5, a2, a3));
		}
	}
	return R;
}

/* ET_TUPLE_TYPE.conforms_to_type_with_type_marks */
T1 T254f30(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a4));
	}
	if (t1) {
		t2 = ((a3)==(a5));
		if (!(t2)) {
			t2 = (T254f28(C));
			t1 = ((T1)(!(t2)));
		} else {
			t1 = EIF_TRUE;
		}
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T243x7071T0T0T0T0T0(GE_void(a1), C, a4, a5, a2, a3));
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.conforms_to_type_with_type_marks */
T1 T246f20(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 R = 0;
	t1 = (T246f6(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a4));
		}
		if (t2) {
			t3 = ((a3)==(a5));
			if (!(t3)) {
				t3 = (T246f16(C));
				t2 = ((T1)(!(t3)));
			} else {
				t2 = EIF_TRUE;
			}
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T243x7069T0T0T0T0T0(GE_void(a1), C, a4, a5, a2, a3));
		}
	}
	return R;
}

/* ET_CLASS.conforms_to_type_with_type_marks */
T1 T80f76(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 R = 0;
	t1 = (T80f91(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a4));
		}
		if (t2) {
			t3 = ((a3)==(a5));
			if (!(t3)) {
				t3 = (T80f121(C));
				t2 = ((T1)(!(t3)));
			} else {
				t2 = EIF_TRUE;
			}
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T243x7069T0T0T0T0T0(GE_void(a1), C, a4, a5, a2, a3));
		}
	}
	return R;
}

/* ET_CLASS_TYPE.conforms_to_type_with_type_marks */
T1 T78f33(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 R = 0;
	t1 = (T78f18(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a4));
		}
		if (t2) {
			t3 = ((a3)==(a5));
			if (!(t3)) {
				t3 = (T78f11(C));
				t2 = ((T1)(!(t3)));
			} else {
				t2 = EIF_TRUE;
			}
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T243x7069T0T0T0T0T0(GE_void(a1), C, a4, a5, a2, a3));
		}
	}
	return R;
}

/* ET_BIT_FEATURE.type_with_type_mark */
T0* T1214f62(T0* C, T0* a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_N.type_with_type_mark */
T0* T1213f61(T0* C, T0* a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_TUPLE_TYPE.type_with_type_mark */
T0* T254f34(T0* C, T0* a1)
{
	T1 t1;
	T0* R = 0;
	T0* l1 = 0;
	l1 = (T254f9(C, a1));
	t1 = ((l1)!=(((T254*)(C))->a3));
	if (t1) {
		R = T254c107(l1, ((T254*)(C))->a2, ((T254*)(C))->a1);
		T254f108(GE_void(R), ((T254*)(C))->a4);
	} else {
		R = C;
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.type_with_type_mark */
T0* T246f33(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T0* R = 0;
	T0* l1 = 0;
	l1 = (T246f22(C, a1));
	t1 = ((l1)!=(((T246*)(C))->a3));
	if (t1) {
		t1 = (((T246*)(C))->a1?((m1 = ((T246*)(C))->a1, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			R = T246c109(l1, ((T246*)(C))->a4, m1, ((T246*)(C))->a2);
		} else {
			R = T78c110(l1, ((T246*)(C))->a4, ((T246*)(C))->a2);
		}
	} else {
		R = C;
	}
	return R;
}

/* ET_CLASS.type_with_type_mark */
T0* T80f88(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T0* R = 0;
	T0* l1 = 0;
	l1 = (T80f74(C, a1));
	t1 = ((l1)!=(((T80*)(C))->a26));
	if (t1) {
		t1 = (((T80*)(C))->a22?((m1 = ((T80*)(C))->a22, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			R = T246c109(l1, ((T80*)(C))->a12, m1, ((T80*)(C))->a19);
		} else {
			R = T78c110(l1, ((T80*)(C))->a12, ((T80*)(C))->a19);
		}
	} else {
		R = C;
	}
	return R;
}

/* ET_CLASS_TYPE.type_with_type_mark */
T0* T78f35(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* m1 = 0;
	T0* R = 0;
	T0* l1 = 0;
	l1 = (T78f17(C, a1));
	t1 = ((l1)!=(((T78*)(C))->a2));
	if (t1) {
		t2 = (T78f14(C));
		t1 = (t2?((m1 = t2, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			R = T246c109(l1, ((T78*)(C))->a3, m1, ((T78*)(C))->a1);
		} else {
			R = T78c110(l1, ((T78*)(C))->a3, ((T78*)(C))->a1);
		}
	} else {
		R = C;
	}
	return R;
}

/* ET_BIT_FEATURE.to_text */
T0* T1214f41(T0* C)
{
	T0* R = 0;
	R = T17c44((T6)(GE_int32(15)));
	T1214f114(C, R);
	return R;
}

/* ET_BIT_N.to_text */
T0* T1213f12(T0* C)
{
	T0* R = 0;
	R = T17c44((T6)(GE_int32(15)));
	T1213f113(C, R);
	return R;
}

/* ET_TUPLE_TYPE.to_text */
T0* T254f35(T0* C)
{
	T0* R = 0;
	R = T17c44((T6)(GE_int32(15)));
	T254f110(C, R);
	return R;
}

/* ET_GENERIC_CLASS_TYPE.to_text */
T0* T246f34(T0* C)
{
	T0* R = 0;
	R = T17c44((T6)(GE_int32(15)));
	T246f111(C, R);
	return R;
}

/* ET_CLASS.to_text */
T0* T80f98(T0* C)
{
	T0* R = 0;
	R = T17c44((T6)(GE_int32(15)));
	T80f227(C, R);
	return R;
}

/* ET_CLASS_TYPE.to_text */
T0* T78f36(T0* C)
{
	T0* R = 0;
	R = T17c44((T6)(GE_int32(15)));
	T78f112(C, R);
	return R;
}

/* ET_BIT_FEATURE.conforms_from_bit_type_with_type_marks */
T1 T1214f24(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T1 R = 0;
	t1 = (T1214f19(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a3)==(a5));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			T1214f112(C);
			t2 = (T1214f20(C));
			t2 = ((T1)(!(t2)));
			if (t2) {
				if (((T0*)(a1))->id==1213) {
					T1213f110(a1);
				} else {
					T1214f112(a1);
				}
				t2 = (((((T0*)(a1))->id==1213)?T1213f8(a1):T1214f20(a1)));
				t2 = ((T1)(!(t2)));
				if (t2) {
					t3 = (((((T0*)(a1))->id==1213)?((T1213*)(a1))->a2:((T1214*)(a1))->a1));
					R = (T6f13(&t3, ((T1214*)(C))->a1));
				}
			}
		}
	}
	return R;
}

/* ET_BIT_N.conforms_from_bit_type_with_type_marks */
T1 T1213f26(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T1 R = 0;
	t1 = (T1213f23(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a3)==(a5));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			T1213f110(C);
			t2 = (T1213f8(C));
			t2 = ((T1)(!(t2)));
			if (t2) {
				if (((T0*)(a1))->id==1213) {
					T1213f110(a1);
				} else {
					T1214f112(a1);
				}
				t2 = (((((T0*)(a1))->id==1213)?T1213f8(a1):T1214f20(a1)));
				t2 = ((T1)(!(t2)));
				if (t2) {
					t3 = (((((T0*)(a1))->id==1213)?((T1213*)(a1))->a2:((T1214*)(a1))->a1));
					R = (T6f13(&t3, ((T1213*)(C))->a2));
				}
			}
		}
	}
	return R;
}

/* ET_TUPLE_TYPE.conforms_from_bit_type_with_type_marks */
T1 T254f64(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	l1 = (((((T0*)(a1))->id==1213)?T1213f23(a1):T1214f19(a1)));
	t1 = (T80f51(GE_void(l1)));
	if (t1) {
		t2 = (T254f26(C));
		t2 = (T79f25(GE_void(t2)));
		R = (T254f18(C, l1, t2, a3, a4, a5));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		t2 = (T254f12(C));
		t1 = (T80f51(GE_void(t2)));
		t1 = ((T1)(!(t1)));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t2 = (T254f12(C));
			t2 = (T80f67(GE_void(t2)));
			l2 = (T31x3288(GE_void(t2)));
			t2 = (T254f26(C));
			t2 = (T79f25(GE_void(t2)));
			R = (T254f18(C, l2, t2, a3, a4, a5));
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.conforms_from_bit_type_with_type_marks */
T1 T246f66(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	l1 = (((((T0*)(a1))->id==1213)?T1213f23(a1):T1214f19(a1)));
	t1 = (T80f51(GE_void(l1)));
	if (t1) {
		t2 = (T246f26(C));
		t2 = (T79f25(GE_void(t2)));
		R = (T246f24(C, l1, t2, a3, a4, a5));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		t2 = (T246f6(C));
		t1 = (T80f51(GE_void(t2)));
		t1 = ((T1)(!(t1)));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t2 = (T246f6(C));
			t2 = (T80f67(GE_void(t2)));
			l2 = (T31x3288(GE_void(t2)));
			t2 = (T246f26(C));
			t2 = (T79f25(GE_void(t2)));
			R = (T246f24(C, l2, t2, a3, a4, a5));
		}
	}
	return R;
}

/* ET_CLASS.conforms_from_bit_type_with_type_marks */
T1 T80f152(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	l1 = (((((T0*)(a1))->id==1213)?T1213f23(a1):T1214f19(a1)));
	t1 = (T80f51(GE_void(l1)));
	if (t1) {
		t2 = (T80f71(C));
		t2 = (T79f25(GE_void(t2)));
		R = (T80f46(C, l1, t2, a3, a4, a5));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		t2 = (T80f91(C));
		t1 = (T80f51(GE_void(t2)));
		t1 = ((T1)(!(t1)));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t2 = (T80f91(C));
			t2 = (T80f67(GE_void(t2)));
			l2 = (T31x3288(GE_void(t2)));
			t2 = (T80f71(C));
			t2 = (T79f25(GE_void(t2)));
			R = (T80f46(C, l2, t2, a3, a4, a5));
		}
	}
	return R;
}

/* ET_CLASS_TYPE.conforms_from_bit_type_with_type_marks */
T1 T78f66(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	l1 = (((((T0*)(a1))->id==1213)?T1213f23(a1):T1214f19(a1)));
	t1 = (T80f51(GE_void(l1)));
	if (t1) {
		t2 = (T78f26(C));
		t2 = (T79f25(GE_void(t2)));
		R = (T78f29(C, l1, t2, a3, a4, a5));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		t2 = (T78f18(C));
		t1 = (T80f51(GE_void(t2)));
		t1 = ((T1)(!(t1)));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t2 = (T78f18(C));
			t2 = (T80f67(GE_void(t2)));
			l2 = (T31x3288(GE_void(t2)));
			t2 = (T78f26(C));
			t2 = (T79f25(GE_void(t2)));
			R = (T78f29(C, l2, t2, a3, a4, a5));
		}
	}
	return R;
}

/* ET_BIT_FEATURE.same_named_bit_type_with_type_marks */
T1 T1214f33(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	R = (T1214f66(C, a1, a2, a3, a4, a5));
	return R;
}

/* ET_BIT_N.same_named_bit_type_with_type_marks */
T1 T1213f36(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	R = (T1213f64(C, a1, a2, a3, a4, a5));
	return R;
}

/* ET_TUPLE_TYPE.same_named_bit_type_with_type_marks */
T1 T254f65(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_named_bit_type_with_type_marks */
T1 T246f67(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS.same_named_bit_type_with_type_marks */
T1 T80f153(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS_TYPE.same_named_bit_type_with_type_marks */
T1 T78f67(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_FEATURE.same_base_bit_type_with_type_marks */
T1 T1214f29(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	R = (T1214f66(C, a1, a2, a3, a4, a5));
	return R;
}

/* ET_BIT_N.same_base_bit_type_with_type_marks */
T1 T1213f66(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	R = (T1213f64(C, a1, a2, a3, a4, a5));
	return R;
}

/* ET_TUPLE_TYPE.same_base_bit_type_with_type_marks */
T1 T254f66(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_base_bit_type_with_type_marks */
T1 T246f68(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS.same_base_bit_type_with_type_marks */
T1 T80f154(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS_TYPE.same_base_bit_type_with_type_marks */
T1 T78f68(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_FEATURE.same_named_formal_parameter_type_with_type_marks */
T1 T1214f74(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_N.same_named_formal_parameter_type_with_type_marks */
T1 T1213f73(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_TUPLE_TYPE.same_named_formal_parameter_type_with_type_marks */
T1 T254f71(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_named_formal_parameter_type_with_type_marks */
T1 T246f73(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS.same_named_formal_parameter_type_with_type_marks */
T1 T80f160(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS_TYPE.same_named_formal_parameter_type_with_type_marks */
T1 T78f73(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_FEATURE.conforms_from_formal_parameter_type_with_type_marks */
T1 T1214f75(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	T6 t3;
	T0* m2 = 0;
	T1 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	l1 = (T1417x32055(GE_void(a1)));
	l4 = (T244x7120(GE_void(a3)));
	t1 = (((T80*)(GE_void(l4)))->a22);
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t3 = (((T634*)(m1))->a1);
		t2 = (T6f13((&l1), t3));
	}
	if (t2) {
		l2 = (T634f6(m1, l1));
		t1 = (((((T0*)(GE_void(l2)))->id==1081)?T1081f6(l2):((T1209*)(l2))->a2));
		t2 = ((t1)==(EIF_VOID));
		if (t2) {
			t2 = (T80f51(GE_void(l4)));
			t2 = ((T1)(!(t2)));
			if (t2) {
				R = EIF_FALSE;
			} else {
				t1 = (T80f67(GE_void(l4)));
				l3 = (T31x3289(GE_void(t1)));
				t1 = (T1417x7007T0(GE_void(a1), a2));
				R = (T1214f9(C, l3, t1, a3, a4, a5));
			}
		} else {
			t1 = (((((T0*)(GE_void(l2)))->id==1081)?T1081f9(l2):((T1209*)(l2))->a8));
			t2 = (t1?((m2 = t1, EIF_TRUE)):EIF_FALSE);
			if (t2) {
				t1 = (T1417x7007T0(GE_void(a1), a2));
				R = (T71x7067T0T0T0T0T0(m2, C, a4, a5, t1, a3));
			} else {
				R = EIF_FALSE;
			}
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_BIT_N.conforms_from_formal_parameter_type_with_type_marks */
T1 T1213f74(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	T6 t3;
	T0* m2 = 0;
	T1 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	l1 = (T1417x32055(GE_void(a1)));
	l4 = (T244x7120(GE_void(a3)));
	t1 = (((T80*)(GE_void(l4)))->a22);
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t3 = (((T634*)(m1))->a1);
		t2 = (T6f13((&l1), t3));
	}
	if (t2) {
		l2 = (T634f6(m1, l1));
		t1 = (((((T0*)(GE_void(l2)))->id==1081)?T1081f6(l2):((T1209*)(l2))->a2));
		t2 = ((t1)==(EIF_VOID));
		if (t2) {
			t2 = (T80f51(GE_void(l4)));
			t2 = ((T1)(!(t2)));
			if (t2) {
				R = EIF_FALSE;
			} else {
				t1 = (T80f67(GE_void(l4)));
				l3 = (T31x3289(GE_void(t1)));
				t1 = (T1417x7007T0(GE_void(a1), a2));
				R = (T1213f13(C, l3, t1, a3, a4, a5));
			}
		} else {
			t1 = (((((T0*)(GE_void(l2)))->id==1081)?T1081f9(l2):((T1209*)(l2))->a8));
			t2 = (t1?((m2 = t1, EIF_TRUE)):EIF_FALSE);
			if (t2) {
				t1 = (T1417x7007T0(GE_void(a1), a2));
				R = (T71x7067T0T0T0T0T0(m2, C, a4, a5, t1, a3));
			} else {
				R = EIF_FALSE;
			}
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.conforms_from_formal_parameter_type_with_type_marks */
T1 T254f72(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	T6 t3;
	T0* m2 = 0;
	T1 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	l1 = (T1417x32055(GE_void(a1)));
	l4 = (T244x7120(GE_void(a3)));
	t1 = (((T80*)(GE_void(l4)))->a22);
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t3 = (((T634*)(m1))->a1);
		t2 = (T6f13((&l1), t3));
	}
	if (t2) {
		l2 = (T634f6(m1, l1));
		t1 = (((((T0*)(GE_void(l2)))->id==1081)?T1081f6(l2):((T1209*)(l2))->a2));
		t2 = ((t1)==(EIF_VOID));
		if (t2) {
			t2 = (T80f51(GE_void(l4)));
			t2 = ((T1)(!(t2)));
			if (t2) {
				R = EIF_FALSE;
			} else {
				t1 = (T80f67(GE_void(l4)));
				l3 = (T31x3289(GE_void(t1)));
				t1 = (T1417x7007T0(GE_void(a1), a2));
				R = (T254f18(C, l3, t1, a3, a4, a5));
			}
		} else {
			t1 = (((((T0*)(GE_void(l2)))->id==1081)?T1081f9(l2):((T1209*)(l2))->a8));
			t2 = (t1?((m2 = t1, EIF_TRUE)):EIF_FALSE);
			if (t2) {
				t1 = (T1417x7007T0(GE_void(a1), a2));
				R = (T71x7067T0T0T0T0T0(m2, C, a4, a5, t1, a3));
			} else {
				R = EIF_FALSE;
			}
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.conforms_from_formal_parameter_type_with_type_marks */
T1 T246f74(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	T6 t3;
	T0* m2 = 0;
	T1 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	l1 = (T1417x32055(GE_void(a1)));
	l4 = (T244x7120(GE_void(a3)));
	t1 = (((T80*)(GE_void(l4)))->a22);
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t3 = (((T634*)(m1))->a1);
		t2 = (T6f13((&l1), t3));
	}
	if (t2) {
		l2 = (T634f6(m1, l1));
		t1 = (((((T0*)(GE_void(l2)))->id==1081)?T1081f6(l2):((T1209*)(l2))->a2));
		t2 = ((t1)==(EIF_VOID));
		if (t2) {
			t2 = (T80f51(GE_void(l4)));
			t2 = ((T1)(!(t2)));
			if (t2) {
				R = EIF_FALSE;
			} else {
				t1 = (T80f67(GE_void(l4)));
				l3 = (T31x3289(GE_void(t1)));
				t1 = (T1417x7007T0(GE_void(a1), a2));
				R = (T246f24(C, l3, t1, a3, a4, a5));
			}
		} else {
			t1 = (((((T0*)(GE_void(l2)))->id==1081)?T1081f9(l2):((T1209*)(l2))->a8));
			t2 = (t1?((m2 = t1, EIF_TRUE)):EIF_FALSE);
			if (t2) {
				t1 = (T1417x7007T0(GE_void(a1), a2));
				R = (T71x7067T0T0T0T0T0(m2, C, a4, a5, t1, a3));
			} else {
				R = EIF_FALSE;
			}
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_CLASS.conforms_from_formal_parameter_type_with_type_marks */
T1 T80f161(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	T6 t3;
	T0* m2 = 0;
	T1 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	l1 = (T1417x32055(GE_void(a1)));
	l4 = (T244x7120(GE_void(a3)));
	t1 = (((T80*)(GE_void(l4)))->a22);
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t3 = (((T634*)(m1))->a1);
		t2 = (T6f13((&l1), t3));
	}
	if (t2) {
		l2 = (T634f6(m1, l1));
		t1 = (((((T0*)(GE_void(l2)))->id==1081)?T1081f6(l2):((T1209*)(l2))->a2));
		t2 = ((t1)==(EIF_VOID));
		if (t2) {
			t2 = (T80f51(GE_void(l4)));
			t2 = ((T1)(!(t2)));
			if (t2) {
				R = EIF_FALSE;
			} else {
				t1 = (T80f67(GE_void(l4)));
				l3 = (T31x3289(GE_void(t1)));
				t1 = (T1417x7007T0(GE_void(a1), a2));
				R = (T80f46(C, l3, t1, a3, a4, a5));
			}
		} else {
			t1 = (((((T0*)(GE_void(l2)))->id==1081)?T1081f9(l2):((T1209*)(l2))->a8));
			t2 = (t1?((m2 = t1, EIF_TRUE)):EIF_FALSE);
			if (t2) {
				t1 = (T1417x7007T0(GE_void(a1), a2));
				R = (T71x7067T0T0T0T0T0(m2, C, a4, a5, t1, a3));
			} else {
				R = EIF_FALSE;
			}
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_CLASS_TYPE.conforms_from_formal_parameter_type_with_type_marks */
T1 T78f74(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	T6 t3;
	T0* m2 = 0;
	T1 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	l1 = (T1417x32055(GE_void(a1)));
	l4 = (T244x7120(GE_void(a3)));
	t1 = (((T80*)(GE_void(l4)))->a22);
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t3 = (((T634*)(m1))->a1);
		t2 = (T6f13((&l1), t3));
	}
	if (t2) {
		l2 = (T634f6(m1, l1));
		t1 = (((((T0*)(GE_void(l2)))->id==1081)?T1081f6(l2):((T1209*)(l2))->a2));
		t2 = ((t1)==(EIF_VOID));
		if (t2) {
			t2 = (T80f51(GE_void(l4)));
			t2 = ((T1)(!(t2)));
			if (t2) {
				R = EIF_FALSE;
			} else {
				t1 = (T80f67(GE_void(l4)));
				l3 = (T31x3289(GE_void(t1)));
				t1 = (T1417x7007T0(GE_void(a1), a2));
				R = (T78f29(C, l3, t1, a3, a4, a5));
			}
		} else {
			t1 = (((((T0*)(GE_void(l2)))->id==1081)?T1081f9(l2):((T1209*)(l2))->a8));
			t2 = (t1?((m2 = t1, EIF_TRUE)):EIF_FALSE);
			if (t2) {
				t1 = (T1417x7007T0(GE_void(a1), a2));
				R = (T71x7067T0T0T0T0T0(m2, C, a4, a5, t1, a3));
			} else {
				R = EIF_FALSE;
			}
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_BIT_FEATURE.is_type_reference_with_type_mark */
T1 T1214f76(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = (T1214f16(C, a1, a2));
	R = ((T1)(!(t1)));
	return R;
}

/* ET_BIT_N.is_type_reference_with_type_mark */
T1 T1213f75(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = (T1213f20(C, a1, a2));
	R = ((T1)(!(t1)));
	return R;
}

/* ET_TUPLE_TYPE.is_type_reference_with_type_mark */
T1 T254f73(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = (T254f5(C, a1, a2));
	R = ((T1)(!(t1)));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.is_type_reference_with_type_mark */
T1 T246f75(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = (T246f14(C, a1, a2));
	R = ((T1)(!(t1)));
	return R;
}

/* ET_CLASS.is_type_reference_with_type_mark */
T1 T80f162(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = (T80f73(C, a1, a2));
	R = ((T1)(!(t1)));
	return R;
}

/* ET_CLASS_TYPE.is_type_reference_with_type_mark */
T1 T78f75(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = (T78f9(C, a1, a2));
	R = ((T1)(!(t1)));
	return R;
}

/* ET_BIT_FEATURE.is_type_attached_with_type_mark */
T1 T1214f64(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* ET_BIT_N.is_type_attached_with_type_mark */
T1 T1213f63(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* ET_TUPLE_TYPE.is_type_attached_with_type_mark */
T1 T254f29(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = ((a1)==(EIF_VOID));
	if (t1) {
		R = (T254f25(C));
	} else {
		t1 = (T250x12120(GE_void(a1)));
		if (t1) {
			R = EIF_TRUE;
		} else {
			t1 = (T250x12121(GE_void(a1)));
			if (t1) {
				R = EIF_FALSE;
			} else {
				R = (T254f25(C));
			}
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.is_type_attached_with_type_mark */
T1 T246f28(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T1 R = 0;
	t1 = (T246f6(C));
	t2 = (T80f116(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(EIF_VOID));
		if (t2) {
			R = (T246f25(C));
		} else {
			t2 = (T250x12120(GE_void(a1)));
			if (t2) {
				R = EIF_TRUE;
			} else {
				t2 = (T250x12121(GE_void(a1)));
				if (t2) {
					R = (T246f10(C));
				} else {
					R = (T246f25(C));
				}
			}
		}
	}
	return R;
}

/* ET_CLASS.is_type_attached_with_type_mark */
T1 T80f72(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T1 R = 0;
	t1 = (T80f91(C));
	t2 = (T80f116(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(EIF_VOID));
		if (t2) {
			R = (T80f85(C));
		} else {
			t2 = (T250x12120(GE_void(a1)));
			if (t2) {
				R = EIF_TRUE;
			} else {
				t2 = (T250x12121(GE_void(a1)));
				if (t2) {
					R = (T80f113(C));
				} else {
					R = (T80f85(C));
				}
			}
		}
	}
	return R;
}

/* ET_CLASS_TYPE.is_type_attached_with_type_mark */
T1 T78f22(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T1 R = 0;
	t1 = (T78f18(C));
	t2 = (T80f116(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(EIF_VOID));
		if (t2) {
			R = (T78f25(C));
		} else {
			t2 = (T250x12120(GE_void(a1)));
			if (t2) {
				R = EIF_TRUE;
			} else {
				t2 = (T250x12121(GE_void(a1)));
				if (t2) {
					R = (T78f13(C));
				} else {
					R = (T78f25(C));
				}
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.index_of_label */
T6 T1214f103(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	T6 R = 0;
	t1 = (T1214f40(C));
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		R = ((m1, a1, (T6)0));
	}
	return R;
}

/* ET_BIT_N.index_of_label */
T6 T1213f102(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	T6 R = 0;
	t1 = (T1213f40(C));
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		R = ((m1, a1, (T6)0));
	}
	return R;
}

/* ET_TUPLE_TYPE.index_of_label */
T6 T254f102(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T6 R = 0;
	t1 = (((T254*)(C))->a2?((m1 = ((T254*)(C))->a2, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = (T245f22(m1, a1));
	}
	return R;
}

/* ET_ACTUAL_PARAMETER_LIST.index_of_label */
T6 T245f22(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* m1 = 0;
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	l2 = ((T6)((((T245*)(C))->a3)-((T6)(GE_int32(1)))));
	l1 = (T6)(GE_int32(0));
	while (1) {
		t1 = (T6f1((&l1), l2));
		if (t1) {
			break;
		}
		t2 = (((T640*)(GE_void(((T245*)(C))->a4)))->z2[l1]);
		t2 = (T248x7104(GE_void(t2)));
		t1 = (t2?((m1 = t2, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t1 = (T176f23(GE_void(a1), m1));
		}
		if (t1) {
			R = ((T6)((((T245*)(C))->a3)-(l1)));
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.index_of_label */
T6 T246f104(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T6 R = 0;
	t1 = (((T246*)(C))->a1?((m1 = ((T246*)(C))->a1, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = (((((T0*)(m1))->id==245)?T245f22(m1, a1):T634f22(m1, a1)));
	}
	return R;
}

/* ET_FORMAL_PARAMETER_LIST.index_of_label */
T6 T634f22(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T0* m1 = 0;
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	l2 = ((T6)((((T634*)(C))->a1)-((T6)(GE_int32(1)))));
	l1 = (T6)(GE_int32(0));
	while (1) {
		t1 = (T6f1((&l1), l2));
		if (t1) {
			break;
		}
		t2 = (((T1085*)(GE_void(((T634*)(C))->a2)))->z2[l1]);
		t2 = (((((T0*)(GE_void(t2)))->id==1081)?T1081f77(t2):T1209f78(t2)));
		t1 = (t2?((m1 = t2, EIF_TRUE)):EIF_FALSE);
		if (t1) {
			t1 = (T176f23(GE_void(a1), m1));
		}
		if (t1) {
			R = ((T6)((((T634*)(C))->a1)-(l1)));
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* ET_CLASS.index_of_label */
T6 T80f198(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T6 R = 0;
	t1 = (((T80*)(C))->a22?((m1 = ((T80*)(C))->a22, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = (T634f22(m1, a1));
	}
	return R;
}

/* ET_CLASS_TYPE.index_of_label */
T6 T78f104(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	T6 R = 0;
	t1 = (T78f14(C));
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		R = ((m1, a1, (T6)0));
	}
	return R;
}

/* ET_BIT_FEATURE.base_type_actual */
T0* T1214f85(T0* C, T6 a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	T1 t3;
	T0* m2 = 0;
	T0* R = 0;
	T0* l1 = 0;
	{
		t1 = (T1214f40(C));
		t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
		if (!(t2)) {
			GE_raise(GE_EX_CHECK);
		}		l1 = ((m1, a1, (T0*)0));
		t2 = ((a2)==(C));
		if (!(t2)) {
			t3 = (((((T0*)(GE_void(a2)))->id==371)?T371f18(a2):T1214f47(a2)));
			if (t3) {
				t1 = (((((T0*)(GE_void(a2)))->id==371)?((T371*)(a2))->a1:T1214f48(a2)));
				t2 = ((t1)==(C));
			} else {
				t2 = EIF_FALSE;
			}
		}
		if (t2) {
			t2 = (l1?((m2 = l1, EIF_TRUE)):EIF_FALSE);
		}
		if (t2) {
			R = m2;
		} else {
			R = ((GE_void(l1), a2, (T0*)0));
		}
	}
	return R;
}

/* ET_BIT_N.base_type_actual */
T0* T1213f84(T0* C, T6 a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	T1 t3;
	T0* m2 = 0;
	T0* R = 0;
	T0* l1 = 0;
	{
		t1 = (T1213f40(C));
		t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
		if (!(t2)) {
			GE_raise(GE_EX_CHECK);
		}		l1 = ((m1, a1, (T0*)0));
		t2 = ((a2)==(C));
		if (!(t2)) {
			t3 = (((((T0*)(GE_void(a2)))->id==371)?T371f18(a2):T1213f46(a2)));
			if (t3) {
				t1 = (((((T0*)(GE_void(a2)))->id==371)?((T371*)(a2))->a1:T1213f47(a2)));
				t2 = ((t1)==(C));
			} else {
				t2 = EIF_FALSE;
			}
		}
		if (t2) {
			t2 = (l1?((m2 = l1, EIF_TRUE)):EIF_FALSE);
		}
		if (t2) {
			R = m2;
		} else {
			R = ((GE_void(l1), a2, (T0*)0));
		}
	}
	return R;
}

/* ET_TUPLE_TYPE.base_type_actual */
T0* T254f80(T0* C, T6 a1, T0* a2)
{
	T1 t1;
	T0* m1 = 0;
	T1 t2;
	T0* t3;
	T0* m2 = 0;
	T0* R = 0;
	T0* l1 = 0;
	{
		t1 = (((T254*)(C))->a2?((m1 = ((T254*)(C))->a2, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		l1 = (T245f7(m1, a1));
		t1 = ((a2)==(C));
		if (!(t1)) {
			t2 = (((((T0*)(GE_void(a2)))->id==254)?T254f15(a2):T371f18(a2)));
			if (t2) {
				t3 = (((((T0*)(GE_void(a2)))->id==254)?T254f16(a2):((T371*)(a2))->a1));
				t1 = ((t3)==(C));
			} else {
				t1 = EIF_FALSE;
			}
		}
		if (t1) {
			t1 = T254f80ot1(l1, &m2);
		}
		if (t1) {
			R = m2;
		} else {
			R = (T243x7017T0(GE_void(l1), a2));
		}
	}
	return R;
}

T1 T254f80ot1(T0* a1, T0** a2)
{
	if ((a1)==EIF_VOID) {
		return EIF_FALSE;
	} else {
		switch (((T0*)(a1))->id) {
		case 495:
		case 858:
		case 1238:
		case 1239:
		case 1240:
			return EIF_FALSE;
		default:
			*a2 = a1;
			return EIF_TRUE;
		}
	}
}

/* ET_GENERIC_CLASS_TYPE.base_type_actual */
T0* T246f83(T0* C, T6 a1, T0* a2)
{
	T1 t1;
	T0* m1 = 0;
	T1 t2;
	T0* t3;
	T0* m2 = 0;
	T0* R = 0;
	T0* l1 = 0;
	{
		t1 = (((T246*)(C))->a1?((m1 = ((T246*)(C))->a1, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		l1 = (((((T0*)(m1))->id==245)?T245f7(m1, a1):T634f12(m1, a1)));
		t1 = ((a2)==(C));
		if (!(t1)) {
			t2 = (((((T0*)(GE_void(a2)))->id==246)?T246f8(a2):T371f18(a2)));
			if (t2) {
				t3 = (((((T0*)(GE_void(a2)))->id==246)?T246f9(a2):((T371*)(a2))->a1));
				t1 = ((t3)==(C));
			} else {
				t1 = EIF_FALSE;
			}
		}
		if (t1) {
			t1 = T246f83ot1(l1, &m2);
		}
		if (t1) {
			R = m2;
		} else {
			R = (T243x7017T0(GE_void(l1), a2));
		}
	}
	return R;
}

T1 T246f83ot1(T0* a1, T0** a2)
{
	if ((a1)==EIF_VOID) {
		return EIF_FALSE;
	} else {
		switch (((T0*)(a1))->id) {
		case 495:
		case 858:
		case 1238:
		case 1239:
		case 1240:
			return EIF_FALSE;
		default:
			*a2 = a1;
			return EIF_TRUE;
		}
	}
}

/* ET_CLASS.base_type_actual */
T0* T80f168(T0* C, T6 a1, T0* a2)
{
	T1 t1;
	T0* m1 = 0;
	T1 t2;
	T0* t3;
	T0* m2 = 0;
	T0* R = 0;
	T0* l1 = 0;
	{
		t1 = (((T80*)(C))->a22?((m1 = ((T80*)(C))->a22, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		l1 = (T634f12(m1, a1));
		t1 = ((a2)==(C));
		if (!(t1)) {
			t2 = (((((T0*)(GE_void(a2)))->id==80)?T80f95(a2):T371f18(a2)));
			if (t2) {
				t3 = (((((T0*)(GE_void(a2)))->id==80)?T80f89(a2):((T371*)(a2))->a1));
				t1 = ((t3)==(C));
			} else {
				t1 = EIF_FALSE;
			}
		}
		if (t1) {
			t1 = (l1?((m2 = l1, EIF_TRUE)):EIF_FALSE);
		}
		if (t1) {
			R = m2;
		} else {
			R = (((((T0*)(GE_void(l1)))->id==1081)?T1081f47(l1, a2):T1209f54(l1, a2)));
		}
	}
	return R;
}

/* ET_CLASS_TYPE.base_type_actual */
T0* T78f81(T0* C, T6 a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	T1 t3;
	T0* m2 = 0;
	T0* R = 0;
	T0* l1 = 0;
	{
		t1 = (T78f14(C));
		t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
		if (!(t2)) {
			GE_raise(GE_EX_CHECK);
		}		l1 = ((m1, a1, (T0*)0));
		t2 = ((a2)==(C));
		if (!(t2)) {
			t3 = (((((T0*)(GE_void(a2)))->id==78)?T78f15(a2):T371f18(a2)));
			if (t3) {
				t1 = (((((T0*)(GE_void(a2)))->id==78)?T78f16(a2):((T371*)(a2))->a1));
				t2 = ((t1)==(C));
			} else {
				t2 = EIF_FALSE;
			}
		}
		if (t2) {
			t2 = (l1?((m2 = l1, EIF_TRUE)):EIF_FALSE);
		}
		if (t2) {
			R = m2;
		} else {
			R = ((GE_void(l1), a2, (T0*)0));
		}
	}
	return R;
}

/* ET_BIT_FEATURE.actual_parameters */
T0* T1214f40(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_BIT_N.actual_parameters */
T0* T1213f40(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_CLASS_TYPE.actual_parameters */
T0* T78f14(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_BIT_FEATURE.base_type_index_of_label */
T6 T1214f104(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T1214f103(C, a1));
	return R;
}

/* ET_BIT_N.base_type_index_of_label */
T6 T1213f103(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T1213f102(C, a1));
	return R;
}

/* ET_TUPLE_TYPE.base_type_index_of_label */
T6 T254f103(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T254f102(C, a1));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.base_type_index_of_label */
T6 T246f105(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T246f104(C, a1));
	return R;
}

/* ET_CLASS.base_type_index_of_label */
T6 T80f199(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T80f198(C, a1));
	return R;
}

/* ET_CLASS_TYPE.base_type_index_of_label */
T6 T78f105(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T78f104(C, a1));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.is_generic */
T1 T246f16(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	t1 = (((T246*)(C))->a1?((m1 = ((T246*)(C))->a1, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t1 = (((((T0*)(m1))->id==245)?T245f9(m1):T634f14(m1)));
		R = ((T1)(!(t1)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_CLASS.is_generic */
T1 T80f121(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	t1 = (((T80*)(C))->a22?((m1 = ((T80*)(C))->a22, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t1 = (T634f14(m1));
		R = ((T1)(!(t1)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_CLASS_TYPE.is_generic */
T1 T78f11(T0* C)
{
	T0* t1;
	T1 t2;
	T0* m1 = 0;
	T1 R = 0;
	t1 = (T78f14(C));
	t2 = (t1?((m1 = t1, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = ((m1, (T1)0));
		R = ((T1)(!(t2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_BIT_FEATURE.base_class */
T0* T1214f19(T0* C)
{
	T0* R = 0;
	R = (T80f93(GE_void(((T1214*)(C))->a2)));
	return R;
}

/* ET_BIT_N.base_class */
T0* T1213f23(T0* C)
{
	T0* R = 0;
	R = (T80f93(GE_void(((T1213*)(C))->a3)));
	return R;
}

/* ET_TUPLE_TYPE.base_class */
T0* T254f12(T0* C)
{
	T0* R = 0;
	R = (((((T0*)(GE_void(((T254*)(C))->a1)))->id==462)?T462f21(((T254*)(C))->a1):T80f93(((T254*)(C))->a1)));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.base_class */
T0* T246f6(T0* C)
{
	T0* R = 0;
	R = (((((T0*)(GE_void(((T246*)(C))->a2)))->id==462)?T462f21(((T246*)(C))->a2):T80f93(((T246*)(C))->a2)));
	return R;
}

/* ET_CLASS.base_class */
T0* T80f91(T0* C)
{
	T0* R = 0;
	R = (T80f93(GE_void(((T80*)(C))->a19)));
	return R;
}

/* ET_CLASS_TYPE.base_class */
T0* T78f18(T0* C)
{
	T0* R = 0;
	R = (((((T0*)(GE_void(((T78*)(C))->a1)))->id==462)?T462f21(((T78*)(C))->a1):T80f93(((T78*)(C))->a1)));
	return R;
}

/* ET_BIT_FEATURE.same_base_type_with_type_marks */
T1 T1214f67(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 R = 0;
	t1 = (T1214f19(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a3)==(a5));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T243x7062T0T0T0T0T0(GE_void(a1), C, a4, a5, a2, a3));
		}
	}
	return R;
}

/* ET_BIT_N.same_base_type_with_type_marks */
T1 T1213f65(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 R = 0;
	t1 = (T1213f23(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a3)==(a5));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T243x7062T0T0T0T0T0(GE_void(a1), C, a4, a5, a2, a3));
		}
	}
	return R;
}

/* ET_TUPLE_TYPE.same_base_type_with_type_marks */
T1 T254f40(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a4));
	}
	if (t1) {
		t2 = ((a3)==(a5));
		if (!(t2)) {
			t2 = (T254f28(C));
			t1 = ((T1)(!(t2)));
		} else {
			t1 = EIF_TRUE;
		}
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T243x7065T0T0T0T0T0(GE_void(a1), C, a4, a5, a2, a3));
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_base_type_with_type_marks */
T1 T246f40(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 R = 0;
	t1 = (T246f6(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a4));
		}
		if (t2) {
			t3 = ((a3)==(a5));
			if (!(t3)) {
				t3 = (T246f16(C));
				t2 = ((T1)(!(t3)));
			} else {
				t2 = EIF_TRUE;
			}
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T243x7063T0T0T0T0T0(GE_void(a1), C, a4, a5, a2, a3));
		}
	}
	return R;
}

/* ET_CLASS.same_base_type_with_type_marks */
T1 T80f106(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 R = 0;
	t1 = (T80f91(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a4));
		}
		if (t2) {
			t3 = ((a3)==(a5));
			if (!(t3)) {
				t3 = (T80f121(C));
				t2 = ((T1)(!(t3)));
			} else {
				t2 = EIF_TRUE;
			}
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T243x7063T0T0T0T0T0(GE_void(a1), C, a4, a5, a2, a3));
		}
	}
	return R;
}

/* ET_CLASS_TYPE.same_base_type_with_type_marks */
T1 T78f41(T0* C, T0* a1, T0* a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 R = 0;
	t1 = (T78f18(C));
	t2 = (T80f65(GE_void(t1)));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a4));
		}
		if (t2) {
			t3 = ((a3)==(a5));
			if (!(t3)) {
				t3 = (T78f11(C));
				t2 = ((T1)(!(t3)));
			} else {
				t2 = EIF_TRUE;
			}
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T243x7063T0T0T0T0T0(GE_void(a1), C, a4, a5, a2, a3));
		}
	}
	return R;
}

/* ET_BIT_FEATURE.conforms_to_type */
T1 T1214f25(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T1214f36(C, a1, EIF_VOID, a2, EIF_VOID, a3));
	return R;
}

/* ET_BIT_N.conforms_to_type */
T1 T1213f27(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T1213f37(C, a1, EIF_VOID, a2, EIF_VOID, a3));
	return R;
}

/* ET_TUPLE_TYPE.conforms_to_type */
T1 T254f19(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T254f30(C, a1, EIF_VOID, a2, EIF_VOID, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.conforms_to_type */
T1 T246f11(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T246f20(C, a1, EIF_VOID, a2, EIF_VOID, a3));
	return R;
}

/* ET_CLASS.conforms_to_type */
T1 T80f114(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T80f76(C, a1, EIF_VOID, a2, EIF_VOID, a3));
	return R;
}

/* ET_CLASS_TYPE.conforms_to_type */
T1 T78f28(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T78f33(C, a1, EIF_VOID, a2, EIF_VOID, a3));
	return R;
}

/* KL_CASE_INSENSITIVE_STRING_EQUALITY_TESTER.test */
T1 T178f1(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
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
				t2 = (T178f2(C));
				R = (T32f11(GE_void(t2), a1, a2));
			}
		}
	}
	return R;
}

/* KL_CASE_INSENSITIVE_STRING_EQUALITY_TESTER.string_ */
T0* T178f2(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* KL_STRING_EQUALITY_TESTER.test */
T1 T137f1(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T6 t2;
	T6 t3;
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
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
				l2 = (((((T0*)(GE_void(a1)))->id==17)?((T17*)(a1))->a2:((T837*)(a1))->a1));
				t2 = (((((T0*)(GE_void(a2)))->id==17)?((T17*)(a2))->a2:((T837*)(a2))->a1));
				t1 = (((((t2) == (l2)))));
				if (t1) {
					R = EIF_TRUE;
					l1 = (T6)(GE_int32(1));
					while (1) {
						t1 = (T6f1((&l1), l2));
						if (t1) {
							break;
						}
						t2 = (((((T0*)(GE_void(a1)))->id==17)?T17f7(a1, l1):T837f13(a1, l1)));
						t3 = (((((T0*)(GE_void(a2)))->id==17)?T17f7(a2, l1):T837f13(a2, l1)));
						t1 = (((((t2) != (t3)))));
						if (t1) {
							R = EIF_FALSE;
							l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
						} else {
							l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						}
					}
				}
			}
		}
	}
	return R;
}

/* detachable KL_EQUALITY_TESTER [STRING_8].test */
T1 T56f1(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = ((a1)==(a2));
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T56f1oe1(a1, a2));
	}
	return R;
}

T1 T56f1oe1(T0* a1, T0* a2)
{
	if (a1 == EIF_VOID) {
		return (a2 == EIF_VOID);
	} else if (a2 == EIF_VOID) {
		return EIF_FALSE;
	} else switch (((T0*)(a1))->id) {
	case 17:
		return ((((T0*)(a2))->id == 17) && T17f37(a1, a2));
		break;
	case 837:
		return ((((T0*)(a2))->id == 837) && T837f63(a1, a2));
		break;
	default:
		return EIF_FALSE;
	}
}

/* UC_UTF8_STRING.is_equal */
T1 T837f63(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T6 t3;
	T2 t4;
	T2 t5;
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T837f54(C));
		t1 = (T127f1(GE_void(t2), C, a1));
		if (t1) {
			t3 = (((T837*)(a1))->a3);
			t1 = (((((t3) == (((T837*)(C))->a3)))));
		}
		if (t1) {
			l2 = ((T837*)(C))->a3;
			R = EIF_TRUE;
			l1 = (T6)(GE_int32(1));
			while (1) {
				t1 = (T6f1((&l1), l2));
				if (t1) {
					break;
				}
				t4 = (T837f33(C, l1));
				t5 = (T837f33(a1, l1));
				t1 = (((((t4) != (t5)))));
				if (t1) {
					R = EIF_FALSE;
					l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				}
			}
		}
	}
	return R;
}

/* UC_STRING_EQUALITY_TESTER.test */
T1 T55f1(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
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
				t2 = (T55f2(C));
				R = (T32f1(GE_void(t2), a1, a2));
			}
		}
	}
	return R;
}

/* UC_STRING_EQUALITY_TESTER.string_ */
T0* T55f2(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.default_message */
T0* T1806f5(T0* C)
{
	T0* R = 0;
	R = (T1806f3(C, ge51ov4641));
	return R;
}

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.message */
T0* T1806f3(T0* C, T0* a1)
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
	t1 = (T1806f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T1806f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1806f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T1806f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T1806*)(C))->a1), l3));
						if (t2) {
							t1 = (T1806f4(C));
							t5 = (T135f5(GE_void(((T1806*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T1806f4(C));
								t5 = (T1806f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T1806f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T1806f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T1806f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.string_ */
T0* T1806f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* ET_UNIVERSE_ERROR.default_message */
T0* T1762f12(T0* C)
{
	T0* R = 0;
	R = (T1762f7(C, ((T1762*)(C))->a1));
	return R;
}

/* ET_UNIVERSE_ERROR.message */
T0* T1762f7(T0* C, T0* a1)
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
	l4 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T1762f9(C));
	R = (T32f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T1762f9(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(GE_void(a1), l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1762f9(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
							l5 = (T17f10(GE_void(a1), l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T1762f9(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
							l5 = (T17f10(GE_void(a1), l2));
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T1762*)(C))->a2), l3));
						if (t2) {
							t1 = (T1762f9(C));
							t5 = (T135f5(GE_void(((T1762*)(C))->a2), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T1762f9(C));
								t5 = (T1762f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T1762f9(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T1762f9(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_UNIVERSE_ERROR.arguments */
T0* T1762f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* ET_UNIVERSE_ERROR.string_ */
T0* T1762f9(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* LX_CHARACTER_OUT_OF_RANGE_ERROR.default_message */
T0* T1745f5(T0* C)
{
	T0* R = 0;
	R = (T1745f3(C, ge37ov4641));
	return R;
}

/* LX_CHARACTER_OUT_OF_RANGE_ERROR.message */
T0* T1745f3(T0* C, T0* a1)
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
	t1 = (T1745f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T1745f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1745f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T1745f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T1745*)(C))->a1), l3));
						if (t2) {
							t1 = (T1745f4(C));
							t5 = (T135f5(GE_void(((T1745*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T1745f4(C));
								t5 = (T1745f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T1745f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T1745f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T1745f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* LX_CHARACTER_OUT_OF_RANGE_ERROR.string_ */
T0* T1745f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.default_message */
T0* T1744f5(T0* C)
{
	T0* R = 0;
	R = (T1744f3(C, ge43ov4641));
	return R;
}

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.message */
T0* T1744f3(T0* C, T0* a1)
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
	t1 = (T1744f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T1744f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1744f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T1744f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T1744*)(C))->a1), l3));
						if (t2) {
							t1 = (T1744f4(C));
							t5 = (T135f5(GE_void(((T1744*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T1744f4(C));
								t5 = (T1744f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T1744f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T1744f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T1744f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.string_ */
T0* T1744f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* LX_FULL_AND_REJECT_ERROR.default_message */
T0* T1743f5(T0* C)
{
	T0* R = 0;
	R = (T1743f3(C, ge42ov4641));
	return R;
}

/* LX_FULL_AND_REJECT_ERROR.message */
T0* T1743f3(T0* C, T0* a1)
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
	t1 = (T1743f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T1743f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1743f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T1743f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T1743*)(C))->a1), l3));
						if (t2) {
							t1 = (T1743f4(C));
							t5 = (T135f5(GE_void(((T1743*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T1743f4(C));
								t5 = (T1743f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T1743f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T1743f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T1743f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* LX_FULL_AND_REJECT_ERROR.string_ */
T0* T1743f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* LX_FULL_AND_META_ERROR.default_message */
T0* T1742f5(T0* C)
{
	T0* R = 0;
	R = (T1742f3(C, ge41ov4641));
	return R;
}

/* LX_FULL_AND_META_ERROR.message */
T0* T1742f3(T0* C, T0* a1)
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
	t1 = (T1742f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T1742f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1742f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T1742f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T1742*)(C))->a1), l3));
						if (t2) {
							t1 = (T1742f4(C));
							t5 = (T135f5(GE_void(((T1742*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T1742f4(C));
								t5 = (T1742f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T1742f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T1742f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T1742f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* LX_FULL_AND_META_ERROR.string_ */
T0* T1742f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* LX_BAD_CHARACTER_ERROR.default_message */
T0* T1741f5(T0* C)
{
	T0* R = 0;
	R = (T1741f3(C, ge32ov4641));
	return R;
}

/* LX_BAD_CHARACTER_ERROR.message */
T0* T1741f3(T0* C, T0* a1)
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
	t1 = (T1741f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T1741f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1741f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T1741f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T1741*)(C))->a1), l3));
						if (t2) {
							t1 = (T1741f4(C));
							t5 = (T135f5(GE_void(((T1741*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T1741f4(C));
								t5 = (T1741f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T1741f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T1741f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T1741f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* LX_BAD_CHARACTER_ERROR.string_ */
T0* T1741f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* LX_BAD_CHARACTER_CLASS_ERROR.default_message */
T0* T1740f5(T0* C)
{
	T0* R = 0;
	R = (T1740f3(C, ge31ov4641));
	return R;
}

/* LX_BAD_CHARACTER_CLASS_ERROR.message */
T0* T1740f3(T0* C, T0* a1)
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
	t1 = (T1740f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T1740f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1740f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T1740f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T1740*)(C))->a1), l3));
						if (t2) {
							t1 = (T1740f4(C));
							t5 = (T135f5(GE_void(((T1740*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T1740f4(C));
								t5 = (T1740f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T1740f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T1740f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T1740f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* LX_BAD_CHARACTER_CLASS_ERROR.string_ */
T0* T1740f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* LX_MISSING_QUOTE_ERROR.default_message */
T0* T1739f5(T0* C)
{
	T0* R = 0;
	R = (T1739f3(C, ge48ov4641));
	return R;
}

/* LX_MISSING_QUOTE_ERROR.message */
T0* T1739f3(T0* C, T0* a1)
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
	t1 = (T1739f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T1739f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1739f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T1739f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T1739*)(C))->a1), l3));
						if (t2) {
							t1 = (T1739f4(C));
							t5 = (T135f5(GE_void(((T1739*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T1739f4(C));
								t5 = (T1739f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T1739f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T1739f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T1739f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* LX_MISSING_QUOTE_ERROR.string_ */
T0* T1739f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* LX_UNRECOGNIZED_RULE_ERROR.default_message */
T0* T1738f5(T0* C)
{
	T0* R = 0;
	R = (T1738f3(C, ge61ov4641));
	return R;
}

/* LX_UNRECOGNIZED_RULE_ERROR.message */
T0* T1738f3(T0* C, T0* a1)
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
	t1 = (T1738f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T1738f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1738f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T1738f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T1738*)(C))->a1), l3));
						if (t2) {
							t1 = (T1738f4(C));
							t5 = (T135f5(GE_void(((T1738*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T1738f4(C));
								t5 = (T1738f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T1738f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T1738f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T1738f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* LX_UNRECOGNIZED_RULE_ERROR.string_ */
T0* T1738f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* ET_DOTNET_ASSEMBLY_ERROR.default_message */
T0* T1680f12(T0* C)
{
	T0* R = 0;
	R = (T1680f7(C, ((T1680*)(C))->a1));
	return R;
}

/* ET_DOTNET_ASSEMBLY_ERROR.message */
T0* T1680f7(T0* C, T0* a1)
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
	l4 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T1680f9(C));
	R = (T32f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T1680f9(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(GE_void(a1), l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1680f9(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
							l5 = (T17f10(GE_void(a1), l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T1680f9(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
							l5 = (T17f10(GE_void(a1), l2));
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T1680*)(C))->a2), l3));
						if (t2) {
							t1 = (T1680f9(C));
							t5 = (T135f5(GE_void(((T1680*)(C))->a2), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T1680f9(C));
								t5 = (T1680f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T1680f9(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T1680f9(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_DOTNET_ASSEMBLY_ERROR.arguments */
T0* T1680f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* ET_DOTNET_ASSEMBLY_ERROR.string_ */
T0* T1680f9(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* ET_SYNTAX_ERROR.default_message */
T0* T1541f11(T0* C)
{
	T0* R = 0;
	R = (T1541f14(C, ((T1541*)(C))->a1));
	return R;
}

/* ET_SYNTAX_ERROR.message */
T0* T1541f14(T0* C, T0* a1)
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
	l4 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T1541f16(C));
	R = (T32f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T1541f16(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(GE_void(a1), l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1541f16(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
							l5 = (T17f10(GE_void(a1), l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T1541f16(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
							l5 = (T17f10(GE_void(a1), l2));
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T1541*)(C))->a2), l3));
						if (t2) {
							t1 = (T1541f16(C));
							t5 = (T135f5(GE_void(((T1541*)(C))->a2), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T1541f16(C));
								t5 = (T1541f12(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T1541f16(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T1541f16(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_SYNTAX_ERROR.arguments */
T0* T1541f12(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* ET_SYNTAX_ERROR.string_ */
T0* T1541f16(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* ET_CLUSTER_ERROR.default_message */
T0* T1540f12(T0* C)
{
	T0* R = 0;
	R = (T1540f7(C, ((T1540*)(C))->a1));
	return R;
}

/* ET_CLUSTER_ERROR.message */
T0* T1540f7(T0* C, T0* a1)
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
	l4 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T1540f9(C));
	R = (T32f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T1540f9(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(GE_void(a1), l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1540f9(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
							l5 = (T17f10(GE_void(a1), l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T1540f9(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
							l5 = (T17f10(GE_void(a1), l2));
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T1540*)(C))->a2), l3));
						if (t2) {
							t1 = (T1540f9(C));
							t5 = (T135f5(GE_void(((T1540*)(C))->a2), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T1540f9(C));
								t5 = (T1540f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T1540f9(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T1540f9(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_CLUSTER_ERROR.arguments */
T0* T1540f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* ET_CLUSTER_ERROR.string_ */
T0* T1540f9(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.default_message */
T0* T1383f5(T0* C)
{
	T0* R = 0;
	R = (T1383f3(C, ge1135ov4641));
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.message */
T0* T1383f3(T0* C, T0* a1)
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
	t1 = (T1383f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T1383f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1383f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T1383f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T1383*)(C))->a1), l3));
						if (t2) {
							t1 = (T1383f4(C));
							t5 = (T135f5(GE_void(((T1383*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T1383f4(C));
								t5 = (T1383f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T1383f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T1383f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T1383f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.string_ */
T0* T1383f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* UT_TOO_MANY_INCLUDES_ERROR.default_message */
T0* T1328f5(T0* C)
{
	T0* R = 0;
	R = (T1328f3(C, ge169ov4641));
	return R;
}

/* UT_TOO_MANY_INCLUDES_ERROR.message */
T0* T1328f3(T0* C, T0* a1)
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
	t1 = (T1328f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T1328f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1328f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T1328f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T1328*)(C))->a1), l3));
						if (t2) {
							t1 = (T1328f4(C));
							t5 = (T135f5(GE_void(((T1328*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T1328f4(C));
								t5 = (T1328f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T1328f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T1328f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_TOO_MANY_INCLUDES_ERROR.arguments */
T0* T1328f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* UT_TOO_MANY_INCLUDES_ERROR.string_ */
T0* T1328f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* UT_SYNTAX_ERROR.default_message */
T0* T1327f5(T0* C)
{
	T0* R = 0;
	R = (T1327f3(C, ge168ov4641));
	return R;
}

/* UT_SYNTAX_ERROR.message */
T0* T1327f3(T0* C, T0* a1)
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
	t1 = (T1327f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T1327f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1327f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T1327f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T1327*)(C))->a1), l3));
						if (t2) {
							t1 = (T1327f4(C));
							t5 = (T135f5(GE_void(((T1327*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T1327f4(C));
								t5 = (T1327f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T1327f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T1327f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T1327f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* UT_SYNTAX_ERROR.string_ */
T0* T1327f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.default_message */
T0* T772f5(T0* C)
{
	T0* R = 0;
	R = (T772f3(C, ge1129ov4641));
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.message */
T0* T772f3(T0* C, T0* a1)
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
	t1 = (T772f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T772f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T772f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T772f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T772*)(C))->a1), l3));
						if (t2) {
							t1 = (T772f4(C));
							t5 = (T135f5(GE_void(((T772*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T772f4(C));
								t5 = (T772f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T772f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T772f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T772f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.string_ */
T0* T772f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.default_message */
T0* T771f5(T0* C)
{
	T0* R = 0;
	R = (T771f3(C, ge1145ov4641));
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.message */
T0* T771f3(T0* C, T0* a1)
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
	t1 = (T771f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T771f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T771f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T771f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T771*)(C))->a1), l3));
						if (t2) {
							t1 = (T771f4(C));
							t5 = (T135f5(GE_void(((T771*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T771f4(C));
								t5 = (T771f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T771f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T771f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T771f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.string_ */
T0* T771f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.default_message */
T0* T770f5(T0* C)
{
	T0* R = 0;
	R = (T770f3(C, ge1142ov4641));
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.message */
T0* T770f3(T0* C, T0* a1)
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
	t1 = (T770f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T770f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T770f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T770f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T770*)(C))->a1), l3));
						if (t2) {
							t1 = (T770f4(C));
							t5 = (T135f5(GE_void(((T770*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T770f4(C));
								t5 = (T770f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T770f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T770f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T770f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.string_ */
T0* T770f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.default_message */
T0* T769f5(T0* C)
{
	T0* R = 0;
	R = (T769f3(C, ge1141ov4641));
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.message */
T0* T769f3(T0* C, T0* a1)
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
	t1 = (T769f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T769f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T769f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T769f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T769*)(C))->a1), l3));
						if (t2) {
							t1 = (T769f4(C));
							t5 = (T135f5(GE_void(((T769*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T769f4(C));
								t5 = (T769f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T769f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T769f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T769f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.string_ */
T0* T769f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.default_message */
T0* T768f5(T0* C)
{
	T0* R = 0;
	R = (T768f3(C, ge1137ov4641));
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.message */
T0* T768f3(T0* C, T0* a1)
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
	t1 = (T768f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T768f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T768f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T768f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T768*)(C))->a1), l3));
						if (t2) {
							t1 = (T768f4(C));
							t5 = (T135f5(GE_void(((T768*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T768f4(C));
								t5 = (T768f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T768f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T768f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T768f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.string_ */
T0* T768f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.default_message */
T0* T767f5(T0* C)
{
	T0* R = 0;
	R = (T767f3(C, ge1144ov4641));
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.message */
T0* T767f3(T0* C, T0* a1)
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
	t1 = (T767f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T767f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T767f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T767f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T767*)(C))->a1), l3));
						if (t2) {
							t1 = (T767f4(C));
							t5 = (T135f5(GE_void(((T767*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T767f4(C));
								t5 = (T767f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T767f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T767f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T767f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.string_ */
T0* T767f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.default_message */
T0* T766f5(T0* C)
{
	T0* R = 0;
	R = (T766f3(C, ge1136ov4641));
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.message */
T0* T766f3(T0* C, T0* a1)
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
	t1 = (T766f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T766f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T766f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T766f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T766*)(C))->a1), l3));
						if (t2) {
							t1 = (T766f4(C));
							t5 = (T135f5(GE_void(((T766*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T766f4(C));
								t5 = (T766f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T766f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T766f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T766f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.string_ */
T0* T766f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.default_message */
T0* T765f5(T0* C)
{
	T0* R = 0;
	R = (T765f3(C, ge1148ov4641));
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.message */
T0* T765f3(T0* C, T0* a1)
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
	t1 = (T765f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T765f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T765f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T765f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T765*)(C))->a1), l3));
						if (t2) {
							t1 = (T765f4(C));
							t5 = (T135f5(GE_void(((T765*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T765f4(C));
								t5 = (T765f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T765f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T765f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T765f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.string_ */
T0* T765f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* ET_VALIDITY_ERROR.default_message */
T0* T521f32(T0* C)
{
	T0* R = 0;
	R = (T521f16(C, ((T521*)(C))->a3));
	return R;
}

/* ET_VALIDITY_ERROR.message */
T0* T521f16(T0* C, T0* a1)
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
	l4 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T521f31(C));
	R = (T32f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T521f31(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(GE_void(a1), l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T521f31(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
							l5 = (T17f10(GE_void(a1), l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T521f31(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
							l5 = (T17f10(GE_void(a1), l2));
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T521*)(C))->a4), l3));
						if (t2) {
							t1 = (T521f31(C));
							t5 = (T135f5(GE_void(((T521*)(C))->a4), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T521f31(C));
								t5 = (T521f13(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T521f31(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T521f31(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_VALIDITY_ERROR.arguments */
T0* T521f13(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* ET_VALIDITY_ERROR.string_ */
T0* T521f31(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* ET_INTERNAL_ERROR.default_message */
T0* T520f5(T0* C)
{
	T0* R = 0;
	R = (T520f7(C, ((T520*)(C))->a1));
	return R;
}

/* ET_INTERNAL_ERROR.message */
T0* T520f7(T0* C, T0* a1)
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
	l4 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T520f9(C));
	R = (T32f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T520f9(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(GE_void(a1), l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T520f9(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
							l5 = (T17f10(GE_void(a1), l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T520f9(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
							l5 = (T17f10(GE_void(a1), l2));
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T520*)(C))->a2), l3));
						if (t2) {
							t1 = (T520f9(C));
							t5 = (T135f5(GE_void(((T520*)(C))->a2), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T520f9(C));
								t5 = (T520f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T520f9(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T520f9(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_INTERNAL_ERROR.arguments */
T0* T520f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* ET_INTERNAL_ERROR.string_ */
T0* T520f9(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* ET_SYSTEM_ERROR.default_message */
T0* T519f5(T0* C)
{
	T0* R = 0;
	R = (T519f7(C, ((T519*)(C))->a1));
	return R;
}

/* ET_SYSTEM_ERROR.message */
T0* T519f7(T0* C, T0* a1)
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
	l4 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T519f9(C));
	R = (T32f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T519f9(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(GE_void(a1), l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T519f9(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
							l5 = (T17f10(GE_void(a1), l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T519f9(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
							l5 = (T17f10(GE_void(a1), l2));
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T519*)(C))->a2), l3));
						if (t2) {
							t1 = (T519f9(C));
							t5 = (T135f5(GE_void(((T519*)(C))->a2), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T519f9(C));
								t5 = (T519f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T519f9(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T519f9(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_SYSTEM_ERROR.arguments */
T0* T519f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* ET_SYSTEM_ERROR.string_ */
T0* T519f9(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.default_message */
T0* T419f5(T0* C)
{
	T0* R = 0;
	R = (T419f3(C, ge1132ov4641));
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.message */
T0* T419f3(T0* C, T0* a1)
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
	t1 = (T419f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T419f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T419f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T419f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T419*)(C))->a1), l3));
						if (t2) {
							t1 = (T419f4(C));
							t5 = (T135f5(GE_void(((T419*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T419f4(C));
								t5 = (T419f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T419f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T419f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T419f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.string_ */
T0* T419f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.default_message */
T0* T418f5(T0* C)
{
	T0* R = 0;
	R = (T418f3(C, ge1143ov4641));
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.message */
T0* T418f3(T0* C, T0* a1)
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
	t1 = (T418f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T418f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T418f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T418f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T418*)(C))->a1), l3));
						if (t2) {
							t1 = (T418f4(C));
							t5 = (T135f5(GE_void(((T418*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T418f4(C));
								t5 = (T418f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T418f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T418f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T418f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.string_ */
T0* T418f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.default_message */
T0* T417f5(T0* C)
{
	T0* R = 0;
	R = (T417f3(C, ge1147ov4641));
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.message */
T0* T417f3(T0* C, T0* a1)
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
	t1 = (T417f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T417f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T417f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T417f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T417*)(C))->a1), l3));
						if (t2) {
							t1 = (T417f4(C));
							t5 = (T135f5(GE_void(((T417*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T417f4(C));
								t5 = (T417f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T417f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T417f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T417f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.default_message */
T0* T416f5(T0* C)
{
	T0* R = 0;
	R = (T416f3(C, ge1139ov4641));
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.message */
T0* T416f3(T0* C, T0* a1)
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
	t1 = (T416f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T416f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T416f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T416f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T416*)(C))->a1), l3));
						if (t2) {
							t1 = (T416f4(C));
							t5 = (T135f5(GE_void(((T416*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T416f4(C));
								t5 = (T416f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T416f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T416f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T416f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.string_ */
T0* T416f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.default_message */
T0* T415f5(T0* C)
{
	T0* R = 0;
	R = (T415f3(C, ge1130ov4641));
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.message */
T0* T415f3(T0* C, T0* a1)
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
	t1 = (T415f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T415f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T415f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T415f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T415*)(C))->a1), l3));
						if (t2) {
							t1 = (T415f4(C));
							t5 = (T135f5(GE_void(((T415*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T415f4(C));
								t5 = (T415f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T415f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T415f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T415f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.string_ */
T0* T415f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.default_message */
T0* T414f5(T0* C)
{
	T0* R = 0;
	R = (T414f3(C, ge1138ov4641));
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.message */
T0* T414f3(T0* C, T0* a1)
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
	t1 = (T414f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T414f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T414f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T414f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T414*)(C))->a1), l3));
						if (t2) {
							t1 = (T414f4(C));
							t5 = (T135f5(GE_void(((T414*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T414f4(C));
								t5 = (T414f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T414f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T414f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T414f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.string_ */
T0* T414f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
T0* T297f3(T0* C)
{
	T0* R = 0;
	R = (T297f5(C, ge163ov4641));
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
T0* T297f5(T0* C, T0* a1)
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
	t1 = (T297f6(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T297f6(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T297f6(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T297f6(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T297*)(C))->a1), l3));
						if (t2) {
							t1 = (T297f6(C));
							t5 = (T135f5(GE_void(((T297*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T297f6(C));
								t5 = (T297f7(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T297f6(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T297f6(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T297f7(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
T0* T297f6(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* UT_MESSAGE.default_message */
T0* T162f5(T0* C)
{
	T0* R = 0;
	R = (T162f3(C, ge166ov4641));
	return R;
}

/* UT_MESSAGE.message */
T0* T162f3(T0* C, T0* a1)
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
	t1 = (T162f4(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T162f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T162f4(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T162f4(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T162*)(C))->a1), l3));
						if (t2) {
							t1 = (T162f4(C));
							t5 = (T135f5(GE_void(((T162*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T162f4(C));
								t5 = (T162f6(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T162f4(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T162f4(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T162f6(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* UT_MESSAGE.string_ */
T0* T162f4(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* UT_VERSION_NUMBER.default_message */
T0* T85f3(T0* C)
{
	T0* R = 0;
	R = (T85f5(C, ge173ov4641));
	return R;
}

/* UT_VERSION_NUMBER.message */
T0* T85f5(T0* C, T0* a1)
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
	t1 = (T85f6(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T85f6(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T85f6(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T85f6(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T85*)(C))->a1), l3));
						if (t2) {
							t1 = (T85f6(C));
							t5 = (T135f5(GE_void(((T85*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T85f6(C));
								t5 = (T85f7(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T85f6(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T85f6(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T85f7(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* UT_VERSION_NUMBER.string_ */
T0* T85f6(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.default_message */
T0* T84f3(T0* C)
{
	T0* R = 0;
	R = (T84f5(C, ge162ov4641));
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.message */
T0* T84f5(T0* C, T0* a1)
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
	t1 = (T84f6(C));
	R = (T32f7(GE_void(t1), a1, l4));
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
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T84f6(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T84f6(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T84f6(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T84*)(C))->a1), l3));
						if (t2) {
							t1 = (T84f6(C));
							t5 = (T135f5(GE_void(((T84*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T84f6(C));
								t5 = (T84f7(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T84f6(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T84f6(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
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
T0* T84f7(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.string_ */
T0* T84f6(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* AP_ERROR.default_message */
T0* T38f17(T0* C)
{
	T0* R = 0;
	R = (T38f18(C, ((T38*)(C))->a2));
	return R;
}

/* AP_ERROR.message */
T0* T38f18(T0* C, T0* a1)
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
	l4 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T38f19(C));
	R = (T32f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1((&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, l5);
				} else {
					T837f68(R, l5);
				}
			} else {
				t1 = (T38f19(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T32f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(R, (T2)('$'));
				} else {
					T837f68(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(GE_void(a1), l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(R, (T2)('$'));
					} else {
						T837f68(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T38f19(C));
					l1 = (T32f7(GE_void(t1), a1, (T6)(GE_int32(5))));
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
							l5 = (T17f10(GE_void(a1), l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(l1, l5);
									} else {
										T837f68(l1, l5);
									}
								} else {
									t1 = (T38f19(C));
									T32f21(GE_void(t1), l1, a1, l2, l2);
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
							l5 = (T17f10(GE_void(a1), l2));
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
									T17f46(l1, l5);
								} else {
									T837f68(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(l1):T837f28(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T837f29(l1)));
						t2 = (T135f4(GE_void(((T38*)(C))->a1), l3));
						if (t2) {
							t1 = (T38f19(C));
							t5 = (T135f5(GE_void(((T38*)(C))->a1), l3));
							R = (T32f8(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T38f19(C));
								t5 = (T38f20(C));
								t5 = (((T28*)(GE_void(t5)))->a1);
								R = (T32f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(R, (T2)('$'));
								} else {
									T837f68(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('{'));
									} else {
										T837f68(R, (T2)('{'));
									}
								}
								t1 = (T38f19(C));
								R = (T32f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(R, (T2)('}'));
									} else {
										T837f68(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(R, (T2)('$'));
						} else {
							T837f68(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('{'));
							} else {
								T837f68(R, (T2)('{'));
							}
						}
						t1 = (T38f19(C));
						R = (T32f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(R, (T2)('}'));
							} else {
								T837f68(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* AP_ERROR.arguments */
T0* T38f20(T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T28c5();
	ge293ov1977 = R;
	return R;
}

/* AP_ERROR.string_ */
T0* T38f19(T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T32c19();
	ge219ov1985 = R;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.was_found */
T1 T48f24(T0* C)
{
	T1 R = 0;
	R = (T6f1(&(((T48*)(C))->a5), (T6)(GE_int32(0))));
	return R;
}

/* AP_STRING_OPTION.was_found */
T1 T44f11(T0* C)
{
	T6 t1;
	T1 R = 0;
	t1 = (T44f14(C));
	R = (T6f1(&t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_INTEGER_OPTION.was_found */
T1 T43f11(T0* C)
{
	T6 t1;
	T1 R = 0;
	t1 = (T43f10(C));
	R = (T6f1(&t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_BOOLEAN_OPTION.was_found */
T1 T42f13(T0* C)
{
	T6 t1;
	T1 R = 0;
	t1 = (T42f10(C));
	R = (T6f1(&t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_ENUMERATION_OPTION.was_found */
T1 T41f17(T0* C)
{
	T6 t1;
	T1 R = 0;
	t1 = (T41f16(C));
	R = (T6f1(&t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_FLAG.was_found */
T1 T39f9(T0* C)
{
	T1 R = 0;
	R = (T6f1(&(((T39*)(C))->a1), (T6)(GE_int32(0))));
	return R;
}

/* AP_STRING_OPTION.occurrences */
T6 T44f14(T0* C)
{
	T6 R = 0;
	R = (((T129*)(GE_void(((T44*)(C))->a1)))->a1);
	return R;
}

/* AP_INTEGER_OPTION.occurrences */
T6 T43f10(T0* C)
{
	T6 R = 0;
	R = (((T144*)(GE_void(((T43*)(C))->a1)))->a1);
	return R;
}

/* AP_BOOLEAN_OPTION.occurrences */
T6 T42f10(T0* C)
{
	T6 R = 0;
	R = (((T141*)(GE_void(((T42*)(C))->a1)))->a1);
	return R;
}

/* AP_ENUMERATION_OPTION.occurrences */
T6 T41f16(T0* C)
{
	T6 R = 0;
	R = (((T129*)(GE_void(((T41*)(C))->a1)))->a1);
	return R;
}

/* AP_DISPLAY_HELP_FLAG.allows_parameter */
T1 T48f20(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_STRING_OPTION.allows_parameter */
T1 T44f12(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_INTEGER_OPTION.allows_parameter */
T1 T43f15(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_BOOLEAN_OPTION.allows_parameter */
T1 T42f12(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_ENUMERATION_OPTION.allows_parameter */
T1 T41f14(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_FLAG.allows_parameter */
T1 T39f11(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.needs_parameter */
T1 T48f18(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_INTEGER_OPTION.needs_parameter */
T1 T43f14(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_BOOLEAN_OPTION.needs_parameter */
T1 T42f11(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_FLAG.needs_parameter */
T1 T39f10(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.name */
T0* T48f19(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (((T48*)(C))->a4?((m1 = ((T48*)(C))->a4, EIF_TRUE)):EIF_FALSE);
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
		t4 = (T2f1(&(((T48*)(C))->a2)));
		R = (T17f9(GE_void(t3), t4));
	}
	return R;
}

/* AP_STRING_OPTION.name */
T0* T44f15(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (((T44*)(C))->a5?((m1 = ((T44*)(C))->a5, EIF_TRUE)):EIF_FALSE);
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
		t4 = (T2f1(&(((T44*)(C))->a9)));
		R = (T17f9(GE_void(t3), t4));
	}
	return R;
}

/* AP_INTEGER_OPTION.name */
T0* T43f17(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (((T43*)(C))->a2?((m1 = ((T43*)(C))->a2, EIF_TRUE)):EIF_FALSE);
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
		t4 = (T2f1(&(((T43*)(C))->a3)));
		R = (T17f9(GE_void(t3), t4));
	}
	return R;
}

/* AP_BOOLEAN_OPTION.name */
T0* T42f15(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (((T42*)(C))->a4?((m1 = ((T42*)(C))->a4, EIF_TRUE)):EIF_FALSE);
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
		t4 = (T2f1(&(((T42*)(C))->a8)));
		R = (T17f9(GE_void(t3), t4));
	}
	return R;
}

/* AP_ENUMERATION_OPTION.name */
T0* T41f12(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (((T41*)(C))->a6?((m1 = ((T41*)(C))->a6, EIF_TRUE)):EIF_FALSE);
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
		t4 = (T2f1(&(((T41*)(C))->a10)));
		R = (T17f9(GE_void(t3), t4));
	}
	return R;
}

/* AP_FLAG.name */
T0* T39f12(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (((T39*)(C))->a3?((m1 = ((T39*)(C))->a3, EIF_TRUE)):EIF_FALSE);
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
		t4 = (T2f1(&(((T39*)(C))->a4)));
		R = (T17f9(GE_void(t3), t4));
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.example */
T0* T48f22(T0* C)
{
	T1 t1;
	T0* t2;
	T0* R = 0;
	T0* l1 = 0;
	R = T17c44((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T48*)(C))->a7)));
	if (t1) {
		T17f46(GE_void(R), (T2)('['));
	}
	T17f46(GE_void(R), (T2)('-'));
	if (((T48*)(C))->a3) {
		t2 = (T2f1(&(((T48*)(C))->a2)));
		T17f49(GE_void(R), t2);
	} else {
		l1 = ((T48*)(C))->a4;
		T17f46(GE_void(R), (T2)('-'));
		T17f49(GE_void(R), l1);
	}
	t1 = ((T1)(!(((T48*)(C))->a7)));
	if (t1) {
		T17f46(GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_STRING_OPTION.example */
T0* T44f16(T0* C)
{
	T1 t1;
	T0* R = 0;
	T0* l1 = 0;
	R = T17c44((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T44*)(C))->a6)));
	if (t1) {
		T17f46(GE_void(R), (T2)('['));
	}
	T17f46(GE_void(R), (T2)('-'));
	if (((T44*)(C))->a8) {
		T17f46(GE_void(R), ((T44*)(C))->a9);
		T17f46(GE_void(R), (T2)(' '));
		T17f49(GE_void(R), ((T44*)(C))->a3);
	} else {
		T17f46(GE_void(R), (T2)('-'));
		l1 = ((T44*)(C))->a5;
		T17f49(GE_void(R), l1);
		t1 = ((T1)(!(((T44*)(C))->a4)));
		if (t1) {
			T17f46(GE_void(R), (T2)('['));
		}
		T17f46(GE_void(R), (T2)('='));
		T17f49(GE_void(R), ((T44*)(C))->a3);
		t1 = ((T1)(!(((T44*)(C))->a4)));
		if (t1) {
			T17f46(GE_void(R), (T2)(']'));
		}
	}
	t1 = ((T1)(!(((T44*)(C))->a6)));
	if (t1) {
		T17f46(GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_INTEGER_OPTION.example */
T0* T43f18(T0* C)
{
	T1 t1;
	T0* R = 0;
	T0* l1 = 0;
	R = T17c44((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T43*)(C))->a6)));
	if (t1) {
		T17f46(GE_void(R), (T2)('['));
	}
	T17f46(GE_void(R), (T2)('-'));
	if (((T43*)(C))->a8) {
		T17f46(GE_void(R), ((T43*)(C))->a3);
		T17f46(GE_void(R), (T2)(' '));
		T17f49(GE_void(R), ((T43*)(C))->a5);
	} else {
		T17f46(GE_void(R), (T2)('-'));
		l1 = ((T43*)(C))->a2;
		T17f49(GE_void(R), l1);
		t1 = (T43f14(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f46(GE_void(R), (T2)('['));
		}
		T17f46(GE_void(R), (T2)('='));
		T17f49(GE_void(R), ((T43*)(C))->a5);
		t1 = (T43f14(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f46(GE_void(R), (T2)(']'));
		}
	}
	t1 = ((T1)(!(((T43*)(C))->a6)));
	if (t1) {
		T17f46(GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_BOOLEAN_OPTION.example */
T0* T42f16(T0* C)
{
	T1 t1;
	T0* R = 0;
	T0* l1 = 0;
	R = T17c44((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T42*)(C))->a5)));
	if (t1) {
		T17f46(GE_void(R), (T2)('['));
	}
	T17f46(GE_void(R), (T2)('-'));
	if (((T42*)(C))->a7) {
		T17f46(GE_void(R), ((T42*)(C))->a8);
		T17f46(GE_void(R), (T2)(' '));
		T17f49(GE_void(R), ((T42*)(C))->a3);
	} else {
		T17f46(GE_void(R), (T2)('-'));
		l1 = ((T42*)(C))->a4;
		T17f49(GE_void(R), l1);
		t1 = (T42f11(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f46(GE_void(R), (T2)('['));
		}
		T17f46(GE_void(R), (T2)('='));
		T17f49(GE_void(R), ((T42*)(C))->a3);
		t1 = (T42f11(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f46(GE_void(R), (T2)(']'));
		}
	}
	t1 = ((T1)(!(((T42*)(C))->a5)));
	if (t1) {
		T17f46(GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_ENUMERATION_OPTION.example */
T0* T41f18(T0* C)
{
	T1 t1;
	T0* R = 0;
	T0* l1 = 0;
	R = T17c44((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T41*)(C))->a7)));
	if (t1) {
		T17f46(GE_void(R), (T2)('['));
	}
	T17f46(GE_void(R), (T2)('-'));
	if (((T41*)(C))->a9) {
		T17f46(GE_void(R), ((T41*)(C))->a10);
		T17f46(GE_void(R), (T2)(' '));
		T17f49(GE_void(R), ((T41*)(C))->a4);
	} else {
		T17f46(GE_void(R), (T2)('-'));
		l1 = ((T41*)(C))->a6;
		T17f49(GE_void(R), l1);
		t1 = ((T1)(!(((T41*)(C))->a5)));
		if (t1) {
			T17f46(GE_void(R), (T2)('['));
		}
		T17f46(GE_void(R), (T2)('='));
		T17f49(GE_void(R), ((T41*)(C))->a4);
		t1 = ((T1)(!(((T41*)(C))->a5)));
		if (t1) {
			T17f46(GE_void(R), (T2)(']'));
		}
	}
	t1 = ((T1)(!(((T41*)(C))->a7)));
	if (t1) {
		T17f46(GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_FLAG.example */
T0* T39f13(T0* C)
{
	T1 t1;
	T0* t2;
	T0* R = 0;
	T0* l1 = 0;
	R = T17c44((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T39*)(C))->a6)));
	if (t1) {
		T17f46(GE_void(R), (T2)('['));
	}
	T17f46(GE_void(R), (T2)('-'));
	if (((T39*)(C))->a5) {
		t2 = (T2f1(&(((T39*)(C))->a4)));
		T17f49(GE_void(R), t2);
	} else {
		l1 = ((T39*)(C))->a3;
		T17f46(GE_void(R), (T2)('-'));
		T17f49(GE_void(R), l1);
	}
	t1 = ((T1)(!(((T39*)(C))->a6)));
	if (t1) {
		T17f46(GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.names */
T0* T48f33(T0* C)
{
	T2 t1;
	T1 t2;
	T0* m1 = 0;
	T0* R = 0;
	T0* l1 = 0;
	if (((T48*)(C))->a3) {
		t1 = (T2)('-');
		l1 = (T2f1(&t1));
		T17f46(GE_void(l1), ((T48*)(C))->a2);
	}
	t2 = (((T48*)(C))->a4?((m1 = ((T48*)(C))->a4, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f49(GE_void(l1), GE_ms8(", ", 2));
		}
		T17f46(GE_void(l1), (T2)('-'));
		T17f46(GE_void(l1), (T2)('-'));
		T17f49(GE_void(l1), m1);
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
T0* T44f20(T0* C)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T0* R = 0;
	R = (T44f20p1(C));
	t1 = (T44f21(C));
	if (t1) {
		t1 = ((T1)(!(((T44*)(C))->a4)));
		if (t1) {
			T17f46(GE_void(R), (T2)('['));
		}
		t2 = (T2)('=');
		t3 = (T2f1(&t2));
		T17f49(GE_void(R), t3);
		T17f49(GE_void(R), ((T44*)(C))->a3);
		t1 = ((T1)(!(((T44*)(C))->a4)));
		if (t1) {
			T17f46(GE_void(R), (T2)(']'));
		}
	} else {
		T17f46(GE_void(R), (T2)(' '));
		T17f49(GE_void(R), ((T44*)(C))->a3);
	}
	return R;
}

/* AP_STRING_OPTION.has_long_form */
T1 T44f21(T0* C)
{
	T1 R = 0;
	R = ((((T44*)(C))->a5)!=(EIF_VOID));
	return R;
}

/* AP_STRING_OPTION.names */
T0* T44f20p1(T0* C)
{
	T2 t1;
	T1 t2;
	T0* m1 = 0;
	T0* R = 0;
	T0* l1 = 0;
	if (((T44*)(C))->a8) {
		t1 = (T2)('-');
		l1 = (T2f1(&t1));
		T17f46(GE_void(l1), ((T44*)(C))->a9);
	}
	t2 = (((T44*)(C))->a5?((m1 = ((T44*)(C))->a5, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f49(GE_void(l1), GE_ms8(", ", 2));
		}
		T17f46(GE_void(l1), (T2)('-'));
		T17f46(GE_void(l1), (T2)('-'));
		T17f49(GE_void(l1), m1);
	}
	{
		t2 = ((l1)!=(EIF_VOID));
		if (!(t2)) {
			GE_raise(GE_EX_CHECK);
		}		R = l1;
	}
	return R;
}

/* AP_INTEGER_OPTION.names */
T0* T43f20(T0* C)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T0* R = 0;
	R = (T43f20p1(C));
	t1 = (T43f21(C));
	if (t1) {
		t1 = (T43f14(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f46(GE_void(R), (T2)('['));
		}
		t2 = (T2)('=');
		t3 = (T2f1(&t2));
		T17f49(GE_void(R), t3);
		T17f49(GE_void(R), ((T43*)(C))->a5);
		t1 = (T43f14(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f46(GE_void(R), (T2)(']'));
		}
	} else {
		T17f46(GE_void(R), (T2)(' '));
		T17f49(GE_void(R), ((T43*)(C))->a5);
	}
	return R;
}

/* AP_INTEGER_OPTION.has_long_form */
T1 T43f21(T0* C)
{
	T1 R = 0;
	R = ((((T43*)(C))->a2)!=(EIF_VOID));
	return R;
}

/* AP_INTEGER_OPTION.names */
T0* T43f20p1(T0* C)
{
	T2 t1;
	T1 t2;
	T0* m1 = 0;
	T0* R = 0;
	T0* l1 = 0;
	if (((T43*)(C))->a8) {
		t1 = (T2)('-');
		l1 = (T2f1(&t1));
		T17f46(GE_void(l1), ((T43*)(C))->a3);
	}
	t2 = (((T43*)(C))->a2?((m1 = ((T43*)(C))->a2, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f49(GE_void(l1), GE_ms8(", ", 2));
		}
		T17f46(GE_void(l1), (T2)('-'));
		T17f46(GE_void(l1), (T2)('-'));
		T17f49(GE_void(l1), m1);
	}
	{
		t2 = ((l1)!=(EIF_VOID));
		if (!(t2)) {
			GE_raise(GE_EX_CHECK);
		}		R = l1;
	}
	return R;
}

/* AP_BOOLEAN_OPTION.names */
T0* T42f23(T0* C)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T0* R = 0;
	R = (T42f23p1(C));
	t1 = (T42f24(C));
	if (t1) {
		t1 = (T42f11(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f46(GE_void(R), (T2)('['));
		}
		t2 = (T2)('=');
		t3 = (T2f1(&t2));
		T17f49(GE_void(R), t3);
		T17f49(GE_void(R), ((T42*)(C))->a3);
		t1 = (T42f11(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f46(GE_void(R), (T2)(']'));
		}
	} else {
		T17f46(GE_void(R), (T2)(' '));
		T17f49(GE_void(R), ((T42*)(C))->a3);
	}
	return R;
}

/* AP_BOOLEAN_OPTION.has_long_form */
T1 T42f24(T0* C)
{
	T1 R = 0;
	R = ((((T42*)(C))->a4)!=(EIF_VOID));
	return R;
}

/* AP_BOOLEAN_OPTION.names */
T0* T42f23p1(T0* C)
{
	T2 t1;
	T1 t2;
	T0* m1 = 0;
	T0* R = 0;
	T0* l1 = 0;
	if (((T42*)(C))->a7) {
		t1 = (T2)('-');
		l1 = (T2f1(&t1));
		T17f46(GE_void(l1), ((T42*)(C))->a8);
	}
	t2 = (((T42*)(C))->a4?((m1 = ((T42*)(C))->a4, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f49(GE_void(l1), GE_ms8(", ", 2));
		}
		T17f46(GE_void(l1), (T2)('-'));
		T17f46(GE_void(l1), (T2)('-'));
		T17f49(GE_void(l1), m1);
	}
	{
		t2 = ((l1)!=(EIF_VOID));
		if (!(t2)) {
			GE_raise(GE_EX_CHECK);
		}		R = l1;
	}
	return R;
}

/* AP_ENUMERATION_OPTION.names */
T0* T41f22(T0* C)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T0* R = 0;
	R = (T41f22p1(C));
	t1 = (T41f23(C));
	if (t1) {
		t1 = ((T1)(!(((T41*)(C))->a5)));
		if (t1) {
			T17f46(GE_void(R), (T2)('['));
		}
		t2 = (T2)('=');
		t3 = (T2f1(&t2));
		T17f49(GE_void(R), t3);
		T17f49(GE_void(R), ((T41*)(C))->a4);
		t1 = ((T1)(!(((T41*)(C))->a5)));
		if (t1) {
			T17f46(GE_void(R), (T2)(']'));
		}
	} else {
		T17f46(GE_void(R), (T2)(' '));
		T17f49(GE_void(R), ((T41*)(C))->a4);
	}
	return R;
}

/* AP_ENUMERATION_OPTION.has_long_form */
T1 T41f23(T0* C)
{
	T1 R = 0;
	R = ((((T41*)(C))->a6)!=(EIF_VOID));
	return R;
}

/* AP_ENUMERATION_OPTION.names */
T0* T41f22p1(T0* C)
{
	T2 t1;
	T1 t2;
	T0* m1 = 0;
	T0* R = 0;
	T0* l1 = 0;
	if (((T41*)(C))->a9) {
		t1 = (T2)('-');
		l1 = (T2f1(&t1));
		T17f46(GE_void(l1), ((T41*)(C))->a10);
	}
	t2 = (((T41*)(C))->a6?((m1 = ((T41*)(C))->a6, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f49(GE_void(l1), GE_ms8(", ", 2));
		}
		T17f46(GE_void(l1), (T2)('-'));
		T17f46(GE_void(l1), (T2)('-'));
		T17f49(GE_void(l1), m1);
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
T0* T39f16(T0* C)
{
	T2 t1;
	T1 t2;
	T0* m1 = 0;
	T0* R = 0;
	T0* l1 = 0;
	if (((T39*)(C))->a5) {
		t1 = (T2)('-');
		l1 = (T2f1(&t1));
		T17f46(GE_void(l1), ((T39*)(C))->a4);
	}
	t2 = (((T39*)(C))->a3?((m1 = ((T39*)(C))->a3, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f49(GE_void(l1), GE_ms8(", ", 2));
		}
		T17f46(GE_void(l1), (T2)('-'));
		T17f46(GE_void(l1), (T2)('-'));
		T17f49(GE_void(l1), m1);
	}
	{
		t2 = ((l1)!=(EIF_VOID));
		if (!(t2)) {
			GE_raise(GE_EX_CHECK);
		}		R = l1;
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.last_character */
T2 T838f6(T0* C)
{
	T6 t1;
	T1 t2;
	T2 R = 0;
	t1 = (((T1452*)(GE_void(((T838*)(C))->a3)))->a1);
	t2 = (T6f1(&t1, (T6)(GE_int32(0))));
	if (t2) {
		R = (T1452f4(GE_void(((T838*)(C))->a3)));
	} else {
		R = (((((T0*)(GE_void(((T838*)(C))->a4)))->id==27)?((T27*)(((T838*)(C))->a4))->a6:((T890*)(((T838*)(C))->a4))->a2));
	}
	return R;
}

/* DS_LINKED_QUEUE [CHARACTER_8].item */
T2 T1452f4(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T2 R = 0;
	{
		t1 = (((T1452*)(C))->a2?((m1 = ((T1452*)(C))->a2, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		R = (((T1632*)(m1))->a1);
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.end_of_input */
T1 T838f21(T0* C)
{
	T6 t1;
	T1 t2;
	T1 R = 0;
	t1 = (((T1452*)(GE_void(((T838*)(C))->a3)))->a1);
	t2 = (((((t1) == ((T6)(GE_int32(0)))))));
	if (t2) {
		R = (((((T0*)(GE_void(((T838*)(C))->a4)))->id==27)?T27f33(((T838*)(C))->a4):((T890*)(((T838*)(C))->a4))->a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* KL_TEXT_INPUT_FILE.end_of_input */
T1 T27f33(T0* C)
{
	T1 R = 0;
	R = ((T27*)(C))->a1;
	return R;
}

/* KL_STRING_INPUT_STREAM.is_closable */
T1 T890f7(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* KL_STDIN_FILE.is_closable */
T1 T879f12(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.is_closable */
T1 T838f7(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* KL_TEXT_INPUT_FILE.is_closable */
T1 T27f37(T0* C)
{
	T1 R = 0;
	R = (T27f14(C));
	return R;
}

/* KL_STRING_INPUT_STREAM.read_to_string */
T6 T890f8(T0* C, T0* a1, T6 a2, T6 a3)
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
		T890f10(C);
		t2 = ((T1)(!(((T890*)(C))->a1)));
		if (t2) {
			T17f71(GE_void(a1), ((T890*)(C))->a2, l1);
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

/* KL_STDIN_FILE.read_to_string */
T6 T879f18(T0* C, T0* a1, T6 a2, T6 a3)
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
	T0* l6 = 0;
	l2 = a2;
	l6 = ((T879*)(C))->a4;
	while (1) {
		t1 = (((((l1) == (a3)))));
		if (!(t1)) {
			t1 = (EIF_TRUE);
		}
		if (t1) {
			break;
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t2 = ((GE_void(l6), (T2)0));
		T17f71(GE_void(a1), t2, l2);
		l6 = ((GE_void(l6), (T0*)0));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
	}
	((T879*)(C))->a4 = l6;
	t1 = ((T1)((l1)<(a3)));
	if (t1) {
		t1 = (T879f22(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T879f9(C));
			t1 = (T127f1(GE_void(t3), a1, ge261ov30775));
			if (t1) {
				t4 = ((T6)((a3)-(l1)));
				t4 = (T879f11(C, a1, l2, t4));
				R = ((T6)((l1)+(t4)));
				T17f69(GE_void(a1), (T6)(GE_int32(0)));
			} else {
				l4 = ((T6)((a3)-(l1)));
				l5 = T17c44(l4);
				T17f61(GE_void(l5), l4);
				l4 = (T879f11(C, l5, (T6)(GE_int32(1)), l4));
				T17f69(GE_void(l5), (T6)(GE_int32(0)));
				l3 = (T6)(GE_int32(1));
				while (1) {
					t1 = (T6f1((&l3), l4));
					if (t1) {
						break;
					}
					t2 = (T17f10(GE_void(l5), l3));
					T17f71(GE_void(a1), t2, l2);
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
					l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
				}
				R = ((T6)((l1)+(l4)));
			}
		} else {
			R = l1;
		}
		((T879*)(C))->a1 = (T879f22(C));
	} else {
		R = l1;
	}
	return R;
}

/* KL_STDIN_FILE.old_read_to_string */
T6 T879f11(T0* C, T0* a1, T6 a2, T6 a3)
{
	T0* t1;
	T6 t2;
	T14 t3;
	T6 R = 0;
	t1 = (((T17*)(GE_void(a1)))->a1);
	t2 = ((T6)((a2)-((T6)(GE_int32(1)))));
	t3 = (T15f9(GE_void(t1), t2));
	R = (T879f14(C, ((T879*)(C))->a5, t3, a3));
	T17f69(GE_void(a1), (T6)(GE_int32(0)));
	return R;
}

/* KL_STDIN_FILE.file_gss */
T6 T879f14(T0* C, T14 a1, T14 a2, T6 a3)
{
	T6 R = 0;
	R = (T6)(EIF_INTEGER )eif_file_gss((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
	return R;
}

/* KL_STDIN_FILE.any_ */
T0* T879f9(T0* C)
{
	T0* R = 0;
	if (ge212os2138) {
		return ge212ov2138;
	} else {
		ge212os2138 = '\1';
		ge212ov2138 = R;
	}
	R = T127c3();
	ge212ov2138 = R;
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.read_to_string */
T6 T838f28(T0* C, T0* a1, T6 a2, T6 a3)
{
	T1 t1;
	T6 t2;
	T2 t3;
	T6 R = 0;
	t1 = (((((((T838*)(C))->a2) == ((T6)(GE_int32(6)))))));
	if (!(t1)) {
		t1 = (((((((T838*)(C))->a2) == ((T6)(GE_int32(2)))))));
	}
	if (!(t1)) {
		t2 = (((T1452*)(GE_void(((T838*)(C))->a3)))->a1);
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		T838f32(C);
		t1 = (T838f21(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T838f6(C));
			T17f71(GE_void(a1), t3, a2);
			R = (T6)(GE_int32(1));
		} else {
			R = (T6)(GE_int32(0));
		}
	} else {
		t1 = (((((((T838*)(C))->a2) == ((T6)(GE_int32(1)))))));
		if (t1) {
			R = (((((T0*)(GE_void(((T838*)(C))->a4)))->id==27)?T27f36(((T838*)(C))->a4, a1, a2, a3):T890f8(((T838*)(C))->a4, a1, a2, a3)));
		} else {
			R = (T838f28p1(C, a1, a2, a3));
		}
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.read_to_string */
T6 T838f28p1(T0* C, T0* a1, T6 a2, T6 a3)
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
		T838f32(C);
		t2 = (T838f21(C));
		t2 = ((T1)(!(t2)));
		if (t2) {
			t3 = (T838f6(C));
			T17f71(GE_void(a1), t3, l1);
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
T6 T27f36(T0* C, T0* a1, T6 a2, T6 a3)
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
	T0* l6 = 0;
	l1 = a2;
	l6 = ((T27*)(C))->a5;
	while (1) {
		t1 = (((((l5) == (a3)))));
		if (!(t1)) {
			t1 = ((l6)==(EIF_VOID));
		}
		if (t1) {
			break;
		}
		l5 = ((T6)((l5)+((T6)(GE_int32(1)))));
		t2 = (((T119*)(GE_void(l6)))->a1);
		T17f71(GE_void(a1), t2, l1);
		l6 = (((T119*)(GE_void(l6)))->a2);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	((T27*)(C))->a5 = l6;
	t1 = ((T1)((l5)<(a3)));
	if (t1) {
		t1 = (T27f25(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T27f39(C));
			t1 = (T127f1(GE_void(t3), a1, ge248ov2158));
			if (t1) {
				t4 = ((T6)((a3)-(l5)));
				t4 = (T27f35(C, a1, l1, t4));
				l5 = ((T6)((l5)+(t4)));
				T17f69(GE_void(a1), (T6)(GE_int32(0)));
			} else {
				t3 = (T27f39(C));
				t5 = (T27f41(C));
				t1 = (T127f1(GE_void(t3), a1, t5));
				if (t1) {
					t4 = ((T6)((a3)-(l5)));
					t4 = (T27f35(C, a1, l1, t4));
					l5 = ((T6)((l5)+(t4)));
					T17f69(GE_void(a1), (T6)(GE_int32(0)));
				} else {
					l4 = ((T6)((a3)-(l5)));
					l2 = T17c44(l4);
					T17f61(GE_void(l2), l4);
					l4 = (T27f35(C, l2, (T6)(GE_int32(1)), l4));
					T17f69(GE_void(l2), (T6)(GE_int32(0)));
					l3 = (T6)(GE_int32(1));
					while (1) {
						t1 = (T6f1((&l3), l4));
						if (t1) {
							break;
						}
						t2 = (T17f10(GE_void(l2), l3));
						T17f71(GE_void(a1), t2, l1);
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
					}
					l5 = ((T6)((l5)+(l4)));
				}
			}
		}
		((T27*)(C))->a1 = (T27f25(C));
	}
	R = l5;
	return R;
}

/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
unsigned char ge248os2159 = '\0';
T0* ge248ov2159;
T0* T27f41(T0* C)
{
	T0* R = 0;
	if (ge248os2159) {
		return ge248ov2159;
	} else {
		ge248os2159 = '\1';
		ge248ov2159 = R;
	}
	R = T845c9((T6)(GE_int32(0)));
	ge248ov2159 = R;
	return R;
}

/* KL_TEXT_INPUT_FILE.any_ */
T0* T27f39(T0* C)
{
	T0* R = 0;
	if (ge212os2138) {
		return ge212ov2138;
	} else {
		ge212os2138 = '\1';
		ge212ov2138 = R;
	}
	R = T127c3();
	ge212ov2138 = R;
	return R;
}

/* KL_STRING_INPUT_STREAM.name */
unsigned char ge263os2134 = '\0';
T0* ge263ov2134;
T0* T890f6(T0* C)
{
	T0* R = 0;
	if (ge263os2134) {
		return ge263ov2134;
	} else {
		ge263os2134 = '\1';
		ge263ov2134 = R;
	}
	R = GE_ms8("STRING", 6);
	ge263ov2134 = R;
	return R;
}

/* KL_STDIN_FILE.name */
T0* T879f15(T0* C)
{
	T0* R = 0;
	R = (T17f20(GE_void(((T879*)(C))->a3)));
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.name */
T0* T838f5(T0* C)
{
	T0* R = 0;
	R = (((((T0*)(GE_void(((T838*)(C))->a4)))->id==27)?((T27*)(((T838*)(C))->a4))->a4:T890f6(((T838*)(C))->a4)));
	return R;
}

/* ET_LACE_SYSTEM.stop_requested */
T1 T68f154(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	t1 = (((T68*)(C))->a6?((m1 = ((T68*)(C))->a6, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = ((m1, GE_mt187(), (T1)0));
	}
	return R;
}

/* ET_ECF_SYSTEM.stop_requested */
T1 T62f155(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	t1 = (((T62*)(C))->a11?((m1 = ((T62*)(C))->a11, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = ((m1, GE_mt187(), (T1)0));
	}
	return R;
}

/* ET_XACE_SYSTEM.stop_requested */
T1 T59f169(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	t1 = (((T59*)(C))->a6?((m1 = ((T59*)(C))->a6, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = ((m1, GE_mt187(), (T1)0));
	}
	return R;
}

/* ET_LACE_SYSTEM.dotnet_assembly_consumer */
T0* T68f155(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* R = 0;
	t1 = (((T68*)(C))->a136?((m1 = ((T68*)(C))->a136, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = m1;
	} else {
		R = T779c3(C);
		((T68*)(C))->a136 = R;
	}
	return R;
}

/* ET_DOTNET_ASSEMBLY_CLASSIC_CONSUMER.make */
T0* T779c3(T0* a1)
{
	T0* C;
	C = GE_new779(EIF_TRUE);
	((T779*)(C))->a1 = a1;
	return C;
}

/* ET_ECF_SYSTEM.dotnet_assembly_consumer */
T0* T62f174(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* R = 0;
	t1 = (((T62*)(C))->a143?((m1 = ((T62*)(C))->a143, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = m1;
	} else {
		R = T779c3(C);
		((T62*)(C))->a143 = R;
	}
	return R;
}

/* ET_XACE_SYSTEM.dotnet_assembly_consumer */
T0* T59f161(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* R = 0;
	t1 = (((T59*)(C))->a138?((m1 = ((T59*)(C))->a138, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = m1;
	} else {
		R = T779c3(C);
		((T59*)(C))->a138 = R;
	}
	return R;
}

/* ET_SYSTEM.dotnet_assembly_consumer */
T0* T31f145(T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* R = 0;
	t1 = (((T31*)(C))->a120?((m1 = ((T31*)(C))->a120, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = m1;
	} else {
		R = T779c3(C);
		((T31*)(C))->a120 = R;
	}
	return R;
}

/* ET_LACE_SYSTEM.older_or_same_ise_version */
T1 T68f174(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	t1 = (((T68*)(C))->a30?((m1 = ((T68*)(C))->a30, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = (T76f15(m1, a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_ECF_SYSTEM.older_or_same_ise_version */
T1 T62f181(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	t1 = (((T62*)(C))->a35?((m1 = ((T62*)(C))->a35, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = (T76f15(m1, a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_XACE_SYSTEM.older_or_same_ise_version */
T1 T59f178(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	t1 = (((T59*)(C))->a30?((m1 = ((T59*)(C))->a30, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = (T76f15(m1, a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_SYSTEM.older_or_same_ise_version */
T1 T31f151(T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	t1 = (((T31*)(C))->a113?((m1 = ((T31*)(C))->a113, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = ((m1, a1, (T1)0));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LACE_SYSTEM.is_ise */
T1 T68f172(T0* C)
{
	T1 R = 0;
	R = ((((T68*)(C))->a30)!=(EIF_VOID));
	return R;
}

/* ET_ECF_SYSTEM.is_ise */
T1 T62f164(T0* C)
{
	T1 R = 0;
	R = ((((T62*)(C))->a35)!=(EIF_VOID));
	return R;
}

/* ET_XACE_SYSTEM.is_ise */
T1 T59f154(T0* C)
{
	T1 R = 0;
	R = ((((T59*)(C))->a30)!=(EIF_VOID));
	return R;
}

/* ET_SYSTEM.is_ise */
T1 T31f148(T0* C)
{
	T1 R = 0;
	R = (EIF_FALSE);
	return R;
}

T0* GE_ma705(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new704(c, EIF_FALSE);
	*(T704*)t1 = GE_default704;
	((T704*)(t1))->a2 = c;
	((T704*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T704*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new705(EIF_TRUE);
	((T705*)(R))->a1 = t1;
	((T705*)(R))->a2 = 1;
	((T705*)(R))->a3 = c;
	return R;
}

T0* GE_ma135(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new134(c, EIF_FALSE);
	*(T134*)t1 = GE_default134;
	((T134*)(t1))->a2 = c;
	((T134*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T134*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new135(EIF_TRUE);
	((T135*)(R))->a1 = t1;
	((T135*)(R))->a2 = 1;
	((T135*)(R))->a3 = c;
	return R;
}

T0* GE_ma512(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new165(c, EIF_FALSE);
	*(T165*)t1 = GE_default165;
	((T165*)(t1))->a2 = c;
	((T165*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T6 *i = ((T165*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T6);
		}
		va_end(v);
	}
	R = GE_new512(EIF_TRUE);
	((T512*)(R))->a1 = t1;
	((T512*)(R))->a2 = 1;
	((T512*)(R))->a3 = c;
	return R;
}

T0* GE_ma548(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new547(c, EIF_FALSE);
	*(T547*)t1 = GE_default547;
	((T547*)(t1))->a2 = c;
	((T547*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T547*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new548(EIF_TRUE);
	((T548*)(R))->a1 = t1;
	((T548*)(R))->a2 = 1;
	((T548*)(R))->a3 = c;
	return R;
}

T0* GE_ma1719(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new734(c, EIF_FALSE);
	*(T734*)t1 = GE_default734;
	((T734*)(t1))->a2 = c;
	((T734*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T734*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new1719(EIF_TRUE);
	((T1719*)(R))->a1 = t1;
	((T1719*)(R))->a2 = 1;
	((T1719*)(R))->a3 = c;
	return R;
}

T0* GE_mt24(T6 a1, T6 a2, T6 a3, T0* a4, T0* a5, T0* a6, T0* a7, T0* a8, T0* a9, T6 a10, T1 a11)
{
	T0* R;
	R = GE_new24(EIF_TRUE);
	((T24*)(R))->z1 = a1;
	((T24*)(R))->z2 = a2;
	((T24*)(R))->z3 = a3;
	((T24*)(R))->z4 = a4;
	((T24*)(R))->z5 = a5;
	((T24*)(R))->z6 = a6;
	((T24*)(R))->z7 = a7;
	((T24*)(R))->z8 = a8;
	((T24*)(R))->z9 = a9;
	((T24*)(R))->z10 = a10;
	((T24*)(R))->z11 = a11;
	return R;
}

T0* GE_mt187()
{
	T0* R;
	R = GE_new187(EIF_TRUE);
	return R;
}

T0* GE_mt470(T0* a1)
{
	T0* R;
	R = GE_new470(EIF_TRUE);
	((T470*)(R))->z1 = a1;
	return R;
}

T0* ge260ov12227;
T0* ge224ov3558;
T0* ge164ov4643;
T0* ge324ov30590;
T0* ge314ov13885;
T0* ge262ov12227;
T0* ge1017ov8210;
T0* ge1017ov8217;
T0* ge1017ov8216;
T0* ge1017ov8215;
T0* ge246ov2179;
T0* ge247ov12284;
T0* ge1017ov8211;
T0* ge1017ov8213;
T0* ge1017ov8180;
T0* ge245ov19375;
T0* ge245ov19376;
T0* ge1715ov18399;
T0* ge1715ov18384;
T0* ge1715ov18377;
T0* ge1715ov18362;
T0* ge1715ov18387;
T0* ge1715ov18380;
T0* ge1715ov18388;
T0* ge1715ov18397;
T0* ge1715ov18390;
T0* ge1715ov18386;
T0* ge1715ov18374;
T0* ge1715ov18375;
T0* ge1715ov18389;
T0* ge1715ov18376;
T0* ge1715ov18363;
T0* ge1715ov18364;
T0* ge1715ov18365;
T0* ge1715ov18371;
T0* ge1715ov18373;
T0* ge1715ov18368;
T0* ge1715ov18393;
T0* ge1715ov18392;
T0* ge1715ov18369;
T0* ge1715ov18370;
T0* ge1715ov18367;
T0* ge1715ov18366;
T0* ge1711ov18154;
T0* ge1017ov8212;
T0* ge1017ov8214;
T0* ge1017ov8062;
T0* ge1017ov8098;
T0* ge1017ov8071;
T0* ge1017ov8066;
T0* ge1017ov8097;
T0* ge1010ov27147;
T0* ge1010ov27146;
T0* ge1010ov27145;
T0* ge808ov11545;
T0* ge808ov11459;
T0* ge808ov11678;
T0* ge1017ov8135;
T0* ge1017ov8150;
T0* ge1017ov8099;
T0* ge1017ov8171;
T0* ge1017ov8178;
T0* ge1017ov8103;
T0* ge1017ov8105;
T0* ge1017ov8195;
T0* ge1017ov8128;
T0* ge1017ov8121;
T0* ge1017ov8057;
T0* ge1017ov8174;
T0* ge1017ov8119;
T0* ge808ov11649;
T0* ge808ov11669;
T0* ge1017ov8172;
T0* ge1017ov8107;
T0* ge1017ov8100;
T0* ge1017ov8173;
T0* ge1017ov8072;
T0* ge1017ov8182;
T0* ge1017ov8206;
T0* ge1017ov8123;
T0* ge1017ov8125;
T0* ge1017ov8124;
T0* ge1017ov8199;
T0* ge1017ov8059;
T0* ge1017ov8126;
T0* ge1017ov8177;
T0* ge1017ov8104;
T0* ge1017ov8176;
T0* ge1017ov8189;
T0* ge1017ov8196;
T0* ge1017ov8179;
T0* ge1017ov8114;
T0* ge1017ov8115;
T0* ge1017ov8190;
T0* ge1017ov8110;
T0* ge808ov11652;
T0* ge1017ov8145;
T0* ge1017ov8118;
T0* ge1017ov8142;
T0* ge1017ov8120;
T0* ge1017ov8055;
T0* ge1017ov8058;
T0* ge1017ov8061;
T0* ge1017ov8083;
T0* ge1017ov8127;
T0* ge1017ov8152;
T0* ge1017ov8111;
T0* ge1017ov8197;
T0* ge1017ov8144;
T0* ge1017ov8143;
T0* ge1017ov8202;
T0* ge1017ov8154;
T0* ge1017ov8132;
T0* ge1017ov8101;
T0* ge1017ov8129;
T0* ge1017ov8153;
T0* ge1017ov8063;
T0* ge1017ov8161;
T0* ge1017ov8167;
T0* ge1017ov8160;
T0* ge1017ov8166;
T0* ge1017ov8159;
T0* ge1017ov8165;
T0* ge1017ov8158;
T0* ge1017ov8164;
T0* ge1017ov8157;
T0* ge1017ov8163;
T0* ge1017ov8156;
T0* ge1017ov8162;
T0* ge1017ov8136;
T0* ge1017ov8122;
T0* ge1017ov8060;
T0* ge1017ov8069;
T0* ge1017ov8093;
T0* ge1017ov8091;
T0* ge1017ov8082;
T0* ge1017ov8081;
T0* ge1017ov8080;
T0* ge1017ov8079;
T0* ge1017ov8078;
T0* ge1017ov8076;
T0* ge1017ov8094;
T0* ge1017ov8068;
T0* ge1017ov8065;
T0* ge1017ov8108;
T0* ge1017ov8151;
T0* ge1017ov8137;
T0* ge1017ov8117;
T0* ge1017ov8116;
T0* ge1017ov8188;
T0* ge1017ov8194;
T0* ge1017ov8191;
T0* ge1017ov8192;
T0* ge1017ov8056;
T0* ge1017ov8193;
T0* ge1017ov8106;
T0* ge808ov11431;
T0* ge1017ov8181;
T0* ge1017ov8112;
T0* ge1017ov8113;
T0* ge1017ov8155;
T0* ge1017ov8064;
T0* ge1017ov8203;
T0* ge1017ov8198;
T0* ge1017ov8073;
T0* ge1017ov8187;
T0* ge1017ov8089;
T0* ge1017ov8088;
T0* ge1017ov8087;
T0* ge1017ov8086;
T0* ge1017ov8077;
T0* ge1017ov8075;
T0* ge1017ov8074;
T0* ge1017ov8070;
T0* ge808ov11394;
T0* ge1017ov8092;
T0* ge808ov11421;
T0* ge1017ov8085;
T0* ge808ov11411;
T0* ge808ov11400;
T0* ge1017ov8102;
T0* ge808ov11434;
T0* ge1017ov8067;
T0* ge808ov11390;
T0* ge808ov11408;
T0* ge808ov11407;
T0* ge808ov11393;
T0* ge808ov11429;
T0* ge808ov11385;
T0* ge808ov11387;
T0* ge808ov11433;
T0* ge808ov11432;
T0* ge808ov11425;
T0* ge808ov11424;
T0* ge808ov11420;
T0* ge808ov11419;
T0* ge808ov11398;
T0* ge808ov11418;
T0* ge808ov11423;
T0* ge808ov11422;
T0* ge808ov11415;
T0* ge808ov11414;
T0* ge808ov11413;
T0* ge808ov11412;
T0* ge808ov11404;
T0* ge808ov11403;
T0* ge808ov11402;
T0* ge808ov11401;
T0* ge808ov11392;
T0* ge808ov11391;
T0* ge808ov11389;
T0* ge808ov11667;
T0* ge808ov11435;
T0* ge1016ov28151;
T0* ge1016ov27871;
T0* ge1016ov27701;
T0* ge1014ov27135;
T0* ge1014ov27129;
T0* ge1014ov27123;
T0* ge1014ov27131;
T0* ge1014ov27125;
T0* ge1014ov27119;
T0* ge1014ov27134;
T0* ge1014ov27128;
T0* ge1014ov27122;
T0* ge1014ov27136;
T0* ge1014ov27130;
T0* ge1014ov27124;
T0* ge808ov11478;
T0* ge1014ov27133;
T0* ge1014ov27127;
T0* ge1014ov27121;
T0* ge1016ov28172;
T0* ge1016ov27887;
T0* ge1016ov27722;
T0* ge808ov11610;
T0* ge808ov11539;
T0* ge808ov11469;
T0* ge808ov11636;
T0* ge808ov11575;
T0* ge808ov11647;
T0* ge808ov11549;
T0* ge808ov11438;
T0* ge808ov11460;
T0* ge1016ov28171;
T0* ge1016ov27886;
T0* ge1016ov27721;
T0* ge1016ov28169;
T0* ge1016ov27884;
T0* ge1016ov27719;
T0* ge1016ov28170;
T0* ge1016ov27885;
T0* ge1016ov27720;
T0* ge808ov11475;
T0* ge1014ov27132;
T0* ge1014ov27126;
T0* ge1014ov27120;
T0* ge808ov11673;
T0* ge808ov11795;
T0* ge808ov11779;
T0* ge808ov11426;
T0* ge808ov11427;
T0* ge808ov11792;
T0* ge808ov11793;
T0* ge808ov11786;
T0* ge808ov11789;
T0* ge808ov11781;
T0* ge808ov11784;
T0* ge808ov11780;
T0* ge808ov11794;
T0* ge808ov11777;
T0* ge808ov11778;
T0* ge808ov11695;
T0* ge808ov11674;
T0* ge808ov11430;
T0* ge808ov11691;
T0* ge808ov11428;
T0* ge808ov11416;
T0* ge808ov11405;
T0* ge808ov11396;
T0* ge808ov11395;
T0* ge1108ov5807;
T0* ge1105ov15697;
T0* ge1105ov15609;
T0* ge1105ov15747;
T0* ge1105ov15659;
T0* ge265ov12328;
T0* ge268ov12328;
T0* ge1108ov5814;
T0* ge1108ov5787;
T0* ge1097ov6056;
T0* ge1097ov6057;
T0* ge1105ov15746;
T0* ge1105ov15658;
T0* ge1108ov5810;
T0* ge1108ov5794;
T0* ge1108ov5808;
T0* ge1108ov5789;
T0* ge1105ov15740;
T0* ge1105ov15652;
T0* ge1105ov15739;
T0* ge1105ov15651;
T0* ge1105ov15748;
T0* ge1105ov15660;
T0* ge1108ov5772;
T0* ge1108ov5799;
T0* ge1108ov5788;
T0* ge1108ov5769;
T0* ge1108ov5785;
T0* ge1108ov5781;
T0* ge1108ov5782;
T0* ge1108ov5783;
T0* ge1108ov5805;
T0* ge1108ov5812;
T0* ge1108ov5806;
T0* ge1108ov5798;
T0* ge1108ov5811;
T0* ge1105ov15784;
T0* ge1105ov15696;
T0* ge1105ov15783;
T0* ge1105ov15695;
T0* ge1105ov15782;
T0* ge1105ov15694;
T0* ge1105ov15781;
T0* ge1105ov15693;
T0* ge1105ov15744;
T0* ge1105ov15656;
T0* ge1105ov15743;
T0* ge1105ov15655;
T0* ge1105ov15742;
T0* ge1105ov15654;
T0* ge1105ov15741;
T0* ge1105ov15653;
T0* ge1108ov5768;
T0* ge1108ov5771;
T0* ge1108ov5784;
T0* ge1105ov15752;
T0* ge1105ov15664;
T0* ge1105ov15751;
T0* ge1105ov15663;
T0* ge1105ov15750;
T0* ge1105ov15662;
T0* ge1105ov15749;
T0* ge1105ov15661;
T0* ge1111ov5767;
T0* ge1111ov5766;
T0* ge1108ov5796;
T0* ge1108ov5775;
T0* ge1108ov5800;
T0* ge1108ov5770;
T0* ge1108ov5793;
T0* ge1108ov5774;
T0* ge1108ov5777;
T0* ge1108ov5778;
T0* ge1108ov5776;
T0* ge1108ov5813;
T0* ge1108ov5790;
T0* ge1108ov5791;
T0* ge1108ov5809;
T0* ge1108ov5773;
T0* ge1108ov5792;
T0* ge1105ov15733;
T0* ge1105ov15645;
T0* ge1105ov15732;
T0* ge1105ov15644;
T0* ge1105ov15731;
T0* ge1105ov15643;
T0* ge1105ov15730;
T0* ge1105ov15642;
T0* ge1105ov15729;
T0* ge1105ov15641;
T0* ge1108ov5780;
T0* ge1105ov15715;
T0* ge1105ov15627;
T0* ge1105ov15716;
T0* ge1105ov15628;
T0* ge1105ov15714;
T0* ge1105ov15626;
T0* ge1105ov15713;
T0* ge1105ov15625;
T0* ge1105ov15712;
T0* ge1105ov15624;
T0* ge1105ov15711;
T0* ge1105ov15623;
T0* ge1105ov15720;
T0* ge1105ov15632;
T0* ge1105ov15719;
T0* ge1105ov15631;
T0* ge1105ov15718;
T0* ge1105ov15630;
T0* ge1105ov15717;
T0* ge1105ov15629;
T0* ge1105ov15780;
T0* ge1105ov15692;
T0* ge1105ov15779;
T0* ge1105ov15691;
T0* ge1105ov15778;
T0* ge1105ov15690;
T0* ge1105ov15777;
T0* ge1105ov15689;
T0* ge1105ov15722;
T0* ge1105ov15634;
T0* ge1105ov15721;
T0* ge1105ov15633;
T0* ge1105ov15704;
T0* ge1105ov15616;
T0* ge1105ov15705;
T0* ge1105ov15617;
T0* ge1105ov15703;
T0* ge1105ov15615;
T0* ge1105ov15702;
T0* ge1105ov15614;
T0* ge1105ov15725;
T0* ge1105ov15637;
T0* ge1105ov15726;
T0* ge1105ov15638;
T0* ge1105ov15724;
T0* ge1105ov15636;
T0* ge1105ov15723;
T0* ge1105ov15635;
T0* ge1105ov15763;
T0* ge1105ov15675;
T0* ge1105ov15762;
T0* ge1105ov15674;
T0* ge1105ov15761;
T0* ge1105ov15673;
T0* ge1105ov15760;
T0* ge1105ov15672;
T0* ge1105ov15759;
T0* ge1105ov15671;
T0* ge1105ov15758;
T0* ge1105ov15670;
T0* ge1108ov5779;
T0* ge1108ov5786;
T0* ge1108ov5802;
T0* ge1108ov5801;
T0* ge1108ov5804;
T0* ge1108ov5797;
T0* ge1108ov5795;
T0* ge1105ov15768;
T0* ge1105ov15680;
T0* ge1105ov15767;
T0* ge1105ov15679;
T0* ge1105ov15766;
T0* ge1105ov15678;
T0* ge1105ov15765;
T0* ge1105ov15677;
T0* ge1105ov15764;
T0* ge1105ov15676;
T0* ge1105ov15772;
T0* ge1105ov15684;
T0* ge1105ov15776;
T0* ge1105ov15688;
T0* ge1105ov15775;
T0* ge1105ov15687;
T0* ge1105ov15774;
T0* ge1105ov15686;
T0* ge1105ov15773;
T0* ge1105ov15685;
T0* ge1105ov15771;
T0* ge1105ov15683;
T0* ge1105ov15701;
T0* ge1105ov15613;
T0* ge1105ov15700;
T0* ge1105ov15612;
T0* ge1105ov15699;
T0* ge1105ov15611;
T0* ge1105ov15698;
T0* ge1105ov15610;
T0* ge1108ov5803;
T0* ge1105ov15770;
T0* ge1105ov15682;
T0* ge1105ov15757;
T0* ge1105ov15669;
T0* ge1105ov15756;
T0* ge1105ov15668;
T0* ge1105ov15754;
T0* ge1105ov15666;
T0* ge1105ov15755;
T0* ge1105ov15667;
T0* ge1105ov15753;
T0* ge1105ov15665;
T0* ge1105ov15769;
T0* ge1105ov15681;
T0* ge1105ov15710;
T0* ge1105ov15622;
T0* ge1105ov15709;
T0* ge1105ov15621;
T0* ge1105ov15707;
T0* ge1105ov15619;
T0* ge1105ov15708;
T0* ge1105ov15620;
T0* ge1105ov15706;
T0* ge1105ov15618;
T0* ge1105ov15728;
T0* ge1105ov15640;
T0* ge1105ov15727;
T0* ge1105ov15639;
T0* ge1105ov15737;
T0* ge1105ov15649;
T0* ge1105ov15736;
T0* ge1105ov15648;
T0* ge1105ov15738;
T0* ge1105ov15650;
T0* ge1105ov15745;
T0* ge1105ov15657;
T0* ge1097ov6061;
T0* ge1097ov6060;
T0* ge1105ov15735;
T0* ge1105ov15647;
T0* ge1105ov15734;
T0* ge1105ov15646;
T0* ge1286ov14736;
T0* ge1286ov14698;
T0* ge1286ov14696;
T0* ge1286ov14737;
T0* ge1286ov14709;
T0* ge1286ov14708;
T0* ge1286ov14719;
T0* ge1286ov14713;
T0* ge1286ov14712;
T0* ge1286ov14711;
T0* ge1286ov14717;
T0* ge1286ov14716;
T0* ge1286ov14718;
T0* ge1286ov14695;
T0* ge1286ov14721;
T0* ge1286ov14730;
T0* ge1289ov14550;
T0* ge1289ov14548;
T0* ge1289ov14549;
T0* ge1286ov14731;
T0* ge1286ov14732;
T0* ge1286ov14735;
T0* ge1286ov14733;
T0* ge1286ov14734;
T0* ge1286ov14728;
T0* ge1282ov28945;
T0* ge1282ov28946;
T0* ge1286ov14701;
T0* ge1286ov14724;
T0* ge1279ov14184;
T0* ge1279ov14183;
T0* ge1286ov14744;
T0* ge1286ov14745;
T0* ge1286ov14746;
T0* ge1286ov14739;
T0* ge1286ov14722;
T0* ge1286ov14723;
T0* ge1286ov14725;
T0* ge1286ov14729;
T0* ge265ov12329;
T0* ge253ov12604;
T0* ge253ov12603;
T0* ge268ov12329;
T0* ge1236ov14047;
T0* ge1126ov4787;
T0* ge1126ov4788;
T0* ge1126ov4789;
T0* ge1126ov4790;
T0* ge1126ov4791;
T0* ge1126ov4792;
T0* ge1126ov4793;
T0* ge1126ov4794;
T0* ge1126ov4795;
T0* ge1126ov4796;
T0* ge1126ov4797;
T0* ge1126ov4798;
T0* ge1126ov4799;
T0* ge1126ov4800;
T0* ge1126ov4801;
T0* ge1126ov4802;
T0* ge1126ov4803;
T0* ge1126ov4804;
T0* ge1126ov4805;
T0* ge1126ov4806;
T0* ge1126ov4807;
T0* ge1126ov4808;
T0* ge1126ov4809;
T0* ge1126ov4810;
T0* ge1126ov4811;
T0* ge1126ov4812;
T0* ge1126ov4813;
T0* ge1126ov4814;
T0* ge1126ov4815;
T0* ge1126ov4816;
T0* ge1126ov4817;
T0* ge1126ov4818;
T0* ge1126ov4819;
T0* ge1126ov4820;
T0* ge1126ov4821;
T0* ge1126ov4822;
T0* ge1126ov4823;
T0* ge1126ov4824;
T0* ge1126ov4825;
T0* ge1126ov4826;
T0* ge1126ov4827;
T0* ge1126ov4828;
T0* ge1126ov4829;
T0* ge1126ov4830;
T0* ge1126ov4831;
T0* ge1126ov4832;
T0* ge1126ov4833;
T0* ge1126ov4834;
T0* ge1126ov4835;
T0* ge1126ov4836;
T0* ge1126ov4837;
T0* ge1126ov4838;
T0* ge1126ov4839;
T0* ge1126ov4840;
T0* ge1126ov4841;
T0* ge1126ov4842;
T0* ge1126ov4843;
T0* ge1126ov4844;
T0* ge1126ov4845;
T0* ge1126ov4846;
T0* ge1126ov4847;
T0* ge1126ov4848;
T0* ge1126ov4849;
T0* ge1126ov4850;
T0* ge1126ov4851;
T0* ge1126ov4852;
T0* ge1126ov4853;
T0* ge1126ov4854;
T0* ge1126ov4855;
T0* ge1126ov4856;
T0* ge1126ov4857;
T0* ge1126ov4858;
T0* ge1126ov4859;
T0* ge1126ov4860;
T0* ge1126ov4861;
T0* ge1126ov4862;
T0* ge1126ov4863;
T0* ge1126ov4864;
T0* ge1126ov4865;
T0* ge1126ov4866;
T0* ge1126ov4867;
T0* ge1126ov4868;
T0* ge1126ov4869;
T0* ge1126ov4870;
T0* ge1126ov4871;
T0* ge1126ov4872;
T0* ge1126ov4873;
T0* ge1126ov4874;
T0* ge1126ov4875;
T0* ge1126ov4876;
T0* ge1126ov4877;
T0* ge1126ov4878;
T0* ge1126ov4879;
T0* ge1126ov4880;
T0* ge1126ov4881;
T0* ge1126ov4882;
T0* ge1126ov4983;
T0* ge1126ov4995;
T0* ge1157ov4754;
T0* ge1126ov5006;
T0* ge1126ov4991;
T0* ge1126ov4996;
T0* ge1126ov4997;
T0* ge1126ov4998;
T0* ge1126ov4984;
T0* ge1126ov5002;
T0* ge1126ov5009;
T0* ge1126ov4989;
T0* ge1126ov4980;
T0* ge1126ov5005;
T0* ge1126ov4987;
T0* ge1126ov4992;
T0* ge1126ov4990;
T0* ge1126ov4986;
T0* ge1126ov5001;
T0* ge1126ov5003;
T0* ge1126ov5011;
T0* ge1126ov5008;
T0* ge1126ov5000;
T0* ge1126ov4982;
T0* ge1126ov5007;
T0* ge1126ov4981;
T0* ge1126ov4988;
T0* ge1126ov5004;
T0* ge1126ov4999;
T0* ge1126ov4993;
T0* ge1126ov4985;
T0* ge1126ov5013;
T0* ge1126ov4994;
T0* ge1126ov5010;
T0* ge1157ov4753;
T0* ge1157ov4752;
T0* ge1116ov22076;
T0* ge1122ov14434;
T0* ge1322ov5637;
T0* ge9ov4625;
T0* ge9ov4632;
T0* ge7ov4688;
T0* ge284ov1975;
T0* ge6ov4262;
T0* ge9ov4628;
T0* ge9ov4635;
T0* ge9ov4626;
T0* ge9ov4633;
T0* ge9ov4627;
T0* ge9ov4634;
T0* ge9ov4629;
T0* ge9ov4636;
T0* ge9ov4630;
T0* ge9ov4637;
T0* ge6ov4257;
T0* ge6ov4256;
T0* ge6ov4264;
T0* ge6ov4263;
T0* ge1165ov3020;
T0* ge1165ov3018;
T0* ge1293ov28515;
T0* ge1293ov28516;
T0* ge1284ov30598;
T0* ge1284ov30600;
T0* ge808ov11410;
T0* ge1006ov37533;
T0* ge1006ov37531;
T0* ge1006ov37529;
T0* ge903ov17639;
T0* ge896ov26943;
T0* ge871ov32479;
T0* ge892ov26935;
T0* ge1016ov28124;
T0* ge1016ov27857;
T0* ge1016ov27674;
T0* ge1016ov28125;
T0* ge1016ov27675;
T0* ge1016ov28024;
T0* ge1016ov27805;
T0* ge1016ov27574;
T0* ge808ov11664;
T0* ge1016ov27938;
T0* ge1016ov27767;
T0* ge1016ov27488;
T0* ge1016ov27939;
T0* ge1016ov27489;
T0* ge1016ov27922;
T0* ge1016ov27760;
T0* ge1016ov27472;
T0* ge1016ov27921;
T0* ge1016ov27471;
T0* ge1016ov27923;
T0* ge1016ov27473;
T0* ge1016ov27947;
T0* ge1016ov27771;
T0* ge1016ov27497;
T0* ge1016ov27936;
T0* ge1016ov27486;
T0* ge1016ov27937;
T0* ge1016ov27487;
T0* ge1016ov28056;
T0* ge1016ov27822;
T0* ge1016ov27606;
T0* ge1016ov28055;
T0* ge1016ov27605;
T0* ge1016ov28057;
T0* ge1016ov27823;
T0* ge1016ov27607;
T0* ge1016ov27951;
T0* ge1016ov27773;
T0* ge1016ov27501;
T0* ge1016ov27957;
T0* ge1016ov27777;
T0* ge1016ov27507;
T0* ge1016ov28048;
T0* ge1016ov27818;
T0* ge1016ov27598;
T0* ge1016ov28031;
T0* ge1016ov27808;
T0* ge1016ov27581;
T0* ge1016ov28058;
T0* ge1016ov27824;
T0* ge1016ov27608;
T0* ge1016ov27954;
T0* ge1016ov27775;
T0* ge1016ov27504;
T0* ge1016ov27961;
T0* ge1016ov27780;
T0* ge1016ov27511;
T0* ge1016ov28049;
T0* ge1016ov27819;
T0* ge1016ov27599;
T0* ge1016ov28047;
T0* ge1016ov27817;
T0* ge1016ov27597;
T0* ge1016ov28032;
T0* ge1016ov27809;
T0* ge1016ov27582;
T0* ge1016ov28050;
T0* ge1016ov27820;
T0* ge1016ov27600;
T0* ge808ov11662;
T0* ge808ov11500;
T0* ge808ov11436;
T0* ge808ov11567;
T0* ge808ov11483;
T0* ge1016ov28173;
T0* ge1016ov27888;
T0* ge1016ov27723;
T0* ge808ov11528;
T0* ge808ov11474;
T0* ge1016ov28020;
T0* ge1016ov27804;
T0* ge1016ov27570;
T0* ge1016ov28021;
T0* ge1016ov27571;
T0* ge1016ov28012;
T0* ge1016ov27801;
T0* ge1016ov27562;
T0* ge1016ov28023;
T0* ge1016ov27573;
T0* ge1016ov28022;
T0* ge1016ov27572;
T0* ge1016ov28019;
T0* ge1016ov27803;
T0* ge1016ov27569;
T0* ge1016ov27984;
T0* ge1016ov27789;
T0* ge1016ov27534;
T0* ge1016ov27983;
T0* ge1016ov27788;
T0* ge1016ov27533;
T0* ge1016ov27982;
T0* ge1016ov27787;
T0* ge1016ov27532;
T0* ge1016ov27981;
T0* ge1016ov27786;
T0* ge1016ov27531;
T0* ge1016ov27980;
T0* ge1016ov27530;
T0* ge1016ov27910;
T0* ge1016ov27756;
T0* ge1016ov27460;
T0* ge1016ov27908;
T0* ge1016ov27755;
T0* ge1016ov27458;
T0* ge1016ov27990;
T0* ge1016ov27790;
T0* ge1016ov27540;
T0* ge1016ov27987;
T0* ge1016ov27537;
T0* ge1016ov27998;
T0* ge1016ov27792;
T0* ge1016ov27548;
T0* ge1016ov27994;
T0* ge1016ov27791;
T0* ge1016ov27544;
T0* ge1016ov27991;
T0* ge1016ov27541;
T0* ge1016ov27988;
T0* ge1016ov27538;
T0* ge1016ov27999;
T0* ge1016ov27549;
T0* ge1016ov27995;
T0* ge1016ov27545;
T0* ge1016ov27992;
T0* ge1016ov27542;
T0* ge1016ov27989;
T0* ge1016ov27539;
T0* ge1016ov28000;
T0* ge1016ov27550;
T0* ge1016ov27996;
T0* ge1016ov27546;
T0* ge1016ov28113;
T0* ge1016ov27852;
T0* ge1016ov27663;
T0* ge1016ov28006;
T0* ge1016ov27796;
T0* ge1016ov27556;
T0* ge1016ov28005;
T0* ge1016ov27555;
T0* ge1016ov27986;
T0* ge1016ov27536;
T0* ge1016ov27985;
T0* ge1016ov27535;
T0* ge1016ov27997;
T0* ge1016ov27547;
T0* ge1016ov27993;
T0* ge1016ov27543;
T0* ge1016ov28004;
T0* ge1016ov27795;
T0* ge1016ov27554;
T0* ge1016ov28003;
T0* ge1016ov27794;
T0* ge1016ov27553;
T0* ge1016ov28002;
T0* ge1016ov27793;
T0* ge1016ov27552;
T0* ge1016ov28102;
T0* ge1016ov27846;
T0* ge1016ov27652;
T0* ge1016ov28100;
T0* ge1016ov27845;
T0* ge1016ov27650;
T0* ge1016ov27925;
T0* ge1016ov27761;
T0* ge1016ov27475;
T0* ge1016ov28054;
T0* ge1016ov27821;
T0* ge1016ov27604;
T0* ge1016ov27924;
T0* ge1016ov27474;
T0* ge1016ov28053;
T0* ge1016ov27603;
T0* ge1016ov28052;
T0* ge1016ov27602;
T0* ge1016ov27955;
T0* ge1016ov27776;
T0* ge1016ov27505;
T0* ge1016ov27953;
T0* ge1016ov27774;
T0* ge1016ov27503;
T0* ge1016ov27952;
T0* ge1016ov27502;
T0* ge1016ov27959;
T0* ge1016ov27778;
T0* ge1016ov27509;
T0* ge1016ov27958;
T0* ge1016ov27508;
T0* ge1016ov27960;
T0* ge1016ov27779;
T0* ge1016ov27510;
T0* ge1016ov28036;
T0* ge1016ov27810;
T0* ge1016ov27586;
T0* ge1016ov28035;
T0* ge1016ov27585;
T0* ge1016ov28001;
T0* ge1016ov27551;
T0* ge1016ov28034;
T0* ge1016ov27584;
T0* ge1016ov28033;
T0* ge1016ov27583;
T0* ge1016ov28037;
T0* ge1016ov27811;
T0* ge1016ov27587;
T0* ge1016ov27941;
T0* ge1016ov27768;
T0* ge1016ov27491;
T0* ge1016ov27940;
T0* ge1016ov27490;
T0* ge1016ov27946;
T0* ge1016ov27496;
T0* ge1016ov27943;
T0* ge1016ov27769;
T0* ge1016ov27493;
T0* ge1016ov27944;
T0* ge1016ov27494;
T0* ge1016ov28051;
T0* ge1016ov27601;
T0* ge1016ov27942;
T0* ge1016ov27492;
T0* ge1016ov27956;
T0* ge1016ov27506;
T0* ge1016ov27945;
T0* ge1016ov27770;
T0* ge1016ov27495;
T0* ge1016ov27950;
T0* ge1016ov27772;
T0* ge1016ov27500;
T0* ge1016ov27948;
T0* ge1016ov27498;
T0* ge1016ov27949;
T0* ge1016ov27499;
T0* ge1016ov28059;
T0* ge1016ov27825;
T0* ge1016ov27609;
T0* ge1016ov28026;
T0* ge1016ov27797;
T0* ge1016ov27576;
T0* ge1016ov27920;
T0* ge1016ov27759;
T0* ge1016ov27470;
T0* ge1016ov27918;
T0* ge1016ov27468;
T0* ge1016ov27912;
T0* ge1016ov27758;
T0* ge1016ov27462;
T0* ge1016ov27911;
T0* ge1016ov27757;
T0* ge1016ov27461;
T0* ge1016ov28162;
T0* ge1016ov27877;
T0* ge1016ov27712;
T0* ge1016ov28166;
T0* ge1016ov27881;
T0* ge1016ov27716;
T0* ge1016ov28122;
T0* ge1016ov27856;
T0* ge1016ov27672;
T0* ge1016ov28165;
T0* ge1016ov27880;
T0* ge1016ov27715;
T0* ge1016ov28025;
T0* ge1016ov27806;
T0* ge1016ov27575;
T0* ge1016ov28027;
T0* ge1016ov27577;
T0* ge1005ov36744;
T0* ge1005ov36739;
T0* ge1005ov36734;
T0* ge1005ov36745;
T0* ge1005ov36740;
T0* ge1005ov36735;
T0* ge1005ov36743;
T0* ge1005ov36738;
T0* ge1005ov36733;
T0* ge1016ov28175;
T0* ge1016ov27889;
T0* ge1016ov27725;
T0* ge808ov11657;
T0* ge808ov11702;
T0* ge808ov11656;
T0* ge808ov11653;
T0* ge808ov11717;
T0* ge808ov11701;
T0* ge808ov11676;
T0* ge808ov11703;
T0* ge808ov11718;
T0* ge808ov11660;
T0* ge808ov11705;
T0* ge808ov11672;
T0* ge808ov11675;
T0* ge808ov11725;
T0* ge808ov11666;
T0* ge808ov11697;
T0* ge808ov11685;
T0* ge808ov11711;
T0* ge808ov11665;
T0* ge808ov11388;
T0* ge1016ov28118;
T0* ge1016ov27853;
T0* ge1016ov27668;
T0* ge1013ov36752;
T0* ge1013ov36751;
T0* ge1016ov28117;
T0* ge1016ov27667;
T0* ge808ov11723;
T0* ge808ov11693;
T0* ge808ov11679;
T0* ge808ov11710;
T0* ge808ov11696;
T0* ge808ov11658;
T0* ge808ov11690;
T0* ge808ov11706;
T0* ge808ov11694;
T0* ge808ov11721;
T0* ge808ov11684;
T0* ge808ov11668;
T0* ge808ov11670;
T0* ge808ov11707;
T0* ge808ov11659;
T0* ge808ov11681;
T0* ge808ov11709;
T0* ge1016ov28174;
T0* ge1016ov27724;
T0* ge1028ov22596;
T0* ge808ov11776;
T0* ge808ov11782;
T0* ge808ov11783;
T0* ge808ov11785;
T0* ge808ov11787;
T0* ge808ov11788;
T0* ge808ov11790;
T0* ge808ov11791;
T0* ge808ov11838;
T0* ge808ov11839;
T0* ge808ov11840;
T0* ge808ov11386;
T0* ge808ov11397;
T0* ge808ov11399;
T0* ge808ov11406;
T0* ge808ov11409;
T0* ge808ov11417;
T0* ge808ov11437;
T0* ge808ov11439;
T0* ge808ov11444;
T0* ge808ov11445;
T0* ge808ov11446;
T0* ge808ov11447;
T0* ge808ov11440;
T0* ge808ov11441;
T0* ge808ov11442;
T0* ge808ov11443;
T0* ge808ov11448;
T0* ge808ov11449;
T0* ge808ov11450;
T0* ge808ov11451;
T0* ge808ov11452;
T0* ge808ov11453;
T0* ge808ov11454;
T0* ge808ov11455;
T0* ge808ov11456;
T0* ge808ov11458;
T0* ge808ov11457;
T0* ge808ov11461;
T0* ge808ov11462;
T0* ge808ov11463;
T0* ge808ov11464;
T0* ge808ov11465;
T0* ge808ov11466;
T0* ge808ov11467;
T0* ge808ov11468;
T0* ge808ov11470;
T0* ge808ov11471;
T0* ge808ov11472;
T0* ge808ov11473;
T0* ge808ov11476;
T0* ge808ov11477;
T0* ge808ov11479;
T0* ge808ov11480;
T0* ge808ov11481;
T0* ge808ov11482;
T0* ge808ov11484;
T0* ge808ov11485;
T0* ge808ov11486;
T0* ge808ov11487;
T0* ge808ov11488;
T0* ge808ov11489;
T0* ge808ov11490;
T0* ge808ov11491;
T0* ge808ov11492;
T0* ge808ov11493;
T0* ge808ov11494;
T0* ge808ov11495;
T0* ge808ov11496;
T0* ge808ov11497;
T0* ge808ov11498;
T0* ge808ov11499;
T0* ge808ov11501;
T0* ge808ov11502;
T0* ge808ov11503;
T0* ge808ov11504;
T0* ge808ov11505;
T0* ge808ov11506;
T0* ge808ov11507;
T0* ge808ov11508;
T0* ge808ov11509;
T0* ge808ov11510;
T0* ge808ov11511;
T0* ge808ov11512;
T0* ge808ov11513;
T0* ge808ov11514;
T0* ge808ov11515;
T0* ge808ov11516;
T0* ge808ov11517;
T0* ge808ov11518;
T0* ge808ov11519;
T0* ge808ov11520;
T0* ge808ov11521;
T0* ge808ov11522;
T0* ge808ov11523;
T0* ge808ov11524;
T0* ge808ov11525;
T0* ge808ov11526;
T0* ge808ov11527;
T0* ge808ov11529;
T0* ge808ov11530;
T0* ge808ov11531;
T0* ge808ov11532;
T0* ge808ov11533;
T0* ge808ov11534;
T0* ge808ov11535;
T0* ge808ov11536;
T0* ge808ov11537;
T0* ge808ov11538;
T0* ge808ov11540;
T0* ge808ov11541;
T0* ge808ov11542;
T0* ge808ov11543;
T0* ge808ov11544;
T0* ge808ov11546;
T0* ge808ov11547;
T0* ge808ov11548;
T0* ge808ov11550;
T0* ge808ov11551;
T0* ge808ov11552;
T0* ge808ov11553;
T0* ge808ov11554;
T0* ge808ov11555;
T0* ge808ov11556;
T0* ge808ov11557;
T0* ge808ov11558;
T0* ge808ov11559;
T0* ge808ov11560;
T0* ge808ov11561;
T0* ge808ov11562;
T0* ge808ov11563;
T0* ge808ov11564;
T0* ge808ov11565;
T0* ge808ov11566;
T0* ge808ov11568;
T0* ge808ov11569;
T0* ge808ov11570;
T0* ge808ov11571;
T0* ge808ov11572;
T0* ge808ov11573;
T0* ge808ov11574;
T0* ge808ov11576;
T0* ge808ov11577;
T0* ge808ov11578;
T0* ge808ov11579;
T0* ge808ov11580;
T0* ge808ov11581;
T0* ge808ov11582;
T0* ge808ov11583;
T0* ge808ov11584;
T0* ge808ov11585;
T0* ge808ov11586;
T0* ge808ov11587;
T0* ge808ov11588;
T0* ge808ov11589;
T0* ge808ov11590;
T0* ge808ov11591;
T0* ge808ov11592;
T0* ge808ov11593;
T0* ge808ov11594;
T0* ge808ov11595;
T0* ge808ov11596;
T0* ge808ov11597;
T0* ge808ov11598;
T0* ge808ov11599;
T0* ge808ov11600;
T0* ge808ov11601;
T0* ge808ov11602;
T0* ge808ov11603;
T0* ge808ov11604;
T0* ge808ov11605;
T0* ge808ov11606;
T0* ge808ov11607;
T0* ge808ov11608;
T0* ge808ov11609;
T0* ge808ov11611;
T0* ge808ov11612;
T0* ge808ov11613;
T0* ge808ov11614;
T0* ge808ov11615;
T0* ge808ov11616;
T0* ge808ov11617;
T0* ge808ov11618;
T0* ge808ov11619;
T0* ge808ov11620;
T0* ge808ov11621;
T0* ge808ov11622;
T0* ge808ov11623;
T0* ge808ov11624;
T0* ge808ov11625;
T0* ge808ov11626;
T0* ge808ov11627;
T0* ge808ov11628;
T0* ge808ov11629;
T0* ge808ov11630;
T0* ge808ov11631;
T0* ge808ov11632;
T0* ge808ov11633;
T0* ge808ov11634;
T0* ge808ov11635;
T0* ge808ov11637;
T0* ge808ov11638;
T0* ge808ov11639;
T0* ge808ov11640;
T0* ge808ov11641;
T0* ge808ov11642;
T0* ge808ov11643;
T0* ge808ov11644;
T0* ge808ov11645;
T0* ge808ov11646;
T0* ge808ov11648;
T0* ge808ov11650;
T0* ge808ov11651;
T0* ge808ov11654;
T0* ge808ov11655;
T0* ge808ov11663;
T0* ge808ov11671;
T0* ge808ov11677;
T0* ge808ov11680;
T0* ge808ov11682;
T0* ge808ov11683;
T0* ge808ov11686;
T0* ge808ov11687;
T0* ge808ov11688;
T0* ge808ov11689;
T0* ge808ov11692;
T0* ge808ov11698;
T0* ge808ov11699;
T0* ge808ov11700;
T0* ge808ov11708;
T0* ge808ov11712;
T0* ge808ov11713;
T0* ge808ov11714;
T0* ge808ov11715;
T0* ge808ov11716;
T0* ge808ov11719;
T0* ge808ov11720;
T0* ge808ov11722;
T0* ge808ov11724;
T0* ge808ov11726;
T0* ge808ov11740;
T0* ge808ov11741;
T0* ge808ov11742;
T0* ge808ov11743;
T0* ge808ov11744;
T0* ge808ov11745;
T0* ge808ov11746;
T0* ge808ov11747;
T0* ge808ov11748;
T0* ge808ov11749;
T0* ge808ov11750;
T0* ge808ov11751;
T0* ge808ov11752;
T0* ge808ov11753;
T0* ge808ov11754;
T0* ge808ov11755;
T0* ge808ov11756;
T0* ge808ov11757;
T0* ge808ov11758;
T0* ge808ov11759;
T0* ge808ov11760;
T0* ge808ov11761;
T0* ge808ov11762;
T0* ge808ov11763;
T0* ge808ov11765;
T0* ge808ov11766;
T0* ge808ov11767;
T0* ge808ov11768;
T0* ge808ov11769;
T0* ge808ov11770;
T0* ge808ov11771;
T0* ge808ov11772;
T0* ge808ov11773;
T0* ge808ov11774;
T0* ge228ov15938;
T0* ge1028ov22625;
T0* ge1016ov28134;
T0* ge1016ov27863;
T0* ge1016ov27684;
T0* ge1016ov28046;
T0* ge1016ov27816;
T0* ge1016ov27596;
T0* ge1016ov28132;
T0* ge1016ov27861;
T0* ge1016ov27682;
T0* ge1016ov28131;
T0* ge1016ov27681;
T0* ge1016ov27935;
T0* ge1016ov27766;
T0* ge1016ov27485;
T0* ge1016ov28129;
T0* ge1016ov27860;
T0* ge1016ov27679;
T0* ge1016ov28128;
T0* ge1016ov27678;
T0* ge1016ov27934;
T0* ge1016ov27765;
T0* ge1016ov27484;
T0* ge1016ov27903;
T0* ge1016ov27751;
T0* ge1016ov27453;
T0* ge1016ov28045;
T0* ge1016ov27595;
T0* ge1016ov28043;
T0* ge1016ov27815;
T0* ge1016ov27593;
T0* ge1016ov27904;
T0* ge1016ov27454;
T0* ge1016ov28136;
T0* ge1016ov27864;
T0* ge1016ov27686;
T0* ge1016ov28147;
T0* ge1016ov27868;
T0* ge1016ov27697;
T0* ge1016ov28187;
T0* ge1016ov27894;
T0* ge1016ov27737;
T0* ge1016ov28185;
T0* ge1016ov27735;
T0* ge1016ov28186;
T0* ge1016ov27736;
T0* ge1016ov28182;
T0* ge1016ov27892;
T0* ge1016ov27732;
T0* ge1016ov28180;
T0* ge1016ov27730;
T0* ge1016ov28181;
T0* ge1016ov27731;
T0* ge1016ov28183;
T0* ge1016ov27893;
T0* ge1016ov27733;
T0* ge1016ov28184;
T0* ge1016ov27734;
T0* ge1016ov28178;
T0* ge1016ov27891;
T0* ge1016ov27728;
T0* ge1016ov28179;
T0* ge1016ov27729;
T0* ge1016ov28044;
T0* ge1016ov27594;
T0* ge1016ov28197;
T0* ge1016ov27898;
T0* ge1016ov27747;
T0* ge1016ov28195;
T0* ge1016ov27745;
T0* ge1016ov28196;
T0* ge1016ov27746;
T0* ge1016ov28192;
T0* ge1016ov27896;
T0* ge1016ov27742;
T0* ge1016ov28190;
T0* ge1016ov27740;
T0* ge1016ov28191;
T0* ge1016ov27741;
T0* ge1016ov28193;
T0* ge1016ov27897;
T0* ge1016ov27743;
T0* ge1016ov28194;
T0* ge1016ov27744;
T0* ge1016ov28188;
T0* ge1016ov27895;
T0* ge1016ov27738;
T0* ge1016ov28189;
T0* ge1016ov27739;
T0* ge1016ov27974;
T0* ge1016ov27784;
T0* ge1016ov27524;
T0* ge1016ov27973;
T0* ge1016ov27523;
T0* ge1016ov27972;
T0* ge1016ov27783;
T0* ge1016ov27522;
T0* ge1016ov27971;
T0* ge1016ov27521;
T0* ge1016ov27975;
T0* ge1016ov27785;
T0* ge1016ov27525;
T0* ge1016ov27966;
T0* ge1016ov27782;
T0* ge1016ov27516;
T0* ge1016ov27968;
T0* ge1016ov27518;
T0* ge1016ov28135;
T0* ge1016ov27685;
T0* ge1016ov28130;
T0* ge1016ov27680;
T0* ge1016ov28148;
T0* ge1016ov27698;
T0* ge1016ov27976;
T0* ge1016ov27526;
T0* ge1016ov27964;
T0* ge1016ov27514;
T0* ge1016ov27970;
T0* ge1016ov27520;
T0* ge1016ov27967;
T0* ge1016ov27517;
T0* ge1016ov27965;
T0* ge1016ov27515;
T0* ge1016ov28120;
T0* ge1016ov27855;
T0* ge1016ov27670;
T0* ge1016ov28121;
T0* ge1016ov27671;
T0* ge1016ov28104;
T0* ge1016ov27847;
T0* ge1016ov27654;
T0* ge1016ov28105;
T0* ge1016ov27848;
T0* ge1016ov27655;
T0* ge1016ov28101;
T0* ge1016ov27651;
T0* ge1016ov28143;
T0* ge1016ov27866;
T0* ge1016ov27693;
T0* ge1017ov8205;
T0* ge1017ov8200;
T0* ge1017ov8201;
T0* ge1017ov8168;
T0* ge1017ov8170;
T0* ge1017ov8131;
T0* ge1017ov8169;
T0* ge1017ov8207;
T0* ge1017ov8204;
T0* ge1016ov28142;
T0* ge1016ov27865;
T0* ge1016ov27692;
T0* ge1016ov28146;
T0* ge1016ov27867;
T0* ge1016ov27696;
T0* ge1016ov28145;
T0* ge1016ov27695;
T0* ge1016ov28141;
T0* ge1016ov27691;
T0* ge1016ov28140;
T0* ge1016ov27690;
T0* ge1016ov28139;
T0* ge1016ov27689;
T0* ge1016ov28138;
T0* ge1016ov27688;
T0* ge1016ov28137;
T0* ge1016ov27687;
T0* ge1016ov28157;
T0* ge1016ov27873;
T0* ge1016ov27707;
T0* ge1016ov27905;
T0* ge1016ov27752;
T0* ge1016ov27455;
T0* ge1016ov28065;
T0* ge1016ov27827;
T0* ge1016ov27615;
T0* ge1016ov28064;
T0* ge1016ov27614;
T0* ge1016ov28063;
T0* ge1016ov27613;
T0* ge1016ov28062;
T0* ge1016ov27612;
T0* ge1016ov28061;
T0* ge1016ov27611;
T0* ge1016ov28060;
T0* ge1016ov27826;
T0* ge1016ov27610;
T0* ge1017ov8208;
T0* ge1016ov28070;
T0* ge1016ov27830;
T0* ge1016ov27620;
T0* ge1016ov28077;
T0* ge1016ov27834;
T0* ge1016ov27627;
T0* ge1016ov28076;
T0* ge1016ov27626;
T0* ge1016ov28075;
T0* ge1016ov27833;
T0* ge1016ov27625;
T0* ge1016ov28074;
T0* ge1016ov27624;
T0* ge1016ov28073;
T0* ge1016ov27832;
T0* ge1016ov27623;
T0* ge1016ov28072;
T0* ge1016ov27622;
T0* ge1016ov28071;
T0* ge1016ov27831;
T0* ge1016ov27621;
T0* ge1016ov28069;
T0* ge1016ov27619;
T0* ge1016ov28160;
T0* ge1016ov27875;
T0* ge1016ov27710;
T0* ge1016ov28158;
T0* ge1016ov27874;
T0* ge1016ov27708;
T0* ge1016ov28156;
T0* ge1016ov27706;
T0* ge1017ov8148;
T0* ge1016ov28198;
T0* ge1016ov27899;
T0* ge1016ov27748;
T0* ge1016ov28154;
T0* ge1016ov27704;
T0* ge1017ov8138;
T0* ge1017ov8139;
T0* ge1017ov8140;
T0* ge1017ov8141;
T0* ge1017ov8146;
T0* ge1017ov8147;
T0* ge1017ov8149;
T0* ge1016ov28155;
T0* ge1016ov27705;
T0* ge1016ov27977;
T0* ge1016ov27527;
T0* ge1016ov28150;
T0* ge1016ov27870;
T0* ge1016ov27700;
T0* ge802ov37544;
T0* ge802ov37543;
T0* ge1016ov28149;
T0* ge1016ov27869;
T0* ge1016ov27699;
T0* ge802ov37545;
T0* ge1016ov28168;
T0* ge1016ov27883;
T0* ge1016ov27718;
T0* ge1016ov28167;
T0* ge1016ov27882;
T0* ge1016ov27717;
T0* ge808ov11704;
T0* ge808ov11661;
T0* ge1017ov8133;
T0* ge1017ov8096;
T0* ge1017ov8084;
T0* ge1016ov28114;
T0* ge1016ov27664;
T0* ge1016ov28110;
T0* ge1016ov27851;
T0* ge1016ov27660;
T0* ge1016ov28111;
T0* ge1016ov27661;
T0* ge1016ov27915;
T0* ge1016ov27465;
T0* ge1016ov28030;
T0* ge1016ov27807;
T0* ge1016ov27580;
T0* ge1016ov28112;
T0* ge1016ov27662;
T0* ge1016ov27930;
T0* ge1016ov27764;
T0* ge1016ov27480;
T0* ge1016ov27929;
T0* ge1016ov27479;
T0* ge1016ov27928;
T0* ge1016ov27763;
T0* ge1016ov27478;
T0* ge1016ov27932;
T0* ge1016ov27482;
T0* ge1016ov27933;
T0* ge1016ov27483;
T0* ge1016ov27927;
T0* ge1016ov27762;
T0* ge1016ov27477;
T0* ge1016ov28133;
T0* ge1016ov27862;
T0* ge1016ov27683;
T0* ge1016ov27902;
T0* ge1016ov27750;
T0* ge1016ov27452;
T0* ge1016ov27978;
T0* ge1016ov27528;
T0* ge1016ov28085;
T0* ge1016ov27835;
T0* ge1016ov27635;
T0* ge1016ov28083;
T0* ge1016ov27633;
T0* ge1016ov28081;
T0* ge1016ov27631;
T0* ge1016ov28080;
T0* ge1016ov27630;
T0* ge1016ov28107;
T0* ge1016ov27849;
T0* ge1016ov27657;
T0* ge1016ov28109;
T0* ge1016ov27850;
T0* ge1016ov27659;
T0* ge1016ov28099;
T0* ge1016ov27844;
T0* ge1016ov27649;
T0* ge1016ov28144;
T0* ge1016ov27694;
T0* ge1016ov28084;
T0* ge1016ov27634;
T0* ge1016ov28082;
T0* ge1016ov27632;
T0* ge1016ov28079;
T0* ge1016ov27629;
T0* ge1016ov28078;
T0* ge1016ov27628;
T0* ge1016ov28103;
T0* ge1016ov27653;
T0* ge1016ov28098;
T0* ge1016ov27648;
T0* ge1016ov28086;
T0* ge1016ov27836;
T0* ge1016ov27636;
T0* ge1016ov28087;
T0* ge1016ov27637;
T0* ge1016ov28123;
T0* ge1016ov27673;
T0* ge1016ov27919;
T0* ge1016ov27469;
T0* ge1016ov27917;
T0* ge1016ov27467;
T0* ge1016ov27916;
T0* ge1016ov27466;
T0* ge1016ov28119;
T0* ge1016ov27854;
T0* ge1016ov27669;
T0* ge1016ov28176;
T0* ge1016ov27890;
T0* ge1016ov27726;
T0* ge1016ov28177;
T0* ge1016ov27727;
T0* ge1016ov28127;
T0* ge1016ov27859;
T0* ge1016ov27677;
T0* ge1016ov28126;
T0* ge1016ov27858;
T0* ge1016ov27676;
T0* ge1016ov28164;
T0* ge1016ov27879;
T0* ge1016ov27714;
T0* ge1016ov28153;
T0* ge1016ov27872;
T0* ge1016ov27703;
T0* ge1016ov28152;
T0* ge1016ov27702;
T0* ge1016ov28014;
T0* ge1016ov27564;
T0* ge1016ov28017;
T0* ge1016ov27802;
T0* ge1016ov27567;
T0* ge1016ov28007;
T0* ge1016ov27798;
T0* ge1016ov27557;
T0* ge1016ov28010;
T0* ge1016ov27800;
T0* ge1016ov27560;
T0* ge1016ov28013;
T0* ge1016ov27563;
T0* ge1016ov27979;
T0* ge1016ov27529;
T0* ge1016ov28094;
T0* ge1016ov27842;
T0* ge1016ov27644;
T0* ge1016ov28093;
T0* ge1016ov27841;
T0* ge1016ov27643;
T0* ge1016ov28092;
T0* ge1016ov27840;
T0* ge1016ov27642;
T0* ge1016ov28090;
T0* ge1016ov27839;
T0* ge1016ov27640;
T0* ge1016ov28091;
T0* ge1016ov27641;
T0* ge1016ov28089;
T0* ge1016ov27838;
T0* ge1016ov27639;
T0* ge1016ov28088;
T0* ge1016ov27837;
T0* ge1016ov27638;
T0* ge1016ov28095;
T0* ge1016ov27843;
T0* ge1016ov27645;
T0* ge1016ov27914;
T0* ge1016ov27464;
T0* ge1016ov28029;
T0* ge1016ov27579;
T0* ge1016ov28163;
T0* ge1016ov27878;
T0* ge1016ov27713;
T0* ge1016ov28116;
T0* ge1016ov27666;
T0* ge1016ov28115;
T0* ge1016ov27665;
T0* ge1016ov27913;
T0* ge1016ov27463;
T0* ge1016ov28028;
T0* ge1016ov27578;
T0* ge66ov37242;
T0* ge1005ov36742;
T0* ge1005ov36737;
T0* ge1005ov36732;
T0* ge1016ov28161;
T0* ge1016ov27876;
T0* ge1016ov27711;
T0* ge1017ov8175;
T0* ge1017ov8130;
T0* ge1016ov28067;
T0* ge1016ov27829;
T0* ge1016ov27617;
T0* ge1016ov28068;
T0* ge1016ov27618;
T0* ge1016ov28066;
T0* ge1016ov27828;
T0* ge1016ov27616;
T0* ge1017ov8134;
T0* ge1016ov27906;
T0* ge1016ov27753;
T0* ge1016ov27456;
T0* ge1016ov27907;
T0* ge1016ov27754;
T0* ge1016ov27457;
T0* ge1016ov28038;
T0* ge1016ov27812;
T0* ge1016ov27588;
T0* ge1016ov27962;
T0* ge1016ov27781;
T0* ge1016ov27512;
T0* ge1016ov27963;
T0* ge1016ov27513;
T0* ge1016ov28040;
T0* ge1016ov27813;
T0* ge1016ov27590;
T0* ge1016ov28041;
T0* ge1016ov27591;
T0* ge1016ov28039;
T0* ge1016ov27589;
T0* ge1016ov28042;
T0* ge1016ov27814;
T0* ge1016ov27592;
T0* ge1016ov28016;
T0* ge1016ov27566;
T0* ge1016ov28018;
T0* ge1016ov27568;
T0* ge1016ov28008;
T0* ge1016ov27558;
T0* ge1016ov28011;
T0* ge1016ov27561;
T0* ge1016ov28009;
T0* ge1016ov27799;
T0* ge1016ov27559;
T0* ge1016ov28015;
T0* ge1016ov27565;
T0* ge1016ov27926;
T0* ge1016ov27476;
T0* ge1216ov28362;
T0* ge1216ov28361;
T0* ge351ov12227;
T0* ge264ov12227;
T0* ge251ov12227;
T0* ge7ov4689;
T0* ge7ov4690;
T0* ge7ov4691;
T0* ge1015ov37915;
T0* ge1015ov37911;
T0* ge1015ov37910;
T0* ge1015ov37914;
T0* ge1015ov37909;
T0* ge1015ov37913;
T0* ge1015ov37908;
T0* ge1015ov37912;
T0* ge1015ov37907;
T0* ge808ov11764;
T0* ge808ov11775;
T0* ge812ov30001;
T0* ge808ov11836;
T0* ge808ov11837;
T0* ge808ov11817;
T0* ge808ov11833;
T0* ge808ov11821;
T0* ge808ov11822;
T0* ge808ov11823;
T0* ge808ov11824;
T0* ge808ov11818;
T0* ge808ov11825;
T0* ge808ov11826;
T0* ge808ov11827;
T0* ge808ov11828;
T0* ge808ov11819;
T0* ge808ov11834;
T0* ge808ov11829;
T0* ge808ov11830;
T0* ge808ov11831;
T0* ge808ov11820;
T0* ge808ov11832;
T0* ge808ov11835;
T0* ge1284ov30597;
T0* ge1284ov30599;
T0* ge714ov15920;
T0* ge714ov15921;
T0* ge808ov11813;
T0* ge808ov11812;
T0* ge808ov11800;
T0* ge808ov11801;
T0* ge808ov11802;
T0* ge808ov11803;
T0* ge808ov11804;
T0* ge808ov11805;
T0* ge808ov11806;
T0* ge808ov11807;
T0* ge808ov11808;
T0* ge808ov11809;
T0* ge808ov11810;
T0* ge808ov11811;
T0* ge808ov11815;
T0* ge808ov11816;
T0* ge808ov11796;
T0* ge808ov11797;
T0* ge808ov11798;
T0* ge808ov11799;
T0* ge808ov11814;
T0* ge833ov31268;
T0* ge833ov31267;
T0* ge808ov11730;
T0* ge808ov11731;
T0* ge808ov11729;
T0* ge808ov11727;
T0* ge808ov11728;
T0* ge808ov11735;
T0* ge808ov11736;
T0* ge808ov11734;
T0* ge808ov11732;
T0* ge808ov11733;
T0* ge808ov11737;
T0* ge808ov11738;
T0* ge808ov11739;
T0* ge852ov32660;
T0* ge840ov29908;
T0* ge51ov4641;
T0* ge37ov4641;
T0* ge43ov4641;
T0* ge42ov4641;
T0* ge41ov4641;
T0* ge32ov4641;
T0* ge31ov4641;
T0* ge48ov4641;
T0* ge61ov4641;
T0* ge1135ov4641;
T0* ge169ov4641;
T0* ge168ov4641;
T0* ge1129ov4641;
T0* ge1145ov4641;
T0* ge1142ov4641;
T0* ge1141ov4641;
T0* ge1137ov4641;
T0* ge1144ov4641;
T0* ge1136ov4641;
T0* ge1148ov4641;
T0* ge1132ov4641;
T0* ge1143ov4641;
T0* ge1147ov4641;
T0* ge1139ov4641;
T0* ge1130ov4641;
T0* ge1138ov4641;
T0* ge163ov4641;
T0* ge166ov4641;
T0* ge173ov4641;
T0* ge162ov4641;
T0* ge261ov30775;
T0* ge248ov2158;
T0* geic2;
T0* geic3;
T0* geic4;

void GE_const_init()
{
	ge260ov12227 = (GE_ms8("\n", 1));
	ge224ov3558 = (GE_ms8("", 0));
	ge164ov4643 = (GE_ms8("", 0));
	ge324ov30590 = (GE_ms8("", 0));
	ge314ov13885 = (GE_ms8("", 0));
	ge262ov12227 = (GE_ms8("\n", 1));
	ge1017ov8210 = (GE_ms8(".bat", 4));
	ge1017ov8217 = (GE_ms8(".sh", 3));
	ge1017ov8216 = (GE_ms8(".rc", 3));
	ge1017ov8215 = (GE_ms8(".res", 4));
	ge246ov2179 = (GE_ms8("empty_name", 10));
	ge247ov12284 = (GE_ms8("dummy", 5));
	ge1017ov8211 = (GE_ms8(".c", 2));
	ge1017ov8213 = (GE_ms8(".cpp", 4));
	ge1017ov8180 = (GE_ms8("#include", 8));
	ge245ov19375 = (GE_ms8("", 0));
	ge245ov19376 = (GE_ms8("empty_name", 10));
	ge1715ov18399 = (GE_ms8("no pattern compiled", 19));
	ge1715ov18384 = (GE_ms8("unmatched parentheses", 21));
	ge1715ov18377 = (GE_ms8("back reference to non-existent subpattern", 41));
	ge1715ov18362 = (GE_ms8("compilation successfully", 24));
	ge1715ov18387 = (GE_ms8("lookbehind assertion is not fixed length", 40));
	ge1715ov18380 = (GE_ms8("missing ) after comment", 23));
	ge1715ov18388 = (GE_ms8("malformed number after (\?(", 26));
	ge1715ov18397 = (GE_ms8("invalid condition (\?(0)", 23));
	ge1715ov18390 = (GE_ms8("assertion expected after (\?(", 28));
	ge1715ov18386 = (GE_ms8("unrecognized character after (\?<", 32));
	ge1715ov18374 = (GE_ms8("unrecognized character after (\?", 31));
	ge1715ov18375 = (GE_ms8("too many capturing parenthesized sub-patterns", 45));
	ge1715ov18389 = (GE_ms8("conditional group contains more than two branches", 49));
	ge1715ov18376 = (GE_ms8("missing )", 9));
	ge1715ov18363 = (GE_ms8("\\ at end of pattern", 19));
	ge1715ov18364 = (GE_ms8("\\c at end of pattern", 20));
	ge1715ov18365 = (GE_ms8("unrecognized character follows \\", 32));
	ge1715ov18371 = (GE_ms8("nothing to repeat", 17));
	ge1715ov18373 = (GE_ms8("internal error: unexpected repeat", 33));
	ge1715ov18368 = (GE_ms8("missing terminating ] for character class", 41));
	ge1715ov18393 = (GE_ms8("POSIX collating elements are not supported", 42));
	ge1715ov18392 = (GE_ms8("unknown POSIX class name", 24));
	ge1715ov18369 = (GE_ms8("invalid escape sequence in character class", 42));
	ge1715ov18370 = (GE_ms8("range out of order in character class", 37));
	ge1715ov18367 = (GE_ms8("number too big in {} quantifier", 31));
	ge1715ov18366 = (GE_ms8("numbers out of order in {} quantifier", 37));
	ge1711ov18154 = (GE_ms8("", 0));
	ge1017ov8212 = (GE_ms8(".cfg", 4));
	ge1017ov8214 = (GE_ms8(".h", 2));
	ge1017ov8062 = (GE_ms8("#define", 7));
	ge1017ov8098 = (GE_ms8("EIF_TRACE", 9));
	ge1017ov8071 = (GE_ms8("EIF_EXCEPTION_TRACE", 19));
	ge1017ov8066 = (GE_ms8("EIF_BOEHM_GC", 12));
	ge1017ov8097 = (GE_ms8("EIF_THREADS", 11));
	ge1010ov27147 = (GE_ms8("giaaa", 5));
	ge1010ov27146 = (GE_ms8("GIAAA", 5));
	ge1010ov27145 = (GE_ms8("[$1] internal error.", 20));
	ge808ov11545 = (GE_ms8("item", 4));
	ge808ov11459 = (GE_ms8("call", 4));
	ge808ov11678 = (GE_ms8("end", 3));
	ge1017ov8135 = (GE_ms8("GE_exception_manager", 20));
	ge1017ov8150 = (GE_ms8("GE_new", 6));
	ge1017ov8099 = (GE_ms8("EIF_TRUE", 8));
	ge1017ov8171 = (GE_ms8("GE_set_exception_data", 21));
	ge1017ov8178 = (GE_ms8("#ifdef", 6));
	ge1017ov8103 = (GE_ms8("EIF_WINDOWS", 11));
	ge1017ov8105 = (GE_ms8("#endif", 6));
	ge1017ov8195 = (GE_ms8("return", 6));
	ge1017ov8128 = (GE_ms8("GE_dts", 6));
	ge1017ov8121 = (GE_ms8("GE_catcall", 10));
	ge1017ov8057 = (GE_ms8("->", 2));
	ge1017ov8174 = (GE_ms8("GE_void", 7));
	ge1017ov8119 = (GE_ms8("GE_boxed", 8));
	ge808ov11649 = (GE_ms8("Current", 7));
	ge808ov11669 = (GE_ms8("create", 6));
	ge1017ov8172 = (GE_ms8("GE_show_console", 15));
	ge1017ov8107 = (GE_ms8("extern", 6));
	ge1017ov8100 = (GE_ms8("EIF_TYPE", 8));
	ge1017ov8173 = (GE_ms8("GE_types", 8));
	ge1017ov8072 = (GE_ms8("EIF_FALSE", 9));
	ge1017ov8182 = (GE_ms8("int", 3));
	ge1017ov8206 = (GE_ms8("void", 4));
	ge1017ov8123 = (GE_ms8("GE_const_init", 13));
	ge1017ov8125 = (GE_ms8("GE_deep_twin", 12));
	ge1017ov8124 = (GE_ms8("GE_deep", 7));
	ge1017ov8199 = (GE_ms8("switch", 6));
	ge1017ov8059 = (GE_ms8("case", 4));
	ge1017ov8126 = (GE_ms8("GE_default", 10));
	ge1017ov8177 = (GE_ms8("if", 2));
	ge1017ov8104 = (GE_ms8("else", 4));
	ge1017ov8176 = (GE_ms8("id", 2));
	ge1017ov8189 = (GE_ms8("memcpy", 6));
	ge1017ov8196 = (GE_ms8("sizeof", 6));
	ge1017ov8179 = (GE_ms8("#ifndef", 7));
	ge1017ov8114 = (GE_ms8("GE_alloc_cleared", 16));
	ge1017ov8115 = (GE_ms8("GE_alloc_atomic_cleared", 23));
	ge1017ov8190 = (GE_ms8("memset", 6));
	ge1017ov8110 = (GE_ms8("for", 3));
	ge808ov11652 = (GE_ms8("Result", 6));
	ge1017ov8145 = (GE_ms8("GE_mt", 5));
	ge1017ov8118 = (GE_ms8("GE_bma", 6));
	ge1017ov8142 = (GE_ms8("GE_ma", 5));
	ge1017ov8120 = (GE_ms8("GE_call", 7));
	ge1017ov8055 = (GE_ms8("ac", 2));
	ge1017ov8058 = (GE_ms8("break", 5));
	ge1017ov8061 = (GE_ms8("default", 7));
	ge1017ov8083 = (GE_ms8("eif_mem_free", 12));
	ge1017ov8127 = (GE_ms8("GE_developer_raise", 18));
	ge1017ov8152 = (GE_ms8("GE_object_id_free", 17));
	ge1017ov8111 = (GE_ms8("fprintf", 7));
	ge1017ov8197 = (GE_ms8("stderr", 6));
	ge1017ov8144 = (GE_ms8("GE_ms32", 7));
	ge1017ov8143 = (GE_ms8("GE_ms8", 6));
	ge1017ov8202 = (GE_ms8("type_id", 7));
	ge1017ov8154 = (GE_ms8("GE_raise", 8));
	ge1017ov8132 = (GE_ms8("GE_EX_FATAL", 11));
	ge1017ov8101 = (GE_ms8("EIF_VOID", 8));
	ge1017ov8129 = (GE_ms8("GE_EX_CDEF", 10));
	ge1017ov8153 = (GE_ms8("GE_power", 8));
	ge1017ov8063 = (GE_ms8("double", 6));
	ge1017ov8161 = (GE_ms8("GE_real_32_positive_infinity", 28));
	ge1017ov8167 = (GE_ms8("GE_real_64_positive_infinity", 28));
	ge1017ov8160 = (GE_ms8("GE_real_32_negative_infinity", 28));
	ge1017ov8166 = (GE_ms8("GE_real_64_negative_infinity", 28));
	ge1017ov8159 = (GE_ms8("GE_real_32_nan", 14));
	ge1017ov8165 = (GE_ms8("GE_real_64_nan", 14));
	ge1017ov8158 = (GE_ms8("GE_real_32_is_positive_infinity", 31));
	ge1017ov8164 = (GE_ms8("GE_real_64_is_positive_infinity", 31));
	ge1017ov8157 = (GE_ms8("GE_real_32_is_negative_infinity", 31));
	ge1017ov8163 = (GE_ms8("GE_real_64_is_negative_infinity", 31));
	ge1017ov8156 = (GE_ms8("GE_real_32_is_nan", 17));
	ge1017ov8162 = (GE_ms8("GE_real_64_is_nan", 17));
	ge1017ov8136 = (GE_ms8("GE_floor", 8));
	ge1017ov8122 = (GE_ms8("GE_ceiling", 10));
	ge1017ov8060 = (GE_ms8("char", 4));
	ge1017ov8069 = (GE_ms8("EIF_CHARACTER_32", 16));
	ge1017ov8093 = (GE_ms8("EIF_REAL_32", 11));
	ge1017ov8091 = (GE_ms8("EIF_POINTER", 11));
	ge1017ov8082 = (GE_ms8("EIF_IS_WINDOWS", 14));
	ge1017ov8081 = (GE_ms8("EIF_IS_VXWORKS", 14));
	ge1017ov8080 = (GE_ms8("EIF_IS_VMS", 10));
	ge1017ov8079 = (GE_ms8("EIF_IS_UNIX", 11));
	ge1017ov8078 = (GE_ms8("EIF_IS_MAC", 10));
	ge1017ov8076 = (GE_ms8("EIF_INTEGER_32", 14));
	ge1017ov8094 = (GE_ms8("EIF_REAL_64", 11));
	ge1017ov8068 = (GE_ms8("EIF_CHARACTER_8", 15));
	ge1017ov8065 = (GE_ms8("EIF_BOOLEAN", 11));
	ge1017ov8108 = (GE_ms8("find_referers", 13));
	ge1017ov8151 = (GE_ms8("GE_object_id", 12));
	ge1017ov8137 = (GE_ms8("GE_id_object", 12));
	ge1017ov8117 = (GE_ms8("GE_argv", 7));
	ge1017ov8116 = (GE_ms8("GE_argc", 7));
	ge1017ov8188 = (GE_ms8("memcmp", 6));
	ge1017ov8194 = (GE_ms8("||", 2));
	ge1017ov8191 = (GE_ms8("!", 1));
	ge1017ov8192 = (GE_ms8("!=", 2));
	ge1017ov8056 = (GE_ms8("&&", 2));
	ge1017ov8193 = (GE_ms8("", 0));
	ge1017ov8106 = (GE_ms8("==", 2));
	ge808ov11431 = (GE_ms8("TUPLE", 5));
	ge1017ov8181 = (GE_ms8("initialize", 10));
	ge1017ov8112 = (GE_ms8("GE_alloc", 8));
	ge1017ov8113 = (GE_ms8("GE_alloc_atomic", 15));
	ge1017ov8155 = (GE_ms8("GE_register_dispose", 19));
	ge1017ov8064 = (GE_ms8("EIF_ANY", 7));
	ge1017ov8203 = (GE_ms8("typedef", 7));
	ge1017ov8198 = (GE_ms8("struct", 6));
	ge1017ov8073 = (GE_ms8("EIF_INTEGER", 11));
	ge1017ov8187 = (GE_ms8("is_special", 10));
	ge1017ov8089 = (GE_ms8("EIF_NATURAL_64", 14));
	ge1017ov8088 = (GE_ms8("EIF_NATURAL_32", 14));
	ge1017ov8087 = (GE_ms8("EIF_NATURAL_16", 14));
	ge1017ov8086 = (GE_ms8("EIF_NATURAL_8", 13));
	ge1017ov8077 = (GE_ms8("EIF_INTEGER_64", 14));
	ge1017ov8075 = (GE_ms8("EIF_INTEGER_16", 14));
	ge1017ov8074 = (GE_ms8("EIF_INTEGER_8", 13));
	ge1017ov8070 = (GE_ms8("EIF_DOUBLE", 10));
	ge808ov11394 = (GE_ms8("DOUBLE", 6));
	ge1017ov8092 = (GE_ms8("EIF_REAL", 8));
	ge808ov11421 = (GE_ms8("REAL", 4));
	ge1017ov8085 = (GE_ms8("EIF_NATURAL", 11));
	ge808ov11411 = (GE_ms8("NATURAL", 7));
	ge808ov11400 = (GE_ms8("INTEGER", 7));
	ge1017ov8102 = (GE_ms8("EIF_WIDE_CHAR", 13));
	ge808ov11434 = (GE_ms8("WIDE_CHARACTER", 14));
	ge1017ov8067 = (GE_ms8("EIF_CHARACTER", 13));
	ge808ov11390 = (GE_ms8("CHARACTER", 9));
	ge808ov11408 = (GE_ms8("ITERATION_CURSOR", 16));
	ge808ov11407 = (GE_ms8("ITERABLE", 8));
	ge808ov11393 = (GE_ms8("DISPOSABLE", 10));
	ge808ov11429 = (GE_ms8("SYSTEM_OBJECT", 13));
	ge808ov11385 = (GE_ms8("ANY", 3));
	ge808ov11387 = (GE_ms8("ARRAY", 5));
	ge808ov11433 = (GE_ms8("TYPED_POINTER", 13));
	ge808ov11432 = (GE_ms8("TYPE", 4));
	ge808ov11425 = (GE_ms8("SPECIAL", 7));
	ge808ov11424 = (GE_ms8("ROUTINE", 7));
	ge808ov11420 = (GE_ms8("PROCEDURE", 9));
	ge808ov11419 = (GE_ms8("PREDICATE", 9));
	ge808ov11398 = (GE_ms8("FUNCTION", 8));
	ge808ov11418 = (GE_ms8("POINTER", 7));
	ge808ov11423 = (GE_ms8("REAL_64", 7));
	ge808ov11422 = (GE_ms8("REAL_32", 7));
	ge808ov11415 = (GE_ms8("NATURAL_64", 10));
	ge808ov11414 = (GE_ms8("NATURAL_32", 10));
	ge808ov11413 = (GE_ms8("NATURAL_16", 10));
	ge808ov11412 = (GE_ms8("NATURAL_8", 9));
	ge808ov11404 = (GE_ms8("INTEGER_64", 10));
	ge808ov11403 = (GE_ms8("INTEGER_32", 10));
	ge808ov11402 = (GE_ms8("INTEGER_16", 10));
	ge808ov11401 = (GE_ms8("INTEGER_8", 9));
	ge808ov11392 = (GE_ms8("CHARACTER_32", 12));
	ge808ov11391 = (GE_ms8("CHARACTER_8", 11));
	ge808ov11389 = (GE_ms8("BOOLEAN", 7));
	ge808ov11667 = (GE_ms8("class", 5));
	ge808ov11435 = (GE_ms8("*UNKNOWN*", 9));
	ge1016ov28151 = (GE_ms8("vwbe0a", 6));
	ge1016ov27871 = (GE_ms8("VWBE", 4));
	ge1016ov27701 = (GE_ms8("boolean expression of non-BOOLEAN type \'$7\'.", 44));
	ge1014ov27135 = (GE_ms8("gvsrc5a", 7));
	ge1014ov27129 = (GE_ms8("GVSRC5", 6));
	ge1014ov27123 = (GE_ms8("[$1] root creation procedure `$3\' is not a feature of root class $2.", 68));
	ge1014ov27131 = (GE_ms8("vsrc1a", 6));
	ge1014ov27125 = (GE_ms8("VSRC1", 5));
	ge1014ov27119 = (GE_ms8("[$1] root class $2 should not be generic.", 41));
	ge1014ov27134 = (GE_ms8("gvsrc4a", 7));
	ge1014ov27128 = (GE_ms8("GVSRC4", 6));
	ge1014ov27122 = (GE_ms8("[$1] unknown root class $2.", 27));
	ge1014ov27136 = (GE_ms8("gvsrc6a", 7));
	ge1014ov27130 = (GE_ms8("GVSRC6", 6));
	ge1014ov27124 = (GE_ms8("[$1] root creation procedure `$3\' is not declared as publicly available creation procedure in root class $2.", 108));
	ge808ov11478 = (GE_ms8("default_create", 14));
	ge1014ov27133 = (GE_ms8("gvsrc3a", 7));
	ge1014ov27127 = (GE_ms8("GVSRC3", 6));
	ge1014ov27121 = (GE_ms8("[$1] missing root class.", 24));
	ge1016ov28172 = (GE_ms8("gvkfe4a", 7));
	ge1016ov27887 = (GE_ms8("GVKFE-4", 7));
	ge1016ov27722 = (GE_ms8("feature `$7\' in kernel class $5 is not a procedure.", 51));
	ge808ov11610 = (GE_ms8("set_exception_data", 18));
	ge808ov11539 = (GE_ms8("is_target_closed", 16));
	ge808ov11469 = (GE_ms8("closed_operands", 15));
	ge808ov11636 = (GE_ms8("to_pointer", 10));
	ge808ov11575 = (GE_ms8("pointer_item", 12));
	ge808ov11647 = (GE_ms8("upper", 5));
	ge808ov11549 = (GE_ms8("lower", 5));
	ge808ov11438 = (GE_ms8("area", 4));
	ge808ov11460 = (GE_ms8("capacity", 8));
	ge1016ov28171 = (GE_ms8("gvkfe3a", 7));
	ge1016ov27886 = (GE_ms8("GVKFE-3", 7));
	ge1016ov27721 = (GE_ms8("attribute `$7\' in kernel class $5 has not the expected type \'$8\'.", 65));
	ge1016ov28169 = (GE_ms8("gvkfe1a", 7));
	ge1016ov27884 = (GE_ms8("GVKFE-1", 7));
	ge1016ov27719 = (GE_ms8("feature `$7\' is missing in kernel class $5.", 43));
	ge1016ov28170 = (GE_ms8("gvkfe2a", 7));
	ge1016ov27885 = (GE_ms8("GVKFE-2", 7));
	ge1016ov27720 = (GE_ms8("feature `$7\' in kernel class $5 is not an attribute.", 52));
	ge808ov11475 = (GE_ms8("count", 5));
	ge1014ov27132 = (GE_ms8("gvknl1a", 7));
	ge1014ov27126 = (GE_ms8("GVKNL1", 6));
	ge1014ov27120 = (GE_ms8("[$1] missing kernel class $2.", 29));
	ge808ov11673 = (GE_ms8("deferred", 8));
	ge808ov11795 = (GE_ms8("WIDE_CHARACTER_REF", 18));
	ge808ov11779 = (GE_ms8("CHARACTER_32_REF", 16));
	ge808ov11426 = (GE_ms8("STRING", 6));
	ge808ov11427 = (GE_ms8("STRING_8", 8));
	ge808ov11792 = (GE_ms8("REAL_REF", 8));
	ge808ov11793 = (GE_ms8("REAL_32_REF", 11));
	ge808ov11786 = (GE_ms8("NATURAL_REF", 11));
	ge808ov11789 = (GE_ms8("NATURAL_32_REF", 14));
	ge808ov11781 = (GE_ms8("INTEGER_REF", 11));
	ge808ov11784 = (GE_ms8("INTEGER_32_REF", 14));
	ge808ov11780 = (GE_ms8("DOUBLE_REF", 10));
	ge808ov11794 = (GE_ms8("REAL_64_REF", 11));
	ge808ov11777 = (GE_ms8("CHARACTER_REF", 13));
	ge808ov11778 = (GE_ms8("CHARACTER_8_REF", 15));
	ge808ov11695 = (GE_ms8("like", 4));
	ge808ov11674 = (GE_ms8("detachable", 10));
	ge808ov11430 = (GE_ms8("SYSTEM_STRING", 13));
	ge808ov11691 = (GE_ms8("inherit", 7));
	ge808ov11428 = (GE_ms8("STRING_32", 9));
	ge808ov11416 = (GE_ms8("NONE", 4));
	ge808ov11405 = (GE_ms8("ISE_EXCEPTION_MANAGER", 21));
	ge808ov11396 = (GE_ms8("EXCEPTION_MANAGER", 17));
	ge808ov11395 = (GE_ms8("EXCEPTION", 9));
	ge1108ov5807 = (GE_ms8("system", 6));
	ge1105ov15697 = (GE_ms8("ESYN", 4));
	ge1105ov15609 = (GE_ms8("$5", 2));
	ge1105ov15747 = (GE_ms8("EABX", 4));
	ge1105ov15659 = (GE_ms8("root element of ECF file should be \'system\' and not \'$5\'.", 57));
	ge265ov12328 = (GE_ms8(".", 1));
	ge268ov12328 = (GE_ms8(".", 1));
	ge1108ov5814 = (GE_ms8("void_safety", 11));
	ge1108ov5787 = (GE_ms8("is_attached_by_default", 22));
	ge1097ov6056 = (GE_ms8("console_application", 19));
	ge1097ov6057 = (GE_ms8("concurrency", 11));
	ge1105ov15746 = (GE_ms8("EABW", 4));
	ge1105ov15658 = (GE_ms8("no library target specified in library ECF file \"$5\".", 53));
	ge1108ov5810 = (GE_ms8("uuid", 4));
	ge1108ov5794 = (GE_ms8("name", 4));
	ge1108ov5808 = (GE_ms8("target", 6));
	ge1108ov5789 = (GE_ms8("library_target", 14));
	ge1105ov15740 = (GE_ms8("EABQ", 4));
	ge1105ov15652 = (GE_ms8("\'library_target\' attribute \"$5\" in element \'system\' is not the name of an existing target.", 90));
	ge1105ov15739 = (GE_ms8("EABP", 4));
	ge1105ov15651 = (GE_ms8("\'library_target\' attribute in element \'system\' is empty.", 56));
	ge1105ov15748 = (GE_ms8("EABY", 4));
	ge1105ov15660 = (GE_ms8("no \'target\' element found in element \'system\'.", 46));
	ge1108ov5772 = (GE_ms8("cluster", 7));
	ge1108ov5799 = (GE_ms8("override", 8));
	ge1108ov5788 = (GE_ms8("library", 7));
	ge1108ov5769 = (GE_ms8("assembly", 8));
	ge1108ov5785 = (GE_ms8("file_rule", 9));
	ge1108ov5781 = (GE_ms8("external_include", 16));
	ge1108ov5782 = (GE_ms8("external_library", 16));
	ge1108ov5783 = (GE_ms8("external_object", 15));
	ge1108ov5805 = (GE_ms8("root", 4));
	ge1108ov5812 = (GE_ms8("variable", 8));
	ge1108ov5806 = (GE_ms8("setting", 7));
	ge1108ov5798 = (GE_ms8("option", 6));
	ge1108ov5811 = (GE_ms8("value", 5));
	ge1105ov15784 = (GE_ms8("ESVE", 4));
	ge1105ov15696 = (GE_ms8("\'value\' attribute in element \'setting\' is empty.", 48));
	ge1105ov15783 = (GE_ms8("ESVM", 4));
	ge1105ov15695 = (GE_ms8("\'value\' attribute is missing in element \'setting\'.", 50));
	ge1105ov15782 = (GE_ms8("ESNE", 4));
	ge1105ov15694 = (GE_ms8("\'name\' attribute in element \'setting\' is empty.", 47));
	ge1105ov15781 = (GE_ms8("ESNM", 4));
	ge1105ov15693 = (GE_ms8("\'name\' attribute is missing in element \'setting\'.", 49));
	ge1105ov15744 = (GE_ms8("EABU", 4));
	ge1105ov15656 = (GE_ms8("\'value\' attribute in element \'variable\' is empty.", 49));
	ge1105ov15743 = (GE_ms8("EABT", 4));
	ge1105ov15655 = (GE_ms8("\'value\' attribute is missing in element \'variable\'.", 51));
	ge1105ov15742 = (GE_ms8("EABS", 4));
	ge1105ov15654 = (GE_ms8("\'name\' attribute in element \'variable\' is empty.", 48));
	ge1105ov15741 = (GE_ms8("EABR", 4));
	ge1105ov15653 = (GE_ms8("\'name\' attribute is missing in element \'variable\'.", 50));
	ge1108ov5768 = (GE_ms8("all_classes", 11));
	ge1108ov5771 = (GE_ms8("class", 5));
	ge1108ov5784 = (GE_ms8("feature", 7));
	ge1105ov15752 = (GE_ms8("EACC", 4));
	ge1105ov15664 = (GE_ms8("\'feature\' attribute in element \'root\' is empty.", 47));
	ge1105ov15751 = (GE_ms8("EACB", 4));
	ge1105ov15663 = (GE_ms8("\'class\' attribute in element \'root\' is empty.", 45));
	ge1105ov15750 = (GE_ms8("EACA", 4));
	ge1105ov15662 = (GE_ms8("\'class\' attribute is missing in element \'root\'.", 47));
	ge1105ov15749 = (GE_ms8("EABZ", 4));
	ge1105ov15661 = (GE_ms8("\'all_classes\' attribute \"$5\" in element \'root\' should be a boolean.", 67));
	ge1111ov5767 = (GE_ms8("false", 5));
	ge1111ov5766 = (GE_ms8("true", 4));
	ge1108ov5796 = (GE_ms8("location", 8));
	ge1108ov5775 = (GE_ms8("condition", 9));
	ge1108ov5800 = (GE_ms8("platform", 8));
	ge1108ov5770 = (GE_ms8("build", 5));
	ge1108ov5793 = (GE_ms8("multithreaded", 13));
	ge1108ov5774 = (GE_ms8("concurrency", 11));
	ge1108ov5777 = (GE_ms8("dotnet", 6));
	ge1108ov5778 = (GE_ms8("dynamic_runtime", 15));
	ge1108ov5776 = (GE_ms8("custom", 6));
	ge1108ov5813 = (GE_ms8("version", 7));
	ge1108ov5790 = (GE_ms8("min", 3));
	ge1108ov5791 = (GE_ms8("max", 3));
	ge1108ov5809 = (GE_ms8("type", 4));
	ge1108ov5773 = (GE_ms8("compiler", 8));
	ge1108ov5792 = (GE_ms8("msil_clr", 8));
	ge1105ov15733 = (GE_ms8("EABJ", 4));
	ge1105ov15645 = (GE_ms8("\'type\' attribute \"$5\" in \'version\' condition should be either \"compiler\" or \"msil_clr\".", 87));
	ge1105ov15732 = (GE_ms8("EABI", 4));
	ge1105ov15644 = (GE_ms8("\'type\' attribute is missing in \'version\' condition.", 51));
	ge1105ov15731 = (GE_ms8("EABH", 4));
	ge1105ov15643 = (GE_ms8("\'max\' attribute \"$6\" should be greater than or equal to \'min\' attribute \"$5\" in \'version\' condition.", 100));
	ge1105ov15730 = (GE_ms8("EABG", 4));
	ge1105ov15642 = (GE_ms8("\'max\' attribute \"$5\" in \'version\' condition should be of the form \"N.N.N.N\".", 76));
	ge1105ov15729 = (GE_ms8("EABF", 4));
	ge1105ov15641 = (GE_ms8("\'min\' attribute \"$5\" in \'version\' condition should be of the form \"N.N.N.N\".", 76));
	ge1108ov5780 = (GE_ms8("excluded_value", 14));
	ge1105ov15715 = (GE_ms8("EAAR", 4));
	ge1105ov15627 = (GE_ms8("\'excluded_value\' attribute in \'custom\' condition is empty.", 58));
	ge1105ov15716 = (GE_ms8("EAAS", 4));
	ge1105ov15628 = (GE_ms8("\'value\' or \'excluded_value\' attribute is missing in \'custom\' condition.", 71));
	ge1105ov15714 = (GE_ms8("EAAQ", 4));
	ge1105ov15626 = (GE_ms8("\'value\' attribute in \'custom\' condition is empty.", 49));
	ge1105ov15713 = (GE_ms8("EAAP", 4));
	ge1105ov15625 = (GE_ms8("cannot have both \'value\' and \'excluded_value\' in \'custom\' condition.", 68));
	ge1105ov15712 = (GE_ms8("EAAO", 4));
	ge1105ov15624 = (GE_ms8("\'name\' attribute in \'custom\' condition is empty.", 48));
	ge1105ov15711 = (GE_ms8("EAAN", 4));
	ge1105ov15623 = (GE_ms8("\'name\' attribute is missing in \'custom\' condition.", 50));
	ge1105ov15720 = (GE_ms8("EAAW", 4));
	ge1105ov15632 = (GE_ms8("\'value\' attribute \"$5\" in \'dynamic_runtime\' condition should be a boolean.", 74));
	ge1105ov15719 = (GE_ms8("EAAV", 4));
	ge1105ov15631 = (GE_ms8("\'value\' attribute is missing in \'dynamic_runtime\' condition.", 60));
	ge1105ov15718 = (GE_ms8("EAAU", 4));
	ge1105ov15630 = (GE_ms8("\'value\' attribute \"$5\" in \'dotnet\' condition should be a boolean.", 65));
	ge1105ov15717 = (GE_ms8("EAAT", 4));
	ge1105ov15629 = (GE_ms8("\'value\' attribute is missing in \'dotnet\' condition.", 51));
	ge1105ov15780 = (GE_ms8("EADE", 4));
	ge1105ov15692 = (GE_ms8("\'value\' or \'excluded_value\' attribute is missing in \'concurrency\' condition.", 76));
	ge1105ov15779 = (GE_ms8("EADD", 4));
	ge1105ov15691 = (GE_ms8("\'excluded_value\' attribute in \'concurrency\' condition is empty.", 63));
	ge1105ov15778 = (GE_ms8("EADC", 4));
	ge1105ov15690 = (GE_ms8("\'value\' attribute in \'concurrency\' condition is empty.", 54));
	ge1105ov15777 = (GE_ms8("EADB", 4));
	ge1105ov15689 = (GE_ms8("cannot have both \'value\' and \'excluded_value\' in \'concurrency\' condition.", 73));
	ge1105ov15722 = (GE_ms8("EAAY", 4));
	ge1105ov15634 = (GE_ms8("\'value\' attribute \"$5\" in \'multithreaded\' condition should be a boolean.", 72));
	ge1105ov15721 = (GE_ms8("EAAX", 4));
	ge1105ov15633 = (GE_ms8("\'value\' attribute is missing in \'multithreaded\' condition.", 58));
	ge1105ov15704 = (GE_ms8("EAAG", 4));
	ge1105ov15616 = (GE_ms8("\'excluded_value\' attribute in \'build\' condition is empty.", 57));
	ge1105ov15705 = (GE_ms8("EAAH", 4));
	ge1105ov15617 = (GE_ms8("\'value\' or \'excluded_value\' attribute is missing in \'build\' condition.", 70));
	ge1105ov15703 = (GE_ms8("EAAF", 4));
	ge1105ov15615 = (GE_ms8("\'value\' attribute in \'build\' condition is empty.", 48));
	ge1105ov15702 = (GE_ms8("EAAE", 4));
	ge1105ov15614 = (GE_ms8("cannot have both \'value\' and \'excluded_value\' in \'build\' condition.", 67));
	ge1105ov15725 = (GE_ms8("EABB", 4));
	ge1105ov15637 = (GE_ms8("\'excluded_value\' attribute in \'platform\' condition is empty.", 60));
	ge1105ov15726 = (GE_ms8("EABC", 4));
	ge1105ov15638 = (GE_ms8("\'value\' or \'excluded_value\' attribute is missing in \'platform\' condition.", 73));
	ge1105ov15724 = (GE_ms8("EABA", 4));
	ge1105ov15636 = (GE_ms8("\'value\' attribute in \'platform\' condition is empty.", 51));
	ge1105ov15723 = (GE_ms8("EAAZ", 4));
	ge1105ov15635 = (GE_ms8("cannot have both \'value\' and \'excluded_value\' in \'platform\' condition.", 70));
	ge1105ov15763 = (GE_ms8("EACN", 4));
	ge1105ov15675 = (GE_ms8("\'location\' attribute in element \'external_object\' is empty.", 59));
	ge1105ov15762 = (GE_ms8("EACM", 4));
	ge1105ov15674 = (GE_ms8("\'location\' attribute is missing in element \'external_object\'.", 61));
	ge1105ov15761 = (GE_ms8("EACL", 4));
	ge1105ov15673 = (GE_ms8("\'location\' attribute in element \'external_library\' is empty.", 60));
	ge1105ov15760 = (GE_ms8("EACK", 4));
	ge1105ov15672 = (GE_ms8("\'location\' attribute is missing in element \'external_library\'.", 62));
	ge1105ov15759 = (GE_ms8("EACJ", 4));
	ge1105ov15671 = (GE_ms8("\'location\' attribute in element \'external_include\' is empty.", 60));
	ge1105ov15758 = (GE_ms8("EACI", 4));
	ge1105ov15670 = (GE_ms8("\'location\' attribute is missing in element \'external_include\'.", 62));
	ge1108ov5779 = (GE_ms8("exclude", 7));
	ge1108ov5786 = (GE_ms8("include", 7));
	ge1108ov5802 = (GE_ms8("readonly", 8));
	ge1108ov5801 = (GE_ms8("prefix", 6));
	ge1108ov5804 = (GE_ms8("renaming", 8));
	ge1108ov5797 = (GE_ms8("old_name", 8));
	ge1108ov5795 = (GE_ms8("new_name", 8));
	ge1105ov15768 = (GE_ms8("EACS", 4));
	ge1105ov15680 = (GE_ms8("\'old_name\' attribute $5 already appears in another \'renaming\' clause.", 69));
	ge1105ov15767 = (GE_ms8("EACR", 4));
	ge1105ov15679 = (GE_ms8("\'new_name\' attribute in \'renaming\' clause is empty.", 51));
	ge1105ov15766 = (GE_ms8("EACQ", 4));
	ge1105ov15678 = (GE_ms8("\'new_name\' attribute is missing in \'renaming\' clause.", 53));
	ge1105ov15765 = (GE_ms8("EACP", 4));
	ge1105ov15677 = (GE_ms8("\'old_name\' attribute in \'renaming\' clause is empty.", 51));
	ge1105ov15764 = (GE_ms8("EACO", 4));
	ge1105ov15676 = (GE_ms8("\'old_name\' attribute is missing in \'renaming\' clause.", 53));
	ge1105ov15772 = (GE_ms8("EACW", 4));
	ge1105ov15684 = (GE_ms8("\'readonly\' attribute \"$5\" in element \'assembly\' should be a boolean.", 68));
	ge1105ov15776 = (GE_ms8("EADA", 4));
	ge1105ov15688 = (GE_ms8("\'location\' attribute in element \'assembly\' is empty.", 52));
	ge1105ov15775 = (GE_ms8("EACZ", 4));
	ge1105ov15687 = (GE_ms8("\'name\' attribute in element \'assembly\' is empty.", 48));
	ge1105ov15774 = (GE_ms8("EACY", 4));
	ge1105ov15686 = (GE_ms8("\'location\' attribute is missing in element \'assembly\'.", 54));
	ge1105ov15773 = (GE_ms8("EACX", 4));
	ge1105ov15685 = (GE_ms8("\'name\' attribute is missing in element \'assembly\'.", 50));
	ge1105ov15771 = (GE_ms8("EACV", 4));
	ge1105ov15683 = (GE_ms8("\'readonly\' attribute \"$5\" in element \'library\' should be a boolean.", 67));
	ge1105ov15701 = (GE_ms8("EAAD", 4));
	ge1105ov15613 = (GE_ms8("\'location\' attribute in element \'library\' is empty.", 51));
	ge1105ov15700 = (GE_ms8("EAAC", 4));
	ge1105ov15612 = (GE_ms8("\'name\' attribute in element \'library\' is empty.", 47));
	ge1105ov15699 = (GE_ms8("EAAB", 4));
	ge1105ov15611 = (GE_ms8("\'location\' attribute is missing in element \'library\'.", 53));
	ge1105ov15698 = (GE_ms8("EAAA", 4));
	ge1105ov15610 = (GE_ms8("\'name\' attribute is missing in element \'library\'.", 49));
	ge1108ov5803 = (GE_ms8("recursive", 9));
	ge1105ov15770 = (GE_ms8("EACU", 4));
	ge1105ov15682 = (GE_ms8("\'readonly\' attribute \"$5\" in element \'override\' should be a boolean.", 68));
	ge1105ov15757 = (GE_ms8("EACH", 4));
	ge1105ov15669 = (GE_ms8("\'recursive\' attribute \"$5\" in element \'override\' should be a boolean.", 69));
	ge1105ov15756 = (GE_ms8("EACG", 4));
	ge1105ov15668 = (GE_ms8("\'location\' attribute in element \'override\' is empty.", 52));
	ge1105ov15754 = (GE_ms8("EACE", 4));
	ge1105ov15666 = (GE_ms8("\'location\' attribute is missing in element \'override\'.", 54));
	ge1105ov15755 = (GE_ms8("EACF", 4));
	ge1105ov15667 = (GE_ms8("\'name\' attribute in element \'override\' is empty.", 48));
	ge1105ov15753 = (GE_ms8("EACD", 4));
	ge1105ov15665 = (GE_ms8("\'name\' attribute is missing in element \'override\'.", 50));
	ge1105ov15769 = (GE_ms8("EACT", 4));
	ge1105ov15681 = (GE_ms8("\'readonly\' attribute \"$5\" in element \'cluster\' should be a boolean.", 67));
	ge1105ov15710 = (GE_ms8("EAAM", 4));
	ge1105ov15622 = (GE_ms8("\'recursive\' attribute \"$5\" in element \'cluster\' should be a boolean.", 68));
	ge1105ov15709 = (GE_ms8("EAAL", 4));
	ge1105ov15621 = (GE_ms8("\'location\' attribute in element \'cluster\' is empty.", 51));
	ge1105ov15707 = (GE_ms8("EAAJ", 4));
	ge1105ov15619 = (GE_ms8("\'location\' attribute is missing in element \'cluster\'.", 53));
	ge1105ov15708 = (GE_ms8("EAAK", 4));
	ge1105ov15620 = (GE_ms8("\'name\' attribute in element \'cluster\' is empty.", 47));
	ge1105ov15706 = (GE_ms8("EAAI", 4));
	ge1105ov15618 = (GE_ms8("\'name\' attribute is missing in element \'cluster\'.", 49));
	ge1105ov15728 = (GE_ms8("EABE", 4));
	ge1105ov15640 = (GE_ms8("\'name\' attribute in element \'target\' is empty.", 46));
	ge1105ov15727 = (GE_ms8("EABD", 4));
	ge1105ov15639 = (GE_ms8("\'name\' attribute is missing in element \'target\'.", 48));
	ge1105ov15737 = (GE_ms8("EABN", 4));
	ge1105ov15649 = (GE_ms8("\'name\' attribute in element \'system\' describing a library is empty.", 67));
	ge1105ov15736 = (GE_ms8("EABM", 4));
	ge1105ov15648 = (GE_ms8("\'name\' attribute is missing in element \'system\' describing a library.", 69));
	ge1105ov15738 = (GE_ms8("EABO", 4));
	ge1105ov15650 = (GE_ms8("\'uuid\' attribute is missing in element \'system\' describing a library.", 69));
	ge1105ov15745 = (GE_ms8("EABV", 4));
	ge1105ov15657 = (GE_ms8("cannot open library ECF file \"$5\".", 34));
	ge1097ov6061 = (GE_ms8("multithreaded", 13));
	ge1097ov6060 = (GE_ms8("msil_generation", 15));
	ge1105ov15735 = (GE_ms8("EABL", 4));
	ge1105ov15647 = (GE_ms8("\'name\' attribute in element \'system\' is empty.", 46));
	ge1105ov15734 = (GE_ms8("EABK", 4));
	ge1105ov15646 = (GE_ms8("\'name\' attribute is missing in element \'system\'.", 48));
	ge1286ov14736 = (GE_ms8("PE reference only allowed in DTD", 32));
	ge1286ov14698 = (GE_ms8("< not allowed in attribute value", 32));
	ge1286ov14696 = (GE_ms8("-- not allowed in comment", 25));
	ge1286ov14737 = (GE_ms8("xml prefix reserved in processing instruction", 45));
	ge1286ov14709 = (GE_ms8("Misformed XML Declaration", 25));
	ge1286ov14708 = (GE_ms8("Misplaced markup declaration", 28));
	ge1286ov14719 = (GE_ms8("End tag does not match start tag", 32));
	ge1286ov14713 = (GE_ms8("Missing element end tag", 23));
	ge1286ov14712 = (GE_ms8("Error in element content", 24));
	ge1286ov14711 = (GE_ms8("Misformed start tag", 19));
	ge1286ov14717 = (GE_ms8("Attribute declared twice", 24));
	ge1286ov14716 = (GE_ms8("Misformed attribute in tag", 26));
	ge1286ov14718 = (GE_ms8("Error in end tag", 16));
	ge1286ov14695 = (GE_ms8("]]> not allowed in content", 26));
	ge1286ov14721 = (GE_ms8("Error in XML declaration", 24));
	ge1286ov14730 = (GE_ms8("Misformed element type declaration", 34));
	ge1289ov14550 = (GE_ms8("*", 1));
	ge1289ov14548 = (GE_ms8("+", 1));
	ge1289ov14549 = (GE_ms8("\?", 1));
	ge1286ov14731 = (GE_ms8("Misformed attribute list declaration", 36));
	ge1286ov14732 = (GE_ms8("Misformed attribute definition declaration", 42));
	ge1286ov14735 = (GE_ms8("Misformed conditional section", 29));
	ge1286ov14733 = (GE_ms8("Misformed entity declaration", 28));
	ge1286ov14734 = (GE_ms8("Misformed entity notation", 25));
	ge1286ov14728 = (GE_ms8("Parser is not configured to support external DTDs", 49));
	ge1282ov28945 = (GE_ms8("1.0", 3));
	ge1282ov28946 = (GE_ms8("utf-8", 5));
	ge1286ov14701 = (GE_ms8("unsupported character encoding", 30));
	ge1286ov14724 = (GE_ms8("External reference in quoted value", 34));
	ge1279ov14184 = (GE_ms8("undefined", 9));
	ge1279ov14183 = (GE_ms8("(TRUNCATED)", 11));
	ge1286ov14744 = (GE_ms8("Unexpected non-ASCII character in ASCII-only mode", 49));
	ge1286ov14745 = (GE_ms8("Unexpected non-latin1 character in latin1-only mode", 51));
	ge1286ov14746 = (GE_ms8("Invalid UTF8 character sequence", 31));
	ge1286ov14739 = (GE_ms8("Name misformed", 14));
	ge1286ov14722 = (GE_ms8("Literal entity expected in attribute", 36));
	ge1286ov14723 = (GE_ms8("Entity is not defined", 21));
	ge1286ov14725 = (GE_ms8("Entity cannot be recursively included", 37));
	ge1286ov14729 = (GE_ms8("Undefined PE entity", 19));
	ge265ov12329 = (GE_ms8("..", 2));
	ge253ov12604 = (GE_ms8("..", 2));
	ge253ov12603 = (GE_ms8(".", 1));
	ge268ov12329 = (GE_ms8("..", 2));
	ge1236ov14047 = (GE_ms8("root", 4));
	ge1126ov4787 = (GE_ms8("abstract", 8));
	ge1126ov4788 = (GE_ms8("address_expression", 18));
	ge1126ov4789 = (GE_ms8("arguments", 9));
	ge1126ov4790 = (GE_ms8("array_optimization", 18));
	ge1126ov4791 = (GE_ms8("assembly", 8));
	ge1126ov4792 = (GE_ms8("assertion", 9));
	ge1126ov4793 = (GE_ms8("attached_by_default", 19));
	ge1126ov4794 = (GE_ms8("automatic_backup", 16));
	ge1126ov4795 = (GE_ms8("callback", 8));
	ge1126ov4796 = (GE_ms8("case_insensitive", 16));
	ge1126ov4797 = (GE_ms8("check_generic_creation_constraint", 33));
	ge1126ov4798 = (GE_ms8("check_vape", 10));
	ge1126ov4799 = (GE_ms8("clean", 5));
	ge1126ov4800 = (GE_ms8("cls_compliant", 13));
	ge1126ov4801 = (GE_ms8("component", 9));
	ge1126ov4802 = (GE_ms8("console_application", 19));
	ge1126ov4803 = (GE_ms8("create_keyword_extension", 24));
	ge1126ov4804 = (GE_ms8("culture", 7));
	ge1126ov4805 = (GE_ms8("c_compiler_options", 18));
	ge1126ov4806 = (GE_ms8("dead_code_removal", 17));
	ge1126ov4807 = (GE_ms8("debug", 5));
	ge1126ov4808 = (GE_ms8("debug_tag", 9));
	ge1126ov4809 = (GE_ms8("debugger", 8));
	ge1126ov4810 = (GE_ms8("document", 8));
	ge1126ov4811 = (GE_ms8("dotnet_naming_convention", 24));
	ge1126ov4812 = (GE_ms8("dynamic_runtime", 15));
	ge1126ov4813 = (GE_ms8("ecf_library", 11));
	ge1126ov4814 = (GE_ms8("enforce_unique_class_names", 26));
	ge1126ov4815 = (GE_ms8("exception_trace", 15));
	ge1126ov4816 = (GE_ms8("exclude", 7));
	ge1126ov4817 = (GE_ms8("export", 6));
	ge1126ov4818 = (GE_ms8("external_runtime", 16));
	ge1126ov4819 = (GE_ms8("finalize", 8));
	ge1126ov4820 = (GE_ms8("flat_fst_optimization", 21));
	ge1126ov4821 = (GE_ms8("force_32bits", 12));
	ge1126ov4822 = (GE_ms8("fst_expansion_factor", 20));
	ge1126ov4823 = (GE_ms8("fst_optimization", 16));
	ge1126ov4824 = (GE_ms8("full_class_checking", 19));
	ge1126ov4825 = (GE_ms8("garbage_collector", 17));
	ge1126ov4826 = (GE_ms8("gc_info", 7));
	ge1126ov4827 = (GE_ms8("heap_size", 9));
	ge1126ov4828 = (GE_ms8("header", 6));
	ge1126ov4829 = (GE_ms8("high_memory_compiler", 20));
	ge1126ov4830 = (GE_ms8("il_verifiable", 13));
	ge1126ov4831 = (GE_ms8("include", 7));
	ge1126ov4832 = (GE_ms8("inlining", 8));
	ge1126ov4833 = (GE_ms8("inlining_size", 13));
	ge1126ov4834 = (GE_ms8("jumps_optimization", 18));
	ge1126ov4835 = (GE_ms8("layout", 6));
	ge1126ov4836 = (GE_ms8("layout_optimization", 19));
	ge1126ov4837 = (GE_ms8("leaves_optimization", 19));
	ge1126ov4838 = (GE_ms8("line_generation", 15));
	ge1126ov4839 = (GE_ms8("link", 4));
	ge1126ov4840 = (GE_ms8("linker", 6));
	ge1126ov4841 = (GE_ms8("linux_fpu_double_precision", 26));
	ge1126ov4842 = (GE_ms8("manifest_string_trace", 21));
	ge1126ov4843 = (GE_ms8("map", 3));
	ge1126ov4844 = (GE_ms8("metadata_cache_path", 19));
	ge1126ov4845 = (GE_ms8("msil_assembly_compatibility", 27));
	ge1126ov4846 = (GE_ms8("msil_classes_per_module", 23));
	ge1126ov4847 = (GE_ms8("msil_clr_version", 16));
	ge1126ov4848 = (GE_ms8("msil_culture", 12));
	ge1126ov4849 = (GE_ms8("msil_generation", 15));
	ge1126ov4850 = (GE_ms8("msil_generation_version", 23));
	ge1126ov4851 = (GE_ms8("msil_key_file_name", 18));
	ge1126ov4852 = (GE_ms8("msil_use_optimized_precompile", 29));
	ge1126ov4853 = (GE_ms8("multithreaded", 13));
	ge1126ov4854 = (GE_ms8("namespace", 9));
	ge1126ov4855 = (GE_ms8("no_default_lib", 14));
	ge1126ov4856 = (GE_ms8("old_verbatim_strings", 20));
	ge1126ov4857 = (GE_ms8("override_cluster", 16));
	ge1126ov4858 = (GE_ms8("portable_code_generation", 24));
	ge1126ov4859 = (GE_ms8("precompiled", 11));
	ge1126ov4860 = (GE_ms8("prefix", 6));
	ge1126ov4861 = (GE_ms8("profile", 7));
	ge1126ov4862 = (GE_ms8("public_key_token", 16));
	ge1126ov4863 = (GE_ms8("read_only", 9));
	ge1126ov4864 = (GE_ms8("recursive", 9));
	ge1126ov4865 = (GE_ms8("reloads_optimization", 20));
	ge1126ov4866 = (GE_ms8("shared_library_definition", 25));
	ge1126ov4867 = (GE_ms8("split", 5));
	ge1126ov4868 = (GE_ms8("stack_size", 10));
	ge1126ov4869 = (GE_ms8("storable", 8));
	ge1126ov4870 = (GE_ms8("storable_filename", 17));
	ge1126ov4871 = (GE_ms8("strip", 5));
	ge1126ov4872 = (GE_ms8("syntax", 6));
	ge1126ov4873 = (GE_ms8("target", 6));
	ge1126ov4874 = (GE_ms8("trace", 5));
	ge1126ov4875 = (GE_ms8("use_cluster_name_as_namespace", 29));
	ge1126ov4876 = (GE_ms8("use_full_cluster_name_as_namespace", 34));
	ge1126ov4877 = (GE_ms8("verbose", 7));
	ge1126ov4878 = (GE_ms8("version", 7));
	ge1126ov4879 = (GE_ms8("visible_filename", 16));
	ge1126ov4880 = (GE_ms8("void_safety", 11));
	ge1126ov4881 = (GE_ms8("warning", 7));
	ge1126ov4882 = (GE_ms8("wedit", 5));
	ge1126ov4983 = (GE_ms8("boehm", 5));
	ge1126ov4995 = (GE_ms8("internal", 8));
	ge1157ov4754 = (GE_ms8("", 0));
	ge1126ov5006 = (GE_ms8("require", 7));
	ge1126ov4991 = (GE_ms8("ensure", 6));
	ge1126ov4996 = (GE_ms8("invariant", 9));
	ge1126ov4997 = (GE_ms8("loop_invariant", 14));
	ge1126ov4998 = (GE_ms8("loop_variant", 12));
	ge1126ov4984 = (GE_ms8("check", 5));
	ge1126ov5002 = (GE_ms8("none", 4));
	ge1126ov5009 = (GE_ms8("style", 5));
	ge1126ov4989 = (GE_ms8("default", 7));
	ge1126ov4980 = (GE_ms8("all", 3));
	ge1126ov5005 = (GE_ms8("on_demand", 9));
	ge1126ov4987 = (GE_ms8("complete", 8));
	ge1126ov4992 = (GE_ms8("exe", 3));
	ge1126ov4990 = (GE_ms8("dll", 3));
	ge1126ov4986 = (GE_ms8("com", 3));
	ge1126ov5001 = (GE_ms8("no_main", 7));
	ge1126ov5003 = (GE_ms8("obsolete", 8));
	ge1126ov5011 = (GE_ms8("transitional", 12));
	ge1126ov5008 = (GE_ms8("standard", 8));
	ge1126ov5000 = (GE_ms8("microsoft", 9));
	ge1126ov4982 = (GE_ms8("auto", 4));
	ge1126ov5007 = (GE_ms8("sequential", 10));
	ge1126ov4981 = (GE_ms8("array", 5));
	ge1126ov4988 = (GE_ms8("constant", 8));
	ge1126ov5004 = (GE_ms8("once", 4));
	ge1126ov4999 = (GE_ms8("low_level", 9));
	ge1126ov4993 = (GE_ms8("feature", 7));
	ge1126ov4985 = (GE_ms8("class", 5));
	ge1126ov5013 = (GE_ms8("winapi", 6));
	ge1126ov4994 = (GE_ms8("generate", 8));
	ge1126ov5010 = (GE_ms8("supplier_precondition", 21));
	ge1157ov4753 = (GE_ms8("false", 5));
	ge1157ov4752 = (GE_ms8("true", 4));
	ge1116ov22076 = (GE_ms8("", 0));
	ge1122ov14434 = (GE_ms8("", 0));
	ge1322ov5637 = (GE_ms8(" \t\r\n", 4));
	ge9ov4625 = (GE_ms8("The value \'$2\' is not valid for the option \'$1\'.", 48));
	ge9ov4632 = (GE_ms8("APIPAR", 6));
	ge7ov4688 = (GE_ms8("usage: ", 7));
	ge284ov1975 = (GE_ms8("3.9", 3));
	ge6ov4262 = (GE_ms8("Errors parsing arguments, aborting.", 35));
	ge9ov4628 = (GE_ms8("Too many occurrences of option \'$1\'.", 36));
	ge9ov4635 = (GE_ms8("APSOPT", 6));
	ge9ov4626 = (GE_ms8("The mandatory option \'$1\' is missing.", 37));
	ge9ov4633 = (GE_ms8("APMOPT", 6));
	ge9ov4627 = (GE_ms8("The option \'$1\' is missing a parameter.", 39));
	ge9ov4634 = (GE_ms8("APMPAR", 6));
	ge9ov4629 = (GE_ms8("Unknown option \'$1\'.", 20));
	ge9ov4636 = (GE_ms8("APUOPT", 6));
	ge9ov4630 = (GE_ms8("The flag \'$1\' was given the parameter \'$2\'.", 43));
	ge9ov4637 = (GE_ms8("APUPAR", 6));
	ge6ov4257 = (GE_ms8("help", 4));
	ge6ov4256 = (GE_ms8("Display this help text.", 23));
	ge6ov4264 = (GE_ms8("parameters ...", 14));
	ge6ov4263 = (GE_ms8("", 0));
	ge1165ov3020 = (GE_ms8("ISE_LIBRARY", 11));
	ge1165ov3018 = (GE_ms8("ISE_EIFFEL", 10));
	ge1293ov28515 = (GE_ms8(" ", 1));
	ge1293ov28516 = (GE_ms8("  ", 2));
	ge1284ov30598 = (GE_ms8("iso-8859-1", 10));
	ge1284ov30600 = (GE_ms8("utf-16", 6));
	ge808ov11410 = (GE_ms8("NATIVE_ARRAY", 12));
	ge1006ov37533 = (GE_ms8("gaaaa", 5));
	ge1006ov37531 = (GE_ms8("GAAAA", 5));
	ge1006ov37529 = (GE_ms8("[$1] assembly $2: .NET assemblies not supported.", 48));
	ge903ov17639 = (GE_ms8("TUPLE", 5));
	ge896ov26943 = (GE_ms8("like ", 5));
	ge871ov32479 = (GE_ms8("BIT ", 4));
	ge892ov26935 = (GE_ms8("like Current", 12));
	ge1016ov28124 = (GE_ms8("vtgc0a", 6));
	ge1016ov27857 = (GE_ms8("VTGC", 4));
	ge1016ov27674 = (GE_ms8("`$7\' is not the final name of a procedure in constraint\'s base class $8.", 72));
	ge1016ov28125 = (GE_ms8("vtgc0b", 6));
	ge1016ov27675 = (GE_ms8("`$7\' is not the final name of a procedure in constraint\'s base class $8.", 72));
	ge1016ov28024 = (GE_ms8("vgcp3c", 6));
	ge1016ov27805 = (GE_ms8("VGCP-3", 6));
	ge1016ov27574 = (GE_ms8("procedure name `$7\' appears twice in creation clause of constraint.", 67));
	ge808ov11664 = (GE_ms8("attached", 8));
	ge1016ov27938 = (GE_ms8("vdrd2c", 6));
	ge1016ov27767 = (GE_ms8("VDRD-2", 6));
	ge1016ov27488 = (GE_ms8("signature of selected feature `$7\' does not conform to the signature of replicated feature `$8\' in parent $9.", 109));
	ge1016ov27939 = (GE_ms8("vdrd2d", 6));
	ge1016ov27489 = (GE_ms8("signature of selected feature `$7\' inherited from $8 does not conform to the signature of replicated feature `$9\' in parent $10.", 128));
	ge1016ov27922 = (GE_ms8("vdjr0b", 6));
	ge1016ov27760 = (GE_ms8("VDJR", 4));
	ge1016ov27472 = (GE_ms8("joined deferred features `$7\' inherited from $8 and $9 don\'t have the same signature. Type of argument number $10 differs.", 122));
	ge1016ov27921 = (GE_ms8("vdjr0a", 6));
	ge1016ov27471 = (GE_ms8("joined deferred features `$7\' inherited from $8 and $9 don\'t have the same signature. Different number of arguments.", 116));
	ge1016ov27923 = (GE_ms8("vdjr0c", 6));
	ge1016ov27473 = (GE_ms8("joined deferred features `$7\' inherited from $8 and $9 don\'t have the same signature. Type of result differs.", 109));
	ge1016ov27947 = (GE_ms8("vdrd6b", 6));
	ge1016ov27771 = (GE_ms8("VDRD-6", 6));
	ge1016ov27497 = (GE_ms8("attribute `$7\' inherited from $8 and its redeclared version don\'t have the same type expandedness.", 98));
	ge1016ov27936 = (GE_ms8("vdrd2a", 6));
	ge1016ov27486 = (GE_ms8("signature of feature `$7\' does not conform to the signature of redeclared feature `$8\' in parent $9.", 100));
	ge1016ov27937 = (GE_ms8("vdrd2b", 6));
	ge1016ov27487 = (GE_ms8("signature of feature `$7\' inherited from $8 does not conform to the signature of redeclared feature `$9\' in parent $10.", 119));
	ge1016ov28056 = (GE_ms8("vmrc2b", 6));
	ge1016ov27822 = (GE_ms8("VMRC-2", 6));
	ge1016ov27606 = (GE_ms8("replicated features $7 have been selected more than once.", 57));
	ge1016ov28055 = (GE_ms8("vmrc2a", 6));
	ge1016ov27605 = (GE_ms8("replicated features $7 have not been selected.", 46));
	ge1016ov28057 = (GE_ms8("vmss1a", 6));
	ge1016ov27823 = (GE_ms8("VMSS-1", 6));
	ge1016ov27607 = (GE_ms8("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge1016ov27951 = (GE_ms8("vdrs1a", 6));
	ge1016ov27773 = (GE_ms8("VDRS-1", 6));
	ge1016ov27501 = (GE_ms8("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge1016ov27957 = (GE_ms8("vdus1a", 6));
	ge1016ov27777 = (GE_ms8("VDUS-1", 6));
	ge1016ov27507 = (GE_ms8("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge1016ov28048 = (GE_ms8("vlel2a", 6));
	ge1016ov27818 = (GE_ms8("VLEL-2", 6));
	ge1016ov27598 = (GE_ms8("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge1016ov28031 = (GE_ms8("vhrc1a", 6));
	ge1016ov27808 = (GE_ms8("VHRC-1", 6));
	ge1016ov27581 = (GE_ms8("`$7\' is not the final name of a feature in $8.", 46));
	ge1016ov28058 = (GE_ms8("vmss2a", 6));
	ge1016ov27824 = (GE_ms8("VMSS-2", 6));
	ge1016ov27608 = (GE_ms8("feature name `$7\' appears twice in the Select subclause of parent $8.", 69));
	ge1016ov27954 = (GE_ms8("vdrs3a", 6));
	ge1016ov27775 = (GE_ms8("VDRS-3", 6));
	ge1016ov27504 = (GE_ms8("feature name `$7\' appears twice in the Redefine subclause of parent $8.", 71));
	ge1016ov27961 = (GE_ms8("vdus4a", 6));
	ge1016ov27780 = (GE_ms8("VDUS-4", 6));
	ge1016ov27511 = (GE_ms8("feature name `$7\' appears twice in the Undefine subclause of parent $8.", 71));
	ge1016ov28049 = (GE_ms8("vlel3a", 6));
	ge1016ov27819 = (GE_ms8("VLEL-3", 6));
	ge1016ov27599 = (GE_ms8("feature name `$7\' appears twice in the Export subclause of parent $8.", 69));
	ge1016ov28047 = (GE_ms8("vlel1a", 6));
	ge1016ov27817 = (GE_ms8("VLEL-1", 6));
	ge1016ov27597 = (GE_ms8("\'all\' keyword appears twice in the Export subclause of parent $7.", 65));
	ge1016ov28032 = (GE_ms8("vhrc2a", 6));
	ge1016ov27809 = (GE_ms8("VHRC-2", 6));
	ge1016ov27582 = (GE_ms8("feature name `$7\' appears as first element of two Rename_pairs.", 63));
	ge1016ov28050 = (GE_ms8("vmfn0a", 6));
	ge1016ov27820 = (GE_ms8("VMFN", 4));
	ge1016ov27600 = (GE_ms8("two features with the same name `$7\'.", 37));
	ge808ov11662 = (GE_ms8("as", 2));
	ge808ov11500 = (GE_ms8("forth", 5));
	ge808ov11436 = (GE_ms8("after", 5));
	ge808ov11567 = (GE_ms8("new_cursor", 10));
	ge808ov11483 = (GE_ms8("dispose", 7));
	ge1016ov28173 = (GE_ms8("gvkfe5a", 7));
	ge1016ov27888 = (GE_ms8("GVKFE-5", 7));
	ge1016ov27723 = (GE_ms8("feature `$7\' in kernel class $5 is not a query.", 47));
	ge808ov11528 = (GE_ms8("is_equal", 8));
	ge808ov11474 = (GE_ms8("copy", 4));
	ge1016ov28020 = (GE_ms8("vgcp2a", 6));
	ge1016ov27804 = (GE_ms8("VGCP-2", 6));
	ge1016ov27570 = (GE_ms8("`$7\' is not the final name of a procedure.", 42));
	ge1016ov28021 = (GE_ms8("vgcp2b", 6));
	ge1016ov27571 = (GE_ms8("`$7\' is not the final name of a procedure.", 42));
	ge1016ov28012 = (GE_ms8("vgcc6a", 6));
	ge1016ov27801 = (GE_ms8("VGCC-6", 6));
	ge1016ov27562 = (GE_ms8("`$7\' is the final name of a once-procedure.", 43));
	ge1016ov28023 = (GE_ms8("vgcp3b", 6));
	ge1016ov27573 = (GE_ms8("procedure name `$7\' appears in two different creation clauses.", 62));
	ge1016ov28022 = (GE_ms8("vgcp3a", 6));
	ge1016ov27572 = (GE_ms8("procedure name `$7\' appears twice in creation clause.", 53));
	ge1016ov28019 = (GE_ms8("vgcp1a", 6));
	ge1016ov27803 = (GE_ms8("VGCP-1", 6));
	ge1016ov27569 = (GE_ms8("deferred class has a creation clause.", 37));
	ge1016ov27984 = (GE_ms8("vfac4a", 6));
	ge1016ov27789 = (GE_ms8("VFAC-4", 6));
	ge1016ov27534 = (GE_ms8("the type of the $10-th argument of assigner procedure `$8\' and of the $9-th argument of query `$7\' do not have the same deanchored form.", 136));
	ge1016ov27983 = (GE_ms8("vfac3a", 6));
	ge1016ov27788 = (GE_ms8("VFAC-3", 6));
	ge1016ov27533 = (GE_ms8("the type of the first argument of assigner procedure `$8\' and the result type of query `$7\' do not have the same deanchored form.", 129));
	ge1016ov27982 = (GE_ms8("vfac2a", 6));
	ge1016ov27787 = (GE_ms8("VFAC-2", 6));
	ge1016ov27532 = (GE_ms8("the number of arguments in assigner procedure `$8\' is not one more than the number of arguments in query `$7\'.", 110));
	ge1016ov27981 = (GE_ms8("vfac1b", 6));
	ge1016ov27786 = (GE_ms8("VFAC-1", 6));
	ge1016ov27531 = (GE_ms8("query `$7\' has an assigner mark `$8\' but this feature is not a procedure.", 73));
	ge1016ov27980 = (GE_ms8("vfac1a", 6));
	ge1016ov27530 = (GE_ms8("query `$7\' has an assigner mark `$8\' but there is no feature with that name.", 76));
	ge1016ov27910 = (GE_ms8("vcch2a", 6));
	ge1016ov27756 = (GE_ms8("VCCH-2", 6));
	ge1016ov27460 = (GE_ms8("class is marked as deferred but has no deferred feature.", 56));
	ge1016ov27908 = (GE_ms8("vcch1a", 6));
	ge1016ov27755 = (GE_ms8("VCCH-1", 6));
	ge1016ov27458 = (GE_ms8("class is not marked as deferred but has deferred feature `$7\'.", 62));
	ge1016ov27990 = (GE_ms8("vfav1f", 6));
	ge1016ov27790 = (GE_ms8("VFAV-1", 6));
	ge1016ov27540 = (GE_ms8("features `$7\' and `$9\' have both the same binary Operator alias `$8\'.", 69));
	ge1016ov27987 = (GE_ms8("vfav1c", 6));
	ge1016ov27537 = (GE_ms8("features `$7\' and `$9\' have both the same unary Operator alias `$8\'.", 68));
	ge1016ov27998 = (GE_ms8("vfav4b", 6));
	ge1016ov27792 = (GE_ms8("VFAV-4", 6));
	ge1016ov27548 = (GE_ms8("features `$7\' and `$9\' have both the same Parenthesis alias `$8\'.", 65));
	ge1016ov27994 = (GE_ms8("vfav2b", 6));
	ge1016ov27791 = (GE_ms8("VFAV-2", 6));
	ge1016ov27544 = (GE_ms8("features `$7\' and `$9\' have both the same Bracket alias `$8\'.", 61));
	ge1016ov27991 = (GE_ms8("vfav1g", 6));
	ge1016ov27541 = (GE_ms8("features `$7\' and `$9\' inherited from $11 have both the same binary Operator alias `$8\'.", 88));
	ge1016ov27988 = (GE_ms8("vfav1d", 6));
	ge1016ov27538 = (GE_ms8("features `$7\' and `$9\' inherited from $11 have both the same unary Operator alias `$8\'.", 87));
	ge1016ov27999 = (GE_ms8("vfav4c", 6));
	ge1016ov27549 = (GE_ms8("features `$7\' and `$9\' inherited from $11 have both the same Parenthesis alias `$8\'.", 84));
	ge1016ov27995 = (GE_ms8("vfav2c", 6));
	ge1016ov27545 = (GE_ms8("features `$7\' and `$9\' inherited from $11 have both the same Bracket alias `$8\'.", 80));
	ge1016ov27992 = (GE_ms8("vfav1h", 6));
	ge1016ov27542 = (GE_ms8("features `$7\' inherited from $9 and `$10\' inherited from $12 have both the same binary Operator alias `$8\'.", 107));
	ge1016ov27989 = (GE_ms8("vfav1e", 6));
	ge1016ov27539 = (GE_ms8("features `$7\' inherited from $9 and `$10\' inherited from $12 have both the same unary Operator alias `$8\'.", 106));
	ge1016ov28000 = (GE_ms8("vfav4d", 6));
	ge1016ov27550 = (GE_ms8("features `$7\' inherited from $9 and `$10\' inherited from $12 have both the same Parenthesis alias `$8\'.", 103));
	ge1016ov27996 = (GE_ms8("vfav2d", 6));
	ge1016ov27546 = (GE_ms8("features `$7\' inherited from $9 and `$10\' inherited from $12 have both the same Bracket alias `$8\'.", 99));
	ge1016ov28113 = (GE_ms8("vtat2a", 6));
	ge1016ov27852 = (GE_ms8("VTAT-2", 6));
	ge1016ov27663 = (GE_ms8("anchor cycle $7.", 16));
	ge1016ov28006 = (GE_ms8("vffd7b", 6));
	ge1016ov27796 = (GE_ms8("VFFD-7", 6));
	ge1016ov27556 = (GE_ms8("feature `$7\' is a once funtion but its type contains a formal generic parameter.", 80));
	ge1016ov28005 = (GE_ms8("vffd7a", 6));
	ge1016ov27555 = (GE_ms8("feature `$7\' is a once funtion but its type contains an anchored type.", 70));
	ge1016ov27986 = (GE_ms8("vfav1b", 6));
	ge1016ov27536 = (GE_ms8("feature `$7\' has a unary Operator alias `$8\' but is not a query with no argument.", 81));
	ge1016ov27985 = (GE_ms8("vfav1a", 6));
	ge1016ov27535 = (GE_ms8("feature `$7\' has a binary Operator alias `$8\' but is not a query with at exactly one argument.", 94));
	ge1016ov27997 = (GE_ms8("vfav4a", 6));
	ge1016ov27547 = (GE_ms8("feature `$7\' has a Parenthesis alias `$8\' but is not a feature with at least one argument.", 90));
	ge1016ov27993 = (GE_ms8("vfav2a", 6));
	ge1016ov27543 = (GE_ms8("feature `$7\' has a Bracket alias `$8\' but is not a query with at least one argument.", 84));
	ge1016ov28004 = (GE_ms8("vffd6a", 6));
	ge1016ov27795 = (GE_ms8("VFFD-6", 6));
	ge1016ov27554 = (GE_ms8("feature `$7\' has an Infix name but is not a function with exactly one argument.", 79));
	ge1016ov28003 = (GE_ms8("vffd5a", 6));
	ge1016ov27794 = (GE_ms8("VFFD-5", 6));
	ge1016ov27553 = (GE_ms8("feature `$7\' has a Prefix name but is not an attribute or a function with no argument.", 86));
	ge1016ov28002 = (GE_ms8("vffd4a", 6));
	ge1016ov27793 = (GE_ms8("VFFD-4", 6));
	ge1016ov27552 = (GE_ms8("deferred feature `$7\' is marked as frozen.", 42));
	ge1016ov28102 = (GE_ms8("vrfa0a", 6));
	ge1016ov27846 = (GE_ms8("VRFA", 4));
	ge1016ov27652 = (GE_ms8("argument name \'$7\' in feature `$8\' is also the final name of a feature.", 71));
	ge1016ov28100 = (GE_ms8("vreg0a", 6));
	ge1016ov27845 = (GE_ms8("VREG", 4));
	ge1016ov27650 = (GE_ms8("argument name \'$7\' appear twice in feature `$8\'.", 48));
	ge1016ov27925 = (GE_ms8("vdjr2b", 6));
	ge1016ov27761 = (GE_ms8("VDJR-2", 6));
	ge1016ov27475 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $11 has a different one `$10\'.", 110));
	ge1016ov28054 = (GE_ms8("vmfn2b", 6));
	ge1016ov27821 = (GE_ms8("VMFN-2", 6));
	ge1016ov27604 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $11 has a different one `$10\'.", 110));
	ge1016ov27924 = (GE_ms8("vdjr2a", 6));
	ge1016ov27474 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $10 has none.", 93));
	ge1016ov28053 = (GE_ms8("vmfn2a", 6));
	ge1016ov27603 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $10 has none.", 93));
	ge1016ov28052 = (GE_ms8("vmfn0c", 6));
	ge1016ov27602 = (GE_ms8("two features with the same name `$7\' inherited from $8 and `$9\' inherited from $10.", 83));
	ge1016ov27955 = (GE_ms8("vdrs4a", 6));
	ge1016ov27776 = (GE_ms8("VDRS-4", 6));
	ge1016ov27505 = (GE_ms8("Redefine subclause of $8 lists feature `$7\' but it is not redefined.", 68));
	ge1016ov27953 = (GE_ms8("vdrs2b", 6));
	ge1016ov27774 = (GE_ms8("VDRS-2", 6));
	ge1016ov27503 = (GE_ms8("cannot redefine the constant attribute `$7\'.", 44));
	ge1016ov27952 = (GE_ms8("vdrs2a", 6));
	ge1016ov27502 = (GE_ms8("cannot redefine the frozen feature `$7\'.", 40));
	ge1016ov27959 = (GE_ms8("vdus2b", 6));
	ge1016ov27778 = (GE_ms8("VDUS-2", 6));
	ge1016ov27509 = (GE_ms8("cannot undefine the attribute `$7\'.", 35));
	ge1016ov27958 = (GE_ms8("vdus2a", 6));
	ge1016ov27508 = (GE_ms8("cannot undefine the frozen feature `$7\'.", 40));
	ge1016ov27960 = (GE_ms8("vdus3a", 6));
	ge1016ov27779 = (GE_ms8("VDUS-3", 6));
	ge1016ov27510 = (GE_ms8("cannot undefine the deferred feature `$7\'.", 42));
	ge1016ov28036 = (GE_ms8("vhrc4d", 6));
	ge1016ov27810 = (GE_ms8("VHRC-4", 6));
	ge1016ov27586 = (GE_ms8("`$7\' has a unary Operator alias `$8\' but `$9\' in $10 is not a query with no argument.", 85));
	ge1016ov28035 = (GE_ms8("vhrc4c", 6));
	ge1016ov27585 = (GE_ms8("`$7\' has a binary Operator alias `$8\' but `$9\' in $10 is not a query with exactly one argument.", 95));
	ge1016ov28001 = (GE_ms8("vfav4e", 6));
	ge1016ov27551 = (GE_ms8("`$7\' has a Parenthesis alias `$8\' but `$9\' in $10 is not a feature with at least one argument.", 94));
	ge1016ov28034 = (GE_ms8("vhrc4b", 6));
	ge1016ov27584 = (GE_ms8("`$7\' has a Bracket alias `$8\' but `$9\' in $10 is not a query with at least one argument.", 88));
	ge1016ov28033 = (GE_ms8("vhrc4a", 6));
	ge1016ov27583 = (GE_ms8("`$7\' is of the Prefix form but `$8\' in $9 is not an attribute nor a function with no argument.", 94));
	ge1016ov28037 = (GE_ms8("vhrc5a", 6));
	ge1016ov27811 = (GE_ms8("VHRC-5", 6));
	ge1016ov27587 = (GE_ms8("`$7\' is of the Infix form but `$8\' in $9 is not a function with one argument.", 77));
	ge1016ov27941 = (GE_ms8("vdrd3b", 6));
	ge1016ov27768 = (GE_ms8("VDRD-3", 6));
	ge1016ov27491 = (GE_ms8("feature `$7\' is redeclared but its postconditions do not begin with \'ensure then\'.", 82));
	ge1016ov27940 = (GE_ms8("vdrd3a", 6));
	ge1016ov27490 = (GE_ms8("feature `$7\' is redeclared but its preconditions do not begin with \'require else\'.", 82));
	ge1016ov27946 = (GE_ms8("vdrd6a", 6));
	ge1016ov27496 = (GE_ms8("attribute `$7\' inherited from $8 is not redeclared into an attribute.", 69));
	ge1016ov27943 = (GE_ms8("vdrd4b", 6));
	ge1016ov27769 = (GE_ms8("VDRD-4", 6));
	ge1016ov27493 = (GE_ms8("effective feature `$7\' inherited from $8 is redefined but is not listed in the Redefine subclause.", 98));
	ge1016ov27944 = (GE_ms8("vdrd4c", 6));
	ge1016ov27494 = (GE_ms8("effective feature `$8\' inherited from $9 is redefined into a deferred one but is not listed in the Undefine and Redefine subclauses.", 132));
	ge1016ov28051 = (GE_ms8("vmfn0b", 6));
	ge1016ov27601 = (GE_ms8("two features with the same name `$7\' in current class and `$8\' inherited from $9.", 81));
	ge1016ov27942 = (GE_ms8("vdrd4a", 6));
	ge1016ov27492 = (GE_ms8("deferred feature `$7\' inherited from $8 is redefined but is not listed in the Redefine subclause.", 97));
	ge1016ov27956 = (GE_ms8("vdrs4b", 6));
	ge1016ov27506 = (GE_ms8("redeclaration of feature `$7\' from $8 is an effecting and should not appear in the Redefine subclause.", 102));
	ge1016ov27945 = (GE_ms8("vdrd5a", 6));
	ge1016ov27770 = (GE_ms8("VDRD-5", 6));
	ge1016ov27495 = (GE_ms8("effective feature `$7\' inherited from $8 is redefined into a deferred one.", 74));
	ge1016ov27950 = (GE_ms8("vdrd7c", 6));
	ge1016ov27772 = (GE_ms8("VDRD-7", 6));
	ge1016ov27500 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but its redeclared version has a different one `$11\'.", 102));
	ge1016ov27948 = (GE_ms8("vdrd7a", 6));
	ge1016ov27498 = (GE_ms8("feature `$7\' inherited from $8 has no alias but its redeclared version has one `$10\'.", 85));
	ge1016ov27949 = (GE_ms8("vdrd7b", 6));
	ge1016ov27499 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but its redeclared version has none.", 85));
	ge1016ov28059 = (GE_ms8("vmss3a", 6));
	ge1016ov27825 = (GE_ms8("VMSS-3", 6));
	ge1016ov27609 = (GE_ms8("feature name `$7\' appears in the Select subclause of parent $8 but is not replicated.", 85));
	ge1016ov28026 = (GE_ms8("vhpr1a", 6));
	ge1016ov27797 = (GE_ms8("VHPR-1", 6));
	ge1016ov27576 = (GE_ms8("inheritance cycle $7.", 21));
	ge1016ov27920 = (GE_ms8("vcfg3j", 6));
	ge1016ov27759 = (GE_ms8("VCFG-3", 6));
	ge1016ov27470 = (GE_ms8("formal generic constraint cycle $7.", 35));
	ge1016ov27918 = (GE_ms8("vcfg3g", 6));
	ge1016ov27468 = (GE_ms8("formal generic constraint cycle $7.", 35));
	ge1016ov27912 = (GE_ms8("vcfg2a", 6));
	ge1016ov27758 = (GE_ms8("VCFG-2", 6));
	ge1016ov27462 = (GE_ms8("\'$7\' is the name of formal generic parameters #$7 and #$8.", 58));
	ge1016ov27911 = (GE_ms8("vcfg1a", 6));
	ge1016ov27757 = (GE_ms8("VCFG-1", 6));
	ge1016ov27461 = (GE_ms8("formal generic parameter \'$7\' has the same name as a class in the surrounding universe.", 87));
	ge1016ov28162 = (GE_ms8("gvagp0a", 7));
	ge1016ov27877 = (GE_ms8("GVAGP", 5));
	ge1016ov27712 = (GE_ms8("ancestors with generic parameter mismatch: \'$7\' and \'$8\'.", 57));
	ge1016ov28166 = (GE_ms8("gvhso2a", 7));
	ge1016ov27881 = (GE_ms8("GVHSO-2", 7));
	ge1016ov27716 = (GE_ms8("implicitly inherits from class SYSTEM_OBJECT but SYSTEM_OBJECT is not a .NET class.", 83));
	ge1016ov28122 = (GE_ms8("vtct0a", 6));
	ge1016ov27856 = (GE_ms8("VTCT", 4));
	ge1016ov27672 = (GE_ms8("type based on unknown class $7.", 31));
	ge1016ov28165 = (GE_ms8("gvhso1a", 7));
	ge1016ov27880 = (GE_ms8("GVHSO-1", 7));
	ge1016ov27715 = (GE_ms8("implicitly inherits from unknown class SYSTEM_OBJECT.", 53));
	ge1016ov28025 = (GE_ms8("vhay0a", 6));
	ge1016ov27806 = (GE_ms8("VHAY", 4));
	ge1016ov27575 = (GE_ms8("implicitly inherits from unknown class ANY.", 43));
	ge1016ov28027 = (GE_ms8("vhpr1b", 6));
	ge1016ov27577 = (GE_ms8("inheritance cycle when inheriting from $7.", 42));
	ge1005ov36744 = (GE_ms8("gcdep", 5));
	ge1005ov36739 = (GE_ms8("GCDEP", 5));
	ge1005ov36734 = (GE_ms8("[$1] cluster $2: class $3 (from cluster $4) is a provider of class $5 (from cluster $6) which is not contained in any of the clusters $7.", 137));
	ge1005ov36745 = (GE_ms8("gcpro", 5));
	ge1005ov36740 = (GE_ms8("GCPRO", 5));
	ge1005ov36735 = (GE_ms8("[$1] cluster $2: class $3 (from cluster $4) depends on class $5 (from cluster $6) which is not contained in any of the clusters $7.", 131));
	ge1005ov36743 = (GE_ms8("gcaab", 5));
	ge1005ov36738 = (GE_ms8("GCAAB", 5));
	ge1005ov36733 = (GE_ms8("[$1] cluster $2: cannot read Eiffel file \'$3\'.", 46));
	ge1016ov28175 = (GE_ms8("gvscn1b", 7));
	ge1016ov27889 = (GE_ms8("GVSCN-1", 7));
	ge1016ov27725 = (GE_ms8("file \'$8\' does not contain the expected class $5.", 49));
	ge808ov11657 = (GE_ms8("agent", 5));
	ge808ov11702 = (GE_ms8("once", 4));
	ge808ov11656 = (GE_ms8("across", 6));
	ge808ov11653 = (GE_ms8("True", 4));
	ge808ov11717 = (GE_ms8("strip", 5));
	ge808ov11701 = (GE_ms8("old", 3));
	ge808ov11676 = (GE_ms8("else", 4));
	ge808ov11703 = (GE_ms8("or", 2));
	ge808ov11718 = (GE_ms8("then", 4));
	ge808ov11660 = (GE_ms8("and", 3));
	ge808ov11705 = (GE_ms8("precursor", 9));
	ge808ov11672 = (GE_ms8("debug", 5));
	ge808ov11675 = (GE_ms8("do", 2));
	ge808ov11725 = (GE_ms8("when", 4));
	ge808ov11666 = (GE_ms8("check", 5));
	ge808ov11697 = (GE_ms8("loop", 4));
	ge808ov11685 = (GE_ms8("from", 4));
	ge808ov11711 = (GE_ms8("rescue", 6));
	ge808ov11665 = (GE_ms8("attribute", 9));
	ge808ov11388 = (GE_ms8("BIT", 3));
	ge1016ov28118 = (GE_ms8("vtbt0d", 6));
	ge1016ov27853 = (GE_ms8("VTBT", 4));
	ge1016ov27668 = (GE_ms8("invalid type \'$7\': bit size must be a positive integer constant.", 64));
	ge1013ov36752 = (GE_ms8("gssss", 5));
	ge1013ov36751 = (GE_ms8("Syntax error:\n$1", 16));
	ge1016ov28117 = (GE_ms8("vtbt0c", 6));
	ge1016ov27667 = (GE_ms8("invalid type \'$7\': bit size must be a positive integer constant.", 64));
	ge808ov11723 = (GE_ms8("variant", 7));
	ge808ov11693 = (GE_ms8("invariant", 9));
	ge808ov11679 = (GE_ms8("ensure", 6));
	ge808ov11710 = (GE_ms8("require", 7));
	ge808ov11696 = (GE_ms8("local", 5));
	ge808ov11658 = (GE_ms8("alias", 5));
	ge808ov11690 = (GE_ms8("infix", 5));
	ge808ov11706 = (GE_ms8("prefix", 6));
	ge808ov11694 = (GE_ms8("is", 2));
	ge808ov11721 = (GE_ms8("unique", 6));
	ge808ov11684 = (GE_ms8("feature", 7));
	ge808ov11668 = (GE_ms8("convert", 7));
	ge808ov11670 = (GE_ms8("creation", 8));
	ge808ov11707 = (GE_ms8("redefine", 8));
	ge808ov11659 = (GE_ms8("all", 3));
	ge808ov11681 = (GE_ms8("export", 6));
	ge808ov11709 = (GE_ms8("rename", 6));
	ge1016ov28174 = (GE_ms8("gvscn1a", 7));
	ge1016ov27724 = (GE_ms8("file \'$8\' contains class $9 instead of the expected class $5.", 61));
	ge1028ov22596 = (GE_ms8("", 0));
	ge808ov11776 = (GE_ms8("BOOLEAN_REF", 11));
	ge808ov11782 = (GE_ms8("INTEGER_8_REF", 13));
	ge808ov11783 = (GE_ms8("INTEGER_16_REF", 14));
	ge808ov11785 = (GE_ms8("INTEGER_64_REF", 14));
	ge808ov11787 = (GE_ms8("NATURAL_8_REF", 13));
	ge808ov11788 = (GE_ms8("NATURAL_16_REF", 14));
	ge808ov11790 = (GE_ms8("NATURAL_64_REF", 14));
	ge808ov11791 = (GE_ms8("POINTER_REF", 11));
	ge808ov11838 = (GE_ms8("built_in", 8));
	ge808ov11839 = (GE_ms8("static built_in", 15));
	ge808ov11840 = (GE_ms8("built_in static", 15));
	ge808ov11386 = (GE_ms8("ARGUMENTS_32", 12));
	ge808ov11397 = (GE_ms8("EXCEPTION_MANAGER_FACTORY", 25));
	ge808ov11399 = (GE_ms8("IDENTIFIED_ROUTINES", 19));
	ge808ov11406 = (GE_ms8("INTERNAL", 8));
	ge808ov11409 = (GE_ms8("MEMORY", 6));
	ge808ov11417 = (GE_ms8("PLATFORM", 8));
	ge808ov11437 = (GE_ms8("aliased_resized_area", 20));
	ge808ov11439 = (GE_ms8("argument_count", 14));
	ge808ov11444 = (GE_ms8("as_natural_8", 12));
	ge808ov11445 = (GE_ms8("as_natural_16", 13));
	ge808ov11446 = (GE_ms8("as_natural_32", 13));
	ge808ov11447 = (GE_ms8("as_natural_64", 13));
	ge808ov11440 = (GE_ms8("as_integer_8", 12));
	ge808ov11441 = (GE_ms8("as_integer_16", 13));
	ge808ov11442 = (GE_ms8("as_integer_32", 13));
	ge808ov11443 = (GE_ms8("as_integer_64", 13));
	ge808ov11448 = (GE_ms8("base_address", 12));
	ge808ov11449 = (GE_ms8("base_class_name", 15));
	ge808ov11450 = (GE_ms8("bit_and", 7));
	ge808ov11451 = (GE_ms8("bit_not", 7));
	ge808ov11452 = (GE_ms8("bit_or", 6));
	ge808ov11453 = (GE_ms8("bit_shift_left", 14));
	ge808ov11454 = (GE_ms8("bit_shift_right", 15));
	ge808ov11455 = (GE_ms8("bit_xor", 7));
	ge808ov11456 = (GE_ms8("boolean_bytes", 13));
	ge808ov11458 = (GE_ms8("boolean_item", 12));
	ge808ov11457 = (GE_ms8("boolean_field", 13));
	ge808ov11461 = (GE_ms8("catch", 5));
	ge808ov11462 = (GE_ms8("ceiling_real_32", 15));
	ge808ov11463 = (GE_ms8("ceiling_real_64", 15));
	ge808ov11464 = (GE_ms8("character_8_item", 16));
	ge808ov11465 = (GE_ms8("character_8_field", 17));
	ge808ov11466 = (GE_ms8("character_32_item", 17));
	ge808ov11467 = (GE_ms8("character_32_field", 18));
	ge808ov11468 = (GE_ms8("character_bytes", 15));
	ge808ov11470 = (GE_ms8("code", 4));
	ge808ov11471 = (GE_ms8("conforms_to", 11));
	ge808ov11472 = (GE_ms8("conjuncted", 10));
	ge808ov11473 = (GE_ms8("conjuncted_semistrict", 21));
	ge808ov11476 = (GE_ms8("deep_twin", 9));
	ge808ov11477 = (GE_ms8("default", 7));
	ge808ov11479 = (GE_ms8("developer_raise", 15));
	ge808ov11480 = (GE_ms8("disjuncted", 10));
	ge808ov11481 = (GE_ms8("disjuncted_exclusive", 20));
	ge808ov11482 = (GE_ms8("disjuncted_semistrict", 21));
	ge808ov11484 = (GE_ms8("double_bytes", 12));
	ge808ov11485 = (GE_ms8("eif_id_object", 13));
	ge808ov11486 = (GE_ms8("eif_object_id", 13));
	ge808ov11487 = (GE_ms8("eif_object_id_free", 18));
	ge808ov11488 = (GE_ms8("element_size", 12));
	ge808ov11489 = (GE_ms8("exception_from_code", 19));
	ge808ov11490 = (GE_ms8("exception_manager", 17));
	ge808ov11491 = (GE_ms8("extend", 6));
	ge808ov11492 = (GE_ms8("field", 5));
	ge808ov11493 = (GE_ms8("field_count", 11));
	ge808ov11494 = (GE_ms8("field_name", 10));
	ge808ov11495 = (GE_ms8("field_static_type", 17));
	ge808ov11496 = (GE_ms8("field_type", 10));
	ge808ov11497 = (GE_ms8("find_referers", 13));
	ge808ov11498 = (GE_ms8("floor_real_32", 13));
	ge808ov11499 = (GE_ms8("floor_real_64", 13));
	ge808ov11501 = (GE_ms8("free", 4));
	ge808ov11502 = (GE_ms8("generating_type", 15));
	ge808ov11503 = (GE_ms8("generator", 9));
	ge808ov11504 = (GE_ms8("generic_parameter_count", 23));
	ge808ov11505 = (GE_ms8("generic_parameter_type", 22));
	ge808ov11506 = (GE_ms8("has_default", 11));
	ge808ov11507 = (GE_ms8("hash_code", 9));
	ge808ov11508 = (GE_ms8("i_th_argument_pointer", 21));
	ge808ov11509 = (GE_ms8("i_th_argument_string", 20));
	ge808ov11510 = (GE_ms8("identity", 8));
	ge808ov11511 = (GE_ms8("ignore", 6));
	ge808ov11512 = (GE_ms8("implication", 11));
	ge808ov11513 = (GE_ms8("integer_8_item", 14));
	ge808ov11514 = (GE_ms8("integer_8_field", 15));
	ge808ov11515 = (GE_ms8("integer_16_item", 15));
	ge808ov11516 = (GE_ms8("integer_16_field", 16));
	ge808ov11517 = (GE_ms8("integer_32_item", 15));
	ge808ov11518 = (GE_ms8("integer_32_field", 16));
	ge808ov11519 = (GE_ms8("integer_64_item", 15));
	ge808ov11520 = (GE_ms8("integer_64_field", 16));
	ge808ov11521 = (GE_ms8("integer_bytes", 13));
	ge808ov11522 = (GE_ms8("integer_quotient", 16));
	ge808ov11523 = (GE_ms8("integer_remainder", 17));
	ge808ov11524 = (GE_ms8("is_caught", 9));
	ge808ov11525 = (GE_ms8("is_deep_equal", 13));
	ge808ov11526 = (GE_ms8("is_default_pointer", 18));
	ge808ov11527 = (GE_ms8("is_dotnet", 9));
	ge808ov11529 = (GE_ms8("is_expanded", 11));
	ge808ov11530 = (GE_ms8("is_ignorable", 12));
	ge808ov11531 = (GE_ms8("is_ignored", 10));
	ge808ov11532 = (GE_ms8("is_less", 7));
	ge808ov11533 = (GE_ms8("is_mac", 6));
	ge808ov11534 = (GE_ms8("is_nan", 6));
	ge808ov11535 = (GE_ms8("is_negative_infinity", 20));
	ge808ov11536 = (GE_ms8("is_positive_infinity", 20));
	ge808ov11537 = (GE_ms8("is_raisable", 11));
	ge808ov11538 = (GE_ms8("is_scoop_capable", 16));
	ge808ov11540 = (GE_ms8("is_thread_capable", 17));
	ge808ov11541 = (GE_ms8("is_unix", 7));
	ge808ov11542 = (GE_ms8("is_vms", 6));
	ge808ov11543 = (GE_ms8("is_vxworks", 10));
	ge808ov11544 = (GE_ms8("is_windows", 10));
	ge808ov11546 = (GE_ms8("item_code", 9));
	ge808ov11547 = (GE_ms8("last_exception", 14));
	ge808ov11548 = (GE_ms8("last_result", 11));
	ge808ov11550 = (GE_ms8("make", 4));
	ge808ov11551 = (GE_ms8("make_empty", 10));
	ge808ov11552 = (GE_ms8("max_type_id", 11));
	ge808ov11553 = (GE_ms8("minus", 5));
	ge808ov11554 = (GE_ms8("name", 4));
	ge808ov11555 = (GE_ms8("nan", 3));
	ge808ov11556 = (GE_ms8("natural_8_item", 14));
	ge808ov11557 = (GE_ms8("natural_8_field", 15));
	ge808ov11558 = (GE_ms8("natural_16_item", 15));
	ge808ov11559 = (GE_ms8("natural_16_field", 16));
	ge808ov11560 = (GE_ms8("natural_32_code", 15));
	ge808ov11561 = (GE_ms8("natural_32_item", 15));
	ge808ov11562 = (GE_ms8("natural_32_field", 16));
	ge808ov11563 = (GE_ms8("natural_64_item", 15));
	ge808ov11564 = (GE_ms8("natural_64_field", 16));
	ge808ov11565 = (GE_ms8("negated", 7));
	ge808ov11566 = (GE_ms8("negative_infinity", 17));
	ge808ov11568 = (GE_ms8("new_instance", 12));
	ge808ov11569 = (GE_ms8("new_special_any_instance", 24));
	ge808ov11570 = (GE_ms8("object_comparison", 17));
	ge808ov11571 = (GE_ms8("opposite", 8));
	ge808ov11572 = (GE_ms8("out", 3));
	ge808ov11573 = (GE_ms8("plus", 4));
	ge808ov11574 = (GE_ms8("pointer_bytes", 13));
	ge808ov11576 = (GE_ms8("pointer_field", 13));
	ge808ov11577 = (GE_ms8("positive_infinity", 17));
	ge808ov11578 = (GE_ms8("power", 5));
	ge808ov11579 = (GE_ms8("product", 7));
	ge808ov11580 = (GE_ms8("put", 3));
	ge808ov11581 = (GE_ms8("put_boolean", 11));
	ge808ov11582 = (GE_ms8("put_character_8", 15));
	ge808ov11583 = (GE_ms8("put_character_32", 16));
	ge808ov11584 = (GE_ms8("put_integer_8", 13));
	ge808ov11585 = (GE_ms8("put_integer_16", 14));
	ge808ov11586 = (GE_ms8("put_integer_32", 14));
	ge808ov11587 = (GE_ms8("put_integer_64", 14));
	ge808ov11588 = (GE_ms8("put_natural_8", 13));
	ge808ov11589 = (GE_ms8("put_natural_16", 14));
	ge808ov11590 = (GE_ms8("put_natural_32", 14));
	ge808ov11591 = (GE_ms8("put_natural_64", 14));
	ge808ov11592 = (GE_ms8("put_pointer", 11));
	ge808ov11593 = (GE_ms8("put_real_32", 11));
	ge808ov11594 = (GE_ms8("put_real_64", 11));
	ge808ov11595 = (GE_ms8("put_reference", 13));
	ge808ov11596 = (GE_ms8("quotient", 8));
	ge808ov11597 = (GE_ms8("raise", 5));
	ge808ov11598 = (GE_ms8("real_32_item", 12));
	ge808ov11599 = (GE_ms8("real_32_field", 13));
	ge808ov11600 = (GE_ms8("real_64_item", 12));
	ge808ov11601 = (GE_ms8("real_64_field", 13));
	ge808ov11602 = (GE_ms8("real_bytes", 10));
	ge808ov11603 = (GE_ms8("reference_item", 14));
	ge808ov11604 = (GE_ms8("runtime_name", 12));
	ge808ov11605 = (GE_ms8("same_type", 9));
	ge808ov11606 = (GE_ms8("set_boolean_field", 17));
	ge808ov11607 = (GE_ms8("set_character_8_field", 21));
	ge808ov11608 = (GE_ms8("set_character_32_field", 22));
	ge808ov11609 = (GE_ms8("set_count", 9));
	ge808ov11611 = (GE_ms8("set_integer_8_field", 19));
	ge808ov11612 = (GE_ms8("set_integer_16_field", 20));
	ge808ov11613 = (GE_ms8("set_integer_32_field", 20));
	ge808ov11614 = (GE_ms8("set_integer_64_field", 20));
	ge808ov11615 = (GE_ms8("set_is_ignored", 14));
	ge808ov11616 = (GE_ms8("set_item", 8));
	ge808ov11617 = (GE_ms8("set_natural_8_field", 19));
	ge808ov11618 = (GE_ms8("set_natural_16_field", 20));
	ge808ov11619 = (GE_ms8("set_natural_32_field", 20));
	ge808ov11620 = (GE_ms8("set_natural_64_field", 20));
	ge808ov11621 = (GE_ms8("set_object_comparison", 21));
	ge808ov11622 = (GE_ms8("set_operands", 12));
	ge808ov11623 = (GE_ms8("set_pointer_field", 17));
	ge808ov11624 = (GE_ms8("set_real_32_field", 17));
	ge808ov11625 = (GE_ms8("set_real_64_field", 17));
	ge808ov11626 = (GE_ms8("set_reference_field", 19));
	ge808ov11627 = (GE_ms8("standard_copy", 13));
	ge808ov11628 = (GE_ms8("standard_is_equal", 17));
	ge808ov11629 = (GE_ms8("standard_twin", 13));
	ge808ov11630 = (GE_ms8("tagged_out", 10));
	ge808ov11631 = (GE_ms8("to_character", 12));
	ge808ov11632 = (GE_ms8("to_character_8", 14));
	ge808ov11633 = (GE_ms8("to_character_32", 15));
	ge808ov11634 = (GE_ms8("to_double", 9));
	ge808ov11635 = (GE_ms8("to_integer_32", 13));
	ge808ov11637 = (GE_ms8("to_real", 7));
	ge808ov11638 = (GE_ms8("to_real_32", 10));
	ge808ov11639 = (GE_ms8("to_real_64", 10));
	ge808ov11640 = (GE_ms8("truncated_to_integer", 20));
	ge808ov11641 = (GE_ms8("truncated_to_integer_64", 23));
	ge808ov11642 = (GE_ms8("truncated_to_real", 17));
	ge808ov11643 = (GE_ms8("twin", 4));
	ge808ov11644 = (GE_ms8("type_id", 7));
	ge808ov11645 = (GE_ms8("type_of_code", 12));
	ge808ov11646 = (GE_ms8("type_of_type", 12));
	ge808ov11648 = (GE_ms8("wide_character_bytes", 20));
	ge808ov11650 = (GE_ms8("False", 5));
	ge808ov11651 = (GE_ms8("Precursor", 9));
	ge808ov11654 = (GE_ms8("Void", 4));
	ge808ov11655 = (GE_ms8("Unique", 6));
	ge808ov11663 = (GE_ms8("assign", 6));
	ge808ov11671 = (GE_ms8("current", 7));
	ge808ov11677 = (GE_ms8("elseif", 6));
	ge808ov11680 = (GE_ms8("expanded", 8));
	ge808ov11682 = (GE_ms8("external", 8));
	ge808ov11683 = (GE_ms8("false", 5));
	ge808ov11686 = (GE_ms8("frozen", 6));
	ge808ov11687 = (GE_ms8("if", 2));
	ge808ov11688 = (GE_ms8("implies", 7));
	ge808ov11689 = (GE_ms8("indexing", 8));
	ge808ov11692 = (GE_ms8("inspect", 7));
	ge808ov11698 = (GE_ms8("not", 3));
	ge808ov11699 = (GE_ms8("note", 4));
	ge808ov11700 = (GE_ms8("obsolete", 8));
	ge808ov11708 = (GE_ms8("reference", 9));
	ge808ov11712 = (GE_ms8("result", 6));
	ge808ov11713 = (GE_ms8("retry", 5));
	ge808ov11714 = (GE_ms8("select", 6));
	ge808ov11715 = (GE_ms8("separate", 8));
	ge808ov11716 = (GE_ms8("some", 4));
	ge808ov11719 = (GE_ms8("true", 4));
	ge808ov11720 = (GE_ms8("undefine", 8));
	ge808ov11722 = (GE_ms8("until", 5));
	ge808ov11724 = (GE_ms8("void", 4));
	ge808ov11726 = (GE_ms8("xor", 3));
	ge808ov11740 = (GE_ms8("->", 2));
	ge808ov11741 = (GE_ms8(":=", 2));
	ge808ov11742 = (GE_ms8("\?=", 2));
	ge808ov11743 = (GE_ms8("@", 1));
	ge808ov11744 = (GE_ms8("!", 1));
	ge808ov11745 = (GE_ms8(":", 1));
	ge808ov11746 = (GE_ms8(",", 1));
	ge808ov11747 = (GE_ms8("//", 2));
	ge808ov11748 = (GE_ms8("/", 1));
	ge808ov11749 = (GE_ms8("$", 1));
	ge808ov11750 = (GE_ms8(".", 1));
	ge808ov11751 = (GE_ms8("..", 2));
	ge808ov11752 = (GE_ms8("=", 1));
	ge808ov11753 = (GE_ms8(">=", 2));
	ge808ov11754 = (GE_ms8(">", 1));
	ge808ov11755 = (GE_ms8("<=", 2));
	ge808ov11756 = (GE_ms8("<<", 2));
	ge808ov11757 = (GE_ms8("{", 1));
	ge808ov11758 = (GE_ms8("[", 1));
	ge808ov11759 = (GE_ms8("(", 1));
	ge808ov11760 = (GE_ms8("<", 1));
	ge808ov11761 = (GE_ms8("-", 1));
	ge808ov11762 = (GE_ms8("\\\\", 2));
	ge808ov11763 = (GE_ms8("/=", 2));
	ge808ov11765 = (GE_ms8("+", 1));
	ge808ov11766 = (GE_ms8("^", 1));
	ge808ov11767 = (GE_ms8("\?", 1));
	ge808ov11768 = (GE_ms8(">>", 2));
	ge808ov11769 = (GE_ms8("}", 1));
	ge808ov11770 = (GE_ms8("]", 1));
	ge808ov11771 = (GE_ms8(")", 1));
	ge808ov11772 = (GE_ms8(";", 1));
	ge808ov11773 = (GE_ms8("~", 1));
	ge808ov11774 = (GE_ms8("*", 1));
	ge228ov15938 = (GE_ms8("", 0));
	ge1028ov22625 = (GE_ms8("dummy", 5));
	ge1016ov28134 = (GE_ms8("vuex1a", 6));
	ge1016ov27863 = (GE_ms8("VUEX-1", 6));
	ge1016ov27684 = (GE_ms8("`$7\' is not the final name of a feature in class $5.", 52));
	ge1016ov28046 = (GE_ms8("vkcn2c", 6));
	ge1016ov27816 = (GE_ms8("VKCN-2", 6));
	ge1016ov27596 = (GE_ms8("procedure `$8\' appears in a call expression.", 44));
	ge1016ov28132 = (GE_ms8("vuar2b", 6));
	ge1016ov27861 = (GE_ms8("VUAR-2", 6));
	ge1016ov27682 = (GE_ms8("the $9-th actual argument (of type \'$10\') does not conform to the corresponding formal argument (of type \'$11\') of feature `$8\'.", 128));
	ge1016ov28131 = (GE_ms8("vuar2a", 6));
	ge1016ov27681 = (GE_ms8("the $10-th actual argument (of type \'$11\') does not conform to the corresponding formal argument (of type \'$12\') of feature `$8\' in class $9.", 141));
	ge1016ov27935 = (GE_ms8("vdpr4b", 6));
	ge1016ov27766 = (GE_ms8("VDPR-4B", 7));
	ge1016ov27485 = (GE_ms8("the $9-th actual argument (of type \'$10\') does not conform to the corresponding formal argument (of type \'$11\') of feature `$7\' in class $8.", 140));
	ge1016ov28129 = (GE_ms8("vuar1b", 6));
	ge1016ov27860 = (GE_ms8("VUAR-1", 6));
	ge1016ov27679 = (GE_ms8("the number of actual arguments is not the same as the number of formal arguments of feature `$8\'.", 97));
	ge1016ov28128 = (GE_ms8("vuar1a", 6));
	ge1016ov27678 = (GE_ms8("the number of actual arguments is not the same as the number of formal arguments of feature `$8\' in class $9.", 109));
	ge1016ov27934 = (GE_ms8("vdpr4a", 6));
	ge1016ov27765 = (GE_ms8("VDPR-4A", 7));
	ge1016ov27484 = (GE_ms8("the number of actual arguments in Precursor call is not the same as the number of formal arguments of feature `$7\' in class $8.", 127));
	ge1016ov27903 = (GE_ms8("vape0a", 6));
	ge1016ov27751 = (GE_ms8("VAPE", 4));
	ge1016ov27453 = (GE_ms8("feature `$8\' of class $5 appearing in the precondition of `$9\' is not exported to class $10 to which feature `$9\' is exported.", 126));
	ge1016ov28045 = (GE_ms8("vkcn2a", 6));
	ge1016ov27595 = (GE_ms8("procedure `$8\' of class $9 appears in a call expression.", 56));
	ge1016ov28043 = (GE_ms8("vkcn1a", 6));
	ge1016ov27815 = (GE_ms8("VKCN-1", 6));
	ge1016ov27593 = (GE_ms8("query `$8\' of class $9 appears in a call instruction.", 53));
	ge1016ov27904 = (GE_ms8("vape0b", 6));
	ge1016ov27454 = (GE_ms8("feature `$8\' of class $9 appearing in the precondition of `$10\' is not exported to class $11 to which feature `$10\' is exported.", 128));
	ge1016ov28136 = (GE_ms8("vuex2b", 6));
	ge1016ov27864 = (GE_ms8("VUEX-2", 6));
	ge1016ov27686 = (GE_ms8("feature `$8\' of class $9 is not exported to class $5.", 53));
	ge1016ov28147 = (GE_ms8("vuta2a", 6));
	ge1016ov27868 = (GE_ms8("VUTA-2", 6));
	ge1016ov27697 = (GE_ms8("the target (of type \'$9\') of the call to feature `$8\' is not attached.", 70));
	ge1016ov28187 = (GE_ms8("gvuao0c", 7));
	ge1016ov27894 = (GE_ms8("GVUAO", 5));
	ge1016ov27737 = (GE_ms8("`$7\' is an object-test local of in an invariant and hence cannot have actual arguments.", 87));
	ge1016ov28185 = (GE_ms8("gvuao0a", 7));
	ge1016ov27735 = (GE_ms8("`$7\' is an object-test local of feature `$8\' and hence cannot have actual arguments.", 84));
	ge1016ov28186 = (GE_ms8("gvuao0b", 7));
	ge1016ov27736 = (GE_ms8("`$7\' is an object-test local of an inline agent and hence cannot have actual arguments.", 87));
	ge1016ov28182 = (GE_ms8("gvuac0c", 7));
	ge1016ov27892 = (GE_ms8("GVUAC", 5));
	ge1016ov27732 = (GE_ms8("`$7\' is an across cursor of in an invariant and hence cannot have actual arguments.", 83));
	ge1016ov28180 = (GE_ms8("gvuac0a", 7));
	ge1016ov27730 = (GE_ms8("`$7\' is an across cursor of feature `$8\' and hence cannot have actual arguments.", 80));
	ge1016ov28181 = (GE_ms8("gvuac0b", 7));
	ge1016ov27731 = (GE_ms8("`$7\' is an across cursor of an inline agent and hence cannot have actual arguments.", 83));
	ge1016ov28183 = (GE_ms8("gvual0a", 7));
	ge1016ov27893 = (GE_ms8("GVUAL", 5));
	ge1016ov27733 = (GE_ms8("`$7\' is a local variable of feature `$8\' and hence cannot have actual arguments.", 80));
	ge1016ov28184 = (GE_ms8("gvual0b", 7));
	ge1016ov27734 = (GE_ms8("`$7\' is a local variable of an inline agent and hence cannot have actual arguments.", 83));
	ge1016ov28178 = (GE_ms8("gvuaa0a", 7));
	ge1016ov27891 = (GE_ms8("GVUAA", 5));
	ge1016ov27728 = (GE_ms8("`$7\' is a formal argument of feature `$8\' and hence cannot have actual arguments.", 81));
	ge1016ov28179 = (GE_ms8("gvuaa0b", 7));
	ge1016ov27729 = (GE_ms8("`$7\' is a formal argument of an inline agent and hence cannot have actual arguments.", 84));
	ge1016ov28044 = (GE_ms8("vkcn1c", 6));
	ge1016ov27594 = (GE_ms8("query `$8\' appears in a call instruction.", 41));
	ge1016ov28197 = (GE_ms8("gvuio0c", 7));
	ge1016ov27898 = (GE_ms8("GVUIO", 5));
	ge1016ov27747 = (GE_ms8("`$7\' is an object-test local of an invariant and hence cannot be an instruction.", 80));
	ge1016ov28195 = (GE_ms8("gvuio0a", 7));
	ge1016ov27745 = (GE_ms8("`$7\' is an object-test local of feature `$8\' and hence cannot be an instruction.", 80));
	ge1016ov28196 = (GE_ms8("gvuio0b", 7));
	ge1016ov27746 = (GE_ms8("`$7\' is an object-test local of an inline agent and hence cannot be an instruction.", 83));
	ge1016ov28192 = (GE_ms8("gvuic0c", 7));
	ge1016ov27896 = (GE_ms8("GVUIC", 5));
	ge1016ov27742 = (GE_ms8("`$7\' is an across cursor of an invariant and hence cannot be an instruction.", 76));
	ge1016ov28190 = (GE_ms8("gvuic0a", 7));
	ge1016ov27740 = (GE_ms8("`$7\' is an across cursor of feature `$8\' and hence cannot be an instruction.", 76));
	ge1016ov28191 = (GE_ms8("gvuic0b", 7));
	ge1016ov27741 = (GE_ms8("`$7\' is an across cursor of an inline agent and hence cannot be an instruction.", 79));
	ge1016ov28193 = (GE_ms8("gvuil0a", 7));
	ge1016ov27897 = (GE_ms8("GVUIL", 5));
	ge1016ov27743 = (GE_ms8("`$7\' is a local variable of feature `$8\' and hence cannot be an instruction.", 76));
	ge1016ov28194 = (GE_ms8("gvuil0b", 7));
	ge1016ov27744 = (GE_ms8("`$7\' is a local variable of an inline agent and hence cannot be an instruction.", 79));
	ge1016ov28188 = (GE_ms8("gvuia0a", 7));
	ge1016ov27895 = (GE_ms8("GVUIA", 5));
	ge1016ov27738 = (GE_ms8("`$7\' is a formal argument of feature `$8\' and hence cannot be an instruction.", 77));
	ge1016ov28189 = (GE_ms8("gvuia0b", 7));
	ge1016ov27739 = (GE_ms8("`$7\' is a formal argument of an inline agent and hence cannot be an instruction.", 80));
	ge1016ov27974 = (GE_ms8("veen9b", 6));
	ge1016ov27784 = (GE_ms8("VEEN-9", 6));
	ge1016ov27524 = (GE_ms8("`$7\' appearing in the invariant or one of its possibly nested inline agents, is an across cursor that is used outside of its scope.", 131));
	ge1016ov27973 = (GE_ms8("veen9a", 6));
	ge1016ov27523 = (GE_ms8("`$7\' appearing in feature `$8\' or one of its possibly nested inline agents, is an across cursor that is used outside of its scope.", 130));
	ge1016ov27972 = (GE_ms8("veen8b", 6));
	ge1016ov27783 = (GE_ms8("VEEN-8", 6));
	ge1016ov27522 = (GE_ms8("`$7\' appearing in the invariant or one of its possibly nested inline agents, is an object-test local that is used outside of its scope.", 135));
	ge1016ov27971 = (GE_ms8("veen8a", 6));
	ge1016ov27521 = (GE_ms8("`$7\' appearing in feature `$8\' or one of its possibly nested inline agents, is an object-test local that is used outside of its scope.", 134));
	ge1016ov27975 = (GE_ms8("vevi0a", 6));
	ge1016ov27785 = (GE_ms8("VEVI", 4));
	ge1016ov27525 = (GE_ms8("local entity `$7\' declared as attached is used before being initialized.", 72));
	ge1016ov27966 = (GE_ms8("veen2c", 6));
	ge1016ov27782 = (GE_ms8("VEEN-2", 6));
	ge1016ov27516 = (GE_ms8("local entity `$7\' appears in the precondition or postcondition of feature `$8\'.", 79));
	ge1016ov27968 = (GE_ms8("veen2e", 6));
	ge1016ov27518 = (GE_ms8("local entity `$7\' appears in the precondition or postcondition of an inline agent.", 82));
	ge1016ov28135 = (GE_ms8("vuex2a", 6));
	ge1016ov27685 = (GE_ms8("`$7\' is not the final name of a feature in class $8.", 52));
	ge1016ov28130 = (GE_ms8("vuar1c", 6));
	ge1016ov27680 = (GE_ms8("call to Tuple label `$7\' cannot have arguments.", 47));
	ge1016ov28148 = (GE_ms8("vuta2b", 6));
	ge1016ov27698 = (GE_ms8("the target (of type \'$8\') of the call to Tuple label `$7\' is not attached.", 74));
	ge1016ov27976 = (GE_ms8("vevi0b", 6));
	ge1016ov27526 = (GE_ms8("entity \'Result\' declared as attached is used before being initialized.", 70));
	ge1016ov27964 = (GE_ms8("veen2a", 6));
	ge1016ov27514 = (GE_ms8("entity \'Result\' appears in the body, postcondition or rescue clause of a procedure `$7\'.", 88));
	ge1016ov27970 = (GE_ms8("veen2g", 6));
	ge1016ov27520 = (GE_ms8("entity \'Result\' appears in the body, postcondition or rescue clause of an inline agent whose associated feature is a procedure.", 127));
	ge1016ov27967 = (GE_ms8("veen2d", 6));
	ge1016ov27517 = (GE_ms8("entity \'Result\' appears in the invariant of the class.", 54));
	ge1016ov27965 = (GE_ms8("veen2b", 6));
	ge1016ov27515 = (GE_ms8("entity \'Result\' appears in the precondition of feature `$7\'.", 60));
	ge1016ov28120 = (GE_ms8("vtcg4a", 6));
	ge1016ov27855 = (GE_ms8("VTCG-4", 6));
	ge1016ov27670 = (GE_ms8("base class $9 of the $7-th actual generic parameter of $10 does not make feature `$8\' available as creation procedure to class $10.", 131));
	ge1016ov28121 = (GE_ms8("vtcg4b", 6));
	ge1016ov27671 = (GE_ms8("the $7-th actual generic parameter of $10, which is the $9-th formal generic parameter of class $5, does not list feature `$8\' as creation procedure in its generic constraint.", 175));
	ge1016ov28104 = (GE_ms8("vrle1a", 6));
	ge1016ov27847 = (GE_ms8("VRLE-1", 6));
	ge1016ov27654 = (GE_ms8("local variable name \'$7\' in feature `$8\' is also the final name of a feature.", 77));
	ge1016ov28105 = (GE_ms8("vrle2a", 6));
	ge1016ov27848 = (GE_ms8("VRLE-2", 6));
	ge1016ov27655 = (GE_ms8("local variable name \'$7\' in feature `$8\' is also the name of a formal argument of this feature.", 95));
	ge1016ov28101 = (GE_ms8("vreg0b", 6));
	ge1016ov27651 = (GE_ms8("local variable name \'$7\' appear twice in feature `$8\'.", 54));
	ge1016ov28143 = (GE_ms8("vuot3a", 6));
	ge1016ov27866 = (GE_ms8("VUOT-3", 6));
	ge1016ov27693 = (GE_ms8("object-test with local name \'$6\' has the same name as another object-test local appearing in the same feature `$7\' or in the same inline agent.", 143));
	ge1017ov8205 = (GE_ms8("unsigned", 8));
	ge1017ov8200 = (GE_ms8("tc", 2));
	ge1017ov8201 = (GE_ms8("&tc", 3));
	ge1017ov8168 = (GE_ms8("GE_rescue", 9));
	ge1017ov8170 = (GE_ms8("GE_setjmp", 9));
	ge1017ov8131 = (GE_ms8("GE_EX_FAIL", 10));
	ge1017ov8169 = (GE_ms8("GE_retry", 8));
	ge1017ov8207 = (GE_ms8("volatile", 8));
	ge1017ov8204 = (GE_ms8("#undef", 6));
	ge1016ov28142 = (GE_ms8("vuot1f", 6));
	ge1016ov27865 = (GE_ms8("VUOT-1", 6));
	ge1016ov27692 = (GE_ms8("the scope of object-test with local name \'$6\' overlaps with the scope of another object-test with the same local name.", 118));
	ge1016ov28146 = (GE_ms8("vuot4b", 6));
	ge1016ov27867 = (GE_ms8("VUOT-4", 6));
	ge1016ov27696 = (GE_ms8("ISE does not support object-tests in check instructions.", 56));
	ge1016ov28145 = (GE_ms8("vuot4a", 6));
	ge1016ov27695 = (GE_ms8("ISE does not support object-tests in preconditions.", 51));
	ge1016ov28141 = (GE_ms8("vuot1e", 6));
	ge1016ov27691 = (GE_ms8("object-test with local name \'$6\' appears in the scope of an across cursor with the same name.", 93));
	ge1016ov28140 = (GE_ms8("vuot1d", 6));
	ge1016ov27690 = (GE_ms8("object-test with local name \'$6\' appears in the scope of another object-test local with the same name.", 102));
	ge1016ov28139 = (GE_ms8("vuot1c", 6));
	ge1016ov27689 = (GE_ms8("object-test local name \'$6\' is also the name of a local variable of an enclosing feature or inline agent.", 105));
	ge1016ov28138 = (GE_ms8("vuot1b", 6));
	ge1016ov27688 = (GE_ms8("object-test local name \'$6\' is also the name of a formal argument of an enclosing feature or inline agent.", 106));
	ge1016ov28137 = (GE_ms8("vuot1a", 6));
	ge1016ov27687 = (GE_ms8("object-test local name \'$6\' is also the final name of a feature.", 64));
	ge1016ov28157 = (GE_ms8("vwmq0d", 6));
	ge1016ov27873 = (GE_ms8("VWMQ", 4));
	ge1016ov27707 = (GE_ms8("type \'$7\' in the string constant is not one of the sized variants of STRING.", 76));
	ge1016ov27905 = (GE_ms8("vave0a", 6));
	ge1016ov27752 = (GE_ms8("VAVE", 4));
	ge1016ov27455 = (GE_ms8("loop variant expression of non-INTEGER type \'$7\'.", 49));
	ge1016ov28065 = (GE_ms8("voit2e", 6));
	ge1016ov27827 = (GE_ms8("VOIT-2", 6));
	ge1016ov27615 = (GE_ms8("across with cursor name \'$6\' appears in the scope of another across cursor with the same name.", 94));
	ge1016ov28064 = (GE_ms8("voit2d", 6));
	ge1016ov27614 = (GE_ms8("across with cursor name \'$6\' appears in the scope of an object-test local with the same name.", 93));
	ge1016ov28063 = (GE_ms8("voit2c", 6));
	ge1016ov27613 = (GE_ms8("across cursor name \'$6\' is also the name of a local variable of an enclosing feature or inline agent.", 101));
	ge1016ov28062 = (GE_ms8("voit2b", 6));
	ge1016ov27612 = (GE_ms8("across cursor name \'$6\' is also the name of a formal argument of an enclosing feature or inline agent.", 102));
	ge1016ov28061 = (GE_ms8("voit2a", 6));
	ge1016ov27611 = (GE_ms8("across cursor name \'$6\' is also the final name of a feature.", 60));
	ge1016ov28060 = (GE_ms8("voit1a", 6));
	ge1016ov27826 = (GE_ms8("VOIT-1", 6));
	ge1016ov27610 = (GE_ms8("the type \'$7\' of the across iterable expression does not conform to any generic derivation of ITERABLE.", 103));
	ge1017ov8208 = (GE_ms8("while", 5));
	ge1016ov28070 = (GE_ms8("vpca1b", 6));
	ge1016ov27830 = (GE_ms8("VPCA-1", 6));
	ge1016ov27620 = (GE_ms8("`$7\' is not the final name of a feature in class $8.", 52));
	ge1016ov28077 = (GE_ms8("vpca5b", 6));
	ge1016ov27834 = (GE_ms8("VPCA-5", 6));
	ge1016ov27627 = (GE_ms8("the type \'$10\' specified for the $9-th actual argument of Call_agent does not conform to the corresponding formal argument (of type \'$11\') of feature `$8\'.", 155));
	ge1016ov28076 = (GE_ms8("vpca5a", 6));
	ge1016ov27626 = (GE_ms8("the type \'$11\' specified for the $10-th actual argument of Call_agent does not conform to the corresponding formal argument (of type \'$12\') of feature `$8\' in class $9.", 168));
	ge1016ov28075 = (GE_ms8("vpca4b", 6));
	ge1016ov27833 = (GE_ms8("VPCA-4", 6));
	ge1016ov27625 = (GE_ms8("the $9-th actual argument (of type \'$10\') does not conform to the corresponding formal argument (of type \'$11\') of feature `$8\'.", 128));
	ge1016ov28074 = (GE_ms8("vpca4a", 6));
	ge1016ov27624 = (GE_ms8("the $10-th actual argument (of type \'$11\') does not conform to the corresponding formal argument (of type \'$12\') of feature `$8\' in class $9.", 141));
	ge1016ov28073 = (GE_ms8("vpca3b", 6));
	ge1016ov27832 = (GE_ms8("VPCA-3", 6));
	ge1016ov27623 = (GE_ms8("the number of actual arguments is not the same as the number of formal arguments of feature `$8\'.", 97));
	ge1016ov28072 = (GE_ms8("vpca3a", 6));
	ge1016ov27622 = (GE_ms8("the number of actual arguments is not the same as the number of formal arguments of feature `$8\' in class $9.", 109));
	ge1016ov28071 = (GE_ms8("vpca2a", 6));
	ge1016ov27831 = (GE_ms8("VPCA-2", 6));
	ge1016ov27621 = (GE_ms8("feature `$8\' of class $9 is not exported to class $5.", 53));
	ge1016ov28069 = (GE_ms8("vpca1a", 6));
	ge1016ov27619 = (GE_ms8("`$7\' is not the final name of a feature in class $5.", 52));
	ge1016ov28160 = (GE_ms8("vwst2a", 6));
	ge1016ov27875 = (GE_ms8("VWST-2", 6));
	ge1016ov27710 = (GE_ms8("feature name `$7\' appears twice in strip expression.", 52));
	ge1016ov28158 = (GE_ms8("vwst1a", 6));
	ge1016ov27874 = (GE_ms8("VWST-1", 6));
	ge1016ov27708 = (GE_ms8("feature name `$7\' is not the final name of a feature in class $5.", 65));
	ge1016ov28156 = (GE_ms8("vwmq0c", 6));
	ge1016ov27706 = (GE_ms8("type \'$7\' in the character constant is not one of the sized variants of CHARACTER.", 82));
	ge1017ov8148 = (GE_ms8("GE_nat32", 8));
	ge1016ov28198 = (GE_ms8("gvwmc2a", 7));
	ge1016ov27899 = (GE_ms8("GVWMC-2", 7));
	ge1016ov27748 = (GE_ms8("integer constant \'$7\' is not representable as an instance of \'$8\'.", 66));
	ge1016ov28154 = (GE_ms8("vwmq0a", 6));
	ge1016ov27704 = (GE_ms8("type \'$7\' in the integer constant is not one of the sized variants of INTEGER.", 78));
	ge1017ov8138 = (GE_ms8("GE_int8", 7));
	ge1017ov8139 = (GE_ms8("GE_int16", 8));
	ge1017ov8140 = (GE_ms8("GE_int32", 8));
	ge1017ov8141 = (GE_ms8("GE_int64", 8));
	ge1017ov8146 = (GE_ms8("GE_nat8", 7));
	ge1017ov8147 = (GE_ms8("GE_nat16", 8));
	ge1017ov8149 = (GE_ms8("GE_nat64", 8));
	ge1016ov28155 = (GE_ms8("vwmq0b", 6));
	ge1016ov27705 = (GE_ms8("type \'$7\' in the real constant is not one of the sized variants of REAL.", 72));
	ge1016ov27977 = (GE_ms8("vevi0c", 6));
	ge1016ov27527 = (GE_ms8("entity \'Result\' declared as attached is not initialized at the end of the body of function `$7\'.", 96));
	ge1016ov28150 = (GE_ms8("vvok2a", 6));
	ge1016ov27870 = (GE_ms8("VVOK-2", 6));
	ge1016ov27700 = (GE_ms8("once key \"$6\" is not supported. The supported once keys are \"THREAD\", \"PROCESS\" and \"OBJECT\".", 93));
	ge802ov37544 = (GE_ms8("PROCESS", 7));
	ge802ov37543 = (GE_ms8("THREAD", 6));
	ge1016ov28149 = (GE_ms8("vvok1a", 6));
	ge1016ov27869 = (GE_ms8("VVOK-1", 6));
	ge1016ov27699 = (GE_ms8("once keys \"$6\" and \"$7\" cannot be combined.", 43));
	ge802ov37545 = (GE_ms8("OBJECT", 6));
	ge1016ov28168 = (GE_ms8("gvkbu1a", 7));
	ge1016ov27883 = (GE_ms8("GVKBU-1", 7));
	ge1016ov27718 = (GE_ms8("unknown built-in routine `$7\' in class $5.", 42));
	ge1016ov28167 = (GE_ms8("gvkbs0a", 7));
	ge1016ov27882 = (GE_ms8("GVKBS", 5));
	ge1016ov27717 = (GE_ms8("built-in routine `$7\' in class $5 has not the expected signature \'$8\'.", 70));
	ge808ov11704 = (GE_ms8("or else", 7));
	ge808ov11661 = (GE_ms8("and then", 8));
	ge1017ov8133 = (GE_ms8("GE_EX_PROG", 10));
	ge1017ov8096 = (GE_ms8("EIF_TEST", 8));
	ge1017ov8084 = (GE_ms8("EIF_NATIVE_CHAR", 15));
	ge1016ov28114 = (GE_ms8("vtat2b", 6));
	ge1016ov27664 = (GE_ms8("invalid type \'$7\' when part of a qualified anchored type: the type of anchor `$8\' must not depend (possibly recursively) on a qualified anchored type.", 150));
	ge1016ov28110 = (GE_ms8("vtat1a", 6));
	ge1016ov27851 = (GE_ms8("VTAT-1", 6));
	ge1016ov27660 = (GE_ms8("invalid type \'$7\': the anchor `$8\' must be the final name of a query.", 69));
	ge1016ov28111 = (GE_ms8("vtat1b", 6));
	ge1016ov27661 = (GE_ms8("invalid type \'$7\': the anchor `$8\' must be the final name of a query, or an argument of routine `$9\'.", 101));
	ge1016ov27915 = (GE_ms8("vcfg3c", 6));
	ge1016ov27465 = (GE_ms8("invalid type \'$7\' in constraint of formal generic parameter.", 60));
	ge1016ov28030 = (GE_ms8("vhpr3c", 6));
	ge1016ov27807 = (GE_ms8("VHPR-3", 6));
	ge1016ov27580 = (GE_ms8("invalid type \'$7\' in parent clause.", 35));
	ge1016ov28112 = (GE_ms8("vtat1c", 6));
	ge1016ov27662 = (GE_ms8("invalid type \'$7\': the anchor `$8\' must be the final name of a query in class $9.", 81));
	ge1016ov27930 = (GE_ms8("vdpr3b", 6));
	ge1016ov27764 = (GE_ms8("VDPR-3", 6));
	ge1016ov27480 = (GE_ms8("feature `$7\' is not the redefinition of an effective feature.", 61));
	ge1016ov27929 = (GE_ms8("vdpr3a", 6));
	ge1016ov27479 = (GE_ms8("conflict in Precursor construct between effective features `$7\' inherited from \'$8\' and `$9\' inherited from \'$10\'.", 114));
	ge1016ov27928 = (GE_ms8("vdpr2a", 6));
	ge1016ov27763 = (GE_ms8("VDPR-2", 6));
	ge1016ov27478 = (GE_ms8("class $7 in Precursor construct is not a parent of class $6.", 60));
	ge1016ov27932 = (GE_ms8("vdpr3d", 6));
	ge1016ov27482 = (GE_ms8("feature `$7\' is not the redeclaration of a feature.", 51));
	ge1016ov27933 = (GE_ms8("vdpr3e", 6));
	ge1016ov27483 = (GE_ms8("the associated feature of inline agents cannot be redefined.", 60));
	ge1016ov27927 = (GE_ms8("vdpr1b", 6));
	ge1016ov27762 = (GE_ms8("VDPR-1", 6));
	ge1016ov27477 = (GE_ms8("Precursor expression does not appear in a Routine_body.", 55));
	ge1016ov28133 = (GE_ms8("vuar4a", 6));
	ge1016ov27862 = (GE_ms8("VUAR-4", 6));
	ge1016ov27683 = (GE_ms8("`$7\' is not the final name of a feature in class $5.", 52));
	ge1016ov27902 = (GE_ms8("vaol1a", 6));
	ge1016ov27750 = (GE_ms8("VAOL-1", 6));
	ge1016ov27452 = (GE_ms8("old expression does not appear in a postcondition.", 50));
	ge1016ov27978 = (GE_ms8("vevi0d", 6));
	ge1016ov27528 = (GE_ms8("entity \'Result\' declared as attached is not initialized at the end of the body of inline agent.", 95));
	ge1016ov28085 = (GE_ms8("vpir1h", 6));
	ge1016ov27835 = (GE_ms8("VPIR-1", 6));
	ge1016ov27635 = (GE_ms8("local variable name \'$7\' in inline agent is also the name of an across cursor of an enclosing feature or inline agent whose scope contains the inline agent.", 156));
	ge1016ov28083 = (GE_ms8("vpir1f", 6));
	ge1016ov27633 = (GE_ms8("local variable name \'$7\' in inline agent is also the name of an object-test local of an enclosing feature or inline agent whose scope contains the inline agent.", 160));
	ge1016ov28081 = (GE_ms8("vpir1d", 6));
	ge1016ov27631 = (GE_ms8("local variable name \'$7\' in inline agent is also the name of a local variable of an enclosing feature or inline agent.", 118));
	ge1016ov28080 = (GE_ms8("vpir1c", 6));
	ge1016ov27630 = (GE_ms8("local variable name \'$7\' in inline agent is also the name of a formal argument of an enclosing feature or inline agent.", 119));
	ge1016ov28107 = (GE_ms8("vrlv1b", 6));
	ge1016ov27849 = (GE_ms8("VRLV-1", 6));
	ge1016ov27657 = (GE_ms8("local variable name \'$7\' in inline agent is also the final name of a feature.", 77));
	ge1016ov28109 = (GE_ms8("vrlv2b", 6));
	ge1016ov27850 = (GE_ms8("VRLV-2", 6));
	ge1016ov27659 = (GE_ms8("local variable name \'$7\' in inline agent is also the name of a formal argument of this agent.", 93));
	ge1016ov28099 = (GE_ms8("vred0d", 6));
	ge1016ov27844 = (GE_ms8("VRED", 4));
	ge1016ov27649 = (GE_ms8("local variable name \'$7\' appear twice in inline agent.", 54));
	ge1016ov28144 = (GE_ms8("vuot3b", 6));
	ge1016ov27694 = (GE_ms8("object-test with local name \'$6\' has the same name as another object-test local appearing in the invariant or in the same inline agent.", 135));
	ge1016ov28084 = (GE_ms8("vpir1g", 6));
	ge1016ov27634 = (GE_ms8("argument name \'$7\' in inline agent is also the name of an across cursor of an enclosing feature or inline agent whose scope contains the inline agent.", 150));
	ge1016ov28082 = (GE_ms8("vpir1e", 6));
	ge1016ov27632 = (GE_ms8("argument name \'$7\' in inline agent is also the name of an object-test local of an enclosing feature or inline agent whose scope contains the inline agent.", 154));
	ge1016ov28079 = (GE_ms8("vpir1b", 6));
	ge1016ov27629 = (GE_ms8("argument name \'$7\' in inline agent is also the name of a local variable of an enclosing feature or inline agent.", 112));
	ge1016ov28078 = (GE_ms8("vpir1a", 6));
	ge1016ov27628 = (GE_ms8("argument name \'$7\' in inline agent is also the name of a formal argument of an enclosing feature or inline agent.", 113));
	ge1016ov28103 = (GE_ms8("vrfa0b", 6));
	ge1016ov27653 = (GE_ms8("argument name \'$7\' in inline agent is also the final name of a feature.", 71));
	ge1016ov28098 = (GE_ms8("vred0c", 6));
	ge1016ov27648 = (GE_ms8("argument name \'$7\' appear twice in inline agent.", 48));
	ge1016ov28086 = (GE_ms8("vpir3a", 6));
	ge1016ov27836 = (GE_ms8("VPIR-3", 6));
	ge1016ov27636 = (GE_ms8("inline agents cannot be of the once form.", 41));
	ge1016ov28087 = (GE_ms8("vpir3b", 6));
	ge1016ov27637 = (GE_ms8("inline agents cannot be of the external form.", 45));
	ge1016ov28123 = (GE_ms8("vtct0b", 6));
	ge1016ov27673 = (GE_ms8("type based on unknown class $7.", 31));
	ge1016ov27919 = (GE_ms8("vcfg3h", 6));
	ge1016ov27469 = (GE_ms8("constraint of formal generic parameter \'$7\' contains \'$8\' itself.", 65));
	ge1016ov27917 = (GE_ms8("vcfg3e", 6));
	ge1016ov27467 = (GE_ms8("constraint of formal generic parameter \'$7\' is another formal generic parameter \'$8\'.", 85));
	ge1016ov27916 = (GE_ms8("vcfg3d", 6));
	ge1016ov27466 = (GE_ms8("constraint of formal generic parameter \'$7\' is \'$8\' itself.", 59));
	ge1016ov28119 = (GE_ms8("vtcg3a", 6));
	ge1016ov27854 = (GE_ms8("VTCG-3", 6));
	ge1016ov27669 = (GE_ms8("actual generic parameter \'$7\' in type \'$9\' does not conform to constraint \'$8\'.", 79));
	ge1016ov28176 = (GE_ms8("gvtcg5a", 7));
	ge1016ov27890 = (GE_ms8("GVTCG-5", 7));
	ge1016ov27726 = (GE_ms8("actual generic parameter \'$7\' in type \'$8\' is not a reference type but the corresponding formal parameter is marked as reference.", 129));
	ge1016ov28177 = (GE_ms8("gvtcg5b", 7));
	ge1016ov27727 = (GE_ms8("actual generic parameter \'$7\' in type \'$8\' is not expanded type but the corresponding formal parameter is marked as expanded.", 125));
	ge1016ov28127 = (GE_ms8("vtug2a", 6));
	ge1016ov27859 = (GE_ms8("VTUG-2", 6));
	ge1016ov27677 = (GE_ms8("type \'$7\' has wrong number of actual generic parameters.", 56));
	ge1016ov28126 = (GE_ms8("vtug1a", 6));
	ge1016ov27858 = (GE_ms8("VTUG-1", 6));
	ge1016ov27676 = (GE_ms8("type \'$7\' has actual generic parameters but class $8 is not generic.", 68));
	ge1016ov28164 = (GE_ms8("gvhpr5a", 7));
	ge1016ov27879 = (GE_ms8("GVHPR-5", 7));
	ge1016ov27714 = (GE_ms8("cannot inherit from Tuple_type \'$7\'.", 36));
	ge1016ov28153 = (GE_ms8("vweq0b", 6));
	ge1016ov27872 = (GE_ms8("VWEQ", 4));
	ge1016ov27703 = (GE_ms8("none of the operands of \'$7\' (of types \'$8\' and \'$9\') conforms or converts to the other.", 88));
	ge1016ov28152 = (GE_ms8("vweq0a", 6));
	ge1016ov27702 = (GE_ms8("none of the operands of \'$7\' (of types \'$8\' and \'$9\') conforms or converts to the other.", 88));
	ge1016ov28014 = (GE_ms8("vgcc6c", 6));
	ge1016ov27564 = (GE_ms8("procedure `$8\' of class $9 is not exported for creation to class $5.", 68));
	ge1016ov28017 = (GE_ms8("vgcc8a", 6));
	ge1016ov27802 = (GE_ms8("VGCC-8", 6));
	ge1016ov27567 = (GE_ms8("procedure `$8\' of class $9 is not listed as creation procedure of the $10-th formal generic parameter of class $5.", 114));
	ge1016ov28007 = (GE_ms8("vgcc1a", 6));
	ge1016ov27798 = (GE_ms8("VGCC-1", 6));
	ge1016ov27557 = (GE_ms8("creation expression with no Creation_call part, but $7 is deferred.", 67));
	ge1016ov28010 = (GE_ms8("vgcc5a", 6));
	ge1016ov27800 = (GE_ms8("VGCC-5", 6));
	ge1016ov27560 = (GE_ms8("creation expression with no Creation_call part, but $7 has a Creators part.", 75));
	ge1016ov28013 = (GE_ms8("vgcc6b", 6));
	ge1016ov27563 = (GE_ms8("`$7\' is not the final name of a procedure in class $9.", 54));
	ge1016ov27979 = (GE_ms8("vevi0e", 6));
	ge1016ov27529 = (GE_ms8("entity \'Result\' declared as attached is not initialized at the end of the body of attribute `$7\'.", 97));
	ge1016ov28094 = (GE_ms8("vqmc6a", 6));
	ge1016ov27842 = (GE_ms8("VQMC-6", 6));
	ge1016ov27644 = (GE_ms8("bit constant attribute `$7\' is not declared of Bit_type.", 56));
	ge1016ov28093 = (GE_ms8("vqmc5a", 6));
	ge1016ov27841 = (GE_ms8("VQMC-5", 6));
	ge1016ov27643 = (GE_ms8("string constant attribute `$7\' is not declared of type STRING.", 62));
	ge1016ov28092 = (GE_ms8("vqmc4a", 6));
	ge1016ov27840 = (GE_ms8("VQMC-4", 6));
	ge1016ov27642 = (GE_ms8("real constant attribute `$7\' is not declared of type REAL or DOUBLE.", 68));
	ge1016ov28090 = (GE_ms8("vqmc3a", 6));
	ge1016ov27839 = (GE_ms8("VQMC-3", 6));
	ge1016ov27640 = (GE_ms8("integer constant attribute `$7\' is not declared of type INTEGER.", 64));
	ge1016ov28091 = (GE_ms8("vqmc3b", 6));
	ge1016ov27641 = (GE_ms8("integer value \'$9\' in constant attribute `$7\' is not representable as an instance of \'$8\'.", 90));
	ge1016ov28089 = (GE_ms8("vqmc2a", 6));
	ge1016ov27838 = (GE_ms8("VQMC-2", 6));
	ge1016ov27639 = (GE_ms8("character constant attribute `$7\' is not declared of type CHARACTER.", 68));
	ge1016ov28088 = (GE_ms8("vqmc1a", 6));
	ge1016ov27837 = (GE_ms8("VQMC-1", 6));
	ge1016ov27638 = (GE_ms8("boolean constant attribute `$7\' is not declared of type BOOLEAN.", 64));
	ge1016ov28095 = (GE_ms8("vqui0a", 6));
	ge1016ov27843 = (GE_ms8("VQUI", 4));
	ge1016ov27645 = (GE_ms8("unique attribute `$7\' is not declared of type INTEGER.", 54));
	ge1016ov27914 = (GE_ms8("vcfg3b", 6));
	ge1016ov27464 = (GE_ms8("invalid type \'$7\' in constraint of formal generic parameter.", 60));
	ge1016ov28029 = (GE_ms8("vhpr3b", 6));
	ge1016ov27579 = (GE_ms8("invalid type \'$7\' in parent clause.", 35));
	ge1016ov28163 = (GE_ms8("gvhpr4a", 7));
	ge1016ov27878 = (GE_ms8("GVHPR-4", 7));
	ge1016ov27713 = (GE_ms8("cannot inherit from Bit_type \'$7\'.", 34));
	ge1016ov28116 = (GE_ms8("vtbt0b", 6));
	ge1016ov27666 = (GE_ms8("invalid type \'$7\': `$8\' is not the final name of a feature.", 59));
	ge1016ov28115 = (GE_ms8("vtbt0a", 6));
	ge1016ov27665 = (GE_ms8("invalid type \'$7\': `$8\' is not the final name of a constant attribute of type INTEGER.", 86));
	ge1016ov27913 = (GE_ms8("vcfg3a", 6));
	ge1016ov27463 = (GE_ms8("invalid type \'$7\' in constraint of formal generic parameter.", 60));
	ge1016ov28028 = (GE_ms8("vhpr3a", 6));
	ge1016ov27578 = (GE_ms8("invalid type \'$7\' in parent clause.", 35));
	ge66ov37242 = (GE_ms8("standard input", 14));
	ge1005ov36742 = (GE_ms8("gcaaa", 5));
	ge1005ov36737 = (GE_ms8("GCAAA", 5));
	ge1005ov36732 = (GE_ms8("[$1] cluster $2: cannot read cluster directory \'$3\'.", 52));
	ge1016ov28161 = (GE_ms8("vxrt0a", 6));
	ge1016ov27876 = (GE_ms8("VXRT", 4));
	ge1016ov27711 = (GE_ms8("Retry instruction does not appear in a Rescue clause.", 53));
	ge1017ov8175 = (GE_ms8("goto", 4));
	ge1017ov8130 = (GE_ms8("GE_EX_CHECK", 11));
	ge1016ov28067 = (GE_ms8("vomb2a", 6));
	ge1016ov27829 = (GE_ms8("VOMB-2", 6));
	ge1016ov27617 = (GE_ms8("inspect constant of type \'$7\' different from type \'$8\' of inspect expression.", 77));
	ge1016ov28068 = (GE_ms8("vomb2b", 6));
	ge1016ov27618 = (GE_ms8("inspect choice `$7\' is not a constant attribute.", 48));
	ge1016ov28066 = (GE_ms8("vomb1a", 6));
	ge1016ov27828 = (GE_ms8("VOMB-1", 6));
	ge1016ov27616 = (GE_ms8("inspect expression of type \'$7\' different from INTEGER or CHARACTER.", 68));
	ge1017ov8134 = (GE_ms8("GE_EX_WHEN", 10));
	ge1016ov27906 = (GE_ms8("vbac1a", 6));
	ge1016ov27753 = (GE_ms8("VBAC-1", 6));
	ge1016ov27456 = (GE_ms8("the source of the assigner call (of type \'$7\') does not conform nor convert to its target (of type \'$8\').", 105));
	ge1016ov27907 = (GE_ms8("vbac2a", 6));
	ge1016ov27754 = (GE_ms8("VBAC-2", 6));
	ge1016ov27457 = (GE_ms8("query `$7\' in class $8 has no assigner command.", 47));
	ge1016ov28038 = (GE_ms8("vjar0a", 6));
	ge1016ov27812 = (GE_ms8("VJAR", 4));
	ge1016ov27588 = (GE_ms8("the source of the assignment (of type \'$7\') does not conform nor convert to its target entity (of type \'$8\').", 109));
	ge1016ov27962 = (GE_ms8("veen0a", 6));
	ge1016ov27781 = (GE_ms8("VEEN", 4));
	ge1016ov27512 = (GE_ms8("`$7\' appears in feature `$8\', but it is not the final name of a feature in class $6 nor the name of a local variable or formal argument of feature `$8\'.", 152));
	ge1016ov27963 = (GE_ms8("veen0b", 6));
	ge1016ov27513 = (GE_ms8("`$7\' appears in an inline agent, but it is not the final name of a feature in class $6 nor the name of a local variable or formal argument of this inline agent.", 160));
	ge1016ov28040 = (GE_ms8("vjaw0b", 6));
	ge1016ov27813 = (GE_ms8("VJAW", 4));
	ge1016ov27590 = (GE_ms8("`$7\' is the name of a formal argument of feature `$8\'. A Writable is either a local variable (including Result) or an attribute.", 128));
	ge1016ov28041 = (GE_ms8("vjaw0c", 6));
	ge1016ov27591 = (GE_ms8("`$7\' is the name of a formal argument of an inline agent. A Writable is either a local variable (including Result) or an attribute.", 131));
	ge1016ov28039 = (GE_ms8("vjaw0a", 6));
	ge1016ov27589 = (GE_ms8("feature `$7\' is not an attribute. A Writable is either a local variable (including Result) or an attribute.", 107));
	ge1016ov28042 = (GE_ms8("vjrv0a", 6));
	ge1016ov27814 = (GE_ms8("VJRV", 4));
	ge1016ov27592 = (GE_ms8("the type \'$7\' of the target entity of the assignment attempt is not a reference type.", 85));
	ge1016ov28016 = (GE_ms8("vgcc6e", 6));
	ge1016ov27566 = (GE_ms8("procedure `$8\' of class $9 is not exported for creation to class $5.", 68));
	ge1016ov28018 = (GE_ms8("vgcc8b", 6));
	ge1016ov27568 = (GE_ms8("procedure `$8\' of class $9 is not listed as creation procedure of the $10-th formal generic parameter of class $5.", 114));
	ge1016ov28008 = (GE_ms8("vgcc1b", 6));
	ge1016ov27558 = (GE_ms8("creation instruction with no Creation_call part, but $7 is deferred.", 68));
	ge1016ov28011 = (GE_ms8("vgcc5b", 6));
	ge1016ov27561 = (GE_ms8("creation instruction with no Creation_call part, but $7 has a Creators part.", 76));
	ge1016ov28009 = (GE_ms8("vgcc3a", 6));
	ge1016ov27799 = (GE_ms8("VGCC-3", 6));
	ge1016ov27559 = (GE_ms8("explicit creation type \'$7\' does not conform to target entity type \'$8\'.", 72));
	ge1016ov28015 = (GE_ms8("vgcc6d", 6));
	ge1016ov27565 = (GE_ms8("`$7\' is not the final name of a procedure in class $9.", 54));
	ge1016ov27926 = (GE_ms8("vdpr1a", 6));
	ge1016ov27476 = (GE_ms8("Precursor instruction does not appear in a Routine_body.", 56));
	ge1216ov28362 = (GE_ms8("Namespace declared twice", 24));
	ge1216ov28361 = (GE_ms8("Undeclared namespace error", 26));
	ge351ov12227 = (GE_ms8("\n", 1));
	ge264ov12227 = (GE_ms8("\n", 1));
	ge251ov12227 = (GE_ms8("\n", 1));
	ge7ov4689 = (GE_ms8("\n", 1));
	ge7ov4690 = (GE_ms8("\n", 1));
	ge7ov4691 = (GE_ms8("\nOptions:\n", 10));
	ge1015ov37915 = (GE_ms8("vscn0d", 6));
	ge1015ov37911 = (GE_ms8("VSCN", 4));
	ge1015ov37910 = (GE_ms8("[$1] $2 $3: class $4 cannot be overridden both by class $5 in $6 \'$7\' and by class $8 in $9 \'$10\'.", 98));
	ge1015ov37914 = (GE_ms8("vscn0c", 6));
	ge1015ov37909 = (GE_ms8("[$1] $2 $3: assembly class $4 appearing as class $5 in assembly \'$6\' cannot be overridden by class $8 in $9 \'$10\'$11.", 117));
	ge1015ov37913 = (GE_ms8("vscn0b", 6));
	ge1015ov37908 = (GE_ms8("[$1] $2 $3: built-in class NONE cannot be overridden by class $5 in $6 \'$7\'$8.", 78));
	ge1015ov37912 = (GE_ms8("vscn0a", 6));
	ge1015ov37907 = (GE_ms8("[$1] $2 $3: class $4 name clash between class $5 in $6 \'$7\'$8 and class $9 in $10 \'$11\'$12.", 91));
	ge808ov11764 = (GE_ms8("/~", 2));
	ge808ov11775 = (GE_ms8("***unknown_name***", 18));
	ge812ov30001 = (GE_ms8("alias \"", 7));
	ge808ov11836 = (GE_ms8("alias \"[]\"", 10));
	ge808ov11837 = (GE_ms8("alias \"()\"", 10));
	ge808ov11817 = (GE_ms8("alias \"and\"", 11));
	ge808ov11833 = (GE_ms8("alias \"and then\"", 16));
	ge808ov11821 = (GE_ms8("alias \"//\"", 10));
	ge808ov11822 = (GE_ms8("alias \"/\"", 9));
	ge808ov11823 = (GE_ms8("alias \">=\"", 10));
	ge808ov11824 = (GE_ms8("alias \">\"", 9));
	ge808ov11818 = (GE_ms8("alias \"implies\"", 15));
	ge808ov11825 = (GE_ms8("alias \"<=\"", 10));
	ge808ov11826 = (GE_ms8("alias \"<\"", 9));
	ge808ov11827 = (GE_ms8("alias \"-\"", 9));
	ge808ov11828 = (GE_ms8("alias \"\\\\\"", 10));
	ge808ov11819 = (GE_ms8("alias \"or\"", 10));
	ge808ov11834 = (GE_ms8("alias \"or else\"", 15));
	ge808ov11829 = (GE_ms8("alias \"+\"", 9));
	ge808ov11830 = (GE_ms8("alias \"^\"", 9));
	ge808ov11831 = (GE_ms8("alias \"*\"", 9));
	ge808ov11820 = (GE_ms8("alias \"xor\"", 11));
	ge808ov11832 = (GE_ms8("alias \"..\"", 10));
	ge808ov11835 = (GE_ms8("alias \"not\"", 11));
	ge1284ov30597 = (GE_ms8("us-ascii", 8));
	ge1284ov30599 = (GE_ms8("utf-8", 5));
	ge714ov15920 = (GE_ms8(".", 1));
	ge714ov15921 = (GE_ms8("..", 2));
	ge808ov11813 = (GE_ms8("infix \"or else\"", 15));
	ge808ov11812 = (GE_ms8("infix \"and then\"", 16));
	ge808ov11800 = (GE_ms8("infix \"//\"", 10));
	ge808ov11801 = (GE_ms8("infix \"/\"", 9));
	ge808ov11802 = (GE_ms8("infix \">=\"", 10));
	ge808ov11803 = (GE_ms8("infix \">\"", 9));
	ge808ov11804 = (GE_ms8("infix \"<=\"", 10));
	ge808ov11805 = (GE_ms8("infix \"<\"", 9));
	ge808ov11806 = (GE_ms8("infix \"-\"", 9));
	ge808ov11807 = (GE_ms8("infix \"\\\\\"", 10));
	ge808ov11808 = (GE_ms8("infix \"+\"", 9));
	ge808ov11809 = (GE_ms8("infix \"^\"", 9));
	ge808ov11810 = (GE_ms8("infix \"*\"", 9));
	ge808ov11811 = (GE_ms8("infix \"..\"", 10));
	ge808ov11815 = (GE_ms8("prefix \"-\"", 10));
	ge808ov11816 = (GE_ms8("prefix \"+\"", 10));
	ge808ov11796 = (GE_ms8("infix \"and\"", 11));
	ge808ov11797 = (GE_ms8("infix \"implies\"", 15));
	ge808ov11798 = (GE_ms8("infix \"or\"", 10));
	ge808ov11799 = (GE_ms8("infix \"xor\"", 11));
	ge808ov11814 = (GE_ms8("prefix \"not\"", 12));
	ge833ov31268 = (GE_ms8("infix \"", 7));
	ge833ov31267 = (GE_ms8("prefix \"", 8));
	ge808ov11730 = (GE_ms8("attached separate expanded", 26));
	ge808ov11731 = (GE_ms8("attached separate reference", 27));
	ge808ov11729 = (GE_ms8("attached separate", 17));
	ge808ov11727 = (GE_ms8("attached expanded", 17));
	ge808ov11728 = (GE_ms8("attached reference", 18));
	ge808ov11735 = (GE_ms8("detachable separate expanded", 28));
	ge808ov11736 = (GE_ms8("detachable separate reference", 29));
	ge808ov11734 = (GE_ms8("detachable separate", 19));
	ge808ov11732 = (GE_ms8("detachable expanded", 19));
	ge808ov11733 = (GE_ms8("detachable reference", 20));
	ge808ov11737 = (GE_ms8("separate expanded", 17));
	ge808ov11738 = (GE_ms8("separate reference", 18));
	ge808ov11739 = (GE_ms8("", 0));
	ge852ov32660 = (GE_ms8("prefix \"", 8));
	ge840ov29908 = (GE_ms8("infix \"", 7));
	ge51ov4641 = (GE_ms8("\"$1\", line $2: negative range in character class", 48));
	ge37ov4641 = (GE_ms8("\"$1\", line $2: character \'$3\' out of range", 42));
	ge43ov4641 = (GE_ms8("$0: variable trailing context rules cannot be used with -f", 58));
	ge42ov4641 = (GE_ms8("$0: `reject\' cannot be used with -f", 35));
	ge41ov4641 = (GE_ms8("$0: -f and -m don\'t make sense together", 39));
	ge32ov4641 = (GE_ms8("\"$1\", line $2: bad character: $3", 32));
	ge31ov4641 = (GE_ms8("\"$1\", line $2: bad character class or missing close bracket", 59));
	ge48ov4641 = (GE_ms8("\"$1\", line $2: missing quote", 28));
	ge61ov4641 = (GE_ms8("\"$1\", line $2: unrecognized rule", 32));
	ge1135ov4641 = (GE_ms8("found invalid expression \'$1\' at $2", 35));
	ge169ov4641 = (GE_ms8("$0: too many (i.e. $1) nested include files", 43));
	ge168ov4641 = (GE_ms8("Syntax error in \"$1\" at line $2", 31));
	ge1129ov4641 = (GE_ms8("attribute \'$2\' of element <$1> at $4 is obsolete, use element $3 instead", 72));
	ge1145ov4641 = (GE_ms8("option name \'$1\' in option-element is unknown $2", 48));
	ge1142ov4641 = (GE_ms8("<exclude> at $1 is obsolete, use \'if\'/\'unless\' attributes instead", 65));
	ge1141ov4641 = (GE_ms8("<cluster> at $1 is obsolete. Specify options, clusters and mounts directly under <system> instead", 97));
	ge1137ov4641 = (GE_ms8("element \'$1\' must have child-element \'$2\' $3", 44));
	ge1144ov4641 = (GE_ms8("found unknown element \'$2\' in element \'$1\' $3", 45));
	ge1136ov4641 = (GE_ms8("element \'$1\' must have attribute \'$2\' $3", 40));
	ge1148ov4641 = (GE_ms8("Xace document must have a \'$1\' root-element $2", 46));
	ge1132ov4641 = (GE_ms8("element <$1> at $3 is obsolete, use element $2 instead", 54));
	ge1143ov4641 = (GE_ms8("attribute \'$2\' in element \'$1\' should have a positive integer value $4", 70));
	ge1147ov4641 = (GE_ms8("attribute \'$2\' in element \'$1\' should have one of the following values: $4 $5", 77));
	ge1139ov4641 = (GE_ms8("attribute \'$2\' in element \'$1\' should have a non-empty value $3", 63));
	ge1130ov4641 = (GE_ms8("attribute \'$2\' in element \'$1\' should have a boolean value $4", 61));
	ge1138ov4641 = (GE_ms8("Library \'$1\' mounted with incompatible prefixes \'$2\' and \'$3\' in $4 and $5", 74));
	ge163ov4641 = (GE_ms8("$0: cannot write to \'$1\'", 24));
	ge166ov4641 = (GE_ms8("$1", 2));
	ge173ov4641 = (GE_ms8("$0 version $1", 13));
	ge162ov4641 = (GE_ms8("$0: cannot read \'$1\'", 20));
	ge261ov30775 = (GE_ms8("", 0));
	ge248ov2158 = (GE_ms8("", 0));
	geic2 = (GE_ms8(" (label on item #", 17));
	geic3 = (GE_ms8(" with a manifest tuple argument", 31));
	geic4 = (GE_ms8(" of type ", 9));
}

EIF_TYPE GE_types[1887] = {
{0, 0, EIF_FALSE, 0},
{1858, 1, EIF_FALSE, 0, 0},
{0, 2, EIF_FALSE, 0, 0},
{0, 3, EIF_FALSE, 0, 0},
{0, 4, EIF_FALSE, 0, 0},
{0, 5, EIF_FALSE, 0, 0},
{841, 6, EIF_FALSE, 0, 0},
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
{1385, 17, EIF_FALSE, 0, 0},
{0, 18, EIF_FALSE, 0, 0},
{0, 19, EIF_FALSE, 0, 0},
{0, 20, EIF_FALSE, 0, 0},
{0, 21, EIF_FALSE, 0, 0},
{0, 22, EIF_FALSE, 0, 0},
{0, 23, EIF_FALSE, 0, 0},
{0, 24, EIF_FALSE, 0, 0},
{1766, 25, EIF_FALSE, 0, 0},
{0, 26, EIF_FALSE, 0, 0},
{0, 27, EIF_FALSE, &T27f46, 0},
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
{0, 50, EIF_FALSE, 0, 0},
{0, 51, EIF_FALSE, 0, 0},
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
{0, 77, EIF_FALSE, 0, 0},
{0, 78, EIF_FALSE, 0, 0},
{0, 79, EIF_FALSE, 0, 0},
{1522, 80, EIF_FALSE, 0, 0},
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
{0, 112, EIF_FALSE, 0, 0},
{1765, 113, EIF_FALSE, 0, 0},
{0, 114, EIF_FALSE, 0, 0},
{0, 115, EIF_FALSE, 0, 0},
{0, 116, EIF_FALSE, 0, 0},
{0, 117, EIF_FALSE, 0, 0},
{0, 118, EIF_FALSE, 0, 0},
{0, 119, EIF_FALSE, 0, 0},
{0, 120, EIF_FALSE, 0, 0},
{0, 121, EIF_FALSE, &T121f10, 0},
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
{0, 134, EIF_TRUE, 0, 0},
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
{0, 154, EIF_FALSE, 0, 0},
{0, 155, EIF_FALSE, 0, 0},
{0, 156, EIF_FALSE, 0, 0},
{0, 157, EIF_FALSE, 0, 0},
{0, 158, EIF_FALSE, 0, 0},
{0, 159, EIF_FALSE, 0, 0},
{0, 160, EIF_FALSE, 0, 0},
{0, 161, EIF_FALSE, 0, 0},
{0, 162, EIF_FALSE, 0, 0},
{0, 163, EIF_FALSE, 0, 0},
{0, 164, EIF_FALSE, 0, 0},
{0, 165, EIF_TRUE, 0, 0},
{0, 166, EIF_FALSE, 0, 0},
{0, 167, EIF_FALSE, 0, 0},
{0, 168, EIF_FALSE, 0, 0},
{0, 169, EIF_FALSE, 0, 0},
{0, 170, EIF_FALSE, 0, 0},
{0, 171, EIF_FALSE, 0, 0},
{0, 172, EIF_FALSE, 0, 0},
{0, 173, EIF_FALSE, 0, 0},
{0, 174, EIF_FALSE, 0, 0},
{0, 175, EIF_FALSE, 0, 0},
{622, 176, EIF_FALSE, 0, 0},
{0, 177, EIF_FALSE, 0, 0},
{0, 178, EIF_FALSE, 0, 0},
{0, 179, EIF_FALSE, 0, 0},
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
{0, 194, EIF_FALSE, 0, 0},
{0, 195, EIF_FALSE, 0, 0},
{0, 196, EIF_FALSE, 0, 0},
{0, 197, EIF_FALSE, 0, 0},
{0, 198, EIF_FALSE, 0, 0},
{0, 199, EIF_FALSE, 0, 0},
{0, 200, EIF_FALSE, 0, 0},
{0, 201, EIF_FALSE, 0, 0},
{0, 202, EIF_FALSE, 0, 0},
{0, 203, EIF_TRUE, 0, 0},
{0, 204, EIF_FALSE, 0, 0},
{0, 205, EIF_TRUE, 0, 0},
{0, 206, EIF_FALSE, 0, 0},
{0, 207, EIF_FALSE, 0, 0},
{0, 208, EIF_FALSE, 0, 0},
{0, 209, EIF_FALSE, 0, 0},
{0, 210, EIF_FALSE, 0, 0},
{0, 211, EIF_TRUE, 0, 0},
{0, 212, EIF_TRUE, 0, 0},
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
{1599, 278, EIF_FALSE, 0, 0},
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
{0, 294, EIF_FALSE, &T294f28, 0},
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
{1650, 305, EIF_FALSE, 0, 0},
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
{0, 319, EIF_FALSE, &T319f30, 0},
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
{1790, 371, EIF_FALSE, 0, 0},
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
{0, 391, EIF_FALSE, 0, 0},
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
{0, 482, EIF_FALSE, 0, 0},
{0, 483, EIF_FALSE, 0, 0},
{0, 484, EIF_FALSE, 0, 0},
{0, 485, EIF_FALSE, 0, 0},
{0, 486, EIF_FALSE, 0, 0},
{0, 487, EIF_FALSE, 0, 0},
{0, 488, EIF_FALSE, 0, 0},
{0, 489, EIF_FALSE, 0, 0},
{0, 490, EIF_FALSE, 0, 0},
{0, 491, EIF_FALSE, 0, 0},
{0, 492, EIF_FALSE, 0, 0},
{0, 493, EIF_FALSE, 0, 0},
{0, 494, EIF_FALSE, 0, 0},
{0, 495, EIF_FALSE, 0, 0},
{0, 496, EIF_FALSE, 0, 0},
{0, 497, EIF_FALSE, 0, 0},
{0, 498, EIF_FALSE, 0, 0},
{0, 499, EIF_FALSE, 0, 0},
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
{0, 527, EIF_FALSE, 0, 0},
{0, 528, EIF_FALSE, 0, 0},
{0, 529, EIF_FALSE, 0, 0},
{0, 530, EIF_FALSE, 0, 0},
{0, 531, EIF_TRUE, 0, 0},
{0, 532, EIF_FALSE, 0, 0},
{0, 533, EIF_FALSE, 0, 0},
{0, 534, EIF_FALSE, 0, 0},
{0, 535, EIF_FALSE, 0, 0},
{0, 536, EIF_TRUE, 0, 0},
{0, 537, EIF_FALSE, 0, 0},
{0, 538, EIF_FALSE, 0, 0},
{0, 539, EIF_TRUE, 0, 0},
{0, 540, EIF_FALSE, 0, 0},
{0, 541, EIF_FALSE, 0, 0},
{0, 542, EIF_FALSE, 0, 0},
{0, 543, EIF_FALSE, 0, 0},
{0, 544, EIF_FALSE, 0, 0},
{0, 545, EIF_FALSE, 0, 0},
{0, 546, EIF_FALSE, 0, 0},
{0, 547, EIF_TRUE, 0, 0},
{0, 548, EIF_FALSE, 0, 0},
{0, 549, EIF_FALSE, 0, 0},
{0, 550, EIF_FALSE, 0, 0},
{0, 551, EIF_FALSE, 0, 0},
{0, 552, EIF_FALSE, 0, 0},
{0, 553, EIF_FALSE, 0, 0},
{0, 554, EIF_FALSE, 0, 0},
{0, 555, EIF_FALSE, 0, 0},
{0, 556, EIF_FALSE, 0, 0},
{0, 557, EIF_TRUE, 0, 0},
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
{0, 574, EIF_TRUE, 0, 0},
{0, 575, EIF_FALSE, 0, 0},
{0, 576, EIF_FALSE, 0, 0},
{0, 577, EIF_TRUE, 0, 0},
{0, 578, EIF_FALSE, 0, 0},
{0, 579, EIF_FALSE, 0, 0},
{0, 580, EIF_TRUE, 0, 0},
{0, 581, EIF_FALSE, 0, 0},
{0, 582, EIF_FALSE, 0, 0},
{0, 583, EIF_TRUE, 0, 0},
{0, 584, EIF_FALSE, 0, 0},
{0, 585, EIF_FALSE, 0, 0},
{0, 586, EIF_TRUE, 0, 0},
{0, 587, EIF_FALSE, 0, 0},
{0, 588, EIF_FALSE, 0, 0},
{0, 589, EIF_TRUE, 0, 0},
{0, 590, EIF_FALSE, 0, 0},
{0, 591, EIF_TRUE, 0, 0},
{0, 592, EIF_FALSE, 0, 0},
{0, 593, EIF_FALSE, 0, 0},
{0, 594, EIF_TRUE, 0, 0},
{0, 595, EIF_FALSE, 0, 0},
{0, 596, EIF_FALSE, 0, 0},
{0, 597, EIF_FALSE, 0, 0},
{0, 598, EIF_FALSE, 0, 0},
{0, 599, EIF_FALSE, 0, 0},
{0, 600, EIF_FALSE, 0, 0},
{0, 601, EIF_FALSE, 0, 0},
{0, 602, EIF_FALSE, 0, 0},
{0, 603, EIF_FALSE, 0, 0},
{0, 604, EIF_TRUE, 0, 0},
{0, 605, EIF_FALSE, 0, 0},
{0, 606, EIF_FALSE, 0, 0},
{0, 607, EIF_FALSE, 0, 0},
{0, 608, EIF_TRUE, 0, 0},
{0, 609, EIF_FALSE, 0, 0},
{0, 610, EIF_FALSE, 0, 0},
{0, 611, EIF_FALSE, 0, 0},
{0, 612, EIF_FALSE, 0, 0},
{0, 613, EIF_FALSE, 0, 0},
{0, 614, EIF_FALSE, 0, 0},
{0, 615, EIF_FALSE, 0, 0},
{0, 616, EIF_FALSE, 0, 0},
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
{0, 628, EIF_TRUE, 0, 0},
{0, 629, EIF_FALSE, 0, 0},
{0, 630, EIF_TRUE, 0, 0},
{0, 631, EIF_TRUE, 0, 0},
{0, 632, EIF_FALSE, 0, 0},
{0, 633, EIF_FALSE, 0, 0},
{0, 634, EIF_FALSE, 0, 0},
{0, 635, EIF_FALSE, 0, 0},
{0, 636, EIF_FALSE, 0, 0},
{0, 637, EIF_FALSE, 0, 0},
{0, 638, EIF_FALSE, 0, 0},
{0, 639, EIF_FALSE, 0, 0},
{0, 640, EIF_TRUE, 0, 0},
{0, 641, EIF_FALSE, 0, 0},
{0, 642, EIF_FALSE, 0, 0},
{0, 643, EIF_TRUE, 0, 0},
{0, 644, EIF_FALSE, 0, 0},
{0, 645, EIF_FALSE, 0, 0},
{0, 646, EIF_FALSE, 0, 0},
{0, 647, EIF_FALSE, 0, 0},
{0, 648, EIF_TRUE, 0, 0},
{0, 649, EIF_FALSE, 0, 0},
{0, 650, EIF_FALSE, 0, 0},
{0, 651, EIF_FALSE, 0, 0},
{0, 652, EIF_FALSE, 0, 0},
{0, 653, EIF_TRUE, 0, 0},
{0, 654, EIF_FALSE, 0, 0},
{0, 655, EIF_FALSE, 0, 0},
{0, 656, EIF_FALSE, 0, 0},
{0, 657, EIF_FALSE, 0, 0},
{0, 658, EIF_TRUE, 0, 0},
{0, 659, EIF_FALSE, 0, 0},
{0, 660, EIF_FALSE, 0, 0},
{0, 661, EIF_TRUE, 0, 0},
{0, 662, EIF_FALSE, 0, 0},
{0, 663, EIF_FALSE, 0, 0},
{0, 664, EIF_TRUE, 0, 0},
{0, 665, EIF_FALSE, 0, 0},
{0, 666, EIF_FALSE, 0, 0},
{0, 667, EIF_TRUE, 0, 0},
{0, 668, EIF_FALSE, 0, 0},
{0, 669, EIF_FALSE, 0, 0},
{0, 670, EIF_TRUE, 0, 0},
{0, 671, EIF_FALSE, 0, 0},
{0, 672, EIF_FALSE, 0, 0},
{0, 673, EIF_TRUE, 0, 0},
{0, 674, EIF_FALSE, 0, 0},
{0, 675, EIF_FALSE, 0, 0},
{0, 676, EIF_FALSE, 0, 0},
{0, 677, EIF_TRUE, 0, 0},
{0, 678, EIF_FALSE, 0, 0},
{0, 679, EIF_FALSE, 0, 0},
{0, 680, EIF_FALSE, 0, 0},
{0, 681, EIF_FALSE, 0, 0},
{0, 682, EIF_TRUE, 0, 0},
{0, 683, EIF_FALSE, 0, 0},
{0, 684, EIF_TRUE, 0, 0},
{0, 685, EIF_FALSE, 0, 0},
{0, 686, EIF_FALSE, 0, 0},
{0, 687, EIF_FALSE, 0, 0},
{0, 688, EIF_TRUE, 0, 0},
{0, 689, EIF_FALSE, 0, 0},
{0, 690, EIF_FALSE, 0, 0},
{0, 691, EIF_TRUE, 0, 0},
{0, 692, EIF_FALSE, 0, 0},
{0, 693, EIF_FALSE, 0, 0},
{0, 694, EIF_FALSE, 0, 0},
{0, 695, EIF_FALSE, 0, 0},
{0, 696, EIF_FALSE, 0, 0},
{0, 697, EIF_FALSE, 0, 0},
{0, 698, EIF_FALSE, 0, 0},
{0, 699, EIF_FALSE, 0, 0},
{0, 700, EIF_FALSE, 0, 0},
{0, 701, EIF_FALSE, 0, 0},
{0, 702, EIF_FALSE, 0, 0},
{0, 703, EIF_FALSE, 0, 0},
{0, 704, EIF_TRUE, 0, 0},
{0, 705, EIF_FALSE, 0, 0},
{0, 706, EIF_FALSE, 0, 0},
{0, 707, EIF_FALSE, 0, 0},
{0, 708, EIF_FALSE, 0, 0},
{0, 709, EIF_FALSE, 0, 0},
{0, 710, EIF_FALSE, 0, 0},
{0, 711, EIF_FALSE, 0, 0},
{0, 712, EIF_FALSE, 0, 0},
{0, 713, EIF_FALSE, 0, 0},
{0, 714, EIF_FALSE, 0, 0},
{0, 715, EIF_FALSE, 0, 0},
{0, 716, EIF_TRUE, 0, 0},
{0, 717, EIF_FALSE, 0, 0},
{0, 718, EIF_FALSE, 0, 0},
{0, 719, EIF_FALSE, 0, 0},
{0, 720, EIF_TRUE, 0, 0},
{0, 721, EIF_FALSE, 0, 0},
{0, 722, EIF_FALSE, 0, 0},
{0, 723, EIF_FALSE, 0, 0},
{0, 724, EIF_TRUE, 0, 0},
{0, 725, EIF_FALSE, 0, 0},
{0, 726, EIF_FALSE, 0, 0},
{0, 727, EIF_FALSE, 0, 0},
{0, 728, EIF_TRUE, 0, 0},
{0, 729, EIF_FALSE, 0, 0},
{0, 730, EIF_TRUE, 0, 0},
{0, 731, EIF_FALSE, 0, 0},
{0, 732, EIF_FALSE, 0, 0},
{0, 733, EIF_FALSE, 0, 0},
{0, 734, EIF_TRUE, 0, 0},
{0, 735, EIF_FALSE, 0, 0},
{0, 736, EIF_FALSE, 0, 0},
{0, 737, EIF_FALSE, 0, 0},
{0, 738, EIF_FALSE, 0, 0},
{0, 739, EIF_TRUE, 0, 0},
{0, 740, EIF_FALSE, 0, 0},
{0, 741, EIF_FALSE, 0, 0},
{0, 742, EIF_FALSE, 0, 0},
{0, 743, EIF_FALSE, 0, 0},
{1791, 744, EIF_FALSE, 0, 0},
{0, 745, EIF_TRUE, 0, 0},
{0, 746, EIF_FALSE, 0, 0},
{0, 747, EIF_FALSE, 0, 0},
{0, 748, EIF_FALSE, 0, 0},
{0, 749, EIF_TRUE, 0, 0},
{0, 750, EIF_FALSE, 0, 0},
{0, 751, EIF_FALSE, 0, 0},
{0, 752, EIF_FALSE, 0, 0},
{0, 753, EIF_TRUE, 0, 0},
{0, 754, EIF_FALSE, 0, 0},
{0, 755, EIF_FALSE, 0, 0},
{0, 756, EIF_FALSE, 0, 0},
{0, 757, EIF_FALSE, 0, 0},
{0, 758, EIF_FALSE, 0, 0},
{0, 759, EIF_FALSE, 0, 0},
{0, 760, EIF_FALSE, 0, 0},
{0, 761, EIF_FALSE, 0, 0},
{0, 762, EIF_FALSE, 0, 0},
{0, 763, EIF_FALSE, 0, 0},
{0, 764, EIF_FALSE, 0, 0},
{0, 765, EIF_FALSE, 0, 0},
{0, 766, EIF_FALSE, 0, 0},
{0, 767, EIF_FALSE, 0, 0},
{0, 768, EIF_FALSE, 0, 0},
{0, 769, EIF_FALSE, 0, 0},
{0, 770, EIF_FALSE, 0, 0},
{0, 771, EIF_FALSE, 0, 0},
{0, 772, EIF_FALSE, 0, 0},
{0, 773, EIF_FALSE, 0, 0},
{0, 774, EIF_FALSE, 0, 0},
{0, 775, EIF_FALSE, 0, 0},
{0, 776, EIF_FALSE, 0, 0},
{0, 777, EIF_FALSE, 0, 0},
{0, 778, EIF_FALSE, 0, 0},
{0, 779, EIF_FALSE, 0, 0},
{0, 780, EIF_FALSE, 0, 0},
{0, 781, EIF_FALSE, 0, 0},
{0, 782, EIF_FALSE, 0, 0},
{0, 783, EIF_FALSE, 0, 0},
{0, 784, EIF_FALSE, 0, 0},
{0, 785, EIF_FALSE, 0, 0},
{0, 786, EIF_FALSE, 0, 0},
{0, 787, EIF_FALSE, 0, 0},
{0, 788, EIF_FALSE, 0, 0},
{0, 789, EIF_FALSE, 0, 0},
{0, 790, EIF_FALSE, 0, 0},
{0, 791, EIF_FALSE, 0, 0},
{0, 792, EIF_FALSE, 0, 0},
{0, 793, EIF_FALSE, 0, 0},
{0, 794, EIF_FALSE, 0, 0},
{0, 795, EIF_FALSE, 0, 0},
{0, 796, EIF_FALSE, 0, 0},
{0, 797, EIF_FALSE, 0, 0},
{0, 798, EIF_FALSE, 0, 0},
{0, 799, EIF_FALSE, 0, 0},
{0, 800, EIF_FALSE, 0, 0},
{0, 801, EIF_FALSE, 0, 0},
{0, 802, EIF_FALSE, 0, 0},
{0, 803, EIF_FALSE, 0, 0},
{0, 804, EIF_FALSE, 0, 0},
{0, 805, EIF_FALSE, 0, 0},
{0, 806, EIF_FALSE, 0, 0},
{0, 807, EIF_FALSE, 0, 0},
{0, 808, EIF_FALSE, 0, 0},
{0, 809, EIF_FALSE, 0, 0},
{0, 810, EIF_FALSE, 0, 0},
{0, 811, EIF_FALSE, 0, 0},
{0, 812, EIF_FALSE, 0, 0},
{0, 813, EIF_FALSE, 0, 0},
{0, 814, EIF_FALSE, 0, 0},
{0, 815, EIF_FALSE, 0, 0},
{0, 816, EIF_FALSE, 0, 0},
{0, 817, EIF_FALSE, 0, 0},
{0, 818, EIF_FALSE, 0, 0},
{0, 819, EIF_FALSE, 0, 0},
{0, 820, EIF_FALSE, 0, 0},
{0, 821, EIF_FALSE, 0, 0},
{0, 822, EIF_FALSE, 0, 0},
{0, 823, EIF_FALSE, 0, 0},
{0, 824, EIF_FALSE, 0, 0},
{0, 825, EIF_FALSE, 0, 0},
{0, 826, EIF_FALSE, 0, 0},
{0, 827, EIF_FALSE, 0, 0},
{0, 828, EIF_FALSE, 0, 0},
{0, 829, EIF_FALSE, 0, 0},
{0, 830, EIF_FALSE, 0, 0},
{0, 831, EIF_FALSE, 0, 0},
{0, 832, EIF_FALSE, 0, 0},
{0, 833, EIF_FALSE, 0, 0},
{0, 834, EIF_FALSE, 0, 0},
{0, 835, EIF_FALSE, 0, 0},
{0, 836, EIF_FALSE, 0, 0},
{0, 837, EIF_FALSE, 0, 0},
{0, 838, EIF_FALSE, 0, 0},
{0, 839, EIF_FALSE, 0, 0},
{0, 840, EIF_FALSE, 0, 0},
{0, 841, EIF_FALSE, 0, 0},
{0, 842, EIF_FALSE, 0, 0},
{0, 843, EIF_FALSE, 0, 0},
{0, 844, EIF_FALSE, 0, 0},
{0, 845, EIF_FALSE, 0, 0},
{0, 846, EIF_FALSE, 0, 0},
{0, 847, EIF_FALSE, 0, 0},
{0, 848, EIF_FALSE, 0, 0},
{0, 849, EIF_TRUE, 0, 0},
{0, 850, EIF_FALSE, 0, 0},
{0, 851, EIF_FALSE, 0, 0},
{0, 852, EIF_TRUE, 0, 0},
{0, 853, EIF_FALSE, 0, 0},
{0, 854, EIF_FALSE, 0, 0},
{0, 855, EIF_FALSE, 0, 0},
{0, 856, EIF_FALSE, 0, 0},
{0, 857, EIF_FALSE, 0, 0},
{0, 858, EIF_FALSE, 0, 0},
{0, 859, EIF_TRUE, 0, 0},
{0, 860, EIF_FALSE, 0, 0},
{0, 861, EIF_TRUE, 0, 0},
{0, 862, EIF_FALSE, 0, 0},
{0, 863, EIF_FALSE, 0, 0},
{0, 864, EIF_FALSE, 0, 0},
{0, 865, EIF_FALSE, 0, 0},
{0, 866, EIF_TRUE, 0, 0},
{0, 867, EIF_FALSE, 0, 0},
{0, 868, EIF_FALSE, 0, 0},
{0, 869, EIF_FALSE, 0, 0},
{0, 870, EIF_FALSE, 0, 0},
{0, 871, EIF_FALSE, 0, 0},
{0, 872, EIF_FALSE, 0, 0},
{0, 873, EIF_FALSE, 0, 0},
{0, 874, EIF_FALSE, 0, 0},
{0, 875, EIF_FALSE, 0, 0},
{0, 876, EIF_FALSE, 0, 0},
{0, 877, EIF_FALSE, 0, 0},
{0, 878, EIF_FALSE, 0, 0},
{0, 879, EIF_FALSE, 0, 0},
{0, 880, EIF_FALSE, 0, 0},
{0, 881, EIF_FALSE, 0, 0},
{0, 882, EIF_FALSE, 0, 0},
{0, 883, EIF_FALSE, 0, 0},
{0, 884, EIF_FALSE, 0, 0},
{0, 885, EIF_FALSE, 0, 0},
{0, 886, EIF_FALSE, 0, 0},
{0, 887, EIF_FALSE, 0, 0},
{0, 888, EIF_FALSE, 0, 0},
{0, 889, EIF_FALSE, 0, 0},
{0, 890, EIF_FALSE, 0, 0},
{0, 891, EIF_FALSE, 0, 0},
{0, 892, EIF_FALSE, 0, 0},
{0, 893, EIF_TRUE, 0, 0},
{0, 894, EIF_FALSE, 0, 0},
{0, 895, EIF_FALSE, 0, 0},
{0, 896, EIF_TRUE, 0, 0},
{0, 897, EIF_FALSE, 0, 0},
{0, 898, EIF_FALSE, 0, 0},
{0, 899, EIF_TRUE, 0, 0},
{0, 900, EIF_FALSE, 0, 0},
{0, 901, EIF_TRUE, 0, 0},
{0, 902, EIF_FALSE, 0, 0},
{0, 903, EIF_TRUE, 0, 0},
{0, 904, EIF_FALSE, 0, 0},
{0, 905, EIF_FALSE, 0, 0},
{0, 906, EIF_TRUE, 0, 0},
{0, 907, EIF_FALSE, 0, 0},
{0, 908, EIF_FALSE, 0, 0},
{0, 909, EIF_TRUE, 0, 0},
{0, 910, EIF_FALSE, 0, 0},
{0, 911, EIF_FALSE, 0, 0},
{0, 912, EIF_TRUE, 0, 0},
{0, 913, EIF_FALSE, 0, 0},
{0, 914, EIF_FALSE, 0, 0},
{0, 915, EIF_TRUE, 0, 0},
{0, 916, EIF_FALSE, 0, 0},
{0, 917, EIF_TRUE, 0, 0},
{0, 918, EIF_FALSE, 0, 0},
{0, 919, EIF_FALSE, 0, 0},
{0, 920, EIF_TRUE, 0, 0},
{0, 921, EIF_FALSE, 0, 0},
{0, 922, EIF_FALSE, 0, 0},
{0, 923, EIF_TRUE, 0, 0},
{0, 924, EIF_FALSE, 0, 0},
{0, 925, EIF_FALSE, 0, 0},
{0, 926, EIF_TRUE, 0, 0},
{0, 927, EIF_FALSE, 0, 0},
{0, 928, EIF_TRUE, 0, 0},
{0, 929, EIF_FALSE, 0, 0},
{0, 930, EIF_FALSE, 0, 0},
{0, 931, EIF_TRUE, 0, 0},
{0, 932, EIF_FALSE, 0, 0},
{0, 933, EIF_TRUE, 0, 0},
{0, 934, EIF_FALSE, 0, 0},
{0, 935, EIF_FALSE, 0, 0},
{0, 936, EIF_TRUE, 0, 0},
{0, 937, EIF_FALSE, 0, 0},
{0, 938, EIF_FALSE, 0, 0},
{0, 939, EIF_TRUE, 0, 0},
{0, 940, EIF_FALSE, 0, 0},
{0, 941, EIF_FALSE, 0, 0},
{0, 942, EIF_TRUE, 0, 0},
{0, 943, EIF_FALSE, 0, 0},
{0, 944, EIF_FALSE, 0, 0},
{0, 945, EIF_TRUE, 0, 0},
{0, 946, EIF_FALSE, 0, 0},
{0, 947, EIF_TRUE, 0, 0},
{0, 948, EIF_FALSE, 0, 0},
{0, 949, EIF_FALSE, 0, 0},
{0, 950, EIF_TRUE, 0, 0},
{0, 951, EIF_FALSE, 0, 0},
{0, 952, EIF_FALSE, 0, 0},
{0, 953, EIF_TRUE, 0, 0},
{0, 954, EIF_FALSE, 0, 0},
{0, 955, EIF_FALSE, 0, 0},
{0, 956, EIF_TRUE, 0, 0},
{0, 957, EIF_FALSE, 0, 0},
{0, 958, EIF_TRUE, 0, 0},
{0, 959, EIF_FALSE, 0, 0},
{0, 960, EIF_TRUE, 0, 0},
{0, 961, EIF_FALSE, 0, 0},
{0, 962, EIF_TRUE, 0, 0},
{0, 963, EIF_FALSE, 0, 0},
{0, 964, EIF_FALSE, 0, 0},
{0, 965, EIF_TRUE, 0, 0},
{0, 966, EIF_FALSE, 0, 0},
{0, 967, EIF_FALSE, 0, 0},
{0, 968, EIF_TRUE, 0, 0},
{0, 969, EIF_FALSE, 0, 0},
{0, 970, EIF_TRUE, 0, 0},
{0, 971, EIF_FALSE, 0, 0},
{0, 972, EIF_TRUE, 0, 0},
{0, 973, EIF_FALSE, 0, 0},
{0, 974, EIF_FALSE, 0, 0},
{0, 975, EIF_TRUE, 0, 0},
{0, 976, EIF_FALSE, 0, 0},
{0, 977, EIF_FALSE, 0, 0},
{0, 978, EIF_TRUE, 0, 0},
{0, 979, EIF_FALSE, 0, 0},
{0, 980, EIF_FALSE, 0, 0},
{0, 981, EIF_TRUE, 0, 0},
{0, 982, EIF_FALSE, 0, 0},
{0, 983, EIF_FALSE, 0, 0},
{0, 984, EIF_TRUE, 0, 0},
{0, 985, EIF_FALSE, 0, 0},
{0, 986, EIF_FALSE, 0, 0},
{0, 987, EIF_TRUE, 0, 0},
{0, 988, EIF_FALSE, 0, 0},
{0, 989, EIF_FALSE, 0, 0},
{0, 990, EIF_TRUE, 0, 0},
{0, 991, EIF_FALSE, 0, 0},
{0, 992, EIF_FALSE, 0, 0},
{0, 993, EIF_TRUE, 0, 0},
{0, 994, EIF_FALSE, 0, 0},
{0, 995, EIF_FALSE, 0, 0},
{0, 996, EIF_TRUE, 0, 0},
{0, 997, EIF_FALSE, 0, 0},
{0, 998, EIF_FALSE, 0, 0},
{0, 999, EIF_TRUE, 0, 0},
{0, 1000, EIF_FALSE, 0, 0},
{0, 1001, EIF_TRUE, 0, 0},
{0, 1002, EIF_FALSE, 0, 0},
{0, 1003, EIF_TRUE, 0, 0},
{0, 1004, EIF_FALSE, 0, 0},
{0, 1005, EIF_FALSE, 0, 0},
{0, 1006, EIF_TRUE, 0, 0},
{0, 1007, EIF_FALSE, 0, 0},
{0, 1008, EIF_TRUE, 0, 0},
{0, 1009, EIF_FALSE, 0, 0},
{0, 1010, EIF_FALSE, 0, 0},
{0, 1011, EIF_TRUE, 0, 0},
{0, 1012, EIF_FALSE, 0, 0},
{0, 1013, EIF_FALSE, 0, 0},
{0, 1014, EIF_TRUE, 0, 0},
{0, 1015, EIF_FALSE, 0, 0},
{0, 1016, EIF_FALSE, 0, 0},
{0, 1017, EIF_TRUE, 0, 0},
{0, 1018, EIF_FALSE, 0, 0},
{0, 1019, EIF_FALSE, 0, 0},
{0, 1020, EIF_TRUE, 0, 0},
{0, 1021, EIF_FALSE, 0, 0},
{0, 1022, EIF_FALSE, 0, 0},
{0, 1023, EIF_TRUE, 0, 0},
{0, 1024, EIF_FALSE, 0, 0},
{0, 1025, EIF_FALSE, 0, 0},
{0, 1026, EIF_TRUE, 0, 0},
{0, 1027, EIF_FALSE, 0, 0},
{0, 1028, EIF_FALSE, 0, 0},
{0, 1029, EIF_TRUE, 0, 0},
{0, 1030, EIF_FALSE, 0, 0},
{0, 1031, EIF_FALSE, 0, 0},
{0, 1032, EIF_TRUE, 0, 0},
{0, 1033, EIF_FALSE, 0, 0},
{0, 1034, EIF_TRUE, 0, 0},
{0, 1035, EIF_FALSE, 0, 0},
{0, 1036, EIF_FALSE, 0, 0},
{0, 1037, EIF_TRUE, 0, 0},
{0, 1038, EIF_FALSE, 0, 0},
{0, 1039, EIF_TRUE, 0, 0},
{0, 1040, EIF_FALSE, 0, 0},
{0, 1041, EIF_FALSE, 0, 0},
{0, 1042, EIF_TRUE, 0, 0},
{0, 1043, EIF_FALSE, 0, 0},
{0, 1044, EIF_FALSE, 0, 0},
{0, 1045, EIF_TRUE, 0, 0},
{0, 1046, EIF_FALSE, 0, 0},
{0, 1047, EIF_FALSE, 0, 0},
{0, 1048, EIF_TRUE, 0, 0},
{0, 1049, EIF_FALSE, 0, 0},
{0, 1050, EIF_FALSE, 0, 0},
{0, 1051, EIF_TRUE, 0, 0},
{0, 1052, EIF_FALSE, 0, 0},
{0, 1053, EIF_TRUE, 0, 0},
{0, 1054, EIF_FALSE, 0, 0},
{0, 1055, EIF_TRUE, 0, 0},
{0, 1056, EIF_FALSE, 0, 0},
{0, 1057, EIF_FALSE, 0, 0},
{0, 1058, EIF_TRUE, 0, 0},
{0, 1059, EIF_FALSE, 0, 0},
{0, 1060, EIF_FALSE, 0, 0},
{0, 1061, EIF_TRUE, 0, 0},
{0, 1062, EIF_FALSE, 0, 0},
{0, 1063, EIF_FALSE, 0, 0},
{0, 1064, EIF_TRUE, 0, 0},
{0, 1065, EIF_FALSE, 0, 0},
{0, 1066, EIF_FALSE, 0, 0},
{0, 1067, EIF_TRUE, 0, 0},
{0, 1068, EIF_FALSE, 0, 0},
{0, 1069, EIF_TRUE, 0, 0},
{0, 1070, EIF_FALSE, 0, 0},
{0, 1071, EIF_FALSE, 0, 0},
{0, 1072, EIF_TRUE, 0, 0},
{0, 1073, EIF_FALSE, 0, 0},
{0, 1074, EIF_TRUE, 0, 0},
{0, 1075, EIF_FALSE, 0, 0},
{0, 1076, EIF_FALSE, 0, 0},
{0, 1077, EIF_TRUE, 0, 0},
{0, 1078, EIF_FALSE, 0, 0},
{0, 1079, EIF_TRUE, 0, 0},
{0, 1080, EIF_FALSE, 0, 0},
{0, 1081, EIF_FALSE, 0, 0},
{0, 1082, EIF_TRUE, 0, 0},
{0, 1083, EIF_FALSE, 0, 0},
{0, 1084, EIF_FALSE, 0, 0},
{0, 1085, EIF_TRUE, 0, 0},
{0, 1086, EIF_FALSE, 0, 0},
{0, 1087, EIF_TRUE, 0, 0},
{0, 1088, EIF_FALSE, 0, 0},
{0, 1089, EIF_FALSE, 0, 0},
{0, 1090, EIF_TRUE, 0, 0},
{0, 1091, EIF_FALSE, 0, 0},
{0, 1092, EIF_FALSE, 0, 0},
{0, 1093, EIF_TRUE, 0, 0},
{0, 1094, EIF_FALSE, 0, 0},
{0, 1095, EIF_FALSE, 0, 0},
{0, 1096, EIF_TRUE, 0, 0},
{0, 1097, EIF_FALSE, 0, 0},
{0, 1098, EIF_FALSE, 0, 0},
{0, 1099, EIF_TRUE, 0, 0},
{0, 1100, EIF_FALSE, 0, 0},
{0, 1101, EIF_FALSE, 0, 0},
{0, 1102, EIF_TRUE, 0, 0},
{0, 1103, EIF_FALSE, 0, 0},
{0, 1104, EIF_FALSE, 0, 0},
{0, 1105, EIF_TRUE, 0, 0},
{0, 1106, EIF_FALSE, 0, 0},
{0, 1107, EIF_FALSE, 0, 0},
{0, 1108, EIF_TRUE, 0, 0},
{0, 1109, EIF_FALSE, 0, 0},
{0, 1110, EIF_FALSE, 0, 0},
{0, 1111, EIF_TRUE, 0, 0},
{0, 1112, EIF_FALSE, 0, 0},
{0, 1113, EIF_TRUE, 0, 0},
{0, 1114, EIF_FALSE, 0, 0},
{0, 1115, EIF_TRUE, 0, 0},
{0, 1116, EIF_FALSE, 0, 0},
{0, 1117, EIF_FALSE, 0, 0},
{0, 1118, EIF_TRUE, 0, 0},
{0, 1119, EIF_FALSE, 0, 0},
{0, 1120, EIF_FALSE, 0, 0},
{0, 1121, EIF_TRUE, 0, 0},
{0, 1122, EIF_FALSE, 0, 0},
{0, 1123, EIF_FALSE, 0, 0},
{0, 1124, EIF_TRUE, 0, 0},
{0, 1125, EIF_FALSE, 0, 0},
{0, 1126, EIF_TRUE, 0, 0},
{0, 1127, EIF_FALSE, 0, 0},
{0, 1128, EIF_FALSE, 0, 0},
{0, 1129, EIF_TRUE, 0, 0},
{0, 1130, EIF_FALSE, 0, 0},
{0, 1131, EIF_FALSE, 0, 0},
{0, 1132, EIF_TRUE, 0, 0},
{0, 1133, EIF_FALSE, 0, 0},
{0, 1134, EIF_FALSE, 0, 0},
{0, 1135, EIF_TRUE, 0, 0},
{0, 1136, EIF_FALSE, 0, 0},
{0, 1137, EIF_FALSE, 0, 0},
{0, 1138, EIF_TRUE, 0, 0},
{0, 1139, EIF_FALSE, 0, 0},
{0, 1140, EIF_TRUE, 0, 0},
{0, 1141, EIF_FALSE, 0, 0},
{0, 1142, EIF_FALSE, 0, 0},
{0, 1143, EIF_TRUE, 0, 0},
{0, 1144, EIF_FALSE, 0, 0},
{0, 1145, EIF_FALSE, 0, 0},
{0, 1146, EIF_TRUE, 0, 0},
{0, 1147, EIF_FALSE, 0, 0},
{0, 1148, EIF_TRUE, 0, 0},
{0, 1149, EIF_FALSE, 0, 0},
{0, 1150, EIF_TRUE, 0, 0},
{0, 1151, EIF_FALSE, 0, 0},
{0, 1152, EIF_TRUE, 0, 0},
{0, 1153, EIF_FALSE, 0, 0},
{0, 1154, EIF_TRUE, 0, 0},
{0, 1155, EIF_FALSE, 0, 0},
{0, 1156, EIF_FALSE, 0, 0},
{0, 1157, EIF_TRUE, 0, 0},
{0, 1158, EIF_FALSE, 0, 0},
{0, 1159, EIF_FALSE, 0, 0},
{0, 1160, EIF_TRUE, 0, 0},
{0, 1161, EIF_FALSE, 0, 0},
{0, 1162, EIF_TRUE, 0, 0},
{0, 1163, EIF_FALSE, 0, 0},
{0, 1164, EIF_FALSE, 0, 0},
{0, 1165, EIF_TRUE, 0, 0},
{0, 1166, EIF_FALSE, 0, 0},
{0, 1167, EIF_FALSE, 0, 0},
{0, 1168, EIF_TRUE, 0, 0},
{0, 1169, EIF_FALSE, 0, 0},
{0, 1170, EIF_FALSE, 0, 0},
{0, 1171, EIF_TRUE, 0, 0},
{0, 1172, EIF_FALSE, 0, 0},
{0, 1173, EIF_FALSE, 0, 0},
{0, 1174, EIF_TRUE, 0, 0},
{0, 1175, EIF_FALSE, 0, 0},
{0, 1176, EIF_FALSE, 0, 0},
{0, 1177, EIF_TRUE, 0, 0},
{0, 1178, EIF_FALSE, 0, 0},
{0, 1179, EIF_FALSE, 0, 0},
{0, 1180, EIF_TRUE, 0, 0},
{0, 1181, EIF_FALSE, 0, 0},
{0, 1182, EIF_FALSE, 0, 0},
{0, 1183, EIF_TRUE, 0, 0},
{0, 1184, EIF_FALSE, 0, 0},
{0, 1185, EIF_TRUE, 0, 0},
{0, 1186, EIF_FALSE, 0, 0},
{0, 1187, EIF_FALSE, 0, 0},
{0, 1188, EIF_FALSE, 0, 0},
{0, 1189, EIF_FALSE, 0, 0},
{0, 1190, EIF_FALSE, 0, 0},
{0, 1191, EIF_FALSE, 0, 0},
{0, 1192, EIF_FALSE, 0, 0},
{0, 1193, EIF_FALSE, 0, 0},
{0, 1194, EIF_FALSE, 0, 0},
{0, 1195, EIF_FALSE, 0, 0},
{0, 1196, EIF_FALSE, 0, 0},
{0, 1197, EIF_FALSE, 0, 0},
{0, 1198, EIF_FALSE, 0, 0},
{0, 1199, EIF_FALSE, 0, 0},
{0, 1200, EIF_FALSE, 0, 0},
{0, 1201, EIF_FALSE, 0, 0},
{0, 1202, EIF_FALSE, 0, 0},
{0, 1203, EIF_FALSE, 0, 0},
{0, 1204, EIF_FALSE, 0, 0},
{0, 1205, EIF_FALSE, 0, 0},
{0, 1206, EIF_FALSE, 0, 0},
{0, 1207, EIF_FALSE, 0, 0},
{0, 1208, EIF_FALSE, 0, 0},
{0, 1209, EIF_FALSE, 0, 0},
{0, 1210, EIF_FALSE, 0, 0},
{0, 1211, EIF_FALSE, 0, 0},
{0, 1212, EIF_FALSE, 0, 0},
{0, 1213, EIF_FALSE, 0, 0},
{0, 1214, EIF_FALSE, 0, 0},
{0, 1215, EIF_FALSE, 0, 0},
{0, 1216, EIF_FALSE, 0, 0},
{1649, 1217, EIF_FALSE, 0, 0},
{0, 1218, EIF_FALSE, 0, 0},
{0, 1219, EIF_FALSE, 0, 0},
{0, 1220, EIF_FALSE, 0, 0},
{0, 1221, EIF_FALSE, 0, 0},
{0, 1222, EIF_FALSE, 0, 0},
{0, 1223, EIF_FALSE, 0, 0},
{0, 1224, EIF_FALSE, 0, 0},
{0, 1225, EIF_FALSE, 0, 0},
{0, 1226, EIF_FALSE, 0, 0},
{0, 1227, EIF_FALSE, 0, 0},
{0, 1228, EIF_FALSE, 0, 0},
{0, 1229, EIF_FALSE, 0, 0},
{0, 1230, EIF_FALSE, 0, 0},
{0, 1231, EIF_FALSE, 0, 0},
{0, 1232, EIF_FALSE, 0, 0},
{0, 1233, EIF_FALSE, 0, 0},
{0, 1234, EIF_FALSE, 0, 0},
{0, 1235, EIF_FALSE, 0, 0},
{0, 1236, EIF_FALSE, 0, 0},
{0, 1237, EIF_FALSE, 0, 0},
{0, 1238, EIF_FALSE, 0, 0},
{0, 1239, EIF_FALSE, 0, 0},
{0, 1240, EIF_FALSE, 0, 0},
{0, 1241, EIF_FALSE, 0, 0},
{0, 1242, EIF_FALSE, 0, 0},
{0, 1243, EIF_FALSE, 0, 0},
{0, 1244, EIF_FALSE, 0, 0},
{0, 1245, EIF_FALSE, 0, 0},
{0, 1246, EIF_FALSE, 0, 0},
{0, 1247, EIF_FALSE, 0, 0},
{0, 1248, EIF_FALSE, 0, 0},
{0, 1249, EIF_FALSE, 0, 0},
{0, 1250, EIF_FALSE, 0, 0},
{0, 1251, EIF_FALSE, 0, 0},
{0, 1252, EIF_FALSE, 0, 0},
{0, 1253, EIF_FALSE, 0, 0},
{0, 1254, EIF_FALSE, 0, 0},
{0, 1255, EIF_FALSE, 0, 0},
{0, 1256, EIF_FALSE, 0, 0},
{0, 1257, EIF_FALSE, 0, 0},
{0, 1258, EIF_FALSE, 0, 0},
{0, 1259, EIF_FALSE, 0, 0},
{0, 1260, EIF_FALSE, 0, 0},
{0, 1261, EIF_FALSE, 0, 0},
{0, 1262, EIF_FALSE, 0, 0},
{0, 1263, EIF_FALSE, 0, 0},
{0, 1264, EIF_FALSE, 0, 0},
{0, 1265, EIF_FALSE, 0, 0},
{0, 1266, EIF_FALSE, 0, 0},
{0, 1267, EIF_FALSE, 0, 0},
{0, 1268, EIF_FALSE, 0, 0},
{0, 1269, EIF_FALSE, 0, 0},
{0, 1270, EIF_FALSE, 0, 0},
{0, 1271, EIF_FALSE, 0, 0},
{0, 1272, EIF_FALSE, 0, 0},
{0, 1273, EIF_FALSE, 0, 0},
{0, 1274, EIF_FALSE, 0, 0},
{0, 1275, EIF_FALSE, 0, 0},
{0, 1276, EIF_FALSE, 0, 0},
{0, 1277, EIF_FALSE, 0, 0},
{0, 1278, EIF_FALSE, 0, 0},
{0, 1279, EIF_FALSE, 0, 0},
{0, 1280, EIF_FALSE, 0, 0},
{0, 1281, EIF_FALSE, 0, 0},
{0, 1282, EIF_FALSE, 0, 0},
{0, 1283, EIF_FALSE, 0, 0},
{0, 1284, EIF_FALSE, 0, 0},
{0, 1285, EIF_FALSE, 0, 0},
{0, 1286, EIF_FALSE, 0, 0},
{0, 1287, EIF_FALSE, 0, 0},
{0, 1288, EIF_FALSE, 0, 0},
{0, 1289, EIF_FALSE, 0, 0},
{0, 1290, EIF_FALSE, 0, 0},
{0, 1291, EIF_FALSE, 0, 0},
{0, 1292, EIF_FALSE, 0, 0},
{0, 1293, EIF_FALSE, 0, 0},
{0, 1294, EIF_FALSE, 0, 0},
{0, 1295, EIF_FALSE, 0, 0},
{0, 1296, EIF_FALSE, 0, 0},
{0, 1297, EIF_FALSE, 0, 0},
{0, 1298, EIF_FALSE, 0, 0},
{0, 1299, EIF_FALSE, 0, 0},
{0, 1300, EIF_FALSE, 0, 0},
{0, 1301, EIF_FALSE, 0, 0},
{0, 1302, EIF_FALSE, 0, 0},
{0, 1303, EIF_FALSE, 0, 0},
{0, 1304, EIF_FALSE, 0, 0},
{0, 1305, EIF_FALSE, 0, 0},
{0, 1306, EIF_TRUE, 0, 0},
{0, 1307, EIF_FALSE, 0, 0},
{0, 1308, EIF_FALSE, 0, 0},
{0, 1309, EIF_FALSE, 0, 0},
{0, 1310, EIF_FALSE, 0, 0},
{0, 1311, EIF_FALSE, 0, 0},
{0, 1312, EIF_FALSE, 0, 0},
{0, 1313, EIF_FALSE, 0, 0},
{0, 1314, EIF_TRUE, 0, 0},
{0, 1315, EIF_FALSE, 0, 0},
{0, 1316, EIF_FALSE, 0, 0},
{0, 1317, EIF_FALSE, 0, 0},
{0, 1318, EIF_FALSE, 0, 0},
{0, 1319, EIF_FALSE, 0, 0},
{0, 1320, EIF_TRUE, 0, 0},
{0, 1321, EIF_FALSE, 0, 0},
{0, 1322, EIF_FALSE, 0, 0},
{0, 1323, EIF_FALSE, 0, 0},
{0, 1324, EIF_FALSE, 0, 0},
{0, 1325, EIF_FALSE, 0, 0},
{0, 1326, EIF_FALSE, 0, 0},
{0, 1327, EIF_FALSE, 0, 0},
{0, 1328, EIF_FALSE, 0, 0},
{0, 1329, EIF_FALSE, 0, 0},
{0, 1330, EIF_FALSE, 0, 0},
{0, 1331, EIF_FALSE, 0, 0},
{0, 1332, EIF_FALSE, 0, 0},
{0, 1333, EIF_FALSE, 0, 0},
{0, 1334, EIF_FALSE, 0, 0},
{0, 1335, EIF_FALSE, 0, 0},
{0, 1336, EIF_FALSE, 0, 0},
{0, 1337, EIF_TRUE, 0, 0},
{0, 1338, EIF_FALSE, 0, 0},
{0, 1339, EIF_FALSE, 0, 0},
{0, 1340, EIF_FALSE, 0, 0},
{0, 1341, EIF_FALSE, 0, 0},
{0, 1342, EIF_FALSE, 0, 0},
{0, 1343, EIF_TRUE, 0, 0},
{0, 1344, EIF_FALSE, 0, 0},
{0, 1345, EIF_FALSE, 0, 0},
{0, 1346, EIF_FALSE, 0, 0},
{0, 1347, EIF_FALSE, 0, 0},
{0, 1348, EIF_FALSE, 0, 0},
{0, 1349, EIF_FALSE, 0, 0},
{0, 1350, EIF_FALSE, 0, 0},
{0, 1351, EIF_FALSE, 0, 0},
{0, 1352, EIF_FALSE, 0, 0},
{0, 1353, EIF_FALSE, 0, 0},
{0, 1354, EIF_FALSE, 0, 0},
{0, 1355, EIF_TRUE, 0, 0},
{0, 1356, EIF_FALSE, 0, 0},
{0, 1357, EIF_FALSE, 0, 0},
{0, 1358, EIF_TRUE, 0, 0},
{0, 1359, EIF_FALSE, 0, 0},
{0, 1360, EIF_FALSE, 0, 0},
{0, 1361, EIF_FALSE, 0, 0},
{0, 1362, EIF_FALSE, 0, 0},
{0, 1363, EIF_TRUE, 0, 0},
{0, 1364, EIF_TRUE, 0, 0},
{0, 1365, EIF_FALSE, 0, 0},
{0, 1366, EIF_FALSE, 0, 0},
{0, 1367, EIF_FALSE, 0, 0},
{0, 1368, EIF_TRUE, 0, 0},
{0, 1369, EIF_FALSE, 0, 0},
{0, 1370, EIF_TRUE, 0, 0},
{0, 1371, EIF_FALSE, 0, 0},
{0, 1372, EIF_FALSE, 0, 0},
{0, 1373, EIF_FALSE, 0, 0},
{0, 1374, EIF_FALSE, 0, 0},
{0, 1375, EIF_FALSE, 0, 0},
{0, 1376, EIF_FALSE, 0, 0},
{0, 1377, EIF_FALSE, 0, 0},
{0, 1378, EIF_FALSE, 0, 0},
{0, 1379, EIF_FALSE, 0, 0},
{0, 1380, EIF_FALSE, 0, 0},
{0, 1381, EIF_FALSE, 0, 0},
{0, 1382, EIF_FALSE, 0, 0},
{0, 1383, EIF_FALSE, 0, 0},
{0, 1384, EIF_FALSE, 0, 0},
{0, 1385, EIF_FALSE, 0, 0},
{0, 1386, EIF_FALSE, 0, 0},
{0, 1387, EIF_FALSE, 0, 0},
{0, 1388, EIF_FALSE, 0, 0},
{0, 1389, EIF_FALSE, 0, 0},
{0, 1390, EIF_FALSE, 0, 0},
{0, 1391, EIF_FALSE, 0, 0},
{0, 1392, EIF_FALSE, 0, 0},
{0, 1393, EIF_FALSE, 0, 0},
{0, 1394, EIF_FALSE, 0, 0},
{0, 1395, EIF_FALSE, 0, 0},
{0, 1396, EIF_FALSE, 0, 0},
{0, 1397, EIF_FALSE, 0, 0},
{0, 1398, EIF_FALSE, 0, 0},
{0, 1399, EIF_FALSE, 0, 0},
{0, 1400, EIF_FALSE, 0, 0},
{0, 1401, EIF_FALSE, 0, 0},
{0, 1402, EIF_FALSE, 0, 0},
{0, 1403, EIF_FALSE, 0, 0},
{0, 1404, EIF_FALSE, 0, 0},
{0, 1405, EIF_FALSE, 0, 0},
{0, 1406, EIF_FALSE, 0, 0},
{0, 1407, EIF_FALSE, 0, 0},
{0, 1408, EIF_FALSE, 0, 0},
{0, 1409, EIF_FALSE, 0, 0},
{0, 1410, EIF_FALSE, 0, 0},
{0, 1411, EIF_FALSE, 0, 0},
{0, 1412, EIF_FALSE, 0, 0},
{0, 1413, EIF_FALSE, 0, 0},
{0, 1414, EIF_FALSE, 0, 0},
{0, 1415, EIF_FALSE, 0, 0},
{0, 1416, EIF_FALSE, 0, 0},
{0, 1417, EIF_FALSE, 0, 0},
{0, 1418, EIF_FALSE, 0, 0},
{0, 1419, EIF_FALSE, 0, 0},
{0, 1420, EIF_FALSE, 0, 0},
{0, 1421, EIF_FALSE, 0, 0},
{0, 1422, EIF_FALSE, 0, 0},
{0, 1423, EIF_FALSE, 0, 0},
{0, 1424, EIF_FALSE, 0, 0},
{0, 1425, EIF_FALSE, 0, 0},
{0, 1426, EIF_FALSE, 0, 0},
{0, 1427, EIF_FALSE, 0, 0},
{0, 1428, EIF_FALSE, 0, 0},
{0, 1429, EIF_FALSE, 0, 0},
{0, 1430, EIF_FALSE, 0, 0},
{0, 1431, EIF_FALSE, 0, 0},
{0, 1432, EIF_FALSE, 0, 0},
{0, 1433, EIF_FALSE, 0, 0},
{0, 1434, EIF_TRUE, 0, 0},
{0, 1435, EIF_TRUE, 0, 0},
{0, 1436, EIF_FALSE, 0, 0},
{0, 1437, EIF_FALSE, 0, 0},
{0, 1438, EIF_FALSE, 0, 0},
{0, 1439, EIF_FALSE, 0, 0},
{0, 1440, EIF_FALSE, 0, 0},
{0, 1441, EIF_FALSE, 0, 0},
{0, 1442, EIF_FALSE, 0, 0},
{0, 1443, EIF_FALSE, 0, 0},
{0, 1444, EIF_FALSE, 0, 0},
{0, 1445, EIF_FALSE, 0, 0},
{0, 1446, EIF_FALSE, 0, 0},
{0, 1447, EIF_FALSE, 0, 0},
{0, 1448, EIF_FALSE, 0, 0},
{0, 1449, EIF_FALSE, 0, 0},
{0, 1450, EIF_FALSE, 0, 0},
{0, 1451, EIF_FALSE, 0, 0},
{0, 1452, EIF_FALSE, 0, 0},
{0, 1453, EIF_FALSE, 0, 0},
{0, 1454, EIF_TRUE, 0, 0},
{0, 1455, EIF_FALSE, 0, 0},
{0, 1456, EIF_FALSE, 0, 0},
{0, 1457, EIF_FALSE, 0, 0},
{0, 1458, EIF_FALSE, 0, 0},
{0, 1459, EIF_FALSE, 0, 0},
{0, 1460, EIF_FALSE, 0, 0},
{0, 1461, EIF_FALSE, 0, 0},
{0, 1462, EIF_TRUE, 0, 0},
{0, 1463, EIF_FALSE, 0, 0},
{0, 1464, EIF_FALSE, 0, 0},
{0, 1465, EIF_TRUE, 0, 0},
{0, 1466, EIF_FALSE, 0, 0},
{0, 1467, EIF_FALSE, 0, 0},
{0, 1468, EIF_FALSE, 0, 0},
{0, 1469, EIF_FALSE, 0, 0},
{0, 1470, EIF_FALSE, 0, 0},
{0, 1471, EIF_TRUE, 0, 0},
{0, 1472, EIF_FALSE, 0, 0},
{0, 1473, EIF_TRUE, 0, 0},
{0, 1474, EIF_FALSE, 0, 0},
{0, 1475, EIF_TRUE, 0, 0},
{0, 1476, EIF_FALSE, 0, 0},
{0, 1477, EIF_FALSE, 0, 0},
{0, 1478, EIF_FALSE, 0, 0},
{0, 1479, EIF_FALSE, 0, 0},
{0, 1480, EIF_FALSE, 0, 0},
{0, 1481, EIF_FALSE, 0, 0},
{0, 1482, EIF_FALSE, 0, 0},
{0, 1483, EIF_FALSE, 0, 0},
{0, 1484, EIF_FALSE, 0, 0},
{0, 1485, EIF_TRUE, 0, 0},
{0, 1486, EIF_FALSE, 0, 0},
{0, 1487, EIF_FALSE, 0, 0},
{0, 1488, EIF_FALSE, 0, 0},
{0, 1489, EIF_FALSE, 0, 0},
{0, 1490, EIF_FALSE, 0, 0},
{0, 1491, EIF_FALSE, 0, 0},
{0, 1492, EIF_TRUE, 0, 0},
{0, 1493, EIF_FALSE, 0, 0},
{0, 1494, EIF_FALSE, 0, 0},
{0, 1495, EIF_FALSE, 0, 0},
{0, 1496, EIF_FALSE, 0, 0},
{0, 1497, EIF_TRUE, 0, 0},
{0, 1498, EIF_FALSE, 0, 0},
{0, 1499, EIF_FALSE, 0, 0},
{0, 1500, EIF_FALSE, 0, 0},
{0, 1501, EIF_FALSE, 0, 0},
{0, 1502, EIF_FALSE, 0, 0},
{0, 1503, EIF_FALSE, 0, 0},
{0, 1504, EIF_FALSE, 0, 0},
{0, 1505, EIF_FALSE, 0, 0},
{0, 1506, EIF_FALSE, 0, 0},
{0, 1507, EIF_FALSE, 0, 0},
{0, 1508, EIF_FALSE, 0, 0},
{0, 1509, EIF_FALSE, 0, 0},
{0, 1510, EIF_FALSE, 0, 0},
{0, 1511, EIF_FALSE, 0, 0},
{0, 1512, EIF_FALSE, 0, 0},
{0, 1513, EIF_FALSE, 0, 0},
{0, 1514, EIF_FALSE, 0, 0},
{0, 1515, EIF_FALSE, 0, 0},
{0, 1516, EIF_FALSE, 0, 0},
{0, 1517, EIF_FALSE, 0, 0},
{0, 1518, EIF_FALSE, 0, 0},
{0, 1519, EIF_FALSE, 0, 0},
{0, 1520, EIF_FALSE, 0, 0},
{0, 1521, EIF_FALSE, 0, 0},
{0, 1522, EIF_FALSE, 0, 0},
{0, 1523, EIF_FALSE, 0, 0},
{0, 1524, EIF_FALSE, 0, 0},
{0, 1525, EIF_FALSE, 0, 0},
{0, 1526, EIF_FALSE, 0, 0},
{0, 1527, EIF_TRUE, 0, 0},
{0, 1528, EIF_FALSE, 0, 0},
{0, 1529, EIF_TRUE, 0, 0},
{0, 1530, EIF_FALSE, 0, 0},
{0, 1531, EIF_FALSE, 0, 0},
{0, 1532, EIF_FALSE, 0, 0},
{0, 1533, EIF_FALSE, 0, 0},
{0, 1534, EIF_FALSE, 0, 0},
{0, 1535, EIF_FALSE, 0, 0},
{0, 1536, EIF_FALSE, 0, 0},
{0, 1537, EIF_FALSE, 0, 0},
{0, 1538, EIF_FALSE, 0, 0},
{0, 1539, EIF_FALSE, 0, 0},
{0, 1540, EIF_FALSE, 0, 0},
{0, 1541, EIF_FALSE, 0, 0},
{0, 1542, EIF_FALSE, 0, 0},
{0, 1543, EIF_FALSE, 0, 0},
{0, 1544, EIF_FALSE, 0, 0},
{0, 1545, EIF_FALSE, 0, 0},
{0, 1546, EIF_FALSE, 0, 0},
{0, 1547, EIF_FALSE, 0, 0},
{0, 1548, EIF_FALSE, 0, 0},
{0, 1549, EIF_FALSE, 0, 0},
{0, 1550, EIF_FALSE, 0, 0},
{0, 1551, EIF_FALSE, 0, 0},
{0, 1552, EIF_FALSE, 0, 0},
{0, 1553, EIF_FALSE, 0, 0},
{0, 1554, EIF_FALSE, 0, 0},
{0, 1555, EIF_FALSE, 0, 0},
{0, 1556, EIF_FALSE, 0, 0},
{0, 1557, EIF_FALSE, 0, 0},
{0, 1558, EIF_FALSE, 0, 0},
{0, 1559, EIF_FALSE, 0, 0},
{0, 1560, EIF_FALSE, 0, 0},
{0, 1561, EIF_FALSE, 0, 0},
{0, 1562, EIF_FALSE, 0, 0},
{0, 1563, EIF_FALSE, 0, 0},
{0, 1564, EIF_FALSE, 0, 0},
{0, 1565, EIF_FALSE, 0, 0},
{0, 1566, EIF_FALSE, 0, 0},
{0, 1567, EIF_FALSE, 0, 0},
{0, 1568, EIF_FALSE, 0, 0},
{0, 1569, EIF_FALSE, 0, 0},
{0, 1570, EIF_FALSE, 0, 0},
{0, 1571, EIF_FALSE, 0, 0},
{0, 1572, EIF_FALSE, 0, 0},
{0, 1573, EIF_FALSE, 0, 0},
{0, 1574, EIF_FALSE, 0, 0},
{0, 1575, EIF_FALSE, 0, 0},
{0, 1576, EIF_FALSE, 0, 0},
{0, 1577, EIF_FALSE, 0, 0},
{0, 1578, EIF_FALSE, 0, 0},
{0, 1579, EIF_FALSE, 0, 0},
{0, 1580, EIF_FALSE, 0, 0},
{0, 1581, EIF_FALSE, 0, 0},
{0, 1582, EIF_FALSE, 0, 0},
{0, 1583, EIF_FALSE, 0, 0},
{0, 1584, EIF_FALSE, 0, 0},
{0, 1585, EIF_FALSE, 0, 0},
{0, 1586, EIF_FALSE, 0, 0},
{0, 1587, EIF_FALSE, 0, 0},
{0, 1588, EIF_FALSE, 0, 0},
{0, 1589, EIF_FALSE, 0, 0},
{0, 1590, EIF_FALSE, 0, 0},
{0, 1591, EIF_FALSE, 0, 0},
{0, 1592, EIF_FALSE, 0, 0},
{0, 1593, EIF_FALSE, 0, 0},
{0, 1594, EIF_FALSE, 0, 0},
{0, 1595, EIF_FALSE, 0, 0},
{0, 1596, EIF_FALSE, 0, 0},
{0, 1597, EIF_FALSE, 0, 0},
{0, 1598, EIF_FALSE, 0, 0},
{0, 1599, EIF_FALSE, 0, 0},
{0, 1600, EIF_FALSE, 0, 0},
{0, 1601, EIF_TRUE, 0, 0},
{0, 1602, EIF_FALSE, 0, 0},
{0, 1603, EIF_FALSE, 0, 0},
{0, 1604, EIF_TRUE, 0, 0},
{0, 1605, EIF_TRUE, 0, 0},
{0, 1606, EIF_FALSE, 0, 0},
{0, 1607, EIF_FALSE, 0, 0},
{0, 1608, EIF_TRUE, 0, 0},
{0, 1609, EIF_FALSE, 0, 0},
{0, 1610, EIF_FALSE, 0, 0},
{0, 1611, EIF_TRUE, 0, 0},
{0, 1612, EIF_FALSE, 0, 0},
{0, 1613, EIF_FALSE, 0, 0},
{0, 1614, EIF_FALSE, 0, 0},
{0, 1615, EIF_TRUE, 0, 0},
{0, 1616, EIF_FALSE, 0, 0},
{0, 1617, EIF_FALSE, 0, 0},
{0, 1618, EIF_TRUE, 0, 0},
{0, 1619, EIF_FALSE, 0, 0},
{0, 1620, EIF_FALSE, 0, 0},
{0, 1621, EIF_TRUE, 0, 0},
{0, 1622, EIF_FALSE, 0, 0},
{0, 1623, EIF_FALSE, 0, 0},
{0, 1624, EIF_TRUE, 0, 0},
{0, 1625, EIF_FALSE, 0, 0},
{0, 1626, EIF_FALSE, 0, 0},
{0, 1627, EIF_TRUE, 0, 0},
{0, 1628, EIF_FALSE, 0, 0},
{0, 1629, EIF_FALSE, 0, 0},
{0, 1630, EIF_TRUE, 0, 0},
{0, 1631, EIF_FALSE, 0, 0},
{0, 1632, EIF_FALSE, 0, 0},
{0, 1633, EIF_FALSE, 0, 0},
{0, 1634, EIF_FALSE, 0, 0},
{0, 1635, EIF_FALSE, 0, 0},
{0, 1636, EIF_FALSE, 0, 0},
{0, 1637, EIF_TRUE, 0, 0},
{0, 1638, EIF_FALSE, 0, 0},
{0, 1639, EIF_FALSE, 0, 0},
{0, 1640, EIF_FALSE, 0, 0},
{0, 1641, EIF_FALSE, 0, 0},
{0, 1642, EIF_FALSE, 0, 0},
{0, 1643, EIF_FALSE, 0, 0},
{0, 1644, EIF_FALSE, 0, 0},
{0, 1645, EIF_FALSE, 0, 0},
{0, 1646, EIF_TRUE, 0, 0},
{0, 1647, EIF_FALSE, 0, 0},
{0, 1648, EIF_FALSE, 0, 0},
{0, 1649, EIF_FALSE, 0, 0},
{0, 1650, EIF_FALSE, 0, 0},
{0, 1651, EIF_TRUE, 0, 0},
{0, 1652, EIF_FALSE, 0, 0},
{0, 1653, EIF_FALSE, 0, 0},
{0, 1654, EIF_FALSE, 0, 0},
{0, 1655, EIF_FALSE, 0, 0},
{0, 1656, EIF_FALSE, 0, 0},
{0, 1657, EIF_FALSE, 0, 0},
{0, 1658, EIF_FALSE, 0, 0},
{0, 1659, EIF_FALSE, 0, 0},
{0, 1660, EIF_TRUE, 0, 0},
{0, 1661, EIF_FALSE, 0, 0},
{0, 1662, EIF_FALSE, 0, 0},
{0, 1663, EIF_FALSE, 0, 0},
{0, 1664, EIF_FALSE, 0, 0},
{0, 1665, EIF_FALSE, 0, 0},
{0, 1666, EIF_TRUE, 0, 0},
{0, 1667, EIF_FALSE, 0, 0},
{0, 1668, EIF_TRUE, 0, 0},
{0, 1669, EIF_FALSE, 0, 0},
{0, 1670, EIF_FALSE, 0, 0},
{0, 1671, EIF_TRUE, 0, 0},
{0, 1672, EIF_FALSE, 0, 0},
{0, 1673, EIF_FALSE, 0, 0},
{0, 1674, EIF_FALSE, 0, 0},
{0, 1675, EIF_FALSE, 0, 0},
{0, 1676, EIF_FALSE, 0, 0},
{0, 1677, EIF_FALSE, 0, 0},
{0, 1678, EIF_FALSE, 0, 0},
{0, 1679, EIF_FALSE, 0, 0},
{0, 1680, EIF_FALSE, 0, 0},
{0, 1681, EIF_FALSE, 0, 0},
{0, 1682, EIF_FALSE, 0, 0},
{0, 1683, EIF_FALSE, 0, 0},
{0, 1684, EIF_FALSE, 0, 0},
{0, 1685, EIF_FALSE, 0, 0},
{0, 1686, EIF_FALSE, 0, 0},
{0, 1687, EIF_FALSE, 0, 0},
{0, 1688, EIF_FALSE, 0, 0},
{0, 1689, EIF_FALSE, 0, 0},
{0, 1690, EIF_FALSE, 0, 0},
{0, 1691, EIF_FALSE, 0, 0},
{0, 1692, EIF_TRUE, 0, 0},
{0, 1693, EIF_FALSE, 0, 0},
{0, 1694, EIF_FALSE, 0, 0},
{0, 1695, EIF_FALSE, 0, 0},
{0, 1696, EIF_FALSE, 0, 0},
{0, 1697, EIF_FALSE, 0, 0},
{0, 1698, EIF_FALSE, 0, 0},
{0, 1699, EIF_FALSE, 0, 0},
{0, 1700, EIF_FALSE, 0, 0},
{0, 1701, EIF_FALSE, 0, 0},
{0, 1702, EIF_FALSE, 0, 0},
{0, 1703, EIF_FALSE, 0, 0},
{0, 1704, EIF_FALSE, 0, 0},
{0, 1705, EIF_FALSE, 0, 0},
{0, 1706, EIF_FALSE, 0, 0},
{0, 1707, EIF_FALSE, 0, 0},
{0, 1708, EIF_FALSE, 0, 0},
{0, 1709, EIF_FALSE, 0, 0},
{0, 1710, EIF_FALSE, 0, 0},
{0, 1711, EIF_FALSE, 0, 0},
{0, 1712, EIF_FALSE, 0, 0},
{0, 1713, EIF_FALSE, 0, 0},
{0, 1714, EIF_FALSE, 0, 0},
{0, 1715, EIF_FALSE, 0, 0},
{0, 1716, EIF_FALSE, 0, 0},
{0, 1717, EIF_FALSE, 0, 0},
{0, 1718, EIF_FALSE, 0, 0},
{0, 1719, EIF_FALSE, 0, 0},
{0, 1720, EIF_FALSE, 0, 0},
{0, 1721, EIF_FALSE, 0, 0},
{0, 1722, EIF_TRUE, 0, 0},
{0, 1723, EIF_FALSE, 0, 0},
{0, 1724, EIF_FALSE, 0, 0},
{0, 1725, EIF_FALSE, 0, 0},
{0, 1726, EIF_FALSE, 0, 0},
{0, 1727, EIF_FALSE, 0, 0},
{0, 1728, EIF_FALSE, 0, 0},
{0, 1729, EIF_FALSE, 0, 0},
{0, 1730, EIF_FALSE, 0, 0},
{0, 1731, EIF_TRUE, 0, 0},
{0, 1732, EIF_FALSE, 0, 0},
{0, 1733, EIF_FALSE, 0, 0},
{0, 1734, EIF_TRUE, 0, 0},
{0, 1735, EIF_FALSE, 0, 0},
{0, 1736, EIF_FALSE, 0, 0},
{0, 1737, EIF_FALSE, 0, 0},
{0, 1738, EIF_FALSE, 0, 0},
{0, 1739, EIF_FALSE, 0, 0},
{0, 1740, EIF_FALSE, 0, 0},
{0, 1741, EIF_FALSE, 0, 0},
{0, 1742, EIF_FALSE, 0, 0},
{0, 1743, EIF_FALSE, 0, 0},
{0, 1744, EIF_FALSE, 0, 0},
{0, 1745, EIF_FALSE, 0, 0},
{0, 1746, EIF_TRUE, 0, 0},
{0, 1747, EIF_FALSE, 0, 0},
{0, 1748, EIF_FALSE, 0, 0},
{0, 1749, EIF_FALSE, 0, 0},
{0, 1750, EIF_FALSE, 0, 0},
{0, 1751, EIF_FALSE, 0, 0},
{0, 1752, EIF_FALSE, 0, 0},
{0, 1753, EIF_FALSE, 0, 0},
{0, 1754, EIF_FALSE, 0, 0},
{0, 1755, EIF_FALSE, 0, 0},
{0, 1756, EIF_FALSE, 0, 0},
{0, 1757, EIF_FALSE, 0, 0},
{0, 1758, EIF_FALSE, 0, 0},
{0, 1759, EIF_FALSE, 0, 0},
{0, 1760, EIF_FALSE, 0, 0},
{0, 1761, EIF_FALSE, 0, 0},
{0, 1762, EIF_FALSE, 0, 0},
{0, 1763, EIF_FALSE, 0, 0},
{0, 1764, EIF_FALSE, 0, 0},
{0, 1765, EIF_FALSE, 0, 0},
{0, 1766, EIF_FALSE, 0, 0},
{0, 1767, EIF_FALSE, 0, 0},
{0, 1768, EIF_FALSE, 0, 0},
{0, 1769, EIF_FALSE, 0, 0},
{0, 1770, EIF_FALSE, 0, 0},
{0, 1771, EIF_FALSE, 0, 0},
{0, 1772, EIF_FALSE, 0, 0},
{0, 1773, EIF_FALSE, 0, 0},
{0, 1774, EIF_FALSE, 0, 0},
{0, 1775, EIF_FALSE, 0, 0},
{0, 1776, EIF_FALSE, 0, 0},
{0, 1777, EIF_FALSE, 0, 0},
{0, 1778, EIF_FALSE, 0, 0},
{0, 1779, EIF_FALSE, 0, 0},
{0, 1780, EIF_FALSE, 0, 0},
{0, 1781, EIF_FALSE, 0, 0},
{0, 1782, EIF_FALSE, 0, 0},
{0, 1783, EIF_FALSE, 0, 0},
{0, 1784, EIF_FALSE, 0, 0},
{0, 1785, EIF_FALSE, 0, 0},
{0, 1786, EIF_FALSE, 0, 0},
{0, 1787, EIF_FALSE, 0, 0},
{0, 1788, EIF_FALSE, 0, 0},
{0, 1789, EIF_FALSE, 0, 0},
{0, 1790, EIF_FALSE, 0, 0},
{0, 1791, EIF_FALSE, 0, 0},
{0, 1792, EIF_FALSE, 0, 0},
{0, 1793, EIF_FALSE, 0, 0},
{0, 1794, EIF_FALSE, 0, 0},
{0, 1795, EIF_FALSE, 0, 0},
{0, 1796, EIF_FALSE, 0, 0},
{0, 1797, EIF_FALSE, 0, 0},
{0, 1798, EIF_FALSE, 0, 0},
{0, 1799, EIF_FALSE, 0, 0},
{0, 1800, EIF_FALSE, 0, 0},
{0, 1801, EIF_FALSE, 0, 0},
{0, 1802, EIF_FALSE, 0, 0},
{0, 1803, EIF_FALSE, 0, 0},
{0, 1804, EIF_FALSE, 0, 0},
{0, 1805, EIF_FALSE, 0, 0},
{0, 1806, EIF_FALSE, 0, 0},
{0, 1807, EIF_FALSE, 0, 0},
{0, 1808, EIF_FALSE, 0, 0},
{0, 1809, EIF_FALSE, 0, 0},
{0, 1810, EIF_FALSE, 0, 0},
{0, 1811, EIF_FALSE, 0, 0},
{0, 1812, EIF_FALSE, 0, 0},
{0, 1813, EIF_FALSE, 0, 0},
{0, 1814, EIF_TRUE, 0, 0},
{0, 1815, EIF_FALSE, 0, 0},
{0, 1816, EIF_FALSE, 0, 0},
{0, 1817, EIF_FALSE, 0, 0},
{0, 1818, EIF_FALSE, 0, 0},
{0, 1819, EIF_FALSE, 0, 0},
{0, 1820, EIF_FALSE, 0, 0},
{0, 1821, EIF_FALSE, 0, 0},
{0, 1822, EIF_FALSE, 0, 0},
{0, 1823, EIF_FALSE, 0, 0},
{0, 1824, EIF_FALSE, 0, 0},
{0, 1825, EIF_TRUE, 0, 0},
{0, 1826, EIF_FALSE, 0, 0},
{0, 1827, EIF_FALSE, 0, 0},
{0, 1828, EIF_FALSE, 0, 0},
{0, 1829, EIF_FALSE, 0, 0},
{0, 1830, EIF_FALSE, 0, 0},
{0, 1831, EIF_FALSE, 0, 0},
{0, 1832, EIF_FALSE, 0, 0},
{0, 1833, EIF_TRUE, 0, 0},
{0, 1834, EIF_FALSE, 0, 0},
{0, 1835, EIF_FALSE, 0, 0},
{0, 1836, EIF_FALSE, 0, 0},
{0, 1837, EIF_FALSE, 0, 0},
{0, 1838, EIF_TRUE, 0, 0},
{0, 1839, EIF_FALSE, 0, 0},
{0, 1840, EIF_FALSE, 0, 0},
{0, 1841, EIF_FALSE, 0, 0},
{0, 1842, EIF_FALSE, 0, 0},
{0, 1843, EIF_FALSE, 0, 0},
{0, 1844, EIF_FALSE, 0, 0},
{0, 1845, EIF_FALSE, 0, 0},
{0, 1846, EIF_FALSE, 0, 0},
{0, 1847, EIF_FALSE, 0, 0},
{0, 1848, EIF_FALSE, 0, 0},
{0, 1849, EIF_FALSE, 0, 0},
{0, 1850, EIF_FALSE, 0, 0},
{0, 1851, EIF_FALSE, 0, 0},
{0, 1852, EIF_FALSE, 0, 0},
{0, 1853, EIF_FALSE, 0, 0},
{0, 1854, EIF_FALSE, 0, 0},
{0, 1855, EIF_FALSE, 0, 0},
{0, 1856, EIF_FALSE, 0, 0},
{0, 1857, EIF_FALSE, 0, 0},
{0, 1858, EIF_FALSE, 0, 0},
{0, 1859, EIF_FALSE, 0, 0},
{0, 1860, EIF_FALSE, 0, 0},
{0, 1861, EIF_FALSE, 0, 0},
{0, 1862, EIF_FALSE, 0, 0},
{0, 1863, EIF_FALSE, 0, 0},
{0, 1864, EIF_FALSE, 0, 0},
{0, 1865, EIF_FALSE, 0, 0},
{0, 1866, EIF_FALSE, 0, 0},
{0, 1867, EIF_FALSE, 0, 0},
{0, 1868, EIF_FALSE, 0, 0},
{0, 1869, EIF_FALSE, 0, 0},
{0, 1870, EIF_FALSE, 0, 0},
{0, 1871, EIF_TRUE, 0, 0},
{0, 1872, EIF_FALSE, 0, 0},
{0, 1873, EIF_FALSE, 0, 0},
{0, 1874, EIF_TRUE, 0, 0},
{0, 1875, EIF_FALSE, 0, 0},
{0, 1876, EIF_FALSE, 0, 0},
{0, 1877, EIF_FALSE, 0, 0},
{0, 1878, EIF_FALSE, 0, 0},
{0, 1879, EIF_FALSE, 0, 0},
{0, 1880, EIF_FALSE, 0, 0},
{0, 1881, EIF_FALSE, 0, 0},
{0, 1882, EIF_FALSE, 0, 0},
{0, 1883, EIF_FALSE, 0, 0},
{0, 1884, EIF_FALSE, 0, 0},
{0, 1885, EIF_FALSE, 0, 0},
{0, 1886, EIF_FALSE, 0, 0}
};

int GE_main(int argc, EIF_NATIVE_CHAR** argv)
{
	T0* t1;
	GE_argc = argc;
	GE_argv = argv;
	GE_last_rescue = 0;
	GE_init_gc();
	GE_exception_manager = GE_new19(EIF_TRUE);
	GE_set_exception_data = &T19f12;
	GE_init_identified();
	GE_const_init();
#ifdef EIF_WINDOWS
	eif_hInstance = GetModuleHandle(NULL);
#endif
	t1 = T22c42();
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

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS
#include <winbase.h>
#endif

/*
	Context of last feature entered containing a rescue clause.
	Warning: this is not thread-safe.
*/
GE_rescue* GE_last_rescue;

/*
	Exception manager.
	Can be used from any thread.
*/
EIF_REFERENCE GE_exception_manager;

/*
	Pointer to Eiffel routine EXCEPTION_MANAGER.set_exception_data
*/
void (*GE_set_exception_data)(EIF_REFERENCE, EIF_INTEGER_32, EIF_BOOLEAN, EIF_INTEGER_32, EIF_INTEGER_32, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_INTEGER_32, EIF_BOOLEAN);

/*
	Jump to execute the rescue of the last routine with a rescue
	in the call stack.
*/
static void GE_jump_to_last_rescue()
{
	GE_rescue* r = GE_last_rescue;
	if (r != 0) {
		GE_last_rescue = r->previous;
		GE_longjmp(r->jb, 1);
	}
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "Unhandled exception\n");
	exit(1);
}

/*
	Call feature EXCEPTION_MANAGER.set_exception_data.
*/
static void GE_call_set_exception_data(long code, int new_obj, int signal_code, int error_code, const char *tag, char *recipient, char *eclass, char *rf_routine, char *rf_class, char *trace, int line_number, int is_invariant_entry)
{
	EIF_REFERENCE l_tag;
	EIF_REFERENCE l_recipient;
	EIF_REFERENCE l_eclass;
	EIF_REFERENCE l_rf_routine;
	EIF_REFERENCE l_rf_class;
	EIF_REFERENCE l_trace;

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
	if (trace) {
		l_trace = GE_str8(trace);
	} else {
		l_trace = GE_ms8("", 0);
	}
	GE_set_exception_data(
#ifdef EIF_EXCEPTION_TRACE
		0,
#endif
		GE_exception_manager, (EIF_INTEGER_32) code, EIF_TEST(new_obj), (EIF_INTEGER_32) signal_code, (EIF_INTEGER_32) error_code, l_tag, l_recipient, l_eclass, l_rf_routine, l_rf_class, l_trace, (EIF_INTEGER_32) line_number, EIF_TEST(is_invariant_entry));
}

/*
	Raise an exception with code 'code'.
*/
void GE_raise(long code)
{
	GE_call_set_exception_data(code, 1, -1, -1, NULL, NULL, NULL, NULL, NULL, NULL, -1, 0);
	GE_jump_to_last_rescue();
}

/*
	Raise an exception with code 'code' and message 'msg'.
*/
void GE_raise_with_message(long code, const char *msg)
{
	GE_call_set_exception_data(code, 1, -1, -1, msg, NULL, NULL, NULL, NULL, NULL, -1, 0);
	GE_jump_to_last_rescue();
}

/*
	Raise an exception from EXCEPTION_MANAGER.
*/
void GE_developer_raise(long code, char *meaning, char *message)
{
	GE_call_set_exception_data(code, 0, -1, -1, message, NULL, NULL, NULL, NULL, NULL, -1, 0);
	GE_jump_to_last_rescue();
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
					GE_raise(GE_EX_PROG);
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
		GE_raise(GE_EX_VOID);
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
	Set default exception handler.
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
#ifdef EIF_WINDOWS
	GE_set_windows_exception_filter();
#endif
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
	((GE_types[((EIF_REFERENCE)C)->id]).dispose)(
#ifdef EIF_EXCEPTION_TRACE
		0,
#endif
		(EIF_REFERENCE)C);
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

#ifdef __cplusplus
extern "C" {
#endif

/*
	Pre-defined exception tags. No restriction on size.
	This is a duplication from Eiffel classes, but still used for trace printing and in EiffelCom.
*/
static char *ex_tag[] = {
	(char *) 0,							/* Nothing */
	"Feature call on void target.",		/* EN_VOID */
	"No more memory.",					/* EN_MEM */
	"Precondition violated.",			/* EN_PRE */
	"Postcondition violated.",			/* EN_POST */
	"Floating point exception.",		/* EN_FLOAT */
	"Class invariant violated.",		/* EN_CINV */
	"Assertion violated.",				/* EN_CHECK */
	"Routine failure.",					/* EN_FAIL */
	"Unmatched inspect value.",			/* EN_WHEN */
	"Non-decreasing loop variant or negative value reached.",		/* EN_VAR */
	"Loop invariant violated.",			/* EN_LINV */
	"Operating system signal.",			/* EN_SIG */
	"Eiffel run-time panic.",			/* EN_BYE */
	"Exception in rescue clause.",		/* EN_RESC */
	"Out of memory.",					/* EN_OMEM */
	"Resumption attempt failed.",		/* EN_RES */
	"Create on deferred.",				/* EN_CDEF */
	"External event.",					/* EN_EXT */
	"Void assigned to expanded.",		/* EN_VEXP */
	"Exception in signal handler.",		/* EN_HDLR */
	"I/O error.",						/* EN_IO */
	"Operating system error.",			/* EN_SYS */
	"Retrieval error.",					/* EN_RETR */
	"Developer exception.",				/* EN_PROG */
	"Eiffel run-time fatal error.",		/* EN_FATAL */
	"CECIL cannot call melted code",	/* EN_DOL */
	"Runtime I/O error.",				/* EN_ISE_IO */
	"COM error.",						/* EN_COM */
	"Runtime check violated.",			/* EN_RT_CHECK */
	"Old expression evaluation failed.",/* EN_OLD */
	"Serialization failed."				/* EN_SEL */
	"SCOOP processor dirty."			/* EN_DIRTY */
};

/*
	Raise an Eiffel exception.
*/
void eraise(const char *name, long code)
{
	GE_raise_with_message(code, name);
}

/*
	Raise an Eiffel exception of the given code with no associated tag.
 */
void xraise(int code)
{
	GE_raise((long)code);
}

/*
	Raise an "Operating system error" exception.
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
	As a special case, an I/O error is raised when a system call which is I/O bound fails.
*/
void eise_io(const char *tag)
{
	GE_raise_with_message(GE_EX_ISE_IO, tag);
}

/*
	Raise a "No more memory" exception.
*/
 void enomem(void) {
	GE_raise(GE_EX_OMEM);
 }

/*
	Raise EiffelCOM exception.
*/
void com_eraise(const char *tag, long num)
{
	GE_raise_with_message(num, tag);
}

/*
	Terminate execution with exit status 'code',
	without triggering an exception.
*/
void esdie(int code)
{
/* TODO: check that the Boehm GC triggers the 'dispose' routines. */
	exit(code);
}

/*
	Exception tag associated with 'code'.
	This is a duplication from Eiffel classes, but still used for trace printing and in EiffelCom.
*/
EIF_REFERENCE eename(long code)
{
	if (code < 0) {
		return GE_str8("User-defined exception.");
	} else if (code < 1 || code > EN_NEX) {
		return GE_str8("Unknown exception.");
	} else {
		return GE_str8(ex_tag[code]);
	}
}

/*
	Is exception `ex' defined?
	Used in EiffelCOM.
*/
char eedefined(long ex)
{
	return (char) ((ex > 0 && ex <= GE_EX_NEX)? 1 : 0);
}

/*
	Enable/diable printing of the history table.
	Per thead information.
*/
void eetrace(char b) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eetrace' in 'eif_except.h' not implemented\n");
}

/*
	Is current execution during rescue?
*/
EIF_BOOLEAN eif_is_in_rescue(void)
{
/* TODO */
	return EIF_FALSE;
}

#ifdef EIF_WINDOWS
/*
	Set default exception handler.
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
