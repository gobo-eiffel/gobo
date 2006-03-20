#include "gelex.h"

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
T0* T40x3636(T0* C)
{
	int z1 = C->id;
if (z1<=99) {
if (z1<=86) {
if (z1<=53) {
if (z1<=48) {
if (z1<=47) {
if (z1==37) {
	return (T37f2(C));
} else {
	return (T47f2(C));
}
} else {
	return (T48f2(C));
}
} else {
if (z1==49) {
	return (T49f2(C));
} else {
	return (T53f2(C));
}
}
} else {
if (z1<=59) {
if (z1<=58) {
if (z1==57) {
	return (T57f1(C));
} else {
	return (T58f1(C));
}
} else {
	return (T59f1(C));
}
} else {
if (z1==60) {
	return (T60f1(C));
} else {
	return (T86f1(C));
}
}
}
} else {
if (z1<=95) {
if (z1<=93) {
if (z1<=92) {
if (z1==91) {
	return (T91f1(C));
} else {
	return (T92f1(C));
}
} else {
	return (T93f1(C));
}
} else {
if (z1==94) {
	return (T94f1(C));
} else {
	return (T95f1(C));
}
}
} else {
if (z1<=97) {
if (z1==96) {
	return (T96f1(C));
} else {
	return (T97f1(C));
}
} else {
if (z1==98) {
	return (T98f1(C));
} else {
	return (T99f1(C));
}
}
}
}
} else {
if (z1<=109) {
if (z1<=104) {
if (z1<=102) {
if (z1<=101) {
if (z1==100) {
	return (T100f1(C));
} else {
	return (T101f1(C));
}
} else {
	return (T102f1(C));
}
} else {
if (z1==103) {
	return (T103f1(C));
} else {
	return (T104f1(C));
}
}
} else {
if (z1<=107) {
if (z1<=106) {
if (z1==105) {
	return (T105f1(C));
} else {
	return (T106f1(C));
}
} else {
	return (T107f1(C));
}
} else {
if (z1==108) {
	return (T108f1(C));
} else {
	return (T109f1(C));
}
}
}
} else {
if (z1<=114) {
if (z1<=112) {
if (z1<=111) {
if (z1==110) {
	return (T110f1(C));
} else {
	return (T111f1(C));
}
} else {
	return (T112f1(C));
}
} else {
if (z1==113) {
	return (T113f1(C));
} else {
	return (T114f1(C));
}
}
} else {
if (z1<=160) {
if (z1==115) {
	return (T115f1(C));
} else {
	return (T160f1(C));
}
} else {
if (z1==161) {
	return (T161f1(C));
} else {
	return (T162f1(C));
}
}
}
}
}
	return 0;
}

/* Call to ANY.same_type */
T2 T74x59(T0* C, T0* a1)
{
	int z1 = C->id;
if (z1<=120) {
if (z1==16) {
	return ((T2)(((T0*)(C))->id==((T0*)(a1))->id));
} else {
	return ((T2)(((T0*)(C))->id==((T0*)(a1))->id));
}
} else {
	return ((T2)(((T0*)(C))->id==((T0*)(a1))->id));
}
	return 0;
}

/* Call to LX_TRANSITION [LX_NFA_STATE].target */
T0* T180x6315(T0* C)
{
	int z1 = C->id;
if (z1<=182) {
if (z1==179) {
	return (((T179*)(C))->a1);
} else {
	return (((T182*)(C))->a2);
}
} else {
	return (((T183*)(C))->a2);
}
	return 0;
}

/* Call to LX_TRANSITION [LX_NFA_STATE].labeled */
T2 T180x6318(T0* C, T4 a1)
{
	int z1 = C->id;
if (z1<=182) {
if (z1==179) {
	return (T179f3(C, a1));
} else {
	return (T182f4(C, a1));
}
} else {
	return (T183f4(C, a1));
}
	return 0;
}

/* Call to LX_TRANSITION [LX_NFA_STATE].cloned_object */
T0* T180x1453(T0* C)
{
	int z1 = C->id;
if (z1<=182) {
if (z1==179) {
	return (T179f2(C));
} else {
	return (T182f3(C));
}
} else {
	return (T183f3(C));
}
	return 0;
}

/* Call to LX_TRANSITION [LX_NFA_STATE].record */
void T180x6319(T0* C, T0* a1)
{
	int z1 = C->id;
if (z1<=182) {
if (z1==179) {
		T179f7(C, a1);

} else {
		T182f8(C, a1);

}
} else {
		T183f8(C, a1);

}
}

/* Call to LX_TRANSITION [LX_NFA_STATE].set_target */
void T180x6316(T0* C, T0* a1)
{
	int z1 = C->id;
if (z1<=182) {
if (z1==179) {
		T179f6(C, a1);

} else {
		T182f7(C, a1);

}
} else {
		T183f7(C, a1);

}
}

/* GELEX.execute */
T0* T18c7()
{
	T0* l1 = 0;
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T18));
	((T18*)(C))->id = 18;
	if (EIF_FALSE) {
		T18f8(C);
	}
	t1 = (T18f1(C));
	T20f5(t1, gems("gelex", 5));
	((T18*)(C))->a2 = T21c6();
	((T18*)(C))->a3 = T22c34();
	l1 = T19c7(((T18*)(C))->a2);
	T19f8(l1, ((T18*)(C))->a3);
	T18f9(C);
	T18f10(C);
	T18f11(C);
	T18f12(C);
	return C;
}

/* GELEX.print_backing_up_report */
void T18f12(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	t1 = (((T22*)(((T18*)(C))->a3))->a8);
	if (t1) {
		l1 = (((T22*)(((T18*)(C))->a3))->a9);
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			l2 = T52c20(l1);
			T52f21(l2);
			t1 = (T52f1(l2));
			if (t1) {
				if ((((T18*)(C))->a6)->id==51) {
					T51f51(((T18*)(C))->a6, l2);
				} else {
					T44f82(((T18*)(C))->a6, l2);
				}
				T52f22(l2);
			} else {
				l3 = T53c7(l1);
				T21f7(((T18*)(C))->a2, l3);
				t2 = (T18f4(C));
				T41f2(t2, (T4)(geint32(1)));
			}
		} else {
			t2 = (T18f5(C));
			t2 = (T42f2(t2));
			if ((((T18*)(C))->a6)->id==51) {
				T51f51(((T18*)(C))->a6, t2);
			} else {
				T44f82(((T18*)(C))->a6, t2);
			}
		}
	}
}

/* KL_STANDARD_FILES.output */
unsigned char ge291os3690 = '\0';
T0* ge291ov3690;
T0* T42f2(T0* C)
{
	T0* R = 0;
	if (ge291os3690) {
		return ge291ov3690;
	} else {
		ge291os3690 = '\1';
	}
	R = T55c9();
	ge291ov3690 = R;
	return R;
}

/* KL_STDOUT_FILE.make */
T0* T55c9()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T55));
	((T55*)(C))->id = 55;
	T55f15(C, gems("stdout", 6));
	return C;
}

/* KL_STDOUT_FILE.make_open_stdout */
void T55f15(T0* C, T0* a1)
{
	T55f18(C, a1);
	((T55*)(C))->a3 = (T55f4(C, (T4)(geint32(1))));
	T55f19(C);
}

/* KL_STDOUT_FILE.set_write_mode */
void T55f19(T0* C)
{
	((T55*)(C))->a6 = ((T4)(geint32(2)));
}

/* KL_STDOUT_FILE.console_def */
T14 T55f4(T0* C, T4 a1)
{
	T14 R = 0;
	R = (T14)console_def(a1);
	return R;
}

/* KL_STDOUT_FILE.old_make */
void T55f18(T0* C, T0* a1)
{
	((T55*)(C))->a5 = (a1);
	((T55*)(C))->a6 = ((T4)(geint32(0)));
}

/* GELEX.std */
unsigned char ge289os1299 = '\0';
T0* ge289ov1299;
T0* T18f5(T0* C)
{
	T0* R = 0;
	if (ge289os1299) {
		return ge289ov1299;
	} else {
		ge289os1299 = '\1';
	}
	R = T42c4();
	ge289ov1299 = R;
	return R;
}

/* KL_STANDARD_FILES.default_create */
T0* T42c4()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T42));
	((T42*)(C))->id = 42;
	return C;
}

/* KL_EXCEPTIONS.die */
void T41f2(T0* C, T4 a1)
{
	esdie(a1);
}

/* GELEX.exceptions */
unsigned char ge307os1300 = '\0';
T0* ge307ov1300;
T0* T18f4(T0* C)
{
	T0* R = 0;
	if (ge307os1300) {
		return ge307ov1300;
	} else {
		ge307os1300 = '\1';
	}
	R = T41c1();
	ge307ov1300 = R;
	return R;
}

/* KL_EXCEPTIONS.default_create */
T0* T41c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T41));
	((T41*)(C))->id = 41;
	return C;
}

/* UT_ERROR_HANDLER.report_error */
void T21f7(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T21f5(C, a1));
	T21f10(C, t1);
}

/* UT_ERROR_HANDLER.report_error_message */
void T21f10(T0* C, T0* a1)
{
	T61f10(((T21*)(C))->a1, a1);
}

/* KL_STDERR_FILE.put_line */
void T61f10(T0* C, T0* a1)
{
	T61f11(C, a1);
	T61f14(C);
}

/* KL_STDERR_FILE.put_new_line */
void T61f14(T0* C)
{
	T61f11(C, ge385ov4446);
}

/* KL_STDERR_FILE.put_string */
void T61f11(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T61f1(C));
	l1 = (T56f2(t1, a1));
	T61f15(C, l1);
}

/* KL_STDERR_FILE.old_put_string */
void T61f15(T0* C, T0* a1)
{
	T0* l1 = 0;
	T4 t1;
	T2 t2;
	T118 t3;
	T14 t4;
	t1 = (((T16*)(a1))->a2);
	t2 = ((t1)!=((T4)(geint32(0))));
	if (t2) {
		l1 = (((T16*)(a1))->a1);
		t3.id = 118;
		t3.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
		t4 = (T118f2(&t3));
		t1 = (((T16*)(a1))->a2);
		T61f19(C, ((T61*)(C))->a2, t4, t1);
	}
}

/* KL_STDERR_FILE.console_ps */
void T61f19(T0* C, T14 a1, T14 a2, T4 a3)
{
	console_ps((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
}

/* TYPED_POINTER [ANY].to_pointer */
T14 T118f2(T118* C)
{
	T14 R = 0;
	R = ((*C).a1);
	return R;
}

/* KL_STRING_ROUTINES.as_string */
T0* T56f2(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* t1;
	T2 t2;
	t1 = (T56f7(C));
	t2 = (T168f1(t1, a1, ge389ov4845));
	if (t2) {
		R = (a1);
	} else {
		l1 = EIF_VOID;
		t2 = ((l1)!=(EIF_VOID));
		if (t2) {
			R = ((T0*)gevoid(l1));
		} else {
			R = (T16f13(a1));
		}
	}
	return R;
}

/* STRING.string */
T0* T16f13(T0* C)
{
	T0* R = 0;
	R = T16c25(((T16*)(C))->a2);
	T16f31(R, C);
	return R;
}

/* STRING.append */
void T16f31(T0* C, T0* a1)
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
		t2 = (T16f5(C));
		t1 = (T4f1(&l3, t2));
		if (t1) {
			t2 = (T16f6(C));
			t2 = ((T4)((l3)+(t2)));
			T16f30(C, t2);
		}
		t3 = (((T16*)(a1))->a1);
		T15f9(((T16*)(C))->a1, t3, (T4)(geint32(0)), l1, l2);
		((T16*)(C))->a2 = (l3);
		((T16*)(C))->a4 = ((T4)(geint32(0)));
	}
}

/* SPECIAL [CHARACTER].copy_data */
void T15f9(T0* C, T0* a1, T4 a2, T4 a3, T4 a4)
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
void T16f30(T0* C, T4 a1)
{
	T4 l1 = 0;
	T2 t1;
	T4 t2;
	l1 = (((T15*)(((T16*)(C))->a1))->a1);
	t1 = (T4f5(&a1, l1));
	if (t1) {
		t2 = ((T4)((a1)+((T4)(geint32(1)))));
		((T16*)(C))->a1 = (T15f3(((T16*)(C))->a1, t2));
	}
}

/* SPECIAL [CHARACTER].aliased_resized_area */
T0* T15f3(T0* C, T4 a1)
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
T2 T4f5(T4* C, T4 a1)
{
	T2 R = 0;
	T2 t1;
	t1 = ((T2)((*C)<(a1)));
	R = ((T2)(!(t1)));
	return R;
}

/* STRING.additional_space */
T4 T16f6(T0* C)
{
	T4 R = 0;
	T4 t1;
	t1 = (T16f5(C));
	t1 = ((T4)((t1)*((T4)(geint32(50)))));
	t1 = ((T4)((t1)/((T4)(geint32(100)))));
	R = (T4f11(&t1, (T4)(geint32(5))));
	return R;
}

/* INTEGER.max */
T4 T4f11(T4* C, T4 a1)
{
	T4 R = 0;
	T2 t1;
	t1 = (T4f5(C, a1));
	if (t1) {
		R = (*C);
	} else {
		R = (a1);
	}
	return R;
}

/* STRING.capacity */
T4 T16f5(T0* C)
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
	((T16*)(C))->a4 = ((T4)(geint32(0)));
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T16f29(C, t1);
	return C;
}

/* STRING.make_area */
void T16f29(T0* C, T4 a1)
{
	((T16*)(C))->a1 = T15c8(a1);
}

/* SPECIAL [CHARACTER].make */
T0* T15c8(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T15)+a1*sizeof(T1));
	((T15*)(C))->a1 = a1;
	((T15*)(C))->id = 15;
	return C;
}

/* KL_ANY_ROUTINES.same_types */
T2 T168f1(T0* C, T0* a1, T0* a2)
{
	T2 R = 0;
	R = (T74x59(a1, a2));
	return R;
}

/* KL_STRING_ROUTINES.any_ */
unsigned char ge251os1454 = '\0';
T0* ge251ov1454;
T0* T56f7(T0* C)
{
	T0* R = 0;
	if (ge251os1454) {
		return ge251ov1454;
	} else {
		ge251os1454 = '\1';
	}
	R = T168c2();
	ge251ov1454 = R;
	return R;
}

/* KL_ANY_ROUTINES.default_create */
T0* T168c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T168));
	((T168*)(C))->id = 168;
	return C;
}

/* KL_STDERR_FILE.string_ */
unsigned char ge259os1314 = '\0';
T0* ge259ov1314;
T0* T61f1(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* KL_STRING_ROUTINES.default_create */
T0* T56c10()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T56));
	((T56*)(C))->id = 56;
	return C;
}

/* UT_ERROR_HANDLER.message */
T0* T21f5(T0* C, T0* a1)
{
	T0* R = 0;
	R = (T40x3636(a1));
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.make */
T0* T53c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T53));
	((T53*)(C))->id = 53;
	((T53*)(C))->a1 = T119c7((T4)(geint32(1)), (T4)(geint32(1)));
	T119f8(((T53*)(C))->a1, a1, (T4)(geint32(1)));
	return C;
}

/* ARRAY [STRING].put */
void T119f8(T0* C, T0* a1, T4 a2)
{
	T4 t1;
	t1 = ((T4)((a2)-(((T119*)(C))->a2)));
	((T77*)(((T119*)(C))->a1))->a2[t1] = (a1);
}

/* ARRAY [STRING].make */
T0* T119c7(T4 a1, T4 a2)
{
	T2 t1;
	T4 t2;
	T0* C;
	C = (T0*)gealloc(sizeof(T119));
	((T119*)(C))->id = 119;
	((T119*)(C))->a2 = (a1);
	((T119*)(C))->a3 = (a2);
	t1 = (T4f6(&a1, a2));
	if (t1) {
		t2 = ((T4)((a2)-(a1)));
		t2 = ((T4)((t2)+((T4)(geint32(1)))));
		T119f9(C, t2);
	} else {
		T119f9(C, (T4)(geint32(0)));
	}
	return C;
}

/* ARRAY [STRING].make_area */
void T119f9(T0* C, T4 a1)
{
	((T119*)(C))->a1 = T77c4(a1);
}

/* SPECIAL [STRING].make */
T0* T77c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T77)+a1*sizeof(T0*));
	((T77*)(C))->a1 = a1;
	((T77*)(C))->id = 77;
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

/* KL_TEXT_OUTPUT_FILE.close */
void T52f22(T0* C)
{
	T2 l1 = 0;
	T2 t1;
	t1 = ((T2)(!(l1)));
	if (t1) {
		T52f30(C);
	}
}

/* KL_TEXT_OUTPUT_FILE.old_close */
void T52f30(T0* C)
{
	T52f33(C, ((T52*)(C))->a15);
	((T52*)(C))->a3 = ((T4)(geint32(0)));
	((T52*)(C))->a17 = (EIF_FALSE);
}

/* KL_TEXT_OUTPUT_FILE.file_close */
void T52f33(T0* C, T14 a1)
{
	file_close((FILE *)a1);
}

/* LX_COMPRESSED_DFA.print_backing_up_report */
void T44f82(T0* C, T0* a1)
{
	T44f82p1(C, a1);
	if ((a1)->id==52) {
		T52f25(a1, gems("Compressed tables always back up.", 33));
	} else {
		T55f12(a1, gems("Compressed tables always back up.", 33));
	}
}

/* KL_STDOUT_FILE.put_line */
void T55f12(T0* C, T0* a1)
{
	T55f10(C, a1);
	T55f14(C);
}

/* KL_STDOUT_FILE.put_new_line */
void T55f14(T0* C)
{
	T55f10(C, ge387ov4446);
}

/* KL_STDOUT_FILE.put_string */
void T55f10(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T55f1(C));
	l1 = (T56f2(t1, a1));
	T55f16(C, l1);
}

/* KL_STDOUT_FILE.old_put_string */
void T55f16(T0* C, T0* a1)
{
	T0* l1 = 0;
	T4 t1;
	T2 t2;
	T118 t3;
	T14 t4;
	t1 = (((T16*)(a1))->a2);
	t2 = ((t1)!=((T4)(geint32(0))));
	if (t2) {
		l1 = (((T16*)(a1))->a1);
		t3.id = 118;
		t3.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
		t4 = (T118f2(&t3));
		t1 = (((T16*)(a1))->a2);
		T55f20(C, ((T55*)(C))->a3, t4, t1);
	}
}

/* KL_STDOUT_FILE.console_ps */
void T55f20(T0* C, T14 a1, T14 a2, T4 a3)
{
	console_ps((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
}

/* KL_STDOUT_FILE.string_ */
T0* T55f1(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* KL_TEXT_OUTPUT_FILE.put_line */
void T52f25(T0* C, T0* a1)
{
	T52f23(C, a1);
	T52f27(C);
}

/* KL_TEXT_OUTPUT_FILE.put_new_line */
void T52f27(T0* C)
{
	T52f23(C, ge392ov4446);
}

/* KL_TEXT_OUTPUT_FILE.put_string */
void T52f23(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T52f9(C));
	t1 = (T56f2(t1, a1));
	T52f31(C, t1);
}

/* KL_TEXT_OUTPUT_FILE.old_put_string */
void T52f31(T0* C, T0* a1)
{
	T0* l1 = 0;
	T4 t1;
	T2 t2;
	T118 t3;
	T14 t4;
	t1 = (((T16*)(a1))->a2);
	t2 = ((t1)!=((T4)(geint32(0))));
	if (t2) {
		l1 = (((T16*)(a1))->a1);
		t3.id = 118;
		t3.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
		t4 = (T118f2(&t3));
		t1 = (((T16*)(a1))->a2);
		T52f34(C, ((T52*)(C))->a15, t4, t1);
	}
}

/* KL_TEXT_OUTPUT_FILE.file_ps */
void T52f34(T0* C, T14 a1, T14 a2, T4 a3)
{
	file_ps((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
}

/* KL_TEXT_OUTPUT_FILE.string_ */
T0* T52f9(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_COMPRESSED_DFA.print_backing_up_report */
void T44f82p1(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T4 t2;
	l1 = ((T4)((((T44*)(C))->a8)+((T4)(geint32(1)))));
	l2 = (((T125*)(((T44*)(C))->a4))->a1);
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l3 = (T125f2(((T44*)(C))->a4, l1));
		t1 = (T120f11(l3));
		t1 = ((T2)(!(t1)));
		if (t1) {
			if ((a1)->id==52) {
				T52f23(a1, gems("State #", 7));
			} else {
				T55f10(a1, gems("State #", 7));
			}
			t2 = (((T120*)(l3))->a8);
			if ((a1)->id==52) {
				T52f26(a1, t2);
			} else {
				T55f13(a1, t2);
			}
			if ((a1)->id==52) {
				T52f23(a1, gems(" is non-accepting -\n", 20));
			} else {
				T55f10(a1, gems(" is non-accepting -\n", 20));
			}
			T44f94(C, l3, a1);
			T44f95(C, l3, a1);
			if ((a1)->id==52) {
				T52f24(a1, (T1)('\n'));
			} else {
				T55f11(a1, (T1)('\n'));
			}
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
}

/* KL_STDOUT_FILE.put_character */
void T55f11(T0* C, T1 a1)
{
	T55f17(C, a1);
}

/* KL_STDOUT_FILE.old_put_character */
void T55f17(T0* C, T1 a1)
{
	T55f21(C, ((T55*)(C))->a3, a1);
}

/* KL_STDOUT_FILE.console_pc */
void T55f21(T0* C, T14 a1, T1 a2)
{
	console_pc((FILE *)a1,( EIF_CHARACTER)a2);
}

/* KL_TEXT_OUTPUT_FILE.put_character */
void T52f24(T0* C, T1 a1)
{
	T52f32(C, a1);
}

/* KL_TEXT_OUTPUT_FILE.old_put_character */
void T52f32(T0* C, T1 a1)
{
	T52f35(C, ((T52*)(C))->a15, a1);
}

/* KL_TEXT_OUTPUT_FILE.file_pc */
void T52f35(T0* C, T14 a1, T1 a2)
{
	file_pc((FILE *)a1,( EIF_CHARACTER)a2);
}

/* LX_COMPRESSED_DFA.print_transitions */
void T44f95(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	T2 t4;
	l3 = (((T44*)(C))->a11);
	l4 = (((T120*)(a1))->a3);
	t1 = ((T4)((l3)-((T4)(geint32(1)))));
	l5 = T146c5((T4)(geint32(0)), t1);
	t2 = ((((T44*)(C))->a24)!=(EIF_VOID));
	if (t2) {
		l1 = ((T4)(geint32(1)));
		t2 = (T4f5(&l1, l3));
		while (!(t2)) {
			l2 = (T130f4(((T44*)(C))->a24, l1));
			t2 = (T144f10(l4, l2));
			if (t2) {
				t3 = (T144f3(l4, l2));
				t2 = ((t3)!=(EIF_VOID));
				T146f6(l5, t2, l1);
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t2 = (T4f5(&l1, l3));
		}
		l2 = (T130f4(((T44*)(C))->a24, l3));
		t2 = (T144f10(l4, l2));
		if (t2) {
			t3 = (T144f3(l4, l2));
			t2 = ((t3)!=(EIF_VOID));
			T146f6(l5, t2, (T4)(geint32(0)));
		}
	} else {
		l1 = ((T4)(geint32(1)));
		t2 = (T4f5(&l1, l3));
		while (!(t2)) {
			t2 = (T144f10(l4, l1));
			if (t2) {
				t3 = (T144f3(l4, l1));
				t2 = ((t3)!=(EIF_VOID));
				T146f6(l5, t2, l1);
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t2 = (T4f5(&l1, l3));
		}
		t2 = (T144f10(l4, l1));
		if (t2) {
			t3 = (T144f3(l4, l3));
			t2 = ((t3)!=(EIF_VOID));
			T146f6(l5, t2, (T4)(geint32(0)));
		}
	}
	if ((a2)->id==52) {
		T52f23(a2, gems(" out-transitions: [", 19));
	} else {
		T55f10(a2, gems(" out-transitions: [", 19));
	}
	l1 = ((T4)(geint32(0)));
	t2 = (T4f5(&l1, l3));
	while (!(t2)) {
		t2 = (T146f4(l5, l1));
		if (t2) {
			if ((a2)->id==52) {
				T52f24(a2, (T1)(' '));
			} else {
				T55f11(a2, (T1)(' '));
			}
			T44f111(C, l1, a2);
			l2 = (l1);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t2 = (T4f5(&l1, l3));
			if (!(t2)) {
				t4 = (T146f4(l5, l1));
				t2 = ((T2)(!(t4)));
			}
			while (!(t2)) {
				l1 = ((T4)((l1)+((T4)(geint32(1)))));
				t2 = (T4f5(&l1, l3));
				if (!(t2)) {
					t4 = (T146f4(l5, l1));
					t2 = ((T2)(!(t4)));
				}
			}
			t1 = ((T4)((l1)-((T4)(geint32(1)))));
			t2 = (T4f1(&t1, l2));
			if (t2) {
				if ((a2)->id==52) {
					T52f24(a2, (T1)('-'));
				} else {
					T55f11(a2, (T1)('-'));
				}
				t1 = ((T4)((l1)-((T4)(geint32(1)))));
				T44f111(C, t1, a2);
			}
			if ((a2)->id==52) {
				T52f24(a2, (T1)(' '));
			} else {
				T55f11(a2, (T1)(' '));
			}
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f5(&l1, l3));
	}
	if ((a2)->id==52) {
		T52f23(a2, gems("]\n jam-transitions: EOF [", 25));
	} else {
		T55f10(a2, gems("]\n jam-transitions: EOF [", 25));
	}
	l1 = ((T4)(geint32(0)));
	t2 = (T4f5(&l1, l3));
	while (!(t2)) {
		t2 = (T146f4(l5, l1));
		t2 = ((T2)(!(t2)));
		if (t2) {
			if ((a2)->id==52) {
				T52f24(a2, (T1)(' '));
			} else {
				T55f11(a2, (T1)(' '));
			}
			T44f111(C, l1, a2);
			l2 = (l1);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t2 = (T4f5(&l1, l3));
			if (!(t2)) {
				t2 = (T146f4(l5, l1));
			}
			while (!(t2)) {
				l1 = ((T4)((l1)+((T4)(geint32(1)))));
				t2 = (T4f5(&l1, l3));
				if (!(t2)) {
					t2 = (T146f4(l5, l1));
				}
			}
			t1 = ((T4)((l1)-((T4)(geint32(1)))));
			t2 = (T4f1(&t1, l2));
			if (t2) {
				if ((a2)->id==52) {
					T52f24(a2, (T1)('-'));
				} else {
					T55f11(a2, (T1)('-'));
				}
				t1 = ((T4)((l1)-((T4)(geint32(1)))));
				T44f111(C, t1, a2);
			}
			if ((a2)->id==52) {
				T52f24(a2, (T1)(' '));
			} else {
				T55f11(a2, (T1)(' '));
			}
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f5(&l1, l3));
	}
	if ((a2)->id==52) {
		T52f23(a2, gems("]\n", 2));
	} else {
		T55f10(a2, gems("]\n", 2));
	}
}

/* LX_COMPRESSED_DFA.print_readable_character */
void T44f111(T0* C, T4 a1, T0* a2)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	T0* t4;
	T1 t5;
	t1 = ((T2)((a1)<((T4)(geint32(32)))));
	if (!(t1)) {
		t1 = (T4f5(&a1, (T4)(geint32(127))));
	}
	if (t1) {
		switch (a1) {
		case (T4)(T4)(geint32(8)):
			if ((a2)->id==52) {
				T52f23(a2, gems("\\b", 2));
			} else {
				T55f10(a2, gems("\\b", 2));
			}
			break;
		case (T4)(T4)(geint32(12)):
			if ((a2)->id==52) {
				T52f23(a2, gems("\\f", 2));
			} else {
				T55f10(a2, gems("\\f", 2));
			}
			break;
		case (T4)(T4)(geint32(10)):
			if ((a2)->id==52) {
				T52f23(a2, gems("\\n", 2));
			} else {
				T55f10(a2, gems("\\n", 2));
			}
			break;
		case (T4)(T4)(geint32(13)):
			if ((a2)->id==52) {
				T52f23(a2, gems("\\r", 2));
			} else {
				T55f10(a2, gems("\\r", 2));
			}
			break;
		case (T4)(T4)(geint32(9)):
			if ((a2)->id==52) {
				T52f23(a2, gems("\\t", 2));
			} else {
				T55f10(a2, gems("\\t", 2));
			}
			break;
		default:
			if ((a2)->id==52) {
				T52f24(a2, (T1)('\\'));
			} else {
				T55f11(a2, (T1)('\\'));
			}
			l3 = (a1);
			t1 = ((T2)((l3)<((T4)(geint32(0)))));
			if (t1) {
				if ((a2)->id==52) {
					T52f24(a2, (T1)('-'));
				} else {
					T55f11(a2, (T1)('-'));
				}
				l3 = ((T4)(-(l3)));
			}
			l1 = (gems("", 0));
			t1 = ((l3)==((T4)(geint32(0))));
			while (!(t1)) {
				t2 = (T44f75(C));
				t3 = ((T4)((l3)%((T4)(geint32(8)))));
				t4 = (T4f13(&t3));
				l2 = (T56f6(t2, t4));
				T16f27(l2, l1);
				l1 = (l2);
				l3 = ((T4)((l3)/((T4)(geint32(8)))));
				t1 = ((l3)==((T4)(geint32(0))));
			}
			t3 = (((T16*)(l1))->a2);
			switch (t3) {
			case (T4)(T4)(geint32(0)):
				if ((a2)->id==52) {
					T52f23(a2, gems("000", 3));
				} else {
					T55f10(a2, gems("000", 3));
				}
				break;
			case (T4)(T4)(geint32(1)):
				if ((a2)->id==52) {
					T52f23(a2, gems("00", 2));
				} else {
					T55f10(a2, gems("00", 2));
				}
				break;
			case (T4)(T4)(geint32(2)):
				if ((a2)->id==52) {
					T52f24(a2, (T1)('0'));
				} else {
					T55f11(a2, (T1)('0'));
				}
				break;
			default:
				break;
			}
			if ((a2)->id==52) {
				T52f23(a2, l1);
			} else {
				T55f10(a2, l1);
			}
			break;
		}
	} else {
		t1 = ((a1)==((T4)(geint32(32))));
		if (t1) {
			if ((a2)->id==52) {
				T52f23(a2, gems("\' \'", 3));
			} else {
				T55f10(a2, gems("\' \'", 3));
			}
		} else {
			t2 = (T44f77(C));
			t5 = (T153f1(t2, a1));
			if ((a2)->id==52) {
				T52f24(a2, t5);
			} else {
				T55f11(a2, t5);
			}
		}
	}
}

/* KL_INTEGER_ROUTINES.to_character */
T1 T153f1(T0* C, T4 a1)
{
	T1 R = 0;
	R = ((T1)(a1));
	return R;
}

/* LX_COMPRESSED_DFA.integer_ */
unsigned char ge256os2363 = '\0';
T0* ge256ov2363;
T0* T44f77(T0* C)
{
	T0* R = 0;
	if (ge256os2363) {
		return ge256ov2363;
	} else {
		ge256os2363 = '\1';
	}
	R = T153c2();
	ge256ov2363 = R;
	return R;
}

/* KL_INTEGER_ROUTINES.default_create */
T0* T153c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T153));
	((T153*)(C))->id = 153;
	return C;
}

/* STRING.append_string */
void T16f27(T0* C, T0* a1)
{
	T2 t1;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		T16f31(C, a1);
	}
}

/* KL_STRING_ROUTINES.cloned_string */
T0* T56f6(T0* C, T0* a1)
{
	T0* R = 0;
	R = (T16f14(a1));
	return R;
}

/* STRING.twin */
T0* T16f14(T0* C)
{
	T0* R = 0;
	R = (T0*)gealloc(sizeof(T16));
	((T16*)(R))->id = 16;
	T16f34(R, C);
	return R;
}

/* STRING.copy */
void T16f34(T0* C, T0* a1)
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
			((T16*)(C))->a1 = (T15f4(((T16*)(C))->a1));
		} else {
			T15f9(l1, ((T16*)(C))->a1, (T4)(geint32(0)), (T4)(geint32(0)), ((T16*)(C))->a2);
			((T16*)(C))->a1 = (l1);
		}
		((T16*)(C))->a4 = ((T4)(geint32(0)));
	}
}

/* SPECIAL [CHARACTER].twin */
T0* T15f4(T0* C)
{
	T0* R = 0;
	R = (T0*)gealloc(sizeof(T15)+((T15*)(C))->a1*sizeof(T1));
	*(T15*)(R) = *(T15*)(C);
	memcpy(((T15*)(R))->a2,((T15*)(C))->a2,  ((T15*)(C))->a1*sizeof(T1));
	return R;
}

/* INTEGER.out */
T0* T4f13(T4* C)
{
	T0* R = 0;
	T4 t1;
	R = T16c25((T4)(geint32(11)));
	t1 = (*C);
	T16f28(R, t1);
	return R;
}

/* STRING.append_integer */
void T16f28(T0* C, T4 a1)
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
		T16f26(C, (T1)('0'));
	} else {
		l2 = (((T16*)(C))->a2);
		t1 = ((T2)((a1)<((T4)(geint32(0)))));
		if (t1) {
			T16f26(C, (T1)('-'));
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			l1 = ((T4)(-(a1)));
			t2 = ((T4)(geint32(-2147483647)-1));
			t1 = ((l1)==(t2));
			if (t1) {
				t2 = ((T4)((l1)%((T4)(geint32(10)))));
				t2 = ((T4)(-(t2)));
				t2 = ((T4)((t2)+((T4)(geint32(48)))));
				t3 = ((T1)(t2));
				T16f26(C, t3);
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
			T16f26(C, t3);
			l1 = ((T4)((l1)/((T4)(geint32(10)))));
			t1 = ((l1)==((T4)(geint32(0))));
		}
		l3 = ((T4)((((T16*)(C))->a2)-((T4)(geint32(1)))));
		l5 = (((T16*)(C))->a1);
		t1 = (T4f5(&l2, l3));
		while (!(t1)) {
			l4 = (((T15*)(l5))->a2[l2]);
			t3 = (((T15*)(l5))->a2[l3]);
			((T15*)(l5))->a2[l2] = (t3);
			((T15*)(l5))->a2[l3] = (l4);
			l3 = ((T4)((l3)-((T4)(geint32(1)))));
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = (T4f5(&l2, l3));
		}
	}
}

/* STRING.append_character */
void T16f26(T0* C, T1 a1)
{
	T4 l1 = 0;
	T4 t1;
	T2 t2;
	l1 = (((T16*)(C))->a2);
	t1 = (T16f5(C));
	t2 = ((l1)==(t1));
	if (t2) {
		t1 = (T16f6(C));
		t1 = ((T4)((l1)+(t1)));
		T16f30(C, t1);
	}
	((T15*)(((T16*)(C))->a1))->a2[l1] = (a1);
	((T16*)(C))->a2 = ((T4)((l1)+((T4)(geint32(1)))));
	((T16*)(C))->a4 = ((T4)(geint32(0)));
}

/* LX_COMPRESSED_DFA.string_ */
T0* T44f75(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* ARRAY [BOOLEAN].item */
T2 T146f4(T0* C, T4 a1)
{
	T2 R = 0;
	T4 t1;
	t1 = ((T4)((a1)-(((T146*)(C))->a2)));
	R = (((T145*)(((T146*)(C))->a1))->a2[t1]);
	return R;
}

/* ARRAY [BOOLEAN].put */
void T146f6(T0* C, T2 a1, T4 a2)
{
	T4 t1;
	t1 = ((T4)((a2)-(((T146*)(C))->a2)));
	((T145*)(((T146*)(C))->a1))->a2[t1] = (a1);
}

/* LX_TRANSITION_TABLE [LX_DFA_STATE].target */
T0* T144f3(T0* C, T4 a1)
{
	T0* R = 0;
	R = (T208f4(((T144*)(C))->a7, a1));
	return R;
}

/* ARRAY [LX_DFA_STATE].item */
T0* T208f4(T0* C, T4 a1)
{
	T0* R = 0;
	T4 t1;
	t1 = ((T4)((a1)-(((T208*)(C))->a2)));
	R = (((T194*)(((T208*)(C))->a1))->a2[t1]);
	return R;
}

/* LX_TRANSITION_TABLE [LX_DFA_STATE].valid_label */
T2 T144f10(T0* C, T4 a1)
{
	T2 R = 0;
	R = (T208f6(((T144*)(C))->a7, a1));
	return R;
}

/* ARRAY [LX_DFA_STATE].valid_index */
T2 T208f6(T0* C, T4 a1)
{
	T2 R = 0;
	T2 t1;
	t1 = (T4f6(&(((T208*)(C))->a2), a1));
	if (t1) {
		R = (T4f6(&a1, ((T208*)(C))->a3));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ARRAY [INTEGER].item */
T4 T130f4(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)-(((T130*)(C))->a2)));
	R = (((T71*)(((T130*)(C))->a1))->a2[t1]);
	return R;
}

/* ARRAY [BOOLEAN].make */
T0* T146c5(T4 a1, T4 a2)
{
	T2 t1;
	T4 t2;
	T0* C;
	C = (T0*)gealloc(sizeof(T146));
	((T146*)(C))->id = 146;
	((T146*)(C))->a2 = (a1);
	((T146*)(C))->a3 = (a2);
	t1 = (T4f6(&a1, a2));
	if (t1) {
		t2 = ((T4)((a2)-(a1)));
		t2 = ((T4)((t2)+((T4)(geint32(1)))));
		T146f8(C, t2);
	} else {
		T146f8(C, (T4)(geint32(0)));
	}
	return C;
}

/* ARRAY [BOOLEAN].make_area */
void T146f8(T0* C, T4 a1)
{
	((T146*)(C))->a1 = T145c3(a1);
}

/* SPECIAL [BOOLEAN].make */
T0* T145c3(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T145)+a1*sizeof(T2));
	((T145*)(C))->a1 = a1;
	((T145*)(C))->id = 145;
	return C;
}

/* LX_COMPRESSED_DFA.print_rule_line_numbers */
void T44f94(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T4 l8 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l6 = (((T120*)(a1))->a2);
	l2 = (((T122*)(l6))->a1);
	l7 = T141c11(l2);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l5 = (T122f2(l6, l1));
		l3 = (((T124*)(((T44*)(C))->a2))->a2);
		l4 = (((T124*)(((T44*)(C))->a2))->a3);
		t1 = (T4f1(&l3, l4));
		if (!(t1)) {
			t2 = (T124f5(((T44*)(C))->a2, l3));
			t2 = (((T46*)(t2))->a2);
			t1 = (T82f8(t2, l5));
		}
		while (!(t1)) {
			l3 = ((T4)((l3)+((T4)(geint32(1)))));
			t1 = (T4f1(&l3, l4));
			if (!(t1)) {
				t2 = (T124f5(((T44*)(C))->a2, l3));
				t2 = (((T46*)(t2))->a2);
				t1 = (T82f8(t2, l5));
			}
		}
		t1 = (T4f6(&l3, l4));
		if (t1) {
			t2 = (T124f5(((T44*)(C))->a2, l3));
			l8 = (((T46*)(t2))->a10);
		}
		t1 = (T141f1(l7, l8));
		t1 = ((T2)(!(t1)));
		if (t1) {
			T141f12(l7, l8);
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
	t2 = (T44f57(C));
	T141f13(l7, t2);
	if ((a2)->id==52) {
		T52f23(a2, gems(" associated rule line numbers:", 30));
	} else {
		T55f10(a2, gems(" associated rule line numbers:", 30));
	}
	l2 = (((T141*)(l7))->a2);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		t3 = ((T4)((l1)%((T4)(geint32(8)))));
		t1 = ((t3)==((T4)(geint32(1))));
		if (t1) {
			if ((a2)->id==52) {
				T52f24(a2, (T1)('\n'));
			} else {
				T55f11(a2, (T1)('\n'));
			}
		}
		if ((a2)->id==52) {
			T52f24(a2, (T1)('\t'));
		} else {
			T55f11(a2, (T1)('\t'));
		}
		t3 = (T141f3(l7, l1));
		if ((a2)->id==52) {
			T52f26(a2, t3);
		} else {
			T55f13(a2, t3);
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
	if ((a2)->id==52) {
		T52f24(a2, (T1)('\n'));
	} else {
		T55f11(a2, (T1)('\n'));
	}
}

/* DS_ARRAYED_LIST [INTEGER].item */
T4 T141f3(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T71*)(((T141*)(C))->a5))->a2[a1]);
	return R;
}

/* DS_ARRAYED_LIST [INTEGER].sort */
void T141f13(T0* C, T0* a1)
{
	T142f3(a1, C);
}

/* DS_BUBBLE_SORTER [INTEGER].sort */
void T142f3(T0* C, T0* a1)
{
	T142f4(C, a1, ((T142*)(C))->a1);
}

/* DS_BUBBLE_SORTER [INTEGER].sort_with_comparator */
void T142f4(T0* C, T0* a1, T0* a2)
{
	T2 t1;
	T4 t2;
	t1 = (T141f10(a1));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = (((T141*)(a1))->a2);
		T142f5(C, a1, a2, (T4)(geint32(1)), t2);
	}
}

/* DS_BUBBLE_SORTER [INTEGER].subsort_with_comparator */
void T142f5(T0* C, T0* a1, T0* a2, T4 a3, T4 a4)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T2 t1;
	T4 t2;
	l1 = (a4);
	t1 = (T4f6(&l1, a3));
	while (!(t1)) {
		l2 = (a3);
		t1 = (T4f5(&l2, l1));
		while (!(t1)) {
			l4 = (T141f3(a1, l2));
			t2 = ((T4)((l2)+((T4)(geint32(1)))));
			l5 = (T141f3(a1, t2));
			t1 = (T165f1(a2, l5, l4));
			if (t1) {
				T141f14(a1, l5, l2);
				t2 = ((T4)((l2)+((T4)(geint32(1)))));
				T141f14(a1, l4, t2);
				l3 = (EIF_TRUE);
			}
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = (T4f5(&l2, l1));
		}
		if (l3) {
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
			l3 = (EIF_FALSE);
		} else {
			l1 = (a3);
		}
		t1 = (T4f6(&l1, a3));
	}
}

/* DS_ARRAYED_LIST [INTEGER].replace */
void T141f14(T0* C, T4 a1, T4 a2)
{
	((T71*)(((T141*)(C))->a5))->a2[a2] = (a1);
}

/* KL_COMPARABLE_COMPARATOR [INTEGER].less_than */
T2 T165f1(T0* C, T4 a1, T4 a2)
{
	T2 R = 0;
	R = ((T2)((a1)<(a2)));
	return R;
}

/* DS_ARRAYED_LIST [INTEGER].is_empty */
T2 T141f10(T0* C)
{
	T2 R = 0;
	R = ((((T141*)(C))->a2)==((T4)(geint32(0))));
	return R;
}

/* LX_COMPRESSED_DFA.integer_sorter */
unsigned char ge102os4064 = '\0';
T0* ge102ov4064;
T0* T44f57(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	if (ge102os4064) {
		return ge102ov4064;
	} else {
		ge102os4064 = '\1';
	}
	l1 = T165c2();
	R = T142c2(l1);
	ge102ov4064 = R;
	return R;
}

/* DS_BUBBLE_SORTER [INTEGER].make */
T0* T142c2(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T142));
	((T142*)(C))->id = 142;
	((T142*)(C))->a1 = (a1);
	return C;
}

/* KL_COMPARABLE_COMPARATOR [INTEGER].make */
T0* T165c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T165));
	((T165*)(C))->id = 165;
	return C;
}

/* DS_ARRAYED_LIST [INTEGER].put_last */
void T141f12(T0* C, T4 a1)
{
	((T141*)(C))->a2 = ((T4)((((T141*)(C))->a2)+((T4)(geint32(1)))));
	((T71*)(((T141*)(C))->a5))->a2[((T141*)(C))->a2] = (a1);
}

/* DS_ARRAYED_LIST [INTEGER].has */
T2 T141f1(T0* C, T4 a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T4 t2;
	l1 = (((T141*)(C))->a2);
	l2 = (((T141*)(C))->a4);
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t1)) {
			t2 = (((T71*)(((T141*)(C))->a5))->a2[l1]);
			t1 = ((T2)gevoid(l2, t2, a1));
			if (t1) {
				R = (EIF_TRUE);
				l1 = ((T4)(geint32(0)));
			} else {
				l1 = ((T4)((l1)-((T4)(geint32(1)))));
			}
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
		}
	} else {
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t1)) {
			t2 = (((T71*)(((T141*)(C))->a5))->a2[l1]);
			t1 = ((t2)==(a1));
			if (t1) {
				R = (EIF_TRUE);
				l1 = ((T4)(geint32(0)));
			} else {
				l1 = ((T4)((l1)-((T4)(geint32(1)))));
			}
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
		}
	}
	return R;
}

/* LX_NFA.has */
T2 T82f8(T0* C, T0* a1)
{
	T2 R = 0;
	R = (T122f3(((T82*)(C))->a2, a1));
	return R;
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].has */
T2 T122f3(T0* C, T0* a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	l1 = (((T122*)(C))->a1);
	l2 = (((T122*)(C))->a7);
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t1)) {
			t2 = (((T190*)(((T122*)(C))->a6))->a2[l1]);
			t1 = ((T2)gevoid(l2, t2, a1));
			if (t1) {
				R = (EIF_TRUE);
				l1 = ((T4)(geint32(0)));
			} else {
				l1 = ((T4)((l1)-((T4)(geint32(1)))));
			}
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
		}
	} else {
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t1)) {
			t2 = (((T190*)(((T122*)(C))->a6))->a2[l1]);
			t1 = ((t2)==(a1));
			if (t1) {
				R = (EIF_TRUE);
				l1 = ((T4)(geint32(0)));
			} else {
				l1 = ((T4)((l1)-((T4)(geint32(1)))));
			}
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
		}
	}
	return R;
}

/* ARRAY [LX_RULE].item */
T0* T124f5(T0* C, T4 a1)
{
	T0* R = 0;
	T4 t1;
	t1 = ((T4)((a1)-(((T124*)(C))->a2)));
	R = (((T123*)(((T124*)(C))->a1))->a2[t1]);
	return R;
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].item */
T0* T122f2(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T190*)(((T122*)(C))->a6))->a2[a1]);
	return R;
}

/* DS_ARRAYED_LIST [INTEGER].make */
T0* T141c11(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T141));
	((T141*)(C))->id = 141;
	((T141*)(C))->a6 = T72c4();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T141*)(C))->a5 = (T72f1(((T141*)(C))->a6, t1));
	((T141*)(C))->a7 = (a1);
	((T141*)(C))->a8 = (T141f9(C));
	return C;
}

/* DS_ARRAYED_LIST [INTEGER].new_cursor */
T0* T141f9(T0* C)
{
	T0* R = 0;
	R = T177c2(C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [INTEGER].make */
T0* T177c2(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T177));
	((T177*)(C))->id = 177;
	((T177*)(C))->a1 = (a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [INTEGER].make */
T0* T72f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T174c2(a1);
	R = (((T174*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [INTEGER].make_area */
T0* T174c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T174));
	((T174*)(C))->id = 174;
	((T174*)(C))->a1 = T71c6(a1);
	return C;
}

/* SPECIAL [INTEGER].make */
T0* T71c6(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T71)+a1*sizeof(T4));
	((T71*)(C))->a1 = a1;
	((T71*)(C))->id = 71;
	return C;
}

/* KL_SPECIAL_ROUTINES [INTEGER].default_create */
T0* T72c4()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T72));
	((T72*)(C))->id = 72;
	return C;
}

/* KL_STDOUT_FILE.put_integer */
void T55f13(T0* C, T4 a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	t1 = ((a1)==((T4)(geint32(0))));
	if (t1) {
		T55f11(C, (T1)('0'));
	} else {
		t1 = ((T2)((a1)<((T4)(geint32(0)))));
		if (t1) {
			T55f11(C, (T1)('-'));
			t2 = ((T4)((a1)+((T4)(geint32(1)))));
			l1 = ((T4)(-(t2)));
			l2 = ((T4)((l1)/((T4)(geint32(10)))));
			t2 = ((T4)((l1)%((T4)(geint32(10)))));
			switch (t2) {
			case (T4)(T4)(geint32(0)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T55f13(C, l2);
				}
				T55f11(C, (T1)('1'));
				break;
			case (T4)(T4)(geint32(1)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T55f13(C, l2);
				}
				T55f11(C, (T1)('2'));
				break;
			case (T4)(T4)(geint32(2)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T55f13(C, l2);
				}
				T55f11(C, (T1)('3'));
				break;
			case (T4)(T4)(geint32(3)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T55f13(C, l2);
				}
				T55f11(C, (T1)('4'));
				break;
			case (T4)(T4)(geint32(4)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T55f13(C, l2);
				}
				T55f11(C, (T1)('5'));
				break;
			case (T4)(T4)(geint32(5)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T55f13(C, l2);
				}
				T55f11(C, (T1)('6'));
				break;
			case (T4)(T4)(geint32(6)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T55f13(C, l2);
				}
				T55f11(C, (T1)('7'));
				break;
			case (T4)(T4)(geint32(7)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T55f13(C, l2);
				}
				T55f11(C, (T1)('8'));
				break;
			case (T4)(T4)(geint32(8)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T55f13(C, l2);
				}
				T55f11(C, (T1)('9'));
				break;
			case (T4)(T4)(geint32(9)):
				t2 = ((T4)((l2)+((T4)(geint32(1)))));
				T55f13(C, t2);
				T55f11(C, (T1)('0'));
				break;
			default:
				break;
			}
		} else {
			l1 = (a1);
			l2 = ((T4)((l1)/((T4)(geint32(10)))));
			t1 = ((l2)!=((T4)(geint32(0))));
			if (t1) {
				T55f13(C, l2);
			}
			t2 = ((T4)((l1)%((T4)(geint32(10)))));
			switch (t2) {
			case (T4)(T4)(geint32(0)):
				T55f11(C, (T1)('0'));
				break;
			case (T4)(T4)(geint32(1)):
				T55f11(C, (T1)('1'));
				break;
			case (T4)(T4)(geint32(2)):
				T55f11(C, (T1)('2'));
				break;
			case (T4)(T4)(geint32(3)):
				T55f11(C, (T1)('3'));
				break;
			case (T4)(T4)(geint32(4)):
				T55f11(C, (T1)('4'));
				break;
			case (T4)(T4)(geint32(5)):
				T55f11(C, (T1)('5'));
				break;
			case (T4)(T4)(geint32(6)):
				T55f11(C, (T1)('6'));
				break;
			case (T4)(T4)(geint32(7)):
				T55f11(C, (T1)('7'));
				break;
			case (T4)(T4)(geint32(8)):
				T55f11(C, (T1)('8'));
				break;
			case (T4)(T4)(geint32(9)):
				T55f11(C, (T1)('9'));
				break;
			default:
				break;
			}
		}
	}
}

/* KL_TEXT_OUTPUT_FILE.put_integer */
void T52f26(T0* C, T4 a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	t1 = ((a1)==((T4)(geint32(0))));
	if (t1) {
		T52f24(C, (T1)('0'));
	} else {
		t1 = ((T2)((a1)<((T4)(geint32(0)))));
		if (t1) {
			T52f24(C, (T1)('-'));
			t2 = ((T4)((a1)+((T4)(geint32(1)))));
			l1 = ((T4)(-(t2)));
			l2 = ((T4)((l1)/((T4)(geint32(10)))));
			t2 = ((T4)((l1)%((T4)(geint32(10)))));
			switch (t2) {
			case (T4)(T4)(geint32(0)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T52f26(C, l2);
				}
				T52f24(C, (T1)('1'));
				break;
			case (T4)(T4)(geint32(1)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T52f26(C, l2);
				}
				T52f24(C, (T1)('2'));
				break;
			case (T4)(T4)(geint32(2)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T52f26(C, l2);
				}
				T52f24(C, (T1)('3'));
				break;
			case (T4)(T4)(geint32(3)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T52f26(C, l2);
				}
				T52f24(C, (T1)('4'));
				break;
			case (T4)(T4)(geint32(4)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T52f26(C, l2);
				}
				T52f24(C, (T1)('5'));
				break;
			case (T4)(T4)(geint32(5)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T52f26(C, l2);
				}
				T52f24(C, (T1)('6'));
				break;
			case (T4)(T4)(geint32(6)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T52f26(C, l2);
				}
				T52f24(C, (T1)('7'));
				break;
			case (T4)(T4)(geint32(7)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T52f26(C, l2);
				}
				T52f24(C, (T1)('8'));
				break;
			case (T4)(T4)(geint32(8)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T52f26(C, l2);
				}
				T52f24(C, (T1)('9'));
				break;
			case (T4)(T4)(geint32(9)):
				t2 = ((T4)((l2)+((T4)(geint32(1)))));
				T52f26(C, t2);
				T52f24(C, (T1)('0'));
				break;
			default:
				break;
			}
		} else {
			l1 = (a1);
			l2 = ((T4)((l1)/((T4)(geint32(10)))));
			t1 = ((l2)!=((T4)(geint32(0))));
			if (t1) {
				T52f26(C, l2);
			}
			t2 = ((T4)((l1)%((T4)(geint32(10)))));
			switch (t2) {
			case (T4)(T4)(geint32(0)):
				T52f24(C, (T1)('0'));
				break;
			case (T4)(T4)(geint32(1)):
				T52f24(C, (T1)('1'));
				break;
			case (T4)(T4)(geint32(2)):
				T52f24(C, (T1)('2'));
				break;
			case (T4)(T4)(geint32(3)):
				T52f24(C, (T1)('3'));
				break;
			case (T4)(T4)(geint32(4)):
				T52f24(C, (T1)('4'));
				break;
			case (T4)(T4)(geint32(5)):
				T52f24(C, (T1)('5'));
				break;
			case (T4)(T4)(geint32(6)):
				T52f24(C, (T1)('6'));
				break;
			case (T4)(T4)(geint32(7)):
				T52f24(C, (T1)('7'));
				break;
			case (T4)(T4)(geint32(8)):
				T52f24(C, (T1)('8'));
				break;
			case (T4)(T4)(geint32(9)):
				T52f24(C, (T1)('9'));
				break;
			default:
				break;
			}
		}
	}
}

/* LX_DFA_STATE.is_accepting */
T2 T120f11(T0* C)
{
	T2 R = 0;
	T2 t1;
	t1 = (T45f13(((T120*)(C))->a1));
	R = ((T2)(!(t1)));
	return R;
}

/* DS_ARRAYED_LIST [LX_RULE].is_empty */
T2 T45f13(T0* C)
{
	T2 R = 0;
	R = ((((T45*)(C))->a1)==((T4)(geint32(0))));
	return R;
}

/* DS_ARRAYED_LIST [LX_DFA_STATE].item */
T0* T125f2(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T194*)(((T125*)(C))->a5))->a2[a1]);
	return R;
}

/* LX_FULL_DFA.print_backing_up_report */
void T51f51(T0* C, T0* a1)
{
	T51f51p1(C, a1);
	switch (((T51*)(C))->a1) {
	case (T4)(T4)(geint32(0)):
		if ((a1)->id==52) {
			T52f23(a1, gems("No backing up.\n", 15));
		} else {
			T55f10(a1, gems("No backing up.\n", 15));
		}
		break;
	case (T4)(T4)(geint32(1)):
		if ((a1)->id==52) {
			T52f26(a1, ((T51*)(C))->a1);
		} else {
			T55f13(a1, ((T51*)(C))->a1);
		}
		if ((a1)->id==52) {
			T52f23(a1, gems(" backing up (non-accepting) state.\n", 35));
		} else {
			T55f10(a1, gems(" backing up (non-accepting) state.\n", 35));
		}
		break;
	default:
		if ((a1)->id==52) {
			T52f26(a1, ((T51*)(C))->a1);
		} else {
			T55f13(a1, ((T51*)(C))->a1);
		}
		if ((a1)->id==52) {
			T52f23(a1, gems(" backing up (non-accepting) states.\n", 36));
		} else {
			T55f10(a1, gems(" backing up (non-accepting) states.\n", 36));
		}
		break;
	}
}

/* LX_FULL_DFA.print_backing_up_report */
void T51f51p1(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T4 t2;
	l1 = ((T4)((((T51*)(C))->a2)+((T4)(geint32(1)))));
	l2 = (((T125*)(((T51*)(C))->a3))->a1);
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l3 = (T125f2(((T51*)(C))->a3, l1));
		t1 = (T120f11(l3));
		t1 = ((T2)(!(t1)));
		if (t1) {
			if ((a1)->id==52) {
				T52f23(a1, gems("State #", 7));
			} else {
				T55f10(a1, gems("State #", 7));
			}
			t2 = (((T120*)(l3))->a8);
			if ((a1)->id==52) {
				T52f26(a1, t2);
			} else {
				T55f13(a1, t2);
			}
			if ((a1)->id==52) {
				T52f23(a1, gems(" is non-accepting -\n", 20));
			} else {
				T55f10(a1, gems(" is non-accepting -\n", 20));
			}
			T51f63(C, l3, a1);
			T51f64(C, l3, a1);
			if ((a1)->id==52) {
				T52f24(a1, (T1)('\n'));
			} else {
				T55f11(a1, (T1)('\n'));
			}
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
}

/* LX_FULL_DFA.print_transitions */
void T51f64(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	T2 t4;
	l3 = (((T51*)(C))->a6);
	l4 = (((T120*)(a1))->a3);
	t1 = ((T4)((l3)-((T4)(geint32(1)))));
	l5 = T146c5((T4)(geint32(0)), t1);
	t2 = ((((T51*)(C))->a19)!=(EIF_VOID));
	if (t2) {
		l1 = ((T4)(geint32(1)));
		t2 = (T4f5(&l1, l3));
		while (!(t2)) {
			l2 = (T130f4(((T51*)(C))->a19, l1));
			t2 = (T144f10(l4, l2));
			if (t2) {
				t3 = (T144f3(l4, l2));
				t2 = ((t3)!=(EIF_VOID));
				T146f6(l5, t2, l1);
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t2 = (T4f5(&l1, l3));
		}
		l2 = (T130f4(((T51*)(C))->a19, l3));
		t2 = (T144f10(l4, l2));
		if (t2) {
			t3 = (T144f3(l4, l2));
			t2 = ((t3)!=(EIF_VOID));
			T146f6(l5, t2, (T4)(geint32(0)));
		}
	} else {
		l1 = ((T4)(geint32(1)));
		t2 = (T4f5(&l1, l3));
		while (!(t2)) {
			t2 = (T144f10(l4, l1));
			if (t2) {
				t3 = (T144f3(l4, l1));
				t2 = ((t3)!=(EIF_VOID));
				T146f6(l5, t2, l1);
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t2 = (T4f5(&l1, l3));
		}
		t2 = (T144f10(l4, l1));
		if (t2) {
			t3 = (T144f3(l4, l3));
			t2 = ((t3)!=(EIF_VOID));
			T146f6(l5, t2, (T4)(geint32(0)));
		}
	}
	if ((a2)->id==52) {
		T52f23(a2, gems(" out-transitions: [", 19));
	} else {
		T55f10(a2, gems(" out-transitions: [", 19));
	}
	l1 = ((T4)(geint32(0)));
	t2 = (T4f5(&l1, l3));
	while (!(t2)) {
		t2 = (T146f4(l5, l1));
		if (t2) {
			if ((a2)->id==52) {
				T52f24(a2, (T1)(' '));
			} else {
				T55f11(a2, (T1)(' '));
			}
			T51f75(C, l1, a2);
			l2 = (l1);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t2 = (T4f5(&l1, l3));
			if (!(t2)) {
				t4 = (T146f4(l5, l1));
				t2 = ((T2)(!(t4)));
			}
			while (!(t2)) {
				l1 = ((T4)((l1)+((T4)(geint32(1)))));
				t2 = (T4f5(&l1, l3));
				if (!(t2)) {
					t4 = (T146f4(l5, l1));
					t2 = ((T2)(!(t4)));
				}
			}
			t1 = ((T4)((l1)-((T4)(geint32(1)))));
			t2 = (T4f1(&t1, l2));
			if (t2) {
				if ((a2)->id==52) {
					T52f24(a2, (T1)('-'));
				} else {
					T55f11(a2, (T1)('-'));
				}
				t1 = ((T4)((l1)-((T4)(geint32(1)))));
				T51f75(C, t1, a2);
			}
			if ((a2)->id==52) {
				T52f24(a2, (T1)(' '));
			} else {
				T55f11(a2, (T1)(' '));
			}
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f5(&l1, l3));
	}
	if ((a2)->id==52) {
		T52f23(a2, gems("]\n jam-transitions: EOF [", 25));
	} else {
		T55f10(a2, gems("]\n jam-transitions: EOF [", 25));
	}
	l1 = ((T4)(geint32(0)));
	t2 = (T4f5(&l1, l3));
	while (!(t2)) {
		t2 = (T146f4(l5, l1));
		t2 = ((T2)(!(t2)));
		if (t2) {
			if ((a2)->id==52) {
				T52f24(a2, (T1)(' '));
			} else {
				T55f11(a2, (T1)(' '));
			}
			T51f75(C, l1, a2);
			l2 = (l1);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t2 = (T4f5(&l1, l3));
			if (!(t2)) {
				t2 = (T146f4(l5, l1));
			}
			while (!(t2)) {
				l1 = ((T4)((l1)+((T4)(geint32(1)))));
				t2 = (T4f5(&l1, l3));
				if (!(t2)) {
					t2 = (T146f4(l5, l1));
				}
			}
			t1 = ((T4)((l1)-((T4)(geint32(1)))));
			t2 = (T4f1(&t1, l2));
			if (t2) {
				if ((a2)->id==52) {
					T52f24(a2, (T1)('-'));
				} else {
					T55f11(a2, (T1)('-'));
				}
				t1 = ((T4)((l1)-((T4)(geint32(1)))));
				T51f75(C, t1, a2);
			}
			if ((a2)->id==52) {
				T52f24(a2, (T1)(' '));
			} else {
				T55f11(a2, (T1)(' '));
			}
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f5(&l1, l3));
	}
	if ((a2)->id==52) {
		T52f23(a2, gems("]\n", 2));
	} else {
		T55f10(a2, gems("]\n", 2));
	}
}

/* LX_FULL_DFA.print_readable_character */
void T51f75(T0* C, T4 a1, T0* a2)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	T0* t4;
	T1 t5;
	t1 = ((T2)((a1)<((T4)(geint32(32)))));
	if (!(t1)) {
		t1 = (T4f5(&a1, (T4)(geint32(127))));
	}
	if (t1) {
		switch (a1) {
		case (T4)(T4)(geint32(8)):
			if ((a2)->id==52) {
				T52f23(a2, gems("\\b", 2));
			} else {
				T55f10(a2, gems("\\b", 2));
			}
			break;
		case (T4)(T4)(geint32(12)):
			if ((a2)->id==52) {
				T52f23(a2, gems("\\f", 2));
			} else {
				T55f10(a2, gems("\\f", 2));
			}
			break;
		case (T4)(T4)(geint32(10)):
			if ((a2)->id==52) {
				T52f23(a2, gems("\\n", 2));
			} else {
				T55f10(a2, gems("\\n", 2));
			}
			break;
		case (T4)(T4)(geint32(13)):
			if ((a2)->id==52) {
				T52f23(a2, gems("\\r", 2));
			} else {
				T55f10(a2, gems("\\r", 2));
			}
			break;
		case (T4)(T4)(geint32(9)):
			if ((a2)->id==52) {
				T52f23(a2, gems("\\t", 2));
			} else {
				T55f10(a2, gems("\\t", 2));
			}
			break;
		default:
			if ((a2)->id==52) {
				T52f24(a2, (T1)('\\'));
			} else {
				T55f11(a2, (T1)('\\'));
			}
			l3 = (a1);
			t1 = ((T2)((l3)<((T4)(geint32(0)))));
			if (t1) {
				if ((a2)->id==52) {
					T52f24(a2, (T1)('-'));
				} else {
					T55f11(a2, (T1)('-'));
				}
				l3 = ((T4)(-(l3)));
			}
			l1 = (gems("", 0));
			t1 = ((l3)==((T4)(geint32(0))));
			while (!(t1)) {
				t2 = (T51f46(C));
				t3 = ((T4)((l3)%((T4)(geint32(8)))));
				t4 = (T4f13(&t3));
				l2 = (T56f6(t2, t4));
				T16f27(l2, l1);
				l1 = (l2);
				l3 = ((T4)((l3)/((T4)(geint32(8)))));
				t1 = ((l3)==((T4)(geint32(0))));
			}
			t3 = (((T16*)(l1))->a2);
			switch (t3) {
			case (T4)(T4)(geint32(0)):
				if ((a2)->id==52) {
					T52f23(a2, gems("000", 3));
				} else {
					T55f10(a2, gems("000", 3));
				}
				break;
			case (T4)(T4)(geint32(1)):
				if ((a2)->id==52) {
					T52f23(a2, gems("00", 2));
				} else {
					T55f10(a2, gems("00", 2));
				}
				break;
			case (T4)(T4)(geint32(2)):
				if ((a2)->id==52) {
					T52f24(a2, (T1)('0'));
				} else {
					T55f11(a2, (T1)('0'));
				}
				break;
			default:
				break;
			}
			if ((a2)->id==52) {
				T52f23(a2, l1);
			} else {
				T55f10(a2, l1);
			}
			break;
		}
	} else {
		t1 = ((a1)==((T4)(geint32(32))));
		if (t1) {
			if ((a2)->id==52) {
				T52f23(a2, gems("\' \'", 3));
			} else {
				T55f10(a2, gems("\' \'", 3));
			}
		} else {
			t2 = (T51f48(C));
			t5 = (T153f1(t2, a1));
			if ((a2)->id==52) {
				T52f24(a2, t5);
			} else {
				T55f11(a2, t5);
			}
		}
	}
}

/* LX_FULL_DFA.integer_ */
T0* T51f48(T0* C)
{
	T0* R = 0;
	if (ge256os2363) {
		return ge256ov2363;
	} else {
		ge256os2363 = '\1';
	}
	R = T153c2();
	ge256ov2363 = R;
	return R;
}

/* LX_FULL_DFA.string_ */
T0* T51f46(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_FULL_DFA.print_rule_line_numbers */
void T51f63(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T4 l8 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l6 = (((T120*)(a1))->a2);
	l2 = (((T122*)(l6))->a1);
	l7 = T141c11(l2);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l5 = (T122f2(l6, l1));
		l3 = (((T124*)(((T51*)(C))->a22))->a2);
		l4 = (((T124*)(((T51*)(C))->a22))->a3);
		t1 = (T4f1(&l3, l4));
		if (!(t1)) {
			t2 = (T124f5(((T51*)(C))->a22, l3));
			t2 = (((T46*)(t2))->a2);
			t1 = (T82f8(t2, l5));
		}
		while (!(t1)) {
			l3 = ((T4)((l3)+((T4)(geint32(1)))));
			t1 = (T4f1(&l3, l4));
			if (!(t1)) {
				t2 = (T124f5(((T51*)(C))->a22, l3));
				t2 = (((T46*)(t2))->a2);
				t1 = (T82f8(t2, l5));
			}
		}
		t1 = (T4f6(&l3, l4));
		if (t1) {
			t2 = (T124f5(((T51*)(C))->a22, l3));
			l8 = (((T46*)(t2))->a10);
		}
		t1 = (T141f1(l7, l8));
		t1 = ((T2)(!(t1)));
		if (t1) {
			T141f12(l7, l8);
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
	t2 = (T51f36(C));
	T141f13(l7, t2);
	if ((a2)->id==52) {
		T52f23(a2, gems(" associated rule line numbers:", 30));
	} else {
		T55f10(a2, gems(" associated rule line numbers:", 30));
	}
	l2 = (((T141*)(l7))->a2);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		t3 = ((T4)((l1)%((T4)(geint32(8)))));
		t1 = ((t3)==((T4)(geint32(1))));
		if (t1) {
			if ((a2)->id==52) {
				T52f24(a2, (T1)('\n'));
			} else {
				T55f11(a2, (T1)('\n'));
			}
		}
		if ((a2)->id==52) {
			T52f24(a2, (T1)('\t'));
		} else {
			T55f11(a2, (T1)('\t'));
		}
		t3 = (T141f3(l7, l1));
		if ((a2)->id==52) {
			T52f26(a2, t3);
		} else {
			T55f13(a2, t3);
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
	if ((a2)->id==52) {
		T52f24(a2, (T1)('\n'));
	} else {
		T55f11(a2, (T1)('\n'));
	}
}

/* LX_FULL_DFA.integer_sorter */
T0* T51f36(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	if (ge102os4064) {
		return ge102ov4064;
	} else {
		ge102os4064 = '\1';
	}
	l1 = T165c2();
	R = T142c2(l1);
	ge102ov4064 = R;
	return R;
}

/* KL_TEXT_OUTPUT_FILE.is_open_write */
T2 T52f1(T0* C)
{
	T2 R = 0;
	R = (T52f2(C));
	return R;
}

/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
T2 T52f2(T0* C)
{
	T2 R = 0;
	T2 t1;
	t1 = ((((T52*)(C))->a3)==((T4)(geint32(2))));
	if (!(t1)) {
		t1 = ((((T52*)(C))->a3)==((T4)(geint32(4))));
	}
	if (!(t1)) {
		t1 = ((((T52*)(C))->a3)==((T4)(geint32(5))));
	}
	if (!(t1)) {
		R = ((((T52*)(C))->a3)==((T4)(geint32(3))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* KL_TEXT_OUTPUT_FILE.open_write */
void T52f21(T0* C)
{
	T2 l1 = 0;
	T2 t1;
	t1 = ((T2)(!(l1)));
	if (t1) {
		t1 = ((((T52*)(C))->a11)!=(ge362ov2937));
		if (t1) {
			T52f29(C);
		}
	} else {
		t1 = (T52f12(C));
		t1 = ((T2)(!(t1)));
		if (t1) {
			T52f22(C);
		}
	}
}

/* KL_TEXT_OUTPUT_FILE.is_closed */
T2 T52f12(T0* C)
{
	T2 R = 0;
	R = (T52f19(C));
	return R;
}

/* KL_TEXT_OUTPUT_FILE.old_is_closed */
T2 T52f19(T0* C)
{
	T2 R = 0;
	R = ((((T52*)(C))->a3)==((T4)(geint32(0))));
	return R;
}

/* KL_TEXT_OUTPUT_FILE.old_open_write */
void T52f29(T0* C)
{
	T14 t1;
	T2 t2;
	T52f29p1(C);
	t1 = (T52f16(C));
	t2 = ((((T52*)(C))->a15)==(t1));
	if (t2) {
		((T52*)(C))->a3 = ((T4)(geint32(0)));
		((T52*)(C))->a17 = (EIF_FALSE);
	}
}

/* KL_TEXT_OUTPUT_FILE.default_pointer */
T14 T52f16(T0* C)
{
	T14 R = 0;
	return R;
}

/* KL_TEXT_OUTPUT_FILE.open_write */
void T52f29p1(T0* C)
{
	T0* l1 = 0;
	T118 t1;
	T14 t2;
	l1 = (T16f3(((T52*)(C))->a11));
	t1.id = 118;
	t1.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
	t2 = (T118f2(&t1));
	((T52*)(C))->a15 = (T52f18(C, t2, (T4)(geint32(1))));
	((T52*)(C))->a3 = ((T4)(geint32(2)));
}

/* KL_TEXT_OUTPUT_FILE.file_open */
T14 T52f18(T0* C, T14 a1, T4 a2)
{
	T14 R = 0;
	R = (T14)( EIF_POINTER )file_open((char *)a1,( int)a2);
	return R;
}

/* STRING.to_c */
T0* T16f3(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = (((T16*)(C))->a1);
	((T15*)(l1))->a2[((T16*)(C))->a2] = ((T1)('\000'));
	R = (l1);
	return R;
}

/* KL_TEXT_OUTPUT_FILE.make */
T0* T52c20(T0* a1)
{
	T4 t1;
	T2 t2;
	T0* t3;
	T0* C;
	C = (T0*)gealloc(sizeof(T52));
	((T52*)(C))->id = 52;
	((T52*)(C))->a8 = (a1);
	t1 = (((T16*)(a1))->a2);
	t2 = (T4f1(&t1, (T4)(geint32(0))));
	if (t2) {
		t3 = (T52f9(C));
		t3 = (T56f2(t3, a1));
		T52f28(C, t3);
	} else {
		T52f28(C, ge362ov2937);
	}
	return C;
}

/* KL_TEXT_OUTPUT_FILE.old_make */
void T52f28(T0* C, T0* a1)
{
	((T52*)(C))->a11 = (a1);
	((T52*)(C))->a3 = ((T4)(geint32(0)));
}

/* GELEX.print_scanner */
void T18f11(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	l1 = (((T22*)(((T18*)(C))->a3))->a7);
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		l2 = T52c20(l1);
		T52f21(l2);
		t1 = (T52f1(l2));
		if (t1) {
			if ((((T18*)(C))->a6)->id==51) {
				T51f50(((T18*)(C))->a6, l2);
			} else {
				T44f81(((T18*)(C))->a6, l2);
			}
			T52f22(l2);
		} else {
			l3 = T53c7(l1);
			T21f7(((T18*)(C))->a2, l3);
			t2 = (T18f4(C));
			T41f2(t2, (T4)(geint32(1)));
		}
	} else {
		t2 = (T18f5(C));
		t2 = (T42f2(t2));
		if ((((T18*)(C))->a6)->id==51) {
			T51f50(((T18*)(C))->a6, t2);
		} else {
			T44f81(((T18*)(C))->a6, t2);
		}
	}
}

/* LX_COMPRESSED_DFA.print_scanner */
void T44f81(T0* C, T0* a1)
{
	T44f86(C, a1);
	if ((a1)->id==52) {
		T52f23(a1, gems("\nfeature -- Status report\n\n", 27));
	} else {
		T55f10(a1, gems("\nfeature -- Status report\n\n", 27));
	}
	T44f87(C, a1);
	if ((a1)->id==52) {
		T52f23(a1, gems("\nfeature {NONE} -- Implementation\n\n", 35));
	} else {
		T55f10(a1, gems("\nfeature {NONE} -- Implementation\n\n", 35));
	}
	T44f88(C, a1);
	if ((a1)->id==52) {
		T52f24(a1, (T1)('\n'));
	} else {
		T55f11(a1, (T1)('\n'));
	}
	T44f89(C, a1);
	if ((a1)->id==52) {
		T52f24(a1, (T1)('\n'));
	} else {
		T55f11(a1, (T1)('\n'));
	}
	T44f90(C, a1);
	if ((a1)->id==52) {
		T52f23(a1, gems("\nfeature {NONE} -- Table templates\n\n", 36));
	} else {
		T55f10(a1, gems("\nfeature {NONE} -- Table templates\n\n", 36));
	}
	T44f91(C, a1);
	if ((a1)->id==52) {
		T52f23(a1, gems("\nfeature {NONE} -- Constants\n\n", 30));
	} else {
		T55f10(a1, gems("\nfeature {NONE} -- Constants\n\n", 30));
	}
	T44f92(C, a1);
	if ((a1)->id==52) {
		T52f23(a1, gems("\nfeature -- User-defined features\n\n", 35));
	} else {
		T55f10(a1, gems("\nfeature -- User-defined features\n\n", 35));
	}
	T44f93(C, a1);
}

/* LX_COMPRESSED_DFA.print_eiffel_code */
void T44f93(T0* C, T0* a1)
{
	T2 t1;
	t1 = ((((T44*)(C))->a15)!=(EIF_VOID));
	if (t1) {
		if ((a1)->id==52) {
			T52f23(a1, ((T44*)(C))->a15);
		} else {
			T55f10(a1, ((T44*)(C))->a15);
		}
	}
}

/* LX_COMPRESSED_DFA.print_constants */
void T44f92(T0* C, T0* a1)
{
	T0* t1;
	T2 t2;
	if ((a1)->id==52) {
		T52f23(a1, gems("\tyyJam_base: INTEGER is ", 24));
	} else {
		T55f10(a1, gems("\tyyJam_base: INTEGER is ", 24));
	}
	if ((a1)->id==52) {
		T52f26(a1, ((T44*)(C))->a53);
	} else {
		T55f13(a1, ((T44*)(C))->a53);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\n\t\t\t-- Position in `yy_nxt\'/`yy_chk\' tables\n\t\t\t-- where default jam table starts\n\n\tyyJam_state: INTEGER is ", 107));
	} else {
		T55f10(a1, gems("\n\t\t\t-- Position in `yy_nxt\'/`yy_chk\' tables\n\t\t\t-- where default jam table starts\n\n\tyyJam_state: INTEGER is ", 107));
	}
	if ((a1)->id==52) {
		T52f26(a1, ((T44*)(C))->a54);
	} else {
		T55f13(a1, ((T44*)(C))->a54);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\n\t\t\t-- State id corresponding to jam state\n\n\tyyTemplate_mark: INTEGER is ", 73));
	} else {
		T55f10(a1, gems("\n\t\t\t-- State id corresponding to jam state\n\n\tyyTemplate_mark: INTEGER is ", 73));
	}
	if ((a1)->id==52) {
		T52f26(a1, ((T44*)(C))->a55);
	} else {
		T55f13(a1, ((T44*)(C))->a55);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\n\t\t\t-- Mark between normal states and templates\n\n\tyyNull_equiv_class: INTEGER is ", 81));
	} else {
		T55f10(a1, gems("\n\t\t\t-- Mark between normal states and templates\n\n\tyyNull_equiv_class: INTEGER is ", 81));
	}
	if ((a1)->id==52) {
		T52f26(a1, ((T44*)(C))->a25);
	} else {
		T55f13(a1, ((T44*)(C))->a25);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\n\t\t\t-- Equivalence code for NULL character\n\n\tyyReject_used: BOOLEAN is ", 71));
	} else {
		T55f10(a1, gems("\n\t\t\t-- Equivalence code for NULL character\n\n\tyyReject_used: BOOLEAN is ", 71));
	}
	t1 = (T44f56(C));
	T140f4(t1, a1, ((T44*)(C))->a6);
	if ((a1)->id==52) {
		T52f23(a1, gems("\n\t\t\t-- Is `reject\' called\?\n\n\tyyVariable_trail_context: BOOLEAN is ", 66));
	} else {
		T55f10(a1, gems("\n\t\t\t-- Is `reject\' called\?\n\n\tyyVariable_trail_context: BOOLEAN is ", 66));
	}
	t1 = (T44f56(C));
	T140f4(t1, a1, ((T44*)(C))->a3);
	if ((a1)->id==52) {
		T52f23(a1, gems("\n\t\t\t-- Is there a regular expression with\n\t\t\t-- both leading and trailing parts having\n\t\t\t-- variable length\?\n\n\tyyReject_or_variable_trail_context: BOOLEAN is ", 159));
	} else {
		T55f10(a1, gems("\n\t\t\t-- Is there a regular expression with\n\t\t\t-- both leading and trailing parts having\n\t\t\t-- variable length\?\n\n\tyyReject_or_variable_trail_context: BOOLEAN is ", 159));
	}
	t1 = (T44f56(C));
	if (!(((T44*)(C))->a6)) {
		t2 = (((T44*)(C))->a3);
	} else {
		t2 = EIF_TRUE;
	}
	T140f4(t1, a1, t2);
	if ((a1)->id==52) {
		T52f23(a1, gems("\n\t\t\t-- Is `reject\' called or is there a\n\t\t\t-- regular expression with both leading\n\t\t\t-- and trailing parts having variable length\?\n\n", 133));
	} else {
		T55f10(a1, gems("\n\t\t\t-- Is `reject\' called or is there a\n\t\t\t-- regular expression with both leading\n\t\t\t-- and trailing parts having variable length\?\n\n", 133));
	}
	T44f92p1(C, a1);
}

/* LX_COMPRESSED_DFA.print_constants */
void T44f92p1(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* t1;
	T2 t2;
	if ((a1)->id==52) {
		T52f23(a1, gems("\tyyNb_rules: INTEGER is ", 24));
	} else {
		T55f10(a1, gems("\tyyNb_rules: INTEGER is ", 24));
	}
	if ((a1)->id==52) {
		T52f26(a1, ((T44*)(C))->a26);
	} else {
		T55f13(a1, ((T44*)(C))->a26);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\n\t\t\t-- Number of rules\n\n\tyyEnd_of_buffer: INTEGER is ", 53));
	} else {
		T55f10(a1, gems("\n\t\t\t-- Number of rules\n\n\tyyEnd_of_buffer: INTEGER is ", 53));
	}
	if ((a1)->id==52) {
		T52f26(a1, ((T44*)(C))->a27);
	} else {
		T55f13(a1, ((T44*)(C))->a27);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\n\t\t\t-- End of buffer rule code\n\n\tyyLine_used: BOOLEAN is ", 57));
	} else {
		T55f10(a1, gems("\n\t\t\t-- End of buffer rule code\n\n\tyyLine_used: BOOLEAN is ", 57));
	}
	t1 = (T44f56(C));
	T140f4(t1, a1, ((T44*)(C))->a28);
	if ((a1)->id==52) {
		T52f23(a1, gems("\n\t\t\t-- Are line and column numbers used\?\n\n\tyyPosition_used: BOOLEAN is ", 71));
	} else {
		T55f10(a1, gems("\n\t\t\t-- Are line and column numbers used\?\n\n\tyyPosition_used: BOOLEAN is ", 71));
	}
	t1 = (T44f56(C));
	T140f4(t1, a1, ((T44*)(C))->a29);
	if ((a1)->id==52) {
		T52f23(a1, gems("\n\t\t\t-- Is `position\' used\?\n\n", 28));
	} else {
		T55f10(a1, gems("\n\t\t\t-- Is `position\' used\?\n\n", 28));
	}
	l2 = (((T119*)(((T44*)(C))->a23))->a3);
	l1 = (((T119*)(((T44*)(C))->a23))->a2);
	t2 = (T4f1(&l1, l2));
	while (!(t2)) {
		if ((a1)->id==52) {
			T52f24(a1, (T1)('\t'));
		} else {
			T55f11(a1, (T1)('\t'));
		}
		t1 = (T119f5(((T44*)(C))->a23, l1));
		if ((a1)->id==52) {
			T52f23(a1, t1);
		} else {
			T55f10(a1, t1);
		}
		if ((a1)->id==52) {
			T52f23(a1, gems(": INTEGER is ", 13));
		} else {
			T55f10(a1, gems(": INTEGER is ", 13));
		}
		if ((a1)->id==52) {
			T52f26(a1, l1);
		} else {
			T55f13(a1, l1);
		}
		if ((a1)->id==52) {
			T52f24(a1, (T1)('\n'));
		} else {
			T55f11(a1, (T1)('\n'));
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f1(&l1, l2));
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\t\t\t-- Start condition codes\n", 28));
	} else {
		T55f10(a1, gems("\t\t\t-- Start condition codes\n", 28));
	}
}

/* ARRAY [STRING].item */
T0* T119f5(T0* C, T4 a1)
{
	T0* R = 0;
	T4 t1;
	t1 = ((T4)((a1)-(((T119*)(C))->a2)));
	R = (((T77*)(((T119*)(C))->a1))->a2[t1]);
	return R;
}

/* UT_BOOLEAN_FORMATTER.put_eiffel_boolean */
void T140f4(T0* C, T0* a1, T2 a2)
{
	if (a2) {
		if ((a1)->id==52) {
			T52f23(a1, ge218ov5893);
		} else {
			T55f10(a1, ge218ov5893);
		}
	} else {
		if ((a1)->id==52) {
			T52f23(a1, ge218ov5894);
		} else {
			T55f10(a1, ge218ov5894);
		}
	}
}

/* LX_COMPRESSED_DFA.boolean_formatter_ */
unsigned char ge220os4099 = '\0';
T0* ge220ov4099;
T0* T44f56(T0* C)
{
	T0* R = 0;
	if (ge220os4099) {
		return ge220ov4099;
	} else {
		ge220os4099 = '\1';
	}
	R = T140c3();
	ge220ov4099 = R;
	return R;
}

/* UT_BOOLEAN_FORMATTER.default_create */
T0* T140c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T140));
	((T140*)(C))->id = 140;
	return C;
}

/* LX_COMPRESSED_DFA.print_eiffel_tables */
void T44f91(T0* C, T0* a1)
{
	T2 t1;
	T44f110(C, gems("yy_nxt_template", 15), ((T44*)(C))->a41, a1);
	if ((a1)->id==52) {
		T52f24(a1, (T1)('\n'));
	} else {
		T55f11(a1, (T1)('\n'));
	}
	T44f110(C, gems("yy_chk_template", 15), ((T44*)(C))->a43, a1);
	if ((a1)->id==52) {
		T52f24(a1, (T1)('\n'));
	} else {
		T55f11(a1, (T1)('\n'));
	}
	T44f110(C, gems("yy_base_template", 16), ((T44*)(C))->a44, a1);
	if ((a1)->id==52) {
		T52f24(a1, (T1)('\n'));
	} else {
		T55f11(a1, (T1)('\n'));
	}
	T44f110(C, gems("yy_def_template", 15), ((T44*)(C))->a45, a1);
	t1 = ((((T44*)(C))->a24)!=(EIF_VOID));
	if (t1) {
		if ((a1)->id==52) {
			T52f24(a1, (T1)('\n'));
		} else {
			T55f11(a1, (T1)('\n'));
		}
		T44f110(C, gems("yy_ec_template", 14), ((T44*)(C))->a24, a1);
	}
	t1 = ((((T44*)(C))->a49)!=(EIF_VOID));
	if (t1) {
		if ((a1)->id==52) {
			T52f24(a1, (T1)('\n'));
		} else {
			T55f11(a1, (T1)('\n'));
		}
		T44f110(C, gems("yy_meta_template", 16), ((T44*)(C))->a49, a1);
	}
	if ((a1)->id==52) {
		T52f24(a1, (T1)('\n'));
	} else {
		T55f11(a1, (T1)('\n'));
	}
	T44f110(C, gems("yy_accept_template", 18), ((T44*)(C))->a52, a1);
	t1 = ((((T44*)(C))->a50)!=(EIF_VOID));
	if (t1) {
		if ((a1)->id==52) {
			T52f24(a1, (T1)('\n'));
		} else {
			T55f11(a1, (T1)('\n'));
		}
		T44f110(C, gems("yy_acclist_template", 19), ((T44*)(C))->a50, a1);
	}
}

/* LX_COMPRESSED_DFA.print_eiffel_array */
void T44f110(T0* C, T0* a1, T0* a2, T0* a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	T4 t4;
	if ((a3)->id==52) {
		T52f24(a3, (T1)('\t'));
	} else {
		T55f11(a3, (T1)('\t'));
	}
	if ((a3)->id==52) {
		T52f23(a3, a1);
	} else {
		T55f10(a3, a1);
	}
	if ((a3)->id==52) {
		T52f23(a3, gems(": SPECIAL [INTEGER] is\n", 23));
	} else {
		T55f10(a3, gems(": SPECIAL [INTEGER] is\n", 23));
	}
	t1 = ((((T44*)(C))->a12)==((T4)(geint32(0))));
	if (t1) {
		l4 = ((T4)(geint32(1)));
	} else {
		t2 = (T130f5(a2));
		t2 = ((T4)((t2)/(((T44*)(C))->a12)));
		l4 = ((T4)((t2)+((T4)(geint32(1)))));
	}
	t1 = ((l4)==((T4)(geint32(1))));
	if (t1) {
		if ((a3)->id==52) {
			T52f23(a3, gems("\t\tonce\n\t\t\tResult := yy_fixed_array (<<\n", 39));
		} else {
			T55f10(a3, gems("\t\tonce\n\t\t\tResult := yy_fixed_array (<<\n", 39));
		}
		t3 = (T44f69(C));
		t2 = (((T130*)(a2))->a2);
		t4 = (((T130*)(a2))->a3);
		T152f8(t3, a3, a2, t2, t4);
		if ((a3)->id==52) {
			T52f23(a3, gems(", yy_Dummy>>)\n\t\tend\n", 20));
		} else {
			T55f10(a3, gems(", yy_Dummy>>)\n\t\tend\n", 20));
		}
	} else {
		if ((a3)->id==52) {
			T52f23(a3, gems("\t\tlocal\n\t\t\tan_array: ARRAY [INTEGER]\n\t\tonce\n\t\t\tcreate an_array.make (", 69));
		} else {
			T55f10(a3, gems("\t\tlocal\n\t\t\tan_array: ARRAY [INTEGER]\n\t\tonce\n\t\t\tcreate an_array.make (", 69));
		}
		t2 = (((T130*)(a2))->a2);
		if ((a3)->id==52) {
			T52f26(a3, t2);
		} else {
			T55f13(a3, t2);
		}
		if ((a3)->id==52) {
			T52f23(a3, gems(", ", 2));
		} else {
			T55f10(a3, gems(", ", 2));
		}
		t2 = (((T130*)(a2))->a3);
		if ((a3)->id==52) {
			T52f26(a3, t2);
		} else {
			T55f13(a3, t2);
		}
		if ((a3)->id==52) {
			T52f23(a3, gems(")\n", 2));
		} else {
			T55f10(a3, gems(")\n", 2));
		}
		l2 = ((T4)(geint32(1)));
		t1 = (T4f1(&l2, l4));
		while (!(t1)) {
			if ((a3)->id==52) {
				T52f23(a3, ge102ov4063);
			} else {
				T55f10(a3, ge102ov4063);
			}
			if ((a3)->id==52) {
				T52f23(a3, a1);
			} else {
				T55f10(a3, a1);
			}
			if ((a3)->id==52) {
				T52f24(a3, (T1)('_'));
			} else {
				T55f11(a3, (T1)('_'));
			}
			if ((a3)->id==52) {
				T52f26(a3, l2);
			} else {
				T55f13(a3, l2);
			}
			if ((a3)->id==52) {
				T52f23(a3, gems(" (an_array)\n", 12));
			} else {
				T55f10(a3, gems(" (an_array)\n", 12));
			}
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = (T4f1(&l2, l4));
		}
		if ((a3)->id==52) {
			T52f23(a3, gems("\t\t\tResult := yy_fixed_array (an_array)\n\t\tend\n", 45));
		} else {
			T55f10(a3, gems("\t\t\tResult := yy_fixed_array (an_array)\n\t\tend\n", 45));
		}
		l2 = ((T4)(geint32(1)));
		l1 = (((T130*)(a2))->a2);
		l5 = (((T130*)(a2))->a3);
		t1 = (T4f1(&l2, l4));
		while (!(t1)) {
			if ((a3)->id==52) {
				T52f23(a3, gems("\n\t", 2));
			} else {
				T55f10(a3, gems("\n\t", 2));
			}
			if ((a3)->id==52) {
				T52f23(a3, a1);
			} else {
				T55f10(a3, a1);
			}
			if ((a3)->id==52) {
				T52f24(a3, (T1)('_'));
			} else {
				T55f11(a3, (T1)('_'));
			}
			if ((a3)->id==52) {
				T52f26(a3, l2);
			} else {
				T55f13(a3, l2);
			}
			if ((a3)->id==52) {
				T52f23(a3, gems(" (an_array: ARRAY [INTEGER]) is\n\t\tdo\n\t\t\tyy_array_subcopy (an_array, <<\n", 71));
			} else {
				T55f10(a3, gems(" (an_array: ARRAY [INTEGER]) is\n\t\tdo\n\t\t\tyy_array_subcopy (an_array, <<\n", 71));
			}
			t2 = ((T4)((l1)+(((T44*)(C))->a12)));
			t2 = ((T4)((t2)-((T4)(geint32(1)))));
			l3 = (T4f12(&l5, t2));
			t3 = (T44f69(C));
			T152f8(t3, a3, a2, l1, l3);
			if ((a3)->id==52) {
				T52f23(a3, gems(", yy_Dummy>>,\n\t\t\t", 17));
			} else {
				T55f10(a3, gems(", yy_Dummy>>,\n\t\t\t", 17));
			}
			if ((a3)->id==52) {
				T52f26(a3, (T4)(geint32(1)));
			} else {
				T55f13(a3, (T4)(geint32(1)));
			}
			if ((a3)->id==52) {
				T52f23(a3, gems(", ", 2));
			} else {
				T55f10(a3, gems(", ", 2));
			}
			t2 = ((T4)((l3)-(l1)));
			t2 = ((T4)((t2)+((T4)(geint32(1)))));
			if ((a3)->id==52) {
				T52f26(a3, t2);
			} else {
				T55f13(a3, t2);
			}
			if ((a3)->id==52) {
				T52f23(a3, gems(", ", 2));
			} else {
				T55f10(a3, gems(", ", 2));
			}
			if ((a3)->id==52) {
				T52f26(a3, l1);
			} else {
				T55f13(a3, l1);
			}
			if ((a3)->id==52) {
				T52f23(a3, gems(")\n\t\tend\n", 8));
			} else {
				T55f10(a3, gems(")\n\t\tend\n", 8));
			}
			l1 = ((T4)((l3)+((T4)(geint32(1)))));
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = (T4f1(&l2, l4));
		}
	}
}

/* INTEGER.min */
T4 T4f12(T4* C, T4 a1)
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

/* UT_ARRAY_FORMATTER.put_integer_array */
void T152f8(T0* C, T0* a1, T0* a2, T4 a3, T4 a4)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	if ((a1)->id==52) {
		T52f23(a1, ge217ov5906);
	} else {
		T55f10(a1, ge217ov5906);
	}
	l3 = ((T4)(geint32(1)));
	l1 = (a3);
	t1 = (T4f1(&l1, a4));
	while (!(t1)) {
		l4 = ((T4)((l4)+((T4)(geint32(1)))));
		t1 = (T4f1(&l4, (T4)(geint32(10))));
		if (t1) {
			if ((a1)->id==52) {
				T52f27(a1);
			} else {
				T55f14(a1);
			}
			l4 = ((T4)(geint32(1)));
			l3 = ((T4)((l3)+((T4)(geint32(1)))));
			t1 = (T4f1(&l3, (T4)(geint32(10))));
			if (t1) {
				if ((a1)->id==52) {
					T52f27(a1);
				} else {
					T55f14(a1);
				}
				l3 = ((T4)(geint32(1)));
			}
			if ((a1)->id==52) {
				T52f23(a1, ge217ov5906);
			} else {
				T55f10(a1, ge217ov5906);
			}
		}
		l2 = (T130f4(a2, l1));
		t2 = (T4f13(&l2));
		t3 = (((T16*)(t2))->a2);
		switch (t3) {
		case (T4)(T4)(geint32(1)):
			if ((a1)->id==52) {
				T52f23(a1, ge217ov5905);
			} else {
				T55f10(a1, ge217ov5905);
			}
			break;
		case (T4)(T4)(geint32(2)):
			if ((a1)->id==52) {
				T52f23(a1, ge217ov5904);
			} else {
				T55f10(a1, ge217ov5904);
			}
			break;
		case (T4)(T4)(geint32(3)):
			if ((a1)->id==52) {
				T52f23(a1, ge217ov5903);
			} else {
				T55f10(a1, ge217ov5903);
			}
			break;
		default:
			if ((a1)->id==52) {
				T52f24(a1, (T1)(' '));
			} else {
				T55f11(a1, (T1)(' '));
			}
			break;
		}
		if ((a1)->id==52) {
			T52f26(a1, l2);
		} else {
			T55f13(a1, l2);
		}
		t1 = ((T2)((l1)<(a4)));
		if (t1) {
			if ((a1)->id==52) {
				T52f24(a1, (T1)(','));
			} else {
				T55f11(a1, (T1)(','));
			}
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, a4));
	}
}

/* LX_COMPRESSED_DFA.array_formatter_ */
unsigned char ge220os4101 = '\0';
T0* ge220ov4101;
T0* T44f69(T0* C)
{
	T0* R = 0;
	if (ge220os4101) {
		return ge220ov4101;
	} else {
		ge220os4101 = '\1';
	}
	R = T152c7();
	ge220ov4101 = R;
	return R;
}

/* UT_ARRAY_FORMATTER.default_create */
T0* T152c7()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T152));
	((T152*)(C))->id = 152;
	return C;
}

/* ARRAY [INTEGER].count */
T4 T130f5(T0* C)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((((T130*)(C))->a3)-(((T130*)(C))->a2)));
	R = ((T4)((t1)+((T4)(geint32(1)))));
	return R;
}

/* LX_COMPRESSED_DFA.print_eof_actions */
void T44f90(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T4 l6 = 0;
	T4 l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T0* l10 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	if ((a1)->id==52) {
		T52f23(a1, gems("\tyy_execute_eof_action (yy_sc: INTEGER) is\n\t\t\t-- Execute EOF semantic action.\n\t\tdo\n", 83));
	} else {
		T55f10(a1, gems("\tyy_execute_eof_action (yy_sc: INTEGER) is\n\t\t\t-- Execute EOF semantic action.\n\t\tdo\n", 83));
	}
	if (((T44*)(C))->a20) {
		if ((a1)->id==52) {
			T52f23(a1, gems("\t\t\tpre_eof_action\n", 18));
		} else {
			T55f10(a1, gems("\t\t\tpre_eof_action\n", 18));
		}
	}
	l1 = (((T124*)(((T44*)(C))->a51))->a2);
	l2 = (((T124*)(((T44*)(C))->a51))->a3);
	t1 = (T124f4(((T44*)(C))->a51));
	l4 = T136c8(t1);
	t2 = (T4f1(&l1, l2));
	while (!(t2)) {
		l3 = (T124f5(((T44*)(C))->a51, l1));
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			l5 = (((T46*)(l3))->a4);
			l6 = ((T4)(geint32(1)));
			l7 = (((T136*)(l4))->a1);
			t2 = (T4f1(&l6, l7));
			if (!(t2)) {
				t3 = (T136f2(l4, l6));
				t3 = (((T137*)(t3))->a1);
				t2 = ((t3)==(l5));
			}
			while (!(t2)) {
				l6 = ((T4)((l6)+((T4)(geint32(1)))));
				t2 = (T4f1(&l6, l7));
				if (!(t2)) {
					t3 = (T136f2(l4, l6));
					t3 = (((T137*)(t3))->a1);
					t2 = ((t3)==(l5));
				}
			}
			t2 = (T4f6(&l6, l7));
			if (t2) {
				t3 = (T136f2(l4, l6));
				l9 = (((T137*)(t3))->a2);
			} else {
				l9 = T138c8();
				l8 = T137c3(l5, l9);
				T136f9(l4, l8);
			}
			T138f9(l9, l3);
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f1(&l1, l2));
	}
	l7 = (((T136*)(l4))->a1);
	t2 = (T4f1(&l7, (T4)(geint32(0))));
	if (t2) {
		if ((a1)->id==52) {
			T52f23(a1, gems("\t\t\tinspect yy_sc\n", 17));
		} else {
			T55f10(a1, gems("\t\t\tinspect yy_sc\n", 17));
		}
		l6 = ((T4)(geint32(1)));
		t2 = (T4f1(&l6, l7));
		while (!(t2)) {
			t3 = (T136f2(l4, l6));
			l9 = (((T137*)(t3))->a2);
			l10 = (T138f1(l9));
			T139f8(l10);
			l3 = (T139f1(l10));
			if ((a1)->id==52) {
				T52f23(a1, gems("when ", 5));
			} else {
				T55f10(a1, gems("when ", 5));
			}
			t1 = (((T46*)(l3))->a1);
			if ((a1)->id==52) {
				T52f26(a1, t1);
			} else {
				T55f13(a1, t1);
			}
			T139f9(l10);
			t2 = (((T139*)(l10))->a2);
			while (!(t2)) {
				if ((a1)->id==52) {
					T52f23(a1, gems(", ", 2));
				} else {
					T55f10(a1, gems(", ", 2));
				}
				t3 = (T139f1(l10));
				t1 = (((T46*)(t3))->a1);
				if ((a1)->id==52) {
					T52f26(a1, t1);
				} else {
					T55f13(a1, t1);
				}
				T139f9(l10);
				t2 = (((T139*)(l10))->a2);
			}
			if ((a1)->id==52) {
				T52f23(a1, gems(" then\n", 6));
			} else {
				T55f10(a1, gems(" then\n", 6));
			}
			if ((a1)->id==52) {
				T52f23(a1, gems("--|#line ", 9));
			} else {
				T55f10(a1, gems("--|#line ", 9));
			}
			if (((T44*)(C))->a22) {
				t1 = (((T46*)(l3))->a10);
				if ((a1)->id==52) {
					T52f26(a1, t1);
				} else {
					T55f13(a1, t1);
				}
			} else {
				if ((a1)->id==52) {
					T52f23(a1, gems("<not available>", 15));
				} else {
					T55f10(a1, gems("<not available>", 15));
				}
			}
			if ((a1)->id==52) {
				T52f23(a1, gems(" \"", 2));
			} else {
				T55f10(a1, gems(" \"", 2));
			}
			if ((a1)->id==52) {
				T52f23(a1, ((T44*)(C))->a9);
			} else {
				T55f10(a1, ((T44*)(C))->a9);
			}
			if ((a1)->id==52) {
				T52f24(a1, (T1)('\"'));
			} else {
				T55f11(a1, (T1)('\"'));
			}
			if ((a1)->id==52) {
				T52f27(a1);
			} else {
				T55f14(a1);
			}
			if ((a1)->id==52) {
				T52f25(a1, gems("debug (\"GELEX\")", 15));
			} else {
				T55f12(a1, gems("debug (\"GELEX\")", 15));
			}
			if ((a1)->id==52) {
				T52f23(a1, gems("\tstd.error.put_line (\"Executing scanner user-code from file \'", 61));
			} else {
				T55f10(a1, gems("\tstd.error.put_line (\"Executing scanner user-code from file \'", 61));
			}
			if ((a1)->id==52) {
				T52f23(a1, ((T44*)(C))->a9);
			} else {
				T55f10(a1, ((T44*)(C))->a9);
			}
			if ((a1)->id==52) {
				T52f23(a1, gems("\' at line ", 10));
			} else {
				T55f10(a1, gems("\' at line ", 10));
			}
			if (((T44*)(C))->a22) {
				t1 = (((T46*)(l3))->a10);
				if ((a1)->id==52) {
					T52f26(a1, t1);
				} else {
					T55f13(a1, t1);
				}
			} else {
				if ((a1)->id==52) {
					T52f23(a1, gems("<not available>", 15));
				} else {
					T55f10(a1, gems("<not available>", 15));
				}
			}
			if ((a1)->id==52) {
				T52f25(a1, gems("\")", 2));
			} else {
				T55f12(a1, gems("\")", 2));
			}
			if ((a1)->id==52) {
				T52f25(a1, gems("end", 3));
			} else {
				T55f12(a1, gems("end", 3));
			}
			t3 = (((T46*)(l3))->a4);
			t3 = (T89f2(t3));
			if ((a1)->id==52) {
				T52f23(a1, t3);
			} else {
				T55f10(a1, t3);
			}
			if ((a1)->id==52) {
				T52f27(a1);
			} else {
				T55f14(a1);
			}
			l6 = ((T4)((l6)+((T4)(geint32(1)))));
			t2 = (T4f1(&l6, l7));
		}
		if ((a1)->id==52) {
			T52f23(a1, gems("\t\t\telse\n\t\t\t\tterminate\n\t\t\tend\n", 29));
		} else {
			T55f10(a1, gems("\t\t\telse\n\t\t\t\tterminate\n\t\t\tend\n", 29));
		}
	} else {
		if ((a1)->id==52) {
			T52f23(a1, gems("\t\t\tterminate\n", 13));
		} else {
			T55f10(a1, gems("\t\t\tterminate\n", 13));
		}
	}
	if (((T44*)(C))->a21) {
		if ((a1)->id==52) {
			T52f23(a1, gems("\t\t\tpost_eof_action\n", 19));
		} else {
			T55f10(a1, gems("\t\t\tpost_eof_action\n", 19));
		}
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\t\tend\n", 6));
	} else {
		T55f10(a1, gems("\t\tend\n", 6));
	}
}

/* LX_ACTION.out */
T0* T89f2(T0* C)
{
	T0* R = 0;
	R = (((T89*)(C))->a1);
	return R;
}

/* DS_LINKED_LIST_CURSOR [LX_RULE].forth */
void T139f9(T0* C)
{
	T138f11(((T139*)(C))->a4, C);
}

/* DS_LINKED_LIST [LX_RULE].cursor_forth */
void T138f11(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	t1 = (((T139*)(a1))->a5);
	if (t1) {
		l1 = (EIF_TRUE);
		l3 = (((T138*)(C))->a4);
	} else {
		t2 = (((T139*)(a1))->a3);
		l3 = (((T206*)(t2))->a2);
	}
	l2 = ((l3)==(EIF_VOID));
	T139f10(a1, l3, EIF_FALSE, l2);
	if (l2) {
		t1 = ((T2)(!(l1)));
		if (t1) {
			T138f13(C, a1);
		}
	} else {
		if (l1) {
			T138f12(C, a1);
		}
	}
}

/* DS_LINKED_LIST [LX_RULE].add_traversing_cursor */
void T138f12(T0* C, T0* a1)
{
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T138*)(C))->a2));
	if (t1) {
		t2 = (((T139*)(((T138*)(C))->a2))->a6);
		T139f11(a1, t2);
		T139f11(((T138*)(C))->a2, a1);
	}
}

/* DS_LINKED_LIST_CURSOR [LX_RULE].set_next_cursor */
void T139f11(T0* C, T0* a1)
{
	((T139*)(C))->a6 = (a1);
}

/* DS_LINKED_LIST [LX_RULE].remove_traversing_cursor */
void T138f13(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T138*)(C))->a2));
	if (t1) {
		l2 = (((T138*)(C))->a2);
		l1 = (((T139*)(l2))->a6);
		t1 = ((l1)==(a1));
		if (!(t1)) {
			t1 = ((l1)==(EIF_VOID));
		}
		while (!(t1)) {
			l2 = (l1);
			l1 = (((T139*)(l1))->a6);
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T139*)(a1))->a6);
			T139f11(l2, t2);
			T139f11(a1, EIF_VOID);
		}
	}
}

/* DS_LINKED_LIST_CURSOR [LX_RULE].set */
void T139f10(T0* C, T0* a1, T2 a2, T2 a3)
{
	((T139*)(C))->a3 = (a1);
	((T139*)(C))->a5 = (a2);
	((T139*)(C))->a2 = (a3);
}

/* DS_LINKED_LIST_CURSOR [LX_RULE].item */
T0* T139f1(T0* C)
{
	T0* R = 0;
	R = (((T206*)(((T139*)(C))->a3))->a1);
	return R;
}

/* DS_LINKED_LIST_CURSOR [LX_RULE].start */
void T139f8(T0* C)
{
	T138f10(((T139*)(C))->a4, C);
}

/* DS_LINKED_LIST [LX_RULE].cursor_start */
void T138f10(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 l2 = 0;
	T2 t1;
	l1 = (T138f7(C, a1));
	l2 = ((((T138*)(C))->a4)==(EIF_VOID));
	T139f10(a1, ((T138*)(C))->a4, EIF_FALSE, l2);
	t1 = ((T2)(!(l2)));
	if (t1) {
		t1 = (l1);
	}
	if (t1) {
		T138f12(C, a1);
	}
}

/* DS_LINKED_LIST [LX_RULE].cursor_off */
T2 T138f7(T0* C, T0* a1)
{
	T2 R = 0;
	T0* t1;
	t1 = (((T139*)(a1))->a3);
	R = ((t1)==(EIF_VOID));
	return R;
}

/* DS_LINKED_LIST [LX_RULE].new_cursor */
T0* T138f1(T0* C)
{
	T0* R = 0;
	R = T139c7(C);
	return R;
}

/* DS_LINKED_LIST_CURSOR [LX_RULE].make */
T0* T139c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T139));
	((T139*)(C))->id = 139;
	((T139*)(C))->a4 = (a1);
	((T139*)(C))->a5 = (EIF_TRUE);
	return C;
}

/* DS_LINKED_LIST [LX_RULE].put_last */
void T138f9(T0* C, T0* a1)
{
	T0* l1 = 0;
	T2 t1;
	t1 = (T138f3(C));
	if (t1) {
		((T138*)(C))->a4 = T206c3(a1);
		((T138*)(C))->a5 = (((T138*)(C))->a4);
		((T138*)(C))->a6 = ((T4)(geint32(1)));
	} else {
		l1 = (((T138*)(C))->a5);
		((T138*)(C))->a5 = T206c3(a1);
		T206f4(l1, ((T138*)(C))->a5);
		((T138*)(C))->a6 = ((T4)((((T138*)(C))->a6)+((T4)(geint32(1)))));
	}
}

/* DS_LINKABLE [LX_RULE].put_right */
void T206f4(T0* C, T0* a1)
{
	((T206*)(C))->a2 = (a1);
}

/* DS_LINKABLE [LX_RULE].make */
T0* T206c3(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T206));
	((T206*)(C))->id = 206;
	((T206*)(C))->a1 = (a1);
	return C;
}

/* DS_LINKED_LIST [LX_RULE].is_empty */
T2 T138f3(T0* C)
{
	T2 R = 0;
	R = ((((T138*)(C))->a6)==((T4)(geint32(0))));
	return R;
}

/* DS_ARRAYED_LIST [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].put_last */
void T136f9(T0* C, T0* a1)
{
	((T136*)(C))->a1 = ((T4)((((T136*)(C))->a1)+((T4)(geint32(1)))));
	((T203*)(((T136*)(C))->a3))->a2[((T136*)(C))->a1] = (a1);
}

/* DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]].make */
T0* T137c3(T0* a1, T0* a2)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T137));
	((T137*)(C))->id = 137;
	((T137*)(C))->a1 = (a1);
	((T137*)(C))->a2 = (a2);
	return C;
}

/* DS_LINKED_LIST [LX_RULE].make */
T0* T138c8()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T138));
	((T138*)(C))->id = 138;
	((T138*)(C))->a2 = (T138f1(C));
	return C;
}

/* DS_ARRAYED_LIST [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].item */
T0* T136f2(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T203*)(((T136*)(C))->a3))->a2[a1]);
	return R;
}

/* DS_ARRAYED_LIST [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].make */
T0* T136c8(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T136));
	((T136*)(C))->id = 136;
	((T136*)(C))->a4 = T204c2();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T136*)(C))->a3 = (T204f1(((T136*)(C))->a4, t1));
	((T136*)(C))->a5 = (a1);
	((T136*)(C))->a6 = (T136f7(C));
	return C;
}

/* DS_ARRAYED_LIST [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].new_cursor */
T0* T136f7(T0* C)
{
	T0* R = 0;
	R = T205c2(C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].make */
T0* T205c2(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T205));
	((T205*)(C))->id = 205;
	((T205*)(C))->a1 = (a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].make */
T0* T204f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T225c2(a1);
	R = (((T225*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].make_area */
T0* T225c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T225));
	((T225*)(C))->id = 225;
	((T225*)(C))->a1 = T203c2(a1);
	return C;
}

/* SPECIAL [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].make */
T0* T203c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T203)+a1*sizeof(T0*));
	((T203*)(C))->a1 = a1;
	((T203*)(C))->id = 203;
	return C;
}

/* KL_SPECIAL_ROUTINES [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].default_create */
T0* T204c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T204));
	((T204*)(C))->id = 204;
	return C;
}

/* ARRAY [LX_RULE].count */
T4 T124f4(T0* C)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((((T124*)(C))->a3)-(((T124*)(C))->a2)));
	R = ((T4)((t1)+((T4)(geint32(1)))));
	return R;
}

/* LX_COMPRESSED_DFA.print_actions */
void T44f89(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 t1;
	T4 t2;
	T2 t3;
	T0* t4;
	if ((a1)->id==52) {
		T52f23(a1, gems("\tyy_execute_action (yy_act: INTEGER) is\n\t\t\t-- Execute semantic action.\n\t\tdo\n", 76));
	} else {
		T55f10(a1, gems("\tyy_execute_action (yy_act: INTEGER) is\n\t\t\t-- Execute semantic action.\n\t\tdo\n", 76));
	}
	if (((T44*)(C))->a13) {
		T44f107(C, a1);
	} else {
		t1 = (((T124*)(((T44*)(C))->a2))->a2);
		t2 = (((T124*)(((T44*)(C))->a2))->a3);
		T44f108(C, a1, t1, t2);
	}
	if (((T44*)(C))->a19) {
		if ((a1)->id==52) {
			T52f23(a1, gems("\t\t\tpost_action\n", 15));
		} else {
			T55f10(a1, gems("\t\t\tpost_action\n", 15));
		}
	}
	if (((T44*)(C))->a17) {
		if ((a1)->id==52) {
			T52f23(a1, gems("\t\t\tyy_set_beginning_of_line\n", 28));
		} else {
			T55f10(a1, gems("\t\t\tyy_set_beginning_of_line\n", 28));
		}
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\t\tend\n", 6));
	} else {
		T55f10(a1, gems("\t\tend\n", 6));
	}
	if (((T44*)(C))->a14) {
		l2 = (((T124*)(((T44*)(C))->a2))->a3);
		l1 = (((T124*)(((T44*)(C))->a2))->a2);
		t3 = (T4f1(&l1, l2));
		while (!(t3)) {
			if ((a1)->id==52) {
				T52f24(a1, (T1)('\n'));
			} else {
				T55f11(a1, (T1)('\n'));
			}
			t4 = (T124f5(((T44*)(C))->a2, l1));
			T44f109(C, a1, t4);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t3 = (T4f1(&l1, l2));
		}
	}
}

/* LX_COMPRESSED_DFA.print_action_routine */
void T44f109(T0* C, T0* a1, T0* a2)
{
	T4 t1;
	if ((a1)->id==52) {
		T52f23(a1, gems("\tyy_execute_action_", 19));
	} else {
		T55f10(a1, gems("\tyy_execute_action_", 19));
	}
	t1 = (((T46*)(a2))->a1);
	if ((a1)->id==52) {
		T52f26(a1, t1);
	} else {
		T55f13(a1, t1);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems(" is\n\t\t\t--|#line ", 16));
	} else {
		T55f10(a1, gems(" is\n\t\t\t--|#line ", 16));
	}
	if (((T44*)(C))->a22) {
		t1 = (((T46*)(a2))->a10);
		if ((a1)->id==52) {
			T52f26(a1, t1);
		} else {
			T55f13(a1, t1);
		}
	} else {
		if ((a1)->id==52) {
			T52f23(a1, gems("<not available>", 15));
		} else {
			T55f10(a1, gems("<not available>", 15));
		}
	}
	if ((a1)->id==52) {
		T52f23(a1, gems(" \"", 2));
	} else {
		T55f10(a1, gems(" \"", 2));
	}
	if ((a1)->id==52) {
		T52f23(a1, ((T44*)(C))->a9);
	} else {
		T55f10(a1, ((T44*)(C))->a9);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\"\n\t\tdo\n", 7));
	} else {
		T55f10(a1, gems("\"\n\t\tdo\n", 7));
	}
	T44f118(C, a1, a2);
	if ((a1)->id==52) {
		T52f23(a1, gems("\n\t\tend\n", 7));
	} else {
		T55f10(a1, gems("\n\t\tend\n", 7));
	}
}

/* LX_COMPRESSED_DFA.print_action_body */
void T44f118(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	t1 = (((T46*)(a2))->a11);
	if (t1) {
		t2 = (((T46*)(a2))->a7);
		t1 = (T4f5(&t2, (T4)(geint32(0))));
		if (t1) {
			if ((a1)->id==52) {
				T52f23(a1, gems("\tyy_end := yy_end - ", 20));
			} else {
				T55f10(a1, gems("\tyy_end := yy_end - ", 20));
			}
			t2 = (((T46*)(a2))->a7);
			if ((a1)->id==52) {
				T52f26(a1, t2);
			} else {
				T55f13(a1, t2);
			}
			if ((a1)->id==52) {
				T52f24(a1, (T1)('\n'));
			} else {
				T55f11(a1, (T1)('\n'));
			}
		} else {
			t2 = (((T46*)(a2))->a6);
			t1 = (T4f5(&t2, (T4)(geint32(0))));
			if (t1) {
				if ((a1)->id==52) {
					T52f23(a1, gems("\tyy_end := yy_start + yy_more_len + ", 36));
				} else {
					T55f10(a1, gems("\tyy_end := yy_start + yy_more_len + ", 36));
				}
				t2 = (((T46*)(a2))->a6);
				if ((a1)->id==52) {
					T52f26(a1, t2);
				} else {
					T55f13(a1, t2);
				}
				if ((a1)->id==52) {
					T52f24(a1, (T1)('\n'));
				} else {
					T55f11(a1, (T1)('\n'));
				}
			}
		}
	}
	if (((T44*)(C))->a28) {
		l1 = (((T46*)(a2))->a8);
		l2 = (((T46*)(a2))->a9);
		t1 = ((l1)==((T4)(geint32(0))));
		if (t1) {
			t1 = (T4f1(&l2, (T4)(geint32(0))));
			if (t1) {
				if ((a1)->id==52) {
					T52f23(a1, gems("\tyy_column := yy_column + ", 26));
				} else {
					T55f10(a1, gems("\tyy_column := yy_column + ", 26));
				}
				if ((a1)->id==52) {
					T52f26(a1, l2);
				} else {
					T55f13(a1, l2);
				}
				if ((a1)->id==52) {
					T52f24(a1, (T1)('\n'));
				} else {
					T55f11(a1, (T1)('\n'));
				}
			} else {
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					if ((a1)->id==52) {
						T52f23(a1, gems("\tyy_column := yy_column + yy_end - yy_start - yy_more_len\n", 58));
					} else {
						T55f10(a1, gems("\tyy_column := yy_column + yy_end - yy_start - yy_more_len\n", 58));
					}
				}
			}
		} else {
			t1 = (T4f1(&l1, (T4)(geint32(0))));
			if (t1) {
				t1 = ((l2)==((T4)(geint32(0))));
				if (t1) {
					if ((a1)->id==52) {
						T52f23(a1, gems("\tyy_line := yy_line + ", 22));
					} else {
						T55f10(a1, gems("\tyy_line := yy_line + ", 22));
					}
					if ((a1)->id==52) {
						T52f26(a1, l1);
					} else {
						T55f13(a1, l1);
					}
					if ((a1)->id==52) {
						T52f24(a1, (T1)('\n'));
					} else {
						T55f11(a1, (T1)('\n'));
					}
					if ((a1)->id==52) {
						T52f23(a1, gems("\tyy_column := 1\n", 16));
					} else {
						T55f10(a1, gems("\tyy_column := 1\n", 16));
					}
				} else {
					t1 = (T4f1(&l2, (T4)(geint32(0))));
					if (t1) {
						if ((a1)->id==52) {
							T52f23(a1, gems("\tyy_line := yy_line + ", 22));
						} else {
							T55f10(a1, gems("\tyy_line := yy_line + ", 22));
						}
						if ((a1)->id==52) {
							T52f26(a1, l1);
						} else {
							T55f13(a1, l1);
						}
						if ((a1)->id==52) {
							T52f24(a1, (T1)('\n'));
						} else {
							T55f11(a1, (T1)('\n'));
						}
						if ((a1)->id==52) {
							T52f23(a1, gems("\tyy_column := ", 14));
						} else {
							T55f10(a1, gems("\tyy_column := ", 14));
						}
						if ((a1)->id==52) {
							T52f26(a1, l2);
						} else {
							T55f13(a1, l2);
						}
						if ((a1)->id==52) {
							T52f23(a1, gems(" + 1\n", 5));
						} else {
							T55f10(a1, gems(" + 1\n", 5));
						}
					} else {
						if ((a1)->id==52) {
							T52f23(a1, gems("yy_set_column (", 15));
						} else {
							T55f10(a1, gems("yy_set_column (", 15));
						}
						if ((a1)->id==52) {
							T52f26(a1, l1);
						} else {
							T55f13(a1, l1);
						}
						if ((a1)->id==52) {
							T52f23(a1, gems(")\n", 2));
						} else {
							T55f10(a1, gems(")\n", 2));
						}
					}
				}
			} else {
				t1 = (T4f5(&l2, (T4)(geint32(0))));
				if (t1) {
					if ((a1)->id==52) {
						T52f23(a1, gems("yy_set_line (", 13));
					} else {
						T55f10(a1, gems("yy_set_line (", 13));
					}
					if ((a1)->id==52) {
						T52f26(a1, l2);
					} else {
						T55f13(a1, l2);
					}
					if ((a1)->id==52) {
						T52f23(a1, gems(")\n", 2));
					} else {
						T55f10(a1, gems(")\n", 2));
					}
				} else {
					if ((a1)->id==52) {
						T52f23(a1, gems("yy_set_line_column\n", 19));
					} else {
						T55f10(a1, gems("yy_set_line_column\n", 19));
					}
				}
			}
		}
	}
	if (((T44*)(C))->a29) {
		l3 = (((T46*)(a2))->a6);
		t1 = (T4f1(&l3, (T4)(geint32(0))));
		if (t1) {
			if ((a1)->id==52) {
				T52f23(a1, gems("\tyy_position := yy_position + ", 30));
			} else {
				T55f10(a1, gems("\tyy_position := yy_position + ", 30));
			}
			if ((a1)->id==52) {
				T52f26(a1, l3);
			} else {
				T55f13(a1, l3);
			}
			if ((a1)->id==52) {
				T52f24(a1, (T1)('\n'));
			} else {
				T55f11(a1, (T1)('\n'));
			}
		} else {
			t1 = ((l3)!=((T4)(geint32(0))));
			if (t1) {
				if ((a1)->id==52) {
					T52f23(a1, gems("\tyy_position := yy_position + yy_end - yy_start - yy_more_len\n", 62));
				} else {
					T55f10(a1, gems("\tyy_position := yy_position + yy_end - yy_start - yy_more_len\n", 62));
				}
			}
		}
	}
	if (((T44*)(C))->a18) {
		if ((a1)->id==52) {
			T52f23(a1, gems("pre_action\n", 11));
		} else {
			T55f10(a1, gems("pre_action\n", 11));
		}
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("--|#line ", 9));
	} else {
		T55f10(a1, gems("--|#line ", 9));
	}
	if (((T44*)(C))->a22) {
		t2 = (((T46*)(a2))->a10);
		if ((a1)->id==52) {
			T52f26(a1, t2);
		} else {
			T55f13(a1, t2);
		}
	} else {
		if ((a1)->id==52) {
			T52f23(a1, gems("<not available>", 15));
		} else {
			T55f10(a1, gems("<not available>", 15));
		}
	}
	if ((a1)->id==52) {
		T52f23(a1, gems(" \"", 2));
	} else {
		T55f10(a1, gems(" \"", 2));
	}
	if ((a1)->id==52) {
		T52f23(a1, ((T44*)(C))->a9);
	} else {
		T55f10(a1, ((T44*)(C))->a9);
	}
	if ((a1)->id==52) {
		T52f24(a1, (T1)('\"'));
	} else {
		T55f11(a1, (T1)('\"'));
	}
	if ((a1)->id==52) {
		T52f27(a1);
	} else {
		T55f14(a1);
	}
	if ((a1)->id==52) {
		T52f25(a1, gems("debug (\"GELEX\")", 15));
	} else {
		T55f12(a1, gems("debug (\"GELEX\")", 15));
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\tstd.error.put_line (\"Executing scanner user-code from file \'", 61));
	} else {
		T55f10(a1, gems("\tstd.error.put_line (\"Executing scanner user-code from file \'", 61));
	}
	if ((a1)->id==52) {
		T52f23(a1, ((T44*)(C))->a9);
	} else {
		T55f10(a1, ((T44*)(C))->a9);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\' at line ", 10));
	} else {
		T55f10(a1, gems("\' at line ", 10));
	}
	if (((T44*)(C))->a22) {
		t2 = (((T46*)(a2))->a10);
		if ((a1)->id==52) {
			T52f26(a1, t2);
		} else {
			T55f13(a1, t2);
		}
	} else {
		if ((a1)->id==52) {
			T52f23(a1, gems("<not available>", 15));
		} else {
			T55f10(a1, gems("<not available>", 15));
		}
	}
	if ((a1)->id==52) {
		T52f25(a1, gems("\")", 2));
	} else {
		T55f12(a1, gems("\")", 2));
	}
	if ((a1)->id==52) {
		T52f25(a1, gems("end", 3));
	} else {
		T55f12(a1, gems("end", 3));
	}
	t3 = (((T46*)(a2))->a4);
	t3 = (T89f2(t3));
	if ((a1)->id==52) {
		T52f23(a1, t3);
	} else {
		T55f10(a1, t3);
	}
	if ((a1)->id==52) {
		T52f27(a1);
	} else {
		T55f14(a1);
	}
}

/* LX_COMPRESSED_DFA.print_binary_search_actions */
void T44f108(T0* C, T0* a1, T4 a2, T4 a3)
{
	T4 l1 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	t1 = ((a2)==(a3));
	if (t1) {
		t2 = (T124f5(((T44*)(C))->a2, a2));
		T44f117(C, a1, t2);
	} else {
		t3 = ((T4)((a2)+((T4)(geint32(1)))));
		t1 = ((t3)==(a3));
		if (t1) {
			if ((a1)->id==52) {
				T52f23(a1, gems("if yy_act = ", 12));
			} else {
				T55f10(a1, gems("if yy_act = ", 12));
			}
			if ((a1)->id==52) {
				T52f26(a1, a2);
			} else {
				T55f13(a1, a2);
			}
			if ((a1)->id==52) {
				T52f23(a1, gems(" then\n", 6));
			} else {
				T55f10(a1, gems(" then\n", 6));
			}
			t2 = (T124f5(((T44*)(C))->a2, a2));
			T44f117(C, a1, t2);
			if ((a1)->id==52) {
				T52f23(a1, gems("else\n", 5));
			} else {
				T55f10(a1, gems("else\n", 5));
			}
			t2 = (T124f5(((T44*)(C))->a2, a3));
			T44f117(C, a1, t2);
			if ((a1)->id==52) {
				T52f23(a1, gems("end\n", 4));
			} else {
				T55f10(a1, gems("end\n", 4));
			}
		} else {
			t3 = ((T4)((a3)-(a2)));
			t3 = ((T4)((t3)/((T4)(geint32(2)))));
			l1 = ((T4)((a2)+(t3)));
			if ((a1)->id==52) {
				T52f23(a1, gems("if yy_act <= ", 13));
			} else {
				T55f10(a1, gems("if yy_act <= ", 13));
			}
			if ((a1)->id==52) {
				T52f26(a1, l1);
			} else {
				T55f13(a1, l1);
			}
			if ((a1)->id==52) {
				T52f23(a1, gems(" then\n", 6));
			} else {
				T55f10(a1, gems(" then\n", 6));
			}
			T44f108(C, a1, a2, l1);
			if ((a1)->id==52) {
				T52f23(a1, gems("else\n", 5));
			} else {
				T55f10(a1, gems("else\n", 5));
			}
			t3 = ((T4)((l1)+((T4)(geint32(1)))));
			T44f108(C, a1, t3, a3);
			if ((a1)->id==52) {
				T52f23(a1, gems("end\n", 4));
			} else {
				T55f10(a1, gems("end\n", 4));
			}
		}
	}
}

/* LX_COMPRESSED_DFA.print_action_call */
void T44f117(T0* C, T0* a1, T0* a2)
{
	T4 t1;
	if (((T44*)(C))->a14) {
		if ((a1)->id==52) {
			T52f23(a1, gems("\t\t--|#line ", 11));
		} else {
			T55f10(a1, gems("\t\t--|#line ", 11));
		}
		if (((T44*)(C))->a22) {
			t1 = (((T46*)(a2))->a10);
			if ((a1)->id==52) {
				T52f26(a1, t1);
			} else {
				T55f13(a1, t1);
			}
		} else {
			if ((a1)->id==52) {
				T52f23(a1, gems("<not available>", 15));
			} else {
				T55f10(a1, gems("<not available>", 15));
			}
		}
		if ((a1)->id==52) {
			T52f23(a1, gems(" \"", 2));
		} else {
			T55f10(a1, gems(" \"", 2));
		}
		if ((a1)->id==52) {
			T52f23(a1, ((T44*)(C))->a9);
		} else {
			T55f10(a1, ((T44*)(C))->a9);
		}
		if ((a1)->id==52) {
			T52f23(a1, gems("\"\n\tyy_execute_action_", 21));
		} else {
			T55f10(a1, gems("\"\n\tyy_execute_action_", 21));
		}
		t1 = (((T46*)(a2))->a1);
		if ((a1)->id==52) {
			T52f26(a1, t1);
		} else {
			T55f13(a1, t1);
		}
		if ((a1)->id==52) {
			T52f24(a1, (T1)('\n'));
		} else {
			T55f11(a1, (T1)('\n'));
		}
	} else {
		T44f118(C, a1, a2);
	}
}

/* LX_COMPRESSED_DFA.print_inspect_actions */
void T44f107(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T2 l5 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	T0* t4;
	T2 t5;
	if ((a1)->id==52) {
		T52f23(a1, gems("\t\t\tinspect yy_act\n", 18));
	} else {
		T55f10(a1, gems("\t\t\tinspect yy_act\n", 18));
	}
	l2 = (((T124*)(((T44*)(C))->a2))->a3);
	l1 = (((T124*)(((T44*)(C))->a2))->a2);
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l3 = (T124f5(((T44*)(C))->a2, l1));
		if ((a1)->id==52) {
			T52f23(a1, gems("when ", 5));
		} else {
			T55f10(a1, gems("when ", 5));
		}
		t2 = (((T46*)(l3))->a1);
		if ((a1)->id==52) {
			T52f26(a1, t2);
		} else {
			T55f13(a1, t2);
		}
		t1 = (((T46*)(l3))->a11);
		t1 = ((T2)(!(t1)));
		if (t1) {
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			l5 = (EIF_FALSE);
			if (!(l5)) {
				t1 = (T4f1(&l1, l2));
			} else {
				t1 = EIF_TRUE;
			}
			while (!(t1)) {
				l4 = (T124f5(((T44*)(C))->a2, l1));
				t3 = (((T46*)(l3))->a4);
				t4 = (((T46*)(l4))->a4);
				t1 = ((t3)==(t4));
				if (t1) {
					t5 = (((T46*)(l4))->a11);
					if (!(t5)) {
						t5 = (((T44*)(C))->a28);
					}
					if (!(t5)) {
						t5 = (((T44*)(C))->a29);
					}
					t1 = ((T2)(!(t5)));
				}
				if (t1) {
					if ((a1)->id==52) {
						T52f23(a1, gems(", ", 2));
					} else {
						T55f10(a1, gems(", ", 2));
					}
					t2 = (((T46*)(l4))->a1);
					if ((a1)->id==52) {
						T52f26(a1, t2);
					} else {
						T55f13(a1, t2);
					}
					l1 = ((T4)((l1)+((T4)(geint32(1)))));
				} else {
					t1 = (((T46*)(l4))->a11);
					if (!(t1)) {
						t1 = (((T44*)(C))->a28);
					}
					if (!(t1)) {
						t1 = (((T44*)(C))->a29);
					}
					if (t1) {
						l5 = (EIF_TRUE);
					} else {
						l5 = (EIF_TRUE);
					}
				}
				if (!(l5)) {
					t1 = (T4f1(&l1, l2));
				} else {
					t1 = EIF_TRUE;
				}
			}
		} else {
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f6(&l1, l2));
			if (t1) {
				l4 = (T124f5(((T44*)(C))->a2, l1));
				t3 = (((T46*)(l4))->a4);
				t4 = (((T46*)(l3))->a4);
				t1 = ((t3)==(t4));
				if (t1) {
				}
			}
		}
		if ((a1)->id==52) {
			T52f23(a1, gems(" then\n", 6));
		} else {
			T55f10(a1, gems(" then\n", 6));
		}
		T44f117(C, a1, l3);
		t1 = (T4f1(&l1, l2));
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\t\t\telse\n", 8));
	} else {
		T55f10(a1, gems("\t\t\telse\n", 8));
	}
	if (((T44*)(C))->a18) {
		if ((a1)->id==52) {
			T52f23(a1, gems("\t\t\t\tpre_action\n", 15));
		} else {
			T55f10(a1, gems("\t\t\t\tpre_action\n", 15));
		}
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\t\t\t\tlast_token := yyError_token\n\t\t\t\tfatal_error (\"fatal scanner internal error: no action found\")\n\t\t\tend\n", 105));
	} else {
		T55f10(a1, gems("\t\t\t\tlast_token := yyError_token\n\t\t\t\tfatal_error (\"fatal scanner internal error: no action found\")\n\t\t\tend\n", 105));
	}
}

/* LX_COMPRESSED_DFA.print_build_tables */
void T44f88(T0* C, T0* a1)
{
	T2 t1;
	if ((a1)->id==52) {
		T52f23(a1, gems("\tyy_build_tables is\n\t\t\t-- Build scanner tables.\n\t\tdo\n", 53));
	} else {
		T55f10(a1, gems("\tyy_build_tables is\n\t\t\t-- Build scanner tables.\n\t\tdo\n", 53));
	}
	if ((a1)->id==52) {
		T52f23(a1, ge102ov4063);
	} else {
		T55f10(a1, ge102ov4063);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("yy_nxt := yy_nxt_template\n", 26));
	} else {
		T55f10(a1, gems("yy_nxt := yy_nxt_template\n", 26));
	}
	if ((a1)->id==52) {
		T52f23(a1, ge102ov4063);
	} else {
		T55f10(a1, ge102ov4063);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("yy_chk := yy_chk_template\n", 26));
	} else {
		T55f10(a1, gems("yy_chk := yy_chk_template\n", 26));
	}
	if ((a1)->id==52) {
		T52f23(a1, ge102ov4063);
	} else {
		T55f10(a1, ge102ov4063);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("yy_base := yy_base_template\n", 28));
	} else {
		T55f10(a1, gems("yy_base := yy_base_template\n", 28));
	}
	if ((a1)->id==52) {
		T52f23(a1, ge102ov4063);
	} else {
		T55f10(a1, ge102ov4063);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("yy_def := yy_def_template\n", 26));
	} else {
		T55f10(a1, gems("yy_def := yy_def_template\n", 26));
	}
	t1 = ((((T44*)(C))->a24)!=(EIF_VOID));
	if (t1) {
		if ((a1)->id==52) {
			T52f23(a1, ge102ov4063);
		} else {
			T55f10(a1, ge102ov4063);
		}
		if ((a1)->id==52) {
			T52f23(a1, gems("yy_ec := yy_ec_template\n", 24));
		} else {
			T55f10(a1, gems("yy_ec := yy_ec_template\n", 24));
		}
	}
	t1 = ((((T44*)(C))->a49)!=(EIF_VOID));
	if (t1) {
		if ((a1)->id==52) {
			T52f23(a1, ge102ov4063);
		} else {
			T55f10(a1, ge102ov4063);
		}
		if ((a1)->id==52) {
			T52f23(a1, gems("yy_meta := yy_meta_template\n", 28));
		} else {
			T55f10(a1, gems("yy_meta := yy_meta_template\n", 28));
		}
	}
	if ((a1)->id==52) {
		T52f23(a1, ge102ov4063);
	} else {
		T55f10(a1, ge102ov4063);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("yy_accept := yy_accept_template\n", 32));
	} else {
		T55f10(a1, gems("yy_accept := yy_accept_template\n", 32));
	}
	t1 = ((((T44*)(C))->a50)!=(EIF_VOID));
	if (t1) {
		if ((a1)->id==52) {
			T52f23(a1, ge102ov4063);
		} else {
			T55f10(a1, ge102ov4063);
		}
		if ((a1)->id==52) {
			T52f23(a1, gems("yy_acclist := yy_acclist_template\n", 34));
		} else {
			T55f10(a1, gems("yy_acclist := yy_acclist_template\n", 34));
		}
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\t\tend\n", 6));
	} else {
		T55f10(a1, gems("\t\tend\n", 6));
	}
}

/* LX_COMPRESSED_DFA.print_status_report_routines */
void T44f87(T0* C, T0* a1)
{
	T4 t1;
	T0* t2;
	if ((a1)->id==52) {
		T52f23(a1, gems("\tvalid_start_condition (sc: INTEGER): BOOLEAN is\n\t\t\t-- Is `sc\' a valid start condition\?\n\t\tdo\n\t\t\tResult := ", 106));
	} else {
		T55f10(a1, gems("\tvalid_start_condition (sc: INTEGER): BOOLEAN is\n\t\t\t-- Is `sc\' a valid start condition\?\n\t\tdo\n\t\t\tResult := ", 106));
	}
	t1 = (T119f6(((T44*)(C))->a23));
	switch (t1) {
	case (T4)(T4)(geint32(0)):
		if ((a1)->id==52) {
			T52f23(a1, gems("False", 5));
		} else {
			T55f10(a1, gems("False", 5));
		}
		break;
	case (T4)(T4)(geint32(1)):
		if ((a1)->id==52) {
			T52f23(a1, gems("(sc = ", 6));
		} else {
			T55f10(a1, gems("(sc = ", 6));
		}
		t1 = (((T119*)(((T44*)(C))->a23))->a2);
		t2 = (T119f5(((T44*)(C))->a23, t1));
		if ((a1)->id==52) {
			T52f23(a1, t2);
		} else {
			T55f10(a1, t2);
		}
		if ((a1)->id==52) {
			T52f24(a1, (T1)(')'));
		} else {
			T55f11(a1, (T1)(')'));
		}
		break;
	default:
		if ((a1)->id==52) {
			T52f24(a1, (T1)('('));
		} else {
			T55f11(a1, (T1)('('));
		}
		t1 = (((T119*)(((T44*)(C))->a23))->a2);
		t2 = (T119f5(((T44*)(C))->a23, t1));
		if ((a1)->id==52) {
			T52f23(a1, t2);
		} else {
			T55f10(a1, t2);
		}
		if ((a1)->id==52) {
			T52f23(a1, gems(" <= sc and sc <= ", 17));
		} else {
			T55f10(a1, gems(" <= sc and sc <= ", 17));
		}
		t1 = (((T119*)(((T44*)(C))->a23))->a3);
		t2 = (T119f5(((T44*)(C))->a23, t1));
		if ((a1)->id==52) {
			T52f23(a1, t2);
		} else {
			T55f10(a1, t2);
		}
		if ((a1)->id==52) {
			T52f24(a1, (T1)(')'));
		} else {
			T55f11(a1, (T1)(')'));
		}
		break;
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\n\t\tend\n", 7));
	} else {
		T55f10(a1, gems("\n\t\tend\n", 7));
	}
}

/* ARRAY [STRING].count */
T4 T119f6(T0* C)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((((T119*)(C))->a3)-(((T119*)(C))->a2)));
	R = ((T4)((t1)+((T4)(geint32(1)))));
	return R;
}

/* LX_COMPRESSED_DFA.print_eiffel_header */
void T44f86(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	t1 = ((((T44*)(C))->a16)!=(EIF_VOID));
	if (t1) {
		l2 = (((T62*)(((T44*)(C))->a16))->a1);
		l1 = ((T4)(geint32(1)));
		t1 = (T4f1(&l1, l2));
		while (!(t1)) {
			t2 = (T62f2(((T44*)(C))->a16, l1));
			if ((a1)->id==52) {
				T52f23(a1, t2);
			} else {
				T55f10(a1, t2);
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l2));
		}
	}
}

/* DS_ARRAYED_LIST [STRING].item */
T0* T62f2(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T77*)(((T62*)(C))->a3))->a2[a1]);
	return R;
}

/* LX_FULL_DFA.print_scanner */
void T51f50(T0* C, T0* a1)
{
	T51f55(C, a1);
	if ((a1)->id==52) {
		T52f23(a1, gems("\nfeature -- Status report\n\n", 27));
	} else {
		T55f10(a1, gems("\nfeature -- Status report\n\n", 27));
	}
	T51f56(C, a1);
	if ((a1)->id==52) {
		T52f23(a1, gems("\nfeature {NONE} -- Implementation\n\n", 35));
	} else {
		T55f10(a1, gems("\nfeature {NONE} -- Implementation\n\n", 35));
	}
	T51f57(C, a1);
	if ((a1)->id==52) {
		T52f24(a1, (T1)('\n'));
	} else {
		T55f11(a1, (T1)('\n'));
	}
	T51f58(C, a1);
	if ((a1)->id==52) {
		T52f24(a1, (T1)('\n'));
	} else {
		T55f11(a1, (T1)('\n'));
	}
	T51f59(C, a1);
	if ((a1)->id==52) {
		T52f23(a1, gems("\nfeature {NONE} -- Table templates\n\n", 36));
	} else {
		T55f10(a1, gems("\nfeature {NONE} -- Table templates\n\n", 36));
	}
	T51f60(C, a1);
	if ((a1)->id==52) {
		T52f23(a1, gems("\nfeature {NONE} -- Constants\n\n", 30));
	} else {
		T55f10(a1, gems("\nfeature {NONE} -- Constants\n\n", 30));
	}
	T51f61(C, a1);
	if ((a1)->id==52) {
		T52f23(a1, gems("\nfeature -- User-defined features\n\n", 35));
	} else {
		T55f10(a1, gems("\nfeature -- User-defined features\n\n", 35));
	}
	T51f62(C, a1);
}

/* LX_FULL_DFA.print_eiffel_code */
void T51f62(T0* C, T0* a1)
{
	T2 t1;
	t1 = ((((T51*)(C))->a10)!=(EIF_VOID));
	if (t1) {
		if ((a1)->id==52) {
			T52f23(a1, ((T51*)(C))->a10);
		} else {
			T55f10(a1, ((T51*)(C))->a10);
		}
	}
}

/* LX_FULL_DFA.print_constants */
void T51f61(T0* C, T0* a1)
{
	T0* t1;
	if ((a1)->id==52) {
		T52f23(a1, gems("\tyyNull_equiv_class: INTEGER is ", 32));
	} else {
		T55f10(a1, gems("\tyyNull_equiv_class: INTEGER is ", 32));
	}
	if ((a1)->id==52) {
		T52f26(a1, ((T51*)(C))->a20);
	} else {
		T55f13(a1, ((T51*)(C))->a20);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\n\t\t\t-- Equivalence code for NULL character\n\n\tyyNb_rows: INTEGER is ", 67));
	} else {
		T55f10(a1, gems("\n\t\t\t-- Equivalence code for NULL character\n\n\tyyNb_rows: INTEGER is ", 67));
	}
	if ((a1)->id==52) {
		T52f26(a1, ((T51*)(C))->a34);
	} else {
		T55f13(a1, ((T51*)(C))->a34);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\n\t\t\t-- Number of rows in `yy_nxt\'\n\n\tyyBacking_up: BOOLEAN is ", 61));
	} else {
		T55f10(a1, gems("\n\t\t\t-- Number of rows in `yy_nxt\'\n\n\tyyBacking_up: BOOLEAN is ", 61));
	}
	t1 = (T51f35(C));
	T140f4(t1, a1, ((T51*)(C))->a29);
	if ((a1)->id==52) {
		T52f23(a1, gems("\n\t\t\t-- Does current scanner back up\?\n\t\t\t-- (i.e. does it have non-accepting states)\n\n", 85));
	} else {
		T55f10(a1, gems("\n\t\t\t-- Does current scanner back up\?\n\t\t\t-- (i.e. does it have non-accepting states)\n\n", 85));
	}
	T51f61p1(C, a1);
}

/* LX_FULL_DFA.print_constants */
void T51f61p1(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* t1;
	T2 t2;
	if ((a1)->id==52) {
		T52f23(a1, gems("\tyyNb_rules: INTEGER is ", 24));
	} else {
		T55f10(a1, gems("\tyyNb_rules: INTEGER is ", 24));
	}
	if ((a1)->id==52) {
		T52f26(a1, ((T51*)(C))->a21);
	} else {
		T55f13(a1, ((T51*)(C))->a21);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\n\t\t\t-- Number of rules\n\n\tyyEnd_of_buffer: INTEGER is ", 53));
	} else {
		T55f10(a1, gems("\n\t\t\t-- Number of rules\n\n\tyyEnd_of_buffer: INTEGER is ", 53));
	}
	if ((a1)->id==52) {
		T52f26(a1, ((T51*)(C))->a23);
	} else {
		T55f13(a1, ((T51*)(C))->a23);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\n\t\t\t-- End of buffer rule code\n\n\tyyLine_used: BOOLEAN is ", 57));
	} else {
		T55f10(a1, gems("\n\t\t\t-- End of buffer rule code\n\n\tyyLine_used: BOOLEAN is ", 57));
	}
	t1 = (T51f35(C));
	T140f4(t1, a1, ((T51*)(C))->a24);
	if ((a1)->id==52) {
		T52f23(a1, gems("\n\t\t\t-- Are line and column numbers used\?\n\n\tyyPosition_used: BOOLEAN is ", 71));
	} else {
		T55f10(a1, gems("\n\t\t\t-- Are line and column numbers used\?\n\n\tyyPosition_used: BOOLEAN is ", 71));
	}
	t1 = (T51f35(C));
	T140f4(t1, a1, ((T51*)(C))->a25);
	if ((a1)->id==52) {
		T52f23(a1, gems("\n\t\t\t-- Is `position\' used\?\n\n", 28));
	} else {
		T55f10(a1, gems("\n\t\t\t-- Is `position\' used\?\n\n", 28));
	}
	l2 = (((T119*)(((T51*)(C))->a18))->a3);
	l1 = (((T119*)(((T51*)(C))->a18))->a2);
	t2 = (T4f1(&l1, l2));
	while (!(t2)) {
		if ((a1)->id==52) {
			T52f24(a1, (T1)('\t'));
		} else {
			T55f11(a1, (T1)('\t'));
		}
		t1 = (T119f5(((T51*)(C))->a18, l1));
		if ((a1)->id==52) {
			T52f23(a1, t1);
		} else {
			T55f10(a1, t1);
		}
		if ((a1)->id==52) {
			T52f23(a1, gems(": INTEGER is ", 13));
		} else {
			T55f10(a1, gems(": INTEGER is ", 13));
		}
		if ((a1)->id==52) {
			T52f26(a1, l1);
		} else {
			T55f13(a1, l1);
		}
		if ((a1)->id==52) {
			T52f24(a1, (T1)('\n'));
		} else {
			T55f11(a1, (T1)('\n'));
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f1(&l1, l2));
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\t\t\t-- Start condition codes\n", 28));
	} else {
		T55f10(a1, gems("\t\t\t-- Start condition codes\n", 28));
	}
}

/* LX_FULL_DFA.boolean_formatter_ */
T0* T51f35(T0* C)
{
	T0* R = 0;
	if (ge220os4099) {
		return ge220ov4099;
	} else {
		ge220os4099 = '\1';
	}
	R = T140c3();
	ge220ov4099 = R;
	return R;
}

/* LX_FULL_DFA.print_eiffel_tables */
void T51f60(T0* C, T0* a1)
{
	T2 t1;
	T51f74(C, gems("yy_nxt_template", 15), ((T51*)(C))->a32, a1);
	t1 = ((((T51*)(C))->a19)!=(EIF_VOID));
	if (t1) {
		if ((a1)->id==52) {
			T52f24(a1, (T1)('\n'));
		} else {
			T55f11(a1, (T1)('\n'));
		}
		T51f74(C, gems("yy_ec_template", 14), ((T51*)(C))->a19, a1);
	}
	if ((a1)->id==52) {
		T52f24(a1, (T1)('\n'));
	} else {
		T55f11(a1, (T1)('\n'));
	}
	T51f74(C, gems("yy_accept_template", 18), ((T51*)(C))->a33, a1);
}

/* LX_FULL_DFA.print_eiffel_array */
void T51f74(T0* C, T0* a1, T0* a2, T0* a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	T4 t4;
	if ((a3)->id==52) {
		T52f24(a3, (T1)('\t'));
	} else {
		T55f11(a3, (T1)('\t'));
	}
	if ((a3)->id==52) {
		T52f23(a3, a1);
	} else {
		T55f10(a3, a1);
	}
	if ((a3)->id==52) {
		T52f23(a3, gems(": SPECIAL [INTEGER] is\n", 23));
	} else {
		T55f10(a3, gems(": SPECIAL [INTEGER] is\n", 23));
	}
	t1 = ((((T51*)(C))->a7)==((T4)(geint32(0))));
	if (t1) {
		l4 = ((T4)(geint32(1)));
	} else {
		t2 = (T130f5(a2));
		t2 = ((T4)((t2)/(((T51*)(C))->a7)));
		l4 = ((T4)((t2)+((T4)(geint32(1)))));
	}
	t1 = ((l4)==((T4)(geint32(1))));
	if (t1) {
		if ((a3)->id==52) {
			T52f23(a3, gems("\t\tonce\n\t\t\tResult := yy_fixed_array (<<\n", 39));
		} else {
			T55f10(a3, gems("\t\tonce\n\t\t\tResult := yy_fixed_array (<<\n", 39));
		}
		t3 = (T51f40(C));
		t2 = (((T130*)(a2))->a2);
		t4 = (((T130*)(a2))->a3);
		T152f8(t3, a3, a2, t2, t4);
		if ((a3)->id==52) {
			T52f23(a3, gems(", yy_Dummy>>)\n\t\tend\n", 20));
		} else {
			T55f10(a3, gems(", yy_Dummy>>)\n\t\tend\n", 20));
		}
	} else {
		if ((a3)->id==52) {
			T52f23(a3, gems("\t\tlocal\n\t\t\tan_array: ARRAY [INTEGER]\n\t\tonce\n\t\t\tcreate an_array.make (", 69));
		} else {
			T55f10(a3, gems("\t\tlocal\n\t\t\tan_array: ARRAY [INTEGER]\n\t\tonce\n\t\t\tcreate an_array.make (", 69));
		}
		t2 = (((T130*)(a2))->a2);
		if ((a3)->id==52) {
			T52f26(a3, t2);
		} else {
			T55f13(a3, t2);
		}
		if ((a3)->id==52) {
			T52f23(a3, gems(", ", 2));
		} else {
			T55f10(a3, gems(", ", 2));
		}
		t2 = (((T130*)(a2))->a3);
		if ((a3)->id==52) {
			T52f26(a3, t2);
		} else {
			T55f13(a3, t2);
		}
		if ((a3)->id==52) {
			T52f23(a3, gems(")\n", 2));
		} else {
			T55f10(a3, gems(")\n", 2));
		}
		l2 = ((T4)(geint32(1)));
		t1 = (T4f1(&l2, l4));
		while (!(t1)) {
			if ((a3)->id==52) {
				T52f23(a3, ge102ov4063);
			} else {
				T55f10(a3, ge102ov4063);
			}
			if ((a3)->id==52) {
				T52f23(a3, a1);
			} else {
				T55f10(a3, a1);
			}
			if ((a3)->id==52) {
				T52f24(a3, (T1)('_'));
			} else {
				T55f11(a3, (T1)('_'));
			}
			if ((a3)->id==52) {
				T52f26(a3, l2);
			} else {
				T55f13(a3, l2);
			}
			if ((a3)->id==52) {
				T52f23(a3, gems(" (an_array)\n", 12));
			} else {
				T55f10(a3, gems(" (an_array)\n", 12));
			}
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = (T4f1(&l2, l4));
		}
		if ((a3)->id==52) {
			T52f23(a3, gems("\t\t\tResult := yy_fixed_array (an_array)\n\t\tend\n", 45));
		} else {
			T55f10(a3, gems("\t\t\tResult := yy_fixed_array (an_array)\n\t\tend\n", 45));
		}
		l2 = ((T4)(geint32(1)));
		l1 = (((T130*)(a2))->a2);
		l5 = (((T130*)(a2))->a3);
		t1 = (T4f1(&l2, l4));
		while (!(t1)) {
			if ((a3)->id==52) {
				T52f23(a3, gems("\n\t", 2));
			} else {
				T55f10(a3, gems("\n\t", 2));
			}
			if ((a3)->id==52) {
				T52f23(a3, a1);
			} else {
				T55f10(a3, a1);
			}
			if ((a3)->id==52) {
				T52f24(a3, (T1)('_'));
			} else {
				T55f11(a3, (T1)('_'));
			}
			if ((a3)->id==52) {
				T52f26(a3, l2);
			} else {
				T55f13(a3, l2);
			}
			if ((a3)->id==52) {
				T52f23(a3, gems(" (an_array: ARRAY [INTEGER]) is\n\t\tdo\n\t\t\tyy_array_subcopy (an_array, <<\n", 71));
			} else {
				T55f10(a3, gems(" (an_array: ARRAY [INTEGER]) is\n\t\tdo\n\t\t\tyy_array_subcopy (an_array, <<\n", 71));
			}
			t2 = ((T4)((l1)+(((T51*)(C))->a7)));
			t2 = ((T4)((t2)-((T4)(geint32(1)))));
			l3 = (T4f12(&l5, t2));
			t3 = (T51f40(C));
			T152f8(t3, a3, a2, l1, l3);
			if ((a3)->id==52) {
				T52f23(a3, gems(", yy_Dummy>>,\n\t\t\t", 17));
			} else {
				T55f10(a3, gems(", yy_Dummy>>,\n\t\t\t", 17));
			}
			if ((a3)->id==52) {
				T52f26(a3, (T4)(geint32(1)));
			} else {
				T55f13(a3, (T4)(geint32(1)));
			}
			if ((a3)->id==52) {
				T52f23(a3, gems(", ", 2));
			} else {
				T55f10(a3, gems(", ", 2));
			}
			t2 = ((T4)((l3)-(l1)));
			t2 = ((T4)((t2)+((T4)(geint32(1)))));
			if ((a3)->id==52) {
				T52f26(a3, t2);
			} else {
				T55f13(a3, t2);
			}
			if ((a3)->id==52) {
				T52f23(a3, gems(", ", 2));
			} else {
				T55f10(a3, gems(", ", 2));
			}
			if ((a3)->id==52) {
				T52f26(a3, l1);
			} else {
				T55f13(a3, l1);
			}
			if ((a3)->id==52) {
				T52f23(a3, gems(")\n\t\tend\n", 8));
			} else {
				T55f10(a3, gems(")\n\t\tend\n", 8));
			}
			l1 = ((T4)((l3)+((T4)(geint32(1)))));
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = (T4f1(&l2, l4));
		}
	}
}

/* LX_FULL_DFA.array_formatter_ */
T0* T51f40(T0* C)
{
	T0* R = 0;
	if (ge220os4101) {
		return ge220ov4101;
	} else {
		ge220os4101 = '\1';
	}
	R = T152c7();
	ge220ov4101 = R;
	return R;
}

/* LX_FULL_DFA.print_eof_actions */
void T51f59(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T4 l6 = 0;
	T4 l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T0* l10 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	if ((a1)->id==52) {
		T52f23(a1, gems("\tyy_execute_eof_action (yy_sc: INTEGER) is\n\t\t\t-- Execute EOF semantic action.\n\t\tdo\n", 83));
	} else {
		T55f10(a1, gems("\tyy_execute_eof_action (yy_sc: INTEGER) is\n\t\t\t-- Execute EOF semantic action.\n\t\tdo\n", 83));
	}
	if (((T51*)(C))->a15) {
		if ((a1)->id==52) {
			T52f23(a1, gems("\t\t\tpre_eof_action\n", 18));
		} else {
			T55f10(a1, gems("\t\t\tpre_eof_action\n", 18));
		}
	}
	l1 = (((T124*)(((T51*)(C))->a31))->a2);
	l2 = (((T124*)(((T51*)(C))->a31))->a3);
	t1 = (T124f4(((T51*)(C))->a31));
	l4 = T136c8(t1);
	t2 = (T4f1(&l1, l2));
	while (!(t2)) {
		l3 = (T124f5(((T51*)(C))->a31, l1));
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			l5 = (((T46*)(l3))->a4);
			l6 = ((T4)(geint32(1)));
			l7 = (((T136*)(l4))->a1);
			t2 = (T4f1(&l6, l7));
			if (!(t2)) {
				t3 = (T136f2(l4, l6));
				t3 = (((T137*)(t3))->a1);
				t2 = ((t3)==(l5));
			}
			while (!(t2)) {
				l6 = ((T4)((l6)+((T4)(geint32(1)))));
				t2 = (T4f1(&l6, l7));
				if (!(t2)) {
					t3 = (T136f2(l4, l6));
					t3 = (((T137*)(t3))->a1);
					t2 = ((t3)==(l5));
				}
			}
			t2 = (T4f6(&l6, l7));
			if (t2) {
				t3 = (T136f2(l4, l6));
				l9 = (((T137*)(t3))->a2);
			} else {
				l9 = T138c8();
				l8 = T137c3(l5, l9);
				T136f9(l4, l8);
			}
			T138f9(l9, l3);
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f1(&l1, l2));
	}
	l7 = (((T136*)(l4))->a1);
	t2 = (T4f1(&l7, (T4)(geint32(0))));
	if (t2) {
		if ((a1)->id==52) {
			T52f23(a1, gems("\t\t\tinspect yy_sc\n", 17));
		} else {
			T55f10(a1, gems("\t\t\tinspect yy_sc\n", 17));
		}
		l6 = ((T4)(geint32(1)));
		t2 = (T4f1(&l6, l7));
		while (!(t2)) {
			t3 = (T136f2(l4, l6));
			l9 = (((T137*)(t3))->a2);
			l10 = (T138f1(l9));
			T139f8(l10);
			l3 = (T139f1(l10));
			if ((a1)->id==52) {
				T52f23(a1, gems("when ", 5));
			} else {
				T55f10(a1, gems("when ", 5));
			}
			t1 = (((T46*)(l3))->a1);
			if ((a1)->id==52) {
				T52f26(a1, t1);
			} else {
				T55f13(a1, t1);
			}
			T139f9(l10);
			t2 = (((T139*)(l10))->a2);
			while (!(t2)) {
				if ((a1)->id==52) {
					T52f23(a1, gems(", ", 2));
				} else {
					T55f10(a1, gems(", ", 2));
				}
				t3 = (T139f1(l10));
				t1 = (((T46*)(t3))->a1);
				if ((a1)->id==52) {
					T52f26(a1, t1);
				} else {
					T55f13(a1, t1);
				}
				T139f9(l10);
				t2 = (((T139*)(l10))->a2);
			}
			if ((a1)->id==52) {
				T52f23(a1, gems(" then\n", 6));
			} else {
				T55f10(a1, gems(" then\n", 6));
			}
			if ((a1)->id==52) {
				T52f23(a1, gems("--|#line ", 9));
			} else {
				T55f10(a1, gems("--|#line ", 9));
			}
			if (((T51*)(C))->a17) {
				t1 = (((T46*)(l3))->a10);
				if ((a1)->id==52) {
					T52f26(a1, t1);
				} else {
					T55f13(a1, t1);
				}
			} else {
				if ((a1)->id==52) {
					T52f23(a1, gems("<not available>", 15));
				} else {
					T55f10(a1, gems("<not available>", 15));
				}
			}
			if ((a1)->id==52) {
				T52f23(a1, gems(" \"", 2));
			} else {
				T55f10(a1, gems(" \"", 2));
			}
			if ((a1)->id==52) {
				T52f23(a1, ((T51*)(C))->a4);
			} else {
				T55f10(a1, ((T51*)(C))->a4);
			}
			if ((a1)->id==52) {
				T52f24(a1, (T1)('\"'));
			} else {
				T55f11(a1, (T1)('\"'));
			}
			if ((a1)->id==52) {
				T52f27(a1);
			} else {
				T55f14(a1);
			}
			if ((a1)->id==52) {
				T52f25(a1, gems("debug (\"GELEX\")", 15));
			} else {
				T55f12(a1, gems("debug (\"GELEX\")", 15));
			}
			if ((a1)->id==52) {
				T52f23(a1, gems("\tstd.error.put_line (\"Executing scanner user-code from file \'", 61));
			} else {
				T55f10(a1, gems("\tstd.error.put_line (\"Executing scanner user-code from file \'", 61));
			}
			if ((a1)->id==52) {
				T52f23(a1, ((T51*)(C))->a4);
			} else {
				T55f10(a1, ((T51*)(C))->a4);
			}
			if ((a1)->id==52) {
				T52f23(a1, gems("\' at line ", 10));
			} else {
				T55f10(a1, gems("\' at line ", 10));
			}
			if (((T51*)(C))->a17) {
				t1 = (((T46*)(l3))->a10);
				if ((a1)->id==52) {
					T52f26(a1, t1);
				} else {
					T55f13(a1, t1);
				}
			} else {
				if ((a1)->id==52) {
					T52f23(a1, gems("<not available>", 15));
				} else {
					T55f10(a1, gems("<not available>", 15));
				}
			}
			if ((a1)->id==52) {
				T52f25(a1, gems("\")", 2));
			} else {
				T55f12(a1, gems("\")", 2));
			}
			if ((a1)->id==52) {
				T52f25(a1, gems("end", 3));
			} else {
				T55f12(a1, gems("end", 3));
			}
			t3 = (((T46*)(l3))->a4);
			t3 = (T89f2(t3));
			if ((a1)->id==52) {
				T52f23(a1, t3);
			} else {
				T55f10(a1, t3);
			}
			if ((a1)->id==52) {
				T52f27(a1);
			} else {
				T55f14(a1);
			}
			l6 = ((T4)((l6)+((T4)(geint32(1)))));
			t2 = (T4f1(&l6, l7));
		}
		if ((a1)->id==52) {
			T52f23(a1, gems("\t\t\telse\n\t\t\t\tterminate\n\t\t\tend\n", 29));
		} else {
			T55f10(a1, gems("\t\t\telse\n\t\t\t\tterminate\n\t\t\tend\n", 29));
		}
	} else {
		if ((a1)->id==52) {
			T52f23(a1, gems("\t\t\tterminate\n", 13));
		} else {
			T55f10(a1, gems("\t\t\tterminate\n", 13));
		}
	}
	if (((T51*)(C))->a16) {
		if ((a1)->id==52) {
			T52f23(a1, gems("\t\t\tpost_eof_action\n", 19));
		} else {
			T55f10(a1, gems("\t\t\tpost_eof_action\n", 19));
		}
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\t\tend\n", 6));
	} else {
		T55f10(a1, gems("\t\tend\n", 6));
	}
}

/* LX_FULL_DFA.print_actions */
void T51f58(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 t1;
	T4 t2;
	T2 t3;
	T0* t4;
	if ((a1)->id==52) {
		T52f23(a1, gems("\tyy_execute_action (yy_act: INTEGER) is\n\t\t\t-- Execute semantic action.\n\t\tdo\n", 76));
	} else {
		T55f10(a1, gems("\tyy_execute_action (yy_act: INTEGER) is\n\t\t\t-- Execute semantic action.\n\t\tdo\n", 76));
	}
	if (((T51*)(C))->a8) {
		T51f71(C, a1);
	} else {
		t1 = (((T124*)(((T51*)(C))->a22))->a2);
		t2 = (((T124*)(((T51*)(C))->a22))->a3);
		T51f72(C, a1, t1, t2);
	}
	if (((T51*)(C))->a14) {
		if ((a1)->id==52) {
			T52f23(a1, gems("\t\t\tpost_action\n", 15));
		} else {
			T55f10(a1, gems("\t\t\tpost_action\n", 15));
		}
	}
	if (((T51*)(C))->a12) {
		if ((a1)->id==52) {
			T52f23(a1, gems("\t\t\tyy_set_beginning_of_line\n", 28));
		} else {
			T55f10(a1, gems("\t\t\tyy_set_beginning_of_line\n", 28));
		}
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\t\tend\n", 6));
	} else {
		T55f10(a1, gems("\t\tend\n", 6));
	}
	if (((T51*)(C))->a9) {
		l2 = (((T124*)(((T51*)(C))->a22))->a3);
		l1 = (((T124*)(((T51*)(C))->a22))->a2);
		t3 = (T4f1(&l1, l2));
		while (!(t3)) {
			if ((a1)->id==52) {
				T52f24(a1, (T1)('\n'));
			} else {
				T55f11(a1, (T1)('\n'));
			}
			t4 = (T124f5(((T51*)(C))->a22, l1));
			T51f73(C, a1, t4);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t3 = (T4f1(&l1, l2));
		}
	}
}

/* LX_FULL_DFA.print_action_routine */
void T51f73(T0* C, T0* a1, T0* a2)
{
	T4 t1;
	if ((a1)->id==52) {
		T52f23(a1, gems("\tyy_execute_action_", 19));
	} else {
		T55f10(a1, gems("\tyy_execute_action_", 19));
	}
	t1 = (((T46*)(a2))->a1);
	if ((a1)->id==52) {
		T52f26(a1, t1);
	} else {
		T55f13(a1, t1);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems(" is\n\t\t\t--|#line ", 16));
	} else {
		T55f10(a1, gems(" is\n\t\t\t--|#line ", 16));
	}
	if (((T51*)(C))->a17) {
		t1 = (((T46*)(a2))->a10);
		if ((a1)->id==52) {
			T52f26(a1, t1);
		} else {
			T55f13(a1, t1);
		}
	} else {
		if ((a1)->id==52) {
			T52f23(a1, gems("<not available>", 15));
		} else {
			T55f10(a1, gems("<not available>", 15));
		}
	}
	if ((a1)->id==52) {
		T52f23(a1, gems(" \"", 2));
	} else {
		T55f10(a1, gems(" \"", 2));
	}
	if ((a1)->id==52) {
		T52f23(a1, ((T51*)(C))->a4);
	} else {
		T55f10(a1, ((T51*)(C))->a4);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\"\n\t\tdo\n", 7));
	} else {
		T55f10(a1, gems("\"\n\t\tdo\n", 7));
	}
	T51f80(C, a1, a2);
	if ((a1)->id==52) {
		T52f23(a1, gems("\n\t\tend\n", 7));
	} else {
		T55f10(a1, gems("\n\t\tend\n", 7));
	}
}

/* LX_FULL_DFA.print_action_body */
void T51f80(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	t1 = (((T46*)(a2))->a11);
	if (t1) {
		t2 = (((T46*)(a2))->a7);
		t1 = (T4f5(&t2, (T4)(geint32(0))));
		if (t1) {
			if ((a1)->id==52) {
				T52f23(a1, gems("\tyy_end := yy_end - ", 20));
			} else {
				T55f10(a1, gems("\tyy_end := yy_end - ", 20));
			}
			t2 = (((T46*)(a2))->a7);
			if ((a1)->id==52) {
				T52f26(a1, t2);
			} else {
				T55f13(a1, t2);
			}
			if ((a1)->id==52) {
				T52f24(a1, (T1)('\n'));
			} else {
				T55f11(a1, (T1)('\n'));
			}
		} else {
			t2 = (((T46*)(a2))->a6);
			t1 = (T4f5(&t2, (T4)(geint32(0))));
			if (t1) {
				if ((a1)->id==52) {
					T52f23(a1, gems("\tyy_end := yy_start + yy_more_len + ", 36));
				} else {
					T55f10(a1, gems("\tyy_end := yy_start + yy_more_len + ", 36));
				}
				t2 = (((T46*)(a2))->a6);
				if ((a1)->id==52) {
					T52f26(a1, t2);
				} else {
					T55f13(a1, t2);
				}
				if ((a1)->id==52) {
					T52f24(a1, (T1)('\n'));
				} else {
					T55f11(a1, (T1)('\n'));
				}
			}
		}
	}
	if (((T51*)(C))->a24) {
		l1 = (((T46*)(a2))->a8);
		l2 = (((T46*)(a2))->a9);
		t1 = ((l1)==((T4)(geint32(0))));
		if (t1) {
			t1 = (T4f1(&l2, (T4)(geint32(0))));
			if (t1) {
				if ((a1)->id==52) {
					T52f23(a1, gems("\tyy_column := yy_column + ", 26));
				} else {
					T55f10(a1, gems("\tyy_column := yy_column + ", 26));
				}
				if ((a1)->id==52) {
					T52f26(a1, l2);
				} else {
					T55f13(a1, l2);
				}
				if ((a1)->id==52) {
					T52f24(a1, (T1)('\n'));
				} else {
					T55f11(a1, (T1)('\n'));
				}
			} else {
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					if ((a1)->id==52) {
						T52f23(a1, gems("\tyy_column := yy_column + yy_end - yy_start - yy_more_len\n", 58));
					} else {
						T55f10(a1, gems("\tyy_column := yy_column + yy_end - yy_start - yy_more_len\n", 58));
					}
				}
			}
		} else {
			t1 = (T4f1(&l1, (T4)(geint32(0))));
			if (t1) {
				t1 = ((l2)==((T4)(geint32(0))));
				if (t1) {
					if ((a1)->id==52) {
						T52f23(a1, gems("\tyy_line := yy_line + ", 22));
					} else {
						T55f10(a1, gems("\tyy_line := yy_line + ", 22));
					}
					if ((a1)->id==52) {
						T52f26(a1, l1);
					} else {
						T55f13(a1, l1);
					}
					if ((a1)->id==52) {
						T52f24(a1, (T1)('\n'));
					} else {
						T55f11(a1, (T1)('\n'));
					}
					if ((a1)->id==52) {
						T52f23(a1, gems("\tyy_column := 1\n", 16));
					} else {
						T55f10(a1, gems("\tyy_column := 1\n", 16));
					}
				} else {
					t1 = (T4f1(&l2, (T4)(geint32(0))));
					if (t1) {
						if ((a1)->id==52) {
							T52f23(a1, gems("\tyy_line := yy_line + ", 22));
						} else {
							T55f10(a1, gems("\tyy_line := yy_line + ", 22));
						}
						if ((a1)->id==52) {
							T52f26(a1, l1);
						} else {
							T55f13(a1, l1);
						}
						if ((a1)->id==52) {
							T52f24(a1, (T1)('\n'));
						} else {
							T55f11(a1, (T1)('\n'));
						}
						if ((a1)->id==52) {
							T52f23(a1, gems("\tyy_column := ", 14));
						} else {
							T55f10(a1, gems("\tyy_column := ", 14));
						}
						if ((a1)->id==52) {
							T52f26(a1, l2);
						} else {
							T55f13(a1, l2);
						}
						if ((a1)->id==52) {
							T52f23(a1, gems(" + 1\n", 5));
						} else {
							T55f10(a1, gems(" + 1\n", 5));
						}
					} else {
						if ((a1)->id==52) {
							T52f23(a1, gems("yy_set_column (", 15));
						} else {
							T55f10(a1, gems("yy_set_column (", 15));
						}
						if ((a1)->id==52) {
							T52f26(a1, l1);
						} else {
							T55f13(a1, l1);
						}
						if ((a1)->id==52) {
							T52f23(a1, gems(")\n", 2));
						} else {
							T55f10(a1, gems(")\n", 2));
						}
					}
				}
			} else {
				t1 = (T4f5(&l2, (T4)(geint32(0))));
				if (t1) {
					if ((a1)->id==52) {
						T52f23(a1, gems("yy_set_line (", 13));
					} else {
						T55f10(a1, gems("yy_set_line (", 13));
					}
					if ((a1)->id==52) {
						T52f26(a1, l2);
					} else {
						T55f13(a1, l2);
					}
					if ((a1)->id==52) {
						T52f23(a1, gems(")\n", 2));
					} else {
						T55f10(a1, gems(")\n", 2));
					}
				} else {
					if ((a1)->id==52) {
						T52f23(a1, gems("yy_set_line_column\n", 19));
					} else {
						T55f10(a1, gems("yy_set_line_column\n", 19));
					}
				}
			}
		}
	}
	if (((T51*)(C))->a25) {
		l3 = (((T46*)(a2))->a6);
		t1 = (T4f1(&l3, (T4)(geint32(0))));
		if (t1) {
			if ((a1)->id==52) {
				T52f23(a1, gems("\tyy_position := yy_position + ", 30));
			} else {
				T55f10(a1, gems("\tyy_position := yy_position + ", 30));
			}
			if ((a1)->id==52) {
				T52f26(a1, l3);
			} else {
				T55f13(a1, l3);
			}
			if ((a1)->id==52) {
				T52f24(a1, (T1)('\n'));
			} else {
				T55f11(a1, (T1)('\n'));
			}
		} else {
			t1 = ((l3)!=((T4)(geint32(0))));
			if (t1) {
				if ((a1)->id==52) {
					T52f23(a1, gems("\tyy_position := yy_position + yy_end - yy_start - yy_more_len\n", 62));
				} else {
					T55f10(a1, gems("\tyy_position := yy_position + yy_end - yy_start - yy_more_len\n", 62));
				}
			}
		}
	}
	if (((T51*)(C))->a13) {
		if ((a1)->id==52) {
			T52f23(a1, gems("pre_action\n", 11));
		} else {
			T55f10(a1, gems("pre_action\n", 11));
		}
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("--|#line ", 9));
	} else {
		T55f10(a1, gems("--|#line ", 9));
	}
	if (((T51*)(C))->a17) {
		t2 = (((T46*)(a2))->a10);
		if ((a1)->id==52) {
			T52f26(a1, t2);
		} else {
			T55f13(a1, t2);
		}
	} else {
		if ((a1)->id==52) {
			T52f23(a1, gems("<not available>", 15));
		} else {
			T55f10(a1, gems("<not available>", 15));
		}
	}
	if ((a1)->id==52) {
		T52f23(a1, gems(" \"", 2));
	} else {
		T55f10(a1, gems(" \"", 2));
	}
	if ((a1)->id==52) {
		T52f23(a1, ((T51*)(C))->a4);
	} else {
		T55f10(a1, ((T51*)(C))->a4);
	}
	if ((a1)->id==52) {
		T52f24(a1, (T1)('\"'));
	} else {
		T55f11(a1, (T1)('\"'));
	}
	if ((a1)->id==52) {
		T52f27(a1);
	} else {
		T55f14(a1);
	}
	if ((a1)->id==52) {
		T52f25(a1, gems("debug (\"GELEX\")", 15));
	} else {
		T55f12(a1, gems("debug (\"GELEX\")", 15));
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\tstd.error.put_line (\"Executing scanner user-code from file \'", 61));
	} else {
		T55f10(a1, gems("\tstd.error.put_line (\"Executing scanner user-code from file \'", 61));
	}
	if ((a1)->id==52) {
		T52f23(a1, ((T51*)(C))->a4);
	} else {
		T55f10(a1, ((T51*)(C))->a4);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\' at line ", 10));
	} else {
		T55f10(a1, gems("\' at line ", 10));
	}
	if (((T51*)(C))->a17) {
		t2 = (((T46*)(a2))->a10);
		if ((a1)->id==52) {
			T52f26(a1, t2);
		} else {
			T55f13(a1, t2);
		}
	} else {
		if ((a1)->id==52) {
			T52f23(a1, gems("<not available>", 15));
		} else {
			T55f10(a1, gems("<not available>", 15));
		}
	}
	if ((a1)->id==52) {
		T52f25(a1, gems("\")", 2));
	} else {
		T55f12(a1, gems("\")", 2));
	}
	if ((a1)->id==52) {
		T52f25(a1, gems("end", 3));
	} else {
		T55f12(a1, gems("end", 3));
	}
	t3 = (((T46*)(a2))->a4);
	t3 = (T89f2(t3));
	if ((a1)->id==52) {
		T52f23(a1, t3);
	} else {
		T55f10(a1, t3);
	}
	if ((a1)->id==52) {
		T52f27(a1);
	} else {
		T55f14(a1);
	}
}

/* LX_FULL_DFA.print_binary_search_actions */
void T51f72(T0* C, T0* a1, T4 a2, T4 a3)
{
	T4 l1 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	t1 = ((a2)==(a3));
	if (t1) {
		t2 = (T124f5(((T51*)(C))->a22, a2));
		T51f79(C, a1, t2);
	} else {
		t3 = ((T4)((a2)+((T4)(geint32(1)))));
		t1 = ((t3)==(a3));
		if (t1) {
			if ((a1)->id==52) {
				T52f23(a1, gems("if yy_act = ", 12));
			} else {
				T55f10(a1, gems("if yy_act = ", 12));
			}
			if ((a1)->id==52) {
				T52f26(a1, a2);
			} else {
				T55f13(a1, a2);
			}
			if ((a1)->id==52) {
				T52f23(a1, gems(" then\n", 6));
			} else {
				T55f10(a1, gems(" then\n", 6));
			}
			t2 = (T124f5(((T51*)(C))->a22, a2));
			T51f79(C, a1, t2);
			if ((a1)->id==52) {
				T52f23(a1, gems("else\n", 5));
			} else {
				T55f10(a1, gems("else\n", 5));
			}
			t2 = (T124f5(((T51*)(C))->a22, a3));
			T51f79(C, a1, t2);
			if ((a1)->id==52) {
				T52f23(a1, gems("end\n", 4));
			} else {
				T55f10(a1, gems("end\n", 4));
			}
		} else {
			t3 = ((T4)((a3)-(a2)));
			t3 = ((T4)((t3)/((T4)(geint32(2)))));
			l1 = ((T4)((a2)+(t3)));
			if ((a1)->id==52) {
				T52f23(a1, gems("if yy_act <= ", 13));
			} else {
				T55f10(a1, gems("if yy_act <= ", 13));
			}
			if ((a1)->id==52) {
				T52f26(a1, l1);
			} else {
				T55f13(a1, l1);
			}
			if ((a1)->id==52) {
				T52f23(a1, gems(" then\n", 6));
			} else {
				T55f10(a1, gems(" then\n", 6));
			}
			T51f72(C, a1, a2, l1);
			if ((a1)->id==52) {
				T52f23(a1, gems("else\n", 5));
			} else {
				T55f10(a1, gems("else\n", 5));
			}
			t3 = ((T4)((l1)+((T4)(geint32(1)))));
			T51f72(C, a1, t3, a3);
			if ((a1)->id==52) {
				T52f23(a1, gems("end\n", 4));
			} else {
				T55f10(a1, gems("end\n", 4));
			}
		}
	}
}

/* LX_FULL_DFA.print_action_call */
void T51f79(T0* C, T0* a1, T0* a2)
{
	T4 t1;
	if (((T51*)(C))->a9) {
		if ((a1)->id==52) {
			T52f23(a1, gems("\t\t--|#line ", 11));
		} else {
			T55f10(a1, gems("\t\t--|#line ", 11));
		}
		if (((T51*)(C))->a17) {
			t1 = (((T46*)(a2))->a10);
			if ((a1)->id==52) {
				T52f26(a1, t1);
			} else {
				T55f13(a1, t1);
			}
		} else {
			if ((a1)->id==52) {
				T52f23(a1, gems("<not available>", 15));
			} else {
				T55f10(a1, gems("<not available>", 15));
			}
		}
		if ((a1)->id==52) {
			T52f23(a1, gems(" \"", 2));
		} else {
			T55f10(a1, gems(" \"", 2));
		}
		if ((a1)->id==52) {
			T52f23(a1, ((T51*)(C))->a4);
		} else {
			T55f10(a1, ((T51*)(C))->a4);
		}
		if ((a1)->id==52) {
			T52f23(a1, gems("\"\n\tyy_execute_action_", 21));
		} else {
			T55f10(a1, gems("\"\n\tyy_execute_action_", 21));
		}
		t1 = (((T46*)(a2))->a1);
		if ((a1)->id==52) {
			T52f26(a1, t1);
		} else {
			T55f13(a1, t1);
		}
		if ((a1)->id==52) {
			T52f24(a1, (T1)('\n'));
		} else {
			T55f11(a1, (T1)('\n'));
		}
	} else {
		T51f80(C, a1, a2);
	}
}

/* LX_FULL_DFA.print_inspect_actions */
void T51f71(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T2 l5 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	T0* t4;
	T2 t5;
	if ((a1)->id==52) {
		T52f23(a1, gems("\t\t\tinspect yy_act\n", 18));
	} else {
		T55f10(a1, gems("\t\t\tinspect yy_act\n", 18));
	}
	l2 = (((T124*)(((T51*)(C))->a22))->a3);
	l1 = (((T124*)(((T51*)(C))->a22))->a2);
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l3 = (T124f5(((T51*)(C))->a22, l1));
		if ((a1)->id==52) {
			T52f23(a1, gems("when ", 5));
		} else {
			T55f10(a1, gems("when ", 5));
		}
		t2 = (((T46*)(l3))->a1);
		if ((a1)->id==52) {
			T52f26(a1, t2);
		} else {
			T55f13(a1, t2);
		}
		t1 = (((T46*)(l3))->a11);
		t1 = ((T2)(!(t1)));
		if (t1) {
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			l5 = (EIF_FALSE);
			if (!(l5)) {
				t1 = (T4f1(&l1, l2));
			} else {
				t1 = EIF_TRUE;
			}
			while (!(t1)) {
				l4 = (T124f5(((T51*)(C))->a22, l1));
				t3 = (((T46*)(l3))->a4);
				t4 = (((T46*)(l4))->a4);
				t1 = ((t3)==(t4));
				if (t1) {
					t5 = (((T46*)(l4))->a11);
					if (!(t5)) {
						t5 = (((T51*)(C))->a24);
					}
					if (!(t5)) {
						t5 = (((T51*)(C))->a25);
					}
					t1 = ((T2)(!(t5)));
				}
				if (t1) {
					if ((a1)->id==52) {
						T52f23(a1, gems(", ", 2));
					} else {
						T55f10(a1, gems(", ", 2));
					}
					t2 = (((T46*)(l4))->a1);
					if ((a1)->id==52) {
						T52f26(a1, t2);
					} else {
						T55f13(a1, t2);
					}
					l1 = ((T4)((l1)+((T4)(geint32(1)))));
				} else {
					t1 = (((T46*)(l4))->a11);
					if (!(t1)) {
						t1 = (((T51*)(C))->a24);
					}
					if (!(t1)) {
						t1 = (((T51*)(C))->a25);
					}
					if (t1) {
						l5 = (EIF_TRUE);
					} else {
						l5 = (EIF_TRUE);
					}
				}
				if (!(l5)) {
					t1 = (T4f1(&l1, l2));
				} else {
					t1 = EIF_TRUE;
				}
			}
		} else {
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f6(&l1, l2));
			if (t1) {
				l4 = (T124f5(((T51*)(C))->a22, l1));
				t3 = (((T46*)(l4))->a4);
				t4 = (((T46*)(l3))->a4);
				t1 = ((t3)==(t4));
				if (t1) {
				}
			}
		}
		if ((a1)->id==52) {
			T52f23(a1, gems(" then\n", 6));
		} else {
			T55f10(a1, gems(" then\n", 6));
		}
		T51f79(C, a1, l3);
		t1 = (T4f1(&l1, l2));
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\t\t\telse\n", 8));
	} else {
		T55f10(a1, gems("\t\t\telse\n", 8));
	}
	if (((T51*)(C))->a13) {
		if ((a1)->id==52) {
			T52f23(a1, gems("\t\t\t\tpre_action\n", 15));
		} else {
			T55f10(a1, gems("\t\t\t\tpre_action\n", 15));
		}
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\t\t\t\tlast_token := yyError_token\n\t\t\t\tfatal_error (\"fatal scanner internal error: no action found\")\n\t\t\tend\n", 105));
	} else {
		T55f10(a1, gems("\t\t\t\tlast_token := yyError_token\n\t\t\t\tfatal_error (\"fatal scanner internal error: no action found\")\n\t\t\tend\n", 105));
	}
}

/* LX_FULL_DFA.print_build_tables */
void T51f57(T0* C, T0* a1)
{
	T2 t1;
	if ((a1)->id==52) {
		T52f23(a1, gems("\tyy_build_tables is\n\t\t\t-- Build scanner tables.\n\t\tdo\n", 53));
	} else {
		T55f10(a1, gems("\tyy_build_tables is\n\t\t\t-- Build scanner tables.\n\t\tdo\n", 53));
	}
	if ((a1)->id==52) {
		T52f23(a1, ge102ov4063);
	} else {
		T55f10(a1, ge102ov4063);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("yy_nxt := yy_nxt_template\n", 26));
	} else {
		T55f10(a1, gems("yy_nxt := yy_nxt_template\n", 26));
	}
	t1 = ((((T51*)(C))->a19)!=(EIF_VOID));
	if (t1) {
		if ((a1)->id==52) {
			T52f23(a1, ge102ov4063);
		} else {
			T55f10(a1, ge102ov4063);
		}
		if ((a1)->id==52) {
			T52f23(a1, gems("yy_ec := yy_ec_template\n", 24));
		} else {
			T55f10(a1, gems("yy_ec := yy_ec_template\n", 24));
		}
	}
	if ((a1)->id==52) {
		T52f23(a1, ge102ov4063);
	} else {
		T55f10(a1, ge102ov4063);
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("yy_accept := yy_accept_template\n", 32));
	} else {
		T55f10(a1, gems("yy_accept := yy_accept_template\n", 32));
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\t\tend\n", 6));
	} else {
		T55f10(a1, gems("\t\tend\n", 6));
	}
}

/* LX_FULL_DFA.print_status_report_routines */
void T51f56(T0* C, T0* a1)
{
	T4 t1;
	T0* t2;
	if ((a1)->id==52) {
		T52f23(a1, gems("\tvalid_start_condition (sc: INTEGER): BOOLEAN is\n\t\t\t-- Is `sc\' a valid start condition\?\n\t\tdo\n\t\t\tResult := ", 106));
	} else {
		T55f10(a1, gems("\tvalid_start_condition (sc: INTEGER): BOOLEAN is\n\t\t\t-- Is `sc\' a valid start condition\?\n\t\tdo\n\t\t\tResult := ", 106));
	}
	t1 = (T119f6(((T51*)(C))->a18));
	switch (t1) {
	case (T4)(T4)(geint32(0)):
		if ((a1)->id==52) {
			T52f23(a1, gems("False", 5));
		} else {
			T55f10(a1, gems("False", 5));
		}
		break;
	case (T4)(T4)(geint32(1)):
		if ((a1)->id==52) {
			T52f23(a1, gems("(sc = ", 6));
		} else {
			T55f10(a1, gems("(sc = ", 6));
		}
		t1 = (((T119*)(((T51*)(C))->a18))->a2);
		t2 = (T119f5(((T51*)(C))->a18, t1));
		if ((a1)->id==52) {
			T52f23(a1, t2);
		} else {
			T55f10(a1, t2);
		}
		if ((a1)->id==52) {
			T52f24(a1, (T1)(')'));
		} else {
			T55f11(a1, (T1)(')'));
		}
		break;
	default:
		if ((a1)->id==52) {
			T52f24(a1, (T1)('('));
		} else {
			T55f11(a1, (T1)('('));
		}
		t1 = (((T119*)(((T51*)(C))->a18))->a2);
		t2 = (T119f5(((T51*)(C))->a18, t1));
		if ((a1)->id==52) {
			T52f23(a1, t2);
		} else {
			T55f10(a1, t2);
		}
		if ((a1)->id==52) {
			T52f23(a1, gems(" <= sc and sc <= ", 17));
		} else {
			T55f10(a1, gems(" <= sc and sc <= ", 17));
		}
		t1 = (((T119*)(((T51*)(C))->a18))->a3);
		t2 = (T119f5(((T51*)(C))->a18, t1));
		if ((a1)->id==52) {
			T52f23(a1, t2);
		} else {
			T55f10(a1, t2);
		}
		if ((a1)->id==52) {
			T52f24(a1, (T1)(')'));
		} else {
			T55f11(a1, (T1)(')'));
		}
		break;
	}
	if ((a1)->id==52) {
		T52f23(a1, gems("\n\t\tend\n", 7));
	} else {
		T55f10(a1, gems("\n\t\tend\n", 7));
	}
}

/* LX_FULL_DFA.print_eiffel_header */
void T51f55(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	t1 = ((((T51*)(C))->a11)!=(EIF_VOID));
	if (t1) {
		l2 = (((T62*)(((T51*)(C))->a11))->a1);
		l1 = ((T4)(geint32(1)));
		t1 = (T4f1(&l1, l2));
		while (!(t1)) {
			t2 = (T62f2(((T51*)(C))->a11, l1));
			if ((a1)->id==52) {
				T52f23(a1, t2);
			} else {
				T55f10(a1, t2);
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l2));
		}
	}
}

/* GELEX.build_dfa */
void T18f10(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T4 l8 = 0;
	T4 l9 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	T2 t4;
	l7 = (((T22*)(((T18*)(C))->a3))->a1);
	t1 = ((l7)==(EIF_VOID));
	if (t1) {
		l7 = (gems("standard input", 14));
	}
	t1 = (((T22*)(((T18*)(C))->a3))->a2);
	if (t1) {
		((T18*)(C))->a6 = T51c49(((T18*)(C))->a3);
	} else {
		l1 = T44c80(((T18*)(C))->a3);
		t1 = (((T22*)(((T18*)(C))->a3))->a3);
		t1 = ((T2)(!(t1)));
		if (t1) {
			l2 = (T44f1(l1));
			l9 = (((T45*)(l2))->a1);
			l8 = ((T4)(geint32(1)));
			t1 = (T4f1(&l8, l9));
			while (!(t1)) {
				t2 = (T45f2(l2, l8));
				t3 = (((T46*)(t2))->a10);
				l4 = T47c7(l7, t3);
				T21f8(((T18*)(C))->a2, l4);
				l8 = ((T4)((l8)+((T4)(geint32(1)))));
				t1 = (T4f1(&l8, l9));
			}
		}
		((T18*)(C))->a6 = (l1);
	}
	t1 = (((T22*)(((T18*)(C))->a3))->a3);
	t1 = ((T2)(!(t1)));
	if (t1) {
		t4 = (((T22*)(((T18*)(C))->a3))->a4);
		t1 = ((T2)(!(t4)));
	}
	if (t1) {
		l2 = (((T22*)(((T18*)(C))->a3))->a5);
		t3 = (((T45*)(l2))->a1);
		l9 = ((T4)((t3)-((T4)(geint32(1)))));
		l8 = ((T4)(geint32(1)));
		t1 = (T4f1(&l8, l9));
		while (!(t1)) {
			l3 = (T45f2(l2, l8));
			t1 = (((T46*)(l3))->a12);
			t1 = ((T2)(!(t1)));
			if (t1) {
				t3 = (((T46*)(l3))->a10);
				l5 = T48c7(l7, t3);
				T21f8(((T18*)(C))->a2, l5);
			}
			l8 = ((T4)((l8)+((T4)(geint32(1)))));
			t1 = (T4f1(&l8, l9));
		}
		t1 = (((T22*)(((T18*)(C))->a3))->a6);
		if (t1) {
			t2 = (T45f2(l2, l8));
			t1 = (((T46*)(t2))->a12);
		}
		if (t1) {
			l6 = T49c7(l7);
			T21f8(((T18*)(C))->a2, l6);
		}
	}
}

/* LX_DEFAULT_RULE_CAN_BE_MATCHED_ERROR.make */
T0* T49c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T49));
	((T49*)(C))->id = 49;
	((T49*)(C))->a1 = T119c7((T4)(geint32(1)), (T4)(geint32(1)));
	T119f8(((T49*)(C))->a1, a1, (T4)(geint32(1)));
	return C;
}

/* LX_RULE_CANNOT_BE_MATCHED_ERROR.make */
T0* T48c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T48));
	((T48*)(C))->id = 48;
	((T48*)(C))->a1 = T119c7((T4)(geint32(1)), (T4)(geint32(2)));
	T119f8(((T48*)(C))->a1, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T48*)(C))->a1, t1, (T4)(geint32(2)));
	return C;
}

/* UT_ERROR_HANDLER.report_warning */
void T21f8(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T21f5(C, a1));
	T21f11(C, t1);
}

/* UT_ERROR_HANDLER.report_warning_message */
void T21f11(T0* C, T0* a1)
{
	T61f10(((T21*)(C))->a3, a1);
}

/* LX_DANGEROUS_TRAILING_CONTEXT_ERROR.make */
T0* T47c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T47));
	((T47*)(C))->id = 47;
	((T47*)(C))->a1 = T119c7((T4)(geint32(1)), (T4)(geint32(2)));
	T119f8(((T47*)(C))->a1, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T47*)(C))->a1, t1, (T4)(geint32(2)));
	return C;
}

/* DS_ARRAYED_LIST [LX_RULE].item */
T0* T45f2(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T123*)(((T45*)(C))->a4))->a2[a1]);
	return R;
}

/* LX_COMPRESSED_DFA.dangerous_variable_trail_rules */
T0* T44f1(T0* C)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	T2 t4;
	t1 = (T124f4(((T44*)(C))->a2));
	R = T45c15(t1);
	if (((T44*)(C))->a3) {
		l1 = (((T125*)(((T44*)(C))->a4))->a1);
		t2 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t2)) {
			l4 = (T125f2(((T44*)(C))->a4, l1));
			t2 = (T120f10(l4));
			if (t2) {
				l7 = (((T120*)(l4))->a4);
				l6 = (((T120*)(l4))->a2);
				l2 = (((T122*)(l6))->a1);
				t2 = ((T2)((l2)<((T4)(geint32(1)))));
				while (!(t2)) {
					l5 = (T122f2(l6, l2));
					t2 = (((T121*)(l5))->a1);
					if (t2) {
						l3 = (((T45*)(l7))->a1);
						t2 = ((T2)((l3)<((T4)(geint32(1)))));
						if (!(t2)) {
							t3 = (T45f2(l7, l3));
							t4 = (T45f3(R, t3));
							t4 = ((T2)(!(t4)));
							if (t4) {
								t3 = (T45f2(l7, l3));
								t3 = (((T46*)(t3))->a2);
								t2 = (T82f8(t3, l5));
							} else {
								t2 = EIF_FALSE;
							}
						}
						while (!(t2)) {
							l3 = ((T4)((l3)-((T4)(geint32(1)))));
							t2 = ((T2)((l3)<((T4)(geint32(1)))));
							if (!(t2)) {
								t3 = (T45f2(l7, l3));
								t4 = (T45f3(R, t3));
								t4 = ((T2)(!(t4)));
								if (t4) {
									t3 = (T45f2(l7, l3));
									t3 = (((T46*)(t3))->a2);
									t2 = (T82f8(t3, l5));
								} else {
									t2 = EIF_FALSE;
								}
							}
						}
						t2 = (T4f5(&l3, (T4)(geint32(1))));
						if (t2) {
							t3 = (T45f2(l7, l3));
							T45f18(R, t3);
						}
					}
					l2 = ((T4)((l2)-((T4)(geint32(1)))));
					t2 = ((T2)((l2)<((T4)(geint32(1)))));
				}
			}
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
			t2 = ((T2)((l1)<((T4)(geint32(1)))));
		}
	}
	t3 = (T44f5(C));
	T45f19(R, t3);
	return R;
}

/* DS_ARRAYED_LIST [LX_RULE].sort */
void T45f19(T0* C, T0* a1)
{
	T126f3(a1, C);
}

/* DS_BUBBLE_SORTER [LX_RULE].sort */
void T126f3(T0* C, T0* a1)
{
	T126f4(C, a1, ((T126*)(C))->a1);
}

/* DS_BUBBLE_SORTER [LX_RULE].sort_with_comparator */
void T126f4(T0* C, T0* a1, T0* a2)
{
	T2 t1;
	T4 t2;
	t1 = (T45f13(a1));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = (((T45*)(a1))->a1);
		T126f5(C, a1, a2, (T4)(geint32(1)), t2);
	}
}

/* DS_BUBBLE_SORTER [LX_RULE].subsort_with_comparator */
void T126f5(T0* C, T0* a1, T0* a2, T4 a3, T4 a4)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T2 t1;
	T4 t2;
	l1 = (a4);
	t1 = (T4f6(&l1, a3));
	while (!(t1)) {
		l2 = (a3);
		t1 = (T4f5(&l2, l1));
		while (!(t1)) {
			l4 = (T45f2(a1, l2));
			t2 = ((T4)((l2)+((T4)(geint32(1)))));
			l5 = (T45f2(a1, t2));
			t1 = (T128f1(a2, l5, l4));
			if (t1) {
				T45f24(a1, l5, l2);
				t2 = ((T4)((l2)+((T4)(geint32(1)))));
				T45f24(a1, l4, t2);
				l3 = (EIF_TRUE);
			}
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = (T4f5(&l2, l1));
		}
		if (l3) {
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
			l3 = (EIF_FALSE);
		} else {
			l1 = (a3);
		}
		t1 = (T4f6(&l1, a3));
	}
}

/* DS_ARRAYED_LIST [LX_RULE].replace */
void T45f24(T0* C, T0* a1, T4 a2)
{
	((T123*)(((T45*)(C))->a4))->a2[a2] = (a1);
}

/* KL_COMPARABLE_COMPARATOR [LX_RULE].less_than */
T2 T128f1(T0* C, T0* a1, T0* a2)
{
	T2 R = 0;
	R = (T46f13(a1, a2));
	return R;
}

/* LX_RULE.infix "<" */
T2 T46f13(T0* C, T0* a1)
{
	T2 R = 0;
	T4 t1;
	t1 = (((T46*)(a1))->a1);
	R = ((T2)((((T46*)(C))->a1)<(t1)));
	return R;
}

/* LX_COMPRESSED_DFA.rule_sorter */
unsigned char ge98os4025 = '\0';
T0* ge98ov4025;
T0* T44f5(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	if (ge98os4025) {
		return ge98ov4025;
	} else {
		ge98os4025 = '\1';
	}
	l1 = T128c2();
	R = T126c2(l1);
	ge98ov4025 = R;
	return R;
}

/* DS_BUBBLE_SORTER [LX_RULE].make */
T0* T126c2(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T126));
	((T126*)(C))->id = 126;
	((T126*)(C))->a1 = (a1);
	return C;
}

/* KL_COMPARABLE_COMPARATOR [LX_RULE].make */
T0* T128c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T128));
	((T128*)(C))->id = 128;
	return C;
}

/* DS_ARRAYED_LIST [LX_RULE].put_last */
void T45f18(T0* C, T0* a1)
{
	((T45*)(C))->a1 = ((T4)((((T45*)(C))->a1)+((T4)(geint32(1)))));
	((T123*)(((T45*)(C))->a4))->a2[((T45*)(C))->a1] = (a1);
}

/* DS_ARRAYED_LIST [LX_RULE].has */
T2 T45f3(T0* C, T0* a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	l1 = (((T45*)(C))->a1);
	l2 = (((T45*)(C))->a5);
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t1)) {
			t2 = (((T123*)(((T45*)(C))->a4))->a2[l1]);
			t1 = ((T2)gevoid(l2, t2, a1));
			if (t1) {
				R = (EIF_TRUE);
				l1 = ((T4)(geint32(0)));
			} else {
				l1 = ((T4)((l1)-((T4)(geint32(1)))));
			}
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
		}
	} else {
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t1)) {
			t2 = (((T123*)(((T45*)(C))->a4))->a2[l1]);
			t1 = ((t2)==(a1));
			if (t1) {
				R = (EIF_TRUE);
				l1 = ((T4)(geint32(0)));
			} else {
				l1 = ((T4)((l1)-((T4)(geint32(1)))));
			}
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
		}
	}
	return R;
}

/* LX_DFA_STATE.is_accepting_head */
T2 T120f10(T0* C)
{
	T2 R = 0;
	T2 t1;
	t1 = (T45f13(((T120*)(C))->a4));
	R = ((T2)(!(t1)));
	return R;
}

/* DS_ARRAYED_LIST [LX_RULE].make */
T0* T45c15(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T45));
	((T45*)(C))->id = 45;
	((T45*)(C))->a6 = T156c3();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T45*)(C))->a4 = (T156f1(((T45*)(C))->a6, t1));
	((T45*)(C))->a7 = (a1);
	((T45*)(C))->a8 = (T45f9(C));
	return C;
}

/* DS_ARRAYED_LIST [LX_RULE].new_cursor */
T0* T45f9(T0* C)
{
	T0* R = 0;
	R = T157c4(C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [LX_RULE].make */
T0* T157c4(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T157));
	((T157*)(C))->id = 157;
	((T157*)(C))->a2 = (a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [LX_RULE].make */
T0* T156f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T212c2(a1);
	R = (((T212*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [LX_RULE].make_area */
T0* T212c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T212));
	((T212*)(C))->id = 212;
	((T212*)(C))->a1 = T123c4(a1);
	return C;
}

/* SPECIAL [LX_RULE].make */
T0* T123c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T123)+a1*sizeof(T0*));
	((T123*)(C))->a1 = a1;
	((T123*)(C))->id = 123;
	return C;
}

/* KL_SPECIAL_ROUTINES [LX_RULE].default_create */
T0* T156c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T156));
	((T156*)(C))->id = 156;
	return C;
}

/* LX_COMPRESSED_DFA.make */
T0* T44c80(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T44));
	((T44*)(C))->id = 44;
	((T44*)(C))->a6 = (((T22*)(a1))->a4);
	((T44*)(C))->a3 = (((T22*)(a1))->a25);
	((T44*)(C))->a7 = (((T22*)(a1))->a11);
	T44f83(C, a1);
	T44f84(C);
	T44f85(C);
	return C;
}

/* LX_COMPRESSED_DFA.build */
void T44f85(T0* C)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T4 t1;
	T2 t2;
	((T44*)(C))->a32 = ((T4)(geint32(1)));
	((T44*)(C))->a33 = ((T4)(geint32(0)));
	((T44*)(C))->a34 = ((T4)(geint32(0)));
	((T44*)(C))->a35 = T132c12();
	((T44*)(C))->a36 = T133c9((T4)(geint32(500)));
	if (((T44*)(C))->a7) {
		((T44*)(C))->a38 = T83c10(((T44*)(C))->a30, ((T44*)(C))->a31);
	}
	((T44*)(C))->a39 = T134c11(((T44*)(C))->a38);
	((T44*)(C))->a40 = T135c9(((T44*)(C))->a30, ((T44*)(C))->a31);
	((T44*)(C))->a41 = T130c7((T4)(geint32(0)), (T4)(geint32(2000)));
	((T44*)(C))->a43 = T130c7((T4)(geint32(0)), (T4)(geint32(2000)));
	t1 = (((T125*)(((T44*)(C))->a4))->a3);
	((T44*)(C))->a44 = T130c7((T4)(geint32(0)), t1);
	t1 = (((T125*)(((T44*)(C))->a4))->a3);
	((T44*)(C))->a45 = T130c7((T4)(geint32(0)), t1);
	((T44*)(C))->a46 = ((T4)(geint32(1)));
	l1 = ((T4)(geint32(1)));
	t2 = (T4f1(&l1, ((T44*)(C))->a8));
	while (!(t2)) {
		l2 = (T125f2(((T44*)(C))->a4, l1));
		T44f99(C, l2);
		T44f100(C, l2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f1(&l1, ((T44*)(C))->a8));
	}
	l2 = (T125f2(((T44*)(C))->a4, l1));
	T44f99(C, l2);
	t1 = (((T120*)(l2))->a8);
	l3 = T131c5(t1, (T4)(geint32(-32766)), (T4)(geint32(0)), (T4)(geint32(0)));
	T133f10(((T44*)(C))->a36, l3);
	l1 = ((T4)((l1)+((T4)(geint32(1)))));
	t1 = (((T125*)(((T44*)(C))->a4))->a1);
	t2 = (T4f1(&l1, t1));
	while (!(t2)) {
		l2 = (T125f2(((T44*)(C))->a4, l1));
		T44f99(C, l2);
		t2 = (T120f11(l2));
		t2 = ((T2)(!(t2)));
		if (t2) {
			((T44*)(C))->a46 = ((T4)((((T44*)(C))->a46)+((T4)(geint32(1)))));
		}
		T44f100(C, l2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (((T125*)(((T44*)(C))->a4))->a1);
		t2 = (T4f1(&l1, t1));
	}
	T44f101(C);
	T44f102(C);
	T44f103(C);
	((T44*)(C))->a40 = (EIF_VOID);
	((T44*)(C))->a35 = (EIF_VOID);
	((T44*)(C))->a36 = (EIF_VOID);
	((T44*)(C))->a39 = (EIF_VOID);
	((T44*)(C))->a38 = (EIF_VOID);
	T44f104(C);
	T44f105(C);
	T44f106(C);
}

/* LX_COMPRESSED_DFA.build_accept_tables */
void T44f106(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T0* l10 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	l3 = (((T125*)(((T44*)(C))->a4))->a1);
	if (!(((T44*)(C))->a6)) {
		t1 = (((T44*)(C))->a3);
	} else {
		t1 = EIF_TRUE;
	}
	if (t1) {
		t2 = ((T4)((l3)+((T4)(geint32(2)))));
		l9 = T130c7((T4)(geint32(0)), t2);
		l1 = ((T4)(geint32(1)));
		t1 = (T4f1(&l1, l3));
		while (!(t1)) {
			l8 = (T125f2(((T44*)(C))->a4, l1));
			t3 = (((T120*)(l8))->a1);
			t2 = (((T45*)(t3))->a1);
			l2 = ((T4)((l2)+(t2)));
			t3 = (((T120*)(l8))->a4);
			t2 = (((T45*)(t3))->a1);
			l2 = ((T4)((l2)+(t2)));
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l3));
		}
		t2 = (T4f11(&l2, (T4)(geint32(1))));
		l10 = T130c7((T4)(geint32(0)), t2);
		l2 = ((T4)(geint32(1)));
		l1 = ((T4)(geint32(1)));
		t1 = (T4f1(&l1, l3));
		while (!(t1)) {
			T130f8(l9, l2, l1);
			l8 = (T125f2(((T44*)(C))->a4, l1));
			l6 = (((T120*)(l8))->a1);
			l5 = (((T45*)(l6))->a1);
			l4 = ((T4)(geint32(1)));
			t1 = (T4f1(&l4, l5));
			while (!(t1)) {
				l7 = (T45f2(l6, l4));
				if (((T44*)(C))->a3) {
					t1 = (T46f14(l7));
				} else {
					t1 = EIF_FALSE;
				}
				if (t1) {
					t2 = (((T46*)(l7))->a1);
					t2 = ((T4)(-(t2)));
					T130f8(l10, t2, l2);
				} else {
					t2 = (((T46*)(l7))->a1);
					T130f8(l10, t2, l2);
				}
				l2 = ((T4)((l2)+((T4)(geint32(1)))));
				l4 = ((T4)((l4)+((T4)(geint32(1)))));
				t1 = (T4f1(&l4, l5));
			}
			l6 = (((T120*)(l8))->a4);
			l5 = (((T45*)(l6))->a1);
			l4 = ((T4)(geint32(1)));
			t1 = (T4f1(&l4, l5));
			while (!(t1)) {
				l7 = (T45f2(l6, l4));
				t2 = (((T46*)(l7))->a1);
				t2 = ((T4)(-(t2)));
				t2 = ((T4)((t2)-(((T44*)(C))->a26)));
				T130f8(l10, t2, l2);
				l2 = ((T4)((l2)+((T4)(geint32(1)))));
				l4 = ((T4)((l4)+((T4)(geint32(1)))));
				t1 = (T4f1(&l4, l5));
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l3));
		}
		T130f8(l9, l2, l1);
		t2 = ((T4)((l1)+((T4)(geint32(1)))));
		T130f8(l9, l2, t2);
		((T44*)(C))->a52 = (l9);
		((T44*)(C))->a50 = (l10);
	} else {
		t2 = ((T4)((l3)+((T4)(geint32(1)))));
		l9 = T130c7((T4)(geint32(0)), t2);
		l1 = ((T4)(geint32(1)));
		t1 = (T4f1(&l1, l3));
		while (!(t1)) {
			l8 = (T125f2(((T44*)(C))->a4, l1));
			t1 = (T120f11(l8));
			if (t1) {
				t3 = (((T120*)(l8))->a1);
				t3 = (T45f14(t3));
				t2 = (((T46*)(t3))->a1);
				T130f8(l9, t2, l1);
			} else {
				T130f8(l9, (T4)(geint32(0)), l1);
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l3));
		}
		T130f8(l9, (T4)(geint32(0)), l1);
		((T44*)(C))->a52 = (l9);
		((T44*)(C))->a50 = (EIF_VOID);
	}
}

/* DS_ARRAYED_LIST [LX_RULE].first */
T0* T45f14(T0* C)
{
	T0* R = 0;
	R = (((T123*)(((T45*)(C))->a4))->a2[(T4)(geint32(1))]);
	return R;
}

/* LX_RULE.variable_trail */
T2 T46f14(T0* C)
{
	T2 R = 0;
	T2 t1;
	if (((T46*)(C))->a11) {
		t1 = ((T2)((((T46*)(C))->a6)<((T4)(geint32(0)))));
		if (t1) {
			R = ((T2)((((T46*)(C))->a7)<((T4)(geint32(0)))));
		} else {
			R = EIF_FALSE;
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ARRAY [INTEGER].put */
void T130f8(T0* C, T4 a1, T4 a2)
{
	T4 t1;
	t1 = ((T4)((a2)-(((T130*)(C))->a2)));
	((T71*)(((T130*)(C))->a1))->a2[t1] = (a1);
}

/* LX_COMPRESSED_DFA.build_base_def_tables */
void T44f105(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 t1;
	T2 t2;
	t1 = (((T125*)(((T44*)(C))->a4))->a1);
	l4 = ((T4)((t1)+(((T44*)(C))->a34)));
	l1 = T130c7((T4)(geint32(0)), l4);
	l2 = T130c7((T4)(geint32(0)), l4);
	l3 = ((T4)(geint32(1)));
	t2 = (T4f1(&l3, l4));
	while (!(t2)) {
		t1 = (T130f4(((T44*)(C))->a44, l3));
		T130f8(l1, t1, l3);
		t1 = (T130f4(((T44*)(C))->a45, l3));
		T130f8(l2, t1, l3);
		l3 = ((T4)((l3)+((T4)(geint32(1)))));
		t2 = (T4f1(&l3, l4));
	}
	((T44*)(C))->a44 = (l1);
	((T44*)(C))->a45 = (l2);
}

/* LX_COMPRESSED_DFA.build_nxt_chk_tables */
void T44f104(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T2 t1;
	T4 t2;
	l4 = (((T44*)(C))->a33);
	l1 = T130c7((T4)(geint32(0)), l4);
	l2 = T130c7((T4)(geint32(0)), l4);
	l3 = ((T4)(geint32(1)));
	t1 = (T4f1(&l3, l4));
	while (!(t1)) {
		t2 = (T130f4(((T44*)(C))->a41, l3));
		T130f8(l1, t2, l3);
		t2 = (T130f4(((T44*)(C))->a43, l3));
		T130f8(l2, t2, l3);
		l3 = ((T4)((l3)+((T4)(geint32(1)))));
		t1 = (T4f1(&l3, l4));
	}
	((T44*)(C))->a41 = (l1);
	((T44*)(C))->a43 = (l2);
}

/* LX_COMPRESSED_DFA.put_jam_state */
void T44f103(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T4 l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T0* l10 = 0;
	T0* l11 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	l5 = ((T4)((((T44*)(C))->a8)+((T4)(geint32(1)))));
	t1 = (((T125*)(((T44*)(C))->a4))->a1);
	((T44*)(C))->a54 = ((T4)((t1)+((T4)(geint32(1)))));
	((T44*)(C))->a53 = ((T4)((((T44*)(C))->a33)+((T4)(geint32(1)))));
	l7 = (((T44*)(C))->a54);
	l6 = (((T44*)(C))->a53);
	l8 = (((T44*)(C))->a44);
	l9 = (((T44*)(C))->a45);
	l2 = (((T125*)(((T44*)(C))->a4))->a1);
	l1 = ((T4)(geint32(1)));
	t2 = (T4f1(&l1, l2));
	while (!(t2)) {
		t1 = (T130f4(l8, l1));
		t2 = ((t1)==((T4)(geint32(-32766))));
		if (t2) {
			T130f8(l8, l6, l1);
		}
		l4 = (T130f4(l9, l1));
		t2 = ((l4)==((T4)(geint32(-32766))));
		if (t2) {
			T130f8(l9, l7, l1);
		} else {
			t2 = ((T2)((l4)<((T4)(geint32(0)))));
			if (t2) {
				t1 = ((T4)((l2)-(l4)));
				t1 = ((T4)((t1)+((T4)(geint32(1)))));
				T130f8(l9, t1, l1);
			}
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f1(&l1, l2));
	}
	T130f8(l8, l6, l7);
	T130f8(l9, (T4)(geint32(0)), l7);
	t1 = (((T125*)(((T44*)(C))->a4))->a1);
	l2 = ((T4)((t1)+(((T44*)(C))->a34)));
	l1 = ((T4)((l1)+((T4)(geint32(1)))));
	t2 = (T4f1(&l1, l2));
	while (!(t2)) {
		T130f8(l9, l7, l1);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f1(&l1, l2));
	}
	l10 = (((T44*)(C))->a41);
	l11 = (((T44*)(C))->a43);
	t1 = ((T4)((((T44*)(C))->a33)+(((T44*)(C))->a31)));
	t1 = ((T4)((t1)-(((T44*)(C))->a30)));
	l3 = ((T4)((t1)+((T4)(geint32(2)))));
	t1 = (((T130*)(l10))->a3);
	t2 = (T4f1(&l3, t1));
	if (t2) {
		t3 = (T44f68(C));
		T151f2(t3, l10, (T4)(geint32(0)), l3);
		t3 = (T44f68(C));
		T151f2(t3, l11, (T4)(geint32(0)), l3);
	}
	l2 = (((T44*)(C))->a33);
	l1 = ((T4)(geint32(1)));
	t2 = (T4f1(&l1, l2));
	while (!(t2)) {
		t1 = (T130f4(l11, l1));
		t2 = ((t1)==((T4)(geint32(0))));
		if (!(t2)) {
			t1 = (T130f4(l10, l1));
			t2 = ((t1)==((T4)(geint32(0))));
		}
		if (t2) {
			T130f8(l10, l7, l1);
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f1(&l1, l2));
	}
	T130f8(l10, l5, l6);
	T130f8(l11, l7, l6);
	l1 = ((T4)((l6)+((T4)(geint32(1)))));
	t2 = (T4f1(&l1, l3));
	while (!(t2)) {
		T130f8(l10, l7, l1);
		T130f8(l11, l7, l1);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f1(&l1, l3));
	}
	((T44*)(C))->a33 = (l3);
}

/* KL_ARRAY_ROUTINES [INTEGER].resize */
void T151f2(T0* C, T0* a1, T4 a2, T4 a3)
{
	T2 t1;
	t1 = (T4f6(&a2, a3));
	if (t1) {
		T130f10(a1, a2, a3);
	}
}

/* ARRAY [INTEGER].conservative_resize */
void T130f10(T0* C, T4 a1, T4 a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T4 l7 = 0;
	T2 t1;
	T4 t2;
	t1 = (T130f6(C));
	if (t1) {
		l4 = (a1);
		l5 = (a2);
	} else {
		l4 = (T4f12(&a1, ((T130*)(C))->a2));
		l5 = (T4f11(&a2, ((T130*)(C))->a3));
	}
	t2 = ((T4)((l5)-(l4)));
	l2 = ((T4)((t2)+((T4)(geint32(1)))));
	t1 = (T130f6(C));
	t1 = ((T2)(!(t1)));
	if (t1) {
		l1 = (((T71*)(((T130*)(C))->a1))->a1);
		t2 = ((T4)((((T130*)(C))->a3)-(((T130*)(C))->a2)));
		l3 = ((T4)((t2)+((T4)(geint32(1)))));
	}
	t1 = (T130f6(C));
	if (t1) {
		T130f9(C, l2);
	} else {
		t1 = (T4f1(&l2, l1));
		if (t1) {
			((T130*)(C))->a1 = (T71f3(((T130*)(C))->a1, l2));
		}
		t1 = ((T2)((l4)<(((T130*)(C))->a2)));
		if (t1) {
			l6 = ((T4)((((T130*)(C))->a2)-(l4)));
			T71f7(((T130*)(C))->a1, (T4)(geint32(0)), l6, l3);
			t2 = ((T4)((l6)-((T4)(geint32(1)))));
			T71f8(((T130*)(C))->a1, l7, (T4)(geint32(0)), t2);
		}
	}
	((T130*)(C))->a2 = (l4);
	((T130*)(C))->a3 = (l5);
}

/* SPECIAL [INTEGER].fill_with */
void T71f8(T0* C, T4 a1, T4 a2, T4 a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	l1 = (a2);
	l2 = ((T4)((a3)+((T4)(geint32(1)))));
	t1 = ((l1)==(l2));
	while (!(t1)) {
		((T71*)(C))->a2[l1] = (a1);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
}

/* SPECIAL [INTEGER].move_data */
void T71f7(T0* C, T4 a1, T4 a2, T4 a3)
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
				T71f10(C, a1, a2, a3);
			} else {
				T71f11(C, a1, a2, a3);
			}
		} else {
			t2 = ((T4)((a1)+(a3)));
			t1 = ((T2)((t2)<(a2)));
			if (t1) {
				T71f10(C, a1, a2, a3);
			} else {
				T71f11(C, a1, a2, a3);
			}
		}
	}
}

/* SPECIAL [INTEGER].overlapping_move */
void T71f11(T0* C, T4 a1, T4 a2, T4 a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	t1 = ((T2)((a1)<(a2)));
	if (t1) {
		t2 = ((T4)((a1)+(a3)));
		l1 = ((T4)((t2)-((T4)(geint32(1)))));
		l2 = ((T4)((a1)-((T4)(geint32(1)))));
		l3 = ((T4)((a2)-(a1)));
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t2 = (((T71*)(C))->a2[l1]);
			t3 = ((T4)((l1)+(l3)));
			((T71*)(C))->a2[t3] = (t2);
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
			t1 = ((l1)==(l2));
		}
	} else {
		l1 = (a1);
		l2 = ((T4)((a1)+(a3)));
		l3 = ((T4)((a1)-(a2)));
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t2 = (((T71*)(C))->a2[l1]);
			t3 = ((T4)((l1)-(l3)));
			((T71*)(C))->a2[t3] = (t2);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = ((l1)==(l2));
		}
	}
}

/* SPECIAL [INTEGER].non_overlapping_move */
void T71f10(T0* C, T4 a1, T4 a2, T4 a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	l1 = (a1);
	l2 = ((T4)((a1)+(a3)));
	l3 = ((T4)((a2)-(a1)));
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T71*)(C))->a2[l1]);
		t3 = ((T4)((l1)+(l3)));
		((T71*)(C))->a2[t3] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
}

/* SPECIAL [INTEGER].aliased_resized_area */
T0* T71f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 t1 = ((T71*)(C))->a1;
	if (a1>t1) {
		R = (T0*)gealloc(sizeof(T71)+a1*sizeof(T4));
		*(T71*)(R) = *(T71*)(C);
		memcpy(((T71*)(R))->a2, ((T71*)(C))->a2, t1*sizeof(T4));
	} else {
		R = C;
	}
	((T71*)(R))->a1 = a1;
	return R;
}

/* ARRAY [INTEGER].make_area */
void T130f9(T0* C, T4 a1)
{
	((T130*)(C))->a1 = T71c6(a1);
}

/* ARRAY [INTEGER].empty_area */
T2 T130f6(T0* C)
{
	T2 R = 0;
	T2 t1;
	T4 t2;
	t1 = ((((T130*)(C))->a1)==(EIF_VOID));
	if (!(t1)) {
		t2 = (((T71*)(((T130*)(C))->a1))->a1);
		R = ((t2)==((T4)(geint32(0))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* LX_COMPRESSED_DFA.integer_array_ */
unsigned char ge252os2549 = '\0';
T0* ge252ov2549;
T0* T44f68(T0* C)
{
	T0* R = 0;
	if (ge252os2549) {
		return ge252ov2549;
	} else {
		ge252os2549 = '\1';
	}
	R = T151c1();
	ge252ov2549 = R;
	return R;
}

/* KL_ARRAY_ROUTINES [INTEGER].default_create */
T0* T151c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T151));
	((T151*)(C))->id = 151;
	return C;
}

/* LX_COMPRESSED_DFA.put_singletons */
void T44f102(T0* C)
{
	T4 l1 = 0;
	T2 t1;
	T0* t2;
	l1 = (((T133*)(((T44*)(C))->a36))->a1);
	t1 = ((T2)((l1)<((T4)(geint32(1)))));
	while (!(t1)) {
		t2 = (T133f2(((T44*)(C))->a36, l1));
		T44f116(C, t2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
	}
}

/* LX_COMPRESSED_DFA.put_singleton */
void T44f116(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	l1 = (((T131*)(a1))->a1);
	l2 = (((T131*)(a1))->a2);
	t1 = ((T2)((((T44*)(C))->a32)<(l1)));
	if (t1) {
		((T44*)(C))->a32 = (l1);
	}
	l4 = (((T44*)(C))->a43);
	l3 = (((T130*)(((T44*)(C))->a41))->a3);
	t1 = (T4f1(&(((T44*)(C))->a32), l3));
	if (!(t1)) {
		t2 = (T130f4(l4, ((T44*)(C))->a32));
		t1 = ((t2)==((T4)(geint32(0))));
	}
	while (!(t1)) {
		((T44*)(C))->a32 = ((T4)((((T44*)(C))->a32)+((T4)(geint32(1)))));
		t1 = (T4f1(&(((T44*)(C))->a32), l3));
		if (!(t1)) {
			t2 = (T130f4(l4, ((T44*)(C))->a32));
			t1 = ((t2)==((T4)(geint32(0))));
		}
	}
	t1 = (T4f1(&(((T44*)(C))->a32), l3));
	if (t1) {
		l3 = ((T4)((l3)+((T4)(geint32(2000)))));
		t3 = (T44f68(C));
		T151f2(t3, ((T44*)(C))->a41, (T4)(geint32(0)), l3);
		t3 = (T44f68(C));
		T151f2(t3, l4, (T4)(geint32(0)), l3);
	}
	t2 = ((T4)((((T44*)(C))->a32)-(l1)));
	T130f8(((T44*)(C))->a44, t2, l2);
	t2 = (((T131*)(a1))->a3);
	T130f8(((T44*)(C))->a45, t2, l2);
	T130f8(l4, l2, ((T44*)(C))->a32);
	t2 = (((T131*)(a1))->a4);
	T130f8(((T44*)(C))->a41, t2, ((T44*)(C))->a32);
	t1 = (T4f1(&(((T44*)(C))->a32), ((T44*)(C))->a33));
	if (t1) {
		((T44*)(C))->a33 = (((T44*)(C))->a32);
		((T44*)(C))->a32 = ((T4)((((T44*)(C))->a32)+((T4)(geint32(1)))));
		l3 = (((T130*)(((T44*)(C))->a41))->a3);
		t1 = (T4f1(&(((T44*)(C))->a32), l3));
		if (t1) {
			l3 = ((T4)((l3)+((T4)(geint32(2000)))));
			t3 = (T44f68(C));
			T151f2(t3, ((T44*)(C))->a41, (T4)(geint32(0)), l3);
			t3 = (T44f68(C));
			T151f2(t3, l4, (T4)(geint32(0)), l3);
		}
	}
}

/* DS_ARRAYED_LIST [LX_SINGLETON].item */
T0* T133f2(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T198*)(((T133*)(C))->a4))->a2[a1]);
	return R;
}

/* LX_COMPRESSED_DFA.put_templates */
void T44f101(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	t1 = (((T125*)(((T44*)(C))->a4))->a1);
	((T44*)(C))->a55 = ((T4)((t1)+((T4)(geint32(2)))));
	t2 = ((((T44*)(C))->a38)!=(EIF_VOID));
	if (t2) {
		T83f11(((T44*)(C))->a38);
		((T44*)(C))->a49 = (T83f1(((T44*)(C))->a38, (T4)(geint32(0)), ((T44*)(C))->a31));
	} else {
		((T44*)(C))->a49 = (EIF_VOID);
	}
	t1 = (((T134*)(((T44*)(C))->a39))->a2);
	((T44*)(C))->a34 = ((T4)((t1)+((T4)(geint32(1)))));
	t1 = (((T125*)(((T44*)(C))->a4))->a1);
	l4 = ((T4)((t1)+(((T44*)(C))->a34)));
	t1 = (((T125*)(((T44*)(C))->a4))->a3);
	t2 = ((T2)((t1)<(l4)));
	if (t2) {
		t3 = (T44f68(C));
		T151f2(t3, ((T44*)(C))->a44, (T4)(geint32(0)), l4);
		t3 = (T44f68(C));
		T151f2(t3, ((T44*)(C))->a45, (T4)(geint32(0)), l4);
	}
	t1 = (((T125*)(((T44*)(C))->a4))->a1);
	l3 = ((T4)((t1)+((T4)(geint32(2)))));
	l1 = (T134f3(((T44*)(C))->a39));
	T150f8(l1);
	t2 = (((T150*)(l1))->a1);
	while (!(t2)) {
		t3 = (T150f2(l1));
		l2 = (T134f4(((T44*)(C))->a39, t3));
		T44f115(C, l3, (T4)(geint32(-32766)), l2);
		l3 = ((T4)((l3)+((T4)(geint32(1)))));
		T150f9(l1);
		t2 = (((T150*)(l1))->a1);
	}
}

/* DS_LINKED_LIST_CURSOR [LX_TRANSITION_TABLE [LX_DFA_STATE]].forth */
void T150f9(T0* C)
{
	T134f16(((T150*)(C))->a4, C);
}

/* LX_TEMPLATE_LIST.cursor_forth */
void T134f16(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	t1 = (((T150*)(a1))->a5);
	if (t1) {
		l1 = (EIF_TRUE);
		l3 = (((T134*)(C))->a9);
	} else {
		t2 = (((T150*)(a1))->a3);
		l3 = (((T201*)(t2))->a2);
	}
	l2 = ((l3)==(EIF_VOID));
	T150f10(a1, l3, EIF_FALSE, l2);
	if (l2) {
		t1 = ((T2)(!(l1)));
		if (t1) {
			T134f18(C, a1);
		}
	} else {
		if (l1) {
			T134f17(C, a1);
		}
	}
}

/* LX_TEMPLATE_LIST.add_traversing_cursor */
void T134f17(T0* C, T0* a1)
{
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T134*)(C))->a7));
	if (t1) {
		t2 = (((T150*)(((T134*)(C))->a7))->a6);
		T150f11(a1, t2);
		T150f11(((T134*)(C))->a7, a1);
	}
}

/* DS_LINKED_LIST_CURSOR [LX_TRANSITION_TABLE [LX_DFA_STATE]].set_next_cursor */
void T150f11(T0* C, T0* a1)
{
	((T150*)(C))->a6 = (a1);
}

/* LX_TEMPLATE_LIST.remove_traversing_cursor */
void T134f18(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T134*)(C))->a7));
	if (t1) {
		l2 = (((T134*)(C))->a7);
		l1 = (((T150*)(l2))->a6);
		t1 = ((l1)==(a1));
		if (!(t1)) {
			t1 = ((l1)==(EIF_VOID));
		}
		while (!(t1)) {
			l2 = (l1);
			l1 = (((T150*)(l1))->a6);
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T150*)(a1))->a6);
			T150f11(l2, t2);
			T150f11(a1, EIF_VOID);
		}
	}
}

/* DS_LINKED_LIST_CURSOR [LX_TRANSITION_TABLE [LX_DFA_STATE]].set */
void T150f10(T0* C, T0* a1, T2 a2, T2 a3)
{
	((T150*)(C))->a3 = (a1);
	((T150*)(C))->a5 = (a2);
	((T150*)(C))->a1 = (a3);
}

/* LX_COMPRESSED_DFA.put_entry */
void T44f115(T0* C, T4 a1, T4 a2, T0* a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T4 l7 = 0;
	T4 l8 = 0;
	T4 l9 = 0;
	T0* l10 = 0;
	T0* l11 = 0;
	T0* l12 = 0;
	T0* l13 = 0;
	T4 t1;
	T2 t2;
	T4 t3;
	T0* t4;
	t1 = (((T144*)(a3))->a1);
	switch (t1) {
	case (T4)(T4)(geint32(0)):
		t2 = ((a2)==((T4)(geint32(-32766))));
		if (t2) {
			T130f8(((T44*)(C))->a44, (T4)(geint32(-32766)), a1);
		} else {
			T130f8(((T44*)(C))->a44, (T4)(geint32(0)), a1);
		}
		T130f8(((T44*)(C))->a45, a2, a1);
		break;
	case (T4)(T4)(geint32(1)):
		l5 = (T144f2(a3));
		l13 = (T144f3(a3, l5));
		t1 = (((T120*)(l13))->a8);
		l12 = T131c5(a1, a2, l5, t1);
		t2 = (T133f3(((T44*)(C))->a36));
		t2 = ((T2)(!(t2)));
		if (t2) {
			T133f10(((T44*)(C))->a36, l12);
		} else {
			T44f116(C, l12);
		}
		break;
	default:
		l11 = (((T44*)(C))->a41);
		l10 = (((T44*)(C))->a43);
		l5 = (T144f2(a3));
		l6 = (T144f4(a3));
		l3 = (((T144*)(a3))->a1);
		l4 = (T144f5(a3));
		t1 = ((T4)((l3)*((T4)(geint32(100)))));
		t3 = ((T4)((l4)*((T4)(geint32(15)))));
		t2 = (T4f6(&t1, t3));
		if (t2) {
			l7 = (((T44*)(C))->a32);
			t2 = (T4f5(&l7, l5));
			while (!(t2)) {
				l7 = ((T4)((l7)+((T4)(geint32(1)))));
				t1 = (T130f4(l10, l7));
				t2 = ((t1)==((T4)(geint32(0))));
				while (!(t2)) {
					l7 = ((T4)((l7)+((T4)(geint32(1)))));
					t1 = (T130f4(l10, l7));
					t2 = ((t1)==((T4)(geint32(0))));
				}
				t2 = (T4f5(&l7, l5));
			}
			t1 = ((T4)((l7)+(l6)));
			t1 = ((T4)((t1)-(l5)));
			l2 = ((T4)((t1)+((T4)(geint32(1)))));
			t1 = (((T130*)(l11))->a3);
			t2 = (T4f5(&l2, t1));
			if (t2) {
				l2 = ((T4)((l2)+((T4)(geint32(2000)))));
				t4 = (T44f68(C));
				T151f2(t4, l11, (T4)(geint32(0)), l2);
				t4 = (T44f68(C));
				T151f2(t4, l10, (T4)(geint32(0)), l2);
			}
			l1 = (l5);
			t2 = (T4f1(&l1, l6));
			while (!(t2)) {
				t4 = (T144f3(a3, l1));
				t2 = ((t4)!=(EIF_VOID));
				if (t2) {
					t1 = ((T4)((l7)+(l1)));
					t1 = ((T4)((t1)-(l5)));
					t1 = (T130f4(l10, t1));
					t2 = ((t1)!=((T4)(geint32(0))));
				}
				if (t2) {
					l7 = ((T4)((l7)+((T4)(geint32(1)))));
					l2 = (((T130*)(l11))->a3);
					t2 = (T4f1(&l7, l2));
					if (!(t2)) {
						t1 = (T130f4(l10, l7));
						t2 = ((t1)==((T4)(geint32(0))));
					}
					while (!(t2)) {
						l7 = ((T4)((l7)+((T4)(geint32(1)))));
						t2 = (T4f1(&l7, l2));
						if (!(t2)) {
							t1 = (T130f4(l10, l7));
							t2 = ((t1)==((T4)(geint32(0))));
						}
					}
					t1 = ((T4)((l7)+(l6)));
					t1 = ((T4)((t1)-(l5)));
					l2 = ((T4)((t1)+((T4)(geint32(1)))));
					t1 = (((T130*)(l11))->a3);
					t2 = (T4f5(&l2, t1));
					if (t2) {
						l2 = ((T4)((l2)+((T4)(geint32(2000)))));
						t4 = (T44f68(C));
						T151f2(t4, l11, (T4)(geint32(0)), l2);
						t4 = (T44f68(C));
						T151f2(t4, l10, (T4)(geint32(0)), l2);
					}
					l1 = (l5);
				} else {
					l1 = ((T4)((l1)+((T4)(geint32(1)))));
				}
				t2 = (T4f1(&l1, l6));
			}
		} else {
			t1 = ((T4)((((T44*)(C))->a33)+((T4)(geint32(1)))));
			l7 = (T4f11(&l5, t1));
		}
		l8 = ((T4)((l7)-(l5)));
		l9 = ((T4)((l8)+(l6)));
		l2 = ((T4)((l9)+((T4)(geint32(1)))));
		t1 = (((T130*)(l11))->a3);
		t2 = (T4f5(&l2, t1));
		if (t2) {
			l2 = ((T4)((l2)+((T4)(geint32(2000)))));
			t4 = (T44f68(C));
			T151f2(t4, l11, (T4)(geint32(0)), l2);
			t4 = (T44f68(C));
			T151f2(t4, l10, (T4)(geint32(0)), l2);
		}
		T130f8(((T44*)(C))->a44, l8, a1);
		T130f8(((T44*)(C))->a45, a2, a1);
		l1 = (l5);
		t2 = (T4f1(&l1, l6));
		while (!(t2)) {
			t4 = (T144f3(a3, l1));
			t2 = ((t4)!=(EIF_VOID));
			if (t2) {
				t4 = (T144f3(a3, l1));
				t1 = (((T120*)(t4))->a8);
				t3 = ((T4)((l8)+(l1)));
				T130f8(l11, t1, t3);
				t1 = ((T4)((l8)+(l1)));
				T130f8(l10, a1, t1);
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t2 = (T4f1(&l1, l6));
		}
		t2 = ((l7)==(((T44*)(C))->a32));
		if (t2) {
			l1 = ((T4)((l7)+((T4)(geint32(1)))));
			t1 = (T130f4(l10, l1));
			t2 = ((t1)==((T4)(geint32(0))));
			while (!(t2)) {
				l1 = ((T4)((l1)+((T4)(geint32(1)))));
				t1 = (T130f4(l10, l1));
				t2 = ((t1)==((T4)(geint32(0))));
			}
			((T44*)(C))->a32 = (l1);
		}
		((T44*)(C))->a33 = (T4f11(&(((T44*)(C))->a33), l9));
		break;
	}
}

/* LX_TRANSITION_TABLE [LX_DFA_STATE].capacity */
T4 T144f5(T0* C)
{
	T4 R = 0;
	R = (T208f5(((T144*)(C))->a7));
	return R;
}

/* ARRAY [LX_DFA_STATE].count */
T4 T208f5(T0* C)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((((T208*)(C))->a3)-(((T208*)(C))->a2)));
	R = ((T4)((t1)+((T4)(geint32(1)))));
	return R;
}

/* LX_TRANSITION_TABLE [LX_DFA_STATE].maximum_label */
T4 T144f4(T0* C)
{
	T4 R = 0;
	T0* l1 = 0;
	T2 t1;
	T0* t2;
	R = (T144f8(C));
	l1 = (T144f3(C, R));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		t2 = (T120f9(l1));
		t1 = ((l1)!=(t2));
	}
	while (!(t1)) {
		R = ((T4)((R)-((T4)(geint32(1)))));
		l1 = (T144f3(C, R));
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t2 = (T120f9(l1));
			t1 = ((l1)!=(t2));
		}
	}
	return R;
}

/* LX_DFA_STATE.default */
T0* T120f9(T0* C)
{
	T0* R = 0;
	return R;
}

/* LX_TRANSITION_TABLE [LX_DFA_STATE].upper */
T4 T144f8(T0* C)
{
	T4 R = 0;
	R = (((T208*)(((T144*)(C))->a7))->a3);
	return R;
}

/* DS_ARRAYED_LIST [LX_SINGLETON].is_full */
T2 T133f3(T0* C)
{
	T2 R = 0;
	R = ((((T133*)(C))->a1)==(((T133*)(C))->a5));
	return R;
}

/* LX_TRANSITION_TABLE [LX_DFA_STATE].minimum_label */
T4 T144f2(T0* C)
{
	T4 R = 0;
	T0* l1 = 0;
	T2 t1;
	T0* t2;
	R = (T144f6(C));
	l1 = (T144f3(C, R));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		t2 = (T120f9(l1));
		t1 = ((l1)!=(t2));
	}
	while (!(t1)) {
		R = ((T4)((R)+((T4)(geint32(1)))));
		l1 = (T144f3(C, R));
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t2 = (T120f9(l1));
			t1 = ((l1)!=(t2));
		}
	}
	return R;
}

/* LX_TRANSITION_TABLE [LX_DFA_STATE].lower */
T4 T144f6(T0* C)
{
	T4 R = 0;
	R = (((T208*)(((T144*)(C))->a7))->a2);
	return R;
}

/* LX_TEMPLATE_LIST.equiv_template */
T0* T134f4(T0* C, T0* a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T2 t1;
	T4 t2;
	t1 = ((((T134*)(C))->a6)==(EIF_VOID));
	if (t1) {
		R = (a1);
	} else {
		t2 = (T83f7(((T134*)(C))->a6));
		l5 = T144c14((T4)(geint32(1)), t2);
		R = (l5);
		l3 = (T144f8(a1));
		l1 = (T144f6(a1));
		t1 = (T4f1(&l1, l3));
		while (!(t1)) {
			t1 = (T83f8(((T134*)(C))->a6, l1));
			if (t1) {
				l4 = (T144f3(a1, l1));
				t1 = ((l4)!=(EIF_VOID));
				if (t1) {
					l2 = (T83f9(((T134*)(C))->a6, l1));
					T144f15(R, l4, l2);
				}
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l3));
		}
	}
	return R;
}

/* LX_TRANSITION_TABLE [LX_DFA_STATE].set_target */
void T144f15(T0* C, T0* a1, T4 a2)
{
	T0* l1 = 0;
	T0* t1;
	T2 t2;
	t1 = (T144f3(C, a2));
	t2 = ((t1)==(l1));
	if (t2) {
		((T144*)(C))->a1 = ((T4)((((T144*)(C))->a1)+((T4)(geint32(1)))));
	}
	T208f9(((T144*)(C))->a7, a1, a2);
}

/* ARRAY [LX_DFA_STATE].put */
void T208f9(T0* C, T0* a1, T4 a2)
{
	T4 t1;
	t1 = ((T4)((a2)-(((T208*)(C))->a2)));
	((T194*)(((T208*)(C))->a1))->a2[t1] = (a1);
}

/* LX_EQUIVALENCE_CLASSES.equivalence_class */
T4 T83f9(T0* C, T4 a1)
{
	T4 R = 0;
	T0* t1;
	t1 = (T186f4(((T83*)(C))->a6, a1));
	R = (((T184*)(t1))->a1);
	return R;
}

/* ARRAY [DS_BILINKABLE [INTEGER]].item */
T0* T186f4(T0* C, T4 a1)
{
	T0* R = 0;
	T4 t1;
	t1 = ((T4)((a1)-(((T186*)(C))->a2)));
	R = (((T185*)(((T186*)(C))->a1))->a2[t1]);
	return R;
}

/* LX_EQUIVALENCE_CLASSES.is_representative */
T2 T83f8(T0* C, T4 a1)
{
	T2 R = 0;
	T0* t1;
	t1 = (T186f4(((T83*)(C))->a6, a1));
	t1 = (((T184*)(t1))->a2);
	R = ((t1)==(EIF_VOID));
	return R;
}

/* LX_TRANSITION_TABLE [LX_DFA_STATE].make */
T0* T144c14(T4 a1, T4 a2)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T144));
	((T144*)(C))->id = 144;
	((T144*)(C))->a7 = T208c8(a1, a2);
	((T144*)(C))->a9 = T209c2();
	return C;
}

/* KL_ARRAY_ROUTINES [LX_DFA_STATE].default_create */
T0* T209c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T209));
	((T209*)(C))->id = 209;
	return C;
}

/* ARRAY [LX_DFA_STATE].make */
T0* T208c8(T4 a1, T4 a2)
{
	T2 t1;
	T4 t2;
	T0* C;
	C = (T0*)gealloc(sizeof(T208));
	((T208*)(C))->id = 208;
	((T208*)(C))->a2 = (a1);
	((T208*)(C))->a3 = (a2);
	t1 = (T4f6(&a1, a2));
	if (t1) {
		t2 = ((T4)((a2)-(a1)));
		t2 = ((T4)((t2)+((T4)(geint32(1)))));
		T208f10(C, t2);
	} else {
		T208f10(C, (T4)(geint32(0)));
	}
	return C;
}

/* ARRAY [LX_DFA_STATE].make_area */
void T208f10(T0* C, T4 a1)
{
	((T208*)(C))->a1 = T194c5(a1);
}

/* SPECIAL [LX_DFA_STATE].make */
T0* T194c5(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T194)+a1*sizeof(T0*));
	((T194*)(C))->a1 = a1;
	((T194*)(C))->id = 194;
	return C;
}

/* LX_EQUIVALENCE_CLASSES.capacity */
T4 T83f7(T0* C)
{
	T4 R = 0;
	R = (T186f5(((T83*)(C))->a6));
	return R;
}

/* ARRAY [DS_BILINKABLE [INTEGER]].count */
T4 T186f5(T0* C)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((((T186*)(C))->a3)-(((T186*)(C))->a2)));
	R = ((T4)((t1)+((T4)(geint32(1)))));
	return R;
}

/* DS_LINKED_LIST_CURSOR [LX_TRANSITION_TABLE [LX_DFA_STATE]].item */
T0* T150f2(T0* C)
{
	T0* R = 0;
	R = (((T201*)(((T150*)(C))->a3))->a1);
	return R;
}

/* DS_LINKED_LIST_CURSOR [LX_TRANSITION_TABLE [LX_DFA_STATE]].start */
void T150f8(T0* C)
{
	T134f15(((T150*)(C))->a4, C);
}

/* LX_TEMPLATE_LIST.cursor_start */
void T134f15(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 l2 = 0;
	T2 t1;
	l1 = (T134f10(C, a1));
	l2 = ((((T134*)(C))->a9)==(EIF_VOID));
	T150f10(a1, ((T134*)(C))->a9, EIF_FALSE, l2);
	t1 = ((T2)(!(l2)));
	if (t1) {
		t1 = (l1);
	}
	if (t1) {
		T134f17(C, a1);
	}
}

/* LX_TEMPLATE_LIST.cursor_off */
T2 T134f10(T0* C, T0* a1)
{
	T2 R = 0;
	T0* t1;
	t1 = (((T150*)(a1))->a3);
	R = ((t1)==(EIF_VOID));
	return R;
}

/* LX_TEMPLATE_LIST.new_cursor */
T0* T134f3(T0* C)
{
	T0* R = 0;
	R = T150c7(C);
	return R;
}

/* DS_LINKED_LIST_CURSOR [LX_TRANSITION_TABLE [LX_DFA_STATE]].make */
T0* T150c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T150));
	((T150*)(C))->id = 150;
	((T150*)(C))->a4 = (a1);
	((T150*)(C))->a5 = (EIF_TRUE);
	return C;
}

/* LX_EQUIVALENCE_CLASSES.to_array */
T0* T83f1(T0* C, T4 a1, T4 a2)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	R = T130c7(a1, a2);
	t1 = (T83f4(C));
	l2 = (T4f12(&t1, a2));
	t1 = (T83f5(C));
	l1 = (T4f11(&t1, a1));
	t2 = (T4f1(&l1, l2));
	while (!(t2)) {
		t3 = (T186f4(((T83*)(C))->a6, l1));
		t1 = (((T184*)(t3))->a1);
		T130f8(R, t1, l1);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f1(&l1, l2));
	}
	return R;
}

/* LX_EQUIVALENCE_CLASSES.lower */
T4 T83f5(T0* C)
{
	T4 R = 0;
	R = (((T186*)(((T83*)(C))->a6))->a2);
	return R;
}

/* LX_EQUIVALENCE_CLASSES.upper */
T4 T83f4(T0* C)
{
	T4 R = 0;
	R = (((T186*)(((T83*)(C))->a6))->a3);
	return R;
}

/* LX_EQUIVALENCE_CLASSES.build */
void T83f11(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T0* t2;
	l3 = (T83f4(C));
	l1 = (T83f5(C));
	t1 = (T4f1(&l1, l3));
	while (!(t1)) {
		l4 = (T186f4(((T83*)(C))->a6, l1));
		t2 = (((T184*)(l4))->a2);
		t1 = ((t2)==(EIF_VOID));
		if (t1) {
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			T184f5(l4, l2);
			l4 = (((T184*)(l4))->a3);
			t1 = ((l4)==(EIF_VOID));
			while (!(t1)) {
				T184f5(l4, l2);
				l4 = (((T184*)(l4))->a3);
				t1 = ((l4)==(EIF_VOID));
			}
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l3));
	}
	((T83*)(C))->a3 = (l2);
}

/* DS_BILINKABLE [INTEGER].put */
void T184f5(T0* C, T4 a1)
{
	((T184*)(C))->a1 = (a1);
}

/* DS_ARRAYED_LIST [LX_SINGLETON].put_last */
void T133f10(T0* C, T0* a1)
{
	((T133*)(C))->a1 = ((T4)((((T133*)(C))->a1)+((T4)(geint32(1)))));
	((T198*)(((T133*)(C))->a4))->a2[((T133*)(C))->a1] = (a1);
}

/* LX_SINGLETON.make */
T0* T131c5(T4 a1, T4 a2, T4 a3, T4 a4)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T131));
	((T131*)(C))->id = 131;
	((T131*)(C))->a2 = (a1);
	((T131*)(C))->a3 = (a2);
	((T131*)(C))->a1 = (a3);
	((T131*)(C))->a4 = (a4);
	return C;
}

/* LX_COMPRESSED_DFA.put_state */
void T44f100(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T4 l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T0* l10 = 0;
	T0* l11 = 0;
	T4 l12 = 0;
	T0* l13 = 0;
	T0* l14 = 0;
	T0* l15 = 0;
	T0* l16 = 0;
	T0* l17 = 0;
	T0* l18 = 0;
	T4 l19 = 0;
	T4 l20 = 0;
	T4 t1;
	T4 t2;
	T2 t3;
	T0* t4;
	T0* t5;
	l1 = (((T120*)(a1))->a3);
	l3 = (((T144*)(l1))->a1);
	l4 = (T144f5(l1));
	t1 = ((T4)((l3)*((T4)(geint32(100)))));
	t2 = ((T4)((l4)*((T4)(geint32(15)))));
	t3 = ((T2)((t1)<(t2)));
	if (t3) {
		t1 = (((T120*)(a1))->a8);
		T44f115(C, t1, (T4)(geint32(-32766)), l1);
	} else {
		l8 = T125c15(l3);
		l9 = T141c11(l3);
		l10 = (T125f4(l8));
		l7 = (((T44*)(C))->a31);
		l5 = (((T44*)(C))->a30);
		t3 = (T4f1(&l5, l7));
		while (!(t3)) {
			l11 = (T144f3(l1, l5));
			t3 = ((l11)!=(EIF_VOID));
			if (t3) {
				T147f8(l10);
				T147f9(l10, l11);
				t3 = (T147f1(l10));
				t3 = ((T2)(!(t3)));
				if (t3) {
					l6 = (T147f2(l10));
					t1 = (T141f3(l9, l6));
					t1 = ((T4)((t1)+((T4)(geint32(1)))));
					T141f14(l9, t1, l6);
				} else {
					T125f16(l8, l11);
					T141f12(l9, (T4)(geint32(1)));
				}
			}
			l5 = ((T4)((l5)+((T4)(geint32(1)))));
			t3 = (T4f1(&l5, l7));
		}
		T147f10(l10);
		l7 = (((T125*)(l8))->a1);
		l5 = ((T4)(geint32(1)));
		t3 = (T4f1(&l5, l7));
		while (!(t3)) {
			t1 = (T141f3(l9, l5));
			t3 = ((T2)((l12)<(t1)));
			if (t3) {
				l11 = (T125f2(l8, l5));
				l12 = (T141f3(l9, l5));
			}
			l5 = ((T4)((l5)+((T4)(geint32(1)))));
			t3 = (T4f1(&l5, l7));
		}
		l16 = (T132f1(((T44*)(C))->a35));
		t3 = (T132f2(((T44*)(C))->a35));
		t3 = ((T2)(!(t3)));
		if (t3) {
			l13 = (T132f3(((T44*)(C))->a35));
			T149f11(l16);
		}
		l19 = (l3);
		l15 = (T132f1(((T44*)(C))->a35));
		T149f11(l15);
		t1 = ((T4)((l12)*((T4)(geint32(100)))));
		t2 = ((T4)((l3)*((T4)(geint32(50)))));
		t3 = (T4f1(&t1, t2));
		if (t3) {
			t3 = (((T149*)(l15))->a1);
			if (!(t3)) {
				t4 = (T149f2(l15));
				t4 = (((T148*)(t4))->a3);
				t3 = ((t4)==(l11));
			}
			while (!(t3)) {
				T149f14(l15);
				t3 = (((T149*)(l15))->a1);
				if (!(t3)) {
					t4 = (T149f2(l15));
					t4 = (((T148*)(t4))->a3);
					t3 = ((t4)==(l11));
				}
			}
			t3 = (((T149*)(l15))->a1);
			t3 = ((T2)(!(t3)));
			if (t3) {
				l13 = (T149f2(l15));
				T149f12(l16, l15);
				t4 = (((T148*)(l13))->a2);
				t5 = (T44f63(C));
				l17 = (T144f11(l1, t4, t5));
				l19 = (((T144*)(l17))->a1);
			}
		} else {
			l11 = (T44f63(C));
			t3 = (T132f2(((T44*)(C))->a35));
			t3 = ((T2)(!(t3)));
			if (t3) {
				l13 = (T132f3(((T44*)(C))->a35));
				T149f12(l16, l15);
				t4 = (((T148*)(l13))->a2);
				t5 = (T44f63(C));
				l17 = (T144f11(l1, t4, t5));
				l19 = (((T144*)(l17))->a1);
			}
		}
		t1 = ((T4)((l19)*((T4)(geint32(100)))));
		t2 = ((T4)((l3)*((T4)(geint32(10)))));
		t3 = (T4f1(&t1, t2));
		if (t3) {
			t3 = (((T149*)(l15))->a1);
			while (!(t3)) {
				l14 = (T149f2(l15));
				t4 = (((T148*)(l14))->a2);
				t5 = (T44f63(C));
				l18 = (T144f11(l1, t4, t5));
				t1 = (((T144*)(l18))->a1);
				t3 = ((T2)((t1)<(l19)));
				if (t3) {
					l13 = (l14);
					T149f12(l16, l15);
					l17 = (l18);
					l19 = (((T144*)(l17))->a1);
				}
				T149f14(l15);
				t3 = (((T149*)(l15))->a1);
			}
		} else {
			T149f13(l15);
		}
		t1 = ((T4)((l19)*((T4)(geint32(100)))));
		t2 = ((T4)((l3)*((T4)(geint32(50)))));
		t3 = (T4f1(&t1, t2));
		if (t3) {
			t1 = ((T4)((l12)*((T4)(geint32(100)))));
			t2 = ((T4)((l3)*((T4)(geint32(60)))));
			t3 = (T4f5(&t1, t2));
			if (t3) {
				T134f12(((T44*)(C))->a39, a1, l11);
				l2 = (T134f1(((T44*)(C))->a39));
				t1 = (((T134*)(((T44*)(C))->a39))->a2);
				l20 = ((T4)(-(t1)));
				T132f13(((T44*)(C))->a35, l20, l2, l11);
				t1 = (((T120*)(a1))->a8);
				t4 = (T44f63(C));
				t4 = (T144f11(l1, l2, t4));
				T44f115(C, t1, l20, t4);
			} else {
				t1 = (((T120*)(a1))->a8);
				t4 = (T144f12(l1));
				T132f13(((T44*)(C))->a35, t1, t4, l11);
				t1 = (((T120*)(a1))->a8);
				T44f115(C, t1, (T4)(geint32(-32766)), l1);
			}
		} else {
			t1 = (((T120*)(a1))->a8);
			t2 = (((T148*)(l13))->a1);
			T44f115(C, t1, t2, l17);
			T132f14(((T44*)(C))->a35, l16);
			t1 = ((T4)((l19)*((T4)(geint32(100)))));
			t2 = ((T4)((l3)*((T4)(geint32(20)))));
			t3 = (T4f5(&t1, t2));
			if (t3) {
				t1 = (((T120*)(a1))->a8);
				t4 = (T144f12(l1));
				T132f13(((T44*)(C))->a35, t1, t4, l11);
			}
		}
		T149f13(l16);
	}
}

/* LX_PROTO_QUEUE.move_to_front */
void T132f14(T0* C, T0* a1)
{
	T0* l1 = 0;
	l1 = (T149f2(a1));
	T149f15(a1);
	T132f16(C, l1);
}

/* LX_PROTO_QUEUE.put_first */
void T132f16(T0* C, T0* a1)
{
	T0* l1 = 0;
	T2 t1;
	t1 = (T132f2(C));
	if (t1) {
		((T132*)(C))->a5 = T197c4(a1);
		((T132*)(C))->a8 = (((T132*)(C))->a5);
		((T132*)(C))->a4 = ((T4)(geint32(1)));
	} else {
		l1 = (((T132*)(C))->a5);
		((T132*)(C))->a5 = T197c4(a1);
		T197f5(((T132*)(C))->a5, l1);
		((T132*)(C))->a4 = ((T4)((((T132*)(C))->a4)+((T4)(geint32(1)))));
	}
}

/* DS_BILINKABLE [LX_PROTO].put_right */
void T197f5(T0* C, T0* a1)
{
	((T197*)(C))->a3 = (a1);
	T197f7(a1, C);
}

/* DS_BILINKABLE [LX_PROTO].attach_left */
void T197f7(T0* C, T0* a1)
{
	((T197*)(C))->a2 = (a1);
}

/* DS_BILINKABLE [LX_PROTO].make */
T0* T197c4(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T197));
	((T197*)(C))->id = 197;
	((T197*)(C))->a1 = (a1);
	return C;
}

/* DS_BILINKED_LIST_CURSOR [LX_PROTO].remove */
void T149f15(T0* C)
{
	T132f25(((T149*)(C))->a5, C);
}

/* LX_PROTO_QUEUE.remove_at_cursor */
void T132f25(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	t1 = (T149f8(a1));
	if (t1) {
		T132f28(C);
	} else {
		t1 = (T149f9(a1));
		if (t1) {
			T132f15(C);
		} else {
			l1 = (((T149*)(a1))->a3);
			l2 = (((T197*)(l1))->a3);
			T132f29(C, l1, l2);
			t2 = (((T197*)(l1))->a2);
			T197f5(t2, l2);
			((T132*)(C))->a4 = ((T4)((((T132*)(C))->a4)-((T4)(geint32(1)))));
		}
	}
}

/* LX_PROTO_QUEUE.move_all_cursors */
void T132f29(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T2 t1;
	T0* t2;
	l1 = (((T132*)(C))->a6);
	t1 = ((l1)==(EIF_VOID));
	while (!(t1)) {
		t2 = (((T149*)(l1))->a3);
		t1 = ((t2)==(a1));
		if (t1) {
			T149f19(l1, a2);
		}
		l1 = (((T149*)(l1))->a4);
		t1 = ((l1)==(EIF_VOID));
	}
}

/* DS_BILINKED_LIST_CURSOR [LX_PROTO].set_current_cell */
void T149f19(T0* C, T0* a1)
{
	((T149*)(C))->a3 = (a1);
}

/* LX_PROTO_QUEUE.remove_last */
void T132f15(T0* C)
{
	T2 t1;
	T0* t2;
	t1 = ((((T132*)(C))->a4)==((T4)(geint32(1))));
	if (t1) {
		T132f17(C);
	} else {
		T132f18(C);
		t2 = (((T197*)(((T132*)(C))->a8))->a2);
		T132f19(C, t2);
		((T132*)(C))->a4 = ((T4)((((T132*)(C))->a4)-((T4)(geint32(1)))));
	}
}

/* LX_PROTO_QUEUE.set_last_cell */
void T132f19(T0* C, T0* a1)
{
	T197f8(a1);
	((T132*)(C))->a8 = (a1);
}

/* DS_BILINKABLE [LX_PROTO].forget_right */
void T197f8(T0* C)
{
	((T197*)(C))->a3 = (EIF_VOID);
}

/* LX_PROTO_QUEUE.move_last_cursors_after */
void T132f18(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* t1;
	T2 t2;
	l1 = (((T132*)(C))->a6);
	l4 = (((T132*)(C))->a8);
	t1 = (((T149*)(l1))->a3);
	t2 = ((t1)==(l4));
	if (t2) {
		T149f16(l1);
	}
	l2 = (l1);
	l1 = (((T149*)(l1))->a4);
	t2 = ((l1)==(EIF_VOID));
	while (!(t2)) {
		t1 = (((T149*)(l1))->a3);
		t2 = ((t1)==(l4));
		if (t2) {
			T149f16(l1);
			l3 = (((T149*)(l1))->a4);
			T149f17(l2, l3);
			T149f17(l1, EIF_VOID);
			l1 = (l3);
		} else {
			l2 = (l1);
			l1 = (((T149*)(l1))->a4);
		}
		t2 = ((l1)==(EIF_VOID));
	}
}

/* DS_BILINKED_LIST_CURSOR [LX_PROTO].set_next_cursor */
void T149f17(T0* C, T0* a1)
{
	((T149*)(C))->a4 = (a1);
}

/* DS_BILINKED_LIST_CURSOR [LX_PROTO].set_after */
void T149f16(T0* C)
{
	((T149*)(C))->a3 = (EIF_VOID);
	((T149*)(C))->a6 = (EIF_FALSE);
	((T149*)(C))->a1 = (EIF_TRUE);
}

/* LX_PROTO_QUEUE.wipe_out */
void T132f17(T0* C)
{
	T132f20(C);
	((T132*)(C))->a5 = (EIF_VOID);
	((T132*)(C))->a8 = (EIF_VOID);
	((T132*)(C))->a4 = ((T4)(geint32(0)));
}

/* LX_PROTO_QUEUE.move_all_cursors_after */
void T132f20(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	l1 = (((T132*)(C))->a6);
	t1 = ((l1)==(EIF_VOID));
	while (!(t1)) {
		T149f16(l1);
		l2 = (((T149*)(l1))->a4);
		T149f17(l1, EIF_VOID);
		l1 = (l2);
		t1 = ((l1)==(EIF_VOID));
	}
}

/* DS_BILINKED_LIST_CURSOR [LX_PROTO].is_last */
T2 T149f9(T0* C)
{
	T2 R = 0;
	R = (T132f11(((T149*)(C))->a5, C));
	return R;
}

/* LX_PROTO_QUEUE.cursor_is_last */
T2 T132f11(T0* C, T0* a1)
{
	T2 R = 0;
	T0* l1 = 0;
	T2 t1;
	l1 = (((T149*)(a1))->a3);
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((l1)==(((T132*)(C))->a8));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* LX_PROTO_QUEUE.remove_first */
void T132f28(T0* C)
{
	T0* l1 = 0;
	T2 t1;
	t1 = ((((T132*)(C))->a4)==((T4)(geint32(1))));
	if (t1) {
		T132f17(C);
	} else {
		l1 = (((T197*)(((T132*)(C))->a5))->a3);
		T132f29(C, ((T132*)(C))->a5, l1);
		T132f30(C, l1);
		((T132*)(C))->a4 = ((T4)((((T132*)(C))->a4)-((T4)(geint32(1)))));
	}
}

/* LX_PROTO_QUEUE.set_first_cell */
void T132f30(T0* C, T0* a1)
{
	T197f6(a1);
	((T132*)(C))->a5 = (a1);
}

/* DS_BILINKABLE [LX_PROTO].forget_left */
void T197f6(T0* C)
{
	((T197*)(C))->a2 = (EIF_VOID);
}

/* DS_BILINKED_LIST_CURSOR [LX_PROTO].is_first */
T2 T149f8(T0* C)
{
	T2 R = 0;
	R = (T132f10(((T149*)(C))->a5, C));
	return R;
}

/* LX_PROTO_QUEUE.cursor_is_first */
T2 T132f10(T0* C, T0* a1)
{
	T2 R = 0;
	T0* l1 = 0;
	T2 t1;
	l1 = (((T149*)(a1))->a3);
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((l1)==(((T132*)(C))->a5));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* LX_TRANSITION_TABLE [LX_DFA_STATE].cloned_object */
T0* T144f12(T0* C)
{
	T0* R = 0;
	R = (T144f13(C));
	return R;
}

/* LX_TRANSITION_TABLE [LX_DFA_STATE].twin */
T0* T144f13(T0* C)
{
	T0* R = 0;
	R = (T0*)gealloc(sizeof(T144));
	((T144*)(R))->id = 144;
	T144f16(R, C);
	return R;
}

/* LX_TRANSITION_TABLE [LX_DFA_STATE].copy */
void T144f16(T0* C, T0* a1)
{
	*(T144*)(C) = *(T144*)(a1);
	((T144*)(C))->a7 = (T209f1(((T144*)(C))->a9, ((T144*)(C))->a7));
}

/* KL_ARRAY_ROUTINES [LX_DFA_STATE].cloned_array */
T0* T209f1(T0* C, T0* a1)
{
	T0* R = 0;
	R = (T208f7(a1));
	return R;
}

/* ARRAY [LX_DFA_STATE].twin */
T0* T208f7(T0* C)
{
	T0* R = 0;
	R = (T0*)gealloc(sizeof(T208));
	((T208*)(R))->id = 208;
	T208f11(R, C);
	return R;
}

/* ARRAY [LX_DFA_STATE].copy */
void T208f11(T0* C, T0* a1)
{
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(C));
	if (t1) {
		*(T208*)(C) = *(T208*)(a1);
		t2 = (((T208*)(a1))->a1);
		t2 = (T194f4(t2));
		T208f13(C, t2);
	}
}

/* ARRAY [LX_DFA_STATE].set_area */
void T208f13(T0* C, T0* a1)
{
	((T208*)(C))->a1 = (a1);
}

/* SPECIAL [LX_DFA_STATE].twin */
T0* T194f4(T0* C)
{
	T0* R = 0;
	R = (T0*)gealloc(sizeof(T194)+((T194*)(C))->a1*sizeof(T0*));
	*(T194*)(R) = *(T194*)(C);
	memcpy(((T194*)(R))->a2,((T194*)(C))->a2,  ((T194*)(C))->a1*sizeof(T0*));
	return R;
}

/* LX_PROTO_QUEUE.put */
void T132f13(T0* C, T4 a1, T0* a2, T0* a3)
{
	T0* l1 = 0;
	T2 t1;
	l1 = T148c4(a1, a2, a3);
	t1 = (T4f5(&(((T132*)(C))->a4), (T4)(geint32(50))));
	if (t1) {
		T132f15(C);
	}
	T132f16(C, l1);
}

/* LX_PROTO.make */
T0* T148c4(T4 a1, T0* a2, T0* a3)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T148));
	((T148*)(C))->id = 148;
	((T148*)(C))->a1 = (a1);
	((T148*)(C))->a2 = (a2);
	((T148*)(C))->a3 = (a3);
	return C;
}

/* LX_TEMPLATE_LIST.last */
T0* T134f1(T0* C)
{
	T0* R = 0;
	R = (((T201*)(((T134*)(C))->a5))->a1);
	return R;
}

/* LX_TEMPLATE_LIST.put */
void T134f12(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T0* l6 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	l1 = (((T120*)(a1))->a3);
	l4 = (T144f6(l1));
	l5 = (T144f8(l1));
	l2 = T144c14(l4, l5);
	t1 = (T144f5(l1));
	l6 = T79c18(t1);
	l3 = (l4);
	t2 = (T4f1(&l3, l5));
	while (!(t2)) {
		t3 = (T144f3(l1, l3));
		t2 = ((t3)!=(EIF_VOID));
		if (t2) {
			T144f15(l2, a2, l3);
			T79f20(l6, l3);
		}
		l3 = ((T4)((l3)+((T4)(geint32(1)))));
		t2 = (T4f1(&l3, l5));
	}
	T134f14(C, l2);
	t2 = ((((T134*)(C))->a6)!=(EIF_VOID));
	if (t2) {
		T83f12(((T134*)(C))->a6, l6);
	}
}

/* LX_EQUIVALENCE_CLASSES.add */
void T83f12(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T4 l7 = 0;
	T4 l8 = 0;
	T2 l9 = 0;
	T2 l10 = 0;
	T4 l11 = 0;
	T0* l12 = 0;
	T4 t1;
	T4 t2;
	T2 t3;
	T2 t4;
	T0* t5;
	l8 = (((T79*)(a1))->a12);
	t1 = (T83f5(C));
	t2 = (T83f4(C));
	l12 = T146c5(t1, t2);
	l7 = ((T4)(geint32(1)));
	t3 = (T4f1(&l7, l8));
	while (!(t3)) {
		t1 = (T79f14(a1, l7));
		l1 = (T186f4(((T83*)(C))->a6, t1));
		l3 = (((T184*)(l1))->a2);
		l4 = (l1);
		l6 = ((T4)((l7)+((T4)(geint32(1)))));
		l2 = (((T184*)(l1))->a3);
		t3 = ((l2)==(EIF_VOID));
		while (!(t3)) {
			l5 = (((T184*)(l2))->a1);
			l9 = (EIF_FALSE);
			if (!(l9)) {
				t3 = (T4f1(&l6, l8));
			} else {
				t3 = EIF_TRUE;
			}
			while (!(t3)) {
				l11 = (T79f14(a1, l6));
				t3 = (T4f1(&l11, l5));
				if (t3) {
					l9 = (EIF_TRUE);
				} else {
					t3 = ((l11)==(l5));
					if (t3) {
						t4 = (T146f4(l12, l5));
						t3 = ((T2)(!(t4)));
					}
					if (t3) {
						T184f6(l4, l2);
						l4 = (l2);
						T146f6(l12, EIF_TRUE, l6);
						l10 = (EIF_TRUE);
						l9 = (EIF_TRUE);
					} else {
						l6 = ((T4)((l6)+((T4)(geint32(1)))));
					}
				}
				if (!(l9)) {
					t3 = (T4f1(&l6, l8));
				} else {
					t3 = EIF_TRUE;
				}
			}
			t3 = ((T2)(!(l10)));
			if (t3) {
				t3 = ((l3)==(EIF_VOID));
				if (t3) {
					T184f8(l2);
				} else {
					T184f6(l3, l2);
				}
				l3 = (l2);
			} else {
				l10 = (EIF_FALSE);
			}
			l2 = (((T184*)(l2))->a3);
			t3 = ((l2)==(EIF_VOID));
		}
		t5 = (((T184*)(l1))->a2);
		t3 = ((t5)!=(EIF_VOID));
		if (!(t3)) {
			t5 = (((T184*)(l1))->a2);
			t3 = ((l3)!=(t5));
		}
		if (t3) {
			T184f8(l1);
			T184f7(l3);
		}
		T184f7(l4);
		l7 = ((T4)((l7)+((T4)(geint32(1)))));
		t3 = (T4f1(&l7, l8));
		if (!(t3)) {
			t4 = (T146f4(l12, l7));
			t3 = ((T2)(!(t4)));
		}
		while (!(t3)) {
			l7 = ((T4)((l7)+((T4)(geint32(1)))));
			t3 = (T4f1(&l7, l8));
			if (!(t3)) {
				t4 = (T146f4(l12, l7));
				t3 = ((T2)(!(t4)));
			}
		}
		t3 = (T4f1(&l7, l8));
	}
}

/* DS_BILINKABLE [INTEGER].forget_right */
void T184f7(T0* C)
{
	((T184*)(C))->a3 = (EIF_VOID);
}

/* DS_BILINKABLE [INTEGER].forget_left */
void T184f8(T0* C)
{
	((T184*)(C))->a2 = (EIF_VOID);
}

/* DS_BILINKABLE [INTEGER].put_right */
void T184f6(T0* C, T0* a1)
{
	((T184*)(C))->a3 = (a1);
	T184f11(a1, C);
}

/* DS_BILINKABLE [INTEGER].attach_left */
void T184f11(T0* C, T0* a1)
{
	((T184*)(C))->a2 = (a1);
}

/* LX_SYMBOL_CLASS.item */
T4 T79f14(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T71*)(((T79*)(C))->a2))->a2[a1]);
	return R;
}

/* LX_TEMPLATE_LIST.put_last */
void T134f14(T0* C, T0* a1)
{
	T0* l1 = 0;
	T2 t1;
	t1 = (T134f8(C));
	if (t1) {
		((T134*)(C))->a9 = T201c3(a1);
		((T134*)(C))->a5 = (((T134*)(C))->a9);
		((T134*)(C))->a2 = ((T4)(geint32(1)));
	} else {
		l1 = (((T134*)(C))->a5);
		((T134*)(C))->a5 = T201c3(a1);
		T201f4(l1, ((T134*)(C))->a5);
		((T134*)(C))->a2 = ((T4)((((T134*)(C))->a2)+((T4)(geint32(1)))));
	}
}

/* DS_LINKABLE [LX_TRANSITION_TABLE [LX_DFA_STATE]].put_right */
void T201f4(T0* C, T0* a1)
{
	((T201*)(C))->a2 = (a1);
}

/* DS_LINKABLE [LX_TRANSITION_TABLE [LX_DFA_STATE]].make */
T0* T201c3(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T201));
	((T201*)(C))->id = 201;
	((T201*)(C))->a1 = (a1);
	return C;
}

/* LX_TEMPLATE_LIST.is_empty */
T2 T134f8(T0* C)
{
	T2 R = 0;
	R = ((((T134*)(C))->a2)==((T4)(geint32(0))));
	return R;
}

/* LX_SYMBOL_CLASS.put */
void T79f20(T0* C, T4 a1)
{
	T2 t1;
	T4 t2;
	t1 = (T79f7(C, a1));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t1 = (T79f8(C));
		t1 = ((T2)(!(t1)));
		if (t1) {
			t2 = (T79f9(C));
			t1 = (T4f1(&t2, a1));
		}
		if (t1) {
			((T79*)(C))->a10 = (EIF_TRUE);
		}
		T79f21(C, a1);
	}
}

/* LX_SYMBOL_CLASS.force_last */
void T79f21(T0* C, T4 a1)
{
	T2 t1;
	T4 t2;
	t1 = (T79f11(C, (T4)(geint32(1))));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = ((T4)((((T79*)(C))->a12)+((T4)(geint32(1)))));
		t2 = (T79f13(C, t2));
		T79f22(C, t2);
	}
	((T79*)(C))->a12 = ((T4)((((T79*)(C))->a12)+((T4)(geint32(1)))));
	((T71*)(((T79*)(C))->a2))->a2[((T79*)(C))->a12] = (a1);
}

/* LX_SYMBOL_CLASS.resize */
void T79f22(T0* C, T4 a1)
{
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T79*)(C))->a2 = (T72f2(((T79*)(C))->a1, ((T79*)(C))->a2, t1));
	((T79*)(C))->a3 = (a1);
}

/* KL_SPECIAL_ROUTINES [INTEGER].resize */
T0* T72f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T71*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T71f4(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [INTEGER].resized_area */
T0* T71f4(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	R = T71c6(a1);
	l2 = (((T71*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T71*)(C))->a2[l1]);
		((T71*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* LX_SYMBOL_CLASS.new_capacity */
T4 T79f13(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* LX_SYMBOL_CLASS.extendible */
T2 T79f11(T0* C, T4 a1)
{
	T2 R = 0;
	T4 t1;
	t1 = ((T4)((((T79*)(C))->a12)+(a1)));
	R = (T4f5(&(((T79*)(C))->a3), t1));
	return R;
}

/* LX_SYMBOL_CLASS.last */
T4 T79f9(T0* C)
{
	T4 R = 0;
	R = (((T71*)(((T79*)(C))->a2))->a2[((T79*)(C))->a12]);
	return R;
}

/* LX_SYMBOL_CLASS.is_empty */
T2 T79f8(T0* C)
{
	T2 R = 0;
	R = ((((T79*)(C))->a12)==((T4)(geint32(0))));
	return R;
}

/* LX_SYMBOL_CLASS.has */
T2 T79f7(T0* C, T4 a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T2 l2 = 0;
	T2 t1;
	T4 t2;
	if (((T79*)(C))->a10) {
		R = (T79f15(C, a1));
	} else {
		t1 = (T79f8(C));
		t1 = ((T2)(!(t1)));
		if (t1) {
			t2 = (T79f9(C));
			t1 = ((t2)==(a1));
			if (t1) {
				R = (EIF_TRUE);
			} else {
				t2 = (T79f9(C));
				t1 = (T4f1(&t2, a1));
				if (t1) {
					l1 = ((T4)(geint32(1)));
					if (!(R)) {
						t1 = (l2);
					} else {
						t1 = EIF_TRUE;
					}
					while (!(t1)) {
						t2 = (T79f14(C, l1));
						t1 = ((t2)==(a1));
						if (t1) {
							R = (EIF_TRUE);
						} else {
							t2 = (T79f14(C, l1));
							t1 = (T4f1(&t2, a1));
							if (t1) {
								l2 = (EIF_TRUE);
							} else {
								l1 = ((T4)((l1)+((T4)(geint32(1)))));
							}
						}
						if (!(R)) {
							t1 = (l2);
						} else {
							t1 = EIF_TRUE;
						}
					}
				}
			}
		}
	}
	return R;
}

/* LX_SYMBOL_CLASS.arrayed_has */
T2 T79f15(T0* C, T4 a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T4 t2;
	l1 = (((T79*)(C))->a12);
	l2 = (((T79*)(C))->a16);
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t1)) {
			t2 = (((T71*)(((T79*)(C))->a2))->a2[l1]);
			t1 = ((T2)gevoid(l2, t2, a1));
			if (t1) {
				R = (EIF_TRUE);
				l1 = ((T4)(geint32(0)));
			} else {
				l1 = ((T4)((l1)-((T4)(geint32(1)))));
			}
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
		}
	} else {
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t1)) {
			t2 = (((T71*)(((T79*)(C))->a2))->a2[l1]);
			t1 = ((t2)==(a1));
			if (t1) {
				R = (EIF_TRUE);
				l1 = ((T4)(geint32(0)));
			} else {
				l1 = ((T4)((l1)-((T4)(geint32(1)))));
			}
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
		}
	}
	return R;
}

/* LX_SYMBOL_CLASS.make */
T0* T79c18(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T79));
	((T79*)(C))->id = 79;
	((T79*)(C))->a1 = T72c4();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T79*)(C))->a2 = (T72f1(((T79*)(C))->a1, t1));
	((T79*)(C))->a3 = (a1);
	((T79*)(C))->a4 = (T79f5(C));
	return C;
}

/* LX_SYMBOL_CLASS.new_cursor */
T0* T79f5(T0* C)
{
	T0* R = 0;
	R = T177c2(C);
	return R;
}

/* DS_BILINKED_LIST_CURSOR [LX_PROTO].go_after */
void T149f13(T0* C)
{
	T132f23(((T149*)(C))->a5, C);
}

/* LX_PROTO_QUEUE.cursor_go_after */
void T132f23(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 t1;
	l1 = (T132f9(C, a1));
	T149f16(a1);
	t1 = ((T2)(!(l1)));
	if (t1) {
		T132f27(C, a1);
	}
}

/* LX_PROTO_QUEUE.remove_traversing_cursor */
void T132f27(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T132*)(C))->a6));
	if (t1) {
		l2 = (((T132*)(C))->a6);
		l1 = (((T149*)(l2))->a4);
		t1 = ((l1)==(a1));
		if (!(t1)) {
			t1 = ((l1)==(EIF_VOID));
		}
		while (!(t1)) {
			l2 = (l1);
			l1 = (((T149*)(l1))->a4);
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T149*)(a1))->a4);
			T149f17(l2, t2);
			T149f17(a1, EIF_VOID);
		}
	}
}

/* LX_PROTO_QUEUE.cursor_off */
T2 T132f9(T0* C, T0* a1)
{
	T2 R = 0;
	T0* t1;
	t1 = (((T149*)(a1))->a3);
	R = ((t1)==(EIF_VOID));
	return R;
}

/* LX_TRANSITION_TABLE [LX_DFA_STATE].difference */
T0* T144f11(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T4 t1;
	T4 t2;
	T2 t3;
	T0* t4;
	t1 = (T144f6(C));
	t2 = (T144f8(C));
	R = T144c14(t1, t2);
	l2 = (T144f8(C));
	l1 = (T144f6(C));
	t3 = (T4f1(&l1, l2));
	while (!(t3)) {
		l3 = (T144f3(C, l1));
		t4 = (T144f3(a1, l1));
		t3 = ((l3)!=(t4));
		if (t3) {
			t3 = ((l3)==(EIF_VOID));
			if (!(t3)) {
				t4 = (T120f9(l3));
				t3 = ((l3)==(t4));
			}
			if (t3) {
				T144f15(R, a2, l1);
			} else {
				T144f15(R, l3, l1);
			}
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t3 = (T4f1(&l1, l2));
	}
	return R;
}

/* LX_COMPRESSED_DFA.null_state */
unsigned char ge98os4013 = '\0';
T0* ge98ov4013;
T0* T44f63(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	if (ge98os4013) {
		return ge98ov4013;
	} else {
		ge98os4013 = '\1';
	}
	l1 = T122c23((T4)(geint32(0)));
	R = T120c18(l1, ((T44*)(C))->a30, ((T44*)(C))->a31);
	T120f19(R, (T4)(geint32(0)));
	ge98ov4013 = R;
	return R;
}

/* LX_DFA_STATE.set_id */
void T120f19(T0* C, T4 a1)
{
	((T120*)(C))->a8 = (a1);
}

/* LX_DFA_STATE.make */
T0* T120c18(T0* a1, T4 a2, T4 a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	T0* C;
	C = (T0*)gealloc(sizeof(T120));
	((T120*)(C))->id = 120;
	l2 = (((T122*)(a1))->a1);
	((T120*)(C))->a2 = T122c23(l2);
	((T120*)(C))->a3 = T144c14(a2, a3);
	((T120*)(C))->a1 = T45c15(l2);
	((T120*)(C))->a4 = T45c15(l2);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l3 = (T122f2(a1, l1));
		t2 = (((T121*)(l3))->a2);
		t1 = ((t2)!=(EIF_VOID));
		if (t1) {
			t2 = (((T121*)(l3))->a2);
			if ((t2)==EIF_VOID) {
				l5 = EIF_VOID;
			} else {
				switch ((t2)->id) {
				case 179:
					l5 = t2;
					break;
				default:
					l5 = EIF_VOID;
				}
			}
			t1 = ((l5)==(EIF_VOID));
			if (t1) {
				T122f27(((T120*)(C))->a2, l3);
				t3 = (((T121*)(l3))->a4);
				((T120*)(C))->a5 = ((T4)((((T120*)(C))->a5)+(t3)));
			} else {
				l4 = (((T179*)(l5))->a1);
				t1 = (T122f3(a1, l4));
				t1 = ((T2)(!(t1)));
				if (t1) {
					T122f27(a1, l4);
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				}
			}
		}
		t2 = (((T121*)(l3))->a3);
		t1 = ((t2)!=(EIF_VOID));
		if (t1) {
			t2 = (((T121*)(l3))->a3);
			l4 = (((T179*)(t2))->a1);
			t1 = (T122f3(a1, l4));
			t1 = ((T2)(!(t1)));
			if (t1) {
				T122f27(a1, l4);
				l2 = ((T4)((l2)+((T4)(geint32(1)))));
			}
		}
		t1 = (T121f5(l3));
		if (t1) {
			t1 = (T121f6(l3));
			if (t1) {
				t2 = (((T121*)(l3))->a7);
				T45f16(((T120*)(C))->a4, t2);
			} else {
				t2 = (((T121*)(l3))->a7);
				T45f16(((T120*)(C))->a1, t2);
			}
			t1 = (T122f4(((T120*)(C))->a2));
			if (!(t1)) {
				t2 = (T122f5(((T120*)(C))->a2));
				t1 = ((t2)!=(l3));
			}
			if (t1) {
				T122f27(((T120*)(C))->a2, l3);
				t3 = (((T121*)(l3))->a4);
				((T120*)(C))->a5 = ((T4)((((T120*)(C))->a5)+(t3)));
			}
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
	t2 = (T120f6(C));
	T122f29(((T120*)(C))->a2, t2);
	t1 = (T45f13(((T120*)(C))->a1));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = (T120f7(C));
		T45f19(((T120*)(C))->a1, t2);
		t2 = (T45f14(((T120*)(C))->a1));
		T46f24(t2, EIF_TRUE);
	}
	t2 = (T120f7(C));
	T45f19(((T120*)(C))->a4, t2);
	return C;
}

/* LX_RULE.set_useful */
void T46f24(T0* C, T2 a1)
{
	((T46*)(C))->a12 = (a1);
}

/* LX_DFA_STATE.rule_sorter */
unsigned char ge57os1450 = '\0';
T0* ge57ov1450;
T0* T120f7(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	if (ge57os1450) {
		return ge57ov1450;
	} else {
		ge57os1450 = '\1';
	}
	l1 = T128c2();
	R = T126c2(l1);
	ge57ov1450 = R;
	return R;
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].sort */
void T122f29(T0* C, T0* a1)
{
	T188f3(a1, C);
}

/* DS_BUBBLE_SORTER [LX_NFA_STATE].sort */
void T188f3(T0* C, T0* a1)
{
	T188f4(C, a1, ((T188*)(C))->a1);
}

/* DS_BUBBLE_SORTER [LX_NFA_STATE].sort_with_comparator */
void T188f4(T0* C, T0* a1, T0* a2)
{
	T2 t1;
	T4 t2;
	t1 = (T122f4(a1));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = (((T122*)(a1))->a1);
		T188f5(C, a1, a2, (T4)(geint32(1)), t2);
	}
}

/* DS_BUBBLE_SORTER [LX_NFA_STATE].subsort_with_comparator */
void T188f5(T0* C, T0* a1, T0* a2, T4 a3, T4 a4)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T2 t1;
	T4 t2;
	l1 = (a4);
	t1 = (T4f6(&l1, a3));
	while (!(t1)) {
		l2 = (a3);
		t1 = (T4f5(&l2, l1));
		while (!(t1)) {
			l4 = (T122f2(a1, l2));
			t2 = ((T4)((l2)+((T4)(geint32(1)))));
			l5 = (T122f2(a1, t2));
			t1 = (T217f1(a2, l5, l4));
			if (t1) {
				T122f26(a1, l5, l2);
				t2 = ((T4)((l2)+((T4)(geint32(1)))));
				T122f26(a1, l4, t2);
				l3 = (EIF_TRUE);
			}
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = (T4f5(&l2, l1));
		}
		if (l3) {
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
			l3 = (EIF_FALSE);
		} else {
			l1 = (a3);
		}
		t1 = (T4f6(&l1, a3));
	}
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].replace */
void T122f26(T0* C, T0* a1, T4 a2)
{
	((T190*)(((T122*)(C))->a6))->a2[a2] = (a1);
}

/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE].less_than */
T2 T217f1(T0* C, T0* a1, T0* a2)
{
	T2 R = 0;
	R = (T121f9(a1, a2));
	return R;
}

/* LX_NFA_STATE.infix "<" */
T2 T121f9(T0* C, T0* a1)
{
	T2 R = 0;
	T4 t1;
	t1 = (((T121*)(a1))->a4);
	R = ((T2)((((T121*)(C))->a4)<(t1)));
	return R;
}

/* LX_DFA_STATE.bubble_sorter */
unsigned char ge57os1449 = '\0';
T0* ge57ov1449;
T0* T120f6(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	if (ge57os1449) {
		return ge57ov1449;
	} else {
		ge57os1449 = '\1';
	}
	l1 = T217c2();
	R = T188c2(l1);
	ge57ov1449 = R;
	return R;
}

/* DS_BUBBLE_SORTER [LX_NFA_STATE].make */
T0* T188c2(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T188));
	((T188*)(C))->id = 188;
	((T188*)(C))->a1 = (a1);
	return C;
}

/* KL_COMPARABLE_COMPARATOR [LX_NFA_STATE].make */
T0* T217c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T217));
	((T217*)(C))->id = 217;
	return C;
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].last */
T0* T122f5(T0* C)
{
	T0* R = 0;
	R = (((T190*)(((T122*)(C))->a6))->a2[((T122*)(C))->a1]);
	return R;
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].is_empty */
T2 T122f4(T0* C)
{
	T2 R = 0;
	R = ((((T122*)(C))->a1)==((T4)(geint32(0))));
	return R;
}

/* DS_ARRAYED_LIST [LX_RULE].force_last */
void T45f16(T0* C, T0* a1)
{
	T2 t1;
	T4 t2;
	t1 = (T45f10(C, (T4)(geint32(1))));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = ((T4)((((T45*)(C))->a1)+((T4)(geint32(1)))));
		t2 = (T45f11(C, t2));
		T45f20(C, t2);
	}
	((T45*)(C))->a1 = ((T4)((((T45*)(C))->a1)+((T4)(geint32(1)))));
	((T123*)(((T45*)(C))->a4))->a2[((T45*)(C))->a1] = (a1);
}

/* DS_ARRAYED_LIST [LX_RULE].resize */
void T45f20(T0* C, T4 a1)
{
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T45*)(C))->a4 = (T156f2(((T45*)(C))->a6, ((T45*)(C))->a4, t1));
	((T45*)(C))->a7 = (a1);
}

/* KL_SPECIAL_ROUTINES [LX_RULE].resize */
T0* T156f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T123*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T123f3(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [LX_RULE].resized_area */
T0* T123f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T123c4(a1);
	l2 = (((T123*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T123*)(C))->a2[l1]);
		((T123*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* DS_ARRAYED_LIST [LX_RULE].new_capacity */
T4 T45f11(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* DS_ARRAYED_LIST [LX_RULE].extendible */
T2 T45f10(T0* C, T4 a1)
{
	T2 R = 0;
	T4 t1;
	t1 = ((T4)((((T45*)(C))->a1)+(a1)));
	R = (T4f5(&(((T45*)(C))->a7), t1));
	return R;
}

/* LX_NFA_STATE.is_accepting_head */
T2 T121f6(T0* C)
{
	T2 R = 0;
	T2 t1;
	t1 = (T121f5(C));
	if (t1) {
		t1 = ((T2)(!(((T121*)(C))->a1)));
	}
	if (t1) {
		R = (T121f10(C));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* LX_NFA_STATE.has_transition */
T2 T121f10(T0* C)
{
	T2 R = 0;
	T2 t1;
	t1 = ((((T121*)(C))->a2)!=(EIF_VOID));
	if (!(t1)) {
		R = ((((T121*)(C))->a3)!=(EIF_VOID));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* LX_NFA_STATE.is_accepting */
T2 T121f5(T0* C)
{
	T2 R = 0;
	R = ((((T121*)(C))->a7)!=(EIF_VOID));
	return R;
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].force_last */
void T122f27(T0* C, T0* a1)
{
	T2 t1;
	T4 t2;
	t1 = (T122f12(C, (T4)(geint32(1))));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = ((T4)((((T122*)(C))->a1)+((T4)(geint32(1)))));
		t2 = (T122f13(C, t2));
		T122f31(C, t2);
	}
	((T122*)(C))->a1 = ((T4)((((T122*)(C))->a1)+((T4)(geint32(1)))));
	((T190*)(((T122*)(C))->a6))->a2[((T122*)(C))->a1] = (a1);
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].resize */
void T122f31(T0* C, T4 a1)
{
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T122*)(C))->a6 = (T191f2(((T122*)(C))->a8, ((T122*)(C))->a6, t1));
	((T122*)(C))->a9 = (a1);
}

/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].resize */
T0* T191f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T190*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T190f3(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [LX_NFA_STATE].resized_area */
T0* T190f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T190c4(a1);
	l2 = (((T190*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T190*)(C))->a2[l1]);
		((T190*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* SPECIAL [LX_NFA_STATE].make */
T0* T190c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T190)+a1*sizeof(T0*));
	((T190*)(C))->a1 = a1;
	((T190*)(C))->id = 190;
	return C;
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].new_capacity */
T4 T122f13(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].extendible */
T2 T122f12(T0* C, T4 a1)
{
	T2 R = 0;
	T4 t1;
	t1 = ((T4)((((T122*)(C))->a1)+(a1)));
	R = (T4f5(&(((T122*)(C))->a9), t1));
	return R;
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].make */
T0* T122c23(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T122));
	((T122*)(C))->id = 122;
	((T122*)(C))->a8 = T191c3();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T122*)(C))->a6 = (T191f1(((T122*)(C))->a8, t1));
	((T122*)(C))->a9 = (a1);
	((T122*)(C))->a10 = (T122f11(C));
	return C;
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].new_cursor */
T0* T122f11(T0* C)
{
	T0* R = 0;
	R = T192c7(C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].make */
T0* T192c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T192));
	((T192*)(C))->id = 192;
	((T192*)(C))->a5 = (a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].make */
T0* T191f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T222c2(a1);
	R = (((T222*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [LX_NFA_STATE].make_area */
T0* T222c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T222));
	((T222*)(C))->id = 222;
	((T222*)(C))->a1 = T190c4(a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [LX_NFA_STATE].default_create */
T0* T191c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T191));
	((T191*)(C))->id = 191;
	return C;
}

/* DS_BILINKED_LIST_CURSOR [LX_PROTO].go_to */
void T149f12(T0* C, T0* a1)
{
	T132f22(((T149*)(C))->a5, C, a1);
}

/* LX_PROTO_QUEUE.cursor_go_to */
void T132f22(T0* C, T0* a1, T0* a2)
{
	T2 l1 = 0;
	T0* t1;
	T2 t2;
	T2 t3;
	l1 = (T132f9(C, a1));
	t1 = (((T149*)(a2))->a3);
	t2 = (((T149*)(a2))->a6);
	t3 = (((T149*)(a2))->a1);
	T149f18(a1, t1, t2, t3);
	t2 = (T149f7(a1));
	t2 = ((T2)(!(t2)));
	if (t2) {
		if (l1) {
			T132f26(C, a1);
		}
	} else {
		t2 = ((T2)(!(l1)));
		if (t2) {
			T132f27(C, a1);
		}
	}
}

/* LX_PROTO_QUEUE.add_traversing_cursor */
void T132f26(T0* C, T0* a1)
{
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T132*)(C))->a6));
	if (t1) {
		t2 = (((T149*)(((T132*)(C))->a6))->a4);
		T149f17(a1, t2);
		T149f17(((T132*)(C))->a6, a1);
	}
}

/* DS_BILINKED_LIST_CURSOR [LX_PROTO].off */
T2 T149f7(T0* C)
{
	T2 R = 0;
	R = ((((T149*)(C))->a3)==(EIF_VOID));
	return R;
}

/* DS_BILINKED_LIST_CURSOR [LX_PROTO].set */
void T149f18(T0* C, T0* a1, T2 a2, T2 a3)
{
	((T149*)(C))->a3 = (a1);
	((T149*)(C))->a6 = (a2);
	((T149*)(C))->a1 = (a3);
}

/* DS_BILINKED_LIST_CURSOR [LX_PROTO].forth */
void T149f14(T0* C)
{
	T132f24(((T149*)(C))->a5, C);
}

/* LX_PROTO_QUEUE.cursor_forth */
void T132f24(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	t1 = (((T149*)(a1))->a6);
	if (t1) {
		l1 = (EIF_TRUE);
		l3 = (((T132*)(C))->a5);
	} else {
		t2 = (((T149*)(a1))->a3);
		l3 = (((T197*)(t2))->a3);
	}
	l2 = ((l3)==(EIF_VOID));
	T149f18(a1, l3, EIF_FALSE, l2);
	if (l2) {
		t1 = ((T2)(!(l1)));
		if (t1) {
			T132f27(C, a1);
		}
	} else {
		if (l1) {
			T132f26(C, a1);
		}
	}
}

/* DS_BILINKED_LIST_CURSOR [LX_PROTO].item */
T0* T149f2(T0* C)
{
	T0* R = 0;
	R = (((T197*)(((T149*)(C))->a3))->a1);
	return R;
}

/* DS_BILINKED_LIST_CURSOR [LX_PROTO].start */
void T149f11(T0* C)
{
	T132f21(((T149*)(C))->a5, C);
}

/* LX_PROTO_QUEUE.cursor_start */
void T132f21(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 l2 = 0;
	T2 t1;
	l1 = (T132f9(C, a1));
	l2 = ((((T132*)(C))->a5)==(EIF_VOID));
	T149f18(a1, ((T132*)(C))->a5, EIF_FALSE, l2);
	t1 = ((T2)(!(l2)));
	if (t1) {
		t1 = (l1);
	}
	if (t1) {
		T132f26(C, a1);
	}
}

/* LX_PROTO_QUEUE.first */
T0* T132f3(T0* C)
{
	T0* R = 0;
	R = (((T197*)(((T132*)(C))->a5))->a1);
	return R;
}

/* LX_PROTO_QUEUE.is_empty */
T2 T132f2(T0* C)
{
	T2 R = 0;
	R = ((((T132*)(C))->a4)==((T4)(geint32(0))));
	return R;
}

/* LX_PROTO_QUEUE.new_cursor */
T0* T132f1(T0* C)
{
	T0* R = 0;
	R = T149c10(C);
	return R;
}

/* DS_BILINKED_LIST_CURSOR [LX_PROTO].make */
T0* T149c10(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T149));
	((T149*)(C))->id = 149;
	((T149*)(C))->a5 = (a1);
	((T149*)(C))->a6 = (EIF_TRUE);
	return C;
}

/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].go_after */
void T147f10(T0* C)
{
	T125f20(((T147*)(C))->a3, C);
}

/* DS_ARRAYED_LIST [LX_DFA_STATE].cursor_go_after */
void T125f20(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 t1;
	l1 = (T147f5(a1));
	T147f11(a1, (T4)(geint32(-1)));
	t1 = ((T2)(!(l1)));
	if (t1) {
		T125f22(C, a1);
	}
}

/* DS_ARRAYED_LIST [LX_DFA_STATE].remove_traversing_cursor */
void T125f22(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T125*)(C))->a7));
	if (t1) {
		l2 = (((T125*)(C))->a7);
		l1 = (((T147*)(l2))->a6);
		t1 = ((l1)==(a1));
		if (!(t1)) {
			t1 = ((l1)==(EIF_VOID));
		}
		while (!(t1)) {
			l2 = (l1);
			l1 = (((T147*)(l1))->a6);
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T147*)(a1))->a6);
			T147f12(l2, t2);
			T147f12(a1, EIF_VOID);
		}
	}
}

/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].set_next_cursor */
void T147f12(T0* C, T0* a1)
{
	((T147*)(C))->a6 = (a1);
}

/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].set_position */
void T147f11(T0* C, T4 a1)
{
	((T147*)(C))->a4 = (a1);
}

/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].off */
T2 T147f5(T0* C)
{
	T2 R = 0;
	R = (T125f13(((T147*)(C))->a3, C));
	return R;
}

/* DS_ARRAYED_LIST [LX_DFA_STATE].cursor_off */
T2 T125f13(T0* C, T0* a1)
{
	T2 R = 0;
	T2 t1;
	t1 = (T125f8(C, a1));
	if (!(t1)) {
		R = (T125f14(C, a1));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* DS_ARRAYED_LIST [LX_DFA_STATE].cursor_before */
T2 T125f14(T0* C, T0* a1)
{
	T2 R = 0;
	T4 t1;
	t1 = (((T147*)(a1))->a4);
	R = ((t1)==((T4)(geint32(0))));
	return R;
}

/* DS_ARRAYED_LIST [LX_DFA_STATE].cursor_after */
T2 T125f8(T0* C, T0* a1)
{
	T2 R = 0;
	T4 t1;
	t1 = (((T147*)(a1))->a4);
	R = ((t1)==((T4)(geint32(-1))));
	return R;
}

/* DS_ARRAYED_LIST [LX_DFA_STATE].put_last */
void T125f16(T0* C, T0* a1)
{
	((T125*)(C))->a1 = ((T4)((((T125*)(C))->a1)+((T4)(geint32(1)))));
	((T194*)(((T125*)(C))->a5))->a2[((T125*)(C))->a1] = (a1);
}

/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].index */
T4 T147f2(T0* C)
{
	T4 R = 0;
	R = (T125f9(((T147*)(C))->a3, C));
	return R;
}

/* DS_ARRAYED_LIST [LX_DFA_STATE].cursor_index */
T4 T125f9(T0* C, T0* a1)
{
	T4 R = 0;
	T2 t1;
	R = (((T147*)(a1))->a4);
	t1 = ((R)==((T4)(geint32(-1))));
	if (t1) {
		R = ((T4)((((T125*)(C))->a1)+((T4)(geint32(1)))));
	}
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].after */
T2 T147f1(T0* C)
{
	T2 R = 0;
	R = (T125f8(((T147*)(C))->a3, C));
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].search_forth */
void T147f9(T0* C, T0* a1)
{
	T125f19(((T147*)(C))->a3, C, a1);
}

/* DS_ARRAYED_LIST [LX_DFA_STATE].cursor_search_forth */
void T125f19(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 l4 = 0;
	T2 t1;
	T0* t2;
	l4 = (T147f5(a1));
	l1 = (T147f2(a1));
	l2 = (((T125*)(C))->a1);
	l3 = (((T125*)(C))->a12);
	t1 = ((l3)!=(EIF_VOID));
	if (t1) {
		t1 = (T4f1(&l1, l2));
		if (!(t1)) {
			t2 = (T125f2(C, l1));
			t1 = ((T2)gevoid(l3, t2, a2));
		}
		while (!(t1)) {
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l2));
			if (!(t1)) {
				t2 = (T125f2(C, l1));
				t1 = ((T2)gevoid(l3, t2, a2));
			}
		}
	} else {
		t1 = (T4f1(&l1, l2));
		if (!(t1)) {
			t2 = (T125f2(C, l1));
			t1 = ((t2)==(a2));
		}
		while (!(t1)) {
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l2));
			if (!(t1)) {
				t2 = (T125f2(C, l1));
				t1 = ((t2)==(a2));
			}
		}
	}
	t1 = (T4f1(&l1, l2));
	if (t1) {
		T147f11(a1, (T4)(geint32(-1)));
		t1 = ((T2)(!(l4)));
		if (t1) {
			T125f22(C, a1);
		}
	} else {
		T147f11(a1, l1);
		if (l4) {
			T125f21(C, a1);
		}
	}
}

/* DS_ARRAYED_LIST [LX_DFA_STATE].add_traversing_cursor */
void T125f21(T0* C, T0* a1)
{
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T125*)(C))->a7));
	if (t1) {
		t2 = (((T147*)(((T125*)(C))->a7))->a6);
		T147f12(a1, t2);
		T147f12(((T125*)(C))->a7, a1);
	}
}

/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].start */
void T147f8(T0* C)
{
	T125f18(((T147*)(C))->a3, C);
}

/* DS_ARRAYED_LIST [LX_DFA_STATE].cursor_start */
void T125f18(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 t1;
	l1 = (T147f5(a1));
	t1 = (T125f11(C));
	if (t1) {
		T147f11(a1, (T4)(geint32(-1)));
	} else {
		T147f11(a1, (T4)(geint32(1)));
		if (l1) {
			T125f21(C, a1);
		}
	}
}

/* DS_ARRAYED_LIST [LX_DFA_STATE].is_empty */
T2 T125f11(T0* C)
{
	T2 R = 0;
	R = ((((T125*)(C))->a1)==((T4)(geint32(0))));
	return R;
}

/* DS_ARRAYED_LIST [LX_DFA_STATE].new_cursor */
T0* T125f4(T0* C)
{
	T0* R = 0;
	R = T147c7(C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [LX_DFA_STATE].make */
T0* T147c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T147));
	((T147*)(C))->id = 147;
	((T147*)(C))->a3 = (a1);
	return C;
}

/* DS_ARRAYED_LIST [LX_DFA_STATE].make */
T0* T125c15(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T125));
	((T125*)(C))->id = 125;
	((T125*)(C))->a6 = T195c3();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T125*)(C))->a5 = (T195f1(((T125*)(C))->a6, t1));
	((T125*)(C))->a3 = (a1);
	((T125*)(C))->a7 = (T125f4(C));
	return C;
}

/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].make */
T0* T195f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T223c2(a1);
	R = (((T223*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [LX_DFA_STATE].make_area */
T0* T223c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T223));
	((T223*)(C))->id = 223;
	((T223*)(C))->a1 = T194c5(a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].default_create */
T0* T195c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T195));
	((T195*)(C))->id = 195;
	return C;
}

/* LX_COMPRESSED_DFA.build_transitions */
void T44f99(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T4 t1;
	T4 t2;
	T2 t3;
	T0* t4;
	l2 = (T135f1(((T44*)(C))->a40));
	t1 = (((T125*)(((T44*)(C))->a4))->a3);
	t2 = (((T125*)(((T44*)(C))->a4))->a1);
	t1 = ((T4)((t1)-(t2)));
	t3 = ((T2)((t1)<(l2)));
	if (t3) {
		t1 = (((T125*)(((T44*)(C))->a4))->a3);
		t1 = ((T4)((t1)+(l2)));
		t1 = ((T4)((t1)+((T4)(geint32(1000)))));
		T44f114(C, t1);
	}
	T135f10(((T44*)(C))->a40);
	T120f20(a1, ((T44*)(C))->a40);
	l6 = (((T135*)(((T44*)(C))->a40))->a2);
	l5 = (((T120*)(a1))->a3);
	l1 = (((T44*)(C))->a30);
	t3 = (T4f1(&l1, ((T44*)(C))->a31));
	while (!(t3)) {
		t3 = (T146f4(l6, l1));
		if (t3) {
			t3 = (T135f3(((T44*)(C))->a40, l1));
			if (t3) {
				t4 = (T120f12(a1, l1));
				l4 = (T44f60(C, t4));
			} else {
				l3 = (T135f4(((T44*)(C))->a40, l1));
				l4 = (T144f3(l5, l3));
			}
			T144f15(l5, l4, l1);
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t3 = (T4f1(&l1, ((T44*)(C))->a31));
	}
}

/* LX_SYMBOL_PARTITIONS.previous_symbol */
T4 T135f4(T0* C, T4 a1)
{
	T4 R = 0;
	T0* t1;
	t1 = (T186f4(((T135*)(C))->a5, a1));
	t1 = (((T184*)(t1))->a2);
	R = (((T184*)(t1))->a1);
	return R;
}

/* LX_COMPRESSED_DFA.new_state */
T0* T44f60(T0* C, T0* a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	l1 = ((T4)((((T44*)(C))->a8)+((T4)(geint32(1)))));
	l2 = (((T125*)(((T44*)(C))->a4))->a1);
	t1 = ((R)!=(EIF_VOID));
	if (!(t1)) {
		t1 = (T4f1(&l1, l2));
	}
	while (!(t1)) {
		R = (T125f2(((T44*)(C))->a4, l1));
		t1 = (T120f13(R, a1));
		t1 = ((T2)(!(t1)));
		if (t1) {
			R = (EIF_VOID);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
		}
		t1 = ((R)!=(EIF_VOID));
		if (!(t1)) {
			t1 = (T4f1(&l1, l2));
		}
	}
	t1 = ((R)==(EIF_VOID));
	if (t1) {
		R = (a1);
		T125f16(((T44*)(C))->a4, a1);
		t2 = (((T125*)(((T44*)(C))->a4))->a1);
		T120f19(a1, t2);
	}
	return R;
}

/* LX_DFA_STATE.is_equal */
T2 T120f13(T0* C, T0* a1)
{
	T2 R = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	t1 = (T120f16(C));
	t2 = (T168f1(t1, C, a1));
	if (t2) {
		t3 = (((T120*)(a1))->a5);
		t2 = ((((T120*)(C))->a5)==(t3));
	}
	if (t2) {
		t1 = (((T120*)(a1))->a2);
		R = (T122f19(((T120*)(C))->a2, t1));
	}
	return R;
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].is_equal */
T2 T122f19(T0* C, T0* a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	T0* t4;
	t1 = ((C)==(a1));
	if (t1) {
		R = (EIF_TRUE);
	} else {
		t2 = (T122f21(C));
		t1 = (T168f1(t2, C, a1));
		if (t1) {
			t3 = (((T122*)(a1))->a1);
			t1 = ((t3)==(((T122*)(C))->a1));
		}
		if (t1) {
			l3 = (((T122*)(a1))->a6);
			l1 = ((T4)(geint32(1)));
			l2 = (((T122*)(C))->a1);
			R = (EIF_TRUE);
			t1 = ((T2)(!(R)));
			if (!(t1)) {
				t1 = (T4f1(&l1, l2));
			}
			while (!(t1)) {
				t2 = (((T190*)(((T122*)(C))->a6))->a2[l1]);
				t4 = (((T190*)(l3))->a2[l1]);
				R = ((t2)==(t4));
				l1 = ((T4)((l1)+((T4)(geint32(1)))));
				t1 = ((T2)(!(R)));
				if (!(t1)) {
					t1 = (T4f1(&l1, l2));
				}
			}
		}
	}
	return R;
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].any_ */
T0* T122f21(T0* C)
{
	T0* R = 0;
	if (ge251os1454) {
		return ge251ov1454;
	} else {
		ge251os1454 = '\1';
	}
	R = T168c2();
	ge251ov1454 = R;
	return R;
}

/* LX_DFA_STATE.any_ */
T0* T120f16(T0* C)
{
	T0* R = 0;
	if (ge251os1454) {
		return ge251ov1454;
	} else {
		ge251os1454 = '\1';
	}
	R = T168c2();
	ge251ov1454 = R;
	return R;
}

/* LX_DFA_STATE.new_state */
T0* T120f12(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	T4 t4;
	l2 = (((T122*)(((T120*)(C))->a2))->a1);
	l4 = T122c23(l2);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		t2 = (T122f2(((T120*)(C))->a2, l1));
		l3 = (((T121*)(t2))->a2);
		t1 = ((l3)!=(EIF_VOID));
		if (t1) {
			t1 = (T180x6318(l3, a1));
		}
		if (t1) {
			t2 = (T180x6315(l3));
			T122f24(l4, t2);
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
	t3 = (T120f14(C));
	t4 = (T120f15(C));
	R = T120c18(l4, t3, t4);
	return R;
}

/* LX_DFA_STATE.maximum_symbol */
T4 T120f15(T0* C)
{
	T4 R = 0;
	R = (T144f8(((T120*)(C))->a3));
	return R;
}

/* LX_DFA_STATE.minimum_symbol */
T4 T120f14(T0* C)
{
	T4 R = 0;
	R = (T144f6(((T120*)(C))->a3));
	return R;
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].put_last */
void T122f24(T0* C, T0* a1)
{
	((T122*)(C))->a1 = ((T4)((((T122*)(C))->a1)+((T4)(geint32(1)))));
	((T190*)(((T122*)(C))->a6))->a2[((T122*)(C))->a1] = (a1);
}

/* LX_SYMBOL_PARTITIONS.is_representative */
T2 T135f3(T0* C, T4 a1)
{
	T2 R = 0;
	T0* t1;
	t1 = (T186f4(((T135*)(C))->a5, a1));
	t1 = (((T184*)(t1))->a2);
	R = ((t1)==(EIF_VOID));
	return R;
}

/* LX_DFA_STATE.partition */
void T120f20(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	l2 = (((T122*)(((T120*)(C))->a2))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		t2 = (T122f2(((T120*)(C))->a2, l1));
		l3 = (((T121*)(t2))->a2);
		t1 = ((l3)!=(EIF_VOID));
		if (t1) {
			T180x6319(l3, a1);
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
}

/* LX_SYMBOL_PARTITIONS.initialize */
void T135f10(T0* C)
{
	T135f10p1(C);
	T146f7(((T135*)(C))->a2);
}

/* ARRAY [BOOLEAN].clear_all */
void T146f7(T0* C)
{
	T145f5(((T146*)(C))->a1);
}

/* SPECIAL [BOOLEAN].clear_all */
void T145f5(T0* C)
{
	T4 l1 = 0;
	T2 l2 = 0;
	T4 t1;
	T2 t2;
	t1 = (((T145*)(C))->a1);
	l1 = ((T4)((t1)-((T4)(geint32(1)))));
	t2 = ((T2)((l1)<((T4)(geint32(0)))));
	while (!(t2)) {
		((T145*)(C))->a2[l1] = (l2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t2 = ((T2)((l1)<((T4)(geint32(0)))));
	}
}

/* LX_SYMBOL_PARTITIONS.initialize */
void T135f10p1(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T4 t1;
	T0* t2;
	T2 t3;
	l2 = (T135f6(C));
	t1 = (T135f7(C));
	t2 = (T186f4(((T135*)(C))->a5, t1));
	t1 = (T135f7(C));
	T184f5(t2, t1);
	t1 = (T135f7(C));
	l1 = ((T4)((t1)+((T4)(geint32(1)))));
	t3 = (T4f1(&l1, l2));
	while (!(t3)) {
		l3 = (T186f4(((T135*)(C))->a5, l1));
		t1 = ((T4)((l1)-((T4)(geint32(1)))));
		t2 = (T186f4(((T135*)(C))->a5, t1));
		T184f9(l3, t2);
		T184f5(l3, l1);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t3 = (T4f1(&l1, l2));
	}
	((T135*)(C))->a8 = ((T4)(geint32(0)));
}

/* DS_BILINKABLE [INTEGER].put_left */
void T184f9(T0* C, T0* a1)
{
	((T184*)(C))->a2 = (a1);
	T184f10(a1, C);
}

/* DS_BILINKABLE [INTEGER].attach_right */
void T184f10(T0* C, T0* a1)
{
	((T184*)(C))->a3 = (a1);
}

/* LX_SYMBOL_PARTITIONS.lower */
T4 T135f7(T0* C)
{
	T4 R = 0;
	R = (((T186*)(((T135*)(C))->a5))->a2);
	return R;
}

/* LX_SYMBOL_PARTITIONS.upper */
T4 T135f6(T0* C)
{
	T4 R = 0;
	R = (((T186*)(((T135*)(C))->a5))->a3);
	return R;
}

/* LX_COMPRESSED_DFA.resize */
void T44f114(T0* C, T4 a1)
{
	T0* t1;
	T125f17(((T44*)(C))->a4, a1);
	t1 = (T44f68(C));
	T151f2(t1, ((T44*)(C))->a44, (T4)(geint32(0)), a1);
	t1 = (T44f68(C));
	T151f2(t1, ((T44*)(C))->a45, (T4)(geint32(0)), a1);
}

/* DS_ARRAYED_LIST [LX_DFA_STATE].resize */
void T125f17(T0* C, T4 a1)
{
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T125*)(C))->a5 = (T195f2(((T125*)(C))->a6, ((T125*)(C))->a5, t1));
	((T125*)(C))->a3 = (a1);
}

/* KL_SPECIAL_ROUTINES [LX_DFA_STATE].resize */
T0* T195f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T194*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T194f3(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [LX_DFA_STATE].resized_area */
T0* T194f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T194c5(a1);
	l2 = (((T194*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T194*)(C))->a2[l1]);
		((T194*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* LX_SYMBOL_PARTITIONS.capacity */
T4 T135f1(T0* C)
{
	T4 R = 0;
	R = (T186f5(((T135*)(C))->a5));
	return R;
}

/* ARRAY [INTEGER].make */
T0* T130c7(T4 a1, T4 a2)
{
	T2 t1;
	T4 t2;
	T0* C;
	C = (T0*)gealloc(sizeof(T130));
	((T130*)(C))->id = 130;
	((T130*)(C))->a2 = (a1);
	((T130*)(C))->a3 = (a2);
	t1 = (T4f6(&a1, a2));
	if (t1) {
		t2 = ((T4)((a2)-(a1)));
		t2 = ((T4)((t2)+((T4)(geint32(1)))));
		T130f9(C, t2);
	} else {
		T130f9(C, (T4)(geint32(0)));
	}
	return C;
}

/* LX_SYMBOL_PARTITIONS.make */
T0* T135c9(T4 a1, T4 a2)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T135));
	((T135*)(C))->id = 135;
	((T135*)(C))->a2 = T146c5(a1, a2);
	T135f9p1(C, a1, a2);
	return C;
}

/* LX_SYMBOL_PARTITIONS.make */
void T135f9p1(T0* C, T4 a1, T4 a2)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T2 t1;
	((T135*)(C))->a5 = T186c6(a1, a2);
	l2 = (a1);
	t1 = (T4f1(&l2, a2));
	while (!(t1)) {
		l1 = T184c4(l2);
		T186f7(((T135*)(C))->a5, l1, l2);
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t1 = (T4f1(&l2, a2));
	}
	T135f10(C);
}

/* ARRAY [DS_BILINKABLE [INTEGER]].put */
void T186f7(T0* C, T0* a1, T4 a2)
{
	T4 t1;
	t1 = ((T4)((a2)-(((T186*)(C))->a2)));
	((T185*)(((T186*)(C))->a1))->a2[t1] = (a1);
}

/* DS_BILINKABLE [INTEGER].make */
T0* T184c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T184));
	((T184*)(C))->id = 184;
	((T184*)(C))->a1 = (a1);
	return C;
}

/* ARRAY [DS_BILINKABLE [INTEGER]].make */
T0* T186c6(T4 a1, T4 a2)
{
	T2 t1;
	T4 t2;
	T0* C;
	C = (T0*)gealloc(sizeof(T186));
	((T186*)(C))->id = 186;
	((T186*)(C))->a2 = (a1);
	((T186*)(C))->a3 = (a2);
	t1 = (T4f6(&a1, a2));
	if (t1) {
		t2 = ((T4)((a2)-(a1)));
		t2 = ((T4)((t2)+((T4)(geint32(1)))));
		T186f8(C, t2);
	} else {
		T186f8(C, (T4)(geint32(0)));
	}
	return C;
}

/* ARRAY [DS_BILINKABLE [INTEGER]].make_area */
void T186f8(T0* C, T4 a1)
{
	((T186*)(C))->a1 = T185c2(a1);
}

/* SPECIAL [DS_BILINKABLE [INTEGER]].make */
T0* T185c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T185)+a1*sizeof(T0*));
	((T185*)(C))->a1 = a1;
	((T185*)(C))->id = 185;
	return C;
}

/* LX_TEMPLATE_LIST.make */
T0* T134c11(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T134));
	((T134*)(C))->id = 134;
	T134f13(C);
	((T134*)(C))->a6 = (a1);
	return C;
}

/* LX_TEMPLATE_LIST.make_list */
void T134f13(T0* C)
{
	((T134*)(C))->a7 = (T134f3(C));
}

/* LX_EQUIVALENCE_CLASSES.make */
T0* T83c10(T4 a1, T4 a2)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T83));
	((T83*)(C))->id = 83;
	((T83*)(C))->a6 = T186c6(a1, a2);
	l2 = (a1);
	t1 = (T4f1(&l2, a2));
	while (!(t1)) {
		l1 = T184c4(l2);
		T186f7(((T83*)(C))->a6, l1, l2);
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t1 = (T4f1(&l2, a2));
	}
	T83f13(C);
	return C;
}

/* LX_EQUIVALENCE_CLASSES.initialize */
void T83f13(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T4 t1;
	T0* t2;
	T2 t3;
	l2 = (T83f4(C));
	t1 = (T83f5(C));
	t2 = (T186f4(((T83*)(C))->a6, t1));
	t1 = (T83f5(C));
	T184f5(t2, t1);
	t1 = (T83f5(C));
	l1 = ((T4)((t1)+((T4)(geint32(1)))));
	t3 = (T4f1(&l1, l2));
	while (!(t3)) {
		l3 = (T186f4(((T83*)(C))->a6, l1));
		t1 = ((T4)((l1)-((T4)(geint32(1)))));
		t2 = (T186f4(((T83*)(C))->a6, t1));
		T184f9(l3, t2);
		T184f5(l3, l1);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t3 = (T4f1(&l1, l2));
	}
	((T83*)(C))->a3 = ((T4)(geint32(0)));
}

/* DS_ARRAYED_LIST [LX_SINGLETON].make */
T0* T133c9(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T133));
	((T133*)(C))->id = 133;
	((T133*)(C))->a6 = T199c2();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T133*)(C))->a4 = (T199f1(((T133*)(C))->a6, t1));
	((T133*)(C))->a5 = (a1);
	((T133*)(C))->a7 = (T133f8(C));
	return C;
}

/* DS_ARRAYED_LIST [LX_SINGLETON].new_cursor */
T0* T133f8(T0* C)
{
	T0* R = 0;
	R = T200c2(C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [LX_SINGLETON].make */
T0* T200c2(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T200));
	((T200*)(C))->id = 200;
	((T200*)(C))->a1 = (a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [LX_SINGLETON].make */
T0* T199f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T224c2(a1);
	R = (((T224*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [LX_SINGLETON].make_area */
T0* T224c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T224));
	((T224*)(C))->id = 224;
	((T224*)(C))->a1 = T198c2(a1);
	return C;
}

/* SPECIAL [LX_SINGLETON].make */
T0* T198c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T198)+a1*sizeof(T0*));
	((T198*)(C))->a1 = a1;
	((T198*)(C))->id = 198;
	return C;
}

/* KL_SPECIAL_ROUTINES [LX_SINGLETON].default_create */
T0* T199c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T199));
	((T199*)(C))->id = 199;
	return C;
}

/* LX_PROTO_QUEUE.make */
T0* T132c12()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T132));
	((T132*)(C))->id = 132;
	((T132*)(C))->a6 = (T132f1(C));
	return C;
}

/* LX_COMPRESSED_DFA.put_eob_state */
void T44f84(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T4 t2;
	l2 = T122c23((T4)(geint32(0)));
	l1 = T120c18(l2, ((T44*)(C))->a30, ((T44*)(C))->a31);
	l3 = T46c15(((T44*)(C))->a27);
	t1 = (((T120*)(l1))->a1);
	T45f23(t1, l3);
	T125f16(((T44*)(C))->a4, l1);
	t2 = (((T125*)(((T44*)(C))->a4))->a1);
	T120f19(l1, t2);
}

/* DS_ARRAYED_LIST [LX_RULE].force_first */
void T45f23(T0* C, T0* a1)
{
	T2 t1;
	T4 t2;
	t1 = (T45f10(C, (T4)(geint32(1))));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = ((T4)((((T45*)(C))->a1)+((T4)(geint32(1)))));
		t2 = (T45f11(C, t2));
		T45f20(C, t2);
	}
	T45f25(C, a1, (T4)(geint32(1)));
}

/* DS_ARRAYED_LIST [LX_RULE].put */
void T45f25(T0* C, T0* a1, T4 a2)
{
	T4 t1;
	T2 t2;
	t1 = ((T4)((((T45*)(C))->a1)+((T4)(geint32(1)))));
	t2 = ((a2)==(t1));
	if (t2) {
		T45f18(C, a1);
	} else {
		T45f26(C, a2, (T4)(geint32(1)));
		T45f27(C, a2, (T4)(geint32(1)));
		((T123*)(((T45*)(C))->a4))->a2[a2] = (a1);
	}
}

/* DS_ARRAYED_LIST [LX_RULE].move_cursors_right */
void T45f27(T0* C, T4 a1, T4 a2)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	l1 = (((T45*)(C))->a8);
	t1 = ((l1)==(EIF_VOID));
	while (!(t1)) {
		l2 = (((T157*)(l1))->a3);
		t1 = (T4f5(&l2, a1));
		if (t1) {
			t2 = ((T4)((l2)+(a2)));
			T157f5(l1, t2);
		}
		l1 = (((T157*)(l1))->a1);
		t1 = ((l1)==(EIF_VOID));
	}
}

/* DS_ARRAYED_LIST_CURSOR [LX_RULE].set_position */
void T157f5(T0* C, T4 a1)
{
	((T157*)(C))->a3 = (a1);
}

/* DS_ARRAYED_LIST [LX_RULE].move_right */
void T45f26(T0* C, T4 a1, T4 a2)
{
	T4 l1 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l1 = (((T45*)(C))->a1);
	((T45*)(C))->a1 = ((T4)((((T45*)(C))->a1)+(a2)));
	t1 = ((T2)((l1)<(a1)));
	while (!(t1)) {
		t2 = (((T123*)(((T45*)(C))->a4))->a2[l1]);
		t3 = ((T4)((l1)+(a2)));
		((T123*)(((T45*)(C))->a4))->a2[t3] = (t2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t1 = ((T2)((l1)<(a1)));
	}
}

/* LX_RULE.make_default */
T0* T46c15(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T46));
	((T46*)(C))->id = 46;
	((T46*)(C))->a1 = (a1);
	((T46*)(C))->a2 = (T46f3(C));
	((T46*)(C))->a4 = (T46f5(C));
	((T46*)(C))->a6 = ((T4)(geint32(-1)));
	((T46*)(C))->a7 = ((T4)(geint32(-1)));
	((T46*)(C))->a8 = ((T4)(geint32(-1)));
	((T46*)(C))->a9 = ((T4)(geint32(-1)));
	return C;
}

/* LX_RULE.dummy_action */
unsigned char ge143os1508 = '\0';
T0* ge143ov1508;
T0* T46f5(T0* C)
{
	T0* R = 0;
	if (ge143os1508) {
		return ge143ov1508;
	} else {
		ge143os1508 = '\1';
	}
	R = T89c3(gems("", 0));
	ge143ov1508 = R;
	return R;
}

/* LX_ACTION.make */
T0* T89c3(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T89));
	((T89*)(C))->id = 89;
	((T89*)(C))->a1 = (a1);
	return C;
}

/* LX_RULE.dummy_pattern */
unsigned char ge143os1507 = '\0';
T0* ge143ov1507;
T0* T46f3(T0* C)
{
	T0* R = 0;
	if (ge143os1507) {
		return ge143ov1507;
	} else {
		ge143os1507 = '\1';
	}
	R = T82c9(EIF_FALSE);
	ge143ov1507 = R;
	return R;
}

/* LX_NFA.make_epsilon */
T0* T82c9(T2 a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* C;
	C = (T0*)gealloc(sizeof(T82));
	((T82*)(C))->id = 82;
	((T82*)(C))->a1 = (a1);
	((T82*)(C))->a2 = T122c23((T4)(geint32(100)));
	l2 = T121c12(a1);
	l3 = T121c12(a1);
	l1 = T179c5(l3);
	T121f13(l2, l1);
	T122f25(((T82*)(C))->a2, l2);
	T122f24(((T82*)(C))->a2, l3);
	return C;
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].put_first */
void T122f25(T0* C, T0* a1)
{
	T122f30(C, a1, (T4)(geint32(1)));
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].put */
void T122f30(T0* C, T0* a1, T4 a2)
{
	T4 t1;
	T2 t2;
	t1 = ((T4)((((T122*)(C))->a1)+((T4)(geint32(1)))));
	t2 = ((a2)==(t1));
	if (t2) {
		T122f24(C, a1);
	} else {
		T122f33(C, a2, (T4)(geint32(1)));
		T122f34(C, a2, (T4)(geint32(1)));
		((T190*)(((T122*)(C))->a6))->a2[a2] = (a1);
	}
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].move_cursors_right */
void T122f34(T0* C, T4 a1, T4 a2)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	l1 = (((T122*)(C))->a10);
	t1 = ((l1)==(EIF_VOID));
	while (!(t1)) {
		l2 = (((T192*)(l1))->a1);
		t1 = (T4f5(&l2, a1));
		if (t1) {
			t2 = ((T4)((l2)+(a2)));
			T192f8(l1, t2);
		}
		l1 = (((T192*)(l1))->a2);
		t1 = ((l1)==(EIF_VOID));
	}
}

/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_position */
void T192f8(T0* C, T4 a1)
{
	((T192*)(C))->a1 = (a1);
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].move_right */
void T122f33(T0* C, T4 a1, T4 a2)
{
	T4 l1 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l1 = (((T122*)(C))->a1);
	((T122*)(C))->a1 = ((T4)((((T122*)(C))->a1)+(a2)));
	t1 = ((T2)((l1)<(a1)));
	while (!(t1)) {
		t2 = (((T190*)(((T122*)(C))->a6))->a2[l1]);
		t3 = ((T4)((l1)+(a2)));
		((T190*)(((T122*)(C))->a6))->a2[t3] = (t2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t1 = ((T2)((l1)<(a1)));
	}
}

/* LX_NFA_STATE.set_transition */
void T121f13(T0* C, T0* a1)
{
	((T121*)(C))->a2 = (a1);
}

/* LX_EPSILON_TRANSITION [LX_NFA_STATE].make */
T0* T179c5(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T179));
	((T179*)(C))->id = 179;
	((T179*)(C))->a1 = (a1);
	return C;
}

/* LX_NFA_STATE.make */
T0* T121c12(T2 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T121));
	((T121*)(C))->id = 121;
	((T121*)(C))->a1 = (a1);
	return C;
}

/* LX_COMPRESSED_DFA.initialize */
void T44f83(T0* C, T0* a1)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	((T44*)(C))->a9 = (((T22*)(a1))->a1);
	t1 = ((((T44*)(C))->a9)==(EIF_VOID));
	if (t1) {
		((T44*)(C))->a9 = (ge102ov4065);
	}
	((T44*)(C))->a11 = (((T22*)(a1))->a12);
	((T44*)(C))->a12 = (((T22*)(a1))->a13);
	((T44*)(C))->a13 = (((T22*)(a1))->a23);
	((T44*)(C))->a14 = (((T22*)(a1))->a22);
	((T44*)(C))->a15 = (((T22*)(a1))->a26);
	((T44*)(C))->a16 = (((T22*)(a1))->a18);
	((T44*)(C))->a17 = (((T22*)(a1))->a27);
	((T44*)(C))->a18 = (((T22*)(a1))->a28);
	((T44*)(C))->a19 = (((T22*)(a1))->a29);
	((T44*)(C))->a20 = (((T22*)(a1))->a30);
	((T44*)(C))->a21 = (((T22*)(a1))->a31);
	((T44*)(C))->a22 = (((T22*)(a1))->a14);
	t2 = (((T22*)(a1))->a19);
	((T44*)(C))->a23 = (T63f6(t2));
	t2 = (((T22*)(a1))->a5);
	T44f96(C, t2);
	t2 = (((T22*)(a1))->a16);
	t3 = (T119f6(((T44*)(C))->a23));
	t3 = ((T4)((t3)-((T4)(geint32(1)))));
	T44f97(C, t2, (T4)(geint32(0)), t3);
	l1 = (((T44*)(C))->a11);
	l2 = (((T22*)(a1))->a24);
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t1 = (T83f2(l2));
	}
	if (t1) {
		((T44*)(C))->a24 = (T83f1(l2, (T4)(geint32(0)), l1));
		((T44*)(C))->a25 = (T130f4(((T44*)(C))->a24, l1));
		l1 = (((T83*)(l2))->a3);
	} else {
		((T44*)(C))->a25 = (l1);
	}
	((T44*)(C))->a26 = (((T124*)(((T44*)(C))->a2))->a3);
	((T44*)(C))->a27 = ((T4)((((T44*)(C))->a26)+((T4)(geint32(1)))));
	((T44*)(C))->a28 = (((T22*)(a1))->a32);
	((T44*)(C))->a29 = (((T22*)(a1))->a33);
	t2 = (((T22*)(a1))->a19);
	T44f98(C, t2, (T4)(geint32(1)), l1);
}

/* LX_COMPRESSED_DFA.initialize_dfa */
void T44f98(T0* C, T0* a1, T4 a2, T4 a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	((T44*)(C))->a30 = (a2);
	((T44*)(C))->a31 = (a3);
	l2 = (((T63*)(a1))->a1);
	t1 = (T4)(geint32(2));
	t1 = ((T4)((t1)*(l2)));
	t1 = ((T4)((t1)+((T4)(geint32(1)))));
	t1 = (T4f11(&t1, (T4)(geint32(1000))));
	((T44*)(C))->a4 = T125c15(t1);
	T44f112(C, a1);
	l1 = ((T4)(geint32(1)));
	t2 = (T4f1(&l1, l2));
	while (!(t2)) {
		t3 = (T63f5(a1, l1));
		T44f113(C, t3);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f1(&l1, l2));
	}
	t1 = (T4)(geint32(2));
	((T44*)(C))->a8 = ((T4)((t1)*(l2)));
}

/* LX_COMPRESSED_DFA.put_start_condition */
void T44f113(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T4 l7 = 0;
	T4 l8 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	l1 = (((T90*)(a1))->a4);
	l2 = (((T90*)(a1))->a5);
	l8 = (((T154*)(l1))->a6);
	l3 = T122c23(l8);
	t1 = (((T154*)(l2))->a6);
	t1 = ((T4)((l8)+(t1)));
	l4 = T122c23(t1);
	l7 = ((T4)(geint32(1)));
	t2 = (T4f1(&l7, l8));
	while (!(t2)) {
		t3 = (T154f7(l1, l7));
		l5 = (T82f4(t3));
		T122f24(l3, l5);
		T122f24(l4, l5);
		l7 = ((T4)((l7)+((T4)(geint32(1)))));
		t2 = (T4f1(&l7, l8));
	}
	l8 = (((T154*)(l2))->a6);
	l7 = ((T4)(geint32(1)));
	t2 = (T4f1(&l7, l8));
	while (!(t2)) {
		t3 = (T154f7(l2, l7));
		t3 = (T82f4(t3));
		T122f24(l4, t3);
		l7 = ((T4)((l7)+((T4)(geint32(1)))));
		t2 = (T4f1(&l7, l8));
	}
	l6 = T120c18(l3, ((T44*)(C))->a30, ((T44*)(C))->a31);
	T125f16(((T44*)(C))->a4, l6);
	t1 = (((T125*)(((T44*)(C))->a4))->a1);
	T120f19(l6, t1);
	l6 = T120c18(l4, ((T44*)(C))->a30, ((T44*)(C))->a31);
	T125f16(((T44*)(C))->a4, l6);
	t1 = (((T125*)(((T44*)(C))->a4))->a1);
	T120f19(l6, t1);
}

/* LX_NFA.start_state */
T0* T82f4(T0* C)
{
	T0* R = 0;
	R = (T122f14(((T82*)(C))->a2));
	return R;
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].first */
T0* T122f14(T0* C)
{
	T0* R = 0;
	R = (((T190*)(((T122*)(C))->a6))->a2[(T4)(geint32(1))]);
	return R;
}

/* DS_ARRAYED_LIST [LX_NFA].item */
T0* T154f7(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T84*)(((T154*)(C))->a2))->a2[a1]);
	return R;
}

/* LX_START_CONDITIONS.item */
T0* T63f5(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T170*)(((T63*)(C))->a7))->a2[a1]);
	return R;
}

/* LX_COMPRESSED_DFA.set_nfa_state_ids */
void T44f112(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T4 l6 = 0;
	T4 l7 = 0;
	T4 l8 = 0;
	T4 l9 = 0;
	T4 l10 = 0;
	T4 l11 = 0;
	T4 l12 = 0;
	T4 l13 = 0;
	T2 t1;
	T0* t2;
	l13 = ((T4)(geint32(1)));
	l5 = T155c34((T4)(geint32(100)));
	l7 = (((T63*)(a1))->a1);
	l6 = ((T4)(geint32(1)));
	t1 = (T4f1(&l6, l7));
	while (!(t1)) {
		l1 = (T63f5(a1, l6));
		l2 = (((T90*)(l1))->a4);
		l9 = (((T154*)(l2))->a6);
		l8 = ((T4)(geint32(1)));
		t1 = (T4f1(&l8, l9));
		while (!(t1)) {
			l3 = (T154f7(l2, l8));
			t2 = (T82f4(l3));
			l12 = (((T121*)(t2))->a4);
			t1 = (T155f1(l5, l12));
			t1 = ((T2)(!(t1)));
			if (!(t1)) {
				t2 = (T155f2(l5, l12));
				t1 = ((t2)!=(l3));
			}
			if (t1) {
				T155f35(l5, l3, l13);
				l4 = (((T82*)(l3))->a2);
				l11 = (((T122*)(l4))->a1);
				l10 = ((T4)(geint32(1)));
				t1 = (T4f1(&l10, l11));
				while (!(t1)) {
					t2 = (T122f2(l4, l10));
					T121f15(t2, l13);
					l13 = ((T4)((l13)+((T4)(geint32(1)))));
					l10 = ((T4)((l10)+((T4)(geint32(1)))));
					t1 = (T4f1(&l10, l11));
				}
			}
			l8 = ((T4)((l8)+((T4)(geint32(1)))));
			t1 = (T4f1(&l8, l9));
		}
		l2 = (((T90*)(l1))->a5);
		l9 = (((T154*)(l2))->a6);
		l8 = ((T4)(geint32(1)));
		t1 = (T4f1(&l8, l9));
		while (!(t1)) {
			l3 = (T154f7(l2, l8));
			t2 = (T82f4(l3));
			l12 = (((T121*)(t2))->a4);
			t1 = (T155f1(l5, l12));
			t1 = ((T2)(!(t1)));
			if (!(t1)) {
				t2 = (T155f2(l5, l12));
				t1 = ((t2)!=(l3));
			}
			if (t1) {
				T155f35(l5, l3, l13);
				l4 = (((T82*)(l3))->a2);
				l11 = (((T122*)(l4))->a1);
				l10 = ((T4)(geint32(1)));
				t1 = (T4f1(&l10, l11));
				while (!(t1)) {
					t2 = (T122f2(l4, l10));
					T121f15(t2, l13);
					l13 = ((T4)((l13)+((T4)(geint32(1)))));
					l10 = ((T4)((l10)+((T4)(geint32(1)))));
					t1 = (T4f1(&l10, l11));
				}
			}
			l8 = ((T4)((l8)+((T4)(geint32(1)))));
			t1 = (T4f1(&l8, l9));
		}
		l6 = ((T4)((l6)+((T4)(geint32(1)))));
		t1 = (T4f1(&l6, l7));
	}
}

/* LX_NFA_STATE.set_id */
void T121f15(T0* C, T4 a1)
{
	((T121*)(C))->a4 = (a1);
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].force */
void T155f35(T0* C, T0* a1, T4 a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	T155f38(C);
	T155f36(C, a2);
	t1 = ((((T155*)(C))->a3)!=((T4)(geint32(0))));
	if (t1) {
		T155f39(C, a1, ((T155*)(C))->a3);
	} else {
		t1 = ((((T155*)(C))->a8)==(((T155*)(C))->a9));
		if (t1) {
			t2 = ((T4)((((T155*)(C))->a8)+((T4)(geint32(1)))));
			t2 = (T155f10(C, t2));
			T155f40(C, t2);
			l2 = (T155f11(C, a2));
		} else {
			l2 = (((T155*)(C))->a12);
		}
		l1 = (((T155*)(C))->a13);
		t1 = ((l1)==((T4)(geint32(0))));
		if (t1) {
			((T155*)(C))->a14 = ((T4)((((T155*)(C))->a14)+((T4)(geint32(1)))));
			l1 = (((T155*)(C))->a14);
		} else {
			t2 = (T4)(geint32(-1));
			t3 = (T155f16(C, l1));
			((T155*)(C))->a13 = ((T4)((t2)-(t3)));
		}
		t2 = (T155f17(C, l2));
		T155f41(C, t2, l1);
		T155f42(C, l1, l2);
		T155f39(C, a1, l1);
		T155f43(C, a2, l1);
		((T155*)(C))->a8 = ((T4)((((T155*)(C))->a8)+((T4)(geint32(1)))));
	}
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].keys_put */
void T155f43(T0* C, T4 a1, T4 a2)
{
	((T71*)(((T155*)(C))->a27))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].slots_put */
void T155f42(T0* C, T4 a1, T4 a2)
{
	((T71*)(((T155*)(C))->a26))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].clashes_put */
void T155f41(T0* C, T4 a1, T4 a2)
{
	((T71*)(((T155*)(C))->a25))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].slots_item */
T4 T155f17(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T71*)(((T155*)(C))->a26))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].clashes_item */
T4 T155f16(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T71*)(((T155*)(C))->a25))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].hash_position */
T4 T155f11(T0* C, T4 a1)
{
	T4 R = 0;
	T2 t1;
	T4 t2;
	t1 = (EIF_TRUE);
	if (t1) {
		t2 = (T4f17(&a1));
		R = ((T4)((t2)%(((T155*)(C))->a18)));
	} else {
		R = (((T155*)(C))->a18);
	}
	return R;
}

/* INTEGER.hash_code */
T4 T4f17(T4* C)
{
	T4 R = 0;
	T4 t1;
	t1 = (*C);
	R = (T4f18(&t1, (T4)(geint32(0x7FFFFFFF))));
	return R;
}

/* INTEGER.infix "&" */
T4 T4f18(T4* C, T4 a1)
{
	T4 R = 0;
	R = ((T4)((*C)&(a1)));
	return R;
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].resize */
void T155f40(T0* C, T4 a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 t1;
	T2 t2;
	T155f38(C);
	l1 = (T155f23(C, a1));
	t1 = ((T4)((l1)+((T4)(geint32(1)))));
	T155f45(C, t1);
	l2 = (((T155*)(C))->a18);
	t2 = ((T2)((l2)<((T4)(geint32(0)))));
	while (!(t2)) {
		T155f42(C, (T4)(geint32(0)), l2);
		l2 = ((T4)((l2)-((T4)(geint32(1)))));
		t2 = ((T2)((l2)<((T4)(geint32(0)))));
	}
	((T155*)(C))->a18 = (l1);
	l2 = (((T155*)(C))->a14);
	t2 = ((T2)((l2)<((T4)(geint32(1)))));
	while (!(t2)) {
		t1 = (T155f16(C, l2));
		t2 = (T4f1(&t1, (T4)(geint32(-1))));
		if (t2) {
			t1 = (T155f20(C, l2));
			l3 = (T155f11(C, t1));
			t1 = (T155f17(C, l3));
			T155f41(C, t1, l2);
			T155f42(C, l2, l3);
		}
		l2 = ((T4)((l2)-((T4)(geint32(1)))));
		t2 = ((T2)((l2)<((T4)(geint32(1)))));
	}
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T155f46(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T155f47(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T155f48(C, t1);
	((T155*)(C))->a9 = (a1);
	((T155*)(C))->a3 = ((T4)(geint32(0)));
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].clashes_resize */
void T155f48(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T155f30(C));
	((T155*)(C))->a25 = (T72f2(t1, ((T155*)(C))->a25, a1));
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].special_integer_ */
unsigned char ge257os2367 = '\0';
T0* ge257ov2367;
T0* T155f30(T0* C)
{
	T0* R = 0;
	if (ge257os2367) {
		return ge257ov2367;
	} else {
		ge257os2367 = '\1';
	}
	R = T72c4();
	ge257ov2367 = R;
	return R;
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].keys_resize */
void T155f47(T0* C, T4 a1)
{
	((T155*)(C))->a27 = (T72f2(((T155*)(C))->a32, ((T155*)(C))->a27, a1));
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].items_resize */
void T155f46(T0* C, T4 a1)
{
	((T155*)(C))->a6 = (T85f2(((T155*)(C))->a31, ((T155*)(C))->a6, a1));
}

/* KL_SPECIAL_ROUTINES [LX_NFA].resize */
T0* T85f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T84*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T84f3(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [LX_NFA].resized_area */
T0* T84f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T84c4(a1);
	l2 = (((T84*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T84*)(C))->a2[l1]);
		((T84*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* SPECIAL [LX_NFA].make */
T0* T84c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T84)+a1*sizeof(T0*));
	((T84*)(C))->a1 = a1;
	((T84*)(C))->id = 84;
	return C;
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].keys_item */
T4 T155f20(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T71*)(((T155*)(C))->a27))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].slots_resize */
void T155f45(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T155f30(C));
	((T155*)(C))->a26 = (T72f2(t1, ((T155*)(C))->a26, a1));
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].new_modulus */
T4 T155f23(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].new_capacity */
T4 T155f10(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = (T4)(geint32(2));
	R = ((T4)((t1)*(a1)));
	return R;
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].items_put */
void T155f39(T0* C, T0* a1, T4 a2)
{
	((T84*)(((T155*)(C))->a6))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].search_position */
void T155f36(T0* C, T4 a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T4 t2;
	T2 t3;
	t1 = (EIF_FALSE);
	if (t1) {
		((T155*)(C))->a3 = (T155f17(C, ((T155*)(C))->a18));
		((T155*)(C))->a12 = (((T155*)(C))->a18);
		((T155*)(C))->a19 = ((T4)(geint32(0)));
	} else {
		l4 = (((T155*)(C))->a7);
		t1 = ((l4)!=(EIF_VOID));
		if (t1) {
			t1 = ((((T155*)(C))->a3)==((T4)(geint32(0))));
			if (!(t1)) {
				t2 = (T155f20(C, ((T155*)(C))->a3));
				t3 = (T27f1(l4, a1, t2));
				t1 = ((T2)(!(t3)));
			}
			if (!(t1)) {
				t1 = (T27f1(l4, a1, l3));
			}
			if (t1) {
				((T155*)(C))->a12 = (T155f11(C, a1));
				l1 = (T155f17(C, ((T155*)(C))->a12));
				((T155*)(C))->a3 = ((T4)(geint32(0)));
				l2 = ((T4)(geint32(0)));
				t1 = ((l1)==((T4)(geint32(0))));
				while (!(t1)) {
					t2 = (T155f20(C, l1));
					t1 = (T27f1(l4, a1, t2));
					if (t1) {
						((T155*)(C))->a3 = (l1);
						l1 = ((T4)(geint32(0)));
					} else {
						l2 = (l1);
						l1 = (T155f16(C, l1));
					}
					t1 = ((l1)==((T4)(geint32(0))));
				}
				((T155*)(C))->a19 = (l2);
			}
		} else {
			t1 = ((((T155*)(C))->a3)==((T4)(geint32(0))));
			if (!(t1)) {
				t2 = (T155f20(C, ((T155*)(C))->a3));
				t1 = ((a1)!=(t2));
			}
			if (!(t1)) {
				t1 = ((a1)==(l3));
			}
			if (t1) {
				((T155*)(C))->a12 = (T155f11(C, a1));
				l1 = (T155f17(C, ((T155*)(C))->a12));
				((T155*)(C))->a3 = ((T4)(geint32(0)));
				l2 = ((T4)(geint32(0)));
				t1 = ((l1)==((T4)(geint32(0))));
				while (!(t1)) {
					t2 = (T155f20(C, l1));
					t1 = ((a1)==(t2));
					if (t1) {
						((T155*)(C))->a3 = (l1);
						l1 = ((T4)(geint32(0)));
					} else {
						l2 = (l1);
						l1 = (T155f16(C, l1));
					}
					t1 = ((l1)==((T4)(geint32(0))));
				}
				((T155*)(C))->a19 = (l2);
			}
		}
	}
}

/* KL_EQUALITY_TESTER [INTEGER].test */
T2 T27f1(T0* C, T4 a1, T4 a2)
{
	T2 R = 0;
	T2 t1;
	t1 = ((a1)==(a2));
	if (t1) {
		R = (EIF_TRUE);
	} else {
		t1 = (EIF_FALSE);
		if (t1) {
			R = (EIF_FALSE);
		} else {
			t1 = (EIF_FALSE);
			if (t1) {
				R = (EIF_FALSE);
			} else {
				R = (T4f16(&a1, a2));
			}
		}
	}
	return R;
}

/* INTEGER.is_equal */
T2 T4f16(T4* C, T4 a1)
{
	T2 R = 0;
	T4 t1;
	T4 t2;
	t1 = (a1);
	t2 = (*C);
	R = ((t1)==(t2));
	return R;
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].unset_found_item */
void T155f38(T0* C)
{
	((T155*)(C))->a22 = ((T4)(geint32(0)));
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].item */
T0* T155f2(T0* C, T4 a1)
{
	T0* R = 0;
	T155f36(C, a1);
	R = (T155f5(C, ((T155*)(C))->a3));
	return R;
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].items_item */
T0* T155f5(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T84*)(((T155*)(C))->a6))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].has */
T2 T155f1(T0* C, T4 a1)
{
	T2 R = 0;
	T155f36(C, a1);
	R = ((((T155*)(C))->a3)!=((T4)(geint32(0))));
	return R;
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].make */
T0* T155c34(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T155));
	((T155*)(C))->id = 155;
	((T155*)(C))->a7 = T27c2();
	T155f37(C, a1, EIF_VOID, ((T155*)(C))->a7);
	return C;
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].make_with_equality_testers */
void T155f37(T0* C, T4 a1, T0* a2, T0* a3)
{
	((T155*)(C))->a21 = (a2);
	((T155*)(C))->a7 = (a3);
	T155f44(C, a1);
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].make_sparse_container */
void T155f44(T0* C, T4 a1)
{
	T4 t1;
	((T155*)(C))->a9 = (a1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T155f49(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T155f50(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T155f51(C, t1);
	((T155*)(C))->a18 = (T155f23(C, a1));
	t1 = ((T4)((((T155*)(C))->a18)+((T4)(geint32(1)))));
	T155f52(C, t1);
	((T155*)(C))->a14 = ((T4)(geint32(0)));
	((T155*)(C))->a13 = ((T4)(geint32(0)));
	((T155*)(C))->a3 = ((T4)(geint32(0)));
	T155f38(C);
	((T155*)(C))->a28 = (T155f29(C));
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].new_cursor */
T0* T155f29(T0* C)
{
	T0* R = 0;
	R = T211c3(C);
	return R;
}

/* DS_HASH_TABLE_CURSOR [LX_NFA, INTEGER].make */
T0* T211c3(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T211));
	((T211*)(C))->id = 211;
	((T211*)(C))->a1 = (a1);
	((T211*)(C))->a2 = ((T4)(geint32(-1)));
	return C;
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].make_slots */
void T155f52(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T155f30(C));
	((T155*)(C))->a26 = (T72f1(t1, a1));
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].make_clashes */
void T155f51(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T155f30(C));
	((T155*)(C))->a25 = (T72f1(t1, a1));
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].make_keys */
void T155f50(T0* C, T4 a1)
{
	((T155*)(C))->a32 = T72c4();
	((T155*)(C))->a27 = (T72f1(((T155*)(C))->a32, a1));
}

/* DS_HASH_TABLE [LX_NFA, INTEGER].make_items */
void T155f49(T0* C, T4 a1)
{
	((T155*)(C))->a31 = T85c3();
	((T155*)(C))->a6 = (T85f1(((T155*)(C))->a31, a1));
}

/* KL_SPECIAL_ROUTINES [LX_NFA].make */
T0* T85f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T187c2(a1);
	R = (((T187*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [LX_NFA].make_area */
T0* T187c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T187));
	((T187*)(C))->id = 187;
	((T187*)(C))->a1 = T84c4(a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [LX_NFA].default_create */
T0* T85c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T85));
	((T85*)(C))->id = 85;
	return C;
}

/* KL_EQUALITY_TESTER [INTEGER].default_create */
T0* T27c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T27));
	((T27*)(C))->id = 27;
	return C;
}

/* LX_EQUIVALENCE_CLASSES.built */
T2 T83f2(T0* C)
{
	T2 R = 0;
	R = ((((T83*)(C))->a3)!=((T4)(geint32(0))));
	return R;
}

/* LX_COMPRESSED_DFA.build_eof_rules */
void T44f97(T0* C, T0* a1, T4 a2, T4 a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T4 t2;
	((T44*)(C))->a51 = T124c6(a2, a3);
	l2 = (((T45*)(a1))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l3 = (T45f2(a1, l1));
		t2 = (((T46*)(l3))->a1);
		T124f7(((T44*)(C))->a51, l3, t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
}

/* ARRAY [LX_RULE].put */
void T124f7(T0* C, T0* a1, T4 a2)
{
	T4 t1;
	t1 = ((T4)((a2)-(((T124*)(C))->a2)));
	((T123*)(((T124*)(C))->a1))->a2[t1] = (a1);
}

/* ARRAY [LX_RULE].make */
T0* T124c6(T4 a1, T4 a2)
{
	T2 t1;
	T4 t2;
	T0* C;
	C = (T0*)gealloc(sizeof(T124));
	((T124*)(C))->id = 124;
	((T124*)(C))->a2 = (a1);
	((T124*)(C))->a3 = (a2);
	t1 = (T4f6(&a1, a2));
	if (t1) {
		t2 = ((T4)((a2)-(a1)));
		t2 = ((T4)((t2)+((T4)(geint32(1)))));
		T124f8(C, t2);
	} else {
		T124f8(C, (T4)(geint32(0)));
	}
	return C;
}

/* ARRAY [LX_RULE].make_area */
void T124f8(T0* C, T4 a1)
{
	((T124*)(C))->a1 = T123c4(a1);
}

/* LX_COMPRESSED_DFA.build_rules */
void T44f96(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	l2 = (((T45*)(a1))->a1);
	((T44*)(C))->a2 = T124c6((T4)(geint32(1)), l2);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		t2 = (T45f2(a1, l1));
		T124f7(((T44*)(C))->a2, t2, l1);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
}

/* LX_START_CONDITIONS.names */
T0* T63f6(T0* C)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	l2 = (((T63*)(C))->a1);
	t1 = ((T4)((l2)-((T4)(geint32(1)))));
	R = T119c7((T4)(geint32(0)), t1);
	l1 = ((T4)(geint32(1)));
	t2 = (T4f1(&l1, l2));
	while (!(t2)) {
		t3 = (T63f5(C, l1));
		t3 = (((T90*)(t3))->a1);
		t1 = ((T4)((l1)-((T4)(geint32(1)))));
		T119f8(R, t3, t1);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f1(&l1, l2));
	}
	return R;
}

/* LX_FULL_DFA.make */
T0* T51c49(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T51));
	((T51*)(C))->id = 51;
	T51f52(C, a1);
	T51f53(C);
	T51f54(C);
	return C;
}

/* LX_FULL_DFA.build */
void T51f54(T0* C)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T4 t2;
	((T51*)(C))->a1 = ((T4)(geint32(0)));
	((T51*)(C))->a28 = T135c9(((T51*)(C))->a26, ((T51*)(C))->a27);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, ((T51*)(C))->a2));
	while (!(t1)) {
		l2 = (T125f2(((T51*)(C))->a3, l1));
		T51f68(C, l2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, ((T51*)(C))->a2));
	}
	l2 = (T125f2(((T51*)(C))->a3, l1));
	T51f68(C, l2);
	l1 = ((T4)((l1)+((T4)(geint32(1)))));
	t2 = (((T125*)(((T51*)(C))->a3))->a1);
	t1 = (T4f1(&l1, t2));
	while (!(t1)) {
		l2 = (T125f2(((T51*)(C))->a3, l1));
		T51f68(C, l2);
		t1 = (T120f11(l2));
		t1 = ((T2)(!(t1)));
		if (t1) {
			((T51*)(C))->a1 = ((T4)((((T51*)(C))->a1)+((T4)(geint32(1)))));
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (((T125*)(((T51*)(C))->a3))->a1);
		t1 = (T4f1(&l1, t2));
	}
	((T51*)(C))->a29 = (T4f1(&(((T51*)(C))->a1), (T4)(geint32(0))));
	((T51*)(C))->a28 = (EIF_VOID);
	T51f69(C);
	T51f70(C);
}

/* LX_FULL_DFA.build_accept_table */
void T51f70(T0* C)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l3 = (((T125*)(((T51*)(C))->a3))->a1);
	l1 = T130c7((T4)(geint32(0)), l3);
	l2 = ((T4)(geint32(1)));
	t1 = (T4f1(&l2, l3));
	while (!(t1)) {
		l4 = (T125f2(((T51*)(C))->a3, l2));
		t1 = (T120f11(l4));
		if (t1) {
			t2 = (((T120*)(l4))->a1);
			t2 = (T45f14(t2));
			t3 = (((T46*)(t2))->a1);
			T130f8(l1, t3, l2);
		} else {
			T130f8(l1, (T4)(geint32(0)), l2);
		}
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t1 = (T4f1(&l2, l3));
	}
	((T51*)(C))->a33 = (l1);
}

/* LX_FULL_DFA.build_nxt_table */
void T51f69(T0* C)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T4 l9 = 0;
	T4 t1;
	T2 t2;
	((T51*)(C))->a34 = ((T4)((((T51*)(C))->a27)+((T4)(geint32(1)))));
	t1 = (((T125*)(((T51*)(C))->a3))->a1);
	t1 = ((T4)((t1)+((T4)(geint32(1)))));
	t1 = ((T4)((((T51*)(C))->a34)*(t1)));
	t1 = ((T4)((t1)-((T4)(geint32(1)))));
	l1 = T130c7((T4)(geint32(0)), t1);
	l9 = ((T4)((((T51*)(C))->a2)+((T4)(geint32(1)))));
	l5 = ((T4)((((T51*)(C))->a34)-((T4)(geint32(1)))));
	l3 = (((T51*)(C))->a34);
	l2 = ((T4)(geint32(1)));
	t1 = (((T125*)(((T51*)(C))->a3))->a1);
	t2 = (T4f1(&l2, t1));
	while (!(t2)) {
		l6 = (T125f2(((T51*)(C))->a3, l2));
		l8 = (((T120*)(l6))->a3);
		t1 = (((T120*)(l6))->a8);
		t2 = ((t1)==(l9));
		if (t2) {
			t1 = ((T4)(-(l9)));
			T130f8(l1, t1, l3);
		} else {
			T130f8(l1, l9, l3);
		}
		l5 = ((T4)((l5)+(((T51*)(C))->a34)));
		l4 = ((T4)(geint32(1)));
		l3 = ((T4)((l3)+((T4)(geint32(1)))));
		t2 = (T4f1(&l3, l5));
		while (!(t2)) {
			l7 = (T144f3(l8, l4));
			t2 = ((l7)!=(EIF_VOID));
			if (t2) {
				t1 = (((T120*)(l7))->a8);
				T130f8(l1, t1, l3);
			} else {
				t1 = (((T120*)(l6))->a8);
				t1 = ((T4)(-(t1)));
				T130f8(l1, t1, l3);
			}
			l4 = ((T4)((l4)+((T4)(geint32(1)))));
			l3 = ((T4)((l3)+((T4)(geint32(1)))));
			t2 = (T4f1(&l3, l5));
		}
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t1 = (((T125*)(((T51*)(C))->a3))->a1);
		t2 = (T4f1(&l2, t1));
	}
	((T51*)(C))->a32 = (l1);
}

/* LX_FULL_DFA.build_transitions */
void T51f68(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T4 t1;
	T4 t2;
	T2 t3;
	T0* t4;
	l2 = (T135f1(((T51*)(C))->a28));
	t1 = (((T125*)(((T51*)(C))->a3))->a3);
	t2 = (((T125*)(((T51*)(C))->a3))->a1);
	t1 = ((T4)((t1)-(t2)));
	t3 = ((T2)((t1)<(l2)));
	if (t3) {
		t1 = (((T125*)(((T51*)(C))->a3))->a3);
		t1 = ((T4)((t1)+(l2)));
		t1 = ((T4)((t1)+((T4)(geint32(1000)))));
		T51f78(C, t1);
	}
	T135f10(((T51*)(C))->a28);
	T120f20(a1, ((T51*)(C))->a28);
	l6 = (((T135*)(((T51*)(C))->a28))->a2);
	l5 = (((T120*)(a1))->a3);
	l1 = (((T51*)(C))->a26);
	t3 = (T4f1(&l1, ((T51*)(C))->a27));
	while (!(t3)) {
		t3 = (T146f4(l6, l1));
		if (t3) {
			t3 = (T135f3(((T51*)(C))->a28, l1));
			if (t3) {
				t4 = (T120f12(a1, l1));
				l4 = (T51f39(C, t4));
			} else {
				l3 = (T135f4(((T51*)(C))->a28, l1));
				l4 = (T144f3(l5, l3));
			}
			T144f15(l5, l4, l1);
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t3 = (T4f1(&l1, ((T51*)(C))->a27));
	}
}

/* LX_FULL_DFA.new_state */
T0* T51f39(T0* C, T0* a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	l1 = ((T4)((((T51*)(C))->a2)+((T4)(geint32(1)))));
	l2 = (((T125*)(((T51*)(C))->a3))->a1);
	t1 = ((R)!=(EIF_VOID));
	if (!(t1)) {
		t1 = (T4f1(&l1, l2));
	}
	while (!(t1)) {
		R = (T125f2(((T51*)(C))->a3, l1));
		t1 = (T120f13(R, a1));
		t1 = ((T2)(!(t1)));
		if (t1) {
			R = (EIF_VOID);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
		}
		t1 = ((R)!=(EIF_VOID));
		if (!(t1)) {
			t1 = (T4f1(&l1, l2));
		}
	}
	t1 = ((R)==(EIF_VOID));
	if (t1) {
		R = (a1);
		T125f16(((T51*)(C))->a3, a1);
		t2 = (((T125*)(((T51*)(C))->a3))->a1);
		T120f19(a1, t2);
	}
	return R;
}

/* LX_FULL_DFA.resize */
void T51f78(T0* C, T4 a1)
{
	T125f17(((T51*)(C))->a3, a1);
}

/* LX_FULL_DFA.put_eob_state */
void T51f53(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T4 t2;
	l2 = T122c23((T4)(geint32(0)));
	l1 = T120c18(l2, ((T51*)(C))->a26, ((T51*)(C))->a27);
	l3 = T46c15(((T51*)(C))->a23);
	t1 = (((T120*)(l1))->a1);
	T45f23(t1, l3);
	T125f16(((T51*)(C))->a3, l1);
	t2 = (((T125*)(((T51*)(C))->a3))->a1);
	T120f19(l1, t2);
}

/* LX_FULL_DFA.initialize */
void T51f52(T0* C, T0* a1)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	((T51*)(C))->a4 = (((T22*)(a1))->a1);
	t1 = ((((T51*)(C))->a4)==(EIF_VOID));
	if (t1) {
		((T51*)(C))->a4 = (ge102ov4065);
	}
	((T51*)(C))->a6 = (((T22*)(a1))->a12);
	((T51*)(C))->a7 = (((T22*)(a1))->a13);
	((T51*)(C))->a8 = (((T22*)(a1))->a23);
	((T51*)(C))->a9 = (((T22*)(a1))->a22);
	((T51*)(C))->a10 = (((T22*)(a1))->a26);
	((T51*)(C))->a11 = (((T22*)(a1))->a18);
	((T51*)(C))->a12 = (((T22*)(a1))->a27);
	((T51*)(C))->a13 = (((T22*)(a1))->a28);
	((T51*)(C))->a14 = (((T22*)(a1))->a29);
	((T51*)(C))->a15 = (((T22*)(a1))->a30);
	((T51*)(C))->a16 = (((T22*)(a1))->a31);
	((T51*)(C))->a17 = (((T22*)(a1))->a14);
	t2 = (((T22*)(a1))->a19);
	((T51*)(C))->a18 = (T63f6(t2));
	t2 = (((T22*)(a1))->a5);
	T51f65(C, t2);
	t2 = (((T22*)(a1))->a16);
	t3 = (T119f6(((T51*)(C))->a18));
	t3 = ((T4)((t3)-((T4)(geint32(1)))));
	T51f66(C, t2, (T4)(geint32(0)), t3);
	l1 = (((T51*)(C))->a6);
	l2 = (((T22*)(a1))->a24);
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t1 = (T83f2(l2));
	}
	if (t1) {
		((T51*)(C))->a19 = (T83f1(l2, (T4)(geint32(0)), l1));
		((T51*)(C))->a20 = (T130f4(((T51*)(C))->a19, l1));
		l1 = (((T83*)(l2))->a3);
	} else {
		((T51*)(C))->a20 = (l1);
	}
	((T51*)(C))->a21 = (((T124*)(((T51*)(C))->a22))->a3);
	((T51*)(C))->a23 = ((T4)((((T51*)(C))->a21)+((T4)(geint32(1)))));
	((T51*)(C))->a24 = (((T22*)(a1))->a32);
	((T51*)(C))->a25 = (((T22*)(a1))->a33);
	t2 = (((T22*)(a1))->a19);
	T51f67(C, t2, (T4)(geint32(1)), l1);
}

/* LX_FULL_DFA.initialize_dfa */
void T51f67(T0* C, T0* a1, T4 a2, T4 a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	((T51*)(C))->a26 = (a2);
	((T51*)(C))->a27 = (a3);
	l2 = (((T63*)(a1))->a1);
	t1 = (T4)(geint32(2));
	t1 = ((T4)((t1)*(l2)));
	t1 = ((T4)((t1)+((T4)(geint32(1)))));
	t1 = (T4f11(&t1, (T4)(geint32(1000))));
	((T51*)(C))->a3 = T125c15(t1);
	T51f76(C, a1);
	l1 = ((T4)(geint32(1)));
	t2 = (T4f1(&l1, l2));
	while (!(t2)) {
		t3 = (T63f5(a1, l1));
		T51f77(C, t3);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f1(&l1, l2));
	}
	t1 = (T4)(geint32(2));
	((T51*)(C))->a2 = ((T4)((t1)*(l2)));
}

/* LX_FULL_DFA.put_start_condition */
void T51f77(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T4 l7 = 0;
	T4 l8 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	l1 = (((T90*)(a1))->a4);
	l2 = (((T90*)(a1))->a5);
	l8 = (((T154*)(l1))->a6);
	l3 = T122c23(l8);
	t1 = (((T154*)(l2))->a6);
	t1 = ((T4)((l8)+(t1)));
	l4 = T122c23(t1);
	l7 = ((T4)(geint32(1)));
	t2 = (T4f1(&l7, l8));
	while (!(t2)) {
		t3 = (T154f7(l1, l7));
		l5 = (T82f4(t3));
		T122f24(l3, l5);
		T122f24(l4, l5);
		l7 = ((T4)((l7)+((T4)(geint32(1)))));
		t2 = (T4f1(&l7, l8));
	}
	l8 = (((T154*)(l2))->a6);
	l7 = ((T4)(geint32(1)));
	t2 = (T4f1(&l7, l8));
	while (!(t2)) {
		t3 = (T154f7(l2, l7));
		t3 = (T82f4(t3));
		T122f24(l4, t3);
		l7 = ((T4)((l7)+((T4)(geint32(1)))));
		t2 = (T4f1(&l7, l8));
	}
	l6 = T120c18(l3, ((T51*)(C))->a26, ((T51*)(C))->a27);
	T125f16(((T51*)(C))->a3, l6);
	t1 = (((T125*)(((T51*)(C))->a3))->a1);
	T120f19(l6, t1);
	l6 = T120c18(l4, ((T51*)(C))->a26, ((T51*)(C))->a27);
	T125f16(((T51*)(C))->a3, l6);
	t1 = (((T125*)(((T51*)(C))->a3))->a1);
	T120f19(l6, t1);
}

/* LX_FULL_DFA.set_nfa_state_ids */
void T51f76(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T4 l6 = 0;
	T4 l7 = 0;
	T4 l8 = 0;
	T4 l9 = 0;
	T4 l10 = 0;
	T4 l11 = 0;
	T4 l12 = 0;
	T4 l13 = 0;
	T2 t1;
	T0* t2;
	l13 = ((T4)(geint32(1)));
	l5 = T155c34((T4)(geint32(100)));
	l7 = (((T63*)(a1))->a1);
	l6 = ((T4)(geint32(1)));
	t1 = (T4f1(&l6, l7));
	while (!(t1)) {
		l1 = (T63f5(a1, l6));
		l2 = (((T90*)(l1))->a4);
		l9 = (((T154*)(l2))->a6);
		l8 = ((T4)(geint32(1)));
		t1 = (T4f1(&l8, l9));
		while (!(t1)) {
			l3 = (T154f7(l2, l8));
			t2 = (T82f4(l3));
			l12 = (((T121*)(t2))->a4);
			t1 = (T155f1(l5, l12));
			t1 = ((T2)(!(t1)));
			if (!(t1)) {
				t2 = (T155f2(l5, l12));
				t1 = ((t2)!=(l3));
			}
			if (t1) {
				T155f35(l5, l3, l13);
				l4 = (((T82*)(l3))->a2);
				l11 = (((T122*)(l4))->a1);
				l10 = ((T4)(geint32(1)));
				t1 = (T4f1(&l10, l11));
				while (!(t1)) {
					t2 = (T122f2(l4, l10));
					T121f15(t2, l13);
					l13 = ((T4)((l13)+((T4)(geint32(1)))));
					l10 = ((T4)((l10)+((T4)(geint32(1)))));
					t1 = (T4f1(&l10, l11));
				}
			}
			l8 = ((T4)((l8)+((T4)(geint32(1)))));
			t1 = (T4f1(&l8, l9));
		}
		l2 = (((T90*)(l1))->a5);
		l9 = (((T154*)(l2))->a6);
		l8 = ((T4)(geint32(1)));
		t1 = (T4f1(&l8, l9));
		while (!(t1)) {
			l3 = (T154f7(l2, l8));
			t2 = (T82f4(l3));
			l12 = (((T121*)(t2))->a4);
			t1 = (T155f1(l5, l12));
			t1 = ((T2)(!(t1)));
			if (!(t1)) {
				t2 = (T155f2(l5, l12));
				t1 = ((t2)!=(l3));
			}
			if (t1) {
				T155f35(l5, l3, l13);
				l4 = (((T82*)(l3))->a2);
				l11 = (((T122*)(l4))->a1);
				l10 = ((T4)(geint32(1)));
				t1 = (T4f1(&l10, l11));
				while (!(t1)) {
					t2 = (T122f2(l4, l10));
					T121f15(t2, l13);
					l13 = ((T4)((l13)+((T4)(geint32(1)))));
					l10 = ((T4)((l10)+((T4)(geint32(1)))));
					t1 = (T4f1(&l10, l11));
				}
			}
			l8 = ((T4)((l8)+((T4)(geint32(1)))));
			t1 = (T4f1(&l8, l9));
		}
		l6 = ((T4)((l6)+((T4)(geint32(1)))));
		t1 = (T4f1(&l6, l7));
	}
}

/* LX_FULL_DFA.build_eof_rules */
void T51f66(T0* C, T0* a1, T4 a2, T4 a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T4 t2;
	((T51*)(C))->a31 = T124c6(a2, a3);
	l2 = (((T45*)(a1))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l3 = (T45f2(a1, l1));
		t2 = (((T46*)(l3))->a1);
		T124f7(((T51*)(C))->a31, l3, t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
}

/* LX_FULL_DFA.build_rules */
void T51f65(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	l2 = (((T45*)(a1))->a1);
	((T51*)(C))->a22 = T124c6((T4)(geint32(1)), l2);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		t2 = (T45f2(a1, l1));
		T124f7(((T51*)(C))->a22, t2, l1);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
}

/* GELEX.parse_input_file */
void T18f9(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T0* t2;
	l1 = T35c263(((T18*)(C))->a3, ((T18*)(C))->a2);
	T35f264(l1, C);
	l2 = (((T22*)(((T18*)(C))->a3))->a1);
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		l3 = T36c35(l2);
		T36f36(l3);
		t1 = (T36f1(l3));
		if (t1) {
			T35f265(l1, l3);
			T36f37(l3);
		} else {
			l4 = T37c7(l2);
			T21f7(((T18*)(C))->a2, l4);
			t2 = (T18f4(C));
			T41f2(t2, (T4)(geint32(1)));
		}
	} else {
		t2 = (T18f5(C));
		t2 = (T42f1(t2));
		T35f265(l1, t2);
	}
	t1 = (((T35*)(l1))->a1);
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = (T18f4(C));
		T41f2(t2, (T4)(geint32(1)));
	}
}

/* KL_STANDARD_FILES.input */
unsigned char ge291os3689 = '\0';
T0* ge291ov3689;
T0* T42f1(T0* C)
{
	T0* R = 0;
	if (ge291os3689) {
		return ge291ov3689;
	} else {
		ge291os3689 = '\1';
	}
	R = T43c18();
	ge291ov3689 = R;
	return R;
}

/* KL_STDIN_FILE.make */
T0* T43c18()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T43));
	((T43*)(C))->id = 43;
	T43f19(C, gems("stdin", 5));
	((T43*)(C))->a1 = (EIF_FALSE);
	return C;
}

/* KL_STDIN_FILE.make_open_stdin */
void T43f19(T0* C, T0* a1)
{
	T43f20(C, a1);
	((T43*)(C))->a2 = (T43f3(C, (T4)(geint32(0))));
	T43f21(C);
}

/* KL_STDIN_FILE.set_read_mode */
void T43f21(T0* C)
{
	((T43*)(C))->a5 = ((T4)(geint32(1)));
}

/* KL_STDIN_FILE.console_def */
T14 T43f3(T0* C, T4 a1)
{
	T14 R = 0;
	R = (T14)console_def(a1);
	return R;
}

/* KL_STDIN_FILE.old_make */
void T43f20(T0* C, T0* a1)
{
	((T43*)(C))->a4 = (a1);
	((T43*)(C))->a5 = ((T4)(geint32(0)));
}

/* UT_CANNOT_READ_FILE_ERROR.make */
T0* T37c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T37));
	((T37*)(C))->id = 37;
	((T37*)(C))->a1 = T119c7((T4)(geint32(1)), (T4)(geint32(1)));
	T119f8(((T37*)(C))->a1, a1, (T4)(geint32(1)));
	return C;
}

/* KL_TEXT_INPUT_FILE.close */
void T36f37(T0* C)
{
	T2 l1 = 0;
	T2 t1;
	t1 = ((T2)(!(l1)));
	if (t1) {
		T36f40(C);
		((T36*)(C))->a11 = (EIF_VOID);
	}
}

/* KL_TEXT_INPUT_FILE.old_close */
void T36f40(T0* C)
{
	T36f41(C, ((T36*)(C))->a17);
	((T36*)(C))->a3 = ((T4)(geint32(0)));
	((T36*)(C))->a19 = (EIF_FALSE);
}

/* KL_TEXT_INPUT_FILE.file_close */
void T36f41(T0* C, T14 a1)
{
	file_close((FILE *)a1);
}

/* LX_LEX_PARSER.parse_file */
void T35f265(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T35f15(C, a1));
	T35f268(C, t1);
	T35f269(C);
}

/* LX_LEX_PARSER.parse */
void T35f269(T0* C)
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
	t1 = ((((T35*)(C))->a33)==((T4)(geint32(105))));
	if (t1) {
		l1 = (((T35*)(C))->a35);
		l2 = (((T35*)(C))->a36);
		l3 = (((T35*)(C))->a37);
		l4 = (((T35*)(C))->a38);
		l5 = (((T35*)(C))->a39);
		l6 = (((T35*)(C))->a40);
		l7 = (((T35*)(C))->a41);
		((T35*)(C))->a33 = ((T4)(geint32(104)));
	} else {
		((T35*)(C))->a43 = ((T4)(geint32(0)));
		((T35*)(C))->a44 = (EIF_TRUE);
		((T35*)(C))->a45 = ((T4)(geint32(0)));
		T35f274(C);
		((T35*)(C))->a46 = ((T4)(geint32(-1)));
		l1 = (((T71*)(((T35*)(C))->a25))->a1);
		((T35*)(C))->a33 = ((T4)(geint32(104)));
		l7 = ((T4)(geint32(1)));
	}
	t1 = ((((T35*)(C))->a33)!=((T4)(geint32(104))));
	while (!(t1)) {
		switch (l7) {
		case (T4)(T4)(geint32(1)):
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)+((T4)(geint32(1)))));
			t1 = (T4f5(&(((T35*)(C))->a46), l1));
			if (t1) {
				l1 = ((T4)((l1)+((T4)(geint32(200)))));
				t2 = (T35f26(C));
				((T35*)(C))->a25 = (T72f2(t2, ((T35*)(C))->a25, l1));
			}
			((T71*)(((T35*)(C))->a25))->a2[((T35*)(C))->a46] = (l2);
			l3 = (((T71*)(((T35*)(C))->a53))->a2[l2]);
			t1 = ((l3)==((T4)(geint32(-32768))));
			if (t1) {
				l7 = ((T4)(geint32(2)));
			} else {
				if (((T35*)(C))->a44) {
					T35f275(C);
					((T35*)(C))->a44 = (EIF_FALSE);
				}
				t1 = (T4f1(&(((T35*)(C))->a55), (T4)(geint32(0))));
				if (t1) {
					t1 = (T4f6(&(((T35*)(C))->a55), (T4)(geint32(266))));
					if (t1) {
						l4 = (((T71*)(((T35*)(C))->a58))->a2[((T35*)(C))->a55]);
					} else {
						l4 = ((T4)(geint32(51)));
					}
					l3 = ((T4)((l3)+(l4)));
				} else {
					t1 = ((((T35*)(C))->a55)==((T4)(geint32(0))));
					if (t1) {
						l4 = ((T4)(geint32(0)));
					} else {
						((T35*)(C))->a43 = ((T4)((((T35*)(C))->a43)+((T4)(geint32(1)))));
						T35f276(C, l2);
						T35f277(C);
						l3 = ((T4)(geint32(-1)));
					}
				}
				t1 = ((T2)((l3)<((T4)(geint32(0)))));
				if (!(t1)) {
					t1 = (T4f1(&l3, (T4)(geint32(80))));
				}
				if (!(t1)) {
					t3 = (((T71*)(((T35*)(C))->a61))->a2[l3]);
					t1 = ((t3)!=(l4));
				}
				if (t1) {
					l7 = ((T4)(geint32(2)));
				} else {
					l3 = (((T71*)(((T35*)(C))->a62))->a2[l3]);
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
							t1 = ((l3)==((T4)(geint32(82))));
							if (t1) {
								T35f278(C);
							} else {
								t1 = (T4f1(&(((T35*)(C))->a55), (T4)(geint32(0))));
								if (t1) {
									((T35*)(C))->a44 = (EIF_TRUE);
								}
								T35f279(C, l4);
								t1 = ((((T35*)(C))->a45)!=((T4)(geint32(0))));
								if (t1) {
									((T35*)(C))->a45 = ((T4)((((T35*)(C))->a45)-((T4)(geint32(1)))));
								}
								l2 = (l3);
							}
						}
					}
				}
			}
			break;
		case (T4)(T4)(geint32(2)):
			l3 = (((T71*)(((T35*)(C))->a64))->a2[l2]);
			t1 = ((l3)==((T4)(geint32(0))));
			if (t1) {
				l7 = ((T4)(geint32(4)));
			} else {
				l7 = ((T4)(geint32(3)));
			}
			break;
		case (T4)(T4)(geint32(3)):
			T35f280(C, l3);
			switch (((T35*)(C))->a33) {
			case (T4)(T4)(geint32(104)):
				l3 = (((T71*)(((T35*)(C))->a66))->a2[l3]);
				l6 = (((T71*)(((T35*)(C))->a25))->a2[((T35*)(C))->a46]);
				l5 = ((T4)((l3)-((T4)(geint32(31)))));
				t3 = (((T71*)(((T35*)(C))->a68))->a2[l5]);
				l2 = ((T4)((t3)+(l6)));
				t1 = (T4f5(&l2, (T4)(geint32(0))));
				if (t1) {
					t1 = (T4f6(&l2, (T4)(geint32(80))));
				}
				if (t1) {
					t3 = (((T71*)(((T35*)(C))->a61))->a2[l2]);
					t1 = ((t3)==(l6));
				}
				if (t1) {
					l2 = (((T71*)(((T35*)(C))->a62))->a2[l2]);
				} else {
					l2 = (((T71*)(((T35*)(C))->a69))->a2[l5]);
				}
				l7 = ((T4)(geint32(1)));
				break;
			case (T4)(T4)(geint32(105)):
				((T35*)(C))->a35 = (l1);
				((T35*)(C))->a36 = (l2);
				((T35*)(C))->a37 = (l3);
				((T35*)(C))->a38 = (l4);
				((T35*)(C))->a39 = (l5);
				((T35*)(C))->a40 = (l6);
				((T35*)(C))->a41 = (l7);
				break;
			case (T4)(T4)(geint32(103)):
				((T35*)(C))->a33 = ((T4)(geint32(104)));
				l7 = ((T4)(geint32(4)));
				break;
			default:
				break;
			}
			break;
		case (T4)(T4)(geint32(4)):
			t1 = ((((T35*)(C))->a45)==((T4)(geint32(3))));
			if (t1) {
				t1 = (T4f6(&(((T35*)(C))->a55), (T4)(geint32(0))));
				if (t1) {
					T35f277(C);
				} else {
					((T35*)(C))->a44 = (EIF_TRUE);
					l7 = ((T4)(geint32(5)));
				}
			} else {
				t1 = ((((T35*)(C))->a45)==((T4)(geint32(0))));
				if (t1) {
					((T35*)(C))->a43 = ((T4)((((T35*)(C))->a43)+((T4)(geint32(1)))));
					T35f276(C, l2);
				}
				((T35*)(C))->a45 = ((T4)(geint32(3)));
				l7 = ((T4)(geint32(5)));
			}
			break;
		case (T4)(T4)(geint32(5)):
			l3 = (((T71*)(((T35*)(C))->a53))->a2[l2]);
			t1 = ((l3)==((T4)(geint32(-32768))));
			if (t1) {
				l7 = ((T4)(geint32(6)));
			} else {
				l3 = ((T4)((l3)+((T4)(geint32(1)))));
				t1 = ((T2)((l3)<((T4)(geint32(0)))));
				if (!(t1)) {
					t1 = (T4f1(&l3, (T4)(geint32(80))));
				}
				if (!(t1)) {
					t3 = (((T71*)(((T35*)(C))->a61))->a2[l3]);
					t1 = ((t3)!=((T4)(geint32(1))));
				}
				if (t1) {
					l7 = ((T4)(geint32(6)));
				} else {
					l3 = (((T71*)(((T35*)(C))->a62))->a2[l3]);
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
							t1 = ((l3)==((T4)(geint32(82))));
							if (t1) {
								T35f278(C);
							} else {
								T35f281(C);
								l2 = (l3);
								l7 = ((T4)(geint32(1)));
							}
						}
					}
				}
			}
			break;
		case (T4)(T4)(geint32(6)):
			t1 = ((((T35*)(C))->a46)==((T4)(geint32(0))));
			if (t1) {
				T35f277(C);
			} else {
				T35f282(C, l2);
				((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(1)))));
				l2 = (((T71*)(((T35*)(C))->a25))->a2[((T35*)(C))->a46]);
				l7 = ((T4)(geint32(5)));
			}
			break;
		default:
			break;
		}
		t1 = ((((T35*)(C))->a33)!=((T4)(geint32(104))));
	}
	t1 = ((((T35*)(C))->a33)!=((T4)(geint32(105))));
	if (t1) {
		T35f283(C);
	}
}

/* LX_LEX_PARSER.yy_clear_all */
void T35f283(T0* C)
{
	T35f317(C);
}

/* LX_LEX_PARSER.clear_all */
void T35f317(T0* C)
{
	T35f348(C);
}

/* LX_LEX_PARSER.clear_stacks */
void T35f348(T0* C)
{
	T35f355(C);
}

/* LX_LEX_PARSER.yy_clear_value_stacks */
void T35f355(T0* C)
{
	T2 t1;
	t1 = ((((T35*)(C))->a135)!=(EIF_VOID));
	if (t1) {
		T75f6(((T35*)(C))->a135);
	}
	t1 = ((((T35*)(C))->a140)!=(EIF_VOID));
	if (t1) {
		T77f6(((T35*)(C))->a140);
	}
	t1 = ((((T35*)(C))->a144)!=(EIF_VOID));
	if (t1) {
		T71f9(((T35*)(C))->a144);
	}
	t1 = ((((T35*)(C))->a148)!=(EIF_VOID));
	if (t1) {
		T80f6(((T35*)(C))->a148);
	}
	t1 = ((((T35*)(C))->a153)!=(EIF_VOID));
	if (t1) {
		T84f6(((T35*)(C))->a153);
	}
}

/* SPECIAL [LX_NFA].clear_all */
void T84f6(T0* C)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T4 t1;
	T2 t2;
	t1 = (((T84*)(C))->a1);
	l1 = ((T4)((t1)-((T4)(geint32(1)))));
	t2 = ((T2)((l1)<((T4)(geint32(0)))));
	while (!(t2)) {
		((T84*)(C))->a2[l1] = (l2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t2 = ((T2)((l1)<((T4)(geint32(0)))));
	}
}

/* SPECIAL [LX_SYMBOL_CLASS].clear_all */
void T80f6(T0* C)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T4 t1;
	T2 t2;
	t1 = (((T80*)(C))->a1);
	l1 = ((T4)((t1)-((T4)(geint32(1)))));
	t2 = ((T2)((l1)<((T4)(geint32(0)))));
	while (!(t2)) {
		((T80*)(C))->a2[l1] = (l2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t2 = ((T2)((l1)<((T4)(geint32(0)))));
	}
}

/* SPECIAL [INTEGER].clear_all */
void T71f9(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 t1;
	T2 t2;
	t1 = (((T71*)(C))->a1);
	l1 = ((T4)((t1)-((T4)(geint32(1)))));
	t2 = ((T2)((l1)<((T4)(geint32(0)))));
	while (!(t2)) {
		((T71*)(C))->a2[l1] = (l2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t2 = ((T2)((l1)<((T4)(geint32(0)))));
	}
}

/* SPECIAL [STRING].clear_all */
void T77f6(T0* C)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T4 t1;
	T2 t2;
	t1 = (((T77*)(C))->a1);
	l1 = ((T4)((t1)-((T4)(geint32(1)))));
	t2 = ((T2)((l1)<((T4)(geint32(0)))));
	while (!(t2)) {
		((T77*)(C))->a2[l1] = (l2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t2 = ((T2)((l1)<((T4)(geint32(0)))));
	}
}

/* SPECIAL [ANY].clear_all */
void T75f6(T0* C)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T4 t1;
	T2 t2;
	t1 = (((T75*)(C))->a1);
	l1 = ((T4)((t1)-((T4)(geint32(1)))));
	t2 = ((T2)((l1)<((T4)(geint32(0)))));
	while (!(t2)) {
		((T75*)(C))->a2[l1] = (l2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t2 = ((T2)((l1)<((T4)(geint32(0)))));
	}
}

/* LX_LEX_PARSER.yy_pop_last_value */
void T35f282(T0* C, T4 a1)
{
	T4 l1 = 0;
	l1 = (((T71*)(((T35*)(C))->a73))->a2[a1]);
	switch (l1) {
	case (T4)(T4)(geint32(1)):
		((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(1)))));
		break;
	case (T4)(T4)(geint32(2)):
		((T35*)(C))->a85 = ((T4)((((T35*)(C))->a85)-((T4)(geint32(1)))));
		break;
	case (T4)(T4)(geint32(3)):
		((T35*)(C))->a86 = ((T4)((((T35*)(C))->a86)-((T4)(geint32(1)))));
		break;
	case (T4)(T4)(geint32(4)):
		((T35*)(C))->a87 = ((T4)((((T35*)(C))->a87)-((T4)(geint32(1)))));
		break;
	case (T4)(T4)(geint32(5)):
		((T35*)(C))->a88 = ((T4)((((T35*)(C))->a88)-((T4)(geint32(1)))));
		break;
	default:
		T35f277(C);
		break;
	}
}

/* LX_LEX_PARSER.yy_push_error_value */
void T35f281(T0* C)
{
	T0* l1 = 0;
	T2 t1;
	((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)+((T4)(geint32(1)))));
	t1 = (T4f5(&(((T35*)(C))->a84), ((T35*)(C))->a134));
	if (t1) {
		t1 = ((((T35*)(C))->a135)==(EIF_VOID));
		if (t1) {
			((T35*)(C))->a136 = T76c3();
			((T35*)(C))->a134 = ((T4)(geint32(10)));
			((T35*)(C))->a135 = (T76f1(((T35*)(C))->a136, ((T35*)(C))->a134));
		} else {
			((T35*)(C))->a134 = ((T4)((((T35*)(C))->a134)+((T4)(geint32(10)))));
			((T35*)(C))->a135 = (T76f2(((T35*)(C))->a136, ((T35*)(C))->a135, ((T35*)(C))->a134));
		}
	}
	((T75*)(((T35*)(C))->a135))->a2[((T35*)(C))->a84] = (l1);
}

/* KL_SPECIAL_ROUTINES [ANY].resize */
T0* T76f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T75*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T75f2(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [ANY].resized_area */
T0* T75f2(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T75c4(a1);
	l2 = (((T75*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T75*)(C))->a2[l1]);
		((T75*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* SPECIAL [ANY].make */
T0* T75c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T75)+a1*sizeof(T0*));
	((T75*)(C))->a1 = a1;
	((T75*)(C))->id = 75;
	return C;
}

/* KL_SPECIAL_ROUTINES [ANY].make */
T0* T76f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T175c2(a1);
	R = (((T175*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [ANY].make_area */
T0* T175c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T175));
	((T175*)(C))->id = 175;
	((T175*)(C))->a1 = T75c4(a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [ANY].default_create */
T0* T76c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T76));
	((T76*)(C))->id = 76;
	return C;
}

/* LX_LEX_PARSER.yy_do_action */
void T35f280(T0* C, T4 a1)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T0* t4;
	T4 t5;
	switch (a1) {
	case (T4)(T4)(geint32(1)):
		T35f292(C);
		t1 = (((T22*)(((T35*)(C))->a16))->a24);
		t2 = ((t1)!=(EIF_VOID));
		if (t2) {
			T35f293(C);
		}
		T35f294(C);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(4)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(3)))));
			((T75*)(((T35*)(C))->a135))->a2[((T35*)(C))->a84] = (l1);
		}
		break;
	case (T4)(T4)(geint32(2)):
		T35f295(C);
		t2 = (((T22*)(((T35*)(C))->a16))->a10);
		if (t2) {
			T22f49(((T35*)(C))->a16);
		}
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(1)))));
			((T75*)(((T35*)(C))->a135))->a2[((T35*)(C))->a84] = (l1);
		}
		break;
	case (T4)(T4)(geint32(3)):
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(0)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)+((T4)(geint32(1)))));
			t2 = (T4f5(&(((T35*)(C))->a84), ((T35*)(C))->a134));
			if (t2) {
				t2 = ((((T35*)(C))->a135)==(EIF_VOID));
				if (t2) {
					((T35*)(C))->a136 = T76c3();
					((T35*)(C))->a134 = ((T4)(geint32(10)));
					((T35*)(C))->a135 = (T76f1(((T35*)(C))->a136, ((T35*)(C))->a134));
				} else {
					((T35*)(C))->a134 = ((T4)((((T35*)(C))->a134)+((T4)(geint32(10)))));
					((T35*)(C))->a135 = (T76f2(((T35*)(C))->a136, ((T35*)(C))->a135, ((T35*)(C))->a134));
				}
			}
			((T75*)(((T35*)(C))->a135))->a2[((T35*)(C))->a84] = (l1);
		}
		break;
	case (T4)(T4)(geint32(4)):
		t3 = (((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86]);
		T63f19(((T35*)(C))->a4, t3);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(5)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(3)))));
			((T35*)(C))->a86 = ((T4)((((T35*)(C))->a86)-((T4)(geint32(1)))));
			((T75*)(((T35*)(C))->a135))->a2[((T35*)(C))->a84] = (l1);
		}
		break;
	case (T4)(T4)(geint32(5)):
		t3 = (((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86]);
		T63f19(((T35*)(C))->a4, t3);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(5)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(3)))));
			((T35*)(C))->a86 = ((T4)((((T35*)(C))->a86)-((T4)(geint32(1)))));
			((T75*)(((T35*)(C))->a135))->a2[((T35*)(C))->a84] = (l1);
		}
		break;
	case (T4)(T4)(geint32(6)):
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(0)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)+((T4)(geint32(1)))));
			t2 = (T4f5(&(((T35*)(C))->a84), ((T35*)(C))->a134));
			if (t2) {
				t2 = ((((T35*)(C))->a135)==(EIF_VOID));
				if (t2) {
					((T35*)(C))->a136 = T76c3();
					((T35*)(C))->a134 = ((T4)(geint32(10)));
					((T35*)(C))->a135 = (T76f1(((T35*)(C))->a136, ((T35*)(C))->a134));
				} else {
					((T35*)(C))->a134 = ((T4)((((T35*)(C))->a134)+((T4)(geint32(10)))));
					((T35*)(C))->a135 = (T76f2(((T35*)(C))->a136, ((T35*)(C))->a135, ((T35*)(C))->a134));
				}
			}
			((T75*)(((T35*)(C))->a135))->a2[((T35*)(C))->a84] = (l1);
		}
		break;
	case (T4)(T4)(geint32(7)):
		t1 = (((T77*)(((T35*)(C))->a140))->a2[((T35*)(C))->a85]);
		T35f296(C, t1);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(1)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)+((T4)(geint32(1)))));
			((T35*)(C))->a85 = ((T4)((((T35*)(C))->a85)-((T4)(geint32(1)))));
			t2 = (T4f5(&(((T35*)(C))->a84), ((T35*)(C))->a134));
			if (t2) {
				t2 = ((((T35*)(C))->a135)==(EIF_VOID));
				if (t2) {
					((T35*)(C))->a136 = T76c3();
					((T35*)(C))->a134 = ((T4)(geint32(10)));
					((T35*)(C))->a135 = (T76f1(((T35*)(C))->a136, ((T35*)(C))->a134));
				} else {
					((T35*)(C))->a134 = ((T4)((((T35*)(C))->a134)+((T4)(geint32(10)))));
					((T35*)(C))->a135 = (T76f2(((T35*)(C))->a136, ((T35*)(C))->a135, ((T35*)(C))->a134));
				}
			}
			((T75*)(((T35*)(C))->a135))->a2[((T35*)(C))->a84] = (l1);
		}
		break;
	case (T4)(T4)(geint32(8)):
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(1)))));
			((T75*)(((T35*)(C))->a135))->a2[((T35*)(C))->a84] = (l1);
		}
		break;
	case (T4)(T4)(geint32(9)):
		T35f296(C, gems("", 0));
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(1)))));
			((T75*)(((T35*)(C))->a135))->a2[((T35*)(C))->a84] = (l1);
		}
		break;
	case (T4)(T4)(geint32(10)):
		((T35*)(C))->a151 = (EIF_FALSE);
		t1 = (((T22*)(((T35*)(C))->a16))->a5);
		t3 = (((T45*)(t1))->a1);
		t3 = ((T4)((t3)+((T4)(geint32(1)))));
		((T35*)(C))->a152 = T46c15(t3);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(0)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)+((T4)(geint32(1)))));
			t2 = (T4f5(&(((T35*)(C))->a84), ((T35*)(C))->a134));
			if (t2) {
				t2 = ((((T35*)(C))->a135)==(EIF_VOID));
				if (t2) {
					((T35*)(C))->a136 = T76c3();
					((T35*)(C))->a134 = ((T4)(geint32(10)));
					((T35*)(C))->a135 = (T76f1(((T35*)(C))->a136, ((T35*)(C))->a134));
				} else {
					((T35*)(C))->a134 = ((T4)((((T35*)(C))->a134)+((T4)(geint32(10)))));
					((T35*)(C))->a135 = (T76f2(((T35*)(C))->a136, ((T35*)(C))->a135, ((T35*)(C))->a134));
				}
			}
			((T75*)(((T35*)(C))->a135))->a2[((T35*)(C))->a84] = (l1);
		}
		break;
	case (T4)(T4)(geint32(11)):
		l2 = (((T63*)(((T35*)(C))->a4))->a1);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(0)))));
			((T35*)(C))->a86 = ((T4)((((T35*)(C))->a86)+((T4)(geint32(1)))));
			t2 = (T4f5(&(((T35*)(C))->a86), ((T35*)(C))->a143));
			if (t2) {
				t2 = ((((T35*)(C))->a144)==(EIF_VOID));
				if (t2) {
					((T35*)(C))->a145 = T72c4();
					((T35*)(C))->a143 = ((T4)(geint32(10)));
					((T35*)(C))->a144 = (T72f1(((T35*)(C))->a145, ((T35*)(C))->a143));
				} else {
					((T35*)(C))->a143 = ((T4)((((T35*)(C))->a143)+((T4)(geint32(10)))));
					((T35*)(C))->a144 = (T72f2(((T35*)(C))->a145, ((T35*)(C))->a144, ((T35*)(C))->a143));
				}
			}
			((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86] = (l2);
		}
		break;
	case (T4)(T4)(geint32(12)):
		l2 = (((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86]);
		t1 = (((T22*)(((T35*)(C))->a16))->a19);
		T63f20(((T35*)(C))->a4, t1);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(3)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(2)))));
			((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86] = (l2);
		}
		break;
	case (T4)(T4)(geint32(13)):
		l2 = (((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86]);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(3)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(2)))));
			((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86] = (l2);
		}
		break;
	case (T4)(T4)(geint32(14)):
		l2 = (((T63*)(((T35*)(C))->a4))->a1);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(1)))));
			((T35*)(C))->a86 = ((T4)((((T35*)(C))->a86)+((T4)(geint32(1)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(1)))));
			t2 = (T4f5(&(((T35*)(C))->a86), ((T35*)(C))->a143));
			if (t2) {
				t2 = ((((T35*)(C))->a144)==(EIF_VOID));
				if (t2) {
					((T35*)(C))->a145 = T72c4();
					((T35*)(C))->a143 = ((T4)(geint32(10)));
					((T35*)(C))->a144 = (T72f1(((T35*)(C))->a145, ((T35*)(C))->a143));
				} else {
					((T35*)(C))->a143 = ((T4)((((T35*)(C))->a143)+((T4)(geint32(10)))));
					((T35*)(C))->a144 = (T72f2(((T35*)(C))->a145, ((T35*)(C))->a144, ((T35*)(C))->a143));
				}
			}
			((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86] = (l2);
		}
		break;
	case (T4)(T4)(geint32(15)):
		t1 = (((T77*)(((T35*)(C))->a140))->a2[((T35*)(C))->a85]);
		T35f297(C, t1, ((T35*)(C))->a4);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(1)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)+((T4)(geint32(1)))));
			((T35*)(C))->a85 = ((T4)((((T35*)(C))->a85)-((T4)(geint32(1)))));
			t2 = (T4f5(&(((T35*)(C))->a84), ((T35*)(C))->a134));
			if (t2) {
				t2 = ((((T35*)(C))->a135)==(EIF_VOID));
				if (t2) {
					((T35*)(C))->a136 = T76c3();
					((T35*)(C))->a134 = ((T4)(geint32(10)));
					((T35*)(C))->a135 = (T76f1(((T35*)(C))->a136, ((T35*)(C))->a134));
				} else {
					((T35*)(C))->a134 = ((T4)((((T35*)(C))->a134)+((T4)(geint32(10)))));
					((T35*)(C))->a135 = (T76f2(((T35*)(C))->a136, ((T35*)(C))->a135, ((T35*)(C))->a134));
				}
			}
			((T75*)(((T35*)(C))->a135))->a2[((T35*)(C))->a84] = (l1);
		}
		break;
	case (T4)(T4)(geint32(16)):
		t1 = (((T77*)(((T35*)(C))->a140))->a2[((T35*)(C))->a85]);
		T35f297(C, t1, ((T35*)(C))->a4);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(3)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(1)))));
			((T35*)(C))->a85 = ((T4)((((T35*)(C))->a85)-((T4)(geint32(1)))));
			((T75*)(((T35*)(C))->a135))->a2[((T35*)(C))->a84] = (l1);
		}
		break;
	case (T4)(T4)(geint32(17)):
		T35f298(C);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(1)))));
			((T75*)(((T35*)(C))->a135))->a2[((T35*)(C))->a84] = (l1);
		}
		break;
	case (T4)(T4)(geint32(18)):
		t1 = (((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88]);
		T35f299(C, t1);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(2)))));
			((T35*)(C))->a88 = ((T4)((((T35*)(C))->a88)-((T4)(geint32(1)))));
			((T75*)(((T35*)(C))->a135))->a2[((T35*)(C))->a84] = (l1);
		}
		break;
	case (T4)(T4)(geint32(19)):
		t1 = (((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88]);
		T35f300(C, t1);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(1)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)+((T4)(geint32(1)))));
			((T35*)(C))->a88 = ((T4)((((T35*)(C))->a88)-((T4)(geint32(1)))));
			t2 = (T4f5(&(((T35*)(C))->a84), ((T35*)(C))->a134));
			if (t2) {
				t2 = ((((T35*)(C))->a135)==(EIF_VOID));
				if (t2) {
					((T35*)(C))->a136 = T76c3();
					((T35*)(C))->a134 = ((T4)(geint32(10)));
					((T35*)(C))->a135 = (T76f1(((T35*)(C))->a136, ((T35*)(C))->a134));
				} else {
					((T35*)(C))->a134 = ((T4)((((T35*)(C))->a134)+((T4)(geint32(10)))));
					((T35*)(C))->a135 = (T76f2(((T35*)(C))->a136, ((T35*)(C))->a135, ((T35*)(C))->a134));
				}
			}
			((T75*)(((T35*)(C))->a135))->a2[((T35*)(C))->a84] = (l1);
		}
		break;
	case (T4)(T4)(geint32(20)):
		T35f301(C);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(1)))));
			((T75*)(((T35*)(C))->a135))->a2[((T35*)(C))->a84] = (l1);
		}
		break;
	case (T4)(T4)(geint32(21)):
		T35f302(C);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(1)))));
			((T75*)(((T35*)(C))->a135))->a2[((T35*)(C))->a84] = (l1);
		}
		break;
	case (T4)(T4)(geint32(22)):
		((T35*)(C))->a154 = (EIF_TRUE);
		((T35*)(C))->a155 = (((T35*)(C))->a156);
		t1 = (((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88]);
		t3 = ((T4)((((T35*)(C))->a88)-((T4)(geint32(1)))));
		t4 = (((T84*)(((T35*)(C))->a153))->a2[t3]);
		l3 = (T35f157(C, t1, t4));
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(2)))));
			((T35*)(C))->a88 = ((T4)((((T35*)(C))->a88)-((T4)(geint32(1)))));
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(23)):
		((T35*)(C))->a154 = (EIF_TRUE);
		((T35*)(C))->a158 = (((T35*)(C))->a156);
		((T35*)(C))->a159 = (((T35*)(C))->a160);
		((T35*)(C))->a161 = (((T35*)(C))->a162);
		((T35*)(C))->a155 = ((T4)(geint32(1)));
		t1 = (((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88]);
		l3 = (T35f163(C, t1));
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(2)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(1)))));
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(24)):
		l3 = (((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88]);
		((T35*)(C))->a154 = (EIF_FALSE);
		((T35*)(C))->a158 = (((T35*)(C))->a156);
		((T35*)(C))->a159 = (((T35*)(C))->a160);
		((T35*)(C))->a161 = (((T35*)(C))->a162);
		((T35*)(C))->a155 = ((T4)(geint32(0)));
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(1)))));
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(25)):
		T35f303(C);
		((T35*)(C))->a154 = (EIF_TRUE);
		((T35*)(C))->a155 = (((T35*)(C))->a156);
		l3 = (T35f164(C));
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(2)))));
			((T35*)(C))->a88 = ((T4)((((T35*)(C))->a88)-((T4)(geint32(1)))));
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(26)):
		T35f303(C);
		((T35*)(C))->a154 = (EIF_TRUE);
		((T35*)(C))->a155 = (((T35*)(C))->a156);
		l3 = (T35f164(C));
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(3)))));
			((T35*)(C))->a88 = ((T4)((((T35*)(C))->a88)-((T4)(geint32(1)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(1)))));
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(27)):
		l3 = (((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88]);
		((T35*)(C))->a156 = (((T35*)(C))->a165);
		((T35*)(C))->a160 = (((T35*)(C))->a166);
		((T35*)(C))->a162 = (((T35*)(C))->a167);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(1)))));
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(28)):
		((T35*)(C))->a160 = (T65f1(((T35*)(C))->a11));
		T65f9(((T35*)(C))->a11);
		((T35*)(C))->a162 = (T65f1(((T35*)(C))->a12));
		T65f9(((T35*)(C))->a12);
		((T35*)(C))->a156 = (T65f1(((T35*)(C))->a13));
		T65f9(((T35*)(C))->a13);
		t3 = ((T4)((((T35*)(C))->a88)-((T4)(geint32(2)))));
		l3 = (((T84*)(((T35*)(C))->a153))->a2[t3]);
		t1 = (((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88]);
		T82f10(l3, t1);
		T35f304(C);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(4)))));
			((T35*)(C))->a88 = ((T4)((((T35*)(C))->a88)-((T4)(geint32(2)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(1)))));
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(29)):
		T65f10(((T35*)(C))->a11, ((T35*)(C))->a160);
		T65f10(((T35*)(C))->a12, ((T35*)(C))->a162);
		T65f10(((T35*)(C))->a13, ((T35*)(C))->a156);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(0)))));
			((T35*)(C))->a88 = ((T4)((((T35*)(C))->a88)+((T4)(geint32(1)))));
			t2 = (T4f5(&(((T35*)(C))->a88), ((T35*)(C))->a168));
			if (t2) {
				t2 = ((((T35*)(C))->a153)==(EIF_VOID));
				if (t2) {
					((T35*)(C))->a169 = T85c3();
					((T35*)(C))->a168 = ((T4)(geint32(10)));
					((T35*)(C))->a153 = (T85f1(((T35*)(C))->a169, ((T35*)(C))->a168));
				} else {
					((T35*)(C))->a168 = ((T4)((((T35*)(C))->a168)+((T4)(geint32(10)))));
					((T35*)(C))->a153 = (T85f2(((T35*)(C))->a169, ((T35*)(C))->a153, ((T35*)(C))->a168));
				}
			}
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(30)):
		l3 = (((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88]);
		((T35*)(C))->a158 = (((T35*)(C))->a156);
		((T35*)(C))->a159 = (((T35*)(C))->a160);
		((T35*)(C))->a161 = (((T35*)(C))->a162);
		((T35*)(C))->a151 = (EIF_TRUE);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(2)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(1)))));
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(31)):
		T65f9(((T35*)(C))->a7);
		T65f9(((T35*)(C))->a9);
		T65f9(((T35*)(C))->a10);
		l3 = (((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88]);
		((T35*)(C))->a165 = (((T35*)(C))->a170);
		((T35*)(C))->a166 = (((T35*)(C))->a171);
		((T35*)(C))->a167 = (((T35*)(C))->a172);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(1)))));
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(32)):
		((T35*)(C))->a171 = (T65f1(((T35*)(C))->a7));
		T65f9(((T35*)(C))->a7);
		((T35*)(C))->a172 = (T65f1(((T35*)(C))->a9));
		T65f9(((T35*)(C))->a9);
		((T35*)(C))->a170 = (T65f1(((T35*)(C))->a10));
		T65f9(((T35*)(C))->a10);
		t3 = ((T4)((((T35*)(C))->a88)-((T4)(geint32(1)))));
		l3 = (((T84*)(((T35*)(C))->a153))->a2[t3]);
		t1 = (((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88]);
		T82f11(l3, t1);
		T35f305(C);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(2)))));
			((T35*)(C))->a88 = ((T4)((((T35*)(C))->a88)-((T4)(geint32(1)))));
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(33)):
		T65f10(((T35*)(C))->a7, ((T35*)(C))->a171);
		T65f10(((T35*)(C))->a9, ((T35*)(C))->a172);
		T65f10(((T35*)(C))->a10, ((T35*)(C))->a170);
		l3 = (((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88]);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(1)))));
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(34)):
		t3 = (((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86]);
		l3 = (T35f173(C, t3));
		t3 = (((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86]);
		T35f306(C, t3);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(1)))));
			((T35*)(C))->a88 = ((T4)((((T35*)(C))->a88)+((T4)(geint32(1)))));
			((T35*)(C))->a86 = ((T4)((((T35*)(C))->a86)-((T4)(geint32(1)))));
			t2 = (T4f5(&(((T35*)(C))->a88), ((T35*)(C))->a168));
			if (t2) {
				t2 = ((((T35*)(C))->a153)==(EIF_VOID));
				if (t2) {
					((T35*)(C))->a169 = T85c3();
					((T35*)(C))->a168 = ((T4)(geint32(10)));
					((T35*)(C))->a153 = (T85f1(((T35*)(C))->a169, ((T35*)(C))->a168));
				} else {
					((T35*)(C))->a168 = ((T4)((((T35*)(C))->a168)+((T4)(geint32(10)))));
					((T35*)(C))->a153 = (T85f2(((T35*)(C))->a169, ((T35*)(C))->a153, ((T35*)(C))->a168));
				}
			}
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(35)):
		l3 = (((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88]);
		T82f12(l3);
		T35f307(C);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(2)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(1)))));
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(36)):
		l3 = (((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88]);
		T82f13(l3);
		T35f308(C);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(2)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(1)))));
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(37)):
		l3 = (((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88]);
		T82f14(l3);
		T35f309(C);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(2)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(1)))));
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(38)):
		t1 = (((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88]);
		t3 = ((T4)((((T35*)(C))->a86)-((T4)(geint32(1)))));
		t3 = (((T71*)(((T35*)(C))->a144))->a2[t3]);
		t5 = (((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86]);
		l3 = (T35f174(C, t1, t3, t5));
		t3 = ((T4)((((T35*)(C))->a86)-((T4)(geint32(1)))));
		t3 = (((T71*)(((T35*)(C))->a144))->a2[t3]);
		t5 = (((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86]);
		T35f310(C, t3, t5);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(6)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(3)))));
			((T35*)(C))->a86 = ((T4)((((T35*)(C))->a86)-((T4)(geint32(2)))));
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(39)):
		t1 = (((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88]);
		t3 = (((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86]);
		l3 = (T35f175(C, t1, t3));
		t3 = (((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86]);
		T35f311(C, t3);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(5)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(3)))));
			((T35*)(C))->a86 = ((T4)((((T35*)(C))->a86)-((T4)(geint32(1)))));
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(40)):
		t1 = (((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88]);
		t3 = (((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86]);
		l3 = (T35f176(C, t1, t3));
		t3 = (((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86]);
		T35f312(C, t3);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(4)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(2)))));
			((T35*)(C))->a86 = ((T4)((((T35*)(C))->a86)-((T4)(geint32(1)))));
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(41)):
		t1 = (T35f177(C));
		l3 = (T35f178(C, t1));
		T35f313(C);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(1)))));
			((T35*)(C))->a88 = ((T4)((((T35*)(C))->a88)+((T4)(geint32(1)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(1)))));
			t2 = (T4f5(&(((T35*)(C))->a88), ((T35*)(C))->a168));
			if (t2) {
				t2 = ((((T35*)(C))->a153)==(EIF_VOID));
				if (t2) {
					((T35*)(C))->a169 = T85c3();
					((T35*)(C))->a168 = ((T4)(geint32(10)));
					((T35*)(C))->a153 = (T85f1(((T35*)(C))->a169, ((T35*)(C))->a168));
				} else {
					((T35*)(C))->a168 = ((T4)((((T35*)(C))->a168)+((T4)(geint32(10)))));
					((T35*)(C))->a153 = (T85f2(((T35*)(C))->a169, ((T35*)(C))->a153, ((T35*)(C))->a168));
				}
			}
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(42)):
		t1 = (((T80*)(((T35*)(C))->a148))->a2[((T35*)(C))->a87]);
		l3 = (T35f178(C, t1));
		t1 = (((T80*)(((T35*)(C))->a148))->a2[((T35*)(C))->a87]);
		T35f314(C, t1);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(1)))));
			((T35*)(C))->a88 = ((T4)((((T35*)(C))->a88)+((T4)(geint32(1)))));
			((T35*)(C))->a87 = ((T4)((((T35*)(C))->a87)-((T4)(geint32(1)))));
			t2 = (T4f5(&(((T35*)(C))->a88), ((T35*)(C))->a168));
			if (t2) {
				t2 = ((((T35*)(C))->a153)==(EIF_VOID));
				if (t2) {
					((T35*)(C))->a169 = T85c3();
					((T35*)(C))->a168 = ((T4)(geint32(10)));
					((T35*)(C))->a153 = (T85f1(((T35*)(C))->a169, ((T35*)(C))->a168));
				} else {
					((T35*)(C))->a168 = ((T4)((((T35*)(C))->a168)+((T4)(geint32(10)))));
					((T35*)(C))->a153 = (T85f2(((T35*)(C))->a169, ((T35*)(C))->a153, ((T35*)(C))->a168));
				}
			}
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(43)):
		t1 = (((T80*)(((T35*)(C))->a148))->a2[((T35*)(C))->a87]);
		l3 = (T35f179(C, t1));
		t1 = (((T80*)(((T35*)(C))->a148))->a2[((T35*)(C))->a87]);
		T35f314(C, t1);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(1)))));
			((T35*)(C))->a88 = ((T4)((((T35*)(C))->a88)+((T4)(geint32(1)))));
			((T35*)(C))->a87 = ((T4)((((T35*)(C))->a87)-((T4)(geint32(1)))));
			t2 = (T4f5(&(((T35*)(C))->a88), ((T35*)(C))->a168));
			if (t2) {
				t2 = ((((T35*)(C))->a153)==(EIF_VOID));
				if (t2) {
					((T35*)(C))->a169 = T85c3();
					((T35*)(C))->a168 = ((T4)(geint32(10)));
					((T35*)(C))->a153 = (T85f1(((T35*)(C))->a169, ((T35*)(C))->a168));
				} else {
					((T35*)(C))->a168 = ((T4)((((T35*)(C))->a168)+((T4)(geint32(10)))));
					((T35*)(C))->a153 = (T85f2(((T35*)(C))->a169, ((T35*)(C))->a153, ((T35*)(C))->a168));
				}
			}
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(44)):
		l3 = (((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88]);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(3)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(2)))));
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(45)):
		l3 = (((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88]);
		((T35*)(C))->a170 = (((T35*)(C))->a156);
		((T35*)(C))->a171 = (((T35*)(C))->a160);
		((T35*)(C))->a172 = (((T35*)(C))->a162);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(3)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(2)))));
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(46)):
		l4 = (((T80*)(((T35*)(C))->a148))->a2[((T35*)(C))->a87]);
		t1 = (((T77*)(((T35*)(C))->a140))->a2[((T35*)(C))->a85]);
		T70f41(((T35*)(C))->a22, l4, t1);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(3)))));
			((T35*)(C))->a85 = ((T4)((((T35*)(C))->a85)-((T4)(geint32(1)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(1)))));
			((T80*)(((T35*)(C))->a148))->a2[((T35*)(C))->a87] = (l4);
		}
		break;
	case (T4)(T4)(geint32(47)):
		l4 = (((T80*)(((T35*)(C))->a148))->a2[((T35*)(C))->a87]);
		T79f19(l4, EIF_TRUE);
		t1 = (((T77*)(((T35*)(C))->a140))->a2[((T35*)(C))->a85]);
		T70f41(((T35*)(C))->a22, l4, t1);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(4)))));
			((T35*)(C))->a85 = ((T4)((((T35*)(C))->a85)-((T4)(geint32(1)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(2)))));
			((T80*)(((T35*)(C))->a148))->a2[((T35*)(C))->a87] = (l4);
		}
		break;
	case (T4)(T4)(geint32(48)):
		t3 = (((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86]);
		t1 = (T35f180(C));
		l4 = (T35f181(C, t3, t1));
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(1)))));
			((T35*)(C))->a87 = ((T4)((((T35*)(C))->a87)+((T4)(geint32(1)))));
			((T35*)(C))->a86 = ((T4)((((T35*)(C))->a86)-((T4)(geint32(1)))));
			t2 = (T4f5(&(((T35*)(C))->a87), ((T35*)(C))->a147));
			if (t2) {
				t2 = ((((T35*)(C))->a148)==(EIF_VOID));
				if (t2) {
					((T35*)(C))->a149 = T81c3();
					((T35*)(C))->a147 = ((T4)(geint32(10)));
					((T35*)(C))->a148 = (T81f1(((T35*)(C))->a149, ((T35*)(C))->a147));
				} else {
					((T35*)(C))->a147 = ((T4)((((T35*)(C))->a147)+((T4)(geint32(10)))));
					((T35*)(C))->a148 = (T81f2(((T35*)(C))->a149, ((T35*)(C))->a148, ((T35*)(C))->a147));
				}
			}
			((T80*)(((T35*)(C))->a148))->a2[((T35*)(C))->a87] = (l4);
		}
		break;
	case (T4)(T4)(geint32(49)):
		t3 = (((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86]);
		t1 = (((T80*)(((T35*)(C))->a148))->a2[((T35*)(C))->a87]);
		l4 = (T35f181(C, t3, t1));
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(2)))));
			((T35*)(C))->a86 = ((T4)((((T35*)(C))->a86)-((T4)(geint32(1)))));
			((T80*)(((T35*)(C))->a148))->a2[((T35*)(C))->a87] = (l4);
		}
		break;
	case (T4)(T4)(geint32(50)):
		t3 = ((T4)((((T35*)(C))->a86)-((T4)(geint32(1)))));
		t3 = (((T71*)(((T35*)(C))->a144))->a2[t3]);
		t5 = (((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86]);
		t1 = (T35f180(C));
		l4 = (T35f182(C, t3, t5, t1));
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(3)))));
			((T35*)(C))->a87 = ((T4)((((T35*)(C))->a87)+((T4)(geint32(1)))));
			((T35*)(C))->a86 = ((T4)((((T35*)(C))->a86)-((T4)(geint32(2)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(1)))));
			t2 = (T4f5(&(((T35*)(C))->a87), ((T35*)(C))->a147));
			if (t2) {
				t2 = ((((T35*)(C))->a148)==(EIF_VOID));
				if (t2) {
					((T35*)(C))->a149 = T81c3();
					((T35*)(C))->a147 = ((T4)(geint32(10)));
					((T35*)(C))->a148 = (T81f1(((T35*)(C))->a149, ((T35*)(C))->a147));
				} else {
					((T35*)(C))->a147 = ((T4)((((T35*)(C))->a147)+((T4)(geint32(10)))));
					((T35*)(C))->a148 = (T81f2(((T35*)(C))->a149, ((T35*)(C))->a148, ((T35*)(C))->a147));
				}
			}
			((T80*)(((T35*)(C))->a148))->a2[((T35*)(C))->a87] = (l4);
		}
		break;
	case (T4)(T4)(geint32(51)):
		t3 = ((T4)((((T35*)(C))->a86)-((T4)(geint32(1)))));
		t3 = (((T71*)(((T35*)(C))->a144))->a2[t3]);
		t5 = (((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86]);
		t1 = (((T80*)(((T35*)(C))->a148))->a2[((T35*)(C))->a87]);
		l4 = (T35f182(C, t3, t5, t1));
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(4)))));
			((T35*)(C))->a86 = ((T4)((((T35*)(C))->a86)-((T4)(geint32(2)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)-((T4)(geint32(1)))));
			((T80*)(((T35*)(C))->a148))->a2[((T35*)(C))->a87] = (l4);
		}
		break;
	case (T4)(T4)(geint32(52)):
		l3 = (T35f164(C));
		T35f315(C);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(0)))));
			((T35*)(C))->a88 = ((T4)((((T35*)(C))->a88)+((T4)(geint32(1)))));
			t2 = (T4f5(&(((T35*)(C))->a88), ((T35*)(C))->a168));
			if (t2) {
				t2 = ((((T35*)(C))->a153)==(EIF_VOID));
				if (t2) {
					((T35*)(C))->a169 = T85c3();
					((T35*)(C))->a168 = ((T4)(geint32(10)));
					((T35*)(C))->a153 = (T85f1(((T35*)(C))->a169, ((T35*)(C))->a168));
				} else {
					((T35*)(C))->a168 = ((T4)((((T35*)(C))->a168)+((T4)(geint32(10)))));
					((T35*)(C))->a153 = (T85f2(((T35*)(C))->a169, ((T35*)(C))->a153, ((T35*)(C))->a168));
				}
			}
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(53)):
		t3 = (((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86]);
		t1 = (((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88]);
		l3 = (T35f183(C, t3, t1));
		t3 = (((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86]);
		T35f316(C, t3);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(2)))));
			((T35*)(C))->a86 = ((T4)((((T35*)(C))->a86)-((T4)(geint32(1)))));
			((T84*)(((T35*)(C))->a153))->a2[((T35*)(C))->a88] = (l3);
		}
		break;
	case (T4)(T4)(geint32(54)):
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(0)))));
			((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)+((T4)(geint32(1)))));
			t2 = (T4f5(&(((T35*)(C))->a84), ((T35*)(C))->a134));
			if (t2) {
				t2 = ((((T35*)(C))->a135)==(EIF_VOID));
				if (t2) {
					((T35*)(C))->a136 = T76c3();
					((T35*)(C))->a134 = ((T4)(geint32(10)));
					((T35*)(C))->a135 = (T76f1(((T35*)(C))->a136, ((T35*)(C))->a134));
				} else {
					((T35*)(C))->a134 = ((T4)((((T35*)(C))->a134)+((T4)(geint32(10)))));
					((T35*)(C))->a135 = (T76f2(((T35*)(C))->a136, ((T35*)(C))->a135, ((T35*)(C))->a134));
				}
			}
			((T75*)(((T35*)(C))->a135))->a2[((T35*)(C))->a84] = (l1);
		}
		break;
	case (T4)(T4)(geint32(55)):
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(1)))));
			((T75*)(((T35*)(C))->a135))->a2[((T35*)(C))->a84] = (l1);
		}
		break;
	case (T4)(T4)(geint32(56)):
		t1 = (((T77*)(((T35*)(C))->a140))->a2[((T35*)(C))->a85]);
		T22f50(((T35*)(C))->a16, t1);
		t2 = ((((T35*)(C))->a33)==((T4)(geint32(104))));
		if (t2) {
			((T35*)(C))->a46 = ((T4)((((T35*)(C))->a46)-((T4)(geint32(2)))));
			((T35*)(C))->a85 = ((T4)((((T35*)(C))->a85)-((T4)(geint32(1)))));
			((T75*)(((T35*)(C))->a135))->a2[((T35*)(C))->a84] = (l1);
		}
		break;
	default:
		T35f277(C);
		break;
	}
}

/* LX_DESCRIPTION.set_eiffel_code */
void T22f50(T0* C, T0* a1)
{
	((T22*)(C))->a26 = (a1);
}

/* LX_LEX_PARSER.process_singleton_string */
void T35f316(T0* C, T4 a1)
{
	T2 t1;
	((T35*)(C))->a170 = ((T4)((((T35*)(C))->a170)+((T4)(geint32(1)))));
	t1 = ((a1)==((T4)(geint32(10))));
	if (t1) {
		((T35*)(C))->a171 = ((T4)((((T35*)(C))->a171)+((T4)(geint32(1)))));
		((T35*)(C))->a172 = ((T4)(geint32(0)));
	} else {
		((T35*)(C))->a172 = ((T4)((((T35*)(C))->a172)+((T4)(geint32(1)))));
	}
}

/* LX_LEX_PARSER.append_character_to_string */
T0* T35f183(T0* C, T4 a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	t1 = (((T22*)(((T35*)(C))->a16))->a21);
	if (t1) {
		l4 = (((T22*)(((T35*)(C))->a16))->a24);
		switch (a1) {
		case (T4)65:
		case (T4)66:
		case (T4)67:
		case (T4)68:
		case (T4)69:
		case (T4)70:
		case (T4)71:
		case (T4)72:
		case (T4)73:
		case (T4)74:
		case (T4)75:
		case (T4)76:
		case (T4)77:
		case (T4)78:
		case (T4)79:
		case (T4)80:
		case (T4)81:
		case (T4)82:
		case (T4)83:
		case (T4)84:
		case (T4)85:
		case (T4)86:
		case (T4)87:
		case (T4)88:
		case (T4)89:
		case (T4)90:
			l2 = ((T4)((a1)+((T4)(geint32(32)))));
			l1 = (T4f13(&l2));
			t1 = (T70f1(((T35*)(C))->a22, l1));
			if (t1) {
				R = (a2);
				t2 = (T70f2(((T35*)(C))->a22, l1));
				t2 = (T35f178(C, t2));
				T82f11(R, t2);
			} else {
				l3 = T79c18((T4)(geint32(2)));
				T79f20(l3, a1);
				T79f20(l3, l2);
				t1 = ((l4)!=(EIF_VOID));
				if (t1) {
					T83f12(l4, l3);
				}
				T70f41(((T35*)(C))->a22, l3, l1);
				R = (a2);
				t2 = (T35f178(C, l3));
				T82f11(R, t2);
			}
			break;
		case (T4)97:
		case (T4)98:
		case (T4)99:
		case (T4)100:
		case (T4)101:
		case (T4)102:
		case (T4)103:
		case (T4)104:
		case (T4)105:
		case (T4)106:
		case (T4)107:
		case (T4)108:
		case (T4)109:
		case (T4)110:
		case (T4)111:
		case (T4)112:
		case (T4)113:
		case (T4)114:
		case (T4)115:
		case (T4)116:
		case (T4)117:
		case (T4)118:
		case (T4)119:
		case (T4)120:
		case (T4)121:
		case (T4)122:
			l1 = (T4f13(&a1));
			t1 = (T70f1(((T35*)(C))->a22, l1));
			if (t1) {
				R = (a2);
				t2 = (T70f2(((T35*)(C))->a22, l1));
				t2 = (T35f178(C, t2));
				T82f11(R, t2);
			} else {
				l3 = T79c18((T4)(geint32(2)));
				t3 = ((T4)((a1)-((T4)(geint32(32)))));
				T79f20(l3, t3);
				T79f20(l3, a1);
				t1 = ((l4)!=(EIF_VOID));
				if (t1) {
					T83f12(l4, l3);
				}
				T70f41(((T35*)(C))->a22, l3, l1);
				R = (a2);
				t2 = (T35f178(C, l3));
				T82f11(R, t2);
			}
			break;
		case (T4)(T4)(geint32(0)):
			R = (a2);
			t3 = (((T22*)(((T35*)(C))->a16))->a12);
			t2 = (T35f257(C, t3));
			T82f11(R, t2);
			break;
		default:
			R = (a2);
			t2 = (T35f257(C, a1));
			T82f11(R, t2);
			break;
		}
	} else {
		t1 = ((a1)==((T4)(geint32(0))));
		if (t1) {
			R = (a2);
			t3 = (((T22*)(((T35*)(C))->a16))->a12);
			t2 = (T35f257(C, t3));
			T82f11(R, t2);
		} else {
			R = (a2);
			t2 = (T35f257(C, a1));
			T82f11(R, t2);
		}
	}
	return R;
}

/* LX_LEX_PARSER.new_symbol_nfa */
T0* T35f257(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	l3 = (((T22*)(((T35*)(C))->a16))->a24);
	t1 = ((l3)!=(EIF_VOID));
	if (t1) {
		l1 = (T4f13(&a1));
		t1 = (T70f1(((T35*)(C))->a22, l1));
		if (t1) {
			t2 = (T70f2(((T35*)(C))->a22, l1));
			R = (T35f178(C, t2));
		} else {
			l2 = T79c18((T4)(geint32(1)));
			T79f20(l2, a1);
			T83f12(l3, l2);
			T70f41(((T35*)(C))->a22, l2, l1);
			R = (T35f178(C, l2));
		}
	} else {
		R = T82c20(a1, ((T35*)(C))->a151);
	}
	return R;
}

/* LX_NFA.make_symbol */
T0* T82c20(T4 a1, T2 a2)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* C;
	C = (T0*)gealloc(sizeof(T82));
	((T82*)(C))->id = 82;
	((T82*)(C))->a1 = (a2);
	((T82*)(C))->a2 = T122c23((T4)(geint32(100)));
	l2 = T121c12(a2);
	l3 = T121c12(a2);
	l1 = T183c6(a1, l3);
	T121f13(l2, l1);
	T122f25(((T82*)(C))->a2, l2);
	T122f24(((T82*)(C))->a2, l3);
	return C;
}

/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].make */
T0* T183c6(T4 a1, T0* a2)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T183));
	((T183*)(C))->id = 183;
	((T183*)(C))->a1 = (a1);
	((T183*)(C))->a2 = (a2);
	return C;
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].item */
T0* T70f2(T0* C, T0* a1)
{
	T0* R = 0;
	T70f42(C, a1);
	R = (T70f6(C, ((T70*)(C))->a4));
	return R;
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].items_item */
T0* T70f6(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T80*)(((T70*)(C))->a7))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].search_position */
void T70f42(T0* C, T0* a1)
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
		((T70*)(C))->a4 = (T70f18(C, ((T70*)(C))->a19));
		((T70*)(C))->a13 = (((T70*)(C))->a19);
		((T70*)(C))->a20 = ((T4)(geint32(0)));
	} else {
		l4 = (((T70*)(C))->a8);
		t1 = ((l4)!=(EIF_VOID));
		if (t1) {
			t1 = ((((T70*)(C))->a4)==((T4)(geint32(0))));
			if (!(t1)) {
				t2 = (T70f21(C, ((T70*)(C))->a4));
				t3 = (T69f1(l4, a1, t2));
				t1 = ((T2)(!(t3)));
			}
			if (!(t1)) {
				t1 = (T69f1(l4, a1, l3));
			}
			if (t1) {
				((T70*)(C))->a13 = (T70f12(C, a1));
				l1 = (T70f18(C, ((T70*)(C))->a13));
				((T70*)(C))->a4 = ((T4)(geint32(0)));
				l2 = ((T4)(geint32(0)));
				t1 = ((l1)==((T4)(geint32(0))));
				while (!(t1)) {
					t2 = (T70f21(C, l1));
					t1 = (T69f1(l4, a1, t2));
					if (t1) {
						((T70*)(C))->a4 = (l1);
						l1 = ((T4)(geint32(0)));
					} else {
						l2 = (l1);
						l1 = (T70f17(C, l1));
					}
					t1 = ((l1)==((T4)(geint32(0))));
				}
				((T70*)(C))->a20 = (l2);
			}
		} else {
			t1 = ((((T70*)(C))->a4)==((T4)(geint32(0))));
			if (!(t1)) {
				t2 = (T70f21(C, ((T70*)(C))->a4));
				t1 = ((a1)!=(t2));
			}
			if (!(t1)) {
				t1 = ((a1)==(l3));
			}
			if (t1) {
				((T70*)(C))->a13 = (T70f12(C, a1));
				l1 = (T70f18(C, ((T70*)(C))->a13));
				((T70*)(C))->a4 = ((T4)(geint32(0)));
				l2 = ((T4)(geint32(0)));
				t1 = ((l1)==((T4)(geint32(0))));
				while (!(t1)) {
					t2 = (T70f21(C, l1));
					t1 = ((a1)==(t2));
					if (t1) {
						((T70*)(C))->a4 = (l1);
						l1 = ((T4)(geint32(0)));
					} else {
						l2 = (l1);
						l1 = (T70f17(C, l1));
					}
					t1 = ((l1)==((T4)(geint32(0))));
				}
				((T70*)(C))->a20 = (l2);
			}
		}
	}
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].clashes_item */
T4 T70f17(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T71*)(((T70*)(C))->a26))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].hash_position */
T4 T70f12(T0* C, T0* a1)
{
	T4 R = 0;
	T2 t1;
	T4 t2;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T16f22(a1));
		R = ((T4)((t2)%(((T70*)(C))->a19)));
	} else {
		R = (((T70*)(C))->a19);
	}
	return R;
}

/* STRING.hash_code */
T4 T16f22(T0* C)
{
	T4 R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T4 t2;
	T1 t3;
	T4 t4;
	R = (((T16*)(C))->a4);
	t1 = ((R)==((T4)(geint32(0))));
	if (t1) {
		l1 = ((T4)(geint32(0)));
		l2 = (((T16*)(C))->a2);
		l3 = (((T16*)(C))->a1);
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t2 = ((T4)((R)%((T4)(geint32(8388593)))));
			t2 = (T4f20(&t2, (T4)(geint32(8))));
			t3 = (((T15*)(l3))->a2[l1]);
			t4 = ((T4)(t3));
			R = ((T4)((t2)+(t4)));
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = ((l1)==(l2));
		}
		((T16*)(C))->a4 = (R);
	}
	return R;
}

/* INTEGER.infix "|<<" */
T4 T4f20(T4* C, T4 a1)
{
	T4 R = 0;
	R = ((T4)((*C)<<(a1)));
	return R;
}

/* KL_STRING_EQUALITY_TESTER.test */
T2 T69f1(T0* C, T0* a1, T0* a2)
{
	T2 R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
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
				l2 = (((T16*)(a1))->a2);
				t2 = (((T16*)(a2))->a2);
				t1 = ((t2)==(l2));
				if (t1) {
					R = (EIF_TRUE);
					l1 = ((T4)(geint32(1)));
					t1 = (T4f1(&l1, l2));
					while (!(t1)) {
						t2 = (T16f16(a1, l1));
						t3 = (T16f16(a2, l1));
						t1 = ((t2)!=(t3));
						if (t1) {
							R = (EIF_FALSE);
							l1 = ((T4)((l2)+((T4)(geint32(1)))));
						} else {
							l1 = ((T4)((l1)+((T4)(geint32(1)))));
						}
						t1 = (T4f1(&l1, l2));
					}
				}
			}
		}
	}
	return R;
}

/* STRING.item_code */
T4 T16f16(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	T1 t2;
	t1 = ((T4)((a1)-((T4)(geint32(1)))));
	t2 = (((T15*)(((T16*)(C))->a1))->a2[t1]);
	R = ((T4)(t2));
	return R;
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].keys_item */
T0* T70f21(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T77*)(((T70*)(C))->a28))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].slots_item */
T4 T70f18(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T71*)(((T70*)(C))->a27))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].has */
T2 T70f1(T0* C, T0* a1)
{
	T2 R = 0;
	T70f42(C, a1);
	R = ((((T70*)(C))->a4)!=((T4)(geint32(0))));
	return R;
}

/* LX_LEX_PARSER.process_singleton_empty_string */
void T35f315(T0* C)
{
	((T35*)(C))->a170 = ((T4)(geint32(0)));
	((T35*)(C))->a171 = ((T4)(geint32(0)));
	((T35*)(C))->a172 = ((T4)(geint32(0)));
}

/* LX_LEX_PARSER.append_character_set_to_character_class */
T0* T35f182(T0* C, T4 a1, T4 a2, T0* a3)
{
	T0* R = 0;
	T4 l1 = 0;
	T2 t1;
	T4 t2;
	t1 = (T4f1(&a1, a2));
	if (t1) {
		T35f358(C);
	} else {
		t1 = (((T22*)(((T35*)(C))->a16))->a21);
		if (t1) {
			l1 = (a1);
			t1 = (T4f1(&l1, a2));
			while (!(t1)) {
				switch (l1) {
				case (T4)65:
				case (T4)66:
				case (T4)67:
				case (T4)68:
				case (T4)69:
				case (T4)70:
				case (T4)71:
				case (T4)72:
				case (T4)73:
				case (T4)74:
				case (T4)75:
				case (T4)76:
				case (T4)77:
				case (T4)78:
				case (T4)79:
				case (T4)80:
				case (T4)81:
				case (T4)82:
				case (T4)83:
				case (T4)84:
				case (T4)85:
				case (T4)86:
				case (T4)87:
				case (T4)88:
				case (T4)89:
				case (T4)90:
					T79f20(a3, l1);
					t2 = ((T4)((l1)+((T4)(geint32(32)))));
					T79f20(a3, t2);
					break;
				case (T4)97:
				case (T4)98:
				case (T4)99:
				case (T4)100:
				case (T4)101:
				case (T4)102:
				case (T4)103:
				case (T4)104:
				case (T4)105:
				case (T4)106:
				case (T4)107:
				case (T4)108:
				case (T4)109:
				case (T4)110:
				case (T4)111:
				case (T4)112:
				case (T4)113:
				case (T4)114:
				case (T4)115:
				case (T4)116:
				case (T4)117:
				case (T4)118:
				case (T4)119:
				case (T4)120:
				case (T4)121:
				case (T4)122:
					t2 = ((T4)((l1)-((T4)(geint32(32)))));
					T79f20(a3, t2);
					T79f20(a3, l1);
					break;
				case (T4)(T4)(geint32(0)):
					t2 = (((T22*)(((T35*)(C))->a16))->a12);
					T79f20(a3, t2);
					break;
				default:
					T79f20(a3, l1);
					break;
				}
				l1 = ((T4)((l1)+((T4)(geint32(1)))));
				t1 = (T4f1(&l1, a2));
			}
		} else {
			l1 = (a1);
			t1 = (T4f1(&l1, a2));
			while (!(t1)) {
				t1 = ((l1)==((T4)(geint32(0))));
				if (t1) {
					t2 = (((T22*)(((T35*)(C))->a16))->a12);
					T79f20(a3, t2);
				} else {
					T79f20(a3, l1);
				}
				l1 = ((T4)((l1)+((T4)(geint32(1)))));
				t1 = (T4f1(&l1, a2));
			}
		}
	}
	R = (a3);
	return R;
}

/* LX_LEX_PARSER.report_negative_range_in_character_class_error */
void T35f358(T0* C)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T162c7(t1, ((T35*)(C))->a24);
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.make */
T0* T162c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T162));
	((T162*)(C))->id = 162;
	((T162*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(2)));
	T119f8(((T162*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T162*)(C))->a5, t1, (T4)(geint32(2)));
	return C;
}

/* LX_LEX_PARSER.filename */
T0* T35f232(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T2 t1;
	T0* t2;
	if ((((T35*)(C))->a28)==EIF_VOID) {
		l1 = EIF_VOID;
	} else {
		switch ((((T35*)(C))->a28)->id) {
		case 66:
			l1 = ((T35*)(C))->a28;
			break;
		default:
			l1 = EIF_VOID;
		}
	}
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		t2 = (((T66*)(l1))->a9);
		R = ((((t2)->id==36)?((T36*)(t2))->a7:((T43*)(t2))->a4));
	} else {
		R = (gems("string", 6));
	}
	return R;
}

/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].resize */
T0* T81f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T80*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T80f2(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [LX_SYMBOL_CLASS].resized_area */
T0* T80f2(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T80c4(a1);
	l2 = (((T80*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T80*)(C))->a2[l1]);
		((T80*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* SPECIAL [LX_SYMBOL_CLASS].make */
T0* T80c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T80)+a1*sizeof(T0*));
	((T80*)(C))->a1 = a1;
	((T80*)(C))->id = 80;
	return C;
}

/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].make */
T0* T81f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T178c2(a1);
	R = (((T178*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [LX_SYMBOL_CLASS].make_area */
T0* T178c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T178));
	((T178*)(C))->id = 178;
	((T178*)(C))->a1 = T80c4(a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS].default_create */
T0* T81c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T81));
	((T81*)(C))->id = 81;
	return C;
}

/* LX_LEX_PARSER.append_character_to_character_class */
T0* T35f181(T0* C, T4 a1, T0* a2)
{
	T0* R = 0;
	T2 t1;
	T4 t2;
	t1 = (((T22*)(((T35*)(C))->a16))->a21);
	if (t1) {
		switch (a1) {
		case (T4)65:
		case (T4)66:
		case (T4)67:
		case (T4)68:
		case (T4)69:
		case (T4)70:
		case (T4)71:
		case (T4)72:
		case (T4)73:
		case (T4)74:
		case (T4)75:
		case (T4)76:
		case (T4)77:
		case (T4)78:
		case (T4)79:
		case (T4)80:
		case (T4)81:
		case (T4)82:
		case (T4)83:
		case (T4)84:
		case (T4)85:
		case (T4)86:
		case (T4)87:
		case (T4)88:
		case (T4)89:
		case (T4)90:
			T79f20(a2, a1);
			t2 = ((T4)((a1)+((T4)(geint32(32)))));
			T79f20(a2, t2);
			break;
		case (T4)97:
		case (T4)98:
		case (T4)99:
		case (T4)100:
		case (T4)101:
		case (T4)102:
		case (T4)103:
		case (T4)104:
		case (T4)105:
		case (T4)106:
		case (T4)107:
		case (T4)108:
		case (T4)109:
		case (T4)110:
		case (T4)111:
		case (T4)112:
		case (T4)113:
		case (T4)114:
		case (T4)115:
		case (T4)116:
		case (T4)117:
		case (T4)118:
		case (T4)119:
		case (T4)120:
		case (T4)121:
		case (T4)122:
			t2 = ((T4)((a1)-((T4)(geint32(32)))));
			T79f20(a2, t2);
			T79f20(a2, a1);
			break;
		case (T4)(T4)(geint32(0)):
			t2 = (((T22*)(((T35*)(C))->a16))->a12);
			T79f20(a2, t2);
			break;
		default:
			T79f20(a2, a1);
			break;
		}
	} else {
		t1 = ((a1)==((T4)(geint32(0))));
		if (t1) {
			t2 = (((T22*)(((T35*)(C))->a16))->a12);
			T79f20(a2, t2);
		} else {
			T79f20(a2, a1);
		}
	}
	R = (a2);
	return R;
}

/* LX_LEX_PARSER.new_character_class */
T0* T35f180(T0* C)
{
	T0* R = 0;
	T4 t1;
	t1 = (((T22*)(((T35*)(C))->a16))->a12);
	R = T79c18(t1);
	return R;
}

/* LX_SYMBOL_CLASS.set_negated */
void T79f19(T0* C, T2 a1)
{
	((T79*)(C))->a6 = (a1);
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].force */
void T70f41(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	T70f44(C);
	T70f42(C, a2);
	t1 = ((((T70*)(C))->a4)!=((T4)(geint32(0))));
	if (t1) {
		T70f45(C, a1, ((T70*)(C))->a4);
	} else {
		t1 = ((((T70*)(C))->a9)==(((T70*)(C))->a10));
		if (t1) {
			t2 = ((T4)((((T70*)(C))->a9)+((T4)(geint32(1)))));
			t2 = (T70f11(C, t2));
			T70f46(C, t2);
			l2 = (T70f12(C, a2));
		} else {
			l2 = (((T70*)(C))->a13);
		}
		l1 = (((T70*)(C))->a14);
		t1 = ((l1)==((T4)(geint32(0))));
		if (t1) {
			((T70*)(C))->a15 = ((T4)((((T70*)(C))->a15)+((T4)(geint32(1)))));
			l1 = (((T70*)(C))->a15);
		} else {
			t2 = (T4)(geint32(-1));
			t3 = (T70f17(C, l1));
			((T70*)(C))->a14 = ((T4)((t2)-(t3)));
		}
		t2 = (T70f18(C, l2));
		T70f47(C, t2, l1);
		T70f48(C, l1, l2);
		T70f45(C, a1, l1);
		T70f49(C, a2, l1);
		((T70*)(C))->a9 = ((T4)((((T70*)(C))->a9)+((T4)(geint32(1)))));
	}
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].keys_put */
void T70f49(T0* C, T0* a1, T4 a2)
{
	((T77*)(((T70*)(C))->a28))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].slots_put */
void T70f48(T0* C, T4 a1, T4 a2)
{
	((T71*)(((T70*)(C))->a27))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].clashes_put */
void T70f47(T0* C, T4 a1, T4 a2)
{
	((T71*)(((T70*)(C))->a26))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].resize */
void T70f46(T0* C, T4 a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	T70f44(C);
	l1 = (T70f24(C, a1));
	t1 = ((T4)((l1)+((T4)(geint32(1)))));
	T70f51(C, t1);
	l2 = (((T70*)(C))->a19);
	t2 = ((T2)((l2)<((T4)(geint32(0)))));
	while (!(t2)) {
		T70f48(C, (T4)(geint32(0)), l2);
		l2 = ((T4)((l2)-((T4)(geint32(1)))));
		t2 = ((T2)((l2)<((T4)(geint32(0)))));
	}
	((T70*)(C))->a19 = (l1);
	l2 = (((T70*)(C))->a15);
	t2 = ((T2)((l2)<((T4)(geint32(1)))));
	while (!(t2)) {
		t1 = (T70f17(C, l2));
		t2 = (T4f1(&t1, (T4)(geint32(-1))));
		if (t2) {
			t3 = (T70f21(C, l2));
			l3 = (T70f12(C, t3));
			t1 = (T70f18(C, l3));
			T70f47(C, t1, l2);
			T70f48(C, l2, l3);
		}
		l2 = ((T4)((l2)-((T4)(geint32(1)))));
		t2 = ((T2)((l2)<((T4)(geint32(1)))));
	}
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T70f52(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T70f53(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T70f54(C, t1);
	((T70*)(C))->a10 = (a1);
	((T70*)(C))->a4 = ((T4)(geint32(0)));
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].clashes_resize */
void T70f54(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T70f30(C));
	((T70*)(C))->a26 = (T72f2(t1, ((T70*)(C))->a26, a1));
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].special_integer_ */
T0* T70f30(T0* C)
{
	T0* R = 0;
	if (ge257os2367) {
		return ge257ov2367;
	} else {
		ge257os2367 = '\1';
	}
	R = T72c4();
	ge257ov2367 = R;
	return R;
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].keys_resize */
void T70f53(T0* C, T4 a1)
{
	((T70*)(C))->a28 = (T78f2(((T70*)(C))->a32, ((T70*)(C))->a28, a1));
}

/* KL_SPECIAL_ROUTINES [STRING].resize */
T0* T78f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T77*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T77f3(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [STRING].resized_area */
T0* T77f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T77c4(a1);
	l2 = (((T77*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T77*)(C))->a2[l1]);
		((T77*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].items_resize */
void T70f52(T0* C, T4 a1)
{
	((T70*)(C))->a7 = (T81f2(((T70*)(C))->a31, ((T70*)(C))->a7, a1));
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].slots_resize */
void T70f51(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T70f30(C));
	((T70*)(C))->a27 = (T72f2(t1, ((T70*)(C))->a27, a1));
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].new_modulus */
T4 T70f24(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].new_capacity */
T4 T70f11(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = (T4)(geint32(2));
	R = ((T4)((t1)*(a1)));
	return R;
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].items_put */
void T70f45(T0* C, T0* a1, T4 a2)
{
	((T80*)(((T70*)(C))->a7))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].unset_found_item */
void T70f44(T0* C)
{
	((T70*)(C))->a23 = ((T4)(geint32(0)));
}

/* LX_LEX_PARSER.new_nfa_from_character_class */
T0* T35f179(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T2 t1;
	t1 = (((T79*)(a1))->a10);
	if (t1) {
		T79f24(a1);
	}
	l1 = (((T22*)(((T35*)(C))->a16))->a24);
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		T83f12(l1, a1);
	}
	R = (T35f178(C, a1));
	return R;
}

/* LX_SYMBOL_CLASS.sort */
void T79f24(T0* C)
{
	T0* t1;
	t1 = (T79f17(C));
	T79f26(C, t1);
	((T79*)(C))->a10 = (EIF_FALSE);
}

/* LX_SYMBOL_CLASS.arrayed_sort */
void T79f26(T0* C, T0* a1)
{
	T227f3(a1, C);
}

/* DS_SHELL_SORTER [INTEGER].sort */
void T227f3(T0* C, T0* a1)
{
	T227f4(C, a1, ((T227*)(C))->a1);
}

/* DS_SHELL_SORTER [INTEGER].sort_with_comparator */
void T227f4(T0* C, T0* a1, T0* a2)
{
	T2 t1;
	T4 t2;
	t1 = (T79f8(a1));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = (((T79*)(a1))->a12);
		T227f5(C, a1, a2, (T4)(geint32(1)), t2);
	}
}

/* DS_SHELL_SORTER [INTEGER].subsort_with_comparator */
void T227f5(T0* C, T0* a1, T0* a2, T4 a3, T4 a4)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T2 t1;
	T4 t2;
	t1 = ((T2)((a3)<(a4)));
	if (t1) {
		t2 = ((T4)((a4)-(a3)));
		t2 = ((T4)((t2)+((T4)(geint32(1)))));
		l4 = ((T4)((t2)/((T4)(geint32(2)))));
		t1 = (T4f6(&l4, (T4)(geint32(0))));
		while (!(t1)) {
			l1 = ((T4)((a3)+(l4)));
			t1 = (T4f1(&l1, a4));
			while (!(t1)) {
				l2 = ((T4)((l1)-(l4)));
				t1 = ((T2)((l2)<(a3)));
				while (!(t1)) {
					l3 = ((T4)((l2)+(l4)));
					l5 = (T79f14(a1, l2));
					l6 = (T79f14(a1, l3));
					t1 = (T165f1(a2, l6, l5));
					if (t1) {
						T79f25(a1, l6, l2);
						T79f25(a1, l5, l3);
						l2 = ((T4)((l2)-(l4)));
					} else {
						l2 = ((T4)((a3)-((T4)(geint32(1)))));
					}
					t1 = ((T2)((l2)<(a3)));
				}
				l1 = ((T4)((l1)+((T4)(geint32(1)))));
				t1 = (T4f1(&l1, a4));
			}
			l4 = ((T4)((l4)/((T4)(geint32(2)))));
			t1 = (T4f6(&l4, (T4)(geint32(0))));
		}
	}
}

/* LX_SYMBOL_CLASS.replace */
void T79f25(T0* C, T4 a1, T4 a2)
{
	((T71*)(((T79*)(C))->a2))->a2[a2] = (a1);
}

/* LX_SYMBOL_CLASS.sorter */
unsigned char ge62os1871 = '\0';
T0* ge62ov1871;
T0* T79f17(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	if (ge62os1871) {
		return ge62ov1871;
	} else {
		ge62os1871 = '\1';
	}
	l1 = T165c2();
	R = T227c2(l1);
	ge62ov1871 = R;
	return R;
}

/* DS_SHELL_SORTER [INTEGER].make */
T0* T227c2(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T227));
	((T227*)(C))->id = 227;
	((T227*)(C))->a1 = (a1);
	return C;
}

/* LX_LEX_PARSER.process_singleton_symbol_class */
void T35f314(T0* C, T0* a1)
{
	T2 t1;
	T4 t2;
	((T35*)(C))->a170 = ((T4)(geint32(1)));
	t1 = (T79f7(a1, (T4)(geint32(10))));
	if (t1) {
		t1 = (((T79*)(a1))->a6);
		if (t1) {
			((T35*)(C))->a171 = ((T4)(geint32(0)));
			((T35*)(C))->a172 = ((T4)(geint32(1)));
		} else {
			t2 = (((T79*)(a1))->a12);
			t1 = ((t2)==((T4)(geint32(1))));
			if (t1) {
				((T35*)(C))->a171 = ((T4)(geint32(1)));
				((T35*)(C))->a172 = ((T4)(geint32(0)));
			} else {
				((T35*)(C))->a171 = ((T4)(geint32(-1)));
				((T35*)(C))->a172 = ((T4)(geint32(-1)));
			}
		}
	} else {
		t1 = (((T79*)(a1))->a6);
		if (t1) {
			((T35*)(C))->a171 = ((T4)(geint32(-1)));
			((T35*)(C))->a172 = ((T4)(geint32(-1)));
		} else {
			((T35*)(C))->a171 = ((T4)(geint32(0)));
			((T35*)(C))->a172 = ((T4)(geint32(1)));
		}
	}
}

/* LX_LEX_PARSER.process_singleton_dot */
void T35f313(T0* C)
{
	((T35*)(C))->a170 = ((T4)(geint32(1)));
	((T35*)(C))->a171 = ((T4)(geint32(0)));
	((T35*)(C))->a172 = ((T4)(geint32(1)));
}

/* LX_LEX_PARSER.new_symbol_class_nfa */
T0* T35f178(T0* C, T0* a1)
{
	T0* R = 0;
	R = T82c18(a1, ((T35*)(C))->a151);
	return R;
}

/* LX_NFA.make_symbol_class */
T0* T82c18(T0* a1, T2 a2)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* C;
	C = (T0*)gealloc(sizeof(T82));
	((T82*)(C))->id = 82;
	((T82*)(C))->a1 = (a2);
	((T82*)(C))->a2 = T122c23((T4)(geint32(100)));
	l2 = T121c12(a2);
	l3 = T121c12(a2);
	l1 = T182c6(a1, l3);
	T121f13(l2, l1);
	T122f25(((T82*)(C))->a2, l2);
	T122f24(((T82*)(C))->a2, l3);
	return C;
}

/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].make */
T0* T182c6(T0* a1, T0* a2)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T182));
	((T182*)(C))->id = 182;
	((T182*)(C))->a1 = (a1);
	((T182*)(C))->a2 = (a2);
	return C;
}

/* LX_LEX_PARSER.dot_character_class */
T0* T35f177(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	l1 = (gems(".", 1));
	t1 = (T70f1(((T35*)(C))->a22, l1));
	if (t1) {
		R = (T70f2(((T35*)(C))->a22, l1));
	} else {
		R = T79c18((T4)(geint32(1)));
		T79f20(R, (T4)(geint32(10)));
		T79f19(R, EIF_TRUE);
		l2 = (((T22*)(((T35*)(C))->a16))->a24);
		t1 = ((l2)!=(EIF_VOID));
		if (t1) {
			T83f12(l2, R);
		}
		T70f41(((T35*)(C))->a22, R, l1);
	}
	return R;
}

/* LX_LEX_PARSER.process_singleton_fixed_iteration */
void T35f312(T0* C, T4 a1)
{
	T2 t1;
	t1 = (T4f5(&(((T35*)(C))->a170), (T4)(geint32(0))));
	if (t1) {
		((T35*)(C))->a170 = ((T4)((((T35*)(C))->a170)*(a1)));
	}
	t1 = ((((T35*)(C))->a171)==((T4)(geint32(0))));
	if (t1) {
		t1 = (T4f5(&(((T35*)(C))->a172), (T4)(geint32(0))));
		if (t1) {
			((T35*)(C))->a172 = ((T4)((((T35*)(C))->a172)*(a1)));
		}
	} else {
		t1 = (T4f1(&(((T35*)(C))->a171), (T4)(geint32(0))));
		if (t1) {
			((T35*)(C))->a171 = ((T4)((((T35*)(C))->a171)*(a1)));
		} else {
			t1 = ((((T35*)(C))->a171)==((T4)(geint32(-1))));
			if (t1) {
				t1 = ((((T35*)(C))->a172)!=((T4)(geint32(0))));
				if (t1) {
					((T35*)(C))->a172 = ((T4)(geint32(-1)));
				}
			}
		}
	}
}

/* LX_LEX_PARSER.new_iteration_nfa */
T0* T35f176(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T2 t1;
	t1 = (T4f6(&a2, (T4)(geint32(0))));
	if (t1) {
		T35f357(C);
		R = (T35f164(C));
	} else {
		R = (a1);
		T82f17(R, a2);
	}
	return R;
}

/* LX_NFA.build_iteration */
void T82f17(T0* C, T4 a1)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	t1 = ((a1)!=((T4)(geint32(1))));
	if (t1) {
		l2 = (T82f6(C));
		l1 = ((T4)(geint32(2)));
		t1 = (T4f5(&l1, a1));
		while (!(t1)) {
			t2 = (T82f6(C));
			T82f11(l2, t2);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f5(&l1, a1));
		}
		T82f11(C, l2);
	}
}

/* LX_NFA.cloned_object */
T0* T82f6(T0* C)
{
	T0* R = 0;
	R = (T82f7(C));
	return R;
}

/* LX_NFA.twin */
T0* T82f7(T0* C)
{
	T0* R = 0;
	R = (T0*)gealloc(sizeof(T82));
	((T82*)(R))->id = 82;
	T82f21(R, C);
	return R;
}

/* LX_NFA.copy */
void T82f21(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	*(T82*)(C) = *(T82*)(a1);
	l1 = (((T82*)(C))->a2);
	t1 = (((T122*)(l1))->a9);
	((T82*)(C))->a2 = T122c23(t1);
	l5 = (((T122*)(l1))->a1);
	l4 = ((T4)(geint32(1)));
	t2 = (T4f1(&l4, l5));
	while (!(t2)) {
		l3 = (T122f2(l1, l4));
		T121f15(l3, l4);
		t3 = (T121f8(l3));
		T122f24(((T82*)(C))->a2, t3);
		l4 = ((T4)((l4)+((T4)(geint32(1)))));
		t2 = (T4f1(&l4, l5));
	}
	l4 = ((T4)(geint32(1)));
	t2 = (T4f1(&l4, l5));
	while (!(t2)) {
		l2 = (T122f2(((T82*)(C))->a2, l4));
		l6 = (((T121*)(l2))->a2);
		t2 = ((l6)!=(EIF_VOID));
		if (t2) {
			l6 = (T180x1453(l6));
			l3 = (T180x6315(l6));
			t1 = (((T121*)(l3))->a4);
			t3 = (T122f2(((T82*)(C))->a2, t1));
			T180x6316(l6, t3);
			T121f13(l2, l6);
		}
		l7 = (((T121*)(l2))->a3);
		t2 = ((l7)!=(EIF_VOID));
		if (t2) {
			l7 = (T179f2(l7));
			l3 = (((T179*)(l7))->a1);
			t1 = (((T121*)(l3))->a4);
			t3 = (T122f2(((T82*)(C))->a2, t1));
			T179f6(l7, t3);
			T121f14(l2, l7);
		}
		l4 = ((T4)((l4)+((T4)(geint32(1)))));
		t2 = (T4f1(&l4, l5));
	}
}

/* LX_NFA_STATE.set_epsilon_transition */
void T121f14(T0* C, T0* a1)
{
	((T121*)(C))->a3 = (a1);
}

/* LX_NFA_STATE.cloned_object */
T0* T121f8(T0* C)
{
	T0* R = 0;
	R = (T121f11(C));
	return R;
}

/* LX_NFA_STATE.twin */
T0* T121f11(T0* C)
{
	T0* R = 0;
	R = (T0*)gealloc(sizeof(T121));
	((T121*)(R))->id = 121;
	T121f18(R, C);
	return R;
}

/* LX_NFA_STATE.copy */
void T121f18(T0* C, T0* a1)
{
	*(T121*)(C) = *(T121*)(a1);
}

/* LX_LEX_PARSER.report_iteration_not_positive_error */
void T35f357(T0* C)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T161c7(t1, ((T35*)(C))->a24);
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_ITERATION_NOT_POSITIVE_ERROR.make */
T0* T161c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T161));
	((T161*)(C))->id = 161;
	((T161*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(2)));
	T119f8(((T161*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T161*)(C))->a5, t1, (T4)(geint32(2)));
	return C;
}

/* LX_LEX_PARSER.process_singleton_unbounded_iteration */
void T35f311(T0* C, T4 a1)
{
	T2 t1;
	t1 = ((a1)==((T4)(geint32(0))));
	if (t1) {
		T35f307(C);
	} else {
		T35f308(C);
	}
}

/* LX_LEX_PARSER.new_unbounded_iteration_nfa */
T0* T35f175(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T2 t1;
	t1 = (T4f6(&a2, (T4)(geint32(0))));
	if (t1) {
		T35f357(C);
		R = (T35f164(C));
	} else {
		R = (a1);
		T82f16(R, a2);
	}
	return R;
}

/* LX_NFA.build_unbounded_iteration */
void T82f16(T0* C, T4 a1)
{
	T0* l1 = 0;
	l1 = (T82f6(C));
	T82f12(l1);
	T82f17(C, a1);
	T82f11(C, l1);
}

/* LX_LEX_PARSER.process_singleton_bounded_iteration */
void T35f310(T0* C, T4 a1, T4 a2)
{
	T2 t1;
	t1 = ((a1)==(a2));
	if (t1) {
		T35f312(C, a1);
	} else {
		t1 = ((a1)==((T4)(geint32(0))));
		if (t1) {
			T35f307(C);
		} else {
			T35f308(C);
		}
	}
}

/* LX_LEX_PARSER.new_bounded_iteration_nfa */
T0* T35f174(T0* C, T0* a1, T4 a2, T4 a3)
{
	T0* R = 0;
	T2 t1;
	t1 = ((T2)((a2)<((T4)(geint32(0)))));
	if (!(t1)) {
		t1 = (T4f1(&a2, a3));
	}
	if (t1) {
		T35f356(C);
		R = (T35f164(C));
	} else {
		t1 = ((a2)==((T4)(geint32(0))));
		if (t1) {
			t1 = (T4f6(&a3, (T4)(geint32(0))));
			if (t1) {
				T35f356(C);
				R = (T35f164(C));
			} else {
				R = (a1);
				T82f15(R, (T4)(geint32(1)), a3);
				T82f14(R);
			}
		} else {
			R = (a1);
			T82f15(R, a2, a3);
		}
	}
	return R;
}

/* LX_NFA.build_bounded_iteration */
void T82f15(T0* C, T4 a1, T4 a2)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T2 t1;
	t1 = ((a1)==(a2));
	if (t1) {
		T82f17(C, a1);
	} else {
		l2 = (T82f6(C));
		T82f14(l2);
		l1 = ((T4)((a1)+((T4)(geint32(1)))));
		t1 = (T4f5(&l1, a2));
		while (!(t1)) {
			l3 = (T82f6(C));
			T82f11(l3, l2);
			T82f14(l3);
			l2 = (l3);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f5(&l1, a2));
		}
		T82f17(C, a1);
		T82f11(C, l2);
	}
}

/* LX_LEX_PARSER.report_bad_iteration_values_error */
void T35f356(T0* C)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T160c7(t1, ((T35*)(C))->a24);
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_BAD_ITERATION_VALUES_ERROR.make */
T0* T160c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T160));
	((T160*)(C))->id = 160;
	((T160*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(2)));
	T119f8(((T160*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T160*)(C))->a5, t1, (T4)(geint32(2)));
	return C;
}

/* LX_LEX_PARSER.process_singleton_optional */
void T35f309(T0* C)
{
	T2 t1;
	((T35*)(C))->a170 = ((T4)(geint32(-1)));
	t1 = ((((T35*)(C))->a171)!=((T4)(geint32(0))));
	if (t1) {
		((T35*)(C))->a171 = ((T4)(geint32(-1)));
	}
	t1 = ((((T35*)(C))->a172)!=((T4)(geint32(0))));
	if (t1) {
		((T35*)(C))->a172 = ((T4)(geint32(-1)));
	}
}

/* LX_NFA.build_optional */
void T82f14(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	t1 = (T82f4(C));
	t1 = (((T121*)(t1))->a3);
	t2 = ((t1)==(EIF_VOID));
	if (t2) {
		t1 = (T82f5(C));
		l1 = T179c5(t1);
		t1 = (T82f4(C));
		T121f14(t1, l1);
	} else {
		l2 = (T82f4(C));
		l3 = (T82f5(C));
		l4 = T121c12(((T82*)(C))->a1);
		l1 = T179c5(l2);
		T121f13(l4, l1);
		l1 = T179c5(l3);
		T121f14(l4, l1);
		T122f26(((T82*)(C))->a2, l4, (T4)(geint32(1)));
		t3 = (((T122*)(((T82*)(C))->a2))->a1);
		T122f26(((T82*)(C))->a2, l2, t3);
		T122f27(((T82*)(C))->a2, l3);
	}
}

/* LX_NFA.final_state */
T0* T82f5(T0* C)
{
	T0* R = 0;
	R = (T122f5(((T82*)(C))->a2));
	return R;
}

/* LX_LEX_PARSER.process_singleton_plus */
void T35f308(T0* C)
{
	T2 t1;
	((T35*)(C))->a170 = ((T4)(geint32(-1)));
	t1 = ((((T35*)(C))->a171)==((T4)(geint32(0))));
	if (t1) {
		t1 = ((((T35*)(C))->a172)!=((T4)(geint32(0))));
		if (t1) {
			((T35*)(C))->a172 = ((T4)(geint32(-1)));
		}
	} else {
		t1 = (T4f1(&(((T35*)(C))->a171), (T4)(geint32(0))));
		if (t1) {
			((T35*)(C))->a171 = ((T4)(geint32(-2)));
		} else {
			t1 = ((((T35*)(C))->a171)==((T4)(geint32(-1))));
			if (t1) {
				t1 = ((((T35*)(C))->a172)!=((T4)(geint32(0))));
				if (t1) {
					((T35*)(C))->a172 = ((T4)(geint32(-1)));
				}
			}
		}
	}
}

/* LX_NFA.build_positive_closure */
void T82f13(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	l2 = (T82f4(C));
	l3 = (T82f5(C));
	l1 = T179c5(l2);
	T121f13(l3, l1);
	l4 = T121c12(((T82*)(C))->a1);
	l1 = T179c5(l2);
	T121f13(l4, l1);
	T122f26(((T82*)(C))->a2, l4, (T4)(geint32(1)));
	l4 = T121c12(((T82*)(C))->a1);
	l1 = T179c5(l4);
	T121f14(l3, l1);
	T122f27(((T82*)(C))->a2, l2);
	T122f27(((T82*)(C))->a2, l4);
}

/* LX_LEX_PARSER.process_singleton_star */
void T35f307(T0* C)
{
	T2 t1;
	((T35*)(C))->a170 = ((T4)(geint32(-1)));
	t1 = ((((T35*)(C))->a171)!=((T4)(geint32(0))));
	if (t1) {
		((T35*)(C))->a171 = ((T4)(geint32(-1)));
	}
	t1 = ((((T35*)(C))->a172)!=((T4)(geint32(0))));
	if (t1) {
		((T35*)(C))->a172 = ((T4)(geint32(-1)));
	}
}

/* LX_NFA.build_closure */
void T82f12(T0* C)
{
	T82f13(C);
	T82f14(C);
}

/* LX_LEX_PARSER.process_singleton_char */
void T35f306(T0* C, T4 a1)
{
	T2 t1;
	((T35*)(C))->a170 = ((T4)(geint32(1)));
	t1 = ((a1)==((T4)(geint32(10))));
	if (t1) {
		((T35*)(C))->a171 = ((T4)(geint32(1)));
		((T35*)(C))->a172 = ((T4)(geint32(0)));
	} else {
		((T35*)(C))->a171 = ((T4)(geint32(0)));
		((T35*)(C))->a172 = ((T4)(geint32(1)));
	}
}

/* LX_LEX_PARSER.new_nfa_from_character */
T0* T35f173(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	t1 = (((T22*)(((T35*)(C))->a16))->a21);
	if (t1) {
		l4 = (((T22*)(((T35*)(C))->a16))->a24);
		switch (a1) {
		case (T4)65:
		case (T4)66:
		case (T4)67:
		case (T4)68:
		case (T4)69:
		case (T4)70:
		case (T4)71:
		case (T4)72:
		case (T4)73:
		case (T4)74:
		case (T4)75:
		case (T4)76:
		case (T4)77:
		case (T4)78:
		case (T4)79:
		case (T4)80:
		case (T4)81:
		case (T4)82:
		case (T4)83:
		case (T4)84:
		case (T4)85:
		case (T4)86:
		case (T4)87:
		case (T4)88:
		case (T4)89:
		case (T4)90:
			l1 = ((T4)((a1)+((T4)(geint32(32)))));
			l2 = (T4f13(&l1));
			t1 = (T70f1(((T35*)(C))->a22, l2));
			if (t1) {
				t2 = (T70f2(((T35*)(C))->a22, l2));
				R = (T35f178(C, t2));
			} else {
				l3 = T79c18((T4)(geint32(2)));
				T79f20(l3, a1);
				T79f20(l3, l1);
				t1 = ((l4)!=(EIF_VOID));
				if (t1) {
					T83f12(l4, l3);
				}
				T70f41(((T35*)(C))->a22, l3, l2);
				R = (T35f178(C, l3));
			}
			break;
		case (T4)97:
		case (T4)98:
		case (T4)99:
		case (T4)100:
		case (T4)101:
		case (T4)102:
		case (T4)103:
		case (T4)104:
		case (T4)105:
		case (T4)106:
		case (T4)107:
		case (T4)108:
		case (T4)109:
		case (T4)110:
		case (T4)111:
		case (T4)112:
		case (T4)113:
		case (T4)114:
		case (T4)115:
		case (T4)116:
		case (T4)117:
		case (T4)118:
		case (T4)119:
		case (T4)120:
		case (T4)121:
		case (T4)122:
			l2 = (T4f13(&a1));
			t1 = (T70f1(((T35*)(C))->a22, l2));
			if (t1) {
				t2 = (T70f2(((T35*)(C))->a22, l2));
				R = (T35f178(C, t2));
			} else {
				l3 = T79c18((T4)(geint32(2)));
				t3 = ((T4)((a1)-((T4)(geint32(32)))));
				T79f20(l3, t3);
				T79f20(l3, a1);
				t1 = ((l4)!=(EIF_VOID));
				if (t1) {
					T83f12(l4, l3);
				}
				T70f41(((T35*)(C))->a22, l3, l2);
				R = (T35f178(C, l3));
			}
			break;
		case (T4)(T4)(geint32(0)):
			t3 = (((T22*)(((T35*)(C))->a16))->a12);
			R = (T35f257(C, t3));
			break;
		default:
			R = (T35f257(C, a1));
			break;
		}
	} else {
		t1 = ((a1)==((T4)(geint32(0))));
		if (t1) {
			t3 = (((T22*)(((T35*)(C))->a16))->a12);
			R = (T35f257(C, t3));
		} else {
			R = (T35f257(C, a1));
		}
	}
	return R;
}

/* LX_LEX_PARSER.process_singleton_series */
void T35f305(T0* C)
{
	T2 t1;
	t1 = (T4f5(&(((T35*)(C))->a165), (T4)(geint32(0))));
	if (t1) {
		t1 = (T4f5(&(((T35*)(C))->a170), (T4)(geint32(0))));
	}
	if (t1) {
		((T35*)(C))->a165 = ((T4)((((T35*)(C))->a165)+(((T35*)(C))->a170)));
	} else {
		((T35*)(C))->a165 = ((T4)(geint32(-1)));
	}
	t1 = ((((T35*)(C))->a166)==((T4)(geint32(0))));
	if (t1) {
		((T35*)(C))->a166 = (((T35*)(C))->a171);
		t1 = (T4f5(&(((T35*)(C))->a167), (T4)(geint32(0))));
		if (t1) {
			t1 = (T4f5(&(((T35*)(C))->a172), (T4)(geint32(0))));
		}
		if (t1) {
			((T35*)(C))->a167 = ((T4)((((T35*)(C))->a167)+(((T35*)(C))->a172)));
		} else {
			((T35*)(C))->a167 = ((T4)(geint32(-1)));
		}
	} else {
		t1 = (T4f1(&(((T35*)(C))->a166), (T4)(geint32(0))));
		if (t1) {
			t1 = (T4f5(&(((T35*)(C))->a171), (T4)(geint32(0))));
			if (t1) {
				((T35*)(C))->a166 = ((T4)((((T35*)(C))->a166)+(((T35*)(C))->a171)));
			} else {
				((T35*)(C))->a166 = ((T4)(geint32(-2)));
			}
		} else {
			t1 = ((((T35*)(C))->a166)!=((T4)(geint32(-2))));
			if (t1) {
				t1 = (T4f1(&(((T35*)(C))->a171), (T4)(geint32(0))));
				if (!(t1)) {
					t1 = ((((T35*)(C))->a171)==((T4)(geint32(-2))));
				}
				if (t1) {
					((T35*)(C))->a166 = ((T4)(geint32(-2)));
				} else {
					((T35*)(C))->a166 = ((T4)(geint32(-1)));
				}
				t1 = ((((T35*)(C))->a172)!=((T4)(geint32(0))));
				if (t1) {
					((T35*)(C))->a167 = ((T4)(geint32(-1)));
				}
			}
		}
	}
}

/* LX_NFA.build_concatenation */
void T82f11(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T82f4(a1));
	l1 = T179c5(t1);
	t1 = (T82f5(C));
	T121f13(t1, l1);
	t1 = (((T82*)(a1))->a2);
	T122f28(((T82*)(C))->a2, t1);
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].append_last */
void T122f28(T0* C, T0* a1)
{
	T4 l1 = 0;
	T2 t1;
	T4 t2;
	l1 = (((T122*)(a1))->a1);
	t1 = (T122f12(C, l1));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = ((T4)((((T122*)(C))->a1)+(l1)));
		t2 = (T122f13(C, t2));
		T122f31(C, t2);
	}
	T122f32(C, a1);
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].extend_last */
void T122f32(T0* C, T0* a1)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l1 = ((T4)((((T122*)(C))->a1)+((T4)(geint32(1)))));
	l2 = (T122f11(a1));
	T192f9(l2);
	t1 = (T192f3(l2));
	while (!(t1)) {
		t2 = (T192f4(l2));
		((T190*)(((T122*)(C))->a6))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		T192f10(l2);
		t1 = (T192f3(l2));
	}
	t3 = (((T122*)(a1))->a1);
	((T122*)(C))->a1 = ((T4)((((T122*)(C))->a1)+(t3)));
}

/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].forth */
void T192f10(T0* C)
{
	T122f36(((T192*)(C))->a5, C);
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_forth */
void T122f36(T0* C, T0* a1)
{
	T2 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	l2 = (((T192*)(a1))->a1);
	l1 = ((l2)==((T4)(geint32(0))));
	l2 = ((T4)((l2)+((T4)(geint32(1)))));
	t1 = (T4f1(&l2, ((T122*)(C))->a1));
	if (t1) {
		l2 = ((T4)(geint32(-1)));
		t1 = ((T2)(!(l1)));
		if (t1) {
			T122f38(C, a1);
		}
	} else {
		if (l1) {
			T122f37(C, a1);
		}
	}
	T192f8(a1, l2);
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].add_traversing_cursor */
void T122f37(T0* C, T0* a1)
{
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T122*)(C))->a10));
	if (t1) {
		t2 = (((T192*)(((T122*)(C))->a10))->a2);
		T192f11(a1, t2);
		T192f11(((T122*)(C))->a10, a1);
	}
}

/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].set_next_cursor */
void T192f11(T0* C, T0* a1)
{
	((T192*)(C))->a2 = (a1);
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].remove_traversing_cursor */
void T122f38(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T122*)(C))->a10));
	if (t1) {
		l2 = (((T122*)(C))->a10);
		l1 = (((T192*)(l2))->a2);
		t1 = ((l1)==(a1));
		if (!(t1)) {
			t1 = ((l1)==(EIF_VOID));
		}
		while (!(t1)) {
			l2 = (l1);
			l1 = (((T192*)(l1))->a2);
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T192*)(a1))->a2);
			T192f11(l2, t2);
			T192f11(a1, EIF_VOID);
		}
	}
}

/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].item */
T0* T192f4(T0* C)
{
	T0* R = 0;
	R = (T122f16(((T192*)(C))->a5, C));
	return R;
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_item */
T0* T122f16(T0* C, T0* a1)
{
	T0* R = 0;
	T4 t1;
	t1 = (((T192*)(a1))->a1);
	R = (T122f2(C, t1));
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].after */
T2 T192f3(T0* C)
{
	T2 R = 0;
	R = (T122f15(((T192*)(C))->a5, C));
	return R;
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_after */
T2 T122f15(T0* C, T0* a1)
{
	T2 R = 0;
	T4 t1;
	t1 = (((T192*)(a1))->a1);
	R = ((t1)==((T4)(geint32(-1))));
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].start */
void T192f9(T0* C)
{
	T122f35(((T192*)(C))->a5, C);
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_start */
void T122f35(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 t1;
	l1 = (T192f6(a1));
	t1 = (T122f4(C));
	if (t1) {
		T192f8(a1, (T4)(geint32(-1)));
	} else {
		T192f8(a1, (T4)(geint32(1)));
		if (l1) {
			T122f37(C, a1);
		}
	}
}

/* DS_ARRAYED_LIST_CURSOR [LX_NFA_STATE].off */
T2 T192f6(T0* C)
{
	T2 R = 0;
	R = (T122f18(((T192*)(C))->a5, C));
	return R;
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_off */
T2 T122f18(T0* C, T0* a1)
{
	T2 R = 0;
	T2 t1;
	t1 = (T122f15(C, a1));
	if (!(t1)) {
		R = (T122f20(C, a1));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* DS_ARRAYED_LIST [LX_NFA_STATE].cursor_before */
T2 T122f20(T0* C, T0* a1)
{
	T2 R = 0;
	T4 t1;
	t1 = (((T192*)(a1))->a1);
	R = ((t1)==((T4)(geint32(0))));
	return R;
}

/* DS_ARRAYED_STACK [INTEGER].force */
void T65f10(T0* C, T4 a1)
{
	T2 t1;
	T4 t2;
	t1 = (T65f6(C, (T4)(geint32(1))));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = ((T4)((((T65*)(C))->a3)+((T4)(geint32(1)))));
		t2 = (T65f7(C, t2));
		T65f11(C, t2);
	}
	((T65*)(C))->a3 = ((T4)((((T65*)(C))->a3)+((T4)(geint32(1)))));
	((T71*)(((T65*)(C))->a2))->a2[((T65*)(C))->a3] = (a1);
}

/* DS_ARRAYED_STACK [INTEGER].resize */
void T65f11(T0* C, T4 a1)
{
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T65*)(C))->a2 = (T72f2(((T65*)(C))->a4, ((T65*)(C))->a2, t1));
	((T65*)(C))->a5 = (a1);
}

/* DS_ARRAYED_STACK [INTEGER].new_capacity */
T4 T65f7(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* DS_ARRAYED_STACK [INTEGER].extendible */
T2 T65f6(T0* C, T4 a1)
{
	T2 R = 0;
	T4 t1;
	t1 = ((T4)((((T65*)(C))->a3)+(a1)));
	R = (T4f5(&(((T65*)(C))->a5), t1));
	return R;
}

/* LX_LEX_PARSER.process_regexp_or_series */
void T35f304(T0* C)
{
	T2 t1;
	T2 t2;
	t1 = ((((T35*)(C))->a156)!=(((T35*)(C))->a165));
	if (t1) {
		((T35*)(C))->a156 = ((T4)(geint32(-1)));
	}
	t1 = ((((T35*)(C))->a160)!=(((T35*)(C))->a166));
	if (t1) {
		t1 = ((((T35*)(C))->a160)==((T4)(geint32(-2))));
		if (!(t1)) {
			t1 = (T4f1(&(((T35*)(C))->a160), (T4)(geint32(0))));
		}
		if (t1) {
			t2 = ((((T35*)(C))->a166)==((T4)(geint32(-2))));
			if (!(t2)) {
				t1 = (T4f1(&(((T35*)(C))->a166), (T4)(geint32(0))));
			} else {
				t1 = EIF_TRUE;
			}
		}
		if (t1) {
			((T35*)(C))->a160 = ((T4)(geint32(-2)));
		} else {
			((T35*)(C))->a160 = ((T4)(geint32(-1)));
		}
	}
	t1 = ((((T35*)(C))->a162)!=(((T35*)(C))->a167));
	if (t1) {
		((T35*)(C))->a162 = ((T4)(geint32(-1)));
	}
}

/* LX_NFA.build_union */
void T82f10(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T0* t4;
	l2 = (T82f4(C));
	l3 = (T82f4(a1));
	t1 = (((T121*)(l2))->a3);
	t2 = ((t1)==(EIF_VOID));
	if (t2) {
		l1 = T179c5(l3);
		T121f14(l2, l1);
	} else {
		t1 = (((T121*)(l3))->a3);
		t2 = ((t1)==(EIF_VOID));
		if (t2) {
			l1 = T179c5(l2);
			T121f14(l3, l1);
			T122f26(((T82*)(C))->a2, l3, (T4)(geint32(1)));
			t1 = (((T82*)(a1))->a2);
			T122f26(t1, l2, (T4)(geint32(1)));
		} else {
			l4 = T121c12(((T82*)(C))->a1);
			l1 = T179c5(l2);
			T121f13(l4, l1);
			l1 = T179c5(l3);
			T121f14(l4, l1);
			T122f26(((T82*)(C))->a2, l4, (T4)(geint32(1)));
			l4 = (T82f5(C));
			t3 = (((T122*)(((T82*)(C))->a2))->a1);
			T122f26(((T82*)(C))->a2, l2, t3);
			T122f27(((T82*)(C))->a2, l4);
		}
	}
	l2 = (T82f5(C));
	l3 = (T82f5(a1));
	t2 = (T121f5(l3));
	t2 = ((T2)(!(t2)));
	if (t2) {
		l1 = T179c5(l3);
		T121f13(l2, l1);
		t1 = (((T82*)(a1))->a2);
		T122f28(((T82*)(C))->a2, t1);
	} else {
		t2 = (T121f5(l2));
		t2 = ((T2)(!(t2)));
		if (t2) {
			l1 = T179c5(l2);
			T121f13(l3, l1);
			t3 = (((T122*)(((T82*)(C))->a2))->a1);
			T122f26(((T82*)(C))->a2, l3, t3);
			t1 = (((T82*)(a1))->a2);
			t4 = (((T82*)(a1))->a2);
			t3 = (((T122*)(t4))->a1);
			T122f26(t1, l2, t3);
			t1 = (((T82*)(a1))->a2);
			T122f28(((T82*)(C))->a2, t1);
		} else {
			l4 = T121c12(((T82*)(C))->a1);
			l1 = T179c5(l4);
			T121f13(l2, l1);
			l1 = T179c5(l4);
			T121f13(l3, l1);
			t1 = (((T82*)(a1))->a2);
			T122f28(((T82*)(C))->a2, t1);
			T122f27(((T82*)(C))->a2, l4);
		}
	}
}

/* DS_ARRAYED_STACK [INTEGER].remove */
void T65f9(T0* C)
{
	T4 l1 = 0;
	((T71*)(((T65*)(C))->a2))->a2[((T65*)(C))->a3] = (l1);
	((T65*)(C))->a3 = ((T4)((((T65*)(C))->a3)-((T4)(geint32(1)))));
}

/* DS_ARRAYED_STACK [INTEGER].item */
T4 T65f1(T0* C)
{
	T4 R = 0;
	R = (((T71*)(((T65*)(C))->a2))->a2[((T65*)(C))->a3]);
	return R;
}

/* LX_LEX_PARSER.new_epsilon_nfa */
T0* T35f164(T0* C)
{
	T0* R = 0;
	R = T82c9(((T35*)(C))->a151);
	return R;
}

/* LX_LEX_PARSER.report_trailing_context_used_twice_error */
void T35f303(T0* C)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T93c7(t1, ((T35*)(C))->a24);
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_TRAILING_CONTEXT_USED_TWICE_ERROR.make */
T0* T93c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T93));
	((T93*)(C))->id = 93;
	((T93*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(2)));
	T119f8(((T93*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T93*)(C))->a5, t1, (T4)(geint32(2)));
	return C;
}

/* LX_LEX_PARSER.append_eol_to_regexp */
T0* T35f163(T0* C, T0* a1)
{
	T0* R = 0;
	T0* t1;
	R = (a1);
	t1 = (T35f164(C));
	T82f11(R, t1);
	t1 = (T35f257(C, (T4)(geint32(10))));
	T82f11(R, t1);
	return R;
}

/* LX_LEX_PARSER.append_trail_context_to_regexp */
T0* T35f157(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T2 t1;
	T82f23(a1);
	t1 = (T4f5(&(((T35*)(C))->a158), (T4)(geint32(0))));
	if (!(t1)) {
		t1 = (T4f5(&(((T35*)(C))->a155), (T4)(geint32(0))));
	}
	t1 = ((T2)(!(t1)));
	if (t1) {
		T82f19(a2, ((T35*)(C))->a152);
	}
	R = (a2);
	T82f11(R, a1);
	return R;
}

/* LX_NFA.set_accepted_rule */
void T82f19(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T82f5(C));
	T121f16(t1, a1);
}

/* LX_NFA_STATE.set_accepted_rule */
void T121f16(T0* C, T0* a1)
{
	((T121*)(C))->a7 = (a1);
}

/* LX_NFA.set_beginning_as_normal */
void T82f23(T0* C)
{
	T0* t1;
	t1 = (T82f4(C));
	T121f17(t1);
}

/* LX_NFA_STATE.set_beginning_as_normal */
void T121f17(T0* C)
{
	T0* l1 = 0;
	T2 t1;
	T0* t2;
	if (((T121*)(C))->a1) {
		((T121*)(C))->a1 = (EIF_FALSE);
		if ((((T121*)(C))->a2)==EIF_VOID) {
			l1 = EIF_VOID;
		} else {
			switch ((((T121*)(C))->a2)->id) {
			case 179:
				l1 = ((T121*)(C))->a2;
				break;
			default:
				l1 = EIF_VOID;
			}
		}
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t2 = (((T179*)(l1))->a1);
			T121f17(t2);
		}
		t1 = ((((T121*)(C))->a3)!=(EIF_VOID));
		if (t1) {
			t2 = (((T179*)(((T121*)(C))->a3))->a1);
			T121f17(t2);
		}
	}
}

/* LX_LEX_PARSER.report_unrecognized_rule_error */
void T35f302(T0* C)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T92c7(t1, ((T35*)(C))->a24);
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_UNRECOGNIZED_RULE_ERROR.make */
T0* T92c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T92));
	((T92*)(C))->id = 92;
	((T92*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(2)));
	T119f8(((T92*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T92*)(C))->a5, t1, (T4)(geint32(2)));
	return C;
}

/* LX_LEX_PARSER.process_eof_rule */
void T35f301(T0* C)
{
	T2 t1;
	T0* t2;
	t1 = (T63f4(((T35*)(C))->a4));
	if (t1) {
		t2 = (((T22*)(((T35*)(C))->a16))->a19);
		T63f26(((T35*)(C))->a4, t2);
		t1 = (T63f4(((T35*)(C))->a4));
		if (t1) {
			T35f346(C);
		} else {
			T35f347(C, ((T35*)(C))->a4);
		}
	} else {
		T35f347(C, ((T35*)(C))->a4);
	}
}

/* LX_LEX_PARSER.build_eof_action */
void T35f347(T0* C, T0* a1)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l5 = (((T22*)(((T35*)(C))->a16))->a16);
	l3 = (((T63*)(a1))->a1);
	l2 = ((T4)(geint32(1)));
	t1 = (T4f1(&l2, l3));
	while (!(t1)) {
		l4 = (T63f5(a1, l2));
		t1 = (((T90*)(l4))->a6);
		if (t1) {
			t2 = (((T90*)(l4))->a1);
			T35f354(C, t2);
		} else {
			T90f8(l4, EIF_TRUE);
			t3 = (((T90*)(l4))->a2);
			l1 = T46c15(t3);
			t2 = (T35f253(C));
			T46f16(l1, t2);
			T45f16(l5, l1);
			T45f16(((T35*)(C))->a2, l1);
			T46f17(((T35*)(C))->a152, ((T35*)(C))->a202);
		}
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t1 = (T4f1(&l2, l3));
	}
}

/* LX_RULE.set_line_nb */
void T46f17(T0* C, T4 a1)
{
	((T46*)(C))->a10 = (a1);
}

/* LX_RULE.set_pattern */
void T46f16(T0* C, T0* a1)
{
	((T46*)(C))->a2 = (a1);
}

/* LX_LEX_PARSER.eof_nfa */
unsigned char ge108os2269 = '\0';
T0* ge108ov2269;
T0* T35f253(T0* C)
{
	T0* R = 0;
	if (ge108os2269) {
		return ge108ov2269;
	} else {
		ge108os2269 = '\1';
	}
	R = T82c9(EIF_FALSE);
	ge108ov2269 = R;
	return R;
}

/* LX_START_CONDITION.set_has_eof */
void T90f8(T0* C, T2 a1)
{
	((T90*)(C))->a6 = (a1);
}

/* LX_LEX_PARSER.report_multiple_eof_rules_error */
void T35f354(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T115c7(t1, ((T35*)(C))->a24, a1);
	T21f7(((T35*)(C))->a18, l1);
}

/* LX_MULTIPLE_EOF_RULES_ERROR.make */
T0* T115c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T115));
	((T115*)(C))->id = 115;
	((T115*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(3)));
	T119f8(((T115*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T115*)(C))->a5, t1, (T4)(geint32(2)));
	T119f8(((T115*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* LX_LEX_PARSER.report_all_start_conditions_eof_warning */
void T35f346(T0* C)
{
	T0* l1 = 0;
	T2 t1;
	T0* t2;
	t1 = (((T22*)(((T35*)(C))->a16))->a3);
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = (T35f232(C));
		l1 = T111c7(t2, ((T35*)(C))->a24);
		T21f8(((T35*)(C))->a18, l1);
	}
}

/* LX_ALL_START_CONDITIONS_EOF_ERROR.make */
T0* T111c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T111));
	((T111*)(C))->id = 111;
	((T111*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(2)));
	T119f8(((T111*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T111*)(C))->a5, t1, (T4)(geint32(2)));
	return C;
}

/* LX_START_CONDITIONS.append_non_eof_start_conditions */
void T63f26(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	l2 = (((T63*)(a1))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l3 = (T63f5(a1, l1));
		t1 = (((T90*)(l3))->a6);
		t1 = ((T2)(!(t1)));
		if (t1) {
			T63f31(C, l3);
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
}

/* LX_START_CONDITIONS.force_last */
void T63f31(T0* C, T0* a1)
{
	T2 t1;
	T4 t2;
	t1 = (T63f14(C, (T4)(geint32(1))));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = ((T4)((((T63*)(C))->a1)+((T4)(geint32(1)))));
		t2 = (T63f15(C, t2));
		T63f33(C, t2);
	}
	((T63*)(C))->a1 = ((T4)((((T63*)(C))->a1)+((T4)(geint32(1)))));
	((T170*)(((T63*)(C))->a7))->a2[((T63*)(C))->a1] = (a1);
}

/* LX_START_CONDITIONS.resize */
void T63f33(T0* C, T4 a1)
{
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T63*)(C))->a7 = (T171f2(((T63*)(C))->a8, ((T63*)(C))->a7, t1));
	((T63*)(C))->a9 = (a1);
}

/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].resize */
T0* T171f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T170*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T170f3(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [LX_START_CONDITION].resized_area */
T0* T170f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T170c4(a1);
	l2 = (((T170*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T170*)(C))->a2[l1]);
		((T170*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* SPECIAL [LX_START_CONDITION].make */
T0* T170c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T170)+a1*sizeof(T0*));
	((T170*)(C))->a1 = a1;
	((T170*)(C))->id = 170;
	return C;
}

/* LX_START_CONDITIONS.new_capacity */
T4 T63f15(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* LX_START_CONDITIONS.extendible */
T2 T63f14(T0* C, T4 a1)
{
	T2 R = 0;
	T4 t1;
	t1 = ((T4)((((T63*)(C))->a1)+(a1)));
	R = (T4f5(&(((T63*)(C))->a9), t1));
	return R;
}

/* LX_START_CONDITIONS.is_empty */
T2 T63f4(T0* C)
{
	T2 R = 0;
	R = ((((T63*)(C))->a1)==((T4)(geint32(0))));
	return R;
}

/* LX_LEX_PARSER.process_rule */
void T35f300(T0* C, T0* a1)
{
	T0* t1;
	T2 t2;
	T2 t3;
	T82f19(a1, ((T35*)(C))->a152);
	T46f16(((T35*)(C))->a152, a1);
	t1 = (((T22*)(((T35*)(C))->a16))->a5);
	T45f16(t1, ((T35*)(C))->a152);
	T45f16(((T35*)(C))->a2, ((T35*)(C))->a152);
	T46f17(((T35*)(C))->a152, ((T35*)(C))->a202);
	T46f18(((T35*)(C))->a152, ((T35*)(C))->a154);
	T46f19(((T35*)(C))->a152, ((T35*)(C))->a158);
	T46f20(((T35*)(C))->a152, ((T35*)(C))->a155);
	T46f21(((T35*)(C))->a152, ((T35*)(C))->a159);
	T46f22(((T35*)(C))->a152, ((T35*)(C))->a161);
	if (((T35*)(C))->a154) {
		t3 = (T4f5(&(((T35*)(C))->a158), (T4)(geint32(0))));
		if (!(t3)) {
			t3 = (T4f5(&(((T35*)(C))->a155), (T4)(geint32(0))));
		}
		t2 = ((T2)(!(t3)));
	} else {
		t2 = EIF_FALSE;
	}
	if (t2) {
		T22f58(((T35*)(C))->a16, EIF_TRUE);
	}
	t2 = (T63f4(((T35*)(C))->a4));
	if (t2) {
		t1 = (((T22*)(((T35*)(C))->a16))->a19);
		T63f25(t1, a1);
	} else {
		T63f21(((T35*)(C))->a4, a1);
	}
}

/* LX_START_CONDITIONS.add_nfa_to_all */
void T63f21(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	l2 = (((T63*)(C))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		t2 = (T63f5(C, l1));
		T90f9(t2, a1);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
}

/* LX_START_CONDITION.put_nfa */
void T90f9(T0* C, T0* a1)
{
	T154f11(((T90*)(C))->a4, a1);
}

/* DS_ARRAYED_LIST [LX_NFA].force_last */
void T154f11(T0* C, T0* a1)
{
	T2 t1;
	T4 t2;
	t1 = (T154f8(C, (T4)(geint32(1))));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = ((T4)((((T154*)(C))->a6)+((T4)(geint32(1)))));
		t2 = (T154f9(C, t2));
		T154f12(C, t2);
	}
	((T154*)(C))->a6 = ((T4)((((T154*)(C))->a6)+((T4)(geint32(1)))));
	((T84*)(((T154*)(C))->a2))->a2[((T154*)(C))->a6] = (a1);
}

/* DS_ARRAYED_LIST [LX_NFA].resize */
void T154f12(T0* C, T4 a1)
{
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T154*)(C))->a2 = (T85f2(((T154*)(C))->a1, ((T154*)(C))->a2, t1));
	((T154*)(C))->a3 = (a1);
}

/* DS_ARRAYED_LIST [LX_NFA].new_capacity */
T4 T154f9(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* DS_ARRAYED_LIST [LX_NFA].extendible */
T2 T154f8(T0* C, T4 a1)
{
	T2 R = 0;
	T4 t1;
	t1 = ((T4)((((T154*)(C))->a6)+(a1)));
	R = (T4f5(&(((T154*)(C))->a3), t1));
	return R;
}

/* LX_START_CONDITIONS.add_nfa_to_non_exclusive */
void T63f25(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	l2 = (((T63*)(C))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l3 = (T63f5(C, l1));
		t1 = (((T90*)(l3))->a3);
		t1 = ((T2)(!(t1)));
		if (t1) {
			T90f9(l3, a1);
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
}

/* LX_DESCRIPTION.set_variable_trail_context */
void T22f58(T0* C, T2 a1)
{
	((T22*)(C))->a25 = (a1);
}

/* LX_RULE.set_column_count */
void T46f22(T0* C, T4 a1)
{
	((T46*)(C))->a9 = (a1);
}

/* LX_RULE.set_line_count */
void T46f21(T0* C, T4 a1)
{
	((T46*)(C))->a8 = (a1);
}

/* LX_RULE.set_trail_count */
void T46f20(T0* C, T4 a1)
{
	((T46*)(C))->a7 = (a1);
}

/* LX_RULE.set_head_count */
void T46f19(T0* C, T4 a1)
{
	((T46*)(C))->a6 = (a1);
}

/* LX_RULE.set_trail_context */
void T46f18(T0* C, T2 a1)
{
	((T46*)(C))->a11 = (a1);
}

/* LX_LEX_PARSER.process_bol_rule */
void T35f299(T0* C, T0* a1)
{
	T0* t1;
	T2 t2;
	T2 t3;
	T82f19(a1, ((T35*)(C))->a152);
	T46f16(((T35*)(C))->a152, a1);
	t1 = (((T22*)(((T35*)(C))->a16))->a5);
	T45f16(t1, ((T35*)(C))->a152);
	T45f16(((T35*)(C))->a2, ((T35*)(C))->a152);
	T46f17(((T35*)(C))->a152, ((T35*)(C))->a202);
	T46f18(((T35*)(C))->a152, ((T35*)(C))->a154);
	T46f19(((T35*)(C))->a152, ((T35*)(C))->a158);
	T46f20(((T35*)(C))->a152, ((T35*)(C))->a155);
	T46f21(((T35*)(C))->a152, ((T35*)(C))->a159);
	T46f22(((T35*)(C))->a152, ((T35*)(C))->a161);
	if (((T35*)(C))->a154) {
		t3 = (T4f5(&(((T35*)(C))->a158), (T4)(geint32(0))));
		if (!(t3)) {
			t3 = (T4f5(&(((T35*)(C))->a155), (T4)(geint32(0))));
		}
		t2 = ((T2)(!(t3)));
	} else {
		t2 = EIF_FALSE;
	}
	if (t2) {
		T22f58(((T35*)(C))->a16, EIF_TRUE);
	}
	T22f59(((T35*)(C))->a16, EIF_TRUE);
	t2 = (T63f4(((T35*)(C))->a4));
	if (t2) {
		t1 = (((T22*)(((T35*)(C))->a16))->a19);
		T63f23(t1, a1);
	} else {
		T63f24(((T35*)(C))->a4, a1);
	}
}

/* LX_START_CONDITIONS.add_bol_nfa_to_all */
void T63f24(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	l2 = (((T63*)(C))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		t2 = (T63f5(C, l1));
		T90f10(t2, a1);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
}

/* LX_START_CONDITION.put_bol_nfa */
void T90f10(T0* C, T0* a1)
{
	T154f11(((T90*)(C))->a5, a1);
}

/* LX_START_CONDITIONS.add_bol_nfa_to_non_exclusive */
void T63f23(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	l2 = (((T63*)(C))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l3 = (T63f5(C, l1));
		t1 = (((T90*)(l3))->a3);
		t1 = ((T2)(!(t1)));
		if (t1) {
			T90f10(l3, a1);
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
}

/* LX_DESCRIPTION.set_bol_needed */
void T22f59(T0* C, T2 a1)
{
	((T22*)(C))->a27 = (a1);
}

/* LX_LEX_PARSER.report_bad_start_condition_list_error */
void T35f298(T0* C)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T91c7(t1, ((T35*)(C))->a24);
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_BAD_START_CONDITION_LIST_ERROR.make */
T0* T91c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T91));
	((T91*)(C))->id = 91;
	((T91*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(2)));
	T119f8(((T91*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T91*)(C))->a5, t1, (T4)(geint32(2)));
	return C;
}

/* LX_LEX_PARSER.push_start_condition */
void T35f297(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T2 t1;
	T0* t2;
	l1 = (((T22*)(((T35*)(C))->a16))->a19);
	t1 = (T63f2(l1, a1));
	if (t1) {
		t1 = (T63f2(a2, a1));
		if (t1) {
			T35f344(C, a1);
		} else {
			t2 = (T63f3(l1, a1));
			T63f22(a2, t2);
		}
	} else {
		T35f345(C, a1);
	}
}

/* LX_LEX_PARSER.report_undeclared_start_condition_error */
void T35f345(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T110c7(t1, ((T35*)(C))->a24, a1);
	T21f7(((T35*)(C))->a18, l1);
}

/* LX_UNDECLARED_START_CONDITION_ERROR.make */
T0* T110c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T110));
	((T110*)(C))->id = 110;
	((T110*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(3)));
	T119f8(((T110*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T110*)(C))->a5, t1, (T4)(geint32(2)));
	T119f8(((T110*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* LX_START_CONDITIONS.put_last */
void T63f22(T0* C, T0* a1)
{
	((T63*)(C))->a1 = ((T4)((((T63*)(C))->a1)+((T4)(geint32(1)))));
	((T170*)(((T63*)(C))->a7))->a2[((T63*)(C))->a1] = (a1);
}

/* LX_START_CONDITIONS.start_condition */
T0* T63f3(T0* C, T0* a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	l1 = ((T4)(geint32(1)));
	l2 = (((T63*)(C))->a1);
	l3 = (T16f12(a1));
	t1 = ((R)!=(EIF_VOID));
	if (!(t1)) {
		t1 = (T4f1(&l1, l2));
	}
	while (!(t1)) {
		R = (T63f5(C, l1));
		t2 = (((T90*)(R))->a1);
		t2 = (T16f12(t2));
		t1 = (T16f8(l3, t2));
		t1 = ((T2)(!(t1)));
		if (t1) {
			R = (EIF_VOID);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
		}
		t1 = ((R)!=(EIF_VOID));
		if (!(t1)) {
			t1 = (T4f1(&l1, l2));
		}
	}
	return R;
}

/* STRING.is_equal */
T2 T16f8(T0* C, T0* a1)
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
			t2 = (T16f19(C, ((T16*)(C))->a1, t3, l1));
			R = ((t2)==((T4)(geint32(0))));
		}
	}
	return R;
}

/* STRING.str_strict_cmp */
T4 T16f19(T0* C, T0* a1, T0* a2, T4 a3)
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

/* STRING.as_lower */
T0* T16f12(T0* C)
{
	T0* R = 0;
	R = (T16f14(C));
	T16f33(R);
	return R;
}

/* STRING.to_lower */
void T16f33(T0* C)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T1 t2;
	l1 = ((T4)((((T16*)(C))->a2)-((T4)(geint32(1)))));
	l2 = (((T16*)(C))->a1);
	t1 = ((T2)((l1)<((T4)(geint32(0)))));
	while (!(t1)) {
		t2 = (((T15*)(l2))->a2[l1]);
		t2 = (T1f6(&t2));
		((T15*)(l2))->a2[l1] = (t2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t1 = ((T2)((l1)<((T4)(geint32(0)))));
	}
	((T16*)(C))->a4 = ((T4)(geint32(0)));
}

/* CHARACTER.lower */
T1 T1f6(T1* C)
{
	T1 R = 0;
	T2 t1;
	T1 t2;
	T4 t3;
	T4 t4;
	t1 = (T1f7(C));
	if (t1) {
		t2 = (*C);
		t3 = ((T4)(t2));
		t2 = (T1)('A');
		t4 = ((T4)(t2));
		t3 = ((T4)((t3)-(t4)));
		t2 = (T1)('a');
		t4 = ((T4)(t2));
		t3 = ((T4)((t3)+(t4)));
		R = ((T1)(t3));
	} else {
		R = (*C);
	}
	return R;
}

/* CHARACTER.is_upper */
T2 T1f7(T1* C)
{
	T2 R = 0;
	T1 t1;
	T4 t2;
	T8 t3;
	t1 = (*C);
	t2 = ((T4)(t1));
	t3 = (T1f8(C, t2));
	t3 = (T8f1(&t3, (T5)(geint8(0x01))));
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
T8 T1f8(T1* C, T4 a1)
{
	T8 R = 0;
	T2 t1;
	T0* t2;
	t1 = ((T2)((a1)<((T4)(geint32(256)))));
	if (t1) {
		t2 = (T1f10(C));
		R = (((T226*)(t2))->a2[a1]);
	}
	return R;
}

/* CHARACTER.internal_character_types */
unsigned char ge35os35 = '\0';
T0* ge35ov35;
T0* T1f10(T1* C)
{
	T0* R = 0;
	T8 t1;
	if (ge35os35) {
		return ge35ov35;
	} else {
		ge35os35 = '\1';
	}
	R = T226c2((T4)(geint32(256)));
	((T226*)(R))->a2[(T4)(geint32(0))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(1))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(2))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(3))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(4))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(5))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(6))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(7))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(8))] = ((T5)(geint8(0x20)));
	t1 = (T5)(geint8(0x20));
	t1 = (T8f3(&t1, (T5)(geint8(0x08))));
	((T226*)(R))->a2[(T4)(geint32(9))] = (t1);
	t1 = (T5)(geint8(0x20));
	t1 = (T8f3(&t1, (T5)(geint8(0x08))));
	((T226*)(R))->a2[(T4)(geint32(10))] = (t1);
	t1 = (T5)(geint8(0x20));
	t1 = (T8f3(&t1, (T5)(geint8(0x08))));
	((T226*)(R))->a2[(T4)(geint32(11))] = (t1);
	t1 = (T5)(geint8(0x20));
	t1 = (T8f3(&t1, (T5)(geint8(0x08))));
	((T226*)(R))->a2[(T4)(geint32(12))] = (t1);
	t1 = (T5)(geint8(0x20));
	t1 = (T8f3(&t1, (T5)(geint8(0x08))));
	((T226*)(R))->a2[(T4)(geint32(13))] = (t1);
	((T226*)(R))->a2[(T4)(geint32(14))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(15))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(16))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(17))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(18))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(19))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(20))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(21))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(22))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(23))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(24))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(25))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(26))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(27))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(28))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(29))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(30))] = ((T5)(geint8(0x20)));
	((T226*)(R))->a2[(T4)(geint32(31))] = ((T5)(geint8(0x20)));
	t1 = (T5)(geint8(0x08));
	t1 = (T8f3(&t1, (T5)(geint8(0x80))));
	((T226*)(R))->a2[(T4)(geint32(32))] = (t1);
	((T226*)(R))->a2[(T4)(geint32(33))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(34))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(35))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(36))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(37))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(38))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(39))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(40))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(41))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(42))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(43))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(44))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(45))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(46))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(47))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(48))] = ((T5)(geint8(0x04)));
	((T226*)(R))->a2[(T4)(geint32(49))] = ((T5)(geint8(0x04)));
	((T226*)(R))->a2[(T4)(geint32(50))] = ((T5)(geint8(0x04)));
	((T226*)(R))->a2[(T4)(geint32(51))] = ((T5)(geint8(0x04)));
	((T226*)(R))->a2[(T4)(geint32(52))] = ((T5)(geint8(0x04)));
	((T226*)(R))->a2[(T4)(geint32(53))] = ((T5)(geint8(0x04)));
	((T226*)(R))->a2[(T4)(geint32(54))] = ((T5)(geint8(0x04)));
	((T226*)(R))->a2[(T4)(geint32(55))] = ((T5)(geint8(0x04)));
	((T226*)(R))->a2[(T4)(geint32(56))] = ((T5)(geint8(0x04)));
	((T226*)(R))->a2[(T4)(geint32(57))] = ((T5)(geint8(0x04)));
	((T226*)(R))->a2[(T4)(geint32(58))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(59))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(60))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(61))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(62))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(63))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(64))] = ((T5)(geint8(0x10)));
	t1 = (T5)(geint8(0x01));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T226*)(R))->a2[(T4)(geint32(65))] = (t1);
	t1 = (T5)(geint8(0x01));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T226*)(R))->a2[(T4)(geint32(66))] = (t1);
	t1 = (T5)(geint8(0x01));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T226*)(R))->a2[(T4)(geint32(67))] = (t1);
	t1 = (T5)(geint8(0x01));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T226*)(R))->a2[(T4)(geint32(68))] = (t1);
	t1 = (T5)(geint8(0x01));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T226*)(R))->a2[(T4)(geint32(69))] = (t1);
	t1 = (T5)(geint8(0x01));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T226*)(R))->a2[(T4)(geint32(70))] = (t1);
	((T226*)(R))->a2[(T4)(geint32(71))] = ((T5)(geint8(0x01)));
	((T226*)(R))->a2[(T4)(geint32(72))] = ((T5)(geint8(0x01)));
	((T226*)(R))->a2[(T4)(geint32(73))] = ((T5)(geint8(0x01)));
	((T226*)(R))->a2[(T4)(geint32(74))] = ((T5)(geint8(0x01)));
	((T226*)(R))->a2[(T4)(geint32(75))] = ((T5)(geint8(0x01)));
	((T226*)(R))->a2[(T4)(geint32(76))] = ((T5)(geint8(0x01)));
	((T226*)(R))->a2[(T4)(geint32(77))] = ((T5)(geint8(0x01)));
	((T226*)(R))->a2[(T4)(geint32(78))] = ((T5)(geint8(0x01)));
	((T226*)(R))->a2[(T4)(geint32(79))] = ((T5)(geint8(0x01)));
	((T226*)(R))->a2[(T4)(geint32(80))] = ((T5)(geint8(0x01)));
	((T226*)(R))->a2[(T4)(geint32(81))] = ((T5)(geint8(0x01)));
	((T226*)(R))->a2[(T4)(geint32(82))] = ((T5)(geint8(0x01)));
	((T226*)(R))->a2[(T4)(geint32(83))] = ((T5)(geint8(0x01)));
	((T226*)(R))->a2[(T4)(geint32(84))] = ((T5)(geint8(0x01)));
	((T226*)(R))->a2[(T4)(geint32(85))] = ((T5)(geint8(0x01)));
	((T226*)(R))->a2[(T4)(geint32(86))] = ((T5)(geint8(0x01)));
	((T226*)(R))->a2[(T4)(geint32(87))] = ((T5)(geint8(0x01)));
	((T226*)(R))->a2[(T4)(geint32(88))] = ((T5)(geint8(0x01)));
	((T226*)(R))->a2[(T4)(geint32(89))] = ((T5)(geint8(0x01)));
	((T226*)(R))->a2[(T4)(geint32(90))] = ((T5)(geint8(0x01)));
	((T226*)(R))->a2[(T4)(geint32(91))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(92))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(93))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(94))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(95))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(96))] = ((T5)(geint8(0x10)));
	t1 = (T5)(geint8(0x02));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T226*)(R))->a2[(T4)(geint32(97))] = (t1);
	t1 = (T5)(geint8(0x02));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T226*)(R))->a2[(T4)(geint32(98))] = (t1);
	t1 = (T5)(geint8(0x02));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T226*)(R))->a2[(T4)(geint32(99))] = (t1);
	t1 = (T5)(geint8(0x02));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T226*)(R))->a2[(T4)(geint32(100))] = (t1);
	t1 = (T5)(geint8(0x02));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T226*)(R))->a2[(T4)(geint32(101))] = (t1);
	t1 = (T5)(geint8(0x02));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T226*)(R))->a2[(T4)(geint32(102))] = (t1);
	((T226*)(R))->a2[(T4)(geint32(103))] = ((T5)(geint8(0x02)));
	((T226*)(R))->a2[(T4)(geint32(104))] = ((T5)(geint8(0x02)));
	((T226*)(R))->a2[(T4)(geint32(105))] = ((T5)(geint8(0x02)));
	((T226*)(R))->a2[(T4)(geint32(106))] = ((T5)(geint8(0x02)));
	((T226*)(R))->a2[(T4)(geint32(107))] = ((T5)(geint8(0x02)));
	((T226*)(R))->a2[(T4)(geint32(108))] = ((T5)(geint8(0x02)));
	((T226*)(R))->a2[(T4)(geint32(109))] = ((T5)(geint8(0x02)));
	((T226*)(R))->a2[(T4)(geint32(110))] = ((T5)(geint8(0x02)));
	((T226*)(R))->a2[(T4)(geint32(111))] = ((T5)(geint8(0x02)));
	((T226*)(R))->a2[(T4)(geint32(112))] = ((T5)(geint8(0x02)));
	((T226*)(R))->a2[(T4)(geint32(113))] = ((T5)(geint8(0x02)));
	((T226*)(R))->a2[(T4)(geint32(114))] = ((T5)(geint8(0x02)));
	((T226*)(R))->a2[(T4)(geint32(115))] = ((T5)(geint8(0x02)));
	((T226*)(R))->a2[(T4)(geint32(116))] = ((T5)(geint8(0x02)));
	((T226*)(R))->a2[(T4)(geint32(117))] = ((T5)(geint8(0x02)));
	((T226*)(R))->a2[(T4)(geint32(118))] = ((T5)(geint8(0x02)));
	((T226*)(R))->a2[(T4)(geint32(119))] = ((T5)(geint8(0x02)));
	((T226*)(R))->a2[(T4)(geint32(120))] = ((T5)(geint8(0x02)));
	((T226*)(R))->a2[(T4)(geint32(121))] = ((T5)(geint8(0x02)));
	((T226*)(R))->a2[(T4)(geint32(122))] = ((T5)(geint8(0x02)));
	((T226*)(R))->a2[(T4)(geint32(123))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(124))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(125))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(126))] = ((T5)(geint8(0x10)));
	((T226*)(R))->a2[(T4)(geint32(127))] = ((T5)(geint8(0x20)));
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
T0* T226c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T226)+a1*sizeof(T8));
	((T226*)(C))->a1 = a1;
	((T226*)(C))->id = 226;
	return C;
}

/* LX_LEX_PARSER.report_start_condition_specified_twice_warning */
void T35f344(T0* C, T0* a1)
{
	T0* l1 = 0;
	T2 t1;
	T0* t2;
	t1 = (((T22*)(((T35*)(C))->a16))->a3);
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = (T35f232(C));
		l1 = T109c7(t2, ((T35*)(C))->a24, a1);
		T21f8(((T35*)(C))->a18, l1);
	}
}

/* LX_START_CONDITION_SPECIFIED_TWICE_ERROR.make */
T0* T109c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T109));
	((T109*)(C))->id = 109;
	((T109*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(3)));
	T119f8(((T109*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T109*)(C))->a5, t1, (T4)(geint32(2)));
	T119f8(((T109*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* LX_START_CONDITIONS.has_start_condition */
T2 T63f2(T0* C, T0* a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	l1 = ((T4)(geint32(1)));
	l2 = (((T63*)(C))->a1);
	l3 = (T16f12(a1));
	if (!(R)) {
		t1 = (T4f1(&l1, l2));
	} else {
		t1 = EIF_TRUE;
	}
	while (!(t1)) {
		t2 = (T63f5(C, l1));
		t2 = (((T90*)(t2))->a1);
		t2 = (T16f12(t2));
		R = (T16f8(l3, t2));
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		if (!(R)) {
			t1 = (T4f1(&l1, l2));
		} else {
			t1 = EIF_TRUE;
		}
	}
	return R;
}

/* LX_START_CONDITIONS.append_start_conditions */
void T63f20(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	l2 = (((T63*)(a1))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l3 = (T63f5(a1, l1));
		t1 = (T63f12(C, l3));
		t1 = ((T2)(!(t1)));
		if (t1) {
			T63f31(C, l3);
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
}

/* LX_START_CONDITIONS.has */
T2 T63f12(T0* C, T0* a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	l1 = (((T63*)(C))->a1);
	l2 = (((T63*)(C))->a16);
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t1)) {
			t2 = (((T170*)(((T63*)(C))->a7))->a2[l1]);
			t1 = ((T2)gevoid(l2, t2, a1));
			if (t1) {
				R = (EIF_TRUE);
				l1 = ((T4)(geint32(0)));
			} else {
				l1 = ((T4)((l1)-((T4)(geint32(1)))));
			}
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
		}
	} else {
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t1)) {
			t2 = (((T170*)(((T63*)(C))->a7))->a2[l1]);
			t1 = ((t2)==(a1));
			if (t1) {
				R = (EIF_TRUE);
				l1 = ((T4)(geint32(0)));
			} else {
				l1 = ((T4)((l1)-((T4)(geint32(1)))));
			}
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
		}
	}
	return R;
}

/* LX_LEX_PARSER.set_action */
void T35f296(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	l3 = (T64f1(((T35*)(C))->a6, a1));
	l2 = (((T45*)(((T35*)(C))->a2))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		t2 = (T45f2(((T35*)(C))->a2, l1));
		T46f23(t2, l3);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
	T45f17(((T35*)(C))->a2);
}

/* DS_ARRAYED_LIST [LX_RULE].wipe_out */
void T45f17(T0* C)
{
	T45f21(C);
	T45f22(C, (T4)(geint32(1)), ((T45*)(C))->a1);
	((T45*)(C))->a1 = ((T4)(geint32(0)));
}

/* DS_ARRAYED_LIST [LX_RULE].clear_items */
void T45f22(T0* C, T4 a1, T4 a2)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T2 t1;
	l2 = (a1);
	t1 = (T4f1(&l2, a2));
	while (!(t1)) {
		((T123*)(((T45*)(C))->a4))->a2[l2] = (l1);
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t1 = (T4f1(&l2, a2));
	}
}

/* DS_ARRAYED_LIST [LX_RULE].move_all_cursors_after */
void T45f21(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	l1 = (((T45*)(C))->a8);
	t1 = ((l1)==(EIF_VOID));
	while (!(t1)) {
		T157f5(l1, (T4)(geint32(-1)));
		l2 = (((T157*)(l1))->a1);
		T157f6(l1, EIF_VOID);
		l1 = (l2);
		t1 = ((l1)==(EIF_VOID));
	}
}

/* DS_ARRAYED_LIST_CURSOR [LX_RULE].set_next_cursor */
void T157f6(T0* C, T0* a1)
{
	((T157*)(C))->a1 = (a1);
}

/* LX_RULE.set_action */
void T46f23(T0* C, T0* a1)
{
	((T46*)(C))->a4 = (a1);
}

/* LX_ACTION_FACTORY.new_action */
T0* T64f1(T0* C, T0* a1)
{
	T0* R = 0;
	R = T89c3(a1);
	return R;
}

/* LX_START_CONDITIONS.keep_first */
void T63f19(T0* C, T4 a1)
{
	T4 t1;
	T63f29(C);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T63f30(C, t1, ((T63*)(C))->a1);
	((T63*)(C))->a1 = (a1);
}

/* LX_START_CONDITIONS.clear_items */
void T63f30(T0* C, T4 a1, T4 a2)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T2 t1;
	l2 = (a1);
	t1 = (T4f1(&l2, a2));
	while (!(t1)) {
		((T170*)(((T63*)(C))->a7))->a2[l2] = (l1);
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t1 = (T4f1(&l2, a2));
	}
}

/* LX_START_CONDITIONS.move_all_cursors_after */
void T63f29(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	l1 = (((T63*)(C))->a10);
	t1 = ((l1)==(EIF_VOID));
	while (!(t1)) {
		T172f5(l1, (T4)(geint32(-1)));
		l2 = (((T172*)(l1))->a1);
		T172f6(l1, EIF_VOID);
		l1 = (l2);
		t1 = ((l1)==(EIF_VOID));
	}
}

/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].set_next_cursor */
void T172f6(T0* C, T0* a1)
{
	((T172*)(C))->a1 = (a1);
}

/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].set_position */
void T172f5(T0* C, T4 a1)
{
	((T172*)(C))->a2 = (a1);
}

/* LX_DESCRIPTION.create_equiv_classes */
void T22f49(T0* C)
{
	((T22*)(C))->a24 = T83c10((T4)(geint32(1)), ((T22*)(C))->a12);
}

/* LX_LEX_PARSER.override_options */
void T35f295(T0* C)
{
	T2 t1;
	t1 = ((((T35*)(C))->a14)!=(EIF_VOID));
	if (t1) {
		T18f13(((T35*)(C))->a14, ((T35*)(C))->a16);
	}
}

/* GELEX.override_description */
void T18f13(T0* C, T0* a1)
{
	T0* l1 = 0;
	l1 = T19c7(((T18*)(C))->a2);
	T19f8(l1, a1);
}

/* LX_LEX_PARSER.check_options */
void T35f294(T0* C)
{
	T2 t1;
	t1 = (((T22*)(((T35*)(C))->a16))->a2);
	if (t1) {
		t1 = (((T22*)(((T35*)(C))->a16))->a11);
		if (t1) {
			T35f341(C);
		}
		t1 = (((T22*)(((T35*)(C))->a16))->a4);
		if (t1) {
			T35f342(C);
		} else {
			t1 = (((T22*)(((T35*)(C))->a16))->a25);
			if (t1) {
				T35f343(C);
			}
		}
	}
}

/* LX_LEX_PARSER.report_full_and_variable_trailing_context_error */
void T35f343(T0* C)
{
	T0* l1 = 0;
	l1 = T108c7();
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.make */
T0* T108c7()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T108));
	((T108*)(C))->id = 108;
	((T108*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(0)));
	return C;
}

/* LX_LEX_PARSER.report_full_and_reject_error */
void T35f342(T0* C)
{
	T0* l1 = 0;
	l1 = T107c7();
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_FULL_AND_REJECT_ERROR.make */
T0* T107c7()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T107));
	((T107*)(C))->id = 107;
	((T107*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(0)));
	return C;
}

/* LX_LEX_PARSER.report_full_and_meta_equiv_classes_error */
void T35f341(T0* C)
{
	T0* l1 = 0;
	l1 = T106c7();
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_FULL_AND_META_ERROR.make */
T0* T106c7()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T106));
	((T106*)(C))->id = 106;
	((T106*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(0)));
	return C;
}

/* LX_LEX_PARSER.build_equiv_classes */
void T35f293(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	l2 = (((T22*)(((T35*)(C))->a16))->a24);
	T83f11(l2);
	l1 = (T70f3(((T35*)(C))->a22));
	T87f7(l1);
	t1 = (T87f1(l1));
	while (!(t1)) {
		t2 = (T87f2(l1));
		T79f23(t2, l2);
		T87f8(l1);
		t1 = (T87f1(l1));
	}
}

/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].forth */
void T87f8(T0* C)
{
	T70f60(((T87*)(C))->a3, C);
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].cursor_forth */
void T70f60(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 l3 = 0;
	T4 l4 = 0;
	T2 t1;
	T4 t2;
	l4 = (((T87*)(a1))->a4);
	t1 = ((l4)==((T4)(geint32(-1))));
	if (t1) {
		l3 = (EIF_TRUE);
	} else {
		l1 = ((T4)((l4)+((T4)(geint32(1)))));
	}
	l2 = (((T70*)(C))->a15);
	t1 = (T4f1(&l1, l2));
	if (!(t1)) {
		t2 = (T70f17(C, l1));
		t1 = (T4f1(&t2, (T4)(geint32(-1))));
	}
	while (!(t1)) {
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
		if (!(t1)) {
			t2 = (T70f17(C, l1));
			t1 = (T4f1(&t2, (T4)(geint32(-1))));
		}
	}
	t1 = (T4f1(&l1, l2));
	if (t1) {
		T87f9(a1, (T4)(geint32(-2)));
		t1 = ((T2)(!(l3)));
		if (t1) {
			T70f61(C, a1);
		}
	} else {
		T87f9(a1, l1);
		if (l3) {
			T70f62(C, a1);
		}
	}
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].add_traversing_cursor */
void T70f62(T0* C, T0* a1)
{
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T70*)(C))->a29));
	if (t1) {
		t2 = (((T87*)(((T70*)(C))->a29))->a5);
		T87f10(a1, t2);
		T87f10(((T70*)(C))->a29, a1);
	}
}

/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].set_next_cursor */
void T87f10(T0* C, T0* a1)
{
	((T87*)(C))->a5 = (a1);
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].remove_traversing_cursor */
void T70f61(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T70*)(C))->a29));
	if (t1) {
		l2 = (((T70*)(C))->a29);
		l1 = (((T87*)(l2))->a5);
		t1 = ((l1)==(a1));
		if (!(t1)) {
			t1 = ((l1)==(EIF_VOID));
		}
		while (!(t1)) {
			l2 = (l1);
			l1 = (((T87*)(l1))->a5);
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T87*)(a1))->a5);
			T87f10(l2, t2);
			T87f10(a1, EIF_VOID);
		}
	}
}

/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].set_position */
void T87f9(T0* C, T4 a1)
{
	((T87*)(C))->a4 = (a1);
}

/* LX_SYMBOL_CLASS.convert_to_equivalence */
void T79f23(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T2 t1;
	T4 t2;
	l3 = (((T79*)(C))->a12);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l3));
	while (!(t1)) {
		l4 = (T79f14(C, l1));
		t1 = (T83f8(a1, l4));
		if (t1) {
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t2 = (T83f9(a1, l4));
			T79f25(C, t2, l2);
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l3));
	}
	((T79*)(C))->a12 = (l2);
}

/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].item */
T0* T87f2(T0* C)
{
	T0* R = 0;
	R = (T70f34(((T87*)(C))->a3, C));
	return R;
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].cursor_item */
T0* T70f34(T0* C, T0* a1)
{
	T0* R = 0;
	T4 t1;
	t1 = (((T87*)(a1))->a4);
	R = (T70f6(C, t1));
	return R;
}

/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].after */
T2 T87f1(T0* C)
{
	T2 R = 0;
	R = (T70f33(((T87*)(C))->a3, C));
	return R;
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].cursor_after */
T2 T70f33(T0* C, T0* a1)
{
	T2 R = 0;
	T4 t1;
	t1 = (((T87*)(a1))->a4);
	R = ((t1)==((T4)(geint32(-2))));
	return R;
}

/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].start */
void T87f7(T0* C)
{
	T70f59(((T87*)(C))->a3, C);
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].cursor_start */
void T70f59(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 l3 = 0;
	T2 t1;
	T4 t2;
	t1 = (T70f37(C));
	if (t1) {
		T87f9(a1, (T4)(geint32(-2)));
	} else {
		l3 = (T70f38(C, a1));
		l1 = ((T4)(geint32(1)));
		l2 = (((T70*)(C))->a15);
		t1 = (T4f1(&l1, l2));
		if (!(t1)) {
			t2 = (T70f17(C, l1));
			t1 = (T4f1(&t2, (T4)(geint32(-1))));
		}
		while (!(t1)) {
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l2));
			if (!(t1)) {
				t2 = (T70f17(C, l1));
				t1 = (T4f1(&t2, (T4)(geint32(-1))));
			}
		}
		t1 = (T4f1(&l1, l2));
		if (t1) {
			T87f9(a1, (T4)(geint32(-2)));
			t1 = ((T2)(!(l3)));
			if (t1) {
				T70f61(C, a1);
			}
		} else {
			T87f9(a1, l1);
			if (l3) {
				T70f62(C, a1);
			}
		}
	}
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].cursor_off */
T2 T70f38(T0* C, T0* a1)
{
	T2 R = 0;
	T4 t1;
	t1 = (((T87*)(a1))->a4);
	R = ((T2)((t1)<((T4)(geint32(0)))));
	return R;
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].is_empty */
T2 T70f37(T0* C)
{
	T2 R = 0;
	R = ((((T70*)(C))->a9)==((T4)(geint32(0))));
	return R;
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].new_cursor */
T0* T70f3(T0* C)
{
	T0* R = 0;
	R = T87c6(C);
	return R;
}

/* DS_HASH_TABLE_CURSOR [LX_SYMBOL_CLASS, STRING].make */
T0* T87c6(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T87));
	((T87*)(C))->id = 87;
	((T87*)(C))->a3 = (a1);
	((T87*)(C))->a4 = ((T4)(geint32(-1)));
	return C;
}

/* LX_LEX_PARSER.process_default_rule */
void T35f292(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T2 t2;
	l1 = T79c18((T4)(geint32(0)));
	T79f19(l1, EIF_TRUE);
	l2 = (T35f178(C, l1));
	T82f19(l2, ((T35*)(C))->a152);
	T46f16(((T35*)(C))->a152, l2);
	t1 = (((T22*)(((T35*)(C))->a16))->a5);
	T45f16(t1, ((T35*)(C))->a152);
	T45f16(((T35*)(C))->a2, ((T35*)(C))->a152);
	T46f17(((T35*)(C))->a152, (T4)(geint32(0)));
	T46f18(((T35*)(C))->a152, EIF_FALSE);
	T46f19(((T35*)(C))->a152, (T4)(geint32(1)));
	T46f20(((T35*)(C))->a152, (T4)(geint32(0)));
	T46f21(((T35*)(C))->a152, (T4)(geint32(-1)));
	T46f22(((T35*)(C))->a152, (T4)(geint32(-1)));
	t1 = (((T22*)(((T35*)(C))->a16))->a19);
	T63f21(t1, l2);
	t2 = (((T22*)(((T35*)(C))->a16))->a6);
	if (t2) {
		T35f296(C, gems("last_token := yyError_token\nfatal_error (\"scanner jammed\")", 58));
	} else {
		T35f296(C, gems("default_action", 14));
	}
}

/* LX_LEX_PARSER.yy_push_last_value */
void T35f279(T0* C, T4 a1)
{
	T4 t1;
	T2 t2;
	t1 = (((T71*)(((T35*)(C))->a75))->a2[a1]);
	switch (t1) {
	case (T4)(T4)(geint32(1)):
		((T35*)(C))->a84 = ((T4)((((T35*)(C))->a84)+((T4)(geint32(1)))));
		t2 = (T4f5(&(((T35*)(C))->a84), ((T35*)(C))->a134));
		if (t2) {
			t2 = ((((T35*)(C))->a135)==(EIF_VOID));
			if (t2) {
				((T35*)(C))->a136 = T76c3();
				((T35*)(C))->a134 = ((T4)(geint32(10)));
				((T35*)(C))->a135 = (T76f1(((T35*)(C))->a136, ((T35*)(C))->a134));
			} else {
				((T35*)(C))->a134 = ((T4)((((T35*)(C))->a134)+((T4)(geint32(10)))));
				((T35*)(C))->a135 = (T76f2(((T35*)(C))->a136, ((T35*)(C))->a135, ((T35*)(C))->a134));
			}
		}
		((T75*)(((T35*)(C))->a135))->a2[((T35*)(C))->a84] = (((T35*)(C))->a138);
		break;
	case (T4)(T4)(geint32(2)):
		((T35*)(C))->a85 = ((T4)((((T35*)(C))->a85)+((T4)(geint32(1)))));
		t2 = (T4f5(&(((T35*)(C))->a85), ((T35*)(C))->a139));
		if (t2) {
			t2 = ((((T35*)(C))->a140)==(EIF_VOID));
			if (t2) {
				((T35*)(C))->a141 = T78c3();
				((T35*)(C))->a139 = ((T4)(geint32(10)));
				((T35*)(C))->a140 = (T78f1(((T35*)(C))->a141, ((T35*)(C))->a139));
			} else {
				((T35*)(C))->a139 = ((T4)((((T35*)(C))->a139)+((T4)(geint32(10)))));
				((T35*)(C))->a140 = (T78f2(((T35*)(C))->a141, ((T35*)(C))->a140, ((T35*)(C))->a139));
			}
		}
		((T77*)(((T35*)(C))->a140))->a2[((T35*)(C))->a85] = (((T35*)(C))->a142);
		break;
	case (T4)(T4)(geint32(3)):
		((T35*)(C))->a86 = ((T4)((((T35*)(C))->a86)+((T4)(geint32(1)))));
		t2 = (T4f5(&(((T35*)(C))->a86), ((T35*)(C))->a143));
		if (t2) {
			t2 = ((((T35*)(C))->a144)==(EIF_VOID));
			if (t2) {
				((T35*)(C))->a145 = T72c4();
				((T35*)(C))->a143 = ((T4)(geint32(10)));
				((T35*)(C))->a144 = (T72f1(((T35*)(C))->a145, ((T35*)(C))->a143));
			} else {
				((T35*)(C))->a143 = ((T4)((((T35*)(C))->a143)+((T4)(geint32(10)))));
				((T35*)(C))->a144 = (T72f2(((T35*)(C))->a145, ((T35*)(C))->a144, ((T35*)(C))->a143));
			}
		}
		((T71*)(((T35*)(C))->a144))->a2[((T35*)(C))->a86] = (((T35*)(C))->a146);
		break;
	case (T4)(T4)(geint32(4)):
		((T35*)(C))->a87 = ((T4)((((T35*)(C))->a87)+((T4)(geint32(1)))));
		t2 = (T4f5(&(((T35*)(C))->a87), ((T35*)(C))->a147));
		if (t2) {
			t2 = ((((T35*)(C))->a148)==(EIF_VOID));
			if (t2) {
				((T35*)(C))->a149 = T81c3();
				((T35*)(C))->a147 = ((T4)(geint32(10)));
				((T35*)(C))->a148 = (T81f1(((T35*)(C))->a149, ((T35*)(C))->a147));
			} else {
				((T35*)(C))->a147 = ((T4)((((T35*)(C))->a147)+((T4)(geint32(10)))));
				((T35*)(C))->a148 = (T81f2(((T35*)(C))->a149, ((T35*)(C))->a148, ((T35*)(C))->a147));
			}
		}
		((T80*)(((T35*)(C))->a148))->a2[((T35*)(C))->a87] = (((T35*)(C))->a150);
		break;
	default:
		T35f277(C);
		break;
	}
}

/* KL_SPECIAL_ROUTINES [STRING].make */
T0* T78f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T176c2(a1);
	R = (((T176*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [STRING].make_area */
T0* T176c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T176));
	((T176*)(C))->id = 176;
	((T176*)(C))->a1 = T77c4(a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [STRING].default_create */
T0* T78c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T78));
	((T78*)(C))->id = 78;
	return C;
}

/* LX_LEX_PARSER.accept */
void T35f278(T0* C)
{
	((T35*)(C))->a33 = ((T4)(geint32(101)));
}

/* LX_LEX_PARSER.abort */
void T35f277(T0* C)
{
	((T35*)(C))->a33 = ((T4)(geint32(102)));
}

/* LX_LEX_PARSER.yy_do_error_action */
void T35f276(T0* C, T4 a1)
{
	switch (a1) {
	case (T4)(T4)(geint32(80)):
		T35f290(C);
		break;
	default:
		T35f291(C, gems("parse error", 11));
		break;
	}
}

/* LX_LEX_PARSER.report_error */
void T35f291(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T86c7(t1, ((T35*)(C))->a24);
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* UT_SYNTAX_ERROR.make */
T0* T86c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T86));
	((T86*)(C))->id = 86;
	((T86*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(2)));
	T119f8(((T86*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T86*)(C))->a5, t1, (T4)(geint32(2)));
	return C;
}

/* LX_LEX_PARSER.report_eof_expected_error */
void T35f290(T0* C)
{
	T35f291(C, gems("parse error", 11));
}

/* LX_LEX_PARSER.read_token */
void T35f275(T0* C)
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
	((T35*)(C))->a55 = ((T4)(geint32(-2)));
	l7 = ((T4)(geint32(1)));
	t1 = ((((T35*)(C))->a55)!=((T4)(geint32(-2))));
	while (!(t1)) {
		switch (l7) {
		case (T4)(T4)(geint32(1)):
			if (((T35*)(C))->a95) {
				((T35*)(C))->a96 = ((T4)((((T35*)(C))->a29)-(((T35*)(C))->a83)));
				((T35*)(C))->a95 = (EIF_FALSE);
			} else {
				((T35*)(C))->a96 = ((T4)(geint32(0)));
				((T35*)(C))->a97 = (((T35*)(C))->a31);
				((T35*)(C))->a98 = (((T35*)(C))->a32);
				((T35*)(C))->a99 = (((T35*)(C))->a30);
			}
			l1 = (((T35*)(C))->a29);
			l2 = (l1);
			t1 = ((((((T35*)(C))->a28)->id==66)?((T66*)(((T35*)(C))->a28))->a6:((T67*)(((T35*)(C))->a28))->a6));
			if (t1) {
				l3 = ((T4)((((T35*)(C))->a100)+((T4)(geint32(1)))));
			} else {
				l3 = (((T35*)(C))->a100);
			}
			if (EIF_FALSE) {
				((T71*)(((T35*)(C))->a102))->a2[(T4)(geint32(0))] = (l3);
				((T35*)(C))->a103 = ((T4)(geint32(1)));
			}
			l7 = ((T4)(geint32(2)));
			break;
		case (T4)(T4)(geint32(2)):
			l13 = (EIF_FALSE);
			while (!(l13)) {
				t1 = ((((T35*)(C))->a104)!=(EIF_VOID));
				if (t1) {
					t1 = ((((T35*)(C))->a105)!=(EIF_VOID));
					if (t1) {
						t2 = (((T15*)(((T35*)(C))->a105))->a2[l1]);
						t3 = ((T4)(t2));
						l8 = (((T71*)(((T35*)(C))->a104))->a2[t3]);
					} else {
						t2 = (T216f1(((T35*)(C))->a106, l1));
						t3 = ((T4)(t2));
						l8 = (((T71*)(((T35*)(C))->a104))->a2[t3]);
					}
				} else {
					t1 = ((((T35*)(C))->a105)!=(EIF_VOID));
					if (t1) {
						t2 = (((T15*)(((T35*)(C))->a105))->a2[l1]);
						l8 = ((T4)(t2));
					} else {
						t2 = (T216f1(((T35*)(C))->a106, l1));
						l8 = ((T4)(t2));
					}
				}
				t1 = EIF_FALSE;
				t1 = ((T2)(!(t1)));
				if (t1) {
					t3 = (((T71*)(((T35*)(C))->a107))->a2[l3]);
					t1 = ((t3)!=((T4)(geint32(0))));
				}
				if (t1) {
					((T35*)(C))->a108 = (l3);
					((T35*)(C))->a109 = (l1);
				}
				t3 = (((T71*)(((T35*)(C))->a111))->a2[l3]);
				t3 = ((T4)((t3)+(l8)));
				t3 = (((T71*)(((T35*)(C))->a110))->a2[t3]);
				t1 = ((t3)==(l3));
				while (!(t1)) {
					l3 = (((T71*)(((T35*)(C))->a112))->a2[l3]);
					t1 = ((((T35*)(C))->a113)!=(EIF_VOID));
					if (t1) {
						t1 = (T4f5(&l3, (T4)(geint32(471))));
					}
					if (t1) {
						l8 = (((T71*)(((T35*)(C))->a113))->a2[l8]);
					}
					t3 = (((T71*)(((T35*)(C))->a111))->a2[l3]);
					t3 = ((T4)((t3)+(l8)));
					t3 = (((T71*)(((T35*)(C))->a110))->a2[t3]);
					t1 = ((t3)==(l3));
				}
				t3 = (((T71*)(((T35*)(C))->a111))->a2[l3]);
				t3 = ((T4)((t3)+(l8)));
				l3 = (((T71*)(((T35*)(C))->a115))->a2[t3]);
				if (EIF_FALSE) {
					((T71*)(((T35*)(C))->a102))->a2[((T35*)(C))->a103] = (l3);
					((T35*)(C))->a103 = ((T4)((((T35*)(C))->a103)+((T4)(geint32(1)))));
				}
				l1 = ((T4)((l1)+((T4)(geint32(1)))));
				l13 = ((l3)==((T4)(geint32(470))));
			}
			t1 = EIF_FALSE;
			t1 = ((T2)(!(t1)));
			if (t1) {
				l1 = (((T35*)(C))->a109);
				l3 = (((T35*)(C))->a108);
			}
			l7 = ((T4)(geint32(3)));
			break;
		case (T4)(T4)(geint32(3)):
			t1 = EIF_FALSE;
			t1 = ((T2)(!(t1)));
			if (t1) {
				l6 = (((T71*)(((T35*)(C))->a107))->a2[l3]);
				l7 = ((T4)(geint32(4)));
			} else {
				((T35*)(C))->a103 = ((T4)((((T35*)(C))->a103)-((T4)(geint32(1)))));
				l3 = (((T71*)(((T35*)(C))->a102))->a2[((T35*)(C))->a103]);
				((T35*)(C))->a117 = (((T71*)(((T35*)(C))->a107))->a2[l3]);
				l7 = ((T4)(geint32(5)));
			}
			break;
		case (T4)(T4)(geint32(5)):
			l9 = (EIF_FALSE);
			while (!(l9)) {
				t1 = ((((T35*)(C))->a117)!=((T4)(geint32(0))));
				if (t1) {
					t3 = ((T4)((l3)+((T4)(geint32(1)))));
					t3 = (((T71*)(((T35*)(C))->a107))->a2[t3]);
					t1 = ((T2)((((T35*)(C))->a117)<(t3)));
				}
				if (t1) {
					l6 = ((T4)gevoid(((T35*)(C))->a118, ((T35*)(C))->a117));
					if (EIF_FALSE) {
						t3 = (T4)(geint32(119));
						t3 = ((T4)(-(t3)));
						t1 = ((T2)((l6)<(t3)));
						if (!(t1)) {
							t1 = ((((T35*)(C))->a121)!=((T4)(geint32(0))));
						}
						if (t1) {
							t1 = ((l6)==(((T35*)(C))->a121));
							if (t1) {
								((T35*)(C))->a121 = ((T4)(geint32(0)));
								t3 = ((T4)(-(l6)));
								l6 = ((T4)((t3)-((T4)(geint32(119)))));
								l9 = (EIF_TRUE);
							} else {
								((T35*)(C))->a117 = ((T4)((((T35*)(C))->a117)+((T4)(geint32(1)))));
							}
						} else {
							t1 = ((T2)((l6)<((T4)(geint32(0)))));
							if (t1) {
								((T35*)(C))->a121 = ((T4)((l6)-((T4)(geint32(119)))));
								if (EIF_FALSE) {
									((T35*)(C))->a123 = (l1);
									((T35*)(C))->a124 = (((T35*)(C))->a103);
									((T35*)(C))->a125 = (((T35*)(C))->a117);
								}
								((T35*)(C))->a117 = ((T4)((((T35*)(C))->a117)+((T4)(geint32(1)))));
							} else {
								((T35*)(C))->a123 = (l1);
								((T35*)(C))->a124 = (((T35*)(C))->a103);
								((T35*)(C))->a125 = (((T35*)(C))->a117);
								l9 = (EIF_TRUE);
							}
						}
					} else {
						((T35*)(C))->a123 = (l1);
						l9 = (EIF_TRUE);
					}
				} else {
					l1 = ((T4)((l1)-((T4)(geint32(1)))));
					((T35*)(C))->a103 = ((T4)((((T35*)(C))->a103)-((T4)(geint32(1)))));
					l3 = (((T71*)(((T35*)(C))->a102))->a2[((T35*)(C))->a103]);
					((T35*)(C))->a117 = (((T71*)(((T35*)(C))->a107))->a2[l3]);
				}
			}
			l10 = (((T35*)(C))->a31);
			l11 = (((T35*)(C))->a32);
			l12 = (((T35*)(C))->a30);
			l7 = ((T4)(geint32(4)));
			break;
		case (T4)(T4)(geint32(4)):
			l2 = ((T4)((l2)-(((T35*)(C))->a96)));
			((T35*)(C))->a83 = (l2);
			((T35*)(C))->a29 = (l1);
			l7 = ((T4)(geint32(1)));
			t1 = ((l6)==((T4)(geint32(0))));
			if (t1) {
				t1 = EIF_FALSE;
				t1 = ((T2)(!(t1)));
				if (t1) {
					l1 = (((T35*)(C))->a109);
					l2 = ((T4)((l2)+(((T35*)(C))->a96)));
					l3 = (((T35*)(C))->a108);
					l7 = ((T4)(geint32(3)));
				} else {
					((T35*)(C))->a55 = ((T4)(geint32(-1)));
					T35f286(C, gems("fatal scanner internal error: no action found", 45));
				}
			} else {
				t1 = ((l6)==((T4)(geint32(120))));
				if (t1) {
					t3 = ((T4)((l1)-(l2)));
					l5 = ((T4)((t3)-((T4)(geint32(1)))));
					t3 = ((((((T35*)(C))->a28)->id==66)?((T66*)(((T35*)(C))->a28))->a7:((T67*)(((T35*)(C))->a28))->a7));
					t3 = ((T4)((t3)+((T4)(geint32(1)))));
					t1 = (T4f6(&(((T35*)(C))->a29), t3));
					if (t1) {
						((T35*)(C))->a29 = ((T4)((l2)+(l5)));
						l3 = (T35f128(C));
						l4 = (T35f129(C, l3));
						l2 = ((T4)((l2)+(((T35*)(C))->a96)));
						t1 = ((l4)!=((T4)(geint32(0))));
						if (t1) {
							l1 = ((T4)((((T35*)(C))->a29)+((T4)(geint32(1)))));
							((T35*)(C))->a29 = (l1);
							l3 = (l4);
							l7 = ((T4)(geint32(2)));
						} else {
							if (EIF_FALSE) {
								l1 = (((T35*)(C))->a29);
								((T35*)(C))->a103 = ((T4)((((T35*)(C))->a103)-((T4)(geint32(1)))));
							} else {
								l1 = (((T35*)(C))->a109);
								l3 = (((T35*)(C))->a108);
							}
							l7 = ((T4)(geint32(3)));
						}
					} else {
						((T35*)(C))->a29 = ((T4)((((T35*)(C))->a29)-((T4)(geint32(1)))));
						T35f287(C);
						t1 = ((((((T35*)(C))->a28)->id==66)?((T66*)(((T35*)(C))->a28))->a8:((T67*)(((T35*)(C))->a28))->a8));
						if (t1) {
							l3 = (T35f128(C));
							l1 = (((T35*)(C))->a29);
							l2 = ((T4)((((T35*)(C))->a83)+(((T35*)(C))->a96)));
							l7 = ((T4)(geint32(2)));
						} else {
							t3 = ((T4)((((T35*)(C))->a29)-(((T35*)(C))->a83)));
							t3 = ((T4)((t3)-(((T35*)(C))->a96)));
							t1 = ((t3)!=((T4)(geint32(0))));
							if (t1) {
								l3 = (T35f128(C));
								l1 = (((T35*)(C))->a29);
								l2 = ((T4)((((T35*)(C))->a83)+(((T35*)(C))->a96)));
								l7 = ((T4)(geint32(3)));
							} else {
								t1 = (T35f130(C));
								if (t1) {
									l2 = (((T35*)(C))->a83);
									l1 = (((T35*)(C))->a29);
									t3 = ((T4)((((T35*)(C))->a100)-((T4)(geint32(1)))));
									t3 = ((T4)((t3)/((T4)(geint32(2)))));
									T35f288(C, t3);
								}
							}
						}
					}
				} else {
					T35f289(C, l6);
					if (((T35*)(C))->a131) {
						((T35*)(C))->a131 = (EIF_FALSE);
						((T35*)(C))->a31 = (l10);
						((T35*)(C))->a32 = (l11);
						((T35*)(C))->a30 = (l12);
						l1 = (((T35*)(C))->a123);
						if (EIF_FALSE) {
							((T35*)(C))->a117 = (((T35*)(C))->a125);
							((T35*)(C))->a103 = (((T35*)(C))->a124);
							t3 = ((T4)((((T35*)(C))->a103)-((T4)(geint32(1)))));
							l3 = (((T71*)(((T35*)(C))->a102))->a2[t3]);
						}
						((T35*)(C))->a117 = ((T4)((((T35*)(C))->a117)+((T4)(geint32(1)))));
						l7 = ((T4)(geint32(5)));
					}
				}
			}
			break;
		default:
			break;
		}
		t1 = ((((T35*)(C))->a55)!=((T4)(geint32(-2))));
	}
}

/* LX_LEX_PARSER.yy_execute_action */
void T35f289(T0* C, T4 a1)
{
	T2 t1;
	T4 t2;
	T0* t3;
	T1 t4;
	t1 = (T4f6(&a1, (T4)(geint32(60))));
	if (t1) {
		t1 = (T4f6(&a1, (T4)(geint32(30))));
		if (t1) {
			t1 = (T4f6(&a1, (T4)(geint32(15))));
			if (t1) {
				t1 = (T4f6(&a1, (T4)(geint32(8))));
				if (t1) {
					t1 = (T4f6(&a1, (T4)(geint32(4))));
					if (t1) {
						t1 = (T4f6(&a1, (T4)(geint32(2))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(1))));
							if (t1) {
							} else {
								((T35*)(C))->a24 = ((T4)((((T35*)(C))->a24)+((T4)(geint32(1)))));
							}
						} else {
							t1 = ((a1)==((T4)(geint32(3))));
							if (t1) {
								((T35*)(C))->a24 = ((T4)((((T35*)(C))->a24)+((T4)(geint32(1)))));
								T35f320(C, (T4)(geint32(3)));
							} else {
								T35f320(C, (T4)(geint32(6)));
							}
						}
					} else {
						t1 = (T4f6(&a1, (T4)(geint32(6))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(5))));
							if (t1) {
								T35f320(C, (T4)(geint32(7)));
							} else {
								T35f320(C, (T4)(geint32(4)));
							}
						} else {
							t1 = ((a1)==((T4)(geint32(7))));
							if (t1) {
								((T35*)(C))->a189 = (T35f190(C));
								T35f320(C, (T4)(geint32(12)));
							} else {
								((T35*)(C))->a55 = ((T4)(geint32(258)));
								T35f320(C, (T4)(geint32(1)));
							}
						}
					}
				} else {
					t1 = (T4f6(&a1, (T4)(geint32(12))));
					if (t1) {
						t1 = (T4f6(&a1, (T4)(geint32(10))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(9))));
							if (t1) {
								T35f321(C);
								T35f320(C, (T4)(geint32(5)));
							} else {
								T35f322(C);
								T35f320(C, (T4)(geint32(5)));
							}
						} else {
							t1 = ((a1)==((T4)(geint32(11))));
							if (t1) {
								T35f323(C);
							} else {
								T35f323(C);
							}
						}
					} else {
						t1 = (T4f6(&a1, (T4)(geint32(14))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(13))));
							if (t1) {
								T35f323(C);
							} else {
								T35f323(C);
							}
						} else {
							T35f323(C);
						}
					}
				}
			} else {
				t1 = (T4f6(&a1, (T4)(geint32(23))));
				if (t1) {
					t1 = (T4f6(&a1, (T4)(geint32(19))));
					if (t1) {
						t1 = (T4f6(&a1, (T4)(geint32(17))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(16))));
							if (t1) {
								t2 = (T35f195(C));
								t2 = ((T4)((t2)-((T4)(geint32(2)))));
								((T35*)(C))->a189 = (T35f196(C, (T4)(geint32(1)), t2));
								t2 = (T16f11(((T35*)(C))->a189, (T1)('\n')));
								((T35*)(C))->a24 = ((T4)((((T35*)(C))->a24)+(t2)));
								t3 = (((T22*)(((T35*)(C))->a16))->a18);
								T62f11(t3, ((T35*)(C))->a189);
								T35f320(C, (T4)(geint32(0)));
							} else {
							}
						} else {
							t1 = ((a1)==((T4)(geint32(18))));
							if (t1) {
								t3 = (T35f190(C));
								t2 = (T35f198(C));
								t1 = ((t2)==((T4)(geint32(7))));
								T35f324(C, t3, t1);
							} else {
								((T35*)(C))->a24 = ((T4)((((T35*)(C))->a24)+((T4)(geint32(1)))));
								T35f320(C, (T4)(geint32(0)));
							}
						}
					} else {
						t1 = (T4f6(&a1, (T4)(geint32(21))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(20))));
							if (t1) {
								T35f325(C);
								T35f320(C, (T4)(geint32(5)));
							} else {
							}
						} else {
							t1 = ((a1)==((T4)(geint32(22))));
							if (t1) {
								T22f38(((T35*)(C))->a16, EIF_TRUE);
							} else {
								T22f38(((T35*)(C))->a16, EIF_FALSE);
							}
						}
					}
				} else {
					t1 = (T4f6(&a1, (T4)(geint32(27))));
					if (t1) {
						t1 = (T4f6(&a1, (T4)(geint32(25))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(24))));
							if (t1) {
								T22f43(((T35*)(C))->a16, EIF_FALSE);
							} else {
								T22f43(((T35*)(C))->a16, EIF_TRUE);
							}
						} else {
							t1 = ((a1)==((T4)(geint32(26))));
							if (t1) {
								T22f42(((T35*)(C))->a16, EIF_TRUE);
							} else {
								T22f42(((T35*)(C))->a16, EIF_FALSE);
							}
						}
					} else {
						t1 = (T4f6(&a1, (T4)(geint32(29))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(28))));
							if (t1) {
								T22f44(((T35*)(C))->a16, EIF_FALSE);
							} else {
								T22f44(((T35*)(C))->a16, EIF_TRUE);
							}
						} else {
							T22f39(((T35*)(C))->a16, EIF_TRUE);
						}
					}
				}
			}
		} else {
			t1 = (T4f6(&a1, (T4)(geint32(45))));
			if (t1) {
				t1 = (T4f6(&a1, (T4)(geint32(38))));
				if (t1) {
					t1 = (T4f6(&a1, (T4)(geint32(34))));
					if (t1) {
						t1 = (T4f6(&a1, (T4)(geint32(32))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(31))));
							if (t1) {
								T22f39(((T35*)(C))->a16, EIF_FALSE);
							} else {
								T22f41(((T35*)(C))->a16, EIF_TRUE);
							}
						} else {
							t1 = ((a1)==((T4)(geint32(33))));
							if (t1) {
								T22f41(((T35*)(C))->a16, EIF_FALSE);
							} else {
								T22f40(((T35*)(C))->a16, EIF_TRUE);
							}
						}
					} else {
						t1 = (T4f6(&a1, (T4)(geint32(36))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(35))));
							if (t1) {
								T22f40(((T35*)(C))->a16, EIF_FALSE);
							} else {
								T22f51(((T35*)(C))->a16, EIF_TRUE);
							}
						} else {
							t1 = ((a1)==((T4)(geint32(37))));
							if (t1) {
								T22f51(((T35*)(C))->a16, EIF_FALSE);
							} else {
								T22f52(((T35*)(C))->a16, EIF_TRUE);
							}
						}
					}
				} else {
					t1 = (T4f6(&a1, (T4)(geint32(42))));
					if (t1) {
						t1 = (T4f6(&a1, (T4)(geint32(40))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(39))));
							if (t1) {
								T22f52(((T35*)(C))->a16, EIF_FALSE);
							} else {
								T22f53(((T35*)(C))->a16, EIF_TRUE);
							}
						} else {
							t1 = ((a1)==((T4)(geint32(41))));
							if (t1) {
								T22f53(((T35*)(C))->a16, EIF_FALSE);
							} else {
								T22f54(((T35*)(C))->a16, EIF_TRUE);
							}
						}
					} else {
						t1 = (T4f6(&a1, (T4)(geint32(44))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(43))));
							if (t1) {
								T22f54(((T35*)(C))->a16, EIF_FALSE);
							} else {
								T22f55(((T35*)(C))->a16, EIF_TRUE);
							}
						} else {
							T22f55(((T35*)(C))->a16, EIF_FALSE);
						}
					}
				}
			} else {
				t1 = (T4f6(&a1, (T4)(geint32(53))));
				if (t1) {
					t1 = (T4f6(&a1, (T4)(geint32(49))));
					if (t1) {
						t1 = (T4f6(&a1, (T4)(geint32(47))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(46))));
							if (t1) {
								T22f56(((T35*)(C))->a16, EIF_TRUE);
							} else {
								T22f56(((T35*)(C))->a16, EIF_FALSE);
							}
						} else {
							t1 = ((a1)==((T4)(geint32(48))));
							if (t1) {
								T22f57(((T35*)(C))->a16, EIF_TRUE);
							} else {
								T22f57(((T35*)(C))->a16, EIF_FALSE);
							}
						}
					} else {
						t1 = (T4f6(&a1, (T4)(geint32(51))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(50))));
							if (t1) {
								T22f45(((T35*)(C))->a16, EIF_FALSE);
							} else {
								T22f45(((T35*)(C))->a16, EIF_TRUE);
							}
						} else {
							t1 = ((a1)==((T4)(geint32(52))));
							if (t1) {
								T35f320(C, (T4)(geint32(15)));
							} else {
								((T35*)(C))->a24 = ((T4)((((T35*)(C))->a24)+((T4)(geint32(1)))));
								T35f320(C, (T4)(geint32(0)));
							}
						}
					}
				} else {
					t1 = (T4f6(&a1, (T4)(geint32(57))));
					if (t1) {
						t1 = (T4f6(&a1, (T4)(geint32(55))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(54))));
							if (t1) {
								t3 = (T35f190(C));
								T35f326(C, t3);
								T35f320(C, (T4)(geint32(5)));
							} else {
								t2 = (T35f195(C));
								t2 = ((T4)((t2)-((T4)(geint32(1)))));
								t3 = (T35f196(C, (T4)(geint32(2)), t2));
								T22f36(((T35*)(C))->a16, t3);
								T35f320(C, (T4)(geint32(4)));
							}
						} else {
							t1 = ((a1)==((T4)(geint32(56))));
							if (t1) {
								T22f36(((T35*)(C))->a16, EIF_VOID);
								T35f327(C);
								T35f320(C, (T4)(geint32(5)));
							} else {
							}
						}
					} else {
						t1 = (T4f6(&a1, (T4)(geint32(59))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(58))));
							if (t1) {
								t3 = (T35f190(C));
								T35f328(C, ((T35*)(C))->a189, t3);
								T35f320(C, (T4)(geint32(0)));
							} else {
								((T35*)(C))->a24 = ((T4)((((T35*)(C))->a24)+((T4)(geint32(1)))));
								T35f329(C);
								T35f320(C, (T4)(geint32(0)));
							}
						} else {
							T35f320(C, (T4)(geint32(0)));
						}
					}
				}
			}
		}
	} else {
		t1 = (T4f6(&a1, (T4)(geint32(90))));
		if (t1) {
			t1 = (T4f6(&a1, (T4)(geint32(75))));
			if (t1) {
				t1 = (T4f6(&a1, (T4)(geint32(68))));
				if (t1) {
					t1 = (T4f6(&a1, (T4)(geint32(64))));
					if (t1) {
						t1 = (T4f6(&a1, (T4)(geint32(62))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(61))));
							if (t1) {
								((T35*)(C))->a24 = ((T4)((((T35*)(C))->a24)+((T4)(geint32(1)))));
								T35f320(C, (T4)(geint32(0)));
							} else {
							}
						} else {
							t1 = ((a1)==((T4)(geint32(63))));
							if (t1) {
								((T35*)(C))->a24 = ((T4)((((T35*)(C))->a24)+((T4)(geint32(1)))));
							} else {
								((T35*)(C))->a55 = ((T4)(geint32(258)));
								T35f320(C, (T4)(geint32(2)));
							}
						}
					} else {
						t1 = (T4f6(&a1, (T4)(geint32(66))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(65))));
							if (t1) {
								((T35*)(C))->a55 = ((T4)(geint32(94)));
								((T35*)(C))->a202 = (((T35*)(C))->a24);
								T35f320(C, (T4)(geint32(16)));
							} else {
								((T35*)(C))->a55 = ((T4)(geint32(123)));
							}
						} else {
							t1 = ((a1)==((T4)(geint32(67))));
							if (t1) {
								((T35*)(C))->a55 = ((T4)(geint32(125)));
							} else {
								((T35*)(C))->a55 = ((T4)(geint32(60)));
								T35f320(C, (T4)(geint32(10)));
							}
						}
					}
				} else {
					t1 = (T4f6(&a1, (T4)(geint32(72))));
					if (t1) {
						t1 = (T4f6(&a1, (T4)(geint32(70))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(69))));
							if (t1) {
								T35f330(C, (T4)(geint32(0)));
								((T35*)(C))->a202 = (((T35*)(C))->a24);
								T35f320(C, (T4)(geint32(16)));
							} else {
								((T35*)(C))->a55 = ((T4)(geint32(34)));
								T35f320(C, (T4)(geint32(9)));
							}
						} else {
							t1 = ((a1)==((T4)(geint32(71))));
							if (t1) {
								((T35*)(C))->a29 = ((T4)((((T35*)(C))->a29)-((T4)(geint32(1)))));
								((T35*)(C))->a55 = ((T4)(geint32(36)));
							} else {
								t3 = (T35f190(C));
								((T35*)(C))->a189 = (T16f12(t3));
								t1 = (T68f1(((T35*)(C))->a19, ((T35*)(C))->a189));
								if (t1) {
									t3 = (T68f2(((T35*)(C))->a19, ((T35*)(C))->a189));
									T35f331(C, t3);
								} else {
									t3 = (T35f190(C));
									T35f332(C, t3);
								}
							}
						}
					} else {
						t1 = (T4f6(&a1, (T4)(geint32(74))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(73))));
							if (t1) {
								((T35*)(C))->a55 = ((T4)(geint32(123)));
								T35f320(C, (T4)(geint32(8)));
							} else {
								((T35*)(C))->a189 = (T35f190(C));
								t1 = (T70f1(((T35*)(C))->a22, ((T35*)(C))->a189));
								if (t1) {
									((T35*)(C))->a55 = ((T4)(geint32(266)));
									((T35*)(C))->a150 = (T70f2(((T35*)(C))->a22, ((T35*)(C))->a189));
								} else {
									((T35*)(C))->a55 = ((T4)(geint32(91)));
									((T35*)(C))->a142 = (((T35*)(C))->a189);
									T35f330(C, (T4)(geint32(1)));
									T35f320(C, (T4)(geint32(13)));
								}
							}
						} else {
							T35f333(C);
							((T35*)(C))->a55 = ((T4)(geint32(264)));
							t4 = (T35f216(C, (T4)(geint32(1))));
							t2 = ((T4)(t4));
							T35f334(C, t2);
						}
					}
				}
			} else {
				t1 = (T4f6(&a1, (T4)(geint32(83))));
				if (t1) {
					t1 = (T4f6(&a1, (T4)(geint32(79))));
					if (t1) {
						t1 = (T4f6(&a1, (T4)(geint32(77))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(76))));
							if (t1) {
								((T35*)(C))->a55 = ((T4)(geint32(259)));
							} else {
								t4 = (T35f216(C, (T4)(geint32(1))));
								((T35*)(C))->a55 = ((T4)(t4));
							}
						} else {
							t1 = ((a1)==((T4)(geint32(78))));
							if (t1) {
								T35f320(C, (T4)(geint32(11)));
							} else {
								((T35*)(C))->a24 = ((T4)((((T35*)(C))->a24)+((T4)(geint32(1)))));
								((T35*)(C))->a55 = ((T4)(geint32(261)));
								T35f320(C, (T4)(geint32(1)));
							}
						}
					} else {
						t1 = (T4f6(&a1, (T4)(geint32(81))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(80))));
							if (t1) {
								((T35*)(C))->a55 = ((T4)(geint32(264)));
								t4 = (T35f216(C, (T4)(geint32(1))));
								t2 = ((T4)(t4));
								T35f334(C, t2);
							} else {
							}
						} else {
							t1 = ((a1)==((T4)(geint32(82))));
							if (t1) {
								((T35*)(C))->a24 = ((T4)((((T35*)(C))->a24)+((T4)(geint32(1)))));
							} else {
								((T35*)(C))->a55 = ((T4)(geint32(44)));
							}
						}
					}
				} else {
					t1 = (T4f6(&a1, (T4)(geint32(87))));
					if (t1) {
						t1 = (T4f6(&a1, (T4)(geint32(85))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(84))));
							if (t1) {
								((T35*)(C))->a55 = ((T4)(geint32(42)));
							} else {
								((T35*)(C))->a55 = ((T4)(geint32(62)));
								T35f320(C, (T4)(geint32(1)));
							}
						} else {
							t1 = ((a1)==((T4)(geint32(86))));
							if (t1) {
								((T35*)(C))->a55 = ((T4)(geint32(263)));
								((T35*)(C))->a142 = (T35f190(C));
							} else {
								t3 = (T35f190(C));
								T35f335(C, t3);
							}
						}
					} else {
						t1 = (T4f6(&a1, (T4)(geint32(89))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(88))));
							if (t1) {
							} else {
								((T35*)(C))->a55 = ((T4)(geint32(265)));
								t3 = (T35f190(C));
								((T35*)(C))->a146 = (T16f10(t3));
							}
						} else {
							((T35*)(C))->a55 = ((T4)(geint32(44)));
						}
					}
				}
			}
		} else {
			t1 = (T4f6(&a1, (T4)(geint32(105))));
			if (t1) {
				t1 = (T4f6(&a1, (T4)(geint32(98))));
				if (t1) {
					t1 = (T4f6(&a1, (T4)(geint32(94))));
					if (t1) {
						t1 = (T4f6(&a1, (T4)(geint32(92))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(91))));
							if (t1) {
								((T35*)(C))->a55 = ((T4)(geint32(125)));
								T35f320(C, (T4)(geint32(16)));
							} else {
								T35f336(C);
								((T35*)(C))->a55 = ((T4)(geint32(125)));
								T35f320(C, (T4)(geint32(16)));
							}
						} else {
							t1 = ((a1)==((T4)(geint32(93))));
							if (t1) {
								T35f337(C);
								((T35*)(C))->a24 = ((T4)((((T35*)(C))->a24)+((T4)(geint32(1)))));
								((T35*)(C))->a55 = ((T4)(geint32(125)));
								T35f320(C, (T4)(geint32(16)));
							} else {
								t4 = (T35f216(C, (T4)(geint32(1))));
								t2 = ((T4)(t4));
								T35f334(C, t2);
								((T35*)(C))->a55 = ((T4)(geint32(264)));
							}
						}
					} else {
						t1 = (T4f6(&a1, (T4)(geint32(96))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(95))));
							if (t1) {
								((T35*)(C))->a55 = ((T4)(geint32(34)));
								T35f320(C, (T4)(geint32(16)));
							} else {
								T35f327(C);
								((T35*)(C))->a24 = ((T4)((((T35*)(C))->a24)+((T4)(geint32(1)))));
								((T35*)(C))->a55 = ((T4)(geint32(34)));
								T35f320(C, (T4)(geint32(16)));
							}
						} else {
							t1 = ((a1)==((T4)(geint32(97))));
							if (t1) {
								((T35*)(C))->a55 = ((T4)(geint32(264)));
								T35f338(C);
								t2 = (T35f198(C));
								t1 = ((t2)==((T4)(geint32(13))));
								if (t1) {
									T35f320(C, (T4)(geint32(14)));
								}
							} else {
								((T35*)(C))->a29 = ((T4)((((T35*)(C))->a29)-((T4)(geint32(1)))));
								T35f320(C, (T4)(geint32(14)));
								((T35*)(C))->a55 = ((T4)(geint32(94)));
							}
						}
					}
				} else {
					t1 = (T4f6(&a1, (T4)(geint32(102))));
					if (t1) {
						t1 = (T4f6(&a1, (T4)(geint32(100))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(99))));
							if (t1) {
								((T35*)(C))->a29 = ((T4)((((T35*)(C))->a29)-((T4)(geint32(1)))));
								((T35*)(C))->a55 = ((T4)(geint32(94)));
							} else {
								((T35*)(C))->a55 = ((T4)(geint32(264)));
								t4 = (T35f216(C, (T4)(geint32(1))));
								t2 = ((T4)(t4));
								T35f334(C, t2);
								T35f320(C, (T4)(geint32(14)));
							}
						} else {
							t1 = ((a1)==((T4)(geint32(101))));
							if (t1) {
								T35f333(C);
								((T35*)(C))->a24 = ((T4)((((T35*)(C))->a24)+((T4)(geint32(1)))));
								((T35*)(C))->a55 = ((T4)(geint32(93)));
								T35f320(C, (T4)(geint32(16)));
							} else {
								((T35*)(C))->a29 = ((T4)((((T35*)(C))->a29)-((T4)(geint32(1)))));
								((T35*)(C))->a55 = ((T4)(geint32(45)));
							}
						}
					} else {
						t1 = (T4f6(&a1, (T4)(geint32(104))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(103))));
							if (t1) {
								((T35*)(C))->a55 = ((T4)(geint32(264)));
								t4 = (T35f216(C, (T4)(geint32(1))));
								t2 = ((T4)(t4));
								T35f334(C, t2);
							} else {
								((T35*)(C))->a55 = ((T4)(geint32(93)));
								T35f320(C, (T4)(geint32(16)));
							}
						} else {
							T35f333(C);
							((T35*)(C))->a24 = ((T4)((((T35*)(C))->a24)+((T4)(geint32(1)))));
							((T35*)(C))->a55 = ((T4)(geint32(93)));
							T35f320(C, (T4)(geint32(16)));
						}
					}
				}
			} else {
				t1 = (T4f6(&a1, (T4)(geint32(112))));
				if (t1) {
					t1 = (T4f6(&a1, (T4)(geint32(109))));
					if (t1) {
						t1 = (T4f6(&a1, (T4)(geint32(107))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(106))));
							if (t1) {
								((T35*)(C))->a55 = ((T4)(geint32(260)));
								T35f320(C, (T4)(geint32(1)));
							} else {
								((T35*)(C))->a55 = ((T4)(geint32(261)));
								((T35*)(C))->a24 = ((T4)((((T35*)(C))->a24)+((T4)(geint32(1)))));
								T35f320(C, (T4)(geint32(1)));
							}
						} else {
							t1 = ((a1)==((T4)(geint32(108))));
							if (t1) {
								T35f320(C, (T4)(geint32(17)));
							} else {
								((T35*)(C))->a55 = ((T4)(geint32(262)));
								((T35*)(C))->a142 = (T35f190(C));
								T35f320(C, (T4)(geint32(1)));
							}
						}
					} else {
						t1 = (T4f6(&a1, (T4)(geint32(111))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(110))));
							if (t1) {
								T35f323(C);
							} else {
								T35f323(C);
							}
						} else {
							T35f323(C);
						}
					}
				} else {
					t1 = (T4f6(&a1, (T4)(geint32(116))));
					if (t1) {
						t1 = (T4f6(&a1, (T4)(geint32(114))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(113))));
							if (t1) {
								T35f323(C);
							} else {
								T35f323(C);
							}
						} else {
							t1 = ((a1)==((T4)(geint32(115))));
							if (t1) {
								((T35*)(C))->a231 = ((T4)((((T35*)(C))->a231)+((T4)(geint32(1)))));
								T35f323(C);
							} else {
								t1 = ((((T35*)(C))->a231)==((T4)(geint32(0))));
								if (t1) {
									((T35*)(C))->a55 = ((T4)(geint32(262)));
									t2 = (T35f195(C));
									t2 = ((T4)((t2)-((T4)(geint32(1)))));
									((T35*)(C))->a189 = (T35f196(C, (T4)(geint32(1)), t2));
									t2 = (T16f11(((T35*)(C))->a189, (T1)('\n')));
									((T35*)(C))->a24 = ((T4)((((T35*)(C))->a24)+(t2)));
									((T35*)(C))->a142 = (((T35*)(C))->a189);
									T35f320(C, (T4)(geint32(1)));
								} else {
									((T35*)(C))->a231 = ((T4)((((T35*)(C))->a231)-((T4)(geint32(1)))));
									T35f323(C);
								}
							}
						}
					} else {
						t1 = (T4f6(&a1, (T4)(geint32(118))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(117))));
							if (t1) {
								((T35*)(C))->a55 = ((T4)(geint32(262)));
								((T35*)(C))->a142 = (T35f190(C));
							} else {
								t4 = (T35f216(C, (T4)(geint32(1))));
								t1 = ((t4)==((T1)('\n')));
								if (t1) {
									T35f339(C, gems("\045N", 2));
									((T35*)(C))->a24 = ((T4)((((T35*)(C))->a24)+((T4)(geint32(1)))));
								} else {
									t3 = (T35f190(C));
									T35f339(C, t3);
								}
							}
						} else {
							((T35*)(C))->a55 = ((T4)(geint32(-1)));
							T35f286(C, gems("scanner jammed", 14));
						}
					}
				}
			}
		}
	}
	T35f340(C);
}

/* LX_LEX_PARSER.yy_set_beginning_of_line */
void T35f340(T0* C)
{
	T2 t1;
	T4 t2;
	T1 t3;
	t1 = (T4f1(&(((T35*)(C))->a29), ((T35*)(C))->a83));
	if (t1) {
		t1 = ((((T35*)(C))->a105)!=(EIF_VOID));
		if (t1) {
			t2 = ((T4)((((T35*)(C))->a29)-((T4)(geint32(1)))));
			t3 = (((T15*)(((T35*)(C))->a105))->a2[t2]);
			t1 = ((t3)==((T1)('\n')));
			if ((((T35*)(C))->a28)->id==66) {
				T66f20(((T35*)(C))->a28, t1);
			} else {
				T67f17(((T35*)(C))->a28, t1);
			}
		} else {
			t2 = ((T4)((((T35*)(C))->a29)-((T4)(geint32(1)))));
			t3 = (T216f1(((T35*)(C))->a106, t2));
			t1 = ((t3)==((T1)('\n')));
			if ((((T35*)(C))->a28)->id==66) {
				T66f20(((T35*)(C))->a28, t1);
			} else {
				T67f17(((T35*)(C))->a28, t1);
			}
		}
	}
}

/* YY_BUFFER.set_beginning_of_line */
void T67f17(T0* C, T2 a1)
{
	((T67*)(C))->a6 = (a1);
}

/* YY_FILE_BUFFER.set_beginning_of_line */
void T66f20(T0* C, T2 a1)
{
	((T66*)(C))->a6 = (a1);
}

/* LX_LEX_PARSER.report_bad_character_error */
void T35f339(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T105c7(t1, ((T35*)(C))->a24, a1);
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_BAD_CHARACTER_ERROR.make */
T0* T105c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T105));
	((T105*)(C))->id = 105;
	((T105*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(3)));
	T119f8(((T105*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T105*)(C))->a5, t1, (T4)(geint32(2)));
	T119f8(((T105*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* LX_LEX_PARSER.process_escaped_character */
void T35f338(T0* C)
{
	T1 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T2 t1;
	T4 t2;
	T1 t3;
	T4 t4;
	l1 = (T35f216(C, (T4)(geint32(2))));
	switch (l1) {
	case (T1)(T1)('b'):
		l2 = ((T4)(geint32(8)));
		break;
	case (T1)(T1)('f'):
		l2 = ((T4)(geint32(12)));
		break;
	case (T1)(T1)('n'):
		l2 = ((T4)(geint32(10)));
		break;
	case (T1)(T1)('r'):
		l2 = ((T4)(geint32(13)));
		break;
	case (T1)(T1)('t'):
		l2 = ((T4)(geint32(9)));
		break;
	case (T1)(T1)('a'):
		l2 = ((T4)(geint32(7)));
		break;
	case (T1)(T1)('v'):
		l2 = ((T4)(geint32(13)));
		break;
	case (T1)'0':
	case (T1)'1':
	case (T1)'2':
	case (T1)'3':
	case (T1)'4':
	case (T1)'5':
	case (T1)'6':
	case (T1)'7':
		l4 = (T35f195(C));
		l2 = ((T4)(geint32(0)));
		l3 = ((T4)(geint32(2)));
		t1 = (T4f1(&l3, l4));
		while (!(t1)) {
			t2 = ((T4)((l2)*((T4)(geint32(8)))));
			t3 = (T35f216(C, l3));
			t4 = ((T4)(t3));
			t2 = ((T4)((t2)+(t4)));
			l2 = ((T4)((t2)-((T4)(geint32(48)))));
			l3 = ((T4)((l3)+((T4)(geint32(1)))));
			t1 = (T4f1(&l3, l4));
		}
		break;
	case (T1)(T1)('x'):
	case (T1)(T1)('X'):
		l4 = (T35f195(C));
		t1 = ((l4)==((T4)(geint32(2))));
		if (t1) {
			l2 = ((T4)(l1));
		} else {
			l2 = ((T4)(geint32(0)));
			l3 = ((T4)(geint32(3)));
			t1 = (T4f1(&l3, l4));
			while (!(t1)) {
				l2 = ((T4)((l2)*((T4)(geint32(16)))));
				l1 = (T35f216(C, l3));
				switch (l1) {
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
					t2 = ((T4)(l1));
					t2 = ((T4)((l2)+(t2)));
					l2 = ((T4)((t2)-((T4)(geint32(48)))));
					break;
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
					t2 = ((T4)(l1));
					t2 = ((T4)((l2)+(t2)));
					t2 = ((T4)((t2)-((T4)(geint32(97)))));
					l2 = ((T4)((t2)+((T4)(geint32(10)))));
					break;
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
					t2 = ((T4)(l1));
					t2 = ((T4)((l2)+(t2)));
					t2 = ((T4)((t2)-((T4)(geint32(65)))));
					l2 = ((T4)((t2)+((T4)(geint32(10)))));
					break;
				default:
					break;
				}
				l3 = ((T4)((l3)+((T4)(geint32(1)))));
				t1 = (T4f1(&l3, l4));
			}
		}
		break;
	default:
		l2 = ((T4)(l1));
		break;
	}
	T35f334(C, l2);
}

/* LX_LEX_PARSER.report_missing_bracket_error */
void T35f337(T0* C)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T104c7(t1, ((T35*)(C))->a24);
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_MISSING_BRACKET_ERROR.make */
T0* T104c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T104));
	((T104*)(C))->id = 104;
	((T104*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(2)));
	T119f8(((T104*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T104*)(C))->a5, t1, (T4)(geint32(2)));
	return C;
}

/* LX_LEX_PARSER.report_bad_character_in_brackets_error */
void T35f336(T0* C)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T103c7(t1, ((T35*)(C))->a24);
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_BAD_CHARACTER_IN_BRACKETS_ERROR.make */
T0* T103c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T103));
	((T103*)(C))->id = 103;
	((T103*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(2)));
	T119f8(((T103*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T103*)(C))->a5, t1, (T4)(geint32(2)));
	return C;
}

/* STRING.to_integer */
T4 T16f10(T0* C)
{
	T4 R = 0;
	T0* t1;
	T4 t2;
	t1 = (T16f21(C));
	t2 = ((T4)(geint32(3)));
	T213f16(t1, C, t2);
	t1 = (T16f21(C));
	R = (T213f1(t1));
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
T4 T213f1(T0* C)
{
	T4 R = 0;
	T4 l1 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	l1 = ((T4)(((T213*)(C))->a2));
	l1 = ((T4)((l1)*((T4)(geint32(10)))));
	t1 = ((((T213*)(C))->a3)==((T4)(geint32(1))));
	if (t1) {
		t2 = ((T4)(-(l1)));
		t3 = ((T4)(((T213*)(C))->a4));
		R = ((T4)((t2)-(t3)));
	} else {
		t2 = ((T4)(((T213*)(C))->a4));
		R = ((T4)((l1)+(t2)));
	}
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
void T213f16(T0* C, T0* a1, T4 a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T1 t2;
	T213f21(C, a2);
	l1 = ((T4)(geint32(1)));
	l2 = (((T16*)(a1))->a2);
	t1 = (T4f1(&l1, l2));
	if (!(t1)) {
		t1 = ((((T213*)(C))->a6)==((T4)(geint32(4))));
	}
	if (!(t1)) {
		t1 = ((((T213*)(C))->a6)==((T4)(geint32(5))));
	}
	while (!(t1)) {
		t2 = (T16f7(a1, l1));
		T213f22(C, t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
		if (!(t1)) {
			t1 = ((((T213*)(C))->a6)==((T4)(geint32(4))));
		}
		if (!(t1)) {
			t1 = ((((T213*)(C))->a6)==((T4)(geint32(5))));
		}
	}
}

/* STRING_TO_INTEGER_CONVERTOR.parse_character */
void T213f22(T0* C, T1 a1)
{
	T11 l1 = 0;
	T11 l2 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	T11 t4;
	t1 = ((((T213*)(C))->a6)!=((T4)(geint32(4))));
	if (t1) {
		t1 = ((((T213*)(C))->a6)!=((T4)(geint32(5))));
	}
	if (t1) {
		t2 = (T4)(geint32(0));
		l1 = (T4f21(&t2));
		t2 = (T4)(geint32(0));
		l2 = (T4f21(&t2));
		switch (((T213*)(C))->a6) {
		case (T4)(T4)(geint32(0)):
			t1 = (T1f18(&a1));
			if (t1) {
				((T213*)(C))->a6 = ((T4)(geint32(2)));
				((T213*)(C))->a2 = ((T11)(genat64(0)));
				t2 = ((T4)(a1));
				t2 = ((T4)((t2)-((T4)(geint32(48)))));
				((T213*)(C))->a4 = (T4f21(&t2));
			} else {
				t1 = ((a1)==((T1)('-')));
				if (!(t1)) {
					t1 = ((a1)==((T1)('+')));
				}
				if (t1) {
					((T213*)(C))->a6 = ((T4)(geint32(1)));
					t1 = ((a1)==((T1)('-')));
					if (t1) {
						((T213*)(C))->a3 = ((T4)(geint32(1)));
					} else {
						((T213*)(C))->a3 = ((T4)(geint32(0)));
					}
				} else {
					if (((T213*)(C))->a9) {
						t1 = (T16f24(((T213*)(C))->a7, a1));
					} else {
						t1 = EIF_FALSE;
					}
					if (t1) {
					} else {
						((T213*)(C))->a6 = ((T4)(geint32(4)));
					}
				}
			}
			break;
		case (T4)(T4)(geint32(1)):
			t1 = (T1f18(&a1));
			if (t1) {
				((T213*)(C))->a2 = ((T11)(genat64(0)));
				t2 = ((T4)(a1));
				t2 = ((T4)((t2)-((T4)(geint32(48)))));
				((T213*)(C))->a4 = (T4f21(&t2));
				t1 = ((((T213*)(C))->a11)!=((T4)(geint32(0))));
				if (t1) {
					t3 = (T213f13(C));
					((T213*)(C))->a12 = (T228f1(t3, ((T213*)(C))->a2, ((T213*)(C))->a4, ((T213*)(C))->a11, ((T213*)(C))->a3));
					if (((T213*)(C))->a12) {
						((T213*)(C))->a2 = (l1);
						((T213*)(C))->a4 = (l2);
						((T213*)(C))->a6 = ((T4)(geint32(5)));
					}
				}
				((T213*)(C))->a6 = ((T4)(geint32(2)));
			} else {
				((T213*)(C))->a6 = ((T4)(geint32(4)));
			}
			break;
		case (T4)(T4)(geint32(2)):
			t1 = (T1f18(&a1));
			if (t1) {
				l1 = (((T213*)(C))->a2);
				l2 = (((T213*)(C))->a4);
				t4 = ((T11)((((T213*)(C))->a2)*((T11)(genat64(10)))));
				((T213*)(C))->a2 = ((T11)((t4)+(((T213*)(C))->a4)));
				t2 = ((T4)(a1));
				t2 = ((T4)((t2)-((T4)(geint32(48)))));
				((T213*)(C))->a4 = (T4f21(&t2));
				t1 = ((((T213*)(C))->a11)!=((T4)(geint32(0))));
				if (t1) {
					t3 = (T213f13(C));
					((T213*)(C))->a12 = (T228f1(t3, ((T213*)(C))->a2, ((T213*)(C))->a4, ((T213*)(C))->a11, ((T213*)(C))->a3));
					t1 = (T213f14(C));
					if (t1) {
						((T213*)(C))->a6 = ((T4)(geint32(5)));
						((T213*)(C))->a2 = (l1);
						((T213*)(C))->a4 = (l2);
					}
				}
			} else {
				if (((T213*)(C))->a10) {
					t1 = (T16f24(((T213*)(C))->a8, a1));
				} else {
					t1 = EIF_FALSE;
				}
				if (t1) {
					((T213*)(C))->a6 = ((T4)(geint32(3)));
				} else {
					((T213*)(C))->a6 = ((T4)(geint32(4)));
				}
			}
			break;
		case (T4)(T4)(geint32(3)):
			if (((T213*)(C))->a10) {
				t1 = (T16f24(((T213*)(C))->a8, a1));
			} else {
				t1 = EIF_FALSE;
			}
			if (t1) {
			} else {
				((T213*)(C))->a6 = ((T4)(geint32(4)));
			}
			break;
		default:
			break;
		}
	}
}

/* STRING_TO_INTEGER_CONVERTOR.overflowed */
T2 T213f14(T0* C)
{
	T2 R = 0;
	if (((T213*)(C))->a12) {
		R = ((((T213*)(C))->a3)==((T4)(geint32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* INTEGER_OVERFLOW_CHECKER.will_overflow */
T2 T228f1(T0* C, T11 a1, T11 a2, T4 a3, T4 a4)
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
			t3 = (T231f4(((T228*)(C))->a7, l1));
			t1 = (T11f4(&a1, t3));
			if (!(t1)) {
				t3 = (T231f4(((T228*)(C))->a7, l1));
				t1 = ((a1)==(t3));
				if (t1) {
					t3 = (T231f4(((T228*)(C))->a8, l1));
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
				t3 = (T231f4(((T228*)(C))->a10, l1));
				t1 = (T11f4(&a1, t3));
				if (!(t1)) {
					t3 = (T231f4(((T228*)(C))->a10, l1));
					t1 = ((a1)==(t3));
					if (t1) {
						t3 = (T231f4(((T228*)(C))->a11, l1));
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
T11 T231f4(T0* C, T4 a1)
{
	T11 R = 0;
	T4 t1;
	t1 = ((T4)((a1)-(((T231*)(C))->a2)));
	R = (((T230*)(((T231*)(C))->a1))->a2[t1]);
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
unsigned char ge525os6356 = '\0';
T0* ge525ov6356;
T0* T213f13(T0* C)
{
	T0* R = 0;
	if (ge525os6356) {
		return ge525ov6356;
	} else {
		ge525os6356 = '\1';
	}
	R = T228c13();
	ge525ov6356 = R;
	return R;
}

/* INTEGER_OVERFLOW_CHECKER.make */
T0* T228c13()
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
	C = (T0*)gealloc(sizeof(T228));
	((T228*)(C))->id = 228;
	t1 = (T4)(geint32(4));
	t1 = ((T4)((t1)*((T4)(geint32(2)))));
	((T228*)(C))->a7 = T231c5((T4)(geint32(1)), t1);
	t1 = (T4)(geint32(4));
	t1 = ((T4)((t1)*((T4)(geint32(2)))));
	((T228*)(C))->a8 = T231c5((T4)(geint32(1)), t1);
	t2 = ((T5)(geint8(127)));
	t2 = ((T5)((t2)/((T5)(geint8(10)))));
	t3 = (T5f3(&t2));
	T231f6(((T228*)(C))->a7, t3, (T4)(geint32(1)));
	t2 = ((T5)(geint8(127)));
	t2 = ((T5)((t2)%((T5)(geint8(10)))));
	t3 = (T5f3(&t2));
	T231f6(((T228*)(C))->a8, t3, (T4)(geint32(1)));
	t4 = ((T6)(geint16(32767)));
	t4 = ((T6)((t4)/((T6)(geint16(10)))));
	t3 = (T6f3(&t4));
	T231f6(((T228*)(C))->a7, t3, (T4)(geint32(2)));
	t4 = ((T6)(geint16(32767)));
	t4 = ((T6)((t4)%((T6)(geint16(10)))));
	t3 = (T6f3(&t4));
	T231f6(((T228*)(C))->a8, t3, (T4)(geint32(2)));
	t1 = ((T4)(geint32(2147483647)));
	t1 = ((T4)((t1)/((T4)(geint32(10)))));
	t3 = (T4f21(&t1));
	T231f6(((T228*)(C))->a7, t3, (T4)(geint32(3)));
	t1 = ((T4)(geint32(2147483647)));
	t1 = ((T4)((t1)%((T4)(geint32(10)))));
	t3 = (T4f21(&t1));
	T231f6(((T228*)(C))->a8, t3, (T4)(geint32(3)));
	t5 = ((T7)(geint64(9223372036854775807)));
	t5 = ((T7)((t5)/((T7)(geint64(10)))));
	t3 = (T7f3(&t5));
	T231f6(((T228*)(C))->a7, t3, (T4)(geint32(4)));
	t5 = ((T7)(geint64(9223372036854775807)));
	t5 = ((T7)((t5)%((T7)(geint64(10)))));
	t3 = (T7f3(&t5));
	T231f6(((T228*)(C))->a8, t3, (T4)(geint32(4)));
	t2 = ((T5)(geint8(-128)));
	t2 = ((T5)((t2)/((T5)(geint8(10)))));
	t2 = ((T5)(-(t2)));
	t3 = (T5f3(&t2));
	T231f6(((T228*)(C))->a7, t3, (T4)(geint32(5)));
	t2 = ((T5)(geint8(-128)));
	t2 = ((T5)((t2)%((T5)(geint8(10)))));
	t2 = ((T5)(-(t2)));
	t3 = (T5f3(&t2));
	T231f6(((T228*)(C))->a8, t3, (T4)(geint32(5)));
	t4 = ((T6)(geint16(-32768)));
	t4 = ((T6)((t4)/((T6)(geint16(10)))));
	t4 = ((T6)(-(t4)));
	t3 = (T6f3(&t4));
	T231f6(((T228*)(C))->a7, t3, (T4)(geint32(6)));
	t4 = ((T6)(geint16(-32768)));
	t4 = ((T6)((t4)%((T6)(geint16(10)))));
	t4 = ((T6)(-(t4)));
	t3 = (T6f3(&t4));
	T231f6(((T228*)(C))->a8, t3, (T4)(geint32(6)));
	t1 = ((T4)(geint32(-2147483647)-1));
	t1 = ((T4)((t1)/((T4)(geint32(10)))));
	t1 = ((T4)(-(t1)));
	t3 = (T4f21(&t1));
	T231f6(((T228*)(C))->a7, t3, (T4)(geint32(7)));
	t1 = ((T4)(geint32(-2147483647)-1));
	t1 = ((T4)((t1)%((T4)(geint32(10)))));
	t1 = ((T4)(-(t1)));
	t3 = (T4f21(&t1));
	T231f6(((T228*)(C))->a8, t3, (T4)(geint32(7)));
	t5 = ((T7)(geint64(-9223372036854775807)-1));
	t5 = ((T7)((t5)/((T7)(geint64(10)))));
	t5 = ((T7)(-(t5)));
	t3 = (T7f3(&t5));
	T231f6(((T228*)(C))->a7, t3, (T4)(geint32(8)));
	t5 = ((T7)(geint64(-9223372036854775807)-1));
	t5 = ((T7)((t5)%((T7)(geint64(10)))));
	t5 = ((T7)(-(t5)));
	t3 = (T7f3(&t5));
	T231f6(((T228*)(C))->a8, t3, (T4)(geint32(8)));
	((T228*)(C))->a10 = T231c5((T4)(geint32(1)), (T4)(geint32(4)));
	((T228*)(C))->a11 = T231c5((T4)(geint32(1)), (T4)(geint32(4)));
	t6 = ((T8)(genat8(255)));
	t6 = ((T8)((t6)/((T8)(genat8(10)))));
	t3 = (T8f9(&t6));
	T231f6(((T228*)(C))->a10, t3, (T4)(geint32(1)));
	t6 = ((T8)(genat8(255)));
	t6 = ((T8)((t6)%((T8)(genat8(10)))));
	t3 = (T8f9(&t6));
	T231f6(((T228*)(C))->a11, t3, (T4)(geint32(1)));
	t7 = ((T9)(genat16(65535)));
	t7 = ((T9)((t7)/((T9)(genat16(10)))));
	t3 = (T9f3(&t7));
	T231f6(((T228*)(C))->a10, t3, (T4)(geint32(2)));
	t7 = ((T9)(genat16(65535)));
	t7 = ((T9)((t7)%((T9)(genat16(10)))));
	t3 = (T9f3(&t7));
	T231f6(((T228*)(C))->a11, t3, (T4)(geint32(2)));
	t8 = ((T10)(genat32(4294967295)));
	t8 = ((T10)((t8)/((T10)(genat32(10)))));
	t3 = (T10f3(&t8));
	T231f6(((T228*)(C))->a10, t3, (T4)(geint32(3)));
	t8 = ((T10)(genat32(4294967295)));
	t8 = ((T10)((t8)%((T10)(genat32(10)))));
	t3 = (T10f3(&t8));
	T231f6(((T228*)(C))->a11, t3, (T4)(geint32(3)));
	t3 = ((T11)(genat64(18446744073709551615)));
	t3 = ((T11)((t3)/((T11)(genat64(10)))));
	t3 = (T11f7(&t3));
	T231f6(((T228*)(C))->a10, t3, (T4)(geint32(4)));
	t3 = ((T11)(genat64(18446744073709551615)));
	t3 = ((T11)((t3)%((T11)(genat64(10)))));
	t3 = (T11f7(&t3));
	T231f6(((T228*)(C))->a11, t3, (T4)(geint32(4)));
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
T11 T8f9(T8* C)
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
void T231f6(T0* C, T11 a1, T4 a2)
{
	T4 t1;
	t1 = ((T4)((a2)-(((T231*)(C))->a2)));
	((T230*)(((T231*)(C))->a1))->a2[t1] = (a1);
}

/* INTEGER_8.to_natural_64 */
T11 T5f3(T5* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* ARRAY [NATURAL_64].make */
T0* T231c5(T4 a1, T4 a2)
{
	T2 t1;
	T4 t2;
	T0* C;
	C = (T0*)gealloc(sizeof(T231));
	((T231*)(C))->id = 231;
	((T231*)(C))->a2 = (a1);
	((T231*)(C))->a3 = (a2);
	t1 = (T4f6(&a1, a2));
	if (t1) {
		t2 = ((T4)((a2)-(a1)));
		t2 = ((T4)((t2)+((T4)(geint32(1)))));
		T231f7(C, t2);
	} else {
		T231f7(C, (T4)(geint32(0)));
	}
	return C;
}

/* ARRAY [NATURAL_64].make_area */
void T231f7(T0* C, T4 a1)
{
	((T231*)(C))->a1 = T230c2(a1);
}

/* SPECIAL [NATURAL_64].make */
T0* T230c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T230)+a1*sizeof(T11));
	((T230*)(C))->a1 = a1;
	((T230*)(C))->id = 230;
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
T2 T1f18(T1* C)
{
	T2 R = 0;
	T1 t1;
	T4 t2;
	T8 t3;
	t1 = (*C);
	t2 = ((T4)(t1));
	t3 = (T1f8(C, t2));
	t3 = (T8f1(&t3, (T5)(geint8(0x04))));
	R = (T8f2(&t3, (T8)(genat8(0))));
	return R;
}

/* INTEGER.to_natural_64 */
T11 T4f21(T4* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* STRING.item */
T1 T16f7(T0* C, T4 a1)
{
	T1 R = 0;
	T4 t1;
	t1 = ((T4)((a1)-((T4)(geint32(1)))));
	R = (((T15*)(((T16*)(C))->a1))->a2[t1]);
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.reset */
void T213f21(T0* C, T4 a1)
{
	((T213*)(C))->a6 = ((T4)(geint32(0)));
	((T213*)(C))->a2 = ((T11)(genat64(0)));
	((T213*)(C))->a4 = ((T11)(genat64(0)));
	((T213*)(C))->a3 = ((T4)(geint32(0)));
	((T213*)(C))->a11 = (a1);
	((T213*)(C))->a12 = (EIF_FALSE);
}

/* STRING.ctoi_convertor */
unsigned char ge6os1167 = '\0';
T0* ge6ov1167;
T0* T16f21(T0* C)
{
	T0* R = 0;
	if (ge6os1167) {
		return ge6ov1167;
	} else {
		ge6os1167 = '\1';
	}
	R = T213c15();
	T213f17(R, gems(" ", 1));
	T213f18(R, gems(" ", 1));
	T213f19(R, EIF_TRUE);
	T213f20(R, EIF_TRUE);
	ge6ov1167 = R;
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
void T213f20(T0* C, T2 a1)
{
	((T213*)(C))->a10 = (a1);
}

/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
void T213f19(T0* C, T2 a1)
{
	((T213*)(C))->a9 = (a1);
}

/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
void T213f18(T0* C, T0* a1)
{
	((T213*)(C))->a8 = T16c37(a1);
}

/* STRING.make_from_string */
T0* T16c37(T0* a1)
{
	T2 t1;
	T0* t2;
	T0* C;
	C = (T0*)gealloc(sizeof(T16));
	((T16*)(C))->id = 16;
	t1 = ((C)!=(a1));
	if (t1) {
		t2 = (((T16*)(a1))->a1);
		((T16*)(C))->a1 = (T15f4(t2));
		((T16*)(C))->a2 = (((T16*)(a1))->a2);
		((T16*)(C))->a4 = ((T4)(geint32(0)));
	}
	return C;
}

/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
void T213f17(T0* C, T0* a1)
{
	((T213*)(C))->a7 = T16c37(a1);
}

/* STRING_TO_INTEGER_CONVERTOR.make */
T0* T213c15()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T213));
	((T213*)(C))->id = 213;
	T213f21(C, (T4)(geint32(0)));
	T213f17(C, gems(" ", 1));
	T213f18(C, gems(" ", 1));
	return C;
}

/* LX_LEX_PARSER.report_bad_start_condition_error */
void T35f335(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T102c7(t1, ((T35*)(C))->a24, a1);
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_BAD_START_CONDITION_ERROR.make */
T0* T102c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T102));
	((T102*)(C))->id = 102;
	((T102*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(3)));
	T119f8(((T102*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T102*)(C))->a5, t1, (T4)(geint32(2)));
	T119f8(((T102*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* LX_LEX_PARSER.process_character */
void T35f334(T0* C, T4 a1)
{
	T4 t1;
	T2 t2;
	T0* t3;
	t1 = (((T22*)(((T35*)(C))->a16))->a12);
	t2 = ((T2)((a1)<(t1)));
	if (t2) {
		((T35*)(C))->a146 = (a1);
	} else {
		t3 = (T35f190(C));
		T35f353(C, t3);
		((T35*)(C))->a146 = ((T4)(geint32(0)));
	}
}

/* LX_LEX_PARSER.report_character_out_of_range_error */
void T35f353(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T114c7(t1, ((T35*)(C))->a24, a1);
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_CHARACTER_OUT_OF_RANGE_ERROR.make */
T0* T114c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T114));
	((T114*)(C))->id = 114;
	((T114*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(3)));
	T119f8(((T114*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T114*)(C))->a5, t1, (T4)(geint32(2)));
	T119f8(((T114*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* LX_LEX_PARSER.text_item */
T1 T35f216(T0* C, T4 a1)
{
	T1 R = 0;
	T2 t1;
	T4 t2;
	t1 = ((((T35*)(C))->a105)!=(EIF_VOID));
	if (t1) {
		t2 = ((T4)((((T35*)(C))->a83)+(a1)));
		t2 = ((T4)((t2)-((T4)(geint32(1)))));
		R = (((T15*)(((T35*)(C))->a105))->a2[t2]);
	} else {
		t2 = ((T4)((((T35*)(C))->a83)+(a1)));
		t2 = ((T4)((t2)-((T4)(geint32(1)))));
		R = (T216f1(((T35*)(C))->a106, t2));
	}
	return R;
}

/* LX_LEX_PARSER.report_bad_character_class_error */
void T35f333(T0* C)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T101c7(t1, ((T35*)(C))->a24);
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_BAD_CHARACTER_CLASS_ERROR.make */
T0* T101c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T101));
	((T101*)(C))->id = 101;
	((T101*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(2)));
	T119f8(((T101*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T101*)(C))->a5, t1, (T4)(geint32(2)));
	return C;
}

/* LX_LEX_PARSER.report_undefined_definition_error */
void T35f332(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T100c7(t1, ((T35*)(C))->a24, a1);
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_UNDEFINED_DEFINITION_ERROR.make */
T0* T100c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T100));
	((T100*)(C))->id = 100;
	((T100*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(3)));
	T119f8(((T100*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T100*)(C))->a5, t1, (T4)(geint32(2)));
	T119f8(((T100*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* LX_LEX_PARSER.put_back_string */
void T35f331(T0* C, T0* a1)
{
	T4 l1 = 0;
	T2 t1;
	T1 t2;
	l1 = (((T16*)(a1))->a2);
	t1 = ((T2)((l1)<((T4)(geint32(1)))));
	while (!(t1)) {
		t2 = (T16f7(a1, l1));
		T35f352(C, t2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
	}
}

/* LX_LEX_PARSER.unread_character */
void T35f352(T0* C, T1 a1)
{
	T2 t1;
	T0* t2;
	T4 t3;
	t1 = (T4f6(&(((T35*)(C))->a29), (T4)(geint32(1))));
	if (t1) {
		if ((((T35*)(C))->a28)->id==66) {
			T66f17(((T35*)(C))->a28, ((T35*)(C))->a29);
		} else {
			T67f14(((T35*)(C))->a28, ((T35*)(C))->a29);
		}
		if ((((T35*)(C))->a28)->id==66) {
			T66f21(((T35*)(C))->a28);
		} else {
			T67f18(((T35*)(C))->a28);
		}
		t2 = ((((((T35*)(C))->a28)->id==66)?((T66*)(((T35*)(C))->a28))->a1:((T67*)(((T35*)(C))->a28))->a1));
		T35f285(C, t2);
		t3 = ((((((T35*)(C))->a28)->id==66)?((T66*)(((T35*)(C))->a28))->a2:((T67*)(((T35*)(C))->a28))->a2));
		((T35*)(C))->a29 = ((T4)((t3)-((T4)(geint32(1)))));
	} else {
		((T35*)(C))->a29 = ((T4)((((T35*)(C))->a29)-((T4)(geint32(1)))));
	}
	T216f9(((T35*)(C))->a106, a1, ((T35*)(C))->a29);
	((T35*)(C))->a83 = (((T35*)(C))->a29);
}

/* KL_CHARACTER_BUFFER.put */
void T216f9(T0* C, T1 a1, T4 a2)
{
	T2 t1;
	t1 = ((((T216*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		((T15*)(((T216*)(C))->a3))->a2[a2] = (a1);
	} else {
		T16f38(((T216*)(C))->a6, a1, a2);
	}
}

/* STRING.put */
void T16f38(T0* C, T1 a1, T4 a2)
{
	T4 t1;
	t1 = ((T4)((a2)-((T4)(geint32(1)))));
	((T15*)(((T16*)(C))->a1))->a2[t1] = (a1);
	((T16*)(C))->a4 = ((T4)(geint32(0)));
}

/* LX_LEX_PARSER.yy_set_content */
void T35f285(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	((T35*)(C))->a106 = (a1);
	((T35*)(C))->a105 = (((T216*)(a1))->a3);
	if (EIF_FALSE) {
		t1 = (T216f4(a1));
		l1 = ((T4)((t1)+((T4)(geint32(1)))));
		t1 = (((T71*)(((T35*)(C))->a102))->a1);
		t2 = ((T2)((t1)<(l1)));
		if (t2) {
			t3 = (T35f26(C));
			((T35*)(C))->a102 = (T72f2(t3, ((T35*)(C))->a102, l1));
		}
	}
}

/* KL_CHARACTER_BUFFER.count */
T4 T216f4(T0* C)
{
	T4 R = 0;
	T2 t1;
	T4 t2;
	t1 = ((((T216*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((T16*)(((T216*)(C))->a6))->a2);
		R = ((T4)((t2)-((T4)(geint32(1)))));
	} else {
		R = (((T16*)(((T216*)(C))->a6))->a2);
	}
	return R;
}

/* YY_BUFFER.compact_right */
void T67f18(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 t1;
	T2 t2;
	t1 = ((T4)((((T67*)(C))->a7)-(((T67*)(C))->a2)));
	l2 = ((T4)((t1)+((T4)(geint32(1)))));
	t2 = (T4f5(&l2, ((T67*)(C))->a11));
	if (t2) {
		T67f20(C);
	}
	t1 = ((T4)((((T67*)(C))->a2)+(((T67*)(C))->a11)));
	l1 = ((T4)((t1)-(((T67*)(C))->a7)));
	t2 = ((((T67*)(C))->a2)!=(l1));
	if (t2) {
		t1 = ((T4)((l2)+((T4)(geint32(2)))));
		T216f10(((T67*)(C))->a1, ((T67*)(C))->a2, l1, t1);
		((T67*)(C))->a2 = (l1);
		t1 = ((T4)((l1)+(l2)));
		((T67*)(C))->a7 = ((T4)((t1)-((T4)(geint32(1)))));
	}
}

/* KL_CHARACTER_BUFFER.move_right */
void T216f10(T0* C, T4 a1, T4 a2, T4 a3)
{
	T2 t1;
	T4 t2;
	T4 t3;
	T4 t4;
	t1 = (T4f1(&a3, (T4)(geint32(0))));
	if (t1) {
		t1 = ((((T216*)(C))->a3)!=(EIF_VOID));
		if (t1) {
			t2 = ((T4)((a1)+((T4)(geint32(1)))));
			t3 = ((T4)((a1)+(a3)));
			t4 = ((T4)((a2)+((T4)(geint32(1)))));
			T16f39(((T216*)(C))->a6, ((T216*)(C))->a6, t2, t3, t4);
		} else {
			t2 = ((T4)((a1)+(a3)));
			t2 = ((T4)((t2)-((T4)(geint32(1)))));
			T16f39(((T216*)(C))->a6, ((T216*)(C))->a6, a1, t2, a2);
		}
	}
}

/* STRING.subcopy */
void T16f39(T0* C, T0* a1, T4 a2, T4 a3, T4 a4)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	T4 t4;
	l1 = (((T16*)(a1))->a1);
	l2 = (((T16*)(C))->a1);
	t1 = (T4f5(&a3, a2));
	if (t1) {
		t1 = ((l2)!=(l1));
		if (t1) {
			t2 = ((T4)((a2)-((T4)(geint32(1)))));
			t3 = ((T4)((a4)-((T4)(geint32(1)))));
			t4 = ((T4)((a3)-(a2)));
			t4 = ((T4)((t4)+((T4)(geint32(1)))));
			T15f9(l2, l1, t2, t3, t4);
		} else {
			t2 = ((T4)((a2)-((T4)(geint32(1)))));
			t3 = ((T4)((a4)-((T4)(geint32(1)))));
			t4 = ((T4)((a3)-(a2)));
			t4 = ((T4)((t4)+((T4)(geint32(1)))));
			T15f12(l2, t2, t3, t4);
		}
		((T16*)(C))->a4 = ((T4)(geint32(0)));
	}
}

/* YY_BUFFER.resize */
void T67f20(T0* C)
{
	T2 t1;
	T4 t2;
	T4 t3;
	t1 = ((((T67*)(C))->a11)==((T4)(geint32(0))));
	if (t1) {
		((T67*)(C))->a11 = (T67f12(C));
	} else {
		((T67*)(C))->a11 = ((T4)((((T67*)(C))->a11)*((T4)(geint32(2)))));
	}
	t2 = ((T4)((((T67*)(C))->a11)+((T4)(geint32(2)))));
	t3 = (T216f4(((T67*)(C))->a1));
	t1 = (T4f1(&t2, t3));
	if (t1) {
		t2 = ((T4)((((T67*)(C))->a11)+((T4)(geint32(2)))));
		T216f12(((T67*)(C))->a1, t2);
	}
}

/* KL_CHARACTER_BUFFER.resize */
void T216f12(T0* C, T4 a1)
{
	T2 t1;
	T4 t2;
	t1 = ((((T216*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = ((T4)((a1)+((T4)(geint32(1)))));
		T16f30(((T216*)(C))->a6, t2);
		t2 = ((T4)((a1)+((T4)(geint32(1)))));
		T16f35(((T216*)(C))->a6, t2);
		((T216*)(C))->a3 = (((T16*)(((T216*)(C))->a6))->a1);
	} else {
		T16f30(((T216*)(C))->a6, a1);
		T16f35(((T216*)(C))->a6, a1);
	}
}

/* STRING.set_count */
void T16f35(T0* C, T4 a1)
{
	((T16*)(C))->a2 = (a1);
	((T16*)(C))->a4 = ((T4)(geint32(0)));
}

/* YY_BUFFER.default_capacity */
unsigned char ge133os5154 = '\0';
T4 ge133ov5154;
T4 T67f12(T0* C)
{
	T4 R = 0;
	if (ge133os5154) {
		return ge133ov5154;
	} else {
		ge133os5154 = '\1';
	}
	R = ((T4)(geint32(16384)));
	ge133ov5154 = R;
	return R;
}

/* YY_FILE_BUFFER.compact_right */
void T66f21(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 t1;
	T2 t2;
	t1 = ((T4)((((T66*)(C))->a7)-(((T66*)(C))->a2)));
	l2 = ((T4)((t1)+((T4)(geint32(1)))));
	t2 = (T4f5(&l2, ((T66*)(C))->a12));
	if (t2) {
		T66f24(C);
	}
	t1 = ((T4)((((T66*)(C))->a2)+(((T66*)(C))->a12)));
	l1 = ((T4)((t1)-(((T66*)(C))->a7)));
	t2 = ((((T66*)(C))->a2)!=(l1));
	if (t2) {
		t1 = ((T4)((l2)+((T4)(geint32(2)))));
		T216f10(((T66*)(C))->a1, ((T66*)(C))->a2, l1, t1);
		((T66*)(C))->a2 = (l1);
		t1 = ((T4)((l1)+(l2)));
		((T66*)(C))->a7 = ((T4)((t1)-((T4)(geint32(1)))));
	}
}

/* YY_FILE_BUFFER.resize */
void T66f24(T0* C)
{
	T2 t1;
	T4 t2;
	T4 t3;
	t1 = ((((T66*)(C))->a12)==((T4)(geint32(0))));
	if (t1) {
		((T66*)(C))->a12 = (T66f10(C));
	} else {
		((T66*)(C))->a12 = ((T4)((((T66*)(C))->a12)*((T4)(geint32(2)))));
	}
	t2 = ((T4)((((T66*)(C))->a12)+((T4)(geint32(2)))));
	t3 = (T216f4(((T66*)(C))->a1));
	t1 = (T4f1(&t2, t3));
	if (t1) {
		t2 = ((T4)((((T66*)(C))->a12)+((T4)(geint32(2)))));
		T216f12(((T66*)(C))->a1, t2);
	}
}

/* YY_FILE_BUFFER.default_capacity */
T4 T66f10(T0* C)
{
	T4 R = 0;
	if (ge133os5154) {
		return ge133ov5154;
	} else {
		ge133os5154 = '\1';
	}
	R = ((T4)(geint32(16384)));
	ge133ov5154 = R;
	return R;
}

/* YY_BUFFER.set_index */
void T67f14(T0* C, T4 a1)
{
	((T67*)(C))->a2 = (a1);
}

/* YY_FILE_BUFFER.set_index */
void T66f17(T0* C, T4 a1)
{
	((T66*)(C))->a2 = (a1);
}

/* DS_HASH_TABLE [STRING, STRING].item */
T0* T68f2(T0* C, T0* a1)
{
	T0* R = 0;
	T68f37(C, a1);
	R = (T68f5(C, ((T68*)(C))->a3));
	return R;
}

/* DS_HASH_TABLE [STRING, STRING].items_item */
T0* T68f5(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T77*)(((T68*)(C))->a6))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [STRING, STRING].search_position */
void T68f37(T0* C, T0* a1)
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
		((T68*)(C))->a3 = (T68f17(C, ((T68*)(C))->a18));
		((T68*)(C))->a12 = (((T68*)(C))->a18);
		((T68*)(C))->a19 = ((T4)(geint32(0)));
	} else {
		l4 = (((T68*)(C))->a7);
		t1 = ((l4)!=(EIF_VOID));
		if (t1) {
			t1 = ((((T68*)(C))->a3)==((T4)(geint32(0))));
			if (!(t1)) {
				t2 = (T68f20(C, ((T68*)(C))->a3));
				t3 = (T69f1(l4, a1, t2));
				t1 = ((T2)(!(t3)));
			}
			if (!(t1)) {
				t1 = (T69f1(l4, a1, l3));
			}
			if (t1) {
				((T68*)(C))->a12 = (T68f11(C, a1));
				l1 = (T68f17(C, ((T68*)(C))->a12));
				((T68*)(C))->a3 = ((T4)(geint32(0)));
				l2 = ((T4)(geint32(0)));
				t1 = ((l1)==((T4)(geint32(0))));
				while (!(t1)) {
					t2 = (T68f20(C, l1));
					t1 = (T69f1(l4, a1, t2));
					if (t1) {
						((T68*)(C))->a3 = (l1);
						l1 = ((T4)(geint32(0)));
					} else {
						l2 = (l1);
						l1 = (T68f16(C, l1));
					}
					t1 = ((l1)==((T4)(geint32(0))));
				}
				((T68*)(C))->a19 = (l2);
			}
		} else {
			t1 = ((((T68*)(C))->a3)==((T4)(geint32(0))));
			if (!(t1)) {
				t2 = (T68f20(C, ((T68*)(C))->a3));
				t1 = ((a1)!=(t2));
			}
			if (!(t1)) {
				t1 = ((a1)==(l3));
			}
			if (t1) {
				((T68*)(C))->a12 = (T68f11(C, a1));
				l1 = (T68f17(C, ((T68*)(C))->a12));
				((T68*)(C))->a3 = ((T4)(geint32(0)));
				l2 = ((T4)(geint32(0)));
				t1 = ((l1)==((T4)(geint32(0))));
				while (!(t1)) {
					t2 = (T68f20(C, l1));
					t1 = ((a1)==(t2));
					if (t1) {
						((T68*)(C))->a3 = (l1);
						l1 = ((T4)(geint32(0)));
					} else {
						l2 = (l1);
						l1 = (T68f16(C, l1));
					}
					t1 = ((l1)==((T4)(geint32(0))));
				}
				((T68*)(C))->a19 = (l2);
			}
		}
	}
}

/* DS_HASH_TABLE [STRING, STRING].clashes_item */
T4 T68f16(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T71*)(((T68*)(C))->a25))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [STRING, STRING].hash_position */
T4 T68f11(T0* C, T0* a1)
{
	T4 R = 0;
	T2 t1;
	T4 t2;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T16f22(a1));
		R = ((T4)((t2)%(((T68*)(C))->a18)));
	} else {
		R = (((T68*)(C))->a18);
	}
	return R;
}

/* DS_HASH_TABLE [STRING, STRING].keys_item */
T0* T68f20(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T77*)(((T68*)(C))->a27))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [STRING, STRING].slots_item */
T4 T68f17(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T71*)(((T68*)(C))->a26))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [STRING, STRING].has */
T2 T68f1(T0* C, T0* a1)
{
	T2 R = 0;
	T68f37(C, a1);
	R = ((((T68*)(C))->a3)!=((T4)(geint32(0))));
	return R;
}

/* LX_LEX_PARSER.less */
void T35f330(T0* C, T4 a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	if (EIF_FALSE) {
		l2 = ((T4)((((T35*)(C))->a83)+(a1)));
		l1 = ((T4)((((T35*)(C))->a29)-(l2)));
		((T35*)(C))->a29 = (l2);
		t1 = ((T2)((l1)<(((T35*)(C))->a32)));
		if (t1) {
			((T35*)(C))->a32 = ((T4)((((T35*)(C))->a32)-(l1)));
		} else {
			l3 = (((T35*)(C))->a96);
			((T35*)(C))->a96 = ((T4)(geint32(0)));
			((T35*)(C))->a31 = (((T35*)(C))->a97);
			((T35*)(C))->a32 = (((T35*)(C))->a98);
			T35f351(C);
			((T35*)(C))->a96 = (l3);
		}
	} else {
		((T35*)(C))->a29 = ((T4)((((T35*)(C))->a83)+(a1)));
	}
	((T35*)(C))->a30 = ((T4)((((T35*)(C))->a99)+(a1)));
}

/* LX_LEX_PARSER.yy_set_line_column */
void T35f351(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T2 t1;
	l1 = ((T4)((((T35*)(C))->a29)-((T4)(geint32(1)))));
	l2 = ((T4)((((T35*)(C))->a83)+(((T35*)(C))->a96)));
	t1 = ((T2)((l1)<(l2)));
	if (!(t1)) {
		t1 = (l5);
	}
	while (!(t1)) {
		t1 = ((((T35*)(C))->a105)!=(EIF_VOID));
		if (t1) {
			l6 = (((T15*)(((T35*)(C))->a105))->a2[l1]);
		} else {
			l6 = (T216f1(((T35*)(C))->a106, l1));
		}
		t1 = ((l6)==((T1)('\n')));
		if (t1) {
			l3 = ((T4)((l3)+((T4)(geint32(1)))));
			l5 = (EIF_TRUE);
		} else {
			l4 = ((T4)((l4)+((T4)(geint32(1)))));
		}
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t1 = ((T2)((l1)<(l2)));
		if (!(t1)) {
			t1 = (l5);
		}
	}
	t1 = ((T2)((l1)<(l2)));
	while (!(t1)) {
		t1 = ((((T35*)(C))->a105)!=(EIF_VOID));
		if (t1) {
			l6 = (((T15*)(((T35*)(C))->a105))->a2[l1]);
		} else {
			l6 = (T216f1(((T35*)(C))->a106, l1));
		}
		t1 = ((l6)==((T1)('\n')));
		if (t1) {
			l3 = ((T4)((l3)+((T4)(geint32(1)))));
		}
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t1 = ((T2)((l1)<(l2)));
	}
	if (l5) {
		((T35*)(C))->a31 = ((T4)((((T35*)(C))->a31)+(l3)));
		((T35*)(C))->a32 = ((T4)((l4)+((T4)(geint32(1)))));
	} else {
		((T35*)(C))->a32 = ((T4)((((T35*)(C))->a32)+(l4)));
	}
}

/* LX_LEX_PARSER.report_incomplete_name_definition_error */
void T35f329(T0* C)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T99c7(t1, ((T35*)(C))->a24);
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_INCOMPLETE_NAME_DEFINITION_ERROR.make */
T0* T99c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T99));
	((T99*)(C))->id = 99;
	((T99*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(2)));
	T119f8(((T99*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T99*)(C))->a5, t1, (T4)(geint32(2)));
	return C;
}

/* LX_LEX_PARSER.process_name_definition */
void T35f328(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T2 l5 = 0;
	T4 t1;
	T0* t2;
	T2 t3;
	T1 t4;
	t1 = (((T16*)(a1))->a2);
	t1 = ((T4)((t1)+((T4)(geint32(2)))));
	l1 = T16c25(t1);
	T16f26(l1, (T1)('{'));
	t2 = (T16f12(a1));
	T16f27(l1, t2);
	T16f26(l1, (T1)('}'));
	t3 = (T68f1(((T35*)(C))->a19, l1));
	if (t3) {
		T35f350(C, a1);
	}
	t1 = (((T16*)(a2))->a2);
	t1 = ((T4)((t1)+((T4)(geint32(2)))));
	l2 = T16c25(t1);
	T16f26(l2, (T1)('('));
	l4 = (((T16*)(a2))->a2);
	l3 = (l4);
	t3 = ((T2)((l3)<((T4)(geint32(1)))));
	if (!(t3)) {
		t3 = (l5);
	}
	while (!(t3)) {
		t4 = (T16f7(a2, l3));
		switch (t4) {
		case (T1)(T1)(' '):
		case (T1)(T1)('\t'):
		case (T1)(T1)('\r'):
		case (T1)(T1)('\n'):
			l3 = ((T4)((l3)-((T4)(geint32(1)))));
			break;
		default:
			l5 = (EIF_TRUE);
			break;
		}
		t3 = ((T2)((l3)<((T4)(geint32(1)))));
		if (!(t3)) {
			t3 = (l5);
		}
	}
	t3 = (T4f5(&l3, (T4)(geint32(1))));
	if (t3) {
		t3 = ((T2)((l3)<(l4)));
		if (t3) {
			t2 = (T16f9(a2, (T4)(geint32(1)), l3));
			T16f27(l2, t2);
		} else {
			T16f27(l2, a2);
		}
	}
	T16f26(l2, (T1)(')'));
	T68f36(((T35*)(C))->a19, l2, l1);
}

/* DS_HASH_TABLE [STRING, STRING].force */
void T68f36(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	T68f39(C);
	T68f37(C, a2);
	t1 = ((((T68*)(C))->a3)!=((T4)(geint32(0))));
	if (t1) {
		T68f40(C, a1, ((T68*)(C))->a3);
	} else {
		t1 = ((((T68*)(C))->a8)==(((T68*)(C))->a9));
		if (t1) {
			t2 = ((T4)((((T68*)(C))->a8)+((T4)(geint32(1)))));
			t2 = (T68f10(C, t2));
			T68f41(C, t2);
			l2 = (T68f11(C, a2));
		} else {
			l2 = (((T68*)(C))->a12);
		}
		l1 = (((T68*)(C))->a13);
		t1 = ((l1)==((T4)(geint32(0))));
		if (t1) {
			((T68*)(C))->a14 = ((T4)((((T68*)(C))->a14)+((T4)(geint32(1)))));
			l1 = (((T68*)(C))->a14);
		} else {
			t2 = (T4)(geint32(-1));
			t3 = (T68f16(C, l1));
			((T68*)(C))->a13 = ((T4)((t2)-(t3)));
		}
		t2 = (T68f17(C, l2));
		T68f42(C, t2, l1);
		T68f43(C, l1, l2);
		T68f40(C, a1, l1);
		T68f44(C, a2, l1);
		((T68*)(C))->a8 = ((T4)((((T68*)(C))->a8)+((T4)(geint32(1)))));
	}
}

/* DS_HASH_TABLE [STRING, STRING].keys_put */
void T68f44(T0* C, T0* a1, T4 a2)
{
	((T77*)(((T68*)(C))->a27))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [STRING, STRING].slots_put */
void T68f43(T0* C, T4 a1, T4 a2)
{
	((T71*)(((T68*)(C))->a26))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [STRING, STRING].clashes_put */
void T68f42(T0* C, T4 a1, T4 a2)
{
	((T71*)(((T68*)(C))->a25))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [STRING, STRING].resize */
void T68f41(T0* C, T4 a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	T68f39(C);
	l1 = (T68f23(C, a1));
	t1 = ((T4)((l1)+((T4)(geint32(1)))));
	T68f46(C, t1);
	l2 = (((T68*)(C))->a18);
	t2 = ((T2)((l2)<((T4)(geint32(0)))));
	while (!(t2)) {
		T68f43(C, (T4)(geint32(0)), l2);
		l2 = ((T4)((l2)-((T4)(geint32(1)))));
		t2 = ((T2)((l2)<((T4)(geint32(0)))));
	}
	((T68*)(C))->a18 = (l1);
	l2 = (((T68*)(C))->a14);
	t2 = ((T2)((l2)<((T4)(geint32(1)))));
	while (!(t2)) {
		t1 = (T68f16(C, l2));
		t2 = (T4f1(&t1, (T4)(geint32(-1))));
		if (t2) {
			t3 = (T68f20(C, l2));
			l3 = (T68f11(C, t3));
			t1 = (T68f17(C, l3));
			T68f42(C, t1, l2);
			T68f43(C, l2, l3);
		}
		l2 = ((T4)((l2)-((T4)(geint32(1)))));
		t2 = ((T2)((l2)<((T4)(geint32(1)))));
	}
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T68f47(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T68f48(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T68f49(C, t1);
	((T68*)(C))->a9 = (a1);
	((T68*)(C))->a3 = ((T4)(geint32(0)));
}

/* DS_HASH_TABLE [STRING, STRING].clashes_resize */
void T68f49(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T68f30(C));
	((T68*)(C))->a25 = (T72f2(t1, ((T68*)(C))->a25, a1));
}

/* DS_HASH_TABLE [STRING, STRING].special_integer_ */
T0* T68f30(T0* C)
{
	T0* R = 0;
	if (ge257os2367) {
		return ge257ov2367;
	} else {
		ge257os2367 = '\1';
	}
	R = T72c4();
	ge257ov2367 = R;
	return R;
}

/* DS_HASH_TABLE [STRING, STRING].keys_resize */
void T68f48(T0* C, T4 a1)
{
	((T68*)(C))->a27 = (T78f2(((T68*)(C))->a32, ((T68*)(C))->a27, a1));
}

/* DS_HASH_TABLE [STRING, STRING].items_resize */
void T68f47(T0* C, T4 a1)
{
	((T68*)(C))->a6 = (T78f2(((T68*)(C))->a31, ((T68*)(C))->a6, a1));
}

/* DS_HASH_TABLE [STRING, STRING].slots_resize */
void T68f46(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T68f30(C));
	((T68*)(C))->a26 = (T72f2(t1, ((T68*)(C))->a26, a1));
}

/* DS_HASH_TABLE [STRING, STRING].new_modulus */
T4 T68f23(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* DS_HASH_TABLE [STRING, STRING].new_capacity */
T4 T68f10(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = (T4)(geint32(2));
	R = ((T4)((t1)*(a1)));
	return R;
}

/* DS_HASH_TABLE [STRING, STRING].items_put */
void T68f40(T0* C, T0* a1, T4 a2)
{
	((T77*)(((T68*)(C))->a6))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [STRING, STRING].unset_found_item */
void T68f39(T0* C)
{
	((T68*)(C))->a22 = ((T4)(geint32(0)));
}

/* STRING.substring */
T0* T16f9(T0* C, T4 a1, T4 a2)
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
		R = (T16f20(C, t1));
		t3 = (((T16*)(R))->a1);
		t1 = ((T4)((a1)-((T4)(geint32(1)))));
		t4 = ((T4)((a2)-(a1)));
		t4 = ((T4)((t4)+((T4)(geint32(1)))));
		T15f9(t3, ((T16*)(C))->a1, t1, (T4)(geint32(0)), t4);
		t1 = ((T4)((a2)-(a1)));
		t1 = ((T4)((t1)+((T4)(geint32(1)))));
		T16f35(R, t1);
	} else {
		R = (T16f20(C, (T4)(geint32(0))));
	}
	return R;
}

/* STRING.new_string */
T0* T16f20(T0* C, T4 a1)
{
	T0* R = 0;
	R = T16c25(a1);
	return R;
}

/* LX_LEX_PARSER.report_name_defined_twice_error */
void T35f350(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T113c7(t1, ((T35*)(C))->a24, a1);
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_NAME_DEFINED_TWICE_ERROR.make */
T0* T113c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T113));
	((T113*)(C))->id = 113;
	((T113*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(3)));
	T119f8(((T113*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T113*)(C))->a5, t1, (T4)(geint32(2)));
	T119f8(((T113*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* LX_LEX_PARSER.report_missing_quote_error */
void T35f327(T0* C)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T98c7(t1, ((T35*)(C))->a24);
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_MISSING_QUOTE_ERROR.make */
T0* T98c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T98));
	((T98*)(C))->id = 98;
	((T98*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(2)));
	T119f8(((T98*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T98*)(C))->a5, t1, (T4)(geint32(2)));
	return C;
}

/* LX_DESCRIPTION.set_output_filename */
void T22f36(T0* C, T0* a1)
{
	((T22*)(C))->a7 = (a1);
}

/* LX_LEX_PARSER.report_unrecognized_option_error */
void T35f326(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T97c7(t1, ((T35*)(C))->a24, a1);
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_UNRECOGNIZED_OPTION_ERROR.make */
T0* T97c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T97));
	((T97*)(C))->id = 97;
	((T97*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(3)));
	T119f8(((T97*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T97*)(C))->a5, t1, (T4)(geint32(2)));
	T119f8(((T97*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* LX_DESCRIPTION.set_no_warning */
void T22f45(T0* C, T2 a1)
{
	((T22*)(C))->a3 = (a1);
}

/* LX_DESCRIPTION.set_post_eof_action_used */
void T22f57(T0* C, T2 a1)
{
	((T22*)(C))->a31 = (a1);
}

/* LX_DESCRIPTION.set_pre_eof_action_used */
void T22f56(T0* C, T2 a1)
{
	((T22*)(C))->a30 = (a1);
}

/* LX_DESCRIPTION.set_post_action_used */
void T22f55(T0* C, T2 a1)
{
	((T22*)(C))->a29 = (a1);
}

/* LX_DESCRIPTION.set_pre_action_used */
void T22f54(T0* C, T2 a1)
{
	((T22*)(C))->a28 = (a1);
}

/* LX_DESCRIPTION.set_position_used */
void T22f53(T0* C, T2 a1)
{
	((T22*)(C))->a33 = (a1);
}

/* LX_DESCRIPTION.set_line_used */
void T22f52(T0* C, T2 a1)
{
	((T22*)(C))->a32 = (a1);
}

/* LX_DESCRIPTION.set_reject_used */
void T22f51(T0* C, T2 a1)
{
	((T22*)(C))->a4 = (a1);
}

/* LX_DESCRIPTION.set_meta_equiv_classes_used */
void T22f40(T0* C, T2 a1)
{
	((T22*)(C))->a11 = (a1);
}

/* LX_DESCRIPTION.set_full_table */
void T22f41(T0* C, T2 a1)
{
	((T22*)(C))->a2 = (a1);
}

/* LX_DESCRIPTION.set_equiv_classes_used */
void T22f39(T0* C, T2 a1)
{
	((T22*)(C))->a10 = (a1);
}

/* LX_DESCRIPTION.set_no_default_rule */
void T22f44(T0* C, T2 a1)
{
	((T22*)(C))->a6 = (a1);
}

/* LX_DESCRIPTION.set_debug_mode */
void T22f42(T0* C, T2 a1)
{
	((T22*)(C))->a20 = (a1);
}

/* LX_DESCRIPTION.set_case_insensitive */
void T22f43(T0* C, T2 a1)
{
	((T22*)(C))->a21 = (a1);
}

/* LX_DESCRIPTION.set_backing_up_report */
void T22f38(T0* C, T2 a1)
{
	((T22*)(C))->a8 = (a1);
}

/* LX_LEX_PARSER.report_start_condition_expected_error */
void T35f325(T0* C)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T96c7(t1, ((T35*)(C))->a24);
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_START_CONDITION_EXPECTED_ERROR.make */
T0* T96c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T96));
	((T96*)(C))->id = 96;
	((T96*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(2)));
	T119f8(((T96*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T96*)(C))->a5, t1, (T4)(geint32(2)));
	return C;
}

/* LX_LEX_PARSER.add_new_start_condition */
void T35f324(T0* C, T0* a1, T2 a2)
{
	T0* l1 = 0;
	T2 t1;
	l1 = (((T22*)(((T35*)(C))->a16))->a19);
	t1 = (T63f2(l1, a1));
	if (t1) {
		T35f349(C, a1);
	} else {
		T63f27(l1, a1, a2);
	}
}

/* LX_START_CONDITIONS.force_new_start_condition */
void T63f27(T0* C, T0* a1, T2 a2)
{
	T0* l1 = 0;
	l1 = T90c7(a1, ((T63*)(C))->a1, a2);
	T63f31(C, l1);
}

/* LX_START_CONDITION.make */
T0* T90c7(T0* a1, T4 a2, T2 a3)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T90));
	((T90*)(C))->id = 90;
	((T90*)(C))->a1 = (a1);
	((T90*)(C))->a2 = (a2);
	((T90*)(C))->a3 = (a3);
	((T90*)(C))->a4 = T154c10((T4)(geint32(50)));
	((T90*)(C))->a5 = T154c10((T4)(geint32(50)));
	return C;
}

/* DS_ARRAYED_LIST [LX_NFA].make */
T0* T154c10(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T154));
	((T154*)(C))->id = 154;
	((T154*)(C))->a1 = T85c3();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T154*)(C))->a2 = (T85f1(((T154*)(C))->a1, t1));
	((T154*)(C))->a3 = (a1);
	((T154*)(C))->a4 = (T154f5(C));
	return C;
}

/* DS_ARRAYED_LIST [LX_NFA].new_cursor */
T0* T154f5(T0* C)
{
	T0* R = 0;
	R = T210c2(C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [LX_NFA].make */
T0* T210c2(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T210));
	((T210*)(C))->id = 210;
	((T210*)(C))->a1 = (a1);
	return C;
}

/* LX_LEX_PARSER.report_start_condition_declared_twice_error */
void T35f349(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T112c7(t1, ((T35*)(C))->a24, a1);
	T21f7(((T35*)(C))->a18, l1);
}

/* LX_START_CONDITION_DECLARED_TWICE_ERROR.make */
T0* T112c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T112));
	((T112*)(C))->id = 112;
	((T112*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(3)));
	T119f8(((T112*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T112*)(C))->a5, t1, (T4)(geint32(2)));
	T119f8(((T112*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* LX_LEX_PARSER.start_condition */
T4 T35f198(T0* C)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((((T35*)(C))->a100)-((T4)(geint32(1)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* DS_ARRAYED_LIST [STRING].force_last */
void T62f11(T0* C, T0* a1)
{
	T2 t1;
	T4 t2;
	t1 = (T62f8(C, (T4)(geint32(1))));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = ((T4)((((T62*)(C))->a1)+((T4)(geint32(1)))));
		t2 = (T62f9(C, t2));
		T62f12(C, t2);
	}
	((T62*)(C))->a1 = ((T4)((((T62*)(C))->a1)+((T4)(geint32(1)))));
	((T77*)(((T62*)(C))->a3))->a2[((T62*)(C))->a1] = (a1);
}

/* DS_ARRAYED_LIST [STRING].resize */
void T62f12(T0* C, T4 a1)
{
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T62*)(C))->a3 = (T78f2(((T62*)(C))->a4, ((T62*)(C))->a3, t1));
	((T62*)(C))->a5 = (a1);
}

/* DS_ARRAYED_LIST [STRING].new_capacity */
T4 T62f9(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* DS_ARRAYED_LIST [STRING].extendible */
T2 T62f8(T0* C, T4 a1)
{
	T2 R = 0;
	T4 t1;
	t1 = ((T4)((((T62*)(C))->a1)+(a1)));
	R = (T4f5(&(((T62*)(C))->a5), t1));
	return R;
}

/* STRING.occurrences */
T4 T16f11(T0* C, T1 a1)
{
	T4 R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T1 t2;
	l2 = (((T16*)(C))->a2);
	l3 = (((T16*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T15*)(l3))->a2[l1]);
		t1 = ((t2)==(a1));
		if (t1) {
			R = ((T4)((R)+((T4)(geint32(1)))));
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* LX_LEX_PARSER.text_substring */
T0* T35f196(T0* C, T4 a1, T4 a2)
{
	T0* R = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	t1 = ((T2)((a2)<(a1)));
	if (t1) {
		R = T16c25((T4)(geint32(0)));
	} else {
		t2 = ((T4)((((T35*)(C))->a83)+(a1)));
		t2 = ((T4)((t2)-((T4)(geint32(1)))));
		t3 = ((T4)((((T35*)(C))->a83)+(a2)));
		t3 = ((T4)((t3)-((T4)(geint32(1)))));
		R = (T216f2(((T35*)(C))->a106, t2, t3));
	}
	return R;
}

/* KL_CHARACTER_BUFFER.substring */
T0* T216f2(T0* C, T4 a1, T4 a2)
{
	T0* R = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	t1 = ((T2)((a2)<(a1)));
	if (t1) {
		R = T16c25((T4)(geint32(0)));
	} else {
		t1 = ((((T216*)(C))->a3)!=(EIF_VOID));
		if (t1) {
			t2 = ((T4)((a1)+((T4)(geint32(1)))));
			t3 = ((T4)((a2)+((T4)(geint32(1)))));
			R = (T16f9(((T216*)(C))->a6, t2, t3));
		} else {
			R = (T16f9(((T216*)(C))->a6, a1, a2));
		}
	}
	return R;
}

/* LX_LEX_PARSER.text_count */
T4 T35f195(T0* C)
{
	T4 R = 0;
	R = ((T4)((((T35*)(C))->a29)-(((T35*)(C))->a83)));
	return R;
}

/* LX_LEX_PARSER.more */
void T35f323(T0* C)
{
	((T35*)(C))->a95 = (EIF_TRUE);
}

/* LX_LEX_PARSER.report_directive_expected_error */
void T35f322(T0* C)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T95c7(t1, ((T35*)(C))->a24);
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_DIRECTIVE_EXPECTED_ERROR.make */
T0* T95c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T95));
	((T95*)(C))->id = 95;
	((T95*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(2)));
	T119f8(((T95*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T95*)(C))->a5, t1, (T4)(geint32(2)));
	return C;
}

/* LX_LEX_PARSER.report_unrecognized_directive_error */
void T35f321(T0* C)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T35f232(C));
	l1 = T94c7(t1, ((T35*)(C))->a24);
	T21f7(((T35*)(C))->a18, l1);
	((T35*)(C))->a1 = (EIF_FALSE);
}

/* LX_UNRECOGNIZED_DIRECTIVE_ERROR.make */
T0* T94c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T94));
	((T94*)(C))->id = 94;
	((T94*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(2)));
	T119f8(((T94*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f13(&a2));
	T119f8(((T94*)(C))->a5, t1, (T4)(geint32(2)));
	return C;
}

/* LX_LEX_PARSER.text */
T0* T35f190(T0* C)
{
	T0* R = 0;
	T2 t1;
	T4 t2;
	t1 = ((T2)((((T35*)(C))->a83)<(((T35*)(C))->a29)));
	if (t1) {
		t2 = ((T4)((((T35*)(C))->a29)-((T4)(geint32(1)))));
		R = (T216f2(((T35*)(C))->a106, ((T35*)(C))->a83, t2));
	} else {
		R = T16c25((T4)(geint32(0)));
	}
	return R;
}

/* LX_LEX_PARSER.set_start_condition */
void T35f320(T0* C, T4 a1)
{
	T4 t1;
	t1 = (T4)(geint32(2));
	t1 = ((T4)((t1)*(a1)));
	((T35*)(C))->a100 = ((T4)((t1)+((T4)(geint32(1)))));
}

/* LX_LEX_PARSER.yy_execute_eof_action */
void T35f288(T0* C, T4 a1)
{
	T35f319(C);
}

/* LX_LEX_PARSER.terminate */
void T35f319(T0* C)
{
	((T35*)(C))->a55 = ((T4)(geint32(0)));
}

/* LX_LEX_PARSER.wrap */
T2 T35f130(T0* C)
{
	T2 R = 0;
	R = (EIF_TRUE);
	return R;
}

/* LX_LEX_PARSER.yy_refill_input_buffer */
void T35f287(T0* C)
{
	T4 l1 = 0;
	T0* t1;
	T4 t2;
	if ((((T35*)(C))->a28)->id==66) {
		T66f17(((T35*)(C))->a28, ((T35*)(C))->a83);
	} else {
		T67f14(((T35*)(C))->a28, ((T35*)(C))->a83);
	}
	if ((((T35*)(C))->a28)->id==66) {
		T66f19(((T35*)(C))->a28);
	} else {
		T67f16(((T35*)(C))->a28);
	}
	t1 = ((((((T35*)(C))->a28)->id==66)?((T66*)(((T35*)(C))->a28))->a1:((T67*)(((T35*)(C))->a28))->a1));
	T35f285(C, t1);
	l1 = ((((((T35*)(C))->a28)->id==66)?((T66*)(((T35*)(C))->a28))->a2:((T67*)(((T35*)(C))->a28))->a2));
	t2 = ((T4)((((T35*)(C))->a29)-(((T35*)(C))->a83)));
	((T35*)(C))->a29 = ((T4)((t2)+(l1)));
	((T35*)(C))->a83 = (l1);
}

/* YY_BUFFER.fill */
void T67f16(T0* C)
{
	((T67*)(C))->a8 = (EIF_FALSE);
}

/* YY_FILE_BUFFER.fill */
void T66f19(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T1 t2;
	T4 t3;
	if (((T66*)(C))->a8) {
		t1 = ((T2)(!(((T66*)(C))->a11)));
	} else {
		t1 = EIF_FALSE;
	}
	if (t1) {
		T66f23(C);
		l3 = (((T66*)(C))->a1);
		l1 = ((T4)((((T66*)(C))->a12)-(((T66*)(C))->a7)));
		if (((T66*)(C))->a13) {
			if ((((T66*)(C))->a9)->id==36) {
				T36f43(((T66*)(C))->a9);
			} else {
				T43f22(((T66*)(C))->a9);
			}
			t1 = ((((((T66*)(C))->a9)->id==36)?T36f24(((T66*)(C))->a9):((T43*)(((T66*)(C))->a9))->a1));
			t1 = ((T2)(!(t1)));
			if (t1) {
				((T66*)(C))->a7 = ((T4)((((T66*)(C))->a7)+((T4)(geint32(1)))));
				t2 = ((((((T66*)(C))->a9)->id==36)?((T36*)(((T66*)(C))->a9))->a25:((T43*)(((T66*)(C))->a9))->a8));
				T216f9(l3, t2, ((T66*)(C))->a7);
				((T66*)(C))->a8 = (EIF_TRUE);
			} else {
				((T66*)(C))->a8 = (EIF_FALSE);
				((T66*)(C))->a11 = (EIF_TRUE);
			}
		} else {
			t3 = ((T4)((((T66*)(C))->a7)+((T4)(geint32(1)))));
			l2 = (T216f5(l3, ((T66*)(C))->a9, t3, l1));
			t1 = ((T2)((l2)<(l1)));
			if (t1) {
				((T66*)(C))->a11 = ((((((T66*)(C))->a9)->id==36)?T36f24(((T66*)(C))->a9):((T43*)(((T66*)(C))->a9))->a1));
			}
			t1 = (T4f1(&l2, (T4)(geint32(0))));
			if (t1) {
				((T66*)(C))->a8 = (EIF_TRUE);
			} else {
				((T66*)(C))->a8 = (EIF_FALSE);
			}
			((T66*)(C))->a7 = ((T4)((((T66*)(C))->a7)+(l2)));
		}
		t3 = ((T4)((((T66*)(C))->a7)+((T4)(geint32(1)))));
		T216f9(l3, (T1)('\000'), t3);
		t3 = ((T4)((((T66*)(C))->a7)+((T4)(geint32(2)))));
		T216f9(l3, (T1)('\000'), t3);
	} else {
		((T66*)(C))->a8 = (EIF_FALSE);
	}
}

/* KL_CHARACTER_BUFFER.fill_from_stream */
T4 T216f5(T0* C, T0* a1, T4 a2, T4 a3)
{
	T4 R = 0;
	T2 t1;
	T4 t2;
	t1 = ((((T216*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = ((T4)((a2)+((T4)(geint32(1)))));
		R = ((((a1)->id==36)?T36f29(a1, ((T216*)(C))->a6, t2, a3):T43f13(a1, ((T216*)(C))->a6, t2, a3)));
	} else {
		R = ((((a1)->id==36)?T36f29(a1, ((T216*)(C))->a6, a2, a3):T43f13(a1, ((T216*)(C))->a6, a2, a3)));
	}
	return R;
}

/* KL_STDIN_FILE.read_to_string */
T4 T43f13(T0* C, T0* a1, T4 a2, T4 a3)
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
		t1 = ((((T43*)(C))->a9)==(EIF_VOID));
	}
	while (!(t1)) {
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = ((T1)gevoid(((T43*)(C))->a9));
		T16f38(a1, t2, l2);
		((T43*)(C))->a9 = ((T0*)gevoid(((T43*)(C))->a9));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t1 = ((l1)==(a3));
		if (!(t1)) {
			t1 = ((((T43*)(C))->a9)==(EIF_VOID));
		}
	}
	t1 = ((T2)((l1)<(a3)));
	if (t1) {
		t1 = (T43f10(C));
		t1 = ((T2)(!(t1)));
		if (t1) {
			t3 = (T43f14(C));
			t1 = (T168f1(t3, a1, ge386ov3705));
			if (t1) {
				t4 = ((T4)((a3)-(l1)));
				t4 = (T43f16(C, a1, l2, t4));
				R = ((T4)((l1)+(t4)));
			} else {
				l4 = ((T4)((a3)-(l1)));
				l5 = T16c25(l4);
				T16f35(l5, l4);
				l4 = (T43f16(C, l5, (T4)(geint32(1)), l4));
				l3 = ((T4)(geint32(1)));
				t1 = (T4f1(&l3, l4));
				while (!(t1)) {
					t2 = (T16f7(l5, l3));
					T16f38(a1, t2, l2);
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
					l3 = ((T4)((l3)+((T4)(geint32(1)))));
					t1 = (T4f1(&l3, l4));
				}
				R = ((T4)((l1)+(l4)));
			}
		} else {
			R = (l1);
		}
		((T43*)(C))->a1 = (T43f10(C));
	} else {
		R = (l1);
	}
	return R;
}

/* KL_STDIN_FILE.old_read_to_string */
T4 T43f16(T0* C, T0* a1, T4 a2, T4 a3)
{
	T4 R = 0;
	T0* t1;
	T4 t2;
	T14 t3;
	t1 = (((T16*)(a1))->a1);
	t2 = ((T4)((a2)-((T4)(geint32(1)))));
	t3 = (T15f5(t1, t2));
	R = (T43f17(C, ((T43*)(C))->a2, t3, a3));
	return R;
}

/* KL_STDIN_FILE.file_gss */
T4 T43f17(T0* C, T14 a1, T14 a2, T4 a3)
{
	T4 R = 0;
	R = (T4)( EIF_INTEGER )file_gss((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
	return R;
}

/* SPECIAL [CHARACTER].item_address */
T14 T15f5(T0* C, T4 a1)
{
	T14 R = 0;
	T220 t1;
	T4 t2;
	t1.id = 220;
	t1.a1 = (T14)(((T15*)(C))->a2);
	R = (T220f2(&t1));
	t2 = (sizeof(T1));
	t2 = ((T4)((a1)*(t2)));
	R = ((T14)(((char*)(R))+(t2)));
	return R;
}

/* TYPED_POINTER [SPECIAL [CHARACTER]].to_pointer */
T14 T220f2(T220* C)
{
	T14 R = 0;
	R = ((*C).a1);
	return R;
}

/* KL_STDIN_FILE.any_ */
T0* T43f14(T0* C)
{
	T0* R = 0;
	if (ge251os1454) {
		return ge251ov1454;
	} else {
		ge251os1454 = '\1';
	}
	R = T168c2();
	ge251ov1454 = R;
	return R;
}

/* KL_STDIN_FILE.old_end_of_file */
T2 T43f10(T0* C)
{
	T2 R = 0;
	R = (T43f12(C, ((T43*)(C))->a2));
	return R;
}

/* KL_STDIN_FILE.console_eof */
T2 T43f12(T0* C, T14 a1)
{
	T2 R = 0;
	R = (T2)( EIF_BOOLEAN )console_eof((FILE *)a1);
	return R;
}

/* KL_TEXT_INPUT_FILE.read_to_string */
T4 T36f29(T0* C, T0* a1, T4 a2, T4 a3)
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
		t1 = ((((T36*)(C))->a11)==(EIF_VOID));
	}
	while (!(t1)) {
		l5 = ((T4)((l5)+((T4)(geint32(1)))));
		t2 = ((T1)gevoid(((T36*)(C))->a11));
		T16f38(a1, t2, l1);
		((T36*)(C))->a11 = ((T0*)gevoid(((T36*)(C))->a11));
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l5)==(a3));
		if (!(t1)) {
			t1 = ((((T36*)(C))->a11)==(EIF_VOID));
		}
	}
	t1 = ((T2)((l5)<(a3)));
	if (t1) {
		t1 = (T36f26(C));
		t1 = ((T2)(!(t1)));
		if (t1) {
			t3 = (T36f30(C));
			t1 = (T168f1(t3, a1, ge373ov2917));
			if (t1) {
				t4 = ((T4)((a3)-(l5)));
				t4 = (T36f32(C, a1, l1, t4));
				l5 = ((T4)((l5)+(t4)));
			} else {
				t3 = (T36f30(C));
				t5 = (T36f33(C));
				t1 = (T168f1(t3, a1, t5));
				if (t1) {
					t4 = ((T4)((a3)-(l5)));
					t4 = (T36f32(C, a1, l1, t4));
					l5 = ((T4)((l5)+(t4)));
				} else {
					l4 = ((T4)((a3)-(l5)));
					l2 = T16c25(l4);
					T16f35(l2, l4);
					l4 = (T36f32(C, l2, (T4)(geint32(1)), l4));
					l3 = ((T4)(geint32(1)));
					t1 = (T4f1(&l3, l4));
					while (!(t1)) {
						t2 = (T16f7(l2, l3));
						T16f38(a1, t2, l1);
						l1 = ((T4)((l1)+((T4)(geint32(1)))));
						l3 = ((T4)((l3)+((T4)(geint32(1)))));
						t1 = (T4f1(&l3, l4));
					}
					l5 = ((T4)((l5)+(l4)));
				}
			}
		}
		((T36*)(C))->a12 = (T36f26(C));
	}
	R = (l5);
	return R;
}

/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
unsigned char ge373os2918 = '\0';
T0* ge373ov2918;
T0* T36f33(T0* C)
{
	T0* R = 0;
	if (ge373os2918) {
		return ge373ov2918;
	} else {
		ge373os2918 = '\1';
	}
	R = T216c8((T4)(geint32(0)));
	ge373ov2918 = R;
	return R;
}

/* KL_CHARACTER_BUFFER.make */
T0* T216c8(T4 a1)
{
	T0* t1;
	T2 t2;
	T4 t3;
	T0* C;
	C = (T0*)gealloc(sizeof(T216));
	((T216*)(C))->id = 216;
	t1 = (T216f7(C));
	t2 = (T229f1(t1));
	t2 = ((T2)(!(t2)));
	if (t2) {
		t3 = ((T4)((a1)+((T4)(geint32(1)))));
		((T216*)(C))->a6 = T16c25(t3);
		t3 = ((T4)((a1)+((T4)(geint32(1)))));
		T16f35(((T216*)(C))->a6, t3);
		((T216*)(C))->a3 = (((T16*)(((T216*)(C))->a6))->a1);
	} else {
		((T216*)(C))->a6 = T16c25(a1);
		T16f35(((T216*)(C))->a6, a1);
	}
	return C;
}

/* KL_OPERATING_SYSTEM.is_dotnet */
unsigned char ge379os3708 = '\0';
T2 ge379ov3708;
T2 T229f1(T0* C)
{
	T2 R = 0;
	T0* l1 = 0;
	if (ge379os3708) {
		return ge379ov3708;
	} else {
		ge379os3708 = '\1';
	}
	l1 = T232c2();
	R = (EIF_FALSE);
	ge379ov3708 = R;
	return R;
}

/* PLATFORM.default_create */
T0* T232c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T232));
	((T232*)(C))->id = 232;
	return C;
}

/* KL_CHARACTER_BUFFER.operating_system */
unsigned char ge309os2956 = '\0';
T0* ge309ov2956;
T0* T216f7(T0* C)
{
	T0* R = 0;
	if (ge309os2956) {
		return ge309ov2956;
	} else {
		ge309os2956 = '\1';
	}
	R = T229c2();
	ge309ov2956 = R;
	return R;
}

/* KL_OPERATING_SYSTEM.default_create */
T0* T229c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T229));
	((T229*)(C))->id = 229;
	return C;
}

/* KL_TEXT_INPUT_FILE.old_read_to_string */
T4 T36f32(T0* C, T0* a1, T4 a2, T4 a3)
{
	T4 R = 0;
	T0* t1;
	T4 t2;
	T14 t3;
	t1 = (((T16*)(a1))->a1);
	t2 = ((T4)((a2)-((T4)(geint32(1)))));
	t3 = (T15f5(t1, t2));
	R = (T36f34(C, ((T36*)(C))->a17, t3, a3));
	return R;
}

/* KL_TEXT_INPUT_FILE.file_gss */
T4 T36f34(T0* C, T14 a1, T14 a2, T4 a3)
{
	T4 R = 0;
	R = (T4)( EIF_INTEGER )file_gss((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
	return R;
}

/* KL_TEXT_INPUT_FILE.any_ */
T0* T36f30(T0* C)
{
	T0* R = 0;
	if (ge251os1454) {
		return ge251ov1454;
	} else {
		ge251os1454 = '\1';
	}
	R = T168c2();
	ge251ov1454 = R;
	return R;
}

/* KL_TEXT_INPUT_FILE.old_end_of_file */
T2 T36f26(T0* C)
{
	T2 R = 0;
	R = (T36f28(C, ((T36*)(C))->a17));
	return R;
}

/* KL_TEXT_INPUT_FILE.file_feof */
T2 T36f28(T0* C, T14 a1)
{
	T2 R = 0;
	R = (T2)( EIF_BOOLEAN )file_feof((FILE *)a1);
	return R;
}

/* KL_TEXT_INPUT_FILE.end_of_input */
T2 T36f24(T0* C)
{
	T2 R = 0;
	R = (((T36*)(C))->a12);
	return R;
}

/* KL_STDIN_FILE.read_character */
void T43f22(T0* C)
{
	T2 t1;
	t1 = ((((T43*)(C))->a9)!=(EIF_VOID));
	if (t1) {
		((T43*)(C))->a8 = ((T1)gevoid(((T43*)(C))->a9));
		((T43*)(C))->a9 = ((T0*)gevoid(((T43*)(C))->a9));
	} else {
		t1 = (T43f10(C));
		if (t1) {
			((T43*)(C))->a1 = (EIF_TRUE);
		} else {
			T43f23(C);
			((T43*)(C))->a1 = (T43f10(C));
		}
	}
}

/* KL_STDIN_FILE.old_read_character */
void T43f23(T0* C)
{
	((T43*)(C))->a8 = (T43f11(C, ((T43*)(C))->a2));
}

/* KL_STDIN_FILE.console_readchar */
T1 T43f11(T0* C, T14 a1)
{
	T1 R = 0;
	R = (T1)( EIF_CHARACTER )console_readchar((FILE *)a1);
	return R;
}

/* KL_TEXT_INPUT_FILE.read_character */
void T36f43(T0* C)
{
	T2 t1;
	t1 = ((((T36*)(C))->a11)!=(EIF_VOID));
	if (t1) {
		((T36*)(C))->a25 = ((T1)gevoid(((T36*)(C))->a11));
		((T36*)(C))->a11 = ((T0*)gevoid(((T36*)(C))->a11));
	} else {
		t1 = (T36f26(C));
		if (t1) {
			((T36*)(C))->a12 = (EIF_TRUE);
		} else {
			T36f44(C);
			((T36*)(C))->a12 = (T36f26(C));
		}
	}
}

/* KL_TEXT_INPUT_FILE.old_read_character */
void T36f44(T0* C)
{
	((T36*)(C))->a25 = (T36f27(C, ((T36*)(C))->a17));
}

/* KL_TEXT_INPUT_FILE.file_gc */
T1 T36f27(T0* C, T14 a1)
{
	T1 R = 0;
	R = (T1)( EIF_CHARACTER )file_gc((FILE *)a1);
	return R;
}

/* YY_FILE_BUFFER.compact_left */
void T66f23(T0* C)
{
	T4 l1 = 0;
	T4 t1;
	T2 t2;
	t1 = ((T4)((((T66*)(C))->a7)-(((T66*)(C))->a2)));
	l1 = ((T4)((t1)+((T4)(geint32(1)))));
	t2 = (T4f5(&l1, ((T66*)(C))->a12));
	if (t2) {
		T66f24(C);
	}
	t2 = ((((T66*)(C))->a2)!=((T4)(geint32(1))));
	if (t2) {
		t1 = ((T4)((l1)+((T4)(geint32(2)))));
		T216f11(((T66*)(C))->a1, ((T66*)(C))->a2, (T4)(geint32(1)), t1);
		((T66*)(C))->a2 = ((T4)(geint32(1)));
		((T66*)(C))->a7 = (l1);
	}
}

/* KL_CHARACTER_BUFFER.move_left */
void T216f11(T0* C, T4 a1, T4 a2, T4 a3)
{
	T2 t1;
	T4 t2;
	T4 t3;
	T4 t4;
	t1 = (T4f1(&a3, (T4)(geint32(0))));
	if (t1) {
		t1 = ((((T216*)(C))->a3)!=(EIF_VOID));
		if (t1) {
			t2 = ((T4)((a1)+((T4)(geint32(1)))));
			t3 = ((T4)((a1)+(a3)));
			t4 = ((T4)((a2)+((T4)(geint32(1)))));
			T16f39(((T216*)(C))->a6, ((T216*)(C))->a6, t2, t3, t4);
		} else {
			t2 = ((T4)((a1)+(a3)));
			t2 = ((T4)((t2)-((T4)(geint32(1)))));
			T16f39(((T216*)(C))->a6, ((T216*)(C))->a6, a1, t2, a2);
		}
	}
}

/* LX_LEX_PARSER.yy_null_trans_state */
T4 T35f129(T0* C, T4 a1)
{
	T4 R = 0;
	T4 l1 = 0;
	T2 l2 = 0;
	T2 t1;
	T4 t2;
	t1 = EIF_FALSE;
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = (((T71*)(((T35*)(C))->a107))->a2[a1]);
		t1 = ((t2)!=((T4)(geint32(0))));
		if (t1) {
			((T35*)(C))->a108 = (a1);
			((T35*)(C))->a109 = (((T35*)(C))->a29);
		}
	}
	R = (a1);
	l1 = ((T4)(geint32(1)));
	t2 = (((T71*)(((T35*)(C))->a111))->a2[R]);
	t2 = ((T4)((t2)+(l1)));
	t2 = (((T71*)(((T35*)(C))->a110))->a2[t2]);
	t1 = ((t2)==(R));
	while (!(t1)) {
		R = (((T71*)(((T35*)(C))->a112))->a2[R]);
		t1 = ((((T35*)(C))->a113)!=(EIF_VOID));
		if (t1) {
			t1 = (T4f5(&R, (T4)(geint32(471))));
		}
		if (t1) {
			l1 = (((T71*)(((T35*)(C))->a113))->a2[l1]);
		}
		t2 = (((T71*)(((T35*)(C))->a111))->a2[R]);
		t2 = ((T4)((t2)+(l1)));
		t2 = (((T71*)(((T35*)(C))->a110))->a2[t2]);
		t1 = ((t2)==(R));
	}
	t2 = (((T71*)(((T35*)(C))->a111))->a2[R]);
	t2 = ((T4)((t2)+(l1)));
	R = (((T71*)(((T35*)(C))->a115))->a2[t2]);
	if (EIF_FALSE) {
		((T71*)(((T35*)(C))->a102))->a2[((T35*)(C))->a103] = (R);
		((T35*)(C))->a103 = ((T4)((((T35*)(C))->a103)+((T4)(geint32(1)))));
	}
	l2 = ((R)==((T4)(geint32(470))));
	if (l2) {
		R = ((T4)(geint32(0)));
	}
	return R;
}

/* LX_LEX_PARSER.yy_previous_state */
T4 T35f128(T0* C)
{
	T4 R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T1 t2;
	T4 t3;
	t1 = ((((((T35*)(C))->a28)->id==66)?((T66*)(((T35*)(C))->a28))->a6:((T67*)(((T35*)(C))->a28))->a6));
	if (t1) {
		R = ((T4)((((T35*)(C))->a100)+((T4)(geint32(1)))));
	} else {
		R = (((T35*)(C))->a100);
	}
	if (EIF_FALSE) {
		((T71*)(((T35*)(C))->a102))->a2[(T4)(geint32(0))] = (R);
		((T35*)(C))->a103 = ((T4)(geint32(1)));
	}
	l1 = ((T4)((((T35*)(C))->a83)+(((T35*)(C))->a96)));
	l2 = (((T35*)(C))->a29);
	t1 = (T4f5(&l1, l2));
	while (!(t1)) {
		t1 = ((((T35*)(C))->a105)!=(EIF_VOID));
		if (t1) {
			t2 = (((T15*)(((T35*)(C))->a105))->a2[l1]);
			l3 = ((T4)(t2));
		} else {
			t2 = (T216f1(((T35*)(C))->a106, l1));
			l3 = ((T4)(t2));
		}
		t1 = ((l3)==((T4)(geint32(0))));
		if (t1) {
			l3 = ((T4)(geint32(1)));
		} else {
			t1 = ((((T35*)(C))->a104)!=(EIF_VOID));
			if (t1) {
				l3 = (((T71*)(((T35*)(C))->a104))->a2[l3]);
			}
		}
		t1 = EIF_FALSE;
		t1 = ((T2)(!(t1)));
		if (t1) {
			t3 = (((T71*)(((T35*)(C))->a107))->a2[R]);
			t1 = ((t3)!=((T4)(geint32(0))));
			if (t1) {
				((T35*)(C))->a108 = (R);
				((T35*)(C))->a109 = (l1);
			}
		}
		t3 = (((T71*)(((T35*)(C))->a111))->a2[R]);
		t3 = ((T4)((t3)+(l3)));
		t3 = (((T71*)(((T35*)(C))->a110))->a2[t3]);
		t1 = ((t3)==(R));
		while (!(t1)) {
			R = (((T71*)(((T35*)(C))->a112))->a2[R]);
			t1 = ((((T35*)(C))->a113)!=(EIF_VOID));
			if (t1) {
				t1 = (T4f5(&R, (T4)(geint32(471))));
			}
			if (t1) {
				l3 = (((T71*)(((T35*)(C))->a113))->a2[l3]);
			}
			t3 = (((T71*)(((T35*)(C))->a111))->a2[R]);
			t3 = ((T4)((t3)+(l3)));
			t3 = (((T71*)(((T35*)(C))->a110))->a2[t3]);
			t1 = ((t3)==(R));
		}
		t3 = (((T71*)(((T35*)(C))->a111))->a2[R]);
		t3 = ((T4)((t3)+(l3)));
		R = (((T71*)(((T35*)(C))->a115))->a2[t3]);
		if (EIF_FALSE) {
			((T71*)(((T35*)(C))->a102))->a2[((T35*)(C))->a103] = (R);
			((T35*)(C))->a103 = ((T4)((((T35*)(C))->a103)+((T4)(geint32(1)))));
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f5(&l1, l2));
	}
	return R;
}

/* LX_LEX_PARSER.fatal_error */
void T35f286(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T35f184(C));
	t1 = (T42f3(t1));
	T61f11(t1, a1);
	t1 = (T35f184(C));
	t1 = (T42f3(t1));
	T61f12(t1, (T1)('\n'));
}

/* KL_STDERR_FILE.put_character */
void T61f12(T0* C, T1 a1)
{
	T61f16(C, a1);
}

/* KL_STDERR_FILE.old_put_character */
void T61f16(T0* C, T1 a1)
{
	T61f20(C, ((T61*)(C))->a2, a1);
}

/* KL_STDERR_FILE.console_pc */
void T61f20(T0* C, T14 a1, T1 a2)
{
	console_pc((FILE *)a1,( EIF_CHARACTER)a2);
}

/* KL_STANDARD_FILES.error */
unsigned char ge291os3691 = '\0';
T0* ge291ov3691;
T0* T42f3(T0* C)
{
	T0* R = 0;
	if (ge291os3691) {
		return ge291ov3691;
	} else {
		ge291os3691 = '\1';
	}
	R = T61c9();
	ge291ov3691 = R;
	return R;
}

/* KL_STDERR_FILE.make */
T0* T61c9()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T61));
	((T61*)(C))->id = 61;
	T61f13(C, gems("stderr", 6));
	return C;
}

/* KL_STDERR_FILE.make_open_stderr */
void T61f13(T0* C, T0* a1)
{
	T61f17(C, a1);
	((T61*)(C))->a2 = (T61f3(C, (T4)(geint32(2))));
	T61f18(C);
}

/* KL_STDERR_FILE.set_write_mode */
void T61f18(T0* C)
{
	((T61*)(C))->a6 = ((T4)(geint32(2)));
}

/* KL_STDERR_FILE.console_def */
T14 T61f3(T0* C, T4 a1)
{
	T14 R = 0;
	R = (T14)console_def(a1);
	return R;
}

/* KL_STDERR_FILE.old_make */
void T61f17(T0* C, T0* a1)
{
	((T61*)(C))->a5 = (a1);
	((T61*)(C))->a6 = ((T4)(geint32(0)));
}

/* LX_LEX_PARSER.std */
T0* T35f184(T0* C)
{
	T0* R = 0;
	if (ge289os1299) {
		return ge289ov1299;
	} else {
		ge289os1299 = '\1';
	}
	R = T42c4();
	ge289ov1299 = R;
	return R;
}

/* KL_CHARACTER_BUFFER.item */
T1 T216f1(T0* C, T4 a1)
{
	T1 R = 0;
	T2 t1;
	t1 = ((((T216*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		R = (((T15*)(((T216*)(C))->a3))->a2[a1]);
	} else {
		R = (T16f7(((T216*)(C))->a6, a1));
	}
	return R;
}

/* LX_LEX_PARSER.special_integer_ */
T0* T35f26(T0* C)
{
	T0* R = 0;
	if (ge257os2367) {
		return ge257ov2367;
	} else {
		ge257os2367 = '\1';
	}
	R = T72c4();
	ge257ov2367 = R;
	return R;
}

/* LX_LEX_PARSER.yy_init_value_stacks */
void T35f274(T0* C)
{
	((T35*)(C))->a84 = ((T4)(geint32(-1)));
	((T35*)(C))->a85 = ((T4)(geint32(-1)));
	((T35*)(C))->a86 = ((T4)(geint32(-1)));
	((T35*)(C))->a87 = ((T4)(geint32(-1)));
	((T35*)(C))->a88 = ((T4)(geint32(-1)));
}

/* LX_LEX_PARSER.set_input_buffer */
void T35f268(T0* C, T0* a1)
{
	T2 t1;
	t1 = ((a1)!=(((T35*)(C))->a28));
	if (t1) {
		if ((((T35*)(C))->a28)->id==66) {
			T66f17(((T35*)(C))->a28, ((T35*)(C))->a29);
		} else {
			T67f14(((T35*)(C))->a28, ((T35*)(C))->a29);
		}
		if ((((T35*)(C))->a28)->id==66) {
			T66f18(((T35*)(C))->a28, ((T35*)(C))->a30, ((T35*)(C))->a31, ((T35*)(C))->a32);
		} else {
			T67f15(((T35*)(C))->a28, ((T35*)(C))->a30, ((T35*)(C))->a31, ((T35*)(C))->a32);
		}
		((T35*)(C))->a28 = (a1);
		T35f273(C);
	}
}

/* LX_LEX_PARSER.yy_load_input_buffer */
void T35f273(T0* C)
{
	T0* t1;
	t1 = ((((((T35*)(C))->a28)->id==66)?((T66*)(((T35*)(C))->a28))->a1:((T67*)(((T35*)(C))->a28))->a1));
	T35f285(C, t1);
	((T35*)(C))->a29 = ((((((T35*)(C))->a28)->id==66)?((T66*)(((T35*)(C))->a28))->a2:((T67*)(((T35*)(C))->a28))->a2));
	((T35*)(C))->a83 = (((T35*)(C))->a29);
	((T35*)(C))->a31 = ((((((T35*)(C))->a28)->id==66)?((T66*)(((T35*)(C))->a28))->a3:((T67*)(((T35*)(C))->a28))->a3));
	((T35*)(C))->a32 = ((((((T35*)(C))->a28)->id==66)?((T66*)(((T35*)(C))->a28))->a4:((T67*)(((T35*)(C))->a28))->a4));
	((T35*)(C))->a30 = ((((((T35*)(C))->a28)->id==66)?((T66*)(((T35*)(C))->a28))->a5:((T67*)(((T35*)(C))->a28))->a5));
}

/* YY_BUFFER.set_position */
void T67f15(T0* C, T4 a1, T4 a2, T4 a3)
{
	((T67*)(C))->a5 = (a1);
	((T67*)(C))->a3 = (a2);
	((T67*)(C))->a4 = (a3);
}

/* YY_FILE_BUFFER.set_position */
void T66f18(T0* C, T4 a1, T4 a2, T4 a3)
{
	((T66*)(C))->a5 = (a1);
	((T66*)(C))->a3 = (a2);
	((T66*)(C))->a4 = (a3);
}

/* LX_LEX_PARSER.new_file_buffer */
T0* T35f15(T0* C, T0* a1)
{
	T0* R = 0;
	R = T66c16(a1);
	return R;
}

/* YY_FILE_BUFFER.make */
T0* T66c16(T0* a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T66));
	((T66*)(C))->id = 66;
	t1 = (T66f10(C));
	T66f22(C, a1, t1);
	return C;
}

/* YY_FILE_BUFFER.make_with_size */
void T66f22(T0* C, T0* a1, T4 a2)
{
	T4 t1;
	((T66*)(C))->a12 = (a2);
	t1 = ((T4)((a2)+((T4)(geint32(2)))));
	((T66*)(C))->a1 = (T66f15(C, t1));
	T66f25(C, a1);
}

/* YY_FILE_BUFFER.set_file */
void T66f25(T0* C, T0* a1)
{
	((T66*)(C))->a11 = ((((a1)->id==36)?T36f24(a1):((T43*)(a1))->a1));
	T66f26(C);
	((T66*)(C))->a9 = (a1);
}

/* YY_FILE_BUFFER.flush */
void T66f26(T0* C)
{
	T216f9(((T66*)(C))->a1, (T1)('\000'), (T4)(geint32(1)));
	T216f9(((T66*)(C))->a1, (T1)('\000'), (T4)(geint32(2)));
	((T66*)(C))->a7 = ((T4)(geint32(0)));
	((T66*)(C))->a2 = ((T4)(geint32(1)));
	((T66*)(C))->a3 = ((T4)(geint32(1)));
	((T66*)(C))->a4 = ((T4)(geint32(1)));
	((T66*)(C))->a5 = ((T4)(geint32(1)));
	((T66*)(C))->a6 = (EIF_TRUE);
	((T66*)(C))->a8 = (EIF_TRUE);
}

/* YY_FILE_BUFFER.new_default_buffer */
T0* T66f15(T0* C, T4 a1)
{
	T0* R = 0;
	R = T216c8(a1);
	return R;
}

/* KL_TEXT_INPUT_FILE.is_open_read */
T2 T36f1(T0* C)
{
	T2 R = 0;
	R = (T36f2(C));
	return R;
}

/* KL_TEXT_INPUT_FILE.old_is_open_read */
T2 T36f2(T0* C)
{
	T2 R = 0;
	T2 t1;
	t1 = ((((T36*)(C))->a3)==((T4)(geint32(1))));
	if (!(t1)) {
		t1 = ((((T36*)(C))->a3)==((T4)(geint32(4))));
	}
	if (!(t1)) {
		R = ((((T36*)(C))->a3)==((T4)(geint32(5))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* KL_TEXT_INPUT_FILE.open_read */
void T36f36(T0* C)
{
	T2 l1 = 0;
	T2 t1;
	t1 = ((T2)(!(l1)));
	if (t1) {
		t1 = ((((T36*)(C))->a10)!=(ge362ov2937));
		if (t1) {
			((T36*)(C))->a11 = (EIF_VOID);
			((T36*)(C))->a12 = (EIF_FALSE);
			t1 = (T36f13(C));
			if (t1) {
				t1 = (T36f14(C));
			}
			if (t1) {
				T36f39(C);
			}
		}
	} else {
		t1 = (T36f15(C));
		t1 = ((T2)(!(t1)));
		if (t1) {
			T36f37(C);
		}
	}
}

/* KL_TEXT_INPUT_FILE.is_closed */
T2 T36f15(T0* C)
{
	T2 R = 0;
	R = (T36f23(C));
	return R;
}

/* KL_TEXT_INPUT_FILE.old_is_closed */
T2 T36f23(T0* C)
{
	T2 R = 0;
	R = ((((T36*)(C))->a3)==((T4)(geint32(0))));
	return R;
}

/* KL_TEXT_INPUT_FILE.old_open_read */
void T36f39(T0* C)
{
	T14 t1;
	T2 t2;
	T36f39p1(C);
	t1 = (T36f18(C));
	t2 = ((((T36*)(C))->a17)==(t1));
	if (t2) {
		((T36*)(C))->a3 = ((T4)(geint32(0)));
		((T36*)(C))->a19 = (EIF_FALSE);
	}
}

/* KL_TEXT_INPUT_FILE.default_pointer */
T14 T36f18(T0* C)
{
	T14 R = 0;
	return R;
}

/* KL_TEXT_INPUT_FILE.open_read */
void T36f39p1(T0* C)
{
	T0* l1 = 0;
	T118 t1;
	T14 t2;
	l1 = (T16f3(((T36*)(C))->a10));
	t1.id = 118;
	t1.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
	t2 = (T118f2(&t1));
	((T36*)(C))->a17 = (T36f20(C, t2, (T4)(geint32(0))));
	((T36*)(C))->a3 = ((T4)(geint32(1)));
}

/* KL_TEXT_INPUT_FILE.file_open */
T14 T36f20(T0* C, T14 a1, T4 a2)
{
	T14 R = 0;
	R = (T14)( EIF_POINTER )file_open((char *)a1,( int)a2);
	return R;
}

/* KL_TEXT_INPUT_FILE.old_is_readable */
T2 T36f14(T0* C)
{
	T2 R = 0;
	T0* t1;
	T36f42(C);
	t1 = (T36f22(C));
	R = (T163f1(t1));
	return R;
}

/* UNIX_FILE_INFO.is_readable */
T2 T163f1(T0* C)
{
	T2 R = 0;
	T220 t1;
	T14 t2;
	t1.id = 220;
	t1.a1 = ((((T163*)(C))->a5?(T14)(getypes[(((T163*)(C))->a5)->id].is_special?(T14)((T15*)(((T163*)(C))->a5))->a2:(T14)((T163*)(C))->a5):(T14)0));
	t2 = (T220f2(&t1));
	R = (T163f2(C, t2, (T4)(geint32(0))));
	return R;
}

/* UNIX_FILE_INFO.file_eaccess */
T2 T163f2(T0* C, T14 a1, T4 a2)
{
	T2 R = 0;
	R = (T2)( EIF_BOOLEAN )file_eaccess((struct stat *)a1,( int)a2);
	return R;
}

/* KL_TEXT_INPUT_FILE.buffered_file_info */
unsigned char ge505os3149 = '\0';
T0* ge505ov3149;
T0* T36f22(T0* C)
{
	T0* R = 0;
	if (ge505os3149) {
		return ge505ov3149;
	} else {
		ge505os3149 = '\1';
	}
	R = T163c6();
	ge505ov3149 = R;
	return R;
}

/* UNIX_FILE_INFO.make */
T0* T163c6()
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T163));
	((T163*)(C))->id = 163;
	t1 = (T163f3(C));
	T163f8(C, t1);
	return C;
}

/* UNIX_FILE_INFO.make_buffered_file_info */
void T163f8(T0* C, T4 a1)
{
	((T163*)(C))->a5 = T15c8(a1);
}

/* UNIX_FILE_INFO.stat_size */
T4 T163f3(T0* C)
{
	T4 R = 0;
	R = (T4)stat_size();
	return R;
}

/* KL_TEXT_INPUT_FILE.set_buffer */
void T36f42(T0* C)
{
	T0* t1;
	t1 = (T36f22(C));
	T163f7(t1, ((T36*)(C))->a10);
}

/* UNIX_FILE_INFO.update */
void T163f7(T0* C, T0* a1)
{
	T0* l1 = 0;
	T118 t1;
	T14 t2;
	T220 t3;
	T14 t4;
	l1 = (T16f3(a1));
	t1.id = 118;
	t1.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
	t2 = (T118f2(&t1));
	t3.id = 220;
	t3.a1 = ((((T163*)(C))->a5?(T14)(getypes[(((T163*)(C))->a5)->id].is_special?(T14)((T15*)(((T163*)(C))->a5))->a2:(T14)((T163*)(C))->a5):(T14)0));
	t4 = (T220f2(&t3));
	T163f9(C, t2, t4);
	((T163*)(C))->a4 = (a1);
}

/* UNIX_FILE_INFO.file_stat */
void T163f9(T0* C, T14 a1, T14 a2)
{
	file_stat((char *)a1,( struct stat *)a2);
}

/* KL_TEXT_INPUT_FILE.old_exists */
T2 T36f13(T0* C)
{
	T2 R = 0;
	T0* l1 = 0;
	T118 t1;
	T14 t2;
	l1 = (T16f3(((T36*)(C))->a10));
	t1.id = 118;
	t1.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
	t2 = (T118f2(&t1));
	R = (T36f21(C, t2));
	return R;
}

/* KL_TEXT_INPUT_FILE.file_exists */
T2 T36f21(T0* C, T14 a1)
{
	T2 R = 0;
	R = (T2)( EIF_BOOLEAN )file_exists((char *)a1);
	return R;
}

/* KL_TEXT_INPUT_FILE.make */
T0* T36c35(T0* a1)
{
	T4 t1;
	T2 t2;
	T0* t3;
	T0* C;
	C = (T0*)gealloc(sizeof(T36));
	((T36*)(C))->id = 36;
	((T36*)(C))->a7 = (a1);
	t1 = (((T16*)(a1))->a2);
	t2 = (T4f1(&t1, (T4)(geint32(0))));
	if (t2) {
		t3 = (T36f8(C));
		t3 = (T56f2(t3, a1));
		T36f38(C, t3);
	} else {
		T36f38(C, ge362ov2937);
	}
	return C;
}

/* KL_TEXT_INPUT_FILE.old_make */
void T36f38(T0* C, T0* a1)
{
	((T36*)(C))->a10 = (a1);
	((T36*)(C))->a3 = ((T4)(geint32(0)));
}

/* KL_TEXT_INPUT_FILE.string_ */
T0* T36f8(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_LEX_PARSER.set_options_overrider */
void T35f264(T0* C, T0* a1)
{
	((T35*)(C))->a14 = (a1);
}

/* LX_LEX_PARSER.make_from_description */
T0* T35c263(T0* a1, T0* a2)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T35));
	((T35*)(C))->id = 35;
	T35f266(C, a1, a2);
	T35f267(C);
	((T35*)(C))->a2 = T45c15((T4)(geint32(10)));
	((T35*)(C))->a4 = T63c18((T4)(geint32(40)));
	((T35*)(C))->a6 = T64c2();
	((T35*)(C))->a7 = T65c8((T4)(geint32(10)));
	((T35*)(C))->a9 = T65c8((T4)(geint32(10)));
	((T35*)(C))->a10 = T65c8((T4)(geint32(10)));
	((T35*)(C))->a11 = T65c8((T4)(geint32(10)));
	((T35*)(C))->a12 = T65c8((T4)(geint32(10)));
	((T35*)(C))->a13 = T65c8((T4)(geint32(10)));
	return C;
}

/* DS_ARRAYED_STACK [INTEGER].make */
T0* T65c8(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T65));
	((T65*)(C))->id = 65;
	((T65*)(C))->a4 = T72c4();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T65*)(C))->a2 = (T72f1(((T65*)(C))->a4, t1));
	((T65*)(C))->a5 = (a1);
	return C;
}

/* LX_ACTION_FACTORY.make */
T0* T64c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T64));
	((T64*)(C))->id = 64;
	return C;
}

/* LX_START_CONDITIONS.make */
void T63f18(T0* C, T4 a1)
{
	T4 t1;
	((T63*)(C))->a8 = T171c3();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T63*)(C))->a7 = (T171f1(((T63*)(C))->a8, t1));
	((T63*)(C))->a9 = (a1);
	((T63*)(C))->a10 = (T63f11(C));
}

/* LX_START_CONDITIONS.make */
T0* T63c18(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T63));
	((T63*)(C))->id = 63;
	((T63*)(C))->a8 = T171c3();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T63*)(C))->a7 = (T171f1(((T63*)(C))->a8, t1));
	((T63*)(C))->a9 = (a1);
	((T63*)(C))->a10 = (T63f11(C));
	return C;
}

/* LX_START_CONDITIONS.new_cursor */
T0* T63f11(T0* C)
{
	T0* R = 0;
	R = T172c4(C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [LX_START_CONDITION].make */
T0* T172c4(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T172));
	((T172*)(C))->id = 172;
	((T172*)(C))->a3 = (a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].make */
T0* T171f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T221c2(a1);
	R = (((T221*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [LX_START_CONDITION].make_area */
T0* T221c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T221));
	((T221*)(C))->id = 221;
	((T221*)(C))->a1 = T170c4(a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [LX_START_CONDITION].default_create */
T0* T171c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T171));
	((T171*)(C))->id = 171;
	return C;
}

/* LX_LEX_PARSER.make_parser_skeleton */
void T35f267(T0* C)
{
	T0* t1;
	t1 = (T35f26(C));
	((T35*)(C))->a25 = (T72f1(t1, (T4)(geint32(200))));
	T35f271(C);
	T35f272(C);
}

/* LX_LEX_PARSER.yy_build_parser_tables */
void T35f272(T0* C)
{
	((T35*)(C))->a58 = (T35f71(C));
	((T35*)(C))->a66 = (T35f72(C));
	((T35*)(C))->a73 = (T35f74(C));
	((T35*)(C))->a75 = (T35f76(C));
	((T35*)(C))->a64 = (T35f77(C));
	((T35*)(C))->a69 = (T35f78(C));
	((T35*)(C))->a53 = (T35f79(C));
	((T35*)(C))->a68 = (T35f80(C));
	((T35*)(C))->a62 = (T35f81(C));
	((T35*)(C))->a61 = (T35f82(C));
}

/* LX_LEX_PARSER.yycheck_template */
unsigned char ge107os2151 = '\0';
T0* ge107ov2151;
T0* T35f82(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge107os2151) {
		return ge107ov2151;
	} else {
		ge107os2151 = '\1';
	}
	t1 = (gema130((T4)82,
(T4)(geint32(30)),
(T4)(geint32(1)),
(T4)(geint32(10)),
(T4)(geint32(10)),
(T4)(geint32(4)),
(T4)(geint32(11)),
(T4)(geint32(17)),
(T4)(geint32(10)),
(T4)(geint32(14)),
(T4)(geint32(9)),
(T4)(geint32(10)),
(T4)(geint32(10)),
(T4)(geint32(12)),
(T4)(geint32(9)),
(T4)(geint32(10)),
(T4)(geint32(0)),
(T4)(geint32(12)),
(T4)(geint32(28)),
(T4)(geint32(3)),
(T4)(geint32(19)),
(T4)(geint32(19)),
(T4)(geint32(29)),
(T4)(geint32(29)),
(T4)(geint32(26)),
(T4)(geint32(14)),
(T4)(geint32(25)),
(T4)(geint32(26)),
(T4)(geint32(27)),
(T4)(geint32(1)),
(T4)(geint32(25)),
(T4)(geint32(26)),
(T4)(geint32(27)),
(T4)(geint32(17)),
(T4)(geint32(21)),
(T4)(geint32(13)),
(T4)(geint32(8)),
(T4)(geint32(15)),
(T4)(geint32(67)),
(T4)(geint32(14)),
(T4)(geint32(14)),
(T4)(geint32(28)),
(T4)(geint32(17)),
(T4)(geint32(15)),
(T4)(geint32(18)),
(T4)(geint32(23)),
(T4)(geint32(24)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(22)),
(T4)(geint32(5)),
(T4)(geint32(6)),
(T4)(geint32(7)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(22)),
(T4)(geint32(16)),
(T4)(geint32(0)),
(T4)(geint32(18)),
(T4)(geint32(0)),
(T4)(geint32(10)),
(T4)(geint32(30)),
(T4)(geint32(10)),
(T4)(geint32(8)),
(T4)(geint32(11)),
(T4)(geint32(30)),
(T4)(geint32(10)),
(T4)(geint32(7)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(16)),
(T4)(geint32(13)),
(T4)(geint32(5)),
(T4)(geint32(-1)),
(T4)(geint32(42)),
(T4)(geint32(28)),
(T4)(geint32(8)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(20)),
(T4)(geint32(2147483647))));
	R = (T35f255(C, t1));
	ge107ov2151 = R;
	return R;
}

/* LX_LEX_PARSER.yyfixed_array */
T0* T35f255(T0* C, T0* a1)
{
	T0* R = 0;
	T0* t1;
	t1 = (T35f26(C));
	R = (T72f3(t1, a1));
	return R;
}

/* KL_SPECIAL_ROUTINES [INTEGER].to_special */
T0* T72f3(T0* C, T0* a1)
{
	T0* R = 0;
	R = (((T130*)(a1))->a1);
	return R;
}

/* LX_LEX_PARSER.yytable_template */
unsigned char ge107os2150 = '\0';
T0* ge107ov2150;
T0* T35f81(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge107os2150) {
		return ge107ov2150;
	} else {
		ge107os2150 = '\1';
	}
	t1 = (gema130((T4)82,
(T4)(geint32(50)),
(T4)(geint32(25)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(24)),
(T4)(geint32(78)),
(T4)(geint32(39)),
(T4)(geint32(62)),
(T4)(geint32(77)),
(T4)(geint32(23)),
(T4)(geint32(22)),
(T4)(geint32(43)),
(T4)(geint32(21)),
(T4)(geint32(23)),
(T4)(geint32(22)),
(T4)(geint32(-10)),
(T4)(geint32(21)),
(T4)(geint32(48)),
(T4)(geint32(-10)),
(T4)(geint32(20)),
(T4)(geint32(42)),
(T4)(geint32(70)),
(T4)(geint32(65)),
(T4)(geint32(61)),
(T4)(geint32(79)),
(T4)(geint32(19)),
(T4)(geint32(18)),
(T4)(geint32(17)),
(T4)(geint32(12)),
(T4)(geint32(19)),
(T4)(geint32(18)),
(T4)(geint32(17)),
(T4)(geint32(4)),
(T4)(geint32(46)),
(T4)(geint32(54)),
(T4)(geint32(11)),
(T4)(geint32(53)),
(T4)(geint32(73)),
(T4)(geint32(38)),
(T4)(geint32(75)),
(T4)(geint32(60)),
(T4)(geint32(4)),
(T4)(geint32(10)),
(T4)(geint32(74)),
(T4)(geint32(52)),
(T4)(geint32(51)),
(T4)(geint32(68)),
(T4)(geint32(46)),
(T4)(geint32(45)),
(T4)(geint32(57)),
(T4)(geint32(56)),
(T4)(geint32(55)),
(T4)(geint32(47)),
(T4)(geint32(46)),
(T4)(geint32(45)),
(T4)(geint32(36)),
(T4)(geint32(82)),
(T4)(geint32(35)),
(T4)(geint32(81)),
(T4)(geint32(76)),
(T4)(geint32(72)),
(T4)(geint32(71)),
(T4)(geint32(59)),
(T4)(geint32(69)),
(T4)(geint32(64)),
(T4)(geint32(43)),
(T4)(geint32(37)),
(T4)(geint32(14)),
(T4)(geint32(1)),
(T4)(geint32(34)),
(T4)(geint32(8)),
(T4)(geint32(9)),
(T4)(geint32(0)),
(T4)(geint32(63)),
(T4)(geint32(49)),
(T4)(geint32(16)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(41)),
(T4)(geint32(2147483647))));
	R = (T35f255(C, t1));
	ge107ov2150 = R;
	return R;
}

/* LX_LEX_PARSER.yypgoto_template */
unsigned char ge107os2149 = '\0';
T0* ge107ov2149;
T0* T35f80(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge107os2149) {
		return ge107ov2149;
	} else {
		ge107os2149 = '\1';
	}
	t1 = (gema130((T4)21,
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(60)),
(T4)(geint32(-11)),
(T4)(geint32(46)),
(T4)(geint32(-30)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(31)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(67)),
(T4)(geint32(66)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(2147483647))));
	R = (T35f255(C, t1));
	ge107ov2149 = R;
	return R;
}

/* LX_LEX_PARSER.yypact_template */
unsigned char ge107os2148 = '\0';
T0* ge107ov2148;
T0* T35f79(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge107os2148) {
		return ge107ov2148;
	} else {
		ge107os2148 = '\1';
	}
	t1 = (gema130((T4)84,
(T4)(geint32(65)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(15)),
(T4)(geint32(-32768)),
(T4)(geint32(57)),
(T4)(geint32(27)),
(T4)(geint32(64)),
(T4)(geint32(-32768)),
(T4)(geint32(0)),
(T4)(geint32(53)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(39)),
(T4)(geint32(59)),
(T4)(geint32(-32768)),
(T4)(geint32(24)),
(T4)(geint32(4)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(4)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(1)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(32)),
(T4)(geint32(4)),
(T4)(geint32(-32768)),
(T4)(geint32(4)),
(T4)(geint32(21)),
(T4)(geint32(-32768)),
(T4)(geint32(44)),
(T4)(geint32(-32768)),
(T4)(geint32(54)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(12)),
(T4)(geint32(-3)),
(T4)(geint32(-32768)),
(T4)(geint32(55)),
(T4)(geint32(34)),
(T4)(geint32(-7)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(26)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(52)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-8)),
(T4)(geint32(51)),
(T4)(geint32(-32768)),
(T4)(geint32(30)),
(T4)(geint32(4)),
(T4)(geint32(-32768)),
(T4)(geint32(25)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(49)),
(T4)(geint32(-32768)),
(T4)(geint32(-6)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(10)),
(T4)(geint32(-32768)),
(T4)(geint32(58)),
(T4)(geint32(56)),
(T4)(geint32(-32768)),
(T4)(geint32(2147483647))));
	R = (T35f255(C, t1));
	ge107ov2148 = R;
	return R;
}

/* LX_LEX_PARSER.yydefgoto_template */
unsigned char ge107os2147 = '\0';
T0* ge107ov2147;
T0* T35f78(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge107os2147) {
		return ge107ov2147;
	} else {
		ge107os2147 = '\1';
	}
	t1 = (gema130((T4)21,
(T4)(geint32(5)),
(T4)(geint32(6)),
(T4)(geint32(26)),
(T4)(geint32(27)),
(T4)(geint32(28)),
(T4)(geint32(29)),
(T4)(geint32(30)),
(T4)(geint32(31)),
(T4)(geint32(40)),
(T4)(geint32(44)),
(T4)(geint32(32)),
(T4)(geint32(80)),
(T4)(geint32(2)),
(T4)(geint32(3)),
(T4)(geint32(7)),
(T4)(geint32(15)),
(T4)(geint32(33)),
(T4)(geint32(58)),
(T4)(geint32(13)),
(T4)(geint32(67)),
(T4)(geint32(2147483647))));
	R = (T35f255(C, t1));
	ge107ov2147 = R;
	return R;
}

/* LX_LEX_PARSER.yydefact_template */
unsigned char ge107os2146 = '\0';
T0* ge107ov2146;
T0* T35f77(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge107os2146) {
		return ge107ov2146;
	} else {
		ge107os2146 = '\1';
	}
	t1 = (gema130((T4)84,
(T4)(geint32(0)),
(T4)(geint32(2)),
(T4)(geint32(3)),
(T4)(geint32(11)),
(T4)(geint32(14)),
(T4)(geint32(10)),
(T4)(geint32(0)),
(T4)(geint32(54)),
(T4)(geint32(3)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(15)),
(T4)(geint32(17)),
(T4)(geint32(0)),
(T4)(geint32(55)),
(T4)(geint32(1)),
(T4)(geint32(11)),
(T4)(geint32(0)),
(T4)(geint32(52)),
(T4)(geint32(41)),
(T4)(geint32(0)),
(T4)(geint32(42)),
(T4)(geint32(34)),
(T4)(geint32(0)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(19)),
(T4)(geint32(24)),
(T4)(geint32(0)),
(T4)(geint32(27)),
(T4)(geint32(31)),
(T4)(geint32(33)),
(T4)(geint32(43)),
(T4)(geint32(6)),
(T4)(geint32(12)),
(T4)(geint32(0)),
(T4)(geint32(13)),
(T4)(geint32(56)),
(T4)(geint32(5)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(18)),
(T4)(geint32(0)),
(T4)(geint32(48)),
(T4)(geint32(0)),
(T4)(geint32(30)),
(T4)(geint32(29)),
(T4)(geint32(23)),
(T4)(geint32(22)),
(T4)(geint32(25)),
(T4)(geint32(32)),
(T4)(geint32(37)),
(T4)(geint32(36)),
(T4)(geint32(35)),
(T4)(geint32(0)),
(T4)(geint32(7)),
(T4)(geint32(9)),
(T4)(geint32(8)),
(T4)(geint32(4)),
(T4)(geint32(16)),
(T4)(geint32(45)),
(T4)(geint32(44)),
(T4)(geint32(53)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(46)),
(T4)(geint32(49)),
(T4)(geint32(0)),
(T4)(geint32(26)),
(T4)(geint32(0)),
(T4)(geint32(47)),
(T4)(geint32(50)),
(T4)(geint32(0)),
(T4)(geint32(28)),
(T4)(geint32(0)),
(T4)(geint32(40)),
(T4)(geint32(51)),
(T4)(geint32(39)),
(T4)(geint32(0)),
(T4)(geint32(38)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(2147483647))));
	R = (T35f255(C, t1));
	ge107ov2146 = R;
	return R;
}

/* LX_LEX_PARSER.yytypes2_template */
unsigned char ge107os2145 = '\0';
T0* ge107ov2145;
T0* T35f76(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge107os2145) {
		return ge107ov2145;
	} else {
		ge107os2145 = '\1';
	}
	t1 = (gema130((T4)32,
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
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(4)),
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
	R = (T35f255(C, t1));
	ge107ov2145 = R;
	return R;
}

/* LX_LEX_PARSER.yytypes1_template */
unsigned char ge107os2144 = '\0';
T0* ge107ov2144;
T0* T35f74(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge107os2144) {
		return ge107ov2144;
	} else {
		ge107os2144 = '\1';
	}
	t1 = (gema130((T4)84,
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
(T4)(geint32(4)),
(T4)(geint32(3)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(5)),
(T4)(geint32(5)),
(T4)(geint32(5)),
(T4)(geint32(5)),
(T4)(geint32(5)),
(T4)(geint32(5)),
(T4)(geint32(4)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(5)),
(T4)(geint32(5)),
(T4)(geint32(5)),
(T4)(geint32(1)),
(T4)(geint32(3)),
(T4)(geint32(4)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(5)),
(T4)(geint32(5)),
(T4)(geint32(5)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(3)),
(T4)(geint32(4)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(3)),
(T4)(geint32(5)),
(T4)(geint32(1)),
(T4)(geint32(3)),
(T4)(geint32(1)),
(T4)(geint32(3)),
(T4)(geint32(1)),
(T4)(geint32(5)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(3)),
(T4)(geint32(1)),
(T4)(geint32(3)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2147483647))));
	R = (T35f255(C, t1));
	ge107ov2144 = R;
	return R;
}

/* LX_LEX_PARSER.yyr1_template */
unsigned char ge107os2143 = '\0';
T0* ge107ov2143;
T0* T35f72(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge107os2143) {
		return ge107ov2143;
	} else {
		ge107os2143 = '\1';
	}
	t1 = (gema130((T4)58,
(T4)(geint32(0)),
(T4)(geint32(42)),
(T4)(geint32(43)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(48)),
(T4)(geint32(48)),
(T4)(geint32(48)),
(T4)(geint32(48)),
(T4)(geint32(45)),
(T4)(geint32(31)),
(T4)(geint32(31)),
(T4)(geint32(31)),
(T4)(geint32(32)),
(T4)(geint32(49)),
(T4)(geint32(49)),
(T4)(geint32(49)),
(T4)(geint32(47)),
(T4)(geint32(47)),
(T4)(geint32(47)),
(T4)(geint32(47)),
(T4)(geint32(33)),
(T4)(geint32(33)),
(T4)(geint32(33)),
(T4)(geint32(33)),
(T4)(geint32(33)),
(T4)(geint32(34)),
(T4)(geint32(34)),
(T4)(geint32(50)),
(T4)(geint32(35)),
(T4)(geint32(36)),
(T4)(geint32(36)),
(T4)(geint32(37)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(41)),
(T4)(geint32(41)),
(T4)(geint32(40)),
(T4)(geint32(40)),
(T4)(geint32(40)),
(T4)(geint32(40)),
(T4)(geint32(39)),
(T4)(geint32(39)),
(T4)(geint32(46)),
(T4)(geint32(46)),
(T4)(geint32(46)),
(T4)(geint32(2147483647))));
	R = (T35f255(C, t1));
	ge107ov2143 = R;
	return R;
}

/* LX_LEX_PARSER.yytranslate_template */
unsigned char ge107os2142 = '\0';
T0* ge107ov2142;
T0* T35f71(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge107os2142) {
		return ge107ov2142;
	} else {
		ge107os2142 = '\1';
	}
	t1 = (gema130((T4)268,
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
(T4)(geint32(2)),
(T4)(geint32(26)),
(T4)(geint32(2)),
(T4)(geint32(20)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(27)),
(T4)(geint32(28)),
(T4)(geint32(15)),
(T4)(geint32(23)),
(T4)(geint32(18)),
(T4)(geint32(30)),
(T4)(geint32(25)),
(T4)(geint32(22)),
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
(T4)(geint32(17)),
(T4)(geint32(2)),
(T4)(geint32(16)),
(T4)(geint32(24)),
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
(T4)(geint32(9)),
(T4)(geint32(2)),
(T4)(geint32(29)),
(T4)(geint32(19)),
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
(T4)(geint32(13)),
(T4)(geint32(21)),
(T4)(geint32(14)),
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
(T4)(geint32(10)),
(T4)(geint32(11)),
(T4)(geint32(12)),
(T4)(geint32(2147483647))));
	R = (T35f255(C, t1));
	ge107ov2142 = R;
	return R;
}

/* LX_LEX_PARSER.yy_create_value_stacks */
void T35f271(T0* C)
{
}

/* LX_LEX_PARSER.make_lex_scanner_from_description */
void T35f266(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	((T35*)(C))->a16 = (a1);
	t1 = (T35f17(C));
	T35f270(C, t1);
	((T35*)(C))->a18 = (a2);
	((T35*)(C))->a19 = T68c34((T4)(geint32(101)));
	t1 = (T35f21(C));
	T68f35(((T35*)(C))->a19, t1);
	((T35*)(C))->a22 = T70c39((T4)(geint32(101)));
	t1 = (T35f21(C));
	T70f40(((T35*)(C))->a22, t1);
	((T35*)(C))->a1 = (EIF_TRUE);
	((T35*)(C))->a24 = ((T4)(geint32(1)));
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].set_key_equality_tester */
void T70f40(T0* C, T0* a1)
{
	((T70*)(C))->a8 = (a1);
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_map */
T0* T70c39(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T70));
	((T70*)(C))->id = 70;
	T70f43(C, a1, EIF_VOID, EIF_VOID);
	return C;
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_with_equality_testers */
void T70f43(T0* C, T4 a1, T0* a2, T0* a3)
{
	((T70*)(C))->a22 = (a2);
	((T70*)(C))->a8 = (a3);
	T70f50(C, a1);
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_sparse_container */
void T70f50(T0* C, T4 a1)
{
	T4 t1;
	((T70*)(C))->a10 = (a1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T70f55(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T70f56(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T70f57(C, t1);
	((T70*)(C))->a19 = (T70f24(C, a1));
	t1 = ((T4)((((T70*)(C))->a19)+((T4)(geint32(1)))));
	T70f58(C, t1);
	((T70*)(C))->a15 = ((T4)(geint32(0)));
	((T70*)(C))->a14 = ((T4)(geint32(0)));
	((T70*)(C))->a4 = ((T4)(geint32(0)));
	T70f44(C);
	((T70*)(C))->a29 = (T70f3(C));
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_slots */
void T70f58(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T70f30(C));
	((T70*)(C))->a27 = (T72f1(t1, a1));
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_clashes */
void T70f57(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T70f30(C));
	((T70*)(C))->a26 = (T72f1(t1, a1));
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_keys */
void T70f56(T0* C, T4 a1)
{
	((T70*)(C))->a32 = T78c3();
	((T70*)(C))->a28 = (T78f1(((T70*)(C))->a32, a1));
}

/* DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING].make_items */
void T70f55(T0* C, T4 a1)
{
	((T70*)(C))->a31 = T81c3();
	((T70*)(C))->a7 = (T81f1(((T70*)(C))->a31, a1));
}

/* DS_HASH_TABLE [STRING, STRING].set_key_equality_tester */
void T68f35(T0* C, T0* a1)
{
	((T68*)(C))->a7 = (a1);
}

/* LX_LEX_PARSER.string_equality_tester */
unsigned char ge260os2652 = '\0';
T0* ge260ov2652;
T0* T35f21(T0* C)
{
	T0* R = 0;
	if (ge260os2652) {
		return ge260ov2652;
	} else {
		ge260os2652 = '\1';
	}
	R = T69c2();
	ge260ov2652 = R;
	return R;
}

/* KL_STRING_EQUALITY_TESTER.default_create */
T0* T69c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T69));
	((T69*)(C))->id = 69;
	return C;
}

/* DS_HASH_TABLE [STRING, STRING].make_map */
T0* T68c34(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T68));
	((T68*)(C))->id = 68;
	T68f38(C, a1, EIF_VOID, EIF_VOID);
	return C;
}

/* DS_HASH_TABLE [STRING, STRING].make_with_equality_testers */
void T68f38(T0* C, T4 a1, T0* a2, T0* a3)
{
	((T68*)(C))->a21 = (a2);
	((T68*)(C))->a7 = (a3);
	T68f45(C, a1);
}

/* DS_HASH_TABLE [STRING, STRING].make_sparse_container */
void T68f45(T0* C, T4 a1)
{
	T4 t1;
	((T68*)(C))->a9 = (a1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T68f50(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T68f51(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T68f52(C, t1);
	((T68*)(C))->a18 = (T68f23(C, a1));
	t1 = ((T4)((((T68*)(C))->a18)+((T4)(geint32(1)))));
	T68f53(C, t1);
	((T68*)(C))->a14 = ((T4)(geint32(0)));
	((T68*)(C))->a13 = ((T4)(geint32(0)));
	((T68*)(C))->a3 = ((T4)(geint32(0)));
	T68f39(C);
	((T68*)(C))->a28 = (T68f29(C));
}

/* DS_HASH_TABLE [STRING, STRING].new_cursor */
T0* T68f29(T0* C)
{
	T0* R = 0;
	R = T173c3(C);
	return R;
}

/* DS_HASH_TABLE_CURSOR [STRING, STRING].make */
T0* T173c3(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T173));
	((T173*)(C))->id = 173;
	((T173*)(C))->a1 = (a1);
	((T173*)(C))->a2 = ((T4)(geint32(-1)));
	return C;
}

/* DS_HASH_TABLE [STRING, STRING].make_slots */
void T68f53(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T68f30(C));
	((T68*)(C))->a26 = (T72f1(t1, a1));
}

/* DS_HASH_TABLE [STRING, STRING].make_clashes */
void T68f52(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T68f30(C));
	((T68*)(C))->a25 = (T72f1(t1, a1));
}

/* DS_HASH_TABLE [STRING, STRING].make_keys */
void T68f51(T0* C, T4 a1)
{
	((T68*)(C))->a32 = T78c3();
	((T68*)(C))->a27 = (T78f1(((T68*)(C))->a32, a1));
}

/* DS_HASH_TABLE [STRING, STRING].make_items */
void T68f50(T0* C, T4 a1)
{
	((T68*)(C))->a31 = T78c3();
	((T68*)(C))->a6 = (T78f1(((T68*)(C))->a31, a1));
}

/* LX_LEX_PARSER.make_with_buffer */
void T35f270(T0* C, T0* a1)
{
	((T35*)(C))->a28 = (a1);
	T35f284(C);
	T35f273(C);
}

/* LX_LEX_PARSER.yy_initialize */
void T35f284(T0* C)
{
	T0* t1;
	T0* t2;
	T4 t3;
	T35f318(C);
	((T35*)(C))->a100 = ((T4)(geint32(1)));
	((T35*)(C))->a31 = ((T4)(geint32(1)));
	((T35*)(C))->a32 = ((T4)(geint32(1)));
	((T35*)(C))->a30 = ((T4)(geint32(1)));
	((T35*)(C))->a97 = ((T4)(geint32(1)));
	((T35*)(C))->a98 = ((T4)(geint32(1)));
	((T35*)(C))->a99 = ((T4)(geint32(1)));
	if (EIF_FALSE) {
		t1 = (T35f26(C));
		t2 = ((((((T35*)(C))->a28)->id==66)?((T66*)(((T35*)(C))->a28))->a1:((T67*)(((T35*)(C))->a28))->a1));
		t3 = (T216f4(t2));
		t3 = ((T4)((t3)+((T4)(geint32(1)))));
		((T35*)(C))->a102 = (T72f1(t1, t3));
	}
}

/* LX_LEX_PARSER.yy_build_tables */
void T35f318(T0* C)
{
	((T35*)(C))->a115 = (T35f236(C));
	((T35*)(C))->a110 = (T35f237(C));
	((T35*)(C))->a111 = (T35f238(C));
	((T35*)(C))->a112 = (T35f239(C));
	((T35*)(C))->a104 = (T35f240(C));
	((T35*)(C))->a113 = (T35f241(C));
	((T35*)(C))->a107 = (T35f242(C));
}

/* LX_LEX_PARSER.yy_accept_template */
unsigned char ge109os2664 = '\0';
T0* ge109ov2664;
T0* T35f242(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge109os2664) {
		return ge109ov2664;
	} else {
		ge109os2664 = '\1';
	}
	t1 = (gema130((T4)472,
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(60)),
(T4)(geint32(60)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(110)),
(T4)(geint32(110)),
(T4)(geint32(120)),
(T4)(geint32(10)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(10)),
(T4)(geint32(9)),
(T4)(geint32(7)),
(T4)(geint32(69)),
(T4)(geint32(62)),
(T4)(geint32(63)),
(T4)(geint32(69)),
(T4)(geint32(68)),
(T4)(geint32(65)),
(T4)(geint32(66)),
(T4)(geint32(67)),
(T4)(geint32(69)),
(T4)(geint32(117)),
(T4)(geint32(11)),
(T4)(geint32(15)),
(T4)(geint32(15)),
(T4)(geint32(15)),
(T4)(geint32(15)),
(T4)(geint32(15)),
(T4)(geint32(54)),
(T4)(geint32(21)),
(T4)(geint32(53)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(60)),
(T4)(geint32(61)),
(T4)(geint32(20)),
(T4)(geint32(17)),
(T4)(geint32(19)),
(T4)(geint32(20)),
(T4)(geint32(18)),
(T4)(geint32(92)),
(T4)(geint32(88)),
(T4)(geint32(93)),
(T4)(geint32(90)),
(T4)(geint32(89)),
(T4)(geint32(91)),
(T4)(geint32(94)),
(T4)(geint32(96)),
(T4)(geint32(95)),
(T4)(geint32(94)),
(T4)(geint32(87)),
(T4)(geint32(81)),
(T4)(geint32(82)),
(T4)(geint32(84)),
(T4)(geint32(83)),
(T4)(geint32(87)),
(T4)(geint32(85)),
(T4)(geint32(86)),
(T4)(geint32(109)),
(T4)(geint32(107)),
(T4)(geint32(108)),
(T4)(geint32(106)),
(T4)(geint32(58)),
(T4)(geint32(57)),
(T4)(geint32(59)),
(T4)(geint32(58)),
(T4)(geint32(100)),
(T4)(geint32(101)),
(T4)(geint32(100)),
(T4)(geint32(100)),
(T4)(geint32(103)),
(T4)(geint32(105)),
(T4)(geint32(103)),
(T4)(geint32(103)),
(T4)(geint32(104)),
(T4)(geint32(56)),
(T4)(geint32(118)),
(T4)(geint32(56)),
(T4)(geint32(80)),
(T4)(geint32(78)),
(T4)(geint32(79)),
(T4)(geint32(70)),
(T4)(geint32(80)),
(T4)(geint32(77)),
(T4)(geint32(80)),
(T4)(geint32(75)),
(T4)(geint32(80)),
(T4)(geint32(73)),
(T4)(geint32(110)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(115)),
(T4)(geint32(116)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(8)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(4)),
(T4)(geint32(5)),
(T4)(geint32(0)),
(T4)(geint32(7)),
(T4)(geint32(62)),
(T4)(geint32(62)),
(T4)(geint32(69)),
(T4)(geint32(0)),
(T4)(geint32(64)),
(T4)(geint32(117)),
(T4)(geint32(11)),
(T4)(geint32(0)),
(T4)(geint32(12)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(14)),
(T4)(geint32(16)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(60)),
(T4)(geint32(61)),
(T4)(geint32(17)),
(T4)(geint32(17)),
(T4)(geint32(18)),
(T4)(geint32(88)),
(T4)(geint32(89)),
(T4)(geint32(97)),
(T4)(geint32(97)),
(T4)(geint32(97)),
(T4)(geint32(81)),
(T4)(geint32(81)),
(T4)(geint32(86)),
(T4)(geint32(109)),
(T4)(geint32(106)),
(T4)(geint32(58)),
(T4)(geint32(57)),
(T4)(geint32(57)),
(T4)(geint32(98)),
(T4)(geint32(99)),
(T4)(geint32(102)),
(T4)(geint32(0)),
(T4)(geint32(55)),
(T4)(geint32(78)),
(T4)(geint32(71)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(110)),
(T4)(geint32(0)),
(T4)(geint32(111)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(113)),
(T4)(geint32(9)),
(T4)(geint32(3)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(13)),
(T4)(geint32(0)),
(T4)(geint32(21)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(30)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(97)),
(T4)(geint32(97)),
(T4)(geint32(57)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(74)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(72)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(112)),
(T4)(geint32(0)),
(T4)(geint32(9)),
(T4)(geint32(0)),
(T4)(geint32(64)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(32)),
(T4)(geint32(38)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(50)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(9)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(26)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(31)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(9)),
(T4)(geint32(22)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(33)),
(T4)(geint32(39)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(51)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(36)),
(T4)(geint32(0)),
(T4)(geint32(6)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(28)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(27)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(76)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(34)),
(T4)(geint32(23)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(37)),
(T4)(geint32(52)),
(T4)(geint32(40)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(29)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(35)),
(T4)(geint32(41)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(42)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(44)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(43)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(45)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(24)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(46)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(48)),
(T4)(geint32(25)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(47)),
(T4)(geint32(54)),
(T4)(geint32(49)),
(T4)(geint32(0)),
(T4)(geint32(2147483647))));
	R = (T35f262(C, t1));
	ge109ov2664 = R;
	return R;
}

/* LX_LEX_PARSER.yy_fixed_array */
T0* T35f262(T0* C, T0* a1)
{
	T0* R = 0;
	T0* t1;
	t1 = (T35f26(C));
	R = (T72f3(t1, a1));
	return R;
}

/* LX_LEX_PARSER.yy_meta_template */
unsigned char ge109os2663 = '\0';
T0* ge109ov2663;
T0* T35f241(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge109os2663) {
		return ge109ov2663;
	} else {
		ge109os2663 = '\1';
	}
	t1 = (gema130((T4)51,
(T4)(geint32(0)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(3)),
(T4)(geint32(4)),
(T4)(geint32(1)),
(T4)(geint32(5)),
(T4)(geint32(6)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(7)),
(T4)(geint32(1)),
(T4)(geint32(8)),
(T4)(geint32(9)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(10)),
(T4)(geint32(10)),
(T4)(geint32(10)),
(T4)(geint32(10)),
(T4)(geint32(10)),
(T4)(geint32(10)),
(T4)(geint32(11)),
(T4)(geint32(12)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(13)),
(T4)(geint32(14)),
(T4)(geint32(15)),
(T4)(geint32(16)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(17)),
(T4)(geint32(1)),
(T4)(geint32(18)),
(T4)(geint32(19)),
(T4)(geint32(1)),
(T4)(geint32(20)),
(T4)(geint32(2147483647))));
	R = (T35f262(C, t1));
	ge109ov2663 = R;
	return R;
}

/* LX_LEX_PARSER.yy_ec_template */
unsigned char ge109os2662 = '\0';
T0* ge109ov2662;
T0* T35f240(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge109os2662) {
		return ge109ov2662;
	} else {
		ge109os2662 = '\1';
	}
	t1 = (gema130((T4)258,
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
(T4)(geint32(4)),
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
(T4)(geint32(5)),
(T4)(geint32(1)),
(T4)(geint32(6)),
(T4)(geint32(7)),
(T4)(geint32(1)),
(T4)(geint32(8)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(10)),
(T4)(geint32(9)),
(T4)(geint32(11)),
(T4)(geint32(12)),
(T4)(geint32(9)),
(T4)(geint32(13)),
(T4)(geint32(14)),
(T4)(geint32(14)),
(T4)(geint32(14)),
(T4)(geint32(14)),
(T4)(geint32(14)),
(T4)(geint32(14)),
(T4)(geint32(14)),
(T4)(geint32(14)),
(T4)(geint32(15)),
(T4)(geint32(15)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(16)),
(T4)(geint32(17)),
(T4)(geint32(18)),
(T4)(geint32(9)),
(T4)(geint32(1)),
(T4)(geint32(19)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(22)),
(T4)(geint32(23)),
(T4)(geint32(24)),
(T4)(geint32(25)),
(T4)(geint32(26)),
(T4)(geint32(27)),
(T4)(geint32(28)),
(T4)(geint32(29)),
(T4)(geint32(30)),
(T4)(geint32(31)),
(T4)(geint32(32)),
(T4)(geint32(33)),
(T4)(geint32(34)),
(T4)(geint32(26)),
(T4)(geint32(35)),
(T4)(geint32(36)),
(T4)(geint32(37)),
(T4)(geint32(38)),
(T4)(geint32(39)),
(T4)(geint32(40)),
(T4)(geint32(41)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(42)),
(T4)(geint32(43)),
(T4)(geint32(44)),
(T4)(geint32(45)),
(T4)(geint32(46)),
(T4)(geint32(1)),
(T4)(geint32(19)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(22)),
(T4)(geint32(23)),
(T4)(geint32(24)),
(T4)(geint32(25)),
(T4)(geint32(26)),
(T4)(geint32(27)),
(T4)(geint32(28)),
(T4)(geint32(29)),
(T4)(geint32(30)),
(T4)(geint32(31)),
(T4)(geint32(32)),
(T4)(geint32(33)),
(T4)(geint32(34)),
(T4)(geint32(26)),
(T4)(geint32(35)),
(T4)(geint32(36)),
(T4)(geint32(37)),
(T4)(geint32(38)),
(T4)(geint32(39)),
(T4)(geint32(40)),
(T4)(geint32(41)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(47)),
(T4)(geint32(48)),
(T4)(geint32(49)),
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
	R = (T35f262(C, t1));
	ge109ov2662 = R;
	return R;
}

/* LX_LEX_PARSER.yy_def_template */
unsigned char ge109os2661 = '\0';
T0* ge109ov2661;
T0* T35f239(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge109os2661) {
		return ge109ov2661;
	} else {
		ge109os2661 = '\1';
	}
	t1 = (gema130((T4)522,
(T4)(geint32(0)),
(T4)(geint32(471)),
(T4)(geint32(470)),
(T4)(geint32(472)),
(T4)(geint32(472)),
(T4)(geint32(473)),
(T4)(geint32(473)),
(T4)(geint32(474)),
(T4)(geint32(474)),
(T4)(geint32(470)),
(T4)(geint32(9)),
(T4)(geint32(475)),
(T4)(geint32(475)),
(T4)(geint32(470)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(476)),
(T4)(geint32(476)),
(T4)(geint32(477)),
(T4)(geint32(477)),
(T4)(geint32(470)),
(T4)(geint32(21)),
(T4)(geint32(478)),
(T4)(geint32(478)),
(T4)(geint32(479)),
(T4)(geint32(479)),
(T4)(geint32(480)),
(T4)(geint32(480)),
(T4)(geint32(481)),
(T4)(geint32(481)),
(T4)(geint32(482)),
(T4)(geint32(482)),
(T4)(geint32(483)),
(T4)(geint32(483)),
(T4)(geint32(484)),
(T4)(geint32(484)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(485)),
(T4)(geint32(486)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(487)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(488)),
(T4)(geint32(489)),
(T4)(geint32(490)),
(T4)(geint32(470)),
(T4)(geint32(491)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(493)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(494)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(495)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(496)),
(T4)(geint32(497)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(498)),
(T4)(geint32(499)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(499)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(495)),
(T4)(geint32(500)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(501)),
(T4)(geint32(495)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(502)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(503)),
(T4)(geint32(495)),
(T4)(geint32(504)),
(T4)(geint32(505)),
(T4)(geint32(506)),
(T4)(geint32(507)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(508)),
(T4)(geint32(470)),
(T4)(geint32(485)),
(T4)(geint32(485)),
(T4)(geint32(485)),
(T4)(geint32(485)),
(T4)(geint32(470)),
(T4)(geint32(486)),
(T4)(geint32(470)),
(T4)(geint32(509)),
(T4)(geint32(470)),
(T4)(geint32(487)),
(T4)(geint32(470)),
(T4)(geint32(488)),
(T4)(geint32(489)),
(T4)(geint32(490)),
(T4)(geint32(470)),
(T4)(geint32(490)),
(T4)(geint32(470)),
(T4)(geint32(491)),
(T4)(geint32(510)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(493)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(511)),
(T4)(geint32(494)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(512)),
(T4)(geint32(470)),
(T4)(geint32(513)),
(T4)(geint32(496)),
(T4)(geint32(497)),
(T4)(geint32(498)),
(T4)(geint32(499)),
(T4)(geint32(470)),
(T4)(geint32(514)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(502)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(503)),
(T4)(geint32(503)),
(T4)(geint32(504)),
(T4)(geint32(505)),
(T4)(geint32(506)),
(T4)(geint32(470)),
(T4)(geint32(506)),
(T4)(geint32(470)),
(T4)(geint32(507)),
(T4)(geint32(515)),
(T4)(geint32(485)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(516)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(470)),
(T4)(geint32(517)),
(T4)(geint32(518)),
(T4)(geint32(470)),
(T4)(geint32(503)),
(T4)(geint32(470)),
(T4)(geint32(503)),
(T4)(geint32(503)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(485)),
(T4)(geint32(519)),
(T4)(geint32(520)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(470)),
(T4)(geint32(503)),
(T4)(geint32(252)),
(T4)(geint32(503)),
(T4)(geint32(503)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(485)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(470)),
(T4)(geint32(503)),
(T4)(geint32(503)),
(T4)(geint32(485)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(470)),
(T4)(geint32(485)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(470)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(470)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(0)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(2147483647))));
	R = (T35f262(C, t1));
	ge109ov2661 = R;
	return R;
}

/* LX_LEX_PARSER.yy_base_template */
unsigned char ge109os2660 = '\0';
T0* ge109ov2660;
T0* T35f238(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge109os2660) {
		return ge109ov2660;
	} else {
		ge109os2660 = '\1';
	}
	t1 = (gema130((T4)522,
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(12)),
(T4)(geint32(60)),
(T4)(geint32(108)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(61)),
(T4)(geint32(70)),
(T4)(geint32(157)),
(T4)(geint32(0)),
(T4)(geint32(1649)),
(T4)(geint32(1648)),
(T4)(geint32(206)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(77)),
(T4)(geint32(82)),
(T4)(geint32(84)),
(T4)(geint32(95)),
(T4)(geint32(255)),
(T4)(geint32(0)),
(T4)(geint32(71)),
(T4)(geint32(87)),
(T4)(geint32(137)),
(T4)(geint32(140)),
(T4)(geint32(80)),
(T4)(geint32(103)),
(T4)(geint32(302)),
(T4)(geint32(304)),
(T4)(geint32(2)),
(T4)(geint32(3)),
(T4)(geint32(347)),
(T4)(geint32(394)),
(T4)(geint32(312)),
(T4)(geint32(317)),
(T4)(geint32(1650)),
(T4)(geint32(1653)),
(T4)(geint32(7)),
(T4)(geint32(1653)),
(T4)(geint32(1637)),
(T4)(geint32(329)),
(T4)(geint32(0)),
(T4)(geint32(1653)),
(T4)(geint32(63)),
(T4)(geint32(1653)),
(T4)(geint32(1636)),
(T4)(geint32(1631)),
(T4)(geint32(1653)),
(T4)(geint32(0)),
(T4)(geint32(1653)),
(T4)(geint32(1639)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(94)),
(T4)(geint32(1653)),
(T4)(geint32(1638)),
(T4)(geint32(1632)),
(T4)(geint32(1594)),
(T4)(geint32(1653)),
(T4)(geint32(100)),
(T4)(geint32(1653)),
(T4)(geint32(1630)),
(T4)(geint32(0)),
(T4)(geint32(1622)),
(T4)(geint32(1621)),
(T4)(geint32(1616)),
(T4)(geint32(1617)),
(T4)(geint32(1599)),
(T4)(geint32(1609)),
(T4)(geint32(1612)),
(T4)(geint32(1601)),
(T4)(geint32(1595)),
(T4)(geint32(81)),
(T4)(geint32(1609)),
(T4)(geint32(1612)),
(T4)(geint32(1627)),
(T4)(geint32(1653)),
(T4)(geint32(1653)),
(T4)(geint32(126)),
(T4)(geint32(1653)),
(T4)(geint32(1617)),
(T4)(geint32(0)),
(T4)(geint32(1653)),
(T4)(geint32(143)),
(T4)(geint32(1653)),
(T4)(geint32(1653)),
(T4)(geint32(56)),
(T4)(geint32(1653)),
(T4)(geint32(1653)),
(T4)(geint32(1653)),
(T4)(geint32(1653)),
(T4)(geint32(80)),
(T4)(geint32(1653)),
(T4)(geint32(152)),
(T4)(geint32(1653)),
(T4)(geint32(1653)),
(T4)(geint32(1653)),
(T4)(geint32(1616)),
(T4)(geint32(1653)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(1653)),
(T4)(geint32(1653)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(304)),
(T4)(geint32(1653)),
(T4)(geint32(1615)),
(T4)(geint32(1653)),
(T4)(geint32(1653)),
(T4)(geint32(81)),
(T4)(geint32(297)),
(T4)(geint32(1653)),
(T4)(geint32(1653)),
(T4)(geint32(0)),
(T4)(geint32(296)),
(T4)(geint32(1653)),
(T4)(geint32(1653)),
(T4)(geint32(1653)),
(T4)(geint32(1621)),
(T4)(geint32(1653)),
(T4)(geint32(309)),
(T4)(geint32(1653)),
(T4)(geint32(1653)),
(T4)(geint32(324)),
(T4)(geint32(1653)),
(T4)(geint32(1609)),
(T4)(geint32(1581)),
(T4)(geint32(298)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(314)),
(T4)(geint32(1616)),
(T4)(geint32(1610)),
(T4)(geint32(1653)),
(T4)(geint32(1653)),
(T4)(geint32(328)),
(T4)(geint32(0)),
(T4)(geint32(1653)),
(T4)(geint32(308)),
(T4)(geint32(324)),
(T4)(geint32(326)),
(T4)(geint32(327)),
(T4)(geint32(365)),
(T4)(geint32(0)),
(T4)(geint32(336)),
(T4)(geint32(0)),
(T4)(geint32(1653)),
(T4)(geint32(329)),
(T4)(geint32(379)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(375)),
(T4)(geint32(1653)),
(T4)(geint32(100)),
(T4)(geint32(1613)),
(T4)(geint32(124)),
(T4)(geint32(0)),
(T4)(geint32(1653)),
(T4)(geint32(382)),
(T4)(geint32(442)),
(T4)(geint32(0)),
(T4)(geint32(1599)),
(T4)(geint32(1583)),
(T4)(geint32(109)),
(T4)(geint32(1582)),
(T4)(geint32(1587)),
(T4)(geint32(1584)),
(T4)(geint32(1578)),
(T4)(geint32(472)),
(T4)(geint32(1577)),
(T4)(geint32(1577)),
(T4)(geint32(1589)),
(T4)(geint32(1583)),
(T4)(geint32(1575)),
(T4)(geint32(1606)),
(T4)(geint32(1653)),
(T4)(geint32(383)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(404)),
(T4)(geint32(136)),
(T4)(geint32(1653)),
(T4)(geint32(1594)),
(T4)(geint32(0)),
(T4)(geint32(407)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(410)),
(T4)(geint32(1603)),
(T4)(geint32(1653)),
(T4)(geint32(1653)),
(T4)(geint32(1653)),
(T4)(geint32(1601)),
(T4)(geint32(1653)),
(T4)(geint32(411)),
(T4)(geint32(1653)),
(T4)(geint32(1582)),
(T4)(geint32(349)),
(T4)(geint32(387)),
(T4)(geint32(483)),
(T4)(geint32(0)),
(T4)(geint32(411)),
(T4)(geint32(1653)),
(T4)(geint32(414)),
(T4)(geint32(1596)),
(T4)(geint32(310)),
(T4)(geint32(0)),
(T4)(geint32(398)),
(T4)(geint32(1653)),
(T4)(geint32(1591)),
(T4)(geint32(1590)),
(T4)(geint32(1599)),
(T4)(geint32(405)),
(T4)(geint32(1653)),
(T4)(geint32(407)),
(T4)(geint32(0)),
(T4)(geint32(1571)),
(T4)(geint32(1576)),
(T4)(geint32(1560)),
(T4)(geint32(1578)),
(T4)(geint32(0)),
(T4)(geint32(1566)),
(T4)(geint32(1572)),
(T4)(geint32(1575)),
(T4)(geint32(1574)),
(T4)(geint32(1573)),
(T4)(geint32(1568)),
(T4)(geint32(1569)),
(T4)(geint32(1551)),
(T4)(geint32(1561)),
(T4)(geint32(1564)),
(T4)(geint32(390)),
(T4)(geint32(1563)),
(T4)(geint32(1566)),
(T4)(geint32(1560)),
(T4)(geint32(397)),
(T4)(geint32(1571)),
(T4)(geint32(1559)),
(T4)(geint32(1549)),
(T4)(geint32(1566)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(1546)),
(T4)(geint32(388)),
(T4)(geint32(1653)),
(T4)(geint32(487)),
(T4)(geint32(519)),
(T4)(geint32(1653)),
(T4)(geint32(1576)),
(T4)(geint32(416)),
(T4)(geint32(1653)),
(T4)(geint32(418)),
(T4)(geint32(497)),
(T4)(geint32(1574)),
(T4)(geint32(0)),
(T4)(geint32(1569)),
(T4)(geint32(425)),
(T4)(geint32(495)),
(T4)(geint32(1537)),
(T4)(geint32(1562)),
(T4)(geint32(1548)),
(T4)(geint32(1534)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(1559)),
(T4)(geint32(1549)),
(T4)(geint32(1533)),
(T4)(geint32(491)),
(T4)(geint32(1532)),
(T4)(geint32(1537)),
(T4)(geint32(1534)),
(T4)(geint32(1528)),
(T4)(geint32(1528)),
(T4)(geint32(1540)),
(T4)(geint32(1534)),
(T4)(geint32(1526)),
(T4)(geint32(1533)),
(T4)(geint32(1522)),
(T4)(geint32(1546)),
(T4)(geint32(494)),
(T4)(geint32(1536)),
(T4)(geint32(0)),
(T4)(geint32(1532)),
(T4)(geint32(502)),
(T4)(geint32(550)),
(T4)(geint32(456)),
(T4)(geint32(475)),
(T4)(geint32(1548)),
(T4)(geint32(507)),
(T4)(geint32(512)),
(T4)(geint32(521)),
(T4)(geint32(1520)),
(T4)(geint32(81)),
(T4)(geint32(0)),
(T4)(geint32(1523)),
(T4)(geint32(1529)),
(T4)(geint32(1522)),
(T4)(geint32(1527)),
(T4)(geint32(1511)),
(T4)(geint32(1529)),
(T4)(geint32(0)),
(T4)(geint32(1517)),
(T4)(geint32(1523)),
(T4)(geint32(1526)),
(T4)(geint32(510)),
(T4)(geint32(1532)),
(T4)(geint32(1520)),
(T4)(geint32(1510)),
(T4)(geint32(1511)),
(T4)(geint32(1513)),
(T4)(geint32(529)),
(T4)(geint32(1518)),
(T4)(geint32(1505)),
(T4)(geint32(1500)),
(T4)(geint32(1518)),
(T4)(geint32(492)),
(T4)(geint32(506)),
(T4)(geint32(544)),
(T4)(geint32(0)),
(T4)(geint32(1503)),
(T4)(geint32(1511)),
(T4)(geint32(1496)),
(T4)(geint32(1511)),
(T4)(geint32(1493)),
(T4)(geint32(1518)),
(T4)(geint32(1504)),
(T4)(geint32(1490)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(1515)),
(T4)(geint32(1489)),
(T4)(geint32(1513)),
(T4)(geint32(534)),
(T4)(geint32(1503)),
(T4)(geint32(0)),
(T4)(geint32(1500)),
(T4)(geint32(1489)),
(T4)(geint32(1500)),
(T4)(geint32(1487)),
(T4)(geint32(1482)),
(T4)(geint32(1494)),
(T4)(geint32(0)),
(T4)(geint32(1499)),
(T4)(geint32(548)),
(T4)(geint32(1480)),
(T4)(geint32(1483)),
(T4)(geint32(0)),
(T4)(geint32(1478)),
(T4)(geint32(1479)),
(T4)(geint32(352)),
(T4)(geint32(0)),
(T4)(geint32(1482)),
(T4)(geint32(1488)),
(T4)(geint32(1483)),
(T4)(geint32(537)),
(T4)(geint32(1488)),
(T4)(geint32(1475)),
(T4)(geint32(1470)),
(T4)(geint32(1489)),
(T4)(geint32(1473)),
(T4)(geint32(1467)),
(T4)(geint32(1479)),
(T4)(geint32(1475)),
(T4)(geint32(1489)),
(T4)(geint32(1653)),
(T4)(geint32(1477)),
(T4)(geint32(1463)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(1466)),
(T4)(geint32(1474)),
(T4)(geint32(1459)),
(T4)(geint32(1474)),
(T4)(geint32(1461)),
(T4)(geint32(1472)),
(T4)(geint32(1459)),
(T4)(geint32(1454)),
(T4)(geint32(1466)),
(T4)(geint32(0)),
(T4)(geint32(1653)),
(T4)(geint32(0)),
(T4)(geint32(1462)),
(T4)(geint32(1476)),
(T4)(geint32(1454)),
(T4)(geint32(1467)),
(T4)(geint32(1453)),
(T4)(geint32(1457)),
(T4)(geint32(1447)),
(T4)(geint32(1450)),
(T4)(geint32(0)),
(T4)(geint32(1445)),
(T4)(geint32(1448)),
(T4)(geint32(1442)),
(T4)(geint32(1454)),
(T4)(geint32(1450)),
(T4)(geint32(1464)),
(T4)(geint32(1442)),
(T4)(geint32(1455)),
(T4)(geint32(1441)),
(T4)(geint32(1451)),
(T4)(geint32(1417)),
(T4)(geint32(1376)),
(T4)(geint32(1370)),
(T4)(geint32(1337)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(1326)),
(T4)(geint32(1321)),
(T4)(geint32(1280)),
(T4)(geint32(1274)),
(T4)(geint32(1241)),
(T4)(geint32(1232)),
(T4)(geint32(0)),
(T4)(geint32(1200)),
(T4)(geint32(1206)),
(T4)(geint32(1186)),
(T4)(geint32(1168)),
(T4)(geint32(1172)),
(T4)(geint32(1164)),
(T4)(geint32(1156)),
(T4)(geint32(1123)),
(T4)(geint32(1129)),
(T4)(geint32(0)),
(T4)(geint32(1059)),
(T4)(geint32(1068)),
(T4)(geint32(1038)),
(T4)(geint32(1016)),
(T4)(geint32(1016)),
(T4)(geint32(987)),
(T4)(geint32(989)),
(T4)(geint32(946)),
(T4)(geint32(0)),
(T4)(geint32(926)),
(T4)(geint32(916)),
(T4)(geint32(895)),
(T4)(geint32(900)),
(T4)(geint32(903)),
(T4)(geint32(898)),
(T4)(geint32(873)),
(T4)(geint32(0)),
(T4)(geint32(852)),
(T4)(geint32(861)),
(T4)(geint32(847)),
(T4)(geint32(543)),
(T4)(geint32(528)),
(T4)(geint32(0)),
(T4)(geint32(529)),
(T4)(geint32(522)),
(T4)(geint32(532)),
(T4)(geint32(525)),
(T4)(geint32(491)),
(T4)(geint32(0)),
(T4)(geint32(491)),
(T4)(geint32(478)),
(T4)(geint32(403)),
(T4)(geint32(339)),
(T4)(geint32(322)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(303)),
(T4)(geint32(303)),
(T4)(geint32(0)),
(T4)(geint32(113)),
(T4)(geint32(0)),
(T4)(geint32(1653)),
(T4)(geint32(595)),
(T4)(geint32(615)),
(T4)(geint32(635)),
(T4)(geint32(655)),
(T4)(geint32(675)),
(T4)(geint32(695)),
(T4)(geint32(715)),
(T4)(geint32(735)),
(T4)(geint32(755)),
(T4)(geint32(775)),
(T4)(geint32(795)),
(T4)(geint32(815)),
(T4)(geint32(835)),
(T4)(geint32(855)),
(T4)(geint32(871)),
(T4)(geint32(883)),
(T4)(geint32(567)),
(T4)(geint32(901)),
(T4)(geint32(921)),
(T4)(geint32(941)),
(T4)(geint32(961)),
(T4)(geint32(975)),
(T4)(geint32(991)),
(T4)(geint32(1004)),
(T4)(geint32(1022)),
(T4)(geint32(1035)),
(T4)(geint32(1053)),
(T4)(geint32(1073)),
(T4)(geint32(1093)),
(T4)(geint32(1113)),
(T4)(geint32(1133)),
(T4)(geint32(1153)),
(T4)(geint32(1173)),
(T4)(geint32(574)),
(T4)(geint32(1193)),
(T4)(geint32(1211)),
(T4)(geint32(1231)),
(T4)(geint32(1251)),
(T4)(geint32(1271)),
(T4)(geint32(1291)),
(T4)(geint32(1311)),
(T4)(geint32(584)),
(T4)(geint32(1331)),
(T4)(geint32(1351)),
(T4)(geint32(1371)),
(T4)(geint32(1391)),
(T4)(geint32(869)),
(T4)(geint32(1411)),
(T4)(geint32(1431)),
(T4)(geint32(1451)),
(T4)(geint32(2147483647))));
	R = (T35f262(C, t1));
	ge109ov2660 = R;
	return R;
}

/* LX_LEX_PARSER.yy_chk_template */
unsigned char ge109os2659 = '\0';
T0* ge109ov2659;
T0* T35f237(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge109os2659) {
		return ge109ov2659;
	} else {
		ge109os2659 = '\1';
	}
	t1 = (gema130((T4)1704,
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(31)),
(T4)(geint32(32)),
(T4)(geint32(31)),
(T4)(geint32(32)),
(T4)(geint32(39)),
(T4)(geint32(0)),
(T4)(geint32(39)),
(T4)(geint32(1)),
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
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(45)),
(T4)(geint32(7)),
(T4)(geint32(45)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(88)),
(T4)(geint32(88)),
(T4)(geint32(3)),
(T4)(geint32(7)),
(T4)(geint32(23)),
(T4)(geint32(8)),
(T4)(geint32(3)),
(T4)(geint32(8)),
(T4)(geint32(8)),
(T4)(geint32(17)),
(T4)(geint32(17)),
(T4)(geint32(17)),
(T4)(geint32(8)),
(T4)(geint32(27)),
(T4)(geint32(18)),
(T4)(geint32(18)),
(T4)(geint32(18)),
(T4)(geint32(19)),
(T4)(geint32(17)),
(T4)(geint32(19)),
(T4)(geint32(24)),
(T4)(geint32(17)),
(T4)(geint32(17)),
(T4)(geint32(18)),
(T4)(geint32(93)),
(T4)(geint32(112)),
(T4)(geint32(18)),
(T4)(geint32(18)),
(T4)(geint32(20)),
(T4)(geint32(55)),
(T4)(geint32(20)),
(T4)(geint32(55)),
(T4)(geint32(61)),
(T4)(geint32(156)),
(T4)(geint32(61)),
(T4)(geint32(3)),
(T4)(geint32(28)),
(T4)(geint32(3)),
(T4)(geint32(298)),
(T4)(geint32(3)),
(T4)(geint32(4)),
(T4)(geint32(4)),
(T4)(geint32(4)),
(T4)(geint32(156)),
(T4)(geint32(74)),
(T4)(geint32(4)),
(T4)(geint32(74)),
(T4)(geint32(298)),
(T4)(geint32(23)),
(T4)(geint32(23)),
(T4)(geint32(4)),
(T4)(geint32(93)),
(T4)(geint32(112)),
(T4)(geint32(27)),
(T4)(geint32(4)),
(T4)(geint32(27)),
(T4)(geint32(17)),
(T4)(geint32(19)),
(T4)(geint32(80)),
(T4)(geint32(166)),
(T4)(geint32(80)),
(T4)(geint32(18)),
(T4)(geint32(158)),
(T4)(geint32(166)),
(T4)(geint32(24)),
(T4)(geint32(24)),
(T4)(geint32(468)),
(T4)(geint32(158)),
(T4)(geint32(20)),
(T4)(geint32(25)),
(T4)(geint32(25)),
(T4)(geint32(25)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(85)),
(T4)(geint32(28)),
(T4)(geint32(85)),
(T4)(geint32(28)),
(T4)(geint32(25)),
(T4)(geint32(183)),
(T4)(geint32(183)),
(T4)(geint32(26)),
(T4)(geint32(4)),
(T4)(geint32(95)),
(T4)(geint32(4)),
(T4)(geint32(95)),
(T4)(geint32(4)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(21)),
(T4)(geint32(29)),
(T4)(geint32(107)),
(T4)(geint32(30)),
(T4)(geint32(107)),
(T4)(geint32(113)),
(T4)(geint32(117)),
(T4)(geint32(123)),
(T4)(geint32(130)),
(T4)(geint32(123)),
(T4)(geint32(29)),
(T4)(geint32(141)),
(T4)(geint32(30)),
(T4)(geint32(35)),
(T4)(geint32(211)),
(T4)(geint32(133)),
(T4)(geint32(35)),
(T4)(geint32(133)),
(T4)(geint32(36)),
(T4)(geint32(211)),
(T4)(geint32(35)),
(T4)(geint32(36)),
(T4)(geint32(126)),
(T4)(geint32(126)),
(T4)(geint32(126)),
(T4)(geint32(36)),
(T4)(geint32(138)),
(T4)(geint32(142)),
(T4)(geint32(138)),
(T4)(geint32(143)),
(T4)(geint32(144)),
(T4)(geint32(466)),
(T4)(geint32(42)),
(T4)(geint32(117)),
(T4)(geint32(147)),
(T4)(geint32(130)),
(T4)(geint32(147)),
(T4)(geint32(113)),
(T4)(geint32(465)),
(T4)(geint32(150)),
(T4)(geint32(150)),
(T4)(geint32(29)),
(T4)(geint32(29)),
(T4)(geint32(30)),
(T4)(geint32(30)),
(T4)(geint32(33)),
(T4)(geint32(33)),
(T4)(geint32(33)),
(T4)(geint32(33)),
(T4)(geint32(33)),
(T4)(geint32(462)),
(T4)(geint32(141)),
(T4)(geint32(33)),
(T4)(geint32(33)),
(T4)(geint32(142)),
(T4)(geint32(35)),
(T4)(geint32(33)),
(T4)(geint32(35)),
(T4)(geint32(42)),
(T4)(geint32(33)),
(T4)(geint32(36)),
(T4)(geint32(42)),
(T4)(geint32(36)),
(T4)(geint32(145)),
(T4)(geint32(145)),
(T4)(geint32(145)),
(T4)(geint32(42)),
(T4)(geint32(142)),
(T4)(geint32(461)),
(T4)(geint32(143)),
(T4)(geint32(144)),
(T4)(geint32(150)),
(T4)(geint32(42)),
(T4)(geint32(145)),
(T4)(geint32(150)),
(T4)(geint32(355)),
(T4)(geint32(154)),
(T4)(geint32(151)),
(T4)(geint32(154)),
(T4)(geint32(151)),
(T4)(geint32(161)),
(T4)(geint32(179)),
(T4)(geint32(161)),
(T4)(geint32(179)),
(T4)(geint32(355)),
(T4)(geint32(33)),
(T4)(geint32(33)),
(T4)(geint32(151)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(33)),
(T4)(geint32(33)),
(T4)(geint32(34)),
(T4)(geint32(34)),
(T4)(geint32(34)),
(T4)(geint32(34)),
(T4)(geint32(34)),
(T4)(geint32(204)),
(T4)(geint32(249)),
(T4)(geint32(34)),
(T4)(geint32(34)),
(T4)(geint32(213)),
(T4)(geint32(182)),
(T4)(geint32(34)),
(T4)(geint32(182)),
(T4)(geint32(187)),
(T4)(geint32(34)),
(T4)(geint32(187)),
(T4)(geint32(193)),
(T4)(geint32(200)),
(T4)(geint32(193)),
(T4)(geint32(200)),
(T4)(geint32(207)),
(T4)(geint32(209)),
(T4)(geint32(207)),
(T4)(geint32(218)),
(T4)(geint32(218)),
(T4)(geint32(220)),
(T4)(geint32(220)),
(T4)(geint32(237)),
(T4)(geint32(241)),
(T4)(geint32(237)),
(T4)(geint32(460)),
(T4)(geint32(209)),
(T4)(geint32(204)),
(T4)(geint32(249)),
(T4)(geint32(255)),
(T4)(geint32(255)),
(T4)(geint32(257)),
(T4)(geint32(257)),
(T4)(geint32(241)),
(T4)(geint32(213)),
(T4)(geint32(34)),
(T4)(geint32(34)),
(T4)(geint32(262)),
(T4)(geint32(262)),
(T4)(geint32(262)),
(T4)(geint32(34)),
(T4)(geint32(34)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(213)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(171)),
(T4)(geint32(171)),
(T4)(geint32(171)),
(T4)(geint32(171)),
(T4)(geint32(171)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(291)),
(T4)(geint32(291)),
(T4)(geint32(251)),
(T4)(geint32(171)),
(T4)(geint32(171)),
(T4)(geint32(258)),
(T4)(geint32(459)),
(T4)(geint32(171)),
(T4)(geint32(171)),
(T4)(geint32(263)),
(T4)(geint32(263)),
(T4)(geint32(263)),
(T4)(geint32(273)),
(T4)(geint32(171)),
(T4)(geint32(285)),
(T4)(geint32(458)),
(T4)(geint32(273)),
(T4)(geint32(289)),
(T4)(geint32(285)),
(T4)(geint32(292)),
(T4)(geint32(292)),
(T4)(geint32(294)),
(T4)(geint32(294)),
(T4)(geint32(294)),
(T4)(geint32(456)),
(T4)(geint32(258)),
(T4)(geint32(295)),
(T4)(geint32(295)),
(T4)(geint32(295)),
(T4)(geint32(296)),
(T4)(geint32(205)),
(T4)(geint32(251)),
(T4)(geint32(251)),
(T4)(geint32(205)),
(T4)(geint32(252)),
(T4)(geint32(252)),
(T4)(geint32(321)),
(T4)(geint32(321)),
(T4)(geint32(310)),
(T4)(geint32(252)),
(T4)(geint32(252)),
(T4)(geint32(252)),
(T4)(geint32(252)),
(T4)(geint32(252)),
(T4)(geint32(252)),
(T4)(geint32(258)),
(T4)(geint32(289)),
(T4)(geint32(289)),
(T4)(geint32(310)),
(T4)(geint32(316)),
(T4)(geint32(322)),
(T4)(geint32(322)),
(T4)(geint32(323)),
(T4)(geint32(316)),
(T4)(geint32(338)),
(T4)(geint32(296)),
(T4)(geint32(349)),
(T4)(geint32(360)),
(T4)(geint32(338)),
(T4)(geint32(455)),
(T4)(geint32(454)),
(T4)(geint32(360)),
(T4)(geint32(453)),
(T4)(geint32(252)),
(T4)(geint32(252)),
(T4)(geint32(290)),
(T4)(geint32(290)),
(T4)(geint32(452)),
(T4)(geint32(450)),
(T4)(geint32(296)),
(T4)(geint32(290)),
(T4)(geint32(290)),
(T4)(geint32(290)),
(T4)(geint32(290)),
(T4)(geint32(290)),
(T4)(geint32(290)),
(T4)(geint32(449)),
(T4)(geint32(323)),
(T4)(geint32(487)),
(T4)(geint32(487)),
(T4)(geint32(487)),
(T4)(geint32(487)),
(T4)(geint32(487)),
(T4)(geint32(487)),
(T4)(geint32(487)),
(T4)(geint32(504)),
(T4)(geint32(504)),
(T4)(geint32(504)),
(T4)(geint32(504)),
(T4)(geint32(504)),
(T4)(geint32(504)),
(T4)(geint32(504)),
(T4)(geint32(323)),
(T4)(geint32(512)),
(T4)(geint32(512)),
(T4)(geint32(512)),
(T4)(geint32(349)),
(T4)(geint32(471)),
(T4)(geint32(471)),
(T4)(geint32(471)),
(T4)(geint32(471)),
(T4)(geint32(471)),
(T4)(geint32(471)),
(T4)(geint32(471)),
(T4)(geint32(471)),
(T4)(geint32(471)),
(T4)(geint32(471)),
(T4)(geint32(471)),
(T4)(geint32(471)),
(T4)(geint32(471)),
(T4)(geint32(471)),
(T4)(geint32(471)),
(T4)(geint32(471)),
(T4)(geint32(471)),
(T4)(geint32(471)),
(T4)(geint32(471)),
(T4)(geint32(471)),
(T4)(geint32(472)),
(T4)(geint32(472)),
(T4)(geint32(472)),
(T4)(geint32(472)),
(T4)(geint32(472)),
(T4)(geint32(472)),
(T4)(geint32(472)),
(T4)(geint32(472)),
(T4)(geint32(472)),
(T4)(geint32(472)),
(T4)(geint32(472)),
(T4)(geint32(472)),
(T4)(geint32(472)),
(T4)(geint32(472)),
(T4)(geint32(472)),
(T4)(geint32(472)),
(T4)(geint32(472)),
(T4)(geint32(472)),
(T4)(geint32(472)),
(T4)(geint32(472)),
(T4)(geint32(473)),
(T4)(geint32(473)),
(T4)(geint32(473)),
(T4)(geint32(473)),
(T4)(geint32(473)),
(T4)(geint32(473)),
(T4)(geint32(473)),
(T4)(geint32(473)),
(T4)(geint32(473)),
(T4)(geint32(473)),
(T4)(geint32(473)),
(T4)(geint32(473)),
(T4)(geint32(473)),
(T4)(geint32(473)),
(T4)(geint32(473)),
(T4)(geint32(473)),
(T4)(geint32(473)),
(T4)(geint32(473)),
(T4)(geint32(473)),
(T4)(geint32(473)),
(T4)(geint32(474)),
(T4)(geint32(474)),
(T4)(geint32(474)),
(T4)(geint32(474)),
(T4)(geint32(474)),
(T4)(geint32(474)),
(T4)(geint32(474)),
(T4)(geint32(474)),
(T4)(geint32(474)),
(T4)(geint32(474)),
(T4)(geint32(474)),
(T4)(geint32(474)),
(T4)(geint32(474)),
(T4)(geint32(474)),
(T4)(geint32(474)),
(T4)(geint32(474)),
(T4)(geint32(474)),
(T4)(geint32(474)),
(T4)(geint32(474)),
(T4)(geint32(474)),
(T4)(geint32(475)),
(T4)(geint32(475)),
(T4)(geint32(475)),
(T4)(geint32(475)),
(T4)(geint32(475)),
(T4)(geint32(475)),
(T4)(geint32(475)),
(T4)(geint32(475)),
(T4)(geint32(475)),
(T4)(geint32(475)),
(T4)(geint32(475)),
(T4)(geint32(475)),
(T4)(geint32(475)),
(T4)(geint32(475)),
(T4)(geint32(475)),
(T4)(geint32(475)),
(T4)(geint32(475)),
(T4)(geint32(475)),
(T4)(geint32(475)),
(T4)(geint32(475)),
(T4)(geint32(476)),
(T4)(geint32(476)),
(T4)(geint32(476)),
(T4)(geint32(476)),
(T4)(geint32(476)),
(T4)(geint32(476)),
(T4)(geint32(476)),
(T4)(geint32(476)),
(T4)(geint32(476)),
(T4)(geint32(476)),
(T4)(geint32(476)),
(T4)(geint32(476)),
(T4)(geint32(476)),
(T4)(geint32(476)),
(T4)(geint32(476)),
(T4)(geint32(476)),
(T4)(geint32(476)),
(T4)(geint32(476)),
(T4)(geint32(476)),
(T4)(geint32(476)),
(T4)(geint32(477)),
(T4)(geint32(477)),
(T4)(geint32(477)),
(T4)(geint32(477)),
(T4)(geint32(477)),
(T4)(geint32(477)),
(T4)(geint32(477)),
(T4)(geint32(477)),
(T4)(geint32(477)),
(T4)(geint32(477)),
(T4)(geint32(477)),
(T4)(geint32(477)),
(T4)(geint32(477)),
(T4)(geint32(477)),
(T4)(geint32(477)),
(T4)(geint32(477)),
(T4)(geint32(477)),
(T4)(geint32(477)),
(T4)(geint32(477)),
(T4)(geint32(477)),
(T4)(geint32(478)),
(T4)(geint32(478)),
(T4)(geint32(478)),
(T4)(geint32(478)),
(T4)(geint32(478)),
(T4)(geint32(478)),
(T4)(geint32(478)),
(T4)(geint32(478)),
(T4)(geint32(478)),
(T4)(geint32(478)),
(T4)(geint32(478)),
(T4)(geint32(478)),
(T4)(geint32(478)),
(T4)(geint32(478)),
(T4)(geint32(478)),
(T4)(geint32(478)),
(T4)(geint32(478)),
(T4)(geint32(478)),
(T4)(geint32(478)),
(T4)(geint32(478)),
(T4)(geint32(479)),
(T4)(geint32(479)),
(T4)(geint32(479)),
(T4)(geint32(479)),
(T4)(geint32(479)),
(T4)(geint32(479)),
(T4)(geint32(479)),
(T4)(geint32(479)),
(T4)(geint32(479)),
(T4)(geint32(479)),
(T4)(geint32(479)),
(T4)(geint32(479)),
(T4)(geint32(479)),
(T4)(geint32(479)),
(T4)(geint32(479)),
(T4)(geint32(479)),
(T4)(geint32(479)),
(T4)(geint32(479)),
(T4)(geint32(479)),
(T4)(geint32(479)),
(T4)(geint32(480)),
(T4)(geint32(480)),
(T4)(geint32(480)),
(T4)(geint32(480)),
(T4)(geint32(480)),
(T4)(geint32(480)),
(T4)(geint32(480)),
(T4)(geint32(480)),
(T4)(geint32(480)),
(T4)(geint32(480)),
(T4)(geint32(480)),
(T4)(geint32(480)),
(T4)(geint32(480)),
(T4)(geint32(480)),
(T4)(geint32(480)),
(T4)(geint32(480)),
(T4)(geint32(480)),
(T4)(geint32(480)),
(T4)(geint32(480)),
(T4)(geint32(480)),
(T4)(geint32(481)),
(T4)(geint32(481)),
(T4)(geint32(481)),
(T4)(geint32(481)),
(T4)(geint32(481)),
(T4)(geint32(481)),
(T4)(geint32(481)),
(T4)(geint32(481)),
(T4)(geint32(481)),
(T4)(geint32(481)),
(T4)(geint32(481)),
(T4)(geint32(481)),
(T4)(geint32(481)),
(T4)(geint32(481)),
(T4)(geint32(481)),
(T4)(geint32(481)),
(T4)(geint32(481)),
(T4)(geint32(481)),
(T4)(geint32(481)),
(T4)(geint32(481)),
(T4)(geint32(482)),
(T4)(geint32(482)),
(T4)(geint32(482)),
(T4)(geint32(482)),
(T4)(geint32(482)),
(T4)(geint32(482)),
(T4)(geint32(482)),
(T4)(geint32(482)),
(T4)(geint32(482)),
(T4)(geint32(482)),
(T4)(geint32(482)),
(T4)(geint32(482)),
(T4)(geint32(482)),
(T4)(geint32(482)),
(T4)(geint32(482)),
(T4)(geint32(482)),
(T4)(geint32(482)),
(T4)(geint32(482)),
(T4)(geint32(482)),
(T4)(geint32(482)),
(T4)(geint32(483)),
(T4)(geint32(483)),
(T4)(geint32(483)),
(T4)(geint32(483)),
(T4)(geint32(483)),
(T4)(geint32(483)),
(T4)(geint32(483)),
(T4)(geint32(483)),
(T4)(geint32(483)),
(T4)(geint32(483)),
(T4)(geint32(483)),
(T4)(geint32(483)),
(T4)(geint32(483)),
(T4)(geint32(483)),
(T4)(geint32(483)),
(T4)(geint32(483)),
(T4)(geint32(483)),
(T4)(geint32(483)),
(T4)(geint32(483)),
(T4)(geint32(483)),
(T4)(geint32(484)),
(T4)(geint32(484)),
(T4)(geint32(484)),
(T4)(geint32(484)),
(T4)(geint32(484)),
(T4)(geint32(484)),
(T4)(geint32(484)),
(T4)(geint32(484)),
(T4)(geint32(484)),
(T4)(geint32(484)),
(T4)(geint32(484)),
(T4)(geint32(484)),
(T4)(geint32(484)),
(T4)(geint32(484)),
(T4)(geint32(484)),
(T4)(geint32(484)),
(T4)(geint32(484)),
(T4)(geint32(484)),
(T4)(geint32(484)),
(T4)(geint32(484)),
(T4)(geint32(485)),
(T4)(geint32(517)),
(T4)(geint32(517)),
(T4)(geint32(517)),
(T4)(geint32(448)),
(T4)(geint32(485)),
(T4)(geint32(485)),
(T4)(geint32(485)),
(T4)(geint32(485)),
(T4)(geint32(485)),
(T4)(geint32(485)),
(T4)(geint32(485)),
(T4)(geint32(447)),
(T4)(geint32(446)),
(T4)(geint32(485)),
(T4)(geint32(486)),
(T4)(geint32(486)),
(T4)(geint32(486)),
(T4)(geint32(486)),
(T4)(geint32(486)),
(T4)(geint32(486)),
(T4)(geint32(486)),
(T4)(geint32(486)),
(T4)(geint32(486)),
(T4)(geint32(444)),
(T4)(geint32(486)),
(T4)(geint32(488)),
(T4)(geint32(488)),
(T4)(geint32(488)),
(T4)(geint32(488)),
(T4)(geint32(488)),
(T4)(geint32(488)),
(T4)(geint32(488)),
(T4)(geint32(488)),
(T4)(geint32(488)),
(T4)(geint32(488)),
(T4)(geint32(488)),
(T4)(geint32(488)),
(T4)(geint32(488)),
(T4)(geint32(488)),
(T4)(geint32(488)),
(T4)(geint32(488)),
(T4)(geint32(488)),
(T4)(geint32(488)),
(T4)(geint32(488)),
(T4)(geint32(488)),
(T4)(geint32(489)),
(T4)(geint32(489)),
(T4)(geint32(489)),
(T4)(geint32(443)),
(T4)(geint32(442)),
(T4)(geint32(441)),
(T4)(geint32(440)),
(T4)(geint32(489)),
(T4)(geint32(489)),
(T4)(geint32(489)),
(T4)(geint32(489)),
(T4)(geint32(489)),
(T4)(geint32(489)),
(T4)(geint32(489)),
(T4)(geint32(489)),
(T4)(geint32(489)),
(T4)(geint32(489)),
(T4)(geint32(489)),
(T4)(geint32(489)),
(T4)(geint32(489)),
(T4)(geint32(490)),
(T4)(geint32(439)),
(T4)(geint32(490)),
(T4)(geint32(490)),
(T4)(geint32(490)),
(T4)(geint32(490)),
(T4)(geint32(490)),
(T4)(geint32(490)),
(T4)(geint32(490)),
(T4)(geint32(490)),
(T4)(geint32(490)),
(T4)(geint32(490)),
(T4)(geint32(490)),
(T4)(geint32(490)),
(T4)(geint32(490)),
(T4)(geint32(490)),
(T4)(geint32(490)),
(T4)(geint32(490)),
(T4)(geint32(490)),
(T4)(geint32(490)),
(T4)(geint32(491)),
(T4)(geint32(438)),
(T4)(geint32(491)),
(T4)(geint32(491)),
(T4)(geint32(491)),
(T4)(geint32(436)),
(T4)(geint32(491)),
(T4)(geint32(491)),
(T4)(geint32(491)),
(T4)(geint32(491)),
(T4)(geint32(491)),
(T4)(geint32(491)),
(T4)(geint32(491)),
(T4)(geint32(491)),
(T4)(geint32(491)),
(T4)(geint32(491)),
(T4)(geint32(491)),
(T4)(geint32(491)),
(T4)(geint32(491)),
(T4)(geint32(491)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(492)),
(T4)(geint32(493)),
(T4)(geint32(493)),
(T4)(geint32(493)),
(T4)(geint32(493)),
(T4)(geint32(493)),
(T4)(geint32(493)),
(T4)(geint32(493)),
(T4)(geint32(493)),
(T4)(geint32(493)),
(T4)(geint32(493)),
(T4)(geint32(493)),
(T4)(geint32(493)),
(T4)(geint32(493)),
(T4)(geint32(493)),
(T4)(geint32(493)),
(T4)(geint32(493)),
(T4)(geint32(493)),
(T4)(geint32(493)),
(T4)(geint32(493)),
(T4)(geint32(493)),
(T4)(geint32(494)),
(T4)(geint32(494)),
(T4)(geint32(494)),
(T4)(geint32(494)),
(T4)(geint32(494)),
(T4)(geint32(494)),
(T4)(geint32(494)),
(T4)(geint32(494)),
(T4)(geint32(494)),
(T4)(geint32(435)),
(T4)(geint32(494)),
(T4)(geint32(495)),
(T4)(geint32(434)),
(T4)(geint32(495)),
(T4)(geint32(495)),
(T4)(geint32(495)),
(T4)(geint32(495)),
(T4)(geint32(495)),
(T4)(geint32(495)),
(T4)(geint32(495)),
(T4)(geint32(495)),
(T4)(geint32(495)),
(T4)(geint32(495)),
(T4)(geint32(495)),
(T4)(geint32(495)),
(T4)(geint32(495)),
(T4)(geint32(495)),
(T4)(geint32(495)),
(T4)(geint32(495)),
(T4)(geint32(495)),
(T4)(geint32(495)),
(T4)(geint32(496)),
(T4)(geint32(496)),
(T4)(geint32(496)),
(T4)(geint32(496)),
(T4)(geint32(496)),
(T4)(geint32(496)),
(T4)(geint32(496)),
(T4)(geint32(496)),
(T4)(geint32(496)),
(T4)(geint32(433)),
(T4)(geint32(496)),
(T4)(geint32(497)),
(T4)(geint32(432)),
(T4)(geint32(497)),
(T4)(geint32(497)),
(T4)(geint32(497)),
(T4)(geint32(497)),
(T4)(geint32(497)),
(T4)(geint32(497)),
(T4)(geint32(497)),
(T4)(geint32(497)),
(T4)(geint32(497)),
(T4)(geint32(497)),
(T4)(geint32(497)),
(T4)(geint32(497)),
(T4)(geint32(497)),
(T4)(geint32(497)),
(T4)(geint32(497)),
(T4)(geint32(497)),
(T4)(geint32(497)),
(T4)(geint32(497)),
(T4)(geint32(498)),
(T4)(geint32(431)),
(T4)(geint32(498)),
(T4)(geint32(498)),
(T4)(geint32(498)),
(T4)(geint32(498)),
(T4)(geint32(498)),
(T4)(geint32(498)),
(T4)(geint32(498)),
(T4)(geint32(498)),
(T4)(geint32(498)),
(T4)(geint32(498)),
(T4)(geint32(498)),
(T4)(geint32(498)),
(T4)(geint32(498)),
(T4)(geint32(498)),
(T4)(geint32(498)),
(T4)(geint32(498)),
(T4)(geint32(498)),
(T4)(geint32(498)),
(T4)(geint32(499)),
(T4)(geint32(430)),
(T4)(geint32(429)),
(T4)(geint32(499)),
(T4)(geint32(499)),
(T4)(geint32(499)),
(T4)(geint32(499)),
(T4)(geint32(499)),
(T4)(geint32(499)),
(T4)(geint32(499)),
(T4)(geint32(499)),
(T4)(geint32(499)),
(T4)(geint32(499)),
(T4)(geint32(499)),
(T4)(geint32(499)),
(T4)(geint32(499)),
(T4)(geint32(499)),
(T4)(geint32(499)),
(T4)(geint32(499)),
(T4)(geint32(499)),
(T4)(geint32(500)),
(T4)(geint32(500)),
(T4)(geint32(500)),
(T4)(geint32(500)),
(T4)(geint32(500)),
(T4)(geint32(500)),
(T4)(geint32(500)),
(T4)(geint32(500)),
(T4)(geint32(500)),
(T4)(geint32(500)),
(T4)(geint32(500)),
(T4)(geint32(500)),
(T4)(geint32(500)),
(T4)(geint32(500)),
(T4)(geint32(500)),
(T4)(geint32(500)),
(T4)(geint32(500)),
(T4)(geint32(500)),
(T4)(geint32(500)),
(T4)(geint32(500)),
(T4)(geint32(501)),
(T4)(geint32(501)),
(T4)(geint32(501)),
(T4)(geint32(501)),
(T4)(geint32(501)),
(T4)(geint32(501)),
(T4)(geint32(501)),
(T4)(geint32(501)),
(T4)(geint32(501)),
(T4)(geint32(501)),
(T4)(geint32(501)),
(T4)(geint32(501)),
(T4)(geint32(501)),
(T4)(geint32(501)),
(T4)(geint32(501)),
(T4)(geint32(501)),
(T4)(geint32(427)),
(T4)(geint32(501)),
(T4)(geint32(501)),
(T4)(geint32(501)),
(T4)(geint32(502)),
(T4)(geint32(426)),
(T4)(geint32(502)),
(T4)(geint32(502)),
(T4)(geint32(502)),
(T4)(geint32(502)),
(T4)(geint32(502)),
(T4)(geint32(502)),
(T4)(geint32(502)),
(T4)(geint32(502)),
(T4)(geint32(502)),
(T4)(geint32(502)),
(T4)(geint32(502)),
(T4)(geint32(502)),
(T4)(geint32(502)),
(T4)(geint32(502)),
(T4)(geint32(502)),
(T4)(geint32(502)),
(T4)(geint32(502)),
(T4)(geint32(502)),
(T4)(geint32(503)),
(T4)(geint32(425)),
(T4)(geint32(503)),
(T4)(geint32(503)),
(T4)(geint32(503)),
(T4)(geint32(503)),
(T4)(geint32(503)),
(T4)(geint32(503)),
(T4)(geint32(503)),
(T4)(geint32(503)),
(T4)(geint32(503)),
(T4)(geint32(503)),
(T4)(geint32(503)),
(T4)(geint32(503)),
(T4)(geint32(503)),
(T4)(geint32(503)),
(T4)(geint32(503)),
(T4)(geint32(503)),
(T4)(geint32(503)),
(T4)(geint32(503)),
(T4)(geint32(505)),
(T4)(geint32(505)),
(T4)(geint32(505)),
(T4)(geint32(424)),
(T4)(geint32(505)),
(T4)(geint32(423)),
(T4)(geint32(422)),
(T4)(geint32(505)),
(T4)(geint32(505)),
(T4)(geint32(505)),
(T4)(geint32(505)),
(T4)(geint32(505)),
(T4)(geint32(505)),
(T4)(geint32(505)),
(T4)(geint32(505)),
(T4)(geint32(505)),
(T4)(geint32(505)),
(T4)(geint32(505)),
(T4)(geint32(506)),
(T4)(geint32(421)),
(T4)(geint32(506)),
(T4)(geint32(506)),
(T4)(geint32(506)),
(T4)(geint32(506)),
(T4)(geint32(506)),
(T4)(geint32(506)),
(T4)(geint32(506)),
(T4)(geint32(506)),
(T4)(geint32(506)),
(T4)(geint32(506)),
(T4)(geint32(506)),
(T4)(geint32(506)),
(T4)(geint32(506)),
(T4)(geint32(506)),
(T4)(geint32(506)),
(T4)(geint32(506)),
(T4)(geint32(506)),
(T4)(geint32(506)),
(T4)(geint32(507)),
(T4)(geint32(420)),
(T4)(geint32(507)),
(T4)(geint32(507)),
(T4)(geint32(507)),
(T4)(geint32(419)),
(T4)(geint32(507)),
(T4)(geint32(507)),
(T4)(geint32(507)),
(T4)(geint32(507)),
(T4)(geint32(507)),
(T4)(geint32(507)),
(T4)(geint32(507)),
(T4)(geint32(507)),
(T4)(geint32(507)),
(T4)(geint32(507)),
(T4)(geint32(507)),
(T4)(geint32(507)),
(T4)(geint32(507)),
(T4)(geint32(507)),
(T4)(geint32(508)),
(T4)(geint32(417)),
(T4)(geint32(508)),
(T4)(geint32(508)),
(T4)(geint32(508)),
(T4)(geint32(508)),
(T4)(geint32(508)),
(T4)(geint32(508)),
(T4)(geint32(508)),
(T4)(geint32(508)),
(T4)(geint32(508)),
(T4)(geint32(508)),
(T4)(geint32(508)),
(T4)(geint32(508)),
(T4)(geint32(508)),
(T4)(geint32(508)),
(T4)(geint32(508)),
(T4)(geint32(508)),
(T4)(geint32(508)),
(T4)(geint32(508)),
(T4)(geint32(509)),
(T4)(geint32(416)),
(T4)(geint32(509)),
(T4)(geint32(509)),
(T4)(geint32(509)),
(T4)(geint32(509)),
(T4)(geint32(509)),
(T4)(geint32(509)),
(T4)(geint32(509)),
(T4)(geint32(509)),
(T4)(geint32(509)),
(T4)(geint32(509)),
(T4)(geint32(509)),
(T4)(geint32(509)),
(T4)(geint32(509)),
(T4)(geint32(509)),
(T4)(geint32(509)),
(T4)(geint32(509)),
(T4)(geint32(509)),
(T4)(geint32(509)),
(T4)(geint32(510)),
(T4)(geint32(415)),
(T4)(geint32(510)),
(T4)(geint32(510)),
(T4)(geint32(510)),
(T4)(geint32(510)),
(T4)(geint32(510)),
(T4)(geint32(510)),
(T4)(geint32(510)),
(T4)(geint32(510)),
(T4)(geint32(510)),
(T4)(geint32(510)),
(T4)(geint32(510)),
(T4)(geint32(510)),
(T4)(geint32(510)),
(T4)(geint32(510)),
(T4)(geint32(510)),
(T4)(geint32(510)),
(T4)(geint32(510)),
(T4)(geint32(510)),
(T4)(geint32(511)),
(T4)(geint32(414)),
(T4)(geint32(511)),
(T4)(geint32(511)),
(T4)(geint32(511)),
(T4)(geint32(511)),
(T4)(geint32(511)),
(T4)(geint32(511)),
(T4)(geint32(511)),
(T4)(geint32(511)),
(T4)(geint32(511)),
(T4)(geint32(511)),
(T4)(geint32(511)),
(T4)(geint32(511)),
(T4)(geint32(511)),
(T4)(geint32(511)),
(T4)(geint32(511)),
(T4)(geint32(511)),
(T4)(geint32(511)),
(T4)(geint32(511)),
(T4)(geint32(513)),
(T4)(geint32(413)),
(T4)(geint32(513)),
(T4)(geint32(513)),
(T4)(geint32(513)),
(T4)(geint32(513)),
(T4)(geint32(513)),
(T4)(geint32(513)),
(T4)(geint32(513)),
(T4)(geint32(513)),
(T4)(geint32(513)),
(T4)(geint32(513)),
(T4)(geint32(513)),
(T4)(geint32(513)),
(T4)(geint32(513)),
(T4)(geint32(513)),
(T4)(geint32(513)),
(T4)(geint32(513)),
(T4)(geint32(513)),
(T4)(geint32(513)),
(T4)(geint32(514)),
(T4)(geint32(412)),
(T4)(geint32(514)),
(T4)(geint32(514)),
(T4)(geint32(514)),
(T4)(geint32(514)),
(T4)(geint32(514)),
(T4)(geint32(514)),
(T4)(geint32(514)),
(T4)(geint32(514)),
(T4)(geint32(514)),
(T4)(geint32(514)),
(T4)(geint32(514)),
(T4)(geint32(514)),
(T4)(geint32(514)),
(T4)(geint32(514)),
(T4)(geint32(514)),
(T4)(geint32(514)),
(T4)(geint32(514)),
(T4)(geint32(514)),
(T4)(geint32(515)),
(T4)(geint32(409)),
(T4)(geint32(515)),
(T4)(geint32(515)),
(T4)(geint32(515)),
(T4)(geint32(515)),
(T4)(geint32(515)),
(T4)(geint32(515)),
(T4)(geint32(515)),
(T4)(geint32(515)),
(T4)(geint32(515)),
(T4)(geint32(515)),
(T4)(geint32(515)),
(T4)(geint32(515)),
(T4)(geint32(515)),
(T4)(geint32(515)),
(T4)(geint32(515)),
(T4)(geint32(515)),
(T4)(geint32(515)),
(T4)(geint32(515)),
(T4)(geint32(516)),
(T4)(geint32(408)),
(T4)(geint32(516)),
(T4)(geint32(516)),
(T4)(geint32(516)),
(T4)(geint32(516)),
(T4)(geint32(516)),
(T4)(geint32(516)),
(T4)(geint32(516)),
(T4)(geint32(516)),
(T4)(geint32(516)),
(T4)(geint32(516)),
(T4)(geint32(516)),
(T4)(geint32(516)),
(T4)(geint32(516)),
(T4)(geint32(516)),
(T4)(geint32(516)),
(T4)(geint32(516)),
(T4)(geint32(516)),
(T4)(geint32(516)),
(T4)(geint32(518)),
(T4)(geint32(407)),
(T4)(geint32(518)),
(T4)(geint32(518)),
(T4)(geint32(518)),
(T4)(geint32(518)),
(T4)(geint32(518)),
(T4)(geint32(518)),
(T4)(geint32(518)),
(T4)(geint32(518)),
(T4)(geint32(518)),
(T4)(geint32(518)),
(T4)(geint32(518)),
(T4)(geint32(518)),
(T4)(geint32(518)),
(T4)(geint32(518)),
(T4)(geint32(518)),
(T4)(geint32(518)),
(T4)(geint32(518)),
(T4)(geint32(518)),
(T4)(geint32(519)),
(T4)(geint32(519)),
(T4)(geint32(519)),
(T4)(geint32(519)),
(T4)(geint32(519)),
(T4)(geint32(519)),
(T4)(geint32(519)),
(T4)(geint32(519)),
(T4)(geint32(519)),
(T4)(geint32(519)),
(T4)(geint32(519)),
(T4)(geint32(519)),
(T4)(geint32(519)),
(T4)(geint32(519)),
(T4)(geint32(519)),
(T4)(geint32(519)),
(T4)(geint32(519)),
(T4)(geint32(519)),
(T4)(geint32(519)),
(T4)(geint32(519)),
(T4)(geint32(520)),
(T4)(geint32(406)),
(T4)(geint32(520)),
(T4)(geint32(520)),
(T4)(geint32(520)),
(T4)(geint32(520)),
(T4)(geint32(520)),
(T4)(geint32(520)),
(T4)(geint32(520)),
(T4)(geint32(520)),
(T4)(geint32(520)),
(T4)(geint32(520)),
(T4)(geint32(520)),
(T4)(geint32(520)),
(T4)(geint32(520)),
(T4)(geint32(520)),
(T4)(geint32(520)),
(T4)(geint32(520)),
(T4)(geint32(520)),
(T4)(geint32(520)),
(T4)(geint32(405)),
(T4)(geint32(404)),
(T4)(geint32(403)),
(T4)(geint32(402)),
(T4)(geint32(401)),
(T4)(geint32(400)),
(T4)(geint32(399)),
(T4)(geint32(398)),
(T4)(geint32(397)),
(T4)(geint32(396)),
(T4)(geint32(394)),
(T4)(geint32(393)),
(T4)(geint32(392)),
(T4)(geint32(391)),
(T4)(geint32(390)),
(T4)(geint32(389)),
(T4)(geint32(388)),
(T4)(geint32(387)),
(T4)(geint32(383)),
(T4)(geint32(382)),
(T4)(geint32(381)),
(T4)(geint32(380)),
(T4)(geint32(379)),
(T4)(geint32(378)),
(T4)(geint32(377)),
(T4)(geint32(376)),
(T4)(geint32(375)),
(T4)(geint32(372)),
(T4)(geint32(371)),
(T4)(geint32(369)),
(T4)(geint32(368)),
(T4)(geint32(367)),
(T4)(geint32(366)),
(T4)(geint32(365)),
(T4)(geint32(364)),
(T4)(geint32(363)),
(T4)(geint32(362)),
(T4)(geint32(361)),
(T4)(geint32(359)),
(T4)(geint32(358)),
(T4)(geint32(357)),
(T4)(geint32(354)),
(T4)(geint32(353)),
(T4)(geint32(351)),
(T4)(geint32(350)),
(T4)(geint32(348)),
(T4)(geint32(346)),
(T4)(geint32(345)),
(T4)(geint32(344)),
(T4)(geint32(343)),
(T4)(geint32(342)),
(T4)(geint32(341)),
(T4)(geint32(339)),
(T4)(geint32(337)),
(T4)(geint32(336)),
(T4)(geint32(335)),
(T4)(geint32(332)),
(T4)(geint32(331)),
(T4)(geint32(330)),
(T4)(geint32(329)),
(T4)(geint32(328)),
(T4)(geint32(327)),
(T4)(geint32(326)),
(T4)(geint32(325)),
(T4)(geint32(320)),
(T4)(geint32(319)),
(T4)(geint32(318)),
(T4)(geint32(317)),
(T4)(geint32(315)),
(T4)(geint32(314)),
(T4)(geint32(313)),
(T4)(geint32(312)),
(T4)(geint32(311)),
(T4)(geint32(309)),
(T4)(geint32(308)),
(T4)(geint32(307)),
(T4)(geint32(305)),
(T4)(geint32(304)),
(T4)(geint32(303)),
(T4)(geint32(302)),
(T4)(geint32(301)),
(T4)(geint32(300)),
(T4)(geint32(297)),
(T4)(geint32(293)),
(T4)(geint32(288)),
(T4)(geint32(286)),
(T4)(geint32(284)),
(T4)(geint32(283)),
(T4)(geint32(282)),
(T4)(geint32(281)),
(T4)(geint32(280)),
(T4)(geint32(279)),
(T4)(geint32(278)),
(T4)(geint32(277)),
(T4)(geint32(276)),
(T4)(geint32(275)),
(T4)(geint32(274)),
(T4)(geint32(272)),
(T4)(geint32(271)),
(T4)(geint32(270)),
(T4)(geint32(267)),
(T4)(geint32(266)),
(T4)(geint32(265)),
(T4)(geint32(264)),
(T4)(geint32(261)),
(T4)(geint32(259)),
(T4)(geint32(254)),
(T4)(geint32(248)),
(T4)(geint32(245)),
(T4)(geint32(244)),
(T4)(geint32(243)),
(T4)(geint32(242)),
(T4)(geint32(240)),
(T4)(geint32(239)),
(T4)(geint32(238)),
(T4)(geint32(236)),
(T4)(geint32(235)),
(T4)(geint32(234)),
(T4)(geint32(233)),
(T4)(geint32(232)),
(T4)(geint32(231)),
(T4)(geint32(230)),
(T4)(geint32(229)),
(T4)(geint32(228)),
(T4)(geint32(227)),
(T4)(geint32(225)),
(T4)(geint32(224)),
(T4)(geint32(223)),
(T4)(geint32(222)),
(T4)(geint32(217)),
(T4)(geint32(216)),
(T4)(geint32(215)),
(T4)(geint32(210)),
(T4)(geint32(202)),
(T4)(geint32(198)),
(T4)(geint32(194)),
(T4)(geint32(185)),
(T4)(geint32(177)),
(T4)(geint32(176)),
(T4)(geint32(175)),
(T4)(geint32(174)),
(T4)(geint32(173)),
(T4)(geint32(172)),
(T4)(geint32(170)),
(T4)(geint32(169)),
(T4)(geint32(168)),
(T4)(geint32(167)),
(T4)(geint32(165)),
(T4)(geint32(164)),
(T4)(geint32(157)),
(T4)(geint32(135)),
(T4)(geint32(134)),
(T4)(geint32(129)),
(T4)(geint32(128)),
(T4)(geint32(121)),
(T4)(geint32(109)),
(T4)(geint32(99)),
(T4)(geint32(82)),
(T4)(geint32(77)),
(T4)(geint32(76)),
(T4)(geint32(75)),
(T4)(geint32(73)),
(T4)(geint32(72)),
(T4)(geint32(71)),
(T4)(geint32(70)),
(T4)(geint32(69)),
(T4)(geint32(68)),
(T4)(geint32(67)),
(T4)(geint32(66)),
(T4)(geint32(65)),
(T4)(geint32(63)),
(T4)(geint32(59)),
(T4)(geint32(58)),
(T4)(geint32(57)),
(T4)(geint32(52)),
(T4)(geint32(48)),
(T4)(geint32(47)),
(T4)(geint32(41)),
(T4)(geint32(37)),
(T4)(geint32(12)),
(T4)(geint32(11)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(2147483647))));
	R = (T35f262(C, t1));
	ge109ov2659 = R;
	return R;
}

/* LX_LEX_PARSER.yy_nxt_template */
unsigned char ge109os2658 = '\0';
T0* ge109ov2658;
T0* T35f236(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge109os2658) {
		return ge109ov2658;
	} else {
		ge109os2658 = '\1';
	}
	t1 = (gema130((T4)1704,
(T4)(geint32(0)),
(T4)(geint32(470)),
(T4)(geint32(39)),
(T4)(geint32(40)),
(T4)(geint32(39)),
(T4)(geint32(120)),
(T4)(geint32(120)),
(T4)(geint32(121)),
(T4)(geint32(121)),
(T4)(geint32(138)),
(T4)(geint32(470)),
(T4)(geint32(138)),
(T4)(geint32(41)),
(T4)(geint32(38)),
(T4)(geint32(39)),
(T4)(geint32(40)),
(T4)(geint32(39)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(42)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(41)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(45)),
(T4)(geint32(46)),
(T4)(geint32(45)),
(T4)(geint32(147)),
(T4)(geint32(55)),
(T4)(geint32(147)),
(T4)(geint32(56)),
(T4)(geint32(57)),
(T4)(geint32(183)),
(T4)(geint32(183)),
(T4)(geint32(47)),
(T4)(geint32(58)),
(T4)(geint32(103)),
(T4)(geint32(55)),
(T4)(geint32(48)),
(T4)(geint32(59)),
(T4)(geint32(57)),
(T4)(geint32(85)),
(T4)(geint32(86)),
(T4)(geint32(85)),
(T4)(geint32(58)),
(T4)(geint32(111)),
(T4)(geint32(85)),
(T4)(geint32(86)),
(T4)(geint32(85)),
(T4)(geint32(91)),
(T4)(geint32(87)),
(T4)(geint32(92)),
(T4)(geint32(103)),
(T4)(geint32(88)),
(T4)(geint32(88)),
(T4)(geint32(87)),
(T4)(geint32(185)),
(T4)(geint32(185)),
(T4)(geint32(88)),
(T4)(geint32(88)),
(T4)(geint32(91)),
(T4)(geint32(155)),
(T4)(geint32(92)),
(T4)(geint32(156)),
(T4)(geint32(161)),
(T4)(geint32(217)),
(T4)(geint32(161)),
(T4)(geint32(49)),
(T4)(geint32(111)),
(T4)(geint32(50)),
(T4)(geint32(325)),
(T4)(geint32(51)),
(T4)(geint32(45)),
(T4)(geint32(46)),
(T4)(geint32(45)),
(T4)(geint32(218)),
(T4)(geint32(173)),
(T4)(geint32(52)),
(T4)(geint32(174)),
(T4)(geint32(326)),
(T4)(geint32(104)),
(T4)(geint32(105)),
(T4)(geint32(47)),
(T4)(geint32(186)),
(T4)(geint32(186)),
(T4)(geint32(112)),
(T4)(geint32(48)),
(T4)(geint32(113)),
(T4)(geint32(89)),
(T4)(geint32(93)),
(T4)(geint32(179)),
(T4)(geint32(224)),
(T4)(geint32(179)),
(T4)(geint32(89)),
(T4)(geint32(157)),
(T4)(geint32(225)),
(T4)(geint32(104)),
(T4)(geint32(105)),
(T4)(geint32(451)),
(T4)(geint32(220)),
(T4)(geint32(93)),
(T4)(geint32(107)),
(T4)(geint32(108)),
(T4)(geint32(107)),
(T4)(geint32(107)),
(T4)(geint32(108)),
(T4)(geint32(107)),
(T4)(geint32(182)),
(T4)(geint32(112)),
(T4)(geint32(182)),
(T4)(geint32(113)),
(T4)(geint32(109)),
(T4)(geint32(183)),
(T4)(geint32(183)),
(T4)(geint32(109)),
(T4)(geint32(49)),
(T4)(geint32(187)),
(T4)(geint32(50)),
(T4)(geint32(187)),
(T4)(geint32(51)),
(T4)(geint32(60)),
(T4)(geint32(61)),
(T4)(geint32(62)),
(T4)(geint32(61)),
(T4)(geint32(60)),
(T4)(geint32(60)),
(T4)(geint32(60)),
(T4)(geint32(60)),
(T4)(geint32(60)),
(T4)(geint32(60)),
(T4)(geint32(60)),
(T4)(geint32(63)),
(T4)(geint32(60)),
(T4)(geint32(64)),
(T4)(geint32(64)),
(T4)(geint32(60)),
(T4)(geint32(60)),
(T4)(geint32(60)),
(T4)(geint32(64)),
(T4)(geint32(65)),
(T4)(geint32(66)),
(T4)(geint32(67)),
(T4)(geint32(68)),
(T4)(geint32(69)),
(T4)(geint32(64)),
(T4)(geint32(64)),
(T4)(geint32(64)),
(T4)(geint32(64)),
(T4)(geint32(64)),
(T4)(geint32(70)),
(T4)(geint32(71)),
(T4)(geint32(72)),
(T4)(geint32(73)),
(T4)(geint32(74)),
(T4)(geint32(75)),
(T4)(geint32(64)),
(T4)(geint32(64)),
(T4)(geint32(64)),
(T4)(geint32(64)),
(T4)(geint32(76)),
(T4)(geint32(64)),
(T4)(geint32(60)),
(T4)(geint32(60)),
(T4)(geint32(60)),
(T4)(geint32(60)),
(T4)(geint32(60)),
(T4)(geint32(60)),
(T4)(geint32(60)),
(T4)(geint32(60)),
(T4)(geint32(79)),
(T4)(geint32(80)),
(T4)(geint32(81)),
(T4)(geint32(80)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(82)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(83)),
(T4)(geint32(83)),
(T4)(geint32(83)),
(T4)(geint32(83)),
(T4)(geint32(83)),
(T4)(geint32(83)),
(T4)(geint32(83)),
(T4)(geint32(83)),
(T4)(geint32(83)),
(T4)(geint32(83)),
(T4)(geint32(83)),
(T4)(geint32(83)),
(T4)(geint32(83)),
(T4)(geint32(83)),
(T4)(geint32(83)),
(T4)(geint32(83)),
(T4)(geint32(83)),
(T4)(geint32(83)),
(T4)(geint32(83)),
(T4)(geint32(83)),
(T4)(geint32(83)),
(T4)(geint32(83)),
(T4)(geint32(83)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(94)),
(T4)(geint32(95)),
(T4)(geint32(96)),
(T4)(geint32(95)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(97)),
(T4)(geint32(98)),
(T4)(geint32(99)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(100)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(115)),
(T4)(geint32(193)),
(T4)(geint32(115)),
(T4)(geint32(193)),
(T4)(geint32(196)),
(T4)(geint32(185)),
(T4)(geint32(200)),
(T4)(geint32(185)),
(T4)(geint32(200)),
(T4)(geint32(116)),
(T4)(geint32(470)),
(T4)(geint32(116)),
(T4)(geint32(133)),
(T4)(geint32(210)),
(T4)(geint32(208)),
(T4)(geint32(134)),
(T4)(geint32(209)),
(T4)(geint32(133)),
(T4)(geint32(257)),
(T4)(geint32(135)),
(T4)(geint32(134)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(135)),
(T4)(geint32(138)),
(T4)(geint32(470)),
(T4)(geint32(138)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(469)),
(T4)(geint32(140)),
(T4)(geint32(186)),
(T4)(geint32(147)),
(T4)(geint32(186)),
(T4)(geint32(147)),
(T4)(geint32(196)),
(T4)(geint32(468)),
(T4)(geint32(150)),
(T4)(geint32(150)),
(T4)(geint32(117)),
(T4)(geint32(118)),
(T4)(geint32(117)),
(T4)(geint32(118)),
(T4)(geint32(123)),
(T4)(geint32(124)),
(T4)(geint32(123)),
(T4)(geint32(125)),
(T4)(geint32(126)),
(T4)(geint32(467)),
(T4)(geint32(470)),
(T4)(geint32(127)),
(T4)(geint32(127)),
(T4)(geint32(213)),
(T4)(geint32(136)),
(T4)(geint32(127)),
(T4)(geint32(137)),
(T4)(geint32(142)),
(T4)(geint32(128)),
(T4)(geint32(136)),
(T4)(geint32(143)),
(T4)(geint32(137)),
(T4)(geint32(145)),
(T4)(geint32(214)),
(T4)(geint32(145)),
(T4)(geint32(144)),
(T4)(geint32(470)),
(T4)(geint32(466)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(150)),
(T4)(geint32(145)),
(T4)(geint32(215)),
(T4)(geint32(149)),
(T4)(geint32(375)),
(T4)(geint32(155)),
(T4)(geint32(151)),
(T4)(geint32(156)),
(T4)(geint32(151)),
(T4)(geint32(161)),
(T4)(geint32(179)),
(T4)(geint32(161)),
(T4)(geint32(179)),
(T4)(geint32(376)),
(T4)(geint32(129)),
(T4)(geint32(130)),
(T4)(geint32(216)),
(T4)(geint32(249)),
(T4)(geint32(250)),
(T4)(geint32(131)),
(T4)(geint32(127)),
(T4)(geint32(123)),
(T4)(geint32(124)),
(T4)(geint32(123)),
(T4)(geint32(125)),
(T4)(geint32(126)),
(T4)(geint32(251)),
(T4)(geint32(289)),
(T4)(geint32(127)),
(T4)(geint32(127)),
(T4)(geint32(470)),
(T4)(geint32(182)),
(T4)(geint32(127)),
(T4)(geint32(182)),
(T4)(geint32(187)),
(T4)(geint32(128)),
(T4)(geint32(187)),
(T4)(geint32(193)),
(T4)(geint32(200)),
(T4)(geint32(193)),
(T4)(geint32(200)),
(T4)(geint32(208)),
(T4)(geint32(254)),
(T4)(geint32(209)),
(T4)(geint32(262)),
(T4)(geint32(262)),
(T4)(geint32(263)),
(T4)(geint32(263)),
(T4)(geint32(278)),
(T4)(geint32(283)),
(T4)(geint32(279)),
(T4)(geint32(464)),
(T4)(geint32(255)),
(T4)(geint32(252)),
(T4)(geint32(290)),
(T4)(geint32(294)),
(T4)(geint32(294)),
(T4)(geint32(295)),
(T4)(geint32(295)),
(T4)(geint32(284)),
(T4)(geint32(258)),
(T4)(geint32(129)),
(T4)(geint32(130)),
(T4)(geint32(154)),
(T4)(geint32(262)),
(T4)(geint32(262)),
(T4)(geint32(131)),
(T4)(geint32(127)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(470)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(162)),
(T4)(geint32(221)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(230)),
(T4)(geint32(231)),
(T4)(geint32(232)),
(T4)(geint32(233)),
(T4)(geint32(234)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(249)),
(T4)(geint32(250)),
(T4)(geint32(291)),
(T4)(geint32(235)),
(T4)(geint32(236)),
(T4)(geint32(470)),
(T4)(geint32(465)),
(T4)(geint32(237)),
(T4)(geint32(238)),
(T4)(geint32(157)),
(T4)(geint32(263)),
(T4)(geint32(263)),
(T4)(geint32(304)),
(T4)(geint32(239)),
(T4)(geint32(317)),
(T4)(geint32(464)),
(T4)(geint32(305)),
(T4)(geint32(321)),
(T4)(geint32(318)),
(T4)(geint32(249)),
(T4)(geint32(250)),
(T4)(geint32(207)),
(T4)(geint32(294)),
(T4)(geint32(294)),
(T4)(geint32(463)),
(T4)(geint32(296)),
(T4)(geint32(210)),
(T4)(geint32(295)),
(T4)(geint32(295)),
(T4)(geint32(470)),
(T4)(geint32(205)),
(T4)(geint32(249)),
(T4)(geint32(250)),
(T4)(geint32(253)),
(T4)(geint32(292)),
(T4)(geint32(292)),
(T4)(geint32(249)),
(T4)(geint32(250)),
(T4)(geint32(336)),
(T4)(geint32(292)),
(T4)(geint32(292)),
(T4)(geint32(292)),
(T4)(geint32(292)),
(T4)(geint32(292)),
(T4)(geint32(292)),
(T4)(geint32(470)),
(T4)(geint32(249)),
(T4)(geint32(250)),
(T4)(geint32(337)),
(T4)(geint32(343)),
(T4)(geint32(249)),
(T4)(geint32(250)),
(T4)(geint32(470)),
(T4)(geint32(344)),
(T4)(geint32(361)),
(T4)(geint32(323)),
(T4)(geint32(470)),
(T4)(geint32(380)),
(T4)(geint32(362)),
(T4)(geint32(462)),
(T4)(geint32(461)),
(T4)(geint32(381)),
(T4)(geint32(460)),
(T4)(geint32(249)),
(T4)(geint32(250)),
(T4)(geint32(322)),
(T4)(geint32(322)),
(T4)(geint32(459)),
(T4)(geint32(458)),
(T4)(geint32(470)),
(T4)(geint32(322)),
(T4)(geint32(322)),
(T4)(geint32(322)),
(T4)(geint32(322)),
(T4)(geint32(322)),
(T4)(geint32(322)),
(T4)(geint32(457)),
(T4)(geint32(349)),
(T4)(geint32(150)),
(T4)(geint32(150)),
(T4)(geint32(150)),
(T4)(geint32(150)),
(T4)(geint32(150)),
(T4)(geint32(150)),
(T4)(geint32(150)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(470)),
(T4)(geint32(246)),
(T4)(geint32(246)),
(T4)(geint32(246)),
(T4)(geint32(470)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(53)),
(T4)(geint32(53)),
(T4)(geint32(53)),
(T4)(geint32(53)),
(T4)(geint32(53)),
(T4)(geint32(53)),
(T4)(geint32(53)),
(T4)(geint32(53)),
(T4)(geint32(53)),
(T4)(geint32(53)),
(T4)(geint32(53)),
(T4)(geint32(53)),
(T4)(geint32(53)),
(T4)(geint32(53)),
(T4)(geint32(53)),
(T4)(geint32(53)),
(T4)(geint32(53)),
(T4)(geint32(53)),
(T4)(geint32(53)),
(T4)(geint32(53)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(84)),
(T4)(geint32(84)),
(T4)(geint32(84)),
(T4)(geint32(84)),
(T4)(geint32(84)),
(T4)(geint32(84)),
(T4)(geint32(84)),
(T4)(geint32(84)),
(T4)(geint32(84)),
(T4)(geint32(84)),
(T4)(geint32(84)),
(T4)(geint32(84)),
(T4)(geint32(84)),
(T4)(geint32(84)),
(T4)(geint32(84)),
(T4)(geint32(84)),
(T4)(geint32(84)),
(T4)(geint32(84)),
(T4)(geint32(84)),
(T4)(geint32(84)),
(T4)(geint32(90)),
(T4)(geint32(90)),
(T4)(geint32(90)),
(T4)(geint32(90)),
(T4)(geint32(90)),
(T4)(geint32(90)),
(T4)(geint32(90)),
(T4)(geint32(90)),
(T4)(geint32(90)),
(T4)(geint32(90)),
(T4)(geint32(90)),
(T4)(geint32(90)),
(T4)(geint32(90)),
(T4)(geint32(90)),
(T4)(geint32(90)),
(T4)(geint32(90)),
(T4)(geint32(90)),
(T4)(geint32(90)),
(T4)(geint32(90)),
(T4)(geint32(90)),
(T4)(geint32(102)),
(T4)(geint32(102)),
(T4)(geint32(102)),
(T4)(geint32(102)),
(T4)(geint32(102)),
(T4)(geint32(102)),
(T4)(geint32(102)),
(T4)(geint32(102)),
(T4)(geint32(102)),
(T4)(geint32(102)),
(T4)(geint32(102)),
(T4)(geint32(102)),
(T4)(geint32(102)),
(T4)(geint32(102)),
(T4)(geint32(102)),
(T4)(geint32(102)),
(T4)(geint32(102)),
(T4)(geint32(102)),
(T4)(geint32(102)),
(T4)(geint32(102)),
(T4)(geint32(106)),
(T4)(geint32(106)),
(T4)(geint32(106)),
(T4)(geint32(106)),
(T4)(geint32(106)),
(T4)(geint32(106)),
(T4)(geint32(106)),
(T4)(geint32(106)),
(T4)(geint32(106)),
(T4)(geint32(106)),
(T4)(geint32(106)),
(T4)(geint32(106)),
(T4)(geint32(106)),
(T4)(geint32(106)),
(T4)(geint32(106)),
(T4)(geint32(106)),
(T4)(geint32(106)),
(T4)(geint32(106)),
(T4)(geint32(106)),
(T4)(geint32(106)),
(T4)(geint32(110)),
(T4)(geint32(110)),
(T4)(geint32(110)),
(T4)(geint32(110)),
(T4)(geint32(110)),
(T4)(geint32(110)),
(T4)(geint32(110)),
(T4)(geint32(110)),
(T4)(geint32(110)),
(T4)(geint32(110)),
(T4)(geint32(110)),
(T4)(geint32(110)),
(T4)(geint32(110)),
(T4)(geint32(110)),
(T4)(geint32(110)),
(T4)(geint32(110)),
(T4)(geint32(110)),
(T4)(geint32(110)),
(T4)(geint32(110)),
(T4)(geint32(110)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(119)),
(T4)(geint32(119)),
(T4)(geint32(119)),
(T4)(geint32(119)),
(T4)(geint32(119)),
(T4)(geint32(119)),
(T4)(geint32(119)),
(T4)(geint32(119)),
(T4)(geint32(119)),
(T4)(geint32(119)),
(T4)(geint32(119)),
(T4)(geint32(119)),
(T4)(geint32(119)),
(T4)(geint32(119)),
(T4)(geint32(119)),
(T4)(geint32(119)),
(T4)(geint32(119)),
(T4)(geint32(119)),
(T4)(geint32(119)),
(T4)(geint32(119)),
(T4)(geint32(122)),
(T4)(geint32(122)),
(T4)(geint32(122)),
(T4)(geint32(122)),
(T4)(geint32(122)),
(T4)(geint32(122)),
(T4)(geint32(122)),
(T4)(geint32(122)),
(T4)(geint32(122)),
(T4)(geint32(122)),
(T4)(geint32(122)),
(T4)(geint32(122)),
(T4)(geint32(122)),
(T4)(geint32(122)),
(T4)(geint32(122)),
(T4)(geint32(122)),
(T4)(geint32(122)),
(T4)(geint32(122)),
(T4)(geint32(122)),
(T4)(geint32(122)),
(T4)(geint32(132)),
(T4)(geint32(132)),
(T4)(geint32(132)),
(T4)(geint32(132)),
(T4)(geint32(132)),
(T4)(geint32(132)),
(T4)(geint32(132)),
(T4)(geint32(132)),
(T4)(geint32(132)),
(T4)(geint32(132)),
(T4)(geint32(132)),
(T4)(geint32(132)),
(T4)(geint32(132)),
(T4)(geint32(132)),
(T4)(geint32(132)),
(T4)(geint32(132)),
(T4)(geint32(132)),
(T4)(geint32(132)),
(T4)(geint32(132)),
(T4)(geint32(132)),
(T4)(geint32(141)),
(T4)(geint32(184)),
(T4)(geint32(184)),
(T4)(geint32(184)),
(T4)(geint32(456)),
(T4)(geint32(141)),
(T4)(geint32(141)),
(T4)(geint32(141)),
(T4)(geint32(141)),
(T4)(geint32(141)),
(T4)(geint32(141)),
(T4)(geint32(141)),
(T4)(geint32(455)),
(T4)(geint32(454)),
(T4)(geint32(141)),
(T4)(geint32(146)),
(T4)(geint32(146)),
(T4)(geint32(146)),
(T4)(geint32(146)),
(T4)(geint32(146)),
(T4)(geint32(146)),
(T4)(geint32(146)),
(T4)(geint32(146)),
(T4)(geint32(146)),
(T4)(geint32(453)),
(T4)(geint32(146)),
(T4)(geint32(152)),
(T4)(geint32(152)),
(T4)(geint32(152)),
(T4)(geint32(152)),
(T4)(geint32(152)),
(T4)(geint32(152)),
(T4)(geint32(152)),
(T4)(geint32(152)),
(T4)(geint32(152)),
(T4)(geint32(152)),
(T4)(geint32(152)),
(T4)(geint32(152)),
(T4)(geint32(152)),
(T4)(geint32(152)),
(T4)(geint32(152)),
(T4)(geint32(152)),
(T4)(geint32(152)),
(T4)(geint32(152)),
(T4)(geint32(152)),
(T4)(geint32(152)),
(T4)(geint32(153)),
(T4)(geint32(153)),
(T4)(geint32(153)),
(T4)(geint32(452)),
(T4)(geint32(451)),
(T4)(geint32(450)),
(T4)(geint32(449)),
(T4)(geint32(153)),
(T4)(geint32(153)),
(T4)(geint32(153)),
(T4)(geint32(153)),
(T4)(geint32(153)),
(T4)(geint32(153)),
(T4)(geint32(153)),
(T4)(geint32(153)),
(T4)(geint32(153)),
(T4)(geint32(153)),
(T4)(geint32(153)),
(T4)(geint32(153)),
(T4)(geint32(153)),
(T4)(geint32(154)),
(T4)(geint32(448)),
(T4)(geint32(154)),
(T4)(geint32(154)),
(T4)(geint32(154)),
(T4)(geint32(154)),
(T4)(geint32(154)),
(T4)(geint32(154)),
(T4)(geint32(154)),
(T4)(geint32(154)),
(T4)(geint32(154)),
(T4)(geint32(154)),
(T4)(geint32(154)),
(T4)(geint32(154)),
(T4)(geint32(154)),
(T4)(geint32(154)),
(T4)(geint32(154)),
(T4)(geint32(154)),
(T4)(geint32(154)),
(T4)(geint32(154)),
(T4)(geint32(157)),
(T4)(geint32(447)),
(T4)(geint32(157)),
(T4)(geint32(157)),
(T4)(geint32(157)),
(T4)(geint32(446)),
(T4)(geint32(157)),
(T4)(geint32(157)),
(T4)(geint32(157)),
(T4)(geint32(157)),
(T4)(geint32(157)),
(T4)(geint32(157)),
(T4)(geint32(157)),
(T4)(geint32(157)),
(T4)(geint32(157)),
(T4)(geint32(157)),
(T4)(geint32(157)),
(T4)(geint32(157)),
(T4)(geint32(157)),
(T4)(geint32(157)),
(T4)(geint32(163)),
(T4)(geint32(163)),
(T4)(geint32(163)),
(T4)(geint32(163)),
(T4)(geint32(163)),
(T4)(geint32(163)),
(T4)(geint32(163)),
(T4)(geint32(163)),
(T4)(geint32(163)),
(T4)(geint32(163)),
(T4)(geint32(177)),
(T4)(geint32(177)),
(T4)(geint32(177)),
(T4)(geint32(177)),
(T4)(geint32(177)),
(T4)(geint32(177)),
(T4)(geint32(177)),
(T4)(geint32(177)),
(T4)(geint32(177)),
(T4)(geint32(177)),
(T4)(geint32(177)),
(T4)(geint32(177)),
(T4)(geint32(177)),
(T4)(geint32(177)),
(T4)(geint32(177)),
(T4)(geint32(177)),
(T4)(geint32(177)),
(T4)(geint32(177)),
(T4)(geint32(177)),
(T4)(geint32(177)),
(T4)(geint32(181)),
(T4)(geint32(181)),
(T4)(geint32(181)),
(T4)(geint32(181)),
(T4)(geint32(181)),
(T4)(geint32(181)),
(T4)(geint32(181)),
(T4)(geint32(181)),
(T4)(geint32(181)),
(T4)(geint32(445)),
(T4)(geint32(181)),
(T4)(geint32(184)),
(T4)(geint32(444)),
(T4)(geint32(184)),
(T4)(geint32(184)),
(T4)(geint32(184)),
(T4)(geint32(184)),
(T4)(geint32(184)),
(T4)(geint32(184)),
(T4)(geint32(184)),
(T4)(geint32(184)),
(T4)(geint32(184)),
(T4)(geint32(184)),
(T4)(geint32(184)),
(T4)(geint32(184)),
(T4)(geint32(184)),
(T4)(geint32(184)),
(T4)(geint32(184)),
(T4)(geint32(184)),
(T4)(geint32(184)),
(T4)(geint32(184)),
(T4)(geint32(189)),
(T4)(geint32(189)),
(T4)(geint32(189)),
(T4)(geint32(189)),
(T4)(geint32(189)),
(T4)(geint32(189)),
(T4)(geint32(189)),
(T4)(geint32(189)),
(T4)(geint32(189)),
(T4)(geint32(443)),
(T4)(geint32(189)),
(T4)(geint32(190)),
(T4)(geint32(442)),
(T4)(geint32(190)),
(T4)(geint32(190)),
(T4)(geint32(190)),
(T4)(geint32(190)),
(T4)(geint32(190)),
(T4)(geint32(190)),
(T4)(geint32(190)),
(T4)(geint32(190)),
(T4)(geint32(190)),
(T4)(geint32(190)),
(T4)(geint32(190)),
(T4)(geint32(190)),
(T4)(geint32(190)),
(T4)(geint32(190)),
(T4)(geint32(190)),
(T4)(geint32(190)),
(T4)(geint32(190)),
(T4)(geint32(190)),
(T4)(geint32(191)),
(T4)(geint32(441)),
(T4)(geint32(191)),
(T4)(geint32(191)),
(T4)(geint32(191)),
(T4)(geint32(191)),
(T4)(geint32(191)),
(T4)(geint32(191)),
(T4)(geint32(191)),
(T4)(geint32(191)),
(T4)(geint32(191)),
(T4)(geint32(191)),
(T4)(geint32(191)),
(T4)(geint32(191)),
(T4)(geint32(191)),
(T4)(geint32(191)),
(T4)(geint32(191)),
(T4)(geint32(191)),
(T4)(geint32(191)),
(T4)(geint32(191)),
(T4)(geint32(192)),
(T4)(geint32(440)),
(T4)(geint32(439)),
(T4)(geint32(192)),
(T4)(geint32(192)),
(T4)(geint32(192)),
(T4)(geint32(192)),
(T4)(geint32(192)),
(T4)(geint32(192)),
(T4)(geint32(192)),
(T4)(geint32(192)),
(T4)(geint32(192)),
(T4)(geint32(192)),
(T4)(geint32(192)),
(T4)(geint32(192)),
(T4)(geint32(192)),
(T4)(geint32(192)),
(T4)(geint32(192)),
(T4)(geint32(192)),
(T4)(geint32(192)),
(T4)(geint32(195)),
(T4)(geint32(195)),
(T4)(geint32(195)),
(T4)(geint32(195)),
(T4)(geint32(195)),
(T4)(geint32(195)),
(T4)(geint32(195)),
(T4)(geint32(195)),
(T4)(geint32(195)),
(T4)(geint32(195)),
(T4)(geint32(195)),
(T4)(geint32(195)),
(T4)(geint32(195)),
(T4)(geint32(195)),
(T4)(geint32(195)),
(T4)(geint32(195)),
(T4)(geint32(195)),
(T4)(geint32(195)),
(T4)(geint32(195)),
(T4)(geint32(195)),
(T4)(geint32(197)),
(T4)(geint32(197)),
(T4)(geint32(197)),
(T4)(geint32(197)),
(T4)(geint32(197)),
(T4)(geint32(197)),
(T4)(geint32(197)),
(T4)(geint32(197)),
(T4)(geint32(197)),
(T4)(geint32(197)),
(T4)(geint32(197)),
(T4)(geint32(197)),
(T4)(geint32(197)),
(T4)(geint32(197)),
(T4)(geint32(197)),
(T4)(geint32(197)),
(T4)(geint32(438)),
(T4)(geint32(197)),
(T4)(geint32(197)),
(T4)(geint32(197)),
(T4)(geint32(198)),
(T4)(geint32(437)),
(T4)(geint32(198)),
(T4)(geint32(198)),
(T4)(geint32(198)),
(T4)(geint32(198)),
(T4)(geint32(198)),
(T4)(geint32(198)),
(T4)(geint32(198)),
(T4)(geint32(198)),
(T4)(geint32(198)),
(T4)(geint32(198)),
(T4)(geint32(198)),
(T4)(geint32(198)),
(T4)(geint32(198)),
(T4)(geint32(198)),
(T4)(geint32(198)),
(T4)(geint32(198)),
(T4)(geint32(198)),
(T4)(geint32(198)),
(T4)(geint32(203)),
(T4)(geint32(436)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(435)),
(T4)(geint32(206)),
(T4)(geint32(434)),
(T4)(geint32(433)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(207)),
(T4)(geint32(432)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(210)),
(T4)(geint32(431)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(430)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(139)),
(T4)(geint32(429)),
(T4)(geint32(139)),
(T4)(geint32(139)),
(T4)(geint32(139)),
(T4)(geint32(139)),
(T4)(geint32(139)),
(T4)(geint32(139)),
(T4)(geint32(139)),
(T4)(geint32(139)),
(T4)(geint32(139)),
(T4)(geint32(139)),
(T4)(geint32(139)),
(T4)(geint32(139)),
(T4)(geint32(139)),
(T4)(geint32(139)),
(T4)(geint32(139)),
(T4)(geint32(139)),
(T4)(geint32(139)),
(T4)(geint32(139)),
(T4)(geint32(148)),
(T4)(geint32(428)),
(T4)(geint32(148)),
(T4)(geint32(148)),
(T4)(geint32(148)),
(T4)(geint32(148)),
(T4)(geint32(148)),
(T4)(geint32(148)),
(T4)(geint32(148)),
(T4)(geint32(148)),
(T4)(geint32(148)),
(T4)(geint32(148)),
(T4)(geint32(148)),
(T4)(geint32(148)),
(T4)(geint32(148)),
(T4)(geint32(148)),
(T4)(geint32(148)),
(T4)(geint32(148)),
(T4)(geint32(148)),
(T4)(geint32(148)),
(T4)(geint32(159)),
(T4)(geint32(427)),
(T4)(geint32(159)),
(T4)(geint32(159)),
(T4)(geint32(159)),
(T4)(geint32(159)),
(T4)(geint32(159)),
(T4)(geint32(159)),
(T4)(geint32(159)),
(T4)(geint32(159)),
(T4)(geint32(159)),
(T4)(geint32(159)),
(T4)(geint32(159)),
(T4)(geint32(159)),
(T4)(geint32(159)),
(T4)(geint32(159)),
(T4)(geint32(159)),
(T4)(geint32(159)),
(T4)(geint32(159)),
(T4)(geint32(159)),
(T4)(geint32(180)),
(T4)(geint32(426)),
(T4)(geint32(180)),
(T4)(geint32(180)),
(T4)(geint32(180)),
(T4)(geint32(180)),
(T4)(geint32(180)),
(T4)(geint32(180)),
(T4)(geint32(180)),
(T4)(geint32(180)),
(T4)(geint32(180)),
(T4)(geint32(180)),
(T4)(geint32(180)),
(T4)(geint32(180)),
(T4)(geint32(180)),
(T4)(geint32(180)),
(T4)(geint32(180)),
(T4)(geint32(180)),
(T4)(geint32(180)),
(T4)(geint32(180)),
(T4)(geint32(188)),
(T4)(geint32(425)),
(T4)(geint32(188)),
(T4)(geint32(188)),
(T4)(geint32(188)),
(T4)(geint32(188)),
(T4)(geint32(188)),
(T4)(geint32(188)),
(T4)(geint32(188)),
(T4)(geint32(188)),
(T4)(geint32(188)),
(T4)(geint32(188)),
(T4)(geint32(188)),
(T4)(geint32(188)),
(T4)(geint32(188)),
(T4)(geint32(188)),
(T4)(geint32(188)),
(T4)(geint32(188)),
(T4)(geint32(188)),
(T4)(geint32(188)),
(T4)(geint32(194)),
(T4)(geint32(424)),
(T4)(geint32(194)),
(T4)(geint32(194)),
(T4)(geint32(194)),
(T4)(geint32(194)),
(T4)(geint32(194)),
(T4)(geint32(194)),
(T4)(geint32(194)),
(T4)(geint32(194)),
(T4)(geint32(194)),
(T4)(geint32(194)),
(T4)(geint32(194)),
(T4)(geint32(194)),
(T4)(geint32(194)),
(T4)(geint32(194)),
(T4)(geint32(194)),
(T4)(geint32(194)),
(T4)(geint32(194)),
(T4)(geint32(194)),
(T4)(geint32(212)),
(T4)(geint32(423)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(221)),
(T4)(geint32(422)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(247)),
(T4)(geint32(421)),
(T4)(geint32(247)),
(T4)(geint32(247)),
(T4)(geint32(247)),
(T4)(geint32(247)),
(T4)(geint32(247)),
(T4)(geint32(247)),
(T4)(geint32(247)),
(T4)(geint32(247)),
(T4)(geint32(247)),
(T4)(geint32(247)),
(T4)(geint32(247)),
(T4)(geint32(247)),
(T4)(geint32(247)),
(T4)(geint32(247)),
(T4)(geint32(247)),
(T4)(geint32(247)),
(T4)(geint32(247)),
(T4)(geint32(247)),
(T4)(geint32(259)),
(T4)(geint32(259)),
(T4)(geint32(259)),
(T4)(geint32(259)),
(T4)(geint32(259)),
(T4)(geint32(259)),
(T4)(geint32(259)),
(T4)(geint32(259)),
(T4)(geint32(259)),
(T4)(geint32(259)),
(T4)(geint32(259)),
(T4)(geint32(259)),
(T4)(geint32(259)),
(T4)(geint32(259)),
(T4)(geint32(259)),
(T4)(geint32(259)),
(T4)(geint32(259)),
(T4)(geint32(259)),
(T4)(geint32(259)),
(T4)(geint32(259)),
(T4)(geint32(260)),
(T4)(geint32(420)),
(T4)(geint32(260)),
(T4)(geint32(260)),
(T4)(geint32(260)),
(T4)(geint32(260)),
(T4)(geint32(260)),
(T4)(geint32(260)),
(T4)(geint32(260)),
(T4)(geint32(260)),
(T4)(geint32(260)),
(T4)(geint32(260)),
(T4)(geint32(260)),
(T4)(geint32(260)),
(T4)(geint32(260)),
(T4)(geint32(260)),
(T4)(geint32(260)),
(T4)(geint32(260)),
(T4)(geint32(260)),
(T4)(geint32(260)),
(T4)(geint32(419)),
(T4)(geint32(418)),
(T4)(geint32(417)),
(T4)(geint32(416)),
(T4)(geint32(415)),
(T4)(geint32(414)),
(T4)(geint32(413)),
(T4)(geint32(412)),
(T4)(geint32(411)),
(T4)(geint32(410)),
(T4)(geint32(409)),
(T4)(geint32(408)),
(T4)(geint32(407)),
(T4)(geint32(406)),
(T4)(geint32(405)),
(T4)(geint32(404)),
(T4)(geint32(403)),
(T4)(geint32(402)),
(T4)(geint32(401)),
(T4)(geint32(400)),
(T4)(geint32(399)),
(T4)(geint32(398)),
(T4)(geint32(397)),
(T4)(geint32(396)),
(T4)(geint32(395)),
(T4)(geint32(394)),
(T4)(geint32(393)),
(T4)(geint32(392)),
(T4)(geint32(391)),
(T4)(geint32(390)),
(T4)(geint32(389)),
(T4)(geint32(388)),
(T4)(geint32(387)),
(T4)(geint32(386)),
(T4)(geint32(385)),
(T4)(geint32(384)),
(T4)(geint32(383)),
(T4)(geint32(382)),
(T4)(geint32(379)),
(T4)(geint32(378)),
(T4)(geint32(377)),
(T4)(geint32(374)),
(T4)(geint32(373)),
(T4)(geint32(372)),
(T4)(geint32(371)),
(T4)(geint32(370)),
(T4)(geint32(369)),
(T4)(geint32(368)),
(T4)(geint32(367)),
(T4)(geint32(366)),
(T4)(geint32(365)),
(T4)(geint32(364)),
(T4)(geint32(363)),
(T4)(geint32(360)),
(T4)(geint32(359)),
(T4)(geint32(358)),
(T4)(geint32(357)),
(T4)(geint32(356)),
(T4)(geint32(355)),
(T4)(geint32(354)),
(T4)(geint32(353)),
(T4)(geint32(352)),
(T4)(geint32(351)),
(T4)(geint32(350)),
(T4)(geint32(348)),
(T4)(geint32(347)),
(T4)(geint32(346)),
(T4)(geint32(345)),
(T4)(geint32(342)),
(T4)(geint32(341)),
(T4)(geint32(340)),
(T4)(geint32(339)),
(T4)(geint32(338)),
(T4)(geint32(335)),
(T4)(geint32(334)),
(T4)(geint32(333)),
(T4)(geint32(332)),
(T4)(geint32(331)),
(T4)(geint32(330)),
(T4)(geint32(329)),
(T4)(geint32(328)),
(T4)(geint32(327)),
(T4)(geint32(324)),
(T4)(geint32(207)),
(T4)(geint32(320)),
(T4)(geint32(319)),
(T4)(geint32(316)),
(T4)(geint32(315)),
(T4)(geint32(314)),
(T4)(geint32(313)),
(T4)(geint32(312)),
(T4)(geint32(311)),
(T4)(geint32(310)),
(T4)(geint32(309)),
(T4)(geint32(308)),
(T4)(geint32(307)),
(T4)(geint32(306)),
(T4)(geint32(303)),
(T4)(geint32(302)),
(T4)(geint32(301)),
(T4)(geint32(300)),
(T4)(geint32(299)),
(T4)(geint32(298)),
(T4)(geint32(297)),
(T4)(geint32(154)),
(T4)(geint32(214)),
(T4)(geint32(293)),
(T4)(geint32(288)),
(T4)(geint32(184)),
(T4)(geint32(287)),
(T4)(geint32(286)),
(T4)(geint32(285)),
(T4)(geint32(282)),
(T4)(geint32(281)),
(T4)(geint32(280)),
(T4)(geint32(277)),
(T4)(geint32(276)),
(T4)(geint32(275)),
(T4)(geint32(274)),
(T4)(geint32(273)),
(T4)(geint32(272)),
(T4)(geint32(271)),
(T4)(geint32(270)),
(T4)(geint32(269)),
(T4)(geint32(268)),
(T4)(geint32(267)),
(T4)(geint32(266)),
(T4)(geint32(265)),
(T4)(geint32(264)),
(T4)(geint32(261)),
(T4)(geint32(260)),
(T4)(geint32(259)),
(T4)(geint32(256)),
(T4)(geint32(248)),
(T4)(geint32(199)),
(T4)(geint32(247)),
(T4)(geint32(245)),
(T4)(geint32(178)),
(T4)(geint32(244)),
(T4)(geint32(243)),
(T4)(geint32(242)),
(T4)(geint32(241)),
(T4)(geint32(240)),
(T4)(geint32(229)),
(T4)(geint32(228)),
(T4)(geint32(227)),
(T4)(geint32(226)),
(T4)(geint32(223)),
(T4)(geint32(222)),
(T4)(geint32(219)),
(T4)(geint32(212)),
(T4)(geint32(211)),
(T4)(geint32(204)),
(T4)(geint32(202)),
(T4)(geint32(199)),
(T4)(geint32(194)),
(T4)(geint32(188)),
(T4)(geint32(180)),
(T4)(geint32(178)),
(T4)(geint32(176)),
(T4)(geint32(175)),
(T4)(geint32(172)),
(T4)(geint32(171)),
(T4)(geint32(170)),
(T4)(geint32(169)),
(T4)(geint32(168)),
(T4)(geint32(167)),
(T4)(geint32(166)),
(T4)(geint32(165)),
(T4)(geint32(164)),
(T4)(geint32(162)),
(T4)(geint32(160)),
(T4)(geint32(159)),
(T4)(geint32(158)),
(T4)(geint32(151)),
(T4)(geint32(149)),
(T4)(geint32(148)),
(T4)(geint32(139)),
(T4)(geint32(470)),
(T4)(geint32(78)),
(T4)(geint32(78)),
(T4)(geint32(37)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(470)),
(T4)(geint32(2147483647))));
	R = (T35f262(C, t1));
	ge109ov2658 = R;
	return R;
}

/* LX_LEX_PARSER.empty_buffer */
unsigned char ge138os2535 = '\0';
T0* ge138ov2535;
T0* T35f17(T0* C)
{
	T0* R = 0;
	if (ge138os2535) {
		return ge138ov2535;
	} else {
		ge138os2535 = '\1';
	}
	R = T67c13(gems("", 0));
	ge138ov2535 = R;
	return R;
}

/* YY_BUFFER.make */
T0* T67c13(T0* a1)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T67));
	((T67*)(C))->id = 67;
	t1 = (((T16*)(a1))->a2);
	l2 = ((T4)((t1)+((T4)(geint32(2)))));
	l1 = (T67f9(C, l2));
	T216f13(l1, a1, (T4)(geint32(1)));
	t1 = ((T4)((l2)-((T4)(geint32(1)))));
	T216f9(l1, (T1)('\000'), t1);
	T216f9(l1, (T1)('\000'), l2);
	T67f19(C, l1);
	return C;
}

/* YY_BUFFER.make_from_buffer */
void T67f19(T0* C, T0* a1)
{
	T4 t1;
	t1 = (T216f4(a1));
	((T67*)(C))->a11 = ((T4)((t1)-((T4)(geint32(2)))));
	((T67*)(C))->a7 = (((T67*)(C))->a11);
	((T67*)(C))->a1 = (a1);
	((T67*)(C))->a2 = ((T4)(geint32(1)));
	((T67*)(C))->a3 = ((T4)(geint32(1)));
	((T67*)(C))->a4 = ((T4)(geint32(1)));
	((T67*)(C))->a5 = ((T4)(geint32(1)));
	((T67*)(C))->a6 = (EIF_TRUE);
}

/* KL_CHARACTER_BUFFER.fill_from_string */
void T216f13(T0* C, T0* a1, T4 a2)
{
	T4 l1 = 0;
	T2 t1;
	T4 t2;
	l1 = (((T16*)(a1))->a2);
	t1 = (T4f1(&l1, (T4)(geint32(0))));
	if (t1) {
		t1 = ((((T216*)(C))->a3)!=(EIF_VOID));
		if (t1) {
			t2 = ((T4)((a2)+((T4)(geint32(1)))));
			T16f39(((T216*)(C))->a6, a1, (T4)(geint32(1)), l1, t2);
		} else {
			T16f39(((T216*)(C))->a6, a1, (T4)(geint32(1)), l1, a2);
		}
	}
}

/* YY_BUFFER.new_default_buffer */
T0* T67f9(T0* C, T4 a1)
{
	T0* R = 0;
	R = T216c8(a1);
	return R;
}

/* GELEX_COMMAND_LINE.read_options */
void T19f8(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 l3 = 0;
	T0* l4 = 0;
	T2 l5 = 0;
	T2 l6 = 0;
	T4 l7 = 0;
	T4 l8 = 0;
	T0* l9 = 0;
	T4 l10 = 0;
	T0* l11 = 0;
	T0* t1;
	T2 t2;
	T1 t3;
	T4 t4;
	l1 = ((T4)(geint32(1)));
	t1 = (T19f2(C));
	l2 = ((T4)(geargc - 1));
	if (!(l3)) {
		t2 = (T4f1(&l1, l2));
	} else {
		t2 = EIF_TRUE;
	}
	while (!(t2)) {
		t1 = (T19f2(C));
		l4 = (T20f2(t1, l1));
		l8 = (((T16*)(l4))->a2);
		t2 = ((T2)((l8)<((T4)(geint32(2)))));
		if (!(t2)) {
			t3 = (T16f7(l4, (T4)(geint32(1))));
			t2 = ((t3)!=((T1)('-')));
		}
		if (t2) {
			l3 = (EIF_TRUE);
		} else {
			t2 = (T16f8(l4, gems("--", 2)));
			if (t2) {
				l3 = (EIF_TRUE);
				l1 = ((T4)((l1)+((T4)(geint32(1)))));
			} else {
				t2 = (T16f8(l4, gems("--version", 9)));
				if (t2) {
					T19f9(C);
					l1 = ((T4)((l1)+((T4)(geint32(1)))));
				} else {
					t2 = (T16f8(l4, gems("--help", 6)));
					if (t2) {
						T19f10(C);
						l1 = ((T4)((l1)+((T4)(geint32(1)))));
					} else {
						t4 = (((T16*)(l4))->a2);
						t2 = (T4f1(&t4, (T4)(geint32(9))));
						if (t2) {
							t1 = (T16f9(l4, (T4)(geint32(1)), (T4)(geint32(9))));
							t2 = (T16f8(t1, gems("--pragma=", 9)));
						}
						if (t2) {
							t4 = (((T16*)(l4))->a2);
							l11 = (T16f9(l4, (T4)(geint32(10)), t4));
							t2 = (T16f8(l11, gems("line", 4)));
							if (t2) {
								T22f35(a1, EIF_TRUE);
							} else {
								t2 = (T16f8(l11, gems("noline", 6)));
								if (t2) {
									T22f35(a1, EIF_FALSE);
								} else {
									T19f11(C);
								}
							}
							l1 = ((T4)((l1)+((T4)(geint32(1)))));
						} else {
							t3 = (T16f7(l4, (T4)(geint32(2))));
							switch (t3) {
							case (T1)(T1)('o'):
								t2 = (T4f1(&l8, (T4)(geint32(2))));
								if (t2) {
									t1 = (T16f9(l4, (T4)(geint32(3)), l8));
									T22f36(a1, t1);
								} else {
									t2 = ((T2)((l1)<(l2)));
									if (t2) {
										l1 = ((T4)((l1)+((T4)(geint32(1)))));
										t1 = (T19f2(C));
										t1 = (T20f2(t1, l1));
										T22f36(a1, t1);
									} else {
										T22f36(a1, EIF_VOID);
										T19f11(C);
									}
								}
								break;
							case (T1)(T1)('a'):
								l9 = (EIF_VOID);
								t2 = (T4f1(&l8, (T4)(geint32(2))));
								if (t2) {
									l9 = (T16f9(l4, (T4)(geint32(3)), l8));
								} else {
									t2 = ((T2)((l1)<(l2)));
									if (t2) {
										l1 = ((T4)((l1)+((T4)(geint32(1)))));
										t1 = (T19f2(C));
										l9 = (T20f2(t1, l1));
									}
								}
								t2 = ((l9)!=(EIF_VOID));
								if (t2) {
									t1 = (T19f3(C));
									t2 = (T56f1(t1, l9));
								}
								if (t2) {
									l10 = (T16f10(l9));
									t2 = (T4f5(&l10, (T4)(geint32(0))));
									if (t2) {
										T22f37(a1, l10);
									} else {
										T19f11(C);
									}
								} else {
									T19f11(C);
								}
								break;
							default:
								l7 = ((T4)(geint32(2)));
								t2 = (T4f1(&l7, l8));
								while (!(t2)) {
									t3 = (T16f7(l4, l7));
									switch (t3) {
									case (T1)(T1)('a'):
										T19f12(C, gems("-a", 2));
										break;
									case (T1)(T1)('b'):
										T22f38(a1, EIF_TRUE);
										break;
									case (T1)(T1)('c'):
										T22f39(a1, EIF_FALSE);
										T22f40(a1, EIF_FALSE);
										T22f41(a1, EIF_FALSE);
										break;
									case (T1)(T1)('d'):
										T22f42(a1, EIF_TRUE);
										break;
									case (T1)(T1)('e'):
										l5 = (EIF_TRUE);
										break;
									case (T1)(T1)('f'):
										T22f39(a1, EIF_FALSE);
										T22f40(a1, EIF_FALSE);
										T22f41(a1, EIF_TRUE);
										break;
									case (T1)(T1)('?'):
									case (T1)(T1)('h'):
										T19f10(C);
										break;
									case (T1)(T1)('i'):
										T22f43(a1, EIF_TRUE);
										break;
									case (T1)(T1)('m'):
										l6 = (EIF_TRUE);
										break;
									case (T1)(T1)('o'):
										T19f12(C, gems("-o", 2));
										break;
									case (T1)(T1)('s'):
										T22f44(a1, EIF_TRUE);
										break;
									case (T1)(T1)('V'):
										T19f9(C);
										break;
									case (T1)(T1)('w'):
										T22f45(a1, EIF_TRUE);
										break;
									case (T1)(T1)('x'):
										T22f46(a1, EIF_TRUE);
										break;
									case (T1)(T1)('z'):
										T22f47(a1, EIF_TRUE);
										break;
									default:
										t3 = (T16f7(l4, l7));
										t1 = (T1f1(&t3));
										T19f13(C, t1);
										break;
									}
									l7 = ((T4)((l7)+((T4)(geint32(1)))));
									t2 = (T4f1(&l7, l8));
								}
								break;
							}
							l1 = ((T4)((l1)+((T4)(geint32(1)))));
						}
					}
				}
			}
		}
		if (!(l3)) {
			t2 = (T4f1(&l1, l2));
		} else {
			t2 = EIF_TRUE;
		}
	}
	if (l5) {
		T22f39(a1, EIF_TRUE);
	}
	if (l6) {
		T22f40(a1, EIF_TRUE);
	}
	t2 = ((l1)==(l2));
	if (t2) {
		t1 = (T19f2(C));
		t1 = (T20f2(t1, l1));
		T22f48(a1, t1);
	} else {
		T19f11(C);
	}
}

/* LX_DESCRIPTION.set_input_filename */
void T22f48(T0* C, T0* a1)
{
	((T22*)(C))->a1 = (a1);
}

/* GELEX_COMMAND_LINE.report_unknown_flag_error */
void T19f13(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	l1 = T60c7(a1);
	T21f7(((T19*)(C))->a1, l1);
	t1 = (T19f5(C));
	T41f2(t1, (T4)(geint32(1)));
}

/* GELEX_COMMAND_LINE.exceptions */
T0* T19f5(T0* C)
{
	T0* R = 0;
	if (ge307os1300) {
		return ge307ov1300;
	} else {
		ge307os1300 = '\1';
	}
	R = T41c1();
	ge307ov1300 = R;
	return R;
}

/* UT_UNKNOWN_FLAG_ERROR.make */
T0* T60c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T60));
	((T60*)(C))->id = 60;
	((T60*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(1)));
	T119f8(((T60*)(C))->a5, a1, (T4)(geint32(1)));
	return C;
}

/* CHARACTER.out */
T0* T1f1(T1* C)
{
	T0* R = 0;
	T1 t1;
	R = T16c25((T4)(geint32(1)));
	t1 = (*C);
	T16f26(R, t1);
	return R;
}

/* LX_DESCRIPTION.set_inspect_used */
void T22f47(T0* C, T2 a1)
{
	((T22*)(C))->a23 = (a1);
}

/* LX_DESCRIPTION.set_actions_separated */
void T22f46(T0* C, T2 a1)
{
	((T22*)(C))->a22 = (a1);
}

/* GELEX_COMMAND_LINE.report_separated_flag_error */
void T19f12(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	l1 = T59c7(a1);
	T21f7(((T19*)(C))->a1, l1);
	t1 = (T19f5(C));
	T41f2(t1, (T4)(geint32(1)));
}

/* UT_SEPARATED_FLAG_ERROR.make */
T0* T59c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T59));
	((T59*)(C))->id = 59;
	((T59*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(1)));
	T119f8(((T59*)(C))->a5, a1, (T4)(geint32(1)));
	return C;
}

/* LX_DESCRIPTION.set_array_size */
void T22f37(T0* C, T4 a1)
{
	((T22*)(C))->a13 = (a1);
}

/* KL_STRING_ROUTINES.is_integer */
T2 T56f1(T0* C, T0* a1)
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
			l3 = (T16f7(a1, l1));
			t1 = (T1f4(&l3, (T1)('0')));
			if (!(t1)) {
				t1 = (T1f5(&l3, (T1)('9')));
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
T2 T1f5(T1* C, T1 a1)
{
	T2 R = 0;
	R = (T1f4(&a1, *C));
	return R;
}

/* CHARACTER.infix "<" */
T2 T1f4(T1* C, T1 a1)
{
	T2 R = 0;
	T4 t1;
	T4 t2;
	t1 = ((T4)(*C));
	t2 = ((T4)(a1));
	R = ((T2)((t1)<(t2)));
	return R;
}

/* GELEX_COMMAND_LINE.string_ */
T0* T19f3(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* GELEX_COMMAND_LINE.report_usage_error */
void T19f11(T0* C)
{
	T0* t1;
	t1 = (T19f6(C));
	T21f7(((T19*)(C))->a1, t1);
	t1 = (T19f5(C));
	T41f2(t1, (T4)(geint32(1)));
}

/* GELEX_COMMAND_LINE.usage_message */
unsigned char ge53os1312 = '\0';
T0* ge53ov1312;
T0* T19f6(T0* C)
{
	T0* R = 0;
	if (ge53os1312) {
		return ge53ov1312;
	} else {
		ge53os1312 = '\1';
	}
	R = T58c7(gems("[--version][--help][-bcefhimsVwxz\?][-a size]\n\t[--pragma=[no]line][-o filename][--] filename", 91));
	ge53ov1312 = R;
	return R;
}

/* UT_USAGE_MESSAGE.make */
T0* T58c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T58));
	((T58*)(C))->id = 58;
	((T58*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(1)));
	T119f8(((T58*)(C))->a5, a1, (T4)(geint32(1)));
	return C;
}

/* LX_DESCRIPTION.set_line_pragma */
void T22f35(T0* C, T2 a1)
{
	((T22*)(C))->a14 = (a1);
}

/* GELEX_COMMAND_LINE.report_usage_message */
void T19f10(T0* C)
{
	T0* t1;
	t1 = (T19f6(C));
	T21f9(((T19*)(C))->a1, t1);
	t1 = (T19f5(C));
	T41f2(t1, (T4)(geint32(0)));
}

/* UT_ERROR_HANDLER.report_info */
void T21f9(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T21f5(C, a1));
	T21f12(C, t1);
}

/* UT_ERROR_HANDLER.report_info_message */
void T21f12(T0* C, T0* a1)
{
	T55f12(((T21*)(C))->a4, a1);
}

/* GELEX_COMMAND_LINE.report_version_number */
void T19f9(T0* C)
{
	T0* l1 = 0;
	T0* t1;
	l1 = T57c7(ge302ov1313);
	T21f9(((T19*)(C))->a1, l1);
	t1 = (T19f5(C));
	T41f2(t1, (T4)(geint32(0)));
}

/* UT_VERSION_NUMBER.make */
T0* T57c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T57));
	((T57*)(C))->id = 57;
	((T57*)(C))->a5 = T119c7((T4)(geint32(1)), (T4)(geint32(1)));
	T119f8(((T57*)(C))->a5, a1, (T4)(geint32(1)));
	return C;
}

/* KL_ARGUMENTS.argument */
T0* T20f2(T0* C, T4 a1)
{
	T0* R = 0;
	char* s = geargv[a1];
	R = gems(s,strlen(s));
	return R;
}

/* GELEX_COMMAND_LINE.arguments */
unsigned char ge305os1302 = '\0';
T0* ge305ov1302;
T0* T19f2(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* KL_ARGUMENTS.make */
T0* T20c4()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T20));
	((T20*)(C))->id = 20;
	((T20*)(C))->a1 = (T20f2(C, (T4)(geint32(0))));
	return C;
}

/* GELEX_COMMAND_LINE.make */
T0* T19c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T19));
	((T19*)(C))->id = 19;
	((T19*)(C))->a1 = (a1);
	return C;
}

/* LX_DESCRIPTION.make */
T0* T22c34()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T22));
	((T22*)(C))->id = 22;
	((T22*)(C))->a10 = (EIF_TRUE);
	((T22*)(C))->a11 = (EIF_TRUE);
	((T22*)(C))->a12 = ((T4)(geint32(256)));
	((T22*)(C))->a13 = ((T4)(geint32(3000)));
	((T22*)(C))->a14 = (EIF_TRUE);
	((T22*)(C))->a5 = T45c15((T4)(geint32(250)));
	((T22*)(C))->a16 = T45c15((T4)(geint32(40)));
	((T22*)(C))->a18 = T62c10((T4)(geint32(1)));
	((T22*)(C))->a19 = T63c17((T4)(geint32(40)));
	return C;
}

/* LX_START_CONDITIONS.make_with_initial */
T0* T63c17(T4 a1)
{
	T0* l1 = 0;
	T0* C;
	C = (T0*)gealloc(sizeof(T63));
	((T63*)(C))->id = 63;
	T63f18(C, a1);
	l1 = T90c7(gems("INITIAL", 7), (T4)(geint32(0)), EIF_FALSE);
	T63f28(C, l1);
	return C;
}

/* LX_START_CONDITIONS.put_first */
void T63f28(T0* C, T0* a1)
{
	T63f32(C, a1, (T4)(geint32(1)));
}

/* LX_START_CONDITIONS.put */
void T63f32(T0* C, T0* a1, T4 a2)
{
	T4 t1;
	T2 t2;
	t1 = ((T4)((((T63*)(C))->a1)+((T4)(geint32(1)))));
	t2 = ((a2)==(t1));
	if (t2) {
		T63f22(C, a1);
	} else {
		T63f34(C, a2, (T4)(geint32(1)));
		T63f35(C, a2, (T4)(geint32(1)));
		((T170*)(((T63*)(C))->a7))->a2[a2] = (a1);
	}
}

/* LX_START_CONDITIONS.move_cursors_right */
void T63f35(T0* C, T4 a1, T4 a2)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	l1 = (((T63*)(C))->a10);
	t1 = ((l1)==(EIF_VOID));
	while (!(t1)) {
		l2 = (((T172*)(l1))->a2);
		t1 = (T4f5(&l2, a1));
		if (t1) {
			t2 = ((T4)((l2)+(a2)));
			T172f5(l1, t2);
		}
		l1 = (((T172*)(l1))->a1);
		t1 = ((l1)==(EIF_VOID));
	}
}

/* LX_START_CONDITIONS.move_right */
void T63f34(T0* C, T4 a1, T4 a2)
{
	T4 l1 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l1 = (((T63*)(C))->a1);
	((T63*)(C))->a1 = ((T4)((((T63*)(C))->a1)+(a2)));
	t1 = ((T2)((l1)<(a1)));
	while (!(t1)) {
		t2 = (((T170*)(((T63*)(C))->a7))->a2[l1]);
		t3 = ((T4)((l1)+(a2)));
		((T170*)(((T63*)(C))->a7))->a2[t3] = (t2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t1 = ((T2)((l1)<(a1)));
	}
}

/* DS_ARRAYED_LIST [STRING].make */
T0* T62c10(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T62));
	((T62*)(C))->id = 62;
	((T62*)(C))->a4 = T78c3();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T62*)(C))->a3 = (T78f1(((T62*)(C))->a4, t1));
	((T62*)(C))->a5 = (a1);
	((T62*)(C))->a6 = (T62f7(C));
	return C;
}

/* DS_ARRAYED_LIST [STRING].new_cursor */
T0* T62f7(T0* C)
{
	T0* R = 0;
	R = T169c2(C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [STRING].make */
T0* T169c2(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T169));
	((T169*)(C))->id = 169;
	((T169*)(C))->a1 = (a1);
	return C;
}

/* UT_ERROR_HANDLER.make_standard */
T0* T21c6()
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T21));
	((T21*)(C))->id = 21;
	t1 = (T21f2(C));
	((T21*)(C))->a1 = (T42f3(t1));
	t1 = (T21f2(C));
	((T21*)(C))->a3 = (T42f3(t1));
	t1 = (T21f2(C));
	((T21*)(C))->a4 = (T42f2(t1));
	return C;
}

/* UT_ERROR_HANDLER.std */
T0* T21f2(T0* C)
{
	T0* R = 0;
	if (ge289os1299) {
		return ge289ov1299;
	} else {
		ge289os1299 = '\1';
	}
	R = T42c4();
	ge289ov1299 = R;
	return R;
}

/* KL_ARGUMENTS.set_program_name */
void T20f5(T0* C, T0* a1)
{
	((T20*)(C))->a1 = (a1);
}

/* GELEX.arguments */
T0* T18f1(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* GELEX.resurrect_code */
void T18f8(T0* C)
{
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
	l1 = T23c1();
	l2 = T24c1();
	l3 = T25c1();
	l4 = T26c1();
	l5 = T27c2();
	l6 = T28c1();
	l7 = T29c1();
	l8 = T30c1();
	l9 = T31c1();
	l10 = T32c1();
	l11 = T33c1();
	l12 = T34c1();
}

/* KL_EQUALITY_TESTER [LX_SYMBOL_CLASS].default_create */
T0* T34c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T34));
	((T34*)(C))->id = 34;
	return C;
}

/* KL_EQUALITY_TESTER [LX_SINGLETON].default_create */
T0* T33c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T33));
	((T33*)(C))->id = 33;
	return C;
}

/* KL_EQUALITY_TESTER [LX_TRANSITION_TABLE [LX_DFA_STATE]].default_create */
T0* T32c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T32));
	((T32*)(C))->id = 32;
	return C;
}

/* KL_EQUALITY_TESTER [DS_PAIR [DP_COMMAND, DS_LINKED_LIST [LX_RULE]]].default_create */
T0* T31c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T31));
	((T31*)(C))->id = 31;
	return C;
}

/* KL_EQUALITY_TESTER [LX_PROTO].default_create */
T0* T30c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T30));
	((T30*)(C))->id = 30;
	return C;
}

/* KL_EQUALITY_TESTER [LX_NFA].default_create */
T0* T29c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T29));
	((T29*)(C))->id = 29;
	return C;
}

/* KL_EQUALITY_TESTER [STRING].default_create */
T0* T28c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T28));
	((T28*)(C))->id = 28;
	return C;
}

/* KL_EQUALITY_TESTER [LX_RULE].default_create */
T0* T26c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T26));
	((T26*)(C))->id = 26;
	return C;
}

/* KL_EQUALITY_TESTER [LX_START_CONDITION].default_create */
T0* T25c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T25));
	((T25*)(C))->id = 25;
	return C;
}

/* KL_EQUALITY_TESTER [LX_NFA_STATE].default_create */
T0* T24c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T24));
	((T24*)(C))->id = 24;
	return C;
}

/* KL_EQUALITY_TESTER [LX_DFA_STATE].default_create */
T0* T23c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T23));
	((T23*)(C))->id = 23;
	return C;
}

/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].set_target */
void T183f7(T0* C, T0* a1)
{
	((T183*)(C))->a2 = (a1);
}

/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].set_target */
void T182f7(T0* C, T0* a1)
{
	((T182*)(C))->a2 = (a1);
}

/* LX_EPSILON_TRANSITION [LX_NFA_STATE].set_target */
void T179f6(T0* C, T0* a1)
{
	((T179*)(C))->a1 = (a1);
}

/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].record */
void T183f8(T0* C, T0* a1)
{
	T135f12(a1, ((T183*)(C))->a1);
}

/* LX_SYMBOL_PARTITIONS.put */
void T135f12(T0* C, T4 a1)
{
	T146f6(((T135*)(C))->a2, EIF_TRUE, a1);
	T135f12p1(C, a1);
}

/* LX_SYMBOL_PARTITIONS.put */
void T135f12p1(T0* C, T4 a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T2 t1;
	l1 = (T186f4(((T135*)(C))->a5, a1));
	l2 = (((T184*)(l1))->a2);
	l3 = (((T184*)(l1))->a3);
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t1 = ((l3)!=(EIF_VOID));
	}
	if (t1) {
		T184f6(l2, l3);
		T184f7(l1);
		T184f8(l1);
	} else {
		t1 = ((l3)!=(EIF_VOID));
		if (t1) {
			T184f8(l3);
			T184f7(l1);
		} else {
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				T184f7(l2);
				T184f8(l1);
			}
		}
	}
}

/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].record */
void T182f8(T0* C, T0* a1)
{
	T135f11(a1, ((T182*)(C))->a1);
}

/* LX_SYMBOL_PARTITIONS.add */
void T135f11(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T0* l6 = 0;
	T2 t1;
	T4 t2;
	T135f11p1(C, a1);
	l3 = (((T79*)(a1))->a12);
	l6 = (((T135*)(C))->a2);
	t1 = (((T79*)(a1))->a6);
	if (t1) {
		t2 = (T135f7(C));
		l2 = ((T4)((t2)-((T4)(geint32(1)))));
		l4 = (T135f6(C));
		l1 = ((T4)(geint32(1)));
		t1 = (T4f1(&l1, l3));
		while (!(t1)) {
			l5 = (T79f14(a1, l1));
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = (T4f5(&l2, l5));
			while (!(t1)) {
				T146f6(l6, EIF_TRUE, l2);
				l2 = ((T4)((l2)+((T4)(geint32(1)))));
				t1 = (T4f5(&l2, l5));
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l3));
		}
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t1 = (T4f1(&l2, l4));
		while (!(t1)) {
			T146f6(l6, EIF_TRUE, l2);
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = (T4f1(&l2, l4));
		}
	} else {
		l1 = ((T4)(geint32(1)));
		t1 = (T4f1(&l1, l3));
		while (!(t1)) {
			t2 = (T79f14(a1, l1));
			T146f6(l6, EIF_TRUE, t2);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l3));
		}
	}
}

/* LX_SYMBOL_PARTITIONS.add */
void T135f11p1(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T4 l7 = 0;
	T4 l8 = 0;
	T2 l9 = 0;
	T2 l10 = 0;
	T4 l11 = 0;
	T0* l12 = 0;
	T4 t1;
	T4 t2;
	T2 t3;
	T2 t4;
	T0* t5;
	l8 = (((T79*)(a1))->a12);
	t1 = (T135f7(C));
	t2 = (T135f6(C));
	l12 = T146c5(t1, t2);
	l7 = ((T4)(geint32(1)));
	t3 = (T4f1(&l7, l8));
	while (!(t3)) {
		t1 = (T79f14(a1, l7));
		l1 = (T186f4(((T135*)(C))->a5, t1));
		l3 = (((T184*)(l1))->a2);
		l4 = (l1);
		l6 = ((T4)((l7)+((T4)(geint32(1)))));
		l2 = (((T184*)(l1))->a3);
		t3 = ((l2)==(EIF_VOID));
		while (!(t3)) {
			l5 = (((T184*)(l2))->a1);
			l9 = (EIF_FALSE);
			if (!(l9)) {
				t3 = (T4f1(&l6, l8));
			} else {
				t3 = EIF_TRUE;
			}
			while (!(t3)) {
				l11 = (T79f14(a1, l6));
				t3 = (T4f1(&l11, l5));
				if (t3) {
					l9 = (EIF_TRUE);
				} else {
					t3 = ((l11)==(l5));
					if (t3) {
						t4 = (T146f4(l12, l5));
						t3 = ((T2)(!(t4)));
					}
					if (t3) {
						T184f6(l4, l2);
						l4 = (l2);
						T146f6(l12, EIF_TRUE, l6);
						l10 = (EIF_TRUE);
						l9 = (EIF_TRUE);
					} else {
						l6 = ((T4)((l6)+((T4)(geint32(1)))));
					}
				}
				if (!(l9)) {
					t3 = (T4f1(&l6, l8));
				} else {
					t3 = EIF_TRUE;
				}
			}
			t3 = ((T2)(!(l10)));
			if (t3) {
				t3 = ((l3)==(EIF_VOID));
				if (t3) {
					T184f8(l2);
				} else {
					T184f6(l3, l2);
				}
				l3 = (l2);
			} else {
				l10 = (EIF_FALSE);
			}
			l2 = (((T184*)(l2))->a3);
			t3 = ((l2)==(EIF_VOID));
		}
		t5 = (((T184*)(l1))->a2);
		t3 = ((t5)!=(EIF_VOID));
		if (!(t3)) {
			t5 = (((T184*)(l1))->a2);
			t3 = ((l3)!=(t5));
		}
		if (t3) {
			T184f8(l1);
			T184f7(l3);
		}
		T184f7(l4);
		l7 = ((T4)((l7)+((T4)(geint32(1)))));
		t3 = (T4f1(&l7, l8));
		if (!(t3)) {
			t4 = (T146f4(l12, l7));
			t3 = ((T2)(!(t4)));
		}
		while (!(t3)) {
			l7 = ((T4)((l7)+((T4)(geint32(1)))));
			t3 = (T4f1(&l7, l8));
			if (!(t3)) {
				t4 = (T146f4(l12, l7));
				t3 = ((T2)(!(t4)));
			}
		}
		t3 = (T4f1(&l7, l8));
	}
}

/* LX_EPSILON_TRANSITION [LX_NFA_STATE].record */
void T179f7(T0* C, T0* a1)
{
}

/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].cloned_object */
T0* T183f3(T0* C)
{
	T0* R = 0;
	R = (T183f5(C));
	return R;
}

/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].twin */
T0* T183f5(T0* C)
{
	T0* R = 0;
	R = (T0*)gealloc(sizeof(T183));
	((T183*)(R))->id = 183;
	T183f9(R, C);
	return R;
}

/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].copy */
void T183f9(T0* C, T0* a1)
{
	*(T183*)(C) = *(T183*)(a1);
}

/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].cloned_object */
T0* T182f3(T0* C)
{
	T0* R = 0;
	R = (T182f5(C));
	return R;
}

/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].twin */
T0* T182f5(T0* C)
{
	T0* R = 0;
	R = (T0*)gealloc(sizeof(T182));
	((T182*)(R))->id = 182;
	T182f9(R, C);
	return R;
}

/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].copy */
void T182f9(T0* C, T0* a1)
{
	*(T182*)(C) = *(T182*)(a1);
}

/* LX_EPSILON_TRANSITION [LX_NFA_STATE].cloned_object */
T0* T179f2(T0* C)
{
	T0* R = 0;
	R = (T179f4(C));
	return R;
}

/* LX_EPSILON_TRANSITION [LX_NFA_STATE].twin */
T0* T179f4(T0* C)
{
	T0* R = 0;
	R = (T0*)gealloc(sizeof(T179));
	((T179*)(R))->id = 179;
	T179f8(R, C);
	return R;
}

/* LX_EPSILON_TRANSITION [LX_NFA_STATE].copy */
void T179f8(T0* C, T0* a1)
{
	*(T179*)(C) = *(T179*)(a1);
}

/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].labeled */
T2 T183f4(T0* C, T4 a1)
{
	T2 R = 0;
	R = ((((T183*)(C))->a1)==(a1));
	return R;
}

/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].labeled */
T2 T182f4(T0* C, T4 a1)
{
	T2 R = 0;
	T2 t1;
	t1 = (((T79*)(((T182*)(C))->a1))->a6);
	if (t1) {
		t1 = (T79f7(((T182*)(C))->a1, a1));
		R = ((T2)(!(t1)));
	} else {
		R = (T79f7(((T182*)(C))->a1, a1));
	}
	return R;
}

/* LX_EPSILON_TRANSITION [LX_NFA_STATE].labeled */
T2 T179f3(T0* C, T4 a1)
{
	T2 R = 0;
	return R;
}

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.default_message */
T0* T162f1(T0* C)
{
	T0* R = 0;
	R = (T162f3(C, ge87ov3637));
	return R;
}

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.message */
T0* T162f3(T0* C, T0* a1)
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
	t1 = (T162f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T162f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T162f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T162f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T162f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T162*)(C))->a5, l3));
						if (t2) {
							t1 = (T162f4(C));
							t5 = (T119f5(((T162*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T162f4(C));
								t5 = (T162f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T162f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T162f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.arguments */
T0* T162f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* KL_STRING_ROUTINES.appended_string */
T0* T56f5(T0* C, T0* a1, T0* a2)
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
			R = (T56f9(C, a1, a2));
		} else {
			T16f27(a1, a2);
			R = (a1);
		}
	}
	return R;
}

/* KL_STRING_ROUTINES.concat */
T0* T56f9(T0* C, T0* a1, T0* a2)
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
			R = (T16f15(a1, a2));
		}
	}
	return R;
}

/* STRING.infix "+" */
T0* T16f15(T0* C, T0* a1)
{
	T0* R = 0;
	T4 t1;
	t1 = (((T16*)(a1))->a2);
	t1 = ((T4)((((T16*)(C))->a2)+(t1)));
	R = (T16f20(C, t1));
	T16f31(R, C);
	T16f31(R, a1);
	return R;
}

/* ARRAY [STRING].valid_index */
T2 T119f4(T0* C, T4 a1)
{
	T2 R = 0;
	T2 t1;
	t1 = (T4f6(&(((T119*)(C))->a2), a1));
	if (t1) {
		R = (T4f6(&a1, ((T119*)(C))->a3));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* KL_STRING_ROUTINES.append_substring_to_string */
void T56f11(T0* C, T0* a1, T0* a2, T4 a3, T4 a4)
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
			t2 = (T16f7(a2, l2));
			T16f26(a1, t2);
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = (T4f1(&l2, a4));
		}
	}
}

/* KL_STRING_ROUTINES.appended_substring */
T0* T56f4(T0* C, T0* a1, T0* a2, T4 a3, T4 a4)
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
				t3 = (T16f7(a2, l2));
				T16f26(a1, t3);
				l2 = ((T4)((l2)+((T4)(geint32(1)))));
				t1 = (T4f1(&l2, a4));
			}
			R = (a1);
		}
	}
	return R;
}

/* KL_STRING_ROUTINES.new_empty_string */
T0* T56f3(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* t1;
	T2 t2;
	t1 = (T56f7(C));
	t2 = (T168f1(t1, a1, ge389ov4845));
	if (t2) {
		R = T16c25(a2);
	} else {
		l1 = EIF_VOID;
		t2 = ((l1)!=(EIF_VOID));
		if (t2) {
			R = ((T0*)gevoid(l1, a2));
		} else {
			R = (T56f6(C, a1));
			T16f32(R);
		}
	}
	return R;
}

/* STRING.wipe_out */
void T16f32(T0* C)
{
	((T16*)(C))->a1 = T15c8((T4)(geint32(1)));
	((T16*)(C))->a2 = ((T4)(geint32(0)));
	((T16*)(C))->a4 = ((T4)(geint32(0)));
}

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.string_ */
T0* T162f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_ITERATION_NOT_POSITIVE_ERROR.default_message */
T0* T161f1(T0* C)
{
	T0* R = 0;
	R = (T161f3(C, ge82ov3637));
	return R;
}

/* LX_ITERATION_NOT_POSITIVE_ERROR.message */
T0* T161f3(T0* C, T0* a1)
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
	t1 = (T161f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T161f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T161f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T161f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T161f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T161*)(C))->a5, l3));
						if (t2) {
							t1 = (T161f4(C));
							t5 = (T119f5(((T161*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T161f4(C));
								t5 = (T161f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T161f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T161f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_ITERATION_NOT_POSITIVE_ERROR.arguments */
T0* T161f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_ITERATION_NOT_POSITIVE_ERROR.string_ */
T0* T161f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_BAD_ITERATION_VALUES_ERROR.default_message */
T0* T160f1(T0* C)
{
	T0* R = 0;
	R = (T160f3(C, ge71ov3637));
	return R;
}

/* LX_BAD_ITERATION_VALUES_ERROR.message */
T0* T160f3(T0* C, T0* a1)
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
	t1 = (T160f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T160f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T160f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T160f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T160f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T160*)(C))->a5, l3));
						if (t2) {
							t1 = (T160f4(C));
							t5 = (T119f5(((T160*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T160f4(C));
								t5 = (T160f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T160f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T160f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_BAD_ITERATION_VALUES_ERROR.arguments */
T0* T160f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_BAD_ITERATION_VALUES_ERROR.string_ */
T0* T160f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_MULTIPLE_EOF_RULES_ERROR.default_message */
T0* T115f1(T0* C)
{
	T0* R = 0;
	R = (T115f3(C, ge85ov3637));
	return R;
}

/* LX_MULTIPLE_EOF_RULES_ERROR.message */
T0* T115f3(T0* C, T0* a1)
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
	t1 = (T115f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T115f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T115f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T115f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T115f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T115*)(C))->a5, l3));
						if (t2) {
							t1 = (T115f4(C));
							t5 = (T119f5(((T115*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T115f4(C));
								t5 = (T115f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T115f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T115f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_MULTIPLE_EOF_RULES_ERROR.arguments */
T0* T115f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_MULTIPLE_EOF_RULES_ERROR.string_ */
T0* T115f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_CHARACTER_OUT_OF_RANGE_ERROR.default_message */
T0* T114f1(T0* C)
{
	T0* R = 0;
	R = (T114f3(C, ge74ov3637));
	return R;
}

/* LX_CHARACTER_OUT_OF_RANGE_ERROR.message */
T0* T114f3(T0* C, T0* a1)
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
	t1 = (T114f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T114f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T114f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T114f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T114f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T114*)(C))->a5, l3));
						if (t2) {
							t1 = (T114f4(C));
							t5 = (T119f5(((T114*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T114f4(C));
								t5 = (T114f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T114f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T114f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_CHARACTER_OUT_OF_RANGE_ERROR.arguments */
T0* T114f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_CHARACTER_OUT_OF_RANGE_ERROR.string_ */
T0* T114f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_NAME_DEFINED_TWICE_ERROR.default_message */
T0* T113f1(T0* C)
{
	T0* R = 0;
	R = (T113f3(C, ge86ov3637));
	return R;
}

/* LX_NAME_DEFINED_TWICE_ERROR.message */
T0* T113f3(T0* C, T0* a1)
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
	t1 = (T113f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T113f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T113f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T113f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T113f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T113*)(C))->a5, l3));
						if (t2) {
							t1 = (T113f4(C));
							t5 = (T119f5(((T113*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T113f4(C));
								t5 = (T113f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T113f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T113f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_NAME_DEFINED_TWICE_ERROR.arguments */
T0* T113f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_NAME_DEFINED_TWICE_ERROR.string_ */
T0* T113f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_START_CONDITION_DECLARED_TWICE_ERROR.default_message */
T0* T112f1(T0* C)
{
	T0* R = 0;
	R = (T112f3(C, ge89ov3637));
	return R;
}

/* LX_START_CONDITION_DECLARED_TWICE_ERROR.message */
T0* T112f3(T0* C, T0* a1)
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
	t1 = (T112f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T112f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T112f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T112f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T112f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T112*)(C))->a5, l3));
						if (t2) {
							t1 = (T112f4(C));
							t5 = (T119f5(((T112*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T112f4(C));
								t5 = (T112f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T112f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T112f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_START_CONDITION_DECLARED_TWICE_ERROR.arguments */
T0* T112f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_START_CONDITION_DECLARED_TWICE_ERROR.string_ */
T0* T112f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_ALL_START_CONDITIONS_EOF_ERROR.default_message */
T0* T111f1(T0* C)
{
	T0* R = 0;
	R = (T111f3(C, ge67ov3637));
	return R;
}

/* LX_ALL_START_CONDITIONS_EOF_ERROR.message */
T0* T111f3(T0* C, T0* a1)
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
	t1 = (T111f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T111f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T111f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T111f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T111f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T111*)(C))->a5, l3));
						if (t2) {
							t1 = (T111f4(C));
							t5 = (T119f5(((T111*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T111f4(C));
								t5 = (T111f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T111f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T111f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_ALL_START_CONDITIONS_EOF_ERROR.arguments */
T0* T111f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_ALL_START_CONDITIONS_EOF_ERROR.string_ */
T0* T111f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_UNDECLARED_START_CONDITION_ERROR.default_message */
T0* T110f1(T0* C)
{
	T0* R = 0;
	R = (T110f3(C, ge93ov3637));
	return R;
}

/* LX_UNDECLARED_START_CONDITION_ERROR.message */
T0* T110f3(T0* C, T0* a1)
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
	t1 = (T110f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T110f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T110f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T110f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T110f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T110*)(C))->a5, l3));
						if (t2) {
							t1 = (T110f4(C));
							t5 = (T119f5(((T110*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T110f4(C));
								t5 = (T110f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T110f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T110f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_UNDECLARED_START_CONDITION_ERROR.arguments */
T0* T110f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_UNDECLARED_START_CONDITION_ERROR.string_ */
T0* T110f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_START_CONDITION_SPECIFIED_TWICE_ERROR.default_message */
T0* T109f1(T0* C)
{
	T0* R = 0;
	R = (T109f3(C, ge91ov3637));
	return R;
}

/* LX_START_CONDITION_SPECIFIED_TWICE_ERROR.message */
T0* T109f3(T0* C, T0* a1)
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
	t1 = (T109f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T109f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T109f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T109f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T109f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T109*)(C))->a5, l3));
						if (t2) {
							t1 = (T109f4(C));
							t5 = (T119f5(((T109*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T109f4(C));
								t5 = (T109f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T109f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T109f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_START_CONDITION_SPECIFIED_TWICE_ERROR.arguments */
T0* T109f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_START_CONDITION_SPECIFIED_TWICE_ERROR.string_ */
T0* T109f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.default_message */
T0* T108f1(T0* C)
{
	T0* R = 0;
	R = (T108f3(C, ge80ov3637));
	return R;
}

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.message */
T0* T108f3(T0* C, T0* a1)
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
	t1 = (T108f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T108f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T108f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T108f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T108f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T108*)(C))->a5, l3));
						if (t2) {
							t1 = (T108f4(C));
							t5 = (T119f5(((T108*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T108f4(C));
								t5 = (T108f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T108f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T108f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.arguments */
T0* T108f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.string_ */
T0* T108f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_FULL_AND_REJECT_ERROR.default_message */
T0* T107f1(T0* C)
{
	T0* R = 0;
	R = (T107f3(C, ge79ov3637));
	return R;
}

/* LX_FULL_AND_REJECT_ERROR.message */
T0* T107f3(T0* C, T0* a1)
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
	t1 = (T107f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T107f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T107f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T107f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T107f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T107*)(C))->a5, l3));
						if (t2) {
							t1 = (T107f4(C));
							t5 = (T119f5(((T107*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T107f4(C));
								t5 = (T107f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T107f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T107f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_FULL_AND_REJECT_ERROR.arguments */
T0* T107f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_FULL_AND_REJECT_ERROR.string_ */
T0* T107f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_FULL_AND_META_ERROR.default_message */
T0* T106f1(T0* C)
{
	T0* R = 0;
	R = (T106f3(C, ge78ov3637));
	return R;
}

/* LX_FULL_AND_META_ERROR.message */
T0* T106f3(T0* C, T0* a1)
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
	t1 = (T106f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T106f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T106f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T106f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T106f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T106*)(C))->a5, l3));
						if (t2) {
							t1 = (T106f4(C));
							t5 = (T119f5(((T106*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T106f4(C));
								t5 = (T106f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T106f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T106f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_FULL_AND_META_ERROR.arguments */
T0* T106f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_FULL_AND_META_ERROR.string_ */
T0* T106f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_BAD_CHARACTER_ERROR.default_message */
T0* T105f1(T0* C)
{
	T0* R = 0;
	R = (T105f3(C, ge69ov3637));
	return R;
}

/* LX_BAD_CHARACTER_ERROR.message */
T0* T105f3(T0* C, T0* a1)
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
	t1 = (T105f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T105f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T105f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T105f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T105f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T105*)(C))->a5, l3));
						if (t2) {
							t1 = (T105f4(C));
							t5 = (T119f5(((T105*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T105f4(C));
								t5 = (T105f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T105f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T105f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_BAD_CHARACTER_ERROR.arguments */
T0* T105f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_BAD_CHARACTER_ERROR.string_ */
T0* T105f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_MISSING_BRACKET_ERROR.default_message */
T0* T104f1(T0* C)
{
	T0* R = 0;
	R = (T104f3(C, ge83ov3637));
	return R;
}

/* LX_MISSING_BRACKET_ERROR.message */
T0* T104f3(T0* C, T0* a1)
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
	t1 = (T104f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T104f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T104f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T104f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T104f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T104*)(C))->a5, l3));
						if (t2) {
							t1 = (T104f4(C));
							t5 = (T119f5(((T104*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T104f4(C));
								t5 = (T104f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T104f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T104f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_MISSING_BRACKET_ERROR.arguments */
T0* T104f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_MISSING_BRACKET_ERROR.string_ */
T0* T104f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_BAD_CHARACTER_IN_BRACKETS_ERROR.default_message */
T0* T103f1(T0* C)
{
	T0* R = 0;
	R = (T103f3(C, ge70ov3637));
	return R;
}

/* LX_BAD_CHARACTER_IN_BRACKETS_ERROR.message */
T0* T103f3(T0* C, T0* a1)
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
	t1 = (T103f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T103f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T103f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T103f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T103f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T103*)(C))->a5, l3));
						if (t2) {
							t1 = (T103f4(C));
							t5 = (T119f5(((T103*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T103f4(C));
								t5 = (T103f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T103f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T103f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_BAD_CHARACTER_IN_BRACKETS_ERROR.arguments */
T0* T103f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_BAD_CHARACTER_IN_BRACKETS_ERROR.string_ */
T0* T103f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_BAD_START_CONDITION_ERROR.default_message */
T0* T102f1(T0* C)
{
	T0* R = 0;
	R = (T102f3(C, ge72ov3637));
	return R;
}

/* LX_BAD_START_CONDITION_ERROR.message */
T0* T102f3(T0* C, T0* a1)
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
	t1 = (T102f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T102f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T102f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T102f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T102f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T102*)(C))->a5, l3));
						if (t2) {
							t1 = (T102f4(C));
							t5 = (T119f5(((T102*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T102f4(C));
								t5 = (T102f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T102f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T102f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_BAD_START_CONDITION_ERROR.arguments */
T0* T102f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_BAD_START_CONDITION_ERROR.string_ */
T0* T102f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_BAD_CHARACTER_CLASS_ERROR.default_message */
T0* T101f1(T0* C)
{
	T0* R = 0;
	R = (T101f3(C, ge68ov3637));
	return R;
}

/* LX_BAD_CHARACTER_CLASS_ERROR.message */
T0* T101f3(T0* C, T0* a1)
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
	t1 = (T101f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T101f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T101f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T101f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T101f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T101*)(C))->a5, l3));
						if (t2) {
							t1 = (T101f4(C));
							t5 = (T119f5(((T101*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T101f4(C));
								t5 = (T101f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T101f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T101f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_BAD_CHARACTER_CLASS_ERROR.arguments */
T0* T101f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_BAD_CHARACTER_CLASS_ERROR.string_ */
T0* T101f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_UNDEFINED_DEFINITION_ERROR.default_message */
T0* T100f1(T0* C)
{
	T0* R = 0;
	R = (T100f3(C, ge94ov3637));
	return R;
}

/* LX_UNDEFINED_DEFINITION_ERROR.message */
T0* T100f3(T0* C, T0* a1)
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
	t1 = (T100f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T100f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T100f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T100f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T100f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T100*)(C))->a5, l3));
						if (t2) {
							t1 = (T100f4(C));
							t5 = (T119f5(((T100*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T100f4(C));
								t5 = (T100f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T100f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T100f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_UNDEFINED_DEFINITION_ERROR.arguments */
T0* T100f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_UNDEFINED_DEFINITION_ERROR.string_ */
T0* T100f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_INCOMPLETE_NAME_DEFINITION_ERROR.default_message */
T0* T99f1(T0* C)
{
	T0* R = 0;
	R = (T99f3(C, ge81ov3637));
	return R;
}

/* LX_INCOMPLETE_NAME_DEFINITION_ERROR.message */
T0* T99f3(T0* C, T0* a1)
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
	t1 = (T99f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T99f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T99f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T99f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T99f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T99*)(C))->a5, l3));
						if (t2) {
							t1 = (T99f4(C));
							t5 = (T119f5(((T99*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T99f4(C));
								t5 = (T99f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T99f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T99f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_INCOMPLETE_NAME_DEFINITION_ERROR.arguments */
T0* T99f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_INCOMPLETE_NAME_DEFINITION_ERROR.string_ */
T0* T99f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_MISSING_QUOTE_ERROR.default_message */
T0* T98f1(T0* C)
{
	T0* R = 0;
	R = (T98f3(C, ge84ov3637));
	return R;
}

/* LX_MISSING_QUOTE_ERROR.message */
T0* T98f3(T0* C, T0* a1)
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
	t1 = (T98f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T98f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T98f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T98f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T98f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T98*)(C))->a5, l3));
						if (t2) {
							t1 = (T98f4(C));
							t5 = (T119f5(((T98*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T98f4(C));
								t5 = (T98f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T98f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T98f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_MISSING_QUOTE_ERROR.arguments */
T0* T98f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_MISSING_QUOTE_ERROR.string_ */
T0* T98f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_UNRECOGNIZED_OPTION_ERROR.default_message */
T0* T97f1(T0* C)
{
	T0* R = 0;
	R = (T97f3(C, ge96ov3637));
	return R;
}

/* LX_UNRECOGNIZED_OPTION_ERROR.message */
T0* T97f3(T0* C, T0* a1)
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
	t1 = (T97f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T97f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T97f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T97f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T97f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T97*)(C))->a5, l3));
						if (t2) {
							t1 = (T97f4(C));
							t5 = (T119f5(((T97*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T97f4(C));
								t5 = (T97f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T97f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T97f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_UNRECOGNIZED_OPTION_ERROR.arguments */
T0* T97f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_UNRECOGNIZED_OPTION_ERROR.string_ */
T0* T97f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_START_CONDITION_EXPECTED_ERROR.default_message */
T0* T96f1(T0* C)
{
	T0* R = 0;
	R = (T96f3(C, ge90ov3637));
	return R;
}

/* LX_START_CONDITION_EXPECTED_ERROR.message */
T0* T96f3(T0* C, T0* a1)
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
	t1 = (T96f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T96f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T96f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T96f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T96f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T96*)(C))->a5, l3));
						if (t2) {
							t1 = (T96f4(C));
							t5 = (T119f5(((T96*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T96f4(C));
								t5 = (T96f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T96f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T96f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_START_CONDITION_EXPECTED_ERROR.arguments */
T0* T96f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_START_CONDITION_EXPECTED_ERROR.string_ */
T0* T96f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_DIRECTIVE_EXPECTED_ERROR.default_message */
T0* T95f1(T0* C)
{
	T0* R = 0;
	R = (T95f3(C, ge77ov3637));
	return R;
}

/* LX_DIRECTIVE_EXPECTED_ERROR.message */
T0* T95f3(T0* C, T0* a1)
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
	t1 = (T95f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T95f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T95f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T95f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T95f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T95*)(C))->a5, l3));
						if (t2) {
							t1 = (T95f4(C));
							t5 = (T119f5(((T95*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T95f4(C));
								t5 = (T95f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T95f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T95f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_DIRECTIVE_EXPECTED_ERROR.arguments */
T0* T95f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_DIRECTIVE_EXPECTED_ERROR.string_ */
T0* T95f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_UNRECOGNIZED_DIRECTIVE_ERROR.default_message */
T0* T94f1(T0* C)
{
	T0* R = 0;
	R = (T94f3(C, ge95ov3637));
	return R;
}

/* LX_UNRECOGNIZED_DIRECTIVE_ERROR.message */
T0* T94f3(T0* C, T0* a1)
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
	t1 = (T94f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T94f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T94f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T94f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T94f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T94*)(C))->a5, l3));
						if (t2) {
							t1 = (T94f4(C));
							t5 = (T119f5(((T94*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T94f4(C));
								t5 = (T94f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T94f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T94f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_UNRECOGNIZED_DIRECTIVE_ERROR.arguments */
T0* T94f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_UNRECOGNIZED_DIRECTIVE_ERROR.string_ */
T0* T94f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_TRAILING_CONTEXT_USED_TWICE_ERROR.default_message */
T0* T93f1(T0* C)
{
	T0* R = 0;
	R = (T93f3(C, ge92ov3637));
	return R;
}

/* LX_TRAILING_CONTEXT_USED_TWICE_ERROR.message */
T0* T93f3(T0* C, T0* a1)
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
	t1 = (T93f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T93f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T93f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T93f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T93f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T93*)(C))->a5, l3));
						if (t2) {
							t1 = (T93f4(C));
							t5 = (T119f5(((T93*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T93f4(C));
								t5 = (T93f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T93f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T93f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_TRAILING_CONTEXT_USED_TWICE_ERROR.arguments */
T0* T93f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_TRAILING_CONTEXT_USED_TWICE_ERROR.string_ */
T0* T93f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_UNRECOGNIZED_RULE_ERROR.default_message */
T0* T92f1(T0* C)
{
	T0* R = 0;
	R = (T92f3(C, ge97ov3637));
	return R;
}

/* LX_UNRECOGNIZED_RULE_ERROR.message */
T0* T92f3(T0* C, T0* a1)
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
	t1 = (T92f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T92f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T92f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T92f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T92f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T92*)(C))->a5, l3));
						if (t2) {
							t1 = (T92f4(C));
							t5 = (T119f5(((T92*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T92f4(C));
								t5 = (T92f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T92f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T92f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_UNRECOGNIZED_RULE_ERROR.arguments */
T0* T92f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_UNRECOGNIZED_RULE_ERROR.string_ */
T0* T92f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_BAD_START_CONDITION_LIST_ERROR.default_message */
T0* T91f1(T0* C)
{
	T0* R = 0;
	R = (T91f3(C, ge73ov3637));
	return R;
}

/* LX_BAD_START_CONDITION_LIST_ERROR.message */
T0* T91f3(T0* C, T0* a1)
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
	t1 = (T91f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T91f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T91f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T91f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T91f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T91*)(C))->a5, l3));
						if (t2) {
							t1 = (T91f4(C));
							t5 = (T119f5(((T91*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T91f4(C));
								t5 = (T91f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T91f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T91f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_BAD_START_CONDITION_LIST_ERROR.arguments */
T0* T91f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_BAD_START_CONDITION_LIST_ERROR.string_ */
T0* T91f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* UT_SYNTAX_ERROR.default_message */
T0* T86f1(T0* C)
{
	T0* R = 0;
	R = (T86f3(C, ge212ov3637));
	return R;
}

/* UT_SYNTAX_ERROR.message */
T0* T86f3(T0* C, T0* a1)
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
	t1 = (T86f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T86f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T86f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T86f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T86f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T86*)(C))->a5, l3));
						if (t2) {
							t1 = (T86f4(C));
							t5 = (T119f5(((T86*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T86f4(C));
								t5 = (T86f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T86f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T86f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
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
T0* T86f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* UT_SYNTAX_ERROR.string_ */
T0* T86f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* UT_UNKNOWN_FLAG_ERROR.default_message */
T0* T60f1(T0* C)
{
	T0* R = 0;
	R = (T60f3(C, ge214ov3637));
	return R;
}

/* UT_UNKNOWN_FLAG_ERROR.message */
T0* T60f3(T0* C, T0* a1)
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
	t1 = (T60f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T60f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T60f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T60f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T60f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T60*)(C))->a5, l3));
						if (t2) {
							t1 = (T60f4(C));
							t5 = (T119f5(((T60*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T60f4(C));
								t5 = (T60f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T60f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T60f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* UT_UNKNOWN_FLAG_ERROR.arguments */
T0* T60f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* UT_UNKNOWN_FLAG_ERROR.string_ */
T0* T60f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* UT_SEPARATED_FLAG_ERROR.default_message */
T0* T59f1(T0* C)
{
	T0* R = 0;
	R = (T59f3(C, ge211ov3637));
	return R;
}

/* UT_SEPARATED_FLAG_ERROR.message */
T0* T59f3(T0* C, T0* a1)
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
	t1 = (T59f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T59f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T59f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T59f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T59f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T59*)(C))->a5, l3));
						if (t2) {
							t1 = (T59f4(C));
							t5 = (T119f5(((T59*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T59f4(C));
								t5 = (T59f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T59f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T59f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* UT_SEPARATED_FLAG_ERROR.arguments */
T0* T59f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* UT_SEPARATED_FLAG_ERROR.string_ */
T0* T59f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* UT_USAGE_MESSAGE.default_message */
T0* T58f1(T0* C)
{
	T0* R = 0;
	R = (T58f3(C, ge215ov3637));
	return R;
}

/* UT_USAGE_MESSAGE.message */
T0* T58f3(T0* C, T0* a1)
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
	t1 = (T58f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T58f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T58f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T58f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T58f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T58*)(C))->a5, l3));
						if (t2) {
							t1 = (T58f4(C));
							t5 = (T119f5(((T58*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T58f4(C));
								t5 = (T58f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T58f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T58f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
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
T0* T58f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* UT_USAGE_MESSAGE.string_ */
T0* T58f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* UT_VERSION_NUMBER.default_message */
T0* T57f1(T0* C)
{
	T0* R = 0;
	R = (T57f3(C, ge216ov3637));
	return R;
}

/* UT_VERSION_NUMBER.message */
T0* T57f3(T0* C, T0* a1)
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
	t1 = (T57f4(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T57f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T57f4(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T57f4(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T57f4(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T57*)(C))->a5, l3));
						if (t2) {
							t1 = (T57f4(C));
							t5 = (T119f5(((T57*)(C))->a5, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T57f4(C));
								t5 = (T57f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T57f4(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T57f4(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
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
T0* T57f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* UT_VERSION_NUMBER.string_ */
T0* T57f4(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
T0* T53f2(T0* C)
{
	T0* R = 0;
	R = (T53f4(C, ge207ov3637));
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
T0* T53f4(T0* C, T0* a1)
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
	t1 = (T53f5(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T53f5(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T53f5(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T53f5(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T53f5(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T53*)(C))->a1, l3));
						if (t2) {
							t1 = (T53f5(C));
							t5 = (T119f5(((T53*)(C))->a1, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T53f5(C));
								t5 = (T53f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T53f5(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T53f5(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
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
T0* T53f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
T0* T53f5(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_DEFAULT_RULE_CAN_BE_MATCHED_ERROR.default_message */
T0* T49f2(T0* C)
{
	T0* R = 0;
	R = (T49f4(C, ge76ov3637));
	return R;
}

/* LX_DEFAULT_RULE_CAN_BE_MATCHED_ERROR.message */
T0* T49f4(T0* C, T0* a1)
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
	t1 = (T49f5(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T49f5(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T49f5(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T49f5(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T49f5(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T49*)(C))->a1, l3));
						if (t2) {
							t1 = (T49f5(C));
							t5 = (T119f5(((T49*)(C))->a1, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T49f5(C));
								t5 = (T49f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T49f5(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T49f5(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_DEFAULT_RULE_CAN_BE_MATCHED_ERROR.arguments */
T0* T49f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_DEFAULT_RULE_CAN_BE_MATCHED_ERROR.string_ */
T0* T49f5(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_RULE_CANNOT_BE_MATCHED_ERROR.default_message */
T0* T48f2(T0* C)
{
	T0* R = 0;
	R = (T48f4(C, ge88ov3637));
	return R;
}

/* LX_RULE_CANNOT_BE_MATCHED_ERROR.message */
T0* T48f4(T0* C, T0* a1)
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
	t1 = (T48f5(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T48f5(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T48f5(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T48f5(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T48f5(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T48*)(C))->a1, l3));
						if (t2) {
							t1 = (T48f5(C));
							t5 = (T119f5(((T48*)(C))->a1, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T48f5(C));
								t5 = (T48f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T48f5(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T48f5(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_RULE_CANNOT_BE_MATCHED_ERROR.arguments */
T0* T48f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_RULE_CANNOT_BE_MATCHED_ERROR.string_ */
T0* T48f5(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* LX_DANGEROUS_TRAILING_CONTEXT_ERROR.default_message */
T0* T47f2(T0* C)
{
	T0* R = 0;
	R = (T47f4(C, ge75ov3637));
	return R;
}

/* LX_DANGEROUS_TRAILING_CONTEXT_ERROR.message */
T0* T47f4(T0* C, T0* a1)
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
	t1 = (T47f5(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T47f5(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T47f5(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T47f5(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T47f5(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T47*)(C))->a1, l3));
						if (t2) {
							t1 = (T47f5(C));
							t5 = (T119f5(((T47*)(C))->a1, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T47f5(C));
								t5 = (T47f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T47f5(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T47f5(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* LX_DANGEROUS_TRAILING_CONTEXT_ERROR.arguments */
T0* T47f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* LX_DANGEROUS_TRAILING_CONTEXT_ERROR.string_ */
T0* T47f5(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.default_message */
T0* T37f2(T0* C)
{
	T0* R = 0;
	R = (T37f4(C, ge206ov3637));
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.message */
T0* T37f4(T0* C, T0* a1)
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
	t1 = (T37f5(C));
	R = (T56f3(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f7(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f26(R, l5);
			} else {
				t1 = (T37f5(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T56f4(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f26(R, (T1)('$'));
			} else {
				l5 = (T16f7(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f26(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T37f5(C));
					l1 = (T56f3(t1, a1, (T4)(geint32(5))));
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
							l5 = (T16f7(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f26(l1, l5);
								} else {
									t1 = (T37f5(C));
									T56f11(t1, l1, a1, l2, l2);
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
							l5 = (T16f7(a1, l2));
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
								T16f26(l1, l5);
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
					t1 = (T37f5(C));
					t2 = (T56f1(t1, l1));
					if (t2) {
						l3 = (T16f10(l1));
						t2 = (T119f4(((T37*)(C))->a1, l3));
						if (t2) {
							t1 = (T37f5(C));
							t5 = (T119f5(((T37*)(C))->a1, l3));
							R = (T56f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T37f5(C));
								t5 = (T37f6(C));
								t5 = (((T20*)(t5))->a1);
								R = (T56f5(t1, R, t5));
							} else {
								T16f26(R, (T1)('$'));
								if (l7) {
									T16f26(R, (T1)('{'));
								}
								t1 = (T37f5(C));
								R = (T56f5(t1, R, l1));
								if (l8) {
									T16f26(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f26(R, (T1)('$'));
						if (l7) {
							T16f26(R, (T1)('{'));
						}
						t1 = (T37f5(C));
						R = (T56f5(t1, R, l1));
						if (l8) {
							T16f26(R, (T1)('}'));
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
T0* T37f6(T0* C)
{
	T0* R = 0;
	if (ge305os1302) {
		return ge305ov1302;
	} else {
		ge305os1302 = '\1';
	}
	R = T20c4();
	ge305ov1302 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.string_ */
T0* T37f5(T0* C)
{
	T0* R = 0;
	if (ge259os1314) {
		return ge259ov1314;
	} else {
		ge259os1314 = '\1';
	}
	R = T56c10();
	ge259ov1314 = R;
	return R;
}

T0* gema130(T4 c, ...)
{
	T0* R;
	T0* a;
	a = (T0*)gealloc(sizeof(T71)+c*sizeof(T4));
	((T71*)(a))->id = 71;
	((T71*)(a))->a1 = c;
	if (c!=0) {
		va_list v;
		T4 n = c;
		T4 *i = ((T71*)(a))->a2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T4);
		}
		va_end(v);
	}
	R = (T0*)gealloc(sizeof(T130));
	((T130*)(R))->id = 130;
	((T130*)(R))->a1 = a;
	((T130*)(R))->a2 = 1;
	((T130*)(R))->a3 = (T4)c;
	return R;
}

int gevoid(T0* C, ...){
	printf("Call on Void target!\n");
	exit(1);
}

int geargc;
char** geargv;

T0* ge385ov4446;
T0* ge389ov4845;
T0* ge387ov4446;
T0* ge392ov4446;
T0* ge362ov2937;
T0* ge218ov5893;
T0* ge218ov5894;
T0* ge102ov4063;
T0* ge217ov5906;
T0* ge217ov5905;
T0* ge217ov5904;
T0* ge217ov5903;
T0* ge102ov4065;
T0* ge386ov3705;
T0* ge373ov2917;
T0* ge302ov1313;
T0* ge87ov3637;
T0* ge82ov3637;
T0* ge71ov3637;
T0* ge85ov3637;
T0* ge74ov3637;
T0* ge86ov3637;
T0* ge89ov3637;
T0* ge67ov3637;
T0* ge93ov3637;
T0* ge91ov3637;
T0* ge80ov3637;
T0* ge79ov3637;
T0* ge78ov3637;
T0* ge69ov3637;
T0* ge83ov3637;
T0* ge70ov3637;
T0* ge72ov3637;
T0* ge68ov3637;
T0* ge94ov3637;
T0* ge81ov3637;
T0* ge84ov3637;
T0* ge96ov3637;
T0* ge90ov3637;
T0* ge77ov3637;
T0* ge95ov3637;
T0* ge92ov3637;
T0* ge97ov3637;
T0* ge73ov3637;
T0* ge212ov3637;
T0* ge214ov3637;
T0* ge211ov3637;
T0* ge215ov3637;
T0* ge216ov3637;
T0* ge207ov3637;
T0* ge76ov3637;
T0* ge88ov3637;
T0* ge75ov3637;
T0* ge206ov3637;

void geconst()
{
	ge385ov4446 = (gems("\n", 1));
	ge389ov4845 = (gems("", 0));
	ge387ov4446 = (gems("\n", 1));
	ge392ov4446 = (gems("\n", 1));
	ge362ov2937 = (gems("empty_name", 10));
	ge218ov5893 = (gems("true", 4));
	ge218ov5894 = (gems("false", 5));
	ge102ov4063 = (gems("\t\t\t", 3));
	ge217ov5906 = (gems("\t\t\t", 3));
	ge217ov5905 = (gems("    ", 4));
	ge217ov5904 = (gems("   ", 3));
	ge217ov5903 = (gems("  ", 2));
	ge102ov4065 = (gems("standard input", 14));
	ge386ov3705 = (gems("", 0));
	ge373ov2917 = (gems("", 0));
	ge302ov1313 = (gems("3.4", 3));
	ge87ov3637 = (gems("\"$1\", line $2: negative range in character class", 48));
	ge82ov3637 = (gems("\"$1\", line $2: iteration value must be positive", 47));
	ge71ov3637 = (gems("\"$1\", line $2: bad iteration values", 35));
	ge85ov3637 = (gems("\"$1\", line $2: multiple <<EOF>> rules for start condition $3", 60));
	ge74ov3637 = (gems("\"$1\", line $2: character \'$3\' out of range", 42));
	ge86ov3637 = (gems("\"$1\", line $2: name \'$3\' defined twice", 38));
	ge89ov3637 = (gems("\"$1\", line $2: start condition $3 declared twice", 48));
	ge67ov3637 = (gems("Warning, \"$1\", line $2: all start conditions already have <<EOF>> rules", 71));
	ge93ov3637 = (gems("\"$1\", line $2: undeclared start condition $3", 44));
	ge91ov3637 = (gems("Warning, \"$1\", line $2: <$3> specified twice", 44));
	ge80ov3637 = (gems("$0: variable trailing context rules cannot be used with -f", 58));
	ge79ov3637 = (gems("$0: `reject\' cannot be used with -f", 35));
	ge78ov3637 = (gems("$0: -f and -m don\'t make sense together", 39));
	ge69ov3637 = (gems("\"$1\", line $2: bad character: $3", 32));
	ge83ov3637 = (gems("\"$1\", line $2: missing }", 24));
	ge70ov3637 = (gems("\"$1\", line $2: bad character inside {}\'s", 40));
	ge72ov3637 = (gems("\"$1\", line $2: bad <start condition>: $3", 40));
	ge68ov3637 = (gems("\"$1\", line $2: bad character class or missing close bracket", 59));
	ge94ov3637 = (gems("\"$1\", line $2: undefined definition $3", 38));
	ge81ov3637 = (gems("\"$1\", line $2: incomplete name definition", 41));
	ge84ov3637 = (gems("\"$1\", line $2: missing quote", 28));
	ge96ov3637 = (gems("\"$1\", line $2: unrecognized \045option: $3", 39));
	ge90ov3637 = (gems("\"$1\", line $2: start condition name expected", 44));
	ge77ov3637 = (gems("\"$1\", line $2: \'\045\' directive expected", 37));
	ge95ov3637 = (gems("\"$1\", line $2: unrecognized \'\045\' directive", 41));
	ge92ov3637 = (gems("\"$1\", line $2: trailing context used twice", 42));
	ge97ov3637 = (gems("\"$1\", line $2: unrecognized rule", 32));
	ge73ov3637 = (gems("\"$1\", line $2: bad start condition list", 39));
	ge212ov3637 = (gems("Syntax error in \"$1\" at line $2", 31));
	ge214ov3637 = (gems("$0: unknown flag \'$1\'", 21));
	ge211ov3637 = (gems("$0: $1 flag must be given separately", 36));
	ge215ov3637 = (gems("usage: $0 $1", 12));
	ge216ov3637 = (gems("$0 version $1", 13));
	ge207ov3637 = (gems("$0: cannot write to \'$1\'", 24));
	ge76ov3637 = (gems("Warning, \"$1\": nodefault or -s option given but default rule can be matched", 75));
	ge88ov3637 = (gems("Warning, \"$1\", line $2: rule cannot be matched", 46));
	ge75ov3637 = (gems("Warning, \"$1\", line $2: dangerous trailing context", 50));
	ge206ov3637 = (gems("$0: cannot read \'$1\'", 20));
}

EIF_TYPE getypes[233] = {
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
{0, EIF_FALSE},
{0, EIF_TRUE},
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
{0, EIF_TRUE},
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
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
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
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE}
};

int main(int argc, char** argv)
{
	T0* l1;
	geargc = argc;
	geargv = argv;
	geconst();
	l1 = T18c7();
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
