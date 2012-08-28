#include "geant.h"

#ifdef __cplusplus
extern "C" {
#endif

/* GEANT_ARGUMENT_VARIABLES.replace */
void T34f78(T0* C, T0* a1, T0* a2)
{
	T34f52(C);
	T34f53(C, a2);
	T34f54(C, a1, ((T34*)(C))->a1);
}

/* GEANT_VARIABLES.replace */
void T29f78(T0* C, T0* a1, T0* a2)
{
	T29f53(C);
	T29f54(C, a2);
	T29f55(C, a1, ((T29*)(C))->a1);
}

/* GEANT_PROJECT_VARIABLES.replace */
void T25f95(T0* C, T0* a1, T0* a2)
{
	T25f65(C);
	T25f66(C, a2);
	T25f67(C, a1, ((T25*)(C))->a3);
}

/* LX_SYMBOL_TRANSITION [LX_NFA_STATE].labeled */
T1 T629f3(T0* C, T6 a1)
{
	T1 R = 0;
	R = (((((((T629*)(C))->a1) == (a1)))));
	return R;
}

/* LX_EPSILON_TRANSITION [LX_NFA_STATE].labeled */
T1 T627f2(T0* C, T6 a1)
{
	T1 R = 0;
	return R;
}

/* LX_SYMBOL_CLASS_TRANSITION [LX_NFA_STATE].labeled */
T1 T625f3(T0* C, T6 a1)
{
	T1 t1;
	T1 R = 0;
	t1 = (((T576*)(GE_void(((T625*)(C))->a1)))->a5);
	if (t1) {
		t1 = (T576f9(GE_void(((T625*)(C))->a1), a1));
		R = ((T1)(!(t1)));
	} else {
		R = (T576f9(GE_void(((T625*)(C))->a1), a1));
	}
	return R;
}

/* GEANT_REPLACE_TASK.is_executable */
T1 T316f18(T0* C)
{
	T1 R = 0;
	R = (T462f14(GE_void(((T316*)(C))->a1)));
	return R;
}

/* GEANT_REPLACE_COMMAND.is_executable */
T1 T462f14(T0* C)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T0* t4;
	T1 R = 0;
	t1 = (T462f15(C));
	t2 = (T462f16(C));
	t3 = (T462f17(C));
	t4 = GE_ma244((T6)2,(T6)2,
(int)(t2),
(int)(t3));
	R = (T563f1(GE_void(t1), t4));
	return R;
}

/* KL_BOOLEAN_ROUTINES.nxor */
T1 T563f1(T0* C, T0* a1)
{
	T1 t1;
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	l1 = (((T244*)(a1))->a2);
	l2 = (((T244*)(a1))->a3);
	while (1) {
		t1 = (T6f1((&l1), l2));
		if (t1) {
			break;
		}
		t1 = (T244f4(a1, l1));
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
T1 T462f17(T0* C)
{
	T1 R = 0;
	R = ((((T462*)(C))->a11)!=(EIF_VOID));
	return R;
}

/* GEANT_REPLACE_COMMAND.boolean_ */
unsigned char ge123os5418 = '\0';
T0* ge123ov5418;
T0* T462f15(T0* C)
{
	T0* R = 0;
	if (ge123os5418) {
		return ge123ov5418;
	} else {
		ge123os5418 = '\1';
		ge123ov5418 = R;
	}
	R = T563c2();
	ge123ov5418 = R;
	return R;
}

/* KL_BOOLEAN_ROUTINES.default_create */
T0* T563c2(void)
{
	T0* C;
	C = GE_new563(EIF_TRUE);
	return C;
}

/* GEANT_INPUT_TASK.is_executable */
T1 T314f20(T0* C)
{
	T1 R = 0;
	R = (T459f11(GE_void(((T314*)(C))->a1)));
	return R;
}

/* GEANT_INPUT_COMMAND.is_executable */
T1 T459f11(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T459*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T459*)(C))->a3)))->id==17)?((T17*)(((T459*)(C))->a3))->a2:((T205*)(((T459*)(C))->a3))->a1));
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		R = ((((T459*)(C))->a4)!=(EIF_VOID));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_AVAILABLE_TASK.is_executable */
T1 T312f6(T0* C)
{
	T1 R = 0;
	R = (T456f13(GE_void(((T312*)(C))->a1)));
	return R;
}

/* GEANT_AVAILABLE_COMMAND.is_executable */
T1 T456f13(T0* C)
{
	T1 t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T0* l1 = 0;
	l1 = T561c2(EIF_TRUE);
	t1 = (T386f5(GE_void(((T456*)(C))->a1)));
	T456f20(C, t1, GE_ms8("  [available] error: \'resource\' is not defined", 46), l1);
	t1 = (((T561*)(GE_void(l1)))->a1);
	if (t1) {
		t2 = (T386f6(GE_void(((T456*)(C))->a1)));
		t3 = (((((T0*)(GE_void(t2)))->id==17)?T17f32(t2):T205f53(t2)));
		t1 = ((T1)(!(t3)));
	}
	T456f20(C, t1, GE_ms8("  [available] error: \'resource\' is empty", 40), l1);
	t1 = (((T561*)(GE_void(l1)))->a1);
	if (t1) {
		t1 = (T386f5(GE_void(((T456*)(C))->a2)));
	}
	T456f20(C, t1, GE_ms8("  [available] error: \'variable\' is not defined", 46), l1);
	t1 = (((T561*)(GE_void(l1)))->a1);
	if (t1) {
		t2 = (T386f6(GE_void(((T456*)(C))->a2)));
		t3 = (((((T0*)(GE_void(t2)))->id==17)?T17f32(t2):T205f53(t2)));
		t1 = ((T1)(!(t3)));
	}
	T456f20(C, t1, GE_ms8("  [available] error: \'variable\' is empty", 40), l1);
	R = (((T561*)(GE_void(l1)))->a1);
	return R;
}

/* GEANT_AVAILABLE_COMMAND.validate_condition */
void T456f20(T0* C, T1 a1, T0* a2, T0* a3)
{
	T1 t1;
	T0* t2;
	t1 = (((T561*)(GE_void(a3)))->a1);
	if (t1) {
		t1 = ((T1)(!(a1)));
		if (t1) {
			T561f3(GE_void(a3), EIF_FALSE);
			t2 = (T456f16(C));
			T71f28(GE_void(t2), a2);
		}
	}
}

/* GEANT_AVAILABLE_COMMAND.validation_messages */
T0* T456f16(T0* C)
{
	T0* R = 0;
	if (ge10os1757) {
		return ge10ov1757;
	} else {
		ge10os1757 = '\1';
		ge10ov1757 = R;
	}
	R = T71c24((T6)(GE_int32(5)));
	ge10ov1757 = R;
	return R;
}

/* DS_CELL [BOOLEAN].put */
void T561f3(T0* C, T1 a1)
{
	((T561*)(C))->a1 = a1;
}

/* DS_CELL [BOOLEAN].make */
T0* T561c2(T1 a1)
{
	T0* C;
	C = GE_new561(EIF_TRUE);
	((T561*)(C))->a1 = a1;
	return C;
}

/* GEANT_PRECURSOR_TASK.is_executable */
T1 T310f17(T0* C)
{
	T1 R = 0;
	R = (T453f7(GE_void(((T310*)(C))->a1)));
	return R;
}

/* GEANT_PRECURSOR_COMMAND.is_executable */
T1 T453f7(T0* C)
{
	T0* t1;
	T1 t2;
	T1 R = 0;
	t1 = (T22f22(GE_void(((T453*)(C))->a3)));
	t1 = (((T26*)(GE_void(t1)))->a13);
	R = ((t1)!=(EIF_VOID));
	t2 = ((T1)(!(R)));
	if (t2) {
		t1 = GE_ma33((T6)1,(T6)1,
GE_ms8("  [precursor] error: precursor does not exist.", 46));
		T22f50(GE_void(((T453*)(C))->a3), t1);
	}
	return R;
}

/* GEANT_EXIT_TASK.is_executable */
T1 T308f10(T0* C)
{
	T1 R = 0;
	R = (T450f6(GE_void(((T308*)(C))->a1)));
	return R;
}

/* GEANT_EXIT_COMMAND.is_executable */
T1 T450f6(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* GEANT_OUTOFDATE_TASK.is_executable */
T1 T306f15(T0* C)
{
	T1 R = 0;
	R = (T447f11(GE_void(((T306*)(C))->a1)));
	return R;
}

/* GEANT_OUTOFDATE_COMMAND.is_executable */
T1 T447f11(T0* C)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = (T447f12(C));
	t2 = (T447f13(C));
	R = ((T1)((t1)^(t2)));
	return R;
}

/* GEANT_OUTOFDATE_COMMAND.is_fileset_executable */
T1 T447f13(T0* C)
{
	T1 t1;
	T1 R = 0;
	R = ((((T447*)(C))->a3)==(EIF_VOID));
	if (R) {
		R = ((((T447*)(C))->a4)==(EIF_VOID));
	} else {
		R = EIF_FALSE;
	}
	if (R) {
		t1 = ((((T447*)(C))->a8)!=(EIF_VOID));
	} else {
		t1 = EIF_FALSE;
	}
	if (t1) {
		R = (T390f19(GE_void(((T447*)(C))->a8)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_XSLT_TASK.is_executable */
T1 T304f29(T0* C)
{
	T1 R = 0;
	R = (T443f17(GE_void(((T304*)(C))->a1)));
	return R;
}

/* GEANT_XSLT_COMMAND.is_executable */
T1 T443f17(T0* C)
{
	T1 t1;
	T6 t2;
	T1 t3;
	T1 R = 0;
	t1 = ((((T443*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T443*)(C))->a4)))->id==17)?((T17*)(((T443*)(C))->a4))->a2:((T205*)(((T443*)(C))->a4))->a1));
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		t3 = ((((T443*)(C))->a5)!=(EIF_VOID));
		if (t3) {
			t2 = (((((T0*)(GE_void(((T443*)(C))->a5)))->id==17)?((T17*)(((T443*)(C))->a5))->a2:((T205*)(((T443*)(C))->a5))->a1));
			t1 = (T6f1(&t2, (T6)(GE_int32(0))));
		} else {
			t1 = EIF_FALSE;
		}
	}
	if (t1) {
		t1 = ((((T443*)(C))->a7)!=(EIF_VOID));
		if (t1) {
			t2 = (((((T0*)(GE_void(((T443*)(C))->a7)))->id==17)?((T17*)(((T443*)(C))->a7))->a2:((T205*)(((T443*)(C))->a7))->a1));
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
T1 T302f11(T0* C)
{
	T1 R = 0;
	R = (T439f7(GE_void(((T302*)(C))->a1)));
	return R;
}

/* GEANT_SETENV_COMMAND.is_executable */
T1 T439f7(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T439*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T439*)(C))->a3)))->id==17)?((T17*)(((T439*)(C))->a3))->a2:((T205*)(((T439*)(C))->a3))->a1));
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		R = ((((T439*)(C))->a4)!=(EIF_VOID));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_MOVE_TASK.is_executable */
T1 T300f13(T0* C)
{
	T1 R = 0;
	R = (T436f9(GE_void(((T300*)(C))->a1)));
	return R;
}

/* GEANT_MOVE_COMMAND.is_executable */
T1 T436f9(T0* C)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = (T436f10(C));
	if (t1) {
		t2 = (T436f11(C));
		t1 = ((T1)(!(t2)));
	}
	if (t1) {
		t2 = (T436f12(C));
		t1 = ((T1)(!(t2)));
	}
	if (!(t1)) {
		t2 = (T436f10(C));
		t2 = ((T1)(!(t2)));
		if (t2) {
			t2 = (T436f11(C));
		}
		if (t2) {
			t2 = (T436f12(C));
			t1 = ((T1)(!(t2)));
		} else {
			t1 = EIF_FALSE;
		}
	}
	if (!(t1)) {
		t1 = (T436f10(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t2 = (T436f11(C));
			t1 = ((T1)(!(t2)));
		}
		if (t1) {
			R = (T436f12(C));
		} else {
			R = EIF_FALSE;
		}
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* GEANT_MOVE_COMMAND.is_fileset_to_directory_executable */
T1 T436f12(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T436*)(C))->a6)!=(EIF_VOID));
	if (t1) {
		t1 = ((((T436*)(C))->a5)!=(EIF_VOID));
	}
	if (t1) {
		t2 = (((((T0*)(GE_void(((T436*)(C))->a5)))->id==17)?((T17*)(((T436*)(C))->a5))->a2:((T205*)(((T436*)(C))->a5))->a1));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_COPY_TASK.is_executable */
T1 T298f19(T0* C)
{
	T1 R = 0;
	R = (T433f10(GE_void(((T298*)(C))->a1)));
	return R;
}

/* GEANT_COPY_COMMAND.is_executable */
T1 T433f10(T0* C)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	T0* t5;
	T1 R = 0;
	t1 = (T433f11(C));
	t2 = (T433f12(C));
	t3 = (T433f13(C));
	t4 = (T433f14(C));
	t5 = GE_ma244((T6)3,(T6)3,
(int)(t2),
(int)(t3),
(int)(t4));
	R = (T563f1(GE_void(t1), t5));
	return R;
}

/* GEANT_COPY_COMMAND.is_fileset_to_directory_executable */
T1 T433f14(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T433*)(C))->a7)!=(EIF_VOID));
	if (t1) {
		t1 = ((((T433*)(C))->a5)!=(EIF_VOID));
	}
	if (t1) {
		t2 = (((((T0*)(GE_void(((T433*)(C))->a5)))->id==17)?((T17*)(((T433*)(C))->a5))->a2:((T205*)(((T433*)(C))->a5))->a1));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_COPY_COMMAND.boolean_ */
T0* T433f11(T0* C)
{
	T0* R = 0;
	if (ge123os5418) {
		return ge123ov5418;
	} else {
		ge123os5418 = '\1';
		ge123ov5418 = R;
	}
	R = T563c2();
	ge123ov5418 = R;
	return R;
}

/* GEANT_DELETE_TASK.is_executable */
T1 T296f13(T0* C)
{
	T1 R = 0;
	R = (T429f9(GE_void(((T296*)(C))->a1)));
	return R;
}

/* GEANT_DELETE_COMMAND.is_executable */
T1 T429f9(T0* C)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	T0* t5;
	T1 R = 0;
	t1 = (T429f10(C));
	t2 = (T429f11(C));
	t3 = (T429f12(C));
	t4 = (T429f13(C));
	if (!(t4)) {
		t4 = (T429f14(C));
	}
	t5 = GE_ma244((T6)3,(T6)3,
(int)(t2),
(int)(t3),
(int)(t4));
	R = (T563f1(GE_void(t1), t5));
	return R;
}

/* GEANT_DELETE_COMMAND.boolean_ */
T0* T429f10(T0* C)
{
	T0* R = 0;
	if (ge123os5418) {
		return ge123ov5418;
	} else {
		ge123os5418 = '\1';
		ge123ov5418 = R;
	}
	R = T563c2();
	ge123ov5418 = R;
	return R;
}

/* GEANT_MKDIR_TASK.is_executable */
T1 T294f6(T0* C)
{
	T1 R = 0;
	R = (T425f10(GE_void(((T294*)(C))->a1)));
	return R;
}

/* GEANT_MKDIR_COMMAND.is_executable */
T1 T425f10(T0* C)
{
	T1 t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T0* l1 = 0;
	l1 = T561c2(EIF_TRUE);
	t1 = (T386f5(GE_void(((T425*)(C))->a1)));
	T425f17(C, t1, GE_ms8("  [mkdir] error: \'directory\' is not defined", 43), l1);
	t1 = (((T561*)(GE_void(l1)))->a1);
	if (t1) {
		t2 = (T386f6(GE_void(((T425*)(C))->a1)));
		t3 = (((((T0*)(GE_void(t2)))->id==17)?T17f32(t2):T205f53(t2)));
		t1 = ((T1)(!(t3)));
	}
	T425f17(C, t1, GE_ms8("  [mkdir] error: \'directory\' is empty", 37), l1);
	R = (((T561*)(GE_void(l1)))->a1);
	return R;
}

/* GEANT_MKDIR_COMMAND.validate_condition */
void T425f17(T0* C, T1 a1, T0* a2, T0* a3)
{
	T1 t1;
	T0* t2;
	t1 = (((T561*)(GE_void(a3)))->a1);
	if (t1) {
		t1 = ((T1)(!(a1)));
		if (t1) {
			T561f3(GE_void(a3), EIF_FALSE);
			t2 = (T425f12(C));
			T71f28(GE_void(t2), a2);
		}
	}
}

/* GEANT_MKDIR_COMMAND.validation_messages */
T0* T425f12(T0* C)
{
	T0* R = 0;
	if (ge10os1757) {
		return ge10ov1757;
	} else {
		ge10os1757 = '\1';
		ge10ov1757 = R;
	}
	R = T71c24((T6)(GE_int32(5)));
	ge10ov1757 = R;
	return R;
}

/* GEANT_ECHO_TASK.is_executable */
T1 T292f6(T0* C)
{
	T1 R = 0;
	R = (T422f9(GE_void(((T292*)(C))->a1)));
	return R;
}

/* GEANT_ECHO_COMMAND.is_executable */
T1 T422f9(T0* C)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T0* l1 = 0;
	l1 = T561c2(EIF_TRUE);
	t1 = (T386f5(GE_void(((T422*)(C))->a1)));
	T422f17(C, t1, GE_ms8("  [echo] error: \'message\' is not defined", 40), l1);
	t1 = (((T561*)(GE_void(l1)))->a1);
	if (t1) {
		t1 = (T386f5(GE_void(((T422*)(C))->a2)));
		if (t1) {
			t2 = (T386f6(GE_void(((T422*)(C))->a2)));
			t1 = (((((T0*)(GE_void(t2)))->id==17)?T17f32(t2):T205f53(t2)));
			t1 = ((T1)(!(t1)));
			T422f17(C, t1, GE_ms8("  [echo] error: \'to_file\' may not be empty", 42), l1);
		}
	}
	R = (((T561*)(GE_void(l1)))->a1);
	return R;
}

/* GEANT_ECHO_COMMAND.validate_condition */
void T422f17(T0* C, T1 a1, T0* a2, T0* a3)
{
	T1 t1;
	T0* t2;
	t1 = (((T561*)(GE_void(a3)))->a1);
	if (t1) {
		t1 = ((T1)(!(a1)));
		if (t1) {
			T561f3(GE_void(a3), EIF_FALSE);
			t2 = (T422f11(C));
			T71f28(GE_void(t2), a2);
		}
	}
}

/* GEANT_ECHO_COMMAND.validation_messages */
T0* T422f11(T0* C)
{
	T0* R = 0;
	if (ge10os1757) {
		return ge10ov1757;
	} else {
		ge10os1757 = '\1';
		ge10ov1757 = R;
	}
	R = T71c24((T6)(GE_int32(5)));
	ge10ov1757 = R;
	return R;
}

/* GEANT_GEANT_TASK.is_executable */
T1 T290f25(T0* C)
{
	T1 R = 0;
	R = (T418f13(GE_void(((T290*)(C))->a1)));
	return R;
}

/* GEANT_GEANT_COMMAND.is_executable */
T1 T418f13(T0* C)
{
	T1 t1;
	T1 R = 0;
	t1 = (T418f14(C));
	if (!(t1)) {
		R = (T418f15(C));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* GEANT_GEANT_COMMAND.is_target_executable */
T1 T418f15(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T418*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T418*)(C))->a4)))->id==17)?((T17*)(((T418*)(C))->a4))->a2:((T205*)(((T418*)(C))->a4))->a1));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GETEST_TASK.is_executable */
T1 T288f27(T0* C)
{
	T1 R = 0;
	R = (T415f16(GE_void(((T288*)(C))->a1)));
	return R;
}

/* GEANT_GETEST_COMMAND.is_executable */
T1 T415f16(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T415*)(C))->a8)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T415*)(C))->a8)))->id==17)?((T17*)(((T415*)(C))->a8))->a2:((T205*)(((T415*)(C))->a8))->a1));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEPP_TASK.is_executable */
T1 T286f22(T0* C)
{
	T1 R = 0;
	R = (T412f12(GE_void(((T286*)(C))->a1)));
	return R;
}

/* GEANT_GEPP_COMMAND.is_executable */
T1 T412f12(T0* C)
{
	T1 t1;
	T1 t2;
	T1 R = 0;
	t1 = (T412f13(C));
	t2 = (T412f14(C));
	R = ((T1)((t1)^(t2)));
	return R;
}

/* GEANT_GEPP_COMMAND.is_fileset_executable */
T1 T412f14(T0* C)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	t1 = ((((T412*)(C))->a9)!=(EIF_VOID));
	if (t1) {
		t2 = (((T390*)(GE_void(((T412*)(C))->a9)))->a18);
		R = ((t2)!=(EIF_VOID));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEYACC_TASK.is_executable */
T1 T284f22(T0* C)
{
	T1 R = 0;
	R = (T409f13(GE_void(((T284*)(C))->a1)));
	return R;
}

/* GEANT_GEYACC_COMMAND.is_executable */
T1 T409f13(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T409*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T409*)(C))->a4)))->id==17)?((T17*)(((T409*)(C))->a4))->a2:((T205*)(((T409*)(C))->a4))->a1));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GELEX_TASK.is_executable */
T1 T282f25(T0* C)
{
	T1 R = 0;
	R = (T406f16(GE_void(((T282*)(C))->a1)));
	return R;
}

/* GEANT_GELEX_COMMAND.is_executable */
T1 T406f16(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T406*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T406*)(C))->a4)))->id==17)?((T17*)(((T406*)(C))->a4))->a2:((T205*)(((T406*)(C))->a4))->a1));
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		if (((T406*)(C))->a9) {
			R = ((T1)(!(((T406*)(C))->a7)));
		} else {
			R = EIF_TRUE;
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEXACE_TASK.is_executable */
T1 T280f23(T0* C)
{
	T1 R = 0;
	R = (T403f13(GE_void(((T280*)(C))->a1)));
	return R;
}

/* GEANT_GEXACE_COMMAND.is_executable */
T1 T403f13(T0* C)
{
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	T0* t5;
	T1 R = 0;
	t1 = (T403f14(C));
	t2 = (T403f15(C));
	t3 = (T403f16(C));
	t4 = (T403f17(C));
	t5 = GE_ma244((T6)3,(T6)3,
(int)(t2),
(int)(t3),
(int)(t4));
	R = (T563f1(GE_void(t1), t5));
	return R;
}

/* GEANT_GEXACE_COMMAND.boolean_ */
T0* T403f14(T0* C)
{
	T0* R = 0;
	if (ge123os5418) {
		return ge123ov5418;
	} else {
		ge123os5418 = '\1';
		ge123ov5418 = R;
	}
	R = T563c2();
	ge123ov5418 = R;
	return R;
}

/* GEANT_UNSET_TASK.is_executable */
T1 T278f10(T0* C)
{
	T1 R = 0;
	R = (T399f6(GE_void(((T278*)(C))->a1)));
	return R;
}

/* GEANT_UNSET_COMMAND.is_executable */
T1 T399f6(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T399*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T399*)(C))->a3)))->id==17)?((T17*)(((T399*)(C))->a3))->a2:((T205*)(((T399*)(C))->a3))->a1));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_SET_TASK.is_executable */
T1 T276f11(T0* C)
{
	T1 R = 0;
	R = (T396f7(GE_void(((T276*)(C))->a1)));
	return R;
}

/* GEANT_SET_COMMAND.is_executable */
T1 T396f7(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T396*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T396*)(C))->a3)))->id==17)?((T17*)(((T396*)(C))->a3))->a2:((T205*)(((T396*)(C))->a3))->a1));
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		R = ((((T396*)(C))->a4)!=(EIF_VOID));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_LCC_TASK.is_executable */
T1 T274f11(T0* C)
{
	T1 R = 0;
	R = (T393f7(GE_void(((T274*)(C))->a1)));
	return R;
}

/* GEANT_LCC_COMMAND.is_executable */
T1 T393f7(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T393*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T393*)(C))->a3)))->id==17)?((T17*)(((T393*)(C))->a3))->a2:((T205*)(((T393*)(C))->a3))->a1));
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		t1 = ((((T393*)(C))->a4)!=(EIF_VOID));
		if (t1) {
			t2 = (((((T0*)(GE_void(((T393*)(C))->a4)))->id==17)?((T17*)(((T393*)(C))->a4))->a2:((T205*)(((T393*)(C))->a4))->a1));
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
T1 T272f7(T0* C)
{
	T1 R = 0;
	R = (T385f9(GE_void(((T272*)(C))->a1)));
	return R;
}

/* GEANT_EXEC_COMMAND.is_executable */
T1 T385f9(T0* C)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	T0* l1 = 0;
	l1 = T561c2(EIF_TRUE);
	t1 = (T386f5(GE_void(((T385*)(C))->a1)));
	T385f17(C, t1, GE_ms8("  [echo] error: \'executable\' is not defined", 43), l1);
	t1 = (((T561*)(GE_void(l1)))->a1);
	if (t1) {
		t2 = (T386f6(GE_void(((T385*)(C))->a1)));
		t1 = (((((T0*)(GE_void(t2)))->id==17)?T17f32(t2):T205f53(t2)));
		t1 = ((T1)(!(t1)));
		T385f17(C, t1, GE_ms8("  [echo] error: \'executable\' is empty", 37), l1);
	}
	t1 = (((T561*)(GE_void(l1)))->a1);
	if (t1) {
		t1 = ((((T385*)(C))->a6)==(EIF_VOID));
		if (t1) {
			((T385*)(C))->a8 = EIF_TRUE;
			t1 = (T386f5(GE_void(((T385*)(C))->a2)));
			if (t1) {
				t2 = (T386f6(GE_void(((T385*)(C))->a2)));
				t1 = (((((T0*)(GE_void(t2)))->id==17)?T17f32(t2):T205f53(t2)));
				t1 = ((T1)(!(t1)));
				T385f17(C, t1, GE_ms8("  [echo] error: \'exit_code_variable\' may not be empty", 53), l1);
			}
		} else {
			((T385*)(C))->a8 = EIF_FALSE;
			t1 = (T386f5(GE_void(((T385*)(C))->a2)));
			t1 = ((T1)(!(t1)));
			T385f17(C, t1, GE_ms8("  [echo] error: \'exit_code_variable\' may not be defined together with \'fileset\'", 79), l1);
		}
	}
	R = (((T561*)(GE_void(l1)))->a1);
	return R;
}

/* GEANT_EXEC_COMMAND.validate_condition */
void T385f17(T0* C, T1 a1, T0* a2, T0* a3)
{
	T1 t1;
	T0* t2;
	t1 = (((T561*)(GE_void(a3)))->a1);
	if (t1) {
		t1 = ((T1)(!(a1)));
		if (t1) {
			T561f3(GE_void(a3), EIF_FALSE);
			t2 = (T385f12(C));
			T71f28(GE_void(t2), a2);
		}
	}
}

/* GEANT_EXEC_COMMAND.validation_messages */
T0* T385f12(T0* C)
{
	T0* R = 0;
	if (ge10os1757) {
		return ge10ov1757;
	} else {
		ge10os1757 = '\1';
		ge10ov1757 = R;
	}
	R = T71c24((T6)(GE_int32(5)));
	ge10ov1757 = R;
	return R;
}

/* GEANT_ISE_TASK.is_executable */
T1 T270f22(T0* C)
{
	T1 R = 0;
	R = (T381f12(GE_void(((T270*)(C))->a1)));
	return R;
}

/* GEANT_ISE_COMMAND.is_executable */
T1 T381f12(T0* C)
{
	T1 t1;
	T1 t2;
	T6 t3;
	T1 R = 0;
	t1 = (T381f13(C));
	t2 = (T381f14(C));
	R = ((T1)((t1)^(t2)));
	if (R) {
		t1 = ((((T381*)(C))->a9)==(EIF_VOID));
		if (!(t1)) {
			t3 = (((((T0*)(GE_void(((T381*)(C))->a9)))->id==17)?((T17*)(((T381*)(C))->a9))->a2:((T205*)(((T381*)(C))->a9))->a1));
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
T1 T381f14(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = ((((T381*)(C))->a5)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T381*)(C))->a5)))->id==17)?((T17*)(((T381*)(C))->a5))->a2:((T205*)(((T381*)(C))->a5))->a1));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEC_TASK.is_executable */
T1 T263f25(T0* C)
{
	T1 R = 0;
	R = (T377f15(GE_void(((T263*)(C))->a1)));
	return R;
}

/* GEANT_GEC_COMMAND.is_executable */
T1 T377f15(T0* C)
{
	T1 t1;
	T6 t2;
	T1 R = 0;
	t1 = (T377f16(C));
	if (!(t1)) {
		R = (T377f17(C));
	} else {
		R = EIF_TRUE;
	}
	if (R) {
		t1 = ((((T377*)(C))->a12)==(EIF_VOID));
		if (!(t1)) {
			t2 = (((((T0*)(GE_void(((T377*)(C))->a12)))->id==17)?((T17*)(((T377*)(C))->a12))->a2:((T205*)(((T377*)(C))->a12))->a1));
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
T1 T316f19(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T316f17(C));
	t2 = (((T22*)(GE_void(((T316*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T316f22(C));
	t3 = (T316f10(C, t1));
	if (t3) {
		t1 = (T316f22(C));
		t1 = (T99f8(GE_void(((T316*)(C))->a2), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T316f17(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T316*)(C))->a3), t1);
	}
	t1 = (T316f23(C));
	t3 = (T316f10(C, t1));
	if (t3) {
		t1 = (T316f23(C));
		t1 = (T99f8(GE_void(((T316*)(C))->a2), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T316f17(C));
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

/* GEANT_REPLACE_TASK.unless_attribute_name */
T0* T316f23(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_REPLACE_TASK.if_attribute_name */
T0* T316f22(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_INPUT_TASK.is_enabled */
T1 T314f21(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T314f19(C));
	t2 = (((T22*)(GE_void(((T314*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T314f24(C));
	t3 = (T314f11(C, t1));
	if (t3) {
		t1 = (T314f24(C));
		t1 = (T99f8(GE_void(((T314*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T314f19(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T314*)(C))->a3), t1);
	}
	t1 = (T314f25(C));
	t3 = (T314f11(C, t1));
	if (t3) {
		t1 = (T314f25(C));
		t1 = (T99f8(GE_void(((T314*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T314f19(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T314*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_INPUT_TASK.unless_attribute_name */
T0* T314f25(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_INPUT_TASK.if_attribute_name */
T0* T314f24(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_AVAILABLE_TASK.is_enabled */
T1 T312f7(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T312f10(C));
	t2 = (((T22*)(GE_void(((T312*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T312f11(C));
	t3 = (T312f12(C, t1));
	if (t3) {
		t1 = (T312f11(C));
		t1 = (T99f8(GE_void(((T312*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T312f10(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T312*)(C))->a3), t1);
	}
	t1 = (T312f13(C));
	t3 = (T312f12(C, t1));
	if (t3) {
		t1 = (T312f13(C));
		t1 = (T99f8(GE_void(((T312*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T312f10(C));
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

/* GEANT_AVAILABLE_TASK.unless_attribute_name */
T0* T312f13(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_AVAILABLE_TASK.has_attribute */
T1 T312f12(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T99f21(GE_void(((T312*)(C))->a4), a1));
	return R;
}

/* GEANT_AVAILABLE_TASK.if_attribute_name */
T0* T312f11(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_PRECURSOR_TASK.is_enabled */
T1 T310f18(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T310f16(C));
	t2 = (((T22*)(GE_void(((T310*)(C))->a2)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T310f21(C));
	t3 = (T310f9(C, t1));
	if (t3) {
		t1 = (T310f21(C));
		t1 = (T99f8(GE_void(((T310*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T310f16(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T310*)(C))->a2), t1);
	}
	t1 = (T310f22(C));
	t3 = (T310f9(C, t1));
	if (t3) {
		t1 = (T310f22(C));
		t1 = (T99f8(GE_void(((T310*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T310f16(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T310*)(C))->a2), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_PRECURSOR_TASK.unless_attribute_name */
T0* T310f22(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_PRECURSOR_TASK.if_attribute_name */
T0* T310f21(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_EXIT_TASK.is_enabled */
T1 T308f11(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T308f9(C));
	t2 = (((T22*)(GE_void(((T308*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T308f14(C));
	t3 = (T308f5(C, t1));
	if (t3) {
		t1 = (T308f14(C));
		t1 = (T99f8(GE_void(((T308*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T308f9(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T308*)(C))->a3), t1);
	}
	t1 = (T308f15(C));
	t3 = (T308f5(C, t1));
	if (t3) {
		t1 = (T308f15(C));
		t1 = (T99f8(GE_void(((T308*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T308f9(C));
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

/* GEANT_EXIT_TASK.unless_attribute_name */
T0* T308f15(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_EXIT_TASK.if_attribute_name */
T0* T308f14(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_OUTOFDATE_TASK.is_enabled */
T1 T306f16(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T306f14(C));
	t2 = (((T22*)(GE_void(((T306*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T306f19(C));
	t3 = (T306f9(C, t1));
	if (t3) {
		t1 = (T306f19(C));
		t1 = (T99f8(GE_void(((T306*)(C))->a2), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T306f14(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T306*)(C))->a3), t1);
	}
	t1 = (T306f20(C));
	t3 = (T306f9(C, t1));
	if (t3) {
		t1 = (T306f20(C));
		t1 = (T99f8(GE_void(((T306*)(C))->a2), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T306f14(C));
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

/* GEANT_OUTOFDATE_TASK.unless_attribute_name */
T0* T306f20(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_OUTOFDATE_TASK.if_attribute_name */
T0* T306f19(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_XSLT_TASK.is_enabled */
T1 T304f30(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T304f28(C));
	t2 = (((T22*)(GE_void(((T304*)(C))->a2)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T304f33(C));
	t3 = (T304f18(C, t1));
	if (t3) {
		t1 = (T304f33(C));
		t1 = (T99f8(GE_void(((T304*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T304f28(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T304*)(C))->a2), t1);
	}
	t1 = (T304f34(C));
	t3 = (T304f18(C, t1));
	if (t3) {
		t1 = (T304f34(C));
		t1 = (T99f8(GE_void(((T304*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T304f28(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T304*)(C))->a2), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_XSLT_TASK.unless_attribute_name */
T0* T304f34(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_XSLT_TASK.if_attribute_name */
T0* T304f33(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_SETENV_TASK.is_enabled */
T1 T302f12(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T302f10(C));
	t2 = (((T22*)(GE_void(((T302*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T302f15(C));
	t3 = (T302f6(C, t1));
	if (t3) {
		t1 = (T302f15(C));
		t1 = (T99f8(GE_void(((T302*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T302f10(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T302*)(C))->a3), t1);
	}
	t1 = (T302f16(C));
	t3 = (T302f6(C, t1));
	if (t3) {
		t1 = (T302f16(C));
		t1 = (T99f8(GE_void(((T302*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T302f10(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T302*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_SETENV_TASK.unless_attribute_name */
T0* T302f16(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_SETENV_TASK.if_attribute_name */
T0* T302f15(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_MOVE_TASK.is_enabled */
T1 T300f14(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T300f12(C));
	t2 = (((T22*)(GE_void(((T300*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T300f17(C));
	t3 = (T300f7(C, t1));
	if (t3) {
		t1 = (T300f17(C));
		t1 = (T99f8(GE_void(((T300*)(C))->a2), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T300f12(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T300*)(C))->a3), t1);
	}
	t1 = (T300f18(C));
	t3 = (T300f7(C, t1));
	if (t3) {
		t1 = (T300f18(C));
		t1 = (T99f8(GE_void(((T300*)(C))->a2), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T300f12(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T300*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_MOVE_TASK.unless_attribute_name */
T0* T300f18(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_MOVE_TASK.if_attribute_name */
T0* T300f17(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_COPY_TASK.is_enabled */
T1 T298f20(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T298f18(C));
	t2 = (((T22*)(GE_void(((T298*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T298f23(C));
	t3 = (T298f9(C, t1));
	if (t3) {
		t1 = (T298f23(C));
		t1 = (T99f8(GE_void(((T298*)(C))->a2), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T298f18(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T298*)(C))->a3), t1);
	}
	t1 = (T298f24(C));
	t3 = (T298f9(C, t1));
	if (t3) {
		t1 = (T298f24(C));
		t1 = (T99f8(GE_void(((T298*)(C))->a2), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T298f18(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T298*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_COPY_TASK.unless_attribute_name */
T0* T298f24(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_COPY_TASK.if_attribute_name */
T0* T298f23(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_DELETE_TASK.is_enabled */
T1 T296f14(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T296f12(C));
	t2 = (((T22*)(GE_void(((T296*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T296f17(C));
	t3 = (T296f6(C, t1));
	if (t3) {
		t1 = (T296f17(C));
		t1 = (T99f8(GE_void(((T296*)(C))->a2), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T296f12(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T296*)(C))->a3), t1);
	}
	t1 = (T296f18(C));
	t3 = (T296f6(C, t1));
	if (t3) {
		t1 = (T296f18(C));
		t1 = (T99f8(GE_void(((T296*)(C))->a2), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T296f12(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T296*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_DELETE_TASK.unless_attribute_name */
T0* T296f18(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_DELETE_TASK.if_attribute_name */
T0* T296f17(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_MKDIR_TASK.is_enabled */
T1 T294f7(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T294f10(C));
	t2 = (((T22*)(GE_void(((T294*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T294f11(C));
	t3 = (T294f12(C, t1));
	if (t3) {
		t1 = (T294f11(C));
		t1 = (T99f8(GE_void(((T294*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T294f10(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T294*)(C))->a3), t1);
	}
	t1 = (T294f13(C));
	t3 = (T294f12(C, t1));
	if (t3) {
		t1 = (T294f13(C));
		t1 = (T99f8(GE_void(((T294*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T294f10(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T294*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_MKDIR_TASK.unless_attribute_name */
T0* T294f13(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_MKDIR_TASK.has_attribute */
T1 T294f12(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T99f21(GE_void(((T294*)(C))->a4), a1));
	return R;
}

/* GEANT_MKDIR_TASK.if_attribute_name */
T0* T294f11(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_ECHO_TASK.is_enabled */
T1 T292f7(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T292f10(C));
	t2 = (((T22*)(GE_void(((T292*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T292f11(C));
	t3 = (T292f12(C, t1));
	if (t3) {
		t1 = (T292f11(C));
		t1 = (T99f8(GE_void(((T292*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T292f10(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T292*)(C))->a3), t1);
	}
	t1 = (T292f13(C));
	t3 = (T292f12(C, t1));
	if (t3) {
		t1 = (T292f13(C));
		t1 = (T99f8(GE_void(((T292*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T292f10(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T292*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_ECHO_TASK.unless_attribute_name */
T0* T292f13(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_ECHO_TASK.has_attribute */
T1 T292f12(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T99f21(GE_void(((T292*)(C))->a4), a1));
	return R;
}

/* GEANT_ECHO_TASK.if_attribute_name */
T0* T292f11(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_GEANT_TASK.is_enabled */
T1 T290f26(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T290f24(C));
	t2 = (((T22*)(GE_void(((T290*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T290f29(C));
	t3 = (T290f8(C, t1));
	if (t3) {
		t1 = (T290f29(C));
		t1 = (T99f8(GE_void(((T290*)(C))->a2), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T290f24(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T290*)(C))->a3), t1);
	}
	t1 = (T290f30(C));
	t3 = (T290f8(C, t1));
	if (t3) {
		t1 = (T290f30(C));
		t1 = (T99f8(GE_void(((T290*)(C))->a2), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T290f24(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T290*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEANT_TASK.unless_attribute_name */
T0* T290f30(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_GEANT_TASK.if_attribute_name */
T0* T290f29(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_GETEST_TASK.is_enabled */
T1 T288f28(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T288f24(C));
	t2 = (((T22*)(GE_void(((T288*)(C))->a2)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T288f31(C));
	t3 = (T288f17(C, t1));
	if (t3) {
		t1 = (T288f31(C));
		t1 = (T99f8(GE_void(((T288*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T288f24(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T288*)(C))->a2), t1);
	}
	t1 = (T288f32(C));
	t3 = (T288f17(C, t1));
	if (t3) {
		t1 = (T288f32(C));
		t1 = (T99f8(GE_void(((T288*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T288f24(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T288*)(C))->a2), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GETEST_TASK.unless_attribute_name */
T0* T288f32(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_GETEST_TASK.if_attribute_name */
T0* T288f31(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_GEPP_TASK.is_enabled */
T1 T286f23(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T286f21(C));
	t2 = (((T22*)(GE_void(((T286*)(C))->a2)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T286f26(C));
	t3 = (T286f10(C, t1));
	if (t3) {
		t1 = (T286f26(C));
		t1 = (T99f8(GE_void(((T286*)(C))->a3), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T286f21(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T286*)(C))->a2), t1);
	}
	t1 = (T286f27(C));
	t3 = (T286f10(C, t1));
	if (t3) {
		t1 = (T286f27(C));
		t1 = (T99f8(GE_void(((T286*)(C))->a3), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T286f21(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T286*)(C))->a2), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEPP_TASK.unless_attribute_name */
T0* T286f27(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_GEPP_TASK.if_attribute_name */
T0* T286f26(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_GEYACC_TASK.is_enabled */
T1 T284f23(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T284f17(C));
	t2 = (((T22*)(GE_void(((T284*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T284f26(C));
	t3 = (T284f13(C, t1));
	if (t3) {
		t1 = (T284f26(C));
		t1 = (T99f8(GE_void(((T284*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T284f17(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T284*)(C))->a3), t1);
	}
	t1 = (T284f27(C));
	t3 = (T284f13(C, t1));
	if (t3) {
		t1 = (T284f27(C));
		t1 = (T99f8(GE_void(((T284*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T284f17(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T284*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEYACC_TASK.unless_attribute_name */
T0* T284f27(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_GEYACC_TASK.if_attribute_name */
T0* T284f26(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_GELEX_TASK.is_enabled */
T1 T282f26(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T282f24(C));
	t2 = (((T22*)(GE_void(((T282*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T282f29(C));
	t3 = (T282f16(C, t1));
	if (t3) {
		t1 = (T282f29(C));
		t1 = (T99f8(GE_void(((T282*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T282f24(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T282*)(C))->a3), t1);
	}
	t1 = (T282f30(C));
	t3 = (T282f16(C, t1));
	if (t3) {
		t1 = (T282f30(C));
		t1 = (T99f8(GE_void(((T282*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T282f24(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T282*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GELEX_TASK.unless_attribute_name */
T0* T282f30(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_GELEX_TASK.if_attribute_name */
T0* T282f29(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_GEXACE_TASK.is_enabled */
T1 T280f24(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T280f18(C));
	t2 = (((T22*)(GE_void(((T280*)(C))->a2)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T280f27(C));
	t3 = (T280f14(C, t1));
	if (t3) {
		t1 = (T280f27(C));
		t1 = (T99f8(GE_void(((T280*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T280f18(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T280*)(C))->a2), t1);
	}
	t1 = (T280f28(C));
	t3 = (T280f14(C, t1));
	if (t3) {
		t1 = (T280f28(C));
		t1 = (T99f8(GE_void(((T280*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T280f18(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T280*)(C))->a2), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEXACE_TASK.unless_attribute_name */
T0* T280f28(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_GEXACE_TASK.if_attribute_name */
T0* T280f27(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_UNSET_TASK.is_enabled */
T1 T278f11(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T278f9(C));
	t2 = (((T22*)(GE_void(((T278*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T278f14(C));
	t3 = (T278f5(C, t1));
	if (t3) {
		t1 = (T278f14(C));
		t1 = (T99f8(GE_void(((T278*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T278f9(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T278*)(C))->a3), t1);
	}
	t1 = (T278f15(C));
	t3 = (T278f5(C, t1));
	if (t3) {
		t1 = (T278f15(C));
		t1 = (T99f8(GE_void(((T278*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T278f9(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T278*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_UNSET_TASK.unless_attribute_name */
T0* T278f15(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_UNSET_TASK.if_attribute_name */
T0* T278f14(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_SET_TASK.is_enabled */
T1 T276f12(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T276f10(C));
	t2 = (((T22*)(GE_void(((T276*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T276f15(C));
	t3 = (T276f6(C, t1));
	if (t3) {
		t1 = (T276f15(C));
		t1 = (T99f8(GE_void(((T276*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T276f10(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T276*)(C))->a3), t1);
	}
	t1 = (T276f16(C));
	t3 = (T276f6(C, t1));
	if (t3) {
		t1 = (T276f16(C));
		t1 = (T99f8(GE_void(((T276*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T276f10(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T276*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_SET_TASK.unless_attribute_name */
T0* T276f16(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_SET_TASK.if_attribute_name */
T0* T276f15(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_LCC_TASK.is_enabled */
T1 T274f12(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T274f10(C));
	t2 = (((T22*)(GE_void(((T274*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T274f15(C));
	t3 = (T274f6(C, t1));
	if (t3) {
		t1 = (T274f15(C));
		t1 = (T99f8(GE_void(((T274*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T274f10(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T274*)(C))->a3), t1);
	}
	t1 = (T274f16(C));
	t3 = (T274f6(C, t1));
	if (t3) {
		t1 = (T274f16(C));
		t1 = (T99f8(GE_void(((T274*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T274f10(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T274*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_LCC_TASK.unless_attribute_name */
T0* T274f16(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_LCC_TASK.if_attribute_name */
T0* T274f15(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_EXEC_TASK.is_enabled */
T1 T272f8(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T272f11(C));
	t2 = (((T22*)(GE_void(((T272*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T272f12(C));
	t3 = (T272f13(C, t1));
	if (t3) {
		t1 = (T272f12(C));
		t1 = (T99f8(GE_void(((T272*)(C))->a2), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T272f11(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T272*)(C))->a3), t1);
	}
	t1 = (T272f14(C));
	t3 = (T272f13(C, t1));
	if (t3) {
		t1 = (T272f14(C));
		t1 = (T99f8(GE_void(((T272*)(C))->a2), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T272f11(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T272*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_EXEC_TASK.unless_attribute_name */
T0* T272f14(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_EXEC_TASK.has_attribute */
T1 T272f13(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T99f21(GE_void(((T272*)(C))->a2), a1));
	return R;
}

/* GEANT_EXEC_TASK.if_attribute_name */
T0* T272f12(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_ISE_TASK.is_enabled */
T1 T270f23(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T270f21(C));
	t2 = (((T22*)(GE_void(((T270*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T270f26(C));
	t3 = (T270f13(C, t1));
	if (t3) {
		t1 = (T270f26(C));
		t1 = (T99f8(GE_void(((T270*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T270f21(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T270*)(C))->a3), t1);
	}
	t1 = (T270f27(C));
	t3 = (T270f13(C, t1));
	if (t3) {
		t1 = (T270f27(C));
		t1 = (T99f8(GE_void(((T270*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T270f21(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T270*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_ISE_TASK.unless_attribute_name */
T0* T270f27(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_ISE_TASK.if_attribute_name */
T0* T270f26(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_GEC_TASK.is_enabled */
T1 T263f26(T0* C)
{
	T0* t1;
	T0* t2;
	T1 t3;
	T1 R = 0;
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	t1 = (T263f24(C));
	t2 = (((T22*)(GE_void(((T263*)(C))->a3)))->a15);
	T58f19(GE_void(t1), t2);
	l1 = EIF_TRUE;
	l2 = EIF_FALSE;
	t1 = (T263f29(C));
	t3 = (T263f16(C, t1));
	if (t3) {
		t1 = (T263f29(C));
		t1 = (T99f8(GE_void(((T263*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T263f24(C));
		l1 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l1)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" if: \'", 6),
l3,
GE_ms8("\': ", 3),
t1);
		T22f39(GE_void(((T263*)(C))->a3), t1);
	}
	t1 = (T263f30(C));
	t3 = (T263f16(C, t1));
	if (t3) {
		t1 = (T263f30(C));
		t1 = (T99f8(GE_void(((T263*)(C))->a4), t1));
		l3 = (((T200*)(GE_void(t1)))->a3);
		t1 = (T263f24(C));
		l2 = (T58f8(GE_void(t1), l3));
		t1 = (T1f6((&l2)));
		t1 = GE_ma33((T6)4,(T6)4,
GE_ms8(" unless: \'", 10),
l3,
GE_ms8("\'=", 2),
t1);
		T22f39(GE_void(((T263*)(C))->a3), t1);
	}
	if (l1) {
		R = ((T1)(!(l2)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* GEANT_GEC_TASK.unless_attribute_name */
T0* T263f30(T0* C)
{
	T0* R = 0;
	if (ge86os2373) {
		return ge86ov2373;
	} else {
		ge86os2373 = '\1';
		ge86ov2373 = R;
	}
	R = GE_ms8("unless", 6);
	ge86ov2373 = R;
	return R;
}

/* GEANT_GEC_TASK.if_attribute_name */
T0* T263f29(T0* C)
{
	T0* R = 0;
	if (ge86os2372) {
		return ge86ov2372;
	} else {
		ge86os2372 = '\1';
		ge86ov2372 = R;
	}
	R = GE_ms8("if", 2);
	ge86ov2372 = R;
	return R;
}

/* GEANT_REPLACE_TASK.is_exit_command */
T1 T316f20(T0* C)
{
	T1 R = 0;
	R = (T462f13(GE_void(((T316*)(C))->a1)));
	return R;
}

/* GEANT_REPLACE_COMMAND.is_exit_command */
T1 T462f13(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_INPUT_TASK.is_exit_command */
T1 T314f22(T0* C)
{
	T1 R = 0;
	R = (T459f10(GE_void(((T314*)(C))->a1)));
	return R;
}

/* GEANT_INPUT_COMMAND.is_exit_command */
T1 T459f10(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_AVAILABLE_TASK.is_exit_command */
T1 T312f8(T0* C)
{
	T1 R = 0;
	R = (T456f14(GE_void(((T312*)(C))->a1)));
	return R;
}

/* GEANT_AVAILABLE_COMMAND.is_exit_command */
T1 T456f14(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_PRECURSOR_TASK.is_exit_command */
T1 T310f19(T0* C)
{
	T1 R = 0;
	R = (T453f6(GE_void(((T310*)(C))->a1)));
	return R;
}

/* GEANT_PRECURSOR_COMMAND.is_exit_command */
T1 T453f6(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_EXIT_TASK.is_exit_command */
T1 T308f12(T0* C)
{
	T1 R = 0;
	R = (EIF_TRUE);
	return R;
}

/* GEANT_OUTOFDATE_TASK.is_exit_command */
T1 T306f17(T0* C)
{
	T1 R = 0;
	R = (T447f16(GE_void(((T306*)(C))->a1)));
	return R;
}

/* GEANT_OUTOFDATE_COMMAND.is_exit_command */
T1 T447f16(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_XSLT_TASK.is_exit_command */
T1 T304f31(T0* C)
{
	T1 R = 0;
	R = (T443f18(GE_void(((T304*)(C))->a1)));
	return R;
}

/* GEANT_XSLT_COMMAND.is_exit_command */
T1 T443f18(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_SETENV_TASK.is_exit_command */
T1 T302f13(T0* C)
{
	T1 R = 0;
	R = (T439f6(GE_void(((T302*)(C))->a1)));
	return R;
}

/* GEANT_SETENV_COMMAND.is_exit_command */
T1 T439f6(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_MOVE_TASK.is_exit_command */
T1 T300f15(T0* C)
{
	T1 R = 0;
	R = (T436f8(GE_void(((T300*)(C))->a1)));
	return R;
}

/* GEANT_MOVE_COMMAND.is_exit_command */
T1 T436f8(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_COPY_TASK.is_exit_command */
T1 T298f21(T0* C)
{
	T1 R = 0;
	R = (T433f9(GE_void(((T298*)(C))->a1)));
	return R;
}

/* GEANT_COPY_COMMAND.is_exit_command */
T1 T433f9(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_DELETE_TASK.is_exit_command */
T1 T296f15(T0* C)
{
	T1 R = 0;
	R = (T429f8(GE_void(((T296*)(C))->a1)));
	return R;
}

/* GEANT_DELETE_COMMAND.is_exit_command */
T1 T429f8(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_MKDIR_TASK.is_exit_command */
T1 T294f8(T0* C)
{
	T1 R = 0;
	R = (T425f11(GE_void(((T294*)(C))->a1)));
	return R;
}

/* GEANT_MKDIR_COMMAND.is_exit_command */
T1 T425f11(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_ECHO_TASK.is_exit_command */
T1 T292f8(T0* C)
{
	T1 R = 0;
	R = (T422f10(GE_void(((T292*)(C))->a1)));
	return R;
}

/* GEANT_ECHO_COMMAND.is_exit_command */
T1 T422f10(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_GEANT_TASK.is_exit_command */
T1 T290f27(T0* C)
{
	T1 R = 0;
	R = (T418f12(GE_void(((T290*)(C))->a1)));
	return R;
}

/* GEANT_GEANT_COMMAND.is_exit_command */
T1 T418f12(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_GETEST_TASK.is_exit_command */
T1 T288f29(T0* C)
{
	T1 R = 0;
	R = (T415f15(GE_void(((T288*)(C))->a1)));
	return R;
}

/* GEANT_GETEST_COMMAND.is_exit_command */
T1 T415f15(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_GEPP_TASK.is_exit_command */
T1 T286f24(T0* C)
{
	T1 R = 0;
	R = (T412f11(GE_void(((T286*)(C))->a1)));
	return R;
}

/* GEANT_GEPP_COMMAND.is_exit_command */
T1 T412f11(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_GEYACC_TASK.is_exit_command */
T1 T284f24(T0* C)
{
	T1 R = 0;
	R = (T409f12(GE_void(((T284*)(C))->a1)));
	return R;
}

/* GEANT_GEYACC_COMMAND.is_exit_command */
T1 T409f12(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_GELEX_TASK.is_exit_command */
T1 T282f27(T0* C)
{
	T1 R = 0;
	R = (T406f15(GE_void(((T282*)(C))->a1)));
	return R;
}

/* GEANT_GELEX_COMMAND.is_exit_command */
T1 T406f15(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_GEXACE_TASK.is_exit_command */
T1 T280f25(T0* C)
{
	T1 R = 0;
	R = (T403f12(GE_void(((T280*)(C))->a1)));
	return R;
}

/* GEANT_GEXACE_COMMAND.is_exit_command */
T1 T403f12(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_UNSET_TASK.is_exit_command */
T1 T278f12(T0* C)
{
	T1 R = 0;
	R = (T399f5(GE_void(((T278*)(C))->a1)));
	return R;
}

/* GEANT_UNSET_COMMAND.is_exit_command */
T1 T399f5(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_SET_TASK.is_exit_command */
T1 T276f13(T0* C)
{
	T1 R = 0;
	R = (T396f6(GE_void(((T276*)(C))->a1)));
	return R;
}

/* GEANT_SET_COMMAND.is_exit_command */
T1 T396f6(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_LCC_TASK.is_exit_command */
T1 T274f13(T0* C)
{
	T1 R = 0;
	R = (T393f6(GE_void(((T274*)(C))->a1)));
	return R;
}

/* GEANT_LCC_COMMAND.is_exit_command */
T1 T393f6(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_EXEC_TASK.is_exit_command */
T1 T272f9(T0* C)
{
	T1 R = 0;
	R = (T385f10(GE_void(((T272*)(C))->a1)));
	return R;
}

/* GEANT_EXEC_COMMAND.is_exit_command */
T1 T385f10(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_ISE_TASK.is_exit_command */
T1 T270f24(T0* C)
{
	T1 R = 0;
	R = (T381f11(GE_void(((T270*)(C))->a1)));
	return R;
}

/* GEANT_ISE_COMMAND.is_exit_command */
T1 T381f11(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_GEC_TASK.is_exit_command */
T1 T263f27(T0* C)
{
	T1 R = 0;
	R = (T377f14(GE_void(((T263*)(C))->a1)));
	return R;
}

/* GEANT_GEC_COMMAND.is_exit_command */
T1 T377f14(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* GEANT_REPLACE_TASK.exit_code */
T6 T316f21(T0* C)
{
	T6 R = 0;
	R = (((T462*)(GE_void(((T316*)(C))->a1)))->a12);
	return R;
}

/* GEANT_INPUT_TASK.exit_code */
T6 T314f23(T0* C)
{
	T6 R = 0;
	R = (((T459*)(GE_void(((T314*)(C))->a1)))->a9);
	return R;
}

/* GEANT_AVAILABLE_TASK.exit_code */
T6 T312f9(T0* C)
{
	T6 R = 0;
	R = (((T456*)(GE_void(((T312*)(C))->a1)))->a8);
	return R;
}

/* GEANT_PRECURSOR_TASK.exit_code */
T6 T310f20(T0* C)
{
	T6 R = 0;
	R = (((T453*)(GE_void(((T310*)(C))->a1)))->a5);
	return R;
}

/* GEANT_EXIT_TASK.exit_code */
T6 T308f13(T0* C)
{
	T6 R = 0;
	R = (((T450*)(GE_void(((T308*)(C))->a1)))->a4);
	return R;
}

/* GEANT_OUTOFDATE_TASK.exit_code */
T6 T306f18(T0* C)
{
	T6 R = 0;
	R = (((T447*)(GE_void(((T306*)(C))->a1)))->a9);
	return R;
}

/* GEANT_XSLT_TASK.exit_code */
T6 T304f32(T0* C)
{
	T6 R = 0;
	R = (((T443*)(GE_void(((T304*)(C))->a1)))->a13);
	return R;
}

/* GEANT_SETENV_TASK.exit_code */
T6 T302f14(T0* C)
{
	T6 R = 0;
	R = (((T439*)(GE_void(((T302*)(C))->a1)))->a5);
	return R;
}

/* GEANT_MOVE_TASK.exit_code */
T6 T300f16(T0* C)
{
	T6 R = 0;
	R = (((T436*)(GE_void(((T300*)(C))->a1)))->a7);
	return R;
}

/* GEANT_COPY_TASK.exit_code */
T6 T298f22(T0* C)
{
	T6 R = 0;
	R = (((T433*)(GE_void(((T298*)(C))->a1)))->a8);
	return R;
}

/* GEANT_DELETE_TASK.exit_code */
T6 T296f16(T0* C)
{
	T6 R = 0;
	R = (((T429*)(GE_void(((T296*)(C))->a1)))->a7);
	return R;
}

/* GEANT_MKDIR_TASK.exit_code */
T6 T294f9(T0* C)
{
	T6 R = 0;
	R = (((T425*)(GE_void(((T294*)(C))->a1)))->a5);
	return R;
}

/* GEANT_ECHO_TASK.exit_code */
T6 T292f9(T0* C)
{
	T6 R = 0;
	R = (((T422*)(GE_void(((T292*)(C))->a1)))->a8);
	return R;
}

/* GEANT_GEANT_TASK.exit_code */
T6 T290f28(T0* C)
{
	T6 R = 0;
	R = (((T418*)(GE_void(((T290*)(C))->a1)))->a11);
	return R;
}

/* GEANT_GETEST_TASK.exit_code */
T6 T288f30(T0* C)
{
	T6 R = 0;
	R = (((T415*)(GE_void(((T288*)(C))->a1)))->a14);
	return R;
}

/* GEANT_GEPP_TASK.exit_code */
T6 T286f25(T0* C)
{
	T6 R = 0;
	R = (((T412*)(GE_void(((T286*)(C))->a1)))->a10);
	return R;
}

/* GEANT_GEYACC_TASK.exit_code */
T6 T284f25(T0* C)
{
	T6 R = 0;
	R = (((T409*)(GE_void(((T284*)(C))->a1)))->a11);
	return R;
}

/* GEANT_GELEX_TASK.exit_code */
T6 T282f28(T0* C)
{
	T6 R = 0;
	R = (((T406*)(GE_void(((T282*)(C))->a1)))->a14);
	return R;
}

/* GEANT_GEXACE_TASK.exit_code */
T6 T280f26(T0* C)
{
	T6 R = 0;
	R = (((T403*)(GE_void(((T280*)(C))->a1)))->a11);
	return R;
}

/* GEANT_UNSET_TASK.exit_code */
T6 T278f13(T0* C)
{
	T6 R = 0;
	R = (((T399*)(GE_void(((T278*)(C))->a1)))->a4);
	return R;
}

/* GEANT_SET_TASK.exit_code */
T6 T276f14(T0* C)
{
	T6 R = 0;
	R = (((T396*)(GE_void(((T276*)(C))->a1)))->a5);
	return R;
}

/* GEANT_LCC_TASK.exit_code */
T6 T274f14(T0* C)
{
	T6 R = 0;
	R = (((T393*)(GE_void(((T274*)(C))->a1)))->a5);
	return R;
}

/* GEANT_EXEC_TASK.exit_code */
T6 T272f10(T0* C)
{
	T6 R = 0;
	R = (((T385*)(GE_void(((T272*)(C))->a1)))->a7);
	return R;
}

/* GEANT_ISE_TASK.exit_code */
T6 T270f25(T0* C)
{
	T6 R = 0;
	R = (((T381*)(GE_void(((T270*)(C))->a1)))->a10);
	return R;
}

/* GEANT_GEC_TASK.exit_code */
T6 T263f28(T0* C)
{
	T6 R = 0;
	R = (((T377*)(GE_void(((T263*)(C))->a1)))->a13);
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.error_position */
T0* T176f57(T0* C)
{
	T0* R = 0;
	R = T133c5(((T176*)(C))->a8, ((T176*)(C))->a17, ((T176*)(C))->a16, ((T176*)(C))->a15);
	return R;
}

/* XM_DEFAULT_POSITION.make */
T0* T133c5(T0* a1, T6 a2, T6 a3, T6 a4)
{
	T0* C;
	C = GE_new133(EIF_TRUE);
	((T133*)(C))->a1 = a1;
	((T133*)(C))->a4 = a2;
	((T133*)(C))->a3 = a3;
	((T133*)(C))->a2 = a4;
	return C;
}

/* XM_EIFFEL_SCANNER_DTD.error_position */
T0* T174f56(T0* C)
{
	T0* R = 0;
	R = T133c5(((T174*)(C))->a3, ((T174*)(C))->a4, ((T174*)(C))->a5, ((T174*)(C))->a6);
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.error_position */
T0* T171f56(T0* C)
{
	T0* R = 0;
	R = T133c5(((T171*)(C))->a8, ((T171*)(C))->a17, ((T171*)(C))->a16, ((T171*)(C))->a15);
	return R;
}

/* XM_EIFFEL_SCANNER.error_position */
T0* T132f66(T0* C)
{
	T0* R = 0;
	R = T133c5(((T132*)(C))->a3, ((T132*)(C))->a4, ((T132*)(C))->a5, ((T132*)(C))->a6);
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.end_of_file */
T1 T176f60(T0* C)
{
	T1 R = 0;
	R = (((((((T176*)(C))->a43) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.end_of_file */
T1 T174f63(T0* C)
{
	T1 R = 0;
	R = (((((((T174*)(C))->a1) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.end_of_file */
T1 T171f59(T0* C)
{
	T1 R = 0;
	R = (((((((T171*)(C))->a41) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_EIFFEL_SCANNER.end_of_file */
T1 T132f67(T0* C)
{
	T1 R = 0;
	R = (((((((T132*)(C))->a1) == ((T6)(GE_int32(0)))))));
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.is_applicable_encoding */
T1 T176f61(T0* C, T0* a1)
{
	T1 t1;
	T1 R = 0;
	t1 = (T206f9(GE_void(((T176*)(C))->a45), a1));
	if (t1) {
		R = (T206f16(GE_void(((T176*)(C))->a45), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.is_applicable_encoding */
T1 T206f16(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	t1 = (((((((T206*)(C))->a2) == ((T6)(GE_int32(6)))))));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T206f17(C));
		t1 = (T76f11(GE_void(t2), a1, ge1536ov7784));
		if (!(t1)) {
			t2 = (T206f17(C));
			t1 = (T76f11(GE_void(t2), a1, ge1536ov7783));
		}
		if (t1) {
			t1 = (((((((T206*)(C))->a2) == ((T6)(GE_int32(2)))))));
			if (!(t1)) {
				t1 = (((((((T206*)(C))->a2) == ((T6)(GE_int32(1)))))));
			}
			if (!(t1)) {
				R = (((((((T206*)(C))->a2) == ((T6)(GE_int32(3)))))));
			} else {
				R = EIF_TRUE;
			}
		} else {
			t2 = (T206f17(C));
			t1 = (T76f11(GE_void(t2), a1, ge1536ov7785));
			if (t1) {
				t1 = (((((((T206*)(C))->a2) == ((T6)(GE_int32(2)))))));
				if (!(t1)) {
					R = (((((((T206*)(C))->a2) == ((T6)(GE_int32(1)))))));
				} else {
					R = EIF_TRUE;
				}
			} else {
				t2 = (T206f17(C));
				t1 = (T76f11(GE_void(t2), a1, ge1536ov7786));
				if (t1) {
					t1 = (((((((T206*)(C))->a2) == ((T6)(GE_int32(4)))))));
					if (!(t1)) {
						R = (((((((T206*)(C))->a2) == ((T6)(GE_int32(5)))))));
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
T1 T206f9(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	T1 R = 0;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T206f17(C));
		t1 = (T76f11(GE_void(t2), a1, ge1536ov7784));
		if (!(t1)) {
			t2 = (T206f17(C));
			t1 = (T76f11(GE_void(t2), a1, ge1536ov7783));
		}
		if (!(t1)) {
			t2 = (T206f17(C));
			t1 = (T76f11(GE_void(t2), a1, ge1536ov7785));
		}
		if (!(t1)) {
			t2 = (T206f17(C));
			R = (T76f11(GE_void(t2), a1, ge1536ov7786));
		} else {
			R = EIF_TRUE;
		}
	}
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.is_applicable_encoding */
T1 T174f49(T0* C, T0* a1)
{
	T1 t1;
	T1 R = 0;
	t1 = (T206f9(GE_void(((T174*)(C))->a7), a1));
	if (t1) {
		R = (T206f16(GE_void(((T174*)(C))->a7), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.is_applicable_encoding */
T1 T171f60(T0* C, T0* a1)
{
	T1 t1;
	T1 R = 0;
	t1 = (T206f9(GE_void(((T171*)(C))->a43), a1));
	if (t1) {
		R = (T206f16(GE_void(((T171*)(C))->a43), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_EIFFEL_SCANNER.is_applicable_encoding */
T1 T132f42(T0* C, T0* a1)
{
	T1 t1;
	T1 R = 0;
	t1 = (T206f9(GE_void(((T132*)(C))->a7), a1));
	if (t1) {
		R = (T206f16(GE_void(((T132*)(C))->a7), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.start_condition */
T6 T176f62(T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((((T176*)(C))->a11)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.start_condition */
T6 T174f51(T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((((T174*)(C))->a8)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.start_condition */
T6 T171f61(T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((((T171*)(C))->a11)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* XM_EIFFEL_SCANNER.start_condition */
T6 T132f44(T0* C)
{
	T6 t1;
	T6 R = 0;
	t1 = ((T6)((((T132*)(C))->a8)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_after */
T1 T81f25(T0* C, T0* a1)
{
	T6 t1;
	T1 R = 0;
	t1 = (((T64*)(a1))->a2);
	R = (((((t1) == ((T6)(GE_int32(-2)))))));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.cursor_after */
T1 T34f36(T0* C, T0* a1)
{
	T6 t1;
	T1 R = 0;
	t1 = (((T64*)(GE_void(a1)))->a2);
	R = (((((t1) == ((T6)(GE_int32(-2)))))));
	return R;
}

/* GEANT_VARIABLES.cursor_after */
T1 T29f38(T0* C, T0* a1)
{
	T6 t1;
	T1 R = 0;
	t1 = (((T64*)(GE_void(a1)))->a2);
	R = (((((t1) == ((T6)(GE_int32(-2)))))));
	return R;
}

/* GEANT_PROJECT_VARIABLES.cursor_after */
T1 T25f46(T0* C, T0* a1)
{
	T6 t1;
	T1 R = 0;
	t1 = (((T64*)(GE_void(a1)))->a2);
	R = (((((t1) == ((T6)(GE_int32(-2)))))));
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_item */
T0* T81f26(T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T64*)(a1))->a2);
	R = (T81f28(C, t1));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.cursor_item */
T0* T34f37(T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T64*)(GE_void(a1)))->a2);
	R = (T34f41(C, t1));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.item_storage_item */
T0* T34f41(T0* C, T6 a1)
{
	T0* R = 0;
	R = (((T32*)(GE_void(((T34*)(C))->a12)))->z2[a1]);
	return R;
}

/* GEANT_VARIABLES.cursor_item */
T0* T29f39(T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T64*)(GE_void(a1)))->a2);
	R = (T29f35(C, t1));
	return R;
}

/* GEANT_PROJECT_VARIABLES.cursor_item */
T0* T25f47(T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T64*)(GE_void(a1)))->a2);
	R = (T25f50(C, t1));
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].cursor_key */
T0* T81f27(T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T64*)(a1))->a2);
	R = (T81f30(C, t1));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.cursor_key */
T0* T34f38(T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T64*)(GE_void(a1)))->a2);
	R = (T34f28(C, t1));
	return R;
}

/* GEANT_VARIABLES.cursor_key */
T0* T29f40(T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T64*)(GE_void(a1)))->a2);
	R = (T29f28(C, t1));
	return R;
}

/* GEANT_PROJECT_VARIABLES.cursor_key */
T0* T25f48(T0* C, T0* a1)
{
	T6 t1;
	T0* R = 0;
	t1 = (((T64*)(GE_void(a1)))->a2);
	R = (T25f27(C, t1));
	return R;
}

/* FILE_NAME.area_lower */
T6 T659f8(T0* C)
{
	T6 R = 0;
	return R;
}

/* UC_UTF8_STRING.area_lower */
T6 T205f12(T0* C)
{
	T6 R = 0;
	return R;
}

/* STRING_8.area_lower */
T6 T17f7(T0* C)
{
	T6 R = 0;
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].new_cursor */
T0* T81f41(T0* C)
{
	T0* R = 0;
	R = T64c7(C);
	return R;
}

/* DS_HASH_TABLE_CURSOR [STRING_8, STRING_8].make */
T0* T64c7(T0* a1)
{
	T0* C;
	C = GE_new64(EIF_TRUE);
	((T64*)(C))->a1 = a1;
	((T64*)(C))->a2 = ((T6)(GE_int32(-1)));
	return C;
}

/* GEANT_ARGUMENT_VARIABLES.new_cursor */
T0* T34f29(T0* C)
{
	T0* R = 0;
	R = T64c7(C);
	return R;
}

/* GEANT_VARIABLES.new_cursor */
T0* T29f29(T0* C)
{
	T0* R = 0;
	R = T64c7(C);
	return R;
}

/* GEANT_PROJECT_VARIABLES.new_cursor */
T0* T25f34(T0* C)
{
	T0* R = 0;
	R = T64c7(C);
	return R;
}

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.default_message */
T0* T607f5(T0* C)
{
	T0* R = 0;
	R = (T607f3(C, ge302ov2866));
	return R;
}

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.message */
T0* T607f3(T0* C, T0* a1)
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
	t1 = (T607f4(C));
	R = (T76f3(GE_void(t1), a1, l4));
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
					T17f38(R, l5);
				} else {
					T205f60(R, l5);
				}
			} else {
				t1 = (T607f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T76f4(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T205f60(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T205f60(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T607f4(C));
					l1 = (T76f3(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f38(l1, l5);
									} else {
										T205f60(l1, l5);
									}
								} else {
									t1 = (T607f4(C));
									T76f20(GE_void(t1), l1, a1, l2, l2);
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
									T17f38(l1, l5);
								} else {
									T205f60(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T205f49(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T205f50(l1)));
						t2 = (T33f5(GE_void(((T607*)(C))->a1), l3));
						if (t2) {
							t1 = (T607f4(C));
							t5 = (T33f4(GE_void(((T607*)(C))->a1), l3));
							R = (T76f5(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T607f4(C));
								t5 = (T607f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T76f5(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T205f60(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T205f60(R, (T2)('{'));
									}
								}
								t1 = (T607f4(C));
								R = (T76f5(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T205f60(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T205f60(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T205f60(R, (T2)('{'));
							}
						}
						t1 = (T607f4(C));
						R = (T76f5(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T205f60(R, (T2)('}'));
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
T0* T607f6(T0* C)
{
	T0* R = 0;
	if (ge201os1775) {
		return ge201ov1775;
	} else {
		ge201os1775 = '\1';
		ge201ov1775 = R;
	}
	R = T27c4();
	ge201ov1775 = R;
	return R;
}

/* LX_NEGATIVE_RANGE_IN_CHARACTER_CLASS_ERROR.string_ */
T0* T607f4(T0* C)
{
	T0* R = 0;
	if (ge128os1766) {
		return ge128ov1766;
	} else {
		ge128os1766 = '\1';
		ge128ov1766 = R;
	}
	R = T76c19();
	ge128ov1766 = R;
	return R;
}

/* LX_CHARACTER_OUT_OF_RANGE_ERROR.default_message */
T0* T593f5(T0* C)
{
	T0* R = 0;
	R = (T593f3(C, ge288ov2866));
	return R;
}

/* LX_CHARACTER_OUT_OF_RANGE_ERROR.message */
T0* T593f3(T0* C, T0* a1)
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
	t1 = (T593f4(C));
	R = (T76f3(GE_void(t1), a1, l4));
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
					T17f38(R, l5);
				} else {
					T205f60(R, l5);
				}
			} else {
				t1 = (T593f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T76f4(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T205f60(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T205f60(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T593f4(C));
					l1 = (T76f3(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f38(l1, l5);
									} else {
										T205f60(l1, l5);
									}
								} else {
									t1 = (T593f4(C));
									T76f20(GE_void(t1), l1, a1, l2, l2);
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
									T17f38(l1, l5);
								} else {
									T205f60(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T205f49(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T205f50(l1)));
						t2 = (T33f5(GE_void(((T593*)(C))->a1), l3));
						if (t2) {
							t1 = (T593f4(C));
							t5 = (T33f4(GE_void(((T593*)(C))->a1), l3));
							R = (T76f5(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T593f4(C));
								t5 = (T593f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T76f5(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T205f60(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T205f60(R, (T2)('{'));
									}
								}
								t1 = (T593f4(C));
								R = (T76f5(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T205f60(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T205f60(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T205f60(R, (T2)('{'));
							}
						}
						t1 = (T593f4(C));
						R = (T76f5(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T205f60(R, (T2)('}'));
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
T0* T593f6(T0* C)
{
	T0* R = 0;
	if (ge201os1775) {
		return ge201ov1775;
	} else {
		ge201os1775 = '\1';
		ge201ov1775 = R;
	}
	R = T27c4();
	ge201ov1775 = R;
	return R;
}

/* LX_CHARACTER_OUT_OF_RANGE_ERROR.string_ */
T0* T593f4(T0* C)
{
	T0* R = 0;
	if (ge128os1766) {
		return ge128ov1766;
	} else {
		ge128os1766 = '\1';
		ge128ov1766 = R;
	}
	R = T76c19();
	ge128ov1766 = R;
	return R;
}

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.default_message */
T0* T592f5(T0* C)
{
	T0* R = 0;
	R = (T592f3(C, ge294ov2866));
	return R;
}

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.message */
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
	R = (T76f3(GE_void(t1), a1, l4));
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
					T17f38(R, l5);
				} else {
					T205f60(R, l5);
				}
			} else {
				t1 = (T592f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T76f4(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T205f60(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T205f60(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T592f4(C));
					l1 = (T76f3(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f38(l1, l5);
									} else {
										T205f60(l1, l5);
									}
								} else {
									t1 = (T592f4(C));
									T76f20(GE_void(t1), l1, a1, l2, l2);
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
									T17f38(l1, l5);
								} else {
									T205f60(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T205f49(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T205f50(l1)));
						t2 = (T33f5(GE_void(((T592*)(C))->a1), l3));
						if (t2) {
							t1 = (T592f4(C));
							t5 = (T33f4(GE_void(((T592*)(C))->a1), l3));
							R = (T76f5(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T592f4(C));
								t5 = (T592f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T76f5(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T205f60(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T205f60(R, (T2)('{'));
									}
								}
								t1 = (T592f4(C));
								R = (T76f5(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T205f60(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T205f60(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T205f60(R, (T2)('{'));
							}
						}
						t1 = (T592f4(C));
						R = (T76f5(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T205f60(R, (T2)('}'));
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
T0* T592f6(T0* C)
{
	T0* R = 0;
	if (ge201os1775) {
		return ge201ov1775;
	} else {
		ge201os1775 = '\1';
		ge201ov1775 = R;
	}
	R = T27c4();
	ge201ov1775 = R;
	return R;
}

/* LX_FULL_AND_VARIABLE_TRAILING_CONTEXT_ERROR.string_ */
T0* T592f4(T0* C)
{
	T0* R = 0;
	if (ge128os1766) {
		return ge128ov1766;
	} else {
		ge128os1766 = '\1';
		ge128ov1766 = R;
	}
	R = T76c19();
	ge128ov1766 = R;
	return R;
}

/* LX_FULL_AND_REJECT_ERROR.default_message */
T0* T591f5(T0* C)
{
	T0* R = 0;
	R = (T591f3(C, ge293ov2866));
	return R;
}

/* LX_FULL_AND_REJECT_ERROR.message */
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
	R = (T76f3(GE_void(t1), a1, l4));
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
					T17f38(R, l5);
				} else {
					T205f60(R, l5);
				}
			} else {
				t1 = (T591f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T76f4(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T205f60(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T205f60(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T591f4(C));
					l1 = (T76f3(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f38(l1, l5);
									} else {
										T205f60(l1, l5);
									}
								} else {
									t1 = (T591f4(C));
									T76f20(GE_void(t1), l1, a1, l2, l2);
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
									T17f38(l1, l5);
								} else {
									T205f60(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T205f49(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T205f50(l1)));
						t2 = (T33f5(GE_void(((T591*)(C))->a1), l3));
						if (t2) {
							t1 = (T591f4(C));
							t5 = (T33f4(GE_void(((T591*)(C))->a1), l3));
							R = (T76f5(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T591f4(C));
								t5 = (T591f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T76f5(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T205f60(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T205f60(R, (T2)('{'));
									}
								}
								t1 = (T591f4(C));
								R = (T76f5(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T205f60(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T205f60(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T205f60(R, (T2)('{'));
							}
						}
						t1 = (T591f4(C));
						R = (T76f5(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T205f60(R, (T2)('}'));
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
T0* T591f6(T0* C)
{
	T0* R = 0;
	if (ge201os1775) {
		return ge201ov1775;
	} else {
		ge201os1775 = '\1';
		ge201ov1775 = R;
	}
	R = T27c4();
	ge201ov1775 = R;
	return R;
}

/* LX_FULL_AND_REJECT_ERROR.string_ */
T0* T591f4(T0* C)
{
	T0* R = 0;
	if (ge128os1766) {
		return ge128ov1766;
	} else {
		ge128os1766 = '\1';
		ge128ov1766 = R;
	}
	R = T76c19();
	ge128ov1766 = R;
	return R;
}

/* LX_FULL_AND_META_ERROR.default_message */
T0* T590f5(T0* C)
{
	T0* R = 0;
	R = (T590f3(C, ge292ov2866));
	return R;
}

/* LX_FULL_AND_META_ERROR.message */
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
	R = (T76f3(GE_void(t1), a1, l4));
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
					T17f38(R, l5);
				} else {
					T205f60(R, l5);
				}
			} else {
				t1 = (T590f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T76f4(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T205f60(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T205f60(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T590f4(C));
					l1 = (T76f3(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f38(l1, l5);
									} else {
										T205f60(l1, l5);
									}
								} else {
									t1 = (T590f4(C));
									T76f20(GE_void(t1), l1, a1, l2, l2);
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
									T17f38(l1, l5);
								} else {
									T205f60(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T205f49(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T205f50(l1)));
						t2 = (T33f5(GE_void(((T590*)(C))->a1), l3));
						if (t2) {
							t1 = (T590f4(C));
							t5 = (T33f4(GE_void(((T590*)(C))->a1), l3));
							R = (T76f5(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T590f4(C));
								t5 = (T590f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T76f5(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T205f60(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T205f60(R, (T2)('{'));
									}
								}
								t1 = (T590f4(C));
								R = (T76f5(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T205f60(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T205f60(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T205f60(R, (T2)('{'));
							}
						}
						t1 = (T590f4(C));
						R = (T76f5(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T205f60(R, (T2)('}'));
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
T0* T590f6(T0* C)
{
	T0* R = 0;
	if (ge201os1775) {
		return ge201ov1775;
	} else {
		ge201os1775 = '\1';
		ge201ov1775 = R;
	}
	R = T27c4();
	ge201ov1775 = R;
	return R;
}

/* LX_FULL_AND_META_ERROR.string_ */
T0* T590f4(T0* C)
{
	T0* R = 0;
	if (ge128os1766) {
		return ge128ov1766;
	} else {
		ge128os1766 = '\1';
		ge128ov1766 = R;
	}
	R = T76c19();
	ge128ov1766 = R;
	return R;
}

/* LX_BAD_CHARACTER_ERROR.default_message */
T0* T589f5(T0* C)
{
	T0* R = 0;
	R = (T589f3(C, ge283ov2866));
	return R;
}

/* LX_BAD_CHARACTER_ERROR.message */
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
	R = (T76f3(GE_void(t1), a1, l4));
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
					T17f38(R, l5);
				} else {
					T205f60(R, l5);
				}
			} else {
				t1 = (T589f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T76f4(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T205f60(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T205f60(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T589f4(C));
					l1 = (T76f3(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f38(l1, l5);
									} else {
										T205f60(l1, l5);
									}
								} else {
									t1 = (T589f4(C));
									T76f20(GE_void(t1), l1, a1, l2, l2);
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
									T17f38(l1, l5);
								} else {
									T205f60(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T205f49(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T205f50(l1)));
						t2 = (T33f5(GE_void(((T589*)(C))->a1), l3));
						if (t2) {
							t1 = (T589f4(C));
							t5 = (T33f4(GE_void(((T589*)(C))->a1), l3));
							R = (T76f5(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T589f4(C));
								t5 = (T589f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T76f5(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T205f60(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T205f60(R, (T2)('{'));
									}
								}
								t1 = (T589f4(C));
								R = (T76f5(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T205f60(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T205f60(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T205f60(R, (T2)('{'));
							}
						}
						t1 = (T589f4(C));
						R = (T76f5(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T205f60(R, (T2)('}'));
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
T0* T589f6(T0* C)
{
	T0* R = 0;
	if (ge201os1775) {
		return ge201ov1775;
	} else {
		ge201os1775 = '\1';
		ge201ov1775 = R;
	}
	R = T27c4();
	ge201ov1775 = R;
	return R;
}

/* LX_BAD_CHARACTER_ERROR.string_ */
T0* T589f4(T0* C)
{
	T0* R = 0;
	if (ge128os1766) {
		return ge128ov1766;
	} else {
		ge128os1766 = '\1';
		ge128ov1766 = R;
	}
	R = T76c19();
	ge128ov1766 = R;
	return R;
}

/* LX_BAD_CHARACTER_CLASS_ERROR.default_message */
T0* T588f5(T0* C)
{
	T0* R = 0;
	R = (T588f3(C, ge282ov2866));
	return R;
}

/* LX_BAD_CHARACTER_CLASS_ERROR.message */
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
	R = (T76f3(GE_void(t1), a1, l4));
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
					T17f38(R, l5);
				} else {
					T205f60(R, l5);
				}
			} else {
				t1 = (T588f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T76f4(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T205f60(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T205f60(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T588f4(C));
					l1 = (T76f3(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f38(l1, l5);
									} else {
										T205f60(l1, l5);
									}
								} else {
									t1 = (T588f4(C));
									T76f20(GE_void(t1), l1, a1, l2, l2);
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
									T17f38(l1, l5);
								} else {
									T205f60(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T205f49(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T205f50(l1)));
						t2 = (T33f5(GE_void(((T588*)(C))->a1), l3));
						if (t2) {
							t1 = (T588f4(C));
							t5 = (T33f4(GE_void(((T588*)(C))->a1), l3));
							R = (T76f5(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T588f4(C));
								t5 = (T588f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T76f5(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T205f60(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T205f60(R, (T2)('{'));
									}
								}
								t1 = (T588f4(C));
								R = (T76f5(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T205f60(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T205f60(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T205f60(R, (T2)('{'));
							}
						}
						t1 = (T588f4(C));
						R = (T76f5(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T205f60(R, (T2)('}'));
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
T0* T588f6(T0* C)
{
	T0* R = 0;
	if (ge201os1775) {
		return ge201ov1775;
	} else {
		ge201os1775 = '\1';
		ge201ov1775 = R;
	}
	R = T27c4();
	ge201ov1775 = R;
	return R;
}

/* LX_BAD_CHARACTER_CLASS_ERROR.string_ */
T0* T588f4(T0* C)
{
	T0* R = 0;
	if (ge128os1766) {
		return ge128ov1766;
	} else {
		ge128os1766 = '\1';
		ge128ov1766 = R;
	}
	R = T76c19();
	ge128ov1766 = R;
	return R;
}

/* LX_MISSING_QUOTE_ERROR.default_message */
T0* T587f5(T0* C)
{
	T0* R = 0;
	R = (T587f3(C, ge299ov2866));
	return R;
}

/* LX_MISSING_QUOTE_ERROR.message */
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
	R = (T76f3(GE_void(t1), a1, l4));
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
					T17f38(R, l5);
				} else {
					T205f60(R, l5);
				}
			} else {
				t1 = (T587f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T76f4(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T205f60(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T205f60(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T587f4(C));
					l1 = (T76f3(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f38(l1, l5);
									} else {
										T205f60(l1, l5);
									}
								} else {
									t1 = (T587f4(C));
									T76f20(GE_void(t1), l1, a1, l2, l2);
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
									T17f38(l1, l5);
								} else {
									T205f60(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T205f49(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T205f50(l1)));
						t2 = (T33f5(GE_void(((T587*)(C))->a1), l3));
						if (t2) {
							t1 = (T587f4(C));
							t5 = (T33f4(GE_void(((T587*)(C))->a1), l3));
							R = (T76f5(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T587f4(C));
								t5 = (T587f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T76f5(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T205f60(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T205f60(R, (T2)('{'));
									}
								}
								t1 = (T587f4(C));
								R = (T76f5(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T205f60(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T205f60(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T205f60(R, (T2)('{'));
							}
						}
						t1 = (T587f4(C));
						R = (T76f5(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T205f60(R, (T2)('}'));
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
T0* T587f6(T0* C)
{
	T0* R = 0;
	if (ge201os1775) {
		return ge201ov1775;
	} else {
		ge201os1775 = '\1';
		ge201ov1775 = R;
	}
	R = T27c4();
	ge201ov1775 = R;
	return R;
}

/* LX_MISSING_QUOTE_ERROR.string_ */
T0* T587f4(T0* C)
{
	T0* R = 0;
	if (ge128os1766) {
		return ge128ov1766;
	} else {
		ge128os1766 = '\1';
		ge128ov1766 = R;
	}
	R = T76c19();
	ge128ov1766 = R;
	return R;
}

/* LX_UNRECOGNIZED_RULE_ERROR.default_message */
T0* T586f5(T0* C)
{
	T0* R = 0;
	R = (T586f3(C, ge312ov2866));
	return R;
}

/* LX_UNRECOGNIZED_RULE_ERROR.message */
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
	R = (T76f3(GE_void(t1), a1, l4));
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
					T17f38(R, l5);
				} else {
					T205f60(R, l5);
				}
			} else {
				t1 = (T586f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T76f4(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T205f60(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T205f60(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T586f4(C));
					l1 = (T76f3(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f38(l1, l5);
									} else {
										T205f60(l1, l5);
									}
								} else {
									t1 = (T586f4(C));
									T76f20(GE_void(t1), l1, a1, l2, l2);
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
									T17f38(l1, l5);
								} else {
									T205f60(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T205f49(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T205f50(l1)));
						t2 = (T33f5(GE_void(((T586*)(C))->a1), l3));
						if (t2) {
							t1 = (T586f4(C));
							t5 = (T33f4(GE_void(((T586*)(C))->a1), l3));
							R = (T76f5(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T586f4(C));
								t5 = (T586f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T76f5(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T205f60(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T205f60(R, (T2)('{'));
									}
								}
								t1 = (T586f4(C));
								R = (T76f5(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T205f60(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T205f60(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T205f60(R, (T2)('{'));
							}
						}
						t1 = (T586f4(C));
						R = (T76f5(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T205f60(R, (T2)('}'));
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
T0* T586f6(T0* C)
{
	T0* R = 0;
	if (ge201os1775) {
		return ge201ov1775;
	} else {
		ge201os1775 = '\1';
		ge201ov1775 = R;
	}
	R = T27c4();
	ge201ov1775 = R;
	return R;
}

/* LX_UNRECOGNIZED_RULE_ERROR.string_ */
T0* T586f4(T0* C)
{
	T0* R = 0;
	if (ge128os1766) {
		return ge128ov1766;
	} else {
		ge128os1766 = '\1';
		ge128ov1766 = R;
	}
	R = T76c19();
	ge128ov1766 = R;
	return R;
}

/* UT_SYNTAX_ERROR.default_message */
T0* T584f5(T0* C)
{
	T0* R = 0;
	R = (T584f3(C, ge1388ov2866));
	return R;
}

/* UT_SYNTAX_ERROR.message */
T0* T584f3(T0* C, T0* a1)
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
	t1 = (T584f4(C));
	R = (T76f3(GE_void(t1), a1, l4));
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
					T17f38(R, l5);
				} else {
					T205f60(R, l5);
				}
			} else {
				t1 = (T584f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T76f4(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T205f60(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T205f60(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T584f4(C));
					l1 = (T76f3(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f38(l1, l5);
									} else {
										T205f60(l1, l5);
									}
								} else {
									t1 = (T584f4(C));
									T76f20(GE_void(t1), l1, a1, l2, l2);
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
									T17f38(l1, l5);
								} else {
									T205f60(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T205f49(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T205f50(l1)));
						t2 = (T33f5(GE_void(((T584*)(C))->a1), l3));
						if (t2) {
							t1 = (T584f4(C));
							t5 = (T33f4(GE_void(((T584*)(C))->a1), l3));
							R = (T76f5(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T584f4(C));
								t5 = (T584f6(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T76f5(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T205f60(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T205f60(R, (T2)('{'));
									}
								}
								t1 = (T584f4(C));
								R = (T76f5(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T205f60(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T205f60(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T205f60(R, (T2)('{'));
							}
						}
						t1 = (T584f4(C));
						R = (T76f5(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T205f60(R, (T2)('}'));
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
T0* T584f6(T0* C)
{
	T0* R = 0;
	if (ge201os1775) {
		return ge201ov1775;
	} else {
		ge201os1775 = '\1';
		ge201ov1775 = R;
	}
	R = T27c4();
	ge201ov1775 = R;
	return R;
}

/* UT_SYNTAX_ERROR.string_ */
T0* T584f4(T0* C)
{
	T0* R = 0;
	if (ge128os1766) {
		return ge128ov1766;
	} else {
		ge128os1766 = '\1';
		ge128ov1766 = R;
	}
	R = T76c19();
	ge128ov1766 = R;
	return R;
}

/* UT_VERSION_NUMBER.default_message */
T0* T49f3(T0* C)
{
	T0* R = 0;
	R = (T49f5(C, ge1393ov2866));
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
	R = (T76f3(GE_void(t1), a1, l4));
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
					T17f38(R, l5);
				} else {
					T205f60(R, l5);
				}
			} else {
				t1 = (T49f6(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T76f4(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1((&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f38(R, (T2)('$'));
				} else {
					T205f60(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f38(R, (T2)('$'));
					} else {
						T205f60(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T49f6(C));
					l1 = (T76f3(GE_void(t1), a1, (T6)(GE_int32(5))));
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
										T17f38(l1, l5);
									} else {
										T205f60(l1, l5);
									}
								} else {
									t1 = (T49f6(C));
									T76f20(GE_void(t1), l1, a1, l2, l2);
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
									T17f38(l1, l5);
								} else {
									T205f60(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T205f49(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f17(l1):T205f50(l1)));
						t2 = (T33f5(GE_void(((T49*)(C))->a1), l3));
						if (t2) {
							t1 = (T49f6(C));
							t5 = (T33f4(GE_void(((T49*)(C))->a1), l3));
							R = (T76f5(GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T49f6(C));
								t5 = (T49f7(C));
								t5 = (((T27*)(GE_void(t5)))->a1);
								R = (T76f5(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f38(R, (T2)('$'));
								} else {
									T205f60(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('{'));
									} else {
										T205f60(R, (T2)('{'));
									}
								}
								t1 = (T49f6(C));
								R = (T76f5(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f38(R, (T2)('}'));
									} else {
										T205f60(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f38(R, (T2)('$'));
						} else {
							T205f60(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('{'));
							} else {
								T205f60(R, (T2)('{'));
							}
						}
						t1 = (T49f6(C));
						R = (T76f5(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f38(R, (T2)('}'));
							} else {
								T205f60(R, (T2)('}'));
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
	if (ge201os1775) {
		return ge201ov1775;
	} else {
		ge201os1775 = '\1';
		ge201ov1775 = R;
	}
	R = T27c4();
	ge201ov1775 = R;
	return R;
}

/* UT_VERSION_NUMBER.string_ */
T0* T49f6(T0* C)
{
	T0* R = 0;
	if (ge128os1766) {
		return ge128ov1766;
	} else {
		ge128os1766 = '\1';
		ge128ov1766 = R;
	}
	R = T76c19();
	ge128ov1766 = R;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.was_found */
T1 T73f11(T0* C)
{
	T1 R = 0;
	R = (T6f1(&(((T73*)(C))->a5), (T6)(GE_int32(0))));
	return R;
}

/* AP_STRING_OPTION.was_found */
T1 T37f16(T0* C)
{
	T6 t1;
	T1 R = 0;
	t1 = (T37f18(C));
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
T6 T37f18(T0* C)
{
	T6 R = 0;
	R = (((T71*)(GE_void(((T37*)(C))->a1)))->a1);
	return R;
}

/* AP_DISPLAY_HELP_FLAG.allows_parameter */
T1 T73f9(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_STRING_OPTION.allows_parameter */
T1 T37f17(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_FLAG.allows_parameter */
T1 T35f12(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.needs_parameter */
T1 T73f12(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_FLAG.needs_parameter */
T1 T35f11(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.name */
T0* T73f22(T0* C)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	T0* l1 = 0;
	t1 = (T73f10(C));
	if (t1) {
		l1 = ((T73*)(C))->a4;
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t2 = (T2)('-');
		t4 = (T2f1(&t2));
		t3 = (T17f9(GE_void(t3), t4));
		R = (T17f9(GE_void(t3), l1));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t4 = (T2f1(&(((T73*)(C))->a2)));
		R = (T17f9(GE_void(t3), t4));
	}
	return R;
}

/* AP_STRING_OPTION.name */
T0* T37f11(T0* C)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	T0* l1 = 0;
	t1 = (T37f12(C));
	if (t1) {
		l1 = ((T37*)(C))->a7;
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t2 = (T2)('-');
		t4 = (T2f1(&t2));
		t3 = (T17f9(GE_void(t3), t4));
		R = (T17f9(GE_void(t3), l1));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t4 = (T2f1(&(((T37*)(C))->a5)));
		R = (T17f9(GE_void(t3), t4));
	}
	return R;
}

/* AP_FLAG.name */
T0* T35f15(T0* C)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	T0* l1 = 0;
	t1 = (T35f10(C));
	if (t1) {
		l1 = ((T35*)(C))->a3;
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t2 = (T2)('-');
		t4 = (T2f1(&t2));
		t3 = (T17f9(GE_void(t3), t4));
		R = (T17f9(GE_void(t3), l1));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t4 = (T2f1(&(((T35*)(C))->a4)));
		R = (T17f9(GE_void(t3), t4));
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.names */
T0* T73f23(T0* C)
{
	T2 t1;
	T1 t2;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	if (((T73*)(C))->a3) {
		t1 = (T2)('-');
		l1 = (T2f1(&t1));
		T17f38(GE_void(l1), ((T73*)(C))->a2);
	}
	t2 = (T73f10(C));
	if (t2) {
		l2 = ((T73*)(C))->a4;
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f42(GE_void(l1), GE_ms8(", ", 2));
		}
		T17f38(GE_void(l1), (T2)('-'));
		T17f38(GE_void(l1), (T2)('-'));
		T17f42(GE_void(l1), l2);
	}
	R = l1;
	return R;
}

/* AP_STRING_OPTION.names */
T0* T37f19(T0* C)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T0* R = 0;
	R = (T37f19p1(C));
	t1 = (T37f12(C));
	if (t1) {
		t1 = ((T1)(!(((T37*)(C))->a4)));
		if (t1) {
			T17f38(GE_void(R), (T2)('['));
		}
		t2 = (T2)('=');
		t3 = (T2f1(&t2));
		T17f42(GE_void(R), t3);
		T17f42(GE_void(R), ((T37*)(C))->a3);
		t1 = ((T1)(!(((T37*)(C))->a4)));
		if (t1) {
			T17f38(GE_void(R), (T2)(']'));
		}
	} else {
		T17f38(GE_void(R), (T2)(' '));
		T17f42(GE_void(R), ((T37*)(C))->a3);
	}
	return R;
}

/* AP_STRING_OPTION.names */
T0* T37f19p1(T0* C)
{
	T2 t1;
	T1 t2;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	if (((T37*)(C))->a6) {
		t1 = (T2)('-');
		l1 = (T2f1(&t1));
		T17f38(GE_void(l1), ((T37*)(C))->a5);
	}
	t2 = (T37f12(C));
	if (t2) {
		l2 = ((T37*)(C))->a7;
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f42(GE_void(l1), GE_ms8(", ", 2));
		}
		T17f38(GE_void(l1), (T2)('-'));
		T17f38(GE_void(l1), (T2)('-'));
		T17f42(GE_void(l1), l2);
	}
	R = l1;
	return R;
}

/* AP_FLAG.names */
T0* T35f16(T0* C)
{
	T2 t1;
	T1 t2;
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	if (((T35*)(C))->a5) {
		t1 = (T2)('-');
		l1 = (T2f1(&t1));
		T17f38(GE_void(l1), ((T35*)(C))->a4);
	}
	t2 = (T35f10(C));
	if (t2) {
		l2 = ((T35*)(C))->a3;
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f42(GE_void(l1), GE_ms8(", ", 2));
		}
		T17f38(GE_void(l1), (T2)('-'));
		T17f38(GE_void(l1), (T2)('-'));
		T17f42(GE_void(l1), l2);
	}
	R = l1;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.example */
T0* T73f28(T0* C)
{
	T1 t1;
	T0* t2;
	T0* R = 0;
	T0* l1 = 0;
	R = T17c37((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T73*)(C))->a6)));
	if (t1) {
		T17f38(GE_void(R), (T2)('['));
	}
	T17f38(GE_void(R), (T2)('-'));
	if (((T73*)(C))->a3) {
		t2 = (T2f1(&(((T73*)(C))->a2)));
		T17f42(GE_void(R), t2);
	} else {
		l1 = ((T73*)(C))->a4;
		T17f38(GE_void(R), (T2)('-'));
		T17f42(GE_void(R), l1);
	}
	t1 = ((T1)(!(((T73*)(C))->a6)));
	if (t1) {
		T17f38(GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_STRING_OPTION.example */
T0* T37f20(T0* C)
{
	T1 t1;
	T0* R = 0;
	T0* l1 = 0;
	R = T17c37((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T37*)(C))->a8)));
	if (t1) {
		T17f38(GE_void(R), (T2)('['));
	}
	T17f38(GE_void(R), (T2)('-'));
	if (((T37*)(C))->a6) {
		T17f38(GE_void(R), ((T37*)(C))->a5);
		T17f38(GE_void(R), (T2)(' '));
		T17f42(GE_void(R), ((T37*)(C))->a3);
	} else {
		T17f38(GE_void(R), (T2)('-'));
		l1 = ((T37*)(C))->a7;
		T17f42(GE_void(R), l1);
		t1 = ((T1)(!(((T37*)(C))->a4)));
		if (t1) {
			T17f38(GE_void(R), (T2)('['));
		}
		T17f38(GE_void(R), (T2)('='));
		T17f42(GE_void(R), ((T37*)(C))->a3);
		t1 = ((T1)(!(((T37*)(C))->a4)));
		if (t1) {
			T17f38(GE_void(R), (T2)(']'));
		}
	}
	t1 = ((T1)(!(((T37*)(C))->a8)));
	if (t1) {
		T17f38(GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_FLAG.example */
T0* T35f17(T0* C)
{
	T1 t1;
	T0* t2;
	T0* R = 0;
	T0* l1 = 0;
	R = T17c37((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T35*)(C))->a6)));
	if (t1) {
		T17f38(GE_void(R), (T2)('['));
	}
	T17f38(GE_void(R), (T2)('-'));
	if (((T35*)(C))->a5) {
		t2 = (T2f1(&(((T35*)(C))->a4)));
		T17f42(GE_void(R), t2);
	} else {
		l1 = ((T35*)(C))->a3;
		T17f38(GE_void(R), (T2)('-'));
		T17f42(GE_void(R), l1);
	}
	t1 = ((T1)(!(((T35*)(C))->a6)));
	if (t1) {
		T17f38(GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.has_long_form */
T1 T73f10(T0* C)
{
	T1 R = 0;
	R = ((((T73*)(C))->a4)!=(EIF_VOID));
	return R;
}

/* AP_STRING_OPTION.has_long_form */
T1 T37f12(T0* C)
{
	T1 R = 0;
	R = ((((T37*)(C))->a7)!=(EIF_VOID));
	return R;
}

/* AP_FLAG.has_long_form */
T1 T35f10(T0* C)
{
	T1 R = 0;
	R = ((((T35*)(C))->a3)!=(EIF_VOID));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.found */
T1 T34f34(T0* C)
{
	T1 R = 0;
	R = (((((((T34*)(C))->a9) != ((T6)(GE_int32(0)))))));
	return R;
}

/* GEANT_VARIABLES.found */
T1 T29f36(T0* C)
{
	T1 R = 0;
	R = (((((((T29*)(C))->a9) != ((T6)(GE_int32(0)))))));
	return R;
}

/* GEANT_PROJECT_VARIABLES.found */
T1 T25f44(T0* C)
{
	T1 R = 0;
	R = (((((((T25*)(C))->a10) != ((T6)(GE_int32(0)))))));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.found_item */
T0* T34f44(T0* C)
{
	T0* R = 0;
	R = (T34f41(C, ((T34*)(C))->a9));
	return R;
}

/* GEANT_VARIABLES.found_item */
T0* T29f44(T0* C)
{
	T0* R = 0;
	R = (T29f35(C, ((T29*)(C))->a9));
	return R;
}

/* GEANT_PROJECT_VARIABLES.found_item */
T0* T25f53(T0* C)
{
	T0* R = 0;
	R = (T25f50(C, ((T25*)(C))->a10));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.after */
T1 T34f45(T0* C)
{
	T1 R = 0;
	R = (T34f36(C, ((T34*)(C))->a19));
	return R;
}

/* GEANT_VARIABLES.after */
T1 T29f45(T0* C)
{
	T1 R = 0;
	R = (T29f38(C, ((T29*)(C))->a19));
	return R;
}

/* GEANT_PROJECT_VARIABLES.after */
T1 T25f56(T0* C)
{
	T1 R = 0;
	R = (T25f46(C, ((T25*)(C))->a19));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.key_for_iteration */
T0* T34f46(T0* C)
{
	T0* R = 0;
	R = (T34f38(C, ((T34*)(C))->a19));
	return R;
}

/* GEANT_VARIABLES.key_for_iteration */
T0* T29f46(T0* C)
{
	T0* R = 0;
	R = (T29f40(C, ((T29*)(C))->a19));
	return R;
}

/* GEANT_PROJECT_VARIABLES.key_for_iteration */
T0* T25f57(T0* C)
{
	T0* R = 0;
	R = (T25f48(C, ((T25*)(C))->a19));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.item_for_iteration */
T0* T34f47(T0* C)
{
	T0* R = 0;
	R = (T34f37(C, ((T34*)(C))->a19));
	return R;
}

/* GEANT_VARIABLES.item_for_iteration */
T0* T29f47(T0* C)
{
	T0* R = 0;
	R = (T29f39(C, ((T29*)(C))->a19));
	return R;
}

/* GEANT_PROJECT_VARIABLES.item_for_iteration */
T0* T25f58(T0* C)
{
	T0* R = 0;
	R = (T25f47(C, ((T25*)(C))->a19));
	return R;
}

/* GEANT_ARGUMENT_VARIABLES.has */
T1 T34f33(T0* C, T0* a1)
{
	T1 R = 0;
	T34f53(C, a1);
	R = (((((((T34*)(C))->a1) != ((T6)(GE_int32(0)))))));
	return R;
}

/* GEANT_VARIABLES.has */
T1 T29f32(T0* C, T0* a1)
{
	T1 R = 0;
	T29f54(C, a1);
	R = (((((((T29*)(C))->a1) != ((T6)(GE_int32(0)))))));
	return R;
}

/* GEANT_PROJECT_VARIABLES.has */
T1 T25f55(T0* C, T0* a1)
{
	T1 R = 0;
	T25f66(C, a1);
	R = (((((((T25*)(C))->a3) != ((T6)(GE_int32(0)))))));
	return R;
}

/* FILE_NAME.to_c */
T0* T659f6(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = ((T659*)(C))->a3;
	((T15*)(GE_void(l1)))->z2[((T659*)(C))->a1] = ((T2)('\000'));
	R = l1;
	return R;
}

/* UC_UTF8_STRING.to_c */
T0* T205f21(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = ((T205*)(C))->a2;
	((T15*)(GE_void(l1)))->z2[((T205*)(C))->a1] = ((T2)('\000'));
	R = l1;
	return R;
}

/* STRING_8.to_c */
T0* T17f12(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = ((T17*)(C))->a1;
	((T15*)(GE_void(l1)))->z2[((T17*)(C))->a2] = ((T2)('\000'));
	R = l1;
	return R;
}

T0* GE_ma33(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new32(c, EIF_FALSE);
	*(T32*)t1 = GE_default32;
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

T0* GE_ma108(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new63(c, EIF_FALSE);
	*(T63*)t1 = GE_default63;
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
	R = GE_new108(EIF_TRUE);
	((T108*)(R))->a1 = t1;
	((T108*)(R))->a2 = 1;
	((T108*)(R))->a3 = c;
	return R;
}

T0* GE_ma179(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new178(c, EIF_FALSE);
	*(T178*)t1 = GE_default178;
	((T178*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T178*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new179(EIF_TRUE);
	((T179*)(R))->a1 = t1;
	((T179*)(R))->a2 = 1;
	((T179*)(R))->a3 = c;
	return R;
}

T0* GE_ma614(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new613(c, EIF_FALSE);
	*(T613*)t1 = GE_default613;
	((T613*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T613*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new614(EIF_TRUE);
	((T614*)(R))->a1 = t1;
	((T614*)(R))->a2 = 1;
	((T614*)(R))->a3 = c;
	return R;
}

T0* GE_ma244(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new155(c, EIF_FALSE);
	*(T155*)t1 = GE_default155;
	((T155*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T1 *i = ((T155*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = (T1)va_arg(v, int);
		}
		va_end(v);
	}
	R = GE_new244(EIF_TRUE);
	((T244*)(R))->a1 = t1;
	((T244*)(R))->a2 = 1;
	((T244*)(R))->a3 = c;
	return R;
}

T0* ge132ov5277;
T0* ge168ov2883;
T0* ge222ov6448;
T0* ge232ov7776;
T0* ge153ov9386;
T0* ge155ov3994;
T0* ge170ov2883;
T0* ge176ov4038;
T0* ge176ov4039;
T0* ge161ov4305;
T0* ge161ov4304;
T0* ge173ov4038;
T0* ge173ov4039;
T0* ge1531ov5402;
T0* ge1531ov5401;
T0* ge317ov10535;
T0* ge159ov2883;
T0* ge1384ov2868;
T0* ge446ov9591;
T0* ge154ov4196;
T0* ge489ov9291;
T0* ge268ov2883;
T0* ge1538ov5843;
T0* ge1538ov5805;
T0* ge1538ov5803;
T0* ge1538ov5844;
T0* ge1538ov5816;
T0* ge1538ov5815;
T0* ge1538ov5826;
T0* ge1538ov5820;
T0* ge1538ov5819;
T0* ge1538ov5818;
T0* ge1538ov5824;
T0* ge1538ov5823;
T0* ge1538ov5825;
T0* ge1538ov5802;
T0* ge1538ov5828;
T0* ge1538ov5837;
T0* ge1541ov5538;
T0* ge1541ov5536;
T0* ge1541ov5537;
T0* ge1538ov5838;
T0* ge1538ov5839;
T0* ge1538ov5842;
T0* ge1538ov5840;
T0* ge1538ov5841;
T0* ge1538ov5835;
T0* ge1534ov7167;
T0* ge1534ov7168;
T0* ge1538ov5808;
T0* ge1538ov5831;
T0* ge1538ov5851;
T0* ge1538ov5852;
T0* ge1538ov5853;
T0* ge1538ov5846;
T0* ge1538ov5829;
T0* ge1538ov5830;
T0* ge1538ov5832;
T0* ge1538ov5836;
T0* ge176ov4049;
T0* ge173ov4049;
T0* ge103ov2567;
T0* ge106ov2850;
T0* ge106ov2857;
T0* ge192ov1748;
T0* ge106ov2853;
T0* ge106ov2860;
T0* ge106ov2851;
T0* ge106ov2858;
T0* ge106ov2852;
T0* ge106ov2859;
T0* ge106ov2854;
T0* ge106ov2861;
T0* ge106ov2855;
T0* ge106ov2862;
T0* ge103ov2562;
T0* ge103ov2561;
T0* ge103ov2569;
T0* ge103ov2568;
T0* ge450ov11074;
T0* ge450ov11111;
T0* ge450ov11096;
T0* ge450ov11089;
T0* ge450ov11099;
T0* ge450ov11092;
T0* ge450ov11100;
T0* ge450ov11109;
T0* ge450ov11102;
T0* ge450ov11098;
T0* ge450ov11086;
T0* ge450ov11087;
T0* ge450ov11101;
T0* ge450ov11088;
T0* ge450ov11075;
T0* ge450ov11076;
T0* ge450ov11077;
T0* ge450ov11083;
T0* ge450ov11085;
T0* ge450ov11080;
T0* ge450ov11105;
T0* ge450ov11104;
T0* ge450ov11081;
T0* ge450ov11082;
T0* ge450ov11079;
T0* ge450ov11078;
T0* ge42ov8846;
T0* ge156ov4176;
T0* ge154ov4198;
T0* ge153ov9385;
T0* ge1545ov6666;
T0* ge1545ov6667;
T0* ge1536ov7784;
T0* ge1536ov7786;
T0* ge1488ov6141;
T0* ge1469ov7488;
T0* ge1469ov7489;
T0* ge104ov5229;
T0* ge104ov5230;
T0* ge104ov5231;
T0* ge104ov5228;
T0* ge1536ov7783;
T0* ge1536ov7785;
T0* ge302ov2866;
T0* ge288ov2866;
T0* ge294ov2866;
T0* ge293ov2866;
T0* ge292ov2866;
T0* ge283ov2866;
T0* ge282ov2866;
T0* ge299ov2866;
T0* ge312ov2866;
T0* ge1388ov2866;
T0* ge1393ov2866;

void GE_const_init()
{
	ge132ov5277 = (GE_ms8("", 0));
	ge168ov2883 = (GE_ms8("\n", 1));
	ge222ov6448 = (GE_ms8("", 0));
	ge232ov7776 = (GE_ms8("", 0));
	ge153ov9386 = (GE_ms8("", 0));
	ge155ov3994 = (GE_ms8("dummy", 5));
	ge170ov2883 = (GE_ms8("\n", 1));
	ge176ov4038 = (GE_ms8(".", 1));
	ge176ov4039 = (GE_ms8("..", 2));
	ge161ov4305 = (GE_ms8("..", 2));
	ge161ov4304 = (GE_ms8(".", 1));
	ge173ov4038 = (GE_ms8(".", 1));
	ge173ov4039 = (GE_ms8("..", 2));
	ge1531ov5402 = (GE_ms8("undefined", 9));
	ge1531ov5401 = (GE_ms8("(TRUNCATED)", 11));
	ge317ov10535 = (GE_ms8("standard input", 14));
	ge159ov2883 = (GE_ms8("\n", 1));
	ge1384ov2868 = (GE_ms8("", 0));
	ge446ov9591 = (GE_ms8("", 0));
	ge154ov4196 = (GE_ms8("empty_name", 10));
	ge489ov9291 = (GE_ms8(" \t\r\n", 4));
	ge268ov2883 = (GE_ms8("\n", 1));
	ge1538ov5843 = (GE_ms8("PE reference only allowed in DTD", 32));
	ge1538ov5805 = (GE_ms8("< not allowed in attribute value", 32));
	ge1538ov5803 = (GE_ms8("-- not allowed in comment", 25));
	ge1538ov5844 = (GE_ms8("xml prefix reserved in processing instruction", 45));
	ge1538ov5816 = (GE_ms8("Misformed XML Declaration", 25));
	ge1538ov5815 = (GE_ms8("Misplaced markup declaration", 28));
	ge1538ov5826 = (GE_ms8("End tag does not match start tag", 32));
	ge1538ov5820 = (GE_ms8("Missing element end tag", 23));
	ge1538ov5819 = (GE_ms8("Error in element content", 24));
	ge1538ov5818 = (GE_ms8("Misformed start tag", 19));
	ge1538ov5824 = (GE_ms8("Attribute declared twice", 24));
	ge1538ov5823 = (GE_ms8("Misformed attribute in tag", 26));
	ge1538ov5825 = (GE_ms8("Error in end tag", 16));
	ge1538ov5802 = (GE_ms8("]]> not allowed in content", 26));
	ge1538ov5828 = (GE_ms8("Error in XML declaration", 24));
	ge1538ov5837 = (GE_ms8("Misformed element type declaration", 34));
	ge1541ov5538 = (GE_ms8("*", 1));
	ge1541ov5536 = (GE_ms8("+", 1));
	ge1541ov5537 = (GE_ms8("\?", 1));
	ge1538ov5838 = (GE_ms8("Misformed attribute list declaration", 36));
	ge1538ov5839 = (GE_ms8("Misformed attribute definition declaration", 42));
	ge1538ov5842 = (GE_ms8("Misformed conditional section", 29));
	ge1538ov5840 = (GE_ms8("Misformed entity declaration", 28));
	ge1538ov5841 = (GE_ms8("Misformed entity notation", 25));
	ge1538ov5835 = (GE_ms8("Parser is not configured to support external DTDs", 49));
	ge1534ov7167 = (GE_ms8("1.0", 3));
	ge1534ov7168 = (GE_ms8("utf-8", 5));
	ge1538ov5808 = (GE_ms8("unsupported character encoding", 30));
	ge1538ov5831 = (GE_ms8("External reference in quoted value", 34));
	ge1538ov5851 = (GE_ms8("Unexpected non-ASCII character in ASCII-only mode", 49));
	ge1538ov5852 = (GE_ms8("Unexpected non-latin1 character in latin1-only mode", 51));
	ge1538ov5853 = (GE_ms8("Invalid UTF8 character sequence", 31));
	ge1538ov5846 = (GE_ms8("Name misformed", 14));
	ge1538ov5829 = (GE_ms8("Literal entity expected in attribute", 36));
	ge1538ov5830 = (GE_ms8("Entity is not defined", 21));
	ge1538ov5832 = (GE_ms8("Entity cannot be recursively included", 37));
	ge1538ov5836 = (GE_ms8("Undefined PE entity", 19));
	ge176ov4049 = (GE_ms8(".exe", 4));
	ge173ov4049 = (GE_ms8("", 0));
	ge103ov2567 = (GE_ms8("Errors parsing arguments, aborting.", 35));
	ge106ov2850 = (GE_ms8("The value \'$2\' is not valid for the option \'$1\'.", 48));
	ge106ov2857 = (GE_ms8("APIPAR", 6));
	ge192ov1748 = (GE_ms8("3.9", 3));
	ge106ov2853 = (GE_ms8("Too many occurrences of option \'$1\'.", 36));
	ge106ov2860 = (GE_ms8("APSOPT", 6));
	ge106ov2851 = (GE_ms8("The mandatory option \'$1\' is missing.", 37));
	ge106ov2858 = (GE_ms8("APMOPT", 6));
	ge106ov2852 = (GE_ms8("The option \'$1\' is missing a parameter.", 39));
	ge106ov2859 = (GE_ms8("APMPAR", 6));
	ge106ov2854 = (GE_ms8("Unknown option \'$1\'.", 20));
	ge106ov2861 = (GE_ms8("APUOPT", 6));
	ge106ov2855 = (GE_ms8("The flag \'$1\' was given the parameter \'$2\'.", 43));
	ge106ov2862 = (GE_ms8("APUPAR", 6));
	ge103ov2562 = (GE_ms8("help", 4));
	ge103ov2561 = (GE_ms8("Display this help text.", 23));
	ge103ov2569 = (GE_ms8("parameters ...", 14));
	ge103ov2568 = (GE_ms8("", 0));
	ge450ov11074 = (GE_ms8("compilation successfully", 24));
	ge450ov11111 = (GE_ms8("no pattern compiled", 19));
	ge450ov11096 = (GE_ms8("unmatched parentheses", 21));
	ge450ov11089 = (GE_ms8("back reference to non-existent subpattern", 41));
	ge450ov11099 = (GE_ms8("lookbehind assertion is not fixed length", 40));
	ge450ov11092 = (GE_ms8("missing ) after comment", 23));
	ge450ov11100 = (GE_ms8("malformed number after (\?(", 26));
	ge450ov11109 = (GE_ms8("invalid condition (\?(0)", 23));
	ge450ov11102 = (GE_ms8("assertion expected after (\?(", 28));
	ge450ov11098 = (GE_ms8("unrecognized character after (\?<", 32));
	ge450ov11086 = (GE_ms8("unrecognized character after (\?", 31));
	ge450ov11087 = (GE_ms8("too many capturing parenthesized sub-patterns", 45));
	ge450ov11101 = (GE_ms8("conditional group contains more than two branches", 49));
	ge450ov11088 = (GE_ms8("missing )", 9));
	ge450ov11075 = (GE_ms8("\\ at end of pattern", 19));
	ge450ov11076 = (GE_ms8("\\c at end of pattern", 20));
	ge450ov11077 = (GE_ms8("unrecognized character follows \\", 32));
	ge450ov11083 = (GE_ms8("nothing to repeat", 17));
	ge450ov11085 = (GE_ms8("internal error: unexpected repeat", 33));
	ge450ov11080 = (GE_ms8("missing terminating ] for character class", 41));
	ge450ov11105 = (GE_ms8("POSIX collating elements are not supported", 42));
	ge450ov11104 = (GE_ms8("unknown POSIX class name", 24));
	ge450ov11081 = (GE_ms8("invalid escape sequence in character class", 42));
	ge450ov11082 = (GE_ms8("range out of order in character class", 37));
	ge450ov11079 = (GE_ms8("number too big in {} quantifier", 31));
	ge450ov11078 = (GE_ms8("numbers out of order in {} quantifier", 37));
	ge42ov8846 = (GE_ms8("_dummy_", 7));
	ge156ov4176 = (GE_ms8("", 0));
	ge154ov4198 = (GE_ms8("dummy", 5));
	ge153ov9385 = (GE_ms8("dummy", 5));
	ge1545ov6666 = (GE_ms8(" ", 1));
	ge1545ov6667 = (GE_ms8("  ", 2));
	ge1536ov7784 = (GE_ms8("iso-8859-1", 10));
	ge1536ov7786 = (GE_ms8("utf-16", 6));
	ge1488ov6141 = (GE_ms8("root", 4));
	ge1469ov7488 = (GE_ms8("Undeclared namespace error", 26));
	ge1469ov7489 = (GE_ms8("Namespace declared twice", 24));
	ge104ov5229 = (GE_ms8("\n", 1));
	ge104ov5230 = (GE_ms8("\n", 1));
	ge104ov5231 = (GE_ms8("\nOptions:\n", 10));
	ge104ov5228 = (GE_ms8("usage: ", 7));
	ge1536ov7783 = (GE_ms8("us-ascii", 8));
	ge1536ov7785 = (GE_ms8("utf-8", 5));
	ge302ov2866 = (GE_ms8("\"$1\", line $2: negative range in character class", 48));
	ge288ov2866 = (GE_ms8("\"$1\", line $2: character \'$3\' out of range", 42));
	ge294ov2866 = (GE_ms8("$0: variable trailing context rules cannot be used with -f", 58));
	ge293ov2866 = (GE_ms8("$0: `reject\' cannot be used with -f", 35));
	ge292ov2866 = (GE_ms8("$0: -f and -m don\'t make sense together", 39));
	ge283ov2866 = (GE_ms8("\"$1\", line $2: bad character: $3", 32));
	ge282ov2866 = (GE_ms8("\"$1\", line $2: bad character class or missing close bracket", 59));
	ge299ov2866 = (GE_ms8("\"$1\", line $2: missing quote", 28));
	ge312ov2866 = (GE_ms8("\"$1\", line $2: unrecognized rule", 32));
	ge1388ov2866 = (GE_ms8("Syntax error in \"$1\" at line $2", 31));
	ge1393ov2866 = (GE_ms8("$0 version $1", 13));
}

EIF_TYPE GE_types[687] = {
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
{0, 55, EIF_FALSE, &T55f57, 0},
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
{0, 78, EIF_FALSE, 0, 0},
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
{0, 111, EIF_TRUE, 0, 0},
{0, 112, EIF_FALSE, 0, 0},
{0, 113, EIF_FALSE, 0, 0},
{0, 114, EIF_TRUE, 0, 0},
{0, 115, EIF_FALSE, 0, 0},
{0, 116, EIF_FALSE, 0, 0},
{0, 117, EIF_FALSE, 0, 0},
{0, 118, EIF_FALSE, 0, 0},
{0, 119, EIF_FALSE, 0, 0},
{0, 120, EIF_FALSE, 0, 0},
{0, 121, EIF_FALSE, 0, 0},
{0, 122, EIF_FALSE, 0, 0},
{0, 123, EIF_FALSE, 0, 0},
{0, 124, EIF_TRUE, 0, 0},
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
{0, 141, EIF_TRUE, 0, 0},
{0, 142, EIF_FALSE, 0, 0},
{0, 143, EIF_FALSE, 0, 0},
{0, 144, EIF_FALSE, 0, 0},
{0, 145, EIF_FALSE, 0, 0},
{0, 146, EIF_FALSE, 0, 0},
{0, 147, EIF_FALSE, 0, 0},
{0, 148, EIF_FALSE, 0, 0},
{0, 149, EIF_FALSE, 0, 0},
{0, 150, EIF_FALSE, 0, 0},
{0, 151, EIF_TRUE, 0, 0},
{0, 152, EIF_FALSE, 0, 0},
{0, 153, EIF_TRUE, 0, 0},
{0, 154, EIF_FALSE, 0, 0},
{0, 155, EIF_TRUE, 0, 0},
{0, 156, EIF_TRUE, 0, 0},
{0, 157, EIF_FALSE, 0, 0},
{0, 158, EIF_FALSE, 0, 0},
{0, 159, EIF_TRUE, 0, 0},
{0, 160, EIF_FALSE, 0, 0},
{0, 161, EIF_TRUE, 0, 0},
{0, 162, EIF_FALSE, 0, 0},
{0, 163, EIF_FALSE, 0, 0},
{0, 164, EIF_TRUE, 0, 0},
{0, 165, EIF_FALSE, 0, 0},
{0, 166, EIF_TRUE, 0, 0},
{0, 167, EIF_FALSE, 0, 0},
{0, 168, EIF_FALSE, 0, 0},
{0, 169, EIF_TRUE, 0, 0},
{0, 170, EIF_FALSE, 0, 0},
{0, 171, EIF_FALSE, 0, 0},
{0, 172, EIF_FALSE, 0, 0},
{0, 173, EIF_FALSE, 0, 0},
{0, 174, EIF_FALSE, 0, 0},
{0, 175, EIF_FALSE, 0, 0},
{0, 176, EIF_FALSE, 0, 0},
{0, 177, EIF_FALSE, 0, 0},
{0, 178, EIF_TRUE, 0, 0},
{0, 179, EIF_FALSE, 0, 0},
{0, 180, EIF_FALSE, 0, 0},
{0, 181, EIF_TRUE, 0, 0},
{0, 182, EIF_FALSE, 0, 0},
{0, 183, EIF_TRUE, 0, 0},
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
{0, 226, EIF_TRUE, 0, 0},
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
{0, 255, EIF_TRUE, 0, 0},
{0, 256, EIF_FALSE, 0, 0},
{0, 257, EIF_FALSE, 0, 0},
{0, 258, EIF_FALSE, 0, 0},
{0, 259, EIF_FALSE, 0, 0},
{0, 260, EIF_FALSE, 0, 0},
{0, 261, EIF_FALSE, &T261f8, 0},
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
{0, 319, EIF_TRUE, 0, 0},
{0, 320, EIF_FALSE, 0, 0},
{0, 321, EIF_FALSE, 0, 0},
{0, 322, EIF_FALSE, 0, 0},
{0, 323, EIF_FALSE, 0, 0},
{0, 324, EIF_FALSE, 0, 0},
{0, 325, EIF_FALSE, 0, 0},
{0, 326, EIF_FALSE, 0, 0},
{0, 327, EIF_TRUE, 0, 0},
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
{0, 374, EIF_TRUE, 0, 0},
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
{0, 466, EIF_TRUE, 0, 0},
{0, 467, EIF_TRUE, 0, 0},
{0, 468, EIF_FALSE, 0, 0},
{0, 469, EIF_FALSE, 0, 0},
{0, 470, EIF_FALSE, 0, 0},
{0, 471, EIF_FALSE, 0, 0},
{0, 472, EIF_TRUE, 0, 0},
{0, 473, EIF_FALSE, 0, 0},
{0, 474, EIF_FALSE, 0, 0},
{0, 475, EIF_FALSE, 0, 0},
{0, 476, EIF_FALSE, 0, 0},
{0, 477, EIF_FALSE, 0, 0},
{0, 478, EIF_TRUE, 0, 0},
{0, 479, EIF_FALSE, 0, 0},
{0, 480, EIF_FALSE, 0, 0},
{0, 481, EIF_FALSE, 0, 0},
{0, 482, EIF_FALSE, 0, 0},
{0, 483, EIF_FALSE, 0, 0},
{0, 484, EIF_TRUE, 0, 0},
{0, 485, EIF_FALSE, 0, 0},
{0, 486, EIF_FALSE, 0, 0},
{0, 487, EIF_FALSE, 0, 0},
{0, 488, EIF_FALSE, 0, 0},
{0, 489, EIF_FALSE, &T489f36, 0},
{0, 490, EIF_FALSE, 0, 0},
{0, 491, EIF_FALSE, 0, 0},
{0, 492, EIF_TRUE, 0, 0},
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
{0, 517, EIF_FALSE, &T517f22, 0},
{0, 518, EIF_FALSE, 0, 0},
{0, 519, EIF_FALSE, 0, 0},
{0, 520, EIF_FALSE, 0, 0},
{0, 521, EIF_FALSE, 0, 0},
{0, 522, EIF_FALSE, 0, 0},
{0, 523, EIF_FALSE, 0, 0},
{0, 524, EIF_TRUE, 0, 0},
{0, 525, EIF_FALSE, 0, 0},
{0, 526, EIF_FALSE, 0, 0},
{0, 527, EIF_FALSE, 0, 0},
{0, 528, EIF_FALSE, 0, 0},
{0, 529, EIF_FALSE, 0, 0},
{0, 530, EIF_FALSE, 0, 0},
{0, 531, EIF_FALSE, 0, 0},
{0, 532, EIF_FALSE, 0, 0},
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
{0, 546, EIF_TRUE, 0, 0},
{0, 547, EIF_FALSE, 0, 0},
{0, 548, EIF_FALSE, 0, 0},
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
{0, 580, EIF_FALSE, 0, 0},
{0, 581, EIF_FALSE, 0, 0},
{0, 582, EIF_TRUE, 0, 0},
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
{0, 604, EIF_FALSE, 0, 0},
{0, 605, EIF_FALSE, 0, 0},
{0, 606, EIF_FALSE, 0, 0},
{0, 607, EIF_FALSE, 0, 0},
{0, 608, EIF_FALSE, 0, 0},
{0, 609, EIF_FALSE, 0, 0},
{0, 610, EIF_FALSE, 0, 0},
{0, 611, EIF_FALSE, 0, 0},
{0, 612, EIF_FALSE, 0, 0},
{0, 613, EIF_TRUE, 0, 0},
{0, 614, EIF_FALSE, 0, 0},
{0, 615, EIF_FALSE, 0, 0},
{0, 616, EIF_FALSE, 0, 0},
{0, 617, EIF_TRUE, 0, 0},
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
{0, 630, EIF_FALSE, 0, 0},
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
{0, 643, EIF_FALSE, 0, 0},
{0, 644, EIF_FALSE, 0, 0},
{0, 645, EIF_TRUE, 0, 0},
{0, 646, EIF_FALSE, 0, 0},
{0, 647, EIF_FALSE, 0, 0},
{0, 648, EIF_FALSE, 0, 0},
{0, 649, EIF_FALSE, 0, 0},
{0, 650, EIF_FALSE, 0, 0},
{0, 651, EIF_FALSE, 0, 0},
{0, 652, EIF_FALSE, 0, 0},
{0, 653, EIF_FALSE, 0, 0},
{0, 654, EIF_FALSE, 0, 0},
{0, 655, EIF_FALSE, 0, 0},
{0, 656, EIF_FALSE, &T656f34, 0},
{0, 657, EIF_FALSE, &T657f21, 0},
{0, 658, EIF_FALSE, 0, 0},
{0, 659, EIF_FALSE, 0, 0},
{0, 660, EIF_FALSE, &T660f15, 0},
{0, 661, EIF_FALSE, &T661f15, 0},
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
{0, 680, EIF_FALSE, 0, 0},
{0, 681, EIF_FALSE, 0, 0},
{0, 682, EIF_FALSE, 0, 0},
{0, 683, EIF_FALSE, 0, 0},
{0, 684, EIF_FALSE, 0, 0},
{0, 685, EIF_FALSE, 0, 0},
{0, 686, EIF_TRUE, 0, 0}
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
	struct stat buf;				/* File statistics */
	int status;						/* Status from system call */

	file_stat(name, &buf);				/* Side effect: ensure file exists */

	for (;;) {
		errno = 0;						/* Reset error condition */
		if (buf.st_mode & S_IFDIR)		/* Directory */
			status = rmdir(name);		/* Remove only if empty */
		else
			status = unlink(name);		/* Not a directory */
		if (status == -1) {				/* An error occurred */
			if (errno == EINTR)			/* Interrupted by signal */
				continue;				/* Re-issue system call */
			else
				esys();					/* Raise exception */
		}
		break;
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

		"C functions used to implement class PATH_NAME"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_PATH_NAME_C
#define EIF_PATH_NAME_C

#ifdef EIF_WINDOWS
#include <windows.h>
#endif
#include <string.h>
#include <stdlib.h>

#ifdef __cplusplus
extern "C" {
#endif

EIF_BOOLEAN eif_is_volume_name_valid(EIF_CHARACTER* p) {
#ifdef WIN32
	char rootpath[4];

	if (p)
		if ((strlen((char*)p) == 2) && (*(p+1) == ':')) {
			strncpy((char*)rootpath, (char*)p, 2);
			rootpath[2] = '\\';
			rootpath [3] = '\0';
			return (EIF_BOOLEAN)(GetDriveTypeA(rootpath) != 1);
		}
	return EIF_FALSE;
#else
		/* Unix */
	return (EIF_BOOLEAN)(*p == '\0');
#endif
}

EIF_BOOLEAN eif_is_directory_name_valid(EIF_CHARACTER* p) {
#ifdef EIF_WINDOWS
	return eif_is_file_name_valid(p);
#else
		/* Unix */
	return EIF_TRUE;
#endif
}

void eif_append_directory(EIF_REFERENCE string, EIF_CHARACTER* p, EIF_CHARACTER* v) {
	if (*((char*)p) != '\0')
#ifdef EIF_WINDOWS
		strcat((char*)p, "\\");
#else /* Unix */
		strcat((char*)p, "/");
#endif
	strcat((char*)p, (char*)v);
}

void eif_set_directory(EIF_REFERENCE string, EIF_CHARACTER* p, EIF_CHARACTER* v) {
#ifdef WIN32
	strcat((char*)p, (char*)v);
#else /* Unix */
	if (*((char*)v) != '/' )
		strcat((char*)p, "/");
	strcat((char*)p, (char*)v);
#endif
}

EIF_BOOLEAN eif_path_name_compare(EIF_CHARACTER* s, EIF_CHARACTER* t, EIF_INTEGER length) {
#ifdef EIF_WINDOWS
	return EIF_TEST(!strnicmp((char*)s, (char*)t, length));
#else /* Unix */
	return EIF_TEST(!strncmp((char*)s, (char*)t, length));
#endif
}

EIF_REFERENCE eif_volume_name(EIF_CHARACTER* p) {
#ifdef EIF_WINDOWS
	/* To be implemented */
#else /* Unix */
	/* To be implemented */
#endif
	return EIF_VOID;
}

EIF_REFERENCE eif_extracted_paths(EIF_CHARACTER* p) {
#ifdef EIF_WINDOWS
	/* To be implemented */
#else /* Unix */
	/* To be implemented */
#endif
	return EIF_VOID;
}

void eif_append_file_name(EIF_REFERENCE string, EIF_CHARACTER* p, EIF_CHARACTER* v) {
	if (*((char*)p) == '\0'){
		strcat((char*)p, (char*)v);
	} else {
#ifdef EIF_WINDOWS
		if (p[strlen((char*)p) - 1] != '\\')
			strcat((char*)p, "\\");
#else /* Not Windows: append unix delimiter */
		if (p[strlen((char*)p) - 1] != '/')
			strcat((char *)p, "/");
#endif
		strcat((char*)p, (char*)v);
	}
}

EIF_BOOLEAN eif_is_file_name_valid(EIF_CHARACTER* p) {
#ifdef EIF_WINDOWS
	return EIF_TRUE;
#else /* Unix */
	return EIF_TRUE;
#endif
}

EIF_BOOLEAN eif_is_extension_valid(EIF_CHARACTER* p) {
	return EIF_TRUE;
}

EIF_BOOLEAN eif_is_file_valid(EIF_CHARACTER* p) {
	return EIF_TRUE;
}

EIF_BOOLEAN eif_is_directory_valid(EIF_CHARACTER* p) {
	return EIF_TRUE;
}

EIF_BOOLEAN eif_home_dir_supported(void) {
#ifdef WIN32
	return EIF_FALSE;
#else
	return EIF_TRUE;
#endif
}

EIF_BOOLEAN eif_root_dir_supported(void) {
	return EIF_TRUE;
}

EIF_BOOLEAN eif_case_sensitive_path_names(void) {
#ifdef EIF_WINDOWS
	return EIF_FALSE;
#else /* Unix */
	return EIF_TRUE;
#endif
}

EIF_REFERENCE eif_current_dir_representation(void) {
	return GE_ms8(".", 1);
}

EIF_REFERENCE eif_home_directory_name(void) {
#ifdef WIN32
	return EIF_VOID;
#else
	char* s = getenv("HOME");
	return GE_ms8(s, strlen(s));
#endif
}

EIF_REFERENCE eif_root_directory_name(void) {
#ifdef EIF_WINDOWS
	return GE_ms8("\\", 1);
#else
	return GE_ms8("/", 1);
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
