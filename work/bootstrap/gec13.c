#include "gec.h"

#ifdef __cplusplus
extern "C" {
#endif

/* ET_FORMAL_PARAMETER.position */
T0* T791f47(T0* C)
{
	T1 t1;
	T0* R = 0;
	t1 = ((((T791*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		R = (T628f9(GE_void(((T791*)(C))->a3)));
	} else {
		R = (T129f51(GE_void(((T791*)(C))->a1)));
	}
	return R;
}

/* ET_TUPLE_TYPE.position */
T0* T185f46(T0* C)
{
	T0* R = 0;
	R = (T129f51(GE_void(((T185*)(C))->a4)));
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.same_named_type */
T1 T1183f18(T0* C, T0* a1, T0* a2, T0* a3)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	t1 = (T174x6642(GE_void(a3)));
	t2 = (T6f13(&(((T1183*)(C))->a1), t1));
	if (t2) {
		l1 = (T174x6638T6(GE_void(a3), ((T1183*)(C))->a1));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 1183:
			case 791:
			case 799:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T174x6634(GE_void(a3)));
			R = (T173x6579T0T0T0(GE_void(a1), l2, t3, a2));
		} else {
			t3 = (T174x6634(GE_void(a3)));
			R = (T647x6569T0T0T0(GE_void(l1), a1, a2, t3));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.same_named_type */
T1 T931f11(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T1 R = 0;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T174x6652T0T0(GE_void(a3), a1, a2));
	}
	return R;
}

/* ET_LIKE_FEATURE.same_named_type */
T1 T929f18(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T929*)(C))->a4)==((T6)(GE_int32(0))));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t1 = (T929f38(C));
			if (t1) {
				l1 = (T174x6636(GE_void(a3)));
				l2 = (T60f55(GE_void(l1), ((T929*)(C))->a4));
				t1 = ((l2)!=(EIF_VOID));
				if (t1) {
					l4 = (T208x14346(GE_void(l2)));
					l5 = (T929f40(C));
					t1 = ((l4)==(EIF_VOID));
					if (!(t1)) {
						t2 = (((T248*)(GE_void(l4)))->a1);
						t1 = (T6f1(&l5, t2));
					}
					if (t1) {
						R = EIF_FALSE;
					} else {
						t3 = (T248f6(GE_void(l4), l5));
						t3 = (((((T0*)(GE_void(t3)))->id==254)?T254f4(t3):T1397f4(t3)));
						R = (T173x6569T0T0T0(GE_void(t3), a1, a2, a3));
					}
				} else {
					R = EIF_FALSE;
				}
			} else {
				l1 = (T174x6636(GE_void(a3)));
				l3 = (T60f55(GE_void(l1), ((T929*)(C))->a4));
				t1 = ((l3)!=(EIF_VOID));
				if (t1) {
					t3 = (T171x14345(GE_void(l3)));
					R = (T173x6569T0T0T0(GE_void(t3), a1, a2, a3));
				} else {
					R = EIF_FALSE;
				}
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.same_named_type */
T1 T812f34(T0* C, T0* a1, T0* a2, T0* a3)
{
	T0* t1;
	T1 t2;
	T1 R = 0;
	t1 = (T812f20(C));
	t1 = (T160f2(GE_void(t1)));
	t2 = ((((T812*)(C))->a1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T173x6577T0T0T0(GE_void(a1), C, a3, a2));
		}
	}
	return R;
}

/* ET_BIT_N.same_named_type */
T1 T811f34(T0* C, T0* a1, T0* a2, T0* a3)
{
	T0* t1;
	T1 t2;
	T1 R = 0;
	t1 = (T811f25(C));
	t1 = (T160f2(GE_void(t1)));
	t2 = ((((T811*)(C))->a4)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T173x6577T0T0T0(GE_void(a1), C, a3, a2));
		}
	}
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.same_named_type */
T1 T799f22(T0* C, T0* a1, T0* a2, T0* a3)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	t1 = (T174x6642(GE_void(a3)));
	t2 = (T6f13(&(((T799*)(C))->a6), t1));
	if (t2) {
		l1 = (T174x6638T6(GE_void(a3), ((T799*)(C))->a6));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 791:
			case 1183:
			case 799:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T174x6634(GE_void(a3)));
			R = (T173x6579T0T0T0(GE_void(a1), l2, t3, a2));
		} else {
			t3 = (T174x6634(GE_void(a3)));
			R = (T647x6569T0T0T0(GE_void(l1), a1, a2, t3));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.same_named_type */
T1 T791f17(T0* C, T0* a1, T0* a2, T0* a3)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	t1 = (T174x6642(GE_void(a3)));
	t2 = (T6f13(&(((T791*)(C))->a2), t1));
	if (t2) {
		l1 = (T174x6638T6(GE_void(a3), ((T791*)(C))->a2));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 791:
			case 1183:
			case 799:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T174x6634(GE_void(a3)));
			R = (T173x6579T0T0T0(GE_void(a1), l2, t3, a2));
		} else {
			t3 = (T174x6634(GE_void(a3)));
			R = (T647x6569T0T0T0(GE_void(l1), a1, a2, t3));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.same_named_type */
T1 T185f29(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = ((a1)==(C));
	if (t1) {
		t2 = ((a2)==(a3));
		if (!(t2)) {
			t2 = (T185f12(C));
			t1 = ((T1)(!(t2)));
		} else {
			t1 = EIF_TRUE;
		}
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T173x6580T0T0T0(GE_void(a1), C, a3, a2));
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_named_type */
T1 T178f29(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = (T60f66(GE_void(((T178*)(C))->a1)));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = ((a1)==(C));
		if (t1) {
			t2 = ((a2)==(a3));
			if (!(t2)) {
				t2 = (T178f11(C));
				t1 = ((T1)(!(t2)));
			} else {
				t1 = EIF_TRUE;
			}
		}
		if (t1) {
			R = EIF_TRUE;
		} else {
			R = (T173x6578T0T0T0(GE_void(a1), C, a3, a2));
		}
	}
	return R;
}

/* ET_CLASS_TYPE.same_named_type */
T1 T176f28(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = (T60f66(GE_void(((T176*)(C))->a3)));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = ((a1)==(C));
		if (t1) {
			t2 = ((a2)==(a3));
			if (!(t2)) {
				t2 = (T176f4(C));
				t1 = ((T1)(!(t2)));
			} else {
				t1 = EIF_TRUE;
			}
		}
		if (t1) {
			R = EIF_TRUE;
		} else {
			R = (T173x6578T0T0T0(GE_void(a1), C, a3, a2));
		}
	}
	return R;
}

/* ET_CLASS.same_named_type */
T1 T60f93(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = (T60f66(GE_void(((T60*)(C))->a10)));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = ((a1)==(C));
		if (t1) {
			t2 = ((a2)==(a3));
			if (!(t2)) {
				t2 = (T60f57(C));
				t1 = ((T1)(!(t2)));
			} else {
				t1 = EIF_TRUE;
			}
		}
		if (t1) {
			R = EIF_TRUE;
		} else {
			R = (T173x6578T0T0T0(GE_void(a1), C, a3, a2));
		}
	}
	return R;
}

/* ET_DEFERRED_FUNCTION.new_synonym */
T0* T883f37(T0* C, T0* a1)
{
	T0* R = 0;
	R = T883c69(a1, ((T883*)(C))->a6, ((T883*)(C))->a10, ((T883*)(C))->a3);
	T883f78(GE_void(R), ((T883*)(C))->a11);
	T883f79(GE_void(R), ((T883*)(C))->a12);
	T883f80(GE_void(R), ((T883*)(C))->a4);
	T883f81(GE_void(R), ((T883*)(C))->a5);
	T883f82(GE_void(R), ((T883*)(C))->a13);
	T883f77(GE_void(R), ((T883*)(C))->a14);
	T883f84(GE_void(R), ((T883*)(C))->a15);
	T883f85(GE_void(R), ((T883*)(C))->a16);
	T883f86(GE_void(R), ((T883*)(C))->a17);
	T883f87(GE_void(R), ((T883*)(C))->a18);
	T883f83(GE_void(R), ((T883*)(C))->a19);
	T883f88(GE_void(R), C);
	return R;
}

/* ET_DEFERRED_FUNCTION.set_synonym */
void T883f88(T0* C, T0* a1)
{
	((T883*)(C))->a28 = a1;
}

/* ET_ONCE_FUNCTION.new_synonym */
T0* T882f37(T0* C, T0* a1)
{
	T0* R = 0;
	R = T882c70(a1, ((T882*)(C))->a6, ((T882*)(C))->a10, ((T882*)(C))->a3);
	T882f79(GE_void(R), ((T882*)(C))->a11);
	T882f80(GE_void(R), ((T882*)(C))->a12);
	T882f81(GE_void(R), ((T882*)(C))->a4);
	T882f82(GE_void(R), ((T882*)(C))->a13);
	T882f83(GE_void(R), ((T882*)(C))->a14);
	T882f84(GE_void(R), ((T882*)(C))->a5);
	T882f85(GE_void(R), ((T882*)(C))->a15);
	T882f86(GE_void(R), ((T882*)(C))->a16);
	T882f78(GE_void(R), ((T882*)(C))->a17);
	T882f88(GE_void(R), ((T882*)(C))->a18);
	T882f89(GE_void(R), ((T882*)(C))->a19);
	T882f90(GE_void(R), ((T882*)(C))->a20);
	T882f87(GE_void(R), ((T882*)(C))->a21);
	T882f91(GE_void(R), C);
	return R;
}

/* ET_ONCE_FUNCTION.set_synonym */
void T882f91(T0* C, T0* a1)
{
	((T882*)(C))->a30 = a1;
}

/* ET_DO_FUNCTION.new_synonym */
T0* T880f37(T0* C, T0* a1)
{
	T0* R = 0;
	R = T880c70(a1, ((T880*)(C))->a6, ((T880*)(C))->a10, ((T880*)(C))->a3);
	T880f79(GE_void(R), ((T880*)(C))->a11);
	T880f80(GE_void(R), ((T880*)(C))->a12);
	T880f81(GE_void(R), ((T880*)(C))->a4);
	T880f82(GE_void(R), ((T880*)(C))->a13);
	T880f83(GE_void(R), ((T880*)(C))->a14);
	T880f84(GE_void(R), ((T880*)(C))->a5);
	T880f85(GE_void(R), ((T880*)(C))->a15);
	T880f86(GE_void(R), ((T880*)(C))->a16);
	T880f78(GE_void(R), ((T880*)(C))->a17);
	T880f88(GE_void(R), ((T880*)(C))->a18);
	T880f89(GE_void(R), ((T880*)(C))->a19);
	T880f90(GE_void(R), ((T880*)(C))->a20);
	T880f87(GE_void(R), ((T880*)(C))->a21);
	T880f91(GE_void(R), C);
	return R;
}

/* ET_DO_FUNCTION.set_synonym */
void T880f91(T0* C, T0* a1)
{
	((T880*)(C))->a30 = a1;
}

/* ET_ATTRIBUTE.new_synonym */
T0* T273f26(T0* C, T0* a1)
{
	T0* R = 0;
	R = T273c66(a1, ((T273*)(C))->a6, ((T273*)(C))->a3);
	T273f74(GE_void(R), ((T273*)(C))->a5);
	T273f75(GE_void(R), ((T273*)(C))->a7);
	T273f76(GE_void(R), ((T273*)(C))->a8);
	T273f77(GE_void(R), ((T273*)(C))->a9);
	T273f78(GE_void(R), ((T273*)(C))->a10);
	T273f79(GE_void(R), C);
	return R;
}

/* ET_ATTRIBUTE.set_synonym */
void T273f79(T0* C, T0* a1)
{
	((T273*)(C))->a21 = a1;
}

/* ET_UNIQUE_ATTRIBUTE.new_synonym */
T0* T272f26(T0* C, T0* a1)
{
	T0* R = 0;
	R = T272c68(a1, ((T272*)(C))->a6, ((T272*)(C))->a3);
	T272f76(GE_void(R), ((T272*)(C))->a5);
	T272f77(GE_void(R), ((T272*)(C))->a7);
	T272f78(GE_void(R), ((T272*)(C))->a8);
	T272f79(GE_void(R), ((T272*)(C))->a9);
	T272f80(GE_void(R), ((T272*)(C))->a10);
	T272f81(GE_void(R), ((T272*)(C))->a11);
	T272f82(GE_void(R), ((T272*)(C))->a12);
	T272f83(GE_void(R), C);
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.set_synonym */
void T272f83(T0* C, T0* a1)
{
	((T272*)(C))->a23 = a1;
}

/* ET_CONSTANT_ATTRIBUTE.new_synonym */
T0* T271f26(T0* C, T0* a1)
{
	T0* R = 0;
	R = T271c68(a1, ((T271*)(C))->a9, ((T271*)(C))->a3, ((T271*)(C))->a4);
	T271f76(GE_void(R), ((T271*)(C))->a6);
	T271f77(GE_void(R), ((T271*)(C))->a11);
	T271f78(GE_void(R), ((T271*)(C))->a12);
	T271f79(GE_void(R), ((T271*)(C))->a13);
	T271f80(GE_void(R), ((T271*)(C))->a14);
	T271f81(GE_void(R), ((T271*)(C))->a15);
	T271f82(GE_void(R), C);
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.set_synonym */
void T271f82(T0* C, T0* a1)
{
	((T271*)(C))->a23 = a1;
}

/* ET_EXTERNAL_FUNCTION.new_synonym */
T0* T180f37(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T6 t3;
	T0* R = 0;
	R = T180c74(a1, ((T180*)(C))->a7, ((T180*)(C))->a10, ((T180*)(C))->a9, ((T180*)(C))->a3);
	T180f84(GE_void(R), ((T180*)(C))->a11);
	T180f85(GE_void(R), ((T180*)(C))->a12);
	T180f86(GE_void(R), ((T180*)(C))->a4);
	T180f87(GE_void(R), ((T180*)(C))->a5);
	T180f88(GE_void(R), ((T180*)(C))->a13);
	T180f89(GE_void(R), ((T180*)(C))->a14);
	T180f83(GE_void(R), ((T180*)(C))->a15);
	T180f91(GE_void(R), ((T180*)(C))->a16);
	T180f92(GE_void(R), ((T180*)(C))->a17);
	T180f93(GE_void(R), ((T180*)(C))->a18);
	T180f90(GE_void(R), ((T180*)(C))->a19);
	T180f94(GE_void(R), C);
	t1 = (T180f35(C));
	if (t1) {
		t2 = (T180f32(C));
		t3 = ((T6)(GE_int32(1)));
		T180f82(GE_void(R), t3);
	}
	return R;
}

/* ET_EXTERNAL_FUNCTION.set_synonym */
void T180f94(T0* C, T0* a1)
{
	((T180*)(C))->a30 = a1;
}

/* ET_ONCE_FUNCTION.is_deferred */
T1 T882f45(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_FUNCTION.is_deferred */
T1 T880f45(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ATTRIBUTE.is_deferred */
T1 T273f40(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.is_deferred */
T1 T272f40(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.is_deferred */
T1 T271f41(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_deferred */
T1 T180f45(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_FUNCTION.is_frozen */
T1 T883f43(T0* C)
{
	T1 R = 0;
	R = ((((T883*)(C))->a24)!=(EIF_VOID));
	return R;
}

/* ET_ONCE_FUNCTION.is_frozen */
T1 T882f46(T0* C)
{
	T1 R = 0;
	R = ((((T882*)(C))->a26)!=(EIF_VOID));
	return R;
}

/* ET_DO_FUNCTION.is_frozen */
T1 T880f46(T0* C)
{
	T1 R = 0;
	R = ((((T880*)(C))->a26)!=(EIF_VOID));
	return R;
}

/* ET_ATTRIBUTE.is_frozen */
T1 T273f41(T0* C)
{
	T1 R = 0;
	R = ((((T273*)(C))->a12)!=(EIF_VOID));
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.is_frozen */
T1 T272f41(T0* C)
{
	T1 R = 0;
	R = ((((T272*)(C))->a14)!=(EIF_VOID));
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.is_frozen */
T1 T271f42(T0* C)
{
	T1 R = 0;
	R = ((((T271*)(C))->a10)!=(EIF_VOID));
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_frozen */
T1 T180f46(T0* C)
{
	T1 R = 0;
	R = ((((T180*)(C))->a26)!=(EIF_VOID));
	return R;
}

/* ET_DEFERRED_FUNCTION.is_bracketable */
T1 T883f46(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T883*)(C))->a6)!=(EIF_VOID));
	if (t1) {
		t2 = (((T248*)(GE_void(((T883*)(C))->a6)))->a1);
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_ONCE_FUNCTION.is_bracketable */
T1 T882f49(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T882*)(C))->a6)!=(EIF_VOID));
	if (t1) {
		t2 = (((T248*)(GE_void(((T882*)(C))->a6)))->a1);
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_DO_FUNCTION.is_bracketable */
T1 T880f49(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T880*)(C))->a6)!=(EIF_VOID));
	if (t1) {
		t2 = (((T248*)(GE_void(((T880*)(C))->a6)))->a1);
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_ATTRIBUTE.is_bracketable */
T1 T273f23(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.is_bracketable */
T1 T272f44(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.is_bracketable */
T1 T271f45(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_bracketable */
T1 T180f49(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T180*)(C))->a7)!=(EIF_VOID));
	if (t1) {
		t2 = (((T248*)(GE_void(((T180*)(C))->a7)))->a1);
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_DEFERRED_FUNCTION.is_prefixable */
T1 T883f44(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T883*)(C))->a6)==(EIF_VOID));
	if (!(t1)) {
		t2 = (((T248*)(GE_void(((T883*)(C))->a6)))->a1);
		R = ((t2)==((T6)(GE_int32(0))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* ET_ONCE_FUNCTION.is_prefixable */
T1 T882f47(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T882*)(C))->a6)==(EIF_VOID));
	if (!(t1)) {
		t2 = (((T248*)(GE_void(((T882*)(C))->a6)))->a1);
		R = ((t2)==((T6)(GE_int32(0))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* ET_DO_FUNCTION.is_prefixable */
T1 T880f47(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T880*)(C))->a6)==(EIF_VOID));
	if (!(t1)) {
		t2 = (((T248*)(GE_void(((T880*)(C))->a6)))->a1);
		R = ((t2)==((T6)(GE_int32(0))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_prefixable */
T1 T180f47(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T180*)(C))->a7)==(EIF_VOID));
	if (!(t1)) {
		t2 = (((T248*)(GE_void(((T180*)(C))->a7)))->a1);
		R = ((t2)==((T6)(GE_int32(0))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* ET_DEFERRED_FUNCTION.is_infixable */
T1 T883f45(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T883*)(C))->a6)!=(EIF_VOID));
	if (t1) {
		t2 = (((T248*)(GE_void(((T883*)(C))->a6)))->a1);
		R = ((t2)==((T6)(GE_int32(1))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_ONCE_FUNCTION.is_infixable */
T1 T882f48(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T882*)(C))->a6)!=(EIF_VOID));
	if (t1) {
		t2 = (((T248*)(GE_void(((T882*)(C))->a6)))->a1);
		R = ((t2)==((T6)(GE_int32(1))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_DO_FUNCTION.is_infixable */
T1 T880f48(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T880*)(C))->a6)!=(EIF_VOID));
	if (t1) {
		t2 = (((T248*)(GE_void(((T880*)(C))->a6)))->a1);
		R = ((t2)==((T6)(GE_int32(1))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_ATTRIBUTE.is_infixable */
T1 T273f43(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.is_infixable */
T1 T272f43(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.is_infixable */
T1 T271f44(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_infixable */
T1 T180f48(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T180*)(C))->a7)!=(EIF_VOID));
	if (t1) {
		t2 = (((T248*)(GE_void(((T180*)(C))->a7)))->a1);
		R = ((t2)==((T6)(GE_int32(1))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_DEFERRED_FUNCTION.is_once */
T1 T883f47(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_FUNCTION.is_once */
T1 T880f44(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ATTRIBUTE.is_once */
T1 T273f24(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.is_once */
T1 T272f45(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.is_once */
T1 T271f25(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_once */
T1 T180f50(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_FUNCTION.is_constant_attribute */
T1 T883f38(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_FUNCTION.is_constant_attribute */
T1 T882f38(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_FUNCTION.is_constant_attribute */
T1 T880f38(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ATTRIBUTE.is_constant_attribute */
T1 T273f27(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.is_constant_attribute */
T1 T272f27(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_constant_attribute */
T1 T180f40(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_FUNCTION.is_unique_attribute */
T1 T883f36(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_FUNCTION.is_unique_attribute */
T1 T882f36(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_FUNCTION.is_unique_attribute */
T1 T880f36(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ATTRIBUTE.is_unique_attribute */
T1 T273f33(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.is_unique_attribute */
T1 T271f34(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_unique_attribute */
T1 T180f39(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ATTRIBUTE.arguments */
T0* T273f35(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.arguments */
T0* T272f34(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.arguments */
T0* T271f35(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_DEFERRED_FUNCTION.overloaded_name */
T0* T883f66(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T883f68(C));
	R = (T395x12347(GE_void(t1)));
	return R;
}

/* ET_DEFERRED_FUNCTION.overloaded_extended_name */
T0* T883f68(T0* C)
{
	T0* R = 0;
	R = ((T883*)(C))->a8;
	return R;
}

/* ET_ONCE_FUNCTION.overloaded_name */
T0* T882f67(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T882f69(C));
	R = (T395x12347(GE_void(t1)));
	return R;
}

/* ET_ONCE_FUNCTION.overloaded_extended_name */
T0* T882f69(T0* C)
{
	T0* R = 0;
	R = ((T882*)(C))->a8;
	return R;
}

/* ET_DO_FUNCTION.overloaded_name */
T0* T880f67(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T880f69(C));
	R = (T395x12347(GE_void(t1)));
	return R;
}

/* ET_DO_FUNCTION.overloaded_extended_name */
T0* T880f69(T0* C)
{
	T0* R = 0;
	R = ((T880*)(C))->a8;
	return R;
}

/* ET_ATTRIBUTE.overloaded_name */
T0* T273f62(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T273f65(C));
	R = (T395x12347(GE_void(t1)));
	return R;
}

/* ET_ATTRIBUTE.overloaded_extended_name */
T0* T273f65(T0* C)
{
	T0* R = 0;
	R = ((T273*)(C))->a11;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.overloaded_name */
T0* T272f64(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T272f67(C));
	R = (T395x12347(GE_void(t1)));
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.overloaded_extended_name */
T0* T272f67(T0* C)
{
	T0* R = 0;
	R = ((T272*)(C))->a13;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.overloaded_name */
T0* T271f64(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T271f67(C));
	R = (T395x12347(GE_void(t1)));
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.overloaded_extended_name */
T0* T271f67(T0* C)
{
	T0* R = 0;
	R = ((T271*)(C))->a7;
	return R;
}

/* ET_EXTERNAL_FUNCTION.overloaded_name */
T0* T180f71(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T180f73(C));
	R = (T395x12347(GE_void(t1)));
	return R;
}

/* ET_EXTERNAL_FUNCTION.overloaded_extended_name */
T0* T180f73(T0* C)
{
	T0* R = 0;
	R = ((T180*)(C))->a21;
	return R;
}

/* ET_DEFERRED_FUNCTION.alias_name */
T0* T883f39(T0* C)
{
	T0* R = 0;
	R = (T395x12348(GE_void(((T883*)(C))->a8)));
	return R;
}

/* ET_ONCE_FUNCTION.alias_name */
T0* T882f39(T0* C)
{
	T0* R = 0;
	R = (T395x12348(GE_void(((T882*)(C))->a8)));
	return R;
}

/* ET_DO_FUNCTION.alias_name */
T0* T880f39(T0* C)
{
	T0* R = 0;
	R = (T395x12348(GE_void(((T880*)(C))->a8)));
	return R;
}

/* ET_ATTRIBUTE.alias_name */
T0* T273f37(T0* C)
{
	T0* R = 0;
	R = (T395x12348(GE_void(((T273*)(C))->a11)));
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.alias_name */
T0* T272f37(T0* C)
{
	T0* R = 0;
	R = (T395x12348(GE_void(((T272*)(C))->a13)));
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.alias_name */
T0* T271f38(T0* C)
{
	T0* R = 0;
	R = (T395x12348(GE_void(((T271*)(C))->a7)));
	return R;
}

/* ET_EXTERNAL_FUNCTION.alias_name */
T0* T180f42(T0* C)
{
	T0* R = 0;
	R = (T395x12348(GE_void(((T180*)(C))->a21)));
	return R;
}

/* ET_DEFERRED_FUNCTION.overloaded_alias_name */
T0* T883f67(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T883f68(C));
	R = (T395x12348(GE_void(t1)));
	return R;
}

/* ET_ONCE_FUNCTION.overloaded_alias_name */
T0* T882f68(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T882f69(C));
	R = (T395x12348(GE_void(t1)));
	return R;
}

/* ET_DO_FUNCTION.overloaded_alias_name */
T0* T880f68(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T880f69(C));
	R = (T395x12348(GE_void(t1)));
	return R;
}

/* ET_ATTRIBUTE.overloaded_alias_name */
T0* T273f63(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T273f65(C));
	R = (T395x12348(GE_void(t1)));
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.overloaded_alias_name */
T0* T272f65(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T272f67(C));
	R = (T395x12348(GE_void(t1)));
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.overloaded_alias_name */
T0* T271f65(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T271f67(C));
	R = (T395x12348(GE_void(t1)));
	return R;
}

/* ET_EXTERNAL_FUNCTION.overloaded_alias_name */
T0* T180f72(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T180f73(C));
	R = (T395x12348(GE_void(t1)));
	return R;
}

/* ET_DEFERRED_FUNCTION.name */
T0* T883f30(T0* C)
{
	T0* R = 0;
	R = (T395x12347(GE_void(((T883*)(C))->a8)));
	return R;
}

/* ET_ONCE_FUNCTION.name */
T0* T882f42(T0* C)
{
	T0* R = 0;
	R = (T395x12347(GE_void(((T882*)(C))->a8)));
	return R;
}

/* ET_DO_FUNCTION.name */
T0* T880f42(T0* C)
{
	T0* R = 0;
	R = (T395x12347(GE_void(((T880*)(C))->a8)));
	return R;
}

/* ET_ATTRIBUTE.name */
T0* T273f28(T0* C)
{
	T0* R = 0;
	R = (T395x12347(GE_void(((T273*)(C))->a11)));
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.name */
T0* T272f28(T0* C)
{
	T0* R = 0;
	R = (T395x12347(GE_void(((T272*)(C))->a13)));
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.name */
T0* T271f27(T0* C)
{
	T0* R = 0;
	R = (T395x12347(GE_void(((T271*)(C))->a7)));
	return R;
}

/* ET_EXTERNAL_FUNCTION.name */
T0* T180f41(T0* C)
{
	T0* R = 0;
	R = (T395x12347(GE_void(((T180*)(C))->a21)));
	return R;
}

/* ET_DEFERRED_FUNCTION.arguments_count */
T6 T883f41(T0* C)
{
	T1 t1;
	T6 R = 0;
	T0* l1 = 0;
	l1 = ((T883*)(C))->a6;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((T248*)(GE_void(l1)))->a1);
	}
	return R;
}

/* ET_ONCE_FUNCTION.arguments_count */
T6 T882f41(T0* C)
{
	T1 t1;
	T6 R = 0;
	T0* l1 = 0;
	l1 = ((T882*)(C))->a6;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((T248*)(GE_void(l1)))->a1);
	}
	return R;
}

/* ET_DO_FUNCTION.arguments_count */
T6 T880f41(T0* C)
{
	T1 t1;
	T6 R = 0;
	T0* l1 = 0;
	l1 = ((T880*)(C))->a6;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((T248*)(GE_void(l1)))->a1);
	}
	return R;
}

/* ET_ATTRIBUTE.arguments_count */
T6 T273f39(T0* C)
{
	T1 t1;
	T6 R = 0;
	T0* l1 = 0;
	l1 = (T273f35(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), (T6)0));
	}
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.arguments_count */
T6 T272f39(T0* C)
{
	T1 t1;
	T6 R = 0;
	T0* l1 = 0;
	l1 = (T272f34(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), (T6)0));
	}
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.arguments_count */
T6 T271f40(T0* C)
{
	T1 t1;
	T6 R = 0;
	T0* l1 = 0;
	l1 = (T271f35(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), (T6)0));
	}
	return R;
}

/* ET_EXTERNAL_FUNCTION.arguments_count */
T6 T180f44(T0* C)
{
	T1 t1;
	T6 R = 0;
	T0* l1 = 0;
	l1 = ((T180*)(C))->a7;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((T248*)(GE_void(l1)))->a1);
	}
	return R;
}

/* ET_DEFERRED_FUNCTION.is_exported_to */
T1 T883f61(T0* C, T0* a1)
{
	T1 R = 0;
	R = (((((T0*)(GE_void(((T883*)(C))->a13)))->id==368)?T368f6(((T883*)(C))->a13, a1):T680f10(((T883*)(C))->a13, a1)));
	return R;
}

/* ET_CLIENTS.has_descendant */
T1 T680f10(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	t1 = (T60f61(GE_void(a1)));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = (T680f7(C, a1));
		if (t1) {
			R = EIF_TRUE;
		} else {
			t1 = (T60f65(GE_void(a1)));
			if (t1) {
				t2 = (T60f59(GE_void(a1)));
				t2 = (T25x2787(GE_void(t2)));
				T60f151(GE_void(a1), t2);
				t1 = (((T60*)(GE_void(a1)))->a30);
				if (t1) {
					t3 = (((T60*)(GE_void(a1)))->a29);
					t1 = ((T1)(!(t3)));
				}
				if (t1) {
					l2 = ((T6)((((T680*)(C))->a3)-((T6)(GE_int32(1)))));
					l1 = (T6)(GE_int32(0));
					while (1) {
						t1 = (T6f1(&l1, l2));
						if (t1) {
							break;
						}
						t2 = (((T847*)(GE_void(((T680*)(C))->a4)))->z2[l1]);
						t2 = (((T361*)(GE_void(t2)))->a2);
						t1 = (T60f146(GE_void(a1), t2));
						if (t1) {
							R = EIF_TRUE;
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

/* ET_CLASS.has_ancestor */
T1 T60f146(T0* C, T0* a1)
{
	T1 t1;
	T1 R = 0;
	t1 = (T60f66(C));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = ((a1)==(C));
		if (t1) {
			R = EIF_TRUE;
		} else {
			t1 = (T60f61(C));
			if (t1) {
				R = EIF_TRUE;
			} else {
				R = (T627f6(GE_void(((T60*)(C))->a14), a1));
			}
		}
	}
	return R;
}

/* ET_BASE_TYPE_LIST.has_class */
T1 T627f6(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	l2 = ((T627*)(C))->a1;
	l1 = (T6)(GE_int32(1));
	while (1) {
		t1 = (T6f1(&l1, l2));
		if (t1) {
			break;
		}
		t2 = (((T1196*)(GE_void(((T627*)(C))->a2)))->z2[l1]);
		t2 = (T162x6636(GE_void(t2)));
		t1 = ((t2)==(a1));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* ET_CLIENT_LIST.has_descendant */
T1 T368f6(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	t1 = (T60f61(GE_void(a1)));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = (T368f4(C, a1));
		if (t1) {
			R = EIF_TRUE;
		} else {
			t1 = (T60f65(GE_void(a1)));
			if (t1) {
				t2 = (T60f59(GE_void(a1)));
				t2 = (T25x2787(GE_void(t2)));
				T60f151(GE_void(a1), t2);
				t1 = (((T60*)(GE_void(a1)))->a30);
				if (t1) {
					t3 = (((T60*)(GE_void(a1)))->a29);
					t1 = ((T1)(!(t3)));
				}
				if (t1) {
					l2 = ((T6)((((T368*)(C))->a1)-((T6)(GE_int32(1)))));
					l1 = (T6)(GE_int32(0));
					while (1) {
						t1 = (T6f1(&l1, l2));
						if (t1) {
							break;
						}
						t2 = (((T847*)(GE_void(((T368*)(C))->a2)))->z2[l1]);
						t2 = (((T361*)(GE_void(t2)))->a2);
						t1 = (T60f146(GE_void(a1), t2));
						if (t1) {
							R = EIF_TRUE;
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

/* ET_ONCE_FUNCTION.is_exported_to */
T1 T882f62(T0* C, T0* a1)
{
	T1 R = 0;
	R = (((((T0*)(GE_void(((T882*)(C))->a16)))->id==368)?T368f6(((T882*)(C))->a16, a1):T680f10(((T882*)(C))->a16, a1)));
	return R;
}

/* ET_DO_FUNCTION.is_exported_to */
T1 T880f62(T0* C, T0* a1)
{
	T1 R = 0;
	R = (((((T0*)(GE_void(((T880*)(C))->a16)))->id==368)?T368f6(((T880*)(C))->a16, a1):T680f10(((T880*)(C))->a16, a1)));
	return R;
}

/* ET_ATTRIBUTE.is_exported_to */
T1 T273f57(T0* C, T0* a1)
{
	T1 R = 0;
	R = (((((T0*)(GE_void(((T273*)(C))->a7)))->id==368)?T368f6(((T273*)(C))->a7, a1):T680f10(((T273*)(C))->a7, a1)));
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.is_exported_to */
T1 T272f59(T0* C, T0* a1)
{
	T1 R = 0;
	R = (((((T0*)(GE_void(((T272*)(C))->a7)))->id==368)?T368f6(((T272*)(C))->a7, a1):T680f10(((T272*)(C))->a7, a1)));
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.is_exported_to */
T1 T271f59(T0* C, T0* a1)
{
	T1 R = 0;
	R = (((((T0*)(GE_void(((T271*)(C))->a11)))->id==368)?T368f6(((T271*)(C))->a11, a1):T680f10(((T271*)(C))->a11, a1)));
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_exported_to */
T1 T180f66(T0* C, T0* a1)
{
	T1 R = 0;
	R = (((((T0*)(GE_void(((T180*)(C))->a14)))->id==368)?T368f6(((T180*)(C))->a14, a1):T680f10(((T180*)(C))->a14, a1)));
	return R;
}

/* ET_DEFERRED_FUNCTION.is_attribute */
T1 T883f33(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_FUNCTION.is_attribute */
T1 T882f32(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_FUNCTION.is_attribute */
T1 T880f32(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.is_attribute */
T1 T272f35(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.is_attribute */
T1 T271f29(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_attribute */
T1 T180f34(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_FUNCTION.has_seed */
T1 T883f32(T0* C, T6 a1)
{
	T1 t1;
	T1 R = 0;
	t1 = ((((T883*)(C))->a7)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T883*)(C))->a9)!=(EIF_VOID));
		if (t1) {
			R = (T1409f7(GE_void(((T883*)(C))->a9), a1));
		}
	}
	return R;
}

/* ET_ONCE_FUNCTION.has_seed */
T1 T882f43(T0* C, T6 a1)
{
	T1 t1;
	T1 R = 0;
	t1 = ((((T882*)(C))->a7)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T882*)(C))->a9)!=(EIF_VOID));
		if (t1) {
			R = (T1409f7(GE_void(((T882*)(C))->a9), a1));
		}
	}
	return R;
}

/* ET_DO_FUNCTION.has_seed */
T1 T880f43(T0* C, T6 a1)
{
	T1 t1;
	T1 R = 0;
	t1 = ((((T880*)(C))->a7)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T880*)(C))->a9)!=(EIF_VOID));
		if (t1) {
			R = (T1409f7(GE_void(((T880*)(C))->a9), a1));
		}
	}
	return R;
}

/* ET_ATTRIBUTE.has_seed */
T1 T273f29(T0* C, T6 a1)
{
	T1 t1;
	T1 R = 0;
	t1 = ((((T273*)(C))->a4)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T273*)(C))->a13)!=(EIF_VOID));
		if (t1) {
			R = (T1409f7(GE_void(((T273*)(C))->a13), a1));
		}
	}
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.has_seed */
T1 T272f29(T0* C, T6 a1)
{
	T1 t1;
	T1 R = 0;
	t1 = ((((T272*)(C))->a4)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T272*)(C))->a15)!=(EIF_VOID));
		if (t1) {
			R = (T1409f7(GE_void(((T272*)(C))->a15), a1));
		}
	}
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.has_seed */
T1 T271f30(T0* C, T6 a1)
{
	T1 t1;
	T1 R = 0;
	t1 = ((((T271*)(C))->a5)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T271*)(C))->a8)!=(EIF_VOID));
		if (t1) {
			R = (T1409f7(GE_void(((T271*)(C))->a8), a1));
		}
	}
	return R;
}

/* ET_EXTERNAL_FUNCTION.has_seed */
T1 T180f33(T0* C, T6 a1)
{
	T1 t1;
	T1 R = 0;
	t1 = ((((T180*)(C))->a8)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T180*)(C))->a20)!=(EIF_VOID));
		if (t1) {
			R = (T1409f7(GE_void(((T180*)(C))->a20), a1));
		}
	}
	return R;
}

/* ET_DEFERRED_FUNCTION.type */
T0* T883f35(T0* C)
{
	T0* R = 0;
	R = (T873x6631(GE_void(((T883*)(C))->a10)));
	return R;
}

/* ET_ONCE_FUNCTION.type */
T0* T882f35(T0* C)
{
	T0* R = 0;
	R = (T873x6631(GE_void(((T882*)(C))->a10)));
	return R;
}

/* ET_DO_FUNCTION.type */
T0* T880f35(T0* C)
{
	T0* R = 0;
	R = (T873x6631(GE_void(((T880*)(C))->a10)));
	return R;
}

/* ET_ATTRIBUTE.type */
T0* T273f32(T0* C)
{
	T0* R = 0;
	R = (T873x6631(GE_void(((T273*)(C))->a6)));
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.type */
T0* T272f32(T0* C)
{
	T0* R = 0;
	R = (T873x6631(GE_void(((T272*)(C))->a6)));
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.type */
T0* T271f33(T0* C)
{
	T0* R = 0;
	R = (T873x6631(GE_void(((T271*)(C))->a9)));
	return R;
}

/* ET_EXTERNAL_FUNCTION.type */
T0* T180f38(T0* C)
{
	T0* R = 0;
	R = (T873x6631(GE_void(((T180*)(C))->a10)));
	return R;
}

/* ET_DEFERRED_FUNCTION.lower_name */
T0* T883f34(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T883f30(C));
	R = (T169x12304(GE_void(t1)));
	return R;
}

/* ET_ONCE_FUNCTION.lower_name */
T0* T882f34(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T882f42(C));
	R = (T169x12304(GE_void(t1)));
	return R;
}

/* ET_DO_FUNCTION.lower_name */
T0* T880f34(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T880f42(C));
	R = (T169x12304(GE_void(t1)));
	return R;
}

/* ET_ATTRIBUTE.lower_name */
T0* T273f25(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T273f28(C));
	R = (T169x12304(GE_void(t1)));
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.lower_name */
T0* T272f25(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T272f28(C));
	R = (T169x12304(GE_void(t1)));
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.lower_name */
T0* T271f37(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T271f27(C));
	R = (T169x12304(GE_void(t1)));
	return R;
}

/* ET_EXTERNAL_FUNCTION.lower_name */
T0* T180f36(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T180f41(C));
	R = (T169x12304(GE_void(t1)));
	return R;
}

/* ET_EXTERNAL_PROCEDURE.new_synonym */
T0* T888f32(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T6 t3;
	T0* R = 0;
	R = T888c73(a1, ((T888*)(C))->a7, ((T888*)(C))->a9, ((T888*)(C))->a3);
	T888f83(GE_void(R), ((T888*)(C))->a10);
	T888f84(GE_void(R), ((T888*)(C))->a4);
	T888f85(GE_void(R), ((T888*)(C))->a5);
	T888f86(GE_void(R), ((T888*)(C))->a11);
	T888f87(GE_void(R), ((T888*)(C))->a12);
	T888f82(GE_void(R), ((T888*)(C))->a13);
	T888f89(GE_void(R), ((T888*)(C))->a14);
	T888f90(GE_void(R), ((T888*)(C))->a15);
	T888f91(GE_void(R), ((T888*)(C))->a16);
	T888f88(GE_void(R), ((T888*)(C))->a17);
	T888f92(GE_void(R), C);
	t1 = (T888f30(C));
	if (t1) {
		t2 = (T888f39(C));
		t3 = ((T6)(GE_int32(1)));
		T888f81(GE_void(R), t3);
	}
	return R;
}

/* ET_EXTERNAL_PROCEDURE.set_synonym */
void T888f92(T0* C, T0* a1)
{
	((T888*)(C))->a28 = a1;
}

/* ET_ONCE_PROCEDURE.new_synonym */
T0* T887f30(T0* C, T0* a1)
{
	T0* R = 0;
	R = T887c69(a1, ((T887*)(C))->a7, ((T887*)(C))->a4);
	T887f78(GE_void(R), ((T887*)(C))->a10);
	T887f79(GE_void(R), ((T887*)(C))->a5);
	T887f80(GE_void(R), ((T887*)(C))->a11);
	T887f81(GE_void(R), ((T887*)(C))->a3);
	T887f82(GE_void(R), ((T887*)(C))->a6);
	T887f83(GE_void(R), ((T887*)(C))->a12);
	T887f84(GE_void(R), ((T887*)(C))->a13);
	T887f77(GE_void(R), ((T887*)(C))->a14);
	T887f86(GE_void(R), ((T887*)(C))->a15);
	T887f87(GE_void(R), ((T887*)(C))->a16);
	T887f88(GE_void(R), ((T887*)(C))->a17);
	T887f85(GE_void(R), ((T887*)(C))->a18);
	T887f89(GE_void(R), C);
	return R;
}

/* ET_ONCE_PROCEDURE.set_synonym */
void T887f89(T0* C, T0* a1)
{
	((T887*)(C))->a28 = a1;
}

/* ET_DEFERRED_PROCEDURE.new_synonym */
T0* T399f31(T0* C, T0* a1)
{
	T0* R = 0;
	R = T399c68(a1, ((T399*)(C))->a2, ((T399*)(C))->a8);
	T399f77(GE_void(R), ((T399*)(C))->a15);
	T399f78(GE_void(R), ((T399*)(C))->a11);
	T399f79(GE_void(R), ((T399*)(C))->a12);
	T399f80(GE_void(R), ((T399*)(C))->a7);
	T399f76(GE_void(R), ((T399*)(C))->a16);
	T399f82(GE_void(R), ((T399*)(C))->a4);
	T399f83(GE_void(R), ((T399*)(C))->a6);
	T399f84(GE_void(R), ((T399*)(C))->a17);
	T399f85(GE_void(R), ((T399*)(C))->a18);
	T399f81(GE_void(R), ((T399*)(C))->a19);
	T399f86(GE_void(R), C);
	return R;
}

/* ET_DEFERRED_PROCEDURE.set_synonym */
void T399f86(T0* C, T0* a1)
{
	((T399*)(C))->a26 = a1;
}

/* ET_DO_PROCEDURE.new_synonym */
T0* T394f31(T0* C, T0* a1)
{
	T0* R = 0;
	R = T394c69(a1, ((T394*)(C))->a2, ((T394*)(C))->a7);
	T394f78(GE_void(R), ((T394*)(C))->a15);
	T394f79(GE_void(R), ((T394*)(C))->a11);
	T394f80(GE_void(R), ((T394*)(C))->a16);
	T394f81(GE_void(R), ((T394*)(C))->a8);
	T394f82(GE_void(R), ((T394*)(C))->a12);
	T394f83(GE_void(R), ((T394*)(C))->a17);
	T394f84(GE_void(R), ((T394*)(C))->a6);
	T394f77(GE_void(R), ((T394*)(C))->a18);
	T394f86(GE_void(R), ((T394*)(C))->a5);
	T394f87(GE_void(R), ((T394*)(C))->a19);
	T394f88(GE_void(R), ((T394*)(C))->a20);
	T394f85(GE_void(R), ((T394*)(C))->a21);
	T394f89(GE_void(R), C);
	return R;
}

/* ET_DO_PROCEDURE.set_synonym */
void T394f89(T0* C, T0* a1)
{
	((T394*)(C))->a28 = a1;
}

/* ET_EXTERNAL_PROCEDURE.is_deferred */
T1 T888f44(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_PROCEDURE.is_deferred */
T1 T887f41(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_PROCEDURE.is_deferred */
T1 T394f41(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.is_frozen */
T1 T888f45(T0* C)
{
	T1 R = 0;
	R = ((((T888*)(C))->a24)!=(EIF_VOID));
	return R;
}

/* ET_ONCE_PROCEDURE.is_frozen */
T1 T887f42(T0* C)
{
	T1 R = 0;
	R = ((((T887*)(C))->a24)!=(EIF_VOID));
	return R;
}

/* ET_DEFERRED_PROCEDURE.is_frozen */
T1 T399f39(T0* C)
{
	T1 R = 0;
	R = ((((T399*)(C))->a22)!=(EIF_VOID));
	return R;
}

/* ET_DO_PROCEDURE.is_frozen */
T1 T394f42(T0* C)
{
	T1 R = 0;
	R = ((((T394*)(C))->a24)!=(EIF_VOID));
	return R;
}

/* ET_EXTERNAL_PROCEDURE.has_seed */
T1 T888f40(T0* C, T6 a1)
{
	T1 t1;
	T1 R = 0;
	t1 = ((((T888*)(C))->a1)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T888*)(C))->a18)!=(EIF_VOID));
		if (t1) {
			R = (T1409f7(GE_void(((T888*)(C))->a18), a1));
		}
	}
	return R;
}

/* ET_ONCE_PROCEDURE.has_seed */
T1 T887f38(T0* C, T6 a1)
{
	T1 t1;
	T1 R = 0;
	t1 = ((((T887*)(C))->a1)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T887*)(C))->a9)!=(EIF_VOID));
		if (t1) {
			R = (T1409f7(GE_void(((T887*)(C))->a9), a1));
		}
	}
	return R;
}

/* ET_DEFERRED_PROCEDURE.has_seed */
T1 T399f36(T0* C, T6 a1)
{
	T1 t1;
	T1 R = 0;
	t1 = ((((T399*)(C))->a13)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T399*)(C))->a14)!=(EIF_VOID));
		if (t1) {
			R = (T1409f7(GE_void(((T399*)(C))->a14), a1));
		}
	}
	return R;
}

/* ET_DO_PROCEDURE.has_seed */
T1 T394f36(T0* C, T6 a1)
{
	T1 t1;
	T1 R = 0;
	t1 = ((((T394*)(C))->a13)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T394*)(C))->a14)!=(EIF_VOID));
		if (t1) {
			R = (T1409f7(GE_void(((T394*)(C))->a14), a1));
		}
	}
	return R;
}

/* ET_EXTERNAL_PROCEDURE.overloaded_name */
T0* T888f69(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T888f72(C));
	R = (T395x12347(GE_void(t1)));
	return R;
}

/* ET_EXTERNAL_PROCEDURE.overloaded_extended_name */
T0* T888f72(T0* C)
{
	T0* R = 0;
	R = ((T888*)(C))->a19;
	return R;
}

/* ET_ONCE_PROCEDURE.overloaded_name */
T0* T887f65(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T887f68(C));
	R = (T395x12347(GE_void(t1)));
	return R;
}

/* ET_ONCE_PROCEDURE.overloaded_extended_name */
T0* T887f68(T0* C)
{
	T0* R = 0;
	R = ((T887*)(C))->a19;
	return R;
}

/* ET_DEFERRED_PROCEDURE.overloaded_name */
T0* T399f64(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T399f67(C));
	R = (T395x12347(GE_void(t1)));
	return R;
}

/* ET_DEFERRED_PROCEDURE.overloaded_extended_name */
T0* T399f67(T0* C)
{
	T0* R = 0;
	R = ((T399*)(C))->a3;
	return R;
}

/* ET_DO_PROCEDURE.overloaded_name */
T0* T394f65(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T394f68(C));
	R = (T395x12347(GE_void(t1)));
	return R;
}

/* ET_DO_PROCEDURE.overloaded_extended_name */
T0* T394f68(T0* C)
{
	T0* R = 0;
	R = ((T394*)(C))->a3;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.alias_name */
T0* T888f38(T0* C)
{
	T0* R = 0;
	R = (T395x12348(GE_void(((T888*)(C))->a19)));
	return R;
}

/* ET_ONCE_PROCEDURE.alias_name */
T0* T887f36(T0* C)
{
	T0* R = 0;
	R = (T395x12348(GE_void(((T887*)(C))->a19)));
	return R;
}

/* ET_DEFERRED_PROCEDURE.alias_name */
T0* T399f33(T0* C)
{
	T0* R = 0;
	R = (T395x12348(GE_void(((T399*)(C))->a3)));
	return R;
}

/* ET_DO_PROCEDURE.alias_name */
T0* T394f33(T0* C)
{
	T0* R = 0;
	R = (T395x12348(GE_void(((T394*)(C))->a3)));
	return R;
}

/* ET_EXTERNAL_PROCEDURE.overloaded_alias_name */
T0* T888f70(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T888f72(C));
	R = (T395x12348(GE_void(t1)));
	return R;
}

/* ET_ONCE_PROCEDURE.overloaded_alias_name */
T0* T887f66(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T887f68(C));
	R = (T395x12348(GE_void(t1)));
	return R;
}

/* ET_DEFERRED_PROCEDURE.overloaded_alias_name */
T0* T399f65(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T399f67(C));
	R = (T395x12348(GE_void(t1)));
	return R;
}

/* ET_DO_PROCEDURE.overloaded_alias_name */
T0* T394f66(T0* C)
{
	T0* t1;
	T0* R = 0;
	t1 = (T394f68(C));
	R = (T395x12348(GE_void(t1)));
	return R;
}

/* ET_EXTERNAL_PROCEDURE.name */
T0* T888f37(T0* C)
{
	T0* R = 0;
	R = (T395x12347(GE_void(((T888*)(C))->a19)));
	return R;
}

/* ET_ONCE_PROCEDURE.name */
T0* T887f35(T0* C)
{
	T0* R = 0;
	R = (T395x12347(GE_void(((T887*)(C))->a19)));
	return R;
}

/* ET_DEFERRED_PROCEDURE.name */
T0* T399f35(T0* C)
{
	T0* R = 0;
	R = (T395x12347(GE_void(((T399*)(C))->a3)));
	return R;
}

/* ET_DO_PROCEDURE.name */
T0* T394f37(T0* C)
{
	T0* R = 0;
	R = (T395x12347(GE_void(((T394*)(C))->a3)));
	return R;
}

/* ET_EXTERNAL_PROCEDURE.is_creation_exported_to */
T1 T888f46(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T6 t4;
	T1 R = 0;
	t1 = (T888f37(C));
	t2 = (T60f123(GE_void(a2), t1, a1));
	if (t2) {
		R = EIF_TRUE;
	} else {
		t1 = (((T60*)(GE_void(a2)))->a12);
		t2 = ((t1)==(EIF_VOID));
		if (t2) {
			t3 = (T60f90(GE_void(a2)));
			t2 = ((T1)(!(t3)));
		}
		if (t2) {
			t2 = (T60f65(GE_void(a2)));
		}
		if (t2) {
			t1 = (T60f59(GE_void(a2)));
			t1 = (T25x2788(GE_void(t1)));
			T60f151(GE_void(a2), t1);
			t1 = (T60f59(GE_void(a2)));
			t4 = (T25x2698(GE_void(t1)));
			R = (T888f40(C, t4));
		}
	}
	return R;
}

/* ET_CLASS.is_creation_exported_to */
T1 T60f123(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = ((((T60*)(C))->a12)!=(EIF_VOID));
	if (t1) {
		R = (T626f8(GE_void(((T60*)(C))->a12), a1, a2));
	}
	return R;
}

/* ET_CREATOR_LIST.is_exported_to */
T1 T626f8(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	l2 = ((T6)((((T626*)(C))->a1)-((T6)(GE_int32(1)))));
	l1 = (T6)(GE_int32(0));
	while (1) {
		t1 = (T6f1(&l1, l2));
		if (t1) {
			break;
		}
		t2 = (((T853*)(GE_void(((T626*)(C))->a2)))->z2[l1]);
		t1 = (T852f13(GE_void(t2), a1, a2));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* ET_CREATOR.is_exported_to */
T1 T852f13(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T1 R = 0;
	t1 = (T852f9(C));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t1 = (((((T0*)(GE_void(((T852*)(C))->a2)))->id==368)?T368f6(((T852*)(C))->a2, a2):T680f10(((T852*)(C))->a2, a2)));
		if (t1) {
			R = (T852f10(C, a1));
		}
	}
	return R;
}

/* ET_ONCE_PROCEDURE.is_creation_exported_to */
T1 T887f43(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T6 t4;
	T1 R = 0;
	t1 = (T887f35(C));
	t2 = (T60f123(GE_void(a2), t1, a1));
	if (t2) {
		R = EIF_TRUE;
	} else {
		t1 = (((T60*)(GE_void(a2)))->a12);
		t2 = ((t1)==(EIF_VOID));
		if (t2) {
			t3 = (T60f90(GE_void(a2)));
			t2 = ((T1)(!(t3)));
		}
		if (t2) {
			t2 = (T60f65(GE_void(a2)));
		}
		if (t2) {
			t1 = (T60f59(GE_void(a2)));
			t1 = (T25x2788(GE_void(t1)));
			T60f151(GE_void(a2), t1);
			t1 = (T60f59(GE_void(a2)));
			t4 = (T25x2698(GE_void(t1)));
			R = (T887f38(C, t4));
		}
	}
	return R;
}

/* ET_DEFERRED_PROCEDURE.is_creation_exported_to */
T1 T399f40(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T6 t4;
	T1 R = 0;
	t1 = (T399f35(C));
	t2 = (T60f123(GE_void(a2), t1, a1));
	if (t2) {
		R = EIF_TRUE;
	} else {
		t1 = (((T60*)(GE_void(a2)))->a12);
		t2 = ((t1)==(EIF_VOID));
		if (t2) {
			t3 = (T60f90(GE_void(a2)));
			t2 = ((T1)(!(t3)));
		}
		if (t2) {
			t2 = (T60f65(GE_void(a2)));
		}
		if (t2) {
			t1 = (T60f59(GE_void(a2)));
			t1 = (T25x2788(GE_void(t1)));
			T60f151(GE_void(a2), t1);
			t1 = (T60f59(GE_void(a2)));
			t4 = (T25x2698(GE_void(t1)));
			R = (T399f36(C, t4));
		}
	}
	return R;
}

/* ET_DO_PROCEDURE.is_creation_exported_to */
T1 T394f43(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T6 t4;
	T1 R = 0;
	t1 = (T394f37(C));
	t2 = (T60f123(GE_void(a2), t1, a1));
	if (t2) {
		R = EIF_TRUE;
	} else {
		t1 = (((T60*)(GE_void(a2)))->a12);
		t2 = ((t1)==(EIF_VOID));
		if (t2) {
			t3 = (T60f90(GE_void(a2)));
			t2 = ((T1)(!(t3)));
		}
		if (t2) {
			t2 = (T60f65(GE_void(a2)));
		}
		if (t2) {
			t1 = (T60f59(GE_void(a2)));
			t1 = (T25x2788(GE_void(t1)));
			T60f151(GE_void(a2), t1);
			t1 = (T60f59(GE_void(a2)));
			t4 = (T25x2698(GE_void(t1)));
			R = (T394f36(C, t4));
		}
	}
	return R;
}

/* ET_EXTERNAL_PROCEDURE.arguments_count */
T6 T888f61(T0* C)
{
	T1 t1;
	T6 R = 0;
	T0* l1 = 0;
	l1 = ((T888*)(C))->a7;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((T248*)(GE_void(l1)))->a1);
	}
	return R;
}

/* ET_ONCE_PROCEDURE.arguments_count */
T6 T887f57(T0* C)
{
	T1 t1;
	T6 R = 0;
	T0* l1 = 0;
	l1 = ((T887*)(C))->a7;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((T248*)(GE_void(l1)))->a1);
	}
	return R;
}

/* ET_DEFERRED_PROCEDURE.arguments_count */
T6 T399f56(T0* C)
{
	T1 t1;
	T6 R = 0;
	T0* l1 = 0;
	l1 = ((T399*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((T248*)(GE_void(l1)))->a1);
	}
	return R;
}

/* ET_DO_PROCEDURE.arguments_count */
T6 T394f57(T0* C)
{
	T1 t1;
	T6 R = 0;
	T0* l1 = 0;
	l1 = ((T394*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((T248*)(GE_void(l1)))->a1);
	}
	return R;
}

/* ET_EXTERNAL_PROCEDURE.is_exported_to */
T1 T888f60(T0* C, T0* a1)
{
	T1 R = 0;
	R = (((((T0*)(GE_void(((T888*)(C))->a12)))->id==368)?T368f6(((T888*)(C))->a12, a1):T680f10(((T888*)(C))->a12, a1)));
	return R;
}

/* ET_ONCE_PROCEDURE.is_exported_to */
T1 T887f56(T0* C, T0* a1)
{
	T1 R = 0;
	R = (((((T0*)(GE_void(((T887*)(C))->a13)))->id==368)?T368f6(((T887*)(C))->a13, a1):T680f10(((T887*)(C))->a13, a1)));
	return R;
}

/* ET_DEFERRED_PROCEDURE.is_exported_to */
T1 T399f55(T0* C, T0* a1)
{
	T1 R = 0;
	R = (((((T0*)(GE_void(((T399*)(C))->a7)))->id==368)?T368f6(((T399*)(C))->a7, a1):T680f10(((T399*)(C))->a7, a1)));
	return R;
}

/* ET_DO_PROCEDURE.is_exported_to */
T1 T394f56(T0* C, T0* a1)
{
	T1 R = 0;
	R = (((((T0*)(GE_void(((T394*)(C))->a6)))->id==368)?T368f6(((T394*)(C))->a6, a1):T680f10(((T394*)(C))->a6, a1)));
	return R;
}

/* ET_PREFIX_FREE_NAME.is_infix */
T1 T893f34(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_infix */
T1 T892f28(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_infix */
T1 T129f61(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_prefix */
T1 T894f30(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_FREE_NAME.is_prefix */
T1 T645f29(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_prefix */
T1 T129f60(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.argument_name */
T0* T894f10(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_PREFIX_FREE_NAME.argument_name */
T0* T893f13(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_PREFIX_NAME.argument_name */
T0* T892f10(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_INFIX_FREE_NAME.argument_name */
T0* T645f13(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_IDENTIFIER.argument_name */
T0* T129f53(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INFIX_NAME.local_name */
T0* T894f12(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_PREFIX_FREE_NAME.local_name */
T0* T893f15(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_PREFIX_NAME.local_name */
T0* T892f12(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_INFIX_FREE_NAME.local_name */
T0* T645f15(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_IDENTIFIER.local_name */
T0* T129f54(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INFIX_NAME.object_test_local_name */
T0* T894f14(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_PREFIX_FREE_NAME.object_test_local_name */
T0* T893f17(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_PREFIX_NAME.object_test_local_name */
T0* T892f14(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_INFIX_FREE_NAME.object_test_local_name */
T0* T645f17(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_IDENTIFIER.object_test_local_name */
T0* T129f55(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INFIX_NAME.hash_code */
T6 T894f29(T0* C)
{
	T6 R = 0;
	R = ((T6)(((T894*)(C))->a3));
	return R;
}

/* ET_PREFIX_NAME.hash_code */
T6 T892f26(T0* C)
{
	T6 R = 0;
	R = ((T6)(((T892*)(C))->a3));
	return R;
}

/* ET_INFIX_NAME.first_leaf */
T0* T894f70(T0* C)
{
	T0* R = 0;
	R = ((T894*)(C))->a1;
	return R;
}

/* ET_PREFIX_FREE_NAME.first_leaf */
T0* T893f59(T0* C)
{
	T0* R = 0;
	R = ((T893*)(C))->a1;
	return R;
}

/* ET_PREFIX_NAME.first_leaf */
T0* T892f56(T0* C)
{
	T0* R = 0;
	R = ((T892*)(C))->a1;
	return R;
}

/* ET_INFIX_FREE_NAME.first_leaf */
T0* T645f59(T0* C)
{
	T0* R = 0;
	R = ((T645*)(C))->a1;
	return R;
}

/* ET_IDENTIFIER.first_leaf */
T0* T129f91(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INFIX_NAME.is_argument */
T1 T894f9(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_FREE_NAME.is_argument */
T1 T893f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_argument */
T1 T892f9(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_FREE_NAME.is_argument */
T1 T645f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_argument */
T1 T129f25(T0* C)
{
	T1 R = 0;
	R = ((((T129*)(C))->a5)==((T2)('a')));
	return R;
}

/* ET_INFIX_NAME.is_local */
T1 T894f11(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_FREE_NAME.is_local */
T1 T893f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_local */
T1 T892f11(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_FREE_NAME.is_local */
T1 T645f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_local */
T1 T129f27(T0* C)
{
	T1 R = 0;
	R = ((((T129*)(C))->a5)==((T2)('l')));
	return R;
}

/* ET_INFIX_NAME.is_object_test_local */
T1 T894f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_FREE_NAME.is_object_test_local */
T1 T893f16(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_object_test_local */
T1 T892f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_FREE_NAME.is_object_test_local */
T1 T645f16(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_object_test_local */
T1 T129f9(T0* C)
{
	T1 R = 0;
	R = ((((T129*)(C))->a5)==((T2)('m')));
	return R;
}

/* ET_INFIX_NAME.same_feature_name */
T1 T894f8(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T894f35(C));
		t1 = (T79f1(GE_void(t2), C, a1));
		if (t1) {
			R = (T894f27(C, a1));
		}
	}
	return R;
}

/* ET_PREFIX_FREE_NAME.same_feature_name */
T1 T893f11(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T893f38(C));
		t1 = (T79f1(GE_void(t2), C, a1));
		if (t1) {
			R = (T893f31(C, a1));
		}
	}
	return R;
}

/* ET_PREFIX_NAME.same_feature_name */
T1 T892f8(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T892f32(C));
		t1 = (T79f1(GE_void(t2), C, a1));
		if (t1) {
			R = (T892f24(C, a1));
		}
	}
	return R;
}

/* ET_INFIX_FREE_NAME.same_feature_name */
T1 T645f11(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T645f34(C));
		t1 = (T79f1(GE_void(t2), C, a1));
		if (t1) {
			R = (T645f27(C, a1));
		}
	}
	return R;
}

/* ET_IDENTIFIER.same_feature_name */
T1 T129f47(T0* C, T0* a1)
{
	T1 t1;
	T6 t2;
	T0* t3;
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		if ((a1)==EIF_VOID) {
			l1 = EIF_VOID;
		} else {
			switch (((T0*)(a1))->id) {
			case 129:
				l1 = a1;
				break;
			default:
				l1 = EIF_VOID;
			}
		}
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t2 = (((T129*)(GE_void(l1)))->a3);
			t1 = ((((T129*)(C))->a3)==(t2));
			if (t1) {
				l2 = (((T129*)(GE_void(l1)))->a4);
				t1 = ((l2)==(((T129*)(C))->a4));
				if (t1) {
					R = EIF_TRUE;
				} else {
					t3 = (T129f8(C));
					R = (T26f12(GE_void(t3), ((T129*)(C))->a4, l2));
				}
			}
		}
	}
	return R;
}

/* ET_INFIX_NAME.is_tuple_label */
T1 T894f25(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_FREE_NAME.is_tuple_label */
T1 T893f29(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_tuple_label */
T1 T892f22(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_FREE_NAME.is_tuple_label */
T1 T645f25(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_tuple_label */
T1 T129f31(T0* C)
{
	T1 R = 0;
	R = ((((T129*)(C))->a5)==((T2)('t')));
	return R;
}

/* ET_INFIX_NAME.position */
T0* T894f16(T0* C)
{
	T1 t1;
	T0* R = 0;
	R = (T628f9(GE_void(((T894*)(C))->a1)));
	t1 = (T292x6699(GE_void(R)));
	if (t1) {
		R = (T242x6600(GE_void(((T894*)(C))->a2)));
	}
	return R;
}

/* ET_PREFIX_FREE_NAME.position */
T0* T893f19(T0* C)
{
	T1 t1;
	T0* R = 0;
	R = (T628f9(GE_void(((T893*)(C))->a1)));
	t1 = (T292x6699(GE_void(R)));
	if (t1) {
		R = (T242x6600(GE_void(((T893*)(C))->a2)));
	}
	return R;
}

/* ET_PREFIX_NAME.position */
T0* T892f16(T0* C)
{
	T1 t1;
	T0* R = 0;
	R = (T628f9(GE_void(((T892*)(C))->a1)));
	t1 = (T292x6699(GE_void(R)));
	if (t1) {
		R = (T242x6600(GE_void(((T892*)(C))->a2)));
	}
	return R;
}

/* ET_INFIX_FREE_NAME.position */
T0* T645f19(T0* C)
{
	T1 t1;
	T0* R = 0;
	R = (T628f9(GE_void(((T645*)(C))->a1)));
	t1 = (T292x6699(GE_void(R)));
	if (t1) {
		R = (T242x6600(GE_void(((T645*)(C))->a2)));
	}
	return R;
}

/* ET_IDENTIFIER.position */
T0* T129f51(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INFIX_NAME.lower_name */
T0* T894f26(T0* C)
{
	T0* R = 0;
	R = (T894f28(C));
	return R;
}

/* ET_PREFIX_FREE_NAME.lower_name */
T0* T893f30(T0* C)
{
	T1 t1;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T2 l3 = 0;
	R = (T893f32(C));
	l2 = (((T17*)(GE_void(R)))->a2);
	l1 = (T6)(GE_int32(1));
	while (1) {
		t1 = (T6f1(&l1, l2));
		if (t1) {
			break;
		}
		l3 = (T17f10(GE_void(R), l1));
		t1 = (T2f4(&l3, (T2)('A')));
		if (t1) {
			t1 = (T2f8(&l3, (T2)('Z')));
		}
		if (t1) {
			R = (T17f26(GE_void(R)));
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* ET_PREFIX_NAME.lower_name */
T0* T892f23(T0* C)
{
	T0* R = 0;
	R = (T892f25(C));
	return R;
}

/* ET_INFIX_FREE_NAME.lower_name */
T0* T645f26(T0* C)
{
	T1 t1;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T2 l3 = 0;
	R = (T645f28(C));
	l2 = (((T17*)(GE_void(R)))->a2);
	l1 = (T6)(GE_int32(1));
	while (1) {
		t1 = (T6f1(&l1, l2));
		if (t1) {
			break;
		}
		l3 = (T17f10(GE_void(R), l1));
		t1 = (T2f4(&l3, (T2)('A')));
		if (t1) {
			t1 = (T2f8(&l3, (T2)('Z')));
		}
		if (t1) {
			R = (T17f26(GE_void(R)));
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* ET_IDENTIFIER.lower_name */
T0* T129f24(T0* C)
{
	T1 t1;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T2 l3 = 0;
	R = ((T129*)(C))->a4;
	l2 = (((((T0*)(GE_void(R)))->id==17)?((T17*)(R))->a2:((T636*)(R))->a1));
	l1 = (T6)(GE_int32(1));
	while (1) {
		t1 = (T6f1(&l1, l2));
		if (t1) {
			break;
		}
		l3 = (((((T0*)(GE_void(R)))->id==17)?T17f10(R, l1):T636f7(R, l1)));
		t1 = (T2f4(&l3, (T2)('A')));
		if (t1) {
			t1 = (T2f8(&l3, (T2)('Z')));
		}
		if (t1) {
			R = (((((T0*)(GE_void(R)))->id==17)?T17f26(R):T636f21(R)));
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* ET_INFIX_NAME.name */
T0* T894f28(T0* C)
{
	T0* t1;
	T0* R = 0;
	switch (((T894*)(C))->a3) {
	case (T2)(T2)('\001'):
		t1 = (T894f5(C));
		R = (ge805ov13384);
		break;
	case (T2)(T2)('\021'):
		t1 = (T894f5(C));
		R = (ge805ov13400);
		break;
	case (T2)(T2)('\005'):
		t1 = (T894f5(C));
		R = (ge805ov13388);
		break;
	case (T2)(T2)('\006'):
		t1 = (T894f5(C));
		R = (ge805ov13389);
		break;
	case (T2)(T2)('\007'):
		t1 = (T894f5(C));
		R = (ge805ov13390);
		break;
	case (T2)(T2)('\010'):
		t1 = (T894f5(C));
		R = (ge805ov13391);
		break;
	case (T2)(T2)('\002'):
		t1 = (T894f5(C));
		R = (ge805ov13385);
		break;
	case (T2)(T2)('\t'):
		t1 = (T894f5(C));
		R = (ge805ov13392);
		break;
	case (T2)(T2)('\n'):
		t1 = (T894f5(C));
		R = (ge805ov13393);
		break;
	case (T2)(T2)('\013'):
		t1 = (T894f5(C));
		R = (ge805ov13394);
		break;
	case (T2)(T2)('\014'):
		t1 = (T894f5(C));
		R = (ge805ov13395);
		break;
	case (T2)(T2)('\003'):
		t1 = (T894f5(C));
		R = (ge805ov13386);
		break;
	case (T2)(T2)('\022'):
		t1 = (T894f5(C));
		R = (ge805ov13401);
		break;
	case (T2)(T2)('\r'):
		t1 = (T894f5(C));
		R = (ge805ov13396);
		break;
	case (T2)(T2)('\016'):
		t1 = (T894f5(C));
		R = (ge805ov13397);
		break;
	case (T2)(T2)('\017'):
		t1 = (T894f5(C));
		R = (ge805ov13398);
		break;
	case (T2)(T2)('\004'):
		t1 = (T894f5(C));
		R = (ge805ov13387);
		break;
	default:
		t1 = (T894f5(C));
		R = (ge805ov13363);
		break;
	}
	return R;
}

/* ET_PREFIX_FREE_NAME.name */
T0* T893f32(T0* C)
{
	T0* t1;
	T6 t2;
	T0* R = 0;
	t1 = (T893f8(C));
	t2 = (((((T0*)(GE_void(t1)))->id==17)?((T17*)(t1))->a2:((T636*)(t1))->a1));
	t2 = ((T6)((t2)+((T6)(GE_int32(9)))));
	R = T17c36(t2);
	T17f41(GE_void(R), ge845ov27916);
	t1 = (T893f8(C));
	T17f41(GE_void(R), t1);
	T17f39(GE_void(R), (T2)('\"'));
	return R;
}

/* ET_PREFIX_NAME.name */
T0* T892f25(T0* C)
{
	T0* t1;
	T0* R = 0;
	switch (((T892*)(C))->a3) {
	case (T2)(T2)('?'):
		t1 = (T892f5(C));
		R = (ge805ov13403);
		break;
	case (T2)(T2)('@'):
		t1 = (T892f5(C));
		R = (ge805ov13404);
		break;
	case (T2)(T2)('>'):
		t1 = (T892f5(C));
		R = (ge805ov13402);
		break;
	default:
		t1 = (T892f5(C));
		R = (ge805ov13363);
		break;
	}
	return R;
}

/* ET_INFIX_FREE_NAME.name */
T0* T645f28(T0* C)
{
	T0* t1;
	T6 t2;
	T0* R = 0;
	t1 = (T645f8(C));
	t2 = (((((T0*)(GE_void(t1)))->id==17)?((T17*)(t1))->a2:((T636*)(t1))->a1));
	t2 = ((T6)((t2)+((T6)(GE_int32(8)))));
	R = T17c36(t2);
	T17f41(GE_void(R), ge834ov25856);
	t1 = (T645f8(C));
	T17f41(GE_void(R), t1);
	T17f39(GE_void(R), (T2)('\"'));
	return R;
}

/* ET_INFIX_NAME.last_leaf */
T0* T894f69(T0* C)
{
	T0* R = 0;
	R = ((T894*)(C))->a2;
	return R;
}

/* ET_PREFIX_FREE_NAME.last_leaf */
T0* T893f58(T0* C)
{
	T0* R = 0;
	R = ((T893*)(C))->a2;
	return R;
}

/* ET_PREFIX_NAME.last_leaf */
T0* T892f55(T0* C)
{
	T0* R = 0;
	R = ((T892*)(C))->a2;
	return R;
}

/* ET_INFIX_FREE_NAME.last_leaf */
T0* T645f58(T0* C)
{
	T0* R = 0;
	R = ((T645*)(C))->a2;
	return R;
}

/* ET_IDENTIFIER.last_leaf */
T0* T129f89(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_FEATURE.same_base_type */
T1 T812f27(T0* C, T0* a1, T0* a2, T0* a3)
{
	T0* t1;
	T1 t2;
	T1 R = 0;
	t1 = (T812f20(C));
	t1 = (T160f2(GE_void(t1)));
	t2 = ((((T812*)(C))->a1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T173x6581T0T0T0(GE_void(a1), C, a3, a2));
		}
	}
	return R;
}

/* ET_BIT_N.same_base_type */
T1 T811f29(T0* C, T0* a1, T0* a2, T0* a3)
{
	T0* t1;
	T1 t2;
	T1 R = 0;
	t1 = (T811f25(C));
	t1 = (T160f2(GE_void(t1)));
	t2 = ((((T811*)(C))->a4)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T173x6581T0T0T0(GE_void(a1), C, a3, a2));
		}
	}
	return R;
}

/* ET_TUPLE_TYPE.same_base_type */
T1 T185f17(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = ((a1)==(C));
	if (t1) {
		t2 = ((a2)==(a3));
		if (!(t2)) {
			t2 = (T185f12(C));
			t1 = ((T1)(!(t2)));
		} else {
			t1 = EIF_TRUE;
		}
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T173x6584T0T0T0(GE_void(a1), C, a3, a2));
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_base_type */
T1 T178f17(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = (T60f66(GE_void(((T178*)(C))->a1)));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = ((a1)==(C));
		if (t1) {
			t2 = ((a2)==(a3));
			if (!(t2)) {
				t2 = (T178f11(C));
				t1 = ((T1)(!(t2)));
			} else {
				t1 = EIF_TRUE;
			}
		}
		if (t1) {
			R = EIF_TRUE;
		} else {
			R = (T173x6582T0T0T0(GE_void(a1), C, a3, a2));
		}
	}
	return R;
}

/* ET_CLASS_TYPE.same_base_type */
T1 T176f22(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = (T60f66(GE_void(((T176*)(C))->a3)));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = ((a1)==(C));
		if (t1) {
			t2 = ((a2)==(a3));
			if (!(t2)) {
				t2 = (T176f4(C));
				t1 = ((T1)(!(t2)));
			} else {
				t1 = EIF_TRUE;
			}
		}
		if (t1) {
			R = EIF_TRUE;
		} else {
			R = (T173x6582T0T0T0(GE_void(a1), C, a3, a2));
		}
	}
	return R;
}

/* ET_CLASS.same_base_type */
T1 T60f79(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = (T60f66(GE_void(((T60*)(C))->a10)));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = ((a1)==(C));
		if (t1) {
			t2 = ((a2)==(a3));
			if (!(t2)) {
				t2 = (T60f57(C));
				t1 = ((T1)(!(t2)));
			} else {
				t1 = EIF_TRUE;
			}
		}
		if (t1) {
			R = EIF_TRUE;
		} else {
			R = (T173x6582T0T0T0(GE_void(a1), C, a3, a2));
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.is_expanded */
T1 T178f13(T0* C)
{
	T1 t1;
	T1 R = 0;
	t1 = ((((T178*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		R = (T183x6677(GE_void(((T178*)(C))->a3)));
	} else {
		R = (T60f68(GE_void(((T178*)(C))->a1)));
	}
	return R;
}

/* ET_CLASS_TYPE.is_expanded */
T1 T176f19(T0* C)
{
	T1 t1;
	T1 R = 0;
	t1 = ((((T176*)(C))->a1)!=(EIF_VOID));
	if (t1) {
		R = (T183x6677(GE_void(((T176*)(C))->a1)));
	} else {
		R = (T60f68(GE_void(((T176*)(C))->a3)));
	}
	return R;
}

/* ET_CLASS.is_expanded */
T1 T60f68(T0* C)
{
	T1 R = 0;
	R = (T60f58(C));
	return R;
}

/* ET_CLASS.has_expanded_mark */
T1 T60f58(T0* C)
{
	T1 t1;
	T1 R = 0;
	t1 = ((((T60*)(C))->a11)!=(EIF_VOID));
	if (t1) {
		R = (T628f10(GE_void(((T60*)(C))->a11)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_syntactical_type */
T1 T178f52(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = (T60f66(GE_void(((T178*)(C))->a1)));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = ((a1)==(C));
		if (t1) {
			t2 = ((a2)==(a3));
			if (!(t2)) {
				t2 = (T178f11(C));
				t1 = ((T1)(!(t2)));
			} else {
				t1 = EIF_TRUE;
			}
		}
		if (t1) {
			R = EIF_TRUE;
		} else {
			R = (T173x6572T0T0T0(GE_void(a1), C, a3, a2));
		}
	}
	return R;
}

/* ET_CLASS_TYPE.same_syntactical_type */
T1 T176f51(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = (T60f66(GE_void(((T176*)(C))->a3)));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = ((a1)==(C));
		if (t1) {
			t2 = ((a2)==(a3));
			if (!(t2)) {
				t2 = (T176f4(C));
				t1 = ((T1)(!(t2)));
			} else {
				t1 = EIF_TRUE;
			}
		}
		if (t1) {
			R = EIF_TRUE;
		} else {
			R = (T173x6572T0T0T0(GE_void(a1), C, a3, a2));
		}
	}
	return R;
}

/* ET_CLASS.same_syntactical_type */
T1 T60f117(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = (T60f66(GE_void(((T60*)(C))->a10)));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = ((a1)==(C));
		if (t1) {
			t2 = ((a2)==(a3));
			if (!(t2)) {
				t2 = (T60f57(C));
				t1 = ((T1)(!(t2)));
			} else {
				t1 = EIF_TRUE;
			}
		}
		if (t1) {
			R = EIF_TRUE;
		} else {
			R = (T173x6572T0T0T0(GE_void(a1), C, a3, a2));
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.resolved_formal_parameters */
T0* T178f15(T0* C, T0* a1)
{
	T1 t1;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	R = C;
	l1 = ((T178*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		l2 = (((((T0*)(GE_void(l1)))->id==177)?T177f13(l1, a1):T498f9(l1, a1)));
		t1 = ((l2)!=(l1));
		if (t1) {
			l3 = T178c81(((T178*)(C))->a3, ((T178*)(C))->a4, l2, ((T178*)(C))->a1);
			T178f82(GE_void(l3), C);
			R = l3;
		}
	}
	return R;
}

/* ET_FORMAL_PARAMETER_LIST.resolved_formal_parameters */
T0* T498f9(T0* C, T0* a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CLASS_TYPE.resolved_formal_parameters */
T0* T176f20(T0* C, T0* a1)
{
	T1 t1;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	R = C;
	l1 = (T176f5(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		l2 = ((GE_void(l1), a1, (T0*)0));
		t1 = ((l2)!=(l1));
		if (t1) {
			l3 = T178c81(((T176*)(C))->a1, ((T176*)(C))->a2, l2, ((T176*)(C))->a3);
			T178f82(GE_void(l3), C);
			R = l3;
		}
	}
	return R;
}

/* ET_CLASS.resolved_formal_parameters */
T0* T60f53(T0* C, T0* a1)
{
	T1 t1;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	R = C;
	l1 = ((T60*)(C))->a3;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		l2 = (T498f9(GE_void(l1), a1));
		t1 = ((l2)!=(l1));
		if (t1) {
			l3 = T178c81(((T60*)(C))->a11, ((T60*)(C))->a8, l2, ((T60*)(C))->a10);
			T178f82(GE_void(l3), C);
			R = l3;
		}
	}
	return R;
}

/* ET_BIT_FEATURE.unaliased_to_text */
T0* T812f16(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T812f87(C, R);
	return R;
}

/* ET_BIT_N.unaliased_to_text */
T0* T811f20(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T811f87(C, R);
	return R;
}

/* ET_TUPLE_TYPE.unaliased_to_text */
T0* T185f6(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T185f81(C, R);
	return R;
}

/* ET_GENERIC_CLASS_TYPE.unaliased_to_text */
T0* T178f7(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T178f83(C, R);
	return R;
}

/* ET_CLASS_TYPE.unaliased_to_text */
T0* T176f16(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T176f81(C, R);
	return R;
}

/* ET_CLASS.unaliased_to_text */
T0* T60f56(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T60f156(C, R);
	return R;
}

/* ET_GENERIC_CLASS_TYPE.position */
T0* T178f44(T0* C)
{
	T1 t1;
	T0* R = 0;
	t1 = ((((T178*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		R = (T183x6600(GE_void(((T178*)(C))->a3)));
	} else {
		R = (T129f51(GE_void(((T178*)(C))->a4)));
	}
	return R;
}

/* ET_CLASS_TYPE.position */
T0* T176f43(T0* C)
{
	T1 t1;
	T0* R = 0;
	t1 = ((((T176*)(C))->a1)!=(EIF_VOID));
	if (t1) {
		R = (T183x6600(GE_void(((T176*)(C))->a1)));
	} else {
		R = (T129f51(GE_void(((T176*)(C))->a2)));
	}
	return R;
}

/* ET_CLASS.position */
T0* T60f115(T0* C)
{
	T1 t1;
	T0* R = 0;
	t1 = ((((T60*)(C))->a35)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(((T60*)(C))->a35), (T0*)0));
	} else {
		t1 = ((((T60*)(C))->a11)!=(EIF_VOID));
		if (t1) {
			R = (T628f9(GE_void(((T60*)(C))->a11)));
		} else {
			R = (T628f9(GE_void(((T60*)(C))->a15)));
		}
	}
	return R;
}

/* ET_BIT_FEATURE.conforms_to_type */
T1 T812f8(T0* C, T0* a1, T0* a2, T0* a3)
{
	T0* t1;
	T1 t2;
	T1 R = 0;
	t1 = (T812f20(C));
	t1 = (T160f2(GE_void(t1)));
	t2 = ((((T812*)(C))->a1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T173x6586T0T0T0(GE_void(a1), C, a3, a2));
		}
	}
	return R;
}

/* ET_BIT_N.conforms_to_type */
T1 T811f13(T0* C, T0* a1, T0* a2, T0* a3)
{
	T0* t1;
	T1 t2;
	T1 R = 0;
	t1 = (T811f25(C));
	t1 = (T160f2(GE_void(t1)));
	t2 = ((((T811*)(C))->a4)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T173x6586T0T0T0(GE_void(a1), C, a3, a2));
		}
	}
	return R;
}

/* ET_TUPLE_TYPE.conforms_to_type */
T1 T185f9(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = ((a1)==(C));
	if (t1) {
		t2 = ((a2)==(a3));
		if (!(t2)) {
			t2 = (T185f12(C));
			t1 = ((T1)(!(t2)));
		} else {
			t1 = EIF_TRUE;
		}
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T173x6589T0T0T0(GE_void(a1), C, a3, a2));
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.conforms_to_type */
T1 T178f8(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = (T60f66(GE_void(((T178*)(C))->a1)));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = ((a1)==(C));
		if (t1) {
			t2 = ((a2)==(a3));
			if (!(t2)) {
				t2 = (T178f11(C));
				t1 = ((T1)(!(t2)));
			} else {
				t1 = EIF_TRUE;
			}
		}
		if (t1) {
			R = EIF_TRUE;
		} else {
			R = (T173x6587T0T0T0(GE_void(a1), C, a3, a2));
		}
	}
	return R;
}

/* ET_CLASS_TYPE.conforms_to_type */
T1 T176f10(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = (T60f66(GE_void(((T176*)(C))->a3)));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = ((a1)==(C));
		if (t1) {
			t2 = ((a2)==(a3));
			if (!(t2)) {
				t2 = (T176f4(C));
				t1 = ((T1)(!(t2)));
			} else {
				t1 = EIF_TRUE;
			}
		}
		if (t1) {
			R = EIF_TRUE;
		} else {
			R = (T173x6587T0T0T0(GE_void(a1), C, a3, a2));
		}
	}
	return R;
}

/* ET_CLASS.conforms_to_type */
T1 T60f70(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = (T60f66(GE_void(((T60*)(C))->a10)));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = ((a1)==(C));
		if (t1) {
			t2 = ((a2)==(a3));
			if (!(t2)) {
				t2 = (T60f57(C));
				t1 = ((T1)(!(t2)));
			} else {
				t1 = EIF_TRUE;
			}
		}
		if (t1) {
			R = EIF_TRUE;
		} else {
			R = (T173x6587T0T0T0(GE_void(a1), C, a3, a2));
		}
	}
	return R;
}

/* ET_BIT_FEATURE.actual_parameters */
T0* T812f24(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_BIT_N.actual_parameters */
T0* T811f27(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_CLASS_TYPE.actual_parameters */
T0* T176f5(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_BIT_FEATURE.context_same_named_type */
T1 T812f52(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T812f34(C, a1, a2, C));
	return R;
}

/* ET_BIT_N.context_same_named_type */
T1 T811f51(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T811f34(C, a1, a2, C));
	return R;
}

/* ET_TUPLE_TYPE.context_same_named_type */
T1 T185f47(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T185f29(C, a1, a2, C));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_same_named_type */
T1 T178f46(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T178f29(C, a1, a2, C));
	return R;
}

/* ET_CLASS_TYPE.context_same_named_type */
T1 T176f48(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T176f28(C, a1, a2, C));
	return R;
}

/* ET_CLASS.context_same_named_type */
T1 T60f98(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T60f93(C, a1, a2, C));
	return R;
}

/* ET_BIT_FEATURE.context_named_type */
T0* T812f43(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_N.context_named_type */
T0* T811f43(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_TUPLE_TYPE.context_named_type */
T0* T185f38(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_named_type */
T0* T178f38(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CLASS_TYPE.context_named_type */
T0* T176f37(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CLASS.context_named_type */
T0* T60f103(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_FEATURE.context_same_named_formal_parameter_type */
T1 T812f66(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T812f53(C, a1, a2, C));
	return R;
}

/* ET_BIT_N.context_same_named_formal_parameter_type */
T1 T811f65(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T811f52(C, a1, a2, C));
	return R;
}

/* ET_TUPLE_TYPE.context_same_named_formal_parameter_type */
T1 T185f60(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T185f43(C, a1, a2, C));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_same_named_formal_parameter_type */
T1 T178f64(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T178f47(C, a1, a2, C));
	return R;
}

/* ET_CLASS_TYPE.context_same_named_formal_parameter_type */
T1 T176f60(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T176f49(C, a1, a2, C));
	return R;
}

/* ET_CLASS.context_same_named_formal_parameter_type */
T1 T60f129(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T60f109(C, a1, a2, C));
	return R;
}

/* ET_BIT_FEATURE.context_base_type_actual_count */
T6 T812f44(T0* C)
{
	T6 R = 0;
	R = (T812f62(C, C));
	return R;
}

/* ET_BIT_N.context_base_type_actual_count */
T6 T811f44(T0* C)
{
	T6 R = 0;
	R = (T811f61(C, C));
	return R;
}

/* ET_TUPLE_TYPE.context_base_type_actual_count */
T6 T185f39(T0* C)
{
	T6 R = 0;
	R = (T185f51(C, C));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_base_type_actual_count */
T6 T178f39(T0* C)
{
	T6 R = 0;
	R = (T178f48(C, C));
	return R;
}

/* ET_CLASS_TYPE.context_base_type_actual_count */
T6 T176f38(T0* C)
{
	T6 R = 0;
	R = (T176f44(C, C));
	return R;
}

/* ET_CLASS.context_base_type_actual_count */
T6 T60f104(T0* C)
{
	T6 R = 0;
	R = (T60f112(C, C));
	return R;
}

/* ET_BIT_FEATURE.context_base_type_actual */
T0* T812f45(T0* C, T6 a1)
{
	T0* R = 0;
	R = (T812f63(C, a1, C));
	return R;
}

/* ET_BIT_N.context_base_type_actual */
T0* T811f45(T0* C, T6 a1)
{
	T0* R = 0;
	R = (T811f62(C, a1, C));
	return R;
}

/* ET_TUPLE_TYPE.context_base_type_actual */
T0* T185f40(T0* C, T6 a1)
{
	T0* R = 0;
	R = (T185f52(C, a1, C));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_base_type_actual */
T0* T178f40(T0* C, T6 a1)
{
	T0* R = 0;
	R = (T178f49(C, a1, C));
	return R;
}

/* ET_CLASS_TYPE.context_base_type_actual */
T0* T176f39(T0* C, T6 a1)
{
	T0* R = 0;
	R = (T176f45(C, a1, C));
	return R;
}

/* ET_CLASS.context_base_type_actual */
T0* T60f105(T0* C, T6 a1)
{
	T0* R = 0;
	R = (T60f113(C, a1, C));
	return R;
}

/* ET_BIT_FEATURE.context_same_named_class_type */
T1 T812f65(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T812f51(C, a1, a2, C));
	return R;
}

/* ET_BIT_N.context_same_named_class_type */
T1 T811f64(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T811f50(C, a1, a2, C));
	return R;
}

/* ET_TUPLE_TYPE.context_same_named_class_type */
T1 T185f59(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T185f44(C, a1, a2, C));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_same_named_class_type */
T1 T178f63(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T178f45(C, a1, a2, C));
	return R;
}

/* ET_CLASS_TYPE.context_same_named_class_type */
T1 T176f59(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T176f47(C, a1, a2, C));
	return R;
}

/* ET_CLASS.context_same_named_class_type */
T1 T60f128(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T60f111(C, a1, a2, C));
	return R;
}

/* ET_BIT_FEATURE.context_same_named_tuple_type */
T1 T812f67(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T812f56(C, a1, a2, C));
	return R;
}

/* ET_BIT_N.context_same_named_tuple_type */
T1 T811f66(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T811f55(C, a1, a2, C));
	return R;
}

/* ET_TUPLE_TYPE.context_same_named_tuple_type */
T1 T185f61(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T185f50(C, a1, a2, C));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_same_named_tuple_type */
T1 T178f66(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T178f53(C, a1, a2, C));
	return R;
}

/* ET_CLASS_TYPE.context_same_named_tuple_type */
T1 T176f61(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T176f52(C, a1, a2, C));
	return R;
}

/* ET_CLASS.context_same_named_tuple_type */
T1 T60f131(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T60f118(C, a1, a2, C));
	return R;
}

/* ET_BIT_FEATURE.context_same_named_bit_type */
T1 T812f68(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T812f61(C, a1, a2, C));
	return R;
}

/* ET_BIT_N.context_same_named_bit_type */
T1 T811f67(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T811f60(C, a1, a2, C));
	return R;
}

/* ET_TUPLE_TYPE.context_same_named_bit_type */
T1 T185f62(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T185f57(C, a1, a2, C));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_same_named_bit_type */
T1 T178f67(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T178f59(C, a1, a2, C));
	return R;
}

/* ET_CLASS_TYPE.context_same_named_bit_type */
T1 T176f62(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T176f57(C, a1, a2, C));
	return R;
}

/* ET_CLASS.context_same_named_bit_type */
T1 T60f133(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T60f124(C, a1, a2, C));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.upper_name */
T0* T178f58(T0* C)
{
	T0* R = 0;
	R = (T129f23(GE_void(((T178*)(C))->a4)));
	return R;
}

/* ET_CLASS_TYPE.upper_name */
T0* T176f56(T0* C)
{
	T0* R = 0;
	R = (T129f23(GE_void(((T176*)(C))->a2)));
	return R;
}

/* ET_CLASS.upper_name */
T0* T60f69(T0* C)
{
	T0* R = 0;
	R = (T129f23(GE_void(((T60*)(C))->a8)));
	return R;
}

/* ET_BIT_FEATURE.actual_parameter_count */
T6 T812f60(T0* C)
{
	T1 t1;
	T6 R = 0;
	T0* l1 = 0;
	l1 = (T812f24(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), (T6)0));
	}
	return R;
}

/* ET_BIT_N.actual_parameter_count */
T6 T811f59(T0* C)
{
	T1 t1;
	T6 R = 0;
	T0* l1 = 0;
	l1 = (T811f27(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), (T6)0));
	}
	return R;
}

/* ET_TUPLE_TYPE.actual_parameter_count */
T6 T185f53(T0* C)
{
	T1 t1;
	T6 R = 0;
	T0* l1 = 0;
	l1 = ((T185*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((T177*)(GE_void(l1)))->a3);
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.actual_parameter_count */
T6 T178f50(T0* C)
{
	T1 t1;
	T6 R = 0;
	T0* l1 = 0;
	l1 = ((T178*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((((T0*)(GE_void(l1)))->id==177)?((T177*)(l1))->a3:((T498*)(l1))->a1));
	}
	return R;
}

/* ET_CLASS_TYPE.actual_parameter_count */
T6 T176f46(T0* C)
{
	T1 t1;
	T6 R = 0;
	T0* l1 = 0;
	l1 = (T176f5(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), (T6)0));
	}
	return R;
}

/* ET_CLASS.actual_parameter_count */
T6 T60f108(T0* C)
{
	T1 t1;
	T6 R = 0;
	T0* l1 = 0;
	l1 = ((T60*)(C))->a3;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((T498*)(GE_void(l1)))->a1);
	}
	return R;
}

/* ET_BIT_N.base_type_actual */
T0* T811f62(T0* C, T6 a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T0* R = 0;
	T0* l1 = 0;
	t1 = (T811f27(C));
	l1 = ((GE_void(t1), a1, (T0*)0));
	t2 = ((a2)==(C));
	if (t2) {
		R = l1;
	}
	t2 = ((R)==(EIF_VOID));
	if (t2) {
		R = ((GE_void(l1), a2, (T0*)0));
	}
	return R;
}

/* ET_TUPLE_TYPE.base_type_actual */
T0* T185f52(T0* C, T6 a1, T0* a2)
{
	T1 t1;
	T0* R = 0;
	T0* l1 = 0;
	l1 = (T177f7(GE_void(((T185*)(C))->a2), a1));
	t1 = ((a2)==(C));
	if (t1) {
		if ((l1)==EIF_VOID) {
			R = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 931:
			case 929:
				R = EIF_VOID;
				break;
			default:
				R = l1;
			}
		}
	}
	t1 = ((R)==(EIF_VOID));
	if (t1) {
		R = (T173x6550T0(GE_void(l1), a2));
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.base_type_actual */
T0* T178f49(T0* C, T6 a1, T0* a2)
{
	T1 t1;
	T0* R = 0;
	T0* l1 = 0;
	l1 = (((((T0*)(GE_void(((T178*)(C))->a2)))->id==177)?T177f7(((T178*)(C))->a2, a1):T498f14(((T178*)(C))->a2, a1)));
	t1 = ((a2)==(C));
	if (t1) {
		if ((l1)==EIF_VOID) {
			R = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 931:
			case 929:
				R = EIF_VOID;
				break;
			default:
				R = l1;
			}
		}
	}
	t1 = ((R)==(EIF_VOID));
	if (t1) {
		R = (T173x6550T0(GE_void(l1), a2));
	}
	return R;
}

/* ET_CLASS_TYPE.base_type_actual */
T0* T176f45(T0* C, T6 a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T0* R = 0;
	T0* l1 = 0;
	t1 = (T176f5(C));
	l1 = ((GE_void(t1), a1, (T0*)0));
	t2 = ((a2)==(C));
	if (t2) {
		R = l1;
	}
	t2 = ((R)==(EIF_VOID));
	if (t2) {
		R = ((GE_void(l1), a2, (T0*)0));
	}
	return R;
}

/* ET_CLASS.base_type_actual */
T0* T60f113(T0* C, T6 a1, T0* a2)
{
	T1 t1;
	T0* R = 0;
	T0* l1 = 0;
	l1 = (T498f14(GE_void(((T60*)(C))->a3), a1));
	t1 = ((a2)==(C));
	if (t1) {
		R = l1;
	}
	t1 = ((R)==(EIF_VOID));
	if (t1) {
		R = (((((T0*)(GE_void(l1)))->id==791)?T791f28(l1, a2):T799f33(l1, a2)));
	}
	return R;
}

/* ET_BIT_FEATURE.conforms_to_context */
T1 T812f83(T0* C, T0* a1)
{
	T0* t1;
	T1 R = 0;
	t1 = (T812f20(C));
	t1 = (T160f421(GE_void(t1)));
	R = (T812f42(C, t1, a1));
	return R;
}

/* ET_BIT_N.conforms_to_context */
T1 T811f82(T0* C, T0* a1)
{
	T0* t1;
	T1 R = 0;
	t1 = (T811f25(C));
	t1 = (T160f421(GE_void(t1)));
	R = (T811f42(C, t1, a1));
	return R;
}

/* ET_TUPLE_TYPE.conforms_to_context */
T1 T185f76(T0* C, T0* a1)
{
	T0* t1;
	T1 R = 0;
	t1 = (T185f14(C));
	t1 = (T160f421(GE_void(t1)));
	R = (T185f37(C, t1, a1));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.conforms_to_context */
T1 T178f77(T0* C, T0* a1)
{
	T0* t1;
	T1 R = 0;
	t1 = (T178f79(C));
	t1 = (T160f421(GE_void(t1)));
	R = (T178f37(C, t1, a1));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.tokens */
T0* T178f79(T0* C)
{
	T0* R = 0;
	if (ge800os2897) {
		return ge800ov2897;
	} else {
		ge800os2897 = '\1';
		ge800ov2897 = R;
	}
	R = T160c926();
	ge800ov2897 = R;
	return R;
}

/* ET_CLASS_TYPE.conforms_to_context */
T1 T176f76(T0* C, T0* a1)
{
	T0* t1;
	T1 R = 0;
	t1 = (T176f78(C));
	t1 = (T160f421(GE_void(t1)));
	R = (T176f36(C, t1, a1));
	return R;
}

/* ET_CLASS_TYPE.tokens */
T0* T176f78(T0* C)
{
	T0* R = 0;
	if (ge800os2897) {
		return ge800ov2897;
	} else {
		ge800os2897 = '\1';
		ge800ov2897 = R;
	}
	R = T160c926();
	ge800ov2897 = R;
	return R;
}

/* ET_CLASS.conforms_to_context */
T1 T60f148(T0* C, T0* a1)
{
	T0* t1;
	T1 R = 0;
	t1 = (T60f63(C));
	t1 = (T160f421(GE_void(t1)));
	R = (T60f102(C, t1, a1));
	return R;
}

/* ET_BIT_FEATURE.context_base_type_index_of_label */
T6 T812f78(T0* C, T0* a1)
{
	T6 R = 0;
	R = (T812f82(C, a1));
	return R;
}

/* ET_BIT_N.context_base_type_index_of_label */
T6 T811f77(T0* C, T0* a1)
{
	T6 R = 0;
	R = (T811f81(C, a1));
	return R;
}

/* ET_BIT_N.index_of_label */
T6 T811f81(T0* C, T0* a1)
{
	T1 t1;
	T6 R = 0;
	T0* l1 = 0;
	l1 = (T811f27(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), a1, (T6)0));
	}
	return R;
}

/* ET_TUPLE_TYPE.context_base_type_index_of_label */
T6 T185f73(T0* C, T0* a1)
{
	T6 R = 0;
	R = (T185f77(C, a1));
	return R;
}

/* ET_TUPLE_TYPE.index_of_label */
T6 T185f77(T0* C, T0* a1)
{
	T1 t1;
	T6 R = 0;
	T0* l1 = 0;
	l1 = ((T185*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (T177f22(GE_void(l1), a1));
	}
	return R;
}

/* ET_ACTUAL_PARAMETER_LIST.index_of_label */
T6 T177f22(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T6 R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	l3 = ((T6)((((T177*)(C))->a3)-((T6)(GE_int32(1)))));
	l2 = (T6)(GE_int32(0));
	while (1) {
		t1 = (T6f1(&l2, l3));
		if (t1) {
			break;
		}
		t2 = (((T504*)(GE_void(((T177*)(C))->a4)))->z2[l2]);
		l1 = (T181x6619(GE_void(t2)));
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t1 = (T129f37(GE_void(a1), l1));
		}
		if (t1) {
			R = ((T6)((((T177*)(C))->a3)-(l2)));
			l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
		} else {
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_base_type_index_of_label */
T6 T178f74(T0* C, T0* a1)
{
	T6 R = 0;
	R = (T178f78(C, a1));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.index_of_label */
T6 T178f78(T0* C, T0* a1)
{
	T1 t1;
	T6 R = 0;
	T0* l1 = 0;
	l1 = ((T178*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((((T0*)(GE_void(l1)))->id==177)?T177f22(l1, a1):T498f23(l1, a1)));
	}
	return R;
}

/* ET_FORMAL_PARAMETER_LIST.index_of_label */
T6 T498f23(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T6 R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	l3 = ((T6)((((T498*)(C))->a1)-((T6)(GE_int32(1)))));
	l2 = (T6)(GE_int32(0));
	while (1) {
		t1 = (T6f1(&l2, l3));
		if (t1) {
			break;
		}
		t2 = (((T794*)(GE_void(((T498*)(C))->a2)))->z2[l2]);
		l1 = (((((T0*)(GE_void(t2)))->id==791)?T791f58(t2):T799f59(t2)));
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t1 = (T129f37(GE_void(a1), l1));
		}
		if (t1) {
			R = ((T6)((((T498*)(C))->a1)-(l2)));
			l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
		} else {
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* ET_CLASS_TYPE.context_base_type_index_of_label */
T6 T176f73(T0* C, T0* a1)
{
	T6 R = 0;
	R = (T176f77(C, a1));
	return R;
}

/* ET_CLASS_TYPE.index_of_label */
T6 T176f77(T0* C, T0* a1)
{
	T1 t1;
	T6 R = 0;
	T0* l1 = 0;
	l1 = (T176f5(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), a1, (T6)0));
	}
	return R;
}

/* ET_CLASS.context_base_type_index_of_label */
T6 T60f143(T0* C, T0* a1)
{
	T6 R = 0;
	R = (T60f147(C, a1));
	return R;
}

/* ET_CLASS.index_of_label */
T6 T60f147(T0* C, T0* a1)
{
	T1 t1;
	T6 R = 0;
	T0* l1 = 0;
	l1 = ((T60*)(C))->a3;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (T498f23(GE_void(l1), a1));
	}
	return R;
}

/* ET_BIT_FEATURE.context_conforms_to_type */
T1 T812f42(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T812f8(C, a1, a2, C));
	return R;
}

/* ET_BIT_N.context_conforms_to_type */
T1 T811f42(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T811f13(C, a1, a2, C));
	return R;
}

/* ET_TUPLE_TYPE.context_conforms_to_type */
T1 T185f37(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T185f9(C, a1, a2, C));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_conforms_to_type */
T1 T178f37(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T178f8(C, a1, a2, C));
	return R;
}

/* ET_CLASS_TYPE.context_conforms_to_type */
T1 T176f36(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T176f10(C, a1, a2, C));
	return R;
}

/* ET_CLASS.context_conforms_to_type */
T1 T60f102(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T60f70(C, a1, a2, C));
	return R;
}

/* ET_BIT_FEATURE.context_conforms_from_bit_type */
T1 T812f41(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T812f7(C, a1, a2, C));
	return R;
}

/* ET_BIT_N.context_conforms_from_bit_type */
T1 T811f41(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T811f26(C, a1, a2, C));
	return R;
}

/* ET_TUPLE_TYPE.context_conforms_from_bit_type */
T1 T185f36(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T185f27(C, a1, a2, C));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_conforms_from_bit_type */
T1 T178f36(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T178f27(C, a1, a2, C));
	return R;
}

/* ET_CLASS_TYPE.context_conforms_from_bit_type */
T1 T176f35(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T176f26(C, a1, a2, C));
	return R;
}

/* ET_CLASS.context_conforms_from_bit_type */
T1 T60f101(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T60f91(C, a1, a2, C));
	return R;
}

/* ET_BIT_FEATURE.context_conforms_from_formal_parameter_type */
T1 T812f64(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T812f47(C, a1, a2, C));
	return R;
}

/* ET_BIT_N.context_conforms_from_formal_parameter_type */
T1 T811f63(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T811f47(C, a1, a2, C));
	return R;
}

/* ET_TUPLE_TYPE.context_conforms_from_formal_parameter_type */
T1 T185f58(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T185f42(C, a1, a2, C));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_conforms_from_formal_parameter_type */
T1 T178f62(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T178f42(C, a1, a2, C));
	return R;
}

/* ET_CLASS_TYPE.context_conforms_from_formal_parameter_type */
T1 T176f58(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T176f41(C, a1, a2, C));
	return R;
}

/* ET_CLASS.context_conforms_from_formal_parameter_type */
T1 T60f127(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T60f107(C, a1, a2, C));
	return R;
}

/* ET_BIT_FEATURE.context_conforms_from_tuple_type */
T1 T812f40(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T812f6(C, a1, a2, C));
	return R;
}

/* ET_BIT_N.context_conforms_from_tuple_type */
T1 T811f40(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T811f12(C, a1, a2, C));
	return R;
}

/* ET_TUPLE_TYPE.context_conforms_from_tuple_type */
T1 T185f35(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T185f13(C, a1, a2, C));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_conforms_from_tuple_type */
T1 T178f35(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T178f14(C, a1, a2, C));
	return R;
}

/* ET_CLASS_TYPE.context_conforms_from_tuple_type */
T1 T176f34(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T176f21(C, a1, a2, C));
	return R;
}

/* ET_CLASS.context_conforms_from_tuple_type */
T1 T60f100(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T60f64(C, a1, a2, C));
	return R;
}

/* ET_BIT_FEATURE.context_conforms_from_class_type */
T1 T812f39(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T812f31(C, a1, a2, C));
	return R;
}

/* ET_BIT_N.context_conforms_from_class_type */
T1 T811f39(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T811f11(C, a1, a2, C));
	return R;
}

/* ET_TUPLE_TYPE.context_conforms_from_class_type */
T1 T185f34(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T185f8(C, a1, a2, C));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_conforms_from_class_type */
T1 T178f34(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T178f12(C, a1, a2, C));
	return R;
}

/* ET_CLASS_TYPE.context_conforms_from_class_type */
T1 T176f33(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T176f9(C, a1, a2, C));
	return R;
}

/* ET_CLASS.context_conforms_from_class_type */
T1 T60f99(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T60f62(C, a1, a2, C));
	return R;
}

/* ET_BIT_FEATURE.context_is_type_reference */
T1 T812f80(T0* C)
{
	T1 R = 0;
	R = (T812f54(C, C));
	return R;
}

/* ET_BIT_N.context_is_type_reference */
T1 T811f79(T0* C)
{
	T1 R = 0;
	R = (T811f53(C, C));
	return R;
}

/* ET_TUPLE_TYPE.context_is_type_reference */
T1 T185f75(T0* C)
{
	T1 R = 0;
	R = (T185f48(C, C));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_is_type_reference */
T1 T178f76(T0* C)
{
	T1 R = 0;
	R = (T178f51(C, C));
	return R;
}

/* ET_CLASS_TYPE.context_is_type_reference */
T1 T176f75(T0* C)
{
	T1 R = 0;
	R = (T176f50(C, C));
	return R;
}

/* ET_CLASS.context_is_type_reference */
T1 T60f145(T0* C)
{
	T1 R = 0;
	R = (T60f116(C, C));
	return R;
}

/* ET_BIT_FEATURE.context_base_type */
T0* T812f35(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_N.context_base_type */
T0* T811f35(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_TUPLE_TYPE.context_base_type */
T0* T185f30(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_base_type */
T0* T178f30(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CLASS_TYPE.context_base_type */
T0* T176f29(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CLASS.context_base_type */
T0* T60f94(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_FEATURE.context_same_base_class_type */
T1 T812f36(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T812f12(C, a1, a2, C));
	return R;
}

/* ET_BIT_N.context_same_base_class_type */
T1 T811f36(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T811f17(C, a1, a2, C));
	return R;
}

/* ET_TUPLE_TYPE.context_same_base_class_type */
T1 T185f31(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T185f20(C, a1, a2, C));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_same_base_class_type */
T1 T178f31(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T178f20(C, a1, a2, C));
	return R;
}

/* ET_CLASS_TYPE.context_same_base_class_type */
T1 T176f30(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T176f14(C, a1, a2, C));
	return R;
}

/* ET_CLASS.context_same_base_class_type */
T1 T60f95(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T60f82(C, a1, a2, C));
	return R;
}

/* ET_BIT_FEATURE.context_same_base_tuple_type */
T1 T812f37(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T812f13(C, a1, a2, C));
	return R;
}

/* ET_BIT_N.context_same_base_tuple_type */
T1 T811f37(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T811f18(C, a1, a2, C));
	return R;
}

/* ET_TUPLE_TYPE.context_same_base_tuple_type */
T1 T185f32(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T185f22(C, a1, a2, C));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_same_base_tuple_type */
T1 T178f32(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T178f26(C, a1, a2, C));
	return R;
}

/* ET_CLASS_TYPE.context_same_base_tuple_type */
T1 T176f31(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T176f25(C, a1, a2, C));
	return R;
}

/* ET_CLASS.context_same_base_tuple_type */
T1 T60f96(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T60f88(C, a1, a2, C));
	return R;
}

/* ET_BIT_FEATURE.context_same_base_bit_type */
T1 T812f38(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T812f14(C, a1, a2, C));
	return R;
}

/* ET_BIT_N.context_same_base_bit_type */
T1 T811f38(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T811f30(C, a1, a2, C));
	return R;
}

/* ET_TUPLE_TYPE.context_same_base_bit_type */
T1 T185f33(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T185f28(C, a1, a2, C));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_same_base_bit_type */
T1 T178f33(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T178f28(C, a1, a2, C));
	return R;
}

/* ET_CLASS_TYPE.context_same_base_bit_type */
T1 T176f32(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T176f27(C, a1, a2, C));
	return R;
}

/* ET_CLASS.context_same_base_bit_type */
T1 T60f97(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T60f92(C, a1, a2, C));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.is_generic */
T1 T178f11(T0* C)
{
	T1 t1;
	T1 R = 0;
	T0* l1 = 0;
	l1 = ((T178*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		t1 = (((((T0*)(GE_void(l1)))->id==177)?T177f9(l1):T498f16(l1)));
		R = ((T1)(!(t1)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_CLASS_TYPE.is_generic */
T1 T176f4(T0* C)
{
	T1 t1;
	T1 R = 0;
	T0* l1 = 0;
	l1 = (T176f5(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		t1 = ((GE_void(l1), (T1)0));
		R = ((T1)(!(t1)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_CLASS.is_generic */
T1 T60f57(T0* C)
{
	T1 t1;
	T1 R = 0;
	T0* l1 = 0;
	l1 = ((T60*)(C))->a3;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		t1 = (T498f16(GE_void(l1)));
		R = ((T1)(!(t1)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_BIT_N.base_type_index_of_label */
T6 T811f78(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T811f81(C, a1));
	return R;
}

/* ET_TUPLE_TYPE.base_type_index_of_label */
T6 T185f74(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T185f77(C, a1));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.base_type_index_of_label */
T6 T178f75(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T178f78(C, a1));
	return R;
}

/* ET_CLASS_TYPE.base_type_index_of_label */
T6 T176f74(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T176f77(C, a1));
	return R;
}

/* ET_CLASS.base_type_index_of_label */
T6 T60f144(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T60f147(C, a1));
	return R;
}

/* ET_BIT_FEATURE.to_text */
T0* T812f25(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T812f89(C, R);
	return R;
}

/* ET_BIT_N.to_text */
T0* T811f8(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T811f88(C, R);
	return R;
}

/* ET_TUPLE_TYPE.to_text */
T0* T185f16(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T185f82(C, R);
	return R;
}

/* ET_GENERIC_CLASS_TYPE.to_text */
T0* T178f16(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T178f84(C, R);
	return R;
}

/* ET_CLASS_TYPE.to_text */
T0* T176f7(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T176f82(C, R);
	return R;
}

/* ET_CLASS.to_text */
T0* T60f78(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T60f202(C, R);
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.static_type */
T0* T246f47(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.static_type */
T0* T245f47(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.static_type */
T0* T240f45(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.static_type */
T0* T225f45(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DYNAMIC_TYPE.static_type */
T0* T161f31(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.hash_code */
T6 T246f55(T0* C)
{
	T6 R = 0;
	R = (T60f71(GE_void(((T246*)(C))->a6)));
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.hash_code */
T6 T245f56(T0* C)
{
	T6 R = 0;
	R = (T60f71(GE_void(((T245*)(C))->a6)));
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.hash_code */
T6 T240f54(T0* C)
{
	T6 R = 0;
	R = (T60f71(GE_void(((T240*)(C))->a6)));
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.hash_code */
T6 T225f54(T0* C)
{
	T6 R = 0;
	R = (T60f71(GE_void(((T225*)(C))->a6)));
	return R;
}

/* ET_DYNAMIC_TYPE.hash_code */
T6 T161f56(T0* C)
{
	T6 R = 0;
	R = (T60f71(GE_void(((T161*)(C))->a6)));
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.has_nested_reference_attributes */
T1 T246f56(T0* C)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	if (((T246*)(C))->a13) {
		R = EIF_TRUE;
	} else {
		((T246*)(C))->a13 = EIF_TRUE;
		l2 = ((T246*)(C))->a4;
		l1 = (T6)(GE_int32(1));
		while (1) {
			t1 = (T6f1(&l1, l2));
			if (t1) {
				break;
			}
			t2 = (T228f4(GE_void(((T246*)(C))->a5), l1));
			t2 = (((((T0*)(GE_void(t2)))->id==175)?((T175*)(t2))->a4:((T230*)(t2))->a10));
			l3 = (T179x13495(GE_void(t2)));
			t1 = (T161x13490(GE_void(l3)));
			if (t1) {
				t1 = (T161x13466(GE_void(l3)));
			}
			if (t1) {
				R = EIF_TRUE;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		((T246*)(C))->a13 = EIF_FALSE;
	}
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.has_nested_reference_attributes */
T1 T245f57(T0* C)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	if (((T245*)(C))->a14) {
		R = EIF_TRUE;
	} else {
		((T245*)(C))->a14 = EIF_TRUE;
		l2 = ((T245*)(C))->a4;
		l1 = (T6)(GE_int32(1));
		while (1) {
			t1 = (T6f1(&l1, l2));
			if (t1) {
				break;
			}
			t2 = (T228f4(GE_void(((T245*)(C))->a5), l1));
			t2 = (((((T0*)(GE_void(t2)))->id==175)?((T175*)(t2))->a4:((T230*)(t2))->a10));
			l3 = (T179x13495(GE_void(t2)));
			t1 = (T161x13490(GE_void(l3)));
			if (t1) {
				t1 = (T161x13466(GE_void(l3)));
			}
			if (t1) {
				R = EIF_TRUE;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		((T245*)(C))->a14 = EIF_FALSE;
	}
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.has_nested_reference_attributes */
T1 T240f55(T0* C)
{
	T0* t1;
	T1 t2;
	T1 R = 0;
	if (((T240*)(C))->a9) {
		R = EIF_TRUE;
	} else {
		((T240*)(C))->a9 = EIF_TRUE;
		t1 = (T179x13495(GE_void(((T240*)(C))->a8)));
		t2 = (T161x13466(GE_void(t1)));
		if (t2) {
			R = EIF_TRUE;
		}
		((T240*)(C))->a9 = EIF_FALSE;
	}
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.has_nested_reference_attributes */
T1 T225f55(T0* C)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	if (((T225*)(C))->a9) {
		R = EIF_TRUE;
	} else {
		((T225*)(C))->a9 = EIF_TRUE;
		l2 = (((T190*)(GE_void(((T225*)(C))->a8)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t1 = (T6f1(&l1, l2));
			if (t1) {
				break;
			}
			t2 = (T190f4(GE_void(((T225*)(C))->a8), l1));
			l3 = (T179x13495(GE_void(t2)));
			t1 = (T161x13490(GE_void(l3)));
			if (t1) {
				t1 = (T161x13466(GE_void(l3)));
			}
			if (t1) {
				R = EIF_TRUE;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		((T225*)(C))->a9 = EIF_FALSE;
	}
	return R;
}

/* ET_DYNAMIC_TYPE.has_nested_reference_attributes */
T1 T161f58(T0* C)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	if (((T161*)(C))->a12) {
		R = EIF_TRUE;
	} else {
		((T161*)(C))->a12 = EIF_TRUE;
		l2 = ((T161*)(C))->a4;
		l1 = (T6)(GE_int32(1));
		while (1) {
			t1 = (T6f1(&l1, l2));
			if (t1) {
				break;
			}
			t2 = (T228f4(GE_void(((T161*)(C))->a5), l1));
			t2 = (((((T0*)(GE_void(t2)))->id==175)?((T175*)(t2))->a4:((T230*)(t2))->a10));
			l3 = (T179x13495(GE_void(t2)));
			t1 = (T161x13490(GE_void(l3)));
			if (t1) {
				t1 = (T161x13466(GE_void(l3)));
			}
			if (t1) {
				R = EIF_TRUE;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		((T161*)(C))->a12 = EIF_FALSE;
	}
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.seeded_dynamic_query */
T0* T246f46(T0* C, T6 a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	t1 = (T246f50(C));
	t2 = ((((T246*)(C))->a5)==(t1));
	if (t2) {
		l3 = (T60f55(GE_void(((T246*)(C))->a6), a1));
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			t1 = (((T60*)(GE_void(((T246*)(C))->a6)))->a4);
			t3 = (((T186*)(GE_void(t1)))->a1);
			((T246*)(C))->a5 = T228c8(t3);
			R = (T246f54(C, l3, a2));
			t2 = (((((T0*)(GE_void(R)))->id==175)?T175f31(R, a2):T230f19(R, a2)));
			if (t2) {
				T246f73(C, R, a2);
			} else {
				T228f9(GE_void(((T246*)(C))->a5), R);
			}
		}
	} else {
		l2 = (((T228*)(GE_void(((T246*)(C))->a5)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t2 = (T6f1(&l1, l2));
			if (t2) {
				break;
			}
			l4 = (T228f4(GE_void(((T246*)(C))->a5), l1));
			t1 = (((((T0*)(GE_void(l4)))->id==175)?((T175*)(l4))->a1:((T230*)(l4))->a5));
			t2 = (T208x14342T6(GE_void(t1), a1));
			if (t2) {
				R = l4;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			l3 = (T60f55(GE_void(((T246*)(C))->a6), a1));
			t2 = ((l3)!=(EIF_VOID));
			if (t2) {
				R = (T246f54(C, l3, a2));
				t2 = (((((T0*)(GE_void(R)))->id==175)?T175f31(R, a2):T230f19(R, a2)));
				if (t2) {
					T246f73(C, R, a2);
				} else {
					T228f10(GE_void(((T246*)(C))->a5), R);
				}
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_FEATURE_LIST.force_last */
void T228f10(T0* C, T0* a1)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T6 l1 = 0;
	t1 = (T228f6(C));
	t2 = (T6f12(&(((T228*)(C))->a1), t1));
	if (t2) {
		t1 = (T228f6(C));
		t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
		l1 = ((T6)((t1)*((T6)(GE_int32(2)))));
		t2 = ((((T228*)(C))->a2)==(EIF_VOID));
		if (t2) {
			t3 = (T228f5(C));
			t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			((T228*)(C))->a2 = (T561f2(GE_void(t3), t1));
		} else {
			t3 = (T228f5(C));
			t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			((T228*)(C))->a2 = (T561f1(GE_void(t3), ((T228*)(C))->a2, t1));
		}
	}
	((T228*)(C))->a1 = ((T6)((((T228*)(C))->a1)+((T6)(GE_int32(1)))));
	((T556*)(GE_void(((T228*)(C))->a2)))->z2[((T228*)(C))->a1] = (a1);
}

/* ET_DYNAMIC_FEATURE_LIST.fixed_array */
unsigned char ge945os15168 = '\0';
T0* ge945ov15168;
T0* T228f5(T0* C)
{
	T0* R = 0;
	if (ge945os15168) {
		return ge945ov15168;
	} else {
		ge945os15168 = '\1';
		ge945ov15168 = R;
	}
	R = T561c3();
	ge945ov15168 = R;
	return R;
}

/* ET_DYNAMIC_FEATURE_LIST.capacity */
T6 T228f6(T0* C)
{
	T1 t1;
	T6 t2;
	T6 R = 0;
	t1 = ((((T228*)(C))->a2)!=(EIF_VOID));
	if (t1) {
		t2 = (((T556*)(GE_void(((T228*)(C))->a2)))->z1);
		R = ((T6)((t2)-((T6)(GE_int32(1)))));
	}
	return R;
}

/* ET_DYNAMIC_FEATURE_LIST.put_last */
void T228f9(T0* C, T0* a1)
{
	((T228*)(C))->a1 = ((T6)((((T228*)(C))->a1)+((T6)(GE_int32(1)))));
	((T556*)(GE_void(((T228*)(C))->a2)))->z2[((T228*)(C))->a1] = (a1);
}

/* ET_DYNAMIC_PROCEDURE_TYPE.put_attribute */
void T246f73(T0* C, T0* a1, T0* a2)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T0* l1 = 0;
	((T246*)(C))->a4 = ((T6)((((T246*)(C))->a4)+((T6)(GE_int32(1)))));
	t1 = (((T228*)(GE_void(((T246*)(C))->a5)))->a1);
	t2 = ((T1)((t1)<(((T246*)(C))->a4)));
	if (t2) {
		T228f10(GE_void(((T246*)(C))->a5), a1);
	} else {
		t3 = (T228f4(GE_void(((T246*)(C))->a5), ((T246*)(C))->a4));
		T228f10(GE_void(((T246*)(C))->a5), t3);
		T228f12(GE_void(((T246*)(C))->a5), a1, ((T246*)(C))->a4);
	}
	t3 = (((((T0*)(GE_void(a1)))->id==175)?((T175*)(a1))->a4:((T230*)(a1))->a10));
	l1 = (T179x13495(GE_void(t3)));
	t2 = (T161x13490(GE_void(l1)));
	t2 = ((T1)(!(t2)));
	if (t2) {
		((T246*)(C))->a13 = EIF_TRUE;
	} else {
		t2 = (T161x13442(GE_void(l1)));
		if (t2) {
			((T246*)(C))->a14 = EIF_TRUE;
		}
	}
}

/* ET_DYNAMIC_FEATURE_LIST.put */
void T228f12(T0* C, T0* a1, T6 a2)
{
	((T556*)(GE_void(((T228*)(C))->a2)))->z2[a2] = (a1);
}

/* ET_DYNAMIC_PROCEDURE_TYPE.new_dynamic_query */
T0* T246f54(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = T175c48(a1, C, a2);
	return R;
}

/* ET_DYNAMIC_FEATURE_LIST.make_with_capacity */
T0* T228c8(T6 a1)
{
	T0* C;
	T1 t1;
	T0* t2;
	T6 t3;
	C = GE_new228(EIF_TRUE);
	((T228*)(C))->a1 = (T6)(GE_int32(0));
	t1 = (T6f1(&a1, (T6)(GE_int32(0))));
	if (t1) {
		t2 = (T228f5(C));
		t3 = ((T6)((a1)+((T6)(GE_int32(1)))));
		((T228*)(C))->a2 = (T561f2(GE_void(t2), t3));
	} else {
		((T228*)(C))->a2 = EIF_VOID;
	}
	return C;
}

/* ET_DYNAMIC_FUNCTION_TYPE.seeded_dynamic_query */
T0* T245f46(T0* C, T6 a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	t1 = (T245f50(C));
	t2 = ((((T245*)(C))->a5)==(t1));
	if (t2) {
		l3 = (T60f55(GE_void(((T245*)(C))->a6), a1));
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			t1 = (((T60*)(GE_void(((T245*)(C))->a6)))->a4);
			t3 = (((T186*)(GE_void(t1)))->a1);
			((T245*)(C))->a5 = T228c8(t3);
			R = (T245f51(C, l3, a2));
			t2 = (((((T0*)(GE_void(R)))->id==175)?T175f31(R, a2):T230f19(R, a2)));
			if (t2) {
				T245f73(C, R, a2);
			} else {
				T228f9(GE_void(((T245*)(C))->a5), R);
			}
		}
	} else {
		l2 = (((T228*)(GE_void(((T245*)(C))->a5)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t2 = (T6f1(&l1, l2));
			if (t2) {
				break;
			}
			l4 = (T228f4(GE_void(((T245*)(C))->a5), l1));
			t1 = (((((T0*)(GE_void(l4)))->id==175)?((T175*)(l4))->a1:((T230*)(l4))->a5));
			t2 = (T208x14342T6(GE_void(t1), a1));
			if (t2) {
				R = l4;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			l3 = (T60f55(GE_void(((T245*)(C))->a6), a1));
			t2 = ((l3)!=(EIF_VOID));
			if (t2) {
				R = (T245f51(C, l3, a2));
				t2 = (((((T0*)(GE_void(R)))->id==175)?T175f31(R, a2):T230f19(R, a2)));
				if (t2) {
					T245f73(C, R, a2);
				} else {
					T228f10(GE_void(((T245*)(C))->a5), R);
				}
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.put_attribute */
void T245f73(T0* C, T0* a1, T0* a2)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T0* l1 = 0;
	((T245*)(C))->a4 = ((T6)((((T245*)(C))->a4)+((T6)(GE_int32(1)))));
	t1 = (((T228*)(GE_void(((T245*)(C))->a5)))->a1);
	t2 = ((T1)((t1)<(((T245*)(C))->a4)));
	if (t2) {
		T228f10(GE_void(((T245*)(C))->a5), a1);
	} else {
		t3 = (T228f4(GE_void(((T245*)(C))->a5), ((T245*)(C))->a4));
		T228f10(GE_void(((T245*)(C))->a5), t3);
		T228f12(GE_void(((T245*)(C))->a5), a1, ((T245*)(C))->a4);
	}
	t3 = (((((T0*)(GE_void(a1)))->id==175)?((T175*)(a1))->a4:((T230*)(a1))->a10));
	l1 = (T179x13495(GE_void(t3)));
	t2 = (T161x13490(GE_void(l1)));
	t2 = ((T1)(!(t2)));
	if (t2) {
		((T245*)(C))->a14 = EIF_TRUE;
	} else {
		t2 = (T161x13442(GE_void(l1)));
		if (t2) {
			((T245*)(C))->a15 = EIF_TRUE;
		}
	}
}

/* ET_DYNAMIC_FUNCTION_TYPE.new_dynamic_query */
T0* T245f51(T0* C, T0* a1, T0* a2)
{
	T6 t1;
	T0* t2;
	T0* t3;
	T6 t4;
	T1 t5;
	T0* R = 0;
	T0* l1 = 0;
	R = (T245f51p1(C, a1, a2));
	t1 = (((T175*)(GE_void(R)))->a7);
	t2 = (T245f19(C));
	t3 = (T245f19(C));
	t4 = ((T6)(GE_int32(1)));
	t4 = (T160f46(GE_void(t2), t4));
	t5 = ((t1)==(t4));
	if (t5) {
		t2 = (((T58*)(GE_void(a2)))->a7);
		if (((T0*)(GE_void(t2)))->id==64) {
			T64f274(t2, C, R);
		} else {
			T154f20(t2, C, R);
		}
		l1 = (((T175*)(GE_void(R)))->a4);
		t5 = ((l1)!=(EIF_VOID));
		if (t5) {
			t2 = (T179x13495(GE_void(l1)));
			t3 = (T179x13495(GE_void(((T245*)(C))->a8)));
			t5 = ((t2)==(t3));
		}
		if (t5) {
			T175f52(GE_void(R), ((T245*)(C))->a8);
		}
	}
	return R;
}

/* ET_DYNAMIC_FEATURE.set_result_type_set */
void T175f52(T0* C, T0* a1)
{
	((T175*)(C))->a4 = a1;
}

/* ET_DYNAMIC_NULL_TYPE_SET_BUILDER.build_agent_call */
void T154f20(T0* C, T0* a1, T0* a2)
{
}

/* ET_DYNAMIC_PUSH_TYPE_SET_BUILDER.build_agent_call */
void T64f274(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T0* t2;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	l1 = (((T175*)(GE_void(a2)))->a2);
	t1 = (T190f7(GE_void(l1)));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (T190f4(GE_void(l1), (T6)(GE_int32(1))));
		t2 = (T179x13495(GE_void(t2)));
		l3 = T631c14(t2, a1);
		T631f15(GE_void(l3));
		l2 = T190c8((T6)(GE_int32(1)));
		T190f11(GE_void(l2), l3);
		T175f53(GE_void(a2), l2);
	}
}

/* ET_DYNAMIC_AGENT_OPERAND_PUSH_TYPE_SET.make */
T0* T631c14(T0* a1, T0* a2)
{
	T0* C;
	T1 t1;
	C = GE_new631(EIF_TRUE);
	((T631*)(C))->a1 = a1;
	t1 = (T161x13490(GE_void(a1)));
	if (t1) {
		T631f16(C, a1);
	}
	((T631*)(C))->a2 = a2;
	return C;
}

/* ET_DYNAMIC_FUNCTION_TYPE.tokens */
T0* T245f19(T0* C)
{
	T0* R = 0;
	if (ge800os2897) {
		return ge800ov2897;
	} else {
		ge800os2897 = '\1';
		ge800ov2897 = R;
	}
	R = T160c926();
	ge800ov2897 = R;
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.new_dynamic_query */
T0* T245f51p1(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = T175c48(a1, C, a2);
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.seeded_dynamic_query */
T0* T240f58(T0* C, T6 a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	t1 = (T240f48(C));
	t2 = ((((T240*)(C))->a5)==(t1));
	if (t2) {
		l3 = (T60f55(GE_void(((T240*)(C))->a6), a1));
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			t1 = (((T60*)(GE_void(((T240*)(C))->a6)))->a4);
			t3 = (((T186*)(GE_void(t1)))->a1);
			((T240*)(C))->a5 = T228c8(t3);
			R = (T240f49(C, l3, a2));
			t2 = (((((T0*)(GE_void(R)))->id==175)?T175f31(R, a2):T230f19(R, a2)));
			if (t2) {
				T240f72(C, R, a2);
			} else {
				T228f9(GE_void(((T240*)(C))->a5), R);
			}
		}
	} else {
		l2 = (((T228*)(GE_void(((T240*)(C))->a5)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t2 = (T6f1(&l1, l2));
			if (t2) {
				break;
			}
			l4 = (T228f4(GE_void(((T240*)(C))->a5), l1));
			t1 = (((((T0*)(GE_void(l4)))->id==175)?((T175*)(l4))->a1:((T230*)(l4))->a5));
			t2 = (T208x14342T6(GE_void(t1), a1));
			if (t2) {
				R = l4;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			l3 = (T60f55(GE_void(((T240*)(C))->a6), a1));
			t2 = ((l3)!=(EIF_VOID));
			if (t2) {
				R = (T240f49(C, l3, a2));
				t2 = (((((T0*)(GE_void(R)))->id==175)?T175f31(R, a2):T230f19(R, a2)));
				if (t2) {
					T240f72(C, R, a2);
				} else {
					T228f10(GE_void(((T240*)(C))->a5), R);
				}
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.put_attribute */
void T240f72(T0* C, T0* a1, T0* a2)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T0* l1 = 0;
	((T240*)(C))->a4 = ((T6)((((T240*)(C))->a4)+((T6)(GE_int32(1)))));
	t1 = (((T228*)(GE_void(((T240*)(C))->a5)))->a1);
	t2 = ((T1)((t1)<(((T240*)(C))->a4)));
	if (t2) {
		T228f10(GE_void(((T240*)(C))->a5), a1);
	} else {
		t3 = (T228f4(GE_void(((T240*)(C))->a5), ((T240*)(C))->a4));
		T228f10(GE_void(((T240*)(C))->a5), t3);
		T228f12(GE_void(((T240*)(C))->a5), a1, ((T240*)(C))->a4);
	}
	t3 = (((((T0*)(GE_void(a1)))->id==175)?((T175*)(a1))->a4:((T230*)(a1))->a10));
	l1 = (T179x13495(GE_void(t3)));
	t2 = (T161x13490(GE_void(l1)));
	t2 = ((T1)(!(t2)));
	if (t2) {
		((T240*)(C))->a9 = EIF_TRUE;
	} else {
		t2 = (T161x13442(GE_void(l1)));
		if (t2) {
			((T240*)(C))->a10 = EIF_TRUE;
		}
	}
}

/* ET_DYNAMIC_SPECIAL_TYPE.new_dynamic_query */
T0* T240f49(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T0* t3;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	R = (T240f49p1(C, a1, a2));
	l1 = (T171x14344(GE_void(a1)));
	t1 = (T240f18(C));
	t1 = (T160f45(GE_void(t1)));
	t2 = (T169x12301T0(GE_void(l1), t1));
	if (t2) {
		l2 = (((T175*)(GE_void(R)))->a4);
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t1 = (T179x13495(GE_void(l2)));
			t3 = (T179x13495(GE_void(((T240*)(C))->a8)));
			t2 = ((t1)==(t3));
		}
		if (t2) {
			T175f52(GE_void(R), ((T240*)(C))->a8);
		}
	}
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.tokens */
T0* T240f18(T0* C)
{
	T0* R = 0;
	if (ge800os2897) {
		return ge800ov2897;
	} else {
		ge800os2897 = '\1';
		ge800ov2897 = R;
	}
	R = T160c926();
	ge800ov2897 = R;
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.new_dynamic_query */
T0* T240f49p1(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = T175c48(a1, C, a2);
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.seeded_dynamic_query */
T0* T225f58(T0* C, T6 a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	t1 = (T225f48(C));
	t2 = ((((T225*)(C))->a5)==(t1));
	if (t2) {
		l3 = (T60f55(GE_void(((T225*)(C))->a6), a1));
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			t1 = (((T60*)(GE_void(((T225*)(C))->a6)))->a4);
			t3 = (((T186*)(GE_void(t1)))->a1);
			((T225*)(C))->a5 = T228c8(t3);
			R = (T225f49(C, l3, a2));
			t2 = (((((T0*)(GE_void(R)))->id==175)?T175f31(R, a2):T230f19(R, a2)));
			if (t2) {
				T225f72(C, R, a2);
			} else {
				T228f9(GE_void(((T225*)(C))->a5), R);
			}
		}
	} else {
		l2 = (((T228*)(GE_void(((T225*)(C))->a5)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t2 = (T6f1(&l1, l2));
			if (t2) {
				break;
			}
			l4 = (T228f4(GE_void(((T225*)(C))->a5), l1));
			t1 = (((((T0*)(GE_void(l4)))->id==175)?((T175*)(l4))->a1:((T230*)(l4))->a5));
			t2 = (T208x14342T6(GE_void(t1), a1));
			if (t2) {
				R = l4;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			l3 = (T60f55(GE_void(((T225*)(C))->a6), a1));
			t2 = ((l3)!=(EIF_VOID));
			if (t2) {
				R = (T225f49(C, l3, a2));
				t2 = (((((T0*)(GE_void(R)))->id==175)?T175f31(R, a2):T230f19(R, a2)));
				if (t2) {
					T225f72(C, R, a2);
				} else {
					T228f10(GE_void(((T225*)(C))->a5), R);
				}
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.put_attribute */
void T225f72(T0* C, T0* a1, T0* a2)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T0* l1 = 0;
	((T225*)(C))->a4 = ((T6)((((T225*)(C))->a4)+((T6)(GE_int32(1)))));
	t1 = (((T228*)(GE_void(((T225*)(C))->a5)))->a1);
	t2 = ((T1)((t1)<(((T225*)(C))->a4)));
	if (t2) {
		T228f10(GE_void(((T225*)(C))->a5), a1);
	} else {
		t3 = (T228f4(GE_void(((T225*)(C))->a5), ((T225*)(C))->a4));
		T228f10(GE_void(((T225*)(C))->a5), t3);
		T228f12(GE_void(((T225*)(C))->a5), a1, ((T225*)(C))->a4);
	}
	t3 = (((((T0*)(GE_void(a1)))->id==175)?((T175*)(a1))->a4:((T230*)(a1))->a10));
	l1 = (T179x13495(GE_void(t3)));
	t2 = (T161x13490(GE_void(l1)));
	t2 = ((T1)(!(t2)));
	if (t2) {
		((T225*)(C))->a9 = EIF_TRUE;
	} else {
		t2 = (T161x13442(GE_void(l1)));
		if (t2) {
			((T225*)(C))->a10 = EIF_TRUE;
		}
	}
}

/* ET_DYNAMIC_TUPLE_TYPE.new_dynamic_query */
T0* T225f49(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T0* t2;
	T1 t3;
	T0* R = 0;
	T0* l1 = 0;
	R = (T225f49p1(C, a1, a2));
	l1 = (T171x14344(GE_void(a1)));
	t1 = (T175f23(GE_void(R)));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (T225f18(C));
		t2 = (T160f45(GE_void(t2)));
		t3 = (T169x12301T0(GE_void(l1), t2));
		if (!(t3)) {
			t2 = (T225f18(C));
			t2 = (T160f47(GE_void(t2)));
			t3 = (T169x12301T0(GE_void(l1), t2));
		}
		if (!(t3)) {
			t2 = (T225f18(C));
			t2 = (T160f48(GE_void(t2)));
			t1 = (T169x12301T0(GE_void(l1), t2));
		} else {
			t1 = EIF_TRUE;
		}
	}
	if (t1) {
		t2 = (((T58*)(GE_void(a2)))->a7);
		if (((T0*)(GE_void(t2)))->id==64) {
			T64f272(t2, C, R);
		} else {
			T154f18(t2, C, R);
		}
	}
	return R;
}

/* ET_DYNAMIC_NULL_TYPE_SET_BUILDER.build_tuple_item */
void T154f18(T0* C, T0* a1, T0* a2)
{
}

/* ET_DYNAMIC_PUSH_TYPE_SET_BUILDER.build_tuple_item */
void T64f272(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T0* t2;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	l3 = (((T175*)(GE_void(a2)))->a4);
	t1 = ((l3)!=(EIF_VOID));
	if (t1) {
		l4 = (((T225*)(a1))->a8);
		l2 = (((T190*)(GE_void(l4)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t1 = (T6f1(&l1, l2));
			if (t1) {
				break;
			}
			t2 = (T190f4(GE_void(l4), l1));
			T179x13497T0T0(GE_void(t2), l3, ((T64*)(C))->a2);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
}

/* ET_TOKEN_CONSTANTS.infix_at_feature_name */
unsigned char ge805os12908 = '\0';
T0* ge805ov12908;
T0* T160f47(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	if (ge805os12908) {
		return ge805ov12908;
	} else {
		ge805os12908 = '\1';
		ge805ov12908 = R;
	}
	l1 = T644c34(ge805ov13332);
	R = T645c62(l1);
	ge805ov12908 = R;
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.tokens */
T0* T225f18(T0* C)
{
	T0* R = 0;
	if (ge800os2897) {
		return ge800ov2897;
	} else {
		ge800os2897 = '\1';
		ge800ov2897 = R;
	}
	R = T160c926();
	ge800ov2897 = R;
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.new_dynamic_query */
T0* T225f49p1(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = T175c48(a1, C, a2);
	return R;
}

/* ET_DYNAMIC_TYPE.seeded_dynamic_query */
T0* T161f26(T0* C, T6 a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	t1 = (T161f21(C));
	t2 = ((((T161*)(C))->a5)==(t1));
	if (t2) {
		l3 = (T60f55(GE_void(((T161*)(C))->a6), a1));
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			t1 = (((T60*)(GE_void(((T161*)(C))->a6)))->a4);
			t3 = (((T186*)(GE_void(t1)))->a1);
			((T161*)(C))->a5 = T228c8(t3);
			R = (T161f22(C, l3, a2));
			t2 = (((((T0*)(GE_void(R)))->id==175)?T175f31(R, a2):T230f19(R, a2)));
			if (t2) {
				T161f69(C, R, a2);
			} else {
				T228f9(GE_void(((T161*)(C))->a5), R);
			}
		}
	} else {
		l2 = (((T228*)(GE_void(((T161*)(C))->a5)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t2 = (T6f1(&l1, l2));
			if (t2) {
				break;
			}
			l4 = (T228f4(GE_void(((T161*)(C))->a5), l1));
			t1 = (((((T0*)(GE_void(l4)))->id==175)?((T175*)(l4))->a1:((T230*)(l4))->a5));
			t2 = (T208x14342T6(GE_void(t1), a1));
			if (t2) {
				R = l4;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			l3 = (T60f55(GE_void(((T161*)(C))->a6), a1));
			t2 = ((l3)!=(EIF_VOID));
			if (t2) {
				R = (T161f22(C, l3, a2));
				t2 = (((((T0*)(GE_void(R)))->id==175)?T175f31(R, a2):T230f19(R, a2)));
				if (t2) {
					T161f69(C, R, a2);
				} else {
					T228f10(GE_void(((T161*)(C))->a5), R);
				}
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_TYPE.put_attribute */
void T161f69(T0* C, T0* a1, T0* a2)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T0* l1 = 0;
	((T161*)(C))->a4 = ((T6)((((T161*)(C))->a4)+((T6)(GE_int32(1)))));
	t1 = (((T228*)(GE_void(((T161*)(C))->a5)))->a1);
	t2 = ((T1)((t1)<(((T161*)(C))->a4)));
	if (t2) {
		T228f10(GE_void(((T161*)(C))->a5), a1);
	} else {
		t3 = (T228f4(GE_void(((T161*)(C))->a5), ((T161*)(C))->a4));
		T228f10(GE_void(((T161*)(C))->a5), t3);
		T228f12(GE_void(((T161*)(C))->a5), a1, ((T161*)(C))->a4);
	}
	t3 = (((((T0*)(GE_void(a1)))->id==175)?((T175*)(a1))->a4:((T230*)(a1))->a10));
	l1 = (T179x13495(GE_void(t3)));
	t2 = (T161x13490(GE_void(l1)));
	t2 = ((T1)(!(t2)));
	if (t2) {
		((T161*)(C))->a12 = EIF_TRUE;
	} else {
		t2 = (T161x13442(GE_void(l1)));
		if (t2) {
			((T161*)(C))->a13 = EIF_TRUE;
		}
	}
}

/* ET_DYNAMIC_TYPE.new_dynamic_query */
T0* T161f22(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = T175c48(a1, C, a2);
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.is_generic */
T1 T246f49(T0* C)
{
	T1 R = 0;
	R = (T60f57(GE_void(((T246*)(C))->a6)));
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.is_generic */
T1 T245f49(T0* C)
{
	T1 R = 0;
	R = (T60f57(GE_void(((T245*)(C))->a6)));
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.is_generic */
T1 T240f47(T0* C)
{
	T1 R = 0;
	R = (T60f57(GE_void(((T240*)(C))->a6)));
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.is_generic */
T1 T225f47(T0* C)
{
	T1 R = 0;
	R = (T60f57(GE_void(((T225*)(C))->a6)));
	return R;
}

/* ET_DYNAMIC_TYPE.is_generic */
T1 T161f27(T0* C)
{
	T1 R = 0;
	R = (T60f57(GE_void(((T161*)(C))->a6)));
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.is_builtin_attribute */
T1 T246f19(T0* C, T0* a1, T6 a2, T0* a3)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T1 R = 0;
	t1 = ((T6)((a2)/((T6)(GE_int32(100)))));
	switch (t1) {
	case (T6)(T6)(GE_int32(5)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a9);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(3)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a10);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(4)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a11);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(16)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a22);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(6)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a12);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(7)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a13);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(8)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a14);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(9)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a15);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(10)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a16);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(11)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a17);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(12)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a18);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(13)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a19);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(14)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a20);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(15)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a21);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(23)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(14))));
		if (t2) {
			R = EIF_TRUE;
		}
		break;
	default:
		R = EIF_FALSE;
		break;
	}
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.is_builtin_attribute */
T1 T245f21(T0* C, T0* a1, T6 a2, T0* a3)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T1 R = 0;
	t1 = ((T6)((a2)/((T6)(GE_int32(100)))));
	switch (t1) {
	case (T6)(T6)(GE_int32(5)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a9);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(3)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a10);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(4)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a11);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(16)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a22);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(6)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a12);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(7)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a13);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(8)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a14);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(9)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a15);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(10)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a16);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(11)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a17);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(12)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a18);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(13)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a19);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(14)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a20);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(15)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a21);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(23)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(14))));
		if (t2) {
			R = EIF_TRUE;
		}
		break;
	default:
		R = EIF_FALSE;
		break;
	}
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.is_builtin_attribute */
T1 T240f20(T0* C, T0* a1, T6 a2, T0* a3)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T1 R = 0;
	t1 = ((T6)((a2)/((T6)(GE_int32(100)))));
	switch (t1) {
	case (T6)(T6)(GE_int32(5)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a9);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(3)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a10);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(4)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a11);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(16)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a22);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(6)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a12);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(7)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a13);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(8)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a14);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(9)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a15);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(10)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a16);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(11)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a17);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(12)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a18);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(13)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a19);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(14)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a20);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(15)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a21);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(23)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(14))));
		if (t2) {
			R = EIF_TRUE;
		}
		break;
	default:
		R = EIF_FALSE;
		break;
	}
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.is_builtin_attribute */
T1 T225f19(T0* C, T0* a1, T6 a2, T0* a3)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T1 R = 0;
	t1 = ((T6)((a2)/((T6)(GE_int32(100)))));
	switch (t1) {
	case (T6)(T6)(GE_int32(5)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a9);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(3)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a10);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(4)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a11);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(16)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a22);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(6)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a12);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(7)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a13);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(8)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a14);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(9)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a15);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(10)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a16);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(11)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a17);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(12)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a18);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(13)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a19);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(14)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a20);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(15)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a21);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(23)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(14))));
		if (t2) {
			R = EIF_TRUE;
		}
		break;
	default:
		R = EIF_FALSE;
		break;
	}
	return R;
}

/* ET_DYNAMIC_TYPE.is_builtin_attribute */
T1 T161f33(T0* C, T0* a1, T6 a2, T0* a3)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T1 R = 0;
	t1 = ((T6)((a2)/((T6)(GE_int32(100)))));
	switch (t1) {
	case (T6)(T6)(GE_int32(5)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a9);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(3)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a10);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(4)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a11);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(16)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a22);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(6)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a12);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(7)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a13);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(8)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a14);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(9)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a15);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(10)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a16);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(11)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a17);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(12)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a18);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(13)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a19);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(14)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a20);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(15)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a21);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(23)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(14))));
		if (t2) {
			R = EIF_TRUE;
		}
		break;
	default:
		R = EIF_FALSE;
		break;
	}
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.is_special */
T1 T246f58(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.is_special */
T1 T245f59(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.is_special */
T1 T225f57(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DYNAMIC_TYPE.is_special */
T1 T161f60(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.is_expanded */
T1 T246f57(T0* C)
{
	T1 R = 0;
	R = (T162x6499(GE_void(((T246*)(C))->a3)));
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.is_expanded */
T1 T245f55(T0* C)
{
	T1 R = 0;
	R = (T162x6499(GE_void(((T245*)(C))->a3)));
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.is_expanded */
T1 T240f53(T0* C)
{
	T1 R = 0;
	R = (T162x6499(GE_void(((T240*)(C))->a3)));
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.is_expanded */
T1 T225f53(T0* C)
{
	T1 R = 0;
	R = (T162x6499(GE_void(((T225*)(C))->a3)));
	return R;
}

/* ET_DYNAMIC_TYPE.is_expanded */
T1 T161f23(T0* C)
{
	T1 R = 0;
	R = (T162x6499(GE_void(((T161*)(C))->a1)));
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.dynamic_procedure */
T0* T246f45(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	t1 = (T246f50(C));
	t2 = ((((T246*)(C))->a7)==(t1));
	if (t2) {
		t1 = (((T60*)(GE_void(((T246*)(C))->a6)))->a5);
		t3 = (((T187*)(GE_void(t1)))->a1);
		((T246*)(C))->a7 = T228c8(t3);
		R = (T246f18(C, a1, a2));
		T228f9(GE_void(((T246*)(C))->a7), R);
	} else {
		l2 = (((T228*)(GE_void(((T246*)(C))->a7)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t2 = (T6f1(&l1, l2));
			if (t2) {
				break;
			}
			l3 = (T228f4(GE_void(((T246*)(C))->a7), l1));
			t1 = (((((T0*)(GE_void(l3)))->id==175)?((T175*)(l3))->a1:((T230*)(l3))->a5));
			t2 = ((t1)==(a1));
			if (t2) {
				R = l3;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (T246f18(C, a1, a2));
			T228f10(GE_void(((T246*)(C))->a7), R);
		}
	}
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.new_dynamic_procedure */
T0* T246f18(T0* C, T0* a1, T0* a2)
{
	T6 t1;
	T0* t2;
	T0* t3;
	T6 t4;
	T1 t5;
	T0* R = 0;
	R = (T246f18p1(C, a1, a2));
	t1 = (((T175*)(GE_void(R)))->a7);
	t2 = (T246f20(C));
	t3 = (T246f20(C));
	t4 = ((T6)(GE_int32(1)));
	t4 = (T160f44(GE_void(t2), t4));
	t5 = ((t1)==(t4));
	if (t5) {
		t2 = (((T58*)(GE_void(a2)))->a7);
		if (((T0*)(GE_void(t2)))->id==64) {
			T64f274(t2, C, R);
		} else {
			T154f20(t2, C, R);
		}
	}
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.tokens */
T0* T246f20(T0* C)
{
	T0* R = 0;
	if (ge800os2897) {
		return ge800ov2897;
	} else {
		ge800os2897 = '\1';
		ge800ov2897 = R;
	}
	R = T160c926();
	ge800ov2897 = R;
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.new_dynamic_procedure */
T0* T246f18p1(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = T175c48(a1, C, a2);
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.dynamic_procedure */
T0* T245f45(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	t1 = (T245f50(C));
	t2 = ((((T245*)(C))->a7)==(t1));
	if (t2) {
		t1 = (((T60*)(GE_void(((T245*)(C))->a6)))->a5);
		t3 = (((T187*)(GE_void(t1)))->a1);
		((T245*)(C))->a7 = T228c8(t3);
		R = (T245f58(C, a1, a2));
		T228f9(GE_void(((T245*)(C))->a7), R);
	} else {
		l2 = (((T228*)(GE_void(((T245*)(C))->a7)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t2 = (T6f1(&l1, l2));
			if (t2) {
				break;
			}
			l3 = (T228f4(GE_void(((T245*)(C))->a7), l1));
			t1 = (((((T0*)(GE_void(l3)))->id==175)?((T175*)(l3))->a1:((T230*)(l3))->a5));
			t2 = ((t1)==(a1));
			if (t2) {
				R = l3;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (T245f58(C, a1, a2));
			T228f10(GE_void(((T245*)(C))->a7), R);
		}
	}
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.new_dynamic_procedure */
T0* T245f58(T0* C, T0* a1, T0* a2)
{
	T6 t1;
	T0* t2;
	T0* t3;
	T6 t4;
	T1 t5;
	T0* R = 0;
	R = (T245f58p1(C, a1, a2));
	t1 = (((T175*)(GE_void(R)))->a7);
	t2 = (T245f19(C));
	t3 = (T245f19(C));
	t4 = ((T6)(GE_int32(2)));
	t4 = (T160f46(GE_void(t2), t4));
	t5 = ((t1)==(t4));
	if (t5) {
		t2 = (((T58*)(GE_void(a2)))->a7);
		if (((T0*)(GE_void(t2)))->id==64) {
			T64f274(t2, C, R);
		} else {
			T154f20(t2, C, R);
		}
	}
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.new_dynamic_procedure */
T0* T245f58p1(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = T175c48(a1, C, a2);
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.dynamic_procedure */
T0* T240f44(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	t1 = (T240f48(C));
	t2 = ((((T240*)(C))->a7)==(t1));
	if (t2) {
		t1 = (((T60*)(GE_void(((T240*)(C))->a6)))->a5);
		t3 = (((T187*)(GE_void(t1)))->a1);
		((T240*)(C))->a7 = T228c8(t3);
		R = (T240f56(C, a1, a2));
		T228f9(GE_void(((T240*)(C))->a7), R);
	} else {
		l2 = (((T228*)(GE_void(((T240*)(C))->a7)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t2 = (T6f1(&l1, l2));
			if (t2) {
				break;
			}
			l3 = (T228f4(GE_void(((T240*)(C))->a7), l1));
			t1 = (((((T0*)(GE_void(l3)))->id==175)?((T175*)(l3))->a1:((T230*)(l3))->a5));
			t2 = ((t1)==(a1));
			if (t2) {
				R = l3;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (T240f56(C, a1, a2));
			T228f10(GE_void(((T240*)(C))->a7), R);
		}
	}
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.new_dynamic_procedure */
T0* T240f56(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	R = (T240f56p1(C, a1, a2));
	l1 = (T170x14344(GE_void(a1)));
	t1 = (T240f18(C));
	t1 = (T160f49(GE_void(t1)));
	t2 = (T169x12301T0(GE_void(l1), t1));
	if (t2) {
		l2 = (((T175*)(GE_void(R)))->a2);
		l5 = (((T190*)(GE_void(l2)))->a1);
		l3 = T190c8(l5);
		T190f11(GE_void(l3), ((T240*)(C))->a8);
		l4 = (T6)(GE_int32(2));
		while (1) {
			t2 = (T6f1(&l4, l5));
			if (t2) {
				break;
			}
			t1 = (T190f4(GE_void(l2), l4));
			T190f11(GE_void(l3), t1);
			l4 = ((T6)((l4)+((T6)(GE_int32(1)))));
		}
		T175f53(GE_void(R), l3);
	}
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.new_dynamic_procedure */
T0* T240f56p1(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = T175c48(a1, C, a2);
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.dynamic_procedure */
T0* T225f44(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	t1 = (T225f48(C));
	t2 = ((((T225*)(C))->a7)==(t1));
	if (t2) {
		t1 = (((T60*)(GE_void(((T225*)(C))->a6)))->a5);
		t3 = (((T187*)(GE_void(t1)))->a1);
		((T225*)(C))->a7 = T228c8(t3);
		R = (T225f56(C, a1, a2));
		T228f9(GE_void(((T225*)(C))->a7), R);
	} else {
		l2 = (((T228*)(GE_void(((T225*)(C))->a7)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t2 = (T6f1(&l1, l2));
			if (t2) {
				break;
			}
			l3 = (T228f4(GE_void(((T225*)(C))->a7), l1));
			t1 = (((((T0*)(GE_void(l3)))->id==175)?((T175*)(l3))->a1:((T230*)(l3))->a5));
			t2 = ((t1)==(a1));
			if (t2) {
				R = l3;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (T225f56(C, a1, a2));
			T228f10(GE_void(((T225*)(C))->a7), R);
		}
	}
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.new_dynamic_procedure */
T0* T225f56(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T0* t2;
	T1 t3;
	T0* R = 0;
	T0* l1 = 0;
	R = (T225f56p1(C, a1, a2));
	l1 = (T170x14344(GE_void(a1)));
	t1 = (T175f23(GE_void(R)));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (T225f18(C));
		t2 = (T160f49(GE_void(t2)));
		t3 = (T169x12301T0(GE_void(l1), t2));
		if (!(t3)) {
			t2 = (T225f18(C));
			t2 = (T160f50(GE_void(t2)));
			t1 = (T169x12301T0(GE_void(l1), t2));
		} else {
			t1 = EIF_TRUE;
		}
	}
	if (t1) {
		t2 = (((T58*)(GE_void(a2)))->a7);
		if (((T0*)(GE_void(t2)))->id==64) {
			T64f273(t2, C, R);
		} else {
			T154f19(t2, C, R);
		}
	}
	return R;
}

/* ET_DYNAMIC_NULL_TYPE_SET_BUILDER.build_tuple_put */
void T154f19(T0* C, T0* a1, T0* a2)
{
}

/* ET_DYNAMIC_PUSH_TYPE_SET_BUILDER.build_tuple_put */
void T64f273(T0* C, T0* a1, T0* a2)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	l3 = (((T175*)(GE_void(a2)))->a2);
	t1 = (((T190*)(GE_void(l3)))->a1);
	t2 = (T6f1(&t1, (T6)(GE_int32(1))));
	if (t2) {
		l4 = (T190f4(GE_void(l3), (T6)(GE_int32(1))));
		l5 = (((T225*)(a1))->a8);
		l2 = (((T190*)(GE_void(l5)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t2 = (T6f1(&l1, l2));
			if (t2) {
				break;
			}
			t3 = (T190f4(GE_void(l5), l1));
			T179x13497T0T0(GE_void(l4), t3, ((T64*)(C))->a2);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
	}
}

/* ET_DYNAMIC_TUPLE_TYPE.new_dynamic_procedure */
T0* T225f56p1(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = T175c48(a1, C, a2);
	return R;
}

/* ET_DYNAMIC_TYPE.dynamic_procedure */
T0* T161f28(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	t1 = (T161f21(C));
	t2 = ((((T161*)(C))->a7)==(t1));
	if (t2) {
		t1 = (((T60*)(GE_void(((T161*)(C))->a6)))->a5);
		t3 = (((T187*)(GE_void(t1)))->a1);
		((T161*)(C))->a7 = T228c8(t3);
		R = (T161f24(C, a1, a2));
		T228f9(GE_void(((T161*)(C))->a7), R);
	} else {
		l2 = (((T228*)(GE_void(((T161*)(C))->a7)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t2 = (T6f1(&l1, l2));
			if (t2) {
				break;
			}
			l3 = (T228f4(GE_void(((T161*)(C))->a7), l1));
			t1 = (((((T0*)(GE_void(l3)))->id==175)?((T175*)(l3))->a1:((T230*)(l3))->a5));
			t2 = ((t1)==(a1));
			if (t2) {
				R = l3;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (T161f24(C, a1, a2));
			T228f10(GE_void(((T161*)(C))->a7), R);
		}
	}
	return R;
}

/* ET_DYNAMIC_TYPE.new_dynamic_procedure */
T0* T161f24(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = T175c48(a1, C, a2);
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.dynamic_query */
T0* T246f43(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	t1 = (T246f50(C));
	t2 = ((((T246*)(C))->a5)==(t1));
	if (t2) {
		t1 = (((T60*)(GE_void(((T246*)(C))->a6)))->a4);
		t3 = (((T186*)(GE_void(t1)))->a1);
		((T246*)(C))->a5 = T228c8(t3);
		R = (T246f54(C, a1, a2));
		t2 = (((((T0*)(GE_void(R)))->id==175)?T175f31(R, a2):T230f19(R, a2)));
		if (t2) {
			T246f73(C, R, a2);
		} else {
			T228f9(GE_void(((T246*)(C))->a5), R);
		}
	} else {
		l2 = (((T228*)(GE_void(((T246*)(C))->a5)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t2 = (T6f1(&l1, l2));
			if (t2) {
				break;
			}
			l3 = (T228f4(GE_void(((T246*)(C))->a5), l1));
			t1 = (((((T0*)(GE_void(l3)))->id==175)?((T175*)(l3))->a1:((T230*)(l3))->a5));
			t2 = ((t1)==(a1));
			if (t2) {
				R = l3;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (T246f54(C, a1, a2));
			t2 = (((((T0*)(GE_void(R)))->id==175)?T175f31(R, a2):T230f19(R, a2)));
			if (t2) {
				T246f73(C, R, a2);
			} else {
				T228f10(GE_void(((T246*)(C))->a5), R);
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.dynamic_query */
T0* T245f20(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	t1 = (T245f50(C));
	t2 = ((((T245*)(C))->a5)==(t1));
	if (t2) {
		t1 = (((T60*)(GE_void(((T245*)(C))->a6)))->a4);
		t3 = (((T186*)(GE_void(t1)))->a1);
		((T245*)(C))->a5 = T228c8(t3);
		R = (T245f51(C, a1, a2));
		t2 = (((((T0*)(GE_void(R)))->id==175)?T175f31(R, a2):T230f19(R, a2)));
		if (t2) {
			T245f73(C, R, a2);
		} else {
			T228f9(GE_void(((T245*)(C))->a5), R);
		}
	} else {
		l2 = (((T228*)(GE_void(((T245*)(C))->a5)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t2 = (T6f1(&l1, l2));
			if (t2) {
				break;
			}
			l3 = (T228f4(GE_void(((T245*)(C))->a5), l1));
			t1 = (((((T0*)(GE_void(l3)))->id==175)?((T175*)(l3))->a1:((T230*)(l3))->a5));
			t2 = ((t1)==(a1));
			if (t2) {
				R = l3;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (T245f51(C, a1, a2));
			t2 = (((((T0*)(GE_void(R)))->id==175)?T175f31(R, a2):T230f19(R, a2)));
			if (t2) {
				T245f73(C, R, a2);
			} else {
				T228f10(GE_void(((T245*)(C))->a5), R);
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.dynamic_query */
T0* T240f19(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	t1 = (T240f48(C));
	t2 = ((((T240*)(C))->a5)==(t1));
	if (t2) {
		t1 = (((T60*)(GE_void(((T240*)(C))->a6)))->a4);
		t3 = (((T186*)(GE_void(t1)))->a1);
		((T240*)(C))->a5 = T228c8(t3);
		R = (T240f49(C, a1, a2));
		t2 = (((((T0*)(GE_void(R)))->id==175)?T175f31(R, a2):T230f19(R, a2)));
		if (t2) {
			T240f72(C, R, a2);
		} else {
			T228f9(GE_void(((T240*)(C))->a5), R);
		}
	} else {
		l2 = (((T228*)(GE_void(((T240*)(C))->a5)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t2 = (T6f1(&l1, l2));
			if (t2) {
				break;
			}
			l3 = (T228f4(GE_void(((T240*)(C))->a5), l1));
			t1 = (((((T0*)(GE_void(l3)))->id==175)?((T175*)(l3))->a1:((T230*)(l3))->a5));
			t2 = ((t1)==(a1));
			if (t2) {
				R = l3;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (T240f49(C, a1, a2));
			t2 = (((((T0*)(GE_void(R)))->id==175)?T175f31(R, a2):T230f19(R, a2)));
			if (t2) {
				T240f72(C, R, a2);
			} else {
				T228f10(GE_void(((T240*)(C))->a5), R);
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.dynamic_query */
T0* T225f42(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	t1 = (T225f48(C));
	t2 = ((((T225*)(C))->a5)==(t1));
	if (t2) {
		t1 = (((T60*)(GE_void(((T225*)(C))->a6)))->a4);
		t3 = (((T186*)(GE_void(t1)))->a1);
		((T225*)(C))->a5 = T228c8(t3);
		R = (T225f49(C, a1, a2));
		t2 = (((((T0*)(GE_void(R)))->id==175)?T175f31(R, a2):T230f19(R, a2)));
		if (t2) {
			T225f72(C, R, a2);
		} else {
			T228f9(GE_void(((T225*)(C))->a5), R);
		}
	} else {
		l2 = (((T228*)(GE_void(((T225*)(C))->a5)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t2 = (T6f1(&l1, l2));
			if (t2) {
				break;
			}
			l3 = (T228f4(GE_void(((T225*)(C))->a5), l1));
			t1 = (((((T0*)(GE_void(l3)))->id==175)?((T175*)(l3))->a1:((T230*)(l3))->a5));
			t2 = ((t1)==(a1));
			if (t2) {
				R = l3;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (T225f49(C, a1, a2));
			t2 = (((((T0*)(GE_void(R)))->id==175)?T175f31(R, a2):T230f19(R, a2)));
			if (t2) {
				T225f72(C, R, a2);
			} else {
				T228f10(GE_void(((T225*)(C))->a5), R);
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_TYPE.dynamic_query */
T0* T161f30(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	t1 = (T161f21(C));
	t2 = ((((T161*)(C))->a5)==(t1));
	if (t2) {
		t1 = (((T60*)(GE_void(((T161*)(C))->a6)))->a4);
		t3 = (((T186*)(GE_void(t1)))->a1);
		((T161*)(C))->a5 = T228c8(t3);
		R = (T161f22(C, a1, a2));
		t2 = (((((T0*)(GE_void(R)))->id==175)?T175f31(R, a2):T230f19(R, a2)));
		if (t2) {
			T161f69(C, R, a2);
		} else {
			T228f9(GE_void(((T161*)(C))->a5), R);
		}
	} else {
		l2 = (((T228*)(GE_void(((T161*)(C))->a5)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t2 = (T6f1(&l1, l2));
			if (t2) {
				break;
			}
			l3 = (T228f4(GE_void(((T161*)(C))->a5), l1));
			t1 = (((((T0*)(GE_void(l3)))->id==175)?((T175*)(l3))->a1:((T230*)(l3))->a5));
			t2 = ((t1)==(a1));
			if (t2) {
				R = l3;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (T161f22(C, a1, a2));
			t2 = (((((T0*)(GE_void(R)))->id==175)?T175f31(R, a2):T230f19(R, a2)));
			if (t2) {
				T161f69(C, R, a2);
			} else {
				T228f10(GE_void(((T161*)(C))->a5), R);
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.is_agent_type */
T1 T240f65(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.is_agent_type */
T1 T225f65(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DYNAMIC_TYPE.is_agent_type */
T1 T161f63(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.conforms_to_type */
T1 T246f48(T0* C, T0* a1)
{
	T1 R = 0;
	T0* l1 = 0;
	l1 = (T161x13452(GE_void(a1)));
	R = (T162x6585T0T0T0(GE_void(((T246*)(C))->a3), l1, l1, ((T246*)(C))->a3));
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.conforms_to_type */
T1 T245f48(T0* C, T0* a1)
{
	T1 R = 0;
	T0* l1 = 0;
	l1 = (T161x13452(GE_void(a1)));
	R = (T162x6585T0T0T0(GE_void(((T245*)(C))->a3), l1, l1, ((T245*)(C))->a3));
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.conforms_to_type */
T1 T240f46(T0* C, T0* a1)
{
	T1 R = 0;
	T0* l1 = 0;
	l1 = (T161x13452(GE_void(a1)));
	R = (T162x6585T0T0T0(GE_void(((T240*)(C))->a3), l1, l1, ((T240*)(C))->a3));
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.conforms_to_type */
T1 T225f46(T0* C, T0* a1)
{
	T1 R = 0;
	T0* l1 = 0;
	l1 = (T161x13452(GE_void(a1)));
	R = (T162x6585T0T0T0(GE_void(((T225*)(C))->a3), l1, l1, ((T225*)(C))->a3));
	return R;
}

/* ET_DYNAMIC_TYPE.conforms_to_type */
T1 T161f25(T0* C, T0* a1)
{
	T1 R = 0;
	T0* l1 = 0;
	l1 = (T161x13452(GE_void(a1)));
	R = (T162x6585T0T0T0(GE_void(((T161*)(C))->a1), l1, l1, ((T161*)(C))->a1));
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.seeded_dynamic_procedure */
T0* T246f44(T0* C, T6 a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	t1 = (T246f50(C));
	t2 = ((((T246*)(C))->a7)==(t1));
	if (t2) {
		l3 = (T60f60(GE_void(((T246*)(C))->a6), a1));
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			t1 = (((T60*)(GE_void(((T246*)(C))->a6)))->a5);
			t3 = (((T187*)(GE_void(t1)))->a1);
			((T246*)(C))->a7 = T228c8(t3);
			R = (T246f18(C, l3, a2));
			T228f9(GE_void(((T246*)(C))->a7), R);
		}
	} else {
		l2 = (((T228*)(GE_void(((T246*)(C))->a7)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t2 = (T6f1(&l1, l2));
			if (t2) {
				break;
			}
			l4 = (T228f4(GE_void(((T246*)(C))->a7), l1));
			t1 = (((((T0*)(GE_void(l4)))->id==175)?((T175*)(l4))->a1:((T230*)(l4))->a5));
			t2 = (T208x14342T6(GE_void(t1), a1));
			if (t2) {
				R = l4;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			l3 = (T60f60(GE_void(((T246*)(C))->a6), a1));
			t2 = ((l3)!=(EIF_VOID));
			if (t2) {
				R = (T246f18(C, l3, a2));
				T228f10(GE_void(((T246*)(C))->a7), R);
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.seeded_dynamic_procedure */
T0* T245f44(T0* C, T6 a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	t1 = (T245f50(C));
	t2 = ((((T245*)(C))->a7)==(t1));
	if (t2) {
		l3 = (T60f60(GE_void(((T245*)(C))->a6), a1));
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			t1 = (((T60*)(GE_void(((T245*)(C))->a6)))->a5);
			t3 = (((T187*)(GE_void(t1)))->a1);
			((T245*)(C))->a7 = T228c8(t3);
			R = (T245f58(C, l3, a2));
			T228f9(GE_void(((T245*)(C))->a7), R);
		}
	} else {
		l2 = (((T228*)(GE_void(((T245*)(C))->a7)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t2 = (T6f1(&l1, l2));
			if (t2) {
				break;
			}
			l4 = (T228f4(GE_void(((T245*)(C))->a7), l1));
			t1 = (((((T0*)(GE_void(l4)))->id==175)?((T175*)(l4))->a1:((T230*)(l4))->a5));
			t2 = (T208x14342T6(GE_void(t1), a1));
			if (t2) {
				R = l4;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			l3 = (T60f60(GE_void(((T245*)(C))->a6), a1));
			t2 = ((l3)!=(EIF_VOID));
			if (t2) {
				R = (T245f58(C, l3, a2));
				T228f10(GE_void(((T245*)(C))->a7), R);
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.seeded_dynamic_procedure */
T0* T240f43(T0* C, T6 a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	t1 = (T240f48(C));
	t2 = ((((T240*)(C))->a7)==(t1));
	if (t2) {
		l3 = (T60f60(GE_void(((T240*)(C))->a6), a1));
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			t1 = (((T60*)(GE_void(((T240*)(C))->a6)))->a5);
			t3 = (((T187*)(GE_void(t1)))->a1);
			((T240*)(C))->a7 = T228c8(t3);
			R = (T240f56(C, l3, a2));
			T228f9(GE_void(((T240*)(C))->a7), R);
		}
	} else {
		l2 = (((T228*)(GE_void(((T240*)(C))->a7)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t2 = (T6f1(&l1, l2));
			if (t2) {
				break;
			}
			l4 = (T228f4(GE_void(((T240*)(C))->a7), l1));
			t1 = (((((T0*)(GE_void(l4)))->id==175)?((T175*)(l4))->a1:((T230*)(l4))->a5));
			t2 = (T208x14342T6(GE_void(t1), a1));
			if (t2) {
				R = l4;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			l3 = (T60f60(GE_void(((T240*)(C))->a6), a1));
			t2 = ((l3)!=(EIF_VOID));
			if (t2) {
				R = (T240f56(C, l3, a2));
				T228f10(GE_void(((T240*)(C))->a7), R);
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.seeded_dynamic_procedure */
T0* T225f43(T0* C, T6 a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	t1 = (T225f48(C));
	t2 = ((((T225*)(C))->a7)==(t1));
	if (t2) {
		l3 = (T60f60(GE_void(((T225*)(C))->a6), a1));
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			t1 = (((T60*)(GE_void(((T225*)(C))->a6)))->a5);
			t3 = (((T187*)(GE_void(t1)))->a1);
			((T225*)(C))->a7 = T228c8(t3);
			R = (T225f56(C, l3, a2));
			T228f9(GE_void(((T225*)(C))->a7), R);
		}
	} else {
		l2 = (((T228*)(GE_void(((T225*)(C))->a7)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t2 = (T6f1(&l1, l2));
			if (t2) {
				break;
			}
			l4 = (T228f4(GE_void(((T225*)(C))->a7), l1));
			t1 = (((((T0*)(GE_void(l4)))->id==175)?((T175*)(l4))->a1:((T230*)(l4))->a5));
			t2 = (T208x14342T6(GE_void(t1), a1));
			if (t2) {
				R = l4;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			l3 = (T60f60(GE_void(((T225*)(C))->a6), a1));
			t2 = ((l3)!=(EIF_VOID));
			if (t2) {
				R = (T225f56(C, l3, a2));
				T228f10(GE_void(((T225*)(C))->a7), R);
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_TYPE.seeded_dynamic_procedure */
T0* T161f29(T0* C, T6 a1, T0* a2)
{
	T0* t1;
	T1 t2;
	T6 t3;
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	t1 = (T161f21(C));
	t2 = ((((T161*)(C))->a7)==(t1));
	if (t2) {
		l3 = (T60f60(GE_void(((T161*)(C))->a6), a1));
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			t1 = (((T60*)(GE_void(((T161*)(C))->a6)))->a5);
			t3 = (((T187*)(GE_void(t1)))->a1);
			((T161*)(C))->a7 = T228c8(t3);
			R = (T161f24(C, l3, a2));
			T228f9(GE_void(((T161*)(C))->a7), R);
		}
	} else {
		l2 = (((T228*)(GE_void(((T161*)(C))->a7)))->a1);
		l1 = (T6)(GE_int32(1));
		while (1) {
			t2 = (T6f1(&l1, l2));
			if (t2) {
				break;
			}
			l4 = (T228f4(GE_void(((T161*)(C))->a7), l1));
			t1 = (((((T0*)(GE_void(l4)))->id==175)?((T175*)(l4))->a1:((T230*)(l4))->a5));
			t2 = (T208x14342T6(GE_void(t1), a1));
			if (t2) {
				R = l4;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			l3 = (T60f60(GE_void(((T161*)(C))->a6), a1));
			t2 = ((l3)!=(EIF_VOID));
			if (t2) {
				R = (T161f24(C, l3, a2));
				T228f10(GE_void(((T161*)(C))->a7), R);
			}
		}
	}
	return R;
}

/* ET_DOTNET_ASSEMBLY_ERROR.default_message */
T0* T1502f12(T0* C)
{
	T0* R = 0;
	R = (T1502f7(C, ((T1502*)(C))->a1));
	return R;
}

/* ET_DOTNET_ASSEMBLY_ERROR.message */
T0* T1502f7(T0* C, T0* a1)
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
	t1 = (T1502f9(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T1502f9(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(GE_void(a1), l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1502f9(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(GE_void(a1), l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T1502f9(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T17f39(l1, l5);
								} else {
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T1502*)(C))->a2), l3));
						if (t2) {
							t1 = (T1502f9(C));
							t5 = (T86f5(GE_void(((T1502*)(C))->a2), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T1502f9(C));
								t5 = (T1502f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T1502f9(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T1502f9(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T1502f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* ARRAY [STRING_8].valid_index */
T1 T86f4(T0* C, T6 a1)
{
	T1 t1;
	T1 R = 0;
	t1 = (T6f13(&(((T86*)(C))->a2), a1));
	if (t1) {
		R = (T6f13(&a1, ((T86*)(C))->a3));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_DOTNET_ASSEMBLY_ERROR.string_ */
T0* T1502f9(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* ET_SYNTAX_ERROR.default_message */
T0* T1389f17(T0* C)
{
	T0* R = 0;
	R = (T1389f13(C, ((T1389*)(C))->a1));
	return R;
}

/* ET_SYNTAX_ERROR.message */
T0* T1389f13(T0* C, T0* a1)
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
	t1 = (T1389f15(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T1389f15(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(GE_void(a1), l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1389f15(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(GE_void(a1), l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T1389f15(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T17f39(l1, l5);
								} else {
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T1389*)(C))->a2), l3));
						if (t2) {
							t1 = (T1389f15(C));
							t5 = (T86f5(GE_void(((T1389*)(C))->a2), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T1389f15(C));
								t5 = (T1389f18(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T1389f15(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T1389f15(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T1389f18(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* ET_SYNTAX_ERROR.string_ */
T0* T1389f15(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* ET_CLUSTER_ERROR.default_message */
T0* T1388f12(T0* C)
{
	T0* R = 0;
	R = (T1388f7(C, ((T1388*)(C))->a1));
	return R;
}

/* ET_CLUSTER_ERROR.message */
T0* T1388f7(T0* C, T0* a1)
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
	t1 = (T1388f9(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T1388f9(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(GE_void(a1), l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1388f9(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(GE_void(a1), l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T1388f9(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T17f39(l1, l5);
								} else {
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T1388*)(C))->a2), l3));
						if (t2) {
							t1 = (T1388f9(C));
							t5 = (T86f5(GE_void(((T1388*)(C))->a2), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T1388f9(C));
								t5 = (T1388f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T1388f9(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T1388f9(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T1388f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* ET_CLUSTER_ERROR.string_ */
T0* T1388f9(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.default_message */
T0* T1168f5(T0* C)
{
	T0* R = 0;
	R = (T1168f3(C, ge1058ov4146));
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.message */
T0* T1168f3(T0* C, T0* a1)
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
	t1 = (T1168f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T1168f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1168f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T1168f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T1168*)(C))->a1), l3));
						if (t2) {
							t1 = (T1168f4(C));
							t5 = (T86f5(GE_void(((T1168*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T1168f4(C));
								t5 = (T1168f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T1168f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T1168f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T1168f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.string_ */
T0* T1168f4(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* UT_TOO_MANY_INCLUDES_ERROR.default_message */
T0* T1086f5(T0* C)
{
	T0* R = 0;
	R = (T1086f3(C, ge226ov4146));
	return R;
}

/* UT_TOO_MANY_INCLUDES_ERROR.message */
T0* T1086f3(T0* C, T0* a1)
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
	t1 = (T1086f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T1086f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1086f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T1086f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T1086*)(C))->a1), l3));
						if (t2) {
							t1 = (T1086f4(C));
							t5 = (T86f5(GE_void(((T1086*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T1086f4(C));
								t5 = (T1086f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T1086f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T1086f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T1086f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* UT_TOO_MANY_INCLUDES_ERROR.string_ */
T0* T1086f4(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* UT_SYNTAX_ERROR.default_message */
T0* T1085f5(T0* C)
{
	T0* R = 0;
	R = (T1085f3(C, ge225ov4146));
	return R;
}

/* UT_SYNTAX_ERROR.message */
T0* T1085f3(T0* C, T0* a1)
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
	t1 = (T1085f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T1085f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1085f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T1085f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T1085*)(C))->a1), l3));
						if (t2) {
							t1 = (T1085f4(C));
							t5 = (T86f5(GE_void(((T1085*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T1085f4(C));
								t5 = (T1085f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T1085f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T1085f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T1085f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* UT_SYNTAX_ERROR.string_ */
T0* T1085f4(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.default_message */
T0* T617f5(T0* C)
{
	T0* R = 0;
	R = (T617f3(C, ge1052ov4146));
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.message */
T0* T617f3(T0* C, T0* a1)
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
	t1 = (T617f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T617f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T617f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T617f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T617*)(C))->a1), l3));
						if (t2) {
							t1 = (T617f4(C));
							t5 = (T86f5(GE_void(((T617*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T617f4(C));
								t5 = (T617f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T617f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T617f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T617f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.string_ */
T0* T617f4(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.default_message */
T0* T616f5(T0* C)
{
	T0* R = 0;
	R = (T616f3(C, ge1068ov4146));
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.message */
T0* T616f3(T0* C, T0* a1)
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
	t1 = (T616f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T616f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T616f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T616f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T616*)(C))->a1), l3));
						if (t2) {
							t1 = (T616f4(C));
							t5 = (T86f5(GE_void(((T616*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T616f4(C));
								t5 = (T616f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T616f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T616f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T616f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.string_ */
T0* T616f4(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.default_message */
T0* T615f5(T0* C)
{
	T0* R = 0;
	R = (T615f3(C, ge1065ov4146));
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.message */
T0* T615f3(T0* C, T0* a1)
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
	t1 = (T615f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T615f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T615f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T615f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T615*)(C))->a1), l3));
						if (t2) {
							t1 = (T615f4(C));
							t5 = (T86f5(GE_void(((T615*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T615f4(C));
								t5 = (T615f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T615f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T615f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T615f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.string_ */
T0* T615f4(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.default_message */
T0* T614f5(T0* C)
{
	T0* R = 0;
	R = (T614f3(C, ge1064ov4146));
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.message */
T0* T614f3(T0* C, T0* a1)
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
	t1 = (T614f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T614f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T614f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T614f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T614*)(C))->a1), l3));
						if (t2) {
							t1 = (T614f4(C));
							t5 = (T86f5(GE_void(((T614*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T614f4(C));
								t5 = (T614f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T614f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T614f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T614f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.string_ */
T0* T614f4(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.default_message */
T0* T613f5(T0* C)
{
	T0* R = 0;
	R = (T613f3(C, ge1060ov4146));
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.message */
T0* T613f3(T0* C, T0* a1)
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
	t1 = (T613f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T613f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T613f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T613f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T613*)(C))->a1), l3));
						if (t2) {
							t1 = (T613f4(C));
							t5 = (T86f5(GE_void(((T613*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T613f4(C));
								t5 = (T613f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T613f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T613f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T613f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.string_ */
T0* T613f4(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.default_message */
T0* T612f5(T0* C)
{
	T0* R = 0;
	R = (T612f3(C, ge1067ov4146));
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.message */
T0* T612f3(T0* C, T0* a1)
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
	t1 = (T612f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T612f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T612f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T612f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T612*)(C))->a1), l3));
						if (t2) {
							t1 = (T612f4(C));
							t5 = (T86f5(GE_void(((T612*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T612f4(C));
								t5 = (T612f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T612f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T612f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T612f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.string_ */
T0* T612f4(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.default_message */
T0* T611f5(T0* C)
{
	T0* R = 0;
	R = (T611f3(C, ge1059ov4146));
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.message */
T0* T611f3(T0* C, T0* a1)
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
	t1 = (T611f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T611f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T611f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T611f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T611*)(C))->a1), l3));
						if (t2) {
							t1 = (T611f4(C));
							t5 = (T86f5(GE_void(((T611*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T611f4(C));
								t5 = (T611f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T611f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T611f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T611f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.string_ */
T0* T611f4(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.default_message */
T0* T610f5(T0* C)
{
	T0* R = 0;
	R = (T610f3(C, ge1071ov4146));
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.message */
T0* T610f3(T0* C, T0* a1)
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
	t1 = (T610f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T610f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T610f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T610f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T610*)(C))->a1), l3));
						if (t2) {
							t1 = (T610f4(C));
							t5 = (T86f5(GE_void(((T610*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T610f4(C));
								t5 = (T610f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T610f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T610f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T610f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.string_ */
T0* T610f4(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* ET_VALIDITY_ERROR.default_message */
T0* T607f29(T0* C)
{
	T0* R = 0;
	R = (T607f17(C, ((T607*)(C))->a4));
	return R;
}

/* ET_VALIDITY_ERROR.message */
T0* T607f17(T0* C, T0* a1)
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
	t1 = (T607f28(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T607f28(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(GE_void(a1), l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T607f28(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(GE_void(a1), l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T607f28(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T17f39(l1, l5);
								} else {
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T607*)(C))->a5), l3));
						if (t2) {
							t1 = (T607f28(C));
							t5 = (T86f5(GE_void(((T607*)(C))->a5), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T607f28(C));
								t5 = (T607f14(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T607f28(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T607f28(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T607f14(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* ET_VALIDITY_ERROR.string_ */
T0* T607f28(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* ET_INTERNAL_ERROR.default_message */
T0* T606f5(T0* C)
{
	T0* R = 0;
	R = (T606f7(C, ((T606*)(C))->a1));
	return R;
}

/* ET_INTERNAL_ERROR.message */
T0* T606f7(T0* C, T0* a1)
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
	t1 = (T606f9(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T606f9(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(GE_void(a1), l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T606f9(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(GE_void(a1), l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T606f9(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T17f39(l1, l5);
								} else {
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T606*)(C))->a2), l3));
						if (t2) {
							t1 = (T606f9(C));
							t5 = (T86f5(GE_void(((T606*)(C))->a2), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T606f9(C));
								t5 = (T606f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T606f9(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T606f9(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T606f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* ET_INTERNAL_ERROR.string_ */
T0* T606f9(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* ET_SYSTEM_ERROR.default_message */
T0* T605f5(T0* C)
{
	T0* R = 0;
	R = (T605f7(C, ((T605*)(C))->a1));
	return R;
}

/* ET_SYSTEM_ERROR.message */
T0* T605f7(T0* C, T0* a1)
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
	t1 = (T605f9(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T605f9(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(GE_void(a1), l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T605f9(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(GE_void(a1), l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T605f9(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T17f39(l1, l5);
								} else {
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T605*)(C))->a2), l3));
						if (t2) {
							t1 = (T605f9(C));
							t5 = (T86f5(GE_void(((T605*)(C))->a2), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T605f9(C));
								t5 = (T605f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T605f9(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T605f9(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T605f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* ET_SYSTEM_ERROR.string_ */
T0* T605f9(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.default_message */
T0* T320f5(T0* C)
{
	T0* R = 0;
	R = (T320f3(C, ge1055ov4146));
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.message */
T0* T320f3(T0* C, T0* a1)
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
	t1 = (T320f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T320f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T320f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T320f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T320*)(C))->a1), l3));
						if (t2) {
							t1 = (T320f4(C));
							t5 = (T86f5(GE_void(((T320*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T320f4(C));
								t5 = (T320f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T320f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T320f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T320f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.string_ */
T0* T320f4(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.default_message */
T0* T319f5(T0* C)
{
	T0* R = 0;
	R = (T319f3(C, ge1066ov4146));
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.message */
T0* T319f3(T0* C, T0* a1)
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
	t1 = (T319f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T319f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T319f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T319f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T319*)(C))->a1), l3));
						if (t2) {
							t1 = (T319f4(C));
							t5 = (T86f5(GE_void(((T319*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T319f4(C));
								t5 = (T319f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T319f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T319f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T319f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.string_ */
T0* T319f4(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.default_message */
T0* T318f5(T0* C)
{
	T0* R = 0;
	R = (T318f3(C, ge1070ov4146));
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.message */
T0* T318f3(T0* C, T0* a1)
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
	t1 = (T318f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T318f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T318f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T318f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T318*)(C))->a1), l3));
						if (t2) {
							t1 = (T318f4(C));
							t5 = (T86f5(GE_void(((T318*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T318f4(C));
								t5 = (T318f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T318f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T318f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T318f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.default_message */
T0* T317f5(T0* C)
{
	T0* R = 0;
	R = (T317f3(C, ge1062ov4146));
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.message */
T0* T317f3(T0* C, T0* a1)
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
	t1 = (T317f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T317f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T317f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T317f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T317*)(C))->a1), l3));
						if (t2) {
							t1 = (T317f4(C));
							t5 = (T86f5(GE_void(((T317*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T317f4(C));
								t5 = (T317f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T317f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T317f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T317f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.string_ */
T0* T317f4(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.default_message */
T0* T316f5(T0* C)
{
	T0* R = 0;
	R = (T316f3(C, ge1053ov4146));
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.message */
T0* T316f3(T0* C, T0* a1)
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
	t1 = (T316f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T316f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T316f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T316f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T316*)(C))->a1), l3));
						if (t2) {
							t1 = (T316f4(C));
							t5 = (T86f5(GE_void(((T316*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T316f4(C));
								t5 = (T316f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T316f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T316f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T316f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.string_ */
T0* T316f4(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.default_message */
T0* T315f5(T0* C)
{
	T0* R = 0;
	R = (T315f3(C, ge1061ov4146));
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.message */
T0* T315f3(T0* C, T0* a1)
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
	t1 = (T315f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T315f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T315f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T315f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T315*)(C))->a1), l3));
						if (t2) {
							t1 = (T315f4(C));
							t5 = (T86f5(GE_void(((T315*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T315f4(C));
								t5 = (T315f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T315f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T315f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T315f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.string_ */
T0* T315f4(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
T0* T227f2(T0* C)
{
	T0* R = 0;
	R = (T227f4(C, ge220ov4146));
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
T0* T227f4(T0* C, T0* a1)
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
	t1 = (T227f5(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T227f5(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T227f5(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T227f5(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T227*)(C))->a1), l3));
						if (t2) {
							t1 = (T227f5(C));
							t5 = (T86f5(GE_void(((T227*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T227f5(C));
								t5 = (T227f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T227f5(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T227f5(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T227f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
T0* T227f5(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* UT_MESSAGE.default_message */
T0* T114f5(T0* C)
{
	T0* R = 0;
	R = (T114f3(C, ge223ov4146));
	return R;
}

/* UT_MESSAGE.message */
T0* T114f3(T0* C, T0* a1)
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
	t1 = (T114f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T114f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T114f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T114f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T114*)(C))->a1), l3));
						if (t2) {
							t1 = (T114f4(C));
							t5 = (T86f5(GE_void(((T114*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T114f4(C));
								t5 = (T114f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T114f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T114f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T114f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* UT_MESSAGE.string_ */
T0* T114f4(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* UT_VERSION_NUMBER.default_message */
T0* T69f2(T0* C)
{
	T0* R = 0;
	R = (T69f4(C, ge230ov4146));
	return R;
}

/* UT_VERSION_NUMBER.message */
T0* T69f4(T0* C, T0* a1)
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
	t1 = (T69f5(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T69f5(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T69f5(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T69f5(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T69*)(C))->a1), l3));
						if (t2) {
							t1 = (T69f5(C));
							t5 = (T86f5(GE_void(((T69*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T69f5(C));
								t5 = (T69f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T69f5(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T69f5(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T69f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* UT_VERSION_NUMBER.string_ */
T0* T69f5(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.default_message */
T0* T68f2(T0* C)
{
	T0* R = 0;
	R = (T68f4(C, ge219ov4146));
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.message */
T0* T68f4(T0* C, T0* a1)
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
	t1 = (T68f5(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T68f5(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T68f5(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T68f5(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T68*)(C))->a1), l3));
						if (t2) {
							t1 = (T68f5(C));
							t5 = (T86f5(GE_void(((T68*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T68f5(C));
								t5 = (T68f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T68f5(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T68f5(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T68f6(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.string_ */
T0* T68f5(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
	return R;
}

/* AP_ERROR.default_message */
T0* T32f16(T0* C)
{
	T0* R = 0;
	R = (T32f17(C, ((T32*)(C))->a2));
	return R;
}

/* AP_ERROR.message */
T0* T32f17(T0* C, T0* a1)
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
	t1 = (T32f18(C));
	R = (T26f7(GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f1(&l2, l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T636f58(R, l5);
				}
			} else {
				t1 = (T32f18(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T636f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(GE_void(a1), l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T636f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T32f18(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(GE_void(a1), l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T636f58(l1, l5);
									}
								} else {
									t1 = (T32f18(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f1(&l2, l4));
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
									T17f39(l1, l5);
								} else {
									T636f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T636f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T636f36(l1)));
						t2 = (T86f4(GE_void(((T32*)(C))->a1), l3));
						if (t2) {
							t1 = (T32f18(C));
							t5 = (T86f5(GE_void(((T32*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T32f18(C));
								t5 = (T32f19(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T636f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T636f58(R, (T2)('{'));
									}
								}
								t1 = (T32f18(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T636f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T636f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T636f58(R, (T2)('{'));
							}
						}
						t1 = (T32f18(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T636f58(R, (T2)('}'));
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
T0* T32f19(T0* C)
{
	T0* R = 0;
	if (ge321os1721) {
		return ge321ov1721;
	} else {
		ge321os1721 = '\1';
		ge321ov1721 = R;
	}
	R = T23c4();
	ge321ov1721 = R;
	return R;
}

/* AP_ERROR.string_ */
T0* T32f18(T0* C)
{
	T0* R = 0;
	if (ge274os1729) {
		return ge274ov1729;
	} else {
		ge274os1729 = '\1';
		ge274ov1729 = R;
	}
	R = T26c19();
	ge274ov1729 = R;
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
	R = (((T96*)(GE_void(((T37*)(C))->a1)))->a1);
	return R;
}

/* AP_BOOLEAN_OPTION.occurrences */
T6 T36f10(T0* C)
{
	T6 R = 0;
	R = (((T93*)(GE_void(((T36*)(C))->a1)))->a1);
	return R;
}

/* AP_ENUMERATION_OPTION.occurrences */
T6 T35f17(T0* C)
{
	T6 R = 0;
	R = (((T80*)(GE_void(((T35*)(C))->a1)))->a1);
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
	R = T17c36((T6)(GE_int32(20)));
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
	R = T17c36((T6)(GE_int32(20)));
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
	R = T17c36((T6)(GE_int32(20)));
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
	R = T17c36((T6)(GE_int32(20)));
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
	R = T17c36((T6)(GE_int32(20)));
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
T2 T637f6(T0* C)
{
	T6 t1;
	T1 t2;
	T2 R = 0;
	t1 = (((T1199*)(GE_void(((T637*)(C))->a3)))->a1);
	t2 = (T6f1(&t1, (T6)(GE_int32(0))));
	if (t2) {
		R = (T1199f5(GE_void(((T637*)(C))->a3)));
	} else {
		R = (((((T0*)(GE_void(((T637*)(C))->a4)))->id==22)?((T22*)(((T637*)(C))->a4))->a9:((T1539*)(((T637*)(C))->a4))->a2));
	}
	return R;
}

/* DS_LINKED_QUEUE [CHARACTER_8].item */
T2 T1199f5(T0* C)
{
	T2 R = 0;
	R = (((T1447*)(GE_void(((T1199*)(C))->a2)))->a1);
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.end_of_input */
T1 T637f21(T0* C)
{
	T6 t1;
	T1 t2;
	T1 R = 0;
	t1 = (((T1199*)(GE_void(((T637*)(C))->a3)))->a1);
	t2 = ((t1)==((T6)(GE_int32(0))));
	if (t2) {
		R = (((((T0*)(GE_void(((T637*)(C))->a4)))->id==22)?T22f25(((T637*)(C))->a4):((T1539*)(((T637*)(C))->a4))->a1));
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
T1 T668f11(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.is_closable */
T1 T637f7(T0* C)
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
T6 T668f16(T0* C, T0* a1, T6 a2, T6 a3)
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
		t1 = ((l1)==(a3));
		if (!(t1)) {
			t1 = ((((T668*)(C))->a4)==(EIF_VOID));
		}
		if (t1) {
			break;
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t2 = ((GE_void(((T668*)(C))->a4), (T2)0));
		T17f53(GE_void(a1), t2, l2);
		((T668*)(C))->a4 = ((GE_void(((T668*)(C))->a4), (T0*)0));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
	}
	t1 = ((T1)((l1)<(a3)));
	if (t1) {
		t1 = (T668f7(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T668f8(C));
			t1 = (T79f1(GE_void(t3), a1, ge417ov26392));
			if (t1) {
				t4 = ((T6)((a3)-(l1)));
				t4 = (T668f10(C, a1, l2, t4));
				R = ((T6)((l1)+(t4)));
			} else {
				l4 = ((T6)((a3)-(l1)));
				l5 = T17c36(l4);
				T17f48(GE_void(l5), l4);
				l4 = (T668f10(C, l5, (T6)(GE_int32(1)), l4));
				l3 = (T6)(GE_int32(1));
				while (1) {
					t1 = (T6f1(&l3, l4));
					if (t1) {
						break;
					}
					t2 = (T17f10(GE_void(l5), l3));
					T17f53(GE_void(a1), t2, l2);
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
					l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
				}
				R = ((T6)((l1)+(l4)));
			}
		} else {
			R = l1;
		}
		((T668*)(C))->a1 = (T668f7(C));
	} else {
		R = l1;
	}
	return R;
}

/* KL_STDIN_FILE.old_read_to_string */
T6 T668f10(T0* C, T0* a1, T6 a2, T6 a3)
{
	T0* t1;
	T6 t2;
	T14 t3;
	T6 R = 0;
	t1 = (((T17*)(GE_void(a1)))->a1);
	t2 = ((T6)((a2)-((T6)(GE_int32(1)))));
	t3 = (T15f5(GE_void(t1), t2));
	R = (T668f13(C, ((T668*)(C))->a5, t3, a3));
	return R;
}

/* KL_STDIN_FILE.file_gss */
T6 T668f13(T0* C, T14 a1, T14 a2, T6 a3)
{
	T6 R = 0;
	R = (T6)(EIF_INTEGER )file_gss((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
	return R;
}

/* KL_STDIN_FILE.any_ */
T0* T668f8(T0* C)
{
	T0* R = 0;
	if (ge266os1814) {
		return ge266ov1814;
	} else {
		ge266os1814 = '\1';
		ge266ov1814 = R;
	}
	R = T79c5();
	ge266ov1814 = R;
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.read_to_string */
T6 T637f28(T0* C, T0* a1, T6 a2, T6 a3)
{
	T1 t1;
	T6 t2;
	T2 t3;
	T6 R = 0;
	t1 = ((((T637*)(C))->a2)==((T6)(GE_int32(6))));
	if (!(t1)) {
		t1 = ((((T637*)(C))->a2)==((T6)(GE_int32(2))));
	}
	if (!(t1)) {
		t2 = (((T1199*)(GE_void(((T637*)(C))->a3)))->a1);
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		T637f32(C);
		t1 = (T637f21(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T637f6(C));
			T17f53(GE_void(a1), t3, a2);
			R = (T6)(GE_int32(1));
		} else {
			R = (T6)(GE_int32(0));
		}
	} else {
		t1 = ((((T637*)(C))->a2)==((T6)(GE_int32(1))));
		if (t1) {
			R = (((((T0*)(GE_void(((T637*)(C))->a4)))->id==22)?T22f29(((T637*)(C))->a4, a1, a2, a3):T1539f7(((T637*)(C))->a4, a1, a2, a3)));
		} else {
			R = (T637f28p1(C, a1, a2, a3));
		}
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.read_to_string */
T6 T637f28p1(T0* C, T0* a1, T6 a2, T6 a3)
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
		t2 = (T6f1(&l1, l2));
		if (t2) {
			break;
		}
		T637f32(C);
		t2 = (T637f21(C));
		t2 = ((T1)(!(t2)));
		if (t2) {
			t3 = (T637f6(C));
			T17f53(GE_void(a1), t3, l1);
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
T6 T1539f7(T0* C, T0* a1, T6 a2, T6 a3)
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
		t2 = (T6f1(&l1, l2));
		if (t2) {
			break;
		}
		T1539f9(C);
		t2 = ((T1)(!(((T1539*)(C))->a1)));
		if (t2) {
			T17f53(GE_void(a1), ((T1539*)(C))->a2, l1);
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
		t1 = ((l5)==(a3));
		if (!(t1)) {
			t1 = ((((T22*)(C))->a4)==(EIF_VOID));
		}
		if (t1) {
			break;
		}
		l5 = ((T6)((l5)+((T6)(GE_int32(1)))));
		t2 = (((T72*)(GE_void(((T22*)(C))->a4)))->a1);
		T17f53(GE_void(a1), t2, l1);
		((T22*)(C))->a4 = (((T72*)(GE_void(((T22*)(C))->a4)))->a2);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	t1 = ((T1)((l5)<(a3)));
	if (t1) {
		t1 = (T22f27(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T22f36(C));
			t1 = (T79f1(GE_void(t3), a1, ge403ov1834));
			if (t1) {
				t4 = ((T6)((a3)-(l5)));
				t4 = (T22f28(C, a1, l1, t4));
				l5 = ((T6)((l5)+(t4)));
			} else {
				t3 = (T22f36(C));
				t5 = (T22f38(C));
				t1 = (T79f1(GE_void(t3), a1, t5));
				if (t1) {
					t4 = ((T6)((a3)-(l5)));
					t4 = (T22f28(C, a1, l1, t4));
					l5 = ((T6)((l5)+(t4)));
				} else {
					l4 = ((T6)((a3)-(l5)));
					l2 = T17c36(l4);
					T17f48(GE_void(l2), l4);
					l4 = (T22f28(C, l2, (T6)(GE_int32(1)), l4));
					l3 = (T6)(GE_int32(1));
					while (1) {
						t1 = (T6f1(&l3, l4));
						if (t1) {
							break;
						}
						t2 = (T17f10(GE_void(l2), l3));
						T17f53(GE_void(a1), t2, l1);
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
unsigned char ge403os1835 = '\0';
T0* ge403ov1835;
T0* T22f38(T0* C)
{
	T0* R = 0;
	if (ge403os1835) {
		return ge403ov1835;
	} else {
		ge403os1835 = '\1';
		ge403ov1835 = R;
	}
	R = T640c10((T6)(GE_int32(0)));
	ge403ov1835 = R;
	return R;
}

/* KL_TEXT_INPUT_FILE.any_ */
T0* T22f36(T0* C)
{
	T0* R = 0;
	if (ge266os1814) {
		return ge266ov1814;
	} else {
		ge266os1814 = '\1';
		ge266ov1814 = R;
	}
	R = T79c5();
	ge266ov1814 = R;
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.name */
T0* T637f5(T0* C)
{
	T0* R = 0;
	R = (((((T0*)(GE_void(((T637*)(C))->a4)))->id==22)?((T22*)(((T637*)(C))->a4))->a2:T1539f6(((T637*)(C))->a4)));
	return R;
}

/* KL_STRING_INPUT_STREAM.name */
unsigned char ge307os1810 = '\0';
T0* ge307ov1810;
T0* T1539f6(T0* C)
{
	T0* R = 0;
	if (ge307os1810) {
		return ge307ov1810;
	} else {
		ge307os1810 = '\1';
		ge307ov1810 = R;
	}
	R = GE_ms8("STRING", 6);
	ge307ov1810 = R;
	return R;
}

/* ET_LACE_SYSTEM.dotnet_assembly_consumer */
T0* T56f151(T0* C)
{
	T1 t1;
	T0* R = 0;
	R = ((T56*)(C))->a142;
	t1 = ((R)==(EIF_VOID));
	if (t1) {
		R = T620c3(C);
		((T56*)(C))->a142 = R;
	}
	return R;
}

/* ET_DOTNET_ASSEMBLY_CLASSIC_CONSUMER.make */
T0* T620c3(T0* a1)
{
	T0* C;
	C = GE_new620(EIF_TRUE);
	((T620*)(C))->a1 = a1;
	return C;
}

/* ET_XACE_SYSTEM.dotnet_assembly_consumer */
T0* T53f165(T0* C)
{
	T1 t1;
	T0* R = 0;
	R = ((T53*)(C))->a146;
	t1 = ((R)==(EIF_VOID));
	if (t1) {
		R = T620c3(C);
		((T53*)(C))->a146 = R;
	}
	return R;
}

/* ET_SYSTEM.dotnet_assembly_consumer */
T0* T25f141(T0* C)
{
	T1 t1;
	T0* R = 0;
	R = ((T25*)(C))->a126;
	t1 = ((R)==(EIF_VOID));
	if (t1) {
		R = T620c3(C);
		((T25*)(C))->a126 = R;
	}
	return R;
}

/* ET_LACE_SYSTEM.is_dotnet */
T1 T56f164(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T56*)(C))->a69)!=(EIF_VOID));
	if (t1) {
		t2 = (T138f3(GE_void(((T56*)(C))->a69)));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_ADAPTED_DOTNET_ASSEMBLIES.count */
T6 T138f3(T0* C)
{
	T6 R = 0;
	R = (((T479*)(GE_void(((T138*)(C))->a1)))->a1);
	return R;
}

/* ET_XACE_SYSTEM.is_dotnet */
T1 T53f168(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T53*)(C))->a59)!=(EIF_VOID));
	if (t1) {
		t2 = (T138f3(GE_void(((T53*)(C))->a59)));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_SYSTEM.is_dotnet */
T1 T25f144(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T25*)(C))->a33)!=(EIF_VOID));
	if (t1) {
		t2 = (T138f3(GE_void(((T25*)(C))->a33)));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LACE_SYSTEM.is_ise */
T1 T56f147(T0* C)
{
	T1 R = 0;
	R = ((((T56*)(C))->a30)!=(EIF_VOID));
	return R;
}

/* ET_XACE_SYSTEM.is_ise */
T1 T53f153(T0* C)
{
	T1 R = 0;
	R = ((((T53*)(C))->a30)!=(EIF_VOID));
	return R;
}

/* ET_SYSTEM.is_ise */
T1 T25f138(T0* C)
{
	T1 R = 0;
	R = ((((T25*)(C))->a121)!=(EIF_VOID));
	return R;
}

/* XM_NAMESPACE.is_equal */
T1 T1395f4(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T0* t3;
	T1 R = 0;
	t1 = (((T1395*)(GE_void(a1)))->a1);
	t2 = ((((T1395*)(C))->a1)==(t1));
	if (!(t2)) {
		t2 = ((((T1395*)(C))->a1)!=(EIF_VOID));
		if (t2) {
			t1 = (T1395f3(C));
			t3 = (((T1395*)(GE_void(a1)))->a1);
			R = (T26f1(GE_void(t1), ((T1395*)(C))->a1, t3));
		} else {
			R = EIF_FALSE;
		}
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* XM_EIFFEL_PARSER_NAME.is_equal */
T1 T432f10(T0* C, T0* a1)
{
	T6 t1;
	T1 t2;
	T0* t3;
	T0* t4;
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	t1 = (((T432*)(GE_void(a1)))->a2);
	t2 = ((((T432*)(C))->a2)==(t1));
	if (t2) {
		t2 = ((((T432*)(C))->a2)==((T6)(GE_int32(0))));
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = ((((T432*)(C))->a2)==((T6)(GE_int32(1))));
			if (t2) {
				t3 = (((T432*)(GE_void(a1)))->a3);
				R = (T432f15(C, ((T432*)(C))->a3, t3));
			} else {
				t2 = ((((T432*)(C))->a2)==((T6)(GE_int32(2))));
				if (t2) {
					t3 = (((T432*)(GE_void(a1)))->a3);
					t2 = (T432f15(C, ((T432*)(C))->a3, t3));
					if (t2) {
						t3 = (((T432*)(GE_void(a1)))->a4);
						R = (T432f15(C, ((T432*)(C))->a4, t3));
					} else {
						R = EIF_FALSE;
					}
				} else {
					t3 = (((T432*)(GE_void(a1)))->a3);
					t2 = (T432f15(C, ((T432*)(C))->a3, t3));
					if (t2) {
						t3 = (((T432*)(GE_void(a1)))->a4);
						R = (T432f15(C, ((T432*)(C))->a4, t3));
					} else {
						R = EIF_FALSE;
					}
					l1 = (T439f6(GE_void(((T432*)(C))->a5)));
					T1110f8(GE_void(l1));
					t3 = (((T432*)(GE_void(a1)))->a5);
					l2 = (T439f6(GE_void(t3)));
					T1110f8(GE_void(l2));
					while (1) {
						t2 = (((T1110*)(GE_void(l1)))->a3);
						if (!(t2)) {
							t2 = ((T1)(!(R)));
						}
						if (t2) {
							break;
						}
						t3 = (T1110f6(GE_void(l1)));
						t4 = (T1110f6(GE_void(l2)));
						R = (T432f15(C, t3, t4));
						T1110f9(GE_void(l1));
						T1110f9(GE_void(l2));
					}
				}
			}
		}
	}
	return R;
}

/* XM_EIFFEL_PARSER_NAME.same_string */
T1 T432f15(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T1 R = 0;
	t1 = (T432f8(C));
	R = (T48f1(GE_void(t1), a1, a2));
	return R;
}

/* ET_IDENTIFIER.is_equal */
T1 T129f39(T0* C, T0* a1)
{
	T0* t1;
	T1 t2;
	T1 R = 0;
	t1 = (T129f48(C));
	t2 = (T79f1(GE_void(t1), C, a1));
	if (t2) {
		R = (T129f37(C, a1));
	}
	return R;
}

/* STRING_8.is_equal */
T1 T17f19(T0* C, T0* a1)
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
		t2 = (((((T0*)(GE_void(a1)))->id==17)?((T17*)(a1))->a2:((T636*)(a1))->a1));
		t1 = ((l1)==(t2));
		if (t1) {
			t3 = (((((T0*)(GE_void(a1)))->id==17)?((T17*)(a1))->a1:((T636*)(a1))->a2));
			t2 = (T17f21(C, ((T17*)(C))->a1, t3, l1));
			R = ((t2)==((T6)(GE_int32(0))));
		}
	}
	return R;
}

/* STRING_8.str_strict_cmp */
T6 T17f21(T0* C, T0* a1, T0* a2, T6 a3)
{
	T1 t1;
	T2 t2;
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	while (1) {
		t1 = ((l1)==(a3));
		if (t1) {
			break;
		}
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
	}
	return R;
}

T0* GE_ma573(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new572(c, EIF_FALSE);
	*(T572*)t1 = GE_default572;
	((T572*)(t1))->z1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T572*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new573(EIF_TRUE);
	((T573*)(R))->a1 = t1;
	((T573*)(R))->a2 = 1;
	((T573*)(R))->a3 = c;
	return R;
}

T0* GE_ma86(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new85(c, EIF_FALSE);
	*(T85*)t1 = GE_default85;
	((T85*)(t1))->z1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T85*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new86(EIF_TRUE);
	((T86*)(R))->a1 = t1;
	((T86*)(R))->a2 = 1;
	((T86*)(R))->a3 = c;
	return R;
}

T0* GE_ma392(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new117(c, EIF_FALSE);
	*(T117*)t1 = GE_default117;
	((T117*)(t1))->z1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T6 *i = ((T117*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T6);
		}
		va_end(v);
	}
	R = GE_new392(EIF_TRUE);
	((T392*)(R))->a1 = t1;
	((T392*)(R))->a2 = 1;
	((T392*)(R))->a3 = c;
	return R;
}

T0* GE_ma415(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new414(c, EIF_FALSE);
	*(T414*)t1 = GE_default414;
	((T414*)(t1))->z1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T414*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new415(EIF_TRUE);
	((T415*)(R))->a1 = t1;
	((T415*)(R))->a2 = 1;
	((T415*)(R))->a3 = c;
	return R;
}

T0* GE_ma1184(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new597(c, EIF_FALSE);
	*(T597*)t1 = GE_default597;
	((T597*)(t1))->z1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T597*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new1184(EIF_TRUE);
	((T1184*)(R))->a1 = t1;
	((T1184*)(R))->a2 = 1;
	((T1184*)(R))->a3 = c;
	return R;
}

T0* GE_mt157()
{
	T0* R;
	R = GE_new157(EIF_TRUE);
	return R;
}

T0* ge416ov9740;
T0* ge420ov2982;
T0* ge349ov25786;
T0* ge426ov10526;
T0* ge418ov9740;
T0* ge992ov7576;
T0* ge992ov7581;
T0* ge392ov1854;
T0* ge1213ov15866;
T0* ge1213ov15851;
T0* ge1213ov15844;
T0* ge1213ov15829;
T0* ge1213ov15854;
T0* ge1213ov15847;
T0* ge1213ov15855;
T0* ge1213ov15864;
T0* ge1213ov15857;
T0* ge1213ov15853;
T0* ge1213ov15841;
T0* ge1213ov15842;
T0* ge1213ov15856;
T0* ge1213ov15843;
T0* ge1213ov15830;
T0* ge1213ov15831;
T0* ge1213ov15832;
T0* ge1213ov15838;
T0* ge1213ov15840;
T0* ge1213ov15835;
T0* ge1213ov15860;
T0* ge1213ov15859;
T0* ge1213ov15836;
T0* ge1213ov15837;
T0* ge1213ov15834;
T0* ge1213ov15833;
T0* ge1209ov15624;
T0* ge992ov7578;
T0* ge992ov7580;
T0* ge992ov7459;
T0* ge992ov7491;
T0* ge992ov7468;
T0* ge992ov7463;
T0* ge992ov7550;
T0* ge805ov13197;
T0* ge805ov13156;
T0* ge805ov13282;
T0* ge992ov7548;
T0* ge992ov7496;
T0* ge992ov7498;
T0* ge992ov7561;
T0* ge992ov7518;
T0* ge992ov7512;
T0* ge992ov7454;
T0* ge992ov7544;
T0* ge992ov7510;
T0* ge805ov13175;
T0* ge805ov13108;
T0* ge987ov24640;
T0* ge987ov24639;
T0* ge987ov24638;
T0* ge805ov13256;
T0* ge992ov7542;
T0* ge992ov7499;
T0* ge992ov7493;
T0* ge992ov7543;
T0* ge992ov7469;
T0* ge992ov7492;
T0* ge992ov7552;
T0* ge992ov7572;
T0* ge992ov7514;
T0* ge992ov7516;
T0* ge992ov7515;
T0* ge992ov7565;
T0* ge992ov7456;
T0* ge992ov7517;
T0* ge992ov7547;
T0* ge992ov7497;
T0* ge992ov7546;
T0* ge992ov7533;
T0* ge992ov7559;
T0* ge992ov7562;
T0* ge992ov7501;
T0* ge805ov13259;
T0* ge992ov7528;
T0* ge992ov7509;
T0* ge992ov7525;
T0* ge992ov7511;
T0* ge992ov7453;
T0* ge992ov7455;
T0* ge992ov7458;
T0* ge992ov7535;
T0* ge992ov7502;
T0* ge992ov7563;
T0* ge992ov7568;
T0* ge992ov7527;
T0* ge992ov7526;
T0* ge992ov7536;
T0* ge992ov7460;
T0* ge992ov7519;
T0* ge992ov7513;
T0* ge992ov7457;
T0* ge992ov7466;
T0* ge992ov7487;
T0* ge992ov7485;
T0* ge992ov7478;
T0* ge992ov7477;
T0* ge992ov7476;
T0* ge992ov7475;
T0* ge992ov7473;
T0* ge992ov7488;
T0* ge992ov7465;
T0* ge992ov7462;
T0* ge992ov7534;
T0* ge992ov7520;
T0* ge992ov7507;
T0* ge992ov7558;
T0* ge805ov13190;
T0* ge992ov7494;
T0* ge805ov13130;
T0* ge992ov7551;
T0* ge992ov7503;
T0* ge992ov7504;
T0* ge992ov7549;
T0* ge992ov7505;
T0* ge992ov7506;
T0* ge992ov7560;
T0* ge992ov7538;
T0* ge992ov7577;
T0* ge992ov7461;
T0* ge992ov7569;
T0* ge992ov7564;
T0* ge992ov7470;
T0* ge992ov7557;
T0* ge992ov7483;
T0* ge992ov7482;
T0* ge992ov7481;
T0* ge992ov7480;
T0* ge992ov7474;
T0* ge992ov7472;
T0* ge992ov7471;
T0* ge992ov7467;
T0* ge805ov13099;
T0* ge992ov7486;
T0* ge805ov13120;
T0* ge992ov7479;
T0* ge805ov13110;
T0* ge805ov13103;
T0* ge992ov7495;
T0* ge805ov13133;
T0* ge992ov7464;
T0* ge805ov13096;
T0* ge805ov13278;
T0* ge805ov13272;
T0* ge805ov13134;
T0* ge990ov24628;
T0* ge990ov24622;
T0* ge990ov24616;
T0* ge990ov24624;
T0* ge990ov24618;
T0* ge990ov24612;
T0* ge990ov24627;
T0* ge990ov24621;
T0* ge990ov24615;
T0* ge990ov24629;
T0* ge990ov24623;
T0* ge990ov24617;
T0* ge805ov13168;
T0* ge990ov24626;
T0* ge990ov24620;
T0* ge990ov24614;
T0* ge805ov13192;
T0* ge805ov13162;
T0* ge805ov13245;
T0* ge805ov13211;
T0* ge805ov13254;
T0* ge805ov13200;
T0* ge805ov13166;
T0* ge991ov25536;
T0* ge991ov25284;
T0* ge991ov25144;
T0* ge991ov25534;
T0* ge991ov25282;
T0* ge991ov25142;
T0* ge991ov25535;
T0* ge991ov25283;
T0* ge991ov25143;
T0* ge805ov13136;
T0* ge990ov24625;
T0* ge990ov24619;
T0* ge990ov24613;
T0* ge393ov9793;
T0* ge983ov31611;
T0* ge983ov31609;
T0* ge983ov31607;
T0* ge805ov13383;
T0* ge805ov13125;
T0* ge805ov13380;
T0* ge805ov13374;
T0* ge805ov13369;
T0* ge805ov13368;
T0* ge805ov13365;
T0* ge805ov13132;
T0* ge805ov13131;
T0* ge805ov13129;
T0* ge805ov13295;
T0* ge805ov13128;
T0* ge805ov13127;
T0* ge805ov13126;
T0* ge805ov13124;
T0* ge805ov13123;
T0* ge805ov13382;
T0* ge805ov13122;
T0* ge805ov13381;
T0* ge805ov13121;
T0* ge805ov13119;
T0* ge805ov13118;
T0* ge805ov13379;
T0* ge805ov13117;
T0* ge805ov13116;
T0* ge805ov13115;
T0* ge805ov13378;
T0* ge805ov13114;
T0* ge805ov13377;
T0* ge805ov13113;
T0* ge805ov13376;
T0* ge805ov13112;
T0* ge805ov13375;
T0* ge805ov13111;
T0* ge805ov13109;
T0* ge805ov13373;
T0* ge805ov13107;
T0* ge805ov13372;
T0* ge805ov13106;
T0* ge805ov13371;
T0* ge805ov13105;
T0* ge805ov13370;
T0* ge805ov13104;
T0* ge805ov13102;
T0* ge805ov13101;
T0* ge805ov13100;
T0* ge805ov13367;
T0* ge805ov13098;
T0* ge805ov13366;
T0* ge805ov13097;
T0* ge805ov13364;
T0* ge805ov13095;
T0* ge805ov13094;
T0* ge805ov13092;
T0* ge805ov13091;
T0* ge805ov13093;
T0* ge1327ov11173;
T0* ge1327ov11172;
T0* ge1049ov4476;
T0* ge1049ov4477;
T0* ge1049ov4478;
T0* ge1049ov4479;
T0* ge1049ov4480;
T0* ge1049ov4481;
T0* ge1049ov4482;
T0* ge1049ov4483;
T0* ge1049ov4484;
T0* ge1049ov4485;
T0* ge1049ov4486;
T0* ge1049ov4487;
T0* ge1049ov4488;
T0* ge1049ov4489;
T0* ge1049ov4490;
T0* ge1049ov4491;
T0* ge1049ov4492;
T0* ge1049ov4493;
T0* ge1049ov4494;
T0* ge1049ov4495;
T0* ge1049ov4496;
T0* ge1049ov4497;
T0* ge1049ov4498;
T0* ge1049ov4499;
T0* ge1049ov4500;
T0* ge1049ov4501;
T0* ge1049ov4502;
T0* ge1049ov4503;
T0* ge1049ov4504;
T0* ge1049ov4505;
T0* ge1049ov4506;
T0* ge1049ov4507;
T0* ge1049ov4508;
T0* ge1049ov4509;
T0* ge1049ov4510;
T0* ge1049ov4511;
T0* ge1049ov4512;
T0* ge1049ov4513;
T0* ge1049ov4514;
T0* ge1049ov4515;
T0* ge1049ov4516;
T0* ge1049ov4517;
T0* ge1049ov4518;
T0* ge1049ov4519;
T0* ge1049ov4520;
T0* ge1049ov4521;
T0* ge1049ov4522;
T0* ge1049ov4523;
T0* ge1049ov4524;
T0* ge1049ov4525;
T0* ge1049ov4526;
T0* ge1049ov4527;
T0* ge1049ov4528;
T0* ge1049ov4529;
T0* ge1049ov4530;
T0* ge1049ov4531;
T0* ge1049ov4532;
T0* ge1049ov4533;
T0* ge1049ov4534;
T0* ge1049ov4535;
T0* ge1049ov4536;
T0* ge1049ov4537;
T0* ge1049ov4538;
T0* ge1049ov4539;
T0* ge1049ov4540;
T0* ge1049ov4541;
T0* ge1049ov4542;
T0* ge1049ov4543;
T0* ge1049ov4544;
T0* ge1049ov4545;
T0* ge1049ov4546;
T0* ge1049ov4547;
T0* ge1049ov4548;
T0* ge1049ov4549;
T0* ge1049ov4550;
T0* ge1049ov4551;
T0* ge1049ov4552;
T0* ge1049ov4553;
T0* ge1049ov4554;
T0* ge1049ov4555;
T0* ge1049ov4556;
T0* ge1049ov4557;
T0* ge1049ov4558;
T0* ge1049ov4559;
T0* ge1049ov4560;
T0* ge1049ov4561;
T0* ge1049ov4562;
T0* ge1049ov4563;
T0* ge1049ov4564;
T0* ge1049ov4565;
T0* ge1049ov4566;
T0* ge1049ov4567;
T0* ge1049ov4568;
T0* ge1049ov4666;
T0* ge1049ov4677;
T0* ge1082ov4443;
T0* ge1049ov4686;
T0* ge1049ov4673;
T0* ge1049ov4678;
T0* ge1049ov4679;
T0* ge1049ov4680;
T0* ge1049ov4667;
T0* ge1049ov4684;
T0* ge1049ov4688;
T0* ge1049ov4671;
T0* ge1049ov4663;
T0* ge1049ov4674;
T0* ge1049ov4672;
T0* ge1049ov4669;
T0* ge1049ov4683;
T0* ge1049ov4682;
T0* ge1049ov4665;
T0* ge1049ov4687;
T0* ge1049ov4664;
T0* ge1049ov4670;
T0* ge1049ov4685;
T0* ge1049ov4681;
T0* ge1049ov4675;
T0* ge1049ov4668;
T0* ge1049ov4691;
T0* ge1049ov4676;
T0* ge1049ov4689;
T0* ge1082ov4442;
T0* ge1082ov4441;
T0* ge1039ov18385;
T0* ge1045ov17438;
T0* ge1334ov11709;
T0* ge1334ov11671;
T0* ge1334ov11669;
T0* ge1334ov11710;
T0* ge1334ov11682;
T0* ge1334ov11681;
T0* ge1334ov11692;
T0* ge1334ov11686;
T0* ge1334ov11685;
T0* ge1334ov11684;
T0* ge1334ov11690;
T0* ge1334ov11689;
T0* ge1334ov11691;
T0* ge1334ov11668;
T0* ge1334ov11694;
T0* ge1334ov11703;
T0* ge1337ov11524;
T0* ge1337ov11522;
T0* ge1337ov11523;
T0* ge1334ov11704;
T0* ge1334ov11705;
T0* ge1334ov11708;
T0* ge1334ov11706;
T0* ge1334ov11707;
T0* ge1334ov11701;
T0* ge1330ov23629;
T0* ge1330ov23630;
T0* ge1334ov11674;
T0* ge1334ov11697;
T0* ge1334ov11717;
T0* ge1334ov11718;
T0* ge1334ov11719;
T0* ge1334ov11712;
T0* ge1334ov11695;
T0* ge1334ov11696;
T0* ge1334ov11698;
T0* ge1334ov11702;
T0* ge1126ov5243;
T0* ge57ov4130;
T0* ge57ov4137;
T0* ge55ov4378;
T0* ge318ov1718;
T0* ge54ov3611;
T0* ge57ov4133;
T0* ge57ov4140;
T0* ge57ov4131;
T0* ge57ov4138;
T0* ge57ov4132;
T0* ge57ov4139;
T0* ge57ov4134;
T0* ge57ov4141;
T0* ge57ov4135;
T0* ge57ov4142;
T0* ge54ov3606;
T0* ge54ov3605;
T0* ge54ov3613;
T0* ge54ov3612;
T0* ge1341ov23335;
T0* ge1341ov23336;
T0* ge1332ov25794;
T0* ge1332ov25796;
T0* ge891ov14844;
T0* ge884ov28075;
T0* ge887ov27677;
T0* ge863ov27705;
T0* ge991ov25508;
T0* ge991ov25263;
T0* ge991ov25116;
T0* ge991ov25507;
T0* ge991ov25115;
T0* ge991ov25327;
T0* ge991ov25174;
T0* ge991ov24935;
T0* ge805ov13299;
T0* ge991ov25505;
T0* ge991ov25262;
T0* ge991ov25113;
T0* ge991ov25504;
T0* ge991ov25112;
T0* ge991ov25326;
T0* ge991ov25173;
T0* ge991ov24934;
T0* ge991ov25295;
T0* ge991ov25159;
T0* ge991ov24903;
T0* ge991ov25510;
T0* ge991ov25265;
T0* ge991ov25118;
T0* ge991ov25543;
T0* ge991ov25289;
T0* ge991ov25151;
T0* ge991ov25544;
T0* ge991ov25152;
T0* ge991ov25541;
T0* ge991ov25288;
T0* ge991ov25149;
T0* ge991ov25542;
T0* ge991ov25150;
T0* ge991ov25424;
T0* ge991ov25220;
T0* ge991ov25032;
T0* ge991ov25547;
T0* ge991ov25291;
T0* ge991ov25155;
T0* ge991ov25548;
T0* ge991ov25156;
T0* ge991ov25545;
T0* ge991ov25290;
T0* ge991ov25153;
T0* ge991ov25546;
T0* ge991ov25154;
T0* ge991ov25422;
T0* ge991ov25219;
T0* ge991ov25030;
T0* ge991ov25364;
T0* ge991ov25191;
T0* ge991ov24972;
T0* ge991ov25363;
T0* ge991ov24971;
T0* ge991ov25358;
T0* ge991ov25190;
T0* ge991ov24966;
T0* ge991ov25360;
T0* ge991ov24968;
T0* ge991ov25296;
T0* ge991ov24904;
T0* ge991ov25512;
T0* ge991ov25266;
T0* ge991ov25120;
T0* ge991ov25506;
T0* ge991ov25114;
T0* ge991ov25511;
T0* ge991ov25119;
T0* ge991ov25423;
T0* ge991ov25031;
T0* ge991ov25356;
T0* ge991ov24964;
T0* ge991ov25362;
T0* ge991ov24970;
T0* ge991ov25359;
T0* ge991ov24967;
T0* ge991ov25357;
T0* ge991ov24965;
T0* ge991ov25500;
T0* ge991ov25259;
T0* ge991ov25108;
T0* ge991ov25501;
T0* ge991ov25109;
T0* ge991ov25402;
T0* ge991ov25209;
T0* ge991ov25010;
T0* ge991ov25398;
T0* ge991ov25208;
T0* ge991ov25006;
T0* ge991ov25399;
T0* ge991ov25007;
T0* ge991ov25390;
T0* ge991ov25205;
T0* ge991ov24998;
T0* ge991ov25401;
T0* ge991ov25009;
T0* ge991ov25400;
T0* ge991ov25008;
T0* ge991ov25397;
T0* ge991ov25207;
T0* ge991ov25005;
T0* ge991ov25369;
T0* ge991ov25195;
T0* ge991ov24977;
T0* ge991ov25368;
T0* ge991ov25194;
T0* ge991ov24976;
T0* ge991ov25367;
T0* ge991ov25193;
T0* ge991ov24975;
T0* ge991ov25366;
T0* ge991ov25192;
T0* ge991ov24974;
T0* ge991ov25365;
T0* ge991ov24973;
T0* ge991ov25302;
T0* ge991ov25164;
T0* ge991ov24910;
T0* ge991ov25300;
T0* ge991ov25163;
T0* ge991ov24908;
T0* ge991ov25330;
T0* ge991ov25175;
T0* ge991ov24938;
T0* ge991ov25331;
T0* ge991ov24939;
T0* ge991ov25314;
T0* ge991ov25168;
T0* ge991ov24922;
T0* ge991ov25313;
T0* ge991ov24921;
T0* ge991ov25315;
T0* ge991ov24923;
T0* ge991ov25339;
T0* ge991ov25179;
T0* ge991ov24947;
T0* ge991ov25328;
T0* ge991ov24936;
T0* ge991ov25329;
T0* ge991ov24937;
T0* ge991ov25375;
T0* ge991ov25196;
T0* ge991ov24983;
T0* ge991ov25372;
T0* ge991ov24980;
T0* ge991ov25379;
T0* ge991ov25197;
T0* ge991ov24987;
T0* ge991ov25376;
T0* ge991ov24984;
T0* ge991ov25373;
T0* ge991ov24981;
T0* ge991ov25380;
T0* ge991ov24988;
T0* ge991ov25377;
T0* ge991ov24985;
T0* ge991ov25374;
T0* ge991ov24982;
T0* ge991ov25381;
T0* ge991ov24989;
T0* ge991ov25490;
T0* ge991ov25254;
T0* ge991ov25098;
T0* ge991ov25386;
T0* ge991ov25201;
T0* ge991ov24994;
T0* ge991ov25385;
T0* ge991ov24993;
T0* ge991ov25371;
T0* ge991ov24979;
T0* ge991ov25370;
T0* ge991ov24978;
T0* ge991ov25378;
T0* ge991ov24986;
T0* ge991ov25384;
T0* ge991ov25200;
T0* ge991ov24992;
T0* ge991ov25383;
T0* ge991ov25199;
T0* ge991ov24991;
T0* ge991ov25382;
T0* ge991ov25198;
T0* ge991ov24990;
T0* ge991ov25468;
T0* ge991ov25247;
T0* ge991ov25076;
T0* ge991ov25466;
T0* ge991ov25246;
T0* ge991ov25074;
T0* ge991ov25317;
T0* ge991ov25169;
T0* ge991ov24925;
T0* ge991ov25432;
T0* ge991ov25225;
T0* ge991ov25040;
T0* ge991ov25316;
T0* ge991ov24924;
T0* ge991ov25431;
T0* ge991ov25039;
T0* ge991ov25430;
T0* ge991ov25224;
T0* ge991ov25038;
T0* ge991ov25347;
T0* ge991ov25184;
T0* ge991ov24955;
T0* ge991ov25345;
T0* ge991ov25182;
T0* ge991ov24953;
T0* ge991ov25344;
T0* ge991ov24952;
T0* ge991ov25351;
T0* ge991ov25186;
T0* ge991ov24959;
T0* ge991ov25350;
T0* ge991ov24958;
T0* ge991ov25352;
T0* ge991ov25187;
T0* ge991ov24960;
T0* ge991ov25414;
T0* ge991ov25214;
T0* ge991ov25022;
T0* ge991ov25413;
T0* ge991ov25021;
T0* ge991ov25412;
T0* ge991ov25020;
T0* ge991ov25411;
T0* ge991ov25019;
T0* ge991ov25415;
T0* ge991ov25215;
T0* ge991ov25023;
T0* ge991ov25333;
T0* ge991ov25176;
T0* ge991ov24941;
T0* ge991ov25332;
T0* ge991ov24940;
T0* ge991ov25338;
T0* ge991ov24946;
T0* ge991ov25335;
T0* ge991ov25177;
T0* ge991ov24943;
T0* ge991ov25336;
T0* ge991ov24944;
T0* ge991ov25429;
T0* ge991ov25037;
T0* ge991ov25334;
T0* ge991ov24942;
T0* ge991ov25348;
T0* ge991ov24956;
T0* ge991ov25337;
T0* ge991ov25178;
T0* ge991ov24945;
T0* ge991ov25342;
T0* ge991ov25180;
T0* ge991ov24950;
T0* ge991ov25340;
T0* ge991ov24948;
T0* ge991ov25341;
T0* ge991ov24949;
T0* ge991ov25437;
T0* ge991ov25229;
T0* ge991ov25045;
T0* ge991ov25433;
T0* ge991ov25226;
T0* ge991ov25041;
T0* ge991ov25435;
T0* ge991ov25227;
T0* ge991ov25043;
T0* ge991ov25343;
T0* ge991ov25181;
T0* ge991ov24951;
T0* ge991ov25349;
T0* ge991ov25185;
T0* ge991ov24957;
T0* ge991ov25426;
T0* ge991ov25222;
T0* ge991ov25034;
T0* ge991ov25409;
T0* ge991ov25212;
T0* ge991ov25017;
T0* ge991ov25436;
T0* ge991ov25228;
T0* ge991ov25044;
T0* ge991ov25346;
T0* ge991ov25183;
T0* ge991ov24954;
T0* ge991ov25353;
T0* ge991ov25188;
T0* ge991ov24961;
T0* ge991ov25427;
T0* ge991ov25223;
T0* ge991ov25035;
T0* ge991ov25425;
T0* ge991ov25221;
T0* ge991ov25033;
T0* ge991ov25410;
T0* ge991ov25213;
T0* ge991ov25018;
T0* ge991ov25428;
T0* ge991ov25036;
T0* ge805ov13268;
T0* ge991ov25404;
T0* ge991ov25202;
T0* ge991ov25012;
T0* ge991ov25312;
T0* ge991ov25167;
T0* ge991ov24920;
T0* ge991ov25310;
T0* ge991ov24918;
T0* ge991ov25304;
T0* ge991ov25166;
T0* ge991ov24912;
T0* ge991ov25303;
T0* ge991ov25165;
T0* ge991ov24911;
T0* ge991ov25527;
T0* ge991ov25275;
T0* ge991ov25135;
T0* ge991ov25531;
T0* ge991ov25279;
T0* ge991ov25139;
T0* ge991ov25498;
T0* ge991ov25258;
T0* ge991ov25106;
T0* ge991ov25530;
T0* ge991ov25278;
T0* ge991ov25138;
T0* ge991ov25403;
T0* ge991ov25210;
T0* ge991ov25011;
T0* ge991ov25405;
T0* ge991ov25013;
T0* ge982ov31424;
T0* ge982ov31420;
T0* ge982ov31416;
T0* ge805ov13263;
T0* ge805ov13319;
T0* ge805ov13305;
T0* ge805ov13304;
T0* ge805ov13280;
T0* ge805ov13306;
T0* ge805ov13320;
T0* ge805ov13266;
T0* ge805ov13308;
T0* ge805ov13277;
T0* ge805ov13279;
T0* ge805ov13327;
T0* ge805ov13274;
T0* ge805ov13271;
T0* ge805ov13301;
T0* ge805ov13289;
T0* ge805ov13314;
T0* ge991ov25494;
T0* ge991ov25255;
T0* ge991ov25102;
T0* ge989ov31432;
T0* ge989ov31431;
T0* ge991ov25493;
T0* ge991ov25101;
T0* ge805ov13325;
T0* ge805ov13297;
T0* ge805ov13283;
T0* ge805ov13313;
T0* ge805ov13300;
T0* ge805ov13264;
T0* ge805ov13294;
T0* ge805ov13309;
T0* ge805ov13425;
T0* ge805ov13427;
T0* ge805ov13426;
T0* ge991ov25533;
T0* ge991ov25281;
T0* ge991ov25141;
T0* ge805ov13209;
T0* ge805ov13177;
T0* ge805ov13176;
T0* ge805ov13158;
T0* ge805ov13157;
T0* ge805ov13243;
T0* ge805ov13251;
T0* ge805ov13250;
T0* ge805ov13249;
T0* ge805ov13349;
T0* ge805ov13353;
T0* ge805ov13350;
T0* ge805ov13354;
T0* ge805ov13337;
T0* ge805ov13362;
T0* ge991ov25532;
T0* ge991ov25280;
T0* ge991ov25140;
T0* ge805ov13233;
T0* ge805ov13149;
T0* ge805ov13153;
T0* ge805ov13152;
T0* ge805ov13151;
T0* ge805ov13148;
T0* ge805ov13150;
T0* ge805ov13142;
T0* ge805ov13141;
T0* ge805ov13140;
T0* ge805ov13139;
T0* ge805ov13146;
T0* ge805ov13145;
T0* ge805ov13144;
T0* ge805ov13143;
T0* ge805ov13248;
T0* ge805ov13247;
T0* ge805ov13246;
T0* ge805ov13242;
T0* ge805ov13241;
T0* ge805ov13351;
T0* ge805ov13336;
T0* ge805ov13231;
T0* ge805ov13229;
T0* ge805ov13228;
T0* ge805ov13208;
T0* ge805ov13207;
T0* ge805ov13206;
T0* ge805ov13204;
T0* ge805ov13203;
T0* ge805ov13198;
T0* ge805ov13186;
T0* ge805ov13185;
T0* ge805ov13184;
T0* ge805ov13183;
T0* ge805ov13160;
T0* ge805ov13159;
T0* ge805ov13155;
T0* ge805ov13234;
T0* ge805ov13227;
T0* ge805ov13226;
T0* ge805ov13225;
T0* ge805ov13224;
T0* ge805ov13223;
T0* ge805ov13222;
T0* ge805ov13221;
T0* ge805ov13220;
T0* ge805ov13219;
T0* ge805ov13218;
T0* ge805ov13217;
T0* ge805ov13216;
T0* ge805ov13215;
T0* ge805ov13214;
T0* ge805ov13213;
T0* ge805ov13255;
T0* ge805ov13193;
T0* ge805ov13230;
T0* ge805ov13210;
T0* ge805ov13187;
T0* ge805ov13170;
T0* ge805ov13161;
T0* ge805ov13154;
T0* ge805ov13196;
T0* ge805ov13195;
T0* ge805ov13194;
T0* ge805ov13191;
T0* ge805ov13189;
T0* ge805ov13172;
T0* ge805ov13171;
T0* ge805ov13173;
T0* ge805ov13138;
T0* ge805ov13137;
T0* ge805ov13182;
T0* ge805ov13244;
T0* ge805ov13328;
T0* ge805ov13302;
T0* ge805ov13292;
T0* ge805ov13307;
T0* ge805ov13267;
T0* ge805ov13205;
T0* ge805ov13163;
T0* ge805ov13147;
T0* ge805ov13135;
T0* ge805ov13174;
T0* ge805ov13212;
T0* ge805ov13201;
T0* ge805ov13253;
T0* ge805ov13202;
T0* ge805ov13181;
T0* ge805ov13180;
T0* ge805ov13178;
T0* ge805ov13167;
T0* ge805ov13188;
T0* ge805ov13238;
T0* ge805ov13239;
T0* ge805ov13179;
T0* ge805ov13164;
T0* ge805ov13232;
T0* ge805ov13237;
T0* ge805ov13252;
T0* ge805ov13165;
T0* ge805ov13236;
T0* ge805ov13298;
T0* ge805ov13323;
T0* ge805ov13288;
T0* ge805ov13273;
T0* ge805ov13275;
T0* ge805ov13310;
T0* ge805ov13265;
T0* ge805ov13285;
T0* ge805ov13312;
T0* ge991ov25485;
T0* ge991ov25252;
T0* ge991ov25093;
T0* ge991ov25478;
T0* ge991ov25086;
T0* ge991ov25477;
T0* ge991ov25085;
T0* ge991ov25476;
T0* ge991ov25084;
T0* ge991ov25481;
T0* ge991ov25089;
T0* ge991ov25483;
T0* ge991ov25091;
T0* ge805ov13169;
T0* ge991ov25537;
T0* ge991ov25285;
T0* ge991ov25145;
T0* ge805ov13199;
T0* ge805ov13235;
T0* ge805ov13240;
T0* ge805ov13257;
T0* ge805ov13258;
T0* ge805ov13260;
T0* ge805ov13261;
T0* ge805ov13262;
T0* ge805ov13269;
T0* ge805ov13270;
T0* ge805ov13276;
T0* ge805ov13281;
T0* ge805ov13284;
T0* ge805ov13286;
T0* ge805ov13287;
T0* ge805ov13290;
T0* ge805ov13291;
T0* ge805ov13293;
T0* ge805ov13296;
T0* ge805ov13303;
T0* ge805ov13311;
T0* ge805ov13315;
T0* ge805ov13316;
T0* ge805ov13317;
T0* ge805ov13318;
T0* ge805ov13321;
T0* ge805ov13322;
T0* ge805ov13324;
T0* ge805ov13326;
T0* ge805ov13329;
T0* ge805ov13330;
T0* ge805ov13331;
T0* ge805ov13332;
T0* ge805ov13333;
T0* ge805ov13334;
T0* ge805ov13335;
T0* ge805ov13338;
T0* ge805ov13339;
T0* ge805ov13340;
T0* ge805ov13341;
T0* ge805ov13342;
T0* ge805ov13343;
T0* ge805ov13344;
T0* ge805ov13345;
T0* ge805ov13346;
T0* ge805ov13347;
T0* ge805ov13348;
T0* ge805ov13352;
T0* ge805ov13355;
T0* ge805ov13356;
T0* ge805ov13357;
T0* ge805ov13358;
T0* ge805ov13359;
T0* ge805ov13360;
T0* ge805ov13361;
T0* ge283ov12448;
T0* ge389ov26485;
T0* ge389ov26482;
T0* ge1003ov18865;
T0* ge991ov25521;
T0* ge991ov25270;
T0* ge991ov25129;
T0* ge991ov25496;
T0* ge991ov25257;
T0* ge991ov25104;
T0* ge991ov25497;
T0* ge991ov25105;
T0* ge991ov25470;
T0* ge991ov25248;
T0* ge991ov25078;
T0* ge991ov25471;
T0* ge991ov25249;
T0* ge991ov25079;
T0* ge991ov25467;
T0* ge991ov25075;
T0* ge992ov7571;
T0* ge992ov7566;
T0* ge992ov7567;
T0* ge992ov7539;
T0* ge992ov7541;
T0* ge992ov7537;
T0* ge992ov7540;
T0* ge992ov7573;
T0* ge992ov7570;
T0* ge992ov7579;
T0* ge992ov7490;
T0* ge992ov7508;
T0* ge991ov25322;
T0* ge991ov25172;
T0* ge991ov24930;
T0* ge991ov25321;
T0* ge991ov24929;
T0* ge991ov25320;
T0* ge991ov25171;
T0* ge991ov24928;
T0* ge991ov25324;
T0* ge991ov24932;
T0* ge991ov25319;
T0* ge991ov25170;
T0* ge991ov24927;
T0* ge991ov25509;
T0* ge991ov25264;
T0* ge991ov25117;
T0* ge991ov25522;
T0* ge991ov25271;
T0* ge991ov25130;
T0* ge991ov25294;
T0* ge991ov25158;
T0* ge991ov24902;
T0* ge991ov25448;
T0* ge991ov25236;
T0* ge991ov25056;
T0* ge991ov25447;
T0* ge991ov25055;
T0* ge991ov25446;
T0* ge991ov25235;
T0* ge991ov25054;
T0* ge991ov25445;
T0* ge991ov25053;
T0* ge991ov25444;
T0* ge991ov25234;
T0* ge991ov25052;
T0* ge991ov25443;
T0* ge991ov25051;
T0* ge991ov25454;
T0* ge991ov25237;
T0* ge991ov25062;
T0* ge991ov25452;
T0* ge991ov25060;
T0* ge991ov25451;
T0* ge991ov25059;
T0* ge991ov25473;
T0* ge991ov25250;
T0* ge991ov25081;
T0* ge991ov25475;
T0* ge991ov25251;
T0* ge991ov25083;
T0* ge991ov25465;
T0* ge991ov25245;
T0* ge991ov25073;
T0* ge991ov25453;
T0* ge991ov25061;
T0* ge991ov25450;
T0* ge991ov25058;
T0* ge991ov25449;
T0* ge991ov25057;
T0* ge991ov25469;
T0* ge991ov25077;
T0* ge991ov25464;
T0* ge991ov25072;
T0* ge991ov25520;
T0* ge991ov25269;
T0* ge991ov25128;
T0* ge991ov25519;
T0* ge991ov25127;
T0* ge991ov25518;
T0* ge991ov25268;
T0* ge991ov25126;
T0* ge991ov25517;
T0* ge991ov25125;
T0* ge991ov25516;
T0* ge991ov25267;
T0* ge991ov25124;
T0* ge991ov25515;
T0* ge991ov25123;
T0* ge991ov25514;
T0* ge991ov25122;
T0* ge991ov25513;
T0* ge991ov25121;
T0* ge991ov25460;
T0* ge991ov25243;
T0* ge991ov25068;
T0* ge991ov25459;
T0* ge991ov25242;
T0* ge991ov25067;
T0* ge991ov25458;
T0* ge991ov25241;
T0* ge991ov25066;
T0* ge991ov25457;
T0* ge991ov25240;
T0* ge991ov25065;
T0* ge991ov25456;
T0* ge991ov25239;
T0* ge991ov25064;
T0* ge991ov25455;
T0* ge991ov25238;
T0* ge991ov25063;
T0* ge991ov25461;
T0* ge991ov25244;
T0* ge991ov25069;
T0* ge992ov7521;
T0* ge992ov7522;
T0* ge992ov7523;
T0* ge992ov7524;
T0* ge992ov7529;
T0* ge992ov7530;
T0* ge992ov7531;
T0* ge992ov7532;
T0* ge991ov25392;
T0* ge991ov25000;
T0* ge991ov25395;
T0* ge991ov25206;
T0* ge991ov25003;
T0* ge991ov25388;
T0* ge991ov25204;
T0* ge991ov24996;
T0* ge991ov25391;
T0* ge991ov24999;
T0* ge991ov25306;
T0* ge991ov24914;
T0* ge991ov25407;
T0* ge991ov25211;
T0* ge991ov25015;
T0* ge991ov25528;
T0* ge991ov25276;
T0* ge991ov25136;
T0* ge991ov25492;
T0* ge991ov25100;
T0* ge991ov25491;
T0* ge991ov25099;
T0* ge991ov25305;
T0* ge991ov24913;
T0* ge991ov25406;
T0* ge991ov25014;
T0* ge991ov25488;
T0* ge991ov25253;
T0* ge991ov25096;
T0* ge991ov25489;
T0* ge991ov25097;
T0* ge991ov25307;
T0* ge991ov24915;
T0* ge991ov25408;
T0* ge991ov25016;
T0* ge991ov25441;
T0* ge991ov25232;
T0* ge991ov25049;
T0* ge991ov25442;
T0* ge991ov25233;
T0* ge991ov25050;
T0* ge991ov25440;
T0* ge991ov25048;
T0* ge991ov25525;
T0* ge991ov25273;
T0* ge991ov25133;
T0* ge991ov25523;
T0* ge991ov25272;
T0* ge991ov25131;
T0* ge991ov25499;
T0* ge991ov25107;
T0* ge991ov25311;
T0* ge991ov24919;
T0* ge991ov25309;
T0* ge991ov24917;
T0* ge991ov25308;
T0* ge991ov24916;
T0* ge991ov25495;
T0* ge991ov25256;
T0* ge991ov25103;
T0* ge991ov25539;
T0* ge991ov25287;
T0* ge991ov25147;
T0* ge991ov25540;
T0* ge991ov25148;
T0* ge991ov25503;
T0* ge991ov25261;
T0* ge991ov25111;
T0* ge991ov25502;
T0* ge991ov25260;
T0* ge991ov25110;
T0* ge991ov25529;
T0* ge991ov25277;
T0* ge991ov25137;
T0* ge982ov31423;
T0* ge982ov31419;
T0* ge982ov31415;
T0* ge738ov12525;
T0* ge738ov12526;
T0* ge387ov31164;
T0* ge991ov25526;
T0* ge991ov25274;
T0* ge991ov25134;
T0* ge992ov7545;
T0* ge991ov25299;
T0* ge991ov25162;
T0* ge991ov24907;
T0* ge991ov25298;
T0* ge991ov25161;
T0* ge991ov24906;
T0* ge991ov25416;
T0* ge991ov25216;
T0* ge991ov25024;
T0* ge991ov25354;
T0* ge991ov25189;
T0* ge991ov24962;
T0* ge991ov25355;
T0* ge991ov24963;
T0* ge991ov25418;
T0* ge991ov25217;
T0* ge991ov25026;
T0* ge991ov25419;
T0* ge991ov25027;
T0* ge991ov25417;
T0* ge991ov25025;
T0* ge991ov25420;
T0* ge991ov25218;
T0* ge991ov25028;
T0* ge991ov25439;
T0* ge991ov25231;
T0* ge991ov25047;
T0* ge991ov25438;
T0* ge991ov25230;
T0* ge991ov25046;
T0* ge991ov25297;
T0* ge991ov25160;
T0* ge991ov24905;
T0* ge992ov7574;
T0* ge991ov25394;
T0* ge991ov25002;
T0* ge991ov25396;
T0* ge991ov25004;
T0* ge991ov25389;
T0* ge991ov24997;
T0* ge991ov25387;
T0* ge991ov25203;
T0* ge991ov24995;
T0* ge991ov25393;
T0* ge991ov25001;
T0* ge991ov25318;
T0* ge991ov24926;
T0* ge991ov25421;
T0* ge991ov25029;
T0* ge1284ov10882;
T0* ge1265ov23183;
T0* ge1265ov23182;
T0* ge423ov9740;
T0* ge308ov9740;
T0* ge299ov9740;
T0* ge55ov4379;
T0* ge55ov4380;
T0* ge55ov4381;
T0* ge809ov25945;
T0* ge805ov13424;
T0* ge805ov13405;
T0* ge805ov13421;
T0* ge805ov13409;
T0* ge805ov13410;
T0* ge805ov13411;
T0* ge805ov13412;
T0* ge805ov13406;
T0* ge805ov13413;
T0* ge805ov13414;
T0* ge805ov13415;
T0* ge805ov13416;
T0* ge805ov13407;
T0* ge805ov13422;
T0* ge805ov13417;
T0* ge805ov13418;
T0* ge805ov13419;
T0* ge805ov13408;
T0* ge805ov13420;
T0* ge805ov13423;
T0* ge805ov13363;
T0* ge1332ov25793;
T0* ge1332ov25795;
T0* ge805ov13401;
T0* ge805ov13400;
T0* ge805ov13388;
T0* ge805ov13389;
T0* ge805ov13390;
T0* ge805ov13391;
T0* ge805ov13392;
T0* ge805ov13393;
T0* ge805ov13394;
T0* ge805ov13395;
T0* ge805ov13396;
T0* ge805ov13397;
T0* ge805ov13398;
T0* ge805ov13399;
T0* ge805ov13403;
T0* ge805ov13404;
T0* ge805ov13384;
T0* ge805ov13385;
T0* ge805ov13386;
T0* ge805ov13387;
T0* ge805ov13402;
T0* ge828ov26607;
T0* ge828ov26606;
T0* ge845ov27916;
T0* ge834ov25856;
T0* ge1058ov4146;
T0* ge226ov4146;
T0* ge225ov4146;
T0* ge1052ov4146;
T0* ge1068ov4146;
T0* ge1065ov4146;
T0* ge1064ov4146;
T0* ge1060ov4146;
T0* ge1067ov4146;
T0* ge1059ov4146;
T0* ge1071ov4146;
T0* ge1055ov4146;
T0* ge1066ov4146;
T0* ge1070ov4146;
T0* ge1062ov4146;
T0* ge1053ov4146;
T0* ge1061ov4146;
T0* ge220ov4146;
T0* ge223ov4146;
T0* ge230ov4146;
T0* ge219ov4146;
T0* ge417ov26392;
T0* ge403ov1834;
T0* geic2;
T0* geic3;
T0* geic4;

void GE_const_init()
{
	ge416ov9740 = (GE_ms8("\n", 1));
	ge420ov2982 = (GE_ms8("", 0));
	ge349ov25786 = (GE_ms8("", 0));
	ge426ov10526 = (GE_ms8("", 0));
	ge418ov9740 = (GE_ms8("\n", 1));
	ge992ov7576 = (GE_ms8(".bat", 4));
	ge992ov7581 = (GE_ms8(".sh", 3));
	ge392ov1854 = (GE_ms8("empty_name", 10));
	ge1213ov15866 = (GE_ms8("no pattern compiled", 19));
	ge1213ov15851 = (GE_ms8("unmatched parentheses", 21));
	ge1213ov15844 = (GE_ms8("back reference to non-existent subpattern", 41));
	ge1213ov15829 = (GE_ms8("compilation successfully", 24));
	ge1213ov15854 = (GE_ms8("lookbehind assertion is not fixed length", 40));
	ge1213ov15847 = (GE_ms8("missing ) after comment", 23));
	ge1213ov15855 = (GE_ms8("malformed number after (\?(", 26));
	ge1213ov15864 = (GE_ms8("invalid condition (\?(0)", 23));
	ge1213ov15857 = (GE_ms8("assertion expected after (\?(", 28));
	ge1213ov15853 = (GE_ms8("unrecognized character after (\?<", 32));
	ge1213ov15841 = (GE_ms8("unrecognized character after (\?", 31));
	ge1213ov15842 = (GE_ms8("too many capturing parenthesized sub-patterns", 45));
	ge1213ov15856 = (GE_ms8("conditional group contains more than two branches", 49));
	ge1213ov15843 = (GE_ms8("missing )", 9));
	ge1213ov15830 = (GE_ms8("\\ at end of pattern", 19));
	ge1213ov15831 = (GE_ms8("\\c at end of pattern", 20));
	ge1213ov15832 = (GE_ms8("unrecognized character follows \\", 32));
	ge1213ov15838 = (GE_ms8("nothing to repeat", 17));
	ge1213ov15840 = (GE_ms8("internal error: unexpected repeat", 33));
	ge1213ov15835 = (GE_ms8("missing terminating ] for character class", 41));
	ge1213ov15860 = (GE_ms8("POSIX collating elements are not supported", 42));
	ge1213ov15859 = (GE_ms8("unknown POSIX class name", 24));
	ge1213ov15836 = (GE_ms8("invalid escape sequence in character class", 42));
	ge1213ov15837 = (GE_ms8("range out of order in character class", 37));
	ge1213ov15834 = (GE_ms8("number too big in {} quantifier", 31));
	ge1213ov15833 = (GE_ms8("numbers out of order in {} quantifier", 37));
	ge1209ov15624 = (GE_ms8("", 0));
	ge992ov7578 = (GE_ms8(".cfg", 4));
	ge992ov7580 = (GE_ms8(".h", 2));
	ge992ov7459 = (GE_ms8("#define", 7));
	ge992ov7491 = (GE_ms8("EIF_TRACE", 9));
	ge992ov7468 = (GE_ms8("EIF_EXCEPTION_TRACE", 19));
	ge992ov7463 = (GE_ms8("EIF_BOEHM_GC", 12));
	ge992ov7550 = (GE_ms8("#include", 8));
	ge805ov13197 = (GE_ms8("item", 4));
	ge805ov13156 = (GE_ms8("call", 4));
	ge805ov13282 = (GE_ms8("end", 3));
	ge992ov7548 = (GE_ms8("#ifdef", 6));
	ge992ov7496 = (GE_ms8("EIF_WINDOWS", 11));
	ge992ov7498 = (GE_ms8("#endif", 6));
	ge992ov7561 = (GE_ms8("return", 6));
	ge992ov7518 = (GE_ms8("GE_dts", 6));
	ge992ov7512 = (GE_ms8("GE_catcall", 10));
	ge992ov7454 = (GE_ms8("->", 2));
	ge992ov7544 = (GE_ms8("GE_void", 7));
	ge992ov7510 = (GE_ms8("GE_boxed", 8));
	ge805ov13175 = (GE_ms8("equal_objects", 13));
	ge805ov13108 = (GE_ms8("KL_ANY_ROUTINES", 15));
	ge987ov24640 = (GE_ms8("giaaa", 5));
	ge987ov24639 = (GE_ms8("GIAAA", 5));
	ge987ov24638 = (GE_ms8("[$1] internal error.", 20));
	ge805ov13256 = (GE_ms8("Current", 7));
	ge992ov7542 = (GE_ms8("GE_show_console", 15));
	ge992ov7499 = (GE_ms8("extern", 6));
	ge992ov7493 = (GE_ms8("EIF_TYPE", 8));
	ge992ov7543 = (GE_ms8("GE_types", 8));
	ge992ov7469 = (GE_ms8("EIF_FALSE", 9));
	ge992ov7492 = (GE_ms8("EIF_TRUE", 8));
	ge992ov7552 = (GE_ms8("int", 3));
	ge992ov7572 = (GE_ms8("void", 4));
	ge992ov7514 = (GE_ms8("GE_const_init", 13));
	ge992ov7516 = (GE_ms8("GE_deep_twin", 12));
	ge992ov7515 = (GE_ms8("GE_deep", 7));
	ge992ov7565 = (GE_ms8("switch", 6));
	ge992ov7456 = (GE_ms8("case", 4));
	ge992ov7517 = (GE_ms8("GE_default", 10));
	ge992ov7547 = (GE_ms8("if", 2));
	ge992ov7497 = (GE_ms8("else", 4));
	ge992ov7546 = (GE_ms8("id", 2));
	ge992ov7533 = (GE_ms8("GE_new", 6));
	ge992ov7559 = (GE_ms8("memcpy", 6));
	ge992ov7562 = (GE_ms8("sizeof", 6));
	ge992ov7501 = (GE_ms8("for", 3));
	ge805ov13259 = (GE_ms8("Result", 6));
	ge992ov7528 = (GE_ms8("GE_mt", 5));
	ge992ov7509 = (GE_ms8("GE_bma", 6));
	ge992ov7525 = (GE_ms8("GE_ma", 5));
	ge992ov7511 = (GE_ms8("GE_call", 7));
	ge992ov7453 = (GE_ms8("ac", 2));
	ge992ov7455 = (GE_ms8("break", 5));
	ge992ov7458 = (GE_ms8("default", 7));
	ge992ov7535 = (GE_ms8("GE_object_id_free", 17));
	ge992ov7502 = (GE_ms8("fprintf", 7));
	ge992ov7563 = (GE_ms8("stderr", 6));
	ge992ov7568 = (GE_ms8("type_id", 7));
	ge992ov7527 = (GE_ms8("GE_ms32", 7));
	ge992ov7526 = (GE_ms8("GE_ms8", 6));
	ge992ov7536 = (GE_ms8("GE_power", 8));
	ge992ov7460 = (GE_ms8("double", 6));
	ge992ov7519 = (GE_ms8("GE_floor", 8));
	ge992ov7513 = (GE_ms8("GE_ceiling", 10));
	ge992ov7457 = (GE_ms8("char", 4));
	ge992ov7466 = (GE_ms8("EIF_CHARACTER_32", 16));
	ge992ov7487 = (GE_ms8("EIF_REAL_32", 11));
	ge992ov7485 = (GE_ms8("EIF_POINTER", 11));
	ge992ov7478 = (GE_ms8("EIF_IS_WINDOWS", 14));
	ge992ov7477 = (GE_ms8("EIF_IS_VMS", 10));
	ge992ov7476 = (GE_ms8("EIF_IS_UNIX", 11));
	ge992ov7475 = (GE_ms8("EIF_IS_MAC", 10));
	ge992ov7473 = (GE_ms8("EIF_INTEGER_32", 14));
	ge992ov7488 = (GE_ms8("EIF_REAL_64", 11));
	ge992ov7465 = (GE_ms8("EIF_CHARACTER_8", 15));
	ge992ov7462 = (GE_ms8("EIF_BOOLEAN", 11));
	ge992ov7534 = (GE_ms8("GE_object_id", 12));
	ge992ov7520 = (GE_ms8("GE_id_object", 12));
	ge992ov7507 = (GE_ms8("GE_argc", 7));
	ge992ov7558 = (GE_ms8("memcmp", 6));
	ge805ov13190 = (GE_ms8("is_equal", 8));
	ge992ov7494 = (GE_ms8("EIF_VOID", 8));
	ge805ov13130 = (GE_ms8("TUPLE", 5));
	ge992ov7551 = (GE_ms8("initialize", 10));
	ge992ov7503 = (GE_ms8("GE_alloc", 8));
	ge992ov7504 = (GE_ms8("GE_alloc_atomic", 15));
	ge992ov7549 = (GE_ms8("#ifndef", 7));
	ge992ov7505 = (GE_ms8("GE_alloc_cleared", 16));
	ge992ov7506 = (GE_ms8("GE_alloc_atomic_cleared", 23));
	ge992ov7560 = (GE_ms8("memset", 6));
	ge992ov7538 = (GE_ms8("GE_register_dispose", 19));
	ge992ov7577 = (GE_ms8(".c", 2));
	ge992ov7461 = (GE_ms8("EIF_ANY", 7));
	ge992ov7569 = (GE_ms8("typedef", 7));
	ge992ov7564 = (GE_ms8("struct", 6));
	ge992ov7470 = (GE_ms8("EIF_INTEGER", 11));
	ge992ov7557 = (GE_ms8("is_special", 10));
	ge992ov7483 = (GE_ms8("EIF_NATURAL_64", 14));
	ge992ov7482 = (GE_ms8("EIF_NATURAL_32", 14));
	ge992ov7481 = (GE_ms8("EIF_NATURAL_16", 14));
	ge992ov7480 = (GE_ms8("EIF_NATURAL_8", 13));
	ge992ov7474 = (GE_ms8("EIF_INTEGER_64", 14));
	ge992ov7472 = (GE_ms8("EIF_INTEGER_16", 14));
	ge992ov7471 = (GE_ms8("EIF_INTEGER_8", 13));
	ge992ov7467 = (GE_ms8("EIF_DOUBLE", 10));
	ge805ov13099 = (GE_ms8("DOUBLE", 6));
	ge992ov7486 = (GE_ms8("EIF_REAL", 8));
	ge805ov13120 = (GE_ms8("REAL", 4));
	ge992ov7479 = (GE_ms8("EIF_NATURAL", 11));
	ge805ov13110 = (GE_ms8("NATURAL", 7));
	ge805ov13103 = (GE_ms8("INTEGER", 7));
	ge992ov7495 = (GE_ms8("EIF_WIDE_CHAR", 13));
	ge805ov13133 = (GE_ms8("WIDE_CHARACTER", 14));
	ge992ov7464 = (GE_ms8("EIF_CHARACTER", 13));
	ge805ov13096 = (GE_ms8("CHARACTER", 9));
	ge805ov13278 = (GE_ms8("deferred", 8));
	ge805ov13272 = (GE_ms8("class", 5));
	ge805ov13134 = (GE_ms8("*UNKNOWN*", 9));
	ge990ov24628 = (GE_ms8("gvsrc5a", 7));
	ge990ov24622 = (GE_ms8("GVSRC5", 6));
	ge990ov24616 = (GE_ms8("[$1] root creation procedure `$3\' is not a feature of root class $2.", 68));
	ge990ov24624 = (GE_ms8("vsrc1a", 6));
	ge990ov24618 = (GE_ms8("VSRC1", 5));
	ge990ov24612 = (GE_ms8("[$1] root class $2 should not be generic.", 41));
	ge990ov24627 = (GE_ms8("gvsrc4a", 7));
	ge990ov24621 = (GE_ms8("GVSRC4", 6));
	ge990ov24615 = (GE_ms8("[$1] unknown root class $2.", 27));
	ge990ov24629 = (GE_ms8("gvsrc6a", 7));
	ge990ov24623 = (GE_ms8("GVSRC6", 6));
	ge990ov24617 = (GE_ms8("[$1] root creation procedure `$3\' is not declared as publicly available creation procedure in root class $2.", 108));
	ge805ov13168 = (GE_ms8("default_create", 14));
	ge990ov24626 = (GE_ms8("gvsrc3a", 7));
	ge990ov24620 = (GE_ms8("GVSRC3", 6));
	ge990ov24614 = (GE_ms8("[$1] missing root class.", 24));
	ge805ov13192 = (GE_ms8("is_target_closed", 16));
	ge805ov13162 = (GE_ms8("closed_operands", 15));
	ge805ov13245 = (GE_ms8("to_pointer", 10));
	ge805ov13211 = (GE_ms8("pointer_item", 12));
	ge805ov13254 = (GE_ms8("upper", 5));
	ge805ov13200 = (GE_ms8("lower", 5));
	ge805ov13166 = (GE_ms8("count", 5));
	ge991ov25536 = (GE_ms8("gvkfe3a", 7));
	ge991ov25284 = (GE_ms8("GVKFE-3", 7));
	ge991ov25144 = (GE_ms8("attribute `$7\' in kernel class $5 has not the expected type \'$8\'.", 65));
	ge991ov25534 = (GE_ms8("gvkfe1a", 7));
	ge991ov25282 = (GE_ms8("GVKFE-1", 7));
	ge991ov25142 = (GE_ms8("feature `$7\' is missing in kernel class $5.", 43));
	ge991ov25535 = (GE_ms8("gvkfe2a", 7));
	ge991ov25283 = (GE_ms8("GVKFE-2", 7));
	ge991ov25143 = (GE_ms8("feature `$7\' in kernel class $5 is not an attribute.", 52));
	ge805ov13136 = (GE_ms8("area", 4));
	ge990ov24625 = (GE_ms8("gvknl1a", 7));
	ge990ov24619 = (GE_ms8("GVKNL1", 6));
	ge990ov24613 = (GE_ms8("[$1] missing kernel class $2.", 29));
	ge393ov9793 = (GE_ms8("dummy", 5));
	ge983ov31611 = (GE_ms8("gaaaa", 5));
	ge983ov31609 = (GE_ms8("GAAAA", 5));
	ge983ov31607 = (GE_ms8("[$1] assembly $2: .NET assemblies not supported.", 48));
	ge805ov13383 = (GE_ms8("WIDE_CHARACTER_REF", 18));
	ge805ov13125 = (GE_ms8("STRING", 6));
	ge805ov13380 = (GE_ms8("REAL_REF", 8));
	ge805ov13374 = (GE_ms8("NATURAL_REF", 11));
	ge805ov13369 = (GE_ms8("INTEGER_REF", 11));
	ge805ov13368 = (GE_ms8("DOUBLE_REF", 10));
	ge805ov13365 = (GE_ms8("CHARACTER_REF", 13));
	ge805ov13132 = (GE_ms8("TYPED_POINTER", 13));
	ge805ov13131 = (GE_ms8("TYPE", 4));
	ge805ov13129 = (GE_ms8("SYSTEM_STRING", 13));
	ge805ov13295 = (GE_ms8("inherit", 7));
	ge805ov13128 = (GE_ms8("SYSTEM_OBJECT", 13));
	ge805ov13127 = (GE_ms8("STRING_32", 9));
	ge805ov13126 = (GE_ms8("STRING_8", 8));
	ge805ov13124 = (GE_ms8("SPECIAL", 7));
	ge805ov13123 = (GE_ms8("ROUTINE", 7));
	ge805ov13382 = (GE_ms8("REAL_64_REF", 11));
	ge805ov13122 = (GE_ms8("REAL_64", 7));
	ge805ov13381 = (GE_ms8("REAL_32_REF", 11));
	ge805ov13121 = (GE_ms8("REAL_32", 7));
	ge805ov13119 = (GE_ms8("PROCEDURE", 9));
	ge805ov13118 = (GE_ms8("PREDICATE", 9));
	ge805ov13379 = (GE_ms8("POINTER_REF", 11));
	ge805ov13117 = (GE_ms8("POINTER", 7));
	ge805ov13116 = (GE_ms8("PLATFORM", 8));
	ge805ov13115 = (GE_ms8("NONE", 4));
	ge805ov13378 = (GE_ms8("NATURAL_64_REF", 14));
	ge805ov13114 = (GE_ms8("NATURAL_64", 10));
	ge805ov13377 = (GE_ms8("NATURAL_32_REF", 14));
	ge805ov13113 = (GE_ms8("NATURAL_32", 10));
	ge805ov13376 = (GE_ms8("NATURAL_16_REF", 14));
	ge805ov13112 = (GE_ms8("NATURAL_16", 10));
	ge805ov13375 = (GE_ms8("NATURAL_8_REF", 13));
	ge805ov13111 = (GE_ms8("NATURAL_8", 9));
	ge805ov13109 = (GE_ms8("NATIVE_ARRAY", 12));
	ge805ov13373 = (GE_ms8("INTEGER_64_REF", 14));
	ge805ov13107 = (GE_ms8("INTEGER_64", 10));
	ge805ov13372 = (GE_ms8("INTEGER_32_REF", 14));
	ge805ov13106 = (GE_ms8("INTEGER_32", 10));
	ge805ov13371 = (GE_ms8("INTEGER_16_REF", 14));
	ge805ov13105 = (GE_ms8("INTEGER_16", 10));
	ge805ov13370 = (GE_ms8("INTEGER_8_REF", 13));
	ge805ov13104 = (GE_ms8("INTEGER_8", 9));
	ge805ov13102 = (GE_ms8("IDENTIFIED_ROUTINES", 19));
	ge805ov13101 = (GE_ms8("FUNCTION", 8));
	ge805ov13100 = (GE_ms8("DISPOSABLE", 10));
	ge805ov13367 = (GE_ms8("CHARACTER_32_REF", 16));
	ge805ov13098 = (GE_ms8("CHARACTER_32", 12));
	ge805ov13366 = (GE_ms8("CHARACTER_8_REF", 15));
	ge805ov13097 = (GE_ms8("CHARACTER_8", 11));
	ge805ov13364 = (GE_ms8("BOOLEAN_REF", 11));
	ge805ov13095 = (GE_ms8("BOOLEAN", 7));
	ge805ov13094 = (GE_ms8("BIT", 3));
	ge805ov13092 = (GE_ms8("ARGUMENTS", 9));
	ge805ov13091 = (GE_ms8("ANY", 3));
	ge805ov13093 = (GE_ms8("ARRAY", 5));
	ge1327ov11173 = (GE_ms8("undefined", 9));
	ge1327ov11172 = (GE_ms8("(TRUNCATED)", 11));
	ge1049ov4476 = (GE_ms8("abstract", 8));
	ge1049ov4477 = (GE_ms8("address_expression", 18));
	ge1049ov4478 = (GE_ms8("arguments", 9));
	ge1049ov4479 = (GE_ms8("array_optimization", 18));
	ge1049ov4480 = (GE_ms8("assembly", 8));
	ge1049ov4481 = (GE_ms8("assertion", 9));
	ge1049ov4482 = (GE_ms8("automatic_backup", 16));
	ge1049ov4483 = (GE_ms8("callback", 8));
	ge1049ov4484 = (GE_ms8("case_insensitive", 16));
	ge1049ov4485 = (GE_ms8("check_generic_creation_constraint", 33));
	ge1049ov4486 = (GE_ms8("check_vape", 10));
	ge1049ov4487 = (GE_ms8("clean", 5));
	ge1049ov4488 = (GE_ms8("cls_compliant", 13));
	ge1049ov4489 = (GE_ms8("component", 9));
	ge1049ov4490 = (GE_ms8("console_application", 19));
	ge1049ov4491 = (GE_ms8("create_keyword_extension", 24));
	ge1049ov4492 = (GE_ms8("culture", 7));
	ge1049ov4493 = (GE_ms8("c_compiler_options", 18));
	ge1049ov4494 = (GE_ms8("dead_code_removal", 17));
	ge1049ov4495 = (GE_ms8("debug", 5));
	ge1049ov4496 = (GE_ms8("debug_tag", 9));
	ge1049ov4497 = (GE_ms8("debugger", 8));
	ge1049ov4498 = (GE_ms8("document", 8));
	ge1049ov4499 = (GE_ms8("dotnet_naming_convention", 24));
	ge1049ov4500 = (GE_ms8("dynamic_runtime", 15));
	ge1049ov4501 = (GE_ms8("ecf_library", 11));
	ge1049ov4502 = (GE_ms8("enforce_unique_class_names", 26));
	ge1049ov4503 = (GE_ms8("exception_trace", 15));
	ge1049ov4504 = (GE_ms8("exclude", 7));
	ge1049ov4505 = (GE_ms8("export", 6));
	ge1049ov4506 = (GE_ms8("external_runtime", 16));
	ge1049ov4507 = (GE_ms8("finalize", 8));
	ge1049ov4508 = (GE_ms8("flat_fst_optimization", 21));
	ge1049ov4509 = (GE_ms8("force_32bits", 12));
	ge1049ov4510 = (GE_ms8("fst_expansion_factor", 20));
	ge1049ov4511 = (GE_ms8("fst_optimization", 16));
	ge1049ov4512 = (GE_ms8("full_class_checking", 19));
	ge1049ov4513 = (GE_ms8("garbage_collector", 17));
	ge1049ov4514 = (GE_ms8("gc_info", 7));
	ge1049ov4515 = (GE_ms8("heap_size", 9));
	ge1049ov4516 = (GE_ms8("header", 6));
	ge1049ov4517 = (GE_ms8("high_memory_compiler", 20));
	ge1049ov4518 = (GE_ms8("il_verifiable", 13));
	ge1049ov4519 = (GE_ms8("include", 7));
	ge1049ov4520 = (GE_ms8("inlining", 8));
	ge1049ov4521 = (GE_ms8("inlining_size", 13));
	ge1049ov4522 = (GE_ms8("jumps_optimization", 18));
	ge1049ov4523 = (GE_ms8("layout", 6));
	ge1049ov4524 = (GE_ms8("layout_optimization", 19));
	ge1049ov4525 = (GE_ms8("leaves_optimization", 19));
	ge1049ov4526 = (GE_ms8("line_generation", 15));
	ge1049ov4527 = (GE_ms8("link", 4));
	ge1049ov4528 = (GE_ms8("linker", 6));
	ge1049ov4529 = (GE_ms8("linux_fpu_double_precision", 26));
	ge1049ov4530 = (GE_ms8("manifest_string_trace", 21));
	ge1049ov4531 = (GE_ms8("map", 3));
	ge1049ov4532 = (GE_ms8("metadata_cache_path", 19));
	ge1049ov4533 = (GE_ms8("msil_assembly_compatibility", 27));
	ge1049ov4534 = (GE_ms8("msil_classes_per_module", 23));
	ge1049ov4535 = (GE_ms8("msil_clr_version", 16));
	ge1049ov4536 = (GE_ms8("msil_culture", 12));
	ge1049ov4537 = (GE_ms8("msil_generation", 15));
	ge1049ov4538 = (GE_ms8("msil_generation_version", 23));
	ge1049ov4539 = (GE_ms8("msil_key_file_name", 18));
	ge1049ov4540 = (GE_ms8("msil_use_optimized_precompile", 29));
	ge1049ov4541 = (GE_ms8("multithreaded", 13));
	ge1049ov4542 = (GE_ms8("namespace", 9));
	ge1049ov4543 = (GE_ms8("no_default_lib", 14));
	ge1049ov4544 = (GE_ms8("old_verbatim_strings", 20));
	ge1049ov4545 = (GE_ms8("override_cluster", 16));
	ge1049ov4546 = (GE_ms8("portable_code_generation", 24));
	ge1049ov4547 = (GE_ms8("precompiled", 11));
	ge1049ov4548 = (GE_ms8("prefix", 6));
	ge1049ov4549 = (GE_ms8("profile", 7));
	ge1049ov4550 = (GE_ms8("public_key_token", 16));
	ge1049ov4551 = (GE_ms8("read_only", 9));
	ge1049ov4552 = (GE_ms8("recursive", 9));
	ge1049ov4553 = (GE_ms8("reloads_optimization", 20));
	ge1049ov4554 = (GE_ms8("shared_library_definition", 25));
	ge1049ov4555 = (GE_ms8("split", 5));
	ge1049ov4556 = (GE_ms8("stack_size", 10));
	ge1049ov4557 = (GE_ms8("storable", 8));
	ge1049ov4558 = (GE_ms8("storable_filename", 17));
	ge1049ov4559 = (GE_ms8("strip", 5));
	ge1049ov4560 = (GE_ms8("target", 6));
	ge1049ov4561 = (GE_ms8("trace", 5));
	ge1049ov4562 = (GE_ms8("use_cluster_name_as_namespace", 29));
	ge1049ov4563 = (GE_ms8("use_full_cluster_name_as_namespace", 34));
	ge1049ov4564 = (GE_ms8("verbose", 7));
	ge1049ov4565 = (GE_ms8("version", 7));
	ge1049ov4566 = (GE_ms8("visible_filename", 16));
	ge1049ov4567 = (GE_ms8("warning", 7));
	ge1049ov4568 = (GE_ms8("wedit", 5));
	ge1049ov4666 = (GE_ms8("boehm", 5));
	ge1049ov4677 = (GE_ms8("internal", 8));
	ge1082ov4443 = (GE_ms8("", 0));
	ge1049ov4686 = (GE_ms8("require", 7));
	ge1049ov4673 = (GE_ms8("ensure", 6));
	ge1049ov4678 = (GE_ms8("invariant", 9));
	ge1049ov4679 = (GE_ms8("loop_invariant", 14));
	ge1049ov4680 = (GE_ms8("loop_variant", 12));
	ge1049ov4667 = (GE_ms8("check", 5));
	ge1049ov4684 = (GE_ms8("none", 4));
	ge1049ov4688 = (GE_ms8("style", 5));
	ge1049ov4671 = (GE_ms8("default", 7));
	ge1049ov4663 = (GE_ms8("all", 3));
	ge1049ov4674 = (GE_ms8("exe", 3));
	ge1049ov4672 = (GE_ms8("dll", 3));
	ge1049ov4669 = (GE_ms8("com", 3));
	ge1049ov4683 = (GE_ms8("no_main", 7));
	ge1049ov4682 = (GE_ms8("microsoft", 9));
	ge1049ov4665 = (GE_ms8("auto", 4));
	ge1049ov4687 = (GE_ms8("sequential", 10));
	ge1049ov4664 = (GE_ms8("array", 5));
	ge1049ov4670 = (GE_ms8("constant", 8));
	ge1049ov4685 = (GE_ms8("once", 4));
	ge1049ov4681 = (GE_ms8("low_level", 9));
	ge1049ov4675 = (GE_ms8("feature", 7));
	ge1049ov4668 = (GE_ms8("class", 5));
	ge1049ov4691 = (GE_ms8("winapi", 6));
	ge1049ov4676 = (GE_ms8("generate", 8));
	ge1049ov4689 = (GE_ms8("supplier_precondition", 21));
	ge1082ov4442 = (GE_ms8("false", 5));
	ge1082ov4441 = (GE_ms8("true", 4));
	ge1039ov18385 = (GE_ms8("", 0));
	ge1045ov17438 = (GE_ms8("", 0));
	ge1334ov11709 = (GE_ms8("PE reference only allowed in DTD", 32));
	ge1334ov11671 = (GE_ms8("< not allowed in attribute value", 32));
	ge1334ov11669 = (GE_ms8("-- not allowed in comment", 25));
	ge1334ov11710 = (GE_ms8("xml prefix reserved in processing instruction", 45));
	ge1334ov11682 = (GE_ms8("Misformed XML Declaration", 25));
	ge1334ov11681 = (GE_ms8("Misplaced markup declaration", 28));
	ge1334ov11692 = (GE_ms8("End tag does not match start tag", 32));
	ge1334ov11686 = (GE_ms8("Missing element end tag", 23));
	ge1334ov11685 = (GE_ms8("Error in element content", 24));
	ge1334ov11684 = (GE_ms8("Misformed start tag", 19));
	ge1334ov11690 = (GE_ms8("Attribute declared twice", 24));
	ge1334ov11689 = (GE_ms8("Misformed attribute in tag", 26));
	ge1334ov11691 = (GE_ms8("Error in end tag", 16));
	ge1334ov11668 = (GE_ms8("]]> not allowed in content", 26));
	ge1334ov11694 = (GE_ms8("Error in XML declaration", 24));
	ge1334ov11703 = (GE_ms8("Misformed element type declaration", 34));
	ge1337ov11524 = (GE_ms8("*", 1));
	ge1337ov11522 = (GE_ms8("+", 1));
	ge1337ov11523 = (GE_ms8("\?", 1));
	ge1334ov11704 = (GE_ms8("Misformed attribute list declaration", 36));
	ge1334ov11705 = (GE_ms8("Misformed attribute definition declaration", 42));
	ge1334ov11708 = (GE_ms8("Misformed conditional section", 29));
	ge1334ov11706 = (GE_ms8("Misformed entity declaration", 28));
	ge1334ov11707 = (GE_ms8("Misformed entity notation", 25));
	ge1334ov11701 = (GE_ms8("Parser is not configured to support external DTDs", 49));
	ge1330ov23629 = (GE_ms8("1.0", 3));
	ge1330ov23630 = (GE_ms8("utf-8", 5));
	ge1334ov11674 = (GE_ms8("unsupported character encoding", 30));
	ge1334ov11697 = (GE_ms8("External reference in quoted value", 34));
	ge1334ov11717 = (GE_ms8("Unexpected non-ASCII character in ASCII-only mode", 49));
	ge1334ov11718 = (GE_ms8("Unexpected non-latin1 character in latin1-only mode", 51));
	ge1334ov11719 = (GE_ms8("Invalid UTF8 character sequence", 31));
	ge1334ov11712 = (GE_ms8("Name misformed", 14));
	ge1334ov11695 = (GE_ms8("Literal entity expected in attribute", 36));
	ge1334ov11696 = (GE_ms8("Entity is not defined", 21));
	ge1334ov11698 = (GE_ms8("Entity cannot be recursively included", 37));
	ge1334ov11702 = (GE_ms8("Undefined PE entity", 19));
	ge1126ov5243 = (GE_ms8(" \t\r\n", 4));
	ge57ov4130 = (GE_ms8("The value \'$2\' is not valid for the option \'$1\'.", 48));
	ge57ov4137 = (GE_ms8("APIPAR", 6));
	ge55ov4378 = (GE_ms8("usage: ", 7));
	ge318ov1718 = (GE_ms8("3.8", 3));
	ge54ov3611 = (GE_ms8("Errors parsing arguments, aborting.", 35));
	ge57ov4133 = (GE_ms8("Too many occurrences of option \'$1\'.", 36));
	ge57ov4140 = (GE_ms8("APSOPT", 6));
	ge57ov4131 = (GE_ms8("The mandatory option \'$1\' is missing.", 37));
	ge57ov4138 = (GE_ms8("APMOPT", 6));
	ge57ov4132 = (GE_ms8("The option \'$1\' is missing a parameter.", 39));
	ge57ov4139 = (GE_ms8("APMPAR", 6));
	ge57ov4134 = (GE_ms8("Unknown option \'$1\'.", 20));
	ge57ov4141 = (GE_ms8("APUOPT", 6));
	ge57ov4135 = (GE_ms8("The flag \'$1\' was given the parameter \'$2\'.", 43));
	ge57ov4142 = (GE_ms8("APUPAR", 6));
	ge54ov3606 = (GE_ms8("help", 4));
	ge54ov3605 = (GE_ms8("Display this help text.", 23));
	ge54ov3613 = (GE_ms8("parameters ...", 14));
	ge54ov3612 = (GE_ms8("", 0));
	ge1341ov23335 = (GE_ms8(" ", 1));
	ge1341ov23336 = (GE_ms8("  ", 2));
	ge1332ov25794 = (GE_ms8("iso-8859-1", 10));
	ge1332ov25796 = (GE_ms8("utf-16", 6));
	ge891ov14844 = (GE_ms8("TUPLE", 5));
	ge884ov28075 = (GE_ms8("like Current", 12));
	ge887ov27677 = (GE_ms8("like ", 5));
	ge863ov27705 = (GE_ms8("BIT ", 4));
	ge991ov25508 = (GE_ms8("vuar2b", 6));
	ge991ov25263 = (GE_ms8("VUAR-2", 6));
	ge991ov25116 = (GE_ms8("the $9-th actual argument (of type \'$10\') does not conform to the corresponding formal argument (of type \'$11\') of feature `$8\'.", 128));
	ge991ov25507 = (GE_ms8("vuar2a", 6));
	ge991ov25115 = (GE_ms8("the $10-th actual argument (of type \'$11\') does not conform to the corresponding formal argument (of type \'$12\') of feature `$8\' in class $9.", 141));
	ge991ov25327 = (GE_ms8("vdpr4b", 6));
	ge991ov25174 = (GE_ms8("VDPR-4B", 7));
	ge991ov24935 = (GE_ms8("the $9-th actual argument (of type \'$10\') does not conform to the corresponding formal argument (of type \'$11\') of feature `$7\' in class $8.", 140));
	ge805ov13299 = (GE_ms8("like", 4));
	ge991ov25505 = (GE_ms8("vuar1b", 6));
	ge991ov25262 = (GE_ms8("VUAR-1", 6));
	ge991ov25113 = (GE_ms8("the number of actual arguments is not the same as the number of formal arguments of feature `$8\'.", 97));
	ge991ov25504 = (GE_ms8("vuar1a", 6));
	ge991ov25112 = (GE_ms8("the number of actual arguments is not the same as the number of formal arguments of feature `$8\' in class $9.", 109));
	ge991ov25326 = (GE_ms8("vdpr4a", 6));
	ge991ov25173 = (GE_ms8("VDPR-4A", 7));
	ge991ov24934 = (GE_ms8("the number of actual arguments in Precursor call is not the same as the number of formal arguments of feature `$7\' in class $8.", 127));
	ge991ov25295 = (GE_ms8("vape0a", 6));
	ge991ov25159 = (GE_ms8("VAPE", 4));
	ge991ov24903 = (GE_ms8("feature `$8\' of class $5 appearing in the precondition of `$9\' is not exported to class $10 to which feature `$9\' is exported.", 126));
	ge991ov25510 = (GE_ms8("vuex1a", 6));
	ge991ov25265 = (GE_ms8("VUEX-1", 6));
	ge991ov25118 = (GE_ms8("`$7\' is not the final name of a feature in class $5.", 52));
	ge991ov25543 = (GE_ms8("gvual0a", 7));
	ge991ov25289 = (GE_ms8("GVUAL", 5));
	ge991ov25151 = (GE_ms8("`$7\' is a local variable of feature `$8\' and hence cannot have actual arguments.", 80));
	ge991ov25544 = (GE_ms8("gvual0b", 7));
	ge991ov25152 = (GE_ms8("`$7\' is a local variable of an inline agent and hence cannot have actual arguments.", 83));
	ge991ov25541 = (GE_ms8("gvuaa0a", 7));
	ge991ov25288 = (GE_ms8("GVUAA", 5));
	ge991ov25149 = (GE_ms8("`$7\' is a formal argument of feature `$8\' and hence cannot have actual arguments.", 81));
	ge991ov25542 = (GE_ms8("gvuaa0b", 7));
	ge991ov25150 = (GE_ms8("`$7\' is a formal argument of an inline agent and hence cannot have actual arguments.", 84));
	ge991ov25424 = (GE_ms8("vkcn2c", 6));
	ge991ov25220 = (GE_ms8("VKCN-2", 6));
	ge991ov25032 = (GE_ms8("procedure `$8\' appears in a call expression.", 44));
	ge991ov25547 = (GE_ms8("gvuil0a", 7));
	ge991ov25291 = (GE_ms8("GVUIL", 5));
	ge991ov25155 = (GE_ms8("`$7\' is a local variable of feature `$8\' and hence cannot be an instruction.", 76));
	ge991ov25548 = (GE_ms8("gvuil0b", 7));
	ge991ov25156 = (GE_ms8("`$7\' is a local variable of an inline agent and hence cannot be an instruction.", 79));
	ge991ov25545 = (GE_ms8("gvuia0a", 7));
	ge991ov25290 = (GE_ms8("GVUIA", 5));
	ge991ov25153 = (GE_ms8("`$7\' is a formal argument of feature `$8\' and hence cannot be an instruction.", 77));
	ge991ov25546 = (GE_ms8("gvuia0b", 7));
	ge991ov25154 = (GE_ms8("`$7\' is a formal argument of an inline agent and hence cannot be an instruction.", 80));
	ge991ov25422 = (GE_ms8("vkcn1c", 6));
	ge991ov25219 = (GE_ms8("VKCN-1", 6));
	ge991ov25030 = (GE_ms8("query `$8\' appears in a call instruction.", 41));
	ge991ov25364 = (GE_ms8("veen8b", 6));
	ge991ov25191 = (GE_ms8("VEEN-8", 6));
	ge991ov24972 = (GE_ms8("`$7\' appearing in the invariant or one of its possibly nested inline agents, is an object-test local that is used outside of its scope.", 135));
	ge991ov25363 = (GE_ms8("veen8a", 6));
	ge991ov24971 = (GE_ms8("`$7\' appearing in feature `$8\' or one of its possibly nested inline agents, is an object-test local that is used outside of its scope.", 134));
	ge991ov25358 = (GE_ms8("veen2c", 6));
	ge991ov25190 = (GE_ms8("VEEN-2", 6));
	ge991ov24966 = (GE_ms8("local entity `$7\' appears in the precondition or postcondition of feature `$8\'.", 79));
	ge991ov25360 = (GE_ms8("veen2e", 6));
	ge991ov24968 = (GE_ms8("local entity `$7\' appears in the precondition or postcondition of an inline agent.", 82));
	ge991ov25296 = (GE_ms8("vape0b", 6));
	ge991ov24904 = (GE_ms8("feature `$8\' of class $9 appearing in the precondition of `$10\' is not exported to class $11 to which feature `$10\' is exported.", 128));
	ge991ov25512 = (GE_ms8("vuex2b", 6));
	ge991ov25266 = (GE_ms8("VUEX-2", 6));
	ge991ov25120 = (GE_ms8("feature `$8\' of class $9 is not exported to class $5.", 53));
	ge991ov25506 = (GE_ms8("vuar1c", 6));
	ge991ov25114 = (GE_ms8("call to Tuple label `$7\' cannot have arguments.", 47));
	ge991ov25511 = (GE_ms8("vuex2a", 6));
	ge991ov25119 = (GE_ms8("`$7\' is not the final name of a feature in class $8.", 52));
	ge991ov25423 = (GE_ms8("vkcn2a", 6));
	ge991ov25031 = (GE_ms8("procedure `$8\' of class $9 appears in a call expression.", 56));
	ge991ov25356 = (GE_ms8("veen2a", 6));
	ge991ov24964 = (GE_ms8("entity \'Result\' appears in the body, postcondition or rescue clause of a procedure `$7\'.", 88));
	ge991ov25362 = (GE_ms8("veen2g", 6));
	ge991ov24970 = (GE_ms8("entity \'Result\' appears in the body, postcondition or rescue clause of an inline agent whose associated feature is a procedure.", 127));
	ge991ov25359 = (GE_ms8("veen2d", 6));
	ge991ov24967 = (GE_ms8("entity \'Result\' appears in the invariant of the class.", 54));
	ge991ov25357 = (GE_ms8("veen2b", 6));
	ge991ov24965 = (GE_ms8("entity \'Result\' appears in the precondition of feature `$7\'.", 60));
	ge991ov25500 = (GE_ms8("vtgc0a", 6));
	ge991ov25259 = (GE_ms8("VTGC", 4));
	ge991ov25108 = (GE_ms8("`$7\' is not the final name of a procedure in constraint\'s base class $8.", 72));
	ge991ov25501 = (GE_ms8("vtgc0b", 6));
	ge991ov25109 = (GE_ms8("`$7\' is not the final name of a procedure in constraint\'s base class $8.", 72));
	ge991ov25402 = (GE_ms8("vgcp3c", 6));
	ge991ov25209 = (GE_ms8("VGCP-3", 6));
	ge991ov25010 = (GE_ms8("procedure name `$7\' appears twice in creation clause of constraint.", 67));
	ge991ov25398 = (GE_ms8("vgcp2a", 6));
	ge991ov25208 = (GE_ms8("VGCP-2", 6));
	ge991ov25006 = (GE_ms8("`$7\' is not the final name of a procedure.", 42));
	ge991ov25399 = (GE_ms8("vgcp2b", 6));
	ge991ov25007 = (GE_ms8("`$7\' is not the final name of a procedure.", 42));
	ge991ov25390 = (GE_ms8("vgcc6a", 6));
	ge991ov25205 = (GE_ms8("VGCC-6", 6));
	ge991ov24998 = (GE_ms8("`$7\' is the final name of a once-procedure.", 43));
	ge991ov25401 = (GE_ms8("vgcp3b", 6));
	ge991ov25009 = (GE_ms8("procedure name `$7\' appears in two different creation clauses.", 62));
	ge991ov25400 = (GE_ms8("vgcp3a", 6));
	ge991ov25008 = (GE_ms8("procedure name `$7\' appears twice in creation clause.", 53));
	ge991ov25397 = (GE_ms8("vgcp1a", 6));
	ge991ov25207 = (GE_ms8("VGCP-1", 6));
	ge991ov25005 = (GE_ms8("deferred class has a creation clause.", 37));
	ge991ov25369 = (GE_ms8("vfac4a", 6));
	ge991ov25195 = (GE_ms8("VFAC-4", 6));
	ge991ov24977 = (GE_ms8("the type of the $10-th argument of assigner procedure `$8\' and of the $9-th argument of query `$7\' do not have the same deanchored form.", 136));
	ge991ov25368 = (GE_ms8("vfac3a", 6));
	ge991ov25194 = (GE_ms8("VFAC-3", 6));
	ge991ov24976 = (GE_ms8("the type of the first argument of assigner procedure `$8\' and the result type of query `$7\' do not have the same deanchored form.", 129));
	ge991ov25367 = (GE_ms8("vfac2a", 6));
	ge991ov25193 = (GE_ms8("VFAC-2", 6));
	ge991ov24975 = (GE_ms8("the number of arguments in assigner procedure `$8\' is not one more than the number of arguments in query `$7\'.", 110));
	ge991ov25366 = (GE_ms8("vfac1b", 6));
	ge991ov25192 = (GE_ms8("VFAC-1", 6));
	ge991ov24974 = (GE_ms8("query `$7\' has an assigner mark `$8\' but this feature is not a procedure.", 73));
	ge991ov25365 = (GE_ms8("vfac1a", 6));
	ge991ov24973 = (GE_ms8("query `$7\' has an assigner mark `$8\' but there is no feature with that name.", 76));
	ge991ov25302 = (GE_ms8("vcch2a", 6));
	ge991ov25164 = (GE_ms8("VCCH-2", 6));
	ge991ov24910 = (GE_ms8("class is marked as deferred but has no deferred feature.", 56));
	ge991ov25300 = (GE_ms8("vcch1a", 6));
	ge991ov25163 = (GE_ms8("VCCH-1", 6));
	ge991ov24908 = (GE_ms8("class is not marked as deferred but has deferred feature `$7\'.", 62));
	ge991ov25330 = (GE_ms8("vdrd2c", 6));
	ge991ov25175 = (GE_ms8("VDRD-2", 6));
	ge991ov24938 = (GE_ms8("signature of selected feature `$7\' does not conform to the signature of replicated feature `$8\' in parent $9.", 109));
	ge991ov25331 = (GE_ms8("vdrd2d", 6));
	ge991ov24939 = (GE_ms8("signature of selected feature `$7\' inherited from $8 does not conform to the signature of replicated feature `$9\' in parent $10.", 128));
	ge991ov25314 = (GE_ms8("vdjr0b", 6));
	ge991ov25168 = (GE_ms8("VDJR", 4));
	ge991ov24922 = (GE_ms8("joined deferred features `$7\' inherited from $8 and $9 don\'t have the same signature. Type of argument number $10 differs.", 122));
	ge991ov25313 = (GE_ms8("vdjr0a", 6));
	ge991ov24921 = (GE_ms8("joined deferred features `$7\' inherited from $8 and $9 don\'t have the same signature. Different number of arguments.", 116));
	ge991ov25315 = (GE_ms8("vdjr0c", 6));
	ge991ov24923 = (GE_ms8("joined deferred features `$7\' inherited from $8 and $9 don\'t have the same signature. Type of result differs.", 109));
	ge991ov25339 = (GE_ms8("vdrd6b", 6));
	ge991ov25179 = (GE_ms8("VDRD-6", 6));
	ge991ov24947 = (GE_ms8("attribute `$7\' inherited from $8 and its redeclared version don\'t have the same type expandedness.", 98));
	ge991ov25328 = (GE_ms8("vdrd2a", 6));
	ge991ov24936 = (GE_ms8("signature of feature `$7\' does not conform to the signature of redeclared feature `$8\' in parent $9.", 100));
	ge991ov25329 = (GE_ms8("vdrd2b", 6));
	ge991ov24937 = (GE_ms8("signature of feature `$7\' inherited from $8 does not conform to the signature of redeclared feature `$9\' in parent $10.", 119));
	ge991ov25375 = (GE_ms8("vfav1f", 6));
	ge991ov25196 = (GE_ms8("VFAV-1", 6));
	ge991ov24983 = (GE_ms8("features `$7\' and `$9\' have both the same binary Operator alias `$8\'.", 69));
	ge991ov25372 = (GE_ms8("vfav1c", 6));
	ge991ov24980 = (GE_ms8("features `$7\' and `$9\' have both the same unary Operator alias `$8\'.", 68));
	ge991ov25379 = (GE_ms8("vfav2b", 6));
	ge991ov25197 = (GE_ms8("VFAV-2", 6));
	ge991ov24987 = (GE_ms8("features `$7\' and `$9\' have both the same Bracket alias `$8\'.", 61));
	ge991ov25376 = (GE_ms8("vfav1g", 6));
	ge991ov24984 = (GE_ms8("features `$7\' and `$9\' inherited from $11 have both the same binary Operator alias `$8\'.", 88));
	ge991ov25373 = (GE_ms8("vfav1d", 6));
	ge991ov24981 = (GE_ms8("features `$7\' and `$9\' inherited from $11 have both the same unary Operator alias `$8\'.", 87));
	ge991ov25380 = (GE_ms8("vfav2c", 6));
	ge991ov24988 = (GE_ms8("features `$7\' and `$9\' inherited from $11 have both the same Bracket alias `$8\'.", 80));
	ge991ov25377 = (GE_ms8("vfav1h", 6));
	ge991ov24985 = (GE_ms8("features `$7\' inherited from $9 and `$10\' inherited from $12 have both the same binary Operator alias `$8\'.", 107));
	ge991ov25374 = (GE_ms8("vfav1e", 6));
	ge991ov24982 = (GE_ms8("features `$7\' inherited from $9 and `$10\' inherited from $12 have both the same unary Operator alias `$8\'.", 106));
	ge991ov25381 = (GE_ms8("vfav2d", 6));
	ge991ov24989 = (GE_ms8("features `$7\' inherited from $9 and `$10\' inherited from $12 have both the same Bracket alias `$8\'.", 99));
	ge991ov25490 = (GE_ms8("vtat2a", 6));
	ge991ov25254 = (GE_ms8("VTAT-2", 6));
	ge991ov25098 = (GE_ms8("anchor cycle $7.", 16));
	ge991ov25386 = (GE_ms8("vffd7b", 6));
	ge991ov25201 = (GE_ms8("VFFD-7", 6));
	ge991ov24994 = (GE_ms8("feature `$7\' is a once funtion but its type contains a formal generic parameter.", 80));
	ge991ov25385 = (GE_ms8("vffd7a", 6));
	ge991ov24993 = (GE_ms8("feature `$7\' is a once funtion but its type contains an anchored type.", 70));
	ge991ov25371 = (GE_ms8("vfav1b", 6));
	ge991ov24979 = (GE_ms8("feature `$7\' has a unary Operator alias `$8\' but is not a query with no argument.", 81));
	ge991ov25370 = (GE_ms8("vfav1a", 6));
	ge991ov24978 = (GE_ms8("feature `$7\' has a binary Operator alias `$8\' but is not a query with at exactly one argument.", 94));
	ge991ov25378 = (GE_ms8("vfav2a", 6));
	ge991ov24986 = (GE_ms8("feature `$7\' has a Bracket alias `$8\' but is not a query with at least one argument.", 84));
	ge991ov25384 = (GE_ms8("vffd6a", 6));
	ge991ov25200 = (GE_ms8("VFFD-6", 6));
	ge991ov24992 = (GE_ms8("feature `$7\' has an Infix name but is not a function with exactly one argument.", 79));
	ge991ov25383 = (GE_ms8("vffd5a", 6));
	ge991ov25199 = (GE_ms8("VFFD-5", 6));
	ge991ov24991 = (GE_ms8("feature `$7\' has a Prefix name but is not an attribute or a function with no argument.", 86));
	ge991ov25382 = (GE_ms8("vffd4a", 6));
	ge991ov25198 = (GE_ms8("VFFD-4", 6));
	ge991ov24990 = (GE_ms8("deferred feature `$7\' is marked as frozen.", 42));
	ge991ov25468 = (GE_ms8("vrfa0a", 6));
	ge991ov25247 = (GE_ms8("VRFA", 4));
	ge991ov25076 = (GE_ms8("argument name \'$7\' in feature `$8\' is also the final name of a feature.", 71));
	ge991ov25466 = (GE_ms8("vreg0a", 6));
	ge991ov25246 = (GE_ms8("VREG", 4));
	ge991ov25074 = (GE_ms8("argument name \'$7\' appear twice in feature `$8\'.", 48));
	ge991ov25317 = (GE_ms8("vdjr2b", 6));
	ge991ov25169 = (GE_ms8("VDJR-2", 6));
	ge991ov24925 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $11 has a different one `$10\'.", 110));
	ge991ov25432 = (GE_ms8("vmfn2b", 6));
	ge991ov25225 = (GE_ms8("VMFN-2", 6));
	ge991ov25040 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $11 has a different one `$10\'.", 110));
	ge991ov25316 = (GE_ms8("vdjr2a", 6));
	ge991ov24924 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $10 has none.", 93));
	ge991ov25431 = (GE_ms8("vmfn2a", 6));
	ge991ov25039 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $10 has none.", 93));
	ge991ov25430 = (GE_ms8("vmfn0c", 6));
	ge991ov25224 = (GE_ms8("VMFN", 4));
	ge991ov25038 = (GE_ms8("two features with the same name `$7\' inherited from $8 and `$9\' inherited from $10.", 83));
	ge991ov25347 = (GE_ms8("vdrs4a", 6));
	ge991ov25184 = (GE_ms8("VDRS-4", 6));
	ge991ov24955 = (GE_ms8("Redefine subclause of $8 lists feature `$7\' but it is not redefined.", 68));
	ge991ov25345 = (GE_ms8("vdrs2b", 6));
	ge991ov25182 = (GE_ms8("VDRS-2", 6));
	ge991ov24953 = (GE_ms8("cannot redefine the constant attribute `$7\'.", 44));
	ge991ov25344 = (GE_ms8("vdrs2a", 6));
	ge991ov24952 = (GE_ms8("cannot redefine the frozen feature `$7\'.", 40));
	ge991ov25351 = (GE_ms8("vdus2b", 6));
	ge991ov25186 = (GE_ms8("VDUS-2", 6));
	ge991ov24959 = (GE_ms8("cannot undefine the attribute `$7\'.", 35));
	ge991ov25350 = (GE_ms8("vdus2a", 6));
	ge991ov24958 = (GE_ms8("cannot undefine the frozen feature `$7\'.", 40));
	ge991ov25352 = (GE_ms8("vdus3a", 6));
	ge991ov25187 = (GE_ms8("VDUS-3", 6));
	ge991ov24960 = (GE_ms8("cannot undefine the deferred feature `$7\'.", 42));
	ge991ov25414 = (GE_ms8("vhrc4d", 6));
	ge991ov25214 = (GE_ms8("VHRC-4", 6));
	ge991ov25022 = (GE_ms8("`$7\' has a unary Operator alias `$8\' but `$9\' in $10 is not a query with no argument.", 85));
	ge991ov25413 = (GE_ms8("vhrc4c", 6));
	ge991ov25021 = (GE_ms8("`$7\' has a binary Operator alias `$8\' but `$9\' in $10 is not a query with exactly one argument.", 95));
	ge991ov25412 = (GE_ms8("vhrc4b", 6));
	ge991ov25020 = (GE_ms8("`$7\' has a Bracket alias `$8\' but `$9\' in $10 is not a query with at least one argument.", 88));
	ge991ov25411 = (GE_ms8("vhrc4a", 6));
	ge991ov25019 = (GE_ms8("`$7\' is of the Prefix form but `$8\' in $9 is not an attribute nor a function with no argument.", 94));
	ge991ov25415 = (GE_ms8("vhrc5a", 6));
	ge991ov25215 = (GE_ms8("VHRC-5", 6));
	ge991ov25023 = (GE_ms8("`$7\' is of the Infix form but `$8\' in $9 is not a function with one argument.", 77));
	ge991ov25333 = (GE_ms8("vdrd3b", 6));
	ge991ov25176 = (GE_ms8("VDRD-3", 6));
	ge991ov24941 = (GE_ms8("feature `$7\' is redeclared but its postconditions do not begin with \'ensure then\'.", 82));
	ge991ov25332 = (GE_ms8("vdrd3a", 6));
	ge991ov24940 = (GE_ms8("feature `$7\' is redeclared but its preconditions do not begin with \'require else\'.", 82));
	ge991ov25338 = (GE_ms8("vdrd6a", 6));
	ge991ov24946 = (GE_ms8("attribute `$7\' inherited from $8 is not redeclared into an attribute.", 69));
	ge991ov25335 = (GE_ms8("vdrd4b", 6));
	ge991ov25177 = (GE_ms8("VDRD-4", 6));
	ge991ov24943 = (GE_ms8("effective feature `$7\' inherited from $8 is redefined but is not listed in the Redefine subclause.", 98));
	ge991ov25336 = (GE_ms8("vdrd4c", 6));
	ge991ov24944 = (GE_ms8("effective feature `$8\' inherited from $9 is redefined into a deferred one but is not listed in the Undefine and Redefine subclauses.", 132));
	ge991ov25429 = (GE_ms8("vmfn0b", 6));
	ge991ov25037 = (GE_ms8("two features with the same name `$7\' in current class and `$8\' inherited from $9.", 81));
	ge991ov25334 = (GE_ms8("vdrd4a", 6));
	ge991ov24942 = (GE_ms8("deferred feature `$7\' inherited from $8 is redefined but is not listed in the Redefine subclause.", 97));
	ge991ov25348 = (GE_ms8("vdrs4b", 6));
	ge991ov24956 = (GE_ms8("redeclaration of feature `$7\' from $8 is an effecting and should not appear in the Redefine subclause.", 102));
	ge991ov25337 = (GE_ms8("vdrd5a", 6));
	ge991ov25178 = (GE_ms8("VDRD-5", 6));
	ge991ov24945 = (GE_ms8("effective feature `$7\' inherited from $8 is redefined into a deferred one.", 74));
	ge991ov25342 = (GE_ms8("vdrd7c", 6));
	ge991ov25180 = (GE_ms8("VDRD-7", 6));
	ge991ov24950 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but its redeclared version has a different one `$11\'.", 102));
	ge991ov25340 = (GE_ms8("vdrd7a", 6));
	ge991ov24948 = (GE_ms8("feature `$7\' inherited from $8 has no alias but its redeclared version has one `$10\'.", 85));
	ge991ov25341 = (GE_ms8("vdrd7b", 6));
	ge991ov24949 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but its redeclared version has none.", 85));
	ge991ov25437 = (GE_ms8("vmss3a", 6));
	ge991ov25229 = (GE_ms8("VMSS-3", 6));
	ge991ov25045 = (GE_ms8("feature name `$7\' appears in the Select subclause of parent $8 but is not replicated.", 85));
	ge991ov25433 = (GE_ms8("vmrc2a", 6));
	ge991ov25226 = (GE_ms8("VMRC-2", 6));
	ge991ov25041 = (GE_ms8("replicated features $6 have not been selected.", 46));
	ge991ov25435 = (GE_ms8("vmss1a", 6));
	ge991ov25227 = (GE_ms8("VMSS-1", 6));
	ge991ov25043 = (GE_ms8("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge991ov25343 = (GE_ms8("vdrs1a", 6));
	ge991ov25181 = (GE_ms8("VDRS-1", 6));
	ge991ov24951 = (GE_ms8("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge991ov25349 = (GE_ms8("vdus1a", 6));
	ge991ov25185 = (GE_ms8("VDUS-1", 6));
	ge991ov24957 = (GE_ms8("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge991ov25426 = (GE_ms8("vlel2a", 6));
	ge991ov25222 = (GE_ms8("VLEL-2", 6));
	ge991ov25034 = (GE_ms8("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge991ov25409 = (GE_ms8("vhrc1a", 6));
	ge991ov25212 = (GE_ms8("VHRC-1", 6));
	ge991ov25017 = (GE_ms8("`$7\' is not the final name of a feature in $8.", 46));
	ge991ov25436 = (GE_ms8("vmss2a", 6));
	ge991ov25228 = (GE_ms8("VMSS-2", 6));
	ge991ov25044 = (GE_ms8("feature name `$7\' appears twice in the Select subclause of parent $8.", 69));
	ge991ov25346 = (GE_ms8("vdrs3a", 6));
	ge991ov25183 = (GE_ms8("VDRS-3", 6));
	ge991ov24954 = (GE_ms8("feature name `$7\' appears twice in the Redefine subclause of parent $8.", 71));
	ge991ov25353 = (GE_ms8("vdus4a", 6));
	ge991ov25188 = (GE_ms8("VDUS-4", 6));
	ge991ov24961 = (GE_ms8("feature name `$7\' appears twice in the Undefine subclause of parent $8.", 71));
	ge991ov25427 = (GE_ms8("vlel3a", 6));
	ge991ov25223 = (GE_ms8("VLEL-3", 6));
	ge991ov25035 = (GE_ms8("feature name `$7\' appears twice in the Export subclause of parent $8.", 69));
	ge991ov25425 = (GE_ms8("vlel1a", 6));
	ge991ov25221 = (GE_ms8("VLEL-1", 6));
	ge991ov25033 = (GE_ms8("\'all\' keyword appears twice in the Export subclause of parent $7.", 65));
	ge991ov25410 = (GE_ms8("vhrc2a", 6));
	ge991ov25213 = (GE_ms8("VHRC-2", 6));
	ge991ov25018 = (GE_ms8("feature name `$7\' appears as first element of two Rename_pairs.", 63));
	ge991ov25428 = (GE_ms8("vmfn0a", 6));
	ge991ov25036 = (GE_ms8("two features with the same name `$7\'.", 37));
	ge805ov13268 = (GE_ms8("as", 2));
	ge991ov25404 = (GE_ms8("vhpr1a", 6));
	ge991ov25202 = (GE_ms8("VHPR-1", 6));
	ge991ov25012 = (GE_ms8("inheritance cycle $7.", 21));
	ge991ov25312 = (GE_ms8("vcfg3j", 6));
	ge991ov25167 = (GE_ms8("VCFG-3", 6));
	ge991ov24920 = (GE_ms8("formal generic constraint cycle $7.", 35));
	ge991ov25310 = (GE_ms8("vcfg3g", 6));
	ge991ov24918 = (GE_ms8("formal generic constraint cycle $7.", 35));
	ge991ov25304 = (GE_ms8("vcfg2a", 6));
	ge991ov25166 = (GE_ms8("VCFG-2", 6));
	ge991ov24912 = (GE_ms8("\'$7\' is the name of formal generic parameters #$7 and #$8.", 58));
	ge991ov25303 = (GE_ms8("vcfg1a", 6));
	ge991ov25165 = (GE_ms8("VCFG-1", 6));
	ge991ov24911 = (GE_ms8("formal generic parameter \'$7\' has the same name as a class in the surrounding universe.", 87));
	ge991ov25527 = (GE_ms8("gvagp0a", 7));
	ge991ov25275 = (GE_ms8("GVAGP", 5));
	ge991ov25135 = (GE_ms8("ancestors with generic parameter mismatch: \'$7\' and \'$8\'.", 57));
	ge991ov25531 = (GE_ms8("gvhso2a", 7));
	ge991ov25279 = (GE_ms8("GVHSO-2", 7));
	ge991ov25139 = (GE_ms8("implicitly inherits from class SYSTEM_OBJECT but SYSTEM_OBJECT is not a .NET class.", 83));
	ge991ov25498 = (GE_ms8("vtct0a", 6));
	ge991ov25258 = (GE_ms8("VTCT", 4));
	ge991ov25106 = (GE_ms8("type based on unknown class $7.", 31));
	ge991ov25530 = (GE_ms8("gvhso1a", 7));
	ge991ov25278 = (GE_ms8("GVHSO-1", 7));
	ge991ov25138 = (GE_ms8("implicitly inherits from unknown class SYSTEM_OBJECT.", 53));
	ge991ov25403 = (GE_ms8("vhay0a", 6));
	ge991ov25210 = (GE_ms8("VHAY", 4));
	ge991ov25011 = (GE_ms8("implicitly inherits from unknown class ANY.", 43));
	ge991ov25405 = (GE_ms8("vhpr1b", 6));
	ge991ov25013 = (GE_ms8("inheritance cycle when inheriting from $7.", 42));
	ge982ov31424 = (GE_ms8("gcaab", 5));
	ge982ov31420 = (GE_ms8("GCAAB", 5));
	ge982ov31416 = (GE_ms8("[$1] cluster $2: cannot read Eiffel file \'$3\'.", 46));
	ge805ov13263 = (GE_ms8("agent", 5));
	ge805ov13319 = (GE_ms8("strip", 5));
	ge805ov13305 = (GE_ms8("once", 4));
	ge805ov13304 = (GE_ms8("old", 3));
	ge805ov13280 = (GE_ms8("else", 4));
	ge805ov13306 = (GE_ms8("or", 2));
	ge805ov13320 = (GE_ms8("then", 4));
	ge805ov13266 = (GE_ms8("and", 3));
	ge805ov13308 = (GE_ms8("precursor", 9));
	ge805ov13277 = (GE_ms8("debug", 5));
	ge805ov13279 = (GE_ms8("do", 2));
	ge805ov13327 = (GE_ms8("when", 4));
	ge805ov13274 = (GE_ms8("create", 6));
	ge805ov13271 = (GE_ms8("check", 5));
	ge805ov13301 = (GE_ms8("loop", 4));
	ge805ov13289 = (GE_ms8("from", 4));
	ge805ov13314 = (GE_ms8("rescue", 6));
	ge991ov25494 = (GE_ms8("vtbt0d", 6));
	ge991ov25255 = (GE_ms8("VTBT", 4));
	ge991ov25102 = (GE_ms8("invalid type \'$7\': bit size must be a positive integer constant.", 64));
	ge989ov31432 = (GE_ms8("gssss", 5));
	ge989ov31431 = (GE_ms8("Syntax error:\n$1", 16));
	ge991ov25493 = (GE_ms8("vtbt0c", 6));
	ge991ov25101 = (GE_ms8("invalid type \'$7\': bit size must be a positive integer constant.", 64));
	ge805ov13325 = (GE_ms8("variant", 7));
	ge805ov13297 = (GE_ms8("invariant", 9));
	ge805ov13283 = (GE_ms8("ensure", 6));
	ge805ov13313 = (GE_ms8("require", 7));
	ge805ov13300 = (GE_ms8("local", 5));
	ge805ov13264 = (GE_ms8("alias", 5));
	ge805ov13294 = (GE_ms8("infix", 5));
	ge805ov13309 = (GE_ms8("prefix", 6));
	ge805ov13425 = (GE_ms8("built_in", 8));
	ge805ov13427 = (GE_ms8("built_in static", 15));
	ge805ov13426 = (GE_ms8("static built_in", 15));
	ge991ov25533 = (GE_ms8("gvkbu1a", 7));
	ge991ov25281 = (GE_ms8("GVKBU-1", 7));
	ge991ov25141 = (GE_ms8("unknown built-in routine `$7\' in class $5.", 42));
	ge805ov13209 = (GE_ms8("out", 3));
	ge805ov13177 = (GE_ms8("floor_real_64", 13));
	ge805ov13176 = (GE_ms8("floor_real_32", 13));
	ge805ov13158 = (GE_ms8("ceiling_real_64", 15));
	ge805ov13157 = (GE_ms8("ceiling_real_32", 15));
	ge805ov13243 = (GE_ms8("to_double", 9));
	ge805ov13251 = (GE_ms8("truncated_to_real", 17));
	ge805ov13250 = (GE_ms8("truncated_to_integer_64", 23));
	ge805ov13249 = (GE_ms8("truncated_to_integer", 20));
	ge805ov13349 = (GE_ms8("<", 1));
	ge805ov13353 = (GE_ms8("+", 1));
	ge805ov13350 = (GE_ms8("-", 1));
	ge805ov13354 = (GE_ms8("^", 1));
	ge805ov13337 = (GE_ms8("/", 1));
	ge805ov13362 = (GE_ms8("*", 1));
	ge991ov25532 = (GE_ms8("gvkbs0a", 7));
	ge991ov25280 = (GE_ms8("GVKBS", 5));
	ge991ov25140 = (GE_ms8("built-in routine `$7\' in class $5 has not the expected signature \'$8\'.", 70));
	ge805ov13233 = (GE_ms8("set_item", 8));
	ge805ov13149 = (GE_ms8("bit_not", 7));
	ge805ov13153 = (GE_ms8("bit_xor", 7));
	ge805ov13152 = (GE_ms8("bit_shift_right", 15));
	ge805ov13151 = (GE_ms8("bit_shift_left", 14));
	ge805ov13148 = (GE_ms8("bit_and", 7));
	ge805ov13150 = (GE_ms8("bit_or", 6));
	ge805ov13142 = (GE_ms8("as_integer_64", 13));
	ge805ov13141 = (GE_ms8("as_integer_32", 13));
	ge805ov13140 = (GE_ms8("as_integer_16", 13));
	ge805ov13139 = (GE_ms8("as_integer_8", 12));
	ge805ov13146 = (GE_ms8("as_natural_64", 13));
	ge805ov13145 = (GE_ms8("as_natural_32", 13));
	ge805ov13144 = (GE_ms8("as_natural_16", 13));
	ge805ov13143 = (GE_ms8("as_natural_8", 12));
	ge805ov13248 = (GE_ms8("to_real_64", 10));
	ge805ov13247 = (GE_ms8("to_real_32", 10));
	ge805ov13246 = (GE_ms8("to_real", 7));
	ge805ov13242 = (GE_ms8("to_character_32", 15));
	ge805ov13241 = (GE_ms8("to_character_8", 14));
	ge805ov13351 = (GE_ms8("\\\\", 2));
	ge805ov13336 = (GE_ms8("//", 2));
	ge805ov13231 = (GE_ms8("reference_item", 14));
	ge805ov13229 = (GE_ms8("real_64_item", 12));
	ge805ov13228 = (GE_ms8("real_32_item", 12));
	ge805ov13208 = (GE_ms8("object_comparison", 17));
	ge805ov13207 = (GE_ms8("natural_64_item", 15));
	ge805ov13206 = (GE_ms8("natural_32_item", 15));
	ge805ov13204 = (GE_ms8("natural_16_item", 15));
	ge805ov13203 = (GE_ms8("natural_8_item", 14));
	ge805ov13198 = (GE_ms8("item_code", 9));
	ge805ov13186 = (GE_ms8("integer_64_item", 15));
	ge805ov13185 = (GE_ms8("integer_32_item", 15));
	ge805ov13184 = (GE_ms8("integer_16_item", 15));
	ge805ov13183 = (GE_ms8("integer_8_item", 14));
	ge805ov13160 = (GE_ms8("character_32_item", 17));
	ge805ov13159 = (GE_ms8("character_8_item", 16));
	ge805ov13155 = (GE_ms8("boolean_item", 12));
	ge805ov13234 = (GE_ms8("set_object_comparison", 21));
	ge805ov13227 = (GE_ms8("put_reference", 13));
	ge805ov13226 = (GE_ms8("put_real_64", 11));
	ge805ov13225 = (GE_ms8("put_real_32", 11));
	ge805ov13224 = (GE_ms8("put_pointer", 11));
	ge805ov13223 = (GE_ms8("put_natural_64", 14));
	ge805ov13222 = (GE_ms8("put_natural_32", 14));
	ge805ov13221 = (GE_ms8("put_natural_16", 14));
	ge805ov13220 = (GE_ms8("put_natural_8", 13));
	ge805ov13219 = (GE_ms8("put_integer_64", 14));
	ge805ov13218 = (GE_ms8("put_integer_32", 14));
	ge805ov13217 = (GE_ms8("put_integer_16", 14));
	ge805ov13216 = (GE_ms8("put_integer_8", 13));
	ge805ov13215 = (GE_ms8("put_character_32", 16));
	ge805ov13214 = (GE_ms8("put_character_8", 15));
	ge805ov13213 = (GE_ms8("put_boolean", 11));
	ge805ov13255 = (GE_ms8("wide_character_bytes", 20));
	ge805ov13193 = (GE_ms8("is_thread_capable", 17));
	ge805ov13230 = (GE_ms8("real_bytes", 10));
	ge805ov13210 = (GE_ms8("pointer_bytes", 13));
	ge805ov13187 = (GE_ms8("integer_bytes", 13));
	ge805ov13170 = (GE_ms8("double_bytes", 12));
	ge805ov13161 = (GE_ms8("character_bytes", 15));
	ge805ov13154 = (GE_ms8("boolean_bytes", 13));
	ge805ov13196 = (GE_ms8("is_windows", 10));
	ge805ov13195 = (GE_ms8("is_vms", 6));
	ge805ov13194 = (GE_ms8("is_unix", 7));
	ge805ov13191 = (GE_ms8("is_mac", 6));
	ge805ov13189 = (GE_ms8("is_dotnet", 9));
	ge805ov13172 = (GE_ms8("eif_object_id", 13));
	ge805ov13171 = (GE_ms8("eif_id_object", 13));
	ge805ov13173 = (GE_ms8("eif_object_id_free", 18));
	ge805ov13138 = (GE_ms8("argument_count", 14));
	ge805ov13137 = (GE_ms8("argument", 8));
	ge805ov13182 = (GE_ms8("hash_code", 9));
	ge805ov13244 = (GE_ms8("to_integer_32", 13));
	ge805ov13328 = (GE_ms8("xor", 3));
	ge805ov13302 = (GE_ms8("not", 3));
	ge805ov13292 = (GE_ms8("implies", 7));
	ge805ov13307 = (GE_ms8("or else", 7));
	ge805ov13267 = (GE_ms8("and then", 8));
	ge805ov13205 = (GE_ms8("natural_32_code", 15));
	ge805ov13163 = (GE_ms8("code", 4));
	ge805ov13147 = (GE_ms8("base_address", 12));
	ge805ov13135 = (GE_ms8("aliased_resized_area", 20));
	ge805ov13174 = (GE_ms8("element_size", 12));
	ge805ov13212 = (GE_ms8("put", 3));
	ge805ov13201 = (GE_ms8("make", 4));
	ge805ov13253 = (GE_ms8("type_id", 7));
	ge805ov13202 = (GE_ms8("name", 4));
	ge805ov13181 = (GE_ms8("generic_parameter_count", 23));
	ge805ov13180 = (GE_ms8("generic_parameter", 17));
	ge805ov13178 = (GE_ms8("generating_type", 15));
	ge805ov13167 = (GE_ms8("deep_twin", 9));
	ge805ov13188 = (GE_ms8("is_deep_equal", 13));
	ge805ov13238 = (GE_ms8("standard_twin", 13));
	ge805ov13239 = (GE_ms8("tagged_out", 10));
	ge805ov13179 = (GE_ms8("generator", 9));
	ge805ov13164 = (GE_ms8("conforms_to", 11));
	ge805ov13232 = (GE_ms8("same_type", 9));
	ge805ov13237 = (GE_ms8("standard_is_equal", 17));
	ge805ov13252 = (GE_ms8("twin", 4));
	ge805ov13165 = (GE_ms8("copy", 4));
	ge805ov13236 = (GE_ms8("standard_copy", 13));
	ge805ov13298 = (GE_ms8("is", 2));
	ge805ov13323 = (GE_ms8("unique", 6));
	ge805ov13288 = (GE_ms8("feature", 7));
	ge805ov13273 = (GE_ms8("convert", 7));
	ge805ov13275 = (GE_ms8("creation", 8));
	ge805ov13310 = (GE_ms8("redefine", 8));
	ge805ov13265 = (GE_ms8("all", 3));
	ge805ov13285 = (GE_ms8("export", 6));
	ge805ov13312 = (GE_ms8("rename", 6));
	ge991ov25485 = (GE_ms8("vscn0j", 6));
	ge991ov25252 = (GE_ms8("VSCN", 4));
	ge991ov25093 = (GE_ms8("class in assembly \'$8\' cannot be overridden by class in file \'$10\'.", 67));
	ge991ov25478 = (GE_ms8("vscn0c", 6));
	ge991ov25086 = (GE_ms8("class appears in file \'$8\' and group \'$10\'.", 43));
	ge991ov25477 = (GE_ms8("vscn0b", 6));
	ge991ov25085 = (GE_ms8("class appears in file \'$8\' and assembly \'$10\'.", 46));
	ge991ov25476 = (GE_ms8("vscn0a", 6));
	ge991ov25084 = (GE_ms8("class appears in files \'$8\' and \'$10\'.", 38));
	ge991ov25481 = (GE_ms8("vscn0f", 6));
	ge991ov25089 = (GE_ms8("built-in class also appears in file \'$8\'.", 41));
	ge991ov25483 = (GE_ms8("vscn0h", 6));
	ge991ov25091 = (GE_ms8("built-in class cannot be overridden by class in file \'$8\'.", 58));
	ge805ov13169 = (GE_ms8("dispose", 7));
	ge991ov25537 = (GE_ms8("gvkfe4a", 7));
	ge991ov25285 = (GE_ms8("GVKFE-4", 7));
	ge991ov25145 = (GE_ms8("feature `$7\' in kernel class $5 is not a procedure.", 51));
	ge805ov13199 = (GE_ms8("last_result", 11));
	ge805ov13235 = (GE_ms8("set_operands", 12));
	ge805ov13240 = (GE_ms8("to_character", 12));
	ge805ov13257 = (GE_ms8("False", 5));
	ge805ov13258 = (GE_ms8("Precursor", 9));
	ge805ov13260 = (GE_ms8("True", 4));
	ge805ov13261 = (GE_ms8("Void", 4));
	ge805ov13262 = (GE_ms8("Unique", 6));
	ge805ov13269 = (GE_ms8("assign", 6));
	ge805ov13270 = (GE_ms8("attribute", 9));
	ge805ov13276 = (GE_ms8("current", 7));
	ge805ov13281 = (GE_ms8("elseif", 6));
	ge805ov13284 = (GE_ms8("expanded", 8));
	ge805ov13286 = (GE_ms8("external", 8));
	ge805ov13287 = (GE_ms8("false", 5));
	ge805ov13290 = (GE_ms8("frozen", 6));
	ge805ov13291 = (GE_ms8("if", 2));
	ge805ov13293 = (GE_ms8("indexing", 8));
	ge805ov13296 = (GE_ms8("inspect", 7));
	ge805ov13303 = (GE_ms8("obsolete", 8));
	ge805ov13311 = (GE_ms8("reference", 9));
	ge805ov13315 = (GE_ms8("result", 6));
	ge805ov13316 = (GE_ms8("retry", 5));
	ge805ov13317 = (GE_ms8("select", 6));
	ge805ov13318 = (GE_ms8("separate", 8));
	ge805ov13321 = (GE_ms8("true", 4));
	ge805ov13322 = (GE_ms8("undefine", 8));
	ge805ov13324 = (GE_ms8("until", 5));
	ge805ov13326 = (GE_ms8("void", 4));
	ge805ov13329 = (GE_ms8("->", 2));
	ge805ov13330 = (GE_ms8(":=", 2));
	ge805ov13331 = (GE_ms8("\?=", 2));
	ge805ov13332 = (GE_ms8("@", 1));
	ge805ov13333 = (GE_ms8("!", 1));
	ge805ov13334 = (GE_ms8(":", 1));
	ge805ov13335 = (GE_ms8(",", 1));
	ge805ov13338 = (GE_ms8("$", 1));
	ge805ov13339 = (GE_ms8(".", 1));
	ge805ov13340 = (GE_ms8("..", 2));
	ge805ov13341 = (GE_ms8("=", 1));
	ge805ov13342 = (GE_ms8(">=", 2));
	ge805ov13343 = (GE_ms8(">", 1));
	ge805ov13344 = (GE_ms8("<=", 2));
	ge805ov13345 = (GE_ms8("<<", 2));
	ge805ov13346 = (GE_ms8("{", 1));
	ge805ov13347 = (GE_ms8("[", 1));
	ge805ov13348 = (GE_ms8("(", 1));
	ge805ov13352 = (GE_ms8("/=", 2));
	ge805ov13355 = (GE_ms8("\?", 1));
	ge805ov13356 = (GE_ms8(">>", 2));
	ge805ov13357 = (GE_ms8("}", 1));
	ge805ov13358 = (GE_ms8("]", 1));
	ge805ov13359 = (GE_ms8(")", 1));
	ge805ov13360 = (GE_ms8(";", 1));
	ge805ov13361 = (GE_ms8("~", 1));
	ge283ov12448 = (GE_ms8("", 0));
	ge389ov26485 = (GE_ms8("se", 2));
	ge389ov26482 = (GE_ms8("ge", 2));
	ge1003ov18865 = (GE_ms8("dummy", 5));
	ge991ov25521 = (GE_ms8("vwbe0a", 6));
	ge991ov25270 = (GE_ms8("VWBE", 4));
	ge991ov25129 = (GE_ms8("boolean expression of non-BOOLEAN type \'$7\'.", 44));
	ge991ov25496 = (GE_ms8("vtcg4a", 6));
	ge991ov25257 = (GE_ms8("VTCG-4", 6));
	ge991ov25104 = (GE_ms8("base class $9 of the $7-th actual generic parameter of $10 does not make feature `$8\' available as creation procedure to class $10.", 131));
	ge991ov25497 = (GE_ms8("vtcg4b", 6));
	ge991ov25105 = (GE_ms8("the $7-th actual generic parameter of $10, which is the $9-th formal generic parameter of class $5, does not list feature `$8\' as creation procedure in its generic constraint.", 175));
	ge991ov25470 = (GE_ms8("vrle1a", 6));
	ge991ov25248 = (GE_ms8("VRLE-1", 6));
	ge991ov25078 = (GE_ms8("local variable name \'$7\' in feature `$8\' is also the final name of a feature.", 77));
	ge991ov25471 = (GE_ms8("vrle2a", 6));
	ge991ov25249 = (GE_ms8("VRLE-2", 6));
	ge991ov25079 = (GE_ms8("local variable name \'$7\' in feature `$8\' is also the name of a formal argument of this feature.", 95));
	ge991ov25467 = (GE_ms8("vreg0b", 6));
	ge991ov25075 = (GE_ms8("local variable name \'$7\' appear twice in feature `$8\'.", 54));
	ge992ov7571 = (GE_ms8("unsigned", 8));
	ge992ov7566 = (GE_ms8("tc", 2));
	ge992ov7567 = (GE_ms8("&tc", 3));
	ge992ov7539 = (GE_ms8("GE_rescue", 9));
	ge992ov7541 = (GE_ms8("GE_setjmp", 9));
	ge992ov7537 = (GE_ms8("GE_raise", 8));
	ge992ov7540 = (GE_ms8("GE_retry", 8));
	ge992ov7573 = (GE_ms8("volatile", 8));
	ge992ov7570 = (GE_ms8("#undef", 6));
	ge992ov7579 = (GE_ms8(".cpp", 4));
	ge992ov7490 = (GE_ms8("EIF_TEST", 8));
	ge992ov7508 = (GE_ms8("GE_argv", 7));
	ge991ov25322 = (GE_ms8("vdpr3b", 6));
	ge991ov25172 = (GE_ms8("VDPR-3", 6));
	ge991ov24930 = (GE_ms8("feature `$7\' is not the redefinition of an effective feature.", 61));
	ge991ov25321 = (GE_ms8("vdpr3a", 6));
	ge991ov24929 = (GE_ms8("conflict in Precursor construct between effective features `$7\' inherited from \'$8\' and `$9\' inherited from \'$10\'.", 114));
	ge991ov25320 = (GE_ms8("vdpr2a", 6));
	ge991ov25171 = (GE_ms8("VDPR-2", 6));
	ge991ov24928 = (GE_ms8("class $7 in Precursor construct is not a parent of class $6.", 60));
	ge991ov25324 = (GE_ms8("vdpr3d", 6));
	ge991ov24932 = (GE_ms8("feature `$7\' is not the redeclaration of a feature.", 51));
	ge991ov25319 = (GE_ms8("vdpr1b", 6));
	ge991ov25170 = (GE_ms8("VDPR-1", 6));
	ge991ov24927 = (GE_ms8("Precursor expression does not appear in a Routine_body.", 55));
	ge991ov25509 = (GE_ms8("vuar4a", 6));
	ge991ov25264 = (GE_ms8("VUAR-4", 6));
	ge991ov25117 = (GE_ms8("`$7\' is not the final name of a feature in class $5.", 52));
	ge991ov25522 = (GE_ms8("vweq0a", 6));
	ge991ov25271 = (GE_ms8("VWEQ", 4));
	ge991ov25130 = (GE_ms8("none of the operands of \'$7\' (of types \'$8\' and \'$9\') conforms to the other.", 76));
	ge991ov25294 = (GE_ms8("vaol1a", 6));
	ge991ov25158 = (GE_ms8("VAOL-1", 6));
	ge991ov24902 = (GE_ms8("old expression does not appear in a postcondition.", 50));
	ge991ov25448 = (GE_ms8("vpca5b", 6));
	ge991ov25236 = (GE_ms8("VPCA-5", 6));
	ge991ov25056 = (GE_ms8("the type \'$10\' specified for the $9-th actual argument of Call_agent does not conform to the corresponding formal argument (of type \'$11\') of feature `$8\'.", 155));
	ge991ov25447 = (GE_ms8("vpca5a", 6));
	ge991ov25055 = (GE_ms8("the type \'$11\' specified for the $10-th actual argument of Call_agent does not conform to the corresponding formal argument (of type \'$12\') of feature `$8\' in class $9.", 168));
	ge991ov25446 = (GE_ms8("vpca4b", 6));
	ge991ov25235 = (GE_ms8("VPCA-4", 6));
	ge991ov25054 = (GE_ms8("the $9-th actual argument (of type \'$10\') does not conform to the corresponding formal argument (of type \'$11\') of feature `$8\'.", 128));
	ge991ov25445 = (GE_ms8("vpca4a", 6));
	ge991ov25053 = (GE_ms8("the $10-th actual argument (of type \'$11\') does not conform to the corresponding formal argument (of type \'$12\') of feature `$8\' in class $9.", 141));
	ge991ov25444 = (GE_ms8("vpca3b", 6));
	ge991ov25234 = (GE_ms8("VPCA-3", 6));
	ge991ov25052 = (GE_ms8("the number of actual arguments is not the same as the number of formal arguments of feature `$8\'.", 97));
	ge991ov25443 = (GE_ms8("vpca3a", 6));
	ge991ov25051 = (GE_ms8("the number of actual arguments is not the same as the number of formal arguments of feature `$8\' in class $9.", 109));
	ge991ov25454 = (GE_ms8("vpir1f", 6));
	ge991ov25237 = (GE_ms8("VPIR-1", 6));
	ge991ov25062 = (GE_ms8("local variable name \'$7\' in inline agent is also the name of an object-test local of an enclosing feature or inline agent whose scope contains the inline agent.", 160));
	ge991ov25452 = (GE_ms8("vpir1d", 6));
	ge991ov25060 = (GE_ms8("local variable name \'$7\' in inline agent is also the name of a local variable of an enclosing feature or inline agent.", 118));
	ge991ov25451 = (GE_ms8("vpir1c", 6));
	ge991ov25059 = (GE_ms8("local variable name \'$7\' in inline agent is also the name of a formal argument of an enclosing feature or inline agent.", 119));
	ge991ov25473 = (GE_ms8("vrlv1b", 6));
	ge991ov25250 = (GE_ms8("VRLV-1", 6));
	ge991ov25081 = (GE_ms8("local variable name \'$7\' in inline agent is also the final name of a feature.", 77));
	ge991ov25475 = (GE_ms8("vrlv2b", 6));
	ge991ov25251 = (GE_ms8("VRLV-2", 6));
	ge991ov25083 = (GE_ms8("local variable name \'$7\' in inline agent is also the name of a formal argument of this agent.", 93));
	ge991ov25465 = (GE_ms8("vred0d", 6));
	ge991ov25245 = (GE_ms8("VRED", 4));
	ge991ov25073 = (GE_ms8("local variable name \'$7\' appear twice in inline agent.", 54));
	ge991ov25453 = (GE_ms8("vpir1e", 6));
	ge991ov25061 = (GE_ms8("argument name \'$7\' in inline agent is also the name of an object-test local of an enclosing feature or inline agent whose scope contains the inline agent.", 154));
	ge991ov25450 = (GE_ms8("vpir1b", 6));
	ge991ov25058 = (GE_ms8("argument name \'$7\' in inline agent is also the name of a local variable of an enclosing feature or inline agent.", 112));
	ge991ov25449 = (GE_ms8("vpir1a", 6));
	ge991ov25057 = (GE_ms8("argument name \'$7\' in inline agent is also the name of a formal argument of an enclosing feature or inline agent.", 113));
	ge991ov25469 = (GE_ms8("vrfa0b", 6));
	ge991ov25077 = (GE_ms8("argument name \'$7\' in inline agent is also the final name of a feature.", 71));
	ge991ov25464 = (GE_ms8("vred0c", 6));
	ge991ov25072 = (GE_ms8("argument name \'$7\' appear twice in inline agent.", 48));
	ge991ov25520 = (GE_ms8("vuot4b", 6));
	ge991ov25269 = (GE_ms8("VUOT-4", 6));
	ge991ov25128 = (GE_ms8("ISE does not support object-tests in check instructions.", 56));
	ge991ov25519 = (GE_ms8("vuot4a", 6));
	ge991ov25127 = (GE_ms8("ISE does not support object-tests in preconditions.", 51));
	ge991ov25518 = (GE_ms8("vuot3b", 6));
	ge991ov25268 = (GE_ms8("VUOT-3", 6));
	ge991ov25126 = (GE_ms8("object-test with local name \'$6\' has the same name as another object-test local appearing in the invariant or in the same inline agent.", 135));
	ge991ov25517 = (GE_ms8("vuot3a", 6));
	ge991ov25125 = (GE_ms8("object-test with local name \'$6\' has the same name as another object-test local appearing in the same feature `$7\' or in the same inline agent.", 143));
	ge991ov25516 = (GE_ms8("vuot1d", 6));
	ge991ov25267 = (GE_ms8("VUOT-1", 6));
	ge991ov25124 = (GE_ms8("object-test with local name \'$6\' appears in the scope of another object-test local with the same name.", 102));
	ge991ov25515 = (GE_ms8("vuot1c", 6));
	ge991ov25123 = (GE_ms8("object-test local name \'$6\' is also the name of a local variable of an enclosing feature or inline agent.", 105));
	ge991ov25514 = (GE_ms8("vuot1b", 6));
	ge991ov25122 = (GE_ms8("object-test local name \'$6\' is also the name of a formal argument of an enclosing feature or inline agent.", 106));
	ge991ov25513 = (GE_ms8("vuot1a", 6));
	ge991ov25121 = (GE_ms8("object-test local name \'$6\' is also the final name of a feature.", 64));
	ge991ov25460 = (GE_ms8("vqmc6a", 6));
	ge991ov25243 = (GE_ms8("VQMC-6", 6));
	ge991ov25068 = (GE_ms8("bit constant attribute `$7\' is not declared of Bit_type.", 56));
	ge991ov25459 = (GE_ms8("vqmc5a", 6));
	ge991ov25242 = (GE_ms8("VQMC-5", 6));
	ge991ov25067 = (GE_ms8("string constant attribute `$7\' is not declared of type STRING.", 62));
	ge991ov25458 = (GE_ms8("vqmc4a", 6));
	ge991ov25241 = (GE_ms8("VQMC-4", 6));
	ge991ov25066 = (GE_ms8("real constant attribute `$7\' is not declared of type REAL or DOUBLE.", 68));
	ge991ov25457 = (GE_ms8("vqmc3a", 6));
	ge991ov25240 = (GE_ms8("VQMC-3", 6));
	ge991ov25065 = (GE_ms8("integer constant attribute `$7\' is not declared of type INTEGER.", 64));
	ge991ov25456 = (GE_ms8("vqmc2a", 6));
	ge991ov25239 = (GE_ms8("VQMC-2", 6));
	ge991ov25064 = (GE_ms8("character constant attribute `$7\' is not declared of type CHARACTER.", 68));
	ge991ov25455 = (GE_ms8("vqmc1a", 6));
	ge991ov25238 = (GE_ms8("VQMC-1", 6));
	ge991ov25063 = (GE_ms8("boolean constant attribute `$7\' is not declared of type BOOLEAN.", 64));
	ge991ov25461 = (GE_ms8("vqui0a", 6));
	ge991ov25244 = (GE_ms8("VQUI", 4));
	ge991ov25069 = (GE_ms8("unique attribute `$7\' is not declared of type INTEGER.", 54));
	ge992ov7521 = (GE_ms8("GE_int8", 7));
	ge992ov7522 = (GE_ms8("GE_int16", 8));
	ge992ov7523 = (GE_ms8("GE_int32", 8));
	ge992ov7524 = (GE_ms8("GE_int64", 8));
	ge992ov7529 = (GE_ms8("GE_nat8", 7));
	ge992ov7530 = (GE_ms8("GE_nat16", 8));
	ge992ov7531 = (GE_ms8("GE_nat32", 8));
	ge992ov7532 = (GE_ms8("GE_nat64", 8));
	ge991ov25392 = (GE_ms8("vgcc6c", 6));
	ge991ov25000 = (GE_ms8("procedure `$8\' of class $9 is not exported for creation to class $5.", 68));
	ge991ov25395 = (GE_ms8("vgcc8a", 6));
	ge991ov25206 = (GE_ms8("VGCC-8", 6));
	ge991ov25003 = (GE_ms8("procedure `$8\' of class $9 is not listed as creation procedure of the $10-th formal generic parameter of class $5.", 114));
	ge991ov25388 = (GE_ms8("vgcc5a", 6));
	ge991ov25204 = (GE_ms8("VGCC-5", 6));
	ge991ov24996 = (GE_ms8("creation expression with no Creation_call part, but $7 has a Creators part.", 75));
	ge991ov25391 = (GE_ms8("vgcc6b", 6));
	ge991ov24999 = (GE_ms8("`$7\' is not the final name of a procedure in class $9.", 54));
	ge991ov25306 = (GE_ms8("vcfg3b", 6));
	ge991ov24914 = (GE_ms8("invalid type \'$7\' in constraint of formal generic parameter.", 60));
	ge991ov25407 = (GE_ms8("vhpr3b", 6));
	ge991ov25211 = (GE_ms8("VHPR-3", 6));
	ge991ov25015 = (GE_ms8("invalid type \'$7\' in parent clause.", 35));
	ge991ov25528 = (GE_ms8("gvhpr4a", 7));
	ge991ov25276 = (GE_ms8("GVHPR-4", 7));
	ge991ov25136 = (GE_ms8("cannot inherit from Bit_type \'$7\'.", 34));
	ge991ov25492 = (GE_ms8("vtbt0b", 6));
	ge991ov25100 = (GE_ms8("invalid type \'$7\': `$8\' is not the final name of a feature.", 59));
	ge991ov25491 = (GE_ms8("vtbt0a", 6));
	ge991ov25099 = (GE_ms8("invalid type \'$7\': `$8\' is not the final name of a constant attribute of type INTEGER.", 86));
	ge991ov25305 = (GE_ms8("vcfg3a", 6));
	ge991ov24913 = (GE_ms8("invalid type \'$7\' in constraint of formal generic parameter.", 60));
	ge991ov25406 = (GE_ms8("vhpr3a", 6));
	ge991ov25014 = (GE_ms8("invalid type \'$7\' in parent clause.", 35));
	ge991ov25488 = (GE_ms8("vtat1a", 6));
	ge991ov25253 = (GE_ms8("VTAT-1", 6));
	ge991ov25096 = (GE_ms8("invalid type \'$7\': the anchor `$8\' must be the final name of a query.", 69));
	ge991ov25489 = (GE_ms8("vtat1b", 6));
	ge991ov25097 = (GE_ms8("invalid type \'$7\': the anchor `$8\' must be the final name of a query, or an argument of routine `$9\'.", 101));
	ge991ov25307 = (GE_ms8("vcfg3c", 6));
	ge991ov24915 = (GE_ms8("invalid type \'$7\' in constraint of formal generic parameter.", 60));
	ge991ov25408 = (GE_ms8("vhpr3c", 6));
	ge991ov25016 = (GE_ms8("invalid type \'$7\' in parent clause.", 35));
	ge991ov25441 = (GE_ms8("vpca1b", 6));
	ge991ov25232 = (GE_ms8("VPCA-1", 6));
	ge991ov25049 = (GE_ms8("`$7\' is not the final name of a feature in class $8.", 52));
	ge991ov25442 = (GE_ms8("vpca2a", 6));
	ge991ov25233 = (GE_ms8("VPCA-2", 6));
	ge991ov25050 = (GE_ms8("feature `$8\' of class $9 is not exported to class $5.", 53));
	ge991ov25440 = (GE_ms8("vpca1a", 6));
	ge991ov25048 = (GE_ms8("`$7\' is not the final name of a feature in class $5.", 52));
	ge991ov25525 = (GE_ms8("vwst2a", 6));
	ge991ov25273 = (GE_ms8("VWST-2", 6));
	ge991ov25133 = (GE_ms8("feature name `$7\' appears twice in strip expression.", 52));
	ge991ov25523 = (GE_ms8("vwst1a", 6));
	ge991ov25272 = (GE_ms8("VWST-1", 6));
	ge991ov25131 = (GE_ms8("feature name `$7\' is not the final name of a feature in class $5.", 65));
	ge991ov25499 = (GE_ms8("vtct0b", 6));
	ge991ov25107 = (GE_ms8("type based on unknown class $7.", 31));
	ge991ov25311 = (GE_ms8("vcfg3h", 6));
	ge991ov24919 = (GE_ms8("constraint of formal generic parameter \'$7\' contains \'$8\' itself.", 65));
	ge991ov25309 = (GE_ms8("vcfg3e", 6));
	ge991ov24917 = (GE_ms8("constraint of formal generic parameter \'$7\' is another formal generic parameter \'$8\'.", 85));
	ge991ov25308 = (GE_ms8("vcfg3d", 6));
	ge991ov24916 = (GE_ms8("constraint of formal generic parameter \'$7\' is \'$8\' itself.", 59));
	ge991ov25495 = (GE_ms8("vtcg3a", 6));
	ge991ov25256 = (GE_ms8("VTCG-3", 6));
	ge991ov25103 = (GE_ms8("actual generic parameter \'$7\' in type \'$9\' does not conform to constraint \'$8\'.", 79));
	ge991ov25539 = (GE_ms8("gvtcg5a", 7));
	ge991ov25287 = (GE_ms8("GVTCG-5", 7));
	ge991ov25147 = (GE_ms8("actual generic parameter \'$7\' in type \'$8\' is not a reference type but the corresponding formal parameter is marked as reference.", 129));
	ge991ov25540 = (GE_ms8("gvtcg5b", 7));
	ge991ov25148 = (GE_ms8("actual generic parameter \'$7\' in type \'$8\' is not expanded type but the corresponding formal parameter is marked as expanded.", 125));
	ge991ov25503 = (GE_ms8("vtug2a", 6));
	ge991ov25261 = (GE_ms8("VTUG-2", 6));
	ge991ov25111 = (GE_ms8("type \'$7\' has wrong number of actual generic parameters.", 56));
	ge991ov25502 = (GE_ms8("vtug1a", 6));
	ge991ov25260 = (GE_ms8("VTUG-1", 6));
	ge991ov25110 = (GE_ms8("type \'$7\' has actual generic parameters but class $8 is not generic.", 68));
	ge991ov25529 = (GE_ms8("gvhpr5a", 7));
	ge991ov25277 = (GE_ms8("GVHPR-5", 7));
	ge991ov25137 = (GE_ms8("cannot inherit from Tuple_type \'$7\'.", 36));
	ge982ov31423 = (GE_ms8("gcaaa", 5));
	ge982ov31419 = (GE_ms8("GCAAA", 5));
	ge982ov31415 = (GE_ms8("[$1] cluster $2: cannot read cluster directory \'$3\'.", 52));
	ge738ov12525 = (GE_ms8(".", 1));
	ge738ov12526 = (GE_ms8("..", 2));
	ge387ov31164 = (GE_ms8("", 0));
	ge991ov25526 = (GE_ms8("vxrt0a", 6));
	ge991ov25274 = (GE_ms8("VXRT", 4));
	ge991ov25134 = (GE_ms8("Retry instruction does not appear in a Rescue clause.", 53));
	ge992ov7545 = (GE_ms8("goto", 4));
	ge991ov25299 = (GE_ms8("vbac2a", 6));
	ge991ov25162 = (GE_ms8("VBAC-2", 6));
	ge991ov24907 = (GE_ms8("query `$7\' in class $8 has no assigner command.", 47));
	ge991ov25298 = (GE_ms8("vbac1a", 6));
	ge991ov25161 = (GE_ms8("VBAC-1", 6));
	ge991ov24906 = (GE_ms8("the source of the assigner call (of type \'$7\') does not conform nor convert to its target (of type \'$8\').", 105));
	ge991ov25416 = (GE_ms8("vjar0a", 6));
	ge991ov25216 = (GE_ms8("VJAR", 4));
	ge991ov25024 = (GE_ms8("the source of the assignment (of type \'$7\') does not conform nor convert to its target entity (of type \'$8\').", 109));
	ge991ov25354 = (GE_ms8("veen0a", 6));
	ge991ov25189 = (GE_ms8("VEEN", 4));
	ge991ov24962 = (GE_ms8("`$7\' appears in feature `$8\', but it is not the final name of a feature in class $6 nor the name of a local variable or formal argument of feature `$8\'.", 152));
	ge991ov25355 = (GE_ms8("veen0b", 6));
	ge991ov24963 = (GE_ms8("`$7\' appears in an inline agent, but it is not the final name of a feature in class $6 nor the name of a local variable or formal argument of this inline agent.", 160));
	ge991ov25418 = (GE_ms8("vjaw0b", 6));
	ge991ov25217 = (GE_ms8("VJAW", 4));
	ge991ov25026 = (GE_ms8("`$7\' is the name of a formal argument of feature `$8\'. A Writable is either a local variable (including Result) or an attribute.", 128));
	ge991ov25419 = (GE_ms8("vjaw0c", 6));
	ge991ov25027 = (GE_ms8("`$7\' is the name of a formal argument of an inline agent. A Writable is either a local variable (including Result) or an attribute.", 131));
	ge991ov25417 = (GE_ms8("vjaw0a", 6));
	ge991ov25025 = (GE_ms8("feature `$7\' is not an attribute. A Writable is either a local variable (including Result) or an attribute.", 107));
	ge991ov25420 = (GE_ms8("vjrv0a", 6));
	ge991ov25218 = (GE_ms8("VJRV", 4));
	ge991ov25028 = (GE_ms8("the type \'$7\' of the target entity of the assignment attempt is not a reference type.", 85));
	ge991ov25439 = (GE_ms8("vomb2a", 6));
	ge991ov25231 = (GE_ms8("VOMB-2", 6));
	ge991ov25047 = (GE_ms8("inspect constant of type \'$7\' different from type \'$8\' of inspect expression.", 77));
	ge991ov25438 = (GE_ms8("vomb1a", 6));
	ge991ov25230 = (GE_ms8("VOMB-1", 6));
	ge991ov25046 = (GE_ms8("inspect expression of type \'$7\' different from INTEGER or CHARACTER.", 68));
	ge991ov25297 = (GE_ms8("vave0a", 6));
	ge991ov25160 = (GE_ms8("VAVE", 4));
	ge991ov24905 = (GE_ms8("loop variant expression of non-INTEGER type \'$7\'.", 49));
	ge992ov7574 = (GE_ms8("while", 5));
	ge991ov25394 = (GE_ms8("vgcc6e", 6));
	ge991ov25002 = (GE_ms8("procedure `$8\' of class $9 is not exported for creation to class $5.", 68));
	ge991ov25396 = (GE_ms8("vgcc8b", 6));
	ge991ov25004 = (GE_ms8("procedure `$8\' of class $9 is not listed as creation procedure of the $10-th formal generic parameter of class $5.", 114));
	ge991ov25389 = (GE_ms8("vgcc5b", 6));
	ge991ov24997 = (GE_ms8("creation instruction with no Creation_call part, but $7 has a Creators part.", 76));
	ge991ov25387 = (GE_ms8("vgcc3a", 6));
	ge991ov25203 = (GE_ms8("VGCC-3", 6));
	ge991ov24995 = (GE_ms8("explicit creation type \'$7\' does not conform to target entity type \'$8\'.", 72));
	ge991ov25393 = (GE_ms8("vgcc6d", 6));
	ge991ov25001 = (GE_ms8("`$7\' is not the final name of a procedure in class $9.", 54));
	ge991ov25318 = (GE_ms8("vdpr1a", 6));
	ge991ov24926 = (GE_ms8("Precursor instruction does not appear in a Routine_body.", 56));
	ge991ov25421 = (GE_ms8("vkcn1a", 6));
	ge991ov25029 = (GE_ms8("query `$8\' of class $9 appears in a call instruction.", 53));
	ge1284ov10882 = (GE_ms8("root", 4));
	ge1265ov23183 = (GE_ms8("Namespace declared twice", 24));
	ge1265ov23182 = (GE_ms8("Undeclared namespace error", 26));
	ge423ov9740 = (GE_ms8("\n", 1));
	ge308ov9740 = (GE_ms8("\n", 1));
	ge299ov9740 = (GE_ms8("\n", 1));
	ge55ov4379 = (GE_ms8("\n", 1));
	ge55ov4380 = (GE_ms8("\n", 1));
	ge55ov4381 = (GE_ms8("\nOptions:\n", 10));
	ge809ov25945 = (GE_ms8("alias \"", 7));
	ge805ov13424 = (GE_ms8("alias \"[]\"", 10));
	ge805ov13405 = (GE_ms8("alias \"and\"", 11));
	ge805ov13421 = (GE_ms8("alias \"and then\"", 16));
	ge805ov13409 = (GE_ms8("alias \"//\"", 10));
	ge805ov13410 = (GE_ms8("alias \"/\"", 9));
	ge805ov13411 = (GE_ms8("alias \">=\"", 10));
	ge805ov13412 = (GE_ms8("alias \">\"", 9));
	ge805ov13406 = (GE_ms8("alias \"implies\"", 15));
	ge805ov13413 = (GE_ms8("alias \"<=\"", 10));
	ge805ov13414 = (GE_ms8("alias \"<\"", 9));
	ge805ov13415 = (GE_ms8("alias \"-\"", 9));
	ge805ov13416 = (GE_ms8("alias \"\\\\\"", 10));
	ge805ov13407 = (GE_ms8("alias \"or\"", 10));
	ge805ov13422 = (GE_ms8("alias \"or else\"", 15));
	ge805ov13417 = (GE_ms8("alias \"+\"", 9));
	ge805ov13418 = (GE_ms8("alias \"^\"", 9));
	ge805ov13419 = (GE_ms8("alias \"*\"", 9));
	ge805ov13408 = (GE_ms8("alias \"xor\"", 11));
	ge805ov13420 = (GE_ms8("alias \"..\"", 10));
	ge805ov13423 = (GE_ms8("alias \"not\"", 11));
	ge805ov13363 = (GE_ms8("***unknown_name***", 18));
	ge1332ov25793 = (GE_ms8("us-ascii", 8));
	ge1332ov25795 = (GE_ms8("utf-8", 5));
	ge805ov13401 = (GE_ms8("infix \"or else\"", 15));
	ge805ov13400 = (GE_ms8("infix \"and then\"", 16));
	ge805ov13388 = (GE_ms8("infix \"//\"", 10));
	ge805ov13389 = (GE_ms8("infix \"/\"", 9));
	ge805ov13390 = (GE_ms8("infix \">=\"", 10));
	ge805ov13391 = (GE_ms8("infix \">\"", 9));
	ge805ov13392 = (GE_ms8("infix \"<=\"", 10));
	ge805ov13393 = (GE_ms8("infix \"<\"", 9));
	ge805ov13394 = (GE_ms8("infix \"-\"", 9));
	ge805ov13395 = (GE_ms8("infix \"\\\\\"", 10));
	ge805ov13396 = (GE_ms8("infix \"+\"", 9));
	ge805ov13397 = (GE_ms8("infix \"^\"", 9));
	ge805ov13398 = (GE_ms8("infix \"*\"", 9));
	ge805ov13399 = (GE_ms8("infix \"..\"", 10));
	ge805ov13403 = (GE_ms8("prefix \"-\"", 10));
	ge805ov13404 = (GE_ms8("prefix \"+\"", 10));
	ge805ov13384 = (GE_ms8("infix \"and\"", 11));
	ge805ov13385 = (GE_ms8("infix \"implies\"", 15));
	ge805ov13386 = (GE_ms8("infix \"or\"", 10));
	ge805ov13387 = (GE_ms8("infix \"xor\"", 11));
	ge805ov13402 = (GE_ms8("prefix \"not\"", 12));
	ge828ov26607 = (GE_ms8("infix \"", 7));
	ge828ov26606 = (GE_ms8("prefix \"", 8));
	ge845ov27916 = (GE_ms8("prefix \"", 8));
	ge834ov25856 = (GE_ms8("infix \"", 7));
	ge1058ov4146 = (GE_ms8("found invalid expression \'$1\' at $2", 35));
	ge226ov4146 = (GE_ms8("$0: too many (i.e. $1) nested include files", 43));
	ge225ov4146 = (GE_ms8("Syntax error in \"$1\" at line $2", 31));
	ge1052ov4146 = (GE_ms8("attribute \'$2\' of element <$1> at $4 is obsolete, use element $3 instead", 72));
	ge1068ov4146 = (GE_ms8("option name \'$1\' in option-element is unknown $2", 48));
	ge1065ov4146 = (GE_ms8("<exclude> at $1 is obsolete, use \'if\'/\'unless\' attributes instead", 65));
	ge1064ov4146 = (GE_ms8("<cluster> at $1 is obsolete. Specify options, clusters and mounts directly under <system> instead", 97));
	ge1060ov4146 = (GE_ms8("element \'$1\' must have child-element \'$2\' $3", 44));
	ge1067ov4146 = (GE_ms8("found unknown element \'$2\' in element \'$1\' $3", 45));
	ge1059ov4146 = (GE_ms8("element \'$1\' must have attribute \'$2\' $3", 40));
	ge1071ov4146 = (GE_ms8("Xace document must have a \'$1\' root-element $2", 46));
	ge1055ov4146 = (GE_ms8("element <$1> at $3 is obsolete, use element $2 instead", 54));
	ge1066ov4146 = (GE_ms8("attribute \'$2\' in element \'$1\' should have a positive integer value $4", 70));
	ge1070ov4146 = (GE_ms8("attribute \'$2\' in element \'$1\' should have one of the following values: $4 $5", 77));
	ge1062ov4146 = (GE_ms8("attribute \'$2\' in element \'$1\' should have a non-empty value $3", 63));
	ge1053ov4146 = (GE_ms8("attribute \'$2\' in element \'$1\' should have a boolean value $4", 61));
	ge1061ov4146 = (GE_ms8("Library \'$1\' mounted with incompatible prefixes \'$2\' and \'$3\' in $4 and $5", 74));
	ge220ov4146 = (GE_ms8("$0: cannot write to \'$1\'", 24));
	ge223ov4146 = (GE_ms8("$1", 2));
	ge230ov4146 = (GE_ms8("$0 version $1", 13));
	ge219ov4146 = (GE_ms8("$0: cannot read \'$1\'", 20));
	ge417ov26392 = (GE_ms8("", 0));
	ge403ov1834 = (GE_ms8("", 0));
	geic2 = (GE_ms8(" (label on item #", 17));
	geic3 = (GE_ms8(" with a manifest tuple argument", 31));
	geic4 = (GE_ms8(" of type ", 9));
}

EIF_TYPE GE_types[1641] = {
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
{0, 85, EIF_TRUE, 0},
{0, 86, EIF_FALSE, 0},
{0, 87, EIF_FALSE, 0},
{0, 88, EIF_FALSE, 0},
{0, 89, EIF_FALSE, 0},
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
{0, 117, EIF_TRUE, 0},
{0, 118, EIF_FALSE, 0},
{0, 119, EIF_FALSE, 0},
{0, 120, EIF_FALSE, 0},
{0, 121, EIF_FALSE, 0},
{0, 122, EIF_FALSE, 0},
{0, 123, EIF_FALSE, 0},
{0, 124, EIF_FALSE, 0},
{0, 125, EIF_FALSE, 0},
{0, 126, EIF_FALSE, 0},
{0, 127, EIF_FALSE, 0},
{0, 128, EIF_FALSE, 0},
{0, 129, EIF_FALSE, 0},
{0, 130, EIF_FALSE, 0},
{0, 131, EIF_TRUE, 0},
{0, 132, EIF_FALSE, 0},
{0, 133, EIF_TRUE, 0},
{0, 134, EIF_FALSE, 0},
{0, 135, EIF_FALSE, 0},
{0, 136, EIF_FALSE, 0},
{0, 137, EIF_FALSE, 0},
{0, 138, EIF_FALSE, 0},
{0, 139, EIF_FALSE, 0},
{0, 140, EIF_TRUE, 0},
{0, 141, EIF_TRUE, 0},
{0, 142, EIF_FALSE, 0},
{0, 143, EIF_TRUE, 0},
{0, 144, EIF_TRUE, 0},
{0, 145, EIF_FALSE, 0},
{0, 146, EIF_FALSE, 0},
{0, 147, EIF_FALSE, 0},
{0, 148, EIF_TRUE, 0},
{0, 149, EIF_FALSE, 0},
{0, 150, EIF_FALSE, 0},
{0, 151, EIF_FALSE, 0},
{0, 152, EIF_FALSE, 0},
{0, 153, EIF_FALSE, 0},
{0, 154, EIF_FALSE, 0},
{0, 155, EIF_FALSE, 0},
{0, 156, EIF_FALSE, 0},
{0, 157, EIF_FALSE, 0},
{0, 158, EIF_FALSE, 0},
{0, 159, EIF_FALSE, 0},
{0, 160, EIF_FALSE, 0},
{0, 161, EIF_FALSE, 0},
{0, 162, EIF_FALSE, 0},
{0, 163, EIF_FALSE, 0},
{0, 164, EIF_FALSE, 0},
{0, 165, EIF_FALSE, 0},
{0, 166, EIF_FALSE, 0},
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
{0, 224, EIF_FALSE, &T224f21},
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
{0, 244, EIF_FALSE, 0},
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
{0, 403, EIF_TRUE, 0},
{0, 404, EIF_FALSE, 0},
{0, 405, EIF_FALSE, 0},
{0, 406, EIF_TRUE, 0},
{0, 407, EIF_FALSE, 0},
{0, 408, EIF_FALSE, 0},
{0, 409, EIF_FALSE, 0},
{0, 410, EIF_FALSE, 0},
{0, 411, EIF_FALSE, 0},
{0, 412, EIF_FALSE, 0},
{0, 413, EIF_FALSE, 0},
{0, 414, EIF_TRUE, 0},
{0, 415, EIF_FALSE, 0},
{0, 416, EIF_FALSE, 0},
{0, 417, EIF_FALSE, 0},
{0, 418, EIF_FALSE, 0},
{0, 419, EIF_FALSE, 0},
{0, 420, EIF_FALSE, 0},
{0, 421, EIF_FALSE, 0},
{0, 422, EIF_TRUE, 0},
{0, 423, EIF_FALSE, 0},
{0, 424, EIF_FALSE, 0},
{0, 425, EIF_FALSE, 0},
{0, 426, EIF_FALSE, 0},
{0, 427, EIF_FALSE, 0},
{0, 428, EIF_FALSE, 0},
{0, 429, EIF_FALSE, 0},
{0, 430, EIF_FALSE, 0},
{0, 431, EIF_FALSE, 0},
{0, 432, EIF_FALSE, 0},
{0, 433, EIF_FALSE, 0},
{0, 434, EIF_FALSE, 0},
{0, 435, EIF_FALSE, 0},
{0, 436, EIF_FALSE, 0},
{0, 437, EIF_FALSE, 0},
{0, 438, EIF_FALSE, 0},
{0, 439, EIF_FALSE, 0},
{0, 440, EIF_TRUE, 0},
{0, 441, EIF_FALSE, 0},
{0, 442, EIF_TRUE, 0},
{0, 443, EIF_FALSE, 0},
{0, 444, EIF_TRUE, 0},
{0, 445, EIF_TRUE, 0},
{0, 446, EIF_FALSE, 0},
{0, 447, EIF_TRUE, 0},
{0, 448, EIF_FALSE, 0},
{0, 449, EIF_TRUE, 0},
{0, 450, EIF_FALSE, 0},
{0, 451, EIF_FALSE, 0},
{0, 452, EIF_TRUE, 0},
{0, 453, EIF_FALSE, 0},
{0, 454, EIF_TRUE, 0},
{0, 455, EIF_FALSE, 0},
{0, 456, EIF_FALSE, 0},
{0, 457, EIF_TRUE, 0},
{0, 458, EIF_FALSE, 0},
{0, 459, EIF_FALSE, 0},
{0, 460, EIF_FALSE, 0},
{0, 461, EIF_FALSE, 0},
{0, 462, EIF_FALSE, 0},
{0, 463, EIF_FALSE, 0},
{0, 464, EIF_FALSE, 0},
{0, 465, EIF_FALSE, 0},
{0, 466, EIF_FALSE, 0},
{0, 467, EIF_FALSE, 0},
{0, 468, EIF_FALSE, 0},
{0, 469, EIF_FALSE, 0},
{0, 470, EIF_FALSE, 0},
{0, 471, EIF_FALSE, 0},
{0, 472, EIF_FALSE, 0},
{0, 473, EIF_FALSE, 0},
{0, 474, EIF_FALSE, 0},
{0, 475, EIF_FALSE, 0},
{0, 476, EIF_FALSE, 0},
{0, 477, EIF_FALSE, 0},
{0, 478, EIF_FALSE, 0},
{0, 479, EIF_FALSE, 0},
{0, 480, EIF_FALSE, 0},
{0, 481, EIF_FALSE, 0},
{0, 482, EIF_FALSE, 0},
{0, 483, EIF_FALSE, 0},
{0, 484, EIF_FALSE, 0},
{0, 485, EIF_FALSE, 0},
{0, 486, EIF_FALSE, 0},
{0, 487, EIF_FALSE, 0},
{0, 488, EIF_FALSE, 0},
{0, 489, EIF_FALSE, 0},
{0, 490, EIF_TRUE, 0},
{0, 491, EIF_TRUE, 0},
{0, 492, EIF_FALSE, 0},
{0, 493, EIF_FALSE, 0},
{0, 494, EIF_TRUE, 0},
{0, 495, EIF_FALSE, 0},
{0, 496, EIF_FALSE, 0},
{0, 497, EIF_FALSE, 0},
{0, 498, EIF_FALSE, 0},
{0, 499, EIF_FALSE, &T499f8},
{0, 500, EIF_FALSE, 0},
{0, 501, EIF_FALSE, 0},
{0, 502, EIF_FALSE, 0},
{0, 503, EIF_FALSE, 0},
{0, 504, EIF_TRUE, 0},
{0, 505, EIF_FALSE, 0},
{0, 506, EIF_FALSE, 0},
{0, 507, EIF_FALSE, 0},
{0, 508, EIF_FALSE, 0},
{0, 509, EIF_TRUE, 0},
{0, 510, EIF_FALSE, 0},
{0, 511, EIF_FALSE, 0},
{0, 512, EIF_FALSE, 0},
{0, 513, EIF_FALSE, 0},
{0, 514, EIF_TRUE, 0},
{0, 515, EIF_FALSE, 0},
{0, 516, EIF_FALSE, 0},
{0, 517, EIF_FALSE, 0},
{0, 518, EIF_FALSE, 0},
{0, 519, EIF_FALSE, 0},
{0, 520, EIF_FALSE, 0},
{0, 521, EIF_TRUE, 0},
{0, 522, EIF_FALSE, 0},
{0, 523, EIF_FALSE, 0},
{0, 524, EIF_FALSE, 0},
{0, 525, EIF_FALSE, 0},
{0, 526, EIF_FALSE, 0},
{0, 527, EIF_FALSE, 0},
{0, 528, EIF_TRUE, 0},
{0, 529, EIF_FALSE, 0},
{0, 530, EIF_FALSE, 0},
{0, 531, EIF_TRUE, 0},
{0, 532, EIF_FALSE, 0},
{0, 533, EIF_FALSE, 0},
{0, 534, EIF_TRUE, 0},
{0, 535, EIF_FALSE, 0},
{0, 536, EIF_FALSE, 0},
{0, 537, EIF_TRUE, 0},
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
{0, 548, EIF_TRUE, 0},
{0, 549, EIF_FALSE, 0},
{0, 550, EIF_FALSE, 0},
{0, 551, EIF_FALSE, 0},
{0, 552, EIF_FALSE, 0},
{0, 553, EIF_FALSE, 0},
{0, 554, EIF_TRUE, 0},
{0, 555, EIF_FALSE, 0},
{0, 556, EIF_TRUE, 0},
{0, 557, EIF_FALSE, 0},
{0, 558, EIF_FALSE, 0},
{0, 559, EIF_FALSE, 0},
{0, 560, EIF_FALSE, 0},
{0, 561, EIF_FALSE, 0},
{0, 562, EIF_FALSE, 0},
{0, 563, EIF_FALSE, 0},
{0, 564, EIF_FALSE, 0},
{0, 565, EIF_FALSE, 0},
{0, 566, EIF_FALSE, 0},
{0, 567, EIF_FALSE, 0},
{0, 568, EIF_FALSE, 0},
{0, 569, EIF_FALSE, 0},
{0, 570, EIF_FALSE, 0},
{0, 571, EIF_FALSE, 0},
{0, 572, EIF_TRUE, 0},
{0, 573, EIF_FALSE, 0},
{0, 574, EIF_FALSE, 0},
{0, 575, EIF_FALSE, 0},
{0, 576, EIF_FALSE, 0},
{0, 577, EIF_FALSE, 0},
{0, 578, EIF_FALSE, 0},
{0, 579, EIF_TRUE, 0},
{0, 580, EIF_FALSE, 0},
{0, 581, EIF_FALSE, 0},
{0, 582, EIF_TRUE, 0},
{0, 583, EIF_FALSE, 0},
{0, 584, EIF_FALSE, 0},
{0, 585, EIF_TRUE, 0},
{0, 586, EIF_FALSE, 0},
{0, 587, EIF_FALSE, 0},
{0, 588, EIF_TRUE, 0},
{0, 589, EIF_FALSE, 0},
{0, 590, EIF_FALSE, 0},
{0, 591, EIF_TRUE, 0},
{0, 592, EIF_FALSE, 0},
{0, 593, EIF_FALSE, 0},
{0, 594, EIF_TRUE, 0},
{0, 595, EIF_FALSE, 0},
{0, 596, EIF_FALSE, 0},
{0, 597, EIF_TRUE, 0},
{0, 598, EIF_FALSE, 0},
{0, 599, EIF_FALSE, 0},
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
{0, 615, EIF_FALSE, 0},
{0, 616, EIF_FALSE, 0},
{0, 617, EIF_FALSE, 0},
{0, 618, EIF_FALSE, 0},
{0, 619, EIF_FALSE, 0},
{0, 620, EIF_FALSE, 0},
{0, 621, EIF_FALSE, 0},
{0, 622, EIF_FALSE, 0},
{0, 623, EIF_FALSE, 0},
{0, 624, EIF_FALSE, 0},
{0, 625, EIF_FALSE, 0},
{0, 626, EIF_FALSE, 0},
{0, 627, EIF_FALSE, 0},
{0, 628, EIF_FALSE, 0},
{0, 629, EIF_FALSE, 0},
{0, 630, EIF_FALSE, 0},
{0, 631, EIF_FALSE, 0},
{0, 632, EIF_FALSE, 0},
{0, 633, EIF_FALSE, 0},
{0, 634, EIF_FALSE, 0},
{0, 635, EIF_FALSE, 0},
{0, 636, EIF_FALSE, 0},
{0, 637, EIF_FALSE, 0},
{0, 638, EIF_FALSE, 0},
{0, 639, EIF_FALSE, 0},
{0, 640, EIF_FALSE, 0},
{0, 641, EIF_FALSE, 0},
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
{0, 656, EIF_TRUE, 0},
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
{0, 683, EIF_TRUE, 0},
{0, 684, EIF_FALSE, 0},
{0, 685, EIF_FALSE, 0},
{0, 686, EIF_TRUE, 0},
{0, 687, EIF_FALSE, 0},
{0, 688, EIF_FALSE, 0},
{0, 689, EIF_TRUE, 0},
{0, 690, EIF_FALSE, 0},
{0, 691, EIF_TRUE, 0},
{0, 692, EIF_FALSE, 0},
{0, 693, EIF_TRUE, 0},
{0, 694, EIF_FALSE, 0},
{0, 695, EIF_FALSE, 0},
{0, 696, EIF_TRUE, 0},
{0, 697, EIF_FALSE, 0},
{0, 698, EIF_FALSE, 0},
{0, 699, EIF_TRUE, 0},
{0, 700, EIF_FALSE, 0},
{0, 701, EIF_FALSE, 0},
{0, 702, EIF_TRUE, 0},
{0, 703, EIF_FALSE, 0},
{0, 704, EIF_FALSE, 0},
{0, 705, EIF_TRUE, 0},
{0, 706, EIF_FALSE, 0},
{0, 707, EIF_TRUE, 0},
{0, 708, EIF_FALSE, 0},
{0, 709, EIF_FALSE, 0},
{0, 710, EIF_TRUE, 0},
{0, 711, EIF_FALSE, 0},
{0, 712, EIF_FALSE, 0},
{0, 713, EIF_TRUE, 0},
{0, 714, EIF_FALSE, 0},
{0, 715, EIF_FALSE, 0},
{0, 716, EIF_TRUE, 0},
{0, 717, EIF_FALSE, 0},
{0, 718, EIF_TRUE, 0},
{0, 719, EIF_FALSE, 0},
{0, 720, EIF_FALSE, 0},
{0, 721, EIF_TRUE, 0},
{0, 722, EIF_FALSE, 0},
{0, 723, EIF_TRUE, 0},
{0, 724, EIF_FALSE, 0},
{0, 725, EIF_FALSE, 0},
{0, 726, EIF_TRUE, 0},
{0, 727, EIF_FALSE, 0},
{0, 728, EIF_FALSE, 0},
{0, 729, EIF_TRUE, 0},
{0, 730, EIF_FALSE, 0},
{0, 731, EIF_FALSE, 0},
{0, 732, EIF_TRUE, 0},
{0, 733, EIF_FALSE, 0},
{0, 734, EIF_FALSE, 0},
{0, 735, EIF_TRUE, 0},
{0, 736, EIF_FALSE, 0},
{0, 737, EIF_TRUE, 0},
{0, 738, EIF_FALSE, 0},
{0, 739, EIF_FALSE, 0},
{0, 740, EIF_TRUE, 0},
{0, 741, EIF_FALSE, 0},
{0, 742, EIF_FALSE, 0},
{0, 743, EIF_FALSE, 0},
{0, 744, EIF_FALSE, 0},
{0, 745, EIF_FALSE, 0},
{0, 746, EIF_FALSE, 0},
{0, 747, EIF_FALSE, 0},
{0, 748, EIF_FALSE, 0},
{0, 749, EIF_FALSE, 0},
{0, 750, EIF_FALSE, 0},
{0, 751, EIF_FALSE, 0},
{0, 752, EIF_FALSE, 0},
{0, 753, EIF_FALSE, 0},
{0, 754, EIF_FALSE, 0},
{0, 755, EIF_FALSE, 0},
{0, 756, EIF_FALSE, 0},
{0, 757, EIF_FALSE, 0},
{0, 758, EIF_TRUE, 0},
{0, 759, EIF_FALSE, 0},
{0, 760, EIF_TRUE, 0},
{0, 761, EIF_TRUE, 0},
{0, 762, EIF_TRUE, 0},
{0, 763, EIF_FALSE, 0},
{0, 764, EIF_TRUE, 0},
{0, 765, EIF_FALSE, 0},
{0, 766, EIF_TRUE, 0},
{0, 767, EIF_FALSE, 0},
{0, 768, EIF_TRUE, 0},
{0, 769, EIF_FALSE, 0},
{0, 770, EIF_FALSE, 0},
{0, 771, EIF_TRUE, 0},
{0, 772, EIF_FALSE, 0},
{0, 773, EIF_TRUE, 0},
{0, 774, EIF_FALSE, 0},
{0, 775, EIF_FALSE, 0},
{0, 776, EIF_FALSE, 0},
{0, 777, EIF_FALSE, 0},
{0, 778, EIF_FALSE, 0},
{0, 779, EIF_TRUE, 0},
{0, 780, EIF_FALSE, 0},
{0, 781, EIF_FALSE, 0},
{0, 782, EIF_TRUE, 0},
{0, 783, EIF_FALSE, 0},
{0, 784, EIF_FALSE, 0},
{0, 785, EIF_TRUE, 0},
{0, 786, EIF_FALSE, 0},
{0, 787, EIF_TRUE, 0},
{0, 788, EIF_FALSE, 0},
{0, 789, EIF_TRUE, 0},
{0, 790, EIF_FALSE, 0},
{0, 791, EIF_FALSE, 0},
{0, 792, EIF_TRUE, 0},
{0, 793, EIF_FALSE, 0},
{0, 794, EIF_TRUE, 0},
{0, 795, EIF_FALSE, 0},
{0, 796, EIF_FALSE, 0},
{0, 797, EIF_FALSE, 0},
{0, 798, EIF_TRUE, 0},
{0, 799, EIF_FALSE, 0},
{0, 800, EIF_FALSE, 0},
{0, 801, EIF_TRUE, 0},
{0, 802, EIF_FALSE, 0},
{0, 803, EIF_FALSE, 0},
{0, 804, EIF_TRUE, 0},
{0, 805, EIF_FALSE, 0},
{0, 806, EIF_TRUE, 0},
{0, 807, EIF_FALSE, 0},
{0, 808, EIF_FALSE, 0},
{0, 809, EIF_FALSE, 0},
{0, 810, EIF_TRUE, 0},
{0, 811, EIF_FALSE, 0},
{0, 812, EIF_FALSE, 0},
{0, 813, EIF_FALSE, 0},
{0, 814, EIF_FALSE, 0},
{0, 815, EIF_TRUE, 0},
{0, 816, EIF_FALSE, 0},
{0, 817, EIF_FALSE, 0},
{0, 818, EIF_FALSE, 0},
{0, 819, EIF_FALSE, 0},
{0, 820, EIF_FALSE, 0},
{0, 821, EIF_TRUE, 0},
{0, 822, EIF_TRUE, 0},
{0, 823, EIF_FALSE, 0},
{0, 824, EIF_TRUE, 0},
{0, 825, EIF_TRUE, 0},
{0, 826, EIF_TRUE, 0},
{0, 827, EIF_TRUE, 0},
{0, 828, EIF_FALSE, 0},
{0, 829, EIF_FALSE, 0},
{0, 830, EIF_FALSE, 0},
{0, 831, EIF_TRUE, 0},
{0, 832, EIF_TRUE, 0},
{0, 833, EIF_TRUE, 0},
{0, 834, EIF_FALSE, 0},
{0, 835, EIF_FALSE, 0},
{0, 836, EIF_FALSE, 0},
{0, 837, EIF_FALSE, 0},
{0, 838, EIF_TRUE, 0},
{0, 839, EIF_TRUE, 0},
{0, 840, EIF_FALSE, 0},
{0, 841, EIF_FALSE, 0},
{0, 842, EIF_FALSE, 0},
{0, 843, EIF_TRUE, 0},
{0, 844, EIF_FALSE, 0},
{0, 845, EIF_FALSE, 0},
{0, 846, EIF_FALSE, 0},
{0, 847, EIF_TRUE, 0},
{0, 848, EIF_FALSE, 0},
{0, 849, EIF_FALSE, 0},
{0, 850, EIF_FALSE, 0},
{0, 851, EIF_FALSE, 0},
{0, 852, EIF_FALSE, 0},
{0, 853, EIF_TRUE, 0},
{0, 854, EIF_FALSE, 0},
{0, 855, EIF_FALSE, 0},
{0, 856, EIF_FALSE, 0},
{0, 857, EIF_TRUE, 0},
{0, 858, EIF_FALSE, 0},
{0, 859, EIF_TRUE, 0},
{0, 860, EIF_FALSE, 0},
{0, 861, EIF_FALSE, 0},
{0, 862, EIF_TRUE, 0},
{0, 863, EIF_FALSE, 0},
{0, 864, EIF_FALSE, 0},
{0, 865, EIF_FALSE, 0},
{0, 866, EIF_FALSE, 0},
{0, 867, EIF_FALSE, 0},
{0, 868, EIF_TRUE, 0},
{0, 869, EIF_FALSE, 0},
{0, 870, EIF_FALSE, 0},
{0, 871, EIF_TRUE, 0},
{0, 872, EIF_FALSE, 0},
{0, 873, EIF_FALSE, 0},
{0, 874, EIF_FALSE, 0},
{0, 875, EIF_TRUE, 0},
{0, 876, EIF_TRUE, 0},
{0, 877, EIF_TRUE, 0},
{0, 878, EIF_TRUE, 0},
{0, 879, EIF_TRUE, 0},
{0, 880, EIF_FALSE, 0},
{0, 881, EIF_TRUE, 0},
{0, 882, EIF_FALSE, 0},
{0, 883, EIF_FALSE, 0},
{0, 884, EIF_FALSE, 0},
{0, 885, EIF_FALSE, 0},
{0, 886, EIF_TRUE, 0},
{0, 887, EIF_FALSE, 0},
{0, 888, EIF_FALSE, 0},
{0, 889, EIF_FALSE, 0},
{0, 890, EIF_FALSE, 0},
{0, 891, EIF_FALSE, 0},
{0, 892, EIF_FALSE, 0},
{0, 893, EIF_FALSE, 0},
{0, 894, EIF_FALSE, 0},
{0, 895, EIF_FALSE, 0},
{0, 896, EIF_FALSE, 0},
{0, 897, EIF_TRUE, 0},
{0, 898, EIF_FALSE, 0},
{0, 899, EIF_FALSE, 0},
{0, 900, EIF_FALSE, 0},
{0, 901, EIF_FALSE, 0},
{0, 902, EIF_FALSE, 0},
{0, 903, EIF_TRUE, 0},
{0, 904, EIF_TRUE, 0},
{0, 905, EIF_FALSE, 0},
{0, 906, EIF_FALSE, 0},
{0, 907, EIF_FALSE, 0},
{0, 908, EIF_FALSE, 0},
{0, 909, EIF_FALSE, 0},
{0, 910, EIF_TRUE, 0},
{0, 911, EIF_FALSE, 0},
{0, 912, EIF_TRUE, 0},
{0, 913, EIF_FALSE, 0},
{0, 914, EIF_FALSE, 0},
{0, 915, EIF_FALSE, 0},
{0, 916, EIF_FALSE, 0},
{0, 917, EIF_FALSE, 0},
{0, 918, EIF_FALSE, 0},
{0, 919, EIF_FALSE, 0},
{0, 920, EIF_TRUE, 0},
{0, 921, EIF_FALSE, 0},
{0, 922, EIF_FALSE, 0},
{0, 923, EIF_TRUE, 0},
{0, 924, EIF_FALSE, 0},
{0, 925, EIF_FALSE, 0},
{0, 926, EIF_FALSE, 0},
{0, 927, EIF_FALSE, 0},
{0, 928, EIF_FALSE, 0},
{0, 929, EIF_FALSE, 0},
{0, 930, EIF_FALSE, 0},
{0, 931, EIF_FALSE, 0},
{0, 932, EIF_FALSE, 0},
{0, 933, EIF_TRUE, 0},
{0, 934, EIF_FALSE, 0},
{0, 935, EIF_FALSE, 0},
{0, 936, EIF_FALSE, 0},
{0, 937, EIF_TRUE, 0},
{0, 938, EIF_TRUE, 0},
{0, 939, EIF_FALSE, 0},
{0, 940, EIF_FALSE, 0},
{0, 941, EIF_FALSE, 0},
{0, 942, EIF_TRUE, 0},
{0, 943, EIF_FALSE, 0},
{0, 944, EIF_TRUE, 0},
{0, 945, EIF_FALSE, 0},
{0, 946, EIF_FALSE, 0},
{0, 947, EIF_FALSE, 0},
{0, 948, EIF_TRUE, 0},
{0, 949, EIF_FALSE, 0},
{0, 950, EIF_FALSE, 0},
{0, 951, EIF_FALSE, 0},
{0, 952, EIF_TRUE, 0},
{0, 953, EIF_FALSE, 0},
{0, 954, EIF_FALSE, 0},
{0, 955, EIF_FALSE, 0},
{0, 956, EIF_FALSE, 0},
{0, 957, EIF_FALSE, 0},
{0, 958, EIF_FALSE, 0},
{0, 959, EIF_TRUE, 0},
{0, 960, EIF_FALSE, 0},
{0, 961, EIF_TRUE, 0},
{0, 962, EIF_FALSE, 0},
{0, 963, EIF_FALSE, 0},
{0, 964, EIF_FALSE, 0},
{0, 965, EIF_TRUE, 0},
{0, 966, EIF_FALSE, 0},
{0, 967, EIF_FALSE, 0},
{0, 968, EIF_FALSE, 0},
{0, 969, EIF_TRUE, 0},
{0, 970, EIF_FALSE, 0},
{0, 971, EIF_TRUE, 0},
{0, 972, EIF_FALSE, 0},
{0, 973, EIF_FALSE, 0},
{0, 974, EIF_FALSE, 0},
{0, 975, EIF_TRUE, 0},
{0, 976, EIF_FALSE, 0},
{0, 977, EIF_TRUE, 0},
{0, 978, EIF_FALSE, 0},
{0, 979, EIF_FALSE, 0},
{0, 980, EIF_TRUE, 0},
{0, 981, EIF_FALSE, 0},
{0, 982, EIF_FALSE, 0},
{0, 983, EIF_FALSE, 0},
{0, 984, EIF_FALSE, 0},
{0, 985, EIF_TRUE, 0},
{0, 986, EIF_FALSE, 0},
{0, 987, EIF_TRUE, 0},
{0, 988, EIF_FALSE, 0},
{0, 989, EIF_FALSE, 0},
{0, 990, EIF_FALSE, 0},
{0, 991, EIF_TRUE, 0},
{0, 992, EIF_FALSE, 0},
{0, 993, EIF_FALSE, 0},
{0, 994, EIF_FALSE, 0},
{0, 995, EIF_FALSE, 0},
{0, 996, EIF_FALSE, 0},
{0, 997, EIF_FALSE, 0},
{0, 998, EIF_FALSE, 0},
{0, 999, EIF_TRUE, 0},
{0, 1000, EIF_FALSE, 0},
{0, 1001, EIF_FALSE, 0},
{0, 1002, EIF_FALSE, 0},
{0, 1003, EIF_FALSE, 0},
{0, 1004, EIF_FALSE, 0},
{0, 1005, EIF_FALSE, 0},
{0, 1006, EIF_FALSE, 0},
{0, 1007, EIF_FALSE, 0},
{0, 1008, EIF_FALSE, 0},
{0, 1009, EIF_FALSE, 0},
{0, 1010, EIF_FALSE, 0},
{0, 1011, EIF_FALSE, 0},
{0, 1012, EIF_FALSE, 0},
{0, 1013, EIF_TRUE, 0},
{0, 1014, EIF_FALSE, 0},
{0, 1015, EIF_FALSE, 0},
{0, 1016, EIF_TRUE, 0},
{0, 1017, EIF_FALSE, 0},
{0, 1018, EIF_TRUE, 0},
{0, 1019, EIF_FALSE, 0},
{0, 1020, EIF_TRUE, 0},
{0, 1021, EIF_FALSE, 0},
{0, 1022, EIF_FALSE, 0},
{0, 1023, EIF_FALSE, 0},
{0, 1024, EIF_FALSE, 0},
{0, 1025, EIF_FALSE, 0},
{0, 1026, EIF_FALSE, 0},
{0, 1027, EIF_FALSE, 0},
{0, 1028, EIF_FALSE, 0},
{0, 1029, EIF_TRUE, 0},
{0, 1030, EIF_FALSE, 0},
{0, 1031, EIF_TRUE, 0},
{0, 1032, EIF_FALSE, 0},
{0, 1033, EIF_FALSE, 0},
{0, 1034, EIF_FALSE, 0},
{0, 1035, EIF_FALSE, 0},
{0, 1036, EIF_FALSE, 0},
{0, 1037, EIF_FALSE, 0},
{0, 1038, EIF_FALSE, 0},
{0, 1039, EIF_FALSE, 0},
{0, 1040, EIF_FALSE, 0},
{0, 1041, EIF_TRUE, 0},
{0, 1042, EIF_FALSE, 0},
{0, 1043, EIF_TRUE, 0},
{0, 1044, EIF_FALSE, 0},
{0, 1045, EIF_FALSE, 0},
{0, 1046, EIF_FALSE, 0},
{0, 1047, EIF_FALSE, 0},
{0, 1048, EIF_FALSE, 0},
{0, 1049, EIF_FALSE, 0},
{0, 1050, EIF_FALSE, 0},
{0, 1051, EIF_FALSE, 0},
{0, 1052, EIF_FALSE, 0},
{0, 1053, EIF_FALSE, 0},
{0, 1054, EIF_FALSE, 0},
{0, 1055, EIF_FALSE, 0},
{0, 1056, EIF_FALSE, 0},
{0, 1057, EIF_FALSE, 0},
{0, 1058, EIF_FALSE, 0},
{0, 1059, EIF_FALSE, 0},
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
{0, 1072, EIF_FALSE, 0},
{0, 1073, EIF_FALSE, 0},
{0, 1074, EIF_FALSE, 0},
{0, 1075, EIF_TRUE, 0},
{0, 1076, EIF_FALSE, 0},
{0, 1077, EIF_FALSE, 0},
{0, 1078, EIF_FALSE, 0},
{0, 1079, EIF_FALSE, 0},
{0, 1080, EIF_FALSE, 0},
{0, 1081, EIF_FALSE, 0},
{0, 1082, EIF_FALSE, 0},
{0, 1083, EIF_FALSE, 0},
{0, 1084, EIF_FALSE, 0},
{0, 1085, EIF_FALSE, 0},
{0, 1086, EIF_FALSE, 0},
{0, 1087, EIF_FALSE, 0},
{0, 1088, EIF_FALSE, 0},
{0, 1089, EIF_FALSE, 0},
{0, 1090, EIF_FALSE, 0},
{0, 1091, EIF_FALSE, 0},
{0, 1092, EIF_FALSE, 0},
{0, 1093, EIF_FALSE, 0},
{0, 1094, EIF_FALSE, 0},
{0, 1095, EIF_FALSE, 0},
{0, 1096, EIF_FALSE, 0},
{0, 1097, EIF_FALSE, 0},
{0, 1098, EIF_FALSE, 0},
{0, 1099, EIF_TRUE, 0},
{0, 1100, EIF_FALSE, 0},
{0, 1101, EIF_FALSE, 0},
{0, 1102, EIF_FALSE, 0},
{0, 1103, EIF_FALSE, 0},
{0, 1104, EIF_FALSE, 0},
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
{0, 1124, EIF_TRUE, 0},
{0, 1125, EIF_FALSE, 0},
{0, 1126, EIF_FALSE, 0},
{0, 1127, EIF_FALSE, 0},
{0, 1128, EIF_FALSE, 0},
{0, 1129, EIF_TRUE, 0},
{0, 1130, EIF_FALSE, 0},
{0, 1131, EIF_FALSE, 0},
{0, 1132, EIF_FALSE, 0},
{0, 1133, EIF_FALSE, 0},
{0, 1134, EIF_FALSE, 0},
{0, 1135, EIF_FALSE, 0},
{0, 1136, EIF_FALSE, 0},
{0, 1137, EIF_FALSE, 0},
{0, 1138, EIF_FALSE, 0},
{0, 1139, EIF_FALSE, 0},
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
{0, 1156, EIF_TRUE, 0},
{0, 1157, EIF_FALSE, 0},
{0, 1158, EIF_FALSE, 0},
{0, 1159, EIF_FALSE, 0},
{0, 1160, EIF_FALSE, 0},
{0, 1161, EIF_FALSE, 0},
{0, 1162, EIF_FALSE, 0},
{0, 1163, EIF_FALSE, 0},
{0, 1164, EIF_FALSE, 0},
{0, 1165, EIF_FALSE, 0},
{0, 1166, EIF_FALSE, 0},
{0, 1167, EIF_TRUE, 0},
{0, 1168, EIF_FALSE, 0},
{0, 1169, EIF_FALSE, 0},
{0, 1170, EIF_FALSE, 0},
{0, 1171, EIF_FALSE, 0},
{0, 1172, EIF_FALSE, &T1172f25},
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
{0, 1190, EIF_FALSE, 0},
{0, 1191, EIF_FALSE, 0},
{0, 1192, EIF_TRUE, 0},
{0, 1193, EIF_TRUE, 0},
{0, 1194, EIF_FALSE, 0},
{0, 1195, EIF_FALSE, 0},
{0, 1196, EIF_TRUE, 0},
{0, 1197, EIF_FALSE, 0},
{0, 1198, EIF_FALSE, 0},
{0, 1199, EIF_FALSE, 0},
{0, 1200, EIF_FALSE, 0},
{0, 1201, EIF_FALSE, 0},
{0, 1202, EIF_FALSE, 0},
{0, 1203, EIF_TRUE, 0},
{0, 1204, EIF_FALSE, 0},
{0, 1205, EIF_FALSE, 0},
{0, 1206, EIF_FALSE, 0},
{0, 1207, EIF_FALSE, 0},
{0, 1208, EIF_FALSE, 0},
{0, 1209, EIF_FALSE, 0},
{0, 1210, EIF_FALSE, 0},
{0, 1211, EIF_TRUE, 0},
{0, 1212, EIF_FALSE, 0},
{0, 1213, EIF_TRUE, 0},
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
{0, 1237, EIF_FALSE, 0},
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
{0, 1248, EIF_FALSE, 0},
{0, 1249, EIF_FALSE, 0},
{0, 1250, EIF_FALSE, 0},
{0, 1251, EIF_FALSE, 0},
{0, 1252, EIF_FALSE, 0},
{0, 1253, EIF_FALSE, 0},
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
{0, 1272, EIF_FALSE, 0},
{0, 1273, EIF_FALSE, 0},
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
{0, 1286, EIF_FALSE, 0},
{0, 1287, EIF_FALSE, 0},
{0, 1288, EIF_FALSE, 0},
{0, 1289, EIF_FALSE, 0},
{0, 1290, EIF_FALSE, 0},
{0, 1291, EIF_FALSE, 0},
{0, 1292, EIF_FALSE, 0},
{0, 1293, EIF_FALSE, 0},
{0, 1294, EIF_FALSE, 0},
{0, 1295, EIF_FALSE, 0},
{0, 1296, EIF_FALSE, 0},
{0, 1297, EIF_FALSE, 0},
{0, 1298, EIF_FALSE, 0},
{0, 1299, EIF_FALSE, 0},
{0, 1300, EIF_FALSE, 0},
{0, 1301, EIF_FALSE, 0},
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
{0, 1333, EIF_TRUE, 0},
{0, 1334, EIF_FALSE, 0},
{0, 1335, EIF_FALSE, 0},
{0, 1336, EIF_FALSE, 0},
{0, 1337, EIF_FALSE, 0},
{0, 1338, EIF_TRUE, 0},
{0, 1339, EIF_FALSE, 0},
{0, 1340, EIF_FALSE, 0},
{0, 1341, EIF_FALSE, 0},
{0, 1342, EIF_FALSE, 0},
{0, 1343, EIF_FALSE, 0},
{0, 1344, EIF_FALSE, 0},
{0, 1345, EIF_TRUE, 0},
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
{0, 1356, EIF_TRUE, 0},
{0, 1357, EIF_FALSE, 0},
{0, 1358, EIF_FALSE, 0},
{0, 1359, EIF_FALSE, 0},
{0, 1360, EIF_TRUE, 0},
{0, 1361, EIF_FALSE, 0},
{0, 1362, EIF_FALSE, 0},
{0, 1363, EIF_FALSE, 0},
{0, 1364, EIF_FALSE, 0},
{0, 1365, EIF_TRUE, 0},
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
{0, 1418, EIF_FALSE, 0},
{0, 1419, EIF_FALSE, 0},
{0, 1420, EIF_FALSE, 0},
{0, 1421, EIF_FALSE, 0},
{0, 1422, EIF_FALSE, 0},
{0, 1423, EIF_FALSE, 0},
{0, 1424, EIF_FALSE, 0},
{0, 1425, EIF_FALSE, 0},
{0, 1426, EIF_FALSE, 0},
{0, 1427, EIF_FALSE, 0},
{0, 1428, EIF_FALSE, 0},
{0, 1429, EIF_FALSE, 0},
{0, 1430, EIF_FALSE, 0},
{0, 1431, EIF_FALSE, 0},
{0, 1432, EIF_FALSE, 0},
{0, 1433, EIF_FALSE, 0},
{0, 1434, EIF_FALSE, 0},
{0, 1435, EIF_FALSE, 0},
{0, 1436, EIF_FALSE, 0},
{0, 1437, EIF_FALSE, 0},
{0, 1438, EIF_FALSE, 0},
{0, 1439, EIF_FALSE, 0},
{0, 1440, EIF_FALSE, 0},
{0, 1441, EIF_FALSE, 0},
{0, 1442, EIF_FALSE, 0},
{0, 1443, EIF_TRUE, 0},
{0, 1444, EIF_FALSE, 0},
{0, 1445, EIF_TRUE, 0},
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
{0, 1460, EIF_FALSE, 0},
{0, 1461, EIF_FALSE, 0},
{0, 1462, EIF_FALSE, 0},
{0, 1463, EIF_FALSE, 0},
{0, 1464, EIF_FALSE, 0},
{0, 1465, EIF_FALSE, 0},
{0, 1466, EIF_TRUE, 0},
{0, 1467, EIF_FALSE, 0},
{0, 1468, EIF_FALSE, 0},
{0, 1469, EIF_FALSE, 0},
{0, 1470, EIF_FALSE, 0},
{0, 1471, EIF_FALSE, 0},
{0, 1472, EIF_FALSE, 0},
{0, 1473, EIF_FALSE, 0},
{0, 1474, EIF_FALSE, 0},
{0, 1475, EIF_FALSE, 0},
{0, 1476, EIF_TRUE, 0},
{0, 1477, EIF_FALSE, 0},
{0, 1478, EIF_FALSE, 0},
{0, 1479, EIF_FALSE, 0},
{0, 1480, EIF_FALSE, 0},
{0, 1481, EIF_TRUE, 0},
{0, 1482, EIF_FALSE, 0},
{0, 1483, EIF_FALSE, 0},
{0, 1484, EIF_TRUE, 0},
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
{0, 1528, EIF_TRUE, 0},
{0, 1529, EIF_FALSE, 0},
{0, 1530, EIF_FALSE, 0},
{0, 1531, EIF_FALSE, 0},
{0, 1532, EIF_FALSE, 0},
{0, 1533, EIF_FALSE, 0},
{0, 1534, EIF_FALSE, 0},
{0, 1535, EIF_FALSE, 0},
{0, 1536, EIF_FALSE, 0},
{0, 1537, EIF_FALSE, 0},
{0, 1538, EIF_FALSE, 0},
{0, 1539, EIF_FALSE, 0},
{0, 1540, EIF_FALSE, 0},
{0, 1541, EIF_FALSE, 0},
{0, 1542, EIF_FALSE, 0},
{0, 1543, EIF_FALSE, 0},
{0, 1544, EIF_FALSE, 0},
{0, 1545, EIF_FALSE, 0},
{0, 1546, EIF_FALSE, 0},
{0, 1547, EIF_FALSE, 0},
{0, 1548, EIF_FALSE, 0},
{0, 1549, EIF_FALSE, 0},
{0, 1550, EIF_TRUE, 0},
{0, 1551, EIF_FALSE, 0},
{0, 1552, EIF_FALSE, 0},
{0, 1553, EIF_FALSE, 0},
{0, 1554, EIF_TRUE, 0},
{0, 1555, EIF_FALSE, 0},
{0, 1556, EIF_FALSE, 0},
{0, 1557, EIF_TRUE, 0},
{0, 1558, EIF_FALSE, 0},
{0, 1559, EIF_FALSE, 0},
{0, 1560, EIF_FALSE, 0},
{0, 1561, EIF_FALSE, 0},
{0, 1562, EIF_TRUE, 0},
{0, 1563, EIF_FALSE, 0},
{0, 1564, EIF_FALSE, 0},
{0, 1565, EIF_FALSE, 0},
{0, 1566, EIF_TRUE, 0},
{0, 1567, EIF_FALSE, 0},
{0, 1568, EIF_FALSE, 0},
{0, 1569, EIF_FALSE, 0},
{0, 1570, EIF_FALSE, 0},
{0, 1571, EIF_FALSE, 0},
{0, 1572, EIF_FALSE, 0},
{0, 1573, EIF_FALSE, 0},
{0, 1574, EIF_FALSE, 0},
{0, 1575, EIF_FALSE, 0},
{0, 1576, EIF_FALSE, 0},
{0, 1577, EIF_FALSE, 0},
{0, 1578, EIF_FALSE, 0},
{0, 1579, EIF_FALSE, 0},
{0, 1580, EIF_FALSE, 0},
{0, 1581, EIF_FALSE, 0},
{0, 1582, EIF_FALSE, 0},
{0, 1583, EIF_FALSE, 0},
{0, 1584, EIF_FALSE, 0},
{0, 1585, EIF_FALSE, 0},
{0, 1586, EIF_FALSE, 0},
{0, 1587, EIF_FALSE, 0},
{0, 1588, EIF_FALSE, 0},
{0, 1589, EIF_FALSE, 0},
{0, 1590, EIF_FALSE, 0},
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
{0, 1631, EIF_FALSE, 0},
{0, 1632, EIF_FALSE, 0},
{0, 1633, EIF_FALSE, 0},
{0, 1634, EIF_TRUE, 0},
{0, 1635, EIF_FALSE, 0},
{0, 1636, EIF_FALSE, 0},
{0, 1637, EIF_FALSE, 0},
{0, 1638, EIF_FALSE, 0},
{0, 1639, EIF_FALSE, 0},
{0, 1640, EIF_FALSE, 0}
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
	t1 = T21c33();
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
	switch (how) {
	case 0: 
#ifdef EIF_WINDOWS
		return "rt";
#else
		return "r";
#endif
	case 1:
#ifdef EIF_WINDOWS
		return "wt";
#else
		return "w";
#endif
	case 2:
#ifdef EIF_WINDOWS
		return "at";
#else
		return "a";
#endif
	case 3:
#ifdef EIF_WINDOWS
		return "rt+";
#else
		return "r+";
#endif
	case 4:
#ifdef EIF_WINDOWS
		return "wt+";
#else
		return "w+";
#endif
	case 5:
#ifdef EIF_WINDOWS
		return "at+";
#else
		return "a+";
#endif
	case 10: 
#ifdef EIF_WINDOWS
		return "rb";
#else
		return "r";
#endif
	case 11:
#ifdef EIF_WINDOWS
		return "wb";
#else
		return "w";
#endif
	case 12:
#ifdef EIF_WINDOWS
		return "ab";
#else
		return "a";
#endif
	case 13:
#ifdef EIF_WINDOWS
		return "rb+";
#else
		return "r+";
#endif
	case 14:
#ifdef EIF_WINDOWS
		return "wb+";
#else
		return "w+";
#endif
	case 15:
#ifdef EIF_WINDOWS
		return "ab+";
#else
		return "a+";
#endif
	default:
#ifdef EIF_WINDOWS
		return "rt";
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
