#include "gexace.h"

#ifdef __cplusplus
extern "C" {
#endif

/* XM_EIFFEL_SCANNER.error_position */
T0* T174f63(T0* C)
{
	T0* R = 0;
	R = T175c7(((T174*)(C))->a3, ((T174*)(C))->a4, ((T174*)(C))->a5, ((T174*)(C))->a6);
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.end_of_file */
T1 T217f60(T0* C)
{
	T1 R = 0;
	R = ((((T217*)(C))->a43)==((T6)(GE_int32(0))));
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.end_of_file */
T1 T215f61(T0* C)
{
	T1 R = 0;
	R = ((((T215*)(C))->a1)==((T6)(GE_int32(0))));
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.end_of_file */
T1 T211f59(T0* C)
{
	T1 R = 0;
	R = ((((T211*)(C))->a41)==((T6)(GE_int32(0))));
	return R;
}

/* XM_EIFFEL_SCANNER.end_of_file */
T1 T174f65(T0* C)
{
	T1 R = 0;
	R = ((((T174*)(C))->a1)==((T6)(GE_int32(0))));
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.is_applicable_encoding */
T1 T217f61(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	t1 = (T240f9(GE_void(((T217*)(C))->a45), a1));
	if (t1) {
		R = (T240f16(GE_void(((T217*)(C))->a45), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.is_applicable_encoding */
T1 T240f16(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	T0* t2;
	t1 = ((((T240*)(C))->a2)==((T6)(GE_int32(6))));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T240f17(C));
		t1 = (T51f11(GE_void(t2), a1, ge1328ov8867));
		if (!(t1)) {
			t2 = (T240f17(C));
			t1 = (T51f11(GE_void(t2), a1, ge1328ov8866));
		}
		if (t1) {
			t1 = ((((T240*)(C))->a2)==((T6)(GE_int32(2))));
			if (!(t1)) {
				t1 = ((((T240*)(C))->a2)==((T6)(GE_int32(1))));
			}
			if (!(t1)) {
				R = ((((T240*)(C))->a2)==((T6)(GE_int32(3))));
			} else {
				R = EIF_TRUE;
			}
		} else {
			t2 = (T240f17(C));
			t1 = (T51f11(GE_void(t2), a1, ge1328ov8868));
			if (t1) {
				t1 = ((((T240*)(C))->a2)==((T6)(GE_int32(2))));
				if (!(t1)) {
					R = ((((T240*)(C))->a2)==((T6)(GE_int32(1))));
				} else {
					R = EIF_TRUE;
				}
			} else {
				t2 = (T240f17(C));
				t1 = (T51f11(GE_void(t2), a1, ge1328ov8869));
				if (t1) {
					t1 = ((((T240*)(C))->a2)==((T6)(GE_int32(4))));
					if (!(t1)) {
						R = ((((T240*)(C))->a2)==((T6)(GE_int32(5))));
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
T1 T240f9(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	T0* t2;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T240f17(C));
		t1 = (T51f11(GE_void(t2), a1, ge1328ov8867));
		if (!(t1)) {
			t2 = (T240f17(C));
			t1 = (T51f11(GE_void(t2), a1, ge1328ov8866));
		}
		if (!(t1)) {
			t2 = (T240f17(C));
			t1 = (T51f11(GE_void(t2), a1, ge1328ov8868));
		}
		if (!(t1)) {
			t2 = (T240f17(C));
			R = (T51f11(GE_void(t2), a1, ge1328ov8869));
		} else {
			R = EIF_TRUE;
		}
	}
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.is_applicable_encoding */
T1 T215f48(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	t1 = (T240f9(GE_void(((T215*)(C))->a7), a1));
	if (t1) {
		R = (T240f16(GE_void(((T215*)(C))->a7), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.is_applicable_encoding */
T1 T211f60(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	t1 = (T240f9(GE_void(((T211*)(C))->a43), a1));
	if (t1) {
		R = (T240f16(GE_void(((T211*)(C))->a43), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_EIFFEL_SCANNER.is_applicable_encoding */
T1 T174f66(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	t1 = (T240f9(GE_void(((T174*)(C))->a7), a1));
	if (t1) {
		R = (T240f16(GE_void(((T174*)(C))->a7), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.start_condition */
T6 T217f62(T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = ((T6)((((T217*)(C))->a11)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.start_condition */
T6 T215f50(T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = ((T6)((((T215*)(C))->a8)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.start_condition */
T6 T211f61(T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = ((T6)((((T211*)(C))->a11)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* XM_EIFFEL_SCANNER.start_condition */
T6 T174f43(T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = ((T6)((((T174*)(C))->a8)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* ET_XACE_XACE_VE_GENERATOR.default_system_output_filename */
unsigned char ge1159os2505 = '\0';
T0* ge1159ov2505;
T0* T49f5(T0* C)
{
	T0* R = 0;
	if (ge1159os2505) {
		return ge1159ov2505;
	} else {
		ge1159os2505 = '\1';
		ge1159ov2505 = R;
	}
	R = (T17f17(GE_void(((T49*)(C))->a1), GE_ms(".xace", 5)));
	ge1159ov2505 = R;
	return R;
}

/* ET_XACE_ACE_SE_GENERATOR.default_system_output_filename */
unsigned char ge1154os2505 = '\0';
T0* ge1154ov2505;
T0* T48f5(T0* C)
{
	T0* R = 0;
	if (ge1154os2505) {
		return ge1154ov2505;
	} else {
		ge1154os2505 = '\1';
		ge1154ov2505 = R;
	}
	R = (T17f17(GE_void(((T48*)(C))->a1), GE_ms(".ace", 4)));
	ge1154ov2505 = R;
	return R;
}

/* ET_XACE_ESD_GENERATOR.default_system_output_filename */
unsigned char ge1156os2505 = '\0';
T0* ge1156ov2505;
T0* T46f5(T0* C)
{
	T0* R = 0;
	if (ge1156os2505) {
		return ge1156ov2505;
	} else {
		ge1156os2505 = '\1';
		ge1156ov2505 = R;
	}
	R = (T17f17(GE_void(((T46*)(C))->a1), GE_ms(".esd", 4)));
	ge1156ov2505 = R;
	return R;
}

/* ET_XACE_ECF_GENERATOR.default_system_output_filename */
unsigned char ge1155os2505 = '\0';
T0* ge1155ov2505;
T0* T45f5(T0* C)
{
	T0* R = 0;
	if (ge1155os2505) {
		return ge1155ov2505;
	} else {
		ge1155os2505 = '\1';
		ge1155ov2505 = R;
	}
	R = (T17f17(GE_void(((T45*)(C))->a1), GE_ms(".ecf", 4)));
	ge1155ov2505 = R;
	return R;
}

/* ET_XACE_ACE_GENERATOR.default_system_output_filename */
unsigned char ge1153os2505 = '\0';
T0* ge1153ov2505;
T0* T44f5(T0* C)
{
	T0* R = 0;
	if (ge1153os2505) {
		return ge1153ov2505;
	} else {
		ge1153os2505 = '\1';
		ge1153ov2505 = R;
	}
	R = (T17f17(GE_void(((T44*)(C))->a1), GE_ms(".ace", 4)));
	ge1153ov2505 = R;
	return R;
}

/* ET_XACE_XACE_GENERATOR.default_system_output_filename */
T0* T43f5(T0* C)
{
	T0* R = 0;
	if (ge1159os2505) {
		return ge1159ov2505;
	} else {
		ge1159os2505 = '\1';
		ge1159ov2505 = R;
	}
	R = (T17f17(GE_void(((T43*)(C))->a1), GE_ms(".xace", 5)));
	ge1159ov2505 = R;
	return R;
}

/* ET_XACE_XACE_VE_GENERATOR.default_library_output_filename */
unsigned char ge1159os2506 = '\0';
T0* ge1159ov2506;
T0* T49f6(T0* C)
{
	T0* R = 0;
	if (ge1159os2506) {
		return ge1159ov2506;
	} else {
		ge1159os2506 = '\1';
		ge1159ov2506 = R;
	}
	R = (T17f17(GE_void(((T49*)(C))->a1), GE_ms(".xace", 5)));
	ge1159ov2506 = R;
	return R;
}

/* ET_XACE_ACE_SE_GENERATOR.default_library_output_filename */
unsigned char ge1154os2506 = '\0';
T0* ge1154ov2506;
T0* T48f6(T0* C)
{
	T0* R = 0;
	if (ge1154os2506) {
		return ge1154ov2506;
	} else {
		ge1154os2506 = '\1';
		ge1154ov2506 = R;
	}
	R = (T17f17(GE_void(((T48*)(C))->a1), GE_ms(".ace", 4)));
	ge1154ov2506 = R;
	return R;
}

/* ET_XACE_ESD_GENERATOR.default_library_output_filename */
unsigned char ge1156os2506 = '\0';
T0* ge1156ov2506;
T0* T46f6(T0* C)
{
	T0* R = 0;
	if (ge1156os2506) {
		return ge1156ov2506;
	} else {
		ge1156os2506 = '\1';
		ge1156ov2506 = R;
	}
	R = (T17f17(GE_void(((T46*)(C))->a1), GE_ms(".eld", 4)));
	ge1156ov2506 = R;
	return R;
}

/* ET_XACE_ECF_GENERATOR.default_library_output_filename */
unsigned char ge1155os2506 = '\0';
T0* ge1155ov2506;
T0* T45f6(T0* C)
{
	T0* R = 0;
	if (ge1155os2506) {
		return ge1155ov2506;
	} else {
		ge1155os2506 = '\1';
		ge1155ov2506 = R;
	}
	R = (T17f17(GE_void(((T45*)(C))->a1), GE_ms(".ecf", 4)));
	ge1155ov2506 = R;
	return R;
}

/* ET_XACE_ACE_GENERATOR.default_library_output_filename */
unsigned char ge1153os2506 = '\0';
T0* ge1153ov2506;
T0* T44f6(T0* C)
{
	T0* R = 0;
	if (ge1153os2506) {
		return ge1153ov2506;
	} else {
		ge1153os2506 = '\1';
		ge1153ov2506 = R;
	}
	R = (T17f17(GE_void(((T44*)(C))->a1), GE_ms(".ace", 4)));
	ge1153ov2506 = R;
	return R;
}

/* ET_XACE_XACE_GENERATOR.default_library_output_filename */
T0* T43f6(T0* C)
{
	T0* R = 0;
	if (ge1159os2506) {
		return ge1159ov2506;
	} else {
		ge1159os2506 = '\1';
		ge1159ov2506 = R;
	}
	R = (T17f17(GE_void(((T43*)(C))->a1), GE_ms(".xace", 5)));
	ge1159ov2506 = R;
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.default_message */
T0* T361f5(T0* C)
{
	T0* R = 0;
	R = (T361f3(C, ge1142ov2483));
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.message */
T0* T361f3(T0* C, T0* a1)
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
	t1 = (T361f4(C));
	R = (T51f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f11(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T239f55(R, l5);
				}
			} else {
				t1 = (T361f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T51f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T239f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f11(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T239f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T361f4(C));
					l1 = (T51f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T239f55(l1, l5);
									}
								} else {
									t1 = (T361f4(C));
									T51f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
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
									T17f36(l1, l5);
								} else {
									T239f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f14(l1):T239f26(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f15(l1):T239f27(l1)));
						t2 = (T67f4(GE_void(((T361*)(C))->a1), l3));
						if (t2) {
							t1 = (T361f4(C));
							t5 = (T67f5(GE_void(((T361*)(C))->a1), l3));
							R = (T51f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T361f4(C));
								t5 = (T361f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T51f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T239f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T239f55(R, (T2)('{'));
									}
								}
								t1 = (T361f4(C));
								R = (T51f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T239f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T239f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T239f55(R, (T2)('{'));
							}
						}
						t1 = (T361f4(C));
						R = (T51f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T239f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f4(&l2, l4));
	}
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.arguments */
T0* T361f6(T0* C)
{
	T0* R = 0;
	if (ge132os1719) {
		return ge132ov1719;
	} else {
		ge132os1719 = '\1';
		ge132ov1719 = R;
	}
	R = T23c4();
	ge132ov1719 = R;
	return R;
}

/* ARRAY [STRING_8].valid_index */
T1 T67f4(T0* C, T6 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = (T6f6(&(((T67*)(C))->a2), a1));
	if (t1) {
		R = (T6f6(&a1, ((T67*)(C))->a3));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.string_ */
T0* T361f4(T0* C)
{
	T0* R = 0;
	if (ge86os1720) {
		return ge86ov1720;
	} else {
		ge86os1720 = '\1';
		ge86ov1720 = R;
	}
	R = T51c14();
	ge86ov1720 = R;
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.default_message */
T0* T304f5(T0* C)
{
	T0* R = 0;
	R = (T304f3(C, ge1139ov2483));
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.message */
T0* T304f3(T0* C, T0* a1)
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
	t1 = (T304f4(C));
	R = (T51f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f11(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T239f55(R, l5);
				}
			} else {
				t1 = (T304f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T51f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T239f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f11(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T239f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T304f4(C));
					l1 = (T51f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T239f55(l1, l5);
									}
								} else {
									t1 = (T304f4(C));
									T51f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
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
									T17f36(l1, l5);
								} else {
									T239f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f14(l1):T239f26(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f15(l1):T239f27(l1)));
						t2 = (T67f4(GE_void(((T304*)(C))->a1), l3));
						if (t2) {
							t1 = (T304f4(C));
							t5 = (T67f5(GE_void(((T304*)(C))->a1), l3));
							R = (T51f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T304f4(C));
								t5 = (T304f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T51f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T239f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T239f55(R, (T2)('{'));
									}
								}
								t1 = (T304f4(C));
								R = (T51f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T239f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T239f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T239f55(R, (T2)('{'));
							}
						}
						t1 = (T304f4(C));
						R = (T51f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T239f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f4(&l2, l4));
	}
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.arguments */
T0* T304f6(T0* C)
{
	T0* R = 0;
	if (ge132os1719) {
		return ge132ov1719;
	} else {
		ge132os1719 = '\1';
		ge132ov1719 = R;
	}
	R = T23c4();
	ge132ov1719 = R;
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.string_ */
T0* T304f4(T0* C)
{
	T0* R = 0;
	if (ge86os1720) {
		return ge86ov1720;
	} else {
		ge86os1720 = '\1';
		ge86ov1720 = R;
	}
	R = T51c14();
	ge86ov1720 = R;
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.default_message */
T0* T303f5(T0* C)
{
	T0* R = 0;
	R = (T303f3(C, ge1133ov2483));
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.message */
T0* T303f3(T0* C, T0* a1)
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
	t1 = (T303f4(C));
	R = (T51f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f11(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T239f55(R, l5);
				}
			} else {
				t1 = (T303f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T51f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T239f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f11(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T239f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T303f4(C));
					l1 = (T51f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T239f55(l1, l5);
									}
								} else {
									t1 = (T303f4(C));
									T51f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
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
									T17f36(l1, l5);
								} else {
									T239f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f14(l1):T239f26(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f15(l1):T239f27(l1)));
						t2 = (T67f4(GE_void(((T303*)(C))->a1), l3));
						if (t2) {
							t1 = (T303f4(C));
							t5 = (T67f5(GE_void(((T303*)(C))->a1), l3));
							R = (T51f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T303f4(C));
								t5 = (T303f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T51f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T239f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T239f55(R, (T2)('{'));
									}
								}
								t1 = (T303f4(C));
								R = (T51f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T239f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T239f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T239f55(R, (T2)('{'));
							}
						}
						t1 = (T303f4(C));
						R = (T51f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T239f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f4(&l2, l4));
	}
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.arguments */
T0* T303f6(T0* C)
{
	T0* R = 0;
	if (ge132os1719) {
		return ge132ov1719;
	} else {
		ge132os1719 = '\1';
		ge132ov1719 = R;
	}
	R = T23c4();
	ge132ov1719 = R;
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.string_ */
T0* T303f4(T0* C)
{
	T0* R = 0;
	if (ge86os1720) {
		return ge86ov1720;
	} else {
		ge86os1720 = '\1';
		ge86ov1720 = R;
	}
	R = T51c14();
	ge86ov1720 = R;
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.default_message */
T0* T229f5(T0* C)
{
	T0* R = 0;
	R = (T229f3(C, ge1149ov2483));
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.message */
T0* T229f3(T0* C, T0* a1)
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
	t1 = (T229f4(C));
	R = (T51f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f11(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T239f55(R, l5);
				}
			} else {
				t1 = (T229f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T51f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T239f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f11(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T239f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T229f4(C));
					l1 = (T51f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T239f55(l1, l5);
									}
								} else {
									t1 = (T229f4(C));
									T51f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
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
									T17f36(l1, l5);
								} else {
									T239f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f14(l1):T239f26(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f15(l1):T239f27(l1)));
						t2 = (T67f4(GE_void(((T229*)(C))->a1), l3));
						if (t2) {
							t1 = (T229f4(C));
							t5 = (T67f5(GE_void(((T229*)(C))->a1), l3));
							R = (T51f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T229f4(C));
								t5 = (T229f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T51f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T239f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T239f55(R, (T2)('{'));
									}
								}
								t1 = (T229f4(C));
								R = (T51f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T239f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T239f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T239f55(R, (T2)('{'));
							}
						}
						t1 = (T229f4(C));
						R = (T51f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T239f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f4(&l2, l4));
	}
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.arguments */
T0* T229f6(T0* C)
{
	T0* R = 0;
	if (ge132os1719) {
		return ge132ov1719;
	} else {
		ge132os1719 = '\1';
		ge132ov1719 = R;
	}
	R = T23c4();
	ge132ov1719 = R;
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.string_ */
T0* T229f4(T0* C)
{
	T0* R = 0;
	if (ge86os1720) {
		return ge86ov1720;
	} else {
		ge86os1720 = '\1';
		ge86ov1720 = R;
	}
	R = T51c14();
	ge86ov1720 = R;
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.default_message */
T0* T228f5(T0* C)
{
	T0* R = 0;
	R = (T228f3(C, ge1146ov2483));
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.message */
T0* T228f3(T0* C, T0* a1)
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
	t1 = (T228f4(C));
	R = (T51f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f11(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T239f55(R, l5);
				}
			} else {
				t1 = (T228f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T51f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T239f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f11(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T239f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T228f4(C));
					l1 = (T51f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T239f55(l1, l5);
									}
								} else {
									t1 = (T228f4(C));
									T51f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
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
									T17f36(l1, l5);
								} else {
									T239f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f14(l1):T239f26(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f15(l1):T239f27(l1)));
						t2 = (T67f4(GE_void(((T228*)(C))->a1), l3));
						if (t2) {
							t1 = (T228f4(C));
							t5 = (T67f5(GE_void(((T228*)(C))->a1), l3));
							R = (T51f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T228f4(C));
								t5 = (T228f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T51f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T239f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T239f55(R, (T2)('{'));
									}
								}
								t1 = (T228f4(C));
								R = (T51f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T239f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T239f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T239f55(R, (T2)('{'));
							}
						}
						t1 = (T228f4(C));
						R = (T51f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T239f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f4(&l2, l4));
	}
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.arguments */
T0* T228f6(T0* C)
{
	T0* R = 0;
	if (ge132os1719) {
		return ge132ov1719;
	} else {
		ge132os1719 = '\1';
		ge132ov1719 = R;
	}
	R = T23c4();
	ge132ov1719 = R;
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.string_ */
T0* T228f4(T0* C)
{
	T0* R = 0;
	if (ge86os1720) {
		return ge86ov1720;
	} else {
		ge86os1720 = '\1';
		ge86ov1720 = R;
	}
	R = T51c14();
	ge86ov1720 = R;
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.default_message */
T0* T227f5(T0* C)
{
	T0* R = 0;
	R = (T227f3(C, ge1148ov2483));
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.message */
T0* T227f3(T0* C, T0* a1)
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
	t1 = (T227f4(C));
	R = (T51f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f11(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T239f55(R, l5);
				}
			} else {
				t1 = (T227f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T51f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T239f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f11(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T239f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T227f4(C));
					l1 = (T51f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T239f55(l1, l5);
									}
								} else {
									t1 = (T227f4(C));
									T51f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
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
									T17f36(l1, l5);
								} else {
									T239f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f14(l1):T239f26(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f15(l1):T239f27(l1)));
						t2 = (T67f4(GE_void(((T227*)(C))->a1), l3));
						if (t2) {
							t1 = (T227f4(C));
							t5 = (T67f5(GE_void(((T227*)(C))->a1), l3));
							R = (T51f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T227f4(C));
								t5 = (T227f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T51f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T239f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T239f55(R, (T2)('{'));
									}
								}
								t1 = (T227f4(C));
								R = (T51f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T239f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T239f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T239f55(R, (T2)('{'));
							}
						}
						t1 = (T227f4(C));
						R = (T51f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T239f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f4(&l2, l4));
	}
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.arguments */
T0* T227f6(T0* C)
{
	T0* R = 0;
	if (ge132os1719) {
		return ge132ov1719;
	} else {
		ge132os1719 = '\1';
		ge132ov1719 = R;
	}
	R = T23c4();
	ge132ov1719 = R;
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.string_ */
T0* T227f4(T0* C)
{
	T0* R = 0;
	if (ge86os1720) {
		return ge86ov1720;
	} else {
		ge86os1720 = '\1';
		ge86ov1720 = R;
	}
	R = T51c14();
	ge86ov1720 = R;
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.default_message */
T0* T226f5(T0* C)
{
	T0* R = 0;
	R = (T226f3(C, ge1145ov2483));
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.message */
T0* T226f3(T0* C, T0* a1)
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
	t1 = (T226f4(C));
	R = (T51f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f11(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T239f55(R, l5);
				}
			} else {
				t1 = (T226f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T51f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T239f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f11(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T239f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T226f4(C));
					l1 = (T51f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T239f55(l1, l5);
									}
								} else {
									t1 = (T226f4(C));
									T51f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
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
									T17f36(l1, l5);
								} else {
									T239f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f14(l1):T239f26(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f15(l1):T239f27(l1)));
						t2 = (T67f4(GE_void(((T226*)(C))->a1), l3));
						if (t2) {
							t1 = (T226f4(C));
							t5 = (T67f5(GE_void(((T226*)(C))->a1), l3));
							R = (T51f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T226f4(C));
								t5 = (T226f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T51f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T239f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T239f55(R, (T2)('{'));
									}
								}
								t1 = (T226f4(C));
								R = (T51f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T239f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T239f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T239f55(R, (T2)('{'));
							}
						}
						t1 = (T226f4(C));
						R = (T51f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T239f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f4(&l2, l4));
	}
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.arguments */
T0* T226f6(T0* C)
{
	T0* R = 0;
	if (ge132os1719) {
		return ge132ov1719;
	} else {
		ge132os1719 = '\1';
		ge132ov1719 = R;
	}
	R = T23c4();
	ge132ov1719 = R;
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.string_ */
T0* T226f4(T0* C)
{
	T0* R = 0;
	if (ge86os1720) {
		return ge86ov1720;
	} else {
		ge86os1720 = '\1';
		ge86ov1720 = R;
	}
	R = T51c14();
	ge86ov1720 = R;
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.default_message */
T0* T225f5(T0* C)
{
	T0* R = 0;
	R = (T225f3(C, ge1141ov2483));
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.message */
T0* T225f3(T0* C, T0* a1)
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
	t1 = (T225f4(C));
	R = (T51f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f11(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T239f55(R, l5);
				}
			} else {
				t1 = (T225f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T51f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T239f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f11(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T239f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T225f4(C));
					l1 = (T51f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T239f55(l1, l5);
									}
								} else {
									t1 = (T225f4(C));
									T51f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
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
									T17f36(l1, l5);
								} else {
									T239f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f14(l1):T239f26(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f15(l1):T239f27(l1)));
						t2 = (T67f4(GE_void(((T225*)(C))->a1), l3));
						if (t2) {
							t1 = (T225f4(C));
							t5 = (T67f5(GE_void(((T225*)(C))->a1), l3));
							R = (T51f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T225f4(C));
								t5 = (T225f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T51f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T239f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T239f55(R, (T2)('{'));
									}
								}
								t1 = (T225f4(C));
								R = (T51f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T239f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T239f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T239f55(R, (T2)('{'));
							}
						}
						t1 = (T225f4(C));
						R = (T51f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T239f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f4(&l2, l4));
	}
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.arguments */
T0* T225f6(T0* C)
{
	T0* R = 0;
	if (ge132os1719) {
		return ge132ov1719;
	} else {
		ge132os1719 = '\1';
		ge132ov1719 = R;
	}
	R = T23c4();
	ge132ov1719 = R;
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.string_ */
T0* T225f4(T0* C)
{
	T0* R = 0;
	if (ge86os1720) {
		return ge86ov1720;
	} else {
		ge86os1720 = '\1';
		ge86ov1720 = R;
	}
	R = T51c14();
	ge86ov1720 = R;
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.default_message */
T0* T224f5(T0* C)
{
	T0* R = 0;
	R = (T224f3(C, ge1140ov2483));
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.message */
T0* T224f3(T0* C, T0* a1)
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
	t1 = (T224f4(C));
	R = (T51f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f11(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T239f55(R, l5);
				}
			} else {
				t1 = (T224f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T51f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T239f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f11(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T239f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T224f4(C));
					l1 = (T51f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T239f55(l1, l5);
									}
								} else {
									t1 = (T224f4(C));
									T51f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
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
									T17f36(l1, l5);
								} else {
									T239f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f14(l1):T239f26(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f15(l1):T239f27(l1)));
						t2 = (T67f4(GE_void(((T224*)(C))->a1), l3));
						if (t2) {
							t1 = (T224f4(C));
							t5 = (T67f5(GE_void(((T224*)(C))->a1), l3));
							R = (T51f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T224f4(C));
								t5 = (T224f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T51f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T239f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T239f55(R, (T2)('{'));
									}
								}
								t1 = (T224f4(C));
								R = (T51f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T239f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T239f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T239f55(R, (T2)('{'));
							}
						}
						t1 = (T224f4(C));
						R = (T51f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T239f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f4(&l2, l4));
	}
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.arguments */
T0* T224f6(T0* C)
{
	T0* R = 0;
	if (ge132os1719) {
		return ge132ov1719;
	} else {
		ge132os1719 = '\1';
		ge132ov1719 = R;
	}
	R = T23c4();
	ge132ov1719 = R;
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.string_ */
T0* T224f4(T0* C)
{
	T0* R = 0;
	if (ge86os1720) {
		return ge86ov1720;
	} else {
		ge86os1720 = '\1';
		ge86ov1720 = R;
	}
	R = T51c14();
	ge86ov1720 = R;
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.default_message */
T0* T223f5(T0* C)
{
	T0* R = 0;
	R = (T223f3(C, ge1152ov2483));
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.message */
T0* T223f3(T0* C, T0* a1)
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
	t1 = (T223f4(C));
	R = (T51f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f11(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T239f55(R, l5);
				}
			} else {
				t1 = (T223f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T51f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T239f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f11(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T239f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T223f4(C));
					l1 = (T51f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T239f55(l1, l5);
									}
								} else {
									t1 = (T223f4(C));
									T51f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
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
									T17f36(l1, l5);
								} else {
									T239f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f14(l1):T239f26(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f15(l1):T239f27(l1)));
						t2 = (T67f4(GE_void(((T223*)(C))->a1), l3));
						if (t2) {
							t1 = (T223f4(C));
							t5 = (T67f5(GE_void(((T223*)(C))->a1), l3));
							R = (T51f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T223f4(C));
								t5 = (T223f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T51f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T239f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T239f55(R, (T2)('{'));
									}
								}
								t1 = (T223f4(C));
								R = (T51f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T239f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T239f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T239f55(R, (T2)('{'));
							}
						}
						t1 = (T223f4(C));
						R = (T51f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T239f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f4(&l2, l4));
	}
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.arguments */
T0* T223f6(T0* C)
{
	T0* R = 0;
	if (ge132os1719) {
		return ge132ov1719;
	} else {
		ge132os1719 = '\1';
		ge132ov1719 = R;
	}
	R = T23c4();
	ge132ov1719 = R;
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.string_ */
T0* T223f4(T0* C)
{
	T0* R = 0;
	if (ge86os1720) {
		return ge86ov1720;
	} else {
		ge86os1720 = '\1';
		ge86ov1720 = R;
	}
	R = T51c14();
	ge86ov1720 = R;
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.default_message */
T0* T222f5(T0* C)
{
	T0* R = 0;
	R = (T222f3(C, ge1136ov2483));
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.message */
T0* T222f3(T0* C, T0* a1)
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
	t1 = (T222f4(C));
	R = (T51f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f11(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T239f55(R, l5);
				}
			} else {
				t1 = (T222f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T51f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T239f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f11(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T239f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T222f4(C));
					l1 = (T51f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T239f55(l1, l5);
									}
								} else {
									t1 = (T222f4(C));
									T51f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
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
									T17f36(l1, l5);
								} else {
									T239f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f14(l1):T239f26(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f15(l1):T239f27(l1)));
						t2 = (T67f4(GE_void(((T222*)(C))->a1), l3));
						if (t2) {
							t1 = (T222f4(C));
							t5 = (T67f5(GE_void(((T222*)(C))->a1), l3));
							R = (T51f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T222f4(C));
								t5 = (T222f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T51f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T239f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T239f55(R, (T2)('{'));
									}
								}
								t1 = (T222f4(C));
								R = (T51f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T239f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T239f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T239f55(R, (T2)('{'));
							}
						}
						t1 = (T222f4(C));
						R = (T51f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T239f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f4(&l2, l4));
	}
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.arguments */
T0* T222f6(T0* C)
{
	T0* R = 0;
	if (ge132os1719) {
		return ge132ov1719;
	} else {
		ge132os1719 = '\1';
		ge132ov1719 = R;
	}
	R = T23c4();
	ge132ov1719 = R;
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.string_ */
T0* T222f4(T0* C)
{
	T0* R = 0;
	if (ge86os1720) {
		return ge86ov1720;
	} else {
		ge86os1720 = '\1';
		ge86ov1720 = R;
	}
	R = T51c14();
	ge86ov1720 = R;
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.default_message */
T0* T221f5(T0* C)
{
	T0* R = 0;
	R = (T221f3(C, ge1147ov2483));
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.message */
T0* T221f3(T0* C, T0* a1)
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
	t1 = (T221f4(C));
	R = (T51f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f11(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T239f55(R, l5);
				}
			} else {
				t1 = (T221f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T51f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T239f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f11(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T239f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T221f4(C));
					l1 = (T51f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T239f55(l1, l5);
									}
								} else {
									t1 = (T221f4(C));
									T51f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
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
									T17f36(l1, l5);
								} else {
									T239f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f14(l1):T239f26(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f15(l1):T239f27(l1)));
						t2 = (T67f4(GE_void(((T221*)(C))->a1), l3));
						if (t2) {
							t1 = (T221f4(C));
							t5 = (T67f5(GE_void(((T221*)(C))->a1), l3));
							R = (T51f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T221f4(C));
								t5 = (T221f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T51f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T239f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T239f55(R, (T2)('{'));
									}
								}
								t1 = (T221f4(C));
								R = (T51f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T239f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T239f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T239f55(R, (T2)('{'));
							}
						}
						t1 = (T221f4(C));
						R = (T51f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T239f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f4(&l2, l4));
	}
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.arguments */
T0* T221f6(T0* C)
{
	T0* R = 0;
	if (ge132os1719) {
		return ge132ov1719;
	} else {
		ge132os1719 = '\1';
		ge132ov1719 = R;
	}
	R = T23c4();
	ge132ov1719 = R;
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.string_ */
T0* T221f4(T0* C)
{
	T0* R = 0;
	if (ge86os1720) {
		return ge86ov1720;
	} else {
		ge86os1720 = '\1';
		ge86ov1720 = R;
	}
	R = T51c14();
	ge86ov1720 = R;
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.default_message */
T0* T220f5(T0* C)
{
	T0* R = 0;
	R = (T220f3(C, ge1151ov2483));
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.message */
T0* T220f3(T0* C, T0* a1)
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
	t1 = (T220f4(C));
	R = (T51f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f11(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T239f55(R, l5);
				}
			} else {
				t1 = (T220f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T51f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T239f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f11(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T239f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T220f4(C));
					l1 = (T51f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T239f55(l1, l5);
									}
								} else {
									t1 = (T220f4(C));
									T51f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
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
									T17f36(l1, l5);
								} else {
									T239f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f14(l1):T239f26(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f15(l1):T239f27(l1)));
						t2 = (T67f4(GE_void(((T220*)(C))->a1), l3));
						if (t2) {
							t1 = (T220f4(C));
							t5 = (T67f5(GE_void(((T220*)(C))->a1), l3));
							R = (T51f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T220f4(C));
								t5 = (T220f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T51f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T239f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T239f55(R, (T2)('{'));
									}
								}
								t1 = (T220f4(C));
								R = (T51f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T239f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T239f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T239f55(R, (T2)('{'));
							}
						}
						t1 = (T220f4(C));
						R = (T51f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T239f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f4(&l2, l4));
	}
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.arguments */
T0* T220f6(T0* C)
{
	T0* R = 0;
	if (ge132os1719) {
		return ge132ov1719;
	} else {
		ge132os1719 = '\1';
		ge132ov1719 = R;
	}
	R = T23c4();
	ge132ov1719 = R;
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.default_message */
T0* T219f5(T0* C)
{
	T0* R = 0;
	R = (T219f3(C, ge1143ov2483));
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.message */
T0* T219f3(T0* C, T0* a1)
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
	t1 = (T219f4(C));
	R = (T51f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f11(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T239f55(R, l5);
				}
			} else {
				t1 = (T219f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T51f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T239f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f11(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T239f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T219f4(C));
					l1 = (T51f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T239f55(l1, l5);
									}
								} else {
									t1 = (T219f4(C));
									T51f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
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
									T17f36(l1, l5);
								} else {
									T239f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f14(l1):T239f26(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f15(l1):T239f27(l1)));
						t2 = (T67f4(GE_void(((T219*)(C))->a1), l3));
						if (t2) {
							t1 = (T219f4(C));
							t5 = (T67f5(GE_void(((T219*)(C))->a1), l3));
							R = (T51f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T219f4(C));
								t5 = (T219f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T51f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T239f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T239f55(R, (T2)('{'));
									}
								}
								t1 = (T219f4(C));
								R = (T51f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T239f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T239f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T239f55(R, (T2)('{'));
							}
						}
						t1 = (T219f4(C));
						R = (T51f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T239f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f4(&l2, l4));
	}
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.arguments */
T0* T219f6(T0* C)
{
	T0* R = 0;
	if (ge132os1719) {
		return ge132ov1719;
	} else {
		ge132os1719 = '\1';
		ge132ov1719 = R;
	}
	R = T23c4();
	ge132ov1719 = R;
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.string_ */
T0* T219f4(T0* C)
{
	T0* R = 0;
	if (ge86os1720) {
		return ge86ov1720;
	} else {
		ge86os1720 = '\1';
		ge86ov1720 = R;
	}
	R = T51c14();
	ge86ov1720 = R;
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.default_message */
T0* T218f5(T0* C)
{
	T0* R = 0;
	R = (T218f3(C, ge1134ov2483));
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.message */
T0* T218f3(T0* C, T0* a1)
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
	t1 = (T218f4(C));
	R = (T51f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f11(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T239f55(R, l5);
				}
			} else {
				t1 = (T218f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T51f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T239f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f11(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T239f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T218f4(C));
					l1 = (T51f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T239f55(l1, l5);
									}
								} else {
									t1 = (T218f4(C));
									T51f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
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
									T17f36(l1, l5);
								} else {
									T239f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f14(l1):T239f26(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f15(l1):T239f27(l1)));
						t2 = (T67f4(GE_void(((T218*)(C))->a1), l3));
						if (t2) {
							t1 = (T218f4(C));
							t5 = (T67f5(GE_void(((T218*)(C))->a1), l3));
							R = (T51f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T218f4(C));
								t5 = (T218f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T51f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T239f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T239f55(R, (T2)('{'));
									}
								}
								t1 = (T218f4(C));
								R = (T51f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T239f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T239f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T239f55(R, (T2)('{'));
							}
						}
						t1 = (T218f4(C));
						R = (T51f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T239f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f4(&l2, l4));
	}
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.arguments */
T0* T218f6(T0* C)
{
	T0* R = 0;
	if (ge132os1719) {
		return ge132ov1719;
	} else {
		ge132os1719 = '\1';
		ge132ov1719 = R;
	}
	R = T23c4();
	ge132ov1719 = R;
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.string_ */
T0* T218f4(T0* C)
{
	T0* R = 0;
	if (ge86os1720) {
		return ge86ov1720;
	} else {
		ge86os1720 = '\1';
		ge86ov1720 = R;
	}
	R = T51c14();
	ge86ov1720 = R;
	return R;
}

/* ET_XACE_NOT_XACE_FILE_ERROR.default_message */
T0* T111f5(T0* C)
{
	T0* R = 0;
	R = (T111f3(C, ge1144ov2483));
	return R;
}

/* ET_XACE_NOT_XACE_FILE_ERROR.message */
T0* T111f3(T0* C, T0* a1)
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
	t1 = (T111f4(C));
	R = (T51f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f11(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T239f55(R, l5);
				}
			} else {
				t1 = (T111f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T51f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T239f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f11(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T239f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T111f4(C));
					l1 = (T51f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T239f55(l1, l5);
									}
								} else {
									t1 = (T111f4(C));
									T51f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
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
									T17f36(l1, l5);
								} else {
									T239f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f14(l1):T239f26(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f15(l1):T239f27(l1)));
						t2 = (T67f4(GE_void(((T111*)(C))->a1), l3));
						if (t2) {
							t1 = (T111f4(C));
							t5 = (T67f5(GE_void(((T111*)(C))->a1), l3));
							R = (T51f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T111f4(C));
								t5 = (T111f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T51f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T239f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T239f55(R, (T2)('{'));
									}
								}
								t1 = (T111f4(C));
								R = (T51f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T239f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T239f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T239f55(R, (T2)('{'));
							}
						}
						t1 = (T111f4(C));
						R = (T51f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T239f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f4(&l2, l4));
	}
	return R;
}

/* ET_XACE_NOT_XACE_FILE_ERROR.arguments */
T0* T111f6(T0* C)
{
	T0* R = 0;
	if (ge132os1719) {
		return ge132ov1719;
	} else {
		ge132os1719 = '\1';
		ge132ov1719 = R;
	}
	R = T23c4();
	ge132ov1719 = R;
	return R;
}

/* ET_XACE_NOT_XACE_FILE_ERROR.string_ */
T0* T111f4(T0* C)
{
	T0* R = 0;
	if (ge86os1720) {
		return ge86ov1720;
	} else {
		ge86os1720 = '\1';
		ge86ov1720 = R;
	}
	R = T51c14();
	ge86ov1720 = R;
	return R;
}

/* UT_MESSAGE.default_message */
T0* T110f5(T0* C)
{
	T0* R = 0;
	R = (T110f3(C, ge1178ov2483));
	return R;
}

/* UT_MESSAGE.message */
T0* T110f3(T0* C, T0* a1)
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
	t1 = (T110f4(C));
	R = (T51f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f11(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T239f55(R, l5);
				}
			} else {
				t1 = (T110f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T51f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T239f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f11(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T239f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T110f4(C));
					l1 = (T51f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T239f55(l1, l5);
									}
								} else {
									t1 = (T110f4(C));
									T51f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
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
									T17f36(l1, l5);
								} else {
									T239f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f14(l1):T239f26(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f15(l1):T239f27(l1)));
						t2 = (T67f4(GE_void(((T110*)(C))->a1), l3));
						if (t2) {
							t1 = (T110f4(C));
							t5 = (T67f5(GE_void(((T110*)(C))->a1), l3));
							R = (T51f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T110f4(C));
								t5 = (T110f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T51f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T239f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T239f55(R, (T2)('{'));
									}
								}
								t1 = (T110f4(C));
								R = (T51f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T239f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T239f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T239f55(R, (T2)('{'));
							}
						}
						t1 = (T110f4(C));
						R = (T51f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T239f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f4(&l2, l4));
	}
	return R;
}

/* UT_MESSAGE.arguments */
T0* T110f6(T0* C)
{
	T0* R = 0;
	if (ge132os1719) {
		return ge132ov1719;
	} else {
		ge132os1719 = '\1';
		ge132ov1719 = R;
	}
	R = T23c4();
	ge132ov1719 = R;
	return R;
}

/* UT_MESSAGE.string_ */
T0* T110f4(T0* C)
{
	T0* R = 0;
	if (ge86os1720) {
		return ge86ov1720;
	} else {
		ge86os1720 = '\1';
		ge86ov1720 = R;
	}
	R = T51c14();
	ge86ov1720 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
T0* T90f5(T0* C)
{
	T0* R = 0;
	R = (T90f3(C, ge1175ov2483));
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
T0* T90f3(T0* C, T0* a1)
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
	t1 = (T90f4(C));
	R = (T51f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f11(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T239f55(R, l5);
				}
			} else {
				t1 = (T90f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T51f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T239f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f11(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T239f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T90f4(C));
					l1 = (T51f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T239f55(l1, l5);
									}
								} else {
									t1 = (T90f4(C));
									T51f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
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
									T17f36(l1, l5);
								} else {
									T239f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f14(l1):T239f26(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f15(l1):T239f27(l1)));
						t2 = (T67f4(GE_void(((T90*)(C))->a1), l3));
						if (t2) {
							t1 = (T90f4(C));
							t5 = (T67f5(GE_void(((T90*)(C))->a1), l3));
							R = (T51f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T90f4(C));
								t5 = (T90f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T51f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T239f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T239f55(R, (T2)('{'));
									}
								}
								t1 = (T90f4(C));
								R = (T51f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T239f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T239f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T239f55(R, (T2)('{'));
							}
						}
						t1 = (T90f4(C));
						R = (T51f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T239f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f4(&l2, l4));
	}
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.arguments */
T0* T90f6(T0* C)
{
	T0* R = 0;
	if (ge132os1719) {
		return ge132ov1719;
	} else {
		ge132os1719 = '\1';
		ge132ov1719 = R;
	}
	R = T23c4();
	ge132ov1719 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
T0* T90f4(T0* C)
{
	T0* R = 0;
	if (ge86os1720) {
		return ge86ov1720;
	} else {
		ge86os1720 = '\1';
		ge86ov1720 = R;
	}
	R = T51c14();
	ge86ov1720 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.default_message */
T0* T89f5(T0* C)
{
	T0* R = 0;
	R = (T89f3(C, ge1174ov2483));
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.message */
T0* T89f3(T0* C, T0* a1)
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
	t1 = (T89f4(C));
	R = (T51f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f11(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T239f55(R, l5);
				}
			} else {
				t1 = (T89f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T51f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T239f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f11(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T239f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T89f4(C));
					l1 = (T51f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T239f55(l1, l5);
									}
								} else {
									t1 = (T89f4(C));
									T51f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
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
									T17f36(l1, l5);
								} else {
									T239f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f14(l1):T239f26(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f15(l1):T239f27(l1)));
						t2 = (T67f4(GE_void(((T89*)(C))->a1), l3));
						if (t2) {
							t1 = (T89f4(C));
							t5 = (T67f5(GE_void(((T89*)(C))->a1), l3));
							R = (T51f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T89f4(C));
								t5 = (T89f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T51f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T239f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T239f55(R, (T2)('{'));
									}
								}
								t1 = (T89f4(C));
								R = (T51f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T239f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T239f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T239f55(R, (T2)('{'));
							}
						}
						t1 = (T89f4(C));
						R = (T51f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T239f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f4(&l2, l4));
	}
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.arguments */
T0* T89f6(T0* C)
{
	T0* R = 0;
	if (ge132os1719) {
		return ge132ov1719;
	} else {
		ge132os1719 = '\1';
		ge132ov1719 = R;
	}
	R = T23c4();
	ge132ov1719 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.string_ */
T0* T89f4(T0* C)
{
	T0* R = 0;
	if (ge86os1720) {
		return ge86ov1720;
	} else {
		ge86os1720 = '\1';
		ge86ov1720 = R;
	}
	R = T51c14();
	ge86ov1720 = R;
	return R;
}

/* UT_USAGE_MESSAGE.default_message */
T0* T34f2(T0* C)
{
	T0* R = 0;
	R = (T34f4(C, ge1184ov2483));
	return R;
}

/* UT_USAGE_MESSAGE.message */
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
	R = (T51f2(GE_void(t1), a1, l4));
	t2 = (T6f4(&l2, l4));
	while (!(t2)) {
		l5 = (T17f11(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, l5);
				} else {
					T239f55(R, l5);
				}
			} else {
				t1 = (T34f5(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T51f3(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f4(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f36(R, (T2)('$'));
				} else {
					T239f55(R, (T2)('$'));
				}
			} else {
				l5 = (T17f11(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f36(R, (T2)('$'));
					} else {
						T239f55(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T34f5(C));
					l1 = (T51f2(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f36(l1, l5);
									} else {
										T239f55(l1, l5);
									}
								} else {
									t1 = (T34f5(C));
									T51f15(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f4(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f11(a1, l2));
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
									T17f36(l1, l5);
								} else {
									T239f55(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f4(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f14(l1):T239f26(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f15(l1):T239f27(l1)));
						t2 = (T67f4(GE_void(((T34*)(C))->a1), l3));
						if (t2) {
							t1 = (T34f5(C));
							t5 = (T67f5(GE_void(((T34*)(C))->a1), l3));
							R = (T51f4(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T34f5(C));
								t5 = (T34f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T51f4(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f36(R, (T2)('$'));
								} else {
									T239f55(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('{'));
									} else {
										T239f55(R, (T2)('{'));
									}
								}
								t1 = (T34f5(C));
								R = (T51f4(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f36(R, (T2)('}'));
									} else {
										T239f55(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f36(R, (T2)('$'));
						} else {
							T239f55(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('{'));
							} else {
								T239f55(R, (T2)('{'));
							}
						}
						t1 = (T34f5(C));
						R = (T51f4(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f36(R, (T2)('}'));
							} else {
								T239f55(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f4(&l2, l4));
	}
	return R;
}

/* UT_USAGE_MESSAGE.arguments */
T0* T34f6(T0* C)
{
	T0* R = 0;
	if (ge132os1719) {
		return ge132ov1719;
	} else {
		ge132os1719 = '\1';
		ge132ov1719 = R;
	}
	R = T23c4();
	ge132ov1719 = R;
	return R;
}

/* UT_USAGE_MESSAGE.string_ */
T0* T34f5(T0* C)
{
	T0* R = 0;
	if (ge86os1720) {
		return ge86ov1720;
	} else {
		ge86os1720 = '\1';
		ge86ov1720 = R;
	}
	R = T51c14();
	ge86ov1720 = R;
	return R;
}

T0* GE_ma236(T6 c, ...)
{
	T0* R;
	T0* t1;
	t1 = (T0*)GE_alloc(sizeof(T55)+c*sizeof(T6));
	((T0*)(t1))->id = 55;
	((T55*)(t1))->z1 = c;
	if (c!=0) {
		va_list v;
		T6 n = c;
		T6 *i = ((T55*)(t1))->z2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T6);
		}
		va_end(v);
	}
	R = (T0*)GE_alloc(sizeof(T236));
	((T0*)(R))->id = 236;
	((T236*)(R))->a1 = t1;
	((T236*)(R))->a2 = 1;
	((T236*)(R))->a3 = (T6)c;
	return R;
}

T0* GE_ma67(T6 c, ...)
{
	T0* R;
	T0* t1;
	t1 = (T0*)GE_alloc(sizeof(T54)+c*sizeof(T0*));
	((T0*)(t1))->id = 54;
	((T54*)(t1))->z1 = c;
	if (c!=0) {
		va_list v;
		T6 n = c;
		T0* *i = ((T54*)(t1))->z2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = (T0*)GE_alloc(sizeof(T67));
	((T0*)(R))->id = 67;
	((T67*)(R))->a1 = t1;
	((T67*)(R))->a2 = 1;
	((T67*)(R))->a3 = (T6)c;
	return R;
}

T0* GE_ma164(T6 c, ...)
{
	T0* R;
	T0* t1;
	t1 = (T0*)GE_alloc(sizeof(T163)+c*sizeof(T0*));
	((T0*)(t1))->id = 163;
	((T163*)(t1))->z1 = c;
	if (c!=0) {
		va_list v;
		T6 n = c;
		T0* *i = ((T163*)(t1))->z2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = (T0*)GE_alloc(sizeof(T164));
	((T0*)(R))->id = 164;
	((T164*)(R))->a1 = t1;
	((T164*)(R))->a2 = 1;
	((T164*)(R))->a3 = (T6)c;
	return R;
}

T0* ge1158ov2506;
T0* ge1158ov2505;
T0* ge220ov2953;
T0* ge224ov2825;
T0* ge56ov2054;
T0* ge56ov2055;
T0* ge230ov3886;
T0* ge159ov8859;
T0* ge1337ov8134;
T0* ge1337ov8135;
T0* ge208ov4752;
T0* ge1328ov8867;
T0* ge1328ov8869;
T0* ge1280ov5379;
T0* ge1261ov7979;
T0* ge1261ov7978;
T0* ge1131ov4422;
T0* ge1131ov4425;
T0* ge1131ov4416;
T0* ge1131ov4435;
T0* ge1131ov4428;
T0* ge1131ov4414;
T0* ge1131ov4437;
T0* ge227ov2953;
T0* ge1154ov2753;
T0* ge197ov4772;
T0* ge1131ov4418;
T0* ge1131ov4431;
T0* ge1131ov4430;
T0* ge1131ov4429;
T0* ge1131ov4424;
T0* ge1131ov4427;
T0* ge1131ov4439;
T0* ge1131ov4432;
T0* ge1131ov4426;
T0* ge1131ov4419;
T0* ge1131ov4415;
T0* ge1131ov4421;
T0* ge1131ov4436;
T0* ge1131ov4433;
T0* ge1131ov4423;
T0* ge1131ov4420;
T0* ge1131ov4442;
T0* ge1131ov4438;
T0* ge1131ov4440;
T0* ge121ov7571;
T0* ge1323ov5669;
T0* ge1323ov5668;
T0* ge1165ov4248;
T0* ge1131ov4434;
T0* ge1131ov4417;
T0* ge1165ov4247;
T0* ge1165ov4246;
T0* ge1131ov4249;
T0* ge1131ov4250;
T0* ge1131ov4251;
T0* ge1131ov4252;
T0* ge1131ov4253;
T0* ge1131ov4254;
T0* ge1131ov4255;
T0* ge1131ov4256;
T0* ge1131ov4257;
T0* ge1131ov4258;
T0* ge1131ov4259;
T0* ge1131ov4260;
T0* ge1131ov4261;
T0* ge1131ov4262;
T0* ge1131ov4263;
T0* ge1131ov4264;
T0* ge1131ov4265;
T0* ge1131ov4266;
T0* ge1131ov4267;
T0* ge1131ov4268;
T0* ge1131ov4269;
T0* ge1131ov4270;
T0* ge1131ov4271;
T0* ge1131ov4272;
T0* ge1131ov4273;
T0* ge1131ov4274;
T0* ge1131ov4275;
T0* ge1131ov4276;
T0* ge1131ov4277;
T0* ge1131ov4278;
T0* ge1131ov4279;
T0* ge1131ov4280;
T0* ge1131ov4281;
T0* ge1131ov4282;
T0* ge1131ov4283;
T0* ge1131ov4284;
T0* ge1131ov4285;
T0* ge1131ov4286;
T0* ge1131ov4287;
T0* ge1131ov4288;
T0* ge1131ov4289;
T0* ge1131ov4290;
T0* ge1131ov4291;
T0* ge1131ov4292;
T0* ge1131ov4293;
T0* ge1131ov4294;
T0* ge1131ov4295;
T0* ge1131ov4296;
T0* ge1131ov4297;
T0* ge1131ov4298;
T0* ge1131ov4299;
T0* ge1131ov4300;
T0* ge1131ov4301;
T0* ge1131ov4302;
T0* ge1131ov4303;
T0* ge1131ov4304;
T0* ge1131ov4305;
T0* ge1131ov4306;
T0* ge1131ov4307;
T0* ge1131ov4308;
T0* ge1131ov4309;
T0* ge1131ov4310;
T0* ge1131ov4311;
T0* ge1131ov4312;
T0* ge1131ov4313;
T0* ge1131ov4314;
T0* ge1131ov4315;
T0* ge1131ov4316;
T0* ge1131ov4317;
T0* ge1131ov4318;
T0* ge1131ov4319;
T0* ge1131ov4320;
T0* ge1131ov4321;
T0* ge1131ov4322;
T0* ge1131ov4323;
T0* ge1131ov4324;
T0* ge1131ov4325;
T0* ge1131ov4326;
T0* ge1131ov4327;
T0* ge1131ov4328;
T0* ge1131ov4329;
T0* ge1131ov4330;
T0* ge111ov2953;
T0* ge1121ov6578;
T0* ge1127ov5354;
T0* ge1330ov6294;
T0* ge1330ov6256;
T0* ge1330ov6254;
T0* ge1330ov6295;
T0* ge1330ov6267;
T0* ge1330ov6266;
T0* ge1330ov6277;
T0* ge1330ov6271;
T0* ge1330ov6270;
T0* ge1330ov6269;
T0* ge1330ov6275;
T0* ge1330ov6274;
T0* ge1330ov6276;
T0* ge1330ov6253;
T0* ge1330ov6279;
T0* ge1330ov6288;
T0* ge1333ov6018;
T0* ge1333ov6016;
T0* ge1333ov6017;
T0* ge1330ov6289;
T0* ge1330ov6290;
T0* ge1330ov6293;
T0* ge1330ov6291;
T0* ge1330ov6292;
T0* ge1330ov6286;
T0* ge1326ov8577;
T0* ge1326ov8578;
T0* ge1330ov6259;
T0* ge1330ov6282;
T0* ge1330ov6302;
T0* ge1330ov6303;
T0* ge1330ov6304;
T0* ge1330ov6297;
T0* ge1330ov6280;
T0* ge1330ov6281;
T0* ge1330ov6283;
T0* ge1330ov6287;
T0* ge1328ov8866;
T0* ge1328ov8868;
T0* ge1142ov2483;
T0* ge1139ov2483;
T0* ge1133ov2483;
T0* ge1149ov2483;
T0* ge1146ov2483;
T0* ge1148ov2483;
T0* ge1145ov2483;
T0* ge1141ov2483;
T0* ge1140ov2483;
T0* ge1152ov2483;
T0* ge1136ov2483;
T0* ge1147ov2483;
T0* ge1151ov2483;
T0* ge1143ov2483;
T0* ge1134ov2483;
T0* ge1144ov2483;
T0* ge1178ov2483;
T0* ge1175ov2483;
T0* ge1174ov2483;
T0* ge1184ov2483;

void GE_const_init()
{
	ge1158ov2506 = (GE_ms("loadpath.se", 11));
	ge1158ov2505 = (GE_ms("loadpath.se", 11));
	ge220ov2953 = (GE_ms("\n", 1));
	ge224ov2825 = (GE_ms("", 0));
	ge56ov2054 = (GE_ms("system.xace", 11));
	ge56ov2055 = (GE_ms("library.xace", 12));
	ge230ov3886 = (GE_ms("", 0));
	ge159ov8859 = (GE_ms("", 0));
	ge1337ov8134 = (GE_ms(" ", 1));
	ge1337ov8135 = (GE_ms("  ", 2));
	ge208ov4752 = (GE_ms("", 0));
	ge1328ov8867 = (GE_ms("iso-8859-1", 10));
	ge1328ov8869 = (GE_ms("utf-16", 6));
	ge1280ov5379 = (GE_ms("root", 4));
	ge1261ov7979 = (GE_ms("Namespace declared twice", 24));
	ge1261ov7978 = (GE_ms("Undeclared namespace error", 26));
	ge1131ov4422 = (GE_ms("default", 7));
	ge1131ov4425 = (GE_ms("exe", 3));
	ge1131ov4416 = (GE_ms("auto", 4));
	ge1131ov4435 = (GE_ms("none", 4));
	ge1131ov4428 = (GE_ms("internal", 8));
	ge1131ov4414 = (GE_ms("all", 3));
	ge1131ov4437 = (GE_ms("require", 7));
	ge227ov2953 = (GE_ms("\n", 1));
	ge1154ov2753 = (GE_ms("cecil.se", 8));
	ge197ov4772 = (GE_ms("empty_name", 10));
	ge1131ov4418 = (GE_ms("check", 5));
	ge1131ov4431 = (GE_ms("loop_variant", 12));
	ge1131ov4430 = (GE_ms("loop_invariant", 14));
	ge1131ov4429 = (GE_ms("invariant", 9));
	ge1131ov4424 = (GE_ms("ensure", 6));
	ge1131ov4427 = (GE_ms("generate", 8));
	ge1131ov4439 = (GE_ms("style", 5));
	ge1131ov4432 = (GE_ms("low_level", 9));
	ge1131ov4426 = (GE_ms("feature", 7));
	ge1131ov4419 = (GE_ms("class", 5));
	ge1131ov4415 = (GE_ms("array", 5));
	ge1131ov4421 = (GE_ms("constant", 8));
	ge1131ov4436 = (GE_ms("once", 4));
	ge1131ov4433 = (GE_ms("microsoft", 9));
	ge1131ov4423 = (GE_ms("dll", 3));
	ge1131ov4420 = (GE_ms("com", 3));
	ge1131ov4442 = (GE_ms("winapi", 6));
	ge1131ov4438 = (GE_ms("sequential", 10));
	ge1131ov4440 = (GE_ms("supplier_precondition", 21));
	ge121ov7571 = (GE_ms(".", 1));
	ge1323ov5669 = (GE_ms("undefined", 9));
	ge1323ov5668 = (GE_ms("(TRUNCATED)", 11));
	ge1165ov4248 = (GE_ms("", 0));
	ge1131ov4434 = (GE_ms("no_main", 7));
	ge1131ov4417 = (GE_ms("boehm", 5));
	ge1165ov4247 = (GE_ms("false", 5));
	ge1165ov4246 = (GE_ms("true", 4));
	ge1131ov4249 = (GE_ms("abstract", 8));
	ge1131ov4250 = (GE_ms("address_expression", 18));
	ge1131ov4251 = (GE_ms("arguments", 9));
	ge1131ov4252 = (GE_ms("array_optimization", 18));
	ge1131ov4253 = (GE_ms("assembly", 8));
	ge1131ov4254 = (GE_ms("assertion", 9));
	ge1131ov4255 = (GE_ms("callback", 8));
	ge1131ov4256 = (GE_ms("case_insensitive", 16));
	ge1131ov4257 = (GE_ms("check_vape", 10));
	ge1131ov4258 = (GE_ms("clean", 5));
	ge1131ov4259 = (GE_ms("cls_compliant", 13));
	ge1131ov4260 = (GE_ms("component", 9));
	ge1131ov4261 = (GE_ms("console_application", 19));
	ge1131ov4262 = (GE_ms("create_keyword_extension", 24));
	ge1131ov4263 = (GE_ms("culture", 7));
	ge1131ov4264 = (GE_ms("c_compiler_options", 18));
	ge1131ov4265 = (GE_ms("dead_code_removal", 17));
	ge1131ov4266 = (GE_ms("debug", 5));
	ge1131ov4267 = (GE_ms("debug_tag", 9));
	ge1131ov4268 = (GE_ms("debugger", 8));
	ge1131ov4269 = (GE_ms("document", 8));
	ge1131ov4270 = (GE_ms("dotnet_naming_convention", 24));
	ge1131ov4271 = (GE_ms("dynamic_runtime", 15));
	ge1131ov4272 = (GE_ms("ecf_library", 11));
	ge1131ov4273 = (GE_ms("exception_trace", 15));
	ge1131ov4274 = (GE_ms("exclude", 7));
	ge1131ov4275 = (GE_ms("export", 6));
	ge1131ov4276 = (GE_ms("finalize", 8));
	ge1131ov4277 = (GE_ms("flat_fst_optimization", 21));
	ge1131ov4278 = (GE_ms("fst_expansion_factor", 20));
	ge1131ov4279 = (GE_ms("fst_optimization", 16));
	ge1131ov4280 = (GE_ms("garbage_collector", 17));
	ge1131ov4281 = (GE_ms("gc_info", 7));
	ge1131ov4282 = (GE_ms("heap_size", 9));
	ge1131ov4283 = (GE_ms("header", 6));
	ge1131ov4284 = (GE_ms("high_memory_compiler", 20));
	ge1131ov4285 = (GE_ms("il_verifiable", 13));
	ge1131ov4286 = (GE_ms("include", 7));
	ge1131ov4287 = (GE_ms("inlining", 8));
	ge1131ov4288 = (GE_ms("inlining_size", 13));
	ge1131ov4289 = (GE_ms("jumps_optimization", 18));
	ge1131ov4290 = (GE_ms("layout", 6));
	ge1131ov4291 = (GE_ms("layout_optimization", 19));
	ge1131ov4292 = (GE_ms("leaves_optimization", 19));
	ge1131ov4293 = (GE_ms("line_generation", 15));
	ge1131ov4294 = (GE_ms("link", 4));
	ge1131ov4295 = (GE_ms("linker", 6));
	ge1131ov4296 = (GE_ms("linux_fpu_double_precision", 26));
	ge1131ov4297 = (GE_ms("manifest_string_trace", 21));
	ge1131ov4298 = (GE_ms("map", 3));
	ge1131ov4299 = (GE_ms("metadata_cache_path", 19));
	ge1131ov4300 = (GE_ms("msil_assembly_compatibility", 27));
	ge1131ov4301 = (GE_ms("msil_clr_version", 16));
	ge1131ov4302 = (GE_ms("msil_generation", 15));
	ge1131ov4303 = (GE_ms("msil_generation_version", 23));
	ge1131ov4304 = (GE_ms("multithreaded", 13));
	ge1131ov4305 = (GE_ms("namespace", 9));
	ge1131ov4306 = (GE_ms("no_default_lib", 14));
	ge1131ov4307 = (GE_ms("override_cluster", 16));
	ge1131ov4308 = (GE_ms("portable_code_generation", 24));
	ge1131ov4309 = (GE_ms("precompiled", 11));
	ge1131ov4310 = (GE_ms("prefix", 6));
	ge1131ov4311 = (GE_ms("profile", 7));
	ge1131ov4312 = (GE_ms("public_key_token", 16));
	ge1131ov4313 = (GE_ms("read_only", 9));
	ge1131ov4314 = (GE_ms("recursive", 9));
	ge1131ov4315 = (GE_ms("reloads_optimization", 20));
	ge1131ov4316 = (GE_ms("shared_library_definition", 25));
	ge1131ov4317 = (GE_ms("split", 5));
	ge1131ov4318 = (GE_ms("stack_size", 10));
	ge1131ov4319 = (GE_ms("storable", 8));
	ge1131ov4320 = (GE_ms("storable_filename", 17));
	ge1131ov4321 = (GE_ms("strip", 5));
	ge1131ov4322 = (GE_ms("target", 6));
	ge1131ov4323 = (GE_ms("trace", 5));
	ge1131ov4324 = (GE_ms("use_cluster_name_as_namespace", 29));
	ge1131ov4325 = (GE_ms("use_full_cluster_name_as_namespace", 34));
	ge1131ov4326 = (GE_ms("verbose", 7));
	ge1131ov4327 = (GE_ms("version", 7));
	ge1131ov4328 = (GE_ms("visible_filename", 16));
	ge1131ov4329 = (GE_ms("warning", 7));
	ge1131ov4330 = (GE_ms("wedit", 5));
	ge111ov2953 = (GE_ms("\n", 1));
	ge1121ov6578 = (GE_ms("", 0));
	ge1127ov5354 = (GE_ms("", 0));
	ge1330ov6294 = (GE_ms("PE reference only allowed in DTD", 32));
	ge1330ov6256 = (GE_ms("< not allowed in attribute value", 32));
	ge1330ov6254 = (GE_ms("-- not allowed in comment", 25));
	ge1330ov6295 = (GE_ms("xml prefix reserved in processing instruction", 45));
	ge1330ov6267 = (GE_ms("Misformed XML Declaration", 25));
	ge1330ov6266 = (GE_ms("Misplaced markup declaration", 28));
	ge1330ov6277 = (GE_ms("End tag does not match start tag", 32));
	ge1330ov6271 = (GE_ms("Missing element end tag", 23));
	ge1330ov6270 = (GE_ms("Error in element content", 24));
	ge1330ov6269 = (GE_ms("Misformed start tag", 19));
	ge1330ov6275 = (GE_ms("Attribute declared twice", 24));
	ge1330ov6274 = (GE_ms("Misformed attribute in tag", 26));
	ge1330ov6276 = (GE_ms("Error in end tag", 16));
	ge1330ov6253 = (GE_ms("]]> not allowed in content", 26));
	ge1330ov6279 = (GE_ms("Error in XML declaration", 24));
	ge1330ov6288 = (GE_ms("Misformed element type declaration", 34));
	ge1333ov6018 = (GE_ms("*", 1));
	ge1333ov6016 = (GE_ms("+", 1));
	ge1333ov6017 = (GE_ms("\?", 1));
	ge1330ov6289 = (GE_ms("Misformed attribute list declaration", 36));
	ge1330ov6290 = (GE_ms("Misformed attribute definition declaration", 42));
	ge1330ov6293 = (GE_ms("Misformed conditional section", 29));
	ge1330ov6291 = (GE_ms("Misformed entity declaration", 28));
	ge1330ov6292 = (GE_ms("Misformed entity notation", 25));
	ge1330ov6286 = (GE_ms("Parser is not configured to support external DTDs", 49));
	ge1326ov8577 = (GE_ms("1.0", 3));
	ge1326ov8578 = (GE_ms("utf-8", 5));
	ge1330ov6259 = (GE_ms("unsupported character encoding", 30));
	ge1330ov6282 = (GE_ms("External reference in quoted value", 34));
	ge1330ov6302 = (GE_ms("Unexpected non-ASCII character in ASCII-only mode", 49));
	ge1330ov6303 = (GE_ms("Unexpected non-latin1 character in latin1-only mode", 51));
	ge1330ov6304 = (GE_ms("Invalid UTF8 character sequence", 31));
	ge1330ov6297 = (GE_ms("Name misformed", 14));
	ge1330ov6280 = (GE_ms("Literal entity expected in attribute", 36));
	ge1330ov6281 = (GE_ms("Entity is not defined", 21));
	ge1330ov6283 = (GE_ms("Entity cannot be recursively included", 37));
	ge1330ov6287 = (GE_ms("Undefined PE entity", 19));
	ge1328ov8866 = (GE_ms("us-ascii", 8));
	ge1328ov8868 = (GE_ms("utf-8", 5));
	ge1142ov2483 = (GE_ms("Library \'$1\' mounted with incompatible prefixes \'$2\' and \'$3\' in $4 and $5", 74));
	ge1139ov2483 = (GE_ms("found invalid expression \'$1\' at $2", 35));
	ge1133ov2483 = (GE_ms("attribute \'$2\' of element <$1> at $4 is obsolete, use element $3 instead", 72));
	ge1149ov2483 = (GE_ms("option name \'$1\' in option-element is unknown $2", 48));
	ge1146ov2483 = (GE_ms("<exclude> at $1 is obsolete, use \'if\'/\'unless\' attributes instead", 65));
	ge1148ov2483 = (GE_ms("found unknown element \'$2\' in element \'$1\' $3", 45));
	ge1145ov2483 = (GE_ms("<cluster> at $1 is obsolete. Specify options, clusters and mounts directly under <system> instead", 97));
	ge1141ov2483 = (GE_ms("element \'$1\' must have child-element \'$2\' $3", 44));
	ge1140ov2483 = (GE_ms("element \'$1\' must have attribute \'$2\' $3", 40));
	ge1152ov2483 = (GE_ms("Xace document must have a \'$1\' root-element $2", 46));
	ge1136ov2483 = (GE_ms("element <$1> at $3 is obsolete, use element $2 instead", 54));
	ge1147ov2483 = (GE_ms("attribute \'$2\' in element \'$1\' should have a positive integer value $4", 70));
	ge1151ov2483 = (GE_ms("attribute \'$2\' in element \'$1\' should have one of the following values: $4 $5", 77));
	ge1143ov2483 = (GE_ms("attribute \'$2\' in element \'$1\' should have a non-empty value $3", 63));
	ge1134ov2483 = (GE_ms("attribute \'$2\' in element \'$1\' should have a boolean value $4", 61));
	ge1144ov2483 = (GE_ms("\'$1\' is not an Xace file", 24));
	ge1178ov2483 = (GE_ms("$1", 2));
	ge1175ov2483 = (GE_ms("$0: cannot write to \'$1\'", 24));
	ge1174ov2483 = (GE_ms("$0: cannot read \'$1\'", 20));
	ge1184ov2483 = (GE_ms("usage: $0 $1", 12));
}

EIF_TYPE GE_types[368] = {
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
{0, 45, EIF_FALSE},
{0, 46, EIF_FALSE},
{0, 47, EIF_FALSE},
{0, 48, EIF_FALSE},
{0, 49, EIF_FALSE},
{0, 50, EIF_FALSE},
{0, 51, EIF_FALSE},
{0, 52, EIF_FALSE},
{0, 53, EIF_FALSE},
{0, 54, EIF_TRUE},
{0, 55, EIF_TRUE},
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
{0, 73, EIF_FALSE},
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
{0, 94, EIF_FALSE},
{0, 95, EIF_FALSE},
{0, 96, EIF_FALSE},
{0, 97, EIF_FALSE},
{0, 98, EIF_FALSE},
{0, 99, EIF_FALSE},
{0, 100, EIF_FALSE},
{0, 101, EIF_FALSE},
{0, 102, EIF_FALSE},
{0, 103, EIF_FALSE},
{0, 104, EIF_FALSE},
{0, 105, EIF_FALSE},
{0, 106, EIF_FALSE},
{0, 107, EIF_FALSE},
{0, 108, EIF_FALSE},
{0, 109, EIF_TRUE},
{0, 110, EIF_FALSE},
{0, 111, EIF_FALSE},
{0, 112, EIF_FALSE},
{0, 113, EIF_FALSE},
{0, 114, EIF_FALSE},
{0, 115, EIF_FALSE},
{0, 116, EIF_FALSE},
{0, 117, EIF_FALSE},
{0, 118, EIF_FALSE},
{0, 119, EIF_FALSE},
{0, 120, EIF_FALSE},
{0, 121, EIF_FALSE},
{0, 122, EIF_FALSE},
{0, 123, EIF_FALSE},
{0, 124, EIF_FALSE},
{0, 125, EIF_FALSE},
{0, 126, EIF_FALSE},
{0, 127, EIF_FALSE},
{0, 128, EIF_FALSE},
{0, 129, EIF_FALSE},
{0, 130, EIF_FALSE},
{0, 131, EIF_FALSE},
{0, 132, EIF_FALSE},
{0, 133, EIF_FALSE},
{0, 134, EIF_FALSE},
{0, 135, EIF_FALSE},
{0, 136, EIF_FALSE},
{0, 137, EIF_FALSE},
{0, 138, EIF_FALSE},
{0, 139, EIF_FALSE},
{0, 140, EIF_FALSE},
{0, 141, EIF_FALSE},
{0, 142, EIF_FALSE},
{0, 143, EIF_FALSE},
{0, 144, EIF_FALSE},
{0, 145, EIF_FALSE},
{0, 146, EIF_FALSE},
{0, 147, EIF_FALSE},
{0, 148, EIF_FALSE},
{0, 149, EIF_FALSE},
{0, 150, EIF_FALSE},
{0, 151, EIF_FALSE},
{0, 152, EIF_FALSE},
{0, 153, EIF_FALSE},
{0, 154, EIF_FALSE},
{0, 155, EIF_FALSE},
{0, 156, EIF_FALSE},
{0, 157, EIF_FALSE},
{0, 158, EIF_FALSE},
{0, 159, EIF_FALSE},
{0, 160, EIF_FALSE},
{0, 161, EIF_TRUE},
{0, 162, EIF_FALSE},
{0, 163, EIF_TRUE},
{0, 164, EIF_FALSE},
{0, 165, EIF_FALSE},
{0, 166, EIF_FALSE},
{0, 167, EIF_FALSE},
{0, 168, EIF_FALSE},
{0, 169, EIF_FALSE},
{0, 170, EIF_FALSE},
{0, 171, EIF_FALSE},
{0, 172, EIF_TRUE},
{0, 173, EIF_FALSE},
{0, 174, EIF_FALSE},
{0, 175, EIF_FALSE},
{0, 176, EIF_FALSE},
{0, 177, EIF_FALSE},
{0, 178, EIF_FALSE},
{0, 179, EIF_FALSE},
{0, 180, EIF_FALSE},
{0, 181, EIF_FALSE},
{0, 182, EIF_TRUE},
{0, 183, EIF_FALSE},
{0, 184, EIF_FALSE},
{0, 185, EIF_FALSE},
{0, 186, EIF_FALSE},
{0, 187, EIF_FALSE},
{0, 188, EIF_FALSE},
{0, 189, EIF_FALSE},
{0, 190, EIF_FALSE},
{0, 191, EIF_FALSE},
{0, 192, EIF_TRUE},
{0, 193, EIF_FALSE},
{0, 194, EIF_TRUE},
{0, 195, EIF_FALSE},
{0, 196, EIF_TRUE},
{0, 197, EIF_TRUE},
{0, 198, EIF_FALSE},
{0, 199, EIF_TRUE},
{0, 200, EIF_FALSE},
{0, 201, EIF_TRUE},
{0, 202, EIF_FALSE},
{0, 203, EIF_FALSE},
{0, 204, EIF_TRUE},
{0, 205, EIF_FALSE},
{0, 206, EIF_TRUE},
{0, 207, EIF_FALSE},
{0, 208, EIF_FALSE},
{0, 209, EIF_TRUE},
{0, 210, EIF_FALSE},
{0, 211, EIF_FALSE},
{0, 212, EIF_FALSE},
{0, 213, EIF_FALSE},
{0, 214, EIF_FALSE},
{0, 215, EIF_FALSE},
{0, 216, EIF_FALSE},
{0, 217, EIF_FALSE},
{0, 218, EIF_FALSE},
{0, 219, EIF_FALSE},
{0, 220, EIF_FALSE},
{0, 221, EIF_FALSE},
{0, 222, EIF_FALSE},
{0, 223, EIF_FALSE},
{0, 224, EIF_FALSE},
{0, 225, EIF_FALSE},
{0, 226, EIF_FALSE},
{0, 227, EIF_FALSE},
{0, 228, EIF_FALSE},
{0, 229, EIF_FALSE},
{0, 230, EIF_FALSE},
{0, 231, EIF_FALSE},
{0, 232, EIF_FALSE},
{0, 233, EIF_FALSE},
{0, 234, EIF_FALSE},
{0, 235, EIF_FALSE},
{0, 236, EIF_FALSE},
{0, 237, EIF_FALSE},
{0, 238, EIF_FALSE},
{0, 239, EIF_FALSE},
{0, 240, EIF_FALSE},
{0, 241, EIF_FALSE},
{0, 242, EIF_FALSE},
{0, 243, EIF_FALSE},
{0, 244, EIF_TRUE},
{0, 245, EIF_FALSE},
{0, 246, EIF_FALSE},
{0, 247, EIF_TRUE},
{0, 248, EIF_FALSE},
{0, 249, EIF_FALSE},
{0, 250, EIF_FALSE},
{0, 251, EIF_FALSE},
{0, 252, EIF_FALSE},
{0, 253, EIF_FALSE},
{0, 254, EIF_FALSE},
{0, 255, EIF_TRUE},
{0, 256, EIF_FALSE},
{0, 257, EIF_FALSE},
{0, 258, EIF_FALSE},
{0, 259, EIF_FALSE},
{0, 260, EIF_FALSE},
{0, 261, EIF_FALSE},
{0, 262, EIF_FALSE},
{0, 263, EIF_FALSE},
{0, 264, EIF_FALSE},
{0, 265, EIF_FALSE},
{0, 266, EIF_FALSE},
{0, 267, EIF_FALSE},
{0, 268, EIF_FALSE},
{0, 269, EIF_FALSE},
{0, 270, EIF_FALSE},
{0, 271, EIF_FALSE},
{0, 272, EIF_FALSE},
{0, 273, EIF_FALSE},
{0, 274, EIF_FALSE},
{0, 275, EIF_FALSE},
{0, 276, EIF_FALSE},
{0, 277, EIF_FALSE},
{0, 278, EIF_FALSE},
{0, 279, EIF_FALSE},
{0, 280, EIF_TRUE},
{0, 281, EIF_FALSE},
{0, 282, EIF_FALSE},
{0, 283, EIF_FALSE},
{0, 284, EIF_FALSE},
{0, 285, EIF_FALSE},
{0, 286, EIF_FALSE},
{0, 287, EIF_FALSE},
{0, 288, EIF_FALSE},
{0, 289, EIF_FALSE},
{0, 290, EIF_FALSE},
{0, 291, EIF_FALSE},
{0, 292, EIF_FALSE},
{0, 293, EIF_FALSE},
{0, 294, EIF_FALSE},
{0, 295, EIF_FALSE},
{0, 296, EIF_FALSE},
{0, 297, EIF_FALSE},
{0, 298, EIF_FALSE},
{0, 299, EIF_FALSE},
{0, 300, EIF_FALSE},
{0, 301, EIF_FALSE},
{0, 302, EIF_FALSE},
{0, 303, EIF_FALSE},
{0, 304, EIF_FALSE},
{0, 305, EIF_FALSE},
{0, 306, EIF_FALSE},
{0, 307, EIF_FALSE},
{0, 308, EIF_FALSE},
{0, 309, EIF_FALSE},
{0, 310, EIF_FALSE},
{0, 311, EIF_FALSE},
{0, 312, EIF_FALSE},
{0, 313, EIF_FALSE},
{0, 314, EIF_FALSE},
{0, 315, EIF_FALSE},
{0, 316, EIF_FALSE},
{0, 317, EIF_FALSE},
{0, 318, EIF_FALSE},
{0, 319, EIF_FALSE},
{0, 320, EIF_FALSE},
{0, 321, EIF_FALSE},
{0, 322, EIF_FALSE},
{0, 323, EIF_FALSE},
{0, 324, EIF_FALSE},
{0, 325, EIF_FALSE},
{0, 326, EIF_FALSE},
{0, 327, EIF_FALSE},
{0, 328, EIF_FALSE},
{0, 329, EIF_FALSE},
{0, 330, EIF_FALSE},
{0, 331, EIF_FALSE},
{0, 332, EIF_FALSE},
{0, 333, EIF_FALSE},
{0, 334, EIF_FALSE},
{0, 335, EIF_TRUE},
{0, 336, EIF_TRUE},
{0, 337, EIF_FALSE},
{0, 338, EIF_FALSE},
{0, 339, EIF_FALSE},
{0, 340, EIF_FALSE},
{0, 341, EIF_FALSE},
{0, 342, EIF_FALSE},
{0, 343, EIF_FALSE},
{0, 344, EIF_FALSE},
{0, 345, EIF_FALSE},
{0, 346, EIF_FALSE},
{0, 347, EIF_FALSE},
{0, 348, EIF_FALSE},
{0, 349, EIF_FALSE},
{0, 350, EIF_FALSE},
{0, 351, EIF_FALSE},
{0, 352, EIF_FALSE},
{0, 353, EIF_FALSE},
{0, 354, EIF_FALSE},
{0, 355, EIF_FALSE},
{0, 356, EIF_FALSE},
{0, 357, EIF_TRUE},
{0, 358, EIF_FALSE},
{0, 359, EIF_FALSE},
{0, 360, EIF_FALSE},
{0, 361, EIF_FALSE},
{0, 362, EIF_FALSE},
{0, 363, EIF_FALSE},
{0, 364, EIF_FALSE},
{0, 365, EIF_FALSE},
{0, 366, EIF_FALSE},
{0, 367, EIF_FALSE}
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
	if (amount != bound && ferror(f)) {
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
	return GE_ms(str, strlen(str));
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
	return GE_ms(str, strlen(str));
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
